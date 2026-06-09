unit uFreq;

interface

uses
  General, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, DBTables;

type
   TRecFreq = class(TObject)
   private
      slDiarioTurmas: TStringList;
      slDiarioMatriculas: TStringList;
      slAulasSQL: TStringList;
      slBim: TStringList;
   protected
     function getAulasSQL(sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer): string;
     function getAulasTotal(sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer): Integer;
     procedure AtualizaFreqAluno(iCodAluno: Integer; sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer; vl_hora_aula: Double; cd_grupo: Integer);
   public
     constructor Create();
     destructor Destroy; override;

     procedure verDiarioTurmas(sTurma: string; iAnoSem: Integer; iDisc: Integer; sCurso: string; iProf: Integer; iBim: Integer; iCdGrupo: Integer);
     procedure verDiarioMatriculas(iCodAluno: Integer; sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer);
     procedure AjustarFrequencia(bForcar: Boolean; sFiltro: string);
     procedure AjustarFrequencia2(bForcar: Boolean; sFiltro: string; sLimite : string='100');
     procedure RecalcularFrequencia(iBimestre: Integer; sFiltro: string);

     class procedure CalcularFrequenciaAluno(const nr_anosemestre, cd_bimestre: Integer;
         const cd_turma: String; const cd_pessoa: Integer; const cd_disciplina: Integer = -1);
   published

   end;

implementation

uses
   uDM, uProgresso, Main, UZDataset;

{ TRecFreq }

class procedure TRecFreq.CalcularFrequenciaAluno(const nr_anosemestre,
  cd_bimestre: Integer; const cd_turma: String; const cd_pessoa,
  cd_disciplina: Integer);
var
   qyCalcularFrequenciaAluno: TUMZQuery;
begin
   DM.CriarConsulta(qyCalcularFrequenciaAluno);

   qyCalcularFrequenciaAluno.SQL.Clear();
   qyCalcularFrequenciaAluno.SQL.Add('UPDATE fichaindividual');
   qyCalcularFrequenciaAluno.SQL.Add('SET falta' + IntToStr(cd_bimestre) + ' = GET_FALTAS(codigoaluno, anosemestre, turma, disciplina, ' + IntToStr(cd_bimestre) + '),');
   qyCalcularFrequenciaAluno.SQL.Add('    totalfaltas = (COALESCE(falta1,0)+COALESCE(falta2,0)+COALESCE(falta3,0)+COALESCE(falta4,0)+COALESCE(falta5,0)+');
   qyCalcularFrequenciaAluno.SQL.Add('                  COALESCE(falta6,0)+COALESCE(falta7,0)+COALESCE(falta8,0)+COALESCE(falta9,0)+COALESCE(falta10,0))');
   qyCalcularFrequenciaAluno.SQL.Add('WHERE anosemestre = :nr_anosemestre AND');
   qyCalcularFrequenciaAluno.SQL.Add('      turma = :cd_turma');

   qyCalcularFrequenciaAluno.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyCalcularFrequenciaAluno.ParamByName('cd_turma').AsString := cd_turma;

   if cd_pessoa <> -1 then
   begin
      qyCalcularFrequenciaAluno.SQL.Add('AND codigoaluno = :cd_pessoa');
      qyCalcularFrequenciaAluno.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   end;

   if cd_disciplina <> -1 then
   begin
      qyCalcularFrequenciaAluno.SQL.Add('AND disciplina = :cd_disciplina');
      qyCalcularFrequenciaAluno.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   end;

   qyCalcularFrequenciaAluno.ExecSQL();

   FreeAndNil(qyCalcularFrequenciaAluno);
end;

constructor TRecFreq.Create();
begin
  inherited Create();

  slDiarioTurmas := TStringList.Create();
  slDiarioMatriculas := TStringList.Create();
  slAulasSQL := TStringList.Create();
end;

procedure TRecFreq.verDiarioTurmas(sTurma: string; iAnoSem: Integer; iDisc: Integer; sCurso: string; iProf: Integer; iBim: Integer; iCdGrupo: Integer);
var
   z: Integer;
   sChave: string;
