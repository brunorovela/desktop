unit uCompromisso_baixar_preparacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZConnection, DBCtrls, Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TBaixa = (Desconto, Cancelamento, Pagamento);

  TOrigemCalculo = (ValorPago, ValorMulta, ValorJuros, Inicial);

  Tfrm_Compromisso_Baixar_Preparacao = class(TForm)
    pnTitulo: TPanel;
    pnCompromisso: TPanel;
    Bevel1: TBevel;
    btnConfirmarBaixa: TBitBtn;
    BitBtn2: TBitBtn;
    pnAcaoMovimento: TPanel;
    Bevel4: TBevel;
    Label15: TLabel;
    cbAcaoMovimento: TComboBox;
    qyAcao: TUMZQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblConta: TLabel;
    lblDescricao: TLabel;
    lblValor: TLabel;
    qryUpdItens: TUMZQuery;
    qryApropriaValores: TUMZQuery;
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarBaixaClick(Sender: TObject);
    procedure cbAcaoMovimentoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }

    ListaAcao : Array of Integer;

    Procedure MontaComboAcao;

    Procedure ApropriaValoresCP(CodMovimento : Integer; ValorBaixado : Currency);

  public
    { Public declarations }

    tipoBaixa : TBaixa;
  end;

var
  frm_Compromisso_Baixar_Preparacao: Tfrm_Compromisso_Baixar_Preparacao;

implementation

uses uSelCaixa, uClassMovimento, uDM, uCompromisso_Preparados,
  uTesouraria_gerar;

{$R *.dfm}

procedure Tfrm_Compromisso_Baixar_Preparacao.FormShow(Sender: TObject);
begin
   { Alterar títulos do formulário }

   qyAcao.Close;
   qyAcao.SQL.Clear;

   qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 1 and cd_origem = 2 ORDER by ds_acao');

   qyAcao.Open;

   MontaComboAcao;

   { Dados da Tela }
   lblConta.Caption     := frm_compromisso_preparados.qryPreparacaodsCaixa.AsString;
   lblDescricao.Caption := frm_compromisso_preparados.qryPreparacaods_preparacao.AsString;
   lblValor.Caption     := 'R$ ' + FloatToStrF(frm_compromisso_preparados.qryPreparacaovalTotal.AsCurrency, ffFixed, 12, 2);

end;

procedure Tfrm_Compromisso_Baixar_Preparacao.btnConfirmarBaixaClick(Sender: TObject);
Var
   Movimento : TMovimento;
   tpConta : word;
   cdAbertura : Integer;
   cdAcaoTesouraria : Integer;
   ValorTotal : Currency;
   CodMovimentoTe : Integer;
   DataBaixa : TDateTime;
   sCheque : String;
