unit uCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ZConnection, Grids, DBGrids, DBCtrls, ToolWin, ComCtrls,
  ImgList, Buttons, StdCtrls, DBCGrids, Mask, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Menus, ZSqlUpdate, StrUtils, UMComboBox,
  RegExpr, UMDateTimePicker, uColigada, Provider, DBClient, UDBGrids;

type
  TfrmCobranca = class(TForm)
    Panel3: TPanel;
    Bevel6: TBevel;
    qyCobranca: TUMZQuery;
    dtcCobranca: TDataSource;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    sbFechar: TToolButton;
    pgCobranca: TPageControl;
    Bevel1: TBevel;
    qyAux: TUMZQuery;
    qyContatos: TUMZQuery;
    dtcContatos: TDataSource;
    tsLista: TTabSheet;
    grd: TSortedDBGrid;
    tsDadosDevedor: TTabSheet;
    tsTitulos: TTabSheet;
    tsHistorico: TTabSheet;
    Panel1: TPanel;
    Bevel2: TBevel;
    sbSelecionarColuna: TSpeedButton;
    ToolButton3: TToolButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    txtNome: TEdit;
    txtResponsavel: TEdit;
    txtCodigoEstudante: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    txtCPF: TEdit;
    Label6: TLabel;
    meEndereco: TMemo;
    Panel4: TPanel;
    Label7: TLabel;
    txtContato1: TEdit;
    txtContato2: TEdit;
    txtContato3: TEdit;
    txtContato4: TEdit;
    txtContato5: TEdit;
    txtContato6: TEdit;
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    D: TLabel;
    Label9: TLabel;
    Panel6: TPanel;
    Label13: TLabel;
    Bevel5: TBevel;
    txtSPC: TEdit;
    txtJuridico: TEdit;
    txtSPCInclusao: TEdit;
    txtJurInclusao: TEdit;
    txtSPCRetirada: TEdit;
    txtJurRetirada: TEdit;
    Panel7: TPanel;
    grdMensalidades: TDBGrid;
    tblMensalidades: TUMZQuery;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorJuros: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesDescricaoSituacao: TStringField;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesBloquetoImpresso: TStringField;
    tblMensalidadesNomeAluno: TStringField;
    tblMensalidadesDepto: TSmallintField;
    tblMensalidadesValorJurosCalc: TFloatField;
    tblMensalidadesBloqueto: TStringField;
    tblMensalidadesocorrencia_remessa: TSmallintField;
    tblMensalidadesocorrencia_retorno: TSmallintField;
    tblMensalidadessn_credito_parcela: TStringField;
    tblMensalidadesnr_creditos: TFloatField;
    tblMensalidadestipoparcela: TSmallintField;
    tblMensalidadescurso: TStringField;
    tblMensalidadescd_coligada: TSmallintField;
    tblMensalidadesNomeResponsavel: TStringField;
    tblMensalidadesds_tipo_titulo: TStringField;
    tblMensalidadesdt_competencia: TDateTimeField;
    tblMensalidadesds_historico: TStringField;
    tblMensalidadesds_conta: TStringField;
    tblMensalidadesds_centro: TStringField;
    tblMensalidadesds_bolsa: TStringField;
    tblMensalidadesMoedaPgto: TStringField;
    tblMensalidadesvl_pago_moeda: TFloatField;
    tblMensalidadescd_tipo_titulo: TSmallintField;
    tblMensalidadesPercDescExtra: TCurrencyField;
    tblMensalidadesPercDescCond: TCurrencyField;
    Panel8: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    txtTituloNome: TEdit;
    txtTituloResponsa: TEdit;
    Bevel7: TBevel;
    DBGrid1: TDBGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    txtHisNome: TEdit;
    txtHistResponsavel: TEdit;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Label14: TLabel;
    cbTelefone: TComboBox;
    Label17: TLabel;
    cbContato: TComboBox;
    ckbRetorno: TCheckBox;
    Label20: TLabel;
    meHistorico: TMemo;
    btnIncluir: TBitBtn;
    dtcMensalidades: TDataSource;
    pnBotoes: TPanel;
    Bevel10: TBevel;
    sbVencidos: TSpeedButton;
    sbPendentes: TSpeedButton;
    sbPagos: TSpeedButton;
    sbNegociados: TSpeedButton;
    sbCancelados: TSpeedButton;
    sbTodos: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    cbSituacaoFinal: TComboBox;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    tblMensalidadesValorDescontoCalc: TCurrencyField;
    tblMensalidadessn_liberar_juros: TSmallintField;
    tblMensalidadessn_liberar_descontos: TSmallintField;
    tblMensalidadesvl_credito: TFloatField;
    tblMensalidadesjuros_calc: TFloatField;
    tblMensalidadesdesconto_calc: TFloatField;
    tblMensalidadescd_resp_finan: TStringField;
    btnImprimir: TSpeedButton;
    btnNegociar: TSpeedButton;
    tblMensalidadescd_recibo: TIntegerField;
    pgOBS: TPageControl;
    tsGeral: TTabSheet;
    tsRestrita: TTabSheet;
    meObservacoes: TMemo;
    meRestritas: TMemo;
    tblMensalidadescodigoaluno: TIntegerField;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblMensalidadescd_mensalidade_origem: TIntegerField;
    tblMensalidadescd_centro_custo: TLargeintField;
    tblMensalidadescd_plano_conta: TLargeintField;
    tblMensalidadescd_caixa: TIntegerField;
    tblMensalidadescd_resp: TIntegerField;
    tblMensalidadescd_bolsa: TIntegerField;
    tblMensalidadesDS_SIGLA: TStringField;
    dsEmpresa: TDataSource;
    qyEmpresa: TUMZQuery;
    Bevel11: TBevel;
    pnEmpresa: TPanel;
    lblEmpresa: TLabel;
    lblNome: TLabel;
    lblEnderecoEmpresa: TLabel;
    dbeNome_Empresa: TDBEdit;
    lblcargo: TLabel;
    dbeCargo: TDBEdit;
    dbeEmail: TDBEdit;
    lblEmail: TLabel;
    dbetelefone: TDBEdit;
    lblTelefone: TLabel;
    dbeSite: TDBEdit;
    lblSite: TLabel;
    dbmEnderecoCompleto: TDBMemo;
    qyCobrancaCD_PESSOA: TIntegerField;
    qyCobrancaNM_PESSOA: TStringField;
    qyCobrancaCARGO: TStringField;
    qyCobrancaNM_RESP: TStringField;
    qyCobrancaNM_USUARIO: TStringField;
    qyCobrancaVL_BRUTO: TFloatField;
    qyCobrancaVL_DESC_FIXO: TFloatField;
    qyCobrancaVL_LIQUIDO: TFloatField;
    qyCobrancaVL_ATUALIZADO: TFloatField;
    qyCobrancaCD_COBRANCA: TLargeintField;
    qyCobrancaDT_REGISTRO: TDateTimeField;
    qyCobrancaCD_SITUACAO: TLargeintField;
    qyCobrancaSN_SPC: TSmallintField;
    qyCobrancaDT_SPC_INCLUSAO: TDateTimeField;
    qyCobrancaDT_SPC_RETIRADA: TDateTimeField;
    qyCobrancaSN_JURIDICO: TSmallintField;
    qyCobrancaDT_JURIDICO_INCLUSAO: TDateTimeField;
    qyCobrancaDT_JURIDICO_RETIRADA: TDateTimeField;
    qyCobrancaCD_RESPONSAVEL: TLargeintField;
    qyCobrancaDT_RETORNO: TDateTimeField;
    qyCobrancaDS_SITUACAO: TStringField;
    qyCobrancaDS_SIGLA: TStringField;
    qryDadosDevedor: TUMZReadOnlyQuery;
    qryDadosDevedorCD_PESSOA: TIntegerField;
    qryDadosDevedorNM_PESSOA: TStringField;
    qryDadosDevedorCD_RESP_FINAN: TIntegerField;
    qryDadosDevedorNM_RESP: TStringField;
    qryDadosDevedorDS_CPF: TStringField;
    qryDadosDevedorDS_ENDERECO: TStringField;
    qryDadosDevedorCD_EMPRESA: TIntegerField;
    qyEmpresaCD_EMPRESA: TIntegerField;
    qyEmpresaNM_EMPRESA: TStringField;
    qyEmpresaNM_RAZAO_SOCIAL: TStringField;
    qyEmpresaDS_ENDERECO: TStringField;
    qyEmpresaDS_COMPLEMENTO: TStringField;
    qyEmpresaDS_BAIRRO: TStringField;
    qyEmpresaDS_CIDADE: TStringField;
    qyEmpresaDS_ESTADO: TStringField;
    qyEmpresaDS_CEP: TStringField;
    qyEmpresaNM_CONTATO: TStringField;
    qyEmpresaDS_TELEFONE1: TStringField;
    qyEmpresaDS_TELEFONE2: TStringField;
    qyEmpresaDS_EMAIL: TStringField;
    qyEmpresaDS_SITE: TStringField;
    qyEmpresaCD_AREA_ATUACAO: TIntegerField;
    qyEmpresaDS_CNPJ: TStringField;
    qyEmpresaSN_CONVENIO: TSmallintField;
    qyEmpresaCD_PESSOA_EMPRESA: TIntegerField;
    qyEmpresaDS_ENDERECO_COMPLETO: TStringField;
    qryContatosDevedor: TUMZReadOnlyQuery;
    qryContatosDevedorDS_CONTATO: TStringField;
    qryContatosTel: TUMZReadOnlyQuery;
    qryContatosTelDS_CONTATO: TStringField;
    qyCobrancaULTIMOVENCIMENTO: TDateTimeField;
    qyCobrancaPRIMEIROVENCIMENTO: TDateTimeField;
    qyCobrancaQTDTITULOS: TLargeintField;
    btnVisualizar: TSpeedButton;
    btnProtesto: TSpeedButton;
    pmProtestos: TPopupMenu;
    qyCobrancaDS_SERASA: TStringField;
    qyCobrancasn_serasa: TSmallintField;
    qyContatosCD_COBRANCA_CONTATO: TLargeintField;
    qyContatosCD_COBRANCA: TLargeintField;
    qyContatosDT_REGISTRO: TDateTimeField;
    qyContatosDT_RETORNO: TDateTimeField;
    qyContatosDS_CONTATO: TMemoField;
    qyContatosCD_USUARIO: TLargeintField;
    qyContatosSN_RETORNO: TSmallintField;
    qyContatosNM_CONTATO: TStringField;
    qyContatosDS_TELEFONE: TStringField;
    qyContatosBB_ANEXO: TBlobField;
    qyContatosNOME: TStringField;
    qyContatosDS_RESUMO: TStringField;
    bbtnAnexar: TBitBtn;
    updContatos: TZUpdateSQL;
    bbtnDelAnexo: TBitBtn;
    qyCobrancasn_cartorio: TIntegerField;
    qyCobrancaDT_SERASA_INCLUSAO: TDateField;
    qyCobrancaDT_SERASA_RETIRADA: TDateField;
    qyCobrancaDT_CARTORIO_INCLUSAO: TDateField;
    qyCobrancaDT_CARTORIO_RETIRADA: TDateField;
    qyCobrancaSERASA: TSmallintField;
    ToolButton5: TToolButton;
    btnImprimirListaCobranca: TToolButton;
    qyCobrancacurso: TStringField;
    pnLegenda: TPanel;
    umdtRetorno: TUMDateTimePicker;
    tblMensalidadesDepto_descricao: TStringField;
    ZUpdateSQL1: TZUpdateSQL;
    ZUpdateSQL2: TZUpdateSQL;
    Panel11: TPanel;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    Label23: TLabel;
    Label1: TLabel;
    sbAtualizarLista: TSpeedButton;
    Label26: TLabel;
    lblPrazoDe: TLabel;
    lblPrazoAte: TLabel;
    ckbVencimentoPorData: TCheckBox;
    ckbRetornoPorData: TCheckBox;
    ckbAlunosDebito: TCheckBox;
    cbResponsavel: TComboBox;
    Label27: TLabel;
    Label31: TLabel;
    cbDiasAtrasoDe: TComboBox;
    cbDiasAtrasoAte: TComboBox;
    Label32: TLabel;
    Label33: TLabel;
    edDiasAtrasoDe: TEdit;
    edDiasAtrasoAte: TEdit;
    Panel12: TPanel;
    filtrosAvancados: TPanel;
    Label25: TLabel;
    SpeedButton30: TSpeedButton;
    lblCurso: TLabel;
    sbBuscaCurso: TSpeedButton;
    lblTurma: TLabel;
    sbBuscaTurma: TSpeedButton;
    Label28: TLabel;
    SpeedButton4: TSpeedButton;
    Label29: TLabel;
    SpeedButton2: TSpeedButton;
    lblResp: TLabel;
    SpeedButton3: TSpeedButton;
    GroupBox1: TGroupBox;
    Label24: TLabel;
    comboIncluso: TUMComboBox;
    umdtInclusoDe: TUMDateTimePicker;
    umdtInclusoAte: TUMDateTimePicker;
    edUnidadeEnsino: TEdit;
    edCurso: TEdit;
    edTurma: TEdit;
    edDepto: TEdit;
    edAluno: TEdit;
    edResp: TEdit;
    Panel13: TPanel;
    btnMostrarFiltrosAvancados: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label30: TLabel;
    Label34: TLabel;
    ckbDataPagamento: TCheckBox;
    Label35: TLabel;
    txtAnoSemestreFiltro: TMaskEdit;
    UpDown2: TUpDown;
    sbLimparAnosemestre: TSpeedButton;
    qyCobrancaPRIMEIROANOSEMESTRE: TStringField;
    qyCobrancaULTIMOANOSEMESTRE: TStringField;
    qyCobrancaDIAS_ATRASO: TLargeintField;
    tblMensalidadessn_vencida: TIntegerField;
    cdsCobranca: TClientDataSet;
    dspCobranca: TDataSetProvider;
    cdsCobrancaCD_PESSOA: TIntegerField;
    cdsCobrancaNM_PESSOA: TStringField;
    cdsCobrancaCARGO: TStringField;
    cdsCobrancaNM_RESP: TStringField;
    cdsCobrancaNM_USUARIO: TStringField;
    cdsCobrancaVL_BRUTO: TFloatField;
    cdsCobrancaVL_DESC_FIXO: TFloatField;
    cdsCobrancaVL_LIQUIDO: TFloatField;
    cdsCobrancaVL_ATUALIZADO: TFloatField;
    cdsCobrancaCD_COBRANCA: TLargeintField;
    cdsCobrancaDT_REGISTRO: TDateTimeField;
    cdsCobrancaCD_SITUACAO: TLargeintField;
    cdsCobrancaSN_SPC: TSmallintField;
    cdsCobrancaDT_SPC_INCLUSAO: TDateTimeField;
    cdsCobrancaDT_SPC_RETIRADA: TDateTimeField;
    cdsCobrancaSN_JURIDICO: TSmallintField;
    cdsCobrancaDT_JURIDICO_INCLUSAO: TDateTimeField;
    cdsCobrancaDT_JURIDICO_RETIRADA: TDateTimeField;
    cdsCobrancaCD_RESPONSAVEL: TLargeintField;
    cdsCobrancaDT_RETORNO: TDateTimeField;
    cdsCobrancaDS_SITUACAO: TStringField;
    cdsCobrancaDS_SIGLA: TStringField;
    cdsCobrancaULTIMOVENCIMENTO: TDateTimeField;
    cdsCobrancaPRIMEIROVENCIMENTO: TDateTimeField;
    cdsCobrancaQTDTITULOS: TLargeintField;
    cdsCobrancaDS_SERASA: TStringField;
    cdsCobrancasn_serasa: TSmallintField;
    cdsCobrancasn_cartorio: TIntegerField;
    cdsCobrancaDT_SERASA_INCLUSAO: TDateField;
    cdsCobrancaDT_SERASA_RETIRADA: TDateField;
    cdsCobrancaDT_CARTORIO_INCLUSAO: TDateField;
    cdsCobrancaDT_CARTORIO_RETIRADA: TDateField;
    cdsCobrancaSERASA: TSmallintField;
    cdsCobrancacurso: TStringField;
    cdsCobrancaPRIMEIROANOSEMESTRE: TStringField;
    cdsCobrancaULTIMOANOSEMESTRE: TStringField;
    cdsCobrancaDIAS_ATRASO: TLargeintField;
    cdsCobrancaCOUNT_RECORDS: TAggregateField;
    cdsCobrancaSUM_VALOR_BRUTO: TAggregateField;
    cdsCobrancaSUM_VALOR_DESCONTO: TAggregateField;
    cdsCobrancaSUM_VALOR_ATUALIZADO: TAggregateField;
    cdsCobrancaSUM_VALOR_LIQUIDO: TAggregateField;
    dbeTotalBruto: TDBEdit;
    dbeTotalRegistros: TDBEdit;
    dbeTotalDesconto: TDBEdit;
    dbeTotalAtualizado: TDBEdit;
    dbeTotalLiquido: TDBEdit;
    lblTotalRegistros: TLabel;
    lblTotalBruto: TLabel;
    lblTotalDesconto: TLabel;
    lblTotalAtualizado: TLabel;
    lblTotalLiquido: TLabel;
    lblTotais: TLabel;
    cbSituacao: TUMComboBox;
    tblMensalidadesstatus_remessa: TStringField;
    procedure cdsCobrancasn_cartorioGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCobrancaSN_JURIDICOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCobrancasn_serasaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCobrancaSN_SPCGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edDiasAtrasoDeExit(Sender: TObject);
    procedure edDiasAtrasoAteExit(Sender: TObject);
    procedure qyCobrancaDIAS_ATRASOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sbLimparAnosemestreClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure edDiasAtrasoAteKeyPress(Sender: TObject; var Key: Char);
    procedure edDiasAtrasoDeKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure cbDiasAtrasoDeChange(Sender: TObject);
    procedure cbDiasAtrasoAteChange(Sender: TObject);
    procedure btnDescerClick(Sender: TObject);
    procedure btnImprimirListaCobrancaClick(Sender: TObject);

    procedure qyCobrancasn_cartorioGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyCobrancasn_serasaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dtcContatosDataChange(Sender: TObject; Field: TField);
    procedure dtcContatosStateChange(Sender: TObject);
    procedure bbtnDelAnexoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbtnAnexarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbPorVencimentoClick(Sender: TObject);
    procedure qyCobrancaCalcFields(DataSet: TDataSet);
    procedure pmProtestosPopup(Sender: TObject);
    procedure btnProtestoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure tsHistoricoShow(Sender: TObject);
    procedure tblMensalidadesAfterOpen(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNegociarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCodigoAlunoClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure qyCobrancasn_juridicoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qyCobrancasn_spcGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ToolButton2Click(Sender: TObject);

    procedure btnCodigoCursoClick(Sender: TObject);

    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbTodosClick(Sender: TObject);
    procedure sbCanceladosClick(Sender: TObject);
    procedure sbNegociadosClick(Sender: TObject);
    procedure sbPagosClick(Sender: TObject);
    procedure sbPendentesClick(Sender: TObject);
    procedure sbVencidosClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure ckbRetornoClick(Sender: TObject);
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure dtcCobrancaDataChange(Sender: TObject; Field: TField);
    procedure pgCobrancaChange(Sender: TObject);
    procedure sbAtualizarListaClick(Sender: TObject);
    procedure ckbAteClick(Sender: TObject);
    procedure ckbDeClick(Sender: TObject);
    procedure ckbResponsavelClick(Sender: TObject);
    procedure ckbPorAnoSemestreClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
  private
    { Private declarations }
    snHistorico: Boolean;
    iCodEmpresa : Integer;
    ListaResponsaveis : Array of Integer;
    ListaSituacoes : Array of Integer;
    iCobrancaAtual : Integer;
    FBTodos: boolean;
    FBApenasJuridico: boolean;
    sSituacoes : String;
    coligada_filtrada : TColigada;
    depto_filtrado : Integer;
    cd_curso_filtrado : String;
    cd_turma_filtrada : String;
    cd_aluno : Integer;
    cd_responsavel : Integer;
    cd_coligada_filtrada: Integer;
    procedure Protestar(Sender: TObject);
    Procedure AtivarCampos();
    Procedure PreencherCombos();
    Procedure PreencherCobranca();
    Procedure PreencherDadosPessoais();

    Procedure PreencherHistorico();
      procedure UpdateTotalsVisibilityState;
    function getMensalidadesProtesto(semProtestoJunto: Boolean): String;
    function SQLToCrystalExpressionReplaceExAlias(ARegExpr : TRegExpr): string;
    function SQLToCrystalExpressionReplaceColumnsToInt(ARegExpr : TRegExpr): string;
  public
    { Public declarations }
    Procedure Filtrar();
    procedure LimpaFiltros;
    property AlunoID: Integer read cd_aluno write cd_aluno;
    Procedure PreencherTitulos();
  end;

var
  frmCobranca: TfrmCobranca;

implementation

uses
   uDm, uCamposPlanilhas, Main, uFSelecionarCurso, uFSelecionarDepartamento, uFSelecionarTurma,
   uCobrancaAltera, uFSelecionarPessoa, uCobrancaHistorico, uUsuario, uNegociacao,
   uImpMens, uProtesto, UFObservacoes, UFDigitalizaDoc, ClassRegistros, uGeneral,
   uFSelecionarDisciplina, uFSelecionarColigada, uRemessaClass;


{$R *.dfm}

procedure TfrmCobranca.AtivarCampos;
begin
  // Ativar / Desativar campos
 {
   if rdbPorRetorno.Checked or rbPorVencimento.Checked then
   begin
     ckbDe.Enabled   := True;
     ckbAte.Enabled  := True;
   end;

  umdtInicial.Enabled := (ckbDe.Checked AND ckbDe.Enabled);
  umdtFinal.Enabled   := (ckbAte.Checked AND ckbAte.Enabled);

  txtAnoSemestre.Enabled := ckbPorAnoSemestre.Checked;
  UpDownAnoSem.Enabled := ckbPorAnoSemestre.Checked;

  cbResponsavel.Enabled := ckbResponsavel.Checked;

  txtDepartamento.Enabled := ckbDepartamento.Checked;
  txtCurso.Enabled := ckbCurso.Checked;
  txtTurma.Enabled := ckbTurma.Checked;

  btnCodigoDepartamento.Enabled := ckbDepartamento.Checked;
  btnCodigoCurso.Enabled := ckbCurso.Checked;
  btnCodigoTurma.Enabled := ckbTurma.Checked;

  if( ckbAluno.Checked OR ckbAlunoResponsavel.Checked )then
  begin
     txtAluno.Enabled := true;
     btnCodigoAluno.Enabled := true;
  end
  else
  begin
     txtAluno.Enabled := false;
     btnCodigoAluno.Enabled := false;
  end;

  umdtInclusoDe.Enabled := cbInclusoDe.Checked;
  umdtInclusoAte.Enabled := cbInclusoAte.Checked;
           }
end;

procedure TfrmCobranca.ckbRetornoClick(Sender: TObject);
begin
   umdtRetorno.Enabled := ckbRetorno.Checked;
end;



procedure TfrmCobranca.DBGrid1DblClick(Sender: TObject);

   function GetFileName(const Ext: string): string;
   begin
      Result := Format('%s%s%s.%s', [ExtractTempDirectory, PathDelim, CreateNewGuid, Ext]);
   end;

var
   FileExt, FileName: string;
begin
   if DBGrid1.SelectedIndex = 2 then
   begin
      fCobrancasHistorico := TfCobrancasHistorico.Create(
         qyContatosDS_CONTATO.AsString,
         cdsCobrancaNM_PESSOA.AsString,
         qyContatosDT_REGISTRO.AsString,
         qyContatosDT_RETORNO.AsString, Self
      );
      try
         fCobrancasHistorico.ShowModal;
      finally
         fCobrancasHistorico.Free;
      end;
   end
   else if (DBGrid1.SelectedIndex = 6) and (not qyContatosBB_ANEXO.IsNull) then
   begin
      if AnsiLeftStr(qyContatosBB_ANEXO.AsString, 4) = '%PDF' then
      begin
         FileExt := 'pdf';
      end
      else
      begin
         FileExt := 'bmp';
      end;
      FileName := GetFileName(FileExt);
      qyContatosBB_ANEXO.SaveToFile(FileName);
      OpenURL(FileName);
   end;
end;

procedure TfrmCobranca.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Bitmap: TBitmap;
   X, Y: Integer;
   FixRect: TRect;
begin
   if (DataCol = 6) and (not qyContatosBB_ANEXO.IsNull) then
   begin
      Bitmap := TBitmap.Create;
      try
         ImageList1.GetBitmap(10, Bitmap);
         X := Rect.Left + (((Rect.Right - Rect.Left) - Bitmap.Width) div 2);
         Y := Rect.Top + (((Rect.Bottom - Rect.Top) - Bitmap.Height) div 2);
         FixRect := Rect;
         FixRect.Right := FixRect.Right + 1;
         FixRect.Bottom := FixRect.Bottom + 1;
         DBGrid1.Canvas.Font.Color := clLtGray;
         DBGrid1.Canvas.Brush.Color := clWhite;
         DBGrid1.Canvas.Pen.Style := psClear;
         DBGrid1.Canvas.Rectangle(FixRect);
         DBGrid1.Canvas.Draw(X, Y, Bitmap);
         DBGrid1.Canvas.Pen.Style := psSolid;
      finally
         Bitmap.Free;
      end;
   end
   else
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCobranca.btnIncluirClick(Sender: TObject);
const
   S_SQL_UPD_COB =
      'UPDATE FIN_COBRANCA SET CD_SITUACAO = :CD_SITUACAO, DT_RETORNO = :DT_RETORNO WHERE CD_COBRANCA = :CD_COBRANCA';
   S_SQL_UPD_COB_RESP =
      'UPDATE FIN_COBRANCA SET CD_SITUACAO = :CD_SITUACAO, DT_RETORNO = :DT_RETORNO, CD_RESPONSAVEL = :CD_RESPONSAVEL WHERE CD_COBRANCA = :CD_COBRANCA';
      
   SQLUpdateCobranca: array[Boolean] of string =
         (S_SQL_UPD_COB, S_SQL_UPD_COB_RESP);
var
   lugar : Pointer;
begin
   // Incluir registro de histórico;
   if DM.UsuarioLogado.TemPermissao(2053, npIncluir, false) or DM.UsuarioLogado.TemPermissao(2065, npIncluir, false) then
   begin

      // Somente deixar incluir um histórico de cobrança, se preencheu alguma informação

      btnIncluir.Enabled := false;

      qyAux.Close;
      qyAux.SQL.Text := ''+
       ' INSERT INTO FIN_COBRANCA_CONTATOS ' +
       '   (CD_COBRANCA, DT_REGISTRO, DT_RETORNO, DS_CONTATO, ' +
       '    CD_USUARIO, SN_RETORNO, NM_CONTATO, DS_TELEFONE) '  +
       ' VALUES (:CD_COBRANCA, NOW(), :DT_RETORNO, :DS_CONTATO, ' +
       '    :CD_USUARIO, :SN_RETORNO, :NM_CONTATO, :DS_TELEFONE)';

      qyAux.ParamByName('CD_COBRANCA').AsInteger := cdsCobrancaCD_COBRANCA.AsInteger;
      if ckbRetorno.Checked then
      begin
         qyAux.ParamByName('DT_RETORNO').AsDateTime := umdtRetorno.getDate;
         qyAux.ParamByName('SN_RETORNO').AsInteger := 1;
      end
      else
      begin
         qyAux.ParamByName('DT_RETORNO').Clear;
         qyAux.ParamByName('SN_RETORNO').AsInteger := 0;
      end;
      qyAux.ParamByName('DS_CONTATO').AsString := meHistorico.Lines.Text;
      qyAux.ParamByName('CD_USUARIO').AsInteger := DM.iCdPessoaLogado;
      qyAux.ParamByName('NM_CONTATO').AsString := cbContato.Text;
      qyAux.ParamByName('DS_TELEFONE').AsString := cbTelefone.Text;
      qyAux.ExecSQL;

      // Alterar a situação Atual
      qyAux.Close;
      qyAux.SQL.Text := SQLUpdateCobranca[cdsCobrancaCD_RESPONSAVEL.AsString = ''];
      qyAux.ParamByName('CD_SITUACAO').AsInteger := ListaSituacoes[cbSituacaoFinal.ItemIndex + 1];
      
      if qyAux.Params.FindParam('CD_RESPONSAVEL') <> nil then
      begin
         qyAux.ParamByName('CD_RESPONSAVEL').AsInteger := DM.iCdPessoaLogado;
      end;
      
      if ckbRetorno.Checked then
      begin
         qyAux.ParamByName('DT_RETORNO').AsDateTime := umdtRetorno.getDate;
      end
      else
      begin
         qyAux.ParamByName('DT_RETORNO').Clear;
      end;
      
      qyAux.ParamByName('CD_COBRANCA').AsInteger := cdsCobrancaCD_COBRANCA.AsInteger;
      qyAux.ExecSQL;

      // Inserir o Histórico nas observações

      if trim(meHistorico.Lines.Text) <> '' then
      begin
         TfObservacoes.RegisterObservation(
            cdsCobrancaCD_PESSOA.AsInteger, okFinancial, meHistorico.Lines.Text);
      end;
      meHistorico.Clear;

      // Atualizar Cobranca
      lugar := cdsCobranca.GetBookmark();
      cdsCobranca.DisableControls();
      filtrar();
      try
         cdsCobranca.GotoBookmark(lugar);
      except
      end;
      cdsCobranca.EnableControls;
   
      cbTelefone.Text := '';
      cbContato.Text := '';
      ckbRetorno.Checked := false;
      meHistorico.Lines.Clear(); 

      PreencherHistorico();
      Application.ProcessMessages;
      btnIncluir.Enabled := True;

   end
   else
      DM.UsuarioLogado.TemPermissao(2053, npIncluir, true);

   snHistorico := true;
end;

procedure TfrmCobranca.btnCodigoCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);
   if resultado_filtro.filtrado then
   begin
      edCurso.Text := resultado_filtro.cd_curso;
      
   end;
