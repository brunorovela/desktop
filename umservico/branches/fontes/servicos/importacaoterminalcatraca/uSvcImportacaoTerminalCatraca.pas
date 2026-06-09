unit uSvcImportacaoTerminalCatraca;

interface

uses
   SysUtils, uDMConexao, uSvcClasses, Classes, UZDataset, Contnrs, uCFuncString,
   uSvcImportacaoTerminalCatracaImpRegistro, mysql_api, Windows, DateUtils,
   Controls;

type
   { Um apelido para string para identificar logs de erro. }
   LogErro = string;

   TUMSvcImportacaoTerminalCatraca = class;

   { A classe TUMExecucao armazena todas as configurações e informações sobre a execução de um Agendamento }
   TUMExecucao = class(TObject)
   strict private
      FUMSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca;
      FICodigo: Integer;
      FDTHoraExecucao: TDateTime;
      FBExecutarImportacao: Boolean;
      FBEncerrarPeriodo: Boolean;
      FNomeArquivo: String;
  private
      procedure LogaExecucao( const sn_erro: Boolean; const me_erro: String; const me_arquivo: String = ''; const sn_encerramento: Boolean = False);
      procedure LogaExecucaoEncerramento( const sn_erro: Boolean; const me_erro: String );

      function ArquivoJaImportado(const me_arquivo: String): Boolean;

      procedure defineTipoPessoa(var oReg: TImpRegistro; PrimmePonto: Boolean);
      procedure verificaJaImportado(var oReg: TImpRegistro);
      procedure verificaCodigoEntrada(var oReg: TImpRegistro);
      procedure gravaLinhaArquivo(nomeArquivo,linha:String);
      procedure criaPasta(diretorioOriginal,diretorioPasta:String);
      procedure moverArquivo(pastaDestino:String;nomeOrigem,nomeDestino:PAnsiChar);
      function carregaArquivo(sNome: string):TStringList;
      function inLista(texto:String;lista:TStringList):Boolean;
   public
      constructor Create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca;
         const AICodigo: Integer; const ADTHoraExecucao: TDateTime; ABExecutarImportacao, ABEncerrarPeriodo: Boolean);
      destructor Destroy; override;

      function Executar: Boolean;
      function Importar: Boolean;
      function Encerrar: Boolean;

      property Codigo: Integer read FICodigo;
      property HoraExecucao: TDateTime read FDTHoraExecucao;
      property ExecutarImportacao: Boolean read FBExecutarImportacao;
      property EncerrarPeriodo: Boolean read FBEncerrarPeriodo;
      property NomeArquivo: String read FNomeArquivo write FNomeArquivo;
   end;

   { A classe TUMListaExecucao implementa uma lista de objetos específica para o
     tipo TUMRecado.
   }
   TUMListaExecucao = class(TObjectList)
   strict private
      function GetItem(Index: Integer): TUMExecucao;
      procedure SetItem(Index: Integer; AUMExecucao: TUMExecucao);
   public                          
      constructor Create;
      destructor Destroy; override;
      function Add(AUMExecucao: TUMExecucao): Integer;
      function Extract(Item: TUMExecucao): TUMExecucao;
      function Remove(AUMExecucao: TUMExecucao): Integer;
      function IndexOf(AUMExecucao: TUMExecucao): Integer;
      procedure Insert(Index: Integer; AUMExecucao: TUMExecucao);
      function First: TUMExecucao;
      function Last: TUMExecucao;
      property Items[Index: Integer]: TUMExecucao read GetItem write SetItem; default;
   end;

   { A classe TUMSvcImportacaoTerminalCatraca implementa a classe base de serviços do UNIMESTRE para
     importações dos arquivos de catracas para o UNIMESTRE, para preenchimento automático das importações do
     Terminal de Acessos.
   }
   TUMSvcImportacaoTerminalCatraca = class(TUMServiceDefault)
   strict private
      FUMConn: TUMConexao;
      FQyHorariosExecucao: TUMZReadOnlyQuery;
      FQyGetParametros: TUMZReadOnlyQuery;
      FQyGetHorarioAluno: TUMZReadOnlyQuery;
      FQyGetConfig: TUMZReadOnlyQuery;
      FQyGetTurmaMatricula: TUMZReadOnlyQuery;
      FQyInsOcorrencia: TUMZQuery;


      FUMListaExecucao: TUMListaExecucao;

      // Parâmetros
      FUMParametroDiretorio: String;
      FUMParametroModeloCatraca: String;
      FUMParametroCondicaoAcesso: String;
      FUMParametroUnidadeCompartilhamento: String;
      FUMParametroExecutar: Boolean;
      FUMParametroGerarSaidasComoEntradas: Boolean;

      function SecretariaTrabalha(): Boolean;

      function CarregaHorarioPendente: boolean;
      function GetParametro(const ds_variavel: String): String;

      function InsereAcesso(sCodPessoa: string; bSaida: Boolean; bFinalizado: Boolean; bEspecial: Boolean = False; dtData: TDateTime = 0; iCdEntrada: LongInt = 0; const ASAnoSemestre: string = ''):boolean;

      procedure AdicionaExecucao(const AICodigo: Integer;
         const ADTHoraExecucao: TDateTime; const AIExecutarImportacao, AIEncerrarPeriodo: Integer);


      function IsEntradaAtrasadaDataUnica(const ASCodAluno, ASAnoSemestre,LSTurma: string; dataAtual:TDateTime): boolean;
      function GetTurmaMatricula(const ASCodPessoa: string; var ASAnoSemestre: string): string;
      function RegistraOcorrencia(const AICodTipo, AICodProfessor: integer; const ASCodAluno, ASMsgOcorrencia, ASCodTurma, ASAnoSemestre, ASSQLConsulta: string): boolean;
      function SubstituiVariaveisMsg(const ASMsgOcorrencia, ASCodAluno, ASAnoSemestre, ASSQLConsulta: string; const AICodTipo: integer): string;
   public
      constructor Create;
      function ExecutarSQLFlagsConexao(sSQL: String; var sErro: String): Boolean;
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure stopProcessamento; override;
      procedure tentaReconectar;

      procedure GeraEntrada(var oReg: TImpRegistro);
      procedure GeraSaida(var oReg: TImpRegistro);

      function NowFromDB: TDateTime;

      property UMConn: TUMConexao read FUMConn;
      property ParametroDiretorio: string read FUMParametroDiretorio;
      property ParametroGerarSaidasComoEntradas: Boolean read FUMParametroGerarSaidasComoEntradas;
      property ModeloCatraca: string read FUMParametroModeloCatraca;
      property CondicaoAcesso: string read FUMParametroCondicaoAcesso;
      property UnidadeCompartilhamento: string read FUMParametroUnidadeCompartilhamento;
   end;

implementation

uses uSvcImportacaoTerminalCatracaImpCatracas, DB;

