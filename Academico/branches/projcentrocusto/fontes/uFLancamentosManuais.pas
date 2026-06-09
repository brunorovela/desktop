unit uFLancamentosManuais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, uFSelecionarColigada, uColigada,
  ComCtrls, General, DB, ZAbstractRODataset, UZDataset, uDM, uSelConta,
  StrUtils, uFSelecionarHistoricos, uItemCombo, Grids, uFSelecionarCentro,
  ZAbstractDataset, uFSelecionarPessoa, uClassMovimento, uULancamentos,
  UMComboBox, UMEditMonetario, ToolWin, ImgList;
type
  // Usado para identificar como a tela irá salvar as informações e irá tratar algumas situações
  TModoTela = (mtAlterar, mtInserir);

  // Usado para controle do tamanho do form
   TFormatoTela = record
      Compromisso: Boolean;
      Rateio: Boolean;
      Normal: Boolean;
   end;

  TfrmLancamentosManuais = class(TForm)
    paCabecalho: TPanel;
    qryBuscaContas: TUMZReadOnlyQuery;
    qryBuscaHistoricos: TUMZReadOnlyQuery;
    qryBuscaProximaChave: TUMZReadOnlyQuery;
    qryCriterios: TUMZReadOnlyQuery;
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
    stRateios1: TStringGrid;
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
    btInserir1: TSpeedButton;
    btAlterar1: TSpeedButton;
    btExcluir1: TSpeedButton;
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
    procedure edDataVencimento1KeyPress(Sender: TObject; var Key: Char);
    procedure edFornecedor1KeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoTitulo1KeyPress(Sender: TObject; var Key: Char);
    procedure edNumeroDoc1KeyPress(Sender: TObject; var Key: Char);
    procedure cbCriterios1KeyPress(Sender: TObject; var Key: Char);
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
    procedure cbCriterios1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure btExcluir1Click(Sender: TObject);
    procedure btAlterar1Click(Sender: TObject);
    procedure btInserir1Click(Sender: TObject);
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

    // Esta função valida o critério de apropriação selecionado, caso seja manual
    // ela vai abrir a Grid de critérios manuais
    procedure validaCriterios(Tag: Integer);

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

     function getValorTotalRateios(Index: Integer): Currency;

     function procuraComponente(nome: String; index: Integer): TComponent;

     function NovoCompromisso(cd_pessoa: Integer; nr_documento,
        nr_parcela, dt_vencimento: String; cd_tipo_titulo: Integer;
        ValorTotal: Double; cd_coligada: Integer; vl_parcela: Double;
        despesa, historico: String; HistoricoContabil: Integer;
        DataEmissaoNota, DataCompetencia, DataProvavelPagamento, DataLancamento: String; Modo: TTipoExecucao): TExecucaoCompromisso;

     // Procedure atuailza o Label que mostra o total de valor atual rateado
     procedure AtualizaValorRateios(index: Integer);
     procedure atualizaValores();

     procedure CriaEdit(EditCopia: TEdit; ParentPai: TWinControl; index: Integer);
     procedure CriaComboBox(ComboBoxCopia: TUMComboBox; ParentPai: TWinControl; index: Integer);
     procedure CriaSpeedButton(SpeedButtonCopia: TSpeedButton; ParentPai: TWinControl; index: Integer);
     procedure CriaLabel(LabelCopia: TLabel; ParentPai: TWinControl; index: Integer);
     procedure CriaPanel(PanelCopia: TPanel; ParentPai: TWinControl; index: Integer);
     procedure CriaStringGrid(GridCopia: TStringGrid; ParentPai: TWinControl; index: Integer);
     procedure CriaMaskEdit(MaskEdit: TMaskEdit; ParentPai: TWinControl; index: Integer);
     procedure CriaButton(ButtonCopia: TButton; ParentPai: TWinControl; index: Integer);
     procedure CriaEditMonetario(EditCopia: TUMEditMonetario; ParentPai: TWinControl; index: Integer);

     // Gera movimento do compromisso
     procedure geraMovimento(tipo_acao: TTipoMovimento;
        cd_titulo, cd_coligada: string; vl_despesa: double);

     function insereRateios(cd_titulo: TExecucaoCompromisso; cd_coligada: Integer; vl_despesa: Double): TList;

     procedure limpaGrid(grid: TStringGrid);

     // Esta procedure irá corrigir as apropriações nos casos em que
     // não feche no valor total dos rateios com o valor do lançamento
     procedure CorrigeApropriacoes(Tag: Integer);

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

  public
     // procedure para carregar as abas da tela de lançamentos conforme o lançamento á ser alterado
     procedure alteraLancamentos(cd_chave: Integer);
  end;

var
  frmLancamentosManuais: TfrmLancamentosManuais;