end;


procedure TfrmCobranca.btnImprimirClick(Sender: TObject);
var
   cd_pessoa: Integer;
begin

   cd_pessoa := cdsCobrancaCD_PESSOA.AsInteger;

   if DM.UsuarioLogado.TemPermissao(2002, npAcesso, true) then
   begin
      try
         Application.CreateForm(TfrmImpMens, frmImpMens);
         frmImpMens.RecMensalidade.CodigoAluno := tblMensalidadesCodigoAluno.AsInteger;
         frmImpMens.RecMensalidade.CodigoCaixa := tblMensalidadescd_caixa.AsInteger;
         frmImpMens.RecMensalidade.CodigoDepto := tblMensalidadesDepto.AsInteger;
         frmImpMens.RecMensalidade.AnoSemestre := tblMensalidadesAnoSemestre.AsInteger;
         frmImpMens.RecMensalidade.CodigoRecibo := tblMensalidadescd_recibo.AsInteger;
         frmImpMens.RecMensalidade.CodigoColigada := tblMensalidadescd_coligada.AsInteger;
         frmImpMens.RecMensalidade.CodigoSituacao := tblMensalidadesSituacao.AsInteger;
         frmImpMens.RecMensalidade.CodigoMensalidade := tblMensalidadescd_mensalidade.AsInteger;
         frmImpMens.RecMensalidade.CodTurma := tblMensalidadesTurma.AsString;
         frmImpMens.RecMensalidade.NossoNumero := tblMensalidadesNossoNumero.AsString;
         frmImpMens.RecMensalidade.DtVencto := tblMensalidadesDataVencimento.AsDateTime;
         frmImpMens.ShowModal;
      finally
         frmImpMens.Free;
      end;
      Self.Filtrar;

      cdsCobranca.Locate('cd_pessoa', cd_pessoa, []);

   end;
end;

procedure TfrmCobranca.btnImprimirListaCobrancaClick(Sender: TObject);
var
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
   regExpr: TRegExpr;
   condicaoRelatorio, consultaCondicao: String;
   alias: TStringList;
   cd_pessoa_selecionado: Integer;
   data_str: String;
   myYear, myMonth, myDay : Word;
   dia, mes, ano: String;
   slFormulas : TStringList;
