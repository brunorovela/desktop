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
      codMovEntrada: Integer;
      codMovSaida: Integer;
      codMovTaxa: Integer;
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
    pnParametrosHistorico: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edLiquidaTesouraria: TEdit;
    edTaxaTesouraria: TEdit;
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
    procedure carregaPanelParametrosHistorico();
    procedure carregaParametrosHistorico();
    procedure registraHistoricoMovimentacoes(movimentacao: TSucesso; isEstorno: Integer);

    function getDescricaoParametroFormatada(strParametro: String): String;
    function isContaTarifaConfigurada(cdConta: Integer): Boolean;
    function realizaTransferencia(): TSucesso;
    function getContaAdministradora(Field: String): Integer;
    function getNomeConta(cdConta: Integer): String;
    function getContaBaixa(): Integer;
  public
    strParcelas,strOperacoes: String;

    parcelasLiquidadas: TStringList;
    
    qtdParcelas,
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

procedure TfrmLiquidar.carregaPanelParametrosHistorico;
begin
   Self.ClientHeight := 370;
   carregaParametrosHistorico();
end;

procedure TfrmLiquidar.carregaParametrosHistorico;
begin
   edLiquidaTesouraria.Text := getDescricaoParametroFormatada(DM.variavel_parametro('mensagem_historico_liquida_parcela_cartao'));
   edTaxaTesouraria.Text := getDescricaoParametroFormatada(DM.variavel_parametro('mensagem_historico_taxa_parcela_cartao'));
end;

procedure TfrmLiquidar.carregaTotaisGrid;
const
   SQL_TOTAIS =
      '  SELECT '+
      '     SUM(fcp.vl_valor_parcela) AS valor, '+
      ' SUM(IF ( ROUND( (fco.nr_taxa * fcp.vl_valor_parcela / 100) , 2) < IFNULL(fcac.vl_min_operacao,0) AND ROUND( (fco.nr_taxa ) , 2) > 0  ' +
      '    , IFNULL(fcac.vl_min_operacao,0)          '+
      '    , ROUND( (fco.nr_taxa * fcp.vl_valor_parcela / 100) , 2)  '+
      '    )) AS valor_taxa,' +
      ' SUM(ROUND( (fcp.vl_valor_parcela) -            '+
      '    IF ( ROUND( (fco.nr_taxa * fcp.vl_valor_parcela / 100) , 2) < IFNULL(fcac.vl_min_operacao,0) AND ROUND( (fco.nr_taxa ) , 2) > 0   '+
      '    , IFNULL(fcac.vl_min_operacao,0) '+
      '    , ROUND( (fco.nr_taxa * fcp.vl_valor_parcela / 100) , 2)  '+
      '    )     '+
      ' , 2)) AS valor_liquido '+
      '  FROM '+
      '     fin_cartao_parcelas fcp '+
      '  INNER JOIN fin_cartao_operacao fco ON ( '+
      '     fco.cd_operacao = fcp.cd_operacao '+
      '  ) '+
      '  INNER JOIN fin_cadastro_admin_cartao fcac ON (fcac.cd_admin_cartao = fco.cd_admin_cartao) '+
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
   carregaPanelParametrosHistorico();
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

   historico: String;
begin
   cdContaSaida := transferencia.caixaSaida;

   historico := getDescricaoParametroFormatada(edTaxaTesouraria.Text);

   mvSaida := TMovimento.create;

   mvSaida.CodAcao := 6; // Pagamento pela tesouraria
   mvSaida.ValorMovimento := valorTaxa;
   mvSaida.ValorEmCheque := 0;
   mvSaida.ValorEmDinheiro := valorTaxa;
   mvSaida.Historico := historico;

   mvSaida.DataLiberacao := Date;
   mvSaida.Origem := 3;  // Tesouraria
   mvSaida.EntradaSaida := 2; // Saida
   mvSaida.DataMovimento := StrToDate(meDataTransferencia.Text);
   mvSaida.Coligada := 1;

   cdMovimentoTaxa := mvSaida.RegistrarMovimentacaoTe(cdContaSaida);

   transferencia.codMovTaxa := cdMovimentoTaxa;

   geraApropriaTaxaCartao(cdMovimentoTaxa, transferencia);

   registraHistoricoMovimentacoes(transferencia, 0);
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
      ' SELECT cd_caixa FROM fin_cartao_operacao WHERE cd_operacao in (:cd_operacao) LIMIT 1';
