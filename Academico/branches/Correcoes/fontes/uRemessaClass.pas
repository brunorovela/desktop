unit uRemessaClass;

{Classe para realizar procedimentos relacionados a remessa}

interface

uses
   SysUtils, Windows, Forms, General, Classes, uDM, UZDataset,
   ZAbstractRODataset, UZDbcFuncs, ZDbcIntfs;

type
  TTipoAcaoRemessa = (tarBaixa, tarCancelamento, tarDesconto, tarProtesto,
    tarEstornar, tarAlteracaoMensalidade, tarNegociacao, tarProrrogar,
    tarImpressaoBoleto, tarGerarMensalidade, tarBaixarDDA, tarCancelarDDA);

  TSituacaoNN = (snnFila, snnExportado, snnRegistrado, snnBaixado, snnRejeitado, snnLiquidadoSemRegistro, snnNone);

  TAcaoRemessa = class(TObject)

  strict private
    cdAcao: integer;
    dsAcao: string;
    dsChave: string;

  public
    procedure setCdAcao(cdAcao: integer);
    procedure setDsAcao(dsAcao: string);
    procedure setDsChave(dsChave: string);

    function getCdAcao() : integer;
    function getDsAcao() : string;
    function getDsChave() : string;
  end;

  TStatusNN = class(TObject)

  strict private
    cdLayout: integer;
    nrNossoNumero: string;
    tpSituacao: TSituacaoNN;
    cdEnvioRegistro: integer;
    cdEnvioBase: integer;

  public
    procedure setNrNossoNumero(nrNossoNumero: string);
    procedure setCdLayout(cdLayout: integer);
    procedure setTpSituacao(tpSituacao: TSituacaoNN);
    procedure setCdEnvioRegistro(cdEnvioRegistro: integer);
    procedure setCdEnvioBase(cdEnvioBase: integer);

    function getNrNossoNumero() : string;
    function getCdLayout() : integer;
    function getTpSituacao() : TSituacaoNN;
    function getCdEnvioRegistro() : integer;
    function getCdEnvioBase() : integer;
  end;

  TRemessa = class(TObject)

  private
    arrAcoesRemessa, arrSituacoesNossoNumero : TStringList;

    procedure ignorarEnvioRemessa(nossoNumero: string);
    procedure removerStatusNossoNumero(nossoNumero: string);
	  procedure atualizarEnvioRegistroNossoNumero(nossoNumero: string);
    procedure insereMensalidadesEnvioAtual(nossoNumero: string);
    procedure insereMensalidadesEnvioRegistro(nossoNumero: string);
    procedure insereMensalidadesAcaoEnvio(cdEnvio: integer; mensalidadesAgrupadas: TStringList);

    function enviaPedidoBaixa(nossoNumero: string): boolean;
    function enviaPedidoProtesto(nossoNumero: string): boolean;

  protected

  public
    constructor Create();
    destructor Destroy; override;

    ///   <summary>Procura o maior valor de sequencia dentre os envios não
    ///   ignorados do nosso número e retorno a próxima sequência
    ///   disponível</summary>
    ///
    ///   <param name="NossoNumero"><c>string</c> que contém o nosso número
    ///   para o qual deseja-se obter a próxima sequência disponível</param>
    ///
    ///   <returns>Valor do tipo <c>Integer</c> contendo o próximo número
    ///   sequencial disponível para o nosso número</returns>
    function GetNextSequenciaEnvio(const NossoNumero: AnsiString): Integer;

    ///   <summary>Ignora todas as inclusões de DDA pendentes vinculadas com
    ///   mensalidades pendentes ou protestadas da pessoa e lança um novo
    ///   envio solicitando cancelamento de DDA se encontrar um envio de
    ///   inclusão de DDA registrado na instituição financeira.</summary>
    ///
    ///   <summary>Primeiro, todos os envios de requisição de inclusão de DDA
    ///   que estão pendentes, isto é, não ignorado e que não foram
    ///   registrados na instituição financeira serão ignorados.</summary>
    ///
    ///   <summary>Na sequência, procura envios de pedido de inclusão de DDA
    ///   que não estão ignorados e foram registrados na instituição
    ///   financeira. Para cada registro encontrado, envia uma requisição
    ///   solicitando o cancelamento do DDA. O registro de envio do pedido
    ///   de inclusão é ignorado</summary>
    ///
    ///   <param name="PessoaID">Valor do tipo <c>Integer</c> contendo o
    ///   código da pessoa para a qual deseja-se cancelar o DDA</param>
    procedure CancelaDDA(const PessoaID: Integer); overload;

    ///   <summary>Ignora todas as inclusões de DDA pendentes vinculadas com o
    ///   nosso número recebido através do parâmetro <c>NossoNumero</c> e
    ///   lança um novo envio solicitando o cancelamento do DDA se encontrar
    ///   um envio de inclusão de DDA registrado na instituição financeira
    ///   </summary>
    ///
    ///   <summary>Primeiro, todos os envios de requisição para inclusão do
    ///   nosso número no DDA que estão pendentes, isto é, não ignorado e que
    ///   não foram registrados na instituição financeira, serão ignorados.
    ///   </summary>
    ///
    ///   <summary>Na sequência, procura envios de pedido de inclusão de DDA
    ///   que não estão ignorados e foram registrados na instituição
    ///   financeira. Se encontrar o envio, envia uma nova solicitação para
    ///   cancelamento do DDA. O registro de envio do pedido de inclusão
    ///   é ignorado.</summary>
    ///
    ///   <param name="NossoNumero">Valor do tipo <c>string</c> contendo o
    ///   nosso número para o qual deseja-se efetuar o cancelamento do DDA
    ///   </param>
    procedure CancelaDDA(const NossoNumero: AnsiString); overload;

    procedure registraAcaoBaixa(nossoNumero: string; situacaoNossoNumero: TSituacaoNN = snnNone);
    procedure registraAcaoCancelamento(nossoNumero: string);
    procedure registraAcaoEnvio(nossoNumero: string; cdLayout, cdResp, cdBoleto: integer;
      dtVencimento: TDateTime; vlNominal, vlDesconto: currency; mensalidadesAgrupadas: TStringList);
    procedure incluirStatusNossoNumero(nossoNumero: string; cdLayout: integer = -1; cdEnvioRegistro: integer = -1; situacaoNN: TSituacaoNN = snnFila);
    procedure alterarStatusNossoNumero(nossoNumero: string; novaSituacaoNN: TSituacaoNN);
    procedure ignorarPedidoBaixaNaoEnviado(nossoNumero: string; cdLayout: integer);
	  procedure atualizarEnvioAtualNossoNumero(nossoNumero: string);
    
    procedure ignorarRemessaAlteracaoDados(nossoNumero: string);
    procedure otimizarEnviosRemessa(cdArquivo: integer);
    function verificaAcaoEstaFila(nossoNumero: string; tipoAcaoRemessa: TTipoAcaoRemessa): boolean;

    function enviaAlteracaoVencimento(nossoNumero: string; novoVencimento: TDateTime; cdBoleto: integer): boolean;
	  function enviaAlteracaoDesconto(nossoNumero: string; novoDesconto: currency; cdBoleto: integer): boolean;
    function enviaAlteracaoOutrosDados(nossoNumero: string; novoResponsavel: integer; cdBoleto: integer): boolean;
    function enviaAlteracaoOutrosDadosVencimento(nossoNumero: string; novoVencimento: TDateTime; cdBoleto: integer): boolean;
    function enviaAlteracaoOutrosDadosDesconto(nossoNumero: string; novoDesconto: currency; cdBoleto: integer): boolean;

    function getLayoutConta(cdConta: integer): integer;
    function getStatusNossoNumero(nossoNumero: string): TStatusNN;
    function getSituacaoNossoNumero(dsChave: string): TSituacaoNN;
    function getChaveSituacaoNossoNumero(situacaoNN: TSituacaoNN): string;
    function registraAcaoProtesto(nossoNumero: string): boolean;
    function ehRemessaIgualUltimoEnvio(nossoNumero: string; cdLayout, cdResp: integer;
      dtVencimento: TDateTime; vlNominal, vlDesconto: currency;
      var snDiffVencimento, snDiffDesconto, snDiffResponsavel, snDiffOutro: boolean): boolean;

    function getAcaoRemessa(tipoAcaoRemessa: TTipoAcaoRemessa) : TAcaoRemessa;
end;

implementation

const
  ChavesAcoesRemessa: array[TTipoAcaoRemessa] of string = ('baixa',
    'cancelamento', 'desconto', 'protesto', 'estornar', 'alteracao_mensalidade',
    'negociacao', 'prorrogar', 'impressao_boleto', 'gerar_mensalidade',
    'incluir_dda', 'cancelar_dda');

{ TRemessa }

