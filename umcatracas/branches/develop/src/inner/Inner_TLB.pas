unit Inner_TLB;

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
// File generated on 31/01/2018 14:49:14 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\SysWOW64\Inner.tlb (1)
// LIBID: {4D551F59-7F4C-4738-A757-B7CCA2485816}
// LCID: 0
// Helpfile: 
// HelpString: Inner
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.0 mscorlib, (C:\Windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TRespostaInner) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TEvento) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBilheteOnline) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBilheteOfflinePadraoLivre) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TCollection) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTransmissao) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TConstante) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TInnerClient) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTipoDados) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TRecepcao) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBilheteOfflinePadraoTopdata) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TInnerClientConexao) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TBlockingInterface) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTratadorDeDados) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTipoAck) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TEventoAck) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TPronto) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TPacoteTCPCliente) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTipoLongAck) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TCollectionClients) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TAguardandoDefinicao) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TCollectionClient) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TInnerListener) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TCriado) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TInnerInterface) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TEquipamento) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TAssincronaInterface) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TObservarLog) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TTipoNack) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TUtils) : Server mscoree.dll contains no icons
//   Error creating palette bitmap of (TConfiguracoes) : Server mscoree.dll contains no icons
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

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  InnerMajorVersion = 1;
  InnerMinorVersion = 0;

  LIBID_Inner: TGUID = '{4D551F59-7F4C-4738-A757-B7CCA2485816}';

  IID__TipoRespostaAbstract: TGUID = '{ECDEB1FD-F420-395E-98AB-33DBFA4431D0}';
  IID__RespostaInner: TGUID = '{4BC755E2-8AEF-364D-90B9-3D92159E2C11}';
  IID_IBlockingInterface: TGUID = '{39D70C8A-475B-4591-94B7-0A012C86739D}';
  IID__Evento: TGUID = '{AABE11FA-E91D-3565-A39D-16650680F844}';
  IID__Disconnected: TGUID = '{81E54BBD-C66A-36F7-AC6E-9F8CB0DD36C1}';
  IID__BilhetesAbstract: TGUID = '{E7DB3024-35EE-304F-9F08-979F3D8745B8}';
  IID__BilheteOnline: TGUID = '{4CB2556E-91EA-3A30-BCC0-3CD57F25626B}';
  IID__BilheteOfflinePadraoLivre: TGUID = '{DCED206C-7F2A-307E-9FA5-F622F5A17963}';
  IID__Collection: TGUID = '{C6FF684B-A39F-3202-AEB3-AA845328EC71}';
  DIID_IEventos: TGUID = '{1A585C4D-3371-48DC-AF8A-AFFECC1B0967}';
  IID__EstadoClienteAbstract: TGUID = '{D6274D9C-C89A-39F6-AC82-EF4072DCED5A}';
  IID__Transmissao: TGUID = '{BB8A7146-FC38-3EF8-9F54-B5393E5C227B}';
  IID__Constante: TGUID = '{D9493F50-6101-37D1-B369-B4062DFC7243}';
  IID__Ticket: TGUID = '{03AE9D29-2C4A-346E-9816-ED30E9F54CD1}';
  IID__InnerClient: TGUID = '{91C89757-FB68-3EFC-BA00-3FEEC922E797}';
  IID__TipoDados: TGUID = '{BEB54F5D-E239-3FAC-8DE2-FAF226846022}';
  IID__Recepcao: TGUID = '{2FA807FC-33D4-3E6D-AE5A-F1B35976ACDB}';
  IID__Ack: TGUID = '{CDBEC7ED-5EBA-37BF-B57E-783E20409129}';
  IID__BilheteOfflinePadraoTopdata: TGUID = '{580B05A8-E906-3359-BE29-2DE4AE9F66EC}';
  IID__Connected: TGUID = '{F6944E53-2CD8-3284-9817-6A1A76D846EA}';
  IID__InnerClientConexao: TGUID = '{DF9BB9AF-6918-3091-851B-3711F6D8A50B}';
  CLASS_BlockingInterface: TGUID = '{C8267A2B-62C7-35BC-9E77-AE536387386A}';
  IID_IObservarLog: TGUID = '{13A2314F-41E6-30AC-B434-04086B0BCE86}';
  IID__TratadorDeDados: TGUID = '{8A6DC707-582C-3BBD-A11B-C07F4A40E8A6}';
  IID__TipoAck: TGUID = '{7461CD76-2BD6-3881-9B8B-E670A8959C43}';
  IID__EventoAck: TGUID = '{6408C966-D774-3FFA-83F7-6B314FBF502E}';
  IID__Nack: TGUID = '{8236AA95-056F-325D-91D3-D165A4E91CDA}';
  IID__Pronto: TGUID = '{2AE7685E-B061-3FA9-8522-89EF064D7C92}';
  IID__PacoteTCPCliente: TGUID = '{FCB74C73-D790-3F87-AFE4-F495233D1D89}';
  IID__TipoLongAck: TGUID = '{D3988AD8-254C-35CA-9C14-A25F0F710BF7}';
  IID__CollectionClients: TGUID = '{A364FF67-A2A4-32C8-BE0D-E4266B2E08B5}';
  IID__Log: TGUID = '{F68DAD1D-D20C-376E-B317-6B68B28A75A5}';
  IID__AguardandoDefinicao: TGUID = '{6F9AC085-2F66-3833-A5A3-24A1F62A72FA}';
  IID_IInner: TGUID = '{30D70C8C-475B-4591-94B7-0A012C86739D}';
  IID__CollectionClient: TGUID = '{9680DF65-AB35-3924-B37A-B30A3DAB15F1}';
  IID__Data: TGUID = '{EE57A4F9-10A9-381F-BF1C-8BC4E563D440}';
  IID__TimeoutInner: TGUID = '{B065EBF0-9884-3B07-B88A-2AA8D5C18306}';
  IID__InnerListener: TGUID = '{6C4BF5ED-4455-37D3-BCCD-5E0E57812353}';
  IID__Criado: TGUID = '{7F6A6779-D999-34B8-8CA7-2F8250FBB996}';
  CLASS_InnerInterface: TGUID = '{314211FA-B26F-38CA-A1BB-6613269998E6}';
  IID__DelAck: TGUID = '{86075D4C-243C-3C10-B41F-D024364187CB}';
  IID__DelConnected: TGUID = '{758209C4-E676-323D-BD8F-EAE56D82C167}';
  IID__DelData: TGUID = '{C323E428-7C94-368E-96F4-7C94ADBBB1D4}';
  IID__DelTicket: TGUID = '{A9101151-CF58-35BA-8DDE-C55F364A8DD3}';
  IID__DelDisconnected: TGUID = '{16D87116-B345-34CC-8096-579A809C400A}';
  IID__DelNack: TGUID = '{3023FBCE-AFF3-3A32-8F22-2968D7A9405E}';
  IID__DelTimeout: TGUID = '{71050A46-CB2C-38E5-A2FF-80629B157521}';
  IID__DelTicketJava: TGUID = '{14E45AF4-36EC-3B66-B8B5-6C7F05D8CF3B}';
  IID__DelDataJava: TGUID = '{BDDE3FAD-FDD0-39ED-980B-940D94D6DE11}';
  IID__Equipamento: TGUID = '{0CF35E24-2732-3283-A725-B4856A6E0C83}';
  IID__AssincronaInterface: TGUID = '{14372D76-9557-3370-9955-F46B5DA3F860}';
  IID__ObservarLog: TGUID = '{2F0080B4-2BAD-3322-BC64-9AF7B632D647}';
  IID__TipoNack: TGUID = '{96D4E1AA-4857-3BD1-9493-E27ADDEC07F3}';
  IID__Utils: TGUID = '{744017E0-A793-377D-9FBD-06A134644126}';
  IID__Configuracoes: TGUID = '{633E9DE2-8A3B-328A-940F-980751C40372}';
  CLASS_TipoRespostaAbstract: TGUID = '{FD986DA9-7293-312E-8BA7-4D53DD54D647}';
  CLASS_RespostaInner: TGUID = '{55E19990-0D8E-3892-BE73-43B41903496E}';
  CLASS_Evento: TGUID = '{8EC43371-7C1A-3423-91A0-2FE8F85C380E}';
  CLASS_Disconnected: TGUID = '{26E061A1-2E5B-3427-AC17-596B8AD9EAC7}';
  CLASS_BilhetesAbstract: TGUID = '{47003D78-5E0E-3ED8-84CC-CDC6F65150AD}';
  CLASS_BilheteOnline: TGUID = '{ADFAABA0-144C-3BBF-987C-28E3D3E5F89A}';
  CLASS_BilheteOfflinePadraoLivre: TGUID = '{1741B23C-581E-3D30-85C9-6129FB2225BD}';
  CLASS_Collection: TGUID = '{820208F0-F1D9-3DEE-922C-94DC748DAD48}';
  CLASS_EstadoClienteAbstract: TGUID = '{B0F47277-946A-3748-9AAF-5807954D5782}';
  CLASS_Transmissao: TGUID = '{E0E3EED6-8176-3801-B4F3-D3241FDC507E}';
  CLASS_Constante: TGUID = '{0C3435AB-2D60-3036-A75A-B81C59D456F2}';
  CLASS_Ticket: TGUID = '{AAB9002C-F27D-3B4D-B13F-52F50761F51C}';
  CLASS_InnerClient: TGUID = '{80934EF1-9FBE-32B2-9322-E83B7A6ABDBA}';
  CLASS_TipoDados: TGUID = '{D6E991AE-E905-3A2C-B56C-08D524595687}';
  CLASS_Recepcao: TGUID = '{C7DF062E-87A3-3FAE-BB95-7BF0CAF1DBA3}';
  CLASS_Ack: TGUID = '{6BFFA27B-BD9E-3720-9C07-9F005E0D05C1}';
  CLASS_BilheteOfflinePadraoTopdata: TGUID = '{9600E33C-1662-3893-A367-AAE6558D38A1}';
  CLASS_Connected: TGUID = '{7CB474AB-10E0-3E1C-B3A7-8F2528EFA7D7}';
  CLASS_InnerClientConexao: TGUID = '{3DE7DA6A-048C-3B23-B77F-9FE9EB46C4B4}';
  CLASS_TratadorDeDados: TGUID = '{603B451E-6BD1-3ACA-87B0-7EE3141BF9CD}';
  CLASS_TipoAck: TGUID = '{FDA3A8D5-B5F7-3F63-8F24-53B08358EA9E}';
  CLASS_EventoAck: TGUID = '{19FDDACD-E5C4-3410-BA3B-DBBBBE861D5E}';
  CLASS_Nack: TGUID = '{9E57C3AF-7C8E-3C39-ACD8-7A192A073B10}';
  CLASS_Pronto: TGUID = '{BB69F368-0583-35B8-926B-C49CBC2C8A82}';
  CLASS_PacoteTCPCliente: TGUID = '{3941828F-DE7E-3E8C-8ABA-DD234064C0BA}';
  CLASS_TipoLongAck: TGUID = '{F9579A9B-982B-3CC7-985E-2473112F2CEA}';
  CLASS_CollectionClients: TGUID = '{5F551603-8756-332F-A4A0-2B7AA1FB7ABE}';
  CLASS_Log: TGUID = '{F7E88C54-B71B-3B14-9C8B-FD5098FA564C}';
  CLASS_AguardandoDefinicao: TGUID = '{2E65D52F-B288-3CE7-A6FF-0FBE61C451BD}';
  CLASS_CollectionClient: TGUID = '{8FA73CE3-ABA3-3AEC-9CAF-E4F9D365B18B}';
  CLASS_Data: TGUID = '{931B46D5-053D-30C0-8144-5435DAFC772D}';
  CLASS_TimeoutInner: TGUID = '{2321BCA8-9EA3-3FFE-AFE7-5F13684FE372}';
  CLASS_InnerListener: TGUID = '{EE1E6D9E-503F-3937-A1C9-EA3272CE9D3B}';
  CLASS_Criado: TGUID = '{48BB3B0C-3D68-3D35-A03F-0E54E1EBB1B3}';
  CLASS_DelAck: TGUID = '{07A4C86F-D23A-3EAF-AA8D-BC4D5D93B4CB}';
  CLASS_DelConnected: TGUID = '{B28D7DB2-A5DF-3B1F-8576-987F403A3635}';
  CLASS_DelData: TGUID = '{AC875125-984F-36D0-9C15-2F6936F69455}';
  CLASS_DelTicket: TGUID = '{93E0F528-53C4-3F46-B8CF-D84FC11EA8DB}';
  CLASS_DelDisconnected: TGUID = '{651B883F-8CB6-35C3-9299-0BE655A86357}';
  CLASS_DelNack: TGUID = '{3FF365A6-2E73-3BBE-ACF9-82273461F04B}';
  CLASS_DelTimeout: TGUID = '{4FE326C5-943F-3481-8F83-173962A957C5}';
  CLASS_DelTicketJava: TGUID = '{B1732F15-B42C-300D-BD31-D483574170F7}';
  CLASS_DelDataJava: TGUID = '{04B6A43E-64C0-30E7-98DD-88381D7BE787}';
  CLASS_Equipamento: TGUID = '{C76F03EB-91C1-36BC-A4DD-ACA31921005D}';
  CLASS_AssincronaInterface: TGUID = '{2A4528AD-04DA-38F8-9398-FE34D29EC96A}';
  CLASS_ObservarLog: TGUID = '{739C051D-AC1C-3DE2-B766-DB2935AB5569}';
  CLASS_TipoNack: TGUID = '{5C71BAED-6798-317B-AF46-78CB6ED188A9}';
  CLASS_Utils: TGUID = '{D755D366-50B2-38CD-B5A9-355244DF96D0}';
  CLASS_Configuracoes: TGUID = '{EDEE2617-A7E8-37BD-9636-9D25D833CFEC}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum Respostas
type
  Respostas = TOleEnum;
const
  Respostas_ACK = $00000000;
  Respostas_NACK = $00000001;
  Respostas_Timeout = $00000002;
  Respostas_Data = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _TipoRespostaAbstract = interface;
  _TipoRespostaAbstractDisp = dispinterface;
  _RespostaInner = interface;
  _RespostaInnerDisp = dispinterface;
  IBlockingInterface = interface;
  IBlockingInterfaceDisp = dispinterface;
  _Evento = interface;
  _EventoDisp = dispinterface;
  _Disconnected = interface;
  _DisconnectedDisp = dispinterface;
  _BilhetesAbstract = interface;
  _BilhetesAbstractDisp = dispinterface;
  _BilheteOnline = interface;
  _BilheteOnlineDisp = dispinterface;
  _BilheteOfflinePadraoLivre = interface;
  _BilheteOfflinePadraoLivreDisp = dispinterface;
  _Collection = interface;
  _CollectionDisp = dispinterface;
  IEventos = dispinterface;
  _EstadoClienteAbstract = interface;
  _EstadoClienteAbstractDisp = dispinterface;
  _Transmissao = interface;
  _TransmissaoDisp = dispinterface;
  _Constante = interface;
  _ConstanteDisp = dispinterface;
  _Ticket = interface;
  _TicketDisp = dispinterface;
  _InnerClient = interface;
  _InnerClientDisp = dispinterface;
  _TipoDados = interface;
  _TipoDadosDisp = dispinterface;
  _Recepcao = interface;
  _RecepcaoDisp = dispinterface;
  _Ack = interface;
  _AckDisp = dispinterface;
  _BilheteOfflinePadraoTopdata = interface;
  _BilheteOfflinePadraoTopdataDisp = dispinterface;
  _Connected = interface;
  _ConnectedDisp = dispinterface;
  _InnerClientConexao = interface;
  _InnerClientConexaoDisp = dispinterface;
  IObservarLog = interface;
  IObservarLogDisp = dispinterface;
  _TratadorDeDados = interface;
  _TratadorDeDadosDisp = dispinterface;
  _TipoAck = interface;
  _TipoAckDisp = dispinterface;
  _EventoAck = interface;
  _EventoAckDisp = dispinterface;
  _Nack = interface;
  _NackDisp = dispinterface;
  _Pronto = interface;
  _ProntoDisp = dispinterface;
  _PacoteTCPCliente = interface;
  _PacoteTCPClienteDisp = dispinterface;
  _TipoLongAck = interface;
  _TipoLongAckDisp = dispinterface;
  _CollectionClients = interface;
  _CollectionClientsDisp = dispinterface;
  _Log = interface;
  _LogDisp = dispinterface;
  _AguardandoDefinicao = interface;
  _AguardandoDefinicaoDisp = dispinterface;
  IInner = interface;
  IInnerDisp = dispinterface;
  _CollectionClient = interface;
  _CollectionClientDisp = dispinterface;
  _Data = interface;
  _DataDisp = dispinterface;
  _TimeoutInner = interface;
  _TimeoutInnerDisp = dispinterface;
  _InnerListener = interface;
  _InnerListenerDisp = dispinterface;
  _Criado = interface;
  _CriadoDisp = dispinterface;
  _DelAck = interface;
  _DelAckDisp = dispinterface;
  _DelConnected = interface;
  _DelConnectedDisp = dispinterface;
  _DelData = interface;
  _DelDataDisp = dispinterface;
  _DelTicket = interface;
  _DelTicketDisp = dispinterface;
  _DelDisconnected = interface;
  _DelDisconnectedDisp = dispinterface;
  _DelNack = interface;
  _DelNackDisp = dispinterface;
  _DelTimeout = interface;
  _DelTimeoutDisp = dispinterface;
  _DelTicketJava = interface;
  _DelTicketJavaDisp = dispinterface;
  _DelDataJava = interface;
  _DelDataJavaDisp = dispinterface;
  _Equipamento = interface;
  _EquipamentoDisp = dispinterface;
  _AssincronaInterface = interface;
  _AssincronaInterfaceDisp = dispinterface;
  _ObservarLog = interface;
  _ObservarLogDisp = dispinterface;
  _TipoNack = interface;
  _TipoNackDisp = dispinterface;
  _Utils = interface;
  _UtilsDisp = dispinterface;
  _Configuracoes = interface;
  _ConfiguracoesDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BlockingInterface = IBlockingInterface;
  InnerInterface = IInner;
  TipoRespostaAbstract = _TipoRespostaAbstract;
  RespostaInner = _RespostaInner;
  Evento = _Evento;
  Disconnected = _Disconnected;
  BilhetesAbstract = _BilhetesAbstract;
  BilheteOnline = _BilheteOnline;
  BilheteOfflinePadraoLivre = _BilheteOfflinePadraoLivre;
  Collection = _Collection;
  EstadoClienteAbstract = _EstadoClienteAbstract;
  Transmissao = _Transmissao;
  Constante = _Constante;
  Ticket = _Ticket;
  InnerClient = _InnerClient;
  TipoDados = _TipoDados;
  Recepcao = _Recepcao;
  Ack = _Ack;
  BilheteOfflinePadraoTopdata = _BilheteOfflinePadraoTopdata;
  Connected = _Connected;
  InnerClientConexao = _InnerClientConexao;
  TratadorDeDados = _TratadorDeDados;
  TipoAck = _TipoAck;
  EventoAck = _EventoAck;
  Nack = _Nack;
  Pronto = _Pronto;
  PacoteTCPCliente = _PacoteTCPCliente;
  TipoLongAck = _TipoLongAck;
  CollectionClients = _CollectionClients;
  Log = _Log;
  AguardandoDefinicao = _AguardandoDefinicao;
  CollectionClient = _CollectionClient;
  Data = _Data;
  TimeoutInner = _TimeoutInner;
  InnerListener = _InnerListener;
  Criado = _Criado;
  DelAck = _DelAck;
  DelConnected = _DelConnected;
  DelData = _DelData;
  DelTicket = _DelTicket;
  DelDisconnected = _DelDisconnected;
  DelNack = _DelNack;
  DelTimeout = _DelTimeout;
  DelTicketJava = _DelTicketJava;
  DelDataJava = _DelDataJava;
  Equipamento = _Equipamento;
  AssincronaInterface = _AssincronaInterface;
  ObservarLog = _ObservarLog;
  TipoNack = _TipoNack;
  Utils = _Utils;
  Configuracoes = _Configuracoes;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}
  PInteger1 = ^Integer; {*}
  PByte1 = ^Byte; {*}
  PWideString1 = ^WideString; {*}


