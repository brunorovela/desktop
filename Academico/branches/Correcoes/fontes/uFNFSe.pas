{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
unit uFNFSe;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ComCtrls, ImgList, ToolWin, ExtCtrls, StdCtrls, Buttons, Grids,
   DBGrids, DBCtrls, Mask, DB, ZConnection, Spin, CheckLst, uNFSeXsd,
   uNFSeMap, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMDateTimePicker;

type
   TfNFSe = class(TForm)
      pgcAbas: TPageControl;
      tbsListaRps: TTabSheet;
      tbsNovoRps: TTabSheet;
      ilImagens: TImageList;
      tlbBotoesLista: TToolBar;
      btnSep1: TToolButton;
      btnInserir: TToolButton;
      btnEditar: TToolButton;
      btnSep2: TToolButton;
      btnSalvar: TToolButton;
      btnCancelar: TToolButton;
      btnSep3: TToolButton;
      btnFechar: TToolButton;
      btnSep4: TToolButton;
      bvlSep1: TBevel;
      pnlFiltros: TPanel;
      gbFiltros: TGroupBox;
      sbFiltrar: TSpeedButton;
      rgSituacao: TRadioGroup;
      gbDataEnvio: TGroupBox;
      lblDataEnvioAte: TLabel;
      chkDataEnvioDe: TCheckBox;
      bvlSep2: TBevel;
      pnlGeral: TPanel;
      pnlListaRps: TPanel;
      pnlListaRpsTit: TPanel;
      splSep1: TSplitter;
      pnlDadosRps: TPanel;
      pnlDadosRpsTit: TPanel;
      bvlSep3: TBevel;
      bvlSep4: TBevel;
      dbgLotesRps: TDBGrid;
      lblSituacao: TLabel;
      dblcSituacao: TDBLookupComboBox;
      lblDataEnvio: TLabel;
      dbeDataEnvio: TDBEdit;
      lblProtocolo: TLabel;
      dbeProtocolo: TDBEdit;
      qrySituacao: TUMZQuery;
      dsSituacao: TDataSource;
      qryLotesRps: TUMZQuery;
      dsLotesRps: TDataSource;
      qryLotesRpsdt_criacao: TDateTimeField;
      qryLotesRpsdt_envio: TDateTimeField;
      qryLotesRpsds_protocolo: TStringField;
      qryLotesRpsme_xml: TBlobField;
      qryLotesRpslookupSituacao: TStringField;
      tlbBotoesNovo: TToolBar;
      btnSep5: TToolButton;
      btnFiltrar: TToolButton;
      btnSep6: TToolButton;
      btnSalvarNovo: TToolButton;
      btnCancelarNovo: TToolButton;
      btnSep7: TToolButton;
      pnlNovoLoteRpsTit: TPanel;
      bvlSep5: TBevel;
      lblAnoSemestre: TLabel;
      meAnoSemestre: TMaskEdit;
      udAnoSemestre: TUpDown;
      lblDepto: TLabel;
      cbDepto: TComboBox;
      lblCurso: TLabel;
      cbCurso: TComboBox;
      lblTurma: TLabel;
      cbTurma: TComboBox;
      chkParcela: TCheckBox;
      speParcelaDe: TSpinEdit;
      lblParcelaAte: TLabel;
      speParcelaAte: TSpinEdit;
      chkDataVencto: TCheckBox;
      lblDataVenctoAte: TLabel;
      chkDataPagto: TCheckBox;
      lblDataPagtoAte: TLabel;
      chkDataComp: TCheckBox;
      lblDataCompAte: TLabel;
      pnlResumo: TPanel;
      gbResumo: TGroupBox;
      ledTotalParcelas: TLabeledEdit;
      ledTotalBruto: TLabeledEdit;
      ledTotalBolsas: TLabeledEdit;
      ledTotalPago: TLabeledEdit;
      bvlSep6: TBevel;
      bvlSep7: TBevel;
      lblAlunos: TLabel;
      lbAlunos: TListBox;
      sbAdicionaAluno: TSpeedButton;
      sbExcluiAluno: TSpeedButton;
      sbLimpaAlunos: TSpeedButton;
      lblTiposTitulo: TLabel;
      sbDeselecionarTodos: TSpeedButton;
      sbSelecionarTodos: TSpeedButton;
      qryDepto: TUMZQuery;
      qryDeptocodigo: TSmallintField;
      qryDeptodescricao: TStringField;
      qryCurso: TUMZQuery;
      qryCursoanosemestre: TSmallintField;
      qryCursocodigo: TStringField;
      qryCursoapelido: TStringField;
      qryCursodescricao: TStringField;
      qryTurma: TUMZQuery;
      qryTurmaanosemestre: TSmallintField;
      qryTurmacodigo: TStringField;
      qryTurmacurso: TStringField;
      qryTurmadescricao: TStringField;
      qryTiposTitulo: TUMZQuery;
      qryTiposTitulods_tipo_titulo: TStringField;
      qryTitulos: TUMZQuery;
      qryVariaveis: TUMZQuery;
      sbGerarXML: TSpeedButton;
      sbTitulos: TSpeedButton;
      clbTiposTitulo: TCheckListBox;
      qryVariaveisvariavel: TStringField;
      qryVariaveisvalor: TMemoField;
      sdlgXML: TSaveDialog;
      btnExcluir: TToolButton;
      sbRecriar: TSpeedButton;
      qryTitulosNaoProcessados: TUMZQuery;
    qryLotesRpscd_nfse_rps_xml: TLargeintField;
    qryLotesRpscd_situacao: TLargeintField;
    qryTituloscd_mensalidade: TIntegerField;
    qryTituloscodigoaluno: TIntegerField;
    qryTitulosturma: TStringField;
    qryTitulosparcela: TSmallintField;
    qryTitulosdatavencimento: TDateTimeField;
    qryTitulosdt_competencia: TDateTimeField;
    qryTitulosdataemissao: TDateTimeField;
    qryTitulosnossonumero: TStringField;
    qryTituloscd_tipo_titulo: TSmallintField;
    qryTitulosvalorbruto: TFloatField;
    qryTitulosdescontoextra: TFloatField;
    qryTitulosvalortotal: TFloatField;
    qryTitulosvalorjuros: TFloatField;
    qryTitulosvalorjuros_fixo: TFloatField;
    qryTitulosvalorpago: TFloatField;
    qryTitulosvl_faturamento: TFloatField;
    qryTitulosdatapagamento: TDateTimeField;
    qryTitulossituacao: TSmallintField;
    qryTitulosanosemestre: TSmallintField;
    qryTitulostipoparcela: TSmallintField;
    qryTituloscd_mensalidade_origem: TIntegerField;
    qryTituloscd_coligada: TIntegerField;
    qryTituloscd_centro_custo: TLargeintField;
    qryTituloscd_plano_conta: TLargeintField;
    qryTituloscd_caixa: TIntegerField;
    qryTituloscd_resp: TIntegerField;
    qryTitulosnr_nf: TLargeintField;
    qryTituloscd_pessoa: TIntegerField;
    qryTitulosnm_pessoa: TStringField;
    qryTituloscurso: TStringField;
    qryTitulosValorServicos: TFloatField;
    qryTitulosValorLiquidoNfse: TFloatField;
    qryTitulosDescontoIncondicionado: TFloatField;
    qryTitulosDescontoCondicionado: TFloatField;
    qryTitulosEndereco: TStringField;
    qryTitulosNumero: TStringField;
    qryTitulosComplemento: TStringField;
    qryTitulosBairro: TStringField;
    qryTitulosCodigoMunicipio: TLargeintField;
    qryTitulosUf: TStringField;
    qryTitulosCep: TStringField;
    qryTitulosCnpj: TStringField;
    qryTitulosCpf: TStringField;
    qryTitulosTipoPessoa: TStringField;
    qryTitulosTelefone: TStringField;
    qryTitulosEmail: TStringField;
    qryTiposTitulocd_tipo_titulo: TIntegerField;
    umdtDataEnvioDe: TUMDateTimePicker;
    umdtDataEnvioAte: TUMDateTimePicker;
    umdtVencInicial: TUMDateTimePicker;
    umdtVencFinal: TUMDateTimePicker;
    umdtPagInicial: TUMDateTimePicker;
    umdtPagFinal: TUMDateTimePicker;
    umdtCompInicial: TUMDateTimePicker;
    umdtCompFinal: TUMDateTimePicker;
      procedure sbRecriarClick(Sender: TObject);
      procedure dsSituacaoDataChange(Sender: TObject; Field: TField);
      procedure clbTiposTituloClickCheck(Sender: TObject);
      procedure cbDeptoChange(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure sbTitulosClick(Sender: TObject);
      procedure sbGerarXMLClick(Sender: TObject);
      procedure chkDataEnvioDeClick(Sender: TObject);
      procedure btnSalvarNovoClick(Sender: TObject);
      procedure meAnoSemestreChange(Sender: TObject);
      procedure qryLotesRpsAfterRefresh(DataSet: TDataSet);
      procedure qryTitulosAfterOpen(DataSet: TDataSet);
      procedure sbFiltrarClick(Sender: TObject);
      procedure sbAdicionaAlunoClick(Sender: TObject);
      procedure pgcAbasChanging(Sender: TObject; var AllowChange: Boolean);
      procedure lbAlunosDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dsLotesRpsDataChange(Sender: TObject; Field: TField);
      procedure cbTurmaSelect(Sender: TObject);
      procedure cbCursoSelect(Sender: TObject);
      procedure cbDeptoSelect(Sender: TObject);
      procedure btnInserirClick(Sender: TObject);
      procedure btnCancelarNovoClick(Sender: TObject);
      procedure btnFiltrarClick(Sender: TObject);
      procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
      procedure sbDeselecionarTodosClick(Sender: TObject);
      procedure sbSelecionarTodosClick(Sender: TObject);
      procedure sbLimpaAlunosClick(Sender: TObject);
      procedure sbExcluiAlunoClick(Sender: TObject);
      procedure chkDataCompClick(Sender: TObject);
      procedure chkDataPagtoClick(Sender: TObject);
      procedure chkDataVenctoClick(Sender: TObject);
      procedure chkParcelaClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
      procedure btnFecharClick(Sender: TObject);
      procedure btnEditarClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
   private
      FBFiltrado: boolean;
      FBPodeTrocar: boolean;
      function GetSQLTitulos: string;
      function GetTitulosFiltrados: string;
      function InsereLoteRps: integer;
      procedure SetNfseTitulosFiltrados(const ACodigoNFSe: integer);
      procedure CarregaDeptos;
      procedure CarregaCursos;
      procedure CarregaTurmas;
      procedure CarregaTiposTitulo;
      property PodeTrocar: boolean read FBPodeTrocar write FBPodeTrocar;
   public
      property Filtrado: boolean read FBFiltrado write FBFiltrado;
   end;

var
   fNFSe: TfNFSe;

implementation

{$R *.dfm}

uses
   uDM, uFNFSePessoas, uFNFSeTitulos;

procedure TfNFSe.btnCancelarClick(Sender: TObject);
begin
   btnInserir.Enabled := true;
   btnSalvar.Enabled := false;
   btnCancelar.Enabled := false;
   btnFechar.Enabled := true;
   sbFiltrar.Enabled := true;
   sbRecriar.Enabled := qrySituacao.FieldByName('cd_situacao').AsInteger = 2;
   qryLotesRps.Cancel;
end;

procedure TfNFSe.btnCancelarNovoClick(Sender: TObject);
begin
   qryTitulos.Close;
   cbCurso.Clear;
   cbTurma.Clear;
   chkParcela.Checked := false;
   chkDataVencto.Checked := false;
   chkDataPagto.Checked := false;
   chkDataComp.Checked := false;
   ledTotalParcelas.Clear;
   ledTotalBruto.Clear;
   ledTotalBolsas.Clear;
   ledTotalPago.Clear;
   btnInserir.Enabled := true;
   btnSalvar.Enabled := false;
   btnCancelar.Enabled := false;
   btnFechar.Enabled := true;
   btnSalvarNovo.Enabled := false;
   sbDeselecionarTodosClick(nil);
   PodeTrocar := true;
   pgcAbas.ActivePage := tbsListaRps;
end;

procedure TfNFSe.btnEditarClick(Sender: TObject);
begin
   sbFiltrar.Enabled := false;
   sbGerarXML.Enabled := false;
   sbTitulos.Enabled := false;
   sbRecriar.Enabled := false;
   btnInserir.Enabled := false;
   btnEditar.Enabled := false;
   btnExcluir.Enabled := false;
   btnSalvar.Enabled := true;
   btnCancelar.Enabled := true;
   btnFechar.Enabled := false;
   qryLotesRps.Edit;
end;

procedure TfNFSe.btnExcluirClick(Sender: TObject);
const
   S_QUEST_EXCLUIR =
      'Tem certeza que deseja excluir o lote RPS selecionado?' + #13 + #13 +
      'Todos os títulos vinculados a este lote serão desvinculados.' + #13 +
      'Se desejar enviar os títulos vinculados a este lote em outra ocasião,' + #13 +
      'será necessário criar um novo lote RPS.' + #13 + #13 +
      'Tem certeza que deseja prosseguir?';
   S_SQL_RETIRA_TITULOS =
      'UPDATE mensalidades SET nr_nf = NULL WHERE nr_nf = %s';
begin
   if Mensagem(S_QUEST_EXCLUIR, 'Confirmação', MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then
   begin
      DM.db.ExecuteDirect(Format(S_SQL_RETIRA_TITULOS, [qryLotesRpscd_nfse_rps_xml.AsString]));
//      DM.db.Execute(Format(S_SQL_RETIRA_TITULOS, [qryLotesRpscd_nfse_rps_xml.AsString]));
      qryLotesRps.Delete;
   end;
end;

procedure TfNFSe.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfNFSe.btnFiltrarClick(Sender: TObject);
const
   S_MSG_FILTRO =
      'É necessário selecionar ao menos um dos seguintes filtros de data:' + #13 + #13 +
      'Data de Vencimento' + #13 + 'Data de Pagamento' + #13 + 'Data de Competência';
begin
   if not (chkDataPagto.Checked or chkDataComp.Checked or chkDataVencto.Checked) then
   begin
      Mensagem(S_MSG_FILTRO, 'Atenção', MB_ICONWARNING)   
   end
   else if not Filtrado then
   begin
      Filtrado := true;
      qryTitulos.Close;
      qryTitulos.SQL.Text := GetSQLTitulos;
      qryTitulos.Open;
   end;
end;

procedure TfNFSe.btnInserirClick(Sender: TObject);
begin
   PodeTrocar := true;
   umdtVencInicial.Date := Now;
   umdtVencFinal.Date := Now;
   umdtPagInicial.Date := Now;
   umdtPagFinal.Date := Now;
   umdtCompInicial.Date := Now;
   umdtCompFinal.Date := Now;
   speParcelaDe.Value := 1;
   speParcelaAte.Value := 1;
   chkParcela.Checked := false;
   chkDataVencto.Checked := false;
   chkDataPagto.Checked := false;
   chkDataComp.Checked := false;
   meAnoSemestre.Text := Format('%d', [DM.GetAnoSemestreAtual]);
   lbAlunos.Clear;
   btnSalvarNovo.Enabled := false;
   sbAdicionaAluno.Enabled := false;
   sbExcluiAluno.Enabled := false;
   sbLimpaAlunos.Enabled := false;
   ledTotalParcelas.Clear;
   ledTotalBruto.Clear;
   ledTotalBolsas.Clear;
   ledTotalPago.Clear;
   cbCurso.Clear;
   cbTurma.Clear;
   cbDepto.ItemIndex := 0;
   cbDeptoSelect(nil);
   sbDeselecionarTodosClick(nil);
   pgcAbas.SelectNextPage(true, true);
end;

procedure TfNFSe.btnSalvarClick(Sender: TObject);
begin
   qryLotesRps.Post;
   btnInserir.Enabled := true;
   btnSalvar.Enabled := false;
   btnCancelar.Enabled := false;
   btnFechar.Enabled := true;
   sbFiltrar.Enabled := true;
   sbRecriar.Enabled := qrySituacao.FieldByName('cd_situacao').AsInteger = 2;
end;

procedure TfNFSe.btnSalvarNovoClick(Sender: TObject);
const
   S_MSG_INFO_GERADO =
      'O lote RPS foi criado com sucesso.' + #13 + #13 +
      'Após enviar o arquivo para o site da prefeitura, '+ #13 +
      'guarde o protocolo fornecido para informá-lo no cadastro do lote RPS.' + #13 +
      'O protocolo será utilizado posteriormente para consultar a situação do lote.';

   S_MSG_INFO_NGERADO =
      'O lote RPS não foi criado!' + #13 +
      'Operação cancelada.';
var
   LNfseDataMap: TUMNfseDataMapCuritiba;
//   LNfseXml: TUMNfseXml;
   LICodigoNfse, LICodigoNfseAnt: integer;
   LSSchemaLocation, LSCaminhoXml: string;
begin
   qryVariaveis.Close;
   qryVariaveis.Open;
   btnSalvarNovo.Enabled := false;
   btnFiltrarClick(nil);
   LICodigoNfseAnt := qryLotesRpscd_nfse_rps_xml.AsInteger;

   if qryVariaveis.Locate('variavel', 'SCHEMALOCATION', [loCaseInsensitive]) then
      LSSchemaLocation := qryVariaveis.FieldByName('valor').AsString
   else
      LSSchemaLocation := 'http://www.abrasf.org.br/ABRASF/arquivos/nfse.xsd';

   LSCaminhoXml := ExtractTempDirectory +
      Format('%s_%d.xml', [FormatDateTime('yyyymmdd', Now), LICodigoNfse]);
   {
   LNfseDataMap := TUMNfseDataMapCuritiba.Create(qryTitulos, qryVariaveis);
   try
      LICodigoNfse := InsereLoteRps;
      LNfseXml := TUMNfseXml.Create(LNfseDataMap.GetLoteRps(LICodigoNfse),
         LSSchemaLocation);
      try
         try
            if LNfseXml.SalvaXml(LSCaminhoXml, true) then
            begin
               SetNfseTitulosFiltrados(LICodigoNfse);
               
               qryLotesRps.Edit;
               qryLotesRpsme_xml.LoadFromFile(LSCaminhoXml);
               qryLotesRps.Post;
                              
               sbFiltrarClick(nil);
               pgcAbas.ActivePage := tbsListaRps;
               Mensagem(S_MSG_INFO_GERADO, 'Informação', MB_ICONINFORMATION, Handle);
               
            end
            else
               Mensagem(S_MSG_INFO_NGERADO, 'Informação', MB_ICONINFORMATION, Handle);
         except
            on Exception do raise;
         end;
      finally
         LNfseXml.Free;
      end;
   finally
      LNfseDataMap.Free;
   end;
   }
end;

procedure TfNFSe.CarregaCursos;
const
   S_SQL_CURSOS =
      'SELECT '+
         'anosemestre,'+
         'codigo,'+
         'apelido,'+
         'descricao '+
      'FROM '+
         'cursos '+
      'WHERE '+
         'anosemestre = :anosemestre '+
      'ORDER BY '+
         'descricao';
         
   S_SQL_CURSOS_CFILTRO =
      'SELECT '+
         'anosemestre,'+
         'codigo,'+
         'apelido,'+
         'descricao '+
      'FROM '+
         'cursos '+
      'WHERE '+
         'depto = :depto AND '+
         'anosemestre = :anosemestre '+
      'ORDER BY '+
         'descricao';

   SQLCursoByFiltroDepto: array[boolean] of string = (S_SQL_CURSOS, S_SQL_CURSOS_CFILTRO);
begin
   cbCurso.Clear;
   cbCurso.AddItem('(TODOS)', nil);
   qryCurso.Close;
   qryCurso.SQL.Text := SQLCursoByFiltroDepto[cbDepto.ItemIndex > 0];
   if cbDepto.ItemIndex > 0 then
      qryCurso.ParamByName('depto').AsInteger := qryDeptocodigo.AsInteger;
   qryCurso.ParamByName('anosemestre').AsString := meAnoSemestre.Text;
   qryCurso.Open;
   if not qryCurso.IsEmpty then
      while not qryCurso.Eof do
      begin
         cbCurso.AddItem(qryCursocodigo.AsString, qryCurso.GetBookmark);
         qryCurso.Next;
      end;
end;

procedure TfNFSe.CarregaDeptos;
begin
   cbDepto.Clear;
   cbDepto.AddItem('(TODOS)', nil);
   qryDepto.Close;
   qryDepto.Open;
   if not qryDepto.IsEmpty then
      while not qryDepto.Eof do
      begin
         cbDepto.AddItem(qryDeptodescricao.AsString, qryDepto.GetBookmark);
         qryDepto.Next;
      end;
end;

procedure TfNFSe.CarregaTiposTitulo;
begin
   qryTiposTitulo.Close;
   qryTiposTitulo.Open;
   while not qryTiposTitulo.Eof do
   begin
      clbTiposTitulo.AddItem(
         qryTiposTitulods_tipo_titulo.AsString,
         qryTiposTitulo.GetBookmark);
      qryTiposTitulo.Next;
   end;
end;

procedure TfNFSe.CarregaTurmas;
const
   S_SQL_TURMAS =
      'SELECT '+
         'anosemestre,'+
         'codigo,'+
         'curso,'+
         'descricao '+
      'FROM '+
         'turmas '+
      'WHERE '+
         'anosemestre = :anosemestre '+
      'ORDER BY '+
         'codigo';

   S_SQL_TURMAS_CFILTRO =
      'SELECT '+
         'anosemestre,'+
         'codigo,'+
         'curso,'+
         'descricao '+
      'FROM '+
         'turmas '+
      'WHERE '+
         'curso = :curso AND '+
         'anosemestre = :anosemestre '+
      'ORDER BY '+
         'codigo';

   SQLTurmaByFiltroCurso: array[boolean] of string = (S_SQL_TURMAS, S_SQL_TURMAS_CFILTRO);
begin
   cbTurma.Clear;
   cbTurma.AddItem('(TODOS)', nil);
   qryTurma.Close;
   qryTurma.SQL.Text := SQLTurmaByFiltroCurso[cbCurso.ItemIndex > 0];
   if cbCurso.ItemIndex > 0 then
      qryTurma.ParamByName('curso').AsString := qryCursocodigo.AsString;
   qryTurma.ParamByName('anosemestre').AsString := meAnoSemestre.Text;
   qryTurma.Open;
   if not qryTurma.IsEmpty then
      while not qryTurma.Eof do
      begin
         cbTurma.AddItem(qryTurmacodigo.AsString, qryTurma.GetBookmark);
         qryTurma.Next;
      end;
end;

procedure TfNFSe.cbCursoSelect(Sender: TObject);
begin
   if cbCurso.ItemIndex > 0 then
   begin
      sbAdicionaAluno.Enabled := true;
      qryCurso.GotoBookmark(Pointer(cbCurso.Items.Objects[cbCurso.ItemIndex]));
   end;
   CarregaTurmas;
   Filtrado := false;
end;

procedure TfNFSe.cbDeptoChange(Sender: TObject);
begin
   Filtrado := false;
end;

procedure TfNFSe.cbDeptoSelect(Sender: TObject);
begin
   if cbDepto.ItemIndex > 0 then
      qryDepto.GotoBookmark(Pointer(cbDepto.Items.Objects[cbDepto.ItemIndex]));
   CarregaCursos;
   Filtrado := false;
end;

procedure TfNFSe.cbTurmaSelect(Sender: TObject);
begin
   if cbTurma.ItemIndex > 0 then
   begin
      sbAdicionaAluno.Enabled := true;
      qryTurma.GotoBookmark(Pointer(cbTurma.Items.Objects[cbTurma.ItemIndex]));
   end;
   Filtrado := false;
end;

procedure TfNFSe.chkDataCompClick(Sender: TObject);
begin
   umdtCompInicial.Enabled := chkDataComp.Checked;
   umdtCompFinal.Enabled := chkDataComp.Checked;
   lblDataCompAte.Enabled := chkDataComp.Checked;
   Filtrado := false;
end;

procedure TfNFSe.chkDataEnvioDeClick(Sender: TObject);
begin
   umdtDataEnvioDe.Enabled := chkDataEnvioDe.Checked;
   umdtDataEnvioAte.Enabled := chkDataEnvioDe.Checked;
   lblDataEnvioAte.Enabled := chkDataEnvioDe.Checked;
end;

procedure TfNFSe.chkDataPagtoClick(Sender: TObject);
begin
   umdtPagInicial.Enabled := chkDataPagto.Checked;
   umdtPagFinal.Enabled := chkDataPagto.Checked;
   lblDataPagtoAte.Enabled := chkDataPagto.Checked;
   Filtrado := false;
end;

procedure TfNFSe.chkDataVenctoClick(Sender: TObject);
begin
   umdtVencInicial.Enabled := chkDataVencto.Checked;
   umdtVencFinal.Enabled := chkDataVencto.Checked;
   lblDataVenctoAte.Enabled := chkDataVencto.Checked;
   Filtrado := false;
end;

procedure TfNFSe.chkParcelaClick(Sender: TObject);
begin
   speParcelaDe.Enabled := chkParcela.Checked;
   speParcelaAte.Enabled := chkParcela.Checked;
   lblParcelaAte.Enabled := chkParcela.Checked;
   Filtrado := false;
end;

procedure TfNFSe.clbTiposTituloClickCheck(Sender: TObject);
begin
   Filtrado := false;
end;

procedure TfNFSe.dsLotesRpsDataChange(Sender: TObject; Field: TField);
begin
   btnInserir.Enabled := not (qryLotesRps.State in [dsInsert, dsEdit]);
   btnEditar.Enabled := (not qryLotesRps.IsEmpty) and (not (qryLotesRps.State in [dsInsert, dsEdit]));
   btnExcluir.Enabled := (not qryLotesRps.IsEmpty) and
      (not (qryLotesRps.State in [dsInsert, dsEdit])) and
      (qryLotesRpscd_situacao.AsInteger in [1, 2]);
   btnSalvar.Enabled := qryLotesRps.State in [dsInsert, dsEdit];
   btnCancelar.Enabled := qryLotesRps.State in [dsInsert, dsEdit];
   btnFechar.Enabled := not (qryLotesRps.State in [dsInsert, dsEdit]);
   sbGerarXML.Enabled := (not qryLotesRps.IsEmpty) and (not (qryLotesRps.State in [dsInsert, dsEdit]));
   sbTitulos.Enabled := (not qryLotesRps.IsEmpty) and (not (qryLotesRps.State in [dsInsert, dsEdit]));
end;

procedure TfNFSe.dsSituacaoDataChange(Sender: TObject; Field: TField);
begin
   sbRecriar.Enabled :=
      (qrySituacao.FieldByName('cd_situacao').AsInteger = 2) and
      (qryLotesRps.State = dsBrowse);
end;

procedure TfNFSe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qrySituacao.Close;
   qryLotesRps.Close;
   qryTitulos.Close;
   qryDepto.Close;
   qryCurso.Close;
   qryTurma.Close;
   qryTiposTitulo.Close;
   qryVariaveis.Close;
   Action := caFree;
end;

procedure TfNFSe.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := btnFechar.Enabled and (pgcAbas.ActivePage = tbsListaRps);
end;

procedure TfNFSe.FormCreate(Sender: TObject);
begin
   PodeTrocar := false;
   Filtrado := false;
   CarregaTiposTitulo;
   CarregaDeptos;
   umdtDataEnvioDe.Date := Now;
   umdtDataEnvioAte.Date := Now;
   qrySituacao.Open;
   qryLotesRps.Open;
   qryVariaveis.Open;
end;

procedure TfNFSe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if pgcAbas.ActivePage = tbsListaRps then
   begin
      case Key of
         VK_F2:
            if btnInserir.Enabled then
               btnInserirClick(nil);
         VK_F3:
            if btnEditar.Enabled then
               btnEditarClick(nil);
         VK_F5:
            if btnSalvar.Enabled then
               btnSalvarClick(nil);
         VK_F6:
            if btnCancelar.Enabled then
               btnCancelarClick(nil);
         VK_F9:
            if btnExcluir.Enabled then
               btnExcluirClick(nil);
      end;
   end
   else
      case Key of
         VK_F5:
            if btnSalvarNovo.Enabled then
               btnSalvarNovoClick(nil);
         VK_F6:
            if btnCancelarNovo.Enabled then
               btnCancelarNovoClick(nil);  
      end;
end;

function TfNFSe.GetSQLTitulos: string;
const
   S_SQL_CAMPOS =
      'SELECT * FROM ('+
         'SELECT '+
            '%s ValorServicos,'+
            'm.cd_mensalidade,'+
            'm.codigoaluno,'+
            'm.turma,'+
            'm.parcela,'+
            'm.datavencimento,'+
            'm.dt_competencia,'+
            'm.dataemissao,'+
            'm.nossonumero,'+
            'm.cd_tipo_titulo,'+
            'm.valorbruto,'+
            'm.descontoextra,'+
            'm.valortotal,'+
            'm.valorjuros,'+
            'm.valorjuros_fixo,'+
            'm.valorpago,'+
            'm.vl_faturamento,'+
            'm.datapagamento,'+
            'm.situacao,'+
            'm.anosemestre,'+
            'm.tipoparcela,'+
            'm.cd_mensalidade_origem,'+
            'm.cd_coligada,'+
            'm.cd_centro_custo,'+
            'm.cd_plano_conta,'+
            'm.cd_caixa,'+
            'm.cd_resp,'+
            'm.nr_nf,'+
            'a.cd_pessoa,'+
            'a.nm_pessoa,'+
            'm.curso,'+
            '%s Discriminacao,'+
            'COALESCE(m.valorbruto, 0) + COALESCE(m.valorextra, 0) - COALESCE(m.descontoextra, 0) ValorLiquidoNfse,'+
            'COALESCE(m.descontoextra, 0) DescontoIncondicionado,'+
            'COALESCE(m.valordesconto, 0) DescontoCondicionado,'+
            'CONCAT(l.ds_logradouro, CONCAT('' '', p.ds_logradouro)) Endereco,'+
            'p.ds_logradouro_nro Numero,'+
            'p.ds_complemento Complemento,'+
            'p.ds_bairro Bairro,'+
            'n.ch_municipio CodigoMunicipio,'+
            'p.ds_estado Uf,'+
            'p.ds_cep Cep,'+
            'CASE WHEN P.tp_pessoa = ''J'' THEN P.ds_cnpj ELSE '''' END Cnpj,'+
            'CASE WHEN P.tp_pessoa = ''F'' THEN P.ds_cpf ELSE '''' END Cpf,'+
            'p.tp_pessoa TipoPessoa,'+
            'tel.ds_contato Telefone,'+
            'email.ds_contato Email ';
   S_SQL_CAMPOS_ORACLE =
      'SELECT * FROM ('+
         'SELECT '+
            'CAST(FIRST_OCCURRENCE(%s) AS FLOAT(126)) ValorServicos,'+
            'm.cd_mensalidade,'+
            'CAST(FIRST_OCCURRENCE(m.codigoaluno) AS NUMBER(9)) AS codigoaluno,'+
            'FIRST_OCCURRENCE(m.turma) AS turma,'+
            'CAST(FIRST_OCCURRENCE(m.parcela) AS NUMBER(5)) AS parcela,'+
            'CAST(FIRST_OCCURRENCE(m.datavencimento) AS TIMESTAMP(2)) AS datavencimento,'+
            'CAST(FIRST_OCCURRENCE(m.dt_competencia) AS TIMESTAMP(2)) AS dt_competencia,'+
            'CAST(FIRST_OCCURRENCE(m.dataemissao) AS TIMESTAMP(2)) AS dataemissao,'+
            'FIRST_OCCURRENCE(m.nossonumero) AS nossonumero,'+
            'CAST(FIRST_OCCURRENCE(m.cd_tipo_titulo) AS NUMBER(5)) AS cd_tipo_titulo,'+
            'CAST(FIRST_OCCURRENCE(m.valorbruto) AS FLOAT(126)) AS valorbruto,'+
            'CAST(FIRST_OCCURRENCE(m.descontoextra) AS FLOAT(126)) AS descontoextra,'+
            'CAST(FIRST_OCCURRENCE(m.valortotal) AS FLOAT(126)) AS valortotal,'+
            'CAST(FIRST_OCCURRENCE(m.valorjuros) AS FLOAT(126)) AS valorjuros,'+
            'CAST(FIRST_OCCURRENCE(m.valorjuros_fixo) AS FLOAT(126)) AS valorjuros_fixo,'+
            'CAST(FIRST_OCCURRENCE(m.valorpago) AS FLOAT(126)) AS valorpago,'+
            'CAST(FIRST_OCCURRENCE(m.vl_faturamento) AS FLOAT(126)) AS vl_faturamento,'+
            'CAST(FIRST_OCCURRENCE(m.datapagamento) AS TIMESTAMP(2)) AS datapagamento,'+
            'CAST(FIRST_OCCURRENCE(m.situacao) AS NUMBER(5)) AS situacao,'+
            'CAST(FIRST_OCCURRENCE(m.anosemestre) AS NUMBER(5)) AS anosemestre,'+
            'CAST(FIRST_OCCURRENCE(m.tipoparcela) AS NUMBER(5)) AS tipoparcela,'+
            'CAST(FIRST_OCCURRENCE(m.cd_mensalidade_origem) AS NUMBER(9)) AS cd_mensalidade_origem,'+
            'CAST(FIRST_OCCURRENCE(m.cd_coligada) AS NUMBER(9)) AS cd_coligada,'+
            'CAST(FIRST_OCCURRENCE(m.cd_centro_custo) AS NUMBER(19)) AS cd_centro_custo,'+
            'CAST(FIRST_OCCURRENCE(m.cd_plano_conta) AS NUMBER(19)) AS cd_plano_conta,'+
            'CAST(FIRST_OCCURRENCE(m.cd_caixa) AS NUMBER(9)) AS cd_caixa,'+
            'CAST(FIRST_OCCURRENCE(m.cd_resp) AS NUMBER(9)) AS cd_resp,'+
            'CAST(FIRST_OCCURRENCE(m.nr_nf) AS NUMBER(19)) AS nr_nf,'+
            'CAST(FIRST_OCCURRENCE(a.cd_pessoa) AS NUMBER(9)) AS cd_pessoa,'+
            'FIRST_OCCURRENCE(a.nm_pessoa) AS nm_pessoa,'+
            'FIRST_OCCURRENCE(m.curso) AS curso,'+
            'FIRST_OCCURRENCE(%s) AS Discriminacao,'+
            'CAST(FIRST_OCCURRENCE(COALESCE(m.valorbruto, 0) + COALESCE(m.valorextra, 0) - COALESCE(m.descontoextra, 0)) AS FLOAT(126)) AS ValorLiquidoNfse,'+
            'CAST(FIRST_OCCURRENCE(COALESCE(m.descontoextra, 0)) AS FLOAT(126)) AS DescontoIncondicionado,'+
            'CAST(FIRST_OCCURRENCE(COALESCE(m.valordesconto, 0)) AS FLOAT(126)) AS DescontoCondicionado,'+
            'FIRST_OCCURRENCE(CONCAT(l.ds_logradouro, CONCAT('' '', p.ds_logradouro))) AS Endereco,'+
            'FIRST_OCCURRENCE(p.ds_logradouro_nro) AS Numero,'+
            'FIRST_OCCURRENCE(p.ds_complemento) AS Complemento,'+
            'FIRST_OCCURRENCE(p.ds_bairro) AS Bairro,'+
            'CAST(FIRST_OCCURRENCE(n.ch_municipio) AS NUMBER(19)) AS CodigoMunicipio,'+
            'FIRST_OCCURRENCE(p.ds_estado) AS Uf,'+
            'FIRST_OCCURRENCE(p.ds_cep) AS Cep,'+
            'FIRST_OCCURRENCE(CASE WHEN P.tp_pessoa = ''J'' THEN P.ds_cnpj ELSE '''' END) AS Cnpj,'+
            'FIRST_OCCURRENCE(CASE WHEN P.tp_pessoa = ''F'' THEN P.ds_cpf ELSE '''' END) AS Cpf,'+
            'FIRST_OCCURRENCE(p.tp_pessoa) AS TipoPessoa,'+
            'FIRST_OCCURRENCE(tel.ds_contato) AS Telefone,'+
            'FIRST_OCCURRENCE(email.ds_contato) AS Email ';
   S_SQL_TITULOS =
         'FROM '+
            'mensalidades m '+
               'JOIN pessoas a ON '+
                  '(m.codigoaluno = a.cd_pessoa) '+
               'JOIN pessoas p ON '+
                  '(m.cd_resp = p.cd_pessoa) '+
                  'LEFT JOIN contatos_pessoas tel ON '+
                     '(p.cd_pessoa = tel.cd_pessoa) AND '+
                     '(tel.cd_contato = 1) '+
                  'LEFT JOIN contatos_pessoas email ON '+
                     '(p.cd_pessoa = email.cd_pessoa) AND '+
                     '(email.cd_contato = 4) '+
                  'LEFT JOIN municipios n ON '+
                     '(p.cd_municipio = n.cd_municipio) '+
                  'LEFT JOIN logradouros l ON '+
                     '(p.cd_logradouro = l.cd_logradouro) '+
                  'LEFT JOIN estados e ON '+
                     '(p.ds_estado = e.ds_uf) '+
                  'LEFT JOIN fin_tipos_titulo tp ON '+
                     '(m.cd_tipo_titulo = tp.cd_tipo_titulo) '+
                  'LEFT JOIN cursos c ON '+
                     '(m.curso = c.codigo) AND '+
                     '(m.anosemestre = c.anosemestre) '+
         'WHERE '+
            '(m.nr_nf IS NULL OR m.nr_nf = 0) AND '+
            '%s'+
         'GROUP BY '+
            'm.cd_mensalidade '+
      ') tabela '+
      'ORDER BY '+
         'tabela.nm_pessoa';

   S_OP = ' AND ';

   S_FILTRO_VALORSERVICOS = ' %s > 0 ';
   S_FILTRO_COMPETENCIA = ' m.situacao IN (0, 1, 2) AND m.tipoparcela = 0 ';
   S_FILTRO_PAGAMENTO = ' m.situacao IN (0, 1) ';
   S_FILTRO_ANOSEMESTRE = ' m.anosemestre = %s ';
   S_FILTRO_DEPTO = ' m.depto = %s ';
   S_FILTRO_CURSO = ' m.curso = %s ';
   S_FILTRO_TURMA = ' m.turma = %s ';
   S_FILTRO_PARCELA = ' m.parcela BETWEEN %d AND %d ';
   S_FILTRO_DTVENCTO = ' m.datavencimento BETWEEN %s AND %s ';
   S_FILTRO_DTPAGTO = ' m.datapagamento BETWEEN %s AND %s ';
   S_FILTRO_DTCOMP = ' m.dt_competencia BETWEEN %s AND %s ';
   S_FILTRO_TIPOTITULO = ' (m.cd_tipo_titulo IN (%s) OR m.cd_tipo_titulo IS NULL) ';
   S_FILTRO_PESSOAS = ' (m.codigoaluno NOT IN (%s)) ';
var
   I: integer;
   LSFiltro, LSLista, LSValorServicos, LSDiscriminacao: string;
begin
   LSFiltro := Format(S_FILTRO_ANOSEMESTRE, [meAnoSemestre.Text]);

   if cbDepto.ItemIndex > 0 then
      LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_DEPTO, [qryDeptocodigo.AsString]);

   if cbCurso.ItemIndex > 0 then
      LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_CURSO, [QuotedStr(qryCursocodigo.AsString)]);

   if cbTurma.ItemIndex > 0 then
      LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_TURMA, [QuotedStr(qryTurmacodigo.AsString)]);

   if chkParcela.Checked then
      LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_PARCELA, [speParcelaDe.Value, speParcelaAte.Value]);

   if chkDataVencto.Checked then
      LSFiltro := LSFiltro + S_OP +
         Format(S_FILTRO_DTVENCTO,
            [QuotedStr(FormatDateTime('yyyy-mm-dd', umdtVencInicial.Date)),
             QuotedStr(FormatDateTime('yyyy-mm-dd', umdtVencFinal.Date))]);

   if chkDataPagto.Checked then
      LSFiltro := LSFiltro + S_OP +
         Format(S_FILTRO_DTPAGTO,
            [QuotedStr(FormatDateTime('yyyy-mm-dd', umdtPagInicial.Date)),
             QuotedStr(FormatDateTime('yyyy-mm-dd', umdtPagFinal.Date))]);

   if chkDataComp.Checked then
      LSFiltro := LSFiltro + S_OP +
         Format(S_FILTRO_DTVENCTO,
            [QuotedStr(FormatDateTime('yyyy-mm-dd', umdtCompInicial.Date)),
             QuotedStr(FormatDateTime('yyyy-mm-dd', umdtCompFinal.Date))]);

   if chkDataComp.Checked or chkDataVencto.Checked then
      LSFiltro := LSFiltro + S_OP + S_FILTRO_COMPETENCIA
   else if chkDataPagto.Checked then
      LSFiltro := LSFiltro + S_OP + S_FILTRO_PAGAMENTO;

   LSLista := '-1';
   for I := 0 to clbTiposTitulo.Count - 1 do
   begin
      if clbTiposTitulo.Checked[I] then
      begin
         qryTiposTitulo.GotoBookmark(Pointer(clbTiposTitulo.Items.Objects[I]));
         LSLista := LSLista + ',' + qryTiposTitulocd_tipo_titulo.AsString;
      end;
   end;
   LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_TIPOTITULO, [LSLista]);

   if lbAlunos.Count > 0 then
   begin
      LSLista := '';
      for I := 0 to lbAlunos.Count - 1 do
      begin
         if LSLista <> '' then
            LSLista := LSLista + ',';
         LSLista := LSLista + lbAlunos.Items.Names[I];
      end;
      LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_PESSOAS, [LSLista]);
   end;

   qryVariaveis.Locate('variavel', 'ValorServicos', [loCaseInsensitive]);
   LSValorServicos := qryVariaveisvalor.AsString;
   qryVariaveis.Locate('variavel', 'Discriminacao', [loCaseInsensitive]);
   LSDiscriminacao := qryVariaveisvalor.AsString; 
   LSFiltro := LSFiltro + S_OP + Format(S_FILTRO_VALORSERVICOS, [LSValorServicos]);
   if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
      Result := Format(S_SQL_CAMPOS_ORACLE + S_SQL_TITULOS, [LSValorServicos, LSDiscriminacao, LSFiltro])
   else
      Result := Format(S_SQL_CAMPOS + S_SQL_TITULOS, [LSValorServicos, LSDiscriminacao, LSFiltro]);