procedure TRemessa.CancelaDDA(const PessoaID: Integer);
const
   SQLSelect = ''
      + ' SELECT '
      + '       E.CD_ENVIO, '
      + '       E.NR_NOSSONUMERO, '
      + '       E.SN_IGNORADO, '
      + '       E.DT_IGNORADO '
      + ' FROM '
      + '       REM_ENVIOS E '
      + ' WHERE '
      + '       E.SN_IGNORADO = 0 AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   M.CODIGOALUNO '
      + '             FROM '
      + '                   MENSALIDADES M '
      + '             WHERE '
      + '                   E.NR_NOSSONUMERO = M.NOSSONUMERO AND '
      + '                   M.CODIGOALUNO = ? AND '
      + '                   M.SITUACAO IN (2, 9, 10) '
      + '       ) AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   O.CD_OCORRENCIA '
      + '             FROM '
      + '                   REM_OCORRENCIAS O '
      + '                         JOIN REM_ACOES A ON '
      + '                               (O.CD_ACAO = A.CD_ACAO) '
      + '             WHERE '
      + '                   E.CD_OCORRENCIA = O.CD_OCORRENCIA AND '
      + '                   O.SN_ATIVO = 1 AND '
      + '                   A.DS_CHAVE = ? '
      + '       ) AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   S.NR_NOSSONUMERO '
      + '             FROM '
      + '                   REM_STATUS S '
      + '             WHERE '
      + '                   E.NR_NOSSONUMERO = S.NR_NOSSONUMERO AND '
      + '                   S.DS_SITUACAO IN (''R'', ''E'') '
      + '       )  ';
   SQLInsert = ''
      + ' INSERT IGNORE INTO REM_ENVIOS ( '
      + '       CD_LAYOUT, '
      + '       NR_NOSSONUMERO, '
      + '       NR_SEQUENCIA, '
      + '       CD_RESP, '
      + '       DT_VENCIMENTO, '
      + '       VL_NOMINAL, '
      + '       VL_DESCONTO, '
      + '       CD_OCORRENCIA, '
      + '       CD_BOLETO, '
      + '       DT_INCLUSAO '
      + ' ) '
      + ' SELECT DISTINCT '
      + '       E.CD_LAYOUT, '
      + '       E.NR_NOSSONUMERO, '
      + '       ?, '
      + '       E.CD_RESP, '
      + '       E.DT_VENCIMENTO, '
      + '       E.VL_NOMINAL, '
      + '       E.VL_DESCONTO, '
      + '       O.CD_OCORRENCIA, '
      + '       E.CD_BOLETO, '
      + '       CURRENT_TIMESTAMP '
      + ' FROM '
      + '       REM_ENVIOS E '
      + '             JOIN REM_OCORRENCIAS O ON '
      + '                   (E.CD_LAYOUT = O.CD_LAYOUT) '
      + '             JOIN REM_ACOES A ON '
      + '                   (O.CD_ACAO = A.CD_ACAO) '
      + ' WHERE '
      + '       CD_ENVIO = ? AND '
      + '       O.SN_ATIVO = 1 AND '
      + '       A.DS_CHAVE = ? ';
   SQLUpdate = ''
      + ' UPDATE '
      + '       REM_ENVIOS E '
      + ' SET '
      + '       E.SN_IGNORADO = 1, '
      + '       E.DT_IGNORADO = CURRENT_TIMESTAMP '
      + ' WHERE '
      + '       E.SN_IGNORADO = 0 AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   M.CD_MENSALIDADE '
      + '             FROM '
      + '                   MENSALIDADES M '
      + '             WHERE '
      + '                   E.NR_NOSSONUMERO = M.NOSSONUMERO AND '
      + '                   M.CODIGOALUNO = ? AND '
      + '                   M.SITUACAO IN (2, 9, 10) '
      + '       ) AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   O.CD_OCORRENCIA '
      + '             FROM '
      + '                   REM_OCORRENCIAS O '
      + '                         JOIN REM_ACOES A ON '
      + '                               (O.CD_ACAO = A.CD_ACAO) '
      + '             WHERE '
      + '                   E.CD_OCORRENCIA = O.CD_OCORRENCIA AND '
      + '                   O.SN_ATIVO = 1 AND '
      + '                   A.DS_CHAVE = ? '
      + '       ) AND '
      + '       NOT EXISTS ( '
      + '             SELECT '
      + '                   S.NR_NOSSONUMERO '
      + '             FROM '
      + '                   REM_STATUS S '
      + '             WHERE '
      + '                   E.NR_NOSSONUMERO = S.NR_NOSSONUMERO AND '
      + '                   S.DS_SITUACAO NOT IN (''F'', ''J'') '
      + '       ) ';
var
   Stmt, StmtInsert: IZPreparedStatement;
   Rs: IZResultSet;
   NossoNumero: AnsiString;
begin

   Stmt := PrepareStatement(SQLUpdate);
   try
      Stmt.SetInt(1, PessoaID);
      Stmt.SetString(2, 'incluir_dda');
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SQLSelect);
   try
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Stmt.SetInt(1, PessoaID);
      Stmt.SetString(2, 'incluir_dda');
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
         
            StmtInsert := PrepareStatement(SQLInsert);
            try
            
               repeat
                  NossoNumero := Rs.GetStringByName('NR_NOSSONUMERO');
                  
                  StmtInsert.ClearParameters;
                  StmtInsert.SetInt(1, GetNextSequenciaEnvio(NossoNumero));
                  StmtInsert.SetInt(2, Rs.GetIntByName('CD_ENVIO'));
                  StmtInsert.SetString(3, 'cancelar_dda');
                  StmtInsert.ExecutePrepared;

                  Rs.UpdateIntByName('SN_IGNORADO', 1);
                  Rs.UpdateDateByName('DT_IGNORADO', Now);
                  Rs.UpdateRow;

                  atualizarEnvioAtualNossoNumero(NossoNumero);
                  atualizarEnvioRegistroNossoNumero(NossoNumero);
                  insereMensalidadesEnvioAtual(NossoNumero);

               until not Rs.Next;
               
            finally
               StmtInsert.Close;
               Stmt := nil;
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
   
end;

procedure TRemessa.CancelaDDA(const NossoNumero: AnsiString);
const
   SQLSelect = ''
      + ' SELECT '
      + '       E.CD_ENVIO, '
      + '       E.SN_IGNORADO, '
      + '       E.DT_IGNORADO '
      + ' FROM '
      + '       REM_ENVIOS E '
      + ' WHERE '
      + '       E.SN_IGNORADO = 0 AND '
      + '       E.NR_NOSSONUMERO = ? AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   O.CD_OCORRENCIA '
      + '             FROM '
      + '                   REM_OCORRENCIAS O '
      + '                         JOIN REM_ACOES A ON '
      + '                               (O.CD_ACAO = A.CD_ACAO) '
      + '             WHERE '
      + '                   E.CD_OCORRENCIA = O.CD_OCORRENCIA AND '
      + '                   O.SN_ATIVO = 1 AND '
      + '                   A.DS_CHAVE = ? '
      + '       ) AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   S.NR_NOSSONUMERO '
      + '             FROM '
      + '                   REM_STATUS S '
      + '             WHERE '
      + '                   E.NR_NOSSONUMERO = S.NR_NOSSONUMERO AND '
      + '                   S.DS_SITUACAO IN (''R'', ''E'') '
      + '       ) ';
   SQLInsert = ''
      + ' INSERT IGNORE INTO REM_ENVIOS ( '
      + '       CD_LAYOUT, '
      + '       NR_NOSSONUMERO, '
      + '       NR_SEQUENCIA, '
      + '       CD_RESP, '
      + '       DT_VENCIMENTO, '
      + '       VL_NOMINAL, '
      + '       VL_DESCONTO, '
      + '       CD_OCORRENCIA, '
      + '       CD_BOLETO, '
      + '       DT_INCLUSAO '
      + ' ) '
      + ' SELECT DISTINCT '
      + '       E.CD_LAYOUT, '
      + '       E.NR_NOSSONUMERO, '
      + '       ?, '
      + '       E.CD_RESP, '
      + '       E.DT_VENCIMENTO, '
      + '       E.VL_NOMINAL, '
      + '       E.VL_DESCONTO, '
      + '       O.CD_OCORRENCIA, '
      + '       E.CD_BOLETO, '
      + '       CURRENT_TIMESTAMP '
      + ' FROM '
      + '       REM_ENVIOS E '
      + '             JOIN REM_OCORRENCIAS O ON '
      + '                   (E.CD_LAYOUT = O.CD_LAYOUT) '
      + '             JOIN REM_ACOES A ON '
      + '                   (O.CD_ACAO = A.CD_ACAO) '
      + ' WHERE '
      + '       CD_ENVIO = ? AND '
      + '       O.SN_ATIVO = 1 AND '
      + '       A.DS_CHAVE = ? ';
   SQLUpdate = ''
      + ' UPDATE '
      + '       REM_ENVIOS E '
      + ' SET '
      + '       E.SN_IGNORADO = 1, '
      + '       E.DT_IGNORADO = CURRENT_TIMESTAMP '
      + ' WHERE '
      + '       E.SN_IGNORADO = 0 AND '
      + '       E.NR_NOSSONUMERO = ? AND '
      + '       EXISTS ( '
      + '             SELECT '
      + '                   O.CD_OCORRENCIA '
      + '             FROM '
      + '                   REM_OCORRENCIAS O '
      + '                         JOIN REM_ACOES A ON '
      + '                               (O.CD_ACAO = A.CD_ACAO) '
      + '             WHERE '
      + '                   E.CD_OCORRENCIA = O.CD_OCORRENCIA AND '
      + '                   O.SN_ATIVO = 1 AND '
      + '                   A.DS_CHAVE = ? '
      + '       ) AND '
      + '       NOT EXISTS ( '
      + '             SELECT '
      + '                   S.NR_NOSSONUMERO '
      + '             FROM '
      + '                   REM_STATUS S '
      + '             WHERE '
      + '                   E.NR_NOSSONUMERO = S.NR_NOSSONUMERO AND '
      + '                   S.DS_SITUACAO NOT IN (''F'', ''J'') '
      + '       ) ';
var
   Stmt, StmtInsert: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Stmt := PrepareStatement(SQLUpdate);
   try
      Stmt.SetString(1, NossoNumero);
      Stmt.SetString(2, 'incluir_dda');
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Stmt := PrepareStatement(SQLSelect);
   try
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Stmt.SetString(1, NossoNumero);
      Stmt.SetString(2, 'incluir_dda');

      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin

            StmtInsert := PrepareStatement(SQLInsert);
            try
               StmtInsert.SetInt(1, GetNextSequenciaEnvio(NossoNumero));
               StmtInsert.SetInt(2, Rs.GetIntByName('CD_ENVIO'));
               StmtInsert.SetString(3, 'cancelar_dda');
               StmtInsert.ExecutePrepared;
            finally
               StmtInsert.Close;
               StmtInsert := nil;
            end;

            Rs.UpdateIntByName('SN_IGNORADO', 1);
            Rs.UpdateDateByName('DT_IGNORADO', Now);
            Rs.UpdateRow;

            atualizarEnvioAtualNossoNumero(NossoNumero);
            atualizarEnvioRegistroNossoNumero(NossoNumero);
            insereMensalidadesEnvioAtual(NossoNumero);

         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

constructor TRemessa.Create;
const
  SQL_GET_ACOES_REMESSA =
   '  SELECT                                      '+
   '    cd_acao, ds_acao, lower(ds_chave) ds_chave'+
   '  FROM                                        '+
   '    rem_acoes                                 '+
   '  ORDER BY                                    '+
   '    cd_acao                                   ';

var
  qyAcoesRemessa: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin
  DM.CriarConsulta(qyAcoesRemessa);

  // Busca as ações de remessa
  qyAcoesRemessa.Close;
  qyAcoesRemessa.SQL.Text := SQL_GET_ACOES_REMESSA;
  qyAcoesRemessa.Open;

  // Cria o TStringList para armazenar as ações de remessa
  arrAcoesRemessa := TStringList.Create;

  // Varre as ações de remessa e cria as classes
  while not qyAcoesRemessa.Eof do
  begin
    acaoRemessa := TAcaoRemessa.Create;
    acaoRemessa.setCdAcao(qyAcoesRemessa.FieldByName('cd_acao').AsInteger);
    acaoRemessa.setDsAcao(qyAcoesRemessa.FieldByName('ds_acao').AsString);
    acaoRemessa.setDsChave(qyAcoesRemessa.FieldByName('ds_chave').AsString);

    // Adicionaa a ação de remessa no TStringList
    arrAcoesRemessa.AddObject(qyAcoesRemessa.FieldByName('ds_chave').AsString, acaoRemessa);

    qyAcoesRemessa.Next;
  end;

  FreeAndNil(qyAcoesRemessa);
end;

destructor TRemessa.Destroy;
begin
  inherited;
end;

