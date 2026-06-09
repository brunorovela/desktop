unit uLiquidaCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DB, ZAbstractRODataset, UZDataset, uDM, StdCtrls,
  UMComboBox, uItemCombo, Mask, uClassMovimento, General, Buttons;

type
   TSucesso = record
      sucesso: Boolean;
      mensagem: String;
      caixaEntrada: Integer;
      caixaSaida: Integer;
   end;

  TfrmLiquidar = class(TForm)
    Panel1: TPanel;
    pnRemessaTit: TPanel;
    sgTotais: TStringGrid;
    Label1: TLabel;
    cbTransferir: TUMComboBox;
    Label2: TLabel;
    meDataTransferencia: TMaskEdit;
    lbQtdParcelas: TLabel;
    Panel2: TPanel;
    btnLiquidar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    valorTotal,
    valorTaxa,
    valorLiquido: Double;

    procedure limpaGrid();
    procedure carregaTotaisGrid();
    procedure carregaContasTransferir();
    procedure carregaLabelQtdParcelas();
    procedure carregaContaAdministradora();
    procedure geraTaxaCartao(transferencia: TSucesso);
    procedure geraApropriaTaxaCartao(cdMovimentoTaxa: Integer; transferencia: TSucesso);
    procedure liquidaParcelas(transferencia: TSucesso);

    function isContaTarifaConfigurada(cdConta: Integer): Boolean;
    function realizaTransferencia(): TSucesso;
    function getContaAdministradora(Field: String): Integer;
    function getNomeConta(cdConta: Integer): String;
    function getContaBaixa(): Integer;
  public
    strParcelas: String;
    
    qtdParcelas,
    cdOperacao,
    cdAdminCartao: Integer;

    snCredito: Boolean;

    retorno: Boolean;

    function liquidarTaxas(): Boolean;
  end;

var
  frmLiquidar: TfrmLiquidar;

implementation

{$R *.dfm}

{ TfrmLiquidar }

procedure TfrmLiquidar.btnCancelarClick(Sender: TObject);
begin
   retorno := False;
   
   Self.Close;
end;

procedure TfrmLiquidar.Button1Click(Sender: TObject);
var
   transferencia: TSucesso;
begin
   transferencia := realizaTransferencia;

   if not(transferencia.sucesso) then
   begin
      Mensagem(         
         transferencia.mensagem,
         'Aviso',
         MB_OK + MB_ICONWARNING
      );
      
      Exit;
   end;

   geraTaxaCartao(transferencia);
   liquidaParcelas(transferencia);

   DM.setLog(
      123654,
      'Baixa',
      'Liquidação das parcelas',
      0,
      '{"codigo_parcelas": "'+strParcelas+'"}'
   );

   Self.Close;
end;

procedure TfrmLiquidar.Button2Click(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmLiquidar.carregaContaAdministradora;
var
   field: String;

   i,
   cdConta: Integer;
begin
   cdConta := Self.getContaAdministradora('cd_conta_baixa');

   for I := 0 to cbTransferir.Items.Count - 1 do
   begin
      if TItemCombo(cbTransferir.Items.Objects[i]).getCodigo = IntToStr(cdConta) then
      begin
         cbTransferir.ItemIndex := i;
         Exit;
      end;     
   end;
end;

procedure TfrmLiquidar.carregaContasTransferir;
var
   qyContas: TUMZReadOnlyQuery;
begin
   cbTransferir.Items.Clear;

   DM.CriarConsulta(qyContas);

   qyContas.Close();
   qyContas.SQL.Clear;
   qyContas.SQL.Add('SELECT                                                               ');
   qyContas.SQL.Add(' cc.cd_caixa, cc.ds_caixa                                            ');
   qyContas.SQL.Add('FROM                                                                 ');
   qyContas.SQL.Add(' fin_cadastro_contas cc                                              ');
   qyContas.SQL.Add(' INNER JOIN fin_contas_usuarios u ON (cc.cd_caixa = u.cd_caixa ) AND ');
   qyContas.SQL.Add('    (cc.CD_COLIGADA = u.CD_COLIGADA)                                 ');
   qyContas.SQL.Add('WHERE                                                                ');
   qyContas.SQL.Add(' cc.sn_ativa = ''S''                                                 ');
   qyContas.SQL.Add(
      Format( ' AND ( cc.cd_coligada IN (%s) OR cc.sn_todas_coligadas = 1) ',
         [DM.UsuarioLogado.GetColigadasFilhaSelecionada()])                               );
   qyContas.SQL.Add(' AND u.cd_usuario = ' + IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)  );
   qyContas.SQL.Add(' ORDER BY cc.ds_caixa                                                ');
   qyContas.Open();

   while not qyContas.Eof do
   begin
      cbTransferir.Items.AddObject(
         qyContas.FieldByName('ds_caixa').AsString,
         TItemCombo.Create(
            qyContas.FieldByName('cd_caixa').AsString,
            qyContas.FieldByName('ds_caixa').AsString
         )
      );

      qyContas.Next;
   end;