end;

function TfNFSe.GetTitulosFiltrados: string;
var
   LDataSetTitulos: TUMZQuery;
begin
   Result := '';
   if pgcAbas.ActivePage = tbsListaRps then
      LDataSetTitulos := qryTitulosNaoProcessados
   else
      LDataSetTitulos := qryTitulos;
   LDataSetTitulos.First;
   while not LDataSetTitulos.Eof do
   begin
      if Result <> '' then
         Result := Result + ',';
      Result := Result + LDataSetTitulos.FieldByName('cd_mensalidade').AsString;
      LDataSetTitulos.Next;
   end;
end;

function TfNFSe.InsereLoteRps: integer;
begin
   qryLotesRps.Filtered := false;
   qryLotesRps.Insert;
   qryLotesRpsdt_criacao.AsDateTime := Now;
   qryLotesRps.Post;
   qryLotesRps.Close;
   qryLotesRps.Open;
   qryLotesRps.Last;
   Result := qryLotesRpscd_nfse_rps_xml.AsInteger;
end;

procedure TfNFSe.lbAlunosDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
   lbAlunos.Canvas.TextOut(Rect.Left + 2, Rect.Top, lbAlunos.Items.ValueFromIndex[Index]);
end;

procedure TfNFSe.meAnoSemestreChange(Sender: TObject);
begin
   cbCurso.Clear;
   cbTurma.Clear;
   cbCurso.ItemIndex := -1;
   cbTurma.ItemIndex := -1;
   CarregaCursos;
   Filtrado := false;
