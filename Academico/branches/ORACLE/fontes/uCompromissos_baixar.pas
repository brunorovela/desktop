unit uCompromissos_baixar;

interface

uses
  Windows, DateUtils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, uUsuario,
  Dialogs, ExtCtrls, StdCtrls, DB, ZConnection, DBCtrls, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  UMEditMonetario;

type
  TBaixa = (Desconto, Cancelamento, Pagamento);

  TOrigemCalculo = (ValorPago, ValorMulta, ValorJuros, ValorDesconto, Inicial);

  Tfrm_Compromisso_Baixar = class(TForm)
    pnTitulo: TPanel;
    pnConta: TPanel;
    pnCompromisso: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    Label6: TLabel;
    qyCompromisso: TUMZQuery;
    scrCompromisso: TDataSource;
    DBText10: TDBText;
    Label14: TLabel;
    pnBaixa: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    pnAcaoMovimento: TPanel;
    Label15: TLabel;
    cbAcaoMovimento: TComboBox;
    qyAcao: TUMZQuery;
    srcAcao: TDataSource;
    cbFormaPgto: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    edNrCheque: TEdit;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel1: TBevel;
    cbContas: TComboBox;
    Bevel2: TBevel;
    qyCompromissodescTipoTitulo: TStringField;
    qyCompromissodes_completa_titulo: TStringField;
    qyCompromissovalPendente: TFloatField;
    qyCompromissoCD_TIPO_TITULO: TIntegerField;
    qyCompromissoDT_VENCIMENTO: TDateTimeField;
    qyCompromissoCD_CAIXA: TLargeintField;
    qyCompromissoNR_CHEQUE: TLargeintField;
    qyCompromissoCD_TITULO: TLargeintField;
    qyCompromissoDS_DESPESA: TStringField;
    qyCompromissoNR_DOCUMENTO: TStringField;
    qyCompromissoCD_COLIGADA: TIntegerField;
    qyCompromissoNM_PESSOA: TStringField;
    qyCompromissoVL_ENTRADAS: TFloatField;
    qyCompromissoVL_SAIDAS: TFloatField;
    qyCompromissoCD_FORMA_PGTO: TIntegerField;
    UMZQuery1: TUMZQuery;
    txtValorTotalPago: TUMEditMonetario;
    txtValorMulta: TUMEditMonetario;
    txtValorJuros: TUMEditMonetario;
    txtValorLiquidado: TUMEditMonetario;
    qyCompromissocd_titulo_principal: TLargeintField;
    edValorDesconto: TUMEditMonetario;
    Label2: TLabel;
    qyCompromissovl_multa: TFloatField;
    qyCompromissovl_mora: TFloatField;
    qyCompromissovl_desconto: TFloatField;
    procedure txtValorJurosExit(Sender: TObject);
    procedure txtValorJurosEnter(Sender: TObject);
    procedure txtValorMultaExit(Sender: TObject);
    procedure txtValorMultaEnter(Sender: TObject);
    procedure edValorDescontoExit(Sender: TObject);
    procedure edValorDescontoEnter(Sender: TObject);
    procedure txtValorTotalPagoExit(Sender: TObject);
    procedure txtValorTotalPagoEnter(Sender: TObject);
    procedure cbFormaPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure cbContasKeyPress(Sender: TObject; var Key: Char);
    procedure edNrChequeKeyPress(Sender: TObject; var Key: Char);
    procedure cbFormaPgtoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qyCompromissoCalcFields(DataSet: TDataSet);
    procedure edCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbAcaoMovimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    valorETotalPagar,
    valorEDesconto,
    valorEMulta,
    valorEJuros: Currency;

    ListaAcao : Array of Integer;

    ListaFormaPgtoCod : Array of Integer;
    ListaFormaPgtoCheque : Array of byte;

    ListaContas : Array of Integer;
    Procedure ApresentarContas ( ContaPadrao : Integer );
    Function ProcuraCodigo(codigo: Integer; ListaCodigos: array of Integer): Integer;

    Procedure CalculaBaixa(Origem : TOrigemCalculo);
    
    Procedure MontaComboAcao;


    function getSaldoConta: Double;
    function getFinMovCpDescontos(cdTitulo: Integer): Currency;

    procedure atualizaVlDesconto(cdTitulo: Integer);
    procedure zeraDesconto(cdTitulo: Integer);

    Procedure MontaComboFormaPgto;

    procedure atualizaAbatimentoTitulo(vlAbatimento, vlMulta, vlMora: Currency);

    Procedure ApropriaValoresCP(CodMovimento : Integer; ValorBaixado : Currency);

    Procedure AutenticarCompromisso(sMascara : String = '');

    function buscaCodigoApropricao(): integer;

  public
    { Public declarations }

    tipoBaixa: TBaixa;
