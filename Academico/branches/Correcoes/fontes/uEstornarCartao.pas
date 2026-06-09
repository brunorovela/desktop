unit uEstornarCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, uDM, StdCtrls, uClassMovimento, General;

type
   TSucesso = record
      sucesso: Boolean;
      mensagem: String;
   end;

   TRegistraHistorico = record
      codParcela: Integer;
      codMovEntrada: Integer;
      codMovSaida: Integer;
      codMovTaxa: Integer;
      parcelasEstornadas: TStringList;
   end;

   TfrmEstornarOperacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnEstornar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnRemessaTit: TPanel;
    pnParcelas: TPanel;
    DBGrid1: TDBGrid;
    qyParcelas: TUMZQuery;
    dsParcelas: TDataSource;
    qyParcelascd_parcela: TIntegerField;
    qyParcelasdt_vencimento: TDateField;
    qyParcelasvl_valor_parcela: TFloatField;
    qyParcelasnr_taxa: TFloatField;
    qyParcelasvl_liquido: TFloatField;
    qyParcelasds_caixa: TStringField;
    sgTotais: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbContaEstornada: TLabel;
    Label5: TLabel;
    lbAdministradora: TLabel;
    Label7: TLabel;
    lbTipoOperacao: TLabel;
    Label4: TLabel;
    mMotivoEstorno: TMemo;
    procedure btnEstornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    retorno: Boolean;

    procedure carregaParcelas();
    procedure carregaTotaisGrid();
    procedure limpaGrid;
    procedure desLiquidaParcelas(parcelas: String; cdCaixaAtual: Integer);
    procedure registraHistoricoMovimentacoes(movimentacao: TRegistraHistorico; isEstorno: Integer);

    function realizaTransferencia(): TSucesso; 
  public
    strParcelas: String;
    parcelasEstornadas: TStringList;

    function estornarCartao(): Boolean;
  end;

var
  frmEstornarOperacao: TfrmEstornarOperacao;

implementation

{$R *.dfm}

{ TForm2 }

procedure TfrmEstornarOperacao.btnCancelarClick(Sender: TObject);
begin
   retorno := False;
   
   Self.Close;
end;

procedure TfrmEstornarOperacao.btnEstornarClick(Sender: TObject);
begin
   if mMotivoEstorno.Text = '' then
   begin
      Mensagem('Você precisa informar um motivo para o estorno.', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if Mensagem('Deseja realmente realizar o estorno desta operação?', 'Aviso', MB_YESNO + MB_ICONWARNING) = mrYes then
   begin
      realizaTransferencia;
      
      Self.Close;
   end;
end;

procedure TfrmEstornarOperacao.carregaParcelas;
begin
   qyParcelas.Close;
   qyParcelas.SQL.Text := Format(qyParcelas.SQL.Text, [strParcelas]);
   qyParcelas.Open;
end;

procedure TfrmEstornarOperacao.carregaTotaisGrid;
const
   SQL_TOTAIS =
      '  SELECT '+
      '     SUM(fcp.vl_valor_parcela) AS valor, '+
      '     SUM(ROUND(fcp.vl_valor_parcela * (fco.nr_taxa / 100), 2))	AS valor_taxa, '+
      '     ROUND(SUM(fcp.vl_valor_parcela) - SUM(ROUND(fcp.vl_valor_parcela * (fco.nr_taxa / 100), 2)), 2) AS valor_liquido, '+
      '     fcac.ds_nome, '+
      '     fcc.ds_caixa, '+
      '     IF(fco.sn_credito = 1, ''Crédio'', ''Débito'') AS tipo_operacao '+
      '  FROM '+
      '     fin_cartao_parcelas fcp '+
      '  INNER JOIN fin_cartao_operacao fco ON ( '+
      '     fco.cd_operacao = fcp.cd_operacao '+
      '  ) '+
      '  INNER JOIN fin_cadastro_admin_cartao fcac ON ( '+
      '     fcac.cd_admin_cartao = fco.cd_admin_cartao '+
      '  ) '+
      '  INNER JOIN fin_cadastro_contas fcc ON ( '+
      '     fcc.cd_caixa = fco.cd_caixa '+
      '  ) '+
      '  WHERE '+
      '     fcp.cd_parcela IN (%s) ';
var
   qyTotais: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyTotais);

   qyTotais.SQL.Text := Format(SQL_TOTAIS, [strParcelas]);
   qyTotais.Open;

   lbContaEstornada.Caption   := qyTotais.FieldByName('ds_caixa').AsString;
   lbAdministradora.Caption   := qyTotais.FieldByName('ds_nome').AsString;
   lbTipoOperacao.Caption     := qyTotais.FieldByName('tipo_operacao').AsString;

   sgTotais.Cols[0][1] := 'R$ ' + qyTotais.FieldByName('valor').AsString;
   sgTotais.Cols[1][1] := 'R$ ' + qyTotais.FieldByName('valor_taxa').AsString;
   sgTotais.Cols[2][1] := 'R$ ' + qyTotais.FieldByName('valor_liquido').AsString;
