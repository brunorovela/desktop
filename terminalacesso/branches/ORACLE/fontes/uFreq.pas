unit uFreq;

interface

uses
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, ZConnection;

type
   TRecFreq = class(TObject)
   private
      slDiarioTurmas: TStringList;
      slDiarioAulasAlunos: TStringList;
      slAulasSQL: TStringList;
      slBim: TStringList;
      procedure verDiarioAulasAlunos(const cd_pessoa, nr_anosemestre, nr_etapa: Integer; const cd_turma: String; const cd_disciplina, nr_aula: Integer );
   protected
     function getAulasSQL(sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer): string;
     function getAulasTotal(sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim: Integer): Integer;
     procedure AtualizaFreqAluno(iCodAluno: Integer; sTurma: string; iAnoSem: Integer; iDisc: Integer; iBim, qtd_faltas: Integer);
   public
     constructor Create();
     destructor Destroy; override;

     procedure verDiarioTurmas(sTurma: string; iAnoSem: Integer; iDisc: Integer; sCurso: string; iProf: Integer; iBim: Integer);
     procedure AjustarFrequencia(bForcar: Boolean; sFiltro: string);
     procedure AjustarFrequencia2(bForcar: Boolean; sFiltro: string; sLimite : string='100');
     procedure RecalcularFrequencia(iBimestre, nr_anosemestre: Integer);
   published

   end;

implementation

uses
   uDM, uProgresso, Main;

{ TRecFreq }

constructor TRecFreq.Create();
begin
  inherited Create();

  slDiarioTurmas := TStringList.Create();
  slDiarioAulasAlunos := TStringList.Create();
  slAulasSQL := TStringList.Create();
end;

procedure TRecFreq.verDiarioTurmas(sTurma: string; iAnoSem: Integer; iDisc: Integer; sCurso: string; iProf: Integer; iBim: Integer);
var
   z: Integer;
   sChave: string;
begin

   sChave := sTurma + ':' + IntToStr(iAnoSem) + ':' + IntToStr(iDisc) + ':' + sCurso + ':' + IntTostr(iProf) + ':' + IntToStr(iBim);

   if (slDiarioTurmas.IndexOf(sChave) = -1) then begin

      slDiarioTurmas.Add(sChave);

      DM.qyAux.SQL.Clear();
      DM.qyAux.SQL.Add( 'SELECT COUNT(*) as total FROM diario_turmas WHERE turma = :cd_turma AND anosemestre = :nr_anosemestre AND disciplina = :cd_disc AND bimestre = :nr_bimestre AND curso = :cd_curso' );
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
         DM.qyAux.SQL.Add('INSERT INTO diario_turmas (turma, anosemestre, disciplina, bimestre, professor, curso, sn_liberado) ');
         DM.qyAux.SQL.Add('VALUES                                                                                              ');
         DM.qyAux.SQL.Add('(:cd_turma, :nr_anosemestre, :cd_disc, :nr_bimestre, :cd_professor, :cd_curso, "N")                                  ');
         DM.qyAux.ParamByName('cd_turma').AsString := sTurma;
         DM.qyAux.ParamByName('nr_anosemestre').AsInteger := iAnoSem;
         DM.qyAux.ParamByName('cd_disc').AsInteger := iDisc;
         DM.qyAux.ParamByName('nr_bimestre').AsInteger := iBim;
         DM.qyAux.ParamByName('cd_curso').AsString := sCurso;
         DM.qyAux.ParamByName( 'cd_professor' ).AsInteger := iProf;
         DM.qyAux.ExecSQL;
      end;

   end;
end;

destructor TRecFreq.Destroy;
begin
   FreeAndNil(slDiarioTurmas);
   FreeAndNil(slDiarioAulasAlunos);
   FreeAndNil(slAulasSQL);
  inherited;
end;

procedure TRecFreq.verDiarioAulasAlunos(const cd_pessoa, nr_anosemestre,
  nr_etapa: Integer; const cd_turma: String; const cd_disciplina,
  nr_aula: Integer);