begin

   sChave := sTurma + ':' + IntToStr(iAnoSem) + ':' + IntToStr(iDisc) + ':' + sCurso + ':' + IntTostr(iProf) + ':' + IntToStr(iBim);

   if (slDiarioTurmas.IndexOf(sChave) = -1) then begin

      slDiarioTurmas.Add(sChave);

      DM.qyAux.SQL.Clear();
      DM.qyAux.SQL.Add( 'SELECT COUNT(*) as total FROM diario_turmas WHERE turma = :cd_turma AND anosemestre = :nr_anosemestre AND disciplina = :cd_disc AND bimestre = :nr_bimestre AND curso = :cd_curso' );
      if iCdGrupo > 0 then
      begin
         DM.qyAux.SQL.Add(' AND cd_grupo = ' + IntToStr(iCdGrupo));
      end;
      DM.qyAux.ParamByName('cd_turma').AsString := sTurma;
      DM.qyAux.ParamByName('nr_anosemestre').AsInteger := iAnoSem;
      DM.qyAux.ParamByName('cd_disc').AsInteger := iDisc;
      DM.qyAux.ParamByName('nr_bimestre').AsInteger := iBim;
      DM.qyAux.ParamByName('cd_curso').AsString := sCurso;

      DM.qyAux.Open();
      z := Trunc(DM.qyAux.FieldByName('total').AsFloat);
      if (z = 0) then begin
         //insere diario_turmas
         DM.qyAux.Close();
         DM.qyAux.SQL.Clear();

         DM.qyAux.Close;
         DM.qyAux.SQL.Clear;
         DM.qyAux.SQL.Add('INSERT INTO diario_turmas (turma, anosemestre, disciplina, bimestre, professor, curso, cd_grupo, sn_liberado) ');
         DM.qyAux.SQL.Add('VALUES                                                                                              ');
         DM.qyAux.SQL.Add('(:cd_turma, :nr_anosemestre, :cd_disc, :nr_bimestre, :cd_professor, :cd_curso, :cd_grupo, "N")                                  ');
         DM.qyAux.ParamByName('cd_turma').AsString := sTurma;
         DM.qyAux.ParamByName('nr_anosemestre').AsInteger := iAnoSem;
         DM.qyAux.ParamByName('cd_disc').AsInteger := iDisc;
         DM.qyAux.ParamByName('nr_bimestre').AsInteger := iBim;
         DM.qyAux.ParamByName('cd_curso').AsString := sCurso;
         DM.qyAux.ParamByName('cd_professor').AsInteger := iProf;
         if iCdGrupo > 0 then
         begin
            DM.qyAux.ParamByName('cd_grupo').AsInteger := iCdGrupo;
         end else begin
            DM.qyAux.ParamByName('cd_grupo').Clear;
         end;
         DM.qyAux.ExecSQL;
      end;

   end;
end;

destructor TRecFreq.Destroy;
begin
   FreeAndNil(slDiarioTurmas);
   FreeAndNil(slDiarioMatriculas);
   FreeAndNil(slAulasSQL);
  inherited;
end;


procedure TRecFreq.verDiarioMatriculas(iCodAluno: Integer; sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer);
var
   z: Integer;
   sChave: string;
begin

   sChave := IntToStr(iCodAluno) + ':' + sTurma + ':' + IntToStr(iAnoSem) + ':' + IntToStr(iDisc) + ':' + IntToStr(iBim);

   if (slDiarioMatriculas.IndexOf(sChave) = -1) then begin

      slDiarioMatriculas.Add(sChave);

      //////////////////////////////
      //verifica diario_matriculas
      DM.qyAux.Close();
      DM.qyAux.SQL.Clear();
      DM.qyAux.SQL.Add( 'SELECT COUNT(*) as total');
      DM.qyAux.SQL.Add( 'FROM FICHAINDIVIDUAL FI' );
      DM.qyAux.SQL.Add( '     INNER JOIN DIARIO_TURMAS DT ON (' );
      DM.qyAux.SQL.Add( '        DT.ANOSEMESTRE = FI.ANOSEMESTRE AND DT.CURSO = FI.CURSO AND DT.TURMA = FI.TURMA AND' );
      DM.qyAux.SQL.Add( '        DT.DISCIPLINA = FI.DISCIPLINA' );
      DM.qyAux.SQL.Add( '     )' );
      DM.qyAux.SQL.Add( 'WHERE FI.CODIGOALUNO = :cd_aluno AND FI.TURMA = :cd_turma AND FI.ANOSEMESTRE = :nr_anosemestre AND' );
      DM.qyAux.SQL.Add( '      FI.DISCIPLINA = :cd_disc AND DT.BIMESTRE = :nr_bimestre' );
      DM.qyAux.ParamByName('cd_aluno').AsInteger := iCodAluno;
      DM.qyAux.ParamByName('nr_anosemestre').AsInteger := iAnoSem;
      DM.qyAux.ParamByName('cd_turma').AsString := sTurma;
      DM.qyAux.ParamByName('cd_disc').AsInteger := iDisc;
      DM.qyAux.ParamByName('nr_bimestre').AsInteger := iBim;
      DM.qyAux.Open();
      z := Trunc(DM.qyAux.FieldByName('total').AsFloat);

      if (z = 0) then begin
         //insere diario_matriculas
         DM.qyAux.Close();
         DM.qyAux.SQL.Clear();

         DM.qyAux.Close;
         DM.qyAux.SQL.Clear;
         DM.qyAux.SQL.Add('INSERT INTO diario_matriculas (codaluno, turma, anosemestre, disciplina, bimestre) ');
         DM.qyAux.SQL.Add('VALUES                                                                                              ');
         DM.qyAux.SQL.Add('(:cd_aluno, :cd_turma, :nr_anosemestre, :cd_disc, :nr_bimestre)                                  ');
         DM.qyAux.ParamByName('cd_aluno').AsInteger := iCodAluno;
         DM.qyAux.ParamByName('nr_anosemestre').AsInteger := iAnoSem;
         DM.qyAux.ParamByName('cd_turma').AsString := sTurma;
         DM.qyAux.ParamByName('cd_disc').AsInteger := iDisc;
         DM.qyAux.ParamByName('nr_bimestre').AsInteger := iBim;
         DM.qyAux.ExecSQL;
      end;
   end;
