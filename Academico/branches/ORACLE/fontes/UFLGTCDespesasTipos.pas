unit UFLGTCDespesasTipos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ImgList, ToolWin, ComCtrls, DB, DBClient,
   ZAbstractRODataset, UZDataset, StdCtrls, DBCtrls, Mask, SynEdit, SynDBEdit,
   SynEditHighlighter, SynHighlighterJScript, Buttons, Grids, DBGrids,
   ZAbstractDataset, UZSortedGrid, uUsuario, UMAjuda, uLkJSON;

type
   TfrmLGTCDespesasTipos = class(TForm)
      btnAlterar: TToolButton;
      btnCancelar: TToolButton;
      btnExcluir: TToolButton;
      btnFechar: TToolButton;
      btnIncluir: TToolButton;
      btnSalvar: TToolButton;
      btnSelecionarColunas: TToolButton;
      btnSep1: TToolButton;
      btnSep2: TToolButton;
      btnSep3: TToolButton;
      btnSep4: TToolButton;
      btnSep5: TToolButton;
      bvlSep1: TBevel;
      bvlSep2: TBevel;
      dbckAtivo: TDBCheckBox;
      dbckPadrao: TDBCheckBox;
      dbeCodigo: TDBEdit;
      dbeConta: TDBEdit;
      dbeDescricao: TDBEdit;
      dbgTiposDespesa: TZSortedGrid;
      dblcCampoAdicional: TDBLookupComboBox;
      dblcFornecedor: TDBLookupComboBox;
      dblcTipo: TDBLookupComboBox;
      dblcTipoTitulo: TDBLookupComboBox;
      dblcValor: TDBLookupComboBox;
      dsTiposDespesa: TDataSource;
      hlpFormula: TUMAjuda;
      hlpTipo: TUMAjuda;
      ilAcoes: TImageList;
      lblCampoAdicional: TLabel;
      lblCodigo: TLabel;
      lblConta: TLabel;
      lblDescricao: TLabel;
      lblFornecedor: TLabel;
      lblIcone: TLabel;
      lblObrigatoriedade: TLabel;
      lblTipo: TLabel;
      lblTipoTitulo: TLabel;
      lblValor: TLabel;
      pbIcone: TPaintBox;
      pnlCadastro: TPanel;
      pnlRegistros: TPanel;
      pnlTitulo: TPanel;
      qryCampos: TUMZReadOnlyQuery;
      qryCamposCD_CAMPO: TIntegerField;
      qryCamposDS_CAMPO: TStringField;
      qryCamposDS_TIPO: TStringField;
      qryDespesas: TUMZReadOnlyQuery;
      qryDespesasNR_TOTAL: TLargeintField;
      qryFornecimento: TUMZReadOnlyQuery;
      qryFornecimentoCD_FORNECEDOR: TSmallintField;
      qryFornecimentoDS_VALOR: TStringField;
      qryPlanos: TUMZReadOnlyQuery;
      qryPlanosCD_COLIGADA_MATRIZ: TIntegerField;
      qryPlanosCD_CONTA: TLargeintField;
      qryPlanosDS_CONTA: TStringField;
      qryTipos: TUMZReadOnlyQuery;
      qryTiposCD_TIPO: TLargeintField;
      qryTiposDespesa: TUMZQuery;
      qryTiposDespesaCD_CAMPO: TIntegerField;
      qryTiposDespesaCD_COLIGADA_MATRIZ: TIntegerField;
      qryTiposDespesaCD_CONTA: TLargeintField;
      qryTiposDespesaCD_FORNECEDOR: TSmallintField;
      qryTiposDespesaCD_TIPO: TLargeintField;
      qryTiposDespesaCD_TIPO_DESPESA: TLargeintField;
      qryTiposDespesaCD_TIPO_TITULO: TIntegerField;
      qryTiposDespesaCD_VALOR: TLargeintField;
      qryTiposDespesaDS_CAMPO: TStringField;
      qryTiposDespesaDS_CONTA: TStringField;
      qryTiposDespesaDS_FORNECEDOR: TStringField;
      qryTiposDespesaDS_TIPO: TStringField;
      qryTiposDespesaDS_TIPO_DESPESA: TStringField;
      qryTiposDespesaDS_TIPO_TITULO: TStringField;
      qryTiposDespesaDS_VALOR: TStringField;
      qryTiposDespesaDT_ALTERACAO: TDateTimeField;
      qryTiposDespesaDT_CADASTRO: TDateTimeField;
      qryTiposDespesaNR_ICONE: TIntegerField;
      qryTiposDespesaSN_ATIVO: TSmallintField;
      qryTiposDespesaSN_PADRAO: TSmallintField;
      qryTiposDS_CHAVE: TStringField;
      qryTiposDS_TIPO: TStringField;
      qryTiposTitulo: TUMZReadOnlyQuery;
      qryTiposTituloCD_TIPO_TITULO: TIntegerField;
      qryTiposTituloDS_TIPO_TITULO: TStringField;
      qryValores: TUMZReadOnlyQuery;
      qryValoresCD_VALOR: TLargeintField;
      qryValoresDS_CHAVE: TStringField;
      qryValoresDS_VALOR: TStringField;
      sbBuscarPlano: TSpeedButton;
      sbIcone: TSpeedButton;
      sbRemoverCampo: TSpeedButton;
      sbRemoverTipoTitulo: TSpeedButton;
      splSep: TSplitter;
      tlbAcoes: TToolBar;
    qryCamposTP_CAMPO: TStringField;
    qryCamposDS_NOME: TStringField;
    qryTiposDespesaDS_NOME_CAMPO: TStringField;
    procedure qryCamposCalcFields(DataSet: TDataSet);
      procedure btnAlterarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnIncluirClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnSelecionarColunasClick(Sender: TObject);
      procedure dbgTiposDespesaDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn;
         State: TGridDrawState);
      procedure dsTiposDespesaStateChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure pbIconePaint(Sender: TObject);
      procedure qryTiposDespesaAfterDelete(DataSet: TDataSet);
      procedure qryTiposDespesaAfterEdit(DataSet: TDataSet);
      procedure qryTiposDespesaAfterInsert(DataSet: TDataSet);
      procedure qryTiposDespesaAfterPost(DataSet: TDataSet);
      procedure qryTiposDespesaAfterScroll(DataSet: TDataSet);
      procedure qryTiposDespesaBeforeDelete(DataSet: TDataSet);
      procedure qryTiposDespesaCD_CONTAChange(Sender: TField);
      procedure qryTiposDespesaCD_FORNECEDORChange(Sender: TField);
      procedure qryTiposDespesaCD_TIPOChange(Sender: TField);
      procedure qryTiposDespesaCD_VALORChange(Sender: TField);
      procedure qryTiposDespesaDS_TIPO_DESPESAChange(Sender: TField);
      procedure qryTiposDespesaNR_ICONEChange(Sender: TField);
      procedure sbBuscarPlanoClick(Sender: TObject);
      procedure sbIconeClick(Sender: TObject);
      procedure sbRemoverCampoClick(Sender: TObject);
      procedure sbRemoverTipoTituloClick(Sender: TObject);
   private
      FPermissoes: TUMPermissoes;
      FOperacao: AnsiString;
      FID: AnsiString;
      FJSONObject: TlkJSONobject;
      function GetJSON: AnsiString;
      procedure LoadFont;
      property JSON: AnsiString read GetJSON;
   end;