end;

procedure TfrmLiquidar.carregaLabelQtdParcelas;
begin
   lbQtdParcelas.Caption := 'Quantidade de Parcelas Transferidas: ' + IntToStr(Self.qtdParcelas); 
end;

procedure TfrmLiquidar.carregaTotaisGrid;
const
   SQL_TOTAIS =
      '  SELECT '+
      '     SUM(fcp.vl_valor_parcela) AS valor, '+
      '     SUM(ROUND(fcp.vl_valor_parcela * (fco.nr_taxa / 100), 2))	AS valor_taxa, '+
      '     ROUND(SUM(fcp.vl_valor_parcela) - SUM(ROUND(fcp.vl_valor_parcela * (fco.nr_taxa / 100), 2)), 2) AS valor_liquido '+
      '  FROM '+
      '     fin_cartao_parcelas fcp '+
      '  INNER JOIN fin_cartao_operacao fco ON ( '+
      '     fco.cd_operacao = fcp.cd_operacao '+
      '  ) '+
      '  WHERE '+
      '     fcp.cd_parcela IN (%s) ';
var
   qyTotais: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyTotais);

   qyTotais.SQL.Text := Format(SQL_TOTAIS, [strParcelas]);
   qyTotais.Open;

   valorTotal     := qyTotais.FieldByName('valor').AsFloat;
   valorTaxa      := qyTotais.FieldByName('valor_taxa').AsFloat;
   valorLiquido   := qyTotais.FieldByName('valor_liquido').AsFloat;

   sgTotais.Cols[0][1] := 'R$ ' + qyTotais.FieldByName('valor').AsString;
   sgTotais.Cols[1][1] := 'R$ ' + qyTotais.FieldByName('valor_taxa').AsString;
   sgTotais.Cols[2][1] := 'R$ ' + qyTotais.FieldByName('valor_liquido').AsString;
end;

procedure TfrmLiquidar.FormShow(Sender: TObject);
begin
   limpaGrid;
   carregaTotaisGrid;
   carregaContasTransferir;
   carregaLabelQtdParcelas;
   carregaContaAdministradora;

   meDataTransferencia.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TfrmLiquidar.geraApropriaTaxaCartao(cdMovimentoTaxa: Integer; transferencia: TSucesso);
const
   SQL_BUSCA_PLANO_CENTRO_TARIFA =
      ' SELECT '+
      '     cd_centro_tarifa, '+
      '     cd_conta_tarifa '+
      '  FROM '+
      '     fin_cadastro_contas '+
      '  WHERE '+
      '     cd_caixa = :cd_caixa ';

   SQL_INSERE_APROPRIA =
      '  INSERT INTO fin_apropria_te ( '+
      '     cd_movimento_te, '+
      '     cd_conta, '+
      '     cd_coligada, '+
      '     cd_centro, '+
      '     vl_movimento '+
      '  ) '+
      '  VALUES '+
      '  ( '+
      '     :cd_movimento_te, '+
      '     :cd_conta, '+
      '     :cd_coligada, '+
      '     :cd_centro, '+
      '     :vl_movimento '+
      '  ) ';
var
   cdContaSaida: Integer;

   qyInsereTaxa: TUMZQuery;
   qyBuscaCodigosTarifa: TUMZReadOnlyQuery;
begin
   cdContaSaida := transferencia.caixaSaida;

   DM.CriarConsulta(qyInsereTaxa);
   DM.CriarConsulta(qyBuscaCodigosTarifa);

   qyBuscaCodigosTarifa.SQL.Text := SQL_BUSCA_PLANO_CENTRO_TARIFA;
   qyBuscaCodigosTarifa.ParamByName('cd_caixa').AsInteger := cdContaSaida;
   qyBuscaCodigosTarifa.Open;
   
   qyInsereTaxa.SQL.Text := SQL_INSERE_APROPRIA;
   
   qyInsereTaxa.ParamByName('cd_movimento_te').AsInteger :=
      cdMovimentoTaxa;

   qyInsereTaxa.ParamByName('cd_conta').AsInteger :=
      qyBuscaCodigosTarifa.FieldByName('cd_conta_tarifa').AsInteger;

   qyInsereTaxa.ParamByName('cd_coligada').AsInteger :=
      1;

   qyInsereTaxa.ParamByName('cd_centro').AsInteger :=
      qyBuscaCodigosTarifa.FieldByName('cd_centro_tarifa').AsInteger;

   qyInsereTaxa.ParamByName('vl_movimento').AsFloat := valorTaxa;
   qyInsereTaxa.ExecSQL;