const
   // Tipos de catracas
   TIPO_CATRACA_MICRODIN = 'microdin';
   TIPO_CATRACA_INNERS = 'inners';
   TIPO_CATRACA_INNERS_NEW = 'innersNew';
   TIPO_CATRACA_FLEXPOINT = 'flexpoint';
   TIPO_CATRACA_FLEXPOINT_PESSOA = 'flexpoint_pessoa';
   TIPO_CATRACA_HENRY_LUMEN_CARD_2 = 'henry_lumen_card_2';
   TIPO_CATRACA_PRIMME_PONTO = 'PrimmePonto';

   // Converte INT para BOOL
   IntToBool: array[0..1] of boolean = (False, True);
   BoolToInt: array[False..True] of integer = (0, 1);

   // Nome parâmetros
   PARAMETRO_LISTA_DIRETORIOS          = 'ta_servico_diretorio';
   PARAMETRO_RODAR_SERVICO             = 'ta_rodar_servico_agendado';
   PARAMETRO_MODELO_IMPORTACAO         = 'ta_importa_modelo';
   PARAMETRO_CONDICAO_ACESSO           = 'ta_condicao_acesso';
   PARAMETRO_UNIDADE_COMPARTILHAMENTO  = 'ta_unidade_compartilhamento';
   PARAMETRO_SAIDAS_COMO_ENTRADAS      = 'ta_gerar_saidas_como_entradas';

   // Retorna os parâmetros do Terminal de Acesso
   SQL_GET_PARAMETROS =
      ' SELECT ' +
      '    ds_valor ' +
      ' FROM ' +
      '    parametros ' +
      ' WHERE ' +
      '    ds_variavel = :ds_variavel ';

   // SQL para resgatar se na data de hoje, a secretaria trabalha, se vazio, trabalha
   SQL_GET_CALENDARIO_SECRETARIA =
      ' SELECT sn_secretaria ' +
      ' FROM calendario ' +
      ' WHERE CONCAT( nr_ano, CONCAT( LPAD(nr_mes, 2, 0) ), CONCAT( LPAD(nr_dia, 2, 0) ) ) = DATE_FORMAT(NOW(), ''%Y%m%d'') ' +
      '       AND sn_secretaria = ''S'' ' +
      ' LIMIT 1 ';

   // SQL para resgatar o horário da próxima execução de importação de arquivos da catraca
   SQL_GET_HORARIO_EXECUCAO =
      ' SELECT ' +
      '    tia.cd_agendamento, ' +
      '    tia.hr_execucao, ' +
      '    tia.sn_executar_importacao, ' +
      '    tia.sn_encerrar_periodo ' +
      ' FROM ' +
      '    ta_importacao_agendamento tia ' +
      '    LEFT JOIN ta_importacao_logs til ON (til.cd_agendamento = tia.cd_agendamento AND ' +
      '       DATE_FORMAT(til.dt_log, ''%Y-%m-%d'') = DATE_FORMAT(NOW(), ''%Y-%m-%d'') ) ' +
      '    LEFT JOIN ta_importacao_agendamento tia2 ON ( ' +
      '       tia2.cd_agendamento = (SELECT cd_agendamento FROM ta_importacao_agendamento WHERE hr_execucao > tia.hr_execucao ORDER BY hr_execucao LIMIT 1) ' +
      '    ) ' +
      ' WHERE ' +
      '    TIME_FORMAT( tia.hr_execucao, ''%H:%i'' ) <= TIME_FORMAT( NOW(), ''%H:%i'' ) AND ' +
      '    ( TIME_FORMAT( tia2.hr_execucao, ''%H:%i'' ) > TIME_FORMAT( NOW(), ''%H:%i'' ) OR tia2.cd_agendamento IS NULL ) AND ' +
      '    til.cd_log IS NULL AND ' +
      '    ( tia.sn_executar_importacao = 1 OR tia.sn_encerrar_periodo = 1 ) ' +
      ' ORDER BY ' +
      '    tia.hr_execucao DESC ' +
      ' LIMIT 1 ';

   SQL_GET_HORARIO_ALUNO =
      ' SELECT '+
      '    t.horainicio, '+
      '    t.horafim, '+
      '    CURTIME() horaatual '+
      ' FROM '+
      '    matriculas m '+
      '       JOIN turmas t ON '+
      '          (m.turma = t.codigo) AND '+
      '          (m.anosemestre = t.anosemestre) '+
      '       JOIN situacao s ON '+
      '          (m.situacao = s.cd_situacao) '+
      ' WHERE '+
      '    m.codigoaluno = :codigoaluno AND '+
      '    m.anosemestre = :anosemestre AND '+
      '    s.cd_situacao_pai IN (0, 1, 2, 9, 10, 11, 14) ';

   SQL_GET_CONFIG =
      ' SELECT '+
      '    cd_configuracao, '+
      '    tx_ajuda, '+
      '    cor_msg_terminal, '+
      '    ds_msg_terminal, '+
      '    cd_tipo_ocorrencia, '+
      '    tx_msg_ocorrencia, '+
      '    tx_sql_ocorrencia, '+
      '    me_som_terminal, '+
      '    sn_envia_ocorrencia, '+
      '    sn_permite_ocorrencia '+
      ' FROM '+
      '    ta_configuracoes ';

   SQL_GET_TURMA_MATRICULA =
      ' SELECT '+
      '    m.turma, '+
      '    m.anosemestre '+
      ' FROM '+
      '    matriculas m '+
      '       JOIN pessoas p ON '+
      '          (p.cd_pessoa = m.codigoaluno) '+
      '       JOIN situacao s ON '+
      '          (s.cd_situacao = m.situacao) '+
      '       LEFT JOIN turmas t ON '+
      '          (t.anosemestre = m.anosemestre) AND '+
      '          (t.curso = m.curso) AND '+
      '          (t.codigo = m.turma) '+
      '       LEFT JOIN cursos_coligadas c ON '+
      '          (c.cd_curso = t.curso) AND '+
      '          (c.cd_coligada = t.cd_coligada) '+
      ' WHERE '+
      '    m.codigoaluno = :CODIGOALUNO AND '+
      '    s.cd_situacao_pai IN (1, 2) %s '+
      ' ORDER BY '+
      '    CASE '+
      '       WHEN CURTIME() >= TIME(t.horainicio) AND CURTIME() <= TIME(t.horafim) THEN 2 '+
      '       WHEN CURTIME() <= TIME(t.horainicio) THEN 1 '+
      '       ELSE 0 END DESC,  '+
      '    m.anosemestre DESC ';

   SQL_INSERIR_OCORRENCIA =
      ' INSERT INTO ocorrencias '+
      '    (cd_tipo, cd_pessoa, ds_ocorrencia, turmamat, nr_anosemestre, sn_liberado, cd_professor, dt_registro, dt_lancamento) '+
      ' VALUES '+
      '    (:cd_tipo, :cd_pessoa, :ds_ocorrencia, :turmamat, :nr_anosemestre, "S", :cd_professor, NOW(), NOW()) ';

   // SQL que irá inserir os logs das execuções
   SQL_INSERE_LOG_EXECUCAO =
      ' INSERT INTO ta_importacao_logs ( ' +
      '    cd_agendamento, dt_log, sn_erro, me_erro, me_arquivo, nm_arquivo, ds_md5_arquivo, sn_encerramento ' +
      ' ) VALUES ( ' +
      '    :cd_agendamento, NOW(), :sn_erro, :me_erro, :me_arquivo, :nm_arquivo, ' +
      '    CASE WHEN LENGTH(TRIM(:me_arquivo)) > 0 THEN MD5(:me_arquivo) ELSE NULL END, :sn_encerramento ' +
      ' ) '; 

   LOG_LINHA_NOVA = #13 + #9;

   LOG_ERRO = LOG_LINHA_NOVA + 'Erro : %s';

   LOG_ERRO_DIRETORIOS_NAO_CONFIGURADOS =
      '[O parâmetro "' + PARAMETRO_LISTA_DIRETORIOS + '", que informa os diretórios a serem verificados para importação, não foi preenchido.]';

   LOG_ERRO_DIRETORIO_NAO_EXISTE =
      '[O %sº diretório configurado "%s" não existe.]';

   LOG_ERRO_CONEXAO =
      '[Não foi possível estabelecer conexão com o banco de dados]' + LOG_ERRO;

   LOG_ERRO_GET_HORARIOS_EXECUCAO =
      '[Ocorreu um erro na tentativa de resgatar as informações de horários de execução na base de dados]' + LOG_ERRO;

   LOG_ERRO_GET_PARAMETROS =
      '[Ocorreu um erro na tentativa de resgatar o parâmetro %s na base de dados]' + LOG_ERRO;

   LOG_ERRO_INSERIR_ACESSO =
      '[Ocorreu um erro na tentativa de inserir acesso ao aluno: %s]' + LOG_ERRO + LOG_LINHA_NOVA + 'Comando: %s';

   LOG_ERRO_GERAR_SAIDA =
      '[Ocorreu um erro na tentativa de registar a saída ao aluno: %s]' + LOG_ERRO;

   LOG_ERRO_VERIFICACAO_SECRETARIA =
      '[Ocorreu um erro na tentativa de verificar se a secretaria trabalha hoje]' + LOG_ERRO;

   LOG_ERRO_CONEXAO_VIA_REDE =
      '[Ocorreu um erro na tentativa de conexão com uma pasta compartilhada via rede]' + LOG_LINHA_NOVA + 'Pasta: %s' + LOG_ERRO;

   LOG_ERRO_ENCERRAR_PERIODO =
      '[Ocorreu um erro na tentativa de encerrar o período]' + LOG_ERRO;

   LOG_INFORMACOES_IMPORTACAO_ARQUIVO =
      '[ -------------|* UNIMESTRE *|------------- ]' + LOG_LINHA_NOVA +
      '     Relatório: ' + LOG_LINHA_NOVA + LOG_LINHA_NOVA +
      '     Entradas: %s ' + LOG_LINHA_NOVA +
      '       Saidas: %s ' + LOG_LINHA_NOVA +
      '    Ignorados: %s ' + LOG_LINHA_NOVA +
      '        Total: %s ' + LOG_LINHA_NOVA +
      '[ ----------------------------------------- ]';

   LOG_IMPORTACAO_PASTA_VAZIA =
      '[A pasta "%s" está vazia, nenhum arquivo para ser importado]';

{ TUMSvcImportacaoTerminalCatraca }

procedure TUMSvcImportacaoTerminalCatraca.AdicionaExecucao(const AICodigo: Integer;
  const ADTHoraExecucao: TDateTime; const AIExecutarImportacao, AIEncerrarPeriodo: Integer);
var
   I: integer;
   LBAchou: boolean;
begin
   LBAchou := false;
   for I := 0 to Self.FUMListaExecucao.Count - 1 do
   begin
      if Self.FUMListaExecucao.Items[I].Codigo = AICodigo then
      begin
         LBAchou := true;
         Break;
      end;
   end;

   if not LBAchou then
      Self.FUMListaExecucao.Add( TUMExecucao.Create(
         Self, AICodigo, ADTHoraExecucao,
         (AIExecutarImportacao = 1), (AIEncerrarPeriodo = 1)
      ) );
end;

function TUMSvcImportacaoTerminalCatraca.CarregaHorarioPendente: boolean;
begin
   Result := True;

   try
      try
         // tenta resgatar os horários de execução da base de dados
         Self.FQyHorariosExecucao.Close;
         Self.FQyHorariosExecucao.Open;
      except
         on E: Exception do
         begin
            Result := False;
            Self.Log.log(Format(LOG_ERRO_GET_HORARIOS_EXECUCAO, [E.Message]));

            self.tentaReconectar;
         end;
      end;

      // De momento insere somente o último serviço que deve ser executado,
      // mas o sistema já está preparado em partes para executar mais de um agendamento
      Self.FUMListaExecucao.Clear();
      if ( Self.FQyHorariosExecucao.RecordCount > 0 ) then
      begin
         Self.AdicionaExecucao(
            Self.FQyHorariosExecucao.FieldByName('cd_agendamento').AsInteger,
            Self.FQyHorariosExecucao.FieldByName('hr_execucao').AsDateTime,
            Self.FQyHorariosExecucao.FieldByName('sn_executar_importacao').AsInteger,
            Self.FQyHorariosExecucao.FieldByName('sn_encerrar_periodo').AsInteger
         );
      end;
   finally
      Self.FQyHorariosExecucao.Close;
   end;
end;

constructor TUMSvcImportacaoTerminalCatraca.Create;
begin
   inherited;
