unit uFuncoesGerais;

interface

uses DB, ZConnection, uDM, Dialogs, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Windows, Classes, SysUtils;

// Verificar se o aluno já cursou essa disciplina, na grade ou em forma de equivalência...
Function CursouDisciplina(CodAluno : Integer; Curso : String; Disciplina : Integer; Etapa : Integer) : Boolean;

// Verifica se existe algum conflito de horário
Function VerificaConflitoHorario(CodAluno: Integer; AnoSem: Integer; Turma: String; Disciplina: Integer): TStringList;

Function VerificaPreRequisitos(CodAluno: Integer; Curso: String; Disciplina: Integer; Etapa : Integer; Grade : Integer): TStringList;
Function VerificaPreRequisitosEspeciais(CodAluno: Integer; Curso: String; Disciplina: Integer; Grade: Integer; Anosemestre: Integer; serieTurma: Integer; serieAluno: integer = -1): TStringList;

// Retorna o código da forma de ingresso, conforme o código padrão: 1 = Matricula; 2 = Rematrícula
Function GetFormaIngresso(CodPadrao : Integer) : Integer;

implementation

Function CursouDisciplina(CodAluno : Integer; Curso : String; Disciplina : Integer; Etapa : Integer) : Boolean;
Begin
   DM.qrySelectEqui.Close;
   DM.qrySelectEqui.ParamByName('CD_ALUNO').AsInteger := CodAluno;
   DM.qrySelectEqui.ParamByName('CD_CURSO').AsString := Curso;
   DM.qrySelectEqui.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;
   DM.qrySelectEqui.ParamByName('ETAPA').AsInteger := Etapa;
   DM.qrySelectEqui.Open;
   Result := DM.qrySelectEquiRESULTADO.AsString = 'EQUI';
   DM.qrySelectEqui.Close;
end;

Function VerificaPreRequisitos(CodAluno: Integer; Curso: String; Disciplina: Integer; Etapa : Integer; Grade : Integer): TStringList;
var
   qyConsulta : TUMZQuery;
   slLista: TStringList;
   sRet: String;
begin
   slLista := TStringList.Create();
   DM.CriarConsulta(qyConsulta);

   qyConsulta.SQL.Text := ''+
   'SELECT                 '+
   '   descricao,cd_discipli_pre  '+
   'FROM                   '+
   '   disciplinas_prereq dp '+
   '   INNER JOIN disciplinas d ON (d.codigo = dp.cd_discipli_pre AND d.curso = dp.cd_curso) '+
   'WHERE                  '+
   '   cd_curso = :curso AND cd_discipli = :disciplina  '+
   '   AND cd_grade = :grade  ' + 
   '';
   qyConsulta.ParamByName('curso').AsString := Curso;
   qyConsulta.ParamByName('disciplina').AsInteger := Disciplina;
   qyConsulta.ParamByName('grade').AsInteger := Grade;
   qyConsulta.Open();

   while not qyConsulta.Eof do begin
      //verifica se o cara cursou
      if not (CursouDisciplina(CodAluno, Curso, qyConsulta.FieldByName('cd_discipli_pre').AsInteger, Etapa)) then begin
         sRet := qyConsulta.FieldByName('descricao').AsString + ' - [' + qyConsulta.FieldByName('cd_discipli_pre').AsString+ ']';
         slLista.Add(sRet);
      end;
      qyConsulta.Next();
   end;
   qyConsulta.Close();

   Result := slLista;
end;

Function VerificaPreRequisitosEspeciais(CodAluno: Integer; Curso: String; Disciplina: Integer; Grade : Integer; Anosemestre: Integer; serieTurma: integer; serieAluno: integer): TStringList;
const
   SQL_BUSCA_VALOR_GRADE =
      ' SELECT '+
      '    g.NR_PERC_MAX_REPROVACAO, '+
      '    gd.NR_SERIE '+
      ' FROM '+
      '    grades g '+
      ' INNER JOIN grades_disciplinas gd ON ( '+
      '    gd.CD_CURSO = g.CD_CURSO '+
      '    AND gd.CD_GRADE = g.CD_GRADE '+
      ' )   '+
      ' WHERE '+
	   '    g.CD_CURSO = :cd_curso '+
	   '    AND g.CD_GRADE = :cd_grade '+
	   '    AND gd.CD_DISCIPLINA = :cd_disciplina ';
