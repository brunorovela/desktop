unit uCancelarOperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Grids, ExtCtrls, UMAjuda, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, General, uClassMovimento;

type
  TfrmCancelarOperacao = class(TForm)
    Panel1: TPanel;
    pnRemessaTit: TPanel;
    Panel2: TPanel;
    btnLiquidar: TSpeedButton;
    btnCancelar: TSpeedButton;
    mObservacao: TMemo;
    pnMensagemTopo: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    dbgMensalidades: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    lbTotal: TLabel;
    Label2: TLabel;
    lbQtdParcelas: TLabel;
    Label4: TLabel;
    lbDataOperacao: TLabel;
    Panel4: TPanel;
    dsMensalidades: TDataSource;
    qyMensalidades: TUMZQuery;
    qyMensalidadesnm_pessoa: TStringField;
    qyMensalidadesturma: TStringField;
    qyMensalidadesanosemestre: TSmallintField;
    qyMensalidadesparcela: TSmallintField;
    qyMensalidadesvalorpago: TFloatField;
    qyMensalidadesvl_total: TFloatField;
    qyMensalidadesnr_qtd_parcelas: TIntegerField;
    qyMensalidadesdt_operacao: TDateTimeField;
    qyMensalidadescd_mensalidade: TIntegerField;
    qyMensalidadescd_mensalidade_origem: TIntegerField;
    qyMensalidadescd_coligada: TIntegerField;
    procedure btnLiquidarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    cd_operacao: Integer;
    retorno: Boolean;

    procedure carregaDadosTela();
    procedure limpaOperacao(cd_operacao: Integer);

    function validaCancelarOperacao(): Boolean;
    function validaEstornoMensalidades(): Boolean;
  public
    function cancelarOperacao(cd_operacao: Integer): Boolean;  
  end;

var
  frmCancelarOperacao: TfrmCancelarOperacao;

implementation

{$R *.dfm}

procedure TfrmCancelarOperacao.btnCancelarClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmCancelarOperacao.btnLiquidarClick(Sender: TObject);
begin
   if not validaCancelarOperacao() then Exit;
   if not validaEstornoMensalidades() then Exit;

   limpaOperacao(Self.cd_operacao);
   Retorno := True;

   Self.Close;
end;

function TfrmCancelarOperacao.cancelarOperacao(cd_operacao: Integer): Boolean;
begin
   Retorno := False;
   Self.cd_operacao := cd_operacao;
   Self.ShowModal;
   Result := Retorno;
end;

procedure TfrmCancelarOperacao.carregaDadosTela;
begin
   qyMensalidades.Close;
   qyMensalidades.ParamByName('cd_operacao').AsInteger := Self.cd_operacao;
   qyMensalidades.Open;

   lbTotal.Caption         := qyMensalidadesvl_total.AsString;
   lbQtdParcelas.Caption   := qyMensalidadesnr_qtd_parcelas.AsString;
   lbDataOperacao.Caption  := FormatDateTime('d/m/y', qyMensalidadesdt_operacao.AsDateTime);
end;

procedure TfrmCancelarOperacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCancelarOperacao.FormShow(Sender: TObject);
begin
   mObservacao.Text := '';
   mObservacao.SetFocus;
   
   carregaDadosTela;
end;

procedure TfrmCancelarOperacao.limpaOperacao(cd_operacao: Integer);
const
   SQL_MENSALIDADES =
      ' DELETE FROM fin_cartao_mensalidades WHERE cd_operacao = :cd_operacao ';
   SQL_PARCELAS =
      ' DELETE FROM fin_cartao_parcelas WHERE cd_operacao = :cd_operacao ';
   SQL_OPERACAO =
      ' DELETE FROM fin_cartao_operacao WHERE cd_operacao = :cd_operacao ';
var
   qyLimpaOperacao: TUMZQuery;
begin
   DM.CriarConsulta(qyLimpaOperacao);

   qyLimpaOperacao.SQL.Text := SQL_MENSALIDADES;
   qyLimpaOperacao.ParamByName('cd_operacao').AsInteger := cd_operacao;
   qyLimpaOperacao.ExecSQL;

   qyLimpaOperacao.Close;
   qyLimpaOperacao.SQL.Text := SQL_PARCELAS;
   qyLimpaOperacao.ParamByName('cd_operacao').AsInteger := cd_operacao;
   qyLimpaOperacao.ExecSQL;
   
   qyLimpaOperacao.Close;
   qyLimpaOperacao.SQL.Text := SQL_OPERACAO;
   qyLimpaOperacao.ParamByName('cd_operacao').AsInteger := cd_operacao;
   qyLimpaOperacao.ExecSQL;
end;

function TfrmCancelarOperacao.validaCancelarOperacao: Boolean;
begin
   Result := True;

   if mObservacao.Text = '' then
   begin
      Mensagem(
         'Favor preencher motivo do estorno.',
         'Aviso',
         MB_OK + MB_ICONWARNING,
         Handle
      );

      Result := False;
      Exit;
   end;
end;

