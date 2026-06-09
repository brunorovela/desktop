unit uTesouraria_gerar;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, uDM, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls,
  Grids, DBGrids, ComCtrls, Main, General, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset,
  UMComboBox, uItemCompromisso,
  uFinApropriaTesouraria, Contnrs, UMDateTimePicker;

type

  TEstado = (Inserir, Alterar, Estornar, Confirmar, AlteracaoSimplificada, AlterarTransferencia);

  Tfrm_Tesouraria_gerar = class(TForm)
    pnTitulo: TPanel;
    qyPlano_Contas: TUMZQuery;
    qyCentro_Custos: TUMZQuery;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    pgApropriacao: TPageControl;
    tsSemApropriacao: TTabSheet;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    sbMais_semApropriacao: TSpeedButton;
    qyAcao: TUMZQuery;
    Label3: TLabel;
    cbAcaoMovimento: TComboBox;
    edCodConta: TEdit;
    cbPlanoConta: TComboBox;
    edHistorico: TEdit;
    edNroDocumento: TEdit;
    edValorDinheiro: TEdit;
    edCodCentro: TEdit;
    cbCentro: TComboBox;
    edValorCheque: TEdit;
    Label1: TLabel;
    qyCentro_Custosds_centro: TStringField;
    qyCentro_Custosds_observacao: TMemoField;
    qyCentro_Custoscd_classificacao: TStringField;
    qyCentro_Custostp_centro: TSmallintField;
    qyCentro_CustosdesClassificacaoDesc: TStringField;
    qyPlano_Contasds_conta: TStringField;
    qyPlano_Contasds_observacao: TMemoField;
    qyPlano_Contascd_classificacao: TStringField;
    qyPlano_Contastp_conta: TSmallintField;
    qyPlano_Contastp_entrada_saida: TSmallintField;
    Label7: TLabel;
    edNroCheque: TEdit;
    sbConta: TSpeedButton;
    qyPlano_Contascd_conta: TLargeintField;
    qyPlano_Contascd_apropriacao: TIntegerField;
    qyCentro_Custoscd_centro: TLargeintField;
    qyCentro_Custoscd_grupo: TLargeintField;
    tsComApropriacao: TTabSheet;
    pnlDireita: TPanel;
    sgGridApropriacoes: TStringGrid;
    sbCriterioInserir: TSpeedButton;
    cmbCriterioApropriacao: TUMComboBox;
    sbCriterioApagar: TSpeedButton;
    sbCriterioEditar: TSpeedButton;
    Label2: TLabel;
    cbUnidadeEnsino: TUMComboBox;
    qyPlano_Contascd_coligada_matriz: TIntegerField;
    qyCentro_Custoscd_coligada_matriz: TIntegerField;
    btnConfirmarIncluir: TBitBtn;
    umdtLancamento: TUMDateTimePicker;
    qryColigadas: TUMZQuery;
    qryColigadascd_coligada: TIntegerField;
    qryColigadasnm_coligada: TStringField;
    qryColigadassn_bloquear_financeiro: TSmallintField;
    qryColigadasdt_bloqueio_financeiro: TDateField;
    qryColigadassn_bloquear_boleto: TSmallintField;
    qryColigadasdt_bloqueio_boleto: TDateField;
    SpeedButton1: TSpeedButton;
    cmbHistorico: TUMComboBox;
    procedure cmbHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbHistoricoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure umdtLancamentoChangeDate(Sender: TObject);
    procedure umdtLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarIncluirClick(Sender: TObject);
    procedure cmbCriterioApropriacaoKeyPress(Sender: TObject; var Key: Char);
    procedure cbUnidadeEnsinoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure sbCriterioApagarClick(Sender: TObject);
    procedure sgGridApropriacoesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbCriterioEditarClick(Sender: TObject);
    procedure sbCriterioInserirClick(Sender: TObject);
    procedure cmbCriterioApropriacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbContaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qyCentro_CustosCalcFields(DataSet: TDataSet);
    procedure pgApropriacaoEnter(Sender: TObject);
    procedure btnConfirmarFecharClick(Sender: TObject);
    procedure edCodContaKeyPress(Sender: TObject; var Key: Char);
    procedure edCodContaExit(Sender: TObject);
    procedure cbAcaoMovimentoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodCentroKeyPress(Sender: TObject; var Key: Char);
    procedure cbPlanoContaChange(Sender: TObject);
    procedure edCodCentroExit(Sender: TObject);
    procedure cbPlanoContaKeyPress(Sender: TObject; var Key: Char);
    procedure edHistoricoKeyPress(Sender: TObject; var Key: Char);
    procedure edNroDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edValorDinheiroKeyPress(Sender: TObject; var Key: Char);
    procedure dtpLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure dtpLiberacaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbCentroKeyPress(Sender: TObject; var Key: Char);
    procedure cbCentroChange(Sender: TObject);
    procedure edValorDinheiroExit(Sender: TObject);
    procedure getListaHistorico();
    procedure atualizaListaHistorico();
  strict private
      procedure CarregarColigadas();

  private
    { Private declarations }
    objApropriacao    : TFinApropriaTesouraria;
    ListaAcao         : Array of Integer;
    ListaPlanoContas  : Array of Integer;
    ListaCentroCustos : Array of Integer;

    iTpEntradaSaida : Integer;
    iConta          : Integer;
    iOrigem         : Integer;
    cd_apropriacao_selecionada: integer;
    Confirmou       : Boolean;
    cd_compromisso_principal  : string;
    function RegistraMovimentacaoBase: Integer;
    procedure ConfirmarMovimentacao;
    procedure selecionaApropriacao(cd_titulo_principal, cd_coligada, cd_conta,
      cd_centro: string);
    function getCodigoCompromissoPrincipal: string;
    procedure AjustaValoresApropriacoes;
    function getformataValorParaObjeto(valor: double): string;
    procedure MontaObjetosApropriacoes(cd_apropriacao: integer);
    procedure carregaApropriacaoGrid;
    function formataValor(valor: double): string;
    function BuscaDescricaoCentroCusto(cd_centro: string): string;
    function substituiCaracter(valor, str_antigo, str_novo: string): string;
    function getValorDoObjeto(valor: string): string;
    procedure limpaGridApropriacoes;
    function BuscaDescricaoConta(cd_conta: string): string;

    Procedure MontaCombo(DataSet : TUMZQuery; combo : TComboBox; Var ListaCodigos : Array of Integer);

    Function RegistrarMovimentacao : Integer;
    Function RegistrarApropriacao(CodigoMovimentoAux : Integer)  : boolean;
    Function AtualizarApropriacao(CodigoMovimentoAux : Integer)  : boolean;

    Function ProcuraCodigo(codigo : Integer; ListaCodigos : Array of Integer) : Integer;

    Procedure ResgataApropriacao(CodigoMovimentoAux : Integer);

    function getSaldoConta: Double;

  public

    { Public declarations }
    ListaApropriacoes : TObjectList;
    tipoEstado        : TEstado;
    FormaPgto         : Integer;
    CodigoAcao        : Integer;
    CodigoMovimento   : Integer;
    CodigoConta       : Integer;
    Historico         : String;
    NroDocumento      : String;
    ValorDinheiro     : Currency;
    ValorCheque       : Currency;
    DataLancamento    : TDateTime;
    DataLiberacao     : TDateTime;
    CodigoCentro      : Integer;
    CodigoTitulo      : Integer;
    CodigoPreparacao  : Integer;
    NumeroCheque      : String;
    CodigoMensalidade : Integer;
    CodigoTransfere   : Integer;

    // Indica a coligada que irá vir selecionada
    cd_coligada_selecionada: Integer; // Esta é a coligada do CAIXA apenas
    cd_coligada_apropria : Integer; //Esta é a coligada da apropriação, para fins de alteração

    // Indica se deve apresentar o botão Confirmar e Incluir
    apresentarConfirmarIncluir: Boolean;

    // Em certos casos podemos não querer deichar que o usuário selecione uma
    // nova coligada nesta tela, portanto bloqueamos
    bloqueia_coligadas: Boolean;

    recebendo: boolean; 

    Function GeraMovimentacao(tpEntradaSaida : Word; Conta : Integer; Origem : Word; cd_coligada : Integer) : Integer;

  end;

var
  frm_Tesouraria_gerar: Tfrm_Tesouraria_gerar;

implementation

uses uClassMovimento, Math, uSelConta, uEstorno, uUsuario, uListaColigadas,
   uColigada, uTesouraria_Planilha, UCompromisso_apropria_altera_caixa, uBuscaCentro;

{$R *.dfm}

Function Tfrm_Tesouraria_gerar.GeraMovimentacao(tpEntradaSaida : Word; Conta : Integer; Origem : Word; cd_coligada : Integer) : Integer;
Var
   iCodMovimento  : Integer;
   CurValorDin    : Currency;
   CurValorChe    : Currency;
   qyAltera       : TUMZQuery;
   i,cd_conta     : Integer;
   sChave         : String;
