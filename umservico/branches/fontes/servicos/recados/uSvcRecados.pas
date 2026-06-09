unit uSvcRecados;

interface

uses
   Contnrs, uDMConexao, Classes, IdMessage, SysUtils, IdSMTP,
   IdSASLLogin, IdUserPassProvider, IdSASLUserPass, IdSASLPlain, IdSSLOpenSSL,
   IdSASLCollection, IdGlobal, IdExplicitTLSClientServerBase, uSvcClasses,
   DateUtils, uCFuncString, UZDataSet;

type
   { Um apelido para string para identificar logs de erro.
   }
   LogErro = string;

   { Esta enumeração lista os tipos de recados que podem ser enviados através do
     sistema de recados do UNIMESTRE Serviços. Existem duas formas de envios
     implementadas neste serviço:
     trRecadoOL - envio através do sistema de "Recados Online" do UNIMESTRE
     trEMail - envio de email utilizando um servidor SMTP previamente configurado
      pelo usuário no arquivo de configuração do pacote referente ao serviço.
   }
   TUMTipoRecado = (trRecadoOL = 1, trEMail);

   { Este é um conjunto das possibilidades de envio de recados que podem ser do
     tipo trRecadoOL, trEMail ou a combinação de ambos.
   }
   TUMTipoRecadoSet = set of TUMTipoRecado;

   { É um apelido para a classe TStringList para identificar uma lista de emails
     de um destinatário.
   }
   TUMListaContatosTipo = TStringList;
   TUMListaEMail = TStringList;
   TUMListaEMailValido = TStringList;
   TUMListaChave = TStringList;

   { A classe TUMDestinatario armazena todos os e-mails de um determinada pessoa,
     além do seu código de pessoa e nome. Essas informações são posteriormente
     consultadas para efetuar o envio dos recados online e emails.
   }
   TUMDestinatario = class(TObject)
   strict private
      FICodPessoa: integer;
      FSNomePessoa: string;
      FSlEMails: TUMListaEMail;
      FSlEMailsValidos: TUMListaEMailValido;
      FSlChaves: TUMListaChave;
      FSlTiposContato: TUMListaContatosTipo;
      function GetEMailCount: integer;
      function GetChaveCount: integer;
      function GetEMail(const i: integer): string;
      function GetChave(const i: integer): string;
      function GetEMailValido(const i: integer): boolean;
      function GetTipoContato(const i: integer): integer;
   private
      constructor Create(const AICodPessoa: integer; const ASNomePessoa: string);
      destructor Destroy; override;
      procedure AddEMail(const ASEMail: string; const AIContatoTipo: Integer);
      procedure AddChave(const ASChave: string);
      property CodPessoa: integer read FICodPessoa;
      property NomePessoa: string read FSNomePessoa;
      property EMailCount: integer read GetEMailCount;
      property ChaveCount: integer read GetChaveCount;
      property EMails[const i: integer]: string read GetEMail;
      property TipoContato[const i: integer]: integer read GetTipoContato;
      property Chaves[const i: integer]: string read GetChave;
      property EmailsValido[const i: integer]: boolean read GetEMailValido;
   end;

   { A classe TUMRecadoPessoa armazena as informações de um envio efetuado para
     uma determinada pessoa através do sistema de recados do UNIMESTRE Serviços.
   }
   TUMRecadoPessoa = class(TObject)
   strict private
      FICodPessoa: integer;
      FIContatoTipo: integer;
      FSEMail: string;
      FSErro: string;
      FSChave: string;
      FBSucesso: boolean;
      FUMTipoRecado: TUMTipoRecado;
   private
      constructor Create(const AICodPessoa, AIContatoTipo: integer; const ASEMail, ASErro: string; const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado); overload;
      constructor Create(const AICodPessoa, AIContatoTipo: integer; const ASEMail: string; const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado); overload;
      constructor Create(const AICodPessoa: integer; const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado); overload;
      destructor Destroy; override;
      property CodPessoa: integer read FICodPessoa;
      property EMail: string read FSEMail;
      property Erro: string read FSErro write FSErro;
      property Sucesso: boolean read FBSucesso write FBSucesso;
      property Chave: string read FSChave;
      property ContatoTipo: integer read FIContatoTipo;
   end;

   { Apelido para a classe TObjectList para identificar uma lista de objetos do
     tipo TUMRecadoPessoa.
   }
   TUMListaPessoas = TObjectList;

   { Apelido para a classe TObjectList para identificar uma lista de objetos do
     tipo TUMDestinatario.
   }
   TUMListaDestino = TObjectList;

   TUMRecado = class;

   TUMEMail = class;

   { A classe TUMRecadoEnvio armazena as informações referentes a um envio de recado
     efetuado através do sistema de recados do UNIMESTRE Serviços. Armazena também
     uma lista de todos os destinos que receberam o recado e a forma pela qual a
     receberam, a saber, recado online, email ou ambos.
     A classe também iplementa um série de métodos que são utilizados para se
     efetuar novos envios de recados online e emails.
   }
   TUMRecadoEnvio = class(TObject)
   strict private
      FUMRecado: TUMRecado;
      FQyInsDestino: TUMZQuery;
      FICodigo: integer;
      FICodOrigem: integer;
      FICodDestino: integer;
      FDtEnvio: TDateTime;
      FUMTipoRecadoSet: TUMTipoRecadoSet;
      FUMListaDestinos: TUMListaPessoas;
      function EnviaEMails(const AUMListaDestinos: TUMListaDestino; const ASMsg, ASChave: string): boolean; overload;
      function enviaEMails(const AUMDestinatario: TUMDestinatario; const ASMsg, ASChave: string): boolean; overload;
      function EnviaRecados(const AUMListaDestinos: TUMListaDestino; const ASMsg, ASChave: string): boolean; overload;
      function EnviaRecados(const AUMDestinatario: TUMDestinatario; const ASMsg, ASChave: string): boolean; overload;
      function InsereDestinoDB(const AICodPessoa, AIContatoTipo: integer; const AUMTipoRecado: TUMTipoRecado; const ASEMail, ASErro, ASChave: string; const ABSucesso: boolean): boolean;
      function GetDestinoCount: integer;
      function GetDestino(const i: integer): TUMRecadoPessoa;
   private
      constructor Create(AUMRecado: TUMRecado; const AUMTipoRecadoSet: TUMTipoRecadoSet; const AICodigo, AICodOrigem, AICodDestino: Integer; const ADtEnvio: TDateTime);
      destructor Destroy; override;

      procedure AddDestino(const AICodPessoa, AIContatoTipo: integer; const ASEMail, ASErro, ASChave: string; const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado); overload;
      procedure AddDestino(const AUMRecadoPessoa: TUMRecadoPessoa); overload;
      function Envia(const AUMTipoRecado: TUMTipoRecado; const AUMListaDestinos: TUMListaDestino; const ASMsg, ASChave: string): boolean; overload;
      function Envia(const AUMTipoRecado: TUMTipoRecado;
         const AUMDestinatario: TUMDestinatario; const ASMsg, ASChave: string): boolean; overload;
      property Envio: TDateTime read FDtEnvio;
   end;

   { Apelido para a classe TObjectList que implementa uma lista de objetos do
     tipo TUMRecadoEnvio.
   }
   TUMListaEnvio = TObjectList;

   TUMSvcRecados = class;

   { A classe TUMRecado armazena todas as configurações referentes a um recado
     cadastrado no sistema de recados do UNIMESTRE Serviços. Também é armazenada
     uma lista com todos os envios efetuados desse recado.
     Também implementa uma função responsável por efetuar a substituição das
     variáveis da mensagem pelas informações concretas que foram regatadas através
     da execução do SQL configurado para o recado.
   }
   TUMRecado = class(TObject)
   strict private
      FUMSvcRecados: TUMSvcRecados;
      FQYInsEnvio: TUMZQuery;
      FQySQL: TUMZReadOnlyQuery;
      FQyEMails: TUMZReadOnlyQuery;
      FQyLastInsertID: TUMZReadOnlyQuery;
      FICodigo: integer;
      FICodOrigem: integer;
      FICodDestino: integer;
      FIIntervalo: integer;
      FSSQL: string;
      FSAssunto: string;
      FSMsgEMail: string;
      FSMsgRecado: string;
      FSListaTiposContatos: string;
      FUMTipoRecadoSet: TUMTipoRecadoSet;
      FUMListaEnvios: TUMListaEnvio;
      FUMListaDestino: TUMListaDestino;
      function GetUltimoEnvio: TUMRecadoEnvio;
      function EnviaRecado: boolean;
      function EnviaEMail: boolean;
      function Enviar: boolean;
      function GetTipoRecado: string;
      function GetLastInsertID: integer;
      function GetEnvioCount: integer;
      function GetEnvio(const i: integer): TUMRecadoEnvio;
      function UsaVars(const ASMsg: string): boolean;
      function SubstVars(const ASChave: string; const ASMsg: string): string;
      function GetAnoSemestre: integer;
      procedure CarregaListaDestino;
      procedure LimpaListaDestinos;
   private
      constructor Create(AUMSvcRecados: TUMSvcRecados; const AICodigo,
         AIIntervalo, AICodOrigem, AICodDestino: integer; const ASSQL,
         ASAssunto, ASMsgEMail, ASMsgRecado, ASListaTiposContatos: string;
         const AUMTipoRecadoSet: TUMTipoRecadoSet);
      destructor Destroy; override;
      function Envia: boolean;
      procedure AddEnvio(const AUMTipoRecado: TUMTipoRecado;
         const AICodigo: integer; const ADtEnvio: TDateTime); overload;
      procedure AddEnvio(const AUMRecadoEnvio: TUMRecadoEnvio); overload;
      property Codigo: integer read FICodigo;
      property Assunto: string read FSAssunto;
      property SvcRecados: TUMSvcRecados read FUMSvcRecados;
      property AnoSemestre: integer read GetAnoSemestre;
   end;

   { A classe TUMListaRecado implementa uma lista de objetos específica para o
     tipo TUMRecado.
   }
   TUMListaRecado = class(TObjectList)
   strict private
      function GetItem(Index: Integer): TUMRecado;
      procedure SetItem(Index: Integer; AUMRecado: TUMRecado);
   public
      constructor Create;
      destructor Destroy; override;
      function Add(AUMRecado: TUMRecado): Integer;
      function Extract(Item: TUMRecado): TUMRecado;
      function Remove(AUMRecado: TUMRecado): Integer;
      function IndexOf(AUMRecado: TUMRecado): Integer;
      procedure Insert(Index: Integer; AUMRecado: TUMRecado);
      function First: TUMRecado;
      function Last: TUMRecado;
      property Items[Index: Integer]: TUMRecado read GetItem write SetItem; default;
   end;

   { A classe EUMEMailError é um tipo de exceção específica para erros decorrentes
     do envio de email.
   }
   EUMEMailError = Exception;

   { A classe TUMEMail implementa um sistema de envio de emails através de um
     servidor SMTP. A classe implementa funções para envio dos email, pausa entre
     os envios e verificação de quantidade de destinatários da mensagem.
   }
   TUMEMail = class(TObject)
   strict private
      FIdSMTP: TIdSMTP;
      FIdSASLLogin: TIdSASLLogin;
      FIdSASLPlain: TIdSASLPlain;
      FIdUserPassProvider: TIdUserPassProvider;
      FIdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
      FIdMessage: TIdMessage;
      FSServidor: string;
      FSUsuario: string;
      FSSenha: string;
      FSRemetente: string;
      FSNome: string;
      FSTexto: string;
      FSDominio: string;
      FSOrganizacao: string;
      FBAutentica: boolean;
      FBUsaTLS: boolean;
      FBUsaSSL: boolean;
      FIIntervalo: integer;
      FILimite: integer;
      function AtingiuLimite: boolean;
   private
      constructor Create(const ASServidor, ASUsuario, ASSenha, ASRemetente,
         ASNome, ASDominio, ASOrganizacao: string; const AIIntervalo, AILimite,
         AIPorta: integer; const ABAutentica, ABUsaTLS, ABUsaSSL: boolean);
      destructor Destroy; override;
      procedure Envia(const AUMListaDestinos: TUMListaDestino; const ASMsg,
         ASAssunto: string); overload;
      procedure Envia(const AUMDestinatario: TUMDestinatario; const ASMsg,
         ASAssunto: string); overload;
      procedure Pausa;
      property Intervalo: integer read FIIntervalo;
      property Limite: integer read FILimite;
   end;

   { A classe EUMRecadoOLError é um tipo de exceção específico para erros que
     ocorrem durante o processo de envio de recados através do sistema online.
   }
   EUMRecadoOLError = Exception;

   { A classe TUMRecadoOL implementa um sistema para envio de recados através do
     sistema online.
   }
   TUMRecadoOL = class(TObject)
   strict private
      FQyInsRecado: TUMZQuery;
      FQyInsRecPessoa: TUMZQuery;
      FQyLastInsertID: TUMZReadOnlyQuery;
      FICodigo: integer;
      FICodOrigem: integer;
      FICodDestino: integer;
      FSRecado: string;
      procedure NovoRecado;
      function GetLastInsertID: integer;
   private
      constructor Create(AUMSvcRecados: TUMSvcRecados);
      destructor Destroy; override;
      procedure Envia(const AUMListaDestinos: TUMListaDestino; const AIAnoSem: integer); overload;
      procedure Envia(const AUMDestinatario: TUMDestinatario; const AIAnoSem: integer); overload;
      procedure SetRecado(const ASRecado: string; const AICodOrigem, AICodDestino: integer);
   end;

   { A classe TUMSvcRecados implementa a classe base de serviços do UNIMESTRE para
     envio de recados periódicos de acordo com as configurações do usuário.
   }
   TUMSvcRecados = class(TUMServiceDefault)
   strict private
      FUMConn: TUMConexao;
      FUMEMail: TUMEMail;
      FUMRecadoOL: TUMRecadoOL;
      FQyRecados: TUMZReadOnlyQuery;
      FQyDadosSMTP: TUMZReadOnlyQuery;
      FUMListaRecado: TUMListaRecado;
      function CarregaRecados: boolean;
      procedure GetDadosSMTP;
      procedure AdicionaRecado(const AICodigo, AIIntervalo, AICodOrigem,
         AICodDestino: integer; const ASSQL, ASAssunto, ASMsgEMail,
         ASMsgRecado, ASListaTiposContatos: string; const AUMTipoRecadoSet: TUMTipoRecadoSet);
   private
      property SMTP: TUMEMail read FUMEMail;
      property RecadoOL: TUMRecadoOL read FUMRecadoOL;
   public
      constructor Create;
      function processa: IUMServiceAppRet; override;
      procedure onLoadServico; override;
      procedure onUnloadServico; override;
      procedure tentaReconectar;
      procedure stopProcessamento; override;
      procedure ReloadDadosSMTP();
      property UMConn: TUMConexao read FUMConn;
   end;

