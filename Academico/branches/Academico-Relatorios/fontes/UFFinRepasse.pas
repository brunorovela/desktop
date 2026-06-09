unit UFFinRepasse;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ToolWin, ComCtrls, ImgList, DB, ZAbstractRODataset,
   ZAbstractDataset, UZDataset, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
   UZSortedGrid, uUsuario, ZSqlUpdate, UZDbcFuncs, ZDbcIntfs, DateUtils;

type
   TfrmFinRepasse = class(TForm)
      btnCancelar: TToolButton;
      btnEditar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnSalvar: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnTurmaExcluir: TToolButton;
      btnTurmaIncluir: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      bvlSep5: TBevel;
      bvlSep6: TBevel;
      dbchAtivo: TDBCheckBox;
      dbeCodigo: TDBEdit;
      dbeContratante: TDBEdit;
      dbeDescricao: TDBEdit;
      dbeUnidade: TDBEdit;
      dbeValor: TDBEdit;
      dbeVencimento: TDBEdit;
      dbgContratos: TZSortedGrid;
      dbgTurmas: TZSortedGrid;
      dblcTipoTitulo: TDBLookupComboBox;
      dbrgTipo: TDBRadioGroup;
      dsContratos: TDataSource;
      dsTurmas: TDataSource;
      ilAcoes: TImageList;
      ilTurmas: TImageList;
      lblCodigo: TLabel;
      lblContratante: TLabel;
      lblDescricao: TLabel;
      lblTipoTitulo: TLabel;
      lblTurmas: TLabel;
      lblUnidade: TLabel;
      lblValor: TLabel;
      lblVencimento: TLabel;
      odlgAnexo: TOpenDialog;
      pnlDados: TPanel;
      pnlDadosBasico: TPanel;
      pnlRegistros: TPanel;
      pnlRegistrosTitulo: TPanel;
      pnlTitulo: TPanel;
      pnlTituloDados: TPanel;
      pnlTurmas: TPanel;
      pnlTurmasGrade: TPanel;
      qryAnexo: TUMZQuery;
      qryAnexoCD_CONTRATO: TLargeintField;
      qryAnexoME_ANEXO: TBlobField;
      qryAnexoNM_ANEXO: TStringField;
      qryContratos: TUMZQuery;
      qryContratosCD_COLIGADA: TIntegerField;
      qryContratosCD_CONTRATO: TLargeintField;
      qryContratosCD_PESSOA: TIntegerField;
      qryContratosCD_TIPO: TSmallintField;
      qryContratosCD_TIPO_TITULO: TIntegerField;
      qryContratosDS_CONTRATO: TStringField;
      qryContratosDS_TIPO_TITULO: TStringField;
      qryContratosNM_COLIGADA: TStringField;
      qryContratosNM_PESSOA: TStringField;
      qryContratosNM_TIPO: TStringField;
      qryContratosNR_DIA_VENCIMENTO: TSmallintField;
      qryContratosSN_ANEXO: TLargeintField;
      qryContratosSN_ATIVO: TSmallintField;
      qryContratosVL_CONTRATO: TFloatField;
      qryContratosVL_CONTRATO_FMT: TStringField;
      qryTiposTitulo: TUMZReadOnlyQuery;
      qryTiposTituloCD_TIPO_TITULO: TIntegerField;
      qryTiposTituloDS_TIPO_TITULO: TStringField;
      qryTurmas: TUMZQuery;
      qryTurmasCD_CONTRATO: TLargeintField;
      qryTurmasCD_TURMA: TStringField;
      qryTurmasDT_REFERENCIA: TDateField;
      qryTurmasNR_ANOSEMESTRE: TIntegerField;
      qryTurmasNR_PARCELAS: TSmallintField;
      qryTurmasSN_ATIVO: TSmallintField;
      qryTurmasVL_REPASSE: TFloatField;
      sbCalcular: TSpeedButton;
      sbColigada: TSpeedButton;
      sbContratante: TSpeedButton;
      sbDownload: TSpeedButton;
      sbUpload: TSpeedButton;
      sdlgAnexo: TSaveDialog;
      splSep1: TSplitter;
      tlbAcoes: TToolBar;
      tlbTurmas: TToolBar;
      updContratos: TZUpdateSQL;
    updTurmas: TZUpdateSQL;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnEditarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnTurmaExcluirClick(Sender: TObject);
      procedure btnTurmaIncluirClick(Sender: TObject);
      procedure dbgContratosDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dbgTurmasDrawColumnCell(Sender: TObject; const Rect: TRect;
         DataCol: Integer; Column: TColumn; State: TGridDrawState);
      procedure dsContratosDataChange(Sender: TObject; Field: TField);
      procedure dsContratosStateChange(Sender: TObject);
      procedure dsTurmasDataChange(Sender: TObject; Field: TField);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure qryContratosAfterRefresh(DataSet: TDataSet);
      procedure qryContratosCalcFields(DataSet: TDataSet);
      procedure qryContratosCD_COLIGADAChange(Sender: TField);
      procedure sbCalcularClick(Sender: TObject);
      procedure sbColigadaClick(Sender: TObject);
      procedure sbContratanteClick(Sender: TObject);
      procedure sbDownloadClick(Sender: TObject);
      procedure sbUploadClick(Sender: TObject);
   private
      FCurrentID: Integer;
      FPermissoes: TUMPermissoes;
      FPermissoesTurma: TUMPermissoes;
      FPermissoesRepasse: TUMPermissoes;
      procedure UpdateButtonStatus;
   end;