end;

procedure TUMSvcImportacaoTerminalCatraca.GeraEntrada(var oReg: TImpRegistro);
var
   LITipoAcao: integer;
   LSMensagem, codTurma: string;
   anoSemInterno: String;
   inseriuAcesso : Boolean;
begin
   anoSemInterno := oReg.Anosemestre;

   inseriuAcesso := Self.InsereAcesso(IntToStr(oReg.Codigo), False, False,
      oReg.PessoaTipo <> iptAluno, oReg.Data, 0, anoSemInterno);

   oReg.Invalido :=  not inseriuAcesso;

   if IsEntradaAtrasadaDataUnica(IntToStr(oReg.Codigo), anoSemInterno, '', oReg.Data) then
   begin
      if(Self.FQyGetConfig.State in [dsInactive]) then
      begin
         Self.FQyGetConfig.Close;
         Self.FQyGetConfig.Open;
      end;
      Self.FQyGetConfig.Locate('cd_configuracao', 1, []);

      if (Self.FQyGetConfig.FieldByName('sn_permite_ocorrencia').AsInteger = 1) and
         (Self.FQyGetConfig.FieldByName('sn_envia_ocorrencia').AsInteger = 1) then
      begin

         codTurma := GetTurmaMatricula(IntToStr(oReg.Codigo), anoSemInterno);

         RegistraOcorrencia(
            Self.FQyGetConfig.FieldByName('cd_tipo_ocorrencia').AsInteger,
            0, IntToStr(oReg.Codigo), Self.FQyGetConfig.FieldByName('tx_msg_ocorrencia').AsString,
            codTurma, anoSemInterno, Self.FQyGetConfig.FieldByName('tx_sql_ocorrencia').AsString); 
      end;      
   end;
end;

procedure TUMSvcImportacaoTerminalCatraca.GeraSaida(var oReg: TImpRegistro);
var
  qyExecuteProcedure: TUMZQuery;
begin
   if Self.ParametroGerarSaidasComoEntradas then
   begin
      Self.GeraEntrada(oReg);
      Exit;
   end;

   try
      try
         qyExecuteProcedure := Self.FUMConn.newQuery;
         qyExecuteProcedure.SQL.Clear();
         qyExecuteProcedure.SQL.Add( 'CALL TA_GERAR_SAIDA( :cd_pessoa, :dt_entrada, :cd_entrada, :sn_especial, ' );
         qyExecuteProcedure.SQL.Add( '                     :dt_saida, :nr_anosemestre,1, NULL )' );
         qyExecuteProcedure.ParamByName('cd_pessoa').AsInteger := oReg.Codigo;
         qyExecuteProcedure.ParamByName('dt_entrada').AsDateTime := oReg.DataEntrada;
         qyExecuteProcedure.ParamByName('cd_entrada').AsInteger := oReg.CodigoEntrada;
         qyExecuteProcedure.ParamByName('sn_especial').AsInteger := BoolToInt[oReg.PessoaTipo <> iptAluno];
         qyExecuteProcedure.ParamByName('dt_saida').AsDateTime := oReg.Data;
         qyExecuteProcedure.ParamByName('nr_anosemestre').AsString := oReg.AnoSemestre;

         qyExecuteProcedure.ExecSQL();
      except
         on E: Exception do
         begin
            oReg.Invalido := true;
            Self.Log.log( Format( LOG_ERRO_GERAR_SAIDA, [IntToStr(oReg.Codigo), E.Message] ) );
            self.tentaReconectar;
         end;
      end;
   finally
      FreeAndNil(qyExecuteProcedure);
   end;
end;

function TUMSvcImportacaoTerminalCatraca.GetParametro(const ds_variavel: String): String;
begin
   Result := '';

   try
      try
         Self.FQyGetParametros.ParamByName('ds_variavel').AsString := ds_variavel;
         Self.FQyGetParametros.Open();
      except
         on E: Exception do
         begin
            Self.Log.log(Format(LOG_ERRO_GET_PARAMETROS, [ds_variavel, E.Message]));
            self.tentaReconectar;
         end;
      end;

      Result := Self.FQyGetParametros.FieldByName('ds_valor').AsString;
   finally
      Self.FQyGetParametros.Close;
   end;
end;

function TUMSvcImportacaoTerminalCatraca.GetTurmaMatricula(
  const ASCodPessoa: string; var ASAnoSemestre: string): string;
var
   LSCondicao, LSQL: string;
begin
   LSQL := FQyGetTurmaMatricula.SQL.Text;
   LSCondicao := getParametro('ta_condicao_acesso');
   if Trim(LSCondicao) <> '' then
   begin
      LSCondicao := Format(' AND (%s) ', [LSCondicao]);
   end;
   FQyGetTurmaMatricula.SQL.Text := Format(LSQL, [LSCondicao]);

   FQyGetTurmaMatricula.ParamByName('codigoaluno').AsString := ASCodPessoa;
   try
      FQyGetTurmaMatricula.Open;
      if not FQyGetTurmaMatricula.IsEmpty then
      begin
         Result := FQyGetTurmaMatricula.FieldByName('turma').AsString;
         ASAnoSemestre := FQyGetTurmaMatricula.FieldByName('anosemestre').AsString;
      end;
   finally
      FQyGetTurmaMatricula.Close;
      FQyGetTurmaMatricula.SQL.Text := LSQL;
   end;

end;

function TUMSvcImportacaoTerminalCatraca.InsereAcesso(sCodPessoa: string; bSaida, bFinalizado,
  bEspecial: Boolean; dtData: TDateTime; iCdEntrada: Integer; const ASAnoSemestre: string):boolean;
var
   qyExecuteProcedure: TUMZQuery;
   sSQLInserirAcesso, sErro: String;
   sSaida, sFinalizado, sEspecial, sData: String;
   ConfiguracaoData: TFormatSettings;
begin
   result := true;
   sSaida := '0';
   if bSaida then
   begin
      sSaida := '1';
   end;

   sFinalizado := '0';
   if bFinalizado then
   begin
      sFinalizado := '1';
   end;

   sEspecial := '0';
   if bEspecial then
   begin
      sEspecial := '1';
   end;

   // Define a configuração de data
   GetLocaleFormatSettings(GetUserDefaultLCID, ConfiguracaoData);
   ConfiguracaoData.DateSeparator := '-';
   ConfiguracaoData.TimeSeparator := ':';
   ConfiguracaoData.ShortDateFormat := 'yyyy-mm-dd';
   ConfiguracaoData.ShortTimeFormat := 'hh:nn:ss';

   sData := QuotedStr(DateTimeToStr(dtData, ConfiguracaoData));

   sSQLInserirAcesso := 'CALL TA_INSERE_ACESSO( '+sCodPessoa+', '+sSaida+', '+sFinalizado+', '+sEspecial+', '+sData+', '+IntToStr(iCdEntrada)+', '+ASAnoSemestre+', 1, null )';

   sErro := '';
   if not ExecutarSQLFlagsConexao(sSQLInserirAcesso, sErro) then
   begin
      Self.Log.log( Format( LOG_ERRO_INSERIR_ACESSO, [sCodPessoa, sErro, sSQLInserirAcesso] ) );

      // Tenta utilizar outro meio de conexão antes de emitir o erro
      try
         try
            qyExecuteProcedure := Self.FUMConn.newQuery;

            qyExecuteProcedure.SQL.Clear();
            qyExecuteProcedure.SQL.Add( ' CALL TA_INSERE_ACESSO( :CD_PESSOA, :SN_SAIDA, :SN_FINALIZADO, ' );
            qyExecuteProcedure.SQL.Add( '                        :SN_ESPECIAL, :DATA, :CD_ENTRADA, :NR_ANOSEMESTRE, 1, null ) ' );

            qyExecuteProcedure.ParamByName('CD_PESSOA').AsString := sCodPessoa;

            if bSaida then
               qyExecuteProcedure.ParamByName('SN_SAIDA').AsInteger := 1
            else
               qyExecuteProcedure.ParamByName('SN_SAIDA').AsInteger := 0;
            if bFinalizado then
               qyExecuteProcedure.ParamByName('SN_FINALIZADO').AsInteger := 1
            else
               qyExecuteProcedure.ParamByName('SN_FINALIZADO').AsInteger := 0;
            if bEspecial then
               qyExecuteProcedure.ParamByName('SN_ESPECIAL').AsInteger := 1
            else
               qyExecuteProcedure.ParamByName('SN_ESPECIAL').AsInteger := 0;

            qyExecuteProcedure.ParamByName('DATA').AsDateTime := dtData;
            qyExecuteProcedure.ParamByName('CD_ENTRADA').AsInteger := iCdEntrada;
            qyExecuteProcedure.ParamByName('NR_ANOSEMESTRE').AsString := ASAnoSemestre;

            qyExecuteProcedure.ExecSQL();

         except
            on E: Exception do
            begin
               Self.Log.log( Format( LOG_ERRO_INSERIR_ACESSO, [sCodPessoa, E.Message, sSQLInserirAcesso] ) );
               result := false;
               self.tentaReconectar;
            end;
         end;
      finally
         FreeAndNil(qyExecuteProcedure);
      end;
   end;

end;

function TUMSvcImportacaoTerminalCatraca.IsEntradaAtrasadaDataUnica(
  const ASCodAluno, ASAnoSemestre, LSTurma: string;
  dataAtual: TDateTime): boolean;
var
   LTHoraAtual, LTHoraInicio, LTHoraFim: TTime;
   LITempoTol: integer;
   LSTempoTol: string;