implementation

uses
   DB, IdBaseComponent, IdEMailAddress, uGeneral;

const
   // conversão de Char para TUMTipoRecadoSet
   StrToTipoRecadoSet: array['1'..'3'] of TUMTipoRecadoSet = ([trRecadoOL], [trEMail], [trRecadoOL, trEMail]);

   // conversão de Char para TUMTipoRecado
   StrToTipoRecado: array['1'..'2'] of TUMTipoRecado = (trRecadoOL, trEMail);

   // conversão de Boolean para Integer
   BoolToInteger: array[boolean] of integer = (0, 1);

   // delimitadores de variáveis nas mensagens
   VAR_BEGIN = '[[';
   VAR_END = ']]';

   // variáveis de configuração da mensagem SMTP
   SMTP_ATTACH_ENCONDING = 'MIME';
   SMTP_CONTENT_TYPE = 'text/html';

   // SQL para inserir um envio de recado para um determinada pessoa
   SQL_INSERE_DESTINO =
      'INSERT INTO svc_recados_pessoas (cd_recado_envio, cd_pessoa, tp_recado, ds_email, sn_sucesso, me_erro, ds_chave, cd_contato) '+
      'VALUES (:cd_recado_envio, :cd_pessoa, :tp_recado, :ds_email, :sn_sucesso, :me_erro, :ds_chave, :cd_contato)';

   // SQL para inserir um novo envio de um determinado recado
   SQL_INSERE_ENVIO =
      'INSERT INTO svc_recados_envios (cd_recado, tp_recado, dt_envio) '+
      'VALUES (:cd_recado, :tp_recado, NOW())';

   // SQL para resgatar as informações de emails cadastrados para a pessoa
   SQL_GET_EMAILS =
      'SELECT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'cp.cd_contato,'+
         'cp.ds_contato '+
      'FROM '+
         'pessoas p INNER JOIN contatos_pessoas cp ON (cp.cd_pessoa = p.cd_pessoa) '+
      'WHERE '+
         'p.cd_pessoa IN(%s) AND '+
         'cp.cd_contato %s %s ';

   // SQL para efetuar a inserção de um novo recado no sistema de recados online
   SQL_INSERE_REC_RECADO =
      'INSERT INTO rec_recados (ds_recado, dt_recado, cd_pessoa_origem, cd_origem, cd_destino) '+
      'VALUES (:ds_recado, NOW(), ''SISTEMA'', :cd_origem, :cd_destino)';

   // SQL para efetuar a inserção de um novo destino de recado pelo sistema de recados online
   SQL_INSERE_REC_PESSOA =
      'INSERT IGNORE INTO rec_pessoas (cd_pessoa, cd_recado, nr_anosemestre) '+
      'VALUES (:cd_pessoa, :cd_recado, :nr_anosemestre)';

   // SQL para resgatar todas as informações referentes a recados cadastrados
   // através do sistema de recados do UNIMESTRE Serviços
   SQL_GET_RECADOS =
      'SELECT '+
         'r.cd_recado,'+
         'r.me_sql,'+
         'r.ds_assunto,'+
         'r.me_msg_email,'+
         'r.me_msg_recado,'+
         'r.tp_recado tipo_recado,'+
         'r.nr_intervalo,'+
         'r.cd_origem,'+
         'r.cd_destino,'+
         'r.ds_lista_tipos_contatos'+
      ' FROM '+
         'svc_recados r '+
      'WHERE '+
         'r.sn_ativo = 1';

   // última primary key inserida no banco de dados
   SQL_LAST_INSERT_ID =
      'SELECT LAST_INSERT_ID() FROM DUAL';

   // pega as veriáveis om as informações de conexão com o servidor SMTP
   SQL_GET_PARAMS_SMTP =
      'SELECT '+
         'p.ds_parametro,'+
         'p.ds_valor '+
      'FROM '+
         'nu_parametros p '+
            'JOIN nu_modulos m USING (cd_modulo) '+
      'WHERE '+
         'm.ds_chave = ''UMNucleo'' AND '+
         'p.ds_parametro LIKE ''smtp.%''';

   LOG_LINHA_NOVA = #13 + #9;

   LOG_ERRO = LOG_LINHA_NOVA + 'Erro : %s';

   LOG_ERRO_INSERE_ENVIO =
      '[Ocorreu um erro na tentativa de inserir log de envio na base de dados]' + LOG_LINHA_NOVA +
      'Código do recado : %d' + LOG_LINHA_NOVA +
      'Tipo do recado : %s' + LOG_ERRO;

   LOG_ERRO_INSERE_DESTINO =
      '[Ocorreu um erro na tentativa de inserir log de envio de recado na base de dados]' + LOG_LINHA_NOVA +
      'Código do envio : %d' + LOG_LINHA_NOVA +
      'Pessoa : %d' + LOG_LINHA_NOVA +
      'E-Mail: %s' + LOG_ERRO;

   LOG_ERRO_GET_EMAILS =
      '[Ocorreu um erro na tentativa de resgatar os endereços de emails dos destinatários]' + LOG_LINHA_NOVA +
      'Pessoas: %s' + LOG_ERRO;

   LOG_ERRO_GET_ULTIMO_ENVIO =
      '[Ocorreu um erro na tentativa de recuperar a chave primário do último envio inserido]' + LOG_ERRO;

   LOG_ERRO_SMTP_ENVIO =
      '[Ocorreu um erro na tentativa de efetuar o envio do email]' + LOG_ERRO;

   LOG_ERRO_SMTP_CONEXAO =
      '[Ocorreu um erro na tentativa de efetuar conexão com o servidor SMTP]' + LOG_ERRO;

   LOG_SMTP_SEM_CONEXAO =
      '[Não foi possível estabelecer conexão com o servidor SMTP]' + LOG_LINHA_NOVA;

   LOG_ERRO_REC_INSERE_PESSOA =
      '[Ocorreu um erro ao tentar enviar um recado pelo sistema online]' + LOG_LINHA_NOVA +
      'Pessoa : %d' + LOG_LINHA_NOVA +
      'Ano/semestre: %d' + LOG_LINHA_NOVA +
      'Código do recado : %d' + LOG_ERRO;

   LOG_ERRO_GET_ULTIMO_RECADO =
      '[Ocorreu um erro na tentativa de recuperar a chave primária do último recado online inserido]' + LOG_ERRO;

   LOG_ERRO_GET_RECADOS =
      '[Ocorreu um erro na tentativa de resgatar as informações de recados na base de dados]' + LOG_ERRO;

   LOG_ERRO_GET_DESTINOS =
      '[Ocorreu um erro na tentativa de resgatar os destinatários do recado]' + LOG_ERRO;

   LOG_ERRO_CONEXAO =
      '[Não foi possível estabelecer conexão com o banco de dados]' + LOG_ERRO;

   LOG_ERRO_GET_SMTP =
      '[Ocorreu um erro na tentativa de resgatar as configuração do servidor SMTP na base de dados]' + LOG_ERRO;