var
   frmFinRepasse: TfrmFinRepasse;

implementation

uses
   uDM, uFSelecionarPessoa, uFSelecionarTurma, uFSelecionarColigada, uColigada,
   UFFinRepasseTurma, UFFinRepasseAluno;

{$R *.dfm}

procedure TfrmFinRepasse.btnCancelarClick(Sender: TObject);
begin
   qryContratos.Cancel;
   qryContratos.Refresh;
end;

procedure TfrmFinRepasse.btnEditarClick(Sender: TObject);
begin
   qryContratos.Edit;
   dbeDescricao.SetFocus;
end;

procedure TfrmFinRepasse.btnExcluirClick(Sender: TObject);
const
   MsgPossuiTurmas = 'Este contrato possui turmas vinculadas, portanto, não é possível efetuar a sua exclusão. Deseja apenas desativar este contrato para impedir a criação de novos lançamentos?';
   MsgQuestion = 'Tem certeza que deseja remover o registro de contrato selecionado?';
   MsgCaption = 'Confirmação';
var
   S: PChar;
   HasTurmas: Boolean;
   UserChoice: Integer;
begin
   S := MsgQuestion;
   HasTurmas := not qryTurmas.IsEmpty;
   
   if HasTurmas then
      S := MsgPossuiTurmas;

   UserChoice := MessageBox(0, S, MsgCaption,
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

   if UserChoice = ID_YES then
   begin
      if HasTurmas then
      begin
         qryContratos.Edit;
         qryContratosSN_ATIVO.AsInteger := 0;
         qryContratos.Post;
      end;

      if not HasTurmas then
         qryContratos.Delete;

      qryContratos.Refresh;
      UpdateButtonStatus;
   end;
end;

procedure TfrmFinRepasse.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmFinRepasse.btnIncluirClick(Sender: TObject);
begin
   qryContratos.Insert;
   dbeDescricao.SetFocus;
end;

procedure TfrmFinRepasse.btnSalvarClick(Sender: TObject);
begin
   qryContratos.Post;
   qryContratos.Refresh;
end;

procedure TfrmFinRepasse.btnTurmaExcluirClick(Sender: TObject);
const
   SQLFindRepasse = ''
      + ' SELECT '
      + ' 	COUNT(*) '
      + ' FROM '
      + ' 	CONV_REPASSES R '
      + ' WHERE '
      + ' 	R.CD_CONTRATO = ? AND '
      + ' 	R.CD_TURMA = ? AND '
      + ' 	R.NR_ANOSEMESTRE = ? ';

   MsgQuestion = 'Tem certeza que deseja remover o vínculo da turma com este contrato?';
   MsgPossuiTitulos = 'Esta turma já possui títulos de repasse lançados, portanto, não é possível efetuar sua exclusão. Antes de efetuar a exclusão da turma, é necessário excluir todos os lançamentos vinculados.';
   MsgCaptionInfo = 'Informação';
   MsgCaptionQuest = 'Confirmação';
var
   UserChoice: Integer;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   HasTitulos: Boolean;
begin
   HasTitulos := False;
   
   Stmt := PrepareStatement(SQLFindRepasse);
   try
      Stmt.SetInt(1, qryTurmasCD_CONTRATO.AsLargeInt);
      Stmt.SetString(2, qryTurmasCD_TURMA.AsString);
      Stmt.SetInt(3, qryTurmasNR_ANOSEMESTRE.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            HasTitulos := Rs.GetInt(1) > 0;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if HasTitulos then
   begin
      MessageBox(0, MsgPossuiTitulos, MsgCaptionInfo, MB_ICONWARNING or MB_OK);
   end;

   if not HasTitulos then
   begin
      UserChoice := MessageBox(0, MsgQuestion, MsgCaptionQuest,
         MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);

      if UserChoice = ID_YES then
         qryTurmas.Delete;
   end;
end;

procedure TfrmFinRepasse.btnTurmaIncluirClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroTurma;
   Bloqueios: TBloqueioFiltroTurma;
   ColigadaId, UserChoice: Integer;
begin

   Bloqueios := [];
   ColigadaId := -1;

   if not qryContratosCD_COLIGADA.IsNull then
   begin
      Include(Bloqueios, bftColigada);
      ColigadaId := qryContratosCD_COLIGADA.AsInteger;
   end;

   ResultadoFiltro := TfrmSelecionarTurma.Filtrar(Bloqueios, -1, ColigadaId);

   if ResultadoFiltro.filtrado then
   begin
   
      qryTurmas.Insert;
      qryTurmasCD_CONTRATO.AsInteger := qryContratosCD_CONTRATO.AsLargeInt;
      qryTurmasCD_TURMA.AsString := ResultadoFiltro.cd_turma;
      qryTurmasNR_ANOSEMESTRE.AsInteger := ResultadoFiltro.nr_anosemestre;
      qryTurmasVL_REPASSE.AsFloat := qryContratosVL_CONTRATO.AsFloat;
      qryTurmasDT_REFERENCIA.AsDateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
      qryTurmas.Post;

      if ColigadaId = -1 then
      begin
         qryContratos.Edit;
         qryContratosCD_COLIGADA.AsInteger := ResultadoFiltro.cd_coligada;
         dbeUnidade.Text := ResultadoFiltro.nm_coligada;
      end;

      UpdateButtonStatus;
   end;
   
end;

procedure TfrmFinRepasse.dbgContratosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (
      DFCS_BUTTONCHECK or DFCS_MONO,
      DFCS_BUTTONCHECK or DFCS_MONO or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.FieldName = 'SN_ATIVO' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger = 1]);
   end;

   if Column.FieldName <> 'SN_ATIVO' then
   begin
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;
end;

procedure TfrmFinRepasse.dbgTurmasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[Boolean] of Integer = (
      DFCS_BUTTONCHECK or DFCS_MONO,
      DFCS_BUTTONCHECK or DFCS_MONO or DFCS_CHECKED);
var
   BtnLeft, BtnTop, BtnWidth, BtnHeight: Integer;
   DrawRect: TRect;
begin
   if Column.FieldName = 'SN_ATIVO' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger = 1]);
   end;

   if (DataCol = 2) and
      (gdSelected in State) then
   begin
      sbCalcular.Visible := (not qryTurmas.IsEmpty);
      sbCalcular.Parent := dbgTurmas;
      BtnLeft := Rect.Left;
      BtnTop := Rect.Top;
      BtnWidth := Rect.Right - Rect.Left;
      BtnHeight := Rect.Bottom - Rect.Top;
      sbCalcular.SetBounds(BtnLeft, BtnTop, BtnWidth, BtnHeight);
      sbCalcular.Enabled := npAcesso in FPermissoesRepasse;
   end;
