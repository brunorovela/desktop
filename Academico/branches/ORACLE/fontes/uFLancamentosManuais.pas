unit uFLancamentosManuais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, uFSelecionarColigada, uColigada,
  ComCtrls, General, DB, ZAbstractRODataset, UZDataset, uDM, uSelConta,
  StrUtils, uFSelecionarHistoricos, uItemCombo, Grids, uFSelecionarCentro,
  ZAbstractDataset, uFSelecionarPessoa, uClassMovimento, uULancamentos,
  UMComboBox, UMEditMonetario, ToolWin, ImgList, DBCtrls, VirtualTrees, uCentroCusto,
  Contnrs, UZDbcFuncs, ZDbcIntfs, DBClient, uIUMDataModule;
type
  // Usado para identificar como a tela irá salvar as informações e irá tratar algumas situações
  TModoTela = (mtAlterar, mtInserir);

  // Usado para controle do tamanho do form
   TFormatoTela = record
      Compromisso: Boolean;
      Rateio: Boolean;
      Normal: Boolean;
   end;

   TObjCentro = record
      objCentro: TCentroCusto;
      valor: Double;
      percentual    : Double;
      lancamento_por_criterio : boolean;
   end;

   TValoresRateio = record
      valor: Double;
      percentual : Double;
      lancamento_por_criterio : boolean;
   end;
   
   PCentro = ^TObjCentro;

  TfrmLancamentosManuais = class(TForm)
    paCabecalho: TPanel;
    qryBuscaContas: TUMZReadOnlyQuery;
    qryBuscaHistoricos: TUMZReadOnlyQuery;
    qryBuscaProximaChave: TUMZReadOnlyQuery;
    pnFundo: TPanel;
    pnTopo: TPanel;
    tcLancamentos: TTabControl;
    sbFecha1: TSpeedButton;
    lbDebito1: TLabel;
    lbCredito1: TLabel;
    lbValor1: TLabel;
    sbBuscaDebito1: TSpeedButton;
    sbBuscaCredito1: TSpeedButton;
    lbHistorico1: TLabel;
    lbComplemento1: TLabel;
    sbBuscaHistoricos1: TSpeedButton;
    edCodigoDebito1: TEdit;
    edDescDebito1: TEdit;
    edCodigoCredito1: TEdit;
    edDescCredito1: TEdit;
    pnCompromisso1: TPanel;
    lbTipoDocumento1: TLabel;
    lbNumeroDocumento1: TLabel;
    lbFornecedor1: TLabel;
    lbDataVencimento1: TLabel;
    lbNumeroParcelas1: TLabel;
    edNumeroDoc1: TEdit;
    edFornecedor1: TEdit;
    edDataVencimento1: TMaskEdit;
    edNumeroParcelas1: TEdit;
    edComplemento1: TEdit;
    edDescHist1: TEdit;
    edCodigoHist1: TEdit;
    sbBuscaFornecedores1: TSpeedButton;
    qryTiposTitulo: TUMZReadOnlyQuery;
    pnRateios1: TPanel;
    qryBuscaLancamento: TUMZReadOnlyQuery;
    cbTipoTitulo1: TUMComboBox;
    edValor1: TUMEditMonetario;
    cbCriterios1: TUMComboBox;
    lbCentroCusto1: TLabel;
    lbRateios1: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    edData: TMaskEdit;
    Label2: TLabel;
    edChave: TEdit;
    Label3: TLabel;
    edTotalDebitos: TEdit;
    Label6: TLabel;
    edDiferencas: TEdit;
    Label5: TLabel;
    edTotalCreditos: TEdit;
    Label4: TLabel;
    ilImagens: TImageList;
    cbColigadasLanc: TUMComboBox;
    qryCadastroContasAtivas: TUMZQuery;
    qryCadastroContasAtivascd_caixa: TIntegerField;
    qryCadastroContasAtivascd_plano_conta: TLargeintField;
    cbCaixaBancoDebito1: TUMComboBox;
    cbCaixaBancoCredito1: TUMComboBox;
    Label7: TLabel;
    pnBotoes: TPanel;
    toolPessoa: TToolBar;
    btCancelar: TToolButton;
    ToolButton2: TToolButton;
    btSalvaFecha: TToolButton;
    ToolButton1: TToolButton;
    btSalvar: TToolButton;
    cbRateio1: TUMComboBox;
    edPorcentagem1: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    vstCentros1: TVirtualStringTree;
    qryCentroEncontrar: TUMZQuery;
    btnExcluirRateio1: TButton;
    ed_vlRateio1: TUMEditMonetario;
    btnAddRateio1: TButton;
    ed_cdClassificacao1: TMaskEdit;
    cdsCentroCustos: TClientDataSet;
    cdsCentroCustosCD_CENTRO: TIntegerField;
    cdsCentroCustosCD_CENTRO_PAI: TIntegerField;
    cdsCentroCustosDS_CENTRO: TStringField;
    cdsRateioCentroCustos: TClientDataSet;
    cdsRateioCentroCustosDS_SIGLA: TStringField;
    cdsRateioCentroCustosCD_CENTRO: TIntegerField;
    cdsRateioCentroCustosCD_COLIGADA: TIntegerField;
    cdsRateioCentroCustosVL_APROPRIACAO: TFloatField;
    cdsCentroCustosCD_COLIGADA: TIntegerField;
    cdsCentroCustosTP_CENTRO: TIntegerField;
    cdsCentroCustosCD_CLASSIFICACAO: TStringField;
    procedure ed_vlRateio1KeyPress(Sender: TObject; var Key: Char);
    procedure edPorcentagem1KeyPress(Sender: TObject; var Key: Char);
    procedure cbRateio1KeyPress(Sender: TObject; var Key: Char);
    procedure ed_cdClassificacao1KeyPress(Sender: TObject; var Key: Char);
    procedure cbCriterios1KeyPress(Sender: TObject; var Key: Char);
    procedure ed_cdClassificacao1Exit(Sender: TObject);
    procedure btnAddRateio1Click(Sender: TObject);
    procedure ed_vlRateio1Exit(Sender: TObject);
    procedure vstCentros1NewText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; NewText: WideString);
    procedure btnExcluirRateio1Click(Sender: TObject);
    procedure vstCentros1GetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
    procedure edPorcentagem1Exit(Sender: TObject);
    procedure edDataVencimento1KeyPress(Sender: TObject; var Key: Char);
    procedure edFornecedor1KeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoTitulo1KeyPress(Sender: TObject; var Key: Char);
    procedure edNumeroDoc1KeyPress(Sender: TObject; var Key: Char);
    procedure edComplemento1KeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoHist1KeyPress(Sender: TObject; var Key: Char);
    procedure cbColigadasLancChange(Sender: TObject);
    procedure edDataChange(Sender: TObject);
    procedure edNumeroParcelas1Change(Sender: TObject);
    procedure edDataVencimento1Change(Sender: TObject);
    procedure edFornecedor1Change(Sender: TObject);
    procedure cbTipoTitulo1Change(Sender: TObject);
    procedure edNumeroDoc1Change(Sender: TObject);
    procedure edComplemento1Change(Sender: TObject);
    procedure cbCaixaBancoDebito1Change(Sender: TObject);
    procedure cbCaixaBancoCredito1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbCaixaBancoCredito1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCaixaBancoDebito1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNumeroParcelas1KeyPress(Sender: TObject; var Key: Char);
    procedure edValor1Exit(Sender: TObject);
    procedure edCodigoDebito1Enter(Sender: TObject);
    procedure edCodigoCredito1Enter(Sender: TObject);
    procedure edCodigoHist1Change(Sender: TObject);
    procedure edCodigoHist1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodigoHist1Exit(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btInserirClick(Sender: TObject);
    procedure edCodigoCredito1KeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoDebito1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edCodigoCredito1Change(Sender: TObject);
    procedure edCodigoDebito1Change(Sender: TObject);
    procedure edCodigoDebito1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodigoDebito1Exit(Sender: TObject);
    procedure edCodigoCredito1Exit(Sender: TObject);
    procedure edCodigoCredito1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNumeroParcelas1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDataVencimento1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNumeroDoc1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTipoTitulo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbColigadas1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edComplemento1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbCriterios1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbBuscaFornecedores1Click(Sender: TObject);
    procedure edValor1Change(Sender: TObject);
    procedure tcLancamentosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btSalvaFechaClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure tcLancamentosChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // Remove uma aba
    procedure removeAba(Sender: TObject);

    // sbBuscaDebito
    procedure buscaContasDebito(Sender: TObject);
    
    // sbBuscaCredito
    procedure buscaContasCredito(Sender: TObject);

    // Esta função serve para buscar os históricos
    procedure buscaHistoricos(Sender: TObject);

   function getObjectListaRateios( indiceAtual : Integer ) : TObjectList;

  private
     modoTela: TModoTela;

     // Indica número de abas ja criadas para caso haja uma exclusão continue do número correto.
     abasCriadas: Integer;

     // StringList salva somente o código dos fornecedores para poder
     // mostra na tela (Codigo - Nome)
     slCodigoFornecedores: TStringList;

     // StringList indica abas que possuem um compromisso, usado para controle de abas
     slAbasComCompromisso: TStringList;

     // StringList indica abas que possuem rateio, usado para controle de abas
     slAbasComRateio: TStringList;

     slAbaCodigoLancamentos: TStringList;

     FormatoTela: TFormatoTela;

     CreditoAtual, DebitoAtual: String;

     // Indica se os valores da tela está diferenciados e não pode salvar
     ValoresDiferentes: Boolean;

     procedure preencherRateioCentroCusto(cdCentroCusto: Integer; cdCentroPai: Integer;
        dsTipoRateio: String; vlPorcentagem: Double; vlLancamento: Double);
     function preencherCentroCustoEspecificoArvore(cdCentroCusto: Integer;
        vlPorcentagem: Double; vlLancamento: Double): PVirtualNode;
     function preencherCentroCustoAnaliticoArvore(cdCentroCusto: Integer;
        vlPorcentagem, vlLancamento: Double): PVirtualNode;

     procedure inserirRateioCentroCusto(cdCentroCusto: Integer;
        dsTipoRateio: String; vlPorcentagem: Double; vlLancamento: Double);
     function incluirNodesPaiArvore(cdCentroCusto: Integer): PVirtualNode;
     procedure incluirNodesFilhoArvore(cdCentroCusto: Integer; dsTipoRateio: String; vlPorcentagem, vlLancamento: Double;
        nrQtdeCentroCustoAnaliticos: Integer; var nrCentroCustoPercorridos: Integer;
        var vlAcumuladoLancamento: Double; var vlAcumuladoPorcentagem: Double);

     function getPercentualTotalRateios(): Double;
     function getValorTotalRateios(nrAbaAtual: Integer = -1): Double;
     function getValorTotalCriterioApropriacao(cdCentroCusto: Integer; dsCriterioRateio: String): Double;


     function getCriteriosRateio(cdCentroCusto: Integer): TStringList;
     function getNodeCentroCusto(cdCentroCusto: Integer): PVirtualNode;
     function getNodeCentroCustoEspecifico(cdCentroCusto: Integer): PVirtualNode;
     function getQuantidadeCentrosCustosAnaliticos(cdCentroCusto: Integer;
        dsCriterioRateio: String): Integer;

     procedure mapearArvoreCentroCustos();
     function isCentroCustoAnalitico(cdCentroCusto: Integer; dsTipoRateio: String): Boolean;

     function isRateioValido(): Boolean;

     function incluirCentroCustoSinteticoArvore(cdCentroCusto: Integer): PVirtualNode;
     function incluirCentroCustoAnaliticoArvore(cdCentroCusto: Integer;
        dsTipoRateio: String; vlPorcentagem, vlLancamento: Double;
        nrQtdeCentroCustoAnaliticos: Integer; var nrCentroCustoPercorridos: Integer;
        var vlAcumuladoLancamento: Double; var vlAcumuladoPorcentagem: Double): PVirtualNode;
     function incluirCentroCustoEspecificoArvore(cdCentroCusto: Integer;
        vlPorcentagem: Double; vlLancamento: Double): PVirtualNode;

     function atualizarValorCentroCustosSinteticos(nodePai: PVirtualNode): Double;
     function atualizarPercentualCentroCustosSinteticos(nodePai: PVirtualNode): Double;
     procedure atualizarCentroCustosSinteticos();

     procedure limparCamposRateio();

      
     // Esconde todos os campos com a tag DIFERENTE do Index
     procedure trocaAba(Index: Integer);

     // Cria os campos com tag = Index
     procedure CriaCampos(Index: Integer);

     // Adiciona uma nova aba
     procedure CriaAba();

     // Procedure que limpa todos campos da tela para continuar inserindo novos lançamentos
     procedure LimpaCampos();

     // Carrega a próxima chave disponível para a criação de lançamentos
     procedure CarregaProximaChave();

     // Carrega todos critérios de apropriação
     procedure CarregaCriterios();

     // Carrega todos os tipos de título
     procedure CarregaTiposTitulos();

     // Verifica se a data é válida
     function VerificaDataValida(Texto: String): Boolean;

     // Verifica o TIPO da conta do index por parâmetro
     function verificaConta(index: Integer; categoria: TCategoriaConta): TTiposConta;

     // Realiza a inserção dos lançamentos no banco de dados
     function SalvaLancamentos(): Boolean;

     // Valida as informações da aba informada no parâmetro
     function ValidaAbaAtual(Index: Integer): Boolean;

     function getformataValorParaObjeto( valor: double ) : String;

     function procuraComponente(nome: String; index: Integer): TComponent; overload;

     function NovoCompromisso(cd_pessoa: Integer; nr_documento,
        nr_parcela, dt_vencimento: String; cd_tipo_titulo: Integer;
        ValorTotal: Double; cd_coligada: Integer; vl_parcela: Double;
        despesa, historico: String; HistoricoContabil: Integer;
        DataEmissaoNota, DataCompetencia, DataProvavelPagamento, DataLancamento: String; Modo: TTipoExecucao): TExecucaoCompromisso;

     // Procedure atuailza o Label que mostra o total de valor atual rateado
     procedure atualizaValores();

     procedure CriaEdit(EditCopia: TEdit; ParentPai: TWinControl; index: Integer);
     procedure CriaComboBox(ComboBoxCopia: TUMComboBox; ParentPai: TWinControl; index: Integer);
     procedure CriaSpeedButton(SpeedButtonCopia: TSpeedButton; ParentPai: TWinControl; index: Integer);
     procedure CriaLabel(LabelCopia: TLabel; ParentPai: TWinControl; index: Integer);
     procedure CriaPanel(PanelCopia: TPanel; ParentPai: TWinControl; index: Integer);
     procedure CriaBitBtn(ButtonCopia: TBitBtn;ParentPai: TWinControl; index: Integer);
     procedure CriaStringGrid(GridCopia: TStringGrid; ParentPai: TWinControl; index: Integer);
     procedure CriaMaskEdit(MaskEdit: TMaskEdit; ParentPai: TWinControl; index: Integer);
     procedure CriaButton(ButtonCopia: TButton; ParentPai: TWinControl; index: Integer);
     procedure CriaEditMonetario(EditCopia: TUMEditMonetario; ParentPai: TWinControl; index: Integer);
     procedure CriaVirtualStringTree(GridVirtualStringTree: TVirtualStringTree; ParentPai: TWinControl; index: Integer);

     // Gera movimento do compromisso
     procedure geraMovimento(tipo_acao: TTipoMovimento;
        cd_titulo, cd_coligada: string; vl_despesa: double);

     function insereRateios(cd_titulo: TExecucaoCompromisso; cd_coligada: Integer; vl_despesa: Double): TList;

     // Está procedure irá verificar se existe alguma conta que gere compromisso,
     // caso exista ele irá verificar se existe alguma conta para fazer o rateio do compromisso
     function verificaRateio(): Boolean;

     // Função para apagar os campos de compromisso e esconde-los
     procedure LimpaCompromisso(Tag: Integer);
     procedure MontaCompromisso(Tag: Integer);

     procedure LimpaRateio(Tag: Integer);
     procedure MontaRateio(Tag: Integer);

     procedure VerificaCredito(Tag: Integer);
     procedure VerificaDebito(Tag: Integer);
     procedure verificaHistorico(Tag: Integer);

     // Esta procedura atualiza a tela de lançamentos manuais conforme aba atual
     procedure AtualizaTelaAba(Tag: Integer);

     function VerificaContaUsada(Conta: String; Tag: Integer; Tipo: TCategoriaConta): Boolean;

     function isCaixaBanco(Conta: Integer): Boolean;

     { Carrega todas as contas/caixas de um determinado plano de conta }
     function CarregaCaixasBancos(Tag: Integer; Tipo: TCategoriaConta; Caixa: Integer = -1): Boolean;

     { Limpa a combo retirando todos os itens e desabilitando }
     procedure LimpaCaixasBanco(Tag: Integer; Tipo: TCategoriaConta);

     { Insere o rateio do movimento em fin_mov_tesouraria }
     procedure InsereRateioMovimento(Valor: Double; CodigoMovimento: Integer; CategoriaConta: TCategoriaConta);

     procedure habilitaSalvarEdicao(podeSalvar: Boolean);

     function GetProximaChave() : integer;

  public
     procedure alteraLancamentos(cd_chave: Integer);
  end;

var
  frmLancamentosManuais: TfrmLancamentosManuais;

const
   SQL_BUSCA_ITENS_CRITERIO = ' SELECT ' +
      '  fcai.cd_centro, ' +
      '  fcai.vl_apropriacao, ' +
      '  fccc.ds_centro ' +
      ' FROM ' +
      '  fin_criterios_apropria_itens fcai ' +
      ' INNER JOIN fin_config_centro_custos fccc ON ( ' +
      '  fccc.cd_centro = fcai.cd_centro ' +
      ' ) ' +
      ' WHERE ' +
      '  cd_apropriacao = :cd_apropriacao';      

   SQL_BUSCA_FORNECEDOR = ' SELECT '+
      '  p.cd_pessoa, '+
      '  p.nm_pessoa '+
      ' FROM '+
      '  fin_plano_contas_fornecedor fpcf '+
      ' INNER JOIN pessoas p ON (p.cd_pessoa = fpcf.cd_pessoa) '+
      ' WHERE '+
      '  fpcf.cd_conta_passivo = :cd_conta ';

   SQL_BUSCA_LANCAMENTO = ' SELECT '+
      '  fc.cd_lancamento, '+
      '  fc.dt_movimento,  '+
      '  fc.cd_debito,  '+
      '  fc.cd_credito, '+
      '  fc.vl_movimento,  '+
      '  fc.cd_historico,  '+
      '  fc.ds_historico, '+
      '  fc.cd_titulo,  '+
      '  fcp.cd_coligada,  '+
      '  fcp.cd_pessoa, '+
      '  fcp.nr_documento, '+
      '  (CASE fc.cd_operacao '+
      '     WHEN ''MV'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 1 and cd_transfere = fc.cd_titulo) '+
      '     WHEN ''MS'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 1 and cd_movimento_te = fc.cd_titulo)   '+
      '     ELSE 0 '+
      '  END) AS caixa_debito,'+
      ' (CASE fc.cd_operacao  '+
      '     WHEN ''MV'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 2 and cd_transfere = fc.cd_titulo) '+
      '     WHEN ''MS'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 2 and cd_movimento_te = fc.cd_titulo) '+
      '     ELSE 0 '+
      '  END) AS caixa_credito,  '+
      '  (SELECT max(nr_parcela) FROM fin_contas_pagar WHERE cd_titulo_principal = fcp.cd_titulo ) AS nr_parcela, '+
      '  fc.cd_criterio_apropria, '+
      '  fcp.dt_vencimento, '+
      '  fcp.cd_tipo_titulo, '+
      '  fc.cd_operacao, '+
      '  p.nm_pessoa, '+
      '  fcpc.ds_conta as conta_credito, '+
      '  fcpcd.ds_conta as conta_debito '+
      ' FROM '+
      '  fin_contabil fc '+
      '  INNER JOIN coligadas c ON (c.cd_coligada = fc.cd_coligada) '+
      ' LEFT JOIN fin_contas_pagar fcp ON (fcp.cd_titulo = fc.cd_titulo) '+
      ' LEFT JOIN pessoas p ON (p.cd_pessoa = fcp.cd_pessoa) '+
      ' LEFT JOIN fin_config_plano_contas fcpc ON (fcpc.cd_conta = fc.cd_credito AND fcpc.cd_coligada_matriz = c.cd_coligada_matriz) '+
      ' LEFT JOIN fin_config_plano_contas fcpcd ON (fcpcd.cd_conta = fc.cd_debito AND fcpcd.cd_coligada_matriz = c.cd_coligada_matriz) '+
      ' WHERE '+
      '  fc.cd_chave = :cd_chave ';

   SQL_BUSCA_RATEIO_LANCAMENTO = ' SELECT '+
      '  fcc.cd_lancamento, '+
      '  fcc.cd_centro, '+
      '  fcc.vl_movimento, '+
      '  fccc.ds_centro, '+
      '  fccc.tp_centro, ' +
      '  fcc.sn_lancamento_especifico, ' +
      '  fccc.cd_centro_pai '+
      ' FROM '+
      '  fin_contabil_cc fcc '+
      ' INNER JOIN fin_contabil fc ON ( '+
      '  fcc.cd_lancamento = fc.cd_lancamento '+
      ' )'+
      ' INNER JOIN fin_config_centro_custos fccc ON ( '+
      '  fcc.cd_centro = fccc.cd_centro AND '+
      '  fc.cd_coligada = fccc.cd_coligada_matriz '+
      ' ) '+
      ' WHERE '+
      '  fcc.cd_lancamento = :cd_lancamento '+
      ' ORDER BY '+
      '  fcc.sn_lancamento_especifico DESC';

implementation

uses uPessoa, uUsuario, uListaExecucao, uGeneral, uListaColigadas;

{$R *.dfm}

procedure TfrmLancamentosManuais.alteraLancamentos(cd_chave: Integer);
var
   qryBuscaRateios, qryDeleteCompromisso: TUMZQuery;
   i, j, tag, tagArvore: Integer;
   cbCriterios, cbColigadas, cbTipoTitulo: TUMComboBox;
   lbCentroCusto: TLabel;
   vstCentros : TVirtualStringTree;
   vlPercentual, vlPercentualAcumulado : Double;
   dsTipoRateio: String;
