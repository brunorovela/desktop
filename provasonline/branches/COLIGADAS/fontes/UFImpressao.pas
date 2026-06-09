unit UFImpressao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, ZAbstractRODataset,
   UZDataset, StdCtrls, Buttons, UCrpeClasses, UCrpe32, IniFiles, ZDbcIntfs,
   UZDbcFuncs, DBCtrls, ZSqlProcessor;

type
   TfImpressao = class(TForm)
      bvlSep1: TBevel;
      tlbOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnImprimir: TToolButton;
      btnConfigurar: TToolButton;
      btnSep2: TToolButton;
      btnFechar: TToolButton;
      btnSep3: TToolButton;
      ilBotoes: TImageList;
      bvlSep2: TBevel;
      pnlRelators: TPanel;
      splSep: TSplitter;
      pnlListaTit: TPanel;
      tvRelatorios: TTreeView;
      qryRelatorios: TUMZReadOnlyQuery;
      qryRelatoriosNM_RELATORIO: TStringField;
      qryRelatoriosCD_MODULO: TIntegerField;
      qryRelatoriosCD_CABECALHO: TIntegerField;
      qryRelatoriosDS_GRUPO: TStringField;
      qryRelatoriosNM_ARQUIVO: TStringField;
      qryRelatoriosDS_PARAMETROS: TStringField;
      qryRelatoriosDS_FORMULA: TMemoField;
      qryRelatoriosDS_SQL_EXP: TMemoField;
      qryRelatoriosDS_ESPECIAL: TMemoField;
      qryRelatoriosDS_ORDEM: TStringField;
      qryRelatoriosSN_DISPONIVEL: TStringField;
      qryRelatoriosDS_FORMULA_GRUPO: TStringField;
      qryRelatoriosDS_SQL: TMemoField;
      qryRelatoriosDS_SQL_ORDEM: TStringField;
      qryRelatoriosCD_RELATORIO: TLargeintField;
      qryRelatoriosSN_IMPRESSAO_NUMERO: TStringField;
      qryRelatoriosDS_VARIAVEIS: TStringField;
      ilRelators: TImageList;
      pnlFiltros: TPanel;
      pnlFiltrosTit: TPanel;
      bvlSep3: TBevel;
      lblFiltroProva: TLabel;
      edtFiltroProva: TEdit;
      sbSelProva: TSpeedButton;
      lbPessoas: TListBox;
      sbAdicionar: TSpeedButton;
      sbRemover: TSpeedButton;
      sbLimpar: TSpeedButton;
      Crpe: TCrpe;
      qryTurmas: TUMZReadOnlyQuery;
      qryTurmasCD_TURMA: TStringField;
      dsTurmas: TDataSource;
      dblcTurmas: TDBLookupComboBox;
      rbTodasTurmas: TRadioButton;
      rbTurmaEspecifica: TRadioButton;
      chkPessoas: TCheckBox;
      qrySortAlunos: TUMZReadOnlyQuery;
      qrySortAlunosCD_PROVA_PESSOA: TIntegerField;
      qrySortAlunosCD_TURMA: TStringField;
      procedure FormDestroy(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
      procedure btnConfigurarClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure sbLimparClick(Sender: TObject);
      procedure sbRemoverClick(Sender: TObject);
      procedure sbAdicionarClick(Sender: TObject);
      procedure sbSelProvaClick(Sender: TObject);
      procedure tvRelatoriosClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      FReportDir: string;
      function BuildSelectionFormula: string;
      function BuildReportPath(const FileName: string): string;
      function FindReportFile(const FileName: string): Boolean;
      function GetGroupSelecion: string;
      function GetReportTitle: string;
      function GetSQLExpressions: TStringList;
      function GetSortFields: TStringList;
      procedure DoPrint;
      procedure LoadTemplates;
      procedure SortTemplates;
   end;

var
   fImpressao: TfImpressao;

implementation

uses
   UDM, UFBuscaProva, UFBuscaPessoa;

{$R *.dfm}

procedure TfImpressao.btnConfigurarClick(Sender: TObject);
begin
   Crpe.Printer.Prompt;
   Crpe.Printer.SetCurrent;
end;

procedure TfImpressao.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfImpressao.btnImprimirClick(Sender: TObject);
begin
   DoPrint;
end;

function TfImpressao.BuildReportPath(const FileName: string): string;
begin
   Result := FReportDir + PathDelim + FileName + '.rpt';
end;

function TfImpressao.BuildSelectionFormula: string;
const
   SOp = ' AND ';
   SComma = ',';
   SSelectionTest = '{POL_PROVAS.CD_PROVA} = %d';
   SSelectionTurma = '{POL_PROVAS_TURMAS.CD_TURMA} = %s';
   SSelectionPersons = '{POL_PROVAS_PESSOAS.CD_PESSOA} in [%s]';
var
   I: Integer;
   PersonList: string;
begin
   Result := '';
   if edtFiltroProva.Tag <> 0 then
   begin
      Result := Format(SSelectionTest, [edtFiltroProva.Tag]);

      if rbTurmaEspecifica.Checked and (dblcTurmas.KeyValue <> Null) then
      begin
         Result := Result + SOp + Format(SSelectionTurma,
            [QuotedStr(qryTurmasCD_TURMA.AsString)]);
      end;

      PersonList := '';
      if chkPessoas.Checked and (lbPessoas.Count > 0) then
      begin
         for I := 0 to lbPessoas.Count - 1 do
         begin
            if PersonList <> '' then PersonList := PersonList + SComma;
            fBuscaPessoa.qryPessoas.GotoBookmark(lbPessoas.Items.Objects[I]);
            PersonList := PersonList + fBuscaPessoa.qryPessoasCD_PESSOA.AsString
         end;
         Result := Result + SOp + Format(SSelectionPersons, [PersonList]);
      end;
   end;
end;

procedure TfImpressao.DoPrint;
const
   SInfoCaption = 'Informação';
   SQuestCaption = 'Confirmação';
   SReportFileNotFound = 'O arquivo de relatório [%s] não foi encontrado. Não é possível realizar a impressão.';
   SQuestPrint = 'Deseja visualizar antes de confirmar a impressão?';
var
   I, J: Integer;
   FileName: string;
   Temp: TStringList;
begin
   FileName := qryRelatoriosNM_ARQUIVO.AsString;

   if FindReportFile(FileName) then
   begin
      Crpe.ReportName := '';
      Crpe.ReportName := BuildReportPath(FileName);
      if Crpe.HasSavedData then Crpe.DiscardSavedData;

      Crpe.Connect.Clear;
      Crpe.Connect.ServerName := DM.conn.Database;
      Crpe.Connect.UserID := DM.conn.User;
      Crpe.Connect.Password := DM.conn.Password;
      Crpe.Connect.DatabaseName := DM.conn.Database;
      Crpe.Connect.Propagate := True;

      Crpe.Selection.Formula.Text := BuildSelectionFormula;
      Crpe.GroupSelection.Formula.Text := GetGroupSelecion;
      
      I := Crpe.Formulas.IndexOf('nm_titulo');
      if I > -1 then Crpe.Formulas.Items[I].Formula.Text := GetReportTitle;

      Temp := GetSQLExpressions;
      try
         for I := 0 to Temp.Count - 1 do
         begin
            J := Crpe.SQLExpressions.IndexOf(Temp.Names[I]);
            if J > -1 then
               Crpe.SQLExpressions.Items[J].Expression.Text := Temp.ValueFromIndex[I];
         end;
      finally
         Temp.Free;
      end;

      Temp := GetSortFields;
      try
         Crpe.SortFields.Clear;
         for I := 0 to Temp.Count - 1 do
         begin
            J := Crpe.SortFields.Add(Temp.Names[I]);
            if Temp.ValueFromIndex[I] = 'DESC' then
               Crpe.SortFields.Items[J].Direction := sdDescending
            else
               Crpe.SortFields.Items[J].Direction := sdAscending;
         end;
      finally
         Temp.Free;
      end;

      Crpe.Output := toPrinter;

      case MessageBox(Handle, PChar(SQuestPrint), PChar(SQuestCaption), MB_ICONQUESTION or MB_YESNOCANCEL) of
         mrYes:
            begin
               LoadTemplates;
               Crpe.Output := toWindow;
               Crpe.Execute;
            end;
         mrNo:
            begin
               LoadTemplates;
               Crpe.Output := toPrinter;
               Crpe.Execute;
            end;
      end;

      Crpe.Clear;
   end
   else
      MessageBox(Handle, PChar(SReportFileNotFound), PChar(SInfoCaption),
         MB_ICONINFORMATION or MB_OK);
end;

function TfImpressao.FindReportFile(const FileName: string): Boolean;
begin
   Result := FileExists(BuildReportPath(FileName));
end;

procedure TfImpressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfImpressao.FormCreate(Sender: TObject);
var
   GroupName, ExePath, IniPath: string;
   GroupNode: TTreeNode;
   IniFile: TIniFile;
begin
   qryRelatorios.Open;

   while not qryRelatorios.Eof do
   begin
      if qryRelatoriosDS_GRUPO.AsString <> GroupName then
      begin
         GroupName := qryRelatoriosDS_GRUPO.AsString;
         GroupNode := tvRelatorios.Items.Add(tvRelatorios.TopItem, GroupName);
         GroupNode.ImageIndex := 0;
      end;
      with
         tvRelatorios.Items.AddChildObject(
            GroupNode,
            qryRelatoriosNM_RELATORIO.AsString,
            qryRelatorios.GetBookmark) do
      begin
         ImageIndex := 1;
         SelectedIndex := 1;
      end;
      qryRelatorios.Next;
   end;

   ExePath := ExtractFilePath(ParamStr(0));
   IniPath := ExePath + 'unimestre.ini';
   
   if FileExists(IniPath) then
   begin
      IniFile := TIniFile.Create(IniPath);
      try
         FReportDir := IniFile.ReadString('Configuracoes', 'Relatorios', ExePath + 'relatorios');
      finally
         IniFile.Free;
      end;
   end
   else
      FReportDir := ExePath + 'relatorios';

   Crpe.LoadEngine;
end;

procedure TfImpressao.FormDestroy(Sender: TObject);
begin
   fImpressao := nil;
end;

procedure TfImpressao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F7:
         btnImprimir.Click;
      VK_F8:
         btnConfigurar.Click;
      VK_F12:
         btnFechar.Click;
   end;
end;

function TfImpressao.GetGroupSelecion: string;
begin
   Result := Trim(qryRelatoriosDS_FORMULA_GRUPO.AsString);
end;

function TfImpressao.GetReportTitle: string;
begin
   Result := qryRelatoriosNM_RELATORIO.AsString;
end;

function TfImpressao.GetSortFields: TStringList;
begin
   Result := TStringList.Create;
   Result.Delimiter := #59;
   Result.NameValueSeparator := #61;
   Result.DelimitedText := qryRelatoriosDS_ORDEM.AsString;
end;

function TfImpressao.GetSQLExpressions: TStringList;
begin
   Result := TStringList.Create;
   Result.Delimiter := #59;
   Result.NameValueSeparator := #61;
   Result.DelimitedText := qryRelatoriosDS_SQL_EXP.AsString;
end;

procedure TfImpressao.LoadTemplates;
const
   SSQLCallProc1 = 'CALL SPX_POL_ORDENA_GABARITOS(?)';
   SSQLCallProc2 = 'CALL SPX_POL_ORDENA_GABARITOS_TURMA(?, ?)';
var
   Statement: IZPreparedStatement;
begin
   if rbTurmaEspecifica.Checked then
   begin
      Statement := PrepareStatement(SSQLCallProc2);
      try
         Statement.SetInt(1, edtFiltroProva.Tag);
         Statement.SetString(2, qryTurmasCD_TURMA.AsString);
         Statement.ExecutePrepared;
      finally
         Statement.Close;
      end;
   end
   else if (lbPessoas.Count > 0) and chkPessoas.Checked then
   begin
      SortTemplates;
   end
   else
   begin
      Statement := PrepareStatement(SSQLCallProc1);
      try
         Statement.SetInt(1, edtFiltroProva.Tag);
         Statement.ExecutePrepared;
      finally
         Statement.Close;
      end;
   end;
end;

procedure TfImpressao.sbAdicionarClick(Sender: TObject);
var
   I: Integer;
begin
   if fBuscaPessoa = nil then
      Application.CreateForm(TfBuscaPessoa, fBuscaPessoa);
      
   if fBuscaPessoa.qryPessoas.ParamByName('CD_PROVA').AsInteger <>
      edtFiltroProva.Tag then
   begin
      fBuscaPessoa.qryPessoas.ParamByName('CD_PROVA').AsInteger := edtFiltroProva.Tag;
      if fBuscaPessoa.qryPessoas.Active then fBuscaPessoa.qryPessoas.Close;
      fBuscaPessoa.qryPessoas.Open;
   end
   else if not fBuscaPessoa.qryPessoas.Active then
      fBuscaPessoa.qryPessoas.Open;

   if rbTurmaEspecifica.Checked and (dblcTurmas.KeyValue <> Null) then
   begin
      fBuscaPessoa.qryPessoas.Filter := Format('CD_TURMA = %s', [QuotedStr(qryTurmasCD_TURMA.AsString)]);
      fBuscaPessoa.FixedFilter := Format('CD_TURMA = %s', [QuotedStr(qryTurmasCD_TURMA.AsString)]);
   end
   else
   begin
      fBuscaPessoa.qryPessoas.Filter := '';
      fBuscaPessoa.FixedFilter := '';
   end;

   if fBuscaPessoa.ShowModal = mrOk then
   begin
      if fBuscaPessoa.dbgPessoas.SelectedRows.Count > 0 then
      begin
         for I := 0 to fBuscaPessoa.dbgPessoas.SelectedRows.Count - 1 do
         begin
            fBuscaPessoa.qryPessoas.GotoBookmark(TBookmark(fBuscaPessoa.dbgPessoas.SelectedRows.Items[I]));
            lbPessoas.AddItem(fBuscaPessoa.qryPessoasNM_PESSOA.AsString, fBuscaPessoa.qryPessoas.GetBookmark);
         end;
         sbRemover.Enabled := True;
         sbLimpar.Enabled := True;
      end;
   end;
end;

procedure TfImpressao.sbLimparClick(Sender: TObject);
begin
   sbRemover.Enabled := False;
   sbLimpar.Enabled := False;
   lbPessoas.Clear;
end;

procedure TfImpressao.sbRemoverClick(Sender: TObject);
begin
   lbPessoas.DeleteSelected;
   sbRemover.Enabled := lbPessoas.Count > 0;
   sbLimpar.Enabled := lbPessoas.Count > 0;
end;

procedure TfImpressao.sbSelProvaClick(Sender: TObject);
begin
   if fBuscaProva = nil then
      Application.CreateForm(TfBuscaProva, fBuscaProva);
   if fBuscaProva.ShowModal = mrOk then
   begin
      if edtFiltroProva.Tag <> fBuscaProva.qryProvasCD_PROVA.AsInteger then
      begin
         edtFiltroProva.Text := fBuscaProva.qryProvasDS_PROVA.AsString;
         edtFiltroProva.Tag := fBuscaProva.qryProvasCD_PROVA.AsInteger;
         sbRemover.Enabled := False;
         sbLimpar.Enabled := False;
         lbPessoas.Clear;
         qryTurmas.Close;
         qryTurmas.ParamByName('CD_PROVA').AsInteger := fBuscaProva.qryProvasCD_PROVA.AsInteger;
         qryTurmas.Open;
      end
      else
      begin
         sbRemover.Enabled := lbPessoas.Count > 0;
         sbLimpar.Enabled := lbPessoas.Count > 0;
      end;
      
      sbAdicionar.Enabled := True;
   end
   else
      sbAdicionar.Enabled := edtFiltroProva.Tag <> 0;
end;

procedure TfImpressao.SortTemplates;
const
   SSQLClearTemplates = 'TRUNCATE TABLE TMP_POL_ORDEM_GABARITOS';

   SSQLInsertRecord =
      'INSERT INTO TMP_POL_ORDEM_GABARITOS ' +
         '(CD_PROVA_PESSOA, NR_SEQUENCIA, CD_TURMA) VALUES (?, ?, ?)';

   SSQLSearchPersons =
      'SELECT ' +
         'PP.CD_PROVA_PESSOA, ' +
         'CD_TURMA ' +
      'FROM ' +
         'POL_PROVAS_PESSOAS PP ' +
            'JOIN PESSOAS P ON ' +
               '(PP.CD_PESSOA = P.CD_PESSOA) ' +
               'JOIN FICHAINDIVIDUAL F ON ' +
                  '(P.CD_PESSOA = F.CODIGOALUNO) ' +
                  'JOIN POL_PROVAS_TURMAS T ON ' +
                     '(F.CURSO = T.CD_CURSO) AND ' +
                     '(F.DISCIPLINA = T.CD_DISCIPLINA) AND ' +
                     '(F.TURMA = T.CD_TURMA) AND ' +
                     '(F.ANOSEMESTRE = T.NR_ANOSEMESTRE) AND ' +
                     '(PP.CD_PROVA = T.CD_PROVA) ' +
                  'JOIN SITUACAO S ON ' +
                     '(F.SITUACAO = S.CD_SITUACAO) ' +
      'WHERE ' +
         'PP.CD_PROVA = :CD_PROVA AND ' +
         'S.CD_SITUACAO_PAI IN (0, 1, 2, 9, 11) AND ' +
         'PP.CD_PESSOA IN (%s) ' +
      'ORDER BY ' +
         'T.CD_TURMA,' +
         'P.NM_PESSOA';
var
   I, Index, Total, PairCount, OddCount: Integer;
   PersonList: string;
   Statement: IZPreparedStatement;
begin
   PersonList := '';
   for I := 0 to lbPessoas.Count - 1 do
      if fBuscaPessoa.qryPessoas.BookmarkValid(lbPessoas.Items.Objects[I]) then
      begin
         fBuscaPessoa.qryPessoas.GotoBookmark(lbPessoas.Items.Objects[I]);
         if PersonList <> '' then
            PersonList := PersonList + #44;
         PersonList := PersonList + fBuscaPessoa.qryPessoasCD_PESSOA.AsString;
      end;

   if PersonList <> '' then
   begin

      Statement := PrepareStatement(SSQLClearTemplates);
      try
         Statement.ExecutePrepared;
      finally
         Statement.Close;
      end;

      Statement := PrepareStatement(SSQLInsertRecord);
      try
         qrySortAlunos.Close;
         qrySortAlunos.SQL.Text := Format(SSQLSearchPersons, [PersonList]);
         qrySortAlunos.ParamByName('CD_PROVA').AsInteger := edtFiltroProva.Tag;
         qrySortAlunos.Open;

         Total := qrySortAlunos.RecordCount;
         if (Total mod 2) > 0 then Inc(Total);

         PairCount := 0;
         OddCount := -1;

         while not qrySortAlunos.Eof do
         begin
            Index := qrySortAlunos.RecNo;

            if qrySortAlunos.RecNo <= (Total / 2) then
            begin
               Inc(OddCount, 2);
               Index := OddCount;
            end
            else
            begin
               Inc(PairCount, 2);
               Index := PairCount;
            end;

            Statement.SetInt(1, qrySortAlunosCD_PROVA_PESSOA.AsInteger);
            Statement.SetInt(2, Index);
            Statement.SetString(3, qrySortAlunosCD_TURMA.AsString);
            Statement.ExecutePrepared;
            qrySortAlunos.Next;
         end;
      finally
         Statement.Close;
      end;
   end;
end;

procedure TfImpressao.tvRelatoriosClick(Sender: TObject);
begin
   if tvRelatorios.Selected <> nil then
      if qryRelatorios.BookmarkValid(tvRelatorios.Selected.Data) then
      begin
         qryRelatorios.GotoBookmark(tvRelatorios.Selected.Data);
         btnImprimir.Enabled := True;
      end
      else
         btnImprimir.Enabled := False;
end;

end.