end;

procedure TfrmEstornarOperacao.FormShow(Sender: TObject);
begin
   limpaGrid;
   carregaParcelas;
   carregaTotaisGrid;
end;

procedure TfrmEstornarOperacao.limpaGrid;
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

   mMotivoEstorno.Text := '';
end;

procedure TfrmEstornarOperacao.DesLiquidaParcelas(parcelas: String; cdCaixaAtual: Integer);
const
   SQL_LIQUIDA =
      '  UPDATE fin_cartao_parcelas '+
      '  SET sn_liquidado = 0, cd_caixa_atual = :cd_caixa_atual'+
      '  WHERE '+
      '     cd_parcela IN (%s) ';
var
   qyLiquidaParcelas: TUMZQuery;
begin
   DM.CriarConsulta(qyLiquidaParcelas);

   qyLiquidaParcelas.SQL.Text := Format(SQL_LIQUIDA, [parcelas]);
   qyLiquidaParcelas.ParamByName('cd_caixa_atual').AsInteger := cdCaixaAtual;
   qyLiquidaParcelas.ExecSQL;
end;

function TfrmEstornarOperacao.estornarCartao: Boolean;
begin
   retorno := True;

   self.ShowModal;

   Result := retorno;
end;

function TfrmEstornarOperacao.realizaTransferencia: TSucesso;
const
   SQL_BUSCA_PLANO_CENTRO_TARIFA =
      ' SELECT '+
      '     cd_centro_tarifa, '+
      '     cd_conta_tarifa '+
      '  FROM '+
      '     fin_cadastro_contas '+
      '  WHERE '+
      '     cd_caixa = :cd_caixa ';
      
   SQL_CONTAS_ESTORNAR =
      'SELECT '+
      '	cd_caixa_atual, '+
      '	cd_caixa, '+
      '	GROUP_CONCAT(parcelas) as parcelas, '+
      '	SUM(valor_parcela) valor_parcela, '+
      '	SUM(vl_liquido) vl_liquido, '+
      '	SUM(vl_taxa) vl_taxa, '+
      '	dt_operacao '+
      'FROM '+
   	'( '+
      ' '+
      ' SELECT '+
      '    fcp.cd_caixa_atual, '+
      '    fco.cd_caixa, '+
      '    fco.dt_operacao, '+
      '    GROUP_CONCAT(fcp.cd_parcela SEPARATOR '', '') AS parcelas, '+
      '    SUM(fcp.vl_valor_parcela) as valor_parcela, '+
      '    ROUND(SUM(fcp.vl_valor_parcela) - (SUM(fcp.vl_valor_parcela) * (fco.nr_taxa / 100)), 2) AS vl_liquido, '+
      '    ROUND(SUM(fcp.vl_valor_parcela) * (fco.nr_taxa / 100), 2) AS vl_taxa '+
      ' FROM '+
      '    fin_cartao_parcelas fcp '+
      ' INNER JOIN fin_cartao_operacao fco ON ( '+
      '    fco.cd_operacao = fcp.cd_operacao '+
      ' ) '+
      ' WHERE '+
      '    fcp.cd_parcela IN (%s) '+
      ' GROUP BY '+
      '    fcp.cd_caixa_atual, fcp.cd_operacao '+
      ') AS tabela '+
      ' GROUP BY '+
      '    cd_caixa_atual ';
      
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
   mvEntrada,
   mvSaida: TMovimento;

   cdContaEntrada,
   cdContaSaida,
   iCodSaida,
   iColigada,
   cdMovimentoTaxa: Integer;

   qyInsereTaxa: TUMZQuery;
   data_liquidacao: TDateTime;
   format_data: String;
   qyContasEstornar,
   qyBuscaCodigosTarifa: TUMZReadOnlyQuery;

   registraHist: TRegistraHistorico;
