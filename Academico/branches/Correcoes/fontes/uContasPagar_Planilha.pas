unit uContasPagar_Planilha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, Buttons, StrUtils, UMComboBox,
  uFSelecionarPessoa, uFSelecionarConta, UMDateTimePicker, ZSqlProcessor,
  ZDbcIntfs, UZDbcFuncs, UDateTimePicker;

type
   Tfrm_Compromisso_Planilha = class(TForm)
    pnTitulo: TPanel;
    Panel4: TPanel;
    srcContasPagar: TDataSource;
    pmQtd: TPopupMenu;
    grd: TDBGrid;
    pnRodape: TPanel;
    sbGerarCompromisso: TSpeedButton;
    sbBaixarCompromisso: TSpeedButton;
    sbFechar: TSpeedButton;
    pmBaixarCompromisso: TPopupMenu;
    BaixaporPagamento1: TMenuItem;
    BaixaporCancelamento1: TMenuItem;
    BaixaporDesconto1: TMenuItem;
    pnlFiltros: TPanel;
    pmFiltros: TPopupMenu;
    Todos1: TMenuItem;
    Selecionar1: TMenuItem;
    Bevel4: TBevel;
    sbPreparar: TSpeedButton;
    sbAlterar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbBaixarCancelar: TSpeedButton;
    sbBaixarDesconto: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbEstornar: TSpeedButton;
    pmFormaPgto: TPopupMenu;
    Forma11: TMenuItem;
    Forma21: TMenuItem;
    Forma31: TMenuItem;
    sbCheque: TSpeedButton;
    qyCalcCC: TUMZQuery;
    sbAutorizar: TSpeedButton;
    qyMaxParcela: TUMZQuery;
    qryContasPagar: TUMZQuery;
    qryContasPagarCD_PREPARACAO: TLargeintField;
    qryContasPagarCD_TITULO: TLargeintField;
    qryContasPagarCD_COLIGADA: TIntegerField;
    qryContasPagarCD_PESSOA: TIntegerField;
    qryContasPagarDS_DESPESA: TStringField;
    qryContasPagarNR_DOCUMENTO: TStringField;
    qryContasPagarNR_PARCELA: TIntegerField;
    qryContasPagarDT_EMISSAO_NOTA: TDateTimeField;
    qryContasPagarDT_LANCAMENTO: TDateTimeField;
    qryContasPagarDT_COMPETENCIA: TDateTimeField;
    qryContasPagarDT_VENCIMENTO: TDateTimeField;
    qryContasPagarDT_PROVAVEL_PGTO: TDateTimeField;
    qryContasPagarDT_PAGAMENTO: TDateTimeField;
    qryContasPagarVL_DESPESA: TFloatField;
    qryContasPagarCD_SITUACAO: TIntegerField;
    qryContasPagarSN_PREVISAO: TStringField;
    qryContasPagarCD_TIPO_TITULO: TIntegerField;
    qryContasPagarTP_ENTRADA_SAIDA: TIntegerField;
    qryContasPagarNR_CHEQUE: TLargeintField;
    qryContasPagarCD_CAIXA: TLargeintField;
    qryContasPagarCD_TITULO_ORIGEM: TLargeintField;
    qryContasPagarCD_AUTORIZA: TLargeintField;
    qryContasPagarCD_TITULO_PRINCIPAL: TLargeintField;
    qryContasPagarNM_USUARIO_AUTORIZA: TStringField;
    qryContasPagarNM_PESSOA: TStringField;
    qryContasPagarDS_CAIXA: TStringField;
    qryContasPagarDS_PREPARACAO: TStringField;
    qryContasPagarCD_AUTORIZA_SITU: TLargeintField;
    qryContasPagarDT_AUTORIZA: TDateTimeField;
    qryContasPagarVL_ENTRADAS: TFloatField;
    qryContasPagarVL_SAIDAS: TFloatField;
    qryContasPagarVL_LIQUIDO: TFloatField;
    qryContasPagarsitu: TStringField;
    qryContasPagarvl_pendente: TFloatField;
    qryContasPagarCentroCusto: TStringField;
    qryContasPagarCentroCustoValor: TStringField;
    qryContasPagarPlanoContas: TStringField;
    qryContasPagards_autoriza: TStringField;
    qryContasPagards_parcela: TStringField;
    qryContasPagarContasCod: TStringField;
    qryContasPagarCentrosCod: TStringField;
    qyCalcCCCD_CONTA: TStringField;
    qyCalcCCDS_CENTRO: TStringField;
    qyCalcCCVL_MOVIMENTO: TFloatField;
    qyMaxParcelaPARCELA: TLargeintField;
    qryContasPagarCD_FORMA_PGTO: TIntegerField;
    qryContasPagarCD_ANEXO: TLargeintField;
    imgAnexo: TImageList;
    qyCalcCCCD_CENTRO: TIntegerField;
    qyCalcCCDS_CONTA: TStringField;
    Panel2: TPanel;
    lbQtdTitulos: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbPendente: TLabel;
    lbValorQtdTitulos: TLabel;
    lbValorQtdFornecedores: TLabel;
    qryContasPagarCD_AUTORIZA_SITU_ORDENA: TLargeintField;
    qryContasPagarvalor_pagar: TFloatField;
    qryContasPagarvl_abatimento: TFloatField;
    qryContasPagarvl_desconto: TFloatField;
    qryContasPagarvl_multa: TFloatField;
    qryContasPagarvl_mora: TFloatField;
    qryContasPagarDS_OBSERVACAO: TStringField;
    sqlExcluir: TZSQLProcessor;
    Label1: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    pnlFiltrosTitulo: TPanel;
    bvlSep1: TBevel;
    sbColigada: TSpeedButton;
    Label3: TLabel;
    cbDataFiltro: TComboBox;
    lbDataInicial: TLabel;
    dtpDataDe: TDatePickerEx;
    lbDataFinal: TLabel;
    dtpDataAte: TDatePickerEx;
    lblFiltroCheque: TLabel;
    edtFiltroCheque: TEdit;
    sbEmAberto: TSpeedButton;
    sbPagos: TSpeedButton;
    sbPrevisoes: TSpeedButton;
    sbFormaPgto: TSpeedButton;
    sbTitulo: TSpeedButton;
    sbPorFornecedor: TSpeedButton;
    sbPorCentro: TSpeedButton;
    sbPorConta: TSpeedButton;
    sbFiltraContaCaixa: TSpeedButton;
    sbSelecionarColuna: TSpeedButton;
    qryContasPagarSN_NF_ENTREGUE: TStringField;
    qryContasPagards_forma_pgto: TStringField;
    btnCreditos: TSpeedButton;
    pmOutrasOpcoes: TPopupMenu;
    Gerarcrditoparaapessoa1: TMenuItem;
    Utilizarcrditosdisponveis1: TMenuItem;
    miCreditosVisualizar: TMenuItem;
    procedure miCreditosVisualizarClick(Sender: TObject);
    procedure Utilizarcrditosdisponveis1Click(Sender: TObject);
    procedure Gerarcrditoparaapessoa1Click(Sender: TObject);
    procedure btnCreditosClick(Sender: TObject);
    procedure edtFiltroChequeExit(Sender: TObject);
    procedure edtFiltroChequeChange(Sender: TObject);
    procedure edtFiltroChequeKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataAteExit(Sender: TObject);
    procedure dtpDataDeExit(Sender: TObject);
    procedure dtpDataAteChange(Sender: TObject);
    procedure dtpDataDeChange(Sender: TObject);
    procedure dtpDataAteSelectDate(const Value: TDate);
    procedure dtpDataDeSelectDate(const Value: TDate);
    procedure grdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryContasPagarvalor_pagarGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sbFiltraContaCaixaClick(Sender: TObject);
    procedure cbUnidadeEnsinoChange(Sender: TObject);
    procedure cbUnidadeEnsinoSelect(Sender: TObject);
    procedure sbColigadaClick(Sender: TObject);
    procedure qryContasPagarCD_ANEXOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryContasPagarcd_autoriza_situGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure sbAutorizarClick(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbTituloClick(Sender: TObject);
    procedure grdTitleClick(Column: TColumn);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbChequeClick(Sender: TObject);
    procedure sbFormaPgtoClick(Sender: TObject);
    procedure sbPrevisoesClick(Sender: TObject);
    procedure sbPagosClick(Sender: TObject);
    procedure sbEmAbertoClick(Sender: TObject);
    procedure sbEstornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qryContasPagarAfterInsert(DataSet: TDataSet);
    procedure qryContasPagarCalcFields(DataSet: TDataSet);
    procedure sbFecharClick(Sender: TObject);
    procedure sbPorFornecedorClick(Sender: TObject);
    procedure sbPorContaClick(Sender: TObject);

    Procedure Filtra;
    procedure grdDblClick(Sender: TObject);
    procedure sbGerarCompromissoClick(Sender: TObject);
    procedure srcContasPagarDataChange(Sender: TObject; Field: TField);
    procedure Selecionar1Click(Sender: TObject);
    procedure sbPorCentroClick(Sender: TObject);
    procedure Todos1Click(Sender: TObject);
    procedure cbDataFiltroChange(Sender: TObject);
    procedure sbAlterarClick(Sender: TObject);
    procedure sbBaixarCompromissoClick(Sender: TObject);
    procedure sbBaixarCancelarClick(Sender: TObject);
    procedure sbBaixarDescontoClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbPrepararClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    function tituloEmPreparacao(cd_titulo:Integer):Boolean;
  strict private
   plano_contas_filtro: String;
   resultado: TResultadoFiltroPessoa;
   resultadoConta: TResultadoFiltroConta;
   procedure CarregarColigadasFilhas();
   procedure CarregarFormasPagamento();
  private
    { Private declarations }
      FAtualizar: Boolean;
    qAuxCP : TUMZQuery;
    qAuxCP02 : TUMZQuery;
    bookmarkTitulo : Pointer;
    r_anterior, r_atual: Integer;

    // Campos para apresentar resumo em tela
    QtdTitulos,
    QtdFornecedores: Integer;

    VlPendente,
    VlBaixado: Double;

    codigo_titulo, filtro, filtro2, cd_caixa, fornecedor, plano_contas, plano_centro_custos: integer;
    Autoriza : Boolean;

    FSQLOriginal: string;
    procedure AtualizarBotaoPreparacao;
    Procedure FormaClick(Sender : TObject);
    Procedure GerarFatura;
    Procedure GerarFatura2;
    procedure AtualizaResumo(SFiltro: String; dtInicial, dtFinal: TDateTime);
    Function GetParametroUltimoTitulo() : string;
  public
    { Public declarations }
  end;

var
  frm_Compromisso_Planilha: Tfrm_Compromisso_Planilha;

const
  iModuloPadrao = 2033;

implementation

uses
   Main, uDM, uSelConta, uSelCentro, Math, uCompromissos_baixar,
   uContasPagar_Movimentacoes, uContasPagar_GerarCompromisso, uCamposPlanilhas,
   uCompromissos_gerar, uClassMovimento, uCompromisso_preparar, uContasPagar,
   uCompromissos_Cheques, uCompromisso_autorizar, uCompromisso_cadastro,
   uUsuario, uEstorno, ClassRegistros, uListaColigadas, uColigada,
   uFSelecionarColigada, uFGerarCreditoCP, uFAplicarCreditoCP, uGeneral, uCompromissos, uFFinCreditosCPVisualizar;

{$R *.dfm}

procedure Tfrm_Compromisso_Planilha.FormShow(Sender: TObject);
begin
   // Posicao do botão Créditos
   btnCreditos.Left := pnlFiltros.Width - 87;
   
   CarregarColigadasFilhas();

   if frm_ContasPagar_Movimentacoes = nil then
      Application.CreateForm(Tfrm_ContasPagar_Movimentacoes, frm_ContasPagar_Movimentacoes);

   FAtualizar := False;
   FSQLOriginal := qryContasPagar.SQLList.Values[DM.db.Protocol];
   // Ao abrir o formulário

   cbDataFiltro.ItemIndex := 1;

   //Abrir como padrao os compromissos de hoje
   dtpDataDe.SelectedDate := DataHoje;
   dtpDataAte.SelectedDate := DataHoje;

   qryContasPagar.Close();

   filtro := -1;
   filtro2 := -1;

   CarregarFormasPagamento();
   // terminou o preenchimento das formas de pagamento

   // Verificar se o usuario tem autorizacao para autorizar pagamentos, neste caso, ele poderá baixar também direto.
   Autoriza := DM.UsuarioLogado.TemPermissao( 2046, npIncluir, false );

   plano_contas := 0;
   plano_centro_custos := 0;
   fornecedor := 0;
   cd_caixa := 0;
   codigo_titulo := 0;

   Filtra;

end;

procedure Tfrm_Compromisso_Planilha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if frm_ContasPagar_Movimentacoes <> nil then
   begin
      frm_ContasPagar_Movimentacoes.Free;
      frm_ContasPagar_Movimentacoes := nil;
   end;

   // Fechar o formulário
   FreeAndNil(qAuxCP);
   FreeAndNil(qAuxCP02);
   Action := caFree;
end;

procedure Tfrm_Compromisso_Planilha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    VK_F2 : if sbGerarCompromisso.Enabled then sbGerarCompromissoClick( nil );
    VK_F3 : if sbAlterar.Enabled then sbAlterarClick( nil );
    VK_F5 : Filtra;
    VK_F6 : if sbBaixarCancelar.Enabled AND sbBaixarCancelar.Visible then sbBaixarCancelarClick( nil );
    VK_F7 : if sbImprimir.Enabled then sbImprimirClick( nil );
    VK_F9 : if sbExcluir.Enabled AND sbExcluir.Visible then sbExcluirClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_Compromisso_Planilha.AtualizaResumo(SFiltro: String; dtInicial, dtFinal: TDateTime);
const
   SQL_FILTRO_RESUMO =
      ' SELECT ' +
      ' 	COUNT(DISTINCT cp.cd_titulo) AS qtd_titulos, ' +
      ' 	COUNT(DISTINCT cp.cd_pessoa) AS qtd_fornecedores, ' +
      ' 	ROUND(SUM(mv.vl_entrada), 2) AS vl_total, ' +
      ' 	ROUND(SUM(mv.vl_saida), 2) AS vl_baixado, ' +
      ' 	ROUND(SUM(mv.vl_entrada), 2) - ROUND(SUM(COALESCE(mv.vl_saida, 0)), 2) AS vl_pendente ' +
      ' FROM ' +
      ' 	fin_contas_pagar as cp ' +
      ' INNER JOIN fin_mov_cp as mv ON ( ' +
      '   mv.cd_titulo = cp.cd_titulo AND ' +
      '   mv.cd_coligada = cp.cd_coligada ' +
      ' ) ' +
      ' INNER JOIN                        '+
      '('+
      'select aa.* from FIN_APROPRIA_CP aa '+
      ' INNER JOIN fin_contas_pagar AS cpa ON (cpa.CD_TITULO_PRINCIPAL = Aa.CD_TITULO) AND ( CPa.CD_COLIGADA = Aa.CD_COLIGADA) '+
      ' WHERE 1= 1 AND :filtros '+
      ' GROUP BY aa.cd_titulo) as a ON '+
      ' (CP.CD_TITULO_PRINCIPAL = A.CD_TITULO) AND (CP.CD_COLIGADA = A.CD_COLIGADA) '+
      ' WHERE ';
var
   qryResumo: TUMZReadOnlyQuery;
   filtroInterno: String;    
begin

   DM.CriarConsulta(qryResumo);

   qryResumo.SQL.Text := SQL_FILTRO_RESUMO + SFiltro;

   filtroInterno := StringReplace(SFiltro, 'A.', 'aa.',[rfReplaceAll, rfIgnoreCase]);
   filtroInterno := StringReplace(filtroInterno, 'CP.', 'cpa.',[rfReplaceAll, rfIgnoreCase]);
   qryResumo.SQL.Text := StringReplace(qryResumo.SQL.Text, ':filtros', filtroInterno,[rfReplaceAll, rfIgnoreCase]);

   if Pos( ':DT_INICIAL' , qryResumo.SQL.Text) > 0 then
   begin
      qryResumo.ParamByName('DT_INICIAL').AsDate := dtInicial;
   end;

   if Pos( ':DT_FINAL' , qryResumo.SQL.Text) > 0 then
   begin
      qryResumo.ParamByName('DT_FINAL').AsDate := dtFinal;
   end;

   if cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex] is TColigada then
   begin
      qryResumo.SQL.Add(' AND cp.cd_coligada = :cd_coligada ');
      qryResumo.ParamByName('cd_coligada').AsInteger :=
         TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;
   end
   else
   begin
      qryResumo.SQL.Add(' AND cp.cd_coligada IN (%s) ');
      qryResumo.SQL.Text := Format(
         qryResumo.SQL.Text,
         [DM.UsuarioLogado.GetColigadasFilhaSelecionada]
      );
   end;
   
   qryResumo.Open;

   lbValorQtdTitulos.Caption := qryResumo.FieldByName('qtd_titulos').AsString;
   lbValorQtdFornecedores.Caption := qryResumo.FieldByName('qtd_fornecedores').AsString;
   lbPendente.Caption :=
      'Pendente:  R$ ' +
      qryResumo.FieldByName('vl_pendente').AsString +
      '   + Baixado:  R$ ' +
      qryResumo.FieldByName('vl_baixado').AsString +
      '   = Total:  R$ ' +
      FloatToStr(qryResumo.FieldByName('vl_total').AsFloat);
