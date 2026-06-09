unit uBaixarCompromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, ZConnection, DBCtrls, Buttons, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TBaixa = (Desconto, Cancelamento, Pagamento);

  TOrigemCalculo = (ValorPago, ValorMulta, ValorJuros, Inicial);

  TFrmBaixarCompromisso = class(TForm)
    pnTitulo: TPanel;
    pnConta: TPanel;
    pnCompromisso: TPanel;
    qyCompromisso: TUMZQuery;
    qyCompromissocd_titulo: TIntegerField;
    qyCompromissocd_pessoa: TIntegerField;
    qyCompromissonm_pessoa: TStringField;
    qyCompromissods_despesa: TStringField;
    qyCompromissodescTipoTitulo: TStringField;
    qyCompromissocd_tipo_titulo: TSmallintField;
    qyCompromissonr_documento: TStringField;
    qyCompromissonr_parcela: TSmallintField;
    qyCompromissodt_emissao_nota: TDateTimeField;
    qyCompromissodt_lancamento: TDateTimeField;
    qyCompromissodt_competencia: TDateTimeField;
    qyCompromissodt_vencimento: TDateTimeField;
    qyCompromissodt_provavel_pgto: TDateTimeField;
    qyCompromissovl_despesa: TFloatField;
    qyCompromissocd_situacao: TSmallintField;
    qyCompromissosn_previsao: TStringField;
    qyCompromissotp_entrada_saida: TSmallintField;
    qyCompromissodes_completa_titulo: TStringField;
    qyCompromissovl_entradas: TFloatField;
    qyCompromissovl_saidas: TFloatField;
    qyCompromissovalPendente: TCurrencyField;
    scrCompromisso: TDataSource;
    Label14: TLabel;
    pnBaixa: TPanel;
    Bevel3: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    txtValorTotalPago: TEdit;
    txtValorMulta: TEdit;
    txtValorJuros: TEdit;
    txtValorLiquidado: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnAcaoMovimento: TPanel;
    Label15: TLabel;
    cbAcaoMovimento: TComboBox;
    qyAcao: TUMZQuery;
    srcAcao: TDataSource;
    cbFormaPgto: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    edNrCheque: TEdit;
    qyCompromissocd_coligada: TSmallintField;
    qyCompromissocd_forma_pgto: TIntegerField;
    qyCompromissonr_cheque: TIntegerField;
    grd: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    cbContas: TComboBox;
    pnUnidadeEnsino: TPanel;
    Label2: TLabel;
    procedure edNrChequeKeyPress(Sender: TObject; var Key: Char);
    procedure cbFormaPgtoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qyCompromissoCalcFields(DataSet: TDataSet);
    procedure edCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure txtValorTotalPagoKeyPress(Sender: TObject; var Key: Char);
    procedure txtValorTotalPagoExit(Sender: TObject);
    procedure txtValorMultaExit(Sender: TObject);
    procedure txtValorJurosExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbAcaoMovimentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    lstContas : Array [1..30] of integer;

    ListaAcao : Array of Integer;

    ListaFormaPgtoCod : Array of Integer;
    ListaFormaPgtoCheque : Array of byte;

    Procedure CalculaBaixa(Origem : TOrigemCalculo);
    Procedure MontaComboAcao;

    Procedure MontaComboFormaPgto ;
    Procedure PreencherComboContas;

  public
    { Public declarations }

    tipoBaixa : TBaixa;
  end;

var
  FrmBaixarCompromisso: TFrmBaixarCompromisso;

implementation

uses uClassMovimento, uDM, uTesouraria_gerar, uCompromisso_Preparados, uContasPagar_Planilha,
  uSelCaixa;

{$R *.dfm}

procedure TFrmBaixarCompromisso.FormShow(Sender: TObject);
var
   sfiltro, sOp : String;
   n : Integer;