// *********************************************************************//
// Interface: _TipoRespostaAbstract
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {ECDEB1FD-F420-395E-98AB-33DBFA4431D0}
// *********************************************************************//
  _TipoRespostaAbstract = interface(IDispatch)
    ['{ECDEB1FD-F420-395E-98AB-33DBFA4431D0}']
  end;

// *********************************************************************//
// DispIntf:  _TipoRespostaAbstractDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {ECDEB1FD-F420-395E-98AB-33DBFA4431D0}
// *********************************************************************//
  _TipoRespostaAbstractDisp = dispinterface
    ['{ECDEB1FD-F420-395E-98AB-33DBFA4431D0}']
  end;

// *********************************************************************//
// Interface: _RespostaInner
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4BC755E2-8AEF-364D-90B9-3D92159E2C11}
// *********************************************************************//
  _RespostaInner = interface(IDispatch)
    ['{4BC755E2-8AEF-364D-90B9-3D92159E2C11}']
  end;

// *********************************************************************//
// DispIntf:  _RespostaInnerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4BC755E2-8AEF-364D-90B9-3D92159E2C11}
// *********************************************************************//
  _RespostaInnerDisp = dispinterface
    ['{4BC755E2-8AEF-364D-90B9-3D92159E2C11}']
  end;

// *********************************************************************//
// Interface: IBlockingInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {39D70C8A-475B-4591-94B7-0A012C86739D}
// *********************************************************************//
  IBlockingInterface = interface(IDispatch)
    ['{39D70C8A-475B-4591-94B7-0A012C86739D}']
    function InitComm(porta: Integer): WordBool; safecall;
    function FinishComm: WordBool; safecall;
    function ReceiveDataNoResponse(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                                   tamanhoResposta: Integer): WordBool; safecall;
    function SendData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                      numeroPacote: Byte): WordBool; safecall;
    function SendResponse(numeroInner: Integer; reposta: Byte): WordBool; safecall;
    function ReceiveData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                         tamanhoResposta: Integer): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IBlockingInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {39D70C8A-475B-4591-94B7-0A012C86739D}
// *********************************************************************//
  IBlockingInterfaceDisp = dispinterface
    ['{39D70C8A-475B-4591-94B7-0A012C86739D}']
    function InitComm(porta: Integer): WordBool; dispid 1610743808;
    function FinishComm: WordBool; dispid 1610743809;
    function ReceiveDataNoResponse(numeroInner: Integer; comando: Byte; 
                                   var pacote: {??PSafeArray}OleVariant; tamanhoResposta: Integer): WordBool; dispid 1610743810;
    function SendData(numeroInner: Integer; comando: Byte; var pacote: {??PSafeArray}OleVariant; 
                      numeroPacote: Byte): WordBool; dispid 1610743811;
    function SendResponse(numeroInner: Integer; reposta: Byte): WordBool; dispid 1610743812;
    function ReceiveData(numeroInner: Integer; comando: Byte; var pacote: {??PSafeArray}OleVariant; 
                         tamanhoResposta: Integer): WordBool; dispid 1610743813;
  end;

// *********************************************************************//
// Interface: _Evento
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AABE11FA-E91D-3565-A39D-16650680F844}
// *********************************************************************//
  _Evento = interface(IDispatch)
    ['{AABE11FA-E91D-3565-A39D-16650680F844}']
  end;

// *********************************************************************//
// DispIntf:  _EventoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AABE11FA-E91D-3565-A39D-16650680F844}
// *********************************************************************//
  _EventoDisp = dispinterface
    ['{AABE11FA-E91D-3565-A39D-16650680F844}']
  end;

// *********************************************************************//
// Interface: _Disconnected
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {81E54BBD-C66A-36F7-AC6E-9F8CB0DD36C1}
// *********************************************************************//
  _Disconnected = interface(IDispatch)
    ['{81E54BBD-C66A-36F7-AC6E-9F8CB0DD36C1}']
  end;

// *********************************************************************//
// DispIntf:  _DisconnectedDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {81E54BBD-C66A-36F7-AC6E-9F8CB0DD36C1}
// *********************************************************************//
  _DisconnectedDisp = dispinterface
    ['{81E54BBD-C66A-36F7-AC6E-9F8CB0DD36C1}']
  end;

// *********************************************************************//
// Interface: _BilhetesAbstract
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7DB3024-35EE-304F-9F08-979F3D8745B8}
// *********************************************************************//
  _BilhetesAbstract = interface(IDispatch)
    ['{E7DB3024-35EE-304F-9F08-979F3D8745B8}']
  end;

// *********************************************************************//
// DispIntf:  _BilhetesAbstractDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7DB3024-35EE-304F-9F08-979F3D8745B8}
// *********************************************************************//
  _BilhetesAbstractDisp = dispinterface
    ['{E7DB3024-35EE-304F-9F08-979F3D8745B8}']
  end;

// *********************************************************************//
// Interface: _BilheteOnline
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4CB2556E-91EA-3A30-BCC0-3CD57F25626B}
// *********************************************************************//
  _BilheteOnline = interface(IDispatch)
    ['{4CB2556E-91EA-3A30-BCC0-3CD57F25626B}']
  end;

// *********************************************************************//
// DispIntf:  _BilheteOnlineDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4CB2556E-91EA-3A30-BCC0-3CD57F25626B}
// *********************************************************************//
  _BilheteOnlineDisp = dispinterface
    ['{4CB2556E-91EA-3A30-BCC0-3CD57F25626B}']
  end;

// *********************************************************************//
// Interface: _BilheteOfflinePadraoLivre
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DCED206C-7F2A-307E-9FA5-F622F5A17963}
// *********************************************************************//
  _BilheteOfflinePadraoLivre = interface(IDispatch)
    ['{DCED206C-7F2A-307E-9FA5-F622F5A17963}']
  end;

// *********************************************************************//
// DispIntf:  _BilheteOfflinePadraoLivreDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DCED206C-7F2A-307E-9FA5-F622F5A17963}
// *********************************************************************//
  _BilheteOfflinePadraoLivreDisp = dispinterface
    ['{DCED206C-7F2A-307E-9FA5-F622F5A17963}']
  end;

// *********************************************************************//
// Interface: _Collection
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C6FF684B-A39F-3202-AEB3-AA845328EC71}
// *********************************************************************//
  _Collection = interface(IDispatch)
    ['{C6FF684B-A39F-3202-AEB3-AA845328EC71}']
  end;

// *********************************************************************//
// DispIntf:  _CollectionDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C6FF684B-A39F-3202-AEB3-AA845328EC71}
// *********************************************************************//
  _CollectionDisp = dispinterface
    ['{C6FF684B-A39F-3202-AEB3-AA845328EC71}']
  end;

// *********************************************************************//
// DispIntf:  IEventos
// Flags:     (4096) Dispatchable
// GUID:      {1A585C4D-3371-48DC-AF8A-AFFECC1B0967}
// *********************************************************************//
  IEventos = dispinterface
    ['{1A585C4D-3371-48DC-AF8A-AFFECC1B0967}']
    procedure Ack(var numeroInner: Integer; var comando: Byte); dispid 1;
    procedure Connected(var numeroInner: Integer); dispid 2;
    procedure Data(var numeroInner: Integer; var comando: Byte; var pacote: {??PSafeArray}OleVariant); dispid 3;
    procedure Disconnected(var numeroInner: Integer); dispid 4;
    procedure Nack(var numeroInner: Integer; var comando: Byte); dispid 5;
    procedure Ticket(var numeroInner: Integer; var comando: {??PSafeArray}OleVariant; 
                     var enviouAck: WordBool); dispid 6;
    procedure Timeout(var numeroInner: Integer; var comando: Byte); dispid 7;
    procedure TicketJava(var numeroInner: Integer; var comando: WideString; var enviouAck: WordBool); dispid 8;
    procedure DataJava(var numeroInner: Integer; var comando: Byte; var pacote: WideString); dispid 9;
  end;

// *********************************************************************//
// Interface: _EstadoClienteAbstract
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D6274D9C-C89A-39F6-AC82-EF4072DCED5A}
// *********************************************************************//
  _EstadoClienteAbstract = interface(IDispatch)
    ['{D6274D9C-C89A-39F6-AC82-EF4072DCED5A}']
  end;

// *********************************************************************//
// DispIntf:  _EstadoClienteAbstractDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D6274D9C-C89A-39F6-AC82-EF4072DCED5A}
// *********************************************************************//
  _EstadoClienteAbstractDisp = dispinterface
    ['{D6274D9C-C89A-39F6-AC82-EF4072DCED5A}']
  end;

// *********************************************************************//
// Interface: _Transmissao
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BB8A7146-FC38-3EF8-9F54-B5393E5C227B}
// *********************************************************************//
  _Transmissao = interface(IDispatch)
    ['{BB8A7146-FC38-3EF8-9F54-B5393E5C227B}']
  end;

// *********************************************************************//
// DispIntf:  _TransmissaoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BB8A7146-FC38-3EF8-9F54-B5393E5C227B}
// *********************************************************************//
  _TransmissaoDisp = dispinterface
    ['{BB8A7146-FC38-3EF8-9F54-B5393E5C227B}']
  end;

// *********************************************************************//
// Interface: _Constante
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D9493F50-6101-37D1-B369-B4062DFC7243}
// *********************************************************************//
  _Constante = interface(IDispatch)
    ['{D9493F50-6101-37D1-B369-B4062DFC7243}']
  end;

// *********************************************************************//
// DispIntf:  _ConstanteDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D9493F50-6101-37D1-B369-B4062DFC7243}
// *********************************************************************//
  _ConstanteDisp = dispinterface
    ['{D9493F50-6101-37D1-B369-B4062DFC7243}']
  end;

// *********************************************************************//
// Interface: _Ticket
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {03AE9D29-2C4A-346E-9816-ED30E9F54CD1}
// *********************************************************************//
  _Ticket = interface(IDispatch)
    ['{03AE9D29-2C4A-346E-9816-ED30E9F54CD1}']
  end;

// *********************************************************************//
// DispIntf:  _TicketDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {03AE9D29-2C4A-346E-9816-ED30E9F54CD1}
// *********************************************************************//
  _TicketDisp = dispinterface
    ['{03AE9D29-2C4A-346E-9816-ED30E9F54CD1}']
  end;

// *********************************************************************//
// Interface: _InnerClient
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {91C89757-FB68-3EFC-BA00-3FEEC922E797}
// *********************************************************************//
  _InnerClient = interface(IDispatch)
    ['{91C89757-FB68-3EFC-BA00-3FEEC922E797}']
  end;

// *********************************************************************//
// DispIntf:  _InnerClientDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {91C89757-FB68-3EFC-BA00-3FEEC922E797}
// *********************************************************************//
  _InnerClientDisp = dispinterface
    ['{91C89757-FB68-3EFC-BA00-3FEEC922E797}']
  end;

// *********************************************************************//
// Interface: _TipoDados
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BEB54F5D-E239-3FAC-8DE2-FAF226846022}
// *********************************************************************//
  _TipoDados = interface(IDispatch)
    ['{BEB54F5D-E239-3FAC-8DE2-FAF226846022}']
  end;

// *********************************************************************//
// DispIntf:  _TipoDadosDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BEB54F5D-E239-3FAC-8DE2-FAF226846022}
// *********************************************************************//
  _TipoDadosDisp = dispinterface
    ['{BEB54F5D-E239-3FAC-8DE2-FAF226846022}']
  end;

// *********************************************************************//
// Interface: _Recepcao
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2FA807FC-33D4-3E6D-AE5A-F1B35976ACDB}
// *********************************************************************//
  _Recepcao = interface(IDispatch)
    ['{2FA807FC-33D4-3E6D-AE5A-F1B35976ACDB}']
  end;

// *********************************************************************//
// DispIntf:  _RecepcaoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2FA807FC-33D4-3E6D-AE5A-F1B35976ACDB}
// *********************************************************************//
  _RecepcaoDisp = dispinterface
    ['{2FA807FC-33D4-3E6D-AE5A-F1B35976ACDB}']
  end;

// *********************************************************************//
// Interface: _Ack
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {CDBEC7ED-5EBA-37BF-B57E-783E20409129}
// *********************************************************************//
  _Ack = interface(IDispatch)
    ['{CDBEC7ED-5EBA-37BF-B57E-783E20409129}']
  end;

// *********************************************************************//
// DispIntf:  _AckDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {CDBEC7ED-5EBA-37BF-B57E-783E20409129}
// *********************************************************************//
  _AckDisp = dispinterface
    ['{CDBEC7ED-5EBA-37BF-B57E-783E20409129}']
  end;

// *********************************************************************//
// Interface: _BilheteOfflinePadraoTopdata
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {580B05A8-E906-3359-BE29-2DE4AE9F66EC}
// *********************************************************************//
  _BilheteOfflinePadraoTopdata = interface(IDispatch)
    ['{580B05A8-E906-3359-BE29-2DE4AE9F66EC}']
  end;

// *********************************************************************//
// DispIntf:  _BilheteOfflinePadraoTopdataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {580B05A8-E906-3359-BE29-2DE4AE9F66EC}
// *********************************************************************//
  _BilheteOfflinePadraoTopdataDisp = dispinterface
    ['{580B05A8-E906-3359-BE29-2DE4AE9F66EC}']
  end;

// *********************************************************************//
// Interface: _Connected
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F6944E53-2CD8-3284-9817-6A1A76D846EA}
// *********************************************************************//
  _Connected = interface(IDispatch)
    ['{F6944E53-2CD8-3284-9817-6A1A76D846EA}']
  end;

// *********************************************************************//
// DispIntf:  _ConnectedDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F6944E53-2CD8-3284-9817-6A1A76D846EA}
// *********************************************************************//
  _ConnectedDisp = dispinterface
    ['{F6944E53-2CD8-3284-9817-6A1A76D846EA}']
  end;

// *********************************************************************//
// Interface: _InnerClientConexao
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DF9BB9AF-6918-3091-851B-3711F6D8A50B}
// *********************************************************************//
  _InnerClientConexao = interface(IDispatch)
    ['{DF9BB9AF-6918-3091-851B-3711F6D8A50B}']
  end;

// *********************************************************************//
// DispIntf:  _InnerClientConexaoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DF9BB9AF-6918-3091-851B-3711F6D8A50B}
// *********************************************************************//
  _InnerClientConexaoDisp = dispinterface
    ['{DF9BB9AF-6918-3091-851B-3711F6D8A50B}']
  end;

// *********************************************************************//
// Interface: IObservarLog
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {13A2314F-41E6-30AC-B434-04086B0BCE86}
// *********************************************************************//
  IObservarLog = interface(IDispatch)
    ['{13A2314F-41E6-30AC-B434-04086B0BCE86}']
    procedure Gravar(pacote: PSafeArray; const tipo: WideString; innerId: Integer; Data: TDateTime); safecall;
  end;

// *********************************************************************//
// DispIntf:  IObservarLogDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {13A2314F-41E6-30AC-B434-04086B0BCE86}
// *********************************************************************//
  IObservarLogDisp = dispinterface
    ['{13A2314F-41E6-30AC-B434-04086B0BCE86}']
    procedure Gravar(pacote: {??PSafeArray}OleVariant; const tipo: WideString; innerId: Integer; 
                     Data: TDateTime); dispid 1610743808;
  end;