//    cd_coligada: Integer;
    cd_coligada_contas_pagar: Integer;

  end;

var
  frm_Compromisso_Baixar: Tfrm_Compromisso_Baixar;

implementation

uses uSelCaixa, uClassMovimento, uDM, uTesouraria_gerar,
  uCompromisso_Preparados, uContasPagar_Planilha;

{$R *.dfm}

procedure Tfrm_Compromisso_Baixar.FormShow(Sender: TObject);
begin
   // Alterar títulos do formulário

   ApresentarContas(qyCompromissocd_caixa.AsInteger);

   qyAcao.Close;
   qyAcao.SQL.Clear;

   case tipoBaixa of
      Pagamento: begin
                     Self.Caption     := 'Baixar compromisso';
                     pnTitulo.Caption := 'Baixar compromisso';
                     Label7.Caption := 'Valor total a pagar:';

                     CalculaBaixa(Inicial);

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 1 and cd_origem = 2 ORDER by ds_acao');

                     pnConta.Visible := True;

                  end;
      Desconto: begin
                     Self.Caption     := 'Aplicar abatimento ao título';
                     pnTitulo.Caption := 'Aplicar abatimento ao título';

                     txtValorMulta.Enabled := False;
                     txtValorJuros.Enabled := False;

                     edValorDesconto.Visible := False;
                     Label2.Visible := False;

                     Label8.Visible := False;
                     txtValorMulta.Visible := False;

                     Label12.Visible := False;
                     txtValorJuros.Visible := False;

                     Label13.Visible := False;
                     txtValorLiquidado.Visible := False;

                     Self.ClientHeight := 250;
                     pnBaixa.Height := 35;

                     btnConfirmar.Top := 220;
                     btnCancelar.Top := 220;

                     Label7.Caption := 'Valor de abatimento:';

                     CalculaBaixa(Inicial);

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 3 and cd_origem = 2 ORDER by ds_acao');

                     pnConta.Visible := False;

                  end;
      Cancelamento: begin
                     Self.Caption     := 'Cancelar compromisso';
                     pnTitulo.Caption := 'Cancelar compromisso';

                     txtValorMulta.Enabled := False;
                     txtValorJuros.Enabled := False;

                     txtValorMulta.Enabled := False;
                     txtValorJuros.Enabled := False;

                     edValorDesconto.Visible := False;
                     Label2.Visible := False;

                     Label8.Visible := False;
                     txtValorMulta.Visible := False;

                     Label12.Visible := False;
                     txtValorJuros.Visible := False;

                     Label13.Visible := False;
                     txtValorLiquidado.Visible := False;

                     Self.ClientHeight := 250;
                     pnBaixa.Height := 35;

                     btnConfirmar.Top := 220;
                     btnCancelar.Top := 220;

                     Label7.Caption := 'Valor a cancelar:';

                     CalculaBaixa(Inicial);

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 2 and cd_origem = 2 ORDER by ds_acao');

                     pnConta.Visible := False;

                  end;
   end;

   qyAcao.Open();

   MontaComboAcao();

   MontaComboFormaPgto();

   edNrCheque.Text := qyCompromissonr_cheque.AsString;

   edValorDesconto.setValor(qyCompromissovl_desconto.AsCurrency - getFinMovCpDescontos(qyCompromissoCD_TITULO.AsInteger));
   txtValorMulta.setValor(qyCompromissovl_multa.AsCurrency);
   txtValorJuros.setValor(qyCompromissovl_mora.AsCurrency);

   if (tipoBaixa = Desconto) or (tipoBaixa = Cancelamento) then
   begin
      txtValorTotalPago.setValor(
         qyCompromissovalPendente.AsCurrency
      );
   end
   else
   begin
      txtValorTotalPago.setValor(
         qyCompromissovalPendente.AsCurrency -
         edValorDesconto.getValor() +
         qyCompromissovl_multa.AsCurrency +
         qyCompromissovl_mora.AsCurrency
      );
   end;
   txtValorLiquidado.setValor(txtValorTotalPago.getValor - txtValorMulta.getValor() - txtValorJuros.getValor() + edValorDesconto.getValor());