end;

procedure TfrmFinRepasse.dsContratosDataChange(Sender: TObject; Field: TField);
begin
   if qryContratosCD_TIPO.AsInteger = 0 then
   begin
      qryContratosVL_CONTRATO.DisplayFormat := '###,###,##0.00 %';
   end;

   if qryContratosCD_TIPO.AsInteger = 1 then
   begin
      qryContratosVL_CONTRATO.DisplayFormat := 'R$ ###,###,##0.00';
   end;

   qryTiposTitulo.Close;
   qryTiposTitulo.ParamByName('CD_COLIGADA').AsInteger := qryContratosCD_COLIGADA.AsInteger;
   qryTiposTitulo.Open;

   UpdateButtonStatus;
end;

procedure TfrmFinRepasse.dsContratosStateChange(Sender: TObject);
begin
   UpdateButtonStatus;

   if qryContratos.State = dsEdit then
      FCurrentID := qryContratosCD_CONTRATO.AsInteger;

   if qryContratos.State = dsInsert then
      FCurrentID := 0;
end;

procedure TfrmFinRepasse.dsTurmasDataChange(Sender: TObject; Field: TField);
begin
   btnTurmaExcluir.Enabled :=
      (npExcluir in FPermissoesTurma) and
      (qryTurmasSN_ATIVO.AsInteger = 1);