end;


procedure TRecFreq.AjustarFrequencia(bForcar: Boolean; sFiltro: string);
var
   i: Integer;
   sFiltroParc: string;
begin

   if not (slBim = nil) then begin
      FreeAndNil(slBim);
   end;

   slBim := TStringList.Create();

   //carrega progressbar
   Application.CreateForm(TfrmProg, frmProg);
   frmProg.NovaBarra('Cálculo de Frequencia!');
   frmProg.SetMin(1);
   frmProg.SetMax(2);
   frmProg.SetAtual(1);

   if (Length(Trim(sFiltro)) <> 0) then begin
      frmProg.SetText('Iniciando...');
      //verifica os filtros
      sFiltroParc := sFiltro;
      if not (bForcar) then begin
         if Length(sFiltroParc) = 0 then sFiltroParc := '1 = 1';
         sFiltroParc := '(F.SITUACAO NOT IN (3,4,5,6,7,8) AND DLP.SN_ATUALIZADO = 0) AND ('+ sFiltroParc +') ';
      end
      else begin
         sFiltroParc := sFiltroParc + ' ';
      end;
      sFiltroParc := '(' + sFiltroParc + ')';
   end;
   
   with DM.qyAux2 do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT                        ');
      SQL.Add('  DISTINCT dlp.dt_aula        ');
      SQL.Add('FROM                          ');
      SQL.Add('  diario_lista_presenca dlp                                                                                       ');
      SQL.Add('  INNER JOIN fichaindividual f ON (dlp.cd_pessoa = f.codigoaluno) AND (dlp.nr_anosemestre = f.anosemestre) AND (dlp.cd_turma = f.turma) AND (dlp.cd_disciplina = f.disciplina) ');
      SQL.Add('  INNER JOIN diario_aulas da ON (dlp.cd_turma = da.turma) AND (dlp.nr_anosemestre = da.anosemestre) AND (dlp.cd_disciplina = da.disciplina) AND (dlp.dt_aula = da.data)        ');
      SQL.Add('WHERE                         ');
      SQL.Add('   (' + sFiltroParc + ')      ');
      SQL.Add('GROUP BY                      ');
      SQL.Add('   dlp.dt_aula                ');
      SQL.Add('ORDER BY                      ');
      SQL.Add('   dlp.dt_aula                ');
      try
         Open();
         FetchAll();
         First();
      except
         Mensagem('Filtro Incorreto!');
         Exit;
      end;
      while not Eof do begin
         sFiltroParc := '(DATE_FORMAT(DLP.DT_AULA, ''%Y-%m-%d 00:00:00'') = ''' + FormatDateTime('yyyy-mm-dd 00:00:00', FieldByName('DT_AULA').AsDateTime) + ''')  AND ('+ sFiltro +') ';
         frmProg.SetText('Iniciando Data: '+FormatDateTime('dd/mm/yyyy', FieldByName('DT_AULA').AsDateTime)+' ...');
         AjustarFrequencia2(bForcar, sFiltroParc);
         Next();
      end;
      Close();
   end;
   frmProg.FechaBarra();

   //recalcula frequencia
   if(DM.variavel_parametro('sn_atualiza_frequencia_automatico') = 'S')then
   begin
      for i := 0 to slBim.Count-1 do begin
         sFiltro := 'DM.ANOSEMESTRE = ' + slBim.Names[i];
         RecalcularFrequencia(StrToINt(slBim.ValueFromIndex[i]), sFiltro);
      end;
   end;

   FreeAndNil(frmProg);
   slDiarioTurmas.Clear();
   slDiarioMatriculas.Clear();
   slAulasSQL.Clear();
end;

procedure TRecFreq.AjustarFrequencia2(bForcar: Boolean; sFiltro: string; sLimite : string= '100');
const
   SQL_SELECT_ORACLE =
      'SELECT '+
         'DLP.CD_PESSOA,'+
         'DA.TURMA,'+
         'DA.ANOSEMESTRE,'+
         'DA.DISCIPLINA,'+
         'DA.BIMESTRE,'+
         'DA.NRO_AULA,'+
         'DA.QTD_AULAS,'+
         'DA.CD_GRUPO,'+
         'DLP.DT_AULA,'+
         'F.CURSO,'+
         'DA.CD_PROFESSOR,'+
         '(CASE WHEN DLP.SN_PRESENTE = ''S'' THEN ''C'' ELSE CASE WHEN DLP.SN_PRESENTE = ''D'' THEN ''-'' ELSE ''F'' END END) SN_PRESENTE,'+
         'DA.TURMA || '':'' || DA.ANOSEMESTRE || '':'' || DA.DISCIPLINA || '':'' || DA.BIMESTRE || '':'' || DA.NRO_AULA CHAVE_TURMA,'+
         'DLP.CD_PESSOA || '':'' || DA.TURMA || '':'' || DA.ANOSEMESTRE || '':'' || DA.DISCIPLINA || '':'' || DA.BIMESTRE || '':'' || DA.NRO_AULA CHAVE '+
      'FROM '+
         'DIARIO_LISTA_PRESENCA DLP '+
            'JOIN FICHAINDIVIDUAL F ON '+
               '(DLP.CD_PESSOA = F.CODIGOALUNO) AND '+
               '(DLP.NR_ANOSEMESTRE = F.ANOSEMESTRE) AND '+
               '(DLP.CD_TURMA = F.TURMA) AND '+
               '(DLP.CD_DISCIPLINA = F.DISCIPLINA) '+
            'JOIN DIARIO_AULAS DA ON '+
               '(DLP.CD_TURMA = DA.TURMA) AND '+
               '(DLP.NR_ANOSEMESTRE = DA.ANOSEMESTRE) AND '+
               '(DLP.CD_DISCIPLINA = DA.DISCIPLINA) AND '+
               '(DLP.DT_AULA = DA.DATA) '+
      'WHERE '+
         '%s '+
      'ORDER BY '+
         'CHAVE';

   SQL_SELECT_MYSQL =
      'SELECT '+
         'DLP.CD_PESSOA,'+
         'DA.TURMA,'+
         'DA.ANOSEMESTRE,'+
         'DA.DISCIPLINA,'+
         'DA.BIMESTRE,'+
         'DA.NRO_AULA,'+
         'DA.QTD_AULAS,'+
         'DA.CD_GRUPO,'+
         'DLP.DT_AULA,'+
         'F.CURSO,'+
         'DA.CD_PROFESSOR,'+
         '(CASE WHEN DLP.SN_PRESENTE = ''S'' THEN ''C'' ELSE CASE WHEN DLP.SN_PRESENTE = ''D'' THEN ''-'' ELSE ''F'' END END) SN_PRESENTE,'+
         'CONCAT_WS('':'', DA.TURMA, DA.ANOSEMESTRE, DA.DISCIPLINA, DA.BIMESTRE, DA.NRO_AULA) CHAVE_TURMA,'+
         'CONCAT_WS('':'', DLP.CD_PESSOA, DA.TURMA, DA.ANOSEMESTRE, DA.DISCIPLINA, DA.BIMESTRE, DA.NRO_AULA) CHAVE '+
      'FROM '+
         'DIARIO_LISTA_PRESENCA DLP '+
            'JOIN FICHAINDIVIDUAL F ON '+
               '(DLP.CD_PESSOA = F.CODIGOALUNO) AND '+
               '(DLP.NR_ANOSEMESTRE = F.ANOSEMESTRE) AND '+
               '(DLP.CD_TURMA = F.TURMA) AND '+
               '(DLP.CD_DISCIPLINA = F.DISCIPLINA) '+
            'JOIN DIARIO_AULAS DA ON '+
               '(DLP.CD_TURMA = DA.TURMA) AND '+
               '(DLP.NR_ANOSEMESTRE = DA.ANOSEMESTRE) AND '+
               '(DLP.CD_DISCIPLINA = DA.DISCIPLINA) AND '+
               '(DLP.DT_AULA = DA.DATA) '+
            'JOIN HORARIOS H ON('+
            '	H.CODIGO = DLP.CD_HORARIO'+
            ') '+
      'WHERE '+
         '%s '+
      'ORDER BY '+
         'H.DS_HORARIO';

   function GetSelectByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := SQL_SELECT_ORACLE
      else
         Result := SQL_SELECT_MYSQL;
   end;
var
   slIns: TStringList;
   sChave, sChave2, sAux: string;
   sChaveTurmas, sChaveTurmas2: string;
   sFaltasAtual: string;
   i: Integer;
   bFinaliza: Boolean;
   nTentativas : Integer;
begin
   bFinaliza := False;
   //carrega progressbar
   if (frmProg = nil) then begin
      Application.CreateForm(TfrmProg, frmProg);
      frmProg.NovaBarra('Cálculo de Frequencia!');
      frmProg.SetText('Calculando o numero de itens a serem processados...');
      frmProg.SetMin(1);
      frmProg.SetMax(2);
      frmProg.SetAtual(1);
      bFinaliza := True;
   end;

   slIns := TStringList.Create();

   //verifica os filtros
   if not (bForcar) then begin
      if Length(sFiltro) = 0 then sFiltro := '1 = 1';
      sFiltro := '(F.SITUACAO NOT IN (3,4,5,6,7,8) AND DLP.SN_ATUALIZADO = 0) AND ('+ sFiltro +') ';
   end
   else begin
      sFiltro := sFiltro + ' ';
   end;
   sFiltro := '(' + sFiltro + ')';


   //abre a lista de presença
   with DM.qyRecalculoFreq do begin
      Close();
      SQL.Text := Format(GetSelectByProtocol, [sFiltro]);

      try
         Open();
         FetchAll();
         First();
      except
         Mensagem('Filtro Incorreto!');
         Exit;
      end;

      if IsEmpty then begin
         Exit;
      end;

      //carrega o temporizador
      frmProg.SetMin(1);
      frmProg.SetMax(RecordCount);
      frmProg.SetAtual(1);
      frmProg.SetText('Analisando as Faltas...');

      i := 1;
      //preenche o stringlist com dados
      while not DM.qyRecalculoFreq.Eof do begin
         sChave := FieldByName('cd_pessoa').AsString + ':' + FieldByName('turma').AsString + ':' + FieldByName('anosemestre').AsString + ':' + FieldByName('disciplina').AsString + ':' + FieldByName('bimestre').AsString + ':' + FieldByName('nro_aula').AsString + ':' + FieldByName('cd_grupo').AsString;
//         sChave := FieldByName('chave').AsString;
         //verifica se tem no stringlist
         if (slIns.IndexOfName(sChave) = -1) then begin
            slIns.Add(sChave + '=N');
            slIns.Add(sChave + '.Faltas=');
         end;

         //adiciona bimestre/anosemestre para recalcular
         if not (slBim = nil) then begin
            if slBim.IndexOf(FieldByName('anosemestre').AsString + '=' + FieldByName('bimestre').AsString) = -1 then begin
               slBim.Add(FieldByName('anosemestre').AsString + '=' + FieldByName('bimestre').AsString);
            end;
         end;

         //computa as faltas
         sFaltasAtual := slIns.Values[sChave + '.Faltas'];
         slIns.Values[sChave + '.Faltas'] := sFaltasAtual + FieldByName('sn_presente').AsString;

         Inc(i);
         frmProg.SetAtual(i);
         frmProg.SetText('Analisando os Registros: ' + Format('%4.0d de %4.0d', [frmProg.getAtual(), frmProg.getMax()]));
         Next();
      end; //eof 1 recalculo frquencia (preenche stringlist)

      //aqui sim, atualiza diario_matriculas e fichaindividual
      frmProg.SetAtual(1);
      frmProg.SetText('Gravando Faltas...');
      i := 1;
      sChaveTurmas2 := '';
      sChave2 := '';
      DM.qyRecalculoFreq.First;

      while not DM.qyRecalculoFreq.Eof do begin
         sChave := FieldByName('cd_pessoa').AsString + ':' + FieldByName('turma').AsString + ':' + FieldByName('anosemestre').AsString + ':' + FieldByName('disciplina').AsString + ':' + FieldByName('bimestre').AsString + ':' + FieldByName('nro_aula').AsString + ':' + FieldByName('cd_grupo').AsString;
//         sChave := FieldByName('chave').AsString;
         sChaveTurmas := FieldByName('turma').AsString + ':' + FieldByName('anosemestre').AsString + ':' + FieldByName('disciplina').AsString + ':' + FieldByName('bimestre').AsString + ':' + FieldByName('nro_aula').AsString + ':' + FieldByName('cd_grupo').AsString;
//         sChaveTurmas := FieldByName('chave_turma').AsString;

         if (sChaveTurmas <> sChaveTurmas2) then begin
            verDiarioTurmas(FieldByName('turma').AsString, FieldByName('anosemestre').AsInteger, FieldByName('disciplina').AsInteger, FieldByName('curso').AsString, FieldByName('cd_professor').AsInteger, FieldByName('bimestre').AsInteger, FieldByName('cd_grupo').AsInteger);
            sChaveTurmas2 := sChaveTurmas;
         end;

         if (sChave <> sChave2) then begin
            { DEPRECIADO
            verDiarioMatriculas(FieldByName('cd_pessoa').AsInteger, FieldByName('turma').AsString, FieldByName('anosemestre').AsInteger, FieldByName('disciplina').AsInteger, FieldByName('bimestre').AsInteger);
            }
            sChave2 := sChave;
         end;

         //se ja tem o registro no stringlist ou nao
         if ((slIns.Values[sChave] = 'N') and (FieldByName('nro_aula').AsInteger < 99)) then begin

            sAux := FillString(slIns.Values[sChave + '.Faltas'], alRight, 'C', FieldByName('qtd_aulas').AsInteger, False);
            sAux := Copy(sAux, 1, FieldByName('qtd_aulas').AsInteger);
            
            //atualiza DIARIO_AULAS_ALUNOS
            DM.qyAux.Close;
            DM.qyAux.SQL.Clear;

            if ( DM.ExisteRegistro( 'DIARIO_AULAS_ALUNOS',
                                    [  'CD_PESSOA', 'CD_TURMA',
                                       'NR_AULA', 'NR_ANOSEM',
                                       'CD_DISCIPLINA', 'CD_BIMESTRE'],
                                    [  FieldByName('cd_pessoa').Value, FieldByName('turma').Value,
                                       FieldByName('nro_aula').AsString, FieldByName('anosemestre').Value,
                                       FieldByName('disciplina').Value, FieldByName('bimestre').Value] ) ) then
            begin
               DM.qyAux.SQL.Add('UPDATE DIARIO_AULAS_ALUNOS SET  ');
               DM.qyAux.SQL.Add('   DS_FREQ = :estado  ');
               DM.qyAux.SQL.Add('WHERE CD_PESSOA = :cd_aluno AND CD_TURMA = :cd_turma AND NR_AULA = :nr_aula AND');
               DM.qyAux.SQL.Add('      NR_ANOSEM = :nr_anosemestre AND CD_DISCIPLINA = :cd_disc AND CD_BIMESTRE = :nr_bimestre');
            end else begin
               DM.qyAux.SQL.Add('INSERT INTO DIARIO_AULAS_ALUNOS (  ');
               DM.qyAux.SQL.Add('   CD_PESSOA, CD_TURMA, NR_AULA, NR_ANOSEM, CD_DISCIPLINA, CD_BIMESTRE, DS_FREQ  ');
               DM.qyAux.SQL.Add(') VALUES (');
               DM.qyAux.SQL.Add('   :cd_aluno, :cd_turma, :nr_aula, :nr_anosemestre, :cd_disc, :nr_bimestre, :estado ');
               DM.qyAux.SQL.Add(')');
            end;

            DM.qyAux.ParamByName('estado').AsString := sAux;
            DM.qyAux.ParamByName('cd_aluno').AsInteger := FieldByName('cd_pessoa').AsInteger;
            DM.qyAux.ParamByName('nr_anosemestre').AsInteger := FieldByName('anosemestre').AsInteger;
            DM.qyAux.ParamByName('nr_aula').AsInteger := FieldByName('nro_aula').AsInteger;
            DM.qyAux.ParamByName('cd_turma').AsString := FieldByName('turma').AsString;
            DM.qyAux.ParamByName('cd_disc').AsInteger := FieldByName('disciplina').AsInteger;
            DM.qyAux.ParamByName('nr_bimestre').AsInteger := FieldByName('bimestre').AsInteger;
            DM.qyAux.ExecSQL();

            slIns.Values[sChave] := 'S';
         end;
         Inc(i);
         frmProg.SetAtual(i);
         frmProg.SetText('Gravando Faltas e Presenças: ' + Format('%4.0d de %4.0d', [frmProg.getAtual(), frmProg.getMax()]));
         Next();
      end; //while not eof qyrecalculofrq (atuliza tabelas)
   end; //with qyRecalculoFreq

   FreeAndNil(slIns);

   frmProg.SetAtual(1);
   frmProg.SetMax(2);
   frmProg.SetText('Finalizando o processo...');

   frmProg.SetAtual(2);

   if (bFinaliza) then begin
      frmProg.FechaBarra();
      FreeAndNil(frmProg);
   end;
   //finalmente, o fim!

end;

function TRecFreq.getAulasSQL(sTurma: string; iAnoSem, iDisc, iBim: Integer): string;

   function GetGlueByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := '||'
      else
         Result := ',';
   end;
var
   sChave: string;
   sSQL, sGlue: string;
   z: Integer;
begin
   if (slAulasSQL = nil) then begin
      slAulasSQL := TStringList.Create();
   end;
   sChave := sTurma + ':' + IntToStr(iAnoSem) + ':' + IntToStr(iDisc) + ':' + IntToStr(iBim);

   if (slAulasSQL.IndexOfName(sChave) = -1) then begin
      with DM.qyAux do begin
         Close();
         SQL.Clear();
         SQL.Add('SELECT                        ');
         SQL.Add('	nro_aula                   ');
         SQL.Add('FROM                          ');
         SQL.Add('	diario_aulas               ');
         SQL.Add('WHERE                         ');
         SQL.Add('	anosemestre = :anosem      ');
         SQL.Add('	AND turma = :turma         ');
         SQL.Add('	AND disciplina = :disc     ');
         SQL.Add('	AND bimestre = :bim        ');
         SQL.Add('ORDER BY                      ');
         SQL.Add('	nro_aula                   ');
         ParamByName('anosem').AsInteger := iAnoSem;
         ParamByName('turma').AsString := sTurma;
         ParamByName('disc').AsInteger := iDisc;
         ParamByName('bim').AsInteger := iBim;
         Open();
         sSQL := '';
         sGlue := '';
         z := 0;
         while not Eof do begin
            sSQL := sSQL + sGlue + ' COALESCE(DM.FREQ'+FieldByName('nro_aula').AsString + ', '''') ';
            sGlue := GetGlueByProtocol;
            Inc(z);
            Next();
         end;
         Close();
         slAulasSQL.Add(sChave+'='+sSQL);
         slAulasSQL.Add(sChave+'.N='+IntToStr(z));
      end;
   end;

   Result := slAulasSQL.Values[sChave];