{ TUMDestinatario }

{ Adiciona uma chave à lista de contatos do destinatário.
}
procedure TUMDestinatario.AddChave(const ASChave: string);
begin
   if Self.FSlChaves.IndexOf(ASChave) = -1 then
   begin
      Self.FSlChaves.Add(ASChave);
   end;
end;

{ Adiciona um email à lista de contatos do destinatário.
}
procedure TUMDestinatario.AddEMail(const ASEMail: string; const AIContatoTipo: Integer);
begin
   Self.FSlTiposContato.Add(IntToStr(AIContatoTipo));
   Self.FSlEMails.Add(ASEMail);
   Self.FSlEMailsValidos.Add(BoolToStr(TGeneral.StringValida(ASEMail, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z]{2,4}$')));
end;

{ Construtor.
}
constructor TUMDestinatario.Create(const AICodPessoa: integer;
  const ASNomePessoa: string);
begin
   Self.FICodPessoa := AICodPessoa;
   Self.FSNomePessoa := ASNomePessoa;
   Self.FSlEMails := TStringList.Create;
   Self.FSlEMailsValidos := TStringList.Create;
   Self.FSlChaves := TStringList.Create;
   Self.FSlTiposContato := TStringList.Create;
end;

{ Destrutor.
}
destructor TUMDestinatario.Destroy;
begin
   Self.FSlEMails.Free;
   Self.FSlEMailsValidos.Free;
   Self.FSlChaves.Free;
   Self.FSlTiposContato.Free;
   inherited;
end;

{ Pega a chave do destinatário na posição i.
}
function TUMDestinatario.GetChave(const i: integer): string;
begin
   Result := Self.FSlChaves.Strings[i];
end;

{ Pega a quantidade total de chaves cadastrados para o destinatário.
}
function TUMDestinatario.GetChaveCount: integer;
begin
   Result := Self.FSlChaves.Count;
end;

{ Pega o email do destinatário na posição i.
}
function TUMDestinatario.GetEMail(const i: integer): string;
begin
   Result := Self.FSlEMails.Strings[i];
end;

{ Pega a quantidade total de emails cadastrados para o destinatário.
}
function TUMDestinatario.GetEMailCount: integer;
begin
   Result := Self.FSlEMails.Count;
end;

function TUMDestinatario.GetEMailValido(const i: integer): boolean;
begin
   Result := StrToBool(Self.FSlEMailsValidos[i]);
end;

function TUMDestinatario.GetTipoContato(const i: integer): integer;
begin
   Result := StrToIntDef(Self.FSlTiposContato.Strings[i], -1);
end;

{ TUMRecadoPessoa }

{ Construtor.
}
constructor TUMRecadoPessoa.Create(const AICodPessoa, AIContatoTipo: integer; const ASEMail,
  ASErro: string; const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado);
begin
   Self.FICodPessoa := AICodPessoa;
   Self.FSEMail := ASEMail;
   Self.FSErro := ASErro;
   Self.FBSucesso := ABSucesso;
   Self.FUMTipoRecado := AUMTipoRecado;
   Self.FIContatoTipo := AIContatoTipo;
end;

{ Construtor.
}
constructor TUMRecadoPessoa.Create(const AICodPessoa: integer;
  const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado);
begin
   Self.FICodPessoa := AICodPessoa;
   Self.FBSucesso := ABSucesso;
   Self.FUMTipoRecado := AUMTipoRecado;
end;

{ Construtor.
}
constructor TUMRecadoPessoa.Create(const AICodPessoa, AIContatoTipo: integer;
  const ASEMail: string; const ABSucesso: boolean;
  const AUMTipoRecado: TUMTipoRecado);
begin
   Self.FICodPessoa := AICodPessoa;
   Self.FSEMail := ASEMail;
   Self.FBSucesso := ABSucesso;
   Self.FUMTipoRecado := AUMTipoRecado;
   Self.FIContatoTipo := AIContatoTipo;
end;

{ Destrutor.
}
destructor TUMRecadoPessoa.Destroy;
begin
   inherited;
end;

{ TUMRecadoEnvio }

{ Adiciona um objeto de de pessoa à lista de destinos do recado.
}
procedure TUMRecadoEnvio.AddDestino(const AUMRecadoPessoa: TUMRecadoPessoa);
begin
   Self.FUMListaDestinos.Add(AUMRecadoPessoa);
end;

{ Adiciona uma pessoa à lista de destinos do recado.
}
procedure TUMRecadoEnvio.AddDestino(const AICodPessoa, AIContatoTipo: integer; const ASEMail,
  ASErro, ASChave: string; const ABSucesso: boolean; const AUMTipoRecado: TUMTipoRecado);
begin
   Self.FUMListaDestinos.Add(TUMRecadoPessoa.Create(
      AICodPessoa, AIContatoTipo, ASEMail, ASErro, ABSucesso, AUMTipoRecado));
end;

{ Construtor.
}
constructor TUMRecadoEnvio.Create(AUMRecado: TUMRecado; const AUMTipoRecadoSet: TUMTipoRecadoSet;
   const AICodigo, AICodOrigem, AICodDestino: Integer; const ADtEnvio: TDateTime);
begin
   Self.FUMRecado := AUMRecado;
   Self.FUMTipoRecadoSet := AUMTipoRecadoSet;
   Self.FICodigo := AICodigo;
   Self.FICodOrigem := AICodOrigem;
   Self.FICodDestino := AICodDestino;
   Self.FDtEnvio := ADtEnvio;
   Self.FUMListaDestinos := TObjectList.Create;
   Self.FQyInsDestino := Self.FUMRecado.SvcRecados.UMConn.newQuery;
   Self.FQyInsDestino.ParamCheck := True;
   Self.FQyInsDestino.SQL.Text := SQL_INSERE_DESTINO;
end;

{ Destrutor.
}
destructor TUMRecadoEnvio.Destroy;
var
   i: integer;
begin
   for i := Self.FUMListaDestinos.Count - 1 downto 0 do
   begin
      TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Free;
   end;
   Self.FUMListaDestinos.Free;
   Self.FQyInsDestino.Free;
   inherited;
end;

{ Processa o envio do recado para vários destinos.
}
function TUMRecadoEnvio.Envia(const AUMTipoRecado: TUMTipoRecado;
  const AUMListaDestinos: TUMListaDestino; const ASMsg, ASChave: string): boolean;
begin
   // verifica o tipo do recado
   case AUMTipoRecado of
      // envia recado online
      trRecadoOL:
         Result := Self.EnviaRecados(AUMListaDestinos, ASMsg, ASChave);
      // envia email
      trEMail:
         Result := Self.EnviaEMails(AUMListaDestinos, ASMsg, ASChave);
   end;
end;

{ Processa o envio do recado para apenas um destinatário. 
}
function TUMRecadoEnvio.Envia(const AUMTipoRecado: TUMTipoRecado;
  const AUMDestinatario: TUMDestinatario; const ASMsg, ASChave: string): boolean;
begin
   // verifica o tipo do recado
   case AUMTipoRecado of
      // envia recado online
      trRecadoOL:
         Result := Self.EnviaRecados(AUMDestinatario, ASMsg, ASChave);
      // envia email
      trEMail:
         Result := Self.EnviaEMails(AUMDestinatario, ASMsg, ASChave);
   end;
end;

{ Processa o envio de emails para apenas um destinatário.
}
function TUMRecadoEnvio.enviaEMails(const AUMDestinatario: TUMDestinatario;
  const ASMsg, ASChave: string): boolean;
var
   i, j, c: integer;
begin
   Result := True;
   j := Self.FUMListaDestinos.Count;

   // percorre os emails do destinatário
   for i := 0 to AUMDestinatario.EMailCount - 1 do
   begin
      // adiciona o email à lista de destinos do recado
      Self.FUMListaDestinos.Add(
         TUMRecadoPessoa.Create(
            AUMDestinatario.CodPessoa, AUMDestinatario.TipoContato[i],
            AUMDestinatario.EMails[i], AUMDestinatario.EmailsValido[i], trEMail
         )
      );
   end;

   try
      // processa o envio do email
      if Self.FUMListaDestinos.Count > j then
      begin
         Self.FUMRecado.SvcRecados.SMTP.Envia(AUMDestinatario, ASMsg, Self.FUMRecado.Assunto);
      end;
   except
      // trata o erro
      on E: EUMEMailError do
      begin
         Result := False;
         // salva a descrição do erro nos objetos de destino
         for i := j to Self.FUMListaDestinos.Count - 1 do
         begin
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Erro := E.Message;
         end;
         try
            Self.FUMRecado.SvcRecados.Log.log(E.Message);
         except
            //Tenta inserir um log de erro nos emails, ele acaba repetindo em algumas ocasiões os envios, por isso pode dar erro
         end;
      end;
   end;

   for i := j to Self.FUMListaDestinos.Count - 1 do
   begin
      if TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Sucesso then
      begin
         Self.InsereDestinoDB(
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).CodPessoa,
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).ContatoTipo,
            trEMail,
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).EMail,
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Erro,
            ASChave, Result);
      end
      else
      begin
         Self.InsereDestinoDB(
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).CodPessoa,
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).ContatoTipo,
            trEMail,
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).EMail,
            'E-Mail para envio inválido!',
            ASChave, False);
      end;
   end;
end;

{ Processa o envio dos emails para vários destinatários.
}
function TUMRecadoEnvio.EnviaEMails(const AUMListaDestinos: TUMListaDestino;
  const ASMsg, ASChave: string): boolean;
var
   i, j, k, c: integer;