end;

procedure TfNFSe.pgcAbasChanging(Sender: TObject; var AllowChange: Boolean);
begin
   AllowChange := PodeTrocar;
   PodeTrocar := false;
end;

procedure TfNFSe.qryLotesRpsAfterRefresh(DataSet: TDataSet);
begin
   btnEditar.Enabled := not qryLotesRps.IsEmpty;
   btnExcluir.Enabled := not qryLotesRps.IsEmpty;
   sbGerarXML.Enabled := not qryLotesRps.IsEmpty;
   sbTitulos.Enabled := not qryLotesRps.IsEmpty;
end;

procedure TfNFSe.qryTitulosAfterOpen(DataSet: TDataSet);
var
   LCTotalBruto, LCTotalBolsas, LCTotalPago: Currency;
begin
   LCTotalBruto := 0;
   LCTotalBolsas := 0;
   LCTotalPago := 0;

   qryTitulos.First;
   while not qryTitulos.Eof do
   begin
      LCTotalBruto := LCTotalBruto + qryTitulosValorServicos.AsCurrency;
      LCTotalBolsas := LCTotalBolsas + qryTitulosdescontoextra.AsCurrency;
      LCTotalPago := LCTotalPago + qryTitulosvalorpago.AsCurrency;
      qryTitulos.Next;
   end;

   ledTotalParcelas.Text := Format('%d', [qryTitulos.RecordCount]);
   ledTotalBruto.Text := Format('%n', [LCTotalBruto]);
   ledTotalBolsas.Text := Format('%n', [LCTotalBolsas]);
   ledTotalPago.Text := Format('%n', [LCTotalPago]);

   btnSalvarNovo.Enabled := true;