const
   SQL_BUSCA_ITENS_CRITERIO = ' SELECT ' +
      ' 	fcai.cd_centro, ' +
      ' 	fcai.vl_apropriacao, ' +
      ' 	fccc.ds_centro ' +
      ' FROM ' +
      ' 	fin_criterios_apropria_itens fcai ' +
      ' INNER JOIN fin_config_centro_custos fccc ON ( ' +
      ' 	fccc.cd_centro = fcai.cd_centro ' +
      ' ) ' +
      ' WHERE ' +
      ' 	cd_apropriacao = :cd_apropriacao';      

   SQL_BUSCA_FORNECEDOR = ' SELECT '+
      ' 	p.cd_pessoa, '+
      '  p.nm_pessoa '+
      ' FROM '+
      ' 	fin_plano_contas_fornecedor fpcf '+
      ' INNER JOIN pessoas p ON (p.cd_pessoa = fpcf.cd_pessoa) '+
      ' WHERE '+
      ' 	fpcf.cd_conta = :cd_conta ';

   SQL_BUSCA_LANCAMENTO = ' SELECT '+
      ' 	fc.cd_lancamento,	'+
      ' 	fc.dt_movimento,	'+
      ' 	fc.cd_debito,	'+
      ' 	fc.cd_credito,	'+
      ' 	fc.vl_movimento,	'+
      ' 	fc.cd_historico,	'+
      '  fc.ds_historico, '+
      ' 	fc.cd_titulo,	'+
      ' 	fcp.cd_coligada,	'+
      ' 	fcp.cd_pessoa,	'+
      ' 	fcp.nr_documento,	'+
      ' 	(CASE fc.cd_operacao	'+
      ' 		WHEN ''MV'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 1 and cd_transfere = fc.cd_titulo) '+
      ' 		WHEN ''MS'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 1 and cd_movimento_te = fc.cd_titulo)	'+
      ' 		ELSE 0 '+
      '  END) AS caixa_debito,'+
      ' (CASE fc.cd_operacao	'+
      ' 		WHEN ''MV'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 2 and cd_transfere = fc.cd_titulo) '+
      ' 		WHEN ''MS'' THEN (select cd_caixa from fin_mov_tesouraria where tp_entrada_saida = 2 and cd_movimento_te = fc.cd_titulo) '+
      ' 		ELSE 0 '+
      ' 	END) AS caixa_credito,	'+
      '  (SELECT max(nr_parcela) FROM fin_contas_pagar WHERE cd_titulo_principal = fcp.cd_titulo ) AS nr_parcela, '+
      ' 	fc.cd_criterio_apropria, '+
      ' 	fcp.dt_vencimento, '+
      '  fcp.cd_tipo_titulo, '+
      '  fc.cd_operacao, '+
      '  p.nm_pessoa, '+
      ' 	fcpc.ds_conta as conta_credito, '+
      ' 	fcpcd.ds_conta as conta_debito '+
      ' FROM '+
      ' 	fin_contabil fc '+
      ' LEFT JOIN fin_contas_pagar fcp ON (fcp.cd_titulo = fc.cd_titulo) '+
      ' LEFT JOIN pessoas p ON (p.cd_pessoa = fcp.cd_pessoa) '+
      ' LEFT JOIN fin_config_plano_contas fcpc ON (fcpc.cd_conta = fc.cd_credito) '+
      ' LEFT JOIN fin_config_plano_contas fcpcd ON (fcpcd.cd_conta = fc.cd_debito) '+
      ' WHERE '+
      ' 	fc.cd_chave = :cd_chave ';

   SQL_BUSCA_RATEIO_LANCAMENTO = ' SELECT '+
      ' 	fcc.cd_lancamento, '+
      ' 	fcc.cd_centro, '+
      ' 	fcc.vl_movimento,	'+
      ' 	fccc.ds_centro '+
      ' FROM '+
      ' 	fin_contabil_cc fcc '+
      ' INNER JOIN fin_config_centro_custos fccc ON ( '+
      ' 	fcc.cd_centro = fccc.cd_centro '+
      ' ) '+
      ' WHERE '+
      ' 	fcc.cd_lancamento = :cd_lancamento ';

implementation

uses uPessoa, uUsuario, uListaExecucao, uGeneral;

{$R *.dfm}