procedure TRemessa.alterarStatusNossoNumero(nossoNumero: string; novaSituacaoNN: TSituacaoNN);
const
  SQL_ALTERAR_SITUACAO_NN =
   ' UPDATE '+
   '    rem_status '+
   ' SET '+
   '    ds_situacao = :ds_situacao '+
   ' WHERE '+
   '    nr_nossonumero = :nr_nossonumero AND '+
   '    CASE WHEN LENGTH(ds_situacao) = 0 THEN 1=1 '+
	 '		     WHEN ds_situacao IN ("F", "J") THEN 1=1 '+
	 '		     WHEN ds_situacao IN ("B", "S") THEN 1<>1 '+
	 '	       WHEN (ds_situacao LIKE "R") AND (:ds_situacao IN ("B", "S")) THEN 1=1 '+
	 '		     WHEN (ds_situacao LIKE "E") AND (:ds_situacao IN ("J", "R", "B", "S")) THEN 1=1 '+
	 '		     ELSE 1<>1 '+
	 '    END ';
var
  dsChave: string;
  qyAlterarSituacao: TUMZQuery;
begin

  DM.CriarConsulta(qyAlterarSituacao);

  // Monta o SQL para alterar a situação do Nosso Número
  qyAlterarSituacao.Close;
  qyAlterarSituacao.SQL.Text := SQL_ALTERAR_SITUACAO_NN;
  qyAlterarSituacao.ParamByName('nr_nossonumero').AsString := nossoNumero;

  // Busca a chave da situação do Nosso Número
  dsChave := Self.getChaveSituacaoNossoNumero(novaSituacaoNN);

  qyAlterarSituacao.ParamByName('ds_situacao').AsString := dsChave;
  qyAlterarSituacao.ExecSQL;

  FreeAndNil(qyAlterarSituacao);
end;

procedure TRemessa.ignorarPedidoBaixaNaoEnviado(nossoNumero: string; cdLayout: integer);
const
  SQL_IGNORAR_PEDIDO_BAIXA =
   ' UPDATE '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON ( '+
   '        re.nr_nossonumero = rs.nr_nossonumero AND '+
   '        re.cd_ocorrencia IN (SELECT cd_ocorrencia FROM rem_ocorrencias WHERE cd_acao = :cd_acao AND cd_layout = :cd_layout AND sn_ativo = 1) AND '+
   '        re.sn_ignorado = 0 '+
   '    ) '+
   ' SET '+
   '    re.sn_ignorado = 1, '+
   '    re.dt_ignorado = NOW() '+   
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+
   '    re.cd_arquivo IS NULL ';
var
  qyIgnorarPedidoBaixa: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyIgnorarPedidoBaixa);

  // Monta o SQL para alterar a situação do Nosso Número
  qyIgnorarPedidoBaixa.Close;
  qyIgnorarPedidoBaixa.SQL.Text := SQL_IGNORAR_PEDIDO_BAIXA;
  qyIgnorarPedidoBaixa.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyIgnorarPedidoBaixa.ParamByName('cd_layout').AsInteger := cdLayout;

  // Busca a ação de remessa
  acaoRemessa := self.getAcaoRemessa(tarBaixa);
  qyIgnorarPedidoBaixa.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();

  // Ignora o pedido de baixa na fila de remessa,
  // apenas pedidos que não foram gerados arquivos
  qyIgnorarPedidoBaixa.ExecSQL;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  FreeAndNil(qyIgnorarPedidoBaixa);
end;

procedure TRemessa.registraAcaoBaixa(nossoNumero: string; situacaoNossoNumero: TSituacaoNN = snnNone);
var
  statusNN: TStatusNN;
begin

  if situacaoNossoNumero = snnNone then
  begin
    // Busca o status atual do Nosso Numero
    statusNN := self.getStatusNossoNumero(nossoNumero);

    // Verifica se o NN possui status
    if statusNN <> nil then
    begin
      // Busca a situação atual do Nosso Número
      situacaoNossoNumero := statusNN.getTpSituacao();
    end;
  end;

  {
    Verifica os possíveis status para o Nosso Número e as ações
    correspondentes para a baixa, sendo:

    (F) Fila - Marca o envio da remessa como ignorado,
               não precisa mais enviar se foi dada a baixa antes do envio
    (R) Rejeitado - Marca o envio da remessa como ignorado,
                    não precisa mais enviar se foi dada a baixa antes do novo envio
    (E) Exportado - Manda o pedido de baixa do Nosso Número
                    (porque não sabemos se já foi ou não para o banco)
    (R) Registrado - Manda o pedido de baixa do Nosso Número
    (B) Baixado - Não faz nada
    (S) Liquidado Sem Registro - Não faz nada
  }
    
  // NÃO POSSUI REGISTRO - Se a situação do Nosso Número for na fila, excluir da fila e marcar o registro como ignorado
  if (situacaoNossoNumero = snnFila) or
     (situacaoNossoNumero = snnRejeitado) then
  begin
    // Marca os registros de envio da remessa como ignorados, pois já foi dada a baixa
    self.ignorarEnvioRemessa(nossoNumero);
    // Remover o status do nosso número da fila
    self.removerStatusNossoNumero(nossoNumero);
  end;

  // POSSUI REGISTRO - Se a situação do nosso número for exportado ou registrado
  if (situacaoNossoNumero = snnExportado) or
     (situacaoNossoNumero = snnRegistrado) then
  begin
    // Marca os registros de envio da remessa como ignorados
    // (os que não estiverem exportados em arquivo)
    self.ignorarEnvioRemessa(nossoNumero);
    // Atualiza o código do envio mais atual no status do NN
    self.atualizarEnvioAtualNossoNumero(nossoNumero);
    // Envia o pedido de baixa para o Nosso Número
    self.enviaPedidoBaixa(nossoNumero);
  end;

end;

procedure TRemessa.registraAcaoCancelamento(nossoNumero: string);
var
  situacaoNossoNumero: TSituacaoNN;
  statusNN: TStatusNN;
begin

  // Inicia a situação do NN como não definida
  situacaoNossoNumero := snnNone;

  // Busca o status atual do Nosso Numero
  statusNN := self.getStatusNossoNumero(nossoNumero);

  // Verifica se o NN possui status
  if statusNN <> nil then
  begin
    // Busca a situação atual do Nosso Número
    situacaoNossoNumero := statusNN.getTpSituacao();
  end;

  {
    Verifica os possíveis status para o Nosso Número e as ações
    correspondentes para cancelamento, sendo:

    (F) Fila - Marca o envio da remessa como ignorado,
               não precisa enviar nada, pois foi feito o cancelamento antes do envio
    (R) Rejeitado - Marca o envio da remessa como ignorado,
                    não precisa mais enviar se foi feito o cancelamento antes do novo envio
    (E) Exportado - Manda o pedido de baixa do Nosso Número
                    (porque não sabemos se já foi ou não para o banco)
    (R) Registrado - Manda o pedido de baixa do Nosso Número
    (B) Baixado - Não faz nada
    (S) Liquidado Sem Registro - Não faz nada
  }

  // NÃO POSSUI REGISTRO - Se a situação do Nosso Número for na fila, excluir da fila e marcar o registro como ignorado
  if (situacaoNossoNumero = snnFila) or
     (situacaoNossoNumero = snnRejeitado) then
  begin
    // Marca os registros de envio da remessa como ignorados, pois já foi dada a baixa
    self.ignorarEnvioRemessa(nossoNumero);
    // Remover o status do nosso número da fila
    self.removerStatusNossoNumero(nossoNumero);
  end;

  // POSSUI REGISTRO - Se a situação do nosso número for exportado ou registrado, manda pedido de baixa
  if (situacaoNossoNumero = snnExportado) or
     (situacaoNossoNumero = snnRegistrado) then
  begin
    // Marca os registros de envio da remessa como ignorados
    // (os que não estiverem exportados em arquivo)
    self.ignorarEnvioRemessa(nossoNumero);
    // Atualiza o código do envio mais atual no status do NN
    self.atualizarEnvioAtualNossoNumero(nossoNumero);  
    // Envia o pedido de baixa para o Nosso Número
    self.enviaPedidoBaixa(nossoNumero);
  end;
end;

function TRemessa.registraAcaoProtesto(nossoNumero: string): boolean;
var
  situacaoNossoNumero: TSituacaoNN;
  statusNN: TStatusNN;
begin

  // Inicia a situação do NN como não definida
  situacaoNossoNumero := snnNone;

  // Busca o status atual do Nosso Numero
  statusNN := self.getStatusNossoNumero(nossoNumero);

  // Verifica se o NN possui status
  if statusNN <> nil then
  begin
    // Busca a situação atual do Nosso Número
    situacaoNossoNumero := statusNN.getTpSituacao();
  end;

  {
    Verifica os possíveis status para o Nosso Número e as ações
    correspondentes para protesto, sendo:

    (F) Fila - Manda o pedido de protesto do Nosso Número
    (R) Rejeitado - Não faz nada, porque o nosso número do titulo ainda
                    não foi aceito pelo banco
    (E) Exportado - Manda o pedido de protesto do Nosso Número
                    (porque não sabemos se já foi ou não para o banco)
    (R) Registrado - Manda o pedido de protesto do Nosso Número
    (B) Baixado - Não faz nada
    (S) Liquidado Sem Registro - Não faz nada
  }

  Result := False;

  if (situacaoNossoNumero = snnFila) or
     (situacaoNossoNumero = snnExportado) or
     (situacaoNossoNumero = snnRegistrado) then
  begin
    // Envia o pedido de protesto do nosso número para o banco
    Result := self.enviaPedidoProtesto(nossoNumero);
  end;

end;

procedure TRemessa.registraAcaoEnvio(nossoNumero: string; cdLayout, cdResp,
	cdBoleto: integer; dtVencimento: TDateTime; vlNominal, vlDesconto: currency;
  mensalidadesAgrupadas: TStringList);
const
  SQL_VERIFICAR_LAYOUT_BANCARIO =
   ' SELECT '+
   '    cd_layout '+
   ' FROM '+
   '    rem_layouts '+
   ' WHERE '+
   '    sn_cobranca_bancaria = 1 AND '+
   '    cd_layout = :cd_layout';

  SQL_GET_NR_SEQUENCIA =
   ' SELECT '+
   '    COALESCE(MAX(nr_sequencia), 0)+1 nr_sequencia '+
   ' FROM '+
   '    rem_envios '+
   ' WHERE '+
   '    nr_nossonumero = :nr_nossonumero';

  SQL_GET_CD_OCORRENCIA =
   ' SELECT '+
   '    cd_ocorrencia '+
   ' FROM '+
   '    rem_ocorrencias '+
   ' WHERE '+
   '    sn_ativo = 1 AND '+
   '    cd_layout = :cd_layout AND '+
   '    cd_acao = :cd_acao '+
   ' LIMIT 1 ';

  SQL_ACAO_ENVIO_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' VALUES ( '+
   '    NULL, :cd_layout, :nr_nossonumero, :nr_sequencia, '+
   '    :cd_resp, :dt_vencimento, :vl_nominal, :vl_desconto, :cd_ocorrencia, '+
   '    :cd_boleto, NULL, 0, NULL, NOW() '+
   ' ) ';
