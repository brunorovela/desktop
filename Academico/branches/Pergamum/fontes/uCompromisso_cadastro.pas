unit uCompromisso_cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DB, UZDataset,DBGrids, UMGrid,
  Mask, ComCtrls, UItemCompromisso, udm, uSelConta,
  uFinContasPagarClass, Contnrs, General, UItemCompromissoFormaPgto,
  UMEditMonetario, UMEditJump, uItemPessoaConta, uClassMovimento, uFinApropriaCPClass,
  UCompromisso_apropria_altera, UMEditNumerico, uCompromisso_historico,
  uCompromisso_cadastro_acoes, UMComboBox, ZAbstractRODataset, ZAbstractDataset,
  ZSqlUpdate, ImgList, StrUtils, uBuscaCentro, uCentroCusto, uItemCombo, UMAjuda,
  AppEvnts;

type
   TfrmCompromissoCadastro = class(TForm)
    pnGridParcelas: TPanel;
    sgParcelas: TStringGrid;
    pnInfoCompromissos: TPanel;
    lbFornecedor: TLabel;
    lbTipoTitulo: TLabel;
    lbNrDocumento: TLabel;
    lbDtEmissao: TLabel;
    lbPlanoContas: TLabel;
    lblHistorico: TLabel;
    lbDtCompetencia: TLabel;
    lbVlNota: TLabel;
    lbQtdParcelas: TLabel;
    lbPrimeiroVencimento: TLabel;
    sbFornecedor: TSpeedButton;
    sbPlanoContas: TSpeedButton;
    txtCdFornecedor: TEdit;
    txtNrDocumento: TEdit;
    chkNFEntregue: TCheckBox;
    txtDsHistorico: TEdit;
    pnTitulo: TPanel;
    pnInfoParcelas: TPanel;
    pnPgtoBoleto: TPanel;
    lbBoletoPagamentoCom: TLabel;
    lblInfoBoletoFormaPgto: TLabel;
    lbParBoletoCodigoBarras: TLabel;
    txtParBoletoCodigoBarras: TEdit;
    pnPgtoCartaoCredito: TPanel;
    lbCCPagamentoCom: TLabel;
    lbInfoCCPagamentoCom: TLabel;
    lbParCCBanco: TLabel;
    lbParCCAgencia: TLabel;
    lbParCCDigAgencia: TLabel;
    lbParNrContaCorrente: TLabel;
    lbParCCDigContaCorrente: TLabel;
    lbParCCDifAgenciaConta: TLabel;
    lbDadosBancoAgencia: TLabel;
    pnPgtoDarf: TPanel;
    lbParDarfPagamentoCom: TLabel;
    lbParDarfCodigoReceitaTributo: TLabel;
    lbParDarfNrReferencia: TLabel;
    lbInfoDarfPagamentoCom: TLabel;
    txtParDarfCodigoReceitaTributo: TEdit;
    txtParDarfNrReferencia: TEdit;
    pnPgtoGPS: TPanel;
    lbParGpsPagamentoCom: TLabel;
    lbInfoParGpsPagamentoCom: TLabel;
    lbParGpsCodigoReceitaTributo: TLabel;
    lbParGpsPgtoINSS: TLabel;
    lbParGpsValorOutraEntidade: TLabel;
    lbParGpsAtualizacaoMonetaria: TLabel;
    txtParGpsCodigoReceitaTributo: TEdit;
    txtParCCBanco: TEdit;
    txtParCCAgencia: TEdit;
    txtParCCDigAgencia: TEdit;
    txtParCCContaCorrente: TEdit;
    txtParCCDigContaCorrente: TEdit;
    txtParCCDifAgenciaConta: TEdit;
    pnTituloParcelas: TPanel;
    pnBotoes: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    txtDtCompetencia: TMaskEdit;
    txtDtPrimeiroVencimento: TMaskEdit;
    txtDtEmissao: TMaskEdit;
    txtQtdeParcelas: TUMEditNumerico;
    btnDuplicarCompromisso: TBitBtn;
    pnCriteriosOpcoes: TPanel;
    lbCentroCusto: TLabel;
    pnGridCriterios: TPanel;
    sgGridApropriacoes: TStringGrid;
    sbCriterioInserir: TSpeedButton;
    sbCriterioEditar: TSpeedButton;
    sbCriterioApagar: TSpeedButton;
    sbCadastrarHistorico: TSpeedButton;
    pnLinhaDigitavel: TPanel;
    txtLinhaDigitavelGrupo8: TEditJump;
    txtLinhaDigitavelGrupo7: TEditJump;
    txtLinhaDigitavelGrupo6: TEditJump;
    txtLinhaDigitavelGrupo5: TEditJump;
    lbPontoGrupo3: TLabel;
    txtLinhaDigitavelGrupo4: TEditJump;
    lbPontoGrupo2: TLabel;
    txtLinhaDigitavelGrupo3: TEditJump;
    txtLinhaDigitavelGrupo2: TEditJump;
    lbPontoGrupo1: TLabel;
    txtLinhaDigitavelGrupo1: TEditJump;
    lbLinhaDigitavel: TLabel;
    txtParGpsPgtoINSS: TUMEditMonetario;
    txtParGpsValorOutraEntidade: TUMEditMonetario;
    txtParGpsAtualizacaoMonetaria: TUMEditMonetario;
    lbNomeFornecedor: TPanel;
    pnParParcela: TPanel;
    Label2: TLabel;
    lbInfoParcela: TLabel;
    txtCdConta: TUMEditNumerico;
    pnPgtoBoletoArrecadacao: TPanel;
    lblInfoBoletoArrecadacaoFormaPgto: TLabel;
    lbParBoletoCodigoBarrasArrecadacao: TLabel;
    txtParBoletoCodigoBarrasArrecadacao: TEdit;
    lbLinhaDigitavelArrecadacao: TLabel;
    txtGrupo1: TEditJump;
    txtGrupo2: TEditJump;
    txtGrupo3: TEditJump;
    txtGrupo4: TEditJump;
    txtGrupo6: TEditJump;
    txtGrupo7: TEditJump;
    txtGrupo8: TEditJump;
    txtGrupo5: TEditJump;
    pcTabParcela: TPageControl;
    Parcela: TTabSheet;
    tsObservacao: TTabSheet;
    txtObservacao: TMemo;
    txtVlNota: TUMEditMonetario;
    cmbTipoTitulo: TUMComboBox;
    cmbHistorico: TUMComboBox;
    cmbPlanoContas: TUMComboBox;
    cmbCriterioApropriacao: TUMComboBox;
    cmbDadosBancoAgencia: TUMComboBox;
    lbInfo: TLabel;
    txtTurmaProfessor: TEdit;
    sbTurmaProfessor: TSpeedButton;
    lbTurma: TLabel;
    sbExcluirConta: TSpeedButton;
    tbsParcelaAnexos: TTabSheet;
    qryAnexosParc: TUMZQuery;
    qryAnexosParcCD_TITULO: TLargeintField;
    qryAnexosParcCD_COLIGADA: TSmallintField;
    qryAnexosParcDT_INCLUSAO: TDateTimeField;
    qryAnexosParcDS_OBSERVACAO: TStringField;
    qryAnexosParcBB_ANEXO: TBlobField;
    dsAnexosParc: TDataSource;
    dbgAnexosParc: TDBGrid;
    bvlSep1: TBevel;
    pnlBotoes: TPanel;
    sbAnexar: TSpeedButton;
    sbDelAnexo: TSpeedButton;
    updAnexosParc: TZUpdateSQL;
    ilAnexos: TImageList;
    qryAnexosParcCD_ANEXO: TLargeintField;
    ScrollBox1: TScrollBox;
    lbComplementoHistorico: TLabel;
    txtComplementoHistorico: TEdit;
    txtParHistorico: TEdit;
    lbParHistorico: TLabel;
    chkSnPrevisao: TCheckBox;
    cmbCaixa: TUMComboBox;
    lbParCaixa: TLabel;
    txtParValorMora: TUMEditMonetario;
    lbValorMora: TLabel;
    lbParValor: TLabel;
    txtParvlNota: TUMEditMonetario;
    txtParProvavelPgto: TMaskEdit;
    lbParDtProvavelPgto: TLabel;
    txtParVencimento: TMaskEdit;
    lbParVencimento: TLabel;
    txtParCdTitulo: TEdit;
    lbCdTitulo: TLabel;
    txtParValorAbatimento: TUMEditMonetario;
    lbParValorAbatimento: TLabel;
    lbParValorDesconto: TLabel;
    txtParValorDesconto: TUMEditMonetario;
    txtParValorMulta: TUMEditMonetario;
    lbValorMulta: TLabel;
    cmbFormaPgto: TUMComboBox;
    lbParFormaPgto: TLabel;
    sbSelecionaCentro: TSpeedButton;
    cbCentrosAnaliticos: TUMComboBox;
    cbBaixar: TCheckBox;
    edValorPagar: TUMEditMonetario;
    Label1: TLabel;
    UMAjuda1: TUMAjuda;
    ApplicationEvents1: TApplicationEvents;
    qryAnexosParcDS_EXTENSAO: TStringField;
    qryColigadas: TUMZQuery;
    qryColigadascd_coligada: TIntegerField;
    qryColigadasnm_coligada: TStringField;
    qryColigadassn_bloquear_financeiro: TSmallintField;
    qryColigadasdt_bloqueio_financeiro: TDateField;
    qryColigadassn_bloquear_boleto: TSmallintField;
    qryColigadasdt_bloqueio_boleto: TDateField;
    procedure txtDtEmissaoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure txtParBoletoCodigoBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtParBoletoCodigoBarrasArrecadacaoEnter(Sender: TObject);
    procedure txtParValorAbatimentoExit(Sender: TObject);
    procedure txtParValorDescontoExit(Sender: TObject);
    procedure txtParValorMultaExit(Sender: TObject);
    procedure txtParValorMoraExit(Sender: TObject);
    procedure txtParBoletoCodigoBarrasChange(Sender: TObject);
    procedure txtParBoletoCodigoBarrasArrecadacaoChange(Sender: TObject);
    procedure cbBaixarClick(Sender: TObject);
    procedure cbCentrosAnaliticosChange(Sender: TObject);
    procedure cmbTipoTituloCloseUp(Sender: TObject);
    procedure txtParvlNotaExit(Sender: TObject);
    procedure txtDtPrimeiroVencimentoExit(Sender: TObject);
    procedure cbCentrosAnaliticosSelect(Sender: TObject);
    procedure sbSelecionaCentroClick(Sender: TObject);
    procedure dbgAnexosParcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgAnexosParcDblClick(Sender: TObject);
    procedure dbgAnexosParcDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbDelAnexoClick(Sender: TObject);
    procedure sbAnexarClick(Sender: TObject);
    procedure sbExcluirContaClick(Sender: TObject);
    procedure sbTurmaProfessorClick(Sender: TObject);
    procedure txtComplementoHistoricoExit(Sender: TObject);
    procedure lbComplementoHistoricoClick(Sender: TObject);
    procedure cmbDadosBancoAgenciaChange(Sender: TObject);
    procedure cmbDadosBancoAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCriterioApropriacaoChange(Sender: TObject);
    procedure cmbCriterioApropriacaoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbPlanoContasChange(Sender: TObject);
    procedure cmbPlanoContasKeyPress(Sender: TObject; var Key: Char);
    procedure cmbHistoricoChange(Sender: TObject);
    procedure cmbHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTipoTituloKeyPress(Sender: TObject; var Key: Char);
    procedure txtParHistoricoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCaixaChange(Sender: TObject);
    procedure cmbCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure cmbFormaPgtoChange(Sender: TObject);
    procedure cmbFormaPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure txtVlNotaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDsHistoricoExit(Sender: TObject);
    procedure txtVlNotaExit(Sender: TObject);
    procedure txtGrupo8Exit(Sender: TObject);
    procedure txtParBoletoCodigoBarrasArrecadacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure txtParBoletoCodigoBarrasArrecadacaoExit(Sender: TObject);
    procedure txtParCdTituloKeyPress(Sender: TObject; var Key: Char);
    procedure chkSnPrevisaoKeyPress(Sender: TObject; var Key: Char);
    procedure txtCdContaKeyPress(Sender: TObject; var Key: Char);
    procedure txtCdContaExit(Sender: TObject);
    procedure sbCadastrarHistoricoClick(Sender: TObject);
    procedure sbCriterioInserirClick(Sender: TObject);
    procedure sbCriterioApagarClick(Sender: TObject);
    procedure sbCriterioEditarClick(Sender: TObject);
    procedure sgParcelasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgGridApropriacoesDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure txtCdFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure btnDuplicarCompromissoClick(Sender: TObject);
    procedure txtQtdeParcelasExit(Sender: TObject);
    procedure txtQtdeParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure chkNFEntregueKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtEmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure txtParVencimentoExit(Sender: TObject);
    procedure txtParVencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure txtParProvavelPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure txtParProvavelPgtoExit(Sender: TObject);
    procedure txtDtCompetenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtParGpsCodigoReceitaTributoKeyPress(Sender: TObject;
      var Key: Char);
    procedure txtParDarfNrReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtParDarfCodigoReceitaTributoKeyPress(Sender: TObject;
      var Key: Char);
    procedure txtParHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCentroCustoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtPrimeiroVencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure txtDtCompetencia1KeyPress(Sender: TObject; var Key: Char);
    procedure txtDsHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure txtNrDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure txtLinhaDigitavelGrupo8Exit(Sender: TObject);
    procedure txtParBoletoCodigoBarrasExit(Sender: TObject);
    procedure sgGridApropriacoesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgGridApropriacoesDblClick(Sender: TObject);
    procedure txtParCCDifAgenciaContaKeyPress(Sender: TObject; var Key: Char);
    procedure txtParCCDigContaCorrenteKeyPress(Sender: TObject; var Key: Char);
    procedure txtParCCContaCorrenteKeyPress(Sender: TObject; var Key: Char);
    procedure txtParCCDigAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtParCCAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure txtParCCBancoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure sgParcelasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPlanoContasClick(Sender: TObject);
    procedure sbFornecedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure getListaTipoTitulo();
    procedure getListaPlanoContas();
    procedure getListaCentroCustos();
    procedure getListaHistorico();
    procedure getListaFormasPgto();
    procedure getListaContas( cd_caixa: Integer = -1 );
    procedure getListaBancoAgencia();
    procedure getListaCristerios();
    procedure AjustaValoresApropriacoes();
   private
    { Private declarations }
    cd_titulo_gerado          : Integer;
    cd_caixa_inativo          : Boolean;
    cd_compromisso            : string;
    cd_compromisso_principal  : string;
    nr_parcela                : string;
    nr_total_parcelas         : string;
    cd_apropriacao_selecionada: integer;
    objCompromisso            : TFinContasPagar;
    objParcelaSelecionada     : TFinContasPagar;
    ListaParcelas             : TObjectList;
    objApropriacao            : TFinApropriaCP;
    ListaApropriacoes         : TObjectList;
    form_estado               : string;
    varias_parcelas           : Boolean;
    data_hoje                 : TDateTime;
    cd_fornecedor             : string;
    ListaCdTitulos            : TStringList;
    mascara_padrao_historico  : string;
    sn_professor              : boolean;
    cd_turma                  : string;
    cd_disciplina             : string;
    nr_anosemestre            : string;
    centro_custo_inativo      : Boolean;
    cd_compromisso_gerado     : string;
    cd_coligada_gerado        : string;
    
    objCentroSelecionado      : TCentroCusto;

    {O objeto abaixo serve para ver se determinados campos foram
    alterados para manipulação da autorização do compromisso}
    ListaCopiaParcelas        : TObjectList;
    objCopiaCompromisso       : TFinContasPagar;
    objParcelaCopiaSelecionada: TFinContasPagar;
    cd_plano_contas_inicial   : string;
    cd_centro_custos_inicial  : string;
    bAlteraHistorico          : boolean;
    bAlteraValor              : boolean;
    bAlteraPlanoContas        : boolean;
    bAlteraFornecedor         : boolean;
   public
      { Public declarations }
      cd_coligada_seleciona   : Integer;
      alterou_turma           : boolean;
      cd_tipo_titulo          : Integer;
      
      Procedure AutenticarCompromisso(sMascara : String = '');
      Procedure ApropriaValoresCP(CodMovimento : Integer; ValorBaixado : Currency; cd_titulo: Integer; cd_coligada: Integer);
      procedure setCodigoCompromisso( codigo: string );
      procedure setCodigoCompromissoPrincipal( codigo: string );
    procedure setNrParcela( codigo: string );
    procedure setFormEstado( valor: string );
    procedure setSnVarParcelas( valor: boolean );
    procedure gerarParcelas();
    procedure setDataHoje( data : TDateTime );
    procedure carregaParcelasGrid();
    procedure carregaApropriacaoGrid();
    procedure carregaCamposParcelaSelecionada(avisaContaInativa: Boolean = False);
    procedure selecionaParcela( nr_parcela:integer );
    procedure selecionaApropriacao( cd_titulo_principal: string; cd_coligada: string; cd_conta:string; cd_centro: string );
    procedure salvaParcelaSelecionadaObjeto();
    procedure limpaTodosObjetos();
    procedure limpaCamposFormaPgto();
    procedure limpaCamposParcela();
    procedure liberaObjListaParcelas();
    procedure paineisFormaPgto( sFormaPgtoSelecionada: string );
    procedure carregaCamposFormPgto( ds_chave_pgto: string );
    procedure salvaCamposFormPgto( nr_parcela: integer; ds_chave_pgto: string );
    procedure atualizaListaDadosBancosAgencia();
    procedure recuperaSelecaoDadosBancoAgencia();
    procedure atualizaCabecalhoTodasParcelas();
    procedure GeraMovimento(tipo_acao: TTipoMovimento; cd_titulo: string; cd_coligada: string; vl_despesa: double );
    procedure GeraApropriacao( cd_titulo: string; cd_coligada: string; cd_conta: string; cd_centro: string; vl_despesa: string);
    procedure MontaObjetosApropriacoes( cd_apropriacao: integer );
    procedure inserirParcelas();
    procedure alterarParcelas();
    procedure escritaBotoesDadosAgencia( valor: boolean );
    procedure carregarRegistro();
    procedure carregaApropriacao( cd_titulo: string );
    procedure limpaRegistroApropriacoes();
    procedure atualizaApropriacoesTesouraria();
    procedure processaCampoCodigoBarras();
    procedure CalculaLinhaDigitavel( ds_codigo_barras: string );
    procedure CalculaCodigoBarras();
    procedure limpaLinhaDigitavel();
    procedure limpaLinhaDigitavelArrecadacao();
    procedure processaParcela();
    procedure ProcessaCamposFormaPgtoCaixa;
    procedure setTotalParcelas( valor: string );
    procedure selecionaParcelaGrid();
    procedure setCdFornecedor( valor: string );
    procedure painelApropriacao( valor:boolean );
    procedure painelApropriacaoBloqueio();
    procedure limpaGridApropriacoes();
    procedure BloquearAlteracaoParcela( valor : boolean );
    procedure atualizaListaHistorico();
    procedure VerPainelLinhaDigitavel( valor: boolean );
    procedure SelecionaPlanoConta( cd_conta: string );
    procedure VerificaSetaAutorizacao();
    procedure setListaCdTitulos( nr_total_parcelas: integer );
    procedure MontaCodigoArrecadacao();
    procedure MontaLinhaDigitavelArrecadacao();
    procedure setCdTurmaDiscAnoSem( vl_turma : string; vl_disciplina: string; vl_anosemestre : string );
    procedure atualizaValorPagar();

    procedure carregaCentroSintetico(cd_centro: Integer);
    procedure loadCentrosAnaliticos();

    procedure baixarCompromisso(cd_caixa_sel: Integer; valor: Currency; valor_multa: Currency; dataProvavelPgto: TDateTime);

    function buscaCodigoApropricao(cd_titulo: Integer) : Integer;
    function getCdTurma : string;
    function getCdDisciplina: string;
    function getNrAnosemestre : string;
    function getPlanoContaPadraoFornecedor( cd_pessoa: string ) : string;
    function verificaValoresApropriados() : Boolean;
    function getParametroUltimoTitulo() : string;
    function validaFormasPgto() : Boolean;
    function substituiCaracter( valor: string; str_antigo: string; str_novo: string ) : string;
    function getformataValorParaObjeto( valor: double ) : string;
    function getFormataParaDouble( valor: string ): double;
    function getValorFormatadoDoObjeto( valor: string ) : string;
    function getValorDoObjeto( valor: string ): string;
    function getComboCheck( valor: boolean ) : string;
    function getDataFormatada( formatacao:string; valor: string ) : string;
    function getCodigoCompromisso() : string;
    function getCodigoCompromissoPrincipal() : string;
    function getNrParcela() : string;
    function getFormEstado() : string;
    function getSnVarParcelas() : boolean;
    function getDataHoje(): string;
    function formataValor( valor: double ) : string;
    function getProximoVencimento( dtVencimentoInicial: TDateTime; dtVencimento: TDateTime ) : TDateTime;
    function getProximaCompetencia( dtCompetenciaInicial: TDateTime; dtCompetencia: TDateTime ) : TDateTime;
    function getData( data:string ) : string;
    function BuscaNome(cd_pessoa: integer): string;
    function BuscaDescricaoConta( cd_conta: string ) : string;
    function BuscaDescricaoCentroCusto( cd_centro: string ) : string;
    function CamposObrigatoriosValidados() : boolean;
    function getTotalParcelas():string;
    function getCdFornecedor():string;
    function Mod10( grupo : string ) : string;
    function somaProduto( numero: string ) : integer;
    function getHistoricoPadrao( objParcela : TFinContasPagar ) : string;
    function valoresIguais( valor_compromisso: string; valor_novo: string ) : boolean;
    function ehProfessor( cd_pessoa : string ) : boolean;
    function getColigadaTitulo(cd_titulo: Integer): Integer;

    procedure verificaPodeBaixarComp();
    

   end;

var
   frmCompromissoCadastro: TfrmCompromissoCadastro;

const
  COD_ACAO_PADRAO                = 6;
  iPainelDetalhesParcela         = 170;
  iPainelPgtoBoleto              = 75;
  iPainelPgtoBoletoArrecadacao   = 75;
  iPainelCartaoCredito           = 75;
  iPainelPgtoDarf                = 75;
  iPainelPgtoGPS                 = 75;
  iPainelBotoes                  = 37;
  iTamCodigoBarrasArrecadacao    = 44;
  iTamCodigoBarrasBoletoBancario = 44;

implementation

uses
   uCompromisso_despesa_professor, uBuscaDisciplina, UFDigitalizaDoc,
   uFSelecionarPessoa, uContasPagar_Planilha, uUsuario, uTesouraria_gerar,
   uCompromisso_autorizar;

{$R *.dfm}

procedure TfrmCompromissoCadastro.setFormEstado( valor: string );
begin
   Self.form_estado := valor;
   tbsParcelaAnexos.TabVisible := valor = 'alterar';
end;

procedure TfrmCompromissoCadastro.setListaCdTitulos( nr_total_parcelas: integer );
var
   i              : integer;
   totalCdTitulos : integer;
begin
   if ListaCdTitulos = nil then
   begin
      ListaCdTitulos := TStringList.Create();
      totalCdTitulos := 0;
   end
   else
   begin
      totalCdTitulos := ListaCdTitulos.Count;
   end;

   if totalCdTitulos < nr_total_parcelas then
   begin
      for i := 1 to (nr_total_parcelas - totalCdTitulos) do
      begin
         ListaCdTitulos.Add( Self.getParametroUltimoTitulo() );
      end;
   end;
end;

procedure TfrmCompromissoCadastro.setSnVarParcelas(valor: boolean);
begin
   Self.varias_parcelas := valor;
end;

procedure TfrmCompromissoCadastro.setTotalParcelas(valor: string);
begin
   Self.nr_total_parcelas := valor;
end;

procedure TfrmCompromissoCadastro.sgGridApropriacoesDblClick(Sender: TObject);
begin
   if cd_apropriacao_selecionada >= 0 then
   begin
     Application.CreateForm( TfrmApropriaAltera, frmApropriaAltera );

     frmApropriaAltera.ListaApropriacoes := Self.ListaApropriacoes;
     frmApropriaAltera.setCdApropriacaoSelecionada( cd_apropriacao_selecionada );
     frmApropriaAltera.setFormEstado('alterar');
     frmApropriaAltera.cd_coligada_seleciona := Self.cd_coligada_seleciona;
     frmApropriaAltera.ShowModal();

     Self.carregaApropriacaoGrid();
   end;
end;

procedure TfrmCompromissoCadastro.sgGridApropriacoesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  LarguraTexto  : integer;
  AlturaTexto   : integer;
  x             : integer;
  y             : integer;
  Texto         : string;
begin
   //se identificar que é a coluna 4 (valor) alinha a direita.
   if (ACol = 4) and (ARow > 0) then
   begin
      { Pega o texto da célula }
      Texto := sgGridApropriacoes.Cells[ACol, ARow];

      { Calcura largura e altura (em pontos) do texto }
      LarguraTexto  := sgGridApropriacoes.Canvas.TextWidth(Texto);
      AlturaTexto   := sgGridApropriacoes.Canvas.TextHeight(Texto);

      { Calcula a posição horizontal do início do texto }
      //alinha a direita
      x := Rect.Right - LarguraTexto - 2;

      { Calcula a posição vertical do início do texto para
      que seja impresso no centro (verticalmente) da célula }
      y := Rect.Top + (Rect.Bottom - Rect.Top) div 2 - AlturaTexto div 2;

      { Pinta o texto }
      sgGridApropriacoes.Canvas.TextRect(Rect, x, y, Texto);
   end;
end;

procedure TfrmCompromissoCadastro.sgGridApropriacoesSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
   cd_titulo   : string;
   cd_coligada : string;
   cd_conta    : string;
   cd_centro   : string;
begin
   cd_titulo   := Self.getCodigoCompromissoPrincipal;
   cd_conta    := sgGridApropriacoes.Cells[0, ARow];
   cd_centro   := sgGridApropriacoes.Cells[2, ARow];
   cd_coligada := inttostr(self.cd_coligada_seleciona);

   Self.selecionaApropriacao( cd_titulo, cd_coligada, cd_conta, cd_centro );

end;

procedure TfrmCompromissoCadastro.sgParcelasDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  LarguraTexto  : integer;
  AlturaTexto   : integer;
  x             : integer;
  y             : integer;
  Texto         : string;
  objParcela    : TFinContasPagar;
begin
   //se identificar que é a coluna 4 (valor) alinha a direita.
   if (ACol = 3) and (ARow > 0) then
   begin
      { Pega o texto da célula }
      Texto := sgParcelas.Cells[ACol, ARow];

      { Calcura largura e altura (em pontos) do texto }
      LarguraTexto  := sgParcelas.Canvas.TextWidth(Texto);
      AlturaTexto   := sgParcelas.Canvas.TextHeight(Texto);

      { Calcula a posição horizontal do início do texto }
      //alinha a direita
      x := Rect.Right - LarguraTexto - 2;

      { Calcula a posição vertical do início do texto para
      que seja impresso no centro (verticalmente) da célula }
      y := Rect.Top + (Rect.Bottom - Rect.Top) div 2 - AlturaTexto div 2;

      { Pinta o texto }
      sgParcelas.Canvas.TextRect(Rect, x, y, Texto);
   end;

   with Sender as TStringGrid do
   begin
      if ARow > 0  then
      begin
         objParcela := (sgParcelas.Objects[0,aRow] as TFinContasPagar);

         if objParcela <> nil then
         begin
            if  objParcela.getValorCampo('dt_pagamento') <> '' then
            begin
               //Canvas.Brush.Color:= clyellow;

               Canvas.Font.Color := clGray;
               Canvas.FillRect(Rect);
               Canvas.TextOut(rect.Left, rect.Top, cells[acol, arow]);
            end
            else
            begin
               //Canvas.Brush.Color:= clWhite;
               
               Canvas.Font.Color := clBlack;
               Canvas.FillRect(Rect);
               Canvas.TextOut(rect.Left, rect.Top, cells[acol, arow]);
            end;
         end;

      end;
   end;
end;

procedure TfrmCompromissoCadastro.sgParcelasSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin

   if aRow > 0 then
   begin

      if objParcelaSelecionada = nil then
      begin
         objParcelaSelecionada := (sgParcelas.Objects[0,aRow] as TFinContasPagar);

         if getFormEstado() = 'alterar' then
         begin
            objParcelaCopiaSelecionada :=  (sgParcelas.Objects[1,aRow] as TFinContasPagar);
         end;
      end
      else
      begin
         Self.salvaParcelaSelecionadaObjeto();
         objParcelaSelecionada := (sgParcelas.Objects[0,aRow] as TFinContasPagar);

         if getFormEstado() = 'alterar' then
         begin
            objParcelaCopiaSelecionada :=  (sgParcelas.Objects[1,aRow] as TFinContasPagar);
         end;

      end;

      if Self.getFormEstado() = 'alterar' then
      begin
         //bloqueia alteração caso exista uma data de pagamento
         if objParcelaSelecionada.getValorCampo('dt_pagamento') <> '' then
         begin
            Self.BloquearAlteracaoParcela( false );
         end
         else
         begin
            Self.BloquearAlteracaoParcela( true );
         end;
      end;

      //Lê o objeto de compromissos e alimenta o grid
      Self.carregaParcelasGrid();
      Self.carregaCamposParcelaSelecionada(true);
      
   end;

end;

function TfrmCompromissoCadastro.somaProduto(numero: string): integer;
var
   i     : integer;
   iSoma : integer;
begin
   iSoma := 0;

   for i := 1 to Length(numero) do
   begin
      iSoma := iSoma + StrToInt( copy(numero,i,1) );
   end;

   Result := iSoma;
end;

procedure TfrmCompromissoCadastro.sbSelecionaCentroClick(Sender: TObject);
var
   retorno: TResultadoBuscaCentro;
   i: Integer;
begin

   { Deve possuir um plano de contas selecionado antes de procurar um
     centro de custo }
   if cmbPlanoContas.ItemIndex = -1 then
   begin
      Mensagem(
         'Favor selecionar um Plano de Contas para prosseguir com esta operação.',
         'Aviso',
         MB_ICONWARNING + MB_OK
      );

      Exit;
   end;

   retorno := TfrmBuscaCentro.getInstancia.ShowModal();

   if retorno.objCentro <> nil then
   begin
   
      if retorno.objCentro.TipoCentro = 2 then
      begin
         cmbCriterioApropriacao.ItemIndex := 1;

         painelApropriacao(true);
         painelApropriacaoBloqueio();

         limpaGridApropriacoes;

         carregaCentroSintetico(retorno.objCentro.Centro);

         carregaApropriacaoGrid;
      end;

      if retorno.objCentro.TipoCentro = 1 then
      begin
         cbCentrosAnaliticos.ItemIndex := -1;

         objCentroSelecionado := retorno.objCentro;

         //Caso seja selecionado um centro de custo do tipo 1 e inativo
         if (objCentroSelecionado.Ativo = False) then
         begin

            if (Mensagem(
                  'O centro de custo selecionado está inativo, deseja registrar o compromisso neste centro de custo mesmo assim?',
                  '',
                  MB_YESNO + MB_ICONQUESTION,
                  Handle
               ) = IDYES ) then
            begin

               if centro_custo_inativo then
               begin
                  cbCentrosAnaliticos.Items.Delete(cbCentrosAnaliticos.Items.Count - 1);
               end;

               //Adiciona o item inativo a combo
               cbCentrosAnaliticos.AddItem(
                  objCentroSelecionado.Descricao,
                     TItemCombo.Create(
                        IntToStr(objCentroSelecionado.Centro),
                        objCentroSelecionado.Descricao
                     )
               );

               cbCentrosAnaliticos.ItemIndex := cbCentrosAnaliticos.Items.Count - 1;

               centro_custo_inativo := True;

               painelApropriacao(false);

               if Self.ListaApropriacoes <> nil then
               begin
                  ListaApropriacoes.Clear;
                  FreeAndNil(ListaApropriacoes);
               end;

            end;

            Exit;
         end;

         if (centro_custo_inativo = True) then
         begin
            cbCentrosAnaliticos.Items.Delete(cbCentrosAnaliticos.Items.Count - 1);
            centro_custo_inativo := False;
         end;

         for I := 0 to cbCentrosAnaliticos.Items.Count - 1 do
         begin
            if TItemCombo(cbCentrosAnaliticos.Items.Objects[i]).codigo = IntToStr(retorno.objCentro.Centro) then
            begin
               cbCentrosAnaliticos.ItemIndex := I;               
            end;
         end;
         
         painelApropriacao(false);

         if Self.ListaApropriacoes <> nil then
         begin
            ListaApropriacoes.Clear;
            FreeAndNil(ListaApropriacoes);
         end;

      end;

   end;

   verificaPodeBaixarComp;

end;

function TfrmCompromissoCadastro.getProximaCompetencia(
dtCompetenciaInicial: TDateTime; dtCompetencia: TDateTime): TDateTime;
var
   wano           : word;
   wmes           : word;
   wdia           : word;
   wInicialAno    : word;
   wInicialMes    : word;
   wInicialDia    : word;
begin
   // A proxima parcela deve ter vencimento no próximo mês no mesmo dia da data inicial
   DecodeDate( dtCompetenciaInicial,  wInicialAno,   wInicialMes,   wInicialDia );
   DecodeDate( dtCompetencia, wano,   wmes,  wdia );

   wmes := wmes + 1;

   if wMes > 12 then
   begin
      wmes := 1;
      wano := wano  + 1;
   end;

   Result := DataValida( wano, wmes, wInicialDia );
end;

function TfrmCompromissoCadastro.getProximoVencimento(
dtVencimentoInicial: TDateTime; dtVencimento: TDateTime): TDateTime;
var
   wano           : word;
   wmes           : word;
   wdia           : word;
   wInicialAno    : word;
   wInicialMes    : word;
   wInicialDia    : word;