procedure TfrmLancamentosManuais.alteraLancamentos(cd_chave: Integer);
var
   qryBuscaRateios, qryDeleteCompromisso: TUMZQuery;
   i, j, tag: Integer;
   cbCriterios, cbColigadas, cbTipoTitulo: TUMComboBox;
   stRateios: TStringGrid;
   lbCentroCusto: TLabel;
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

         for I := 0 to cbCriterios.Items.Count - 1 do
         begin
            if TItemCombo(cbCriterios.Items.Objects[i]).getCodigo = qryBuscaLancamento.FieldByName('cd_criterio_apropria').AsString then
            begin
               cbCriterios.ItemIndex := i;
            end;
         end;

         if qryBuscaLancamento.FieldByName('cd_criterio_apropria').AsString = '-1' then
         begin
            TSpeedButton(procuraComponente('btInserir', tag)).Visible := True;
            TSpeedButton(procuraComponente('btAlterar', tag)).Visible := True;
            TSpeedButton(procuraComponente('btExcluir', tag)).Visible := True;
         end
         else
         begin
            TSpeedButton(procuraComponente('btInserir', tag)).Visible := False;
            TSpeedButton(procuraComponente('btAlterar', tag)).Visible := False;
            TSpeedButton(procuraComponente('btExcluir', tag)).Visible := False;
         end;

         qryBuscaRateios.ParamByName('cd_lancamento').AsInteger :=
            qryBuscaLancamento.FieldByName('cd_lancamento').AsInteger;

         qryBuscaRateios.Open;

         stRateios := TStringGrid(procuraComponente('stRateios', tag));

         j := 1;

         while not qryBuscaRateios.Eof do
         begin
            stRateios.Cells[0, j] := qryBuscaRateios.FieldByName('cd_centro').AsString;
            stRateios.Cells[1, j] := qryBuscaRateios.FieldByName('ds_centro').AsString;
            stRateios.Cells[2, j] := qryBuscaRateios.FieldByName('vl_movimento').AsString;

            stRateios.RowCount := stRateios.RowCount + 1;

            Inc(j);

            qryBuscaRateios.Next;
         end;

         stRateios.RowCount := stRateios.RowCount - 1;
         
         stRateios.Visible := True;
         TPanel(procuraComponente('pnRateios', Tag)).Visible := True;

         qryBuscaRateios.Close;

         slAbasComRateio.Values['pnRateios' + IntToStr(Tag)] := 'ativo';

         j := 0;
      end;

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
      Self.Height := 658;
   end;

   if pnCompromisso.Visible and not(pnRateios.Visible) then
   begin
      Self.Height := 523;
   end;

   if pnRateios.Visible and not(pnCompromisso.Visible) then
   begin
      Self.Height := 533;
   end;

   if not(pnRateios.Visible) and not(pnCompromisso.Visible) then
   begin
      Self.Height := 430;
   end;

   { Reposiciona o form }
   Self.Left := Round((Screen.Width - Self.Width) / 2);
   Self.Top := Round((Screen.Height - Self.Height) / 2);
end;

procedure TfrmLancamentosManuais.atualizaValores();
var
   ValorDebito, ValorCredito: Double;
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

   if ValorCredito > ValorDebito then
   begin
      edDiferencas.Text := CurrToStr(ValorCredito - ValorDebito);
      btSalvar.Enabled := False;
      btSalvaFecha.Enabled := False;
      ValoresDiferentes := True;
   end;

   if ValorDebito > ValorCredito then
   begin
      edDiferencas.Text := CurrToStr(ValorDebito - ValorCredito);
      btSalvar.Enabled := False;
      btSalvaFecha.Enabled := False;
      ValoresDiferentes := True;
   end;

   if ValorDebito = ValorCredito then
   begin
      edDiferencas.Text := '0';
      btSalvar.Enabled := True;
      btSalvaFecha.Enabled := True;
   end;

   edTotalCreditos.Text := CurrToStr(ValorCredito);
   edTotalDebitos.Text := CurrToStr(ValorDebito);
end;

procedure TfrmLancamentosManuais.atualizaValorRateios(index: Integer);
var
   i: Integer;
   Grid: TStringGrid;
   LabelTotal: TLabel;
   ValorTotal: Currency;
begin
   LabelTotal := TLabel(procuraComponente('lbRateios', index));

   LabelTotal.Visible := False;

   ValorTotal := getValorTotalRateios(index);

   if ValorTotal > 0 then
   begin
      LabelTotal.Visible := True;
      LabelTotal.Caption := 'Valor total: ' + FormatFloat('###,###,##0.00', ValorTotal);
   end;
end;

procedure TfrmLancamentosManuais.btCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLancamentosManuais.btExcluir1Click(Sender: TObject);
var
   Grid: TStringGrid;
   i: Integer;
begin
   Grid := TStringGrid(self.FindComponent('stRateios' + IntToStr(TButton(Sender).Tag)));

   Grid.Cells[0, Grid.Row] := '';
   Grid.Cells[1, Grid.Row] := '';
   Grid.Cells[2, Grid.Row] := '';

   with Grid do
   begin
      for i := Row to RowCount - 1 do
      begin
         Cells[0,i] := Cells[0,i+1];
         Cells[1,i] := Cells[1,i+1];
         Cells[2,i] := Cells[2,i+1];
      end;
      
      RowCount := RowCount -1;
   end;

   if Grid.RowCount = 1 then
   begin
      Grid.RowCount := Grid.RowCount + 1;
      Grid.FixedRows := 1;    
   end;

   atualizaValorRateios(TButton(Sender).Tag);
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