begin
   Result := false;
   LSTempoTol := Trim(GetParametro('ta_tempo_tolerancia'));
   try
      LITempoTol := StrToInt(LSTempoTol);
   except
      on E: EConvertError do LITempoTol := 0;
   end;
   Self.FQyGetHorarioAluno.Close;

   Self.FQyGetHorarioAluno.ParamByName('codigoaluno').AsString := ASCodAluno;
   Self.FQyGetHorarioAluno.ParamByName('anosemestre').AsString := ASAnoSemestre;
   try
      Self.FQyGetHorarioAluno.Open;
      if not Self.FQyGetHorarioAluno.IsEmpty then
      begin
         LTHoraFim := Self.FQyGetHorarioAluno.FieldByName('horafim').AsDateTime;
         LTHoraInicio := Self.FQyGetHorarioAluno.FieldByName('horainicio').AsDateTime;
         LTHoraInicio := IncMinute(LTHoraInicio, LITempoTol);
         Result :=
            (TimeOf(dataAtual) > TimeOf(LTHoraInicio)) and
            (TimeOf(dataAtual) < TimeOf(LTHoraFim));
      end;
   finally
      Self.FQyHorariosExecucao.Close;
   end;
end;

function TUMSvcImportacaoTerminalCatraca.NowFromDB: TDateTime;
var
   qyNowFromDB: TUMZReadOnlyQuery;
begin
   try
      qyNowFromDB := Self.FUMConn.newROQuery;
      qyNowFromDB.SQL.Text := ' SELECT NOW() AS agora FROM dual ';
      qyNowFromDB.Open();
      Result := qyNowFromDB.FieldByName('agora').AsDateTime;
      FreeAndNil( qyNowFromDB );
   except
      on E: Exception do
      begin
         Self.Log.log(Format(LOG_ERRO_GET_HORARIOS_EXECUCAO, [E.Message]));
         self.tentaReconectar;
      end;
   end;
end;

procedure TUMSvcImportacaoTerminalCatraca.onLoadServico;
begin
   // tenta estabelecer conexão com o banco de dados
   Self.FUMConn := TUMConexao.Create;
   if not Self.FUMConn.Conectar(Self.Config, 'Conexao', false) then
   begin
      Self.Log.log(Format(LOG_ERRO_CONEXAO, [Self.FUMConn.LastErro]));
      Self.FUMParametroExecutar := False;
   end else begin
      // Lista de Execuções
      Self.FUMListaExecucao := TUMListaExecucao.Create;

      // Carrega querys
      Self.FQyHorariosExecucao := Self.FUMConn.newROQuery;
      Self.FQyGetParametros := Self.FUMConn.newROQuery;
      Self.FQyGetHorarioAluno := Self.FUMConn.newROQuery;
      Self.FQyGetConfig := Self.FUMConn.newROQuery;
      Self.FQyGetTurmaMatricula := Self.FUMConn.newROQuery;
      Self.FQyInsOcorrencia := Self.FUMConn.newQuery;

      Self.FQyHorariosExecucao.ParamCheck := False;
      Self.FQyGetParametros.ParamCheck := True;

      Self.FQyHorariosExecucao.SQL.Text := SQL_GET_HORARIO_EXECUCAO;
      Self.FQyGetParametros.SQL.Text := SQL_GET_PARAMETROS;
      Self.FQyGetHorarioAluno.SQL.Text := SQL_GET_HORARIO_ALUNO;
      Self.FQyGetConfig.SQL.Text := SQL_GET_CONFIG;
      Self.FQyGetTurmaMatricula.SQL.Text := SQL_GET_TURMA_MATRICULA;
      Self.FQyInsOcorrencia.SQL.Text := SQL_INSERIR_OCORRENCIA;

      // Abre a query de configurações do terminal
      Self.FQyGetConfig.Open;

      // Carrega valor do parâmetros
      Self.FUMParametroDiretorio := Self.GetParametro(PARAMETRO_LISTA_DIRETORIOS);
      Self.FUMParametroModeloCatraca := Self.GetParametro(PARAMETRO_MODELO_IMPORTACAO);
      Self.FUMParametroCondicaoAcesso := Self.GetParametro(PARAMETRO_CONDICAO_ACESSO);
      Self.FUMParametroExecutar := IntToBool[StrToIntDef( Self.GetParametro(PARAMETRO_RODAR_SERVICO), 0 )];
      Self.FUMParametroUnidadeCompartilhamento := Self.GetParametro(PARAMETRO_UNIDADE_COMPARTILHAMENTO);
      Self.FUMParametroGerarSaidasComoEntradas := IntToBool[StrToIntDef(Self.GetParametro(PARAMETRO_SAIDAS_COMO_ENTRADAS), 0)];
   end;
end;

procedure TUMSvcImportacaoTerminalCatraca.onUnloadServico;
begin
   if Self.FUMConn.Conn.Connected then
      Self.FUMConn.Conn.Disconnect;

   Self.FUMConn.Free;
end;

{ funcao que procura tentar reconectar }
procedure TUMSvcImportacaoTerminalCatraca.tentaReconectar;
begin

   Self.FUMConn.Conn.Disconnect;
   Self.FUMConn.Conn.Reconnect;
   Self.FUMConn.Conn.Connect;

   Self.Log.log(
      'Tentando reconectar --> ' + #13 + Self.Config.FileName + #13 +
      self.Config.ReadString( 'Conexao', 'banco', ''), true );
end;



function TUMSvcImportacaoTerminalCatraca.processa: IUMServiceAppRet;
var
   i: integer;
begin
   Result := srSuccess;

   if Self.FUMParametroExecutar AND Self.SecretariaTrabalha then
   begin
      Self.CarregaHorarioPendente;

      for I := 0 to Self.FUMListaExecucao.Count - 1 do
      begin
         if ( not Self.FUMListaExecucao.Items[I].Executar ) then
            Result := srError;
      end;
   end;
end;

function TUMSvcImportacaoTerminalCatraca.RegistraOcorrencia(const AICodTipo,
  AICodProfessor: integer; const ASCodAluno, ASMsgOcorrencia, ASCodTurma,
  ASAnoSemestre, ASSQLConsulta: string): boolean;
var
   LSMsgOcorrencia: string;
begin
   Result := true;
   LSMsgOcorrencia := SubstituiVariaveisMsg(ASMsgOcorrencia, ASCodAluno, ASAnoSemestre, ASSQLConsulta, AICodTipo);
   Self.FQyInsOcorrencia.Close;
   Self.FQyInsOcorrencia.ParamByName('cd_tipo').AsInteger := AICodTipo;
   Self.FQyInsOcorrencia.ParamByName('cd_pessoa').AsString := ASCodAluno;
   Self.FQyInsOcorrencia.ParamByName('ds_ocorrencia').AsString := LSMsgOcorrencia;
   Self.FQyInsOcorrencia.ParamByName('turmamat').AsString := ASCodTurma;
   Self.FQyInsOcorrencia.ParamByName('nr_anosemestre').AsString := ASAnoSemestre;
   Self.FQyInsOcorrencia.ParamByName('cd_professor').AsInteger := AICodProfessor;
   try
      Self.FQyInsOcorrencia.ExecSQL;
   except
      on E: Exception do
         Result := false;
   end;
end;

function TUMSvcImportacaoTerminalCatraca.SecretariaTrabalha: Boolean;
var
   qyVerificaSecretariaTrabalha: TUMZReadOnlyQuery;
begin
   qyVerificaSecretariaTrabalha := Self.FUMConn.newROQuery;
   qyVerificaSecretariaTrabalha.SQL.Text := SQL_GET_CALENDARIO_SECRETARIA;

   Result := False;
   try
      try
         qyVerificaSecretariaTrabalha.Open();

         Result := ( qyVerificaSecretariaTrabalha.IsEmpty ) OR
                   ( qyVerificaSecretariaTrabalha.FieldByName('sn_secretaria').AsString = 'S' );
      except
         on E: Exception do
         begin
            Self.Log.log( Format( LOG_ERRO_VERIFICACAO_SECRETARIA, [E.Message] ) );
            self.tentaReconectar;
         end;
      end;
   finally
      FreeAndNil( qyVerificaSecretariaTrabalha );
   end;
end;

procedure TUMSvcImportacaoTerminalCatraca.stopProcessamento;
begin
   inherited;
end;

function TUMSvcImportacaoTerminalCatraca.SubstituiVariaveisMsg(
  const ASMsgOcorrencia, ASCodAluno, ASAnoSemestre, ASSQLConsulta: string;
  const AICodTipo: integer): string;
var
   LInd: integer;
   LFCampo: TField;
   LQyConsulta: TUMZReadOnlyQuery;
begin
   LQyConsulta := Self.FUMConn.newROQuery;
   try
      LQyConsulta.ParamCheck := true;
      LQyConsulta.SQL.Text := ASSQLConsulta;
      LQyConsulta.ParamByName('anosemestre').AsString := ASAnoSemestre;
      LQyConsulta.ParamByName('codigoaluno').AsString := ASCodAluno;
      LQyConsulta.ParamByName('cd_tipo').AsInteger := AICodTipo;
      try
         LQyConsulta.Open;
         if not LQyConsulta.IsEmpty then
         begin
            Result := ASMsgOcorrencia;
            for LInd := 0 to LQyConsulta.FieldCount - 1 do
            begin
               LFCampo := LQyConsulta.Fields[LInd];
               try
                  Result := StringReplace(Result, '{' + LFCampo.FieldName + '}', LFCampo.AsString, [rfReplaceAll]);
               finally
                  LFCampo := nil;
               end;
            end;
         end;
      except
         on Exception do raise;
      end;
   finally
      LQyConsulta.Close;
      FreeAndNil(LQyConsulta);
   end;
end;

{ TUMListaExecucao }

function TUMListaExecucao.Add(AUMExecucao: TUMExecucao): Integer;
begin
   Result := inherited Add(AUMExecucao);