begin
   DM.CriarConsulta(qryBuscaRateios);
   DM.CriarConsulta(qryDeleteCompromisso);

   qryBuscaRateios.SQL.Text := SQL_BUSCA_RATEIO_LANCAMENTO;

   qryBuscaLancamento.SQL.Text := SQL_BUSCA_LANCAMENTO;
   qryBuscaLancamento.ParamByName('cd_chave').AsInteger := cd_chave;
   qryBuscaLancamento.Open;

   abasCriadas := 1;
   tag := 1;

   slAbaCodigoLancamentos := TStringList.Create;

   edData.Text := qryBuscaLancamento.FieldByName('dt_movimento').AsString;
   edChave.Text := IntToStr(cd_chave);

   while not qryBuscaLancamento.Eof do
   begin

      vlPercentualAcumulado := 0;

      if qryBuscaLancamento.FieldByName('cd_debito').AsString <> '0' then
      begin
         TEdit(procuraComponente('edCodigoDebito', tag)).Text :=
            qryBuscaLancamento.FieldByName('cd_debito').AsString;

         TEdit(procuraComponente('edDescDebito', tag)).Text :=
            qryBuscaLancamento.FieldByName('conta_debito').AsString;

         if (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'MV') or
            (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'MS') then
         begin
            CarregaCaixasBancos(tag, ccDebito, qryBuscaLancamento.FieldByName('caixa_debito').AsInteger);
         end
         else
         begin
            TUMComboBox(procuraComponente('cbCaixaBancoDebito', tag)).Visible := False;
         end;
      end;

      if qryBuscaLancamento.FieldByName('cd_credito').AsString <> '0' then
      begin
         TEdit(procuraComponente('edCodigoCredito', tag)).Text :=
            qryBuscaLancamento.FieldByName('cd_credito').AsString;
            
         TEdit(procuraComponente('edDescCredito', tag)).Text :=
            qryBuscaLancamento.FieldByName('conta_credito').AsString;

         if (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'MV') or
            (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'MS') then
         begin
            CarregaCaixasBancos(tag, ccCredito, qryBuscaLancamento.FieldByName('caixa_credito').AsInteger);
         end
         else
         begin
            TUMComboBox(procuraComponente('cbCaixaBancoCredito', tag)).Visible := False;
         end;
      end;

      TUMEditMonetario(procuraComponente('edValor', tag)).setValorDouble(
         qryBuscaLancamento.FieldByName('vl_movimento').AsString
      );

      TLabel(procuraComponente('lbRateios', Tag)).Caption := 'Valor Total: ' + qryBuscaLancamento.FieldByName('vl_movimento').AsString;
      TLabel(procuraComponente('lbRateios', Tag)).Visible := True;

      TEdit(procuraComponente('edCodigoHist', tag)).Text :=
         qryBuscaLancamento.FieldByName('cd_historico').AsString;

      if qryBuscaHistoricos.Locate('cd_historico', qryBuscaLancamento.FieldByName('cd_historico').AsInteger, [loCaseInsensitive]) then
      begin
         TEdit(procuraComponente('edDescHist', tag)).Text :=
            qryBuscaHistoricos.FieldByName('ds_historico').AsString;
      end;

      TEdit(procuraComponente('edComplemento', tag)).Text :=
         qryBuscaLancamento.FieldByName('ds_historico').AsString;

      if (verificaConta(tag, ccDebito) = tcResultado) or
         (verificaConta(tag, ccCredito) = tcResultado) then
      begin
         lbCentroCusto := TLabel(procuraComponente('lbCentroCusto', Tag));

         cbCriterios := TUMComboBox(procuraComponente('cbCriterios', tag));

         cbCriterios.Enabled := True;
         cbCriterios.Visible := True;

         lbCentroCusto.Visible := True;

         qryBuscaRateios.ParamByName('cd_lancamento').AsInteger :=
            qryBuscaLancamento.FieldByName('cd_lancamento').AsInteger;

         qryBuscaRateios.Open;

         vstCentros := TVirtualStringTree(procuraComponente('vstCentros', tag));

         j := 1;

         while not qryBuscaRateios.Eof do
         begin
            vlPercentual := (qryBuscaRateios.FieldByName('vl_movimento').AsFloat *100)/(qryBuscaLancamento.FieldByName('vl_movimento').AsFloat);
            vlPercentual := RoundFloat(vlPercentual, 2);

            // Se for o último registro ajusta a diferença do percentual
            if qryBuscaRateios.RecNo = qryBuscaRateios.RecordCount then
            begin
               vlPercentual := 100 - vlPercentualAcumulado;
            end;

            // Acumula o percentual total
            vlPercentualAcumulado := vlPercentualAcumulado + vlPercentual;

            dsTipoRateio := '';
            if ( qryBuscaRateios.FieldByName('sn_lancamento_especifico').AsInteger = 1 ) then
            begin
               dsTipoRateio := 'ESP';
            end;

            preencherRateioCentroCusto(
               qryBuscaRateios.FieldByName('cd_centro').AsInteger,
               qryBuscaRateios.FieldByName('cd_centro_pai').AsInteger,
               dsTipoRateio,
               RoundFloat(vlPercentual, 2),
               RoundFloat(qryBuscaRateios.FieldByName('vl_movimento').AsFloat, 2)
            );

            qryBuscaRateios.Next;
         end;

         TPanel(procuraComponente('pnRateios', Tag)).Visible := True;

         qryBuscaRateios.Close;

         slAbasComRateio.Values['pnRateios' + IntToStr(Tag)] := 'ativo';

         j := 0;
      end;

      atualizarCentroCustosSinteticos();

      if (qryBuscaLancamento.FieldByName('cd_titulo').AsInteger <> 0) and
         (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'CP')then
      begin
         cbTipoTitulo := TUMComboBox(procuraComponente('cbTipoTitulo', tag));

         for i := 0 to cbTipoTitulo.Items.Count - 1 do
         begin
            if TItemCombo(cbTipoTitulo.Items.Objects[i]).getCodigo = qryBuscaLancamento.FieldByName('cd_tipo_titulo').AsString then
            begin
               cbTipoTitulo.ItemIndex := i;
            end;
         end;

         slAbasComCompromisso.Values['pnCompromisso' + IntToStr(tag)] := 'ativo';

         TPanel(procuraComponente('pnCompromisso', tag)).Visible := True;

         TEdit(procuraComponente('edDataVencimento', tag)).Text :=
            qryBuscaLancamento.FieldByName('dt_vencimento').AsString;

         TEdit(procuraComponente('edNumeroDoc', tag)).Text :=
            qryBuscaLancamento.FieldByName('nr_documento').AsString;

         TEdit(procuraComponente('edNumeroParcelas', tag)).Text :=
            qryBuscaLancamento.FieldByName('nr_parcela').AsString;

         TEdit(procuraComponente('edFornecedor', tag)).Text :=
            qryBuscaLancamento.FieldByName('cd_pessoa').AsString + ' - ' +
            qryBuscaLancamento.FieldByName('nm_pessoa').AsString;

         slCodigoFornecedores.Values[IntToStr(tag)] := qryBuscaLancamento.FieldByName('cd_pessoa').AsString;
      end;

      slAbaCodigoLancamentos.Values[IntToStr(tag)] := qryBuscaLancamento.FieldByName('cd_lancamento').AsString;

      Inc(tag);

      qryBuscaLancamento.Next;

      if not qryBuscaLancamento.Eof then
      begin
         tcLancamentos.TabIndex := tcLancamentos.Tabs.Count-1;
         criaAba;
      end;
   end;

   AtualizaTelaAba(Tag-1);

   btSalvaFecha.Enabled := False;
   btSalvar.Enabled := False;

   ValoresDiferentes := False;

   modoTela := mtAlterar;
end;

procedure TfrmLancamentosManuais.AtualizaTelaAba(Tag: Integer);
var
   pnRateios, pnCompromisso: TPanel;
begin
   pnRateios := TPanel(procuraComponente('pnRateios', Tag));
   pnCompromisso := TPanel(procuraComponente('pnCompromisso', Tag));

   if pnCompromisso.Visible and pnRateios.Visible then
   begin
      // É setado o rateio para top = 0 para que ele fique SEMPRE acima do TPanel
      pnRateios.Top := 0;
      Self.Height := 678;
   end;

   if pnCompromisso.Visible and not(pnRateios.Visible) then
   begin
      Self.Height := 555;
   end;

   if pnRateios.Visible and not(pnCompromisso.Visible) then
   begin
      Self.Height := 565;
   end;

   if not(pnRateios.Visible) and not(pnCompromisso.Visible) then
   begin
      Self.Height := 425;
   end;

   { Reposiciona o form }
   Self.Left := Round((Screen.Width - Self.Width) / 2);
   Self.Top := Round((Screen.Height - Self.Height) / 2);
end;

procedure TfrmLancamentosManuais.atualizaValores();
var
   ValorDebito, ValorCredito: Currency;
   i, index: Integer;
   CampoCredito, CampoDebito: String;
begin
   // Inicializa valores
   ValorDebito := 0;
   ValorCredito := 0;

   index := 0;

   // Percorre todos os componentes da tela
   for I := 0 to Self.ComponentCount - 1 do
   begin
      index := Self.Components[i].Tag;

      if index = 0 then
      begin
         Continue;
      end;

      CampoCredito := TEdit(procuraComponente('edCodigoCredito', index)).Text;
      CampoDebito := TEdit(procuraComponente('edCodigoDebito', index)).Text;

      if StartsText('edValor', Self.Components[i].Name) and (CampoCredito <> '') then
      begin
         ValorCredito := TUMEditMonetario(procuraComponente(Self.Components[i].Name, Self.Components[i].Tag)).getValorDouble + ValorCredito;
      end;

      if StartsText('edValor', Self.Components[i].Name) and (CampoDebito <> '') then
      begin
         ValorDebito := TUMEditMonetario(procuraComponente(Self.Components[i].Name, Self.Components[i].Tag)).getValorDouble + ValorDebito;
      end;

      CampoCredito := '';
      CampoDebito := '';
   end;

   if RoundFloat(ValorCredito,2) > RoundFloat(ValorDebito,2)  then
   begin
      edDiferencas.Text := CurrToStr(ValorCredito - ValorDebito);
      btSalvar.Enabled := False;
      btSalvaFecha.Enabled := False;
      ValoresDiferentes := True;
   end;

   if RoundFloat(ValorDebito,2) > RoundFloat(ValorCredito,2) then
   begin
      edDiferencas.Text := CurrToStr(ValorDebito - ValorCredito);
      btSalvar.Enabled := False;
      btSalvaFecha.Enabled := False;
      ValoresDiferentes := True;
   end;

   if RoundFloat(ValorDebito,2) = RoundFloat(ValorCredito,2) then
   begin
      edDiferencas.Text := '0';
      btSalvar.Enabled := True;
      btSalvaFecha.Enabled := True;
   end;

   edTotalCreditos.Text := CurrToStr(ValorCredito);
   edTotalDebitos.Text := CurrToStr(ValorDebito);
end;

procedure TfrmLancamentosManuais.btCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLancamentosManuais.btExcluirClick(Sender: TObject);
begin
   // Tenta salvar os lançamentos
   if SalvaLancamentos then
   begin
      Self.Close;
   end;
end;

procedure TfrmLancamentosManuais.btSalvaFechaClick(Sender: TObject);
begin
   // Tenta salvar os lançamentos
   if SalvaLancamentos then
   begin
      Self.Close;
   end;
end;

procedure TfrmLancamentosManuais.btSalvarClick(Sender: TObject);
begin
   if not(SalvaLancamentos) then
   begin
      Exit;
   end;
   
   LimpaCampos;
   carregaProximaChave;
end;

procedure TfrmLancamentosManuais.buscaContasCredito(Sender: TObject);
var
   CodigoCampo: Integer;