begin

   { Selecionar os títulos }

   sOp := ' ( ';

   For n := 0 To frm_compromisso_planilha.grd.SelectedRows.Count-1 do begin

      frm_Compromisso_Planilha.qryContasPagar.GotoBookmark(Pointer(frm_Compromisso_Planilha.grd.SelectedRows.Items[n]));
      sfiltro := sfiltro + sOp + sfiltro + '(cd_titulo = ' + frm_Compromisso_Planilha.qryContasPagarcd_titulo.AsString;
      sfiltro := sfiltro + ' AND cd_coligada = ' + frm_Compromisso_Planilha.qryContasPagarcd_coligada.AsString + ')';
      sOp := ' OR ';
   end;

   sfiltro := sfiltro + ' ) ';

   qyCompromisso.Close();
   qyCompromisso.SQL.Text :=
      ' SELECT cp.*, p.nm_pessoa, SUM(m.vl_entrada) AS vl_entradas, SUM(m.vl_saida) AS vl_saidas '+
      ' FROM fin_contas_pagar cp LEFT JOIN fin_mov_cp m ON (m.cd_titulo = cp.cd_titulo), pessoas p '+
      ' WHERE p.cd_pessoa = cp.cd_pessoa ' +
      ' AND ' + sfiltro +
      ' GROUP BY cp.cd_titulo ';
   qyCompromisso.Open();
   { / Selecionar os títulos }

   { Selecionar as Ações }
   qyAcao.Close;
   qyAcao.SQL.Clear;

   case tipoBaixa of
      Pagamento : begin
                     Self.Caption     := 'Baixar compromisso';
                     pnTitulo.Caption := 'Baixar compromisso';

                     CalculaBaixa(Inicial);

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 1 and cd_origem = 2 ORDER by ds_acao');

                     pnConta.Visible := True;

                  end;
      Desconto : begin
                     Self.Caption     := 'Aplicar abatimento ao título';
                     pnTitulo.Caption := 'Aplicar abatimento ao título';

                     txtValorMulta.Enabled := False;
                     txtValorJuros.Enabled := False;

                     CalculaBaixa(Inicial);

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 3 and cd_origem = 2 ORDER by ds_acao');

                     pnConta.Visible := False;

                  end;
      Cancelamento : begin
                     Self.Caption     := 'Cancelar compromisso';
                     pnTitulo.Caption := 'Cancelar compromisso';

                     txtValorMulta.Enabled := False;
                     txtValorJuros.Enabled := False;

                     CalculaBaixa(Inicial);

                     qyAcao.SQL.Add('SELECT * FROM fin_acoes_movimento where cd_tipo_acao = 2 and cd_origem = 2 ORDER by ds_acao');

                     pnConta.Visible := False;

                  end;
   end;

   qyAcao.Open;

   MontaComboAcao;

   MontaComboFormaPgto;

   PreencherComboContas;

   edNrCheque.Text := qyCompromissonr_cheque.AsString;
end;

procedure TFrmBaixarCompromisso.qyCompromissoCalcFields(
  DataSet: TDataSet);
begin
   qyCompromisso.FieldByName('valPendente').AsCurrency := qyCompromissovl_entradas.AsCurrency - qyCompromissovl_saidas.AsCurrency;
end;

