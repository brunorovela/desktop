unit UFLGTCDespesa;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DBCtrls, DB, StdCtrls, Mask, ExtCtrls, Buttons, FileCtrl,
   ZAbstractRODataset, UZDataset, UFLGTCValorBase, ZAbstractDataset,
   ZSqlUpdate, uLkJSON;

type
   TfrmLGTCDespesa = class(TFrame)
      dbeArquivo: TDBEdit;
      dbeFornecedor: TDBEdit;
      dbeObservacao: TDBEdit;
      dbePlano: TDBEdit;
      dblcSituacao: TDBLookupComboBox;
      dblcTipoTitulo: TDBLookupComboBox;
      dsAnexo: TDataSource;
      dsDespesa: TDataSource;
      lblArquivo: TLabel;
      lblDescricao: TLabel;
      lblFornecedor: TLabel;
      lblPlano: TLabel;
      lblSituacao: TLabel;
      lblTipoTitulo: TLabel;
      odlgAnexo: TOpenDialog;
      pnlDados: TPanel;
      pnlDescricao: TPanel;
      pnlValor: TPanel;
      qryAnexo: TUMZQuery;
      qryAnexoBB_ANEXO: TBlobField;
      qryAnexoCD_ANEXO: TLargeintField;
      qryAnexoCD_DESPESA: TLargeintField;
      qryAnexoNM_ARQUIVO: TStringField;
      qryAnexoNR_TAMANHO: TFloatField;
      qryCargaHoraria: TUMZReadOnlyQuery;
      qryCargaHorariaVL_VALOR: TFloatField;
      qryDespesa: TUMZQuery;
      qryDespesaCD_COLIGADA_MATRIZ: TIntegerField;
      qryDespesaCD_CONTA: TLargeintField;
      qryDespesaCD_DESPESA: TLargeintField;
      qryDespesaCD_DIARIO_AULA: TLargeintField;
      qryDespesaCD_FORNECEDOR: TIntegerField;
      qryDespesaCD_SITUACAO: TLargeintField;
      qryDespesaCD_TIPO_DESPESA: TLargeintField;
      qryDespesaCD_TIPO_TITULO: TIntegerField;
      qryDespesaDS_CHAVE: TStringField;
      qryDespesaDS_CONTA: TStringField;
      qryDespesaDS_OBSERVACAO: TStringField;
      qryDespesaDS_SITUACAO: TStringField;
      qryDespesaDS_TIPO_TITULO: TStringField;
      qryDespesaDT_ALTERACAO: TDateTimeField;
      qryDespesaDT_CADASTRO: TDateTimeField;
      qryDespesaDT_COMPROMISSO: TDateTimeField;
      qryDespesaME_JSON_VALOR: TMemoField;
      qryDespesaNM_FORNECEDOR: TStringField;
      qryDespesaVL_TOTAL: TFloatField;
      qryFornecedor: TUMZReadOnlyQuery;
      qryFornecedorCD_PESSOA: TIntegerField;
      qryFornecedorNM_PESSOA: TStringField;
      qryPlanos: TUMZReadOnlyQuery;
      qryPlanosCD_COLIGADA_MATRIZ: TIntegerField;
      qryPlanosCD_CONTA: TLargeintField;
      qryPlanosDS_CONTA: TStringField;
      qrySituacoes: TUMZReadOnlyQuery;
      qrySituacoesCD_SITUACAO: TLargeintField;
      qrySituacoesDS_CHAVE: TStringField;
      qrySituacoesDS_COR: TStringField;
      qrySituacoesDS_SITUACAO: TStringField;
      qryTiposTitulo: TUMZReadOnlyQuery;
      qryTiposTituloCD_TIPO_TITULO: TIntegerField;
      qryTiposTituloDS_TIPO_TITULO: TStringField;
      qryValores: TUMZReadOnlyQuery;
      qryValoresCD_TIPO_DESPESA: TLargeintField;
      qryValoresCD_VALOR: TLargeintField;
      qryValoresDS_CHAVE: TStringField;
      qryValoresDS_VALOR: TStringField;
      qryValorExtra: TUMZReadOnlyQuery;
      qryValorExtraDS_CONTEUDO: TStringField;
      sbArquivo: TSpeedButton;
      sbBuscarFornecedor: TSpeedButton;
      sbBuscarPlano: TSpeedButton;
      sbDownloadAnexo: TSpeedButton;
      procedure qryDespesaAfterPost(DataSet: TDataSet);
      procedure qryDespesaCD_FORNECEDORChange(Sender: TField);
      procedure qryDespesaCD_SITUACAOChange(Sender: TField);
      procedure qryDespesaCD_TIPO_TITULOChange(Sender: TField);
      procedure qryDespesaDS_CONTAChange(Sender: TField);
      procedure qryDespesaDS_OBSERVACAOChange(Sender: TField);
      procedure sbArquivoClick(Sender: TObject);
      procedure sbBuscarFornecedorClick(Sender: TObject);
      procedure sbBuscarPlanoClick(Sender: TObject);
      procedure sbDownloadAnexoClick(Sender: TObject);
   private
      FFrameValor: TfrmLGTCValorBase;
      FOperacao: AnsiString;
      FJSONObject: TlkJSONobject;
      procedure CreateFrame(const TipoValor: AnsiString);
      procedure FindExtraValue;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function CanSave: Boolean;
      procedure HighlightControls;
      procedure Load(const DespesaID: UINT); overload;
      procedure Load(const TipoDespesaID, AulaID, FornecedorID, ContaID,
         ColigadaID, TipoTituloID: UINT; const TipoValor: AnsiString); overload;
      procedure Post;
      procedure Cancel;
   end;

