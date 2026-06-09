unit Kernel7x_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 31/01/2018 14:47:05 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Henry\Henry7x\Kernel7x.dll (1)
// LIBID: {25DC738C-6571-47AD-8B19-362853B14E8D}
// LCID: 0
// Helpfile: 
// HelpString: Kernel for Device Management
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Kernel7xMajorVersion = 1;
  Kernel7xMinorVersion = 0;

  LIBID_Kernel7x: TGUID = '{25DC738C-6571-47AD-8B19-362853B14E8D}';

  IID_IKernel: TGUID = '{A6B32120-FD7A-4100-95F6-F379ED0BADF0}';
  DIID_IKernelEvents: TGUID = '{89C7B996-2E02-4A41-9365-41666AF7E611}';
  CLASS_Kernel: TGUID = '{6649E95F-4115-449B-8E6E-EEF73742243D}';
  IID_IHamster: TGUID = '{D1AC83EA-565A-418B-889B-4B5C038B61A8}';
  CLASS_Hamster: TGUID = '{59F7BAB9-F192-4681-A756-5C5D75B16410}';
  IID_IAlternativo: TGUID = '{84685C6E-1264-476F-9EFA-6D8A33246B8B}';
  DIID_IAlternativoEvents: TGUID = '{62EE9447-E89B-4E9B-A141-40A7D6153CB3}';
  CLASS_Alternativo: TGUID = '{4B679698-5334-4849-A580-AFD8CA5B9EA4}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum SFonteEntrada
type
  SFonteEntrada = TOleEnum;
const
  cfeTeclado = $00000000;
  cfeCracha = $00000001;
  cfeDigital1N = $00000002;
  cfeDigital11 = $00000003;

// Constants for enum STipoNegado
type
  STipoNegado = TOleEnum;
const
  ctnSenha = $00000000;
  ctnNivel = $00000001;
  ctnHorario = $00000002;
  ctnEmpresa = $00000003;
  ctnNenhum = $00000004;

// Constants for enum STipoComunicacao
type
  STipoComunicacao = TOleEnum;
const
  ctcSerial = $00000000;
  ctcTcpIp = $00000001;
  ctcUsb = $00000002;
  ctcModem = $00000003;
  ctcSerial485 = $00000004;
  ctcGPRS = $00000005;

// Constants for enum SVelocidade
type
  SVelocidade = TOleEnum;
const
  cv9600 = $00000000;
  cv19200 = $00000001;
  cv57600 = $00000002;
  cv115200 = $00000003;

// Constants for enum SModoComunicacao
type
  SModoComunicacao = TOleEnum;
const
  cmcOffline = $00000000;
  cmcOnline = $00000001;
  cmcOnOff = $00000002;
  cmcOnOffCtrl = $00000003;

// Constants for enum SPrioridade
type
  SPrioridade = TOleEnum;
const
  cpSistemaLivre = $00000000;
  cpMuitoBaixa = $00000001;
  cpBaixa = $00000002;
  cpNormal = $00000003;
  cpAlta = $00000004;
  cpMuitoAlta = $00000005;
  cpMomentoCritico = $00000006;

// Constants for enum SPlacaCard
type
  SPlacaCard = TOleEnum;
const
  cpcCardI = $00000000;
  cpcCardII = $00000001;
  cpcCardIII = $00000002;
  cpcCardVI = $00000003;
  cpcCardV = $00000004;
  cpcTikko = $00000006;
  cpcConcentrador = $00000007;
  cpcProxIp = $00000008;

// Constants for enum STeclado
type
  STeclado = TOleEnum;
const
  ctDesativado = $00000000;
  ctPerguntaES = $00000001;
  ctLeitor1 = $00000002;
  ctLeitor2 = $00000003;
  ctLeitor3Bio = $00000004;
  ctAtalhoFuncoes = $00000005;

// Constants for enum SReleStatus
type
  SReleStatus = TOleEnum;
const
  crsDesativado = $00000000;
  crsSirene = $00000001;
  crsSomenteEntrada = $00000002;
  crsSomenteSaida = $00000003;
  crsOutros = $00000004;
  crsListaAcesso = $00000005;
  crsPictogramaCofre = $00000006;

// Constants for enum SReleNANF
type
  SReleNANF = TOleEnum;
const
  crnNormalAberto = $00000000;
  crnNormalFechado = $00000001;

// Constants for enum SLeitor
type
  SLeitor = TOleEnum;
const
  clDesativado = $00000000;
  clEntradaSaida = $00000001;
  clEntrada = $00000002;
  clSaida = $00000003;
  clSaidaEntrada = $00000004;
  clAutomatico = $00000005;
  clPerguntaES = $00000006;
  clSensitivo = $00000007;

// Constants for enum SCtrlAcesso
type
  SCtrlAcesso = TOleEnum;
const
  ccaLivreTodos = $00000000;
  ccaLivreNaoCadastrados = $00000001;
  ccaBloqNaoCadastrados = $00000002;

// Constants for enum SGravacao
type
  SGravacao = TOleEnum;
const
  cgTodos = $00000000;
  cgBloqueados = $00000001;
  cgLiberados = $00000002;
  cgNaoGravar = $00000003;

// Constants for enum STipoRevista
type
  STipoRevista = TOleEnum;
const
  ctrDesativada = $00000000;
  ctrPercentagem = $00000001;
  ctrAleatoria = $00000002;

// Constants for enum SBiometria
type
  SBiometria = TOleEnum;
const
  cb_F = $00000000;
  cb_FL = $00000001;
  cb_I = $00000002;
  cb_S = $00000003;
  cb_FH = $00000004;
  cb_Nenhuma = $00000005;

// Constants for enum SBeep
type
  SBeep = TOleEnum;
const
  cbLiberado = $00000000;
  cbNegado = $00000001;

// Constants for enum SStatusGiro
type
  SStatusGiro = TOleEnum;
const
  csgBloqueada = $00000000;
  csgLibEntrada = $00000001;
  csgLibSaida = $00000002;
  csgLibAmbosLados = $00000003;
  csgLibEntradaForever = $00000004;
  csgLibSaidaForever = $00000005;
  csgLibAmbosLadosForever = $00000006;

// Constants for enum SAcessoOnline
type
  SAcessoOnline = TOleEnum;
const
  canNegado = $00000000;
  canLibEntrada = $00000001;
  canLibSaida = $00000002;
  canRevista = $00000003;
  canAmbosLados = $00000081;
  canMensagem = $00000004;

// Constants for enum SAcessoOffline
type
  SAcessoOffline = TOleEnum;
const
  cafLiberado = $0000007E;
  cafNegado = $0000007F;
  cafHorario = $00000002;
  cafEscala = $00000080;
  cafFaixa = $00000060;

// Constants for enum SMsgEstilo
type
  SMsgEstilo = TOleEnum;
const
  cmeDesativada = $000000BE;
  cmeMatricula = $000000BD;
  cmeDataHora = $000000A9;
  cmePersonalizada = $00000000;
  cmeSaudacao = $000000B3;

// Constants for enum SHamster
type
  SHamster = TOleEnum;
const
  chModelo1 = $00000000;
  chModelo2 = $00000001;
  chModelo3 = $00000002;

// Constants for enum SCfgDspPadrao
type
  SCfgDspPadrao = TOleEnum;
const
  ccdpAttendance = $00000000;
  ccdpDoorLock = $00000001;
  ccdpSmartCard = $00000002;
  ccdpDryFinger = $00000003;
  ccdpHighTemperature = $00000004;

// Constants for enum SParticao
type
  SParticao = TOleEnum;
const
  cpFuncoes = $00000000;
  cpFeriados = $00000001;
  cpAcionamentos = $00000002;
  cpListaAcesso = $00000003;
  cpPeriodos = $00000004;
  cpHorarios = $00000005;
  cpMsgEspecifica = $00000006;
  cpRegistros = $00000007;

// Constants for enum SUtils
type
  SUtils = TOleEnum;
const
  CARD7X_MEMORY_START = $00000200;
  CARD7X_MEMORY_BYTES_ENABLED = $0000FDFF;
  CARD7X_MEMORY_BYTES = $0000FFFF;

// Constants for enum SFlagRegistro
type
  SFlagRegistro = TOleEnum;
const
  sfrNaoGirou = $00000000;
  sfrGirou = $00000004;
  sfrDesistenciaAcesso = $00000005;
  sfrPortaAberta = $00000006;
  sfrCtrlOffline = $00000007;
  sfrBotao = $00000008;
  sfrCtrlOnline = $00000009;
  sfrPortaArrombada = $0000000A;

// Constants for enum SDeviceStatus
type
  SDeviceStatus = TOleEnum;
const
  cdsOnline = $00000000;
  cdsOffline = $00000001;
  cdsPortaAberta = $00000002;
  cdsBotao = $00000003;
  cdsPortaArrombada = $00000004;
  cdsPortaForcada = $00000005;
  cdsPoucoPapel = $00000006;
  cdsSemPapel = $00000007;
  cdsAfdGerada = $00000008;
  cdsSemEmpregador = $00000009;
  cdsSemColaborador = $0000000A;
  cdsEmissaoInstantanea = $0000000B;

// Constants for enum STipoSensor
type
  STipoSensor = TOleEnum;
const
  ctsPorta = $00000000;
  ctsBotao = $00000001;

// Constants for enum SAutoOn
type
  SAutoOn = TOleEnum;
const
  caoDesativado = $00000000;
  caoOffboard = $00000001;
  caoOnboard = $00000002;

// Constants for enum SExpansao
type
  SExpansao = TOleEnum;
const
  emb2 = $00000000;
  emb8 = $00000001;

// Constants for enum SResetCon
type
  SResetCon = TOleEnum;
const
  crc10minutos = $00000000;
  crc30minutos = $00000001;
  crc1hora = $00000002;
  crc6horas = $00000003;
  crc12horas = $00000004;
  crc24horas = $00000005;

// Constants for enum SIdEmpregador
type
  SIdEmpregador = TOleEnum;
const
  cieCPF = $00000031;
  cieCNPJ = $00000032;

// Constants for enum SOperacaoUsuarioEquipamento
type
  SOperacaoUsuarioEquipamento = TOleEnum;
const
  couAdicao = $00000000;
  couAlteracao = $00000001;
  couExclusao = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IKernel = interface;
  IKernelDisp = dispinterface;
  IKernelEvents = dispinterface;
  IHamster = interface;
  IHamsterDisp = dispinterface;
  IAlternativo = interface;
  IAlternativoDisp = dispinterface;
  IAlternativoEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Kernel = IKernel;
  Hamster = IHamster;
  Alternativo = IAlternativo;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PUserType1 = ^SMsgPadrao; {*}
  PUserType2 = ^SDspcfg_F_FL; {*}
  PUserType3 = ^SDspcfg_S; {*}
  PUserType4 = ^STemplate7x; {*}
  PUserType5 = ^SParticionamento; {*}
  PUserType6 = ^SResposta; {*}
  PUserType7 = ^SMsgEspecifica; {*}

  STipoBilhete = packed record
    Saida: WordBool;
    MasterLiberou: WordBool;
    FonteEntrada: SFonteEntrada;
    FuncaoLiberou: WordBool;
    AcessoNegado: WordBool;
    TipoNegado: STipoNegado;
  end;

  SComSerial = packed record
    NumeroRelogio: Byte;
    Porta: WideString;
    Velocidade: SVelocidade;
  end;

  SComTcpip = packed record
    Ip: WideString;
    Porta: Integer;
    MAC: WideString;
  end;

  SRele = packed record
    Status: SReleStatus;
    TipoNANF: SReleNANF;
    Tempo: Byte;
  end;

  SCtrlAcessoEx = packed record
    Gravacao: SGravacao;
    AtivarMaster: WordBool;
    Sinaliza50Percent: WordBool;
    SenhaPadraoHenry: WordBool;
    Catraca: WordBool;
    CatracaInvertida: WordBool;
    CatracaDupla: WordBool;
  end;

  SConfigBarCode = packed record
    PadraoD: WordBool;
    Letras: WordBool;
    PadraoLivre: WordBool;
    DigitosAutomatico: WordBool;
    PadraoT: WordBool;
    OcultarDigitos: WordBool;
    ArquivoT: WideString;
  end;

  SConfigRevista = packed record
    Tipo: STipoRevista;
    PercentRevista: Byte;
  end;

  SDigitos = packed record
    Selecionados: WideString;
  end;

  SEmpresas = packed record
    Empresa1: WideString;
    Empresa2: WideString;
    Empresa3: WideString;
    Empresa4: WideString;
    Empresa5: WideString;
  end;

  SControles = packed record
    BloqueiaPeriodo: WordBool;
    BiometriaOnline: WordBool;
    FuncoesEspecificas: WordBool;
    CatBioLiberaAmbos: WordBool;
    Visitantes: WordBool;
    Touch: WordBool;
    AutoOn: SAutoOn;
    Digitais11: WordBool;
    LeitorDigitalFree: WordBool;
    BiometriaImagem: WordBool;
  end;

  SDataHoraCompleta = packed record
    DataHora: TDateTime;
    HorarioVeraoAtivo: WordBool;
    HorarioVeraoInicio: TDateTime;
    HorarioVeraoTermino: TDateTime;
  end;

  SOperacaoCatraca = packed record
    StatusGiro: SStatusGiro;
    TempoLiberacao: Byte;
  end;

  SDias = packed record
    Domingo: WordBool;
    Segunda: WordBool;
    Terca: WordBool;
    Quarta: WordBool;
    Quinta: WordBool;
    Sexta: WordBool;
    Sabado: WordBool;
    Feriado: WordBool;
  end;

  SAcionamento = packed record
    Horario: TDateTime;
    Tempo: Byte;
    Dias: SDias;
  end;

  SRegistro = packed record
    Matricula: WideString;
    DataHora: TDateTime;
    Funcao: Byte;
    Flag: SFlagRegistro;
    NumeroRelogio: Byte;
    Tipo: STipoBilhete;
    IDControlador: Byte;
    IDSensor: Byte;
  end;

  SFuncao = packed record
    Ativa: WordBool;
    LiberaAcesso: WordBool;
    Mensagem: WideString;
    Tempo: Byte;
  end;

  SPeriodo = packed record
    Horario: TDateTime;
    Tolerancia: Byte;
    Dias: SDias;
  end;

  SPeriodoBloqueio = packed record
    Habilitado: WordBool;
    Inicio: TDateTime;
    Final: TDateTime;
  end;

  SMensagem = packed record
    Estilo: SMsgEstilo;
    Linha1: WideString;
    Linha2: WideString;
    Tempo: Byte;
  end;

  SMsgPadrao = packed record
    Padrao: SMensagem;
    Entrada: SMensagem;
    Saida: SMensagem;
  end;

  SMsgEspecifica = packed record
    Mensagem: SMensagem;
    Data: TDateTime;
    TodosDias: WordBool;
    Matriculas: WideString;
  end;

  SParticionamento = packed record
    Funcoes: Word;
    Feriados: Word;
    Acionamentos: Word;
    ListaAcesso: Word;
    Periodos: Word;
    Horarios: Word;
    MsgEspecifica: Word;
    Registros: Word;
  end;

  SResposta = packed record
    Acesso: SAcessoOnline;
    Mensagem: WideString;
    Tempo: Byte;
    IDControlador: Byte;
    TempoRele1: Byte;
    TempoRele2: Byte;
    TempoRele3: Byte;
  end;

  SDspcfg_F_FL = packed record
    SecurityLevel: Byte;
    SecurityLevelIdentify: Byte;
    RegisterQuality: Byte;
    VerifyQuality: Byte;
    UsingHighSecurity: Byte;
    SmartCapture: Byte;
    ExpBrightness: Word;
    ExpGain: Byte;
  end;

  SDspcfg_S = packed record
    SecurityLevel: Byte;
    FastMode: Byte;
    ImageQuality: Byte;
    Sensitivity: Byte;
    LightingCondition: WordBool;
  end;

  STemplate7x = packed record
    Matricula: WideString;
    Master: WordBool;
    Template: WideString;
    Biometria: SBiometria;
    Dedo: Byte;
  end;

  SUsuarioBio = packed record
    Matricula: WideString;
    Template: WideString;
    Master: WordBool;
    Dedo: Byte;
  end;

  SUsuarioBioEx = packed record
    Matricula: WideString;
    Template: WideString;
    Master: WordBool;
    Dedo: Byte;
    ID: WideString;
  end;

  SAntiPassBack = packed record
    Habilitado: WordBool;
    EntradaSaida: WordBool;
    Tempo: Byte;
  end;

  SReles = packed record
    Rele1: SRele;
    Rele2: SRele;
    Rele3: SRele;
    Rele4: SRele;
    Rele5: SRele;
  end;

  SRelesLista = packed record
    AcionaRele1: WordBool;
    AcionaRele2: WordBool;
    AcionaRele3: WordBool;
  end;

  SEscala = packed record
    Inicio: TDateTime;
    Horarios: WideString;
  end;

  SFuncaoEx = packed record
    Mensagem: WideString;
    Tempo: Byte;
    Numero: Byte;
  end;

  SControladores = packed record
    Control1: WordBool;
    Control2: WordBool;
    Control3: WordBool;
    Control4: WordBool;
    Control5: WordBool;
    Control6: WordBool;
    Control7: WordBool;
    Control8: WordBool;
  end;

  SSensor = packed record
    Habilitado: WordBool;
    Porta: WordBool;
    Botao: WordBool;
    Rele1: WordBool;
    Rele2: WordBool;
    Rele3: WordBool;
    Rele4: WordBool;
    Rele5: WordBool;
  end;

  SSensores = packed record
    Sensor1: SSensor;
    Sensor2: SSensor;
  end;

  SLeitores = packed record
    Leitor1: SLeitor;
    Leitor2: SLeitor;
    Leitor3: SLeitor;
  end;

  SAutoOff = packed record
    Habilitado: WordBool;
    Tempo: Byte;
  end;

  SComModem = packed record
    Fone: WideString;
    Porta: WideString;
  end;

  SControleTempos = packed record
    ProcessamentoOnline: Byte;
    LatenciaOffline: Byte;
  end;

  SLeitora = packed record
    Rele1: Integer;
    Rele2: Integer;
    Rele3: Integer;
  end;

  SSensorConc = packed record
    Habilitado: WordBool;
    Tipo: STipoSensor;
    Rele1: WordBool;
    Rele2: WordBool;
    Rele3: WordBool;
  end;

  SSensoresConc = packed record
    Sensor1: SSensorConc;
    Sensor2: SSensorConc;
    Sensor3: SSensorConc;
  end;

  SFacility = packed record
    Code1: Word;
    Code2: Word;
    Code3: Word;
    Code4: Word;
    Code5: Word;
    Code6: Word;
    Code7: Word;
    Code8: Word;
    Code9: Word;
    Code10: Word;
  end;

  SAcionaCtrl = packed record
    TempoRele1: Byte;
    TempoRele2: Byte;
    TempoRele3: Byte;
  end;

  SItemAcesso = packed record
    Matricula: WideString;
    IndexHorario: Byte;
    Acesso: SAcessoOffline;
    VerificarDigital: WordBool;
    PeriodoBloqueio: SPeriodoBloqueio;
    Reles: SRelesLista;
    Master: WordBool;
    Visitante: WordBool;
    Controladores: SControladores;
  end;

  SConfigCtrl = packed record
    Catraca: WordBool;
    WorkOff: WordBool;
    TempoRele1: Byte;
    TempoRele2: Byte;
    TempoRele3: Byte;
    Sensores: SSensoresConc;
    Leitora1: SLeitora;
    Leitora2: SLeitora;
  end;

  SComGPRS = packed record
    Porta: Integer;
  end;

  SComConfig = packed record
    Tcp: SComTcpip;
    Serial: SComSerial;
    ModoComunicacao: SModoComunicacao;
    Modem: SComModem;
    TipoComunicacao: STipoComunicacao;
    GPRS: SComGPRS;
    IsCatraca: WordBool;
  end;

  SEmpregador = packed record
    IdEmpregador: SIdEmpregador;
    Documento: WideString;
    CEI: WideString;
    RazaoSocial: WideString;
    Local: WideString;
  end;

  SUsuarioEquipamento = packed record
    Matriculas: WideString;
    PIS: WideString;
    Nome: WideString;
    VerificaDigital: WordBool;
    TipoOperacao: SOperacaoUsuarioEquipamento;
  end;

  SConfigFlags = packed record
    LeitorasAutomaticas: WordBool;
  end;

  SConfiguracao = packed record
    Versao: WideString;
    PlacaCard: SPlacaCard;
    Expansao: WordBool;
    ModoComunicacao: SModoComunicacao;
    Teclado: STeclado;
    Reles: SReles;
    Leitores: SLeitores;
    NivelAcesso: Byte;
    CodigoBarras: SConfigBarCode;
    NumDigitos: Byte;
    Revista: SConfigRevista;
    SenhaMenu: WordBool;
    Senha: WideString;
    DigitosSel: SDigitos;
    Empresas: SEmpresas;
    Biometria: SBiometria;
    CtrlAcesso: SCtrlAcesso;
    CtrlAcessoEx: SCtrlAcessoEx;
    ToquesAtender: Byte;
    Controles: SControles;
    AntiPassBack: SAntiPassBack;
    Sensores: SSensores;
    AutoOff: SAutoOff;
    Orion: WordBool;
    FaixaAcesso: WordBool;
    ConfigFlags: SConfigFlags;
    ControleTempos: SControleTempos;
    Controladores: WideString;
  end;


// *********************************************************************//
// Interface: IKernel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A6B32120-FD7A-4100-95F6-F379ED0BADF0}
// *********************************************************************//
  IKernel = interface(IDispatch)
    ['{A6B32120-FD7A-4100-95F6-F379ED0BADF0}']
    function Get_ListaPortasSeriais: WideString; safecall;
    function Get_AdicionaCard(pConfig: SComConfig; out pThreadIndex: Integer): WordBool; safecall;
    function Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool; safecall;
    procedure SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool); safecall;
    function Get_ThreadLastError(pThreadIndex: Integer): Integer; safecall;
    function Get_USB_Remove: WordBool; safecall;
    function Get_EnviaConfiguracao(pThreadIndex: Integer; pConfig: SConfiguracao): WordBool; safecall;
    function Get_RecebeConfiguracao(pThreadIndex: Integer; out pConfig: SConfiguracao): WordBool; safecall;
    function Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool; safecall;
    procedure Set_ThreadPrioridade(pThreadIndex: Integer; Param2: SPrioridade); safecall;
    function Get_ExistemRegistros(pThreadIndex: Integer; out pExistem: WordBool): WordBool; safecall;
    function Get_RecebeQtRegistros(pThreadIndex: Integer; out pQtRegs: Integer): WordBool; safecall;
    function Get_RecuperaRegistros(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaBeep(pThreadIndex: Integer; pBeep: SBeep): WordBool; safecall;
    function Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool; safecall;
    function Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta): WordBool; safecall;
    function Get_RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime): WordBool; safecall;
    function Get_RecebeDataHoraEx(pThreadIndex: Integer; out pDataHoraEx: SDataHoraCompleta): WordBool; safecall;
    function Get_EnviaTipoCatraca(pThreadIndex: Integer; pOperacao: SOperacaoCatraca): WordBool; safecall;
    function Get_RecebeTipoCatraca(pThreadIndex: Integer; out pOperacao: SOperacaoCatraca): WordBool; safecall;
    function Get_EnviaFuncoes(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeFuncoes(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaFeriados(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeFeriados(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaPeriodos(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebePeriodos(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaHorarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeHorarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaMsgPadrao(pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao): WordBool; safecall;
    function Get_RecebeMsgPadrao(pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao): WordBool; safecall;
    function Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaParticionamento(pThreadIndex: Integer; pParticionamento: SParticionamento): WordBool; safecall;
    function Get_RecebeParticionamento(pThreadIndex: Integer; out pParticionamento: SParticionamento): WordBool; safecall;
    function Get_Versao: WideString; safecall;
    function Get_RemoveCard(pThreadIndex: Integer): WordBool; safecall;
    function Get_Bio_UsuariosQuant(pThreadIndex: Integer; out pQt: Word): WordBool; safecall;
    function Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                   out pExiste: WordBool): WordBool; safecall;
    function Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 out pTemplate: WideString): WordBool; safecall;
    function Get_Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                                out pUsuario: SUsuarioBioEx): WordBool; safecall;
    function Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool; safecall;
    function Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 pFingerOnly: WordBool): WordBool; safecall;
    function Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool; safecall;
    function Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                                pMaster: WordBool): WideString; safecall;
    function Get_Bio_GetMaxQuantLista(pThreadIndex: Integer; out pQt: Word): WordBool; safecall;
    function Get_RegistroOff(pThreadIndex: Integer; out pRegistro: SRegistro): WordBool; safecall;
    function Get_DetectarVelocidade(pThreadIndex: Integer; out pVelocidade: SVelocidade): WordBool; safecall;
    function Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer; out pQt: Word): WordBool; safecall;
    function Get_Bio_GetUsuario(pThreadIndex: Integer; out pUsuario: SUsuarioBioEx): WordBool; safecall;
    procedure Add_Funcao(pThreadIndex: Integer; pFuncao: SFuncao); safecall;
    function Get_Rec_Funcao(pThreadIndex: Integer; out pFuncao: SFuncao): WordBool; safecall;
    procedure Add_Feriado(pThreadIndex: Integer; pDia: TDateTime); safecall;
    function Get_Rec_Feriado(pThreadIndex: Integer; out pDia: TDateTime): WordBool; safecall;
    procedure Add_Acionamento(pThreadIndex: Integer; pAcionamento: SAcionamento); safecall;
    function Get_Rec_Acionamento(pThreadIndex: Integer; out pAcionamento: SAcionamento): WordBool; safecall;
    procedure Add_Periodo(pThreadIndex: Integer; pPeriodo: SPeriodo); safecall;
    function Get_Rec_Periodo(pThreadIndex: Integer; out pPeriodo: SPeriodo): WordBool; safecall;
    procedure Add_ItemAcesso(pThreadIndex: Integer; pItemAcesso: SItemAcesso); safecall;
    function Get_Rec_ItemAcesso(pThreadIndex: Integer; out pItemAcesso: SItemAcesso): WordBool; safecall;
    function Get_Rec_Horario(pThreadIndex: Integer; out pHorario: WideString): WordBool; safecall;
    function Get_Rec_MsgEspec(pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica): WordBool; safecall;
    function Get_Bio_CriaDigitalM1M2(const pMatricula: WideString; pFinger: Byte; 
                                     pMaster: WordBool; out pTemplateF: STemplate7x; 
                                     out pTemplateFl: STemplate7x; out pTemplateFH: STemplate7x): WordBool; safecall;
    function Get_NumDigitosValidos(pConfiguracao: SConfiguracao): Byte; safecall;
    function Get_Bio_RecConfiguracaoF_FL(pThreadIndex: Integer; out pConfig: SDspcfg_F_FL): WordBool; safecall;
    function Get_Bio_EnvConfiguracaoF_FL(pThreadIndex: Integer; var pConfig: SDspcfg_F_FL): WordBool; safecall;
    function Get_Bio_RecConfiguracaoS(pThreadIndex: Integer; out pConfig: SDspcfg_S): WordBool; safecall;
    function Get_Bio_EnvConfiguracaoS(pThreadIndex: Integer; var pConfig: SDspcfg_S): WordBool; safecall;
    function Get_Bio_CfgDefaultF_FL(pTipo: SCfgDspPadrao): SDspcfg_F_FL; safecall;
    function Get_ExportConfiguracao(const pCaminho: WideString; pConfiguracao: SConfiguracao): WordBool; safecall;
    function Get_ImportConfiguracao(const pCaminho: WideString; out pConfiguracao: SConfiguracao): WordBool; safecall;
    function Get_SaveAsTemplate7x(const pCaminho: WideString; var pTemplate: STemplate7x): WordBool; safecall;
    function Get_OpenTemplate7x(const pCaminho: WideString; out pTemplate: STemplate7x): WordBool; safecall;
    function Get_SetorPercentual(var pParticionamento: SParticionamento; pSetor: SParticao): Double; safecall;
    function Get_USB_RecebeCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool; safecall;
    function Get_USB_EnviaCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool; safecall;
    function Get_Rec_Escala(pThreadIndex: Integer; out pEscala: SEscala): WordBool; safecall;
    function Get_NumDigitosPadraoT(pConfiguracao: SConfiguracao): Byte; safecall;
    function Get_MoreRecentFirmware: WideString; safecall;
    function Get_RaiseExceptions: WordBool; safecall;
    procedure Set_RaiseExceptions(Value: WordBool); safecall;
    procedure RespostaOn(pThreadIndex: Integer; var pResposta: SResposta); safecall;
    procedure RegistroOn(pThreadIndex: Integer; var pRegistro: SRegistro); safecall;
    procedure Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString); safecall;
    procedure Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                pFuncao: SFuncaoEx); safecall;
    function Get_Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString): WordBool; safecall;
    function Get_Rec_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                   out pFuncao: SFuncaoEx): WordBool; safecall;
    function Get_QuantRegsColetados(pThreadIndex: Integer): Integer; safecall;
    procedure SetConectado(pThreadIndex: Integer; pConectado: WordBool); safecall;
    function Get_KernelLastError: Integer; safecall;
    function Get_RecebePacote(pThreadIndex: Integer): WordBool; safecall;
    function Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool; safecall;
    procedure BeginLargeTransfer(pThreadIndex: Integer); safecall;
    procedure EndLargeTransfer(pThreadIndex: Integer); safecall;
    function Get_TamanhoRegistro(pConfig: SConfiguracao): Integer; safecall;
    function Get_TamanhoItemAcesso(pConfig: SConfiguracao): Integer; safecall;
    function Get_SRFuncoes(pConfig: SConfiguracao; pQtFuncoes: Integer): Integer; safecall;
    function Get_SRFeriados(pConfig: SConfiguracao; pQtFeriados: Integer): Integer; safecall;
    function Get_SRAcionamentos(pConfig: SConfiguracao; pQtAcionamentos: Integer): Integer; safecall;
    function Get_SRListaAcesso(pConfig: SConfiguracao; pQtItens: Integer): Integer; safecall;
    function Get_SRPeriodos(pConfig: SConfiguracao; pQtPeriodos: Integer): Integer; safecall;
    function Get_SRHorariosEscalas(pConfig: SConfiguracao; pQtHorarios: Integer; 
                                   pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                                   pQtHorariosPorEscala: Integer): Integer; safecall;
    function Get_SRMsgEspecifica(pConfig: SConfiguracao; pQtMsgs: Integer; 
                                 pQtMatriculasPorMsg: Integer): Integer; safecall;
    function Get_SRFuncoesEspecificas(pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                      pQtFuncoesPorMatricula: Integer): Integer; safecall;
    function Get_EnviaCfgControlador(pThreadIndex: Integer; pId: Byte; pConfig: SConfigCtrl): WordBool; safecall;
    function Get_RecebeCfgControlador(pThreadIndex: Integer; pId: Byte; out pConfig: SConfigCtrl): WordBool; safecall;
    function Get_EnviaFacilityCodes(pThreadIndex: Integer; pId: Byte; pCodes: SFacility): WordBool; safecall;
    function Get_RecebeFacilityCodes(pThreadIndex: Integer; pId: Byte; out pCodes: SFacility): WordBool; safecall;
    procedure SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool); safecall;
    function Get_Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                             out pIndexHorario: Integer): WordBool; safecall;
    function Get_Add_Escala(pThreadIndex: Integer; pEscala: SEscala; out pEscalaIndex: Integer): WordBool; safecall;
    function Get_Add_MsgEspec(pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica): WordBool; safecall;
    function Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer; safecall;
    function Get_ErrorDescription(pErrorCode: Integer): WideString; safecall;
    function Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool; safecall;
    procedure SetSecurityLevel(pValue: Byte); safecall;
    function Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString; safecall;
    procedure Bio_DropTemplates; safecall;
    procedure SetSearchTimeout(pSegundos: Integer); safecall;
    function Get_EnviaAcionaCtrl(pThreadIndex: Integer; pId: Byte; pAcionaCtrl: SAcionaCtrl): WordBool; safecall;
    procedure SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool); safecall;
    function SetorPercentualEx(var pParticionamento: SParticionamento; pSetor: SParticao; 
                               pExpansao: SExpansao): Double; safecall;
    procedure RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer); safecall;
    function Get_MostRecentFirmware(pConfig: SConfiguracao): WideString; safecall;
    function Get_getConnResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon): WordBool; safecall;
    procedure setConnResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon); safecall;
    function Bio_DropTemplate(const pMatricula: WideString): WordBool; safecall;
    function Get_EnviaDadosEmpregador(pThreadIndex: Integer; pEmpregador: SEmpregador): WordBool; safecall;
    function Get_RecebeDadosEmpregador(pThreadIndex: Integer; out pEmpregador: SEmpregador): WordBool; safecall;
    function Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool; safecall;
    function Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool; safecall;
    function Get_Rec_UsuarioEquipamento(pThreadIndex: Integer; out pUsuario: SUsuarioEquipamento): WordBool; safecall;
    function Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool; safecall;
    function PararColetaEventos(pThreadIndex: Integer): WordBool; safecall;
    function Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                 pData: TDateTime; pEmpregador: SEmpregador): WordBool; safecall;
    function Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_Add_UsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool; safecall;
    function CancelarOperacao(pThreadIndex: Integer): WordBool; safecall;
    function Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool; safecall;
    function SalvaImagemMemoria(pThreadIndex: Integer; const pCaminhoArquivo: WideString): WordBool; safecall;
    property ListaPortasSeriais: WideString read Get_ListaPortasSeriais;
    property AdicionaCard[pConfig: SComConfig; out pThreadIndex: Integer]: WordBool read Get_AdicionaCard;
    property Set485OffNumber[pThreadIndex: Integer; pNumero: Byte]: WordBool read Get_Set485OffNumber;
    property ThreadLastError[pThreadIndex: Integer]: Integer read Get_ThreadLastError;
    property USB_Remove: WordBool read Get_USB_Remove;
    property EnviaConfiguracao[pThreadIndex: Integer; pConfig: SConfiguracao]: WordBool read Get_EnviaConfiguracao;
    property RecebeConfiguracao[pThreadIndex: Integer; out pConfig: SConfiguracao]: WordBool read Get_RecebeConfiguracao;
    property AlterarVelocidade[pThreadIndex: Integer; pNovaVelocidade: SVelocidade]: WordBool read Get_AlterarVelocidade;
    property ThreadPrioridade[pThreadIndex: Integer]: SPrioridade write Set_ThreadPrioridade;
    property ExistemRegistros[pThreadIndex: Integer; out pExistem: WordBool]: WordBool read Get_ExistemRegistros;
    property RecebeQtRegistros[pThreadIndex: Integer; out pQtRegs: Integer]: WordBool read Get_RecebeQtRegistros;
    property RecuperaRegistros[pThreadIndex: Integer]: WordBool read Get_RecuperaRegistros;
    property EnviaBeep[pThreadIndex: Integer; pBeep: SBeep]: WordBool read Get_EnviaBeep;
    property EnviaDataHora[pThreadIndex: Integer; pDataHora: TDateTime]: WordBool read Get_EnviaDataHora;
    property EnviaDataHoraEx[pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta]: WordBool read Get_EnviaDataHoraEx;
    property RecebeDataHora[pThreadIndex: Integer; out pDataHora: TDateTime]: WordBool read Get_RecebeDataHora;
    property RecebeDataHoraEx[pThreadIndex: Integer; out pDataHoraEx: SDataHoraCompleta]: WordBool read Get_RecebeDataHoraEx;
    property EnviaTipoCatraca[pThreadIndex: Integer; pOperacao: SOperacaoCatraca]: WordBool read Get_EnviaTipoCatraca;
    property RecebeTipoCatraca[pThreadIndex: Integer; out pOperacao: SOperacaoCatraca]: WordBool read Get_RecebeTipoCatraca;
    property EnviaFuncoes[pThreadIndex: Integer]: WordBool read Get_EnviaFuncoes;
    property RecebeFuncoes[pThreadIndex: Integer]: WordBool read Get_RecebeFuncoes;
    property EnviaFeriados[pThreadIndex: Integer]: WordBool read Get_EnviaFeriados;
    property RecebeFeriados[pThreadIndex: Integer]: WordBool read Get_RecebeFeriados;
    property EnviaAcionamentos[pThreadIndex: Integer]: WordBool read Get_EnviaAcionamentos;
    property RecebeAcionamentos[pThreadIndex: Integer]: WordBool read Get_RecebeAcionamentos;
    property EnviaPeriodos[pThreadIndex: Integer]: WordBool read Get_EnviaPeriodos;
    property RecebePeriodos[pThreadIndex: Integer]: WordBool read Get_RecebePeriodos;
    property EnviaHorarios[pThreadIndex: Integer]: WordBool read Get_EnviaHorarios;
    property RecebeHorarios[pThreadIndex: Integer]: WordBool read Get_RecebeHorarios;
    property EnviaListaAcesso[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcesso;
    property RecebeListaAcesso[pThreadIndex: Integer]: WordBool read Get_RecebeListaAcesso;
    property EnviaMsgPadrao[pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao]: WordBool read Get_EnviaMsgPadrao;
    property RecebeMsgPadrao[pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao]: WordBool read Get_RecebeMsgPadrao;
    property EnviaMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_EnviaMsgsEspecificas;
    property RecebeMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_RecebeMsgsEspecificas;
    property EnviaParticionamento[pThreadIndex: Integer; pParticionamento: SParticionamento]: WordBool read Get_EnviaParticionamento;
    property RecebeParticionamento[pThreadIndex: Integer; out pParticionamento: SParticionamento]: WordBool read Get_RecebeParticionamento;
    property Versao: WideString read Get_Versao;
    property RemoveCard[pThreadIndex: Integer]: WordBool read Get_RemoveCard;
    property Bio_UsuariosQuant[pThreadIndex: Integer; out pQt: Word]: WordBool read Get_Bio_UsuariosQuant;
    property Bio_UsuarioExiste[pThreadIndex: Integer; const pUsuarioID: WideString; 
                               out pExiste: WordBool]: WordBool read Get_Bio_UsuarioExiste;
    property Bio_RecListaUsuarios[pThreadIndex: Integer]: WordBool read Get_Bio_RecListaUsuarios;
    property Bio_RecTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             out pTemplate: WideString]: WordBool read Get_Bio_RecTemplate;
    property Bio_RecUsuario[pThreadIndex: Integer; pPrimeiro: WordBool; out pUsuario: SUsuarioBioEx]: WordBool read Get_Bio_RecUsuario;
    property Bio_EnvTemplate[pThreadIndex: Integer; const pTemplate: WideString]: WordBool read Get_Bio_EnvTemplate;
    property Bio_DelTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             pFingerOnly: WordBool]: WordBool read Get_Bio_DelTemplate;
    property Bio_DelTemplateTodas[pThreadIndex: Integer]: WordBool read Get_Bio_DelTemplateTodas;
    property Bio_GeraUserID[pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                            pMaster: WordBool]: WideString read Get_Bio_GeraUserID;
    property Bio_GetMaxQuantLista[pThreadIndex: Integer; out pQt: Word]: WordBool read Get_Bio_GetMaxQuantLista;
    property RegistroOff[pThreadIndex: Integer; out pRegistro: SRegistro]: WordBool read Get_RegistroOff;
    property DetectarVelocidade[pThreadIndex: Integer; out pVelocidade: SVelocidade]: WordBool read Get_DetectarVelocidade;
    property Bio_UsuariosQuantLivre[pThreadIndex: Integer; out pQt: Word]: WordBool read Get_Bio_UsuariosQuantLivre;
    property Bio_GetUsuario[pThreadIndex: Integer; out pUsuario: SUsuarioBioEx]: WordBool read Get_Bio_GetUsuario;
    property Rec_Funcao[pThreadIndex: Integer; out pFuncao: SFuncao]: WordBool read Get_Rec_Funcao;
    property Rec_Feriado[pThreadIndex: Integer; out pDia: TDateTime]: WordBool read Get_Rec_Feriado;
    property Rec_Acionamento[pThreadIndex: Integer; out pAcionamento: SAcionamento]: WordBool read Get_Rec_Acionamento;
    property Rec_Periodo[pThreadIndex: Integer; out pPeriodo: SPeriodo]: WordBool read Get_Rec_Periodo;
    property Rec_ItemAcesso[pThreadIndex: Integer; out pItemAcesso: SItemAcesso]: WordBool read Get_Rec_ItemAcesso;
    property Rec_Horario[pThreadIndex: Integer; out pHorario: WideString]: WordBool read Get_Rec_Horario;
    property Rec_MsgEspec[pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica]: WordBool read Get_Rec_MsgEspec;
    property Bio_CriaDigitalM1M2[const pMatricula: WideString; pFinger: Byte; pMaster: WordBool; 
                                 out pTemplateF: STemplate7x; out pTemplateFl: STemplate7x; 
                                 out pTemplateFH: STemplate7x]: WordBool read Get_Bio_CriaDigitalM1M2;
    property NumDigitosValidos[pConfiguracao: SConfiguracao]: Byte read Get_NumDigitosValidos;
    property Bio_RecConfiguracaoF_FL[pThreadIndex: Integer; out pConfig: SDspcfg_F_FL]: WordBool read Get_Bio_RecConfiguracaoF_FL;
    property Bio_EnvConfiguracaoF_FL[pThreadIndex: Integer; var pConfig: SDspcfg_F_FL]: WordBool read Get_Bio_EnvConfiguracaoF_FL;
    property Bio_RecConfiguracaoS[pThreadIndex: Integer; out pConfig: SDspcfg_S]: WordBool read Get_Bio_RecConfiguracaoS;
    property Bio_EnvConfiguracaoS[pThreadIndex: Integer; var pConfig: SDspcfg_S]: WordBool read Get_Bio_EnvConfiguracaoS;
    property Bio_CfgDefaultF_FL[pTipo: SCfgDspPadrao]: SDspcfg_F_FL read Get_Bio_CfgDefaultF_FL;
    property ExportConfiguracao[const pCaminho: WideString; pConfiguracao: SConfiguracao]: WordBool read Get_ExportConfiguracao;
    property ImportConfiguracao[const pCaminho: WideString; out pConfiguracao: SConfiguracao]: WordBool read Get_ImportConfiguracao;
    property SaveAsTemplate7x[const pCaminho: WideString; var pTemplate: STemplate7x]: WordBool read Get_SaveAsTemplate7x;
    property OpenTemplate7x[const pCaminho: WideString; out pTemplate: STemplate7x]: WordBool read Get_OpenTemplate7x;
    property SetorPercentual[var pParticionamento: SParticionamento; pSetor: SParticao]: Double read Get_SetorPercentual;
    property USB_RecebeCartucho[pThreadIndex: Integer; const pFileName: WideString]: WordBool read Get_USB_RecebeCartucho;
    property USB_EnviaCartucho[pThreadIndex: Integer; const pFileName: WideString]: WordBool read Get_USB_EnviaCartucho;
    property Rec_Escala[pThreadIndex: Integer; out pEscala: SEscala]: WordBool read Get_Rec_Escala;
    property NumDigitosPadraoT[pConfiguracao: SConfiguracao]: Byte read Get_NumDigitosPadraoT;
    property MoreRecentFirmware: WideString read Get_MoreRecentFirmware;
    property RaiseExceptions: WordBool read Get_RaiseExceptions write Set_RaiseExceptions;
    property Rec_FncEsp_Matricula[pThreadIndex: Integer; out pMatricula: WideString]: WordBool read Get_Rec_FncEsp_Matricula;
    property Rec_FncEsp_Funcao[pThreadIndex: Integer; const pMatricula: WideString; 
                               out pFuncao: SFuncaoEx]: WordBool read Get_Rec_FncEsp_Funcao;
    property QuantRegsColetados[pThreadIndex: Integer]: Integer read Get_QuantRegsColetados;
    property KernelLastError: Integer read Get_KernelLastError;
    property RecebePacote[pThreadIndex: Integer]: WordBool read Get_RecebePacote;
    property ApagaUltimoPacote[pThreadIndex: Integer]: WordBool read Get_ApagaUltimoPacote;
    property TamanhoRegistro[pConfig: SConfiguracao]: Integer read Get_TamanhoRegistro;
    property TamanhoItemAcesso[pConfig: SConfiguracao]: Integer read Get_TamanhoItemAcesso;
    property SRFuncoes[pConfig: SConfiguracao; pQtFuncoes: Integer]: Integer read Get_SRFuncoes;
    property SRFeriados[pConfig: SConfiguracao; pQtFeriados: Integer]: Integer read Get_SRFeriados;
    property SRAcionamentos[pConfig: SConfiguracao; pQtAcionamentos: Integer]: Integer read Get_SRAcionamentos;
    property SRListaAcesso[pConfig: SConfiguracao; pQtItens: Integer]: Integer read Get_SRListaAcesso;
    property SRPeriodos[pConfig: SConfiguracao; pQtPeriodos: Integer]: Integer read Get_SRPeriodos;
    property SRHorariosEscalas[pConfig: SConfiguracao; pQtHorarios: Integer; 
                               pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                               pQtHorariosPorEscala: Integer]: Integer read Get_SRHorariosEscalas;
    property SRMsgEspecifica[pConfig: SConfiguracao; pQtMsgs: Integer; pQtMatriculasPorMsg: Integer]: Integer read Get_SRMsgEspecifica;
    property SRFuncoesEspecificas[pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                  pQtFuncoesPorMatricula: Integer]: Integer read Get_SRFuncoesEspecificas;
    property EnviaCfgControlador[pThreadIndex: Integer; pId: Byte; pConfig: SConfigCtrl]: WordBool read Get_EnviaCfgControlador;
    property RecebeCfgControlador[pThreadIndex: Integer; pId: Byte; out pConfig: SConfigCtrl]: WordBool read Get_RecebeCfgControlador;
    property EnviaFacilityCodes[pThreadIndex: Integer; pId: Byte; pCodes: SFacility]: WordBool read Get_EnviaFacilityCodes;
    property RecebeFacilityCodes[pThreadIndex: Integer; pId: Byte; out pCodes: SFacility]: WordBool read Get_RecebeFacilityCodes;
    property Add_Horario[pThreadIndex: Integer; const pPeriodos: WideString; 
                         out pIndexHorario: Integer]: WordBool read Get_Add_Horario;
    property Add_Escala[pThreadIndex: Integer; pEscala: SEscala; out pEscalaIndex: Integer]: WordBool read Get_Add_Escala;
    property Add_MsgEspec[pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica]: WordBool read Get_Add_MsgEspec;
    property DigitosRange[pPlaca: SPlacaCard; pMinimo: WordBool]: Integer read Get_DigitosRange;
    property ErrorDescription[pErrorCode: Integer]: WideString read Get_ErrorDescription;
    property Bio_CarregaTemplate[const pTemplate: WideString]: WordBool read Get_Bio_CarregaTemplate;
    property Bio_ProcuraTemplate[const pMatricula: WideString; const pTemplate: WideString]: WideString read Get_Bio_ProcuraTemplate;
    property EnviaAcionaCtrl[pThreadIndex: Integer; pId: Byte; pAcionaCtrl: SAcionaCtrl]: WordBool read Get_EnviaAcionaCtrl;
    property MostRecentFirmware[pConfig: SConfiguracao]: WideString read Get_MostRecentFirmware;
    property getConnResetTimeout[pThreadIndex: Integer; out pTimeout: SResetCon]: WordBool read Get_getConnResetTimeout;
    property EnviaDadosEmpregador[pThreadIndex: Integer; pEmpregador: SEmpregador]: WordBool read Get_EnviaDadosEmpregador;
    property RecebeDadosEmpregador[pThreadIndex: Integer; out pEmpregador: SEmpregador]: WordBool read Get_RecebeDadosEmpregador;
    property EnviaUsuarioEquipamento[pThreadIndex: Integer; pUsuario: SUsuarioEquipamento]: WordBool read Get_EnviaUsuarioEquipamento;
    property RecebeListaUsuarioEquipamento[pThreadIndex: Integer]: WordBool read Get_RecebeListaUsuarioEquipamento;
    property Rec_UsuarioEquipamento[pThreadIndex: Integer; out pUsuario: SUsuarioEquipamento]: WordBool read Get_Rec_UsuarioEquipamento;
    property ColetaEventos[pThreadIndex: Integer; const pPathAFD: WideString]: WordBool read Get_ColetaEventos;
    property ColetaEventosEx[pThreadIndex: Integer; const pPathAFD: WideString; pData: TDateTime; 
                             pEmpregador: SEmpregador]: WordBool read Get_ColetaEventosEx;
    property EnviaListaAcessoThd[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcessoThd;
    property EnviaListaUsuarios[pThreadIndex: Integer]: WordBool read Get_EnviaListaUsuarios;
    property Add_UsuarioEquipamento[pThreadIndex: Integer; pUsuario: SUsuarioEquipamento]: WordBool read Get_Add_UsuarioEquipamento;
    property DataHoraUltimaComunicacao[pThreadIndex: Integer; out pLastCommDateTime: Double]: WordBool read Get_DataHoraUltimaComunicacao;
  end;

// *********************************************************************//
// DispIntf:  IKernelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A6B32120-FD7A-4100-95F6-F379ED0BADF0}
// *********************************************************************//
  IKernelDisp = dispinterface
    ['{A6B32120-FD7A-4100-95F6-F379ED0BADF0}']
    property ListaPortasSeriais: WideString readonly dispid 202;
    property AdicionaCard[pConfig: {??SComConfig}OleVariant; out pThreadIndex: Integer]: WordBool readonly dispid 203;
    property Set485OffNumber[pThreadIndex: Integer; pNumero: Byte]: WordBool readonly dispid 205;
    procedure SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool); dispid 206;
    property ThreadLastError[pThreadIndex: Integer]: Integer readonly dispid 207;
    property USB_Remove: WordBool readonly dispid 209;
    property EnviaConfiguracao[pThreadIndex: Integer; pConfig: {??SConfiguracao}OleVariant]: WordBool readonly dispid 210;
    property RecebeConfiguracao[pThreadIndex: Integer; out pConfig: {??SConfiguracao}OleVariant]: WordBool readonly dispid 211;
    property AlterarVelocidade[pThreadIndex: Integer; pNovaVelocidade: SVelocidade]: WordBool readonly dispid 212;
    property ThreadPrioridade[pThreadIndex: Integer]: SPrioridade writeonly dispid 208;
    property ExistemRegistros[pThreadIndex: Integer; out pExistem: WordBool]: WordBool readonly dispid 213;
    property RecebeQtRegistros[pThreadIndex: Integer; out pQtRegs: Integer]: WordBool readonly dispid 214;
    property RecuperaRegistros[pThreadIndex: Integer]: WordBool readonly dispid 215;
    property EnviaBeep[pThreadIndex: Integer; pBeep: SBeep]: WordBool readonly dispid 216;
    property EnviaDataHora[pThreadIndex: Integer; pDataHora: TDateTime]: WordBool readonly dispid 217;
    property EnviaDataHoraEx[pThreadIndex: Integer; pDataHoraEx: {??SDataHoraCompleta}OleVariant]: WordBool readonly dispid 218;
    property RecebeDataHora[pThreadIndex: Integer; out pDataHora: TDateTime]: WordBool readonly dispid 219;
    property RecebeDataHoraEx[pThreadIndex: Integer; 
                              out pDataHoraEx: {??SDataHoraCompleta}OleVariant]: WordBool readonly dispid 220;
    property EnviaTipoCatraca[pThreadIndex: Integer; pOperacao: {??SOperacaoCatraca}OleVariant]: WordBool readonly dispid 221;
    property RecebeTipoCatraca[pThreadIndex: Integer; out pOperacao: {??SOperacaoCatraca}OleVariant]: WordBool readonly dispid 222;
    property EnviaFuncoes[pThreadIndex: Integer]: WordBool readonly dispid 225;
    property RecebeFuncoes[pThreadIndex: Integer]: WordBool readonly dispid 226;
    property EnviaFeriados[pThreadIndex: Integer]: WordBool readonly dispid 227;
    property RecebeFeriados[pThreadIndex: Integer]: WordBool readonly dispid 228;
    property EnviaAcionamentos[pThreadIndex: Integer]: WordBool readonly dispid 229;
    property RecebeAcionamentos[pThreadIndex: Integer]: WordBool readonly dispid 230;
    property EnviaPeriodos[pThreadIndex: Integer]: WordBool readonly dispid 231;
    property RecebePeriodos[pThreadIndex: Integer]: WordBool readonly dispid 232;
    property EnviaHorarios[pThreadIndex: Integer]: WordBool readonly dispid 233;
    property RecebeHorarios[pThreadIndex: Integer]: WordBool readonly dispid 234;
    property EnviaListaAcesso[pThreadIndex: Integer]: WordBool readonly dispid 235;
    property RecebeListaAcesso[pThreadIndex: Integer]: WordBool readonly dispid 236;
    property EnviaMsgPadrao[pThreadIndex: Integer; var pMsgPadrao: {??SMsgPadrao}OleVariant]: WordBool readonly dispid 237;
    property RecebeMsgPadrao[pThreadIndex: Integer; out pMsgPadrao: {??SMsgPadrao}OleVariant]: WordBool readonly dispid 238;
    property EnviaMsgsEspecificas[pThreadIndex: Integer]: WordBool readonly dispid 239;
    property RecebeMsgsEspecificas[pThreadIndex: Integer]: WordBool readonly dispid 240;
    property EnviaParticionamento[pThreadIndex: Integer; 
                                  pParticionamento: {??SParticionamento}OleVariant]: WordBool readonly dispid 241;
    property RecebeParticionamento[pThreadIndex: Integer; 
                                   out pParticionamento: {??SParticionamento}OleVariant]: WordBool readonly dispid 242;
    property Versao: WideString readonly dispid 243;
    property RemoveCard[pThreadIndex: Integer]: WordBool readonly dispid 204;
    property Bio_UsuariosQuant[pThreadIndex: Integer; out pQt: {??Word}OleVariant]: WordBool readonly dispid 246;
    property Bio_UsuarioExiste[pThreadIndex: Integer; const pUsuarioID: WideString; 
                               out pExiste: WordBool]: WordBool readonly dispid 247;
    property Bio_RecListaUsuarios[pThreadIndex: Integer]: WordBool readonly dispid 248;
    property Bio_RecTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             out pTemplate: WideString]: WordBool readonly dispid 249;
    property Bio_RecUsuario[pThreadIndex: Integer; pPrimeiro: WordBool; 
                            out pUsuario: {??SUsuarioBioEx}OleVariant]: WordBool readonly dispid 250;
    property Bio_EnvTemplate[pThreadIndex: Integer; const pTemplate: WideString]: WordBool readonly dispid 251;
    property Bio_DelTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             pFingerOnly: WordBool]: WordBool readonly dispid 252;
    property Bio_DelTemplateTodas[pThreadIndex: Integer]: WordBool readonly dispid 253;
    property Bio_GeraUserID[pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                            pMaster: WordBool]: WideString readonly dispid 256;
    property Bio_GetMaxQuantLista[pThreadIndex: Integer; out pQt: {??Word}OleVariant]: WordBool readonly dispid 257;
    property RegistroOff[pThreadIndex: Integer; out pRegistro: {??SRegistro}OleVariant]: WordBool readonly dispid 254;
    property DetectarVelocidade[pThreadIndex: Integer; out pVelocidade: SVelocidade]: WordBool readonly dispid 255;
    property Bio_UsuariosQuantLivre[pThreadIndex: Integer; out pQt: {??Word}OleVariant]: WordBool readonly dispid 259;
    property Bio_GetUsuario[pThreadIndex: Integer; out pUsuario: {??SUsuarioBioEx}OleVariant]: WordBool readonly dispid 260;
    procedure Add_Funcao(pThreadIndex: Integer; pFuncao: {??SFuncao}OleVariant); dispid 263;
    property Rec_Funcao[pThreadIndex: Integer; out pFuncao: {??SFuncao}OleVariant]: WordBool readonly dispid 264;
    procedure Add_Feriado(pThreadIndex: Integer; pDia: TDateTime); dispid 262;
    property Rec_Feriado[pThreadIndex: Integer; out pDia: TDateTime]: WordBool readonly dispid 265;
    procedure Add_Acionamento(pThreadIndex: Integer; pAcionamento: {??SAcionamento}OleVariant); dispid 266;
    property Rec_Acionamento[pThreadIndex: Integer; out pAcionamento: {??SAcionamento}OleVariant]: WordBool readonly dispid 267;
    procedure Add_Periodo(pThreadIndex: Integer; pPeriodo: {??SPeriodo}OleVariant); dispid 268;
    property Rec_Periodo[pThreadIndex: Integer; out pPeriodo: {??SPeriodo}OleVariant]: WordBool readonly dispid 269;
    procedure Add_ItemAcesso(pThreadIndex: Integer; pItemAcesso: {??SItemAcesso}OleVariant); dispid 270;
    property Rec_ItemAcesso[pThreadIndex: Integer; out pItemAcesso: {??SItemAcesso}OleVariant]: WordBool readonly dispid 271;
    property Rec_Horario[pThreadIndex: Integer; out pHorario: WideString]: WordBool readonly dispid 274;
    property Rec_MsgEspec[pThreadIndex: Integer; out pMsgEspec: {??SMsgEspecifica}OleVariant]: WordBool readonly dispid 275;
    property Bio_CriaDigitalM1M2[const pMatricula: WideString; pFinger: Byte; pMaster: WordBool; 
                                 out pTemplateF: {??STemplate7x}OleVariant; 
                                 out pTemplateFl: {??STemplate7x}OleVariant; 
                                 out pTemplateFH: {??STemplate7x}OleVariant]: WordBool readonly dispid 276;
    property NumDigitosValidos[pConfiguracao: {??SConfiguracao}OleVariant]: Byte readonly dispid 258;
    property Bio_RecConfiguracaoF_FL[pThreadIndex: Integer; out pConfig: {??SDspcfg_F_FL}OleVariant]: WordBool readonly dispid 278;
    property Bio_EnvConfiguracaoF_FL[pThreadIndex: Integer; var pConfig: {??SDspcfg_F_FL}OleVariant]: WordBool readonly dispid 279;
    property Bio_RecConfiguracaoS[pThreadIndex: Integer; out pConfig: {??SDspcfg_S}OleVariant]: WordBool readonly dispid 280;
    property Bio_EnvConfiguracaoS[pThreadIndex: Integer; var pConfig: {??SDspcfg_S}OleVariant]: WordBool readonly dispid 281;
    property Bio_CfgDefaultF_FL[pTipo: SCfgDspPadrao]: {??SDspcfg_F_FL}OleVariant readonly dispid 282;
    property ExportConfiguracao[const pCaminho: WideString; 
                                pConfiguracao: {??SConfiguracao}OleVariant]: WordBool readonly dispid 283;
    property ImportConfiguracao[const pCaminho: WideString; 
                                out pConfiguracao: {??SConfiguracao}OleVariant]: WordBool readonly dispid 284;
    property SaveAsTemplate7x[const pCaminho: WideString; var pTemplate: {??STemplate7x}OleVariant]: WordBool readonly dispid 285;
    property OpenTemplate7x[const pCaminho: WideString; out pTemplate: {??STemplate7x}OleVariant]: WordBool readonly dispid 286;
    property SetorPercentual[var pParticionamento: {??SParticionamento}OleVariant; pSetor: SParticao]: Double readonly dispid 288;
    property USB_RecebeCartucho[pThreadIndex: Integer; const pFileName: WideString]: WordBool readonly dispid 289;
    property USB_EnviaCartucho[pThreadIndex: Integer; const pFileName: WideString]: WordBool readonly dispid 290;
    property Rec_Escala[pThreadIndex: Integer; out pEscala: {??SEscala}OleVariant]: WordBool readonly dispid 292;
    property NumDigitosPadraoT[pConfiguracao: {??SConfiguracao}OleVariant]: Byte readonly dispid 295;
    property MoreRecentFirmware: WideString readonly dispid 297;
    property RaiseExceptions: WordBool dispid 300;
    procedure RespostaOn(pThreadIndex: Integer; var pResposta: {??SResposta}OleVariant); dispid 245;
    procedure RegistroOn(pThreadIndex: Integer; var pRegistro: {??SRegistro}OleVariant); dispid 244;
    procedure Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString); dispid 293;
    procedure Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                pFuncao: {??SFuncaoEx}OleVariant); dispid 294;
    property Rec_FncEsp_Matricula[pThreadIndex: Integer; out pMatricula: WideString]: WordBool readonly dispid 305;
    property Rec_FncEsp_Funcao[pThreadIndex: Integer; const pMatricula: WideString; 
                               out pFuncao: {??SFuncaoEx}OleVariant]: WordBool readonly dispid 306;
    property QuantRegsColetados[pThreadIndex: Integer]: Integer readonly dispid 301;
    procedure SetConectado(pThreadIndex: Integer; pConectado: WordBool); dispid 302;
    property KernelLastError: Integer readonly dispid 303;
    property RecebePacote[pThreadIndex: Integer]: WordBool readonly dispid 304;
    property ApagaUltimoPacote[pThreadIndex: Integer]: WordBool readonly dispid 308;
    procedure BeginLargeTransfer(pThreadIndex: Integer); dispid 309;
    procedure EndLargeTransfer(pThreadIndex: Integer); dispid 310;
    property TamanhoRegistro[pConfig: {??SConfiguracao}OleVariant]: Integer readonly dispid 261;
    property TamanhoItemAcesso[pConfig: {??SConfiguracao}OleVariant]: Integer readonly dispid 277;
    property SRFuncoes[pConfig: {??SConfiguracao}OleVariant; pQtFuncoes: Integer]: Integer readonly dispid 201;
    property SRFeriados[pConfig: {??SConfiguracao}OleVariant; pQtFeriados: Integer]: Integer readonly dispid 287;
    property SRAcionamentos[pConfig: {??SConfiguracao}OleVariant; pQtAcionamentos: Integer]: Integer readonly dispid 296;
    property SRListaAcesso[pConfig: {??SConfiguracao}OleVariant; pQtItens: Integer]: Integer readonly dispid 298;
    property SRPeriodos[pConfig: {??SConfiguracao}OleVariant; pQtPeriodos: Integer]: Integer readonly dispid 299;
    property SRHorariosEscalas[pConfig: {??SConfiguracao}OleVariant; pQtHorarios: Integer; 
                               pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                               pQtHorariosPorEscala: Integer]: Integer readonly dispid 307;
    property SRMsgEspecifica[pConfig: {??SConfiguracao}OleVariant; pQtMsgs: Integer; 
                             pQtMatriculasPorMsg: Integer]: Integer readonly dispid 311;
    property SRFuncoesEspecificas[pConfig: {??SConfiguracao}OleVariant; pQtMatriculas: Integer; 
                                  pQtFuncoesPorMatricula: Integer]: Integer readonly dispid 312;
    property EnviaCfgControlador[pThreadIndex: Integer; pId: Byte; 
                                 pConfig: {??SConfigCtrl}OleVariant]: WordBool readonly dispid 313;
    property RecebeCfgControlador[pThreadIndex: Integer; pId: Byte; 
                                  out pConfig: {??SConfigCtrl}OleVariant]: WordBool readonly dispid 314;
    property EnviaFacilityCodes[pThreadIndex: Integer; pId: Byte; pCodes: {??SFacility}OleVariant]: WordBool readonly dispid 315;
    property RecebeFacilityCodes[pThreadIndex: Integer; pId: Byte; 
                                 out pCodes: {??SFacility}OleVariant]: WordBool readonly dispid 316;
    procedure SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool); dispid 223;
    property Add_Horario[pThreadIndex: Integer; const pPeriodos: WideString; 
                         out pIndexHorario: Integer]: WordBool readonly dispid 224;
    property Add_Escala[pThreadIndex: Integer; pEscala: {??SEscala}OleVariant; 
                        out pEscalaIndex: Integer]: WordBool readonly dispid 273;
    property Add_MsgEspec[pThreadIndex: Integer; var pMsgEspec: {??SMsgEspecifica}OleVariant]: WordBool readonly dispid 272;
    property DigitosRange[pPlaca: SPlacaCard; pMinimo: WordBool]: Integer readonly dispid 291;
    property ErrorDescription[pErrorCode: Integer]: WideString readonly dispid 317;
    property Bio_CarregaTemplate[const pTemplate: WideString]: WordBool readonly dispid 318;
    procedure SetSecurityLevel(pValue: Byte); dispid 319;
    property Bio_ProcuraTemplate[const pMatricula: WideString; const pTemplate: WideString]: WideString readonly dispid 320;
    procedure Bio_DropTemplates; dispid 321;
    procedure SetSearchTimeout(pSegundos: Integer); dispid 322;
    property EnviaAcionaCtrl[pThreadIndex: Integer; pId: Byte; 
                             pAcionaCtrl: {??SAcionaCtrl}OleVariant]: WordBool readonly dispid 323;
    procedure SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool); dispid 324;
    function SetorPercentualEx(var pParticionamento: {??SParticionamento}OleVariant; 
                               pSetor: SParticao; pExpansao: SExpansao): Double; dispid 326;
    procedure RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer); dispid 327;
    property MostRecentFirmware[pConfig: {??SConfiguracao}OleVariant]: WideString readonly dispid 325;
    property getConnResetTimeout[pThreadIndex: Integer; out pTimeout: SResetCon]: WordBool readonly dispid 328;
    procedure setConnResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon); dispid 329;
    function Bio_DropTemplate(const pMatricula: WideString): WordBool; dispid 330;
    property EnviaDadosEmpregador[pThreadIndex: Integer; pEmpregador: {??SEmpregador}OleVariant]: WordBool readonly dispid 333;
    property RecebeDadosEmpregador[pThreadIndex: Integer; out pEmpregador: {??SEmpregador}OleVariant]: WordBool readonly dispid 331;
    property EnviaUsuarioEquipamento[pThreadIndex: Integer; 
                                     pUsuario: {??SUsuarioEquipamento}OleVariant]: WordBool readonly dispid 332;
    property RecebeListaUsuarioEquipamento[pThreadIndex: Integer]: WordBool readonly dispid 334;
    property Rec_UsuarioEquipamento[pThreadIndex: Integer; 
                                    out pUsuario: {??SUsuarioEquipamento}OleVariant]: WordBool readonly dispid 335;
    property ColetaEventos[pThreadIndex: Integer; const pPathAFD: WideString]: WordBool readonly dispid 336;
    function PararColetaEventos(pThreadIndex: Integer): WordBool; dispid 337;
    property ColetaEventosEx[pThreadIndex: Integer; const pPathAFD: WideString; pData: TDateTime; 
                             pEmpregador: {??SEmpregador}OleVariant]: WordBool readonly dispid 338;
    property EnviaListaAcessoThd[pThreadIndex: Integer]: WordBool readonly dispid 339;
    property EnviaListaUsuarios[pThreadIndex: Integer]: WordBool readonly dispid 340;
    property Add_UsuarioEquipamento[pThreadIndex: Integer; 
                                    pUsuario: {??SUsuarioEquipamento}OleVariant]: WordBool readonly dispid 341;
    function CancelarOperacao(pThreadIndex: Integer): WordBool; dispid 342;
    property DataHoraUltimaComunicacao[pThreadIndex: Integer; out pLastCommDateTime: Double]: WordBool readonly dispid 343;
    function SalvaImagemMemoria(pThreadIndex: Integer; const pCaminhoArquivo: WideString): WordBool; dispid 344;
  end;

// *********************************************************************//
// DispIntf:  IKernelEvents
// Flags:     (4096) Dispatchable
// GUID:      {89C7B996-2E02-4A41-9365-41666AF7E611}
// *********************************************************************//
  IKernelEvents = dispinterface
    ['{89C7B996-2E02-4A41-9365-41666AF7E611}']
    procedure OnRegistro(pThreadIndex: Integer); dispid 201;
    procedure OnProgresso(pThreadIndex: Integer; pByte: Integer; pByteMax: Integer; 
                          pBuffer: Integer; pBufferMax: Integer); dispid 202;
    procedure OnExistOff(pThreadIndex: Integer; pQtRegs: Integer; pNumRel: Byte); dispid 203;
    procedure OnStatus(pThreadIndex: Integer; pDeviceID: Integer; pStatus: Integer); dispid 204;
    procedure OnImagemDsp(pThreadIndex: Integer; const pImagem: WideString); dispid 205;
    procedure OnColetaEventos(pThreadIndex: Integer; pResultado: WordBool; 
                              pQtdeEventosColetados: Integer; const pPathAFD: WideString); dispid 206;
    procedure OnOperacao(pThreadIndex: Integer; pResultado: WordBool; pCodigoOp: Integer; 
                         const pParam: WideString); dispid 207;
  end;

// *********************************************************************//
// Interface: IHamster
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1AC83EA-565A-418B-889B-4B5C038B61A8}
// *********************************************************************//
  IHamster = interface(IDispatch)
    ['{D1AC83EA-565A-418B-889B-4B5C038B61A8}']
    function Get_Capture(out pTemplate: WideString): WordBool; safecall;
    function Get_Verify(const pTemplate: WideString): WordBool; safecall;
    function Get_Timeout: Integer; safecall;
    procedure Set_Timeout(Value: Integer); safecall;
    function Get_Brightness: Integer; safecall;
    procedure Set_Brightness(Value: Integer); safecall;
    function Get_Sensitivity: Integer; safecall;
    procedure Set_Sensitivity(Value: Integer); safecall;
    procedure SetImagem(pHandle: Integer; pTop: Integer; pLeft: Integer; pHeight: Integer; 
                        pWidth: Integer); safecall;
    function Get_SetUser(const pTemplate: WideString; const pMatricula: WideString; 
                         pMaster: WordBool): WideString; safecall;
    function Get_CaptureContinuous(out pTemplate: WideString): WordBool; safecall;
    procedure AbortCapturing; safecall;
    procedure CaptureNet(out pTemplate: WideString; out pStatus: WordBool); safecall;
    procedure CaptureContinuousNet(out pTemplate: WideString; out pStatus: WordBool); safecall;
    procedure CaptureImage(out pImgTemplate: WideString; out pStatus: WordBool); safecall;
    function Get_Quality: Integer; safecall;
    property Capture[out pTemplate: WideString]: WordBool read Get_Capture;
    property Verify[const pTemplate: WideString]: WordBool read Get_Verify;
    property Timeout: Integer read Get_Timeout write Set_Timeout;
    property Brightness: Integer read Get_Brightness write Set_Brightness;
    property Sensitivity: Integer read Get_Sensitivity write Set_Sensitivity;
    property SetUser[const pTemplate: WideString; const pMatricula: WideString; pMaster: WordBool]: WideString read Get_SetUser;
    property CaptureContinuous[out pTemplate: WideString]: WordBool read Get_CaptureContinuous;
    property Quality: Integer read Get_Quality;
  end;

// *********************************************************************//
// DispIntf:  IHamsterDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D1AC83EA-565A-418B-889B-4B5C038B61A8}
// *********************************************************************//
  IHamsterDisp = dispinterface
    ['{D1AC83EA-565A-418B-889B-4B5C038B61A8}']
    property Capture[out pTemplate: WideString]: WordBool readonly dispid 201;
    property Verify[const pTemplate: WideString]: WordBool readonly dispid 202;
    property Timeout: Integer dispid 203;
    property Brightness: Integer dispid 204;
    property Sensitivity: Integer dispid 205;
    procedure SetImagem(pHandle: Integer; pTop: Integer; pLeft: Integer; pHeight: Integer; 
                        pWidth: Integer); dispid 206;
    property SetUser[const pTemplate: WideString; const pMatricula: WideString; pMaster: WordBool]: WideString readonly dispid 207;
    property CaptureContinuous[out pTemplate: WideString]: WordBool readonly dispid 208;
    procedure AbortCapturing; dispid 209;
    procedure CaptureNet(out pTemplate: WideString; out pStatus: WordBool); dispid 210;
    procedure CaptureContinuousNet(out pTemplate: WideString; out pStatus: WordBool); dispid 211;
    procedure CaptureImage(out pImgTemplate: WideString; out pStatus: WordBool); dispid 212;
    property Quality: Integer readonly dispid 213;
  end;

// *********************************************************************//
// Interface: IAlternativo
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {84685C6E-1264-476F-9EFA-6D8A33246B8B}
// *********************************************************************//
  IAlternativo = interface(IDispatch)
    ['{84685C6E-1264-476F-9EFA-6D8A33246B8B}']
    function Get_ListaPortasSeriais: WideString; safecall;
    function Get_AdicionaCardSerial(pNumero: Byte; const pPorta: WideString; 
                                    pVelocidade: SVelocidade; pCatraca: WordBool; 
                                    pModoComunicacao: SModoComunicacao): Integer; safecall;
    function Get_AdicionaCardUsb(pCatraca: WordBool): Integer; safecall;
    function Get_AdicionaCardModem(const pPorta: WideString; const pFone: WideString; 
                                   pCatraca: WordBool): Integer; safecall;
    function Get_AdicionaCardSerial485(pNumero: Byte; const pPorta: WideString; 
                                       pVelocidade: SVelocidade; pCatraca: WordBool; 
                                       pModoComunicacao: SModoComunicacao): Integer; safecall;
    procedure RegistroOn(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                         out pMatricula: WideString; out pDataHora: TDateTime; 
                         out pFlag: SFlagRegistro; out pSaida: WordBool; 
                         out pMasterLiberou: WordBool; out pFuncaoLiberou: WordBool; 
                         out pAcessoNegado: WordBool; out pFonteEntrada: SFonteEntrada; 
                         out pTipoNegado: STipoNegado); safecall;
    function Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool; safecall;
    procedure SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool); safecall;
    function Get_ThreadLastError(pThreadIndex: Integer): Integer; safecall;
    function Get_USB_Remove: WordBool; safecall;
    function Get_EnviaConfiguracao(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeConfiguracao(pThreadIndex: Integer): WordBool; safecall;
    procedure cfg_getInfo(out Versao: WideString; out Placa: SPlacaCard; out Orion: WordBool; 
                          out Expansao: WordBool; out Biometria: SBiometria); safecall;
    procedure cfg_getReles(ReleIndex: Byte; out Status: SReleStatus; out TipoNANF: SReleNANF; 
                           out Tempo: Byte); safecall;
    procedure cfg_setReles(ReleIndex: Byte; Status: SReleStatus; TipoNANF: SReleNANF; Tempo: Byte); safecall;
    procedure cfg_getLeitores(out Leitor1: SLeitor; out Leitor2: SLeitor; out Leitor3: SLeitor); safecall;
    procedure cfg_setLeitores(Leitor1: SLeitor; Leitor2: SLeitor; Leitor3: SLeitor); safecall;
    procedure cfg_getCodigoBarras(out PadraoD: WordBool; out Letras: WordBool; 
                                  out PadraoLivre: WordBool; out DigitosAutomatico: WordBool; 
                                  out PadraoT: WordBool; out OcultarDigitos: WordBool); safecall;
    procedure cfg_setCodigoBarras(PadraoD: WordBool; Letras: WordBool; PadraoLivre: WordBool; 
                                  DigitosAutomatico: WordBool; PadraoT: WordBool; 
                                  OcultarDigitos: WordBool); safecall;
    procedure cfg_getRevista(out Tipo: STipoRevista; out Percentual: Byte); safecall;
    procedure cfg_setRevista(Tipo: STipoRevista; Percentual: Byte); safecall;
    procedure cfg_getEmpresas(out Empresa1: WideString; out Empresa2: WideString; 
                              out Empresa3: WideString; out Empresa4: WideString; 
                              out Empresa5: WideString); safecall;
    procedure cfg_setEmpresas(const Empresa1: WideString; const Empresa2: WideString; 
                              const Empresa3: WideString; const Empresa4: WideString; 
                              const Empresa5: WideString); safecall;
    procedure cfg_getCtrlAcessoEx(out Gravacao: SGravacao; out AtivarMaster: WordBool; 
                                  out Sinaliza50Percent: WordBool; out SenhaPadraoHenry: WordBool; 
                                  out Catraca: WordBool; out CatracaInvertida: WordBool; 
                                  out CatracaDupla: WordBool); safecall;
    procedure cfg_setCtrlAcessoEx(Gravacao: SGravacao; AtivarMaster: WordBool; 
                                  Sinaliza50Percent: WordBool; SenhaPadraoHenry: WordBool; 
                                  Catraca: WordBool; CatracaInvertida: WordBool; 
                                  CatracaDupla: WordBool); safecall;
    procedure cfg_getControles(out BloqueiaPeriodo: WordBool; out BiometriaOnline: WordBool; 
                               out FuncoesEspecificas: WordBool; out CatBioLiberaAmbos: WordBool; 
                               out Visitantes: WordBool; out Touch: WordBool; 
                               out BimetriaImagem: WordBool; out AutoOn: SAutoOn); safecall;
    procedure cfg_setControles(BloqueiaPeriodo: WordBool; BiometriaOnline: WordBool; 
                               FuncoesEspecificas: WordBool; CatBioLiberaAmbos: WordBool; 
                               Visitantes: WordBool; Touch: WordBool; BiometriaImagem: WordBool; 
                               AutoOn: SAutoOn); safecall;
    procedure cfg_getAntiPassBack(out Habilitado: WordBool; out EntradaSaida: WordBool; 
                                  out Tempo: Byte); safecall;
    procedure cfg_setAntiPassBack(Habilitado: WordBool; EntradaSaida: WordBool; Tempo: Byte); safecall;
    procedure cfg_getSensores(pSensorIndex: Byte; out Habilitado: WordBool; out Porta: WordBool; 
                              out Botao: WordBool; out Rele1: WordBool; out Rele2: WordBool; 
                              out Rele3: WordBool; out Rele4: WordBool; out Rele5: WordBool); safecall;
    procedure cfg_setSensores(SensorIndex: Byte; Habilitado: WordBool; Porta: WordBool; 
                              Botao: WordBool; Rele1: WordBool; Rele2: WordBool; Rele3: WordBool; 
                              Rele4: WordBool; Rele5: WordBool); safecall;
    procedure cfg_getConfig(out ModoComunicacao: SModoComunicacao; out Teclado: STeclado; 
                            out NumDigitos: Byte; out NivelAcesso: Byte; out ToquesAtender: Byte; 
                            out DigitosSel: SDigitos; out SenhaMenu: WordBool; 
                            out Senha: WideString; out CtrlAcesso: SCtrlAcesso); safecall;
    procedure cfg_setConfig(ModoComunicacao: SModoComunicacao; Teclado: STeclado; NumDigitos: Byte; 
                            NivelAcesso: Byte; ToquesAtender: Byte; const DigitosSel: WideString; 
                            SenhaMenu: WordBool; const Senha: WideString; CtrlAcesso: SCtrlAcesso); safecall;
    function Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool; safecall;
    function Get_ThreadPrioridade(pThreadIndex: Integer; pPrioridade: SPrioridade): WordBool; safecall;
    function Get_ExistemRegistros(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecuperaRegistros(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaBeep(pThreadIndex: Integer; pBip: SBeep): WordBool; safecall;
    function Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool; safecall;
    function Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHora: TDateTime; 
                                 pUsarHorarioVerao: WordBool; pHorarioVeraoInicio: TDateTime; 
                                 pHorarioVeraoTermino: TDateTime): WordBool; safecall;
    function Get_EnviaTipoCatraca(pThreadIndex: Integer; pStatusGiro: SStatusGiro; 
                                  pTempoLiberacao: Byte): WordBool; safecall;
    function Get_EnviaFuncoes(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeFuncoes(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaFeriados(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeFeriados(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaPeriodos(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebePeriodos(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaHorarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeHorarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaMsgPadrao(pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                                pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                                const pMsgPadraoLinha1: WideString; 
                                const pMsgPadraoLinha2: WideString; 
                                const pMsgEntradaLinha1: WideString; 
                                const pMsgEntradaLinha2: WideString; 
                                const pMsgSaidaLinha1: WideString; 
                                const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                                pTempoEntrada: Byte; pTempoSaida: Byte): WordBool; safecall;
    function Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool; safecall;
    function Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaParticionamento(pThreadIndex: Integer; pFuncoes: Integer; pFeriados: Integer; 
                                      pAcionamentos: Integer; pListaAcesso: Integer; 
                                      pPeriodos: Integer; pHorarios: Integer; 
                                      pMsgEspecifica: Integer; pRegistros: Integer): WordBool; safecall;
    function Get_Versao: WideString; safecall;
    function Get_RemoveCard(pThreadIndex: Integer): WordBool; safecall;
    function Get_Bio_UsuariosQuant(pThreadIndex: Integer): Integer; safecall;
    function Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString): WordBool; safecall;
    function Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString): WideString; safecall;
    function Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool; safecall;
    function Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 pFingerOnly: WordBool): WordBool; safecall;
    function Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool; safecall;
    function Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                                pMaster: WordBool): WideString; safecall;
    function Get_Bio_GetMaxQuantList(pThreadIndex: Integer): Integer; safecall;
    function Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer): Integer; safecall;
    function Get_DetectarVelocidade(pThreadIndex: Integer): SVelocidade; safecall;
    procedure Add_Funcao(pThreadIndex: Integer; pAtiva: WordBool; pLiberaAcesso: WordBool; 
                         const pMensagem: WideString; pTempo: Byte); safecall;
    procedure Add_Feriado(pThreadIndex: Integer; pDia: TDateTime); safecall;
    procedure Add_Acionamento(pThreadIndex: Integer; pHorario: TDateTime; pTempo: Byte; 
                              pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                              pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                              pSabado: WordBool; pFeriado: WordBool); safecall;
    procedure Add_Periodo(pThreadIndex: Integer; pHorario: TDateTime; pTolerancia: Byte; 
                          pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                          pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                          pSabado: WordBool; pFeriado: WordBool); safecall;
    procedure Add_ItemAcesso(pThreadIndex: Integer; const pMatricula: WideString; 
                             pIndexHorario: Byte; pAcesso: SAcessoOffline; 
                             pPerBloqInicio: TDateTime; pPerBloqFinal: TDateTime; 
                             pPerBloqHabilitado: WordBool; pAcionaRele1: WordBool; 
                             pAcionaRele2: WordBool; pAcionaRele3: WordBool; 
                             pVerificarDigital: WordBool; pMaster: WordBool; pVisitante: WordBool); safecall;
    procedure Add_Escala(pThreadIndex: Integer; pDataInicio: TDateTime; const pHorarios: WideString); safecall;
    procedure Add_MsgEspec(pThreadIndex: Integer; pMsgEstilo: SMsgEstilo; pMsgTempo: Byte; 
                           const pMsgLinha1: WideString; const pMsgLinha2: WideString; 
                           const pMatriculas: WideString; pData: TDateTime; pTodosDias: WordBool); safecall;
    function Get_NumDigitosValidos: Byte; safecall;
    function Get_NumDigitosPadraoT: Byte; safecall;
    function Get_MoreRecentFirmware: WideString; safecall;
    function Get_RaiseExceptions: WordBool; safecall;
    procedure Set_RaiseExceptions(Value: WordBool); safecall;
    function Get_QuantRegsColetados(pThreadIndex: Integer): Integer; safecall;
    procedure SetConectado(pThreadIndex: Integer; pConectado: WordBool); safecall;
    function Get_KernelLastError: Integer; safecall;
    function Get_RecebePacote(pThreadIndex: Integer): WordBool; safecall;
    function Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool; safecall;
    procedure BeginLargeTransfer(pThreadIndex: Integer); safecall;
    procedure EndLargeTransfer(pThreadIndex: Integer); safecall;
    function Get_TamanhoRegistro: Integer; safecall;
    function Get_TamanhoItemAcesso: Integer; safecall;
    function Get_SRFuncoes(pQtFuncoes: Integer): Integer; safecall;
    function Get_SRFeriados(pQtFeriados: Integer): Integer; safecall;
    function Get_SRAcionamentos(pQtAcionamentos: Integer): Integer; safecall;
    function Get_SRListaAcesso(pQtItens: Integer): Integer; safecall;
    function Get_SRPeriodos(pQtPeriodos: Integer): Integer; safecall;
    function Get_SRHorariosEscalas(pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                                   pQtEscalas: Integer; pQtHorariosPorEscala: Integer): Integer; safecall;
    function Get_SRMsgEspecifica(pQtMsgs: Integer; pQtMatriculasPorMsg: Integer): Integer; safecall;
    function Get_SRFuncoesEspecificas(pQtMatriculas: Integer; pQtFuncoesPorMatricula: Integer): Integer; safecall;
    procedure RespostaOn(pThreadIndex: Integer; pAcesso: SAcessoOnline; 
                         const pMensagem: WideString; pTempo: Byte); safecall;
    procedure Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString); safecall;
    procedure Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                const pMensagem: WideString; pTempo: Byte; pNumero: Byte); safecall;
    function Get_SetorPercentual(pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                                 pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                                 pMsgEspecifica: Integer; pRegistros: Integer; pSetor: SParticao): Double; safecall;
    procedure RegistroOff(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                          out pMatricula: WideString; out pDataHora: TDateTime; 
                          out pFlag: SFlagRegistro; out pSaida: WordBool; 
                          out pMasterLiberou: WordBool; out pFuncaoLiberou: WordBool; 
                          out pAcessoNegado: WordBool; out pFonteEntrada: SFonteEntrada; 
                          out pTipoNegado: STipoNegado); safecall;
    function Get_AdicionaCardTcpIp(const pIp: WideString; const pMac: WideString; pPorta: Integer; 
                                   pCatraca: WordBool; pModoComunicacao: SModoComunicacao): Integer; safecall;
    function Get_RecebeQtRegistros(pThreadIndex: Integer): Integer; safecall;
    procedure RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime); safecall;
    procedure RecebeDataHoraEx(pThreadIndex: Integer; out pDataHora: TDateTime; 
                               out pUsarHorarioVerao: WordBool; out pHorarioVeraoInicio: TDateTime; 
                               out pHorarioVeraoFim: TDateTime); safecall;
    procedure RecebeTipoCatraca(pThreadIndex: Integer; out pStatusGiro: SStatusGiro; 
                                out pTempoLiberacao: Byte); safecall;
    procedure Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                             out pMatricula: WideString; out pTemplate: WideString; 
                             out pId: WideString; out pMaster: WordBool; out pDedo: Byte); safecall;
    procedure Bio_GetUsuario(pThreadIndex: Integer; out pMatricula: WideString; 
                             out pId: WideString; out pDedo: Byte; out pMaster: WordBool); safecall;
    procedure Rec_Funcao(pThreadIndex: Integer; out pAtiva: WordBool; out pLiberaAcesso: WordBool; 
                         out pMensagem: WideString; out pTempo: Byte); safecall;
    procedure Rec_Feriado(pThreadIndex: Integer; out pFeriado: TDateTime); safecall;
    procedure Rec_Horario(pThreadIndex: Integer; out pHorario: WideString); safecall;
    procedure Rec_Acionamento(pThreadIndex: Integer; out pHorario: TDateTime; out pTempo: Byte; 
                              out pDomingo: WordBool; out pSegunda: WordBool; out pTerca: WordBool; 
                              out pQuarta: WordBool; out pQuinta: WordBool; out pSexta: WordBool; 
                              out pSabado: WordBool; out pFeriado: WordBool); safecall;
    function Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer; safecall;
    procedure SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool); safecall;
    procedure RecebeParticionamento(pThreadIndex: Integer; out pFuncoes: Integer; 
                                    out pFeriados: Integer; out pAcionamentos: Integer; 
                                    out pListaAcesso: Integer; out pPeriodos: Integer; 
                                    out pHorarios: Integer; out pMsgEspecifica: Integer; 
                                    out pRegistros: Integer); safecall;
    function Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool; safecall;
    function Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString; safecall;
    procedure SetSecurityLevel(pValue: Byte); safecall;
    procedure RespostaOnB(pThreadIndex: Integer; pAcessoLiberado: WordBool; pIDControlador: Byte; 
                          pTempoRele1: Byte; pTempoRele2: Byte; pTempoRele3: Byte); safecall;
    procedure Bio_DropTemplates; safecall;
    procedure SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool); safecall;
    procedure Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                          out pIndexHorario: Integer); safecall;
    procedure Rec_Escala(pThreadIndex: Integer; out pDataInicio: TDateTime; 
                         out pHorarios: WideString; out pStatus: WordBool); safecall;
    procedure Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString; 
                                   out pStatus: WordBool); safecall;
    procedure Rec_FncEsp_Funcao(pThreadIndex: Integer; out pMatricula: WideString; 
                                out pMensagem: WideString; out pTempo: Byte; out pNumero: Byte; 
                                out pStatus: WordBool); safecall;
    procedure Rec_Periodo(pThreadIndex: Integer; out pHorario: TDateTime; out pTolerancia: Byte; 
                          out pDomingo: WordBool; out pSegunda: WordBool; out pTerca: WordBool; 
                          out pQuarta: WordBool; out pQuinta: WordBool; out pSexta: WordBool; 
                          out pSabado: WordBool; out pFeriado: WordBool; out pStatus: WordBool); safecall;
    procedure Rec_MsgEspec(pThreadIndex: Integer; out pMsgStatus: SMsgEstilo; out pMsgTempo: Byte; 
                           out pMsgLinha1: WideString; out pMsgLinha2: WideString; 
                           out pMatriculas: WideString; out pData: TDateTime; 
                           out pTodosDias: WordBool; out pStatus: WordBool); safecall;
    procedure Rec_ItemAcesso(pThreadIndex: Integer; out pMatricula: WideString; out pHorario: Byte; 
                             out pAcesso: SAcessoOffline; out pPerBloqIni: TDateTime; 
                             out pPerBloqFim: TDateTime; out pPerBloqHab: WordBool; 
                             out pAcionaRele1: WordBool; out pAcionaRele2: WordBool; 
                             out pAcionaRele3: WordBool; out pVerificarDigital: WordBool; 
                             out pMaster: WordBool; out pVisitante: WordBool; out pStatus: WordBool); safecall;
    function Get_EnviaConfigDSP(pThreadIndex: Integer; pNivelSeguranca: Integer; 
                                pVelocidade: Integer; pSensibilidade: Integer; 
                                pQualidadeImagem: Integer; pCondicaoIluminacao: WordBool): WordBool; safecall;
    procedure RecebeConfigDSP(pThreadIndex: Integer; out pNivelSeguranca: Integer; 
                              out pVelocidade: Integer; out pSensibilidade: Integer; 
                              out pQualidadeImagem: Integer; out pCondicaoIluminacao: WordBool; 
                              out pStatus: WordBool); safecall;
    procedure RecebeMsgPadrao(pThreadIndex: Integer; out pEstiloMsgPadrao: SMsgEstilo; 
                              out pEstiloMsgEntrada: SMsgEstilo; out pEstiloMsgSaida: SMsgEstilo; 
                              out pMsgPadraoLinha1: WideString; out pMsgPadraoLinha2: WideString; 
                              out pMsgEntradaLinha1: WideString; out pMsgEntradaLinha2: WideString; 
                              out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                              out pTempoMsgPadrao: Byte; out pTempoMsgEntrada: Byte; 
                              out pTempoMsgSaida: Byte; out pStatus: WordBool); safecall;
    function Get_AdicionaCardGPRS(pCatraca: WordBool; pPorta: Integer; 
                                  pModoComunicacao: SModoComunicacao): Integer; safecall;
    function Get_RecebeMsgPadraoB(pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                                  out pEstiloEntrada: SMsgEstilo; out pEstiloSaida: SMsgEstilo; 
                                  out pMsgPadraoLinha1: WideString; 
                                  out pMsgPadraoLinha2: WideString; 
                                  out pMsgEntradaLinha1: WideString; 
                                  out pMsgEntradaLinha2: WideString; 
                                  out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                                  out pTempoPadrao: Byte; out pTempoEntrada: Byte; 
                                  out pTempoSaida: Byte): WordBool; safecall;
    function Get_SetorPercentualEx(pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                                   pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                                   pMsgEspec: Integer; pRegistros: Integer; pSetor: SParticao; 
                                   pExpansao: SExpansao): Double; safecall;
    procedure RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer); safecall;
    function ErrorDescription(pErrorCode: Integer): WideString; safecall;
    function Get_MostRecentFirmware(pPlacaCard: SPlacaCard; pOrion: WordBool): WideString; safecall;
    procedure cfg_setControleLeitoras(pLeitoraVerificaDigital: WordBool; pBiometria11: WordBool); safecall;
    procedure cfg_getControleLeitoras(out pLeitoraVerificaDigital: WordBool; 
                                      out pBiometria11: WordBool); safecall;
    procedure setGPRSResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon); safecall;
    procedure getGPRSResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon); safecall;
    procedure RegistroOnExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                            out pMatricula: WideString; out pDataHora: TDateTime; 
                            out pFlag: SFlagRegistro; out pSaida: WordBool; 
                            out pMasterLiberou: WordBool; out pFonteEntrada: SFonteEntrada; 
                            out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                            out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                            out pIdSensor: Byte); safecall;
    procedure cfg_setCfgControlador(pCatraca: WordBool; pWorkOff: WordBool; pTempoRele1: Byte; 
                                    pTempoRele2: Byte; pTempoRele3: Byte); safecall;
    procedure cfg_getCfgControlador(out pCatraca: WordBool; out pWorkOff: WordBool; 
                                    out pTempoRele1: Byte; out pTempoRele2: Byte; 
                                    out pTempoRele3: Byte); safecall;
    procedure cfg_setSensoresCtrl(pIndexSensor: Integer; pHabilitado: WordBool; 
                                  pTipoSensor: STipoSensor; pRele1: WordBool; pRele2: WordBool; 
                                  pRele3: WordBool); safecall;
    procedure cfg_getSensoresCtrl(pIndexSensor: Integer; out pHabilitado: WordBool; 
                                  out pTipoSensor: STipoSensor; out pRele1: WordBool; 
                                  out pRele2: WordBool; out pRele3: WordBool); safecall;
    procedure cfg_setLeitoresCtrl(pIndexLeitora: Integer; pRele1: Byte; pRele2: Byte; pRele3: Byte); safecall;
    procedure cfg_getLeitoresCtrl(pIndexLeitora: Integer; out pRele1: Byte; out pRele2: Byte; 
                                  out pRele3: Byte); safecall;
    function Get_EnviaConfiguracaoControlador(pThreadIndex: Integer; pIDControlador: Integer): WordBool; safecall;
    function Get_RecebeConfiguracaoControlador(pThreadIndex: Integer; pIDControlador: Integer): WordBool; safecall;
    procedure RegistroOffExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                             out pMatricula: WideString; out pDataHora: TDateTime; 
                             out pFlag: SFlagRegistro; out pSaida: WordBool; 
                             out pMasterLiberou: WordBool; out pFonteEntrada: SFonteEntrada; 
                             out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                             out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                             out pIdSensor: Byte); safecall;
    procedure cfg_getControladores(out pControladores: WideString); safecall;
    function Bio_DropTemplate(const pMatricula: WideString): WordBool; safecall;
    function Get_EnviaDadosEmpregador(pThreadIndex: Integer; const pRazaoSocial: WideString; 
                                      const pLocal: WideString; const pDocumento: WideString; 
                                      const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool; safecall;
    procedure RecebeDadosEmpregador(pThreadIndex: Integer; out pRazaoSocial: WideString; 
                                    out pLocal: WideString; out pDocumento: WideString; 
                                    out pCEI: WideString; out pIdEmpregador: SIdEmpregador; 
                                    out pStatus: WordBool); safecall;
    function Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; const pMatriculas: WideString; 
                                         const pPIS: WideString; const pNome: WideString; 
                                         pVerificaDigital: WordBool; 
                                         pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool; safecall;
    function Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool; safecall;
    procedure Rec_UsuarioEquipamento(pThreadIndex: Integer; out pMatriculas: WideString; 
                                     out pPIS: WideString; out pNome: WideString; 
                                     out pVerificaDigital: WordBool; 
                                     out pTipoOperacao: SOperacaoUsuarioEquipamento; 
                                     out pStatus: WordBool); safecall;
    function Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool; safecall;
    function PararColetaEventos(pThreadIndex: Integer): WordBool; safecall;
    function Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                 pData: TDateTime; const pRazaoSocial: WideString; 
                                 const pLocal: WideString; const pDocumento: WideString; 
                                 const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool; safecall;
    procedure cfg_setControleTempos(pTimeoutProcessamentoOnline: Integer; pLatenciaOffline: Integer); safecall;
    procedure cfg_getControleTempos(out pTimeoutProcessamentoOnline: Integer; 
                                    out pLatenciaOffline: Integer); safecall;
    procedure SetSearchTimeout(pSegundos: Integer); safecall;
    function Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool; safecall;
    function Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool; safecall;
    function Get_Add_UsuarioEquipamento(pThreadIndex: Integer; const pMatriculas: WideString; 
                                        const pPIS: WideString; const pNome: WideString; 
                                        pVerificaDigital: WordBool; 
                                        pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool; safecall;
    function CancelarOperacao(pThreadIndex: Integer): WordBool; safecall;
    function Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool; safecall;
    procedure cfg_getConfigFlags(out LeitorasAutomaticas: WordBool); safecall;
    procedure cfg_setConfigFlags(LeitorasAutomaticas: WordBool); safecall;
    property ListaPortasSeriais: WideString read Get_ListaPortasSeriais;
    property AdicionaCardSerial[pNumero: Byte; const pPorta: WideString; pVelocidade: SVelocidade; 
                                pCatraca: WordBool; pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardSerial;
    property AdicionaCardUsb[pCatraca: WordBool]: Integer read Get_AdicionaCardUsb;
    property AdicionaCardModem[const pPorta: WideString; const pFone: WideString; pCatraca: WordBool]: Integer read Get_AdicionaCardModem;
    property AdicionaCardSerial485[pNumero: Byte; const pPorta: WideString; 
                                   pVelocidade: SVelocidade; pCatraca: WordBool; 
                                   pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardSerial485;
    property Set485OffNumber[pThreadIndex: Integer; pNumero: Byte]: WordBool read Get_Set485OffNumber;
    property ThreadLastError[pThreadIndex: Integer]: Integer read Get_ThreadLastError;
    property USB_Remove: WordBool read Get_USB_Remove;
    property EnviaConfiguracao[pThreadIndex: Integer]: WordBool read Get_EnviaConfiguracao;
    property RecebeConfiguracao[pThreadIndex: Integer]: WordBool read Get_RecebeConfiguracao;
    property AlterarVelocidade[pThreadIndex: Integer; pNovaVelocidade: SVelocidade]: WordBool read Get_AlterarVelocidade;
    property ThreadPrioridade[pThreadIndex: Integer; pPrioridade: SPrioridade]: WordBool read Get_ThreadPrioridade;
    property ExistemRegistros[pThreadIndex: Integer]: WordBool read Get_ExistemRegistros;
    property RecuperaRegistros[pThreadIndex: Integer]: WordBool read Get_RecuperaRegistros;
    property EnviaBeep[pThreadIndex: Integer; pBip: SBeep]: WordBool read Get_EnviaBeep;
    property EnviaDataHora[pThreadIndex: Integer; pDataHora: TDateTime]: WordBool read Get_EnviaDataHora;
    property EnviaDataHoraEx[pThreadIndex: Integer; pDataHora: TDateTime; 
                             pUsarHorarioVerao: WordBool; pHorarioVeraoInicio: TDateTime; 
                             pHorarioVeraoTermino: TDateTime]: WordBool read Get_EnviaDataHoraEx;
    property EnviaTipoCatraca[pThreadIndex: Integer; pStatusGiro: SStatusGiro; pTempoLiberacao: Byte]: WordBool read Get_EnviaTipoCatraca;
    property EnviaFuncoes[pThreadIndex: Integer]: WordBool read Get_EnviaFuncoes;
    property RecebeFuncoes[pThreadIndex: Integer]: WordBool read Get_RecebeFuncoes;
    property EnviaFeriados[pThreadIndex: Integer]: WordBool read Get_EnviaFeriados;
    property RecebeFeriados[pThreadIndex: Integer]: WordBool read Get_RecebeFeriados;
    property EnviaAcionamentos[pThreadIndex: Integer]: WordBool read Get_EnviaAcionamentos;
    property RecebeAcionamentos[pThreadIndex: Integer]: WordBool read Get_RecebeAcionamentos;
    property EnviaPeriodos[pThreadIndex: Integer]: WordBool read Get_EnviaPeriodos;
    property RecebePeriodos[pThreadIndex: Integer]: WordBool read Get_RecebePeriodos;
    property EnviaHorarios[pThreadIndex: Integer]: WordBool read Get_EnviaHorarios;
    property RecebeHorarios[pThreadIndex: Integer]: WordBool read Get_RecebeHorarios;
    property EnviaListaAcesso[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcesso;
    property RecebeListaAcesso[pThreadIndex: Integer]: WordBool read Get_RecebeListaAcesso;
    property EnviaMsgPadrao[pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                            pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                            const pMsgPadraoLinha1: WideString; const pMsgPadraoLinha2: WideString; 
                            const pMsgEntradaLinha1: WideString; 
                            const pMsgEntradaLinha2: WideString; const pMsgSaidaLinha1: WideString; 
                            const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                            pTempoEntrada: Byte; pTempoSaida: Byte]: WordBool read Get_EnviaMsgPadrao;
    property EnviaMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_EnviaMsgsEspecificas;
    property RecebeMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_RecebeMsgsEspecificas;
    property EnviaParticionamento[pThreadIndex: Integer; pFuncoes: Integer; pFeriados: Integer; 
                                  pAcionamentos: Integer; pListaAcesso: Integer; 
                                  pPeriodos: Integer; pHorarios: Integer; pMsgEspecifica: Integer; 
                                  pRegistros: Integer]: WordBool read Get_EnviaParticionamento;
    property Versao: WideString read Get_Versao;
    property RemoveCard[pThreadIndex: Integer]: WordBool read Get_RemoveCard;
    property Bio_UsuariosQuant[pThreadIndex: Integer]: Integer read Get_Bio_UsuariosQuant;
    property Bio_UsuarioExiste[pThreadIndex: Integer; const pUsuarioID: WideString]: WordBool read Get_Bio_UsuarioExiste;
    property Bio_RecListaUsuarios[pThreadIndex: Integer]: WordBool read Get_Bio_RecListaUsuarios;
    property Bio_RecTemplate[pThreadIndex: Integer; const pUsuarioID: WideString]: WideString read Get_Bio_RecTemplate;
    property Bio_EnvTemplate[pThreadIndex: Integer; const pTemplate: WideString]: WordBool read Get_Bio_EnvTemplate;
    property Bio_DelTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             pFingerOnly: WordBool]: WordBool read Get_Bio_DelTemplate;
    property Bio_DelTemplateTodas[pThreadIndex: Integer]: WordBool read Get_Bio_DelTemplateTodas;
    property Bio_GeraUserID[pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                            pMaster: WordBool]: WideString read Get_Bio_GeraUserID;
    property Bio_GetMaxQuantList[pThreadIndex: Integer]: Integer read Get_Bio_GetMaxQuantList;
    property Bio_UsuariosQuantLivre[pThreadIndex: Integer]: Integer read Get_Bio_UsuariosQuantLivre;
    property DetectarVelocidade[pThreadIndex: Integer]: SVelocidade read Get_DetectarVelocidade;
    property NumDigitosValidos: Byte read Get_NumDigitosValidos;
    property NumDigitosPadraoT: Byte read Get_NumDigitosPadraoT;
    property MoreRecentFirmware: WideString read Get_MoreRecentFirmware;
    property RaiseExceptions: WordBool read Get_RaiseExceptions write Set_RaiseExceptions;
    property QuantRegsColetados[pThreadIndex: Integer]: Integer read Get_QuantRegsColetados;
    property KernelLastError: Integer read Get_KernelLastError;
    property RecebePacote[pThreadIndex: Integer]: WordBool read Get_RecebePacote;
    property ApagaUltimoPacote[pThreadIndex: Integer]: WordBool read Get_ApagaUltimoPacote;
    property TamanhoRegistro: Integer read Get_TamanhoRegistro;
    property TamanhoItemAcesso: Integer read Get_TamanhoItemAcesso;
    property SRFuncoes[pQtFuncoes: Integer]: Integer read Get_SRFuncoes;
    property SRFeriados[pQtFeriados: Integer]: Integer read Get_SRFeriados;
    property SRAcionamentos[pQtAcionamentos: Integer]: Integer read Get_SRAcionamentos;
    property SRListaAcesso[pQtItens: Integer]: Integer read Get_SRListaAcesso;
    property SRPeriodos[pQtPeriodos: Integer]: Integer read Get_SRPeriodos;
    property SRHorariosEscalas[pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                               pQtEscalas: Integer; pQtHorariosPorEscala: Integer]: Integer read Get_SRHorariosEscalas;
    property SRMsgEspecifica[pQtMsgs: Integer; pQtMatriculasPorMsg: Integer]: Integer read Get_SRMsgEspecifica;
    property SRFuncoesEspecificas[pQtMatriculas: Integer; pQtFuncoesPorMatricula: Integer]: Integer read Get_SRFuncoesEspecificas;
    property SetorPercentual[pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                             pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                             pMsgEspecifica: Integer; pRegistros: Integer; pSetor: SParticao]: Double read Get_SetorPercentual;
    property AdicionaCardTcpIp[const pIp: WideString; const pMac: WideString; pPorta: Integer; 
                               pCatraca: WordBool; pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardTcpIp;
    property RecebeQtRegistros[pThreadIndex: Integer]: Integer read Get_RecebeQtRegistros;
    property DigitosRange[pPlaca: SPlacaCard; pMinimo: WordBool]: Integer read Get_DigitosRange;
    property Bio_CarregaTemplate[const pTemplate: WideString]: WordBool read Get_Bio_CarregaTemplate;
    property Bio_ProcuraTemplate[const pMatricula: WideString; const pTemplate: WideString]: WideString read Get_Bio_ProcuraTemplate;
    property EnviaConfigDSP[pThreadIndex: Integer; pNivelSeguranca: Integer; pVelocidade: Integer; 
                            pSensibilidade: Integer; pQualidadeImagem: Integer; 
                            pCondicaoIluminacao: WordBool]: WordBool read Get_EnviaConfigDSP;
    property AdicionaCardGPRS[pCatraca: WordBool; pPorta: Integer; 
                              pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardGPRS;
    property RecebeMsgPadraoB[pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                              out pEstiloEntrada: SMsgEstilo; out pEstiloSaida: SMsgEstilo; 
                              out pMsgPadraoLinha1: WideString; out pMsgPadraoLinha2: WideString; 
                              out pMsgEntradaLinha1: WideString; out pMsgEntradaLinha2: WideString; 
                              out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                              out pTempoPadrao: Byte; out pTempoEntrada: Byte; out pTempoSaida: Byte]: WordBool read Get_RecebeMsgPadraoB;
    property SetorPercentualEx[pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                               pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                               pMsgEspec: Integer; pRegistros: Integer; pSetor: SParticao; 
                               pExpansao: SExpansao]: Double read Get_SetorPercentualEx;
    property MostRecentFirmware[pPlacaCard: SPlacaCard; pOrion: WordBool]: WideString read Get_MostRecentFirmware;
    property EnviaConfiguracaoControlador[pThreadIndex: Integer; pIDControlador: Integer]: WordBool read Get_EnviaConfiguracaoControlador;
    property RecebeConfiguracaoControlador[pThreadIndex: Integer; pIDControlador: Integer]: WordBool read Get_RecebeConfiguracaoControlador;
    property EnviaDadosEmpregador[pThreadIndex: Integer; const pRazaoSocial: WideString; 
                                  const pLocal: WideString; const pDocumento: WideString; 
                                  const pCEI: WideString; pIdEmpregador: SIdEmpregador]: WordBool read Get_EnviaDadosEmpregador;
    property EnviaUsuarioEquipamento[pThreadIndex: Integer; const pMatriculas: WideString; 
                                     const pPIS: WideString; const pNome: WideString; 
                                     pVerificaDigital: WordBool; 
                                     pTipoOperacao: SOperacaoUsuarioEquipamento]: WordBool read Get_EnviaUsuarioEquipamento;
    property RecebeListaUsuarioEquipamento[pThreadIndex: Integer]: WordBool read Get_RecebeListaUsuarioEquipamento;
    property ColetaEventos[pThreadIndex: Integer; const pPathAFD: WideString]: WordBool read Get_ColetaEventos;
    property ColetaEventosEx[pThreadIndex: Integer; const pPathAFD: WideString; pData: TDateTime; 
                             const pRazaoSocial: WideString; const pLocal: WideString; 
                             const pDocumento: WideString; const pCEI: WideString; 
                             pIdEmpregador: SIdEmpregador]: WordBool read Get_ColetaEventosEx;
    property EnviaListaAcessoThd[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcessoThd;
    property EnviaListaUsuarios[pThreadIndex: Integer]: WordBool read Get_EnviaListaUsuarios;
    property Add_UsuarioEquipamento[pThreadIndex: Integer; const pMatriculas: WideString; 
                                    const pPIS: WideString; const pNome: WideString; 
                                    pVerificaDigital: WordBool; 
                                    pTipoOperacao: SOperacaoUsuarioEquipamento]: WordBool read Get_Add_UsuarioEquipamento;
    property DataHoraUltimaComunicacao[pThreadIndex: Integer; out pLastCommDateTime: Double]: WordBool read Get_DataHoraUltimaComunicacao;
  end;

// *********************************************************************//
// DispIntf:  IAlternativoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {84685C6E-1264-476F-9EFA-6D8A33246B8B}
// *********************************************************************//
  IAlternativoDisp = dispinterface
    ['{84685C6E-1264-476F-9EFA-6D8A33246B8B}']
    property ListaPortasSeriais: WideString readonly dispid 201;
    property AdicionaCardSerial[pNumero: Byte; const pPorta: WideString; pVelocidade: SVelocidade; 
                                pCatraca: WordBool; pModoComunicacao: SModoComunicacao]: Integer readonly dispid 202;
    property AdicionaCardUsb[pCatraca: WordBool]: Integer readonly dispid 204;
    property AdicionaCardModem[const pPorta: WideString; const pFone: WideString; pCatraca: WordBool]: Integer readonly dispid 205;
    property AdicionaCardSerial485[pNumero: Byte; const pPorta: WideString; 
                                   pVelocidade: SVelocidade; pCatraca: WordBool; 
                                   pModoComunicacao: SModoComunicacao]: Integer readonly dispid 206;
    procedure RegistroOn(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                         out pMatricula: WideString; out pDataHora: TDateTime; 
                         out pFlag: SFlagRegistro; out pSaida: WordBool; 
                         out pMasterLiberou: WordBool; out pFuncaoLiberou: WordBool; 
                         out pAcessoNegado: WordBool; out pFonteEntrada: SFonteEntrada; 
                         out pTipoNegado: STipoNegado); dispid 207;
    property Set485OffNumber[pThreadIndex: Integer; pNumero: Byte]: WordBool readonly dispid 208;
    procedure SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool); dispid 209;
    property ThreadLastError[pThreadIndex: Integer]: Integer readonly dispid 210;
    property USB_Remove: WordBool readonly dispid 211;
    property EnviaConfiguracao[pThreadIndex: Integer]: WordBool readonly dispid 212;
    property RecebeConfiguracao[pThreadIndex: Integer]: WordBool readonly dispid 213;
    procedure cfg_getInfo(out Versao: WideString; out Placa: SPlacaCard; out Orion: WordBool; 
                          out Expansao: WordBool; out Biometria: SBiometria); dispid 214;
    procedure cfg_getReles(ReleIndex: Byte; out Status: SReleStatus; out TipoNANF: SReleNANF; 
                           out Tempo: Byte); dispid 215;
    procedure cfg_setReles(ReleIndex: Byte; Status: SReleStatus; TipoNANF: SReleNANF; Tempo: Byte); dispid 216;
    procedure cfg_getLeitores(out Leitor1: SLeitor; out Leitor2: SLeitor; out Leitor3: SLeitor); dispid 217;
    procedure cfg_setLeitores(Leitor1: SLeitor; Leitor2: SLeitor; Leitor3: SLeitor); dispid 218;
    procedure cfg_getCodigoBarras(out PadraoD: WordBool; out Letras: WordBool; 
                                  out PadraoLivre: WordBool; out DigitosAutomatico: WordBool; 
                                  out PadraoT: WordBool; out OcultarDigitos: WordBool); dispid 219;
    procedure cfg_setCodigoBarras(PadraoD: WordBool; Letras: WordBool; PadraoLivre: WordBool; 
                                  DigitosAutomatico: WordBool; PadraoT: WordBool; 
                                  OcultarDigitos: WordBool); dispid 220;
    procedure cfg_getRevista(out Tipo: STipoRevista; out Percentual: Byte); dispid 221;
    procedure cfg_setRevista(Tipo: STipoRevista; Percentual: Byte); dispid 222;
    procedure cfg_getEmpresas(out Empresa1: WideString; out Empresa2: WideString; 
                              out Empresa3: WideString; out Empresa4: WideString; 
                              out Empresa5: WideString); dispid 223;
    procedure cfg_setEmpresas(const Empresa1: WideString; const Empresa2: WideString; 
                              const Empresa3: WideString; const Empresa4: WideString; 
                              const Empresa5: WideString); dispid 224;
    procedure cfg_getCtrlAcessoEx(out Gravacao: SGravacao; out AtivarMaster: WordBool; 
                                  out Sinaliza50Percent: WordBool; out SenhaPadraoHenry: WordBool; 
                                  out Catraca: WordBool; out CatracaInvertida: WordBool; 
                                  out CatracaDupla: WordBool); dispid 225;
    procedure cfg_setCtrlAcessoEx(Gravacao: SGravacao; AtivarMaster: WordBool; 
                                  Sinaliza50Percent: WordBool; SenhaPadraoHenry: WordBool; 
                                  Catraca: WordBool; CatracaInvertida: WordBool; 
                                  CatracaDupla: WordBool); dispid 226;
    procedure cfg_getControles(out BloqueiaPeriodo: WordBool; out BiometriaOnline: WordBool; 
                               out FuncoesEspecificas: WordBool; out CatBioLiberaAmbos: WordBool; 
                               out Visitantes: WordBool; out Touch: WordBool; 
                               out BimetriaImagem: WordBool; out AutoOn: SAutoOn); dispid 227;
    procedure cfg_setControles(BloqueiaPeriodo: WordBool; BiometriaOnline: WordBool; 
                               FuncoesEspecificas: WordBool; CatBioLiberaAmbos: WordBool; 
                               Visitantes: WordBool; Touch: WordBool; BiometriaImagem: WordBool; 
                               AutoOn: SAutoOn); dispid 228;
    procedure cfg_getAntiPassBack(out Habilitado: WordBool; out EntradaSaida: WordBool; 
                                  out Tempo: Byte); dispid 229;
    procedure cfg_setAntiPassBack(Habilitado: WordBool; EntradaSaida: WordBool; Tempo: Byte); dispid 230;
    procedure cfg_getSensores(pSensorIndex: Byte; out Habilitado: WordBool; out Porta: WordBool; 
                              out Botao: WordBool; out Rele1: WordBool; out Rele2: WordBool; 
                              out Rele3: WordBool; out Rele4: WordBool; out Rele5: WordBool); dispid 231;
    procedure cfg_setSensores(SensorIndex: Byte; Habilitado: WordBool; Porta: WordBool; 
                              Botao: WordBool; Rele1: WordBool; Rele2: WordBool; Rele3: WordBool; 
                              Rele4: WordBool; Rele5: WordBool); dispid 232;
    procedure cfg_getConfig(out ModoComunicacao: SModoComunicacao; out Teclado: STeclado; 
                            out NumDigitos: Byte; out NivelAcesso: Byte; out ToquesAtender: Byte; 
                            out DigitosSel: {??SDigitos}OleVariant; out SenhaMenu: WordBool; 
                            out Senha: WideString; out CtrlAcesso: SCtrlAcesso); dispid 233;
    procedure cfg_setConfig(ModoComunicacao: SModoComunicacao; Teclado: STeclado; NumDigitos: Byte; 
                            NivelAcesso: Byte; ToquesAtender: Byte; const DigitosSel: WideString; 
                            SenhaMenu: WordBool; const Senha: WideString; CtrlAcesso: SCtrlAcesso); dispid 234;
    property AlterarVelocidade[pThreadIndex: Integer; pNovaVelocidade: SVelocidade]: WordBool readonly dispid 235;
    property ThreadPrioridade[pThreadIndex: Integer; pPrioridade: SPrioridade]: WordBool readonly dispid 236;
    property ExistemRegistros[pThreadIndex: Integer]: WordBool readonly dispid 237;
    property RecuperaRegistros[pThreadIndex: Integer]: WordBool readonly dispid 239;
    property EnviaBeep[pThreadIndex: Integer; pBip: SBeep]: WordBool readonly dispid 240;
    property EnviaDataHora[pThreadIndex: Integer; pDataHora: TDateTime]: WordBool readonly dispid 241;
    property EnviaDataHoraEx[pThreadIndex: Integer; pDataHora: TDateTime; 
                             pUsarHorarioVerao: WordBool; pHorarioVeraoInicio: TDateTime; 
                             pHorarioVeraoTermino: TDateTime]: WordBool readonly dispid 242;
    property EnviaTipoCatraca[pThreadIndex: Integer; pStatusGiro: SStatusGiro; pTempoLiberacao: Byte]: WordBool readonly dispid 245;
    property EnviaFuncoes[pThreadIndex: Integer]: WordBool readonly dispid 247;
    property RecebeFuncoes[pThreadIndex: Integer]: WordBool readonly dispid 248;
    property EnviaFeriados[pThreadIndex: Integer]: WordBool readonly dispid 249;
    property RecebeFeriados[pThreadIndex: Integer]: WordBool readonly dispid 250;
    property EnviaAcionamentos[pThreadIndex: Integer]: WordBool readonly dispid 251;
    property RecebeAcionamentos[pThreadIndex: Integer]: WordBool readonly dispid 252;
    property EnviaPeriodos[pThreadIndex: Integer]: WordBool readonly dispid 253;
    property RecebePeriodos[pThreadIndex: Integer]: WordBool readonly dispid 254;
    property EnviaHorarios[pThreadIndex: Integer]: WordBool readonly dispid 255;
    property RecebeHorarios[pThreadIndex: Integer]: WordBool readonly dispid 256;
    property EnviaListaAcesso[pThreadIndex: Integer]: WordBool readonly dispid 257;
    property RecebeListaAcesso[pThreadIndex: Integer]: WordBool readonly dispid 258;
    property EnviaMsgPadrao[pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                            pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                            const pMsgPadraoLinha1: WideString; const pMsgPadraoLinha2: WideString; 
                            const pMsgEntradaLinha1: WideString; 
                            const pMsgEntradaLinha2: WideString; const pMsgSaidaLinha1: WideString; 
                            const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                            pTempoEntrada: Byte; pTempoSaida: Byte]: WordBool readonly dispid 259;
    property EnviaMsgsEspecificas[pThreadIndex: Integer]: WordBool readonly dispid 261;
    property RecebeMsgsEspecificas[pThreadIndex: Integer]: WordBool readonly dispid 262;
    property EnviaParticionamento[pThreadIndex: Integer; pFuncoes: Integer; pFeriados: Integer; 
                                  pAcionamentos: Integer; pListaAcesso: Integer; 
                                  pPeriodos: Integer; pHorarios: Integer; pMsgEspecifica: Integer; 
                                  pRegistros: Integer]: WordBool readonly dispid 263;
    property Versao: WideString readonly dispid 265;
    property RemoveCard[pThreadIndex: Integer]: WordBool readonly dispid 266;
    property Bio_UsuariosQuant[pThreadIndex: Integer]: Integer readonly dispid 267;
    property Bio_UsuarioExiste[pThreadIndex: Integer; const pUsuarioID: WideString]: WordBool readonly dispid 268;
    property Bio_RecListaUsuarios[pThreadIndex: Integer]: WordBool readonly dispid 269;
    property Bio_RecTemplate[pThreadIndex: Integer; const pUsuarioID: WideString]: WideString readonly dispid 270;
    property Bio_EnvTemplate[pThreadIndex: Integer; const pTemplate: WideString]: WordBool readonly dispid 272;
    property Bio_DelTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             pFingerOnly: WordBool]: WordBool readonly dispid 273;
    property Bio_DelTemplateTodas[pThreadIndex: Integer]: WordBool readonly dispid 274;
    property Bio_GeraUserID[pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                            pMaster: WordBool]: WideString readonly dispid 275;
    property Bio_GetMaxQuantList[pThreadIndex: Integer]: Integer readonly dispid 276;
    property Bio_UsuariosQuantLivre[pThreadIndex: Integer]: Integer readonly dispid 277;
    property DetectarVelocidade[pThreadIndex: Integer]: SVelocidade readonly dispid 279;
    procedure Add_Funcao(pThreadIndex: Integer; pAtiva: WordBool; pLiberaAcesso: WordBool; 
                         const pMensagem: WideString; pTempo: Byte); dispid 281;
    procedure Add_Feriado(pThreadIndex: Integer; pDia: TDateTime); dispid 283;
    procedure Add_Acionamento(pThreadIndex: Integer; pHorario: TDateTime; pTempo: Byte; 
                              pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                              pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                              pSabado: WordBool; pFeriado: WordBool); dispid 285;
    procedure Add_Periodo(pThreadIndex: Integer; pHorario: TDateTime; pTolerancia: Byte; 
                          pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                          pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                          pSabado: WordBool; pFeriado: WordBool); dispid 287;
    procedure Add_ItemAcesso(pThreadIndex: Integer; const pMatricula: WideString; 
                             pIndexHorario: Byte; pAcesso: SAcessoOffline; 
                             pPerBloqInicio: TDateTime; pPerBloqFinal: TDateTime; 
                             pPerBloqHabilitado: WordBool; pAcionaRele1: WordBool; 
                             pAcionaRele2: WordBool; pAcionaRele3: WordBool; 
                             pVerificarDigital: WordBool; pMaster: WordBool; pVisitante: WordBool); dispid 289;
    procedure Add_Escala(pThreadIndex: Integer; pDataInicio: TDateTime; const pHorarios: WideString); dispid 293;
    procedure Add_MsgEspec(pThreadIndex: Integer; pMsgEstilo: SMsgEstilo; pMsgTempo: Byte; 
                           const pMsgLinha1: WideString; const pMsgLinha2: WideString; 
                           const pMatriculas: WideString; pData: TDateTime; pTodosDias: WordBool); dispid 295;
    property NumDigitosValidos: Byte readonly dispid 297;
    property NumDigitosPadraoT: Byte readonly dispid 298;
    property MoreRecentFirmware: WideString readonly dispid 299;
    property RaiseExceptions: WordBool dispid 300;
    property QuantRegsColetados[pThreadIndex: Integer]: Integer readonly dispid 301;
    procedure SetConectado(pThreadIndex: Integer; pConectado: WordBool); dispid 302;
    property KernelLastError: Integer readonly dispid 303;
    property RecebePacote[pThreadIndex: Integer]: WordBool readonly dispid 304;
    property ApagaUltimoPacote[pThreadIndex: Integer]: WordBool readonly dispid 305;
    procedure BeginLargeTransfer(pThreadIndex: Integer); dispid 306;
    procedure EndLargeTransfer(pThreadIndex: Integer); dispid 307;
    property TamanhoRegistro: Integer readonly dispid 308;
    property TamanhoItemAcesso: Integer readonly dispid 309;
    property SRFuncoes[pQtFuncoes: Integer]: Integer readonly dispid 310;
    property SRFeriados[pQtFeriados: Integer]: Integer readonly dispid 311;
    property SRAcionamentos[pQtAcionamentos: Integer]: Integer readonly dispid 312;
    property SRListaAcesso[pQtItens: Integer]: Integer readonly dispid 313;
    property SRPeriodos[pQtPeriodos: Integer]: Integer readonly dispid 314;
    property SRHorariosEscalas[pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                               pQtEscalas: Integer; pQtHorariosPorEscala: Integer]: Integer readonly dispid 315;
    property SRMsgEspecifica[pQtMsgs: Integer; pQtMatriculasPorMsg: Integer]: Integer readonly dispid 316;
    property SRFuncoesEspecificas[pQtMatriculas: Integer; pQtFuncoesPorMatricula: Integer]: Integer readonly dispid 317;
    procedure RespostaOn(pThreadIndex: Integer; pAcesso: SAcessoOnline; 
                         const pMensagem: WideString; pTempo: Byte); dispid 318;
    procedure Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString); dispid 319;
    procedure Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                const pMensagem: WideString; pTempo: Byte; pNumero: Byte); dispid 320;
    property SetorPercentual[pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                             pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                             pMsgEspecifica: Integer; pRegistros: Integer; pSetor: SParticao]: Double readonly dispid 323;
    procedure RegistroOff(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                          out pMatricula: WideString; out pDataHora: TDateTime; 
                          out pFlag: SFlagRegistro; out pSaida: WordBool; 
                          out pMasterLiberou: WordBool; out pFuncaoLiberou: WordBool; 
                          out pAcessoNegado: WordBool; out pFonteEntrada: SFonteEntrada; 
                          out pTipoNegado: STipoNegado); dispid 324;
    property AdicionaCardTcpIp[const pIp: WideString; const pMac: WideString; pPorta: Integer; 
                               pCatraca: WordBool; pModoComunicacao: SModoComunicacao]: Integer readonly dispid 203;
    property RecebeQtRegistros[pThreadIndex: Integer]: Integer readonly dispid 238;
    procedure RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime); dispid 243;
    procedure RecebeDataHoraEx(pThreadIndex: Integer; out pDataHora: TDateTime; 
                               out pUsarHorarioVerao: WordBool; out pHorarioVeraoInicio: TDateTime; 
                               out pHorarioVeraoFim: TDateTime); dispid 280;
    procedure RecebeTipoCatraca(pThreadIndex: Integer; out pStatusGiro: SStatusGiro; 
                                out pTempoLiberacao: Byte); dispid 244;
    procedure Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                             out pMatricula: WideString; out pTemplate: WideString; 
                             out pId: WideString; out pMaster: WordBool; out pDedo: Byte); dispid 246;
    procedure Bio_GetUsuario(pThreadIndex: Integer; out pMatricula: WideString; 
                             out pId: WideString; out pDedo: Byte; out pMaster: WordBool); dispid 271;
    procedure Rec_Funcao(pThreadIndex: Integer; out pAtiva: WordBool; out pLiberaAcesso: WordBool; 
                         out pMensagem: WideString; out pTempo: Byte); dispid 278;
    procedure Rec_Feriado(pThreadIndex: Integer; out pFeriado: TDateTime); dispid 282;
    procedure Rec_Horario(pThreadIndex: Integer; out pHorario: WideString); dispid 284;
    procedure Rec_Acionamento(pThreadIndex: Integer; out pHorario: TDateTime; out pTempo: Byte; 
                              out pDomingo: WordBool; out pSegunda: WordBool; out pTerca: WordBool; 
                              out pQuarta: WordBool; out pQuinta: WordBool; out pSexta: WordBool; 
                              out pSabado: WordBool; out pFeriado: WordBool); dispid 292;
    property DigitosRange[pPlaca: SPlacaCard; pMinimo: WordBool]: Integer readonly dispid 286;
    procedure SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool); dispid 325;
    procedure RecebeParticionamento(pThreadIndex: Integer; out pFuncoes: Integer; 
                                    out pFeriados: Integer; out pAcionamentos: Integer; 
                                    out pListaAcesso: Integer; out pPeriodos: Integer; 
                                    out pHorarios: Integer; out pMsgEspecifica: Integer; 
                                    out pRegistros: Integer); dispid 326;
    property Bio_CarregaTemplate[const pTemplate: WideString]: WordBool readonly dispid 264;
    property Bio_ProcuraTemplate[const pMatricula: WideString; const pTemplate: WideString]: WideString readonly dispid 328;
    procedure SetSecurityLevel(pValue: Byte); dispid 327;
    procedure RespostaOnB(pThreadIndex: Integer; pAcessoLiberado: WordBool; pIDControlador: Byte; 
                          pTempoRele1: Byte; pTempoRele2: Byte; pTempoRele3: Byte); dispid 329;
    procedure Bio_DropTemplates; dispid 330;
    procedure SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool); dispid 331;
    procedure Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                          out pIndexHorario: Integer); dispid 291;
    procedure Rec_Escala(pThreadIndex: Integer; out pDataInicio: TDateTime; 
                         out pHorarios: WideString; out pStatus: WordBool); dispid 294;
    procedure Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString; 
                                   out pStatus: WordBool); dispid 321;
    procedure Rec_FncEsp_Funcao(pThreadIndex: Integer; out pMatricula: WideString; 
                                out pMensagem: WideString; out pTempo: Byte; out pNumero: Byte; 
                                out pStatus: WordBool); dispid 322;
    procedure Rec_Periodo(pThreadIndex: Integer; out pHorario: TDateTime; out pTolerancia: Byte; 
                          out pDomingo: WordBool; out pSegunda: WordBool; out pTerca: WordBool; 
                          out pQuarta: WordBool; out pQuinta: WordBool; out pSexta: WordBool; 
                          out pSabado: WordBool; out pFeriado: WordBool; out pStatus: WordBool); dispid 288;
    procedure Rec_MsgEspec(pThreadIndex: Integer; out pMsgStatus: SMsgEstilo; out pMsgTempo: Byte; 
                           out pMsgLinha1: WideString; out pMsgLinha2: WideString; 
                           out pMatriculas: WideString; out pData: TDateTime; 
                           out pTodosDias: WordBool; out pStatus: WordBool); dispid 296;
    procedure Rec_ItemAcesso(pThreadIndex: Integer; out pMatricula: WideString; out pHorario: Byte; 
                             out pAcesso: SAcessoOffline; out pPerBloqIni: TDateTime; 
                             out pPerBloqFim: TDateTime; out pPerBloqHab: WordBool; 
                             out pAcionaRele1: WordBool; out pAcionaRele2: WordBool; 
                             out pAcionaRele3: WordBool; out pVerificarDigital: WordBool; 
                             out pMaster: WordBool; out pVisitante: WordBool; out pStatus: WordBool); dispid 290;
    property EnviaConfigDSP[pThreadIndex: Integer; pNivelSeguranca: Integer; pVelocidade: Integer; 
                            pSensibilidade: Integer; pQualidadeImagem: Integer; 
                            pCondicaoIluminacao: WordBool]: WordBool readonly dispid 332;
    procedure RecebeConfigDSP(pThreadIndex: Integer; out pNivelSeguranca: Integer; 
                              out pVelocidade: Integer; out pSensibilidade: Integer; 
                              out pQualidadeImagem: Integer; out pCondicaoIluminacao: WordBool; 
                              out pStatus: WordBool); dispid 333;
    procedure RecebeMsgPadrao(pThreadIndex: Integer; out pEstiloMsgPadrao: SMsgEstilo; 
                              out pEstiloMsgEntrada: SMsgEstilo; out pEstiloMsgSaida: SMsgEstilo; 
                              out pMsgPadraoLinha1: WideString; out pMsgPadraoLinha2: WideString; 
                              out pMsgEntradaLinha1: WideString; out pMsgEntradaLinha2: WideString; 
                              out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                              out pTempoMsgPadrao: Byte; out pTempoMsgEntrada: Byte; 
                              out pTempoMsgSaida: Byte; out pStatus: WordBool); dispid 334;
    property AdicionaCardGPRS[pCatraca: WordBool; pPorta: Integer; 
                              pModoComunicacao: SModoComunicacao]: Integer readonly dispid 260;
    property RecebeMsgPadraoB[pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                              out pEstiloEntrada: SMsgEstilo; out pEstiloSaida: SMsgEstilo; 
                              out pMsgPadraoLinha1: WideString; out pMsgPadraoLinha2: WideString; 
                              out pMsgEntradaLinha1: WideString; out pMsgEntradaLinha2: WideString; 
                              out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                              out pTempoPadrao: Byte; out pTempoEntrada: Byte; out pTempoSaida: Byte]: WordBool readonly dispid 335;
    property SetorPercentualEx[pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                               pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                               pMsgEspec: Integer; pRegistros: Integer; pSetor: SParticao; 
                               pExpansao: SExpansao]: Double readonly dispid 336;
    procedure RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer); dispid 337;
    function ErrorDescription(pErrorCode: Integer): WideString; dispid 338;
    property MostRecentFirmware[pPlacaCard: SPlacaCard; pOrion: WordBool]: WideString readonly dispid 339;
    procedure cfg_setControleLeitoras(pLeitoraVerificaDigital: WordBool; pBiometria11: WordBool); dispid 340;
    procedure cfg_getControleLeitoras(out pLeitoraVerificaDigital: WordBool; 
                                      out pBiometria11: WordBool); dispid 341;
    procedure setGPRSResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon); dispid 343;
    procedure getGPRSResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon); dispid 344;
    procedure RegistroOnExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                            out pMatricula: WideString; out pDataHora: TDateTime; 
                            out pFlag: SFlagRegistro; out pSaida: WordBool; 
                            out pMasterLiberou: WordBool; out pFonteEntrada: SFonteEntrada; 
                            out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                            out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                            out pIdSensor: Byte); dispid 342;
    procedure cfg_setCfgControlador(pCatraca: WordBool; pWorkOff: WordBool; pTempoRele1: Byte; 
                                    pTempoRele2: Byte; pTempoRele3: Byte); dispid 345;
    procedure cfg_getCfgControlador(out pCatraca: WordBool; out pWorkOff: WordBool; 
                                    out pTempoRele1: Byte; out pTempoRele2: Byte; 
                                    out pTempoRele3: Byte); dispid 346;
    procedure cfg_setSensoresCtrl(pIndexSensor: Integer; pHabilitado: WordBool; 
                                  pTipoSensor: STipoSensor; pRele1: WordBool; pRele2: WordBool; 
                                  pRele3: WordBool); dispid 347;
    procedure cfg_getSensoresCtrl(pIndexSensor: Integer; out pHabilitado: WordBool; 
                                  out pTipoSensor: STipoSensor; out pRele1: WordBool; 
                                  out pRele2: WordBool; out pRele3: WordBool); dispid 348;
    procedure cfg_setLeitoresCtrl(pIndexLeitora: Integer; pRele1: Byte; pRele2: Byte; pRele3: Byte); dispid 349;
    procedure cfg_getLeitoresCtrl(pIndexLeitora: Integer; out pRele1: Byte; out pRele2: Byte; 
                                  out pRele3: Byte); dispid 350;
    property EnviaConfiguracaoControlador[pThreadIndex: Integer; pIDControlador: Integer]: WordBool readonly dispid 351;
    property RecebeConfiguracaoControlador[pThreadIndex: Integer; pIDControlador: Integer]: WordBool readonly dispid 352;
    procedure RegistroOffExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                             out pMatricula: WideString; out pDataHora: TDateTime; 
                             out pFlag: SFlagRegistro; out pSaida: WordBool; 
                             out pMasterLiberou: WordBool; out pFonteEntrada: SFonteEntrada; 
                             out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                             out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                             out pIdSensor: Byte); dispid 353;
    procedure cfg_getControladores(out pControladores: WideString); dispid 354;
    function Bio_DropTemplate(const pMatricula: WideString): WordBool; dispid 355;
    property EnviaDadosEmpregador[pThreadIndex: Integer; const pRazaoSocial: WideString; 
                                  const pLocal: WideString; const pDocumento: WideString; 
                                  const pCEI: WideString; pIdEmpregador: SIdEmpregador]: WordBool readonly dispid 356;
    procedure RecebeDadosEmpregador(pThreadIndex: Integer; out pRazaoSocial: WideString; 
                                    out pLocal: WideString; out pDocumento: WideString; 
                                    out pCEI: WideString; out pIdEmpregador: SIdEmpregador; 
                                    out pStatus: WordBool); dispid 357;
    property EnviaUsuarioEquipamento[pThreadIndex: Integer; const pMatriculas: WideString; 
                                     const pPIS: WideString; const pNome: WideString; 
                                     pVerificaDigital: WordBool; 
                                     pTipoOperacao: SOperacaoUsuarioEquipamento]: WordBool readonly dispid 358;
    property RecebeListaUsuarioEquipamento[pThreadIndex: Integer]: WordBool readonly dispid 359;
    procedure Rec_UsuarioEquipamento(pThreadIndex: Integer; out pMatriculas: WideString; 
                                     out pPIS: WideString; out pNome: WideString; 
                                     out pVerificaDigital: WordBool; 
                                     out pTipoOperacao: SOperacaoUsuarioEquipamento; 
                                     out pStatus: WordBool); dispid 360;
    property ColetaEventos[pThreadIndex: Integer; const pPathAFD: WideString]: WordBool readonly dispid 361;
    function PararColetaEventos(pThreadIndex: Integer): WordBool; dispid 362;
    property ColetaEventosEx[pThreadIndex: Integer; const pPathAFD: WideString; pData: TDateTime; 
                             const pRazaoSocial: WideString; const pLocal: WideString; 
                             const pDocumento: WideString; const pCEI: WideString; 
                             pIdEmpregador: SIdEmpregador]: WordBool readonly dispid 363;
    procedure cfg_setControleTempos(pTimeoutProcessamentoOnline: Integer; pLatenciaOffline: Integer); dispid 364;
    procedure cfg_getControleTempos(out pTimeoutProcessamentoOnline: Integer; 
                                    out pLatenciaOffline: Integer); dispid 365;
    procedure SetSearchTimeout(pSegundos: Integer); dispid 366;
    property EnviaListaAcessoThd[pThreadIndex: Integer]: WordBool readonly dispid 367;
    property EnviaListaUsuarios[pThreadIndex: Integer]: WordBool readonly dispid 368;
    property Add_UsuarioEquipamento[pThreadIndex: Integer; const pMatriculas: WideString; 
                                    const pPIS: WideString; const pNome: WideString; 
                                    pVerificaDigital: WordBool; 
                                    pTipoOperacao: SOperacaoUsuarioEquipamento]: WordBool readonly dispid 369;
    function CancelarOperacao(pThreadIndex: Integer): WordBool; dispid 370;
    property DataHoraUltimaComunicacao[pThreadIndex: Integer; out pLastCommDateTime: Double]: WordBool readonly dispid 371;
    procedure cfg_getConfigFlags(out LeitorasAutomaticas: WordBool); dispid 372;
    procedure cfg_setConfigFlags(LeitorasAutomaticas: WordBool); dispid 373;
  end;

// *********************************************************************//
// DispIntf:  IAlternativoEvents
// Flags:     (4096) Dispatchable
// GUID:      {62EE9447-E89B-4E9B-A141-40A7D6153CB3}
// *********************************************************************//
  IAlternativoEvents = dispinterface
    ['{62EE9447-E89B-4E9B-A141-40A7D6153CB3}']
    procedure OnRegistro(pThreadIndex: Integer); dispid 201;
    procedure OnExistOff(pThreadIndex: Integer; pCount: Integer; pNumRel: Byte); dispid 202;
    procedure OnProgresso(pThreadIndex: Integer; pByte: Integer; pByteMax: Integer; 
                          pBuffer: Integer; pBufferMax: Integer); dispid 203;
    procedure OnStatus(pThreadIndex: Integer; pDeviceID: Integer; pStatus: Integer); dispid 204;
    procedure OnImagemDsp(pThreadIndex: Integer; const pImagem: WideString); dispid 205;
    procedure OnColetaEventos(pThreadIndex: Integer; pResultado: WordBool; 
                              pQtdeRegColetados: Integer; const pPathAFD: WideString); dispid 206;
    procedure OnOperacao(pThreadIndex: Integer; pResultado: WordBool; pCodigoOp: Integer; 
                         const pParam: WideString); dispid 207;
  end;

// *********************************************************************//
// The Class CoKernel provides a Create and CreateRemote method to          
// create instances of the default interface IKernel exposed by              
// the CoClass Kernel. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoKernel = class
    class function Create: IKernel;
    class function CreateRemote(const MachineName: string): IKernel;
  end;

  TKernelOnRegistro = procedure(ASender: TObject; pThreadIndex: Integer) of object;
  TKernelOnProgresso = procedure(ASender: TObject; pThreadIndex: Integer; pByte: Integer; 
                                                   pByteMax: Integer; pBuffer: Integer; 
                                                   pBufferMax: Integer) of object;
  TKernelOnExistOff = procedure(ASender: TObject; pThreadIndex: Integer; pQtRegs: Integer; 
                                                  pNumRel: Byte) of object;
  TKernelOnStatus = procedure(ASender: TObject; pThreadIndex: Integer; pDeviceID: Integer; 
                                                pStatus: Integer) of object;
  TKernelOnImagemDsp = procedure(ASender: TObject; pThreadIndex: Integer; const pImagem: WideString) of object;
  TKernelOnColetaEventos = procedure(ASender: TObject; pThreadIndex: Integer; pResultado: WordBool; 
                                                       pQtdeEventosColetados: Integer; 
                                                       const pPathAFD: WideString) of object;
  TKernelOnOperacao = procedure(ASender: TObject; pThreadIndex: Integer; pResultado: WordBool; 
                                                  pCodigoOp: Integer; const pParam: WideString) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TKernel
// Help String      : 
// Default Interface: IKernel
// Def. Intf. DISP? : No
// Event   Interface: IKernelEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TKernelProperties= class;
{$ENDIF}
  TKernel = class(TOleServer)
  private
    FOnRegistro: TKernelOnRegistro;
    FOnProgresso: TKernelOnProgresso;
    FOnExistOff: TKernelOnExistOff;
    FOnStatus: TKernelOnStatus;
    FOnImagemDsp: TKernelOnImagemDsp;
    FOnColetaEventos: TKernelOnColetaEventos;
    FOnOperacao: TKernelOnOperacao;
    FIntf: IKernel;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TKernelProperties;
    function GetServerProperties: TKernelProperties;
{$ENDIF}
    function GetDefaultInterface: IKernel;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_ListaPortasSeriais: WideString;
    function Get_AdicionaCard(pConfig: SComConfig; out pThreadIndex: Integer): WordBool;
    function Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
    function Get_ThreadLastError(pThreadIndex: Integer): Integer;
    function Get_USB_Remove: WordBool;
    function Get_EnviaConfiguracao(pThreadIndex: Integer; pConfig: SConfiguracao): WordBool;
    function Get_RecebeConfiguracao(pThreadIndex: Integer; out pConfig: SConfiguracao): WordBool;
    function Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
    procedure Set_ThreadPrioridade(pThreadIndex: Integer; Param2: SPrioridade);
    function Get_ExistemRegistros(pThreadIndex: Integer; out pExistem: WordBool): WordBool;
    function Get_RecebeQtRegistros(pThreadIndex: Integer; out pQtRegs: Integer): WordBool;
    function Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
    function Get_EnviaBeep(pThreadIndex: Integer; pBeep: SBeep): WordBool;
    function Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
    function Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta): WordBool;
    function Get_RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime): WordBool;
    function Get_RecebeDataHoraEx(pThreadIndex: Integer; out pDataHoraEx: SDataHoraCompleta): WordBool;
    function Get_EnviaTipoCatraca(pThreadIndex: Integer; pOperacao: SOperacaoCatraca): WordBool;
    function Get_RecebeTipoCatraca(pThreadIndex: Integer; out pOperacao: SOperacaoCatraca): WordBool;
    function Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
    function Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
    function Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
    function Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
    function Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
    function Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
    function Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
    function Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_EnviaMsgPadrao(pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao): WordBool;
    function Get_RecebeMsgPadrao(pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao): WordBool;
    function Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_EnviaParticionamento(pThreadIndex: Integer; pParticionamento: SParticionamento): WordBool;
    function Get_RecebeParticionamento(pThreadIndex: Integer; out pParticionamento: SParticionamento): WordBool;
    function Get_Versao: WideString;
    function Get_RemoveCard(pThreadIndex: Integer): WordBool;
    function Get_Bio_UsuariosQuant(pThreadIndex: Integer; out pQt: Word): WordBool;
    function Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                   out pExiste: WordBool): WordBool;
    function Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 out pTemplate: WideString): WordBool;
    function Get_Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                                out pUsuario: SUsuarioBioEx): WordBool;
    function Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
    function Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 pFingerOnly: WordBool): WordBool;
    function Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
    function Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                                pMaster: WordBool): WideString;
    function Get_Bio_GetMaxQuantLista(pThreadIndex: Integer; out pQt: Word): WordBool;
    function Get_RegistroOff(pThreadIndex: Integer; out pRegistro: SRegistro): WordBool;
    function Get_DetectarVelocidade(pThreadIndex: Integer; out pVelocidade: SVelocidade): WordBool;
    function Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer; out pQt: Word): WordBool;
    function Get_Bio_GetUsuario(pThreadIndex: Integer; out pUsuario: SUsuarioBioEx): WordBool;
    function Get_Rec_Funcao(pThreadIndex: Integer; out pFuncao: SFuncao): WordBool;
    function Get_Rec_Feriado(pThreadIndex: Integer; out pDia: TDateTime): WordBool;
    function Get_Rec_Acionamento(pThreadIndex: Integer; out pAcionamento: SAcionamento): WordBool;
    function Get_Rec_Periodo(pThreadIndex: Integer; out pPeriodo: SPeriodo): WordBool;
    function Get_Rec_ItemAcesso(pThreadIndex: Integer; out pItemAcesso: SItemAcesso): WordBool;
    function Get_Rec_Horario(pThreadIndex: Integer; out pHorario: WideString): WordBool;
    function Get_Rec_MsgEspec(pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica): WordBool;
    function Get_Bio_CriaDigitalM1M2(const pMatricula: WideString; pFinger: Byte; 
                                     pMaster: WordBool; out pTemplateF: STemplate7x; 
                                     out pTemplateFl: STemplate7x; out pTemplateFH: STemplate7x): WordBool;
    function Get_NumDigitosValidos(pConfiguracao: SConfiguracao): Byte;
    function Get_Bio_RecConfiguracaoF_FL(pThreadIndex: Integer; out pConfig: SDspcfg_F_FL): WordBool;
    function Get_Bio_EnvConfiguracaoF_FL(pThreadIndex: Integer; var pConfig: SDspcfg_F_FL): WordBool;
    function Get_Bio_RecConfiguracaoS(pThreadIndex: Integer; out pConfig: SDspcfg_S): WordBool;
    function Get_Bio_EnvConfiguracaoS(pThreadIndex: Integer; var pConfig: SDspcfg_S): WordBool;
    function Get_Bio_CfgDefaultF_FL(pTipo: SCfgDspPadrao): SDspcfg_F_FL;
    function Get_ExportConfiguracao(const pCaminho: WideString; pConfiguracao: SConfiguracao): WordBool;
    function Get_ImportConfiguracao(const pCaminho: WideString; out pConfiguracao: SConfiguracao): WordBool;
    function Get_SaveAsTemplate7x(const pCaminho: WideString; var pTemplate: STemplate7x): WordBool;
    function Get_OpenTemplate7x(const pCaminho: WideString; out pTemplate: STemplate7x): WordBool;
    function Get_SetorPercentual(var pParticionamento: SParticionamento; pSetor: SParticao): Double;
    function Get_USB_RecebeCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
    function Get_USB_EnviaCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
    function Get_Rec_Escala(pThreadIndex: Integer; out pEscala: SEscala): WordBool;
    function Get_NumDigitosPadraoT(pConfiguracao: SConfiguracao): Byte;
    function Get_MoreRecentFirmware: WideString;
    function Get_RaiseExceptions: WordBool;
    procedure Set_RaiseExceptions(Value: WordBool);
    function Get_Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString): WordBool;
    function Get_Rec_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                   out pFuncao: SFuncaoEx): WordBool;
    function Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
    function Get_KernelLastError: Integer;
    function Get_RecebePacote(pThreadIndex: Integer): WordBool;
    function Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
    function Get_TamanhoRegistro(pConfig: SConfiguracao): Integer;
    function Get_TamanhoItemAcesso(pConfig: SConfiguracao): Integer;
    function Get_SRFuncoes(pConfig: SConfiguracao; pQtFuncoes: Integer): Integer;
    function Get_SRFeriados(pConfig: SConfiguracao; pQtFeriados: Integer): Integer;
    function Get_SRAcionamentos(pConfig: SConfiguracao; pQtAcionamentos: Integer): Integer;
    function Get_SRListaAcesso(pConfig: SConfiguracao; pQtItens: Integer): Integer;
    function Get_SRPeriodos(pConfig: SConfiguracao; pQtPeriodos: Integer): Integer;
    function Get_SRHorariosEscalas(pConfig: SConfiguracao; pQtHorarios: Integer; 
                                   pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                                   pQtHorariosPorEscala: Integer): Integer;
    function Get_SRMsgEspecifica(pConfig: SConfiguracao; pQtMsgs: Integer; 
                                 pQtMatriculasPorMsg: Integer): Integer;
    function Get_SRFuncoesEspecificas(pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                      pQtFuncoesPorMatricula: Integer): Integer;
    function Get_EnviaCfgControlador(pThreadIndex: Integer; pId: Byte; pConfig: SConfigCtrl): WordBool;
    function Get_RecebeCfgControlador(pThreadIndex: Integer; pId: Byte; out pConfig: SConfigCtrl): WordBool;
    function Get_EnviaFacilityCodes(pThreadIndex: Integer; pId: Byte; pCodes: SFacility): WordBool;
    function Get_RecebeFacilityCodes(pThreadIndex: Integer; pId: Byte; out pCodes: SFacility): WordBool;
    function Get_Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                             out pIndexHorario: Integer): WordBool;
    function Get_Add_Escala(pThreadIndex: Integer; pEscala: SEscala; out pEscalaIndex: Integer): WordBool;
    function Get_Add_MsgEspec(pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica): WordBool;
    function Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
    function Get_ErrorDescription(pErrorCode: Integer): WideString;
    function Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
    function Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString;
    function Get_EnviaAcionaCtrl(pThreadIndex: Integer; pId: Byte; pAcionaCtrl: SAcionaCtrl): WordBool;
    function Get_MostRecentFirmware(pConfig: SConfiguracao): WideString;
    function Get_getConnResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon): WordBool;
    function Get_EnviaDadosEmpregador(pThreadIndex: Integer; pEmpregador: SEmpregador): WordBool;
    function Get_RecebeDadosEmpregador(pThreadIndex: Integer; out pEmpregador: SEmpregador): WordBool;
    function Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool;
    function Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
    function Get_Rec_UsuarioEquipamento(pThreadIndex: Integer; out pUsuario: SUsuarioEquipamento): WordBool;
    function Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
    function Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                 pData: TDateTime; pEmpregador: SEmpregador): WordBool;
    function Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Add_UsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool;
    function Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IKernel);
    procedure Disconnect; override;
    procedure SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool);
    procedure Add_Funcao(pThreadIndex: Integer; pFuncao: SFuncao);
    procedure Add_Feriado(pThreadIndex: Integer; pDia: TDateTime);
    procedure Add_Acionamento(pThreadIndex: Integer; pAcionamento: SAcionamento);
    procedure Add_Periodo(pThreadIndex: Integer; pPeriodo: SPeriodo);
    procedure Add_ItemAcesso(pThreadIndex: Integer; pItemAcesso: SItemAcesso);
    procedure RespostaOn(pThreadIndex: Integer; var pResposta: SResposta);
    procedure RegistroOn(pThreadIndex: Integer; var pRegistro: SRegistro);
    procedure Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString);
    procedure Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                pFuncao: SFuncaoEx);
    procedure SetConectado(pThreadIndex: Integer; pConectado: WordBool);
    procedure BeginLargeTransfer(pThreadIndex: Integer);
    procedure EndLargeTransfer(pThreadIndex: Integer);
    procedure SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool);
    procedure SetSecurityLevel(pValue: Byte);
    procedure Bio_DropTemplates;
    procedure SetSearchTimeout(pSegundos: Integer);
    procedure SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool);
    function SetorPercentualEx(var pParticionamento: SParticionamento; pSetor: SParticao; 
                               pExpansao: SExpansao): Double;
    procedure RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer);
    procedure setConnResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon);
    function Bio_DropTemplate(const pMatricula: WideString): WordBool;
    function PararColetaEventos(pThreadIndex: Integer): WordBool;
    function CancelarOperacao(pThreadIndex: Integer): WordBool;
    function SalvaImagemMemoria(pThreadIndex: Integer; const pCaminhoArquivo: WideString): WordBool;
    property DefaultInterface: IKernel read GetDefaultInterface;
    property ListaPortasSeriais: WideString read Get_ListaPortasSeriais;
    property AdicionaCard[pConfig: SComConfig; out pThreadIndex: Integer]: WordBool read Get_AdicionaCard;
    property Set485OffNumber[pThreadIndex: Integer; pNumero: Byte]: WordBool read Get_Set485OffNumber;
    property ThreadLastError[pThreadIndex: Integer]: Integer read Get_ThreadLastError;
    property USB_Remove: WordBool read Get_USB_Remove;
    property EnviaConfiguracao[pThreadIndex: Integer; pConfig: SConfiguracao]: WordBool read Get_EnviaConfiguracao;
    property RecebeConfiguracao[pThreadIndex: Integer; out pConfig: SConfiguracao]: WordBool read Get_RecebeConfiguracao;
    property AlterarVelocidade[pThreadIndex: Integer; pNovaVelocidade: SVelocidade]: WordBool read Get_AlterarVelocidade;
    property ThreadPrioridade[pThreadIndex: Integer]: SPrioridade write Set_ThreadPrioridade;
    property ExistemRegistros[pThreadIndex: Integer; out pExistem: WordBool]: WordBool read Get_ExistemRegistros;
    property RecebeQtRegistros[pThreadIndex: Integer; out pQtRegs: Integer]: WordBool read Get_RecebeQtRegistros;
    property RecuperaRegistros[pThreadIndex: Integer]: WordBool read Get_RecuperaRegistros;
    property EnviaBeep[pThreadIndex: Integer; pBeep: SBeep]: WordBool read Get_EnviaBeep;
    property EnviaDataHora[pThreadIndex: Integer; pDataHora: TDateTime]: WordBool read Get_EnviaDataHora;
    property EnviaDataHoraEx[pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta]: WordBool read Get_EnviaDataHoraEx;
    property RecebeDataHora[pThreadIndex: Integer; out pDataHora: TDateTime]: WordBool read Get_RecebeDataHora;
    property RecebeDataHoraEx[pThreadIndex: Integer; out pDataHoraEx: SDataHoraCompleta]: WordBool read Get_RecebeDataHoraEx;
    property EnviaTipoCatraca[pThreadIndex: Integer; pOperacao: SOperacaoCatraca]: WordBool read Get_EnviaTipoCatraca;
    property RecebeTipoCatraca[pThreadIndex: Integer; out pOperacao: SOperacaoCatraca]: WordBool read Get_RecebeTipoCatraca;
    property EnviaFuncoes[pThreadIndex: Integer]: WordBool read Get_EnviaFuncoes;
    property RecebeFuncoes[pThreadIndex: Integer]: WordBool read Get_RecebeFuncoes;
    property EnviaFeriados[pThreadIndex: Integer]: WordBool read Get_EnviaFeriados;
    property RecebeFeriados[pThreadIndex: Integer]: WordBool read Get_RecebeFeriados;
    property EnviaAcionamentos[pThreadIndex: Integer]: WordBool read Get_EnviaAcionamentos;
    property RecebeAcionamentos[pThreadIndex: Integer]: WordBool read Get_RecebeAcionamentos;
    property EnviaPeriodos[pThreadIndex: Integer]: WordBool read Get_EnviaPeriodos;
    property RecebePeriodos[pThreadIndex: Integer]: WordBool read Get_RecebePeriodos;
    property EnviaHorarios[pThreadIndex: Integer]: WordBool read Get_EnviaHorarios;
    property RecebeHorarios[pThreadIndex: Integer]: WordBool read Get_RecebeHorarios;
    property EnviaListaAcesso[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcesso;
    property RecebeListaAcesso[pThreadIndex: Integer]: WordBool read Get_RecebeListaAcesso;
    property EnviaMsgPadrao[pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao]: WordBool read Get_EnviaMsgPadrao;
    property RecebeMsgPadrao[pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao]: WordBool read Get_RecebeMsgPadrao;
    property EnviaMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_EnviaMsgsEspecificas;
    property RecebeMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_RecebeMsgsEspecificas;
    property EnviaParticionamento[pThreadIndex: Integer; pParticionamento: SParticionamento]: WordBool read Get_EnviaParticionamento;
    property RecebeParticionamento[pThreadIndex: Integer; out pParticionamento: SParticionamento]: WordBool read Get_RecebeParticionamento;
    property Versao: WideString read Get_Versao;
    property RemoveCard[pThreadIndex: Integer]: WordBool read Get_RemoveCard;
    property Bio_UsuariosQuant[pThreadIndex: Integer; out pQt: Word]: WordBool read Get_Bio_UsuariosQuant;
    property Bio_UsuarioExiste[pThreadIndex: Integer; const pUsuarioID: WideString; 
                               out pExiste: WordBool]: WordBool read Get_Bio_UsuarioExiste;
    property Bio_RecListaUsuarios[pThreadIndex: Integer]: WordBool read Get_Bio_RecListaUsuarios;
    property Bio_RecTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             out pTemplate: WideString]: WordBool read Get_Bio_RecTemplate;
    property Bio_RecUsuario[pThreadIndex: Integer; pPrimeiro: WordBool; out pUsuario: SUsuarioBioEx]: WordBool read Get_Bio_RecUsuario;
    property Bio_EnvTemplate[pThreadIndex: Integer; const pTemplate: WideString]: WordBool read Get_Bio_EnvTemplate;
    property Bio_DelTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             pFingerOnly: WordBool]: WordBool read Get_Bio_DelTemplate;
    property Bio_DelTemplateTodas[pThreadIndex: Integer]: WordBool read Get_Bio_DelTemplateTodas;
    property Bio_GeraUserID[pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                            pMaster: WordBool]: WideString read Get_Bio_GeraUserID;
    property Bio_GetMaxQuantLista[pThreadIndex: Integer; out pQt: Word]: WordBool read Get_Bio_GetMaxQuantLista;
    property RegistroOff[pThreadIndex: Integer; out pRegistro: SRegistro]: WordBool read Get_RegistroOff;
    property DetectarVelocidade[pThreadIndex: Integer; out pVelocidade: SVelocidade]: WordBool read Get_DetectarVelocidade;
    property Bio_UsuariosQuantLivre[pThreadIndex: Integer; out pQt: Word]: WordBool read Get_Bio_UsuariosQuantLivre;
    property Bio_GetUsuario[pThreadIndex: Integer; out pUsuario: SUsuarioBioEx]: WordBool read Get_Bio_GetUsuario;
    property Rec_Funcao[pThreadIndex: Integer; out pFuncao: SFuncao]: WordBool read Get_Rec_Funcao;
    property Rec_Feriado[pThreadIndex: Integer; out pDia: TDateTime]: WordBool read Get_Rec_Feriado;
    property Rec_Acionamento[pThreadIndex: Integer; out pAcionamento: SAcionamento]: WordBool read Get_Rec_Acionamento;
    property Rec_Periodo[pThreadIndex: Integer; out pPeriodo: SPeriodo]: WordBool read Get_Rec_Periodo;
    property Rec_ItemAcesso[pThreadIndex: Integer; out pItemAcesso: SItemAcesso]: WordBool read Get_Rec_ItemAcesso;
    property Rec_Horario[pThreadIndex: Integer; out pHorario: WideString]: WordBool read Get_Rec_Horario;
    property Rec_MsgEspec[pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica]: WordBool read Get_Rec_MsgEspec;
    property Bio_CriaDigitalM1M2[const pMatricula: WideString; pFinger: Byte; pMaster: WordBool; 
                                 out pTemplateF: STemplate7x; out pTemplateFl: STemplate7x; 
                                 out pTemplateFH: STemplate7x]: WordBool read Get_Bio_CriaDigitalM1M2;
    property NumDigitosValidos[pConfiguracao: SConfiguracao]: Byte read Get_NumDigitosValidos;
    property Bio_RecConfiguracaoF_FL[pThreadIndex: Integer; out pConfig: SDspcfg_F_FL]: WordBool read Get_Bio_RecConfiguracaoF_FL;
    property Bio_EnvConfiguracaoF_FL[pThreadIndex: Integer; var pConfig: SDspcfg_F_FL]: WordBool read Get_Bio_EnvConfiguracaoF_FL;
    property Bio_RecConfiguracaoS[pThreadIndex: Integer; out pConfig: SDspcfg_S]: WordBool read Get_Bio_RecConfiguracaoS;
    property Bio_EnvConfiguracaoS[pThreadIndex: Integer; var pConfig: SDspcfg_S]: WordBool read Get_Bio_EnvConfiguracaoS;
    property Bio_CfgDefaultF_FL[pTipo: SCfgDspPadrao]: SDspcfg_F_FL read Get_Bio_CfgDefaultF_FL;
    property ExportConfiguracao[const pCaminho: WideString; pConfiguracao: SConfiguracao]: WordBool read Get_ExportConfiguracao;
    property ImportConfiguracao[const pCaminho: WideString; out pConfiguracao: SConfiguracao]: WordBool read Get_ImportConfiguracao;
    property SaveAsTemplate7x[const pCaminho: WideString; var pTemplate: STemplate7x]: WordBool read Get_SaveAsTemplate7x;
    property OpenTemplate7x[const pCaminho: WideString; out pTemplate: STemplate7x]: WordBool read Get_OpenTemplate7x;
    property SetorPercentual[var pParticionamento: SParticionamento; pSetor: SParticao]: Double read Get_SetorPercentual;
    property USB_RecebeCartucho[pThreadIndex: Integer; const pFileName: WideString]: WordBool read Get_USB_RecebeCartucho;
    property USB_EnviaCartucho[pThreadIndex: Integer; const pFileName: WideString]: WordBool read Get_USB_EnviaCartucho;
    property Rec_Escala[pThreadIndex: Integer; out pEscala: SEscala]: WordBool read Get_Rec_Escala;
    property NumDigitosPadraoT[pConfiguracao: SConfiguracao]: Byte read Get_NumDigitosPadraoT;
    property MoreRecentFirmware: WideString read Get_MoreRecentFirmware;
    property Rec_FncEsp_Matricula[pThreadIndex: Integer; out pMatricula: WideString]: WordBool read Get_Rec_FncEsp_Matricula;
    property Rec_FncEsp_Funcao[pThreadIndex: Integer; const pMatricula: WideString; 
                               out pFuncao: SFuncaoEx]: WordBool read Get_Rec_FncEsp_Funcao;
    property QuantRegsColetados[pThreadIndex: Integer]: Integer read Get_QuantRegsColetados;
    property KernelLastError: Integer read Get_KernelLastError;
    property RecebePacote[pThreadIndex: Integer]: WordBool read Get_RecebePacote;
    property ApagaUltimoPacote[pThreadIndex: Integer]: WordBool read Get_ApagaUltimoPacote;
    property TamanhoRegistro[pConfig: SConfiguracao]: Integer read Get_TamanhoRegistro;
    property TamanhoItemAcesso[pConfig: SConfiguracao]: Integer read Get_TamanhoItemAcesso;
    property SRFuncoes[pConfig: SConfiguracao; pQtFuncoes: Integer]: Integer read Get_SRFuncoes;
    property SRFeriados[pConfig: SConfiguracao; pQtFeriados: Integer]: Integer read Get_SRFeriados;
    property SRAcionamentos[pConfig: SConfiguracao; pQtAcionamentos: Integer]: Integer read Get_SRAcionamentos;
    property SRListaAcesso[pConfig: SConfiguracao; pQtItens: Integer]: Integer read Get_SRListaAcesso;
    property SRPeriodos[pConfig: SConfiguracao; pQtPeriodos: Integer]: Integer read Get_SRPeriodos;
    property SRHorariosEscalas[pConfig: SConfiguracao; pQtHorarios: Integer; 
                               pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                               pQtHorariosPorEscala: Integer]: Integer read Get_SRHorariosEscalas;
    property SRMsgEspecifica[pConfig: SConfiguracao; pQtMsgs: Integer; pQtMatriculasPorMsg: Integer]: Integer read Get_SRMsgEspecifica;
    property SRFuncoesEspecificas[pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                  pQtFuncoesPorMatricula: Integer]: Integer read Get_SRFuncoesEspecificas;
    property EnviaCfgControlador[pThreadIndex: Integer; pId: Byte; pConfig: SConfigCtrl]: WordBool read Get_EnviaCfgControlador;
    property RecebeCfgControlador[pThreadIndex: Integer; pId: Byte; out pConfig: SConfigCtrl]: WordBool read Get_RecebeCfgControlador;
    property EnviaFacilityCodes[pThreadIndex: Integer; pId: Byte; pCodes: SFacility]: WordBool read Get_EnviaFacilityCodes;
    property RecebeFacilityCodes[pThreadIndex: Integer; pId: Byte; out pCodes: SFacility]: WordBool read Get_RecebeFacilityCodes;
    property Add_Horario[pThreadIndex: Integer; const pPeriodos: WideString; 
                         out pIndexHorario: Integer]: WordBool read Get_Add_Horario;
    property Add_Escala[pThreadIndex: Integer; pEscala: SEscala; out pEscalaIndex: Integer]: WordBool read Get_Add_Escala;
    property Add_MsgEspec[pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica]: WordBool read Get_Add_MsgEspec;
    property DigitosRange[pPlaca: SPlacaCard; pMinimo: WordBool]: Integer read Get_DigitosRange;
    property ErrorDescription[pErrorCode: Integer]: WideString read Get_ErrorDescription;
    property Bio_CarregaTemplate[const pTemplate: WideString]: WordBool read Get_Bio_CarregaTemplate;
    property Bio_ProcuraTemplate[const pMatricula: WideString; const pTemplate: WideString]: WideString read Get_Bio_ProcuraTemplate;
    property EnviaAcionaCtrl[pThreadIndex: Integer; pId: Byte; pAcionaCtrl: SAcionaCtrl]: WordBool read Get_EnviaAcionaCtrl;
    property MostRecentFirmware[pConfig: SConfiguracao]: WideString read Get_MostRecentFirmware;
    property getConnResetTimeout[pThreadIndex: Integer; out pTimeout: SResetCon]: WordBool read Get_getConnResetTimeout;
    property EnviaDadosEmpregador[pThreadIndex: Integer; pEmpregador: SEmpregador]: WordBool read Get_EnviaDadosEmpregador;
    property RecebeDadosEmpregador[pThreadIndex: Integer; out pEmpregador: SEmpregador]: WordBool read Get_RecebeDadosEmpregador;
    property EnviaUsuarioEquipamento[pThreadIndex: Integer; pUsuario: SUsuarioEquipamento]: WordBool read Get_EnviaUsuarioEquipamento;
    property RecebeListaUsuarioEquipamento[pThreadIndex: Integer]: WordBool read Get_RecebeListaUsuarioEquipamento;
    property Rec_UsuarioEquipamento[pThreadIndex: Integer; out pUsuario: SUsuarioEquipamento]: WordBool read Get_Rec_UsuarioEquipamento;
    property ColetaEventos[pThreadIndex: Integer; const pPathAFD: WideString]: WordBool read Get_ColetaEventos;
    property ColetaEventosEx[pThreadIndex: Integer; const pPathAFD: WideString; pData: TDateTime; 
                             pEmpregador: SEmpregador]: WordBool read Get_ColetaEventosEx;
    property EnviaListaAcessoThd[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcessoThd;
    property EnviaListaUsuarios[pThreadIndex: Integer]: WordBool read Get_EnviaListaUsuarios;
    property Add_UsuarioEquipamento[pThreadIndex: Integer; pUsuario: SUsuarioEquipamento]: WordBool read Get_Add_UsuarioEquipamento;
    property DataHoraUltimaComunicacao[pThreadIndex: Integer; out pLastCommDateTime: Double]: WordBool read Get_DataHoraUltimaComunicacao;
    property RaiseExceptions: WordBool read Get_RaiseExceptions write Set_RaiseExceptions;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TKernelProperties read GetServerProperties;
{$ENDIF}
    property OnRegistro: TKernelOnRegistro read FOnRegistro write FOnRegistro;
    property OnProgresso: TKernelOnProgresso read FOnProgresso write FOnProgresso;
    property OnExistOff: TKernelOnExistOff read FOnExistOff write FOnExistOff;
    property OnStatus: TKernelOnStatus read FOnStatus write FOnStatus;
    property OnImagemDsp: TKernelOnImagemDsp read FOnImagemDsp write FOnImagemDsp;
    property OnColetaEventos: TKernelOnColetaEventos read FOnColetaEventos write FOnColetaEventos;
    property OnOperacao: TKernelOnOperacao read FOnOperacao write FOnOperacao;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TKernel
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TKernelProperties = class(TPersistent)
  private
    FServer:    TKernel;
    function    GetDefaultInterface: IKernel;
    constructor Create(AServer: TKernel);
  protected
    function Get_ListaPortasSeriais: WideString;
    function Get_AdicionaCard(pConfig: SComConfig; out pThreadIndex: Integer): WordBool;
    function Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
    function Get_ThreadLastError(pThreadIndex: Integer): Integer;
    function Get_USB_Remove: WordBool;
    function Get_EnviaConfiguracao(pThreadIndex: Integer; pConfig: SConfiguracao): WordBool;
    function Get_RecebeConfiguracao(pThreadIndex: Integer; out pConfig: SConfiguracao): WordBool;
    function Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
    procedure Set_ThreadPrioridade(pThreadIndex: Integer; Param2: SPrioridade);
    function Get_ExistemRegistros(pThreadIndex: Integer; out pExistem: WordBool): WordBool;
    function Get_RecebeQtRegistros(pThreadIndex: Integer; out pQtRegs: Integer): WordBool;
    function Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
    function Get_EnviaBeep(pThreadIndex: Integer; pBeep: SBeep): WordBool;
    function Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
    function Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta): WordBool;
    function Get_RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime): WordBool;
    function Get_RecebeDataHoraEx(pThreadIndex: Integer; out pDataHoraEx: SDataHoraCompleta): WordBool;
    function Get_EnviaTipoCatraca(pThreadIndex: Integer; pOperacao: SOperacaoCatraca): WordBool;
    function Get_RecebeTipoCatraca(pThreadIndex: Integer; out pOperacao: SOperacaoCatraca): WordBool;
    function Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
    function Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
    function Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
    function Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
    function Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
    function Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
    function Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
    function Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_EnviaMsgPadrao(pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao): WordBool;
    function Get_RecebeMsgPadrao(pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao): WordBool;
    function Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_EnviaParticionamento(pThreadIndex: Integer; pParticionamento: SParticionamento): WordBool;
    function Get_RecebeParticionamento(pThreadIndex: Integer; out pParticionamento: SParticionamento): WordBool;
    function Get_Versao: WideString;
    function Get_RemoveCard(pThreadIndex: Integer): WordBool;
    function Get_Bio_UsuariosQuant(pThreadIndex: Integer; out pQt: Word): WordBool;
    function Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                   out pExiste: WordBool): WordBool;
    function Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 out pTemplate: WideString): WordBool;
    function Get_Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                                out pUsuario: SUsuarioBioEx): WordBool;
    function Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
    function Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 pFingerOnly: WordBool): WordBool;
    function Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
    function Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                                pMaster: WordBool): WideString;
    function Get_Bio_GetMaxQuantLista(pThreadIndex: Integer; out pQt: Word): WordBool;
    function Get_RegistroOff(pThreadIndex: Integer; out pRegistro: SRegistro): WordBool;
    function Get_DetectarVelocidade(pThreadIndex: Integer; out pVelocidade: SVelocidade): WordBool;
    function Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer; out pQt: Word): WordBool;
    function Get_Bio_GetUsuario(pThreadIndex: Integer; out pUsuario: SUsuarioBioEx): WordBool;
    function Get_Rec_Funcao(pThreadIndex: Integer; out pFuncao: SFuncao): WordBool;
    function Get_Rec_Feriado(pThreadIndex: Integer; out pDia: TDateTime): WordBool;
    function Get_Rec_Acionamento(pThreadIndex: Integer; out pAcionamento: SAcionamento): WordBool;
    function Get_Rec_Periodo(pThreadIndex: Integer; out pPeriodo: SPeriodo): WordBool;
    function Get_Rec_ItemAcesso(pThreadIndex: Integer; out pItemAcesso: SItemAcesso): WordBool;
    function Get_Rec_Horario(pThreadIndex: Integer; out pHorario: WideString): WordBool;
    function Get_Rec_MsgEspec(pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica): WordBool;
    function Get_Bio_CriaDigitalM1M2(const pMatricula: WideString; pFinger: Byte; 
                                     pMaster: WordBool; out pTemplateF: STemplate7x; 
                                     out pTemplateFl: STemplate7x; out pTemplateFH: STemplate7x): WordBool;
    function Get_NumDigitosValidos(pConfiguracao: SConfiguracao): Byte;
    function Get_Bio_RecConfiguracaoF_FL(pThreadIndex: Integer; out pConfig: SDspcfg_F_FL): WordBool;
    function Get_Bio_EnvConfiguracaoF_FL(pThreadIndex: Integer; var pConfig: SDspcfg_F_FL): WordBool;
    function Get_Bio_RecConfiguracaoS(pThreadIndex: Integer; out pConfig: SDspcfg_S): WordBool;
    function Get_Bio_EnvConfiguracaoS(pThreadIndex: Integer; var pConfig: SDspcfg_S): WordBool;
    function Get_Bio_CfgDefaultF_FL(pTipo: SCfgDspPadrao): SDspcfg_F_FL;
    function Get_ExportConfiguracao(const pCaminho: WideString; pConfiguracao: SConfiguracao): WordBool;
    function Get_ImportConfiguracao(const pCaminho: WideString; out pConfiguracao: SConfiguracao): WordBool;
    function Get_SaveAsTemplate7x(const pCaminho: WideString; var pTemplate: STemplate7x): WordBool;
    function Get_OpenTemplate7x(const pCaminho: WideString; out pTemplate: STemplate7x): WordBool;
    function Get_SetorPercentual(var pParticionamento: SParticionamento; pSetor: SParticao): Double;
    function Get_USB_RecebeCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
    function Get_USB_EnviaCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
    function Get_Rec_Escala(pThreadIndex: Integer; out pEscala: SEscala): WordBool;
    function Get_NumDigitosPadraoT(pConfiguracao: SConfiguracao): Byte;
    function Get_MoreRecentFirmware: WideString;
    function Get_RaiseExceptions: WordBool;
    procedure Set_RaiseExceptions(Value: WordBool);
    function Get_Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString): WordBool;
    function Get_Rec_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                   out pFuncao: SFuncaoEx): WordBool;
    function Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
    function Get_KernelLastError: Integer;
    function Get_RecebePacote(pThreadIndex: Integer): WordBool;
    function Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
    function Get_TamanhoRegistro(pConfig: SConfiguracao): Integer;
    function Get_TamanhoItemAcesso(pConfig: SConfiguracao): Integer;
    function Get_SRFuncoes(pConfig: SConfiguracao; pQtFuncoes: Integer): Integer;
    function Get_SRFeriados(pConfig: SConfiguracao; pQtFeriados: Integer): Integer;
    function Get_SRAcionamentos(pConfig: SConfiguracao; pQtAcionamentos: Integer): Integer;
    function Get_SRListaAcesso(pConfig: SConfiguracao; pQtItens: Integer): Integer;
    function Get_SRPeriodos(pConfig: SConfiguracao; pQtPeriodos: Integer): Integer;
    function Get_SRHorariosEscalas(pConfig: SConfiguracao; pQtHorarios: Integer; 
                                   pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                                   pQtHorariosPorEscala: Integer): Integer;
    function Get_SRMsgEspecifica(pConfig: SConfiguracao; pQtMsgs: Integer; 
                                 pQtMatriculasPorMsg: Integer): Integer;
    function Get_SRFuncoesEspecificas(pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                      pQtFuncoesPorMatricula: Integer): Integer;
    function Get_EnviaCfgControlador(pThreadIndex: Integer; pId: Byte; pConfig: SConfigCtrl): WordBool;
    function Get_RecebeCfgControlador(pThreadIndex: Integer; pId: Byte; out pConfig: SConfigCtrl): WordBool;
    function Get_EnviaFacilityCodes(pThreadIndex: Integer; pId: Byte; pCodes: SFacility): WordBool;
    function Get_RecebeFacilityCodes(pThreadIndex: Integer; pId: Byte; out pCodes: SFacility): WordBool;
    function Get_Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                             out pIndexHorario: Integer): WordBool;
    function Get_Add_Escala(pThreadIndex: Integer; pEscala: SEscala; out pEscalaIndex: Integer): WordBool;
    function Get_Add_MsgEspec(pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica): WordBool;
    function Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
    function Get_ErrorDescription(pErrorCode: Integer): WideString;
    function Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
    function Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString;
    function Get_EnviaAcionaCtrl(pThreadIndex: Integer; pId: Byte; pAcionaCtrl: SAcionaCtrl): WordBool;
    function Get_MostRecentFirmware(pConfig: SConfiguracao): WideString;
    function Get_getConnResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon): WordBool;
    function Get_EnviaDadosEmpregador(pThreadIndex: Integer; pEmpregador: SEmpregador): WordBool;
    function Get_RecebeDadosEmpregador(pThreadIndex: Integer; out pEmpregador: SEmpregador): WordBool;
    function Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool;
    function Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
    function Get_Rec_UsuarioEquipamento(pThreadIndex: Integer; out pUsuario: SUsuarioEquipamento): WordBool;
    function Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
    function Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                 pData: TDateTime; pEmpregador: SEmpregador): WordBool;
    function Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Add_UsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool;
    function Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool;
  public
    property DefaultInterface: IKernel read GetDefaultInterface;
  published
    property RaiseExceptions: WordBool read Get_RaiseExceptions write Set_RaiseExceptions;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoHamster provides a Create and CreateRemote method to          
// create instances of the default interface IHamster exposed by              
// the CoClass Hamster. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoHamster = class
    class function Create: IHamster;
    class function CreateRemote(const MachineName: string): IHamster;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : THamster
// Help String      : 
// Default Interface: IHamster
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  THamsterProperties= class;
{$ENDIF}
  THamster = class(TOleServer)
  private
    FIntf: IHamster;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: THamsterProperties;
    function GetServerProperties: THamsterProperties;
{$ENDIF}
    function GetDefaultInterface: IHamster;
  protected
    procedure InitServerData; override;
    function Get_Capture(out pTemplate: WideString): WordBool;
    function Get_Verify(const pTemplate: WideString): WordBool;
    function Get_Timeout: Integer;
    procedure Set_Timeout(Value: Integer);
    function Get_Brightness: Integer;
    procedure Set_Brightness(Value: Integer);
    function Get_Sensitivity: Integer;
    procedure Set_Sensitivity(Value: Integer);
    function Get_SetUser(const pTemplate: WideString; const pMatricula: WideString; 
                         pMaster: WordBool): WideString;
    function Get_CaptureContinuous(out pTemplate: WideString): WordBool;
    function Get_Quality: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IHamster);
    procedure Disconnect; override;
    procedure SetImagem(pHandle: Integer; pTop: Integer; pLeft: Integer; pHeight: Integer; 
                        pWidth: Integer);
    procedure AbortCapturing;
    procedure CaptureNet(out pTemplate: WideString; out pStatus: WordBool);
    procedure CaptureContinuousNet(out pTemplate: WideString; out pStatus: WordBool);
    procedure CaptureImage(out pImgTemplate: WideString; out pStatus: WordBool);
    property DefaultInterface: IHamster read GetDefaultInterface;
    property Capture[out pTemplate: WideString]: WordBool read Get_Capture;
    property Verify[const pTemplate: WideString]: WordBool read Get_Verify;
    property SetUser[const pTemplate: WideString; const pMatricula: WideString; pMaster: WordBool]: WideString read Get_SetUser;
    property CaptureContinuous[out pTemplate: WideString]: WordBool read Get_CaptureContinuous;
    property Quality: Integer read Get_Quality;
    property Timeout: Integer read Get_Timeout write Set_Timeout;
    property Brightness: Integer read Get_Brightness write Set_Brightness;
    property Sensitivity: Integer read Get_Sensitivity write Set_Sensitivity;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: THamsterProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : THamster
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 THamsterProperties = class(TPersistent)
  private
    FServer:    THamster;
    function    GetDefaultInterface: IHamster;
    constructor Create(AServer: THamster);
  protected
    function Get_Capture(out pTemplate: WideString): WordBool;
    function Get_Verify(const pTemplate: WideString): WordBool;
    function Get_Timeout: Integer;
    procedure Set_Timeout(Value: Integer);
    function Get_Brightness: Integer;
    procedure Set_Brightness(Value: Integer);
    function Get_Sensitivity: Integer;
    procedure Set_Sensitivity(Value: Integer);
    function Get_SetUser(const pTemplate: WideString; const pMatricula: WideString; 
                         pMaster: WordBool): WideString;
    function Get_CaptureContinuous(out pTemplate: WideString): WordBool;
    function Get_Quality: Integer;
  public
    property DefaultInterface: IHamster read GetDefaultInterface;
  published
    property Timeout: Integer read Get_Timeout write Set_Timeout;
    property Brightness: Integer read Get_Brightness write Set_Brightness;
    property Sensitivity: Integer read Get_Sensitivity write Set_Sensitivity;
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAlternativo provides a Create and CreateRemote method to          
// create instances of the default interface IAlternativo exposed by              
// the CoClass Alternativo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAlternativo = class
    class function Create: IAlternativo;
    class function CreateRemote(const MachineName: string): IAlternativo;
  end;

  TAlternativoOnRegistro = procedure(ASender: TObject; pThreadIndex: Integer) of object;
  TAlternativoOnExistOff = procedure(ASender: TObject; pThreadIndex: Integer; pCount: Integer; 
                                                       pNumRel: Byte) of object;
  TAlternativoOnProgresso = procedure(ASender: TObject; pThreadIndex: Integer; pByte: Integer; 
                                                        pByteMax: Integer; pBuffer: Integer; 
                                                        pBufferMax: Integer) of object;
  TAlternativoOnStatus = procedure(ASender: TObject; pThreadIndex: Integer; pDeviceID: Integer; 
                                                     pStatus: Integer) of object;
  TAlternativoOnImagemDsp = procedure(ASender: TObject; pThreadIndex: Integer; 
                                                        const pImagem: WideString) of object;
  TAlternativoOnColetaEventos = procedure(ASender: TObject; pThreadIndex: Integer; 
                                                            pResultado: WordBool; 
                                                            pQtdeRegColetados: Integer; 
                                                            const pPathAFD: WideString) of object;
  TAlternativoOnOperacao = procedure(ASender: TObject; pThreadIndex: Integer; pResultado: WordBool; 
                                                       pCodigoOp: Integer; const pParam: WideString) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAlternativo
// Help String      : 
// Default Interface: IAlternativo
// Def. Intf. DISP? : No
// Event   Interface: IAlternativoEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAlternativoProperties= class;
{$ENDIF}
  TAlternativo = class(TOleServer)
  private
    FOnRegistro: TAlternativoOnRegistro;
    FOnExistOff: TAlternativoOnExistOff;
    FOnProgresso: TAlternativoOnProgresso;
    FOnStatus: TAlternativoOnStatus;
    FOnImagemDsp: TAlternativoOnImagemDsp;
    FOnColetaEventos: TAlternativoOnColetaEventos;
    FOnOperacao: TAlternativoOnOperacao;
    FIntf: IAlternativo;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAlternativoProperties;
    function GetServerProperties: TAlternativoProperties;
{$ENDIF}
    function GetDefaultInterface: IAlternativo;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_ListaPortasSeriais: WideString;
    function Get_AdicionaCardSerial(pNumero: Byte; const pPorta: WideString; 
                                    pVelocidade: SVelocidade; pCatraca: WordBool; 
                                    pModoComunicacao: SModoComunicacao): Integer;
    function Get_AdicionaCardUsb(pCatraca: WordBool): Integer;
    function Get_AdicionaCardModem(const pPorta: WideString; const pFone: WideString; 
                                   pCatraca: WordBool): Integer;
    function Get_AdicionaCardSerial485(pNumero: Byte; const pPorta: WideString; 
                                       pVelocidade: SVelocidade; pCatraca: WordBool; 
                                       pModoComunicacao: SModoComunicacao): Integer;
    function Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
    function Get_ThreadLastError(pThreadIndex: Integer): Integer;
    function Get_USB_Remove: WordBool;
    function Get_EnviaConfiguracao(pThreadIndex: Integer): WordBool;
    function Get_RecebeConfiguracao(pThreadIndex: Integer): WordBool;
    function Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
    function Get_ThreadPrioridade(pThreadIndex: Integer; pPrioridade: SPrioridade): WordBool;
    function Get_ExistemRegistros(pThreadIndex: Integer): WordBool;
    function Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
    function Get_EnviaBeep(pThreadIndex: Integer; pBip: SBeep): WordBool;
    function Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
    function Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHora: TDateTime; 
                                 pUsarHorarioVerao: WordBool; pHorarioVeraoInicio: TDateTime; 
                                 pHorarioVeraoTermino: TDateTime): WordBool;
    function Get_EnviaTipoCatraca(pThreadIndex: Integer; pStatusGiro: SStatusGiro; 
                                  pTempoLiberacao: Byte): WordBool;
    function Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
    function Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
    function Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
    function Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
    function Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
    function Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
    function Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
    function Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_EnviaMsgPadrao(pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                                pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                                const pMsgPadraoLinha1: WideString; 
                                const pMsgPadraoLinha2: WideString; 
                                const pMsgEntradaLinha1: WideString; 
                                const pMsgEntradaLinha2: WideString; 
                                const pMsgSaidaLinha1: WideString; 
                                const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                                pTempoEntrada: Byte; pTempoSaida: Byte): WordBool;
    function Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_EnviaParticionamento(pThreadIndex: Integer; pFuncoes: Integer; pFeriados: Integer; 
                                      pAcionamentos: Integer; pListaAcesso: Integer; 
                                      pPeriodos: Integer; pHorarios: Integer; 
                                      pMsgEspecifica: Integer; pRegistros: Integer): WordBool;
    function Get_Versao: WideString;
    function Get_RemoveCard(pThreadIndex: Integer): WordBool;
    function Get_Bio_UsuariosQuant(pThreadIndex: Integer): Integer;
    function Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString): WordBool;
    function Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString): WideString;
    function Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
    function Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 pFingerOnly: WordBool): WordBool;
    function Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
    function Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                                pMaster: WordBool): WideString;
    function Get_Bio_GetMaxQuantList(pThreadIndex: Integer): Integer;
    function Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer): Integer;
    function Get_DetectarVelocidade(pThreadIndex: Integer): SVelocidade;
    function Get_NumDigitosValidos: Byte;
    function Get_NumDigitosPadraoT: Byte;
    function Get_MoreRecentFirmware: WideString;
    function Get_RaiseExceptions: WordBool;
    procedure Set_RaiseExceptions(Value: WordBool);
    function Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
    function Get_KernelLastError: Integer;
    function Get_RecebePacote(pThreadIndex: Integer): WordBool;
    function Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
    function Get_TamanhoRegistro: Integer;
    function Get_TamanhoItemAcesso: Integer;
    function Get_SRFuncoes(pQtFuncoes: Integer): Integer;
    function Get_SRFeriados(pQtFeriados: Integer): Integer;
    function Get_SRAcionamentos(pQtAcionamentos: Integer): Integer;
    function Get_SRListaAcesso(pQtItens: Integer): Integer;
    function Get_SRPeriodos(pQtPeriodos: Integer): Integer;
    function Get_SRHorariosEscalas(pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                                   pQtEscalas: Integer; pQtHorariosPorEscala: Integer): Integer;
    function Get_SRMsgEspecifica(pQtMsgs: Integer; pQtMatriculasPorMsg: Integer): Integer;
    function Get_SRFuncoesEspecificas(pQtMatriculas: Integer; pQtFuncoesPorMatricula: Integer): Integer;
    function Get_SetorPercentual(pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                                 pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                                 pMsgEspecifica: Integer; pRegistros: Integer; pSetor: SParticao): Double;
    function Get_AdicionaCardTcpIp(const pIp: WideString; const pMac: WideString; pPorta: Integer; 
                                   pCatraca: WordBool; pModoComunicacao: SModoComunicacao): Integer;
    function Get_RecebeQtRegistros(pThreadIndex: Integer): Integer;
    function Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
    function Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
    function Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString;
    function Get_EnviaConfigDSP(pThreadIndex: Integer; pNivelSeguranca: Integer; 
                                pVelocidade: Integer; pSensibilidade: Integer; 
                                pQualidadeImagem: Integer; pCondicaoIluminacao: WordBool): WordBool;
    function Get_AdicionaCardGPRS(pCatraca: WordBool; pPorta: Integer; 
                                  pModoComunicacao: SModoComunicacao): Integer;
    function Get_RecebeMsgPadraoB(pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                                  out pEstiloEntrada: SMsgEstilo; out pEstiloSaida: SMsgEstilo; 
                                  out pMsgPadraoLinha1: WideString; 
                                  out pMsgPadraoLinha2: WideString; 
                                  out pMsgEntradaLinha1: WideString; 
                                  out pMsgEntradaLinha2: WideString; 
                                  out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                                  out pTempoPadrao: Byte; out pTempoEntrada: Byte; 
                                  out pTempoSaida: Byte): WordBool;
    function Get_SetorPercentualEx(pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                                   pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                                   pMsgEspec: Integer; pRegistros: Integer; pSetor: SParticao; 
                                   pExpansao: SExpansao): Double;
    function Get_MostRecentFirmware(pPlacaCard: SPlacaCard; pOrion: WordBool): WideString;
    function Get_EnviaConfiguracaoControlador(pThreadIndex: Integer; pIDControlador: Integer): WordBool;
    function Get_RecebeConfiguracaoControlador(pThreadIndex: Integer; pIDControlador: Integer): WordBool;
    function Get_EnviaDadosEmpregador(pThreadIndex: Integer; const pRazaoSocial: WideString; 
                                      const pLocal: WideString; const pDocumento: WideString; 
                                      const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool;
    function Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; const pMatriculas: WideString; 
                                         const pPIS: WideString; const pNome: WideString; 
                                         pVerificaDigital: WordBool; 
                                         pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
    function Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
    function Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
    function Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                 pData: TDateTime; const pRazaoSocial: WideString; 
                                 const pLocal: WideString; const pDocumento: WideString; 
                                 const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool;
    function Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Add_UsuarioEquipamento(pThreadIndex: Integer; const pMatriculas: WideString; 
                                        const pPIS: WideString; const pNome: WideString; 
                                        pVerificaDigital: WordBool; 
                                        pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
    function Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IAlternativo);
    procedure Disconnect; override;
    procedure RegistroOn(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                         out pMatricula: WideString; out pDataHora: TDateTime; 
                         out pFlag: SFlagRegistro; out pSaida: WordBool; 
                         out pMasterLiberou: WordBool; out pFuncaoLiberou: WordBool; 
                         out pAcessoNegado: WordBool; out pFonteEntrada: SFonteEntrada; 
                         out pTipoNegado: STipoNegado);
    procedure SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool);
    procedure cfg_getInfo(out Versao: WideString; out Placa: SPlacaCard; out Orion: WordBool; 
                          out Expansao: WordBool; out Biometria: SBiometria);
    procedure cfg_getReles(ReleIndex: Byte; out Status: SReleStatus; out TipoNANF: SReleNANF; 
                           out Tempo: Byte);
    procedure cfg_setReles(ReleIndex: Byte; Status: SReleStatus; TipoNANF: SReleNANF; Tempo: Byte);
    procedure cfg_getLeitores(out Leitor1: SLeitor; out Leitor2: SLeitor; out Leitor3: SLeitor);
    procedure cfg_setLeitores(Leitor1: SLeitor; Leitor2: SLeitor; Leitor3: SLeitor);
    procedure cfg_getCodigoBarras(out PadraoD: WordBool; out Letras: WordBool; 
                                  out PadraoLivre: WordBool; out DigitosAutomatico: WordBool; 
                                  out PadraoT: WordBool; out OcultarDigitos: WordBool);
    procedure cfg_setCodigoBarras(PadraoD: WordBool; Letras: WordBool; PadraoLivre: WordBool; 
                                  DigitosAutomatico: WordBool; PadraoT: WordBool; 
                                  OcultarDigitos: WordBool);
    procedure cfg_getRevista(out Tipo: STipoRevista; out Percentual: Byte);
    procedure cfg_setRevista(Tipo: STipoRevista; Percentual: Byte);
    procedure cfg_getEmpresas(out Empresa1: WideString; out Empresa2: WideString; 
                              out Empresa3: WideString; out Empresa4: WideString; 
                              out Empresa5: WideString);
    procedure cfg_setEmpresas(const Empresa1: WideString; const Empresa2: WideString; 
                              const Empresa3: WideString; const Empresa4: WideString; 
                              const Empresa5: WideString);
    procedure cfg_getCtrlAcessoEx(out Gravacao: SGravacao; out AtivarMaster: WordBool; 
                                  out Sinaliza50Percent: WordBool; out SenhaPadraoHenry: WordBool; 
                                  out Catraca: WordBool; out CatracaInvertida: WordBool; 
                                  out CatracaDupla: WordBool);
    procedure cfg_setCtrlAcessoEx(Gravacao: SGravacao; AtivarMaster: WordBool; 
                                  Sinaliza50Percent: WordBool; SenhaPadraoHenry: WordBool; 
                                  Catraca: WordBool; CatracaInvertida: WordBool; 
                                  CatracaDupla: WordBool);
    procedure cfg_getControles(out BloqueiaPeriodo: WordBool; out BiometriaOnline: WordBool; 
                               out FuncoesEspecificas: WordBool; out CatBioLiberaAmbos: WordBool; 
                               out Visitantes: WordBool; out Touch: WordBool; 
                               out BimetriaImagem: WordBool; out AutoOn: SAutoOn);
    procedure cfg_setControles(BloqueiaPeriodo: WordBool; BiometriaOnline: WordBool; 
                               FuncoesEspecificas: WordBool; CatBioLiberaAmbos: WordBool; 
                               Visitantes: WordBool; Touch: WordBool; BiometriaImagem: WordBool; 
                               AutoOn: SAutoOn);
    procedure cfg_getAntiPassBack(out Habilitado: WordBool; out EntradaSaida: WordBool; 
                                  out Tempo: Byte);
    procedure cfg_setAntiPassBack(Habilitado: WordBool; EntradaSaida: WordBool; Tempo: Byte);
    procedure cfg_getSensores(pSensorIndex: Byte; out Habilitado: WordBool; out Porta: WordBool; 
                              out Botao: WordBool; out Rele1: WordBool; out Rele2: WordBool; 
                              out Rele3: WordBool; out Rele4: WordBool; out Rele5: WordBool);
    procedure cfg_setSensores(SensorIndex: Byte; Habilitado: WordBool; Porta: WordBool; 
                              Botao: WordBool; Rele1: WordBool; Rele2: WordBool; Rele3: WordBool; 
                              Rele4: WordBool; Rele5: WordBool);
    procedure cfg_getConfig(out ModoComunicacao: SModoComunicacao; out Teclado: STeclado; 
                            out NumDigitos: Byte; out NivelAcesso: Byte; out ToquesAtender: Byte; 
                            out DigitosSel: SDigitos; out SenhaMenu: WordBool; 
                            out Senha: WideString; out CtrlAcesso: SCtrlAcesso);
    procedure cfg_setConfig(ModoComunicacao: SModoComunicacao; Teclado: STeclado; NumDigitos: Byte; 
                            NivelAcesso: Byte; ToquesAtender: Byte; const DigitosSel: WideString; 
                            SenhaMenu: WordBool; const Senha: WideString; CtrlAcesso: SCtrlAcesso);
    procedure Add_Funcao(pThreadIndex: Integer; pAtiva: WordBool; pLiberaAcesso: WordBool; 
                         const pMensagem: WideString; pTempo: Byte);
    procedure Add_Feriado(pThreadIndex: Integer; pDia: TDateTime);
    procedure Add_Acionamento(pThreadIndex: Integer; pHorario: TDateTime; pTempo: Byte; 
                              pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                              pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                              pSabado: WordBool; pFeriado: WordBool);
    procedure Add_Periodo(pThreadIndex: Integer; pHorario: TDateTime; pTolerancia: Byte; 
                          pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                          pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                          pSabado: WordBool; pFeriado: WordBool);
    procedure Add_ItemAcesso(pThreadIndex: Integer; const pMatricula: WideString; 
                             pIndexHorario: Byte; pAcesso: SAcessoOffline; 
                             pPerBloqInicio: TDateTime; pPerBloqFinal: TDateTime; 
                             pPerBloqHabilitado: WordBool; pAcionaRele1: WordBool; 
                             pAcionaRele2: WordBool; pAcionaRele3: WordBool; 
                             pVerificarDigital: WordBool; pMaster: WordBool; pVisitante: WordBool);
    procedure Add_Escala(pThreadIndex: Integer; pDataInicio: TDateTime; const pHorarios: WideString);
    procedure Add_MsgEspec(pThreadIndex: Integer; pMsgEstilo: SMsgEstilo; pMsgTempo: Byte; 
                           const pMsgLinha1: WideString; const pMsgLinha2: WideString; 
                           const pMatriculas: WideString; pData: TDateTime; pTodosDias: WordBool);
    procedure SetConectado(pThreadIndex: Integer; pConectado: WordBool);
    procedure BeginLargeTransfer(pThreadIndex: Integer);
    procedure EndLargeTransfer(pThreadIndex: Integer);
    procedure RespostaOn(pThreadIndex: Integer; pAcesso: SAcessoOnline; 
                         const pMensagem: WideString; pTempo: Byte);
    procedure Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString);
    procedure Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                const pMensagem: WideString; pTempo: Byte; pNumero: Byte);
    procedure RegistroOff(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                          out pMatricula: WideString; out pDataHora: TDateTime; 
                          out pFlag: SFlagRegistro; out pSaida: WordBool; 
                          out pMasterLiberou: WordBool; out pFuncaoLiberou: WordBool; 
                          out pAcessoNegado: WordBool; out pFonteEntrada: SFonteEntrada; 
                          out pTipoNegado: STipoNegado);
    procedure RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime);
    procedure RecebeDataHoraEx(pThreadIndex: Integer; out pDataHora: TDateTime; 
                               out pUsarHorarioVerao: WordBool; out pHorarioVeraoInicio: TDateTime; 
                               out pHorarioVeraoFim: TDateTime);
    procedure RecebeTipoCatraca(pThreadIndex: Integer; out pStatusGiro: SStatusGiro; 
                                out pTempoLiberacao: Byte);
    procedure Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                             out pMatricula: WideString; out pTemplate: WideString; 
                             out pId: WideString; out pMaster: WordBool; out pDedo: Byte);
    procedure Bio_GetUsuario(pThreadIndex: Integer; out pMatricula: WideString; 
                             out pId: WideString; out pDedo: Byte; out pMaster: WordBool);
    procedure Rec_Funcao(pThreadIndex: Integer; out pAtiva: WordBool; out pLiberaAcesso: WordBool; 
                         out pMensagem: WideString; out pTempo: Byte);
    procedure Rec_Feriado(pThreadIndex: Integer; out pFeriado: TDateTime);
    procedure Rec_Horario(pThreadIndex: Integer; out pHorario: WideString);
    procedure Rec_Acionamento(pThreadIndex: Integer; out pHorario: TDateTime; out pTempo: Byte; 
                              out pDomingo: WordBool; out pSegunda: WordBool; out pTerca: WordBool; 
                              out pQuarta: WordBool; out pQuinta: WordBool; out pSexta: WordBool; 
                              out pSabado: WordBool; out pFeriado: WordBool);
    procedure SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool);
    procedure RecebeParticionamento(pThreadIndex: Integer; out pFuncoes: Integer; 
                                    out pFeriados: Integer; out pAcionamentos: Integer; 
                                    out pListaAcesso: Integer; out pPeriodos: Integer; 
                                    out pHorarios: Integer; out pMsgEspecifica: Integer; 
                                    out pRegistros: Integer);
    procedure SetSecurityLevel(pValue: Byte);
    procedure RespostaOnB(pThreadIndex: Integer; pAcessoLiberado: WordBool; pIDControlador: Byte; 
                          pTempoRele1: Byte; pTempoRele2: Byte; pTempoRele3: Byte);
    procedure Bio_DropTemplates;
    procedure SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool);
    procedure Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                          out pIndexHorario: Integer);
    procedure Rec_Escala(pThreadIndex: Integer; out pDataInicio: TDateTime; 
                         out pHorarios: WideString; out pStatus: WordBool);
    procedure Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString; 
                                   out pStatus: WordBool);
    procedure Rec_FncEsp_Funcao(pThreadIndex: Integer; out pMatricula: WideString; 
                                out pMensagem: WideString; out pTempo: Byte; out pNumero: Byte; 
                                out pStatus: WordBool);
    procedure Rec_Periodo(pThreadIndex: Integer; out pHorario: TDateTime; out pTolerancia: Byte; 
                          out pDomingo: WordBool; out pSegunda: WordBool; out pTerca: WordBool; 
                          out pQuarta: WordBool; out pQuinta: WordBool; out pSexta: WordBool; 
                          out pSabado: WordBool; out pFeriado: WordBool; out pStatus: WordBool);
    procedure Rec_MsgEspec(pThreadIndex: Integer; out pMsgStatus: SMsgEstilo; out pMsgTempo: Byte; 
                           out pMsgLinha1: WideString; out pMsgLinha2: WideString; 
                           out pMatriculas: WideString; out pData: TDateTime; 
                           out pTodosDias: WordBool; out pStatus: WordBool);
    procedure Rec_ItemAcesso(pThreadIndex: Integer; out pMatricula: WideString; out pHorario: Byte; 
                             out pAcesso: SAcessoOffline; out pPerBloqIni: TDateTime; 
                             out pPerBloqFim: TDateTime; out pPerBloqHab: WordBool; 
                             out pAcionaRele1: WordBool; out pAcionaRele2: WordBool; 
                             out pAcionaRele3: WordBool; out pVerificarDigital: WordBool; 
                             out pMaster: WordBool; out pVisitante: WordBool; out pStatus: WordBool);
    procedure RecebeConfigDSP(pThreadIndex: Integer; out pNivelSeguranca: Integer; 
                              out pVelocidade: Integer; out pSensibilidade: Integer; 
                              out pQualidadeImagem: Integer; out pCondicaoIluminacao: WordBool; 
                              out pStatus: WordBool);
    procedure RecebeMsgPadrao(pThreadIndex: Integer; out pEstiloMsgPadrao: SMsgEstilo; 
                              out pEstiloMsgEntrada: SMsgEstilo; out pEstiloMsgSaida: SMsgEstilo; 
                              out pMsgPadraoLinha1: WideString; out pMsgPadraoLinha2: WideString; 
                              out pMsgEntradaLinha1: WideString; out pMsgEntradaLinha2: WideString; 
                              out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                              out pTempoMsgPadrao: Byte; out pTempoMsgEntrada: Byte; 
                              out pTempoMsgSaida: Byte; out pStatus: WordBool);
    procedure RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer);
    function ErrorDescription(pErrorCode: Integer): WideString;
    procedure cfg_setControleLeitoras(pLeitoraVerificaDigital: WordBool; pBiometria11: WordBool);
    procedure cfg_getControleLeitoras(out pLeitoraVerificaDigital: WordBool; 
                                      out pBiometria11: WordBool);
    procedure setGPRSResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon);
    procedure getGPRSResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon);
    procedure RegistroOnExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                            out pMatricula: WideString; out pDataHora: TDateTime; 
                            out pFlag: SFlagRegistro; out pSaida: WordBool; 
                            out pMasterLiberou: WordBool; out pFonteEntrada: SFonteEntrada; 
                            out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                            out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                            out pIdSensor: Byte);
    procedure cfg_setCfgControlador(pCatraca: WordBool; pWorkOff: WordBool; pTempoRele1: Byte; 
                                    pTempoRele2: Byte; pTempoRele3: Byte);
    procedure cfg_getCfgControlador(out pCatraca: WordBool; out pWorkOff: WordBool; 
                                    out pTempoRele1: Byte; out pTempoRele2: Byte; 
                                    out pTempoRele3: Byte);
    procedure cfg_setSensoresCtrl(pIndexSensor: Integer; pHabilitado: WordBool; 
                                  pTipoSensor: STipoSensor; pRele1: WordBool; pRele2: WordBool; 
                                  pRele3: WordBool);
    procedure cfg_getSensoresCtrl(pIndexSensor: Integer; out pHabilitado: WordBool; 
                                  out pTipoSensor: STipoSensor; out pRele1: WordBool; 
                                  out pRele2: WordBool; out pRele3: WordBool);
    procedure cfg_setLeitoresCtrl(pIndexLeitora: Integer; pRele1: Byte; pRele2: Byte; pRele3: Byte);
    procedure cfg_getLeitoresCtrl(pIndexLeitora: Integer; out pRele1: Byte; out pRele2: Byte; 
                                  out pRele3: Byte);
    procedure RegistroOffExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; out pFuncao: Byte; 
                             out pMatricula: WideString; out pDataHora: TDateTime; 
                             out pFlag: SFlagRegistro; out pSaida: WordBool; 
                             out pMasterLiberou: WordBool; out pFonteEntrada: SFonteEntrada; 
                             out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                             out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                             out pIdSensor: Byte);
    procedure cfg_getControladores(out pControladores: WideString);
    function Bio_DropTemplate(const pMatricula: WideString): WordBool;
    procedure RecebeDadosEmpregador(pThreadIndex: Integer; out pRazaoSocial: WideString; 
                                    out pLocal: WideString; out pDocumento: WideString; 
                                    out pCEI: WideString; out pIdEmpregador: SIdEmpregador; 
                                    out pStatus: WordBool);
    procedure Rec_UsuarioEquipamento(pThreadIndex: Integer; out pMatriculas: WideString; 
                                     out pPIS: WideString; out pNome: WideString; 
                                     out pVerificaDigital: WordBool; 
                                     out pTipoOperacao: SOperacaoUsuarioEquipamento; 
                                     out pStatus: WordBool);
    function PararColetaEventos(pThreadIndex: Integer): WordBool;
    procedure cfg_setControleTempos(pTimeoutProcessamentoOnline: Integer; pLatenciaOffline: Integer);
    procedure cfg_getControleTempos(out pTimeoutProcessamentoOnline: Integer; 
                                    out pLatenciaOffline: Integer);
    procedure SetSearchTimeout(pSegundos: Integer);
    function CancelarOperacao(pThreadIndex: Integer): WordBool;
    procedure cfg_getConfigFlags(out LeitorasAutomaticas: WordBool);
    procedure cfg_setConfigFlags(LeitorasAutomaticas: WordBool);
    property DefaultInterface: IAlternativo read GetDefaultInterface;
    property ListaPortasSeriais: WideString read Get_ListaPortasSeriais;
    property AdicionaCardSerial[pNumero: Byte; const pPorta: WideString; pVelocidade: SVelocidade; 
                                pCatraca: WordBool; pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardSerial;
    property AdicionaCardUsb[pCatraca: WordBool]: Integer read Get_AdicionaCardUsb;
    property AdicionaCardModem[const pPorta: WideString; const pFone: WideString; pCatraca: WordBool]: Integer read Get_AdicionaCardModem;
    property AdicionaCardSerial485[pNumero: Byte; const pPorta: WideString; 
                                   pVelocidade: SVelocidade; pCatraca: WordBool; 
                                   pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardSerial485;
    property Set485OffNumber[pThreadIndex: Integer; pNumero: Byte]: WordBool read Get_Set485OffNumber;
    property ThreadLastError[pThreadIndex: Integer]: Integer read Get_ThreadLastError;
    property USB_Remove: WordBool read Get_USB_Remove;
    property EnviaConfiguracao[pThreadIndex: Integer]: WordBool read Get_EnviaConfiguracao;
    property RecebeConfiguracao[pThreadIndex: Integer]: WordBool read Get_RecebeConfiguracao;
    property AlterarVelocidade[pThreadIndex: Integer; pNovaVelocidade: SVelocidade]: WordBool read Get_AlterarVelocidade;
    property ThreadPrioridade[pThreadIndex: Integer; pPrioridade: SPrioridade]: WordBool read Get_ThreadPrioridade;
    property ExistemRegistros[pThreadIndex: Integer]: WordBool read Get_ExistemRegistros;
    property RecuperaRegistros[pThreadIndex: Integer]: WordBool read Get_RecuperaRegistros;
    property EnviaBeep[pThreadIndex: Integer; pBip: SBeep]: WordBool read Get_EnviaBeep;
    property EnviaDataHora[pThreadIndex: Integer; pDataHora: TDateTime]: WordBool read Get_EnviaDataHora;
    property EnviaDataHoraEx[pThreadIndex: Integer; pDataHora: TDateTime; 
                             pUsarHorarioVerao: WordBool; pHorarioVeraoInicio: TDateTime; 
                             pHorarioVeraoTermino: TDateTime]: WordBool read Get_EnviaDataHoraEx;
    property EnviaTipoCatraca[pThreadIndex: Integer; pStatusGiro: SStatusGiro; pTempoLiberacao: Byte]: WordBool read Get_EnviaTipoCatraca;
    property EnviaFuncoes[pThreadIndex: Integer]: WordBool read Get_EnviaFuncoes;
    property RecebeFuncoes[pThreadIndex: Integer]: WordBool read Get_RecebeFuncoes;
    property EnviaFeriados[pThreadIndex: Integer]: WordBool read Get_EnviaFeriados;
    property RecebeFeriados[pThreadIndex: Integer]: WordBool read Get_RecebeFeriados;
    property EnviaAcionamentos[pThreadIndex: Integer]: WordBool read Get_EnviaAcionamentos;
    property RecebeAcionamentos[pThreadIndex: Integer]: WordBool read Get_RecebeAcionamentos;
    property EnviaPeriodos[pThreadIndex: Integer]: WordBool read Get_EnviaPeriodos;
    property RecebePeriodos[pThreadIndex: Integer]: WordBool read Get_RecebePeriodos;
    property EnviaHorarios[pThreadIndex: Integer]: WordBool read Get_EnviaHorarios;
    property RecebeHorarios[pThreadIndex: Integer]: WordBool read Get_RecebeHorarios;
    property EnviaListaAcesso[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcesso;
    property RecebeListaAcesso[pThreadIndex: Integer]: WordBool read Get_RecebeListaAcesso;
    property EnviaMsgPadrao[pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                            pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                            const pMsgPadraoLinha1: WideString; const pMsgPadraoLinha2: WideString; 
                            const pMsgEntradaLinha1: WideString; 
                            const pMsgEntradaLinha2: WideString; const pMsgSaidaLinha1: WideString; 
                            const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                            pTempoEntrada: Byte; pTempoSaida: Byte]: WordBool read Get_EnviaMsgPadrao;
    property EnviaMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_EnviaMsgsEspecificas;
    property RecebeMsgsEspecificas[pThreadIndex: Integer]: WordBool read Get_RecebeMsgsEspecificas;
    property EnviaParticionamento[pThreadIndex: Integer; pFuncoes: Integer; pFeriados: Integer; 
                                  pAcionamentos: Integer; pListaAcesso: Integer; 
                                  pPeriodos: Integer; pHorarios: Integer; pMsgEspecifica: Integer; 
                                  pRegistros: Integer]: WordBool read Get_EnviaParticionamento;
    property Versao: WideString read Get_Versao;
    property RemoveCard[pThreadIndex: Integer]: WordBool read Get_RemoveCard;
    property Bio_UsuariosQuant[pThreadIndex: Integer]: Integer read Get_Bio_UsuariosQuant;
    property Bio_UsuarioExiste[pThreadIndex: Integer; const pUsuarioID: WideString]: WordBool read Get_Bio_UsuarioExiste;
    property Bio_RecListaUsuarios[pThreadIndex: Integer]: WordBool read Get_Bio_RecListaUsuarios;
    property Bio_RecTemplate[pThreadIndex: Integer; const pUsuarioID: WideString]: WideString read Get_Bio_RecTemplate;
    property Bio_EnvTemplate[pThreadIndex: Integer; const pTemplate: WideString]: WordBool read Get_Bio_EnvTemplate;
    property Bio_DelTemplate[pThreadIndex: Integer; const pUsuarioID: WideString; 
                             pFingerOnly: WordBool]: WordBool read Get_Bio_DelTemplate;
    property Bio_DelTemplateTodas[pThreadIndex: Integer]: WordBool read Get_Bio_DelTemplateTodas;
    property Bio_GeraUserID[pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                            pMaster: WordBool]: WideString read Get_Bio_GeraUserID;
    property Bio_GetMaxQuantList[pThreadIndex: Integer]: Integer read Get_Bio_GetMaxQuantList;
    property Bio_UsuariosQuantLivre[pThreadIndex: Integer]: Integer read Get_Bio_UsuariosQuantLivre;
    property DetectarVelocidade[pThreadIndex: Integer]: SVelocidade read Get_DetectarVelocidade;
    property NumDigitosValidos: Byte read Get_NumDigitosValidos;
    property NumDigitosPadraoT: Byte read Get_NumDigitosPadraoT;
    property MoreRecentFirmware: WideString read Get_MoreRecentFirmware;
    property QuantRegsColetados[pThreadIndex: Integer]: Integer read Get_QuantRegsColetados;
    property KernelLastError: Integer read Get_KernelLastError;
    property RecebePacote[pThreadIndex: Integer]: WordBool read Get_RecebePacote;
    property ApagaUltimoPacote[pThreadIndex: Integer]: WordBool read Get_ApagaUltimoPacote;
    property TamanhoRegistro: Integer read Get_TamanhoRegistro;
    property TamanhoItemAcesso: Integer read Get_TamanhoItemAcesso;
    property SRFuncoes[pQtFuncoes: Integer]: Integer read Get_SRFuncoes;
    property SRFeriados[pQtFeriados: Integer]: Integer read Get_SRFeriados;
    property SRAcionamentos[pQtAcionamentos: Integer]: Integer read Get_SRAcionamentos;
    property SRListaAcesso[pQtItens: Integer]: Integer read Get_SRListaAcesso;
    property SRPeriodos[pQtPeriodos: Integer]: Integer read Get_SRPeriodos;
    property SRHorariosEscalas[pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                               pQtEscalas: Integer; pQtHorariosPorEscala: Integer]: Integer read Get_SRHorariosEscalas;
    property SRMsgEspecifica[pQtMsgs: Integer; pQtMatriculasPorMsg: Integer]: Integer read Get_SRMsgEspecifica;
    property SRFuncoesEspecificas[pQtMatriculas: Integer; pQtFuncoesPorMatricula: Integer]: Integer read Get_SRFuncoesEspecificas;
    property SetorPercentual[pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                             pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                             pMsgEspecifica: Integer; pRegistros: Integer; pSetor: SParticao]: Double read Get_SetorPercentual;
    property AdicionaCardTcpIp[const pIp: WideString; const pMac: WideString; pPorta: Integer; 
                               pCatraca: WordBool; pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardTcpIp;
    property RecebeQtRegistros[pThreadIndex: Integer]: Integer read Get_RecebeQtRegistros;
    property DigitosRange[pPlaca: SPlacaCard; pMinimo: WordBool]: Integer read Get_DigitosRange;
    property Bio_CarregaTemplate[const pTemplate: WideString]: WordBool read Get_Bio_CarregaTemplate;
    property Bio_ProcuraTemplate[const pMatricula: WideString; const pTemplate: WideString]: WideString read Get_Bio_ProcuraTemplate;
    property EnviaConfigDSP[pThreadIndex: Integer; pNivelSeguranca: Integer; pVelocidade: Integer; 
                            pSensibilidade: Integer; pQualidadeImagem: Integer; 
                            pCondicaoIluminacao: WordBool]: WordBool read Get_EnviaConfigDSP;
    property AdicionaCardGPRS[pCatraca: WordBool; pPorta: Integer; 
                              pModoComunicacao: SModoComunicacao]: Integer read Get_AdicionaCardGPRS;
    property RecebeMsgPadraoB[pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                              out pEstiloEntrada: SMsgEstilo; out pEstiloSaida: SMsgEstilo; 
                              out pMsgPadraoLinha1: WideString; out pMsgPadraoLinha2: WideString; 
                              out pMsgEntradaLinha1: WideString; out pMsgEntradaLinha2: WideString; 
                              out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                              out pTempoPadrao: Byte; out pTempoEntrada: Byte; out pTempoSaida: Byte]: WordBool read Get_RecebeMsgPadraoB;
    property SetorPercentualEx[pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                               pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                               pMsgEspec: Integer; pRegistros: Integer; pSetor: SParticao; 
                               pExpansao: SExpansao]: Double read Get_SetorPercentualEx;
    property MostRecentFirmware[pPlacaCard: SPlacaCard; pOrion: WordBool]: WideString read Get_MostRecentFirmware;
    property EnviaConfiguracaoControlador[pThreadIndex: Integer; pIDControlador: Integer]: WordBool read Get_EnviaConfiguracaoControlador;
    property RecebeConfiguracaoControlador[pThreadIndex: Integer; pIDControlador: Integer]: WordBool read Get_RecebeConfiguracaoControlador;
    property EnviaDadosEmpregador[pThreadIndex: Integer; const pRazaoSocial: WideString; 
                                  const pLocal: WideString; const pDocumento: WideString; 
                                  const pCEI: WideString; pIdEmpregador: SIdEmpregador]: WordBool read Get_EnviaDadosEmpregador;
    property EnviaUsuarioEquipamento[pThreadIndex: Integer; const pMatriculas: WideString; 
                                     const pPIS: WideString; const pNome: WideString; 
                                     pVerificaDigital: WordBool; 
                                     pTipoOperacao: SOperacaoUsuarioEquipamento]: WordBool read Get_EnviaUsuarioEquipamento;
    property RecebeListaUsuarioEquipamento[pThreadIndex: Integer]: WordBool read Get_RecebeListaUsuarioEquipamento;
    property ColetaEventos[pThreadIndex: Integer; const pPathAFD: WideString]: WordBool read Get_ColetaEventos;
    property ColetaEventosEx[pThreadIndex: Integer; const pPathAFD: WideString; pData: TDateTime; 
                             const pRazaoSocial: WideString; const pLocal: WideString; 
                             const pDocumento: WideString; const pCEI: WideString; 
                             pIdEmpregador: SIdEmpregador]: WordBool read Get_ColetaEventosEx;
    property EnviaListaAcessoThd[pThreadIndex: Integer]: WordBool read Get_EnviaListaAcessoThd;
    property EnviaListaUsuarios[pThreadIndex: Integer]: WordBool read Get_EnviaListaUsuarios;
    property Add_UsuarioEquipamento[pThreadIndex: Integer; const pMatriculas: WideString; 
                                    const pPIS: WideString; const pNome: WideString; 
                                    pVerificaDigital: WordBool; 
                                    pTipoOperacao: SOperacaoUsuarioEquipamento]: WordBool read Get_Add_UsuarioEquipamento;
    property DataHoraUltimaComunicacao[pThreadIndex: Integer; out pLastCommDateTime: Double]: WordBool read Get_DataHoraUltimaComunicacao;
    property RaiseExceptions: WordBool read Get_RaiseExceptions write Set_RaiseExceptions;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAlternativoProperties read GetServerProperties;
{$ENDIF}
    property OnRegistro: TAlternativoOnRegistro read FOnRegistro write FOnRegistro;
    property OnExistOff: TAlternativoOnExistOff read FOnExistOff write FOnExistOff;
    property OnProgresso: TAlternativoOnProgresso read FOnProgresso write FOnProgresso;
    property OnStatus: TAlternativoOnStatus read FOnStatus write FOnStatus;
    property OnImagemDsp: TAlternativoOnImagemDsp read FOnImagemDsp write FOnImagemDsp;
    property OnColetaEventos: TAlternativoOnColetaEventos read FOnColetaEventos write FOnColetaEventos;
    property OnOperacao: TAlternativoOnOperacao read FOnOperacao write FOnOperacao;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAlternativo
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAlternativoProperties = class(TPersistent)
  private
    FServer:    TAlternativo;
    function    GetDefaultInterface: IAlternativo;
    constructor Create(AServer: TAlternativo);
  protected
    function Get_ListaPortasSeriais: WideString;
    function Get_AdicionaCardSerial(pNumero: Byte; const pPorta: WideString; 
                                    pVelocidade: SVelocidade; pCatraca: WordBool; 
                                    pModoComunicacao: SModoComunicacao): Integer;
    function Get_AdicionaCardUsb(pCatraca: WordBool): Integer;
    function Get_AdicionaCardModem(const pPorta: WideString; const pFone: WideString; 
                                   pCatraca: WordBool): Integer;
    function Get_AdicionaCardSerial485(pNumero: Byte; const pPorta: WideString; 
                                       pVelocidade: SVelocidade; pCatraca: WordBool; 
                                       pModoComunicacao: SModoComunicacao): Integer;
    function Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
    function Get_ThreadLastError(pThreadIndex: Integer): Integer;
    function Get_USB_Remove: WordBool;
    function Get_EnviaConfiguracao(pThreadIndex: Integer): WordBool;
    function Get_RecebeConfiguracao(pThreadIndex: Integer): WordBool;
    function Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
    function Get_ThreadPrioridade(pThreadIndex: Integer; pPrioridade: SPrioridade): WordBool;
    function Get_ExistemRegistros(pThreadIndex: Integer): WordBool;
    function Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
    function Get_EnviaBeep(pThreadIndex: Integer; pBip: SBeep): WordBool;
    function Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
    function Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHora: TDateTime; 
                                 pUsarHorarioVerao: WordBool; pHorarioVeraoInicio: TDateTime; 
                                 pHorarioVeraoTermino: TDateTime): WordBool;
    function Get_EnviaTipoCatraca(pThreadIndex: Integer; pStatusGiro: SStatusGiro; 
                                  pTempoLiberacao: Byte): WordBool;
    function Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
    function Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
    function Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
    function Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
    function Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
    function Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
    function Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
    function Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
    function Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
    function Get_EnviaMsgPadrao(pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                                pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                                const pMsgPadraoLinha1: WideString; 
                                const pMsgPadraoLinha2: WideString; 
                                const pMsgEntradaLinha1: WideString; 
                                const pMsgEntradaLinha2: WideString; 
                                const pMsgSaidaLinha1: WideString; 
                                const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                                pTempoEntrada: Byte; pTempoSaida: Byte): WordBool;
    function Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
    function Get_EnviaParticionamento(pThreadIndex: Integer; pFuncoes: Integer; pFeriados: Integer; 
                                      pAcionamentos: Integer; pListaAcesso: Integer; 
                                      pPeriodos: Integer; pHorarios: Integer; 
                                      pMsgEspecifica: Integer; pRegistros: Integer): WordBool;
    function Get_Versao: WideString;
    function Get_RemoveCard(pThreadIndex: Integer): WordBool;
    function Get_Bio_UsuariosQuant(pThreadIndex: Integer): Integer;
    function Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString): WordBool;
    function Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString): WideString;
    function Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
    function Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                 pFingerOnly: WordBool): WordBool;
    function Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
    function Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; pDedo: Byte; 
                                pMaster: WordBool): WideString;
    function Get_Bio_GetMaxQuantList(pThreadIndex: Integer): Integer;
    function Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer): Integer;
    function Get_DetectarVelocidade(pThreadIndex: Integer): SVelocidade;
    function Get_NumDigitosValidos: Byte;
    function Get_NumDigitosPadraoT: Byte;
    function Get_MoreRecentFirmware: WideString;
    function Get_RaiseExceptions: WordBool;
    procedure Set_RaiseExceptions(Value: WordBool);
    function Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
    function Get_KernelLastError: Integer;
    function Get_RecebePacote(pThreadIndex: Integer): WordBool;
    function Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
    function Get_TamanhoRegistro: Integer;
    function Get_TamanhoItemAcesso: Integer;
    function Get_SRFuncoes(pQtFuncoes: Integer): Integer;
    function Get_SRFeriados(pQtFeriados: Integer): Integer;
    function Get_SRAcionamentos(pQtAcionamentos: Integer): Integer;
    function Get_SRListaAcesso(pQtItens: Integer): Integer;
    function Get_SRPeriodos(pQtPeriodos: Integer): Integer;
    function Get_SRHorariosEscalas(pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                                   pQtEscalas: Integer; pQtHorariosPorEscala: Integer): Integer;
    function Get_SRMsgEspecifica(pQtMsgs: Integer; pQtMatriculasPorMsg: Integer): Integer;
    function Get_SRFuncoesEspecificas(pQtMatriculas: Integer; pQtFuncoesPorMatricula: Integer): Integer;
    function Get_SetorPercentual(pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                                 pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                                 pMsgEspecifica: Integer; pRegistros: Integer; pSetor: SParticao): Double;
    function Get_AdicionaCardTcpIp(const pIp: WideString; const pMac: WideString; pPorta: Integer; 
                                   pCatraca: WordBool; pModoComunicacao: SModoComunicacao): Integer;
    function Get_RecebeQtRegistros(pThreadIndex: Integer): Integer;
    function Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
    function Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
    function Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString;
    function Get_EnviaConfigDSP(pThreadIndex: Integer; pNivelSeguranca: Integer; 
                                pVelocidade: Integer; pSensibilidade: Integer; 
                                pQualidadeImagem: Integer; pCondicaoIluminacao: WordBool): WordBool;
    function Get_AdicionaCardGPRS(pCatraca: WordBool; pPorta: Integer; 
                                  pModoComunicacao: SModoComunicacao): Integer;
    function Get_RecebeMsgPadraoB(pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                                  out pEstiloEntrada: SMsgEstilo; out pEstiloSaida: SMsgEstilo; 
                                  out pMsgPadraoLinha1: WideString; 
                                  out pMsgPadraoLinha2: WideString; 
                                  out pMsgEntradaLinha1: WideString; 
                                  out pMsgEntradaLinha2: WideString; 
                                  out pMsgSaidaLinha1: WideString; out pMsgSaidaLinha2: WideString; 
                                  out pTempoPadrao: Byte; out pTempoEntrada: Byte; 
                                  out pTempoSaida: Byte): WordBool;
    function Get_SetorPercentualEx(pFuncoes: Integer; pFeriados: Integer; pAcionamentos: Integer; 
                                   pLista: Integer; pPeriodos: Integer; pHorarios: Integer; 
                                   pMsgEspec: Integer; pRegistros: Integer; pSetor: SParticao; 
                                   pExpansao: SExpansao): Double;
    function Get_MostRecentFirmware(pPlacaCard: SPlacaCard; pOrion: WordBool): WideString;
    function Get_EnviaConfiguracaoControlador(pThreadIndex: Integer; pIDControlador: Integer): WordBool;
    function Get_RecebeConfiguracaoControlador(pThreadIndex: Integer; pIDControlador: Integer): WordBool;
    function Get_EnviaDadosEmpregador(pThreadIndex: Integer; const pRazaoSocial: WideString; 
                                      const pLocal: WideString; const pDocumento: WideString; 
                                      const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool;
    function Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; const pMatriculas: WideString; 
                                         const pPIS: WideString; const pNome: WideString; 
                                         pVerificaDigital: WordBool; 
                                         pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
    function Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
    function Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
    function Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                 pData: TDateTime; const pRazaoSocial: WideString; 
                                 const pLocal: WideString; const pDocumento: WideString; 
                                 const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool;
    function Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
    function Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
    function Get_Add_UsuarioEquipamento(pThreadIndex: Integer; const pMatriculas: WideString; 
                                        const pPIS: WideString; const pNome: WideString; 
                                        pVerificaDigital: WordBool; 
                                        pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
    function Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool;
  public
    property DefaultInterface: IAlternativo read GetDefaultInterface;
  published
    property RaiseExceptions: WordBool read Get_RaiseExceptions write Set_RaiseExceptions;
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoKernel.Create: IKernel;
begin
  Result := CreateComObject(CLASS_Kernel) as IKernel;
end;

class function CoKernel.CreateRemote(const MachineName: string): IKernel;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Kernel) as IKernel;
end;

procedure TKernel.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{6649E95F-4115-449B-8E6E-EEF73742243D}';
    IntfIID:   '{A6B32120-FD7A-4100-95F6-F379ED0BADF0}';
    EventIID:  '{89C7B996-2E02-4A41-9365-41666AF7E611}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TKernel.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IKernel;
  end;
end;

procedure TKernel.ConnectTo(svrIntf: IKernel);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TKernel.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TKernel.GetDefaultInterface: IKernel;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TKernel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TKernelProperties.Create(Self);
{$ENDIF}
end;

destructor TKernel.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TKernel.GetServerProperties: TKernelProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TKernel.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    201: if Assigned(FOnRegistro) then
         FOnRegistro(Self, Params[0] {Integer});
    202: if Assigned(FOnProgresso) then
         FOnProgresso(Self,
                      Params[0] {Integer},
                      Params[1] {Integer},
                      Params[2] {Integer},
                      Params[3] {Integer},
                      Params[4] {Integer});
    203: if Assigned(FOnExistOff) then
         FOnExistOff(Self,
                     Params[0] {Integer},
                     Params[1] {Integer},
                     Params[2] {Byte});
    204: if Assigned(FOnStatus) then
         FOnStatus(Self,
                   Params[0] {Integer},
                   Params[1] {Integer},
                   Params[2] {Integer});
    205: if Assigned(FOnImagemDsp) then
         FOnImagemDsp(Self,
                      Params[0] {Integer},
                      Params[1] {const WideString});
    206: if Assigned(FOnColetaEventos) then
         FOnColetaEventos(Self,
                          Params[0] {Integer},
                          Params[1] {WordBool},
                          Params[2] {Integer},
                          Params[3] {const WideString});
    207: if Assigned(FOnOperacao) then
         FOnOperacao(Self,
                     Params[0] {Integer},
                     Params[1] {WordBool},
                     Params[2] {Integer},
                     Params[3] {const WideString});
  end; {case DispID}
end;

function TKernel.Get_ListaPortasSeriais: WideString;
begin
    Result := DefaultInterface.ListaPortasSeriais;
end;

function TKernel.Get_AdicionaCard(pConfig: SComConfig; out pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.AdicionaCard[pConfig, pThreadIndex];
end;

function TKernel.Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
begin
    Result := DefaultInterface.Set485OffNumber[pThreadIndex, pNumero];
end;

function TKernel.Get_ThreadLastError(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.ThreadLastError[pThreadIndex];
end;

function TKernel.Get_USB_Remove: WordBool;
begin
    Result := DefaultInterface.USB_Remove;
end;

function TKernel.Get_EnviaConfiguracao(pThreadIndex: Integer; pConfig: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.EnviaConfiguracao[pThreadIndex, pConfig];
end;

function TKernel.Get_RecebeConfiguracao(pThreadIndex: Integer; out pConfig: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.RecebeConfiguracao[pThreadIndex, pConfig];
end;

function TKernel.Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
begin
    Result := DefaultInterface.AlterarVelocidade[pThreadIndex, pNovaVelocidade];
end;

procedure TKernel.Set_ThreadPrioridade(pThreadIndex: Integer; Param2: SPrioridade);
begin
  DefaultInterface.ThreadPrioridade[pThreadIndex] := Param2;
end;

function TKernel.Get_ExistemRegistros(pThreadIndex: Integer; out pExistem: WordBool): WordBool;
begin
    Result := DefaultInterface.ExistemRegistros[pThreadIndex, pExistem];
end;

function TKernel.Get_RecebeQtRegistros(pThreadIndex: Integer; out pQtRegs: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeQtRegistros[pThreadIndex, pQtRegs];
end;

function TKernel.Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecuperaRegistros[pThreadIndex];
end;

function TKernel.Get_EnviaBeep(pThreadIndex: Integer; pBeep: SBeep): WordBool;
begin
    Result := DefaultInterface.EnviaBeep[pThreadIndex, pBeep];
end;

function TKernel.Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
begin
    Result := DefaultInterface.EnviaDataHora[pThreadIndex, pDataHora];
end;

function TKernel.Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta): WordBool;
begin
    Result := DefaultInterface.EnviaDataHoraEx[pThreadIndex, pDataHoraEx];
end;

function TKernel.Get_RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime): WordBool;
begin
    Result := DefaultInterface.RecebeDataHora[pThreadIndex, pDataHora];
end;

function TKernel.Get_RecebeDataHoraEx(pThreadIndex: Integer; out pDataHoraEx: SDataHoraCompleta): WordBool;
begin
    Result := DefaultInterface.RecebeDataHoraEx[pThreadIndex, pDataHoraEx];
end;

function TKernel.Get_EnviaTipoCatraca(pThreadIndex: Integer; pOperacao: SOperacaoCatraca): WordBool;
begin
    Result := DefaultInterface.EnviaTipoCatraca[pThreadIndex, pOperacao];
end;

function TKernel.Get_RecebeTipoCatraca(pThreadIndex: Integer; out pOperacao: SOperacaoCatraca): WordBool;
begin
    Result := DefaultInterface.RecebeTipoCatraca[pThreadIndex, pOperacao];
end;

function TKernel.Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFuncoes[pThreadIndex];
end;

function TKernel.Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFuncoes[pThreadIndex];
end;

function TKernel.Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFeriados[pThreadIndex];
end;

function TKernel.Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFeriados[pThreadIndex];
end;

function TKernel.Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaAcionamentos[pThreadIndex];
end;

function TKernel.Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeAcionamentos[pThreadIndex];
end;

function TKernel.Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaPeriodos[pThreadIndex];
end;

function TKernel.Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePeriodos[pThreadIndex];
end;

function TKernel.Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaHorarios[pThreadIndex];
end;

function TKernel.Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeHorarios[pThreadIndex];
end;

function TKernel.Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcesso[pThreadIndex];
end;

function TKernel.Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaAcesso[pThreadIndex];
end;

function TKernel.Get_EnviaMsgPadrao(pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao): WordBool;
begin
    Result := DefaultInterface.EnviaMsgPadrao[pThreadIndex, pMsgPadrao];
end;

function TKernel.Get_RecebeMsgPadrao(pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao): WordBool;
begin
    Result := DefaultInterface.RecebeMsgPadrao[pThreadIndex, pMsgPadrao];
end;

function TKernel.Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaMsgsEspecificas[pThreadIndex];
end;

function TKernel.Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeMsgsEspecificas[pThreadIndex];
end;

function TKernel.Get_EnviaParticionamento(pThreadIndex: Integer; pParticionamento: SParticionamento): WordBool;
begin
    Result := DefaultInterface.EnviaParticionamento[pThreadIndex, pParticionamento];
end;

function TKernel.Get_RecebeParticionamento(pThreadIndex: Integer; 
                                           out pParticionamento: SParticionamento): WordBool;
begin
    Result := DefaultInterface.RecebeParticionamento[pThreadIndex, pParticionamento];
end;

function TKernel.Get_Versao: WideString;
begin
    Result := DefaultInterface.Versao;
end;

function TKernel.Get_RemoveCard(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RemoveCard[pThreadIndex];
end;

function TKernel.Get_Bio_UsuariosQuant(pThreadIndex: Integer; out pQt: Word): WordBool;
begin
    Result := DefaultInterface.Bio_UsuariosQuant[pThreadIndex, pQt];
end;

function TKernel.Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                       out pExiste: WordBool): WordBool;
begin
    Result := DefaultInterface.Bio_UsuarioExiste[pThreadIndex, pUsuarioID, pExiste];
end;

function TKernel.Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_RecListaUsuarios[pThreadIndex];
end;

function TKernel.Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                     out pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_RecTemplate[pThreadIndex, pUsuarioID, pTemplate];
end;

function TKernel.Get_Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                                    out pUsuario: SUsuarioBioEx): WordBool;
begin
    Result := DefaultInterface.Bio_RecUsuario[pThreadIndex, pPrimeiro, pUsuario];
end;

function TKernel.Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_EnvTemplate[pThreadIndex, pTemplate];
end;

function TKernel.Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                     pFingerOnly: WordBool): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplate[pThreadIndex, pUsuarioID, pFingerOnly];
end;

function TKernel.Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplateTodas[pThreadIndex];
end;

function TKernel.Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; 
                                    pDedo: Byte; pMaster: WordBool): WideString;
begin
    Result := DefaultInterface.Bio_GeraUserID[pBiometria, pMatricula, pDedo, pMaster];
end;

function TKernel.Get_Bio_GetMaxQuantLista(pThreadIndex: Integer; out pQt: Word): WordBool;
begin
    Result := DefaultInterface.Bio_GetMaxQuantLista[pThreadIndex, pQt];
end;

function TKernel.Get_RegistroOff(pThreadIndex: Integer; out pRegistro: SRegistro): WordBool;
begin
    Result := DefaultInterface.RegistroOff[pThreadIndex, pRegistro];
end;

function TKernel.Get_DetectarVelocidade(pThreadIndex: Integer; out pVelocidade: SVelocidade): WordBool;
begin
    Result := DefaultInterface.DetectarVelocidade[pThreadIndex, pVelocidade];
end;

function TKernel.Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer; out pQt: Word): WordBool;
begin
    Result := DefaultInterface.Bio_UsuariosQuantLivre[pThreadIndex, pQt];
end;

function TKernel.Get_Bio_GetUsuario(pThreadIndex: Integer; out pUsuario: SUsuarioBioEx): WordBool;
begin
    Result := DefaultInterface.Bio_GetUsuario[pThreadIndex, pUsuario];
end;

function TKernel.Get_Rec_Funcao(pThreadIndex: Integer; out pFuncao: SFuncao): WordBool;
begin
    Result := DefaultInterface.Rec_Funcao[pThreadIndex, pFuncao];
end;

function TKernel.Get_Rec_Feriado(pThreadIndex: Integer; out pDia: TDateTime): WordBool;
begin
    Result := DefaultInterface.Rec_Feriado[pThreadIndex, pDia];
end;

function TKernel.Get_Rec_Acionamento(pThreadIndex: Integer; out pAcionamento: SAcionamento): WordBool;
begin
    Result := DefaultInterface.Rec_Acionamento[pThreadIndex, pAcionamento];
end;

function TKernel.Get_Rec_Periodo(pThreadIndex: Integer; out pPeriodo: SPeriodo): WordBool;
begin
    Result := DefaultInterface.Rec_Periodo[pThreadIndex, pPeriodo];
end;

function TKernel.Get_Rec_ItemAcesso(pThreadIndex: Integer; out pItemAcesso: SItemAcesso): WordBool;
begin
    Result := DefaultInterface.Rec_ItemAcesso[pThreadIndex, pItemAcesso];
end;

function TKernel.Get_Rec_Horario(pThreadIndex: Integer; out pHorario: WideString): WordBool;
begin
    Result := DefaultInterface.Rec_Horario[pThreadIndex, pHorario];
end;

function TKernel.Get_Rec_MsgEspec(pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica): WordBool;
begin
    Result := DefaultInterface.Rec_MsgEspec[pThreadIndex, pMsgEspec];
end;

function TKernel.Get_Bio_CriaDigitalM1M2(const pMatricula: WideString; pFinger: Byte; 
                                         pMaster: WordBool; out pTemplateF: STemplate7x; 
                                         out pTemplateFl: STemplate7x; out pTemplateFH: STemplate7x): WordBool;
begin
    Result := DefaultInterface.Bio_CriaDigitalM1M2[pMatricula, pFinger, pMaster, pTemplateF, 
                                                   pTemplateFl, pTemplateFH];
end;

function TKernel.Get_NumDigitosValidos(pConfiguracao: SConfiguracao): Byte;
begin
    Result := DefaultInterface.NumDigitosValidos[pConfiguracao];
end;

function TKernel.Get_Bio_RecConfiguracaoF_FL(pThreadIndex: Integer; out pConfig: SDspcfg_F_FL): WordBool;
begin
    Result := DefaultInterface.Bio_RecConfiguracaoF_FL[pThreadIndex, pConfig];
end;

function TKernel.Get_Bio_EnvConfiguracaoF_FL(pThreadIndex: Integer; var pConfig: SDspcfg_F_FL): WordBool;
begin
    Result := DefaultInterface.Bio_EnvConfiguracaoF_FL[pThreadIndex, pConfig];
end;

function TKernel.Get_Bio_RecConfiguracaoS(pThreadIndex: Integer; out pConfig: SDspcfg_S): WordBool;
begin
    Result := DefaultInterface.Bio_RecConfiguracaoS[pThreadIndex, pConfig];
end;

function TKernel.Get_Bio_EnvConfiguracaoS(pThreadIndex: Integer; var pConfig: SDspcfg_S): WordBool;
begin
    Result := DefaultInterface.Bio_EnvConfiguracaoS[pThreadIndex, pConfig];
end;

function TKernel.Get_Bio_CfgDefaultF_FL(pTipo: SCfgDspPadrao): SDspcfg_F_FL;
begin
    Result := DefaultInterface.Bio_CfgDefaultF_FL[pTipo];
end;

function TKernel.Get_ExportConfiguracao(const pCaminho: WideString; pConfiguracao: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.ExportConfiguracao[pCaminho, pConfiguracao];
end;

function TKernel.Get_ImportConfiguracao(const pCaminho: WideString; out pConfiguracao: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.ImportConfiguracao[pCaminho, pConfiguracao];
end;

function TKernel.Get_SaveAsTemplate7x(const pCaminho: WideString; var pTemplate: STemplate7x): WordBool;
begin
    Result := DefaultInterface.SaveAsTemplate7x[pCaminho, pTemplate];
end;

function TKernel.Get_OpenTemplate7x(const pCaminho: WideString; out pTemplate: STemplate7x): WordBool;
begin
    Result := DefaultInterface.OpenTemplate7x[pCaminho, pTemplate];
end;

function TKernel.Get_SetorPercentual(var pParticionamento: SParticionamento; pSetor: SParticao): Double;
begin
    Result := DefaultInterface.SetorPercentual[pParticionamento, pSetor];
end;

function TKernel.Get_USB_RecebeCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
begin
    Result := DefaultInterface.USB_RecebeCartucho[pThreadIndex, pFileName];
end;

function TKernel.Get_USB_EnviaCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
begin
    Result := DefaultInterface.USB_EnviaCartucho[pThreadIndex, pFileName];
end;

function TKernel.Get_Rec_Escala(pThreadIndex: Integer; out pEscala: SEscala): WordBool;
begin
    Result := DefaultInterface.Rec_Escala[pThreadIndex, pEscala];
end;

function TKernel.Get_NumDigitosPadraoT(pConfiguracao: SConfiguracao): Byte;
begin
    Result := DefaultInterface.NumDigitosPadraoT[pConfiguracao];
end;

function TKernel.Get_MoreRecentFirmware: WideString;
begin
    Result := DefaultInterface.MoreRecentFirmware;
end;

function TKernel.Get_RaiseExceptions: WordBool;
begin
    Result := DefaultInterface.RaiseExceptions;
end;

procedure TKernel.Set_RaiseExceptions(Value: WordBool);
begin
  DefaultInterface.Set_RaiseExceptions(Value);
end;

function TKernel.Get_Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString): WordBool;
begin
    Result := DefaultInterface.Rec_FncEsp_Matricula[pThreadIndex, pMatricula];
end;

function TKernel.Get_Rec_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                       out pFuncao: SFuncaoEx): WordBool;
begin
    Result := DefaultInterface.Rec_FncEsp_Funcao[pThreadIndex, pMatricula, pFuncao];
end;

function TKernel.Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.QuantRegsColetados[pThreadIndex];
end;

function TKernel.Get_KernelLastError: Integer;
begin
    Result := DefaultInterface.KernelLastError;
end;

function TKernel.Get_RecebePacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePacote[pThreadIndex];
end;

function TKernel.Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.ApagaUltimoPacote[pThreadIndex];
end;

function TKernel.Get_TamanhoRegistro(pConfig: SConfiguracao): Integer;
begin
    Result := DefaultInterface.TamanhoRegistro[pConfig];
end;

function TKernel.Get_TamanhoItemAcesso(pConfig: SConfiguracao): Integer;
begin
    Result := DefaultInterface.TamanhoItemAcesso[pConfig];
end;

function TKernel.Get_SRFuncoes(pConfig: SConfiguracao; pQtFuncoes: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoes[pConfig, pQtFuncoes];
end;

function TKernel.Get_SRFeriados(pConfig: SConfiguracao; pQtFeriados: Integer): Integer;
begin
    Result := DefaultInterface.SRFeriados[pConfig, pQtFeriados];
end;

function TKernel.Get_SRAcionamentos(pConfig: SConfiguracao; pQtAcionamentos: Integer): Integer;
begin
    Result := DefaultInterface.SRAcionamentos[pConfig, pQtAcionamentos];
end;

function TKernel.Get_SRListaAcesso(pConfig: SConfiguracao; pQtItens: Integer): Integer;
begin
    Result := DefaultInterface.SRListaAcesso[pConfig, pQtItens];
end;

function TKernel.Get_SRPeriodos(pConfig: SConfiguracao; pQtPeriodos: Integer): Integer;
begin
    Result := DefaultInterface.SRPeriodos[pConfig, pQtPeriodos];
end;

function TKernel.Get_SRHorariosEscalas(pConfig: SConfiguracao; pQtHorarios: Integer; 
                                       pQtPeriodosPorHorario: Integer; pQtEscalas: Integer; 
                                       pQtHorariosPorEscala: Integer): Integer;
begin
    Result := DefaultInterface.SRHorariosEscalas[pConfig, pQtHorarios, pQtPeriodosPorHorario, 
                                                 pQtEscalas, pQtHorariosPorEscala];
end;

function TKernel.Get_SRMsgEspecifica(pConfig: SConfiguracao; pQtMsgs: Integer; 
                                     pQtMatriculasPorMsg: Integer): Integer;
begin
    Result := DefaultInterface.SRMsgEspecifica[pConfig, pQtMsgs, pQtMatriculasPorMsg];
end;

function TKernel.Get_SRFuncoesEspecificas(pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                          pQtFuncoesPorMatricula: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoesEspecificas[pConfig, pQtMatriculas, pQtFuncoesPorMatricula];
end;

function TKernel.Get_EnviaCfgControlador(pThreadIndex: Integer; pId: Byte; pConfig: SConfigCtrl): WordBool;
begin
    Result := DefaultInterface.EnviaCfgControlador[pThreadIndex, pId, pConfig];
end;

function TKernel.Get_RecebeCfgControlador(pThreadIndex: Integer; pId: Byte; out pConfig: SConfigCtrl): WordBool;
begin
    Result := DefaultInterface.RecebeCfgControlador[pThreadIndex, pId, pConfig];
end;

function TKernel.Get_EnviaFacilityCodes(pThreadIndex: Integer; pId: Byte; pCodes: SFacility): WordBool;
begin
    Result := DefaultInterface.EnviaFacilityCodes[pThreadIndex, pId, pCodes];
end;

function TKernel.Get_RecebeFacilityCodes(pThreadIndex: Integer; pId: Byte; out pCodes: SFacility): WordBool;
begin
    Result := DefaultInterface.RecebeFacilityCodes[pThreadIndex, pId, pCodes];
end;

function TKernel.Get_Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                                 out pIndexHorario: Integer): WordBool;
begin
    Result := DefaultInterface.Add_Horario[pThreadIndex, pPeriodos, pIndexHorario];
end;

function TKernel.Get_Add_Escala(pThreadIndex: Integer; pEscala: SEscala; out pEscalaIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Add_Escala[pThreadIndex, pEscala, pEscalaIndex];
end;

function TKernel.Get_Add_MsgEspec(pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica): WordBool;
begin
    Result := DefaultInterface.Add_MsgEspec[pThreadIndex, pMsgEspec];
end;

function TKernel.Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
begin
    Result := DefaultInterface.DigitosRange[pPlaca, pMinimo];
end;

function TKernel.Get_ErrorDescription(pErrorCode: Integer): WideString;
begin
    Result := DefaultInterface.ErrorDescription[pErrorCode];
end;

function TKernel.Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_CarregaTemplate[pTemplate];
end;

function TKernel.Get_Bio_ProcuraTemplate(const pMatricula: WideString; const pTemplate: WideString): WideString;
begin
    Result := DefaultInterface.Bio_ProcuraTemplate[pMatricula, pTemplate];
end;

function TKernel.Get_EnviaAcionaCtrl(pThreadIndex: Integer; pId: Byte; pAcionaCtrl: SAcionaCtrl): WordBool;
begin
    Result := DefaultInterface.EnviaAcionaCtrl[pThreadIndex, pId, pAcionaCtrl];
end;

function TKernel.Get_MostRecentFirmware(pConfig: SConfiguracao): WideString;
begin
    Result := DefaultInterface.MostRecentFirmware[pConfig];
end;

function TKernel.Get_getConnResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon): WordBool;
begin
    Result := DefaultInterface.getConnResetTimeout[pThreadIndex, pTimeout];
end;

function TKernel.Get_EnviaDadosEmpregador(pThreadIndex: Integer; pEmpregador: SEmpregador): WordBool;
begin
    Result := DefaultInterface.EnviaDadosEmpregador[pThreadIndex, pEmpregador];
end;

function TKernel.Get_RecebeDadosEmpregador(pThreadIndex: Integer; out pEmpregador: SEmpregador): WordBool;
begin
    Result := DefaultInterface.RecebeDadosEmpregador[pThreadIndex, pEmpregador];
end;

function TKernel.Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.EnviaUsuarioEquipamento[pThreadIndex, pUsuario];
end;

function TKernel.Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaUsuarioEquipamento[pThreadIndex];
end;

function TKernel.Get_Rec_UsuarioEquipamento(pThreadIndex: Integer; out pUsuario: SUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.Rec_UsuarioEquipamento[pThreadIndex, pUsuario];
end;

function TKernel.Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
begin
    Result := DefaultInterface.ColetaEventos[pThreadIndex, pPathAFD];
end;

function TKernel.Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                     pData: TDateTime; pEmpregador: SEmpregador): WordBool;
begin
    Result := DefaultInterface.ColetaEventosEx[pThreadIndex, pPathAFD, pData, pEmpregador];
end;

function TKernel.Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcessoThd[pThreadIndex];
end;

function TKernel.Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaUsuarios[pThreadIndex];
end;

function TKernel.Get_Add_UsuarioEquipamento(pThreadIndex: Integer; pUsuario: SUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.Add_UsuarioEquipamento[pThreadIndex, pUsuario];
end;

function TKernel.Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; out pLastCommDateTime: Double): WordBool;
begin
    Result := DefaultInterface.DataHoraUltimaComunicacao[pThreadIndex, pLastCommDateTime];
end;

procedure TKernel.SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool);
begin
  DefaultInterface.SetSincronizar(pThreadIndex, pSincronizar);
end;

procedure TKernel.Add_Funcao(pThreadIndex: Integer; pFuncao: SFuncao);
begin
  DefaultInterface.Add_Funcao(pThreadIndex, pFuncao);
end;

procedure TKernel.Add_Feriado(pThreadIndex: Integer; pDia: TDateTime);
begin
  DefaultInterface.Add_Feriado(pThreadIndex, pDia);
end;

procedure TKernel.Add_Acionamento(pThreadIndex: Integer; pAcionamento: SAcionamento);
begin
  DefaultInterface.Add_Acionamento(pThreadIndex, pAcionamento);
end;

procedure TKernel.Add_Periodo(pThreadIndex: Integer; pPeriodo: SPeriodo);
begin
  DefaultInterface.Add_Periodo(pThreadIndex, pPeriodo);
end;

procedure TKernel.Add_ItemAcesso(pThreadIndex: Integer; pItemAcesso: SItemAcesso);
begin
  DefaultInterface.Add_ItemAcesso(pThreadIndex, pItemAcesso);
end;

procedure TKernel.RespostaOn(pThreadIndex: Integer; var pResposta: SResposta);
begin
  DefaultInterface.RespostaOn(pThreadIndex, pResposta);
end;

procedure TKernel.RegistroOn(pThreadIndex: Integer; var pRegistro: SRegistro);
begin
  DefaultInterface.RegistroOn(pThreadIndex, pRegistro);
end;

procedure TKernel.Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString);
begin
  DefaultInterface.Add_FncEsp_Matricula(pThreadIndex, pMatricula);
end;

procedure TKernel.Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                    pFuncao: SFuncaoEx);
begin
  DefaultInterface.Add_FncEsp_Funcao(pThreadIndex, pMatricula, pFuncao);
end;

procedure TKernel.SetConectado(pThreadIndex: Integer; pConectado: WordBool);
begin
  DefaultInterface.SetConectado(pThreadIndex, pConectado);
end;

procedure TKernel.BeginLargeTransfer(pThreadIndex: Integer);
begin
  DefaultInterface.BeginLargeTransfer(pThreadIndex);
end;

procedure TKernel.EndLargeTransfer(pThreadIndex: Integer);
begin
  DefaultInterface.EndLargeTransfer(pThreadIndex);
end;

procedure TKernel.SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool);
begin
  DefaultInterface.SetConcentrador(pThreadIndex, pIsConcentrador);
end;

procedure TKernel.SetSecurityLevel(pValue: Byte);
begin
  DefaultInterface.SetSecurityLevel(pValue);
end;

procedure TKernel.Bio_DropTemplates;
begin
  DefaultInterface.Bio_DropTemplates;
end;

procedure TKernel.SetSearchTimeout(pSegundos: Integer);
begin
  DefaultInterface.SetSearchTimeout(pSegundos);
end;

procedure TKernel.SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool);
begin
  DefaultInterface.SetICMPProtocol(pThreadIndex, pEnabled);
end;

function TKernel.SetorPercentualEx(var pParticionamento: SParticionamento; pSetor: SParticao; 
                                   pExpansao: SExpansao): Double;
begin
  Result := DefaultInterface.SetorPercentualEx(pParticionamento, pSetor, pExpansao);
end;

procedure TKernel.RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer);
begin
  DefaultInterface.RespostaStatus(pThreadIndex, pIndexMensagem);
end;

procedure TKernel.setConnResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon);
begin
  DefaultInterface.setConnResetTimeout(pThreadIndex, pTimeout);
end;

function TKernel.Bio_DropTemplate(const pMatricula: WideString): WordBool;
begin
  Result := DefaultInterface.Bio_DropTemplate(pMatricula);
end;

function TKernel.PararColetaEventos(pThreadIndex: Integer): WordBool;
begin
  Result := DefaultInterface.PararColetaEventos(pThreadIndex);
end;

function TKernel.CancelarOperacao(pThreadIndex: Integer): WordBool;
begin
  Result := DefaultInterface.CancelarOperacao(pThreadIndex);
end;

function TKernel.SalvaImagemMemoria(pThreadIndex: Integer; const pCaminhoArquivo: WideString): WordBool;
begin
  Result := DefaultInterface.SalvaImagemMemoria(pThreadIndex, pCaminhoArquivo);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TKernelProperties.Create(AServer: TKernel);
begin
  inherited Create;
  FServer := AServer;
end;

function TKernelProperties.GetDefaultInterface: IKernel;
begin
  Result := FServer.DefaultInterface;
end;

function TKernelProperties.Get_ListaPortasSeriais: WideString;
begin
    Result := DefaultInterface.ListaPortasSeriais;
end;

function TKernelProperties.Get_AdicionaCard(pConfig: SComConfig; out pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.AdicionaCard[pConfig, pThreadIndex];
end;

function TKernelProperties.Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
begin
    Result := DefaultInterface.Set485OffNumber[pThreadIndex, pNumero];
end;

function TKernelProperties.Get_ThreadLastError(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.ThreadLastError[pThreadIndex];
end;

function TKernelProperties.Get_USB_Remove: WordBool;
begin
    Result := DefaultInterface.USB_Remove;
end;

function TKernelProperties.Get_EnviaConfiguracao(pThreadIndex: Integer; pConfig: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.EnviaConfiguracao[pThreadIndex, pConfig];
end;

function TKernelProperties.Get_RecebeConfiguracao(pThreadIndex: Integer; out pConfig: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.RecebeConfiguracao[pThreadIndex, pConfig];
end;

function TKernelProperties.Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
begin
    Result := DefaultInterface.AlterarVelocidade[pThreadIndex, pNovaVelocidade];
end;

procedure TKernelProperties.Set_ThreadPrioridade(pThreadIndex: Integer; Param2: SPrioridade);
begin
  DefaultInterface.ThreadPrioridade[pThreadIndex] := Param2;
end;

function TKernelProperties.Get_ExistemRegistros(pThreadIndex: Integer; out pExistem: WordBool): WordBool;
begin
    Result := DefaultInterface.ExistemRegistros[pThreadIndex, pExistem];
end;

function TKernelProperties.Get_RecebeQtRegistros(pThreadIndex: Integer; out pQtRegs: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeQtRegistros[pThreadIndex, pQtRegs];
end;

function TKernelProperties.Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecuperaRegistros[pThreadIndex];
end;

function TKernelProperties.Get_EnviaBeep(pThreadIndex: Integer; pBeep: SBeep): WordBool;
begin
    Result := DefaultInterface.EnviaBeep[pThreadIndex, pBeep];
end;

function TKernelProperties.Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
begin
    Result := DefaultInterface.EnviaDataHora[pThreadIndex, pDataHora];
end;

function TKernelProperties.Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHoraEx: SDataHoraCompleta): WordBool;
begin
    Result := DefaultInterface.EnviaDataHoraEx[pThreadIndex, pDataHoraEx];
end;

function TKernelProperties.Get_RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime): WordBool;
begin
    Result := DefaultInterface.RecebeDataHora[pThreadIndex, pDataHora];
end;

function TKernelProperties.Get_RecebeDataHoraEx(pThreadIndex: Integer; 
                                                out pDataHoraEx: SDataHoraCompleta): WordBool;
begin
    Result := DefaultInterface.RecebeDataHoraEx[pThreadIndex, pDataHoraEx];
end;

function TKernelProperties.Get_EnviaTipoCatraca(pThreadIndex: Integer; pOperacao: SOperacaoCatraca): WordBool;
begin
    Result := DefaultInterface.EnviaTipoCatraca[pThreadIndex, pOperacao];
end;

function TKernelProperties.Get_RecebeTipoCatraca(pThreadIndex: Integer; 
                                                 out pOperacao: SOperacaoCatraca): WordBool;
begin
    Result := DefaultInterface.RecebeTipoCatraca[pThreadIndex, pOperacao];
end;

function TKernelProperties.Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFuncoes[pThreadIndex];
end;

function TKernelProperties.Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFuncoes[pThreadIndex];
end;

function TKernelProperties.Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFeriados[pThreadIndex];
end;

function TKernelProperties.Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFeriados[pThreadIndex];
end;

function TKernelProperties.Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaAcionamentos[pThreadIndex];
end;

function TKernelProperties.Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeAcionamentos[pThreadIndex];
end;

function TKernelProperties.Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaPeriodos[pThreadIndex];
end;

function TKernelProperties.Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePeriodos[pThreadIndex];
end;

function TKernelProperties.Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaHorarios[pThreadIndex];
end;

function TKernelProperties.Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeHorarios[pThreadIndex];
end;

function TKernelProperties.Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcesso[pThreadIndex];
end;

function TKernelProperties.Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaAcesso[pThreadIndex];
end;

function TKernelProperties.Get_EnviaMsgPadrao(pThreadIndex: Integer; var pMsgPadrao: SMsgPadrao): WordBool;
begin
    Result := DefaultInterface.EnviaMsgPadrao[pThreadIndex, pMsgPadrao];
end;

function TKernelProperties.Get_RecebeMsgPadrao(pThreadIndex: Integer; out pMsgPadrao: SMsgPadrao): WordBool;
begin
    Result := DefaultInterface.RecebeMsgPadrao[pThreadIndex, pMsgPadrao];
end;

function TKernelProperties.Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaMsgsEspecificas[pThreadIndex];
end;

function TKernelProperties.Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeMsgsEspecificas[pThreadIndex];
end;

function TKernelProperties.Get_EnviaParticionamento(pThreadIndex: Integer; 
                                                    pParticionamento: SParticionamento): WordBool;
begin
    Result := DefaultInterface.EnviaParticionamento[pThreadIndex, pParticionamento];
end;

function TKernelProperties.Get_RecebeParticionamento(pThreadIndex: Integer; 
                                                     out pParticionamento: SParticionamento): WordBool;
begin
    Result := DefaultInterface.RecebeParticionamento[pThreadIndex, pParticionamento];
end;

function TKernelProperties.Get_Versao: WideString;
begin
    Result := DefaultInterface.Versao;
end;

function TKernelProperties.Get_RemoveCard(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RemoveCard[pThreadIndex];
end;

function TKernelProperties.Get_Bio_UsuariosQuant(pThreadIndex: Integer; out pQt: Word): WordBool;
begin
    Result := DefaultInterface.Bio_UsuariosQuant[pThreadIndex, pQt];
end;

function TKernelProperties.Get_Bio_UsuarioExiste(pThreadIndex: Integer; 
                                                 const pUsuarioID: WideString; out pExiste: WordBool): WordBool;
begin
    Result := DefaultInterface.Bio_UsuarioExiste[pThreadIndex, pUsuarioID, pExiste];
end;

function TKernelProperties.Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_RecListaUsuarios[pThreadIndex];
end;

function TKernelProperties.Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                               out pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_RecTemplate[pThreadIndex, pUsuarioID, pTemplate];
end;

function TKernelProperties.Get_Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                                              out pUsuario: SUsuarioBioEx): WordBool;
begin
    Result := DefaultInterface.Bio_RecUsuario[pThreadIndex, pPrimeiro, pUsuario];
end;

function TKernelProperties.Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_EnvTemplate[pThreadIndex, pTemplate];
end;

function TKernelProperties.Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                               pFingerOnly: WordBool): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplate[pThreadIndex, pUsuarioID, pFingerOnly];
end;

function TKernelProperties.Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplateTodas[pThreadIndex];
end;

function TKernelProperties.Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; 
                                              pDedo: Byte; pMaster: WordBool): WideString;
begin
    Result := DefaultInterface.Bio_GeraUserID[pBiometria, pMatricula, pDedo, pMaster];
end;

function TKernelProperties.Get_Bio_GetMaxQuantLista(pThreadIndex: Integer; out pQt: Word): WordBool;
begin
    Result := DefaultInterface.Bio_GetMaxQuantLista[pThreadIndex, pQt];
end;

function TKernelProperties.Get_RegistroOff(pThreadIndex: Integer; out pRegistro: SRegistro): WordBool;
begin
    Result := DefaultInterface.RegistroOff[pThreadIndex, pRegistro];
end;

function TKernelProperties.Get_DetectarVelocidade(pThreadIndex: Integer; 
                                                  out pVelocidade: SVelocidade): WordBool;
begin
    Result := DefaultInterface.DetectarVelocidade[pThreadIndex, pVelocidade];
end;

function TKernelProperties.Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer; out pQt: Word): WordBool;
begin
    Result := DefaultInterface.Bio_UsuariosQuantLivre[pThreadIndex, pQt];
end;

function TKernelProperties.Get_Bio_GetUsuario(pThreadIndex: Integer; out pUsuario: SUsuarioBioEx): WordBool;
begin
    Result := DefaultInterface.Bio_GetUsuario[pThreadIndex, pUsuario];
end;

function TKernelProperties.Get_Rec_Funcao(pThreadIndex: Integer; out pFuncao: SFuncao): WordBool;
begin
    Result := DefaultInterface.Rec_Funcao[pThreadIndex, pFuncao];
end;

function TKernelProperties.Get_Rec_Feriado(pThreadIndex: Integer; out pDia: TDateTime): WordBool;
begin
    Result := DefaultInterface.Rec_Feriado[pThreadIndex, pDia];
end;

function TKernelProperties.Get_Rec_Acionamento(pThreadIndex: Integer; out pAcionamento: SAcionamento): WordBool;
begin
    Result := DefaultInterface.Rec_Acionamento[pThreadIndex, pAcionamento];
end;

function TKernelProperties.Get_Rec_Periodo(pThreadIndex: Integer; out pPeriodo: SPeriodo): WordBool;
begin
    Result := DefaultInterface.Rec_Periodo[pThreadIndex, pPeriodo];
end;

function TKernelProperties.Get_Rec_ItemAcesso(pThreadIndex: Integer; out pItemAcesso: SItemAcesso): WordBool;
begin
    Result := DefaultInterface.Rec_ItemAcesso[pThreadIndex, pItemAcesso];
end;

function TKernelProperties.Get_Rec_Horario(pThreadIndex: Integer; out pHorario: WideString): WordBool;
begin
    Result := DefaultInterface.Rec_Horario[pThreadIndex, pHorario];
end;

function TKernelProperties.Get_Rec_MsgEspec(pThreadIndex: Integer; out pMsgEspec: SMsgEspecifica): WordBool;
begin
    Result := DefaultInterface.Rec_MsgEspec[pThreadIndex, pMsgEspec];
end;

function TKernelProperties.Get_Bio_CriaDigitalM1M2(const pMatricula: WideString; pFinger: Byte; 
                                                   pMaster: WordBool; out pTemplateF: STemplate7x; 
                                                   out pTemplateFl: STemplate7x; 
                                                   out pTemplateFH: STemplate7x): WordBool;
begin
    Result := DefaultInterface.Bio_CriaDigitalM1M2[pMatricula, pFinger, pMaster, pTemplateF, 
                                                   pTemplateFl, pTemplateFH];
end;

function TKernelProperties.Get_NumDigitosValidos(pConfiguracao: SConfiguracao): Byte;
begin
    Result := DefaultInterface.NumDigitosValidos[pConfiguracao];
end;

function TKernelProperties.Get_Bio_RecConfiguracaoF_FL(pThreadIndex: Integer; 
                                                       out pConfig: SDspcfg_F_FL): WordBool;
begin
    Result := DefaultInterface.Bio_RecConfiguracaoF_FL[pThreadIndex, pConfig];
end;

function TKernelProperties.Get_Bio_EnvConfiguracaoF_FL(pThreadIndex: Integer; 
                                                       var pConfig: SDspcfg_F_FL): WordBool;
begin
    Result := DefaultInterface.Bio_EnvConfiguracaoF_FL[pThreadIndex, pConfig];
end;

function TKernelProperties.Get_Bio_RecConfiguracaoS(pThreadIndex: Integer; out pConfig: SDspcfg_S): WordBool;
begin
    Result := DefaultInterface.Bio_RecConfiguracaoS[pThreadIndex, pConfig];
end;

function TKernelProperties.Get_Bio_EnvConfiguracaoS(pThreadIndex: Integer; var pConfig: SDspcfg_S): WordBool;
begin
    Result := DefaultInterface.Bio_EnvConfiguracaoS[pThreadIndex, pConfig];
end;

function TKernelProperties.Get_Bio_CfgDefaultF_FL(pTipo: SCfgDspPadrao): SDspcfg_F_FL;
begin
    Result := DefaultInterface.Bio_CfgDefaultF_FL[pTipo];
end;

function TKernelProperties.Get_ExportConfiguracao(const pCaminho: WideString; 
                                                  pConfiguracao: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.ExportConfiguracao[pCaminho, pConfiguracao];
end;

function TKernelProperties.Get_ImportConfiguracao(const pCaminho: WideString; 
                                                  out pConfiguracao: SConfiguracao): WordBool;
begin
    Result := DefaultInterface.ImportConfiguracao[pCaminho, pConfiguracao];
end;

function TKernelProperties.Get_SaveAsTemplate7x(const pCaminho: WideString; 
                                                var pTemplate: STemplate7x): WordBool;
begin
    Result := DefaultInterface.SaveAsTemplate7x[pCaminho, pTemplate];
end;

function TKernelProperties.Get_OpenTemplate7x(const pCaminho: WideString; out pTemplate: STemplate7x): WordBool;
begin
    Result := DefaultInterface.OpenTemplate7x[pCaminho, pTemplate];
end;

function TKernelProperties.Get_SetorPercentual(var pParticionamento: SParticionamento; 
                                               pSetor: SParticao): Double;
begin
    Result := DefaultInterface.SetorPercentual[pParticionamento, pSetor];
end;

function TKernelProperties.Get_USB_RecebeCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
begin
    Result := DefaultInterface.USB_RecebeCartucho[pThreadIndex, pFileName];
end;

function TKernelProperties.Get_USB_EnviaCartucho(pThreadIndex: Integer; const pFileName: WideString): WordBool;
begin
    Result := DefaultInterface.USB_EnviaCartucho[pThreadIndex, pFileName];
end;

function TKernelProperties.Get_Rec_Escala(pThreadIndex: Integer; out pEscala: SEscala): WordBool;
begin
    Result := DefaultInterface.Rec_Escala[pThreadIndex, pEscala];
end;

function TKernelProperties.Get_NumDigitosPadraoT(pConfiguracao: SConfiguracao): Byte;
begin
    Result := DefaultInterface.NumDigitosPadraoT[pConfiguracao];
end;

function TKernelProperties.Get_MoreRecentFirmware: WideString;
begin
    Result := DefaultInterface.MoreRecentFirmware;
end;

function TKernelProperties.Get_RaiseExceptions: WordBool;
begin
    Result := DefaultInterface.RaiseExceptions;
end;

procedure TKernelProperties.Set_RaiseExceptions(Value: WordBool);
begin
  DefaultInterface.Set_RaiseExceptions(Value);
end;

function TKernelProperties.Get_Rec_FncEsp_Matricula(pThreadIndex: Integer; 
                                                    out pMatricula: WideString): WordBool;
begin
    Result := DefaultInterface.Rec_FncEsp_Matricula[pThreadIndex, pMatricula];
end;

function TKernelProperties.Get_Rec_FncEsp_Funcao(pThreadIndex: Integer; 
                                                 const pMatricula: WideString; 
                                                 out pFuncao: SFuncaoEx): WordBool;
begin
    Result := DefaultInterface.Rec_FncEsp_Funcao[pThreadIndex, pMatricula, pFuncao];
end;

function TKernelProperties.Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.QuantRegsColetados[pThreadIndex];
end;

function TKernelProperties.Get_KernelLastError: Integer;
begin
    Result := DefaultInterface.KernelLastError;
end;

function TKernelProperties.Get_RecebePacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePacote[pThreadIndex];
end;

function TKernelProperties.Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.ApagaUltimoPacote[pThreadIndex];
end;

function TKernelProperties.Get_TamanhoRegistro(pConfig: SConfiguracao): Integer;
begin
    Result := DefaultInterface.TamanhoRegistro[pConfig];
end;

function TKernelProperties.Get_TamanhoItemAcesso(pConfig: SConfiguracao): Integer;
begin
    Result := DefaultInterface.TamanhoItemAcesso[pConfig];
end;

function TKernelProperties.Get_SRFuncoes(pConfig: SConfiguracao; pQtFuncoes: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoes[pConfig, pQtFuncoes];
end;

function TKernelProperties.Get_SRFeriados(pConfig: SConfiguracao; pQtFeriados: Integer): Integer;
begin
    Result := DefaultInterface.SRFeriados[pConfig, pQtFeriados];
end;

function TKernelProperties.Get_SRAcionamentos(pConfig: SConfiguracao; pQtAcionamentos: Integer): Integer;
begin
    Result := DefaultInterface.SRAcionamentos[pConfig, pQtAcionamentos];
end;

function TKernelProperties.Get_SRListaAcesso(pConfig: SConfiguracao; pQtItens: Integer): Integer;
begin
    Result := DefaultInterface.SRListaAcesso[pConfig, pQtItens];
end;

function TKernelProperties.Get_SRPeriodos(pConfig: SConfiguracao; pQtPeriodos: Integer): Integer;
begin
    Result := DefaultInterface.SRPeriodos[pConfig, pQtPeriodos];
end;

function TKernelProperties.Get_SRHorariosEscalas(pConfig: SConfiguracao; pQtHorarios: Integer; 
                                                 pQtPeriodosPorHorario: Integer; 
                                                 pQtEscalas: Integer; pQtHorariosPorEscala: Integer): Integer;
begin
    Result := DefaultInterface.SRHorariosEscalas[pConfig, pQtHorarios, pQtPeriodosPorHorario, 
                                                 pQtEscalas, pQtHorariosPorEscala];
end;

function TKernelProperties.Get_SRMsgEspecifica(pConfig: SConfiguracao; pQtMsgs: Integer; 
                                               pQtMatriculasPorMsg: Integer): Integer;
begin
    Result := DefaultInterface.SRMsgEspecifica[pConfig, pQtMsgs, pQtMatriculasPorMsg];
end;

function TKernelProperties.Get_SRFuncoesEspecificas(pConfig: SConfiguracao; pQtMatriculas: Integer; 
                                                    pQtFuncoesPorMatricula: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoesEspecificas[pConfig, pQtMatriculas, pQtFuncoesPorMatricula];
end;

function TKernelProperties.Get_EnviaCfgControlador(pThreadIndex: Integer; pId: Byte; 
                                                   pConfig: SConfigCtrl): WordBool;
begin
    Result := DefaultInterface.EnviaCfgControlador[pThreadIndex, pId, pConfig];
end;

function TKernelProperties.Get_RecebeCfgControlador(pThreadIndex: Integer; pId: Byte; 
                                                    out pConfig: SConfigCtrl): WordBool;
begin
    Result := DefaultInterface.RecebeCfgControlador[pThreadIndex, pId, pConfig];
end;

function TKernelProperties.Get_EnviaFacilityCodes(pThreadIndex: Integer; pId: Byte; 
                                                  pCodes: SFacility): WordBool;
begin
    Result := DefaultInterface.EnviaFacilityCodes[pThreadIndex, pId, pCodes];
end;

function TKernelProperties.Get_RecebeFacilityCodes(pThreadIndex: Integer; pId: Byte; 
                                                   out pCodes: SFacility): WordBool;
begin
    Result := DefaultInterface.RecebeFacilityCodes[pThreadIndex, pId, pCodes];
end;

function TKernelProperties.Get_Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                                           out pIndexHorario: Integer): WordBool;
begin
    Result := DefaultInterface.Add_Horario[pThreadIndex, pPeriodos, pIndexHorario];
end;

function TKernelProperties.Get_Add_Escala(pThreadIndex: Integer; pEscala: SEscala; 
                                          out pEscalaIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Add_Escala[pThreadIndex, pEscala, pEscalaIndex];
end;

function TKernelProperties.Get_Add_MsgEspec(pThreadIndex: Integer; var pMsgEspec: SMsgEspecifica): WordBool;
begin
    Result := DefaultInterface.Add_MsgEspec[pThreadIndex, pMsgEspec];
end;

function TKernelProperties.Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
begin
    Result := DefaultInterface.DigitosRange[pPlaca, pMinimo];
end;

function TKernelProperties.Get_ErrorDescription(pErrorCode: Integer): WideString;
begin
    Result := DefaultInterface.ErrorDescription[pErrorCode];
end;

function TKernelProperties.Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_CarregaTemplate[pTemplate];
end;

function TKernelProperties.Get_Bio_ProcuraTemplate(const pMatricula: WideString; 
                                                   const pTemplate: WideString): WideString;
begin
    Result := DefaultInterface.Bio_ProcuraTemplate[pMatricula, pTemplate];
end;

function TKernelProperties.Get_EnviaAcionaCtrl(pThreadIndex: Integer; pId: Byte; 
                                               pAcionaCtrl: SAcionaCtrl): WordBool;
begin
    Result := DefaultInterface.EnviaAcionaCtrl[pThreadIndex, pId, pAcionaCtrl];
end;

function TKernelProperties.Get_MostRecentFirmware(pConfig: SConfiguracao): WideString;
begin
    Result := DefaultInterface.MostRecentFirmware[pConfig];
end;

function TKernelProperties.Get_getConnResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon): WordBool;
begin
    Result := DefaultInterface.getConnResetTimeout[pThreadIndex, pTimeout];
end;

function TKernelProperties.Get_EnviaDadosEmpregador(pThreadIndex: Integer; pEmpregador: SEmpregador): WordBool;
begin
    Result := DefaultInterface.EnviaDadosEmpregador[pThreadIndex, pEmpregador];
end;

function TKernelProperties.Get_RecebeDadosEmpregador(pThreadIndex: Integer; 
                                                     out pEmpregador: SEmpregador): WordBool;
begin
    Result := DefaultInterface.RecebeDadosEmpregador[pThreadIndex, pEmpregador];
end;

function TKernelProperties.Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; 
                                                       pUsuario: SUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.EnviaUsuarioEquipamento[pThreadIndex, pUsuario];
end;

function TKernelProperties.Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaUsuarioEquipamento[pThreadIndex];
end;

function TKernelProperties.Get_Rec_UsuarioEquipamento(pThreadIndex: Integer; 
                                                      out pUsuario: SUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.Rec_UsuarioEquipamento[pThreadIndex, pUsuario];
end;

function TKernelProperties.Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
begin
    Result := DefaultInterface.ColetaEventos[pThreadIndex, pPathAFD];
end;

function TKernelProperties.Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                               pData: TDateTime; pEmpregador: SEmpregador): WordBool;
begin
    Result := DefaultInterface.ColetaEventosEx[pThreadIndex, pPathAFD, pData, pEmpregador];
end;

function TKernelProperties.Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcessoThd[pThreadIndex];
end;

function TKernelProperties.Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaUsuarios[pThreadIndex];
end;

function TKernelProperties.Get_Add_UsuarioEquipamento(pThreadIndex: Integer; 
                                                      pUsuario: SUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.Add_UsuarioEquipamento[pThreadIndex, pUsuario];
end;

function TKernelProperties.Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; 
                                                         out pLastCommDateTime: Double): WordBool;
begin
    Result := DefaultInterface.DataHoraUltimaComunicacao[pThreadIndex, pLastCommDateTime];
end;

{$ENDIF}

class function CoHamster.Create: IHamster;
begin
  Result := CreateComObject(CLASS_Hamster) as IHamster;
end;

class function CoHamster.CreateRemote(const MachineName: string): IHamster;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Hamster) as IHamster;
end;

procedure THamster.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{59F7BAB9-F192-4681-A756-5C5D75B16410}';
    IntfIID:   '{D1AC83EA-565A-418B-889B-4B5C038B61A8}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure THamster.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IHamster;
  end;
end;

procedure THamster.ConnectTo(svrIntf: IHamster);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure THamster.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function THamster.GetDefaultInterface: IHamster;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor THamster.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := THamsterProperties.Create(Self);
{$ENDIF}
end;

destructor THamster.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function THamster.GetServerProperties: THamsterProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function THamster.Get_Capture(out pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Capture[pTemplate];
end;

function THamster.Get_Verify(const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Verify[pTemplate];
end;

function THamster.Get_Timeout: Integer;
begin
    Result := DefaultInterface.Timeout;
end;

procedure THamster.Set_Timeout(Value: Integer);
begin
  DefaultInterface.Set_Timeout(Value);
end;

function THamster.Get_Brightness: Integer;
begin
    Result := DefaultInterface.Brightness;
end;

procedure THamster.Set_Brightness(Value: Integer);
begin
  DefaultInterface.Set_Brightness(Value);
end;

function THamster.Get_Sensitivity: Integer;
begin
    Result := DefaultInterface.Sensitivity;
end;

procedure THamster.Set_Sensitivity(Value: Integer);
begin
  DefaultInterface.Set_Sensitivity(Value);
end;

function THamster.Get_SetUser(const pTemplate: WideString; const pMatricula: WideString; 
                              pMaster: WordBool): WideString;
begin
    Result := DefaultInterface.SetUser[pTemplate, pMatricula, pMaster];
end;

function THamster.Get_CaptureContinuous(out pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.CaptureContinuous[pTemplate];
end;

function THamster.Get_Quality: Integer;
begin
    Result := DefaultInterface.Quality;
end;

procedure THamster.SetImagem(pHandle: Integer; pTop: Integer; pLeft: Integer; pHeight: Integer; 
                             pWidth: Integer);
begin
  DefaultInterface.SetImagem(pHandle, pTop, pLeft, pHeight, pWidth);
end;

procedure THamster.AbortCapturing;
begin
  DefaultInterface.AbortCapturing;
end;

procedure THamster.CaptureNet(out pTemplate: WideString; out pStatus: WordBool);
begin
  DefaultInterface.CaptureNet(pTemplate, pStatus);
end;

procedure THamster.CaptureContinuousNet(out pTemplate: WideString; out pStatus: WordBool);
begin
  DefaultInterface.CaptureContinuousNet(pTemplate, pStatus);
end;

procedure THamster.CaptureImage(out pImgTemplate: WideString; out pStatus: WordBool);
begin
  DefaultInterface.CaptureImage(pImgTemplate, pStatus);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor THamsterProperties.Create(AServer: THamster);
begin
  inherited Create;
  FServer := AServer;
end;

function THamsterProperties.GetDefaultInterface: IHamster;
begin
  Result := FServer.DefaultInterface;
end;

function THamsterProperties.Get_Capture(out pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Capture[pTemplate];
end;

function THamsterProperties.Get_Verify(const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Verify[pTemplate];
end;

function THamsterProperties.Get_Timeout: Integer;
begin
    Result := DefaultInterface.Timeout;
end;

procedure THamsterProperties.Set_Timeout(Value: Integer);
begin
  DefaultInterface.Set_Timeout(Value);
end;

function THamsterProperties.Get_Brightness: Integer;
begin
    Result := DefaultInterface.Brightness;
end;

procedure THamsterProperties.Set_Brightness(Value: Integer);
begin
  DefaultInterface.Set_Brightness(Value);
end;

function THamsterProperties.Get_Sensitivity: Integer;
begin
    Result := DefaultInterface.Sensitivity;
end;

procedure THamsterProperties.Set_Sensitivity(Value: Integer);
begin
  DefaultInterface.Set_Sensitivity(Value);
end;

function THamsterProperties.Get_SetUser(const pTemplate: WideString; const pMatricula: WideString; 
                                        pMaster: WordBool): WideString;
begin
    Result := DefaultInterface.SetUser[pTemplate, pMatricula, pMaster];
end;

function THamsterProperties.Get_CaptureContinuous(out pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.CaptureContinuous[pTemplate];
end;

function THamsterProperties.Get_Quality: Integer;
begin
    Result := DefaultInterface.Quality;
end;

{$ENDIF}

class function CoAlternativo.Create: IAlternativo;
begin
  Result := CreateComObject(CLASS_Alternativo) as IAlternativo;
end;

class function CoAlternativo.CreateRemote(const MachineName: string): IAlternativo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Alternativo) as IAlternativo;
end;

procedure TAlternativo.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{4B679698-5334-4849-A580-AFD8CA5B9EA4}';
    IntfIID:   '{84685C6E-1264-476F-9EFA-6D8A33246B8B}';
    EventIID:  '{62EE9447-E89B-4E9B-A141-40A7D6153CB3}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAlternativo.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IAlternativo;
  end;
end;

procedure TAlternativo.ConnectTo(svrIntf: IAlternativo);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TAlternativo.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TAlternativo.GetDefaultInterface: IAlternativo;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAlternativo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAlternativoProperties.Create(Self);
{$ENDIF}
end;

destructor TAlternativo.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAlternativo.GetServerProperties: TAlternativoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TAlternativo.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    201: if Assigned(FOnRegistro) then
         FOnRegistro(Self, Params[0] {Integer});
    202: if Assigned(FOnExistOff) then
         FOnExistOff(Self,
                     Params[0] {Integer},
                     Params[1] {Integer},
                     Params[2] {Byte});
    203: if Assigned(FOnProgresso) then
         FOnProgresso(Self,
                      Params[0] {Integer},
                      Params[1] {Integer},
                      Params[2] {Integer},
                      Params[3] {Integer},
                      Params[4] {Integer});
    204: if Assigned(FOnStatus) then
         FOnStatus(Self,
                   Params[0] {Integer},
                   Params[1] {Integer},
                   Params[2] {Integer});
    205: if Assigned(FOnImagemDsp) then
         FOnImagemDsp(Self,
                      Params[0] {Integer},
                      Params[1] {const WideString});
    206: if Assigned(FOnColetaEventos) then
         FOnColetaEventos(Self,
                          Params[0] {Integer},
                          Params[1] {WordBool},
                          Params[2] {Integer},
                          Params[3] {const WideString});
    207: if Assigned(FOnOperacao) then
         FOnOperacao(Self,
                     Params[0] {Integer},
                     Params[1] {WordBool},
                     Params[2] {Integer},
                     Params[3] {const WideString});
  end; {case DispID}
end;

function TAlternativo.Get_ListaPortasSeriais: WideString;
begin
    Result := DefaultInterface.ListaPortasSeriais;
end;

function TAlternativo.Get_AdicionaCardSerial(pNumero: Byte; const pPorta: WideString; 
                                             pVelocidade: SVelocidade; pCatraca: WordBool; 
                                             pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardSerial[pNumero, pPorta, pVelocidade, pCatraca, 
                                                  pModoComunicacao];
end;

function TAlternativo.Get_AdicionaCardUsb(pCatraca: WordBool): Integer;
begin
    Result := DefaultInterface.AdicionaCardUsb[pCatraca];
end;

function TAlternativo.Get_AdicionaCardModem(const pPorta: WideString; const pFone: WideString; 
                                            pCatraca: WordBool): Integer;
begin
    Result := DefaultInterface.AdicionaCardModem[pPorta, pFone, pCatraca];
end;

function TAlternativo.Get_AdicionaCardSerial485(pNumero: Byte; const pPorta: WideString; 
                                                pVelocidade: SVelocidade; pCatraca: WordBool; 
                                                pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardSerial485[pNumero, pPorta, pVelocidade, pCatraca, 
                                                     pModoComunicacao];
end;

function TAlternativo.Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
begin
    Result := DefaultInterface.Set485OffNumber[pThreadIndex, pNumero];
end;

function TAlternativo.Get_ThreadLastError(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.ThreadLastError[pThreadIndex];
end;

function TAlternativo.Get_USB_Remove: WordBool;
begin
    Result := DefaultInterface.USB_Remove;
end;

function TAlternativo.Get_EnviaConfiguracao(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaConfiguracao[pThreadIndex];
end;

function TAlternativo.Get_RecebeConfiguracao(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeConfiguracao[pThreadIndex];
end;

function TAlternativo.Get_AlterarVelocidade(pThreadIndex: Integer; pNovaVelocidade: SVelocidade): WordBool;
begin
    Result := DefaultInterface.AlterarVelocidade[pThreadIndex, pNovaVelocidade];
end;

function TAlternativo.Get_ThreadPrioridade(pThreadIndex: Integer; pPrioridade: SPrioridade): WordBool;
begin
    Result := DefaultInterface.ThreadPrioridade[pThreadIndex, pPrioridade];
end;

function TAlternativo.Get_ExistemRegistros(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.ExistemRegistros[pThreadIndex];
end;

function TAlternativo.Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecuperaRegistros[pThreadIndex];
end;

function TAlternativo.Get_EnviaBeep(pThreadIndex: Integer; pBip: SBeep): WordBool;
begin
    Result := DefaultInterface.EnviaBeep[pThreadIndex, pBip];
end;

function TAlternativo.Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
begin
    Result := DefaultInterface.EnviaDataHora[pThreadIndex, pDataHora];
end;

function TAlternativo.Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHora: TDateTime; 
                                          pUsarHorarioVerao: WordBool; 
                                          pHorarioVeraoInicio: TDateTime; 
                                          pHorarioVeraoTermino: TDateTime): WordBool;
begin
    Result := DefaultInterface.EnviaDataHoraEx[pThreadIndex, pDataHora, pUsarHorarioVerao, 
                                               pHorarioVeraoInicio, pHorarioVeraoTermino];
end;

function TAlternativo.Get_EnviaTipoCatraca(pThreadIndex: Integer; pStatusGiro: SStatusGiro; 
                                           pTempoLiberacao: Byte): WordBool;
begin
    Result := DefaultInterface.EnviaTipoCatraca[pThreadIndex, pStatusGiro, pTempoLiberacao];
end;

function TAlternativo.Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFuncoes[pThreadIndex];
end;

function TAlternativo.Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFuncoes[pThreadIndex];
end;

function TAlternativo.Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFeriados[pThreadIndex];
end;

function TAlternativo.Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFeriados[pThreadIndex];
end;

function TAlternativo.Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaAcionamentos[pThreadIndex];
end;

function TAlternativo.Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeAcionamentos[pThreadIndex];
end;

function TAlternativo.Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaPeriodos[pThreadIndex];
end;

function TAlternativo.Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePeriodos[pThreadIndex];
end;

function TAlternativo.Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaHorarios[pThreadIndex];
end;

function TAlternativo.Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeHorarios[pThreadIndex];
end;

function TAlternativo.Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcesso[pThreadIndex];
end;

function TAlternativo.Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaAcesso[pThreadIndex];
end;

function TAlternativo.Get_EnviaMsgPadrao(pThreadIndex: Integer; pEstiloPadrao: SMsgEstilo; 
                                         pEstiloEntrada: SMsgEstilo; pEstiloSaida: SMsgEstilo; 
                                         const pMsgPadraoLinha1: WideString; 
                                         const pMsgPadraoLinha2: WideString; 
                                         const pMsgEntradaLinha1: WideString; 
                                         const pMsgEntradaLinha2: WideString; 
                                         const pMsgSaidaLinha1: WideString; 
                                         const pMsgSaidaLinha2: WideString; pTempoPadrao: Byte; 
                                         pTempoEntrada: Byte; pTempoSaida: Byte): WordBool;
begin
    Result := DefaultInterface.EnviaMsgPadrao[pThreadIndex, pEstiloPadrao, pEstiloEntrada, 
                                              pEstiloSaida, pMsgPadraoLinha1, pMsgPadraoLinha2, 
                                              pMsgEntradaLinha1, pMsgEntradaLinha2, 
                                              pMsgSaidaLinha1, pMsgSaidaLinha2, pTempoPadrao, 
                                              pTempoEntrada, pTempoSaida];
end;

function TAlternativo.Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaMsgsEspecificas[pThreadIndex];
end;

function TAlternativo.Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeMsgsEspecificas[pThreadIndex];
end;

function TAlternativo.Get_EnviaParticionamento(pThreadIndex: Integer; pFuncoes: Integer; 
                                               pFeriados: Integer; pAcionamentos: Integer; 
                                               pListaAcesso: Integer; pPeriodos: Integer; 
                                               pHorarios: Integer; pMsgEspecifica: Integer; 
                                               pRegistros: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaParticionamento[pThreadIndex, pFuncoes, pFeriados, 
                                                    pAcionamentos, pListaAcesso, pPeriodos, 
                                                    pHorarios, pMsgEspecifica, pRegistros];
end;

function TAlternativo.Get_Versao: WideString;
begin
    Result := DefaultInterface.Versao;
end;

function TAlternativo.Get_RemoveCard(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RemoveCard[pThreadIndex];
end;

function TAlternativo.Get_Bio_UsuariosQuant(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.Bio_UsuariosQuant[pThreadIndex];
end;

function TAlternativo.Get_Bio_UsuarioExiste(pThreadIndex: Integer; const pUsuarioID: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_UsuarioExiste[pThreadIndex, pUsuarioID];
end;

function TAlternativo.Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_RecListaUsuarios[pThreadIndex];
end;

function TAlternativo.Get_Bio_RecTemplate(pThreadIndex: Integer; const pUsuarioID: WideString): WideString;
begin
    Result := DefaultInterface.Bio_RecTemplate[pThreadIndex, pUsuarioID];
end;

function TAlternativo.Get_Bio_EnvTemplate(pThreadIndex: Integer; const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_EnvTemplate[pThreadIndex, pTemplate];
end;

function TAlternativo.Get_Bio_DelTemplate(pThreadIndex: Integer; const pUsuarioID: WideString; 
                                          pFingerOnly: WordBool): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplate[pThreadIndex, pUsuarioID, pFingerOnly];
end;

function TAlternativo.Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplateTodas[pThreadIndex];
end;

function TAlternativo.Get_Bio_GeraUserID(pBiometria: SBiometria; const pMatricula: WideString; 
                                         pDedo: Byte; pMaster: WordBool): WideString;
begin
    Result := DefaultInterface.Bio_GeraUserID[pBiometria, pMatricula, pDedo, pMaster];
end;

function TAlternativo.Get_Bio_GetMaxQuantList(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.Bio_GetMaxQuantList[pThreadIndex];
end;

function TAlternativo.Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.Bio_UsuariosQuantLivre[pThreadIndex];
end;

function TAlternativo.Get_DetectarVelocidade(pThreadIndex: Integer): SVelocidade;
begin
    Result := DefaultInterface.DetectarVelocidade[pThreadIndex];
end;

function TAlternativo.Get_NumDigitosValidos: Byte;
begin
    Result := DefaultInterface.NumDigitosValidos;
end;

function TAlternativo.Get_NumDigitosPadraoT: Byte;
begin
    Result := DefaultInterface.NumDigitosPadraoT;
end;

function TAlternativo.Get_MoreRecentFirmware: WideString;
begin
    Result := DefaultInterface.MoreRecentFirmware;
end;

function TAlternativo.Get_RaiseExceptions: WordBool;
begin
    Result := DefaultInterface.RaiseExceptions;
end;

procedure TAlternativo.Set_RaiseExceptions(Value: WordBool);
begin
  DefaultInterface.Set_RaiseExceptions(Value);
end;

function TAlternativo.Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.QuantRegsColetados[pThreadIndex];
end;

function TAlternativo.Get_KernelLastError: Integer;
begin
    Result := DefaultInterface.KernelLastError;
end;

function TAlternativo.Get_RecebePacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePacote[pThreadIndex];
end;

function TAlternativo.Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.ApagaUltimoPacote[pThreadIndex];
end;

function TAlternativo.Get_TamanhoRegistro: Integer;
begin
    Result := DefaultInterface.TamanhoRegistro;
end;

function TAlternativo.Get_TamanhoItemAcesso: Integer;
begin
    Result := DefaultInterface.TamanhoItemAcesso;
end;

function TAlternativo.Get_SRFuncoes(pQtFuncoes: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoes[pQtFuncoes];
end;

function TAlternativo.Get_SRFeriados(pQtFeriados: Integer): Integer;
begin
    Result := DefaultInterface.SRFeriados[pQtFeriados];
end;

function TAlternativo.Get_SRAcionamentos(pQtAcionamentos: Integer): Integer;
begin
    Result := DefaultInterface.SRAcionamentos[pQtAcionamentos];
end;

function TAlternativo.Get_SRListaAcesso(pQtItens: Integer): Integer;
begin
    Result := DefaultInterface.SRListaAcesso[pQtItens];
end;

function TAlternativo.Get_SRPeriodos(pQtPeriodos: Integer): Integer;
begin
    Result := DefaultInterface.SRPeriodos[pQtPeriodos];
end;

function TAlternativo.Get_SRHorariosEscalas(pQtHorarios: Integer; pQtPeriodosPorHorario: Integer; 
                                            pQtEscalas: Integer; pQtHorariosPorEscala: Integer): Integer;
begin
    Result := DefaultInterface.SRHorariosEscalas[pQtHorarios, pQtPeriodosPorHorario, pQtEscalas, 
                                                 pQtHorariosPorEscala];
end;

function TAlternativo.Get_SRMsgEspecifica(pQtMsgs: Integer; pQtMatriculasPorMsg: Integer): Integer;
begin
    Result := DefaultInterface.SRMsgEspecifica[pQtMsgs, pQtMatriculasPorMsg];
end;

function TAlternativo.Get_SRFuncoesEspecificas(pQtMatriculas: Integer; 
                                               pQtFuncoesPorMatricula: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoesEspecificas[pQtMatriculas, pQtFuncoesPorMatricula];
end;

function TAlternativo.Get_SetorPercentual(pFuncoes: Integer; pFeriados: Integer; 
                                          pAcionamentos: Integer; pLista: Integer; 
                                          pPeriodos: Integer; pHorarios: Integer; 
                                          pMsgEspecifica: Integer; pRegistros: Integer; 
                                          pSetor: SParticao): Double;
begin
    Result := DefaultInterface.SetorPercentual[pFuncoes, pFeriados, pAcionamentos, pLista, 
                                               pPeriodos, pHorarios, pMsgEspecifica, pRegistros, 
                                               pSetor];
end;

function TAlternativo.Get_AdicionaCardTcpIp(const pIp: WideString; const pMac: WideString; 
                                            pPorta: Integer; pCatraca: WordBool; 
                                            pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardTcpIp[pIp, pMac, pPorta, pCatraca, pModoComunicacao];
end;

function TAlternativo.Get_RecebeQtRegistros(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.RecebeQtRegistros[pThreadIndex];
end;

function TAlternativo.Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
begin
    Result := DefaultInterface.DigitosRange[pPlaca, pMinimo];
end;

function TAlternativo.Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_CarregaTemplate[pTemplate];
end;

function TAlternativo.Get_Bio_ProcuraTemplate(const pMatricula: WideString; 
                                              const pTemplate: WideString): WideString;
begin
    Result := DefaultInterface.Bio_ProcuraTemplate[pMatricula, pTemplate];
end;

function TAlternativo.Get_EnviaConfigDSP(pThreadIndex: Integer; pNivelSeguranca: Integer; 
                                         pVelocidade: Integer; pSensibilidade: Integer; 
                                         pQualidadeImagem: Integer; pCondicaoIluminacao: WordBool): WordBool;
begin
    Result := DefaultInterface.EnviaConfigDSP[pThreadIndex, pNivelSeguranca, pVelocidade, 
                                              pSensibilidade, pQualidadeImagem, pCondicaoIluminacao];
end;

function TAlternativo.Get_AdicionaCardGPRS(pCatraca: WordBool; pPorta: Integer; 
                                           pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardGPRS[pCatraca, pPorta, pModoComunicacao];
end;

function TAlternativo.Get_RecebeMsgPadraoB(pThreadIndex: Integer; out pEstiloPadrao: SMsgEstilo; 
                                           out pEstiloEntrada: SMsgEstilo; 
                                           out pEstiloSaida: SMsgEstilo; 
                                           out pMsgPadraoLinha1: WideString; 
                                           out pMsgPadraoLinha2: WideString; 
                                           out pMsgEntradaLinha1: WideString; 
                                           out pMsgEntradaLinha2: WideString; 
                                           out pMsgSaidaLinha1: WideString; 
                                           out pMsgSaidaLinha2: WideString; out pTempoPadrao: Byte; 
                                           out pTempoEntrada: Byte; out pTempoSaida: Byte): WordBool;
begin
    Result := DefaultInterface.RecebeMsgPadraoB[pThreadIndex, pEstiloPadrao, pEstiloEntrada, 
                                                pEstiloSaida, pMsgPadraoLinha1, pMsgPadraoLinha2, 
                                                pMsgEntradaLinha1, pMsgEntradaLinha2, 
                                                pMsgSaidaLinha1, pMsgSaidaLinha2, pTempoPadrao, 
                                                pTempoEntrada, pTempoSaida];
end;

function TAlternativo.Get_SetorPercentualEx(pFuncoes: Integer; pFeriados: Integer; 
                                            pAcionamentos: Integer; pLista: Integer; 
                                            pPeriodos: Integer; pHorarios: Integer; 
                                            pMsgEspec: Integer; pRegistros: Integer; 
                                            pSetor: SParticao; pExpansao: SExpansao): Double;
begin
    Result := DefaultInterface.SetorPercentualEx[pFuncoes, pFeriados, pAcionamentos, pLista, 
                                                 pPeriodos, pHorarios, pMsgEspec, pRegistros, 
                                                 pSetor, pExpansao];
end;

function TAlternativo.Get_MostRecentFirmware(pPlacaCard: SPlacaCard; pOrion: WordBool): WideString;
begin
    Result := DefaultInterface.MostRecentFirmware[pPlacaCard, pOrion];
end;

function TAlternativo.Get_EnviaConfiguracaoControlador(pThreadIndex: Integer; 
                                                       pIDControlador: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaConfiguracaoControlador[pThreadIndex, pIDControlador];
end;

function TAlternativo.Get_RecebeConfiguracaoControlador(pThreadIndex: Integer; 
                                                        pIDControlador: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeConfiguracaoControlador[pThreadIndex, pIDControlador];
end;

function TAlternativo.Get_EnviaDadosEmpregador(pThreadIndex: Integer; 
                                               const pRazaoSocial: WideString; 
                                               const pLocal: WideString; 
                                               const pDocumento: WideString; 
                                               const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool;
begin
    Result := DefaultInterface.EnviaDadosEmpregador[pThreadIndex, pRazaoSocial, pLocal, pDocumento, 
                                                    pCEI, pIdEmpregador];
end;

function TAlternativo.Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; 
                                                  const pMatriculas: WideString; 
                                                  const pPIS: WideString; const pNome: WideString; 
                                                  pVerificaDigital: WordBool; 
                                                  pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.EnviaUsuarioEquipamento[pThreadIndex, pMatriculas, pPIS, pNome, 
                                                       pVerificaDigital, pTipoOperacao];
end;

function TAlternativo.Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaUsuarioEquipamento[pThreadIndex];
end;

function TAlternativo.Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
begin
    Result := DefaultInterface.ColetaEventos[pThreadIndex, pPathAFD];
end;

function TAlternativo.Get_ColetaEventosEx(pThreadIndex: Integer; const pPathAFD: WideString; 
                                          pData: TDateTime; const pRazaoSocial: WideString; 
                                          const pLocal: WideString; const pDocumento: WideString; 
                                          const pCEI: WideString; pIdEmpregador: SIdEmpregador): WordBool;
begin
    Result := DefaultInterface.ColetaEventosEx[pThreadIndex, pPathAFD, pData, pRazaoSocial, pLocal, 
                                               pDocumento, pCEI, pIdEmpregador];
end;

function TAlternativo.Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcessoThd[pThreadIndex];
end;

function TAlternativo.Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaUsuarios[pThreadIndex];
end;

function TAlternativo.Get_Add_UsuarioEquipamento(pThreadIndex: Integer; 
                                                 const pMatriculas: WideString; 
                                                 const pPIS: WideString; const pNome: WideString; 
                                                 pVerificaDigital: WordBool; 
                                                 pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.Add_UsuarioEquipamento[pThreadIndex, pMatriculas, pPIS, pNome, 
                                                      pVerificaDigital, pTipoOperacao];
end;

function TAlternativo.Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; 
                                                    out pLastCommDateTime: Double): WordBool;
begin
    Result := DefaultInterface.DataHoraUltimaComunicacao[pThreadIndex, pLastCommDateTime];
end;

procedure TAlternativo.RegistroOn(pThreadIndex: Integer; out pNumeroRelogio: Byte; 
                                  out pFuncao: Byte; out pMatricula: WideString; 
                                  out pDataHora: TDateTime; out pFlag: SFlagRegistro; 
                                  out pSaida: WordBool; out pMasterLiberou: WordBool; 
                                  out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                                  out pFonteEntrada: SFonteEntrada; out pTipoNegado: STipoNegado);
begin
  DefaultInterface.RegistroOn(pThreadIndex, pNumeroRelogio, pFuncao, pMatricula, pDataHora, pFlag, 
                              pSaida, pMasterLiberou, pFuncaoLiberou, pAcessoNegado, pFonteEntrada, 
                              pTipoNegado);
end;

procedure TAlternativo.SetSincronizar(pThreadIndex: Integer; pSincronizar: WordBool);
begin
  DefaultInterface.SetSincronizar(pThreadIndex, pSincronizar);
end;

procedure TAlternativo.cfg_getInfo(out Versao: WideString; out Placa: SPlacaCard; 
                                   out Orion: WordBool; out Expansao: WordBool; 
                                   out Biometria: SBiometria);
begin
  DefaultInterface.cfg_getInfo(Versao, Placa, Orion, Expansao, Biometria);
end;

procedure TAlternativo.cfg_getReles(ReleIndex: Byte; out Status: SReleStatus; 
                                    out TipoNANF: SReleNANF; out Tempo: Byte);
begin
  DefaultInterface.cfg_getReles(ReleIndex, Status, TipoNANF, Tempo);
end;

procedure TAlternativo.cfg_setReles(ReleIndex: Byte; Status: SReleStatus; TipoNANF: SReleNANF; 
                                    Tempo: Byte);
begin
  DefaultInterface.cfg_setReles(ReleIndex, Status, TipoNANF, Tempo);
end;

procedure TAlternativo.cfg_getLeitores(out Leitor1: SLeitor; out Leitor2: SLeitor; 
                                       out Leitor3: SLeitor);
begin
  DefaultInterface.cfg_getLeitores(Leitor1, Leitor2, Leitor3);
end;

procedure TAlternativo.cfg_setLeitores(Leitor1: SLeitor; Leitor2: SLeitor; Leitor3: SLeitor);
begin
  DefaultInterface.cfg_setLeitores(Leitor1, Leitor2, Leitor3);
end;

procedure TAlternativo.cfg_getCodigoBarras(out PadraoD: WordBool; out Letras: WordBool; 
                                           out PadraoLivre: WordBool; 
                                           out DigitosAutomatico: WordBool; out PadraoT: WordBool; 
                                           out OcultarDigitos: WordBool);
begin
  DefaultInterface.cfg_getCodigoBarras(PadraoD, Letras, PadraoLivre, DigitosAutomatico, PadraoT, 
                                       OcultarDigitos);
end;

procedure TAlternativo.cfg_setCodigoBarras(PadraoD: WordBool; Letras: WordBool; 
                                           PadraoLivre: WordBool; DigitosAutomatico: WordBool; 
                                           PadraoT: WordBool; OcultarDigitos: WordBool);
begin
  DefaultInterface.cfg_setCodigoBarras(PadraoD, Letras, PadraoLivre, DigitosAutomatico, PadraoT, 
                                       OcultarDigitos);
end;

procedure TAlternativo.cfg_getRevista(out Tipo: STipoRevista; out Percentual: Byte);
begin
  DefaultInterface.cfg_getRevista(Tipo, Percentual);
end;

procedure TAlternativo.cfg_setRevista(Tipo: STipoRevista; Percentual: Byte);
begin
  DefaultInterface.cfg_setRevista(Tipo, Percentual);
end;

procedure TAlternativo.cfg_getEmpresas(out Empresa1: WideString; out Empresa2: WideString; 
                                       out Empresa3: WideString; out Empresa4: WideString; 
                                       out Empresa5: WideString);
begin
  DefaultInterface.cfg_getEmpresas(Empresa1, Empresa2, Empresa3, Empresa4, Empresa5);
end;

procedure TAlternativo.cfg_setEmpresas(const Empresa1: WideString; const Empresa2: WideString; 
                                       const Empresa3: WideString; const Empresa4: WideString; 
                                       const Empresa5: WideString);
begin
  DefaultInterface.cfg_setEmpresas(Empresa1, Empresa2, Empresa3, Empresa4, Empresa5);
end;

procedure TAlternativo.cfg_getCtrlAcessoEx(out Gravacao: SGravacao; out AtivarMaster: WordBool; 
                                           out Sinaliza50Percent: WordBool; 
                                           out SenhaPadraoHenry: WordBool; out Catraca: WordBool; 
                                           out CatracaInvertida: WordBool; 
                                           out CatracaDupla: WordBool);
begin
  DefaultInterface.cfg_getCtrlAcessoEx(Gravacao, AtivarMaster, Sinaliza50Percent, SenhaPadraoHenry, 
                                       Catraca, CatracaInvertida, CatracaDupla);
end;

procedure TAlternativo.cfg_setCtrlAcessoEx(Gravacao: SGravacao; AtivarMaster: WordBool; 
                                           Sinaliza50Percent: WordBool; SenhaPadraoHenry: WordBool; 
                                           Catraca: WordBool; CatracaInvertida: WordBool; 
                                           CatracaDupla: WordBool);
begin
  DefaultInterface.cfg_setCtrlAcessoEx(Gravacao, AtivarMaster, Sinaliza50Percent, SenhaPadraoHenry, 
                                       Catraca, CatracaInvertida, CatracaDupla);
end;

procedure TAlternativo.cfg_getControles(out BloqueiaPeriodo: WordBool; 
                                        out BiometriaOnline: WordBool; 
                                        out FuncoesEspecificas: WordBool; 
                                        out CatBioLiberaAmbos: WordBool; out Visitantes: WordBool; 
                                        out Touch: WordBool; out BimetriaImagem: WordBool; 
                                        out AutoOn: SAutoOn);
begin
  DefaultInterface.cfg_getControles(BloqueiaPeriodo, BiometriaOnline, FuncoesEspecificas, 
                                    CatBioLiberaAmbos, Visitantes, Touch, BimetriaImagem, AutoOn);
end;

procedure TAlternativo.cfg_setControles(BloqueiaPeriodo: WordBool; BiometriaOnline: WordBool; 
                                        FuncoesEspecificas: WordBool; CatBioLiberaAmbos: WordBool; 
                                        Visitantes: WordBool; Touch: WordBool; 
                                        BiometriaImagem: WordBool; AutoOn: SAutoOn);
begin
  DefaultInterface.cfg_setControles(BloqueiaPeriodo, BiometriaOnline, FuncoesEspecificas, 
                                    CatBioLiberaAmbos, Visitantes, Touch, BiometriaImagem, AutoOn);
end;

procedure TAlternativo.cfg_getAntiPassBack(out Habilitado: WordBool; out EntradaSaida: WordBool; 
                                           out Tempo: Byte);
begin
  DefaultInterface.cfg_getAntiPassBack(Habilitado, EntradaSaida, Tempo);
end;

procedure TAlternativo.cfg_setAntiPassBack(Habilitado: WordBool; EntradaSaida: WordBool; Tempo: Byte);
begin
  DefaultInterface.cfg_setAntiPassBack(Habilitado, EntradaSaida, Tempo);
end;

procedure TAlternativo.cfg_getSensores(pSensorIndex: Byte; out Habilitado: WordBool; 
                                       out Porta: WordBool; out Botao: WordBool; 
                                       out Rele1: WordBool; out Rele2: WordBool; 
                                       out Rele3: WordBool; out Rele4: WordBool; out Rele5: WordBool);
begin
  DefaultInterface.cfg_getSensores(pSensorIndex, Habilitado, Porta, Botao, Rele1, Rele2, Rele3, 
                                   Rele4, Rele5);
end;

procedure TAlternativo.cfg_setSensores(SensorIndex: Byte; Habilitado: WordBool; Porta: WordBool; 
                                       Botao: WordBool; Rele1: WordBool; Rele2: WordBool; 
                                       Rele3: WordBool; Rele4: WordBool; Rele5: WordBool);
begin
  DefaultInterface.cfg_setSensores(SensorIndex, Habilitado, Porta, Botao, Rele1, Rele2, Rele3, 
                                   Rele4, Rele5);
end;

procedure TAlternativo.cfg_getConfig(out ModoComunicacao: SModoComunicacao; out Teclado: STeclado; 
                                     out NumDigitos: Byte; out NivelAcesso: Byte; 
                                     out ToquesAtender: Byte; out DigitosSel: SDigitos; 
                                     out SenhaMenu: WordBool; out Senha: WideString; 
                                     out CtrlAcesso: SCtrlAcesso);
begin
  DefaultInterface.cfg_getConfig(ModoComunicacao, Teclado, NumDigitos, NivelAcesso, ToquesAtender, 
                                 DigitosSel, SenhaMenu, Senha, CtrlAcesso);
end;

procedure TAlternativo.cfg_setConfig(ModoComunicacao: SModoComunicacao; Teclado: STeclado; 
                                     NumDigitos: Byte; NivelAcesso: Byte; ToquesAtender: Byte; 
                                     const DigitosSel: WideString; SenhaMenu: WordBool; 
                                     const Senha: WideString; CtrlAcesso: SCtrlAcesso);
begin
  DefaultInterface.cfg_setConfig(ModoComunicacao, Teclado, NumDigitos, NivelAcesso, ToquesAtender, 
                                 DigitosSel, SenhaMenu, Senha, CtrlAcesso);
end;

procedure TAlternativo.Add_Funcao(pThreadIndex: Integer; pAtiva: WordBool; pLiberaAcesso: WordBool; 
                                  const pMensagem: WideString; pTempo: Byte);
begin
  DefaultInterface.Add_Funcao(pThreadIndex, pAtiva, pLiberaAcesso, pMensagem, pTempo);
end;

procedure TAlternativo.Add_Feriado(pThreadIndex: Integer; pDia: TDateTime);
begin
  DefaultInterface.Add_Feriado(pThreadIndex, pDia);
end;

procedure TAlternativo.Add_Acionamento(pThreadIndex: Integer; pHorario: TDateTime; pTempo: Byte; 
                                       pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                                       pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                                       pSabado: WordBool; pFeriado: WordBool);
begin
  DefaultInterface.Add_Acionamento(pThreadIndex, pHorario, pTempo, pDomingo, pSegunda, pTerca, 
                                   pQuarta, pQuinta, pSexta, pSabado, pFeriado);
end;

procedure TAlternativo.Add_Periodo(pThreadIndex: Integer; pHorario: TDateTime; pTolerancia: Byte; 
                                   pDomingo: WordBool; pSegunda: WordBool; pTerca: WordBool; 
                                   pQuarta: WordBool; pQuinta: WordBool; pSexta: WordBool; 
                                   pSabado: WordBool; pFeriado: WordBool);
begin
  DefaultInterface.Add_Periodo(pThreadIndex, pHorario, pTolerancia, pDomingo, pSegunda, pTerca, 
                               pQuarta, pQuinta, pSexta, pSabado, pFeriado);
end;

procedure TAlternativo.Add_ItemAcesso(pThreadIndex: Integer; const pMatricula: WideString; 
                                      pIndexHorario: Byte; pAcesso: SAcessoOffline; 
                                      pPerBloqInicio: TDateTime; pPerBloqFinal: TDateTime; 
                                      pPerBloqHabilitado: WordBool; pAcionaRele1: WordBool; 
                                      pAcionaRele2: WordBool; pAcionaRele3: WordBool; 
                                      pVerificarDigital: WordBool; pMaster: WordBool; 
                                      pVisitante: WordBool);
begin
  DefaultInterface.Add_ItemAcesso(pThreadIndex, pMatricula, pIndexHorario, pAcesso, pPerBloqInicio, 
                                  pPerBloqFinal, pPerBloqHabilitado, pAcionaRele1, pAcionaRele2, 
                                  pAcionaRele3, pVerificarDigital, pMaster, pVisitante);
end;

procedure TAlternativo.Add_Escala(pThreadIndex: Integer; pDataInicio: TDateTime; 
                                  const pHorarios: WideString);
begin
  DefaultInterface.Add_Escala(pThreadIndex, pDataInicio, pHorarios);
end;

procedure TAlternativo.Add_MsgEspec(pThreadIndex: Integer; pMsgEstilo: SMsgEstilo; pMsgTempo: Byte; 
                                    const pMsgLinha1: WideString; const pMsgLinha2: WideString; 
                                    const pMatriculas: WideString; pData: TDateTime; 
                                    pTodosDias: WordBool);
begin
  DefaultInterface.Add_MsgEspec(pThreadIndex, pMsgEstilo, pMsgTempo, pMsgLinha1, pMsgLinha2, 
                                pMatriculas, pData, pTodosDias);
end;

procedure TAlternativo.SetConectado(pThreadIndex: Integer; pConectado: WordBool);
begin
  DefaultInterface.SetConectado(pThreadIndex, pConectado);
end;

procedure TAlternativo.BeginLargeTransfer(pThreadIndex: Integer);
begin
  DefaultInterface.BeginLargeTransfer(pThreadIndex);
end;

procedure TAlternativo.EndLargeTransfer(pThreadIndex: Integer);
begin
  DefaultInterface.EndLargeTransfer(pThreadIndex);
end;

procedure TAlternativo.RespostaOn(pThreadIndex: Integer; pAcesso: SAcessoOnline; 
                                  const pMensagem: WideString; pTempo: Byte);
begin
  DefaultInterface.RespostaOn(pThreadIndex, pAcesso, pMensagem, pTempo);
end;

procedure TAlternativo.Add_FncEsp_Matricula(pThreadIndex: Integer; const pMatricula: WideString);
begin
  DefaultInterface.Add_FncEsp_Matricula(pThreadIndex, pMatricula);
end;

procedure TAlternativo.Add_FncEsp_Funcao(pThreadIndex: Integer; const pMatricula: WideString; 
                                         const pMensagem: WideString; pTempo: Byte; pNumero: Byte);
begin
  DefaultInterface.Add_FncEsp_Funcao(pThreadIndex, pMatricula, pMensagem, pTempo, pNumero);
end;

procedure TAlternativo.RegistroOff(pThreadIndex: Integer; out pNumeroRelogio: Byte; 
                                   out pFuncao: Byte; out pMatricula: WideString; 
                                   out pDataHora: TDateTime; out pFlag: SFlagRegistro; 
                                   out pSaida: WordBool; out pMasterLiberou: WordBool; 
                                   out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                                   out pFonteEntrada: SFonteEntrada; out pTipoNegado: STipoNegado);
begin
  DefaultInterface.RegistroOff(pThreadIndex, pNumeroRelogio, pFuncao, pMatricula, pDataHora, pFlag, 
                               pSaida, pMasterLiberou, pFuncaoLiberou, pAcessoNegado, 
                               pFonteEntrada, pTipoNegado);
end;

procedure TAlternativo.RecebeDataHora(pThreadIndex: Integer; out pDataHora: TDateTime);
begin
  DefaultInterface.RecebeDataHora(pThreadIndex, pDataHora);
end;

procedure TAlternativo.RecebeDataHoraEx(pThreadIndex: Integer; out pDataHora: TDateTime; 
                                        out pUsarHorarioVerao: WordBool; 
                                        out pHorarioVeraoInicio: TDateTime; 
                                        out pHorarioVeraoFim: TDateTime);
begin
  DefaultInterface.RecebeDataHoraEx(pThreadIndex, pDataHora, pUsarHorarioVerao, 
                                    pHorarioVeraoInicio, pHorarioVeraoFim);
end;

procedure TAlternativo.RecebeTipoCatraca(pThreadIndex: Integer; out pStatusGiro: SStatusGiro; 
                                         out pTempoLiberacao: Byte);
begin
  DefaultInterface.RecebeTipoCatraca(pThreadIndex, pStatusGiro, pTempoLiberacao);
end;

procedure TAlternativo.Bio_RecUsuario(pThreadIndex: Integer; pPrimeiro: WordBool; 
                                      out pMatricula: WideString; out pTemplate: WideString; 
                                      out pId: WideString; out pMaster: WordBool; out pDedo: Byte);
begin
  DefaultInterface.Bio_RecUsuario(pThreadIndex, pPrimeiro, pMatricula, pTemplate, pId, pMaster, 
                                  pDedo);
end;

procedure TAlternativo.Bio_GetUsuario(pThreadIndex: Integer; out pMatricula: WideString; 
                                      out pId: WideString; out pDedo: Byte; out pMaster: WordBool);
begin
  DefaultInterface.Bio_GetUsuario(pThreadIndex, pMatricula, pId, pDedo, pMaster);
end;

procedure TAlternativo.Rec_Funcao(pThreadIndex: Integer; out pAtiva: WordBool; 
                                  out pLiberaAcesso: WordBool; out pMensagem: WideString; 
                                  out pTempo: Byte);
begin
  DefaultInterface.Rec_Funcao(pThreadIndex, pAtiva, pLiberaAcesso, pMensagem, pTempo);
end;

procedure TAlternativo.Rec_Feriado(pThreadIndex: Integer; out pFeriado: TDateTime);
begin
  DefaultInterface.Rec_Feriado(pThreadIndex, pFeriado);
end;

procedure TAlternativo.Rec_Horario(pThreadIndex: Integer; out pHorario: WideString);
begin
  DefaultInterface.Rec_Horario(pThreadIndex, pHorario);
end;

procedure TAlternativo.Rec_Acionamento(pThreadIndex: Integer; out pHorario: TDateTime; 
                                       out pTempo: Byte; out pDomingo: WordBool; 
                                       out pSegunda: WordBool; out pTerca: WordBool; 
                                       out pQuarta: WordBool; out pQuinta: WordBool; 
                                       out pSexta: WordBool; out pSabado: WordBool; 
                                       out pFeriado: WordBool);
begin
  DefaultInterface.Rec_Acionamento(pThreadIndex, pHorario, pTempo, pDomingo, pSegunda, pTerca, 
                                   pQuarta, pQuinta, pSexta, pSabado, pFeriado);
end;

procedure TAlternativo.SetConcentrador(pThreadIndex: Integer; pIsConcentrador: WordBool);
begin
  DefaultInterface.SetConcentrador(pThreadIndex, pIsConcentrador);
end;

procedure TAlternativo.RecebeParticionamento(pThreadIndex: Integer; out pFuncoes: Integer; 
                                             out pFeriados: Integer; out pAcionamentos: Integer; 
                                             out pListaAcesso: Integer; out pPeriodos: Integer; 
                                             out pHorarios: Integer; out pMsgEspecifica: Integer; 
                                             out pRegistros: Integer);
begin
  DefaultInterface.RecebeParticionamento(pThreadIndex, pFuncoes, pFeriados, pAcionamentos, 
                                         pListaAcesso, pPeriodos, pHorarios, pMsgEspecifica, 
                                         pRegistros);
end;

procedure TAlternativo.SetSecurityLevel(pValue: Byte);
begin
  DefaultInterface.SetSecurityLevel(pValue);
end;

procedure TAlternativo.RespostaOnB(pThreadIndex: Integer; pAcessoLiberado: WordBool; 
                                   pIDControlador: Byte; pTempoRele1: Byte; pTempoRele2: Byte; 
                                   pTempoRele3: Byte);
begin
  DefaultInterface.RespostaOnB(pThreadIndex, pAcessoLiberado, pIDControlador, pTempoRele1, 
                               pTempoRele2, pTempoRele3);
end;

procedure TAlternativo.Bio_DropTemplates;
begin
  DefaultInterface.Bio_DropTemplates;
end;

procedure TAlternativo.SetICMPProtocol(pThreadIndex: Integer; pEnabled: WordBool);
begin
  DefaultInterface.SetICMPProtocol(pThreadIndex, pEnabled);
end;

procedure TAlternativo.Add_Horario(pThreadIndex: Integer; const pPeriodos: WideString; 
                                   out pIndexHorario: Integer);
begin
  DefaultInterface.Add_Horario(pThreadIndex, pPeriodos, pIndexHorario);
end;

procedure TAlternativo.Rec_Escala(pThreadIndex: Integer; out pDataInicio: TDateTime; 
                                  out pHorarios: WideString; out pStatus: WordBool);
begin
  DefaultInterface.Rec_Escala(pThreadIndex, pDataInicio, pHorarios, pStatus);
end;

procedure TAlternativo.Rec_FncEsp_Matricula(pThreadIndex: Integer; out pMatricula: WideString; 
                                            out pStatus: WordBool);
begin
  DefaultInterface.Rec_FncEsp_Matricula(pThreadIndex, pMatricula, pStatus);
end;

procedure TAlternativo.Rec_FncEsp_Funcao(pThreadIndex: Integer; out pMatricula: WideString; 
                                         out pMensagem: WideString; out pTempo: Byte; 
                                         out pNumero: Byte; out pStatus: WordBool);
begin
  DefaultInterface.Rec_FncEsp_Funcao(pThreadIndex, pMatricula, pMensagem, pTempo, pNumero, pStatus);
end;

procedure TAlternativo.Rec_Periodo(pThreadIndex: Integer; out pHorario: TDateTime; 
                                   out pTolerancia: Byte; out pDomingo: WordBool; 
                                   out pSegunda: WordBool; out pTerca: WordBool; 
                                   out pQuarta: WordBool; out pQuinta: WordBool; 
                                   out pSexta: WordBool; out pSabado: WordBool; 
                                   out pFeriado: WordBool; out pStatus: WordBool);
begin
  DefaultInterface.Rec_Periodo(pThreadIndex, pHorario, pTolerancia, pDomingo, pSegunda, pTerca, 
                               pQuarta, pQuinta, pSexta, pSabado, pFeriado, pStatus);
end;

procedure TAlternativo.Rec_MsgEspec(pThreadIndex: Integer; out pMsgStatus: SMsgEstilo; 
                                    out pMsgTempo: Byte; out pMsgLinha1: WideString; 
                                    out pMsgLinha2: WideString; out pMatriculas: WideString; 
                                    out pData: TDateTime; out pTodosDias: WordBool; 
                                    out pStatus: WordBool);
begin
  DefaultInterface.Rec_MsgEspec(pThreadIndex, pMsgStatus, pMsgTempo, pMsgLinha1, pMsgLinha2, 
                                pMatriculas, pData, pTodosDias, pStatus);
end;

procedure TAlternativo.Rec_ItemAcesso(pThreadIndex: Integer; out pMatricula: WideString; 
                                      out pHorario: Byte; out pAcesso: SAcessoOffline; 
                                      out pPerBloqIni: TDateTime; out pPerBloqFim: TDateTime; 
                                      out pPerBloqHab: WordBool; out pAcionaRele1: WordBool; 
                                      out pAcionaRele2: WordBool; out pAcionaRele3: WordBool; 
                                      out pVerificarDigital: WordBool; out pMaster: WordBool; 
                                      out pVisitante: WordBool; out pStatus: WordBool);
begin
  DefaultInterface.Rec_ItemAcesso(pThreadIndex, pMatricula, pHorario, pAcesso, pPerBloqIni, 
                                  pPerBloqFim, pPerBloqHab, pAcionaRele1, pAcionaRele2, 
                                  pAcionaRele3, pVerificarDigital, pMaster, pVisitante, pStatus);
end;

procedure TAlternativo.RecebeConfigDSP(pThreadIndex: Integer; out pNivelSeguranca: Integer; 
                                       out pVelocidade: Integer; out pSensibilidade: Integer; 
                                       out pQualidadeImagem: Integer; 
                                       out pCondicaoIluminacao: WordBool; out pStatus: WordBool);
begin
  DefaultInterface.RecebeConfigDSP(pThreadIndex, pNivelSeguranca, pVelocidade, pSensibilidade, 
                                   pQualidadeImagem, pCondicaoIluminacao, pStatus);
end;

procedure TAlternativo.RecebeMsgPadrao(pThreadIndex: Integer; out pEstiloMsgPadrao: SMsgEstilo; 
                                       out pEstiloMsgEntrada: SMsgEstilo; 
                                       out pEstiloMsgSaida: SMsgEstilo; 
                                       out pMsgPadraoLinha1: WideString; 
                                       out pMsgPadraoLinha2: WideString; 
                                       out pMsgEntradaLinha1: WideString; 
                                       out pMsgEntradaLinha2: WideString; 
                                       out pMsgSaidaLinha1: WideString; 
                                       out pMsgSaidaLinha2: WideString; out pTempoMsgPadrao: Byte; 
                                       out pTempoMsgEntrada: Byte; out pTempoMsgSaida: Byte; 
                                       out pStatus: WordBool);
begin
  DefaultInterface.RecebeMsgPadrao(pThreadIndex, pEstiloMsgPadrao, pEstiloMsgEntrada, 
                                   pEstiloMsgSaida, pMsgPadraoLinha1, pMsgPadraoLinha2, 
                                   pMsgEntradaLinha1, pMsgEntradaLinha2, pMsgSaidaLinha1, 
                                   pMsgSaidaLinha2, pTempoMsgPadrao, pTempoMsgEntrada, 
                                   pTempoMsgSaida, pStatus);
end;

procedure TAlternativo.RespostaStatus(pThreadIndex: Integer; pIndexMensagem: Integer);
begin
  DefaultInterface.RespostaStatus(pThreadIndex, pIndexMensagem);
end;

function TAlternativo.ErrorDescription(pErrorCode: Integer): WideString;
begin
  Result := DefaultInterface.ErrorDescription(pErrorCode);
end;

procedure TAlternativo.cfg_setControleLeitoras(pLeitoraVerificaDigital: WordBool; 
                                               pBiometria11: WordBool);
begin
  DefaultInterface.cfg_setControleLeitoras(pLeitoraVerificaDigital, pBiometria11);
end;

procedure TAlternativo.cfg_getControleLeitoras(out pLeitoraVerificaDigital: WordBool; 
                                               out pBiometria11: WordBool);
begin
  DefaultInterface.cfg_getControleLeitoras(pLeitoraVerificaDigital, pBiometria11);
end;

procedure TAlternativo.setGPRSResetTimeout(pThreadIndex: Integer; pTimeout: SResetCon);
begin
  DefaultInterface.setGPRSResetTimeout(pThreadIndex, pTimeout);
end;

procedure TAlternativo.getGPRSResetTimeout(pThreadIndex: Integer; out pTimeout: SResetCon);
begin
  DefaultInterface.getGPRSResetTimeout(pThreadIndex, pTimeout);
end;

procedure TAlternativo.RegistroOnExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; 
                                     out pFuncao: Byte; out pMatricula: WideString; 
                                     out pDataHora: TDateTime; out pFlag: SFlagRegistro; 
                                     out pSaida: WordBool; out pMasterLiberou: WordBool; 
                                     out pFonteEntrada: SFonteEntrada; 
                                     out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                                     out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                                     out pIdSensor: Byte);
begin
  DefaultInterface.RegistroOnExt(pThreadIndex, pNumeroRelogio, pFuncao, pMatricula, pDataHora, 
                                 pFlag, pSaida, pMasterLiberou, pFonteEntrada, pFuncaoLiberou, 
                                 pAcessoNegado, pTipoNegado, pIDControlador, pIdSensor);
end;

procedure TAlternativo.cfg_setCfgControlador(pCatraca: WordBool; pWorkOff: WordBool; 
                                             pTempoRele1: Byte; pTempoRele2: Byte; pTempoRele3: Byte);
begin
  DefaultInterface.cfg_setCfgControlador(pCatraca, pWorkOff, pTempoRele1, pTempoRele2, pTempoRele3);
end;

procedure TAlternativo.cfg_getCfgControlador(out pCatraca: WordBool; out pWorkOff: WordBool; 
                                             out pTempoRele1: Byte; out pTempoRele2: Byte; 
                                             out pTempoRele3: Byte);
begin
  DefaultInterface.cfg_getCfgControlador(pCatraca, pWorkOff, pTempoRele1, pTempoRele2, pTempoRele3);
end;

procedure TAlternativo.cfg_setSensoresCtrl(pIndexSensor: Integer; pHabilitado: WordBool; 
                                           pTipoSensor: STipoSensor; pRele1: WordBool; 
                                           pRele2: WordBool; pRele3: WordBool);
begin
  DefaultInterface.cfg_setSensoresCtrl(pIndexSensor, pHabilitado, pTipoSensor, pRele1, pRele2, 
                                       pRele3);
end;

procedure TAlternativo.cfg_getSensoresCtrl(pIndexSensor: Integer; out pHabilitado: WordBool; 
                                           out pTipoSensor: STipoSensor; out pRele1: WordBool; 
                                           out pRele2: WordBool; out pRele3: WordBool);
begin
  DefaultInterface.cfg_getSensoresCtrl(pIndexSensor, pHabilitado, pTipoSensor, pRele1, pRele2, 
                                       pRele3);
end;

procedure TAlternativo.cfg_setLeitoresCtrl(pIndexLeitora: Integer; pRele1: Byte; pRele2: Byte; 
                                           pRele3: Byte);
begin
  DefaultInterface.cfg_setLeitoresCtrl(pIndexLeitora, pRele1, pRele2, pRele3);
end;

procedure TAlternativo.cfg_getLeitoresCtrl(pIndexLeitora: Integer; out pRele1: Byte; 
                                           out pRele2: Byte; out pRele3: Byte);
begin
  DefaultInterface.cfg_getLeitoresCtrl(pIndexLeitora, pRele1, pRele2, pRele3);
end;

procedure TAlternativo.RegistroOffExt(pThreadIndex: Integer; out pNumeroRelogio: Byte; 
                                      out pFuncao: Byte; out pMatricula: WideString; 
                                      out pDataHora: TDateTime; out pFlag: SFlagRegistro; 
                                      out pSaida: WordBool; out pMasterLiberou: WordBool; 
                                      out pFonteEntrada: SFonteEntrada; 
                                      out pFuncaoLiberou: WordBool; out pAcessoNegado: WordBool; 
                                      out pTipoNegado: STipoNegado; out pIDControlador: Byte; 
                                      out pIdSensor: Byte);
begin
  DefaultInterface.RegistroOffExt(pThreadIndex, pNumeroRelogio, pFuncao, pMatricula, pDataHora, 
                                  pFlag, pSaida, pMasterLiberou, pFonteEntrada, pFuncaoLiberou, 
                                  pAcessoNegado, pTipoNegado, pIDControlador, pIdSensor);
end;

procedure TAlternativo.cfg_getControladores(out pControladores: WideString);
begin
  DefaultInterface.cfg_getControladores(pControladores);
end;

function TAlternativo.Bio_DropTemplate(const pMatricula: WideString): WordBool;
begin
  Result := DefaultInterface.Bio_DropTemplate(pMatricula);
end;

procedure TAlternativo.RecebeDadosEmpregador(pThreadIndex: Integer; out pRazaoSocial: WideString; 
                                             out pLocal: WideString; out pDocumento: WideString; 
                                             out pCEI: WideString; 
                                             out pIdEmpregador: SIdEmpregador; out pStatus: WordBool);
begin
  DefaultInterface.RecebeDadosEmpregador(pThreadIndex, pRazaoSocial, pLocal, pDocumento, pCEI, 
                                         pIdEmpregador, pStatus);
end;

procedure TAlternativo.Rec_UsuarioEquipamento(pThreadIndex: Integer; out pMatriculas: WideString; 
                                              out pPIS: WideString; out pNome: WideString; 
                                              out pVerificaDigital: WordBool; 
                                              out pTipoOperacao: SOperacaoUsuarioEquipamento; 
                                              out pStatus: WordBool);
begin
  DefaultInterface.Rec_UsuarioEquipamento(pThreadIndex, pMatriculas, pPIS, pNome, pVerificaDigital, 
                                          pTipoOperacao, pStatus);
end;

function TAlternativo.PararColetaEventos(pThreadIndex: Integer): WordBool;
begin
  Result := DefaultInterface.PararColetaEventos(pThreadIndex);
end;

procedure TAlternativo.cfg_setControleTempos(pTimeoutProcessamentoOnline: Integer; 
                                             pLatenciaOffline: Integer);
begin
  DefaultInterface.cfg_setControleTempos(pTimeoutProcessamentoOnline, pLatenciaOffline);
end;

procedure TAlternativo.cfg_getControleTempos(out pTimeoutProcessamentoOnline: Integer; 
                                             out pLatenciaOffline: Integer);
begin
  DefaultInterface.cfg_getControleTempos(pTimeoutProcessamentoOnline, pLatenciaOffline);
end;

procedure TAlternativo.SetSearchTimeout(pSegundos: Integer);
begin
  DefaultInterface.SetSearchTimeout(pSegundos);
end;

function TAlternativo.CancelarOperacao(pThreadIndex: Integer): WordBool;
begin
  Result := DefaultInterface.CancelarOperacao(pThreadIndex);
end;

procedure TAlternativo.cfg_getConfigFlags(out LeitorasAutomaticas: WordBool);
begin
  DefaultInterface.cfg_getConfigFlags(LeitorasAutomaticas);
end;

procedure TAlternativo.cfg_setConfigFlags(LeitorasAutomaticas: WordBool);
begin
  DefaultInterface.cfg_setConfigFlags(LeitorasAutomaticas);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAlternativoProperties.Create(AServer: TAlternativo);
begin
  inherited Create;
  FServer := AServer;
end;

function TAlternativoProperties.GetDefaultInterface: IAlternativo;
begin
  Result := FServer.DefaultInterface;
end;

function TAlternativoProperties.Get_ListaPortasSeriais: WideString;
begin
    Result := DefaultInterface.ListaPortasSeriais;
end;

function TAlternativoProperties.Get_AdicionaCardSerial(pNumero: Byte; const pPorta: WideString; 
                                                       pVelocidade: SVelocidade; 
                                                       pCatraca: WordBool; 
                                                       pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardSerial[pNumero, pPorta, pVelocidade, pCatraca, 
                                                  pModoComunicacao];
end;

function TAlternativoProperties.Get_AdicionaCardUsb(pCatraca: WordBool): Integer;
begin
    Result := DefaultInterface.AdicionaCardUsb[pCatraca];
end;

function TAlternativoProperties.Get_AdicionaCardModem(const pPorta: WideString; 
                                                      const pFone: WideString; pCatraca: WordBool): Integer;
begin
    Result := DefaultInterface.AdicionaCardModem[pPorta, pFone, pCatraca];
end;

function TAlternativoProperties.Get_AdicionaCardSerial485(pNumero: Byte; const pPorta: WideString; 
                                                          pVelocidade: SVelocidade; 
                                                          pCatraca: WordBool; 
                                                          pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardSerial485[pNumero, pPorta, pVelocidade, pCatraca, 
                                                     pModoComunicacao];
end;

function TAlternativoProperties.Get_Set485OffNumber(pThreadIndex: Integer; pNumero: Byte): WordBool;
begin
    Result := DefaultInterface.Set485OffNumber[pThreadIndex, pNumero];
end;

function TAlternativoProperties.Get_ThreadLastError(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.ThreadLastError[pThreadIndex];
end;

function TAlternativoProperties.Get_USB_Remove: WordBool;
begin
    Result := DefaultInterface.USB_Remove;
end;

function TAlternativoProperties.Get_EnviaConfiguracao(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaConfiguracao[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeConfiguracao(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeConfiguracao[pThreadIndex];
end;

function TAlternativoProperties.Get_AlterarVelocidade(pThreadIndex: Integer; 
                                                      pNovaVelocidade: SVelocidade): WordBool;
begin
    Result := DefaultInterface.AlterarVelocidade[pThreadIndex, pNovaVelocidade];
end;

function TAlternativoProperties.Get_ThreadPrioridade(pThreadIndex: Integer; pPrioridade: SPrioridade): WordBool;
begin
    Result := DefaultInterface.ThreadPrioridade[pThreadIndex, pPrioridade];
end;

function TAlternativoProperties.Get_ExistemRegistros(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.ExistemRegistros[pThreadIndex];
end;

function TAlternativoProperties.Get_RecuperaRegistros(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecuperaRegistros[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaBeep(pThreadIndex: Integer; pBip: SBeep): WordBool;
begin
    Result := DefaultInterface.EnviaBeep[pThreadIndex, pBip];
end;

function TAlternativoProperties.Get_EnviaDataHora(pThreadIndex: Integer; pDataHora: TDateTime): WordBool;
begin
    Result := DefaultInterface.EnviaDataHora[pThreadIndex, pDataHora];
end;

function TAlternativoProperties.Get_EnviaDataHoraEx(pThreadIndex: Integer; pDataHora: TDateTime; 
                                                    pUsarHorarioVerao: WordBool; 
                                                    pHorarioVeraoInicio: TDateTime; 
                                                    pHorarioVeraoTermino: TDateTime): WordBool;
begin
    Result := DefaultInterface.EnviaDataHoraEx[pThreadIndex, pDataHora, pUsarHorarioVerao, 
                                               pHorarioVeraoInicio, pHorarioVeraoTermino];
end;

function TAlternativoProperties.Get_EnviaTipoCatraca(pThreadIndex: Integer; 
                                                     pStatusGiro: SStatusGiro; pTempoLiberacao: Byte): WordBool;
begin
    Result := DefaultInterface.EnviaTipoCatraca[pThreadIndex, pStatusGiro, pTempoLiberacao];
end;

function TAlternativoProperties.Get_EnviaFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFuncoes[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeFuncoes(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFuncoes[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaFeriados[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeFeriados(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeFeriados[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaAcionamentos[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeAcionamentos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeAcionamentos[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaPeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaPeriodos[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebePeriodos(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePeriodos[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaHorarios[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeHorarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeHorarios[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcesso[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeListaAcesso(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaAcesso[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaMsgPadrao(pThreadIndex: Integer; 
                                                   pEstiloPadrao: SMsgEstilo; 
                                                   pEstiloEntrada: SMsgEstilo; 
                                                   pEstiloSaida: SMsgEstilo; 
                                                   const pMsgPadraoLinha1: WideString; 
                                                   const pMsgPadraoLinha2: WideString; 
                                                   const pMsgEntradaLinha1: WideString; 
                                                   const pMsgEntradaLinha2: WideString; 
                                                   const pMsgSaidaLinha1: WideString; 
                                                   const pMsgSaidaLinha2: WideString; 
                                                   pTempoPadrao: Byte; pTempoEntrada: Byte; 
                                                   pTempoSaida: Byte): WordBool;
begin
    Result := DefaultInterface.EnviaMsgPadrao[pThreadIndex, pEstiloPadrao, pEstiloEntrada, 
                                              pEstiloSaida, pMsgPadraoLinha1, pMsgPadraoLinha2, 
                                              pMsgEntradaLinha1, pMsgEntradaLinha2, 
                                              pMsgSaidaLinha1, pMsgSaidaLinha2, pTempoPadrao, 
                                              pTempoEntrada, pTempoSaida];
end;

function TAlternativoProperties.Get_EnviaMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaMsgsEspecificas[pThreadIndex];
end;

function TAlternativoProperties.Get_RecebeMsgsEspecificas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeMsgsEspecificas[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaParticionamento(pThreadIndex: Integer; pFuncoes: Integer; 
                                                         pFeriados: Integer; 
                                                         pAcionamentos: Integer; 
                                                         pListaAcesso: Integer; pPeriodos: Integer; 
                                                         pHorarios: Integer; 
                                                         pMsgEspecifica: Integer; 
                                                         pRegistros: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaParticionamento[pThreadIndex, pFuncoes, pFeriados, 
                                                    pAcionamentos, pListaAcesso, pPeriodos, 
                                                    pHorarios, pMsgEspecifica, pRegistros];
end;

function TAlternativoProperties.Get_Versao: WideString;
begin
    Result := DefaultInterface.Versao;
end;

function TAlternativoProperties.Get_RemoveCard(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RemoveCard[pThreadIndex];
end;

function TAlternativoProperties.Get_Bio_UsuariosQuant(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.Bio_UsuariosQuant[pThreadIndex];
end;

function TAlternativoProperties.Get_Bio_UsuarioExiste(pThreadIndex: Integer; 
                                                      const pUsuarioID: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_UsuarioExiste[pThreadIndex, pUsuarioID];
end;

function TAlternativoProperties.Get_Bio_RecListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_RecListaUsuarios[pThreadIndex];
end;

function TAlternativoProperties.Get_Bio_RecTemplate(pThreadIndex: Integer; 
                                                    const pUsuarioID: WideString): WideString;
begin
    Result := DefaultInterface.Bio_RecTemplate[pThreadIndex, pUsuarioID];
end;

function TAlternativoProperties.Get_Bio_EnvTemplate(pThreadIndex: Integer; 
                                                    const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_EnvTemplate[pThreadIndex, pTemplate];
end;

function TAlternativoProperties.Get_Bio_DelTemplate(pThreadIndex: Integer; 
                                                    const pUsuarioID: WideString; 
                                                    pFingerOnly: WordBool): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplate[pThreadIndex, pUsuarioID, pFingerOnly];
end;

function TAlternativoProperties.Get_Bio_DelTemplateTodas(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.Bio_DelTemplateTodas[pThreadIndex];
end;

function TAlternativoProperties.Get_Bio_GeraUserID(pBiometria: SBiometria; 
                                                   const pMatricula: WideString; pDedo: Byte; 
                                                   pMaster: WordBool): WideString;
begin
    Result := DefaultInterface.Bio_GeraUserID[pBiometria, pMatricula, pDedo, pMaster];
end;

function TAlternativoProperties.Get_Bio_GetMaxQuantList(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.Bio_GetMaxQuantList[pThreadIndex];
end;

function TAlternativoProperties.Get_Bio_UsuariosQuantLivre(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.Bio_UsuariosQuantLivre[pThreadIndex];
end;

function TAlternativoProperties.Get_DetectarVelocidade(pThreadIndex: Integer): SVelocidade;
begin
    Result := DefaultInterface.DetectarVelocidade[pThreadIndex];
end;

function TAlternativoProperties.Get_NumDigitosValidos: Byte;
begin
    Result := DefaultInterface.NumDigitosValidos;
end;

function TAlternativoProperties.Get_NumDigitosPadraoT: Byte;
begin
    Result := DefaultInterface.NumDigitosPadraoT;
end;

function TAlternativoProperties.Get_MoreRecentFirmware: WideString;
begin
    Result := DefaultInterface.MoreRecentFirmware;
end;

function TAlternativoProperties.Get_RaiseExceptions: WordBool;
begin
    Result := DefaultInterface.RaiseExceptions;
end;

procedure TAlternativoProperties.Set_RaiseExceptions(Value: WordBool);
begin
  DefaultInterface.Set_RaiseExceptions(Value);
end;

function TAlternativoProperties.Get_QuantRegsColetados(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.QuantRegsColetados[pThreadIndex];
end;

function TAlternativoProperties.Get_KernelLastError: Integer;
begin
    Result := DefaultInterface.KernelLastError;
end;

function TAlternativoProperties.Get_RecebePacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebePacote[pThreadIndex];
end;

function TAlternativoProperties.Get_ApagaUltimoPacote(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.ApagaUltimoPacote[pThreadIndex];
end;

function TAlternativoProperties.Get_TamanhoRegistro: Integer;
begin
    Result := DefaultInterface.TamanhoRegistro;
end;

function TAlternativoProperties.Get_TamanhoItemAcesso: Integer;
begin
    Result := DefaultInterface.TamanhoItemAcesso;
end;

function TAlternativoProperties.Get_SRFuncoes(pQtFuncoes: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoes[pQtFuncoes];
end;

function TAlternativoProperties.Get_SRFeriados(pQtFeriados: Integer): Integer;
begin
    Result := DefaultInterface.SRFeriados[pQtFeriados];
end;

function TAlternativoProperties.Get_SRAcionamentos(pQtAcionamentos: Integer): Integer;
begin
    Result := DefaultInterface.SRAcionamentos[pQtAcionamentos];
end;

function TAlternativoProperties.Get_SRListaAcesso(pQtItens: Integer): Integer;
begin
    Result := DefaultInterface.SRListaAcesso[pQtItens];
end;

function TAlternativoProperties.Get_SRPeriodos(pQtPeriodos: Integer): Integer;
begin
    Result := DefaultInterface.SRPeriodos[pQtPeriodos];
end;

function TAlternativoProperties.Get_SRHorariosEscalas(pQtHorarios: Integer; 
                                                      pQtPeriodosPorHorario: Integer; 
                                                      pQtEscalas: Integer; 
                                                      pQtHorariosPorEscala: Integer): Integer;
begin
    Result := DefaultInterface.SRHorariosEscalas[pQtHorarios, pQtPeriodosPorHorario, pQtEscalas, 
                                                 pQtHorariosPorEscala];
end;

function TAlternativoProperties.Get_SRMsgEspecifica(pQtMsgs: Integer; pQtMatriculasPorMsg: Integer): Integer;
begin
    Result := DefaultInterface.SRMsgEspecifica[pQtMsgs, pQtMatriculasPorMsg];
end;

function TAlternativoProperties.Get_SRFuncoesEspecificas(pQtMatriculas: Integer; 
                                                         pQtFuncoesPorMatricula: Integer): Integer;
begin
    Result := DefaultInterface.SRFuncoesEspecificas[pQtMatriculas, pQtFuncoesPorMatricula];
end;

function TAlternativoProperties.Get_SetorPercentual(pFuncoes: Integer; pFeriados: Integer; 
                                                    pAcionamentos: Integer; pLista: Integer; 
                                                    pPeriodos: Integer; pHorarios: Integer; 
                                                    pMsgEspecifica: Integer; pRegistros: Integer; 
                                                    pSetor: SParticao): Double;
begin
    Result := DefaultInterface.SetorPercentual[pFuncoes, pFeriados, pAcionamentos, pLista, 
                                               pPeriodos, pHorarios, pMsgEspecifica, pRegistros, 
                                               pSetor];
end;

function TAlternativoProperties.Get_AdicionaCardTcpIp(const pIp: WideString; 
                                                      const pMac: WideString; pPorta: Integer; 
                                                      pCatraca: WordBool; 
                                                      pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardTcpIp[pIp, pMac, pPorta, pCatraca, pModoComunicacao];
end;

function TAlternativoProperties.Get_RecebeQtRegistros(pThreadIndex: Integer): Integer;
begin
    Result := DefaultInterface.RecebeQtRegistros[pThreadIndex];
end;

function TAlternativoProperties.Get_DigitosRange(pPlaca: SPlacaCard; pMinimo: WordBool): Integer;
begin
    Result := DefaultInterface.DigitosRange[pPlaca, pMinimo];
end;

function TAlternativoProperties.Get_Bio_CarregaTemplate(const pTemplate: WideString): WordBool;
begin
    Result := DefaultInterface.Bio_CarregaTemplate[pTemplate];
end;

function TAlternativoProperties.Get_Bio_ProcuraTemplate(const pMatricula: WideString; 
                                                        const pTemplate: WideString): WideString;
begin
    Result := DefaultInterface.Bio_ProcuraTemplate[pMatricula, pTemplate];
end;

function TAlternativoProperties.Get_EnviaConfigDSP(pThreadIndex: Integer; pNivelSeguranca: Integer; 
                                                   pVelocidade: Integer; pSensibilidade: Integer; 
                                                   pQualidadeImagem: Integer; 
                                                   pCondicaoIluminacao: WordBool): WordBool;
begin
    Result := DefaultInterface.EnviaConfigDSP[pThreadIndex, pNivelSeguranca, pVelocidade, 
                                              pSensibilidade, pQualidadeImagem, pCondicaoIluminacao];
end;

function TAlternativoProperties.Get_AdicionaCardGPRS(pCatraca: WordBool; pPorta: Integer; 
                                                     pModoComunicacao: SModoComunicacao): Integer;
begin
    Result := DefaultInterface.AdicionaCardGPRS[pCatraca, pPorta, pModoComunicacao];
end;

function TAlternativoProperties.Get_RecebeMsgPadraoB(pThreadIndex: Integer; 
                                                     out pEstiloPadrao: SMsgEstilo; 
                                                     out pEstiloEntrada: SMsgEstilo; 
                                                     out pEstiloSaida: SMsgEstilo; 
                                                     out pMsgPadraoLinha1: WideString; 
                                                     out pMsgPadraoLinha2: WideString; 
                                                     out pMsgEntradaLinha1: WideString; 
                                                     out pMsgEntradaLinha2: WideString; 
                                                     out pMsgSaidaLinha1: WideString; 
                                                     out pMsgSaidaLinha2: WideString; 
                                                     out pTempoPadrao: Byte; 
                                                     out pTempoEntrada: Byte; out pTempoSaida: Byte): WordBool;
begin
    Result := DefaultInterface.RecebeMsgPadraoB[pThreadIndex, pEstiloPadrao, pEstiloEntrada, 
                                                pEstiloSaida, pMsgPadraoLinha1, pMsgPadraoLinha2, 
                                                pMsgEntradaLinha1, pMsgEntradaLinha2, 
                                                pMsgSaidaLinha1, pMsgSaidaLinha2, pTempoPadrao, 
                                                pTempoEntrada, pTempoSaida];
end;

function TAlternativoProperties.Get_SetorPercentualEx(pFuncoes: Integer; pFeriados: Integer; 
                                                      pAcionamentos: Integer; pLista: Integer; 
                                                      pPeriodos: Integer; pHorarios: Integer; 
                                                      pMsgEspec: Integer; pRegistros: Integer; 
                                                      pSetor: SParticao; pExpansao: SExpansao): Double;
begin
    Result := DefaultInterface.SetorPercentualEx[pFuncoes, pFeriados, pAcionamentos, pLista, 
                                                 pPeriodos, pHorarios, pMsgEspec, pRegistros, 
                                                 pSetor, pExpansao];
end;

function TAlternativoProperties.Get_MostRecentFirmware(pPlacaCard: SPlacaCard; pOrion: WordBool): WideString;
begin
    Result := DefaultInterface.MostRecentFirmware[pPlacaCard, pOrion];
end;

function TAlternativoProperties.Get_EnviaConfiguracaoControlador(pThreadIndex: Integer; 
                                                                 pIDControlador: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaConfiguracaoControlador[pThreadIndex, pIDControlador];
end;

function TAlternativoProperties.Get_RecebeConfiguracaoControlador(pThreadIndex: Integer; 
                                                                  pIDControlador: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeConfiguracaoControlador[pThreadIndex, pIDControlador];
end;

function TAlternativoProperties.Get_EnviaDadosEmpregador(pThreadIndex: Integer; 
                                                         const pRazaoSocial: WideString; 
                                                         const pLocal: WideString; 
                                                         const pDocumento: WideString; 
                                                         const pCEI: WideString; 
                                                         pIdEmpregador: SIdEmpregador): WordBool;
begin
    Result := DefaultInterface.EnviaDadosEmpregador[pThreadIndex, pRazaoSocial, pLocal, pDocumento, 
                                                    pCEI, pIdEmpregador];
end;

function TAlternativoProperties.Get_EnviaUsuarioEquipamento(pThreadIndex: Integer; 
                                                            const pMatriculas: WideString; 
                                                            const pPIS: WideString; 
                                                            const pNome: WideString; 
                                                            pVerificaDigital: WordBool; 
                                                            pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.EnviaUsuarioEquipamento[pThreadIndex, pMatriculas, pPIS, pNome, 
                                                       pVerificaDigital, pTipoOperacao];
end;

function TAlternativoProperties.Get_RecebeListaUsuarioEquipamento(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.RecebeListaUsuarioEquipamento[pThreadIndex];
end;

function TAlternativoProperties.Get_ColetaEventos(pThreadIndex: Integer; const pPathAFD: WideString): WordBool;
begin
    Result := DefaultInterface.ColetaEventos[pThreadIndex, pPathAFD];
end;

function TAlternativoProperties.Get_ColetaEventosEx(pThreadIndex: Integer; 
                                                    const pPathAFD: WideString; pData: TDateTime; 
                                                    const pRazaoSocial: WideString; 
                                                    const pLocal: WideString; 
                                                    const pDocumento: WideString; 
                                                    const pCEI: WideString; 
                                                    pIdEmpregador: SIdEmpregador): WordBool;
begin
    Result := DefaultInterface.ColetaEventosEx[pThreadIndex, pPathAFD, pData, pRazaoSocial, pLocal, 
                                               pDocumento, pCEI, pIdEmpregador];
end;

function TAlternativoProperties.Get_EnviaListaAcessoThd(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaAcessoThd[pThreadIndex];
end;

function TAlternativoProperties.Get_EnviaListaUsuarios(pThreadIndex: Integer): WordBool;
begin
    Result := DefaultInterface.EnviaListaUsuarios[pThreadIndex];
end;

function TAlternativoProperties.Get_Add_UsuarioEquipamento(pThreadIndex: Integer; 
                                                           const pMatriculas: WideString; 
                                                           const pPIS: WideString; 
                                                           const pNome: WideString; 
                                                           pVerificaDigital: WordBool; 
                                                           pTipoOperacao: SOperacaoUsuarioEquipamento): WordBool;
begin
    Result := DefaultInterface.Add_UsuarioEquipamento[pThreadIndex, pMatriculas, pPIS, pNome, 
                                                      pVerificaDigital, pTipoOperacao];
end;

function TAlternativoProperties.Get_DataHoraUltimaComunicacao(pThreadIndex: Integer; 
                                                              out pLastCommDateTime: Double): WordBool;
begin
    Result := DefaultInterface.DataHoraUltimaComunicacao[pThreadIndex, pLastCommDateTime];
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TKernel, THamster, TAlternativo]);
end;

end.