const
   Modulo = 2101;

var
   frmLGTCDespesasTipos: TfrmLGTCDespesasTipos;

implementation

uses
   StrUtils, uDM, uSelConta, uCamposPlanilhas, UFCharacterMap, uIUMDataModule,
  uColigadaMatriz;

{$R *.dfm}

procedure TfrmLGTCDespesasTipos.btnAlterarClick(Sender: TObject);
begin
   qryTiposDespesa.Edit;
end;

procedure TfrmLGTCDespesasTipos.btnCancelarClick(Sender: TObject);
begin
   qryTiposDespesa.Cancel;
   dbeDescricao.Color := clWindow;
   dblcTipo.Color := clWindow;
   dblcValor.Color := clWindow;
   dbeConta.Color := clWindow;
end;

procedure TfrmLGTCDespesasTipos.btnExcluirClick(Sender: TObject);
const
   MsgTipoVinculadoInativo = 'Este tipo de despesa possui vínculo com %u despesa(s) de aula(s) e, portanto, não é possível efetuar a sua exclusão.';
   MsgTipoVinculadoAtivo = 'Este tipo de despesa possui vínculo com %u despesa(s) de aula(s) e, portanto, não é possível efetuar a sua exclusão. Deseja desativar este registro para impedir a criação de novas despesas deste tipo?';
   MsgConfirmaExclusao = 'Deseja realmente excluir o tipo de despesa configurado?';
   MsgErroExclusao = 'Ocorreu um erro na tentativa de efetuar a exclusão do tipo de despesa.';