// *********************************************************************//
// Interface: _TratadorDeDados
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8A6DC707-582C-3BBD-A11B-C07F4A40E8A6}
// *********************************************************************//
  _TratadorDeDados = interface(IDispatch)
    ['{8A6DC707-582C-3BBD-A11B-C07F4A40E8A6}']
  end;

// *********************************************************************//
// DispIntf:  _TratadorDeDadosDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8A6DC707-582C-3BBD-A11B-C07F4A40E8A6}
// *********************************************************************//
  _TratadorDeDadosDisp = dispinterface
    ['{8A6DC707-582C-3BBD-A11B-C07F4A40E8A6}']
  end;

// *********************************************************************//
// Interface: _TipoAck
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7461CD76-2BD6-3881-9B8B-E670A8959C43}
// *********************************************************************//
  _TipoAck = interface(IDispatch)
    ['{7461CD76-2BD6-3881-9B8B-E670A8959C43}']
  end;

// *********************************************************************//
// DispIntf:  _TipoAckDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7461CD76-2BD6-3881-9B8B-E670A8959C43}
// *********************************************************************//
  _TipoAckDisp = dispinterface
    ['{7461CD76-2BD6-3881-9B8B-E670A8959C43}']
  end;

// *********************************************************************//
// Interface: _EventoAck
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6408C966-D774-3FFA-83F7-6B314FBF502E}
// *********************************************************************//
  _EventoAck = interface(IDispatch)
    ['{6408C966-D774-3FFA-83F7-6B314FBF502E}']
  end;

// *********************************************************************//
// DispIntf:  _EventoAckDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6408C966-D774-3FFA-83F7-6B314FBF502E}
// *********************************************************************//
  _EventoAckDisp = dispinterface
    ['{6408C966-D774-3FFA-83F7-6B314FBF502E}']
  end;

// *********************************************************************//
// Interface: _Nack
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8236AA95-056F-325D-91D3-D165A4E91CDA}
// *********************************************************************//
  _Nack = interface(IDispatch)
    ['{8236AA95-056F-325D-91D3-D165A4E91CDA}']
  end;

// *********************************************************************//
// DispIntf:  _NackDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8236AA95-056F-325D-91D3-D165A4E91CDA}
// *********************************************************************//
  _NackDisp = dispinterface
    ['{8236AA95-056F-325D-91D3-D165A4E91CDA}']
  end;

// *********************************************************************//
// Interface: _Pronto
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2AE7685E-B061-3FA9-8522-89EF064D7C92}
// *********************************************************************//
  _Pronto = interface(IDispatch)
    ['{2AE7685E-B061-3FA9-8522-89EF064D7C92}']
  end;

// *********************************************************************//
// DispIntf:  _ProntoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2AE7685E-B061-3FA9-8522-89EF064D7C92}
// *********************************************************************//
  _ProntoDisp = dispinterface
    ['{2AE7685E-B061-3FA9-8522-89EF064D7C92}']
  end;

// *********************************************************************//
// Interface: _PacoteTCPCliente
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FCB74C73-D790-3F87-AFE4-F495233D1D89}
// *********************************************************************//
  _PacoteTCPCliente = interface(IDispatch)
    ['{FCB74C73-D790-3F87-AFE4-F495233D1D89}']
  end;

// *********************************************************************//
// DispIntf:  _PacoteTCPClienteDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FCB74C73-D790-3F87-AFE4-F495233D1D89}
// *********************************************************************//
  _PacoteTCPClienteDisp = dispinterface
    ['{FCB74C73-D790-3F87-AFE4-F495233D1D89}']
  end;

// *********************************************************************//
// Interface: _TipoLongAck
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D3988AD8-254C-35CA-9C14-A25F0F710BF7}
// *********************************************************************//
  _TipoLongAck = interface(IDispatch)
    ['{D3988AD8-254C-35CA-9C14-A25F0F710BF7}']
  end;

// *********************************************************************//
// DispIntf:  _TipoLongAckDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D3988AD8-254C-35CA-9C14-A25F0F710BF7}
// *********************************************************************//
  _TipoLongAckDisp = dispinterface
    ['{D3988AD8-254C-35CA-9C14-A25F0F710BF7}']
  end;

// *********************************************************************//
// Interface: _CollectionClients
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A364FF67-A2A4-32C8-BE0D-E4266B2E08B5}
// *********************************************************************//
  _CollectionClients = interface(IDispatch)
    ['{A364FF67-A2A4-32C8-BE0D-E4266B2E08B5}']
  end;

// *********************************************************************//
// DispIntf:  _CollectionClientsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A364FF67-A2A4-32C8-BE0D-E4266B2E08B5}
// *********************************************************************//
  _CollectionClientsDisp = dispinterface
    ['{A364FF67-A2A4-32C8-BE0D-E4266B2E08B5}']
  end;

// *********************************************************************//
// Interface: _Log
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F68DAD1D-D20C-376E-B317-6B68B28A75A5}
// *********************************************************************//
  _Log = interface(IDispatch)
    ['{F68DAD1D-D20C-376E-B317-6B68B28A75A5}']
  end;

// *********************************************************************//
// DispIntf:  _LogDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F68DAD1D-D20C-376E-B317-6B68B28A75A5}
// *********************************************************************//
  _LogDisp = dispinterface
    ['{F68DAD1D-D20C-376E-B317-6B68B28A75A5}']
  end;

// *********************************************************************//
// Interface: _AguardandoDefinicao
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6F9AC085-2F66-3833-A5A3-24A1F62A72FA}
// *********************************************************************//
  _AguardandoDefinicao = interface(IDispatch)
    ['{6F9AC085-2F66-3833-A5A3-24A1F62A72FA}']
  end;

// *********************************************************************//
// DispIntf:  _AguardandoDefinicaoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6F9AC085-2F66-3833-A5A3-24A1F62A72FA}
// *********************************************************************//
  _AguardandoDefinicaoDisp = dispinterface
    ['{6F9AC085-2F66-3833-A5A3-24A1F62A72FA}']
  end;

// *********************************************************************//
// Interface: IInner
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {30D70C8C-475B-4591-94B7-0A012C86739D}
// *********************************************************************//
  IInner = interface(IDispatch)
    ['{30D70C8C-475B-4591-94B7-0A012C86739D}']
    function InitComm(porta: Integer): WordBool; safecall;
    function FinishComm: WordBool; safecall;
    function SendData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                      numeroPacote: Byte): WordBool; safecall;
    function ReceiveDataNoResponse(numeroInner: Integer; bytCommand: Byte; var pacote: PSafeArray; 
                                   tamanhoResposta: Integer): WordBool; safecall;
    function SendResponse(numeroInner: Integer; resposta: Byte): WordBool; safecall;
    function ReceiveData(numeroInner: Integer; comando: Byte; tamanhoResposta: Integer): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IInnerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {30D70C8C-475B-4591-94B7-0A012C86739D}
// *********************************************************************//
  IInnerDisp = dispinterface
    ['{30D70C8C-475B-4591-94B7-0A012C86739D}']
    function InitComm(porta: Integer): WordBool; dispid 1610743808;
    function FinishComm: WordBool; dispid 1610743809;
    function SendData(numeroInner: Integer; comando: Byte; var pacote: {??PSafeArray}OleVariant; 
                      numeroPacote: Byte): WordBool; dispid 1610743810;
    function ReceiveDataNoResponse(numeroInner: Integer; bytCommand: Byte; 
                                   var pacote: {??PSafeArray}OleVariant; tamanhoResposta: Integer): WordBool; dispid 1610743811;
    function SendResponse(numeroInner: Integer; resposta: Byte): WordBool; dispid 1610743812;
    function ReceiveData(numeroInner: Integer; comando: Byte; tamanhoResposta: Integer): WordBool; dispid 1610743813;
  end;

// *********************************************************************//
// Interface: _CollectionClient
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9680DF65-AB35-3924-B37A-B30A3DAB15F1}
// *********************************************************************//
  _CollectionClient = interface(IDispatch)
    ['{9680DF65-AB35-3924-B37A-B30A3DAB15F1}']
  end;

// *********************************************************************//
// DispIntf:  _CollectionClientDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9680DF65-AB35-3924-B37A-B30A3DAB15F1}
// *********************************************************************//
  _CollectionClientDisp = dispinterface
    ['{9680DF65-AB35-3924-B37A-B30A3DAB15F1}']
  end;

// *********************************************************************//
// Interface: _Data
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EE57A4F9-10A9-381F-BF1C-8BC4E563D440}
// *********************************************************************//
  _Data = interface(IDispatch)
    ['{EE57A4F9-10A9-381F-BF1C-8BC4E563D440}']
  end;

// *********************************************************************//
// DispIntf:  _DataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EE57A4F9-10A9-381F-BF1C-8BC4E563D440}
// *********************************************************************//
  _DataDisp = dispinterface
    ['{EE57A4F9-10A9-381F-BF1C-8BC4E563D440}']
  end;

// *********************************************************************//
// Interface: _TimeoutInner
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B065EBF0-9884-3B07-B88A-2AA8D5C18306}
// *********************************************************************//
  _TimeoutInner = interface(IDispatch)
    ['{B065EBF0-9884-3B07-B88A-2AA8D5C18306}']
  end;

// *********************************************************************//
// DispIntf:  _TimeoutInnerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B065EBF0-9884-3B07-B88A-2AA8D5C18306}
// *********************************************************************//
  _TimeoutInnerDisp = dispinterface
    ['{B065EBF0-9884-3B07-B88A-2AA8D5C18306}']
  end;

// *********************************************************************//
// Interface: _InnerListener
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6C4BF5ED-4455-37D3-BCCD-5E0E57812353}
// *********************************************************************//
  _InnerListener = interface(IDispatch)
    ['{6C4BF5ED-4455-37D3-BCCD-5E0E57812353}']
  end;

// *********************************************************************//
// DispIntf:  _InnerListenerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6C4BF5ED-4455-37D3-BCCD-5E0E57812353}
// *********************************************************************//
  _InnerListenerDisp = dispinterface
    ['{6C4BF5ED-4455-37D3-BCCD-5E0E57812353}']
  end;

// *********************************************************************//
// Interface: _Criado
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7F6A6779-D999-34B8-8CA7-2F8250FBB996}
// *********************************************************************//
  _Criado = interface(IDispatch)
    ['{7F6A6779-D999-34B8-8CA7-2F8250FBB996}']
  end;

// *********************************************************************//
// DispIntf:  _CriadoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7F6A6779-D999-34B8-8CA7-2F8250FBB996}
// *********************************************************************//
  _CriadoDisp = dispinterface
    ['{7F6A6779-D999-34B8-8CA7-2F8250FBB996}']
  end;

// *********************************************************************//
// Interface: _DelAck
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {86075D4C-243C-3C10-B41F-D024364187CB}
// *********************************************************************//
  _DelAck = interface(IDispatch)
    ['{86075D4C-243C-3C10-B41F-D024364187CB}']
  end;

// *********************************************************************//
// DispIntf:  _DelAckDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {86075D4C-243C-3C10-B41F-D024364187CB}
// *********************************************************************//
  _DelAckDisp = dispinterface
    ['{86075D4C-243C-3C10-B41F-D024364187CB}']
  end;

// *********************************************************************//
// Interface: _DelConnected
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {758209C4-E676-323D-BD8F-EAE56D82C167}
// *********************************************************************//
  _DelConnected = interface(IDispatch)
    ['{758209C4-E676-323D-BD8F-EAE56D82C167}']
  end;

// *********************************************************************//
// DispIntf:  _DelConnectedDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {758209C4-E676-323D-BD8F-EAE56D82C167}
// *********************************************************************//
  _DelConnectedDisp = dispinterface
    ['{758209C4-E676-323D-BD8F-EAE56D82C167}']
  end;

// *********************************************************************//
// Interface: _DelData
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C323E428-7C94-368E-96F4-7C94ADBBB1D4}
// *********************************************************************//
  _DelData = interface(IDispatch)
    ['{C323E428-7C94-368E-96F4-7C94ADBBB1D4}']
  end;

// *********************************************************************//
// DispIntf:  _DelDataDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C323E428-7C94-368E-96F4-7C94ADBBB1D4}
// *********************************************************************//
  _DelDataDisp = dispinterface
    ['{C323E428-7C94-368E-96F4-7C94ADBBB1D4}']
  end;

// *********************************************************************//
// Interface: _DelTicket
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A9101151-CF58-35BA-8DDE-C55F364A8DD3}
// *********************************************************************//
  _DelTicket = interface(IDispatch)
    ['{A9101151-CF58-35BA-8DDE-C55F364A8DD3}']
  end;

// *********************************************************************//
// DispIntf:  _DelTicketDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A9101151-CF58-35BA-8DDE-C55F364A8DD3}
// *********************************************************************//
  _DelTicketDisp = dispinterface
    ['{A9101151-CF58-35BA-8DDE-C55F364A8DD3}']
  end;

// *********************************************************************//
// Interface: _DelDisconnected
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {16D87116-B345-34CC-8096-579A809C400A}
// *********************************************************************//
  _DelDisconnected = interface(IDispatch)
    ['{16D87116-B345-34CC-8096-579A809C400A}']
  end;

// *********************************************************************//
// DispIntf:  _DelDisconnectedDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {16D87116-B345-34CC-8096-579A809C400A}
// *********************************************************************//
  _DelDisconnectedDisp = dispinterface
    ['{16D87116-B345-34CC-8096-579A809C400A}']
  end;

// *********************************************************************//
// Interface: _DelNack
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3023FBCE-AFF3-3A32-8F22-2968D7A9405E}
// *********************************************************************//
  _DelNack = interface(IDispatch)
    ['{3023FBCE-AFF3-3A32-8F22-2968D7A9405E}']
  end;

// *********************************************************************//
// DispIntf:  _DelNackDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3023FBCE-AFF3-3A32-8F22-2968D7A9405E}
// *********************************************************************//
  _DelNackDisp = dispinterface
    ['{3023FBCE-AFF3-3A32-8F22-2968D7A9405E}']
  end;

// *********************************************************************//
// Interface: _DelTimeout
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {71050A46-CB2C-38E5-A2FF-80629B157521}
// *********************************************************************//
  _DelTimeout = interface(IDispatch)
    ['{71050A46-CB2C-38E5-A2FF-80629B157521}']
  end;

// *********************************************************************//
// DispIntf:  _DelTimeoutDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {71050A46-CB2C-38E5-A2FF-80629B157521}
// *********************************************************************//
  _DelTimeoutDisp = dispinterface
    ['{71050A46-CB2C-38E5-A2FF-80629B157521}']
  end;

// *********************************************************************//
// Interface: _DelTicketJava
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {14E45AF4-36EC-3B66-B8B5-6C7F05D8CF3B}
// *********************************************************************//
  _DelTicketJava = interface(IDispatch)
    ['{14E45AF4-36EC-3B66-B8B5-6C7F05D8CF3B}']
  end;

// *********************************************************************//
// DispIntf:  _DelTicketJavaDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {14E45AF4-36EC-3B66-B8B5-6C7F05D8CF3B}
// *********************************************************************//
  _DelTicketJavaDisp = dispinterface
    ['{14E45AF4-36EC-3B66-B8B5-6C7F05D8CF3B}']
  end;

// *********************************************************************//
// Interface: _DelDataJava
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BDDE3FAD-FDD0-39ED-980B-940D94D6DE11}
// *********************************************************************//
  _DelDataJava = interface(IDispatch)
    ['{BDDE3FAD-FDD0-39ED-980B-940D94D6DE11}']
  end;

// *********************************************************************//
// DispIntf:  _DelDataJavaDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {BDDE3FAD-FDD0-39ED-980B-940D94D6DE11}
// *********************************************************************//
  _DelDataJavaDisp = dispinterface
    ['{BDDE3FAD-FDD0-39ED-980B-940D94D6DE11}']
  end;

// *********************************************************************//
// Interface: _Equipamento
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0CF35E24-2732-3283-A725-B4856A6E0C83}
// *********************************************************************//
  _Equipamento = interface(IDispatch)
    ['{0CF35E24-2732-3283-A725-B4856A6E0C83}']
  end;

// *********************************************************************//
// DispIntf:  _EquipamentoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0CF35E24-2732-3283-A725-B4856A6E0C83}
// *********************************************************************//
  _EquipamentoDisp = dispinterface
    ['{0CF35E24-2732-3283-A725-B4856A6E0C83}']
  end;

// *********************************************************************//
// Interface: _AssincronaInterface
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {14372D76-9557-3370-9955-F46B5DA3F860}
// *********************************************************************//
  _AssincronaInterface = interface(IDispatch)
    ['{14372D76-9557-3370-9955-F46B5DA3F860}']
  end;

// *********************************************************************//
// DispIntf:  _AssincronaInterfaceDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {14372D76-9557-3370-9955-F46B5DA3F860}
// *********************************************************************//
  _AssincronaInterfaceDisp = dispinterface
    ['{14372D76-9557-3370-9955-F46B5DA3F860}']
  end;

// *********************************************************************//
// Interface: _ObservarLog
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2F0080B4-2BAD-3322-BC64-9AF7B632D647}
// *********************************************************************//
  _ObservarLog = interface(IDispatch)
    ['{2F0080B4-2BAD-3322-BC64-9AF7B632D647}']
  end;

// *********************************************************************//
// DispIntf:  _ObservarLogDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2F0080B4-2BAD-3322-BC64-9AF7B632D647}
// *********************************************************************//
  _ObservarLogDisp = dispinterface
    ['{2F0080B4-2BAD-3322-BC64-9AF7B632D647}']
  end;

// *********************************************************************//
// Interface: _TipoNack
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {96D4E1AA-4857-3BD1-9493-E27ADDEC07F3}
// *********************************************************************//
  _TipoNack = interface(IDispatch)
    ['{96D4E1AA-4857-3BD1-9493-E27ADDEC07F3}']
  end;