end;

procedure Tfrm_Compromisso_Planilha.btnSairClick(Sender: TObject);
begin
   // Fechar o formulário
   Close();
end;

procedure Tfrm_Compromisso_Planilha.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryContasPagar, pmQtd);
end;

procedure Tfrm_Compromisso_Planilha.qryContasPagarAfterInsert(DataSet: TDataSet);
begin
  // Ao inserir 

  qryContasPagar.FieldByName('codigo').AsInteger := DM.ProximoId('codigo', 'tabela');
end;

procedure Tfrm_Compromisso_Planilha.qryContasPagarCalcFields(DataSet: TDataSet);
Var
  sCentro : String;
  sCentroValor : String;
  sConta : String;
  sOp, sOp2 : String;
  sContasCod : String;
  sCEntroCod : String;
  iMaxParcela : integer;
begin
  // Apresentação correta da Situacao

   qryContasPagar.FieldByName('vl_pendente').AsFloat :=
      qryContasPagar.FieldByName('vl_entradas').AsFloat -
      qryContasPagar.FieldByName('vl_saidas').AsFloat;

   qryContasPagar.FieldByName('valor_pagar').AsFloat :=
      RoundFloat(
         qryContasPagarVL_DESPESA.AsCurrency -
         qryContasPagarvl_abatimento.AsCurrency -
         qryContasPagarvl_desconto.AsCurrency +
         qryContasPagarvl_multa.AsCurrency +
         qryContasPagarvl_mora.AsCurrency
         ,2
      );

  VlPendente := VlPendente + qryContasPagar.FieldByName('vl_pendente').AsFloat;
  VlBaixado := qryContasPagar.FieldByName('vl_saidas').AsFloat;

  if qryContasPagar.FieldByName('sn_previsao').AsString = 'S' then begin
      qryContasPagar.FieldByName('situ').AsString := 'Previsão'
  end
  else begin

    case qryContasPagar.FieldByName('cd_situacao').AsInteger of
      1: if qryContasPagar.FieldByName('vl_saidas').AsCurrency > 0 then
             qryContasPagar.FieldByName('situ').AsString := 'Parcial'
         else
             qryContasPagar.FieldByName('situ').AsString := 'Em Aberto';
      2: qryContasPagar.FieldByName('situ').AsString := 'OK';
    end;

  end;


  // fazendo a contagem da quantidade máxima de parcelas
  qyMaxParcela.Close;
  qyMaxParcela.ParamByName('CD_TITULO').AsInteger := qryContasPagarcd_titulo_principal.AsInteger;
  qyMaxParcela.Open;
  if qyMaxParcelaparcela.AsString = '' then begin
      qryContasPagards_parcela.Value := qryContasPagarnr_parcela.AsString;
  end else begin
      qryContasPagards_parcela.Value := qryContasPagarnr_parcela.AsString+'/'+qyMaxParcelaparcela.AsString;
  end;

   //+'/';
   //+ qyMaxParcelaparcela.AsString

  qyCalcCC.Close();
  qyCalcCC.ParamByName('CD_TITULO').AsInteger := qryContasPagarcd_titulo_principal.AsInteger;
  qyCalcCC.ParamByName('CD_COLIGADA').AsInteger := qryContasPagarcd_coligada.AsInteger;
  qyCalcCC.Open();

  sCentro := '';
  sCentroValor := '';
  sOp := '';

  sContasCod := '';
  sCEntroCod := '';

   sOp2 := '';

  while not qyCalcCC.Eof do
  begin
      sCentro := sCentro + sOp + qyCalcCC.FieldByName('ds_centro').AsString;
      sCentroValor := sCentroValor + sOp + qyCalcCC.FieldByName('ds_centro').AsString + ' (' + FloatToStrF(qyCalcCC.FieldByName('vl_movimento').AsCurrency, ffNumber, 7, 2) + ')';

      sContasCod := sContasCod + sOp2 + qyCalcCC.FieldByName('cd_conta').AsString;
      sCentroCod := sCentroCod + sOp2 + qyCalcCC.FieldByName('cd_centro').AsString;

      if (Pos(qyCalcCC.FieldByName('ds_conta').AsString, sCentro) <= 0)
         OR(Pos(qyCalcCC.FieldByName('ds_conta').AsString, sConta) <= 0) then
      begin
         sConta := sConta + sOp + qyCalcCC.FieldByName('ds_conta').AsString;
      end;

      sOp := ' / ';
      sOp2 := ',';
      qyCalcCC.Next();
  end;

  qryContasPagarCentroCusto.AsString := sCentro;
  qryContasPagarCentroCustoValor.AsString := sCentroValor;

  qryContasPagarContasCod.AsString := sContasCod;
  qryContasPagarCentrosCod.AsString := sCEntroCod;

  qryContasPagarPlanoContas.AsString := sConta;

  // Autorização de Pagamento;

  if qryContasPagarcd_autoriza_situ.AsInteger = 0 then begin

     qryContasPagards_autoriza.AsString := 'Pendente';

  end else if qryContasPagarcd_autoriza_situ.AsInteger = 1 then begin

     qryContasPagards_autoriza.AsString := 'Pgto Autorizado por ' + qryContasPagarnm_usuario_autoriza.AsString + ' em ' + FormatDateTime('dd/mm/yyyy hh:nn', qryContasPagardt_autoriza.AsDateTime);

  end else begin

     qryContasPagards_autoriza.AsString := 'Pgto Negado por ' + qryContasPagarnm_usuario_autoriza.AsString + ' em ' + FormatDateTime('dd/mm/yyyy hh:nn', qryContasPagardt_autoriza.AsDateTime);

  end;

end;

procedure Tfrm_Compromisso_Planilha.qryContasPagarCD_ANEXOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin

  {Text := Sender.AsString;

  if DisplayText then
    if qryContasPagarCD_ANEXO.IsNull then
      Text := 'Não'
    else
      Text := 'Sim';}
end;

procedure Tfrm_Compromisso_Planilha.qryContasPagarcd_autoriza_situGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.AsInteger = 1 then begin
      Text := 'Autorizado';
   end else if Sender.AsInteger = 2 then begin
      Text := 'Negado';
   end else begin
      Text := 'Pendente';
   end;
end;

procedure Tfrm_Compromisso_Planilha.qryContasPagarvalor_pagarGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Text <> '' then
   begin
      Text := FloatToStr(RoundFloat(StrToFloat(text), 2));
   end;
end;

procedure Tfrm_Compromisso_Planilha.sbFecharClick(Sender: TObject);
begin
   // Fechar a Planilha de Compromissos

   qryContasPagar.Close();
   Close();
end;

procedure Tfrm_Compromisso_Planilha.sbFiltraContaCaixaClick(Sender: TObject);
begin
  filtro2 := 4;

  if TSpeedButton(Sender).Down then
  begin
     Selecionar1Click(nil);
  end
  else
  begin
     Todos1Click(nil);
  end;
end;

procedure Tfrm_Compromisso_Planilha.sbPorFornecedorClick(Sender: TObject);
begin
  // Filtro por fornecedor

  filtro2 := 0;

  if TSpeedButton(Sender).Down then
     Selecionar1Click(nil)
  else
     Todos1Click(nil);
end;

procedure Tfrm_Compromisso_Planilha.sbPorContaClick(Sender: TObject);
begin
  // Filtro por Plano de Contas

  filtro2 := 1;

  if TSpeedButton(Sender).Down then
    begin
     Selecionar1Click(nil);
     sbPorConta.Down := true;
    end
  else
      Todos1Click(nil);

end;

procedure Tfrm_Compromisso_Planilha.Filtra;
const
   SQL_LIGACAO =
      'INNER JOIN FIN_APROPRIA_CP A ON '+
         '(CP.CD_TITULO_PRINCIPAL = A.CD_TITULO) AND '+
         '(CP.CD_COLIGADA = A.CD_COLIGADA)';

   SqlFiltroData: array[1..6] of string = (
      'CP.DT_PROVAVEL_PGTO BETWEEN concat(:DT_INICIAL, " 00:00:00") AND concat(:DT_FINAL, " 23:59:59")',
      'CP.DT_VENCIMENTO BETWEEN concat(:DT_INICIAL, " 00:00:00") AND concat(:DT_FINAL, " 23:59:59")',
      'CP.DT_COMPETENCIA BETWEEN concat(:DT_INICIAL, " 00:00:00") AND concat(:DT_FINAL, " 23:59:59")',
      'CP.DT_LANCAMENTO BETWEEN concat(:DT_INICIAL, " 00:00:00") AND concat(:DT_FINAL, " 23:59:59")',
      'CP.DT_EMISSAO_NOTA BETWEEN concat(:DT_INICIAL, " 00:00:00") AND concat(:DT_FINAL, " 23:59:59")',
      'CP.CD_TITULO IN (SELECT MF.CD_TITULO FROM FIN_MOV_CP MF WHERE MF.DT_PAGAMENTO BETWEEN concat(:DT_INICIAL, " 00:00:00") AND concat(:DT_FINAL, " 23:59:59"))'
      );

   FiltroSituacao: array[boolean, boolean] of string =
      (
         ('CP.CD_SITUACAO = -1', 'CP.CD_SITUACAO IN (-1, 2)'),
         ('CP.CD_SITUACAO IN (-1, 1)', 'CP.CD_SITUACAO IN (-1, 1, 2)')
      );

   SqlOrdem: array[boolean, boolean] of string =
      (
         ('%s', '%s, A.CD_CONTA'),
         ('%s, A.CD_CENTRO', '%s, A.CD_CENTRO, A.CD_CONTA')
      );

   FIL_FORMA_PGTO = 'CP.CD_FORMA_PGTO IN (%s)';
   FIL_PREVISAO = 'CP.SN_PREVISAO = ''N''';
   FIL_PREVISAO_SIM = 'CP.SN_PREVISAO = ''S''';
   FIL_PESSOA = 'CP.CD_PESSOA = %s';                 
   FIL_CONTA_CAIXA = 'CP.CD_CAIXA = %s';
   FIL_CONTA = 'A.CD_CONTA IN (%s)';
   FIL_TITULO = 'CP.CD_TITULO = %d';
   FIL_CENTRO = 'A.CD_CENTRO = %s';
   SFiltroCheque = 'CP.NR_CHEQUE = %s';

   S_OP = ' AND ';