var
   S: AnsiString;
begin
   qryDespesas.Close;
   qryDespesas.ParamByName('CD_TIPO_DESPESA').AsInteger := qryTiposDespesaCD_TIPO_DESPESA.AsLargeInt;
   qryDespesas.Open;

   if (not qryDespesas.IsEmpty) and (qryDespesasNR_TOTAL.AsLargeInt > 0) then
   begin

      if qryTiposDespesaSN_ATIVO.AsInteger = 1 then
      begin

         S := Format(MsgTipoVinculadoAtivo, [qryDespesasNR_TOTAL.AsLargeInt]);
         
         if MessageDlg(S, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
         begin
            qryTiposDespesa.DisableControls;
            qryTiposDespesa.Edit;
            qryTiposDespesaSN_ATIVO.AsInteger := 0;
            qryTiposDespesa.Post;
            qryTiposDespesa.EnableControls;
         end;
         
         Exit;
      end;

      if qryTiposDespesaSN_ATIVO.AsInteger = 0 then
      begin
         S := Format(MsgTipoVinculadoInativo, [qryDespesasNR_TOTAL.AsLargeInt]);
         MessageDlg(S, mtInformation, [mbOK], 0);
      end;

      qryDespesas.Close;
      Exit;

   end;

   qryDespesas.Close;

   if MessageDlg(MsgConfirmaExclusao, mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
   begin
      try
         qryTiposDespesa.Delete;
      except
         on E: Exception do
         begin
            MessageDlg(MsgErroExclusao, mtError, [mbOK], 0);
         end;
      end;
   end;
   
end;

procedure TfrmLGTCDespesasTipos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmLGTCDespesasTipos.btnIncluirClick(Sender: TObject);
begin
   dbeDescricao.SetFocus;
   qryTiposDespesa.Insert;
end;

procedure TfrmLGTCDespesasTipos.btnSalvarClick(Sender: TObject);
const
   MsgCamposObrigatorios = 'Preencha todos os campos obrigatórios para salvar o registro.';
var
   Save: Boolean;
begin
   Save := True;

   if Trim(dbeDescricao.Text) = EmptyStr then
   begin
      Save := False;
      dbeDescricao.Color := clInfoBk;
   end;

   if qryTiposDespesaCD_TIPO.IsNull then
   begin
      Save := False;
      dblcTipo.Color := clInfoBk;
   end;

   if qryTiposDespesaCD_VALOR.IsNull then
   begin
      Save := False;
      dblcValor.Color := clInfoBk;
   end;

   if qryTiposDespesaCD_CONTA.IsNull then
   begin
      Save := False;
      dbeConta.Color := clInfoBk;
   end;

   if qryTiposDespesaCD_FORNECEDOR.IsNull then
   begin
      Save := False;
      dblcFornecedor.Color := clInfoBk;
   end;

   if not Save then
      MessageDlg(MsgCamposObrigatorios, mtInformation, [mbOK], 0);   

   if Save then
      qryTiposDespesa.Post;
end;

procedure TfrmLGTCDespesasTipos.btnSelecionarColunasClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(dbgTiposDespesa)), 'Financeiro.Cadastro.GerenciamentoTiposDespesas');
end;

procedure TfrmLGTCDespesasTipos.dbgTiposDespesaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
   IsChecked: array[0..1] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if AnsiLeftStr(Column.Field.FieldName, 3) = 'SN_' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -2, -2);
      TDBGrid(Sender).Canvas.FillRect(Rect);
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsInteger]);
   end;