const
   SQL_TOTAL_DIARIO_AULAS_ALUNOS =
      ' SELECT COUNT(*) AS total ' +
      ' FROM diario_aulas_alunos ' +
      ' WHERE cd_pessoa = :cd_pessoa AND cd_turma = :cd_turma AND ' +
      '       nr_anosem = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND ' +
      '       cd_bimestre = :nr_etapa AND nr_aula = :nr_aula ';
   SQL_INSERIR_DIARIO_AULAS_ALUNOS =
      ' INSERT INTO diario_aulas_alunos (' +
      '    cd_pessoa, cd_turma, nr_anosem, cd_disciplina, cd_bimestre, nr_aula ' +
      ' ) VALUES ( ' +
      '    :cd_pessoa, :cd_turma, :nr_anosemestre, :cd_disciplina, :nr_etapa, :nr_aula ' +
      ' ) ';
var
   sChave: String;
begin
   sChave := IntToStr(cd_pessoa) + ':' + IntToStr(nr_anosemestre) + ':' +
             IntToStr(nr_etapa) + ':' + cd_turma + ':' + IntToStr(cd_disciplina) + ':' +
             IntToStr(nr_aula);

   if ( slDiarioAulasAlunos.IndexOf(sChave) = -1 ) then
   begin
      slDiarioAulasAlunos.Add(sChave);

      DM.qyAux.Close();
      DM.qyAux.SQL.Clear();
      DM.qyAux.SQL.Text := SQL_TOTAL_DIARIO_AULAS_ALUNOS;
      DM.qyAux.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      DM.qyAux.ParamByName('cd_turma').AsString := cd_turma;
      DM.qyAux.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      DM.qyAux.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      DM.qyAux.ParamByName('nr_etapa').AsInteger := nr_etapa;
      DM.qyAux.ParamByName('nr_aula').AsInteger := nr_aula;
      DM.qyAux.Open();

      if DM.qyAux.FieldByName('total').AsInteger = 0 then
      begin
         DM.qyAux.Close();
         DM.qyAux.SQL.Clear();
         DM.qyAux.SQL.Text := SQL_INSERIR_DIARIO_AULAS_ALUNOS;
         DM.qyAux.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
         DM.qyAux.ParamByName('cd_turma').AsString := cd_turma;
         DM.qyAux.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         DM.qyAux.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         DM.qyAux.ParamByName('nr_etapa').AsInteger := nr_etapa;
         DM.qyAux.ParamByName('nr_aula').AsInteger := nr_aula;
         DM.qyAux.ExecSQL;
      end;
   end;
end;

procedure TRecFreq.AjustarFrequencia(bForcar: Boolean; sFiltro: string);
var
   i: Integer;
   sFiltroParc: string;
   slBimestre, slAnosemestre: TStringList;