end;

constructor TUMListaExecucao.Create;
begin
   inherited;
end;

destructor TUMListaExecucao.Destroy;
var
   i: integer;
begin
   for i := Self.Count - 1 downto 0 do
   begin
      Self.Items[i].Free;
   end;
   inherited;
end;

function TUMListaExecucao.Extract(Item: TUMExecucao): TUMExecucao;
begin
   Result := TUMExecucao(inherited Extract(Item));
end;

function TUMListaExecucao.First: TUMExecucao;
begin
   Result := TUMExecucao(inherited First);
end;

function TUMListaExecucao.GetItem(Index: Integer): TUMExecucao;
begin
   Result := TUMExecucao(inherited GetItem(Index));
end;

function TUMListaExecucao.IndexOf(AUMExecucao: TUMExecucao): Integer;
begin
   Result := inherited IndexOf(AUMExecucao);
end;

procedure TUMListaExecucao.Insert(Index: Integer; AUMExecucao: TUMExecucao);
begin
   inherited Insert(Index, AUMExecucao);
end;

function TUMListaExecucao.Last: TUMExecucao;
begin
   Result := TUMExecucao(inherited Last);
end;

function TUMListaExecucao.Remove(AUMExecucao: TUMExecucao): Integer;
begin
   Result := inherited Remove(AUMExecucao);
end;

procedure TUMListaExecucao.SetItem(Index: Integer; AUMExecucao: TUMExecucao);
begin
   inherited SetItem(Index, AUMExecucao);
end;

{ TUMExecucao }

function TUMExecucao.ArquivoJaImportado(const me_arquivo: String): Boolean;
const
   SQL_ARQUIVO_JA_IMPORTADO =
      ' SELECT cd_log FROM ta_importacao_logs ' +
      ' WHERE ds_md5_arquivo = md5(:me_arquivo) AND sn_erro = 0 ';
var
   qyArquivoJaImportado: TUMZReadOnlyQuery;
begin
   qyArquivoJaImportado := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newROQuery;
   Result := False;

   try
      try
         qyArquivoJaImportado.SQL.Text := SQL_ARQUIVO_JA_IMPORTADO;
         qyArquivoJaImportado.ParamByName('me_arquivo').AsString := me_arquivo;
         qyArquivoJaImportado.Open();

         if not qyArquivoJaImportado.IsEmpty then
            Result := True;         
      except
         // Se ocorrer erro, dizemos que o arquivo já foi importado, para não ocorrer erro de re-importação
         Result := True;
      end;
   finally
      FreeAndNil(qyArquivoJaImportado);
   end;
end;



function TUMExecucao.carregaArquivo(sNome: string): TStringList;
var
   linhasArquivo : TStringList;
   linhasConteudo : TStringList;
   i:integer;
begin
   if not FileExists(sNome) then
   begin
      result := nil;
      exit;
   end;
   linhasArquivo  := TStringList.Create();
   linhasConteudo := TStringList.Create();
   linhasArquivo.LoadFromFile(sNome);

   for I := 0 to linhasArquivo.Count - 1 do
   begin
      linhasConteudo.Values[linhasArquivo.Strings[i]] := linhasArquivo.Strings[i]; 
   end;

   result := linhasConteudo;
end;

constructor TUMExecucao.Create(AUSvcImportacaoTerminalCatraca: TUMSvcImportacaoTerminalCatraca;
  const AICodigo: Integer; const ADTHoraExecucao: TDateTime; ABExecutarImportacao,
  ABEncerrarPeriodo: Boolean);
begin
   Self.FUMSvcImportacaoTerminalCatraca := AUSvcImportacaoTerminalCatraca;
   Self.FICodigo := AICodigo;
   Self.FDTHoraExecucao := ADTHoraExecucao;
   Self.FBExecutarImportacao := ABExecutarImportacao;
   Self.FBEncerrarPeriodo := ABEncerrarPeriodo;
end;

procedure TUMExecucao.criaPasta(diretorioOriginal, diretorioPasta: String);
begin
   if not DirectoryExists( diretorioPasta ) then
   begin
      if not CreateDir( diretorioPasta ) then
      begin
         Self.LogaExecucao( True, 'Não foi possível criar a pasta: ' + diretorioPasta +' no diretório: ' + diretorioOriginal );
      end;
   end;
end;

procedure TUMExecucao.defineTipoPessoa(var oReg: TImpRegistro; PrimmePonto: Boolean);
CONST
   SQL_verifica_sistema = '   ' +
   ' SELECT                   ' +
   '   cd_sistema             ' +
   ' FROM                     ' +
   '   nu_integracao_externa  ' +
   ' WHERE                    ' +
   '   UPPER(ds_chave) = UPPER("carteirinha")';

   SQL_verifica_aluno = ''+
   '  SELECT                                                 '+
   '	   p.cd_pessoa, p.nm_pessoa, m.anosemestre             '+
   'FROM                                                     '+
   '   matriculas m                                          '+
   '   INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) '+
   '   INNER JOIN turmas t ON ( t.anosemestre = m.anosemestre AND t.curso = m.curso AND t.codigo = m.turma ) '+
   '   INNER JOIN cursos_coligadas c ON (m.curso = c.cd_curso AND c.cd_coligada = t.cd_coligada) '+
   'WHERE                                                    ';

   SQL_verifica_pessoa_professor = ''+
   'SELECT                                                     ' +
   '	   p.cd_pessoa, p.nm_pessoa,                             ' +
   '     pr.cd_pessoa as professor,                            ' +
   '     pr.sn_funcionario as funcionario                      ' +
   '  FROM                                                     ' +
   '	   pessoas p                                             ' +
   '	   LEFT OUTER JOIN professores pr ON (pr.cd_pessoa = p.cd_pessoa) '+
   '  WHERE                                                    ';

   SQL_pessoas_integracao_externa = ''+
   'SELECT                                      '+
   '  pie.cd_pessoa, p.nm_pessoa                '+
   'FROM                                        '+
   '  pessoas_integracao_externa pie            '+
   '  INNER JOIN pessoas p ON                   '+
   '     (pie.cd_pessoa = p.cd_pessoa)          '+
   'WHERE                                       '+
   '  cd_pessoa_externa = :codigoPessoaArquivo  '+
   '  AND cd_sistema = :cd_sistema              ';
var
   sAux: string;
   qyVerifica: TUMZQuery;
   qySistemas: TUMZquery;
   cd_sistema: Integer;