function TfrmLancamentosManuais.CarregaCaixasBancos(Tag: Integer;
  Tipo: TCategoriaConta; Caixa: Integer): Boolean;
const
   SQL_BUSCA_CAIXAS = '  '+
      'SELECT ' +
      '	cd_caixa, ' +
      '	cd_coligada, ' +
      '	ds_caixa ' +
      'FROM ' +
      '	fin_cadastro_contas ' +
      'WHERE ' +
      '  cd_plano_conta = :cd_conta ' +
      '	AND sn_ativa = ''S'' ' +
      '	AND ( ' +
      '	cd_caixa IN ( ' +
      '		SELECT ' +
      '			fcc.cd_caixa ' +
      '		FROM ' +
      '			fin_cadastro_contas fcc ' +
      '		INNER JOIN fin_controle_caixa fca ON ( ' +
      '			fca.cd_conta_banco = fcc.cd_caixa  ' +
      '		) ' +
      '		WHERE ' +
      '			fcc.tp_conta = 3  ' +
      '			AND fca.ds_situacao = ''A''  ' +
      '		GROUP BY  ' +
      '			fcc.cd_caixa  ' +
      '	)' +
      '	OR tp_conta <> 3' +
      ') ';
var
   edCodigo: TEdit;
   cbCaixaBanco: TUMComboBox;
   qryCarregaContas: TUMZQuery;
   cbNome, edNome: String;
   itemCombo: TItemCombo;
   Selecionado: Integer;
begin
   Result := True;

   DM.CriarConsulta(qryCarregaContas);

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

   qryCarregaContas.SQL.Text := SQL_BUSCA_CAIXAS;
   qryCarregaContas.ParamByName('cd_conta').AsInteger := StrToInt(edCodigo.Text);
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
   qryCriterios.Close;
   qryCriterios.ParamByName('cd_coligada').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryCriterios.Open;

   while not qryCriterios.Eof do
   begin
      item := TItemCombo.Create(
         qryCriterios.FieldByName('cd_apropriacao').AsString,
         qryCriterios.FieldByName('ds_apropriacao').AsString,
         qryCriterios.FieldByName('centro_custo').AsString
      );

      cbCriterios1.Items.AddObject(item.descricao, item);

      qryCriterios.Next;
   end;

   item := TItemCombo.Create('-1', 'Manual');

   cbCriterios1.Items.AddObject(item.descricao, item);
end;