begin

   if not (slBim = nil) then begin
      FreeAndNil(slBim);
   end;

   slBim := TStringList.Create();
   slAnosemestre := TStringList.Create();
   slBimestre := TStringList.Create();

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
         sFiltroParc := '(f.situacao NOT IN (3,4,5,6,7,8) AND dlp.sn_atualizado = 0) AND ('+ sFiltroParc +') ';
      end else begin
         sFiltroParc := sFiltroParc + ' ';
      end;
      sFiltroParc := '(' + sFiltroParc + ')';
   end;
   
   with DM.qyAux2 do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT                                     ');
      SQL.Add('  dlp.dt_aula, da.anosemestre, da.bimestre ');
      SQL.Add('FROM                                       ');
      SQL.Add('  diario_lista_presenca dlp                                                                                       ');
      SQL.Add('  INNER JOIN fichaindividual f ON (dlp.cd_pessoa = f.codigoaluno) AND (dlp.nr_anosemestre = f.anosemestre) AND (dlp.cd_turma = f.turma) AND (dlp.cd_disciplina = f.disciplina) ');
      SQL.Add('  INNER JOIN diario_aulas da ON (dlp.cd_turma = da.turma) AND (dlp.nr_anosemestre = da.anosemestre) AND (dlp.cd_disciplina = da.disciplina) AND (dlp.dt_aula = da.data)        ');
      SQL.Add('WHERE                                      ');
      SQL.Add('   (' + sFiltroParc + ')                   ');
      SQL.Add('GROUP BY                                   ');
      SQL.Add('   dlp.dt_aula                             ');
      SQL.Add('ORDER BY                                   ');
      SQL.Add('   dlp.dt_aula                             ');
      try
         Open();
         FetchAll();
         First();
      except
         Mensagem('Filtro Incorreto!');
         Exit;
      end;
      while not Eof do begin
         sFiltroParc := '(dlp.dt_aula = "' + FormatDateTime('yyy-mm-dd 00:00:00', FieldByName('dt_aula').AsDateTime) + '")  AND ('+ sFiltro +') ';
         frmProg.SetText('Iniciando Data: '+FormatDateTime('dd/mm/yyyy', FieldByName('dt_aula').AsDateTime)+' ...');
         AjustarFrequencia2(bForcar, sFiltroParc);

         slAnosemestre.Add(FieldByName('anosemestre').AsString);
         slBimestre.Add(FieldByName('bimestre').AsString);

         Next();
      end;
      Close();
   end;
   frmProg.FechaBarra();

   //recalcula frequencia
   if ( DM.variavel_parametro('sn_atualiza_frequencia_automatico') = 'S' ) AND
      ( slBimestre.Count = slAnosemestre.Count ) then
   begin
      for I := 0 to slBimestre.Count - 1 do
      begin
         RecalcularFrequencia(StrToInt(slBimestre[I]), StrToInt(slAnosemestre[I]));
      end;         
   end;

   FreeAndNil( slBimestre );
   FreeAndNil( slAnosemestre );

   FreeAndNil(frmProg);
   slDiarioTurmas.Clear();
   slDiarioAulasAlunos.Clear();
   slAulasSQL.Clear();
end;

procedure TRecFreq.AjustarFrequencia2(bForcar: Boolean; sFiltro: string; sLimite : string= '100');
var
   slIns: TStringList;
   sChave, sChave2, sAux: string;
   sChaveTurmas, sChaveTurmas2: string;
   sFaltasAtual: string;
   i: Integer;
   bFinaliza: Boolean;
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
      sFiltro := '(f.situacao NOT IN (3,4,5,6,7,8) AND dlp.sn_atualizado = 0) AND ('+ sFiltro +') ';
   end
   else begin
      sFiltro := sFiltro + ' ';
   end;
   sFiltro := '(' + sFiltro + ')';


   //abre a lista de presença
   with DM.qyRecalculoFreq do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT                                                                                                            ');
      SQL.Add('  dlp.cd_pessoa, da.turma, da.anosemestre, da.disciplina, da.bimestre, da.nro_aula, da.qtd_aulas, dlp.dt_aula, f.curso, da.cd_professor, ');
      SQL.Add('  IF(dlp.sn_presente = "S","C","F")	as sn_presente,                                                               ');
      SQL.Add('  CONCAT_WS(":", da.turma, da.anosemestre, da.disciplina, da.bimestre, da.nro_aula) as chave_turma,                     ');
      SQL.Add('  CONCAT_WS(":", dlp.cd_pessoa, da.turma, da.anosemestre, da.disciplina, da.bimestre, da.nro_aula) as chave       ');
      SQL.Add('FROM                                                                                                              ');
      SQL.Add('  diario_lista_presenca dlp                                                                                       ');
      SQL.Add('  INNER JOIN fichaindividual f ON (dlp.cd_pessoa = f.codigoaluno) AND (dlp.nr_anosemestre = f.anosemestre) AND (dlp.cd_turma = f.turma) AND (dlp.cd_disciplina = f.disciplina) ');
      SQL.Add('  INNER JOIN diario_aulas da ON (dlp.cd_turma = da.turma) AND (dlp.nr_anosemestre = da.anosemestre) AND (dlp.cd_disciplina = da.disciplina) AND (dlp.dt_aula = da.data)        ');
      SQL.Add('WHERE                                                                                                             ');
      SQL.Add(  sFiltro );
      SQL.Add('ORDER BY                                                                                                          ');
      SQL.Add('   chave                                                                                                          ');
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
         sChave := FieldByName('cd_pessoa').AsString + ':' + FieldByName('anosemestre').AsString + ':' +
                   FieldByName('bimestre').AsString + ':' + FieldByName('turma').AsString + ':' + FieldByName('disciplina').AsString + ':' +
                   FieldByName('nro_aula').AsString;
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

      //aqui sim, atualiza diario_aulas_alunos e fichaindividual
      frmProg.SetAtual(1);
      frmProg.SetText('Gravando Faltas...');
      i := 1;
      sChaveTurmas2 := '';
      sChave2 := '';
      DM.qyRecalculoFreq.First;

      while not DM.qyRecalculoFreq.Eof do begin
         sChave := FieldByName('cd_pessoa').AsString + ':' + FieldByName('anosemestre').AsString + ':' +
                   FieldByName('bimestre').AsString + ':' + FieldByName('turma').AsString + ':' + FieldByName('disciplina').AsString + ':' +
                   FieldByName('nro_aula').AsString;