end;

procedure TfNFSe.sbAdicionaAlunoClick(Sender: TObject);
begin
   btnFiltrarClick(nil);
   if not Assigned(fNFSePessoas) then
      Application.CreateForm(TfNFSePessoas, fNFSePessoas);
   fNFSePessoas.ShowModal;
   fNFSePessoas.Free;
   fNFSePessoas := nil;
   sbExcluiAluno.Enabled := lbAlunos.Count > 0;
   sbLimpaAlunos.Enabled := lbAlunos.Count > 0;
   btnFiltrarClick(nil);
end;

procedure TfNFSe.sbDeselecionarTodosClick(Sender: TObject);
var
   I: integer;
begin
   Filtrado := false;
   for I := 0 to clbTiposTitulo.Count - 1 do
      clbTiposTitulo.Checked[I] := false;
end;

procedure TfNFSe.sbExcluiAlunoClick(Sender: TObject);
begin
   lbAlunos.DeleteSelected;
   Filtrado := false;
   btnFiltrarClick(nil);
end;

procedure TfNFSe.sbFiltrarClick(Sender: TObject);
const
   S_FILTRO_SITUACAO = 'cd_situacao = %d';
   S_FILTRO_DATAENVIO = 'dt_envio >= %s AND dt_envio <= %s';
   S_OP = ' AND ';