var
  qyVerificaLayout, qyAcaoEnvioNN,
  qyGetNrSequencia, qyGetCdOcorrencia: TUMZQuery;
  cdEnvioRegistro: integer;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyVerificaLayout);
  DM.CriarConsulta(qyAcaoEnvioNN);
  DM.CriarConsulta(qyGetNrSequencia);
  DM.CriarConsulta(qyGetCdOcorrencia);

  qyVerificaLayout.Close;
  qyVerificaLayout.SQL.Text := SQL_VERIFICAR_LAYOUT_BANCARIO;
  qyVerificaLayout.ParamByName('cd_layout').AsInteger := cdLayout;
  qyVerificaLayout.Open;

  // Se o layout não é para cobrança bancaria, não registra o envio
  if qyVerificaLayout.IsEmpty then
  begin
  	FreeAndNil(qyVerificaLayout);
  	FreeAndNil(qyAcaoEnvioNN);
  	FreeAndNil(qyGetNrSequencia);
  	FreeAndNil(qyGetCdOcorrencia);
    Exit;
  end;

  // Busca a ação de remessa para impressao de nosso número
  acaoRemessa := self.getAcaoRemessa(tarImpressaoBoleto);

  qyGetCdOcorrencia.Close;
  qyGetCdOcorrencia.SQL.Text := SQL_GET_CD_OCORRENCIA;
  qyGetCdOcorrencia.ParamByName('cd_layout').AsInteger := cdLayout;
  qyGetCdOcorrencia.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyGetCdOcorrencia.Open;

  // Se o código da ocorrencia não existe configurado, não registra o envio
  if qyGetCdOcorrencia.IsEmpty then
  begin
  	FreeAndNil(qyVerificaLayout);
  	FreeAndNil(qyAcaoEnvioNN);
  	FreeAndNil(qyGetNrSequencia);
  	FreeAndNil(qyGetCdOcorrencia);
    Exit;
  end;

  qyGetNrSequencia.Close;
  qyGetNrSequencia.SQL.Text := SQL_GET_NR_SEQUENCIA;
  qyGetNrSequencia.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyGetNrSequencia.Open;

  // Monta o SQL para incluir o Nosso Número no envio da remessa
  qyAcaoEnvioNN.Close;
  qyAcaoEnvioNN.SQL.Text := SQL_ACAO_ENVIO_NN;
  qyAcaoEnvioNN.ParamByName('cd_layout').AsInteger := cdLayout;
  qyAcaoEnvioNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAcaoEnvioNN.ParamByName('cd_resp').AsInteger := cdResp;
  qyAcaoEnvioNN.ParamByName('dt_vencimento').AsDateTime := dtVencimento;
  qyAcaoEnvioNN.ParamByName('vl_nominal').AsCurrency := vlNominal;
  qyAcaoEnvioNN.ParamByName('vl_desconto').AsCurrency := vlDesconto;
  qyAcaoEnvioNN.ParamByName('cd_boleto').AsInteger := cdBoleto;
  qyAcaoEnvioNN.ParamByName('nr_sequencia').AsInteger := qyGetNrSequencia.FieldByName('nr_sequencia').AsInteger;
  qyAcaoEnvioNN.ParamByName('cd_ocorrencia').AsInteger := qyGetCdOcorrencia.FieldByName('cd_ocorrencia').AsInteger;
  qyAcaoEnvioNN.ExecSQL;

  // Busca o código do registro inserido
  cdEnvioRegistro := DM.LastInsert;

  // Incluir a o status do Nosso Numero
  self.incluirStatusNossoNumero(nossoNumero, cdLayout, cdEnvioRegistro);

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Insere as mensalidades vinculadas a ação de envio para remessa
  self.insereMensalidadesAcaoEnvio(cdEnvioRegistro, mensalidadesAgrupadas);

  FreeAndNil(qyVerificaLayout);
  FreeAndNil(qyAcaoEnvioNN);
  FreeAndNil(qyGetNrSequencia);
  FreeAndNil(qyGetCdOcorrencia);
end;

function TRemessa.ehRemessaIgualUltimoEnvio(nossoNumero: string; cdLayout, cdResp: integer;
  dtVencimento: TDateTime; vlNominal, vlDesconto: currency;
  var snDiffVencimento, snDiffDesconto, snDiffResponsavel, snDiffOutro: boolean): boolean;
const
  SQL_COMPARA_ULTIMO_ENVIO_NN =
   ' SELECT '+
   '    CASE WHEN re.dt_vencimento != :dt_vencimento THEN 1 ELSE 0 END sn_vencimento, '+
   ' 	  CASE WHEN ROUND(re.vl_desconto, 2) != ROUND(:vl_desconto, 2) THEN 1 ELSE 0 END sn_desconto, '+
   ' 	  CASE WHEN re.cd_resp != :cd_resp THEN 1 ELSE 0 END sn_responsavel, '+
   '    CASE WHEN (re.cd_layout != :cd_layout) OR (ROUND(re.vl_nominal, 2) != ROUND(:vl_nominal, 2)) THEN 1 ELSE 0 END sn_outros, '+
   '    CASE WHEN (rl.sn_alterar_vencidos = 0) AND (re.dt_vencimento <= NOW()) THEN 1 ELSE 0 END sn_vencido '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_layouts rl ON (re.cd_layout = rl.cd_layout)'+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+
   '    re.sn_ignorado = 0 ';
var
  qyComparaUltimoEnvioNN: TUMZQuery;
begin

  DM.CriarConsulta(qyComparaUltimoEnvioNN);

  // Compara se a remessa é igual ao último envio
  qyComparaUltimoEnvioNN.Close;
  qyComparaUltimoEnvioNN.SQL.Text := SQL_COMPARA_ULTIMO_ENVIO_NN;
  qyComparaUltimoEnvioNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyComparaUltimoEnvioNN.ParamByName('cd_layout').AsInteger := cdLayout;
  qyComparaUltimoEnvioNN.ParamByName('cd_resp').AsInteger := cdResp;
  qyComparaUltimoEnvioNN.ParamByName('dt_vencimento').AsDateTime := dtVencimento;
  qyComparaUltimoEnvioNN.ParamByName('vl_nominal').AsCurrency := vlNominal;
  qyComparaUltimoEnvioNN.ParamByName('vl_desconto').AsCurrency := vlDesconto;
  qyComparaUltimoEnvioNN.Open;

  // Se não encontrou o registro significa que não existe última remessa enviada
  if qyComparaUltimoEnvioNN.IsEmpty then
  begin
    Result := False;
    FreeAndNil(qyComparaUltimoEnvioNN);
    Exit;
  end;

  // Inicia como se a remessa fosse igual a última
  Result := True;

  // Prepara para enviar as diferenças existentes no retorno por parâmetro
  snDiffVencimento := False;
  snDiffDesconto := False;
  snDiffOutro := False;

  // Verifica se o Vencimento é diferente
  if qyComparaUltimoEnvioNN.FieldByName('sn_vencimento').AsInteger = 1 then
  begin
    snDiffVencimento := True;
    Result := False;
  end;

  // Verifica se o desconto é diferente
  if qyComparaUltimoEnvioNN.FieldByName('sn_desconto').AsInteger = 1 then
  begin
    snDiffDesconto := True;
    Result := False;
  end;

  // Verifica se o responsável é diferente
  if qyComparaUltimoEnvioNN.FieldByName('sn_responsavel').AsInteger = 1 then
  begin
    snDiffResponsavel := True;
    Result := False;
  end;

 {
   Verifica se outras informações são diferentes OU
   No cenário de um título já registrado, que o sistema identifique alguma alteração -
   pode ser de vencimento, desconto ou dados do responsável -
   é verificado se o layout aceita que essa alteração possa ser enviada após
   o vencimento do título
  }
  if (qyComparaUltimoEnvioNN.FieldByName('sn_outros').AsInteger = 1)  then
  begin
    snDiffOutro := True;
    Result := False;
  end;

  { Foi separada a verificação de outros, pois, somente deve levar em consideracao
    o sn_vencido = 1 (rem_layout.sn_altera_vencido = 0) caso tenha alguma alteração
   Se for somente reimpressão de boleto vencido sem alteração não pode mudar nosso número
  }
  if (qyComparaUltimoEnvioNN.FieldByName('sn_vencido').AsInteger = 1) AND
     (snDiffResponsavel OR  snDiffDesconto OR snDiffVencimento)
  then
  begin
    snDiffOutro := True;
    Result := False;
  end;

  FreeAndNil(qyComparaUltimoEnvioNN);
end;

function TRemessa.getLayoutConta(cdConta: integer): integer;
const
  SQL_GET_LAYOUT =
   ' SELECT '+
   '    cd_layout '+
   ' FROM '+
   '    rem_layouts '+
   ' WHERE '+
   '    cd_caixa = :cd_caixa';
var
  qyGetLayout: TUMZQuery;
begin

  DM.CriarConsulta(qyGetLayout);

  qyGetLayout.Close;
  qyGetLayout.SQL.Text := SQL_GET_LAYOUT;
  qyGetLayout.ParamByName('cd_caixa').AsInteger := cdConta;
  qyGetLayout.Open;

  Result := -1;

  // Verifica se foi encontrado o layout da conta
  if not qyGetLayout.Eof then
  begin
    Result := qyGetLayout.FieldByName('cd_layout').AsInteger;
  end;

  FreeAndNil(qyGetLayout);
end;	

function TRemessa.GetNextSequenciaEnvio(const NossoNumero: AnsiString): Integer;
const
   SQLSelect = ''
      + ' SELECT '
      + '       COALESCE(MAX(NR_SEQUENCIA), 0) '
      + ' FROM '
      + '       REM_ENVIOS '
      + ' WHERE '
      + '       NR_NOSSONUMERO = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := 0;

   Stmt := PrepareStatement(SQLSelect);
   try
      Stmt.SetString(1, NossoNumero);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := Rs.GetInt(1);
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   Inc(Result);
end;

function TRemessa.getStatusNossoNumero(nossoNumero: string): TStatusNN;
const
  SQL_GET_STATUS_NN =
   ' SELECT '+
   '    rs.cd_layout, '+
   '    rs.nr_nossonumero, '+
   '    rs.ds_situacao, '+
   '    rs.cd_envio_registro, '+
   '    rs.cd_envio_atual '+
   ' FROM '+
   '    rem_status rs '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero';
var
  qyGetStatus: TUMZQuery;
  statusNN: TStatusNN;
  situacaoNN: TSituacaoNN;