begin

   // Esta função configura a tela de geraçao de movimentaçao, conforme ele foi chamada
   // A geração pode ter vindo do planilha de compromissos (Baixa), ou diretamente da tesouraria....

   // Movimentação que possui vínculo com mensalidade permite apropriação
   tsComApropriacao.TabVisible := CodigoMensalidade = 0;

   // Selecionar as ações disponíveis para o lançamento
   qyAcao.Close();
   qyAcao.SQL.Clear();
   
   qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento   ');
   qyAcao.SQL.Add('where sn_ativo = ''S'' AND cd_origem = ' + IntToStr(Origem));

   // Se foi passada uma ação, não permitir seleção de outra Ação
   
   if CodigoAcao > 0 then begin
     qyAcao.SQL.Add(' and cd_acao = ' + IntToStr(CodigoAcao) )
   end else begin
     qyAcao.SQL.Add(' and tp_entrada_saida = ' + IntToStr(tpEntradaSaida) );
     qyAcao.SQL.Add(' and cd_acao_automatica  is null ');
   end;

   qyAcao.SQL.Add(' ORDER by ds_acao ');

   qyAcao.Open();

   { Desativado em 03/05/2019 -
   if qyAcao.Eof then
   begin
       // Nenhuma Acão Disponível, não é possível gerar a Movimentação
       Mensagem('Não existe Ações de Movimento configuradas para essa operação', 'Atenção', MB_OK + MB_ICONWARNING);
       result := -1;
       Exit;
   end;
   }
   // Fim da Ação

   // Abrir o Plano de Contas
   qyPlano_contas.Close();
   qyPlano_Contas.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyPlano_Contas.Open();
   qyPlano_Contas.FetchAll();


   // Abrir o Centro de Custos
   qyCentro_Custos.close();
   qyCentro_Custos.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyCentro_Custos.Open();
   qyCentro_Custos.FetchAll();

   if qyPlano_Contas.RecordCount <= 0 then
   begin
       { Verificar se tem plano de contas }
       Mensagem('Nenhum plano de contas cadastrado para lançamento.', 'Atenção', MB_OK + MB_ICONWARNING);
       result := -1;
       Exit;
   end;

   if qyCentro_Custos.RecordCount <= 0 then
   begin
       { Verificar se tem plano de contas }
       Mensagem('Nenhum centro de custos cadastrado para lançamento.', 'Atenção', MB_OK + MB_ICONWARNING);
       result := -1;
       Exit;
   end;

   SetLength(ListaAcao, qyAcao.RecordCount);
   MontaCombo(qyAcao, cbAcaoMovimento, ListaAcao );

   SetLength(ListaPlanoContas, qyPlano_Contas.RecordCount);
   MontaCombo(qyPlano_Contas, cbPlanoConta, ListaPlanoContas);

   if cbPlanoConta.ItemIndex = 0 then begin
      edCodConta.Text := IntToStr(ListaPlanoContas[cbPlanoConta.ItemIndex]);
   end;

   SetLength(ListaCentroCustos, qyCentro_Custos.RecordCount);
   MontaCombo(qyCentro_Custos, cbCentro, ListaCentroCustos);

   if cbCentro.ItemIndex = 0 then begin
      edCodCentro.Text := IntToStr(ListaCentroCustos[cbCentro.ItemIndex]);
   end;

   iConta := Conta;
   iTpEntradaSaida := tpEntradaSaida;
   iOrigem := Origem;

   umdtLancamento.Date := Date;

   if tipoEstado in [Estornar, Alterar, Confirmar, AlteracaoSimplificada, AlterarTransferencia] then
   begin

       if CodigoMovimento > 0 then
          ResgataApropriacao(CodigoMovimento);

       cbAcaoMovimento.ItemIndex := ProcuraCodigo(CodigoAcao, ListaAcao);

       edCodConta.Text := IntToStr(CodigoConta);
       cbPlanoConta.ItemIndex := ProcuraCodigo(CodigoConta, ListaPlanoContas);

       edCodCentro.Text := IntToStr(CodigoCentro);
       cbCentro.ItemIndex := ProcuraCodigo(CodigoCentro, ListaCentroCustos);

       edHistorico.Text := Historico;
       edNroDocumento.Text := NroDocumento;
       edNroCheque.Text := NumeroCheque;
       edValorDinheiro.Text := FloatToStrF(ValorDinheiro, ffFixed, 12, 2);
       edVAlorCheque.Text := FloatToStrF(ValorCheque, ffFixed, 12, 2);
       umdtLancamento.Date := DataLancamento;

       umdtLancamento.Enabled      := True;
       if tipoEstado in [Estornar] then begin

          pgApropriacao.Visible := False;

          cbAcaoMovimento.Enabled  := False;
          edCodConta.Enabled       := False;
          cbPlanoConta.Enabled     := False;

          edNroDocumento.Enabled   := False;
          edNroCheque.Enabled      := False;
          edValorDinheiro.Enabled  := False;
          edValorCheque.Enabled    := False;
          umdtLancamento.Enabled   := False;

       end
       else if tipoEstado in [Confirmar] then begin
          cbAcaoMovimento.Enabled  := False;

          pgApropriacao.Visible := False;

          edCodConta.Enabled       := False;
          cbPlanoConta.Enabled     := False;



       end
       else if tipoEstado in [AlteracaoSimplificada] then begin

          cbAcaoMovimento.Enabled  := False;
          edValorDinheiro.Enabled  := False;
          edValorCheque.Enabled    := False;
       end else if tipoEstado in [AlterarTransferencia] then  begin
          pgApropriacao.Visible := False;

          cbAcaoMovimento.Enabled  := False;
          edCodConta.Enabled       := False;
          cbPlanoConta.Enabled     := False;

          edValorDinheiro.Enabled  := False;
          edValorCheque.Enabled    := False;
          cbUnidadeEnsino.Enabled := False;
          edCodConta.Text := '';
          edCodCentro.Text :='';
       end;
   end;

   if edValorDinheiro.Text = '' then begin
      edValorDinheiro.Text := '0,00';
   end;
   if edValorCheque.Text = '' then begin
      edValorCheque.Text := '0,00';
   end;

   self.ShowModal();

   Result := RegistraMovimentacaoBase();

end;


Function Tfrm_Tesouraria_gerar.RegistraMovimentacaoBase() : Integer;
Var
   iCodMovimento  : Integer;
   CurValorDin    : Currency;
   CurValorChe    : Currency;
   qyAltera       : TUMZQuery;
   i              : Integer;
   sChave         : String;
   iMovOrigem     : Integer; // Incluido para corrigir um BUG não identificado