end;

procedure TfrmFinRepasse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryTurmas.Close;
   qryContratos.Close;
   qryTiposTitulo.Close;
   frmFinRepasse := nil;
   Action := caFree;
end;

procedure TfrmFinRepasse.FormCreate(Sender: TObject);
const
   ChaveCadastro = 'UMFinanceiro.Contratos.Cadastro';
   ChaveTurmas = 'UMFinanceiro.Contratos.Turmas';
   ChaveRepasse = 'UMFinanceiro.Contratos.IndicaoRepasse';
begin
   FPermissoes := DM.UsuarioLogado.GetPermissoes(0, ChaveCadastro);
   FPermissoesTurma := DM.UsuarioLogado.GetPermissoes(0, ChaveTurmas);
   FPermissoesRepasse := DM.UsuarioLogado.GetPermissoes(0, ChaveRepasse);

   qryTiposTitulo.ParamByName('CD_COLIGADA').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryTiposTitulo.Open;
   qryContratos.Open;
   qryTurmas.Open;

   UpdateButtonStatus;
   sbCalcular.Parent := nil;
end;

procedure TfrmFinRepasse.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if btnIncluir.Enabled then
            btnIncluir.Click;
      VK_F3:
         if btnEditar.Enabled then
            btnEditar.Click;

      VK_F9:
         if btnExcluir.Enabled then
            btnExcluir.Click;

      VK_F5:
         if btnSalvar.Enabled then
            btnSalvar.Click;

      VK_F6:
         if btnCancelar.Enabled then
            btnCancelar.Click;

      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;     
   end;
end;

procedure TfrmFinRepasse.qryContratosAfterRefresh(DataSet: TDataSet);
const
   SQLFindLast = 'SELECT MAX(CD_CONTRATO) FROM CONV_CONTRATOS';
var
   Rs: IZResultSet;
begin
   if FCurrentID = 0 then
   begin
      Rs := ExecuteQuery(SQLFindLast);
      try
         if Rs.Next then
            FCurrentID := Rs.GetInt(1);
      finally
         Rs.Close;
         Rs := nil;
      end;
   end;

   qryContratos.Locate('CD_CONTRATO', FCurrentID, []);
end;

procedure TfrmFinRepasse.qryContratosCalcFields(DataSet: TDataSet);
const
   ValueFmtPercents = '%.2f %%';
   ValueFmtCurrency = 'R$ %.2f';
begin
   qryContratosNM_TIPO.AsString := dbrgTipo.Items[qryContratosCD_TIPO.AsInteger];

   if qryContratosCD_TIPO.AsInteger = 0 then
   begin
      qryContratosVL_CONTRATO_FMT.AsString :=
         Format(ValueFmtPercents, [qryContratosVL_CONTRATO.AsFloat]);
   end;

   if qryContratosCD_TIPO.AsInteger = 1 then
   begin
      qryContratosVL_CONTRATO_FMT.AsString :=
         Format(ValueFmtCurrency, [qryContratosVL_CONTRATO.AsFloat]);
   end;
end;

procedure TfrmFinRepasse.qryContratosCD_COLIGADAChange(Sender: TField);
begin
   qryTiposTitulo.Close;
   qryTiposTitulo.ParamByName('CD_COLIGADA').AsInteger := qryContratosCD_COLIGADA.AsInteger;
   qryTiposTitulo.Open;
end;

procedure TfrmFinRepasse.sbCalcularClick(Sender: TObject);
var
   Response: Boolean;