begin

  DM.CriarConsulta(qyGetStatus);

  qyGetStatus.Close;
  qyGetStatus.SQL.Text := SQL_GET_STATUS_NN;
  qyGetStatus.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyGetStatus.Open;

  Result := nil;

  // Varre os registros de remessa encontrados
  if not qyGetStatus.Eof then
  begin

    // Cria o status do Nosso Numero
    statusNN := TStatusNN.Create;
    statusNN.setCdLayout(qyGetStatus.FieldByName('cd_layout').AsInteger);
    statusNN.setNrNossoNumero(qyGetStatus.FieldByName('nr_nossonumero').AsString);
    // Define a situação do Nosso Numero com a situação atual
    situacaoNN := self.getSituacaoNossoNumero(qyGetStatus.FieldByName('ds_situacao').AsString);
    statusNN.setTpSituacao(situacaoNN);
    statusNN.setCdEnvioRegistro(qyGetStatus.FieldByName('cd_envio_registro').AsInteger);
    statusNN.setCdEnvioBase(qyGetStatus.FieldByName('cd_envio_atual').AsInteger);

    Result := statusNN;
  end;

  FreeAndNil(qyGetStatus);
end;

procedure TRemessa.ignorarEnvioRemessa(nossoNumero: string);
const
  SQL_IGNORAR_REMESSA_NN =
   ' UPDATE '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero) '+
   ' SET '+
   '    re.dt_ignorado = NOW(), '+
   '    re.sn_ignorado = 1 '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+
   '    re.cd_arquivo IS NULL AND '+
   '    re.sn_ignorado = 0';
var
  qyIgnorarRemessa: TUMZQuery;
begin

  DM.CriarConsulta(qyIgnorarRemessa);

  // Monta o SQL para ignorar as remessas ativas do Nosso Número enviado  
  qyIgnorarRemessa.Close;
  qyIgnorarRemessa.SQL.Text := SQL_IGNORAR_REMESSA_NN;
  qyIgnorarRemessa.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyIgnorarRemessa.ExecSQL;

  FreeAndNil(qyIgnorarRemessa);
end;

procedure TRemessa.removerStatusNossoNumero(nossoNumero: string);
const
  SQL_REMOVER_STATUS_NN =
   ' DELETE FROM '+
   '    rem_status '+
   ' WHERE '+
   '    nr_nossonumero = :nr_nossonumero ';
var
  qyRemoverStatusNN: TUMZQuery;
begin

  DM.CriarConsulta(qyRemoverStatusNN);

  // Monta o SQL para remover o status atual do Nosso Número
  qyRemoverStatusNN.Close;
  qyRemoverStatusNN.SQL.Text := SQL_REMOVER_STATUS_NN;
  qyRemoverStatusNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyRemoverStatusNN.ExecSQL;

  FreeAndNil(qyRemoverStatusNN);
end;

procedure TRemessa.incluirStatusNossoNumero(nossoNumero: string; cdLayout: integer = -1; cdEnvioRegistro: integer = -1; situacaoNN: TSituacaoNN = snnFila);
const
  SQL_INCLUIR_STATUS_NN =
   ' INSERT IGNORE INTO rem_status ( '+
   '    cd_layout, nr_nossonumero, ds_situacao, cd_envio_registro, cd_envio_atual '+
   ' ) VALUES ( '+
   '    :cd_layout, :nr_nossonumero, :ds_situacao, :cd_envio_registro, :cd_envio_atual '+
   ' ) ';
var
  dsChave: string;
  qyIncluirStatusNN: TUMZQuery;
begin

  // Se não possuir NN não cria o status
  if Length(Trim(nossoNumero)) = 0 then
  begin
    Exit;
  end;

  DM.CriarConsulta(qyIncluirStatusNN);

  // Monta o SQL para incluir o status do Nosso Número
  qyIncluirStatusNN.Close;
  qyIncluirStatusNN.SQL.Text := SQL_INCLUIR_STATUS_NN;
  qyIncluirStatusNN.ParamByName('nr_nossonumero').AsString := nossoNumero;

  // Verifica se foi passado o Layout
  if cdLayout = -1 then
  begin
    qyIncluirStatusNN.ParamByName('cd_layout').Clear;
  end else begin
    qyIncluirStatusNN.ParamByName('cd_layout').AsInteger := cdLayout;
  end;

  // Verifica se foi passado o código de envio da remessa do registro
  if cdEnvioRegistro = -1 then
  begin
    qyIncluirStatusNN.ParamByName('cd_envio_registro').Clear;
    qyIncluirStatusNN.ParamByName('cd_envio_atual').Clear;
  end else begin
    qyIncluirStatusNN.ParamByName('cd_envio_registro').AsInteger := cdEnvioRegistro;
    qyIncluirStatusNN.ParamByName('cd_envio_atual').AsInteger := cdEnvioRegistro;
  end;

  // Busca a chave da situação do Nosso Número
  dsChave := Self.getChaveSituacaoNossoNumero(situacaoNN);
  qyIncluirStatusNN.ParamByName('ds_situacao').AsString := dsChave;
  
  qyIncluirStatusNN.ExecSQL;

  FreeAndNil(qyIncluirStatusNN);
end;

procedure TRemessa.atualizarEnvioAtualNossoNumero(nossoNumero: string);
const
  SQL_ATUALIZAR_ENVIO_ATUAL_NN =
   ' UPDATE '+
   '    rem_status '+
   ' SET '+
   ' 	  cd_envio_atual = (SELECT MAX(cd_envio) FROM rem_envios WHERE nr_nossonumero = :nr_nossonumero AND sn_ignorado = 0)'+
   ' WHERE '+
   '    nr_nossonumero = :nr_nossonumero ';
var
  qyAtualizarEnvioAtualNN: TUMZQuery;
begin

  DM.CriarConsulta(qyAtualizarEnvioAtualNN);

  // Monta o SQL para atualizar o envio atual do Nosso Número
  qyAtualizarEnvioAtualNN.Close;
  qyAtualizarEnvioAtualNN.SQL.Text := SQL_ATUALIZAR_ENVIO_ATUAL_NN;
  qyAtualizarEnvioAtualNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAtualizarEnvioAtualNN.ExecSQL;

  FreeAndNil(qyAtualizarEnvioAtualNN);
end;

procedure TRemessa.insereMensalidadesEnvioAtual(nossoNumero: string);
const
  SQL_INSERIR_MENSALIDADES_ENVIO_ATUAL =
   ' REPLACE INTO rem_envios_mensalidades(cd_envio, cd_mensalidade) '+
   ' SELECT '+
   '    rs.cd_envio_atual, m.cd_mensalidade '+
   ' FROM '+
   ' 	  rem_status rs '+
   ' 	  INNER JOIN mensalidades m ON (m.nossonumero = rs.nr_nossonumero) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero ';
var
  qyInserirMensalidadesEnvioAtual: TUMZQuery;
begin

  DM.CriarConsulta(qyInserirMensalidadesEnvioAtual);

  // Monta o SQL para inserir as mensalidades relacionadas ao envio atual
  qyInserirMensalidadesEnvioAtual.Close;
  qyInserirMensalidadesEnvioAtual.SQL.Text := SQL_INSERIR_MENSALIDADES_ENVIO_ATUAL;
  qyInserirMensalidadesEnvioAtual.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyInserirMensalidadesEnvioAtual.ExecSQL;

  FreeAndNil(qyInserirMensalidadesEnvioAtual);
end;

procedure TRemessa.insereMensalidadesEnvioRegistro(nossoNumero: string);
const
  SQL_INSERIR_MENSALIDADES_ENVIO_REGISTRO =
   ' REPLACE INTO rem_envios_mensalidades(cd_envio, cd_mensalidade) '+
   ' SELECT '+
   '    rs.cd_envio_atual, rem.cd_mensalidade '+
   ' FROM '+
   ' 	  rem_status rs '+
   ' 	  INNER JOIN rem_envios_mensalidades rem ON (rem.cd_envio = rs.cd_envio_registro) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero ';
var
  qyInserirMensalidadesEnvioAtual: TUMZQuery;
begin

  DM.CriarConsulta(qyInserirMensalidadesEnvioAtual);

  // Monta o SQL para inserir as mensalidades relacionadas ao envio atual
  qyInserirMensalidadesEnvioAtual.Close;
  qyInserirMensalidadesEnvioAtual.SQL.Text := SQL_INSERIR_MENSALIDADES_ENVIO_REGISTRO;
  qyInserirMensalidadesEnvioAtual.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyInserirMensalidadesEnvioAtual.ExecSQL;

  FreeAndNil(qyInserirMensalidadesEnvioAtual);
end;

procedure TRemessa.insereMensalidadesAcaoEnvio(cdEnvio: integer; mensalidadesAgrupadas: TStringList);
const
  SQL_INSERIR_MENSALIDADES =
   ' INSERT IGNORE INTO rem_envios_mensalidades(cd_envio, cd_mensalidade) '+
   '  VALUES (:cd_envio, :cd_mensalidade)';
var
  i: integer;
  qyInserirMensalidades: TUMZQuery;
begin

  DM.CriarConsulta(qyInserirMensalidades);

  for i := 0 to mensalidadesAgrupadas.Count - 1 do
  begin


    // Monta o SQL para inserir as mensalidades relacionadas ao envio repassado
    qyInserirMensalidades.Close;
    qyInserirMensalidades.SQL.Text := SQL_INSERIR_MENSALIDADES;
    qyInserirMensalidades.ParamByName('cd_envio').AsInteger := cdEnvio;
    qyInserirMensalidades.ParamByName('cd_mensalidade').AsInteger := StrToInt(mensalidadesAgrupadas[i]);
    qyInserirMensalidades.ExecSQL;

  end;

  FreeAndNil(qyInserirMensalidades);
end;

procedure TRemessa.atualizarEnvioRegistroNossoNumero(nossoNumero: string);
const
  SQL_ATUALIZAR_ENVIO_REGISTRO_NN =
   ' UPDATE '+
   '    rem_status '+
   ' SET '+
   ' 	  cd_envio_registro = (SELECT MIN(cd_envio) FROM rem_envios WHERE nr_nossonumero = :nr_nossonumero AND sn_ignorado = 0)'+
   ' WHERE '+
   '    nr_nossonumero = :nr_nossonumero ';
var
  qyAtualizarEnvioRegistroNN: TUMZQuery;
begin

  DM.CriarConsulta(qyAtualizarEnvioRegistroNN);

  // Monta o SQL para atualizar o envio registro do Nosso Número
  qyAtualizarEnvioRegistroNN.Close;
  qyAtualizarEnvioRegistroNN.SQL.Text := SQL_ATUALIZAR_ENVIO_REGISTRO_NN;
  qyAtualizarEnvioRegistroNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAtualizarEnvioRegistroNN.ExecSQL;

  FreeAndNil(qyAtualizarEnvioRegistroNN);
end;