var
   sSql: String;
   qyConsulta, qyAux: TUMZQuery;
   slLista: TStringList;
   qyBuscaValorGrade: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyConsulta);
   DM.CriarConsulta(qyAux);
   DM.CriarConsulta(qyBuscaValorGrade);

   slLista := TStringList.Create;

   qyBuscaValorGrade.SQL.Text := SQL_BUSCA_VALOR_GRADE;
   qyBuscaValorGrade.ParamByName('cd_curso').AsString := Curso;
   qyBuscaValorGrade.ParamByName('cd_grade').AsInteger := Grade;
   qyBuscaValorGrade.ParamByName('cd_disciplina').AsInteger := Disciplina;
   qyBuscaValorGrade.Open;

   if serieAluno <> -1  then
   begin
      if qyBuscaValorGrade.FieldByName('NR_PERC_MAX_REPROVACAO').AsInteger > 0 then
      begin
        if (DM.getPorcentagemReprovacaoAluno(CodAluno, Curso) > qyBuscaValorGrade.FieldByName('NR_PERC_MAX_REPROVACAO').AsInteger) and
           (qyBuscaValorGrade.FieldByName('nr_serie').AsInteger >= serieAluno) then
        begin
           slLista.Add('Aluno ultrapassou os '+qyBuscaValorGrade.FieldByName('NR_PERC_MAX_REPROVACAO').AsString+'% máximo de disciplinas reprovadas no curso');
        end;
      end;
   end;

   with qyConsulta do
   begin
      Close;
      SQL.Clear;
      SQL.Text := ' SELECT dtr.ds_tipo_req, dtr.me_tipo_sql ' +
                  ' FROM disciplinas_prereq_especial dpe ' +
                  '      INNER JOIN disciplinas_tipos_req dtr ON (dtr.cd_tipo_req = dpe.cd_tipo_req) ' +
                  ' WHERE ' +
                  '      dpe.cd_curso = :cd_curso AND dpe.cd_grade = :cd_grade AND dpe.cd_disciplina = :cd_disciplina ';

      ParamByName('cd_curso').AsString := Curso;
      ParamByName('cd_grade').AsInteger := Grade;
      ParamByName('cd_disciplina').AsInteger := Disciplina;
      Open;
   end;

   while not qyConsulta.Eof do
   begin
      with qyAux do
      begin
         sSql := '';
         Close;
         SQL.Clear;
         sSql := qyConsulta.FieldByName('me_tipo_sql').AsString;

         sSql := StringReplace(sSql, '[$cd_curso$]', '''' + Curso + '''', [rfReplaceAll, rfIgnoreCase]);
         sSql := StringReplace(sSql, '[$cd_grade$]', IntToStr(Grade), [rfReplaceAll, rfIgnoreCase]);
         sSql := StringReplace(sSql, '[$cd_disciplina$]', IntToStr(Disciplina), [rfReplaceAll, rfIgnoreCase]);
         sSql := StringReplace(sSql, '[$cd_pessoa$]', IntToStr(CodAluno), [rfReplaceAll, rfIgnoreCase]);
         sSql := StringReplace(sSql, '[$nr_anosem$]', IntToStr(Anosemestre), [rfReplaceAll, rfIgnoreCase]);
         sSql := StringReplace(sSql, '[$nr_serie$]', IntToStr(serieTurma), [rfReplaceAll, rfIgnoreCase]);

         SQL.Text := sSql;
         Open;

         if (RecordCount > 0) then
            slLista.Add(qyConsulta.FieldByName('ds_tipo_req').AsString);         
      end;

      qyConsulta.Next;
   end;
   Result := slLista;
end;

Function VerificaConflitoHorario(CodAluno: Integer; AnoSem: Integer; Turma: String; Disciplina: Integer): TStringList;
var
   qyConsulta : TUMZQuery;
   slLista: TStringList;
   sRet: String;
begin
   slLista := TStringList.Create();
   DM.CriarConsulta(qyConsulta);

   qyConsulta.SQL.Text := ''+
   'SELECT                            '+
   '	th.dia_semana, th_n.dia_semana, th.disciplina, d.descricao, '+
   '  DATE_FORMAT(h.hr_inicio,''%H:%i'') as inicio, DATE_FORMAT(h.hr_fim,''%H:%i'') as fim '+
   'FROM                              '+
   '	fichaindividual fi           '+
   '	INNER JOIN turmas_horarios th ON (th.anosemestre = fi.anosemestre AND th.turma = fi.turma AND th.disciplina = fi.disciplina) '+
   '	INNER JOIN turmas_horarios th_n ON (th_n.anosemestre = fi.anosemestre AND th_n.cd_horario = th.cd_horario AND th.dia_semana = th_n.dia_semana) '+
   '	INNER JOIN disciplinas d ON (d.curso = fi.curso AND d.codigo = fi.disciplina) '+
   '	INNER JOIN horarios h ON (h.codigo = th.cd_horario) ' +
   'WHERE fi.situacao not in (3,4,5,6,7,8) AND  '+
   '	fi.codigoaluno = :codaluno  '+
   '	AND fi.anosemestre = :anosem  '+
   '	AND th_n.turma = :turma_nova  '+
   '	AND th_n.disciplina = :disc_nova '+
   '  AND th.disciplina <> th_n.disciplina '+
   ' GROUP BY '+
   '  th.cd_horario, th.dia_semana, th_n.cd_horario, th_n.dia_semana, th.disciplina, th_n.disciplina, fi.anosemestre, h.hr_inicio, h.hr_fim '+
   ' ORDER BY descricao,th.cd_horario ';
   qyConsulta.ParamByName('codaluno').AsInteger := CodAluno;
   qyConsulta.ParamByName('anosem').AsInteger := AnoSem;
   qyConsulta.ParamByName('turma_nova').AsString := Turma;
   qyConsulta.ParamByName('disc_nova').AsInteger := Disciplina;
   qyConsulta.Open();
   while not qyConsulta.Eof do begin
      sRet := 'Dia Semana: '+ gaDiasSemana[qyConsulta.FieldByName('dia_semana').AsInteger]  +' Horário: ' + qyConsulta.FieldByName('inicio').AsString;
      sRet := sRet + ' até ' + qyConsulta.FieldByName('fim').AsString;
      sRet := sRet + ' - Disciplina: ' + qyConsulta.FieldByName('descricao').AsString + ' (' + qyConsulta.FieldByName('disciplina').AsString + ')';
      slLista.Add(sRet);
      qyConsulta.Next();
   end;
   qyConsulta.Close();
   Result := slLista;
end;



Function GetFormaIngresso(CodPadrao : Integer) : Integer;
Var
   qyConsulta : TUMZQuery;
Begin

   DM.CriarConsulta(qyConsulta);
   qyConsulta.SQL.Text := ' SELECT cd_ingresso FROM matriculas_ingresso ' +
    ' WHERE cd_padrao = ''' + IntToStr(CodPadrao) + ''' ';
   qyConsulta.Open();

   Result := qyConsulta.FieldByName('cd_ingresso').AsInteger;

   FreeAndNil(qyConsulta);

   Exit;

end;

end.