// *********************************************************************//
// DispIntf:  _TipoNackDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {96D4E1AA-4857-3BD1-9493-E27ADDEC07F3}
// *********************************************************************//
  _TipoNackDisp = dispinterface
    ['{96D4E1AA-4857-3BD1-9493-E27ADDEC07F3}']
  end;

// *********************************************************************//
// Interface: _Utils
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {744017E0-A793-377D-9FBD-06A134644126}
// *********************************************************************//
  _Utils = interface(IDispatch)
    ['{744017E0-A793-377D-9FBD-06A134644126}']
  end;

// *********************************************************************//
// DispIntf:  _UtilsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {744017E0-A793-377D-9FBD-06A134644126}
// *********************************************************************//
  _UtilsDisp = dispinterface
    ['{744017E0-A793-377D-9FBD-06A134644126}']
  end;

// *********************************************************************//
// Interface: _Configuracoes
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {633E9DE2-8A3B-328A-940F-980751C40372}
// *********************************************************************//
  _Configuracoes = interface(IDispatch)
    ['{633E9DE2-8A3B-328A-940F-980751C40372}']
  end;

// *********************************************************************//
// DispIntf:  _ConfiguracoesDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {633E9DE2-8A3B-328A-940F-980751C40372}
// *********************************************************************//
  _ConfiguracoesDisp = dispinterface
    ['{633E9DE2-8A3B-328A-940F-980751C40372}']
  end;

// *********************************************************************//
// The Class CoBlockingInterface provides a Create and CreateRemote method to          
// create instances of the default interface IBlockingInterface exposed by              
// the CoClass BlockingInterface. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBlockingInterface = class
    class function Create: IBlockingInterface;
    class function CreateRemote(const MachineName: string): IBlockingInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBlockingInterface
// Help String      : 
// Default Interface: IBlockingInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBlockingInterfaceProperties= class;
{$ENDIF}
  TBlockingInterface = class(TOleServer)
  private
    FIntf: IBlockingInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TBlockingInterfaceProperties;
    function GetServerProperties: TBlockingInterfaceProperties;
{$ENDIF}
    function GetDefaultInterface: IBlockingInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IBlockingInterface);
    procedure Disconnect; override;
    function InitComm(porta: Integer): WordBool;
    function FinishComm: WordBool;
    function ReceiveDataNoResponse(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                                   tamanhoResposta: Integer): WordBool;
    function SendData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                      numeroPacote: Byte): WordBool;
    function SendResponse(numeroInner: Integer; reposta: Byte): WordBool;
    function ReceiveData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                         tamanhoResposta: Integer): WordBool;
    property DefaultInterface: IBlockingInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBlockingInterfaceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBlockingInterface
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBlockingInterfaceProperties = class(TPersistent)
  private
    FServer:    TBlockingInterface;
    function    GetDefaultInterface: IBlockingInterface;
    constructor Create(AServer: TBlockingInterface);
  protected
  public
    property DefaultInterface: IBlockingInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoInnerInterface provides a Create and CreateRemote method to          
// create instances of the default interface IInner exposed by              
// the CoClass InnerInterface. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoInnerInterface = class
    class function Create: IInner;
    class function CreateRemote(const MachineName: string): IInner;
  end;

  TInnerInterfaceAck = procedure(ASender: TObject; var numeroInner: Integer; var comando: Byte) of object;
  TInnerInterfaceConnected = procedure(ASender: TObject; var numeroInner: Integer) of object;
  TInnerInterfaceData = procedure(ASender: TObject; var numeroInner: Integer; var comando: Byte; 
                                                    var pacote: {??PSafeArray}OleVariant) of object;
  TInnerInterfaceDisconnected = procedure(ASender: TObject; var numeroInner: Integer) of object;
  TInnerInterfaceNack = procedure(ASender: TObject; var numeroInner: Integer; var comando: Byte) of object;
  TInnerInterfaceTicket = procedure(ASender: TObject; var numeroInner: Integer; 
                                                      var comando: {??PSafeArray}OleVariant; 
                                                      var enviouAck: WordBool) of object;
  TInnerInterfaceTimeout = procedure(ASender: TObject; var numeroInner: Integer; var comando: Byte) of object;
  TInnerInterfaceTicketJava = procedure(ASender: TObject; var numeroInner: Integer; 
                                                          var comando: WideString; 
                                                          var enviouAck: WordBool) of object;
  TInnerInterfaceDataJava = procedure(ASender: TObject; var numeroInner: Integer; 
                                                        var comando: Byte; var pacote: WideString) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TInnerInterface
// Help String      : 
// Default Interface: IInner
// Def. Intf. DISP? : No
// Event   Interface: IEventos
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TInnerInterfaceProperties= class;
{$ENDIF}
  TInnerInterface = class(TOleServer)
  private
    FOnAck: TInnerInterfaceAck;
    FOnConnected: TInnerInterfaceConnected;
    FOnData: TInnerInterfaceData;
    FOnDisconnected: TInnerInterfaceDisconnected;
    FOnNack: TInnerInterfaceNack;
    FOnTicket: TInnerInterfaceTicket;
    FOnTimeout: TInnerInterfaceTimeout;
    FOnTicketJava: TInnerInterfaceTicketJava;
    FOnDataJava: TInnerInterfaceDataJava;
    FIntf: IInner;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TInnerInterfaceProperties;
    function GetServerProperties: TInnerInterfaceProperties;
{$ENDIF}
    function GetDefaultInterface: IInner;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IInner);
    procedure Disconnect; override;
    function InitComm(porta: Integer): WordBool;
    function FinishComm: WordBool;
    function SendData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                      numeroPacote: Byte): WordBool;
    function ReceiveDataNoResponse(numeroInner: Integer; bytCommand: Byte; var pacote: PSafeArray; 
                                   tamanhoResposta: Integer): WordBool;
    function SendResponse(numeroInner: Integer; resposta: Byte): WordBool;
    function ReceiveData(numeroInner: Integer; comando: Byte; tamanhoResposta: Integer): WordBool;
    property DefaultInterface: IInner read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TInnerInterfaceProperties read GetServerProperties;
{$ENDIF}
    property OnAck: TInnerInterfaceAck read FOnAck write FOnAck;
    property OnConnected: TInnerInterfaceConnected read FOnConnected write FOnConnected;
    property OnData: TInnerInterfaceData read FOnData write FOnData;
    property OnDisconnected: TInnerInterfaceDisconnected read FOnDisconnected write FOnDisconnected;
    property OnNack: TInnerInterfaceNack read FOnNack write FOnNack;
    property OnTicket: TInnerInterfaceTicket read FOnTicket write FOnTicket;
    property OnTimeout: TInnerInterfaceTimeout read FOnTimeout write FOnTimeout;
    property OnTicketJava: TInnerInterfaceTicketJava read FOnTicketJava write FOnTicketJava;
    property OnDataJava: TInnerInterfaceDataJava read FOnDataJava write FOnDataJava;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TInnerInterface
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TInnerInterfaceProperties = class(TPersistent)
  private
    FServer:    TInnerInterface;
    function    GetDefaultInterface: IInner;
    constructor Create(AServer: TInnerInterface);
  protected
  public
    property DefaultInterface: IInner read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTipoRespostaAbstract provides a Create and CreateRemote method to          
// create instances of the default interface _TipoRespostaAbstract exposed by              
// the CoClass TipoRespostaAbstract. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTipoRespostaAbstract = class
    class function Create: _TipoRespostaAbstract;
    class function CreateRemote(const MachineName: string): _TipoRespostaAbstract;
  end;

// *********************************************************************//
// The Class CoRespostaInner provides a Create and CreateRemote method to          
// create instances of the default interface _RespostaInner exposed by              
// the CoClass RespostaInner. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRespostaInner = class
    class function Create: _RespostaInner;
    class function CreateRemote(const MachineName: string): _RespostaInner;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRespostaInner
// Help String      : 
// Default Interface: _RespostaInner
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRespostaInnerProperties= class;
{$ENDIF}
  TRespostaInner = class(TOleServer)
  private
    FIntf: _RespostaInner;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRespostaInnerProperties;
    function GetServerProperties: TRespostaInnerProperties;
{$ENDIF}
    function GetDefaultInterface: _RespostaInner;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _RespostaInner);
    procedure Disconnect; override;
    property DefaultInterface: _RespostaInner read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRespostaInnerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRespostaInner
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRespostaInnerProperties = class(TPersistent)
  private
    FServer:    TRespostaInner;
    function    GetDefaultInterface: _RespostaInner;
    constructor Create(AServer: TRespostaInner);
  protected
  public
    property DefaultInterface: _RespostaInner read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoEvento provides a Create and CreateRemote method to          
// create instances of the default interface _Evento exposed by              
// the CoClass Evento. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEvento = class
    class function Create: _Evento;
    class function CreateRemote(const MachineName: string): _Evento;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TEvento
// Help String      : 
// Default Interface: _Evento
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TEventoProperties= class;
{$ENDIF}
  TEvento = class(TOleServer)
  private
    FIntf: _Evento;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TEventoProperties;
    function GetServerProperties: TEventoProperties;
{$ENDIF}
    function GetDefaultInterface: _Evento;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Evento);
    procedure Disconnect; override;
    property DefaultInterface: _Evento read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TEventoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TEvento
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TEventoProperties = class(TPersistent)
  private
    FServer:    TEvento;
    function    GetDefaultInterface: _Evento;
    constructor Create(AServer: TEvento);
  protected
  public
    property DefaultInterface: _Evento read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDisconnected provides a Create and CreateRemote method to          
// create instances of the default interface _Disconnected exposed by              
// the CoClass Disconnected. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDisconnected = class
    class function Create: _Disconnected;
    class function CreateRemote(const MachineName: string): _Disconnected;
  end;

// *********************************************************************//
// The Class CoBilhetesAbstract provides a Create and CreateRemote method to          
// create instances of the default interface _BilhetesAbstract exposed by              
// the CoClass BilhetesAbstract. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBilhetesAbstract = class
    class function Create: _BilhetesAbstract;
    class function CreateRemote(const MachineName: string): _BilhetesAbstract;
  end;

// *********************************************************************//
// The Class CoBilheteOnline provides a Create and CreateRemote method to          
// create instances of the default interface _BilheteOnline exposed by              
// the CoClass BilheteOnline. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBilheteOnline = class
    class function Create: _BilheteOnline;
    class function CreateRemote(const MachineName: string): _BilheteOnline;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBilheteOnline
// Help String      : 
// Default Interface: _BilheteOnline
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBilheteOnlineProperties= class;
{$ENDIF}
  TBilheteOnline = class(TOleServer)
  private
    FIntf: _BilheteOnline;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TBilheteOnlineProperties;
    function GetServerProperties: TBilheteOnlineProperties;
{$ENDIF}
    function GetDefaultInterface: _BilheteOnline;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BilheteOnline);
    procedure Disconnect; override;
    property DefaultInterface: _BilheteOnline read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBilheteOnlineProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBilheteOnline
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBilheteOnlineProperties = class(TPersistent)
  private
    FServer:    TBilheteOnline;
    function    GetDefaultInterface: _BilheteOnline;
    constructor Create(AServer: TBilheteOnline);
  protected
  public
    property DefaultInterface: _BilheteOnline read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoBilheteOfflinePadraoLivre provides a Create and CreateRemote method to          
// create instances of the default interface _BilheteOfflinePadraoLivre exposed by              
// the CoClass BilheteOfflinePadraoLivre. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBilheteOfflinePadraoLivre = class
    class function Create: _BilheteOfflinePadraoLivre;
    class function CreateRemote(const MachineName: string): _BilheteOfflinePadraoLivre;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBilheteOfflinePadraoLivre
// Help String      : 
// Default Interface: _BilheteOfflinePadraoLivre
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBilheteOfflinePadraoLivreProperties= class;
{$ENDIF}
  TBilheteOfflinePadraoLivre = class(TOleServer)
  private
    FIntf: _BilheteOfflinePadraoLivre;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TBilheteOfflinePadraoLivreProperties;
    function GetServerProperties: TBilheteOfflinePadraoLivreProperties;
{$ENDIF}
    function GetDefaultInterface: _BilheteOfflinePadraoLivre;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BilheteOfflinePadraoLivre);
    procedure Disconnect; override;
    property DefaultInterface: _BilheteOfflinePadraoLivre read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBilheteOfflinePadraoLivreProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBilheteOfflinePadraoLivre
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBilheteOfflinePadraoLivreProperties = class(TPersistent)
  private
    FServer:    TBilheteOfflinePadraoLivre;
    function    GetDefaultInterface: _BilheteOfflinePadraoLivre;
    constructor Create(AServer: TBilheteOfflinePadraoLivre);
  protected
  public
    property DefaultInterface: _BilheteOfflinePadraoLivre read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCollection provides a Create and CreateRemote method to          
// create instances of the default interface _Collection exposed by              
// the CoClass Collection. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCollection = class
    class function Create: _Collection;
    class function CreateRemote(const MachineName: string): _Collection;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCollection
// Help String      : 
// Default Interface: _Collection
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCollectionProperties= class;
{$ENDIF}
  TCollection = class(TOleServer)
  private
    FIntf: _Collection;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TCollectionProperties;
    function GetServerProperties: TCollectionProperties;
{$ENDIF}
    function GetDefaultInterface: _Collection;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Collection);
    procedure Disconnect; override;
    property DefaultInterface: _Collection read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCollectionProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCollection
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCollectionProperties = class(TPersistent)
  private
    FServer:    TCollection;
    function    GetDefaultInterface: _Collection;
    constructor Create(AServer: TCollection);
  protected
  public
    property DefaultInterface: _Collection read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoEstadoClienteAbstract provides a Create and CreateRemote method to          
// create instances of the default interface _EstadoClienteAbstract exposed by              
// the CoClass EstadoClienteAbstract. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEstadoClienteAbstract = class
    class function Create: _EstadoClienteAbstract;
    class function CreateRemote(const MachineName: string): _EstadoClienteAbstract;
  end;

// *********************************************************************//
// The Class CoTransmissao provides a Create and CreateRemote method to          
// create instances of the default interface _Transmissao exposed by              
// the CoClass Transmissao. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransmissao = class
    class function Create: _Transmissao;
    class function CreateRemote(const MachineName: string): _Transmissao;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTransmissao
// Help String      : 
// Default Interface: _Transmissao
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTransmissaoProperties= class;
{$ENDIF}
  TTransmissao = class(TOleServer)
  private
    FIntf: _Transmissao;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTransmissaoProperties;
    function GetServerProperties: TTransmissaoProperties;
{$ENDIF}
    function GetDefaultInterface: _Transmissao;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Transmissao);
    procedure Disconnect; override;
    property DefaultInterface: _Transmissao read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTransmissaoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTransmissao
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTransmissaoProperties = class(TPersistent)
  private
    FServer:    TTransmissao;
    function    GetDefaultInterface: _Transmissao;
    constructor Create(AServer: TTransmissao);
  protected
  public
    property DefaultInterface: _Transmissao read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoConstante provides a Create and CreateRemote method to          
// create instances of the default interface _Constante exposed by              
// the CoClass Constante. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConstante = class
    class function Create: _Constante;
    class function CreateRemote(const MachineName: string): _Constante;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TConstante
// Help String      : 
// Default Interface: _Constante
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TConstanteProperties= class;
{$ENDIF}
  TConstante = class(TOleServer)
  private
    FIntf: _Constante;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TConstanteProperties;
    function GetServerProperties: TConstanteProperties;
{$ENDIF}
    function GetDefaultInterface: _Constante;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Constante);
    procedure Disconnect; override;
    property DefaultInterface: _Constante read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TConstanteProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TConstante
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TConstanteProperties = class(TPersistent)
  private
    FServer:    TConstante;
    function    GetDefaultInterface: _Constante;
    constructor Create(AServer: TConstante);
  protected
  public
    property DefaultInterface: _Constante read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTicket provides a Create and CreateRemote method to          
// create instances of the default interface _Ticket exposed by              
// the CoClass Ticket. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTicket = class
    class function Create: _Ticket;
    class function CreateRemote(const MachineName: string): _Ticket;
  end;

// *********************************************************************//
// The Class CoInnerClient provides a Create and CreateRemote method to          
// create instances of the default interface _InnerClient exposed by              
// the CoClass InnerClient. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoInnerClient = class
    class function Create: _InnerClient;
    class function CreateRemote(const MachineName: string): _InnerClient;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TInnerClient
// Help String      : 
// Default Interface: _InnerClient
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TInnerClientProperties= class;
{$ENDIF}
  TInnerClient = class(TOleServer)
  private
    FIntf: _InnerClient;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TInnerClientProperties;
    function GetServerProperties: TInnerClientProperties;
{$ENDIF}
    function GetDefaultInterface: _InnerClient;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _InnerClient);
    procedure Disconnect; override;
    property DefaultInterface: _InnerClient read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TInnerClientProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TInnerClient
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TInnerClientProperties = class(TPersistent)
  private
    FServer:    TInnerClient;
    function    GetDefaultInterface: _InnerClient;
    constructor Create(AServer: TInnerClient);
  protected
  public
    property DefaultInterface: _InnerClient read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTipoDados provides a Create and CreateRemote method to          
// create instances of the default interface _TipoDados exposed by              
// the CoClass TipoDados. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTipoDados = class
    class function Create: _TipoDados;
    class function CreateRemote(const MachineName: string): _TipoDados;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTipoDados
// Help String      : 
// Default Interface: _TipoDados
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTipoDadosProperties= class;
{$ENDIF}
  TTipoDados = class(TOleServer)
  private
    FIntf: _TipoDados;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTipoDadosProperties;
    function GetServerProperties: TTipoDadosProperties;
{$ENDIF}
    function GetDefaultInterface: _TipoDados;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TipoDados);
    procedure Disconnect; override;
    property DefaultInterface: _TipoDados read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTipoDadosProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTipoDados
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTipoDadosProperties = class(TPersistent)
  private
    FServer:    TTipoDados;
    function    GetDefaultInterface: _TipoDados;
    constructor Create(AServer: TTipoDados);
  protected
  public
    property DefaultInterface: _TipoDados read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoRecepcao provides a Create and CreateRemote method to          
// create instances of the default interface _Recepcao exposed by              
// the CoClass Recepcao. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRecepcao = class
    class function Create: _Recepcao;
    class function CreateRemote(const MachineName: string): _Recepcao;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TRecepcao
// Help String      : 
// Default Interface: _Recepcao
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TRecepcaoProperties= class;
{$ENDIF}
  TRecepcao = class(TOleServer)
  private
    FIntf: _Recepcao;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TRecepcaoProperties;
    function GetServerProperties: TRecepcaoProperties;
{$ENDIF}
    function GetDefaultInterface: _Recepcao;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Recepcao);
    procedure Disconnect; override;
    property DefaultInterface: _Recepcao read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TRecepcaoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TRecepcao
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TRecepcaoProperties = class(TPersistent)
  private
    FServer:    TRecepcao;
    function    GetDefaultInterface: _Recepcao;
    constructor Create(AServer: TRecepcao);
  protected
  public
    property DefaultInterface: _Recepcao read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAck provides a Create and CreateRemote method to          
// create instances of the default interface _Ack exposed by              
// the CoClass Ack. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAck = class
    class function Create: _Ack;
    class function CreateRemote(const MachineName: string): _Ack;
  end;

// *********************************************************************//
// The Class CoBilheteOfflinePadraoTopdata provides a Create and CreateRemote method to          
// create instances of the default interface _BilheteOfflinePadraoTopdata exposed by              
// the CoClass BilheteOfflinePadraoTopdata. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBilheteOfflinePadraoTopdata = class
    class function Create: _BilheteOfflinePadraoTopdata;
    class function CreateRemote(const MachineName: string): _BilheteOfflinePadraoTopdata;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TBilheteOfflinePadraoTopdata
// Help String      : 
// Default Interface: _BilheteOfflinePadraoTopdata
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TBilheteOfflinePadraoTopdataProperties= class;
{$ENDIF}
  TBilheteOfflinePadraoTopdata = class(TOleServer)
  private
    FIntf: _BilheteOfflinePadraoTopdata;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TBilheteOfflinePadraoTopdataProperties;
    function GetServerProperties: TBilheteOfflinePadraoTopdataProperties;
{$ENDIF}
    function GetDefaultInterface: _BilheteOfflinePadraoTopdata;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _BilheteOfflinePadraoTopdata);
    procedure Disconnect; override;
    property DefaultInterface: _BilheteOfflinePadraoTopdata read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TBilheteOfflinePadraoTopdataProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TBilheteOfflinePadraoTopdata
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TBilheteOfflinePadraoTopdataProperties = class(TPersistent)
  private
    FServer:    TBilheteOfflinePadraoTopdata;
    function    GetDefaultInterface: _BilheteOfflinePadraoTopdata;
    constructor Create(AServer: TBilheteOfflinePadraoTopdata);
  protected
  public
    property DefaultInterface: _BilheteOfflinePadraoTopdata read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoConnected provides a Create and CreateRemote method to          
// create instances of the default interface _Connected exposed by              
// the CoClass Connected. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConnected = class
    class function Create: _Connected;
    class function CreateRemote(const MachineName: string): _Connected;
  end;

// *********************************************************************//
// The Class CoInnerClientConexao provides a Create and CreateRemote method to          
// create instances of the default interface _InnerClientConexao exposed by              
// the CoClass InnerClientConexao. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoInnerClientConexao = class
    class function Create: _InnerClientConexao;
    class function CreateRemote(const MachineName: string): _InnerClientConexao;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TInnerClientConexao
// Help String      : 
// Default Interface: _InnerClientConexao
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TInnerClientConexaoProperties= class;
{$ENDIF}
  TInnerClientConexao = class(TOleServer)
  private
    FIntf: _InnerClientConexao;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TInnerClientConexaoProperties;
    function GetServerProperties: TInnerClientConexaoProperties;
{$ENDIF}
    function GetDefaultInterface: _InnerClientConexao;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _InnerClientConexao);
    procedure Disconnect; override;
    property DefaultInterface: _InnerClientConexao read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TInnerClientConexaoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TInnerClientConexao
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TInnerClientConexaoProperties = class(TPersistent)
  private
    FServer:    TInnerClientConexao;
    function    GetDefaultInterface: _InnerClientConexao;
    constructor Create(AServer: TInnerClientConexao);
  protected
  public
    property DefaultInterface: _InnerClientConexao read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTratadorDeDados provides a Create and CreateRemote method to          
// create instances of the default interface _TratadorDeDados exposed by              
// the CoClass TratadorDeDados. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTratadorDeDados = class
    class function Create: _TratadorDeDados;
    class function CreateRemote(const MachineName: string): _TratadorDeDados;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTratadorDeDados
// Help String      : 
// Default Interface: _TratadorDeDados
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTratadorDeDadosProperties= class;
{$ENDIF}
  TTratadorDeDados = class(TOleServer)
  private
    FIntf: _TratadorDeDados;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTratadorDeDadosProperties;
    function GetServerProperties: TTratadorDeDadosProperties;
{$ENDIF}
    function GetDefaultInterface: _TratadorDeDados;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TratadorDeDados);
    procedure Disconnect; override;
    property DefaultInterface: _TratadorDeDados read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTratadorDeDadosProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTratadorDeDados
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTratadorDeDadosProperties = class(TPersistent)
  private
    FServer:    TTratadorDeDados;
    function    GetDefaultInterface: _TratadorDeDados;
    constructor Create(AServer: TTratadorDeDados);
  protected
  public
    property DefaultInterface: _TratadorDeDados read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTipoAck provides a Create and CreateRemote method to          
// create instances of the default interface _TipoAck exposed by              
// the CoClass TipoAck. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTipoAck = class
    class function Create: _TipoAck;
    class function CreateRemote(const MachineName: string): _TipoAck;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTipoAck
// Help String      : 
// Default Interface: _TipoAck
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTipoAckProperties= class;
{$ENDIF}
  TTipoAck = class(TOleServer)
  private
    FIntf: _TipoAck;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTipoAckProperties;
    function GetServerProperties: TTipoAckProperties;
{$ENDIF}
    function GetDefaultInterface: _TipoAck;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TipoAck);
    procedure Disconnect; override;
    property DefaultInterface: _TipoAck read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTipoAckProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTipoAck
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTipoAckProperties = class(TPersistent)
  private
    FServer:    TTipoAck;
    function    GetDefaultInterface: _TipoAck;
    constructor Create(AServer: TTipoAck);
  protected
  public
    property DefaultInterface: _TipoAck read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoEventoAck provides a Create and CreateRemote method to          
// create instances of the default interface _EventoAck exposed by              
// the CoClass EventoAck. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEventoAck = class
    class function Create: _EventoAck;
    class function CreateRemote(const MachineName: string): _EventoAck;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TEventoAck
// Help String      : 
// Default Interface: _EventoAck
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TEventoAckProperties= class;
{$ENDIF}
  TEventoAck = class(TOleServer)
  private
    FIntf: _EventoAck;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TEventoAckProperties;
    function GetServerProperties: TEventoAckProperties;
{$ENDIF}
    function GetDefaultInterface: _EventoAck;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _EventoAck);
    procedure Disconnect; override;
    property DefaultInterface: _EventoAck read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TEventoAckProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TEventoAck
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TEventoAckProperties = class(TPersistent)
  private
    FServer:    TEventoAck;
    function    GetDefaultInterface: _EventoAck;
    constructor Create(AServer: TEventoAck);
  protected
  public
    property DefaultInterface: _EventoAck read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoNack provides a Create and CreateRemote method to          
// create instances of the default interface _Nack exposed by              
// the CoClass Nack. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNack = class
    class function Create: _Nack;
    class function CreateRemote(const MachineName: string): _Nack;
  end;

// *********************************************************************//
// The Class CoPronto provides a Create and CreateRemote method to          
// create instances of the default interface _Pronto exposed by              
// the CoClass Pronto. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPronto = class
    class function Create: _Pronto;
    class function CreateRemote(const MachineName: string): _Pronto;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPronto
// Help String      : 
// Default Interface: _Pronto
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TProntoProperties= class;
{$ENDIF}
  TPronto = class(TOleServer)
  private
    FIntf: _Pronto;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TProntoProperties;
    function GetServerProperties: TProntoProperties;
{$ENDIF}
    function GetDefaultInterface: _Pronto;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Pronto);
    procedure Disconnect; override;
    property DefaultInterface: _Pronto read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TProntoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPronto
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TProntoProperties = class(TPersistent)
  private
    FServer:    TPronto;
    function    GetDefaultInterface: _Pronto;
    constructor Create(AServer: TPronto);
  protected
  public
    property DefaultInterface: _Pronto read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoPacoteTCPCliente provides a Create and CreateRemote method to          
// create instances of the default interface _PacoteTCPCliente exposed by              
// the CoClass PacoteTCPCliente. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPacoteTCPCliente = class
    class function Create: _PacoteTCPCliente;
    class function CreateRemote(const MachineName: string): _PacoteTCPCliente;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TPacoteTCPCliente
// Help String      : 
// Default Interface: _PacoteTCPCliente
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TPacoteTCPClienteProperties= class;
{$ENDIF}
  TPacoteTCPCliente = class(TOleServer)
  private
    FIntf: _PacoteTCPCliente;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TPacoteTCPClienteProperties;
    function GetServerProperties: TPacoteTCPClienteProperties;
{$ENDIF}
    function GetDefaultInterface: _PacoteTCPCliente;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _PacoteTCPCliente);
    procedure Disconnect; override;
    property DefaultInterface: _PacoteTCPCliente read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TPacoteTCPClienteProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TPacoteTCPCliente
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TPacoteTCPClienteProperties = class(TPersistent)
  private
    FServer:    TPacoteTCPCliente;
    function    GetDefaultInterface: _PacoteTCPCliente;
    constructor Create(AServer: TPacoteTCPCliente);
  protected
  public
    property DefaultInterface: _PacoteTCPCliente read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTipoLongAck provides a Create and CreateRemote method to          
// create instances of the default interface _TipoLongAck exposed by              
// the CoClass TipoLongAck. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTipoLongAck = class
    class function Create: _TipoLongAck;
    class function CreateRemote(const MachineName: string): _TipoLongAck;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTipoLongAck
// Help String      : 
// Default Interface: _TipoLongAck
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTipoLongAckProperties= class;
{$ENDIF}
  TTipoLongAck = class(TOleServer)
  private
    FIntf: _TipoLongAck;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTipoLongAckProperties;
    function GetServerProperties: TTipoLongAckProperties;
{$ENDIF}
    function GetDefaultInterface: _TipoLongAck;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TipoLongAck);
    procedure Disconnect; override;
    property DefaultInterface: _TipoLongAck read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTipoLongAckProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTipoLongAck
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTipoLongAckProperties = class(TPersistent)
  private
    FServer:    TTipoLongAck;
    function    GetDefaultInterface: _TipoLongAck;
    constructor Create(AServer: TTipoLongAck);
  protected
  public
    property DefaultInterface: _TipoLongAck read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCollectionClients provides a Create and CreateRemote method to          
// create instances of the default interface _CollectionClients exposed by              
// the CoClass CollectionClients. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCollectionClients = class
    class function Create: _CollectionClients;
    class function CreateRemote(const MachineName: string): _CollectionClients;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCollectionClients
// Help String      : 
// Default Interface: _CollectionClients
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCollectionClientsProperties= class;
{$ENDIF}
  TCollectionClients = class(TOleServer)
  private
    FIntf: _CollectionClients;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TCollectionClientsProperties;
    function GetServerProperties: TCollectionClientsProperties;
{$ENDIF}
    function GetDefaultInterface: _CollectionClients;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _CollectionClients);
    procedure Disconnect; override;
    property DefaultInterface: _CollectionClients read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCollectionClientsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCollectionClients
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCollectionClientsProperties = class(TPersistent)
  private
    FServer:    TCollectionClients;
    function    GetDefaultInterface: _CollectionClients;
    constructor Create(AServer: TCollectionClients);
  protected
  public
    property DefaultInterface: _CollectionClients read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoLog provides a Create and CreateRemote method to          
// create instances of the default interface _Log exposed by              
// the CoClass Log. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLog = class
    class function Create: _Log;
    class function CreateRemote(const MachineName: string): _Log;
  end;

// *********************************************************************//
// The Class CoAguardandoDefinicao provides a Create and CreateRemote method to          
// create instances of the default interface _AguardandoDefinicao exposed by              
// the CoClass AguardandoDefinicao. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAguardandoDefinicao = class
    class function Create: _AguardandoDefinicao;
    class function CreateRemote(const MachineName: string): _AguardandoDefinicao;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAguardandoDefinicao
// Help String      : 
// Default Interface: _AguardandoDefinicao
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAguardandoDefinicaoProperties= class;
{$ENDIF}
  TAguardandoDefinicao = class(TOleServer)
  private
    FIntf: _AguardandoDefinicao;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAguardandoDefinicaoProperties;
    function GetServerProperties: TAguardandoDefinicaoProperties;
{$ENDIF}
    function GetDefaultInterface: _AguardandoDefinicao;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _AguardandoDefinicao);
    procedure Disconnect; override;
    property DefaultInterface: _AguardandoDefinicao read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAguardandoDefinicaoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAguardandoDefinicao
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAguardandoDefinicaoProperties = class(TPersistent)
  private
    FServer:    TAguardandoDefinicao;
    function    GetDefaultInterface: _AguardandoDefinicao;
    constructor Create(AServer: TAguardandoDefinicao);
  protected
  public
    property DefaultInterface: _AguardandoDefinicao read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCollectionClient provides a Create and CreateRemote method to          
// create instances of the default interface _CollectionClient exposed by              
// the CoClass CollectionClient. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCollectionClient = class
    class function Create: _CollectionClient;
    class function CreateRemote(const MachineName: string): _CollectionClient;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCollectionClient
// Help String      : 
// Default Interface: _CollectionClient
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCollectionClientProperties= class;
{$ENDIF}
  TCollectionClient = class(TOleServer)
  private
    FIntf: _CollectionClient;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TCollectionClientProperties;
    function GetServerProperties: TCollectionClientProperties;
{$ENDIF}
    function GetDefaultInterface: _CollectionClient;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _CollectionClient);
    procedure Disconnect; override;
    property DefaultInterface: _CollectionClient read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCollectionClientProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCollectionClient
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCollectionClientProperties = class(TPersistent)
  private
    FServer:    TCollectionClient;
    function    GetDefaultInterface: _CollectionClient;
    constructor Create(AServer: TCollectionClient);
  protected
  public
    property DefaultInterface: _CollectionClient read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoData provides a Create and CreateRemote method to          
// create instances of the default interface _Data exposed by              
// the CoClass Data. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoData = class
    class function Create: _Data;
    class function CreateRemote(const MachineName: string): _Data;
  end;

// *********************************************************************//
// The Class CoTimeoutInner provides a Create and CreateRemote method to          
// create instances of the default interface _TimeoutInner exposed by              
// the CoClass TimeoutInner. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTimeoutInner = class
    class function Create: _TimeoutInner;
    class function CreateRemote(const MachineName: string): _TimeoutInner;
  end;

// *********************************************************************//
// The Class CoInnerListener provides a Create and CreateRemote method to          
// create instances of the default interface _InnerListener exposed by              
// the CoClass InnerListener. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoInnerListener = class
    class function Create: _InnerListener;
    class function CreateRemote(const MachineName: string): _InnerListener;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TInnerListener
// Help String      : 
// Default Interface: _InnerListener
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TInnerListenerProperties= class;
{$ENDIF}
  TInnerListener = class(TOleServer)
  private
    FIntf: _InnerListener;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TInnerListenerProperties;
    function GetServerProperties: TInnerListenerProperties;
{$ENDIF}
    function GetDefaultInterface: _InnerListener;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _InnerListener);
    procedure Disconnect; override;
    property DefaultInterface: _InnerListener read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TInnerListenerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TInnerListener
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TInnerListenerProperties = class(TPersistent)
  private
    FServer:    TInnerListener;
    function    GetDefaultInterface: _InnerListener;
    constructor Create(AServer: TInnerListener);
  protected
  public
    property DefaultInterface: _InnerListener read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoCriado provides a Create and CreateRemote method to          
// create instances of the default interface _Criado exposed by              
// the CoClass Criado. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCriado = class
    class function Create: _Criado;
    class function CreateRemote(const MachineName: string): _Criado;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TCriado
// Help String      : 
// Default Interface: _Criado
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TCriadoProperties= class;
{$ENDIF}
  TCriado = class(TOleServer)
  private
    FIntf: _Criado;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TCriadoProperties;
    function GetServerProperties: TCriadoProperties;
{$ENDIF}
    function GetDefaultInterface: _Criado;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Criado);
    procedure Disconnect; override;
    property DefaultInterface: _Criado read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TCriadoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TCriado
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TCriadoProperties = class(TPersistent)
  private
    FServer:    TCriado;
    function    GetDefaultInterface: _Criado;
    constructor Create(AServer: TCriado);
  protected
  public
    property DefaultInterface: _Criado read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoDelAck provides a Create and CreateRemote method to          
// create instances of the default interface _DelAck exposed by              
// the CoClass DelAck. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelAck = class
    class function Create: _DelAck;
    class function CreateRemote(const MachineName: string): _DelAck;
  end;