end;

procedure TfrmLGTCDespesasTipos.dsTiposDespesaStateChange(Sender: TObject);
begin
   btnSelecionarColunas.Enabled := dsBrowse = qryTiposDespesa.State;
   btnIncluir.Enabled := (npIncluir in FPermissoes) and (dsBrowse = qryTiposDespesa.State);
   btnAlterar.Enabled := (npAlterar in FPermissoes) and (dsBrowse = qryTiposDespesa.State);
   btnExcluir.Enabled := (npExcluir in FPermissoes) and (dsBrowse = qryTiposDespesa.State) and (not qryTiposDespesa.IsEmpty);
   btnSalvar.Enabled := qryTiposDespesa.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryTiposDespesa.State in [dsInsert, dsEdit];
   btnFechar.Enabled := dsBrowse = qryTiposDespesa.State;
   sbBuscarPlano.Enabled := qryTiposDespesa.State in [dsInsert, dsEdit];
   sbRemoverCampo.Enabled := qryTiposDespesa.State in [dsInsert, dsEdit];
   sbRemoverTipoTitulo.Enabled := qryTiposDespesa.State in [dsInsert, dsEdit];
   sbIcone.Enabled := qryTiposDespesa.State in [dsInsert, dsEdit];
end;

procedure TfrmLGTCDespesasTipos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryTiposDespesa.Close;
   qryValores.Close;
   qryTipos.Close;
   qryPlanos.Close;
   frmLGTCDespesasTipos := nil;
   Action := caFree;
end;

procedure TfrmLGTCDespesasTipos.FormCreate(Sender: TObject);
const
   SChave = 'UMFinanceiro.Cadastro.GerenciamentoTiposDespesas';
begin
   LoadFont;
   FPermissoes := DM.UsuarioLogado.GetPermissoes(DM.UsuarioLogado.Pessoa.Codigo, SChave);
   qryPlanos.Open;
   qryTipos.Open;
   qryValores.Open;
   qryTiposTitulo.ParamByName('CD_COLIGADA').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryTiposTitulo.Open;
   qryTiposDespesa.Open;
   DM.montarPlanilha(TDBGrid(TCustomDBGrid(dbgTiposDespesa)), 'Financeiro.Cadastro.GerenciamentoTiposDespesas');
end;

procedure TfrmLGTCDespesasTipos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if btnIncluir.Enabled then
            btnIncluir.Click;
      VK_F3:
         if btnAlterar.Enabled then
            btnAlterar.Click;
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

function TfrmLGTCDespesasTipos.GetJSON: AnsiString;
begin
   Result := UTF8Decode(TlkJSON.GenerateText(FJSONObject));
end;

procedure TfrmLGTCDespesasTipos.LoadFont;
var
   ResStream: TResourceStream;
   FontsCount: DWORD;
begin
   ResStream := TResourceStream.Create(HInstance, 'FontAwesome', 'TTF');
   try
      AddFontMemResourceEx(ResStream.Memory, ResStream.Size, nil, @FontsCount);
   finally
      FreeAndNil(ResStream);
   end;
end;

procedure TfrmLGTCDespesasTipos.pbIconePaint(Sender: TObject);
var
   PB: TPaintBox;
   S: WideString;
   R: TRect;
begin
   PB := TPaintBox(Sender);
   PB.Canvas.Font.Name := 'FontAwesome';
   PB.Canvas.Font.Size := 24;
   PB.Canvas.Font.Color := clWindowText;

   S := WideChar(qryTiposDespesaNR_ICONE.AsInteger);

   R := PB.Canvas.ClipRect;

   DrawTextW(PB.Canvas.Handle, PWideChar(S), Length(S), R,
      DT_CENTER or DT_VCENTER or DT_SINGLELINE);

   PB.Canvas.Brush.Color := clSkyBlue;
   PB.Canvas.FrameRect(R);
end;

procedure TfrmLGTCDespesasTipos.qryCamposCalcFields(DataSet: TDataSet);
const
   NameFmt = '%s - %s';
var
   S: AnsiString;