implementation

uses
   General, uSelConta, UFLGTCValorKM, UFLGTCValorQuantidade, UFLGTCValorTotal,
   UFLGTCValorAula, uFSelecionarPessoa, uDM;

{$R *.dfm}

const
   Modulo = 2102;

procedure TfrmLGTCDespesa.Cancel;
begin
   if qryAnexo.State in [dsInsert, dsEdit] then
      qryAnexo.Cancel;

   if qryDespesa.State in [dsInsert, dsEdit] then
      qryDespesa.Cancel;
end;

function TfrmLGTCDespesa.CanSave: Boolean;
begin
   Result :=
      FFrameValor.CanSave and
      (not qryDespesaDS_OBSERVACAO.IsNull) and
      (not qryDespesaCD_FORNECEDOR.IsNull) and
      (not qryDespesaDS_CONTA.IsNull) and
      (not qryDespesaCD_SITUACAO.IsNull) and
      (not qryDespesaCD_TIPO_TITULO.IsNull);
end;

constructor TfrmLGTCDespesa.Create(AOwner: TComponent);
begin
   inherited;
   qrySituacoes.Open;
   qryPlanos.Open;
   qryFornecedor.Open;
   qryValores.Open;
   qryTiposTitulo.ParamByName('CD_COLIGADA').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryTiposTitulo.Open;
end;

procedure TfrmLGTCDespesa.CreateFrame(const TipoValor: AnsiString);
type
   TfrmLGTCValorBaseClass = class of TfrmLGTCValorBase;
const
   ClassNameFmt = 'TfrmLGTCValor%s';
var
   ClassRef: TPersistentClass;
begin
   ClassRef := FindClass(Format(ClassNameFmt, [TipoValor]));

   if Assigned(ClassRef) then
   begin
      FFrameValor := TfrmLGTCValorBaseClass(ClassRef).Create(Application);
      FFrameValor.Name := EmptyStr;
      FFrameValor.Parent := pnlValor;
   end;
end;

destructor TfrmLGTCDespesa.Destroy;
begin
   qryAnexo.Close;
   qryDespesa.Close;
   qryValores.Close;
   qryFornecedor.Close;
   qryPlanos.Close;
   qrySituacoes.Close;
   FFrameValor.Free;
   FreeAndNil(FJSONObject);
   inherited;
end;

procedure TfrmLGTCDespesa.FindExtraValue;
begin
   qryValorExtra.Close;
   qryValorExtra.ParamByName('CD_PESSOA').AsInteger := qryDespesaCD_FORNECEDOR.AsInteger;
   qryValorExtra.ParamByName('CD_TIPO_DESPESA').AsInteger := qryDespesaCD_TIPO_DESPESA.AsInteger;
   qryValorExtra.Open;

   if (not qryValorExtra.IsEmpty) and
      (qryValorExtraDS_CONTEUDO.AsString <> '') then
      FFrameValor.SetExtraValue(qryValorExtraDS_CONTEUDO.AsString);

   qryValorExtra.Close;
end;