begin
   Result := True;
   k := Self.FUMListaDestinos.Count;
   // percorre a lista de destinatário
   for i := 0 to AUMListaDestinos.Count - 1 do
   begin
      // percorre a lista de emails cadastrados para cada destinatário
      for j := 0 to TUMDestinatario(AUMListaDestinos.Items[i]).EMailCount - 1 do
      begin
         if TUMDestinatario(AUMListaDestinos.Items[i]).EmailsValido[j] then
         begin
            // adiciona à lista de destinos do email
            Self.FUMListaDestinos.Add(
               TUMRecadoPessoa.Create(
                  TUMDestinatario(AUMListaDestinos.Items[i]).CodPessoa,
                  TUMDestinatario(AUMListaDestinos.Items[i]).TipoContato[j],
                  TUMDestinatario(AUMListaDestinos.Items[i]).EMails[j], False, trEMail));
         end;
      end;
   end;
   try
      // processa o envio dos emails
      if Self.FUMListaDestinos.Count > k then
      begin
         Self.FUMRecado.SvcRecados.SMTP.Envia(AUMListaDestinos, ASMsg, Self.FUMRecado.Assunto);
      end;
   except
      // trata o erro
      on E: EUMEMailError do
      begin
         Result := False;
         // grava o erro nos objetos
         for i := k to AUMListaDestinos.Count - 1 do
         begin
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Erro := E.Message;
         end;
         try
            Self.FUMRecado.SvcRecados.Log.log(E.Message);
         except
            //Tenta inserir um log de erro nos emails, ele acaba repetindo em algumas ocasiões os envios, por isso pode dar erro
         end;
      end;
   end;
   // salva os envios efetuados na base de dados
   for i := k to AUMListaDestinos.Count - 1 do
   begin
      Self.InsereDestinoDB(
         TUMRecadoPessoa(AUMListaDestinos.Items[i]).CodPessoa,
         TUMRecadoPessoa(AUMListaDestinos.Items[i]).ContatoTipo,
         trEMail,
         TUMRecadoPessoa(AUMListaDestinos.Items[i]).EMail,
         TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Erro,
         ASChave, Result);
   end;

      // percorre a lista de destinatário
   for i := 0 to AUMListaDestinos.Count - 1 do
   begin
      // percorre a lista de emails cadastrados para cada destinatário
      for j := 0 to TUMDestinatario(AUMListaDestinos.Items[i]).EMailCount - 1 do
      begin
         if NOT(TUMDestinatario(AUMListaDestinos.Items[i]).EmailsValido[j]) then
         begin
            Self.InsereDestinoDB(
               TUMDestinatario(AUMListaDestinos.Items[i]).CodPessoa,
               TUMDestinatario(AUMListaDestinos.Items[i]).TipoContato[j],
               trEMail,
               TUMDestinatario(AUMListaDestinos.Items[i]).EMails[j],
               'E-Mail para envio inválido!',
               ASChave, False);
         end;
      end;
   end;
end;

{ Processa o envio de recados para vários destinatários.
}
function TUMRecadoEnvio.EnviaRecados(const AUMListaDestinos: TUMListaDestino;
  const ASMsg, ASChave: string): boolean;
var
   i, j, c: integer;
begin
   Result := True;
   // percorre a lista de destinatários
   j := Self.FUMListaDestinos.Count;
   for i := 0 to AUMListaDestinos.Count - 1 do
   begin
      // adiciona o email à lista de destinos
      Self.FUMListaDestinos.Add(
         TUMRecadoPessoa.Create(
            TUMDestinatario(AUMListaDestinos.Items[i]).CodPessoa,
            True, trRecadoOL
         )
      );
   end;
   try
      // processa o envio do recado
      Self.FUMRecado.SvcRecados.RecadoOL.SetRecado(ASMsg, Self.FICodOrigem, Self.FICodDestino);
      Self.FUMRecado.SvcRecados.RecadoOL.Envia(AUMListaDestinos, Self.FUMRecado.AnoSemestre);
   except
      // trata o erro
      on E: EUMRecadoOLError do
      begin
         Result := False;
         // salva a descrição do erro nos objetos de destino
         for i := j to AUMListaDestinos.Count - 1 do
         begin
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Erro := E.Message;
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Sucesso := False;
         end;
         try
            Self.FUMRecado.SvcRecados.Log.log(E.Message);
         except
            //Tenta inserir um log de erro nos recados, ele acaba repetindo em algumas ocasiões os envios, por isso pode dar erro
         end;
      end;
   end;
   // insere os envios na base de dados
   for i := j to AUMListaDestinos.Count - 1 do
   begin
         Self.InsereDestinoDB(
            TUMDestinatario(AUMListaDestinos.Items[i]).CodPessoa,
            -1, trRecadoOL, '',
            TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]).Erro,
            ASChave, Result);
   end;
end;

{ Processa o envio do recado para um único destinatário.
}
function TUMRecadoEnvio.EnviaRecados(const AUMDestinatario: TUMDestinatario;
  const ASMsg, ASChave: string): boolean;
var
   i, c: integer;
begin
   Result := True;
   // adiciona à lista de destinos
   Self.FUMListaDestinos.Add(TUMRecadoPessoa.Create(AUMDestinatario.CodPessoa, True, trRecadoOL));
   try
      // processa o envio do recado
      Self.FUMRecado.SvcRecados.RecadoOL.SetRecado(ASMsg, Self.FICodOrigem, Self.FICodDestino);
      Self.FUMRecado.SvcRecados.RecadoOL.Envia(AUMDestinatario, Self.FUMRecado.AnoSemestre);
   except
      // trata o erro
      on E: EUMRecadoOLError do
      begin
         Result := False;
         // salva a descrição do erro no objeto
         TUMRecadoPessoa(Self.FUMListaDestinos.Last).Erro := E.Message;
         TUMRecadoPessoa(Self.FUMListaDestinos.Last).Sucesso := False;
         try
            Self.FUMRecado.SvcRecados.Log.log(E.Message);
         except
            //Tenta inserir um log de erro nos emails, ele acaba repetindo em algumas ocasiões os envios, por isso pode dar erro
         end;
      end;
   end;
   // salva na base de dados        
      Self.InsereDestinoDB(
         AUMDestinatario.CodPessoa, -1, trRecadoOL, '',
         TUMRecadoPessoa(Self.FUMListaDestinos.Last).Erro,
         ASChave, Result);
end;

{ Retorna o destino da lista de destinos na posição i.
}
function TUMRecadoEnvio.GetDestino(const i: integer): TUMRecadoPessoa;
begin
   Result := TUMRecadoPessoa(Self.FUMListaDestinos.Items[i]);
end;

{ Retorna a quantidade total de destinos que receberam a mensagem.
}
function TUMRecadoEnvio.GetDestinoCount: integer;
begin
   Result := Self.FUMListaDestinos.Count;
end;

{ Insere um destino na base de dados.
}
function TUMRecadoEnvio.InsereDestinoDB(const AICodPessoa, AIContatoTipo: integer;
  const AUMTipoRecado: TUMTipoRecado; const ASEMail, ASErro, ASChave: string;
  const ABSucesso: boolean): boolean;
var
   erro: LogErro;
begin
   Result := True;
   Self.FQyInsDestino.ParamByName('cd_recado_envio').AsInteger := Self.FICodigo;
   Self.FQyInsDestino.ParamByName('cd_pessoa').AsInteger := AICodPessoa;
   Self.FQyInsDestino.ParamByName('ds_email').AsString := ASEMail;
   Self.FQyInsDestino.ParamByName('sn_sucesso').AsInteger := BoolToInteger[ABSucesso];
   Self.FQyInsDestino.ParamByName('me_erro').AsString := ASErro;
   Self.FQyInsDestino.ParamByName('ds_chave').AsString := ASChave;

   if AIContatoTipo > 0 then
   begin
      Self.FQyInsDestino.ParamByName('cd_contato').AsInteger := AIContatoTipo;
   end else begin
      Self.FQyInsDestino.ParamByName('cd_contato').Clear();   
   end;   

   case AUMTipoRecado of
      trRecadoOL: Self.FQyInsDestino.ParamByName('tp_recado').AsString := '1';
      trEMail: Self.FQyInsDestino.ParamByName('tp_recado').AsString := '2';
   end;
   try
      // tenta inserir na base de dados
      Self.FQyInsDestino.ExecSQL;
   except
      on E: Exception do
      begin
         // grava log de erro
         Result := False;
         erro := Format(LOG_ERRO_INSERE_DESTINO, [Self.FICodigo, AICodPessoa, ASEMail, E.Message]);
         Self.FUMRecado.SvcRecados.Log.log(erro);
      end;
   end;
end;

{ TUMRecado }

{ Adiciona um objeto de envio à lista de envios do recado.
}
procedure TUMRecado.AddEnvio(const AUMRecadoEnvio: TUMRecadoEnvio);
begin
   Self.FUMListaEnvios.Add(AUMRecadoEnvio);
end;

{ Adiciona um envio à lista de envios do recado.
}
procedure TUMRecado.AddEnvio(const AUMTipoRecado: TUMTipoRecado;
  const AICodigo: integer; const ADtEnvio: TDateTime);
begin
   Self.FUMListaEnvios.Add(TUMRecadoEnvio.Create(
      Self,
      Self.FUMTipoRecadoSet,
      AICodigo,
      Self.FICodOrigem,
      Self.FICodDestino,
      ADtEnvio
   ));
end;

{ Carrega os emails dos destinatários do recado.
}
procedure TUMRecado.CarregaListaDestino;
const
   IntToBool : array[0..1] of boolean = (False, True);
var
   LSlPessoas, LSlTiposContatos, LSlTipoContatos: TStringList;
   LICodPessoa, LIndice, i: integer;
   LSPessoas: string;
   erro: LogErro;