function TfrmCancelarOperacao.validaEstornoMensalidades: Boolean;
var
   qyMovimentos,
   qyTemp1: TUMZReadOnlyQuery;

   qyAltera: TUMZQuery;

   movimento: TMovimento;
   
   iCodCaixa,
   iCodAbertura,
   i,
   iCodAberturaAtual: Integer;

   iTpConta: Word;

   dblDinheiro,
   dblCheque: Currency;

   sCodMensalidadeOrigem,
   ds_historico: String;
begin
   Result := True;

   // Data de operação = data que a mensalidade foi baixada
   if DM.EstaBloqueado(qyMensalidadesdt_operacao.AsDateTime, True) then
   begin
      Result := False;
      Exit;
   end;

   DM.CriarConsulta(qyMovimentos);
   DM.CriarConsulta(qyTemp1);

   qyMensalidades.DisableControls;

   qyMensalidades.First;

   while not qyMensalidades.Eof do
   begin
      qyMovimentos.Close;
      qyMovimentos.SQL.Clear;
      qyMovimentos.SQL.Add(' SELECT * FROM fin_mov_tesouraria WHERE nr_estorno = 0 and cd_mensalidade = :CdMensalidade ');
      qyMovimentos.SQL.Add(' ORDER BY cd_movimento_te ');
      qyMovimentos.ParamByName('CdMensalidade').AsInteger := qyMensalidadescd_mensalidade.AsInteger;
      qyMovimentos.Open;

      if qyMovimentos.Eof then
      begin
         Mensagem( 'Não é possível estornar uma parcela que não entrou no caixa.', Application.Title, MB_OK + MB_ICONSTOP );
         Result := False;
         Exit;
      end;

      while not qyMovimentos.Eof do
      begin
         // Códigos dos caixas que a parcela foi baixada
         iCodCaixa := qyMovimentos.FieldByName('cd_caixa').AsInteger;
         iCodAbertura := qyMovimentos.FieldByName('cd_abertura_caixa').AsInteger;

         movimento := TMovimento.Create;

         movimento.Coligada := DM.getColigadaByTurma(
            qyMensalidadesturma.AsString,
            qyMensalidadesanosemestre.AsInteger
         );

         if not Movimento.VerificaContaAtiva(iCodCaixa, iTpConta, iCodAberturaAtual) then
         begin
            Mensagem(
               'Não é possível estornar a mensalidade ' + qyMensalidadescd_mensalidade.AsString +'. A conta não está mais ativa.',
               'Aviso',
               MB_OK + MB_ICONWARNING,
               Handle
            );
            Result := False;
            Exit;
         end;

         if (iTpConta = 3) AND (iCodAberturaAtual = 0) then
         begin
            Mensagem(
               'Não é possível estornar a mensalidade ' + qyMensalidadescd_mensalidade.AsString +'. O caixa está fechado.',
               'Aviso',
               MB_OK + MB_ICONWARNING,
               Handle
            );
            Result := False;
            Exit;
         end;

         movimento.free;

         // Verificar se tem alguma parcela parcial PAGA abaixo deste cd_mensalidade;

         // Verifica se possui código de mensalidade origem
         // Se não possuir utiliza o código da mensalidade
         if qyMensalidadescd_mensalidade_origem.IsNull then
         begin
            sCodMensalidadeOrigem := qyMensalidadescd_mensalidade.AsString;
         end
         else
         begin
            sCodMensalidadeOrigem := qyMensalidadescd_mensalidade_origem.AsString;
         end;

         qyTemp1.Close();
         qyTemp1.SQL.Text :=
            ' SELECT count(*) AS resultado FROM mensalidades m ' +
            '  WHERE m.cd_mensalidade_origem = ' + sCodMensalidadeOrigem +
            '    AND m.cd_mensalidade > ' + qyMensalidadescd_mensalidade.AsString +
            '    AND m.situacao in (0,1) ';

         qyTemp1.Open();

         if qyTemp1.FieldByName('resultado').AsInteger > 0 then
         begin
            Mensagem(
               'Existe um título parcial da mensalidade ' + qyMensalidadescd_mensalidade.AsString +' baixado. Você deverá estornar primeiro esta parcial.',
               'Aviso',
               MB_OK + MB_ICONWARNING,
               Handle               
            );
            Result := False;
            Exit;
         end;

         qyMovimentos.Next();
      end;

      qyMovimentos.First;

      while not qyMovimentos.Eof do
      begin
         // Códigos dos caixas que a parcela foi baixada
         iCodCaixa      := qyMovimentos.FieldByName('cd_caixa').AsInteger;
         iCodAbertura   := qyMovimentos.FieldByName('cd_abertura_caixa').AsInteger;
         dblDinheiro    := qyMovimentos.FieldByName('vl_dinheiro').AsCurrency;
         dblCheque      := qyMovimentos.FieldByName('vl_cheque').AsCurrency;
         ds_historico   := qyMovimentos.FieldByNAme('ds_movimento').AsString;

         movimento := TMovimento.Create;

         movimento.Historico        := 'ESTORNO ' + qyMovimentos.FieldByName('ds_movimento').AsString;
         Movimento.ValorMovimento   := qyMovimentos.FieldByName('vl_movimento').AsCurrency;
         Movimento.ValorEmDinheiro  := qyMovimentos.FieldByName('vl_dinheiro').AsCurrency;
         Movimento.ValorEmCheque    := qyMovimentos.FieldByName('vl_cheque').AsCurrency;
         Movimento.Mensalidade      := qyMovimentos.FieldByName('cd_mensalidade').AsInteger;
         Movimento.CodAcao          := 6;
         Movimento.NumeroDocumento  := qyMovimentos.FieldByName('nr_documento').AsString;
         Movimento.DataLiberacao    := Date;
         Movimento.Origem           := 1;
         Movimento.DataMovimento    := qyMovimentos.FieldByName('dt_movimento').AsDateTime;
         Movimento.Coligada         := qyMovimentos.FieldByName('cd_coligada').AsInteger;
         Movimento.FormaDePagamento := qyMovimentos.FieldByName('cd_forma_pgto').AsInteger;

         if qyMovimentos.FieldByName('tp_entrada_saida').AsInteger = 1 then
         begin
           Movimento.EntradaSaida    := 2;
         end
         else
         begin
           Movimento.EntradaSaida    := 1;
         end;

         Movimento.RegistrarMovimentacaoTe( iCodCaixa );

         // Registrar o Estorno

         DM.CriarConsulta(qyAltera);
         
         qyAltera.SQL.Text := 'SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria';
         qyAltera.Open();

         i := qyAltera.FieldByName('ultimo').AsInteger + 1;

         qyAltera.Close();

         qyAltera.SQL.Text :=
            ' UPDATE fin_mov_tesouraria      ' +
            ' SET '+
            '   nr_estorno = ' + IntToStr(i) +
            ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
            ' WHERE cd_movimento_te in (' + IntToStr(qyMovimentos.FieldByName('cd_movimento_te').AsInteger) + ', ' + IntToStr(Movimento.CodigoMovimento) + ') AND cd_coligada = ' + qyMovimentos.FieldByName('cd_coligada').AsString;
         qyAltera.ExecSQL();

         // Estornar a Apropriação na tesouraria

         qyAltera.SQL.Text := ' DELETE FROM fin_apropria_te WHERE cd_movimento_te = ' + qyMovimentos.FieldByName('cd_movimento_te').AsString +
            ' AND cd_coligada = ' + qyMovimentos.FieldByName('cd_coligada').AsString;
         qyAltera.ExecSQL();

         // Liberar no retorno para baixar novamente

         qyAltera.SQL.Text := ' UPDATE itensretorno SET sn_baixado = 0 WHERE cd_mensalidade = ' + qyMensalidadescd_mensalidade.AsString;
         qyAltera.ExecSQL();

         FreeAndNil(qyAltera);
         
         Movimento.registraEstorno(
            qyMovimentos.FieldByName('cd_movimento_te').AsInteger,
            qyMovimentos.FieldByName('cd_caixa').AsInteger,
            qyMensalidadescd_mensalidade.AsInteger,
            qyMensalidadescd_coligada.AsInteger,
            dm.iCdPessoaLogado,
            qyMensalidadesdt_operacao.AsDateTime,
            mObservacao.Text,
            0
         );

         Movimento.free;

         qyMovimentos.Next();
      end;

      DM.tblMensalidades.Close;
      DM.tblMensalidades.SQL.Clear;
      DM.tblMensalidades.SQL.Add( 'select * from mensalidades where' );
      DM.tblMensalidades.SQL.Add( '(cd_mensalidade = :CdMensalidade)' );
      DM.tblMensalidades.ParamByName('CdMensalidade').AsInteger :=
         qyMensalidadescd_mensalidade.AsInteger;
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

      qyMovimentos.Close;
      qyMovimentos.SQL.Clear;

      qyMovimentos.SQL.Add(
         ' DELETE FROM fin_mov_cr '  +
         '  WHERE cd_mensalidade = :CdMensalidade ' +
         '  AND cd_coligada = :CdColigada ' +
         '  ORDER BY nr_sequencia DESC LIMIT 1 '
      );
      
      qyMovimentos.ParamByName('CdMensalidade').AsString := sCodMensalidadeOrigem;
      qyMovimentos.ParamByName('CdColigada').AsInteger := qyMensalidadescd_coligada.AsInteger;
      qyMovimentos.ExecSQL();

      // Excluir as parcial criadas pela baixa
      qyTemp1.Close();
      qyTemp1.SQL.Text :=
         ' DELETE FROM mensalidades ' +
         '  WHERE cd_mensalidade_origem = ' + sCodMensalidadeOrigem +
         '    AND cd_mensalidade > ' + qyMensalidadescd_mensalidade.AsString +
         '    AND situacao not in (0,1) ';

      qyTemp1.ExecSQL();

      qyMensalidades.Next;
   end;

   qyMensalidades.EnableControls;
end;

end.