procedure TfrmLGTCDespesa.HighlightControls;
begin
   FFrameValor.HighlightControls;

   if qryDespesaDS_OBSERVACAO.IsNull then
      dbeObservacao.Color := clInfoBk;

   if qryDespesaCD_FORNECEDOR.IsNull then
      dbeFornecedor.Color := clInfoBk;

   if qryDespesaDS_CONTA.IsNull then
      dbePlano.Color := clInfoBk;

   if qryDespesaCD_SITUACAO.IsNull then
      dbePlano.Color := clInfoBk;

   if qryDespesaCD_TIPO_TITULO.IsNull then
      dblcTipoTitulo.Color := clInfoBk;
end;

procedure TfrmLGTCDespesa.Load(const DespesaID: UINT);
var
   JSON: TlkJSONobject;
begin
   FOperacao := 'Alteração';
   
   qryDespesa.Close;
   qryDespesa.ParamByName('CD_DESPESA').AsInteger := DespesaID;
   qryDespesa.Open;

   CreateFrame(qryDespesaDS_CHAVE.AsString);

   qryFornecedor.Close;
   qryFornecedor.ParamByName('CD_FORNECEDOR').AsInteger := qryDespesaCD_FORNECEDOR.AsInteger;
   qryFornecedor.Open;

   qryDespesa.Refresh;
   qryDespesa.Edit;

   qryAnexo.Close;
   qryAnexo.ParamByName('CD_DESPESA').AsInteger := DespesaID;
   qryAnexo.Open;

   JSON := DM.RecordToJSON(qryDespesa);

   if qryAnexo.IsEmpty then
      JSON.Add('anexo', TlkJSONnull.Create);

   if not qryAnexo.IsEmpty then
      JSON.Add('anexo', DM.RecordToJSON(qryAnexo));

   FJSONObject := TlkJSONobject.Create(False);
   FJSONObject.Add('antigo', JSON);

   FFrameValor.JSON := qryDespesaME_JSON_VALOR.AsString;
end;

procedure TfrmLGTCDespesa.Load(const TipoDespesaID, AulaID, FornecedorID,
  ContaID, ColigadaID, TipoTituloID: UINT; const TipoValor: AnsiString);
begin
   FOperacao := 'Inclusão';
   
   CreateFrame(TipoValor);

   qryFornecedor.Close;
   qryFornecedor.ParamByName('CD_FORNECEDOR').AsInteger := FornecedorID;
   qryFornecedor.Open;

   qryDespesa.Open;
   qryDespesa.Insert;
   qryDespesaCD_TIPO_DESPESA.AsLargeInt := TipoDespesaID;

   if FornecedorID <> 0 then
      qryDespesaCD_FORNECEDOR.AsInteger := FornecedorID;

   qryDespesaCD_CONTA.AsLargeInt := ContaID;
   qryDespesaCD_COLIGADA_MATRIZ.AsInteger := ColigadaID;
   qryDespesaCD_DIARIO_AULA.AsLargeInt := AulaID;

   if TipoTituloID <> 0 then
      qryDespesaCD_TIPO_TITULO.AsInteger := TipoTituloID;

   if qrySituacoes.Locate('DS_CHAVE', 'definir', []) then
      qryDespesaCD_SITUACAO.AsLargeInt := qrySituacoesCD_SITUACAO.AsLargeInt;

   qryAnexo.Open;

   FindExtraValue;

   if FFrameValor is TfrmLGTCValorAula then
   begin
      qryCargaHoraria.ParamByName('CD_DIARIO_AULA').AsInteger := AulaID;
      qryCargaHoraria.Open;

      if not qryCargaHoraria.IsEmpty then
         FFrameValor.SetField('VL_CARGA_HORARIA', qryCargaHorariaVL_VALOR.AsFloat);

      qryCargaHoraria.Close;
   end;
end;

procedure TfrmLGTCDespesa.Post;
begin
   if qryDespesa.State = dsInsert then
      qryDespesaDT_CADASTRO.AsDateTime := Now;

   if qryDespesa.State = dsEdit then
      qryDespesaDT_ALTERACAO.AsDateTime := Now;
      
   qryDespesaVL_TOTAL.AsCurrency := FFrameValor.Valor;
   qryDespesaME_JSON_VALOR.AsString := FFrameValor.JSON;
   qryDespesa.Post;

   if qryAnexo.State in [dsInsert, dsEdit] then
   begin
      qryAnexoCD_DESPESA.AsLargeInt := qryDespesaCD_DESPESA.AsLargeInt;
      qryAnexo.Post;
   end;