var
   LICodTitulo, I: integer;
   LSFiltros, LSLigacao, LSTemp: string;
   sAux: String;
begin
   LICodTitulo := qryContasPagarCD_TITULO.AsInteger;

   { Seleção de plano de contas ou centro de custos
   }
   if plano_contas + plano_centro_custos > 0 then
   begin
      LSLigacao := SQL_LIGACAO;
   end
   else
   begin
      LSLigacao := '';
   end;

   { Filtro por situação }
   LSFiltros := ' ( ' + FiltroSituacao[sbEmAberto.Down, sbPagos.Down];

   {
      Situações:
         EM ABERTO -> 1
         PAGOS -> 2
   }

   if sbPrevisoes.Down then
   begin
      LSFiltros := LSFiltros + ' OR ' + FIL_PREVISAO_SIM;
   end
   else
   begin
     LSFiltros := LSFiltros + ' AND ' + FIL_PREVISAO;
   end;

   LSFiltros := LSFiltros + ' )';

   { Forma de pagamento }
   sbFormaPgto.Down := false;
   
   LSTemp := '-1, 0';
   
   for I := 3 to pmFormaPgto.Items.Count - 1 do
   begin
      if pmFormaPgto.Items[I].Checked then
      begin
         LSTemp := Format('%s, %d', [LSTemp, pmFormaPgto.Items[I].Tag]);
         sbFormaPgto.Down := true;
      end;
   end;
   
   LSFiltros := LSFiltros + S_OP + Format(FIL_FORMA_PGTO, [LSTemp]);

   if fornecedor > 0 then
      LSFiltros := LSFiltros + S_OP + Format(FIL_PESSOA, [IntToStr(resultado.cd_pessoa)])
   else
      sbPorFornecedor.Down := false;

   if cd_caixa > 0 then
      LSFiltros := LSFiltros + S_OP + Format(FIL_CONTA_CAIXA, [IntToStr(resultadoConta.cd_caixa)])
   else
      sbPorConta.Down := false;

   { Plano de contas
   }
   if plano_contas > 0 then
      LSFiltros := LSFiltros + S_OP + Format(FIL_CONTA, [plano_contas_filtro])
   else
      sbPorConta.Down := false;

   { Título
   }
   if codigo_titulo > 0 then
      LSFiltros := LSFiltros + S_OP + Format(FIL_TITULO, [codigo_titulo])
   else
      sbTitulo.Down := false;

   { Centro de custo
   }
   if plano_centro_custos > 0 then
      LSFiltros := LSFiltros + S_OP + Format(FIL_CENTRO, [frm_SelCentro.qyCentrosCD_CENTRO.AsString])
   else
      sbPorCentro.Down := false;

   { Filtro por data
   }
   if ((cbDataFiltro.ItemIndex > 0) and (cbDataFiltro.Enabled = True)) then
      LSFiltros := LSFiltros + S_OP + SqlFiltroData[cbDataFiltro.ItemIndex];

   if edtFiltroCheque.Text <> '' then
      LSFiltros := LSFiltros + S_OP + Format(SFiltroCheque, [edtFiltroCheque.Text]);

   { Ordenação
   LSOrdem := SqlOrdem[plano_contas > 0, plano_centro_custos > 0];
   LSOrdem := Format(LSOrdem, [sOrdem]);
   }

   { Aplica os filtros e abre a query
   }
   qryContasPagar.Close;

   if cbUnidadeEnsino.ItemIndex > 0 then
   begin
      qryContasPagar.SQLList.Values[DM.db.Protocol] :=
         Format(FSQLOriginal, [LSLigacao, IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo), LSFiltros{, LSOrdem}])
   end
   else
   begin
      qryContasPagar.SQLList.Values[DM.db.Protocol] :=
         Format(FSQLOriginal, [LSLigacao, DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LSFiltros{, LSOrdem}]);
   end;

   if ((cbDataFiltro.ItemIndex > 0) and (cbDataFiltro.Enabled = True)) then
   begin
      qryContasPagar.ParamByName('DT_INICIAL').AsDate := dtpDataDe.SelectedDate;
      qryContasPagar.ParamByName('DT_FINAL').AsDate := dtpDataAte.SelectedDate;
   end;
   qryContasPagar.Open;
   
   AtualizaResumo(LSFiltros, dtpDataDe.SelectedDate, dtpDataAte.SelectedDate);

   if (r_anterior <> 0) and (r_atual <> 0) then
      if not qryContasPagar.Locate('cd_titulo', r_atual, []) then
         qryContasPagar.Locate('cd_titulo', r_anterior, []);

End;

procedure Tfrm_Compromisso_Planilha.grdDblClick(Sender: TObject);
var
   cd_titulo            : integer;
   cd_titulo_principal  : integer;
begin

   if qryContasPagar.FieldByName('sn_previsao').AsString = 'N' then
   begin
      cd_titulo            := qryContasPagar.FieldByName('cd_titulo').AsInteger;
      cd_titulo_principal  := qryContasPagar.FieldByName('cd_titulo_principal').AsInteger;

      if (cd_titulo_principal <> 0) or (cd_titulo_principal <> null) then
      begin
         frm_ContasPagar_Movimentacoes.cd_titulo_principal := IntToStr(cd_titulo_principal);
      end;

      // Apresentar as movimentações caso não seja previsão
      frm_ContasPagar_Movimentacoes.Close();
      frm_ContasPagar_Movimentacoes.qyMovimentacoes.ParamByName('cd_titulo').AsInteger    := cd_titulo;
      frm_ContasPagar_Movimentacoes.qyMovimentacoes.ParamByName('cd_coligada').AsInteger  := qryContasPagar.FieldByName('cd_coligada').AsInteger;
      frm_ContasPagar_Movimentacoes.qyMovimentacoes.Open();

      frm_ContasPagar_Movimentacoes.Caption := '[' + qryContasPagarcd_titulo.AsString + '] ' + qryContasPagards_despesa.AsString;

      frm_ContasPagar_Movimentacoes.ShowModal();

      if frm_ContasPagar_Movimentacoes.Atualizar then
      begin
         Filtra();
      end;
   end
   else
   begin
      // Alterar o título
      sbAlterarClick( nil );
   end;
end;

procedure Tfrm_Compromisso_Planilha.sbGerarCompromissoClick( Sender: TObject);
begin
   // Gerar um novo compromisso
   if not DM.UsuarioLogado.TemPermissao( iModuloPadrao, npIncluir, True ) then Exit;

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Selecione uma Unidade de Ensino. O compromisso será gerado para a unidade selecionada.');
      cbUnidadeEnsino.SetFocus;
      exit;
   end;

   if grd.SelectedRows.Count >= 2 then begin
      GerarFatura2();
   end else begin

      Application.CreateForm( TfrmCompromissoCadastro, frmCompromissoCadastro );
      frmCompromissoCadastro.cd_coligada_seleciona := (TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);
      frmCompromissoCadastro.qryColigadas.Locate('cd_coligada',(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo),[]);
      frmCompromissoCadastro.setFormEstado('inserir');
      frmCompromissoCadastro.pnTitulo.Caption := 'COMPROMISSO A PAGAR [' + (TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Nome) + ']'; 
      frmCompromissoCadastro.ShowModal;
   end;

   filtra;
   SetForegroundWindow(Application.MainForm.Handle);
end;

procedure Tfrm_Compromisso_Planilha.srcContasPagarDataChange(Sender: TObject; Field: TField);
begin

  // Verificar qual botão deixar ativo
  
  if qryContasPagar.Eof then
  Begin
    // Se não tiver registros
    sbAlterar.Enabled := False;
    sbExcluir.Enabled := False;
    sbBaixarCancelar.Enabled := False;
    sbBaixarDesconto.Enabled := False;
    sbBaixarCompromisso.Enabled := False;
    sbPreparar.Enabled := False;
    sbCheque.Enabled := False;
    sbCheque.Down := False;
    sbAutorizar.Enabled := false;
  End
  else
  Begin
    // Se tiver registros
    sbAlterar.Enabled := True;
    sbExcluir.Enabled := True;
    sbEstornar.Enabled := True;
    sbPreparar.Enabled := True;
    sbCheque.Enabled := True;
    sbAutorizar.Enabled := true;
  end;

  if (qryContasPagar.FieldByName('cd_situacao').AsInteger = 2) OR (qryContasPagar.FieldByName('sn_previsao').AsString = 'S')
  then
  Begin
    // Desabilitar os botões se a situação for Pago ou for uma previsão
    sbBaixarCompromisso.Enabled := False;
    sbBaixarCancelar.Enabled := False;
    sbBaixarDesconto.Enabled := False;
  end
  else Begin

    sbBaixarCompromisso.Enabled := (qryContasPagar.FieldByName('cd_autoriza_situ').AsInteger = 1 ) OR Autoriza;

    // não é previsão

    sbBaixarCancelar.Enabled := True;
    sbBaixarDesconto.Enabled := True;


  end;

  if (qryContasPagar.FieldByName('situ').AsString = 'OK') OR (qryContasPagar.FieldByName('situ').AsString = 'Parcial') then begin  
     // Compromisso Pago
     sbEstornar.Enabled := true;
     sbEstornar.Enabled := qryContasPagardt_pagamento.AsString <> '';
  end
  else begin
    // Compromisso não pago
    sbEstornar.Enabled := False;
  End;

  // Situacação do Botão Cheque
  sbCheque.Down := (qryContasPagar.FieldByName('nr_cheque').AsString <> '');

  // Pop up dos creditos
  Gerarcrditoparaapessoa1.Enabled := TCompromisso.canGerarCreditoCompromisso(qryContasPagarVL_LIQUIDO.AsCurrency);
  Utilizarcrditosdisponveis1.Enabled := TCompromisso.canAplicarCreditoCompromisso(qryContasPagarvl_pendente.AsCurrency);


end;

function Tfrm_Compromisso_Planilha.tituloEmPreparacao(
  cd_titulo: Integer): Boolean;
const
   SQL_VERIFICA_PREP =
      'SELECT count(cd_preparacao) as preparar FROM FIN_CP_PREPARACAO_ITENS where cd_titulo = :titulo';
var
   qryPrepacarao : TUMZQuery;
   resultado : integer;
begin
   DM.CriarConsulta(qryPrepacarao);
   qryPrepacarao.SQL.Add(SQL_VERIFICA_PREP);
   qryPrepacarao.ParamByName('titulo').AsInteger := cd_titulo;
   qryPrepacarao.Open;

   resultado := qryPrepacarao.FieldByName('preparar').AsInteger;
   FreeAndNil(qryPrepacarao);
   
   result := (resultado > 0);
end;

procedure Tfrm_Compromisso_Planilha.Selecionar1Click(Sender: TObject);
Var
  i : integer;
  op : String;
begin

  case filtro2 of

      0: Begin
         // Filtrar por Pessoa

      resultado := TfrmSelecionarPessoa.Filtrar([]);

      if resultado.filtrado then Begin
        fornecedor := resultado.cd_pessoa;
        pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR - Fornecedor: ' + resultado.nm_pessoa;
      End;
      
    end;

    1: Begin
      // Filtrar pelo Plano de Contas
      frm_SelConta.filtroContas := tpcSaidas;
      frm_SelConta.ShowModal();

      if frm_SelConta.flgSearch then Begin
        plano_contas := frm_SelConta.qyPlanosContas.FieldByName('cd_conta').AsInteger;

        // Montar as contas selecionadas
        if frm_SelConta.grd.SelectedRows.Count > 1 then begin
           plano_contas_filtro := '';
           op := '';

           for i := 0 to frm_SelConta.grd.SelectedRows.Count - 1 do begin
               //verifica o bookmark
              if  frm_SelConta.grd.DataSource.DataSet.BookmarkValid(Pointer(frm_SelConta.grd.SelectedRows.Items[i])) then
              begin
              frm_SelConta.grd.DataSource.DataSet.GotoBookmark(Pointer(frm_SelConta.grd.SelectedRows.Items[i]));
              end;
              plano_contas_filtro := plano_contas_filtro + op + frm_SelConta.qyPlanosContas.FieldByName('cd_conta').AsString;
              op := ',';
           end;

           pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR - Contas: ' + plano_contas_filtro;
        end else begin
            plano_contas_filtro := frm_SelConta.qyPlanosContas.FieldByName('cd_conta').AsString;
            pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR - Conta: ' + frm_SelConta.qyPlanosContas.FieldByName('ds_conta').AsString;
        end;
      End;
      
    end;

    2: Begin
      // Filtrar pelo Centro de Curso
      
      frm_SelCentro.ShowModal;
      if frm_SelCentro.flgSearch then Begin
        plano_centro_custos := frm_SelCentro.qyCentros.FieldByName('cd_centro').AsInteger;
        pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR - Centro: ' + frm_SelCentro.qyCentros.FieldByName('ds_centro').AsString;
      End;
      
    end;

    3: Begin
      // Pelo Título

      Application.CreateForm(TFrmSelContasPagar, FrmSelContasPagar);
      FrmSelContasPagar.ShowModal;
      if FrmSelContasPagar.flgSearch then
      Begin
        codigo_titulo := FrmSelContasPagar.qryCompromissos.FieldByName('cd_titulo').AsInteger;
        pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR';

        plano_contas := 0;
        plano_contas_filtro := '';
        plano_centro_custos := 0;
        fornecedor := 0;
        cd_caixa := 0;
      End
      else
      begin
         cbDataFiltro.Enabled        := True;
         sbPorFornecedor.Enabled     := True;
         sbPorCentro.Enabled         := True;
         sbPorConta.Enabled          := True;
         sbFiltraContaCaixa.Enabled  := True;
      end;

      FreeAndNil(FrmSelContasPagar);
      
    end;

    4: Begin
         // Filtrar por Pessoa

      resultadoConta := TfrmSelecionarConta.Filtrar([]);

      if resultadoConta.filtrado then Begin
        cd_caixa := resultadoConta.cd_caixa;
        pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR - Conta: ' + resultadoConta.ds_caixa;
      end
      else
      begin
         sbFiltraContaCaixa.Down := False;
      end;
      
    end;

  end;

  Filtra();