begin
    iMovOrigem := CodigoMovimento;

   if not Confirmou then begin
      Result := -1;
      exit;
   end;

   if tipoEstado in [Alterar,AlteracaoSimplificada, AlterarTransferencia] then
   begin
      RegistrarApropriacao(iMovOrigem);
      DM.CriarConsulta(qyAltera);
      qyAltera.SQL.Text :=
         ' UPDATE fin_mov_tesouraria   SET     ' +
         '    cd_acao = :CdAcao,               ' +
         '    ds_movimento = :DsMovimento,     ' +
         '    nr_documento = :NrDocumento,     ' +
         '    dt_movimento = :DtMovimento,     ' +
         '    vl_cheque    = :VlCheque,        ' +
         '    vl_dinheiro  = :VlDinheiro,      ' +
         '    vl_movimento = :VlMovimento,     ' +
         '    nr_cheque    = :NrCheque         ' +
         ' WHERE cd_movimento_te = :CdMovimento ' +
         '   AND cd_coligada = :CdColigada      ' +
         '   AND cd_caixa = :cdcaixa            ';

      qyAltera.ParamByName('CdAcao').AsInteger := ListaAcao[cbAcaoMovimento.ItemIndex];
      qyAltera.ParamByName('DsMovimento').AsString := edHistorico.Text;
      qyAltera.ParamByName('DsMovimento').AsString := edHistorico.Text;
      qyAltera.ParamByName('NrDocumento').AsString := edNroDocumento.Text;
      qyAltera.ParamByName('DtMovimento').AsDate := umdtLancamento.Date;
      qyAltera.ParamByName('VlCheque').AsFloat  := StrToCurr(edValorCheque.Text);
      qyAltera.ParamByName('VlDinheiro').AsFloat:= StrToCurr(edValorDinheiro.Text);
      qyAltera.ParamByName('VlMovimento').AsFloat:= StrToCurr(edValorCheque.Text) + StrToCurr(edValorDinheiro.Text);

      qyAltera.ParamByName('NrCheque').AsInteger :=  RC_StrToInt(edNroCheque.Text);

      qyAltera.ParamByName('CdMovimento').AsInteger := iMovOrigem;
      qyAltera.ParamByName('CdColigada').AsInteger :=  cd_coligada_selecionada;
      qyAltera.ParamByName('CdCaixa').AsInteger :=  iConta;

      if tipoEstado <> AlterarTransferencia  then begin
         AtualizarApropriacao(iMovOrigem);
      end;

      qyAltera.ExecSQL();

      if CodigoMensalidade > 0 then begin

         // Alterar a Data de Crédito na tabela de mensalidades
         DM.qAux2.Close();
         DM.qAux2.SQL.Text :=
           ' UPDATE mensalidades SET dt_credito = :dt_credito, cd_plano_conta = :cd_plano_conta, cd_centro_custo = :cd_centro_custo ' +
           '  WHERE cd_mensalidade = ' + IntToStr(CodigoMensalidade) +
           '    AND situacao in (0,1) ';
         DM.qAux2.ParamByName('dt_credito').AsString := FormatDateTime('yyyy-mm-dd', umdtLancamento.Date);
         DM.qAux2.ParamByName('cd_plano_conta').AsString := edCodConta.Text;
         DM.qAux2.ParamByName('cd_centro_custo').AsString := edCodCentro.Text;
         Dm.qAux2.ExecSQL();

      end;

      if CodigoTransfere > 0 then begin

         // Alterar a Data de Crédito na tabela de mensalidades
         DM.qAux2.Close();
         DM.qAux2.SQL.Text :=
           ' UPDATE fin_mov_tesouraria SET dt_movimento = :dt_movimento ' +
           '  WHERE cd_transfere = ' + IntToStr(CodigoTransfere);

         DM.qAux2.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', umdtLancamento.Date);
         Dm.qAux2.ExecSQL();

      end;

      sChave :=  IntToStr(iMovOrigem) + ';';
      sChave := sChave + IntToStr(iConta) + ';';
      SChave := sChave + IntToStr(cd_coligada_selecionada);

      DM.setLog(2009, 'Alteracao', sChave, cd_coligada_selecionada);

      // Atualização do Saldo

      Exit;
   end
   else begin
      iCodMovimento := RegistrarMovimentacao();
   end;

   // Verificar se é estorno
   FreeAndNil( qyAltera );
   DM.CriarConsulta(qyAltera);

   if tipoEstado = Estornar then begin

      qyAltera.SQL.Text :=
        ' SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria ';
      qyAltera.Open();

      i := qyAltera.FieldByName('ultimo').AsInteger + 1;

      qyAltera.Close();

      qyAltera.SQL.Text :=
        ' UPDATE fin_mov_tesouraria      ' +
        ' SET nr_estorno = ' + IntToStr(i) +
        ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
        ' WHERE cd_movimento_te in (' + IntToStr(iMovOrigem) + ', ' + IntToStr(iCodMovimento) + ') ';
      qyAltera.ExecSQL();

      // O estorno de um lançamento, deve excluir suas apropriações
      qyAltera.SQL.Text :=
        ' DELETE from fin_apropria_te      ' +
        ' WHERE cd_movimento_te = ' + IntToStr(iMovOrigem);
      qyAltera.ExecSQL();


      sChave := IntToStr(iMovOrigem) + ';';
      sChave := sChave + IntToStr(iConta) + ';';
      SChave := sChave + IntToStr(cd_coligada_selecionada);

      DM.setLog(2009, 'Estorno', sChave, cd_coligada_selecionada);

      Exit;

   end;

   curValorDin := StrToCurr(edValorDinheiro.Text);
   curValorChe := StrToCurr(edValorCheque.Text);

   sChave :=  IntToStr(iMovOrigem) + ';';
   sChave := sChave + IntToStr(iConta) + ';';
   SChave := sChave + IntToStr(cd_coligada_selecionada);

   // Baixa de um título
   if CodigoTitulo > 0 then begin

      // Apropriou diretamente do Contas a Pagar
      DM.setLog(2009, 'Inclusao', sChave, cd_coligada_selecionada, 'Baixa de Compromissos');

   end
   else // registro de lançamento
   if (iCodMovimento > 0) AND (tipoEstado <> Confirmar) then begin
      RegistrarApropriacao(iCodMovimento);
      DM.setLog(2009, 'Inclusao', sChave, cd_coligada_selecionada, 'Lançamento direto na tesouraria');
   end;

   FreeAndNil(qyAltera);

   // registrar apropriação de lançamentos manuais
   if (tipoEstado <> Confirmar) then begin
      RegistrarApropriacao(iMovOrigem);
   end;

   //insere as apropriações na base
   for i := 0 to ListaApropriacoes.Count - 1 do
   begin
      objApropriacao := (ListaApropriacoes.Items[i] as TFinApropriaTesouraria);
      objApropriacao := nil;
   end;

   Result := iCodMovimento;

end;



procedure Tfrm_Tesouraria_gerar.pgApropriacaoEnter(Sender: TObject);
begin
   if pgApropriacao.ActivePage = tsSemApropriacao then
   begin
      edCodCentro.SetFocus();
   end else
   if pgApropriacao.ActivePage = tsComApropriacao then
   begin
      cmbCriterioApropriacao.SetFocus();
   end;

end;

procedure Tfrm_Tesouraria_gerar.MontaCombo(DataSet: TUMZQuery;
  combo: TComboBox; var ListaCodigos : Array of Integer);
// Função usada para montar o Combo da Ação e dos Planos de Contas e Centros
var
  n : Word;
begin

    DataSet.First();
    n := 0;

    combo.Items.Clear();

    while not DataSet.Eof do
    begin

        ListaCodigos[n] := DataSet.Fields[0].AsInteger;
        combo.Items.Add(DataSet.Fields[1].AsString);

        INC(n);
        DataSet.Next();
    end;

    if combo.Items.Count > 1 then
       combo.ItemIndex := -1
    else
    begin
       combo.ItemIndex := 0;
    end

end;

procedure Tfrm_Tesouraria_gerar.btnConfirmarFecharClick(Sender: TObject);
begin
   ConfirmarMovimentacao();
   if Confirmou then
   begin
      close();
   end;
end;

procedure Tfrm_Tesouraria_gerar.btnConfirmarIncluirClick(Sender: TObject);
var
   i : Integer;
begin
   ConfirmarMovimentacao();

   if Confirmou then
   begin
      RegistraMovimentacaoBase();

      // Atualiza o form pai
      if frm_Tesouraria_Planilha <> nil then
      begin
         frm_Tesouraria_Planilha.Filtra;
      end;

      edHistorico.Text := '';
      edNroDocumento.Text := '';
      edValorDinheiro.Text := '0';
      edValorCheque.Text := '0';
      edNroCheque.Text := '';
      umdtLancamento.Date := Date;

      edCodCentro.Text := '';
      cbCentro.ItemIndex := -1;

      cmbCriterioApropriacao.ItemIndex := 0;
      
      ListaApropriacoes := TObjectList.Create;
      
      Self.carregaApropriacaoGrid();
      
      edCodConta.SetFocus;
      Confirmou := False;
   end;

   atualizaListaHistorico();
   
end;

procedure Tfrm_Tesouraria_gerar.ConfirmarMovimentacao();
var
   curValorDin, curValorChe, vlApropria : Currency;
   i : Integer;
   sChave : String;
   sChaves : String;
   bConflitoChaves : Boolean;
   valor, saldoConta: Double;