end;

procedure TfrmLiquidar.geraTaxaCartao(transferencia: TSucesso);
var
   cdContaSaida,
   cdMovimentoTaxa: Integer;
   
   mvSaida: TMovimento;
begin
   cdContaSaida := transferencia.caixaSaida;

   mvSaida := TMovimento.create;

   mvSaida.CodAcao := DM.BuscarCodigoAcaoPadrao(7);
   mvSaida.ValorMovimento := valorTaxa;
   mvSaida.ValorEmCheque := 0;
   mvSaida.ValorEmDinheiro := valorTaxa;
   mvSaida.Historico := 'Taxa Cartão - Tesouraria -> Controle de Cartões -> Liquidar';

   mvSaida.DataLiberacao := Date;
   mvSaida.Origem := 3;  // Tesouraria
   mvSaida.EntradaSaida := 2; // Saida
   mvSaida.DataMovimento := StrToDate(meDataTransferencia.Text);
   mvSaida.Coligada := 1;

   cdMovimentoTaxa := mvSaida.RegistrarMovimentacaoTe(cdContaSaida);

   geraApropriaTaxaCartao(cdMovimentoTaxa, transferencia);
end;

function TfrmLiquidar.getContaAdministradora(Field: String): Integer;
const
   SQL_BUSCA_CONTA =
      '  SELECT '+
      '     %s '+
      '  FROM '+
      '     fin_cadastro_admin_cartao '+
      '  WHERE '+
      '     cd_admin_cartao = :cd_admin_cartao ';
var
   qyContas: TUMZReadOnlyQuery;

   creditoDebito: String;
begin
   Result := 0;

   DM.CriarConsulta(qyContas);

   creditoDebito := '_debito';

   if snCredito then creditoDebito := '_credito';

   qyContas.SQL.Text := Format(SQL_BUSCA_CONTA, [Field + creditoDebito]);
   qyContas.ParamByName('cd_admin_cartao').AsInteger :=
      Self.cdAdminCartao;
   qyContas.Open;

   Result := StrToIntDef(qyContas.FieldByName(Field + creditoDebito).AsString, -1);
end;

function TfrmLiquidar.getContaBaixa(): Integer;
const
   SQL_BUSCA_CONTA =
      ' SELECT cd_caixa FROM fin_cartao_operacao WHERE cd_operacao = :cd_operacao ';
var
   qyConta: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyConta);

   qyConta.SQL.Text := SQL_BUSCA_CONTA;
   qyConta.ParamByName('cd_operacao').AsInteger := cdOperacao;
   qyConta.Open;

   Result := qyConta.FieldByName('cd_caixa').AsInteger;
end;

function TfrmLiquidar.getNomeConta(cdConta: Integer): String;
const
   SQL_BUSCA_DESCRICAO = 
      ' SELECT ds_caixa FROM fin_cadastro_contas WHERE cd_caixa = :cd_caixa ';
var
   qyConta: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyConta);

   qyConta.SQL.Text := SQL_BUSCA_DESCRICAO;
   qyConta.ParamByName('cd_caixa').AsInteger := cdConta;
   qyConta.Open;

   Result := qyConta.FieldByName('ds_caixa').AsString;
end;

function TfrmLiquidar.isContaTarifaConfigurada(cdConta: Integer): Boolean;
const
   SQL_BUSCA_PLANO_CENTRO_TARIFA =
      ' SELECT '+
      '     cd_centro_tarifa, '+
      '     cd_conta_tarifa '+
      '  FROM '+
      '     fin_cadastro_contas '+
      '  WHERE '+
      '     cd_caixa = :cd_caixa ';