begin
   // A proxima parcela deve ter vencimento no próximo mês no mesmo dia da data inicial
   DecodeDate( dtVencimentoInicial,  wInicialAno,   wInicialMes,   wInicialDia );
   DecodeDate( dtVencimento, wano,   wmes,  wdia );

   wmes := wmes + 1;

   if wMes > 12 then
   begin
      wmes := 1;
      wano := wano  + 1;
   end;

   Result := DataValida( wano, wmes, wInicialDia );
end;

procedure TfrmCompromissoCadastro.AjustaValoresApropriacoes;
var
   iApropriacao         : integer;
   vl_total             : double;
   vl_apropriacao       : string;
   vl_movimento         : double;
   iTotalApropriacoes   : integer;
   vl_despesa           : double;
   vl_ajustado          : double;
begin
   objApropriacao := nil;
   vl_total       := 0;
   vl_despesa     := RoundFloat(txtVlNota.getValorDouble(), 2);

   //verifica se existe apropriacoes
   if ListaApropriacoes <> nil then
   begin
      //somente inicia o ajuste se houver mais que duas apropriacoes.
      if ListaApropriacoes.Count > 1 then
      begin

         //delimita o laço de repetição até o penultimo item
         iTotalApropriacoes := ListaApropriacoes.Count - 2;

         for iApropriacao := 0 to iTotalApropriacoes do
         begin
            objApropriacao := (ListaApropriacoes.items[iApropriacao] as TFinApropriaCP);

            //muda o . por , para conversão em double.
            vl_apropriacao := substituiCaracter( objApropriacao.getValorCampo('vl_movimento'), '.', ',');

            vl_movimento := StrToFloat( vl_apropriacao );

            vl_total := RoundFloat(vl_total, 2) + RoundFloat( vl_movimento, 2);
         end;

         //vl_total possui a soma até a penultima parcela.
         //a ultima apropriacao vai receber valor total da despesa - o vl_total
         //dessa forma a eventual diferença não deve existir.
         vl_ajustado    := RoundFloat( vl_despesa - vl_total, 2 );
         objApropriacao := (ListaApropriacoes.items[iTotalApropriacoes+1] as TFinApropriaCP);
         vl_apropriacao := FloatToStrF( vl_ajustado, ffFixed, 15, 2 );

         vl_apropriacao := substituiCaracter(vl_apropriacao, ',', '.');

         objApropriacao.setValorCampo( 'vl_movimento', vl_apropriacao );
      end;
   end;

   objApropriacao := nil;
end;

procedure TfrmCompromissoCadastro.alterarParcelas;
var
   i,x               : integer;
   vl_despesa        : double;
   dt_pagamento      : string;
   cd_coligada       : string;
   cd_conta          : string;
   cd_centro         : string;
   vl_total_despesa  : string;
   bAlterar          : boolean;
begin
   bAlterar := validaFormasPgto();

   if bAlterar = true then
   begin
      //insere as apropriações na base
      if ListaApropriacoes <> nil then
      begin
         for i := 0 to ListaApropriacoes.Count - 1 do
         begin
           for x := 0 to ListaApropriacoes.Count - 1 do
           begin
             if( x <> i) then
             begin
               if
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_conta') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_conta')
               )
               and
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_centro') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_centro')
               )
               and
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_coligada') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_coligada')
               )
               and
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_coligada') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_coligada')
               )
               then
               begin
                 Mensagem('Não é possível incluir critérios de rateio para o mesmo centro de custo/plano de contas.', 'Atenção' , MB_ICONEXCLAMATION+MB_OK, Handle );
                 Abort;
               end;
             end;
           end;
         end;
      end;

      cd_coligada       := IntToStr( self.cd_coligada_seleciona );
      vl_total_despesa  := Self.getformataValorParaObjeto( txtVlNota.getValorDouble() );

      //define o campo cd_remessa como nulo somente da parcela selecionada
      if ListaParcelas <> nil then
      begin
         objParcelaSelecionada.setValorCampo('cd_remessa', 'null' );
      end;

      //Salva as modificações da parcela.
      Self.salvaParcelaSelecionadaObjeto();

      //atualiza o cabeçalho de todas as parcelas com o mesmo cd_titulo_principal
      Self.atualizaCabecalhoTodasParcelas();

      objParcelaSelecionada.atualizarTodosCabecalhos();

      //verifica se a é necessário mudar a autorização do compromisso.
      Self.VerificaSetaAutorizacao();

      for i := 0 to ListaParcelas.Count - 1 do
      begin
         objParcelaSelecionada      := (ListaParcelas.items[i] as TFinContasPagar);

         if getFormEstado() = 'alterar' then
         begin
            objParcelaCopiaSelecionada := (ListaCopiaParcelas.items[i] as TFinContasPagar);

            if alterou_turma then
            begin
               objParcelaSelecionada.atualizaTurma();
            end;
         end;

         dt_pagamento := trim(objParcelaSelecionada.getValorCampo('dt_pagamento'));

         //atualiza somente as que não foram pagas
         if dt_pagamento = '' then
         begin
            objParcelaSelecionada.atualizar();

             //atualiza movimentação
            vl_despesa := StrToFloat( Self.getValorDoObjeto( objParcelaSelecionada.getValorCampo('vl_despesa') ) );

            Self.GeraMovimento( AlterarTitulos, objParcelaSelecionada.getValorCampo('cd_titulo'), objParcelaSelecionada.getValorCampo('cd_coligada'), vl_despesa );
         end
         else
         begin
            //atualiza apenas o histórico caso sejam diferentes
            if getFormEstado() = 'alterar' then
            begin
               if objParcelaSelecionada.getValorCampo('ds_despesa') <> objParcelaCopiaSelecionada.getValorCampo('ds_despesa') then
               begin
                  alteraHistoricoParcela( objParcelaSelecionada.getValorCampo('ds_despesa'), objParcelaSelecionada.getValorCampo('cd_titulo') );
                  alteraHistoricoTesouraria( objParcelaSelecionada.getValorCampo('ds_despesa'), objParcelaSelecionada.getValorCampo('cd_titulo') );
               end;
            end;
         end;

         objParcelaSelecionada := nil;
      end;

      //limpa o registro de apropriações anteriores relacionada ao título em edição
      Self.limpaRegistroApropriacoes();

      //GERA APROPRIAÇÕES
      if cmbCriterioApropriacao.ItemIndex <= 0 then
      begin // Forçar a Atualização da Apropriação em caso de Alterações
         FreeAndNil(ListaApropriacoes);
      end;

      //se não existir a lista de apropriações cria apenas uma
      if ListaApropriacoes = nil then
      begin
         ListaApropriacoes := TObjectList.Create();
         FreeAndNil( objApropriacao );
         objApropriacao := TFinApropriaCP.Create();

         if cmbPlanoContas.itemIndex > -1 then
         begin
            cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();
            objApropriacao.setValorCampo('cd_conta', cd_conta );
         end
         else
         begin
            objApropriacao.setValorCampo('cd_conta', '0' );
         end;

         if objCentroSelecionado <> nil then
         begin
            cd_centro :=  IntToStr(objCentroSelecionado.Centro);
            objApropriacao.setValorCampo('cd_centro', cd_centro );
         end
         else
         begin
            objApropriacao.setValorCampo('cd_centro', '0' );
         end;

         objApropriacao.setValorCampo( 'cd_titulo',    Self.getCodigoCompromissoPrincipal() );
         objApropriacao.setValorCampo( 'cd_coligada',  cd_coligada );
         objApropriacao.setValorCampo( 'vl_movimento', vl_total_despesa );

         //adiciona a apropriação na lista
         ListaApropriacoes.Add( objApropriacao );

         objApropriacao := nil;
      end;

      //insere as apropriações na base
      for i := 0 to ListaApropriacoes.Count - 1 do
      begin
         objApropriacao := (ListaApropriacoes.Items[i] as TFinApropriaCP);

         if cmbPlanoContas.itemIndex > -1 then
         begin
            cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();

            if cd_conta <> cd_plano_contas_inicial then
            begin
               objApropriacao.setValorCampo('cd_conta', cd_conta );
            end;
         end;

         if objCentroSelecionado <> nil then
         begin
            cd_centro := IntToStr(objCentroSelecionado.Centro);

            if cd_centro <> cd_centro_custos_inicial then
            begin
               objApropriacao.setValorCampo('cd_centro', cd_centro );
            end;
         end;

         Self.GeraApropriacao( Self.getCodigoCompromissoPrincipal(), objApropriacao.getValorCampo('cd_coligada'), objApropriacao.getValorCampo('cd_conta'), objApropriacao.getValorCampo('cd_centro'), objApropriacao.getValorCampo('vl_movimento') );

         objApropriacao := nil;
      end;

      // Atualizar registro das apropriações na tesouraria - títulos já baixados

      Self.atualizaApropriacoesTesouraria();

   end;

end;

procedure TfrmCompromissoCadastro.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin

   if (
         txtParBoletoCodigoBarras.Focused and
         (Length(txtParBoletoCodigoBarras.Text) <> 47)
      ) or
      (
         txtParBoletoCodigoBarrasArrecadacao.Focused and
         (not Length(txtParBoletoCodigoBarrasArrecadacao.Text) in [44, 48])
      ) then
   begin
      if Msg.message = WM_KEYDOWN then
      begin
         if Msg.wParam =   VK_TAB then
         begin
            Msg.message := 0 ;
         end;
      end;
   end;
end;

procedure TfrmCompromissoCadastro.ApropriaValoresCP(CodMovimento: Integer;
  ValorBaixado: Currency; cd_titulo: Integer; cd_coligada: Integer);
Var
  iContaJuros : Integer;
  vl_apropriado, valor_atual: Currency;

  qLer : TUMZQuery;
  qGravar : TUMZQuery;
begin
  // Apropria os valores do contas a pagar

  // Alterado por Claudionor em 14/07/14
  // Fazer inserts individuais para arredondar o valor no último centro de custo.

  iContaJuros := 0;

  if Dm.variavel_parametro('plano_contas_juros_pagos') <> '' then begin
     iContaJuros := StrToInt(Dm.variavel_parametro('plano_contas_juros_pagos'));
  end;

  DM.CriarConsulta(qLer);
  DM.CriarConsulta(qGravar);
  qLer.Close();
  qLer.SQL.Clear();

  // Montar o SQL para ler as apropriações.
  // O parametro plano_contas_juros_pagos funciona para lançar em uma conta específica o que foi pago de juros para o fornecedor

  if iContajuros = 0 then begin
     // Sem a conta juros configurada
     
     qLer.SQL.Add(
      ' SELECT                                                 ' +
      '    :CdMovTe as cd_movimento_te,  t.cd_coligada, a.cd_conta, a.cd_centro,   ' +
      '    ROUND((a.vl_movimento / t.vl_total_despesa * :ValorBaixado),2) as vl_movimento   ' +
      ' FROM                                                   ' +
      '    fin_apropria_cp a                                   ' +
      '    INNER JOIN fin_contas_pagar t ON (a.cd_titulo = t.cd_titulo_principal AND a.cd_coligada = t.cd_coligada) ' +
      ' WHERE                                                  ' +
      '   t.cd_titulo = :CdTitulo AND                          ' +
      '   a.cd_coligada = :CdColigada                          ' );

  end else begin
     // Com a conta juros configurada

     // Primeiro Inserir o valor líquido

     qLer.SQL.Add(
      ' SELECT                                                 ' +
      '    :CdMovTe as cd_movimento_te,  t.cd_coligada, a.cd_conta, a.cd_centro,                 ' +
      '    ROUND((a.vl_movimento / t.vl_total_despesa * :ValorBaixado) - (a.vl_movimento / t.vl_total_despesa * (COALESCE(c.vl_juros,0) + COALESCE(c.vl_multa,0))),2) as vl_movimento' +
      ' FROM                                                   ' +
      '    fin_apropria_cp a                                   ' +
      '    INNER JOIN fin_contas_pagar t ON (a.cd_titulo = t.cd_titulo_principal AND a.cd_coligada = t.cd_coligada) ' +
      '    INNER JOIN fin_mov_cp c ON (t.cd_titulo = c.cd_titulo AND c.cd_coligada = t.cd_coligada AND c.cd_movimento_te = :CdMovTe) ' +
      ' WHERE                                                  ' +
      '   t.cd_titulo = :CdTitulo AND                          ' +
      '   a.cd_coligada = :CdColigada                          ' );

     qLer.SQL.Add(
      ' UNION ALL ') ;

     // Agora juntar com o lançamento na conta de juros para cada centro de custo

     qLer.SQL.Add(
      ' SELECT                                                 ' +
      '    :CdMovTe as cd_movimento_te,  t.cd_coligada, ' + IntToStr(iContaJuros) + ' as cd_conta , a.cd_centro,                 ' +
      '    ROUND(SUM(a.vl_movimento / t.vl_total_despesa * (COALESCE(c.vl_juros,0) + COALESCE(c.vl_multa,0))),2) as vl_movimento' +
      ' FROM                                                   ' +
      '    fin_apropria_cp a                                   ' +
      '    INNER JOIN fin_contas_pagar t ON (a.cd_titulo = t.cd_titulo_principal AND a.cd_coligada = t.cd_coligada) ' +
      '    INNER JOIN fin_mov_cp c ON (t.cd_titulo = c.cd_titulo AND t.cd_coligada = c.cd_coligada AND c.cd_movimento_te = :CdMovTe) ' +
      ' WHERE                                                  ' +
      '   t.cd_titulo = :CdTitulo AND                          ' +
      '   a.cd_coligada = :CdColigada                          ' +
      ' GROUP BY a.cd_centro                                   ' );
  end;

  qLer.ParamByName('CdMovTe').AsInteger := CodMovimento;
  qLer.ParamByName('CdTitulo').AsInteger := cd_titulo;
  qLer.ParamByName('CdColigada').AsInteger := cd_coligada;
  qLer.ParamByName('ValorBaixado').AsFloat := ValorBaixado;

  qLer.Open;
  qLer.First();

  // Preparar query de inclusao

  qGravar.SQL.Add(
    ' INSERT INTO fin_apropria_te                            ' +
    '  (cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento)  ' + 
    ' VALUES ' +
    '  (:cd_movimento_te, :cd_coligada, :cd_conta, :cd_centro, :vl_movimento ) ');

  vl_apropriado := 0;

  while not qLer.Eof do
  begin

      qGravar.ParamByName('cd_movimento_te').AsInteger := qLer.FieldByName('cd_movimento_te').AsInteger;
      qGravar.ParamByName('cd_coligada').AsInteger     := qLer.FieldByName('cd_coligada').AsInteger;
      qGravar.ParamByName('cd_conta').AsInteger        := qLer.FieldByName('cd_conta').AsInteger;
      qGravar.ParamByName('cd_centro').AsInteger       := qLer.FieldByName('cd_centro').AsInteger;

      //Antes de executar a query, vai para o próximo, e testa se é o ultimo registro, para alterar o valor.
      valor_atual := qLer.FieldByName('vl_movimento').AsCurrency;
      
      qLer.Next();

      if qLer.Eof then begin

         // É o ultimo regsitro, calcular o vamor para fechar com o total.
         qGravar.ParamByName('vl_movimento').AsCurrency   := (ValorBaixado - vl_apropriado);

      end else begin
          qGravar.ParamByName('vl_movimento').AsCurrency   := valor_atual
      end;

      vl_apropriado := vl_apropriado + valor_atual;

      qGravar.ExecSQL();
  end;

  qLer.Close();
  FreeAndNil(qLer);
  FreeAndNil(qGravar);   

end;

procedure TfrmCompromissoCadastro.atualizaApropriacoesTesouraria;
var
   qyApropriacao  : TUMZQuery;
   cd_coligada    : string;
begin
   cd_coligada    := IntToStr(self.cd_coligada_seleciona);
   qyApropriacao  := nil;

   // Primeiramente excluir as apropriações de todas as parcelas
   // Já baixadas para este compromisso

   DM.CriarConsulta( qyApropriacao );
   qyApropriacao.Close();
   qyApropriacao.SQL.Clear();
   qyApropriacao.SQL.Add('DELETE ap.* ');
   qyApropriacao.SQL.Add('  FROM fin_contas_pagar as cp ');
   qyApropriacao.SQL.Add(' INNER JOIN fin_mov_tesouraria as te ON (cp.cd_titulo = te.cd_titulo AND te.nr_estorno = 0) ');
   qyApropriacao.SQL.Add(' INNER JOIN fin_apropria_te as ap ON (te.cd_movimento_te = ap.cd_movimento_te) ');
   qyApropriacao.SQL.Add(' WHERE cp.cd_titulo_principal = :cd_titulo AND cp.cd_coligada = :cd_coligada ');

   qyApropriacao.ParamByName('cd_titulo').AsString    := Self.getCodigoCompromissoPrincipal;
   qyApropriacao.ParamByName('cd_coligada').AsString  := cd_coligada;
   qyApropriacao.ExecSQL;

   // Incluir as apropriações com os novos valores;

   qyApropriacao.Close();
   qyApropriacao.SQL.Clear();
   qyApropriacao.SQL.Add(' INSERT INTO fin_apropria_te (cd_movimento_te, cd_conta, cd_coligada, cd_centro, vl_movimento, nr_sequencia) ' );
   qyApropriacao.SQL.Add(' SELECT te.cd_movimento_te, ap.cd_conta, ap.cd_coligada, ap.cd_centro, ( ( ap.vl_movimento / cp.vl_total_despesa ) * te.vl_movimento), NULL ' );
   qyApropriacao.SQL.Add('   FROM fin_contas_pagar as cp ' );
   qyApropriacao.SQL.Add('  INNER JOIN fin_apropria_cp as ap ON (ap.cd_titulo = cp.cd_titulo_principal AND ap.cd_coligada = cp.cd_coligada) ' );
   qyApropriacao.SQL.Add('  INNER JOIN fin_mov_tesouraria as te ON (cp.cd_titulo = te.cd_titulo AND te.nr_estorno = 0) ' );
   qyApropriacao.SQL.Add('  WHERE cp.cd_titulo_principal = :cd_titulo AND cp.cd_coligada = :cd_coligada ');
   qyApropriacao.SQL.Add('  GROUP BY te.cd_movimento_te, ap.cd_conta, ap.cd_coligada, ap.cd_centro ');

   qyApropriacao.ParamByName('cd_titulo').AsString    := Self.getCodigoCompromissoPrincipal;
   qyApropriacao.ParamByName('cd_coligada').AsString  := cd_coligada;
   qyApropriacao.ExecSQL;

   FreeAndNil( qyApropriacao );
end;

procedure TfrmCompromissoCadastro.atualizaCabecalhoTodasParcelas;
var
   i : integer;
begin
   for i := 0 to ListaParcelas.Count - 1 do
   begin
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_pessoa',                 txtCdFornecedor.Text );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('nr_documento',              txtNrDocumento.Text  );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('ds_historico',              txtDsHistorico.Text  );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('dt_emissao_nota',           Self.getDataFormatada( 'yyyy-mm-dd', txtDtEmissao.text) );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_total_despesa',          txtvlNota.getValorString() );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('sn_nf_entregue',            Self.getComboCheck(chkNFEntregue.Checked) );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_turma',                  Self.getCdTurma()       );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_disciplina',             Self.getCdDisciplina()  );
      (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('nr_anosemestre_disciplina', Self.getNrAnosemestre() );

      if cmbHistorico.ItemIndex > 0 then
      begin
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_historico',           TItemCompromisso(cmbHistorico.Items.Objects[cmbHistorico.ItemIndex]).getCodigo);
      end;

      //se existir item selecionado salva
      if cmbTipoTitulo.itemIndex > -1 then
      begin
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_tipo_titulo',   (cmbTipoTitulo.Items.Objects[ cmbTipoTitulo.itemIndex ] as TItemCompromisso).getCodigo );
      end;
   end;
end;

procedure TfrmCompromissoCadastro.atualizaListaDadosBancosAgencia;
var
   i: integer;
begin
   //libera a lista de banco e agencias da tabela fin_pessoas_contas
   for i := cmbDadosBancoAgencia.Items.Count - 1 downto 0 do
   begin
      (cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).Free;
   end;
   cmbDadosBancoAgencia.Clear;

   //lista os bancos e agencias de uma determinada pessoa
   Self.getListaBancoAgencia();
end;

procedure TfrmCompromissoCadastro.atualizaListaHistorico;
var
   i : integer;
begin

   //libera a lista de históricos
   for i := cmbHistorico.Items.Count - 1 downto 0 do
   begin
      (cmbHistorico.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbHistorico.Clear;

   Self.getListaHistorico();
end;

procedure TfrmCompromissoCadastro.atualizaValorPagar;
begin
   edValorPagar.setValor(
      txtParvlNota.getValor -
      txtParValorAbatimento.getValor -
      txtParValorDesconto.getValor +
      txtParValorMulta.getValor +
      txtParValorMora.getValor
   );
end;

procedure TfrmCompromissoCadastro.AutenticarCompromisso(sMascara: String);
Var
   nro_aut : integer;
   i : integer;
   arquivo : TextFile;

   strAut : String;
   campo : string;

   linha : string;
   n : Integer;
   bEnterNaUltima : Boolean; // Verificar se deve dar o enter na última autenticação
   total_pago : currency;
begin

   try
       nro_aut := StrToInt(DM.variavel_parametro('financeiro_qtd_autenticacao_cp'));
   except
       nro_aut := 0;
   end;

   if nro_aut = 0 then Exit;

   if nro_aut = -1 then nro_aut := 1;   

   i := 0;

   // A mascara pode ser passada na chamada da função... (caso de estorno).. se não passar assumir
   // o parametro financeiro_autenticacao_campos
   if sMascara = ''  then
      strAut := DM.variavel_parametro('financeiro_autenticacao_campos_cp')
   else
      strAut := sMascara;

   if Pos('[ENTER]', strAut) > 0 then begin
       bEnterNaUltima := true;
       strAut := ReplaceStr(strAut, '[ENTER]', ''); // Retirar a string ENTER
   end else begin
       bEnterNaUltima := false;
   end;

   { String Padrão }
   if trim(strAut) = '' then begin
      strAut := 'UNIMESTRE[CD_PESSOA][NR_DOCUMENTO][NR_PARCELA][CD_TITULO][DT_PAGAMENTO][VL_PAGO]';
   end;

   // Trocar o valor pago, pois não temos ele na grid
   total_pago := txtParvlNota.getValor();  //RoundFloat( StrToFloat(txtValorTotalPago.Text), 2);
   strAut := ReplaceStr(strAut, '[VL_PAGO]', FloatToStrF(total_pago,ffFixed,15, 2) );

   //Data de pagamento
   strAut := ReplaceStr(strAut, '[DT_PAGAMENTO]', DateToStr(DM.DataAtual()) );

   // Trocar os demais campos
   n := 1;
   linha := '';
   while n <= Length(strAut) do Begin

      if strAut[n] = '[' then Begin

         campo := '';
         inc(n);

         While strAut[n] <> ']' do Begin
            campo := campo + strAut[n];
            inc(n);
         End;

         linha := linha + frm_compromisso_planilha.qryContasPagar.FieldByName(campo).DisplayText;

      End else Begin
         linha := linha + strAut[n];
      End;

      inc(n);

   End;
   if Pos('#13', linha) > 0 then begin
      linha := StringReplace(linha, '#13', CHR(13), [rfReplaceAll]);
   end;


   while i < nro_aut do
   Begin
       INC(I);

       if Mensagem('Posicione o papel para autenticação ' + IntToStr(i), 'Confirmação', MB_YESNO + MB_ICONQUESTION)
       <> mrYes then Exit;

       { Verificar linha de Autenticação }

       { Abrir o arquivo ou Porta }
       //
       try
          AssignFile(arquivo, DM.variavel_parametro('impressao_matricial_porta'));
          Rewrite(arquivo);

          write(arquivo, chr(13));
          Write(arquivo, linha);
          write(arquivo, chr(13));
          
          if bEnterNaUltima AND (i = nro_aut) then begin
             Writeln(arquivo, '');
          end;

          CloseFile(arquivo);
       except
          Mensagem('Não foi possível encontrar a impressora de autenticação.', 'Erro', MB_OK + MB_ICONERROR);
       end;

   End;

end;

procedure TfrmCompromissoCadastro.baixarCompromisso(cd_caixa_sel: Integer; valor: Currency; valor_multa: Currency; dataProvavelPgto: TDateTime);
CONST
   SQL_DISPONIBILIDADE = '' +
   'SELECT                                      '+
   '  CP.CD_TIPO_TITULO,                        '+
   '  CP.DT_VENCIMENTO,                         '+
   '  CP.CD_CAIXA,                              '+
   '  CP.NR_CHEQUE,                             '+
   '  CP.CD_TITULO,                             '+
   '  CP.DS_DESPESA,                            '+
   '  CP.NR_DOCUMENTO,                          '+
   '  CP.CD_COLIGADA,                           '+
   '  CP.CD_FORMA_PGTO,                         '+
   '  P.NM_PESSOA,                              '+
   '  ROUND(SUM(M.VL_ENTRADA),2) VL_ENTRADAS,   '+
   '  ROUND(SUM(M.VL_SAIDA),2) VL_SAIDAS,       '+
   '  CP.cd_titulo_principal                    '+
   'FROM                                        '+
   '  FIN_CONTAS_PAGAR CP                       '+
   '  LEFT JOIN FIN_MOV_CP M ON                 '+
   '      (M.CD_TITULO = CP.CD_TITULO) AND      '+
   '      (M.CD_COLIGADA = CP.CD_COLIGADA)      '+
   '  JOIN PESSOAS P ON                         '+
   '      (CP.CD_PESSOA = P.CD_PESSOA)          '+
   'WHERE                                       '+
   '  CP.CD_TITULO = :CD_TITULO AND             '+
   '  CP.CD_COLIGADA = :CD_COLIGADA             '+
   'GROUP BY                                    '+
   '  CP.CD_TIPO_TITULO,                        '+
   '  CP.DT_VENCIMENTO,                         '+
   '  CP.CD_CAIXA,                              '+
   '  CP.NR_CHEQUE,                             '+
   '  CP.CD_TITULO,                             '+
   '  CP.DS_DESPESA,                            '+
   '  CP.NR_DOCUMENTO,                          '+
   '  CP.CD_COLIGADA,                           '+
   '  CP.CD_FORMA_PGTO,                         '+
   '  P.NM_PESSOA                               ';
Var
   Movimento    : TMovimento;
   tpConta      : word;
   cdAbertura   : Integer;
   CodMovimento : Integer;
   cbConta      : Integer;
   cd_coligada_contas_pagar: Integer;
   NrCheque     : String;
   sChave       : String;
   DataBaixa    : TDateTime;
   qyAcao       : TUMZQuery;
   qyCompromisso: TUMZQuery;
begin
   cd_coligada_contas_pagar := getColigadaTitulo(StrToInt(Self.getCodigoCompromissoPrincipal()));

   cbConta := cd_caixa_sel;

   dm.CriarConsulta(qyCompromisso);
   
   qyCompromisso.SQL.Text := SQL_DISPONIBILIDADE;

   qyCompromisso.ParamByName('cd_titulo').AsInteger := StrToInt(Self.getCodigoCompromissoPrincipal());
   qyCompromisso.ParamByName('cd_coligada').AsInteger := cd_coligada_seleciona;
   qyCompromisso.open;

   dm.CriarConsulta(qyAcao);

   qyAcao.SQL.Text := '    '+
   'SELECT                 '+
   '  *                    '+
   'FROM                   '+
   '  fin_acoes_movimento  '+
   'WHERE                  '+
   '  cd_tipo_acao = 1 AND '+
   '  cd_origem = 2        '+
   'ORDER by               '+
   '  ds_acao              ';

   qyAcao.Open;

   Movimento := TMovimento.Create;
   Movimento.Coligada := StrToInt(cd_coligada_gerado);

   DataBaixa := dataProvavelPgto;

   CodMovimento := 0;

   // Lançar movimento na Tesouraria Primeiro
   //qyAcao.Locate('cd_acao', ListaAcao[cbAcaoMovimento.ItemIndex], [] );
   qyAcao.First;

   if qyAcao.FieldByName('cd_movimento_caixa').AsInteger <> 0 then
   begin
      DM.qyAux1.Close;
      DM.qyAux1.SQL.Clear;
      DM.qyAux1.SQL.Add('SELECT * from fin_acoes_movimento');
      DM.qyAux1.SQL.Add('WHERE cd_acao = ' +  qyAcao.FieldByName('cd_movimento_caixa').AsString );
      Dm.qyAux1.Open;

      Application.CreateForm( Tfrm_Tesouraria_Gerar, frm_Tesouraria_Gerar );

      frm_tesouraria_gerar.tipoEstado := Confirmar;

      if cmbFormaPgto.itemIndex <> -1 then
      begin
         frm_tesouraria_gerar.FormaPgto :=
            StrToInt((cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex  ] as TItemCompromissoFormaPgto).getCodigo());
      end
      else
      begin
         frm_tesouraria_gerar.FormaPgto := 0;
      end;


      frm_tesouraria_gerar.CodigoAcao := Dm.qyAux1.FieldByName('cd_acao').AsInteger;
      frm_tesouraria_gerar.Historico := qyCompromisso.FieldByName('ds_despesa').AsString;
      frm_tesouraria_gerar.NroDocumento := qyCompromisso.FieldByName('nr_documento').AsString;
      frm_Tesouraria_gerar.cd_coligada_selecionada := cd_coligada_contas_pagar;
      frm_Tesouraria_gerar.bloqueia_coligadas := True;


      if cmbFormaPgto.itemIndex <> -1 then
      begin

         if StrToInt((cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex  ] as TItemCompromissoFormaPgto).getCodigo()) = 1 then
         begin
            frm_tesouraria_gerar.ValorDinheiro := 0;
            frm_Tesouraria_gerar.ValorCheque   := txtVlNota.getValor;
         end
         else
         begin
            frm_tesouraria_gerar.ValorDinheiro := txtVlNota.getValor;
            frm_Tesouraria_gerar.ValorCheque   := 0;
         end;

      end
      else
      begin
         frm_tesouraria_gerar.ValorDinheiro := txtVlNota.getValor;
         frm_Tesouraria_gerar.ValorCheque   := 0;
      end;

      frm_tesouraria_gerar.DataLiberacao := dataProvavelPgto;
      frm_Tesouraria_gerar.DataLancamento := dataProvavelPgto;
      frm_Tesouraria_gerar.NumeroCheque := '';// criar um edNrCheque.Text!!!!;
      frm_tesouraria_gerar.CodigoMovimento := 0;

      frm_Tesouraria_gerar.CodigoTitulo := qyCompromisso.FieldByName('cd_titulo').AsInteger;
      frm_Tesouraria_gerar.CodigoConta := buscaCodigoApropricao(qyCompromisso.FieldByName('cd_titulo').AsInteger);

      CodMovimento := frm_tesouraria_gerar.GeraMovimentacao(
         2,
         cbConta,
         3,
         cd_coligada_contas_pagar
      );

      DataBaixa :=  frm_tesouraria_gerar.umdtLancamento.Date;

      // Cancelar a Baixa, pois não gerou movimentação na Tesouraria
      if CodMovimento < 0 then
         Exit;

      // Guardar a conta que foi utilizada para pagar no contas_pagar

      NrCheque := ' NULL ';


      DM.qyAux2.Close;
      DM.qyAux2.SQL.Text :=
         ' UPDATE fin_contas_pagar set cd_caixa = ' + IntToStr(cbConta) +
         ' , nr_cheque = ' + NrCheque +
         ' WHERE cd_coligada = ' + IntToStr(qyCompromisso.FieldByName('CD_COLIGADA').AsInteger) +
         ' AND ( (cd_titulo = ' + qyCompromisso.FieldByName('cd_titulo').AsString + ') ' +
         ' OR (cd_titulo_origem = ' + qyCompromisso.FieldByName('cd_titulo').AsString + ')) ';
      Dm.qyAux2.ExecSQL();

   end;

   sChave := qyCompromisso.FieldByName('cd_titulo').AsString + ';' + qyCompromisso.FieldByName('cd_coligada').AsString;

   // Verificar Tipo de Conta se o tipo = Pagamento }

   Movimento := TMovimento.Create;

   Movimento.TipoDeAcao := BaixarporPagamento;
   DM.setLog(2033, 'Baixa', sChave, qyCompromisso.FieldByName('CD_COLIGADA').AsInteger, 'Baixa por pagamento');

   cd_titulo_gerado := qyCompromisso.FieldByName('cd_titulo').AsInteger;

   Movimento.CodigoTitulo     := qyCompromisso.FieldByName('cd_titulo').AsInteger;
   Movimento.Coligada         := qyCompromisso.FieldByName('cd_coligada').AsInteger;
   Movimento.CodAcao          := Dm.qyAux1.FieldByName('cd_acao').AsInteger;
   Movimento.ValorMovimento   := valor;//txtParvlNota.getValor();
   Movimento.ValorMulta       := 0;
   Movimento.ValorJuros       := 0;
   Movimento.ValorLiquido     := valor;//txtParvlNota.getValor();
   Movimento.Observacao       := '';
   Movimento.DataLiberacao    := DataBaixa;

   Movimento.RegistrarMovimentacaoCP(CodMovimento);

   Movimento.Free;

   ApropriaValoresCP(
      CodMovimento,
      valor,
      qyCompromisso.FieldByName('cd_titulo').AsInteger,
      qyCompromisso.FieldByName('cd_coligada').AsInteger
   );

   if DM.variavel_parametro('financeiro_qtd_autenticacao_cp') <> '' then
   begin
      AutenticarCompromisso('');
   end;
      
   Close();

end;