function TRemessa.enviaPedidoBaixa(nossoNumero: string): boolean;
const
  SQL_PEDIDO_BAIXA_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	 WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    re.cd_resp,       '+
   '    re.dt_vencimento, '+
   '    re.vl_nominal,    '+
   '    re.vl_desconto,   '+
   '    ro.cd_ocorrencia, '+
   '    re.cd_boleto,     '+
   '    NULL cd_arquivo,  '+
   '    0 sn_ignorado,    '+
   '    NULL dt_ignorado, '+
   '    NOW() dt_inclusao '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   '    LEFT JOIN rem_envios re2 ON ( '+
   '        re2.nr_nossonumero = rs.nr_nossonumero AND '+
   '        re2.cd_ocorrencia = ro.cd_ocorrencia AND '+
   '        re2.sn_ignorado = 0 '+
   '    ) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+
   '    re2.cd_envio IS NULL AND '+
   '    ro.cd_acao = :cd_acao';
var
  qyPedidoBaixaNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyPedidoBaixaNN);

  Result := False;

  // Busca a ação de remessa para baixa de nosso número
  acaoRemessa := self.getAcaoRemessa(tarBaixa);

  // Monta o SQL para incluir o pedido de baixa do Nosso Número
  qyPedidoBaixaNN.Close;
  qyPedidoBaixaNN.SQL.Text := SQL_PEDIDO_BAIXA_NN;
  qyPedidoBaixaNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyPedidoBaixaNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyPedidoBaixaNN.ExecSQL;

  // Verifica se a ação foi executada com sucesso
  if qyPedidoBaixaNN.RowsAffected > 0 then
  begin
    // Atualiza o código de envio atual do NN
    self.atualizarEnvioAtualNossoNumero(nossoNumero);

    // Atualizar as mensalidades vinculadas ao envio atual
    self.insereMensalidadesEnvioRegistro(nossoNumero);

    Result := True;    
  end;

  FreeAndNil(qyPedidoBaixaNN);
end;

procedure TRemessa.ignorarRemessaAlteracaoDados(nossoNumero: string);
const
  SQL_IGNORA_ACOES_ALTERACAO =
   ' UPDATE '+
   '    rem_envios re '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = re.cd_layout AND re.cd_ocorrencia = ro.cd_ocorrencia) '+
   ' SET '+
   '    re.dt_ignorado = NOW(), '+
   '    re.sn_ignorado = 1 '+
   ' WHERE '+
   '    re.nr_nossonumero = :nr_nossonumero AND '+
   '    re.cd_arquivo IS NULL AND '+
   '    re.sn_ignorado = 0 AND '+
   '    ro.sn_ativo = 1 AND '+
   '    ro.cd_acao IN (:cd_acao) ';
var
  qyIgnoraRemessa: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
  arrAcoesRemessa: TSTringList;
begin

  DM.CriarConsulta(qyIgnoraRemessa);

  // Cria o stringlist para armazenar os códigos de ações de remessa 
  arrAcoesRemessa := TStringList.Create;

  // Busca as ações de remessa de alteração de vencimento, desconto e responsável
  // Inclui os códigos dessas ações no stringlist

  acaoRemessa := self.getAcaoRemessa(tarProrrogar);
  arrAcoesRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  acaoRemessa := self.getAcaoRemessa(tarDesconto);
  arrAcoesRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  acaoRemessa := self.getAcaoRemessa(tarAlteracaoMensalidade);
  arrAcoesRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  // Monta o SQL para buscar qual último o número da sequencia da ação de remessa repassada
  qyIgnoraRemessa.Close;
  qyIgnoraRemessa.SQL.Text := SQL_IGNORA_ACOES_ALTERACAO;
  qyIgnoraRemessa.ParamByName('nr_nossonumero').AsString := nossoNumero;

  // Atribui a ações que serão ignoradas (vencimento, desconto e outros dados)
  arrAcoesRemessa.Delimiter := ',';
  if arrAcoesRemessa.Count > 0 then
  begin
    qyIgnoraRemessa.SQL.Text := ReplaceStr( qyIgnoraRemessa.SQL.Text, ':cd_acao', arrAcoesRemessa.DelimitedText );
  end;
  qyIgnoraRemessa.SQL.Text := ReplaceStr( qyIgnoraRemessa.SQL.Text, ':cd_acao', '-1' );

  qyIgnoraRemessa.ExecSQL;

  // Atualiza o código de envio atual
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  FreeAndNil(qyIgnoraRemessa);
end;

procedure TRemessa.otimizarEnviosRemessa(cdArquivo: integer);
const
  SQL_NN_OTIMIZAR_ENVIOS =
   ' SELECT '+
	 '    re.nr_nossonumero '+
   ' FROM '+
	 '    rem_envios re '+
	 '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = re.cd_layout AND re.cd_ocorrencia = ro.cd_ocorrencia) '+
   ' WHERE '+
   '	  re.sn_ignorado = 0 AND '+
	 '    (re.cd_arquivo = :cd_arquivo OR re.cd_arquivo IS NULL) '+
   ' GROUP BY '+
   '    re.nr_nossonumero '+
   ' HAVING '+
	 '    SUM(CASE WHEN ro.cd_acao IN (:cd_acoes_registro) THEN 1 ELSE 0 END) > 0 AND '+
	 '    SUM(CASE WHEN ro.cd_acao IN (:cd_acoes_alteracao) THEN 1 ELSE 0 END) > 0 AND '+
	 '    SUM(CASE WHEN ro.cd_acao IN (:cd_acoes_baixa) THEN 1 ELSE 0 END) = 0 ';

  SQL_IGNORAR_ENVIOS_NN =
   ' UPDATE '+
   '    rem_envios '+
   ' SET '+
   '    sn_ignorado = 1, '+
   '    dt_ignorado = NOW() '+
   ' WHERE '+
   '    nr_nossonumero LIKE :nr_nossonumero AND '+
   '    sn_ignorado = 0 AND '+
   '    (cd_arquivo = :cd_arquivo OR cd_arquivo IS NULL) ';

  SQL_NOVO_REGISTRO_ULTIMO_ENVIO_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT '+
   '    re.cd_layout, re.nr_nossonumero, '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 nr_sequencia FROM rem_envios WHERE nr_nossonumero LIKE :nr_nossonumero), '+
   '    re.cd_resp, re.dt_vencimento, re.vl_nominal, '+
   '    re.vl_desconto, '+
   '    (SELECT cd_ocorrencia FROM rem_ocorrencias WHERE sn_ativo = 1 AND cd_layout = re.cd_layout AND cd_acao = :cd_acao LIMIT 1), '+
   '    re.cd_boleto, '+
   '    NULL, 0, NULL, NOW() '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON ( '+
   '        re.nr_nossonumero = rs.nr_nossonumero AND '+
   '        rs.cd_envio_atual = re.cd_envio '+
   '    ) '+
   ' WHERE '+
   '    rs.nr_nossonumero LIKE :nr_nossonumero ';

  SQL_INSERIR_MENSALIDADES_ULTIMO_ENVIO_NN =
   ' INSERT IGNORE INTO rem_envios_mensalidades (cd_envio, cd_mensalidade) '+
   ' SELECT '+
   '    :cd_envio, rem.cd_mensalidade '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON ( '+
   '        re.nr_nossonumero = rs.nr_nossonumero AND '+
   '        rs.cd_envio_atual = re.cd_envio '+
   '    ) '+
   ' 	  INNER JOIN rem_envios_mensalidades rem ON ( '+
	 '  		  rem.cd_envio = re.cd_envio '+
	 '    ) '+
   ' WHERE '+
   '    rs.nr_nossonumero LIKE :nr_nossonumero ';
   
var
  qyOtimizarNN, qyIgnoraEnviosNN, qyNovoRegistroUltimoEnvioNN,
  qyInserirMensalidadesUltimoEnvio: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
  arrAcoesAlteracaoRemessa, arrAcoesRegistroRemessa,
  arrAcoesBaixaRemessa: TSTringList;
  cdEnvioNovo: Integer;
  nossoNumero: String;
begin

  DM.CriarConsulta(qyOtimizarNN);
  DM.CriarConsulta(qyIgnoraEnviosNN);
  DM.CriarConsulta(qyNovoRegistroUltimoEnvioNN);
  DM.CriarConsulta(qyInserirMensalidadesUltimoEnvio);

  // Cria o stringlist para armazenar os códigos de ações de remessa
  arrAcoesAlteracaoRemessa := TStringList.Create;
  arrAcoesRegistroRemessa := TStringList.Create;
  arrAcoesBaixaRemessa := TStringList.Create;

  // Busca as ações de remessa de alteração de vencimento, desconto e responsável
  // Inclui os códigos dessas ações no stringlist

  // Adiciona as ações de registro
  acaoRemessa := self.getAcaoRemessa(tarImpressaoBoleto);
  arrAcoesRegistroRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  acaoRemessa := self.getAcaoRemessa(tarGerarMensalidade);
  arrAcoesRegistroRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  // Adiciona as ações de alteração no TStringList
  acaoRemessa := self.getAcaoRemessa(tarProrrogar);
  arrAcoesAlteracaoRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  acaoRemessa := self.getAcaoRemessa(tarDesconto);
  arrAcoesAlteracaoRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  acaoRemessa := self.getAcaoRemessa(tarAlteracaoMensalidade);
  arrAcoesAlteracaoRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  // Adiciona a ação de baixa no TStringList
  acaoRemessa := self.getAcaoRemessa(tarBaixa);
  arrAcoesBaixaRemessa.Add(IntToStr(acaoRemessa.getCdAcao()));

  // Monta o SQL para buscar quais NN devem ser otimizados do arquivo repassado
  qyOtimizarNN.Close;
  qyOtimizarNN.SQL.Text := SQL_NN_OTIMIZAR_ENVIOS;
  qyOtimizarNN.ParamByName('cd_arquivo').AsInteger := cdArquivo;

  {
    Atribui a ações que serão checadas conforme a regra de otimização, onde
    1) deve possuir registro de remessa no arquivo enviado
    2) deve possuir algum envio de alteração de dados (desconto, vencimento, outros dados)
    3) não deve possuir pedido de baixa no mesmo arquivo
  }

  // Atribui a ações de registro
  arrAcoesRegistroRemessa.Delimiter := ',';
  if arrAcoesRegistroRemessa.Count > 0 then
  begin
    qyOtimizarNN.SQL.Text := ReplaceStr( qyOtimizarNN.SQL.Text, ':cd_acoes_registro', arrAcoesRegistroRemessa.DelimitedText );
  end;
  qyOtimizarNN.SQL.Text := ReplaceStr( qyOtimizarNN.SQL.Text, ':cd_acoes_registro', '-1' );

  // Atribui a ações de alteração de dados
  arrAcoesAlteracaoRemessa.Delimiter := ',';
  if arrAcoesAlteracaoRemessa.Count > 0 then
  begin
    qyOtimizarNN.SQL.Text := ReplaceStr( qyOtimizarNN.SQL.Text, ':cd_acoes_alteracao', arrAcoesAlteracaoRemessa.DelimitedText );
  end;
  qyOtimizarNN.SQL.Text := ReplaceStr( qyOtimizarNN.SQL.Text, ':cd_acoes_alteracao', '-1' );

  // Atribui a ações de alteração de dados
  arrAcoesBaixaRemessa.Delimiter := ',';
  if arrAcoesBaixaRemessa.Count > 0 then
  begin
    qyOtimizarNN.SQL.Text := ReplaceStr( qyOtimizarNN.SQL.Text, ':cd_acoes_baixa', arrAcoesBaixaRemessa.DelimitedText );
  end;
  qyOtimizarNN.SQL.Text := ReplaceStr( qyOtimizarNN.SQL.Text, ':cd_acoes_baixa', '-1' );

  qyOtimizarNN.Open;

  // Busca a ação de remessa para impressao de nosso número
  acaoRemessa := self.getAcaoRemessa(tarImpressaoBoleto);

  // Varre os envios de remessa que devem ser otimizados
  while not qyOtimizarNN.Eof do
  begin
    nossoNumero := qyOtimizarNN.FieldByName('nr_nossonumero').AsString;

    // Monta e executa SQL que ignora os envios do NN que deve ser otimizado
    qyIgnoraEnviosNN.Close;
    qyIgnoraEnviosNN.SQL.Text := SQL_IGNORAR_ENVIOS_NN;
    qyIgnoraEnviosNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
    qyIgnoraEnviosNN.ParamByName('cd_arquivo').AsInteger := cdArquivo;
    qyIgnoraEnviosNN.ExecSQL;

    // Cria um novo envio de registro da remessa com as informações mais atuais
    qyNovoRegistroUltimoEnvioNN.Close;
    qyNovoRegistroUltimoEnvioNN.SQL.Text := SQL_NOVO_REGISTRO_ULTIMO_ENVIO_NN;
    qyNovoRegistroUltimoEnvioNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
    qyNovoRegistroUltimoEnvioNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
    qyNovoRegistroUltimoEnvioNN.ExecSQL;

    // Recupera o código de envio do registro inserido
    cdEnvioNovo := DM.LastInsert();

    // Atualiza as mensalidades do último envio
    qyInserirMensalidadesUltimoEnvio.Close;
    qyInserirMensalidadesUltimoEnvio.SQL.Text := SQL_INSERIR_MENSALIDADES_ULTIMO_ENVIO_NN;
    qyInserirMensalidadesUltimoEnvio.ParamByName('cd_envio').AsInteger := cdEnvioNovo;
    qyInserirMensalidadesUltimoEnvio.ParamByName('nr_nossonumero').AsString := nossoNumero;
    qyInserirMensalidadesUltimoEnvio.ExecSQL;

    // Atualiza o código de envio atual e de registro do NN
    self.atualizarEnvioAtualNossoNumero(nossoNumero);
    self.atualizarEnvioRegistroNossoNumero(nossoNumero);

    qyOtimizarNN.Next;
  end;

  FreeAndNil(qyOtimizarNN);
  FreeAndNil(qyIgnoraEnviosNN);
  FreeAndNil(qyNovoRegistroUltimoEnvioNN);
  FreeAndNil(qyInserirMensalidadesUltimoEnvio);