procedure TfrmLancamentosManuais.carregaProximaChave;
begin
   qryBuscaProximaChave.Close;
   qryBuscaProximaChave.Open;

   if qryBuscaProximaChave.FieldByName('chave').AsString = '' then
   begin
      edChave.Text := '0';
   end
   else
   begin
      edChave.Text := qryBuscaProximaChave.FieldByName('chave').AsString;
   end;
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
begin
   habilitaSalvarEdicao(True);

   if TUMEditMonetario(procuraComponente('edValor', TUMComboBox(Sender).Tag)).getValorDouble = 0 then
   begin
      Mensagem(
         'Por favor digite um valor para o lançamento',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      TUMEditMonetario(procuraComponente('edValor', TUMComboBox(Sender).Tag)).SetFocus;
      TUMComboBox(Sender).ItemIndex := -1;

      Exit;
   end;

   validaCriterios(TUMComboBox(Sender).Tag);
end;

procedure TfrmLancamentosManuais.cbCriterios1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      Perform(CM_DIALOGKEY, VK_TAB, 0);
      Key := 0;
   end;
end;

procedure TfrmLancamentosManuais.cbCriterios1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
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

procedure TfrmLancamentosManuais.CorrigeApropriacoes(Tag: Integer);
var
   i: Integer;
   vl_total, vl_rateio, vl_lancamento, vl_ajuste: Double;
   Grid: TStringGrid;
begin

   Grid := TStringGrid(procuraComponente('stRateios', Tag));                        

   if not(Grid.RowCount > 3) then
   begin
      Exit;
   end;

   for I := 1 to Grid.RowCount - 2 do
   begin
      vl_total := RoundFloat(StrToFloat(StringReplace(Grid.Cells[2, I], '.', '', [rfReplaceAll, rfIgnoreCase])), 2) + RoundFloat(vl_total, 2);
   end;

   vl_lancamento := TUMEditMonetario(procuraComponente('edValor', Tag)).getValorDouble;

   vl_ajuste := RoundFloat(vl_lancamento - vl_total, 2);

   Grid.Cells[2, grid.RowCount - 1] := FormatFloat( '###,###,##0.00', vl_ajuste );
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
   Edit.OnKeyPress := MaskEdit.OnKeyPress;
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

      if (PanelCopia.Controls[i] as TComponent) is TStringGrid then
      begin
         CriaStringGrid(
            (PanelCopia.Controls[i] as TStringGrid),
            Panel,
            Index
         );
      end;

      if (PanelCopia.Controls[i] as TComponent) is TEdit then
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

procedure TfrmLancamentosManuais.edValor1Change(Sender: TObject);
begin
   habilitaSalvarEdicao(True);
   atualizaValores();
end;

procedure TfrmLancamentosManuais.edValor1Exit(Sender: TObject);
begin
   atualizaValores();

   if (TUMEditMonetario(Sender).getValorDouble > 0) and
      (TUMComboBox(procuraComponente('cbCriterios', TUMEditMonetario(Sender).Tag)).ItemIndex > -1) then
   begin
      validaCriterios(TUMEditMonetario(Sender).Tag);
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
   GridRateios: TStringGrid;
   pnRateios: TPanel;
   i: Integer;
begin

   CentroDeCusto := TUMComboBox(Self.FindComponent('cbCriterios' + IntToStr(index)));

   CodigoCredito := TEdit(Self.FindComponent('edCodigoCredito' + IntToStr(index)));
   CodigoDebito := TEdit(Self.FindComponent('edCodigoDebito' + IntToStr(index)));
   CodigoHistorico := TEdit(Self.FindComponent('edCodigoHist' + IntToStr(index)));

   ValorLancamento := TUMEditMonetario(Self.FindComponent('edValor' + IntToStr(index)));

   GridRateios := TStringGrid(Self.FindComponent('stRateios' + IntToStr(index)));

   pnRateios := TPanel(procuraComponente('pnRateios', Index));

   cbCaixaBancoDebito := TUMComboBox(procuraComponente('cbCaixaBancoDebito', Index));
   cbCaixaBancoCredito := TUMComboBox(procuraComponente('cbCaixaBancoCredito', Index));
   
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
         ValorTotalRateios := getValorTotalRateios(Index);

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

      // Verifica se usuário SELECIONOU um centro de custo
      if (CentroDeCusto.ItemIndex = -1) then
      begin
         Mensagem('Selecione um centro de custo.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         CentroDeCusto.SetFocus;
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

procedure TfrmLancamentosManuais.validaCriterios(Tag: Integer);
var
   Grid: TStringGrid;
   i: Integer;
   qryBuscaItensCriterio: TUMZReadOnlyQuery;
   vl_percentual_rateio, vl_rateio, vl_lancamento: Double;
   cbCriterios: TUMComboBox;
   Primeiro, isCentroCusto: Boolean;
begin
   Grid := TStringGrid(Self.FindComponent('stRateios' + IntToStr(Tag)));

   DM.CriarConsulta(qryBuscaItensCriterio);

   cbCriterios := TUMComboBox(procuraComponente('cbCriterios', tag));

   isCentroCusto := (TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).variavel = '1');

   TPanel(Self.FindComponent('pnRateios' + IntToStr(Tag))).Visible := True;
   TStringGrid(procuraComponente('stRateios', Tag)).Visible := True;
   TLabel(Self.FindComponent('lbRateios' + IntToStr(Tag))).Caption := 'Valor total:';
   TButton(Self.FindComponent('btInserir' + IntToStr(Tag))).Visible := False;
   TButton(Self.FindComponent('btAlterar' + IntToStr(Tag))).Visible := False;
   TButton(Self.FindComponent('btExcluir' + IntToStr(Tag))).Visible := False;

   // Verifica se usuário vai fazer rateio manual
   if TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).codigo = '-1' then
   begin
      TButton(Self.FindComponent('btInserir' + IntToStr(Tag))).Visible := True;
      TButton(Self.FindComponent('btAlterar' + IntToStr(Tag))).Visible := True;
      TButton(Self.FindComponent('btExcluir' + IntToStr(Tag))).Visible := True;
   end;

   // Verifica se usuário optou por usar um critério de apropriação
   if (TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).codigo <> '-1') and
      not(isCentroCusto) then
   begin
      limpaGrid(grid);

      qryBuscaItensCriterio.SQL.Text := SQL_BUSCA_ITENS_CRITERIO;

      qryBuscaItensCriterio.ParamByName('cd_apropriacao').AsInteger :=
         StrToInt(TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).codigo);

      qryBuscaItensCriterio.Open;

      Primeiro := True;

      if qryCriterios.Locate(
            'cd_apropriacao',
            StrToInt(TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).codigo),
            [loCaseInsensitive] ) then
      begin
         while not qryBuscaItensCriterio.Eof do
         begin
            if qryBuscaItensCriterio.FieldByName('vl_apropriacao').AsFloat > 0 then
            begin

               if not(Primeiro) then
               begin
                  Grid.RowCount := Grid.RowCount + 1;
               end;

               vl_lancamento := TUMEditMonetario(procuraComponente('edValor', Tag)).getValorDouble;

               vl_percentual_rateio :=
                  qryBuscaItensCriterio.FieldByName('vl_apropriacao').AsFloat / qryCriterios.FieldByName('vl_total').AsFloat;

               vl_rateio := RoundFloat(vl_lancamento * vl_percentual_rateio, 2);

               Grid.Cells[0, (Grid.RowCount-1)] := qryBuscaItensCriterio.FieldByName('cd_centro').AsString;
               Grid.Cells[1, (Grid.RowCount-1)] := qryBuscaItensCriterio.FieldByName('ds_centro').AsString;
               Grid.Cells[2, (Grid.RowCount-1)] := FormatFloat( '###,###,##0.00', vl_rateio );

               Primeiro := False;
            end;

            qryBuscaItensCriterio.Next;
         end;
      end;

      CorrigeApropriacoes(Tag);
   end;

   if isCentroCusto then
   begin

      limpaGrid(grid);

      Grid.Cells[0, 1] := TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).codigo;
      Grid.Cells[1, 1] := TItemCombo(cbCriterios.Items.Objects[cbCriterios.ItemIndex]).descricao;
      Grid.Cells[2, 1] := TUMEditMonetario(procuraComponente('edValor', cbCriterios.Tag)).getValorformatado;
   end;

   AtualizaValorRateios(Tag);