begin
   try
      qyVerifica := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newQuery;

      //verifica se é aluno
      qyVerifica.SQL.Clear();
      qyVerifica.SQL.Add(''+
      '  SELECT                                                 '+
      '	   p.cd_pessoa, p.nm_pessoa, m.anosemestre              '+
      'FROM                                                     '+
      '   matriculas m                                          '+
      '   INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) '+
      '   INNER JOIN turmas t ON ( t.anosemestre = m.anosemestre AND t.curso = m.curso AND t.codigo = m.turma ) '+
      '   INNER JOIN cursos_coligadas c ON (m.curso = c.cd_curso AND c.cd_coligada = t.cd_coligada) '+
      'WHERE                                                    ');

      if ( oReg.UsaMatricula ) then
         qyVerifica.SQL.Add( '	   m.cd_matricula = ' + IntToStr(oReg.Codigo) )
      else
         qyVerifica.SQL.Add( '	   p.cd_pessoa = ' + IntToStr(oReg.Codigo) );

      sAux := Self.FUMSvcImportacaoTerminalCatraca.CondicaoAcesso;
      if (Length(sAux) > 0) then
      begin
        qyVerifica.SQL.Add(' AND (' + sAux + ') ');
      end;
      qyVerifica.SQL.Add(
      '  ORDER BY                                  '+
      '	   m.anosemestre DESC LIMIT 1             '
      );
      qyVerifica.Open();

      if not qyVerifica.IsEmpty then
      begin
         oReg.Invalido := False;
         oReg.Nome := qyVerifica.FieldByName('nm_pessoa').AsString;
         oReg.AnoSemestre := qyVerifica.FieldByName('anosemestre').AsString;
         oReg.Processado := True;
         oReg.PessoaTipo := iptAluno;
         qyVerifica.Close();

         FreeAndNil(qyVerifica);
         Exit;
      end;         

      //verifica se eh professor, funcionario
      qyVerifica.Close();
      qyVerifica.SQL.Clear();
      qyVerifica.SQL.Add(''+
      '  SELECT                                                  ' +
      '	   p.cd_pessoa, p.nm_pessoa,                            ' +
      '     pr.cd_pessoa as professor,                            ' +
      '     pr.sn_funcionario as funcionario                    '+
      '  FROM                                                    ' +
      '	   pessoas p                                            ' +
      '	   LEFT OUTER JOIN professores pr ON (pr.cd_pessoa = p.cd_pessoa) ');
      qyVerifica.SQL.Add(
      '  WHERE                    '  +
      '	   p.cd_pessoa = ' + IntToStr(oReg.Codigo) +
      '  GROUP BY                    '  +
      '	   p.cd_pessoa              ');
      qyVerifica.Open();

      if not(qyVerifica.IsEmpty) then
      begin
         oReg.Invalido := False;
         oReg.Nome := qyVerifica.FieldByName('nm_pessoa').AsString;
         oReg.Processado := True;
         if not (qyVerifica.FieldByName('professor').IsNull) then
         begin
            oReg.PessoaTipo := iptProfessor;
         end
         else if not (qyVerifica.FieldByName('funcionario').IsNull) then
         begin
            oReg.PessoaTipo := iptFuncionario;
         end
         else begin
            oReg.PessoaTipo := iptUnknown;
            oReg.Invalido := True;
            oReg.Nome := 'INDEFINIDO!!!';
         end;
      end;

      //Se for primmeponto e não achou a pessoa, busca ALUNO por login
      if ((PrimmePonto = True) and (oReg.Invalido = True)) then
      begin
         with qyVerifica do
         begin
            Close();
            SQL.Clear();
            Params.Clear();
            SQL.Add(SQL_verifica_aluno);

            //Se código for zero não filtra nada.
            if oReg.Codigo = 0 then
            begin
               SQL.Add( ' 1 = 2 ' );
            end
            else
            begin
               SQL.Add( '	   p.ds_login = ' + IntToStr(oReg.Codigo) );
            end;
         
            if (Length(sAux) > 0) then
            begin
               SQL.Add(' AND (' + sAux + ') ');
            end;
            SQL.Add(
            '  ORDER BY                                  '+
            '	   m.anosemestre DESC LIMIT 1             ');
         qyVerifica.Open();

         if not IsEmpty then
         begin
            oReg.Invalido := False;
            oReg.Nome := FieldByName('nm_pessoa').AsString;
            oReg.AnoSemestre := FieldByName('anosemestre').AsString;
            oReg.Processado := True;
            oReg.PessoaTipo := iptAluno;
            Close();

            Exit;
         end
         else
         begin

            {Se não achou buscando pelo login fazendo innerjoin com matriculas,
            tenta buscar como se fosse um funcionário}

            Close();
            SQL.Clear();
            Params.Clear();
            SQL.Add(SQL_verifica_pessoa_professor);

            if (oReg.Codigo = 0) then
            begin
               SQL.Add(' 1 = 2 ');
            end
            else
            begin
               SQL.Add(' p.ds_login = ' + IntToStr(oReg.Codigo));
            end;

            SQL.Add(' GROUP BY ');
            SQL.Add(' p.cd_pessoa ');
            
            qyVerifica.Open();

            if not IsEmpty then
            begin
               oReg.Invalido := False;
               oReg.Nome := FieldByName('nm_pessoa').AsString;
               oReg.Processado := True;
               if not (FieldByName('professor').IsNull) then
               begin
                  oReg.PessoaTipo := iptProfessor;
               end
               else if not (FieldByName('funcionario').IsNull) then
               begin
                  oReg.PessoaTipo := iptFuncionario;
               end
               else
               begin
                  oReg.PessoaTipo := iptUnknown;
                  oReg.Invalido := True;
                  oReg.Nome := 'INDEFINIDO!!!';
               end;

               Exit;

            end
            else
            begin

               {
               Se não achou pelo código da pessoa e não achou pelo login da
               pessoa como funcionário e alunos, verificamos se existe o código
               da pessoa em sistemas externos (com base nas informações das
               tabelas nu_integração_externa / pessoas_integracao_externa)
               }

               qySistemas := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newQuery;

               qySistemas.SQL.Text := SQL_verifica_sistema;
               qySistemas.Open();


               if not qySistemas.IsEmpty then
               begin
                  cd_sistema := qySistemas.FieldByName('cd_sistema').AsInteger;
                  qySistemas.Close;
                  qySistemas.Params.Clear;

                  qySistemas.SQL.Text := SQL_pessoas_integracao_externa;

                  qySistemas.ParamByName('codigoPessoaArquivo').AsInteger := oReg.Codigo;
                  qySistemas.ParamByName('cd_sistema').AsInteger := cd_sistema;

                  qySistemas.Open;

                  if not qySistemas.IsEmpty then
                  begin
                     oReg.Invalido := False;
                     oReg.Nome := qySistemas.FieldByName('nm_pessoa').AsString;
                     oReg.Processado := True;
                     oReg.PessoaTipo := iptUnknown;
                     qyVerifica.Close();

                     Exit;
                  end
                  else
                  begin
                     //Não achou a pessoa em todas buscas.
                     oReg.Invalido := True;
                     oReg.Nome := 'INVALIDO!!!';
                     oReg.Processado := True;
                     oReg.PessoaTipo := iptUnknown;
                     oReg.Importado := False;

                     Exit;
                  end;
               end
               else
               begin
                  //Não achou a pessoa em todas buscas.
                  oReg.Invalido := True;
                  oReg.Nome := 'INVALIDO!!!';
                  oReg.Processado := True;
                  oReg.PessoaTipo := iptUnknown;
                  oReg.Importado := False;

                  Exit;
               end;
            end;
         end;
      end;
   end;

      FreeAndNil(qyVerifica);
   except
      on E: Exception do
      begin

      end;
   end;

end;

destructor TUMExecucao.Destroy;
begin

  inherited;
end;

function TUMExecucao.Encerrar: Boolean;
const
   SQL_TA_ENCERRAR_PERIODO =
      ' CALL TA_ENCERRAR_PERIODO() ';
var
   sErro: String;
   qyExecutaProcedure: TUMZQuery;
begin
   Result := True;
   Self.LogaExecucaoEncerramento(False, '');

   sErro := '';
   if not FUMSvcImportacaoTerminalCatraca.ExecutarSQLFlagsConexao(SQL_TA_ENCERRAR_PERIODO, sErro) then
   begin
      Self.LogaExecucaoEncerramento( True, Format( LOG_ERRO_ENCERRAR_PERIODO, [sErro] ) );

      // Tenta utilizar outro meio de conexão antes de emitir o erro
      try
         try
            qyExecutaProcedure := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newQuery;
            qyExecutaProcedure.SQL.Text := SQL_TA_ENCERRAR_PERIODO;
            qyExecutaProcedure.ExecSQL;
         except
            on E: Exception do
            begin
               Self.FUMSvcImportacaoTerminalCatraca.Log.log(Format( LOG_ERRO_ENCERRAR_PERIODO, [E.Message] ));
               Self.LogaExecucaoEncerramento( True, Format( LOG_ERRO_ENCERRAR_PERIODO, [E.Message] ) );
               Result := False;
            end;
         end;
      finally
         FreeAndNil(qyExecutaProcedure);
      end;
   end;
end;

function TUMSvcImportacaoTerminalCatraca.ExecutarSQLFlagsConexao(sSQL: String; var sErro: String): Boolean;
var
   Conexao, ConexaoAux: mysql_api.PMYSQL;
   FlagsConexao: Integer;
begin
   Result := True;

   try
      ConexaoAux := mysql_api.mysql_init(nil);

      FlagsConexao := 0;
                                                     
      //if opRememberOptions   in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_REMEMBER_OPTIONS;
      //if opLongPassword      in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_LONG_PASSWORD;
      //if opFoundRows         in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_FOUND_ROWS;
      //if opLongFlag          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_LONG_FLAG;
      //if opConnectWithDb     in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_CONNECT_WITH_DB;
      //if opNoSchema          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_NO_SCHEMA;
      //if opCompress          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_COMPRESS;
      //if opODBC              in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_ODBC;
      //if opLocalFiles        in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_LOCAL_FILES;
      //if opIgnoreSpace       in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_IGNORE_SPACE;
      //if opProtocol41        in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_PROTOCOL_41;
      //if opInteractive       in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_INTERACTIVE;
      //if opSSL               in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_SSL;
      //if opIgnoreSigpipe     in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_IGNORE_SIGPIPE;
      //if opTransactions      in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_TRANSACTIONS;
      //if opReserved          in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_RESERVED;
      //if opSecureConnection  in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_SECURE_CONNECTION;
      //if opMultiStatements   in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_MULTI_STATEMENTS;
      //if opMultiResults      in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_MULTI_RESULTS;
      //if opRememberOptions   in FParameters then
         FlagsConexao := FlagsConexao + CLIENT_REMEMBER_OPTIONS;

      Conexao := mysql_api.mysql_real_connect(
         ConexaoAux,
         PAnsiChar(UTF8Encode(Self.UMConn.Conn.HostName)),
         PAnsiChar(UTF8Encode(Self.UMConn.Conn.User)),
         PAnsiChar(UTF8Encode(Self.UMConn.Conn.Password)),
         PAnsiChar(UTF8Encode(Self.UMConn.Conn.Database)),
         Self.UMConn.Conn.Port,
         PAnsiChar(Utf8Encode(Self.UMConn.Conn.HostName)),
         FlagsConexao
      );

      //mysql_api.mysql_select_db(Conexao, PAnsiChar(db.Database));
      mysql_api.mysql_query(Conexao, PAnsiChar(sSQL));

      if (mysql_api.mysql_errno(Conexao) > 0) then
      begin
         sErro := mysql_api.mysql_error(Conexao);

         Result := False;
      end;

   finally
      mysql_api.mysql_close(Conexao);
   end;

end;

function TUMExecucao.Executar: Boolean;
var
   erro: LogErro;
   resultImportar, resultEncerrar: Boolean;
begin
   Result := True;
   resultImportar := False;
   resultEncerrar := False;

   if Self.ExecutarImportacao then
      resultImportar := Self.Importar;

   if Self.EncerrarPeriodo then
      resultEncerrar := Self.Encerrar;

   Result := resultImportar AND resultEncerrar;
end;

procedure TUMExecucao.gravaLinhaArquivo(nomeArquivo,linha: String);
var
   arquivo: TextFile;
begin
    AssignFile(arquivo, nomeArquivo);
    if FileExists(nomeArquivo) then
    begin
      Append(arquivo);
    end else begin
      Rewrite(arquivo);
    end;
    Writeln(arquivo, linha);
    Flush(arquivo);
    CloseFile(arquivo);
end;