var
   qyConta: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyConta);

   qyConta.SQL.Text := SQL_BUSCA_CONTA;
   qyConta.SQL.Text := ReplaceStr(qyConta.SQL.Text ,':cd_operacao',strOperacoes);
   qyConta.Open;

   Result := qyConta.FieldByName('cd_caixa').AsInteger;
end;

function TfrmLiquidar.getDescricaoParametroFormatada(
  strParametro: String): String;
const
   SQL_BUSCA_VARIAVEIS =
      ' SELECT '+
      '   GROUP_CONCAT(DISTINCT parcelas.ds_nome SEPARATOR " / ") AS ds_nome, '+
      '   GROUP_CONCAT(DISTINCT parcelas.tipo_operacao SEPARATOR " / ") AS tipo_operacao, '+
      '   GROUP_CONCAT(DISTINCT parcelas.nr_parcela SEPARATOR " / ") AS nr_parcela, '+
      '   GROUP_CONCAT(DISTINCT DATE_FORMAT(parcelas.dt_vencimento,"%d/%m/%Y") SEPARATOR " / ") AS dt_vencimento, '+
      '   GROUP_CONCAT(DISTINCT parcelas.vl_parcela SEPARATOR " / ") AS vl_parcela, '+
      '   GROUP_CONCAT(DISTINCT parcelas.nr_taxa SEPARATOR " / ") AS nr_taxa, '+
      '   GROUP_CONCAT(DISTINCT parcelas.tarifa SEPARATOR " / ") AS tarifa, '+
      '   GROUP_CONCAT(DISTINCT parcelas.valor_liquido SEPARATOR " / ") AS valor_liquido, '+
      '   GROUP_CONCAT(DISTINCT parcelas.ds_caixa SEPARATOR " / ") AS ds_caixa, '+
      '   GROUP_CONCAT(DISTINCT parcelas.nm_pessoa SEPARATOR " / ") AS nm_pessoa, '+
      '   GROUP_CONCAT(DISTINCT parcelas.codigo_curso SEPARATOR " / ") AS codigo_curso, '+
      '   GROUP_CONCAT(DISTINCT parcelas.ds_historico SEPARATOR " / ") AS ds_historico '+
      '  FROM '+
      '      (   SELECT '+
      '                 fcac.ds_nome, '+
      '                 IF(fco.sn_credito = 1, ''Crédito'', ''Débito'') AS tipo_operacao, '+
      '                 fcp.nr_parcela, '+
      '                 fcp.dt_vencimento, '+
      '                 fcp.vl_valor_parcela AS vl_parcela, '+
      '                 fco.nr_taxa, '+
      '                 ROUND((ROUND((fco.nr_taxa * fcp.vl_valor_parcela), 2) / 100), 2) AS tarifa, '+
      '                 ROUND(fcp.vl_valor_parcela - ROUND((ROUND((fco.nr_taxa * fcp.vl_valor_parcela), 2) / 100), 2),2) AS '+
      '                 valor_liquido, '+
      '                 fcc.ds_caixa, '+
      '                 GROUP_CONCAT( DISTINCT p.nm_pessoa SEPARATOR ", ") as nm_pessoa, '+
      '                 GROUP_CONCAT( DISTINCT m.ds_historico SEPARATOR ", ") as ds_historico, '+
      '                 GROUP_CONCAT( DISTINCT tur.curso ) codigo_curso, '+
      '                 "agrupar" as agrupar '+
      '              FROM '+
      '                    fin_cartao_parcelas fcp '+
      '              INNER JOIN fin_cartao_operacao fco ON( fco.cd_operacao = fcp.cd_operacao  ) '+
      '              INNER JOIN fin_cadastro_contas fcc ON ( fcc.cd_caixa = fcp.cd_caixa_atual ) '+
      '              INNER JOIN fin_cadastro_admin_cartao fcac ON ( fcac.cd_admin_cartao = fco.cd_admin_cartao ) '+
      '              INNER JOIN fin_cartao_mensalidades fcm ON ( fcm.cd_operacao = fco.cd_operacao ) '+
      '              INNER JOIN mensalidades m ON ( m.cd_mensalidade = fcm.cd_mensalidade ) '+
      '              INNER JOIN pessoas p ON ( p.cd_pessoa = m.codigoaluno ) '+
      '              INNER JOIN turmas tur ON ( tur.codigo = m.turma AND m.anosemestre = tur.anosemestre ) '+
      '              WHERE '+
      '                 fcp.cd_parcela in (:cd_parcela) AND '+
      '                 fco.cd_operacao in (:cd_operacao) '+
      '              GROUP BY '+
      '               fcp.cd_parcela  ) AS parcelas '+
      '  GROUP BY '+
      '     parcelas.agrupar '+
      '  ORDER BY '+
      '     ds_nome ';
