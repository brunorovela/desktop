unit EasyInner_DLL;

interface

uses
   TypInfo, Windows, uLkJSON;

function AbrirPortaComunicacao(Porta: Integer): Byte; stdcall; external 'EasyInner.dll';
function AcionarBipCurto(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function AcionarBipIntegero(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function AcionarBipLongo(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function AcionarRele1(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function AcionarRele2(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ApagarHorariosAcesso(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ApagarHorariosSirene(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ApagarListaAcesso(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ApagarMensagensOffLine(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ApagarTodosUsuariosVerid(Inner: Integer; SenhaAdm: String): Byte; stdcall; external 'EasyInner.dll';
function ApagarUsuarioVerid(Inner: Integer; Cartao: String): Byte; stdcall; external 'EasyInner.dll';
function AvisarQuandoMemoriaCheia(Avisa: Byte): Byte; stdcall; external 'EasyInner.dll';
function CartaoMasterLiberaAcesso(Libera: Byte): Byte; stdcall; external 'EasyInner.dll';
function ColetarBilhete(Inner: Integer; Tipo, Dia, Mes, Ano, Hora, Minuto: Pointer; Cartao: PChar): Byte; stdcall; external 'EasyInner.dll';
function CompararDigitalLeitor(Inner: Integer; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function CompararPINVerid(Inner: Integer; Cartao: String): Byte; stdcall; external 'EasyInner.dll';
function CompararTemplateVerid(Inner: Integer; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ConectarModem(Porta: Integer; Str: String; Tom: Integer; Telefone: String; Inner: Integer): Integer; stdcall; external 'EasyInner.dll';
function ConfigurarAcionamento1(Funcao, Tempo: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarAcionamento2(Funcao, Tempo: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarAjustesQualidadeBio(Inner: Integer; Registro, Verificacao: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarAjustesSegurancaBio(Inner: Integer; Identificacao, Verificacao: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarAjustesSensibilidadeBio(Inner: Integer; Ganho, Brilho, Contraste: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarBio(Inner: Integer; HabilitaIdentificacao, HabilitaVerificacao: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarCapturaAdaptativaBio(Inner: Integer; Capturar, Total, Tempo: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarComportamentoIndexSearch(IndexSearch: Integer): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarFiltroBio(Inner: Integer; Habilitar: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarInnerOffLine: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarInnerOnLine: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitor1(Operacao: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitor2(Operacao: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeAcura: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeHIDAbaTrack2: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeMotorolaAbaTrack2: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeSmartCard: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeSmartCardAcura: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeWiegand: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarLeitorProximidadeWiegandFacilityCode: Byte; stdcall; external 'EasyInner.dll';
function ConfigurarRedeVerid(Inner: Integer; Envia, Recebe, BroadCast: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarTipoLeitor(Tipo: Byte): Byte; stdcall; external 'EasyInner.dll';
function ConfigurarWiegandDoisLeitores(Habilita, ExibirMensagem: Byte): Byte; stdcall; external 'EasyInner.dll';
function CriarUsuarioLeitorVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function DefinirCodigoEmpresa(Codigo: Integer): Byte; stdcall; external 'EasyInner.dll';
function DefinirConfiguracaoTecladoOnLine(Digitos, EcoDisplay, Tempo, PosicaoCursor: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirConfiguracoesFuncoes(Funcao, Catraca, Rele1, Rele2, Lista, Biometria: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirEntradasMudancaOffLine(Teclado, Leitor1, Leitor2, Catraca: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirEntradasMudancaOffLineComBiometria(Teclado, Leitor1, Leitor2, Verificacao, identificacao: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirEntradasMudancaOnLine(Entrada: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirEventoSensor(Sensor, Evento, Tempo: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirFormasPictogramasMillenium(Forma: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirFuncaoDefaultLeitoresProximidade(Funcao: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirFuncaoDefaultSensorBiometria(Funcao: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirLogicaRele(Logica: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemApresentacaoEntrada(ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemApresentacaoSaida(ExibirData: Byte;Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemEntradaOffLine(ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemFuncaoOffLine(Mensagem: String; Funcao, Habilitada: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemPadraoMudancaOffLine(ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemPadraoMudancaOnLine(ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemPadraoOffLine(ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirMensagemSaidaOffLine(ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirNivelAcesso(Nivel: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirNumeroCartaoMaster(Master: String): Byte; stdcall; external 'EasyInner.dll';
function DefinirPadraoCartao(Padrao: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirPorcentagemRevista(Porcentagem: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirQuantidadeDigitosCartao(Quantidade: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirTipoConexao(Tipo: Byte): Byte; stdcall; external 'EasyInner.dll';
function DefinirTipoListaAcesso(Tipo: Byte): Byte; stdcall; external 'EasyInner.dll';
function DesabilitarBipCatraca(Desabilita: Byte): Byte; stdcall; external 'EasyInner.dll';
function DesabilitarBloqueioCatracaMicroSwitch(Desabilita: Byte): Byte; stdcall; external 'EasyInner.dll';
function DesabilitarRele1(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function DesabilitarRele2(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function DesligarBackLite(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function DesligarBipIntermitente(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function DesligarLedVermelho(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function DevolverCartao(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarAjustesBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarBufferEventosMudancaAuto(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarBufferTLM(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarComandoAcessoNegado(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarConfiguracoes(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarConfiguracoesFuncoes(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarConfiguracoesMudancaAutomaticaOnLineOffLine(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarFormasEntradasOnLine(Inner: Integer;QtdeDigitosTeclado, EcoTeclado, FormaEntrada, TempoTeclado, PosicaoCursorTeclado: Byte): Byte; stdcall; external 'EasyInner.dll';
function EnviarHorariosAcesso(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarHorariosSirene(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarHorarioVerao(Inner: Integer; DiaInicio, MesInicio, AnoInicio, HoraInicio, MinutoInicio, DiaFim, MesFim, AnoFim, HoraFim, MinutoFim: Byte): Byte; stdcall; external 'EasyInner.dll';
function EnviarListaAcesso(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarListaUsuariosSemDigitalBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarMensagemImpressora00(Inner: Integer; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function EnviarMensagemImpressoraFF(Inner: Integer; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function EnviarMensagemPadraoOnLine(Inner: Integer; ExibirData: Byte; Mensagem: String): Byte; stdcall; external 'EasyInner.dll';
function EnviarMensagemTemporariaOnLine(Inner: Integer; ExibirData: Byte; Mensagem: String; Tempo: Byte): Byte; stdcall; external 'EasyInner.dll';
function EnviarMensagensOffLine(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function EnviarRelogio(Inner: Integer; Dia, Mes, Ano, Hora, Minuto, Segundo: Byte): Byte; stdcall; external 'EasyInner.dll';
function EnviarStringInicializacaoModem(Str: String): Integer; stdcall; external 'EasyInner.dll';
function EnviarUsuarioBio(Inner: Integer; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function FazerIdentificacaoBiometricaBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function FazerVerificacaoBiometricaBio(Inner: Integer; Usuario: String): Byte; stdcall; external 'EasyInner.dll';
function HabilitaMudancaEventoSeta(Habilita: Byte): Byte; stdcall; external 'EasyInner.dll';
function HabilitarCriptografia(Tipo: Byte): Byte; stdcall; external 'EasyInner.dll';
function HabilitarMudancaOnLineOffLine(Habilita, Tempo: Byte): Byte; stdcall; external 'EasyInner.dll';
function HabilitarScoreFuncoes(Funcao, Score: Byte): Byte; stdcall; external 'EasyInner.dll';
function HabilitarScoreMensagemOffLine(Inner: Integer; Tipo, Habilitar: Byte): Byte; stdcall; external 'EasyInner.dll';
function HabilitarTeclado(Habilita, Ecoar: Byte): Byte; stdcall; external 'EasyInner.dll';
function IncluirUsuarioSemDigitalBio(Cartao: String): Byte; stdcall; external 'EasyInner.dll';
function IncluirUsuarioVerid(Inner: Integer; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function InserirHorarioAcesso(Horario, DiaSemana, FaixaDia, Hora, Minuto: Byte): Byte; stdcall; external 'EasyInner.dll';
function InserirHorarioMudancaEntrada(Hora1: Byte;Minuto1: Byte; Hora2: Byte;Minuto2: Byte; Hora3: Byte; Minuto3: Byte): Byte; stdcall; external 'EasyInner.dll';
function InserirHorarioMudancaSaida(Hora1: Byte; Minuto1: Byte; Hora2: Byte; Minuto2: Byte; Hora3: Byte; Minuto3: Byte): Byte; stdcall; external 'EasyInner.dll';
function InserirHorarioSirene(Hora, Minuto, Segunda, Terca, Quarta, Quinta, Sexta, Sabado, DomingoFeriado: Byte): Byte; stdcall; external 'EasyInner.dll';
function InserirQuantidadeDigitoVariavel(Digito: Byte): Byte; stdcall; external 'EasyInner.dll';
function InserirUsuarioLeitorBio(Inner: Integer; Tipo: Byte; Usuario: String): Byte; stdcall; external 'EasyInner.dll';
function InserirUsuarioListaAcesso(Cartao: String; Horario: Byte): Byte; stdcall; external 'EasyInner.dll';
function LerByteModem: Integer; stdcall; external 'EasyInner.dll';
function LerSensoresInner(Inner: Integer; StatusSensor1, StatusSensor2, StatusSensor3: Pointer): Byte; stdcall; external 'EasyInner.dll';
function LiberarCatracaDoisSentidos(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LiberarCatracaEntrada(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LiberarCatracaEntradaInvertida(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LiberarCatracaSaida(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LiberarCatracaSaidaInvertida(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LigarBackLite(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LigarBipIntermitente(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LigarLedVermelho(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function LocalizarPrimeiroUsuarioVerid(Inner: Integer; Modo: Byte): Byte; stdcall; external 'EasyInner.dll';
function LocalizarProximoUsuarioVerid(Inner: Integer; Modo: Byte): Byte; stdcall; external 'EasyInner.dll';
function LocalizarUsuarioVerid(Inner: Integer; Modo, Digitos: Byte; Cartao: String): Byte; stdcall; external 'EasyInner.dll';
function ManterRele1Acionado(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ManterRele2Acionado(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function PermitirCadastroInnerBioVerid(Permite: Byte): Byte; stdcall; external 'EasyInner.dll';
function Ping(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function PingOnLine(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function PreencherBufferTLM(Caminho: String): Byte; stdcall; external 'EasyInner.dll';
function ReceberDadosOnLine(Inner: Integer; Origem, Complemento: Pointer; Cartao: PChar; Dia, Mes, Ano, Hora, Minuto, Segundo: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberDataHoraDadosOnLine(Recebe: Byte): Byte; stdcall; external 'EasyInner.dll';
function ReceberModeloBio(Inner: Integer; OnLine: Byte; Modelo: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberPacoteListaUsuariosBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ReceberQuantidadeBilhetes(Inner: Longint; Quantidade: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberQuantidadeUsuariosBio(Inner: Integer; OnLine: Byte; Quantidade: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberRelogio(Inner: Integer; Dia, Mes, Ano, Hora, Minuto, Segundo: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberTemplateCapturado(Inner: Integer;Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberTemplateLeitor(Inner: Integer; OnLine: Byte; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberTotalUsuariosVerid(Inner: Integer; Total: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberUsuarioCadastradoBio(Inner: Integer; OnLine: Byte; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberUsuarioLista(Inner: Integer; Usuario: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberUsuarioVerid(Inner: Integer; Modo: Byte; Digitos, Template: Pointer; Cartao: PChar): Byte; stdcall; external 'EasyInner.dll';
function ReceberVersaoBio(Inner: Integer; OnLine: Byte; VersaoAlta, VersaoBaixa: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ReceberVersaoFirmware(Inner: Integer; Linha, Variacao, VersaoAlta, VersaoBaixa, VersaoSufixo, InnerAcessoBio: Pointer): Byte; stdcall; external 'EasyInner.dll';
function RegistrarAcessoNegado(TipoRegistro: Byte): Byte; stdcall; external 'EasyInner.dll';
function ResultadoComparacaoDigitalLeitor(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function ResultadoComparacaoPINVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoComparacaoTemplateVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoConfiguracaoBio(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function ResultadoConfiguracaoRedeVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoEnvioAjustesBio(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function ResultadoExclusaoTodosUsuariosVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoExclusaoUsuarioVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoIdentificacaoBiometrica(Inner: Integer; OnLine: Byte; Usuario: PChar): Byte; stdcall; external 'EasyInner.dll';
function ResultadoInclusaoUsuarioLeitorVerid(Inner: Integer; Template: Pointer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoInclusaoUsuarioVerid(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function ResultadoInsercaoUsuarioLeitorBio(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function ResultadoVerificacaoBiometrica(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function SetarInnerOld(Inner, Old: Integer): Byte; stdcall; external 'EasyInner.dll';
function SolicitarExclusaoUsuario(Inner: Integer; Usuario: String): Byte; stdcall; external 'EasyInner.dll';
function SolicitarListaUsuariosBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function SolicitarModeloBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function SolicitarQuantidadeUsuariosBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function SolicitarTemplateLeitor(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function SolicitarTotalUsuariosVerid(Inner: Integer; Modo: Byte): Byte; stdcall; external 'EasyInner.dll';
function SolicitarUsuarioCadastradoBio(Inner: Integer; Usuario: String): Byte; stdcall; external 'EasyInner.dll';
function SolicitarVersaoBio(Inner: Integer): Byte; stdcall; external 'EasyInner.dll';
function TemProximoPacote: Integer; stdcall; external 'EasyInner.dll';
function TemProximoUsuario: Integer; stdcall; external 'EasyInner.dll';
function UsuarioFoiEnviado(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function UsuarioFoiExcluido(Inner: Integer; OnLine: Byte): Byte; stdcall; external 'EasyInner.dll';
function UtilizarSenhaAcesso(Utiliza: Byte): Byte; stdcall; external 'EasyInner.dll';
procedure FecharPortaComunicacao; stdcall; external 'EasyInner.dll';
procedure InicializarColetaListaUsuariosBio; stdcall; external 'EasyInner.dll';
procedure SetarBioLight(Light: Integer); stdcall; external 'EasyInner.dll';

type
   TEasyInner = class
   private
      FLibraryHandle: THandle;
      class function GetInstance: TEasyInner; static;
      class var FInstance: TEasyInner;
      constructor Create;
      destructor Destroy; override;
   public
      function Call(Properties: TlkJSONobject): Byte;
      class property Instance: TEasyInner read GetInstance;
   end;

implementation

{ TEasyInner }

function TEasyInner.Call(Properties: TlkJSONobject): Byte;
var
   ProcAddr, ValuePtr: Pointer;
   FuncName: AnsiString;
   Parameters: TlkJSONlist;
   ParamValue: Variant;
   I: Integer;
begin
   if FLibraryHandle = 0 then
   begin
      Result := 128;
      Exit;
   end;

   FuncName := Properties.getString('function');
   ProcAddr := GetProcAddress(FLibraryHandle, PChar(FuncName));

   if not Assigned(ProcAddr) then
   begin
      Result := 128;
      Exit;
   end;

   Parameters := Properties.Field['parameters'] as TlkJSONlist;

   for I := 0 to Parameters.Count - 1 do
   begin
      ParamValue := Parameters.Child[I].Value;
      ValuePtr := @ParamValue;
      asm
         PUSH ValuePtr
      end;
   end;

   asm
      CALL ProcAddr
      PUSH EAX
   end;
end;

constructor TEasyInner.Create;
begin
   FLibraryHandle := LoadLibrary(PChar('EasyInner.dll'));
end;

destructor TEasyInner.Destroy;
begin
   if FLibraryHandle <> 0 then
      FreeLibrary(FLibraryHandle);
  inherited;
end;

class function TEasyInner.GetInstance: TEasyInner;
begin
   if not Assigned(TEasyInner.FInstance) then
      TEasyInner.FInstance := TEasyInner.Create;
   Result := TEasyInner.FInstance;
end;

end.