begin
   CodigoCampo := TComponent(Sender).Tag;

   if (CodigoCampo <> 1) and (TEdit(Self.FindComponent('edCodigoDebito' + IntToStr(CodigoCampo))).Text <> '') then
   begin
      Mensagem('Você não pode realizar um lançamento partido onde uma parte do lançamento é destinada a crédito e débito ao mesmo tempo.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );
      Exit;   
   end;

   CreditoAtual := TEdit(procuraComponente('edCodigoCredito', CodigoCampo)).Text;

   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch and (CreditoAtual <> frm_SelConta.qyPlanosContascd_conta.AsString) then
   begin
      TEdit(Self.FindComponent('edCodigoCredito' + IntToStr(CodigoCampo))).Text :=
         frm_SelConta.qyPlanosContascd_conta.AsString;

      VerificaCredito(CodigoCampo);
   end;

   atualizaValores;
end;

procedure TfrmLancamentosManuais.buscaContasDebito(Sender: TObject);
var
   CodigoCampo: Integer;
begin
   CodigoCampo := TComponent(Sender).Tag;

   if (CodigoCampo <> 1) and (TEdit(Self.FindComponent('edCodigoCredito' + IntToStr(CodigoCampo))).Text <> '') then
   begin
      Mensagem('Você não pode realizar um lançamento partido onde uma parte do lançamento é destinada a crédito e débito ao mesmo tempo.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );
      Exit;   
   end;

   DebitoAtual := TEdit(procuraComponente('edCodigoDebito', CodigoCampo)).Text;

   frm_SelConta.ShowModal;

   if frm_SelConta.flgSearch and (DebitoAtual <> frm_SelConta.qyPlanosContascd_conta.AsString) then
   begin
      TEdit(Self.FindComponent('edCodigoDebito' + IntToStr(CodigoCampo))).Text :=
         frm_SelConta.qyPlanosContascd_conta.AsString;

      VerificaDebito(CodigoCampo);
   end;

   atualizaValores;
end;

procedure TfrmLancamentosManuais.buscaHistoricos(Sender: TObject);
var
   resultado: TResultadoHistoricos;
   index: String;
begin

   index := IntToStr(TSpeedButton(Sender).Tag);

   resultado := TfrmSelecionarHistoricos.Filtrar();

   // -1 = não filtrou nenhum histórico
   if resultado.cd_historico <> -1 then
   begin
      TEdit(Self.FindComponent('edCodigoHist' + index)).Text := IntToStr(resultado.cd_historico);
      TEdit(Self.FindComponent('edDescHist' + index)).Text := resultado.ds_historico;
   end;
end;

procedure TfrmLancamentosManuais.btnExcluirRateio1Click(Sender: TObject);
var
   nrAbaAtual: Integer;
   objArvoreRateio: TVirtualStringTree;
   btAddRateio: TButton;
   lbValorTotal: TLabel;
begin
  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Habilita o botão de adicionar rateio
  btAddRateio := TButton(procuraComponente('btnAddRateio', nrAbaAtual));
  btAddRateio.Visible := True;

  // Esconde o valor total (pois a grid foi limpa)
  lbValorTotal := TLabel(procuraComponente('lbRateios', nrAbaAtual));
  lbValorTotal.Visible := False;

  // Limpa a arvore de centro de custos
  objArvoreRateio.Clear();

  // Limpa os campos de rateio
  limparCamposRateio();
end;

function TfrmLancamentosManuais.CarregaCaixasBancos(Tag: Integer;
  Tipo: TCategoriaConta; Caixa: Integer): Boolean;
const
   SQL_BUSCA_CAIXAS = '  '+
      'SELECT ' +
      '  cd_caixa, ' +
      '  cd_coligada, ' +
      '  ds_caixa ' +
      'FROM ' +
      '  fin_cadastro_contas ' +
      'WHERE ' +
      '  cd_plano_conta = :cd_conta ' +
      '  AND sn_ativa = ''S'' ' +
      '  AND cd_coligada IN (:cd_coligadas) '+
      '  AND ( ' +
      '  cd_caixa IN ( ' +
      '     SELECT ' +
      '        fcc.cd_caixa ' +
      '     FROM ' +
      '        fin_cadastro_contas fcc ' +
      '     INNER JOIN fin_controle_caixa fca ON ( ' +
      '        fca.cd_conta_banco = fcc.cd_caixa  ' +
      '     ) ' +
      '     WHERE ' +
      '        fcc.tp_conta = 3  ' +
      '        AND fca.ds_situacao = ''A''  ' +
      '        AND fcc.cd_coligada IN (:cd_coligadas) '+
      '     GROUP BY  ' +
      '        fcc.cd_caixa  ' +
      '  )' +
      '  OR tp_conta <> 3' +
      ') ';
var
   edCodigo: TEdit;
   cbCaixaBanco: TUMComboBox;
   qryCarregaContas: TUMZQuery;
   listaColigadas: TListaColigadas;
   slColigadas: TStringList;
   cbNome, edNome: String;
   itemCombo: TItemCombo;
   i, Selecionado: Integer;
begin
   Result := True;

   DM.CriarConsulta(qryCarregaContas);

   slColigadas := TStringList.Create;

   if Tipo = ccDebito then
   begin
      cbNome := 'cbCaixaBancoDebito';
      edNome := 'edCodigoDebito';
   end;

   if Tipo = ccCredito then
   begin
      cbNome := 'cbCaixaBancoCredito';
      edNome := 'edCodigoCredito';
   end;

   edCodigo := TEdit(procuraComponente(edNome, Tag));
   cbCaixaBanco := TUMComboBox(procuraComponente(cbNome, Tag));

   listaColigadas := DM.GetUsuarioLogado.GetListaColigadasFilhaSelecionada;

   for i := 0 to listaColigadas.Count - 1 do
   begin
     slColigadas.Add(IntToStr(TColigada(listaColigadas[i]).Codigo));
   end;

   slColigadas.Delimiter := ',';

   qryCarregaContas.SQL.Text := SQL_BUSCA_CAIXAS;
   qryCarregaContas.ParamByName('cd_conta').AsInteger := StrToInt(edCodigo.Text);
   qryCarregaContas.SQL.Text := ReplaceStr( qryCarregaContas.SQL.Text, ':cd_coligadas', slColigadas.DelimitedText );
   qryCarregaContas.Open;

   { Se não possui nenhuma conta caixa/banco vinculada não deixa usuário
     selecionar a mesma }
   if qryCarregaContas.RecordCount = 0 then
   begin
      Result := False;
      Exit;
   end;

   cbCaixaBanco.Items.Clear;
   { Mostra combo caso tenha pelo menos UMA conta caixa vinculada }
   cbCaixaBanco.Visible := (qryCarregaContas.RecordCount > 0);

   cbCaixaBanco.ItemIndex := 0;

   Selecionado := 0;

   while not qryCarregaContas.Eof do
   begin
      itemCombo := TItemCombo.Create(
         qryCarregaContas.FieldByName('cd_caixa').AsString,
         qryCarregaContas.FieldByName('ds_caixa').AsString,
         qryCarregaContas.FieldByName('cd_coligada').AsInteger
      );

      if qryCarregaContas.FieldByName('cd_caixa').AsInteger = Caixa then
      begin
         Selecionado := qryCarregaContas.RecNo;
      end;

      cbCaixaBanco.Items.AddObject(itemCombo.descricao, itemCombo);

      qryCarregaContas.Next;
   end;

   { Caso existe Caixas para selecionar joga o foco na combo pois se não pula
   a ordem dos tabs no form }
   if cbCaixaBanco.Enabled and Self.Visible then
   begin
      cbCaixaBanco.SetFocus;
   end;

   { se só tiver um caixa vinculado mostra o mesmo }
   if qryCarregaContas.RecordCount = 1 then
   begin
      cbCaixaBanco.ItemIndex := 0;
   end;

   { se é informado um código de caixa o sistema ja carrega a combo selecionada }
   if Caixa <> -1 then
   begin
      cbCaixaBanco.ItemIndex := Selecionado - 1;
   end;
end;

procedure TfrmLancamentosManuais.carregaCriterios;
var
   item: TItemCombo;
begin

  // Varre apenas os centros de custos filhos do centro de custo repassado
  cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(DM.GetUsuarioLogado.GetColigadaLogada.Codigo);
  cdsCentroCustos.Filtered := True;

  cdsCentroCustos.First;
  while not cdsCentroCustos.Eof do
  begin
    item := TItemCombo.Create(
         cdsCentroCustosCD_CENTRO.AsString,
         cdsCentroCustosDS_CENTRO.AsString,
         cdsCentroCustosCD_CLASSIFICACAO.AsString,
         cdsCentroCustosTP_CENTRO.AsString
    );

    cbCriterios1.Items.AddObject(item.descricao, item);

    cdsCentroCustos.Next;
  end;
end;

procedure TfrmLancamentosManuais.carregaProximaChave;
begin
   edChave.Text := IntToStr(GetProximaChave());    
end;

procedure TfrmLancamentosManuais.carregaTiposTitulos;
var
   item: TItemCombo;
begin
   qryTiposTitulo.Close;
   qryTiposTitulo.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryTiposTitulo.Open;

   while not qryTiposTitulo.Eof do
   begin
      item := TItemCombo.Create(
         qryTiposTitulo.FieldByName('cd_tipo_titulo').AsString,
         qryTiposTitulo.FieldByName('ds_tipo_titulo').AsString
      );

      cbTipoTitulo1.Items.AddObject(item.descricao, item);

      qryTiposTitulo.Next;
   end;
end;

procedure TfrmLancamentosManuais.cbCaixaBancoCredito1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.cbCaixaBancoCredito1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.cbCaixaBancoDebito1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.cbCaixaBancoDebito1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.cbColigadas1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.cbColigadasLancChange(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.cbCriterios1Change(Sender: TObject);
var
   i, nrAbaAtual: Integer;
   edPorcentagem: TEdit;
   edValorRateio, edValorTotal: TUMEditMonetario;
   cbCriterio, cbRateio: TUMComboBox;
   edClassificacao: TMaskEdit;
   itemCombo: TItemCombo;
   slCriteriosRateio: TStringList;
   vlPercentualRestante, vlRateioRestante: Double;
begin
   habilitaSalvarEdicao(True);

   // Recupera a guia selecionada pelo usuário
   nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

   cbCriterio := TUMComboBox(Sender);
   cbRateio := TUMComboBox(procuraComponente('cbRateio', nrAbaAtual));
   edPorcentagem := TEdit(procuraComponente('edPorcentagem', nrAbaAtual));
   edValorRateio :=  TUMEditMonetario(procuraComponente('ed_vlRateio', nrAbaAtual));
   edValorTotal :=  TUMEditMonetario(procuraComponente('edValor', nrAbaAtual));
   edClassificacao := TMaskEdit(procuraComponente('ed_cdClassificacao', nrAbaAtual));

   // Se não selecionou centro de custo, então nao faz nada
   if ( cbCriterio.ItemIndex = -1 ) then
   begin
      Exit;
   end;

   // Verifica se possui um valor total digitado válido digitado, caso contrário
   // envia o usuário para o campo para digitar o valor total
   if not( edValorTotal.getValorDouble() > 0) then
   begin
      Mensagem(
         'Informe um valor para o lançamento',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      edValorTotal.SetFocus;
      cbCriterio.ItemIndex := -1;

      Exit;
   end;

   // Inicia os campos de valores para o rateio como zero
   edPorcentagem.Text := '0';
   edValorRateio.setValorDouble('0');

   // Preencher o percentual e o valor com base no restante que falta para
   // preencher o total (100% - percentualExistente)
   vlPercentualRestante := RoundFloat(100 - getPercentualTotalRateios(), 2);
   if vlPercentualRestante > 0 then
   begin
      vlRateioRestante := RoundFloat(edValorTotal.getValorDouble() - getValorTotalRateios(), 2);

      edPorcentagem.Text := FloatToStr(vlPercentualRestante);
      edValorRateio.setValorDouble(FloatToStr(vlRateioRestante));
   end;

   // Pega o centro de custo selecionado
   itemCombo := TItemCombo(cbCriterio.Items.Objects[cbCriterio.ItemIndex]);

   // Preenche a classificação de acordo com o centro de custo selecionado
   edClassificacao.EditText := itemCombo.variavel;

   // Limpa a combo de rateios
   cbRateio.Clear;

   // Se foi selecionado um centro de custo analitico (variavel2 = 1)
   // apresenta apenas a possíbilidade de rateio ESP (ESPECIFICO)
   if itemCombo.variavel2 = '1' then
   begin
      // Adiciona o único item ESP e seleciona ele
      itemCombo := TItemCombo.Create('ESP', 'ESP');
      cbRateio.Items.AddObject(itemCombo.descricao, itemCombo);
      cbRateio.ItemIndex := 0;

      // Desabilita a combo
      cbRateio.Enabled := False;
      Exit;
   end;

   // Busca os critérios de rateio válidos para o centro de custo selecionado
   slCriteriosRateio := getCriteriosRateio(StrToInt(itemCombo.getCodigo()));

   // Preenche a combo de critérios de acordo com o centro de custo selecionado
   for i := 0 to slCriteriosRateio.Count - 1 do
   begin
      itemCombo := TItemCombo.Create(
         slCriteriosRateio[i],
         slCriteriosRateio[i]
      );

      cbRateio.Items.AddObject(itemCombo.descricao, itemCombo);
   end;

   // Ativa a combo de critérios de rateio
   cbRateio.Enabled := True;
   // Não seleciona nenhum critério por padrão
   cbRateio.ItemIndex := -1;
   
end;

procedure TfrmLancamentosManuais.cbCriterios1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
   begin
      Perform(Wm_NextDlgCtl,0,0);
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.cbRateio1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
   begin
      Perform(Wm_NextDlgCtl,0,0);
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.cbTipoTitulo1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.cbTipoTitulo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.cbTipoTitulo1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.criaAba;
var
   i, j: Integer;
begin

   if (edCodigoDebito1.Text <> '') and (edCodigoCredito1.Text <> '') then
   begin
      Mensagem('Você está realizando um lançamento simples, lançamentos simples não podem ser divididos.', 'Aviso', MB_ICONWARNING+MB_OK, Handle);
      tcLancamentos.TabIndex := 0;
      Exit;
   end;

   // Verifica se usuário clicou na ultima aba (aba para adicionar outras abas)
   if tcLancamentos.TabIndex = (tcLancamentos.Tabs.Count-1) then
   begin

      Inc(abasCriadas);

      // Cria a nova aba com o nome do count de abas que é sempre (Quantidade+1)
      tcLancamentos.Tabs.Add(IntToStr(abasCriadas));

      // Move a aba (+) para o final
      tcLancamentos.Tabs.Move(tcLancamentos.TabIndex, (tcLancamentos.Tabs.Count-1));

      // Move a seleção para a nova aba criada
      tcLancamentos.TabIndex := (tcLancamentos.Tabs.Count-2);

      // Cria os campos da nova aba
      CriaCampos(abasCriadas);

      tcLancamentosChange(nil);
      
   end;
end;

procedure TfrmLancamentosManuais.CriaBitBtn(ButtonCopia: TBitBtn;
  ParentPai: TWinControl; index: Integer);
var
   Button: TBitBtn;
begin
   Button := TBitBtn.Create(Self);

   Button.Parent := ParentPai;
   Button.Name := StringReplace(ButtonCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   Button.Tag := Index;
   Button.Top := ButtonCopia.Top;
   Button.Height := ButtonCopia.Height;
   Button.Width := ButtonCopia.Width;
   Button.Left := ButtonCopia.Left;
   Button.Font := ButtonCopia.Font;
   Button.Caption := ButtonCopia.Caption;
   Button.TabOrder := ButtonCopia.TabOrder;

   //Eventos
   Button.OnClick := ButtonCopia.OnClick;
end;

procedure TfrmLancamentosManuais.CriaButton(ButtonCopia: TButton;
  ParentPai: TWinControl; index: Integer);
var
   Button: TButton;
begin
   Button := TButton.Create(Self);

   Button.Parent := ParentPai;
   Button.Name := StringReplace(ButtonCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   Button.Tag := Index;
   Button.Top := ButtonCopia.Top;
   Button.Height := ButtonCopia.Height;
   Button.Width := ButtonCopia.Width;
   Button.Left := ButtonCopia.Left;
   Button.Font := ButtonCopia.Font;
   Button.Caption := ButtonCopia.Caption;
   Button.TabOrder := ButtonCopia.TabOrder;

   if (StringReplace(ButtonCopia.Name, '1', '', [rfReplaceAll]) = 'btInserir') or
      (StringReplace(ButtonCopia.Name, '1', '', [rfReplaceAll]) = 'btAlterar') or
      (StringReplace(ButtonCopia.Name, '1', '', [rfReplaceAll]) = 'btExcluir')
   then
   begin
      Button.Visible := False;
   end;

   //Eventos
   Button.OnClick := ButtonCopia.OnClick;
end;

procedure TfrmLancamentosManuais.CriaCampos(Index: Integer);
var
   i: Integer;
begin
   i := 0;
   
   while True do
   begin
      if i >= tcLancamentos.ControlCount then exit;

      if TControl(tcLancamentos.Controls[i]).Tag = 1 then
      begin
         if (tcLancamentos.Controls[i] as TComponent) is TLabel then
         begin
            CriaLabel(
               (tcLancamentos.Controls[i] as TLabel),
               tcLancamentos,
               Index
            );
         end;

         if (tcLancamentos.Controls[i] as TComponent) is TStringGrid then
         begin
            CriaStringGrid(
               (tcLancamentos.Controls[i] as TStringGrid),
               tcLancamentos,
               Index
            );
         end;

         if (tcLancamentos.Controls[i] as TComponent) is TUMComboBox then
         begin
            CriaComboBox(
               (tcLancamentos.Controls[i] as TUMComboBox),
               tcLancamentos,
               Index
            );
         end;

         if (tcLancamentos.Controls[i] as TComponent) is TSpeedButton then
         begin
            CriaSpeedButton(
               (tcLancamentos.Controls[i] as TSpeedButton),
               tcLancamentos,
               Index
            );
         end;

         if (tcLancamentos.Controls[i].ClassType = TEdit) then
         begin
            CriaEdit(
               (tcLancamentos.Controls[i] as TEdit),
               tcLancamentos,
               Index
            );
         end;

         if tcLancamentos.Controls[i].ClassType = TUMEditMonetario then
         begin
            CriaEditMonetario(
               (tcLancamentos.Controls[i] as TUMEditMonetario),
               tcLancamentos,
               Index
            );
         end;

         if (tcLancamentos.Controls[i] as TComponent) is TPanel then
         begin
            CriaPanel(
               (tcLancamentos.Controls[i] as TPanel),
               tcLancamentos,
               Index
            );
         end;
      end;

      inc(i);
   end;
end;

procedure TfrmLancamentosManuais.CriaComboBox(ComboBoxCopia: TUMComboBox;
  ParentPai: TWinControl; index: Integer);
var
   ComboBox: TUMComboBox;
begin
   ComboBox := TUMComboBox.Create(Self);

   ComboBox.Parent := ParentPai;
   ComboBox.Name := StringReplace(ComboBoxCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(index);
   ComboBox.Tag := Index;
   ComboBox.Top := ComboBoxCopia.Top;
   ComboBox.Height := ComboBoxCopia.Height;
   ComboBox.Width := ComboBoxCopia.Width;
   ComboBox.Left := ComboBoxCopia.Left;
   ComboBox.Font := ComboBoxCopia.Font;
   ComboBox.Items := ComboBoxCopia.Items;
   ComboBox.Style := ComboBoxCopia.Style;
//   ComboBox.Enabled := ComboBoxCopia.Enabled;
   ComboBox.TabOrder := ComboBoxCopia.TabOrder;
   ComboBox.Visible := ComboBoxCopia.Visible;

   // Eventos
   ComboBox.OnChange := ComboBoxCopia.OnChange;
   ComboBox.OnClick := ComboBoxCopia.OnClick;
   ComboBox.OnKeyDown := ComboBoxCopia.OnKeyDown;
   ComboBox.OnKeyPress := ComboBoxCopia.OnKeyPress;
end;

procedure TfrmLancamentosManuais.CriaEdit(EditCopia: TEdit; ParentPai: TWinControl; Index: Integer);
var
   Edit: TEdit;
begin
   Edit := TEdit.Create(Self);

   Edit.Parent := ParentPai;
   Edit.Name := StringReplace(EditCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   Edit.Tag := Index;
   Edit.Top := EditCopia.Top;
   Edit.Height := EditCopia.Height;
   Edit.Width := EditCopia.Width;
   Edit.Left := EditCopia.Left;
   Edit.Text := '';
   Edit.Font := EditCopia.Font;
   Edit.Enabled := EditCopia.Enabled;
   Edit.TabOrder := EditCopia.TabOrder;

   // Adiciona eventos aos novos campos
   Edit.OnEnter := EditCopia.OnEnter;
   Edit.OnChange := EditCopia.OnChange;
   Edit.OnKeyPress := EditCopia.OnKeyPress;
   Edit.OnKeyDown := EditCopia.OnKeyDown;
   Edit.OnExit := EditCopia.OnExit;
end;

procedure TfrmLancamentosManuais.CriaEditMonetario(EditCopia: TUMEditMonetario;
  ParentPai: TWinControl; index: Integer);
var
   Edit: TUMEditMonetario;
begin
   Edit := TUMEditMonetario.Create(Self);

   Edit.Parent := ParentPai;
   Edit.Name := StringReplace(EditCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   Edit.Tag := Index;
   Edit.Top := EditCopia.Top;
   Edit.Height := EditCopia.Height;
   Edit.Width := EditCopia.Width;
   Edit.Left := EditCopia.Left;
   Edit.Text := '';
   Edit.Font := EditCopia.Font;
   Edit.Enabled := EditCopia.Enabled;
   Edit.TabOrder := EditCopia.TabOrder;
   Edit.Mascara := EditCopia.Mascara;
   Edit.CasasDecimais := EditCopia.CasasDecimais;
   Edit.EnterProximoCampo := True;

   // Adiciona eventos aos novos campos
   Edit.OnExit := EditCopia.OnExit;
   Edit.OnChange := EditCopia.OnChange;
end;

procedure TfrmLancamentosManuais.CriaLabel(LabelCopia: TLabel; ParentPai: TWinControl; index: Integer);
var
   LabelNovo: TLabel;
begin
   LabelNovo := TLabel.Create(Self);

   LabelNovo.Parent := ParentPai;
   LabelNovo.Name := StringReplace(LabelCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   LabelNovo.Tag := Index;
   LabelNovo.Top := LabelCopia.Top;
   LabelNovo.Height := LabelCopia.Height;
   LabelNovo.Width := LabelCopia.Width;
   LabelNovo.Left := LabelCopia.Left;
   LabelNovo.Caption := LabelCopia.Caption;
   LabelNovo.Font := LabelCopia.Font;

   if StringReplace(LabelCopia.Name, '1', '', [rfReplaceAll]) = 'lbRateios' then
   begin
      LabelNovo.Visible := False;
      LabelNovo.Caption := 'Sem rateio'
   end;
end;

procedure TfrmLancamentosManuais.CriaMaskEdit(MaskEdit: TMaskEdit;
  ParentPai: TWinControl; index: Integer);
var
   Edit: TMaskEdit;
begin
   Edit := TMaskEdit.Create(Self);

   Edit.Parent := ParentPai;
   Edit.Name := StringReplace(MaskEdit.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   Edit.Tag := Index;
   Edit.Top := MaskEdit.Top;
   Edit.Height := MaskEdit.Height;
   Edit.Width := MaskEdit.Width;
   Edit.Left := MaskEdit.Left;
   Edit.Font := MaskEdit.Font;
   Edit.Enabled := MaskEdit.Enabled;
   Edit.EditMask := MaskEdit.EditMask;
   Edit.Text := '';
   Edit.TabOrder := MaskEdit.TabOrder;

   // Adiciona eventos aos novos campos
   Edit.OnChange := MaskEdit.OnChange;
   Edit.OnExit := MaskEdit.OnExit;
   Edit.OnKeyDown := MaskEdit.OnKeyDown;
   Edit.OnKeyPress := MaskEdit.OnKeyPress;
end;

procedure TfrmLancamentosManuais.CriaPanel(PanelCopia: TPanel; ParentPai: TWinControl; index: Integer);
var
   Panel: TPanel;
   i: Integer;
begin
   Panel := TPanel.Create(Self);

   Panel.Parent := ParentPai;
   Panel.Name := StringReplace(PanelCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   Panel.Width := PanelCopia.Width;
   Panel.Height := PanelCopia.Height;
   Panel.Left := PanelCopia.Left;
   Panel.Top := PanelCopia.Top;
   Panel.Tag := Index;
   Panel.Font := PanelCopia.Font;
   Panel.BevelOuter := PanelCopia.BevelOuter;
   Panel.Align := PanelCopia.Align;
   Panel.Caption := '';
   Panel.TabOrder := PanelCopia.TabOrder;
   Panel.Visible := False;

   for i := 0 to PanelCopia.ControlCount - 1 do
   begin

      if (PanelCopia.Controls[i] as TComponent) is TUMComboBox then
      begin
         CriaComboBox(
            (PanelCopia.Controls[i] as TUMComboBox),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TButton then
      begin
         CriaButton(
            (PanelCopia.Controls[i] as TButton),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TSpeedButton then
      begin
         CriaSpeedButton(
            (PanelCopia.Controls[i] as TSpeedButton),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TVirtualStringTree then
      begin
         CriaVirtualStringTree(
            (PanelCopia.Controls[i] as TVirtualStringTree),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TStringGrid then
      begin
         CriaStringGrid(
            (PanelCopia.Controls[i] as TStringGrid),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TUMEditMonetario then
      begin
         CriaEditMonetario(
            (PanelCopia.Controls[i] as TUMEditMonetario),
            Panel,
            Index
         );
      end else if (PanelCopia.Controls[i] as TComponent) is TEdit then
      begin
         CriaEdit(
            (PanelCopia.Controls[i] as TEdit),
            Panel,
            Index
         );
      end;
      
      if (PanelCopia.Controls[i] as TComponent) is TLabel then
      begin
         CriaLabel(
            (PanelCopia.Controls[i] as TLabel),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TMaskEdit then
      begin
         CriaMaskEdit(
            (PanelCopia.Controls[i] as TMaskEdit),
            Panel,
            Index
         );
      end;
   end;
end;

procedure TfrmLancamentosManuais.CriaSpeedButton(SpeedButtonCopia: TSpeedButton;
  ParentPai: TWinControl; index: Integer);
var
   SpeedButton: TSpeedButton;  
begin
   SpeedButton := TSpeedButton.Create(Self);

   SpeedButton.Parent := ParentPai;
   SpeedButton.Name := StringReplace(SpeedButtonCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(Index);
   SpeedButton.Tag := Index;
   SpeedButton.Top := SpeedButtonCopia.Top;
   SpeedButton.Height := SpeedButtonCopia.Height;
   SpeedButton.Width := SpeedButtonCopia.Width;
   SpeedButton.Left := SpeedButtonCopia.Left;
   SpeedButton.Font := SpeedButtonCopia.Font;
   SpeedButton.Glyph := SpeedButtonCopia.Glyph;
   SpeedButton.Caption := SpeedButtonCopia.Caption;

   //Eventos
   SpeedButton.OnClick := SpeedButtonCopia.OnClick;
end;

procedure TfrmLancamentosManuais.CriaStringGrid(GridCopia: TStringGrid;
  ParentPai: TWinControl; index: Integer);
var
   StringGrid: TStringGrid;
begin
   StringGrid := TStringGrid.Create(Self);

   StringGrid.Parent := ParentPai;
   StringGrid.Name := StringReplace(GridCopia.Name, '1', '', [rfReplaceAll]) + IntToStr(index);
   StringGrid.Top := GridCopia.Top;
   StringGrid.Height := GridCopia.Height;
   StringGrid.Width := GridCopia.Width;
   StringGrid.Left := GridCopia.Left;
   StringGrid.Font := GridCopia.Font;
   StringGrid.Tag := Index;
   StringGrid.Options := GridCopia.Options;
   StringGrid.RowCount := 2;
   StringGrid.ColCount := 1;
   StringGrid.TabOrder := GridCopia.TabOrder;

   StringGrid.Cells[0, 0] := 'Centro';
   StringGrid.ColWidths[0] := 50;

   StringGrid.ColCount := StringGrid.ColCount + 1;

   StringGrid.Cells[1, 0] := 'Descrição';
   StringGrid.ColWidths[1] := 270;

   StringGrid.ColCount := StringGrid.ColCount + 1;

   StringGrid.Cells[2, 0] := 'Valor';
   StringGrid.ColWidths[2] := 50;
end;

procedure TfrmLancamentosManuais.CriaVirtualStringTree(
  GridVirtualStringTree: TVirtualStringTree; ParentPai: TWinControl;
  index: Integer);
var
   VirtualStringTree : TVirtualStringTree;
begin
   VirtualStringTree := TVirtualStringTree.Create(Self);

   VirtualStringTree.Parent := ParentPai;
   VirtualStringTree.Name := StringReplace(GridVirtualStringTree.Name, '1', '', [rfReplaceAll]) + IntToStr(index);
   VirtualStringTree.Top := GridVirtualStringTree.Top;
   VirtualStringTree.Height := GridVirtualStringTree.Height;
   VirtualStringTree.Width := GridVirtualStringTree.Width;
   VirtualStringTree.Left := GridVirtualStringTree.Left;
   VirtualStringTree.Font := GridVirtualStringTree.Font;
   VirtualStringTree.BevelKind := GridVirtualStringTree.BevelKind;
   VirtualStringTree.BevelOuter := GridVirtualStringTree.BevelOuter;
   VirtualStringTree.BorderStyle := GridVirtualStringTree.BorderStyle;
   VirtualStringTree.EditDelay := GridVirtualStringTree.EditDelay;
   VirtualStringTree.EditDelay := GridVirtualStringTree.EditDelay;   
   VirtualStringTree.Tag := Index;
   VirtualStringTree.TabOrder := GridVirtualStringTree.TabOrder;
   VirtualStringTree.TreeOptions := GridVirtualStringTree.TreeOptions;
   VirtualStringTree.Header := GridVirtualStringTree.Header;

   VirtualStringTree.OnGetText := GridVirtualStringTree.OnGetText;
   VirtualStringTree.OnNewText := GridVirtualStringTree.OnNewText;

end;

procedure TfrmLancamentosManuais.edCodigoCredito1Change(Sender: TObject);
var
   edCodigoCredito, edCodigoDebito: TEdit;
   Tag: Integer;
begin
   Tag := TEdit(Sender).Tag;

   edCodigoCredito := TEdit(procuraComponente('edCodigoCredito', Tag));
   edCodigoDebito := TEdit(procuraComponente('edCodigoDebito', Tag));

   // Verificação para não permitir usuário inserir Código de Débito e Crédito
   // na mesma aba e o lançamento NÃO é simples
   if (tcLancamentos.Tabs.Count > 2) then
   begin
      if ( edCodigoCredito.Text <> '') and
         ( edCodigoDebito.Text <> '') then
      begin
         Mensagem(
            'Você não pode realizar um lançamento partido onde uma parte do lançamento é destinada a crédito e débito ao mesmo tempo.',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );
         TEdit(Sender).Text := '';
      end;
   end;

   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edCodigoCredito1Enter(Sender: TObject);
begin
   CreditoAtual := TEdit(Sender).Text;
end;

procedure TfrmLancamentosManuais.edCodigoCredito1Exit(Sender: TObject);
var
   Tag: Integer;
begin
   Tag := TEdit(Sender).Tag;

   { Verifica se alterou alguma coisa }
   if CreditoAtual <> TEdit(Sender).Text then
   begin
      VerificaCredito(Tag);
   end;
end;

procedure TfrmLancamentosManuais.edCodigoCredito1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   Tag: Integer;  
begin
   Tag := TEdit(Sender).Tag;

   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.edCodigoCredito1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(Key in ['0'..'9', #8]) then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edCodigoDebito1Change(Sender: TObject);
var
   edCodigoCredito, edCodigoDebito: TEdit;
   Tag: Integer;
begin
   Tag := TEdit(Sender).Tag;

   edCodigoCredito := TEdit(procuraComponente('edCodigoCredito', Tag));
   edCodigoDebito := TEdit(procuraComponente('edCodigoDebito', Tag));

   // Verificação para não permitir usuário inserir Código de Débito e Crédito
   // na mesma aba e o lançamento NÃO é simples
   if (tcLancamentos.Tabs.Count > 2) then
   begin
      if ( edCodigoCredito.Text <> '') and
         ( edCodigoDebito.Text <> '') then
      begin
         Mensagem(
            'Você não pode realizar um lançamento partido onde uma parte do lançamento é destinada a crédito e débito ao mesmo tempo.',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );
         TEdit(Sender).Text := '';
      end;
   end;

   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edCodigoDebito1Enter(Sender: TObject);
begin
   DebitoAtual := TEdit(Sender).Text;
end;

procedure TfrmLancamentosManuais.edCodigoDebito1Exit(Sender: TObject);
var
   Tag: Integer;
begin
   Tag := TEdit(Sender).Tag;

   { Verifica se alterou alguma coisa }
   if DebitoAtual <> TEdit(Sender).Text then
   begin
      VerificaDebito(Tag);
   end;
end;

procedure TfrmLancamentosManuais.edCodigoDebito1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   Tag: Integer;  
begin
   Tag := TEdit(Sender).Tag;

   if Key = VK_RETURN then
   begin
      Key := 0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;

procedure TfrmLancamentosManuais.edCodigoDebito1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(Key in ['0'..'9', #8]) then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edCodigoHist1Change(Sender: TObject);
var
   index: String;
begin
   index := IntToStr(TEdit(Sender).Tag);

   if TEdit(Sender).Text = '' then
   begin
      TEdit(Self.FindComponent('edDescHist' + index)).Text := '';
   end;

   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edCodigoHist1Exit(Sender: TObject);
var
   Tag: Integer;
begin
   Tag := TEdit(Sender).Tag;

   verificaHistorico(Tag);
end;

procedure TfrmLancamentosManuais.edCodigoHist1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Key := 0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;

procedure TfrmLancamentosManuais.edCodigoHist1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edComplemento1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edComplemento1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Key := 0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   end;
end;

procedure TfrmLancamentosManuais.edComplemento1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edDataChange(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edDataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.edDataVencimento1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edDataVencimento1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.edDataVencimento1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edFornecedor1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edFornecedor1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edNumeroDoc1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edNumeroDoc1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.edNumeroDoc1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edNumeroParcelas1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
end;

procedure TfrmLancamentosManuais.edNumeroParcelas1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.edNumeroParcelas1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(Key in ['0'..'9', #8]) then
   begin
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edPorcentagem1Exit(Sender: TObject);
var
   nrAbaAtual: Integer;
   edPorcentagem: TEdit;
   edValorRateio, edValorTotal: TUMEditMonetario;
   vlInformado, vlRateio: Double;
begin
  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  edPorcentagem := TEdit(Sender);
  edValorRateio :=  TUMEditMonetario(procuraComponente('ed_vlRateio', nrAbaAtual));
  edValorTotal :=  TUMEditMonetario(procuraComponente('edValor', nrAbaAtual));

  // Verifica se a porcentagem informada é válida
  try
    vlInformado := RoundFloat(StrToFloat(edPorcentagem.Text), 2);

    if vlInformado < 0 then
    begin
      raise Exception.Create('');
    end;

  except
    edPorcentagem.Text := '';
    edValorRateio.Text := '';
    Exit;
  end;

  // Seta o valor informado (arredondado para 2 casas)
  edPorcentagem.Text := FloatToStr(vlInformado);

  // Cálcula o valor com base na porcentagem informada
  vlRateio := (vlInformado * edValorTotal.getValorDouble())/100;
  vlRateio := RoundFloat(vlRateio, 2);

  // Atribui o valor do rateio cálculado ao campo
  edValorRateio.setValorDouble(FloatToStr(vlRateio));
end;

procedure TfrmLancamentosManuais.edPorcentagem1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
   begin
      Perform(Wm_NextDlgCtl,0,0);
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.edValor1Change(Sender: TObject);
var
   indice: integer;
begin
   habilitaSalvarEdicao(True);
   atualizaValores();

   indice := TUMEditMonetario(Sender).Tag;

   TUMEditMonetario(procuraComponente('ed_vlRateio', indice)).setValorDouble(
      TUMEditMonetario(procuraComponente('edValor', indice)).Text
   );

   TUMEditMonetario(procuraComponente('ed_vlRateio', indice)).Enabled := true;
end;

procedure TfrmLancamentosManuais.edValor1Exit(Sender: TObject);
begin
   atualizaValores();
end;

procedure TfrmLancamentosManuais.ed_vlRateio1Exit(Sender: TObject);
var
   nrAbaAtual: Integer;
   edPorcentagem: TEdit;
   edValorRateio, edValorTotal: TUMEditMonetario;
   vlInformado, vlPorcentagem: Double;
begin
  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  edValorRateio := TUMEditMonetario(Sender);
  edPorcentagem :=  TEdit(procuraComponente('edPorcentagem', nrAbaAtual));
  edValorTotal :=  TUMEditMonetario(procuraComponente('edValor', nrAbaAtual));

  // Verifica se o valor informado é válido
  try
    vlInformado := RoundFloat(edValorRateio.getValorDouble(), 2);

    if vlInformado < 0 then
    begin
      raise Exception.Create('');
    end;

  except
    edValorRateio.Text := '';
    edPorcentagem.Text := '';
    Exit;
  end;

  // Cálcula o valor com base na porcentagem informada
  vlPorcentagem := (edValorRateio.getValorDouble() * 100)/ edValorTotal.getValorDouble();
  vlPorcentagem := RoundFloat(vlPorcentagem, 2);

  // Atribui o valor do rateio cálculado ao campo
  edPorcentagem.Text :=  FloatToStr( vlPorcentagem );
end;

procedure TfrmLancamentosManuais.ed_vlRateio1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
   begin
      Perform(Wm_NextDlgCtl,0,0);
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.trocaAba(Index: Integer);
var
   i: Integer;
   edCodigoDebito, edCodigoCredito: TEdit;
begin

   // Esconde todos de outras abas
   for i := 0 to tcLancamentos.ControlCount - 1 do
   begin
      if TControl(tcLancamentos.Controls[i]).Tag <> index then
      begin
         TControl(tcLancamentos.Controls[i]).Visible := False;
      end;
   end;

   { DÉBITO }
   TLabel(procuraComponente('lbDebito', Index)).Visible := True;
   TEdit(procuraComponente('edCodigoDebito', Index)).Visible := True;

   if verificaConta(Index, ccDebito) = tcCaixaBanco then
   begin
      TUMComboBox(procuraComponente('cbCaixaBancoDebito', Index)).Visible := True;
   end
   else
   begin
      TEdit(procuraComponente('edDescDebito', Index)).Visible := True;
   end;
   
   { CRÉDITO }
   TLabel(procuraComponente('lbCredito', Index)).Visible := True;
   TEdit(procuraComponente('edCodigoCredito', Index)).Visible := True;

   if verificaConta(Index, ccCredito) = tcCaixaBanco then
   begin
      TUMComboBox(procuraComponente('cbCaixaBancoCredito', Index)).Visible := True;
   end
   else
   begin
      TEdit(procuraComponente('edDescCredito', Index)).Visible := True;
   end;

   { VALOR }
   TLabel(procuraComponente('lbValor', Index)).Visible := True;
   TUMEditMonetario(procuraComponente('edValor', Index)).Visible := True;

   { HISTÓRICO }
   TLabel(procuraComponente('lbHistorico', Index)).Visible := True;
   TEdit(procuraComponente('edCodigoHist', Index)).Visible := True;
   TEdit(procuraComponente('edDescHist', Index)).Visible := True;

   { COMPLEMENTO }
   TLabel(procuraComponente('lbComplemento', Index)).Visible := True;
   TEdit(procuraComponente('edComplemento', Index)).Visible := True;

   { RATEIOS }
   if slAbasComRateio.Values['pnRateios' + IntToStr(Index)] = 'ativo' then
   begin
      TPanel(procuraComponente('pnRateios', Index)).Visible := True;
   end;

   { COMPROMISSO }
   if slAbasComCompromisso.Values['pnCompromisso' + IntToStr(Index)] = 'ativo' then
   begin
      TPanel(procuraComponente('pnCompromisso', Index)).Visible := True;
   end;

   { BOTÕES }
   TSpeedButton(procuraComponente('sbFecha', index)).Visible := True;
   TSpeedButton(procuraComponente('sbBuscaDebito', index)).Visible := True;
   TSpeedButton(procuraComponente('sbBuscaCredito', index)).Visible := True;
   TSpeedButton(procuraComponente('sbBuscaHistoricos', index)).Visible := True;

   CreditoAtual := '';
   DebitoAtual := '';
   
   AtualizaTelaAba(Index);
end;

function TfrmLancamentosManuais.ValidaAbaAtual(Index: Integer): Boolean;
var
   CodigoCredito, CodigoDebito, CodigoHistorico,
   NumeroDocumento, CodigoFornecedor,
   DataVencimento, NumeroParcelas: TEdit;
   ValorLancamento: TUMEditMonetario;
   ValorTotalRateios: Double;
   CentroDeCusto, TipoTitulo, cbColigada, cbCaixaBancoDebito, cbCaixaBancoCredito: TUMComboBox;
   objArvoreRateio: TVirtualStringTree;
   pnRateios: TPanel;
   i: Integer;
begin
   CentroDeCusto := TUMComboBox(Self.FindComponent('cbCriterios' + IntToStr(index)));

   CodigoCredito := TEdit(Self.FindComponent('edCodigoCredito' + IntToStr(index)));
   CodigoDebito := TEdit(Self.FindComponent('edCodigoDebito' + IntToStr(index)));
   CodigoHistorico := TEdit(Self.FindComponent('edCodigoHist' + IntToStr(index)));

   ValorLancamento := TUMEditMonetario(Self.FindComponent('edValor' + IntToStr(index)));

   pnRateios := TPanel(procuraComponente('pnRateios', Index));

   cbCaixaBancoDebito := TUMComboBox(procuraComponente('cbCaixaBancoDebito', Index));
   cbCaixaBancoCredito := TUMComboBox(procuraComponente('cbCaixaBancoCredito', Index));

   objArvoreRateio := TVirtualStringTree(procuraComponente('vstCentros', Index));

   // Verifica se inseriu alguma conta
   if (CodigoCredito.Text = '') and (CodigoDebito.Text = '') then
   begin
      Mensagem('Informe uma conta.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      CodigoDebito.SetFocus;
      Result := False;
      Exit;
   end;

   // Verifica se é um lançamento multiplo
   if tcLancamentos.Tabs.Count > 2 then
   begin
      // Se nenhuma das contas forem válidas
      if not(qryBuscaContas.Locate('cd_conta', StrToIntDef(CodigoCredito.Text, 0), [loCaseInsensitive])) and
         not(qryBuscaContas.Locate('cd_conta', StrToIntDef(CodigoDebito.Text, 0), [loCaseInsensitive])) then
      begin
         Mensagem('Informe um código de conta válido.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         Result := False;
         Exit;
      end;
   end;

   if (ValorLancamento.Text = '') or (ValorLancamento.getValorDouble = 0) then
   begin
      Mensagem('Informe um valor para este lançamento.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      ValorLancamento.SetFocus;
      Result := False;
      Exit;
   end;

   if (verificaConta(Index, ccDebito) = tcCaixaBanco) then
   begin
      if cbCaixaBancoDebito.Enabled and
         not(cbCaixaBancoDebito.ItemIndex > -1) then
      begin
         Mensagem('Selecione um caixa para a conta débito.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         cbCaixaBancoDebito.SetFocus;
         Result := False;
         Exit;         
      end;
   end;

   if (verificaConta(Index, ccCredito) = tcCaixaBanco) then
   begin
      if cbCaixaBancoCredito.Enabled and
         not(cbCaixaBancoCredito.ItemIndex > -1) then
      begin
         Mensagem('Selecione um caixa para a conta crédito.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         cbCaixaBancoCredito.SetFocus;
         Result := False;
         Exit;         
      end;
   end;

   // Verifica se o valor do rateio esta igual ao valor do lançamento
   if pnRateios.Visible then
   begin
      if (CentroDeCusto.ItemIndex > -1) and (TItemCombo(CentroDeCusto.Items.Objects[CentroDeCusto.ItemIndex]).codigo = '-1') then
      begin
         ValorTotalRateios := getValorTotalRateios();

         if ValorTotalRateios > ValorLancamento.getValorDouble then
         begin
            Mensagem('Valor total de rateio ultrapassou o valor do lançamento.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
            Result := False;
            Exit;
         end;

         if ValorLancamento.getValorDouble() > ValorTotalRateios then
         begin
            Mensagem('Valor do lançamento maior que o valor total de rateio.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
            ValorLancamento.SetFocus;
            Result := False;
            Exit;
         end;
      end;
   end;

   // Verifica se usuário DEVE selecionar um centro de custo
   if pnRateios.Visible then
   begin
      // Verifica se usuário informou algum rateio (a árvore possui algum filho)
      if objArvoreRateio.GetFirst() = nil then
      begin
         Mensagem(
            'Informe um rateio para prosseguir!',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );
         Result := False;
         Exit;
      end;
   end;

   // Verifica se DEVE inserir um compromisso
   if TPanel(Self.FindComponent('pnCompromisso' + IntToStr(index))).Visible then
   begin

      // Carrega Combo Tipo de Título
      TipoTitulo := TUMComboBox(procuraComponente('cbTipoTitulo', index));

      // Carrega Edit Data de Vencimento
      DataVencimento := TEdit(procuraComponente('edDataVencimento', index));

      // Carrega Edit Número de Parcelas
      NumeroParcelas := TEdit(procuraComponente('edNumeroParcelas', index));

      // Carrega Edit Codigo do Fornecedor
      CodigoFornecedor := TEdit(procuraComponente('edFornecedor', index));
      
      // Carrega Edit Nº do Documento
      NumeroDocumento := TEdit(procuraComponente('edNumeroDoc', index));

      // Verifica se SELECIONOU um típo de título
      if TipoTitulo.ItemIndex = -1 then
      begin
         Mensagem(
            'Selecione um tipo de título para o compromisso.',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );
         
         TipoTitulo.SetFocus;
         Result := False;
         Exit;
      end;

      // Verifica se informou o número de documento do compromisso
      if NumeroDocumento.Text = '' then
      begin
         Mensagem('Informe o nº de documento do compromisso.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         NumeroDocumento.SetFocus;
         Result := False;
         Exit;
      end;

      // Verifica se selecionou um fornecedor para o compromisso
      if CodigoFornecedor.Text = '' then
      begin
         Mensagem('Selecione um fornecedor para o compromisso.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         Result := False;
         Exit;
      end;

      // Verifica se a data de vencimento do compromisso é valida
      if not(verificaDataValida(DataVencimento.Text)) then
      begin
         Mensagem('Data de vencimento do compromisso inválida.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         DataVencimento.SetFocus;
         Result := False;
         Exit;
      end;

      // Verifica se informou um número de parcelas
      if NumeroParcelas.Text = '' then
      begin
         Mensagem('Informe um número de parcelas para o compromisso.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         NumeroParcelas.SetFocus;
         Result := False;
         Exit;
      end;
   end;
   
   Result := True;
end;

function TfrmLancamentosManuais.verificaConta(index: Integer; categoria: TCategoriaConta): TTiposConta;
const
   // Busca todas contas que tem o codigo de classificação MENOR ou IGUAL ao
   // código da conta informada no campo
   SQL_BUSCA_CONTAS = ' SELECT '+
      '  cd_classificacao, '+
      '  cd_conta, '+
      '  cd_grupo_contas '+
      ' FROM '+
      '  fin_config_plano_contas '+
      ' WHERE '+
      '  cd_grupo_contas IS NOT NULL '+
      '  AND cd_coligada_matriz = :cd_coligada_matriz '+
      '  AND cd_classificacao <= (SELECT cd_classificacao FROM fin_config_plano_contas '+
      '     WHERE cd_conta = :cd_conta AND cd_coligada_matriz = :cd_coligada_matriz )';

   SQL_BUSCA_CLASSIFICACAO = ' SELECT '+
      '  cd_classificacao '+
      ' FROM '+
      '  fin_config_plano_contas '+
      ' WHERE '+
      '  cd_conta = :cd_conta '+
      '  AND cd_coligada_matriz = :cd_coligada_matriz ';
var
   campoCodigo: TEdit;
   qyBuscaPlanoContas, qyBuscaClassificacao: TUMZReadOnlyQuery;
   comparacao, separador: String;
   classificacao: TStringList;
   i: Integer;
begin

   // Inicializa variáveis
   comparacao := '';
   separador := '';

   // Por padrão retorna erro
   Result := tcErro;

   DM.CriarConsulta(qyBuscaPlanoContas);
   DM.CriarConsulta(qyBuscaClassificacao);

   qyBuscaPlanoContas.SQL.Text := SQL_BUSCA_CONTAS;
   qyBuscaClassificacao.SQL.Text := SQL_BUSCA_CLASSIFICACAO;

   // Verifica se é para retornar o tipo da conta DEBITO
   if categoria = ccDebito then
   begin
      campoCodigo := TEdit(procuraComponente('edCodigoDebito', index));

      if campoCodigo.Text = '' then
      begin
         Exit;
      end;
   end;

   // Verifica se é para retornar o tipo da conta CREDITO
   if categoria = ccCredito then
   begin
      campoCodigo := TEdit(procuraComponente('edCodigoCredito', index));

      if campoCodigo.Text = '' then
      begin
         Exit;
      end;
   end;

   if isCaixaBanco(StrToInt(campoCodigo.Text)) then
   begin
      Result := tcCaixaBanco;
      Exit;
   end;

   qyBuscaPlanoContas.ParamByName('cd_conta').AsInteger :=
      StrToInt(campoCodigo.Text);
   qyBuscaPlanoContas.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   qyBuscaPlanoContas.Open;

   qyBuscaClassificacao.ParamByName('cd_conta').AsInteger :=
      StrToInt(campoCodigo.Text);
   qyBuscaClassificacao.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

   qyBuscaClassificacao.Open;

   classificacao := TStringList.Create;

   SplitString(qyBuscaClassificacao.FieldByName('cd_classificacao').AsString, '.', classificacao);

   for I := 0 to classificacao.Count - 1 do
   begin
      comparacao := comparacao + separador +  classificacao.Strings[i];
      separador := '.';

      if (qyBuscaPlanoContas.Locate('cd_classificacao', comparacao, [loCaseInsensitive])) then
      begin
         Result := TTiposConta(qyBuscaPlanoContas.FieldByName('cd_grupo_contas').AsInteger);
      end;
   end;
end;

function TfrmLancamentosManuais.VerificaContaUsada(Conta: String; Tag: Integer; Tipo: TCategoriaConta): Boolean;
var
   CodigoConta, i, TagInterna: Integer;
   NomeProcuraConta: String;
begin

   CodigoConta := StrToInt(Conta);

   if Tipo = ccDebito then
   begin
      NomeProcuraConta := 'edCodigoDebito';
   end;

   if Tipo = ccCredito then
   begin
      NomeProcuraConta := 'edCodigoCredito';
   end;

   for I := 0 to Self.ComponentCount - 2 do
   begin
      if (Self.Components[i].Tag <> 0) and
         (TagInterna <> Self.Components[i].Tag) and
         (Tag <> Self.Components[i].Tag) then
      begin
         TagInterna := Self.Components[i].Tag;

         if StrToIntDef(TEdit(procuraComponente(NomeProcuraConta, TagInterna)).Text, 0) = StrToInt(Conta) then
         begin
            Result := True;
            Exit;
         end;
      end;
   end;

   Result := False;
end;

procedure TfrmLancamentosManuais.VerificaCredito(Tag: Integer);
var
   edCodigoCredito, edDescCredito: TEdit;
   pnRateios, pnCompromisso: TPanel;
   Erro: String;
   isContaGeraCompromisso, isContaGeraRateioDeb,
   isContaGeraRateioCred, isContaCaixaBanco: Boolean;
begin
   edCodigoCredito := TEdit(procuraComponente('edCodigoCredito', Tag));
   edDescCredito := TEdit(procuraComponente('edDescCredito', Tag));

   pnRateios := TPanel(procuraComponente('pnRateios', Tag));
   pnCompromisso := TPanel(procuraComponente('pnCompromisso', Tag));

   Erro := '';

   // Verifica se é uma conta existente
   if not(qryBuscaContas.Locate('cd_conta', edCodigoCredito.Text, [loCaseInsensitive])) then
   begin
      Erro := 'Conta inexistente.';
   end;

   // Verifica se é diferente de NADA e verifica se esta conta não esta sendo
   // usada em outra aba por outro campo crédito
   if (edCodigoCredito.Text <> '') and
      VerificaContaUsada(edCodigoCredito.Text, Tag, ccCredito) then
   begin
      Erro := 'Conta ja está sendo utilizada neste lançamento.';
   end;

   // Verifica se a conta DÉBITO é uma conta do tipo Caixa/Banco
   isContaCaixaBanco := (verificaConta(Tag, ccCredito) = tcCaixaBanco);

   { Se for uma conta do tipo Caixa/Banco carregas todas
   as contas caixa vinculadas a este plano}
   if isContaCaixaBanco then
   begin
      if not CarregaCaixasBancos(Tag, ccCredito) then
      begin
         Erro := 'Esta conta Caixa/Banco não possui vínculo com uma conta caixa.';
      end;
   end;

   { Se NÃO for uma conta caixa banco limpa a combo e deixa ela desabilitada }
   if not isContaCaixaBanco then
   begin
      LimpaCaixasBanco(Tag, ccCredito);
   end;

   // Verifica se é uma conta válida
   if Erro = '' then
   begin
      edDescCredito.Text := qryBuscaContas.FieldByName('ds_conta').AsString;

      // Verifica se é uma conta que gera um compromisso
      isContaGeraCompromisso := (verificaConta(Tag, ccCredito) = tcPassivo);
      
      // Verifica se a conta DÉBITO é uma conta do tipo Caixa/Banco
      isContaCaixaBanco := (verificaConta(Tag, ccCredito) = tcCaixaBanco);

      { Se for uma conta do tipo Caixa/Banco carregas todas
      as contas caixa vinculadas a este plano}
      if isContaCaixaBanco then
      begin
         CarregaCaixasBancos(Tag, ccCredito);
      end;

      { Se NÃO for uma conta caixa banco limpa a combo e deixa ela desabilitada }
      if not isContaCaixaBanco then
      begin
         LimpaCaixasBanco(Tag, ccCredito);
      end;

      // Verifica se é uma conta que gera compromisso E se o usuário alterou
      // algum número
      if isContaGeraCompromisso and (edCodigoCredito.Text <> CreditoAtual) then
      begin
         LimpaCompromisso(Tag);
         MontaCompromisso(Tag);
      end;

      // Apaga o compromisso caso NÃO seja uma conta que gera compromisso
      if not isContaGeraCompromisso then
      begin
         LimpaCompromisso(Tag);
      end;

      // Verifica se a conta crédito gera RATEIO
      isContaGeraRateioCred := (verificaConta(Tag, ccCredito) = tcResultado);
      
      // Verifica se a conta débito gera RATEIO
      isContaGeraRateioDeb := (verificaConta(Tag, ccDebito) = tcResultado);

      { Se a conta crédito for uma conta que gere rateio e tenha sido alterada
      e também a conta de débito não seja uma conta de rateio (se for uma conta
      de rateio ja está preenchido) deve limpar o rateio atual e montar uma
      nova estrutura para preencher }
      if isContaGeraRateioCred and
         (CreditoAtual <> edCodigoCredito.Text) and
         not isContaGeraRateioDeb then
      begin
         LimpaRateio(Tag);
         MontaRateio(Tag);
      end;

      // Verifica se nenhuma das contas gera o rateio
      if not isContaGeraRateioCred and not isContaGeraRateioDeb then
      begin
         LimpaRateio(Tag);
      end;
   end;

   // Verifica se encontrou algo inválido
   if Erro <> '' then
   begin

      // Verifica se existe algum número informado
      if edCodigoCredito.Text <> '' then
      begin
         Mensagem(
            'Impedimentos: ' + Erro,
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );

         edCodigoCredito.Text := '';
         edCodigoCredito.SetFocus;

      end;

      // Apaga o rateio caso a tenha encontrado algo invalido e a conta de
      // debito NÃO seja do tipo RESULTADO
      if verificaConta(Tag, ccDebito) <> tcResultado then
      begin
         LimpaRateio(Tag);
      end;

      // Encontrou algo inválido, sempre limpa o compromisso
      LimpaCompromisso(Tag);

      { Se for uma conta inválida sempre limpa a combo de Caixas }
      LimpaCaixasBanco(Tag, ccCredito);

      // Encontrou algo inválido, sempre limpa o descrição da conta
      edDescCredito.Text := '';
   end;
end;

function TfrmLancamentosManuais.verificaDataValida(Texto: String): Boolean;
var 
   Data : String;
begin

   Result := True;

   try
      StrToDate(Texto);
   except
      Result := False;
   end;   
end;

procedure TfrmLancamentosManuais.VerificaDebito(Tag: Integer);
var
   edCodigoDebito, edDescDebito: TEdit;
   pnRateios: TPanel;
   Erro: String;
   isContaGeraRateioDeb, isContaGeraRateioCred, isContaCaixaBanco: Boolean;
begin
   edCodigoDebito := TEdit(procuraComponente('edCodigoDebito', Tag));
   edDescDebito := TEdit(procuraComponente('edDescDebito', Tag));

   pnRateios := TPanel(procuraComponente('pnRateios', Tag));

   Erro := '';

   // Verifica se é uma conta existente
   if not(qryBuscaContas.Locate('cd_conta', edCodigoDebito.Text, [loCaseInsensitive])) then
   begin
      Erro := 'Conta inexistente.';
   end;

   { Verifica se esta conta não está sendo
   usada em outra aba por outro campo débito e também verifica se ela não está
   em branco }
   if (edCodigoDebito.Text <> '') and 
      VerificaContaUsada(edCodigoDebito.Text, Tag, ccDebito) then
   begin
      Erro := 'Conta ja está sendo utilizada neste lançamento.'
   end;

   // Verifica se a conta DÉBITO é uma conta do tipo Caixa/Banco
   isContaCaixaBanco := (verificaConta(Tag, ccDebito) = tcCaixaBanco);

   { Se for uma conta do tipo Caixa/Banco carregas todas
   as contas caixa vinculadas a este plano}
   if isContaCaixaBanco then
   begin
      if not CarregaCaixasBancos(Tag, ccDebito) then
      begin
         Erro := 'Esta conta Caixa/Banco não possui vínculo com uma conta caixa.';
      end;
   end;

   { Se NÃO for uma conta caixa banco limpa a combo e deixa ela desabilitada }
   if not isContaCaixaBanco then
   begin
      LimpaCaixasBanco(Tag, ccDebito);
   end;

   // Verifica se é uma conta válida
   if Erro = '' then
   begin
      edDescDebito.Text := qryBuscaContas.FieldByName('ds_conta').AsString;

      // Verifica se a conta DÉBITO gera um rateio
      isContaGeraRateioDeb := (verificaConta(Tag, ccDebito) = tcResultado);

      // Verifica se a conta CRÉDITO gera um rateio
      isContaGeraRateioCred := (verificaConta(Tag, ccCredito) = tcResultado);

      { Se a conta débito for uma conta que gere rateio e tenha sido alterada
      e também a conta de crédito não seja uma conta de rateio (se for uma conta
      de rateio ja está preenchido) deve limpar o rateio atual e montar uma
      nova estrutura para preencher }
      if isContaGeraRateioDeb and
         (DebitoAtual <> edDescDebito.Text) and
         not isContaGeraRateioCred then
      begin
         LimpaRateio(Tag);
         MontaRateio(Tag);
      end;

      { Se nenhuma das contas crédito/débito são contas de rateio, limpa o
      rateio atual }
      if not isContaGeraRateioDeb and not isContaGeraRateioCred then
      begin
         LimpaRateio(Tag);
      end;
   end;

   { Verifica se encontrou algo inválido }
   if Erro <> '' then
   begin
   
      { Verifica se esta conta não esta em branco }
      if edCodigoDebito.Text <> '' then
      begin
         Mensagem(
            'Impedimentos: ' + Erro,
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );

         edCodigoDebito.Text := '';
         edCodigoDebito.SetFocus;
      end;

      { Limpa o rateio somente se a conta de crédito não seja uma conta que
      gere rateio }
      if verificaConta(Tag, ccCredito) <> tcResultado then
      begin
         LimpaRateio(Tag);   
      end;

      { Se for uma conta inválida sempre limpa a combo de Caixas }
      LimpaCaixasBanco(Tag, ccDebito);

      { Se for conta inválida sempre limpa a descrição da conta }
      edDescDebito.Text := '';
   end;
end;

procedure TfrmLancamentosManuais.verificaHistorico(Tag: Integer);
var
   edCodigoHist, edDescHist: TEdit;
begin

   edCodigoHist := TEdit(procuraComponente('edCodigoHist', Tag));
   edDescHist := TEdit(procuraComponente('edDescHist', Tag));

   if qryBuscaHistoricos.Locate('cd_historico', edCodigoHist.Text, [loCaseInsensitive]) then
   begin
      edDescHist.Text :=
         qryBuscaHistoricos.FieldByName('ds_historico').AsString;
   end
   else
   begin
      if edCodigoHist.Text <> '' then
      begin
         Mensagem('Codigo de histórico inválido.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         edCodigoHist.SetFocus;
      end;
      
      edDescHist.Text := '';
   end;
end;

function TfrmLancamentosManuais.verificaRateio: Boolean;
var
   i: Integer;
   contaGeraCompromisso: Boolean;
begin
   Result := False;
   contaGeraCompromisso := False;

   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (StartsText('pnCompromisso', Self.Components[i].Name)) and
         (TPanel(Self.Components[i]).Visible) then
      begin
         contaGeraCompromisso := True;
      end;
   end;

   if not contaGeraCompromisso then
   begin
      Result := True;
      Exit;
   end;

   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (StartsText('cbCriterios', Self.Components[i].Name)) and
         (TUMComboBox(Self.Components[i]).Enabled) then
      begin
         Result := True;
      end;
   end;
end;

procedure TfrmLancamentosManuais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(slAbasComCompromisso);
   
   Action := caFree;
end;

procedure TfrmLancamentosManuais.FormCreate(Sender: TObject);
begin
   abasCriadas := 1;

   // Por padrão o modo de tratamento da tela é inserção
   modoTela := mtInserir;
   
   qryBuscaContas.Close;
   qryBuscaContas.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryBuscaContas.Open;

   qryBuscaHistoricos.Close;
   qryBuscaHistoricos.Open;

   qryCadastroContasAtivas.Close;
   qryCadastroContasAtivas.Open;

   {
     Realiza o mapeamento das estruturas de banco de dados para clientDataSet,
     o objetivo é realizar as consultas recursivas apenas em programação evitando
     consumo excessivo de banco de dados
   }
   mapearArvoreCentroCustos();
   
   carregaProximaChave;
   carregaCriterios;
   carregaTiposTitulos;

   DM.CarregaColigadas(cbColigadasLanc);

   slAbasComCompromisso := TStringList.Create;
   slCodigoFornecedores := TStringList.Create;
   slAbasComRateio := TStringList.Create;
end;

procedure TfrmLancamentosManuais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_F6) then
   begin
      btCancelar.Click;
   end;

   if (Key = VK_F12) and
      (btSalvaFecha.Enabled) then
   begin
      btSalvaFecha.Click;
   end;

   if (Key = VK_F5) and
      (btSalvar.Enabled) then
   begin
      btSalvar.Click;
   end;
end;

procedure TfrmLancamentosManuais.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = '+' then
   begin
      if not(ValidaAbaAtual(StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]))) then
      begin
         Key := #0;
         Exit;
      end;

      tcLancamentos.TabIndex := (tcLancamentos.Tabs.Count-1);
      criaAba;
      TEdit(procuraComponente('edCodigoDebito', abasCriadas)).SetFocus;
      Key := #0;
   end;
end;

procedure TfrmLancamentosManuais.FormShow(Sender: TObject);
begin
   FormatoTela.Compromisso := False;
   FormatoTela.Rateio := False;
   FormatoTela.Normal := True;

   ed_cdClassificacao1.EditMask := DM.variavel_parametro('mascara_plano_custos');

   cbRateio1.Clear;
   if modoTela <> mtAlterar then
   begin
      AtualizaTelaAba(1);
   end;

   edData.SetFocus;
end;

procedure TfrmLancamentosManuais.GeraMovimento(tipo_acao: TTipoMovimento;
  cd_titulo, cd_coligada: string; vl_despesa: double);
const
   COD_ACAO_PADRAO = 6;
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

function TfrmLancamentosManuais.getformataValorParaObjeto(
  valor: double): String;
var
   valor_sem_ponto : string;
begin
   valor_sem_ponto := StringReplace(FloatToStr(valor), '.', '', [rfReplaceAll, rfIgnoreCase]);
   Result := StringReplace( valor_sem_ponto, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;

function TfrmLancamentosManuais.GetProximaChave: integer;
var
   qyParametroTitulo : TUMZQuery;
   Rest : string;
begin
   DM.CriarConsulta( qyParametroTitulo );
   qyParametroTitulo.Close();
   qyParametroTitulo.SQL.Clear();
   if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
      qyParametroTitulo.SQl.add('UPDATE parametros SET ds_valor = TO_NUMBER(ds_valor) + 1 WHERE ds_variavel = ''financeiro_cd_chave_contabil'' ')
   else
      qyParametroTitulo.SQl.add('UPDATE parametros SET ds_valor = ds_valor + 1 WHERE ds_variavel = ''financeiro_cd_chave_contabil'' ');
   qyParametroTitulo.ExecSQL;

   Rest := DM.variavel_parametro( 'financeiro_cd_chave_contabil' );

   // Caso o parametro não tenha sido definido ainda (primeiro uso)
   if Rest = '' then begin
      qyParametroTitulo.SQL.Clear();
      qyParametroTitulo.SQl.add('REPLACE INTO parametros (ds_variavel, ds_valor, ds_variavel_usuario, cd_categoria, cd_coligada) ' + ' VALUES (''financeiro_cd_chave_contabil'', (SELECT IFNULL(MAX(cd_chave), 1) from fin_contabil), ''Definie a sequencia da chave da tela de lançamentos contábeis'', 11, 0);');
      qyParametroTitulo.ExecSQL;
      Rest := DM.variavel_parametro( 'financeiro_cd_chave_contabil' );
   end;

   Result := StrToInt(Rest);
end;

procedure TfrmLancamentosManuais.habilitaSalvarEdicao(podeSalvar: Boolean);
begin
   if (modoTela = mtAlterar) and
      not(ValoresDiferentes) then
   begin
      btSalvaFecha.Enabled := podeSalvar;
      btSalvar.Enabled := podeSalvar;
   end;
end;

procedure TfrmLancamentosManuais.InsereRateioMovimento(Valor: Double;
  CodigoMovimento: Integer; CategoriaConta: TCategoriaConta);
var
   valorCompromisso, valorDebito, percValorDebito: Double;
   valorInserir, valorTotalDebitos, percValorRateio: Double;
   valorRateioContaCredito: Double;
   i, k, j, tagAtual, tagRateio: Integer;
   edit: TEdit;
   editValor: TUMEditMonetario;
   objArvoreRateio: TVirtualStringTree;
   node: PVirtualNode;
   data: PCentro;
   qryInsereRateio: TUMZQuery;
   ExecutaRateioCP: TExecucaoRateioCP;
begin
   i := 0;
   j := 0;
   k := 0;

   tagAtual := 0;
   tagRateio := 0;

   valorCompromisso := 0;
   valorDebito := 0;
   valorInserir := 0;
   valorRateioContaCredito := 0;
   valorTotalDebitos := 0;

   DM.CriarConsulta(qryInsereRateio);

   qryInsereRateio.SQL.Text := ' INSERT INTO fin_apropria_te ( '+
      '  cd_movimento_te, '+
      '  cd_conta, '+
      '  cd_coligada, '+
      '  cd_centro, '+
      '  vl_movimento '+
      ' ) '+
      ' VALUES '+
      '  (:cd_movimento_te, :cd_conta, :cd_coligada, :cd_centro, :vl_movimento) ';

   // Realiza a soma de todas as contas debitos resultado cadastradas
   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (tagAtual <> Self.Components[i].Tag) and (Self.Components[i].Tag <> 0) then
      begin
         tagAtual := Self.Components[i].Tag;

         if verificaConta(tagAtual, CategoriaConta) = tcResultado then
         begin
            editValor := TUMEditMonetario(procuraComponente('edValor', tagAtual));
            valorTotalDebitos := valorTotalDebitos + editValor.getValorDouble;
         end;
      end;
   end;

   tagAtual := 0;

   // Percorre todos componentes da tela
   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (tagAtual <> Self.Components[i].Tag) and (Self.Components[i].Tag <> 0) then
      begin
         tagAtual := Self.Components[i].Tag;

         // Verifica se é uma conta debito do tipo RESULTADO
         if verificaConta(tagAtual, CategoriaConta) = tcResultado then
         begin

            // Pega o código da conta e o valor
            if CategoriaConta = ccCredito then
            begin
               edit := TEdit(procuraComponente('edCodigoCredito', tagAtual));
            end;

            if CategoriaConta = ccDebito then
            begin
               edit := TEdit(procuraComponente('edCodigoDebito', tagAtual));
            end;

            editValor := TUMEditMonetario(procuraComponente('edValor', tagAtual));

            // Valor completo
            valorDebito := editValor.getValorDouble;

            percValorDebito := ((valorDebito * 100) / valorTotalDebitos);
            // Pega a porcentagem do valor da conta débito em relação ao
            // total de contas débito RESULTADOS

            objArvoreRateio := TVirtualStringTree(self.FindComponent('vstCentros' + IntToStr(tagAtual)));

            // Percorre o rateio da conta DEBITO RESULTADO
            node := objArvoreRateio.GetFirst();
            while node <> nil do
            begin
              // Pega o conteúdo do nodo
              data := PCentro(objArvoreRateio.GetNodeData(node)^);

              // Desconsiderar centro de custos do tipo sintético (TipoCentro = 2)
              if data.objCentro.TipoCentro = 2 then
              begin
                node := objArvoreRateio.GetNext(node);
                continue;
              end;

              // Porcentagem de quanto representa o valor do rateio atual
               // em relação ao valor total da conta DEBITO RESULTADO
               percValorRateio := RoundFloat((data.valor * 100) / valorDebito, 2);

               valorInserir := (percValorRateio * ((percValorDebito * valor) / 100)) / 100;

               qryInsereRateio.ParamByName('cd_movimento_te').AsInteger :=
                  CodigoMovimento;

               qryInsereRateio.ParamByName('vl_movimento').AsFloat :=
                  valorInserir;

               qryInsereRateio.ParamByName('cd_coligada').AsInteger :=
                  TColigada(cbColigadasLanc.Items.Objects[cbColigadasLanc.ItemIndex]).Codigo;

               qryInsereRateio.ParamByName('cd_centro').AsInteger :=
                  data.objCentro.Centro;

               qryInsereRateio.ParamByName('cd_conta').AsInteger :=
                  StrToInt(edit.Text);

               qryInsereRateio.ExecSQL;

              node := objArvoreRateio.GetNext(node);
            end;

         end;
      end;
   end;
end;

function TfrmLancamentosManuais.NovoCompromisso(cd_pessoa: Integer; nr_documento,
        nr_parcela, dt_vencimento: String; cd_tipo_titulo: Integer;
        ValorTotal: Double; cd_coligada: Integer; vl_parcela: Double;
        despesa, historico: String; HistoricoContabil: Integer;
        DataEmissaoNota, DataCompetencia, DataProvavelPagamento, DataLancamento: String; Modo: TTipoExecucao): TExecucaoCompromisso;
begin
   Result := TExecucaoCompromisso.Create(Modo);

   Result.Situacao := 1;
   Result.FormaPagamento := 0;
   Result.Fornecedor := cd_pessoa;
   Result.NumeroDocumento := nr_documento;
   Result.NumeroParcela := nr_parcela;
   Result.DataVencimento := dt_vencimento;
   Result.TipoTitulo := cd_tipo_titulo;
   Result.ValorTotal := ValorTotal;
   Result.Coligada := cd_coligada;
   Result.Despesa := despesa;
   Result.Historico := historico;
   Result.HistoricoContabil := HistoricoContabil;
   Result.DataEmissaoNota := DataEmissaoNota;
   Result.DataCompetencia := DataCompetencia;
   Result.DataProvavelPagamento := DataProvavelPagamento;
   Result.Valor := vl_parcela;
   Result.DataLancamento := DataLancamento;
end;

function TfrmLancamentosManuais.insereRateios(cd_titulo: TExecucaoCompromisso; cd_coligada: Integer; vl_despesa: Double): TList;
var
   valorCompromisso, valorDebito, percValorDebito: Double;
   valorInserir, valorTotalDebitos, percValorRateio: Double;
   valorRateioContaCredito: Double;
   i, k, j, tagAtual, tagRateio: Integer;
   editDebito: TEdit;
   editValor: TUMEditMonetario;
   objArvoreRateio: TVirtualStringTree;
   node: PVirtualNode;
   data: PCentro;
   qryInsereRateio: TUMZQuery;
   ExecutaRateioCP: TExecucaoRateioCP;
begin
   i := 0;
   j := 0;
   k := 0;

   Result := TList.Create;

   tagAtual := 0;
   tagRateio := 0;
   
   valorCompromisso := 0;
   valorDebito := 0;
   valorInserir := 0;
   valorRateioContaCredito := 0;
   valorTotalDebitos := 0;

   DM.CriarConsulta(qryInsereRateio);

   // Realiza a soma de todas as contas debitos resultado cadastradas
   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (tagAtual <> Self.Components[i].Tag) and (Self.Components[i].Tag <> 0) then
      begin
         tagAtual := Self.Components[i].Tag;

         if verificaConta(tagAtual, ccDebito) = tcResultado then
         begin
            editValor := TUMEditMonetario(procuraComponente('edValor', tagAtual));
            valorTotalDebitos := valorTotalDebitos + editValor.getValorDouble;
         end;
      end;
   end;

   tagAtual := 0;

   // Percorre todos componentes da tela
   for I := 0 to Self.ComponentCount - 1 do
   begin
      if (tagAtual <> Self.Components[i].Tag) and (Self.Components[i].Tag <> 0) then
      begin
         tagAtual := Self.Components[i].Tag;

         // Verifica se é uma conta debito do tipo RESULTADO
         if verificaConta(tagAtual, ccDebito) = tcResultado then
         begin

            // Pega o código da conta e o valor
            editDebito := TEdit(procuraComponente('edCodigoDebito', tagAtual));
            editValor := TUMEditMonetario(procuraComponente('edValor', tagAtual));

            // Valor completo
            valorDebito := editValor.getValorDouble;

            percValorDebito := ((valorDebito * 100) / valorTotalDebitos);
            // Pega a porcentagem do valor da conta débito em relação ao
            // total de contas débito RESULTADOS

            objArvoreRateio := TVirtualStringTree(self.FindComponent('vstCentros' + IntToStr(tagAtual)));

            // Percorre o rateio da conta DEBITO RESULTADO
            node := objArvoreRateio.GetFirst();
            while node <> nil do
            begin
              // Pega o conteúdo do nodo
              data := PCentro(objArvoreRateio.GetNodeData(node)^);

              // Desconsiderar centro de custos do tipo sintético (TipoCentro = 2)
              if data.objCentro.TipoCentro = 2 then
              begin
                node := objArvoreRateio.GetNext(node);
                continue;
              end;

              // Porcentagem de quanto representa o valor do rateio atual
              // em relação ao valor total da conta DEBITO RESULTADO
              percValorRateio := RoundFloat((data.valor * 100) / valorDebito, 2);

              // Com a porcentagem que o valor do meu rateio representa
              // eu vou inserir em fin_apropria_cp a parte que representa a
              // porcentagem do rateio baseado no valor do título
              // com:
              // Codigo do compromisso da conta CREDITO PASSIVO
              // Codigo da coligada do Compromisso da conta CREDITO PASSIVO, 
              // Codigo da conta DEBITO RESULTADO
              // Codigo do centro do rateio da conta DEBITO RESULTADO
              // Valor equivalente a porcentagem do rateio

              ExecutaRateioCP := TExecucaoRateioCP.Create(teInsert);

              valorInserir := (percValorRateio * ((percValorDebito * vl_despesa) / 100)) / 100;

              ExecutaRateioCP.Coligada := cd_coligada;
              ExecutaRateioCP.Conta := StrToInt(editDebito.Text);
              ExecutaRateioCP.Centro := data.objCentro.Centro;
              ExecutaRateioCP.Valor := valorInserir;

              ExecutaRateioCP.SetDependencia(cd_titulo);

              Result.Add(ExecutaRateioCP);

              node := objArvoreRateio.GetNext(node);
            end;

         end;
      end;
   end;
end;

function TfrmLancamentosManuais.isCaixaBanco(Conta: Integer): Boolean;
var
   qryVerificaCaixaBanco: TUMZQuery;
begin

   DM.CriarConsulta(qryVerificaCaixaBanco);

   try

      qryVerificaCaixaBanco.SQL.Text := ' SELECT '+
         '  * '+
         ' FROM '+
         '  fin_cadastro_contas fcc '+
         ' WHERE '+
         '  fcc.cd_plano_conta = :codigo ';

      qryVerificaCaixaBanco.ParamByName('codigo').AsInteger := Conta;
      qryVerificaCaixaBanco.Open;

      if qryVerificaCaixaBanco.RecordCount > 0 then
      begin
         Result := True;
         Exit;
      end;

   finally
      FreeAndNil(qryVerificaCaixaBanco);                              
   end;

   Result := False;
end;

procedure TfrmLancamentosManuais.LimpaCaixasBanco(Tag: Integer;
  Tipo: TCategoriaConta);
var
   NomeCb, NomeEd: String;
   cbCaixaBanco: TUMComboBox;
   edDesc: TEdit;
begin

   if Tipo = ccDebito then
   begin
      NomeCb := 'cbCaixaBancoDebito';
      NomeEd := 'edDescDebito'
   end;

   if Tipo = ccCredito then
   begin
      NomeCb := 'cbCaixaBancoCredito';
      NomeEd := 'edDescCredito';
   end;

   cbCaixaBanco := TUMComboBox(procuraComponente(NomeCb, Tag));
   edDesc := TEdit(procuraComponente(NomeEd, Tag));

   cbCaixaBanco.Items.Clear;
   cbCaixaBanco.Visible := False;

   edDesc.Visible := True;
end;

procedure TfrmLancamentosManuais.LimpaCampos;
var
   i: Integer;
begin
   tcLancamentos.Tabs.Clear;
   tcLancamentos.Tabs.Add('1');
   tcLancamentos.Tabs.Add('+');

   // Percorre todos componentes para remover os que foram criados dinamicamente
   for i := Self.ComponentCount - 1 downto 0 do
   begin

      // Apaga somente os componentes de abas criadas dinamicamente
      if (Self.Components[i].GetParentComponent = tcLancamentos) and
         (Self.Components[i].Tag <> 1)  then
      begin
         Self.Components[i].Destroy;
      end;
   end;

   for i := Self.ComponentCount - 1 downto 0 do
   begin
      // Caso seja um Edit e seja tag 1 somente LIMPA o campo
      if (Self.Components[i].GetParentComponent = tcLancamentos) and
         (Self.Components[i].Tag = 1) then
      begin
         if Self.Components[i] is TEdit then
         begin
            TEdit(Self.Components[i]).Text := '';
         end;

         if Self.Components[i] is TMaskEdit then
         begin
            TMaskEdit(Self.Components[i]).Text := '';
         end;
      end;
   end;
     
   abasCriadas := 1;

   tcLancamentos.TabIndex := 0;

   edTotalDebitos.Text := '';
   edTotalCreditos.Text := '';
   edDiferencas.Text := '';

   LimpaRateio(1);
   LimpaCompromisso(1);

   edData.Text := '  /  /    ';

   trocaAba(StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]));
end;

procedure TfrmLancamentosManuais.MontaCompromisso(Tag: Integer);
var
   pnCompromisso: TPanel;
   qryBuscaFornecedor: TUMZReadOnlyQuery;
begin
   pnCompromisso := TPanel(procuraComponente('pnCompromisso', Tag));

   // Indica que esta aba possui um compromisso a ser criado
   // Usado para controle de abas
   slAbasComCompromisso.Values['pnCompromisso' + IntToStr(Tag)] := 'ativo';

   DM.CriarConsulta(qryBuscaFornecedor);

   // Procura se existe UM e somente UM fornecedor vinculado a conta
   // credito informada, caso exista, o exibe em tela
   qryBuscaFornecedor.SQL.Text := SQL_BUSCA_FORNECEDOR;
   qryBuscaFornecedor.ParamByName('cd_conta').AsInteger :=
      StrToInt(TEdit(procuraComponente('edCodigoCredito', Tag)).Text);
      
   qryBuscaFornecedor.Open;

   if qryBuscaFornecedor.RecordCount = 1 then
   begin
      TEdit(Self.FindComponent('edFornecedor' + IntToStr(Tag))).Text :=
         qryBuscaFornecedor.FieldByName('cd_pessoa').AsString +
         ' - ' +
         qryBuscaFornecedor.FieldByName('nm_pessoa').AsString;

      slCodigoFornecedores.Values[IntToStr(Tag)] :=
         qryBuscaFornecedor.FieldByName('cd_pessoa').AsString;
   end;

   pnCompromisso.Visible := True;

   FormatoTela.Compromisso := True;
   AtualizaTelaAba(Tag);
end;

procedure TfrmLancamentosManuais.MontaRateio(Tag: Integer);
var
   cbCriterios: TUMComboBox;
   btInserir, btAlterar, btExcluir: TButton;
   stRateios: TStringGrid;
   pnRateios: TPanel;
   lbCentroCusto: TLabel;
begin
   // Carrega componentes
   pnRateios := TPanel(procuraComponente('pnRateios', Tag));

   cbCriterios := TUMComboBox(procuraComponente('cbCriterios', Tag));

   lbCentroCusto := TLabel(procuraComponente('lbCentroCusto', Tag));
   // Carrega Componentes
   cbCriterios.ItemIndex := -1;
   cbCriterios.Visible := True;

   lbCentroCusto.Visible := True;

   pnRateios.Visible := True;

   slAbasComRateio.Values[pnRateios.Name] := 'ativo';

   FormatoTela.Rateio := True;
   AtualizaTelaAba(Tag);
end;

procedure TfrmLancamentosManuais.LimpaCompromisso(Tag: Integer);
var
   pnCompromisso: TPanel;
   cbTipoTitulo: TUMComboBox;
   edNumeroDoc, edFornecedor, edDataVencimento, edNumeroParcelas: TEdit;
begin
   pnCompromisso := TPanel(procuraComponente('pnCompromisso', Tag));

   cbTipoTitulo := TUMComboBox(procuraComponente('cbTipoTitulo', Tag));

   edNumeroDoc := TEdit(procuraComponente('edNumeroDoc', Tag));
   edFornecedor := TEdit(procuraComponente('edFornecedor', Tag));
   edDataVencimento := TEdit(procuraComponente('edDataVencimento', Tag));
   edNumeroParcelas := TEdit(procuraComponente('edNumeroParcelas', Tag));

   edNumeroDoc.Text := '';
   edFornecedor.Text := '';
   edDataVencimento.Text := '__/__/____';
   edNumeroParcelas.Text := '';

   cbTipoTitulo.ItemIndex := -1;

   pnCompromisso.Visible := False;

   slAbasComCompromisso.Values[pnCompromisso.Name] := 'inativo';

   FormatoTela.Compromisso := False;
   AtualizaTelaAba(Tag);
end;

procedure TfrmLancamentosManuais.LimpaRateio(Tag: Integer);
var
   cbCriterios: TUMComboBox;
   btInserir, btAlterar, btExcluir: TButton;
   stRateios: TStringGrid;
   pnRateios: TPanel;
   lbCentroCusto, lbRateios: TLabel;
begin
   // Carrega componentes
   pnRateios := TPanel(procuraComponente('pnRateios', Tag));

   cbCriterios := TUMComboBox(procuraComponente('cbCriterios', Tag));

   lbCentroCusto := TLabel(procuraComponente('lbCentroCusto', Tag));
   lbRateios := TLabel(procuraComponente('lbRateios', Tag));

   // Carrega Componentes
   cbCriterios.ItemIndex := -1;
   cbCriterios.Visible := False;

   lbCentroCusto.Visible := False;
   lbRateios.Visible := False;

   pnRateios.Visible := False;

   slAbasComRateio.Values[pnRateios.Name] := 'inativo';

   FormatoTela.Rateio := False;
   AtualizaTelaAba(Tag);
end;

function TfrmLancamentosManuais.procuraComponente(nome: String;
  index: Integer): TComponent;
var
   i: Integer;
begin
   Result := nil;

   for I := 0 to Self.ComponentCount - 1 do
   begin
      if StartsStr(nome, Self.Components[i].Name) and (Self.Components[i].Tag = index) then
      begin
         Result := Self.Components[i];
         Exit;
      end;
   end;
end;

procedure TfrmLancamentosManuais.removeAba(Sender: TObject);
var
   i, index, abaAtual, Cont: Integer;
   stCampos: TStringList;
begin

   index := TComponent(Sender).Tag;

   if index = 1 then
   begin
      Mensagem('Impossível excluir lançamento Nº 1.', 'Aviso', MB_ICONWARNING+MB_OK, Handle);
      Exit;
   end;

   if Mensagem('Tem certeza que deseja remover este lançamento ?', 'Aviso', MB_ICONWARNING+MB_YESNO, Handle) <> mrYes then
   begin
      Exit;
   end;

   for i := Self.ComponentCount - 1 downto 0 do
   begin
      if (Self.Components[i].GetParentComponent = tcLancamentos) and
         (Self.Components[i].Tag = index)  then
      begin
         Self.Components[i].Destroy;
      end;
   end;

   abaAtual := tcLancamentos.TabIndex;

   tcLancamentos.Tabs.Delete(tcLancamentos.TabIndex);

   if abaAtual = tcLancamentos.Tabs.Count-1 then
   begin
      tcLancamentos.TabIndex := tcLancamentos.Tabs.Count-2;
   end
   else
   begin
      tcLancamentos.TabIndex := abaAtual;
   end;

   trocaAba(StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]));
end;

function TfrmLancamentosManuais.SalvaLancamentos: Boolean;
var
   i, k, j, p, indexAtual, codigoLancamento: Integer;
   qryInsere, qryInsereRateios: TUMZQuery;
   cbCriterios, cbTipoTitulo, cbContaCaixaDebito, cbContaCaixaCredito: TUMComboBox;
   GridAux: TStringGrid;
   ValorTotalRateios: Double;
   ExecutaLancamento: TExecucaoLancamento;
   ExecutaRateioLC: TExecucaoRateioLC;
   ExecutaCompromisso, ExecutaCompromissosFilhos: TExecucaoCompromisso;
   ExecutaRateioCP: TExecucaoRateioCP;
   ListaExecucao: TListaExecucao;
   listaExecucaoRateios: TList;
   Movimento: TMovimento;
   MovimentoDebito, MovimentoCredito, ParcelasCompromisso: Integer;
   ValoresParcelas: TStringList;
   ValorCompromissoMinimo, vl_original: Double;
   VencimentoCompromisso: TDateTime;
   CodigoCaixa : Integer;
   cd_titulo_compromisso : String;
   objRateioSalvar : TObjectList;
   EditValorRateio : TUMEditMonetario;
   pnRateios: TPanel;
   FmtSettings: TFormatSettings;
begin
   Result := True;

   ValoresParcelas := TStringList.Create;

   if not(ValidaAbaAtual(StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]))) then
   begin
      Result := False;
      Exit;
   end;

   if tcLancamentos.Tabs.Count = 2 then
   begin
      if edCodigoDebito1.Text = '' then
      begin
         Mensagem('Informe uma conta débito.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         Result := False;
         Exit;
      end;
      
      if edCodigoCredito1.Text = '' then
      begin
         Mensagem('Informe uma conta crédito.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         Result := False;
         Exit;         
      end;
   end;

   if not(verificaDataValida(edData.Text)) then
   begin
      Mensagem('Data inválida.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      edData.Clear;
      edData.SetFocus;
      Result := False;
      Exit;
   end;

   if not(cbColigadasLanc.ItemIndex > 0) then
   begin
      Mensagem('Selecione uma unidade de ensino para o lançamento.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      cbColigadasLanc.SetFocus;
      Result := False;
      Exit;
   end;

   if not verificaRateio then
   begin
      Mensagem('Você possui lançamentos que geram compromisso mas não possui uma '+
         'conta com rateio para ratear os valores do compromisso', 'Avivo', MB_ICONWARNING + MB_OK, Handle);

      Result := False;
      Exit;   
   end;

   DM.CriarConsulta(qryInsere);
   DM.CriarConsulta(qryInsereRateios);

   { SE estiver em modo de alteração deve excluir tudo que está associado a
     este lançamento para criar novamente. Não há problema em excluir os
     lançamentos relacionados a primary key pois os lançamentos são identificados
     pelo cd_chave e não pela primary_key }
     
   if (modoTela = mtAlterar) then
   begin

      ListaExecucao := TListaExecucao.Create;

      { Exclui os lançamentos }
      ExecutaLancamento := TExecucaoLancamento.Create(teDelete, StrToInt(edChave.Text));

      ListaExecucao.Add(ExecutaLancamento);

      { Exclui os rateios do lançamento }
      ExecutaRateioLC := TExecucaoRateioLC.Create(teDelete);
      ExecutaRateioLC.Chave := StrToInt(edChave.Text);

      ListaExecucao.Add(ExecutaRateioLC);

      qryBuscaLancamento.First;

      { Apaga todos os compromissos (compromisso principal e suas parcelas) vinculados ao lançamento }
      while not qryBuscaLancamento.Eof do
      begin
         if (qryBuscaLancamento.FieldByName('cd_titulo').AsInteger <> 0) and
            (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'CP') then
         begin
            ExecutaCompromisso := TExecucaoCompromisso.Create(teDelete);
            ExecutaCompromisso.Titulo := qryBuscaLancamento.FieldByName('cd_titulo').AsInteger;

            ListaExecucao.Add(ExecutaCompromisso);

            { Apaga as apropriações geradas pelos compromissos }
            ExecutaRateioCP := TExecucaoRateioCP.Create(teDelete);
            ExecutaRateioCP.Titulo := qryBuscaLancamento.FieldByName('cd_titulo').AsInteger;

            ListaExecucao.Add(ExecutaRateioCP);
         end;

         if (qryBuscaLancamento.FieldByName('cd_titulo').AsInteger <> 0) and
            ((qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'MV') or
            (qryBuscaLancamento.FieldByName('cd_operacao').AsString = 'MS')) then
         begin
            DM.ExcluirMovimento(qryBuscaLancamento.FieldByName('cd_titulo').AsInteger, qryBuscaLancamento.FieldByName('cd_operacao').AsString);
            DM.setLog(3000, 'Exclusao', qryBuscaLancamento.FieldByName('cd_titulo').AsString, DM.UsuarioLogado.ColigadaLogada, 'Excluiu movimento pela alteração de lançamentos contábeis');
         end;

         qryBuscaLancamento.Next;
      end;

      ListaExecucao.ExecuteAll();
   end;

   ListaExecucao := TListaExecucao.Create;

   // Esse for é percorrido para achar todos componentes que fazem parte de
   // um lançamento.
   for I := 0 to Self.ComponentCount - 2 do
   begin

      // Verifica se a tag é DIFERENTE de 0 pois significa que é um componente de lançamento
      // Verifica também se a tag é diferente da tag que ja entrou alguma vez, pois
      // não precisa inserir o mesmo lançamento duas vezes
      if (Self.Components[i].Tag <> 0) and (indexAtual <> Self.Components[i].Tag) then
      begin
         indexAtual := Self.Components[i].Tag;
         pnRateios := TPanel(procuraComponente('pnRateios', indexAtual));

         if pnRateios.Visible then
         begin
           EditValorRateio := TUMEditMonetario(procuraComponente('edValor', indexAtual));

           ValorTotalRateios := getValorTotalRateios(indexAtual);
           vl_original := EditValorRateio.getValorDouble;

           if ( ValorTotalRateios <> vl_original ) then
           begin
              Mensagem(
                    'O valor não foi 100% apropriado aos centros de custos',
                    'Aviso',
                    MB_ICONWARNING + MB_OK,
                    Handle
              );
              Result := False;
              Exit;
           end;
         end;


         ExecutaLancamento := TExecucaoLancamento.Create(teInsert, StrToInt(edChave.Text));
         ExecutaLancamento.DataMovimento := FormatDateTime('yyyy-mm-dd', StrToDate(edData.Text));
         ExecutaLancamento.Coligada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

         { Operação padrão 'CO' }
         ExecutaLancamento.Operacao := 'CO';

         cbCriterios := TUMComboBox(Self.FindComponent('cbCriterios' + IntToStr(indexAtual)));
            
         if TEdit(Self.FindComponent('edCodigoDebito' + IntToStr(indexAtual))).Text <> '' then
         begin
            ExecutaLancamento.ContaDebito :=
               StrToInt(TEdit(Self.FindComponent('edCodigoDebito' + IntToStr(indexAtual))).Text);
         end;

         if TEdit(Self.FindComponent('edCodigoCredito' + IntToStr(indexAtual))).Text <> '' then
         begin
            ExecutaLancamento.ContaCredito :=
               StrToInt(TEdit(Self.FindComponent('edCodigoCredito' + IntToStr(indexAtual))).Text);
         end;

         ExecutaLancamento.Valor :=
            TUMEditMonetario(procuraComponente('edValor', indexAtual)).getValorDouble;

         { MOVIMENTAÇÃO NA TESOURARIA }

         { Verifica se é uma transferência }
         if (verificaConta(indexAtual, ccDebito) = tcCaixaBanco) and
            (verificaConta(indexAtual, ccCredito) = tcCaixaBanco) and
            (ExecutaLancamento.ContaCredito <> ExecutaLancamento.ContaDebito) then
         begin
            { Significa que o cd_titulo de fin_contabil é uma movimentação }
            ExecutaLancamento.Operacao := 'MV';

            { SAÍDA }

            { Carrega combo das contas caixa }
            cbContaCaixaCredito := TUMComboBox(procuraComponente('cbCaixaBancoCredito', indexAtual));

            Movimento := TMovimento.create;

            Movimento.Historico := TEdit(Self.FindComponent('edComplemento' + IntToStr(indexAtual))).Text;
            Movimento.CodAcao := DM.BuscarCodigoAcaoPadrao(7);

            Movimento.ValorMovimento := ExecutaLancamento.Valor;
            Movimento.ValorEmDinheiro := ExecutaLancamento.Valor;

            FmtSettings.DateSeparator := '-';
            FmtSettings.ShortDateFormat := 'yyyy-MM-dd';

            Movimento.EntradaSaida := 2;
            Movimento.DataLiberacao := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
            Movimento.DataMovimento := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
            Movimento.Coligada := TItemCombo(cbContaCaixaCredito.Items.Objects[cbContaCaixaCredito.ItemIndex]).variavel;

            CodigoCaixa := StrToInt(TItemCombo(cbContaCaixaCredito.Items.Objects[cbContaCaixaCredito.ItemIndex]).codigo);

            ExecutaLancamento.Titulo := Movimento.RegistrarMovimentacaoTe(CodigoCaixa);

            { SAÍDA }

            { ENTRADA }

            { Carrega combo das contas caixa }
            cbContaCaixaDebito := TUMComboBox(procuraComponente('cbCaixaBancoDebito', indexAtual));

            Movimento := TMovimento.create;

            Movimento.Historico := TEdit(Self.FindComponent('edComplemento' + IntToStr(indexAtual))).Text;
            Movimento.CodAcao := DM.BuscarCodigoAcaoPadrao(7);
            
            Movimento.ValorMovimento := ExecutaLancamento.Valor;
            Movimento.ValorEmDinheiro := ExecutaLancamento.Valor;

            FmtSettings.DateSeparator := '-';
            FmtSettings.ShortDateFormat := 'yyyy-MM-dd';

            // Reposição da transferência
            Movimento.EntradaSaida := 1;
            Movimento.CodigoSaida := ExecutaLancamento.Titulo;
            Movimento.DataLiberacao := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
            Movimento.DataMovimento := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
            Movimento.Coligada := TItemCombo(cbContaCaixaDebito.Items.Objects[cbContaCaixaDebito.ItemIndex]).variavel;

            CodigoCaixa := StrToInt(TItemCombo(cbContaCaixaDebito.Items.Objects[cbContaCaixaDebito.ItemIndex]).codigo);

            Movimento.RegistrarMovimentacaoTe(CodigoCaixa);

            { ENTRADA }
         end
         else
         begin
            if (verificaConta(indexAtual, ccDebito) = tcCaixaBanco) then
            begin
               { Significa que o cd_titulo de fin_contabil é uma movimentação }
               ExecutaLancamento.Operacao := 'MS';

               { Carrega combo das contas caixa }
               cbContaCaixaDebito := TUMComboBox(procuraComponente('cbCaixaBancoDebito', indexAtual));

               Movimento := TMovimento.create;

               Movimento.Historico := TEdit(Self.FindComponent('edComplemento' + IntToStr(indexAtual))).Text;
               Movimento.CodAcao := 6;

               Movimento.ValorMovimento := ExecutaLancamento.Valor;
               Movimento.ValorEmDinheiro := ExecutaLancamento.Valor;

               FmtSettings.DateSeparator := '-';
               FmtSettings.ShortDateFormat := 'yyyy-MM-dd';
       
               Movimento.EntradaSaida := 1;
               Movimento.DataLiberacao := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
               Movimento.DataMovimento := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
               Movimento.Coligada := TItemCombo(cbContaCaixaDebito.Items.Objects[cbContaCaixaDebito.ItemIndex]).variavel;

               CodigoCaixa := StrToInt(TItemCombo(cbContaCaixaDebito.Items.Objects[cbContaCaixaDebito.ItemIndex]).codigo);

               ExecutaLancamento.Titulo := Movimento.RegistrarMovimentacaoTe(CodigoCaixa);

               InsereRateioMovimento(Movimento.ValorMovimento, ExecutaLancamento.Titulo, ccCredito);
            end;

            if (verificaConta(indexAtual, ccCredito) = tcCaixaBanco) then
            begin
               { Significa que o cd_titulo de fin_contabil é uma movimentação }
               ExecutaLancamento.Operacao := 'MS';

               { Carrega combo das contas caixa }
               cbContaCaixaCredito := TUMComboBox(procuraComponente('cbCaixaBancoCredito', indexAtual));

               Movimento := TMovimento.create;
               
               Movimento.Historico := TEdit(Self.FindComponent('edComplemento' + IntToStr(indexAtual))).Text;
               Movimento.CodAcao := 6;

               Movimento.ValorMovimento := ExecutaLancamento.Valor;
               Movimento.ValorEmDinheiro := ExecutaLancamento.Valor;

               FmtSettings.DateSeparator := '-';
               FmtSettings.ShortDateFormat := 'yyyy-MM-dd';

               Movimento.EntradaSaida := 2;
               Movimento.DataLiberacao := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
               Movimento.DataMovimento := StrToDate(ExecutaLancamento.DataMovimento, FmtSettings);
               Movimento.Coligada := TItemCombo(cbContaCaixaCredito.Items.Objects[cbContaCaixaCredito.ItemIndex]).variavel;

               CodigoCaixa := StrToInt(TItemCombo(cbContaCaixaCredito.Items.Objects[cbContaCaixaCredito.ItemIndex]).codigo);

               ExecutaLancamento.Titulo := Movimento.RegistrarMovimentacaoTe(CodigoCaixa);

               InsereRateioMovimento(Movimento.ValorMovimento, ExecutaLancamento.Titulo, ccDebito);
            end;
         end;

         { MOVIMENTAÇÃO NA TESOURARIA }

         ExecutaLancamento.Historico := 0;

         if TEdit(procuraComponente('edCodigoHist', indexAtual)).Text <> '' then
         begin
            ExecutaLancamento.Historico :=
               StrToInt(TEdit(procuraComponente('edCodigoHist', indexAtual)).Text);
         end;

         ExecutaLancamento.Complemento :=
            TEdit(Self.FindComponent('edComplemento' + IntToStr(indexAtual))).Text;

         { Verifica se DEVE gerar um compromisso }
         if slAbasComCompromisso.Values['pnCompromisso' + IntToStr(indexAtual)] = 'ativo' then
         begin

            cbTipoTitulo := TUMComboBox(Self.FindComponent('cbTipoTitulo' + IntToStr(indexAtual)));

            VencimentoCompromisso := StrToDate(TEdit(Self.FindComponent('edDataVencimento' + IntToStr(indexAtual))).Text);

            ParcelasCompromisso := StrToInt(TEdit(Self.FindComponent('edNumeroParcelas' + IntToStr(indexAtual))).Text);

            ValorCompromissoMinimo := 0;
            
            for p := 1 to ParcelasCompromisso - 1 do
            begin
               ValoresParcelas.Values[IntToStr(p)] := FloatToStr( RoundFloat(TUMEditMonetario(procuraComponente('edValor', indexAtual)).getValorDouble / ParcelasCompromisso, 2));
               ValorCompromissoMinimo := RoundFloat(ValorCompromissoMinimo, 2) + RoundFloat(StrToFloat(ValoresParcelas.Values[IntToStr(p)]), 2);
            end;

            ValoresParcelas.Values[IntToStr(ParcelasCompromisso)] := FloatToStr(RoundFloat(TUMEditMonetario(procuraComponente('edValor', indexAtual)).getValorDouble - ValorCompromissoMinimo, 2));

            ExecutaCompromisso := NovoCompromisso(
               StrToInt(slCodigoFornecedores.Values[IntToStr(indexAtual)]),
               TEdit(procuraComponente('edNumeroDoc', indexAtual)).Text,
               '1',
               FormatDateTime('yyyy-mm-dd', VencimentoCompromisso),
               StrToInt(TItemCombo(cbTipoTitulo.Items.Objects[cbTipoTitulo.ItemIndex]).codigo),
               TUMEditMonetario(procuraComponente('edValor', indexAtual)).getValorDouble,
               TColigada(cbColigadasLanc.Items.Objects[cbColigadasLanc.ItemIndex]).Codigo,
               StrToFloat(ValoresParcelas.Values['1']),
               ExecutaLancamento.Complemento,
               ExecutaLancamento.Complemento,
               ExecutaLancamento.Historico,
               ExecutaLancamento.DataMovimento,
               ExecutaLancamento.DataMovimento,
               FormatDateTime('yyyy-mm-dd', VencimentoCompromisso),
               FormatDateTime('yyyy-mm-dd', DM.DataAtual),
               teInsertPai
            );

            listaExecucaoRateios := insereRateios(
               ExecutaCompromisso,
               TColigada(cbColigadasLanc.Items.Objects[cbColigadasLanc.ItemIndex]).Codigo,
               TUMEditMonetario(procuraComponente('edValor', indexAtual)).getValorDouble
            );

            ExecutaLancamento.SetDependencia(ExecutaCompromisso);
            
            { Significa que o cd_titulo de fin_contabil é um compromisso } 
            ExecutaLancamento.Operacao := 'CP';

            ListaExecucao.Add(ExecutaCompromisso);

            { Vai entrar neste laço somente quando o compromisso possui mais
            de uma parcela }
            for p := 2 to ParcelasCompromisso do
            begin
               ExecutaCompromissosFilhos := TExecucaoCompromisso.Create(teInsert);

               VencimentoCompromisso := VencimentoCompromisso + 30;

               ExecutaCompromissosFilhos := NovoCompromisso(
                  ExecutaCompromisso.Fornecedor,
                  ExecutaCompromisso.NumeroDocumento,
                  IntToStr(p),
                  FormatDateTime('yyyy-mm-dd', VencimentoCompromisso),
                  ExecutaCompromisso.TipoTitulo,
                  ExecutaCompromisso.ValorTotal,
                  ExecutaCompromisso.Coligada,
                  StrToFloat(ValoresParcelas.Values[IntToStr(p)]),
                  ExecutaCompromisso.Despesa,
                  ExecutaCompromisso.Historico,
                  ExecutaCompromisso.HistoricoContabil,
                  ExecutaCompromisso.DataEmissaoNota,
                  ExecutaCompromisso.DataCompetencia,
                  FormatDateTime('yyyy-mm-dd', VencimentoCompromisso),
                  ExecutaCompromisso.DataLancamento,
                  teInsert
               );

               ExecutaCompromissosFilhos.SetDependencia(ExecutaCompromisso);

               ListaExecucao.Add(ExecutaCompromissosFilhos);
            end;

            for j := 0 to listaExecucaoRateios.Count - 1 do
            begin
               ListaExecucao.Add(TExecucaoRateioCP(listaExecucaoRateios.Items[j]));
            end;
         end;

         ListaExecucao.Add(ExecutaLancamento);

         objRateioSalvar := getObjectListaRateios( indexAtual );

         if (TUMComboBox(Self.FindComponent('cbCriterios' + IntToStr(indexAtual))).Visible) then
         begin
            for k := 0 to objRateioSalvar.Count - 1 do
            begin
               ExecutaRateioLC := TExecucaoRateioLC(objRateioSalvar.Items[k]);
               ExecutaRateioLC.SetDependencia(ExecutaLancamento);

               ListaExecucao.Add(ExecutaRateioLC);
            end;
         end;
      end;
   end;

   Result := ListaExecucao.ExecuteAll();
   
   for I := 0 to ListaExecucao.Count - 1 do
   begin
      if ListaExecucao.Item[i] is TExecucaoCompromisso then
      begin
         cd_titulo_compromisso := IntToStr(TExecucaoCompromisso(ListaExecucao.Item[i]).LastInsertID);

         geraMovimento(
            GerarTitulos,
            cd_titulo_compromisso,
            IntToStr(TExecucaoCompromisso(ListaExecucao.Item[i]).Coligada),
            TExecucaoCompromisso(ListaExecucao.Item[i]).Valor
         );
      end;
   end;
end;

procedure TfrmLancamentosManuais.btAlterarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLancamentosManuais.btInserirClick(Sender: TObject);
begin
   if not(SalvaLancamentos) then
   begin
      Exit;
   end;
   
   LimpaCampos;
   carregaProximaChave;
end;

procedure TfrmLancamentosManuais.vstCentros1GetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
   dataCentro: PCentro;
   ds_porcentagem_exibir, ds_valor_exibir : String;
begin
   dataCentro := PCentro(Sender.GetNodeData(Node)^);

   if dataCentro.objCentro.TipoCentro = 2 then
   begin
     ds_porcentagem_exibir := FloatToStr((dataCentro.percentual));
     ds_valor_exibir := FormatFloat('###,###,#0.00', dataCentro.valor);
   end else
   begin
      ds_valor_exibir := FormatFloat('###,###,#0.00', (dataCentro.valor));
      ds_porcentagem_exibir := FloatToStr(RoundFloat(dataCentro.percentual,2));
   end;

   case Column of
      0: CellText := '';
      1: CellText := dataCentro.objCentro.Classificacao;
      2: CellText := dataCentro.objCentro.Descricao;
      3: CellText := ds_porcentagem_exibir;
      4: CellText := ds_valor_exibir;
   end;
end;

procedure TfrmLancamentosManuais.vstCentros1NewText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; NewText: WideString);
var
   objArvoreRateio: TVirtualStringTree;
   vlInformado: Double;
   data: PCentro;
begin
  objArvoreRateio := TVirtualStringTree(Sender);

  // Somente pode editar colunas que possuem percentual ou valor
  if (Column <> 3) AND (Column <> 4) then
  begin
    Exit;
  end;

  // Busca as informações do nodo editado
  data := PCentro(objArvoreRateio.GetNodeData(node)^);

  // Não permite editar centro de custos do tipo sintético (TipoCentro = 2)
  if data.objCentro.TipoCentro = 2 then
  begin
    Exit;
  end;

  // Se a coluna editada é referente ao percentual
  if Column = 3 then
  begin

    // Valida o campo de percentual informado
    try
      vlInformado := RoundFloat(StrToFloat(NewText), 2);

      if vlInformado < 0 then
      begin
        raise Exception.Create('');
      end;

    except
      Mensagem(
         'Valor inválido, digite um valor numérico positivo.',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
      Exit;
    end;

    // Recalcula o valor do rateio deste nodo com base no novo percentual
    data.valor := RoundFloat((vlInformado * data.valor) / data.percentual, 2);
    data.percentual := vlInformado;
  end;

  // Se a coluna editada é referente ao percentual
  if Column = 4 then
  begin

    // Valida o campo de percentual informado
    try
      vlInformado := RoundFloat(StrToFloat(NewText), 2);

      if vlInformado < 0 then
      begin
        raise Exception.Create('');
      end;
      
    except
      Mensagem(
         'Valor inválido, digite um valor numérico positivo.',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
      Exit;
    end;

    // Recalcula o valor do rateio deste nodo com base no novo percentual
    data.percentual := RoundFloat((vlInformado * data.percentual) / data.valor, 2);
    data.valor := vlInformado;
  end;

  // Habilita os botões de salvar na edição
  habilitaSalvarEdicao(True);

  // Atualiza os centros de custos sintéticos
  atualizarCentroCustosSinteticos();

end;

function TfrmLancamentosManuais.getObjectListaRateios( indiceAtual : Integer ) : TObjectList;
var
   node: PVirtualNode;
   data: PCentro;
   objExecucaoRateio: TExecucaoRateioLC;
   objArvoreRateio: TVirtualStringTree;
begin

   // Prepara a lista de objetos de retorno
   Result := TObjectList.Create();

   // Busca o componente da arvore
   objArvoreRateio := TVirtualStringTree(self.FindComponent('vstCentros' + IntToStr(indiceAtual)));

   // Seleciona o primeiro nodo
   node := objArvoreRateio.GetFirst();

   // Varre toda a árvore
   while node <> nil do
   begin
      // Pega o conteúdo do nodo
      data := PCentro(objArvoreRateio.GetNodeData(node)^);

      // Apenas nodos analíticos poderão ser salvos, ou seja, apenas nodos que
      // não possuírem filhos serão adicionados ao retorno
      if node.ChildCount = 0 then
      begin
         objExecucaoRateio := TExecucaoRateioLC.Create( teInsert );

         objExecucaoRateio.Centro := data.objCentro.Centro;
         objExecucaoRateio.Valor := data.valor;
         objExecucaoRateio.SnLancamentoEspecifico := 1;

         if data.lancamento_por_criterio then
         begin
            objExecucaoRateio.SnLancamentoEspecifico := 0;
         end;

         Result.Add( objExecucaoRateio );
      end;

      node := objArvoreRateio.GetNext(node);
   end;
end;

procedure TfrmLancamentosManuais.sbBuscaFornecedores1Click(Sender: TObject);
var
   res: TResultadoFiltroPessoa;
begin
   res := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

   if res.filtrado then
   begin
      TEdit(Self.FindComponent('edFornecedor' + IntToStr(TSpeedButton(Sender).Tag))).Text :=
         IntToStr(res.cd_pessoa) + ' - ' + res.nm_pessoa;

      slCodigoFornecedores.Values[IntToStr(TSpeedButton(Sender).Tag)] :=
         IntToStr(res.cd_pessoa);
   end;
end;

procedure TfrmLancamentosManuais.mapearArvoreCentroCustos();
const
  SQL_CENTRO_CUSTOS_ANALITICOS = ''+
    ' SELECT '+
    '	  cai.cd_centro, '+
    '   cai.cd_coligada, '+
    '	  cai.vl_apropriacao, '+
    '   ca.ds_sigla_lancamento '+
    ' FROM '+
    '	  fin_criterios_apropria ca '+
    '	  INNER JOIN fin_criterios_apropria_itens cai ON ( '+
    '		  ca.cd_apropriacao = cai.cd_apropriacao '+
    '	  ) '+
    ' WHERE '+
    '	  cai.cd_coligada = :cd_coligada';

  SQL_CENTRO_CUSTOS_HIERARQUIA = ''+
    ' SELECT '+
    '   cd_centro, '+
    '   ds_centro, '+
    '   cd_centro_pai, '+
    '   cd_classificacao, '+
    '   tp_centro '+
    ' FROM '+
    '   fin_config_centro_custos '+
    ' WHERE '+
    '   cd_coligada_matriz = :cd_coligada_matriz AND '+
    '   sn_ativo = 1';
var
  cdColigada: Integer;
  qyCentroCustos: TUMZQuery;
begin

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  {
    Verifica se o critério de rateio já está na estrutura de mapeamento (ClientDataSet),
    caso não encontre no mapeamento, mapeia as novas informações.
    Esse ClientDataSet, armazena os valores dos centro de custos analíticos e serve como um cache.
  }
  if not cdsRateioCentroCustos.Locate('CD_COLIGADA', VarArrayOf([cdColigada]), [loCaseInsensitive]) then
  begin

    DM.CriarConsulta(qyCentroCustos);

    qyCentroCustos.Close;
    qyCentroCustos.SQL.Text := SQL_CENTRO_CUSTOS_ANALITICOS;
    qyCentroCustos.ParamByName('cd_coligada').AsInteger := cdColigada;
    qyCentroCustos.Open;

    while not (qyCentroCustos.Eof) do
    begin

      cdsRateioCentroCustos.Insert;
      cdsRateioCentroCustosDS_SIGLA.AsString := qyCentroCustos.FieldByName('ds_sigla_lancamento').AsString;
      cdsRateioCentroCustosCD_CENTRO.AsInteger := qyCentroCustos.FieldByName('cd_centro').AsInteger;
      cdsRateioCentroCustosCD_COLIGADA.AsInteger := qyCentroCustos.FieldByName('cd_coligada').AsInteger;
      cdsRateioCentroCustosVL_APROPRIACAO.AsFloat := qyCentroCustos.FieldByName('vl_apropriacao').AsFloat;
      cdsRateioCentroCustos.Post;

      qyCentroCustos.Next;
    end;

  end;

  {
    Verifica se os centros de custos já estão na estrutura de mapeamento (ClientDataSet),
    caso não encontre no mapeamento, mapeia as novas informações.
    Esse ClientDataSet, armazena a hierarquia dos centro de custos e serve como um cache.
    É armazenado para cada centro de custo os centro de custos pais, todos eles acima do selecionado
    Exemplo:
    centro - pai
    1 - 0 (sem pai)
    2 - 1
    3 - 2
    4 - 2
  }
  if not cdsCentroCustos.Locate('CD_COLIGADA', cdColigada, []) then
  begin

    DM.CriarConsulta(qyCentroCustos);

    qyCentroCustos.Close;
    qyCentroCustos.SQL.Text := SQL_CENTRO_CUSTOS_HIERARQUIA;
    qyCentroCustos.ParamByName('cd_coligada_matriz').AsInteger := cdColigada;
    qyCentroCustos.Open;

    while not (qyCentroCustos.Eof) do
    begin

      cdsCentroCustos.Insert;
      cdsCentroCustosCD_CENTRO.AsInteger := qyCentroCustos.FieldByName('cd_centro').AsInteger;
      cdsCentroCustosCD_CENTRO_PAI.AsInteger := qyCentroCustos.FieldByName('cd_centro_pai').AsInteger;
      cdsCentroCustosCD_COLIGADA.AsInteger := cdColigada;
      cdsCentroCustosDS_CENTRO.AsString := qyCentroCustos.FieldByName('ds_centro').AsString;
      cdsCentroCustosCD_CLASSIFICACAO.AsString := qyCentroCustos.FieldByName('cd_classificacao').AsString;
      cdsCentroCustosTP_CENTRO.AsInteger := qyCentroCustos.FieldByName('tp_centro').AsInteger;
      cdsCentroCustos.Post;

      qyCentroCustos.Next;
    end;
    
  end;

  FreeAndNil(qyCentroCustos);

end;

function TfrmLancamentosManuais.getValorTotalCriterioApropriacao(cdCentroCusto: Integer; dsCriterioRateio: String): Double;
var
  cdColigada, cdCentroAtual: Integer;
begin

  Result := 0;

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  {
    Verifica se o centro de custo possui valor (analítico - último nodo da árvore)
    Nesse caso retorna o valor do centro de custo
  }
  if cdsRateioCentroCustos.Locate('CD_CENTRO;CD_COLIGADA;DS_SIGLA;', VarArrayOf([cdCentroCusto, cdColigada, dsCriterioRateio]), [loCaseInsensitive]) then
  begin
    Result := cdsRateioCentroCustosVL_APROPRIACAO.AsFloat;
    Exit;
  end;

  {
    Verifica se o centro de custo possui filhos
    Nesse caso varre cada um dos filhos chamando essa mesma função recursivamente
  }

  // Varre apenas os centros de custos filhos do centro de custo repassado
  cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
  cdsCentroCustos.Filtered := True;

  cdsCentroCustos.First;
  while not cdsCentroCustos.Eof do
  begin

    // Salva o código do centro de custo que está varrendo no momento
    cdCentroAtual := cdsCentroCustosCD_CENTRO.AsInteger;

    // Soma o valor acumulado
    Result := Result + getValorTotalCriterioApropriacao(cdsCentroCustosCD_CENTRO.AsInteger, dsCriterioRateio);

    // Restaura o Filter para como estava antes de chamar a recursão
    cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
    cdsCentroCustos.Filtered := True;

    // Restaura o clientDataSet como ele estava antes de chamar a recursão
    cdsCentroCustos.Locate('CD_COLIGADA;CD_CENTRO', VarArrayOf([cdColigada, cdCentroAtual]), []);

    cdsCentroCustos.Next;
  end;

  cdsCentroCustos.Filter := '';
  cdsCentroCustos.Filtered := True;

end;

function TfrmLancamentosManuais.getQuantidadeCentrosCustosAnaliticos(
  cdCentroCusto: Integer;
  dsCriterioRateio: String
): Integer;
var
  cdColigada, cdCentroAtual: Integer;
begin

  Result := 0;

  {
    Verifica quantos filhos o centro de custo possui
    Nesse caso varre cada um dos filhos chamando essa mesma função recursivamente
  }

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Varre apenas os centros de custos filhos do centro de custo repassado
  cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
  cdsCentroCustos.Filtered := True;

  cdsCentroCustos.First;
  while not cdsCentroCustos.Eof do
  begin

    // Salva o código do centro de custo que está varrendo no momento
    cdCentroAtual := cdsCentroCustosCD_CENTRO.AsInteger;

    // Soma o valor acumulado
    Result := Result + getQuantidadeCentrosCustosAnaliticos(cdCentroAtual, dsCriterioRateio);

    // Verifica se o centro de custo filho é analítico
    // Para cada filho varrido, soma mais um na quantidade de filhos
    if (isCentroCustoAnalitico(cdCentroAtual, dsCriterioRateio)) then
    begin
      Result := Result + 1;
    end;

    // Restaura o Filter para como estava antes de chamar a recursão
    cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
    cdsCentroCustos.Filtered := True;

    // Restaura o clientDataSet como ele estava antes de chamar a recursão
    cdsCentroCustos.Locate('CD_COLIGADA;CD_CENTRO', VarArrayOf([cdColigada, cdCentroAtual]), []);

    cdsCentroCustos.Next;
  end;

  cdsCentroCustos.Filter := '';
  cdsCentroCustos.Filtered := True;

end;

function TfrmLancamentosManuais.isCentroCustoAnalitico(cdCentroCusto: Integer; dsTipoRateio: String): Boolean;
var
  cdColigada, cdCentroAtual: Integer;
begin

  Result := False;

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Se o critério for ESP (ESPECIFICO) procura o centro de custo sem considerar o critério
  if (dsTipoRateio = 'ESP') and
     cdsRateioCentroCustos.Locate('CD_COLIGADA;CD_CENTRO', VarArrayOf([cdColigada, cdCentroCusto]), []) then
  begin
    Result := True;
    Exit;
  end;

  // Verifica se o centro de custo repassado no critério de rateio selecionado é ANALITICO
  // Se estiver dentro do clienteDataSet de "cdsRateioCentroCustos" significa que possui valor e portanto é analítico
  if cdsRateioCentroCustos.Locate('CD_COLIGADA;CD_CENTRO;DS_SIGLA', VarArrayOf([cdColigada, cdCentroCusto, dsTipoRateio]), [loCaseInsensitive]) then
  begin
    Result := True;
    Exit;
  end;

end;

function TfrmLancamentosManuais.getNodeCentroCusto(cdCentroCusto: Integer): PVirtualNode;
var
  nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  Result := nil;

  // Inicia varrendo o primeiro nodo da árvore
  node := objArvoreRateio.GetFirst();
  while node <> nil do
  begin
    // Recupera as informações do nodo
    data := PCentro(objArvoreRateio.GetNodeData(node)^);

    // Se for um centro de custo analitico lancado como ESP, pula ele
    if (node.Parent = objArvoreRateio.RootNode) and isCentroCustoAnalitico(data.objCentro.Centro, 'ESP') then
    begin
      // Passa para o próximo nodo irmão
      node := objArvoreRateio.GetNext(node);
      continue;
    end;

    // Compara se o centro de custo procurado é o que está sendo varrido
    if cdCentroCusto = data.objCentro.Centro then
    begin
      Result := node;
      Exit;
    end;

    // Passa para o próximo nodo irmão
    node := objArvoreRateio.GetNext(node);
  end;
  
end;

function TfrmLancamentosManuais.getNodeCentroCustoEspecifico(cdCentroCusto: Integer): PVirtualNode;
var
  nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  Result := nil;

  // Inicia varrendo o primeiro nodo da árvore
  node := objArvoreRateio.GetFirst();
  while node <> nil do
  begin
    // Recupera as informações do nodo
    data := PCentro(objArvoreRateio.GetNodeData(node)^);

    // Se for um centro de custo analitico lancado como ESP é o que estamos procurando
    // Compara se o centro de custo procurado é o que está sendo varrido
    if (node.Parent = objArvoreRateio.RootNode) and isCentroCustoAnalitico(data.objCentro.Centro, 'ESP') and
       (cdCentroCusto = data.objCentro.Centro) then
    begin
      Result := node;
      Exit;
    end;

    // Passa para o próximo nodo irmão
    node := objArvoreRateio.GetNext(node);
  end;
  
end;

function TfrmLancamentosManuais.getPercentualTotalRateios(): Double;
var
  nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin
  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Inicia o total com zero
  Result := 0;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Inicia varrendo o primeiro nodo da árvore
  node := objArvoreRateio.GetFirst();
  while node <> nil do
  begin
    // Recupera as informações do nodo
    data := PCentro(objArvoreRateio.GetNodeData(node)^);

    // Acumula o percentual já incluído
    Result := RoundFloat(Result + data.percentual, 2);

    // Passa para o próximo nodo irmão
    node := node.NextSibling;
  end;

end;

function TfrmLancamentosManuais.getValorTotalRateios(nrAbaAtual: Integer = -1): Double;
var
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Se a aba foi repassada uma específica, cálcula o valor total dela
  if nrAbaAtual = -1 then
  begin
     // Recupera a guia selecionada pelo usuário
     nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);
  end;

  // Inicia o total com zero
  Result := 0;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Inicia varrendo o primeiro nodo da árvore
  node := objArvoreRateio.GetFirst();
  while node <> nil do
  begin
    // Recupera as informações do nodo
    data := PCentro(objArvoreRateio.GetNodeData(node)^);

    // Acumula o percentual já incluído
    Result := RoundFloat(Result + data.valor, 2);

    // Passa para o próximo nodo irmão
    node := node.NextSibling;
  end;

end;

function TfrmLancamentosManuais.isRateioValido(): Boolean;
var
  nrAbaAtual: Integer;
  edValorTotalGeral, edValorRateio: TUMEditMonetario;
  edClassificacao: TMaskEdit;
  edPorcentagem: TEdit;
  cbRateio, cbCriterios: TUMComboBox;
  vlTotalGeral, vlPercentualTotalRateios,
  vlTotalRateios: Double;
begin
  Result := False;

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  // Recupera os campos que serão validados
  edValorTotalGeral := TUMEditMonetario(procuraComponente('edValor', nrAbaAtual));
  edValorRateio := TUMEditMonetario(procuraComponente('ed_vlRateio', nrAbaAtual));
  edPorcentagem := TEdit(procuraComponente('edPorcentagem', nrAbaAtual));
  cbRateio := TUMComboBox(procuraComponente('cbRateio', nrAbaAtual));
  cbCriterios := TUMComboBox(procuraComponente('cbCriterios', nrAbaAtual));

  // Recupera os valores que serão validados
  vlTotalGeral := edValorTotalGeral.getValorDouble;
  vlPercentualTotalRateios := getPercentualTotalRateios();
  vlTotalRateios := getValorTotalRateios();

  { VERIFICA SE UM CENTRO DE CUSTO FOI SELECIONADO }

  if cbCriterios.ItemIndex < 0 then
  begin
    Mensagem(
      'Selecione um centro de custo na combo para adicionar o rateio',
      'Aviso',
      MB_ICONWARNING + MB_OK,
      Handle
    );

    cbCriterios.SetFocus();
    Exit;
  end;

  { VERIFICA SE FOI SELECIONADA UM CRITERIO DE RATEIO }

  if cbRateio.ItemIndex < 0 then
  begin
    Mensagem(
      'Selecione um critério de rateio na combo para adicionar o rateio',
      'Aviso',
      MB_ICONWARNING + MB_OK,
      Handle
    );

    cbRateio.SetFocus();
    Exit;
  end;

  { VERIFICA SE O VALOR DE RATEIO FOI INFORMADO }

  if (edValorRateio.Text = '') or
     not (edValorRateio.getValorDouble() > 0) then
  begin
    Mensagem(
      'Informe um valor para o rateio maior que zero',
      'Aviso',
      MB_ICONWARNING + MB_OK,
      Handle
    );

    edValorRateio.SetFocus();
    Exit;
  end;

  { VERIFICA SE A PORCENTAGEM DE RATEIO FOI INFORMADA }

  try

    if (edPorcentagem.Text = '') or
       not (RoundFloat(StrToFloat(edPorcentagem.Text), 2) > 0) then
    begin
      raise Exception.Create('');
    end;
  except
    Mensagem(
      'Informe um percentual para o rateio maior que zero',
      'Aviso',
      MB_ICONWARNING + MB_OK,
      Handle
    );

    edPorcentagem.SetFocus();
    Exit;
  end;

  { VERIFICA SE OS VALORES RATEADOS ULTRAPASSA O TOTAL O TOTAL GERAL }

  if vlTotalRateios > vlTotalGeral then
  begin
    Mensagem(
      'O valor informado para o rateio ultrapassa o valor original',
      'Aviso',
      MB_ICONWARNING + MB_OK,
      Handle
    );

    edValorRateio.SetFocus();
    Exit;
  end;

  { VERIFICA SE A PORCENTAGEM NAO PASSOU OS 100% }

  if StrToFloat(edPorcentagem.Text) > (100-vlPercentualTotalRateios) then
  begin
    Mensagem(
      'O valor informado para o percentual de rateio ultrapassa os 100%',
      'Aviso',
      MB_ICONWARNING + MB_OK,
      Handle
    );

    edPorcentagem.SetFocus();
    Exit;
  end;

  Result := True;
end;

procedure TfrmLancamentosManuais.inserirRateioCentroCusto(
  cdCentroCusto: Integer;
  dsTipoRateio: String;
  vlPorcentagem: Double;
  vlLancamento: Double
);
var
  vlAcumuladoPorcentagem, vlAcumuladoLancamento: Double;
  nrCentroCustoPercorridos, nrQtdeCentroCustoAnaliticos: Integer;
begin

  // Verifica se critério de lançamento é ESP (ESPECÍFICO), nesse caso o
  // lançamento somente pode ocorrer em centro de custos analíticos
  if (dsTipoRateio = 'ESP') then
  begin
    // Realiza o lançamento específico do centro de custo analitico selecionado
    // finaliza a execução
    incluirCentroCustoEspecificoArvore(cdCentroCusto, vlPorcentagem, vlLancamento);
    Exit;
  end;

  {
    Inclui os nodos pais do centro de custo selecionado na árvore
    - Insere os nodos pais (toda estrutura acima até o nodo atual)
    - Insere também o nodo do centro de custo enviado
  }
  incluirNodesPaiArvore(cdCentroCusto);

  {
    Inclui os nodos filhos do centro de custo selecionado na árvore
    - Inclui todos os filhos do centro de custo repassado
    - O centro de custo repassado já foi inserido na função
      acima (incluirNodesPaiArvore)
  }

  // Variáveis para acumular os valores de porcentagem e lancamento para
  // conferência e arredondamento de centavos no final
  vlAcumuladoLancamento := 0;
  vlAcumuladoPorcentagem := 0;

  // Indice para saber quantos centro de custos já foram percorridos
  nrCentroCustoPercorridos := 0;

  // Retorna o número de centro de custos que estão dentro de um centro de custo
  nrQtdeCentroCustoAnaliticos := getQuantidadeCentrosCustosAnaliticos(cdCentroCusto, dsTipoRateio);

  // Recupera o total de centros de custos análiticos que serão inserido,
  // para saber quando chegou ao final e ajustar a diferença de centavos por
  // conta dos arredondamentos

  incluirNodesFilhoArvore(
      cdCentroCusto, dsTipoRateio, vlPorcentagem, vlLancamento,
      nrQtdeCentroCustoAnaliticos, nrCentroCustoPercorridos,
      vlAcumuladoLancamento, vlAcumuladoPorcentagem
  );

end;

procedure TfrmLancamentosManuais.preencherRateioCentroCusto(
  cdCentroCusto: Integer;
  cdCentroPai: Integer;
  dsTipoRateio: String;
  vlPorcentagem: Double;
  vlLancamento: Double
);
begin

  // Verifica se critério de lançamento é ESP (ESPECÍFICO)
  if (dsTipoRateio = 'ESP') then
  begin
    // Preenche a arvore com o centro de custo específico
    // finaliza a execução
    preencherCentroCustoEspecificoArvore(cdCentroCusto, vlPorcentagem, vlLancamento);
    Exit;
  end;

  {
    Inclui os nodos pais do centro de custo selecionado na árvore
    - Insere os nodos pais (toda estrutura acima até o nodo atual)
    - Insere também o nodo do centro de custo enviado
  }
  incluirNodesPaiArvore(cdCentroPai);

  {
    Preencher o centro de custo analitico na árvore, os centros de custo pais já foram
    inseridos na função acima "incluirNodesPaiArvore"
  }

  preencherCentroCustoAnaliticoArvore(
      cdCentroCusto, vlPorcentagem, vlLancamento
  );

end;

function TfrmLancamentosManuais.incluirNodesPaiArvore(cdCentroCusto: Integer): PVirtualNode;
var
  cdColigada, cdCentroPai: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
begin

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Seleciona o centro de custo informado pelo usuário no clienteDataSet
  if not cdsCentroCustos.Locate('CD_CENTRO;CD_COLIGADA', VarArrayOf([cdCentroCusto, cdColigada]), []) then
  begin
    Exit;
  end;

  cdCentroPai := cdsCentroCustosCD_CENTRO_PAI.AsInteger;

  // Busca se o centro de custo pai já está inserido na árvore (caso contrário é NULL)
  node := getNodeCentroCusto(cdCentroPai);

  // Verifica se o centro de custo possui pai e o mesmo já está inserido na arvore
  if (cdCentroPai <> 0) and (node = nil) then
  begin
    // Chama a função recursivamente, para chegar no nodo mais ao topo ainda não inserido
    node := incluirNodesPaiArvore(cdCentroPai);
  end;

  // Antes de inserir o centro de custo na arvore verifica se já está inserido,
  // nesse caso não insere novamente
  if getNodeCentroCusto(cdCentroCusto) <> nil then
  begin
    Exit;
  end;

  // Insere o centro de custo que está verificando na árvore
  Result := incluirCentroCustoSinteticoArvore(cdCentroCusto);

end;

procedure TfrmLancamentosManuais.incluirNodesFilhoArvore(
  cdCentroCusto: Integer;
  dsTipoRateio: String;
  vlPorcentagem: Double;
  vlLancamento: Double;
  nrQtdeCentroCustoAnaliticos: Integer;
  var nrCentroCustoPercorridos: Integer;
  var vlAcumuladoLancamento: Double;
  var vlAcumuladoPorcentagem: Double
);
var
  cdColigada, cdCentroPai,
  cdCentroAtual, nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  ehCentroAnalitico: Boolean;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Varre apenas os centros de custos filhos do centro de custo repassado
  cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
  cdsCentroCustos.Filtered := True;

  cdsCentroCustos.First;
  while not cdsCentroCustos.Eof do
  begin

    // Salva o código do centro de custo que está varrendo no momento (filho)
    cdCentroAtual := cdsCentroCustosCD_CENTRO.AsInteger;

    // Verifica se o centro de custo é analitico
    ehCentroAnalitico := isCentroCustoAnalitico(cdCentroAtual, dsTipoRateio);

    // Verifica se o centro de custo é ANALITICO ou SINTETICO
    if ehCentroAnalitico then
    begin
      // Incluir o filho do centro de custo repassado na árvore
      node := incluirCentroCustoAnaliticoArvore(cdCentroAtual, dsTipoRateio, vlPorcentagem, vlLancamento,
          nrQtdeCentroCustoAnaliticos, nrCentroCustoPercorridos,
          vlAcumuladoLancamento, vlAcumuladoPorcentagem);
    end else begin
      // Incluir o filho do centro de custo repassado na árvore
      node := incluirCentroCustoSinteticoArvore(cdCentroAtual);
    end;

    {
      Chama a função recursivamente, para varrer os filhos dos filhos (e assim por diante)
      - Lógica para varrer até o último nível
    }
    incluirNodesFilhoArvore(cdCentroAtual, dsTipoRateio, vlPorcentagem, vlLancamento,
        nrQtdeCentroCustoAnaliticos, nrCentroCustoPercorridos,
        vlAcumuladoLancamento, vlAcumuladoPorcentagem);

    // Restaura o Filter para como estava antes de chamar a recursão
    cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
    cdsCentroCustos.Filtered := True;

    // Restaura a posição que estava varrendo antes de chamar a recursão
    cdsCentroCustos.Locate('CD_COLIGADA;CD_CENTRO', VarArrayOf([cdColigada, cdCentroAtual]), []);

    {
      Verificações se deve manter o nodo na árvore ou excluir, irá excluir se:
      - Se o centro de custo inserido for SINTETICO (não for analitico)
      - Se não possuir nenhum filho dentro dele
    }
    if (not ehCentroAnalitico) and
       (node.ChildCount = 0) then
    begin
      objArvoreRateio.DeleteNode(node);
    end;

    cdsCentroCustos.Next;
  end;

  cdsCentroCustos.Filter := '';
  cdsCentroCustos.Filtered := True;

end;

function TfrmLancamentosManuais.incluirCentroCustoSinteticoArvore(cdCentroCusto: Integer): PVirtualNode;
var
  nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Cria os dados do centro de custo pai que será inserido na árvore
  // Nesse momento, o nodo pai é criado sem valores
  New(data);
  data.valor := 0;
  data.percentual := 0;
  data.lancamento_por_criterio := True;
  data.objCentro := TCentroCusto.Create(cdCentroCusto);

  // Recupera o node do centro de custo da árvore (null se não existir)
  node := getNodeCentroCusto(data.objCentro.CentroPai);

  // Insere o centro de custo que está verificando na árvore
  Result := objArvoreRateio.InsertNode(node, amAddChildLast, data);

end;

function TfrmLancamentosManuais.incluirCentroCustoAnaliticoArvore(
  cdCentroCusto: Integer;
  dsTipoRateio: String;
  vlPorcentagem: Double;
  vlLancamento: Double;
  nrQtdeCentroCustoAnaliticos: Integer;
  var nrCentroCustoPercorridos: Integer;
  var vlAcumuladoLancamento: Double;
  var vlAcumuladoPorcentagem: Double
): PVirtualNode;
var
  nrAbaAtual, cdColigada, cdCentroCustoSelecionado: Integer;
  objArvoreRateio: TVirtualStringTree;
  cbCriterios: TUMComboBox;
  node: PVirtualNode;
  data: PCentro;
  vlApropriacao, vlRateio,
  vlPorcentagemRateio: Double;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );
  cbCriterios := TUMComboBox(procuraComponente('cbCriterios', nrAbaAtual));

  // Recupera o valor da apropriação do centro de custo de acordo com o critério selecionado
  vlApropriacao := 0;
  if cdsRateioCentroCustos.Locate('CD_COLIGADA;CD_CENTRO;DS_SIGLA', VarArrayOf([cdColigada, cdCentroCusto, dsTipoRateio]), [loCaseInsensitive]) then
  begin
    vlApropriacao := cdsRateioCentroCustosVL_APROPRIACAO.AsFloat;
  end;

  // Pega o centro de custo selecionado pelo usuário
  cdCentroCustoSelecionado := StrToInt(TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).getCodigo());

  // Cálcula o valor de rateio para esse centro de custo
  vlRateio := vlLancamento * (vlApropriacao / getValorTotalCriterioApropriacao(cdCentroCustoSelecionado, dsTipoRateio));
  vlRateio := RoundFloat(vlRateio, 2);

  // Cálcula a porcentagem do rateio
  vlPorcentagemRateio := (vlRateio * vlPorcentagem) / vlLancamento;
  vlPorcentagemRateio := RoundFloat(vlPorcentagemRateio, 2);

  // Incrementa o número de centros analiticos percorridos até o momento
  nrCentroCustoPercorridos := nrCentroCustoPercorridos + 1;

  // Acumula os valores de lancamento e porcentagem, para verificação dos centavos no final
  // por conta do arredondamento
  vlAcumuladoLancamento := vlAcumuladoLancamento + vlRateio;
  vlAcumuladoPorcentagem := vlAcumuladoPorcentagem + vlPorcentagemRateio;

  // Verifica se o centro de custo que está percorrendo é o último a ser inserido
  if (nrCentroCustoPercorridos = nrQtdeCentroCustoAnaliticos) then
  begin
    // Se for o último centro analitico a ser inserido, realiza o arredondamento
    // para bater com o valor final informado (sem diferença de centavos)
    vlRateio := vlRateio + (vlLancamento - vlAcumuladoLancamento);
    vlPorcentagemRateio := vlPorcentagemRateio + (vlPorcentagem - vlAcumuladoPorcentagem);
  end;

  // Verifica se o centro de custo analitico já está inserido na árvore
  node := getNodeCentroCusto(cdCentroCusto);

  // Se o centro de custo já foi inserido, apenas atualiza os valores dele
  if node <> nil then
  begin
    // Recupera o objeto com os dados
    data := PCentro(objArvoreRateio.GetNodeData(node)^);

    // Atualiza os dados de valores do node existente
    data.valor := data.valor + RoundFloat(vlRateio, 2);
    data.percentual := data.percentual + RoundFloat(vlPorcentagemRateio, 2);
    
    Exit;
  end;

  // Cria os dados do centro de custo analitico com os valores cálculados
  New(data);
  data.valor := vlRateio;
  data.percentual := vlPorcentagemRateio;
  data.lancamento_por_criterio := True;
  data.objCentro := TCentroCusto.Create(cdCentroCusto);

  // Recupera o node do centro de custo pai da árvore (null se não existir)
  node := getNodeCentroCusto(data.objCentro.CentroPai);

  // Insere o centro de custo que está verificando na árvore
  Result := objArvoreRateio.InsertNode(node, amAddChildLast, data);

end;

function TfrmLancamentosManuais.preencherCentroCustoAnaliticoArvore(
  cdCentroCusto: Integer;
  vlPorcentagem: Double;
  vlLancamento: Double
): PVirtualNode;
var
  nrAbaAtual, cdColigada: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Cria os dados do centro de custo analitico com os valores cálculados
  New(data);
  data.valor := vlLancamento;
  data.percentual := vlPorcentagem;
  data.lancamento_por_criterio := True;
  data.objCentro := TCentroCusto.Create(cdCentroCusto);

  // Recupera o node do centro de custo pai da árvore (null se não existir)
  node := getNodeCentroCusto(data.objCentro.CentroPai);

  // Insere o centro de custo que está verificando na árvore
  Result := objArvoreRateio.InsertNode(node, amAddChildLast, data);

end;

function TfrmLancamentosManuais.incluirCentroCustoEspecificoArvore(
  cdCentroCusto: Integer;
  vlPorcentagem: Double;
  vlLancamento: Double
): PVirtualNode;
var
  nrAbaAtual, cdColigada: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Verifica se o centro de custo específico já está inserido na árvore
  node := getNodeCentroCustoEspecifico(cdCentroCusto);

  // Se o centro de custo já foi inserido, apenas atualiza os valores dele
  if node <> nil then
  begin
    // Recupera o objeto com os dados
    data := PCentro(objArvoreRateio.GetNodeData(node)^);

    // Atualiza os dados de valores do node existente
    data.valor := data.valor + RoundFloat(vlLancamento, 2);
    data.percentual := data.percentual + RoundFloat(vlPorcentagem, 2);
    
    Exit;
  end;

  // Cria os dados do centro de custo analitico com os valores cálculados
  New(data);
  data.valor := RoundFloat(vlLancamento, 2);
  data.percentual := RoundFloat(vlPorcentagem, 2);
  data.lancamento_por_criterio := False;
  data.objCentro := TCentroCusto.Create(cdCentroCusto);

  // Insere o centro de custo que está verificando na árvore
  Result := objArvoreRateio.InsertNode(nil, amAddChildLast, data);

end;

function TfrmLancamentosManuais.preencherCentroCustoEspecificoArvore(
  cdCentroCusto: Integer;
  vlPorcentagem: Double;
  vlLancamento: Double
): PVirtualNode;
var
  nrAbaAtual, cdColigada: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Cria os dados do centro de custo analitico com os valores cálculados
  New(data);
  data.valor := RoundFloat(vlLancamento, 2);
  data.percentual := RoundFloat(vlPorcentagem, 2);
  data.lancamento_por_criterio := False;
  data.objCentro := TCentroCusto.Create(cdCentroCusto);

  // Insere o centro de custo que está verificando na árvore
  Result := objArvoreRateio.InsertNode(nil, amAddChildLast, data);

end;

function TfrmLancamentosManuais.atualizarValorCentroCustosSinteticos(nodePai: PVirtualNode): Double;
var
  nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  Result := 0;

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Se o nodo não possui filhos, retorna o valor do nodo
  if nodePai.ChildCount = 0 then
  begin
    data := PCentro(objArvoreRateio.GetNodeData(nodePai)^);
    Result := data.valor;
    Exit;
  end;

  // Inicia varrendo o primeiro nodo da árvore
  node := nodePai.FirstChild;
  while node <> nil do
  begin

    // Verifica se o nodo possui filhos, nesse caso varre os filhos dele
    // Adentrando o máximo possível na árvore (até os nodos analíticos)
    Result := Result + atualizarValorCentroCustosSinteticos(node);

    // Passa para o próximo nodo irmão
    node := node.NextSibling;
  end;

  // Atualiza o valor do nodo pai
  data := PCentro(objArvoreRateio.GetNodeData(nodePai)^);
  data.valor := Result;

end;

function TfrmLancamentosManuais.atualizarPercentualCentroCustosSinteticos(nodePai: PVirtualNode): Double;
var
  nrAbaAtual: Integer;
  objArvoreRateio: TVirtualStringTree;
  node: PVirtualNode;
  data: PCentro;
begin

  Result := 0;

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Se o nodo não possui filhos, retorna o valor do nodo
  if nodePai.ChildCount = 0 then
  begin
    data := PCentro(objArvoreRateio.GetNodeData(nodePai)^);
    Result := data.percentual;
    Exit;
  end;

  // Inicia varrendo o primeiro nodo da árvore
  node := nodePai.FirstChild;
  while node <> nil do
  begin

    // Verifica se o nodo possui filhos, nesse caso varre os filhos dele
    // Adentrando o máximo possível na árvore (até os nodos analíticos)
    Result := Result + atualizarPercentualCentroCustosSinteticos(node);

    // Passa para o próximo nodo irmão
    node := node.NextSibling;
  end;

  // Atualiza o valor do nodo pai
  data := PCentro(objArvoreRateio.GetNodeData(nodePai)^);
  data.percentual := Result;

end;

procedure TfrmLancamentosManuais.atualizarCentroCustosSinteticos();
var
  nrAbaAtual: Integer;
  node: PVirtualNode;
  objArvoreRateio: TVirtualStringTree;
  btAddRateio: TButton;
  edValorTotal: TUMEditMonetario;
  labelValorTotal: TLabel;
  vlTotalRateios: Double;
begin

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Varre todos os nodos vinculados a raiz do componente de arvore
  node := objArvoreRateio.RootNode.FirstChild;
  while node <> nil do
  begin

    // Atualiza os valores dos nodos sintéticos
    atualizarValorCentroCustosSinteticos(node);
    // Atualiza o percentual dos nodos sintéticos
    atualizarPercentualCentroCustosSinteticos(node);

    // Passa para o próximo nodo irmão
    node := node.NextSibling;
  end;

  // Label que apresentará o valor total 
  labelValorTotal := TLabel( procuraComponente('lbRateios', nrAbaAtual) );

  // Recupera o valor total dos rateios
  vlTotalRateios := getValorTotalRateios();

  // Exibe ou não a label com o valor total (se maior que zero)
  labelValorTotal.Visible := False;
  if vlTotalRateios > 0 then
  begin
    labelValorTotal.Visible := True;
    labelValorTotal.Caption := 'Total: ' + #13#10 + 'R$ ' + FormatFloat('###,###,#0.00', vlTotalRateios);
  end;

  // Busca o botão de adicionar (clicado)
  btAddRateio := TButton(procuraComponente('btnAddRateio', nrAbaAtual));
  edValorTotal := TUMEditMonetario(procuraComponente('edValor', nrAbaAtual));

  // Verifica se a porcentagem total é inferior a 100% e o valor é menor que o
  // total geral, nesse caso permite adicionar mais centro de custos
  btAddRateio.Visible := False;
  if (getPercentualTotalRateios() < 100) and
     (getValorTotalRateios() < edValorTotal.getValorDouble()) then
  begin
    btAddRateio.Visible := True;
  end;

end;

procedure TfrmLancamentosManuais.btnAddRateio1Click(Sender: TObject);
var
  cdCentroCusto, nrAbaAtual: Integer;
  dsTipoRateio: String;
  vlRateio, vlPorcentagem: Double;
  edValorRateio: TUMEditMonetario;
  edClassificacao: TMaskEdit;
  edPorcentagem: TEdit;
  cbRateio, cbCriterios: TUMComboBox;
  objArvoreRateio: TVirtualStringTree;
begin

  // Verifica se o rateio é válido
  if not isRateioValido() then
  begin
    btSalvaFecha.Enabled := False;
    btSalvar.Enabled := False;
    Exit;
  end;

  // Habilita os botões de salvar, se passou pelas validações de rateio acima
  btSalvaFecha.Enabled := True;
  btSalvar.Enabled := True;

  // Recupera a guia selecionada pelo usuário
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);;

  // Recupera o componente da árvore da guia atual
  objArvoreRateio := TVirtualStringTree( procuraComponente('vstCentros', nrAbaAtual) );

  // Busca as componentes de interface para recuperar valores
  cbRateio := TUMComboBox(procuraComponente('cbRateio', nrAbaAtual));
  cbCriterios := TUMComboBox(procuraComponente('cbCriterios', nrAbaAtual));
  edPorcentagem := TEdit(procuraComponente('edPorcentagem', nrAbaAtual));
  edValorRateio := TUMEditMonetario(procuraComponente('ed_vlRateio', nrAbaAtual));
  edClassificacao := TMaskEdit(procuraComponente('ed_cdClassificacao', nrAbaAtual));

  // Recupera o centro de custo selecionado
  cdCentroCusto := StrToInt(TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).getCodigo());
  // Recupera o tipo de rateio selecionado
  dsTipoRateio := TItemCombo(cbRateio.Items.Objects[cbRateio.ItemIndex]).getCodigo();
  // Recupera o valor de porcentagem informado
  vlPorcentagem := StrToFloat(edPorcentagem.Text);
  // Recupera o valor do rateio informado
  vlRateio := edValorRateio.getValorDouble();

  // Insere o rateio no centro de custo selecionado (se possível)
  inserirRateioCentroCusto(cdCentroCusto, dsTipoRateio, vlPorcentagem, vlRateio);

  // Atualiza os valores dos nodos sintéticos (pais)
  atualizarCentroCustosSinteticos();

  // Atualiza a arvore de centro de custos
  objArvoreRateio.Refresh;

  // Foca o usuário no campo de classificação
  edClassificacao.SetFocus();

  // Limpa os campos de rateio
  limparCamposRateio();
end;

function TfrmLancamentosManuais.getCriteriosRateio(cdCentroCusto: Integer): TStringList;
var
  cdColigada, cdCentroAtual: Integer;
begin

  // Cria o StringList para armazenar os critérios de rateio
  Result := TStringList.Create;
  // Inclui o comportamento para ignorar duplicados
  Result.Duplicates := dupIgnore;
  Result.Sorted := True;

  cdColigada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

  {
    Verifica se o centro de custo é analítico
    Nesse caso retorna os tipos de rateio valor do centro de custo
  }
  if cdsRateioCentroCustos.Locate('CD_CENTRO;CD_COLIGADA', VarArrayOf([cdCentroCusto, cdColigada]), [loCaseInsensitive]) then
  begin
    cdsRateioCentroCustos.Filter := 'CD_CENTRO = '+IntToStr(cdCentroCusto)+ ' AND CD_COLIGADA = '+IntToStr(cdColigada);
    cdsRateioCentroCustos.Filtered := True;

    cdsRateioCentroCustos.First;
    while not cdsRateioCentroCustos.Eof do
    begin
      Result.Add(cdsRateioCentroCustosDS_SIGLA.AsString);

      cdsRateioCentroCustos.Next;
    end;

    cdsRateioCentroCustos.Filter := '';
    cdsRateioCentroCustos.Filtered := False;

    Exit;
  end;

  {
    Verifica se o centro de custo possui filhos
    Nesse caso varre cada um dos filhos chamando essa mesma função recursivamente
  }

  // Varre apenas os centros de custos filhos do centro de custo repassado
  cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
  cdsCentroCustos.Filtered := True;

  cdsCentroCustos.First;
  while not cdsCentroCustos.Eof do
  begin

    // Salva o código do centro de custo que está varrendo no momento
    cdCentroAtual := cdsCentroCustosCD_CENTRO.AsInteger;

    // Efetua o merge dos StringLists (retorno da recursão + atual)
    Result.AddStrings(getCriteriosRateio(cdsCentroCustosCD_CENTRO.AsInteger));

    // Restaura o Filter para como estava antes de chamar a recursão
    cdsCentroCustos.Filter := 'CD_COLIGADA = '+IntToStr(cdColigada)+' AND CD_CENTRO_PAI = '+IntToStr(cdCentroCusto);
    cdsCentroCustos.Filtered := True;

    // Restaura o clientDataSet como ele estava antes de chamar a recursão
    cdsCentroCustos.Locate('CD_COLIGADA;CD_CENTRO', VarArrayOf([cdColigada, cdCentroAtual]), []);

    cdsCentroCustos.Next;
  end;

  cdsCentroCustos.Filter := '';
  cdsCentroCustos.Filtered := True;

end;

procedure TfrmLancamentosManuais.limparCamposRateio();
var
  nrAbaAtual: Integer;
  cbCriterios, cbRateio : TUMComboBox;
  edClassificacao: TMaskEdit;
  edPorcentagem: TEdit;
  edValorRateio: TUMEditMonetario;
begin
  nrAbaAtual := StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]);

  cbCriterios := TUMComboBox(procuraComponente('cbCriterios', nrAbaAtual));
  cbRateio := TUMComboBox(procuraComponente('cbRateio', nrAbaAtual));
  edClassificacao := TMaskEdit(procuraComponente('ed_cdClassificacao', nrAbaAtual)) ;
  edPorcentagem := TEdit(procuraComponente('edPorcentagem', nrAbaAtual)) ;
  edValorRateio := TUMEditMonetario(procuraComponente('ed_vlRateio', nrAbaAtual));

  // Reseta as combos
  cbCriterios.ItemIndex := -1;
  cbRateio.ItemIndex := -1;

  // Apaga os campos de classificação, valor e porcentagem
  edClassificacao.Clear;
  edPorcentagem.Clear;
  edValorRateio.Clear;
end;

procedure TfrmLancamentosManuais.tcLancamentosChange(Sender: TObject);
begin
   if tcLancamentos.TabIndex <> tcLancamentos.Tabs.Count-1 then
   begin
      // Esconde campos de outras aba e mostra campos do Index
      TrocaAba(StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]));
   end;

   criaAba;
end;

procedure TfrmLancamentosManuais.tcLancamentosChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := ValidaAbaAtual(StrToInt(tcLancamentos.Tabs[tcLancamentos.TabIndex]));
end;

procedure TfrmLancamentosManuais.ed_cdClassificacao1Exit(Sender: TObject);
var
  nrAbaAtual, i: Integer;
  edClassificao: TMaskEdit;
  cbCriterios: TUMComboBox;
begin
  edClassificao := TMaskEdit(Sender);

  edClassificao.Text := Trim(edClassificao.Text);

  nrAbaAtual := edClassificao.Tag;

   // Se o usuário não digitou nada apenas cancela a operação
  if ( Length(Trim(edClassificao.Text)) <= 0 ) then
  begin
    Exit;
  end;

   // Seleciona o critério de acordo com a classificação digitada
  cbCriterios := TUMComboBox(procuraComponente('cbCriterios', nrAbaAtual));

  // Varre a combo de centro de custos
  for i := 0 to cbCriterios.Items.Count - 1 do
  begin

    // Procura o centro de custo digitado
    if edClassificao.Text = TItemCombo(cbCriterios.Items.Objects[i]).variavel then
    begin
      cbCriterios.ItemIndex := i;

      // Dispara o método de mudança de centro de custo
      cbCriterios1Change(cbCriterios);

      // Foca o usuário no próximo campo (combo de centro de custos)
      cbCriterios.SetFocus();

      Exit;
    end;

  end;

end;

procedure TfrmLancamentosManuais.ed_cdClassificacao1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
   begin
      Perform(Wm_NextDlgCtl,0,0);
      Key := #0;
   end;
end;

end.