end;

function Tfrm_Compromisso_Baixar.getFinMovCpDescontos(
  cdTitulo: Integer): Currency;
const
   SQL_FIN_MOV_CP_DESCONTOS =
      ' SELECT SUM(vl_desconto) soma FROM fin_mov_cp WHERE cd_titulo = :cd_titulo ';
var
   qyBuscaFinMovCpDesconto: TUMZReadOnlyQuery;
begin
   Result := 0;

   DM.CriarConsulta(qyBuscaFinMovCpDesconto);

   qyBuscaFinMovCpDesconto.SQL.Text := SQL_FIN_MOV_CP_DESCONTOS;
   qyBuscaFinMovCpDesconto.ParamByName('cd_titulo').AsInteger := cdTitulo;
   qyBuscaFinMovCpDesconto.Open;

   Result := qyBuscaFinMovCpDesconto.FieldByName('soma').AsCurrency;
end;

function Tfrm_Compromisso_Baixar.getSaldoConta: Double;
var
   qyMovimentos, qyCalculaSaldo: TUMZQuery;
   tp_entrada_saida, cd_coligada, cd_coligada_conta, tp_conta, cd_mov_te: Integer;
   dt_abertura_caixa, dt_movimento: TDate;
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

   qyMovimentos.ParamByName('cd_caixa').AsInteger := ListaContas[cbContas.ItemIndex];
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
      '  AND cd_conta_banco = ' + IntToStr(ListaContas[cbContas.ItemIndex]);
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

      qyCalculaSaldo.ParamByName('CD_CAIXA').AsInteger := ListaContas[cbContas.ItemIndex];
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
   '  AND DATE(dt_movimento) < :dataAmanha   ';

   qyMovimentos.ParamByName('cd_caixa').AsInteger := ListaContas[cbContas.ItemIndex];
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

procedure Tfrm_Compromisso_Baixar.qyCompromissoCalcFields(
  DataSet: TDataSet);
begin
   qyCompromisso.FieldByName('valPendente').AsFloat := qyCompromissovl_entradas.AsFloat - qyCompromissovl_saidas.AsFloat;
end;

procedure Tfrm_Compromisso_Baixar.edCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Saltar de campo com enter e permitir somente número

   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_Compromisso_Baixar.CalculaBaixa(Origem :TOrigemCalculo) ;
var
   valBaixa,
   valMulta,
   valLiquido,
   valJuros,
   valPendente,
   valDesconto: Currency;
begin
   try
      valBaixa := txtValorTotalPago.getValor();
   except
      valBaixa := 0;
   end;

   try
      valDesconto := edValorDesconto.getValor();
   except
      valDesconto := 0;
   end;

   try
      valMulta := txtValorMulta.getValor();
   except
      valMulta := 0;
   end;

   try
      valLiquido := txtValorLiquidado.getValor();
   except
      valLiquido := 0;
   end;

   try
      valJuros := txtValorJuros.getValor();
   except
      valJuros := 0;
   end;

   try
      valPendente := qyCompromissovalPendente.AsFloat;
      valPendente := RoundFloat(valPendente, 2);
   except
      valPendente := 0;
   end;

   if (Origem = ValorMulta) or (Origem = ValorJuros) or (Origem = ValorDesconto) then
   begin
      valBaixa := valLiquido - valDesconto + valMulta + valJuros;

      if valBaixa < 0 then
      begin
         valBaixa := 0;
      end;
   end;

   if Origem = ValorPago then
   begin
      if (valBaixa + valDesconto) > valPendente then
      begin
         valDesconto := valDesconto - ((valBaixa + valDesconto) - valPendente);

         if valDesconto < 0 then
         begin
            valDesconto := 0;
         end;
      end;

      if valBaixa < valLiquido then
      begin
         valLiquido := valBaixa + valDesconto - valMulta - valJuros;
      end;

      if valBaixa >= valLiquido then
      begin
         if valBaixa > valPendente then
         begin
            valLiquido := valPendente;
         end;

         if valBaixa <= valPendente then
         begin
            valLiquido := valBaixa + valDesconto - valMulta - valJuros;
         end;
         
         valMulta := valBaixa - valJuros - valLiquido;
      end;
   end;

   txtValorLiquidado.setValor(valLiquido);
   txtValorTotalPago.setValor(valBaixa);
   txtValorMulta.setValor(valMulta);
   txtValorJuros.setValor(valJuros);
   edValorDesconto.setValor(valDesconto);