var
   qyBuscaVariaveis: TUMZReadOnlyQuery;      
begin
   DM.CriarConsulta(qyBuscaVariaveis);

   with qyBuscaVariaveis do
   begin
      SQL.Text := SQL_BUSCA_VARIAVEIS;

      SQL.Text := ReplaceStr(SQL.Text,':cd_parcela',strParcelas);
      SQL.Text := ReplaceStr(SQL.Text,':cd_operacao',strOperacoes);

      Open;

      Result := StringReplace(strParametro, '[VALOR_PARCELA]', FieldByName('vl_parcela').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[ADMINISTRADORA]', FieldByName('ds_nome').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[TIPO_OPERACAO]', FieldByName('tipo_operacao').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[NUMERO_PARCELA]', FieldByName('nr_parcela').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[PERC_VALOR_TAXA]', FieldByName('nr_taxa').AsString + '%', [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[CALC_VALOR_TAXA]', 'R$' + FieldByName('tarifa').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[VALOR_LIQUIDO]', FieldByName('valor_liquido').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[CAIXA]', FieldByName('ds_caixa').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[DATA_VENCIMENTO]', FieldByName('dt_vencimento').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[NOME_ALUNOS]', FieldByName('nm_pessoa').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[CURSO]', FieldByName('codigo_curso').AsString, [rfReplaceAll, rfIgnoreCase]);
      Result := StringReplace(Result, '[HISTORICO]', FieldByName('ds_historico').AsString, [rfReplaceAll, rfIgnoreCase]);
   end;

   FreeAndNil(qyBuscaVariaveis);
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

   historico: String;
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

   historico := getDescricaoParametroFormatada(edLiquidaTesouraria.Text);

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
   mvSaida.Historico := historico;

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
   mvEntrada.Historico := historico;

   mvEntrada.DataLiberacao := Date;
   mvEntrada.Origem := 3;  // Tesouraria
   mvEntrada.EntradaSaida := 1; // Entrada
   mvEntrada.DataMovimento := StrToDate(meDataTransferencia.Text);
   mvEntrada.CodigoSaida := iCodSaida;

   Result.codMovEntrada := mvEntrada.RegistrarMovimentacaoTe(cdContaEntrada);
   Result.codMovSaida := iCodSaida;
end;

procedure TfrmLiquidar.registraHistoricoMovimentacoes(movimentacao: TSucesso; isEstorno: Integer);
const
   SQL_ALTERA_HISTORICO_PARCELA =
      ' UPDATE fin_cartao_parcelas '+
      ' SET '+
      '   cd_historico_operacao = :cd_historico_operacao, '+
      '   dt_vencimento = :dt_vencimento '+
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

   for I := 0 to parcelasLiquidadas.Count - 1 do
   begin
      qyInsereHistorico.Params.Clear;
      qyInsereHistorico.SQL.Text := SQL_INSERE_HISTORICO;

      qyInsereHistorico.ParamByName('cd_parcela').AsInteger :=
         StrToInt(parcelasLiquidadas.Strings[I]);
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
         StrToInt(parcelasLiquidadas.Strings[I]);
      qyAlteraHistoricoParcela.ParamByName('dt_vencimento').AsDate :=
         StrToDate(meDataTransferencia.Text);   
         
      qyAlteraHistoricoParcela.ExecSQL;   
   end;
end;

end.