end;

procedure TfrmLGTCDespesa.qryDespesaAfterPost(DataSet: TDataSet);
var
   JSON: TlkJSONobject;
   Chave: AnsiString;
begin
   JSON := DM.RecordToJSON(DataSet);

   if qryAnexoBB_ANEXO.IsNull then
      JSON.Add('anexo', TlkJSONnull.Create);

   if not qryAnexoBB_ANEXO.IsNull then
      JSON.Add('anexo', DM.RecordToJSON(qryAnexo));
   
   if Assigned(FJSONObject) then
      FJSONObject.Add('novo', JSON);

   if not Assigned(FJSONObject) then
      FJSONObject := JSON;
      
   Chave := DataSet.FieldByName('CD_DESPESA').AsString;
   DM.setLog(Modulo, FOperacao, Chave, 0, UTF8Decode(TlkJSON.GenerateText(FJSONObject)));
end;

procedure TfrmLGTCDespesa.qryDespesaCD_FORNECEDORChange(Sender: TField);
begin
   dbeFornecedor.Color := clWindow;
end;

procedure TfrmLGTCDespesa.qryDespesaCD_SITUACAOChange(Sender: TField);
begin
   dblcSituacao.Color := clWindow;
end;

procedure TfrmLGTCDespesa.qryDespesaCD_TIPO_TITULOChange(Sender: TField);
begin
   dblcTipoTitulo.Color := clWindow;
end;

procedure TfrmLGTCDespesa.qryDespesaDS_CONTAChange(Sender: TField);
begin
   dbePlano.Color := clWindow;
end;

procedure TfrmLGTCDespesa.qryDespesaDS_OBSERVACAOChange(Sender: TField);
begin
   dbeObservacao.Color := clWindow;
end;

procedure TfrmLGTCDespesa.sbArquivoClick(Sender: TObject);
var
   FileStream: TFileStream;
begin
   if odlgAnexo.Execute then
   begin
   
      if qryAnexo.IsEmpty then
         qryAnexo.Insert
      else
         qryAnexo.Edit;

      qryAnexoNM_ARQUIVO.AsString := ExtractFileName(odlgAnexo.FileName);
      qryAnexoNR_TAMANHO.AsFloat := FileSize(odlgAnexo.FileName);

      FileStream := TFileStream.Create(odlgAnexo.FileName,
         fmOpenRead or fmShareDenyWrite);
         
      try
         qryAnexoBB_ANEXO.LoadFromStream(FileStream);
      finally
         FreeAndNil(FileStream);
      end;
   end;
end;

procedure TfrmLGTCDespesa.sbBuscarFornecedorClick(Sender: TObject);
var
   ResultadoFiltro: TResultadoFiltroPessoa;
begin
   ResultadoFiltro := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);
   if ResultadoFiltro.filtrado then
   begin
      qryFornecedor.Close;
      qryFornecedor.ParamByName('CD_FORNECEDOR').AsInteger := ResultadoFiltro.cd_pessoa;
      qryFornecedor.Open;
      qryDespesaCD_FORNECEDOR.AsInteger := ResultadoFiltro.cd_pessoa;
      qryDespesa.Post;
      qryDespesa.Edit;
      FindExtraValue;
   end;
end;

procedure TfrmLGTCDespesa.sbBuscarPlanoClick(Sender: TObject);
begin
   frm_SelConta.filtroContas := tpcSaidas;
   frm_SelConta.ShowModal;
   if frm_SelConta.flgSearch then
   begin
      qryDespesaCD_CONTA.AsLargeInt := frm_SelConta.qyPlanosContasCD_CONTA.AsLargeInt;
      qryDespesaCD_COLIGADA_MATRIZ.AsInteger := frm_SelConta.qyPlanosContasCD_COLIGADA_MATRIZ.AsInteger;
   end;
end;

procedure TfrmLGTCDespesa.sbDownloadAnexoClick(Sender: TObject);
var
   ChosenDir: AnsiString;
   FileName: AnsiString;
begin
   if SelectDirectory('Selecione uma pasta', '', ChosenDir) then
   begin
      FileName := ChosenDir + '\' + qryAnexoNM_ARQUIVO.AsString;
      qryAnexoBB_ANEXO.SaveToFile(FileName);
   end;
end;

end.