end;

procedure Tfrm_Compromisso_Baixar.txtValorJurosEnter(Sender: TObject);
begin
   valorEJuros := txtValorJuros.getValor();
end;

procedure Tfrm_Compromisso_Baixar.txtValorJurosExit(Sender: TObject);
begin
   if valorEJuros <> txtValorJuros.getValor() then
   begin
      CalculaBaixa(ValorJuros);
   end;
end;

procedure Tfrm_Compromisso_Baixar.txtValorMultaEnter(Sender: TObject);
begin
   valorEMulta := txtValorMulta.getValor();
end;

procedure Tfrm_Compromisso_Baixar.txtValorMultaExit(Sender: TObject);
begin
   if valorEMulta <> txtValorMulta.getValor() then
   begin
      CalculaBaixa(ValorMulta);
   end;
end;

procedure Tfrm_Compromisso_Baixar.txtValorTotalPagoEnter(Sender: TObject);
begin
   valorETotalPagar := txtValorTotalPago.getValor();
end;

procedure Tfrm_Compromisso_Baixar.txtValorTotalPagoExit(Sender: TObject);
begin
   if valorETotalPagar <> txtValorTotalPago.getValor() then
   begin
      CalculaBaixa(ValorPago);
   end;
end;

procedure Tfrm_Compromisso_Baixar.zeraDesconto(cdTitulo: Integer);
const
   SQL_ATUALIZA_VL_DESCONTO =
      ' UPDATE fin_contas_pagar SET vl_desconto = 0, vl_multa = 0, vl_mora = 0 WHERE cd_titulo = %d ';
var
   qyAtualizaVlDesconto: TUMZQuery;
begin
   DM.CriarConsulta(qyAtualizaVlDesconto);

   qyAtualizaVlDesconto.SQL.Text := Format(SQL_ATUALIZA_VL_DESCONTO, [cdTitulo]);
   qyAtualizaVlDesconto.ExecSQL;
end;

procedure Tfrm_Compromisso_Baixar.ApresentarContas(ContaPadrao: Integer);
var
   qyContas : TUMZQuery;
   Movimento : TMovimento;
   tp_Conta: word;  cd_Abertura : Integer;
begin

   Movimento := TMovimento.create;

   DM.CriarConsulta(qyContas);
   qyContas.Close;
   qyContas.SQL.Clear;
   qyContas.SQL.Add(' SELECT c.cd_caixa, c.ds_caixa, c.tp_conta ');
   qyContas.SQL.Add(' FROM fin_cadastro_contas c');
   qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (c.cd_caixa = u.cd_caixa) ');
   qyContas.SQL.Add(' INNER JOIN coligadas as co ON (co.cd_coligada = c.cd_coligada ) ');   
   qyContas.SQL.Add(' WHERE c.sn_ativa = ''S'' ');
   qyContas.SQL.Add(Format(' AND (c.cd_coligada IN ( %s ) OR c.sn_todas_coligadas = 1)', [DM.GetUsuarioLogado.GetColigadasFilhaSelecionada()]));
   qyContas.SQL.Add(' AND co.cd_coligada_matriz = ' + IntToStr(DM.UsuarioLogado.GetColigadaLogada.Codigo) );   
   qyContas.SQL.Add(' AND u.cd_usuario = ' + IntToStr(DM.iCdPessoaLogado) );
   qyContas.SQL.Add(' ORDER by c.ds_caixa ');
   qyContas.Open;

   cbContas.Items.Clear;

   setlength( ListaContas, 0 );

   while not qyContas.Eof do
   begin
         { Somente inserir as contas que poderão ser utilizadas para a Baixa }
         movimento.Coligada := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

         if Movimento.VerificaContaAtiva(qyContas.FieldByNAme('cd_caixa').AsInteger, tp_Conta, cd_Abertura) then
         begin

             if (tp_Conta <> 3) OR (cd_Abertura > 0) then
             begin
                cbContas.Items.Add(qyContas.FieldByName('ds_caixa').AsString);
                SetLength(listaContas, length(listacontas) + 1);
                ListaContas[length(listacontas) - 1] := qyContas.FieldByName('cd_caixa').AsInteger;
             end;

         end;
         qyContas.Next;

   end;

   { Verificar qual a conta padrão será utilizada }

   cbContas.ItemIndex :=  ProcuraCodigo(ContaPadrao, ListaContas);

   FreeAndNil(qyContas);