var
   cdContaSaida: Integer;

   qyCodigosTarifa: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyCodigosTarifa);
   
   qyCodigosTarifa.SQL.Text := SQL_BUSCA_PLANO_CENTRO_TARIFA;
   qyCodigosTarifa.ParamByName('cd_caixa').AsInteger := cdConta;
   qyCodigosTarifa.Open;

   Result :=   (qyCodigosTarifa.FieldByName('cd_centro_tarifa').AsString <> '') and
               (qyCodigosTarifa.FieldByName('cd_conta_tarifa').AsString <> '');
end;

procedure TfrmLiquidar.limpaGrid;
begin
   sgTotais.ColWidths[0] := 120;
   sgTotais.ColWidths[1] := 120;
   sgTotais.ColWidths[2] := 100;

   sgTotais.Cols[0][0] := 'Valor Bruto';
   sgTotais.Cols[1][0] := 'Valor Taxa';
   sgTotais.Cols[2][0] := 'Valor líquido';

   sgTotais.Cols[0][1] := '';
   sgTotais.Cols[1][1] := '';
   sgTotais.Cols[2][1] := '';
end;

procedure TfrmLiquidar.liquidaParcelas(transferencia: TSucesso);
const
   SQL_LIQUIDA =
      ' UPDATE fin_cartao_parcelas '+
      '  SET sn_liquidado = 1, cd_caixa_atual = :cd_caixa_atual '+
      '  WHERE '+
      '     cd_parcela IN (%s) ';
var
   qyLiquidaParcelas: TUMZQuery;
begin
   DM.CriarConsulta(qyLiquidaParcelas);

   qyLiquidaParcelas.SQL.Text := Format(SQL_LIQUIDA, [strParcelas]);

   qyLiquidaParcelas.ParamByName('cd_caixa_atual').AsInteger := transferencia.caixaEntrada;

   qyLiquidaParcelas.ExecSQL;
end;

function TfrmLiquidar.liquidarTaxas: Boolean;
begin
   retorno := True;

   Self.ShowModal;

   Result := retorno;
end;

function TfrmLiquidar.realizaTransferencia(): TSucesso;
var
   mvEntrada,
   mvSaida: TMovimento;

   cdContaEntrada,
   cdContaSaida,
   iCodSaida: Integer;
begin
   Result.sucesso := True;
   Result.mensagem := '';

   cdContaSaida := Self.getContaBaixa();
   
   if not(isContaTarifaConfigurada(cdContaSaida)) then
   begin
      Result.sucesso := False;
      Result.mensagem := 'A conta de saída desta administradora não possui '+
         'configurações para gerar a tarifa do cartão. Verificar a conta ' + getNomeConta(cdContaSaida) +
         ' na tela Cadastro > Contas > Aba plano de contas.';

      Exit;
   end;

   cdContaEntrada :=
      StrToInt(TItemCombo(cbTransferir.Items.Objects[cbTransferir.ItemIndex]).getCodigo);

   Result.caixaEntrada := cdContaEntrada;
   Result.caixaSaida := cdContaSaida;

   mvEntrada := TMovimento.create;
   mvSaida := TMovimento.create;

   // Gerar um movimento de entrada de outra conta
   mvSaida.CodAcao := DM.BuscarCodigoAcaoPadrao(7);
   mvSaida.ValorMovimento := valorLiquido;
   mvSaida.ValorEmCheque := 0;
   mvSaida.ValorEmDinheiro := valorLiquido;
   mvSaida.Historico := 'Transferência - Tesouraria -> Controle de Cartões -> Liquidar';

   mvSaida.DataLiberacao := Date;
   mvSaida.Origem := 3;  // Tesouraria
   mvSaida.EntradaSaida := 2; // Saida
   mvSaida.DataMovimento := StrToDate(meDataTransferencia.Text);
   mvSaida.Coligada := 1;

   iCodSaida := mvSaida.RegistrarMovimentacaoTe(cdContaSaida);

   mvEntrada.CodAcao := DM.BuscarCodigoAcaoPadrao(7);
   mvEntrada.ValorMovimento := valorLiquido;
   mvEntrada.ValorEmCheque := 0;
   mvEntrada.ValorEmDinheiro := valorLiquido;
   mvEntrada.Historico := 'Transferência - Tesouraria -> Controle de Cartões -> Liquidar';

   mvEntrada.DataLiberacao := Date;
   mvEntrada.Origem := 3;  // Tesouraria
   mvEntrada.EntradaSaida := 1; // Entrada
   mvEntrada.DataMovimento := StrToDate(meDataTransferencia.Text);
   mvEntrada.CodigoSaida := iCodSaida;
   
   mvEntrada.RegistrarMovimentacaoTe(cdContaEntrada);
end;

end.