end;

function TRemessa.verificaAcaoEstaFila(nossoNumero: string; tipoAcaoRemessa: TTipoAcaoRemessa): boolean;
const
  SQL_VERIFICA_ACAO_FILA =
   ' SELECT '+
   '    re.cd_envio '+
   ' FROM '+
   '    rem_envios re '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = re.cd_layout AND re.cd_ocorrencia = ro.cd_ocorrencia) '+
   ' WHERE '+
   '    re.nr_nossonumero = :nr_nossonumero AND '+
   '    re.sn_ignorado = 0 AND '+
   '    re.cd_arquivo IS NULL AND '+
   '    ro.sn_ativo = 1 AND '+
   '    ro.cd_acao = :cd_acao ';
var
  qyVerificaAcaoFila: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyVerificaAcaoFila);

  // Busca a ação de remessa para o tipo de ação repassado
  acaoRemessa := self.getAcaoRemessa(tipoAcaoRemessa);

  // Monta o SQL para buscar qual último o número da sequencia da ação de remessa repassada
  qyVerificaAcaoFila.Close;
  qyVerificaAcaoFila.SQL.Text := SQL_VERIFICA_ACAO_FILA;
  qyVerificaAcaoFila.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyVerificaAcaoFila.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyVerificaAcaoFila.Open;

  qyVerificaAcaoFila.First;

  Result := False;

  // Se existir alguma ação de remessa na fila para envio
  if not qyVerificaAcaoFila.Eof then
  begin
    Result := True;
  end;

  FreeAndNil(qyVerificaAcaoFila);
end;

function TRemessa.enviaAlteracaoVencimento(nossoNumero: string; novoVencimento: TDateTime; cdBoleto: integer): boolean;
const
  SQL_ALTERACAO_VENCIMENTO_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	   WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    re.cd_resp,       			  '+
   '    :dt_vencimento dt_vencimento, '+
   '    re.vl_nominal,    			  '+
   '    re.vl_desconto,   			  '+
   '    ro.cd_ocorrencia, 			  '+
   '    :cd_boleto cd_boleto, 	  '+
   '    NULL cd_arquivo,    			'+
   '    0 sn_ignorado,    			  '+
   '    NULL dt_ignorado, 			  '+
   '    NOW() dt_inclusao 			  '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+   
   '    ro.cd_acao = :cd_acao';
var
  qyAlteracaoVencimentoNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyAlteracaoVencimentoNN);

  Result := False;

  // Busca a ação de remessa para alteração de vencimento de nosso número
  acaoRemessa := self.getAcaoRemessa(tarProrrogar);

  // Monta o SQL para incluir a alteração de vencimento do Nosso Número
  qyAlteracaoVencimentoNN.Close;
  qyAlteracaoVencimentoNN.SQL.Text := SQL_ALTERACAO_VENCIMENTO_NN;
  qyAlteracaoVencimentoNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAlteracaoVencimentoNN.ParamByName('dt_vencimento').AsDatetime := novoVencimento;
  qyAlteracaoVencimentoNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyAlteracaoVencimentoNN.ParamByName('cd_boleto').AsInteger := cdBoleto;
  qyAlteracaoVencimentoNN.ExecSQL;

  // Verifica se não conseguiu inserir a ação de alteração de vencimento,
  // nesse caso tenta com a ação de alteração de dados de mensalidade
  if qyAlteracaoVencimentoNN.RowsAffected = 0 then
  begin
    Result := self.enviaAlteracaoOutrosDadosVencimento(nossoNumero, novoVencimento, cdBoleto);
    FreeAndNil(qyAlteracaoVencimentoNN);
    Exit;
  end;

  Result := True;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Atualizar as mensalidades vinculadas ao envio atual
  self.insereMensalidadesEnvioAtual(nossoNumero);  

  FreeAndNil(qyAlteracaoVencimentoNN);
end;

function TRemessa.enviaAlteracaoDesconto(nossoNumero: string; novoDesconto: currency; cdBoleto: integer): boolean;
const
  SQL_ALTERACAO_DESCONTO_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	 WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    re.cd_resp,       		  '+
   '    re.dt_vencimento, 		  '+
   '    re.vl_nominal,    		  '+
   '    :vl_desconto vl_desconto, '+
   '    ro.cd_ocorrencia, 		  '+
   '    :cd_boleto cd_boleto,   '+
   '    NULL cd_arquivo,    		'+
   '    0 sn_ignorado,    		  '+
   '    NULL dt_ignorado, 		  '+
   '    NOW() dt_inclusao 		  '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+   
   '    ro.cd_acao = :cd_acao';
var
  qyAlteracaoDescontoNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyAlteracaoDescontoNN);

  Result := False;

  // Busca a ação de remessa para alteração de vencimento de nosso número
  acaoRemessa := self.getAcaoRemessa(tarDesconto);

  // Monta o SQL para incluir a alteração de vencimento do Nosso Número
  qyAlteracaoDescontoNN.Close;
  qyAlteracaoDescontoNN.SQL.Text := SQL_ALTERACAO_DESCONTO_NN;
  qyAlteracaoDescontoNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAlteracaoDescontoNN.ParamByName('vl_desconto').AsCurrency := novoDesconto;
  qyAlteracaoDescontoNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyAlteracaoDescontoNN.ParamByName('cd_boleto').AsInteger := cdBoleto;  
  qyAlteracaoDescontoNN.ExecSQL;

  // Verifica se não conseguiu inserir a ação de alteração de desconto,
  // nesse caso tenta com a ação de alteração de dados de mensalidade
  if qyAlteracaoDescontoNN.RowsAffected = 0 then
  begin
    Result := self.enviaAlteracaoOutrosDadosDesconto(nossoNumero, novoDesconto, cdBoleto);
    FreeAndNil(qyAlteracaoDescontoNN);
    Exit;
  end;

  Result := True;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Atualizar as mensalidades vinculadas ao envio atual
  self.insereMensalidadesEnvioAtual(nossoNumero);  

  FreeAndNil(qyAlteracaoDescontoNN);
end;

function TRemessa.enviaAlteracaoOutrosDadosVencimento(nossoNumero: string; novoVencimento: TDateTime; cdBoleto: integer): boolean;
const
  SQL_ALTERACAO_OUTROS_DADOS_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	 WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    re.cd_resp,         '+
   '    :dt_vencimento dt_vencimento, '+
   '    re.vl_nominal,      '+
   '    re.vl_desconto,     '+
   '    ro.cd_ocorrencia,   '+
   '    :cd_boleto cd_boleto, '+
   '    NULL cd_arquivo,    '+
   '    0 sn_ignorado,      '+
   '    NULL dt_ignorado,   '+
   '    NOW() dt_inclusao   '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+   
   '    ro.cd_acao = :cd_acao';
var
  qyAlteracaoOutrosDadosNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyAlteracaoOutrosDadosNN);

  Result := False;

  // Busca a ação de remessa para alteração de outros dados do nosso número
  acaoRemessa := self.getAcaoRemessa(tarAlteracaoMensalidade);

  // Monta o SQL para incluir a alteração de vencimento do Nosso Número
  qyAlteracaoOutrosDadosNN.Close;
  qyAlteracaoOutrosDadosNN.SQL.Text := SQL_ALTERACAO_OUTROS_DADOS_NN;
  qyAlteracaoOutrosDadosNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAlteracaoOutrosDadosNN.ParamByName('dt_vencimento').AsDatetime := novoVencimento;
  qyAlteracaoOutrosDadosNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyAlteracaoOutrosDadosNN.ParamByName('cd_boleto').AsInteger := cdBoleto;
  qyAlteracaoOutrosDadosNN.ExecSQL;

  // Verifica se a ação foi executada com sucesso
  if qyAlteracaoOutrosDadosNN.RowsAffected > 0 then
  begin
    Result := True;
  end;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Atualizar as mensalidades vinculadas ao envio atual
  self.insereMensalidadesEnvioAtual(nossoNumero);

  FreeAndNil(qyAlteracaoOutrosDadosNN);
end;