end;


procedure Tfrm_Compromisso_Baixar.ApropriaValoresCP(CodMovimento: Integer;
  ValorBaixado: Currency);
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
  qLer.ParamByName('CdTitulo').AsInteger := qyCompromissocd_titulo.AsInteger;
  qLer.ParamByName('CdColigada').AsInteger := qyCompromissoCD_COLIGADA.AsInteger;
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


procedure Tfrm_Compromisso_Baixar.atualizaAbatimentoTitulo(
  vlAbatimento, vlMulta, vlMora: Currency);
const
   SQL_ATUALIZA_ABATIMENTO =
      ' UPDATE fin_contas_pagar SET ' +
      '  vl_abatimento = vl_abatimento + :vl_abatimento '+
      ' WHERE '+
      '  cd_titulo = :cd_titulo ';

   SQL_ATUALIZA_CAMPOS =
      ' UPDATE fin_contas_pagar SET ' +
      '  vl_multa = :vl_multa, '+
      '  vl_mora = :vl_mora '+
      ' WHERE '+
      '  cd_titulo = :cd_titulo ';
var
   qyAtualizaAbatimento: TUMZQuery;
begin
   DM.CriarConsulta(qyAtualizaAbatimento);

   if (tipoBaixa = Desconto) or (tipoBaixa = Cancelamento) then
   begin
      qyAtualizaAbatimento.SQL.Text := SQL_ATUALIZA_ABATIMENTO;
      qyAtualizaAbatimento.ParamByName('vl_abatimento').AsFloat := vlAbatimento;
   end;

   if tipoBaixa = Pagamento then
   begin
      qyAtualizaAbatimento.SQL.Text := SQL_ATUALIZA_CAMPOS;
      qyAtualizaAbatimento.ParamByName('vl_multa').AsFloat := vlMulta;
      qyAtualizaAbatimento.ParamByName('vl_mora').AsFloat := vlMora;
   end;

   qyAtualizaAbatimento.ParamByName('cd_titulo').AsInteger :=
      qyCompromissoCD_TITULO.AsInteger;
   
   qyAtualizaAbatimento.ExecSQL;

   FreeAndNil(qyAtualizaAbatimento);
end;

procedure Tfrm_Compromisso_Baixar.atualizaVlDesconto(cdTitulo: Integer);
const
   SQL_ATUALIZA_VL_DESCONTO =
      ' UPDATE fin_contas_pagar SET vl_desconto = '+
      ' (SELECT SUM(vl_desconto) FROM fin_mov_cp WHERE cd_titulo = %d) WHERE cd_titulo = %d ';
var
   qyAtualizaVlDesconto: TUMZQuery;
begin
   DM.CriarConsulta(qyAtualizaVlDesconto);

   qyAtualizaVlDesconto.SQL.Text := Format(SQL_ATUALIZA_VL_DESCONTO, [cdTitulo, cdTitulo]);
   qyAtualizaVlDesconto.ExecSQL;
end;

procedure Tfrm_Compromisso_Baixar.AutenticarCompromisso(sMascara: String);
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
   total_pago := txtValorTotalPago.getValor();  //RoundFloat( StrToFloat(txtValorTotalPago.Text), 2);
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

procedure Tfrm_Compromisso_Baixar.btnCancelarClick(Sender: TObject);
begin
   frm_Compromisso_Baixar.ModalResult :=  mrCancel;
   Close();
end;

procedure Tfrm_Compromisso_Baixar.btnConfirmarClick(Sender: TObject);
Var
   Movimento    : TMovimento;
   tpConta      : word;
   cdAbertura   : Integer;
   CodMovimento : Integer;
   NrCheque,
   sChave,
   chave: String;

   DataBaixa    : TDateTime;
   saldoConta   : Double;
   descontosAnteriores:  Currency;
