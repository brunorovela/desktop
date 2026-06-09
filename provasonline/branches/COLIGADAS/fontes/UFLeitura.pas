unit UFLeitura;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ToolWin, ComCtrls, ImgList, ExtCtrls, StdCtrls, Mask, Grids, DBGrids,
   DB, ZAbstractRODataset, UZDataset, DBCtrls, Spin, Buttons, ZDbcIntfs, Math,
   UZDbcFuncs, UOpticalReader, DBClient, Midas;

type
   TSummaryType = (stImport, stOverride);

   TfLeitura = class(TForm)
      tlbOpcoes: TToolBar;
      ilBotoes: TImageList;
      btnSep1: TToolButton;
      btnExecutar: TToolButton;
      btnSep2: TToolButton;
      btnFechar: TToolButton;
      btnSep3: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      odlgGabarto: TOpenDialog;
      pnlOpcoes: TPanel;
      lblConfigTit: TLabel;
      bvlSep3: TBevel;
      pnlConfig: TPanel;
      lblTamPessoa: TLabel;
      lblTamCartao: TLabel;
      speTamPessoa: TSpinEdit;
      speTamCartao: TSpinEdit;
      bvlSep4: TBevel;
      lblArquivosTit: TLabel;
      bvlSep5: TBevel;
      pnlArquivos: TPanel;
      lbArquivos: TListBox;
      bvlSep6: TBevel;
      sbAdicionar: TSpeedButton;
      sbExcluir: TSpeedButton;
      sbLimpar: TSpeedButton;
      chkSobreescrever: TCheckBox;
      bvlSep7: TBevel;
      pnlImport: TPanel;
      pnlProgresso: TPanel;
      pnlProgTodo: TPanel;
      pnlProgResp: TPanel;
      lblProgGabaritos: TLabel;
      prbGabaritos: TProgressBar;
      bvlSep8: TBevel;
      lblProgResp: TLabel;
      bvlSep9: TBevel;
      prbRespostas: TProgressBar;
      pnlResumo: TPanel;
      lblResumoTit: TLabel;
      bvlSep10: TBevel;
      dsResumo: TDataSource;
      cdsResumo: TClientDataSet;
      cdsResumoCD_PROVA: TIntegerField;
      cdsResumoNR_IMPORTADOS: TIntegerField;
      cdsResumoNR_SOBREESCRITOS: TIntegerField;
      cdsResumoNR_ERROS: TIntegerField;
      dbgResumo: TDBGrid;
      bvlSep11: TBevel;
      pnlErros: TPanel;
      lblErrosTit: TLabel;
      bvlSep12: TBevel;
      dbgErros: TDBGrid;
      dsErros: TDataSource;
      cdsErros: TClientDataSet;
      cdsErrosCD_PESSOA: TIntegerField;
      cdsErrosDS_ERRO: TStringField;
      cdsErrosCD_PROVA: TIntegerField;
      cdsErrosNR_QUESTAO: TIntegerField;
      procedure FormDestroy(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure dsResumoDataChange(Sender: TObject; Field: TField);
      procedure btnExecutarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure sbLimparClick(Sender: TObject);
      procedure sbExcluirClick(Sender: TObject);
      procedure sbAdicionarClick(Sender: TObject);
   private
      function CreateNewReader: TOpticalReaderLC2000;
      function GetData: TStringList;
      function GetCardIdLength: Integer;
      function GetCustomIdLength: Integer;
      procedure AppendError(const Test, Person, Question: Integer;
         const Error: string);
      procedure AppendSummary(const Code: Integer;
         const SummaryType: TSummaryType);
      procedure DoImport;
      procedure LoadConfig;
      procedure SaveConfig;
      procedure UpdateBills(const Test, Person, Id: Integer);
      procedure WriteLog(const Log: string);
   end;

var
   fLeitura: TfLeitura;

implementation

uses
   UDM;

{$R *.dfm}

{ TfLeitura }

procedure TfLeitura.AppendError(const Test, Person, Question: Integer;
  const Error: string);
begin
   if cdsResumo.Locate('CD_PROVA', Test, []) then
   begin
      cdsResumo.Edit;
      cdsResumoNR_ERROS.AsInteger := cdsResumoNR_ERROS.AsInteger + 1;
   end
   else
   begin
      cdsResumo.Append;
      cdsResumoCD_PROVA.AsInteger := Test;
      cdsResumoNR_IMPORTADOS.AsInteger := 0;
      cdsResumoNR_SOBREESCRITOS.AsInteger := 0;
      cdsResumoNR_ERROS.AsInteger := 1;
   end;
   cdsResumo.Post;
   
   cdsErros.Append;
   cdsErrosCD_PESSOA.AsInteger := Person;
   cdsErrosCD_PROVA.AsInteger := Test;
   cdsErrosNR_QUESTAO.AsInteger := Question;
   cdsErrosDS_ERRO.AsString := Error;
   cdsErros.Post;
end;

procedure TfLeitura.AppendSummary(const Code: Integer;
  const SummaryType: TSummaryType);
begin
   if cdsResumo.Locate('CD_PROVA', Code, []) then
   begin
      cdsResumo.Edit;
      case SummaryType of
         stImport:
            cdsResumoNR_IMPORTADOS.AsInteger := cdsResumoNR_IMPORTADOS.AsInteger + 1;
         stOverride:
            cdsResumoNR_SOBREESCRITOS.AsInteger := cdsResumoNR_SOBREESCRITOS.AsInteger + 1;
      end;
      cdsResumo.Post;
   end
   else
   begin
      cdsResumo.Append;
      cdsResumoCD_PROVA.AsInteger := Code;
      cdsResumoNR_IMPORTADOS.AsInteger := 0;
      cdsResumoNR_SOBREESCRITOS.AsInteger := 0;
      cdsResumoNR_ERROS.AsInteger := 0;
      case SummaryType of
         stImport:
            cdsResumoNR_IMPORTADOS.AsInteger := 1;
         stOverride:
            cdsResumoNR_SOBREESCRITOS.AsInteger := 1;
      end;
      cdsResumo.Post;
   end;
end;

procedure TfLeitura.btnExecutarClick(Sender: TObject);
const
   SQuestCaption = 'Confirmação';
   SInfoCaption = 'Informação';
   SInfoFinished = 'A importação dos gabaritos foi finalizada com sucesso';
   SQuestImport = 'Deseja realmente realizar a importação dos gabaritos selecionados?';
   SQuestOverride = 'A opção para sobreescrever gabaritos já importados está habilitada. Deseja continuar mesmo assim?';
begin
   if MessageBox(Handle, PChar(SQuestImport), PChar(SQuestCaption),
      MB_ICONQUESTION or MB_YESNO) = ID_YES then
   begin
      if (not chkSobreescrever.Checked) or
         (MessageBox(Handle, PChar(SQuestOverride), PChar(SQuestCaption),
         MB_ICONQUESTION or MB_YESNO) = ID_YES) then
      begin
         try
            cdsErros.EmptyDataSet;
            cdsResumo.EmptyDataSet;
            Application.ProcessMessages;
            DoImport;
            MessageBox(Handle, PChar(SInfoFinished), PChar(SInfoCaption),
               MB_ICONINFORMATION or MB_OK);
            Application.ProcessMessages;
         except
            on E: Exception do raise;
         end;
      end;
   end;
end;

procedure TfLeitura.btnFecharClick(Sender: TObject);
begin
   Close;
end;

function TfLeitura.CreateNewReader: TOpticalReaderLC2000;
begin
   Result :=
      TOpticalReaderLC2000.Create(GetCustomIdLength, GetCardIdLength, GetData);
end;

procedure TfLeitura.DoImport;
const
   SSQLFinalize =
      'UPDATE POL_PROVAS_PESSOAS ' +
      'SET ' +
         'SN_FINALIZADA = 1,' +
         'DT_RESOLUCAO = NOW(),' +
         'DT_FIM_RESOLUCAO = NOW() ' +
      'WHERE ' +
         'CD_PROVA_PESSOA = ?';

   SSQLSearchTpl =
      'SELECT ' +
         'GQ.CD_QUESTAO, ' +
         'COALESCE(GA.CD_ALTERNATIVA, 0) CD_ALTERNATIVA, ' +
         'P.CD_PROVA, ' +
         'P.CD_PESSOA ' +
      'FROM ' +
         'POL_PROVAS_PESSOAS P ' +
         'INNER JOIN POL_PROVAS_GABARITOS GQ ON ( P.CD_PROVA = GQ.CD_PROVA AND P.CD_PESSOA = GQ.CD_PESSOA ) ' +
         'LEFT JOIN POL_PROVAS_GABARITOS GA ON ( ' +
         '   GA.CD_PESSOA = GQ.CD_PESSOA AND ' +
         '   GA.CD_PROVA = GQ.CD_PROVA AND ' +
         '   GA.CD_QUESTAO = GQ.CD_QUESTAO AND ' +
         '   GA.NR_ORDEM_ALTERNATIVA = ? '+
         ') '+
      'WHERE ' +
         'GQ.NR_ORDEM_QUESTAO = ? AND ' +
         'P.CD_PROVA_PESSOA = ? ' +
      'GROUP BY ' +
         'GQ.CD_QUESTAO, GA.CD_ALTERNATIVA, P.CD_PROVA, P.CD_PESSOA';

   SSQLSearchResp =
      'SELECT ' +
         'CD_PROVA_PESSOA_RESPOSTA ' +
      'FROM ' +
         'POL_PROVAS_PESSOAS_RESPOSTAS ' +
      'WHERE ' +
         'CD_PROVA_PESSOA = ? AND ' +
         'CD_QUESTAO = ?';

   SSQLUpdResp =
      'UPDATE POL_PROVAS_PESSOAS_RESPOSTAS ' +
      'SET ' +
         'CD_ALTERNATIVA_RESPOSTA = ? ' +
      'WHERE ' +
         'CD_PROVA_PESSOA = ? AND ' +
         'CD_QUESTAO = ?';

   SSQLInsResp =
      'INSERT INTO POL_PROVAS_PESSOAS_RESPOSTAS ' +
         '(CD_PROVA_PESSOA, CD_QUESTAO, CD_ALTERNATIVA_RESPOSTA, NR_QUESTAO, NR_RESOLUCAO) ' +
      'VALUES (?, ?, ?, ?, 1)';
var
   WithError, Found: Boolean;
   I, J, Question, Option, Test, Person: Integer;
   Template: TTemplate;
   Response: TResponse;
   Reader: TOpticalReaderLC2000;
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   SummaryType: TSummaryType;

   procedure ShowProgressControl;
   begin
      prbGabaritos.Position := 0;
      prbGabaritos.Max := Reader.Templates.Count;
      prbRespostas.Position := 0;
      pnlProgresso.Visible := True;
      Application.ProcessMessages;
   end;

   procedure HideProgressControl;
   begin
      pnlProgresso.Visible := False;
      Application.ProcessMessages;
   end;

   procedure StepItTemplateProgress;
   begin
      prbGabaritos.StepIt;
      Application.ProcessMessages;
   end;

   procedure StepItResponseProgress;
   begin
      prbRespostas.StepIt;
      Application.ProcessMessages;
   end;

begin
   Reader := CreateNewReader;
   try
      ShowProgressControl;

      for I := 0 to Reader.Templates.Count - 1 do
      begin
         Found := False;
         WithError := False;
         Template := Reader.Templates.Items[I];
         
         prbRespostas.Position := 0;
         prbRespostas.Max := Template.Responses.Count;

         for J := 0 to Template.Responses.Count - 1 do
         begin
            Response := Template.Responses.Items[J];

            Statement := PrepareStatement(SSQLSearchTpl);
            Statement.SetInt(1, Response.Number);
            Statement.SetInt(2, Response.Id);
            Statement.SetInt(3, Template.CustomId);

            try
               ResultSet := Statement.ExecuteQueryPrepared;
               if ResultSet.Next then
               begin
                  Question := ResultSet.GetInt(1);
                  Option := ResultSet.GetInt(2);
                  Test := ResultSet.GetInt(3);
                  Person := ResultSet.GetInt(4);

                  ResultSet.Close;

                  Statement := PrepareStatement(SSQLSearchResp);
                  Statement.SetInt(1, Template.CustomId);
                  Statement.SetInt(2, Question);

                  try
                     ResultSet := Statement.ExecuteQueryPrepared;
                     if ResultSet.Next then
                     begin
                        if chkSobreescrever.Checked then
                        begin
                           Found := True;
                           SummaryType := stOverride;
                           Statement := PrepareStatement(SSQLUpdResp);
                           Statement.SetInt(1, Option);
                           Statement.SetInt(2, Template.CustomId);
                           Statement.SetInt(3, Question);

                           try
                              Statement.ExecutePrepared;
                           except
                              on E: EZSQLException do
                              begin
                                 WithError := True;
                                 AppendError(Test, Person, Response.Id, E.Message);
                              end;
                           end;
                        end;
                     end
                     else
                     begin
                        Found := True;
                        SummaryType := stImport;
                        Statement := PrepareStatement(SSQLInsResp);
                        Statement.SetInt(1, Template.CustomId);
                        Statement.SetInt(2, Question);
                        Statement.SetInt(3, Option);
                        Statement.SetInt(4, Response.Id);
                        
                        try
                           Statement.ExecutePrepared;
                        except
                           on E: EZSQLException do
                           begin
                              WithError := True;
                              AppendError(Test, Person, Response.Id, E.Message);
                           end;
                        end;
                        
                     end;
                     ResultSet.Close;
                  except
                     on E: EZSQLException do
                        AppendError(Test, Person, Response.Id, E.Message)
                  end;
               end;
            except
               on E: EZSQLException do raise;
            end;
            StepItResponseProgress;
         end;

         if Found then
         begin
            UpdateBills(Test, Person, Template.CustomId);

            Statement := PrepareStatement(SSQLFinalize);
            Statement.SetInt(1, Template.CustomId);
            Statement.ExecutePrepared;

            if not WithError then
               AppendSummary(Test, SummaryType);
         end;
            
         StepItTemplateProgress;
      end;
      HideProgressControl;
   finally
      Reader.Free;
   end;
end;

procedure TfLeitura.dsResumoDataChange(Sender: TObject; Field: TField);
begin
   cdsErros.Filter := Format('CD_PROVA = %d', [cdsResumoCD_PROVA.AsInteger]);
end;

procedure TfLeitura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SaveConfig;
   Action := caFree;
end;

procedure TfLeitura.FormCreate(Sender: TObject);
begin
   cdsResumo.CreateDataSet;
   cdsResumo.EmptyDataSet;
   cdsResumo.Open;

   cdsErros.CreateDataSet;
   cdsErros.EmptyDataSet;
   cdsResumo.Open;

   LoadConfig;
end;

procedure TfLeitura.FormDestroy(Sender: TObject);
begin
   fLeitura := nil;
end;

procedure TfLeitura.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         btnExecutar.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

function TfLeitura.GetCardIdLength: Integer;
begin
   Result := speTamCartao.Value;
end;

function TfLeitura.GetCustomIdLength: Integer;
begin
   Result := speTamPessoa.Value;
end;

function TfLeitura.GetData: TStringList;
var
   I: Integer;
   FileContent: TStringList;
begin
   Result := TStringList.Create;
   for I := 0 to lbArquivos.Count - 1 do
   begin
      FileContent := TStringList.Create;
      try
         FileContent.LoadFromFile(lbArquivos.Items.Strings[I]);
         Result.AddStrings(FileContent);
      finally
         FileContent.Free;
      end;
   end;
end;

procedure TfLeitura.LoadConfig;
const
   SSQLGetParms = 'SELECT DS_PARAMETRO, DS_VALOR FROM NU_PARAMETROS WHERE DS_PARAMETRO IN (''leitora.tamanho.pessoa'', ''leitora.tamanho.identificacao'') AND CD_MODULO = (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = ''ProvaOnline'')';
var
   ResultSet: IZResultSet;
   S: string;
   I: Integer;
begin
   ResultSet := ExecuteQuery(SSQLGetParms);
   try
      while ResultSet.Next do
      begin
         S := ResultSet.GetString(2);
         if TryStrToInt(S, I) then
         begin
            S := ResultSet.GetString(1);
            if S = 'leitora.tamanho.pessoa' then
               speTamPessoa.Value := I
            else if S = 'leitora.tamanho.identificacao' then
               speTamCartao.Value := I;
         end;
      end;
   finally
      ResultSet.Close;
   end;
end;

procedure TfLeitura.SaveConfig;
const
   SSQLUpdParm = 'UPDATE NU_PARAMETROS SET DS_VALOR = ? WHERE DS_PARAMETRO = ? AND CD_MODULO = (SELECT CD_MODULO FROM NU_MODULOS WHERE DS_CHAVE = ''ProvaOnline'')';
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement(SSQLUpdParm);
   
   try
      Statement.SetString(1, speTamPessoa.Text);
      Statement.SetString(2, 'leitora.tamanho.pessoa');
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;

   try
      Statement.SetString(1, speTamCartao.Text);
      Statement.SetString(2, 'leitora.tamanho.identificacao');
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

procedure TfLeitura.sbAdicionarClick(Sender: TObject);
var
   I: Integer;
begin
   if odlgGabarto.Execute then
   begin
   
      for I := 0 to odlgGabarto.Files.Count - 1 do
      begin
         if lbArquivos.Items.IndexOf(odlgGabarto.Files.Strings[I]) = -1 then
         begin
            lbArquivos.Items.Add(odlgGabarto.Files.Strings[I]);
         end;
      end;

      sbExcluir.Enabled := lbArquivos.Count > 0;
      sbLimpar.Enabled := lbArquivos.Count > 0;
      btnExecutar.Enabled := lbArquivos.Count > 0;
   end;
end;

procedure TfLeitura.sbExcluirClick(Sender: TObject);
begin
   lbArquivos.DeleteSelected;
   sbExcluir.Enabled := lbArquivos.Count > 0;
   sbLimpar.Enabled := lbArquivos.Count > 0;
end;

procedure TfLeitura.sbLimparClick(Sender: TObject);
begin
   sbExcluir.Enabled := False;
   sbLimpar.Enabled := False;
   lbArquivos.Clear;
end;

procedure TfLeitura.UpdateBills(const Test, Person, Id: Integer);
const
   SSQLNoteMax =
      'SELECT ' +
         'NR_NOTA_MAXIMA ' +
      'FROM ' +
         'POL_PROVAS P ' +
      'WHERE ' +
         'P.CD_PROVA = ?';

   SSQLCountQuests =
      'SELECT ' +
         'CASE ' +
            'WHEN COALESCE(P.NR_QTD_QUESTOES, 0) < 1 THEN SUM(N.QTD_QUESTOES) ' +
            'ELSE P.NR_QTD_QUESTOES ' +
         'END ' +
      'FROM ' +
         'POL_PROVAS P ' +
            'LEFT JOIN POL_PROVAS_NIVEIS N ON ' +
               '(P.CD_PROVA = N.CD_PROVA) ' +
      'WHERE ' +
         'P.CD_PROVA = ? ' +
      'GROUP BY ' +
         'P.CD_PROVA';
   
   SSQLCountHits =
      'SELECT ' +
         'COUNT(R.CD_QUESTAO) ' +
      'FROM ' +
         'POL_QUESTOES Q ' +
            'JOIN POL_PROVAS_PESSOAS_RESPOSTAS R ON ' +
               '(Q.CD_QUESTAO = R.CD_QUESTAO) ' +
               'JOIN POL_ALTERNATIVAS A ON ' +
                  '(R.CD_ALTERNATIVA_RESPOSTA = A.CD_ALTERNATIVA) AND ' +
                  '(R.CD_QUESTAO = A.CD_QUESTAO) ' +
      'WHERE ' +
         'R.CD_PROVA_PESSOA = ? AND ' +
         '(A.NR_ALTERNATIVA = 0 OR Q.CD_ALTERNATIVA_CERTA = 999) ' +
      'GROUP BY ' +
         'R.CD_PROVA_PESSOA';
   
   SSQLUpdNote =
      'UPDATE POL_PROVAS_PESSOAS ' +
      'SET ' +
         'NR_NOTA = ? ' +
      'WHERE ' +
         'CD_PROVA_PESSOA = ? AND ' +
         'COALESCE(NR_NOTA, 0) <= ?';

   SSQLUpdNoteChecked =
      'UPDATE POL_PROVAS_PESSOAS ' +
      'SET ' +
         'NR_NOTA = ? ' +
      'WHERE ' +
         'CD_PROVA_PESSOA = ? ';

   SSQLSearchNote =
      'SELECT '+
         'P.CD_PESSOA, ' +
         'T.CD_TURMA, ' +
         'T.NR_ANOSEMESTRE, ' +
         'T.CD_DISCIPLINA, ' +
         'T.NR_BIMESTRE, ' +
         'D.NRO_NOTA ' +
      'FROM ' +
         'POL_PROVAS_PESSOAS P ' +
            'JOIN POL_PROVAS_TURMAS T ON ' +
               '(P.CD_PROVA = T.CD_PROVA) ' +
               'JOIN DIARIO_PROVAS D ON ' +
                  '(T.CD_PROVA_DIARIO = D.CD_PROVA) ' +
               'JOIN FICHAINDIVIDUAL F ON ' +
                  '(P.CD_PESSOA = F.CODIGOALUNO) AND ' +
                  '(T.CD_CURSO = F.CURSO) AND ' +
                  '(T.CD_DISCIPLINA = F.DISCIPLINA) AND ' +
                  '(T.CD_TURMA = F.TURMA) AND ' +
                  '(T.NR_ANOSEMESTRE = F.ANOSEMESTRE) AND ' +
                  '(F.SITUACAO = 1) ' +
      'WHERE ' +
         'P.CD_PROVA_PESSOA = ?';

   SSQLOpenNote =
      'SELECT ' +
         'CD_PESSOA, ' +
         'CD_TURMA, ' +
         'NR_ANOSEM, ' +
         'CD_DISCIPLINA, ' +
         'CD_BIMESTRE, ' +
         'NR_PROVA, ' +
         'VL_NOTA ' +
      'FROM ' +
         'DIARIO_PROVAS_ALUNOS ' +
      'WHERE ' +
         'CD_PESSOA = ? AND ' +
         'CD_TURMA = ? AND ' +
         'NR_ANOSEM = ? AND ' +
         'CD_DISCIPLINA = ? AND ' +
         'CD_BIMESTRE = ? AND ' +
         'NR_PROVA = ?';

   SLogTemplate = '[Importação de gabaritos da Prova Online Presencial] Aluno: %d, Prova: %d, Nota: %f, Ano/semestre: %d, Turma: %s, Disciplina: %d, Etapa: %d';
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   Quests, Hits, YearSemester, Discipline, Stage, Number: Integer;
   NoteMax, Note: Double;
   LClass, Log: string;
   Found: Boolean;
begin
   Statement := PrepareStatement(SSQLNoteMax);
   try
      Statement.SetInt(1, Test);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then NoteMax := ResultSet.GetDouble(1);
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   Statement := PrepareStatement(SSQLCountQuests);
   try
      Statement.SetInt(1, Test);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then Quests := ResultSet.GetInt(1);
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   Statement := PrepareStatement(SSQLCountHits);
   try
      Statement.SetInt(1, Id);
      ResultSet := Statement.ExecuteQueryPrepared;
      try
         if ResultSet.Next then Hits := ResultSet.GetInt(1)
         else Hits := 0;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   Note := RoundTo(Hits * NoteMax / Quests, -2);

   if not chkSobreescrever.Checked then
   begin
       Statement := PrepareStatement(SSQLUpdNote);
   end
   else
   begin
      Statement := PrepareStatement(SSQLUpdNoteChecked);
   end;

   try
      Statement.SetDouble(1, Note);
      Statement.SetInt(2, Id);
      Statement.SetDouble(3, Note);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;

   Statement := PrepareStatement(SSQLSearchNote);
   try
      Statement.SetInt(1, Id);
      ResultSet := Statement.ExecuteQueryPrepared;
      
      try
         if ResultSet.Next then
         begin
            Found := True;
            LClass := ResultSet.GetString(2);
            YearSemester := ResultSet.GetInt(3);
            Discipline := ResultSet.GetInt(4);
            Stage := ResultSet.GetInt(5);
            Number := ResultSet.GetInt(6);
         end
         else
            Found := False;
      finally
         ResultSet.Close;
      end;
      
   finally
      Statement.Close;
   end;

   if Found then
   begin
      Statement := PrepareStatement(SSQLOpenNote);
      try
         Statement.SetResultSetConcurrency(rcUpdatable);
         Statement.SetInt(1, Person);
         Statement.SetString(2, LClass);
         Statement.SetInt(3, YearSemester);
         Statement.SetInt(4, Discipline);
         Statement.SetInt(5, Stage);
         Statement.SetInt(6, Number);
         ResultSet := Statement.ExecuteQueryPrepared;
         try
            if not ResultSet.Next then
            begin
               ResultSet.MoveToInsertRow;
               ResultSet.UpdateInt(1, Person);
               ResultSet.UpdateString(2, LClass);
               ResultSet.UpdateInt(3, YearSemester);
               ResultSet.UpdateInt(4, Discipline);
               ResultSet.UpdateInt(5, Stage);
               ResultSet.UpdateInt(6, Number);
               ResultSet.UpdateDouble(7, Note);
               ResultSet.InsertRow;
            end
            else
            begin
               if ResultSet.GetDouble(7) <= Note then
               begin
                  ResultSet.UpdateDouble(7, Note);
                  ResultSet.UpdateRow;
               end;
               //Se o valor for 0 e o aluno não tiver respondido devemos setar msm assim
               if (Note = 0) AND (Hits = 0) then
               begin
                  ResultSet.UpdateDouble(7, Note);
                  ResultSet.UpdateRow;
               end;
            end;

            DM.CalcularMediaAutomaticamente( YearSemester, LClass, Stage, Discipline, Person );

            Log := Format(SLogTemplate, [Person, Number, Note, YearSemester,
               LClass, Discipline, Stage]);
            WriteLog(Log);
         finally
            ResultSet.Close;
         end;
      finally
         Statement.Close;
      end;
   end;
end;

procedure TfLeitura.WriteLog(const Log: string);
const
   SSQLInsertLog = 'INSERT INTO DIARIO_LOGS (CD_PESSOA, CD_ACAO, CD_ATIVIDADE, DT_LOG, DESCRICAO) VALUES (?, 3, 2, NOW(), ?)';
var
   Statement: IZPreparedStatement;
begin
   Statement := PrepareStatement(SSQLInsertLog);
   try
      Statement.SetInt(1, DM.LoggedUser);
      Statement.SetString(2, Log);
      Statement.ExecutePrepared;
   finally
      Statement.Close;
   end;
end;

end.
