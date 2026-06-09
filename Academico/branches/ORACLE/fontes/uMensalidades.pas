unit uMensalidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, Buttons, StdCtrls, Menus, Db, ZConnection, Grids, DBGrids,
  ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  IniFiles, Mask, ColorGrd, Variants, DateUtils, ZDbcIntfs, UZDbcFuncs, ClassRegistros,
  uFSelecionarTurma, UZSortedGrid, ZSqlUpdate, StrUtils, MMSystem;
type                  
  TfrmMensalidades = class(TForm)
    Panel7: TPanel;
    btnImprimir: TSpeedButton;
    btnFechar: TSpeedButton;
    btnBaixar: TSpeedButton;
    btnPerdoar: TSpeedButton;
    btnDesconto: TSpeedButton;
    btnMotivo: TSpeedButton;
    Navigator: TDBNavigator;
    dtcMensalidades: TDataSource;
    btnObservacoes: TSpeedButton;
    btnGerar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnProtesto: TSpeedButton;
    btnVisualizar: TSpeedButton;
    popImpresso: TPopupMenu;
    mnuSim: TMenuItem;
    mnuNao: TMenuItem;
    qryDelete: TUMZQuery;
    tblMensalidades: TUMZQuery;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorJuros: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesBloquetoImpresso: TStringField;
    tblMensalidadesNomeAluno: TStringField;
    btnEstornar: TSpeedButton;
    qryUpdate: TUMZQuery;
    Panel2: TPanel;
    lbl: TLabel;
    grd: TZSortedGrid;
    Panel3: TPanel;
    Panel8: TPanel;
    btnAluno: TSpeedButton;
    btnTurmas: TSpeedButton;
    btnOutras: TSpeedButton;
    radPagos: TRadioButton;
    radParcial: TRadioButton;
    radPendentes: TRadioButton;
    radCancelados: TRadioButton;
    radNegociados: TRadioButton;
    radEmProtesto: TRadioButton;
    radVencidos: TRadioButton; 
    radTodos: TRadioButton;
    tblMensalidadesDepto: TSmallintField;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    popMensalidades: TPopupMenu;
    PorAluno1: TMenuItem;
    PorTurma1: TMenuItem;
    tblMensalidadesBloqueto: TStringField;
    btnReajustar: TSpeedButton;
    PeloNossoNumero1: TMenuItem;
    tblMensalidadesocorrencia_remessa: TSmallintField;
    tblMensalidadesocorrencia_retorno: TSmallintField;
    btnCheque: TSpeedButton;
    PorCheque1: TMenuItem;
    btnObsRestritas: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    cbTurma: TComboBox;
    tblMensalidadessn_credito_parcela: TStringField;
    tblMensalidadesnr_creditos: TFloatField;
    pmQtd: TPopupMenu;
    pmLogs: TPopupMenu;
    tblMensalidadestipoparcela: TSmallintField;
    tblMensalidadescurso: TStringField;
    qyAux: TUMZQuery;
    sbSelecionarColuna: TSpeedButton;
    tblMensalidadescd_coligada: TSmallintField;
    tblMensalidadesNomeResponsavel: TStringField;
    btnNegociar: TSpeedButton;
    tblMensalidadesds_tipo_titulo: TStringField;
    tblMensalidadesdt_competencia: TDateTimeField;
    tblMensalidadesds_historico: TStringField;
    tblMensalidadesds_conta: TStringField;
    tblMensalidadesds_centro: TStringField;
    tblMensalidadescd_bolsa: TIntegerField;
    tblMensalidadesds_bolsa: TStringField;
    btnResponsavel: TSpeedButton;
    PorResponsvel1: TMenuItem;
    tblMensalidadesds_sigla: TStringField;
    tblMensalidadesMoedaPgto: TStringField;
    tblMensalidadesvl_pago_moeda: TFloatField;
    tblMensalidadescd_tipo_titulo: TSmallintField;
    tblMensalidadesPercDescExtra: TFloatField;
    tblMensalidadesPercDescCond: TFloatField;
    tblMensalidadesdt_credito: TDateTimeField;
    pmProtestos: TPopupMenu;
    tblMensalidadescd_recibo: TIntegerField;
    tblMensalidadessn_protesto: TSmallintField;
    tblMensalidadesds_acao: TStringField;
    tblMensalidadesds_obs_desc: TMemoField;
    pmOutrasOpcoes: TPopupMenu;
    pmoReajustar: TMenuItem;
    pmoProrrogar: TMenuItem;
    LiberarJurosDesc1: TMenuItem;
    tblMensalidadessn_liberar_juros: TIntegerField;
    tblMensalidadessn_liberar_descontos: TIntegerField;
    PorTalodeDepsito1: TMenuItem;
    PorCdigodeBarras1: TMenuItem;
    DividirTtulos1: TMenuItem;
    AlterarResponsveldoTtulo1: TMenuItem;
    tblMensalidadesValorDescontoCalc: TFloatField;
    tblMensalidadesds_obs: TStringField;
    tblMensalidadesvl_credito: TFloatField;
    tblMensalidadesdesconto_calc: TFloatField;
    tblMensalidadesValorJurosCalc: TFloatField;
    tblMensalidadesds_caixa: TStringField;
    tblMensalidadescd_resp_finan: TStringField;
    tblMensalidadesjuros_calc: TFloatField;
    pnSituacaoCobranca: TPanel;
    Bevel2: TBevel;
    tblMensalidadesds_cor_cobranca: TStringField;
    tblMensalidadesds_situacao_cobranca: TStringField;
    Bevel6: TBevel;
    CancelarTaxasdeExamede2poca1: TMenuItem;
    qryUpdateResp: TUMZQuery;
    qryDeleteBoleto: TUMZQuery;
    tblMensalidadescodigoaluno: TIntegerField;
    tblMensalidadescd_mensalidade_origem: TIntegerField;
    tblMensalidadescd_centro_custo: TLargeintField;
    tblMensalidadescd_plano_conta: TLargeintField;
    tblMensalidadescd_caixa: TIntegerField;
    tblMensalidadescd_resp: TIntegerField;
    tblMensalidadescd_desc_condicional: TLargeintField;
    tblMensalidadescd_cheque_devolvido: TLargeintField;
    tblMensalidadessn_cobranca: TLargeintField;
    tblMensalidadescd_boleto: TLargeintField;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblMensalidadessn_spc: TSmallintField;
    tblMensalidadessn_serasa: TSmallintField;
    tblMensalidadessn_juridico: TSmallintField;
    VendadeProdutos1: TMenuItem;
    tblMensalidadesnr_nf: TLargeintField;
    tblMensalidadessn_nfe_gerada: TSmallintField;
    tblMensalidadescd_autenticacao: TStringField;
    Desagruparboleto1: TMenuItem;
    N1: TMenuItem;
    NotificarresponsveisdaMensalidade1: TMenuItem;
    N2: TMenuItem;
    Gerarcrditoparaapessoa1: TMenuItem;
    Utilizarcrditosdisponveis1: TMenuItem;
    tblMensalidadesvalorjuros_fixo: TFloatField;
    tblMensalidadesds_curso: TStringField;
    tblMensalidadesds_turma: TStringField;
    tblMensalidadesds_cor_background: TStringField;
    tblMensalidadesds_cor_fonte: TStringField;
    tblMensalidadesvalordesconto_fixo: TFloatField;
    tblMensalidadescd_moeda: TLargeintField;
    tblMensalidadescd_moeda_pgto: TLargeintField;
    tblMensalidadesds_deposito: TStringField;
    tblMensalidadesdepto_descricao: TStringField;
    N3: TMenuItem;
    PagarcomPagSeguro1: TMenuItem;
    tblMensalidadessn_cartorio: TIntegerField;
    tblMensalidadesds_descontos: TStringField;
    qryNegocia: TUMZQuery;
    qyNegociaAnterior: TUMZQuery;
    tblMensalidadessn_plano: TStringField;
    qryAlteraCompraAcumulada: TUMZQuery;
    SaldodaCantina1: TMenuItem;
    sbCobranca: TSpeedButton;
    qryPendenciasResp: TUMZReadOnlyQuery;
    qryPendenciasRespNR_TITULOS: TLargeintField;
    pnlRespPendente: TPanel;
    bvlSep1: TBevel;
    tblMensalidadesstatus_remessa: TStringField;
    updMensalidade: TZUpdateSQL;
    qryTurmasAluno: TUMZReadOnlyQuery;
    qryTurmasResp: TUMZReadOnlyQuery;
    qryTurmasAlunoCD_TURMA: TStringField;
    qryTurmasAlunoNR_ANOSEMESTRE: TSmallintField;
    qryTurmasAlunoCD_FINANCIAMENTO: TLargeintField;
    qryTurmasAlunoSN_FINANCIAMENTO: TLargeintField;
    qryTurmasRespCD_TURMA: TStringField;
    qryTurmasRespNR_ANOSEMESTRE: TSmallintField;
    qryTurmasRespCD_FINANCIAMENTO: TLargeintField;
    qryTurmasRespSN_FINANCIAMENTO: TLargeintField;
    tblMensalidadesSN_FINANCIAMENTO: TStringField;
    tblMensalidadesVL_PERCENTUAL_DIVISAO: TFloatField;
    tblMensalidadesDescricaoSituacao: TStringField;
    tblMensalidadesDDA: TStringField;
    miCreditosVisualizar: TMenuItem;
    procedure miCreditosVisualizarClick(Sender: TObject);
    procedure sbCobrancaClick(Sender: TObject);
    procedure SaldodaCantina1Click(Sender: TObject);
    procedure PagarcomPagSeguro1Click(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Utilizarcrditosdisponveis1Click(Sender: TObject);
    procedure Gerarcrditoparaapessoa1Click(Sender: TObject);
    procedure NotificarresponsveisdaMensalidade1Click(Sender: TObject);
    procedure Desagruparboleto1Click(Sender: TObject);
    procedure VendadeProdutos1Click(Sender: TObject);
    procedure CancelarTaxasdeExamede2poca1Click(Sender: TObject);
    procedure AlterarResponsveldoTtulo1Click(Sender: TObject);
    procedure DividirTtulos1Click(Sender: TObject);
    procedure tblMensalidadessn_liberar_jurosGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure LiberarJurosDesc1Click(Sender: TObject);
    procedure btnReajustarClick(Sender: TObject);
    procedure pmoProrrogarClick(Sender: TObject);
    procedure pmoReajustarClick(Sender: TObject);
    procedure btnProtestoClick(Sender: TObject);
    procedure pmProtestosPopup(Sender: TObject);
    procedure btnResponsavelClick(Sender: TObject);
    procedure btnNegociarClick(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure btnGerarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Todos1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure Filtra;
    procedure datAteCloseUp(Sender: TObject);
    procedure dtcMensalidadesDataChange(Sender: TObject; Field: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBaixarClick(Sender: TObject);
    procedure radPagosClick(Sender: TObject);
    procedure grdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblMensalidadesBeforeEdit(DataSet: TDataSet);
    procedure tblMensCalcFields(DataSet: TDataSet);
    procedure btnPerdoarClick(Sender: TObject);
    procedure btnMotivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlunoClick(Sender: TObject);
    procedure btnTurmasClick(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure btnDescontoClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Protestar(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure popImpressoPopup(Sender: TObject);
    procedure mnuSimClick(Sender: TObject);
    procedure mnuNaoClick(Sender: TObject);
    procedure Desabilita;
    procedure FormActivate(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure btnOutrasClick(Sender: TObject);
    procedure ExcluirParcela;
    procedure radPagosKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure btnChequeClick(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    Procedure ArrumaNossoNumero;
    procedure btnObsRestritasClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure pmLogsPopup(Sender: TObject);
  strict private
    FMostrarPendenciaResp: Boolean;
    filtro_turma : TResultadoFiltroTurma;

    procedure AlterarStatusBotaoNotificarMensalidades(const ativar: Boolean);
    procedure EEHc;
  private
    strFilter : String;
    strPerdao : String;
    flg : Boolean;
    Univer : TIniFile;
    strNossoNumero : String;
    strCheque_Banco : String;
    strCheque_Agencia : String;
    strCheque_nro : String;
    strCheque_cc : String;
    strCheque_Data : String;
    sOrdem : String;
    qyTemp1, qyTemp2 : TUMZQuery;
    procedure ArrumarCreditosAcademicosAluno;
    function DoCreateField(const FieldName: WideString; Origin: string): TField;

    function DoAddFields(All: Boolean): TField;
    function verificaSelecionados: TRadioButton;
    procedure carregaRadioSelecionado;
    procedure salvaRadioSelecionado;
    procedure ArrumarCreditosAcademicos;
    Function TemChequePendente(CodMensalidade : Integer) : Boolean;
    Function TemChequeDepositado(CodMensalidade : Integer) : Boolean;
    Procedure AssociarMensalidadesAluno(CodAluno : Integer);
    Procedure AssociarDescontosAlunos(CodAluno : Integer);
    Procedure BuscaPeloCodigoBarras(CodigoBarras : String);
    procedure DefineSituacaoCobranca(const ASDescricao, ASHexCor: string);
    procedure BaixarMensalidade();
    procedure BaixarMensalidadeAntigo();

    function getMensalidadesAgrupadas(CodigoMensalidade, CodigoAluno: Integer): String;
    function validaEstornoMensalidadeCartao(cd_mensalidade: Integer): Boolean;
    function validaEstornoMensalidadeRetorno(cd_mensalidade: Integer): Boolean;
    function mensalidadeFromCantina(cd_mensalidade: Integer):boolean;

      function IsTurmaFinanciamento: Boolean;
      function GetAnoSemestreSelecionado: AnsiString;
      function GetTurmaSelecionada: AnsiString;
      function GetFinanciamentoSelecionado: Cardinal;
      procedure LoadTurmasAluno(const Id: Integer);
      procedure LoadTurmasResp(const Id: Integer);
    { Private declarations }
  public
    lngCodigoAluno : Longint;
    sNomeAluno : String;
    flgPrint : Boolean;
    xCodigoAluno: Longint;
    xParcela: Integer;
    xTurma: String;
    bAdicionouCampo :  Boolean;
    rBSelecionadoAntes : TRadioButton;
    xDataVencimento: TDateTime;
    indiTurmasAnterior : integer;
    { Public declarations }

    FiltrarGerar, bDDA : Boolean; // Variavel criada para decidir se atualiza ou não a planilha após a geração de mensalidades
    class procedure AutenticarMensalidade(sMascara : String = '');
  end;



var
  frmMensalidades: TfrmMensalidades;

implementation

uses
   uRepBloquetos, Main, uManutMens, uDM, uImpMens, uUsuario, uMotivos, uDinCh,
   uTransferir, uNovaMens, uProtesto, uNossoNumero, uFSelecionarPessoa,
   uAluno, Math, uProcuraCheque, uMensaInformacoes, uRepRecibo, uGeneral,
   uBiblioMultaEmprestimo, uClassMovimento, uMensa_Outras_Baixa, uMensalidadeAplicarDesconto, uNegociacao,
   uCamposPlanilhas, uReajuste, uProgresso, uLiberarJurosDesconto,
   uMensalidadesDivisao, uFCancelTaxasRecorrencia, uMensalidades_baixar,
   UFObservacoes, uFComprasRegistroSaidas, ClassComprasEntradaSaida,
   uFComprasGerarTitulo, uMensa_Gera, UFMensalidadeGerar, uEstorno,
   uMensalidadesNotificacoes, uFGerarCreditoMensalidade, uMensalidade,
   uFAplicarCreditoMensalidade, uFSaldoCantina, UFCobrancaObs, uCobranca, uRemessaClass,
  uIUMDataModule, UFFinCreditosVisualizar;

{$R *.DFM}

procedure TfrmMensalidades.Todos1Click(Sender: TObject);
var
   n : Integer;
   resultado_filtro : TResultadoFiltroPessoa;
begin
  for n := 0 to ComponentCount - 1 do
  begin
    if Components[n] is TMenuItem then
    begin
      if TMenuItem( Components[n] ).Checked = True then
      begin
        TMenuItem( Components[n] ).Checked := False;
        Break;
      end;
    end;
  end;
  TMenuItem( Sender ).Checked := True;
  strFilter := '';
  case TMenuItem( Sender ).Tag of
    1 : begin
      resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

	   if resultado_filtro.filtrado then
	   Begin
	      lngCodigoAluno := resultado_filtro.cd_pessoa;
//	      frm_Sel_Pessoa.qryPessoa.Close;
	   End
	   else Exit;

	end;
    2 : begin
          filtro_turma := TfrmSelecionarTurma.Filtrar([]);
          if not filtro_turma.filtrado then Exit;
        end;
  end;
end;

procedure TfrmMensalidades.Utilizarcrditosdisponveis1Click(Sender: TObject);
var
   telaAplicarCreditoMensalidade : TfrmAplicarCreditoMensalidade;
   P: Pointer;
begin

   if not (DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Mensalidades.UtilizarCreditosDisponiveis', npAcesso, True)) then Exit;

   if tblMensalidades.RecNo = 0 then
   begin
      Mensagem('Selecione uma mensalidade.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   if NOT(TMensalidade.canAplicarCreditoMensalidade(tblMensalidadesSituacao.AsInteger)) then
   begin
      Mensagem('Não é possível aplicar créditos em mensalidades que não estão pendentes ou reservadas.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   Application.CreateForm(TfrmAplicarCreditoMensalidade, telaAplicarCreditoMensalidade);

   telaAplicarCreditoMensalidade.Mensalidade := TMensalidade.GetMensalidade(tblMensalidadescd_mensalidade.AsInteger);
   if telaAplicarCreditoMensalidade.ShowModal() = mrYes then
   begin
      P := tblMensalidades.GetBookmark();
      tblMensalidades.Close();
      tblMensalidades.Open();

      if tblMensalidades.BookmarkValid(P) then
         tblMensalidades.GotoBookmark(P);
   end;

   FreeAndNil(telaAplicarCreditoMensalidade);
end;

function TfrmMensalidades.validaEstornoMensalidadeCartao(
  cd_mensalidade: Integer): Boolean;
const
   SQL_VALIDA_ESTORNO_MENSALIDADE_CARTAO =
      ' SELECT '+
      ' 	count(*) as qtd '+
      ' FROM '+
      ' 	fin_cartao_mensalidades '+
      ' WHERE '+
      ' 	cd_mensalidade = :cd_mensalidade ';
var
   qyValidaMensalidade : TUMZQuery;
begin
   Result := True;

   DM.CriarConsulta(qyValidaMensalidade);

   qyValidaMensalidade.SQL.Text := SQL_VALIDA_ESTORNO_MENSALIDADE_CARTAO;
   qyValidaMensalidade.ParamByName('cd_mensalidade').AsInteger :=
      cd_mensalidade;
   qyValidaMensalidade.Open;


   if qyValidaMensalidade.FieldByName('qtd').AsInteger > 0 then
   begin
      Mensagem(
         'Não é possível realizar o estorno desta mensalidade através da Planilha de recebimentos, '+
         'pois ela está vinculada a uma operação de baixa por cartão. Para estornar a mensalidade, '+
         'utilize a opção de cancelar movimentação, na planilha de cartões.',
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      Result := False;
   end;
end;

function TfrmMensalidades.validaEstornoMensalidadeRetorno(
  cd_mensalidade: Integer): Boolean;
const
   SQL_VALIDA_ESTORNO_MENSALIDADE_RETORNO =
      ' SELECT '+
      ' 	MIN(t.cd_retorno) as cd_retorno '+
      ' FROM '+
      ' 	retorno_itens_titulos as t '+
      ' INNER JOIN retorno_itens as i ON (t.cd_retorno = i.cd_retorno and t.nr_sequencia = i.nr_sequencia) ' +
      ' WHERE '+
      ' i.cd_situacao = 10 '+
      ' AND	cd_mensalidade = :cd_mensalidade ';
var
   qyValidaMensalidade : TUMZQuery;
begin
   Result := True;

   DM.CriarConsulta(qyValidaMensalidade);

   qyValidaMensalidade.SQL.Text := SQL_VALIDA_ESTORNO_MENSALIDADE_RETORNO;
   qyValidaMensalidade.ParamByName('cd_mensalidade').AsInteger :=
      cd_mensalidade;
   qyValidaMensalidade.Open;


   if qyValidaMensalidade.FieldByName('cd_retorno').AsInteger > 0 then
   begin
      Mensagem(
         'Este título foi baixado através de um arquivo retorno.' +
         'O estorno deve ser efetuado pela tela de Retorno do Banco.'+
         'A baixa encontra-se no código de retorno: ' + qyValidaMensalidade.FieldByName('cd_retorno').AsString,
         'Aviso',
         MB_ICONWARNING + MB_OK,
         Handle
      );

      Result := False;
   end;
end;

procedure TfrmMensalidades.VendadeProdutos1Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Saidas', npAcesso, True ) then Exit;

   Application.CreateForm(TfrmComprasRegistroSaidas, frmComprasRegistroSaidas);

   frmComprasRegistroSaidas.cd_pessoa_carregado := lngCodigoAluno;
   frmComprasRegistroSaidas.ShowModal();

   frmComprasRegistroSaidas := nil;

   Self.Filtra;
end;

procedure TfrmMensalidades.btnImprimirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2002, npAcesso, True ) then Exit;
   try
      Application.CreateForm(TfrmImpMens, frmImpMens);

      frmImpMens.RecMensalidade.Cd_Mensalidade := tblMensalidadescd_mensalidade.AsInteger;
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

      if DM.variavel_parametro('agrupa_impressao_mensalidades_baixar') = 'S' then
      begin
         frmImpMens.MensalidadesAgrupadas := Self.getMensalidadesAgrupadas(
            tblMensalidadescd_mensalidade.AsInteger,
            tblMensalidadescodigoaluno.AsInteger
         );
      end;

      frmImpMens.ShowModal;
   finally
      frmImpMens.Free;
   end;
   
   Filtra;

   cbTurma.SetFocus;
end;


procedure TfrmMensalidades.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmMensalidades.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   rbSelecionadoAgora:TRadioButton;
   sMsg: string;
   sMsgTurma :string;
   sMsgTurmaAntes :string;
begin
  sMsgTurma := '';
  if (indiTurmasAnterior <> cbTurma.ItemIndex) and (cbTurma.ItemIndex <> -1) then
  begin

      if(cbTurma.ItemIndex = 0) then
      begin
         sMsgTurma := 'Todas as turmas';
         sMsgTurmaAntes := 'A ultima turma';
      end
      else
      begin
         if(indiTurmasAnterior = 0) then
         begin
            sMsgTurma := 'A ultima turma';
            sMsgTurmaAntes := 'Todas as turmas';
         end;
      end;
  end;

  rbSelecionadoAgora := verificaSelecionados();

  if rbSelecionadoAgora <> nil then
  begin
     if(sMsgTurma <> '') then
     begin
         sMsg := 'Seu filtro padrão atualmente é para "'+sMsgTurmaAntes+'" na situação de títulos "'+rBSelecionadoAntes.Caption+'".Você deseja salvar o novo filtro de títulos "'+rbSelecionadoAgora.Caption+'" para "'+sMsgTurma+'" como padrão?';
     end
     else
     begin
         sMsg := 'Seu filtro padrão de situações atualmente é para títulos "'+rBSelecionadoAntes.Caption+'".Você deseja salvar o novo filtro para títulos "'+rbSelecionadoAgora.Caption+'" como padrão?';
     end;

     if((rbSelecionadoAgora.Name <>  rBSelecionadoAntes.Name)or(sMsgTurma<>'')) then
     begin
         if(Mensagem(sMsg, '', MB_YESNO + MB_ICONQUESTION+256) = IDYES) then
         begin
            salvaRadioSelecionado();
            if(cbTurma.ItemIndex=0) then
            begin
               DM.Set_Parametro_usuario(cbTurma,self.Name);
            end
            else
            begin
               //Zerar o parametro
               DM.Delete_Parametro_Usuario(cbTurma,self.Name);
            end;
        end;
     end;
  end;

  tblMensalidades.Close;
  Action := caFree;
end;

procedure TfrmMensalidades.FormCreate(Sender: TObject);
const
   SSettingKeyFmt = '%s.%s.IndexFieldNames';
var
   S: AnsiString;
  wYear, wMonth, wDay : Word;
begin

   FMostrarPendenciaResp :=
      DM.variavel_parametro('sn_avisa_financeiro_pendencia_alunos_resp') = 'S';

   // Type cast para permitir acessar a propriedade Columns
   // Será modificado futuramente após substituir todos os componentes TDBGrid
  DM.MontarPlanilha(TDBGrid(TCustomDBGrid(grd)), 'planilha_mensalidades_campos');

  sOrdem := ' NomeAluno, DataVencimento ';

  Screen.Cursor := crHourGlass;
  flgPrint := False;
  strFilter := '';

  DecodeDate( DataHoje, wYear, wMonth, wDay );
  PrincipalForm.pnlMsg.Caption := '';
  grd.Options := grd.Options - [dgRowLines];
  Screen.Cursor := crDefault;

  cbTurma.Items.Clear;

  // Criar dois componentes temporários para auxiliar seleções na base

  DM.CriarConsulta(qyTemp1);
  DM.CriarConsulta(qyTemp2);

  if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
  begin
     btnObservacoes.Caption := DM.variavel_parametro('botao_observacoes_nome');
     if Trim(btnObservacoes.Caption) = EmptyStr then
         btnObservacoes.Caption := '&Observações';
  end;

   S := Format(SSettingKeyFmt, [Name, tblMensalidades.Name]);
   tblMensalidades.IndexFieldNames := DM.GetUserSetting(S, 'UMFinanceiro', tblMensalidades.IndexFieldNames);
end;

procedure TfrmMensalidades.tblMensalidadesCalcFields(DataSet: TDataSet);
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
     tblMensalidadesPercDescCond.AsCurrency := (tblMensalidadesdesconto_calc.AsCurrency / (tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency) * 100);
  end else begin
     tblMensalidadesPercDescCond.AsString := '';
  end;

  // Verificar se o Boleto já foi impresso
  if Dm.isTrue(tblMensalidadesBloqueto.AsString) then begin
     tblMensalidadesBloquetoImpresso.AsString := 'X'
  end else begin
     tblMensalidadesBloquetoImpresso.AsString := '';
  end;

  // CALCULAR O VALORTOTAL

  // Parcelas VENCIDAS
  if  ( ( tblMensalidadesSituacao.Value in [ 2, 10 ] ) OR ( DM.lst_situacao_fin_prot[tblMensalidadesSituacao.AsInteger] =1 ) ) then begin


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

procedure TfrmMensalidades.tblMensalidadessn_liberar_jurosGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if Sender.Value = 1 then
      Text:= 'Sim'
   else
      Text:='';
end;

procedure TfrmMensalidades.Filtra;
const
   SFiltroFinanciamentoId = ' AND fp.CD_FINANCIAMENTO = :CD_FINANCIAMENTO ';
   SFiltroFinanciamentoAnoSemestre = ' AND fp.NR_ANOSEMESTRE = :NR_ANOSEMESTRE ';
var
  wYear, wMonth, wDay : Word;
  lngCodigo : Longint;
  n : Byte;
  datInicio, datFim : TDateTime;
  strAnoLetivo, strAux : String;
  MyBookmark : TBookmark;
  filtrou : Boolean;
  filtro, op : String;
  i :Integer;
  strSubSelectTblMensalidades : string;
  sApelido, sCampos, sOperador  : string;
begin
  filtrou := false;

  Screen.Cursor := crHourGlass;

  try
    MyBookmark := tblMensalidades.GetBookmark;
  except
  end;


  strFilter := '';

  sOperador := '';

  tblMensalidades.Close;
  tblMensalidades.SQL.Clear;
  //Verifica se a conexão é Oracle ou MySQL
  if tblMensalidades.Connection.Protocol = 'oracle' then //Oracle
  begin
     tblMensalidades.SQL.Text :=
      'SELECT                                                                       '+
      '     me.*                                                                    '+
      '     , dp.descricao as depto_descricao                                       '+
      '     , LEFT(me.ds_obs_desc, 150) as ds_obs                                   '+
      '     , pe.nm_pessoa as NomeAluno                                             '+
      '     , TO_CHAR(COALESCE(me.cd_resp, pe.cd_resp_finan)) AS cd_resp_finan      '+
      '     , SUBSTR((GROUP_CONCAT(DISTINCT ax.ds_acao ORDER BY ax.ds_acao SEPARATOR ", ")), 1, 255) as ds_descontos '+
      '     , IF(COALESCE(me.cd_item_plano,0) <> 0,"Sim","Não") as sn_plano         '+
      '     , Resp.nm_pessoa as NomeResponsavel                                     '+
      '     , tt.ds_tipo_titulo                                                     '+
      '     , pc.ds_conta                                                           '+
      '     , cc.ds_centro                                                          '+
      '     , bt.ds_bolsa                                                           '+
      '     , mo.ds_sigla                                                           '+
      '     , mp.ds_sigla as MoedaPgto                                              '+
      '     , sf.sn_protesto                                                        '+
      '     , sf.ds_cor_background                                                  '+
      '     , sf.ds_cor_fonte                                                       '+
      '     , am.ds_acao                                                            '+
      '     , GET_ACRESCIMOS(me.cd_mensalidade,  TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataHoje)) + ', ''YYYY-MM-DD'') ) as juros_calc             '+
      '     , GET_DESCONTOS(me.cd_mensalidade, TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataHoje)) + ', ''YYYY-MM-DD'') ) as desconto_calc           '+
      '     , tc.ds_caixa   														'+
      '     , sit.cd_auxiliar sn_cobranca 											'+
      '     , sit.ds_sigla ds_cor_cobranca											'+
      '     , sit.ds_valor ds_situacao_cobranca    									'+
      '     , c.sn_spc as sn_spc 													'+
      '     , c.sn_serasa as sn_serasa 												'+
      '     , c.sn_juridico as sn_juridico 											'+
      '     , c.sn_cartorio as sn_cartorio 											'+
      '     , CASE res.ds_situacao                                         ' +
      '       WHEN "F" THEN "Fila"                                         ' +
      '       WHEN "E" THEN "Exportado"                                    ' +
      '       WHEN "R" THEN "Registrado"                                   ' +
      '       WHEN "J" THEN "Rejeitado"                                    ' +
      '       WHEN "B" THEN "Baixado"                                     ' +
      '       WHEN "S" THEN "Liquidado sem registro"                      ' +
      '       ELSE "-"                                                              ' +
      '       END as status_remessa                                                 ' +
      '  FROM                                                                       '+
      ' ([[SUB_SELECT]]) agrupado                                                   '+
      ' INNER JOIN mensalidades me ON (agrupado.CD_MENSALIDADE = me.cd_mensalidade) '+
      ' INNER JOIN fin_moedas mo ON (me.cd_moeda = mo.cd_moeda)                     '+
      ' INNER JOIN situacoes_financeiras sf ON ( me.situacao =  sf.cd_situacao ) '+
      ' INNER JOIN Pessoas pe ON (me.CodigoAluno = pe.cd_pessoa ) LEFT JOIN pessoas Resp ON (COALESCE(me.cd_resp, pe.cd_resp_finan) = Resp.cd_pessoa) '+
      '  LEFT JOIN departamentos dp ON (me.depto = dp.codigo) ' +
      '  LEFT JOIN fin_tipos_titulo tt ON (me.cd_tipo_titulo = tt.cd_tipo_titulo AND me.cd_coligada = tt.cd_coligada) '+
      '  LEFT JOIN fin_plano_contas pc ON (me.cd_plano_conta = pc.cd_conta AND me.cd_coligada = pc.cd_coligada) '+
      '  LEFT JOIN fin_centro_custos cc ON (me.cd_centro_custo = cc.cd_centro AND me.cd_coligada = cc.cd_coligada) '+
      '  LEFT JOIN fin_bolsas_tipos bt ON (me.cd_bolsa = bt.cd_bolsa) '+
      '  LEFT JOIN fin_moedas mp ON (me.cd_moeda_pgto = mp.cd_moeda) '+
      '  LEFT JOIN fin_acoes_movimento am ON (me.cd_desc_condicional = am.cd_acao and am.cd_tipo_acao = 3 and am.cd_origem = 1) '+
      '  LEFT JOIN fin_mov_tesouraria te ON (te.cd_mensalidade = me.cd_mensalidade and te.nr_estorno = 0) ' +
      '  LEFT JOIN fin_cadastro_contas tc ON (tc.cd_caixa = te.cd_caixa) ' +
      '  LEFT JOIN fin_cobranca c ON (me.codigoaluno = c.cd_pessoa) '+
      '     LEFT JOIN situacoes sit ON (c.cd_situacao = sit.cd_situacao) AND (sit.cd_modulo = 2053) '+
      '  WHERE me.cd_coligada IN ( [lista_coligadas] ) ';

      strSubSelectTblMensalidades := Format(
      'SELECT                                                                        '+
      '     me.CD_MENSALIDADE                                                        '+
      '  FROM                                                                        '+
      ' mensalidades me                                                              '+
      ' INNER JOIN fin_moedas mo ON (me.cd_moeda = mo.cd_moeda)                      '+
      ' INNER JOIN situacoes_financeiras sf ON ( me.situacao =  sf.cd_situacao ) '+
      ' INNER JOIN Pessoas pe ON (me.CodigoAluno = pe.cd_pessoa ) LEFT JOIN pessoas Resp ON (COALESCE(me.cd_resp, pe.cd_resp_finan) = Resp.cd_pessoa) '+
      '  LEFT JOIN fin_tipos_titulo tt ON (me.cd_tipo_titulo = tt.cd_tipo_titulo AND me.cd_coligada = tt.cd_coligada) '+
      '  LEFT JOIN fin_plano_contas pc ON (me.cd_plano_conta = pc.cd_conta AND me.cd_coligada = pc.cd_coligada) '+
      '  LEFT JOIN fin_centro_custos cc ON (me.cd_centro_custo = cc.cd_centro AND me.cd_coligada = cc.cd_coligada) '+
      '  LEFT JOIN fin_bolsas_tipos bt ON (me.cd_bolsa = bt.cd_bolsa) '+
      '  LEFT JOIN fin_moedas mp ON (me.cd_moeda_pgto = mp.cd_moeda) '+
      '  LEFT JOIN fin_acoes_movimento am ON (me.cd_desc_condicional = am.cd_acao and am.cd_tipo_acao = 3 and am.cd_origem = 1) '+
      '  LEFT JOIN fin_mov_tesouraria te ON (te.cd_mensalidade = me.cd_mensalidade and te.nr_estorno = 0) ' +
      '  LEFT JOIN fin_cadastro_contas tc ON (tc.cd_caixa = te.cd_caixa ) ' +
      '  LEFT JOIN fin_cobranca c ON (me.codigoaluno = c.cd_pessoa) '+
      '  LEFT JOIN situacoes sit ON (c.cd_situacao = sit.cd_situacao) AND (sit.cd_modulo = 2053)              '+
      '  LEFT JOIN rem_status as res ON (res.nr_nossonumero = me.nossonumero)                                 '+  
      '  WHERE me.cd_coligada IN ( %s ) ', [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );

  end else begin
     tblMensalidades.SQL.Text :=
      'SELECT me.*                                                                  '+
      '     , dp.descricao as depto_descricao                                       '+
      '     , LEFT(me.ds_obs_desc, 150) as ds_obs                                   '+
      '     , pe.nm_pessoa as NomeAluno                                             '+
      '     , CAST(COALESCE(me.cd_resp, pe.cd_resp_finan) AS CHAR) as cd_resp_finan '+
      '     , IF(COALESCE(me.cd_item_plano,0) <> 0,"Sim","Não") as sn_plano         '+
      '     , SUBSTR((GROUP_CONCAT(DISTINCT ax.ds_acao ORDER BY ax.ds_acao SEPARATOR ", ")), 1, 255) as ds_descontos '+
      '     , Resp.nm_pessoa as NomeResponsavel                                     '+
      '     , tt.ds_tipo_titulo                                                     '+
      '     , pc.ds_conta                                                           '+
      '     , cc.ds_centro                                                          '+
      '     , bt.ds_bolsa                                                           '+
      '     , mo.ds_sigla                                                           '+
      '     , mp.ds_sigla as MoedaPgto                                              '+
      '     , sf.sn_protesto                                                        '+
      '     , sf.ds_cor_background                                                  '+
      '     , sf.ds_cor_fonte                                                       '+
      '     , am.ds_acao                                                            '+
      '     , GET_ACRESCIMOS(me.cd_mensalidade, ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataHoje)) + ' ) as juros_calc             '+
      '     , GET_DESCONTOS(me.cd_mensalidade, ' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataHoje)) + ') as desconto_calc           '+
      '     , tc.ds_caixa                                                           ' +
      '     , sit.cd_auxiliar as sn_cobranca                                        ' +
      '     , sit.ds_sigla as ds_cor_cobranca                                       ' +
      '     , sit.ds_valor as ds_situacao_cobranca                                  ' +
      '     , c.sn_spc as sn_spc                                                    ' +
      '     , c.sn_serasa as sn_serasa                                              ' +
      '     , c.sn_juridico as sn_juridico                                          ' +
      '     , c.sn_cartorio as sn_cartorio                                          ' +
      '     , T.descricao as ds_turma                                               ' +
      '     , cm.ds_curso as ds_curso                                               ' +
      '     , CASE res.ds_situacao                                                  ' +
      '       WHEN "F" THEN "Fila"                                 ' +
      '       WHEN "E" THEN "Exportado"                            ' +
      '       WHEN "R" THEN "Registrado"                                   ' +
      '       WHEN "J" THEN "Rejeitado"                                    ' +
      '       WHEN "B" THEN "Baixado"                                       ' +
      '       WHEN "S" THEN "Liquidado sem registro"                        ' +
      '       ELSE "-"                                                              ' +
      '      END      as status_remessa,                                            ' +
        'CASE '
      + '      WHEN fp.CD_FINANCIAMENTO_PESSOA IS NOT NULL THEN ''1'' '
      + '      WHEN fp2.CD_FINANCIAMENTO_PESSOA IS NOT NULL THEN ''1'' '
      + '      ELSE ''0'' '
      + 'END SN_FINANCIAMENTO, '
      + 'CASE '
      + '  WHEN '
      + '    EXISTS ( '
      + '      SELECT '
      + '        rem_dados.cd_remessa '
      + '      FROM '
      + '        rem_dados '
      + '          JOIN rem_layouts ON '
      + '            (rem_dados.cd_layout = rem_layouts.cd_layout) '
      + '          JOIN rem_ocorrencias ON '
      + '            (rem_dados.cd_ocorrencia = rem_ocorrencias.cd_ocorrencia) '
      + '      WHERE '
      + '        rem_dados.cd_mensalidade = me.cd_mensalidade AND '
      + '        rem_layouts.cd_origem = 3 AND '
      + '        rem_ocorrencias.cd_acao = 101 '
      + '    ) '
      + '  THEN '
      + '    ''NÃO'' '
      + '  WHEN '
      + '    EXISTS ( '
      + '      SELECT '
      + '        rem_dados.cd_remessa '
      + '      FROM '
      + '        rem_dados '
      + '          JOIN rem_layouts ON '
      + '            (rem_dados.cd_layout = rem_layouts.cd_layout) '
      + '          JOIN rem_ocorrencias ON '
      + '            (rem_dados.cd_ocorrencia = rem_ocorrencias.cd_ocorrencia) '
      + '      WHERE '
      + '        rem_dados.cd_mensalidade = me.cd_mensalidade AND '
      + '        rem_layouts.cd_origem = 3 AND '
      + '        rem_ocorrencias.cd_acao != 101 '
      + '    ) '
      + '  THEN '
      + '    ''SIM'' '
      + '  ELSE '
      + '    ''NÃO'' '
      + 'END DDA, '
      + 'CASE '
      + '  WHEN me.situacao IN (0, 1) THEN '
      + '    CASE '
      + '      WHEN '
      + '        EXISTS ( '
      + '          SELECT '
      + '            1 '
      + '          FROM '
      + '            fin_cheques '
      + '              JOIN fin_cheques_mensalidades ON '
      + '                (fin_cheques.CD_CHEQUE = fin_cheques_mensalidades.CD_CHEQUE) '
      + '          WHERE '
      + '            fin_cheques.cd_situacao = 0 AND '
      + '            fin_cheques_mensalidades.cd_mensalidade = me.cd_mensalidade '
      + '        ) '
      + '      THEN '
      + '        CONCAT(sf.ds_sigla_situacao, ''(C)'') '
      + '      ELSE '
      + '        sf.ds_sigla_situacao '
      + '    END '
      + '  WHEN '
      + '    me.situacao = 2 AND me.datavencimento < CURRENT_DATE '
      + '  THEN '
      + '    ''VENC'' '
      + '  ELSE '
      + '    sf.ds_sigla_situacao '
      + 'END DescricaoSituacao ' +
      ' FROM mensalidades me                                                        ' +
      ' INNER JOIN coligadas as co ON (co.cd_coligada = me.cd_coligada)             ' +
      ' INNER JOIN fin_moedas mo ON (me.cd_moeda = mo.cd_moeda)                     ' +
      ' INNER JOIN situacoes_financeiras sf ON ( me.situacao =  sf.cd_situacao )    ' +
      ' INNER JOIN Pessoas pe ON (me.CodigoAluno = pe.cd_pessoa ) LEFT JOIN pessoas Resp ON (COALESCE(me.cd_resp, pe.cd_resp_finan) = Resp.cd_pessoa) '+
      '  LEFT JOIN departamentos dp ON (me.depto = dp.codigo) ' +
      '  LEFT JOIN fin_config_tipos_titulo tt ON (me.cd_tipo_titulo = tt.cd_tipo_titulo AND co.cd_coligada_matriz = tt.cd_coligada_matriz) ' +
      '  LEFT JOIN fin_config_plano_contas pc ON (me.cd_plano_conta = pc.cd_conta AND co.cd_coligada_matriz = pc.cd_coligada_matriz)    ' +
      '  LEFT JOIN fin_config_centro_custos cc ON (me.cd_centro_custo = cc.cd_centro AND co.cd_coligada_matriz = cc.cd_coligada_matriz) '+
      '  LEFT JOIN fin_bolsas_tipos bt ON (me.cd_bolsa = bt.cd_bolsa) '+
      '  LEFT JOIN fin_moedas mp ON (me.cd_moeda_pgto = mp.cd_moeda) '+
      '  LEFT JOIN fin_acoes_movimento am ON (me.cd_desc_condicional = am.cd_acao and am.cd_tipo_acao = 3 and am.cd_origem = 1) '+
      '  LEFT JOIN fin_mov_tesouraria te ON (te.cd_mensalidade = me.cd_mensalidade and te.nr_estorno = 0) ' +
      '  LEFT JOIN fin_cadastro_contas tc ON (tc.cd_caixa = te.cd_caixa) ' +
      '  LEFT JOIN fin_cobranca c ON (me.codigoaluno = c.cd_pessoa) '+
      '  LEFT JOIN situacoes sit ON (c.cd_situacao = sit.cd_situacao) AND (sit.cd_modulo = 2053) '+
      '  LEFT JOIN cursos_mestre CM ON (CM.CD_CURSO = ME.curso) '+
      '  LEFT JOIN turmas T ON(T.codigo = Me.turma AND T.curso  = ME.curso AND T.anosemestre = ME.anosemestre) '+
      '  LEFT JOIN fin_mov_cr as cx ON (me.cd_mensalidade_origem = cx.cd_mensalidade)                          '+
      '  LEFT JOIN fin_acoes_movimento as ax ON (ax.cd_tipo_acao = 3 AND ax.cd_acao = cx.cd_acao )             '+
      '  LEFT JOIN rem_status as res ON (res.nr_nossonumero = me.nossonumero)                                  '+
      ' LEFT JOIN fin_financiamento_mensalidade fm ON (me.cd_mensalidade = fm.CD_MENSALIDADE) ' +
      ' LEFT JOIN fin_financiamento_pessoa fp ON (fm.CD_FINANCIAMENTO_PESSOA = fp.CD_FINANCIAMENTO_PESSOA) ' +
      ' LEFT JOIN fin_financiamento_mensalidade fm2 ON (me.cd_mensalidade = fm2.CD_MENSALIDADE_ORIGEM) ' +
      ' LEFT JOIN fin_financiamento_pessoa fp2 ON (fm2.CD_FINANCIAMENTO_PESSOA = fp2.CD_FINANCIAMENTO_PESSOA) ' +
      '  WHERE me.cd_coligada IN ( [lista_coligadas] ) ';
  end;

  tblMensalidades.SQL.Text := StringReplace( tblMensalidades.SQL.Text, '[lista_coligadas]', DM.UsuarioLogado.GetColigadasFilhaSelecionada(), [rfReplaceAll, rfIgnoreCase] );


  // Filtro pelo Código do Aluno
  if popMensalidades.Items[0].Checked then begin

     filtrou := True;

     tblMensalidades.SQL.Add( ' AND (me.codigoaluno = :Codigo) ' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.codigoaluno = '+IntToStr(lngCodigoAluno)+') ';

     tblMensalidades.ParamByName('Codigo').AsInteger := lngCodigoAluno;

      if IsTurmaFinanciamento then
      begin
         tblMensalidades.SQL.Add(SFiltroFinanciamentoId);
         tblMensalidades.ParamByName('CD_FINANCIAMENTO').AsInteger :=
            GetFinanciamentoSelecionado;

         if DM.UsaAnosemestre then
         begin
            tblMensalidades.SQL.Add(SFiltroFinanciamentoAnoSemestre);
            tblMensalidades.ParamByName('NR_ANOSEMESTRE').AsString :=
               GetAnoSemestreSelecionado;
         end;
      end;

      if not IsTurmaFinanciamento then
      begin
         if cbTurma.ItemIndex > 0 then begin

            tblMensalidades.SQL.Add(' and (me.turma = :Turma ) AND fp.CD_FINANCIAMENTO IS NULL ');
            tblMensalidades.ParamByName('Turma').AsString := GetTurmaSelecionada;
            strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' and (me.turma = '+QuotedStr(GetTurmaSelecionada)+' )';

            if DM.UsaAnosemestre then begin
               tblMensalidades.SQL.Add(' and (me.anosemestre = :Anosemestre ) ');
               tblMensalidades.ParamByName('AnoSemestre').AsString := GetAnoSemestreSelecionado;
               strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' and (me.anosemestre = '+QuotedStr(GetAnoSemestreSelecionado)+' ) ';
            end;

         end;
      end;

     //  Verificando, por parâmetro, se o indivíduo tem livros em atraso na biblioteca
     if ( DM.variavel_parametro( 'sn_avisa_financeiro_pendencia_biblioteca' ) = 'S' ) AND ( DM.TemLivrosAtrasados( lngCodigoAluno ) ) then begin
         Mensagem( 'Este aluno possui livros em atraso na biblioteca.'+chr(13)+'Para visualizar as pendências, utilize o módulo Biblioteca.', 'Informação', MB_OK + MB_ICONINFORMATION);
     end;

     if ( Pos( 'financ' , DM.variavel_parametro( 'biblio_forma_cobranca' ) ) > 0 ) then
     begin
        if frmMultaEmprestimo = nil then
           Application.CreateForm(TFrmMultaEmprestimo, FrmMultaEmprestimo);

        if frmMultaEmprestimo.TemMulta( lngCodigoAluno , tblMensalidades.FieldByName('NomeAluno').AsString , 2 , false ) = true then
           if Mensagem( 'Este aluno possui multas pendentes na biblioteca.'+chr(13)+'Deseja visualizá-las ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
              frmMultaEmprestimo.TemMulta( lngCodigoAluno , tblMensalidades.FieldByName('NomeAluno').AsString , 2 , true );

        frmMultaEmprestimo.Free;
        frmMultaEmprestimo := nil;
     end;
     // Verificando, por parâmetro, se o indivíduo tem livros em atraso na biblioteca


  end;

  // Filtro pelo Código do Responsavel
  if popMensalidades.Items[4].Checked then begin

     filtrou := True;

     tblMensalidades.SQL.Add( ' AND (me.cd_resp = :Codigo)' );
     tblMensalidades.ParamByName('Codigo').AsInteger := lngCodigoAluno;

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.cd_resp = '+IntToStr(lngCodigoAluno)+')';

     if IsTurmaFinanciamento then
     begin
        tblMensalidades.SQL.Add(SFiltroFinanciamentoAnoSemestre);
        tblMensalidades.ParamByName('NR_ANOSEMESTRE').AsString :=
         GetAnoSemestreSelecionado
     end;

     if not IsTurmaFinanciamento then
     begin
        if cbTurma.ItemIndex > 0 then begin
           tblMensalidades.SQL.Add(' and (me.anosemestre = :Anosemestre ) ');
           tblMensalidades.ParamByName('AnoSemestre').AsString := GetAnoSemestreSelecionado;

           strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' and (me.anosemestre = '+QuotedStr(GetAnoSemestreSelecionado)+' ) ';
        end;
     end;

  end;

  // Por Turma
  if popMensalidades.Items[1].Checked then begin

     filtrou := True;

     tblMensalidades.SQL.Add( ' AND (me.turma = :Turma) and (me.anosemestre = :AnoSemestre) ' );
     tblMensalidades.ParamByName('AnoSemestre').AsInteger := filtro_turma.nr_anosemestre;
     tblMensalidades.ParamByName('Turma').AsString := filtro_turma.cd_turma;

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.turma = '+QuotedStr(filtro_turma.cd_turma)+') and (me.anosemestre = '+QuotedStr(IntToStr(filtro_turma.nr_anosemestre))+') ';

  end;

  // Por Nosso Numero
  if popMensalidades.Items[2].Checked OR popMensalidades.Items[6].Checked then begin

     filtrou := True;

     if (DM.variavel_parametro('mensalidades_nossonumero_pesquisa') = 'APROXIMADA') and (strNossoNumero <> '') then begin

        tblMensalidades.SQL.Add( ' AND (me.nossonumero like :nossonumero)' );
        tblMensalidades.ParamByName('nossonumero').AsString := '%' + strNossoNumero + '%';

        strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.nossonumero like '+QuotedStr(strNossoNumero)+')';

     end else begin

        tblMensalidades.SQL.Add( ' AND (me.nossonumero = :nossonumero)' );
        tblMensalidades.ParamByName('nossonumero').AsString := strNossoNumero;

        strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.nossonumero = '+QuotedStr(strNossoNumero)+')';

     end;

  end;

  // Por Talao de Depósito
  if popMensalidades.Items[5].Checked then begin

     filtrou := True;

     if (DM.variavel_parametro('mensalidades_nossonumero_pesquisa') = 'APROXIMADA') and (strNossoNumero <> '') then begin

        tblMensalidades.SQL.Add( ' AND (me.ds_deposito like :nossonumero)' );
        tblMensalidades.ParamByName('nossonumero').AsString := '%' + strNossoNumero + '%';

        strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.ds_deposito like '+QuotedStr(strNossoNumero)+')';
     end else begin

        tblMensalidades.SQL.Add( ' AND (me.ds_deposito = :nossonumero)' );
        tblMensalidades.ParamByName('nossonumero').AsString := strNossoNumero;

        strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.ds_deposito = '+QuotedStr(strNossoNumero)+')';

     end;

  end;

  // POR CHEQUES
  if popMensalidades.Items[3].Checked then begin

     filtrou := True;

     //tenta trazer todas as mensalidades com aquele cheque
     qyTemp1.Close();
     qyTemp1.SQL.Clear();
     qyTemp1.Params.Clear();
     qyTemp1.SQL.Add(''+
      '   SELECT                                                          '+
      '      DISTINCT  cd_mensalidade                                     '+
      '   FROM                                                            '+
      '      fin_cheques_mensalidades fcm                                 '+
      '      INNER JOIN fin_cheques fc ON (fcm.cd_cheque = fc.cd_cheque)  '+
      '   WHERE                                                           '+
      '');
     op := '';
     if (Length(Trim(strCheque_Banco)) > 0) then begin
        qyTemp1.SQL.Add(op);
        qyTemp1.SQL.Add('ds_banco = ' + QuotedStr(strCheque_Banco) + '');
        op := ' AND ';
     end;
     
     if (Length(Trim(strCheque_nro)) > 0) then begin
        qyTemp1.SQL.Add(op);
        qyTemp1.SQL.Add('ds_cheque = ' + QuotedStr(strCheque_nro) + '');
        op := ' AND ';
     end;
     if (Length(Trim(strCheque_cc)) > 0) then begin
        qyTemp1.SQL.Add(op);
        qyTemp1.SQL.Add('ds_conta = ' + QuotedStr(strCheque_cc) + '');
        op := ' AND ';
     end;
     if (Length(Trim(strCheque_Agencia)) > 0) then begin
        qyTemp1.SQL.Add(op);
        qyTemp1.SQL.Add('ds_agencia = ' + QuotedStr(strCheque_Agencia) + '');
        op := ' AND ';
     end;
     if (strCheque_Data <> '  /  /  ') then begin
        qyTemp1.SQL.Add(op);
        //Verifica se a conexão é Oracle ou MySQL
        if tblMensalidades.Connection.Protocol = 'oracle' then //Oracle
        begin
           qyTemp1.SQL.Add('TO_CHAR(dt_compensacao, ''YYYY-MM-DD'') = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(strCheque_Data))) + '');
        end else begin
           qyTemp1.SQL.Add('dt_compensacao = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', StrToDate(strCheque_Data))) + '');
        end;
        op := ' AND ';
     end;
     qyTemp1.Open();

     if not qyTemp1.IsEmpty then begin
        op := '';
        filtro := ' AND me.cd_mensalidade IN (';
        while not qyTemp1.Eof do begin
           filtro := filtro + op + qyTemp1.FieldByName('cd_mensalidade').AsString;
           op := ', ';
           qyTemp1.Next();
        end;
        filtro := filtro + ')';
        tblMensalidades.SQL.Add( filtro );

        strSubSelectTblMensalidades := strSubSelectTblMensalidades + filtro;
        filtrou := True;
     end else begin
        filtro := ' AND me.cd_mensalidade IN (-1)';

        tblMensalidades.SQL.Add( filtro );
        strSubSelectTblMensalidades := strSubSelectTblMensalidades + filtro;
        filtrou := True;
     end;
     qyTemp1.Close();

  end;

  if not filtrou then begin
     tblMensalidades.SQL.Add( ' AND me.datavencimento = :DataVencimento ');

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND me.datavencimento = '+QuotedStr(FormatDateTime('yyyy-mm-dd',DataHoje))+' ';
  end;

  // Filtrar por Situações

  if radPagos.Checked then begin

     tblMensalidades.SQL.Add( ' AND (me.situacao = 0 or me.situacao = 1)' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.situacao = 0 or me.situacao = 1)';

  end else if radCancelados.Checked then begin

     tblMensalidades.SQL.Add( ' AND (me.situacao = 4 or me.situacao = 5 or me.situacao = 7 or me.situacao = 8)' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.situacao = 4 or me.situacao = 5 or me.situacao = 7 or me.situacao = 8)';

  end else if radNegociados.Checked then begin

     tblMensalidades.SQL.Add( ' AND (me.situacao = 3)' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.situacao = 3)';

  end else if radEmProtesto.Checked then begin

     tblMensalidades.SQL.Add( ' AND (sf.sn_protesto = 1 )' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (sf.sn_protesto = 1 )';

  end else if radParcial.Checked then begin

     tblMensalidades.SQL.Add( ' AND (me.tipoparcela = 1)' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.tipoparcela = 1)';

  end else if radPendentes.Checked then begin

     tblMensalidades.SQL.Add( ' AND (me.situacao = 2 OR me.situacao = 10 OR sf.sn_protesto = 1 )' );

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.situacao = 2 OR me.situacao = 10 OR sf.sn_protesto = 1 )';

  end else if radVencidos.Checked then begin

     tblMensalidades.SQL.Add( ' AND (me.datavencimento < :Data) and (me.situacao = 2 OR me.situacao = 10 OR sf.sn_protesto = 1)' );
     tblMensalidades.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);

     strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' AND (me.datavencimento < '+QuotedStr(FormatDateTime('yyyy-mm-dd',DataHoje))+') and (me.situacao = 2 OR me.situacao = 10 OR sf.sn_protesto = 1)';

  end;

  // Fim do Filtro das Situações


  if not tblMensalidades.Active then begin

     //Verifica se a conexão é Oracle ou MySQL
     if tblMensalidades.Connection.Protocol = 'oracle' then //Oracle
     begin
        strSubSelectTblMensalidades := strSubSelectTblMensalidades + ' GROUP BY me.cd_mensalidade ';
        tblMensalidades.SQL.Text := StringReplace(tblMensalidades.SQL.Text, '[[SUB_SELECT]]', strSubSelectTblMensalidades, [rfReplaceAll]);
     end else begin
        tblMensalidades.SQL.Add(' GROUP BY me.cd_mensalidade ');
     end;

     if not filtrou then begin
        tblMensalidades.ParamByName('DataVencimento').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
     end;

     tblMensalidades.Open;