begin
   descontosAnteriores := getFinMovCpDescontos(qyCompromissoCD_TITULO.AsInteger);

   Movimento := TMovimento.Create;
   Movimento.Coligada := qyCompromissoCD_COLIGADA.AsInteger;

   DataBaixa := Date;

   CodMovimento := 0;

   saldoConta := getSaldoConta;

   //Se o valor da baixa é maior que o saldo da conta
   if txtValorTotalPago.getValor() > saldoConta  then
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

   if ((tipoBaixa = Desconto) or (tipoBaixa = Cancelamento)) and
      (txtValorTotalPago.getValor > qyCompromissovalPendente.AsCurrency) then
   begin

      if tipoBaixa = Desconto then
      begin
         chave := 'abatimento';
      end
      else
      begin
         chave := 'cancelamento';
      end;

      Mensagem(
         'Valor de ' + chave + ' é maior que o valor pendente, favor ajustar.',
         'Aviso',
         MB_OK + MB_ICONWARNING,
         Handle
      );

      Exit;
   end;

   if (tipoBaixa = Pagamento ) then
   begin
        if (cbContas.ItemIndex < 0 ) then
        Begin
           MessageDlg('Selecione a conta que será usada para pagamento.', mtWarning, [mbOk], 0);
           Movimento.Free;
           Abort;
        end;

        if (cbFormaPgto.ItemIndex < 0 ) then
        Begin
           MessageDlg('Selecione a forma de pagamento que está sendo utilizada.', mtWarning, [mbOk], 0);
           Movimento.Free;
           Abort;
        end;


        if not Movimento.VerificaContaAtiva(ListaContas[cbContas.ItemIndex], tpConta, cdAbertura ) then
        begin
           MessageDlg('A conta selecionada não está ativa, não é possível efetuar a baixa.', mtWarning, [mbOk], 0);
           Movimento.Free;
           Abort;
        end;

        if (tpConta = 3) AND (cdAbertura <= 0) then
        begin
              MessageDlg('A conta caixa está fechada. Abra a conta antes de baixar o compromisso.', mtWarning, [mbOk], 0);
              Movimento.Free;
              Abort;
        end;
   End;

   // Lançar movimento na Tesouraria Primeiro
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
       frm_tesouraria_gerar.FormaPgto :=  ListaFormaPgtoCod[cbFormaPgto.ItemIndex];
       frm_tesouraria_gerar.CodigoAcao := Dm.qyAux1.FieldByName('cd_acao').AsInteger;
       frm_tesouraria_gerar.Historico := qyCompromissods_despesa.AsString;
       frm_tesouraria_gerar.NroDocumento := qyCompromissonr_documento.AsString;
       frm_Tesouraria_gerar.cd_coligada_selecionada := Self.cd_coligada_contas_pagar;
       frm_Tesouraria_gerar.bloqueia_coligadas := True;
         

       if ListaFormaPgtoCheque[cbFormaPgto.ItemIndex] = 1 then
       begin
          frm_tesouraria_gerar.ValorDinheiro := 0;
          frm_Tesouraria_gerar.ValorCheque   := txtValorTotalPago.getValor();
       end
       else
       begin
          frm_tesouraria_gerar.ValorDinheiro := txtValorTotalPago.getValor();
          frm_Tesouraria_gerar.ValorCheque   := 0;
       end;

       frm_tesouraria_gerar.DataLiberacao := Date;
       frm_Tesouraria_gerar.DataLancamento := Date;
       frm_Tesouraria_gerar.NumeroCheque := edNrCheque.Text;
       frm_tesouraria_gerar.CodigoMovimento:= 0;

       frm_Tesouraria_gerar.CodigoTitulo := qyCompromissocd_titulo.AsInteger;
       frm_Tesouraria_gerar.CodigoConta := buscaCodigoApropricao;

       CodMovimento := frm_tesouraria_gerar.GeraMovimentacao(2, ListaContas[cbContas.ItemIndex], 3, Self.cd_coligada_contas_pagar);

       DataBaixa :=  frm_tesouraria_gerar.umdtLancamento.Date;

       // Cancelar a Baixa, pois não gerou movimentação na Tesouraria
       if CodMovimento < 0 then
          Exit;

       // Guardar a conta que foi utilizada para pagar no contas_pagar

       if (RC_StrToInt(edNrCheque.Text) <> 0 ) then
          NrCheque := edNrCheque.Text
       else
          NrCheque := ' NULL ';


       DM.qyAux2.Close;
       DM.qyAux2.SQL.Text :=
          ' UPDATE fin_contas_pagar set cd_caixa = ' + IntToStr(ListaContas[cbContas.ItemIndex]) +
          ' , cd_forma_pgto = ' + IntToStr(ListaFormaPgtoCod[cbFormaPgto.ItemIndex]) +
          ' , nr_cheque = ' + NrCheque +
          ' WHERE cd_coligada = ' + IntToStr(qyCompromissoCD_COLIGADA.AsInteger) +
          ' AND ( (cd_titulo = ' + qyCompromissocd_titulo.AsString + ') ' +
          ' OR (cd_titulo_origem = ' + qyCompromissocd_titulo.AsString + ')) ';
       Dm.qyAux2.ExecSQL();
   end;

   sChave := qyCompromissocd_titulo.AsString + ';' + qyCompromissocd_coligada.AsString;

   // Verificar Tipo de Conta se o tipo = Pagamento }

   Movimento := TMovimento.Create;

   case tipoBaixa of
      Pagamento    : begin
          Movimento.TipoDeAcao := BaixarporPagamento;
          DM.setLog(2033, 'Baixa', sChave, qyCompromissoCD_COLIGADA.AsInteger, 'Baixa por pagamento');
      end;
      Desconto     : begin
          Movimento.TipoDeAcao := BaixarporDesconto;
          DM.setLog(2033, 'Baixa', sChave, qyCompromissoCD_COLIGADA.AsInteger, 'Baixa por Desconto');
      end;
      Cancelamento : begin
          Movimento.TipoDeAcao := BaixarporCancelamento;
          DM.setLog(2033, 'Baixa', sChave, qyCompromissoCD_COLIGADA.AsInteger, 'Baixa por Cancelamento');
      end;
   end;

   Movimento.CodigoTitulo     := qyCompromissocd_titulo.AsInteger;
   Movimento.Coligada         := qyCompromissocd_coligada.AsInteger;
   Movimento.CodAcao          := ListaAcao[cbAcaoMovimento.ItemIndex];

   if (tipoBaixa = Desconto) or (tipoBaixa = Cancelamento)  then
   begin
      Movimento.ValorMovimento := txtValorTotalPago.getValor();
   end
   else
   begin
      Movimento.ValorMovimento   := txtValorLiquidado.getValor();
   end;
   
   Movimento.ValorMulta       := txtValorMulta.getValor();     //StrToFloat(txtValorMulta.Text);
   Movimento.ValorJuros       := txtValorJuros.getValor();     //StrToFloat(txtValorJuros.Text);
   Movimento.ValorLiquido     := txtValorTotalPago.getValor(); //StrToFloat(txtValorTotalPago.Text);
   Movimento.ValorDesconto    := edValorDesconto.getValor();
   Movimento.Observacao       := '';
   Movimento.DataLiberacao    := DataBaixa;

   Movimento.RegistrarMovimentacaoCP(CodMovimento);

   Movimento.Free;

   if tipoBaixa = Pagamento  then
   begin
      ApropriaValoresCP( CodMovimento, txtValorTotalPago.getValor() );

      // Autenticar a baixa de compromisso
      if DM.variavel_parametro('financeiro_qtd_autenticacao_cp') <> '' then
      begin
         AutenticarCompromisso('');
      end;
   end;

   if (tipoBaixa = Pagamento) and
      (edValorDesconto.getValor() > FloatToCurr(qyCompromissovl_desconto.AsCurrency - descontosAnteriores)) then
   begin
      atualizaVlDesconto(qyCompromissoCD_TITULO.AsInteger);
   end;

   if ((tipoBaixa = Desconto) or (tipoBaixa = Cancelamento)) and
      (txtValorTotalPago.getValor() = (
         qyCompromissovalPendente.AsCurrency
      )) then
   begin
      zeraDesconto(qyCompromissoCD_TITULO.AsInteger);
   end;

   atualizaAbatimentoTitulo(
      txtValorTotalPago.getValor(),
      txtValorMulta.getValor(),
      txtValorJuros.getValor()
   );

   Close();
   frm_Compromisso_Baixar.ModalResult :=  mrOk;