begin
   Result.sucesso := True;
   Result.mensagem := '';

   DM.CriarConsulta(qyInsereTaxa);
   DM.CriarConsulta(qyContasEstornar);
   DM.CriarConsulta(qyBuscaCodigosTarifa);

   qyContasEstornar.SQL.Text := Format(SQL_CONTAS_ESTORNAR, [strParcelas]);
   qyContasEstornar.Open;

   iColigada := mvSaida.GetColigadaConta(qyContasEstornar.FieldByName('cd_caixa_atual').AsInteger);

   {Estorna todas parcelas selecionadas, para suas respectivas contas nas
      quais foram liquidadas}
   while not qyContasEstornar.Eof do
   begin
      mvEntrada := TMovimento.create;
      mvSaida := TMovimento.create;

      { REALIZA TRANSFERÊNCIA }
      mvSaida.CodAcao := DM.BuscarCodigoAcaoPadrao(7);
      mvSaida.ValorMovimento := qyContasEstornar.FieldByName('vl_liquido').AsFloat;
      mvSaida.ValorEmCheque := 0;
      mvSaida.ValorEmDinheiro := qyContasEstornar.FieldByName('vl_liquido').AsFloat;
      mvSaida.Historico := mMotivoEstorno.Text;

      mvSaida.DataLiberacao := Date;
      mvSaida.Origem := 3; // Tesouraria
      mvSaida.EntradaSaida := 2;
      mvSaida.DataMovimento := Date;
      mvSaida.Coligada := iColigada;
      data_liquidacao := strToDateTime(qyParcelas.FieldByName('dt_vencimento').AsString);
      format_data := FormatDateTime('yyyy-MM-dd',data_liquidacao);

      iCodSaida := mvSaida.RegistrarMovimentacaoTe(qyContasEstornar.FieldByName('cd_caixa_atual').AsInteger,format_data);
      registraHist.codMovSaida := iCodSaida;

      mvEntrada.CodAcao := DM.BuscarCodigoAcaoPadrao(7);
      mvEntrada.ValorMovimento := qyContasEstornar.FieldByName('vl_liquido').AsFloat;
      mvEntrada.ValorEmCheque := 0;
      mvEntrada.ValorEmDinheiro := qyContasEstornar.FieldByName('vl_liquido').AsFloat;
      mvEntrada.Historico := mMotivoEstorno.Text;

      mvEntrada.DataLiberacao := Date;
      mvEntrada.Origem := 3;  // Tesouraria
      mvEntrada.EntradaSaida := 1;
      mvEntrada.DataMovimento := Date;
      mvEntrada.CodigoSaida := iCodSaida;

      registraHist.codMovEntrada := mvEntrada.RegistrarMovimentacaoTe(qyContasEstornar.FieldByName('cd_caixa').AsInteger,format_data);
      { REALIZA TRANSFERÊNCIA }

      { GERA TAXA }
      mvSaida := TMovimento.create;

      {  O código da ação para a taxa é padrão.
         Sempre será 6(seis) neste ponto do sistema. }
      mvSaida.CodAcao := 6;
      mvSaida.ValorMovimento := qyContasEstornar.FieldByName('vl_taxa').AsFloat;
      mvSaida.ValorEmCheque := 0;
      mvSaida.ValorEmDinheiro := qyContasEstornar.FieldByName('vl_taxa').AsFloat;
      mvSaida.Historico := 'TAXA - ' + mMotivoEstorno.Text;

      mvSaida.DataLiberacao := Date;
      mvSaida.Origem := 3;  // Tesouraria
      mvSaida.EntradaSaida := 1;
      mvSaida.DataMovimento := Date;
      mvSaida.Coligada := iColigada;

      cdMovimentoTaxa := mvSaida.RegistrarMovimentacaoTe(qyContasEstornar.FieldByName('cd_caixa').AsInteger,format_data);
      
      registraHist.codMovTaxa := cdMovimentoTaxa;
      { GERA TAXA }

      { GERA APROPRIAÇÃO DE TAXA }
      qyBuscaCodigosTarifa.SQL.Text := SQL_BUSCA_PLANO_CENTRO_TARIFA;
      qyBuscaCodigosTarifa.ParamByName('cd_caixa').AsInteger := qyContasEstornar.FieldByName('cd_caixa').AsInteger;
      qyBuscaCodigosTarifa.Open;

      qyInsereTaxa.SQL.Text := SQL_INSERE_APROPRIA;
   
      qyInsereTaxa.ParamByName('cd_movimento_te').AsInteger :=
         cdMovimentoTaxa;

      qyInsereTaxa.ParamByName('cd_conta').AsInteger :=
         qyBuscaCodigosTarifa.FieldByName('cd_conta_tarifa').AsInteger;

      qyInsereTaxa.ParamByName('cd_coligada').AsInteger :=
         iColigada;

      qyInsereTaxa.ParamByName('cd_centro').AsInteger :=
         qyBuscaCodigosTarifa.FieldByName('cd_centro_tarifa').AsInteger;

      qyInsereTaxa.ParamByName('vl_movimento').AsFloat := qyContasEstornar.FieldByName('vl_taxa').AsFloat;
      qyInsereTaxa.ExecSQL;

      desLiquidaParcelas(
         qyContasEstornar.FieldByName('parcelas').AsString,
         qyContasEstornar.FieldByName('cd_caixa').AsInteger
      );

      qyContasEstornar.Next;
      { GERA APROPRIAÇÃO DE TAXA }

      registraHist.parcelasEstornadas :=  TStringList.Create;
      
      SplitString(qyContasEstornar.FieldByName('parcelas').AsString, ',', registraHist.parcelasEstornadas);

      registraHistoricoMovimentacoes(registraHist, 1);
   end;

   DM.setLog(
      123654,
      'Estorno',
      'Estorno de parcelas',
      0,
      '{"codigo_parcelas": "' + strParcelas + '"}'
   );