end;

function TfrmLancamentosManuais.verificaConta(index: Integer; categoria: TCategoriaConta): TTiposConta;
const
   // Busca todas contas que tem o codigo de classificação MENOR ou IGUAL ao
   // código da conta informada no campo
   SQL_BUSCA_CONTAS = ' SELECT '+
      ' 	cd_classificacao, '+
      ' 	cd_conta, '+
      '  cd_grupo_contas '+
      ' FROM '+
      ' 	fin_config_plano_contas '+
      ' WHERE '+
      ' 	cd_grupo_contas IS NOT NULL '+
      ' 	AND cd_classificacao <= (SELECT cd_classificacao FROM fin_config_plano_contas '+
      '     WHERE cd_conta = :cd_conta )';

   SQL_BUSCA_CLASSIFICACAO = ' SELECT '+
      '  cd_classificacao '+
      ' FROM '+
      '  fin_config_plano_contas '+
      ' WHERE '+
      '  cd_conta = :cd_conta ';
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

   qyBuscaPlanoContas.Open;

   qyBuscaClassificacao.ParamByName('cd_conta').AsInteger :=
      StrToInt(campoCodigo.Text);

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
   qryBuscaContas.Open;

   qryBuscaHistoricos.Close;
   qryBuscaHistoricos.Open;

   qryCadastroContasAtivas.Close;
   qryCadastroContasAtivas.Open;

   carregaProximaChave;
   carregaCriterios;
   carregaTiposTitulos;

   DM.CarregaColigadas(cbColigadasLanc);

   // Formato padrão GRID
   stRateios1.Cells[0, 0] := 'Centro';
   stRateios1.ColWidths[0] := 50;
   stRateios1.ColCount := stRateios1.ColCount + 1;
   stRateios1.Cells[1, 0] := 'Descrição';
   stRateios1.ColWidths[1] := 290;
   stRateios1.ColCount := stRateios1.ColCount + 1;
   stRateios1.Cells[2, 0] := 'Valor';
   stRateios1.ColWidths[2] := 110;
   // Formato padrão GRID

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

function TfrmLancamentosManuais.getValorTotalRateios(Index: Integer): Currency;
var
   i: Integer;
   Grid: TStringGrid;