procedure TFrmBaixarCompromisso.edCaixaKeyPress(Sender: TObject;
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

procedure TFrmBaixarCompromisso.txtValorTotalPagoKeyPress(
  Sender: TObject; var Key: Char);
begin
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

procedure TFrmBaixarCompromisso.CalculaBaixa(Origem :TOrigemCalculo) ;
var
   valBaixa : Currency;
   valMulta : Currency;
   valLiquido : Currency;
   valJuros : Currency;
begin

   try
      valBaixa := StrToFloat(txtValorTotalPago.Text);
   except
      valBaixa := 0;
   end;

   try
      valMulta := StrToFloat(txtValorMulta.Text);
   except
      valMulta := 0;
   end;

   try
      valLiquido := StrToFloat(txtValorLiquidado.Text);
   except
      valLiquido := 0;
   end;

   try
      valJuros := StrToFloat(txtValorJuros.Text);
   except
      valJuros := 0;
   end;

   if valBaixa >= qyCompromissovalPendente.AsCurrency then
   Begin


       case Origem of
         ValorPago : begin
                        valMulta := valBaixa - qyCompromissovalPendente.AsCurrency;
                        valJuros := 0;
                     end;
          ValorMulta : begin
                        valBaixa := qyCompromissovalPendente.AsCurrency + valMulta + valJuros;
                     end;
          ValorJuros : begin
                        valBaixa := qyCompromissovalPendente.AsCurrency + valMulta + valJuros;
                     end;
          Inicial  : begin
                        valBaixa := qyCompromissovalPendente.AsCurrency;
                        valMulta := 0;
                        valJuros := 0;
                     end;
       end;

       valLiquido := qyCompromissovalPendente.AsCurrency
   end
   else
   Begin
       if Origem = Inicial then
       begin
          valBaixa := qyCompromissovalPendente.AsCurrency;
       end;

       valLiquido := valBaixa;
       valMulta := 0;
       valJuros := 0;
   end;

   txtValorLiquidado.Text := FloatToStr(valLiquido);
   txtValorTotalPago.Text := FloatToStr(valBaixa);
   txtValorMulta.Text := FloatToStr(valMulta);
   txtValorJuros.Text := FloatToStr(valJuros);

end;

procedure TFrmBaixarCompromisso.txtValorTotalPagoExit(Sender: TObject);
begin
   CalculaBaixa(ValorPago);
end;

procedure TFrmBaixarCompromisso.txtValorMultaExit(Sender: TObject);
begin
   CalculaBaixa(ValorMulta);
end;

procedure TFrmBaixarCompromisso.txtValorJurosExit(Sender: TObject);
begin
   CalculaBaixa(ValorJuros);
end;

procedure TFrmBaixarCompromisso.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmBaixarCompromisso.BitBtn1Click(Sender: TObject);
Var
   Movimento : TMovimento;
   tpConta : word;
   cdAbertura : Integer;
   CodMovimento : Integer;
begin

   Movimento := TMovimento.Create;
   {Movimento.Coligada := DM.iColigadaSelecionada;}

   if (tipoBaixa = Pagamento ) then
   begin
        if (cbContas.ItemIndex = - 1) then
        Begin
           Mensagem('Selecione a conta que será usada para pagamento.', 'Atenção', MB_OK + MB_ICONWARNING);
           Movimento.Free;
           Abort;
        end;

        if (cbFormaPgto.ItemIndex < 0 ) then
        Begin
           Mensagem('Selecione a forma de pagamento que está sendo utilizada.', 'Atenção', MB_OK + MB_ICONWARNING);
           Movimento.Free;
           Abort;
        end;


        if not Movimento.VerificaContaAtiva(frm_selCAixa.qyCaixa.FieldByName('cd_caixa').AsInteger, tpConta, cdAbertura ) then
        begin
           Mensagem('A conta selecionada não está ativa, não é possível efetuar a baixa.', 'Atenção', MB_OK + MB_ICONWARNING);
           Movimento.Free;
           Abort;
        end;

        if (tpConta = 3) AND (cdAbertura <= 0) then
        begin
           if not Movimento.VerificaContaAtiva(frm_selCAixa.qyCaixa.FieldByName('cd_caixa').AsInteger, tpConta, cdAbertura ) then
           begin
              Mensagem('A conta caixa está fechada. Abra a conta antes de baixar o compromisso.',  'Atenção', MB_OK + MB_ICONWARNING);
              Movimento.Free;
              Abort;
           end;
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
       frm_tesouraria_gerar.NumeroCheque := qyCompromissonr_cheque.AsString;

       if tpConta = 3  then begin   // Conta Caixa
          frm_tesouraria_gerar.ValorDinheiro := StrToFloat(txtValorTotalPago.Text);
          frm_Tesouraria_gerar.ValorCheque := 0;
       end
       else begin
          frm_tesouraria_gerar.ValorDinheiro := 0;
          frm_Tesouraria_gerar.ValorCheque := StrToFloat(txtValorTotalPago.Text);
       end;

       frm_tesouraria_gerar.DataLiberacao := Date;
       frm_tesouraria_gerar.CodigoMovimento:= 0;
       frm_Tesouraria_gerar.DataLancamento := Date;

       frm_Tesouraria_gerar.CodigoTitulo := qyCompromissocd_titulo.AsInteger;

       CodMovimento := frm_tesouraria_gerar.GeraMovimentacao(2, frm_selCAixa.qyCaixa.FieldByName('cd_caixa').AsInteger , 3, qyCompromissocd_coligada.AsInteger);

       // Cancelar a Baixa, pois não gerou movimentação na Tesouraria
       if CodMovimento < 0 then
          Exit;

       // Guardar a conta que foi utilizada para pagar no contas_pagar

       {DM.qyAux2.Close;
       DM.qyAux2.SQL.Text :=
          ' UPDATE fin_contas_pagar set cd_caixa = ' + IntToStr(lstContas[cbContas.ItemIndex]) +
          ' WHERE cd_titulo = ' + qyCompromissocd_titulo.AsString +
          ' AND cd_coligada = ' + IntToStr(DM.iColigadaSelecionada);
       Dm.qyAux2.ExecSQL();}

   end;

   { Verificar Tipo de Conta se o tipo = Pagamento }

   Movimento := TMovimento.Create;

   case tipoBaixa of
      Pagamento    : Movimento.TipoDeAcao := BaixarporPagamento;
      Desconto     : Movimento.TipoDeAcao := BaixarporDesconto;
      Cancelamento : Movimento.TipoDeAcao := BaixarporCancelamento;
   end;

   Movimento.CodigoTitulo := qyCompromissocd_titulo.AsInteger;
   Movimento.Coligada     := qyCompromissocd_coligada.AsInteger;
   Movimento.CodAcao :=  ListaAcao[cbAcaoMovimento.ItemIndex];
   Movimento.ValorMovimento := StrToFLoat(txtValorLiquidado.Text);
   Movimento.ValorMulta := StrToFloat(txtValorMulta.Text);
   Movimento.ValorJuros := StrToFloat(txtValorJuros.Text);
   Movimento.ValorLiquido := StrToFloat(txtValorTotalPago.Text);
   Movimento.Observacao := '';

   Movimento.RegistrarMovimentacaoCP(CodMovimento);

   Movimento.Free;

   Close;

end;

procedure TFrmBaixarCompromisso.MontaComboAcao;
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

procedure TFrmBaixarCompromisso.cbAcaoMovimentoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
       SelectNext(Sender as TWinControl, True, True);
       key := #0;
   end;
end;

procedure TFrmBaixarCompromisso.MontaComboFormaPgto;
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
   qyForma.Open;
   qyForma.FetchAll;

   SetLength(ListaFormaPgtoCod, qyForma.RecordCount);
   SetLength(ListaFormaPgtoCheque, qyForma.RecordCount);

   cbFormaPgto.Items.Clear;

   iComboPadrao := -1;

   while not qyForma.Eof do begin

       cbFormaPgto.Items.Add(qyForma.FieldByName('ds_forma_pgto').AsString);
       ListaFormaPgtoCod[cbFormaPgto.Items.Count-1] := qyForma.FieldByName('cd_forma_pgto').AsInteger;
       ListaFormaPgtoCheque[cbFormaPgto.Items.Count-1] := qyForma.FieldByName('sn_cadastra_cheque').AsInteger;

       if qyCompromissocd_forma_pgto.AsInteger = qyForma.FieldByName('cd_forma_pgto').AsInteger then
          iComboPadrao := cbFormaPgto.Items.Count-1;

       qyForma.Next;
   end;

   // Selecionar a Forma de Pagamento Padrão;

   cbFormaPgto.ItemIndex := iComboPadrao;

   FreeAndNil(qyForma);

end;

procedure TFrmBaixarCompromisso.cbFormaPgtoChange(Sender: TObject);
begin
    // Verificar se precisa digitar informações do Cheque
    edNrCheque.Enabled := ListaFormaPgtoCheque[cbFormaPgto.ItemIndex] = 1;
end;

procedure TFrmBaixarCompromisso.edNrChequeKeyPress(Sender: TObject;
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

procedure TFrmBaixarCompromisso.PreencherComboContas;
var
  qyContas : TUMZQuery;
  n : Integer;
begin

  DM.CriarConsulta(qyContas);

{  qyContas.SQL.Text :=
     ' SELECT cd_caixa, ds_caixa, nr_ultimo_cheque FROM fin_cadastro_contas ' +
     ' WHERE sn_ativa = "S" AND tp_conta <> 3 AND cd_coligada = ' + IntToStr(DM.iColigadaSelecionada) +
     ' ORDER BY cd_caixa ';}

  qyContas.Open();

  cbContas.Items.Clear;

  n := 0;

  while not qyContas.Eof do begin
      cbContas.Items.Add(FillString(qyContas.FieldByName('cd_caixa').AsString, alRight, '0', 6, True ) + ' - ' + qyContas.FieldByName('ds_caixa').AsString);

      lstContas[n] := qyContas.FieldByName('cd_caixa').AsInteger;

      qyContas.Next();

      INC(n);
  end;

  cbContas.ItemIndex := -1;

  FreeAndNil(qyContas);

end;

end.