end;

function TRecFreq.getAulasTotal(sTurma: string; iAnoSem, iDisc,
  iBim: Integer): Integer;
var
   sChave: string;
   sAux: string;
begin
   if (slAulasSQL = nil) then begin
      slAulasSQL := TStringList.Create();
   end;
   sChave := sTurma + ':' + IntToStr(iAnoSem) + ':' + IntToStr(iDisc) + ':' + IntToStr(iBim);

   if (slAulasSQL.IndexOfName(sChave) = -1) then begin
      sAux:= getAulasSQL(sTurma, iAnoSem, iDisc, iBim);
   end;

   sAux := slAulasSQL.Values[sChave+'.N'];
   if (Length(sAux) > 0) then begin
      Result := StrToInt(sAux);
   end
   else begin
      Result := 0;
   end;
end;


procedure TRecFreq.AtualizaFreqAluno(iCodAluno: Integer; sTurma: string; iAnoSem, iDisc,
  iBim: Integer; vl_hora_aula: Double; cd_grupo: Integer);
var
   iTotalAulas: Integer;
   fFaltas : Double;
   sFaltas: string;
   i: Integer;
begin
   with DM.qyAux do
   begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT                        ');
      SQL.Add('   REPLACE(GROUP_CONCAT( DAA.DS_FREQ ),'','','''') AS FALTAS ');
      SQL.Add('FROM                          ');
      SQL.Add('	DIARIO_AULAS DA            ');
      SQL.Add('   INNER JOIN DIARIO_AULAS_ALUNOS DAA ON ( ');
      SQL.Add('      DAA.NR_ANOSEM = DA.ANOSEMESTRE AND DAA.CD_TURMA = DA.TURMA AND ');
      SQL.Add('      DAA.CD_DISCIPLINA = DA.DISCIPLINA AND DAA.CD_BIMESTRE = DA.BIMESTRE AND ');
      SQL.Add('      DAA.NR_AULA = DA.NRO_AULA ');
      SQL.Add('   ) ');
      SQL.Add('WHERE                         ');
      SQL.Add('	DA.ANOSEMESTRE = :anosem      ');
      SQL.Add('	AND DA.TURMA = :turma         ');
      SQL.Add('	AND DA.DISCIPLINA = :disc     ');
      SQL.Add('	AND DA.BIMESTRE = :bim        ');
      SQL.Add('	AND DAA.CD_PESSOA = :aluno    ');

      ParamByName('anosem').AsInteger := iAnoSem;
      ParamByName('turma').AsString := sTurma;
      ParamByName('disc').AsInteger := iDisc;
      ParamByName('bim').AsInteger := iBim;
      ParamByName('aluno').AsInteger := iCodAluno;

      if cd_grupo > 0 then
      begin
         SQL.Add('	AND da.CD_GRUPO = :cd_grupo   ');
         ParamByName('cd_grupo').AsInteger := cd_grupo;
      end;
      Open();

      fFaltas := 0;
      sFaltas := Trim(FieldByName('FALTAS').AsString);
      Close();

      for i := 1 to Length(sFaltas) do
      begin
         if (sFaltas[i] = 'F') then
         begin
            // Inc(fFaltas); # Quando foi alterado para Double, o Compilador não permitiu mais usar Inc()
            fFaltas := fFaltas + 1;
         end;
      end;

      fFaltas := fFaltas * vl_hora_aula;

      //atualiza diario matriculas
      // DIARIO_MATRICULAS NÃO EXISTE MAIS, SQL IGNORADO POIS AS FALTAS ESTÃO SENDO SALVAS NO SQL ABAIXO
//      Close();
//      SQL.Clear();
//      SQL.Add( 'UPDATE diario_matriculas SET faltas = :faltas WHERE codaluno = :cd_aluno AND turma = :cd_turma AND anosemestre = :nr_anosemestre AND disciplina = :cd_disc AND bimestre = :nr_bimestre');
//      ParamByName('faltas').AsInteger := iFaltas;
//      ParamByName('cd_aluno').AsInteger := iCodAluno;
//      ParamByName('nr_anosemestre').AsInteger := iAnoSem;
//      ParamByName('cd_turma').AsString := sTurma;
//      ParamByName('cd_disc').AsInteger := iDisc;
//      ParamByName('nr_bimestre').AsInteger := iBim;
//      ExecSQL();

      iTotalAulas := getAulasTotal(sTurma, iAnoSem, iDisc, iBim);
                // OLIVER!
      //atualiza fichaindividual
      Close();
      SQL.Clear();
      SQL.Add('UPDATE fichaindividual SET falta'+IntToStr(iBim)+' = :faltas, frequencia = (100 - ROUND(('+FloatToStr(fFaltas)+' / '+ IntToStr(iTotalAulas) +')*100)) WHERE codigoaluno = :cd_aluno AND turma = :cd_turma AND anosemestre = :nr_anosemestre AND disciplina = :cd_disc AND sn_bloq_freq'+IntToStr(iBim)+' = 0');
      ParamByName('faltas').AsFloat := fFaltas;
      ParamByName('cd_aluno').AsInteger := iCodAluno;
      ParamByName('nr_anosemestre').AsInteger := iAnoSem;
      ParamByName('cd_turma').AsString := sTurma;
      ParamByName('cd_disc').AsInteger := iDisc;
      ExecSQL();
   end;
end;


procedure TRecFreq.RecalcularFrequencia(iBimestre: Integer; sFiltro: string);
var
   i: Integer;
   bFinaliza: Boolean;
begin
   bFinaliza := False;
   //carrega progressbar
   if (frmProg = nil) then begin
      Application.CreateForm(TfrmProg, frmProg);
      frmProg.NovaBarra('Cálculo de Frequencia!');
      bFinaliza := True;
   end;
   frmProg.SetMin(1);
   frmProg.SetMax(2);
   frmProg.SetAtual(1);

   //verifica os filtros
   if Length(sFiltro) = 0 then sFiltro := '1 = 1';
   sFiltro := '(DT.BIMESTRE = '+IntToStr(iBimestre)+') AND '+ sFiltro +' ';
   sFiltro := '(' + sFiltro + ')';
   // OLIVER!
   with DM.qyRecalculoFreq do
   begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT DISTINCT                                                   ');
      SQL.Add('   DM.CODIGOALUNO AS CD_PESSOA, DM.ANOSEMESTRE, DM.TURMA, DM.DISCIPLINA, DT.BIMESTRE, COALESCE( APM.VL_HORA_AULA, 1 ) AS VL_HORA_AULA, DT.CD_GRUPO ');
      SQL.Add('FROM                                                              ');
      SQL.Add('	FICHAINDIVIDUAL DM                                             ');
      SQL.Add('   INNER JOIN TURMAS T ON (                                       ');
      SQL.Add('      T.CODIGO = DM.TURMA AND T.ANOSEMESTRE = DM.ANOSEMESTRE      ');
      SQL.Add('   )                                                              ');
      SQL.Add('	INNER JOIN DIARIO_TURMAS DT ON (                               ');
      SQL.Add('	   DT.ANOSEMESTRE = DM.ANOSEMESTRE AND DT.CURSO = DM.CURSO AND ');
      SQL.Add('	   DT.TURMA = DM.TURMA AND DT.DISCIPLINA = DM.DISCIPLINA       ');
      SQL.Add('	)                                                              ');
      SQL.Add('   INNER JOIN grades_disciplinas gd ON (gd.cd_disciplina = DM.disciplina AND gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade) ');
      SQL.Add('   INNER JOIN avaliacoes_parametros_matriz apm ON (apm.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) ');
      SQL.Add('WHERE                                                             ');
      SQL.Add(    sFiltro );
      SQL.Add('ORDER BY                                                          ');
      SQL.Add('	DM.ANOSEMESTRE, DM.TURMA, DM.DISCIPLINA, DT.BIMESTRE           ');
      try
         Open();
         FetchAll();
         First();
      except
         Mensagem('Filtro Incorreto!');
         Exit;
      end;

      if IsEmpty then begin
         Exit;
      end;

      frmProg.SetMax(RecordCount);
      frmProg.SetAtual(1);
      frmProg.SetText('Calculando a frequência final...');
      i := 1;

      while not Eof do
      begin
         AtualizaFreqAluno(FieldByName('cd_pessoa').AsInteger,
            FieldByName('turma').AsString, FieldByName('anosemestre').AsInteger,
            FieldByName('disciplina').AsInteger, FieldByName('bimestre').AsInteger,
            FieldByName('vl_hora_aula').AsFloat, FieldByName('cd_grupo').AsInteger);

         Inc(i);
         frmProg.SetAtual(i);
         frmProg.SetText('Calculando a frequência: ' + Format('%4.0d de %4.0d', [frmProg.getAtual(), frmProg.getMax()]));
         Next();
      end;
      Close();
   end;
   if (bFinaliza) then begin
      frmProg.FechaBarra();
      FreeAndNil(frmProg);
   end;
end;

end.