begin

   Movimento := TMovimento.Create;

   if (tipoBaixa = Pagamento ) then
   begin
        if not Movimento.VerificaContaAtiva(frm_compromisso_preparados.qryPreparacaocd_caixa.AsInteger, tpConta, cdAbertura ) then
        begin
           MessageDlg('A conta selecionada não está ativa, não é possível efetuar a baixa.', mtWarning, [mbOk], 0);
           Movimento.Free;
           Abort;
        end;

        if (tpConta = 3) AND (cdAbertura <= 0) then
        begin
           if not Movimento.VerificaContaAtiva(frm_compromisso_preparados.qryPreparacaocd_caixa.AsInteger, tpConta, cdAbertura ) then
           begin
              MessageDlg('A conta caixa está fechada. Abra a conta antes de baixar o compromisso.', mtWarning, [mbOk], 0);
              Movimento.Free;
              Abort;
           end;
        end;
   End;

   { Verificar Tipo de Conta se o tipo = Pagamento }

   // Pegar a Soma de Valores para efetuar lançamento no Caixa
   ValorTotal := 0;

   frm_compromisso_preparados.qryItens.First;

   while not frm_compromisso_preparados.qryItens.Eof do
   begin

       ValorTotal := ValorTotal + (frm_compromisso_preparados.qryItensvl_baixa.AsFloat +
                                   frm_compromisso_preparados.qryItensvl_multa.AsFloat +
                                   frm_compromisso_preparados.qryItensvl_juros.AsFloat -
                                   frm_compromisso_preparados.qryItensvl_desconto.AsFloat );

       frm_compromisso_preparados.qryItens.Next;

   end;

   // Efetuar Lançamento no Caixa

   // Lançar valortotal no caixa;
   qyAcao.Locate('cd_acao', ListaAcao[cbAcaoMovimento.ItemIndex], [] );

   if qyAcao.FieldByName('cd_movimento_caixa').AsInteger <> 0 then
   begin
       DM.qyAux1.Close;
       DM.qyAux1.SQL.Clear;
       DM.qyAux1.SQL.Add('SELECT * from fin_acoes_movimento');
       DM.qyAux1.SQL.Add('WHERE cd_acao = ' +  qyAcao.FieldByName('cd_movimento_caixa').AsString );
       Dm.qyAux1.Open;

       Application.CreateForm( Tfrm_Tesouraria_Gerar, frm_Tesouraria_Gerar );

       frm_tesouraria_gerar.tipoEstado := Confirmar;
       frm_tesouraria_gerar.CodigoAcao := Dm.qyAux1.FieldByName('cd_acao').AsInteger;
       frm_tesouraria_gerar.Historico := frm_compromisso_preparados.qryPreparacaods_preparacao.AsString;
       frm_tesouraria_gerar.NroDocumento := '';
       frm_Tesouraria_gerar.NumeroCheque := frm_Compromisso_Preparados.qryPreparacaonr_cheque.AsString;
       frm_Tesouraria_gerar.cd_coligada_selecionada := frm_Compromisso_Preparados.qryPreparacaoCD_COLIGADA.AsInteger;
       frm_Tesouraria_gerar.bloqueia_coligadas := true;

       if tpConta = 3  then begin   // Conta Caixa
          frm_tesouraria_gerar.ValorDinheiro := ValorTotal;
          frm_Tesouraria_gerar.ValorCheque := 0;
       end
       else begin
          frm_tesouraria_gerar.ValorDinheiro := 0;
          frm_Tesouraria_gerar.ValorCheque := ValorTotal;
       end;

       frm_Tesouraria_gerar.DataLancamento := Date;
       frm_tesouraria_gerar.DataLiberacao := Date;
       frm_tesouraria_gerar.CodigoMovimento:= 0;

       CodMovimentoTe := frm_tesouraria_gerar.GeraMovimentacao(2, frm_compromisso_preparados.qryPreparacaocd_caixa.AsInteger , 3, frm_Compromisso_Preparados.qryPreparacaoCD_COLIGADA.AsInteger);

       DataBaixa :=  frm_tesouraria_gerar.dtpLancamento.DateTime;
       sCheque := frm_Tesouraria_gerar.edNroCheque.Text;

       if CodMovimentoTe < 0 then
         Exit;

   end;


   ValorTotal := 0;

   frm_compromisso_preparados.qryItens.First;

   Movimento.TipoDeAcao := BaixarporPagamento;

   while not frm_compromisso_preparados.qryItens.Eof do
   begin

       Movimento.CodigoTitulo := frm_compromisso_preparados.qryItenscd_titulo.AsInteger;
       Movimento.CodAcao :=  ListaAcao[cbAcaoMovimento.ItemIndex];
       Movimento.ValorMovimento := frm_compromisso_preparados.qryItensvl_baixa.AsFloat;
       Movimento.ValorMulta :=     frm_compromisso_preparados.qryItensvl_multa.AsFloat;
       Movimento.ValorJuros :=     frm_compromisso_preparados.qryItensvl_juros.AsFloat;
       Movimento.ValorDesconto :=  frm_compromisso_preparados.qryItensvl_desconto.AsFloat;
       Movimento.ValorLiquido :=   Movimento.ValorMovimento + Movimento.ValorMulta + Movimento.ValorJuros - Movimento.ValorDesconto;
       Movimento.Observacao := 'Baixa efetuada pela preparação de pagamentos.';
       Movimento.DataLiberacao := DataBaixa;
       Movimento.Coligada := frm_Compromisso_Preparados.qryItenscd_coligada.AsInteger;

       Movimento.RegistrarMovimentacaoCP(CodMovimentoTe);

       { Marcar a preparação como baixada }

       frm_compromisso_preparados.qyAux.Close;
       frm_compromisso_preparados.qyAux.SQL.Clear;
       frm_compromisso_preparados.qyAux.SQL.Add('UPDATE fin_cp_preparacao_itens       ');
       frm_compromisso_preparados.qyAux.SQL.Add('  SET sn_baixado         = ''S''     ');
       frm_compromisso_preparados.qyAux.SQL.Add('WHERE cd_preparacao =  ' + frm_compromisso_preparados.qryItenscd_preparacao.AsString );
       frm_compromisso_preparados.qyAux.SQL.Add('  AND cd_titulo     =  ' + frm_compromisso_preparados.qryItenscd_titulo.AsString );

       frm_compromisso_preparados.qyAux.ExecSQL;

       ValorTotal := ValorTotal + Movimento.ValorLiquido;

       frm_compromisso_preparados.qryItens.Next;

   end;

   frm_compromisso_preparados.qyAux.Close;
   frm_compromisso_preparados.qyAux.SQL.Clear;
   frm_compromisso_preparados.qyAux.SQL.Add('UPDATE fin_cp_preparacao             ');
   frm_compromisso_preparados.qyAux.SQL.Add('  SET sn_pgto_efetivado = ''S'',    ');
   frm_compromisso_preparados.qyAux.SQL.Add('      cd_usuario_baixou = ' + IntToStr(dm.iCdPessoaLogado) + ', ' );
   frm_compromisso_preparados.qyAux.SQL.Add('      cd_movimento_te = ' + IntToStr(CodMovimentoTe) );
   frm_compromisso_preparados.qyAux.SQL.Add('    , nr_cheque         = ''' + sCheque +  '''     ');    
   frm_compromisso_preparados.qyAux.SQL.Add('WHERE cd_preparacao =  ' + frm_compromisso_preparados.qryPreparacaocd_preparacao.AsString );

   frm_compromisso_preparados.qyAux.ExecSQL;

   // Associar o cheque e a conta com os compromissos

   frm_compromisso_preparados.qyAux.Close;
   
   qryUpdItens.ParamByName('NR_CHEQUE').AsString := sCheque;
   qryUpdItens.ParamByName('CD_CAIXA').AsString := frm_compromisso_preparados.qryPreparacaoCD_CAIXA.AsString;
   qryUpdItens.ParamByName('CD_PREPARACAO').AsString := frm_compromisso_preparados.qryPreparacaoCD_PREPARACAO.AsString;
   qryUpdItens.ExecSQL;

   // Baixas finalizadas no contas a pagar.

   Movimento.Free;

   // Atualizar a apropriação na tesouraria

   ApropriaValoresCP(CodMovimentoTe, ValorTotal);

   Self.ModalResult := mrOk;

   Close;

end;

procedure Tfrm_Compromisso_Baixar_Preparacao.MontaComboAcao;
var n : Word;
begin
    SetLength(ListaAcao, qyAcao.RecordCount);

    qyAcao.First;
    n := 0;

    cbAcaoMovimento.Items.Clear;

    while not qyAcao.Eof do
    begin

        ListaAcao[n] := qyAcao.FieldByName('cd_acao').AsInteger;
        cbAcaoMovimento.Items.Add(qyAcao.FieldByName('ds_acao').AsString);

        INC(n);
        qyAcao.Next;
    end;

    cbAcaoMovimento.ItemIndex := 0;
end;

procedure Tfrm_Compromisso_Baixar_Preparacao.cbAcaoMovimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
       SelectNext(Sender as TWinControl, True, True);
       key := #0;
   end;
end;

procedure Tfrm_Compromisso_Baixar_Preparacao.ApropriaValoresCP(
  CodMovimento: Integer; ValorBaixado: Currency);
begin
   // Apropria os valores do contas a pagar
   qryApropriaValores.ParamByName('CD_MOV_TE').AsInteger := CodMovimento;
   qryApropriaValores.ParamByName('CD_TITULO').AsInteger := frm_compromisso_preparados.qryItenscd_preparacao.AsInteger;
   qryApropriaValores.ParamByName('CD_COLIGADA').AsInteger := frm_compromisso_preparados.qryItenscd_coligada.AsInteger;
   qryApropriaValores.ExecSQL;
end;

procedure Tfrm_Compromisso_Baixar_Preparacao.BitBtn2Click(Sender: TObject);
begin
   Self.ModalResult := mrCancel;
   CLose;
end;

end.