function TUMExecucao.Importar: Boolean;
var
   arrDiretorios,listaDadosParciais,listaDadosErros,AItems : TStringList;
   arquivo: IImpCatraca;
   oReg: TImpRegistro;
   I, J, Ret, iEntradas, iSaidas, iIgnorados: Integer;
   F: TSearchRec;
   PastaProcessando, pasta_processados, pasta_catraca, err_msg, erroFinal,
   pasta_parciais,pasta_erros, nomeArquivoData, nomeArquivoDataHora, SourcePath,
   TargetPath: String;
   fs: TFormatSettings;
   err: DWord;
   unidade_compartilhamento: PAnsiChar;
   isPastaCompartilhada, PrimmePonto: Boolean;
   dataAtual : TDateTime;
begin
   Result := True;

   // Formatação de Data
   GetLocaleFormatSettings(GetUserDefaultLCID, fs);
   fs.DateSeparator := '-';
   fs.TimeSeparator := '-';
   fs.ShortDateFormat := 'yyyy-mm-dd';
   fs.ShortTimeFormat := 'hh-nn-ss';

   //Verifica paramêtro "ta_servico_diretorio"
   if ( Length(Trim(FUMSvcImportacaoTerminalCatraca.ParametroDiretorio)) = 0 ) then
   begin
      //Paramêtro não preenchido, para a execução
      FUMSvcImportacaoTerminalCatraca.Log.log(LOG_ERRO_DIRETORIOS_NAO_CONFIGURADOS);
      Self.NomeArquivo := '';
      Self.LogaExecucao(True, LOG_ERRO_DIRETORIOS_NAO_CONFIGURADOS);
      Result := False;
      exit;
   end;

   arrDiretorios := TFuncString.splitString(FUMSvcImportacaoTerminalCatraca.ParametroDiretorio, ';');
   for I := 0 to arrDiretorios.Count - 1 do
   begin
      arrDiretorios[I] := trim(arrDiretorios[I]);
      pasta_catraca := arrDiretorios[I];
      isPastaCompartilhada := False;

      { Trata diretórios acessados via rede }
      if ( Copy( pasta_catraca, 1, 2 ) = '\\' ) then
      begin
         unidade_compartilhamento := PAnsiChar(Self.FUMSvcImportacaoTerminalCatraca.UnidadeCompartilhamento + ':');
         err := WNetAddConnection(PAnsiChar(pasta_catraca), '', unidade_compartilhamento);
         err_msg := '';

         case ERR of
            ERROR_ACCESS_DENIED : err_msg := 'Acesso negado.';
            ERROR_ALREADY_ASSIGNED : err_msg := 'A letra do drive especificada já está conectada.';
            ERROR_BAD_DEV_TYPE : err_msg := 'O tipo de dispositivo e o tipo de recurso não são compatíveis.';
            ERROR_BAD_DEVICE : err_msg := 'Letra inválida.';
            ERROR_BAD_NET_NAME : err_msg := 'Nome do servidor não é válido ou não pode ser localizado.';
            ERROR_BAD_PROFILE : err_msg := 'Formato incorreto de parâmetros.';
            ERROR_CANNOT_OPEN_PROFILE : err_msg := 'Conexão permanente não disponível.';
            ERROR_DEVICE_ALREADY_REMEMBERED : err_msg := 'Uma entrada para o dispositivo especificado já está no perfil do usuário.';
            ERROR_EXTENDED_ERROR : err_msg := 'Erro de rede.';
            ERROR_INVALID_PASSWORD : err_msg := 'Senha especificada inválida.';
            ERROR_NO_NET_OR_BAD_PATH : err_msg := 'A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.';
            ERROR_NO_NETWORK : err_msg := 'A rede não está presente.';
         else if Err > 0 then
            err_msg := 'Número do Erro: ' + IntToStr(Err);
         end;

         if err_msg <> '' then
         begin
            Self.LogaExecucao(True, Format( LOG_ERRO_CONEXAO_VIA_REDE, [pasta_catraca, err_msg] ));
            WNetCancelConnection(PAnsiChar(unidade_compartilhamento), True);
            Continue;
         end else begin
            pasta_catraca := unidade_compartilhamento;
            isPastaCompartilhada := True;
         end;
      end;

      //Não existe este diretório, registra erro e continua para o proximo
      if not(DirectoryExists( pasta_catraca )) then
      begin
         FUMSvcImportacaoTerminalCatraca.Log.log(
            Format(LOG_ERRO_DIRETORIO_NAO_EXISTE, [IntToStr(I+1), arrDiretorios[I]])
         );
         Self.LogaExecucao(True, Format(LOG_ERRO_DIRETORIO_NAO_EXISTE, [IntToStr(I+1), arrDiretorios[I]]));

         //Mesma verificação feita abaixo, feita aqui para melhorar entendimento do processo
         if isPastaCompartilhada then
         begin
            WNetCancelConnection(PAnsiChar(unidade_compartilhamento), True);
         end;

         continue;
      end;

      // Se está tudo certo, vamos começar a percorrer os arquivos que se encontram nas pastas
      pasta_catraca     := pasta_catraca + '\';
      PastaProcessando := pasta_catraca + 'processando';;
      pasta_processados := pasta_catraca + 'processados';
      pasta_parciais    := pasta_catraca + 'parciais';
      pasta_erros       := pasta_catraca + 'erros';
      Ret := FindFirst( pasta_catraca + '*.txt', faAnyFile, F );

      // Se a pasta está vazia, logamos isso.
      if Ret = 2 then
      begin
         Self.LogaExecucao(True, Format(LOG_IMPORTACAO_PASTA_VAZIA, [arrDiretorios[I]]));
      end;

      try
         //Tenta criar as pastas de erro, parciais e processados
         self.criaPasta(arrDiretorios[I], pasta_parciais);
         self.criaPasta(arrDiretorios[I], pasta_erros);
         self.criaPasta(arrDiretorios[I], pasta_processados);
         criaPasta(arrDiretorios[I], PastaProcessando);

         // Move todos os arquivos encontrados para a pasta de processamento

         try
            while Ret = 0 do
            begin
               SourcePath := pasta_catraca + F.Name;
               TargetPath := PastaProcessando + '\' + F.Name;
               MoveFile(PChar(SourcePath), PChar(TargetPath));
               Ret := FindNext(F);
            end;
         finally
            SysUtils.FindClose(F);
         end;

         Ret := FindFirst(PastaProcessando + '\*.txt', faAnyFile, F);

         if Ret = 2 then
            LogaExecucao(True, Format(LOG_IMPORTACAO_PASTA_VAZIA,
               [arrDiretorios[I]]));

         while (Ret = 0) do
         begin
            PrimmePonto := False;
            // Carrega uma classe que irá tratar as informações do arquivo
            if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_MICRODIN) then begin
               arquivo := TImpCatracaMicrodin.Create(Self.FUMSvcImportacaoTerminalCatraca);
            end
            else if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_INNERS) then begin
               arquivo := TImpCatracaInners.Create(Self.FUMSvcImportacaoTerminalCatraca);
            end
            else if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_FLEXPOINT) then begin
               arquivo := TImpCatracaFlexpoint.Create(Self.FUMSvcImportacaoTerminalCatraca);
            end
            else if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_FLEXPOINT_PESSOA) then begin
               arquivo := TImpCatracaFlexpointPessoa.Create(Self.FUMSvcImportacaoTerminalCatraca);
            end
            else if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_HENRY_LUMEN_CARD_2) then begin
               arquivo := TImpCatracaHenry.Create(Self.FUMSvcImportacaoTerminalCatraca);
            end
            else if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_INNERS_NEW) then begin
               arquivo := TImpCatracaInnersNew.create(Self.FUMSvcImportacaoTerminalCatraca);
            end
            else if (Self.FUMSvcImportacaoTerminalCatraca.ModeloCatraca = TIPO_CATRACA_PRIMME_PONTO) then begin
               arquivo := TImpCatracaPrimmePonto.create(Self.FUMSvcImportacaoTerminalCatraca);
               PrimmePonto := True;
            end
            else begin
               arquivo := TImpCatracaX.Create(Self.FUMSvcImportacaoTerminalCatraca);
            end;

            //Processa o arquivo de acordo com a catraca
            AItems := arquivo.processaArquivo( PastaProcessando + '\' + F.Name );

            //Define nome dos arquivos
            dataAtual := Self.FUMSvcImportacaoTerminalCatraca.NowFromDB;
            Self.NomeArquivo := pasta_catraca + F.Name;
            nomeArquivoDataHora := DateTimeToStr( dataAtual, fs ) + '_' + F.Name;
            nomeArquivoData := DateToStr( dataAtual, fs ) + '_' + F.Name;

            // Se o arquivo já foi importado, continuamos com os restantes
            if Self.ArquivoJaImportado( arquivo.getConteudo() ) then
            begin
               Self.LogaExecucao( True, 'O arquivo ' + arrDiretorios[I] + '\' + F.Name + ', já foi importado em outra execução. Movido para pasta de Processados', arquivo.getConteudo() );
               Self.moverArquivo(pasta_processados, PAnsiChar(pasta_catraca + F.Name), PAnsiChar(pasta_processados + '\' + nomeArquivoDataHora));

               // Pega o próximo arquivo
               Ret := FindNext(F);
               continue;
            end;

            //Verificar se tinha arquivo parcial, se tiver vai preecher a stringlist onde a chave é a linha do arquivo
            listaDadosParciais := Self.carregaArquivo(pasta_parciais + '\' + F.Name);
            listaDadosErros := Self.carregaArquivo(pasta_erros + '\' + nomeArquivoData);

            for J := 0 to AItems.Count - 1 do
            begin
               oReg := TImpRegistro(AItems.Objects[J]);
               Self.defineTipoPessoa(oReg, PrimmePonto);
               Self.verificaJaImportado(oReg);

               //Se a linha ja estava no arquivo de parciais ou erros a mesma ja foi processada
               if(Self.inLista(oReg.Conteudo,listaDadosParciais)) OR (Self.inLista(oReg.Conteudo,listaDadosErros)) then
               begin
                  continue;
               end;

               if oReg.Invalido then
               begin
                  Self.gravaLinhaArquivo(pasta_erros + '\' + nomeArquivoData,oReg.Conteudo);
                  Inc(iIgnorados);
                  continue;
               end;

               if oReg.Importado then
               begin
                  Self.gravaLinhaArquivo(pasta_parciais + '\' + F.Name,oReg.Conteudo);
                  Inc(iIgnorados);
                  continue;
               end;

               //Chegou aqui é um registro que deve ser importado
               Self.verificaCodigoEntrada(oReg);
               if oReg.Tipo = itEntrada then
               begin
                  //registra entrada
                  Self.FUMSvcImportacaoTerminalCatraca.GeraEntrada(oReg);
                  Inc(iEntradas);
               end else begin
                  //registra saida
                  Self.FUMSvcImportacaoTerminalCatraca.GeraSaida(oReg);
                  Inc(iSaidas);
               end;

               if not oReg.Invalido then
               begin
                  Self.gravaLinhaArquivo(pasta_parciais + '\' + F.Name,oReg.Conteudo);
               end else begin
                  Self.gravaLinhaArquivo(pasta_erros + '\' + nomeArquivoData,oReg.Conteudo);
               end;

               oReg.Importado := True;
            end;
            // Loga finalização da importação
            Self.FUMSvcImportacaoTerminalCatraca.Log.log( Format( LOG_INFORMACOES_IMPORTACAO_ARQUIVO,
                        [IntToStr(iEntradas), IntToStr(iSaidas), IntToStr(iIgnorados), IntToStr(iEntradas+iSaidas+iIgnorados)] ) );

            //Loga na tabela de importação, pega novamente os dados do arquivo de erro para atualizar os dados
            listaDadosErros := Self.carregaArquivo(pasta_erros + '\' + nomeArquivoData);
            erroFinal := '';
            if listaDadosErros <> nil then
            begin
               for J := 0 to listaDadosErros.Count - 1 do
               begin
                  erroFinal := erroFinal + listaDadosErros.ValueFromIndex[J] + #13 + #10;
               end;
            end;
            Self.LogaExecucao((listaDadosErros <> nil), erroFinal, arquivo.getConteudo() );

            //Move arquivo processado e de erro
            Self.moverArquivo(pasta_processados, PAnsiChar(PastaProcessando + '\' + F.Name), PAnsiChar(pasta_processados + '\' + nomeArquivoDataHora));
            Self.moverArquivo(pasta_erros, PAnsiChar(pasta_erros + '\' + nomeArquivoData), PAnsiChar(pasta_erros + '\' + 'finalizado_' + nomeArquivoData));

            //Remove arquivo de parciais
            deletefile(PAnsiChar(pasta_parciais + '\' + F.Name));

            // Pega o próximo arquivo
            Ret := FindNext(F);
         end;
      finally
         SysUtils.FindClose(F);
      end;

      if isPastaCompartilhada then
      begin
         WNetCancelConnection(PAnsiChar(unidade_compartilhamento), True);
      end;
   end;
end;

function TUMExecucao.inLista(texto: String; lista: TStringList): Boolean;
begin
   result := false;
   if(lista <> nil) then
   begin
      if(lista.Values[texto] <> '') then
      begin
         result := true;
      end;
   end;
end;

procedure TUMExecucao.LogaExecucao(const sn_erro: Boolean; const me_erro, me_arquivo: String; const sn_encerramento: Boolean);
var
   qyLogaExecucao: TUMZQuery;
begin
   try
      qyLogaExecucao := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newQuery;

      qyLogaExecucao.SQL.Text := SQL_INSERE_LOG_EXECUCAO;
      qyLogaExecucao.ParamByName('cd_agendamento').AsInteger := Self.FICodigo;
      qyLogaExecucao.ParamByName('sn_erro').AsInteger := BoolToInt[ sn_erro ];
      qyLogaExecucao.ParamByName('me_erro').AsString := me_erro;
      qyLogaExecucao.ParamByName('me_arquivo').AsString := me_arquivo;

      if sn_encerramento then
      begin
         qyLogaExecucao.ParamByName('sn_encerramento').AsInteger := 1;
         qyLogaExecucao.ParamByName('nm_arquivo').Clear;
      end else begin
         qyLogaExecucao.ParamByName('sn_encerramento').AsInteger := 0;
         qyLogaExecucao.ParamByName('nm_arquivo').AsString := Self.FNomeArquivo;
      end;    

      qyLogaExecucao.ExecSQL;
    except
      on E: Exception do
      begin

      end;
   end;
end;

procedure TUMExecucao.LogaExecucaoEncerramento(const sn_erro: Boolean; const me_erro: String);
begin
   Self.LogaExecucao( sn_erro, me_erro, '', True );
end;

procedure TUMExecucao.moverArquivo(pastaDestino:String;nomeOrigem,nomeDestino:PAnsiChar);
begin
   // Move e renomeia o arquivo para um novo local
   if DirectoryExists( pastaDestino ) then
   begin
      MoveFile( nomeOrigem,nomeDestino );
   end else begin
      Self.LogaExecucao( True, 'A pasta de arquivos processados não existe. Caminho: ' + pastaDestino );
   end;
end;

procedure TUMExecucao.verificaCodigoEntrada(var oReg: TImpRegistro);
var
   bEmpty: Boolean;
   dtEntrada: TDateTime;
   dtSaida: TDateTime;
   iCodigo: Integer;
   qyVerEntrada: TUMZReadOnlyQuery;
begin
   iCodigo := 0;
   dtEntrada := 0;
   dtSaida := 0;

   qyVerEntrada := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newROQuery;

   try

      qyVerEntrada.SQL.Clear;
      qyVerEntrada.SQL.Add('SELECT codigo, dt_entrada , dt_saida');
      qyVerEntrada.SQL.Add('FROM diario_terminal_acessos');
      qyVerEntrada.SQL.Add('WHERE DATE_FORMAT(dt_entrada, ''%Y-%m-%d'') = :dt_entrada AND');
      qyVerEntrada.SQL.Add('      cd_pessoa = :cd_pessoa AND sn_finalizado = 0');
      qyVerEntrada.SQL.Add('ORDER BY dt_entrada DESC');
      qyVerEntrada.SQL.Add('LIMIT 1');
      qyVerEntrada.ParamByName('dt_entrada').AsString := FormatDateTime('yyyy-mm-dd', oReg.Data);
      qyVerEntrada.ParamByName('cd_pessoa').AsInteger := oReg.Codigo;
      qyVerEntrada.Open();

      bEmpty := qyVerEntrada.IsEmpty;
   except
      on E: Exception do
      begin
         oReg.Invalido := true;
      end;
   end;

   if not bEmpty then
   begin
      //entrada
      if (qyVerEntrada.FieldByName('dt_entrada').IsNull) then
      begin
         dtEntrada := 0;
      end else begin
         dtEntrada := qyVerEntrada.FieldByName('dt_entrada').AsDateTime;
      end;

      //saida
      if (qyVerEntrada.FieldByName('dt_saida').IsNull) then
      begin
         dtSaida := 0;
      end else begin
         dtSaida := qyVerEntrada.FieldByName('dt_saida').AsDateTime;
      end;

      iCodigo := qyVerEntrada.FieldByName('codigo').ASInteger;
   end;

   qyVerEntrada.Close();
   FreeAndNil(qyVerEntrada);

   if oReg.Tipo = itEntrada then begin
      //entrada
      if not (bEmpty) then begin
         //é pra ser saida, ja tem entrada
         oReg.Invalido := True;
         oReg.Nome := 'REENTRADA IDENTIFICADA';
      end
      else begin
         oReg.Invalido := False;
      end;
   end
   else begin
      //saida
     if ((bEmpty) or (dtSaida <> 0) or (oReg.Data <= dtEntrada)) then begin
         oReg.Invalido := True;
         oReg.Nome := 'RESAIDA IDENTIFICADA!!';
      end
      else begin
         oReg.Invalido := False;
         oReg.DataEntrada := dtEntrada;
         oReg.CodigoEntrada := iCodigo;
      end;
   end;
end;

procedure TUMExecucao.verificaJaImportado(var oReg: TImpRegistro);
var
   qyVerifica: TUMZQuery;
begin
   qyVerifica := Self.FUMSvcImportacaoTerminalCatraca.UMConn.newQuery;

   try
      qyVerifica.SQL.Clear();
      qyVerifica.SQL.Add(''+
      'SELECT                                 '+
      '     codigo, dt_entrada, dt_saida      '+
      'FROM                                   '+
      '    diario_terminal_acessos dta        '+
      'WHERE                                  '+
      '     cd_pessoa = :cdpessoa AND         '+
      '     ((dt_entrada = :data) OR          '+
      '      (dt_saida = :data))              '+
      'ORDER BY                               '+
      '      dt_entrada DESC                  '+
      '');
      qyVerifica.ParamByName('cdpessoa').AsInteger := oReg.Codigo;
      qyVerifica.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss', oReg.Data);
      qyVerifica.Open();
      oReg.Importado := not qyVerifica.IsEmpty;

      FreeAndNil(qyVerifica);
   except
      on E: Exception do
      begin
         oReg.Invalido := true;
      end;
   end;
end;

initialization
   // registra a classe para que a rotina de carregamento de serviços possa
   // encontrá-la
   Classes.RegisterClass(TUMSvcImportacaoTerminalCatraca);

finalization
   Classes.UnRegisterClass(TUMSvcImportacaoTerminalCatraca);

end.