// *********************************************************************//
// The Class CoDelConnected provides a Create and CreateRemote method to          
// create instances of the default interface _DelConnected exposed by              
// the CoClass DelConnected. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelConnected = class
    class function Create: _DelConnected;
    class function CreateRemote(const MachineName: string): _DelConnected;
  end;

// *********************************************************************//
// The Class CoDelData provides a Create and CreateRemote method to          
// create instances of the default interface _DelData exposed by              
// the CoClass DelData. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelData = class
    class function Create: _DelData;
    class function CreateRemote(const MachineName: string): _DelData;
  end;

// *********************************************************************//
// The Class CoDelTicket provides a Create and CreateRemote method to          
// create instances of the default interface _DelTicket exposed by              
// the CoClass DelTicket. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelTicket = class
    class function Create: _DelTicket;
    class function CreateRemote(const MachineName: string): _DelTicket;
  end;

// *********************************************************************//
// The Class CoDelDisconnected provides a Create and CreateRemote method to          
// create instances of the default interface _DelDisconnected exposed by              
// the CoClass DelDisconnected. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelDisconnected = class
    class function Create: _DelDisconnected;
    class function CreateRemote(const MachineName: string): _DelDisconnected;
  end;

// *********************************************************************//
// The Class CoDelNack provides a Create and CreateRemote method to          
// create instances of the default interface _DelNack exposed by              
// the CoClass DelNack. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelNack = class
    class function Create: _DelNack;
    class function CreateRemote(const MachineName: string): _DelNack;
  end;

// *********************************************************************//
// The Class CoDelTimeout provides a Create and CreateRemote method to          
// create instances of the default interface _DelTimeout exposed by              
// the CoClass DelTimeout. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelTimeout = class
    class function Create: _DelTimeout;
    class function CreateRemote(const MachineName: string): _DelTimeout;
  end;

// *********************************************************************//
// The Class CoDelTicketJava provides a Create and CreateRemote method to          
// create instances of the default interface _DelTicketJava exposed by              
// the CoClass DelTicketJava. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelTicketJava = class
    class function Create: _DelTicketJava;
    class function CreateRemote(const MachineName: string): _DelTicketJava;
  end;

// *********************************************************************//
// The Class CoDelDataJava provides a Create and CreateRemote method to          
// create instances of the default interface _DelDataJava exposed by              
// the CoClass DelDataJava. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDelDataJava = class
    class function Create: _DelDataJava;
    class function CreateRemote(const MachineName: string): _DelDataJava;
  end;

// *********************************************************************//
// The Class CoEquipamento provides a Create and CreateRemote method to          
// create instances of the default interface _Equipamento exposed by              
// the CoClass Equipamento. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEquipamento = class
    class function Create: _Equipamento;
    class function CreateRemote(const MachineName: string): _Equipamento;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TEquipamento
// Help String      : 
// Default Interface: _Equipamento
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TEquipamentoProperties= class;
{$ENDIF}
  TEquipamento = class(TOleServer)
  private
    FIntf: _Equipamento;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TEquipamentoProperties;
    function GetServerProperties: TEquipamentoProperties;
{$ENDIF}
    function GetDefaultInterface: _Equipamento;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Equipamento);
    procedure Disconnect; override;
    property DefaultInterface: _Equipamento read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TEquipamentoProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TEquipamento
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TEquipamentoProperties = class(TPersistent)
  private
    FServer:    TEquipamento;
    function    GetDefaultInterface: _Equipamento;
    constructor Create(AServer: TEquipamento);
  protected
  public
    property DefaultInterface: _Equipamento read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoAssincronaInterface provides a Create and CreateRemote method to          
// create instances of the default interface _AssincronaInterface exposed by              
// the CoClass AssincronaInterface. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAssincronaInterface = class
    class function Create: _AssincronaInterface;
    class function CreateRemote(const MachineName: string): _AssincronaInterface;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TAssincronaInterface
// Help String      : 
// Default Interface: _AssincronaInterface
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TAssincronaInterfaceProperties= class;
{$ENDIF}
  TAssincronaInterface = class(TOleServer)
  private
    FIntf: _AssincronaInterface;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TAssincronaInterfaceProperties;
    function GetServerProperties: TAssincronaInterfaceProperties;
{$ENDIF}
    function GetDefaultInterface: _AssincronaInterface;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _AssincronaInterface);
    procedure Disconnect; override;
    property DefaultInterface: _AssincronaInterface read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TAssincronaInterfaceProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TAssincronaInterface
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TAssincronaInterfaceProperties = class(TPersistent)
  private
    FServer:    TAssincronaInterface;
    function    GetDefaultInterface: _AssincronaInterface;
    constructor Create(AServer: TAssincronaInterface);
  protected
  public
    property DefaultInterface: _AssincronaInterface read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoObservarLog provides a Create and CreateRemote method to          
// create instances of the default interface _ObservarLog exposed by              
// the CoClass ObservarLog. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObservarLog = class
    class function Create: _ObservarLog;
    class function CreateRemote(const MachineName: string): _ObservarLog;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TObservarLog
// Help String      : 
// Default Interface: _ObservarLog
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TObservarLogProperties= class;
{$ENDIF}
  TObservarLog = class(TOleServer)
  private
    FIntf: _ObservarLog;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TObservarLogProperties;
    function GetServerProperties: TObservarLogProperties;
{$ENDIF}
    function GetDefaultInterface: _ObservarLog;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _ObservarLog);
    procedure Disconnect; override;
    property DefaultInterface: _ObservarLog read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TObservarLogProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TObservarLog
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TObservarLogProperties = class(TPersistent)
  private
    FServer:    TObservarLog;
    function    GetDefaultInterface: _ObservarLog;
    constructor Create(AServer: TObservarLog);
  protected
  public
    property DefaultInterface: _ObservarLog read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoTipoNack provides a Create and CreateRemote method to          
// create instances of the default interface _TipoNack exposed by              
// the CoClass TipoNack. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTipoNack = class
    class function Create: _TipoNack;
    class function CreateRemote(const MachineName: string): _TipoNack;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TTipoNack
// Help String      : 
// Default Interface: _TipoNack
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TTipoNackProperties= class;
{$ENDIF}
  TTipoNack = class(TOleServer)
  private
    FIntf: _TipoNack;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TTipoNackProperties;
    function GetServerProperties: TTipoNackProperties;
{$ENDIF}
    function GetDefaultInterface: _TipoNack;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _TipoNack);
    procedure Disconnect; override;
    property DefaultInterface: _TipoNack read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TTipoNackProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TTipoNack
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TTipoNackProperties = class(TPersistent)
  private
    FServer:    TTipoNack;
    function    GetDefaultInterface: _TipoNack;
    constructor Create(AServer: TTipoNack);
  protected
  public
    property DefaultInterface: _TipoNack read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoUtils provides a Create and CreateRemote method to          
// create instances of the default interface _Utils exposed by              
// the CoClass Utils. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUtils = class
    class function Create: _Utils;
    class function CreateRemote(const MachineName: string): _Utils;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TUtils
// Help String      : 
// Default Interface: _Utils
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TUtilsProperties= class;
{$ENDIF}
  TUtils = class(TOleServer)
  private
    FIntf: _Utils;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TUtilsProperties;
    function GetServerProperties: TUtilsProperties;
{$ENDIF}
    function GetDefaultInterface: _Utils;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Utils);
    procedure Disconnect; override;
    property DefaultInterface: _Utils read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TUtilsProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TUtils
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TUtilsProperties = class(TPersistent)
  private
    FServer:    TUtils;
    function    GetDefaultInterface: _Utils;
    constructor Create(AServer: TUtils);
  protected
  public
    property DefaultInterface: _Utils read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoConfiguracoes provides a Create and CreateRemote method to          
// create instances of the default interface _Configuracoes exposed by              
// the CoClass Configuracoes. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConfiguracoes = class
    class function Create: _Configuracoes;
    class function CreateRemote(const MachineName: string): _Configuracoes;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TConfiguracoes
// Help String      : 
// Default Interface: _Configuracoes
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TConfiguracoesProperties= class;
{$ENDIF}
  TConfiguracoes = class(TOleServer)
  private
    FIntf: _Configuracoes;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps: TConfiguracoesProperties;
    function GetServerProperties: TConfiguracoesProperties;
{$ENDIF}
    function GetDefaultInterface: _Configuracoes;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: _Configuracoes);
    procedure Disconnect; override;
    property DefaultInterface: _Configuracoes read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TConfiguracoesProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TConfiguracoes
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TConfiguracoesProperties = class(TPersistent)
  private
    FServer:    TConfiguracoes;
    function    GetDefaultInterface: _Configuracoes;
    constructor Create(AServer: TConfiguracoes);
  protected
  public
    property DefaultInterface: _Configuracoes read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoBlockingInterface.Create: IBlockingInterface;
begin
  Result := CreateComObject(CLASS_BlockingInterface) as IBlockingInterface;
end;

class function CoBlockingInterface.CreateRemote(const MachineName: string): IBlockingInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BlockingInterface) as IBlockingInterface;
end;

procedure TBlockingInterface.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C8267A2B-62C7-35BC-9E77-AE536387386A}';
    IntfIID:   '{39D70C8A-475B-4591-94B7-0A012C86739D}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBlockingInterface.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IBlockingInterface;
  end;
end;

procedure TBlockingInterface.ConnectTo(svrIntf: IBlockingInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBlockingInterface.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBlockingInterface.GetDefaultInterface: IBlockingInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBlockingInterface.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBlockingInterfaceProperties.Create(Self);
{$ENDIF}
end;

destructor TBlockingInterface.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBlockingInterface.GetServerProperties: TBlockingInterfaceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TBlockingInterface.InitComm(porta: Integer): WordBool;
begin
  Result := DefaultInterface.InitComm(porta);
end;

function TBlockingInterface.FinishComm: WordBool;
begin
  Result := DefaultInterface.FinishComm;
end;

function TBlockingInterface.ReceiveDataNoResponse(numeroInner: Integer; comando: Byte; 
                                                  var pacote: PSafeArray; tamanhoResposta: Integer): WordBool;
begin
  Result := DefaultInterface.ReceiveDataNoResponse(numeroInner, comando, pacote, tamanhoResposta);
end;

function TBlockingInterface.SendData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                                     numeroPacote: Byte): WordBool;
begin
  Result := DefaultInterface.SendData(numeroInner, comando, pacote, numeroPacote);
end;

function TBlockingInterface.SendResponse(numeroInner: Integer; reposta: Byte): WordBool;
begin
  Result := DefaultInterface.SendResponse(numeroInner, reposta);
end;

function TBlockingInterface.ReceiveData(numeroInner: Integer; comando: Byte; 
                                        var pacote: PSafeArray; tamanhoResposta: Integer): WordBool;
begin
  Result := DefaultInterface.ReceiveData(numeroInner, comando, pacote, tamanhoResposta);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBlockingInterfaceProperties.Create(AServer: TBlockingInterface);
begin
  inherited Create;
  FServer := AServer;
end;

function TBlockingInterfaceProperties.GetDefaultInterface: IBlockingInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoInnerInterface.Create: IInner;
begin
  Result := CreateComObject(CLASS_InnerInterface) as IInner;
end;

class function CoInnerInterface.CreateRemote(const MachineName: string): IInner;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InnerInterface) as IInner;
end;

procedure TInnerInterface.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{314211FA-B26F-38CA-A1BB-6613269998E6}';
    IntfIID:   '{30D70C8C-475B-4591-94B7-0A012C86739D}';
    EventIID:  '{1A585C4D-3371-48DC-AF8A-AFFECC1B0967}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TInnerInterface.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as IInner;
  end;
end;

procedure TInnerInterface.ConnectTo(svrIntf: IInner);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TInnerInterface.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TInnerInterface.GetDefaultInterface: IInner;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TInnerInterface.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TInnerInterfaceProperties.Create(Self);
{$ENDIF}
end;

destructor TInnerInterface.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TInnerInterface.GetServerProperties: TInnerInterfaceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TInnerInterface.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnAck) then
         FOnAck(Self,
                Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                Byte((TVarData(Params[1]).VPointer)^) {var Byte});
    2: if Assigned(FOnConnected) then
         FOnConnected(Self, Integer((TVarData(Params[0]).VPointer)^) {var Integer});
    3: if Assigned(FOnData) then
         FOnData(Self,
                 Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                 Byte((TVarData(Params[1]).VPointer)^) {var Byte},
                 {??PSafeArray}OleVariant((TVarData(Params[2]).VPointer)^) {var  ??PSafeArray OleVariant});
    4: if Assigned(FOnDisconnected) then
         FOnDisconnected(Self, Integer((TVarData(Params[0]).VPointer)^) {var Integer});
    5: if Assigned(FOnNack) then
         FOnNack(Self,
                 Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                 Byte((TVarData(Params[1]).VPointer)^) {var Byte});
    6: if Assigned(FOnTicket) then
         FOnTicket(Self,
                   Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                   {??PSafeArray}OleVariant((TVarData(Params[1]).VPointer)^) {var  ??PSafeArray OleVariant},
                   WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    7: if Assigned(FOnTimeout) then
         FOnTimeout(Self,
                    Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                    Byte((TVarData(Params[1]).VPointer)^) {var Byte});
    8: if Assigned(FOnTicketJava) then
         FOnTicketJava(Self,
                       Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                       WideString((TVarData(Params[1]).VPointer)^) {var WideString},
                       WordBool((TVarData(Params[2]).VPointer)^) {var WordBool});
    9: if Assigned(FOnDataJava) then
         FOnDataJava(Self,
                     Integer((TVarData(Params[0]).VPointer)^) {var Integer},
                     Byte((TVarData(Params[1]).VPointer)^) {var Byte},
                     WideString((TVarData(Params[2]).VPointer)^) {var WideString});
  end; {case DispID}
end;

function TInnerInterface.InitComm(porta: Integer): WordBool;
begin
  Result := DefaultInterface.InitComm(porta);
end;

function TInnerInterface.FinishComm: WordBool;
begin
  Result := DefaultInterface.FinishComm;
end;

function TInnerInterface.SendData(numeroInner: Integer; comando: Byte; var pacote: PSafeArray; 
                                  numeroPacote: Byte): WordBool;
begin
  Result := DefaultInterface.SendData(numeroInner, comando, pacote, numeroPacote);
end;

function TInnerInterface.ReceiveDataNoResponse(numeroInner: Integer; bytCommand: Byte; 
                                               var pacote: PSafeArray; tamanhoResposta: Integer): WordBool;
begin
  Result := DefaultInterface.ReceiveDataNoResponse(numeroInner, bytCommand, pacote, tamanhoResposta);
end;

function TInnerInterface.SendResponse(numeroInner: Integer; resposta: Byte): WordBool;
begin
  Result := DefaultInterface.SendResponse(numeroInner, resposta);
end;

function TInnerInterface.ReceiveData(numeroInner: Integer; comando: Byte; tamanhoResposta: Integer): WordBool;
begin
  Result := DefaultInterface.ReceiveData(numeroInner, comando, tamanhoResposta);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TInnerInterfaceProperties.Create(AServer: TInnerInterface);
begin
  inherited Create;
  FServer := AServer;
end;

function TInnerInterfaceProperties.GetDefaultInterface: IInner;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTipoRespostaAbstract.Create: _TipoRespostaAbstract;
begin
  Result := CreateComObject(CLASS_TipoRespostaAbstract) as _TipoRespostaAbstract;
end;

class function CoTipoRespostaAbstract.CreateRemote(const MachineName: string): _TipoRespostaAbstract;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TipoRespostaAbstract) as _TipoRespostaAbstract;
end;

class function CoRespostaInner.Create: _RespostaInner;
begin
  Result := CreateComObject(CLASS_RespostaInner) as _RespostaInner;
end;

class function CoRespostaInner.CreateRemote(const MachineName: string): _RespostaInner;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RespostaInner) as _RespostaInner;
end;

procedure TRespostaInner.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{55E19990-0D8E-3892-BE73-43B41903496E}';
    IntfIID:   '{4BC755E2-8AEF-364D-90B9-3D92159E2C11}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRespostaInner.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _RespostaInner;
  end;
end;

procedure TRespostaInner.ConnectTo(svrIntf: _RespostaInner);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRespostaInner.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRespostaInner.GetDefaultInterface: _RespostaInner;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRespostaInner.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRespostaInnerProperties.Create(Self);
{$ENDIF}
end;

destructor TRespostaInner.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRespostaInner.GetServerProperties: TRespostaInnerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRespostaInnerProperties.Create(AServer: TRespostaInner);
begin
  inherited Create;
  FServer := AServer;
end;

function TRespostaInnerProperties.GetDefaultInterface: _RespostaInner;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoEvento.Create: _Evento;
begin
  Result := CreateComObject(CLASS_Evento) as _Evento;
end;

class function CoEvento.CreateRemote(const MachineName: string): _Evento;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Evento) as _Evento;
end;

procedure TEvento.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{8EC43371-7C1A-3423-91A0-2FE8F85C380E}';
    IntfIID:   '{AABE11FA-E91D-3565-A39D-16650680F844}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TEvento.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Evento;
  end;
end;

procedure TEvento.ConnectTo(svrIntf: _Evento);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TEvento.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TEvento.GetDefaultInterface: _Evento;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TEvento.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TEventoProperties.Create(Self);
{$ENDIF}
end;

destructor TEvento.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TEvento.GetServerProperties: TEventoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TEventoProperties.Create(AServer: TEvento);
begin
  inherited Create;
  FServer := AServer;
end;

function TEventoProperties.GetDefaultInterface: _Evento;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDisconnected.Create: _Disconnected;
begin
  Result := CreateComObject(CLASS_Disconnected) as _Disconnected;
end;

class function CoDisconnected.CreateRemote(const MachineName: string): _Disconnected;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Disconnected) as _Disconnected;
end;