end;

procedure Tfrm_Compromisso_Planilha.btnCreditosClick(Sender: TObject);
var
   P: TPoint;
begin
   P := TGeneral.GetPositionOnScreen(btnCreditos);
   pmOutrasOpcoes.Popup(P.X+80, P.Y+26);
end;

procedure Tfrm_Compromisso_Planilha.sbAutorizarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2046, npAcesso, True ) then Exit;

   Application.CreateForm(Tfrm_compromisso_autorizar, frm_compromisso_autorizar);
   frm_compromisso_autorizar.showmodal();
end;

procedure Tfrm_Compromisso_Planilha.sbPorCentroClick(Sender: TObject);
begin
  // Filtrar pelo Centro de Custo

  filtro2 := 2;

  if TSpeedButton(Sender).Down then
     Selecionar1Click(nil)
  else
     Todos1Click(nil);

end;

procedure Tfrm_Compromisso_Planilha.Todos1Click(Sender: TObject);
begin
  // Desmarcou o filtro
  
   pnTitulo.Caption := 'PLANILHA DE COMPROMISSOS A PAGAR';
  
  case filtro2 of

    0: Begin
      fornecedor := 0;
    end;

    1: Begin
      plano_contas := 0;
      plano_contas_filtro := ''; 
    end;

    2: Begin
      plano_centro_custos := 0;
    end;

    3: Begin
      codigo_titulo := 0;
    end;

    4: Begin
       cd_caixa := 0;
    end;

  end;

  Filtra();

end;

procedure Tfrm_Compromisso_Planilha.Utilizarcrditosdisponveis1Click(
  Sender: TObject);
var
   telaAplicarCreditoCP : TfrmAplicarCreditoCP;
   P: Pointer;