//         sChave := FieldByName('chave').AsString;
         sChaveTurmas := FieldByName('turma').AsString + ':' + FieldByName('anosemestre').AsString + ':' + FieldByName('disciplina').AsString + ':' + FieldByName('bimestre').AsString + ':' + FieldByName('nro_aula').AsString;
//         sChaveTurmas := FieldByName('chave_turma').AsString;

         if (sChaveTurmas <> sChaveTurmas2) then begin
            verDiarioTurmas(FieldByName('turma').AsString, FieldByName('anosemestre').AsInteger, FieldByName('disciplina').AsInteger, FieldByName('curso').AsString, FieldByName('cd_professor').AsInteger, FieldByName('bimestre').AsInteger);
            sChaveTurmas2 := sChaveTurmas;
         end;

         if (sChave <> sChave2) then begin
            verDiarioAulasAlunos(
               FieldByName('cd_pessoa').AsInteger, FieldByName('anosemestre').AsInteger,
               FieldByName('bimestre').AsInteger, FieldByName('turma').AsString,
               FieldByName('disciplina').AsInteger, FieldByName('nro_aula').AsInteger
            );
            sChave2 := sChave;
         end;

         //se ja tem o registro no stringlist ou nao
         if ((slIns.Values[sChave] = 'N') and (FieldByName('nro_aula').AsInteger < 99)) then begin

            sAux := FillString(slIns.Values[sChave + '.Faltas'], alRight, 'C', FieldByName('qtd_aulas').AsInteger, False);
            sAux := Copy(sAux, 1, FieldByName('qtd_aulas').AsInteger);
            
            //atualiza diario_aulas_alunos
            DM.qyAux.Close;
            DM.qyAux.SQL.Clear;
            DM.qyAux.SQL.Add(' UPDATE diario_aulas_alunos ');
            DM.qyAux.SQL.Add(' SET ds_freq = :ds_freq ');
            DM.qyAux.SQL.Add(' WHERE cd_pessoa = :cd_pessoa AND cd_turma = :cd_turma AND ');
            DM.qyAux.SQL.Add('       nr_anosem = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND ');
            DM.qyAux.SQL.Add('       cd_bimestre = :nr_etapa AND nr_aula = :nr_aula ');
            DM.qyAux.ParamByName('ds_freq').AsString           := sAux;
            DM.qyAux.ParamByName('cd_pessoa').AsInteger        := FieldByName('cd_pessoa').AsInteger;
            DM.qyAux.ParamByName('nr_anosemestre').AsInteger   := FieldByName('anosemestre').AsInteger;
            DM.qyAux.ParamByName('cd_turma').AsString          := FieldByName('turma').AsString;
            DM.qyAux.ParamByName('cd_disciplina').AsInteger    := FieldByName('disciplina').AsInteger;
            DM.qyAux.ParamByName('nr_etapa').AsInteger         := FieldByName('bimestre').AsInteger;
            DM.qyAux.ParamByName('nr_aula').AsInteger          := FieldByName('nro_aula').AsInteger;
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

   //autualiza diario_lista_presenca
   DM.qyAux.Close();
   DM.qyAux.SQL.Clear();
   DM.qyAux.SQL.Add('UPDATE                                                                                                                                                                                                                                                         ');
   DM.qyAux.SQL.Add('	diario_lista_presenca dlp                                                                                                                                                      ');
   DM.qyAux.SQL.Add('   INNER JOIN fichaindividual f ON (dlp.cd_pessoa = f.codigoaluno) AND (dlp.nr_anosemestre = f.anosemestre) AND (dlp.cd_turma = f.turma) AND (dlp.cd_disciplina = f.disciplina)   ');
   DM.qyAux.SQL.Add('   INNER JOIN diario_aulas da ON (dlp.cd_turma = da.turma) AND (dlp.nr_anosemestre = da.anosemestre) AND (dlp.cd_disciplina = da.disciplina) AND (dlp.dt_aula = da.data)          ');
   DM.qyAux.SQL.Add('SET                                                                                                                                                                                                                                                            ');
   DM.qyAux.SQL.Add('	dlp.sn_atualizado = 1, dlp.sn_imp_diario = "S" ');
   DM.qyAux.SQL.Add('WHERE                                                                                                             ');
   DM.qyAux.SQL.Add(  sFiltro );
   DM.qyAux.ExecSQL();

   frmProg.SetAtual(2);

   if (bFinaliza) then begin
      frmProg.FechaBarra();
      FreeAndNil(frmProg);
   end;
   //finalmente, o fim!

