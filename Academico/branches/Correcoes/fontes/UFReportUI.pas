unit UFReportUI;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ImgList, DB, DBClient, Contnrs, Math, ShellAPI,
   UReportDataModule, ToolWin, UReportClasses, UFReportFilterComponent,
   StdCtrls, uLkJSON, ZDbcIntfs, UZDbcFuncs, Menus, Tabs, DockTabSet;

type
   TNodeType = (ntNone, ntFolder, ntFile);

   TfrmReportUI = class(TForm)
      btnConfigurar: TToolButton;
      btnFechar: TToolButton;
      btnImprimir: TToolButton;
      btnLimpar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep5: TBevel;
      ilAcoes: TImageList;
      ilIcons: TImageList;
      ilOpcoes: TImageList;
      imgAjuda: TImage;
      imgSobre: TImage;
      lblAjuda: TLabel;
      lblCustomizadoUnimestre: TLabel;
      lblLegendaAntigos: TLabel;
      lblLegendaCliente: TLabel;
      lblLegendaPadrao: TLabel;
      lblSobreMais: TLabel;
      miPermissoes: TMenuItem;
      miRenomear: TMenuItem;
      pmOpcoes: TPopupMenu;
      pnlAjuda: TPanel;
      pnlDados: TPanel;
      pnlLegendas: TPanel;
      pnlLegendasTitulo: TPanel;
      pnlRelatorios: TPanel;
      pnlSobre: TPanel;
      pnlSobreIcon: TPanel;
      pnlSobreLink: TPanel;
      pnlSobreTexto: TPanel;
      pnlTitulos: TPanel;
      reSobre: TRichEdit;
      sbxFiltros: TScrollBox;
      shpAntigos: TShape;
      shpCliente: TShape;
      shpCustomizadoUnimestre: TShape;
      shpPadrao: TShape;
      splSep1: TSplitter;
      splSep2: TSplitter;
      tlbAcoes: TToolBar;
      tvRelatorios: TTreeView;
      procedure btnConfigurarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
      procedure btnLimparClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure lblSobreMaisClick(Sender: TObject);
      procedure miPermissoesClick(Sender: TObject);
      procedure miRenomearClick(Sender: TObject);
      procedure pnlLegendasDockDrop(Sender: TObject; Source: TDragDockObject;
         X, Y: Integer);
      procedure tvRelatoriosClick(Sender: TObject);
      procedure tvRelatoriosContextPopup(Sender: TObject; MousePos: TPoint;
         var Handled: Boolean);
      procedure tvRelatoriosCustomDrawItem(Sender: TCustomTreeView;
         Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
      procedure tvRelatoriosEdited(Sender: TObject; Node: TTreeNode;
         var S: string);
      procedure tvRelatoriosEditing(Sender: TObject; Node: TTreeNode;
         var AllowEdit: Boolean);
      procedure tvRelatoriosKeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure tvRelatoriosMouseUp(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
   private
      FModule: TReportDataModule;
      FSelectedNode: TTreeNode;
      FReport: TReport;
      function GeraBoleto(JSON: TlkJSONobject; var Filter: AnsiString): Boolean;
      function GetTypeSelectedNode: TNodeType;
      function HasChangedSelection: Boolean;
      function GotoBookmark(Bookmark: TBookmark; DataSet: TDataSet): Boolean;
      function LocateReport: Boolean;
      procedure BuildTree;
      procedure ForEachFormula(Name: string; Element: TlkJSONbase;
         UserData: pointer; var Continue: Boolean);
      procedure LoadCustomHelp;
      procedure LoadDefaultHelp;
      procedure LoadHelp;
      procedure LoadCustomFilters;
      procedure LoadFilters;
      procedure LoadFolders(ParentNode: TTreeNode);
      procedure LoadReports(const ParentNode: TTreeNode);
      procedure ManagePrivileges;
      procedure OnSelectReport;
      procedure OpenOnlineHelp;
      procedure ShowOnlineHelp;
      procedure UpdateButtonStatus;
   end;

var
   frmReportUI: TfrmReportUI;

implementation

uses
   uDM, UCrpe32, uRepBloquetos, UFReportUIPerms;

{$R *.dfm}

{ TfrmRepRelatorios }

procedure TfrmReportUI.btnConfigurarClick(Sender: TObject);
begin
   FReport.Crpe.Printer.Prompt;
   FReport.Crpe.Printer.SetCurrent;
end;

procedure TfrmReportUI.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmReportUI.btnImprimirClick(Sender: TObject);
const
   SMsgPreencherObrigatorios = 'Todos os campos obrigatórios devem ser preenchidos para realizar a impressão.';
   SCaption = 'Atenção';

   procedure UpdateBloquetos(const Filter: AnsiString);
   const
      SSQLUpdateBloquetos = ''
         + 'UPDATE '
         + '	MENSALIDADES M '
         + 'SET '
         + '	M.BLOQUETO = ''S'', '
         + '	M.OCORRENCIA_REMESSA = 1, '
         + '	M.OCORRENCIA_RETORNO = 0 '
         + 'WHERE '
         + '	%s ';
   var
      S: AnsiString;
   begin
      S := Format(SSQLUpdateBloquetos, [Filter]);
      ExecuteUpdate(S);
   end;

var
   FilePath, Settings, Filter: AnsiString;
   Validated, Executed, Boleto: Boolean;
   ReportId: Integer;
   JSON: TlkJSONobject;
begin
   Validated := TReportFilterFactory.Instance.Validate;

   if not Validated then
   begin
      MessageBox(0, SMsgPreencherObrigatorios, SCaption, MB_ICONWARNING or MB_OK);
   end;

   if Validated then
   begin
      FilePath := FModule.GetReportFilePath;
      Settings := FModule.cdsRelatoriosME_CONFIG.AsString;
      ReportId := FModule.cdsRelatoriosCD_RELATORIO.AsLargeInt;
      JSON := TlkJSON.ParseText(UTF8Encode(Settings)) as TlkJSONobject;
      FReport.Name := FModule.cdsRelatoriosNM_RELATORIO.AsString;
      FReport.Setup(FilePath, Settings,
         TReportFilterFactory.Instance.BuildCrExpression(JSON));

      Boleto := FModule.cdsRelatoriosSN_BOLETO.AsInteger = 1;      
      Executed := True;
      
      if Boleto then
         Executed := GeraBoleto(JSON, Filter);

      if Executed then
      begin
      
         if not FModule.cdsImpressao.Active then
         begin
            FModule.cdsImpressao.Params.ParamByName('CD_RELATORIO').AsInteger := ReportId;
            FModule.cdsImpressao.Open;
         end;
         
         FModule.cdsImpressao.Insert;
         FModule.cdsImpressaoCD_RELATORIO.AsLargeInt := ReportId;
         FModule.cdsImpressaoCD_PESSOA.AsInteger := DM.iCdPessoaLogado;
         FModule.cdsImpressao.ApplyUpdates(0);

         Executed := FReport.Execute;
      end;

      if Executed then
      begin
         if Boleto then
            UpdateBloquetos(Filter);

         FModule.cdsImpressao.Edit;
         FModule.cdsImpressaoME_FILTRO.AsString := FReport.Crpe.Selection.Formula.Text;
         FModule.cdsImpressao.Post;
         FModule.cdsImpressao.ApplyUpdates(0);
      end;

      if not Executed then
      begin
         FModule.cdsImpressao.Delete;
         FModule.cdsImpressao.ApplyUpdates(0);
      end;
      
   end;
end;

procedure TfrmReportUI.btnLimparClick(Sender: TObject);
begin
   TReportFilterFactory.Instance.Clear;
end;

procedure TfrmReportUI.BuildTree;
begin
   LoadFolders(nil);
end;

procedure TfrmReportUI.ForEachFormula(Name: string; Element: TlkJSONbase;
  UserData: pointer; var Continue: Boolean);
var
   Formula: TlkJSONobject;
   FormulaValue, FormulaName: AnsiString;
begin
   Formula := Element as TlkJSONobject;
   FormulaName := Formula.getString('name');
   FormulaValue := '';

   if Formula.Field['value'] is TlkJSONstring then
   begin
      FormulaValue := Formula.getString('value');
   end;

   TStrings(UserData^).Values[FormulaName] := FormulaValue;
end;

procedure TfrmReportUI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TReportFilterFactory.Instance.Free;
   FReport.Free;
   FModule.Free;
   frmReportUI := nil;
   Action := caFree;
end;

procedure TfrmReportUI.FormCreate(Sender: TObject);
begin
   FModule := TReportDataModule.Create(nil);
   FReport := TReport.Create;
   BuildTree;
end;

procedure TfrmReportUI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         if btnLimpar.Enabled then
         begin
            btnLimpar.Click;
         end;
      VK_F6:
         btnConfigurar.Click;
      VK_F7:
         if btnImprimir.Enabled then
         begin
            btnImprimir.Click;
         end;
      VK_F12:
         btnFechar.Click;
   end;
end;

function TfrmReportUI.GeraBoleto(JSON: TlkJSONobject;
   var Filter: AnsiString): Boolean;
const
   SFilterConcatFmt = '%s%s';

   function BuildFilter(const AlunoComoResp: Boolean): AnsiString;
   const
      SFilterAnoSemFmt = 'm.anosemestre = %s';
      SFilterColigadaFmt = 'm.cd_coligada IN %s';
      SFilterDeptoFmt = 'm.depto IN %s';
      SFilterCursoFmt = 'm.curso IN %s';
      SFilterTurmaFmt = 'm.turma IN %s';
      SFilterParcelaFmt = 'm.parcela BETWEEN %s';
      SFilterVenctoFmt = 'm.datavencimento BETWEEN %s';
      SFilterRespFmt = 'm.cd_resp IN %s';
      SFilterAlunoFmt = 'm.codigoaluno IN %s';
      SFilterConcatOpFmt = '%s AND ';
   var
      I: Integer;
      S: AnsiString;
      Filters: TStrings;
   begin
   
      Filters := TStringList.Create;
      try
         S := TReportFilterFactory.Instance.SQLExprByName['AnoSemestre'];

         if S <> '' then
         begin
            S := Format(SFilterAnoSemFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Coligada'];

         if S <> '' then
         begin
            S := Format(SFilterColigadaFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Depto'];

         if S <> '' then
         begin
            S := Format(SFilterDeptoFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Curso'];

         if S <> '' then
         begin
            S := Format(SFilterCursoFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Turma'];

         if S <> '' then
         begin
            S := Format(SFilterTurmaFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Parcelas'];

         if S <> '' then
         begin
            S := Format(SFilterParcelaFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['DataRange'];

         if S <> '' then
         begin
            S := Format(SFilterVenctoFmt, [S]);
            Filters.Add(S);
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Estudante'];

         if S <> '' then
         begin
            if AlunoComoResp then
            begin
               S := Format(SFilterRespFmt, [S]);
            end;

            if not AlunoComoResp then
            begin
               S := Format(SFilterAlunoFmt, [S]);
            end;

            Filters.Add(S);
         end;

         S := FModule.cdsRelatoriosDS_BOLETO_FILTRO_MENSALIDADE.AsString;
         S := Trim(S);

         if S <> '' then
            Filters.Add(S);

         Result := '';

         for I := 0 to Filters.Count - 1 do
         begin
            if Result <> '' then
               Result := Format(SFilterConcatOpFmt, [Result]);
            Result := Format(SFilterConcatFmt, [Result, Filters[I]]);
         end;

      finally
         Filters.Free;
      end;
      
   end;

const
   SFilterContaFmt = '%s=%s';
   SCaptionAtencao = 'Atenção';
   SMessageSemPessoa = 'É necessário selecionar uma pessoa para efetuar a impressão deste boleto.';
   SMessageSemColigada = 'É necessário selecionar uma unidade de ensino para efetuar a impressão deste boleto.';
var
   Formulas: TStrings;
   Items: TlkJSONlist;
   S, ContaCol, ContaImp, Coligada, TipoTitulo: AnsiString;
   TemFormulaEmpresa, TemFormulaResp, Agrupa, AgrupaProxMes, SelConta: Boolean;
   FormulaEmpIdx, FormulaRespIdx, FormulaContaImpIdx, MensalidadeId: Integer;
   PreparaBoleto: TPreparaBoleto;
   Frame: TfrmReportFilterComponent;
begin
   Result := True;
   
   Frame := TReportFilterFactory.Instance.Find('Coligada');

   if Frame <> nil then
   begin
      S := Frame.AsSQLExpression;

      if S = '' then
      begin
         Result := False;
         MessageBox(Handle, SMessageSemColigada, SCaptionAtencao,
            MB_ICONWARNING or MB_OK);
      end;
      
   end;

   if Result then
   begin
      
      TemFormulaEmpresa := False;
      TemFormulaResp := False;
      FormulaRespIdx := -1;
      FormulaEmpIdx := -1;
      FormulaContaImpIdx := -1;
      Formulas := TStringList.Create;
      
      try
         try
            if JSON.Field['formulas'] is TlkJSONlist then
            begin
               Items := TlkJSONlist(JSON.Field['formulas']);
               Items.ForEach(ForEachFormula, @Formulas);

               FormulaContaImpIdx := Formulas.IndexOfName('iContaImpressao');

               if FormulaContaImpIdx <> -1 then
               begin
                  FormulaEmpIdx := Formulas.IndexOfName('empresa');
                  FormulaRespIdx := Formulas.IndexOfName('responsavel');

                  TemFormulaEmpresa := FormulaEmpIdx <> -1;
                  TemFormulaResp := FormulaRespIdx <> -1;
               end;
            end;
         finally
            JSON := nil;
         end;

         S := TReportFilterFactory.Instance.SQLExprByName['Estudante'];

         if (S = '') and TemFormulaEmpresa then
         begin
            Result := False;
            MessageBox(Handle, SMessageSemPessoa, SCaptionAtencao,
               MB_ICONWARNING or MB_OK);
         end;

         if Result then
         begin
            S := DM.variavel_parametro('financeiro_boletos_agrupados');
            Agrupa := S = 'S';

            S := DM.variavel_parametro('financeiro_boleto_escolha_aluno');
            SelConta := S = 'S';

            S := DM.variavel_parametro('agrupar_mensalidades_proximo_mes');
            AgrupaProxMes := S = 'S';

            Filter := BuildFilter(TemFormulaEmpresa or TemFormulaResp);

            ContaCol := '';

            if (SelConta or TemFormulaEmpresa or TemFormulaResp) and
               (FormulaContaImpIdx <> -1) then
            begin
               ContaImp := Formulas.Values['iContaImpressao'];
               Coligada := Formulas.Values['iContaColigada'];
               ContaCol := Format(SFilterContaFmt, [ContaImp, Coligada]);

               if ContaCol = '=' then
                  ContaCol := '';
            end;

            TipoTitulo := TReportFilterFactory.Instance.SQLExprByName['TipoTitulo'];

            PreparaBoleto := pbImpressaoPadrao;
      
            if TemFormulaEmpresa or TemFormulaResp then
            begin
               PreparaBoleto := pbImpressaoEmpresa;

               if AgrupaProxMes then
               begin
                  PreparaBoleto := pbImpressaoAluno;
               end;
            end;

            Application.CreateForm(TfrmRepBloquetos, frmRepBloquetos);

            try
               S := FModule.cdsRelatoriosDS_BOLETO_FILTRO.AsString;
               
               Result := frmRepBloquetos.PrepararBloquetosParaImpressao(Filter,
                  Agrupa, ContaCol, True, 0, S, TipoTitulo, PreparaBoleto);

               if Result then
               begin
                  frmRepBloquetos.tblBloquetos.DisableControls;
                  frmRepBloquetos.tblBloquetos.First;

                  while not frmRepBloquetos.tblBloquetos.Eof do
                  begin
                     MensalidadeId := frmRepBloquetos.tblBloquetos.
                        FieldByName('cd_mensalidade').AsInteger;
                     DM.FazAcaoRemessa(arImpBoleto, MensalidadeId, True);
                     frmRepBloquetos.tblBloquetos.Next;
                  end;
         
                  frmRepBloquetos.tblBloquetos.EnableControls;
               end;
               
            finally
               frmRepBloquetos.Free;
               frmRepBloquetos := nil;
            end;
            
         end;

      finally
         Formulas.Free;
      end;
      
   end;
end;

function TfrmReportUI.GetTypeSelectedNode: TNodeType;
begin
   Result := ntNone;

   if FSelectedNode <> nil then
   begin
      if FSelectedNode.ImageIndex in [0, 1] then
      begin
         Result := ntFolder;
      end;

      if FSelectedNode.ImageIndex = 2 then
      begin
         Result := ntFile;
      end;
   end;
end;

function TfrmReportUI.GotoBookmark(Bookmark: TBookmark;
  DataSet: TDataSet): Boolean;
begin
   Result := False;
   
   if DataSet.BookmarkValid(Bookmark) then
   begin
      Result := True;
      DataSet.GotoBookmark(Bookmark);
   end;
end;

function TfrmReportUI.HasChangedSelection: Boolean;
var
   Node: TTreeNode;
begin
   Result := False;
   Node := tvRelatorios.Selected;

   if Node <> FSelectedNode then
   begin
      Result := True;
      FSelectedNode := Node;   
   end;
   
end;

procedure TfrmReportUI.lblSobreMaisClick(Sender: TObject);
begin
   OpenOnlineHelp;
end;

procedure TfrmReportUI.LoadCustomFilters;
const
   ClassNumberToName: array[1..2] of AnsiString = ('CustomSearch', 'CustomSelect');
var
   ClassNumber: Byte;
   ReportId, SQLId: Cardinal;
   Required: Boolean;
   FilterName, Settings, SQLSettings: AnsiString;
begin
   ReportId := FModule.cdsRelatoriosCD_RELATORIO.AsLargeInt;

   if FModule.cdsFiltros.Active then
   begin
      FModule.cdsFiltros.Close;
   end;

   FModule.cdsFiltros.Params.ParamByName('CD_RELATORIO').AsInteger := ReportId;
   FModule.cdsFiltros.Open;

   while not FModule.cdsFiltros.Eof do
   begin
      Required := FModule.cdsFiltrosSN_OBRIGATORIO.AsInteger = 1;
      Settings := FModule.cdsFiltrosME_CONFIG.AsString;
      ClassNumber := FModule.cdsFiltrosNR_CLASSE.AsInteger;
      FilterName := ClassNumberToName[ClassNumber];

      SQLId := FModule.cdsFiltrosCD_SQL.AsLargeInt;

      if FModule.cdsSQL.Active then
      begin
         FModule.cdsSQL.Close;
      end;

      FModule.cdsSQL.Params.ParamByName('CD_SQL').AsInteger := SQLId;
      FModule.cdsSQL.Open;

      SQLSettings := FModule.cdsSQLME_CONFIG.AsString;

      TReportFilterFactory.Instance.CreateCustomFilter(Self, sbxFiltros,
         FilterName, Settings, SQLSettings, Required);

      FModule.cdsFiltros.Next;
   end;
end;

procedure TfrmReportUI.LoadCustomHelp;
const
   STextFmt = '{\rtf1\pard\b Cliente: \b0 %s\par%%s';
var
   S: AnsiString;
begin
   S := FModule.cdsRelatoriosME_DESC_CLIENTE.AsString;
   S := Trim(S);

   if S <> '' then
   begin
      reSobre.Text := Format(STextFmt, [S]);
   end;
end;

procedure TfrmReportUI.LoadDefaultHelp;
const
   STextFmt = '{\rtf1\pard\b Unimestre: \b0 %s\par}';
   STextAboutFmt = '\pard\b Unimestre: \b0 %s\par';
var
   S, TextFmt: AnsiString;
   Stream: TStringStream;
begin
   S := FModule.cdsRelatoriosME_DESC_PADRAO.AsString;
   S := Trim(S);

   if reSobre.Text = '' then
   begin
      TextFmt := STextFmt;
   end;

   if reSobre.Text <> '' then
   begin
      Stream := TStringStream.Create('');
      try
         reSobre.Lines.SaveToStream(Stream);
         TextFmt := Stream.DataString;
      finally
         Stream.Free;
      end;
   end;

   if S <> '' then
   begin
      S := Format(STextAboutFmt, [S]);
   end;

   S := Format(TextFmt, [S]);
   reSobre.Text := S;
end;

procedure TfrmReportUI.LoadFilters;
var
   Settings: AnsiString;
begin
   Settings := FModule.cdsRelatoriosME_CONFIG.AsString;
   TReportFilterFactory.Instance.CreateFilters(Self, sbxFiltros, Settings);
end;

procedure TfrmReportUI.LoadFolders(ParentNode: TTreeNode);
const
   SFilterChildrenFmt = 'CD_CATEGORIA_PAI = %d';
   SFilterNoParent = 'CD_CATEGORIA_PAI IS NULL';
var
   I: Integer;
   ParentId: Cardinal;
   S: AnsiString;
   DataSet: TDataSet;
   Node: TTreeNode;
   NodeList: TObjectList;
begin
   DataSet := FModule.cdsCategorias;

   if not DataSet.Active then
   begin
      DataSet.Open;
   end;

   S := SFilterNoParent;
   
   if ParentNode <> nil then
   begin
      DataSet.GotoBookmark(ParentNode.Data);
      ParentId := DataSet.FieldByName('CD_CATEGORIA').AsInteger;
      S := Format(SFilterChildrenFmt, [ParentId]);
   end;

   DataSet.Filter := S;
   DataSet.Filtered := True;
   DataSet.First;

   NodeList := TObjectList.Create;

   if ParentNode = nil then
   begin
      ParentNode := tvRelatorios.TopItem;
   end;

   while not DataSet.Eof do
   begin
      S := DataSet.FieldByName('DS_CATEGORIA').AsString;
      Node := tvRelatorios.Items.AddChild(ParentNode, S);
      Node.Data := DataSet.GetBookmark;

      Node.ImageIndex := 1;
      Node.SelectedIndex := 1;

      if DataSet.FieldByName('SN_PADRAO').AsInteger = 1 then
      begin
         Node.ImageIndex := 0;
         Node.SelectedIndex := 0;
      end;

      NodeList.Add(Node);
      DataSet.Next;
   end;

   for I := 0 to NodeList.Count - 1 do
   begin
      Node := TTreeNode(NodeList.Items[I]);
      LoadFolders(Node);
      LoadReports(Node);
   end;

   DataSet.Filtered := False;
end;

procedure TfrmReportUI.LoadHelp;
begin
   reSobre.Lines.BeginUpdate;
   reSobre.Clear;
   LoadCustomHelp;
   LoadDefaultHelp;
   reSobre.Lines.EndUpdate;
   pnlSobre.Show;
end;

procedure TfrmReportUI.LoadReports(const ParentNode: TTreeNode);
const
   SFilterFmt = 'CD_CATEGORIA = %d';
var
   DataSetReports, DataSetGroups: TDataSet;
   S: AnsiString;
   ParentId: Cardinal;
   Node: TTreeNode;
begin
   DataSetReports := FModule.cdsRelatorios;
   DataSetGroups := FModule.cdsCategorias;

   DataSetGroups.GotoBookmark(ParentNode.Data);
   ParentId := DataSetGroups.FieldByName('CD_CATEGORIA').AsInteger;

   if not DataSetReports.Active then
   begin
      DataSetReports.Open;
   end;

   S := Format(SFilterFmt, [ParentId]);
   DataSetReports.Filter := S;
   DataSetReports.Filtered := True;
   DataSetReports.First;

   while not DataSetReports.Eof do
   begin
      S := DataSetReports.FieldByName('NM_RELATORIO').AsString;
      Node := tvRelatorios.Items.AddChild(ParentNode, S);
      Node.ImageIndex := 2;
      Node.SelectedIndex := 2;
      Node.Data := DataSetReports.GetBookmark;
      DataSetReports.Next;
   end;

   DataSetReports.Filtered := False;
end;

function TfrmReportUI.LocateReport: Boolean;
var
   Bookmark: TBookmark;
begin
   Result := False;

   if (FSelectedNode <> nil) and (FSelectedNode.Data <> nil) then
   begin
      Bookmark := FSelectedNode.Data;
      
      Result := FModule.cdsRelatorios.BookmarkValid(Bookmark);
      if Result then
      begin
         FModule.cdsRelatorios.GotoBookmark(Bookmark);
      end;
   end;
end;

procedure TfrmReportUI.ManagePrivileges;
var
   ID: Cardinal;
   ItemName: AnsiString;
   NodeType: TNodeType;
begin
   NodeType := GetTypeSelectedNode;

   if NodeType = ntFile then
   begin
      if not GotoBookmark(FSelectedNode.Data, FModule.cdsRelatorios) then
         Exit;

      if FModule.cdsRelatoriosSN_CONCEDER.AsInteger <> 1 then
         Exit;

      ID := FModule.cdsRelatoriosCD_RELATORIO.AsLargeInt;
      ItemName := FModule.cdsRelatoriosNM_RELATORIO.AsString;
      TfrmReportUIPerms.ManageReportPrivileges(ID, ItemName);
   end;

   if FSelectedNode.ImageIndex <> 2 then
   begin
      if not GotoBookmark(FSelectedNode.Data, FModule.cdsCategorias) then
         Exit;
   
      if FModule.cdsCategoriasSN_CONCEDER.AsInteger <> 1 then
         Exit;

      ID := FModule.cdsCategoriasCD_CATEGORIA.AsLargeInt;
      ItemName := FModule.cdsCategoriasDS_CATEGORIA.AsString;
      TfrmReportUIPerms.ManageCategoryPrivileges(ID, ItemName);
   end;
end;

procedure TfrmReportUI.miPermissoesClick(Sender: TObject);
begin
   ManagePrivileges;
end;

procedure TfrmReportUI.miRenomearClick(Sender: TObject);
begin
   tvRelatorios.Selected.EditText;
end;

procedure TfrmReportUI.OnSelectReport;
var
   ReportSelected: Boolean;
begin
   if HasChangedSelection then
   begin
      TReportFilterFactory.Instance.Reset;

      ReportSelected := GetTypeSelectedNode = ntFile;

      if not ReportSelected then
      begin
         pnlSobre.Hide;
         pnlAjuda.Show;
      end;

      if ReportSelected and
         LocateReport then
      begin
         pnlAjuda.Hide;
         ShowOnlineHelp;
         LoadHelp;
         LoadFilters;
         LoadCustomFilters;
         TReportFilterFactory.Instance.Show;
      end;

      UpdateButtonStatus;
   end;
end;

procedure TfrmReportUI.OpenOnlineHelp;
var
   URL: AnsiString;
begin
   URL := FModule.cdsRelatoriosDS_LINK_HELP.AsString;
   ShellExecute(Handle, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmReportUI.pnlLegendasDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: Integer);
begin
   if pnlLegendas.Height = 0 then
      pnlLegendas.Height := 86;
end;

procedure TfrmReportUI.ShowOnlineHelp;
var
   URL: AnsiString;
begin
   URL := FModule.cdsRelatoriosDS_LINK_HELP.AsString;

   if URL <> '' then
   begin
      pnlSobreLink.Show;
   end;

   if URL = '' then
   begin
      pnlSobreLink.Hide;
   end;
end;

procedure TfrmReportUI.tvRelatoriosClick(Sender: TObject);
begin
   Perform(WM_SETREDRAW, WPARAM(False), 0);
   OnSelectReport;
   UpdateButtonStatus;
   Perform(WM_SETREDRAW, WPARAM(True), 0);
   RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_ALLCHILDREN);
end;

procedure TfrmReportUI.tvRelatoriosContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
   Node: TTreeNode;
   DataSet: TClientDataSet;
begin
   Handled := True;
   Node := tvRelatorios.GetNodeAt(MousePos.X, MousePos.Y);

   if Node = nil then
      Exit;

   tvRelatorios.Selected := Node;
   FSelectedNode := Node;

   if Node.ImageIndex in [0, 1] then
      DataSet := FModule.cdsCategorias;

   if Node.ImageIndex = 2 then
      DataSet := FModule.cdsRelatorios;

   if not GotoBookmark(Node.Data, DataSet) then
      Exit;

   Handled := False;

   miPermissoes.Enabled := DataSet.FieldByName('SN_CONCEDER').AsInteger = 1;
   miRenomear.Enabled := DataSet.FieldByName('SN_RENOMEAR').AsInteger = 1;
end;

procedure TfrmReportUI.tvRelatoriosCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
const
   NumberToColor: array[0..3] of TColor = (clRed, clWindowText, clBlue, clGreen);
var
   Bookmark, TmpBookmark: TBookmark;
   DataSet: TDataSet;
   PadraoID: Byte;
   Color: TColor;
begin
   if (Node.ImageIndex = 2) and (not (cdsSelected in State)) then
   begin
      DataSet := FModule.cdsRelatorios;
      Bookmark := DataSet.GetBookmark;

      TmpBookmark := TBookmark(Node.Data);
      DataSet.GotoBookmark(TmpBookmark);

      PadraoID := DataSet.FieldByName('NR_PADRAO').AsInteger;
      Color := NumberToColor[PadraoID];
      Sender.Canvas.Font.Color := Color;

      DataSet.GotoBookmark(Bookmark);
   end;
end;

procedure TfrmReportUI.tvRelatoriosEdited(Sender: TObject; Node: TTreeNode;
  var S: string);
var
   DataSet: TClientDataSet;
   FieldName: AnsiString;
begin
   if tvRelatorios.Selected = nil then
      Exit;
      
   if tvRelatorios.Selected.ImageIndex in [0, 1] then
   begin
      FieldName := 'DS_CATEGORIA';
      DataSet := FModule.cdsCategorias;
   end;
   
   if tvRelatorios.Selected.ImageIndex = 2 then
   begin
      FieldName := 'NM_RELATORIO';
      DataSet := FModule.cdsRelatorios;
   end;

   if not GotoBookmark(tvRelatorios.Selected.Data, DataSet) then
      Exit;

   DataSet.Edit;
   DataSet.FieldByName(FieldName).AsString := S;
   DataSet.Post;
   DataSet.ApplyUpdates(0);
   DataSet.Refresh;
end;

procedure TfrmReportUI.tvRelatoriosEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
var
   DataSet: TDataSet;
begin
   AllowEdit := False;  

   if tvRelatorios.Selected = nil then
      Exit;
   
   if tvRelatorios.Selected.ImageIndex in [0, 1] then
      DataSet := FModule.cdsCategorias;
      
   if tvRelatorios.Selected.ImageIndex = 2 then
      DataSet := FModule.cdsRelatorios;

   if not GotoBookmark(tvRelatorios.Selected.Data, DataSet) then
      Exit;
   
   AllowEdit := DataSet.FieldByName('SN_RENOMEAR').AsInteger = 1;
end;

procedure TfrmReportUI.tvRelatoriosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key <> VK_F2 then
      Exit;

   if tvRelatorios.Selected = nil then
      Exit;

   tvRelatorios.Selected.EditText;
end;

procedure TfrmReportUI.tvRelatoriosMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (Shift <> [ssCtrl]) or (Button <> mbLeft) then
      Exit;

   if FSelectedNode = nil then
      Exit;

   ManagePrivileges;
end;

procedure TfrmReportUI.UpdateButtonStatus;
var
   ReportSelected: Boolean;
begin
   ReportSelected := GetTypeSelectedNode = ntFile;
   btnLimpar.Enabled := ReportSelected;
   btnImprimir.Enabled := ReportSelected;
end;

end.