begin
   // limpa a lista de destinatários
   Self.LimpaListaDestinos;
   LSlPessoas := TStringList.Create;
   LICodPessoa := -1;
   LIndice := -1;
   LSPessoas := '';
   // pega as pessoas que receberão a mensagem
   try
      Self.FQySQL.Close;
      Self.FQySQL.Open;
   except
      on E: Exception do
      begin
         Self.FUMSvcRecados.Log.log(Format(LOG_ERRO_GET_DESTINOS, [E.Message]));

         Self.FUMSvcRecados.tentaReconectar;
      end;
   end;
   // percorre o SQL para pegar todas as pessoas que receberão a mensagem
   while not Self.FQySQL.Eof do
   begin
      // monta a lista de códigos de pessoa
      LSlPessoas.Sort;
      if not(LSlPessoas.Find(FQySQL.FieldByName('cd_pessoa').AsString, LIndice))then
      begin
        LIndice := LSlPessoas.AddObject(FQySQL.FieldByName('cd_pessoa').AsString, TStringList.Create);
      end;
      TStringList(LSlPessoas.Objects[LIndice]).Add(FQySQL.FieldByName('ds_chave').AsString);
      
      if AnsiPos(FQySQL.FieldByName('cd_pessoa').AsString, LSPessoas) = 0 then
      begin
         if LSPessoas <> '' then
            LSPessoas := LSPessoas + ',';
         LSPessoas := LSPessoas + Self.FQySQL.FieldByName('cd_pessoa').AsString;
      end;
      Self.FQySQL.Next;
   end;

   // Se não tem pessoa pra enviar e-mail, então, não iremos executar o SQL. Pois, irá ficar gerando erro de Execução de SQL ATOA!
   if ( Trim(LSPessoas) = '' ) then
   begin
      Self.FQyEMails.Close;
      LSlPessoas.Free;
      Exit;
   end;

   //Retira a virgula da ultima posição, caso exista
   if ( Copy( LSPessoas,Length( LSPessoas )) = ',' ) then
   begin
      LSPessoas := Copy( LSPessoas,0,Length( LSPessoas ) -1 );
   end;

   // prepara SQL para buscar todos os emails dos destinatários
   Self.FQyEMails.SQL.Text := Format(SQL_GET_EMAILS, [LSPessoas, '=', '4']);
   if (Trim(Self.FSListaTiposContatos) <> '') AND
      TGeneral.StringValida(Self.FSListaTiposContatos, '^(([a-z]+):([1-9]+)(,[1-9]+)*)(;([a-z]+):([1-9]+)(,[1-9]+)*)*$') then
   begin
      LSlTiposContatos := TFuncString.splitString(Self.FSListaTiposContatos, ';');
      for I := 0 to LSlTiposContatos.Count - 1 do
      begin
         LSlTipoContatos := TFuncString.splitString(LSlTiposContatos[I], ':');
         if LSlTipoContatos[0] = 'email' then
         begin
            Self.FQyEMails.SQL.Text := Format(SQL_GET_EMAILS, [LSPessoas, 'IN', '(' + LSlTipoContatos[1] + ')']);
            Break;
         end;         
      end;
   end;


   try
      try
         Self.FQyEMails.Close;
         Self.FQyEMails.Open;
         // percorre todos os emails encontrados para os destinatários da mensagem
         while not Self.FQyEMails.Eof do
         begin
            // adiciona o destino
            if LICodPessoa <> Self.FQyEMails.FieldByName('cd_pessoa').AsInteger then
            begin
               Self.FUMListaDestino.Add(
                  TUMDestinatario.Create(
                     Self.FQyEMails.FieldByName('cd_pessoa').AsInteger,
                     Self.FQyEMails.FieldByName('nm_pessoa').AsString));
            end;
            // adiciona o email ao objeto do destinatário
            TUMDestinatario(Self.FUMListaDestino.Last).AddEMail(
               Self.FQyEMails.FieldByName('ds_contato').AsString,
               Self.FQyEMails.FieldByName('cd_contato').AsInteger
            );

            LSlPessoas.Sort;
            if(LSlPessoas.Find(Self.FQyEMails.FieldByName('cd_pessoa').AsString, LIndice))then
            begin
               for i := 0 to TStringList(LSlPessoas.Objects[LIndice]).Count - 1 do
               begin
                  TUMDestinatario(Self.FUMListaDestino.Last).AddChave(TStringList(LSlPessoas.Objects[LIndice]).Strings[i]);
               end;
            end;

            LICodPessoa := Self.FQyEMails.FieldByName('cd_pessoa').AsInteger;
            Self.FQyEMails.Next;
         end;
      except
         // trata o erro e salva em log
         on E: Exception do
         begin
            erro := Format(LOG_ERRO_GET_EMAILS, [LSPessoas, E.Message]);
            Self.FUMSvcRecados.Log.log(erro);
         end;
      end;
   finally
      Self.FQyEMails.Close;
   end;
   LSlPessoas.Free;
end;

{ Construtor.
}
constructor TUMRecado.Create(AUMSvcRecados: TUMSvcRecados; const AICodigo,
  AIIntervalo, AICodOrigem, AICodDestino: integer;
  const ASSQL, ASAssunto, ASMsgEMail, ASMsgRecado, ASListaTiposContatos: string;
  const AUMTipoRecadoSet: TUMTipoRecadoSet);
begin
   Self.FUMSvcRecados := AUMSvcRecados;
   Self.FICodigo := AICodigo;
   Self.FICodOrigem := AICodOrigem;
   Self.FICodDestino := AICodDestino;
   Self.FIIntervalo := AIIntervalo;
   Self.FSSQL := ASSQL;
   Self.FSAssunto := ASAssunto;
   Self.FSMsgEMail := ASMsgEMail;
   Self.FSMsgRecado := ASMsgRecado;
   Self.FSListaTiposContatos := ASListaTiposContatos;
   Self.FUMTipoRecadoSet := AUMTipoRecadoSet;
   
   Self.FUMListaEnvios := TObjectList.Create;
   Self.FUMListaDestino := TObjectList.Create;

   Self.FQyLastInsertID := self.FUMSvcRecados.UMConn.newROQuery;
   Self.FQYInsEnvio := Self.FUMSvcRecados.UMConn.newQuery;
   Self.FQyEMails := Self.FUMSvcRecados.UMConn.newROQuery;
   Self.FQySQL := Self.FUMSvcRecados.UMConn.newROQuery;

   Self.FQyLastInsertID.ParamCheck := False;
   Self.FQYInsEnvio.ParamCheck := True;
   Self.FQyEMails.ParamCheck := False;
   Self.FQySQL.ParamCheck := False;

   Self.FQyLastInsertID.SQL.Text := SQL_LAST_INSERT_ID;
   Self.FQYInsEnvio.SQL.Text := SQL_INSERE_ENVIO;
   Self.FQySQL.SQL.Text := Self.FSSQL;
end;

{ Destrutor.
}
destructor TUMRecado.Destroy;
var
   i: integer;
begin
   Self.FUMSvcRecados := nil;
   Self.FQySQL.Free;
   Self.FQyEMails.Free;
   Self.FQYInsEnvio.Free;
   Self.FQyLastInsertID.Free;
   for i := Self.FUMListaEnvios.Count - 1 downto 0 do
   begin
      TUMRecadoEnvio(Self.FUMListaEnvios.Items[i]).Free;
   end;
   Self.FUMListaEnvios.Free;
   for i := Self.FUMListaDestino.Count - 1 downto 0 do
   begin
      TUMDestinatario(Self.FUMListaDestino.Items[i]).Free;
   end;
   Self.FUMListaDestino.Free;
   inherited;
end;

{ Processa o envio do recado.
}
function TUMRecado.Envia: boolean;
var
   erro: LogErro;
   qyExecutaPreSQL, qyPreSQL: TUMZQuery;
begin
   Result := True;
   // verifica se é hora de enviar o recado
   if Self.Enviar then
   begin
      Self.FUMSvcRecados.LogaSvc(IntToStr(Self.FICodigo));

      //Executa o me_pre_sql
      qyPreSQL := Self.FUMSvcRecados.UMConn.newQuery;

      qyPreSQL.SQL.Text := ' SELECT me_pre_sql FROM svc_recados WHERE cd_recado = :cd_recado';
      qyPreSQL.ParamByName('cd_recado').AsInteger := Self.FICodigo;

      qyPreSQL.Open;

      if qyPreSQL.FieldByName('me_pre_sql').asString <> '' then
      begin
         qyExecutaPreSQL := Self.FUMSvcRecados.UMConn.newQuery;

         qyExecutaPreSQL.SQL.Text := qyPreSQL.FieldByName('me_pre_sql').asString;

         qyExecutaPreSQL.ExecSQL;
      end;

	  // carrega a lista de destinatários do recado
      Self.CarregaListaDestino;

      // Se a lista de destinos for vazia, não precisamos tentar enviar e-mail... e nem registrar uma nova execução
      if Self.FUMListaDestino.Count = 0 then
      begin
         Result := True;
         Exit;
      end;

      // insere o envio na base de dados ...
      Self.FQYInsEnvio.ParamByName('cd_recado').AsInteger := Self.FICodigo;
      Self.FQYInsEnvio.ParamByName('tp_recado').AsString := Self.GetTipoRecado;
      try
         Self.FQYInsEnvio.ExecSQL;
      except
         on E: Exception do
         begin
            erro := Format(LOG_ERRO_INSERE_ENVIO, [Self.FICodigo, Self.GetTipoRecado, E.Message]);
            Self.FUMSvcRecados.Log.log(erro);
            Exit;
         end;
      end;

      // ... e na lista de envios
      Self.FUMListaEnvios.Add(
         TUMRecadoEnvio.Create(
            Self,
            Self.FUMTipoRecadoSet,
            Self.GetLastInsertID,
            Self.FICodOrigem,
            Self.FICodDestino,
            Now));

      // verifica o tipo do recado
      if trRecadoOL in Self.FUMTipoRecadoSet then
      begin
         // envia recados online
         Result := Result and Self.EnviaRecado;
      end;
      if trEMail in Self.FUMTipoRecadoSet then
      begin
         // envia emails
         Result := Result and Self.EnviaEMail;
      end;
   end;
end;

{ Processa o envio de emails para os destinatários.
}
function TUMRecado.EnviaEMail: boolean;
var
   i, c, destCounter: integer;
begin
   Self.SvcRecados.ReloadDadosSMTP();

   // verifica se a mensagem utiliza variáveis
   if Self.UsaVars(Self.FSMsgEMail) then
   begin
      destCounter := 0;
      for i := 0 to Self.FUMListaDestino.Count - 1 do
      begin
         for c := 0 to TUMDestinatario(Self.FUMListaDestino.Items[i]).ChaveCount - 1 do
         begin
            if (destCounter >= FUMSvcRecados.SMTP.Limite) and (FUMSvcRecados.SMTP.Limite > 0) then
            begin
               FUMSvcRecados.SMTP.Pausa;
               destCounter := 0;
            end;
            // processa o envio destino à destino substituindo as variáveis
            Result :=
               TUMRecadoEnvio(Self.FUMListaEnvios.Last).Envia(
                  trEMail,
                  TUMDestinatario(Self.FUMListaDestino.Items[i]),
                  Self.SubstVars(TUMDestinatario(Self.FUMListaDestino.Items[i]).Chaves[c], Self.FSMsgEMail),
                  TUMDestinatario(Self.FUMListaDestino.Items[i]).Chaves[c]);
            if Result then
               Inc(destCounter, TUMDestinatario(Self.FUMListaDestino.Items[i]).EMailCount);
         end;
      end;
   end
   // não usa variáveis na mensagem...
   // envia a mesma mensagem para todos os destinatários
   else
   begin
      Result :=
         TUMRecadoEnvio(Self.FUMListaEnvios.Last).Envia(trEMail, Self.FUMListaDestino, Self.FSMsgEMail, 'SemChaveEMailOuRecadoSemVariavel');
   end;