begin

   cd_pessoa_selecionado := cdsCobrancaCD_PESSOA.AsInteger;

   sbAtualizarListaClick(Sender);

   condicaoRelatorio := '';

   regExpr := TRegExpr.Create();
   try
      regExpr.Expression := 'WHERE\s*(.*)\s*GROUP';
      regExpr.ModifierG := True;

      try
         regExpr.Exec(qyCobranca.SQL.Text);

         consultaCondicao := Trim(regExpr.Match[1]);
         
         if consultaCondicao <> '' then
         begin
            consultaCondicao := Concat('(SI.CD_SITUACAO IS NULL OR SI.CD_MODULO = 2053) AND ', consultaCondicao);
         end;

         if Pos('LEFT JOIN MENSALIDADES ME ON', qyCobranca.SQL.Text) = 0 then
         begin
            consultaCondicao := Concat('ME.CD_MENSALIDADE IS NOT NULL AND ', consultaCondicao);
         end;

         condicaoRelatorio := TGeneral.ParseStringParams(consultaCondicao, cdsCobranca.Params);

         // Em alguns casos a comparação não consegue substituir a situação
         if(Pos(':CD_SITUACAO',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_SITUACAO', cdsCobrancaCD_SITUACAO.AsString ,[rfReplaceAll]);
         end;

         if(Pos(':NR_ANOSEMESTRE',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':NR_ANOSEMESTRE', txtAnoSemestreFiltro.Text,[rfReplaceAll]);
         end;

         if(Pos(':CD_PESSOA',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_PESSOA', IntToStr(cd_aluno),[rfReplaceAll]);
         end;

         if(Pos(':CD_TURMA',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_TURMA', QuotedStr(cd_turma_filtrada),[rfReplaceAll]);
         end;

         if(Pos(':CD_CURSO',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_CURSO', QuotedStr(cd_curso_filtrado),[rfReplaceAll]);
         end;

         if(Pos(':CD_DEPTO',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(condicaoRelatorio, ':CD_DEPTO', IntToStr(depto_filtrado),[rfReplaceAll]);
         end;

         if(Pos(':CD_RESPONSAVEL',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ':CD_RESPONSAVEL',
               IntToStr(ListaResponsaveis[cbResponsavel.ItemIndex]),
               [rfReplaceAll]
            );
         end;

         if(Pos(':CD_RESP_FINAN',condicaoRelatorio) > 0) then
         begin
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ':CD_RESP_FINAN',
               IntToStr(cd_responsavel),
               [rfReplaceAll]
            );
         end;

         condicaoRelatorio := TGeneral.SQLToCrystalExpression(
            condicaoRelatorio,
            SQLToCrystalExpressionReplaceExAlias,
            SQLToCrystalExpressionReplaceColumnsToInt
         );

         // IF no
         condicaoRelatorio := StringReplace(condicaoRelatorio, ' if(', ' iif(', [rfReplaceAll, rfIgnoreCase]);

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_SPC').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(condicaoRelatorio, ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')', ' Date('+ ano + ', ' + mes + ', '+dia+')', [rfReplaceAll, rfIgnoreCase]);
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_SPCATE').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);

            condicaoRelatorio := StringReplace(condicaoRelatorio, ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')', ' Date('+ ano + ', ' + mes + ', '+dia+')', [rfReplaceAll, rfIgnoreCase]);
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_JURIDICO').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(condicaoRelatorio, ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')', ' Date('+ ano + ', ' + mes + ', '+dia+')', [rfReplaceAll, rfIgnoreCase]);
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_JURIDICOATE').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_SERASA').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );

         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_SERASAATE').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );

         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_CARTORIO').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
            
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_CARTORIOATE').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );                        
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_PAGAMENTO_INFERIOR').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_PAGAMENTO_SUPERIOR').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;
         
         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_RETORNO_INFERIOR').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;
         
         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_RETORNO_SUPERIOR').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_VENCTO_SUPERIOR').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;

         try
            DecodeDate(cdsCobranca.Params.ParamByName('DT_VENCTO_INFERIOR').asDate, myYear, myMonth, myDay);

            dia := IntToStr(myDay);
            if Length(dia) = 1 then
            begin
               dia := '0' + dia;
            end;

            mes := IntToStr(myMonth);
            if Length(mes) = 1 then
            begin
               mes := '0' + mes;
            end;

            ano := IntToStr(myYear);
            condicaoRelatorio := StringReplace(
               condicaoRelatorio,
               ' DATE_FORMAT(' + Chr(39) + ano + '-' + mes + '-' + dia + Chr(39) + ', ' + Chr(39) + '%Y-%m-%d' + Chr(39) +')',
               ' Date('+ ano + ', ' + mes + ', '+dia+')',
               [rfReplaceAll, rfIgnoreCase]
            );
         except
            //
         end;

         regExpr.LastError;
      except
      end;
   finally
      regExpr.Free;
   end;

   // Adiciona o filtro de Dias de atraso(SE HOUVER) 
   if (edDiasAtrasoDe.Text <> '') then
   begin
      condicaoRelatorio := condicaoRelatorio
         + ' AND '
         + ' ( DATEDIFF("d", Date({view_mensalidades_venc_min.datavencimento_min}), CurrentDate()) >= '
         + edDiasAtrasoDe.Text
         + ' )';
   end;

   if (edDiasAtrasoAte.Text <> '') then
   begin
      condicaoRelatorio := condicaoRelatorio
         + ' AND '
         + ' ( DATEDIFF("d", Date({view_mensalidades_venc_min.datavencimento_min}), CurrentDate()) <= '
         + edDiasAtrasoAte.Text
         + ' )';
   end;

   // Converte a sintaxe da função para sintaxe do Cristal Report
   condicaoRelatorio := StringReplace(
      condicaoRelatorio,
      'CURRENT_DATE',
      ' CurrentDate()',
      [rfReplaceAll, rfIgnoreCase]
   );

   infoRelatorio := PrincipalForm.GetInfoRpt('repPlanilhaCobranca');
   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
   begin
      PodeExportar := False;
   end;

   slFormulas := TStringList.Create;

   if (ckbDataPagamento.Checked) then
   begin
      slFormulas.Add('sn_filtrodatapgto=true');
   end
   else
   begin
      slFormulas.Add('sn_filtrodatapgto=false');
   end;

   PrincipalForm.ImprimeRpt(
      Self,
      sNomeRelatorio,
      -1,
      condicaoRelatorio,
      '',
      slFormulas,
      nil,
      nil,
      nil,
      True,
      False,
      nil,
      PodeExportar
   );

   cdsCobranca.Locate(
      'cd_pessoa',
      cd_pessoa_selecionado,
      [loCaseInsensitive]
   );
end;

procedure TfrmCobranca.btnNegociarClick(Sender: TObject);
var
   cobrancaAtual: Pointer;
   frmNegocia   : TfrmNegociacao;
const
   MSG_NEGOCIACAO_FINALIZADA =
      'Você está iniciando uma Negociação.'+ #13 +
      'Não se esqueça de ao finalizar a negociação informar o histórico desta ação e ajustar a situação de cobrança.';
begin
   if (not tblMensalidades.IsEmpty) and DM.UsuarioLogado.TemPermissao(2017, npAcesso, true) and (not DM.EstaBloqueado(DataHoje, true)) then
   begin
      Application.CreateForm(TfrmNegociacao, frmNegocia);
      frmNegocia.NomeAluno := tblMensalidadesNomeAluno.AsString;
      frmNegocia.CodigoAluno := tblMensalidadesCodigoAluno.AsInteger;
      frmNegocia.carregaTela;

      Mensagem(MSG_NEGOCIACAO_FINALIZADA, 'Atenção!', MB_ICONWARNING + MB_OK, Self.Handle);


      frmNegocia.Show;

   end;
end;

procedure TfrmCobranca.btnProtestoClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   { Alterar Situação de Matrículas }

   if not DM.UsuarioLogado.TemPermissao( 2018, npIncluir, True ) then Exit;
  
   PosX := btnProtesto.Left + PrincipalForm.Left + 20;
   PosY := pnBotoes.Top + PrincipalForm.Top + 95;

   pmProtestos.Popup(PosX, PosY);
end;

procedure TfrmCobranca.btnVisualizarClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 2018, npAcesso, True ) then Exit;

  {
  if tblMensalidadescd_mensalidade.AsInteger = 0 then begin
    exit;
  end;
  }

  Application.CreateForm( TfrmEmProtesto, frmEmProtesto );

  frmEmProtesto.iAlunoSelecionado := tblMensalidadesCodigoAluno.AsInteger;

  // Não permitir visualizar todos os protestos pela planilha de cobrança
  frmEmProtesto.sbTodos.Visible := false;

  frmEmProtesto.ShowModal;
  
  frmEmProtesto.sbTodos.Visible := true;

  PreencherTitulos();

end;

procedure TfrmCobranca.cbDiasAtrasoAteChange(Sender: TObject);
begin
   if (edDiasAtrasoDe.Text <> '')  then
   begin
      if strToInt(edDiasAtrasoDe.Text) > strToInt(cbDiasAtrasoAte.Text) then
      begin
         Mensagem(
            'Não é possível informar o fim do período de dias de atraso inferior ao início',
            'Aviso',
            MB_ICONEXCLAMATION+MB_OK
         );
         edDiasAtrasoAte.Text:= '';
         exit;
      end;
   end;

   edDiasAtrasoAte.Text := cbDiasAtrasoAte.Text;
end;

procedure TfrmCobranca.cbDiasAtrasoDeChange(Sender: TObject);
begin
   if (edDiasAtrasoAte.Text <> '' )  then
   begin

      if strToInt(cbDiasAtrasoDe.Text) > strToInt(edDiasAtrasoAte.Text) then
      begin
         Mensagem(
            'Não é possível informar o fim do período de dias de atraso inferior ao início',
            'Aviso',
            MB_ICONEXCLAMATION+MB_OK
         );
         edDiasAtrasoAte.Text:= '';
         exit;
      end;
   end;
   edDiasAtrasoDe.Text := cbDiasAtrasoDe.Text;
end;

procedure TfrmCobranca.cdsCobrancasn_cartorioGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsInteger = 1 then
    begin
       Text := 'Sim';
       Exit;
    end;

    Text := 'Não';
end;

procedure TfrmCobranca.cdsCobrancaSN_JURIDICOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsInteger = 1 then
    begin
       Text := 'Sim';
       Exit;
    end;

    Text := 'Não';
end;

procedure TfrmCobranca.cdsCobrancasn_serasaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsInteger = 1 then
    begin
       Text := 'Sim';
       Exit;
    end;

    Text := 'Não';
end;

procedure TfrmCobranca.cdsCobrancaSN_SPCGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    if Sender.AsInteger = 1 then
    begin
       Text := 'Sim';
       Exit;
    end;

    Text := 'Não';
end;

procedure TfrmCobranca.ckbAteClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.ckbDeClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.ckbPorAnoSemestreClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.ckbResponsavelClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.dtcCobrancaDataChange(Sender: TObject; Field: TField);
begin

   if pgCobranca.ActivePage = tsDadosDevedor then begin

      PreencherDadosPessoais();

   end else if pgCobranca.ActivePage = tsHistorico then begin

      PreencherHistorico();

   end;

end;

procedure TfrmCobranca.dtcContatosDataChange(Sender: TObject; Field: TField);
begin
   bbtnAnexar.Enabled := (qyContatos.State = dsBrowse) and qyContatosBB_ANEXO.IsNull;
   bbtnDelAnexo.Enabled := (qyContatos.State = dsBrowse) and (not qyContatosBB_ANEXO.IsNull);
end;

procedure TfrmCobranca.dtcContatosStateChange(Sender: TObject);
begin
   bbtnAnexar.Enabled := (qyContatos.State = dsBrowse) and qyContatosBB_ANEXO.IsNull;
   bbtnDelAnexo.Enabled := (qyContatos.State = dsBrowse) and (not qyContatosBB_ANEXO.IsNull);
end;

procedure TfrmCobranca.edDiasAtrasoAteExit(Sender: TObject);
begin
   if strToInt(edDiasAtrasoDe.Text) > strToInt(edDiasAtrasoAte.Text) then
   begin
      Mensagem(
         'Não é possível informar o fim do período de dias de atraso inferior ao início',
         'Aviso',
         MB_ICONEXCLAMATION+MB_OK
      );
      edDiasAtrasoAte.Text:= '';
      exit;
   end;

   edDiasAtrasoAte.Text := cbDiasAtrasoAte.Text;
end;

procedure TfrmCobranca.edDiasAtrasoAteKeyPress(Sender: TObject; var Key: Char);
begin
   if (not (Key in ['0'..'9', #8])) then
   begin
      Key := #0;
   end;
end;

procedure TfrmCobranca.edDiasAtrasoDeExit(Sender: TObject);
begin
   if (edDiasAtrasoDe.Text <> '') AND (edDiasAtrasoAte.Text <> '') then
   begin
      if strToInt(edDiasAtrasoDe.Text) > strToInt(edDiasAtrasoAte.Text) then
      begin
         Mensagem(
            'Não é possível informar o fim do período de dias de atraso inferior ao início',
            'Aviso',
            MB_ICONEXCLAMATION+MB_OK
         );
         edDiasAtrasoAte.Text:= '';
         exit;
      end;
   end;

end;

procedure TfrmCobranca.edDiasAtrasoDeKeyPress(Sender: TObject; var Key: Char);
begin
   if (not (Key in ['0'..'9', #8])) then
   begin
      Key := #0;
   end;
end;

procedure TfrmCobranca.Filtrar;
const
   { INICIO - ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
   S_SQL_FROM_TABELAS = '' +
         'PESSOAS P '+
            'JOIN FIN_COBRANCA CO ON '+
               '(P.CD_PESSOA = CO.CD_PESSOA) '+
               'JOIN SITUACOES SI ON '+
                  '(CO.CD_SITUACAO = SI.CD_SITUACAO) AND '+
                  '(SI.CD_MODULO = 2053) '+
            'INNER JOIN MENSALIDADES ME ON '+
               '(P.CD_PESSOA = ME.CODIGOALUNO) '+
            'LEFT JOIN TURMAS T ON (ME.turma = T.codigo and me.anosemestre = t.anosemestre) ';
   S_SQL_FROM_TABELAS_MENSALIDADE = '' +
         ' MENSALIDADES ME '+
         ' LEFT JOIN TURMAS T ON (ME.turma = T.codigo and me.anosemestre = t.anosemestre) '+
         ' INNER JOIN FIN_COBRANCA CO ON (CO.CD_PESSOA = ME.CODIGOALUNO) '+
         ' INNER JOIN SITUACOES SI ON (CO.CD_SITUACAO = SI.CD_SITUACAO) AND (SI.CD_MODULO = 2053) '+
         ' INNER JOIN PESSOAS P ON (P.CD_PESSOA = CO.CD_PESSOA) ';
   { FIM - ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
   S_SQL_MYSQL =
      'SELECT '+
         'P.CD_PESSOA,'+
         'P.DS_CARGO as CARGO,'+
         'P.NM_PESSOA,'+
         'R.NM_PESSOA NM_RESP,'+
         'COALESCE(UP.NM_PESSOA, US.NOME) NM_USUARIO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) ,0)) VL_BRUTO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.DESCONTOEXTRA, 0),0)) VL_DESC_FIXO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0) ,0)) VL_LIQUIDO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) ' +
             ' - COALESCE(ME.DESCONTOEXTRA, 0) + COALESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) - COALESCE(GET_DESCONTOS(ME.CD_MENSALIDADE, NULL), 0),0) ) VL_ATUALIZADO,'+
         'CO.CD_COBRANCA,'+
         'CO.DT_REGISTRO,'+
         'CO.CD_SITUACAO,'+
         'CO.SN_SPC,'+
         'CO.SN_CARTORIO,'+
		     'CO.DT_CARTORIO_INCLUSAO,'+
         'CO.DT_CARTORIO_RETIRADA,'+
         'CO.SN_SERASA,'+
         'CO.DT_SERASA_INCLUSAO,'+
         'CO.DT_SERASA_RETIRADA,'+
         'CO.SN_SERASA SERASA,'+
         'CO.DT_SPC_INCLUSAO,'+
         'CO.DT_SPC_RETIRADA,'+
         'CO.SN_JURIDICO,'+
         'CO.DT_JURIDICO_INCLUSAO,'+
         'CO.DT_JURIDICO_RETIRADA,'+
         'CO.CD_RESPONSAVEL,'+
         'CO.DT_RETORNO,'+
         'SI.DS_VALOR DS_SITUACAO,'+
         'SI.DS_SIGLA, '+
         'CAST(DATEDIFF(NOW(), CAST(MIN(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$,DATAVENCIMENTO, NULL)) AS DATETIME)) AS SIGNED) DIAS_ATRASO, ' +
         'CAST(MAX(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$,ME.ANOSEMESTRE, NULL) ) AS CHAR(5))  ULTIMOANOSEMESTRE,'+
         'CAST(MIN(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$,ME.ANOSEMESTRE, NULL)) AS CHAR(5)) PRIMEIROANOSEMESTRE,'+
         'CAST(MAX(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$,DATAVENCIMENTO, NULL)) AS DATETIME) ULTIMOVENCIMENTO,'+
         'CAST(MIN(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$,DATAVENCIMENTO, NULL)) AS DATETIME) PRIMEIROVENCIMENTO,'+
         'COUNT(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, ME.CD_MENSALIDADE, NULL) ) QTDTITULOS, '+
         'T.CURSO ' +
      'FROM '+
         ' [$ordem_tabelas$] '+ { ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
            'LEFT JOIN PESSOAS RM ON (RM.CD_PESSOA = ME.CD_RESP) '+
            'LEFT JOIN PESSOAS R ON '+
               '(P.CD_RESP_FINAN = R.CD_PESSOA) '+
               'LEFT JOIN PESSOAS UP ON '+
                  '(CO.CD_RESPONSAVEL = UP.CD_PESSOA) '+
                  'LEFT JOIN USUARIOS US ON '+
                     '(US.CODIGO = UP.CD_PESSOA) '+
      'WHERE '+
         ' (( $condicao_ligacao$  $situacao_cobranca$) ' +
         ' $cobranca_em$ ' +
         '  AND ' +
         ' ( ME.CODIGOALUNO IS NULL OR ME.CD_COLIGADA IN ( %s ) ) ' +
         ' AND ( if(RM.CD_PESSOA IS NOT NULL, RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1, 1 = 1) )) ' +
         ' %s '+
         ' [$planilha_cobranca_filtros_extras$] ' +
      'GROUP BY '+
         'P.CD_PESSOA' +
      '$HAVING_DIAS_ATRASO$'   ;

   S_SQL_ORACLE =
      'SELECT '+
         'P.CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(P.DS_CARGO) CARGO,'+
         'FIRST_OCCURRENCE(R.NM_PESSOA) NM_RESP,'+
         'COALESCE(FIRST_OCCURRENCE(UP.NM_PESSOA), FIRST_OCCURRENCE(US.NOME)) NM_USUARIO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) ,0)) VL_BRUTO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.DESCONTOEXTRA, 0),0)) VL_DESC_FIXO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0),0)) VL_LIQUIDO,'+
         'SUM(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) ' +
             ' - COALESCE(ME.DESCONTOEXTRA, 0) + COALESCE(GET_ACRESCIMOS(ME.CD_MENSALIDADE, NULL), 0) - COALESCE(GET_DESCONTOS(ME.CD_MENSALIDADE, NULL), 0),0)) VL_ATUALIZADO,'+
         'CAST(FIRST_OCCURRENCE(CO.CD_COBRANCA) AS NUMBER(19)) CD_COBRANCA,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_REGISTRO) AS TIMESTAMP(2)) DT_REGISTRO,'+
         'CAST(FIRST_OCCURRENCE(CO.CD_SITUACAO) AS NUMBER(19)) CD_SITUACAO,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_SPC) AS NUMBER(4)) SN_SPC,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_SERASA) AS NUMBER(4)) AS SN_SERASA,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_SERASA) AS NUMBER(4)) AS SERASA,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_SPC_INCLUSAO) AS TIMESTAMP(2)) DT_SPC_INCLUSAO,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_SPC_RETIRADA) AS TIMESTAMP(2)) DT_SPC_RETIRADA,'+
         'CAST(FIRST_OCCURRENCE(CO.SN_JURIDICO) AS NUMBER(4)) SN_JURIDICO,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_INCLUSAO) AS TIMESTAMP(2)) DT_JURIDICO_INCLUSAO,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_JURIDICO_RETIRADA) AS TIMESTAMP(2)) DT_JURIDICO_RETIRADA,'+
         'CAST(FIRST_OCCURRENCE(CO.CD_RESPONSAVEL) AS NUMBER(19)) CD_RESPONSAVEL,'+
         'CAST(FIRST_OCCURRENCE(CO.DT_RETORNO) AS TIMESTAMP(2)) DT_RETORNO,'+
         'FIRST_OCCURRENCE(SI.DS_VALOR) DS_SITUACAO,'+
         'FIRST_OCCURRENCE(SI.DS_SIGLA) DS_SIGLA,'+
         'CAST(MAX(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, ANOSEMESTRE, NULL) ) AS CHAR(5)) ULTIMOANOSEMESTRE,'+
         'CAST(MIN(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$,ANOSEMESTRE, NULL) ) AS CHAR(5)) PRIMEIROANOSEMESTRE,'+
         'MAX(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, DATAVENCIMENTO, NULL) ) ULTIMOVENCIMENTO,'+
         'MIN(if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, DATAVENCIMENTO, NULL) ) PRIMEIROVENCIMENTO,'+
         'CAST(COUNT(DISTINCT if(ME.SITUACAO IN (2 $situacao_ligacao$) $$somente_alunos_debito$$, CD_MENSALIDADE, NULL)) AS NUMBER(19)) QTDTITULOS '+
      'FROM '+
         ' [$ordem_tabelas$] '+ { ESTA LOUCURA FOI REALIZADA PARA OTIMIZAR O SQL JA DE CARA QUANDO FOR FILTRADO ALGUM CAMPO DE MENSALIDADE }
            'LEFT JOIN PESSOAS RM ON (RM.CD_PESSOA = ME.CD_RESP) '+
            'LEFT JOIN PESSOAS R ON '+
               '(P.CD_RESP_FINAN = R.CD_PESSOA) '+
               'LEFT JOIN USUARIOS US ON '+
                  '(US.CODIGO = CO.CD_RESPONSAVEL) '+
                  'LEFT JOIN PESSOAS UP ON '+
                     '(US.CD_PESSOA = UP.CD_PESSOA) '+
      'WHERE '+
         ' ( $condicao_ligacao$ ) OR CO.CD_SITUACAO <> 0) '
         + ' AND CO.CD_SITUACAO =0) ) AND '
         + ' ( ME.CODIGOALUNO IS NULL OR ME.CD_COLIGADA IN ( %s ) ) ' +
         ' AND ( CASE WHEN RM.CD_PESSOA IS NOT NULL THEN RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
         ' %s '+
         ' [$planilha_cobranca_filtros_extras$] ' +
      'GROUP BY '+
         'P.CD_PESSOA LIMIT 1';

   S_FILTRO_DTVENCTO_INFERIOR = 'DATE_FORMAT(ME.DATAVENCIMENTO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_VENCTO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTVENCTO_SUPERIOR = 'DATE_FORMAT(ME.DATAVENCIMENTO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_VENCTO_SUPERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTRETORNO_INFERIOR = 'DATE_FORMAT(CO.DT_RETORNO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_RETORNO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTRETORNO_SUPERIOR = 'DATE_FORMAT(CO.DT_RETORNO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_RETORNO_SUPERIOR, ''%Y-%m-%d'')';

   S_FILTRO_DTPAGAMENTO_INFERIOR = 'DATE_FORMAT(ME.DATAPAGAMENTO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_PAGAMENTO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTPAGAMENTO_SUPERIOR = 'DATE_FORMAT(ME.DATAPAGAMENTO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_PAGAMENTO_SUPERIOR, ''%Y-%m-%d'')';

   S_FILTRO_DTVENCTO_PASSADO = 'ME.DATAVENCIMENTO <= NOW()';
   S_FILTRO_ANOSEMESTRE = 'ME.ANOSEMESTRE = :NR_ANOSEMESTRE';
   S_FILTRO_RESPONSAVEL = 'CO.CD_RESPONSAVEL = :CD_RESPONSAVEL';
   S_FILTRO_RESPONSAVEL_SEM_USUARIOS = 'CO.CD_RESPONSAVEL IS NULL';
   S_FILTRO_DEPTO = 'ME.DEPTO = :CD_DEPTO';
   S_FILTRO_CURSO = 'ME.CURSO = :CD_CURSO';
   S_FILTRO_TURMA = 'ME.TURMA = :CD_TURMA';
   S_FILTRO_ALUNORESP = '(P.CD_PESSOA = :CD_PESSOA OR P.CD_RESP_FINAN = :CD_PESSOA)';
   S_FILTRO_ALUNO = 'P.CD_PESSOA = :CD_PESSOA';
   S_FILTRO_RESP = 'P.CD_RESP_FINAN = :CD_RESP_FINAN';
   S_FILTRO_COBRANCA = 'CO.CD_COBRANCA = :CD_COBRANCA';
   S_FILTRO_SITUACAO = 'CO.CD_SITUACAO = :CD_SITUACAO';
   S_FILTRO_SITCOB = '(' + S_FILTRO_SITUACAO + ' OR ' + S_FILTRO_COBRANCA + ')';
   S_FILTRO_JURIDICO = 'CO.SN_JURIDICO = 1';
   S_FILTRO_SPC = 'CO.SN_SPC = 1';
   S_FILTRO_SERASA = 'CO.SN_SERASA = 1';
   S_FILTRO_CARTORIO = 'CO.SN_CARTORIO = 1';
   S_FILTRO_DTINCLUSAO_SERASA = 'DATE_FORMAT(CO.DT_SERASA_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_SERASA, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_SERASA_LIMITE = 'DATE_FORMAT(CO.DT_SERASA_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_SERASAATE, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_SPC = 'DATE_FORMAT(CO.DT_SPC_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_SPC, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_SPC_LIMITE = 'DATE_FORMAT(CO.DT_SPC_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_SPCATE, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_JURIDICO = 'DATE_FORMAT(CO.DT_JURIDICO_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_JURIDICO, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_JURIDICO_LIMITE = 'DATE_FORMAT(CO.DT_JURIDICO_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_JURIDICOATE, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_CARTORIO = 'DATE_FORMAT(CO.DT_CARTORIO_INCLUSAO, ''%Y-%m-%d'') >= DATE_FORMAT(:DT_CARTORIO, ''%Y-%m-%d'')';
   S_FILTRO_DTINCLUSAO_CARTORIO_LIMITE = 'DATE_FORMAT(CO.DT_CARTORIO_INCLUSAO, ''%Y-%m-%d'') <= DATE_FORMAT(:DT_CARTORIOATE, ''%Y-%m-%d'')';
   S_FILTRO_DIAS_ATRASO_DE = 'CAST(DATEDIFF(NOW(), CAST(MIN(if(ME.SITUACAO IN (2 , 9),DATAVENCIMENTO, NULL)) AS DATETIME)) AS SIGNED) >= :DIASATRASO_DE  ';
   S_FILTRO_DIAS_ATRASO_ATE = ' CAST(DATEDIFF(NOW(), CAST(MIN(if(ME.SITUACAO IN (2 , 9),DATAVENCIMENTO, NULL)) AS DATETIME)) AS SIGNED) <= :DIASATRASO_ATE ' ;
   S_FILTRO_COBRANCA_EM = 'OR (CO.sn_spc=1 OR CO.sn_juridico=1 OR CO.SN_SERASA=1 OR CO.sn_cartorio=1)';
   S_OP = ' AND ';
var
   I: integer;
   LSFiltro: string;
   LParams: TParams;
   IsFiltroMensalidade: Boolean;
   SituacoesProtesto : String;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

   function GetSQLByProtocol( FiltroMensalidade: Boolean ): string;
   var
      situacoes: String;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_MYSQL;

      // Incluí os filtros extras configurados na tabela parametros que são definidos pelo cliente, o padrão é '' (string vazia)
      Result := StringReplace( Result, '[$planilha_cobranca_filtros_extras$]', DM.variavel_parametro('planilha_cobranca_filtros_extras'), [rfReplaceAll, rfIgnoreCase] );

      if FiltroMensalidade then
      begin
         Result := StringReplace(
            Result,
            '[$ordem_tabelas$]',
            S_SQL_FROM_TABELAS_MENSALIDADE,
            [rfReplaceAll, rfIgnoreCase]
         );
      end   
      else
      begin
         Result := StringReplace(
            Result,
            '[$ordem_tabelas$]',
            S_SQL_FROM_TABELAS,
            [rfReplaceAll, rfIgnoreCase]
         );
      end;         
   end;
begin
   PreencherCobranca;
   IsFiltroMensalidade := False;

   SituacoesProtesto := getMensalidadesProtesto( ckbDataPagamento.Checked ) ;

   LParams := TParams.Create;
   try
      // Filtrar data de vencimento
        if ckbVencimentoPorData.Checked then
        begin
         if DateToStr(umdtInicial.getDate) <> '' then
         begin
            IsFiltroMensalidade := True;
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_INFERIOR;
            AddParam('DT_VENCTO_INFERIOR', StrToDateTime(DateToStr(umdtInicial.getDate)));
         end;
         if DateToStr(umdtFinal.getDate) <> '' then
         begin
            IsFiltroMensalidade := True;
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_SUPERIOR;
            AddParam('DT_VENCTO_SUPERIOR', StrToDateTime(DateToStr(umdtFinal.getDate)));
         end;
      end;

      if txtAnoSemestreFiltro.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ANOSEMESTRE;
          AddParam('NR_ANOSEMESTRE',txtAnoSemestreFiltro.Text);
      end;
      
      if ckbRetornoPorData.Checked then
      begin
         if DateToStr(umdtInicial.getDate) <> '' then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTRETORNO_INFERIOR;
            AddParam('DT_RETORNO_INFERIOR', StrToDateTime(DateToStr(umdtInicial.getDate)));
         end;
         if DateToStr(umdtFinal.getDate) <> '' then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTRETORNO_SUPERIOR;
            AddParam('DT_RETORNO_SUPERIOR', StrToDateTime(DateToStr(umdtFinal.getDate)));
         end;
      end;

      if ckbDataPagamento.Checked then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_DTPAGAMENTO_INFERIOR;
         AddParam('DT_PAGAMENTO_INFERIOR', StrToDateTime(DateToStr(umdtInicial.getDate)));
         LSFiltro := LSFiltro + S_OP + S_FILTRO_DTPAGAMENTO_SUPERIOR;
         AddParam('DT_PAGAMENTO_SUPERIOR', StrToDateTime(DateToStr(umdtFinal.getDate)));
      end;

      // Filtrar responsável
      if ( cbResponsavel.Text <> '' ) then
      begin
         if  ( cbResponsavel.Text = 'TODOS OS USUÁRIOS' )  then
         begin
            LSFiltro := LSFiltro;
         end else
         if  ( cbResponsavel.Text = 'TODOS SEM USUÁRIOS' )  then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_RESPONSAVEL_SEM_USUARIOS;
         end
         else
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_RESPONSAVEL;
            AddParam('CD_RESPONSAVEL', ListaResponsaveis[cbResponsavel.ItemIndex]);
         end;
      end;

      // Filtrar departamento
      if (edDepto.Text <> '') then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_DEPTO;
         AddParam('CD_DEPTO', depto_filtrado );
      end;

      // Filtrar curso
      if ( edCurso.Text <> '') then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_CURSO;
         AddParam('CD_CURSO', cd_curso_filtrado);
      end;

      // Filtrar turma
      if ( edTurma.Text <> '') then
      begin
         IsFiltroMensalidade := True;
         LSFiltro := LSFiltro + S_OP + S_FILTRO_TURMA;
         AddParam('CD_TURMA', cd_turma_filtrada);
      end;

      // Filtrar aluno e/ou reponsável financeiro
      if edAluno.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ALUNO;
         AddParam('CD_PESSOA', cd_aluno);
      end;

      if edResp.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_RESP;
         AddParam('CD_RESP_FINAN', cd_responsavel);
      end;

      //Filtra por inclusão (SPC/SERASA/JURÍDICO/CARTÓRIO)
      if comboIncluso.ItemIndex > 0 then
      begin

        //SPC
        if comboIncluso.ItemIndex = 1 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_SPC;

           //Data de inclusão DE SPC
           if ( True) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SPC;
              AddParam('DT_SPC', StrToDateTime(DateToStr(umdtInclusoDe.getDate)));
           end;

           //Data de inclusão ATÉ SPC
           if ( True ) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SPC_LIMITE;
              AddParam('DT_SPCATE', StrToDateTime(DateToStr(umdtInclusoAte.getDate)));
           end;
        end;

        //Jurídico
        if comboIncluso.ItemIndex = 2 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_JURIDICO;

           //Data de inclusão DE JURÍDICO
           if ( True ) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_JURIDICO;
              AddParam('DT_JURIDICO', StrToDateTime(DateToStr(umdtInclusoDe.getDate)));
           end;

           //Data de inclusão ATÉ JURÍDICO
           if ( True ) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_JURIDICO_LIMITE;
              AddParam('DT_JURIDICOATE', StrToDateTime(DateToStr(umdtInclusoAte.getDate)));
           end;
        end;

        //SERASA
        if comboIncluso.ItemIndex = 3 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_SERASA;

           //Data de inclusão DE SERASA
           if (True) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SERASA;
              AddParam('DT_SERASA', StrToDateTime(DateToStr(umdtInclusoDe.getDate)));
           end;

           //Data de inclusão ATÉ SERASA
           if (True) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_SERASA_LIMITE;
              AddParam('DT_SERASAATE', StrToDateTime(DateToStr(umdtInclusoAte.getDate)));
           end;
        end;

        //Cartório
        if comboIncluso.ItemIndex = 4 then
        begin
           LSFiltro := LSFiltro + S_OP + S_FILTRO_CARTORIO;

           //Data de inclusão DE Cartório
           if (True) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_CARTORIO;
              AddParam('DT_CARTORIO', StrToDateTime(DateToStr(umdtInclusoDe.getDate)));
           end;

           //Data de inclusão ATÉ Cartório
           if ( True ) then
           begin
              LSFiltro := LSFiltro + S_OP + S_FILTRO_DTINCLUSAO_CARTORIO_LIMITE;
              AddParam('DT_CARTORIOATE', StrToDateTime(DateToStr(umdtInclusoAte.getDate)));
           end;
        end;

      end;

      // Filtrar situação e cobrança
      if cbSituacao.ItemIndex > 0 then
      begin
         if iCobrancaAtual > 0 then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_SITCOB;
            AddParam('CD_COBRANCA', iCobrancaAtual);
         end
         else
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_SITUACAO;
         end;

         AddParam('CD_SITUACAO', ListaSituacoes[cbSituacao.ItemIndex]);
      end;

      // Filtrar jurídico
      if (not FBTodos) and FBApenasJuridico then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_JURIDICO;
      end;

      cdsCobranca.Close;

      if ( cd_coligada_filtrada <> 0) then
      begin
         qyCobranca.SQL.Text :=
            Format(GetSQLByProtocol( IsFiltroMensalidade ), [IntToStr(cd_coligada_filtrada), LSFiltro]);
      end else
      begin
         qyCobranca.SQL.Text :=
            Format(GetSQLByProtocol( IsFiltroMensalidade ), [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltro]);
      end;


      qyCobranca.SQL.Text :=
         StringReplace(
            qyCobranca.SQL.Text,
            '$situacao_ligacao$',
            SituacoesProtesto,
            [rfReplaceAll, rfIgnoreCase]
         );

      if ( ckbAlunosDebito.Checked ) then
      begin

         qyCobranca.SQL.Text :=
            StringReplace(qyCobranca.SQL.Text,
            '$$somente_alunos_debito$$',
            'OR (ME.SITUACAO = 10 AND DATE(ME.DATAVENCIMENTO) < CURRENT_DATE)',
            [rfReplaceAll, rfIgnoreCase]);

            if ( ckbVencimentoPorData.Checked ) OR
         ( ckbRetornoPorData.Checked )     OR
         ( ckbDataPagamento.Checked )      then
         begin
            qyCobranca.SQL.Text :=
            StringReplace(
               qyCobranca.SQL.Text,
               '$condicao_ligacao$',
               ' ME.SITUACAO IN (2 , 9' + SituacoesProtesto + ') OR (ME.SITUACAO = 10 AND DATE(ME.DATAVENCIMENTO) < CURRENT_DATE) ' ,
               [rfReplaceAll, rfIgnoreCase]
            );

          qyCobranca.SQL.Text :=
            StringReplace(
               qyCobranca.SQL.Text,
               '$situacao_cobranca$',
               '',
               [rfReplaceAll, rfIgnoreCase]
            );


         qyCobranca.SQL.Text :=
         StringReplace(
            qyCobranca.SQL.Text,
            '$cobranca_em$',
            '',
            [rfReplaceAll, rfIgnoreCase]
         );

         end else
         begin


          qyCobranca.SQL.Text :=
            StringReplace(
               qyCobranca.SQL.Text,
               '$condicao_ligacao$',
               ' ME.SITUACAO IN (2 , 9' + SituacoesProtesto + ') OR (ME.SITUACAO = 10 AND DATE(ME.DATAVENCIMENTO) < CURRENT_DATE) ' ,
               [rfReplaceAll, rfIgnoreCase]
            );

          qyCobranca.SQL.Text :=
            StringReplace(
               qyCobranca.SQL.Text,
               '$situacao_cobranca$',
               '',
               [rfReplaceAll, rfIgnoreCase]
            );


         qyCobranca.SQL.Text :=
         StringReplace(
            qyCobranca.SQL.Text,
            '$cobranca_em$',
            '',
            [rfReplaceAll, rfIgnoreCase]
         );
         end;


      end
      else
      begin

         qyCobranca.SQL.Text :=
            StringReplace(qyCobranca.SQL.Text,
            '$$somente_alunos_debito$$',
            '',
            [rfReplaceAll, rfIgnoreCase]);

         qyCobranca.SQL.Text :=
            StringReplace(
               qyCobranca.SQL.Text,
               '$condicao_ligacao$',
               '',
               [rfReplaceAll, rfIgnoreCase]
            );

          qyCobranca.SQL.Text :=
            StringReplace(
               qyCobranca.SQL.Text,
               '$situacao_cobranca$',
               ' (1=1) ',
               [rfReplaceAll, rfIgnoreCase]
            );

         qyCobranca.SQL.Text := StringReplace(
               qyCobranca.SQL.Text,
               '$cobranca_em$',
               '',
               [rfReplaceAll, rfIgnoreCase]
            );

      end;

      // FILTRA DIAS DE ATRASO -- DE --
      if (edDiasAtrasoDe.Text <> '') aND (edDiasAtrasoAte.Text <> '' ) then
      begin
         qyCobranca.SQL.Text := StringReplace(
               qyCobranca.SQL.Text,
               '$HAVING_DIAS_ATRASO$',
               ' HAVING '
               + S_FILTRO_DIAS_ATRASO_DE
               + ' AND '
               + S_FILTRO_DIAS_ATRASO_ATE,
               [rfReplaceAll, rfIgnoreCase]
          );

         AddParam('DIASATRASO_DE', edDiasAtrasoDe.Text);
         AddParam('DIASATRASO_ATE', edDiasAtrasoAte.Text);
      end else begin
         qyCobranca.SQL.Text := StringReplace(
               qyCobranca.SQL.Text,
               '$HAVING_DIAS_ATRASO$',
               '',
               [rfReplaceAll, rfIgnoreCase]
          );
      end;

      cdsCobranca.FetchParams;
      cdsCobranca.Params.AssignValues(LParams);

   finally
      LParams.Free;
   end;

   cdsCobranca.Open;
end;

procedure TfrmCobranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsCobranca.Close;
  Action := caFree;
end;

procedure TfrmCobranca.FormCreate(Sender: TObject);
begin
   Self.FBTodos := DM.UsuarioLogado.TemPermissao(2053, npAcesso, false);
   Self.FBApenasJuridico := DM.UsuarioLogado.TemPermissao(2065, npAcesso, false);
   pgCobranca.ActivePage := tsLista;

   sbVencidos.Down := true;

   // montar os campos na planilha
   DM.MontarPlanilha(TDBGrid(TCustomDBGrid(grd)), 'planilha_cobranca_campos');

   // Montar a planilha de recebimentos
   DM.MontarPlanilha(grdMensalidades, 'planilha_mensalidades_campos');

   Dm.tblSituacoesFinanceiras.Close();
   DM.tblSituacoesFinanceiras.Open();

   sSituacoes := '2';

   while not DM.tblSituacoesFinanceiras.Eof do begin

     if DM.tblSituacoesFinanceirassn_protesto.AsInteger = 1 then begin

        sSituacoes := sSituacoes + ', ' + DM.tblSituacoesFinanceirascd_situacao.AsString;

     end;

     DM.tblSituacoesFinanceiras.Next();

  end;

  UpdateTotalsVisibilityState;

end;

procedure TfrmCobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   case Key of
      VK_F7: begin
         if pgCobranca.ActivePage = tsLista then
         begin
            if btnImprimirListaCobranca.Enabled then Self.btnImprimirListaCobrancaClick(nil);
         end
         else if pgCobranca.ActivePage = tsTitulos then
         begin
            if btnImprimir.Enabled then Self.btnImprimirClick(nil);
         end;
      end;
      VK_F8 : begin
         // Aluno
         resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

         if ( (resultado_filtro.cd_pessoa) <= 0 ) then
         begin
            edAluno.Text := '';
            cd_aluno := -1;
         end
         else
         begin
            edAluno.Text := resultado_filtro.nm_pessoa;
            cd_aluno:=resultado_filtro.cd_pessoa;
            btnMostrarFiltrosAvancados.Click;
            sbAtualizarListaClick(nil);
         end;
      end;
   end;
end;

procedure TfrmCobranca.FormShow(Sender: TObject);
begin
   panel1.Height  := 97;
   panel12.Height := 22;
   panel13.Height := 22;
   snHistorico := false;
   umdtInicial.setDate(DataHoje);
   umdtFinal.setDate(DataHoje);

   umdtInclusoDe.setDate(DataHoje);
   umdtInclusoAte.setDate(DataHoje);

   ckbAlunosDebito.Checked := true;

   PreencherCombos();
   AtivarCampos();
end;

function TfrmCobranca.getMensalidadesProtesto(semProtestoJunto: Boolean): String;
const
   SQL_FILTRO_SITUACOES_PROTESTO =
      ' SELECT ' +
      '     GROUP_CONCAT(cd_situacao) AS situacoes ' +
      '  FROM ' +
      '     situacoes_financeiras ';
var
   qryBuscaSituacoesProtesto: TUMZReadOnlyQuery;
begin
   Result := '';

   DM.CriarConsulta(qryBuscaSituacoesProtesto);
   qryBuscaSituacoesProtesto.SQL.Text := SQL_FILTRO_SITUACOES_PROTESTO;

   if not semProtestoJunto then
   begin
      qryBuscaSituacoesProtesto.SQL.Add(' WHERE sn_protesto = 1 ');
   end;
  
   qryBuscaSituacoesProtesto.Open;

   if qryBuscaSituacoesProtesto.FieldByName('situacoes').AsString <> '' then
   begin
      Result := ', ' + qryBuscaSituacoesProtesto.FieldByName('situacoes').AsString;
   end;
end;

procedure TfrmCobranca.grdDblClick(Sender: TObject);
begin
   pgCobranca.ActivePage := tsDadosDevedor;
   PreencherDadosPessoais();
end;

procedure TfrmCobranca.grdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   cor : TColor;
   fixRect : TRect;
begin

   if not cdsCobranca.IsEmpty() then begin
      fixRect := Rect;
      // Pinta coluna de acordo com situação
         if grd.SelectedRows.CurrentRowSelected then
         begin
            grd.Canvas.Brush.Color:= clBtnShadow;
            grd.Canvas.Font.Color:= clWindowText;
         end else begin
               if (cdsCobrancads_sigla.AsString <> '') then
               begin
                  cor := HexColorToDec(cdsCobrancads_sigla.AsString);
               end else begin
                  cor := $00000000;
               end;
               grd.Canvas.Font.Color:= clWindowText;
               if( cdsCobrancasn_serasa.AsInteger = 1 )then
               begin
                  cor := clYellow;
               end;



            grd.Canvas.Brush.Color:= cor;

         end;
         grd.Canvas.FillRect(Rect);
      //Fecha pintura

      grd.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
   end;
end;


procedure TfrmCobranca.LimpaFiltros;
begin
   umdtInicial.Date := Date;
   umdtFinal.Date := Date;
   ckbVencimentoPorData.Checked := False;
   ckbRetornoPorData.Checked := False;
   ckbDataPagamento.Checked := False;
   ckbAlunosDebito.Checked := True;
   edDiasAtrasoDe.Clear;
   edDiasAtrasoAte.Clear;
   cbSituacao.ItemIndex := -1;
   cbResponsavel.ItemIndex := -1;
   txtAnoSemestreFiltro.Clear;
   edUnidadeEnsino.Clear;
   edCurso.Clear;
   edDepto.Clear;
   edTurma.Clear;
   edAluno.Clear;
   edResp.Clear;
   comboIncluso.ItemIndex := -1;
   umdtInclusoDe.Date := Date;
   umdtInclusoAte.Date := Date;
end;

procedure TfrmCobranca.pgCobrancaChange(Sender: TObject);
Var
   lugar : Pointer;
begin
   pnLegenda.Visible := True;

   if ((pgCobranca.ActivePage = tsLista) and
      ( (snHistorico = True))) then
   begin
      // Guardar a posição atual
      lugar := cdsCobranca.GetBookmark();
      cdsCobranca.DisableControls();
      Self.Filtrar;
      try
         cdsCobranca.GotoBookmark(lugar);
      except
      end;
      cdsCobranca.EnableControls;
      snHistorico := false;
      pnLegenda.Visible := True;
   end;

   if pgCobranca.ActivePage = tsDadosDevedor then begin
      sbSelecionarColuna.Enabled:=true;
      pnLegenda.Visible := False;
      PreencherDadosPessoais();


   end else if pgCobranca.ActivePage = tsTitulos then begin
      sbSelecionarColuna.Enabled:=true;
      pnLegenda.Visible := False;
      DM.montarPlanilha(grdMensalidades, 'planilha_cobranca_titulo_campos');
      PreencherTitulos();

   end else if pgCobranca.ActivePage = tsHistorico then begin

      if ( cdsCobranca.RecNo > 0 ) then begin
         sbSelecionarColuna.Enabled:=false;
         pnLegenda.Visible := False;
         PreencherHistorico();
      end
      else begin
         Mensagem( 'Você deve selecionar um registro na guia "LISTA COBRANÇA".', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
         pgCobranca.ActivePage := tsLista;
         pnLegenda.Visible := True;
      end;

   end;

end;

procedure TfrmCobranca.pmProtestosPopup(Sender: TObject);
var
  Item: TMenuItem;
begin

  pmProtestos.Items.Clear;

  Dm.tblSituacoesFinanceiras.Close();
  DM.tblSituacoesFinanceiras.Open();

  while not DM.tblSituacoesFinanceiras.Eof do begin

     if DM.tblSituacoesFinanceirassn_protesto.AsInteger = 1 then begin

        Item := TMenuItem.Create(self);
        
        Item.Caption := DM.tblSituacoesFinanceirasds_situacao.AsString;
        Item.Tag := DM.tblSituacoesFinanceirascd_situacao.AsInteger;
        Item.OnClick := Protestar;

        pmProtestos.Items.Add(Item);

     end;

     DM.tblSituacoesFinanceiras.Next();

  end;
end;

procedure TfrmCobranca.PreencherCobranca;
const
   S_SQL_MYSQL =
      'INSERT IGNORE INTO FIN_COBRANCA (CD_PESSOA, DT_REGISTRO, CD_SITUACAO)' +
      'SELECT ' +
         'P.CD_PESSOA, NOW(), 0 ' +
      'FROM ' +
         'PESSOAS P ' +
            'LEFT JOIN MENSALIDADES ME ON (P.CD_PESSOA = ME.CODIGOALUNO) AND (ME.SITUACAO IN (%s)) ' +
               'LEFT JOIN FIN_COBRANCA CO ON (P.CD_PESSOA = CO.CD_PESSOA)' +
            'LEFT JOIN PESSOAS RM ON (ME.CD_RESP = RM.CD_PESSOA) ' +
      'WHERE ' +
         '( CASE WHEN RM.CD_PESSOA IS NOT NULL THEN RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
         '%s ' +
      'GROUP BY ' +
         'P.CD_PESSOA ' +
      'HAVING ' +
         '(SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0))) > 0 ';

   S_SQL_ORACLE =
      'MERGE INTO FIN_COBRANCA C USING ' +
      '(' +
         'SELECT '+
            'P.CD_PESSOA,' +
            'NOW() DT_REGISTRO,' +
            '0 CD_SITUACAO ' +
         'FROM '+
            'PESSOAS P ' +
               'LEFT JOIN MENSALIDADES ME ON (P.CD_PESSOA = ME.CODIGOALUNO) AND (ME.SITUACAO IN (%s)) ' +
               'LEFT JOIN FIN_COBRANCA CO ON (P.CD_PESSOA = CO.CD_PESSOA)' +
               'LEFT JOIN PESSOAS RM ON (ME.CD_RESP = RM.CD_PESSOA) ' +
         'WHERE ' +
            '( CASE WHEN RM.CD_PESSOA IS NOT NULL THEN RM.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
            '%s ' +
         'GROUP BY ' +
            'P.CD_PESSOA ' +
         'HAVING ' +
            '(SUM(COALESCE(ME.VALORBRUTO, 0) + COALESCE(ME.VALOREXTRA, 0) + COALESCE(ME.VALORJUROS, 0) - COALESCE(ME.DESCONTOEXTRA, 0))) > 0 ' +
      ') UP ON ' +
         '(C.CD_PESSOA = UP.CD_PESSOA) ' +
      'WHEN NOT MATCHED THEN '+
         'INSERT (C.CD_PESSOA, C.DT_REGISTRO, C.CD_SITUACAO) ' +
         'VALUES (UP.CD_PESSOA, UP.DT_REGISTRO, UP.CD_SITUACAO)';

   S_FILTRO_DTVENCTO_INFERIOR = 'ME.DATAVENCIMENTO >= DATE_FORMAT(:DT_VENCTO_INFERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTVENCTO_SUPERIOR = 'ME.DATAVENCIMENTO <= DATE_FORMAT(:DT_VENCTO_SUPERIOR, ''%Y-%m-%d'')';
   S_FILTRO_DTRETORNO_INFERIOR = 'CO.DT_RETORNO >= :DT_RETORNO_INFERIOR';
   S_FILTRO_DTRETORNO_SUPERIOR = 'CO.DT_RETORNO <= :DT_RETORNO_SUPERIOR';
   S_FILTRO_ANOSEMESTRE = 'ME.ANOSEMESTRE = :NR_ANOSEMESTRE';
   S_FILTRO_ALUNO = 'P.CD_PESSOA = :CD_PESSOA';
   S_OP = ' AND ';
var
   I: integer;
   LSFiltro: string;
   LParams: TParams;

   function GetSQLByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_MYSQL;
   end;

   procedure AddParam(const ParamName: string; const Value: Variant);
   begin
      LParams.CreateParam(ftUnknown, ParamName, ptUnknown).Value := Value;
   end;

begin
   LParams := TParams.Create;
   try
      if ckbVencimentoPorData.Checked then
        begin
         if DateToStr(umdtInicial.getDate) <> '' then
         begin
            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_INFERIOR;
            AddParam('DT_VENCTO_INFERIOR', StrToDateTime(DateToStr(umdtInicial.getDate)));
         end;
         if DateToStr(umdtFinal.getDate) <> '' then
         begin

            LSFiltro := LSFiltro + S_OP + S_FILTRO_DTVENCTO_SUPERIOR;
            AddParam('DT_VENCTO_SUPERIOR', StrToDateTime(DateToStr(umdtFinal.getDate)));
         end;
      end;

      if txtAnoSemestreFiltro.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ANOSEMESTRE;
          AddParam('NR_ANOSEMESTRE',txtAnoSemestreFiltro.Text);
      end;

      // Filtrar aluno e/ou reponsável financeiro
      if edAluno.Text <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + S_FILTRO_ALUNO;
         AddParam('CD_PESSOA', cd_aluno);
      end;

      qyAux.SQL.Text := Format(GetSQLByProtocol, [sSituacoes, LSFiltro]);
      for I := 0 to LParams.Count - 1 do
         qyAux.ParamByName(LParams.Items[I].Name).Value := LParams.Items[I].Value;
      qyAux.ExecSQL;
   finally
      LParams.Free;
   end;
end;


procedure TfrmCobranca.PreencherCombos;
var
   iQtdItens: Integer;
   bTodosUsuarios: Boolean;
begin
   // Selecionar os usuários que tem permissão para acessar o módulo de cobrança
   
   qyAux.Close();
   qyAux.SQL.Text :=
      'SELECT DISTINCT ' +
         'US.CD_PESSOA CODIGO,' +
         'US.NM_PESSOA NM_USUARIO ' +
      'FROM ' +
         'PESSOAS US ' +
            'JOIN NU_GRUPOS_PESSOAS NP ON ' +
               '(US.CD_PESSOA = NP.CD_PESSOA) ' +
               'JOIN NU_GRUPOS_PERMISSOES NGP ON ' +
                  '(NP.CD_GRUPO = NGP.CD_GRUPO) ' +
                  'JOIN NU_MODULOS_ACOES NMA ON ' +
                     '(NGP.CD_ACAO = NMA.CD_ACAO) ' +
      'WHERE ' +
         '(COALESCE(NGP.NR_PERMISSAO, 0) != 0) AND  ' +
         'NMA.DS_CHAVE = ''2053'' ' +
      'ORDER BY ' +
         ' US.NM_PESSOA';
   qyAux.Open();



   cbResponsavel.Clear();
   iQtdItens:= qyAux.RecordCount;

   bTodosUsuarios := False;

   if ( DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'UMFinanceiro.Recebimentos.Cobranca.Responsavel', npAlterar, false) ) then
   begin
      cbResponsavel.Items.Add('TODOS OS USUÁRIOS');
      INC(iQtdItens);
      bTodosUsuarios := True;
   end;

   if ( DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'UMFinanceiro.Recebimentos.Cobranca.Responsavel', npIncluir, false) ) then
   begin
       cbResponsavel.Items.Add('TODOS SEM USUÁRIOS');
       INC(iQtdItens);
   end;
   //
   SetLength(ListaResponsaveis, iQtdItens);

   while not qyAux.Eof do begin

      if (not DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'UMFinanceiro.Recebimentos.Cobranca.Responsavel', npalterar, false)) then
      begin
         if ( qyAux.FieldByName('nm_usuario').AsString = DM.UsuarioLogado.Pessoa.Nome)  then
         begin
            cbResponsavel.Items.Add(qyAux.FieldByName('nm_usuario').AsString);
            ListaResponsaveis[cbResponsavel.Items.Count - 1] := qyAux.FieldByName('codigo').AsInteger;

            if qyAux.FieldByName('codigo').AsInteger = DM.iCdPessoaLogado then begin
               cbResponsavel.ItemIndex := cbResponsavel.Items.Count - 1;
            end;
         end;
      end
      else
      begin
         cbResponsavel.Items.Add(qyAux.FieldByName('nm_usuario').AsString);
         ListaResponsaveis[cbResponsavel.Items.Count - 1] := qyAux.FieldByName('codigo').AsInteger;

         if qyAux.FieldByName('codigo').AsInteger = DM.iCdPessoaLogado then begin
            cbResponsavel.ItemIndex := cbResponsavel.Items.Count - 1;
         end;
      end;
      
      qyAux.Next();

   end;

   qyAux.Close();

   if bTodosUsuarios then
   begin
      cbResponsavel.ItemIndex := 0;
   end;

   // Carregar as situações

   qyAux.SQL.Text := '' +
     ' SELECT * FROM situacoes WHERE cd_modulo = 2053 ' +
     ' ORDER BY ds_valor ';

   qyAux.Open();
   qyAux.FetchAll();

   SetLength(ListaSituacoes, qyAux.RecordCount + 1);

   cbSituacao.Clear();
   cbSituacaoFinal.Clear();
   cbSituacao.Items.Add('(Todas as Situações)');
   ListaSituacoes[0] := -1;

   while not qyAux.Eof do begin

      cbSituacao.Items.Add(qyAux.FieldByName('ds_valor').AsString + '   ');
      cbSituacaoFinal.Items.Add(qyAux.FieldByName('ds_valor').AsString);
      ListaSituacoes[cbSituacao.Items.Count-1] := qyAux.FieldByName('cd_situacao').AsInteger;;

      qyAux.Next();
   end;

   qyAux.Close();

   cbSituacao.ItemIndex := 0;

end;

procedure TfrmCobranca.PreencherDadosPessoais;
Var
   i, cd_resp_fin : Integer;
   campoTexto : TComponent;
begin

   if cdsCobranca.IsEmpty() then begin

      // Nenhuma pessoa selecionada, zerar campos;

      txtNome.Text            := '';
      txtResponsavel.Text     := '';
      txtCodigoEstudante.Text := '';
      txtCPF.Text             := '';
      meEndereco.Lines.Clear();
      txtContato1.Text        := '';
      txtContato2.Text        := '';
      txtContato3.Text        := '';
      txtContato4.Text        := '';
      txtContato5.Text        := '';
      txtContato6.Text        := '';

      txtSPC.Text             := '';
      txtSPCInclusao.Text     := '';
      txtSPCRetirada.Text     := '';
      txtJuridico.Text        := '';
      txtJurInclusao.Text     := '';
      txtJurRetirada.Text     := '';

      meObservacoes.Lines.Clear();
      meRestritas.Lines.Clear();

      exit;

   end
   else
   begin
      qryDadosDevedor.Close;
      qryDadosDevedor.ParamByName('CD_PESSOA').AsInteger := cdsCobrancaCD_PESSOA.AsInteger;
      qryDadosDevedor.Open;

      cd_resp_fin             := qryDadosDevedorCD_RESP_FINAN.AsInteger;
      txtNome.Text            := qryDadosDevedorNM_PESSOA.AsString;
      txtResponsavel.Text     := qryDadosDevedorNM_RESP.AsString;
      txtCodigoEstudante.Text := qryDadosDevedorCD_PESSOA.AsString;
      txtCPF.Text             := qryDadosDevedorDS_CPF.AsString;
      meEndereco.Lines.Text   := qryDadosDevedorDS_ENDERECO.AsString;
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
         'UMFinanceiro.Obs.Financeiro', npAcesso, False) then
         meObservacoes.Lines.Text :=
            TfObservacoes.GetAllObservations(
               qryDadosDevedorCD_PESSOA.AsInteger, okFinancial)
      else
         meObservacoes.Clear;
      iCodEmpresa             := qryDadosDevedorCD_EMPRESA.AsInteger;
      pgOBS.ActivePageIndex := 0;

      if iCodEmpresa <= 0 then
         iCodEmpresa := -1;
      qyEmpresa.Close;
      qyEmpresa.ParamByName('cd_empresa').AsInteger := iCodEmpresa;
      qyEmpresa.Open;

      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
         'UMFinanceiro.Obs.Fin.Restrita', npAcesso, False) then
      begin
         tsRestrita.Visible := true;
         meRestritas.Lines.Text :=
            TfObservacoes.GetAllObservations(
               qryDadosDevedorCD_PESSOA.AsInteger, okRestrict);
      end
      else
      begin
         tsRestrita.Visible := false;
         meRestritas.Clear;
      end;                       

      txtSPC.Text := cdsCobrancasn_spc.DisplayText;
      
      if (cdsCobrancadt_spc_inclusao.IsNull) then
         txtSPCInclusao.Text := ''
      else
         txtSPCInclusao.Text := FormatDateTime('dd/mm/yyyy', cdsCobrancadt_spc_inclusao.AsDateTime);

      if cdsCobrancadt_spc_retirada.IsNull then
         txtSPCRetirada.Text := ''
      else
         txtSPCRetirada.Text := FormatDateTime('dd/mm/yyyy', cdsCobrancadt_spc_retirada.AsDateTime);

      txtJuridico.Text := cdsCobrancasn_juridico.DisplayText;

      if cdsCobrancadt_juridico_inclusao.IsNull then
         txtJurInclusao.Text := ''
      else
         txtJurInclusao.Text := FormatDateTime('dd/mm/yyyy', cdsCobrancadt_juridico_inclusao.AsDateTime);

      if cdsCobrancadt_juridico_retirada.IsNull then
         txtJurRetirada.Text := ''
      else
         txtJurRetirada.Text := FormatDateTime('dd/mm/yyyy', cdsCobrancadt_juridico_retirada.AsDateTime);

      txtContato1.Text := '';
      txtContato2.Text := '';
      txtContato3.Text := '';
      txtContato4.Text := '';
      txtContato5.Text := '';
      txtContato6.Text := '';

      // Selecionar os Contatos;

      qryContatosDevedor.Close;
      qryContatosDevedor.ParamByName('CD_PESSOA').AsInteger := cdsCobrancaCD_PESSOA.AsInteger;
      qryContatosDevedor.Open;
      
      i := 1;
      qryContatosDevedor.First();
      while not qryContatosDevedor.Eof do begin

        // for n := 0 to Panel2.ControlCount - 1 do begin
           campoTexto := FindComponent('txtContato' + IntToStr(i));
           if (campoTexto <> nil) and (campoTexto is TEdit) then
               TEdit(campoTexto).Text := qryContatosDevedor.FieldByName('ds_contato').AsString;

        // end;

         qryContatosDevedor.Next();
         INC(i);

      end;

      qryContatosDevedor.Close();

      pgOBS.ActivePage := tsDadosDevedor;

   end;

end;

procedure TfrmCobranca.PreencherHistorico();
var n : Integer;
begin
   txtHisNome.Text :=     cdsCobrancanm_pessoa.AsString;
   txtHistResponsavel.Text := cdsCobrancanm_resp.AsString;

   if cdsCobrancaDT_RETORNO.AsString = '' then begin
     // Se não tiver data de retorno registrada ainda para a cobrança
     umdtRetorno.setDate(DataHoje);
     ckbRetorno.Checked := false;
   end else begin
     // Se já tiver data de retorno selecionada na cobrança, manter a mesma selecionada
     umdtRetorno.setDate(cdsCobrancaDT_RETORNO.AsDateTime);
     ckbRetorno.Checked := true;
   end;

   // Atualizar o histórico de Contatos;
   qyContatos.DisableControls();
   qyContatos.Close();
   qyContatos.Open();

   if cdsCobranca.IsEmpty() then begin
      qyContatos.EnableControls();
      Exit;   
   end;

   iCobrancaAtual := cdsCobrancacd_cobranca.AsInteger;


   // Preencher os Contatos e Telefones;

   cbTelefone.Clear();
   cbContato.Clear();
   cbTelefone.Text := '';
   cbContato.Text := '';


   while not qyContatos.Eof do begin

      if (cbTelefone.Items.IndexOf(qyContatosds_telefone.AsString) = -1) AND
         (trim(qyContatosds_telefone.AsString) <> '')
      then begin

          cbTelefone.Items.Add(qyContatosds_telefone.AsString);

      end;

      if (cbContato.Items.IndexOf(qyContatosnm_contato.AsString) = -1) AND
         (trim(qyContatosnm_contato.AsString) <> '')
      then begin

          cbContato.Items.Add(qyContatosnm_contato.AsString);

      end;
      
      qyContatos.Next();
   end;

   // Acrescentar como Contatos o responsável e o Aluno
   if (cbContato.Items.IndexOf(cdsCobrancanm_pessoa.AsString) = -1) AND
      (trim(cdsCobrancanm_pessoa.AsString) <> '')
   then begin
       cbContato.Items.Add(cdsCobrancanm_pessoa.AsString);
   end;
   if (cbContato.Items.IndexOf(cdsCobrancanm_resp.AsString) = -1) AND
      (trim(cdsCobrancanm_resp.AsString) <> '')
   then begin
       cbContato.Items.Add(cdsCobrancanm_resp.AsString);
   end;

   // Acrescentar Telefones do cadastro
    qryContatosTel.Close;
    qryContatosTel.ParamByName('CD_PESSOA').AsInteger := cdsCobrancaCD_PESSOA.AsInteger;
    qryContatosTel.Open;

    while not qryContatosTel.Eof do begin

       if (cbTelefone.Items.IndexOf(qryContatosTelDS_CONTATO.AsString) = -1)
       then begin
           cbTelefone.Items.Add(qryContatosTelDS_CONTATO.AsString);
       end;

       qryContatosTel.Next;

    end;  

   umdtRetorno.Enabled := ckbRetorno.Checked;

   qyContatos.EnableControls();

   // Setar a situação atual;

   for n := 1 to Length( ListaSituacoes ) - 1 do begin

      if ListaSituacoes[n] = cdsCobrancacd_situacao.AsInteger then begin

         cbSituacaoFinal.ItemIndex := n - 1 ;

      end;

   end;

   qyContatos.First;


end;

procedure TfrmCobranca.PreencherTitulos;
const
   S_SQL_MENSALIDADES =
      'SELECT '+
         'ME.CD_MENSALIDADE, ME.CODIGOALUNO, ME.PARCELA, ME.DATAVENCIMENTO,' +
         'ME.DT_COMPETENCIA, ME.TURMA, ME.CD_BOLSA, ME.DATAEMISSAO,' +
         'ME.NOSSONUMERO, ME.CD_DESC_CONDICIONAL, ME.VALORBRUTO,' +
         'ME.CD_TIPO_TITULO, ME.VALORDESCONTO, ME.DS_OBS_DESC,' +
         'ME.DESCONTOEXTRA, ME.VALOREXTRA, ME.VALORTOTAL, ME.VALORJUROS,' +
         'ME.VALORJUROS_FIXO, ME.VALORPAGO, ME.VL_FATURAMENTO,' +
         'ME.DATAPAGAMENTO, ME.DT_CREDITO, ME.SITUACAO, ME.USUARIO,' +
         'ME.CD_USUARIO, ME.BLOQUETO, ME.ANOSEMESTRE, ME.DATABASECORRECAO,' +
         'ME.INDICECORRECAO, ME.CURSO, ME.DEPTO, ME.TIPOPARCELA,' +
         'ME.OCORRENCIA_REMESSA, ME.OCORRENCIA_RETORNO,' +
         'ME.SN_CREDITO_PARCELA, ME.NR_CREDITOS, ME.CD_MENSALIDADE_ORIGEM,' +
         'ME.CD_COLIGADA, ME.CD_CENTRO_CUSTO, ME.CD_PLANO_CONTA,' +
         'ME.DS_HISTORICO, ME.SN_LIBERAR_JUROS, ME.SN_LIBERAR_DESCONTOS,' +
         'ME.CD_BOLETO, ME.CD_CAIXA, ME.CD_MOEDA, ME.CD_MOEDA_PGTO,' +
         'ME.VL_PAGO_MOEDA, ME.CD_RESP, ME.CD_ITEM_PLANO, ME.VL_CREDITO,' +
         'ME.CD_RECIBO, ME.NR_NF, ME.CODIGOCARTA, ME.CD_CHEQUE_DEVOLVIDO,' +
         'ME.DS_DEPOSITO, ' +
         'LEFT(ME.DS_OBS_DESC, 150) DS_OBS, PE.NM_PESSOA NOMEALUNO,' +
         'CAST(COALESCE(ME.CD_RESP, PE.CD_RESP_FINAN) AS CHAR(10)) CD_RESP_FINAN,' +
         'RESP.NM_PESSOA NOMERESPONSAVEL, TT.DS_TIPO_TITULO, PC.DS_CONTA,' +
         'CC.DS_CENTRO, BT.DS_BOLSA, MO.DS_SIGLA, MP.DS_SIGLA MOEDAPGTO,' +
         'SF.SN_PROTESTO, AM.DS_ACAO,' +
         'GET_ACRESCIMOS(ME.CD_MENSALIDADE, NOW()) JUROS_CALC,' +
         'GET_DESCONTOS(ME.CD_MENSALIDADE, NOW()) DESCONTO_CALC, DPT.DESCRICAO AS depto_descricao, '+
         '(DATE_FORMAT(me.datavencimento, ''%s'') < DATE_FORMAT(now(), ''%s'')) AS sn_vencida, '+
         ' CASE res.ds_situacao ' +
         ' WHEN "F" THEN "Fila" ' +
         ' WHEN "E" THEN "Exportado" '  +
         ' WHEN "R" THEN "Registrado" ' +
         ' WHEN "J" THEN "Rejeitado" ' +
         ' WHEN "B" THEN "Baixado" '  +
         ' WHEN "S" THEN "Liquidado sem registro" '+
         ' ELSE '+
         ' "-" END as status_remessa ' +
      'FROM '+
         'MENSALIDADES ME ' +
            'JOIN FIN_MOEDAS MO ON ' +
               '(ME.CD_MOEDA = MO.CD_MOEDA) ' +
            'JOIN SITUACOES_FINANCEIRAS SF ON ' +
               '(ME.SITUACAO = SF.CD_SITUACAO) ' +
            'JOIN PESSOAS PE ON ' +
               '(ME.CODIGOALUNO = PE.CD_PESSOA) ' +
            'LEFT JOIN PESSOAS RESP ON ' +
               '(COALESCE(ME.CD_RESP, PE.CD_RESP_FINAN) = RESP.CD_PESSOA) ' +
            'LEFT JOIN FIN_TIPOS_TITULO TT ON ' +
               '(ME.CD_TIPO_TITULO = TT.CD_TIPO_TITULO and me.cd_coligada = tt.cd_coligada) ' +
               'LEFT JOIN DEPARTAMENTOS as DPT ON (ME.DEPTO = DPT.CODIGO) AND'+
               '(ME.CD_COLIGADA = TT.CD_COLIGADA) ' +
            'LEFT JOIN FIN_PLANO_CONTAS PC ON ' +
               '(ME.CD_PLANO_CONTA = PC.CD_CONTA) AND ' +
               '(ME.CD_COLIGADA = PC.CD_COLIGADA) ' +
            'LEFT JOIN FIN_CENTRO_CUSTOS CC ON ' +
               '(ME.CD_CENTRO_CUSTO = CC.CD_CENTRO) AND ' +
               '(ME.CD_COLIGADA = CC.CD_COLIGADA) ' +
            'LEFT JOIN FIN_BOLSAS_TIPOS BT ON ' +
               '(ME.CD_BOLSA = BT.CD_BOLSA) ' +
            'LEFT JOIN FIN_MOEDAS MP ON ' +
               '(ME.CD_MOEDA_PGTO = MP.CD_MOEDA) ' +
            ' LEFT JOIN rem_status as res ON ' +
            '  (res.nr_nossonumero = ME.nossonumero) ' +
            'LEFT JOIN FIN_ACOES_MOVIMENTO AM ON ' +
               '(ME.CD_DESC_CONDICIONAL = AM.CD_ACAO) AND ' +
               '(AM.CD_TIPO_ACAO = 3) AND ' +
               '(AM.CD_ORIGEM = 1) ' +
      'WHERE ' +
         'ME.CODIGOALUNO = :CD_PESSOA '+
         ' AND ( CASE WHEN RESP.CD_PESSOA IS NOT NULL THEN RESP.SN_NAO_BLOQUEAR_FINANCEIRO <> 1 ELSE 1 = 1 END ) ' +
         ' %s ' +
      'GROUP BY (ME.CD_MENSALIDADE)'+
      'ORDER BY ' +
         'ME.DATAVENCIMENTO,' +
         'ME.PARCELA';

   S_OP = ' AND ';
   S_FILTRO_PENDENTES = '(ME.SITUACAO = 2 OR SF.SN_PROTESTO = 1)';
   S_FILTRO_VENCIDOS = S_FILTRO_PENDENTES + S_OP + 'ME.DATAVENCIMENTO <= :DT_VENCTO';
   S_FILTRO_PAGOS = 'ME.SITUACAO IN (0, 1)';
   S_FILTRO_NEGOCIADOS = 'ME.SITUACAO = 3';
   S_FILTRO_CANCELADOS = 'ME.SITUACAO IN (4, 5, 6, 7, 8, 9)';
var
   LSFiltro : String;
begin
   txtTituloNome.Text := cdsCobrancaNM_PESSOA.AsString;
   txtTituloResponsa.Text := cdsCobrancaNM_RESP.AsString;
   if not cdsCobranca.IsEmpty then
   begin
      tblMensalidades.Close;
      if sbVencidos.Down then
      begin
         LSFiltro := S_FILTRO_VENCIDOS
      end
      else if sbPendentes.Down then
      begin
         LSFiltro := S_FILTRO_PENDENTES
      end
      else if sbPagos.Down then
      begin
         LSFiltro := S_FILTRO_PAGOS
      end
      else if sbNegociados.Down then
      begin
         LSFiltro := S_FILTRO_NEGOCIADOS
      end
      else if sbCancelados.Down then
      begin
         LSFiltro := S_FILTRO_CANCELADOS;
      end;
      if LSFiltro <> '' then LSFiltro := S_OP + LSFiltro;
      tblMensalidades.SQL.Text := Format(S_SQL_MENSALIDADES, ['%Y-%m-%d', '%Y-%m-%d', LSFiltro]);
      tblMensalidades.ParamByName('CD_PESSOA').AsInteger := cdsCobrancaCD_PESSOA.AsInteger;
      if tblMensalidades.Params.FindParam('DT_VENCTO') <> nil then
         tblMensalidades.ParamByName('DT_VENCTO').AsDateTime := DM.DataAtual;
      tblMensalidades.Open;
   end;
end;

procedure TfrmCobranca.Protestar(Sender: TObject);
var
  statusNN: TStatusNN;
  situacaoNN: TSituacaoNN;
  objRemessa: TRemessa;
begin

  if tblMensalidadesSituacao.AsInteger <> 2 then
  begin
    Mensagem( 'Selecione uma mensalidade pendente para utilizar este recurso.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

  if Mensagem('Deseja colocar a mensalidade na lista de mensalidades protestadas?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
  <> mrYes Then Exit;


  Application.CreateForm( TfrmEmProtesto, frmEmProtesto );

  with frmEmProtesto do
  begin

    tblEmProtesto.Close;
    tblEmProtesto.SQL.Clear;
    tblEmProtesto.SQL.Add( 'select * from EmProtesto where' );
    tblEmProtesto.SQL.Add( 'DataEmissao = :DataEmissao' );
    tblEmProtesto.ParamByName('DataEmissao').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
    tblEmProtesto.Open;

    tblEmProtesto.Append;
    tblEmProtestoCodigoAluno.AsInteger := tblMensalidadesCodigoAluno.AsInteger;
    tblEmProtestoTurma.AsString := tblMensalidadesTurma.AsString;
    tblEmProtestoParcela.AsInteger := tblMensalidadesParcela.AsInteger;
    tblEmProtestoDataVencimento.AsString := DateToStr(tblMensalidadesDataVencimento.AsDateTime);
    tblEmProtestoUsuario.AsString := DM.sLogin;
    tblEmProtestoGerado.AsString := 'N';
    tblEmProtestoValor.Value := tblMensalidadesValorTotalCalc.Value;
    tblEmProtestoNossoNumero.AsString := tblMensalidadesNossoNumero.AsString;
    tblEmProtestocd_mensalidade.AsString := tblMensalidadescd_mensalidade.AsString;
    tblEmProtesto.Post;

    DM.tblMensalidades.Close;
    DM.tblMensalidades.SQL.Clear;
    DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
    DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade)' );
    DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
    DM.tblMensalidades.Open;

    DM.tblMensalidades.Edit;

    Dm.tblMensalidadesSituacao.AsInteger := TMenuItem(Sender).Tag; { EM PROTESTO - conforme situação }
    Dm.tblMensalidadesValorTotal.Value := tblMensalidadesValorTotalCalc.Value;
    Dm.tblMensalidades.Post;

    DM.FazAcaoRemessa(arProtestar, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);

    if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
    begin
    
      // Verificar se o boleto está registrado
      statusNN := objRemessa.getStatusNossoNumero(DM.tblMensalidades.FieldByName('nossonumero').AsString);
      situacaoNN := statusNN.getTpSituacao();

      // Se o nosso numero estiver na fila para remessa
      if (situacaoNN = snnFila) then
      begin

        Mensagem('O nosso número do título se encontra na fila para remessa, o protesto será enviado ao banco juntamento com o registro deste nosso número.', 'Informação', MB_OK + MB_ICONINFORMATION);
      // Se o nosso numero não estiver nem registrado nem exportado
      end else if (situacaoNN <> snnRegistrado) and (situacaoNN <> snnExportado) then
      begin

        Mensagem('O nosso número do título protestado não está registrado, nesse caso o protesto será apenas no Unimestre.', 'Informação', MB_OK + MB_ICONINFORMATION);

      // Se o NN estiver REGISTRADO ou EXPORTADO
      end else if (situacaoNN = snnRegistrado) or (situacaoNN = snnExportado) then
      begin

        Mensagem('O nosso número do título está registrado no banco, o sistema enviará um pedido de protesto na próximo remessa.', 'Informação', MB_OK + MB_ICONINFORMATION);

      end;

      // registra a nova ação de cancelamento no novo modelo de remessa
      objRemessa := TRemessa.Create;
      objRemessa.registraAcaoProtesto(DM.tblMensalidades.FieldByName('nossonumero').AsString);

    end;

    PreencherTitulos();

    Mensagem('Para visualizar as mensalidades protestadas use o botão Visualizar Prot.', 'Informação', MB_OK + MB_ICONINFORMATION)
      
  end;
end;

procedure TfrmCobranca.qyCobrancaCalcFields(DataSet: TDataSet);
begin
   if qyCobranca.FieldByName('SN_SERASA').AsInteger = 1 then
   begin
      qyCobrancaDS_SERASA.AsString := 'SIM';
   end
   else
   begin
      qyCobrancaDS_SERASA.AsString := 'NÃO';
   end;
end;

procedure TfrmCobranca.qyCobrancaDIAS_ATRASOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value < 0 then
  begin
     Text := IntToStr(0);
  end else
  begin
    Text := Sender.Value;
  end;
end;

procedure TfrmCobranca.qyCobrancasn_cartorioGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
end;

procedure TfrmCobranca.qyCobrancasn_juridicoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
end;

procedure TfrmCobranca.qyCobrancasn_serasaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
end;

procedure TfrmCobranca.qyCobrancasn_spcGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if Sender.Value = 1 then
     Text := 'SIM'
   else
     Text := 'NÃO';
   
end;

procedure TfrmCobranca.rbPorVencimentoClick(Sender: TObject);
begin
   AtivarCampos();
end;

procedure TfrmCobranca.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);

   // Selecionar outros campos
   case pgCobranca.ActivePageIndex of
    0: begin
       frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(grd)), 'planilha_cobranca_campos');
       UpdateTotalsVisibilityState;
    end;
    2: begin
      frmSelColunas.fixaNuPlanilha();
      frmSelColunas.SelecionaColunas(grdMensalidades, 'planilha_cobranca_titulo_campos');
    end;
   end;
end;

procedure TfrmCobranca.sbTodosClick(Sender: TObject);
begin
   if sbTodos.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbVencidosClick(Sender: TObject);
begin
   if sbVencidos.Down then PreencherTitulos();
end;

procedure TfrmCobranca.btnDescerClick(Sender: TObject);
begin
   if NOT ( filtrosAvancados.Visible ) then
   begin

    Panel1.Height := 165;
    panel12.Height := 162;
    panel13.Height := 162;
    filtrosAvancados.Visible := True;

    btnMostrarFiltrosAvancados.Down := True;
   end else
   begin
      panel1.Height := 97;
      filtrosAvancados.Visible   := False;

     btnMostrarFiltrosAvancados.Down := False;
   end;
end;

procedure TfrmCobranca.SpeedButton1Click(Sender: TObject);
begin

   umdtInicial.setDate(StrToDate('00/00/0000'));
end;

procedure TfrmCobranca.SpeedButton27Click(Sender: TObject);
begin
 edUnidadeEnsino.Clear;
end;

procedure TfrmCobranca.SpeedButton2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   // Aluno
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if ( (resultado_filtro.cd_pessoa) <= 0 ) then
   begin
      edAluno.Text := '';
      cd_aluno := -1;

   end else
   begin
      edAluno.Text := resultado_filtro.nm_pessoa;
      cd_aluno:=resultado_filtro.cd_pessoa;
   end;
end;

procedure TfrmCobranca.SpeedButton30Click(Sender: TObject);
begin
   if TfrmSelecionarColigada.ShowModal() then
   begin
      coligada_filtrada := TfrmSelecionarColigada.getResultado();
      edUnidadeEnsino.Text := coligada_filtrada.Nome;
      cd_coligada_filtrada := coligada_filtrada.Codigo;
   end;
end;

procedure TfrmCobranca.SpeedButton3Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   // Responsável
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpRespFinanceiro);


   if ( resultado_filtro.cd_responsavel <= 0 ) then
   begin
      edResp.Text := '';
      cd_responsavel := -1;
   end else
   begin
      edResp.Text := resultado_filtro.nm_responsavel;
      cd_responsavel := resultado_filtro.cd_responsavel;
   end;
end;

procedure TfrmCobranca.SpeedButton4Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDepartamento;
begin
   if ( coligada_filtrada <> nil ) then
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([],  coligada_filtrada.Codigo);
   end else
   begin
      resultado_filtro := TfrmSelecionarDepartamento.Filtrar([], -1);
   end;

  if resultado_filtro.filtrado then
  begin
     // guarda os valores para os demais filtros
     depto_filtrado := resultado_filtro.cd_departamento;


    // seta os valores nos campos
    edDepto.Text := (resultado_filtro.ds_departamento);
    edUnidadeEnsino.Text := resultado_filtro.nm_coligada;
    coligada_filtrada := TfrmSelecionarColigada.getResultado();
  end;
end;

procedure TfrmCobranca.SpeedButton5Click(Sender: TObject);
begin
   edDepto.Clear;
end;

procedure TfrmCobranca.SpeedButton6Click(Sender: TObject);
begin
   edCurso.Clear;
end;

procedure TfrmCobranca.SpeedButton7Click(Sender: TObject);
begin
   edTurma.Clear;
end;

procedure TfrmCobranca.SpeedButton8Click(Sender: TObject);
begin
   edAluno.Clear;
end;

procedure TfrmCobranca.SpeedButton9Click(Sender: TObject);
begin
   edResp.Clear;
end;

function TfrmCobranca.SQLToCrystalExpressionReplaceColumnsToInt(
  ARegExpr: TRegExpr): string;
var
   campo: String;
   valor: Integer;
   listaCampos: TStringList;
begin
   campo := ARegExpr.Match[1];

   listaCampos := TStringList.Create();
   listaCampos.Add('{pessoas_mensalidades_pendentes.anosemestre}');
   listaCampos.Add('{pessoas_mensalidades_pendentes.cd_pessoa}');
   listaCampos.Add('{pessoas_mensalidades_pendentes.cd_resp_finan}');

   if listaCampos.IndexOf(ARegExpr.Match[1]) <> -1 then
   begin
      if (Trim(ARegExpr.Match[3]) <> '') AND TryStrToInt(ARegExpr.Match[3], valor) then
      begin
         Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], Trim(ARegExpr.Match[3]));
      end else begin
         Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], '0');
      end;
   end else begin
      Result := Concat(ARegExpr.Match[1], ARegExpr.Match[2], QuotedStr(ARegExpr.Match[3]));
   end;
end;

function TfrmCobranca.SQLToCrystalExpressionReplaceExAlias(
  ARegExpr: TRegExpr): string;
var
   alias : TStringList;
begin
   alias := TStringList.Create();
   alias.Values['CO'] := 'fin_cobranca';
   alias.Values['ME'] := 'pessoas_mensalidades_pendentes';
   alias.Values['P'] := 'pessoas_mensalidades_pendentes';
   alias.Values['R'] := 'resp';
   alias.Values['UP'] := 'resp_cob';
   alias.Values['SI'] := 'situacoes';
   alias.Values['US'] := 'usuarios';
   alias.Values['RM'] := 'resp_mensalidades';

   Result := Concat('{', alias.Values[UpperCase(ARegExpr.Match[1])], '.', LowerCase(ARegExpr.Match[2]), '}');
end;

procedure TfrmCobranca.bbtnAnexarClick(Sender: TObject);
var
   Stream: TStream;
begin
   Application.CreateForm(TfDigitalizaDoc, fDigitalizaDoc);
   if fDigitalizaDoc.ShowModal = mrOk then
   begin
      if not (qyContatos.State in dsEditModes) then
      begin
         qyContatos.Edit;
      end;
      
      Stream := qyContatos.CreateBlobStream(qyContatosBB_ANEXO, bmWrite);
      try
         if fDigitalizaDoc.pgcOpcoes.ActivePageIndex = 0 then
         begin
            fDigitalizaDoc.cimImagem.GetRegion.SaveToStream(Stream);
            qyContatosBB_ANEXO.LoadFromStream(Stream);
         end
         else if fDigitalizaDoc.pgcOpcoes.ActivePageIndex = 1 then
         begin
            qyContatosBB_ANEXO.LoadFromFile(fDigitalizaDoc.PDFPath);
         end;
      finally
         Stream.Free;
      end;
      
      qyContatos.Post;
   end;
   fDigitalizaDoc.Free;
end;

procedure TfrmCobranca.bbtnDelAnexoClick(Sender: TObject);
const
   SConfirmaExclusao = 'Deseja realmente remover o anexo do histórico?';
begin
   if MessageDlg(SConfirmaExclusao, mtConfirmation, [mbYes, mbNo], -1) = mrYes then
   begin
      if not (qyContatos.State in dsEditModes) then
      begin
         qyContatos.Edit;
      end;
      qyContatosBB_ANEXO.Clear;
      qyContatos.Post;
   end;
end;

procedure TfrmCobranca.btnCodigoAlunoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
   aba_filtro : AbasFiltroPessoa;
begin

// Responsável
resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpRespFinanceiro);
edResp.Text := IntToStr(resultado_filtro.cd_responsavel);
//
//   if ( ckbAluno.Checked ) AND ( ckbAlunoResponsavel.Checked ) then
//      aba_filtro := afpPessoa
//   else if ( ckbAluno.Checked ) then
//      aba_filtro := afpEstudante
//   else if ( ckbAlunoResponsavel.Checked ) then
//      aba_filtro := afpRespFinanceiro;
//
//   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], aba_filtro);
//
//   if resultado_filtro.filtrado then
//   begin
//      if ( resultado_filtro.Aba = afpRespFinanceiro ) then
//         txtAluno.Text := IntToStr(resultado_filtro.cd_responsavel)
//      else
//         txtAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
//   end;
end;

procedure TfrmCobranca.tblMensalidadesAfterOpen(DataSet: TDataSet);
begin
   btnImprimir.Enabled := not tblMensalidades.IsEmpty;
end;

procedure TfrmCobranca.tblMensalidadesCalcFields(DataSet: TDataSet);
var
  fDesconto, fJuros: double;

begin

  // Calcular o % do desconto extra
  if tblMensalidadesValorBruto.AsCurrency > 0 then begin
     tblMensalidadesPercDescExtra.AsCurrency := (tblMensalidadesDescontoExtra.AsCurrency / tblMensalidadesValorBruto.AsCurrency * 100);
  end else begin
     tblMensalidadesPercDescExtra.AsString := '';
  end;

  // Calcular o % do desconto condicional
  if tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency> 0 then begin
     tblMensalidadesPercDescCond.AsCurrency := (tblMensalidadesValorDesconto.AsCurrency / (tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency) * 100);
  end else begin
     tblMensalidadesPercDescCond.AsString := '';
  end;

  // Verificar se o Boleto já foi impresso
  if Dm.isTrue(tblMensalidadesBloqueto.AsString) then begin
     tblMensalidadesBloquetoImpresso.AsString := 'X'
  end else begin
     tblMensalidadesBloquetoImpresso.AsString := '';
  end;

  // Apresentar a Situação em TEXTO
  case tblMensalidadesSituacao.AsInteger of
    2 :
    Begin
      if (Self.tblMensalidadessn_vencida.AsInteger = 1) then
         tblMensalidadesDescricaoSituacao.AsString := 'VENC'
      else
         tblMensalidadesDescricaoSituacao.AsString := Dm.lst_situacao_fin_sigla[2];
      end;
    else
    begin
        tblMensalidadesDescricaoSituacao.AsString := Dm.lst_situacao_fin_sigla[tblMensalidadesSituacao.AsInteger];
    end;
  end;

  // CALCULAR O VALORTOTAL

  // Parcelas VENCIDAS
  if ( ( tblMensalidadesSituacao.Value in [ 2, 10 ] ) OR ( DM.lst_situacao_fin_prot[tblMensalidadesSituacao.AsInteger] =1 ) ) then begin

       // Pegar desconto para data de hoje
       fDesconto:= tblMensalidadesdesconto_calc.AsCurrency;

       fJuros:= tblMensalidadesValorJuros.Value + tblMensalidadesjuros_calc.AsCurrency;

       tblMensalidadesValorDescontoCalc.Value := fDesconto;

       // Novo Cálculo, incluindo o Juros pendente
       tblMensalidadesValorTotalCalc.Value := RoundFloat(
             ( tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesDescontoExtra.Value - fDesconto + fJuros) ,2);

       // Novo Juros
       tblMensalidadesValorJurosCalc.Value := RoundFloat(
               tblMensalidadesValorTotalCalc.Value - (
               tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value - fDesconto ), 2 );

   Exit;

  end else begin

     if (tblMensalidadesSituacao.AsInteger in [0,1,3] ) Then begin
      	  tblMensalidadesValorTotalCalc.Value := RoundFloat( tblMensalidadesValorTotal.Value, 2 )
     end else begin
          tblMensalidadesValorTotalCalc.Value := RoundFloat(tblMensalidadesValorBruto.Value +
                  tblMensalidadesValorExtra.Value -
                  tblMensalidadesValorDesconto.Value -
                  tblMensalidadesDescontoExtra.Value +
                  tblMensalidadesValorJuros.Value, 2 );
     end;

     tblMensalidadesValorDescontoCalc.Value := tblMensalidadesdesconto_calc.AsCurrency;
     tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value, 2 );

  end;

end;


procedure TfrmCobranca.ToolButton2Click(Sender: TObject);
begin
   if ((DM.UsuarioLogado.TemPermissao(2053, npAlterar, false)) or (DM.UsuarioLogado.TemPermissao(2065, npAlterar, false))) AND
      (cdsCobranca.RecordCount <> 0) then
   begin
      Application.CreateForm( TfrmCobrancaAltera, frmCobrancaAltera );
      frmCobrancaAltera.iCobranca := cdsCobrancacd_cobranca.AsInteger;
      frmCobrancaAltera.ShowModal;
   end
   else
      DM.UsuarioLogado.TemPermissao(2053, npAlterar, true);
end;

procedure TfrmCobranca.tsHistoricoShow(Sender: TObject);
var
   LBPermIncluir: boolean;
begin
   LBPermIncluir :=
      DM.UsuarioLogado.TemPermissao(2053, npIncluir, false) or DM.UsuarioLogado.TemPermissao(2065, npIncluir, false);
   txtHisNome.ReadOnly := not LBPermIncluir;
   txtHistResponsavel.ReadOnly := not LBPermIncluir;
   cbTelefone.Enabled := LBPermIncluir;
   cbContato.Enabled := LBPermIncluir;
   ckbRetorno.Enabled := LBPermIncluir;
   umdtRetorno.Enabled := LBPermIncluir;
   meHistorico.ReadOnly := not LBPermIncluir;
   cbSituacaoFinal.Enabled := LBPermIncluir;
end;

procedure TfrmCobranca.sbAtualizarListaClick(Sender: TObject);
begin
   iCobrancaAtual := 0;
   Filtrar();
end;

procedure TfrmCobranca.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }

   if ( coligada_filtrada <> nil ) then
   begin
      if (depto_filtrado <> 0) and (depto_filtrado <> -1) then
      begin
         resultado_filtro     := TfrmSelecionarCurso.Filtrar(
            [],
            coligada_filtrada.Codigo,
            depto_filtrado
         );
      end
      else
      begin
         resultado_filtro     := TfrmSelecionarCurso.Filtrar(
            [],
            coligada_filtrada.Codigo
         );
      end;
      
   end else
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([]);
   end;

   edCurso.Text         := resultado_filtro.ds_curso;
   edUnidadeEnsino.Text := resultado_filtro.nm_coligada;
   coligada_filtrada := TfrmSelecionarColigada.getResultado();

   cd_curso_filtrado := resultado_filtro.cd_curso;
   depto_filtrado    := resultado_filtro.cd_departamento;
end;

procedure TfrmCobranca.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   coligada_filtro_interno, ano_semestre_filtro : integer;
begin
   { Pesquisar Turmas }

      if (  coligada_filtrada = nil ) then
      begin
         coligada_filtro_interno := -1;
      end else
      begin
         coligada_filtro_interno :=  coligada_filtrada.Codigo;
      end;

      if ( depto_filtrado <= 0) then
      begin
         depto_filtrado := -1;
      end;

      if txtAnoSemestreFiltro.text = '' then
      begin
         ano_semestre_filtro := -1;
      end
      else
      begin
         ano_semestre_filtro := StrToInt(txtAnoSemestreFiltro.text);
      end;

      resultado_filtro := TfrmSelecionarTurma.Filtrar(
         [],
         ano_semestre_filtro,
         coligada_filtro_interno,
         depto_filtrado,
         cd_curso_filtrado
      );

     edTurma.Text      := resultado_filtro.ds_turma;

     cd_turma_filtrada := resultado_filtro.cd_turma;
     cd_curso_filtrado := resultado_filtro.cd_curso;
     depto_filtrado    := resultado_filtro.cd_departamento;
     coligada_filtrada := TfrmSelecionarColigada.getResultado();
end;

procedure TfrmCobranca.sbCanceladosClick(Sender: TObject);
begin
   if sbCancelados.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmCobranca.sbLimparAnosemestreClick(Sender: TObject);
begin
   txtAnoSemestreFiltro.Clear;
end;

procedure TfrmCobranca.sbNegociadosClick(Sender: TObject);
begin
   if sbNegociados.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbPagosClick(Sender: TObject);
begin
   if sbPagos.Down then PreencherTitulos();
end;

procedure TfrmCobranca.sbPendentesClick(Sender: TObject);
begin
   if sbPendentes.Down then PreencherTitulos();
end;

procedure TfrmCobranca.UpdateTotalsVisibilityState;
var
   I: Integer;
begin
   lblTotalBruto.Visible := False;
   dbeTotalBruto.Visible := False;
   lblTotalDesconto.Visible := False;
   dbeTotalDesconto.Visible := False;
   lblTotalAtualizado.Visible := False;
   dbeTotalAtualizado.Visible := False;
   lblTotalLiquido.Visible := False;
   dbeTotalLiquido.Visible := False;

   for I := 0 to grd.Columns.Count - 1 do
   begin
      if grd.Columns[I].FieldName = 'VL_BRUTO' then
      begin
         lblTotalBruto.Visible := True;
         dbeTotalBruto.Visible := True;
      end;

      if grd.Columns[I].FieldName = 'VL_DESC_FIXO' then
      begin
         lblTotalDesconto.Visible := True;
         dbeTotalDesconto.Visible := True;
      end;

      if grd.Columns[I].FieldName = 'VL_ATUALIZADO' then
      begin
         lblTotalAtualizado.Visible := True;
         dbeTotalAtualizado.Visible := True;
      end;

      if grd.Columns[I].FieldName = 'VL_LIQUIDO' then
      begin
         lblTotalLiquido.Visible := True;
         dbeTotalLiquido.Visible := True;
      end;       
   end;
end;

procedure TfrmCobranca.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if (  txtAnoSemestreFiltro.text = '' ) then
  begin
      txtAnoSemestreFiltro.text := IntTOStr(Dm.GetAnoSemestreAtual);
  end;
  

 if Button = btNext then
  begin
     txtAnoSemestreFiltro.text := DM.incrementar_ano_semestre(txtAnoSemestreFiltro.Text);
  end
  else
  begin
    txtAnoSemestreFiltro.text := DM.decrementar_ano_semestre(txtAnoSemestreFiltro.Text);
  end;
end;
end.