function TRemessa.enviaAlteracaoOutrosDadosDesconto(nossoNumero: string; novoDesconto: currency; cdBoleto: integer): boolean;
const
  SQL_ALTERACAO_OUTROS_DADOS_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	 WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    re.cd_resp,         '+
   '    re.dt_vencimento,   '+
   '    re.vl_nominal,      '+
   '    :vl_desconto vl_desconto, '+
   '    ro.cd_ocorrencia,   '+
   '    :cd_boleto cd_boleto, '+
   '    NULL cd_arquivo,    '+
   '    0 sn_ignorado,      '+
   '    NULL dt_ignorado,   '+
   '    NOW() dt_inclusao   '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+   
   '    ro.cd_acao = :cd_acao';
var
  qyAlteracaoOutrosDadosNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyAlteracaoOutrosDadosNN);

  Result := False;

  // Busca a ação de remessa para alteração de outros dados do nosso número
  acaoRemessa := self.getAcaoRemessa(tarAlteracaoMensalidade);

  // Monta o SQL para incluir a alteração de vencimento do Nosso Número
  qyAlteracaoOutrosDadosNN.Close;
  qyAlteracaoOutrosDadosNN.SQL.Text := SQL_ALTERACAO_OUTROS_DADOS_NN;
  qyAlteracaoOutrosDadosNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAlteracaoOutrosDadosNN.ParamByName('vl_desconto').AsCurrency := novoDesconto;
  qyAlteracaoOutrosDadosNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyAlteracaoOutrosDadosNN.ParamByName('cd_boleto').AsInteger := cdBoleto;
  qyAlteracaoOutrosDadosNN.ExecSQL;

  // Verifica se a ação foi executada com sucesso
  if qyAlteracaoOutrosDadosNN.RowsAffected > 0 then
  begin
    Result := True;
  end;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Atualizar as mensalidades vinculadas ao envio atual
  self.insereMensalidadesEnvioAtual(nossoNumero);  

  FreeAndNil(qyAlteracaoOutrosDadosNN);
end;

function TRemessa.enviaAlteracaoOutrosDados(nossoNumero: string; novoResponsavel: integer; cdBoleto: integer): boolean;
const
  SQL_ALTERACAO_OUTROS_DADOS_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	 WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    :cd_resp cd_resp,   '+
   '    re.dt_vencimento,   '+
   '    re.vl_nominal,      '+
   '    re.vl_desconto,     '+
   '    ro.cd_ocorrencia,   '+
   '    :cd_boleto cd_boleto, '+
   '    NULL cd_arquivo,    '+
   '    0 sn_ignorado,      '+
   '    NULL dt_ignorado,   '+
   '    NOW() dt_inclusao   '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+   
   '    ro.cd_acao = :cd_acao';
var
  qyAlteracaoOutrosDadosNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyAlteracaoOutrosDadosNN);

  Result := False;

  // Busca a ação de remessa para alteração de outros dados do nosso número
  acaoRemessa := self.getAcaoRemessa(tarAlteracaoMensalidade);

  // Monta o SQL para incluir a alteração de vencimento do Nosso Número
  qyAlteracaoOutrosDadosNN.Close;
  qyAlteracaoOutrosDadosNN.SQL.Text := SQL_ALTERACAO_OUTROS_DADOS_NN;
  qyAlteracaoOutrosDadosNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyAlteracaoOutrosDadosNN.ParamByName('cd_resp').AsInteger := novoResponsavel;
  qyAlteracaoOutrosDadosNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyAlteracaoOutrosDadosNN.ParamByName('cd_boleto').AsInteger := cdBoleto;
  qyAlteracaoOutrosDadosNN.ExecSQL;

  // Verifica se a ação foi executada com sucesso
  if qyAlteracaoOutrosDadosNN.RowsAffected > 0 then
  begin
    Result := True;
  end;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Atualizar as mensalidades vinculadas ao envio atual
  self.insereMensalidadesEnvioAtual(nossoNumero);

  FreeAndNil(qyAlteracaoOutrosDadosNN);
end;

function TRemessa.enviaPedidoProtesto(nossoNumero: string): boolean;
const
  SQL_PEDIDO_PROTESTO_NN =
   ' INSERT INTO rem_envios ( '+
   '    cd_envio, cd_layout, nr_nossonumero, nr_sequencia, '+
   '    cd_resp, dt_vencimento, vl_nominal, vl_desconto, cd_ocorrencia, '+
   '    cd_boleto, cd_arquivo, sn_ignorado, dt_ignorado, dt_inclusao) '+
   ' SELECT                 '+
   '    NULL cd_envio,      '+
   '    re.cd_layout,       '+
   '    re.nr_nossonumero,  '+
   '    (SELECT COALESCE(MAX(nr_sequencia), 0)+1 FROM rem_envios '+
   '	 WHERE nr_nossonumero = :nr_nossonumero) nr_sequencia,   '+
   '    re.cd_resp,       '+
   '    re.dt_vencimento, '+
   '    re.vl_nominal,    '+
   '    re.vl_desconto,   '+
   '    ro.cd_ocorrencia, '+
   '    re.cd_boleto,     '+
   '    NULL cd_arquivo,  '+
   '    0 sn_ignorado,    '+
   '    NULL dt_ignorado, '+
   '    NOW() dt_inclusao '+
   ' FROM '+
   '    rem_status rs '+
   '    INNER JOIN rem_envios re ON (re.nr_nossonumero = rs.nr_nossonumero AND re.cd_envio = rs.cd_envio_atual) '+
   '    INNER JOIN rem_ocorrencias ro ON (ro.cd_layout = rs.cd_layout) '+
   ' WHERE '+
   '    rs.nr_nossonumero = :nr_nossonumero AND '+        
   '    ro.sn_ativo = 1 AND '+
   '    re.sn_ignorado = 0 AND '+   
   '    ro.cd_acao = :cd_acao';
var
  qyPedidoProtestoNN: TUMZQuery;
  acaoRemessa: TAcaoRemessa;
begin

  DM.CriarConsulta(qyPedidoProtestoNN);

  Result := False;

  // Busca a ação de remessa para protesto de nosso número
  acaoRemessa := self.getAcaoRemessa(tarProtesto);

  // Monta o SQL para incluir o pedido de baixa do Nosso Número
  qyPedidoProtestoNN.Close;
  qyPedidoProtestoNN.SQL.Text := SQL_PEDIDO_PROTESTO_NN;
  qyPedidoProtestoNN.ParamByName('nr_nossonumero').AsString := nossoNumero;
  qyPedidoProtestoNN.ParamByName('cd_acao').AsInteger := acaoRemessa.getCdAcao();
  qyPedidoProtestoNN.ExecSQL;

  // Verifica se a ação foi executada com sucesso
  if qyPedidoProtestoNN.RowsAffected > 0 then
  begin
    Result := True;
  end;

  // Atualiza o código de envio atual do NN
  self.atualizarEnvioAtualNossoNumero(nossoNumero);

  // Atualizar as mensalidades vinculadas ao envio atual
  self.insereMensalidadesEnvioAtual(nossoNumero);

  FreeAndNil(qyPedidoProtestoNN);
end;

function TRemessa.getAcaoRemessa(tipoAcaoRemessa: TTipoAcaoRemessa): TAcaoRemessa;
var
  chaveAcaoRemessa: string;
  acaoRemessa: TAcaoRemessa;
begin

  Result := nil;

  // Busca a ação de remessa para impressao de nosso número
  chaveAcaoRemessa := ChavesAcoesRemessa[tipoAcaoRemessa];

  try
    Result := TAcaoRemessa(arrAcoesRemessa.Objects[arrAcoesRemessa.IndexOf(chaveAcaoRemessa)]);
  except
    acaoRemessa := TAcaoRemessa.Create;
    acaoRemessa.setCdAcao(-1);
    acaoRemessa.setDsAcao('Nenhuma ação encontrada (rem_acoes)');
    acaoRemessa.setDsChave('');

    Result := acaoRemessa;
  end;

end;

function TRemessa.getSituacaoNossoNumero(dsChave: string): TSituacaoNN;
begin

  Result := snnNone;

  { Verificar qual a chave da situação para repassar o enumerador }

  if dsChave = 'F' then Result := snnFila;
  if dsChave = 'E' then Result := snnExportado;
  if dsChave = 'R' then Result := snnRegistrado;
  if dsChave = 'B' then Result := snnBaixado;
  if dsChave = 'J' then Result := snnRejeitado;
  if dsChave = 'S' then Result := snnLiquidadoSemRegistro;

end;

function TRemessa.getChaveSituacaoNossoNumero(situacaoNN: TSituacaoNN): string;
begin

  Result := '';

  { Verificar qual a chave da situação para repassar o enumerador }

  if situacaoNN = snnFila then Result := 'F';
  if situacaoNN = snnExportado then Result := 'E';
  if situacaoNN = snnRegistrado then Result := 'R';
  if situacaoNN = snnBaixado then Result := 'B';
  if situacaoNN = snnRejeitado then Result := 'J';
  if situacaoNN = snnLiquidadoSemRegistro then Result := 'S';

end;

{ TAcaoRemessa }

function TAcaoRemessa.getCdAcao: integer;
begin
  Result := self.cdAcao;
end;

function TAcaoRemessa.getDsAcao: string;
begin
  Result := self.dsAcao;
end;

function TAcaoRemessa.getDsChave: string;
begin
  Result := self.dsChave;
end;

procedure TAcaoRemessa.setCdAcao(cdAcao: integer);
begin
  self.cdAcao := cdAcao;
end;

procedure TAcaoRemessa.setDsAcao(dsAcao: string);
begin
  self.dsAcao := dsAcao;
end;

procedure TAcaoRemessa.setDsChave(dsChave: string);
begin
  self.dsChave := dsChave;
end;

{ TStatusNN }

function TStatusNN.getCdEnvioBase: integer;
begin
  Result := self.cdEnvioBase;
end;

function TStatusNN.getCdEnvioRegistro: integer;
begin
  Result := self.cdEnvioRegistro;
end;

function TStatusNN.getCdLayout: integer;
begin
  Result := self.cdLayout;
end;

function TStatusNN.getNrNossoNumero: string;
begin
  Result := self.nrNossoNumero;
end;

function TStatusNN.getTpSituacao: TSituacaoNN;
begin
  Result := self.tpSituacao;
end;

procedure TStatusNN.setCdEnvioBase(cdEnvioBase: integer);
begin
  self.cdEnvioBase := cdEnvioBase;
end;

procedure TStatusNN.setCdEnvioRegistro(cdEnvioRegistro: integer);
begin
  self.cdEnvioRegistro := cdEnvioRegistro;
end;

procedure TStatusNN.setCdLayout(cdLayout: integer);
begin
  self.cdLayout := cdLayout;
end;

procedure TStatusNN.setNrNossoNumero(nrNossoNumero: string);
begin
  self.nrNossoNumero := nrNossoNumero;
end;

procedure TStatusNN.setTpSituacao(tpSituacao: TSituacaoNN);
begin
  self.tpSituacao := tpSituacao;
end;

end.