end;

{ Verifica se está na hora de processar o envio.
}
function TUMRecado.Enviar: boolean;
begin
   Result :=
      (Self.FUMListaEnvios.Count = 0) or
      (Now >= IncMinute(TUMRecadoEnvio(Self.FUMListaEnvios.Last).Envio, Self.FIIntervalo));
end;

{ Processa o envio dos recados para os destinatários.
}
function TUMRecado.EnviaRecado: boolean;
var
   i, c: integer;
begin
   // verifica se a mensagem utiliza variáveis...
   if Self.UsaVars(Self.FSMsgRecado) then
   begin
      for i := 0 to Self.FUMListaDestino.Count - 1 do
      begin
         // substituí as variáveis na mensagem e processa o envio
         for c := 0 to TUMDestinatario(Self.FUMListaDestino.Items[i]).ChaveCount - 1 do
         begin
         Result :=
            TUMRecadoEnvio(Self.FUMListaEnvios.Last).Envia(
               trRecadoOL,
               TUMDestinatario(Self.FUMListaDestino.Items[i]),
               Self.SubstVars(TUMDestinatario(Self.FUMListaDestino.Items[i]).Chaves[c], Self.FSMsgRecado),
               TUMDestinatario(Self.FUMListaDestino.Items[i]).Chaves[c]);
         end;
      end;
   end
   // não usa variáveis na mensagem
   else
   begin
      // processa o envio em massa
      Result :=
         TUMRecadoEnvio(Self.FUMListaEnvios.Last).Envia(trRecadoOL, Self.FUMListaDestino, Self.FSMsgRecado, '');
   end;
end;

{ Pega o ano/semestre do envio. Utilizado para inserir os recados online.
}
function TUMRecado.GetAnoSemestre: integer;
begin
   Result := Self.FQySQL.FieldByName('nr_anosemestre').AsInteger;
end;

{ Pega o objeto de envio na lista de envios do recado na posição i.
}
function TUMRecado.GetEnvio(const i: integer): TUMRecadoEnvio;
begin
   Result := TUMRecadoEnvio(Self.FUMListaEnvios.Items[i]);
end;

{ Retorna a quantidade total de envios efetuados para este recado.
}
function TUMRecado.GetEnvioCount: integer;
begin
   Result := Self.FUMListaEnvios.Count;
end;

{ Pega o valor da última Primary Key inserida na base de dados.
}
function TUMRecado.GetLastInsertID: integer;
var
   erro: LogErro;
begin
   Result := 0;
   try
      try
         Self.FQyLastInsertID.Open;
         Result := Self.FQyLastInsertID.Fields[0].AsInteger;
      except
         on E: Exception do
         begin
            erro := Format(LOG_ERRO_GET_ULTIMO_ENVIO, [E.Message]);
            Self.FUMSvcRecados.Log.log(erro);
         end;
      end;
   finally
      Self.FQyLastInsertID.Close;
   end;
end;

{ Converte o tipo de recado para string.
}
function TUMRecado.GetTipoRecado: string;
begin
   if [trRecadoOL, trEMail] = Self.FUMTipoRecadoSet then
      Result := '3'
   else if trEMail in Self.FUMTipoRecadoSet then
      Result := '2'
   else if trRecadoOL in Self.FUMTipoRecadoSet then
      Result := '1';
end;

{ Pega o último objeto de envio efetuado.
}
function TUMRecado.GetUltimoEnvio: TUMRecadoEnvio;
begin
   Result := TUMRecadoEnvio(Self.FUMListaEnvios.Last);
end;

procedure TUMRecado.LimpaListaDestinos;
var
   i: integer;
begin
   for i := Self.FUMListaDestino.Count - 1 downto 0 do
   begin
      TUMDestinatario(Self.FUMListaDestino.Extract(Self.FUMListaDestino.Items[i])).Free;
   end;
end;

{ Efetua a substituição das variáveis na mensagem.
}
function TUMRecado.SubstVars(const ASChave: string;
  const ASMsg: string): string;
var
   i: integer;
begin
   Result := ASMsg;
   if Self.FQySQL.Locate('ds_chave', ASChave, []) then
   begin
      for i := 0 to Self.FQySQL.FieldCount - 1 do
      begin
         Result :=
            StringReplace(
               Result, VAR_BEGIN + Self.FQySQL.Fields[i].FieldName + VAR_END,
               Self.FQySQL.Fields[i].AsString, [rfReplaceAll, rfIgnoreCase]);
      end;
   end;
end;

{ Verifica se a mensagem utiliza variáveis. 
}
function TUMRecado.UsaVars(const ASMsg: string): boolean;
begin
   Result := (AnsiPos(VAR_BEGIN, ASMsg) <> 0) and (AnsiPos(VAR_END, ASMsg) <> 0);
end;

{ TUMListaRecado }

function TUMListaRecado.Add(AUMRecado: TUMRecado): Integer;
begin
   Result := inherited Add(AUMRecado);
end;

constructor TUMListaRecado.Create;
begin
   inherited;
end;

destructor TUMListaRecado.Destroy;
var
   i: integer;
begin
   for i := Self.Count - 1 downto 0 do
   begin
      Self.Items[i].Free;
   end;
   inherited;
end;

function TUMListaRecado.Extract(Item: TUMRecado): TUMRecado;
begin
   Result := TUMRecado(inherited Extract(Item));
end;

function TUMListaRecado.First: TUMRecado;
begin
   Result := TUMRecado(inherited First);
end;

function TUMListaRecado.GetItem(Index: Integer): TUMRecado;
begin
   Result := TUMRecado(inherited GetItem(Index));
end;

function TUMListaRecado.IndexOf(AUMRecado: TUMRecado): Integer;
begin
   Result := inherited IndexOf(AUMRecado);
end;

procedure TUMListaRecado.Insert(Index: Integer; AUMRecado: TUMRecado);
begin
   inherited Insert(Index, AUMRecado);
end;

function TUMListaRecado.Last: TUMRecado;
begin
   Result := TUMRecado(inherited Last);
end;

function TUMListaRecado.Remove(AUMRecado: TUMRecado): Integer;
begin
   Result := inherited Remove(AUMRecado);
end;

procedure TUMListaRecado.SetItem(Index: Integer; AUMRecado: TUMRecado);
begin
   inherited SetItem(Index, AUMRecado);
end;

{ TUMEMail }

{ Verifica se a lista de destinatários atingiu o limite.
}
function TUMEMail.AtingiuLimite: boolean;
begin
   Result := (Self.FILimite <= Self.FIdMessage.Recipients.Count) and (Self.FILimite > 0);
end;

{ Construtor.
}
constructor TUMEMail.Create(const ASServidor, ASUsuario, ASSenha, ASRemetente,
  ASNome, ASDominio, ASOrganizacao: string; const AIIntervalo,
  AILimite, AIPorta: integer; const ABAutentica, ABUsaTLS, ABUsaSSL: boolean);
begin
   Self.FSServidor := ASServidor;
   Self.FSUsuario := ASUsuario;
   Self.FSSenha := ASSenha;
   Self.FSRemetente := ASRemetente;
   Self.FSNome := ASNome;
   Self.FSDominio := ASDominio;
   Self.FSOrganizacao := ASOrganizacao;
   Self.FSTexto := Self.FSNome + ' <' + Self.FSRemetente + '>';
   Self.FIIntervalo := AIIntervalo;
   Self.FILimite := AILimite;
   Self.FBAutentica := ABAutentica;
   Self.FBUsaTLS := ABUsaTLS;
   Self.FBUsaSSL := ABUsaSSL;

   Self.FIdSMTP := TIdSMTP.Create;
   Self.FIdSMTP.Host := Self.FSServidor;
   Self.FIdSMTP.Username := Self.FSUsuario;
   Self.FIdSMTP.Password := Self.FSSenha;

   if Self.FBAutentica then
   begin
      Self.FIdSASLLogin := TIdSASLLogin.Create;

      Self.FIdUserPassProvider := TIdUserPassProvider.Create;
      Self.FIdUserPassProvider.Password := Self.FSSenha;
      
      Self.FIdSASLPlain := TIdSASLPlain.Create;
      Self.FIdSASLPlain.LoginAs := Self.FSUsuario;
      Self.FIdSASLPlain.UserPassProvider := Self.FIdUserPassProvider;

      Self.FIdSMTP.SASLMechanisms := TIdSASLEntries.Create(nil);
      Self.FIdSMTP.SASLMechanisms.Add.SASL := Self.FIdSASLLogin;
      Self.FIdSMTP.SASLMechanisms.Add.SASL := Self.FIdSASLPlain;
      Self.FIdSMTP.AuthType := IdSMTP.atSASL;
      Self.FIdSMTP.MailAgent := Self.FSServidor;
   end;

   if AIPorta = 0 then
      Self.FIdSMTP.Port := 25
   else
      Self.FIdSMTP.Port := AIPorta;

   if Self.FBUsaTLS or Self.FBUsaSSL then
   begin
      Self.FIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
      Self.FIdSSLIOHandlerSocketOpenSSL.DefaultPort := 0;
      Self.FIdSSLIOHandlerSocketOpenSSL.Host := Self.FSServidor;
      Self.FIdSSLIOHandlerSocketOpenSSL.Port := Self.FIdSMTP.Port;
      Self.FIdSSLIOHandlerSocketOpenSSL.MaxLineAction := maException;

      Self.FIdSMTP.IOHandler := Self.FIdSSLIOHandlerSocketOpenSSL;
      if Self.FBUsaTLS then
      begin
         Self.FIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1;
         Self.FIdSMTP.UseTLS := utUseExplicitTLS;
      end
      else
      begin
         Self.FIdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvSSLv3;
         Self.FIdSMTP.UseTLS := utNoTLSSupport;
      end;
      Self.FIdSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := sslmUnassigned;
   end;

   Self.FIdMessage := TIdMessage.Create;
   Self.FIdMessage.AttachmentEncoding := SMTP_ATTACH_ENCONDING;
   Self.FIdMessage.ContentType := SMTP_CONTENT_TYPE;
   Self.FIdMessage.Encoding := meMIME;
   Self.FIdMessage.ConvertPreamble := True;
   Self.FIdMessage.Organization := Self.FSOrganizacao;
   Self.FIdMessage.From.Address := Self.FSRemetente;
   Self.FIdMessage.From.Name := Self.FSNome;
   Self.FIdMessage.From.Text := Self.FSTexto;
   Self.FIdMessage.From.Domain := Self.FSDominio;
   Self.FIdMessage.From.User := TFuncString.splitString(FSRemetente, '@', 0);
   Self.FIdMessage.Sender.Address := Self.FSRemetente;
   Self.FIdMessage.Sender.Name := Self.FSNome;
   Self.FIdMessage.Sender.Text := Self.FSTexto;
   Self.FIdMessage.Sender.Domain := Self.FSDominio;
   Self.FIdMessage.Sender.User := Self.FIdMessage.From.User;

   with Self.FIdMessage.FromList.Add do
   begin
      Address := Self.FSRemetente;
      Name := Self.FSNome;
      Text := Self.FSTexto;
      Domain := Self.FSDominio;
      User := Self.FIdMessage.From.User;
   end;

   with Self.FIdMessage.ReplyTo.Add do
   begin
      Address := Self.FSRemetente;
      Name := Self.FSNome;
      Text := Self.FSTexto;
      Domain := Self.FSDominio;
      User := Self.FIdMessage.Sender.User;;
   end;