//     FieldDef := tblmensalidades.FieldDefList.FieldByName('cd_grupo_pessoa');
//     tblMensalidades.Close;
//     FieldDef.CreateField(tblMensalidades.Owner,DoCreateField('cd_grupo_pessoa','') as TObjectField, 'cd_grupo_pessoa', false);
//     tblMensalidades.Open;


     btnNegociar.Font.Style := [];

  end;

   if tblMensalidades.BookmarkValid( MyBookmark ) then
      tblMensalidades.GotoBookmark( MyBookmark );

   tblMensalidades.FreeBookmark( MyBookmark );

  Screen.Cursor := crDefault;
end;


function TfrmMensalidades.DoCreateField(const FieldName: WideString; Origin: string): TField;
var
  FieldDef: TFieldDef;
  ParentField: TField;
  SubScript,
  ShortName,
  ParentFullName: String;
begin
  FieldDef := tblmensalidades.FieldDefList.FieldByName(FieldName);
  ParentField := nil;
  if tblmensalidades.ObjectView then
  begin
    if FieldDef.ParentDef <> nil then
    begin
      if FieldDef.ParentDef.DataType = ftArray then
      begin
        { Strip off the subscript to determine the parent's full name }
        SubScript := Copy(FieldName, Pos('[', FieldName), MaxInt);
        ParentFullName := Copy(FieldName, 1, Length(FieldName) - Length(SubScript));
        ShortName := FieldDef.ParentDef.Name + SubScript;
      end
      else
      begin
        if faUnNamed in FieldDef.ParentDef.Attributes then
          ParentFullName := FieldDef.ParentDef.Name else
          ParentFullName := ChangeFileExt(FieldName, '');
        ShortName := FieldDef.Name;
      end;
      ParentField := tblmensalidades.FieldList.Find(ParentFullName);
      if ParentField = nil then
        ParentField := DoCreateField(ParentFullName, Origin);
    end
    else
      ShortName := FieldDef.Name;
  end
  else
    ShortName := FieldName;
  Result := FieldDef.CreateField(tblmensalidades.Owner, ParentField as TObjectField, ShortName, False);
  try
    Result.Origin := Origin;
    Result.Name := FieldName;
  except
    Result.Free;
    raise;
  end;
end;


function TfrmMensalidades.DoAddFields(All: Boolean): TField;
var
  I: Integer;
  FieldName: WideString;
  Field: TField;
begin

  try
    { Add physical fields not already represented by TField components to the
      to the list of available fields }
    for I := 0 to tblmensalidades.FieldDefList.Count - 1 do
      with tblmensalidades.FieldDefList[I] do
        if (FieldClass <> nil) and not (faHiddenCol in Attributes) then
        begin
          FieldName := tblmensalidades.FieldDefList.Strings[I];
          Field := tblmensalidades.FindField(FieldName);
          Tag := 1;
        end;
    { Show the dialog }
  finally

  end;
end;

{
function TfrmMensalidades.CreateField(Owner: TComponent; ParentField: TObjectField = nil;
  const FieldName: WideString = ''; CreateChildren: Boolean = True): TField;
var
  FieldCount, I: Integer;
begin
  Result := CreateFieldComponent(Owner, ParentField, FieldName);
  if CreateChildren and HasChildDefs then
  begin
    if (DataType = ftArray) then
    begin
      if TFieldDefs(Collection).DataSet.SparseArrays then
        FieldCount := 1 else
        FieldCount := Size;
      for I := 0 to FieldCount - 1 do
        ChildDefs[0].CreateField(nil, TObjectField(Result), Format('%s[%d]',
          [Result.FieldName, I]))
    end else
      for I := 0 to ChildDefs.Count - 1 do
        ChildDefs[I].CreateField(nil, TObjectField(Result), '');
  end;
end;

 }


procedure TfrmMensalidades.datAteCloseUp(Sender: TObject);
begin
//  Filtra;
end;

procedure TfrmMensalidades.dtcMensalidadesDataChange(Sender: TObject;
  Field: TField);
var
  wYear, wMonth, wDay : Word;
  mensagem, mSituacao : String;
begin
   AlterarStatusBotaoNotificarMensalidades(tblMensalidadesSituacao.AsInteger = 2);
   Gerarcrditoparaapessoa1.Enabled := TMensalidade.canGerarCreditoMensalidade(tblMensalidadesSituacao.AsInteger);
   Utilizarcrditosdisponveis1.Enabled := TMensalidade.canAplicarCreditoMensalidade(tblMensalidadesSituacao.AsInteger);

   if FMostrarPendenciaResp then
   begin
      qryPendenciasResp.Close;
      qryPendenciasResp.ParamByName('CODIGOALUNO').AsInteger := tblMensalidadescodigoaluno.AsInteger;
      qryPendenciasResp.Open;

      if qryPendenciasRespNR_TITULOS.AsLargeInt > 0 then
      begin
         pnlRespPendente.Visible := True;
      end;
      
   end;

   if (not FMostrarPendenciaResp) or
      (qryPendenciasRespNR_TITULOS.AsLargeInt = 0) then
      pnlRespPendente.Visible := False;

   if tblMensalidadessn_cobranca.AsInteger = 1 then
   begin
      DefineSituacaoCobranca(
         tblMensalidadesds_situacao_cobranca.AsString,
         tblMensalidadesds_cor_cobranca.AsString);
      Bevel6.Visible := true;
      pnSituacaoCobranca.Visible := true;
   end
   else
      if (tblMensalidadessn_spc.AsInteger = 1)
      or (tblMensalidadessn_serasa.AsInteger = 1)
      or (tblMensalidadessn_juridico.AsInteger = 1)
      or (tblMensalidadessn_cartorio.AsInteger = 1) then
      begin
         if (tblMensalidadessn_spc.AsInteger = 1) then
            mensagem := mensagem + 'SPC';
            
         if (tblMensalidadessn_serasa.AsInteger = 1) then
            if mensagem <> '' then
               mensagem := mensagem + ', Serasa'
            else
               mensagem := mensagem + 'Serasa';
               
         if (tblMensalidadessn_juridico.AsInteger = 1) then
            if mensagem <> '' then
               mensagem := mensagem + ', Jurídico'
            else
               mensagem := mensagem + 'Jurídico';

         if (tblMensalidadessn_cartorio.AsInteger = 1) then
            if mensagem <> '' then
               mensagem := mensagem + ', Cartório'
            else
               mensagem := mensagem + 'Cartório';

         DefineSituacaoCobranca(
            'Este usuário encontra-se em: ' + mensagem,
            '#FFCC99');
         Bevel6.Visible := true;
         pnSituacaoCobranca.Visible := true;
      end
   else
   begin
      pnSituacaoCobranca.Visible := false;
      Bevel6.Visible := false;
   end;

  btnObservacoes.Font.Style := [];
  btnObsRestritas.Font.Style := [];

   if TfObservacoes.HasObservations(tblMensalidadescodigoaluno.AsInteger,
      okFinancial) then
      btnObservacoes.Font.Style := [fsBold];

   if TfObservacoes.HasObservations(tblMensalidadescodigoaluno.AsInteger,
      okRestrict) then
      btnObsRestritas.Font.Style := [fsBold];

  mSituacao := '';
  if (tblMensalidadesNomeAluno.AsString <> '') AND (tblMensalidadesTurma.AsString <> '') AND (tblMensalidadesAnoSemestre.DisplayText <> '' ) then
  begin
     qyAux.close();
     qyAux.SQL.Clear;
     qyAux.SQL.Text:= ' SELECT s.ds_situacao FROM matriculas m INNER JOIN situacao s ON (m.situacao = s.cd_situacao)'+
                      ' WHERE  m.turma = "'+tblMensalidadesTurma.AsString+'" AND m.codigoaluno = '+tblMensalidadescodigoaluno.AsString+
                      ' AND m.anosemestre = '+tblMensalidadesAnoSemestre.AsString;
     qyAux.Open();

     if qyAux.RecordCount >0 then
     begin
        mSituacao := ' ('+qyAux.FieldByName('ds_situacao').AsString+')';
     end;

  end;



  if popMensalidades.Items[0].Checked then begin
      if tblMensalidades.IsEmpty then
         lbl.Caption := 'ALUNO: ' + sNomeAluno + ' (' + IntToStr(lngCodigoAluno) + ')'
      else
         lbl.Caption := 'ALUNO: ' + tblMensalidadesNomeAluno.AsString + ' - ' + tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesAnoSemestre.DisplayText+mSituacao;
  end else if popMensalidades.Items[4].Checked then begin
      lbl.Caption := 'RESPONSÁVEL: ' + sNomeAluno + ' (' + IntToStr(lngCodigoAluno) + ')';
  end else if popMensalidades.Items[1].Checked then begin
     lbl.Caption := 'TURMA: ' + tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesNomeAluno.AsString + ' - ' + tblMensalidadesAnoSemestre.DisplayText;
  end else begin

     lbl.Caption := 'ALUNO: ' + tblMensalidadesNomeAluno.AsString + ' - ' + tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesAnoSemestre.DisplayText+mSituacao;

  end;
end;

procedure TfrmMensalidades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2 : VendadeProdutos1Click( nil );
      VK_F8 : btnAlunoClick( Sender );
      VK_F9 : btnTurmasClick( nil );
      VK_F7 : btnImprimirClick( nil );
      VK_F6 : ArrumarCreditosAcademicosAluno;
      VK_F10 : begin
         btnOutras.Tag := 0;
         btnOutrasClick( btnOutras );
      end;
      VK_F11 : begin
         btnOutras.Tag := 2;
         btnOutrasClick( btnOutras );
      end;
      VK_F12 : btnFecharClick( nil );
   end;

   {Ctrl+N}
   if (Key = Ord('N')) and (Shift = [ssCtrl]) then
      NotificarresponsveisdaMensalidade1Click(NotificarresponsveisdaMensalidade1);                          

   {Ctrl+Shift+Alt+N}
   if (Key = Ord('N')) and (Shift = [ssCtrl, ssShift, ssAlt]) then
      ArrumaNossoNumero;

   {Ctrl+Shift+Alt+C}
   if (Key = Ord('C')) and (Shift = [ssCtrl, ssShift, ssAlt]) then
      ArrumarCreditosAcademicos;

   {Ctrl+Shift+Alt+A}
   if (Key = Ord('A')) and (Shift = [ssCtrl, ssShift, ssAlt]) then
   begin
      if popMensalidades.Items[0].Checked then // Por aluno
      begin
         if Mensagem('Deseja associar os saldos da conta deste aluno nas suas dívidas?', 'Confirme', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
            Exit;

         AssociarMensalidadesAluno(tblMensalidadesCodigoAluno.AsInteger);
      end;
   end;

   {Ctrl+Shift+Alt+T}
   if (Key = Ord('T')) and (Shift = [ssCtrl, ssShift, ssAlt]) then
   begin
      if not tblMensalidades.Active then
      begin
         if Mensagem('Deseja associar os saldos de todas as contas nas respectivas dívidas?', 'Confirme', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
            Exit;

         AssociarMensalidadesAluno(0);
      end;
   end;

   {Ctrl+Shift+Alt+D}
   if (Key = Ord('D')) and (Shift = [ssCtrl, ssShift, ssAlt]) then
   begin
      if not tblMensalidades.Active then
      begin
         if Mensagem('Deseja associar os descontos de todas as contas nas respectivas dívidas?', 'Confirme', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
            Exit;

         AssociarDescontosAlunos(0);
      end else begin
         if Mensagem('Deseja associar os descontos da conta deste aluno nas suas dívidas?', 'Confirme', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
            Exit;

         AssociarDescontosAlunos(tblMensalidadesCodigoAluno.AsInteger);
      end;
   end;
end;

procedure TfrmMensalidades.btnBaixarClick(Sender: TObject);
const
   SMsgTituloNaoEncontrado = 'Título não encontrado. Aplique os filtros novamente e verifique a situação do título.';
var
   tela_baixa_mensalidade : string;
   qryDDA                 : TUMZQuery;
   bCancelarDDA           : Boolean;
   iCancelamento, MensalidadeId: Integer;
   S: AnsiString;
   NovoProcessoRemessa: Boolean;
   Remessa: TRemessa;
begin
   MensalidadeId := tblMensalidadescd_mensalidade.AsInteger;

   tblMensalidades.Refresh;

   if not tblMensalidades.Locate('cd_mensalidade', MensalidadeId, []) then
   begin
      Mensagem(SMsgTituloNaoEncontrado, 'Atenção');
      Exit;
   end;

   bCancelarDDA := False;
   
   S := DM.variavel_parametro('sn_processo_remessa_novo');
   NovoProcessoRemessa := S = '1';

   if NovoProcessoRemessa then
   begin
      Remessa := TRemessa.Create;
      bCancelarDDA := Remessa.verificaAcaoEstaFila(tblMensalidadesNossoNumero.AsString, tarBaixarDDA);
      if not bCancelarDDA then
      begin
         Remessa.Free;
         Remessa := nil;
      end;
   end;

   if not NovoProcessoRemessa then
   begin
      iCancelamento := 0;

      DM.CriarConsulta(qryDDA);
      qryDDA.Close;
      qryDDA.SQL.Text := ''+
      '  SELECT                         '+
      '   	rl.cd_origem,ro.cd_acao      '+
      '  FROM                           '+
      '  	rem_dados rd'+
      '	  INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)'+
      '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)'+
      '  WHERE                                                       '+
      '	  rd.cd_mensalidade = :cd_mensalidade';
      qryDDA.ParamByName('cd_mensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
      qryDDA.Open;

      bCancelarDDA := false;
      while not qryDDA.Eof do
      begin                    
         if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
           bCancelarDDA := true;
         if qryDDA.FieldByName('cd_origem').AsInteger = 101 then
           iCancelamento := iCancelamento +1;
         qryDDA.Next;
      end;
      if iCancelamento > 1 then
       bCancelarDDA := false;
   end;

   if ( bCancelarDDA = true ) then
   begin
     if ( Mensagem('Deseja cancelar o Débito Automático?', Application.Title, MB_YESNO) = mrYes ) then
     begin
         if NovoProcessoRemessa then
         begin
            Remessa.CancelaDDA(tblMensalidadesNossoNumero.AsString);
            Remessa.Free;
            Remessa := nil;
         end;
         if not NovoProcessoRemessa then
         begin
            DM.FazAcaoRemessa(arCancelamentoDDA, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
         end;
         Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do DDA ocorra.', Application.Title, MB_OK, Handle);
     end
     else
        exit;
   end;


   tela_baixa_mensalidade := trim( DM.variavel_parametro('tela_baixa_mensalidade') );

   if (tela_baixa_mensalidade = '') or (tela_baixa_mensalidade = '0') then
   begin
      Self.BaixarMensalidadeAntigo();
   end
   else
   begin
      Self.BaixarMensalidade();
   end;

   cbTurma.SetFocus;
   
end;

procedure TfrmMensalidades.radPagosClick(Sender: TObject);
begin
   if tblMensalidades.Active then
      Filtra;
  grd.SetFocus;
end;

procedure TfrmMensalidades.carregaRadioSelecionado();
Var
   I:integer;
begin

 for I := 0 to frmMensalidades.ComponentCount - 1 do
  begin
     if(frmMensalidades.Components[I].ClassType = TRadioButton) then
     begin
       DM.Get_Parametro_usuario(TRadioButton(frmMensalidades.Components[I]),Self.Name);
     end;
  end;

end;


function TfrmMensalidades.verificaSelecionados():TRadioButton;
var
  i:integer;
begin
   Result := nil;

  if radPagos.Checked then begin
  	 Result :=  radPagos;
    exit;
  end else if radCancelados.Checked then begin
    Result :=  radCancelados;
    exit; 
  end else if radNegociados.Checked then begin
    Result :=  radNegociados;
    exit;
  end else if radEmProtesto.Checked then begin
    Result :=  radEmProtesto;
    exit;
  end else if radParcial.Checked then begin
    Result :=  radParcial;
    exit;
  end else if radPendentes.Checked then begin
    Result :=  radPendentes;
    exit;
  end else if radVencidos.Checked then begin
    Result :=  radVencidos;
    exit;
  end else if radTodos.Checked then begin
    Result :=  radTodos;
    exit;
  end;
end;

procedure TfrmMensalidades.salvaRadioSelecionado();
var
   I:integer;
begin
  for I := 0 to frmMensalidades.ComponentCount - 1 do
  begin
     if(frmMensalidades.Components[I].ClassType = TRadioButton) then
     begin
       DM.Set_Parametro_usuario(TRadioButton(frmMensalidades.Components[I]),Self.Name);
     end;
  end;
end;

procedure TfrmMensalidades.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
   SSQLFindEstoque = 'SELECT CD_COMPRA FROM COMP_ESTOQUE_MENSALIDADE WHERE CD_MENSALIDADE = ?';
   SMsgCaption = 'Aviso';
   SMsgPossuiEstoque = ''
      + 'Este título possui vínculo de lançamento de saída de estoque. Ao '
      + 'excluir este título, será também efetuada a exclusão das '
      + 'movimentações de estoque vinculadas com este título. Deseja realmente '
      + 'prosseguir?';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   UserChoice: Integer;
begin
   if ( Key = VK_DELETE ) and ( Shift = [ssCtrl] ) then
   begin

      if DM.UsuarioLogado.TemPermissao(2013, npExcluir, True) then
      begin

         UserChoice := ID_YES;
         
         Stmt := PrepareStatement(SSQLFindEstoque);
         try
            Stmt.SetInt(1, tblMensalidadescd_mensalidade.AsInteger);
            Rs := Stmt.ExecuteQueryPrepared;
            try
               if Rs.Next then
               begin
                  UserChoice := MessageBox(0, SMsgPossuiEstoque, SMsgCaption, MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2);
               end;
            finally
               Rs.Close;
            end;
            
         finally
            Stmt.Close;
         end;

         if UserChoice = ID_YES then
            ExcluirParcela;

         Abort;
      end;
   end;
//  if ( Key = VK_DELETE ) then ExcluirParcela;
end;

function TfrmMensalidades.IsTurmaFinanciamento: Boolean;
var
   Bookmark: TBookmark;
begin
   Result := False;

   if cbTurma.Items.Count = 0 then
   begin
      Exit;
   end;

   if cbTurma.ItemIndex < 1 then
   begin
      Exit;
   end;

   if cbTurma.Items.Objects[cbTurma.ItemIndex] = nil then
   begin
      Exit;
   end;

   Bookmark := TBookmark(cbTurma.Items.Objects[cbTurma.ItemIndex]);

   if qryTurmasAluno.Active then
   begin
      qryTurmasAluno.GotoBookmark(Bookmark);
      Result := qryTurmasAlunoSN_FINANCIAMENTO.AsLargeInt = 1;
   end;

   if qryTurmasResp.Active then
   begin
      qryTurmasResp.GotoBookmark(Bookmark);
      Result := qryTurmasRespSN_FINANCIAMENTO.AsLargeInt = 1;
   end;
end;

procedure TfrmMensalidades.tblMensalidadesBeforeEdit(DataSet: TDataSet);
begin
  if ( tblMensalidadesSituacao.Value = 0 ) or
     ( tblMensalidadesSituacao.Value = 1 ) then
  begin
    Mensagem( 'Mensalidade já baixada.', Application.Title,
              MB_OK + MB_ICONSTOP );
    Abort;
  end;
end;

procedure TfrmMensalidades.tblMensCalcFields(DataSet: TDataSet);
var
  wYear, wMonth, wDay : Word;
begin
end;

procedure TfrmMensalidades.btnPerdoarClick(Sender: TObject);
var
  strUsuario : String;
  cd_compra: Integer;
  bCancelarDDA : Boolean;
  qryDDA :  TUMZQuery;
  iCancelamento : Integer;
begin

  case tblMensalidadesSituacao.AsInteger of
    0,1,3,4,5,6,7,8,9 :
      begin
        Mensagem( 'Parcela não pode mais ser cancelada.', Application.Title,
                   MB_OK + MB_ICONSTOP );
        Exit;
      end;
  end;


  if iCancelamento > 0 then
    


  // Conferir Bloqueio de Alterações por data
  // DataAtual() é utilizada para cancelar o título.
  // Essa verificação proteje caso o usuário tenha trocado a data do servidor.

  if DM.EstaBloqueado(Dm.DataAtual(), True) then Exit;



  // Verificar se é permitido o cancelamento de títulos com data de competência/vencimento bloqueadas.
  // Como padrão o sistema deve deixar cancelar, visto que é normal cancelamentos após o faturamento
  // Sendo que a data do cancelamento é colocada como sendo a data atual.

  if DM.variavel_parametro('FinanceiroCancelaDataBloqueada') = 'N' Then Begin
     IF DM.EstaBloqueado(tblMensalidadesDataVencimento.AsDateTime, True) Then exit;
     IF DM.EstaBloqueado(tblMensalidadesdt_competencia.AsDateTime, True) Then exit;
  end;

  if not DM.UsuarioLogado.TemPermissao( 2014, npAcesso, True ) then Exit;

  strUsuario := DM.sLogin;

  if tblMensalidades.State in [dsInsert, dsEdit] then
  begin
    Exit;
  end;

  Application.CreateForm(Tfrm_Mensa_Outras_Baixas, frm_Mensa_Outras_Baixas);
  frm_Mensa_Outras_Baixas.tipoBaixa := Cancelamento;
  frm_mensa_outras_baixas.iCodigoMensalidade := tblMensalidadescd_mensalidade.AsInteger;


  if frm_mensa_outras_baixas.ShowModal = mrOk then begin

     if DM.FindMotivo( tblMensalidadesCodigoAluno.AsInteger, tblMensalidadesParcela.AsInteger, tblMensalidadesDataVencimento.AsDateTime, tblMensalidadesTurma.AsString ) then
        DM.tblMotivos.Edit
     else
	     DM.tblMotivos.Insert;

     Dm.tblMotivosMotivo.AsString := Trim(Dm.tblMotivosMotivo.AsString) + CHR(13) + frm_Mensa_Outras_Baixas.edObservacaoCancelar.Text + ' (' + DM.sLogin + ')';
     DM.tblMotivosCodigoAluno.AsInteger := tblMensalidadesCodigoAluno.AsInteger;
     DM.tblMotivosParcela.AsInteger := tblMensalidadesParcela.AsInteger;
     Dm.tblMotivosturma.AsString := tblMensalidadesTurma.AsString;
     DM.tblMotivosDataMotivo.AsString := DateToStr(tblMensalidadesDataVencimento.AsDateTime);
     DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
     DM.tblMotivos.Post;
     DM.tblMotivos.Close;

     cd_compra := ClasseComprasEntradaSaida.hasCompraFromMensalidade( tblMensalidadescd_mensalidade.AsInteger );
     if ( cd_compra > 0 ) then
     begin
        if ( Mensagem( 'Título proveniente de uma venda. Deseja registrar reposição de estoque?',
                       Application.Title, MB_YESNO + MB_ICONQUESTION, Handle ) = mrYes ) then
        begin
           ClasseComprasEntradaSaida.CancelarMovimentacao( cd_compra );
           Mensagem( 'Reposição efetuada com sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
        end;        
     end;     

     Filtra;
  end;

  FreeAndNil(frm_mensa_outras_baixas);

  DM.FindUser(strUsuario);

  
end;

procedure TfrmMensalidades.btnProtestoClick(Sender: TObject);
var
   P: TPoint;
begin
   { Alterar Situação de Matrículas }

   if not DM.UsuarioLogado.TemPermissao( 2018, npIncluir, True ) then Exit;

   P := TGeneral.GetPositionOnScreen(btnProtesto);
   pmProtestos.Popup(P.X, P.Y-btnProtesto.Height-5);
end;

procedure TfrmMensalidades.btnMotivoClick(Sender: TObject);
var
  n : Integer;
begin

  if not DM.UsuarioLogado.TemPermissao( 2014, npAlterar, True ) then Exit;

  if DM.FindMotivo( tblMensalidadesCodigoAluno.AsInteger,
                    tblMensalidadesParcela.AsInteger,
                    tblMensalidadesDataVencimento.AsDateTime,
                    tblMensalidadesTurma.AsString ) then
  begin
    Application.CreateForm( TfrmMotivos, frmMotivos );
    DM.FindUserCodigo(DM.tblMotivosAutorizadoPor.AsInteger);
    for n := 0 to frmMotivos.ComponentCount - 1 do
      if TWinControl( frmMotivos.Components[n] ).Tag = 0 then
        TWinControl( frmMotivos.Components[n] ).Enabled := False;
    frmMotivos.pnlUsuario.Caption := DM.tblUsuariosNome2.AsString;
    frmMotivos.ShowModal;
  end;
end;

procedure TfrmMensalidades.FormShow(Sender: TObject);
var
  qryOrigemDDA : TUMZQuery;
begin
   NotificarresponsveisdaMensalidade1.Visible := DM.UsuarioLogado.GetColigadaLogada.GetParametro('usar_notificacoes_mensalidades') = '1';
   N1.Visible := NotificarresponsveisdaMensalidade1.Visible;

   { Todas em maiúsculas }
   DM.CriarConsulta(qryOrigemDDA);

   qryOrigemDDA.SQL.Text := ''+
   '   SELECT                '+
   '     cd_origem           '+
   '   FROM                  '+
   '     rem_layouts         '+
   '   WHERE                 '+
   '     cd_origem = 3       ';

   qryOrigemDDA.Open;

   if qryOrigemDDA.FieldByName('cd_origem').AsInteger = 3 then
   begin
      bDDA := True;
   end
   else
   begin
      bDDA := false;
   end;

   DM.TodasMaiusculas(TForm(Sender));
   carregaRadioSelecionado();

   rBSelecionadoAntes := verificaSelecionados();
   tblMensalidades.Close;

   DM.LimpaMensaNegociacao();

   if DM.lite then
   begin
      CancelarTaxasdeExamede2poca1.Visible := false;
      VendadeProdutos1.Visible := false;
   end;

   PagarcomPagSeguro1.Visible := DM.variavel_nu_parametro('UMNucleo.pagamentos_com_pagseguro', 0) = 'S';
end;

procedure TfrmMensalidades.Gerarcrditoparaapessoa1Click(Sender: TObject);
var
   telaGerarCreditoPessoa : TfrmGerarCreditoMensalidade;
begin

   if not (DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Mensalidades.GerarCreditoPessoa', npAcesso, True)) then Exit;

   if tblMensalidades.RecNo = 0 then
   begin
      Mensagem('Selecione uma mensalidade.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   if NOT(TMensalidade.canGerarCreditoMensalidade(tblMensalidadesSituacao.AsInteger)) then
   begin
      Mensagem('Não é possível gerar créditos de mensalidades ainda não pagas.', '', MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   Application.CreateForm(TfrmGerarCreditoMensalidade, telaGerarCreditoPessoa);

   telaGerarCreditoPessoa.Mensalidade := TMensalidade.GetMensalidade(tblMensalidadescd_mensalidade.AsInteger);
   telaGerarCreditoPessoa.ShowModal();

   FreeAndNil(telaGerarCreditoPessoa);
end;

function TfrmMensalidades.GetAnoSemestreSelecionado: AnsiString;
var
   Bookmark: TBookmark;
begin
   Result := '';

   if cbTurma.Items.Count = 0 then
   begin
      Exit;
   end;

   if cbTurma.ItemIndex < 1 then
   begin
      Exit;
   end;

   if cbTurma.Items.Objects[cbTurma.ItemIndex] = nil then
   begin
      Exit;
   end;

   Bookmark := TBookmark(cbTurma.Items.Objects[cbTurma.ItemIndex]);

   if qryTurmasAluno.Active then
   begin
      qryTurmasAluno.GotoBookmark(Bookmark);
      Result := qryTurmasAlunoNR_ANOSEMESTRE.AsString;
   end;

   if qryTurmasResp.Active then
   begin
      qryTurmasResp.GotoBookmark(Bookmark);
      Result := qryTurmasRespNR_ANOSEMESTRE.AsString;
   end;
end;

function TfrmMensalidades.GetFinanciamentoSelecionado: Cardinal;
var
   Bookmark: TBookmark;
begin
   Result := 0;

   if cbTurma.Items.Count = 0 then
   begin
      Exit;
   end;

   if cbTurma.ItemIndex < 1 then
   begin
      Exit;
   end;

   if cbTurma.Items.Objects[cbTurma.ItemIndex] = nil then
   begin
      Exit;
   end;

   Bookmark := TBookmark(cbTurma.Items.Objects[cbTurma.ItemIndex]);

   if qryTurmasAluno.Active then
   begin
      qryTurmasAluno.GotoBookmark(Bookmark);
      Result := qryTurmasAlunoCD_FINANCIAMENTO.AsLargeInt;
   end;

   if qryTurmasResp.Active then
   begin
      qryTurmasResp.GotoBookmark(Bookmark);
      Result := qryTurmasRespCD_FINANCIAMENTO.AsLargeInt;
   end;
end;

procedure TfrmMensalidades.btnAlunoClick(Sender: TObject);
Var
   sqlTurmas : String;
   aba : integer;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   popMensalidades.Items[1].Checked := False;
   popMensalidades.Items[0].Checked := True;
   popMensalidades.Items[2].Checked := False;
   popMensalidades.Items[3].Checked := False;
   popMensalidades.Items[4].Checked := False;
   popMensalidades.Items[5].Checked := False;
   popMensalidades.Items[6].Checked := False;

   if Sender <> nil then // A opção de AÇÕES na planilha de matriculas, chama essa função, passando NIL, para não abrir a janela do aluno
   begin
      if DM.Get_Parametro_usuario_valor('AbaBusca', self.Name) = '' then
         aba:= Ord(afpPessoa)
      else
         aba := StrToInt(DM.Get_Parametro_usuario_valor('AbaBusca', self.Name));

      resultado_filtro := TfrmSelecionarPessoa.Filtrar([], AbasFiltroPessoa(aba));
   end;

   if (resultado_filtro.filtrado) OR (Sender = nil) then
   Begin
      if Sender <> nil then
      begin
         lngCodigoAluno := resultado_filtro.cd_pessoa;
         sNomeAluno := resultado_filtro.nm_pessoa;

        { Verifica se o aluno tem produtos pendentes }
         if DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.GerarTitulosAcumulados', npAcesso, False ) AND
            ( ClasseComprasEntradaSaida.hasAcumulado( lngCodigoAluno ) > 0 ) then
         begin
            if frmComprasGerarTitulo = nil then
               Application.CreateForm( TfrmComprasGerarTitulo, frmComprasGerarTitulo );

            frmComprasGerarTitulo.cd_pessoa := lngCodigoAluno;
            frmComprasGerarTitulo.Filtrar();

            frmComprasGerarTitulo.edCodigoPessoa.Enabled := False;
            frmComprasGerarTitulo.sbBuscaPessoa.Enabled := False;
            frmComprasGerarTitulo.btnBuscarPessoa.Enabled := False;
            frmComprasGerarTitulo.btnLimpar.Enabled := False;

            frmComprasGerarTitulo.ShowModal();

            frmComprasGerarTitulo := nil;
         end;
      end;

      { Criar o Filtro por Aluno }

      LoadTurmasAluno(lngCodigoAluno);

      if Sender <> nil then
      begin
         { Primeira Turma }
         cbTurma.ItemIndex := 1;

         //Se o parametro para pegar todas as turmas está setado
         DM.Get_Parametro_usuario(TCheckBox(cbTurma),Self.Name);

         //salva selecionado antes de fazer alguma alteração
         indiTurmasAnterior := cbTurma.ItemIndex;

         DM.Set_Parametro_usuario_valor('AbaBusca',IntToStr(Ord(resultado_filtro.Aba)), self.name);
      end else begin
         cbTurma.ItemIndex := cbTurma.Items.IndexOf(xTurma);
      end;
   End
   else Exit;

  Filtra;

  // Verificar se o aluno tem simulação de negociação. Se tiver, marcar o botão negociar;

  DM.qTemp.Close();
  DM.qTemp.SQL.Text :=
     ' SELECT COUNT(*) As QTD FROM fin_negocia_simula s ' +
     ' LEFT JOIN fin_negocia n ON (s.cd_simulacao = n.cd_simulacao AND s.cd_pessoa = n.cd_pessoa) '+
     '  WHERE n.cd_negocia is null AND s.dt_prazo >= :data ' +
     '    AND s.cd_pessoa = :cd_pessoa and s.cd_situacao = 0 ';

  DM.qTemp.ParamByName('cd_pessoa').AsInteger := tblMensalidadesCodigoAluno.AsInteger;
  //Verifica se a conexão é Oracle ou MySQL
  if DM.qTemp.Connection.Protocol = 'oracle' then //Oracle
  begin
     DM.qTemp.ParamByName('data').AsString := 'TO_DATE('+QuotedStr(FormatDateTime('yyyy-mm-dd', Dm.DataAtual()))+', ''YYYY-MM-DD'')';
  end else begin
     DM.qTemp.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual());
  end;

  DM.qTemp.Open;

  if Dm.qTemp.FieldByName('QTD').AsInteger >= 1 then begin
     btnNegociar.Font.Style := [fsBold];
  end;
  DM.qTemp.Close();
end;


procedure TfrmMensalidades.btnTurmasClick(Sender: TObject);
begin
  popMensalidades.Items[0].Checked := False;
  popMensalidades.Items[1].Checked := True;
  popMensalidades.Items[2].Checked := False;
  popMensalidades.Items[3].Checked := False;
  popMensalidades.Items[4].Checked := False;
  popMensalidades.Items[5].Checked := False;
  popMensalidades.Items[6].Checked := False;

  filtro_turma := TfrmSelecionarTurma.Filtrar([]);
  if not filtro_turma.filtrado then Exit;

  cbTurma.Items.Clear;
  cbTurma.Items.Add(filtro_turma.cd_turma);
  cbTurma.ItemIndex := 0;

  Filtra;
end;

procedure TfrmMensalidades.btnObservacoesClick(Sender: TObject);
begin
   if not tblMensalidades.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblMensalidadescodigoaluno.AsInteger,
         okFinancial)
   else
      Mensagem('Selecione uma pessoa para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure TfrmMensalidades.btnDescontoClick(Sender: TObject);
var
  strUsuario : String;
begin

   case tblMensalidadesSituacao.AsInteger of
    0,1,3,4,5,6,7,8,9 :
      begin
        Mensagem( 'Parcela já baixada, não é possível aplicar desconto.', Application.Title,
                   MB_OK + MB_ICONSTOP );
        Exit;
      end;
   end;

   if tblMensalidadesValorBruto.AsFloat = 0 then
   begin
      if (tblMensalidadesValorJuros.AsFloat > 0) or
         (tblMensalidadesvalorjuros_fixo.AsFloat > 0) or
         (tblMensalidadesValorExtra.AsFloat > 0) then
      begin
         Mensagem('O valor bruto referente a esta parcela já foi pago, '+
                  'caso ainda existe alguma pendênica referente a mesma utilize a opção de cancenlar.',
                  'Aviso',
                  MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   if not DM.UsuarioLogado.TemPermissao(2020, npIncluir, True ) then Exit;

   // Conferir Bloqueio de Alterações por data
   // DataAtual() é utilizada para cancelar o título.
   // Essa verificação proteje caso o usuário tenha trocado a data do servidor.

  if DM.EstaBloqueado(Dm.DataAtual(), True) then Exit;

  Application.CreateForm(TfrmMensalidadeAplicarDescontos, frmMensalidadeAplicarDescontos);
  frmMensalidadeAplicarDescontos.iCodigoMensalidade := tblMensalidadescd_mensalidade.AsInteger;
  TRadioButton(frmMensalidadeAplicarDescontos.rgTipoDesconto.Controls[0]).Enabled :=
   tblMensalidadesSN_FINANCIAMENTO.AsString = '0';
  frmMensalidadeAplicarDescontos.ShowModal;

  if DM.FindMotivo( tblMensalidadesCodigoAluno.AsInteger, tblMensalidadesParcela.AsInteger, tblMensalidadesDataVencimento.AsDateTime, tblMensalidadesTurma.AsString ) then
     DM.tblMotivos.Edit
  else
     DM.tblMotivos.Insert;

  Dm.tblMotivosMotivo.AsString := Trim(Dm.tblMotivosMotivo.AsString) + ' (' + DM.sLogin+ ')';
  DM.tblMotivosCodigoAluno.AsInteger := tblMensalidadesCodigoAluno.AsInteger;
  DM.tblMotivosParcela.AsInteger := tblMensalidadesParcela.AsInteger;
  Dm.tblMotivosturma.AsString := tblMensalidadesTurma.AsString;
  DM.tblMotivosDataMotivo.AsString := DateToStr(tblMensalidadesDataVencimento.AsDateTime);
  DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
  DM.tblMotivos.Post;
  DM.tblMotivos.Close;

  DM.Ativar_Matricula(tblMensalidadesCodigoAluno.AsInteger, tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger);

  Filtra;

  FreeAndNil(frmMensalidadeAplicarDescontos);

  cbTurma.SetFocus;
end;

procedure TfrmMensalidades.btnGerarClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2013, npIncluir, True) then
   begin
      if DM.variavel_parametro('PARCELA.GERADOR.NOVO') = 'S' then
      begin
         Application.CreateForm(TfMensalidadeGerar, fMensalidadeGerar);
      
         if lngCodigoAluno <> 0 then
         begin
            fMensalidadeGerar.SelecionaPessoa(lngCodigoAluno);
         end;
      
         if fMensalidadeGerar.ShowModal = mrOk then
         begin
            if tblMensalidades.Active then
            begin
               tblMensalidades.Close;
               tblMensalidades.Open;
            end;
         end;
      end
      else
      begin
         Application.CreateForm(Tfrm_mensa_gerar, frm_mensa_gerar);

         if popMensalidades.Items[0].Checked or
            popMensalidades.Items[1].Checked then
         begin
            with frm_mensa_gerar do
            begin
            
               txtAnoSemestre.Text := tblMensalidades.FieldByName('anosemestre').AsString;
               txtTurma.Text := tblMensalidades.FieldByName('turma').AsString;
               txtTurmaFixa.Text := tblMensalidades.FieldByName('turma').AsString;
               iAnoSemestreFixo:= tblMensalidades.FieldByName('anosemestre').AsInteger;
               txtCurso.Text := tblMensalidades.FieldByName('curso').AsString;

               if popMensalidades.Items[0].Checked then
               begin
                  txtCodigoAluno.Text := IntToStr(lngCodigoAluno);
                  
                  if lngCodigoAluno <> 0 then
                  begin
                     AtualizaDataVencimento(lngCodigoAluno);
                  end;
               end;

               FiltrarGerar := False;
               ShowModal;
            end;
         end;
      end;
   end;
end;

procedure TfrmMensalidades.btnAlterarClick(Sender: TObject);
Var
  sAux : String;
begin

   if DM.UsuarioLogado.TemPermissao( 2013, npAlterar, True ) then
   begin

      // Conferir Bloqueio de Alterações por data
      if DM.EstaBloqueado(tblMensalidadesDataVencimento.AsDateTime, True) then Exit;
      if DM.EstaBloqueado(tblMensalidadesdt_competencia.AsDateTime, True) then Exit;

    // Não deixar alterar mensalidades baixadas
    if not (tblMensalidadesSituacao.AsInteger in [2,10]) then Begin

       sAux := 'Atenção:' + CHR(13) + CHR(13);
       sAux := sAux + 'Não é possível alterar um título baixado.';

       Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);

       Exit;
    
    end;

    // Não deixar alterar mensalidades baixadas
    if (tblMensalidadestipoparcela.AsInteger = 1) then Begin

       sAux := 'Atenção:' + CHR(13) + CHR(13);
       sAux := sAux + 'Não é possível alterar informações de um título parcial.';

       Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);

       Exit;
    
    end;     


    Screen.Cursor := crHourGlass;

    DM.tblMensalidades.Close;
    DM.tblMensalidades.SQL.Clear;
    DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
    DM.tblMensalidades.SQL.Add( '(cd_mensalidade  = :CdMensalidade) ' );
    DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
    DM.tblMensalidades.Open;

    DM.tblMensalidades.Edit;

    Screen.Cursor := crDefault;
    frm_mensa_alterar.Caption := 'Alterar Títulos...';
    frm_mensa_alterar.tblDescontos.Filtered :=
      tblMensalidadesSN_FINANCIAMENTO.AsString = '1';
    frm_mensa_alterar.ShowModal;
    Filtra;

    tblMensalidades.Locate('CodigoAluno;Parcela;DataVencimento;Turma', VarArrayOf( [xCodigoAluno, xParcela, xDataVencimento, xTurma] ), [loCaseInsensitive] );

  end;
end;


procedure TfrmMensalidades.Protestar(Sender : TObject);
var
  strCPF : String;
  objRemessa: TRemessa;
  statusNN: TStatusNN;
  situacaoNN: TSituacaoNN;
begin

  if tblMensalidadesSituacao.AsInteger <> 2 then
  begin
    Mensagem( 'Selecione uma mensalidade pendente para utilizar este recurso.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

   if frmCobrancaObs = nil then
      Application.CreateForm(TfrmCobrancaObs, frmCobrancaObs);

   frmCobrancaObs.Title := tblMensalidadesNomeAluno.AsString;

   if frmCobrancaObs.ShowModal = mrCancel then
   begin
      frmCobrancaObs := nil;
      Exit;
   end;

   TfObservacoes.RegisterObservation(
      tblMensalidadescodigoaluno.AsInteger,
      okFinancial,
      frmCobrancaObs.PlainText,
      frmCobrancaObs.RTF);

   frmCobrancaObs := nil;

  Application.CreateForm(TfrmEmProtesto, frmEmProtesto);

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

      if statusNN <> nil then
      begin
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
    end;

    Filtra();

    Mensagem('Para visualizar as mensalidades protestadas use o botão Visualizar Prot.', 'Informação', MB_OK + MB_ICONINFORMATION)
      
  end;
end;


procedure TfrmMensalidades.btnReajustarClick(Sender: TObject);
var
   P: TPoint;
begin
   P := TGeneral.GetPositionOnScreen(btnReajustar);
   pmOutrasOpcoes.Popup(P.X, P.Y-5);
end;

procedure TfrmMensalidades.btnResponsavelClick(Sender: TObject);
Var
   sqlTurmas : String;
   resultado_filtro : TResultadoFiltroPessoa;
begin

   popMensalidades.Items[1].Checked := False;
   popMensalidades.Items[0].Checked := False;
   popMensalidades.Items[2].Checked := False;
   popMensalidades.Items[3].Checked := False;
   popMensalidades.Items[4].Checked := True;
   popMensalidades.Items[5].Checked := False;
   popMensalidades.Items[6].Checked := False;

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
       lngCodigoAluno := resultado_filtro.cd_pessoa;
       sNomeAluno := resultado_filtro.nm_pessoa;
       { Criar o Filtro por Aluno }

       LoadTurmasResp(lngCodigoAluno);

  End
  else Exit;

  Filtra;
end;

procedure TfrmMensalidades.btnVisualizarClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 2018, npAcesso, True ) then Exit;

  {
  if tblMensalidadescd_mensalidade.AsInteger = 0 then begin
    exit;
  end;
  }

  Application.CreateForm( TfrmEmProtesto, frmEmProtesto );

  frmEmProtesto.iAlunoSelecionado := tblMensalidadesCodigoAluno.AsInteger;

  frmEmProtesto.ShowModal;

  Filtra;
  
end;

procedure TfrmMensalidades.BuscaPeloCodigoBarras(CodigoBarras: String);
Var
   sNN : String;
   qyCB : TUMZQuery;
begin
    // Busca pelo código de barras

    // 1. Fazer a verificação do dígito geral do Boleto - Somente buscar se passar.

    DM.CriarConsulta(qyCB);
    qyCB.SQL.Text :=
       ' SELECT cd_banco, nn_inicio_barras, nn_tam_barras ' +
       '   FROM banco_parametro_retorno ' +
       '  WHERE cd_banco = ' + QuotedStr(copy(CodigoBarras,1,3)) + ''+
       '    AND nn_tam_barras > 0 ';
    qyCB.Open();

    if qyCB.Eof then begin
       Mensagem('Atenção' + CHR(13) + CHR(13) +
                'A busca pelo código de barras não está configurada para este banco.' + CHR(13) + CHR(13) +
                'Consulte a equipe da Uninformare.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
       FreeAndNil(qyCB);
       Exit;
    end;

    // Pesquisar o NN
    sNN := Copy(CodigoBarras, qyCB.FieldByName('nn_inicio_barras').AsInteger, qyCB.FieldByName('nn_tam_barras').AsInteger);

    if Length(sNN) < 8 then begin

       sNN := FillString(sNN, alRight, '0', 8, true);

    end;

    popMensalidades.Items[2].Checked := True;
    strNossoNumero := sNN;

    Filtra();

    if tblMensalidades.Eof then begin

       Mensagem('Atenção' + CHR(13) + CHR(13) +
                'Não foi possível localizar o número bancário.',
                'UNIMESTRE', MB_OK + MB_ICONWARNING);

    end else if tblMensalidadesSituacao.AsInteger in [2,10] then begin
       btnBaixarClick(Self);
    end;

    FreeAndNil(qyCB);
        
end;

procedure TfrmMensalidades.CancelarTaxasdeExamede2poca1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(2066, npAcesso, true) then
   begin
      if not PrincipalForm.ProcuraForm(fCancelTaxasRecorrencia) then
         Application.CreateForm(TfCancelTaxasRecorrencia, fCancelTaxasRecorrencia);
      fCancelTaxasRecorrencia.ShowModal;
   end;
end;

procedure TfrmMensalidades.popImpressoPopup(Sender: TObject);
begin

  mnuSim.Enabled := True;
  mnuNao.Enabled := True;

  if tblMensalidadesSituacao.AsInteger <> 2 then Desabilita;

  if Dm.isTrue(tblMensalidadesBloqueto.AsString) then
  begin
    mnuSim.Checked := True;
    mnuNao.Checked := False;
  end
  else
  begin
    mnuSim.Checked := False;
    mnuNao.Checked := True;
  end;

end;

procedure TfrmMensalidades.mnuSimClick(Sender: TObject);
begin
  qryUpdate.Close;
  qryUpdate.ParamByName('Bloqueto').AsString := 'S';
  qryUpdate.ParamByName('CodigoAluno').AsInteger := tblMensalidadesCodigoAluno.AsInteger;
  qryUpdate.ParamByName('Parcela').AsInteger := tblMensalidadesParcela.AsInteger;
  qryUpdate.ParamByName('DataVencimento').AsString := FormatDateTime('yyyy-mm-dd',tblMensalidadesDataVencimento.AsDateTime);
  qryUpdate.ParamByName('Turma').AsString := tblMensalidadesTurma.AsString;
  qryUpdate.ExecSQL;

  Filtra;
end;

procedure TfrmMensalidades.NotificarresponsveisdaMensalidade1Click(
  Sender: TObject);
begin
   if NOT(NotificarresponsveisdaMensalidade1.Visible) then Exit;

   if (tblMensalidadesSituacao.AsInteger = 2) then
   begin
      TMensalidadesNotificacoes.Notificar(tblMensalidadescd_mensalidade.AsInteger);
      Mensagem('A notificação foi agendada e será enviada em breve.', '', MB_OK + MB_ICONINFORMATION);
   end else begin
      Mensagem('A mensalidade deve estar em situação de pendência para notificar os responsáveis.', '', MB_OK + MB_ICONEXCLAMATION);
   end;
end;

procedure TfrmMensalidades.PagarcomPagSeguro1Click(Sender: TObject);
var
   link: String;
begin



   link :=
      trim(DM.variavel_parametro('online_endereco_local')) +
      'projetos/unimestre/financeiro/redireciona_pagseguro.php?cd_mensalidade=' +
      tblMensalidadescd_mensalidade.AsString;

   OpenURL( link );
end;

function TfrmMensalidades.mensalidadeFromCantina(
  cd_mensalidade: Integer): boolean;
const
   SQL_MOVIMENTACAO_CANTINA = 'SELECT count(cd_movimentacao) as nrRegistros FROM ctn_movimentacao_financeiro WHERE cd_mensalidade = :mensa';
   SQL_VENDA_CANTINA = 'SELECT count(cd_venda) as nrRegistros FROM ctn_vendas_financeiro WHERE cd_mensalidade = :mensa';
var
   qryCantina : TUMZQuery;
begin
   dm.CriarConsulta(qryCantina);
   qryCantina.SQL.Add(SQL_MOVIMENTACAO_CANTINA);
   qryCantina.ParamByName('mensa').AsInteger := cd_mensalidade;
   qryCantina.Open;

   if(qryCantina.FieldByName('nrRegistros').AsInteger > 0) then
   begin
      result := true;
      exit;
   end;

   qryCantina.SQL.Clear;
   qryCantina.SQL.Add(SQL_VENDA_CANTINA);
   qryCantina.ParamByName('mensa').AsInteger := cd_mensalidade;
   qryCantina.Open;

   if(qryCantina.FieldByName('nrRegistros').AsInteger > 0) then
   begin
      result := true;
      exit;
   end;

   result := false;
end;

procedure TfrmMensalidades.miCreditosVisualizarClick(Sender: TObject);
const
   SChaveAcao = 'UMFinanceiro.Mensalidades.UtilizarCreditosDisponiveis';
begin
   if not DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, SChaveAcao,
      npAcesso, True) then Exit;

   TfrmFinCreditosVisualizar.VisualizaCreditos(
      tblMensalidadescodigoaluno.AsInteger,
      tblMensalidadesNomeAluno.AsString);
end;

procedure TfrmMensalidades.mnuNaoClick(Sender: TObject);
begin
   qryUpdate.Close;
   qryUpdate.ParamByName('Bloqueto').AsString := 'N';
   qryUpdate.ParamByName('CodigoAluno').AsInteger := tblMensalidadesCodigoAluno.AsInteger;
   qryUpdate.ParamByName('Parcela').AsInteger := tblMensalidadesParcela.AsInteger;
   qryUpdate.ParamByName('DataVencimento').AsString := FormatDateTime('yyyy-mm-dd',tblMensalidadesDataVencimento.AsDateTime);
   qryUpdate.ParamByName('Turma').AsString := tblMensalidadesTurma.AsString;
   qryUpdate.ExecSQL;

   Filtra;
end;

procedure TfrmMensalidades.DefineSituacaoCobranca(const ASDescricao,
  ASHexCor: string);
begin
   pnSituacaoCobranca.Color := General.HexColorToDec(ASHexCor);
   pnSituacaoCobranca.Caption := AnsiUpperCase(ASDescricao);
end;

procedure TfrmMensalidades.Desabilita;
begin
  mnuSim.Enabled := False;
  mnuNao.Enabled := False;
end;

procedure TfrmMensalidades.Desagruparboleto1Click(Sender: TObject);
const
   STextoLog = 'Desmembramento de boleto agrupado. Mensalidade código [%d]. Alteração do nosso número de [%s] para [%s].';
   SChaveLog = '%d;%d;%d;%s;%d;%s';

   STituloInfo = 'Informação';
   SMsgNaoAgrupado = 'O título selecionado não está agrupado.';
   SMsgBoletoDesagrupado = 'O título foi desmembrado do boleto.';

   STituloQuest = 'Confirmação';
   SMsgConfirmaDesg =
      'Deseja realmente desmembrar o título selecionado do agrupamento de boletos?'#13 +
      'Os outros títulos deste boleto continuarão agrupados.'#13#13 +
      'Deseja realmente prosseguir?';

   SUpdMensalidade =
   'UPDATE MENSALIDADES SET CD_BOLETO = NULL, NOSSONUMERO = ? WHERE CD_MENSALIDADE = ?';

   SSelectAgrupados =
   'SELECT COUNT(DISTINCT CD_MENSALIDADE) TOTAL FROM MENSALIDADES WHERE NOSSONUMERO = ? GROUP BY NOSSONUMERO HAVING TOTAL > 1';
var
   S, TextoLog: string;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin

   if not (DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Mensalidades.DesagruparBoleto', npAcesso, True)) then Exit;

   tblMensalidades.DisableControls;
   
   Stmt := PrepareStatement(SSelectAgrupados);
   Stmt.SetString(1, tblMensalidadesNossoNumero.AsString);
   
   Rs := Stmt.ExecuteQueryPrepared;
   try
      if Rs.Next then
      begin
         if MessageBox(Handle, SMsgConfirmaDesg, STituloQuest,
            MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = ID_YES then
         begin
            S := DM.NovoNumero(
               tblMensalidadesDepto.AsInteger,
               tblMensalidadesTurma.AsString,
               tblMensalidadesAnoSemestre.AsInteger, 0, 0, 0,
               tblMensalidadescodigoaluno.AsInteger,
               Copy( tblMensalidadesDataVencimento.AsString, 9, 2 ),
               Copy( tblMensalidadesDataEmissao.AsString, 9, 2 )
            );

            Stmt := PrepareStatement(SUpdMensalidade);
            try
               Stmt.SetString(1, S);
               Stmt.SetInt(2, tblMensalidadescd_mensalidade.AsInteger);
               Stmt.ExecutePrepared;
            finally
               Stmt.Close;
            end;

            TextoLog := Format(STextoLog, [
               tblMensalidadescd_mensalidade.AsInteger,
               tblMensalidadesNossoNumero.AsString, S]
            );

            S := Format(SChaveLog, [
               tblMensalidadescd_mensalidade.AsInteger,
               tblMensalidadescodigoaluno.AsInteger,
               tblMensalidadesAnoSemestre.AsInteger,
               tblMensalidadesNossoNumero.AsString,
               tblMensalidadesParcela.AsInteger,
               tblMensalidadesDataVencimento.AsString]
            );

            DM.setLog(2013, 'alteracao', S, tblMensalidadescd_coligada.AsInteger, TextoLog);

            MessageBox(Handle, SMsgBoletoDesagrupado, STituloInfo,
               MB_ICONINFORMATION or MB_OK);

            tblMensalidades.Close;
            tblMensalidades.Open;
         end;
      end
      else
         MessageBox(Handle, SMsgNaoAgrupado, STituloInfo,
            MB_ICONINFORMATION or MB_OK);
   finally
      Rs.Close;
   end;
   tblMensalidades.EnableControls;
end;

procedure TfrmMensalidades.DividirTtulos1Click(Sender: TObject);
begin

   if not (DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'UMFinanceiro.Mensalidades.DividirTitulos', npAcesso, True)) then Exit;

   Application.CreateForm(TfrmMensalidadesDivisao, frmMensalidadesDivisao);

   if frmMensalidadesDivisao.ShowModal = mrOk then
   begin
      DM.Ativar_Matricula(
         tblMensalidadescodigoaluno.AsInteger,
         tblMensalidadesTurma.AsString,
         tblMensalidadesAnoSemestre.AsInteger, False, False
      );
      Filtra();
   end;
end;

procedure TfrmMensalidades.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TfrmMensalidades.LiberarJurosDesc1Click(Sender: TObject);
var
   iCodMensalidade: Integer;
begin
   //
   try
      if (not tblMensalidades.Active) or (tblMensalidades.IsEmpty()) then Exit;

      if not DM.UsuarioLogado.TemPermissao( 2058, npAcesso, True ) then Exit;

      iCodMensalidade:=tblMensalidadescd_mensalidade.AsInteger;
   
      Application.CreateForm(TfLiberarJurosDescontos, fLiberarJurosDescontos);

      DM.tblMensalidades.SQL.Text:=  ''+
         'SELECT                            '+
         '  *                               '+
         'FROM                              '+
         '  mensalidades                    '+
         'WHERE                             '+
         '  cd_mensalidade = '+IntToStr(iCodMensalidade);
   
      DM.tblMensalidades.Open;
      DM.tblMensalidades.First;
      fLiberarJurosDescontos.iJurosAntigo := DM.tblMensalidades.FieldByName('sn_liberar_juros').Value;
      fLiberarJurosDescontos.iDescAntigo  := DM.tblMensalidades.FieldByName('sn_liberar_descontos').Value;
      DM.tblMensalidades.Edit;
      fLiberarJurosDescontos.ShowModal;
   finally
      FreeAndNil(fLiberarJurosDescontos);
      if tblMensalidades.Active then begin
         tblMensalidades.Close();
         tblMensalidades.Open();
         tblMensalidades.Locate('cd_mensalidade',iCodMensalidade,[]);
      end;
   end;
end;

procedure TfrmMensalidades.LoadTurmasAluno(const Id: Integer);
const
   STurmaFmt = '%s - %s/%s';

   SSQLSelectTurmas = ''
      + '( '
      + 'SELECT DISTINCT '
      + '	m.turma CD_TURMA, '
      + '	m.anosemestre NR_ANOSEMESTRE, '
      + '   0 CD_FINANCIAMENTO, '
      + '	0 SN_FINANCIAMENTO '
      + 'FROM '
      + '	mensalidades m '
      + 'WHERE '
      + '	m.codigoaluno = :CD_PESSOA AND '
      + '	m.cd_coligada IN (%s) AND '
      + '	NOT EXISTS '
      + '	( '
      + '		SELECT '
      + '			f.CD_FINANCIAMENTO_PESSOA '
      + '		FROM '
      + '			fin_financiamento_mensalidade f '
      + '		WHERE '
      + '			m.cd_mensalidade = f.CD_MENSALIDADE '
      + '	) '
      + ') '
      + 'UNION '
      + '( '
      + 'SELECT DISTINCT '
      + '	f.DS_FINANCIAMENTO CD_TURMA, '
      + '	p.NR_ANOSEMESTRE NR_ANOSEMESTRE, '
      + '   p.CD_FINANCIAMENTO,'
      + '	1 SN_FINANCIAMENTO '
      + 'FROM '
      + '	fin_financiamento_mensalidade m '
      + '		JOIN fin_financiamento_pessoa p ON '
      + '			(m.CD_FINANCIAMENTO_PESSOA = p.CD_FINANCIAMENTO_PESSOA) '
      + '		JOIN fin_config_financiamento f ON '
      + '			(p.CD_FINANCIAMENTO = f.CD_FINANCIAMENTO) '
      + 'WHERE '
      + '	p.CD_PESSOA = :CD_PESSOA AND '
      + '	EXISTS '
      + '	( '
      + '		SELECT '
      + '			e.cd_mensalidade '
      + '		FROM '
      + '			mensalidades e '
      + '		WHERE '
      + '			m.CD_MENSALIDADE = e.cd_mensalidade AND '
      + '			e.cd_coligada IN (%s) '
      + '	) '
      + ') '
      + 'ORDER BY '
      + '	SN_FINANCIAMENTO ASC, '
      + '	NR_ANOSEMESTRE DESC, '
      + '	CD_TURMA ';
var
   L: Integer;
   AnoSemestre, Ano, Semestre, S: AnsiString;
begin
   qryTurmasAluno.Close;
   qryTurmasResp.Close;

   S := DM.UsuarioLogado.GetColigadasFilhaSelecionada;

   qryTurmasAluno.SQL.Text := Format(SSQLSelectTurmas, [S, S]);

   qryTurmasAluno.ParamByName('CD_PESSOA').AsInteger := Id;
   qryTurmasAluno.Open;

   cbTurma.Items.BeginUpdate;
   cbTurma.Items.Clear;
   cbTurma.Items.Add('Todas as turmas');

   while not qryTurmasAluno.Eof do
   begin

      S := qryTurmasAlunoCD_TURMA.AsString;
      
      if DM.UsaAnosemestre then
      begin
         AnoSemestre := qryTurmasAlunoNR_ANOSEMESTRE.AsString;
         L := Length(AnoSemestre);
         Ano := AnsiLeftStr(AnoSemestre, L - 1);
         Semestre := AnsiRightStr(AnoSemestre, 1);
         S := Format(STurmaFmt, [qryTurmasAlunoCD_TURMA.AsString, Ano, Semestre]);
      end;
      
      cbTurma.AddItem(S, qryTurmasAluno.GetBookmark);
      qryTurmasAluno.Next;
   end;

   cbTurma.Items.EndUpdate;
end;

procedure TfrmMensalidades.LoadTurmasResp(const Id: Integer);
const
   STurmaFmt = '%s - %s/%s';

   SSQLSelectTurmas = ''
      + '( '
      + 'SELECT DISTINCT '
      + '   m.turma CD_TURMA, '
      + '   m.anosemestre NR_ANOSEMESTRE, '
      + '   0 CD_FINANCIAMENTO, '
      + '   0 SN_FINANCIAMENTO '
      + 'FROM '
      + '   mensalidades m '
      + 'WHERE '
      + '   m.cd_resp = :CD_PESSOA AND '
      + '   m.cd_coligada IN (%s) AND '
      + '   NOT EXISTS '
      + '   ( '
      + '         SELECT '
      + '               f.CD_FINANCIAMENTO_PESSOA '
      + '         FROM '
      + '               fin_financiamento_mensalidade f '
      + '         WHERE '
      + '               m.cd_mensalidade = f.CD_MENSALIDADE '
      + '   ) '
      + ') '
      + 'UNION '
      + '( '
      + 'SELECT DISTINCT '
      + '   f.DS_FINANCIAMENTO CD_TURMA, '
      + '   p.NR_ANOSEMESTRE NR_ANOSEMESTRE, '
      + '   p.CD_FINANCIAMENTO, '
      + '   1 SN_FINANCIAMENTO '
      + 'FROM '
      + '   fin_financiamento_pessoa p '
      + '         JOIN fin_config_financiamento f ON '
      + '               (p.CD_FINANCIAMENTO = f.CD_FINANCIAMENTO) '
      + 'WHERE '
      + '   EXISTS '
      + '   ( '
      + '         SELECT '
      + '               e.cd_mensalidade '
      + '         FROM '
      + '               fin_financiamento_mensalidade m '
      + '                     JOIN mensalidades e ON '
      + '                           (m.CD_MENSALIDADE = e.cd_mensalidade) '
      + '         WHERE '
      + '               p.CD_FINANCIAMENTO_PESSOA = m.CD_FINANCIAMENTO_PESSOA AND '
      + '               e.cd_resp = :CD_PESSOA AND '
      + '               e.cd_coligada IN (%s) '
      + '   ) '
      + ') '
      + 'ORDER BY '
      + '   SN_FINANCIAMENTO ASC, '
      + '   NR_ANOSEMESTRE DESC, '
      + '   CD_TURMA ';
var
   L: Integer;
   AnoSemestre, Ano, Semestre, S: AnsiString;
begin
   qryTurmasAluno.Close;
   qryTurmasResp.Close;

   S := DM.UsuarioLogado.GetColigadasFilhaSelecionada;
   
   qryTurmasResp.SQL.Text := Format(SSQLSelectTurmas, [S, S]);
   qryTurmasResp.ParamByName('CD_PESSOA').AsInteger := Id;
   qryTurmasResp.Open;

   cbTurma.Items.BeginUpdate;
   cbTurma.Items.Clear;
   cbTurma.Items.Add('Todas as turmas');

   while not qryTurmasResp.Eof do
   begin
   
      S := qryTurmasRespCD_TURMA.AsString;

      if DM.UsaAnosemestre then
      begin
         AnoSemestre := qryTurmasRespNR_ANOSEMESTRE.AsString;
         L := Length(AnoSemestre);
         Ano := AnsiLeftStr(AnoSemestre, L - 1);
         Semestre := AnsiRightStr(AnoSemestre, 1);
         S := Format(STurmaFmt, [qryTurmasRespCD_TURMA.AsString, Ano, Semestre]);
      end;
      
      cbTurma.AddItem(S, qryTurmasResp.GetBookmark);
      qryTurmasResp.Next;
   end;

   cbTurma.Items.EndUpdate;
end;

procedure TfrmMensalidades.btnEstornarClick(Sender: TObject);
Var
   dblDinheiro, dblCheque: Currency;
   iCodCaixa, iCodAbertura, iCodAberturaAtual,
   cd_compra, cdLayout: integer;
   iTpConta :word;
   Movimento : TMovimento;
   ds_historico, sCodCheques, sOpCheques, sAux, sCodMensalidadeOrigem : String;
   i : Integer;
   qyAltera, qyValidaMensalidade,
   qyMensalidadesNN : TUMZQuery;
   bTemParcial : Boolean;
   objRemessa: TRemessa;
   statusNN: TStatusNN;
   situacaoNN: TSituacaoNN;
begin
   if not DM.UsuarioLogado.TemPermissao( 2015, npAcesso, True ) then Exit;
   if not validaEstornoMensalidadeCartao(tblMensalidadescd_mensalidade.AsInteger) then Exit;

   if not validaEstornoMensalidadeRetorno(tblMensalidadescd_mensalidade.AsInteger) then Exit;

   if not (tblMensalidadesSituacao.AsInteger in [0, 1]) Then Begin
      Mensagem( 'Só é possível estornar uma mensalidade paga.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
   End;

   if tblMensalidadesnr_nf.AsString <> '' then
   begin
      if not DM.UsuarioLogado.TemPermissao(DM.GetUsuarioLogado.Pessoa.Codigo, 'UMFinanceiro.PermiteEstornarComNF', npAcesso, true) then
      begin
         Exit;
      end;

      if Mensagem('O título que está sendo estornado tem uma NF gerada. Deseja continuar?', 'Aviso', MB_YESNO + MB_ICONWARNING, Handle) <> mrYes then
      begin
         Exit;         
      end;
   end;

   if Self.mensalidadeFromCantina(tblMensalidadescd_mensalidade.AsInteger) then
   begin
      Mensagem('Mensalidade gerada pelo módulo da cantina. Para realizar o estorno dessa movimentação acesse o módulo de Cantina.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      exit;
   end;
   

   //verifica impressao de recibo
   oRecibo := TFinReciboManager.Create(tblMensalidadescd_mensalidade.AsInteger);

   if not oRecibo.estornarMensalidade() then
   begin
      Exit;
   end;

   if ((tblMensalidadesSituacao.AsInteger = 0) or (tblMensalidadesSituacao.AsInteger = 1))
      and (TemChequeDepositado(tblMensalidadescd_mensalidade.AsInteger)) then
   Begin
      { Colocar o cheque como compensado }

      if Mensagem('O cheque ja foi para depósito. Deseja colocá-lo novamente EM CAIXA?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes then
      Begin

         qyTemp1.Close();
         qyTemp1.SQL.Clear();

         //Verifica se a conexão é Oracle ou MySQL
         if qyTemp1.Connection.Protocol = 'oracle' then //Oracle
         begin
            qyTemp1.SQL.Text :=
              ' MERGE INTO fin_cheques fc USING ' +
              '   (SELECT ' +
              '       fc.cd_cheque ' +
              '   FROM ' +
              '       fin_cheques fc, ' +
              '       fin_cheques_mensalidades fcm ' +
              '   WHERE ' +
              '       fc.cd_cheque = fcm.cd_cheque AND ' +
              '       fcm.cd_mensalidade = ' + IntToStr( tblMensalidadescd_mensalidade.AsInteger ) + ' ) fc2 ON (fc.cd_cheque = fc2.cd_cheque) ' +
              ' WHEN MATCHED THEN ' +
              '   UPDATE SET fc.cd_situacao = 0 ';
            qyTemp1.ExecSQL();
         end
         else
         begin
            qyTemp1.SQL.Text :=
              ' UPDATE fin_cheques fc, fin_cheques_mensalidades fcm  ' +
              ' SET fc.cd_situacao = 0 ' +
              ' WHERE  ' +
              '    fc.cd_cheque = fcm.cd_cheque AND ' +
              '    fcm.cd_mensalidade = ' + IntToStr( tblMensalidadescd_mensalidade.AsInteger );
            qyTemp1.ExecSQL();
         end;

         Filtra;

         Exit;
      end;
   end;

  // Verificar Bloqueio por Pagamento

  if DM.EstaBloqueado(tblMensalidadesDataPagamento.AsDateTime, True) then Exit;

  // Selecionar o caixa que foi baixado e o código de Abertura
  // Selecionar o registro de baixa e não de quitação de cheque

  qyTemp2.Close;
  qyTemp2.SQL.Clear;
  qyTemp2.SQL.Add('SELECT * FROM fin_mov_tesouraria WHERE nr_estorno = 0 and cd_mensalidade = :CdMensalidade' );
  qyTemp2.SQL.Add('ORDER BY cd_movimento_te ');
  qyTemp2.ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
  qyTemp2.Open;

  // Parcela entrou no caixa?

   if qyTemp2.Eof then
   begin
      Mensagem( 'Não é possível estornar uma parcela que não entrou no caixa.', Application.Title, MB_OK + MB_ICONSTOP );
      Screen.Cursor := crDefault;
      Exit;
   end;


  // Verificar se todos os lançamentos com este cd_mensalidade estão em caixas abertos

  qyTemp2.First();

  while not qyTemp2.Eof do begin

      // Códigos dos caixas que a parcela foi baixada
      iCodCaixa := qyTemp2.FieldByName('cd_caixa').AsInteger;
      iCodAbertura := qyTemp2.FieldByName('cd_abertura_caixa').AsInteger;

      movimento := TMovimento.Create;

      movimento.Coligada := dm.getColigadaByTurma( tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger);

      if not Movimento.VerificaContaAtiva(iCodCaixa, iTpConta, iCodAberturaAtual ) then begin
        Mensagem( 'Não é possível estornar mensalidade. A conta não está mais ativa.', Application.Title, MB_OK + MB_ICONSTOP );
        Screen.Cursor := crDefault;
        Exit;
      end;

      if (iTpConta = 3) AND (iCodAberturaAtual = 0) then begin
        Mensagem( 'Não é possível estornar mensalidade. O caixa está fechado.', Application.Title, MB_OK + MB_ICONSTOP );
        Screen.Cursor := crDefault;
        Exit;
      end;

      if (iTpConta = 3) AND (iCodAberturaAtual <> iCodAbertura) then begin
        if Mensagem( 'Atenção: O caixa que a parcela foi baixada ja foi fechado. Se você estornar essa parcela, será feito um lançamento de débito no caixa aberto atualmente. Deseja continuar.', Application.Title, MB_YESNOCANCEL + MB_ICONSTOP ) <> mrYES then begin
           Screen.Cursor := crDefault;
           Exit;
        end;
      end;

      movimento.free;

      // Verificar se tem alguma parcela parcial PAGA abaixo deste cd_mensalidade;

      // Verifica se possui código de mensalidade origem
      // Se não possuir utiliza o código da mensalidade
      if Self.tblMensalidadescd_mensalidade_origem.IsNull then
      begin
         sCodMensalidadeOrigem := Self.tblMensalidadescd_mensalidade.AsString;
      end else
      begin
         sCodMensalidadeOrigem := Self.tblMensalidadescd_mensalidade_origem.AsString;
      end;

      qyTemp1.Close();
      qyTemp1.SQL.Text :=
        ' SELECT count(*) AS resultado FROM mensalidades m ' +
        '  WHERE m.cd_mensalidade_origem = ' + sCodMensalidadeOrigem +
        '    AND m.cd_mensalidade > ' + tblMensalidadescd_mensalidade.AsString +
        '    AND m.situacao in (0,1) ';

      qyTemp1.Open();

      bTemParcial := qyTemp1.FieldByName('resultado').AsInteger > 0;

      if bTemParcial then begin

         sAux := 'Atenção:' + CHR(13) + CHR(13);
         sAux := 'Existe um título parcial desta parcela baixado. Você deverá estornar primeiro esta parcial.';

         Mensagem(sAux, 'UNIMESTRE', MB_OK + MB_ICONWARNING);

         Exit;

      end;

      qyTemp2.Next();

  end;

  if Mensagem( 'Confirma o estorno da parcela selecionada ?', Application.Title, MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO then Exit;

    // Verificar se tem que autenticar

  if (DM.variavel_parametro('financeiro_autenticacao_estorno') <> '') then begin

     TfrmMensalidades.AutenticarMensalidade(DM.variavel_parametro('financeiro_autenticacao_estorno'));

  end;

  qyTemp2.First;
  while not qyTemp2.Eof do begin

        // Códigos dos caixas que a parcela foi baixada
      iCodCaixa := qyTemp2.FieldByName('cd_caixa').AsInteger;
      iCodAbertura := qyTemp2.FieldByName('cd_abertura_caixa').AsInteger;

      Screen.Cursor := crHourGlass;

      dblDinheiro := qyTemp2.FieldByName('vl_dinheiro').AsCurrency;
      dblCheque   := qyTemp2.FieldByName('vl_cheque').AsCurrency;
      ds_historico := qyTemp2.FieldByNAme('ds_movimento').AsString;

      movimento := TMovimento.Create;

      movimento.Historico := 'ESTORNO ' + qyTemp2.FieldByName('ds_movimento').AsString;

      Movimento.ValorMovimento := qyTemp2.FieldByName('vl_movimento').AsCurrency;

      Movimento.ValorEmDinheiro := qyTemp2.FieldByName('vl_dinheiro').AsCurrency;
      Movimento.ValorEmCheque   := qyTemp2.FieldByName('vl_cheque').AsCurrency;
      Movimento.Mensalidade     := qyTemp2.FieldByName('cd_mensalidade').AsInteger;

      if qyTemp2.FieldByName('tp_entrada_saida').AsInteger = 1 then begin
         Movimento.EntradaSaida    := 2;
      end else begin
         Movimento.EntradaSaida    := 1;
      end;

      Movimento.CodAcao := 6 ; // Acão Padrão
      Movimento.NumeroDocumento := qyTemp2.FieldByName('nr_documento').AsString;
      Movimento.DataLiberacao := Date;
      Movimento.Origem := 1; // Contas a Receber;

      // Gravar a mesma data de movimento do lançamento original - resolve os problemas de saldos dos relatórios.
      Movimento.DataMovimento := qyTemp2.FieldByName('dt_movimento').AsDateTime;

      Movimento.Coligada := qyTemp2.FieldByName('cd_coligada').AsInteger;
      Movimento.FormaDePagamento := qyTemp2.FieldByName('cd_forma_pgto').AsInteger;

      Movimento.RegistrarMovimentacaoTe( iCodCaixa );

      // Registrar o Estorno

         DM.CriarConsulta(qyAltera);
         qyAltera.SQL.Text :=
           ' SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria ';
         qyAltera.Open();

         i := qyAltera.FieldByName('ultimo').AsInteger + 1;

         qyAltera.Close();

         qyAltera.SQL.Text :=
            ' UPDATE fin_mov_tesouraria      ' +
            ' SET nr_estorno = ' + IntToStr(i) +
            ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
            ' WHERE cd_movimento_te in (' + IntToStr(qyTemp2.FieldByName('cd_movimento_te').AsInteger) + ', ' + IntToStr(Movimento.CodigoMovimento) + ') AND cd_coligada = ' + qyTemp2.FieldByName('cd_coligada').AsString;
         qyAltera.ExecSQL();

      // Estornar a Apropriação na tesouraria

      qyAltera.SQL.Text := ' DELETE FROM fin_apropria_te WHERE cd_movimento_te = ' + qyTemp2.FieldByName('cd_movimento_te').AsString +
       ' AND cd_coligada = ' + qyTemp2.FieldByName('cd_coligada').AsString;
      qyAltera.ExecSQL();

      if ( frmEstorno = nil ) then
        Application.CreateForm(TfrmEstorno , frmEstorno);

      if( frmEstorno.motivoEstorno =  '')then begin
        frmEstorno.ShowModal;
      end;


      Movimento.registraEstorno(
        qyTemp2.FieldByName('cd_movimento_te').AsInteger,
        qyTemp2.FieldByName('cd_caixa').AsInteger,
        tblMensalidadescd_mensalidade.AsInteger,
        tblMensalidadescd_coligada.AsInteger,
        dm.iCdPessoaLogado,
        tblMensalidadesDataPagamento.AsDateTime,
        frmEstorno.motivoEstorno,
        0
      );




      Movimento.free;

     qyTemp2.Next();
  end;

  frmEstorno.motivoEstorno := '';
  frmEstorno.meMotivo.Text := '';


  // Fim do registro de Estorno

  DM.tblMensalidades.Close;
  DM.tblMensalidades.SQL.Clear;
  DM.tblMensalidades.SQL.Add( 'select * from Mensalidades where' );
  DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade)' );
  DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
  DM.tblMensalidades.Open;

  DM.tblMensalidades.Edit;
  DM.tblMensalidadesDataPagamento.AsString := '';
  DM.tblMensalidadesSituacao.AsInteger := 2;
  DM.tblMensalidadesValorPago.Value := 0;
  Dm.tblMensalidadesdt_credito.AsString := '';
  DM.tblMensalidadesIndiceCorrecao.Value := 0;

  // Voltar os Juros anteriores
  DM.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesvalorjuros_fixo.AsCurrency;
  DM.tblMensalidadesValorDesconto.AsCurrency := Dm.tblMensalidadesvalordesconto_fixo.AsCurrency;
  
  // Limpar o número do talão de depósito
  DM.tblMensalidadesds_deposito.AsString := '';

  DM.tblMensalidades.Post;

  // Estornar o lançamento no Movimento do Contas a Receber
  qyTemp2.Close;
  qyTemp2.SQL.Clear;

  //Verifica se a conexão é Oracle ou MySQL
  if qyTemp2.Connection.Protocol = 'oracle' then //Oracle
  begin
     qyTemp2.SQL.Add(
        ' DELETE FROM fin_mov_cr '  +
        '  WHERE cd_mensalidade = :CdMensalidade ' +
        '  AND COALESCE(cd_mensalidade_origem, cd_mensalidade) = :cd_mensalidade_origem ' +
        '  AND cd_coligada = :CdColigada ' +
        '  AND sn_desc_condicional = 0 ' +
        '  AND NR_SEQUENCIA = (SELECT MAX(NR_SEQUENCIA) FROM FIN_MOV_CR WHERE CD_MENSALIDADE = :CdMensalidade AND CD_COLIGADA = :CdColigada) '
      );
  end else begin
     qyTemp2.SQL.Add(
        ' DELETE FROM fin_mov_cr '  +
        '  WHERE cd_mensalidade = :CdMensalidade ' +
        '  AND COALESCE(cd_mensalidade_origem, cd_mensalidade) = :cd_mensalidade_origem ' +
        '  AND cd_coligada = :CdColigada ' +
        '  AND sn_desc_condicional = 0 ' +
        '  ORDER BY nr_sequencia DESC LIMIT 1 '
      );
  end;
  qyTemp2.ParamByName('CdMensalidade').AsString := sCodMensalidadeOrigem;
  qyTemp2.ParamByName('cd_mensalidade_origem').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
  qyTemp2.ParamByName('CdColigada').AsInteger := tblMensalidadescd_coligada.AsInteger;
  qyTemp2.ExecSQL();

  Screen.Cursor := crDefault;

  DM.tblMensalidades.Close();

  // Efetua o estorno das ações de movimento de desconto condicional do título
  DM.estornarAcoesMovimentoDescCondicional(tblMensalidadescd_mensalidade.AsInteger);

  // Excluir as parcial criadas pela baixa
  qyTemp1.Close();
  qyTemp1.SQL.Text :=
    ' DELETE FROM mensalidades ' +
    '  WHERE cd_mensalidade_origem = ' + sCodMensalidadeOrigem +
    '    AND cd_mensalidade > ' + tblMensalidadescd_mensalidade.AsString +
    '    AND situacao not in (0,1) ';

  qyTemp1.ExecSQL();

  // Estornar as compras da Parcela, não é estorno e sim uma permissão para deixar reimprimir
  cd_compra := ClasseComprasEntradaSaida.hasCompraFromMensalidade( tblMensalidadescd_mensalidade.AsInteger );
  if ( cd_compra > 0 ) then
  begin
   	  ClasseComprasEntradaSaida.ZeraImpressao( tblMensalidadescd_mensalidade.AsInteger );
      if ( Mensagem(
            'Título proveniente de uma venda. Deseja registrar reposição de estoque?',
            Application.Title,
            MB_YESNO + MB_ICONQUESTION, Handle
          ) = mrYes
      )
      then
      begin        
        ClasseComprasEntradaSaida.CancelarMovimentacao( cd_compra );
        Mensagem(
          'Reposição efetuada com sucesso!',
          Application.Title,
          MB_OK + MB_ICONINFORMATION, Handle
        );
      end;
  end;

  if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
  begin

    // cria o objeto de remessa
    objRemessa := TRemessa.Create;

    // Verifica o status atual do NN
    statusNN := objRemessa.getStatusNossoNumero(tblMensalidadesNossoNumero.AsString);

    // Busca a situação do nosso número
    situacaoNN := snnNone;
    if statusNN <> nil then
    begin
      situacaoNN := statusNN.getTpSituacao();
    end;

    // Se o nosso numero não estiver nem registrado nem exportado
    if (situacaoNN = snnExportado) or (situacaoNN = snnRegistrado) then
    begin

      DM.CriarConsulta(qyMensalidadesNN);

      // SQL para checar se existe algum título pendente que está vinculado ao NN
      qyMensalidadesNN.Close;
      qyMensalidadesNN.SQL.Text :=
        ' SELECT '+
        '	    CASE WHEN COUNT(m.cd_mensalidade) > 0 THEN 1 ELSE 0 END sn_titulos_baixados '+
        ' FROM '+
        '   	rem_status rs '+
        '	    INNER JOIN mensalidades m ON ( '+
        '   			m.nossonumero = rs.nr_nossonumero AND '+
        '         m.situacao IN (0, 1) '+ // Baixa parcial ou OK
        '   	) '+
        ' WHERE '+
        '   	rs.nr_nossonumero = :nr_nossonumero ';

      qyMensalidadesNN.ParamByName('nr_nossonumero').AsString := tblMensalidadesNossoNumero.AsString;
      qyMensalidadesNN.Open();

      // Verifica se todos os títulos vinculados ao NN foram estornados
      if qyMensalidadesNN.FieldByName('sn_titulos_baixados').AsInteger = 0 then
      begin

        // Busca o layout do caixa da mensalidade
        cdLayout := objRemessa.getLayoutConta(tblMensalidadescd_caixa.AsInteger);

        // Caso sim, remove o pedido de baixa da fila, se ele já não foi enviado nos arquivos
        objRemessa.ignorarPedidoBaixaNaoEnviado(tblMensalidadesNossoNumero.AsString, cdLayout);

      end;

    end;
    
  end;

  Mensagem( 'Parcela estornada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
  // Perguntar sobre a remoção dos Cheques

   qyTemp1.Close();
   qyTemp1.SQL.Clear();
   qyTemp1.SQL.Text :=
      ' SELECT fcm.* FROM fin_cheques fc, fin_cheques_mensalidades fcm  ' +
      ' WHERE  ' +
      '    fc.cd_cheque = fcm.cd_cheque AND ' +
      '    fcm.cd_mensalidade = ' + tblMensalidadescd_mensalidade.AsString;
   qyTemp1.Open();

   if (not qyTemp1.EOF ) then begin

      if Mensagem('A mensalidade estornada foi baixada com cheque. Deseja excluí-lo do controle de cheques?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = mrYES
      then begin

         qyTemp1.First;

         sCodCheques := '';
         sOpCheques := '';

         while not qyTemp1.Eof do begin

              sCodCheques := sCodCheques + sOpCheques + qyTemp1.FieldByName('cd_cheque').AsString;
              sOpCheques := ', ';

              qyTemp1.Next();

         end;

         qyTemp1.Close();
         qyTemp1.SQL.Clear();
         qyTemp1.SQL.Text :=
           ' DELETE FROM fin_cheques_mensalidades ' +
           ' WHERE  ' +
           '    cd_mensalidade = ' + tblMensalidadescd_mensalidade.AsString;
         qyTemp1.ExecSQL();

         qyTemp1.Close();
         qyTemp1.SQL.Clear();
         qyTemp1.SQL.Text :=
           ' DELETE FROM fin_cheques ' +
           ' WHERE  ' +
           '    cd_cheque IN (' + sCodCheques + ') ';
         qyTemp1.ExecSQL();

         Mensagem( 'Informações de cheques excluidos com sucesso.', Application.Title, MB_OK + MB_ICONEXCLAMATION );

      end;

   end;

   Filtra;
end;


procedure TfrmMensalidades.btnOutrasClick(Sender: TObject);
begin

  try

    Application.CreateForm(TfrmNossoNumero, frmNossoNumero);

    frmNossoNumero.pcBusca.ActivePageIndex := TSpeedButton(Sender).Tag;

    if frmNossoNumero.ShowModal = mrCancel then Exit;

    popMensalidades.Items[0].Checked := False;
    popMensalidades.Items[1].Checked := False;
    popMensalidades.Items[2].Checked := False;
    popMensalidades.Items[3].Checked := False;
    popMensalidades.Items[4].Checked := False;
    popMensalidades.Items[5].Checked := False;
    popMensalidades.Items[6].Checked := False;

    CASE frmNossoNumero.pcBusca.ActivePageIndex of
       0 : begin
             popMensalidades.Items[2].Checked := True;
             strNossoNumero := frmNossoNumero.txtNossoNumero.Text;
             Filtra();
           end;
       1 : begin
             popMensalidades.Items[5].Checked := True;
             strNossoNumero := frmNossoNumero.txtTalaoDeposito.Text;
             Filtra();
           end;
       2 : begin
             BuscaPeloCodigoBarras(frmNossoNumero.txtCodigoBarras.Text);
           end;
    end;


  finally

    FreeAndNil(frmNossoNumero);
    
  end;

end;

procedure TfrmMensalidades.EEHc;
begin
   PlaySound(PChar('hc'), 0, SND_RESOURCE);
end;

procedure TfrmMensalidades.ExcluirParcela;
const
   SCaptionWarning = 'Atenção';
   SCaptionConfirm = 'Confirmação';
   SMsgParcelaBaixada = ''
      + 'Não é possível excluir uma parcela baixada.'#13
      + 'Se deseja realmente excluir esta parcela, efetue primeiro seu estorno.';
   SMsgNFGerada = ''
      + 'Não é possível excluir esta parcela, '
      + 'pois ela possui uma nota um nota fiscal emitida.';
   SMsgParcelaNegociada = ''
      + 'Não é possível excluir uma parcela de negociação.';
   SMsgRemessaRegistrada = ''
      + 'Não é possível excluir o título pois o nosso número foi exportado '
      + 'para envio na remessa ou já está registrado.'#13'Sugerimos nesse '
      + 'caso utilizar a opção de CANCELAMENTO ao invés da exclusão.'#13
      + 'Quando o status do nosso número for resolvido, então o título '
      + 'poderá ser removido.';
   SMsgBloquetoGerado = ''
      + 'A parcela que você está tentando excluir já possui boleto impresso.'
      + #13'Deseja realmente confirmar a exclusão?';
   SMsgParcial = ''
      + 'Você está tentando excluir uma parcela PARCIAL.'#13'Aconselhamos '
      + 'o CANCELAMENO desta parcela ao invés da sua exclusão.'#13'Deseja '
      + 'excluir mesmo assim?';
   SMsgParcialComValor = ''
      + 'Não é possível excluir um título parcial com valor bruto.'#13
      + 'Utilize a opção de CANCELAMENTO.';
   SMsgConfirmar = ''
      + 'Deseja realmente excluir definitivamente o título selecionado?';
   SLogFmt = '%.10d;%d;%s;%d;%s;';
   SObsLog = 'Parcela Excluída (NN = %s)';
   SDateFmt = 'dd/mm/yyyy';
Var
   UserChoice, ColigadaId: Integer;
   S, Obs: AnsiString;
   Remessa: TRemessa;
   StatusNN: TStatusNN;
   SituacaoNN: TSituacaoNN;
   DataVencto, DataCompt: TDateTime;
   Continuar, Parcial: Boolean;  
begin
   Continuar := DM.UsuarioLogado.TemPermissao(2013, npExcluir, True);

   if Continuar then
   begin
      Continuar := not (tblMensalidadesSituacao.AsInteger in [0, 1]);

      if not Continuar then
      begin
         MessageBox(Handle, SMsgParcelaBaixada, SCaptionWarning,
            MB_OK or MB_ICONWARNING);
      end;
   end;

   if Continuar then
   begin
      Continuar := tblMensalidadessn_nfe_gerada.AsInteger <> 1;

      if not Continuar then
      begin
         MessageBox(Handle, SMsgNFGerada, SCaptionWarning,
            MB_OK or MB_ICONWARNING);
      end;
   end;

   if Continuar then
   begin
      DataVencto := tblMensalidadesDataVencimento.AsDateTime;
      Continuar := not DM.EstaBloqueado(DataVencto, True);
   end;

   if Continuar then
   begin
      DataCompt := tblMensalidadesdt_competencia.AsDateTime;
      Continuar := not DM.EstaBloqueado(DataCompt, True);
   end;

   if Continuar then
   begin
      S := DM.variavel_parametro('financeiro_bloquear_competencia');
      Continuar := (tblMensalidadestipoparcela.AsInteger <> 4) or (S <> 'S');

      if not Continuar then
      begin
         MessageBox(Handle, SMsgParcelaNegociada, SCaptionWarning,
            MB_OK or MB_ICONWARNING);
      end;
   end;

   if Continuar then
   begin
      S := DM.variavel_parametro('sn_processo_remessa_novo');

      if S = '1' then
      begin

         SituacaoNN := snnNone;
         S := tblMensalidadesNossoNumero.AsString;
         
         Remessa := TRemessa.Create;
         try
            StatusNN := Remessa.getStatusNossoNumero(S);
            try
               if StatusNN <> nil then
               begin
                  SituacaoNN := StatusNN.getTpSituacao;
               end;

            finally
               StatusNN.Free;
            end;
               
         finally
            Remessa.Free;
         end;

         Continuar := not (SituacaoNN in [snnRegistrado, snnExportado]);

         if not Continuar then
         begin
            MessageBox(Handle, SMsgRemessaRegistrada, SCaptionWarning,
               MB_OK or MB_ICONWARNING);
         end;
      end;
   end;

   if Continuar then
   begin
      Continuar := tblMensalidadesBloqueto.AsString <> 'S';

      if not Continuar then
      begin
         UserChoice := MessageBox(Handle, SMsgBloquetoGerado,
            SCaptionConfirm, MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);

         Continuar := UserChoice = ID_YES;
      end;
   end;

   if Continuar then
   begin
      Parcial :=
         (not tblMensalidadescd_mensalidade_origem.IsNull) and
         (
            tblMensalidadescd_mensalidade.AsInteger <>
            tblMensalidadescd_mensalidade_origem.AsInteger
         );

      if not Parcial then
      begin
         UserChoice := MessageBox(Handle, SMsgConfirmar, SCaptionConfirm,
            MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);
         Continuar := UserChoice = ID_YES;
      end;

      if Parcial then
      begin
         if tblMensalidadesValorBruto.AsCurrency > 0 then
         begin
            Continuar := False;

            MessageBox(Handle, SMsgParcialComValor, SCaptionWarning,
               MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2)
         end;

         if tblMensalidadesValorBruto.AsCurrency <= 0 then
         begin
            UserChoice := MessageBox(Handle, SMsgParcial, SCaptionConfirm,
               MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2);
            Continuar := UserChoice = ID_YES;
         end;
      end;
         
   end;

   if Continuar then
   begin
      if GetKeyState(VK_CONTROL) < 0 then EEHc;

      S := Format(SLogFmt, [
         tblMensalidadescodigoaluno.AsInteger,
         tblMensalidadesAnoSemestre.AsInteger,
         tblMensalidadesTurma.AsString,
         tblMensalidadesParcela.AsInteger,
         FormatDateTime(SDateFmt, tblMensalidadesDataVencimento.AsDateTime)]);
      ColigadaId := DM.getColigadaByTurma(
         tblMensalidadesTurma.AsString,
         tblMensalidadesAnoSemestre.AsInteger);
      Obs := Format(SObsLog, [tblMensalidadesNossoNumero.AsString]);
      DM.setLog(2013, 'Exclusao', S, ColigadaId, Obs);

      tblMensalidades.Delete;
   end;
      
end;

procedure TfrmMensalidades.radPagosKeyPress(Sender: TObject;
  var Key: Char);
begin
  grd.SetFocus;
end;

procedure TfrmMensalidades.SaldodaCantina1Click(Sender: TObject);
begin
   if(tblMensalidadescodigoaluno.AsString = '') then
   begin
      Mensagem('Filtre um aluno.', '', MB_OK + MB_ICONINFORMATION, Handle);
      exit;
   end;

   if not PrincipalForm.ProcuraForm(formSaldoCantina) then
   begin
      Application.CreateForm(TformSaldoCantina, formSaldoCantina);
   end;
   
   formSaldoCantina.cd_pessoa := tblMensalidadescodigoaluno.AsInteger;
   formSaldoCantina.ShowModal;
end;

procedure TfrmMensalidades.FormDestroy(Sender: TObject);
const
   SSettingKeyFmt = '%s.%s.IndexFieldNames';
var
   S: AnsiString;
begin
   S := Format(SSettingKeyFmt, [Name, tblMensalidades.Name]);
   DM.SetUserSetting(S, tblMensalidades.IndexFieldNames, 'UMFinanceiro');

  FreeAndNil(qyTemp1);
  FreeAndNil(qyTemp2);
  
  frmMensalidades := nil;
end;


procedure TfrmMensalidades.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmMensalidades.cbTurmaChange(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmMensalidades.btnChequeClick(Sender: TObject);
var filtro, op : string;
begin
  // Pesquisa por Cheque!
  popMensalidades.Items[0].Checked := False;
  popMensalidades.Items[1].Checked := False;
  popMensalidades.Items[2].Checked := False;
  popMensalidades.Items[3].Checked := True;
  popMensalidades.Items[4].Checked := False;
  popMensalidades.Items[5].Checked := False;
  popMensalidades.Items[6].Checked := False;

  try

    Application.CreateForm(TfrmProcuraCheque, frmProcuraCheque);

    if frmProcuraCheque.ShowModal = mrCancel then Exit;

    strCheque_Banco   := frmProcuraCheque.txtCheque_Banco.Text;
    strCheque_Agencia := frmProcuraCheque.txtCheque_Agencia.Text;
    strCheque_nro     := frmProcuraCheque.txtCheque_nro.Text;
    strCheque_cc      := frmProcuraCheque.txtCheque_CC.Text;
    strCheque_Data    := frmProcuraCheque.txtCheque_Data.Text;
    

  finally
    FreeAndNil(frmProcuraCheque);
  end;

  filtra();

end;

function TfrmMensalidades.getMensalidadesAgrupadas(CodigoMensalidade,
  CodigoAluno: Integer): String;
const
   SQL_MENSALIDADES_AGRUPADAS = 'SELECT '+
         'GROUP_CONCAT( '+
            'm.cd_mensalidade SEPARATOR '', '' '+
         ') AS mensalidades '+
      'FROM '+
        'mensalidades m '+
      'WHERE '+
         'm.datapagamento = ( '+
            'SELECT '+
               'me.datapagamento '+
            'FROM '+
              'mensalidades AS me '+
            'WHERE '+
               'me.cd_mensalidade = :cd_mensalidade '+
         ') '+
      'AND m.codigoaluno = :codigoaluno '+
      'GROUP BY '+
         'm.datapagamento';
var
   qyMensalidadesAgrupadas: TUMZQuery;
begin
   DM.CriarConsulta(qyMensalidadesAgrupadas);

   qyMensalidadesAgrupadas.SQL.Text := SQL_MENSALIDADES_AGRUPADAS;

   qyMensalidadesAgrupadas.ParamByName('cd_mensalidade').AsInteger :=
      CodigoMensalidade;

   qyMensalidadesAgrupadas.ParamByName('codigoaluno').AsInteger :=
      CodigoAluno;

   qyMensalidadesAgrupadas.Open;

   Result := qyMensalidadesAgrupadas.FieldByName('mensalidades').AsString;
end;

function TfrmMensalidades.GetTurmaSelecionada: AnsiString;
var
   Bookmark: TBookmark;
begin
   Result := '';

   if cbTurma.Items.Count = 0 then
   begin
      Exit;
   end;

   if cbTurma.ItemIndex < 1 then
   begin
      Exit;
   end;

   if cbTurma.Items.Objects[cbTurma.ItemIndex] = nil then
   begin
      Exit;
   end;

   Bookmark := TBookmark(cbTurma.Items.Objects[cbTurma.ItemIndex]);

   if qryTurmasAluno.Active then
   begin
      qryTurmasAluno.GotoBookmark(Bookmark);
      Result := qryTurmasAlunoCD_TURMA.AsString;
   end;

   if qryTurmasResp.Active then
   begin
      qryTurmasResp.GotoBookmark(Bookmark);
      Result := qryTurmasRespCD_TURMA.AsString;
   end;
end;

procedure TfrmMensalidades.grdDblClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMensaInformacoes, frmMensaInformacoes);
  frmMensaInformacoes.ShowModal;
end;

procedure TfrmMensalidades.grdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if NOT(gdSelected IN State) then
   begin
      TGeneral.AlterarCorCelula(TDBGrid(TCustomDBGrid(grd)), Rect, DataCol, Column, State, TGeneral.ColorFromHTML(tblMensalidadesds_cor_background.AsString));
      TGeneral.AlterarCorFonteCelula(TDBGrid(TCustomDBGrid(grd)), Rect, DataCol, Column, State, TGeneral.ColorFromHTML(tblMensalidadesds_cor_fonte.AsString));
   end;
end;

procedure TfrmMensalidades.AlterarResponsveldoTtulo1Click(Sender: TObject);
const
   STitleSearch = 'SELECIONE UM NOVO RESPONSÁVEL PARA O TÍTULO';
   SQuestion = 'Atenção!' + #13 + #13 + 'Você tem certeza que deseja alterar ' +
      'o responsável da parcela selecionada para: [nm_pessoa]?';
   SObsLog = 'Alterado o responsável financeiro do título %d de %d para %d. ' +
      'NN antigo: [%s], NN novo: [%s]';
var
   ObsLog: string;
   ResponsavelAnt: Integer;
   resultado_filtro : TResultadoFiltroPessoa;
begin
   // Chama a mostra a tela de seleção
   // de pessoas para o usuário selecionar
   // o novo responsável financeiro do título
   resultado_filtro := TfrmSelecionarPessoa.FiltrarConfirmacao(STitleSearch, SQuestion, []);

   if not resultado_filtro.filtrado then Exit;

   // Guarda o código do atual responsável financeiro
   ResponsavelAnt := tblMensalidadescd_resp.AsInteger;
            
   // Altera o responsável da parcela selecionada
   // e gera um novo nosso número para o título
            
   qryUpdateResp.ParamByName('CD_RESP').AsInteger := resultado_filtro.cd_pessoa;
   qryUpdateResp.ParamByName('CD_MENSALIDADE').AsInteger :=
      tblMensalidadescd_mensalidade.AsInteger;

   // Se NÃO for o novo processo de remessa configurado
   qryUpdateResp.ParamByName('NOSSONUMERO').AsString := tblMensalidadesNossoNumero.AsString;
   if DM.variavel_parametro('sn_processo_remessa_novo') <> '1' then
   begin      
     qryUpdateResp.ParamByName('NOSSONUMERO').AsString :=
        DM.NovoNumero(tblMensalidadesDepto.AsInteger,
           tblMensalidadesTurma.AsString,
           tblMensalidadesAnoSemestre.AsInteger, 0, tblMensalidadescd_caixa.AsInteger, tblMensalidadescd_coligada.AsInteger,
           tblMensalidadesCodigoAluno.AsInteger,
           Copy( tblMensalidadesDataVencimento.AsString, 9, 2 ),
           Copy( tblMensalidadesDataEmissao.AsString, 9, 2 ));
   end;
   
   qryUpdateResp.ExecSQL;

   // Se NÃO for o novo processo de remessa configurado
   if DM.variavel_parametro('sn_processo_remessa_novo') <> '1' then
   begin         
     // Exclui o boleto vinculado à parcela
     qryDeleteBoleto.ParamByName('CD_BOLETO').AsInteger :=
        tblMensalidadescd_boleto.AsInteger;
     qryDeleteBoleto.ExecSQL;
   end;

   // Formata o texto do log
   ObsLog := Format(SObsLog, [tblMensalidadescd_mensalidade.AsInteger,
      ResponsavelAnt, resultado_filtro.cd_pessoa,
      tblMensalidadesNossoNumero.AsString,
      qryUpdateResp.ParamByName('NOSSONUMERO').AsString]);

   // Armazena log da operação realizada
   DM.setLog(2001, 'Alteração', tblMensalidadescd_mensalidade.AsString,
      tblMensalidadescd_coligada.AsInteger, ObsLog + ' via Planilha de Recebimentos');

   DM.Ativar_Matricula(
      tblMensalidadescodigoaluno.AsInteger,
      tblMensalidadesTurma.AsString,
      tblMensalidadesAnoSemestre.AsInteger, False, False
   );

   Filtra;
end;

procedure TfrmMensalidades.AlterarStatusBotaoNotificarMensalidades(
  const ativar: Boolean);
begin
   if NOT(NotificarresponsveisdaMensalidade1.Visible) then Exit;

   NotificarresponsveisdaMensalidade1.Enabled := ativar;
end;

procedure TfrmMensalidades.ArrumaNossoNumero;
begin
   if DM.sLogin <> 'ADMIN' then exit;

   if Mensagem('Tem certeza que deseja criar um nossonumero novo para todas as parcelas sem nossonumero?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
   <> mrYes Then Exit;

   Dm.tblMensalidades.Close;
   Dm.tblMensalidades.SQL.Text := 'select * from mensalidades where nossonumero = ''''';
   Dm.tblMensalidades.SQL.Add('order by codigoaluno, anosemestre, turma, parcela');
   Dm.tblMensalidades.Open;

   While not Dm.tblMensalidades.Eof do
   Begin
       DM.tblMensalidades.Edit;
       DM.tblMensalidadesNossoNumero.AsString := DM.NovoNumero(Dm.tblMensalidadesDepto.AsInteger, Dm.tblMensalidadesTurma.AsString,  Dm.tblMensalidadesAnoSemestre.AsInteger, 0, 0, 0, Dm.tblMensalidadesCodigoAluno.AsInteger, Copy( Dm.tblMensalidadesDataVencimento.AsString, 9, 2 ), Copy( Dm.tblMensalidadesDataEmissao.AsString, 9, 2 ));
       Dm.tblMensalidades.Post;

       Dm.tblMensalidades.Next;
   End;     

end;

procedure TfrmMensalidades.ArrumarCreditosAcademicos;
Var
  qyRoda : TUMZQuery;
  i : Integer;
begin
   if SysUtils.AnsiUpperCase(DM.sLogin) <> 'ADMIN' then exit;

   if Mensagem('Tem certeza que deseja recalcular o financeiro de todos os alunos do anosemestre: ' + tblMensalidadesAnoSemestre.AsString + '?' , 'Confirmação', MB_YESNO + MB_ICONQUESTION)
   <> mrYes Then Exit;


   DM.CriarConsulta(qyRoda);
   qyRoda.SQL.Text := 'SELECT DISTINCT codigoaluno, turma, anosemestre FROM mensalidades ' +
    ' WHERE anosemestre = ' + tblMensalidadesAnoSemestre.AsString +
    ' AND situacao not in (3,4,5,6,7,8) ';
   qyRoda.Open();

   if (frmProg = nil) then begin
      Application.CreateForm(TfrmProg, frmProg);
      frmProg.NovaBarra('Recalculo Financeiro!');
      frmProg.SetText('Calculando o numero de alunos a serem processados...');

   end;
   //carrega o temporizador
   frmProg.SetMin(1);
   frmProg.SetMax(qyRoda.RecordCount + 2);
   frmProg.SetAtual(1);

   i := 1;
   While not qyRoda.Eof do
   Begin
      try
         DM.recalcular_creditos_financeiros(qyRoda.FieldByName('codigoaluno').AsInteger, qyRoda.FieldByName('turma').AsString, qyRoda.FieldByName('anosemestre').AsInteger, false);
      Except
         Mensagem('Erro ao Recalcular o aluno: ' + qyRoda.FieldByName('codigoaluno').AsString, 'Atenção', MB_OK + MB_ICONERROR);
      end;
      qyRoda.Next();

      Inc(i);
      frmProg.SetAtual(i);
      frmProg.SetText('Recalculando registro: ' + Format('%4.0d de %4.0d', [frmProg.getAtual(), frmProg.getMax()]));

   End;

   frmProg.FechaBarra();
   FreeAndNil(frmProg);
   FreeAndNil(qyRoda);

   Mensagem('Fim do recalculo financeiro', 'Atenção', mb_ok);

end;

procedure TfrmMensalidades.ArrumarCreditosAcademicosAluno;
Var
  qyRoda : TUMZQuery;
  i : Integer;
begin

   if Mensagem('Tem certeza que deseja recalcular o financeiro do estudante na turma '+tblMensalidadesTurma.AsString+'?' , 'Confirmação', MB_YESNO + MB_ICONQUESTION)
   <> mrYes Then Exit;

   DM.CriarConsulta(qyRoda);
   qyRoda.SQL.Text := 'SELECT DISTINCT codigoaluno, turma, anosemestre FROM mensalidades ' +
    ' WHERE anosemestre = :anosemestre ' +
    ' AND codigoaluno = :codigoaluno ' +
    ' AND turma LIKE :turma ' +
    ' AND situacao NOT IN (3,4,5,6,7,8) ';

   qyRoda.ParamByName('anosemestre').AsInteger := tblMensalidadesAnoSemestre.AsInteger;
   qyRoda.ParamByName('codigoaluno').AsInteger := tblMensalidadescodigoaluno.AsInteger;
   qyRoda.ParamByName('turma').AsString := tblMensalidadesTurma.AsString;

   qyRoda.Open();

   if (frmProg = nil) then begin
      Application.CreateForm(TfrmProg, frmProg);
      frmProg.NovaBarra('Recálculo financeiro!');
      frmProg.SetText('Calculando os créditos financeiros do aluno...');
   end;

   //carrega o temporizador
   frmProg.SetMin(1);
   frmProg.SetMax(qyRoda.RecordCount + 2);
   frmProg.SetAtual(1);

   i := 1;
   While not qyRoda.Eof do
   Begin
      try
         DM.recalcular_creditos_financeiros(qyRoda.FieldByName('codigoaluno').AsInteger, qyRoda.FieldByName('turma').AsString, qyRoda.FieldByName('anosemestre').AsInteger, false);
      Except
         Mensagem('Erro ao recalcular os créditos do aluno: ' + qyRoda.FieldByName('codigoaluno').AsString, 'Atenção', MB_OK + MB_ICONERROR);
      end;
      qyRoda.Next();

      Inc(i);
      frmProg.SetAtual(i);
   End;

   frmProg.FechaBarra();
   FreeAndNil(frmProg);
   FreeAndNil(qyRoda);

   Mensagem('Fim do recálculo financeiro', 'Atenção', mb_ok);

   Filtra;

end;

procedure TfrmMensalidades.AssociarDescontosAlunos(CodAluno: Integer);
Var
   qySaldo : TUMZQuery;
   dSaldoRestante : Currency;
   Observacao: string;
   iTipoTituloSaldo : integer;
   iTipoTituloSaldoDesc : integer;
   iCaixaBaixa : integer;
   sTitulosFiltro : String;   
begin

   // Parametro criado para definir o tipo de titulo para controle de saldos de antecipações
   try
      iTipoTituloSaldo := StrToInt(Dm.variavel_parametro('financeiro_saldo_tipo_titulo', false));
      iTipoTituloSaldoDesc := StrToInt(Dm.variavel_parametro('financeiro_saldo_tipo_titulo_desc', false));
      iCaixaBaixa := StrToInt(Dm.variavel_parametro('financeiro_saldo_caixa_baixa', false));
   Except
      Mensagem('O controle de antecipações não está configurado. ', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
   end;

   // Define o complemento da clausula WHERE para definir quais títulos pendentes poderão ser baixados pelo controle de saldos antecipados.
   sTitulosFiltro := trim(Dm.variavel_parametro('financeiro_saldo_titulo_filtros', false));

   Dm.CriarConsulta(qySaldo);
   // qySaldo.RequestLive := true;

   qySaldo.SQL.Text :=
    ' SELECT * FROM mensalidades WHERE cd_tipo_titulo = ' + IntToStr(iTipoTituloSaldoDesc) + ' AND valorpago > 0 '; // Pagamento Antecipado ISPU;

   if CodAluno <> 0 then begin

      qySaldo.SQL.Add(' AND codigoaluno = ' + IntToStr(Codaluno) );

   end;

   qySaldo.SQL.Add(' ORDER BY codigoaluno, datavencimento ');
   qySaldo.Open;

   while not qySaldo.EOF do begin // Para cada aluno faça

      // Pegar o saldo inicial
      dSaldoRestante := qySaldo.FieldByName('valorpago').AsCurrency;

      // Selecionar as mensalidades pendentes
      DM.tblMensalidades.Close();
      Dm.tblMensalidades.SQL.Text :=
       ' SELECT * from Mensalidades WHERE codigoaluno = ' + qySaldo.FieldByName('codigoaluno').AsString +
       ' AND situacao = 2 AND cd_tipo_titulo <> ' + IntToStr(iTipoTituloSaldo) + ' AND cd_tipo_titulo <> ' + IntToStr(iTipoTituloSaldoDesc) + ' AND (descontoextra is null OR descontoextra = 0)';
       
      if sTitulosFiltro <> '' then begin
         Dm.tblMensalidades.SQL.Add(' AND ' + sTitulosFiltro );
      end;

      Dm.tblMensalidades.SQL.Add(' ORDER BY datavencimento ' );
      Dm.tblMensalidades.Open();

      while (not Dm.tblMensalidades.Eof) AND (dSaldoRestante > 0) do begin // Enquanto tiver dívida e ter saldo não baixado

          Dm.tblMensalidades.Edit;

          if dSaldoRestante > DM.tblMensalidadesValorTotalCalc.AsCurrency then begin

             DM.tblMensalidadesdescontoextra.AsCurrency := DM.tblMensalidadesValorTotalCalc.AsCurrency;
             Dm.tblMensalidadesValorJuros.AsCurrency := 0;
             Dm.tblMensalidadesSituacao.AsInteger := 6;


          end else begin

             DM.tblMensalidadesdescontoextra.AsCurrency := dSaldoRestante;

          end;

          dSaldoRestante := dSaldoRestante - DM.tblMensalidadesdescontoextra.AsCurrency;

          Dm.tblMensalidades.Post;

          DM.tblMensalidades.Next;

      end;

      // Gravar histórico na observação

      Observacao :=
         '[UNIMESTRE] Associação de Desconto:' + #13 + 'Saldo Inicial: ' +
         FloatToStrF(qySaldo.FieldByName('valorpago').AsCurrency, ffNumber, 12, 2) + #13 +
         'Saldo Final: ' + FloatToStrF(dSaldoRestante, ffNumber, 12, 2);
      
      TfObservacoes.RegisterObservation(
         qySaldo.FieldByName('codigoaluno').AsInteger, okFinancial, Observacao);

      // Atualizar Saldo

      qySaldo.Edit();
      qySaldo.FieldByName('valorpago').AsCurrency := dSaldoRestante;
      qySaldo.Post;

      qySaldo.Next;

   end;

   Mensagem('Descontos importados, confira!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

   if CodAluno <> 0 then begin

      Filtra();

   end;

   FreeAndNil(qySaldo);

end;


procedure TfrmMensalidades.AssociarMensalidadesAluno(CodAluno: Integer);
Var
   qySaldo : TUMZQuery;
   dSaldoRestante : Currency;
   Observacao: string;
   iTipoTituloSaldo : integer;
   iCaixaBaixa : integer;
   sTitulosFiltro : String;
begin
   // Parametro criado para definir o tipo de titulo para controle de saldos de antecipações
   try
      iTipoTituloSaldo := StrToInt(Dm.variavel_parametro('financeiro_saldo_tipo_titulo', false));
      iCaixaBaixa := StrToInt(Dm.variavel_parametro('financeiro_saldo_caixa_baixa', false));
   Except
      Mensagem('O controle de antecipações não está configurado. ', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Exit;
   end;

   // Define o complemento da clausula WHERE para definir quais títulos pendentes poderão ser baixados pelo controle de saldos antecipados.
   sTitulosFiltro := trim(Dm.variavel_parametro('financeiro_saldo_titulo_filtros', false));

   Dm.CriarConsulta(qySaldo);
   // qySaldo.RequestLive := true;

   qySaldo.SQL.Text :=
    ' SELECT * FROM mensalidades WHERE cd_tipo_titulo = ' + IntToStr(iTipoTituloSaldo) + ' AND valorpago > 0'; // Pagamento Antecipado ISPU;

   if CodAluno <> 0 then begin

      qySaldo.SQL.Add(' AND codigoaluno = ' + IntToStr(Codaluno) );

   end;

   qySaldo.SQL.Add(' ORDER BY codigoaluno, datavencimento ');
   qySaldo.Open;

   while not qySaldo.EOF do begin // Para cada aluno faça

      // Pegar o saldo inicial
      dSaldoRestante := qySaldo.FieldByName('valorpago').AsCurrency;

      // Selecionar as mensalidades pendentes
      DM.tblMensalidades.Close();
      Dm.tblMensalidades.SQL.Text :=
       ' SELECT * from Mensalidades WHERE codigoaluno = ' + qySaldo.FieldByName('codigoaluno').AsString +
       ' AND (situacao = 2 or situacao = 10) AND cd_tipo_titulo <> ' + IntToStr(iTipoTituloSaldo);

      if sTitulosFiltro <> '' then begin
         Dm.tblMensalidades.SQL.Add(' AND ' + sTitulosFiltro );
      end;

      Dm.tblMensalidades.SQL.Add(' ORDER BY datavencimento ');
      Dm.tblMensalidades.Open();

      while (not Dm.tblMensalidades.Eof) AND (dSaldoRestante > 0) do begin // Enquanto tiver dívida e ter saldo não baixado

          Dm.tblMensalidades.Edit;
          Dm.tblMensalidadesvalorjuros_fixo.AsCurrency := Dm.tblMensalidadesValorJuros.AsCurrency;
          Dm.tblMensalidadesvalordesconto_fixo.AsCurrency := Dm.tblMensalidadesValorDesconto.AsCurrency;
          DM.tblMensalidadesDataPagamento.AsString := qySaldo.FieldByName('datapagamento').AsString;
          DM.tblMensalidadescd_moeda_pgto.AsInteger := Dm.tblMensalidadescd_moeda.AsInteger;

          if dSaldoRestante > DM.tblMensalidadesValorTotalCalc.AsCurrency then begin

             DM.tblMensalidadesValorPago.AsCurrency := DM.tblMensalidadesValorTotalCalc.AsCurrency;
             Dm.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesValorJurosCalc.AsCurrency;

          end else begin

             DM.tblMensalidadesValorPago.AsCurrency := dSaldoRestante;
             Dm.tblMensalidadesValorJuros.AsCurrency := DM.tblMensalidadesValorJurosCalc.AsCurrency;

          end;

          DM.tblMensalidadesvl_pago_moeda.AsCurrency := DM.tblMensalidadesValorPago.AsCurrency;
          frmDinCh.dblDin := DM.tblMensalidadesValorPago.AsCurrency;
          frmDinCh.dblCh := 0;

          DM.BaixarMensalidade(iCaixaBaixa, '');

          dSaldoRestante := dSaldoRestante - DM.tblMensalidadesValorPago.AsCurrency;

          DM.tblMensalidades.Next;

      end;

      // Gravar histórico na observação
      

      Observacao :=
         '[UNIMESTRE] Associação dos Saldos:' + CHR(13) +
         'Saldo Inicial: ' + FloatToStrF(qySaldo.FieldByName('valorpago').AsCurrency, ffNumber, 12, 2) + CHR(13) +
         'Saldo Final: ' +  FloatToStrF(dSaldoRestante, ffNumber, 12, 2);
      TfObservacoes.RegisterObservation(
         qySaldo.FieldByName('codigoaluno').AsInteger, okFinancial, Observacao);


      // Atualizar Saldo

      qySaldo.Edit();
      qySaldo.FieldByName('valorpago').AsCurrency := dSaldoRestante;
      qySaldo.Post;

      qySaldo.Next;

   end;

   Mensagem('Saldos importados, confira!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

   if CodAluno <> 0 then begin

      Filtra();

   end;

   FreeAndNil(qySaldo);

end;

class procedure TfrmMensalidades.AutenticarMensalidade(sMascara : String = '');
Var
   nro_aut : integer;
   i : integer;
   arquivo : TextFile;

   strAut : String;
   campo : string;

   linha : string;
   n : Integer;
   bEnterNaUltima : Boolean; // Verificar se deve dar o enter na última autenticação
begin

   try
       nro_aut := StrToInt(DM.variavel_parametro('financeiro_qtd_autenticacao_baixa'));
   except
       nro_aut := 0;
   end;

   if nro_aut = 0 then Exit;

   if nro_aut = -1 then nro_aut := 1;   

   i := 0;

   // A mascara pode ser passada na chamada da função... (caso de estorno).. se não passar assumir
   // o parametro financeiro_autenticacao_campos
   if sMascara = ''  then
      strAut := DM.variavel_parametro('financeiro_autenticacao_campos')
   else
      strAut := sMascara;

   if Pos('[ENTER]', strAut) > 0 then begin
       bEnterNaUltima := true;
       strAut := ReplaceStr(strAut, '[ENTER]', ''); // Retirar a string ENTER
   end else begin
       bEnterNaUltima := false;
   end;

   { String Padrão }
   if trim(strAut) = '' then
      strAut := 'UNIMESTRE[codigoaluno][parcela][nossonumero][datapagamento][valorpago][situacao]';

   while i < nro_aut do
   Begin
       INC(I);

       if Mensagem('Posicione o papel para autenticação ' + IntToStr(i), 'Confirmação', MB_YESNO + MB_ICONQUESTION)
       <> mrYes then Exit;

       linha := '';

       { Verificar linha de Autenticação }

       n := 1;
       while n <= Length(strAut) do
       Begin

           if strAut[n] = '[' then
           Begin

              campo := '';
              inc(n);

              While strAut[n] <> ']' do Begin
                 campo := campo + strAut[n];
                 inc(n);
              End;

              linha := linha + DM.tblMensalidades.FieldByName(campo).DisplayText;

           End
           else
           Begin
               linha := linha + strAut[n];
           End;

           inc(n);

       End;

       if Pos('#13', linha) > 0 then begin
         linha := StringReplace(linha, '#13', CHR(13), [rfReplaceAll]);
       end;
       
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

procedure TfrmMensalidades.BaixarMensalidade;
var
   cd_mensalidade : string;
   cd_caixa       : integer;
   qyCheque       : TUMZQuery;
   qyDepto        : TUMZQuery;
   iQtd           : integer;
begin
   { Verificar se a baixa é somente do cheque pré-datado }
   try
      Application.CreateForm( TfrmMensalidadesBaixar, frmMensalidadesBaixar );

      DM.CriarConsulta( qyDepto );


      cd_mensalidade := tblMensalidadescd_mensalidade.AsString;

      if ((tblMensalidadesSituacao.AsInteger = 0) or (tblMensalidadesSituacao.AsInteger = 1))
      and (TemChequePendente(tblMensalidadescd_mensalidade.AsInteger)) then
      Begin
         { Colocar o cheque como compensado }

         if Mensagem('A mensalidade foi paga com cheque. Deseja encaminhá-los para depósito?', 'Confirmação', MB_YESNO) = mrYes
         then
         begin
            DM.CriarConsulta( qyCheque );

            qyCheque.Close();
            qyCheque.SQL.Clear();
            qyCheque.SQL.Text :=
               ' UPDATE fin_cheques fc, fin_cheques_mensalidades fcm  ' +
               ' SET fc.cd_situacao = 1 ' +
               ' WHERE  ' +
               '    fc.cd_cheque = fcm.cd_cheque AND ' +
               '    fcm.cd_mensalidade = ' + cd_mensalidade;
            qyCheque.ExecSQL();

            Self.Filtra();

            FreeAndNil( qyCheque );

            Exit;
         end;
      end;

      // Novo Financeiro
      DM.CriarConsulta( qyDepto );
      qyDepto.Close;
      qyDepto.SQL.Clear;
      qyDepto.SQL.Add(' SELECT d.cd_caixa ');
      qyDepto.SQL.Add(' FROM departamentos d ');
      qyDepto.SQL.Add(' WHERE d.codigo = :depto ');
      qyDepto.ParamByName('depto').AsInteger := tblMensalidadesDepto.AsInteger;
      qyDepto.Open;

      cd_caixa :=  qyDepto.FieldByName('cd_caixa').AsInteger;

      FreeAndNil( qyDepto );

      case tblMensalidadesSituacao.Value of

         0..1 : Mensagem( 'Mensalidade já baixada.',           Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

         4 :    Mensagem( 'Mensalidade já foi cancelada.',     Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

         5 :    Mensagem( 'Mensalidade já foi cancelada.',     Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

         6 :    Mensagem( 'Mensalidade baixada por Desconto.', Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

         7 :    Mensagem( 'Mensalidade já foi cancelada.',     Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

      end;

      if not DM.UsuarioLogado.TemPermissao( 2012, npAcesso, True ) then Exit;

      if (tblMensalidadesSituacao.AsInteger = 2) or (tblMensalidadesSituacao.AsInteger = 10) then
      begin

         //seta as variáveis
         frmMensalidadesBaixar.setPessoaSelecionada( tblMensalidadesCodigoAluno.AsString );
         frmMensalidadesBaixar.setMensalidadeSelecionada( tblMensalidadescd_mensalidade.AsString );
         frmMensalidadesBaixar.setTurmaSelecionada( tblMensalidadesTurma.AsString );
         frmMensalidadesBaixar.setNrAnoSemestreSelecionado( tblMensalidadesAnoSemestre.AsString );
         frmMensalidadesBaixar.setNmPessoaSelecionada( tblMensalidadesNomeAluno.AsString );

         //Passa nome do resposável pela mensalidade como o titular do cheque por
         //padrão (para preenchimento automático do campo como um facilitador)
         if tblMensalidadesNomeResponsavel.asString <> '' then
         begin
            frmMensalidadesBaixar.setnm_titular(tblMensalidadesNomeResponsavel.asString);
         end;
         //Caso não possua um responsável pela mensalidade, passa o próprio
         //aluno como titular.
         if tblMensalidadesNomeResponsavel.asString = '' then
         begin
            frmMensalidadesBaixar.setnm_titular(tblMensalidadesNomeAluno.AsString);
         end;

         frmMensalidadesBaixar.ShowModal();

         Self.Filtra();
      end;

   finally

      FreeAndNil(frmMensalidadesBaixar);
      cbTurma.SetFocus;

   end;
end;

procedure TfrmMensalidades.BaixarMensalidadeAntigo;
Var
  iCodMensalidade : Integer;
  iQtd : Integer;
  sNomeRelatorio: String;
  PodeExportar: Boolean;
  infoRelatorio: ClasseRegistros;
begin
  { Verificar se a baixa é somente do cheque pré-datado }
  try
     Application.CreateForm(Tfrm_Mensa_Baixar, frm_Mensa_Baixar);
     iCodMensalidade:=tblMensalidadescd_mensalidade.AsInteger;

  if ((tblMensalidadesSituacao.AsInteger = 0) or (tblMensalidadesSituacao.AsInteger = 1))
  and (TemChequePendente(tblMensalidadescd_mensalidade.AsInteger)) then
  Begin
      { Colocar o cheque como compensado }

      if Mensagem('A mensalidade foi paga com cheque. Deseja encaminhá-los para depósito?', 'Confirmação', MB_YESNO) = mrYes
      Then Begin

         qyTemp1.Close();
         qyTemp1.SQL.Clear();
         qyTemp1.SQL.Text :=
           ' UPDATE fin_cheques fc, fin_cheques_mensalidades fcm  ' +
           ' SET fc.cd_situacao = 1 ' +
           ' WHERE  ' +
           '    fc.cd_cheque = fcm.cd_cheque AND ' +
           '    fcm.cd_mensalidade = ' + IntToStr( tblMensalidadescd_mensalidade.AsInteger );
         qyTemp1.ExecSQL();

         Filtra;

         Exit;

      End;
  End;


  // Novo Financeiro

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add(' SELECT d.cd_caixa ');
   qyTemp1.SQL.Add(' FROM departamentos d ');
   qyTemp1.SQL.Add(' WHERE d.codigo = :depto ');
   qyTemp1.ParamByName('depto').AsInteger := tblMensalidadesDepto.AsInteger;
   qyTemp1.Open;

  case tblMensalidadesSituacao.Value of

    0..1 :  Mensagem( 'Mensalidade já baixada.', Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

    4 :     Mensagem( 'Mensalidade já foi cancelada.', Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

    5 :     Mensagem( 'Mensalidade já foi cancelada.', Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

    6 :     Mensagem( 'Mensalidade baixada por Desconto.', Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

    7 :     Mensagem( 'Mensalidade já foi cancelada.', Application.Title,
              MB_OK + MB_ICONEXCLAMATION );

  end;

  if not DM.UsuarioLogado.TemPermissao( 2012, npAcesso, True ) then Exit;

  if (tblMensalidadesSituacao.AsInteger = 2) or (tblMensalidadesSituacao.AsInteger = 10)  then
  begin

    frm_Mensa_Baixar.lngCodigoAluno := tblMensalidadesCodigoAluno.AsInteger;
    frm_Mensa_Baixar.intParcela     := tblMensalidadesParcela.AsInteger;
    frm_Mensa_Baixar.datVencimento  := tblMensalidadesDataVencimento.AsDateTime;
    frm_Mensa_Baixar.strTurma       := tblMensalidadesTurma.asString;
    frm_Mensa_Baixar.strAluno       := tblMensalidadesNomeAluno.asString;
    frm_Mensa_Baixar.strNossoNumero := tblMensalidadesNossoNumero.AsString;
    frm_mensa_baixar.iCodigoMensalidade := tblMensalidadescd_mensalidade.AsInteger;

    frmDinCh.AlunoAtual := tblMensalidadesCodigoAluno.AsInteger;
    frmDinCh.iCaixa     := qyTemp1.FieldByNAme('cd_caixa').AsInteger;

    frm_Mensa_Baixar.iConta := qyTemp1.FieldByNAme('cd_caixa').AsInteger; // DM.tblControlecd_conta_banco.AsInteger;

    if frm_Mensa_Baixar.ShowModal = mrCancel then
    begin
      Mensagem( 'Operação cancelada.', Application.Title, MB_OK + MB_ICONSTOP );
      if tblMensalidades.State in [dsInsert, dsEdit] then tblMensalidades.Cancel;
      Screen.Cursor := crDefault;
      Exit;
    end
    Else begin
       Dm.Ativar_Matricula(tblMensalidadesCodigoAluno.AsInteger, tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger);

       // Verificar a necessidade de impressão de recibo automática

       if (DM.variavel_parametro('financeiro_qtd_autenticacao_baixa') <> '') AND
          (DM.variavel_parametro('financeiro_qtd_autenticacao_baixa') <> '-1')
       then
          TfrmMensalidades.AutenticarMensalidade;

       if (dm.variavel_parametro('financeiro_forcar_recibo') = 'NORMAL') then begin

           if Mensagem('Deseja imprimir o recibo do título baixado?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) = mrYes then begin

              oRecibo := TFinReciboManager.Create(frmMensalidades.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
              oRecibo.imprimirRecibo();

              infoRelatorio := PrincipalForm.GetInfoRpt('relatorio_padrao_recibo');
              sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

              PodeExportar := True;
              if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
                 PodeExportar := False;
                 
              PrincipalForm.ImprimeRpt(Self, sNomeRelatorio , -1, '{mensalidades.cd_mensalidade} = ' + tblMensalidades.FieldByName('cd_mensalidade').AsString, '',nil,nil,nil,nil, true, False, nil, PodeExportar);
              FreeAndNil(oRecibo);

           end;

       end else if (dm.variavel_parametro('financeiro_forcar_recibo') = 'FISCAL') then begin

          if Mensagem('Deseja imprimir o recibo do título baixado?', 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONQUESTION) = mrYes then begin

              if trim(Dm.variavel_parametro('financeiro_forcar_recibo_qtd')) <> '' then begin
                 iQtd := StrToInt(  Dm.variavel_parametro('financeiro_forcar_recibo_qtd') );
              end else begin
                 iQtd := 1;
              end;

              Application.CreateForm(TfrmImpMens, frmImpMens);
              tblMensalidades.Locate('cd_mensalidade',iCodMensalidade,[]);
              while iQtd > 0 do begin

                 frmImpMens.ImprimirReciboDOS(frmMensalidades.tblMensalidadescd_mensalidade.AsString);
                 Dec(iQtd);

              end;
              FreeAndNil(frmImpMens);

          end;

       end;

       Filtra();

    end;
  end;

  finally
      FreeAndNil(frm_Mensa_Baixar);
  end;
end;

procedure TfrmMensalidades.btnObsRestritasClick(Sender: TObject);
begin
   if not tblMensalidades.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblMensalidadescodigoaluno.AsInteger,
         okRestrict)
   else
      Mensagem('Selecione uma pessoa para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure TfrmMensalidades.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblMensalidades, pmQtd);

end;

procedure TfrmMensalidades.pmLogsPopup(Sender: TObject);
var
  Item: TMenuItem;
  chaves1, chaves7, chaves8, chaves10 : string;
  sChaveLog7, sChaveLog1 : string;
begin
  pmLogs.Items.Clear;
  Item := TMenuItem.Create(self);

  chaves1 := tblMensalidades.FieldByName('CodigoAluno').AsString + ';' +
             tblMensalidades.FieldByName('AnoSemestre').AsString + ';' +
             tblMensalidades.FieldByName('Turma').AsString + ';' +
             tblMensalidades.FieldByName('Parcela').AsString;

  sChaveLog1 := tblMensalidades.FieldByName('cd_mensalidade').AsString + ';' +
                tblMensalidades.FieldByName('CodigoAluno').AsString + ';' +
                tblMensalidades.FieldByName('AnoSemestre').AsString + ';' +
                tblMensalidades.FieldByName('Turma').AsString + ';' +
                tblMensalidades.FieldByName('Parcela').AsString;

  chaves7 := tblMensalidades.FieldByName('CodigoAluno').AsString + ';' +
             tblMensalidades.FieldByName('AnoSemestre').AsString + ';' +
             tblMensalidades.FieldByName('Turma').AsString + ';' +
             tblMensalidades.FieldByName('Parcela').AsString;

  sChaveLog7 := tblMensalidades.FieldByName('cd_mensalidade').AsString + ';' +
                tblMensalidades.FieldByName('CodigoAluno').AsString + ';' +
                tblMensalidades.FieldByName('AnoSemestre').AsString + ';' +
                tblMensalidades.FieldByName('Turma').AsString + ';' +
                tblMensalidades.FieldByName('Parcela').AsString;

  chaves8 := tblMensalidades.FieldByName('AnoSemestre').AsString + ';' +
             tblMensalidades.FieldByName('Turma').AsString + ';' +
             tblMensalidades.FieldByName('Parcela').AsString;

  chaves10 := tblMensalidades.FieldByName('cd_mensalidade').AsString;

  qyTemp1.Close;
  qyTemp1.SQL.Clear;
  qyTemp1.SQL.Add('SELECT * from logs where (cd_tipo = 10 AND (cd_chave = ''' + chaves10 + ''' )) OR (cd_tipo = 1 AND (cd_chave = ''' + chaves1 + ''' or cd_chave='''+sChaveLog1+''' )  )'+
                  'OR (cd_tipo = 7 AND (cd_chave = ''' + chaves7 + ''' or cd_chave = '''+ sChaveLog7+''') ) OR (cd_tipo = 8 AND cd_chave = ''' + chaves8 + ''')');
  qyTemp1.SQL.Add('ORDER by dt_log ');
  qyTemp1.Open;

  if qyTemp1.EOF then
  Begin
     Item.Caption := 'Nenhuma alteração foi registrada';
     pmLogs.Items.Add(Item);
  end
  else
  begin
     Item.Caption := 'Alterações registradas: ';
     pmLogs.Items.Add(Item);
     Item := TMenuItem.Create(self);
     Item.Caption := '-';
     pmLogs.Items.Add(Item);
  end;

  while not qyTemp1.EOF do
  Begin

    DM.FindUserCodigo(qyTemp1.FieldByNAme('cd_usuario').AsInteger);

    Item := TMenuItem.Create(self);
    Item.Caption := FormatDateTime('dd/mm/yyyy hh:MM',qyTemp1.FieldByName('dt_log').AsDateTime) + ' - ' + DM.FindUserName(qyTemp1.FieldByNAme('cd_usuario').AsInteger) + ':  ' + ReplaceStr( qyTemp1.FieldByName('ds_log').AsSTring , chr(13) , ' | ' );

    pmLogs.Items.Add(Item);
    qyTemp1.Next;
  End;


end;

procedure TfrmMensalidades.pmoProrrogarClick(Sender: TObject);
var
  chaveVencimento : TDateTime;
  log : string;
begin

  if not DM.UsuarioLogado.TemPermissao( 2016, npAcesso, True ) then Exit;

  chaveVencimento  := tblMensalidadesDataVencimento.AsDateTime;

  // Conferir Bloqueio de Alterações por data
  if DM.EstaBloqueado(chaveVencimento, True) then Exit;

  case tblMensalidadesSituacao.AsInteger of
    0,1,3,4,5,6,7,8,9 :
      begin
        Mensagem( 'Não é possível prorrogar o vencimento de uma mensalidade já baixada.', Application.Title, MB_OK + MB_ICONSTOP );
        Exit;
      end;
  end;

  if frmTransferir.ShowModal = mrCancel then
  begin
    DM.tblMensalidades.Cancel;
    Screen.Cursor := crDefault;
    Exit;
  end;

  if chaveVencimento <> Dm.tblMensalidadesDataVencimento.AsDateTime then begin
     log := log + 'Vencimento: ['+FormatDateTime('dd/mm/yyyy',chaveVencimento)+'] => ['+FormatDateTime('dd/mm/yyyy',Dm.tblMensalidadesDataVencimento.AsDateTime)+'].'+chr(13);
     DM.gerar_log( 10, log, DM.iCdPessoaLogado, dm.tblMensalidadescd_mensalidade.AsString );
  end;

  { Emitir remessa para o banco com a alteração }

  {
  Claudionor: 07/05/2015
  Enviar a remessa para o banco apenas se imprimir o boleto novamente
   if not DM.tblMensalidades.Eof then
   Begin
      DM.FazAcaoRemessa(arProrrogar, DM.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
   End;
  } 

  Filtra;
end;

procedure TfrmMensalidades.pmoReajustarClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2051, npAlterar, True ) then Exit;

   Application.CreateForm( TfReajusteMensa, fReajusteMensa );

   if not tblMensalidades.Eof then begin
      fReajusteMensa.txtAluno.Text := tblMensalidadesCodigoAluno.AsString;
      fReajusteMensa.txtCurso.Text := tblMensalidadescurso.AsString;
      fReajusteMensa.txtDepto.Text := tblMensalidadesDepto.AsString;
      fReajusteMensa.txtTurma.Text := tblMensalidadesTurma.AsString;
      fReajusteMensa.mskAnoSem.Text := tblMensalidadesAnoSemestre.AsString;
   end;

   fReajusteMensa.Showmodal;

   Filtra;
end;

procedure TfrmMensalidades.pmProtestosPopup(Sender: TObject);
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

procedure TfrmMensalidades.btnGerarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   DtVencimento : TDateTime;
   ValorTotal : Currency;
   CdMensaOrigem, CdMensa : Integer;
   Diferenca : Currency;
   ValorDesconto : Currency;
   Valorjuros : Currency;
begin

    if (ssCtrl in Shift) AND (ssAlt in Shift) then begin

       if not DM.UsuarioLogado.TemPermissao( 2013, npIncluir, True ) then Abort;

          if Mensagem('Deseja realmente Corrigir as baixas parciais para todos os títulos?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
          <> mrYEs then Abort;
       

       Dm.tblMensalidades.Close;
       Dm.tblMensalidades.SQL.Text :=
         ' SELECT * FROM mensalidades           ' +
         '  WHERE (situacao = 1 OR tipoparcela = 1) ' +
         '  ORDER BY cd_mensalidade_origem, cd_mensalidade ';
       Dm.tblMensalidades.Open();

       while not Dm.tblMensalidades.Eof do begin

          if Dm.tblMensalidades.FieldByname('cd_mensalidade').AsInteger =
             Dm.tblMensalidades.FieldByname('cd_mensalidade_origem').AsInteger
          then begin
             // Mensalidade Original iniciar processo
             CdMensaOrigem := Dm.tblMensalidades.FieldByname('cd_mensalidade_origem').AsInteger;
             CdMensa := Dm.tblMensalidades.FieldByname('cd_mensalidade').AsInteger;

             ValorDesconto := DM.tblMensalidadesValorDesconto.AsCurrency;
             ValorJuros := DM.tblMensalidadesValorJuros.AsCurrency;


             Diferenca := (DM.tblMensalidadesValorBruto.AsCurrency +
                          DM.tblMensalidadesValorExtra.AsCurrency +
                          DM.tblMensalidadesValorJuros.AsCurrency -
                          DM.tblMensalidadesValorDesconto.AsCurrency -
                          DM.tblMensalidadesDescontoExtra.AsCurrency) - DM.tblMensalidadesValorPago.AsCurrency;


             Dm.tblMensalidades.Next;

             while (not Dm.tblMensalidades.Eof) AND (Dm.tblMensalidades.FieldByname('cd_mensalidade_origem').AsInteger =
                      CdMensaOrigem) AND (Diferenca > 0) do begin

                    CdMensa := Dm.tblMensalidades.FieldByname('cd_mensalidade').AsInteger;

                    if Dm.tblMensalidades.FieldByName('valorbruto').AsCurrency <> Diferenca then begin

                       DM.qAux2.ClosE();
                       DM.qAux2.SQL.Text := 'UPDATE mensalidades SET valorbruto = :valor WHERE cd_mensalidade = ' + DM.tblMensalidadescd_mensalidade.AsString;
                       DM.qAux2.ParamByName('valor').AsCurrency := Diferenca;
                       Dm.qAux2.ExecSQL;

                       Diferenca := (Diferenca +
                                      DM.tblMensalidadesValorExtra.AsCurrency +
                                      DM.tblMensalidadesValorJuros.AsCurrency -
                                      DM.tblMensalidadesValorDesconto.AsCurrency -
                                      DM.tblMensalidadesDescontoExtra.AsCurrency) - DM.tblMensalidadesValorPago.AsCurrency;

                    end else begin

                       if Dm.tblMensalidadesSituacao.AsInteger in [0,1] then begin


                           Diferenca := (DM.tblMensalidadesValorBruto.AsCurrency +
                                        DM.tblMensalidadesValorExtra.AsCurrency +
                                        DM.tblMensalidadesValorJuros.AsCurrency -
                                        DM.tblMensalidadesValorDesconto.AsCurrency -
                                        DM.tblMensalidadesDescontoExtra.AsCurrency) - DM.tblMensalidadesValorPago.AsCurrency;

                       end else begin

                           Diferenca := 0;
                       end;


                    end;
                    ValorDesconto := DM.tblMensalidadesValorDesconto.AsCurrency;
                    ValorJuros := DM.tblMensalidadesValorJuros.AsCurrency;

                    Dm.tblMensalidades.Next;
             end;

             if Diferenca > 0 then begin

                DM.qAux2.ClosE();
                DM.qAux2.SQL.Text := 'UPDATE mensalidades SET valordesconto = :valor WHERE cd_mensalidade = ' + IntToStr(CdMensa);
                DM.qAux2.ParamByName('valor').AsCurrency := ValorDesconto + Diferenca;
                Dm.qAux2.ExecSQL();
                Diferenca := 0;

             end else if Diferenca < 0  then begin

                DM.qAux2.ClosE();
                DM.qAux2.SQL.Text := 'UPDATE mensalidades SET valorjuros = :valor WHERE cd_mensalidade = ' + IntToStr(CdMensa);
                DM.qAux2.ParamByName('valor').AsCurrency := ValorJuros + (Diferenca * -1 );
                Dm.qAux2.ExecSQL();
                Diferenca := 0;
                
             end;  

          end else begin

             DM.tblMensalidades.Next();
          end;



       end;


    // Fim do primeiro processo


    end else begin



    if ssCtrl in Shift then begin

       if not (tblMensalidadesSituacao.AsInteger in [0, 1]) then Abort;

       if not DM.UsuarioLogado.TemPermissao( 2013, npIncluir, True ) then Abort;

       if tblMensalidadesValorPago.AsCurrency < (tblMensalidadesValorBruto.AsCurrency +
                                                 tblMensalidadesValorExtra.AsCurrency +
                                                 tblMensalidadesValorJuros.AsCurrency -
                                                 tblMensalidadesValorDesconto.AsCurrency -
                                                 tblMensalidadesDescontoExtra.AsCurrency)
       then begin
          if Mensagem('Deseja realmente gerar a parcela parcial da diferença?', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
          <> mrYEs then Abort;

// Gerar o Vencimento na mesma data do Vencimento Original
//          if tblMensalidadesDataPagamento.AsDateTime <= tblMensalidadesDataVencimento.AsDateTime then
//             DtVencimento := tblMensalidadesDataVencimento.AsDateTime
//          else
//             DtVencimento := tblMensalidadesDataPagamento.AsDateTime ;

          DtVencimento := tblMensalidadesDataVencimento.AsDateTime;

          DM.GerarMensalidade(
            tblMensalidadesCodigoAluno.AsInteger,
            tblMensalidadesParcela.AsInteger,
            tblMensalidadesTurma.AsString,
            (tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency +
              tblMensalidadesValorJuros.AsCurrency - tblMensalidadesValorDesconto.AsCurrency -
              tblMensalidadesDescontoExtra.AsCurrency) - tblMensalidadesValorPago.AsCurrency,
            0,
            tblMensalidadesAnoSemestre.AsInteger,
            DtVencimento, tblMensalidadesdt_competencia.AsDateTime,
            2, tblMensalidadescurso.AsString,
            tblMensalidadesDepto.AsInteger,
            1, tblMensalidadescd_mensalidade_origem.AsInteger,
            0, 0, 'Parcial de ' + tblMensalidadesds_historico.AsString,
            tblMensalidadescd_tipo_titulo.AsInteger
            , tblMensalidadescd_plano_conta.AsInteger
            , tblMensalidadescd_centro_custo.AsInteger
            , 0
            , 0
            , 'N'
            , 0
            , 0
            , 10
            , 0
            , tblMensalidadescd_resp.AsInteger
            , tblMensalidadescd_coligada.AsInteger
             );

          // Atualizar a situação da Parcela de Origem

          with qyTemp1 do begin
            Close;
            SQL.Clear;
            SQL.Add(
            ' UPDATE mensalidades                        ' +
            ' SET situacao = 1                           ' +
            ' WHERE                                      ' +
            '   cd_mensalidade = :CdMensalidade          '
            );
            ParamByName('CdMensalidade').AsInteger := tblMensalidadescd_mensalidade.AsInteger;
            ExecSQL;
          end;

          Filtra;

          Abort;

       end;

    end;
    end;



end;

function TfrmMensalidades.TemChequePendente(CodMensalidade: Integer): Boolean;
begin
   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Text :=
      ' SELECT COUNT(*) QTD FROM fin_cheques fc, fin_cheques_mensalidades fcm  ' +
      ' WHERE  ' +
      '    fc.cd_cheque = fcm.cd_cheque AND ' +
      '    fc.cd_situacao = 0 AND fcm.cd_mensalidade = ' + IntToStr( CodMensalidade );
   qyAux.Open();

   result := (qyAux.FieldByName('QTD').AsInteger > 0);
end;

function TfrmMensalidades.TemChequeDepositado(CodMensalidade: Integer): Boolean;
begin
   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Text :=
      ' SELECT COUNT(*) QTD FROM fin_cheques fc, fin_cheques_mensalidades fcm  ' +
      ' WHERE  ' +
      '    fc.cd_cheque = fcm.cd_cheque AND ' +
      '    fc.cd_situacao = 1 AND fcm.cd_mensalidade = ' + IntToStr( CodMensalidade );
   qyAux.Open();

   result := (qyAux.FieldByName('QTD').AsInteger > 0);
end;


procedure TfrmMensalidades.sbCobrancaClick(Sender: TObject);
var
   Perm1, Perm2: Boolean;
   cd_aluno : Longint;
   nm_aluno : String;
begin
   Perm1 := DM.UsuarioLogado.TemPermissao(2053, npAcesso, False);
   Perm2 := DM.UsuarioLogado.TemPermissao(2065, npAcesso, False);

   if Perm1 or Perm2 then
   begin
      if not PrincipalForm.ProcuraForm(frmCobranca) then
         Application.CreateForm(TfrmCobranca, frmCobranca);
         
      nm_aluno := tblMensalidadesNomeAluno.AsString;
      cd_aluno := tblMensalidadescodigoaluno.AsInteger;

      { Verifica se tem codigo do aluno e nome para filtrar na
       planilha de cobranca. Se não tiver registro selecionado
       na planilha de recebimentos, pega o filtro geral }
      if ( cd_aluno = 0 ) then
         cd_aluno := lngCodigoAluno;

      if ( nm_aluno = '' ) then
         nm_aluno := sNomeAluno;
         
      frmCobranca.LimpaFiltros;
      frmCobranca.edAluno.Text := nm_aluno;
      frmCobranca.AlunoID := cd_aluno;
      frmCobranca.Filtrar;
      frmCobranca.Show;
   end;

   if (not Perm1) and (not Perm2) then
   begin
      DM.UsuarioLogado.TemPermissao(2053, npAcesso, True)
   end;
end;

procedure TfrmMensalidades.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(grd)), 'planilha_mensalidades_campos');
end;

procedure TfrmMensalidades.btnNegociarClick(Sender: TObject);
var
   sqlOriginal : String;
   possuiParcelasPendentes : Boolean;
begin
   if tblMensalidades.IsEmpty() then Exit;
   if not DM.UsuarioLogado.TemPermissao( 2017, npAcesso, True ) then Exit;

   // Conferir Bloqueio de Alterações por data
   // DataHoje é utilizada para cancelar o título.
   // Essa verificação proteje caso o usuário tenha trocado a data do servidor.
   if DM.EstaBloqueado(DataHoje, True) then Exit;

   sqlOriginal := qryNegocia.SQL.Text;
   qryNegocia.ParamByName('codigoaluno').AsString := Format('%d', [tblMensalidadesCodigoAluno.AsInteger]);

   if (not (DM.variavel_parametro('financeiro_negociar_parcelas_pagas') = 'S')) then begin
     qryNegocia.SQL.Add( ' AND (men.situacao = 2 OR men.situacao = 10) ' );
   end;

   // Incluí os filtros extras configurados na tabela parametros que são definidos pelo cliente, o padrão é '' (string vazia)
   qryNegocia.SQL.Add( DM.variavel_parametro('negociacao_filtros_extras') );
   qryNegocia.Open();

   possuiParcelasPendentes := (qryNegocia.RecordCount <> 0);

   qryNegocia.Close;
   qryNegocia.SQL.Text := sqlOriginal;

   //Se não tem parcelas pendentes verificar se tem negociação antiga pra mostrar
   if not possuiParcelasPendentes then
   begin
      qyNegociaAnterior.Close;
      qyNegociaAnterior.ParamByName('cd_pessoa').AsInteger := tblMensalidadesCodigoAluno.AsInteger;
      qyNegociaAnterior.Open;

      if qyNegociaAnterior.RecordCount = 0 then
      begin
         Mensagem('Não há títulos em aberto nem negociações realizadas para esta pessoa.', 'Atenção', MB_OK+MB_ICONWARNING, Handle );
         exit;
      end;
   end;

   //Se chegou até aqui tem de abrir a tela
   Application.CreateForm(TfrmNegociacao, frmNegociacao);
   frmNegociacao.NomeAluno := tblMensalidadesNomeAluno.AsString;
   frmNegociacao.CodigoAluno := tblMensalidadesCodigoAluno.AsInteger;
   frmNegociacao.carregaTela;

   frmNegociacao.qyNegociaAnterior.Close;
   frmNegociacao.qyNegociaAnterior.ParamByName('cd_pessoa').AsInteger := tblMensalidadesCodigoAluno.AsInteger;
   frmNegociacao.qyNegociaAnterior.Open;

   //Se não possui pendentes carrega a tela de
   if not possuiParcelasPendentes then
   begin
   // Carrega as parcelas de negociações anteriores
     frmNegociacao.qyParcAtual.Close();
     frmNegociacao.qyParcAtual.Open();
     frmNegociacao.qyParcNovas.Close();
     frmNegociacao.qyParcNovas.Open();

     //Indica de que sera apenas aberto para visualização
     frmNegociacao.Tag := 1;

     // Troca a aba para negociações anteriores
     frmNegociacao.PageControl1.ActivePageIndex := 1;
   end;

   frmNegociacao.Show;
end;

end.