end;

function Tfrm_Compromisso_Baixar.buscaCodigoApropricao : integer;
const
   SQL_APROPRIACAO =
   'SELECT cd_conta FROM fin_apropria_cp where cd_titulo = :titulo limit 1';
var
   qryApropria: TUMZQuery;
   codigo : integer;
begin
   dm.CriarConsulta(qryApropria);
   qryApropria.SQL.Text := SQL_APROPRIACAO;
   qryApropria.ParamByName('titulo').AsInteger := qyCompromissocd_titulo_principal.AsInteger;
   qryApropria.Open;

   codigo := qryApropria.FieldByName('cd_conta').AsInteger;

   FreeAndNil(qryApropria);

   result := codigo;
end;

procedure Tfrm_Compromisso_Baixar.MontaComboAcao;
var n : Word;
begin
    SetLength(ListaAcao, qyAcao.RecordCount);

    qyAcao.First();
    n := 0;

    cbAcaoMovimento.Items.Clear();

    while not qyAcao.Eof do
    begin

        ListaAcao[n] := qyAcao.FieldByName('cd_acao').AsInteger;
        cbAcaoMovimento.Items.Add(qyAcao.FieldByName('ds_acao').AsString);

        INC(n);
        qyAcao.Next();
    end;

    cbAcaoMovimento.ItemIndex := 0;