end;

{ Destrutor.
}
destructor TUMEMail.Destroy;
begin
   Self.FIdMessage.Free;
   if Self.FIdSMTP.Connected then
      Self.FIdSMTP.Disconnect;
   if Assigned(Self.FIdSASLLogin) then
      Self.FIdSASLLogin.Free;
   if Assigned(Self.FIdSASLPlain) then
      Self.FIdSASLPlain.Free;
   if Assigned(Self.FIdUserPassProvider) then
      Self.FIdUserPassProvider.Free;
   if Assigned(Self.FIdSSLIOHandlerSocketOpenSSL) then
      Self.FIdSSLIOHandlerSocketOpenSSL.Free;
   Self.FIdSMTP.Free;
   inherited;
end;

{ Processa o envio dos emails para vários destinatários.
}
procedure TUMEMail.Envia(const AUMListaDestinos: TUMListaDestino; const ASMsg,
  ASAssunto: string);
var
   i, j: integer;
begin
   try
      // tenta estabelecer conexão com o servidor SMTP
      if not Self.FIdSMTP.Connected then
         Self.FIdSMTP.Connect;
      if Self.FIdSMTP.Connected and ((not Self.FBAutentica) or Self.FIdSMTP.Authenticate) then
      begin
         Self.FIdMessage.Recipients.Clear;     // limpa a lista de destinatários
         Self.FIdMessage.Subject := ASAssunto; // define o assunto do email
         Self.FIdMessage.Body.Text := ASMsg;   // define a mensagem do email
         // percorre a lista de destinatários
         for i := 0 to AUMListaDestinos.Count - 1 do
         begin
            // para cada destinatários percorre a lista de emails
            for j := 0 to TUMDestinatario(AUMListaDestinos.Items[i]).EMailCount - 1 do
            begin
               if NOT(TUMDestinatario(AUMListaDestinos.Items[i]).EmailsValido[j]) then
                  continue;

               // adiciona o endereço de email à lista de recipientes da mensagem
               with Self.FIdMessage.Recipients.Add do
               begin
                  Address := TUMDestinatario(AUMListaDestinos.Items[i]).EMails[j];
                  Name := TUMDestinatario(AUMListaDestinos.Items[i]).NomePessoa;
               end;
               // verifica se atingiu o limite de destinatários da mensagem...
               if Self.AtingiuLimite then
               begin
                  try
                     if Self.FIdMessage.Recipients.Count > 0 then
                     begin
                        // ...processa o envio...
                        Self.FIdSMTP.Send(Self.FIdMessage);
                     end;
                  except
                     on E: Exception do
                     begin
                        raise EUMEMailError.Create(Format(LOG_ERRO_SMTP_ENVIO, [E.Message]));
                     end;
                  end;
                  // ...e limpa a lista de recipientes para o próximo envio
                  Self.FIdMessage.Recipients.Clear;
                  Self.Pausa;
               end;
            end;
         end;
         // se ainda há destinatários para a mensagem ...
         if Self.FIdMessage.Recipients.Count > 0 then
         begin
            try
               // ...então processa o envio
               Self.FIdSMTP.Send(Self.FIdMessage);
            except
               on E: Exception do
               begin
                  raise EUMEMailError.Create(Format(LOG_ERRO_SMTP_ENVIO, [E.Message]));
               end;
            end;
            // limpa a lista de recipientes da mensagem
            Self.FIdMessage.Recipients.Clear;
            Self.Pausa;
         end;
         // disconecta do servidor SMTP
         Self.FIdSMTP.Disconnect;
      end
      else
      begin
         // não foi possível estabelecer conexão
         raise EUMEMailError.Create(LOG_SMTP_SEM_CONEXAO);
      end;
   except
      on E: Exception do
      begin
         // erro na tentativa de estabelecer conexão
         raise EUMEMailError.Create(Format(LOG_ERRO_SMTP_CONEXAO, [E.Message]));
      end;
   end;
end;

{ Processa o envio do email para apenas um destinatário.
}
procedure TUMEMail.Envia(const AUMDestinatario: TUMDestinatario; const ASMsg,
  ASAssunto: string);
var
   i: integer;
begin
   try
      // tenta estabelecer conexão com o servidor SMTP
      if not Self.FIdSMTP.Connected then
         Self.FIdSMTP.Connect;
      if Self.FIdSMTP.Connected then
      begin
         // configura a mensagem
         Self.FIdMessage.Recipients.Clear;
         Self.FIdMessage.Subject := ASAssunto;
         Self.FIdMessage.Body.Text := ASMsg;
         // percorre de emails cadastrados para o destinatário
         for i := 0 to AUMDestinatario.EMailCount - 1 do
         begin
            if NOT(AUMDestinatario.EmailsValido[i]) then
               continue;

            // adiciona o email à lista de destinatários da mensagem
            with Self.FIdMessage.Recipients.Add do
            begin
               Address := AUMDestinatario.EMails[i];
               Name := AUMDestinatario.NomePessoa;
            end;
            // verifica se atingiu o limite de destinos por envio
            if Self.AtingiuLimite then
            begin
               try
                  if Self.FIdMessage.Recipients.Count > 0 then
                  begin
                     // tenta processar o envio
                     Self.FIdSMTP.Send(Self.FIdMessage);
                  end;
               except
                  on E: Exception do
                  begin
                     raise EUMEMailError.Create(Format(LOG_ERRO_SMTP_ENVIO, [E.Message]));
                  end;
               end;
               // limpa a lista de recipientes da mensagem para processar o próximo envio
               Self.FIdMessage.Recipients.Clear;
               Self.Pausa;
            end;
         end;
         // verifica se há destinatários a receber a mensagem
         if Self.FIdMessage.Recipients.Count > 0 then
         begin
            try
               // tenta processar o envio
               Self.FIdSMTP.Send(Self.FIdMessage);
            except
               on E: Exception do
               begin
                  raise EUMEMailError.Create(Format(LOG_ERRO_SMTP_ENVIO, [E.Message]));
               end;
            end;
            if AtingiuLimite then Pausa;
            // limpa a lista de recipientes
            Self.FIdMessage.Recipients.Clear;
         end;
         Self.FIdSMTP.Disconnect;
      end
      else
      begin
         // não foi possível estabelecer conexão
         raise EUMEMailError.Create(LOG_SMTP_SEM_CONEXAO);
      end;
   except
      on E: Exception do
      begin
         raise EUMEMailError.Create(Format(LOG_ERRO_SMTP_CONEXAO, [E.Message]));
      end;
   end;
end;

{ Processa o intervalo entre os envios.
}
procedure TUMEMail.Pausa;
begin
   Sleep(Self.FIIntervalo * 60 * 1000);
end;

{ TUMRecadoOL }

{ Construtor.
}
constructor TUMRecadoOL.Create(AUMSvcRecados: TUMSvcRecados);
begin
   Self.FQyInsRecado := AUMSvcRecados.UMConn.newQuery;
   Self.FQyInsRecPessoa := AUMSvcRecados.UMConn.newQuery;
   Self.FQyLastInsertID := AUMSvcRecados.UMConn.newROQuery;

   Self.FQyInsRecado.ParamCheck := True;
   Self.FQyInsRecPessoa.ParamCheck := True;
   Self.FQyLastInsertID.ParamCheck := False;

   Self.FQyInsRecado.SQL.Text := SQL_INSERE_REC_RECADO;
   Self.FQyInsRecPessoa.SQL.Text := SQL_INSERE_REC_PESSOA;
   Self.FQyLastInsertID.SQL.Text := SQL_LAST_INSERT_ID;
end;

{ Destrutor.
}
destructor TUMRecadoOL.Destroy;
begin
   Self.FQyInsRecado.Free;
   Self.FQyInsRecPessoa.Free;
   Self.FQyLastInsertID.Free;
   inherited;
end;

{ Processa o envio dos recados online para várias pessoas.
}
procedure TUMRecadoOL.Envia(const AUMListaDestinos: TUMListaDestino;
  const AIAnoSem: integer);
var
   i: integer;
   erro: LogErro;
begin
   // percorre a lista de destinatários
   for i := 0 to AUMListaDestinos.Count - 1 do
   begin
      Self.FQyInsRecPessoa.ParamByName('cd_pessoa').AsInteger :=
         TUMDestinatario(AUMListaDestinos.Items[i]).CodPessoa;
      Self.FQyInsRecPessoa.ParamByName('cd_recado').AsInteger := Self.FICodigo;
      Self.FQyInsRecPessoa.ParamByName('nr_anosemestre').AsInteger := AIAnoSem;
      try
         // insere o recado na base de dados para cada destinatário
         Self.FQyInsRecPessoa.ExecSQL;
      except
         on E: Exception do
         begin
            erro := Format(
               LOG_ERRO_REC_INSERE_PESSOA,
               [TUMDestinatario(AUMListaDestinos.Items[i]).CodPessoa, AIAnoSem, Self.FICodigo, E.Message]);
            raise EUMRecadoOLError.Create(erro);
         end;
      end;
   end;
end;

{ Processa o envio do recado online apenas para um único destinatário.
}
procedure TUMRecadoOL.Envia(const AUMDestinatario: TUMDestinatario;
  const AIAnoSem: integer);
var
   erro: LogErro;