end;

procedure TfrmEstornarOperacao.registraHistoricoMovimentacoes(
  movimentacao: TRegistraHistorico; isEstorno: Integer);
const
   SQL_ALTERA_HISTORICO_PARCELA =
      ' UPDATE fin_cartao_parcelas '+
      ' SET cd_historico_operacao = :cd_historico_operacao '+
      ' WHERE '+
      '   cd_parcela = :cd_parcela ';
      
   SQL_INSERE_HISTORICO =
      ' INSERT INTO fin_cartao_historico ( '+
      '   cd_parcela, '+
      '   cd_movimento_entrada, '+
      '   cd_movimento_saida, '+
      '   cd_movimento_taxa, '+
      '   sn_estorno '+
      ') VALUES ( '+
      '   :cd_parcela, '+
      '   :cd_movimento_entrada, '+
      '   :cd_movimento_saida, '+
      '   :cd_movimento_taxa, '+
      '   :sn_estorno '+
      ') ';
var
   qyInsereHistorico,
   qyAlteraHistoricoParcela: TUMZQuery;

   i: Integer;      
begin
   DM.CriarConsulta(qyInsereHistorico);
   DM.CriarConsulta(qyAlteraHistoricoParcela);

   for I := 0 to movimentacao.parcelasEstornadas.Count - 1 do
   begin
      qyInsereHistorico.Params.Clear;
      qyInsereHistorico.SQL.Text := SQL_INSERE_HISTORICO;

      qyInsereHistorico.ParamByName('cd_parcela').AsInteger :=
         StrToInt(movimentacao.parcelasEstornadas.Strings[I]);
      qyInsereHistorico.ParamByName('cd_movimento_entrada').AsInteger :=
         movimentacao.codMovEntrada;
      qyInsereHistorico.ParamByName('cd_movimento_saida').AsInteger :=
         movimentacao.codMovSaida;
      qyInsereHistorico.ParamByName('cd_movimento_taxa').AsInteger :=
         movimentacao.codMovTaxa;
      qyInsereHistorico.ParamByName('sn_estorno').AsInteger :=
         isEstorno;
         
      qyInsereHistorico.ExecSQL;

      qyAlteraHistoricoParcela.Params.Clear;
      qyAlteraHistoricoParcela.SQL.Text := SQL_ALTERA_HISTORICO_PARCELA;
      
      qyAlteraHistoricoParcela.ParamByName('cd_historico_operacao').AsInteger :=
         DM.LastInsert;
      qyAlteraHistoricoParcela.ParamByName('cd_parcela').AsInteger :=
         StrToInt(movimentacao.parcelasEstornadas.Strings[I]);
         
      qyAlteraHistoricoParcela.ExecSQL;
   end;
end;

end.