class function CoBilhetesAbstract.Create: _BilhetesAbstract;
begin
  Result := CreateComObject(CLASS_BilhetesAbstract) as _BilhetesAbstract;
end;

class function CoBilhetesAbstract.CreateRemote(const MachineName: string): _BilhetesAbstract;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BilhetesAbstract) as _BilhetesAbstract;
end;

class function CoBilheteOnline.Create: _BilheteOnline;
begin
  Result := CreateComObject(CLASS_BilheteOnline) as _BilheteOnline;
end;

class function CoBilheteOnline.CreateRemote(const MachineName: string): _BilheteOnline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BilheteOnline) as _BilheteOnline;
end;

procedure TBilheteOnline.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{ADFAABA0-144C-3BBF-987C-28E3D3E5F89A}';
    IntfIID:   '{4CB2556E-91EA-3A30-BCC0-3CD57F25626B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBilheteOnline.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BilheteOnline;
  end;
end;

procedure TBilheteOnline.ConnectTo(svrIntf: _BilheteOnline);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBilheteOnline.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBilheteOnline.GetDefaultInterface: _BilheteOnline;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBilheteOnline.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBilheteOnlineProperties.Create(Self);
{$ENDIF}
end;

destructor TBilheteOnline.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBilheteOnline.GetServerProperties: TBilheteOnlineProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBilheteOnlineProperties.Create(AServer: TBilheteOnline);
begin
  inherited Create;
  FServer := AServer;
end;

function TBilheteOnlineProperties.GetDefaultInterface: _BilheteOnline;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoBilheteOfflinePadraoLivre.Create: _BilheteOfflinePadraoLivre;
begin
  Result := CreateComObject(CLASS_BilheteOfflinePadraoLivre) as _BilheteOfflinePadraoLivre;
end;

class function CoBilheteOfflinePadraoLivre.CreateRemote(const MachineName: string): _BilheteOfflinePadraoLivre;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BilheteOfflinePadraoLivre) as _BilheteOfflinePadraoLivre;
end;

procedure TBilheteOfflinePadraoLivre.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{1741B23C-581E-3D30-85C9-6129FB2225BD}';
    IntfIID:   '{DCED206C-7F2A-307E-9FA5-F622F5A17963}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBilheteOfflinePadraoLivre.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BilheteOfflinePadraoLivre;
  end;
end;

procedure TBilheteOfflinePadraoLivre.ConnectTo(svrIntf: _BilheteOfflinePadraoLivre);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBilheteOfflinePadraoLivre.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBilheteOfflinePadraoLivre.GetDefaultInterface: _BilheteOfflinePadraoLivre;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBilheteOfflinePadraoLivre.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBilheteOfflinePadraoLivreProperties.Create(Self);
{$ENDIF}
end;

destructor TBilheteOfflinePadraoLivre.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBilheteOfflinePadraoLivre.GetServerProperties: TBilheteOfflinePadraoLivreProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBilheteOfflinePadraoLivreProperties.Create(AServer: TBilheteOfflinePadraoLivre);
begin
  inherited Create;
  FServer := AServer;
end;

function TBilheteOfflinePadraoLivreProperties.GetDefaultInterface: _BilheteOfflinePadraoLivre;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoCollection.Create: _Collection;
begin
  Result := CreateComObject(CLASS_Collection) as _Collection;
end;

class function CoCollection.CreateRemote(const MachineName: string): _Collection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Collection) as _Collection;
end;

procedure TCollection.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{820208F0-F1D9-3DEE-922C-94DC748DAD48}';
    IntfIID:   '{C6FF684B-A39F-3202-AEB3-AA845328EC71}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCollection.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Collection;
  end;
end;

procedure TCollection.ConnectTo(svrIntf: _Collection);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCollection.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCollection.GetDefaultInterface: _Collection;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCollection.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCollectionProperties.Create(Self);
{$ENDIF}
end;

destructor TCollection.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCollection.GetServerProperties: TCollectionProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCollectionProperties.Create(AServer: TCollection);
begin
  inherited Create;
  FServer := AServer;
end;

function TCollectionProperties.GetDefaultInterface: _Collection;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoEstadoClienteAbstract.Create: _EstadoClienteAbstract;
begin
  Result := CreateComObject(CLASS_EstadoClienteAbstract) as _EstadoClienteAbstract;
end;

class function CoEstadoClienteAbstract.CreateRemote(const MachineName: string): _EstadoClienteAbstract;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EstadoClienteAbstract) as _EstadoClienteAbstract;
end;

class function CoTransmissao.Create: _Transmissao;
begin
  Result := CreateComObject(CLASS_Transmissao) as _Transmissao;
end;

class function CoTransmissao.CreateRemote(const MachineName: string): _Transmissao;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Transmissao) as _Transmissao;
end;

procedure TTransmissao.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E0E3EED6-8176-3801-B4F3-D3241FDC507E}';
    IntfIID:   '{BB8A7146-FC38-3EF8-9F54-B5393E5C227B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTransmissao.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Transmissao;
  end;
end;

procedure TTransmissao.ConnectTo(svrIntf: _Transmissao);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTransmissao.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTransmissao.GetDefaultInterface: _Transmissao;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTransmissao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTransmissaoProperties.Create(Self);
{$ENDIF}
end;

destructor TTransmissao.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTransmissao.GetServerProperties: TTransmissaoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTransmissaoProperties.Create(AServer: TTransmissao);
begin
  inherited Create;
  FServer := AServer;
end;

function TTransmissaoProperties.GetDefaultInterface: _Transmissao;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoConstante.Create: _Constante;
begin
  Result := CreateComObject(CLASS_Constante) as _Constante;
end;

class function CoConstante.CreateRemote(const MachineName: string): _Constante;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Constante) as _Constante;
end;

procedure TConstante.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{0C3435AB-2D60-3036-A75A-B81C59D456F2}';
    IntfIID:   '{D9493F50-6101-37D1-B369-B4062DFC7243}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TConstante.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Constante;
  end;
end;

procedure TConstante.ConnectTo(svrIntf: _Constante);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TConstante.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TConstante.GetDefaultInterface: _Constante;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TConstante.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TConstanteProperties.Create(Self);
{$ENDIF}
end;

destructor TConstante.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TConstante.GetServerProperties: TConstanteProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TConstanteProperties.Create(AServer: TConstante);
begin
  inherited Create;
  FServer := AServer;
end;

function TConstanteProperties.GetDefaultInterface: _Constante;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTicket.Create: _Ticket;
begin
  Result := CreateComObject(CLASS_Ticket) as _Ticket;
end;

class function CoTicket.CreateRemote(const MachineName: string): _Ticket;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Ticket) as _Ticket;
end;

class function CoInnerClient.Create: _InnerClient;
begin
  Result := CreateComObject(CLASS_InnerClient) as _InnerClient;
end;

class function CoInnerClient.CreateRemote(const MachineName: string): _InnerClient;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InnerClient) as _InnerClient;
end;

procedure TInnerClient.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{80934EF1-9FBE-32B2-9322-E83B7A6ABDBA}';
    IntfIID:   '{91C89757-FB68-3EFC-BA00-3FEEC922E797}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TInnerClient.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _InnerClient;
  end;
end;

procedure TInnerClient.ConnectTo(svrIntf: _InnerClient);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TInnerClient.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TInnerClient.GetDefaultInterface: _InnerClient;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TInnerClient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TInnerClientProperties.Create(Self);
{$ENDIF}
end;

destructor TInnerClient.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TInnerClient.GetServerProperties: TInnerClientProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TInnerClientProperties.Create(AServer: TInnerClient);
begin
  inherited Create;
  FServer := AServer;
end;

function TInnerClientProperties.GetDefaultInterface: _InnerClient;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTipoDados.Create: _TipoDados;
begin
  Result := CreateComObject(CLASS_TipoDados) as _TipoDados;
end;

class function CoTipoDados.CreateRemote(const MachineName: string): _TipoDados;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TipoDados) as _TipoDados;
end;

procedure TTipoDados.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D6E991AE-E905-3A2C-B56C-08D524595687}';
    IntfIID:   '{BEB54F5D-E239-3FAC-8DE2-FAF226846022}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTipoDados.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TipoDados;
  end;
end;

procedure TTipoDados.ConnectTo(svrIntf: _TipoDados);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTipoDados.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTipoDados.GetDefaultInterface: _TipoDados;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTipoDados.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTipoDadosProperties.Create(Self);
{$ENDIF}
end;

destructor TTipoDados.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTipoDados.GetServerProperties: TTipoDadosProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTipoDadosProperties.Create(AServer: TTipoDados);
begin
  inherited Create;
  FServer := AServer;
end;

function TTipoDadosProperties.GetDefaultInterface: _TipoDados;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoRecepcao.Create: _Recepcao;
begin
  Result := CreateComObject(CLASS_Recepcao) as _Recepcao;
end;

class function CoRecepcao.CreateRemote(const MachineName: string): _Recepcao;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Recepcao) as _Recepcao;
end;

procedure TRecepcao.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C7DF062E-87A3-3FAE-BB95-7BF0CAF1DBA3}';
    IntfIID:   '{2FA807FC-33D4-3E6D-AE5A-F1B35976ACDB}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TRecepcao.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Recepcao;
  end;
end;

procedure TRecepcao.ConnectTo(svrIntf: _Recepcao);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TRecepcao.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TRecepcao.GetDefaultInterface: _Recepcao;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TRecepcao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TRecepcaoProperties.Create(Self);
{$ENDIF}
end;

destructor TRecepcao.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TRecepcao.GetServerProperties: TRecepcaoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TRecepcaoProperties.Create(AServer: TRecepcao);
begin
  inherited Create;
  FServer := AServer;
end;

function TRecepcaoProperties.GetDefaultInterface: _Recepcao;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoAck.Create: _Ack;
begin
  Result := CreateComObject(CLASS_Ack) as _Ack;
end;

class function CoAck.CreateRemote(const MachineName: string): _Ack;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Ack) as _Ack;
end;

class function CoBilheteOfflinePadraoTopdata.Create: _BilheteOfflinePadraoTopdata;
begin
  Result := CreateComObject(CLASS_BilheteOfflinePadraoTopdata) as _BilheteOfflinePadraoTopdata;
end;

class function CoBilheteOfflinePadraoTopdata.CreateRemote(const MachineName: string): _BilheteOfflinePadraoTopdata;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BilheteOfflinePadraoTopdata) as _BilheteOfflinePadraoTopdata;
end;

procedure TBilheteOfflinePadraoTopdata.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{9600E33C-1662-3893-A367-AAE6558D38A1}';
    IntfIID:   '{580B05A8-E906-3359-BE29-2DE4AE9F66EC}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TBilheteOfflinePadraoTopdata.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _BilheteOfflinePadraoTopdata;
  end;
end;

procedure TBilheteOfflinePadraoTopdata.ConnectTo(svrIntf: _BilheteOfflinePadraoTopdata);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TBilheteOfflinePadraoTopdata.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TBilheteOfflinePadraoTopdata.GetDefaultInterface: _BilheteOfflinePadraoTopdata;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TBilheteOfflinePadraoTopdata.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TBilheteOfflinePadraoTopdataProperties.Create(Self);
{$ENDIF}
end;

destructor TBilheteOfflinePadraoTopdata.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TBilheteOfflinePadraoTopdata.GetServerProperties: TBilheteOfflinePadraoTopdataProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TBilheteOfflinePadraoTopdataProperties.Create(AServer: TBilheteOfflinePadraoTopdata);
begin
  inherited Create;
  FServer := AServer;
end;

function TBilheteOfflinePadraoTopdataProperties.GetDefaultInterface: _BilheteOfflinePadraoTopdata;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoConnected.Create: _Connected;
begin
  Result := CreateComObject(CLASS_Connected) as _Connected;
end;

class function CoConnected.CreateRemote(const MachineName: string): _Connected;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Connected) as _Connected;
end;

class function CoInnerClientConexao.Create: _InnerClientConexao;
begin
  Result := CreateComObject(CLASS_InnerClientConexao) as _InnerClientConexao;
end;

class function CoInnerClientConexao.CreateRemote(const MachineName: string): _InnerClientConexao;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InnerClientConexao) as _InnerClientConexao;
end;

procedure TInnerClientConexao.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3DE7DA6A-048C-3B23-B77F-9FE9EB46C4B4}';
    IntfIID:   '{DF9BB9AF-6918-3091-851B-3711F6D8A50B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TInnerClientConexao.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _InnerClientConexao;
  end;
end;

procedure TInnerClientConexao.ConnectTo(svrIntf: _InnerClientConexao);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TInnerClientConexao.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TInnerClientConexao.GetDefaultInterface: _InnerClientConexao;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TInnerClientConexao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TInnerClientConexaoProperties.Create(Self);
{$ENDIF}
end;

destructor TInnerClientConexao.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TInnerClientConexao.GetServerProperties: TInnerClientConexaoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TInnerClientConexaoProperties.Create(AServer: TInnerClientConexao);
begin
  inherited Create;
  FServer := AServer;
end;

function TInnerClientConexaoProperties.GetDefaultInterface: _InnerClientConexao;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTratadorDeDados.Create: _TratadorDeDados;
begin
  Result := CreateComObject(CLASS_TratadorDeDados) as _TratadorDeDados;
end;

class function CoTratadorDeDados.CreateRemote(const MachineName: string): _TratadorDeDados;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TratadorDeDados) as _TratadorDeDados;
end;

procedure TTratadorDeDados.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{603B451E-6BD1-3ACA-87B0-7EE3141BF9CD}';
    IntfIID:   '{8A6DC707-582C-3BBD-A11B-C07F4A40E8A6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTratadorDeDados.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TratadorDeDados;
  end;
end;

procedure TTratadorDeDados.ConnectTo(svrIntf: _TratadorDeDados);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTratadorDeDados.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTratadorDeDados.GetDefaultInterface: _TratadorDeDados;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTratadorDeDados.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTratadorDeDadosProperties.Create(Self);
{$ENDIF}
end;

destructor TTratadorDeDados.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTratadorDeDados.GetServerProperties: TTratadorDeDadosProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTratadorDeDadosProperties.Create(AServer: TTratadorDeDados);
begin
  inherited Create;
  FServer := AServer;
end;

function TTratadorDeDadosProperties.GetDefaultInterface: _TratadorDeDados;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTipoAck.Create: _TipoAck;
begin
  Result := CreateComObject(CLASS_TipoAck) as _TipoAck;
end;

class function CoTipoAck.CreateRemote(const MachineName: string): _TipoAck;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TipoAck) as _TipoAck;
end;

procedure TTipoAck.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{FDA3A8D5-B5F7-3F63-8F24-53B08358EA9E}';
    IntfIID:   '{7461CD76-2BD6-3881-9B8B-E670A8959C43}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTipoAck.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TipoAck;
  end;
end;

procedure TTipoAck.ConnectTo(svrIntf: _TipoAck);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTipoAck.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTipoAck.GetDefaultInterface: _TipoAck;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTipoAck.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTipoAckProperties.Create(Self);
{$ENDIF}
end;

destructor TTipoAck.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTipoAck.GetServerProperties: TTipoAckProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTipoAckProperties.Create(AServer: TTipoAck);
begin
  inherited Create;
  FServer := AServer;
end;

function TTipoAckProperties.GetDefaultInterface: _TipoAck;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoEventoAck.Create: _EventoAck;
begin
  Result := CreateComObject(CLASS_EventoAck) as _EventoAck;
end;

class function CoEventoAck.CreateRemote(const MachineName: string): _EventoAck;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EventoAck) as _EventoAck;
end;

procedure TEventoAck.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{19FDDACD-E5C4-3410-BA3B-DBBBBE861D5E}';
    IntfIID:   '{6408C966-D774-3FFA-83F7-6B314FBF502E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TEventoAck.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _EventoAck;
  end;
end;

procedure TEventoAck.ConnectTo(svrIntf: _EventoAck);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TEventoAck.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TEventoAck.GetDefaultInterface: _EventoAck;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TEventoAck.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TEventoAckProperties.Create(Self);
{$ENDIF}
end;

destructor TEventoAck.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TEventoAck.GetServerProperties: TEventoAckProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TEventoAckProperties.Create(AServer: TEventoAck);
begin
  inherited Create;
  FServer := AServer;
end;

function TEventoAckProperties.GetDefaultInterface: _EventoAck;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoNack.Create: _Nack;
begin
  Result := CreateComObject(CLASS_Nack) as _Nack;
end;

class function CoNack.CreateRemote(const MachineName: string): _Nack;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Nack) as _Nack;
end;

class function CoPronto.Create: _Pronto;
begin
  Result := CreateComObject(CLASS_Pronto) as _Pronto;
end;

class function CoPronto.CreateRemote(const MachineName: string): _Pronto;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Pronto) as _Pronto;
end;

procedure TPronto.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{BB69F368-0583-35B8-926B-C49CBC2C8A82}';
    IntfIID:   '{2AE7685E-B061-3FA9-8522-89EF064D7C92}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPronto.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Pronto;
  end;
end;

procedure TPronto.ConnectTo(svrIntf: _Pronto);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPronto.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPronto.GetDefaultInterface: _Pronto;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TPronto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TProntoProperties.Create(Self);
{$ENDIF}
end;

destructor TPronto.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPronto.GetServerProperties: TProntoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TProntoProperties.Create(AServer: TPronto);
begin
  inherited Create;
  FServer := AServer;
end;

function TProntoProperties.GetDefaultInterface: _Pronto;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoPacoteTCPCliente.Create: _PacoteTCPCliente;
begin
  Result := CreateComObject(CLASS_PacoteTCPCliente) as _PacoteTCPCliente;
end;

class function CoPacoteTCPCliente.CreateRemote(const MachineName: string): _PacoteTCPCliente;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PacoteTCPCliente) as _PacoteTCPCliente;
end;