procedure TfrmCompromissoCadastro.BloquearAlteracaoParcela( valor : boolean );
begin
   txtParVencimento.Enabled               := valor;
   txtParProvavelPgto.Enabled             := valor;
   cmbDadosBancoAgencia.Enabled           := valor;
   txtParBoletoCodigoBarras.Enabled       := valor;
   txtLinhaDigitavelGrupo1.Enabled        := valor;
   txtLinhaDigitavelGrupo2.Enabled        := valor;
   txtLinhaDigitavelGrupo3.Enabled        := valor;
   txtLinhaDigitavelGrupo4.Enabled        := valor;
   txtLinhaDigitavelGrupo5.Enabled        := valor;
   txtLinhaDigitavelGrupo6.Enabled        := valor;
   txtLinhaDigitavelGrupo7.Enabled        := valor;
   txtLinhaDigitavelGrupo8.Enabled        := valor;
   txtParCCBanco.Enabled                  := valor;
   txtParCCAgencia.Enabled                := valor;
   txtParCCDigAgencia.Enabled             := valor;
   txtParCCContaCorrente.Enabled          := valor;
   txtParCCDigContaCorrente.Enabled       := valor;
   txtParCCDifAgenciaConta.Enabled        := valor;
   txtParDarfCodigoReceitaTributo.Enabled := valor;
   txtParDarfNrReferencia.Enabled         := valor;
   txtParGpsCodigoReceitaTributo.Enabled  := valor;
   txtParGpsPgtoINSS.Enabled              := valor;
   txtParGpsValorOutraEntidade.Enabled    := valor;
   txtParGpsAtualizacaoMonetaria.Enabled  := valor;
   cmbCaixa.Enabled                       := valor;
   cmbFormaPgto.Enabled                   := valor;
   txtParHistorico.ReadOnly               := not valor;
   txtParvlNota.Enabled                   := valor;
   txtVlNota.Enabled                      := valor;            
//   txtParValorAbatimento.Enabled          := valor;
   txtParValorDesconto.Enabled            := valor;
   txtParValorMora.Enabled                := valor;
   txtParValorMulta.Enabled               := valor;
   chkSnPrevisao.Enabled                  := valor;
end;

procedure TfrmCompromissoCadastro.btnCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmCompromissoCadastro.btnConfirmarClick(Sender: TObject);
var
   cd_caixa_sel: Integer;
   valor: Currency;
   valor_multa: Currency;
   dataProvavelPgto: String;
   baixar_checked: Boolean;
begin

   if qryAnexosParc.State in dsEditModes then
   begin
      qryAnexosParc.Post;
   end;

   if Self.getFormEstado() = 'inserir' then
   begin

      if Self.CamposObrigatoriosValidados = true then
      begin

         baixar_checked := cbBaixar.Checked = True;
         valor := txtParvlNota.getValor();
         valor_multa := txtParValorMulta.getValor();
         dataProvavelPgto := Self.getDataFormatada( 'dd/mm/yyyy', txtParProvavelPgto.text );
         if cmbCaixa.ItemIndex > -1 then
         begin
            cd_caixa_sel := StrToInt((cmbCaixa.Items.Objects[ cmbCaixa.itemIndex ] as TItemCompromisso).getCodigo());
         end
         else
         begin
            cd_caixa_sel := 0;
         end;

         Self.inserirParcelas();

         if (baixar_checked) then
         begin
            Self.baixarCompromisso(cd_caixa_sel, valor, valor_multa, StrToDate(dataProvavelPgto));

            frm_Compromisso_Planilha.Filtra();

            frm_Compromisso_Planilha.qryContasPagar.Locate('cd_titulo', cd_titulo_gerado, []);

            Application.CreateForm(Tfrm_compromisso_autorizar, frm_compromisso_autorizar);
            frm_compromisso_autorizar.me_autoriza.Lines.Add('Pagamento autorizado pelo sistema, via baixa de compromisso.');
            frm_compromisso_autorizar.autorizaPagamento();
            frm_compromisso_autorizar.Close();
         end;

         Self.Close();
      end;

   end
   else if Self.getFormEstado() = 'alterar' then
   begin

      //verifica a situação do histórico
      if Self.CamposObrigatoriosValidados = true then
      begin
         Self.alterarParcelas();
         Self.Close();
      end;

   end;

end;

procedure TfrmCompromissoCadastro.btnDuplicarCompromissoClick(Sender: TObject);
var
   strMensagem             : string;
   dt_competencia          : TDateTime;
   dt_vencimento           : TDateTime;
   dt_provavel_pgto        : TDateTime;