begin
   // Verificar se tem valor de movimentação

   // Quando é um lançamento Fixo, como o saldo inicial por exemplo,
   // não terá seleção de Plano de Contas e Centro de Custos ???????


   if (iTpEntradaSaida = 2) then
   begin

      saldoConta := getSaldoConta;

      try
         curValorDin := StrToCurr(edValorDinheiro.Text);
         curValorChe := StrToCurr(edValorCheque.Text);

         valor := curValorDin + curValorChe;

         if valor = 0 then
         begin
            raise Exception.Create('Informe o valor da movimentação!');
         end;

         //Se o valor da baixa é maior que o saldo da conta
         if valor > saldoConta  then
         begin
            //Se não possui permissão bloqueia
            if not(DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'UMFinanceiro.MovimentacoesValoresSuperioresCaixas', npAcesso, False )) then
            begin
               Mensagem('O valor informado é superior ao saldo da conta (Saldo de atual de: ' + FormatFloat('###,###,#0.00',saldoConta) + ')', 'Atenção', MB_OK + MB_ICONWARNING);
               exit;
            end
            else
            begin

            if not(DM.UsuarioLogado.TemPermissao( DM.UsuarioLogado.Pessoa.Codigo, 'UMFinanceiro.MovimentacoesValoresSuperioresCaixas', npEspecial, False )) then
            begin

               //Se não possui permissão especial (31) pergunta se deseja continuar
               if MensagemCustomizavel( 'O valor informado é superior ao saldo da conta (Saldo de atual de R$ ' +
                     FormatFloat('###,###,#0.00',saldoConta) + '), deseja continuar?',
                  mtInformation,
                  mbOKCancel,
                  ['Sim', 'Não'],
                  120,
                  mbCancel
               ) <> mrOk then
               begin
                  exit;
               end;

            end;
         end;
      end;

      except
         Mensagem('Informe o valor da movimentação.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
         edValorDinheiro.SetFocus;
         exit;
      end;
      
   end;


   // Bloqueio de Data;
   if DM.EstaBloqueado(umdtLancamento.Date, true) then Exit;



   if  not (tipoEstado in [Estornar, Alterar, Confirmar, AlteracaoSimplificada, AlterarTransferencia] )then
   begin

       if cbUnidadeEnsino.ItemIndex = -1 then
       begin
          Mensagem('Selecione uma Unidade de Ensino.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
          cbUnidadeEnsino.SetFocus;
          Exit;
       end;

      // Se está tentando salvar, sem as apropriações, então limpar o que tiver no array,
      // Para não checar abaixo;
      if pgApropriacao.ActivePageIndex = 1 then begin
         if ListaApropriacoes.Count >= 1 then begin
            edCodConta.Text := (ListaApropriacoes.items[0] as TFinApropriaTesouraria).getValorCampo('cd_conta');
            edCodCentro.Text :=   (ListaApropriacoes.items[0] as TFinApropriaTesouraria).getValorCampo('cd_centro');
         end else begin
            edCodConta.Text := '';
            edCodCentro.Text := '';
         end;
      end;

      if Trim(edCodConta.Text) <> '' then begin
        if ProcuraCodigo(RC_StrToInt(edCodConta.Text), ListaPlanoContas) < 0 then
        begin
          Mensagem('Plano de Contas inválido.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
          edCodConta.SetFocus();
          exit;
        end;
      end else begin
          if ListaApropriacoes.Count <= 0 then begin
             Mensagem('Você precisa selecionar uma conta para efetuar o lançamento.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
             edCodConta.SetFocus();
             exit;
          end;
      end;

      if Trim(edCodCentro.Text) <> ''  then begin
        if ProcuraCodigo(RC_StrToInt(edCodCentro.Text), ListaCentroCustos) < 0 then
        begin
          Mensagem('Centro de Custos inválido.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
          edCodCentro.SetFocus;
          exit;
        end;
      end else begin
          if ListaApropriacoes.Count <= 0 then begin
             Mensagem('Você precisa selecionar um centro de custo para efetuar o lançamento.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
             edCodCentro.SetFocus;
             exit;
          end;
      end;

   end;

   if Trim(edHistorico.Text) = '' then
   begin
       Mensagem('Informe o histórico do movimento.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
       edHistorico.SetFocus;
       exit;
   end;
   
   try
      curValorDin := StrToCurr(edValorDinheiro.Text);
      curValorChe := StrToCurr(edValorCheque.Text);

      if (curValorDin + curValorChe) = 0 then
      begin
         raise Exception.Create('Informe o valor da movimentação!');
      end;

   except
      Mensagem('Informe o valor da movimentação.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      edValorDinheiro.SetFocus;
      exit;
   end;

   // Verificar Valores da Apropriação.
   vlApropria := 0;

   // Lógica utilizada para ver se o usuário inseriu mais de uma CONTA x CENTRO igual.
   bConflitoChaves := false;

   if (pgApropriacao.ActivePage = tsComApropriacao) and (ListaApropriacoes <> nil) then
   begin
     sChaves := '';

     for I := 0 to ListaApropriacoes.count - 1 do
     begin
        vlApropria := vlApropria +  StrToCurr(substituiCaracter((ListaApropriacoes.items[i] as TFinApropriaTesouraria).getValorCampo('vl_movimento'),'.',','));

        sChave := '|' + (ListaApropriacoes.items[i] as TFinApropriaTesouraria).getValorCampo('cd_conta') + '-' + (ListaApropriacoes.items[i] as TFinApropriaTesouraria).getValorCampo('cd_centro');

        if Pos(sChave, sChaves) > 0 then begin
            bConflitoChaves := true;
        end;

        sChaves := sChaves + sChave;

     end;

   end else begin
      vlApropria :=  curValorDin + curValorChe;
   end;

   if bConflitoChaves then begin
      Mensagem('Você não pode selecionar uma combinação de conta e centro de custo iguais nas apropriações.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      edValorDinheiro.SetFocus;
      exit; 
   end;

   if RoundFloat(vlApropria, 2) <> RoundFloat(curValorDin + curValorChe, 2) then begin
      Mensagem('A soma dos valores da apropriação é diferente do valor total do lançamento.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      edValorDinheiro.SetFocus;
      exit;
   end;    

   Confirmou := True;
     //insere as apropriações na base


end;

function Tfrm_Tesouraria_gerar.RegistrarMovimentacao: Integer;
{ Registra a movimentação na tabela de movimento }
Var
   movimento : TMovimento;
   cd_movimento_te : Integer;
begin

   movimento := TMovimento.Create;

   with movimento do
   begin

      CodAcao         := ListaAcao[cbAcaoMovimento.ItemIndex];
      Historico       := edHistorico.Text;
      NumeroDocumento := edNroDocumento.Text;
      NumeroDoCheque  := RC_StrToInt(edNroCheque.Text);
      ValorMovimento  := StrToCurr(edValorDinheiro.Text) + StrToCurr(edValorCheque.Text);
      ValorEmDinheiro := StrToCurr(edValorDinheiro.Text);
      ValorEmCheque   := StrToCurr(edValorCheque.Text);
      Origem          := iOrigem;
      EntradaSaida    := iTpEntradaSaida;
      DataMovimento   := umdtLancamento.Date;
      CodigoTitulo    := Self.CodigoTitulo;
      FormaDePagamento := Self.FormaPgto;

      // Coligada := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;

      cd_movimento_te := RegistrarMovimentacaoTe(iConta);

      result := CodigoMovimento;

   end;

   if tipoEstado = Estornar then
   begin
    if ( frmEstorno = nil ) then
       Application.CreateForm(TfrmEstorno , frmEstorno);

    if( frmEstorno.motivoEstorno =  '')then begin
       frmEstorno.ShowModal;
     end;
     movimento.registraEstorno(
       cd_movimento_te,
       iConta,
       0,
       movimento.Coligada,
       dm.iCdPessoaLogado,
       movimento.DataMovimento,
       frmEstorno.motivoEstorno,
       0
     );
     FreeAndNil(frmEstorno);
   end;


   Movimento.free;



end;

procedure Tfrm_Tesouraria_gerar.edCodContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin

       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
       Exit;

   end
   else
   if not (key in ['0'..'9',#8]) then
   begin

       Key := #0;
       exit;

   end;
end;

procedure Tfrm_Tesouraria_gerar.edCodContaExit(Sender: TObject);
begin
  cbPlanoConta.ItemIndex := ProcuraCodigo(RC_StrToInt(edCodConta.Text), ListaPlanoContas);
end;


function Tfrm_Tesouraria_gerar.ProcuraCodigo(codigo: Integer;
  ListaCodigos: array of Integer): Integer;
var
   n : word;
begin
   result := -1;

   For n := 0 to Length(ListaCodigos) - 1 do
   begin
       if ListaCodigos[n] = Codigo then
       begin
          result := n;
          exit;
       end
   end;

end;

procedure Tfrm_Tesouraria_gerar.cbAcaoMovimentoKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

end;

procedure Tfrm_Tesouraria_gerar.edCodCentroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin

       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
       Exit;

   end
   else
   if not (key in ['0'..'9',#8]) then
   begin

       Key := #0;
       exit;

   end;

end;

procedure Tfrm_Tesouraria_gerar.cbPlanoContaChange(Sender: TObject);
begin
   edCodConta.Text := IntToStr(ListaPlanoContas[cbPlanoConta.ItemIndex]);
end;

procedure Tfrm_Tesouraria_gerar.edCodCentroExit(Sender: TObject);
begin
   cbCentro.ItemIndex := ProcuraCodigo(RC_StrToInt(edCodCentro.Text), ListaCentroCustos);
end;

procedure Tfrm_Tesouraria_gerar.cbPlanoContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

   if Key = #8 then begin
      cbPlanoConta.ItemIndex := -1;
      Key := #0;
   end
end;

procedure Tfrm_Tesouraria_gerar.cbUnidadeEnsinoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
   
end;

procedure Tfrm_Tesouraria_gerar.MontaObjetosApropriacoes( cd_apropriacao: integer );
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

   cd_titulo            : string;
   
   arrCentrosFilhos     : TList;
begin
   vl_despesa     := StrToFloat(edValorDinheiro.Text) + StrToFloat(edValorCheque.Text);
   cd_coligada    := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;

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
            arrCentrosFilhos,
            True
         );

         for I := 0 to arrCentrosFilhos.Count - 1 do
         begin

            if i = (arrCentrosFilhos.Count-1) then
            begin

               vl_centro_sintetico := (qyApropriacao.FieldByName('vl_apropriacao').AsFloat - vl_total_sintetico);

               vl_centro_sintetico := RoundFloat(vl_centro_sintetico, 2);

               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo('vl_movimento', FloatToStr(vl_centro_sintetico));

               Continue;

            end;

            if i < (arrCentrosFilhos.Count-1) then
            begin

               vl_centro_sintetico := qyApropriacao.FieldByName('vl_apropriacao').AsFloat / (arrCentrosFilhos.Count);

               vl_centro_sintetico := RoundFloat(vl_centro_sintetico, 2);

               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo('vl_movimento', FloatToStr(vl_centro_sintetico));

               vl_total_sintetico := vl_total_sintetico + vl_centro_sintetico;

            end;
         end;

         vl_total_sintetico := 0;
         vl_centro_sintetico := 0;

         for I := 0 to arrCentrosFilhos.Count - 1 do
         begin

            vl_apropriacao := StrToFloat(TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).getValorCampo('vl_movimento'));
            vl_total       := qyApropriacao.FieldByName('vl_total').AsCurrency;

            if cd_titulo <> '' then
            begin
               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo',    cd_titulo );
            end
            else
            begin
               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_titulo',    '' );
            end;

            TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_coligada',  IntToStr(cd_coligada) );

            //se houver uma seleção do plano de contas preenche o objeto apropriacao
            if cbPlanoConta.ItemIndex > -1 then
            begin
               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'cd_conta', IntToStr(ListaPlanoContas[cbPlanoConta.ItemIndex]) );
            end;

            if (arrCentrosFilhos.Count-1) = I then
            begin
               vl_apropriacao := qyApropriacao.FieldByName('vl_apropriacao').AsFloat;

               vl_percentual  := (vl_apropriacao / vl_total);

               vl_rateado     := RoundFloat(vl_despesa * vl_percentual, 2);

               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', FloatToStr(vl_rateado - vl_total_sintetico) );
            end;

            if (arrCentrosFilhos.Count-1) > I then
            begin
               vl_percentual  := (vl_apropriacao / vl_total);

               vl_rateado     := RoundFloat(vl_despesa * vl_percentual, 2);

               TFinApropriaTesouraria(arrCentrosFilhos.Items[i]).setValorCampo( 'vl_movimento', Self.getformataValorParaObjeto( RoundFloat(vl_rateado, 2) ) );

               vl_total_sintetico := vl_total_sintetico + RoundFloat(vl_rateado, 2);
            end;

            ListaApropriacoes.Add( TFinApropriaTesouraria(arrCentrosFilhos.Items[i]) );

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
           objApropriacao := TFinApropriaTesouraria.Create;

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
            if cbPlanoConta.ItemIndex > -1 then
            begin
               objApropriacao.setValorCampo( 'cd_conta', IntToStr(ListaPlanoContas[cbPlanoConta.ItemIndex]) );
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

procedure Tfrm_Tesouraria_gerar.AjustaValoresApropriacoes;
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
   vl_despesa     := RoundFloat(StrToFloat(edValorDinheiro.text)+ StrToFloat(edValorCheque.Text), 2);

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
            objApropriacao := (ListaApropriacoes.items[iApropriacao] as TFinApropriaTesouraria);

            //muda o . por , para conversão em double.
            vl_apropriacao := substituiCaracter( objApropriacao.getValorCampo('vl_movimento'), '.', ',');

            vl_movimento := StrToFloat( vl_apropriacao );

            vl_total := RoundFloat(vl_total, 2) + RoundFloat( vl_movimento, 2);
         end;

         //vl_total possui a soma até a penultima parcela.
         //a ultima apropriacao vai receber valor total da despesa - o vl_total
         //dessa forma a eventual diferença não deve existir.
         vl_ajustado    := RoundFloat( vl_despesa - vl_total, 2 );
         objApropriacao := (ListaApropriacoes.items[iTotalApropriacoes+1] as TFinApropriaTesouraria);
         vl_apropriacao := FloatToStrF( vl_ajustado, ffFixed, 15, 2 );

         vl_apropriacao := substituiCaracter(vl_apropriacao, ',', '.');

         objApropriacao.setValorCampo( 'vl_movimento', vl_apropriacao );
      end;
   end;

   objApropriacao := nil;
end;

function Tfrm_Tesouraria_gerar.getformataValorParaObjeto(valor: double) : string;
var
   valor_sem_ponto : string;
begin
   valor_sem_ponto := Self.substituiCaracter( FloatToStr (valor), '.', '' );
   Result := StringReplace( valor_sem_ponto, ',', '.', [rfReplaceAll, rfIgnoreCase]);
end;

function Tfrm_Tesouraria_gerar.getSaldoConta: Double;
var
   qyMovimentos, qyCalculaSaldo: TUMZQuery;
   tp_entrada_saida, cd_coligada, cd_coligada_conta, tp_conta, cd_mov_te: Integer;
   dt_abertura_caixa, dt_movimento: TDateTime;
   vl_movimento, SaldoAcumulado : Double;
begin

//Pega o saldo.
   dm.CriarConsulta(qyCalculaSaldo);
   dm.CriarConsulta(qyMovimentos);

   qyMovimentos.SQL.Text := ' '+
   'SELECT                                   '+
   '  fmt.cd_movimento_te as cd_mov_te, '+
   '  fmt.cd_coligada,                       '+
   '  fmt.dt_movimento,                      '+
   '  fcc.tp_conta,                          '+
   '  fmt.tp_entrada_saida,                  '+
   '  fmt.vl_movimento                       '+
   'FROM                                     '+
   '  fin_cadastro_contas fcc                '+
   '  INNER JOIN fin_mov_tesouraria fmt ON   '+
   '     (fmt.cd_caixa = fcc.cd_caixa)       '+
   'WHERE                                    '+
   '  fcc.cd_caixa = :cd_caixa               ';

   qyMovimentos.ParamByName('cd_caixa').AsInteger := iConta;
   qyMovimentos.Open;

   tp_conta := qyMovimentos.FieldByName('tp_conta').asInteger;
   cd_coligada_conta := qyMovimentos.FieldByName('cd_coligada').asInteger;
   
   dt_abertura_caixa := Date;

   //Se for conta caixa
   if tp_conta = 3 then
   begin
      qyCalculaSaldo.Close();
      qyCalculaSaldo.SQL.Text :=
      'SELECT '+
	   '  vl_saldo_abertura, '+
	   '  dt_abertura '+
      'FROM '+
	   '  fin_controle_caixa co '+
      'WHERE '+
	   '  cd_abertura_caixa = ( '+
      '     SELECT '+
		'        max(cd_abertura_caixa) '+
	   '     FROM '+
      '        fin_controle_caixa) '+
      '  AND cd_conta_banco = ' + IntToStr(iConta);
     qyCalculaSaldo.Open();

     SaldoAcumulado := qyCalculaSaldo.FieldByName('vl_saldo_abertura').AsFloat;
     dt_abertura_caixa := qyCalculaSaldo.FieldByName('dt_abertura').AsDateTime;
   end
   else
   begin
      qyCalculaSaldo.Close();
      qyCalculaSaldo.SQL.Text := ''+
      'SELECT '+
      '  GET_SALDO(:CD_CAIXA, :CD_COLIGADA, :DT_BASE, NULL) AS SALDO '+
      'FROM '+
      '  DUAL';

      qyCalculaSaldo.ParamByName('CD_CAIXA').AsInteger := iConta;
      qyCalculaSaldo.ParamByName('CD_COLIGADA').AsInteger := cd_coligada_conta;
      qyCalculaSaldo.ParamByName('DT_BASE').AsDate := Date;
      qyCalculaSaldo.Open;
      
      SaldoAcumulado := qyCalculaSaldo.FieldByName('SALDO').AsFloat;
      qyCalculaSaldo.Close;
   end;


   qyMovimentos.Close;
   qyMovimentos.SQL.Text := ' '+
   'SELECT                                   '+
   '  fmt.cd_movimento_te as cd_mov_te, '+
   '  fmt.cd_coligada,                       '+
   '  fmt.dt_movimento,                      '+
   '  fcc.tp_conta,                          '+
   '  fmt.tp_entrada_saida,                  '+
   '  fmt.vl_movimento                       '+
   'FROM                                     '+
   '  fin_cadastro_contas fcc                '+
   '  INNER JOIN fin_mov_tesouraria fmt ON   '+
   '     (fmt.cd_caixa = fcc.cd_caixa)       '+
   'WHERE                                    '+
   '  fcc.cd_caixa = :cd_caixa               '+
   '  AND DATE(dt_movimento) >= :data        '+
   '  AND DATE(dt_movimento) < :dataAmanha  ';

   qyMovimentos.ParamByName('cd_caixa').AsInteger := iConta;
   qyMovimentos.ParamByName('data').asDate := dt_abertura_caixa;
   qyMovimentos.ParamByName('dataAmanha').asDate := incDay(Date);
   qyMovimentos.Open;

   tp_conta := qyMovimentos.FieldByName('tp_conta').asInteger;
   cd_coligada := qyMovimentos.FieldByName('cd_coligada').asInteger;
   dt_movimento := qyMovimentos.FieldByName('dt_movimento').asDateTime;
   tp_entrada_saida := qyMovimentos.FieldByName('tp_entrada_saida').AsInteger;
   vl_movimento := qyMovimentos.FieldByName('vl_movimento').AsFloat;


   while not qyMovimentos.Eof do
   begin
      if qyMovimentos.FieldByName('tp_entrada_saida').AsInteger = 1 then begin
         SaldoAcumulado := SaldoAcumulado + qyMovimentos.FieldByName('vl_movimento').AsCurrency;
      end else begin
         SaldoAcumulado := SaldoAcumulado - qyMovimentos.FieldByName('vl_movimento').AsCurrency;
      end;

      qyMovimentos.Next;
   end;

   Result := SaldoAcumulado;      

end;

procedure Tfrm_Tesouraria_gerar.cmbCriterioApropriacaoChange(Sender: TObject);
var
   cd_apropriacao : integer;
begin
   if cmbCriterioApropriacao.ItemIndex > 0 then
   begin
   //   cmbCentroCusto.ItemIndex   := -1;
   //   painelApropriacao(true);

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
   else if cmbCriterioApropriacao.ItemIndex = 0 then
   begin
      if ListaApropriacoes = nil then
      begin
         ListaApropriacoes := TObjectList.Create();
      end;
      
      Self.limpaGridApropriacoes();
      Self.carregaApropriacaoGrid();

   end
   else
   begin
      if ListaApropriacoes <> nil then
      begin
         ListaApropriacoes.Clear;
         ListaApropriacoes := nil;
      end;
   end;
end;

procedure Tfrm_Tesouraria_gerar.cmbCriterioApropriacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
   
end;

{ Carrega as informações do HISTORICO na combo de seleção}
procedure Tfrm_Tesouraria_gerar.getListaHistorico;
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
   qyHistorico.SQL.Add('ORDER BY cd_historico         ');
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

procedure Tfrm_Tesouraria_gerar.cmbHistoricoChange(Sender: TObject);
var
   ds_historico : string;
begin
   ds_historico := '';

   if cmbHistorico.itemIndex > 0 then
   begin
      ds_historico := (cmbHistorico.Items.Objects[ cmbHistorico.itemIndex ] as TItemCompromisso).getDescricao;

      edHistorico.Text := ds_historico;
   end
   else
   begin
      edHistorico.Text := '';
   end;
end;

procedure Tfrm_Tesouraria_gerar.cmbHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure Tfrm_Tesouraria_gerar.atualizaListaHistorico;
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

function Tfrm_Tesouraria_gerar.formataValor(valor: double): string;
begin
   Result := FormatFloat( '###,###,##0.00', valor );
end;

function Tfrm_Tesouraria_gerar.BuscaDescricaoCentroCusto(
  cd_centro: string): string;
var
   qyCentroCusto     : TUMZQuery;
   ds_centro_custo   : string;
   cd_coligada       : integer;
begin
   ds_centro_custo   := '';
   qyCentroCusto     := nil;

   DM.CriarConsulta( qyCentroCusto );

   if trim(cd_centro) <> '' then
   begin
      qyCentroCusto.Close();
      qyCentroCusto.SQL.Clear;
      qyCentroCusto.SQL.Add('SELECT                                         ');
      qyCentroCusto.SQL.Add(' cd_centro, ds_centro                          ');
      qyCentroCusto.SQL.Add('FROM                                           ');
      qyCentroCusto.SQL.Add(' fin_config_centro_custos                      ');
      qyCentroCusto.SQL.Add('WHERE                                          ');
      qyCentroCusto.SQL.Add(' sn_ativo = 1                                  ');
      qyCentroCusto.SQL.Add(' AND cd_centro = ' + cd_centro                  );
      qyCentroCusto.SQL.Add(' AND cd_coligada_matriz = '+ IntToStr(
         DM.GetUsuarioLogado.GetColigadaLogada.Codigo
      ));
      qyCentroCusto.Open();

      ds_centro_custo := qyCentroCusto.FieldByName('ds_centro').AsString;

      qyCentroCusto.Close();
   end;

   FreeAndNil( qyCentroCusto );

   Result := ds_centro_custo;
end;


function Tfrm_Tesouraria_gerar.getValorDoObjeto(valor: string): string;
var
   valor_double : double;
begin
   valor_double   := StrToFloat( Self.substituiCaracter( valor, '.', ',' ));
   Result         := FloatToStr(valor_double);
end;

function Tfrm_Tesouraria_gerar.substituiCaracter(valor: string; str_antigo: string; str_novo: string): string;
begin
   Result := StringReplace( valor, str_antigo, str_novo, [rfReplaceAll, rfIgnoreCase] );
end;

procedure Tfrm_Tesouraria_gerar.umdtLancamentoChangeDate(Sender: TObject);
begin
  // O teste do bloqueio financeiro estava sendo feito de forma equivocada - conflito com código de coligada filha
 {  if(qryColigadassn_bloquear_financeiro.AsInteger = 1) then
   begin
      if(DM.convertDateTimeToDate(qryColigadasdt_bloqueio_financeiro.AsDateTime) > umdtLancamento.Date) then
      begin
         Mensagem('Você deve preencher uma data de lançamento depois da data do bloqueio.','Aviso',MB_OK + MB_ICONWARNING);
         umdtLancamento.date := qryColigadasdt_bloqueio_financeiro.AsDateTime;
      end;
   end;
  }
  // Forma correta de bloqueio financeiro: Por claudionor em 17/04/2017
   if DM.EstaBloqueado(umdtLancamento.Date, false) then
   begin
         Mensagem('Você deve preencher uma data de lançamento depois da data do bloqueio.','Aviso',MB_OK + MB_ICONWARNING);
         umdtLancamento.date := DM.DataBloqueioFinanceiro(umdtLancamento.Date);

   end;
   
end;

procedure Tfrm_Tesouraria_gerar.umdtLancamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;
end;

procedure Tfrm_Tesouraria_gerar.limpaGridApropriacoes;
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

function Tfrm_Tesouraria_gerar.BuscaDescricaoConta(cd_conta: string): string;
var
   qyPlanoConta      : TUMZQuery;
   ds_plano_conta    : string;
   cd_coligada       : integer;
begin
   ds_plano_conta    := '';
   qyPlanoConta      := nil;

   DM.CriarConsulta( qyPlanoConta );

   if trim(cd_conta) <> '' then
   begin
      qyPlanoConta.Close();
      qyPlanoConta.SQL.Clear;
      qyPlanoConta.SQL.Add('SELECT                                         ');
      qyPlanoConta.SQL.Add(' cd_conta, ds_conta                            ');
      qyPlanoConta.SQL.Add('FROM                                           ');
      qyPlanoConta.SQL.Add(' fin_config_plano_contas                       ');
      qyPlanoConta.SQL.Add('WHERE                                          ');
      qyPlanoConta.SQL.Add(' sn_ativo = 1                                  ');
      qyPlanoConta.SQL.Add(' AND cd_conta =  ' + cd_conta                   );
      qyPlanoConta.SQL.Add(' AND cd_coligada_matriz = '+ IntToStr(
         DM.GetUsuarioLogado.GetColigadaLogada.Codigo
      ));
      qyPlanoConta.Open();

      ds_plano_conta := qyPlanoConta.FieldByName('ds_conta').AsString;

      qyPlanoConta.Close();
   end;

   FreeAndNil( qyPlanoConta );

   Result := ds_plano_conta;
end;


procedure Tfrm_Tesouraria_gerar.edHistoricoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

end;

procedure Tfrm_Tesouraria_gerar.edNroDocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

end;

procedure Tfrm_Tesouraria_gerar.edValorDinheiroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if (key = ',') then
   begin
      if Pos(',', TEdit(Sender).Text) > 0 then
         key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_Tesouraria_gerar.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i : integer;
begin
   Action := caFree;

   for i := cmbHistorico.Items.Count - 1 downto 0 do
   begin
      (cmbHistorico.Items.Objects[i] as TItemCompromisso).Free;
   end;
   cmbHistorico.Clear;
end;

procedure Tfrm_Tesouraria_gerar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if (tipoEstado in [Estornar, Alterar, Confirmar, AlteracaoSimplificada]) AND Confirmou then begin

       if RoundFloat(StrToFloat(edValorDinheiro.Text) + StrToFloat(edValorCheque.Text), 2) <> RoundFloat(ValorDinheiro + ValorCheque,2) then begin

           CanClose := False;
           Mensagem('Não é possível efetuar alteração no total dos valores lançados', 'Atenção', MB_OK + MB_ICONWARNING );

       end;

    end;

end;

procedure Tfrm_Tesouraria_gerar.FormCreate(Sender: TObject);
begin
   CodigoMensalidade := 0;
   Self.apresentarConfirmarIncluir := False;
   Self.bloqueia_coligadas := False;
   qryColigadas.Close;
   qryColigadas.Open;
end;

procedure Tfrm_Tesouraria_gerar.FormShow(Sender: TObject);
var
   qyCriterios     : TUMZQuery;
   qryApropriacao  : TUMZQuery;
   objApropriacao  : TFinApropriaTesouraria;
   objItem        : TItemCompromisso;
   cd_apropriacao : string;
   ds_apropriacao : string;
begin
   cd_apropriacao := '';
   ds_apropriacao := '';
   qyCriterios    := nil;

   DM.CriarConsulta( qryApropriacao );
   
   if CodigoMovimento > 0 then begin
      // Somente ler a apropriação se não for inclusão
      qryApropriacao.close;
      qryApropriacao.SQL.Clear;
      qryApropriacao.SQL.Add('SELECT                         ');
      qryApropriacao.SQL.Add('  cd_movimento_te,             ');
      qryApropriacao.SQL.Add('  cd_conta,                    ');
      qryApropriacao.SQL.Add('  cd_coligada,                 ');
      qryApropriacao.SQL.Add('  cd_centro,                   ');
      qryApropriacao.SQL.Add('  vl_movimento,                ');
      qryApropriacao.SQL.Add('  nr_sequencia                 ');
      qryApropriacao.SQL.Add('FROM                           ');
      qryApropriacao.SQL.Add('  FIN_APROPRIA_TE              ');
      qryApropriacao.SQL.Add('WHERE                          ');
      qryApropriacao.SQL.Add('  cd_movimento_te = :cd_movimento_te');
      qryApropriacao.ParamByName('cd_movimento_te').AsInteger := CodigoMovimento;
      qryApropriacao.Open;

      // Alterar a coligada selecioonada, para a coligada já utilizada na apropriação
      if not qryApropriacao.Eof then begin
         Self.cd_coligada_apropria:= qryApropriacao.FieldByName('cd_coligada').AsInteger;
      end else begin
         Self.cd_coligada_apropria := Self.cd_coligada_selecionada;
      end;
   end else begin
       Self.cd_coligada_apropria := Self.cd_coligada_selecionada;
   end;

   CarregarColigadas();

   qryColigadas.Locate('cd_coligada',(cd_coligada_selecionada),[]);

   DM.CriarConsulta( qyCriterios   );

   qyCriterios.Close();
   qyCriterios.SQL.Clear;
   qyCriterios.SQL.Add('SELECT                             ');
   qyCriterios.SQL.Add('   cd_apropriacao, ds_apropriacao  ');
   qyCriterios.SQL.Add('FROM                               ');
   qyCriterios.SQL.Add('   fin_criterios_apropria          ');
   qyCriterios.SQL.Add('ORDER BY ds_apropriacao            ');
   qyCriterios.Open();



   //insere valor padrão na combo de seleção
   cd_apropriacao := 'manual';
   ds_apropriacao := 'Manual';

   objItem := TItemCompromisso.Create( cd_apropriacao, ds_apropriacao );

   cmbCriterioApropriacao.Items.AddObject( objItem.getDescricao, objItem );
   cmbCriterioApropriacao.ItemIndex := 0;

   while not qyCriterios.Eof do
   begin
      cd_apropriacao := qyCriterios.FieldByName('cd_apropriacao').AsString;
      ds_apropriacao := qyCriterios.FieldByName('ds_apropriacao').AsString;

      objItem := TItemCompromisso.Create( cd_apropriacao, ds_apropriacao );

      cmbCriterioApropriacao.Items.AddObject( objItem.getDescricao, objItem );

      qyCriterios.Next;
   end;

   FreeAndNil( qyCriterios );

   ListaApropriacoes := TObjectList.Create();

   pgApropriacao.ActivePageIndex := 0;
   pgApropriacao.Pages[0].TabVisible  := true;

   if CodigoMovimento > 0  then begin

      if (qryApropriacao.RecordCount > 1 ) then
      begin
        pgApropriacao.ActivePageIndex := 1;

        pgApropriacao.Pages[0].TabVisible  := false;
      end;

   end;
   pgApropriacao.Enabled := true;

   if CodigoMovimento > 0  then begin
      while not qryApropriacao.Eof do
      begin
        objApropriacao := TFinApropriaTesouraria.Create();
        objApropriacao.setValorCampo( 'cd_titulo',      qryApropriacao.FieldByName('cd_movimento_te').AsString);
        objApropriacao.setValorCampo( 'cd_coligada',    qryApropriacao.FieldByName('cd_coligada').AsString );
        objApropriacao.setValorCampo( 'cd_conta',       qryApropriacao.FieldByName('cd_conta').AsString  );
        objApropriacao.setValorCampo( 'cd_centro',      qryApropriacao.FieldByName('cd_centro').AsString );
        objApropriacao.setValorCampo( 'vl_movimento',   qryApropriacao.FieldByName('vl_movimento').AsString );
        ListaApropriacoes.Add(objApropriacao);
        objApropriacao := nil;
        qryApropriacao.Next;
      end;
   end;

   carregaApropriacaoGrid;

   if Self.bloqueia_coligadas then
   begin
      cbUnidadeEnsino.Enabled := False;         
   end;

   // Verifica se deve apresentar o botão de Confirmar/Incluir
   if not apresentarConfirmarIncluir then
   begin
      btnConfirmarIncluir.Enabled := false;
      btnConfirmarIncluir.Visible := false;

      btnConfirmar.Left := 192;
      btnCancelar.Left := 325;
   end;

   if  edNroCheque.Text <> '' then
      edNroCheque.ReadOnly := true;
   
   //lista de históricos
   Self.getListaHistorico();
   
end;

procedure Tfrm_Tesouraria_gerar.dtpLancamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

end;

procedure Tfrm_Tesouraria_gerar.dtpLiberacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

end;

procedure Tfrm_Tesouraria_gerar.btnCancelarClick(Sender: TObject);
begin
   Confirmou := False;
   close;
end;

procedure Tfrm_Tesouraria_gerar.cbCentroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then begin
      SelectNext(Sender As TWinControl, True, True );
      key := #0;
   end;

   if Key = #8 then begin
      cbCentro.ItemIndex := -1;
      Key := #0;
   end

end;

procedure Tfrm_Tesouraria_gerar.cbCentroChange(Sender: TObject);
begin
    edCodCentro.Text := IntToStr(ListaCentroCustos[cbCentro.ItemIndex]);
end;

function Tfrm_Tesouraria_gerar.RegistrarApropriacao(CodigoMovimentoAux : Integer): boolean;
var
   i : Integer;
   apropria : TUMZQuery;
begin
   // Apropriar um novo lançamento

   // Se não tiver Conta ou CEntro, ignorar a operação;

   if ( ((edCodConta.Text = '') OR (edCodConta.Text = '0')) AND
         ((edCodCentro.Text = '') OR (edCodCentro.Text = '0'))
       )
       AND (ListaApropriacoes = nil)
   then
      Exit;

   DM.CriarConsulta(apropria);
   apropria.SQL.Add(' DELETE            ');
   apropria.SQL.Add(' FROM              ');
   apropria.SQL.Add('   fin_apropria_te ');
   apropria.SQL.Add(' WHERE             ');
   apropria.SQL.Add('   cd_movimento_te = :cd_movimento_te ');
   apropria.ParamByName('cd_movimento_te').AsInteger := CodigoMovimentoAux;
   apropria.ExecSQL;

   if (pgApropriacao.ActivePage = tsComApropriacao) and  (ListaApropriacoes <> nil) then
   begin

     for I := 0 to ListaApropriacoes.count - 1 do
     begin
       with apropria do
       begin
           Close;
           SQL.Clear;
           SQL.Add(' INSERT INTO                                              ');
           SQL.Add('    fin_apropria_te                                       ');
           SQL.Add(' (                                                        ');
           SQL.Add('    cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento    ');
           SQL.Add(' )                                                        ');
           SQL.Add(' VALUES (                                                  ');
           SQL.Add('    :cd_movimento_te, :cd_coligada, :cd_conta, :cd_centro, :vl_movimento )');

           ParamByName('cd_movimento_te').AsInteger := CodigoMovimentoAux;
           ParamByName('cd_coligada').AsInteger := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;
           ParamByName('cd_conta').AsInteger := RC_StrToInt((ListaApropriacoes.items[i] as TFinApropriaTesouraria).getValorCampo('cd_conta'));
           ParamByName('cd_centro').AsInteger := RC_StrToInt((ListaApropriacoes.items[i] as TFinApropriaTesouraria).getValorCampo('cd_centro'));
           ParamByName('vl_movimento').AsFloat := StrToCurr(substituiCaracter((ListaApropriacoes.items[i] as TFinApropriaTesouraria).getValorCampo('vl_movimento'),'.',','));

           ExecSQL();

       end;
     end;

   end
   else
   begin
      with apropria do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' INSERT INTO                                              ');
         SQL.Add('    fin_apropria_te                                       ');
         SQL.Add(' (                                                        ');
         SQL.Add('    cd_movimento_te, cd_coligada, cd_conta, cd_centro, vl_movimento    ');
         SQL.Add(' )                                                        ');
         SQL.Add(' VALUES (                                                  ');
         SQL.Add('    :cd_movimento_te, :cd_coligada, :cd_conta, :cd_centro, :vl_movimento )');

         ParamByName('cd_movimento_te').AsInteger := CodigoMovimentoAux;
         ParamByName('cd_coligada').AsInteger := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;
         ParamByName('cd_conta').AsInteger := RC_StrToInt(edCodConta.Text);
         ParamByName('cd_centro').AsInteger := RC_StrToInt(edCodCentro.Text);
         ParamByName('vl_movimento').AsFloat := StrToCurr(edValorDinheiro.Text) + StrToCurr(edValorCheque.Text);
         ExecSQL();
      end;
   end;


   FreeAndNil(apropria);

end;

procedure Tfrm_Tesouraria_gerar.ResgataApropriacao( CodigoMovimentoAux: Integer );
var
   Apropria : TUMZQuery;
begin

   DM.CriarConsulta(Apropria);

   with apropria do begin

       Close();
       SQL.Clear;
       SQL.Add(' SELECT                                                   ');
       SQL.Add('    *                                                     ');
       SQL.Add(' FROM                                                     ');
       SQL.Add('    fin_apropria_te                                       ');
       SQL.Add(' WHERE                                                    ');
       SQL.Add('    cd_movimento_te = :cd_movimento_te                    ');

       { Quado permitir Apropriação, mudar isso }

       ParamByName('cd_movimento_te').AsInteger := CodigoMovimentoAux;

       Open();

       if not IsEmpty then begin
          CodigoConta := FieldByName('cd_conta').AsInteger;
          CodigoCentro := FieldByNAme('cd_centro').AsInteger;
       end;
       apropria.Close;
   end;

   FreeAndNil(Apropria);


end;

procedure Tfrm_Tesouraria_gerar.sbContaClick(Sender: TObject);
begin
  // Seleção de Plano de Contas
  if True then

  // Se está pagando
  frm_SelConta.filtroContas := tpcSaidas;

  if recebendo = true then
  begin
    frm_SelConta.filtroContas := tpcEntradas;
  end;

  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        edCodConta.Text := frm_SelConta.qyPlanosContascd_conta.AsString;
        cbPlanoConta.ItemIndex := ProcuraCodigo(RC_StrToInt(edCodConta.Text), ListaPlanoContas);        

  end;

end;

procedure Tfrm_Tesouraria_gerar.sbCriterioApagarClick(Sender: TObject);
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

procedure Tfrm_Tesouraria_gerar.sbCriterioEditarClick(Sender: TObject);
begin
   if (cd_apropriacao_selecionada >= 0) AND (Self.ListaApropriacoes.Count > 0) then
   begin
     Application.CreateForm( TfrmApropriaAlteraCaixa, frmApropriaAlteraCaixa );

     frmApropriaAlteraCaixa.ListaApropriacoes := Self.ListaApropriacoes;
     frmApropriaAlteraCaixa.setCdApropriacaoSelecionada( cd_apropriacao_selecionada );
     frmApropriaAlteraCaixa.setFormEstado('alterar');
     frmApropriaAlteraCaixa.ShowModal();

     Self.carregaApropriacaoGrid();
   end;
end;

procedure Tfrm_Tesouraria_gerar.sbCriterioInserirClick(Sender: TObject);
var
  cd_titulo : String;
begin
   Application.CreateForm( TfrmApropriaAlteraCaixa, frmApropriaAlteraCaixa );
   frmApropriaAlteraCaixa.ListaApropriacoes := Self.ListaApropriacoes;
   frmApropriaAlteraCaixa.setContaSelecionada(edCodConta.Text);
   frmApropriaAlteraCaixa.setFormEstado('inserir');


   if cd_titulo <> '' then
   begin
      frmApropriaAlteraCaixa.setCdTitulo( cd_titulo );
   end;


   frmApropriaAlteraCaixa.ShowModal();

   Self.carregaApropriacaoGrid();
end;

function Tfrm_Tesouraria_gerar.getCodigoCompromissoPrincipal: string;
begin
   Result := IntToStr(CodigoMovimento);
end;

procedure Tfrm_Tesouraria_gerar.sgGridApropriacoesSelectCell(Sender: TObject;
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
   cd_coligada := inttostr(TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo);

   Self.selecionaApropriacao( cd_titulo, cd_coligada, cd_conta, cd_centro );
end;

procedure Tfrm_Tesouraria_gerar.SpeedButton1Click(Sender: TObject);
var
   retorno: TResultadoBuscaCentro;
begin
   {
      Chama a tela de busca de centro de custo.
      Passa o parametro < tcAnalitico > para buscar apenas os
      centros de custo analiticos conforme a tela.
   }
   retorno := TfrmBuscaCentro.getInstancia.ShowModal(
      false,
      tcAnalitico,
      true
   );

   if retorno.objCentro <> nil then
   begin
      edCodCentro.Text := IntToStr( retorno.objCentro.Centro );

      cbCentro.ItemIndex := ProcuraCodigo(
         retorno.objCentro.Centro,
         ListaCentroCustos
      );
   end;
end;

procedure Tfrm_Tesouraria_gerar.selecionaApropriacao( cd_titulo_principal: string; cd_coligada: string; cd_conta:string; cd_centro: string );
var
   i : integer;
begin
   cd_apropriacao_selecionada := -1;
   for i := 0 to ListaApropriacoes.Count -1 do
   begin
      if  (TFinApropriaTesouraria(ListaApropriacoes.Items[i]).getValorCampo('cd_titulo') = cd_titulo_principal)
      and (TFinApropriaTesouraria(ListaApropriacoes.Items[i]).getValorCampo('cd_conta')  = cd_conta)
      and (TFinApropriaTesouraria(ListaApropriacoes.Items[i]).getValorCampo('cd_centro') = cd_centro)
   then
      begin
         cd_apropriacao_selecionada := i;
         break;
      end;
   end;

   { Caso não tenha achado procura novamente, pois pode ser um novo registro OC 89034}
   if ( cd_apropriacao_selecionada = -1) then
   begin
      Self.selecionaApropriacao( '' , cd_coligada, cd_conta, cd_centro );
   end;
end;

procedure Tfrm_Tesouraria_gerar.carregaApropriacaoGrid;
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
   objApropriacao          : TFinApropriaTesouraria;
begin
   //prepara a grid para buscar informações das parcelas no objCompromissos
   if (ListaApropriacoes.Count > 0) and (ListaApropriacoes <> nil) then
   begin
      nr_total_apropriacoes            := ListaApropriacoes.Count;

      total_linhas                     := nr_total_apropriacoes + 1; // +1 por que a primeira linha é fixa
      total_colunas                    := 5; //fixo
      sgGridApropriacoes.FixedRows     := 1;
      sgGridApropriacoes.ColCount      := total_colunas;
      sgGridApropriacoes.Cols[0][0]    := 'Cod. Conta';
      sgGridApropriacoes.Cols[1][0]    := 'Plano de Contas';
      sgGridApropriacoes.Cols[2][0]    := 'Cod. Centro';
      sgGridApropriacoes.Cols[3][0]    := 'Centro de Custos';
      sgGridApropriacoes.Cols[4][0]    := 'Valor';

      //tamanho das colunas
      sgGridApropriacoes.ColWidths[0]  := 65;
      sgGridApropriacoes.ColWidths[1]  := 227;
      sgGridApropriacoes.ColWidths[2]  := 70;
      sgGridApropriacoes.ColWidths[3]  := 146;
      sgGridApropriacoes.ColWidths[4]  := 60;

      sgGridApropriacoes.RowCount      := total_linhas;


      for i := 0 to nr_total_apropriacoes -1 do
      begin
         objApropriacao := (ListaApropriacoes.Items[i] as TFinApropriaTesouraria);

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
      sgGridApropriacoes.Cols[0][0]    := 'Cod. Conta';
      sgGridApropriacoes.Cols[1][0]    := 'Plano de Contas';
      sgGridApropriacoes.Cols[2][0]    := 'Cod. Centro';
      sgGridApropriacoes.Cols[3][0]    := 'Centro de Custos';
      sgGridApropriacoes.Cols[4][0]    := 'Valor';

      //tamanho das colunas
      sgGridApropriacoes.ColWidths[0]  := 65;
      sgGridApropriacoes.ColWidths[1]  := 227;
      sgGridApropriacoes.ColWidths[2]  := 70;
      sgGridApropriacoes.ColWidths[3]  := 146;
      sgGridApropriacoes.ColWidths[4]  := 60;

      sgGridApropriacoes.RowCount      := 2;
   end;

end;


procedure Tfrm_Tesouraria_gerar.CarregarColigadas;
var
   I, Selecionada: Integer;
   ListaColigadasFilhas : TListaColigadas;
begin
   ListaColigadasFilhas := DM.UsuarioLogado.GetListaColigadasFilhaSelecionada();

   for I := 0 to ListaColigadasFilhas.Count - 1 do
   begin

      if ListaColigadasFilhas.Items[i].Codigo = Self.cd_coligada_apropria then
         Selecionada := i;

      cbUnidadeEnsino.AddItem(
         ListaColigadasFilhas.Items[I].Nome,
         ListaColigadasFilhas.Items[I]
      );
   end;

   cbUnidadeEnsino.ItemIndex := Selecionada;
end;

procedure Tfrm_Tesouraria_gerar.edValorDinheiroExit(Sender: TObject);
var
  valor : Currency;
  txt   : String;
begin
       try
          valor := StrToCurr(TEdit(Sender).Text);
          txt := FloatToStrF(valor, ffFixed, 12, 2);
       except
             txt := '0,00';
       end;

       TEdit(Sender).Text := txt;
end;


procedure Tfrm_Tesouraria_gerar.qyCentro_CustosCalcFields(DataSet: TDataSet);
var
   sAux : String;
begin

   if qyCentro_Custoscd_classificacao.AsString <> '' then
      sAux := qyCentro_Custoscd_classificacao.DisplayText + '  '
   else
      sAux := '';

   sAux := sAux + qyCentro_Custosds_centro.AsString;

   qyCentro_Custos.FieldByName('desClassificacaoDesc').AsString := sAux;


end;

function Tfrm_Tesouraria_gerar.AtualizarApropriacao(CodigoMovimentoAux: Integer): boolean;
var
   apropria : TUMZQuery;
   SomaAnterior : Currency;
begin

   // Se for uma alteração refazer o rateio

   DM.CriarConsulta(apropria);

   SomaAnterior := ValorDinheiro + ValorCheque;

   apropria.Close();
   apropria.SQL.Clear();
   apropria.SQL.Text :=
    ' UPDATE fin_apropria_te SET  ' +
    '   vl_movimento = (:NovaSoma * vl_movimento) / :SomaAnterior ' +
    ' WHERE cd_movimento_te = :CdMovimento AND ' +
    '       cd_coligada = :CdColigada ';

   apropria.ParamByName('NovaSoma').AsFloat := StrToCurr(edValorDinheiro.Text) + StrToCurr(edValorCheque.Text);
   apropria.ParamByName('SomaAnterior').AsFloat := SomaAnterior;
   apropria.ParamByName('CdMovimento').AsInteger := CodigoMovimentoAux;
   apropria.ParamByName('CdColigada').AsInteger := TColigada(cbUnidadeEnsino.Items.Objects[cbUnidadeEnsino.ItemIndex]).Codigo;

   apropria.ExecSQL();

   // Atualizar os códigos de apropriação

   if (RC_StrToInt(edCodConta.Text) <> CodigoConta) OR (RC_StrToInt(edCodCentro.Text) <> CodigoCentro) then
   begin
      apropria.Close();
      apropria.SQL.Clear();
      apropria.SQL.Text :=
       ' UPDATE fin_apropria_te SET  ' +
       '   cd_conta = :NovaConta, cd_centro = :NovoCentro ' +
       ' WHERE cd_movimento_te = :CdMovimento AND ' +
       '       cd_conta = :CdConta AND cd_centro = :CdCentro ';

       apropria.ParamByName('CdMovimento').AsInteger := CodigoMovimentoAux;
       apropria.ParamByName('NovaConta').AsInteger := RC_StrToInt(edCodConta.Text);
       apropria.ParamByName('NovoCentro').AsInteger := RC_StrToInt(edCodCentro.Text);
       apropria.ParamByName('CdConta').AsInteger := CodigoConta;
       apropria.ParamByName('CdCentro').AsInteger := CodigoCentro;
       apropria.ExecSQL();
       
   end;

   FreeAndNil(apropria);
   
end;

end.