end;

procedure Tfrm_Compromisso_Baixar.cbAcaoMovimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
       SelectNext(Sender as TWinControl, True, True);
       key := #0;
   end;
end;

procedure Tfrm_Compromisso_Baixar.cbContasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
       SelectNext(Sender as TWinControl, True, True);
       key := #0;
   end;

end;

procedure Tfrm_Compromisso_Baixar.MontaComboFormaPgto;
Var
   qyForma : TUMZQuery;
   iComboPadrao : SmallInt;
begin
   // Montar a Combo de Lista de Formas de Pagamento;

   DM.CriarConsulta(qyForma);

   qyForma.SQL.Text :=
      ' SELECT * FROM fin_config_formas_pgto ' +
      ' WHERE cd_coligada_matriz = :cd_coligada_matriz ' +
      '   AND sn_ativo = 1 ' + 
      ' ORDER BY ds_forma_pgto ';
   qyForma.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyForma.Open();
   qyForma.FetchAll();

   SetLength(ListaFormaPgtoCod, qyForma.RecordCount);
   SetLength(ListaFormaPgtoCheque, qyForma.RecordCount);

   cbFormaPgto.Items.Clear();

   iComboPadrao := -1;

   while not qyForma.Eof do begin

       cbFormaPgto.Items.Add(qyForma.FieldByName('ds_forma_pgto').AsString);
       ListaFormaPgtoCod[cbFormaPgto.Items.Count-1] := qyForma.FieldByName('cd_forma_pgto').AsInteger;
       ListaFormaPgtoCheque[cbFormaPgto.Items.Count-1] := qyForma.FieldByName('sn_cadastra_cheque').AsInteger;

       if qyCompromissocd_forma_pgto.AsInteger = qyForma.FieldByName('cd_forma_pgto').AsInteger then
          iComboPadrao := cbFormaPgto.Items.Count-1;

       qyForma.Next();
   end;

   // Selecionar a Forma de Pagamento Padrão;

   cbFormaPgto.ItemIndex := iComboPadrao;

   FreeAndNil(qyForma);
end;

function Tfrm_Compromisso_Baixar.ProcuraCodigo(codigo: Integer;
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

procedure Tfrm_Compromisso_Baixar.cbFormaPgtoChange(Sender: TObject);
begin
    // Verificar se precisa digitar informações do Cheque
    edNrCheque.Enabled := ListaFormaPgtoCheque[cbFormaPgto.ItemIndex] = 1;
end;

procedure Tfrm_Compromisso_Baixar.cbFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
       SelectNext(Sender as TWinControl, True, True);
       key := #0;
   end;

end;

procedure Tfrm_Compromisso_Baixar.edNrChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
   begin
      SelectNext(Sender As TWinControl, True, True);
      key := #0;
   end
   else
   if not (key in ['0'..'9',#8]) then
      key := #0;
end;

procedure Tfrm_Compromisso_Baixar.edValorDescontoEnter(Sender: TObject);
begin
   valorEDesconto := edValorDesconto.getValor();
end;

procedure Tfrm_Compromisso_Baixar.edValorDescontoExit(Sender: TObject);
begin
   if valorEDesconto <> edValorDesconto.getValor() then
   begin
      CalculaBaixa(ValorDesconto);      
   end;
end;

end.