begin
   strMensagem := 'Este botão irá gerar um compromisso (de uma nova nota) '+
   'para o próximo mês com base nas informações contidas nesta tela. ' +
   'Se você tem uma nota fiscal com várias parcelas, NÃO utilize esta opção, '+
   'configure neste compromisso selecionado a quantidade de parcelas '+
   'desejadas.' + chr(13) + 'Deseja continuar?';

   if Mensagem( strMensagem, 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
   begin
      if Self.CamposObrigatoriosValidados = true then
      begin
         {
            ATENÇÃO!!!!!!!!!!!!!

            O Compromisso só deve ser salvo neste momento, quando é INCLUSÃO, pois,
            o primeiro deve ser salvo o compromisso atual da tela, e então aberto um novo para inclusão (duplicado no mês seguinte)
         }
         if Self.getFormEstado() = 'inserir' then
         begin
            //salva compromisso novo gerado
            Self.inserirParcelas();
         end
         else if Self.getFormEstado() = 'alterar' then
         begin
            //salva compromisso antigo alterado
            Self.alterarParcelas();
            Self.setFormEstado('inserir');
         end;

         FreeAndNil( ListaCdTitulos );

         {
            remove referencias referente o titulo que está sendo alterado
         }
         Self.setListaCdTitulos( 1 );
         Self.selecionaParcela( 1 );

         Self.setCodigoCompromisso( ListaCdTitulos[0] );
         Self.setCodigoCompromissoPrincipal( ListaCdTitulos[0] );

         objParcelaSelecionada.setValorCampo('cd_titulo', Self.getCodigoCompromisso() );
         objParcelaSelecionada.setValorCampo('cd_titulo_principal', Self.getCodigoCompromissoPrincipal() );

         {
            Após inserir o compromisso incrementa 30dias na data de competencia,
            vencimento, provavel pagamento e continua com a janela aberta.
         }
         dt_competencia := StrToDate(txtDtCompetencia.Text);
         dt_vencimento  := StrToDate(txtParVencimento.Text);

         dt_competencia    := Self.getProximaCompetencia( dt_competencia, dt_competencia);
         dt_vencimento     := Self.getProximoVencimento( dt_vencimento, dt_vencimento);
         dt_provavel_pgto  := dt_vencimento;

         objParcelaSelecionada.setValorCampo('dt_competencia',    Self.getDataFormatada( 'yyyy-mm-dd', DateToStr(dt_competencia) ) );
         objParcelaSelecionada.setValorCampo('dt_vencimento',     Self.getDataFormatada( 'yyyy-mm-dd', DateToStr(dt_vencimento) ) );
         objParcelaSelecionada.setValorCampo('dt_provavel_pgto',  Self.getDataFormatada( 'yyyy-mm-dd', DateToStr(dt_provavel_pgto) ) );
         objParcelaSelecionada.setValorCampo('nr_parcela',        '1'   );
         objParcelaSelecionada.setValorCampo('dt_pagamento',      ''    );
         objParcelaSelecionada.setValorCampo('cd_situacao',       '1'   );


         if objCompromisso <> nil then
         begin
            objCompromisso.setValorCampo( 'cd_autoriza', '' );
         end;

         txtDtCompetencia.Text         := DateToStr(dt_competencia);
         txtDtPrimeiroVencimento.Text  := DateToStr(dt_vencimento);
         txtParVencimento.Text         := txtDtPrimeiroVencimento.Text;
         txtParProvavelPgto.Text       := txtParVencimento.Text;

         //Seleciona novamente a parcela
         if ListaParcelas.Count >= 0 then
         begin
            Self.selecionaParcela( 1 );
            Self.carregaCamposParcelaSelecionada();
         end;

         if (Self.getCodigoCompromisso() = '') or ( Self.getCodigoCompromissoPrincipal() = '' ) then
         begin
            Self.setListaCdTitulos( 1 );

            Self.setCodigoCompromisso( ListaCdTitulos[0] );
            Self.setCodigoCompromissoPrincipal( ListaCdTitulos[0] );
            objParcelaSelecionada.setValorCampo('cd_titulo',            Self.getCodigoCompromisso() );
            objParcelaSelecionada.setValorCampo('cd_titulo_principal',  Self.getCodigoCompromissoPrincipal());
         end;

         Self.BloquearAlteracaoParcela( true );
      end;
   end;
end;

function TfrmCompromissoCadastro.buscaCodigoApropricao(
  cd_titulo: Integer): Integer;
const
   SQL_APROPRIACAO =
   'SELECT cd_conta FROM fin_apropria_cp where cd_titulo = :titulo limit 1';
var
   qryApropria: TUMZQuery;
   codigo : integer;
begin
   dm.CriarConsulta(qryApropria);
   qryApropria.SQL.Text := SQL_APROPRIACAO;
   qryApropria.ParamByName('titulo').AsInteger := cd_titulo;
   qryApropria.Open;

   codigo := qryApropria.FieldByName('cd_conta').AsInteger;

   FreeAndNil(qryApropria);

   result := codigo;
end;

function TfrmCompromissoCadastro.BuscaDescricaoCentroCusto(
  cd_centro: string): string;
var
   qyCentroCusto     : TUMZQuery;
   ds_centro_custo   : string;
   cd_coligada       : integer;
begin
   ds_centro_custo   := '';
   qyCentroCusto     := nil;
   cd_coligada       := self.cd_coligada_seleciona;

   DM.CriarConsulta( qyCentroCusto );

   if trim(cd_centro) <> '' then
   begin
      qyCentroCusto.Close();
      qyCentroCusto.SQL.Clear;
      qyCentroCusto.SQL.Add('SELECT                                         ');
      qyCentroCusto.SQL.Add(' cd_centro, ds_centro                          ');
      qyCentroCusto.SQL.Add('FROM                                           ');
      qyCentroCusto.SQL.Add(' fin_centro_custos                             ');
      qyCentroCusto.SQL.Add('WHERE                                          ');
// Buscar a descrição independente do centro estar ou não ativo
//      qyCentroCusto.SQL.Add(' tp_centro = 1 AND sn_ativo = 1 AND            ');
      qyCentroCusto.SQL.Add(' cd_coligada = ' + IntToStr( cd_coligada )  );
      qyCentroCusto.SQL.Add(' AND cd_centro = ' + cd_centro                  );
      qyCentroCusto.Open();

      ds_centro_custo := qyCentroCusto.FieldByName('ds_centro').AsString;

      qyCentroCusto.Close();
   end;

   FreeAndNil( qyCentroCusto );

   Result := ds_centro_custo;
end;

function TfrmCompromissoCadastro.BuscaDescricaoConta(cd_conta: string): string;
var
   qyPlanoConta      : TUMZQuery;
   ds_plano_conta    : string;
   cd_coligada       : integer;
begin
   ds_plano_conta    := '';
   qyPlanoConta      := nil;
   cd_coligada       := self.cd_coligada_seleciona;

   DM.CriarConsulta( qyPlanoConta );

   if trim(cd_conta) <> '' then
   begin
      qyPlanoConta.Close();
      qyPlanoConta.SQL.Clear;
      qyPlanoConta.SQL.Add('SELECT                                         ');
      qyPlanoConta.SQL.Add(' cd_conta, ds_conta                            ');
      qyPlanoConta.SQL.Add('FROM                                           ');
      qyPlanoConta.SQL.Add(' fin_plano_contas                              ');
      qyPlanoConta.SQL.Add('WHERE                                          ');
// Na busca da descrição não precisa esta ativa      
//      qyPlanoConta.SQL.Add(' tp_conta = 1 AND                              ');
//      qyPlanoConta.SQL.Add(' AND sn_ativo = 1                              ');
      qyPlanoConta.SQL.Add(' cd_coligada = ' + IntToStr( cd_coligada )  );
      qyPlanoConta.SQL.Add(' AND tp_entrada_saida IN (0,2)                 ');
      qyPlanoConta.SQL.Add(' AND cd_conta =  ' + cd_conta                   );
      qyPlanoConta.Open();

      ds_plano_conta := qyPlanoConta.FieldByName('ds_conta').AsString;

      qyPlanoConta.Close();
   end;

   FreeAndNil( qyPlanoConta );

   Result := ds_plano_conta;
end;

function TfrmCompromissoCadastro.BuscaNome(cd_pessoa: integer): string;
var
   qyPessoa    : TUMZQuery;
   nm_pessoa   : string;
Begin
   // Pesquisar o nome do fornecedor
   DM.CriarConsulta(qyPessoa);

   if cd_pessoa <> 0 then
   begin
      qyPessoa.Close();
      qyPessoa.SQL.Clear;
      qyPessoa.SQL.Add(' SELECT pe.nm_pessoa, pc.cd_conta FROM pessoas pe LEFT JOIN fin_plano_contas_fornecedor pc ');
      qyPessoa.SQL.Add(' ON (pe.cd_pessoa = pc.cd_pessoa AND pc.cd_coligada = ' + IntToStr(self.cd_coligada_seleciona) + ')');
      qyPessoa.SQL.Add(' WHERE pe.cd_pessoa = :cd_pessoa ');
      qyPessoa.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      qyPessoa.Open();

      if qyPessoa.RecordCount > 0 then
      begin
         nm_pessoa := qyPessoa.FieldByName('nm_pessoa').AsString;
      end;
   end;

   FreeAndNil( qyPessoa );

   Result := nm_pessoa;
end;

procedure TfrmCompromissoCadastro.CalculaCodigoBarras;
var
   grupo1            : string;
   grupo2            : string;
   grupo3            : string;
   grupo4            : string;
   grupo5            : string;
   grupo6            : string;
   grupo7            : string;
   grupo8            : string;
   sLinhaDigitavel   : string;
   sCodigoBarras     : string;
   bCalculaLinha     : boolean;
begin
   bCalculaLinha  := false;
   grupo1 := txtLinhaDigitavelGrupo1.text;
   grupo2 := txtLinhaDigitavelGrupo2.text;
   grupo3 := txtLinhaDigitavelGrupo3.text;
   grupo4 := txtLinhaDigitavelGrupo4.text;
   grupo5 := txtLinhaDigitavelGrupo5.text;
   grupo6 := txtLinhaDigitavelGrupo6.text;
   grupo7 := txtLinhaDigitavelGrupo7.text;
   grupo8 := txtLinhaDigitavelGrupo8.text;

   sLinhaDigitavel := concat( grupo1, grupo2, grupo3, grupo4, grupo5, grupo6, grupo7, grupo8 );

   if (trim(sLinhaDigitavel) = '') and (length(txtParBoletoCodigoBarras.Text) = 47) then
   begin
      sLinhaDigitavel := txtParBoletoCodigoBarras.Text;
   end;
   

   if Length( sLinhaDigitavel ) = 36 then
   begin
      sLinhaDigitavel := concat( sLinhaDigitavel, '00000000000' );
   end;

   if Length( sLinhaDigitavel ) = 47 then
   begin
      sCodigoBarras  := concat( copy(sLinhaDigitavel,1,4),
                        copy(sLinhaDigitavel,33,15),
                        copy(sLinhaDigitavel,5,5),
                        copy(sLinhaDigitavel,11,10),
                        copy(sLinhaDigitavel,22,10) );

      txtParBoletoCodigoBarras.Text := sCodigoBarras;

      if bCalculaLinha = true then
      begin
         Self.CalculaLinhaDigitavel( sCodigoBarras );
      end;
   end;
end;

procedure TfrmCompromissoCadastro.CalculaLinhaDigitavel(
  ds_codigo_barras: string);
var
   grupo1         : string;
   grupo2         : string;
   grupo3         : string;
   grupo4         : string;
   grupo5         : string;
   grupo6         : string;
   grupo7         : string;
   grupo8         : string;
   corte_str      : string;
   sCodigoBarras  : string;
begin
   sCodigoBarras  := ds_codigo_barras;
   corte_str      := '';

   corte_str   := Concat( Copy(sCodigoBarras, 1, 4), Copy(sCodigoBarras, 20, 5) );
   corte_str   := Concat( corte_str, DV10(corte_str, ''));
   grupo1      := Copy (corte_str, 1, 5);

   grupo2      := Copy(corte_str, 6, 5);

   corte_str   := '';
   corte_str   := Concat( Copy(sCodigoBarras, 25, 10));
   corte_str   := Concat( corte_str, DV10(corte_str, ''));
   grupo3      := Copy (corte_str, 1, 5);

   grupo4      := Copy(corte_str, 6, 6);

   corte_str   := '';
   corte_str   := Concat( Copy(sCodigoBarras, 35, 10));
   corte_str   := Concat( corte_str, DV10(corte_str, ''));
   grupo5      := Copy (corte_str, 1, 5);

   grupo6      := Copy(corte_str, 6, 6);

   corte_str   := '';
   grupo7      := Copy (sCodigoBarras, 5, 1);

   corte_str   := '';
   grupo8      := Copy (sCodigoBarras, 6, 14);

   txtLinhaDigitavelGrupo1.Text := grupo1;
   txtLinhaDigitavelGrupo2.Text := grupo2;
   txtLinhaDigitavelGrupo3.Text := grupo3;
   txtLinhaDigitavelGrupo4.Text := grupo4;
   txtLinhaDigitavelGrupo5.Text := grupo5;
   txtLinhaDigitavelGrupo6.Text := grupo6;
   txtLinhaDigitavelGrupo7.Text := grupo7;
   txtLinhaDigitavelGrupo8.Text := grupo8;
end;

function TfrmCompromissoCadastro.CamposObrigatoriosValidados: boolean;
var
   bResultado   : Boolean;
   sCampos      : string;
   i            : integer;
   vl_total     : Currency;
   str_total    : string;
   vl_parcela   : double;
   cd_titulo    : string;
   cd_coligada  : string;
   sChave       : string;
begin
   bResultado  := true;
   sCampos     := '';
   cd_titulo   := Self.getCodigoCompromissoPrincipal();
   cd_coligada := IntToStr( self.cd_coligada_seleciona );
   sChave      := Concat(cd_titulo, ';', cd_coligada);

   if trim(txtCdFornecedor.Text) = '' then
   begin
      bResultado := false;
      sCampos := 'Fornecedor' + chr(13);
   end;

   if cmbTipoTitulo.ItemIndex = -1 then
   begin
      bResultado := false;
      sCampos := sCampos  + 'Tipo de Título' + chr(13);
   end;

   if trim(txtNrDocumento.Text) = '' then
   begin
      bResultado := false;
      sCampos := 'Nro Documento' + chr(13);
   end;

   if cmbFormaPgto.ItemIndex = -1 then
   begin
      bResultado := false;
      sCampos := 'Forma de Pagamento' + chr(13);
   end;

   if cmbPlanoContas.ItemIndex = -1 then
   begin
      bResultado := false;
      sCampos := sCampos  + 'Plano de Contas' + chr(13);
   end;

   if (objCentroSelecionado = nil) and ((cmbCriterioApropriacao.ItemIndex = -1) or (cmbCriterioApropriacao.ItemIndex = 0))  and (Self.getFormEstado() = 'inserir') then
   begin
      bResultado := false;
      sCampos := sCampos  + 'Centro de Custo ou Apropriação' + chr(13);
   end;

   if txtVlNota.getValorDouble <= 0 then
   begin
      bResultado := false;
      sCampos := sCampos  + 'Valor da Nota' + chr(13);
   end;

   if bResultado = false then
   begin
      Mensagem( 'O(s) campo(s) abaixo deve(m) ser preenchido(s).' + chr(13) + sCampos, 'Atenção', MB_OK + MB_ICONERROR );
      bResultado  := false;
      Result      := bResultado;
      exit;
   end;
   
   //valida se os valores das apropriações conferem com o valor total
   //percorre a lista de apropriações

   if Self.verificaValoresApropriados = false then
   begin
      Mensagem('Os valores não foram totalmente apropriados nos centros de custos.', 'Atenção', MB_OK + MB_ICONWARNING);
      bResultado  := false;
      Result      := bResultado;
      exit;
   end;
   
   vl_total    := 0;
   objParcelaSelecionada.setValorCampo('vl_despesa', txtParvlNota.getValorString() );

   //valida se os valores das parcelas conferem com o valor total
   for i := 0 to ListaParcelas.Count - 1 do
   begin
      vl_parcela :=  StrToFloat (getValorDoObjeto( (ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('vl_despesa') ) );

      vl_total := vl_total + vl_parcela;
   end;

   str_total   := FloatToStrF( vl_total, ffFixed, 15, 2 );
   vl_total    := StrToCurr( str_total );

   if vl_total <> txtVlNota.getValor()  then
   begin
      if Mensagem( 'A soma das parcelas não conferem com o valor total da despesa. Deseja continuar?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
      begin
         if bResultado <> false then
         begin
            DM.setLog(2033, 'Inclusao', sChave, StrToInt(cd_coligada), Concat('Gerou compromisso com possível diferença em ', IntToStr(ListaParcelas.Count - 1), ' parcelas.' ));
            bResultado := true;
         end;
      end
      else
      begin
         bResultado := false;
      end;
   end;

   //retorna o resultado
   Result := bResultado;
end;

procedure TfrmCompromissoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Self.limpaTodosObjetos();

   Action := caFree;
end;

procedure TfrmCompromissoCadastro.FormCreate(Sender: TObject);
begin
   qryColigadas.Close;
   qryColigadas.Open;
end;

procedure TfrmCompromissoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( txtParBoletoCodigoBarras.Focused )  then
   begin
    if key=VK_Tab then
    begin
       key := 0;
    end;
   end;
end;

procedure TfrmCompromissoCadastro.FormShow(Sender: TObject);
var
   retorno: TResultadoBuscaCentro;
begin
   Self.objParcelaSelecionada := nil;

   //lista dos tipos de titulos
   Self.getListaTipoTitulo();

   //lista dos planos de contas
   Self.getListaPlanoContas();

   //lista dos centros de custos
//   Self.getListaCentroCustos();

   //lista de históricos
   Self.getListaHistorico();

   //lista formas de pagamentos
   Self.getListaFormasPgto();

   //lista as contas
   Self.getListaContas();

   //lista de critérios de apropriação
   Self.getListaCristerios();

   //define a data de hoje
   setDataHoje( DM.DataAtual );

   loadCentrosAnaliticos;

   mascara_padrao_historico := DM.variavel_parametro('financeiro_cp_historico');

   //define todas as datas como sendo a de hoje
   if Self.getFormEstado() = 'inserir' then
   begin

      txtDtEmissao.text                := Self.getDataHoje();
      txtDtPrimeiroVencimento.text     := Self.getDataHoje();
      txtDtCompetencia.Text            := Self.getDataHoje();
      pnPgtoBoleto.Height              := 1;
      pnPgtoCartaoCredito.Height       := 1;
      pnPgtoDarf.Height                := 1;
      pnPgtoGPS.Height                 := 1;
      pnInfoParcelas.Height            := 1;
      pnPgtoBoletoArrecadacao.Height   := 1;
      painelApropriacao(false);
      pnGridParcelas.Height            := 1;

      //Ajustar datas caso bloqueado
      if(qryColigadassn_bloquear_financeiro.AsInteger = 1) AND (dm.DataAtual < qryColigadasdt_bloqueio_financeiro.AsDateTime) then
      begin
         txtDtPrimeiroVencimento.text := DateTimeToStr(qryColigadasdt_bloqueio_financeiro.AsDateTime);
         txtDtCompetencia.Text := DateTimeToStr(qryColigadasdt_bloqueio_financeiro.AsDateTime);
      end;

      if(qryColigadassn_bloquear_boleto.AsInteger = 1)  AND (dm.DataAtual < qryColigadasdt_bloqueio_boleto.AsDateTime) then
      begin
         txtDtEmissao.text := DateTimeToStr(qryColigadasdt_bloqueio_boleto.AsDateTime);
      end;

      //seleciona como padrão "Sem critério de apropriação..."
      cmbCriterioApropriacao.ItemIndex := 0;

      cbCentrosAnaliticos.ItemIndex := -1;
      objCentroSelecionado := nil;
      //caso haja uma opção na combo já vem selecionada
      if (cbCentrosAnaliticos.Items.Count-1) = 0 then
      begin
        cbCentrosAnaliticos.ItemIndex:= 0;
        objCentroSelecionado := TCentroCusto.Create(StrToInt(TItemCombo(cbCentrosAnaliticos.Items.Objects[cbCentrosAnaliticos.ItemIndex]).codigo));
      end;

      //ajusta o formulario na tela
      frmCompromissoCadastro.Top    := (Round(Screen.Height / 2) - Round(frmCompromissoCadastro.Height / 2))-200 ;
      frmCompromissoCadastro.Left   := Round(Screen.Width / 2) - Round(frmCompromissoCadastro.Width / 2) ;
      sn_professor := false;
   end
   else if Self.getFormEstado() = 'alterar' then
   begin
      pnPgtoBoleto.Height              := 1;
      pnPgtoCartaoCredito.Height       := 1;
      pnPgtoDarf.Height                := 1;
      pnPgtoGPS.Height                 := 1;
      pnInfoParcelas.Height            := 1;
      pnGridParcelas.Height            := 1;
      txtQtdeParcelas.Visible          := false;
      lbQtdParcelas.Visible            := false;
      txtDtPrimeiroVencimento.Visible  := false;
      lbPrimeiroVencimento.Visible     := false;
      bAlteraHistorico                 := false;
      bAlteraValor                     := false;
      bAlteraPlanoContas               := false;
      bAlteraFornecedor                := false;
      lbComplementoHistorico.Visible   := true;
      //carrega a parcela
      Self.carregarRegistro();

      btnConfirmar.Enabled := true;

      //ajusta o formulario na tela
      frmCompromissoCadastro.Top    := Round(Screen.Height / 2) - Round(frmCompromissoCadastro.Height / 2) ;
      frmCompromissoCadastro.Left   := Round(Screen.Width / 2) - Round(frmCompromissoCadastro.Width / 2) ;

      //verifica se o código selecionado é de um professor
      if ehProfessor( Self.getCdFornecedor() ) then
      begin
         sn_professor := true;
      end
      else
      begin
         sn_professor := false;
      end;

   end;
end;

procedure TfrmCompromissoCadastro.GeraApropriacao(cd_titulo, cd_coligada,
  cd_conta, cd_centro, vl_despesa: string);
var
   qyApropriacao : TUMZQuery;
   sChave         : string;
begin
   qyApropriacao := nil;
   DM.CriarConsulta( qyApropriacao );

   try
      qyApropriacao.Close();
      qyApropriacao.SQL.Clear();

      if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
      begin
         qyApropriacao.SQL.Add(' MERGE INTO fin_apropria_cp fac USING');
         qyApropriacao.SQL.Add('    ( SELECT ''' + cd_titulo + ''' AS cd_titulo, ');
         qyApropriacao.SQL.Add('             ''' + cd_coligada + ''' AS cd_coligada, ');
         qyApropriacao.SQL.Add('             ''' + cd_conta + ''' AS cd_conta, ');
         qyApropriacao.SQL.Add('             ''' + cd_centro + ''' AS cd_centro, ');
         qyApropriacao.SQL.Add('             ''' + vl_despesa + ''' AS vl_movimento ');
         qyApropriacao.SQL.Add('      FROM DUAL ');
         qyApropriacao.SQL.Add('    ) fac2 ON ( fac.cd_titulo = fac2.cd_titulo AND ');
         qyApropriacao.SQL.Add('                fac.cd_coligada = fac2.cd_coligada AND ');
         qyApropriacao.SQL.Add('                fac.cd_conta = fac2.cd_conta AND ');
         qyApropriacao.SQL.Add('                fac.cd_centro = fac2.cd_centro ) ');
         qyApropriacao.SQL.Add(' WHEN MATCHED THEN ');
         qyApropriacao.SQL.Add('    UPDATE SET fac.vl_movimento = fac2.vl_movimento ');
         qyApropriacao.SQL.Add(' WHEN NOT MATCHED THEN ');
         qyApropriacao.SQL.Add('    INSERT( fac.cd_titulo, fac.cd_coligada, fac.cd_conta, fac.cd_centro, fac.vl_movimento ) ');
         qyApropriacao.SQL.Add('    VALUES( fac2.cd_titulo, fac2.cd_coligada, fac2.cd_conta, fac2.cd_centro, fac2.vl_movimento ) ');
      end else begin
         qyApropriacao.SQL.Add('REPLACE INTO fin_apropria_cp ');
         qyApropriacao.SQL.Add(' (cd_titulo, cd_coligada, cd_conta, cd_centro, vl_movimento) ');
         qyApropriacao.SQL.Add('VALUES ');
         qyApropriacao.SQL.Add(' ('''+cd_titulo+''', '''+cd_coligada+''', '''+ cd_conta + ''', '''+cd_centro+''', '''+vl_despesa+''')');
      end;

      qyApropriacao.ExecSQL();

      //Gerar o log
      sChave := Concat( cd_titulo, ';',  cd_coligada );
      DM.setLog(2033, 'Inclusao', sChave, StrToInt(cd_coligada), 'Gerou apropriacao com o titulo "' +  cd_titulo + '"');
   except on E: EZDatabaseError do
      TrataErroBanco( qyApropriacao, E );
   end;

   FreeAndNil( qyApropriacao );
end;

procedure TfrmCompromissoCadastro.GeraMovimento(tipo_acao: TTipoMovimento;
  cd_titulo, cd_coligada: string; vl_despesa: double);
var
   Movimentacao   : TMovimento;
   sChave         : string;
begin
   Movimentacao := TMovimento.create();

   Movimentacao.TipoDeAcao       := tipo_acao;
   Movimentacao.CodigoTitulo     := StrToInt(cd_titulo);
   Movimentacao.Coligada         := StrToInt(cd_coligada);
   Movimentacao.CodAcao          := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
   Movimentacao.ValorMovimento   := vl_despesa;
   Movimentacao.ValorMulta       := 0;
   Movimentacao.ValorJuros       := 0;
   Movimentacao.ValorDesconto    := 0;
   Movimentacao.Observacao       := '';

   Movimentacao.RegistrarMovimentacaoCP(0);

   //Gerar o log
   sChave := Concat( cd_titulo, ';', cd_coligada );
   DM.setLog(2033, 'Inclusao', sChave, StrToInt(cd_coligada), 'Gerou movimento com o titulo "' +  cd_titulo + '"');

   FreeAndNil(Movimentacao);
end;

{busca o código gerado para o compromisso}
procedure TfrmCompromissoCadastro.gerarParcelas;
var
   nr_parcelas          : integer;
   vl_parcelas          : double;
   vl_parcela_formatada : string;
   vl_despesa           : double;
   vl_ultima_parcela    : double;
   vl_total_parcelas    : double;
   sn_previsao          : string;
   ds_descricao         : string;
   i                    : integer;
   bMudaUltimaParcela   : boolean;
   dtVencimentoInicial  : TDateTime;
   dtCompetenciaInicial : TDateTime;
   dtVencimento         : TDateTime;
   dtCompetencia        : TDateTime;
   cd_titulo_principal  : string;
begin
   nr_parcelas          := StrToInt( txtQtdeParcelas.Text );
   vl_despesa           := txtVlNota.getValorDouble();
   vl_ultima_parcela    := 0;
   sn_previsao          := 'N';
   ds_descricao         := '';
   bMudaUltimaParcela   := false;
   dtCompetenciaInicial := StrToDate(txtDtCompetencia.text);
   dtVencimentoInicial  := StrToDate(txtDtPrimeiroVencimento.text);
   dtVencimento         := dtVencimentoInicial;
   dtCompetencia        := dtCompetenciaInicial;
   cd_titulo_principal  := ListaCdTitulos[0];

   //cria a lista de parcelas
   Self.ListaParcelas := TObjectList.Create();

   //trata a divisão do valor da nota por zero.
   vl_parcelas :=  ( vl_despesa / nr_parcelas );

   //formata o valor obtido pela divisão com 2 casas decimais
   vl_parcela_formatada :=  Self.formataValor(vl_parcelas);

   //tranforma o valor formatado em double retirando os . (pontos)
   vl_parcelas := StrToFloat( Self.substituiCaracter( vl_parcela_formatada, '.', '' ));

   //verifica se o valor das parcelas fecha com o valor da despesa
   if Self.getSnVarParcelas = true then
   begin
      //multiplica a quantidade de parcelas pelo valor da divisão entre as parcelas.
      vl_total_parcelas := nr_parcelas * vl_parcelas;

      //se o total das parcelas for maior que o valor da despesa ele ajusta a ultima parcela.
      if vl_total_parcelas > vl_despesa then
      begin
         vl_total_parcelas    := (nr_parcelas-1) * vl_parcelas;
         vl_ultima_parcela    := (vl_despesa - vl_total_parcelas);

         bMudaUltimaParcela   := true;
      end
      else if (vl_total_parcelas < vl_despesa) then
      begin
         vl_ultima_parcela    := (vl_despesa - vl_total_parcelas) + vl_parcelas;

         bMudaUltimaParcela   := true;
      end;
   end;

   try
      FreeAndNil( objCompromisso );
   except
      on E:EAccessViolation do
      begin
         if objCompromisso <> nil then
            objCompromisso := nil;
      end;
   end;

   for i := 1 to nr_parcelas  do
   begin

      objCompromisso := TFinContasPagar.Create();

      objCompromisso.setValorCampo( 'cd_coligada',                IntToStr(self.cd_coligada_seleciona) );
      objCompromisso.setValorCampo( 'cd_pessoa',                  txtCdFornecedor.Text );
      objCompromisso.setValorCampo( 'ds_despesa',                 txtDsHistorico.Text );
      objCompromisso.setValorCampo( 'ds_historico',               txtDsHistorico.Text );
      objCompromisso.setValorCampo( 'nr_documento',               txtNrDocumento.Text );
      objCompromisso.setValorCampo( 'sn_nf_entregue',             Self.getComboCheck(chkNFEntregue.Checked) );
      objCompromisso.setValorCampo( 'nr_parcela',                 IntToStr(i) );
      objCompromisso.setValorCampo( 'dt_emissao_nota',            Self.getDataFormatada( 'yyyy-mm-dd', txtDtEmissao.text) );
      objCompromisso.setValorCampo( 'dt_lancamento',              Self.getDataFormatada( 'yyyy-mm-dd hh:nn:ss', DateTimeToStr(DM.DataAtual()) ));
      objCompromisso.setValorCampo( 'dt_competencia',             Self.getDataFormatada( 'yyyy-mm-dd', DateToStr(dtCompetencia) ));
      objCompromisso.setValorCampo( 'dt_vencimento',              Self.getDataFormatada( 'yyyy-mm-dd', DateToStr( dtVencimento ))) ;
      objCompromisso.setValorCampo( 'dt_provavel_pgto',           objCompromisso.getValorCampo('dt_vencimento') );
      objCompromisso.setValorCampo( 'dt_pagamento',               '' );
      objCompromisso.setValorCampo( 'cd_turma',                   Self.getCdTurma()       );
      objCompromisso.setValorCampo( 'cd_disciplina',              Self.getCdDisciplina()  );
      objCompromisso.setValorCampo( 'nr_anosemestre_disciplina',  Self.getNrAnosemestre() );

      //verifica se chegou na ultima parcela
      if i = nr_parcelas then
      begin
         //verifica se existe a necessidade de ajustar a ultima parcela
         if bMudaUltimaParcela = false then
         begin
            objCompromisso.setValorCampo( 'vl_despesa',     Self.getformataValorParaObjeto(vl_parcelas) );
         end
         else
         begin
            objCompromisso.setValorCampo( 'vl_despesa',     Self.getformataValorParaObjeto(vl_ultima_parcela) );
         end;
      end
      else
      begin
         objCompromisso.setValorCampo( 'vl_despesa',        Self.getformataValorParaObjeto(vl_parcelas) );
      end;

      //verifica a checkbox de previsão e transforma o valor em um char
      if (Self.getComboCheck(chkSnPrevisao.Checked) = '1') then
      begin
         sn_previsao := 'S';
      end
      else
      begin
         sn_previsao := 'N';
      end;

      objCompromisso.setValorCampo( 'cd_situacao',          '1');
      objCompromisso.setValorCampo( 'sn_previsao',          sn_previsao );

      //verifica se selecionou um titulo
      if cmbTipoTitulo.itemIndex > -1 then
      begin
         objCompromisso.setValorCampo( 'cd_tipo_titulo',    (cmbTipoTitulo.Items.Objects[ cmbTipoTitulo.itemIndex ] as TItemCompromisso).getCodigo );
      end;

      objCompromisso.setValorCampo( 'tp_entrada_saida',     '' );
      objCompromisso.setValorCampo( 'cd_forma_pgto',        '' );
      objCompromisso.setValorCampo( 'nr_cheque',            '' );
      objCompromisso.setValorCampo( 'cd_caixa',             '' );
      objCompromisso.setValorCampo( 'cd_titulo_origem',     '' );
      objCompromisso.setValorCampo( 'cd_autoriza',          '' );
      objCompromisso.setValorCampo( 'ds_observacao',        '' );
      objCompromisso.setValorCampo( 'cd_titulo_principal',  cd_titulo_principal );
      objCompromisso.setValorCampo( 'cd_titulo',            ListaCdTitulos[i-1] );

      ListaParcelas.Add( objCompromisso );

      objCompromisso := nil;

      dtVencimento   := Self.getProximoVencimento( dtVencimentoInicial, dtVencimento );
      dtCompetencia  := Self.getProximaCompetencia( dtCompetenciaInicial, dtCompetencia );
   end;

   if nr_parcelas > 1 then
   begin
       Self.setSnVarParcelas(true);
   end
   else
   begin
       Self.setSnVarParcelas(false);
   end;

   //ao gerar as parcelas deixa a primeira selecionada
   if ListaParcelas.Count >= 0 then
   begin
      Self.selecionaParcela( 1 );
      Self.carregaCamposParcelaSelecionada();

      if (Self.getFormEstado() = 'inserir') and ( Self.getSnVarParcelas() = true ) then
      begin
         if pnGridParcelas.Height = 1 then
         begin
            pnGridParcelas.Height := 140;
         end;
      end
      else if (Self.getFormEstado() = 'inserir') and ( Self.getSnVarParcelas() = false ) then
      begin
         pnGridParcelas.Height := 1;
      end;
   end;

end;

function TfrmCompromissoCadastro.getNrAnosemestre: string;
begin
   Result := Self.nr_anosemestre;
end;

function TfrmCompromissoCadastro.getNrParcela: string;
begin
   Result := Self.nr_parcela;
end;

function TfrmCompromissoCadastro.getCdDisciplina: string;
begin
   Result := Self.cd_disciplina;
end;

function TfrmCompromissoCadastro.getCdFornecedor: string;
begin
   Result := Self.cd_fornecedor;
end;

function TfrmCompromissoCadastro.getCdTurma: string;
begin
   Result := Self.cd_turma;
end;

function TfrmCompromissoCadastro.getCodigoCompromisso: string;
begin
   Result := Self.cd_compromisso;
end;

function TfrmCompromissoCadastro.getCodigoCompromissoPrincipal: string;
begin
   Result := Self.cd_compromisso_principal;
end;

function TfrmCompromissoCadastro.getColigadaTitulo(cd_titulo: Integer): Integer;
const
   SQL_GET_COLIGADA_TITULO =
      ' select cd_coligada from fin_contas_pagar where cd_titulo = :cd_titulo ';         
var
   qyGetColigada: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetColigada);

   qyGetColigada.SQL.Text := SQL_GET_COLIGADA_TITULO;
   qyGetColigada.ParamByName('cd_titulo').AsInteger  := cd_titulo;
   qyGetColigada.Open;

   Result := qyGetColigada.FieldByName('cd_coligada').AsInteger;
end;

function TfrmCompromissoCadastro.getComboCheck(valor: boolean): string;
begin
   if valor = true then
   begin
      Result := '1';
   end
   else
   begin
      Result := '0';
   end;
end;

function TfrmCompromissoCadastro.getData(data: string): string;
var
   wAno  : string;
   wMes  : string;
   wDia  : string;
begin
   wAno := copy(data, 1, 4);
   wMes := copy(data, 6, 2);
   wDia := copy(data, 9, 2);

   Result := Concat( wDia, '/', wMes, '/', wAno );
end;

function TfrmCompromissoCadastro.getDataFormatada( formatacao:string; valor: string ): string;
begin
   if trim(valor) <> '' then
   begin
      Result := FormatDateTime( formatacao, StrToDateTime(valor) );
   end
   else
   begin
      Result := '';
   end;
end;

function TfrmCompromissoCadastro.getDataHoje: string;
begin
   Result := DateToStr(Self.data_hoje);
end;

function TfrmCompromissoCadastro.getFormataParaDouble(valor: string): double;
var
   valor_sem_ponto : string;
begin
   valor_sem_ponto := Self.substituiCaracter( valor, '.', '' );
   Result := StrToFloat(valor_sem_ponto);
end;

function TfrmCompromissoCadastro.getFormEstado: string;
begin
   Result := Self.form_estado;
end;

function TfrmCompromissoCadastro.getHistoricoPadrao(
  objParcela: TFinContasPagar): string;
var
   texto_padrao   : string;
begin
   texto_padrao := mascara_padrao_historico;

   if cmbPlanoContas.ItemIndex > -1 then
   begin
      texto_padrao := substituiCaracter(texto_padrao, 'ds_plano_contas',   (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getDescricao() );
      texto_padrao := substituiCaracter(texto_padrao, 'cd_plano_contas',   (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo() );
   end;

   texto_padrao := substituiCaracter(texto_padrao, 'cd_pessoa',         Self.getCdFornecedor()     );
   texto_padrao := substituiCaracter(texto_padrao, 'nm_fornecedor',     lbNomeFornecedor.Caption   );
   texto_padrao := substituiCaracter(texto_padrao, 'nr_documento',      txtNrDocumento.Text        );
   texto_padrao := substituiCaracter(texto_padrao, 'dt_emissao_nota',   Self.txtDtEmissao.Text     );
   texto_padrao := substituiCaracter(texto_padrao, 'sn_nf_entregue',    BoolToStr(chkNFEntregue.Checked)     );

   if cmbTipoTitulo.ItemIndex > -1 then
   begin
      texto_padrao := substituiCaracter(texto_padrao, 'cd_tipo_titulo',    (cmbTipoTitulo.Items.Objects[ cmbTipoTitulo.itemIndex ] as TItemCompromisso).getCodigo );
      texto_padrao := substituiCaracter(texto_padrao, 'nm_tipo_titulo',    (cmbTipoTitulo.Items.Objects[ cmbTipoTitulo.itemIndex ] as TItemCompromisso).getDescricao );
   end;

   Result := texto_padrao;
end;

procedure TfrmCompromissoCadastro.getListaBancoAgencia();
var
   qyBancoCentro     : TUMZQuery;
   objItem           : TItemPessoaConta;
   cd_pessoa         : string;
   nr_banco          : string;
   nr_agencia        : string;
   nr_dig_agencia    : string;
   nr_conta          : string;
   nr_dig_conta      : string;
   nr_dig_ag_conta   : string;
begin
   cd_pessoa         := '';
   nr_banco          := '';
   nr_agencia        := '';
   nr_dig_agencia    := '';
   nr_conta          := '';
   nr_dig_conta      := '';
   nr_dig_ag_conta   := '';
   qyBancoCentro     := nil;

   DM.CriarConsulta( qyBancoCentro );
   qyBancoCentro.Close();
   qyBancoCentro.SQL.Clear;
   qyBancoCentro.SQL.Add('SELECT                                             ');
   qyBancoCentro.SQL.Add(' cd_pessoa, nr_banco, nr_agencia, nr_dig_agencia,  ');
   qyBancoCentro.SQL.Add(' nr_conta, nr_dig_conta, nr_dig_ag_conta           ');
   qyBancoCentro.SQL.Add('FROM                                               ');
   qyBancoCentro.SQL.Add(' fin_pessoas_contas                                ');
   qyBancoCentro.SQL.Add('WHERE                                              ');
   qyBancoCentro.SQL.Add(' cd_pessoa = ' + Self.getCdFornecedor()             );
   qyBancoCentro.Open();

   //item vazio que define novas informações de banco
   objItem := TItemPessoaConta.Create( '', '', '', '', '', '', '' );
   cmbDadosBancoAgencia.Items.AddObject( 'Adicionar...' , objItem );

   while not qyBancoCentro.Eof do
   begin
      cd_pessoa         := qyBancoCentro.FieldByName('cd_pessoa').AsString;
      nr_banco          := qyBancoCentro.FieldByName('nr_banco').AsString;
      nr_agencia        := qyBancoCentro.FieldByName('nr_agencia').AsString;
      nr_dig_agencia    := qyBancoCentro.FieldByName('nr_dig_agencia').AsString;
      nr_conta          := qyBancoCentro.FieldByName('nr_conta').AsString;
      nr_dig_conta      := qyBancoCentro.FieldByName('nr_dig_conta').AsString;
      nr_dig_ag_conta   := qyBancoCentro.FieldByName('nr_dig_ag_conta').AsString;

      objItem := TItemPessoaConta.Create( cd_pessoa, nr_banco, nr_agencia,
      nr_dig_agencia, nr_conta, nr_dig_conta, nr_dig_ag_conta );

      cmbDadosBancoAgencia.Items.AddObject( Concat(objItem.getNrBanco, ' - ', objItem.getNrAgencia ) , objItem );

      qyBancoCentro.Next;
   end;

   FreeAndNil( qyBancoCentro );

end;

{ Carrega as informações dos CENTRO DE CUSTOS na combo de seleção}
procedure TfrmCompromissoCadastro.getListaCentroCustos;
var
   qyCentroCusto     : TUMZQuery;
   objItem           : TItemCompromisso;
   cd_centro_custo   : string;
   ds_centro_custo   : string;
   cd_coligada       : integer;
begin
//   cd_centro_custo   := '';
//   ds_centro_custo   := '';
//   qyCentroCusto     := nil;
//   cd_coligada       := self.cd_coligada_seleciona;
//
//   DM.CriarConsulta( qyCentroCusto );
//   qyCentroCusto.Close();
//   qyCentroCusto.SQL.Clear;
//   qyCentroCusto.SQL.Add('SELECT                                         ');
//   qyCentroCusto.SQL.Add(' cd_centro, cd_classificacao, ds_centro        ');
//   qyCentroCusto.SQL.Add('FROM                                           ');
//   qyCentroCusto.SQL.Add(' fin_centro_custos                             ');
//   qyCentroCusto.SQL.Add('WHERE                                          ');
//   qyCentroCusto.SQL.Add(' tp_centro = 1  AND sn_ativo = 1               ');
//   qyCentroCusto.SQL.Add(' AND cd_coligada = ' + IntToStr( cd_coligada )  );
//   qyCentroCusto.SQL.Add('ORDER BY ds_centro '  );
//   qyCentroCusto.Open();
//
//   while not qyCentroCusto.Eof do
//   begin
//      cd_centro_custo := qyCentroCusto.FieldByName('cd_centro').AsString;
//      ds_centro_custo := concat(qyCentroCusto.FieldByName('cd_classificacao').AsString , '  ',
//                         qyCentroCusto.FieldByName('ds_centro').AsString);
//                         
//      ds_centro_custo := trim(ds_centro_custo);
//
//      objItem := TItemCompromisso.Create( cd_centro_custo, ds_centro_custo );
//
//      cmbCentroCusto.Items.AddObject( objItem.getDescricao, objItem );
//
//      qyCentroCusto.Next;
//   end;
//
//   FreeAndNil( qyCentroCusto );
end;

procedure TfrmCompromissoCadastro.getListaContas( cd_caixa: Integer );
var
   qyContas    : TUMZQuery;
   objItem     : TItemCompromisso;
   cd_caixa_atual    : string;
   ds_conta    : string;
   cd_coligada : integer;
   cd_usuario  : string;
begin
   cd_caixa_atual := '';
   ds_conta    := '';
   qyContas    := nil;
   cd_coligada := self.cd_coligada_seleciona;
   cd_usuario  := IntToStr(DM.iCdPessoaLogado);

   DM.CriarConsulta( qyContas );
   qyContas.Close();
   qyContas.SQL.Clear;
   qyContas.SQL.Add('SELECT                                          ');
   qyContas.SQL.Add(' c.cd_caixa, c.ds_caixa, c.sn_ativa             ');
   qyContas.SQL.Add('FROM                                            ');
   qyContas.SQL.Add(' fin_cadastro_contas c                          ');
   qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (c.cd_caixa = u.cd_caixa) ');
   qyContas.SQL.Add(' INNER JOIN coligadas as co ON (co.cd_coligada = c.cd_coligada ) ');
   qyContas.SQL.Add('WHERE                                           ');
   qycontas.SQL.Add(' u.cd_usuario = ' + cd_usuario                   );
   qycontas.SQL.Add(' AND ( c.sn_ativa = ''S'' '                   );

   if cd_caixa > 0 then
   begin
      qycontas.SQL.Add(' OR c.cd_caixa = ' + IntToStr(cd_caixa) );
   end;

   qycontas.SQL.Add(' ) AND (c.cd_coligada = ' + IntToStr( cd_coligada ) + ' OR c.sn_todas_coligadas = 1 ) ');

   qyContas.SQL.Add(' AND co.cd_coligada_matriz = ' + IntToStr(DM.UsuarioLogado.GetColigadaLogada.Codigo) );

   qyContas.SQL.Add('ORDER BY c.ds_caixa                             ');
   qyContas.Open();

   cmbCaixa.Clear;
   cmbCaixa.Items.Clear;

   while not qyContas.Eof do
   begin
      cd_caixa_atual := qyContas.FieldByName('cd_caixa').AsString;
      ds_conta := qyContas.FieldByName('ds_caixa').AsString;

      if ((qyContas.FieldByName('cd_caixa').asInteger = cd_caixa)
         AND (qyContas.FieldByName('sn_ativa').AsString = 'N')) then
      begin
         cd_caixa_inativo := True;
      end;

      objItem := TItemCompromisso.Create( cd_caixa_atual, ds_conta );

      cmbCaixa.Items.AddObject( objItem.getDescricao, objItem );

      qyContas.Next;
   end;

   FreeAndNil( qyContas );

end;

procedure TfrmCompromissoCadastro.getListaCristerios;
var
   qyCriterios    : TUMZQuery;
   objItem        : TItemCompromisso;
   cd_apropriacao : string;
   ds_apropriacao : string;
begin
   cd_apropriacao := '';
   ds_apropriacao := '';
   qyCriterios    := nil;

   DM.CriarConsulta( qyCriterios );
   
   qyCriterios.Close();

   qyCriterios.SQL.Clear;
   qyCriterios.SQL.Add('SELECT                           ');
   qyCriterios.SQL.Add(' cd_apropriacao, ds_apropriacao  ');
   qyCriterios.SQL.Add('FROM                             ');
   qyCriterios.SQL.Add(' fin_criterios_apropria          ');
   qyCriterios.SQL.Add('WHERE                            ');
   qyCriterios.SQL.Add(' cd_coligada = :cd_coligada      ');
   qyCriterios.SQL.Add('ORDER BY ds_apropriacao          ');

   qyCriterios.ParamByName('cd_coligada').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   qyCriterios.Open();

   //insere valor padrão na combo de seleção
   cd_apropriacao := '';
   ds_apropriacao := 'Usar um único Centro de Custo...';

   objItem := TItemCompromisso.Create( cd_apropriacao, ds_apropriacao );

   cmbCriterioApropriacao.Items.AddObject( objItem.getDescricao, objItem );

   //insere valor padrão na combo de seleção
   cd_apropriacao := 'manual';
   ds_apropriacao := 'Manual';

   objItem := TItemCompromisso.Create( cd_apropriacao, ds_apropriacao );

   cmbCriterioApropriacao.Items.AddObject( objItem.getDescricao, objItem );

   while not qyCriterios.Eof do
   begin
      cd_apropriacao := qyCriterios.FieldByName('cd_apropriacao').AsString;
      ds_apropriacao := qyCriterios.FieldByName('ds_apropriacao').AsString;

      objItem := TItemCompromisso.Create( cd_apropriacao, ds_apropriacao );

      cmbCriterioApropriacao.Items.AddObject( objItem.getDescricao, objItem );

      qyCriterios.Next;
   end;

   FreeAndNil( qyCriterios );
end;

procedure TfrmCompromissoCadastro.getListaFormasPgto;
var
   qyFormaPgto    : TUMZQuery;
   objItem        : TItemCompromissoFormaPgto;
   cd_forma_pgto  : string;
   ds_forma_pgto  : string;
   cd_chave_pgto  : string;
begin
   cd_forma_pgto  := '';
   ds_forma_pgto  := '';
   cd_chave_pgto  := '';
   qyFormaPgto    := nil;

   DM.CriarConsulta( qyFormaPgto );
   qyFormaPgto.Close();
   qyFormaPgto.SQL.Clear;
   qyFormaPgto.SQL.Add('SELECT                                       ');
   qyFormaPgto.SQL.Add(' cd_forma_pgto, ds_forma_pgto, cd_chave_pgto ');
   qyFormaPgto.SQL.Add('FROM                                         ');
   qyFormaPgto.SQL.Add(' fin_formas_pgto                             ');
   qyFormaPgto.SQL.Add('WHERE cd_coligada = ' + IntToStr(self.cd_coligada_seleciona) );
   qyFormaPgto.SQL.Add('ORDER BY ds_forma_pgto                       ');
   qyFormaPgto.Open();

   while not qyFormaPgto.Eof do
   begin
      cd_forma_pgto := qyFormaPgto.FieldByName('cd_forma_pgto').AsString;
      ds_forma_pgto := qyFormaPgto.FieldByName('ds_forma_pgto').AsString;
      cd_chave_pgto := qyFormaPgto.FieldByName('cd_chave_pgto').AsString;

      objItem := TItemCompromissoFormaPgto.Create( cd_forma_pgto, ds_forma_pgto, cd_chave_pgto );

      cmbFormaPgto.Items.AddObject( objItem.getDescricao, objItem );

      qyFormaPgto.Next;
   end;

   FreeAndNil( qyFormaPgto );

end;

{ Carrega as informações do HISTORICO na combo de seleção}
procedure TfrmCompromissoCadastro.getListaHistorico;
var
   qyHistorico    : TUMZQuery;
   objItem        : TItemCompromisso;
   cd_historico   : string;
   ds_historico   : string;
begin
   cd_historico   := '';
   ds_historico   := '';
   qyHistorico    := nil;

   DM.CriarConsulta( qyHistorico );
   qyHistorico.Close();
   qyHistorico.SQL.Clear;
   qyHistorico.SQL.Add('SELECT                        ');
   qyHistorico.SQL.Add(' cd_historico, ds_historico   ');
   qyHistorico.SQL.Add('FROM                          ');
   qyHistorico.SQL.Add(' fin_cp_historicos            ');
   qyHistorico.SQL.Add('ORDER BY ds_historico         ');
   qyHistorico.Open();

   //insere apenas um espaço vazio
   objItem := TItemCompromisso.Create( '', '' );
   cmbHistorico.Items.AddObject( objItem.getCodigo, objItem );

   while not qyHistorico.Eof do
   begin
      cd_historico := qyHistorico.FieldByName('cd_historico').AsString;
      ds_historico := qyHistorico.FieldByName('ds_historico').AsString;

      objItem := TItemCompromisso.Create( cd_historico, ds_historico );

      cmbHistorico.Items.AddObject(  Concat( objItem.getCodigo, ' - ',objItem.getDescricao), objItem );

      qyHistorico.Next;
   end;

   //bloqueia a seleção do histórico caso não haja registros
   if qyHistorico.RecordCount = 0 then
   begin
      cmbHistorico.Enabled := false;
   end
   else
   begin
      cmbHistorico.Enabled := true;
   end;

   FreeAndNil( qyHistorico );

end;

{ Carrega as informações do PLANO DE CONTAS na combo de seleção}
procedure TfrmCompromissoCadastro.getListaPlanoContas;
var
   qyPlanoConta      : TUMZQuery;
   objItem           : TItemCompromisso;
   cd_plano_conta    : string;
   ds_plano_conta    : string;
   cd_coligada       : integer;
begin
   cd_plano_conta    := '';
   ds_plano_conta    := '';
   qyPlanoConta      := nil;
   cd_coligada       := self.cd_coligada_seleciona;

   DM.CriarConsulta( qyPlanoConta );
   qyPlanoConta.Close();
   qyPlanoConta.SQL.Clear;
   qyPlanoConta.SQL.Add('SELECT                                         ');
   qyPlanoConta.SQL.Add(' cd_conta, ds_conta                            ');
   qyPlanoConta.SQL.Add('FROM                                           ');
   qyPlanoConta.SQL.Add(' fin_plano_contas                              ');
   qyPlanoConta.SQL.Add('WHERE                                          ');
   qyPlanoConta.SQL.Add(' tp_conta = 1                                  ');
   qyPlanoConta.SQL.Add(' AND cd_coligada = ' + IntToStr( cd_coligada )  );
   qyPlanoConta.SQL.Add(' AND sn_ativo = 1                              ');
   qyPlanoConta.SQL.Add(' AND tp_entrada_saida IN (0,2)                 ');
   qyPlanoConta.SQL.Add('ORDER BY ds_conta                              ');
   qyPlanoConta.Open();

   while not qyPlanoConta.Eof do
   begin
      cd_plano_conta := qyPlanoConta.FieldByName('cd_conta').AsString;
      ds_plano_conta := qyPlanoConta.FieldByName('ds_conta').AsString;

      objItem := TItemCompromisso.Create( cd_plano_conta, ds_plano_conta );

      cmbPlanoContas.Items.AddObject( objItem.getDescricao, objItem );

      qyPlanoConta.Next;
   end;

   FreeAndNil( qyPlanoConta );
end;

{ Carrega as informações dos TIPOS DE TITULOS na combo de seleção}
procedure TfrmCompromissoCadastro.getListaTipoTitulo;
var
   qyTipoTitulo      : TUMZQuery;
   objItem           : TItemCompromisso;
   cd_tipos_titulo   : string;
   ds_tipos_titulo   : string;
   cd_coligada       : integer;
begin
   cd_tipos_titulo   := '';
   ds_tipos_titulo   := '';
   qyTipoTitulo      := nil;
   cd_coligada       := self.cd_coligada_seleciona;

   DM.CriarConsulta( qyTipoTitulo );
   qyTipoTitulo.Close();
   qyTipoTitulo.SQL.Clear;
   qyTipoTitulo.SQL.Add('SELECT                                         ');
   qyTipoTitulo.SQL.Add(' cd_tipo_titulo, ds_tipo_titulo                ');
   qyTipoTitulo.SQL.Add('FROM                                           ');
   qyTipoTitulo.SQL.Add(' fin_tipos_titulo                              ');
   qyTipoTitulo.SQL.Add('WHERE                                          ');
   qyTipoTitulo.SQL.Add(' ct_tipo_titulo = 2                            ');  // 2 = Contas a Pagar
   qyTipoTitulo.SQL.Add(' AND cd_coligada = ' + IntToStr( cd_coligada )  );

   if Self.form_estado = 'alterar' then
   begin
      qyTipoTitulo.SQL.Add(' AND (sn_ativo = 1 ');
      qyTipoTitulo.SQL.Add(' OR cd_tipo_titulo = :cd_tipo_titulo )');

      qyTipoTitulo.ParamByName('cd_tipo_titulo').AsInteger := Self.cd_tipo_titulo;
   end
   else
   begin
      qyTipoTitulo.SQL.Add(' AND sn_ativo = 1 ');
   end;

   qyTipoTitulo.SQL.Add('ORDER BY ds_tipo_titulo                        ');
   qyTipoTitulo.Open();

   while not qyTipoTitulo.Eof do
   begin
      cd_tipos_titulo := qyTipoTitulo.FieldByName('cd_tipo_titulo').AsString;
      ds_tipos_titulo := qyTipoTitulo.FieldByName('ds_tipo_titulo').AsString;

      objItem := TItemCompromisso.Create( cd_tipos_titulo, ds_tipos_titulo );

      cmbTipoTitulo.Items.AddObject( objItem.getDescricao, objItem );

      qyTipoTitulo.Next;

   end;
   
   FreeAndNil( qyTipoTitulo );
end;

procedure TfrmCompromissoCadastro.carregaApropriacao( cd_titulo: string );
var
   qryCentrosAnaliticos, qyApropriacao  : TUMZQuery;
   cd_conta       : string;
   cd_centro      : string;
   i              : integer;
   cd_coligada    : string;
   vl_movimento   : double;
begin
   cd_coligada := IntToStr(self.cd_coligada_seleciona);

   //libera objeto
   if ListaApropriacoes <> nil then
   begin
      ListaApropriacoes.Clear();
      FreeAndNil(ListaApropriacoes);
   end;
   ListaApropriacoes := TObjectList.Create();

   //libera objeto
   if objApropriacao <> nil then
   begin
      FreeAndNil( objApropriacao );
   end;

   //inicia consulta
   DM.CriarConsulta( qyApropriacao );
   qyApropriacao.Close();
   qyApropriacao.SQL.Clear();
   qyApropriacao.SQL.Add('SELECT * FROM fin_apropria_cp ');
   qyApropriacao.SQL.Add('WHERE ');
   qyApropriacao.SQL.Add('cd_titulo = :cd_titulo AND cd_coligada = :cd_coligada ');

   qyApropriacao.ParamByName('cd_titulo').AsString    := cd_titulo;
   qyApropriacao.ParamByName('cd_coligada').AsString  := cd_coligada;
   qyApropriacao.Open();

   cd_conta       := qyApropriacao.FieldByName('cd_conta').AsString;
   cd_centro      := qyApropriacao.FieldByName('cd_centro').AsString;
   vl_movimento   := qyApropriacao.FieldByName('vl_movimento').AsFloat;

   //Cria consulta que lista os dados na combobox de centros de custos unicos
   DM.CriarConsulta(qryCentrosAnaliticos);

   qryCentrosAnaliticos.SQL.Text :=
      ' SELECT '+
      ' 	  ds_centro, '+
      ' 	  cd_centro, '+
      '    sn_ativo ' +
      ' FROM '+
      '    fin_config_centro_custos '+
      ' WHERE '+
      ' 	  tp_centro = 1 '+
      '    AND cd_coligada_matriz = :cd_coligada_matriz '+
      ' ORDER BY '+
      '    ds_centro ';

   qryCentrosAnaliticos.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryCentrosAnaliticos.Open;

   cbCentrosAnaliticos.Items.Clear;

   while not(qryCentrosAnaliticos.Eof) do
   begin

      if ((qryCentrosAnaliticos.FieldByName('sn_ativo').AsInteger = 1) OR
         (qryCentrosAnaliticos.FieldByName('cd_centro').AsString = cd_centro )) then
      begin

         cbCentrosAnaliticos.AddItem(
            qryCentrosAnaliticos.FieldByName('ds_centro').AsString,
            TItemCombo.Create(
               qryCentrosAnaliticos.FieldByName('cd_centro').AsString,
               qryCentrosAnaliticos.FieldByName('ds_centro').AsString
            )
         );

         if qryCentrosAnaliticos.FieldByName('cd_centro').AsString = cd_centro then
         begin
            cbCentrosAnaliticos.ItemIndex := cbCentrosAnaliticos.Items.Count - 1;
            objCentroSelecionado := TCentroCusto.Create(StrToInt(cd_centro));
         end;

      end;

      qryCentrosAnaliticos.Next;
   end;
   
   //seleciona a conta com base no código recuperado da base
   if  (cd_conta <> '0') and (cd_conta <> '')  then
   begin
      for i := 0 to cmbPlanoContas.Items.Count - 1 do
      begin
         if ( (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).getCodigo = cd_conta ) then
         begin
            cmbPlanoContas.ItemIndex := i;
            txtCdConta.text := cd_conta;
            break;
         end;
      end;

      cd_plano_contas_inicial := cd_conta;
   end;

   if  (cd_centro <> '0') and (cd_centro <> '')  then
   begin
      for i := 0 to cbCentrosAnaliticos.Items.Count - 1 do
      begin
         if ( (cbCentrosAnaliticos.Items.Objects[i] as TItemCombo).getCodigo() = cd_centro ) then
         begin
            cbCentrosAnaliticos.ItemIndex := i;
            objCentroSelecionado := TCentroCusto.Create(StrToInt(cd_centro));
            break;
         end;
      end;

      if cbCentrosAnaliticos.ItemIndex > -1 then
      begin
         cmbCriterioApropriacao.ItemIndex := 0;
         painelApropriacao(false);
      end;

      cd_centro_custos_inicial := cd_centro;
   end;

   //Se houver mais de 1 critério então carrega lista de objetos
   if qyApropriacao.RecordCount > 1 then
   begin
      painelApropriacao(true);
      cmbCriterioApropriacao.ItemIndex := -1;

      //percorre a lista de critérios para carregar a lista de apropriações
      while not qyApropriacao.Eof do
      begin
         objApropriacao := TFinApropriaCP.Create();
         vl_movimento := qyApropriacao.FieldByName('vl_movimento').AsFloat;

         //adiciona na lista apenas o unico critério existente
         objApropriacao.setValorCampo( 'cd_titulo',      cd_titulo );
         objApropriacao.setValorCampo( 'cd_coligada',    cd_coligada );
         objApropriacao.setValorCampo( 'cd_conta',       qyApropriacao.FieldByName('cd_conta').AsString );
         objApropriacao.setValorCampo( 'cd_centro',      qyApropriacao.FieldByName('cd_centro').AsString );
         objApropriacao.setValorCampo( 'vl_movimento',   Self.getformataValorParaObjeto(vl_movimento) );

         ListaApropriacoes.Add( objApropriacao );
         objApropriacao := nil;

         qyApropriacao.Next;
      end;

      Self.carregaApropriacaoGrid();

   end
   else
   begin
      objApropriacao := TFinApropriaCP.Create();

      //adiciona na lista apenas o unico critério existente
      objApropriacao.setValorCampo( 'cd_titulo',      cd_titulo );
      objApropriacao.setValorCampo( 'cd_coligada',    cd_coligada );
      objApropriacao.setValorCampo( 'cd_conta',       cd_conta );
      objApropriacao.setValorCampo( 'cd_centro',      cd_centro );
      objApropriacao.setValorCampo( 'vl_movimento',   Self.getformataValorParaObjeto(vl_movimento) );

      ListaApropriacoes.Add( objApropriacao );
      objApropriacao := nil;
   end;

   qyApropriacao.Close();
   FreeAndNil( qyApropriacao );

   if (Self.getFormEstado() = 'alterar') and (ListaApropriacoes.Count > 1) then
   begin
      cmbCriterioApropriacao.ItemIndex := 1;
   end;
   
end;

procedure TfrmCompromissoCadastro.carregaApropriacaoGrid;
var
   nr_total_apropriacoes   : integer;
   total_colunas           : integer;
   total_linhas            : integer;
   i                       : integer;
   cd_conta                : string;
   ds_conta                : string;
   cd_centro               : string;
   ds_centro               : string;
   vl_movimento            : double;
   objApropriacao          : TFinApropriaCP;
begin
   //prepara a grid para buscar informações das parcelas no objCompromissos
   if (ListaApropriacoes.Count > 0) and (ListaApropriacoes <> nil) then
   begin
      nr_total_apropriacoes            := ListaApropriacoes.Count;

      total_linhas                     := nr_total_apropriacoes + 1; // +1 por que a primeira linha é fixa
      total_colunas                    := 5; //fixo
      sgGridApropriacoes.FixedRows     := 1;
      sgGridApropriacoes.ColCount      := total_colunas;
      sgGridApropriacoes.Cols[0][0]    := 'Conta';
      sgGridApropriacoes.Cols[1][0]    := 'Plano de Contas';
      sgGridApropriacoes.Cols[2][0]    := 'Centro';
      sgGridApropriacoes.Cols[3][0]    := 'Centro de Custos';
      sgGridApropriacoes.Cols[4][0]    := 'Valor';

      //tamanho das colunas
      sgGridApropriacoes.ColWidths[0]  := 40;
      sgGridApropriacoes.ColWidths[1]  := 227;
      sgGridApropriacoes.ColWidths[2]  := 40;
      sgGridApropriacoes.ColWidths[3]  := 146;
      sgGridApropriacoes.ColWidths[4]  := 100;

      sgGridApropriacoes.RowCount      := total_linhas;

      for i := 0 to nr_total_apropriacoes -1 do
      begin
         objApropriacao := (ListaApropriacoes.Items[i] as TFinApropriaCP);

         cd_conta          := objApropriacao.getValorCampo('cd_conta');
         ds_conta          := Self.BuscaDescricaoConta( cd_conta );
         cd_centro         := objApropriacao.getValorCampo('cd_centro');
         ds_centro         := Self.BuscaDescricaoCentroCusto( cd_centro );

         vl_movimento := StrToCurr(Self.getValorDoObjeto( objApropriacao.getValorCampo('vl_movimento') ));

         sgGridApropriacoes.Cols[0][i+1]  := cd_conta;
         sgGridApropriacoes.Cols[1][i+1]  := ds_conta;
         sgGridApropriacoes.Cols[2][i+1]  := cd_centro;
         sgGridApropriacoes.Cols[3][i+1]  := ds_centro;
         sgGridApropriacoes.Cols[4][i+1]  := Self.formataValor(vl_movimento);

      end;

   end
   else
   begin
      Self.limpaGridApropriacoes();
      sgGridApropriacoes.ColCount      := 5;
      sgGridApropriacoes.Cols[0][0]    := 'Conta';
      sgGridApropriacoes.Cols[1][0]    := 'Plano de Contas';
      sgGridApropriacoes.Cols[2][0]    := 'Centro';
      sgGridApropriacoes.Cols[3][0]    := 'Centro de Custos';
      sgGridApropriacoes.Cols[4][0]    := 'Valor';

      //tamanho das colunas
      sgGridApropriacoes.ColWidths[0]  := 40;
      sgGridApropriacoes.ColWidths[1]  := 227;
      sgGridApropriacoes.ColWidths[2]  := 40;
      sgGridApropriacoes.ColWidths[3]  := 146;
      sgGridApropriacoes.ColWidths[4]  := 100;

      sgGridApropriacoes.RowCount      := 2;
   end;

   painelApropriacao(true);
   painelApropriacaoBloqueio();
end;

procedure TfrmCompromissoCadastro.carregaCamposFormPgto( ds_chave_pgto: string );
begin

   if ds_chave_pgto <> '' then
   begin

      if  ds_chave_pgto = '[BOLETO]' then
      begin
         txtParBoletoCodigoBarras.Text := objParcelaSelecionada.getValorCampo('ds_cod_barras');
         Self.processaCampoCodigoBarras();
      end;

      if  ds_chave_pgto = '[ARRECADACAO]' then
      begin
         txtParBoletoCodigoBarrasArrecadacao.Text := objParcelaSelecionada.getValorCampo('ds_cod_barras');

         if Length(txtParBoletoCodigoBarrasArrecadacao.Text) = iTamCodigoBarrasArrecadacao then
         begin
            Self.MontaLinhaDigitavelArrecadacao();
         end;
      end;

      if  ds_chave_pgto = '[CREDITO_CC]' then
      begin
         Self.atualizaListaDadosBancosAgencia();
         cmbDadosBancoAgencia.ItemIndex := 0;
         
         txtParCCBanco.Text         := objParcelaSelecionada.getValorCampo('nr_banco');
         txtParCCAgencia.Text       := objParcelaSelecionada.getValorCampo('nr_agencia');
         txtParCCContaCorrente.Text := objParcelaSelecionada.getValorCampo('nr_conta');

         Self.recuperaSelecaoDadosBancoAgencia();
      end;

      if  ds_chave_pgto = '[DARF]' then
      begin
         txtParDarfCodigoReceitaTributo.Text := objParcelaSelecionada.getValorCampo('ds_receita_tributo');
         txtParDarfNrReferencia.Text         := objParcelaSelecionada.getValorCampo('ds_referencia');
      end;

      if  ds_chave_pgto = '[GPS]' then
      begin
         txtParGpsCodigoReceitaTributo.Text  := objParcelaSelecionada.getValorCampo('ds_receita_tributo');
         txtParGpsPgtoINSS.setValorString( objParcelaSelecionada.getValorCampo('vl_previsto_pgto_inss') );
         txtParGpsValorOutraEntidade.setValorString( objParcelaSelecionada.getValorCampo('vl_outras_entidades') );
         txtParGpsAtualizacaoMonetaria.setValorString( objParcelaSelecionada.getValorCampo('vl_atualizacao_motenaria') );
      end;

   end;
   
end;

procedure TfrmCompromissoCadastro.carregaCamposParcelaSelecionada(avisaContaInativa: Boolean);
var
   sn_previsao          : string;
   cd_caixa             : string;
   cd_forma_pgto        : string;
   ds_chave_forma_pgto  : string;
   i                    : integer;
   cd_pessoa            : integer;
   cd_tipo_titulo       : string;
   dt_pagamento         : string;
begin
   if pnInfoParcelas.Height = 1 then
   begin
      pnInfoParcelas.Height := iPainelDetalhesParcela;
   end;

   cd_pessoa         := strtoint(objParcelaSelecionada.getValorCampo('cd_pessoa'));
   Self.setCdFornecedor( objParcelaSelecionada.getValorCampo('cd_pessoa') );
   cd_tipo_titulo    := objParcelaSelecionada.getValorCampo('cd_tipo_titulo');
   Self.setCodigoCompromisso( objParcelaSelecionada.getValorCampo('cd_titulo') );
   Self.setCodigoCompromissoPrincipal( objParcelaSelecionada.getValorCampo('cd_titulo_principal') );

   sn_previsao                   := objParcelaSelecionada.getValorCampo('sn_previsao');

   if Self.getSnVarParcelas() = true then
   begin
      lbInfoParcela.Caption         := concat(objParcelaSelecionada.getValorCampo('nr_parcela'), '/', Self.getTotalParcelas()) ;
   end
   else
   begin
      lbInfoParcela.Caption         := concat(objParcelaSelecionada.getValorCampo('nr_parcela'), '/', '1') ;
   end;
   txtParVencimento.text         := Self.getData( Self.objParcelaSelecionada.getValorCampo('dt_vencimento') );
   txtParProvavelPgto.text       := Self.getData( Self.objParcelaSelecionada.getValorCampo('dt_provavel_pgto') );
   txtParHistorico.Text          := objParcelaSelecionada.getValorCampo('ds_despesa');
   txtDsHistorico.Text           := objParcelaSelecionada.getValorCampo('ds_historico');
   txtDtEmissao.text             := Self.getData( Self.objParcelaSelecionada.getValorCampo('dt_emissao_nota') );
   txtDtCompetencia.text         := Self.getData( Self.objParcelaSelecionada.getValorCampo('dt_competencia') );
   txtDtPrimeiroVencimento.text  := Self.getData( Self.objParcelaSelecionada.getValorCampo('dt_vencimento') );

   edValorPagar.setValorString(objParcelaSelecionada.getValorCampo('valor_pagar'));
   txtParvlNota.setValorString(objParcelaSelecionada.getValorCampo('vl_despesa'));
   txtParValorAbatimento.setValorString(objParcelaSelecionada.getValorCampo('vl_abatimento'));
   txtParValorDesconto.setValorString(objParcelaSelecionada.getValorCampo('vl_desconto'));
   txtParValorMora.setValorString(objParcelaSelecionada.getValorCampo('vl_mora'));
   
   txtParValorMulta.setValorString( objParcelaSelecionada.getValorCampo('vl_multa') );
   txtParCdTitulo.Text           := objParcelaSelecionada.getValorCampo('cd_titulo');
   txtObservacao.Text            := objParcelaSelecionada.getValorCampo('ds_observacao');
   cd_caixa                      := objParcelaSelecionada.getValorCampo('cd_caixa');
   cd_forma_pgto                 := objParcelaSelecionada.getValorCampo('cd_forma_pgto');
   ds_chave_forma_pgto           := '';

   Self.setCdTurmaDiscAnoSem( objParcelaSelecionada.getValorCampo('cd_turma'),
   objParcelaSelecionada.getValorCampo('cd_disciplina'),
   objParcelaSelecionada.getValorCampo('nr_anosemestre_disciplina'));

   //seleciona a conta com base no código recuperado da base
   if  (cd_caixa <> '0') and (cd_caixa <> '')  then
   begin
   
      getListaContas(StrToInt(cd_caixa));

      for i := 0 to cmbCaixa.Items.Count - 1 do
      begin
         if ( (cmbCaixa.Items.Objects[i] as TItemCompromisso).getCodigo = cd_caixa ) then
         begin
            cmbCaixa.ItemIndex := i;
            break;
         end;
      end;
   end;


   //seleciona a forma de pagamento com base no código recuperado da base
   if  (cd_forma_pgto <> '0') and (cd_forma_pgto <> '')  then
   begin
      for i := 0 to cmbFormaPgto.Items.Count - 1 do
      begin
         if ( (cmbFormaPgto.Items.Objects[i] as TItemCompromissoFormaPgto).getCodigo = cd_forma_pgto ) then
         begin
            cmbFormaPgto.ItemIndex := i;

            ds_chave_forma_pgto := (cmbFormaPgto.Items.Objects[i] as TItemCompromissoFormaPgto).getChave();

            Self.paineisFormaPgto( ds_chave_forma_pgto );
            break;
         end;
      end;
   end;


   //verifica a checkbox de previsão e transforma o valor em um inteiro curto
   if (sn_previsao = 'S') then
   begin
      chkSnPrevisao.Checked := true;
   end
   else
   begin
      chkSnPrevisao.Checked := false;
   end;

   Self.recuperaSelecaoDadosBancoAgencia();
   Self.carregaCamposFormPgto( ds_chave_forma_pgto );

   //caso o form for de alteração carrega os campos abaixo
   if Self.getFormEstado() = 'alterar' then
   begin
      txtCdFornecedor.Text       := IntToStr(cd_pessoa);
      lbNomeFornecedor.Caption   := Self.BuscaNome( cd_pessoa );
      txtNrDocumento.Text        := objParcelaSelecionada.getValorCampo('nr_documento');
      chkNFEntregue.Checked      := StrToBool(objParcelaSelecionada.getValorCampo('sn_nf_entregue'));
      txtVlNota.setValorString( objParcelaSelecionada.getValorCampo('vl_total_despesa') );

      //preenche o campo de turma/disciplina
      txtTurmaProfessor.Text := busca_turma_disciplina( Self.getCdFornecedor(),
      Self.getCdTurma(), Self.getCdDisciplina(), Self.getNrAnosemestre() );

      if txtComplementoHistorico.Visible = true then
      begin
         txtComplementoHistorico.Text := objParcelaCopiaSelecionada.getValorCampo('complemento_historico');
      end;

      //seleciona o tipo de título com base no código recuperado da base
      if  (cd_tipo_titulo <> '0') and (cd_tipo_titulo <> '')  then
      begin
         for i := 0 to cmbTipoTitulo.Items.Count - 1 do
         begin
            if ( (cmbTipoTitulo.Items.Objects[i] as TItemCompromisso).getCodigo = cd_tipo_titulo ) then
            begin
               cmbTipoTitulo.ItemIndex := i;
               break;
            end;
         end;
      end;

      //carrega informações de plano de conta e centro de custo
      Self.carregaApropriacao( objParcelaSelecionada.getValorCampo('cd_titulo_principal') );



      dt_pagamento := objParcelaSelecionada.getValorCampo('dt_pagamento');
   end;

   if qryAnexosParc.Active then
   begin
      qryAnexosParc.Close;
   end;

   qryAnexosParc.ParamByName('CD_TITULO').AsString :=
      objParcelaSelecionada.getValorCampo('cd_titulo');
   qryAnexosParc.ParamByName('CD_COLIGADA').AsString :=
      objParcelaSelecionada.getValorCampo('cd_coligada');
   qryAnexosParc.Open;

end;

procedure TfrmCompromissoCadastro.carregaCentroSintetico(cd_centro: Integer);
var
   arrCentrosFilhos  : TList;

   i                 : Integer;

   vl_total_inserido,
   vl_total          : Double;

   cd_titulo,
   cd_coligada       : String;

begin
   cd_titulo   := trim(Self.getCodigoCompromisso());
   vl_total    := txtVlNota.getValorDouble();
   cd_coligada := IntToStr(self.cd_coligada_seleciona);

   arrCentrosFilhos := TList.Create;
   arrCentrosFilhos.Clear;

   if ListaApropriacoes = nil then
   begin
      ListaApropriacoes := TObjectList.Create;
   end;

   DM.getArraysFilhosSinteticos(
      cd_centro,
      arrCentrosFilhos
   );

   for I := 0 to arrCentrosFilhos.Count - 1 do
   begin
      TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo',      cd_titulo );
      TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_coligada',    cd_coligada );
      
      TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_conta',
         (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo()
      );

      if (arrCentrosFilhos.Count - 1) = I then
      begin
         TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', FloatToStr(vl_total - vl_total_inserido) );
      end
      else
      begin
         TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', FloatToStr( RoundFloat(vl_total/arrCentrosFilhos.Count, 2)));
      end;

      vl_total_inserido := vl_total_inserido + RoundFloat((vl_total/arrCentrosFilhos.Count), 2);
      vl_total_inserido := RoundFloat(vl_total_inserido, 2);

      ListaApropriacoes.Add( TFinApropriaCP(arrCentrosFilhos.Items[i]) );
   end;
end;

procedure TfrmCompromissoCadastro.carregaParcelasGrid();
var
   total_colunas     : integer;
   total_linhas      : integer;
   nr_total_parcelas : integer;
   i                 : integer;
   j                 : integer;
   ds_forma_pgto     : string;
   cd_forma_pgto     : string;
   ds_caixa          : string;
   cd_caixa          : string;
   objParcela        : TFinContasPagar;
   objCopiaParcela   : TFinContasPagar;
   qryDescricaoCaixa : TUMZquery;
begin

   dm.criarConsulta(qryDescricaoCaixa);
         
   //prepara a grid para buscar informações das parcelas no objCompromissos
   nr_total_parcelas          := StrToInt( Self.getTotalParcelas() );
   total_linhas               := nr_total_parcelas + 1; // +1 por que a primeira linha é fixa
   total_colunas              := 7; //fixo
   sgParcelas.FixedRows       := 1;
   sgParcelas.ColCount        := total_colunas;
   sgParcelas.Cols[0][0]      := 'Parcela';
   sgParcelas.Cols[1][0]      := 'Vencimento';
   sgParcelas.Cols[2][0]      := 'Provável Pgto';
   sgParcelas.Cols[3][0]      := 'Valor';
   sgParcelas.Cols[4][0]      := 'Forma de Pgto';
   sgParcelas.Cols[5][0]      := 'Conta';
   sgParcelas.Cols[6][0]      := 'Histórico da Parcela';

   //tamanho das colunas
   sgParcelas.ColWidths[0]    := 45;
   sgParcelas.ColWidths[1]    := 70;
   sgParcelas.ColWidths[2]    := 75;
   sgParcelas.ColWidths[3]    := 65;
   sgParcelas.ColWidths[4]    := 110;
   sgParcelas.ColWidths[5]    := 210;
   sgParcelas.ColWidths[6]    := 195;

   sgParcelas.RowCount        := total_linhas;

   objParcela := TFinContasPagar.Create();

   for i := 0 to ListaParcelas.Count -1 do
   begin
      ds_forma_pgto              := '';
      ds_caixa                   := '';
      cd_caixa                   := '';
      cd_forma_pgto              := '';

      objParcela := (ListaParcelas.Items[i] as TFinContasPagar);

      //adiciona a copia do objeto da parcela na coluna 1 linha i
      if getFormEstado() = 'alterar' then
      begin
         objCopiaParcela            := (ListaCopiaParcelas.Items[i] as TFinContasPagar);
         sgParcelas.Objects[1,i+1]  := objCopiaParcela;
      end;

      //adiciona o objeto da parcela na coluna 0 linha i
      sgParcelas.Objects[0,i+1]  := objParcela;

      sgParcelas.Cols[0][i+1]  := objParcela.getValorCampo('nr_parcela');
      sgParcelas.Cols[1][i+1]  := Self.getData( objParcela.getValorCampo('dt_vencimento') );
      sgParcelas.Cols[2][i+1]  := Self.getData( objParcela.getValorCampo('dt_provavel_pgto') );
      sgParcelas.Cols[3][i+1]  := Self.getValorFormatadoDoObjeto(  objParcela.getValorCampo('vl_despesa') );

      //recupera o código da forma de pagamento
      cd_forma_pgto := objParcela.getValorCampo('cd_forma_pgto');

      if cd_forma_pgto <> '' then
      begin
         //com o código recuperado percorre a lista para encontrar a descrição da forma de pagamento
         for j := 0 to cmbFormaPgto.Items.Count - 1 do
         begin
            if (cmbFormaPgto.Items.Objects[j] as TItemCompromissoFormaPgto).getCodigo =  cd_forma_pgto then
            begin
               ds_forma_pgto := (cmbFormaPgto.Items.Objects[j] as TItemCompromissoFormaPgto).getDescricao();
               break;
            end;
         end;
      end;

      //recupera o código da conta
      cd_caixa := objParcela.getValorCampo('cd_caixa');

      sgParcelas.Cols[5][i+1]  := '';

      if cd_caixa <> '' then
      begin

         qryDescricaoCaixa.SQL.Text :=  ''+
         'SELECT                 '+
	      '  ds_caixa             '+
         'FROM                   '+
	      '  fin_cadastro_contas  '+
         'WHERE                  '+
	      '  cd_caixa = :cd_caixa ';

         qryDescricaoCaixa.ParamByName('cd_caixa').asString := objParcela.getValorCampo('cd_caixa');

         qryDescricaoCaixa.open;

         if qryDescricaoCaixa.RecordCount > 0 then
         begin
            sgParcelas.Cols[5][i+1]  := qryDescricaoCaixa.FieldByName('ds_caixa').asString;
         end;
         
      end;

      sgParcelas.Cols[4][i+1]  := ds_forma_pgto;

      //se o hitorico da parcela for vazio assume o mesmo da parcela princial, parcela 1
      if Trim(objParcela.getValorCampo('ds_despesa')) = '' then
      begin
         sgParcelas.Cols[6][i+1]  := txtDsHistorico.Text;
      end
      else
      begin
         sgParcelas.Cols[6][i+1]  := objParcela.getValorCampo('ds_despesa');
      end;

      objParcela := nil;
   end;

   FreeAndNil( objParcela );

   //se a grid não estiver visivel habilita
   if pnInfoParcelas.Height = 1 then
   begin
      pnInfoParcelas.Height   := iPainelDetalhesParcela;
   end;

end;

procedure TfrmCompromissoCadastro.carregarRegistro;
var
   qyRegistros : TUMZQuery;
begin
   DM.CriarConsulta( qyRegistros );

   //pesquisa o compromisso
   qyRegistros.Close();
   qyRegistros.SQL.Clear;
   qyRegistros.SQL.Add('SELECT * FROM ');
   qyRegistros.SQL.Add(' fin_contas_pagar ');
   qyRegistros.SQL.Add('WHERE');

   if Self.getCodigoCompromissoPrincipal() <> '' then
   begin
      qyRegistros.SQL.Add(' cd_titulo_principal = ' + Self.getCodigoCompromissoPrincipal());
   end
   else
   begin
      qyRegistros.SQL.Add(' cd_titulo = ' + Self.getCodigoCompromisso());
   end;

   qyRegistros.SQL.Add(' AND cd_coligada = ' + inttostr(self.cd_coligada_seleciona));
   qyRegistros.SQL.Add(' AND cd_pessoa = ' + Self.getCdFornecedor() );
   qyRegistros.SQL.Add(' ORDER BY ');
   qyRegistros.SQL.Add(' nr_parcela ');
   qyRegistros.Open();

   //cria a lista de parcelas
   FreeAndNil( Self.ListaParcelas );
   Self.ListaParcelas      := TObjectList.Create();

   //cópia da lista de parcelas
   FreeAndNil( Self.ListaCopiaParcelas );
   Self.ListaCopiaParcelas := TObjectList.Create();

   objCompromisso := nil;

   //percorre os registros
   while not qyRegistros.Eof do
   begin
      objCompromisso       := TFinContasPagar.Create();
      objCopiaCompromisso  := TFinContasPagar.Create();

      objCompromisso.setValorCampo( 'cd_titulo',                  qyRegistros.FieldByName('cd_titulo').AsString );
      objCompromisso.setValorCampo( 'cd_coligada',                qyRegistros.FieldByName('cd_coligada').AsString );
      objCompromisso.setValorCampo( 'cd_pessoa',                  qyRegistros.FieldByName('cd_pessoa').AsString );
      objCompromisso.setValorCampo( 'ds_despesa',                 qyRegistros.FieldByName('ds_despesa').AsString );
      objCompromisso.setValorCampo( 'vl_total_despesa',           Self.getformataValorParaObjeto( qyRegistros.FieldByName('vl_total_despesa').AsFloat ) );
      objCompromisso.setValorCampo( 'nr_documento',               qyRegistros.FieldByName('nr_documento').AsString );
      objCompromisso.setValorCampo( 'sn_nf_entregue',             qyRegistros.FieldByName('sn_nf_entregue').AsString );
      objCompromisso.setValorCampo( 'nr_parcela',                 qyRegistros.FieldByName('nr_parcela').AsString );
      objCompromisso.setValorCampo( 'dt_emissao_nota',            Self.getDataFormatada('yyyy-mm-dd', qyRegistros.FieldByName('dt_emissao_nota').AsString) );
      objCompromisso.setValorCampo( 'dt_lancamento',              Self.getDataFormatada('yyyy-mm-dd hh:nn:ss', DateTimeToStr( Dm.DataAtual() ) ) ) ;
      objCompromisso.setValorCampo( 'dt_competencia',             Self.getDataFormatada('yyyy-mm-dd', qyRegistros.FieldByName('dt_competencia').AsString) );
      objCompromisso.setValorCampo( 'dt_vencimento',              Self.getDataFormatada('yyyy-mm-dd', qyRegistros.FieldByName('dt_vencimento').AsString) ) ;
      objCompromisso.setValorCampo( 'dt_provavel_pgto',           Self.getDataFormatada('yyyy-mm-dd', qyRegistros.FieldByName('dt_provavel_pgto').AsString) );
      objCompromisso.setValorCampo( 'dt_pagamento',               Self.getDataFormatada('yyyy-mm-dd', qyRegistros.FieldByName('dt_pagamento').AsString) );
      objCompromisso.setValorCampo( 'vl_despesa',                 Self.getformataValorParaObjeto( qyRegistros.FieldByName('vl_despesa').AsFloat ));
      objCompromisso.setValorCampo( 'cd_situacao',                qyRegistros.FieldByName('cd_situacao').AsString);
      objCompromisso.setValorCampo( 'sn_previsao',                qyRegistros.FieldByName('sn_previsao').AsString);
      objCompromisso.setValorCampo( 'cd_tipo_titulo',             qyRegistros.FieldByName('cd_tipo_titulo').AsString );
      objCompromisso.setValorCampo( 'tp_entrada_saida',           qyRegistros.FieldByName('tp_entrada_saida').AsString );
      objCompromisso.setValorCampo( 'cd_forma_pgto',              qyRegistros.FieldByName('cd_forma_pgto').AsString );
      objCompromisso.setValorCampo( 'nr_cheque',                  qyRegistros.FieldByName('nr_cheque').AsString );
      objCompromisso.setValorCampo( 'cd_caixa',                   qyRegistros.FieldByName('cd_caixa').AsString );
      objCompromisso.setValorCampo( 'cd_titulo_origem',           qyRegistros.FieldByName('cd_titulo_origem').AsString );
      objCompromisso.setValorCampo( 'cd_autoriza',                qyRegistros.FieldByName('cd_autoriza').AsString );
      objCompromisso.setValorCampo( 'ds_observacao',              qyRegistros.FieldByName('ds_observacao').AsString );
      objCompromisso.setValorCampo( 'cd_titulo_principal',        qyRegistros.FieldByName('cd_titulo_principal').AsString );
      objCompromisso.setValorCampo( 'ds_cod_barras',              qyRegistros.FieldByName('ds_cod_barras').AsString );

      objCompromisso.setValorCampo( 'vl_abatimento',              Self.getformataValorParaObjeto(qyRegistros.FieldByName('vl_abatimento').AsFloat));
      objCompromisso.setValorCampo( 'vl_desconto',                Self.getformataValorParaObjeto(qyRegistros.FieldByName('vl_desconto').AsFloat));
      objCompromisso.setValorCampo( 'vl_mora',                    Self.getformataValorParaObjeto(qyRegistros.FieldByName('vl_mora').AsFloat));
      objCompromisso.setValorCampo( 'vl_multa',                   Self.getformataValorParaObjeto(qyRegistros.FieldByName('vl_multa').AsFloat));
      objCompromisso.setValorCampo( 'valor_pagar',
         Self.getformataValorParaObjeto(
            qyRegistros.FieldByName('vl_despesa').AsFloat -
            qyRegistros.FieldByName('vl_abatimento').AsFloat -
            qyRegistros.FieldByName('vl_desconto').AsFloat -
            qyRegistros.FieldByName('vl_mora').AsFloat -
            qyRegistros.FieldByName('vl_multa').AsFloat
         ));

      objCompromisso.setValorCampo( 'ds_historico',               qyRegistros.FieldByName('ds_historico').AsString );
      objCompromisso.setValorCampo( 'nr_banco',                   qyRegistros.FieldByName('nr_banco').AsString );
      objCompromisso.setValorCampo( 'nr_agencia',                 qyRegistros.FieldByName('nr_agencia').AsString );
      objCompromisso.setValorCampo( 'nr_conta',                   qyRegistros.FieldByName('nr_conta').AsString );
      objCompromisso.setValorCampo( 'ds_receita_tributo',         qyRegistros.FieldByName('ds_receita_tributo').AsString );
      objCompromisso.setValorCampo( 'ds_referencia',              qyRegistros.FieldByName('ds_referencia').AsString );
      objCompromisso.setValorCampo( 'vl_previsto_pgto_inss',      Self.getformataValorParaObjeto( qyRegistros.FieldByName('vl_previsto_pgto_inss').AsFloat ) );
      objCompromisso.setValorCampo( 'vl_outras_entidades',        Self.getformataValorParaObjeto( qyRegistros.FieldByName('vl_outras_entidades').AsFloat ) );
      objCompromisso.setValorCampo( 'vl_atualizacao_motenaria',   Self.getformataValorParaObjeto( qyRegistros.FieldByName('vl_atualizacao_motenaria').AsFloat ) );
      objCompromisso.setValorCampo( 'cd_turma',                   qyRegistros.FieldByName('cd_turma').AsString );
      objCompromisso.setValorCampo( 'cd_disciplina',              qyRegistros.FieldByName('cd_disciplina').AsString );
      objCompromisso.setValorCampo( 'nr_anosemestre_disciplina',  qyRegistros.FieldByName('nr_anosemestre_disciplina').AsString );

      //lista original que é manipulada pelo formulário
      ListaParcelas.Add( objCompromisso );

      //lista que guarda uma cópia da lista dos valores carregados inicialmente
      //controle de campos que foram alterados para a manipulação da autorização
      //do compromisso
      objCopiaCompromisso.setValorCampo( 'vl_despesa',            objCompromisso.getValorCampo('vl_despesa')         );
      objCopiaCompromisso.setValorCampo( 'vl_total_despesa',      objCompromisso.getValorCampo('vl_total_despesa')   );
      objCopiaCompromisso.setValorCampo( 'cd_pessoa',             objCompromisso.getValorCampo('cd_pessoa')          );
      objCopiaCompromisso.setValorCampo( 'ds_historico',          objCompromisso.getValorCampo('ds_historico')       );
      objCopiaCompromisso.setValorCampo( 'cd_autoriza',           objCompromisso.getValorCampo('cd_autoriza')        );
      objCopiaCompromisso.setValorCampo( 'ds_despesa',            objCompromisso.getValorCampo('ds_despesa')         );

      //Auxiliar para o campo histórico
      objCopiaCompromisso.setValorCampo( 'complemento_historico', '' );

      ListaCopiaParcelas.Add( objCopiaCompromisso );

      objCompromisso       := nil;
      objCopiaCompromisso  := nil;

      qyRegistros.Next;
   end;

   if ListaParcelas.Count > 1 then
   begin
      Self.setSnVarParcelas(true);
      Self.setTotalParcelas( IntToStr(ListaParcelas.Count) );
      Self.carregaParcelasGrid();

      if pnGridParcelas.Height = 1 then
      begin
         pnGridParcelas.Height := 140;
      end;
      
      Self.selecionaParcela( StrToInt(Self.getNrParcela) );
      Self.selecionaParcelaGrid();

      //carrega os campos referente a parcela selecionada
      Self.carregaCamposParcelaSelecionada();
   end
   else if ListaParcelas.Count = 1 then
   begin
      Self.setSnVarParcelas(false);

      //seleciona a parcela editada
      Self.selecionaParcela( StrToInt((ListaParcelas.Items[0] as TFinContasPagar).getValorCampo('nr_parcela') ) );

      btnDuplicarCompromisso.Visible := true;

      //carrega os campos referente a parcela selecionada
      Self.carregaCamposParcelaSelecionada();
   end
   else
   begin
      Mensagem('Erro ao carregar informações da parcela selecionada.', 'Erro', MB_OK + MB_ICONERROR);
      Exit;
   end;

   if (cd_caixa_inativo = True) then
   begin
      showmessage('Este compromisso possui vínculo com uma conta inativa!');
      cmbCaixa.SetFocus;
   end;    
end;

procedure TfrmCompromissoCadastro.cbBaixarClick(Sender: TObject);
begin
   if cbBaixar.Tag = 1 then
   begin
      cbBaixar.Checked := False;
   end;
end;

procedure TfrmCompromissoCadastro.cbCentrosAnaliticosChange(Sender: TObject);
begin
   verificaPodeBaixarComp;
end;

procedure TfrmCompromissoCadastro.cbCentrosAnaliticosSelect(Sender: TObject);
begin
   objCentroSelecionado := TCentroCusto.Create(StrToInt(TItemCombo(cbCentrosAnaliticos.Items.Objects[cbCentrosAnaliticos.ItemIndex]).codigo));

   {Caso tenha um centro de custo inativo selecionado e troque para um ativo
   será removido o centro de custo temporário inativo}
   if ((centro_custo_inativo = true) and
      (not(cbCentrosAnaliticos.ItemIndex = cbCentrosAnaliticos.Items.Count - 1))) then
   begin
      cbCentrosAnaliticos.Items.Delete(cbCentrosAnaliticos.Items.Count - 1);
      centro_custo_inativo := False;
   end;
end;

procedure TfrmCompromissoCadastro.chkNFEntregueKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.chkSnPrevisaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      btnConfirmar.SetFocus;
      key := #0;
   end;
end;

function TfrmCompromissoCadastro.getSnVarParcelas: boolean;
begin
   Result := Self.varias_parcelas;
end;

function TfrmCompromissoCadastro.getTotalParcelas: string;
begin
   Result := Self.nr_total_parcelas;
end;

function TfrmCompromissoCadastro.getValorDoObjeto(valor: string): string;
var
   valor_double : double;
begin
   valor_double   := StrToFloat( Self.substituiCaracter( valor, '.', ',' ));
   Result         := FloatToStr(valor_double);
end;

function TfrmCompromissoCadastro.getValorFormatadoDoObjeto(
  valor: string): string;
var
   valor_double : double;
begin
   valor_double   := StrToFloat( Self.substituiCaracter( valor, '.', ',' ));
   Result         := Self.formataValor( valor_double );
end;

function TfrmCompromissoCadastro.getParametroUltimoTitulo : string;
var
   qyParametroTitulo : TUMZQuery;
begin
   DM.CriarConsulta( qyParametroTitulo );
   qyParametroTitulo.Close();
   qyParametroTitulo.SQL.Clear();
   if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
      qyParametroTitulo.SQl.add('UPDATE parametros SET ds_valor = TO_NUMBER(ds_valor) + 1 WHERE ds_variavel = ''financeiro_cd_titulo_cp'' ')
   else
      qyParametroTitulo.SQl.add('UPDATE parametros SET ds_valor = ds_valor + 1 WHERE ds_variavel = ''financeiro_cd_titulo_cp'' ');
   qyParametroTitulo.ExecSQL;

   Result := DM.variavel_parametro( 'financeiro_cd_titulo_cp' );
end;

function TfrmCompromissoCadastro.getPlanoContaPadraoFornecedor( cd_pessoa: string ): string;
var
   qyPlanoConta   : TUMZQuery;
   cd_conta       : string;
begin
   DM.CriarConsulta( qyPlanoConta );
   qyPlanoConta.Close();
   qyPlanoConta.SQL.Clear();
   qyPlanoConta.SQL.Add('SELECT');
   qyPlanoConta.SQL.Add(' pc.cd_conta, pc.ds_conta ');
   qyPlanoConta.SQL.Add('FROM');
   qyPlanoConta.SQL.Add(' fin_plano_contas pc');
   qyPlanoConta.SQL.Add(' INNER JOIN coligadas c on (pc.cd_coligada = c.cd_coligada)');
   qyPlanoConta.SQL.Add(' INNER JOIN fin_plano_contas_fornecedor pcf ON (pcf.cd_conta = pc.cd_conta AND pcf.cd_coligada = pc.cd_coligada) ');
   qyPlanoConta.SQL.Add('WHERE');
   qyPlanoConta.SQL.Add(' pcf.cd_pessoa = :cd_pessoa');

   qyPlanoConta.ParamByName('cd_pessoa').AsString := cd_pessoa;

   qyPlanoConta.Open();

   cd_conta := qyPlanoConta.FieldByName('cd_conta').AsString;

   FreeAndNil( qyPlanoConta );

   Result := cd_conta;
end;

procedure TfrmCompromissoCadastro.inserirParcelas;
var
   cd_parcela_gerada       : string;
   cd_conta                : string;
   cd_centro               : string;
   i,x                     : integer;
   vl_despesa              : double;
   vl_total_despesa        : string;
   sChave                  : string;
   bInserir                : Boolean;
begin

   //verifica se a forma de pagamento selecionada está ok.
   bInserir := validaFormasPgto();

   if bInserir = true then
   begin
      //insere as apropriações na base
      if ListaApropriacoes <> nil then
      begin
         for i := 0 to ListaApropriacoes.Count - 1 do
         begin
           for x := 0 to ListaApropriacoes.Count - 1 do
           begin
             if( x <> i) then
             begin
               if
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_conta') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_conta')
               )
               and
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_centro') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_centro')
               )
               and
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_coligada') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_coligada')
               )
               and
               (
                 ( ListaApropriacoes.Items[x] as TFinApropriaCP).getValorCampo('cd_coligada') =
                 ( ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_coligada')
               )
               then
               begin
                 Mensagem('Não é possível incluir critérios de rateio para o mesmo centro de custo/plano de contas.', 'Atenção' , MB_ICONEXCLAMATION+MB_OK, Handle );
                 Abort;
               end;
             end;
           end;
        end;
      end;
      //Para garantir as ultimas alterações salva a parcela selecionada.
      Self.salvaParcelaSelecionadaObjeto();

      //atualiza as informações fixas das parcelas com base na primeira parcela.
      Self.atualizaCabecalhoTodasParcelas();

      //preenche a forma de pagamento e o caixa das contas em branco
      Self.ProcessaCamposFormaPgtoCaixa();

      vl_total_despesa := Self.getformataValorParaObjeto( txtVlNota.getValorDouble() );

      //recupera o ID disponivel
      cd_compromisso_gerado := ListaCdTitulos[0];
      (ListaParcelas.Items[0] as TFinContasPagar).setValorCampo('cd_titulo_principal', cd_compromisso_gerado);
      (ListaParcelas.Items[0] as TFinContasPagar).setValorCampo('cd_titulo',           cd_compromisso_gerado);

      //insere a primeira parcela
      (ListaParcelas.Items[0] as TFinContasPagar).inserir;

      //Gera a movimentação
      cd_coligada_gerado := (ListaParcelas.Items[0] as TFinContasPagar).getValorCampo('cd_coligada');
      vl_despesa  := StrToFloat( Self.getValorDoObjeto( (ListaParcelas.Items[0] as TFinContasPagar).getValorCampo('vl_despesa') ) );

      //Gerar o log
      sChave := Concat(cd_compromisso_gerado, ';', cd_coligada_gerado);
      DM.setLog(2033, 'Inclusao', sChave, StrToInt(cd_coligada_gerado), 'Gerou compromisso com o titulo "' +  cd_compromisso_gerado + '"');

      Self.GeraMovimento( GerarTitulos, cd_compromisso_gerado, cd_coligada_gerado, vl_despesa );

      //GERA APROPRIAÇÕES

      if cmbCriterioApropriacao.ItemIndex <= 0 then begin // Forçar a Atualização da Apropriação em caso de Alterações

         FreeAndNil(ListaApropriacoes);

      end;      

      //se não existir a lista de apropriações cria apenas uma
      if ListaApropriacoes = nil then
      begin
         ListaApropriacoes := TObjectList.Create();
         try
            FreeAndNil( objApropriacao );
         except
         end;
         objApropriacao := TFinApropriaCP.Create();

         if cmbPlanoContas.itemIndex > -1 then
         begin
            cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();
            objApropriacao.setValorCampo('cd_conta', cd_conta );
         end
         else
         begin
            objApropriacao.setValorCampo('cd_conta', '0' );
         end;

         if objCentroSelecionado <> nil then
         begin
            cd_centro := IntToStr(objCentroSelecionado.Centro); 
            objApropriacao.setValorCampo('cd_centro', cd_centro );
         end
         else
         begin
            objApropriacao.setValorCampo('cd_centro', '0' );
         end;

         objApropriacao.setValorCampo( 'cd_titulo',    cd_compromisso_gerado );
         objApropriacao.setValorCampo( 'cd_coligada',  cd_coligada_gerado );
         objApropriacao.setValorCampo( 'vl_movimento', vl_total_despesa );

         //adiciona a apropriação na lista
         ListaApropriacoes.Add( objApropriacao );

         objApropriacao := nil;
      end;



      for i := 0 to ListaApropriacoes.Count - 1 do
      begin
         objApropriacao := (ListaApropriacoes.Items[i] as TFinApropriaCP);

         Self.GeraApropriacao( cd_compromisso_gerado, objApropriacao.getValorCampo('cd_coligada'), objApropriacao.getValorCampo('cd_conta'), objApropriacao.getValorCampo('cd_centro'), objApropriacao.getValorCampo('vl_movimento') );

         objApropriacao := nil;
      end;
      
      //GERA APROPRIAÇÕES

      //insere as demais parcelas
      for i := 1 to ListaParcelas.Count - 1 do
      begin
         //adiciona o código que vincula à parcela principal.
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_titulo_principal', Self.getCodigoCompromissoPrincipal());

         //insere a parcela no banco de dados.
         (ListaParcelas.Items[i] as TFinContasPagar).inserir;

         cd_parcela_gerada := ListaCdTitulos[i];;

         //Gera a movimentação
         cd_coligada_gerado := (ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('cd_coligada');
         vl_despesa  := StrToFloat( Self.getValorDoObjeto( (ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('vl_despesa') ) );
         Self.GeraMovimento( GerarTitulos, cd_parcela_gerada, cd_coligada_gerado, vl_despesa );
      end;
   end;

end;

procedure TfrmCompromissoCadastro.lbComplementoHistoricoClick(
  Sender: TObject);
begin
   txtComplementoHistorico.Visible := true;
   txtComplementoHistorico.SetFocus();

   lbInfo.Caption := 'Complemento do histórico da parcela:';
   lbInfo.Visible := true;
end;

procedure TfrmCompromissoCadastro.liberaObjListaParcelas;
begin
   //libera a lista de parcelas.
   if Self.ListaParcelas <> nil then
   begin
      ListaParcelas.Clear;
   end;
end;

procedure TfrmCompromissoCadastro.limpaCamposFormaPgto;
begin
   txtParBoletoCodigoBarras.Text             := '';
   txtParBoletoCodigoBarrasArrecadacao.Text  := '';
   txtLinhaDigitavelGrupo1.Text              := '';
   txtLinhaDigitavelGrupo2.Text              := '';
   txtLinhaDigitavelGrupo3.Text              := '';
   txtLinhaDigitavelGrupo4.Text              := '';
   txtLinhaDigitavelGrupo5.Text              := '';
   txtLinhaDigitavelGrupo6.Text              := '';
   txtLinhaDigitavelGrupo7.Text              := '';
   txtLinhaDigitavelGrupo8.Text              := '';
   txtParCCBanco.Text                        := '';
   txtParCCAgencia.Text                      := '';
   txtParCCDigAgencia.Text                   := '';
   txtParCCContaCorrente.Text                := '';
   txtParCCDigContaCorrente.Text             := '';
   txtParCCDifAgenciaConta.Text              := '';
   txtParDarfCodigoReceitaTributo.Text       := '';
   txtParDarfNrReferencia.Text               := '';
   txtParGpsCodigoReceitaTributo.Text        := '';
   txtParGpsPgtoINSS.setValorDouble('0');
   txtParGpsValorOutraEntidade.setValorDouble('0');
   txtParGpsAtualizacaoMonetaria.setValorDouble('0');
end;

procedure TfrmCompromissoCadastro.limpaCamposParcela;
begin
   cmbCaixa.ItemIndex      := -1;
   cmbFormaPgto.ItemIndex  := -1;
   txtParHistorico.Text    := '';
   txtObservacao.Text      := '';
   txtParvlNota.setValorDouble('0');
   txtParValorAbatimento.setValorDouble('0');
   txtParValorDesconto.setValorDouble('0');
   txtParValorMora.setValorDouble('0');
   txtParValorMulta.setValorDouble('0');
end;

procedure TfrmCompromissoCadastro.limpaGridApropriacoes;
var
   total_colunas  : integer;
   iLinha         : integer;
   iColuna        : integer;
begin
   total_colunas := 5;

   for iLinha := 1 to sgGridApropriacoes.RowCount - 1 do
   begin
      for iColuna := 0 to total_colunas - 1 do
      begin
         sgGridApropriacoes.Cells[iColuna,iLinha] := '';
      end;
   end;

   sgGridApropriacoes.RowCount      := 2;
   Self.cd_apropriacao_selecionada  := 0;

   if ListaApropriacoes <> nil then
   begin
      ListaApropriacoes.Clear();
   end;
end;

procedure TfrmCompromissoCadastro.limpaLinhaDigitavel;
begin
   txtLinhaDigitavelGrupo1.Text := '';
   txtLinhaDigitavelGrupo2.Text := '';
   txtLinhaDigitavelGrupo3.Text := '';
   txtLinhaDigitavelGrupo4.Text := '';
   txtLinhaDigitavelGrupo5.Text := '';
   txtLinhaDigitavelGrupo6.Text := '';
   txtLinhaDigitavelGrupo7.Text := '';
   txtLinhaDigitavelGrupo8.Text := '';
end;

procedure TfrmCompromissoCadastro.limpaLinhaDigitavelArrecadacao;
begin
   txtGrupo1.Text := '';
   txtGrupo2.Text := '';
   txtGrupo3.Text := '';
   txtGrupo4.Text := '';
   txtGrupo5.Text := '';
   txtGrupo6.Text := '';
   txtGrupo7.Text := '';
   txtGrupo8.Text := '';
end;

procedure TfrmCompromissoCadastro.limpaRegistroApropriacoes;
var
   qyApropriacao  : TUMZQuery;
   cd_coligada    : string;
begin
   cd_coligada    := IntToStr(self.cd_coligada_seleciona);
   qyApropriacao  := nil;

   DM.CriarConsulta( qyApropriacao );
   qyApropriacao.Close();
   qyApropriacao.SQL.Clear();
   qyApropriacao.SQL.Add('DELETE FROM fin_apropria_cp ');
   qyApropriacao.SQL.Add('WHERE ');
   qyApropriacao.SQL.Add('cd_titulo = :cd_titulo AND cd_coligada = :cd_coligada ');

   qyApropriacao.ParamByName('cd_titulo').AsString    := Self.getCodigoCompromissoPrincipal;
   qyApropriacao.ParamByName('cd_coligada').AsString  := cd_coligada;
   qyApropriacao.ExecSQL;

   FreeAndNil( qyApropriacao );
end;

procedure TfrmCompromissoCadastro.limpaTodosObjetos;
var
   i : integer;
begin
   //libera a lista de tipos de titulos
   for i := cmbTipoTitulo.Items.Count - 1 downto 0 do
   begin
      (cmbTipoTitulo.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbTipoTitulo.Clear;

   //libera a lista de planos de contas
   for i := cmbPlanoContas.Items.Count - 1 downto 0 do
   begin
      (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbPlanoContas.Clear;

   //libera a lista de históricos
   for i := cmbHistorico.Items.Count - 1 downto 0 do
   begin
      (cmbHistorico.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbHistorico.Clear;

   //libera a lista de centros de custos
//   for i := cmbCentroCusto.Items.Count - 1 downto 0 do
//   begin
//      (cmbCentroCusto.Items.Objects[i] as TItemCompromisso).Free;
//   end;
//   cmbCentroCusto.Clear;

   objCentroSelecionado := nil;

   //libera a lista de centros de custos
   for i := cmbFormaPgto.Items.Count - 1 downto 0 do
   begin
      (cmbFormaPgto.Items.Objects[i] as TItemCompromissoFormaPgto).Free;
   end;
   cmbFormaPgto.Clear;

   //libera a lista de contas
   for i := cmbCaixa.Items.Count - 1 downto 0 do
   begin
      (cmbCaixa.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbCaixa.Clear;

   //libera a lista de banco e agencias da tabela fin_pessoas_contas
   for i := cmbDadosBancoAgencia.Items.Count - 1 downto 0 do
   begin
      (cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).Free;
   end;
   cmbDadosBancoAgencia.Clear;           

   //libera a lista de parcelas.
   if Self.ListaParcelas <> nil then
   begin
      ListaParcelas.Clear;

      pnGridParcelas.Height   := 1;
      pnInfoParcelas.Height   := 1;
   end;

   //libera a cópia da lista das parcelas
   if Self.ListaCopiaParcelas <> nil then
   begin
      ListaCopiaParcelas.Clear;
   end;

   if Self.ListaApropriacoes <> nil then
   begin
      ListaApropriacoes.Clear;
   end;

   if Self.objApropriacao <> nil then
   begin
      FreeAndNil( Self.objApropriacao );
   end;

   if Self.objParcelaSelecionada <> nil then
   begin
      Self.objParcelaSelecionada := nil;
   end;

   // libera objeto compromisso
   if Self.objCompromisso <> nil then
   begin
      objCompromisso := nil;
   end;

   // libera a cópia do objeto compromisso
   if Self.objCopiaCompromisso <> nil then
   begin
      objCopiaCompromisso := nil;
   end;

   //libera lista de parcelas geradas
   if Self.ListaParcelas <> nil then
   begin
      FreeAndNil( Self.ListaParcelas );
   end;

   //libera lista de parcelas geradas
   if Self.ListaCopiaParcelas <> nil then
   begin
      FreeAndNil( Self.ListaCopiaParcelas );
   end;

   FreeAndNil( ListaCdTitulos );
end;

procedure TfrmCompromissoCadastro.loadCentrosAnaliticos;
var
   qryCentrosAnaliticos: TUMZQuery;
const
   SQL_BUSCA_CENTROS_ANALITICOS =
      ' SELECT '+
      ' 	ds_centro, '+
      ' 	cd_centro '+
      ' FROM '+
      ' 	fin_config_centro_custos '+
      ' WHERE '+
      ' 	tp_centro = 1 '+
      '  AND cd_coligada_matriz = :cd_coligada_matriz '+
      '  AND sn_ativo = 1 ' +
      ' ORDER BY '+
      '  ds_centro ';

begin
   DM.CriarConsulta(qryCentrosAnaliticos);

   qryCentrosAnaliticos.SQL.Text := SQL_BUSCA_CENTROS_ANALITICOS;
   qryCentrosAnaliticos.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryCentrosAnaliticos.Open;

   cbCentrosAnaliticos.ItemIndex := -1;

   while not(qryCentrosAnaliticos.Eof) do
   begin
      cbCentrosAnaliticos.AddItem(
         qryCentrosAnaliticos.FieldByName('ds_centro').AsString,
         TItemCombo.Create(
            qryCentrosAnaliticos.FieldByName('cd_centro').AsString,
            qryCentrosAnaliticos.FieldByName('ds_centro').AsString
         )
      );

      qryCentrosAnaliticos.Next;
   end;

   cbCentrosAnaliticos.ItemIndex := -1;
end;

procedure TfrmCompromissoCadastro.txtParVencimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParvlNotaExit(Sender: TObject);
begin
 if not (Self.getTotalParcelas() > '1') AND not valoresIguais( txtVlNota.Text, txtParvlNota.Text ) then
   begin
      txtVlNota.setValorString(txtParvlNota.Text);
   end;

   verificaPodeBaixarComp;
   atualizaValorPagar();
end;

function TfrmCompromissoCadastro.Mod10(grupo: string): string;
var
   i              : integer;
   iPeso          : integer;
   iSoma          : integer;
   iMultiplicacao : integer;
   iDigito        : integer;
begin
   iPeso          := 2;
   iSoma          := 0;

   for i := 1 to Length(grupo) do
   begin

      if iPeso = 0 then
      begin
         iPeso := 2
      end;

      iMultiplicacao := (StrToInt( copy(grupo,i,1)  ) * iPeso);

      //verifica se a multiplicação retornou um numero com mais de um dígito
      if Length(inttostr(iMultiplicacao)) > 1 then
      begin
         iMultiplicacao := somaProduto( inttostr(iMultiplicacao) );
      end;

      iSoma := iSoma + iMultiplicacao;

      iPeso := iPeso - 1;
   end;

   iDigito := 10 - (iSoma mod 10);

   if (iDigito = 10) then begin

       iDigito := 0;
       
   end;

   Result := IntToStr( iDigito);
end;

procedure TfrmCompromissoCadastro.MontaCodigoArrecadacao;
var
   sCodigoBarrasDigitado   : string;
   sCodigoBarrasCalculado  : string;
   sDac                    : string;
   sTemp                   : string;
begin
   sCodigoBarrasDigitado   := Concat( txtGrupo1.Text, txtGrupo3.Text, txtGrupo5.Text, txtGrupo7.Text );

   if Length( sCodigoBarrasDigitado ) = iTamCodigoBarrasArrecadacao then
   begin

      sCodigoBarrasCalculado  := Concat( Copy( sCodigoBarrasDigitado, 1, 3), Copy( sCodigoBarrasDigitado, 5, 40) );
      sDac                    := Self.Mod10( sCodigoBarrasCalculado );

      sTemp                   := Concat( Copy( sCodigoBarrasDigitado, 1, 3), sDac, Copy( sCodigoBarrasDigitado, 5, 40) );
      sCodigoBarrasCalculado  := sTemp;

      if sCodigoBarrasDigitado = sCodigoBarrasCalculado then
      begin
         txtParBoletoCodigoBarrasArrecadacao.Text := Concat( sCodigoBarrasDigitado );
      end
      else
      begin
         Mensagem('Favor conferir novamente a digitação da linha digitável, não confere com o código de barras.', 'Atenção', MB_OK + MB_ICONWARNING );
         txtGrupo1.SetFocus();
      end;
   end
   else
   begin
      Mensagem('Quantidade de digito incorreta para montar o código de barras.', 'Atenção', MB_OK + MB_ICONWARNING );
   end;
end;

procedure TfrmCompromissoCadastro.MontaLinhaDigitavelArrecadacao;
var
   S: AnsiString;
   Len: Integer;
   Parts, Module: array[0..3] of AnsiString;
begin

   S := txtParBoletoCodigoBarrasArrecadacao.Text;
   Len := Length(S);

   if Len = 44 then
   begin
      Parts[0] := Copy(S, 1, 11);
      Parts[1] := Copy(S, 12, 11);
      Parts[2] := Copy(S, 23, 11);
      Parts[3] := Copy(S, 34, 11);

      Module[0] := General.Modulo11(Parts[0]);
      Module[1] := General.Modulo11(Parts[1]);
      Module[2] := General.Modulo11(Parts[2]);
      Module[3] := General.Modulo11(Parts[3]);
   end
   else if Len = 48 then
   begin
      Parts[0] := Copy(S, 1, 11);
      Parts[1] := Copy(S, 13, 11);
      Parts[2] := Copy(S, 25, 11);
      Parts[3] := Copy(S, 37, 11);

      Module[0] := S[12];
      Module[1] := S[24];
      Module[2] := S[36];
      Module[3] := S[48];
   end;
   
   txtGrupo1.Text := Parts[0];
   txtGrupo3.Text := Parts[1];
   txtGrupo5.Text := Parts[2];
   txtGrupo7.Text := Parts[3];

   txtGrupo2.Text := Module[0];
   txtGrupo4.Text := Module[1];
   txtGrupo6.Text := Module[2];
   txtGrupo8.Text := Module[3];
end;

procedure TfrmCompromissoCadastro.MontaObjetosApropriacoes( cd_apropriacao: integer );
var
   qyApropriacao        : TUMZQuery;
   ano_semestre,
   cd_coligada,
   i                    : integer;
   vl_apropriacao,
   vl_total,
   vl_percentual,
   vl_rateado,            
   vl_despesa,
   vl_total_sintetico,
   vl_centro_sintetico  : double;

   cd_titulo,
   vl_movimento_final   : string;
   
   arrCentrosFilhos     : TList;
begin
   vl_despesa     := txtVlNota.getValorDouble();
   cd_coligada    := self.cd_coligada_seleciona;
   cd_titulo      := trim(Self.getCodigoCompromisso());

   FreeAndNil( objApropriacao );

   if ListaApropriacoes <> nil then
   begin
      //se existir uma lista, limpa para a criação de uma nova
      ListaApropriacoes.Clear;
   end
   else
   begin
      //se não existir uma lista, cria uma nova
      ListaApropriacoes := TObjectList.Create();
   end;

   DM.CriarConsulta( qyApropriacao );

   qyApropriacao.Close();
   qyApropriacao.SQL.Clear();

   qyApropriacao.SQL.Add(' SELECT ');
   qyApropriacao.SQL.Add('    fca.vl_total, ');
   qyApropriacao.SQL.Add('    fcai.vl_apropriacao, ');
   qyApropriacao.SQL.Add('    fcai.cd_centro, ');
   qyApropriacao.SQL.Add('    fccc.tp_centro ');
   qyApropriacao.SQL.Add(' FROM ');
   qyApropriacao.SQL.Add('    fin_criterios_apropria AS fca ');
   qyApropriacao.SQL.Add(' INNER JOIN fin_criterios_apropria_itens AS fcai ON( ');
   qyApropriacao.SQL.Add(' 	fcai.cd_apropriacao = fca.cd_apropriacao ');
   qyApropriacao.SQL.Add(' ) ');
   qyApropriacao.SQL.Add(' INNER JOIN coligadas AS c ON ( ');
   qyApropriacao.SQL.Add(' 	c.CD_COLIGADA_MATRIZ = fcai.cd_coligada ');
   qyApropriacao.SQL.Add(' ) ');
   qyApropriacao.SQL.Add(' INNER JOIN fin_config_centro_custos AS fccc ON ( ');
   qyApropriacao.SQL.Add(' 	fccc.cd_centro = fcai.cd_centro ');
   qyApropriacao.SQL.Add(' 	AND fccc.cd_coligada_matriz = c.CD_COLIGADA_MATRIZ ');
   qyApropriacao.SQL.Add(' ) ');
   qyApropriacao.SQL.Add(' WHERE ');
   qyApropriacao.SQL.Add('    fca.cd_apropriacao = :cd_apropriacao ');
   qyApropriacao.SQL.Add(' 	AND c.cd_coligada = :cd_coligada ');

   qyApropriacao.ParamByName('cd_apropriacao').AsString  := IntToStr(cd_apropriacao);
   qyApropriacao.ParamByName('cd_coligada').AsString     := IntToStr(cd_coligada);

   qyApropriacao.Open;

   ano_semestre         := DM.GetAnoSemestreAtual;

   arrCentrosFilhos := TList.Create;
   
   //percorre a lista de itens referente as apropriações de cada centro
   while not qyApropriacao.Eof do
   begin

      if qyApropriacao.FieldByName('tp_centro').AsInteger = 2 then
      begin
         arrCentrosFilhos.Clear;
         vl_total_sintetico := 0;

         DM.getArraysFilhosSinteticos(
            qyApropriacao.FieldByName('cd_centro').AsInteger,
            arrCentrosFilhos
         );

         for I := 0 to arrCentrosFilhos.Count - 1 do
         begin

            if i = (arrCentrosFilhos.Count-1) then
            begin

               vl_centro_sintetico := (qyApropriacao.FieldByName('vl_apropriacao').AsFloat - vl_total_sintetico);

               vl_centro_sintetico := RoundFloat(vl_centro_sintetico, 2);

               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo('vl_movimento', FloatToStr(vl_centro_sintetico));

               Continue;

            end;

            if i < (arrCentrosFilhos.Count-1) then
            begin

               vl_centro_sintetico := qyApropriacao.FieldByName('vl_apropriacao').AsFloat / (arrCentrosFilhos.Count);

               vl_centro_sintetico := RoundFloat(vl_centro_sintetico, 2);

               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo('vl_movimento', FloatToStr(vl_centro_sintetico));

               vl_total_sintetico := vl_total_sintetico + vl_centro_sintetico;

            end;
         end;

         vl_total_sintetico := 0;
         vl_centro_sintetico := 0;

         for I := 0 to arrCentrosFilhos.Count - 1 do
         begin

            vl_apropriacao := StrToFloat(TFinApropriaCP(arrCentrosFilhos.Items[i]).getValorCampo('vl_movimento'));
            vl_total       := qyApropriacao.FieldByName('vl_total').AsCurrency;

            if cd_titulo <> '' then
            begin
               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo',    cd_titulo );
            end
            else
            begin
               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo',    '' );
            end;

            TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_coligada',  IntToStr(cd_coligada) );

            //se houver uma seleção do plano de contas preenche o objeto apropriacao
            if cmbPlanoContas.ItemIndex > -1 then
            begin
               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_conta',  (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo() );
            end;

            if (arrCentrosFilhos.Count-1) = I then
            begin
               vl_apropriacao := qyApropriacao.FieldByName('vl_apropriacao').AsFloat;

               vl_percentual  := (vl_apropriacao / vl_total);

               vl_rateado     := RoundFloat(vl_despesa * vl_percentual, 2);

               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', Self.getformataValorParaObjeto(vl_rateado - vl_total_sintetico) );
            end;

            if (arrCentrosFilhos.Count-1) > I then
            begin
               vl_percentual  := (vl_apropriacao / vl_total);

               vl_rateado     := RoundFloat(vl_despesa * vl_percentual, 2);

               TFinApropriaCP(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', Self.getformataValorParaObjeto( RoundFloat(vl_rateado, 2) ) );

               vl_total_sintetico := vl_total_sintetico + RoundFloat(vl_rateado, 2);
            end;

            ListaApropriacoes.Add( TFinApropriaCP(arrCentrosFilhos.Items[i]) );

         end;
      end;

      vl_percentual := 0;
      vl_rateado := 0;
      vl_total := 0;
      vl_apropriacao := 0;

      if qyApropriacao.FieldByName('tp_centro').AsInteger = 1 then
      begin
         vl_apropriacao := qyApropriacao.FieldByName('vl_apropriacao').AsCurrency;
         vl_total       := qyApropriacao.FieldByName('vl_total').AsCurrency;

         if vl_apropriacao > 0 then
         begin
           objApropriacao := TFinApropriaCP.Create();

           if cd_titulo <> '' then
           begin
             objApropriacao.setValorCampo( 'cd_titulo',    cd_titulo );
           end
           else
           begin
             objApropriacao.setValorCampo( 'cd_titulo',    '' );
           end;

            objApropriacao.setValorCampo( 'cd_coligada',  IntToStr(cd_coligada) );

            //se houver uma seleção do plano de contas preenche o objeto apropriacao
            if cmbPlanoContas.ItemIndex > -1 then
            begin
               objApropriacao.setValorCampo( 'cd_conta',  (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo() );
            end;

            //se houver uma seleção do centro de custo preenche o objeto apropriacao
            objApropriacao.setValorCampo( 'cd_centro', qyApropriacao.FieldByName('cd_centro').AsString );

            vl_percentual  := (vl_apropriacao / vl_total);

            vl_rateado     := RoundFloat(vl_despesa * vl_percentual, 2);

            objApropriacao.setValorCampo( 'vl_movimento', Self.getformataValorParaObjeto( RoundFloat(vl_rateado, 2) ) );

            ListaApropriacoes.Add( objApropriacao );

            objApropriacao := nil;
        end;
      end;

      qyApropriacao.Next;
      
   end;

   qyApropriacao.Close();

   FreeAndNil( qyApropriacao );

   Self.AjustaValoresApropriacoes();
end;

procedure TfrmCompromissoCadastro.paineisFormaPgto( sFormaPgtoSelecionada: string );
begin
   //ativa o painel necessário para cada forma de pagamento selecionada
   if sFormaPgtoSelecionada <> '' then
   begin
      if  sFormaPgtoSelecionada = '[BOLETO]' then
      begin
         pnPgtoBoleto.Height              := iPainelPgtoBoleto;
         pnPgtoCartaoCredito.Height       := 1;
         pnPgtoDarf.Height                := 1;
         pnPgtoGPS.Height                 := 1;
         pnPgtoBoletoArrecadacao.Height   := 1;
      end;

      if  sFormaPgtoSelecionada = '[ARRECADACAO]' then
      begin
         pnPgtoBoleto.Height              := 1;
         pnPgtoCartaoCredito.Height       := 1;
         pnPgtoDarf.Height                := 1;
         pnPgtoGPS.Height                 := 1;
         pnPgtoBoletoArrecadacao.Height   := iPainelPgtoBoletoArrecadacao;
      end;

      if  sFormaPgtoSelecionada = '[CREDITO_CC]' then
      begin
         pnPgtoBoleto.Height              := 1;
         pnPgtoCartaoCredito.Height       := iPainelCartaoCredito;
         pnPgtoDarf.Height                := 1;
         pnPgtoGPS.Height                 := 1;
         pnPgtoBoletoArrecadacao.Height   := 1;
         //aqui
      end;

      if  sFormaPgtoSelecionada = '[DARF]' then
      begin
         pnPgtoBoleto.Height              := 1;
         pnPgtoCartaoCredito.Height       := 1;
         pnPgtoDarf.Height                := iPainelPgtoDarf;
         pnPgtoGPS.Height                 := 1;
         pnPgtoBoletoArrecadacao.Height   := 1;
      end;

      if  sFormaPgtoSelecionada = '[GPS]' then
      begin
         pnPgtoBoleto.Height              := 1;
         pnPgtoCartaoCredito.Height       := 1;
         pnPgtoDarf.Height                := 1;
         pnPgtoGPS.Height                 := iPainelPgtoGPS;
         pnPgtoBoletoArrecadacao.Height   := 1;
      end;
   end
   else
   begin
      pnPgtoBoleto.Height              := 1;
      pnPgtoCartaoCredito.Height       := 1;
      pnPgtoDarf.Height                := 1;
      pnPgtoGPS.Height                 := 1;
      pnPgtoBoletoArrecadacao.Height   := 1;
   end;
end;

procedure TfrmCompromissoCadastro.painelApropriacao(valor: boolean);
begin
   if pnGridCriterios.Visible <> valor then
   begin
      pnGridCriterios.Visible := valor;
   end;

   if sbCriterioInserir.Visible <> valor then
   begin
      sbCriterioInserir.Visible := valor;
   end;

   if sbCriterioEditar.Visible <> valor then
   begin
      sbCriterioEditar.Visible := valor;
   end;

   if sbCriterioApagar.Visible <> valor then
   begin
      sbCriterioApagar.Visible := valor;
   end;
end;

procedure TfrmCompromissoCadastro.painelApropriacaoBloqueio;
begin
   if ListaApropriacoes <> nil then
   begin
      sbCriterioEditar.Enabled := ListaApropriacoes.Count > 0;
      sbCriterioApagar.Enabled := ListaApropriacoes.Count > 0;
   end;
end;

procedure TfrmCompromissoCadastro.processaCampoCodigoBarras;
var
   sCodigoBarras     : string;
   ehCodigoBarras    : boolean;
   ehLinhaDigitavel  : boolean;
   iTamanho          : integer;
begin
   sCodigoBarras     := txtParBoletoCodigoBarras.Text;
   ehCodigoBarras    := false;
   ehLinhaDigitavel  := false;

   sCodigoBarras:= stringReplace(sCodigoBarras,#9,'', [rfReplaceAll, rfIgnoreCase]);
   iTamanho          := Length( sCodigoBarras );
   //se for código de barras digitado
   if trim(sCodigoBarras) <> '' then
   begin

      //verifica se possui o tamanho do código de barras ou linha digitável
      if iTamanho = iTamCodigoBarrasBoletoBancario then
      begin
         ehCodigoBarras := true;
         VerPainelLinhaDigitavel(true);
         if txtLinhaDigitavelGrupo1.Enabled then
            txtLinhaDigitavelGrupo1.SetFocus;
      end
      else if ( iTamanho = 47 ) then
      begin
         ehLinhaDigitavel := true;
         VerPainelLinhaDigitavel(true);
         if txtLinhaDigitavelGrupo1.Enabled then
            txtLinhaDigitavelGrupo1.SetFocus;
      end
      else
      begin
         VerPainelLinhaDigitavel(false);
      end;

      if ehCodigoBarras = true then
      begin
          Self.CalculaLinhaDigitavel( txtParBoletoCodigoBarras.Text );
      end
      else if (ehLinhaDigitavel = true) then
      begin
         Self.CalculaCodigoBarras();
         Self.CalculaLinhaDigitavel( txtParBoletoCodigoBarras.Text );
      end;
 
   end
   else
   begin
      //se for linha digitável digitada
      Self.CalculaCodigoBarras();
   end;

end;

procedure TfrmCompromissoCadastro.ProcessaCamposFormaPgtoCaixa;
var
   i                          : integer;
   cd_caixa                   : string;
   cd_forma_pgto              : string;
   cd_caixa_selecionado       : string;
   cd_forma_pgto_selecionado  : string;
begin

   //percorre lista das parcelas
   if (ListaParcelas <> nil) and (ListaParcelas.Count > 1) then
   begin

      for i := 0 to ListaParcelas.Count - 1 do
      begin
         cd_caixa_selecionado       := trim((ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('cd_caixa'));
         cd_forma_pgto_selecionado  := trim((ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('cd_forma_pgto'));

         //cd_caixa
         if cd_caixa_selecionado <> '' then
         begin
            cd_caixa := cd_caixa_selecionado;
         end
         else
         begin
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo( 'cd_caixa', cd_caixa );
         end;

         //cd_forma_pgto
         if cd_forma_pgto_selecionado <> '' then
         begin
            cd_forma_pgto := cd_forma_pgto_selecionado;
         end
         else
         begin
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_forma_pgto', cd_forma_pgto);
         end;

      end;

   end;
end;

procedure TfrmCompromissoCadastro.processaParcela;
var
   nr_parcela : integer;
begin
   if (trim(txtQtdeParcelas.Text) <> '') and (strtoint(txtQtdeParcelas.Text) <> 0) then
   begin
      Self.setTotalParcelas( txtQtdeParcelas.Text );

      nr_parcela := StrToInt( Self.getTotalParcelas() );

      if nr_parcela > 0 then
      begin

         Self.setListaCdTitulos( nr_parcela );

         if (trim(txtCdFornecedor.Text) <> '') then
         begin
            Self.liberaObjListaParcelas();
            Self.limpaCamposFormaPgto();
            Self.limpaCamposParcela();

            //verifica se existe mais de uma parcela
            if nr_parcela > 1 then
            begin
               Self.setSnVarParcelas( true );
            end
            else
            begin
               Self.setSnVarParcelas( false );
            end;

            //painel com os campos das parcelas
            if pnInfoParcelas.Height = 1 then
            begin
               pnInfoParcelas.Height := iPainelDetalhesParcela;
            end;

            txtParvlNota.setValorDouble( FloatToStr( txtVlNota.getValorDouble ) );
            txtParHistorico.Text       := txtDsHistorico.Text;
            Self.gerarParcelas();

            //verifica se são várias parcelas
            if Self.getSnVarParcelas() = true then
            begin
               btnDuplicarCompromisso.Visible := false;
               //Lê o objeto de compromissos e alimenta o grid
               Self.carregaParcelasGrid();
            end
            else
            begin
               btnDuplicarCompromisso.Visible := true;
               Self.setSnVarParcelas(false);
            end;

            btnConfirmar.Enabled := true;
            //txtParCdTitulo.Text  := Self.getCodigoCompromisso();
         end
         else
         begin
            btnConfirmar.Enabled := false;
            Mensagem('Selecione o Fornecedor.', 'Atenção', MB_OK + MB_ICONERROR);
            sbFornecedorClick( nil );
         end;

      end;
   end
   else
   begin
      Mensagem ('A quantidade de parcelas deve ser maior que zero.', 'Atenção', MB_OK + MB_ICONWARNING);
      txtQtdeParcelas.Text := '1';
      txtQtdeParcelas.SetFocus();
   end;
end;

procedure TfrmCompromissoCadastro.recuperaSelecaoDadosBancoAgencia;
var
   cd_pessoa   : string;
   nr_banco    : string;
   nr_agencia  : string;
   nr_conta    : string;
   i           : integer;
begin
   cd_pessoa   := Self.getCdFornecedor();
   nr_banco    := trim(objParcelaSelecionada.getValorCampo('nr_banco'));
   nr_agencia  := trim(objParcelaSelecionada.getValorCampo('nr_agencia'));
   nr_conta    := trim(objParcelaSelecionada.getValorCampo('nr_conta'));

   if  (cd_pessoa <> '') and (nr_banco <> '') and (nr_agencia <> '') and (nr_conta <> '')  then
   begin
      for i := 0 to cmbDadosBancoAgencia.Items.Count -1 do
      begin
         if ( ((cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getCdPessoa       = cd_pessoa ))
               and ((cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getNrBanco   = nr_banco   )
               and ((cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getNrAgencia = nr_agencia )
               and ((cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getNrConta   = nr_conta   ) then
         begin
            cmbDadosBancoAgencia.ItemIndex := i;

            txtParCCDigAgencia.Text       := (cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getNrDigAgencia;
            txtParCCDigContaCorrente.Text := (cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getNrDigConta;
            txtParCCDifAgenciaConta.Text  := (cmbDadosBancoAgencia.Items.Objects[i] as TItemPessoaConta).getNrDifAgenciaConta;

            if i > 0 then
            begin
               //incluir novos dados da agencia
               Self.escritaBotoesDadosAgencia( true );
            end
            else
            begin
               // selecionar os dados da agencia sem necessidade de alterar
               Self.escritaBotoesDadosAgencia( false );
            end;

            break;
         end;
      end;
   end;
end;

function TfrmCompromissoCadastro.substituiCaracter(valor: string; str_antigo: string; str_novo: string): string;
begin
   Result := StringReplace( valor, str_antigo, str_novo, [rfReplaceAll, rfIgnoreCase] );
end;

procedure TfrmCompromissoCadastro.salvaCamposFormPgto( nr_parcela: integer; ds_chave_pgto: string );
begin

   if ds_chave_pgto <> '' then
   begin

      if  ds_chave_pgto = '[BOLETO]' then
      begin
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('ds_cod_barras', txtParBoletoCodigoBarras.Text);
      end;

      if  ds_chave_pgto = '[ARRECADACAO]' then
      begin
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('ds_cod_barras', txtParBoletoCodigoBarrasArrecadacao.Text);
      end;

      if  ds_chave_pgto = '[CREDITO_CC]' then
      begin
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('nr_banco',   txtParCCBanco.Text);
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('nr_agencia', txtParCCAgencia.Text);
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('nr_conta',   txtParCCContaCorrente.Text);
      end;

      if  ds_chave_pgto = '[DARF]' then
      begin
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('ds_receita_tributo',  txtParDarfCodigoReceitaTributo.Text);
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('ds_referencia',       txtParDarfNrReferencia.Text);
      end;

      if  ds_chave_pgto = '[GPS]' then
      begin
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('ds_receita_tributo',        txtParGpsCodigoReceitaTributo.Text);
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('vl_previsto_pgto_inss',     txtParGpsPgtoINSS.getValorString());
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('vl_outras_entidades',       txtParGpsValorOutraEntidade.getValorString());
         (ListaParcelas.Items[nr_parcela] as TFinContasPagar).setValorCampo('vl_atualizacao_motenaria',  txtParGpsAtualizacaoMonetaria.getValorString());
      end;

   end;
end;

procedure TfrmCompromissoCadastro.salvaParcelaSelecionadaObjeto;
var
   i              : integer;
   sn_previsao    : string;
   cd_caixa       : string;
   cd_forma_pgto  : string;
   ds_chave_pgto  : string;
begin
   sn_previsao    := '';
   cd_caixa       := '';
   cd_forma_pgto  := '';

   //percorre a lista de parcelas afim de identificar qual está sendo alterada
   for i := 0 to ListaParcelas.Count -1 do
   begin
      //verifica se o código da parcela alterar é o mesmo da listada se for, altera e pausa a procura.
      if (StrToInt((ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('nr_parcela'))  = StrToInt(objParcelaSelecionada.getValorCampo('nr_parcela')) ) then
      begin

         //somente se for alteração aatualiza os campos abaixo
         if Self.getFormEstado() = 'alterar' then
         begin
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_pessoa',              txtCdFornecedor.Text );
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('nr_documento',           txtNrDocumento.Text );
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('dt_emissao_nota',        Self.getDataFormatada( 'yyyy-mm-dd', txtDtEmissao.text ) );
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('sn_nf_entregue',         Self.getComboCheck(chkNFEntregue.Checked) );
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('dt_competencia',         Self.getDataFormatada( 'yyyy-mm-dd', txtDtCompetencia.text ) );
         end;

         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_titulo',                 Self.getCodigoCompromisso() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_titulo_principal',       Self.getCodigoCompromissoPrincipal() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('dt_vencimento',             Self.getDataFormatada( 'yyyy-mm-dd', txtParVencimento.text ) );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('dt_provavel_pgto',          Self.getDataFormatada( 'yyyy-mm-dd', txtParProvavelPgto.text ) );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_despesa',                txtParvlNota.getValorString() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_total_despesa',          txtvlNota.getValorString() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_abatimento',             txtParValorAbatimento.getValorString() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_desconto',               txtParValorDesconto.getValorString() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_mora',                   txtParValorMora.getValorString() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('vl_multa',                  txtParValorMulta.getValorString() );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('ds_despesa',                txtParHistorico.Text );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('ds_historico',              txtDsHistorico.Text );

         if cmbHistorico.ItemIndex > 0 then
         begin
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_historico',           TItemCompromisso(cmbHistorico.Items.Objects[cmbHistorico.ItemIndex]).getCodigo);
         end;

         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('ds_observacao',             txtObservacao.Text );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_turma',                  Self.getCdTurma()       );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_disciplina',             Self.getCdDisciplina()  );
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('nr_anosemestre_disciplina', Self.getNrAnosemestre() );

         //Tipo de titulo
         if cmbTipoTitulo.itemIndex > -1 then
         begin
            (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_tipo_titulo',   (cmbTipoTitulo.Items.Objects[ cmbTipoTitulo.itemIndex ] as TItemCompromisso).getCodigo );
         end;

         //Se existir items para seleção na combo verifica se foi selecionado algum
         if cmbCaixa.ItemIndex >= 0 then
         begin
            cd_caixa := (cmbCaixa.Items.Objects[ cmbCaixa.itemIndex ] as TItemCompromisso).getCodigo;
            cmbCaixa.ItemIndex := -1;
         end;
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_caixa',         cd_caixa );


         //se existir items para seleção na combo verifica se foi selecionado algum
         if cmbFormaPgto.ItemIndex >= 0 then
         begin
            cd_forma_pgto := (cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex ] as TItemCompromissoFormaPgto).getCodigo;
            ds_chave_pgto := (cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex ] as TItemCompromissoFormaPgto).getChave;

            cmbFormaPgto.ItemIndex := -1;
         end;
         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('cd_forma_pgto',    cd_forma_pgto );

         //verifica a checkbox de previsão e transforma o valor em um char
         if (Self.getComboCheck(chkSnPrevisao.Checked) = '1') then
         begin
            sn_previsao := 'S';
         end
         else
         begin
            sn_previsao := 'N';
         end;

         (ListaParcelas.Items[i] as TFinContasPagar).setValorCampo('sn_previsao',      sn_previsao);

         //salva a forma de pagamento passando o número da parcela e a forma de pagamento via parametro
         Self.salvaCamposFormPgto( i, ds_chave_pgto );

         Self.limpaCamposParcela();
         Self.limpaCamposFormaPgto();
         Self.paineisFormaPgto( '' );

         break;
      end;
   end;
end;

procedure TfrmCompromissoCadastro.sbAnexarClick(Sender: TObject);
var
   Stream: TStream;
begin
   Application.CreateForm(TfDigitalizaDoc, fDigitalizaDoc);
   try
      if fDigitalizaDoc.ShowModal = mrOk then
      begin
         qryAnexosParc.Insert;
         qryAnexosParcCD_TITULO.AsString :=
            objParcelaSelecionada.getValorCampo('cd_titulo');
         qryAnexosParcCD_COLIGADA.AsString :=
            objParcelaSelecionada.getValorCampo('cd_coligada');
         Stream := qryAnexosParc.CreateBlobStream(qryAnexosParcBB_ANEXO, bmWrite);
         try
            if fDigitalizaDoc.pgcOpcoes.ActivePageIndex = 0 then
            begin
               fDigitalizaDoc.cimImagem.GetRegion.SaveToStream(Stream);
               qryAnexosParcBB_ANEXO.LoadFromStream(Stream);
            end
            else if fDigitalizaDoc.pgcOpcoes.ActivePageIndex = 1 then
            begin
               qryAnexosParcBB_ANEXO.LoadFromFile(fDigitalizaDoc.PDFPath);
            end;
         finally
            Stream.Free;
         end;
         qryAnexosParcDS_EXTENSAO.AsString:= fDigitalizaDoc.extensao;
         qryAnexosParc.Post;
         qryAnexosParc.Refresh;

         if not sbDelAnexo.Enabled then
         begin
            sbDelAnexo.Enabled := True;
         end;
      end;
   finally
      fDigitalizaDoc.Free;
   end;
end;

procedure TfrmCompromissoCadastro.sbCadastrarHistoricoClick(Sender: TObject);
begin
   Application.CreateForm( TfrmCompromissoHistorico, frmCompromissoHistorico );
   frmCompromissoHistorico.ShowModal;

   atualizaListaHistorico();
end;

procedure TfrmCompromissoCadastro.sbCriterioApagarClick(Sender: TObject);
begin
   if ListaApropriacoes.Count > 0 then
   begin
      if Mensagem( 'Deseja apagar o critério selecionado?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
      begin
         ListaApropriacoes.Remove(ListaApropriacoes.Items[cd_apropriacao_selecionada]);
         Self.carregaApropriacaoGrid();
      end;
   end;
end;

procedure TfrmCompromissoCadastro.sbCriterioEditarClick(Sender: TObject);
begin
   sgGridApropriacoes.OnDblClick( nil );
end;

procedure TfrmCompromissoCadastro.sbCriterioInserirClick(Sender: TObject);
var
   cd_titulo : string;
begin
   Application.CreateForm( TfrmApropriaAltera, frmApropriaAltera );
   frmApropriaAltera.ListaApropriacoes := Self.ListaApropriacoes;
   frmApropriaAltera.setFormEstado('inserir');

   cd_titulo := Self.getCodigoCompromissoPrincipal();

   if cd_titulo <> '' then
   begin
      frmApropriaAltera.setCdTitulo( cd_titulo );
   end;

   //envia a conta padrão para a telinha selecionar
   if trim(txtCdConta.Text) <> '' then
   begin
      frmApropriaAltera.setContaSelecionada( txtCdConta.text );
   end;

   frmApropriaAltera.cd_coligada_seleciona := Self.cd_coligada_seleciona;

   frmApropriaAltera.ShowModal();

   Self.carregaApropriacaoGrid();
end;

procedure TfrmCompromissoCadastro.sbDelAnexoClick(Sender: TObject);
const
   SConfirmaExclusao = 'Deseja realmente remover o anexo da parcela?';
begin
   if MessageDlg(SConfirmaExclusao, mtConfirmation, [mbYes, mbNo], -1) = mrYes then
   begin
      qryAnexosParc.Delete;
      qryAnexosParc.Refresh;
      sbDelAnexo.Enabled := not qryAnexosParc.IsEmpty;
   end;
end;

procedure TfrmCompromissoCadastro.sbExcluirContaClick(Sender: TObject);
var
   indexItem           : integer;
   objItem             : TItemPessoaConta;
   mensagemConfirmacao : string;
   qyBancoCentro       : TUMZQuery;
begin
   indexItem := cmbDadosBancoAgencia.itemIndex;

   // Exclui somente as informações de conta, tratamento para não excluir a opção Adicionar
   if indexItem > 0 then begin
      objItem := (cmbDadosBancoAgencia.Items.Objects[indexItem] as TItemPessoaConta);

      // Verifica se usuário tem certeza que deseja remover a opção selecionada
      mensagemConfirmacao := 'Você irá remover as informações dessa conta.' + chr(13) + 'Deseja continuar?';

      if Mensagem( mensagemConfirmacao, 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then begin

         // Remove do banco de dados a opção selecionada
         DM.CriarConsulta( qyBancoCentro );

         qyBancoCentro.Close();
         qyBancoCentro.SQL.Clear;
         qyBancoCentro.SQL.Add('DELETE FROM fin_pessoas_contas WHERE ');
         qyBancoCentro.SQL.Add('cd_pessoa = '  + objItem.getCdPessoa  + ' AND ');
         qyBancoCentro.SQL.Add('nr_conta = '   + QuotedStr(objItem.getNrConta) + ' AND ');
         qyBancoCentro.SQL.Add('nr_agencia = ' + QuotedStr(objItem.getNrAgencia) + ' AND ');
         qyBancoCentro.SQL.Add('nr_banco = '   + QuotedStr(objItem.getNrBanco));
         qyBancoCentro.ExecSQL;

         FreeAndNil( qyBancoCentro );

         // Remove da combobox o objeto com as informações da conta
         cmbDadosBancoAgencia.DeleteSelected;

         // Limpa as caixas de texto ao lado da combobox
         txtParCCBanco.Text := '';
         txtParCCAgencia.Text := '';
         txtParCCDigAgencia.Text := '';
         txtParCCContaCorrente.Text := '';
         txtParCCDigContaCorrente.Text := '';
         txtParCCDifAgenciaConta.Text := '';

         cmbDadosBancoAgencia.ItemIndex := 0;
         escritaBotoesDadosAgencia(False);

         // Remove o objeto com as informações da conta
         objItem.Free;

      end;

   end else begin
      Mensagem('Selecione uma conta para remover.', 'Atenção', MB_OK + MB_ICONWARNING);
   end;

end;

procedure TfrmCompromissoCadastro.sbFornecedorClick(Sender: TObject);
var
   bAutorizado    : boolean;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   bAutorizado    := false;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

   if resultado_filtro.filtrado then
   begin

      //atribui o retorno aos campos
      if  (resultado_filtro.cd_pessoa <> 0) and (resultado_filtro.nm_pessoa <> '')  then
      begin

         if bAlteraFornecedor = false  then
         begin

            if getFormEstado() = 'alterar' then
            begin
               bAutorizado := StrToBool(objParcelaSelecionada.getValorCampo('cd_autoriza'));
            end;

            if bAutorizado = true then
            begin
               if IntToStr(resultado_filtro.cd_pessoa) <> txtCdFornecedor.Text then
               begin
                  if Mensagem('Você está tentando alterar o plano de contas do compromisso'+
                  ' já Autorizado pelo Diretor. Se você continuar o Diretor deverá' +
                  ' efetuar uma nova autorização. Deseja continuar mesmo assim?',
                  'Atenção', MB_YESNO + MB_ICONINFORMATION ) = MrYes
                  then
                  begin
                     bAlteraFornecedor          := true;
                     txtCdFornecedor.Text       := IntToStr( resultado_filtro.cd_pessoa );
                     lbNomeFornecedor.Caption   := resultado_filtro.nm_pessoa;
                     Self.setCdFornecedor( IntToStr( resultado_filtro.cd_pessoa ) );

                     //selecionar a conta padrão do fornecedor
                     txtCdConta.Text :=  Self.getPlanoContaPadraoFornecedor( IntToStr( resultado_filtro.cd_pessoa ) );

                     if trim(txtCdConta.Text) = '' then
                     begin
                        txtCdConta.Text := cd_plano_contas_inicial;
                     end;

                     if trim(txtCdConta.Text) <> '' then
                     begin
                        txtCdConta.OnExit( nil );
                     end
                     else
                     begin
                       txtCdConta.Text          := '';
                       cmbPlanoContas.ItemIndex := -1;
                       txtDsHistorico.Text      := '';
                     end;
                  end
                  else
                  begin
                     bAlteraFornecedor := false;
                  end;
               end;
            end
            else
            begin
               txtCdFornecedor.Text       := IntToStr( resultado_filtro.cd_pessoa );
               lbNomeFornecedor.Caption   := resultado_filtro.nm_pessoa;
               Self.setCdFornecedor( IntToStr( resultado_filtro.cd_pessoa ) );

               //selecionar a conta padrão do fornecedor
               txtCdConta.Text :=  Self.getPlanoContaPadraoFornecedor( IntToStr( resultado_filtro.cd_pessoa ) );

               if trim(txtCdConta.Text) = '' then
               begin
                  txtCdConta.Text := cd_plano_contas_inicial;
               end;

               if trim(txtCdConta.Text) <> '' then
               begin
                  txtCdConta.OnExit( nil );
               end
               else
               begin
                 txtCdConta.Text          := '';
                 cmbPlanoContas.ItemIndex := -1;
                 txtDsHistorico.Text      := '';
               end;
            end;
         end;

         //verifica se o código selecionado é de um professor
         if ehProfessor( Self.getCdFornecedor() ) then
         begin
            sn_professor := true;
         end
         else
         begin
            sn_professor := false;
         end;
      end;

   end;


   verificaPodeBaixarComp;

end;

{Busca de plano de contas}
procedure TfrmCompromissoCadastro.sbPlanoContasClick(Sender: TObject);
var
   cd_plano_conta : integer;
   ds_plano_conta : string;
   i              : integer;
begin
   cd_plano_conta := 0;
   ds_plano_conta := '';
   cd_apropriacao_selecionada := 0;
   frm_SelConta.filtroContas := tpcSaidas;
   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch then
   begin
      cd_plano_conta := frm_SelConta.qyPlanosContas.FieldByName('cd_conta').AsInteger;
      ds_plano_conta := frm_SelConta.qyPlanosContas.FieldByName('ds_conta').AsString;
   end;

   if  (cd_plano_conta <> 0) and (ds_plano_conta <> '')  then
   begin

      for i := 0 to cmbPlanoContas.Items.Count - 1 do
      begin
         if ( (cmbPlanoContas.Items.Objects[i] as TItemCompromisso).getCodigo = IntToStr(cd_plano_conta) ) then
         begin
            cmbPlanoContas.ItemIndex   := i;
            
            //executa a rotina para preencher o campo historico com o plano de contas se estiver vazio
            cmbPlanoContas.OnChange(nil);
            break;
         end;
      end;
   end;

   verificaPodeBaixarComp;

end;

procedure TfrmCompromissoCadastro.sbTurmaProfessorClick(Sender: TObject);
var
   DadosDisc: TStringList;
begin

   // Conferir Bloqueio de Alterações por data
   if DM.EstaBloqueado(frm_Compromisso_Planilha.qryContasPagardt_vencimento.AsDateTime, True) then Exit;

   if trim(txtCdFornecedor.Text) <> '' then
   begin
      if sn_professor = true then
      begin
         Application.CreateForm(TfrmDespesaProfessor, frmDespesaProfessor);
         frmDespesaProfessor.setCdPessoa( Self.getCdFornecedor() );

         frmDespesaProfessor.setTurmaDisciplina( Concat(Self.getCdTurma(),
         ';',
         Self.getCdDisciplina()));

         frmDespesaProfessor.meAnoSemestre.Text := Self.getNrAnosemestre();

         frmDespesaProfessor.ShowModal;
      end
      else
      begin
         DadosDisc := TStringList.Create;
         if TfBuscaDisciplina.getFiltroDisciplina(Self, DadosDisc) then
         begin
            setCdTurmaDiscAnoSem(
               DadosDisc.Values[FILTRO_TURMA],
               DadosDisc.Values[FILTRO_DISCI],
               DadosDisc.Values[FILTRO_ANOSEM]);

            Self.alterou_turma := True;   

            txtTurmaProfessor.Text :=
               DadosDisc.Values[FILTRO_TURMA] + ' - ' +
               DadosDisc.Values[FILTRO_NOMEDISC];
         end;
      end;
   end
   else
   begin
      btnConfirmar.Enabled := false;
      Mensagem('Selecione o Fornecedor.', 'Atenção', MB_OK + MB_ICONERROR);
      sbFornecedorClick( nil );
   end;
end;

procedure TfrmCompromissoCadastro.selecionaApropriacao( cd_titulo_principal: string; cd_coligada: string; cd_conta:string; cd_centro: string );
var
   i : integer;
begin
   for i := 0 to ListaApropriacoes.Count -1 do
   begin
      if  ((ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_titulo')   = cd_titulo_principal)
      and ((ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_coligada') = cd_coligada)
      and ((ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_conta')    = cd_conta)
      and ((ListaApropriacoes.Items[i] as TFinApropriaCP).getValorCampo('cd_centro')   = cd_centro) then
      begin
         cd_apropriacao_selecionada       := i;
         break;
      end;
   end;
end;

procedure TfrmCompromissoCadastro.selecionaParcela(nr_parcela: integer);
var
   i : integer;
begin
   for i := 0 to ListaParcelas.Count -1 do
   begin
      if  (StrToInt((ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('nr_parcela'))  = nr_parcela) then
      begin
         Self.objParcelaSelecionada       := (ListaParcelas.Items[i] as TFinContasPagar);

         if txtComplementoHistorico.Visible = true then
         begin
            txtComplementoHistorico.Text := objParcelaSelecionada.getValorCampo('complemento_historico');
         end;

         //seleciona a cópia somente se estiver no modo de alteração, senão
         //a mesma não existe.
         if Self.getFormEstado() = 'alterar' then
         begin
            Self.objParcelaCopiaSelecionada  := (ListaCopiaParcelas.Items[i] as TFinContasPagar);

            if txtComplementoHistorico.Visible = true then
            begin
               txtComplementoHistorico.Text := objParcelaCopiaSelecionada.getValorCampo('complemento_historico');
            end;

         end;

         break;
      end;
   end;

   if Self.getFormEstado() = 'alterar' then                     
   begin
      //bloqueia alteração caso exista uma data de pagamento
      if objParcelaSelecionada.getValorCampo('dt_pagamento') <> '' then
      begin
         Self.BloquearAlteracaoParcela( false );
      end
      else
      begin
         Self.BloquearAlteracaoParcela( true );
      end;
   end;

end;

procedure TfrmCompromissoCadastro.selecionaParcelaGrid;
var
   i           : integer;
   nr_parcela  : integer;
begin
   nr_parcela := 0;

   if objParcelaSelecionada <> nil then
   begin
      nr_parcela := StrToInt(objParcelaSelecionada.getValorCampo('nr_parcela'));
   end;

   if ListaParcelas.Count > 1 then
   begin
      for i := 0 to ListaParcelas.Count -1 do
      begin
         if  (StrToInt((ListaParcelas.Items[i] as TFinContasPagar).getValorCampo('nr_parcela'))  = nr_parcela) then
         begin
            Self.selecionaParcela( nr_parcela );
            Self.carregaCamposParcelaSelecionada();
            sgParcelas.Row := i+1;
            break;
         end;
      end;
   end;
end;

procedure TfrmCompromissoCadastro.SelecionaPlanoConta(cd_conta: string);
var
   i              : integer;
   cd_conta_lista : string;
   bEncontrou     : boolean;
begin
   bEncontrou := false;
   if trim(cd_conta) <> '' then
   begin
      for i := 0 to cmbPlanoContas.Items.Count - 1 do
      begin
         cd_conta_lista := (cmbPlanoContas.Items.Objects[ i ] as TItemCompromisso).getCodigo();

         if cd_conta_lista = cd_conta then
         begin
            cmbPlanoContas.ItemIndex := i;
            cmbPlanoContas.OnChange( nil );
            bEncontrou := true;
            break;
         end;
      end;
   end;

   if (bEncontrou = false) and (trim(cd_conta) <> '') then
   begin
      Mensagem( 'Código inválido', 'Atenção', MB_OK + MB_ICONWARNING );
      cmbPlanoContas.ItemIndex := -1;
      txtDsHistorico.Text := '';
   end;
   
end;

procedure TfrmCompromissoCadastro.setNrParcela(codigo: string);
begin
   Self.nr_parcela := codigo;
end;

procedure TfrmCompromissoCadastro.setCdFornecedor(valor: string);
begin
   Self.cd_fornecedor := valor;
end;

procedure TfrmCompromissoCadastro.setCdTurmaDiscAnoSem(vl_turma, vl_disciplina,
  vl_anosemestre: string);
begin
   Self.cd_turma        := vl_turma;
   Self.cd_disciplina   := vl_disciplina;
   Self.nr_anosemestre  := vl_anosemestre;
end;

procedure TfrmCompromissoCadastro.setCodigoCompromisso(codigo: string);
begin
   Self.cd_compromisso := codigo;
end;

procedure TfrmCompromissoCadastro.setCodigoCompromissoPrincipal(codigo: string);
begin
   Self.cd_compromisso_principal := codigo;
end;

procedure TfrmCompromissoCadastro.setDataHoje(data: TDateTime);
begin
   Self.data_hoje := data;
end;

procedure TfrmCompromissoCadastro.txtCdContaExit(Sender: TObject);
begin
   Self.SelecionaPlanoConta( txtCdConta.Text );
end;

procedure TfrmCompromissoCadastro.txtCdContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtCdFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtComplementoHistoricoExit(Sender: TObject);
begin
   if objParcelaCopiaSelecionada <> nil then
   begin
      objParcelaCopiaSelecionada.setValorCampo( 'complemento_historico', txtComplementoHistorico.Text );
   end;
end;

procedure TfrmCompromissoCadastro.txtDsHistoricoExit(Sender: TObject);
begin
   if Self.getFormEstado() = 'alterar' then
   begin
      objParcelaSelecionada.setValorCampo('ds_historico', txtDsHistorico.Text );
   end;
end;

procedure TfrmCompromissoCadastro.txtDsHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtDtCompetencia1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtDtCompetenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtDtEmissaoExit(Sender: TObject);
begin
   if(qryColigadassn_bloquear_boleto.AsInteger = 1) then
   begin
      if(DM.convertDateTimeToDate(qryColigadasdt_bloqueio_boleto.AsDateTime) > StrToDate(txtDtEmissao.Text)) then
      begin

         Mensagem('Você deve preencher uma data de emissão do boleto superior a data do bloqueio financeiro.','Aviso',MB_OK + MB_ICONWARNING);
         txtDtEmissao.Text := DateTimeToStr(qryColigadasdt_bloqueio_boleto.AsDateTime);
      end;
   end;
end;

procedure TfrmCompromissoCadastro.txtDtEmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtDtPrimeiroVencimentoExit(Sender: TObject);
begin
  if not (Self.getTotalParcelas() > '1') AND (txtParvlNota.Text > '0.00')  AND
      ( objParcelaSelecionada.getValorCampo('dt_vencimento') <> txtParVencimento.Text ) AND
      ( txtDtPrimeiroVencimento.Text <> txtParVencimento.Text ) then
   begin
      txtParVencimento.Text := txtDtPrimeiroVencimento.Text;
   end;

   if(qryColigadassn_bloquear_financeiro.AsInteger = 1) then
   begin
      if(DM.convertDateTimeToDate(qryColigadasdt_bloqueio_financeiro.AsDateTime) > StrToDate(txtDtPrimeiroVencimento.Text)) then
      begin
         Mensagem('Você deve preencher uma data de primeiro vencimento do boleto superior a data do bloqueio financeiro.','Aviso',MB_OK + MB_ICONWARNING);
         txtDtPrimeiroVencimento.Text := DateTimeToStr(qryColigadasdt_bloqueio_financeiro.AsDateTime);
      end;
   end;
end;

procedure TfrmCompromissoCadastro.txtDtPrimeiroVencimentoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtGrupo8Exit(Sender: TObject);
begin
   txtParBoletoCodigoBarrasArrecadacao.Text := '';
   Self.MontaCodigoArrecadacao();
end;

procedure TfrmCompromissoCadastro.txtLinhaDigitavelGrupo8Exit(Sender: TObject);
begin
   txtParBoletoCodigoBarras.Text := '';
   Self.processaCampoCodigoBarras();
end;

procedure TfrmCompromissoCadastro.txtNrDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasArrecadacaoChange(
  Sender: TObject);
begin
   txtParBoletoCodigoBarrasArrecadacao.Text :=
      General.StripNonNumeric(txtParBoletoCodigoBarrasArrecadacao.Text);
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasArrecadacaoEnter(
  Sender: TObject);
begin
    self.TabStop := False;
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasArrecadacaoExit(
  Sender: TObject);
begin
   Self.limpaLinhaDigitavelArrecadacao();

   if Length(txtParBoletoCodigoBarrasArrecadacao.Text) in [44, 48] then
   begin
      Self.MontaLinhaDigitavelArrecadacao();
   end;
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasArrecadacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      Self.limpaLinhaDigitavelArrecadacao();

      if Length(txtParBoletoCodigoBarrasArrecadacao.Text) = iTamCodigoBarrasArrecadacao then
      begin
         Self.MontaLinhaDigitavelArrecadacao();
      end;

      key := #0;
      SelectNext(Sender As TWinControl, True, True );
   end;
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasChange(
  Sender: TObject);
begin
   txtParBoletoCodigoBarras.Text :=
      General.StripNonNumeric(txtParBoletoCodigoBarras.Text);
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasExit(Sender: TObject);
begin
   self.limpaLinhaDigitavel();
   self.processaCampoCodigoBarras();
end;

procedure TfrmCompromissoCadastro.txtParBoletoCodigoBarrasKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      Self.limpaLinhaDigitavel();
      Self.processaCampoCodigoBarras();
      key := #0;
      SelectNext(Sender As TWinControl, True, True );
   end;
end;

procedure TfrmCompromissoCadastro.txtParCCAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      key := #0;
      SelectNext(Sender As TWinControl, True, True );
   end;

   // apenas números
   if not (Key in['0'..'9',Chr(8)]) then
   begin
      Key:= #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParCCBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      key := #0;
      SelectNext(Sender As TWinControl, True, True );
   end;

   // apenas números
   if not (Key in['0'..'9',Chr(8)]) then
   begin
      Key:= #0;
   end;

end;

procedure TfrmCompromissoCadastro.txtParCCContaCorrenteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      key := #0;
      SelectNext(Sender As TWinControl, True, True );
   end;

   // apenas números
   if not (Key in['0'..'9',Chr(8)]) then
   begin
      Key:= #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParCCDifAgenciaContaKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParCCDigAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParCCDigContaCorrenteKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParCdTituloKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParDarfCodigoReceitaTributoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParDarfNrReferenciaKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParGpsCodigoReceitaTributoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParHistoricoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   bAutorizado : boolean;
begin
   if Self.getFormEstado() = 'alterar' then
   begin

      if bAlteraHistorico = false  then
      begin
         bAutorizado := StrToBool(objParcelaSelecionada.getValorCampo('cd_autoriza'));

         if bAutorizado = true then
         begin

            if objParcelaSelecionada.getValorCampo('ds_despesa') <>
            txtParHistorico.Text then
            begin
               if Mensagem('Você está tentando alterar um histórico de compromisso'+
               ' já Autorizado pelo Diretor. Se você continuar o Diretor deverá' +
               ' efetuar uma nova autorização. Deseja continuar mesmo assim?',
               'Atenção', MB_YESNO + MB_ICONINFORMATION ) = mryes
               then
               begin
                  objParcelaSelecionada.setValorCampo('ds_despesa', txtDsHistorico.Text );
                  objParcelaSelecionada.setValorCampo('cd_autoriza', '0');
                  bAlteraHistorico := true;
               end
               else
               begin
                  bAlteraHistorico := false;
                  objParcelaSelecionada.setValorCampo('ds_despesa', objParcelaCopiaSelecionada.getValorCampo('ds_despesa') );
                  txtParHistorico.Text := objParcelaCopiaSelecionada.getValorCampo('ds_despesa');
               end;
            end;
         end;
      end;
   end;
end;

procedure TfrmCompromissoCadastro.txtParProvavelPgtoExit(Sender: TObject);
var
   data_selecionada : string;
begin
   data_selecionada := txtParProvavelPgto.text;

   if trim(data_selecionada) <> '' then
   begin
      objParcelaSelecionada.setValorCampo('dt_provavel_pgto', Self.getDataFormatada( 'yyyy-mm-dd', data_selecionada) );
   end;

   if Self.getSnVarParcelas() = true then
   begin
      Self.carregaParcelasGrid();
   end;

end;

procedure TfrmCompromissoCadastro.txtParProvavelPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtParValorAbatimentoExit(Sender: TObject);
begin
   atualizaValorPagar();
end;

procedure TfrmCompromissoCadastro.txtParValorDescontoExit(Sender: TObject);
begin
   atualizaValorPagar();
end;

procedure TfrmCompromissoCadastro.txtParValorMoraExit(Sender: TObject);
begin
   atualizaValorPagar();
end;

procedure TfrmCompromissoCadastro.txtParValorMultaExit(Sender: TObject);
begin
   atualizaValorPagar();
end;

procedure TfrmCompromissoCadastro.txtParVencimentoExit(Sender: TObject);
var
   dt_vencimento     : string;
   dt_provavel_pgto  : string;
begin
   dt_vencimento     := txtParVencimento.text;

   if trim(dt_vencimento) <> '' then
   begin
      txtParProvavelPgto.text := txtParVencimento.text;
      dt_provavel_pgto        := txtParProvavelPgto.text;

      objParcelaSelecionada.setValorCampo('dt_vencimento', Self.getDataFormatada( 'yyyy-mm-dd',    dt_vencimento) );
      objParcelaSelecionada.setValorCampo('dt_provavel_pgto', Self.getDataFormatada( 'yyyy-mm-dd', dt_provavel_pgto) );
   end;

   if Self.getSnVarParcelas() = true then
   begin
      Self.carregaParcelasGrid();
   end;

   if not (Self.getTotalParcelas() > '1')  AND ( txtDtPrimeiroVencimento.Text <> txtParVencimento.Text ) then
   begin
      txtDtPrimeiroVencimento.Text := txtParVencimento.Text;
   end;

end;

procedure TfrmCompromissoCadastro.txtVlNotaExit(Sender: TObject);
begin
   if Self.getFormEstado() = 'inserir' then
   begin
      Self.processaParcela();

      if ListaParcelas = nil then
      begin
         txtVlNota.SetFocus();
      end;
   end;


   if not (Self.getTotalParcelas() > '1') AND (txtParvlNota.Text > '0.00')  AND
      not valoresIguais( objParcelaSelecionada.getValorCampo('vl_total_despesa'), txtVlNota.Text ) AND
      not valoresIguais( txtVlNota.Text, txtParvlNota.Text ) then
   begin
      txtParvlNota.setValorString(txtVlNota.Text);
   end;

   if Self.verificaValoresApropriados = false then
   begin
      Mensagem('Você alterou o valor deste compromisso, selecione novamente a forma de apropriação dos valores no Centro de Custos.', 'Atenção', MB_OK + MB_ICONWARNING);
   end;

   verificaPodeBaixarComp;
   atualizaValorPagar();
end;

procedure TfrmCompromissoCadastro.txtVlNotaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   bAutorizado       : boolean;
begin

   if Self.getFormEstado() = 'alterar' then
   begin
      if objParcelaSelecionada.getValorCampo('dt_pagamento') = '' then
      begin
         if bAlteraValor = false  then
         begin
            bAutorizado := StrToBool(objParcelaSelecionada.getValorCampo('cd_autoriza'));

            if bAutorizado = true then
            begin
               if not valoresIguais( objParcelaSelecionada.getValorCampo('vl_total_despesa'), txtVlNota.Text ) then
               begin
                  if Mensagem('Você está tentando alterar um histórico de compromisso'+
                  ' já Autorizado pelo Diretor. Se você continuar o Diretor deverá' +
                  ' efetuar uma nova autorização. Deseja continuar mesmo assim?',
                  'Atenção', MB_YESNO + MB_ICONINFORMATION ) = mryes
                  then
                  begin
                     objParcelaSelecionada.setValorCampo('vl_total_despesa', txtVlNota.getValorString() );
                     objParcelaSelecionada.setValorCampo('cd_autoriza', '0');
                     bAlteraValor := true;
                  end
                  else
                  begin
                     bAlteraValor := false;
                     objParcelaSelecionada.setValorCampo('vl_total_despesa', objParcelaCopiaSelecionada.getValorCampo('vl_total_despesa') );
                     txtVlNota.setValorString( objParcelaCopiaSelecionada.getValorCampo('vl_total_despesa') );
                  end;
               end;
            end;
         end;
      end;
   end;

end;

procedure TfrmCompromissoCadastro.cmbCaixaChange(Sender: TObject);
var
   cd_caixa : string;
begin
   cd_caixa := '';

   if cmbCaixa.ItemIndex > -1 then
   begin
      cd_caixa := (cmbCaixa.Items.Objects[ cmbCaixa.itemIndex ] as TItemCompromisso).getCodigo();

      objParcelaSelecionada.setValorCampo('cd_caixa', cd_caixa);

      Self.ProcessaCamposFormaPgtoCaixa();
   end;

   if Self.getSnVarParcelas() = true then
   begin
      Self.carregaParcelasGrid();
   end;

   verificaPodeBaixarComp;
end;

procedure TfrmCompromissoCadastro.cmbCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.txtQtdeParcelasExit(Sender: TObject);
begin
   if Self.getFormEstado() = 'inserir' then
   begin
      Self.processaParcela();

      if ListaParcelas = nil then
      begin
         txtQtdeParcelas.SetFocus();
      end;
   end;

   //atualiza apropriacao se houver
   if cmbCriterioApropriacao.ItemIndex > -1 then
   begin
      cmbCriterioApropriacao.OnChange(nil);
   end;

   verificaPodeBaixarComp;
end;

procedure TfrmCompromissoCadastro.txtQtdeParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

function TfrmCompromissoCadastro.validaFormasPgto(): boolean;
var
   sFormaPgtoSelecionada   : string;
   nr_banco                : string;
   nr_agencia              : string;
   nr_conta                : string;
   cd_pessoa               : string;
   nr_dig_agencia          : string;
   nr_dig_conta            : string;
   nr_dif_ag_conta         : string;
   qyDadosBanco            : TUMZQuery;
   retorno                 : Boolean;
begin
   cd_pessoa   := Self.getCdFornecedor();
   retorno     := true;

   //verifica se foi selecionado uma forma de pagamento
   if cmbFormaPgto.ItemIndex > -1 then
   begin
      //recupera a chave da forma de pagamento.
      sFormaPgtoSelecionada   := (cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex ] as TItemCompromissoFormaPgto).getChave;
   end;

   //faz o tratamento das informações de acordo com a forma de pagamento
   if sFormaPgtoSelecionada <> '' then
   begin
      if  sFormaPgtoSelecionada = '[BOLETO]' then
      begin
         //sem validacao
      end;

      if  sFormaPgtoSelecionada = '[ARRECADACAO]' then
      begin
         //sem validacao
      end;

      if  sFormaPgtoSelecionada = '[CREDITO_CC]' then
      begin
         nr_banco    := trim(txtParCCBanco.Text);
         nr_agencia  := trim(txtParCCAgencia.Text);
         nr_conta    := trim(txtParCCContaCorrente.Text);

         if (nr_banco <> '') and (nr_agencia <> '') and (nr_conta <> '') and (cmbDadosBancoAgencia.ItemIndex = 0) then
         begin

            nr_dig_agencia  := trim(txtParCCDigAgencia.Text);
            nr_dig_conta    := trim(txtParCCDigContaCorrente.Text);
            nr_dif_ag_conta := trim(txtParCCDifAgenciaConta.Text);

            //cria a consulta
            DM.CriarConsulta( qyDadosBanco );

            try
               qyDadosBanco.Close();
               qyDadosBanco.SQL.Clear;
               qyDadosBanco.SQL.Add('INSERT INTO fin_pessoas_contas       ');
               qyDadosBanco.SQL.Add('( cd_pessoa, nr_banco, nr_agencia,          ');
               qyDadosBanco.SQL.Add(' nr_dig_agencia, nr_conta, nr_dig_conta,    ');
               qyDadosBanco.SQL.Add(' nr_dig_ag_conta)   ');
               qyDadosBanco.SQL.Add(' VALUES                                     ');
               qyDadosBanco.SQL.Add(' ("'+cd_pessoa+'", "'+nr_banco+'", "'+ nr_agencia + '", "'+nr_dig_agencia+'","'+nr_conta+'", "'+nr_dig_conta+'", "'+nr_dif_ag_conta+'")');
               qyDadosBanco.ExecSQL();
            except on E:EZDatabaseError do
               //se ocorrer erro de duplicidade ao incluir as informações ignora e continua gravando os dados.
            end;

            FreeAndNil( qyDadosBanco );

            retorno := true;
         end;
         //valida se os campos foram digitados
      end;

      if  sFormaPgtoSelecionada = '[DARF]' then
      begin
         //sem validacao
         retorno := true;
      end;

      if  sFormaPgtoSelecionada = '[GPS]' then
      begin
         //sem validacao
         retorno := true;
      end;
   end
   else
   begin
      retorno := true;
   end;

   Result := retorno;
end;

function TfrmCompromissoCadastro.valoresIguais( valor_compromisso: string; valor_novo: string ): boolean;
var
   objValor1   : TUMEditMonetario;
   objValor2   : TUMEditMonetario;
   bRetorno    : Boolean;
begin
   bRetorno    := false;
   objValor1   := TUMEditMonetario.Create( nil );
   objValor2   := TUMEditMonetario.Create( nil );

   valor_compromisso := substituiCaracter( valor_compromisso, '.', '' );
   valor_novo        := substituiCaracter( valor_novo, '.', '' );

   objValor1.setValorDouble( valor_compromisso );
   objValor2.setValorFormatado( valor_novo );

   if objValor1.getValorDouble = objValor2.getValorDouble then
   begin
      bRetorno := true;
   end;

   FreeAndNil( objValor1 );
   FreeAndNil( objValor2 );

   Result := bRetorno;
end;

procedure TfrmCompromissoCadastro.verificaPodeBaixarComp;

CONST
   SQL_CAIXAS = ''+
   'SELECT '+
   '  c.*, t.ds_tipo '+
   'FROM '+
   '  fin_cadastro_contas c, '+
   '  fin_cadastro_contas_tipos t '+
   'WHERE '+
   '  t.cd_tipo = c.tp_conta AND '+
   '  c.cd_caixa = :cd_caixa  ';

   SQL_CONTROLE = ''+
   'SELECT '+
	'  * ' +
   'FROM  '+
   '  fin_controle_caixa '+
   'WHERE '+
	'  ds_situacao = "A" '+
   'ORDER BY '+
   '  cd_conta_banco ';        
var
   msgCampos: String;
   cd_caixa_sel: Integer;
   qryCaixa: TUMZQuery;
   qryControle: TUMZQuery;
begin

   msgCampos := '';

   if cmbformapgto.ItemIndex = -1 then
   begin
      msgCampos := msgCampos + chr(13) + 'Você precisa selecionar uma forma de pagamento!';   
   end;

   if cmbCaixa.ItemIndex > -1 then
   begin
      cd_caixa_sel := StrToInt((cmbCaixa.Items.Objects[ cmbCaixa.itemIndex ] as TItemCompromisso).getCodigo());

      dm.CriarConsulta(qryCaixa);
      dm.CriarConsulta(qryControle);

      qryCaixa.SQL.Text := SQL_CAIXAS;

      qryCaixa.ParamByName('cd_caixa').asInteger := cd_caixa_sel;

      qryCaixa.Open;

      qryControle.SQL.Text := SQL_CONTROLE;
      qryControle.Open;

      if qryCaixa.FieldByName('sn_ativa').AsString = 'N' then
      begin
         msgCampos := msgCampos + chr(13) + 'Você precisa selecionar uma conta/caixa que esteja Aberto em Pagar com a Conta!';
      end
      else
      begin
         if qryCaixa.FieldByName('tp_conta').AsInteger = 3 then
         begin
            qryControle.Locate('cd_conta_banco', qryCaixa.FieldByNAme('cd_caixa').AsString , []);

            if not(qryControle.FieldByName('cd_conta_banco').AsString = qryCaixa.FieldByNAme('cd_caixa').AsString) then
            begin
               msgCampos := msgCampos + chr(13) + 'Você precisa selecionar uma conta/caixa que esteja Aberto em Pagar com a Conta!';
            end;
         end;
      end;
   end
   else
   begin
      msgCampos := msgCampos + chr(13) + 'Você precisa selecionar uma conta!';
   end;

   if ((objCentroSelecionado = nil) and ((cmbCriterioApropriacao.ItemIndex = -1) or (cmbCriterioApropriacao.ItemIndex = 0))) then
   begin
      msgCampos := msgCampos + chr(13) + 'Você precisa selecionar um centro de custo!';
   end;

   if cmbPlanoContas.ItemIndex = -1 then
   begin
      msgCampos := msgCampos + chr(13) + 'Você precisa selecionar um plano de contas!';
   end;

   if self.getTotalParcelas <> '1' then
   begin
      msgCampos := msgCampos + chr(13) + 'Você só pode baixar um compromisso se ele tiver uma única parcela!';
   end;

   if txtparvlnota.getValor < 0 then
   begin
      msgCampos := msgCampos + chr(13) + 'Você precisa informar um valor!';
   end;

   if txtParProvavelPgto.Text = '' then
   begin
      msgCampos := msgCampos + chr(13) + 'Você precisa informar uma data de provavel pagamento!';
   end;

   if (msgcampos <> '') then
   begin
      cbBaixar.ShowHint := True;
      cbBaixar.Hint := 'Por favor resolva a(s) seguinte(s) pendencia(s) antes de marcar a opção de baixa:' + chr(13) + msgCampos;

      cbbaixar.Checked := False;
      cbbaixar.Tag := 1;
   end
   else
   begin
      cbBaixar.ShowHint := False;
      cbBaixar.Hint := '';

      cbbaixar.Tag := 0;
   end;

   if (Self.getFormEstado <> 'inserir') then
   begin
      cbBaixar.ShowHint := True;
      cbBaixar.Hint := 'Você só pode utilizar esta opção ao inserir um compromisso!';

      cbbaixar.Checked := False;
      cbbaixar.Tag := 1;
   end;

   try

      if StrToInt(self.getTotalParcelas) > 1  then
      begin
         cbBaixar.Checked := False;
         cbBaixar.Visible := False;
      end
      else
      begin
         cbBaixar.Visible := True;
      end;

   except

   end;

   if ((not DM.UsuarioLogado.TemPermissao( 2038, npAcesso, False ))
      OR (not DM.UsuarioLogado.TemPermissao( 2046, npAcesso, False ))) then
   begin
      cbBaixar.Checked := False;
      cbBaixar.Visible := False;
   end;
   
end;

procedure TfrmCompromissoCadastro.cmbCentroCustoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.cmbCriterioApropriacaoChange(Sender: TObject);
var
   cd_apropriacao : integer;
begin
   if cmbCriterioApropriacao.ItemIndex > 1 then
   begin
      objCentroSelecionado := nil;
      painelApropriacao(true);

      //recupera o código do critério selecionado
      cd_apropriacao             := StrToInt( (cmbCriterioApropriacao.Items.Objects[ cmbCriterioApropriacao.itemIndex ] as TItemCompromisso).getCodigo() );

      //monta a apropriação de acordo com o critério selecionado
      Self.MontaObjetosApropriacoes( cd_apropriacao );

      //carrega as informações na grid
      Self.carregaApropriacaoGrid();

      if (cmbCriterioApropriacao.ItemIndex = -1) or (cmbCriterioApropriacao.ItemIndex = 0) then
      begin
          ListaApropriacoes.Clear;
      end;

   end
   else if cmbCriterioApropriacao.ItemIndex = 1 then
   begin
      if ListaApropriacoes = nil then
      begin
         ListaApropriacoes := TObjectList.Create();
      end;
      
      Self.limpaGridApropriacoes();
      Self.carregaApropriacaoGrid();

      objCentroSelecionado := nil;
      painelApropriacao(true);
      painelApropriacaoBloqueio();

   end
   else
   begin
      if ListaApropriacoes <> nil then
      begin
         ListaApropriacoes.Clear;
         ListaApropriacoes := nil;
      end;
      
      painelApropriacao(false);
   end;
end;

procedure TfrmCompromissoCadastro.cmbCriterioApropriacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.cmbDadosBancoAgenciaChange(Sender: TObject);
var
   nr_banco          : string;
   nr_agencia        : string;
   nr_dig_agencia    : string;
   nr_conta          : string;
   nr_dig_conta      : string;
   nr_dif_ag_conta   : string;
begin
   if cmbDadosBancoAgencia.itemIndex > 0 then
   begin
      // habilita o botão para remover informações da conta selecionada
      sbExcluirConta.Enabled := true;

      //recupera informações da opção selecionada na combo
      nr_banco          := (cmbDadosBancoAgencia.Items.Objects[ cmbDadosBancoAgencia.itemIndex ] as TItemPessoaConta).getNrBanco();
      nr_agencia        := (cmbDadosBancoAgencia.Items.Objects[ cmbDadosBancoAgencia.itemIndex ] as TItemPessoaConta).getNrAgencia();
      nr_dig_agencia    := (cmbDadosBancoAgencia.Items.Objects[ cmbDadosBancoAgencia.itemIndex ] as TItemPessoaConta).getNrDigAgencia();
      nr_conta          := (cmbDadosBancoAgencia.Items.Objects[ cmbDadosBancoAgencia.itemIndex ] as TItemPessoaConta).getNrConta();
      nr_dig_conta      := (cmbDadosBancoAgencia.Items.Objects[ cmbDadosBancoAgencia.itemIndex ] as TItemPessoaConta).getNrDigConta();
      nr_dif_ag_conta   := (cmbDadosBancoAgencia.Items.Objects[ cmbDadosBancoAgencia.itemIndex ] as TItemPessoaConta).getNrDifAgenciaConta();

      //carrega as informações da combo
      txtParCCBanco.Text            := nr_banco;
      txtParCCAgencia.Text          := nr_agencia;
      txtParCCDigAgencia.Text       := nr_dig_agencia;
      txtParCCContaCorrente.Text    := nr_conta;
      txtParCCDigContaCorrente.Text := nr_dig_conta;
      txtParCCDifAgenciaConta.Text  := nr_dif_ag_conta;

      //desabilita os componentes de texto para escrita
      Self.escritaBotoesDadosAgencia( true );

      //adiciona informações dos dados de banco e agência na parcela selecionada
      Self.objParcelaSelecionada.setValorCampo('nr_banco',        nr_banco);
      Self.objParcelaSelecionada.setValorCampo('nr_agencia',      nr_agencia);
      Self.objParcelaSelecionada.setValorCampo('nr_conta',        nr_conta);
   end
   else
   begin
      // desabilita o botão para remover informações da conta (pois está selecionado opção Adicionar...) 
      sbExcluirConta.Enabled := false;

      //carrega as informações da combo
      txtParCCBanco.Text            := '';
      txtParCCAgencia.Text          := '';
      txtParCCDigAgencia.Text       := '';
      txtParCCContaCorrente.Text    := '';
      txtParCCDigContaCorrente.Text := '';
      txtParCCDifAgenciaConta.Text  := '';

      Self.objParcelaSelecionada.setValorCampo('nr_banco',        '');
      Self.objParcelaSelecionada.setValorCampo('nr_agencia',      '');
      Self.objParcelaSelecionada.setValorCampo('nr_conta',        '');

      Self.escritaBotoesDadosAgencia( false );

      txtParCCBanco.SetFocus();
   end;
end;

procedure TfrmCompromissoCadastro.cmbDadosBancoAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.cmbFormaPgtoChange(Sender: TObject);
var
   sFormaPgtoSelecionada   : string;
   cd_forma_pgto           : string;
begin
   sFormaPgtoSelecionada   := '';
   cd_forma_pgto           := '';

   if cmbFormaPgto.ItemIndex > -1 then
   begin
      //recupera o código da forma de pagamento selecionada
      cd_forma_pgto           := (cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex  ] as TItemCompromissoFormaPgto).getCodigo();

      //recupera a chave da forma de pagamento.
      sFormaPgtoSelecionada   := (cmbFormaPgto.Items.Objects[ cmbFormaPgto.itemIndex ] as TItemCompromissoFormaPgto).getChave;

      objParcelaSelecionada.setValorCampo('cd_forma_pgto', cd_forma_pgto);

      Self.ProcessaCamposFormaPgtoCaixa();
   end;

   Self.paineisFormaPgto( sFormaPgtoSelecionada );
   Self.limpaCamposFormaPgto();
   Self.carregaCamposFormPgto( sFormaPgtoSelecionada );

   if Self.getSnVarParcelas() = true then
   begin
      Self.setTotalParcelas( Self.getTotalParcelas() );
      Self.carregaParcelasGrid();
   end;

   verificaPodeBaixarComp;
end;

procedure TfrmCompromissoCadastro.cmbFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.cmbHistoricoChange(Sender: TObject);
var
   ds_historico : string;
begin
   ds_historico := '';

   if cmbHistorico.itemIndex > 0 then
   begin
      ds_historico := (cmbHistorico.Items.Objects[ cmbHistorico.itemIndex ] as TItemCompromisso).getDescricao;

      txtDsHistorico.Text := ds_historico;
   end
   else
   begin
      txtDsHistorico.Text := '';
   end;
end;

procedure TfrmCompromissoCadastro.cmbHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.cmbPlanoContasChange(Sender: TObject);
var
   cd_conta    : string;
   i           : integer;
   bAutorizado : boolean;
begin
   bAutorizado := false;

   if cmbPlanoContas.ItemIndex > -1 then
   begin
      cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();

      if bAlteraPlanoContas = false  then
      begin

         if getFormEstado() = 'alterar' then
         begin
            bAutorizado := StrToBool(objParcelaSelecionada.getValorCampo('cd_autoriza'));
         end;

         if bAutorizado = true then
         begin
            if cd_plano_contas_inicial <> cd_conta then
            begin

            bAlteraPlanoContas := true;
            txtCdConta.text := cd_conta;

               //ao alterar o plano de conta atualiza no objeto e na grid
               if (ListaApropriacoes <> nil) and (ListaApropriacoes.Count > 1) then
               begin
                  for i := 0 to ListaApropriacoes.Count - 1 do
                  begin
                     (ListaApropriacoes.items[i] as TFinApropriaCP).setValorCampo( 'cd_conta', cd_conta );
                  end;
                  Self.carregaApropriacaoGrid();
               end;
            end;
         end
         else
         begin
            txtCdConta.text := cd_conta;
            if (bAutorizado = false) then
            begin
               txtDsHistorico.Text := getHistoricoPadrao(objParcelaSelecionada);
            end;

            //ao alterar o plano de conta atualiza no objeto e na grid
            if (ListaApropriacoes <> nil) and (ListaApropriacoes.Count > 1) then
            begin
               for i := 0 to ListaApropriacoes.Count - 1 do
               begin
                 (ListaApropriacoes.items[i] as TFinApropriaCP).setValorCampo( 'cd_conta', cd_conta );
               end;
               Self.carregaApropriacaoGrid();
            end;
         end;
         end
      else
      begin
         txtCdConta.text := cd_conta;

         //ao alterar o plano de conta atualiza no objeto e na grid
         if (ListaApropriacoes <> nil) and (ListaApropriacoes.Count > 1) then
         begin
            for i := 0 to ListaApropriacoes.Count - 1 do
            begin
               (ListaApropriacoes.items[i] as TFinApropriaCP).setValorCampo( 'cd_conta', cd_conta );
            end;
            Self.carregaApropriacaoGrid();
         end;
      end;
   end;

   if (getFormEstado() = 'inserir') then
   begin
       txtDsHistorico.Text := getHistoricoPadrao(objParcelaSelecionada);
   end;

   verificaPodeBaixarComp;
end;

procedure TfrmCompromissoCadastro.cmbPlanoContasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.cmbTipoTituloCloseUp(Sender: TObject);
begin
   verificaPodeBaixarComp;
end;

procedure TfrmCompromissoCadastro.cmbTipoTituloKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure TfrmCompromissoCadastro.dbgAnexosParcDblClick(Sender: TObject);

   function GetFileName(const Ext: string): string;
   begin
      Result := Format('%s%s%s.%s', [ExtractTempDirectory, PathDelim, CreateNewGuid, Ext]);
   end;

var
   FileExt, FileName: string;
begin
   if (dbgAnexosParc.SelectedIndex = 2) and (not qryAnexosParcBB_ANEXO.IsNull) then
   begin
      if AnsiLeftStr(qryAnexosParcBB_ANEXO.AsString, 4) = '%PDF' then
      begin
         FileExt := 'pdf';
      end
      else
      begin
         FileExt := 'bmp';
      end;
      FileName := GetFileName(FileExt);
      qryAnexosParcBB_ANEXO.SaveToFile(FileName);
      OpenURL(FileName);
   end;
end;

procedure TfrmCompromissoCadastro.dbgAnexosParcDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Bitmap: TBitmap;
   X, Y: Integer;
   FixRect: TRect;
begin
   if (DataCol = 2) and (not qryAnexosParcBB_ANEXO.IsNull) then
   begin
      Bitmap := TBitmap.Create;
      try
         ilAnexos.GetBitmap(0, Bitmap);
         X := Rect.Left + (((Rect.Right - Rect.Left) - Bitmap.Width) div 2);
         Y := Rect.Top + (((Rect.Bottom - Rect.Top) - Bitmap.Height) div 2);
         FixRect := Rect;
         FixRect.Right := FixRect.Right + 1;
         FixRect.Bottom := FixRect.Bottom + 1;
         dbgAnexosParc.Canvas.Font.Color := clLtGray;
         dbgAnexosParc.Canvas.Brush.Color := clWhite;
         dbgAnexosParc.Canvas.Pen.Style := psClear;
         dbgAnexosParc.Canvas.Rectangle(FixRect);
         dbgAnexosParc.Canvas.Draw(X, Y, Bitmap);
         dbgAnexosParc.Canvas.Pen.Style := psSolid;
      finally
         Bitmap.Free;
      end;
   end
   else
      dbgAnexosParc.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCompromissoCadastro.dbgAnexosParcKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      if qryAnexosParc.State in dsEditModes then
      begin
         qryAnexosParc.Post;
      end;
   end;
end;

procedure TfrmCompromissoCadastro.VerificaSetaAutorizacao;
var
   i                    : integer;
   objCopiaCompromisso  : TFinContasPagar;
   cd_conta             : string;
   cd_centro_custo      : string;
   bDeveAutorizar       : boolean;
   sHistorico           : string;
   msg                  : string;
   vl_compromisso       : double;
   vl_compromisso_copia : double;
begin
   objCompromisso       := nil;

   if (ListaParcelas <> nil) and ( ListaCopiaParcelas <> nil ) then
   begin
      for i := 0 to ListaParcelas.Count - 1 do
      begin
         bDeveAutorizar       := false;
         objCompromisso       := (ListaParcelas.items[i] as TFinContasPagar);
         objCopiaCompromisso  := (ListaCopiaParcelas.items[i] as TFinContasPagar);

         //campo historico da parcela
         if objCompromisso.getValorCampo('ds_despesa') <> objCopiaCompromisso.getValorCampo('ds_despesa') then
         begin
            bDeveAutorizar := true;

            //se o historico da parcela sofreu alteração então será necessário uma nova autorização
            alteraMsgAutorizacao( StrToInt( objCopiaCompromisso.getValorCampo('cd_autoriza') ), '' );
          end;

         //adiciona complemento no campo histórico se houver
         if (trim(objCopiaCompromisso.getValorCampo('complemento_historico')) <> '' )then
         begin
            sHistorico := Concat(objCompromisso.getValorCampo('ds_despesa'),' | ', objCopiaCompromisso.getValorCampo('complemento_historico'));

            objCompromisso.setValorCampo('ds_despesa', sHistorico);
         end;
                          
         //valor total despesa
         vl_compromisso       := StrToFloat( substituiCaracter(objCompromisso.getValorCampo('vl_total_despesa'),        '.', ',') );
         vl_compromisso_copia := StrToFloat( substituiCaracter(objCopiaCompromisso.getValorCampo('vl_total_despesa'),   '.', ',') );

         if vl_compromisso <> vl_compromisso_copia then
         begin
            bDeveAutorizar := true;

            //se o campo foi alterado de um compromisso já autorizado altera
            //o histórico do compromisso.
            msg := 'O valor do compromisso foi alterado. Por favor efetue nova ' +
            'autorização.';

            alteraMsgAutorizacao( StrToInt( objCopiaCompromisso.getValorCampo('cd_autoriza') ), msg );
         end;

         //valor parcela
         vl_compromisso       := StrToFloat( substituiCaracter(objCompromisso.getValorCampo('vl_despesa'),        '.', ',') );
         vl_compromisso_copia := StrToFloat( substituiCaracter(objCopiaCompromisso.getValorCampo('vl_despesa'),   '.', ',') );

         if vl_compromisso <> vl_compromisso_copia then
         begin
            bDeveAutorizar := true;

            //se o campo foi alterado de um compromisso já autorizado altera
            //o histórico do compromisso.
            msg := 'O valor do compromisso foi alterado. Por favor efetue nova ' +
            'autorização.';

            alteraMsgAutorizacao( StrToInt( objCopiaCompromisso.getValorCampo('cd_autoriza') ), msg );
         end;

         //fornecedor
         if objCompromisso.getValorCampo('cd_pessoa') <> objCopiaCompromisso.getValorCampo('cd_pessoa') then
         begin
            bDeveAutorizar := true;

            msg := 'O fornecedor foi alterado. Por favor efetue nova ' +
            'autorização.';

            alteraMsgAutorizacao( StrToInt( objCopiaCompromisso.getValorCampo('cd_autoriza') ), msg );
         end;

         //plano de contas
         if cmbPlanoContas.ItemIndex > -1 then
         begin
            cd_conta := (cmbPlanoContas.Items.Objects[ cmbPlanoContas.itemIndex ] as TItemCompromisso).getCodigo();

            if cd_conta <> cd_plano_contas_inicial then
            begin
               bDeveAutorizar := true;

               msg := 'O plano de contas do compromisso foi alterado. Por favor efetue nova ' +
               'autorização.';

               alteraMsgAutorizacao( StrToInt( objCopiaCompromisso.getValorCampo('cd_autoriza') ), msg );
            end;
         end;

         //centro de custo
         if objCentroSelecionado <> nil then
         begin
            cd_centro_custo := IntToStr(objCentroSelecionado.Centro);

            if cd_centro_custo <> cd_centro_custos_inicial then
            begin
               bDeveAutorizar := true;

               msg := 'O centro de custo do compromisso foi alterado. Por favor efetue nova ' +
               'autorização.';

               alteraMsgAutorizacao( StrToInt( objCopiaCompromisso.getValorCampo('cd_autoriza') ), msg );
            end;
         end;

         //modifica o estado da autorização
         if bDeveAutorizar = true then
         begin
            objCompromisso.setValorCampo('cd_autoriza', '0');
         end
         else
         begin
            objCompromisso.setValorCampo('cd_autoriza', objCopiaCompromisso.getValorCampo('cd_autoriza'));
         end;

      end;
   end;

end;

function TfrmCompromissoCadastro.verificaValoresApropriados: Boolean;
var
   vl_total       : double;
   vl_movimento   : double;
   i              : integer;
   bResultado     : Boolean;
   cd_titulo      : string;
   cd_coligada    : string;
   sChave         : string;
begin
   bResultado     := true;
   cd_titulo      := Self.getCodigoCompromissoPrincipal();
   cd_coligada    := IntToStr( self.cd_coligada_seleciona );
   sChave         := Concat(cd_titulo, ';', cd_coligada);

   if cmbCriterioApropriacao.ItemIndex <> 0 then
   begin
      vl_total       := 0;
      vl_movimento   := 0;

      for i := 1 to sgGridApropriacoes.RowCount - 1 do
      begin
         if trim(sgGridApropriacoes.Cells[ 4,i ]) <> '' then
         begin
            vl_movimento :=  Self.getFormataParaDouble( sgGridApropriacoes.Cells[ 4,i ] );
         end;

         vl_total := vl_total + vl_movimento;
      end;

      if RoundFloat(vl_total, 2) <> RoundFloat( txtVlNota.getValorDouble(), 2)  then
      begin
         bResultado := false;
         // Não irá mais questionar se não for igual, barra e pronto.
         {
         if Mensagem( 'A soma das apropriações não conferem com o valor total da despesa. Deseja continuar?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
         begin
            if bResultado <> false then
            begin
               DM.setLog(2033, 'Inclusao', sChave, StrToInt(cd_coligada), Concat('Gerou compromisso com possível diferença nas apropriações.' ));
               bResultado := true;
            end;
         end
         else
         begin
            bResultado := false;
         end;
         }

      end;
   end;

   Result := bResultado;
end;

procedure TfrmCompromissoCadastro.VerPainelLinhaDigitavel(valor: boolean);
begin
   pnLinhaDigitavel.Visible   := valor;
end;

function TfrmCompromissoCadastro.ehProfessor( cd_pessoa: string ): boolean;
var
   qyProfessor : TUMZQuery;
   bResultado  : boolean;
begin
   DM.CriarConsulta( qyProfessor );
   qyProfessor.SQL.Add('SELECT');
   qyProfessor.SQL.Add(' pes.cd_pessoa, pes.nm_pessoa ');
   qyProfessor.SQL.Add('FROM');
   qyProfessor.SQL.Add(' pessoas pes ');
   qyProfessor.SQL.Add(' INNER JOIN professores prof ON(pes.cd_pessoa = prof.cd_pessoa AND prof.sn_professor = ''S'') ');
   qyProfessor.SQL.Add('WHERE');
   qyProfessor.SQL.Add(' pes.cd_pessoa = :cd_pessoa ');

   qyProfessor.ParamByName('cd_pessoa').AsString := cd_pessoa;
   qyProfessor.Open();

   if qyProfessor.RecordCount > 0 then
   begin
      bResultado := true;
   end
   else
   begin
      bResultado := false;
   end;

   FreeAndNil(qyProfessor);
   
   Result := bResultado;
end;

procedure TfrmCompromissoCadastro.escritaBotoesDadosAgencia( valor: boolean );
begin
   txtParCCBanco.ReadOnly              := valor;
   txtParCCAgencia.ReadOnly            := valor;
   txtParCCDigAgencia.ReadOnly         := valor;
   txtParCCContaCorrente.ReadOnly      := valor;
   txtParCCDigContaCorrente.ReadOnly   := valor;
   txtParCCDifAgenciaConta.ReadOnly    := valor;
end;

function TfrmCompromissoCadastro.formataValor(valor: double): string;
begin
   Result := FormatFloat( '###,###,##0.00', valor );
end;

function TfrmCompromissoCadastro.getformataValorParaObjeto(valor: double) : string;
var
   valor_sem_ponto : string;
begin
   valor_sem_ponto := Self.substituiCaracter( FloatToStr (valor), '.', '' );
   Result := StringReplace( valor_sem_ponto, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;


end.