begin
   Self.FQyInsRecPessoa.ParamByName('cd_pessoa').AsInteger := AUMDestinatario.CodPessoa;
   Self.FQyInsRecPessoa.ParamByName('cd_recado').AsInteger := Self.FICodigo;
   Self.FQyInsRecPessoa.ParamByName('nr_anosemestre').AsInteger := AIAnoSem;
   try
      // insere o recado na base de dados
      Self.FQyInsRecPessoa.ExecSQL;
   except
      on E: Exception do
      begin
         erro := Format(LOG_ERRO_REC_INSERE_PESSOA, [AUMDestinatario.CodPessoa, AIAnoSem, Self.FICodigo, E.Message]);
         raise EUMRecadoOLError.Create(erro);
      end;
   end;
end;

{ Pega o código do último recado online inserido na base de dados.
}
function TUMRecadoOL.GetLastInsertID: integer;
begin
   try
      try
         Self.FQyLastInsertID.Open;
      except
         on E: Exception do
         begin
            raise EUMRecadoOLError.Create(Format(LOG_ERRO_GET_ULTIMO_RECADO, [E.Message]));
         end;
      end;
      Result := Self.FQyLastInsertID.Fields[0].AsInteger;
   finally
      Self.FQyLastInsertID.Close;
   end;
end;

{ Insere o novo recado na base de dados.
}
procedure TUMRecadoOL.NovoRecado;
begin
   Self.FQyInsRecado.ParamByName('ds_recado').AsString := Self.FSRecado;
   Self.FQyInsRecado.ParamByName('cd_origem').AsInteger := Self.FICodOrigem;
   Self.FQyInsRecado.ParamByName('cd_destino').AsInteger := Self.FICodDestino;
   try
      Self.FQyInsRecado.ExecSQL;
   except
      on E: Exception do
      begin
         raise EUMRecadoOLError.Create(Format(LOG_ERRO_GET_ULTIMO_RECADO, [E.Message]));
      end;
   end;
   Self.FICodigo := Self.GetLastInsertID;
end;

{ Cria novo recado.
}
procedure TUMRecadoOL.SetRecado(const ASRecado: string;
   const AICodOrigem, AICodDestino: integer);
begin
   Self.FSRecado := ASRecado;
   Self.FICodOrigem := AICodOrigem;
   Self.FICodDestino := AICodDestino;
   Self.NovoRecado;
end;

{ TUMSvcRecados }

procedure TUMSvcRecados.AdicionaRecado(const AICodigo, AIIntervalo, AICodOrigem,
  AICodDestino: integer; const ASSQL, ASAssunto, ASMsgEMail,
  ASMsgRecado, ASListaTiposContatos: string; const AUMTipoRecadoSet: TUMTipoRecadoSet);
var
   I: integer;
   LBAchou: boolean;
begin
   LBAchou := false;
   for I := 0 to Self.FUMListaRecado.Count - 1 do
   begin
      if TUMRecado(Self.FUMListaRecado.Items[I]).Codigo = AICodigo then
      begin
         LBAchou := true;
         Break;
      end;
   end;
   if not LBAchou then
      Self.FUMListaRecado.Add(
         TUMRecado.Create(
            Self, AICodigo, AIIntervalo, AICodOrigem, AICodDestino, ASSQL,
            ASAssunto, ASMsgEMail, ASMsgRecado, ASListaTiposContatos, AUMTipoRecadoSet
         )
      );
end;

{ Carrega os recados da base de dados.
}
function TUMSvcRecados.CarregaRecados: boolean;
begin
   Result := True;
   try
      try
         // tenta resgatar os recados na base de dados
         Self.FQyRecados.Open;
      except
         on E: Exception do
         begin
            Result := False;
            Self.Log.log(Format(LOG_ERRO_GET_RECADOS, [E.Message]));
         end;
      end;

      Self.Log.log('Carregando Recados', true);
      // percorre a lista de recados
      while not Self.FQyRecados.Eof do
      begin
         Self.AdicionaRecado(
            Self.FQyRecados.FieldByName('cd_recado').AsInteger,
            Self.FQyRecados.FieldByName('nr_intervalo').AsInteger,
            Self.FQyRecados.FieldByName('cd_origem').AsInteger,
            Self.FQyRecados.FieldByName('cd_destino').AsInteger,
            Self.FQyRecados.FieldByName('me_sql').AsString,
            Self.FQyRecados.FieldByName('ds_assunto').AsString,
            Self.FQyRecados.FieldByName('me_msg_email').AsString,
            Self.FQyRecados.FieldByName('me_msg_recado').AsString,
            Self.FQyRecados.FieldByName('ds_lista_tipos_contatos').AsString,
            StrToTipoRecadoSet[Self.FQyRecados.FieldByName('tipo_recado').AsString[1]]);
         Self.FQyRecados.Next;
      end;
   finally
      Self.FQyRecados.Close;
   end;
end;

{ Construtor.
}
constructor TUMSvcRecados.Create;
begin
   inherited;
end;

procedure TUMSvcRecados.GetDadosSMTP;
var
   LBUsaTLS, LBUsaSSL, LBAutentica: boolean;
   LIIntervalo, LILimite, LIPorta: integer;
   LSServidor, LSUsuario, LSSenha, LSRemetente, LSNome, LSDominio,
   LSOrganizacao, LSAux: string;
begin
   try
      if NOT(Self.FQyDadosSMTP.State in [dsBrowse]) OR (Self.FQyDadosSMTP.RecordCount = 0) then
         Self.FQyDadosSMTP.Open;

      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.servidor', []) then
         LSServidor := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSServidor := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.usuario', []) then
         LSUsuario := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSUsuario := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.senha', []) then
         LSSenha := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSSenha := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.remetente', []) then
         LSRemetente := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSRemetente := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.nome', []) then
         LSNome := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSNome := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.dominio', []) then
         LSDominio := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSDominio := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.organizacao', []) then
         LSOrganizacao := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString
      else
         LSOrganizacao := '';
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.intervalo', []) then
         try
            LSAux := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString;
            LIIntervalo := StrToInt(LSAux);
         except
            on Exception do
               LIIntervalo := 0;
         end
      else
         LIIntervalo := 0;
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.limite', []) then
         try
            LSAux := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString;
            LILimite := StrToInt(LSAux);
         except
            on Exception do
               LILimite := 0;
         end
      else
         LILimite := 0;
      if Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.porta', []) then
         try
            LSAux := Self.FQyDadosSMTP.FieldByName('ds_valor').AsString;
            LIPorta := StrToInt(LSAux);
         except
            on Exception do
               LIPorta := 25
         end
      else
         LIPorta := 25;
      LBUsaTLS :=
         Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.usatls', []) and
         (Self.FQyDadosSMTP.FieldByName('ds_valor').AsString = '1');
      LBUsaSSL :=
         Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.usassl', []) and
         (Self.FQyDadosSMTP.FieldByName('ds_valor').AsString = '1');
      LBAutentica :=
         Self.FQyDadosSMTP.Locate('ds_parametro', 'smtp.autenticacao', []) and
         (Self.FQyDadosSMTP.FieldByName('ds_valor').AsString = '1');
      Self.FQyDadosSMTP.Close;

      if Self.FUMEMail <> nil then
         FreeAndNil(Self.FUMEMail);

      Self.FUMEMail :=
         TUMEMail.Create(LSServidor, LSUsuario, LSSenha, LSRemetente, LSNome,
            LSDominio, LSOrganizacao, LIIntervalo, LILimite, LIPorta,
            LBAutentica, LBUsaTLS, LBUsaSSL);
   except
      on E: Exception do
         Self.Log.log(Format(LOG_ERRO_GET_SMTP, [E.Message]));
   end;
end;

{ Carrega o serviço.
}
procedure TUMSvcRecados.onLoadServico;
begin
   // tenta estabelecer conexão com o banco de dados
   Self.FUMConn := TUMConexao.Create;
   if not Self.FUMConn.Conectar(Self.Config, 'Conexao', false) then
   begin
      Self.Log.log(Format(LOG_ERRO_CONEXAO, [Self.FUMConn.LastErro]));
   end
   else
   begin
      Self.Log.log('Conectado com sucesso.' + #13 + Self.Config.FileName + #13  +
         self.Config.ReadString( 'Conexao', 'banco', '')
      , true);

      // cria objeto responsável pelo envio dos recados
      Self.FUMRecadoOL := TUMRecadoOL.Create(Self);
      // cria objeto para armazenamento dos recados, envios e destinos
      Self.FUMListaRecado := TUMListaRecado.Create;

      // configura a query
      Self.FQyDadosSMTP := Self.FUMConn.newROQuery;
      Self.FQyDadosSMTP.ParamCheck := false;
      Self.FQyDadosSMTP.SQL.Text := SQL_GET_PARAMS_SMTP;

      Self.FQyRecados := Self.FUMConn.newROQuery;
      Self.FQyRecados.ParamCheck := False;
      Self.FQyRecados.SQL.Text := SQL_GET_RECADOS;
   end;
end;

procedure TUMSvcRecados.tentaReconectar;
begin

   Self.FUMConn.Conn.Disconnect;
   Self.FUMConn.Conn.Reconnect;
   Self.FUMConn.Conn.Connect;


   Self.Log.log('Tentando reconectar --> ' + #13 + Self.Config.FileName + #13  +
         self.Config.ReadString( 'Conexao', 'banco', '')
      , true);


end;

{ Descarrega o serviço da memória destruindo todos os seus objetos.
}
procedure TUMSvcRecados.onUnloadServico;
begin
   Self.FUMEMail.Free;
   Self.FUMRecadoOL.Free;
   Self.FUMListaRecado.Free;
   Self.FUMConn.freeROQuery(Self.FQyRecados);
   if Self.FUMConn.Conn.Connected then
      Self.FUMConn.Conn.Disconnect;
   Self.FUMConn.Free;
end;

{ Processa o envio dos recados.
}
function TUMSvcRecados.processa: IUMServiceAppRet;
var
   i: integer;
begin
   Result := srSuccess;

   // carrega os recados da base de dados
   Self.CarregaRecados;
   Self.Log.log('Processando envio ...');
   // percorre a lista de recados
   for i := 0 to Self.FUMListaRecado.Count - 1 do
   begin
      // e processa o envio
      if not Self.FUMListaRecado.Items[i].Envia then
         Result := srError;
   end;
end;

procedure TUMSvcRecados.ReloadDadosSMTP;
begin
   Self.GetDadosSMTP();
end;

procedure TUMSvcRecados.stopProcessamento;
begin
   inherited;
end;

initialization
   // registra a classe para que a rotina de carregamento de serviços possa
   // encontrá-la
   RegisterClass(TUMSvcRecados);

finalization
   UnRegisterClass(TUMSvcRecados);

end.