begin
   if DataSet.State = dsCalcFields then
   begin
      S := DataSet.FieldByName('DS_CAMPO').AsString;

      if DataSet.FieldByName('TP_CAMPO').AsString <> '' then
         S := Format(NameFmt, [S, DataSet.FieldByName('TP_CAMPO').AsString]);

      DataSet.FieldByName('DS_NOME').AsString := S;
   end;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaAfterDelete(DataSet: TDataSet);
begin
   DM.setLog(Modulo, 'Exclusão', FID, 0, JSON);
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaAfterEdit(DataSet: TDataSet);
var
   JSON: TlkJSONobject;
begin
   JSON := DM.RecordToJSON(DataSet);

   if Assigned(FJSONObject) then
      FreeAndNil(FJSONObject);

   FJSONObject := TlkJSONobject.Create(False);
   FJSONObject.Add('antigo', JSON);

   FOperacao := 'Alteração';

   DataSet.FieldByName('DT_ALTERACAO').AsDateTime := Now;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaAfterInsert(DataSet: TDataSet);
begin
   FOperacao := 'Inclusão';
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaAfterPost(DataSet: TDataSet);
var
   Chave: AnsiString;
begin

   if Assigned(FJSONObject) then
      FJSONObject.Add('novo', DM.RecordToJSON(DataSet));

   if not Assigned(FJSONObject) then
      FJSONObject := DM.RecordToJSON(DataSet);

   Chave := DataSet.FieldByName('CD_TIPO_DESPESA').AsString;
   DM.setLog(Modulo, FOperacao, Chave, 0, JSON);

   FreeAndNil(FJSONObject);
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaAfterScroll(DataSet: TDataSet);
begin
   pbIcone.Refresh;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaBeforeDelete(DataSet: TDataSet);
begin
   FID := DataSet.FieldByName('CD_TIPO_DESPESA').AsString;
   FJSONObject := DM.RecordToJSON(DataSet);
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaCD_CONTAChange(Sender: TField);
begin
   dbeConta.Color := clWindow;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaCD_FORNECEDORChange(
  Sender: TField);
begin
   dblcFornecedor.Color := clWindow;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaCD_TIPOChange(Sender: TField);
begin
   dblcTipo.Color := clWindow;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaCD_VALORChange(Sender: TField);
begin
   dblcValor.Color := clWindow;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaDS_TIPO_DESPESAChange(
  Sender: TField);
begin
   dbeDescricao.Color := clWindow;
end;

procedure TfrmLGTCDespesasTipos.qryTiposDespesaNR_ICONEChange(Sender: TField);
begin
   pbIcone.Repaint;
end;

procedure TfrmLGTCDespesasTipos.sbBuscarPlanoClick(Sender: TObject);
begin
   frm_SelConta.filtroContas := tpcSaidas;
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      qryTiposDespesaCD_CONTA.AsInteger := frm_SelConta.qyPlanosContasCD_CONTA.AsInteger;
      qryTiposDespesaCD_COLIGADA_MATRIZ.AsInteger := frm_SelConta.qyPlanosContasCD_COLIGADA_MATRIZ.AsInteger;
   end;
end;

procedure TfrmLGTCDespesasTipos.sbIconeClick(Sender: TObject);
begin
   if frmCharacterMap = nil then
      Application.CreateForm(TfrmCharacterMap, frmCharacterMap);

   if qryTiposDespesaNR_ICONE.IsNull then
      frmCharacterMap.ChosenChar := 0;

   if not qryTiposDespesaNR_ICONE.IsNull then
      frmCharacterMap.ChosenChar := qryTiposDespesaNR_ICONE.AsInteger;

   if frmCharacterMap.ShowModal = mrOk then
      qryTiposDespesaNR_ICONE.AsInteger := frmCharacterMap.ChosenChar;
end;

procedure TfrmLGTCDespesasTipos.sbRemoverCampoClick(Sender: TObject);
begin
   qryTiposDespesaCD_CAMPO.Clear;
end;

procedure TfrmLGTCDespesasTipos.sbRemoverTipoTituloClick(Sender: TObject);
begin
   qryTiposDespesaCD_TIPO_TITULO.Clear;
end;

end.