var
   LSFiltro: string;
begin
   qryLotesRps.Filtered := false;
   LSFiltro := '';
   if rgSituacao.ItemIndex < 3 then
      LSFiltro := Format(S_FILTRO_SITUACAO, [rgSituacao.ItemIndex + 1]);
   if chkDataEnvioDe.Checked then
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;
      LSFiltro := LSFiltro +
         Format(S_FILTRO_DATAENVIO,
            [QuotedStr(FormatDateTime('yyyy-mm-dd', umdtDataEnvioDe.Date)),
             QuotedStr(FormatDateTime('yyyy-mm-dd', umdtDataEnvioAte.Date))])
   end;
   if LSFiltro <> '' then
   begin
      qryLotesRps.Filter := LSFiltro;
      qryLotesRps.Filtered := true;
   end;
end;

procedure TfNFSe.sbGerarXMLClick(Sender: TObject);
var
   LStream: TStream;
begin
   if sdlgXML.Execute then
   begin
      LStream := qryLotesRps.CreateBlobStream(qryLotesRpsme_xml, bmRead);
      try
         LStream.Seek(0, soFromBeginning);
         with TFileStream.Create(sdlgXML.FileName, fmCreate) do
         begin
            try
               try
                  CopyFrom(LStream, LStream.Size);
               except
                  on EFileStreamError do raise;
               end;
            finally
               Free;
            end;
         end;
      finally
         LStream.Free;
      end;
      if FileExists(sdlgXML.FileName) then
         Mensagem(Format('Arquivo gerado com sucesso em ' + #13 + '%s', [sdlgXML.FileName]),
            'Informação', MB_ICONINFORMATION, Handle)
      else
         Mensagem('Não foi possível gerar o documento XML.', 'Erro', MB_ICONERROR, Handle);
   end;
end;

procedure TfNFSe.sbLimpaAlunosClick(Sender: TObject);
begin
   lbAlunos.Clear;
   Filtrado := false;
   btnFiltrarClick(nil);
end;

procedure TfNFSe.sbRecriarClick(Sender: TObject);
const
   S_MSG_INFO_GERADO =
   'O lote RPS foi criado com sucesso.' + #13 + #13 +
   'Após enviar o arquivo para o site da prefeitura, '+ #13 +
   'guarde o protocolo fornecido para informá-lo no cadastro do lote RPS.' + #13 +
   'O protocolo será utilizado posteriormente para consultar a situação do lote.';

   S_MSG_INFO_NGERADO =
   'O lote RPS não foi criado!' + #13 +
   'Operação cancelada.';

   S_SQL_UPDATE_MENS =
   'UPDATE mensalidades SET nr_nf = %d WHERE nr_nf = %d';

var
//   LNfseXml: TUMNfseXml;
   LNfseDataMap: TUMNfseDataMapCuritiba;
   LICodigoNfse, LICodigoNfseAnt: integer;
   LSSchemaLocation, LSCaminhoXml: string;      
begin
   qryVariaveis.Close;
   qryVariaveis.Open;
   qryTitulosNaoProcessados.Close;
   qryTitulosNaoProcessados.ParamByName('nr_nf').AsInteger := qryLotesRpscd_nfse_rps_xml.AsInteger;
   qryTitulosNaoProcessados.Open;
   
   btnSalvarNovo.Enabled := false;

   LICodigoNfseAnt := qryLotesRpscd_nfse_rps_xml.AsInteger;
   if qryVariaveis.Locate('variavel', 'SCHEMALOCATION', [loCaseInsensitive]) then
      LSSchemaLocation := qryVariaveis.FieldByName('valor').AsString
   else
      LSSchemaLocation := 'http://www.abrasf.org.br/ABRASF/arquivos/nfse.xsd';

   LSCaminhoXml := ExtractTempDirectory +
      Format('%s_%d.xml', [FormatDateTime('yyyymmdd', Now), LICodigoNfse]);
   {
   LNfseDataMap := TUMNfseDataMapCuritiba.Create(qryTitulosNaoProcessados, qryVariaveis);   
   try
      LICodigoNfse := InsereLoteRps;
      DM.db.ExecuteDirect(Format(S_SQL_UPDATE_MENS, [LICodigoNfse, LICodigoNfseAnt]));
      // DM.db.Execute(Format(S_SQL_UPDATE_MENS, [LICodigoNfse, LICodigoNfseAnt]));
      LNfseXml := TUMNfseXml.Create(LNfseDataMap.GetLoteRps(LICodigoNfse), LSSchemaLocation);
      try
         try
            if LNfseXml.SalvaXml(LSCaminhoXml, true) then
            begin
               SetNfseTitulosFiltrados(LICodigoNfse);
               
               qryLotesRps.Edit;
               qryLotesRpsme_xml.LoadFromFile(LSCaminhoXml);
               qryLotesRps.Post;
                              
               sbFiltrarClick(nil);
               pgcAbas.ActivePage := tbsListaRps;
               Mensagem(S_MSG_INFO_GERADO, 'Informação', MB_ICONINFORMATION, Handle);
               
            end
            else
               Mensagem(S_MSG_INFO_NGERADO, 'Informação', MB_ICONINFORMATION, Handle);
         except
            on Exception do raise;
         end;
      finally
         LNfseXml.Free;
      end;
   finally
      LNfseDataMap.Free;
   end;
   }
end;

procedure TfNFSe.sbSelecionarTodosClick(Sender: TObject);
var
   I: integer;
begin
   Filtrado := false;
   for I := 0 to clbTiposTitulo.Count - 1 do
      clbTiposTitulo.Checked[I] := true;
end;

procedure TfNFSe.sbTitulosClick(Sender: TObject);
begin
   TfNFSeTitulos.MostraTitulos(Self, qryLotesRpscd_nfse_rps_xml.AsInteger);
end;

procedure TfNFSe.SetNfseTitulosFiltrados(const ACodigoNFSe: integer);
const
   S_SQL_UPD_TITULOS =
      'UPDATE mensalidades '+
      'SET nr_nf = %d '+
      'WHERE cd_mensalidade IN (%s)';
begin
   DM.db.ExecuteDirect(Format(S_SQL_UPD_TITULOS, [ACodigoNFSe, GetTitulosFiltrados]));
   // DM.db.Execute(Format(S_SQL_UPD_TITULOS, [ACodigoNFSe, GetTitulosFiltrados]));
end;

procedure TfNFSe.udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      meAnoSemestre.Text := DM.incrementar_ano_semestre(meAnoSemestre.Text)
   else
      meAnoSemestre.Text := DM.decrementar_ano_semestre(meAnoSemestre.Text);
end;

end.