begin
   Grid := TStringGrid(Self.FindComponent('stRateios' + IntToStr(index)));

   Result := 0;

   for I := 1 to Grid.RowCount - 1 do
   begin
      if Grid.Cells[2, I] <> '' then
      begin
         Result := Result + StrToFloat(StringReplace(Grid.Cells[2, i], '.', '', [rfIgnoreCase, rfReplaceAll]));
      end;
   end;
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
   gridDebito: TStringGrid;
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
      ' 	cd_movimento_te, '+
      ' 	cd_conta, '+
      ' 	cd_coligada, '+
      ' 	cd_centro, '+
      ' 	vl_movimento '+
      ' ) '+
      ' VALUES '+
      ' 	(:cd_movimento_te, :cd_conta, :cd_coligada, :cd_centro, :vl_movimento) ';

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

            gridDebito := TStringGrid(procuraComponente('stRateios', tagAtual));

            // Percorre o rateio da conta DEBITO RESULTADO
            for k := 1 to gridDebito.RowCount - 1 do
            begin

               if gridDebito.Cells[2, k] = '' then
               begin
                  Continue;
               end;

               // Porcentagem de quanto representa o valor do rateio atual
               // em relação ao valor total da conta DEBITO RESULTADO
               percValorRateio := (StrToFloat(StringReplace(gridDebito.Cells[2, k], '.', '', [rfIgnoreCase, rfReplaceAll])) * 100) / valorDebito;

               valorInserir := (percValorRateio * ((percValorDebito * valor) / 100)) / 100;

               qryInsereRateio.ParamByName('cd_movimento_te').AsInteger :=
                  CodigoMovimento;

               qryInsereRateio.ParamByName('vl_movimento').AsFloat :=
                  valorInserir;

               qryInsereRateio.ParamByName('cd_coligada').AsInteger :=
                  TColigada(cbColigadasLanc.Items.Objects[cbColigadasLanc.ItemIndex]).Codigo;

               qryInsereRateio.ParamByName('cd_centro').AsInteger :=
                  StrToInt(gridDebito.Cells[0, k]);

               qryInsereRateio.ParamByName('cd_conta').AsInteger :=
                  StrToInt(edit.Text);

               qryInsereRateio.ExecSQL;   
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
   gridDebito: TStringGrid;
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

            gridDebito := TStringGrid(procuraComponente('stRateios', tagAtual));

            // Percorre o rateio da conta DEBITO RESULTADO
            for k := 1 to gridDebito.RowCount - 1 do
            begin

               if gridDebito.Cells[2, k] = '' then
               begin
                  Continue;
               end;

               // Porcentagem de quanto representa o valor do rateio atual
               // em relação ao valor total da conta DEBITO RESULTADO
               percValorRateio := (StrToFloat(StringReplace(gridDebito.Cells[2, k], '.', '', [rfIgnoreCase, rfReplaceAll])) * 100) / valorDebito;

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
               ExecutaRateioCP.Centro := StrToInt(gridDebito.Cells[0, k]);
               ExecutaRateioCP.Valor := valorInserir;

               ExecutaRateioCP.SetDependencia(cd_titulo);

               Result.Add(ExecutaRateioCP);
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
         ' 	* '+
         ' FROM '+
         ' 	fin_cadastro_contas fcc '+
         ' WHERE '+
         ' 	fcc.cd_plano_conta = :codigo ';

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
   gridRateios: TStringGrid;
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

         if (Self.Components[i] is TPanel) and
            (Self.Components[i].Name = 'stRateios1') then
         begin
            gridRateios := TStringGrid(Self.Components[i]);

            limpaGrid(gridRateios);

            gridRateios.Visible := False;
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

   btInserir := TButton(procuraComponente('btInserir', Tag));
   btAlterar := TButton(procuraComponente('btAlterar', Tag));
   btExcluir := TButton(procuraComponente('btExcluir', Tag));

   stRateios := TStringGrid(procuraComponente('stRateios', Tag));

   lbCentroCusto := TLabel(procuraComponente('lbCentroCusto', Tag));
   // Carrega Componentes

   // Limpa a Grid
   limpaGrid(stRateios);

   stRateios.FixedRows := 1;

   // Esconde botões de rateio manual
   btInserir.Visible := False;
   btAlterar.Visible := False;
   btExcluir.Visible := False;

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

procedure TfrmLancamentosManuais.limpaGrid(grid: TStringGrid);
var
   i: Integer;