procedure TPacoteTCPCliente.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{3941828F-DE7E-3E8C-8ABA-DD234064C0BA}';
    IntfIID:   '{FCB74C73-D790-3F87-AFE4-F495233D1D89}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TPacoteTCPCliente.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _PacoteTCPCliente;
  end;
end;

procedure TPacoteTCPCliente.ConnectTo(svrIntf: _PacoteTCPCliente);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TPacoteTCPCliente.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TPacoteTCPCliente.GetDefaultInterface: _PacoteTCPCliente;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TPacoteTCPCliente.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TPacoteTCPClienteProperties.Create(Self);
{$ENDIF}
end;

destructor TPacoteTCPCliente.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TPacoteTCPCliente.GetServerProperties: TPacoteTCPClienteProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TPacoteTCPClienteProperties.Create(AServer: TPacoteTCPCliente);
begin
  inherited Create;
  FServer := AServer;
end;

function TPacoteTCPClienteProperties.GetDefaultInterface: _PacoteTCPCliente;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTipoLongAck.Create: _TipoLongAck;
begin
  Result := CreateComObject(CLASS_TipoLongAck) as _TipoLongAck;
end;

class function CoTipoLongAck.CreateRemote(const MachineName: string): _TipoLongAck;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TipoLongAck) as _TipoLongAck;
end;

procedure TTipoLongAck.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F9579A9B-982B-3CC7-985E-2473112F2CEA}';
    IntfIID:   '{D3988AD8-254C-35CA-9C14-A25F0F710BF7}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTipoLongAck.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TipoLongAck;
  end;
end;

procedure TTipoLongAck.ConnectTo(svrIntf: _TipoLongAck);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTipoLongAck.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTipoLongAck.GetDefaultInterface: _TipoLongAck;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTipoLongAck.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTipoLongAckProperties.Create(Self);
{$ENDIF}
end;

destructor TTipoLongAck.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTipoLongAck.GetServerProperties: TTipoLongAckProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTipoLongAckProperties.Create(AServer: TTipoLongAck);
begin
  inherited Create;
  FServer := AServer;
end;

function TTipoLongAckProperties.GetDefaultInterface: _TipoLongAck;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoCollectionClients.Create: _CollectionClients;
begin
  Result := CreateComObject(CLASS_CollectionClients) as _CollectionClients;
end;

class function CoCollectionClients.CreateRemote(const MachineName: string): _CollectionClients;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CollectionClients) as _CollectionClients;
end;

procedure TCollectionClients.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{5F551603-8756-332F-A4A0-2B7AA1FB7ABE}';
    IntfIID:   '{A364FF67-A2A4-32C8-BE0D-E4266B2E08B5}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCollectionClients.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _CollectionClients;
  end;
end;

procedure TCollectionClients.ConnectTo(svrIntf: _CollectionClients);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCollectionClients.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCollectionClients.GetDefaultInterface: _CollectionClients;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCollectionClients.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCollectionClientsProperties.Create(Self);
{$ENDIF}
end;

destructor TCollectionClients.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCollectionClients.GetServerProperties: TCollectionClientsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCollectionClientsProperties.Create(AServer: TCollectionClients);
begin
  inherited Create;
  FServer := AServer;
end;

function TCollectionClientsProperties.GetDefaultInterface: _CollectionClients;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoLog.Create: _Log;
begin
  Result := CreateComObject(CLASS_Log) as _Log;
end;

class function CoLog.CreateRemote(const MachineName: string): _Log;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Log) as _Log;
end;

class function CoAguardandoDefinicao.Create: _AguardandoDefinicao;
begin
  Result := CreateComObject(CLASS_AguardandoDefinicao) as _AguardandoDefinicao;
end;

class function CoAguardandoDefinicao.CreateRemote(const MachineName: string): _AguardandoDefinicao;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AguardandoDefinicao) as _AguardandoDefinicao;
end;

procedure TAguardandoDefinicao.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{2E65D52F-B288-3CE7-A6FF-0FBE61C451BD}';
    IntfIID:   '{6F9AC085-2F66-3833-A5A3-24A1F62A72FA}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAguardandoDefinicao.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _AguardandoDefinicao;
  end;
end;

procedure TAguardandoDefinicao.ConnectTo(svrIntf: _AguardandoDefinicao);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAguardandoDefinicao.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAguardandoDefinicao.GetDefaultInterface: _AguardandoDefinicao;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAguardandoDefinicao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAguardandoDefinicaoProperties.Create(Self);
{$ENDIF}
end;

destructor TAguardandoDefinicao.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAguardandoDefinicao.GetServerProperties: TAguardandoDefinicaoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAguardandoDefinicaoProperties.Create(AServer: TAguardandoDefinicao);
begin
  inherited Create;
  FServer := AServer;
end;

function TAguardandoDefinicaoProperties.GetDefaultInterface: _AguardandoDefinicao;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoCollectionClient.Create: _CollectionClient;
begin
  Result := CreateComObject(CLASS_CollectionClient) as _CollectionClient;
end;

class function CoCollectionClient.CreateRemote(const MachineName: string): _CollectionClient;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CollectionClient) as _CollectionClient;
end;

procedure TCollectionClient.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{8FA73CE3-ABA3-3AEC-9CAF-E4F9D365B18B}';
    IntfIID:   '{9680DF65-AB35-3924-B37A-B30A3DAB15F1}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCollectionClient.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _CollectionClient;
  end;
end;

procedure TCollectionClient.ConnectTo(svrIntf: _CollectionClient);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCollectionClient.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCollectionClient.GetDefaultInterface: _CollectionClient;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCollectionClient.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCollectionClientProperties.Create(Self);
{$ENDIF}
end;

destructor TCollectionClient.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCollectionClient.GetServerProperties: TCollectionClientProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCollectionClientProperties.Create(AServer: TCollectionClient);
begin
  inherited Create;
  FServer := AServer;
end;

function TCollectionClientProperties.GetDefaultInterface: _CollectionClient;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoData.Create: _Data;
begin
  Result := CreateComObject(CLASS_Data) as _Data;
end;

class function CoData.CreateRemote(const MachineName: string): _Data;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Data) as _Data;
end;

class function CoTimeoutInner.Create: _TimeoutInner;
begin
  Result := CreateComObject(CLASS_TimeoutInner) as _TimeoutInner;
end;

class function CoTimeoutInner.CreateRemote(const MachineName: string): _TimeoutInner;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TimeoutInner) as _TimeoutInner;
end;

class function CoInnerListener.Create: _InnerListener;
begin
  Result := CreateComObject(CLASS_InnerListener) as _InnerListener;
end;

class function CoInnerListener.CreateRemote(const MachineName: string): _InnerListener;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_InnerListener) as _InnerListener;
end;

procedure TInnerListener.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{EE1E6D9E-503F-3937-A1C9-EA3272CE9D3B}';
    IntfIID:   '{6C4BF5ED-4455-37D3-BCCD-5E0E57812353}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TInnerListener.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _InnerListener;
  end;
end;

procedure TInnerListener.ConnectTo(svrIntf: _InnerListener);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TInnerListener.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TInnerListener.GetDefaultInterface: _InnerListener;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TInnerListener.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TInnerListenerProperties.Create(Self);
{$ENDIF}
end;

destructor TInnerListener.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TInnerListener.GetServerProperties: TInnerListenerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TInnerListenerProperties.Create(AServer: TInnerListener);
begin
  inherited Create;
  FServer := AServer;
end;

function TInnerListenerProperties.GetDefaultInterface: _InnerListener;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoCriado.Create: _Criado;
begin
  Result := CreateComObject(CLASS_Criado) as _Criado;
end;

class function CoCriado.CreateRemote(const MachineName: string): _Criado;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Criado) as _Criado;
end;

procedure TCriado.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{48BB3B0C-3D68-3D35-A03F-0E54E1EBB1B3}';
    IntfIID:   '{7F6A6779-D999-34B8-8CA7-2F8250FBB996}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TCriado.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Criado;
  end;
end;

procedure TCriado.ConnectTo(svrIntf: _Criado);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TCriado.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TCriado.GetDefaultInterface: _Criado;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TCriado.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TCriadoProperties.Create(Self);
{$ENDIF}
end;

destructor TCriado.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TCriado.GetServerProperties: TCriadoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TCriadoProperties.Create(AServer: TCriado);
begin
  inherited Create;
  FServer := AServer;
end;

function TCriadoProperties.GetDefaultInterface: _Criado;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoDelAck.Create: _DelAck;
begin
  Result := CreateComObject(CLASS_DelAck) as _DelAck;
end;

class function CoDelAck.CreateRemote(const MachineName: string): _DelAck;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelAck) as _DelAck;
end;

class function CoDelConnected.Create: _DelConnected;
begin
  Result := CreateComObject(CLASS_DelConnected) as _DelConnected;
end;

class function CoDelConnected.CreateRemote(const MachineName: string): _DelConnected;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelConnected) as _DelConnected;
end;

class function CoDelData.Create: _DelData;
begin
  Result := CreateComObject(CLASS_DelData) as _DelData;
end;

class function CoDelData.CreateRemote(const MachineName: string): _DelData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelData) as _DelData;
end;

class function CoDelTicket.Create: _DelTicket;
begin
  Result := CreateComObject(CLASS_DelTicket) as _DelTicket;
end;

class function CoDelTicket.CreateRemote(const MachineName: string): _DelTicket;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelTicket) as _DelTicket;
end;

class function CoDelDisconnected.Create: _DelDisconnected;
begin
  Result := CreateComObject(CLASS_DelDisconnected) as _DelDisconnected;
end;

class function CoDelDisconnected.CreateRemote(const MachineName: string): _DelDisconnected;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelDisconnected) as _DelDisconnected;
end;

class function CoDelNack.Create: _DelNack;
begin
  Result := CreateComObject(CLASS_DelNack) as _DelNack;
end;

class function CoDelNack.CreateRemote(const MachineName: string): _DelNack;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelNack) as _DelNack;
end;

class function CoDelTimeout.Create: _DelTimeout;
begin
  Result := CreateComObject(CLASS_DelTimeout) as _DelTimeout;
end;

class function CoDelTimeout.CreateRemote(const MachineName: string): _DelTimeout;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelTimeout) as _DelTimeout;
end;

class function CoDelTicketJava.Create: _DelTicketJava;
begin
  Result := CreateComObject(CLASS_DelTicketJava) as _DelTicketJava;
end;

class function CoDelTicketJava.CreateRemote(const MachineName: string): _DelTicketJava;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelTicketJava) as _DelTicketJava;
end;

class function CoDelDataJava.Create: _DelDataJava;
begin
  Result := CreateComObject(CLASS_DelDataJava) as _DelDataJava;
end;

class function CoDelDataJava.CreateRemote(const MachineName: string): _DelDataJava;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DelDataJava) as _DelDataJava;
end;

class function CoEquipamento.Create: _Equipamento;
begin
  Result := CreateComObject(CLASS_Equipamento) as _Equipamento;
end;

class function CoEquipamento.CreateRemote(const MachineName: string): _Equipamento;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Equipamento) as _Equipamento;
end;

procedure TEquipamento.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C76F03EB-91C1-36BC-A4DD-ACA31921005D}';
    IntfIID:   '{0CF35E24-2732-3283-A725-B4856A6E0C83}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TEquipamento.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Equipamento;
  end;
end;

procedure TEquipamento.ConnectTo(svrIntf: _Equipamento);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TEquipamento.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TEquipamento.GetDefaultInterface: _Equipamento;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TEquipamento.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TEquipamentoProperties.Create(Self);
{$ENDIF}
end;

destructor TEquipamento.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TEquipamento.GetServerProperties: TEquipamentoProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TEquipamentoProperties.Create(AServer: TEquipamento);
begin
  inherited Create;
  FServer := AServer;
end;

function TEquipamentoProperties.GetDefaultInterface: _Equipamento;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoAssincronaInterface.Create: _AssincronaInterface;
begin
  Result := CreateComObject(CLASS_AssincronaInterface) as _AssincronaInterface;
end;

class function CoAssincronaInterface.CreateRemote(const MachineName: string): _AssincronaInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AssincronaInterface) as _AssincronaInterface;
end;

procedure TAssincronaInterface.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{2A4528AD-04DA-38F8-9398-FE34D29EC96A}';
    IntfIID:   '{14372D76-9557-3370-9955-F46B5DA3F860}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TAssincronaInterface.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _AssincronaInterface;
  end;
end;

procedure TAssincronaInterface.ConnectTo(svrIntf: _AssincronaInterface);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TAssincronaInterface.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TAssincronaInterface.GetDefaultInterface: _AssincronaInterface;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TAssincronaInterface.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TAssincronaInterfaceProperties.Create(Self);
{$ENDIF}
end;

destructor TAssincronaInterface.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TAssincronaInterface.GetServerProperties: TAssincronaInterfaceProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TAssincronaInterfaceProperties.Create(AServer: TAssincronaInterface);
begin
  inherited Create;
  FServer := AServer;
end;

function TAssincronaInterfaceProperties.GetDefaultInterface: _AssincronaInterface;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoObservarLog.Create: _ObservarLog;
begin
  Result := CreateComObject(CLASS_ObservarLog) as _ObservarLog;
end;

class function CoObservarLog.CreateRemote(const MachineName: string): _ObservarLog;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObservarLog) as _ObservarLog;
end;

procedure TObservarLog.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{739C051D-AC1C-3DE2-B766-DB2935AB5569}';
    IntfIID:   '{2F0080B4-2BAD-3322-BC64-9AF7B632D647}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TObservarLog.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _ObservarLog;
  end;
end;

procedure TObservarLog.ConnectTo(svrIntf: _ObservarLog);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TObservarLog.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TObservarLog.GetDefaultInterface: _ObservarLog;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TObservarLog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TObservarLogProperties.Create(Self);
{$ENDIF}
end;

destructor TObservarLog.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TObservarLog.GetServerProperties: TObservarLogProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TObservarLogProperties.Create(AServer: TObservarLog);
begin
  inherited Create;
  FServer := AServer;
end;

function TObservarLogProperties.GetDefaultInterface: _ObservarLog;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoTipoNack.Create: _TipoNack;
begin
  Result := CreateComObject(CLASS_TipoNack) as _TipoNack;
end;

class function CoTipoNack.CreateRemote(const MachineName: string): _TipoNack;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TipoNack) as _TipoNack;
end;

procedure TTipoNack.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{5C71BAED-6798-317B-AF46-78CB6ED188A9}';
    IntfIID:   '{96D4E1AA-4857-3BD1-9493-E27ADDEC07F3}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TTipoNack.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _TipoNack;
  end;
end;

procedure TTipoNack.ConnectTo(svrIntf: _TipoNack);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TTipoNack.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TTipoNack.GetDefaultInterface: _TipoNack;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TTipoNack.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TTipoNackProperties.Create(Self);
{$ENDIF}
end;

destructor TTipoNack.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TTipoNack.GetServerProperties: TTipoNackProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TTipoNackProperties.Create(AServer: TTipoNack);
begin
  inherited Create;
  FServer := AServer;
end;

function TTipoNackProperties.GetDefaultInterface: _TipoNack;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoUtils.Create: _Utils;
begin
  Result := CreateComObject(CLASS_Utils) as _Utils;
end;

class function CoUtils.CreateRemote(const MachineName: string): _Utils;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Utils) as _Utils;
end;

procedure TUtils.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{D755D366-50B2-38CD-B5A9-355244DF96D0}';
    IntfIID:   '{744017E0-A793-377D-9FBD-06A134644126}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TUtils.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Utils;
  end;
end;

procedure TUtils.ConnectTo(svrIntf: _Utils);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TUtils.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TUtils.GetDefaultInterface: _Utils;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TUtils.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TUtilsProperties.Create(Self);
{$ENDIF}
end;

destructor TUtils.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TUtils.GetServerProperties: TUtilsProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TUtilsProperties.Create(AServer: TUtils);
begin
  inherited Create;
  FServer := AServer;
end;

function TUtilsProperties.GetDefaultInterface: _Utils;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoConfiguracoes.Create: _Configuracoes;
begin
  Result := CreateComObject(CLASS_Configuracoes) as _Configuracoes;
end;

class function CoConfiguracoes.CreateRemote(const MachineName: string): _Configuracoes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Configuracoes) as _Configuracoes;
end;

procedure TConfiguracoes.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{EDEE2617-A7E8-37BD-9636-9D25D833CFEC}';
    IntfIID:   '{633E9DE2-8A3B-328A-940F-980751C40372}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TConfiguracoes.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as _Configuracoes;
  end;
end;

procedure TConfiguracoes.ConnectTo(svrIntf: _Configuracoes);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TConfiguracoes.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TConfiguracoes.GetDefaultInterface: _Configuracoes;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TConfiguracoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TConfiguracoesProperties.Create(Self);
{$ENDIF}
end;

destructor TConfiguracoes.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TConfiguracoes.GetServerProperties: TConfiguracoesProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TConfiguracoesProperties.Create(AServer: TConfiguracoes);
begin
  inherited Create;
  FServer := AServer;
end;

function TConfiguracoesProperties.GetDefaultInterface: _Configuracoes;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TBlockingInterface, TInnerInterface, TRespostaInner, TEvento, 
    TBilheteOnline, TBilheteOfflinePadraoLivre, TCollection, TTransmissao, TConstante, 
    TInnerClient, TTipoDados, TRecepcao, TBilheteOfflinePadraoTopdata, TInnerClientConexao, 
    TTratadorDeDados, TTipoAck, TEventoAck, TPronto, TPacoteTCPCliente, 
    TTipoLongAck, TCollectionClients, TAguardandoDefinicao, TCollectionClient, TInnerListener, 
    TCriado, TEquipamento, TAssincronaInterface, TObservarLog, TTipoNack, 
    TUtils, TConfiguracoes]);
end;

end.