begin

   if not (DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Compromissos.UtilizarCreditosDisponiveis', npAcesso, True)) then Exit;

   if qryContasPagar.RecNo = 0 then
   begin
      Mensagem('Selecione um compromisso.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   if NOT(TCompromisso.canAplicarCreditoCompromisso(qryContasPagarvl_pendente.AsCurrency)) then
   begin
      Mensagem('Não é possível aplicar créditos em compromissos que não estão pendentes.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   Application.CreateForm(TfrmAplicarCreditoCP, telaAplicarCreditoCP);

   telaAplicarCreditoCP.Compromisso := TCompromisso.GetCompromisso(qryContasPagarCD_TITULO.AsInteger);
   if telaAplicarCreditoCP.ShowModal() = mrYes then
   begin
      P := qryContasPagar.GetBookmark();
      qryContasPagar.Close();
      qryContasPagar.Open();

      if qryContasPagar.BookmarkValid(P) then
         qryContasPagar.GotoBookmark(P);
   end;

   FreeAndNil(telaAplicarCreditoCP);
end;

procedure Tfrm_Compromisso_Planilha.CarregarColigadasFilhas;
begin
   DM.CarregaColigadas(cbUnidadeEnsino);
end;

procedure Tfrm_Compromisso_Planilha.CarregarFormasPagamento;
var
   mAux : TMenuItem;
begin
   pmFormaPgto.Items.Clear;

   mAux := TMenuItem.Create(pmFormaPgto);
   mAux.Caption := 'Selecionar Todas';
   mAux.Tag := -1;
   mAux.OnClick := FormaClick;
   mAux.Checked := False;

   pmFormaPgto.Items.Add(mAux);

   mAux := TMenuItem.Create(pmFormaPgto);
   mAux.Caption := 'Desmarcar Todas';
   mAux.Tag := -2;
   mAux.OnClick := FormaClick;
   mAux.Checked := False;

   pmFormaPgto.Items.Add(mAux);

   mAux := TMenuItem.Create(pmFormaPgto);
   mAux.Caption := '-';
   mAux.Tag := -3;
   mAux.Checked := False;

   pmFormaPgto.Items.Add(mAux);

   // Preencher as Formas de Pagamento para Filtro;
   qAuxCP.Close;
   qAuxCP.SQL.Text :=
      ' SELECT * from fin_config_formas_pgto WHERE cd_coligada_matriz = :cd_coligada_matriz' +
      ' ORDER By ds_forma_pgto ';
   qAuxCP.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qAuxCP.Open();

   while not qAuxCP.EOF do
   begin
      mAux := TMenuItem.Create(pmFormaPgto);

      mAux.Caption := qAuxCP.FieldByName('ds_forma_pgto').AsString;
      mAux.Tag := qAuxCP.FieldByName('cd_forma_pgto').AsInteger;
      mAux.OnClick := FormaClick;
      mAux.Checked := True;

      pmFormaPgto.Items.Add(mAux);

      qAuxCP.Next;
   end;

   qAuxCP.Close;
end;

procedure Tfrm_Compromisso_Planilha.cbDataFiltroChange(Sender: TObject);
begin

   lbDataInicial.Enabled := cbDataFiltro.ItemIndex <> 0;
   lbDataFinal.Enabled := cbDataFiltro.ItemIndex <> 0;
   dtpDataDe.Enabled := cbDataFiltro.ItemIndex <> 0;
   dtpDataAte.Enabled := cbDataFiltro.ItemIndex <> 0;

   filtra();

end;

procedure Tfrm_Compromisso_Planilha.cbUnidadeEnsinoChange(Sender: TObject);
begin
   Filtra();

   AtualizarBotaoPreparacao();   
end;

procedure Tfrm_Compromisso_Planilha.cbUnidadeEnsinoSelect(Sender: TObject);
begin
   DM.SalvaColigada(cbUnidadeEnsino);
   Filtra();


   AtualizarBotaoPreparacao();
end;

procedure Tfrm_Compromisso_Planilha.dtpDataAteChange(Sender: TObject);
begin
   FAtualizar := True;
end;

procedure Tfrm_Compromisso_Planilha.dtpDataAteExit(Sender: TObject);
begin
   if FAtualizar then
   begin
      FAtualizar := False;
      Filtra;
   end;
end;

procedure Tfrm_Compromisso_Planilha.dtpDataAteSelectDate(const Value: TDate);
begin
   FAtualizar := False;
   Filtra;
end;

procedure Tfrm_Compromisso_Planilha.dtpDataDeChange(Sender: TObject);
begin
   FAtualizar := True;
end;

procedure Tfrm_Compromisso_Planilha.dtpDataDeExit(Sender: TObject);
begin
   if FAtualizar then
   begin
      FAtualizar := False;
      Filtra;
      dtpDataAte.SetFocus;
   end;
end;

procedure Tfrm_Compromisso_Planilha.dtpDataDeSelectDate(const Value: TDate);
begin
   FAtualizar := False;
   Filtra;
   dtpDataAte.SetFocus;
end;

procedure Tfrm_Compromisso_Planilha.edtFiltroChequeChange(Sender: TObject);
begin
   FAtualizar := True;
end;

procedure Tfrm_Compromisso_Planilha.edtFiltroChequeExit(Sender: TObject);
begin
   if FAtualizar then
   begin
      FAtualizar := False;
      Filtra;
   end;
end;

procedure Tfrm_Compromisso_Planilha.edtFiltroChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      SelectNext(edtFiltroCheque, True, True);
      Exit;
   end;
   
   if not (Key in [#8, #9, #48..#57, #127]) then
   begin
      Key := #0;
   end;
end;

procedure Tfrm_Compromisso_Planilha.AtualizarBotaoPreparacao();
begin
   sbPreparar.Enabled:= cbUnidadeEnsino.ItemIndex > 0;
end;

procedure Tfrm_Compromisso_Planilha.sbAlterarClick(Sender: TObject);
var
   cd_titulo            : string;
   cd_titulo_principal  : string;
   nr_parcela           : string;
   cd_pessoa            : string;
   cd_situacao          : string;
begin

   if cbUnidadeEnsino.ItemIndex = 0 then
   begin
      Mensagem('Selecione uma Unidade de Ensino. O compromisso será alterado para a unidade selecionada.');
      cbUnidadeEnsino.SetFocus;
      exit;
   end;

   if not DM.UsuarioLogado.TemPermissao( iModuloPadrao, npAlterar, True ) then Exit;

   Application.CreateForm( TfrmCompromissoCadastro, frmCompromissoCadastro );
   frmCompromissoCadastro.setFormEstado('alterar');

   cd_titulo            := trim(qryContasPagar.FieldByName('cd_titulo').AsString);
   cd_titulo_principal  := trim(qryContasPagar.FieldByName('cd_titulo_principal').AsString);
   nr_parcela           := trim(qryContasPagar.FieldByName('nr_parcela').AsString);
   cd_pessoa            := trim(qryContasPagar.FieldByName('cd_pessoa').AsString);
   cd_situacao          := trim(qryContasPagar.FieldByName('cd_situacao').AsString);

   bookmarkTitulo := qryContasPagar.GetBookmark;

   if (cd_titulo_principal <> '') and (Trim(cd_titulo_principal) <> '0') then
   begin
      frmCompromissoCadastro.setNrParcela( nr_parcela );
      frmCompromissoCadastro.setCodigoCompromisso( cd_titulo );
      frmCompromissoCadastro.setSituacao( cd_situacao );
      frmCompromissoCadastro.setCodigoCompromissoPrincipal( cd_titulo_principal );
      frmCompromissoCadastro.setCdFornecedor( cd_pessoa );
      frmCompromissoCadastro.cd_coligada_seleciona := qryContasPagarCD_COLIGADA.AsInteger;
      frmCompromissoCadastro.alterou_turma := False;
      frmCompromissoCadastro.pnTitulo.Caption := 'COMPROMISSO A PAGAR [' + (TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Nome) + ']';
      frmCompromissoCadastro.cd_tipo_titulo := qryContasPagarCD_TIPO_TITULO.AsInteger;
      
      frmCompromissoCadastro.ShowModal;
   end
   else
   begin
      Mensagem( Concat('Não foi possível recuperar o código do título principal.',
      chr(13), 'Por favor, verifique as atualizações de banco.') );
   end;

   filtra();

   qryContasPagar.Locate('cd_titulo', cd_titulo, []);
end;

procedure Tfrm_Compromisso_Planilha.sbBaixarCompromissoClick(
  Sender: TObject);
begin
   // Baixar o compromisso por pagamento

   if not DM.UsuarioLogado.TemPermissao( 2038, npAcesso, True ) then Exit;

   if qryContasPagarcd_titulo_origem.AsInteger > 0 then begin
      Mensagem('Não é possível baixar este título. Você deve baixar diretamente a fatura criada.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if qryContasPagarvl_pendente.AsCurrency <= 0 then
   begin
      Mensagem('O título não tem pendencias para baixar', 'Informação', MB_OK + MB_ICONINFORMATION);
      Exit;
   end;

   if (Self.tituloEmPreparacao(qryContasPagarCD_TITULO.AsInteger)) then
   begin
      Mensagem('Não é possível realizar a baixa deste título pois ele já foi preparado para pagamento. Caso necessite fazer sua baixa separadamente, acesse Compromissos > Planilha de compromissos > Preparar e remova este título da preparação.', 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Application.CreateForm( Tfrm_Compromisso_baixar, frm_Compromisso_baixar );


   r_atual := qryContasPagar.FieldByName('cd_titulo').AsInteger;
   r_anterior := 0;

   if qryContasPagar.RecNo > 1 then
   begin
      qryContasPagar.Prior;
      r_anterior := qryContasPagar.FieldByName('cd_titulo').AsInteger;
      qryContasPagar.Next;
      grd.SelectedRows.Clear;
      qryContasPagar.Locate('cd_titulo',r_atual,[]);
   end;

   frm_compromisso_baixar.qyCompromisso.close;
   frm_compromisso_baixar.qyCompromisso.ParamByName('cd_titulo').AsInteger := qryContasPagar.FieldByName('cd_titulo').AsInteger;
   frm_compromisso_baixar.qyCompromisso.ParamByName('cd_coligada').AsInteger := qryContasPagar.FieldByName('cd_coligada').AsInteger;
   frm_compromisso_baixar.qyCompromisso.open;
 
   frm_compromisso_Baixar.tipoBaixa := Pagamento;

   frm_Compromisso_Baixar.cd_coligada_contas_pagar :=
      qryContasPagarCD_COLIGADA.AsInteger;

   frm_Compromisso_baixar.ShowModal;

   // Caso não tenha sido autorizado anteriormente gera a autorização agora
   if ((frm_Compromisso_Baixar.ModalResult = mrOk) and (frm_Compromisso_Planilha.qryContasPagarcd_autoriza_situ.AsInteger = 0)) then
   begin
      if not DM.UsuarioLogado.TemPermissao( 2046, npAcesso, True ) then Exit;
      Application.CreateForm(Tfrm_compromisso_autorizar, frm_compromisso_autorizar);
      frm_compromisso_autorizar.me_autoriza.Lines.Add('Pagamento autorizado pelo sistema, via baixa de compromisso.');
      frm_compromisso_autorizar.autorizaPagamento();
      frm_compromisso_autorizar.Close();
   end;
   filtra();
end;

procedure Tfrm_Compromisso_Planilha.sbBaixarCancelarClick(Sender: TObject);
begin
  // Baixar compromisso por Cancelamento

  if not DM.UsuarioLogado.TemPermissao( 2040, npAcesso, True ) then Exit;

  if qryContasPagarcd_titulo_origem.AsInteger > 0 then begin
     Mensagem('Não é possível cancelar informações deste título. Você deve alterar as informações diretamente na fatura criada.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;
  end;
  
  if qryContasPagarvl_pendente.AsCurrency <= 0 then
  begin
     Mensagem('O título não tem pendencias para cancelar', 'Informação', MB_OK + MB_ICONINFORMATION);
     Exit;
  end;

  if (Self.tituloEmPreparacao(qryContasPagarCD_TITULO.AsInteger)) then
  begin
      Mensagem('Não é possível cancelar este título pois ele já foi preparado para pagamento. Caso necessite fazer seu cancelamento separadamente, acesse Compromissos > Planilha de compromissos > Preparar e remova este título da preparação.', 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
  end;

  Application.CreateForm( Tfrm_Compromisso_baixar, frm_Compromisso_baixar );

  frm_compromisso_baixar.qyCompromisso.close;
  frm_compromisso_baixar.qyCompromisso.ParamByName('cd_titulo').AsInteger := qryContasPagar.FieldByName('cd_titulo').AsInteger;
  frm_compromisso_baixar.qyCompromisso.ParamByName('cd_coligada').AsInteger := qryContasPagar.FieldByName('cd_coligada').AsInteger;
  frm_compromisso_baixar.qyCompromisso.open;

  frm_compromisso_Baixar.tipoBaixa := Cancelamento;
  frm_Compromisso_baixar.ShowModal() ;

  filtra();

end;

procedure Tfrm_Compromisso_Planilha.sbBaixarDescontoClick(Sender: TObject);
begin
  // Baixar compromisso por Abatimento (desconto)

  if not DM.UsuarioLogado.TemPermissao( 2039, npAcesso, True ) then Exit;

  if qryContasPagarcd_titulo_origem.AsInteger > 0 then begin
     Mensagem('Não é possível alterar informações deste título. Você deve alterar as informações diretamente na fatura criada.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;
  end; 

  if qryContasPagarvl_pendente.AsCurrency <= 0 then
  begin
     Mensagem('O título não tem pendencias para aplicar descontos', 'Informação', MB_OK + MB_ICONINFORMATION);
     Exit;
  end;

  if (Self.tituloEmPreparacao(qryContasPagarCD_TITULO.AsInteger)) then
  begin
      Mensagem('Não é possível realizar o abatimento neste título pois ele já foi preparado para pagamento. Caso necessite fazer seu abatimento separadamente, acesse Compromissos > Planilha de compromissos > Preparar e remova este título da preparação.', 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
  end;

  Application.CreateForm( Tfrm_Compromisso_baixar, frm_Compromisso_baixar );

  frm_compromisso_baixar.qyCompromisso.close;
  frm_compromisso_baixar.qyCompromisso.ParamByName('cd_titulo').AsInteger := qryContasPagar.FieldByName('cd_titulo').AsInteger;
  frm_compromisso_baixar.qyCompromisso.ParamByName('cd_coligada').AsInteger := qryContasPagar.FieldByName('cd_coligada').AsInteger;
  frm_compromisso_baixar.qyCompromisso.open;

  frm_compromisso_Baixar.tipoBaixa := Desconto;
  frm_Compromisso_baixar.ShowModal();

  Filtra();

end;

procedure Tfrm_Compromisso_Planilha.sbExcluirClick(Sender: TObject);
const
   SConfirmar = 'Deseja realmente efetuar a exclusão dos títulos selecionados?';
   SConfirmar2 = 'Esta operação não poderá ser revertida. Tem certeza que deseja continuar?';
   SNaoPodeExcluir = 'Títulos bloqueados, preparados para pagamento, pagos e parcialmente pagos não podem ser excluídos.';
var
  sChave : String;
   CanDelete: Boolean;
   I, UserChoice: Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( iModuloPadrao, npExcluir, True ) then Exit;

   UserChoice := MessageDlg(SConfirmar, mtConfirmation, [mbYes, mbNo], -1);

   if UserChoice = ID_YES then
   begin

      UserChoice := MessageDlg(SConfirmar2, mtConfirmation, [mbYes, mbNo], -1);

      if UserChoice = ID_YES then
      begin

         CanDelete := True;

         qryContasPagar.DisableControls;

         for I := 0 to grd.SelectedRows.Count - 1 do
         begin
            if qryContasPagar.BookmarkValid(TBookmark(grd.SelectedRows[I])) then
            begin

               qryContasPagar.GotoBookmark(TBookmark(grd.SelectedRows[I]));

               if qryContasPagarsitu.AsString = 'OK' then
               begin
                  CanDelete := False;
                  Break;
               end;

               if qryContasPagarsitu.AsString = 'Parcial' then
               begin
                  CanDelete := False;
                  Break;
               end;

               if DM.EstaBloqueado(qryContasPagarDT_VENCIMENTO.AsDateTime, False) then
               begin
                  CanDelete := False;
                  Break;
               end;

               if tituloEmPreparacao(qryContasPagarCD_TITULO.AsInteger) then
               begin
                  CanDelete := False;
                  Break;
               end;

            end;
         end;

         if not CanDelete then
         begin
            MessageDlg(SNaoPodeExcluir, mtError, [mbOK], -1);
         end;

         if CanDelete then
         begin
   
            for I := 0 to grd.SelectedRows.Count - 1 do
            begin
               if qryContasPagar.BookmarkValid(TBookmark(grd.SelectedRows[I])) then
               begin
                  sqlExcluir.ParamByName('CD_TITULO').AsInteger := qryContasPagarCD_TITULO.AsLargeInt;
                  sqlExcluir.ParamByName('CD_COLIGADA').AsInteger := qryContasPagarCD_COLIGADA.AsInteger;
                  sqlExcluir.Execute;

                  // Registrar o log da exclusão
                 sChave := qryContasPagarCD_TITULO.AsString + ';' + qryContasPagarCD_COLIGADA.AsString;
   				  DM.setLog(iModuloPadrao, 'Exclusao', sChave, qryContasPagarcd_coligada.AsInteger, '');
               end;
            end;

            Filtra;
         end;

         qryContasPagar.EnableControls;
      end;
   end;
end;

procedure Tfrm_Compromisso_Planilha.sbPrepararClick(Sender: TObject);
begin
    // Preparação de Pagamentos
  
    if not DM.UsuarioLogado.TemPermissao( 2041, npAcesso, True ) then Exit;

    if qryContasPagar.RecordCount <= 0 then
    begin
       Mensagem('Nenhum compromisso selecionado para preparar pagamento.', 'Atenção', MB_OK + MB_ICONWARNING);
       Exit;
    end;

    Application.CreateForm(Tfrm_compromisso_preparar, frm_compromisso_preparar);
    frm_compromisso_preparar.Show();
end;

procedure Tfrm_Compromisso_Planilha.sbImprimirClick(Sender: TObject);
const
  S_OP = ' AND ';
  SFiltroCaixa = '%s{fin_contas_pagar.cd_caixa} = %d AND ';
  SFiltroCaixaShow = '%s"CAIXA = %s" + Chr(13) +';
var
  sFiltro : string;
  sFiltroShow : String;
  slFormulas: TStringList;
  sFormaPgto,LSTemp,sSeparador : string;
  i : Integer;
  infoRelatorio: ClasseRegistros;
  sNomeRelatorio: String;
  PodeExportar: boolean;
begin

   // Impressão do compromisso
  sSeparador := '';
  LSTemp := '-1,0,';
  for I := 3 to pmFormaPgto.Items.Count - 1 do
      if pmFormaPgto.Items[I].Checked then
      begin

         LSTemp := LSTemp+sSeparador+IntToStr(pmFormaPgto.Items[I].Tag);
         sSeparador :=  ',';
         sbFormaPgto.Down := true;
      end;
  sFiltro := '{fin_formas_pgto.cd_forma_pgto}  in ['+LSTemp+'] AND ';

//  IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo)
   try
      if cbUnidadeEnsino.ItemIndex <> 0 then
      begin
         sFiltro := sFiltro +'{fin_contas_pagar.cd_coligada} = ' +   IntToStr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo) +' AND ';
      end
      else
      begin
         sFiltro := sFiltro +'{fin_contas_pagar.cd_coligada} in ['+ DM.GetTodasColigadas() +'] AND ';
      end;
   Except
      sFiltro := sFiltro +'{fin_contas_pagar.cd_coligada} in ['+ DM.GetTodasColigadas() +'] AND ';
   end;
   sFiltroShow := '';

   case cbDataFiltro.ItemIndex  of
    1 : begin // Provável Pagamento
          sFiltro := sFiltro + 'ToText({fin_contas_pagar.dt_provavel_pgto}, "yyyyMMdd") >= "'+FormatDateTime('yyyyMMdd', dtpDataDe.SelectedDate)+'" AND ToText({fin_contas_pagar.dt_provavel_pgto}, "yyyyMMdd") <= "'+FormatDateTime('yyyyMMdd', dtpDataAte.SelectedDate)+'" AND ';
          sFiltroShow := sFiltroShow + '"PROVÁVEL PAGTO = DE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataDe.SelectedDate ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataAte.SelectedDate) + '" + CHR(13) + ';
        end;
    2 : begin // Vencimento
          sFiltro := sFiltro + 'ToText({fin_contas_pagar.dt_vencimento}, "yyyyMMdd") >= "'+FormatDateTime('yyyyMMdd', dtpDataDe.SelectedDate)+'" AND ToText({fin_contas_pagar.dt_vencimento}, "yyyyMMdd") <= "'+FormatDateTime('yyyyMMdd', dtpDataAte.SelectedDate)+'" AND ';
          sFiltroShow := sFiltroShow + '"VENCIMENTO = DE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataDe.SelectedDate ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataAte.SelectedDate ) + '" + CHR(13) + ';
        end;
    3 : begin // Competência
          sFiltro := sFiltro + 'ToText({fin_contas_pagar.dt_competencia}, "yyyyMMdd") >= "'+FormatDateTime('yyyyMMdd', dtpDataDe.SelectedDate)+'" AND ToText({fin_contas_pagar.dt_competencia}, "yyyyMMdd") <= "'+FormatDateTime('yyyyMMdd', dtpDataAte.SelectedDate)+'" AND ';
          sFiltroShow := sFiltroShow + '"COMPETÊNCIA = DE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataDe.SelectedDate ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataAte.SelectedDate ) + '" + CHR(13) + ';
        end;
    4 : begin // Lançamento
          sFiltro := sFiltro + 'ToText({fin_contas_pagar.dt_lancamento}, "yyyyMMdd") >= "'+FormatDateTime('yyyyMMdd', dtpDataDe.SelectedDate)+'" AND ToText({fin_contas_pagar.dt_lancamento}, "yyyyMMdd") <= "'+FormatDateTime('yyyyMMdd', dtpDataAte.SelectedDate)+'" AND ';
          sFiltroShow := sFiltroShow + '"DATA DE LANÇAMENTO = DE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataDe.SelectedDate ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataAte.SelectedDate ) + '" + CHR(13) + ';
        end;
    5 : begin // Emissão da Nota
          sFiltro := sFiltro + 'ToText({fin_contas_pagar.dt_emissao_nota}, "yyyyMMdd") >= "'+FormatDateTime('yyyyMMdd', dtpDataDe.SelectedDate)+'" AND ToText({fin_contas_pagar.dt_emissao_nota}, "yyyyMMdd") <= "'+FormatDateTime('yyyyMMdd', dtpDataAte.SelectedDate)+'" AND ';
          sFiltroShow := sFiltroShow + '"EMISSÃO DA NOTA = DE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataDe.SelectedDate ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataAte.SelectedDate ) + '" + CHR(13) + ';
        end;
    6 : begin // Data de Pagamento
          sFiltro := sFiltro + 'ToText({fin_contas_pagar.dt_pagamento}, "yyyyMMdd") >= "'+FormatDateTime('yyyyMMdd', dtpDataDe.SelectedDate)+'" AND ToText({fin_contas_pagar.dt_pagamento}, "yyyyMMdd") <= "'+FormatDateTime('yyyyMMdd', dtpDataAte.SelectedDate)+'" AND ';
          sFiltroShow := sFiltroShow + '"DATA DE PAGAMENTO = DE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataDe.SelectedDate ) + ' ATE ' + FormatDateTime( 'dd/mm/yyyy', dtpDataAte.SelectedDate ) + '" + CHR(13) + ';
        end;

   End;


  if sbEmAberto.Down then begin

     if sbPagos.Down then begin
        sFiltroShow := sFiltroShow + '"COMPROMISSOS EM ABERTO OU PAGOS " + CHR(13) + ';
     end else  begin

        sFiltro := sFiltro + '{fin_contas_pagar.cd_situacao} <> 2 AND ';
        sFiltroShow := sFiltroShow + '"COMPROMISSOS EM ABERTO " + CHR(13) + ';

     end;

  end else begin

     if sbPagos.Down then begin

        sFiltro := sFiltro + '{fin_contas_pagar.cd_situacao} = 2 AND ';
        sFiltroShow := sFiltroShow + '"COMPROMISSOS PAGOS " + CHR(13) + ';

     end;

  end;

  if not sbPrevisoes.Down then begin

     sFiltro := sFiltro + '{fin_contas_pagar.sn_previsao} <> "S" AND ';

  end;


  if fornecedor > 0 then begin
        sFiltro := sFiltro + '{fin_contas_pagar.cd_pessoa} = ' + IntToStr(resultado.cd_pessoa) + ' AND ';
        sFiltroShow := sFiltroShow + '"FORNECEDOR = ' + resultado.nm_pessoa + ' " + CHR(13) + ';
  end;

  if plano_contas > 0 then begin
        sFiltro := sFiltro + '{fin_apropria_cp.cd_conta} IN [ ' + plano_contas_filtro +'] AND ';
        if frm_SelConta.grd.SelectedRows.Count > 1 then begin
           sFiltroShow := sFiltroShow + '"CONTA = ' + plano_contas_filtro + ' " + CHR(13) + ';
        end else begin
           sFiltroShow := sFiltroShow + '"CONTA = ' + frm_SelConta.qyPlanosContas.FieldByName('ds_conta').AsString + ' " + CHR(13) + ';
        end;
  end;


  if plano_centro_custos > 0 then begin
        sFiltro := sFiltro + '{fin_apropria_cp.cd_centro} = ' + frm_SelCentro.qyCentros.FieldByName('cd_centro').AsString+' AND ';
        sFiltroShow := sFiltroShow + '"CENTRO = ' + frm_SelCentro.qyCentros.FieldByName('ds_centro').AsString + ' " + CHR(13) + ';
  end;

   if cd_caixa > 0 then
   begin
      sFiltro := Format(SFiltroCaixa, [sFiltro, cd_caixa]);
      sFiltroShow := Format(SFiltroCaixaShow, [sFiltroShow,
         qryContasPagarDS_CAIXA.AsString]);
   end;

  // Retirar o AND
  sFiltro := Copy(sFiltro, 0, Length(sFiltro)-4);

  sFiltroShow := sFiltroShow + '" "';

  slFormulas := TStringList.Create();
  slFormulas.Add('ds_filtro=' + sFiltroShow);

  infoRelatorio := PrincipalForm.GetInfoRpt('relContasPagarPlanilha');
  sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';
  PodeExportar := True;
  
  if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
   PodeExportar := False;

  PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFiltro, '', slFormulas, nil, nil, nil, True, False, nil, PodeExportar);

end;

procedure Tfrm_Compromisso_Planilha.sbEstornarClick(Sender: TObject);
const
   SSQLSelectUltimoPagto = 'SELECT dt_pagamento FROM fin_mov_cp WHERE cd_titulo = ? AND cd_coligada = ? AND cd_movimento_te != ? ORDER BY nr_sequencia DESC LIMIT 1';
   SMsgBaixaUltimo = 'O título selecionado possui %d registros de baixa. Somente o último registro de baixa será estornado.';
Var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   dblDinheiro, dblCheque : Currency;
   iCodCaixa, iCodAbertura, iCodAberturaAtual : integer;
   iTpConta :word;
   Movimento : TMovimento;
   ds_historico : String;
   qyAltera : TUMZQuery;
   i : Integer;
   sChave, S: String;
   iMovEstornado : Integer;
   DataPgto: TDate;
   DateIsNull: Boolean;
begin

  // Estorno de Compromisso

  if not DM.UsuarioLogado.TemPermissao( 2049, npAcesso, True ) then Exit;

  if not (qryContasPagarcd_situacao.AsInteger in [1,2]) Then
  Begin
    Mensagem( 'Só é possível estornar um compromisso pago.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
    Exit;
  End;

   // Bloqueio de Data;
   if DM.EstaBloqueado(qryContasPagardt_pagamento.AsDateTime, true) then Exit;

   // Verificar se a baixa foi feita pelo retorno do banco

  qAuxCP.Close();
  qAuxCP.SQL.Clear();
  qAuxCP.SQL.Add('SELECT Count(*) resultado FROM retorno_cp_itens as i INNER JOIN retorno_cp as r ON (r.cd_retorno = i.cd_retorno) WHERE i.sn_baixado = 1 AND i.cd_titulo = :CdTitulo AND r.cd_coligada = :CdColigada' );
  qAuxCP.ParamByName('CdTitulo').AsInteger := qryContasPagarCD_TITULO.AsLargeInt;
  qAuxCP.ParamByName('CdColigada').AsInteger := qryContasPagarCD_COLIGADA.AsInteger;
  qAuxCP.Open();

  if qAuxCP.FieldByName('resultado').AsInteger > 0  then begin

     IF Mensagem('Este título foi baixado através de um arquivo de retorno do banco. ' + CHR(13) + 'Tem certeza que deseja estorná-lo?.', 'Atenção', MB_YESNO + MB_ICONQUESTION, Handle) <> MrYes Then begin
        Exit;
     end;

  end;

  // Verificar se a baixa foi pela preparação

  qAuxCP.Close();
  qAuxCP.SQL.Clear();
  qAuxCP.SQL.Add('SELECT Count(*) resultado FROM fin_cp_preparacao_itens WHERE cd_titulo = :CdTitulo AND cd_coligada = :CdColigada' );
  qAuxCP.ParamByName('CdTitulo').AsInteger := qryContasPagarcd_titulo.AsInteger;
  qAuxCP.ParamByName('CdColigada').AsInteger := qryContasPagarCD_COLIGADA.AsInteger;
  qAuxCP.Open();

  if qAuxCP.FieldByName('resultado').AsInteger > 0  then begin

     Mensagem('Este título foi baixado através de uma preparação. ' + CHR(13) + 'Por favor, utilize a tela de Pagamentos Preparados para estornar este título.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
     Exit;

  end;
                                     
  if Mensagem( 'Confirma o estorno do título selecionado ?', Application.Title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO then Exit;

  // Selecionar a última movimentação do título

   qAuxCP.Close();
   qAuxCP.SQL.Clear();
   qAuxCP.SQL.Add('SELECT * FROM fin_mov_cp WHERE cd_titulo = :CdTitulo AND cd_coligada = :CdColigada AND cd_movimento_te > 0' );
   qAuxCP.SQL.Add('ORDER BY nr_sequencia DESC');
   qAuxCP.ParamByName('CdTitulo').AsInteger := qryContasPagarcd_titulo.AsInteger;
   qAuxCP.ParamByName('CdColigada').AsInteger := qryContasPagarCD_COLIGADA.AsInteger;
   qAuxCP.Open();
   qAuxCP.First;

   if DM.EstaBloqueado(qAuxCP.FieldByName('dt_pagamento').AsDateTime, True) then
   begin
      Exit;
   end;

   if qAuxCP.RecordCount > 1 then
   begin
      S := Format(SMsgBaixaUltimo, [qAuxCP.RecordCount]);
      Mensagem(S, 'Informação', MB_OK or MB_ICONINFORMATION);
   end;

   iMovEstornado := qAuxCP.FieldByName('cd_movimento_te').AsInteger;

   // Verificar se houve uma baixa na tesouraria

   if not qAuxCP.IsEmpty then
   begin
      iMovEstornado :=  qAuxCP.FieldByName('cd_movimento_te').AsInteger;

      // Verificar em qual caixa foi baixada a parcela

      qAuxCP02.Close();
      qAuxCP02.SQL.Clear();
      qAuxCP02.SQL.Add('SELECT * FROM fin_mov_tesouraria WHERE cd_movimento_te = :CdMovTe AND nr_estorno = 0' );
      qAuxCP02.SQL.Add('ORDER BY cd_movimento_te DESC ');
      qAuxCP02.SQL.Add('LIMIT 1');
      qAuxCP02.ParamByName('CdMovTe').AsInteger := iMovEstornado;
      qAuxCP02.Open();

      // Titulo entrou no caixa?  -- Isso nunca deverá acontecer
      if qAuxCP02.Eof then begin
         Mensagem( 'Não é possível encontrar o lançamento do título no caixa.', Application.Title, MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
      end;

      // Códigos dos caixas que a parcela foi baixada
      iCodCaixa := qAuxCP02.FieldByName('cd_caixa').AsInteger;
      iCodAbertura := qAuxCP02.FieldByName('cd_abertura_caixa').AsInteger;

      movimento := TMovimento.Create;

      Movimento.Coligada := qryContasPagarCD_COLIGADA.AsInteger;


      if not Movimento.VerificaContaAtiva(iCodCaixa, iTpConta, iCodAberturaAtual ) then begin
         Mensagem( 'Não é possível estornar o título. A conta não está mais ativa.', Application.Title, MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
      end;

      movimento.free;

      if (iTpConta = 3) AND (iCodAberturaAtual = 0) then begin
         Mensagem( 'Não é possível estornar p título. O caixa está fechado.', Application.Title, MB_OK + MB_ICONSTOP );
         Screen.Cursor := crDefault;
         Exit;
      end;

      if (iTpConta = 3) AND (iCodAberturaAtual <> iCodAbertura) then begin
         if Mensagem( 'Atenção: O caixa que o título foi baixado ja foi fechado. Se você estornar essa parcela, será feito um lançamento de débito no caixa aberto atualmente. Deseja continuar.', Application.Title, MB_YESNOCANCEL + MB_ICONSTOP ) <> mrYES then begin
            Screen.Cursor := crDefault;
            Exit;
         end;
      end;

      Screen.Cursor  := crHourGlass;

      dblDinheiro    := qAuxCP02.FieldByName('vl_dinheiro').AsCurrency;
      dblCheque      := qAuxCP02.FieldByName('vl_cheque').AsCurrency;
      ds_historico   := qAuxCP02.FieldByNAme('ds_movimento').AsString;

      movimento := TMovimento.Create;

      movimento.Historico := 'ESTORNO ' + qAuxCP02.FieldByName('ds_movimento').AsString;

      Movimento.ValorMovimento := qAuxCP02.FieldByName('vl_movimento').AsCurrency;

      Movimento.ValorEmDinheiro := qAuxCP02.FieldByName('vl_dinheiro').AsCurrency;
      Movimento.ValorEmCheque   := qAuxCP02.FieldByName('vl_cheque').AsCurrency;
      Movimento.Mensalidade     := qAuxCP02.FieldByName('cd_mensalidade').AsInteger;

      Movimento.CodigoTitulo := qAuxCP02.FieldByName('cd_titulo').AsInteger;

      Movimento.EntradaSaida    := 1;
      Movimento.CodAcao := 6 ; // Acão Padrão
      Movimento.NumeroDocumento := qAuxCP02.FieldByName('nr_documento').AsString;
      Movimento.DataLiberacao := Date;
      Movimento.Origem := 2; // Contas a Receber;
      Movimento.DataMovimento := qAuxCP02.FieldByName('dt_movimento').AsdateTime;

      Movimento.Coligada := qAuxCP02.FieldByName('cd_coligada').AsInteger;
      Movimento.FormaDePagamento := qAuxCP02.FieldByName('cd_forma_pgto').AsInteger;

      Movimento.RegistrarMovimentacaoTe( iCodCaixa );

      // Arrumar o estorno

      DM.CriarConsulta(qyAltera);
      qyAltera.Close();
      qyAltera.SQL.Text := ' SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria ';
      qyAltera.Open();

      i := qyAltera.FieldByName('ultimo').AsInteger + 1;

      qyAltera.Close();

      qyAltera.SQL.Text :=
         ' UPDATE fin_mov_tesouraria      ' +
         ' SET nr_estorno = ' + IntToStr(i) +
         ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
         ' WHERE cd_movimento_te in (' + IntToStr(qAuxCP.FieldByName('cd_movimento_te').AsInteger) + ', ' +
      IntToStr(Movimento.CodigoMovimento) + ')' ;
      qyAltera.ExecSQL();

      FreeAndNil(qyAltera);

      Movimento.Free;

      // Eliminar as apropriações nos centros de custos da tesouraria
      qAuxCP02.Close();
      qAuxCP02.SQL.Clear();
      qAuxCP02.SQL.Add(
         ' DELETE FROM fin_apropria_te '  +
         '  WHERE cd_movimento_te = :CdMovimento '
      );
      qAuxCP02.ParamByName('CdMovimento').AsInteger := qAuxCP.FieldByName('cd_movimento_te').AsInteger;
      qAuxCP02.ExecSQL();

      if ( frmEstorno = nil ) then
         Application.CreateForm(TfrmEstorno , frmEstorno);

      frmEstorno.ShowModal;

      Movimento.registraEstorno(
         iMovEstornado,
         qryContasPagarCD_CAIXA.AsInteger,
         0,
         qryContasPagarCD_COLIGADA.AsInteger,
         dm.iCdPessoaLogado,
         qryContasPagarDT_PAGAMENTO.AsDateTime,
         frmEstorno.motivoEstorno,
         qryContasPagarCD_TITULO.AsInteger

      );
      frmEstorno.motivoEstorno := '';
      frmEstorno.meMotivo.Text := '';
   end;

   DateIsNull := True;

   Stmt := PrepareStatement(SSQLSelectUltimoPagto);
   try
      Stmt.SetInt(1, qryContasPagarCD_TITULO.AsInteger);
      Stmt.SetInt(2, qryContasPagarCD_COLIGADA.AsInteger);
      Stmt.SetInt(3, iMovEstornado);
      try
         Rs := Stmt.ExecuteQueryPrepared;
         if Rs.Next then
         begin
            if not Rs.IsNull(1) then
            begin
               DateIsNull := False;
               DataPgto := Rs.GetDate(1);
            end;
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   qAuxCP02.Close();
   qAuxCP02.SQL.Clear();
   qAuxCP02.SQL.Add( 'UPDATE fin_contas_pagar ' );
   qAuxCP02.SQL.Add( 'SET cd_situacao = :Situacao, dt_pagamento = :dt_pagamento ' );
   qAuxCP02.SQL.Add( 'WHERE (cd_titulo = :Codigo) AND (cd_coligada = :cd_coligada)' );
   qAuxCP02.ParamByName('Codigo').AsInteger := qryContasPagarcd_titulo.AsInteger;
   qAuxCP02.ParamByName('cd_coligada').AsInteger := qryContasPagarCD_COLIGADA.AsInteger;
   qAuxCP02.ParamByName('Situacao').AsInteger := 1;

   if DateIsNull then
   begin
      qAuxCP02.ParamByName('dt_pagamento').Clear;
   end;

   if not DateIsNull then
   begin
      qAuxCP02.ParamByName('dt_pagamento').AsDate := DataPgto;
   end;

   qAuxCP02.ExecSQL();

   // Atualizar os títulos principais (agrupamento)

   qAuxCP02.Close();
   qAuxCP02.SQL.Clear();
   qAuxCP02.SQL.Add( 'UPDATE fin_contas_pagar ' );
   qAuxCP02.SQL.Add( 'SET cd_situacao = :Situacao, dt_pagamento = :dt_pagamento ' );
   qAuxCP02.SQL.Add( 'WHERE (cd_titulo_origem <> 0) AND (cd_titulo_origem = :Codigo) AND (cd_coligada = :cd_coligada)' );
   qAuxCP02.ParamByName('Codigo').AsInteger := qryContasPagarcd_titulo.AsInteger;
   qAuxCP02.ParamByName('cd_coligada').AsInteger := qryContasPagarCD_COLIGADA.AsInteger;
   qAuxCP02.ParamByName('Situacao').AsInteger := 1;

   if DateIsNull then
   begin
      qAuxCP02.ParamByName('dt_pagamento').Clear;
   end;

   if not DateIsNull then
   begin
      qAuxCP02.ParamByName('dt_pagamento').AsDate := DataPgto;
   end;

   qAuxCP02.ExecSQL();

   // Eliminar a ultima movimentação de saida...
   qAuxCP02.Close;
   qAuxCP02.SQL.Clear;
   qAuxCP02.SQL.Add(
   ' DELETE FROM fin_mov_cp '  +
   '  WHERE cd_titulo = :CdTitulo ' +
   '  AND cd_coligada = :CdColigada ' +
   '  AND cd_movimento_te = :Movimento'
   );
   qAuxCP02.ParamByName('CdTitulo').AsInteger := qryContasPagarcd_titulo.AsInteger;
   qAuxCP02.ParamByName('CdColigada').AsInteger := qryContasPagarcd_coligada.AsInteger;
   qAuxCP02.ParamByName('Movimento').AsInteger := iMovEstornado;
   qAuxCP02.ExecSQL();

   // Eliminar a ultima movimentação de saida...
   qAuxCP02.Close;
   qAuxCP02.SQL.Clear;
   qAuxCP02.SQL.Add(
   ' DELETE mv.* FROM fin_mov_cp as mv INNER JOIN fin_contas_pagar as cp ON (cp.cd_titulo = mv.cd_titulo AND cp.cd_coligada = mv.cd_coligada) '  +
   '  WHERE cp.cd_titulo_origem <> 0 AND cp.cd_titulo_origem = :CdTitulo ' +
   '    AND mv.cd_coligada = :CdColigada ' +
   '    AND mv.cd_movimento_te = :Movimento '
   );
   qAuxCP02.ParamByName('CdTitulo').AsInteger := qryContasPagarcd_titulo.AsInteger;
   qAuxCP02.ParamByName('CdColigada').AsInteger := qryContasPagarcd_coligada.AsInteger;
   qAuxCP02.ParamByName('Movimento').AsInteger := iMovEstornado;
   qAuxCP02.ExecSQL();

   // Registrar o Log do Estorno

   sChave := qryContasPagarcd_titulo.AsString + ';' + qryContasPagarcd_coligada.AsString;

   DM.setLog(iModuloPadrao, 'Estorno', sChave, qryContasPagarcd_coligada.AsInteger, '' );

   Screen.Cursor := crDefault;
   qAuxCP.Next;
    
   Mensagem( 'Título estornado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

   Filtra();
End;

procedure Tfrm_Compromisso_Planilha.sbEmAbertoClick(Sender: TObject);
begin
   // Filtrar em Aberto

   Filtra();
end;

procedure Tfrm_Compromisso_Planilha.sbPagosClick(Sender: TObject);
begin
   // Filtrar Pagos

   Filtra();
end;

procedure Tfrm_Compromisso_Planilha.sbPrevisoesClick(Sender: TObject);
begin
   // Previsões
   
   Filtra();
end;

procedure Tfrm_Compromisso_Planilha.FormaClick(Sender: TObject);
var
   i : Integer;
begin //
    // Formas de Pagamento

    sbFormaPgto.Down := True;

   if TMenuItem(Sender).Tag = -1 then begin // Selecionar Todas
      For i:= 3 to pmFormaPgto.Items.Count - 1 do begin

         pmFormaPgto.Items[i].Checked := True;

      end
   end
   else if TMenuItem(Sender).Tag = -2 then begin // Desmarcar todas
      For i:= 3 to pmFormaPgto.Items.Count - 1 do begin

         pmFormaPgto.Items[i].Checked := False;

         sbFormaPgto.Down := False;

      end
   end
   else begin

      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;

   end;

   Filtra();
end;

procedure Tfrm_Compromisso_Planilha.sbFormaPgtoClick(Sender: TObject);
begin
  // Forma de Pagamento

  pmFormaPgto.Popup(sbFormaPgto.Left, sbFormaPgto.Top + sbFormaPgto.Height + 140);

end;

procedure Tfrm_Compromisso_Planilha.sbChequeClick(Sender: TObject);
var
  sMsg : String;
  qyCheque : TUMZQuery;
  sChave : String;
begin
   // Atribuir cheque

   // Mesmo privilégio para baixar a mensalidade

   if not DM.UsuarioLogado.TemPermissao( 2038, npAcesso, True ) then Exit;

   if qryContasPagarcd_titulo_origem.AsInteger > 0 then begin
     Mensagem('Não é possível alterar informações deste título. Você deve alterar as informações diretamente na fatura criada.', 'Atenção', MB_OK + MB_ICONWARNING);
     Exit;
   end;

   if qryContasPagar.FieldByName('nr_cheque').AsString = '' then begin
      // Registrar o Cheque
      Application.CreateForm(Tfrm_compromisso_cheques, frm_compromisso_cheques);

      frm_compromisso_cheques.iCodColigada := qryContasPagarCD_COLIGADA.AsInteger;
      frm_compromisso_cheques.iCodTitulo := qryContasPagarcd_titulo.AsInteger;
      frm_compromisso_cheques.ShowModal;

      Filtra();

   end
   else begin
      // Cheque ja registrado, cancelar.

      sMsg := 'Este pagamento foi programado com o cheque nº ';
      sMsg := sMsg + qryContasPagar.FieldByName('nr_cheque').AsString + '.';
      sMsg := ' Deseja cancelar esta programação? ';

      if Mensagem(sMsg, 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then begin
         sbCheque.Down := True;
         exit;
      end;

      DM.CriarConsulta(qyCheque);
      qyCheque.Close();
      qyCheque.SQL.Text :=
         ' UPDATE fin_contas_pagar SET nr_cheque = NULL, cd_caixa = NULL ' +
         ' WHERE cd_titulo = ' + qryContasPagarcd_titulo.AsString   +
         ' AND cd_coligada = ' + qryContasPagarCD_COLIGADA.AsString;
      qyCheque.ExecSQL();

      // cancelou o cheque
      sChave :=  qryContasPagarcd_titulo.AsString + ';' + qryContasPagarcd_coligada.AsString;

      DM.setLog(iModuloPadrao, 'Alteracao', sChave, qryContasPagarcd_coligada.AsInteger, 'Cancelou a programação do Cheque "'+qryContasPagar.FieldByName('nr_cheque').AsString+'" da Conta "'+qryContasPagarcd_caixa.AsString+'"');

      FreeAndNil(qyCheque);

   end;

   Filtra();

end;

procedure Tfrm_Compromisso_Planilha.sbColigadaClick(Sender: TObject);
begin
   if not TfrmSelecionarColigada.ShowModal then Exit;

   cbUnidadeEnsino.ItemIndex := DM.UsuarioLogado.GetListaColigadasFilhaSelecionada.IndexOf(
      TfrmSelecionarColigada.getResultado.Codigo )+1;

   DM.SalvaColigada(cbUnidadeEnsino);

   cbUnidadeEnsinoChange(nil);
end;

procedure Tfrm_Compromisso_Planilha.FormCreate(Sender: TObject);
begin
   // Criação do Formulário
   r_anterior := 0;
   r_atual := 0;
   // montar os campos na planilha
   DM.MontarPlanilha(grd, 'planilha_compromissos_campos');

   qryContasPagar.SortedFields := 'DT_VENCIMENTO';

   DM.CriarConsulta(qAuxCP);
   DM.CriarConsulta(qAuxCP02);
end;

procedure Tfrm_Compromisso_Planilha.sbSelecionarColunaClick(Sender: TObject);
begin
   // Selecionar outros campos

   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grd, 'planilha_compromissos_campos');
end;

procedure Tfrm_Compromisso_Planilha.grdTitleClick(Column: TColumn);
var
   n : smallint;
   field : string;
begin
   // Clique no título da grade... ordenar pela coluna clicada

   For n:= 0 to grd.Columns.Count - 1 do begin
      grd.Columns[n].Title.Font.Style := [];
   end;

   field := Column.FieldName;

   if(field = 'CD_AUTORIZA_SITU') then
   begin
      field := 'CD_AUTORIZA_SITU_ORDENA';
   end;
   
   if qryContasPagar.SortedFields = field then
   begin
      case qryContasPagar.SortType of
         stAscending: qryContasPagar.SortType := stDescending;
         stDescending: qryContasPagar.SortType := stAscending;
      end;
   end
   else
   begin
      qryContasPagar.SortedFields := field;
      qryContasPagar.SortType := stAscending;
   end;

   Column.Title.Font.Style := [fsUnderline];

//   Filtra();
end;

procedure Tfrm_Compromisso_Planilha.miCreditosVisualizarClick(Sender: TObject);
const
   SChaveAcao = 'UMFinanceiro.Compromissos.UtilizarCreditosDisponiveis';
begin
   if not DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, SChaveAcao,
      npAcesso, True) then Exit;

   TfrmFinCreditosCPVisualizar.VisualizaCreditos(
      qryContasPagarCD_PESSOA.AsInteger,
      qryContasPagarNM_PESSOA.AsString);
end;

procedure Tfrm_Compromisso_Planilha.sbTituloClick(Sender: TObject);
begin
  // Filtrou pelo título

  filtro2 := 3;

  if TSpeedButton(Sender).Down then
  begin
     cbDataFiltro.Enabled        := False;
     sbPorFornecedor.Enabled     := False;
     sbPorCentro.Enabled         := False;
     sbPorConta.Enabled          := False;
     sbFiltraContaCaixa.Enabled  := False;

     Selecionar1Click(nil);
  end
  else
  begin
     cbDataFiltro.Enabled        := True;
     sbPorFornecedor.Enabled     := True;
     sbPorCentro.Enabled         := True;
     sbPorConta.Enabled          := True;
     sbFiltraContaCaixa.Enabled  := True;

     Todos1Click(nil);
  end;

end;

procedure Tfrm_Compromisso_Planilha.Gerarcrditoparaapessoa1Click(
  Sender: TObject);
var
   telaGerarCreditoPessoa : TfrmGerarCreditoCP;
begin

   if not (DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Compromissos.GerarCreditoFornecedor', npAcesso, True)) then Exit;

   if qryContasPagar.RecNo = 0 then
   begin
      Mensagem('Selecione um título.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   if (qryContasPagarVL_LIQUIDO.AsCurrency <= 0) then
   begin
      Mensagem('Não é possível gerar créditos de compromissos não pagos.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   Application.CreateForm(TfrmGerarCreditoCP, telaGerarCreditoPessoa);

   telaGerarCreditoPessoa.Compromisso := TCompromisso.GetCompromisso(qryContasPagarCD_TITULO.AsInteger);
   telaGerarCreditoPessoa.ShowModal();

   FreeAndNil(telaGerarCreditoPessoa);
end;


procedure Tfrm_Compromisso_Planilha.GerarFatura;
var
   ValTotal : Currency;
   n : Integer;
   sCodFaturas : String;
// qInsApropria : TUMZQuery;
begin
   // Gerar Fatura

   // Pegar alguns dados da primeira fatura
   if qryContasPagar.BookmarkValid(Pointer(grd.SelectedRows.Items[0])) then
   begin
      qryContasPagar.GotoBookmark(Pointer(grd.SelectedRows.Items[0]));
   end;

   frm_Compromisso_Gerar.qyCompromissocd_pessoa.AsInteger := qryContasPagarcd_pessoa.AsInteger;
   frm_Compromisso_Gerar.qyCompromissocd_coligada.AsInteger := qryContasPagarcd_coligada.AsInteger;
   frm_Compromisso_Gerar.qyCompromissodt_competencia.AsDateTime := qryContasPagardt_competencia.AsDateTime;
   frm_Compromisso_Gerar.qyCompromissodt_provavel_pgto.AsDateTime := qryContasPagardt_provavel_pgto.AsDateTime;
   frm_Compromisso_Gerar.qyCompromissodt_vencimento.AsDateTime := qryContasPagardt_vencimento.AsDateTime;
   frm_Compromisso_Gerar.qyCompromissodt_emissao_nota.AsDateTime := qryContasPagardt_emissao_nota.AsDateTime;
   frm_Compromisso_Gerar.qyCompromissocd_forma_pgto.AsInteger := qryContasPagarcd_forma_pgto.AsInteger;
   frm_Compromisso_Gerar.qyCompromissocd_tipo_titulo.AsInteger := qryContasPagarcd_tipo_titulo.AsInteger;
   frm_Compromisso_Gerar.qyCompromissocd_caixa.AsInteger := qryContasPagarcd_caixa.AsInteger;
   frm_Compromisso_Gerar.qyCompromissonr_cheque.AsInteger := qryContasPagarnr_cheque.AsInteger;

   ValTotal := 0;

   sCodFaturas := '(-1 ';
   
   for n:= 0 to grd.SelectedRows.Count - 1 do begin

      if qryContasPagar.BookmarkValid(Pointer(grd.SelectedRows.Items[n])) then
      begin
         qryContasPagar.GotoBookmark(Pointer(grd.SelectedRows.Items[n]));
      end;

       ValTotal := ValTotal + qryContasPagarvl_pendente.AsCurrency;

       sCodFaturas := sCodFaturas + ', ' + qryContasPagarcd_titulo.AsString;

   end;

   sCodFaturas := sCodFaturas + ')';

   frm_Compromisso_Gerar.qyCompromissovl_despesa.AsCurrency := ValTotal;

{ Rever... na geração da fatura, não inclui novas apropriações... 
   // Incluir as apropriações

   DM.CriarConsulta(qInsApropria);

   // Alterar... não funciona assim em algumas base...

   qInsApropria.SQL.Text :=
    ' REPLACE INTO fin_apropria_cp ' + 
    ' select ' + frm_Compromisso_Gerar.qyCompromissocd_titulo.AsString + ', cd_coligada, cd_conta, cd_centro, sum(vl_movimento) ' +
    ' From fin_apropria_cp where cd_titulo in ' + sCodFaturas +
    ' GROUP BY cd_coligada, cd_conta, cd_centro ' ;

   qInsApropria.ExecSQL();

   FreeAndNil(qInsApropria);
}

   // Apresentar a apropriação dos outros titulos não da fatura. somente para visualização
   frm_Compromisso_Gerar.qyApropriacao.Close();
   frm_compromisso_Gerar.qyApropriacao.SQL.Text :=
   ' select ' + frm_Compromisso_Gerar.qyCompromissocd_titulo.AsString + ' cd_titulo, cd_coligada, cd_conta, cd_centro, sum(vl_movimento) vl_movimento ' +
   ' From fin_apropria_cp where cd_titulo in ' + sCodFaturas +
   ' GROUP BY cd_coligada, cd_conta, cd_centro ' ;

   // frm_Compromisso_Gerar.qyApropriacao.RequestLive := False;
   frm_Compromisso_Gerar.qyApropriacao.Open();

   frm_Compromisso_Gerar.EhFatura := true;
   frm_Compromisso_Gerar.sLstCodFatura := sCodFaturas;

   frm_Compromisso_Gerar.ShowModal();

   Filtra();

end;

procedure Tfrm_Compromisso_Planilha.GerarFatura2;
var
   sCodFaturas : String;
   n : Integer;
   ValTotal : Currency;
   iCodFornec : Integer;
   sAux : String;

   qFatura : TUMZQuery;
   sTitulo : String;
   Movimentacao : TMovimento;
   sOp : String;

   cd_coligada : Integer;
begin
   if not(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex] is TColigada) then
   begin
      Mensagem('Selecione uma Unidade de Ensino!', '', MB_ICONEXCLAMATION + MB_OK, Handle);
      cbUnidadeEnsino.SetFocus;
      Exit;
   end;

   cd_coligada := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;

   // Juntar mais de um título
   ValTotal := 0;

   if grd.SelectedRows.Count <=1 then Exit;

   if qryContasPagar.BookmarkValid(Pointer(grd.SelectedRows.Items[0])) then
   begin
      qryContasPagar.GotoBookmark(Pointer(grd.SelectedRows.Items[0]));
   end;

   iCodFornec := qryContasPagar.FieldByName('cd_pessoa').AsInteger;

   sCodFaturas := '( ';
   sOp := '';

   for n:= 0 to grd.SelectedRows.Count - 1 do begin

       if qryContasPagar.BookmarkValid(Pointer(grd.SelectedRows.Items[n])) then
       begin
       qryContasPagar.GotoBookmark(Pointer(grd.SelectedRows.Items[n]));
       end;

       if qryContasPagar.FieldByName('cd_pessoa').AsInteger <> iCodFornec then begin

          Mensagem('Para criar uma fatura de vários títulos, você deverá selecionar somente os títulos do mesmo fornecedor.', 'UNIMESTRE', MB_OK + MB_ICONWARNING, hANDLE);
          Exit; 

       end;

       if NOT ((qryContasPagar.FieldByName('cd_autoriza_situ').AsInteger = 1 ) OR Autoriza) then begin
          Mensagem('Para efetuar o agrupamento é necessário que todos os títulos selecionados estejam autorizados para pagamento.', 'UNIMESTRE', MB_OK + MB_ICONWARNING, hANDLE);
          Exit;
       end;

       if qryContasPagarvl_pendente.AsCurrency <= 0 then begin
          Mensagem('Para efetuar o agrupamento é necessário que todos os títulos selecionados estejam pendentes de pagamento.', 'UNIMESTRE', MB_OK + MB_ICONWARNING, hANDLE);
          Exit;
       end;



       ValTotal := ValTotal + qryContasPagarvl_pendente.AsCurrency;

       sCodFaturas := sCodFaturas + sOp + qryContasPagarcd_titulo.AsString;
       sOp := ', ';

   end;

   sCodFaturas := sCodFaturas + ')';

   sAux := 'Você deseja criar uma fatura agrupando todos os títulos selecionados, que totalizam o valor de ' + FloatToStrF(ValTotal, ffNumber, 15, 2) + '?';

   if Mensagem(sAux, 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes then begin
      Exit;
   end;

   // Inserir uma Nova Fatura com dados na primeira fatura selecionada

   try
      if qryContasPagar.BookmarkValid(Pointer(grd.SelectedRows.Items[0])) then
      begin
         qryContasPagar.GotoBookmark(Pointer(grd.SelectedRows.Items[0]));
      end;
   except
      qryContasPagar.First;
   end;

   sTItulo := GetParametroUltimoTitulo;

   Dm.CriarConsulta(qFatura);

   // Autorizar este título automaticamente, pois, os originais já foram autorizados

   qFatura.SQL.Text :=
     ' INSERT INTO fin_contas_pagar_autoriza (cd_titulo, cd_coligada, cd_autoriza_situ, cd_autoriza_usuario, dt_autoriza, me_autoriza) ' +
     ' VALUES (:cd_titulo, :cd_coligada, :cd_autoriza_situ, :cd_autoriza_usuario, now(), :me_autoriza) ';

   qFatura.ParamByName('cd_titulo').AsString :=  sTitulo;
   qFatura.ParamByName('cd_coligada').AsInteger := cd_coligada;
   qFatura.ParamByName('cd_autoriza_situ').AsInteger := 1;
   qFatura.ParamByName('cd_autoriza_usuario').AsInteger := DM.iCdPessoaLogado;
   qFAtura.ParamByName('me_autoriza').AsString := 'Agrupamento de Títulos ' + sCodFaturas + ', já autorizados para pagamento anteriormente.';
   qFatura.ExecSQL();

   n := DM.LastInsert;
   
   qFatura.SQL.Text := ' INSERT INTO '
      + '    fin_contas_pagar ( '
      + '       cd_titulo, '
      + '       cd_autoriza, '
      + '       cd_titulo_principal, '
      + '       cd_pessoa, '
      + '       cd_coligada, '
      + '       ds_despesa, '
      + '       ds_historico, '
      + '       nr_documento, '
      + '       nr_parcela, '
      + '       dt_emissao_nota, '
      + '       dt_lancamento, '
      + '       dt_competencia, '
      + '       dt_vencimento, '
      + '       dt_provavel_pgto, '
      + '       vl_despesa, '
      + '       cd_situacao, '
      + '       cd_tipo_titulo, '
      + '       cd_forma_pgto, '
      + '       cd_caixa, '
      + '       vl_total_despesa '
      + '    )   '
      + ' SELECT '
      + '    :cd_titulo, '
      + '    :cd_autoriza, '
      + '    :cd_titulo_principal, '
      + '    cp.cd_pessoa, '
      + '    cp.cd_coligada, '
      + '    CONCAT("Agrupamento dos títulos """,GROUP_CONCAT(DISTINCT cp.nr_documento SEPARATOR "/"), """ de ", p.nm_pessoa), '
      + '    CONCAT("Agrupamento dos títulos """,GROUP_CONCAT(DISTINCT cp.nr_documento SEPARATOR "/"), """ de ", p.nm_pessoa), '
      + '    CONCAT("(A) ",GROUP_CONCAT(DISTINCT cp.nr_documento SEPARATOR "/")), 1, '
      + '    cp.dt_emissao_nota, '
      + '    CURRENT_DATE(),  '
      + '    cp.dt_competencia, '
      + '    cp.dt_vencimento,   '
      + '    cp.dt_provavel_pgto, '
      + '    SUM(cp.vl_despesa - cp.vl_abatimento), '
      + '    1, '
      + '    cp.cd_tipo_titulo, '
      + '    cp.cd_forma_pgto, '
      + '    cp.cd_caixa, '
      + '    SUM(cp.vl_despesa - cp.vl_abatimento) '
      + ' FROM '
      + '    fin_contas_pagar as cp '
      + '    INNER JOIN pessoas as p ON ( '
      + '       p.cd_pessoa = cp.cd_pessoa '
      + '    ) '
      + '    WHERE '
      + '       cd_titulo in ' + sCodFaturas 
      + ' GROUP BY cp.cd_pessoa ';

   qFatura.ParamByName('cd_titulo').AsString := sTitulo;
   qFatura.ParamByName('cd_autoriza').AsInteger := n;
   qFatura.ParamByName('cd_titulo_principal').AsString := sTitulo;

   qFatura.ExecSQL();


   //Atualizar o código de origem dos títulos atuais
   qFatura.SQL.Text :=
     ' UPDATE fin_contas_pagar' +
     '    SET cd_titulo_origem = ' + sTitulo +
     '  WHERE cd_coligada = ' + IntToStr(cd_coligada) +
     '    AND cd_titulo IN  ' + sCodFaturas ;


   qFatura.ExecSQL();

   // Inserir a Apropriação CP

   Movimentacao := TMovimento.Create;

   Movimentacao.TipoDeAcao := GerarTitulos;
   Movimentacao.CodigoTitulo := StrToInt(sTitulo);
   Movimentacao.Coligada := cd_coligada;
   Movimentacao.CodAcao := DM.BuscarCodigoAcaoPadrao(COD_ACAO_PADRAO);
   Movimentacao.ValorMovimento := ValTotal;
   Movimentacao.ValorMulta := 0;
   Movimentacao.ValorJuros := 0;
   Movimentacao.ValorDesconto := 0;
   Movimentacao.Observacao := '';

   Movimentacao.RegistrarMovimentacaoCP(0);

   // Inserir o fin_apropria_te

   qFatura.SQL.Text := ' INSERT INTO fin_apropria_cp ( '
   +'   cd_titulo, cd_coligada, cd_conta, cd_centro, vl_movimento '
   +' ) '
   +' SELECT '
   +   sTitulo + ', '
   +   ' ap.cd_coligada, '
   +   ' ap.cd_conta, '
   +   ' ap.cd_centro,'
   +   ' SUM(((cp.vl_despesa - cp.vl_abatimento)/cp.vl_total_despesa) * ap.vl_movimento) '
   +' FROM '
   +   ' fin_contas_pagar as cp '
   +   ' INNER JOIN fin_apropria_cp as ap ON (cp.cd_titulo_principal = ap.cd_titulo AND cp.cd_coligada = ap.cd_coligada) '
   +' WHERE '
   +   ' cp.cd_coligada = ' + IntToStr(cd_coligada)
   +  ' AND cp.cd_titulo in ' + sCodFaturas
   +' GROUP BY '
   +   ' ap.cd_coligada, ap.cd_conta, ap.cd_centro';

   qFatura.ExecSQL;

   FreeAndNil(qFatura);

   Mensagem('Fatura criada com sucesso!', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION, Handle);
   
   Filtra();
end;

function Tfrm_Compromisso_Planilha.GetParametroUltimoTitulo: string;
var
   qyParametroTitulo : TUMZQuery;
begin
   DM.CriarConsulta( qyParametroTitulo );
   qyParametroTitulo.Close();
   qyParametroTitulo.SQL.Clear();
   qyParametroTitulo.SQl.add('UPDATE parametros SET ds_valor = ds_valor + 1 WHERE ds_variavel = ''financeiro_cd_titulo_cp'';');
   qyParametroTitulo.ExecSQL;

   Result := DM.variavel_parametro( 'financeiro_cd_titulo_cp' );

   FreeAndNil(qyParametroTitulo);
end;

procedure Tfrm_Compromisso_Planilha.grdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
// cor: TColor;
   fixRect : TRect;
   bitmap: TBitmap;
   bmpWidth,X,Y: integer;
begin

  if Column.Field = qryContasPagarCD_ANEXO then
  begin
    if qryContasPagarCD_ANEXO.AsInteger <> 0 then
    begin
      Bitmap := TBitmap.Create;
      try
         imgAnexo.GetBitmap(0, Bitmap);
         X := Rect.Left + (((Rect.Right - Rect.Left) - Bitmap.Width) div 2);
         Y := Rect.Top + (((Rect.Bottom - Rect.Top) - Bitmap.Height) div 2);
         FixRect := Rect;
         FixRect.Right := FixRect.Right + 1;
         FixRect.Bottom := FixRect.Bottom + 1;
         grd.Canvas.Font.Color := clLtGray;
         grd.Canvas.Brush.Color := clWhite;
         grd.Canvas.Pen.Style := psClear;
         grd.Canvas.Rectangle(FixRect);
         grd.Canvas.Draw(X, Y, Bitmap);
         grd.Canvas.Pen.Style := psSolid;
      finally
         Bitmap.Free;
      end;
   end
   else
   begin
      grd.DefaultDrawColumnCell(Rect, DataCol, Column, State);    
    end;
  end;

   // colocar os titulos vinculados a fatura de outra cor..

   if qryContasPagarcd_titulo_origem.AsInteger > 0 then begin

     fixRect := Rect;

     grd.Canvas.Brush.Color:= clWindow;
     grd.Canvas.Font.Color:= clGrayText;

     grd.Canvas.FillRect(Rect);

     grd.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
   end;

end;

procedure Tfrm_Compromisso_Planilha.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {
      DESABILITA O CTRL + DEL DA GRID -> ESTA COMBINAÇÃO APAGA O REGISTRO
      SELECIONADO NA GRID
   }
   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;
end;

end.