begin
   if qryContratosCD_TIPO.AsInteger = 1 then
   begin
      Response := TfrmFinRepasseTurma.Edit(
         Mouse.CursorPos.X,
         Mouse.CursorPos.Y,
         qryTurmasCD_CONTRATO.AsInteger,
         qryTurmasNR_ANOSEMESTRE.AsInteger,
         qryTurmasCD_TURMA.AsString);

      if Response then
         qryTurmas.Refresh;
   end;

   if qryContratosCD_TIPO.AsInteger = 0 then
   begin

      Response := TfrmFinRepasseAluno.Edit(
         qryContratosCD_CONTRATO.AsInteger,
         qryTurmasNR_ANOSEMESTRE.AsInteger,
         qryTurmasCD_TURMA.AsString);

      if Response then
         qryTurmas.Refresh;

   end;
end;

procedure TfrmFinRepasse.sbColigadaClick(Sender: TObject);
var
   Coligada: TColigada;
begin
   if TfrmSelecionarColigada.GetInstancia.ShowModal then
   begin
      Coligada := TfrmSelecionarColigada.getResultado;

      if Coligada <> nil then
      begin
         if not (qryContratos.State in dsEditModes) then
         begin
            if not qryContratos.IsEmpty then
               qryContratos.Edit;

            if qryContratos.IsEmpty then
               qryContratos.Insert;
         end;

         qryContratosCD_COLIGADA.AsInteger := Coligada.Codigo;
         dbeUnidade.Text := Coligada.Nome;
      end;
   end;
end;

procedure TfrmFinRepasse.sbContratanteClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([]);

   if ResultadoFiltro.filtrado then
   begin
      if not (qryContratos.State in dsEditModes) then
      begin
         if not qryContratos.IsEmpty then
            qryContratos.Edit;

         if qryContratos.IsEmpty then
            qryContratos.Insert;
      end;
      qryContratosCD_PESSOA.AsInteger := ResultadoFiltro.cd_pessoa;
      dbeContratante.Text := ResultadoFiltro.nm_pessoa;
   end;
end;

procedure TfrmFinRepasse.sbDownloadClick(Sender: TObject);
begin
   if sdlgAnexo.Execute then
   begin
      qryAnexo.Open;
      qryAnexoME_ANEXO.SaveToFile(sdlgAnexo.FileName);
      qryAnexo.Close;
   end;
end;

procedure TfrmFinRepasse.sbUploadClick(Sender: TObject);
begin
   if odlgAnexo.Execute then
   begin
      qryAnexo.Open;

      if not qryAnexo.IsEmpty then
         qryAnexo.Edit;

      if qryAnexo.IsEmpty then
      begin
         qryAnexo.Insert;
         qryAnexoCD_CONTRATO.AsInteger := qryContratosCD_CONTRATO.AsInteger;
      end;

      qryAnexoME_ANEXO.LoadFromFile(odlgAnexo.FileName);
      qryAnexoNM_ANEXO.AsString := odlgAnexo.FileName;
      qryAnexo.Post;
      qryAnexo.Close;
      qryContratos.Refresh;
   end;
end;

procedure TfrmFinRepasse.UpdateButtonStatus;
begin
   btnIncluir.Enabled :=
      (qryContratos.State = dsBrowse) and
      (npIncluir in FPermissoes);
      
   btnEditar.Enabled :=
      (not qryContratos.IsEmpty) and
      (qryContratos.State = dsBrowse) and
      (npAlterar in FPermissoes);

   btnExcluir.Enabled :=
      (not qryContratos.IsEmpty) and
      (qryContratos.State = dsBrowse) and
      (npExcluir in FPermissoes);

   btnSalvar.Enabled := qryContratos.State in dsEditModes;
   btnCancelar.Enabled := qryContratos.State in dsEditModes;
   btnFechar.Enabled := qryContratos.State = dsBrowse;

   sbDownload.Enabled :=
      (qryContratos.State = dsBrowse) and
      (qryContratosSN_ANEXO.AsLargeInt = 1);

   sbUpload.Enabled := qryContratos.State in dsEditModes;

   btnTurmaIncluir.Enabled :=
      (not qryContratos.IsEmpty) and
      (qryContratos.State = dsBrowse) and
      (npIncluir in FPermissoesTurma);

   btnTurmaExcluir.Enabled :=
      (not qryTurmas.IsEmpty) and
      (qryContratos.State = dsBrowse) and
      (npExcluir in FPermissoesTurma);

   sbContratante.Enabled :=
      (npIncluir in FPermissoes) or
      (
         (npAlterar in FPermissoes) and (not qryContratos.IsEmpty)
      );
end;

end.