end;

function TRecFreq.getAulasSQL(sTurma: string; iAnoSem, iDisc, iBim: Integer): string;
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
            sSQL := sSQL + sGlue + ' IFNULL(dm.freq'+FieldByName('nro_aula').AsString + ', "") ';
            sGlue := ', ';
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
  iBim, qtd_faltas: Integer);
var
   iTotalAulas: Integer;
begin
   with DM.qyAux do begin
      iTotalAulas := getAulasTotal(sTurma, iAnoSem, iDisc, iBim);

      //atualiza fichaindividual
      Close();
      SQL.Clear();
      SQL.Add('UPDATE fichaindividual SET falta'+IntToStr(iBim)+' = :faltas, frequencia = (100 - ROUND(('+IntToStr(qtd_faltas)+' / '+ IntToStr(iTotalAulas) +')*100)) WHERE codigoaluno = :cd_aluno AND turma = :cd_turma AND anosemestre = :nr_anosemestre AND disciplina = :cd_disc AND sn_bloq_freq'+IntToStr(iBim)+' = 0');
      ParamByName('faltas').AsInteger := qtd_faltas;
      ParamByName('cd_aluno').AsInteger := iCodAluno;
      ParamByName('nr_anosemestre').AsInteger := iAnoSem;
      ParamByName('cd_turma').AsString := sTurma;
      ParamByName('cd_disc').AsInteger := iDisc;
      ExecSQL();
   end;
end;


procedure TRecFreq.RecalcularFrequencia(iBimestre, nr_anosemestre: Integer);
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

   with DM.qyRecalculoFreq do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT                        ');
      SQL.Add('   cd_pessoa, nr_anosem AS anosemestre, cd_turma AS turma, cd_disciplina AS disciplina, cd_bimestre AS bimestre, ');
      SQL.Add('   COALESCE(LENGTH(GROUP_CONCAT(ds_freq))-LENGTH(REPLACE(UPPER(GROUP_CONCAT(ds_freq)), ''F'', '''')), 0) AS faltas ');
      SQL.Add('FROM                          ');
      SQL.Add('	diario_aulas_alunos       ');
      SQL.Add('WHERE                         ');
      SQL.Add('   nr_anosem = :nr_anosemestre AND cd_bimestre = :nr_etapa ');
      SQL.Add('GROUP BY                      ');
      SQL.Add('	nr_anosem, cd_turma, cd_disciplina, cd_bimestre, cd_pessoa ');
      SQL.Add('ORDER BY                      ');
      SQL.Add('	nr_anosem, cd_turma, cd_disciplina, cd_bimestre, cd_pessoa ');

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('nr_etapa').AsInteger := iBimestre;

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

      while not Eof do begin
         AtualizaFreqAluno(FieldByName('cd_pessoa').AsInteger, FieldByName('turma').AsString,
                           FieldByName('anosemestre').AsInteger, FieldByName('disciplina').AsInteger,
                           FieldByName('bimestre').AsInteger, FieldByName('faltas').AsInteger);
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