begin
   with Grid do
   begin
      for i := 1 to RowCount -2 do
      begin
         Cells[0,i] := '';
         Cells[1,i] := '';
         Cells[2,i] := '';
      end;
      
      RowCount := 2;
   end;
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

   btInserir := TButton(procuraComponente('btInserir', Tag));
   btAlterar := TButton(procuraComponente('btAlterar', Tag));
   btExcluir := TButton(procuraComponente('btExcluir', Tag));

   stRateios := TStringGrid(procuraComponente('stRateios', Tag));

   lbCentroCusto := TLabel(procuraComponente('lbCentroCusto', Tag));
   lbRateios := TLabel(procuraComponente('lbRateios', Tag));
   // Carrega Componentes

   // Limpa a Grid
   limpaGrid(stRateios);

   // Esconde botões de rateio manual
   btInserir.Visible := False;
   btAlterar.Visible := False;
   btExcluir.Visible := False;

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

   if Mensagem('Tem certeza que deseja remover este lançamento ?', 'Aviso', MB_ICONWARNING+MB_YESNO) <> mrYes then
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
   ValorCompromissoMinimo: Double;
   VencimentoCompromisso: TDateTime;
   CodigoCaixa: Integer; 
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

   ListaExecucao := TListaExecucao.Create;

   { SE estiver em modo de alteração deve excluir tudo que está associado a
     este lançamento para criar novamente. Não há problema em excluir os
     lançamentos relacionados a primary key pois os lançamentos são identificados
     pelo cd_chave e não pela primary_key }
     
   if (modoTela = mtAlterar) then
   begin

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
   end;

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

            Movimento.EntradaSaida := 2;
            Movimento.DataLiberacao := Date;
            Movimento.DataMovimento := DM.DataAtual;
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

            // Reposição da transferência
            Movimento.EntradaSaida := 1;
            Movimento.CodigoSaida := ExecutaLancamento.Titulo;
            Movimento.DataLiberacao := Date;
            Movimento.DataMovimento := DM.DataAtual;
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
               
               Movimento.EntradaSaida := 1;
               Movimento.DataLiberacao := Date;
               Movimento.DataMovimento := DM.DataAtual;
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

               Movimento.EntradaSaida := 2;
               Movimento.DataLiberacao := Date;
               Movimento.DataMovimento := DM.DataAtual;
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

         if slAbasComRateio.Values['pnRateios' + IntToStr(indexAtual)] = 'ativo' then
         begin
            ExecutaLancamento.Criterio :=
               StrToInt(TItemCombo(TUMComboBox(procuraComponente('cbCriterios', indexAtual)).Items.Objects[TUMComboBox(procuraComponente('cbCriterios', indexAtual)).ItemIndex]).getCodigo);
         end;

         ListaExecucao.Add(ExecutaLancamento);

         GridAux := TStringGrid(Self.FindComponent('stRateios' + IntToStr(indexAtual)));

         if (TUMComboBox(Self.FindComponent('cbCriterios' + IntToStr(indexAtual))).Visible) then
         begin
            for k := 1 to GridAux.RowCount - 1 do
            begin
               if GridAux.Cells[2, k] <> '' then
               begin
                  ExecutaRateioLC := TExecucaoRateioLC.Create(teInsert);

                  ExecutaRateioLC.Centro := StrToInt(GridAux.Cells[0, k]);
                  ExecutaRateioLC.Valor := StrToFloat(StringReplace(GridAux.Cells[2, k], '.', '', [rfReplaceAll]));
                  ExecutaRateioLC.SetDependencia(ExecutaLancamento);

                  ListaExecucao.Add(ExecutaRateioLC);
               end;
            end;
         end;
      end;
   end;

   Result := ListaExecucao.ExecuteAll();
   
   for I := 0 to ListaExecucao.Count - 1 do
   begin
      if ListaExecucao.Item[i] is TExecucaoCompromisso then
      begin
         geraMovimento(
            GerarTitulos,
            IntToStr(TExecucaoCompromisso(ListaExecucao.Item[i]).LastInsertID),
            IntToStr(TExecucaoCompromisso(ListaExecucao.Item[i]).Coligada),
            TExecucaoCompromisso(ListaExecucao.Item[i]).Valor
         );
      end;
   end;
end;

procedure TfrmLancamentosManuais.btAlterar1Click(Sender: TObject);
var
   res: TResultadoCentros;
   Grid: TStringGrid;
   valorGrid: String;
begin
   if (TUMEditMonetario(procuraComponente('edValor', TButton(Sender).Tag)).Text = '') then
   begin
      Mensagem('Informe o valor do lançamento.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      Exit;
   end;

   Grid := TStringGrid(self.FindComponent('stRateios' + IntToStr(TButton(Sender).Tag)));

   valorGrid := StringReplace(Grid.Cells[2, stRateios1.Row], '.', '', [rfReplaceAll, rfIgnoreCase]);

   res := TfrmSelecionarCentro.Filtrar(
      TUMEditMonetario(procuraComponente('edValor', TButton(Sender).Tag)).getValorDouble,
      StrToInt(Grid.Cells[0, stRateios1.Row]),
      StrToFloat(valorGrid)
   );

   if res.codigo = -1 then
   begin
      Exit;
   end;

   Grid.Cells[0, Grid.Row] := IntToStr(res.codigo);
   Grid.Cells[1, Grid.Row] := res.descricao;
   Grid.Cells[2, Grid.Row] := FloatToStr(res.valor);

   atualizaValorRateios(TButton(Sender).Tag);
end;

procedure TfrmLancamentosManuais.btAlterarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLancamentosManuais.btInserir1Click(Sender: TObject);
var
   res: TResultadoCentros;
   Grid: TStringGrid; 
begin
   if (TUMEditMonetario(procuraComponente('edValor', TButton(Sender).Tag)).Text = '') then
   begin
      Mensagem('Informe o valor do lançamento.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
      Exit;
   end;

   res := TfrmSelecionarCentro.Filtrar(
      TUMEditMonetario(procuraComponente('edValor', TButton(Sender).Tag)).getValorDouble
   );

   if res.codigo = -1 then
   begin
      Exit;
   end;

   Grid := TStringGrid(self.FindComponent('stRateios' + IntToStr(TButton(Sender).Tag)));

   if Grid.Cells[0, 1] <> '' then
   begin
      Grid.RowCount := Grid.RowCount + 1;
   end;

   Grid.Cells[0, (Grid.RowCount-1)] := IntToStr(res.codigo);
   Grid.Cells[1, (Grid.RowCount-1)] := res.descricao;
   Grid.Cells[2, (Grid.RowCount-1)] := FloatToStr(res.valor);

   atualizaValorRateios(TButton(Sender).Tag);
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

end.
