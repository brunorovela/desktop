unit NBioBSPCOMLib_TLB;

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

// $Rev: 52393 $
// File generated on 10/08/2015 14:42:09 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Arquivos de programas\Topdata\SDK Inner Rep\DLLs\NBioBSPCOM.dll (1)
// LIBID: {A4B390F0-7679-46BD-80ED-82366FCF023D}
// LCID: 0
// Helpfile: 
// HelpString: NITGEN's NBioBSP SDK v4.77 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Error creating palette bitmap of (TNBioBSP) : Server C:\Arquivos de programas\Topdata\SDK Inner Rep\DLLs\NBioBSPCOM.dll contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
//{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Windows, Classes, Variants, StdVCL, Graphics, OleServer, ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  NBioBSPCOMLibMajorVersion = 1;
  NBioBSPCOMLibMinorVersion = 0;

  LIBID_NBioBSPCOMLib: TGUID = '{A4B390F0-7679-46BD-80ED-82366FCF023D}';

  DIID__INBioBSPEvents: TGUID = '{E9E0119B-AB00-41CE-B176-F382DF81A052}';
  IID_INBioBSP: TGUID = '{4511B19F-37BC-437B-B18E-2106A9AF7083}';
  CLASS_NBioBSP: TGUID = '{F66B9251-67CA-4D78-90A3-28C2BFAE89BF}';
  IID_IDevice: TGUID = '{5CE7E823-C269-415A-9F05-7593540AB065}';
  IID_IExtraction: TGUID = '{FB907640-E03F-4B58-AA0C-2699F3F64445}';
  IID_IMatching: TGUID = '{51C9F6C0-FE11-42E2-B0FD-32287D33FDAC}';
  IID_IFPData: TGUID = '{580CD79B-5BAF-487A-BE70-C1CFE1EA2ECC}';
  IID_IFPImage: TGUID = '{48CBE6EB-D40F-4CF8-9BFD-E368225E8E0E}';
  IID_INSearch: TGUID = '{78141587-F586-4541-BC01-D6F7D7224A88}';
  IID_ICandidateList: TGUID = '{8219FA9D-78B9-4E1F-A300-4BC6ECB38AF9}';
  IID_IIndexSearch: TGUID = '{3E4D5091-3C8E-4F1C-977B-2B90EF1F9A18}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _INBioBSPEvents = dispinterface;
  INBioBSP = interface;
  INBioBSPDisp = dispinterface;
  IDevice = interface;
  IDeviceDisp = dispinterface;
  IExtraction = interface;
  IExtractionDisp = dispinterface;
  IMatching = interface;
  IMatchingDisp = dispinterface;
  IFPData = interface;
  IFPDataDisp = dispinterface;
  IFPImage = interface;
  IFPImageDisp = dispinterface;
  INSearch = interface;
  INSearchDisp = dispinterface;
  ICandidateList = interface;
  ICandidateListDisp = dispinterface;
  IIndexSearch = interface;
  IIndexSearchDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  NBioBSP = INBioBSP;


// *********************************************************************//
// DispIntf:  _INBioBSPEvents
// Flags:     (4096) Dispatchable
// GUID:      {E9E0119B-AB00-41CE-B176-F382DF81A052}
// *********************************************************************//
  _INBioBSPEvents = dispinterface
    ['{E9E0119B-AB00-41CE-B176-F382DF81A052}']
    function OnEnrollEvent(EventID: Integer): HResult; dispid 1;
    function OnCaptureEvent(Quality: Integer): HResult; dispid 2;
  end;

// *********************************************************************//
// Interface: INBioBSP
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4511B19F-37BC-437B-B18E-2106A9AF7083}
// *********************************************************************//
  INBioBSP = interface(IDispatch)
    ['{4511B19F-37BC-437B-B18E-2106A9AF7083}']
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_Device: OleVariant; safecall;
    function Get_Extraction: OleVariant; safecall;
    function Get_Matching: OleVariant; safecall;
    function Get_FPData: OleVariant; safecall;
    function Get_FPImage: OleVariant; safecall;
    function Get_NSearch: OleVariant; safecall;
    function Get_CheckValidityModule: Integer; safecall;
    function Get_MajorVersion: WideString; safecall;
    function Get_MinorVersion: WideString; safecall;
    function Get_BuildNumber: WideString; safecall;
    procedure SetSkinResource(const bszSkinPath: WideString); safecall;
    function Get_IndexSearch: OleVariant; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property Device: OleVariant read Get_Device;
    property Extraction: OleVariant read Get_Extraction;
    property Matching: OleVariant read Get_Matching;
    property FPData: OleVariant read Get_FPData;
    property FPImage: OleVariant read Get_FPImage;
    property NSearch: OleVariant read Get_NSearch;
    property CheckValidityModule: Integer read Get_CheckValidityModule;
    property MajorVersion: WideString read Get_MajorVersion;
    property MinorVersion: WideString read Get_MinorVersion;
    property BuildNumber: WideString read Get_BuildNumber;
    property IndexSearch: OleVariant read Get_IndexSearch;
  end;

// *********************************************************************//
// DispIntf:  INBioBSPDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4511B19F-37BC-437B-B18E-2106A9AF7083}
// *********************************************************************//
  INBioBSPDisp = dispinterface
    ['{4511B19F-37BC-437B-B18E-2106A9AF7083}']
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property Device: OleVariant readonly dispid 3;
    property Extraction: OleVariant readonly dispid 4;
    property Matching: OleVariant readonly dispid 5;
    property FPData: OleVariant readonly dispid 6;
    property FPImage: OleVariant readonly dispid 7;
    property NSearch: OleVariant readonly dispid 8;
    property CheckValidityModule: Integer readonly dispid 9;
    property MajorVersion: WideString readonly dispid 10;
    property MinorVersion: WideString readonly dispid 11;
    property BuildNumber: WideString readonly dispid 12;
    procedure SetSkinResource(const bszSkinPath: WideString); dispid 13;
    property IndexSearch: OleVariant readonly dispid 14;
  end;

// *********************************************************************//
// Interface: IDevice
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5CE7E823-C269-415A-9F05-7593540AB065}
// *********************************************************************//
  IDevice = interface(IDispatch)
    ['{5CE7E823-C269-415A-9F05-7593540AB065}']
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_EnumCount: Integer; safecall;
    function Get_EnumDeviceID(nIndex: Integer): Integer; safecall;
    function Get_OpenedDeviceID: Integer; safecall;
    function Get_GetDeviceName(nDeviceID: Integer): Integer; safecall;
    function Get_GetDeviceNumber(nDeviceID: Integer): Integer; safecall;
    function Get_MakeDeviceID(nDeviceName: Integer; nDeviceNumber: Integer): Integer; safecall;
    function Get_ImageWidth(nDeviceID: Integer): Integer; safecall;
    function Get_ImageHeight(nDeviceID: Integer): Integer; safecall;
    function Get_Brightness(nDeviceID: Integer): Integer; safecall;
    procedure Set_Brightness(nDeviceID: Integer; pVal: Integer); safecall;
    function Get_Contrast(nDeviceID: Integer): Integer; safecall;
    procedure Set_Contrast(nDeviceID: Integer; pVal: Integer); safecall;
    function Get_Gain(nDeviceID: Integer): Integer; safecall;
    procedure Set_Gain(nDeviceID: Integer; pVal: Integer); safecall;
    function Get_WindowStyle: Integer; safecall;
    procedure Set_WindowStyle(pVal: Integer); safecall;
    function Get_WindowOption(nOption: Integer): Integer; safecall;
    procedure Set_WindowOption(nOption: Integer; pVal: Integer); safecall;
    function Get_ParentWnd: Integer; safecall;
    procedure Set_ParentWnd(pVal: Integer); safecall;
    function Get_FingerWnd: Integer; safecall;
    procedure Set_FingerWnd(pVal: Integer); safecall;
    function Get_CaptionMsg: WideString; safecall;
    procedure Set_CaptionMsg(const pVal: WideString); safecall;
    function Get_CancelMsg: WideString; safecall;
    procedure Set_CancelMsg(const pVal: WideString); safecall;
    function Get_FPForeColor: WideString; safecall;
    procedure Set_FPForeColor(const pVal: WideString); safecall;
    function Get_FPBackColor: WideString; safecall;
    procedure Set_FPBackColor(const pVal: WideString); safecall;
    function Get_DisableFingerForEnroll(nFingerID: Integer): Integer; safecall;
    procedure Set_DisableFingerForEnroll(nFingerID: Integer; pVal: Integer); safecall;
    procedure Open(nDeviceID: Integer); safecall;
    procedure Close(nDeviceID: Integer); safecall;
    procedure Enumerate; safecall;
    procedure Adjust; safecall;
    procedure SetProperty_WindowOption(nOption: Integer; newVal: Integer); safecall;
    function GetProperty_WindowOption(nOption: Integer): Integer; safecall;
    procedure SetProperty_DisableFingerForEnroll(nFingerID: Integer; newVal: Integer); safecall;
    function GetProperty_DisableFingerForEnroll(nFingerID: Integer): Integer; safecall;
    function Get_CheckFinger: Integer; safecall;
    function Get_EnumDeviceNameID(nIndex: Integer): Integer; safecall;
    function Get_EnumDeviceInstance(nIndex: Integer): Integer; safecall;
    function Get_EnumDeviceName(nIndex: Integer): WideString; safecall;
    function Get_EnumDeviceDescription(nIndex: Integer): WideString; safecall;
    function Get_EnumDeviceDll(nIndex: Integer): WideString; safecall;
    function Get_EnumDeviceSys(nIndex: Integer): WideString; safecall;
    function Get_EnumDeviceAutoOn(nIndex: Integer): Integer; safecall;
    function Get_EnumDeviceBrightness(nIndex: Integer): Integer; safecall;
    function Get_EnumDeviceContrast(nIndex: Integer): Integer; safecall;
    function Get_EnumDeviceGain(nIndex: Integer): Integer; safecall;
    procedure WriteData(nIndex: Integer; nData: Integer); safecall;
    function ReadData(nIndex: Integer): Integer; safecall;
    function DeviceIoControl(dwIoControlCode: Integer; inBuffer: OleVariant): OleVariant; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property EnumCount: Integer read Get_EnumCount;
    property EnumDeviceID[nIndex: Integer]: Integer read Get_EnumDeviceID;
    property OpenedDeviceID: Integer read Get_OpenedDeviceID;
    property GetDeviceName[nDeviceID: Integer]: Integer read Get_GetDeviceName;
    property GetDeviceNumber[nDeviceID: Integer]: Integer read Get_GetDeviceNumber;
    property MakeDeviceID[nDeviceName: Integer; nDeviceNumber: Integer]: Integer read Get_MakeDeviceID;
    property ImageWidth[nDeviceID: Integer]: Integer read Get_ImageWidth;
    property ImageHeight[nDeviceID: Integer]: Integer read Get_ImageHeight;
    property Brightness[nDeviceID: Integer]: Integer read Get_Brightness write Set_Brightness;
    property Contrast[nDeviceID: Integer]: Integer read Get_Contrast write Set_Contrast;
    property Gain[nDeviceID: Integer]: Integer read Get_Gain write Set_Gain;
    property WindowStyle: Integer read Get_WindowStyle write Set_WindowStyle;
    property WindowOption[nOption: Integer]: Integer read Get_WindowOption write Set_WindowOption;
    property ParentWnd: Integer read Get_ParentWnd write Set_ParentWnd;
    property FingerWnd: Integer read Get_FingerWnd write Set_FingerWnd;
    property CaptionMsg: WideString read Get_CaptionMsg write Set_CaptionMsg;
    property CancelMsg: WideString read Get_CancelMsg write Set_CancelMsg;
    property FPForeColor: WideString read Get_FPForeColor write Set_FPForeColor;
    property FPBackColor: WideString read Get_FPBackColor write Set_FPBackColor;
    property DisableFingerForEnroll[nFingerID: Integer]: Integer read Get_DisableFingerForEnroll write Set_DisableFingerForEnroll;
    property CheckFinger: Integer read Get_CheckFinger;
    property EnumDeviceNameID[nIndex: Integer]: Integer read Get_EnumDeviceNameID;
    property EnumDeviceInstance[nIndex: Integer]: Integer read Get_EnumDeviceInstance;
    property EnumDeviceName[nIndex: Integer]: WideString read Get_EnumDeviceName;
    property EnumDeviceDescription[nIndex: Integer]: WideString read Get_EnumDeviceDescription;
    property EnumDeviceDll[nIndex: Integer]: WideString read Get_EnumDeviceDll;
    property EnumDeviceSys[nIndex: Integer]: WideString read Get_EnumDeviceSys;
    property EnumDeviceAutoOn[nIndex: Integer]: Integer read Get_EnumDeviceAutoOn;
    property EnumDeviceBrightness[nIndex: Integer]: Integer read Get_EnumDeviceBrightness;
    property EnumDeviceContrast[nIndex: Integer]: Integer read Get_EnumDeviceContrast;
    property EnumDeviceGain[nIndex: Integer]: Integer read Get_EnumDeviceGain;
  end;

// *********************************************************************//
// DispIntf:  IDeviceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5CE7E823-C269-415A-9F05-7593540AB065}
// *********************************************************************//
  IDeviceDisp = dispinterface
    ['{5CE7E823-C269-415A-9F05-7593540AB065}']
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property EnumCount: Integer readonly dispid 3;
    property EnumDeviceID[nIndex: Integer]: Integer readonly dispid 4;
    property OpenedDeviceID: Integer readonly dispid 5;
    property GetDeviceName[nDeviceID: Integer]: Integer readonly dispid 6;
    property GetDeviceNumber[nDeviceID: Integer]: Integer readonly dispid 7;
    property MakeDeviceID[nDeviceName: Integer; nDeviceNumber: Integer]: Integer readonly dispid 8;
    property ImageWidth[nDeviceID: Integer]: Integer readonly dispid 9;
    property ImageHeight[nDeviceID: Integer]: Integer readonly dispid 10;
    property Brightness[nDeviceID: Integer]: Integer dispid 11;
    property Contrast[nDeviceID: Integer]: Integer dispid 12;
    property Gain[nDeviceID: Integer]: Integer dispid 13;
    property WindowStyle: Integer dispid 14;
    property WindowOption[nOption: Integer]: Integer dispid 15;
    property ParentWnd: Integer dispid 16;
    property FingerWnd: Integer dispid 17;
    property CaptionMsg: WideString dispid 18;
    property CancelMsg: WideString dispid 19;
    property FPForeColor: WideString dispid 20;
    property FPBackColor: WideString dispid 21;
    property DisableFingerForEnroll[nFingerID: Integer]: Integer dispid 22;
    procedure Open(nDeviceID: Integer); dispid 23;
    procedure Close(nDeviceID: Integer); dispid 24;
    procedure Enumerate; dispid 25;
    procedure Adjust; dispid 26;
    procedure SetProperty_WindowOption(nOption: Integer; newVal: Integer); dispid 27;
    function GetProperty_WindowOption(nOption: Integer): Integer; dispid 28;
    procedure SetProperty_DisableFingerForEnroll(nFingerID: Integer; newVal: Integer); dispid 29;
    function GetProperty_DisableFingerForEnroll(nFingerID: Integer): Integer; dispid 30;
    property CheckFinger: Integer readonly dispid 31;
    property EnumDeviceNameID[nIndex: Integer]: Integer readonly dispid 32;
    property EnumDeviceInstance[nIndex: Integer]: Integer readonly dispid 33;
    property EnumDeviceName[nIndex: Integer]: WideString readonly dispid 34;
    property EnumDeviceDescription[nIndex: Integer]: WideString readonly dispid 35;
    property EnumDeviceDll[nIndex: Integer]: WideString readonly dispid 36;
    property EnumDeviceSys[nIndex: Integer]: WideString readonly dispid 37;
    property EnumDeviceAutoOn[nIndex: Integer]: Integer readonly dispid 38;
    property EnumDeviceBrightness[nIndex: Integer]: Integer readonly dispid 39;
    property EnumDeviceContrast[nIndex: Integer]: Integer readonly dispid 40;
    property EnumDeviceGain[nIndex: Integer]: Integer readonly dispid 41;
    procedure WriteData(nIndex: Integer; nData: Integer); dispid 42;
    function ReadData(nIndex: Integer): Integer; dispid 43;
    function DeviceIoControl(dwIoControlCode: Integer; inBuffer: OleVariant): OleVariant; dispid 44;
  end;

// *********************************************************************//
// Interface: IExtraction
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FB907640-E03F-4B58-AA0C-2699F3F64445}
// *********************************************************************//
  IExtraction = interface(IDispatch)
    ['{FB907640-E03F-4B58-AA0C-2699F3F64445}']
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_TextEncodeFIR: WideString; safecall;
    function Get_FIRLength: Integer; safecall;
    function Get_FIR: OleVariant; safecall;
    function Get_MaxFingerForEnroll: Integer; safecall;
    procedure Set_MaxFingerForEnroll(pVal: Integer); safecall;
    function Get_SamplesPerFinger: Integer; safecall;
    procedure Set_SamplesPerFinger(pVal: Integer); safecall;
    function Get_DefaultTimeout: Integer; safecall;
    procedure Set_DefaultTimeout(pVal: Integer); safecall;
    function Get_EnrollImageQuality: Integer; safecall;
    procedure Set_EnrollImageQuality(pVal: Integer); safecall;
    function Get_VerifyImageQuality: Integer; safecall;
    procedure Set_VerifyImageQuality(pVal: Integer); safecall;
    function Get_IdentifyImageQuality: Integer; safecall;
    procedure Set_IdentifyImageQuality(pVal: Integer); safecall;
    function Get_SecurityLevel: Integer; safecall;
    procedure Set_SecurityLevel(pVal: Integer); safecall;
    function Get_WindowStyle: Integer; safecall;
    procedure Set_WindowStyle(pVal: Integer); safecall;
    function Get_WindowOption(nOption: Integer): Integer; safecall;
    procedure Set_WindowOption(nOption: Integer; pVal: Integer); safecall;
    function Get_ParentWnd: Integer; safecall;
    procedure Set_ParentWnd(pVal: Integer); safecall;
    function Get_FingerWnd: Integer; safecall;
    procedure Set_FingerWnd(pVal: Integer); safecall;
    function Get_CaptionMsg: WideString; safecall;
    procedure Set_CaptionMsg(const pVal: WideString); safecall;
    function Get_CancelMsg: WideString; safecall;
    procedure Set_CancelMsg(const pVal: WideString); safecall;
    function Get_FPForeColor: WideString; safecall;
    procedure Set_FPForeColor(const pVal: WideString); safecall;
    function Get_FPBackColor: WideString; safecall;
    procedure Set_FPBackColor(const pVal: WideString); safecall;
    function Get_DisableFingerForEnroll(nFingerID: Integer): Integer; safecall;
    procedure Set_DisableFingerForEnroll(nFingerID: Integer; pVal: Integer); safecall;
    procedure Capture(nPurpose: Integer); safecall;
    procedure Enroll(payload: OleVariant; storedFIR: OleVariant); safecall;
    procedure SetProperty_WindowOption(nOption: Integer; newVal: Integer); safecall;
    function GetProperty_WindowOption(nOption: Integer): Integer; safecall;
    procedure SetProperty_DisableFingerForEnroll(nFingerID: Integer; newVal: Integer); safecall;
    function GetProperty_DisableFingerForEnroll(nFingerID: Integer): Integer; safecall;
    function Get_FIRFormat: Integer; safecall;
    procedure Set_FIRFormat(pVal: Integer); safecall;
    function Get_EnrollSecurityLevel: Integer; safecall;
    procedure Set_EnrollSecurityLevel(pVal: Integer); safecall;
    function Get_NecessaryEnrollNum: Integer; safecall;
    procedure Set_NecessaryEnrollNum(pVal: Integer); safecall;
    procedure CaptureEx(nPurpose: Integer; storedFIR: OleVariant; nMatchType: Integer); safecall;
    procedure RollCapture(nPurpose: Integer); safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property TextEncodeFIR: WideString read Get_TextEncodeFIR;
    property FIRLength: Integer read Get_FIRLength;
    property FIR: OleVariant read Get_FIR;
    property MaxFingerForEnroll: Integer read Get_MaxFingerForEnroll write Set_MaxFingerForEnroll;
    property SamplesPerFinger: Integer read Get_SamplesPerFinger write Set_SamplesPerFinger;
    property DefaultTimeout: Integer read Get_DefaultTimeout write Set_DefaultTimeout;
    property EnrollImageQuality: Integer read Get_EnrollImageQuality write Set_EnrollImageQuality;
    property VerifyImageQuality: Integer read Get_VerifyImageQuality write Set_VerifyImageQuality;
    property IdentifyImageQuality: Integer read Get_IdentifyImageQuality write Set_IdentifyImageQuality;
    property SecurityLevel: Integer read Get_SecurityLevel write Set_SecurityLevel;
    property WindowStyle: Integer read Get_WindowStyle write Set_WindowStyle;
    property WindowOption[nOption: Integer]: Integer read Get_WindowOption write Set_WindowOption;
    property ParentWnd: Integer read Get_ParentWnd write Set_ParentWnd;
    property FingerWnd: Integer read Get_FingerWnd write Set_FingerWnd;
    property CaptionMsg: WideString read Get_CaptionMsg write Set_CaptionMsg;
    property CancelMsg: WideString read Get_CancelMsg write Set_CancelMsg;
    property FPForeColor: WideString read Get_FPForeColor write Set_FPForeColor;
    property FPBackColor: WideString read Get_FPBackColor write Set_FPBackColor;
    property DisableFingerForEnroll[nFingerID: Integer]: Integer read Get_DisableFingerForEnroll write Set_DisableFingerForEnroll;
    property FIRFormat: Integer read Get_FIRFormat write Set_FIRFormat;
    property EnrollSecurityLevel: Integer read Get_EnrollSecurityLevel write Set_EnrollSecurityLevel;
    property NecessaryEnrollNum: Integer read Get_NecessaryEnrollNum write Set_NecessaryEnrollNum;
  end;

// *********************************************************************//
// DispIntf:  IExtractionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FB907640-E03F-4B58-AA0C-2699F3F64445}
// *********************************************************************//
  IExtractionDisp = dispinterface
    ['{FB907640-E03F-4B58-AA0C-2699F3F64445}']
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property TextEncodeFIR: WideString readonly dispid 3;
    property FIRLength: Integer readonly dispid 4;
    property FIR: OleVariant readonly dispid 5;
    property MaxFingerForEnroll: Integer dispid 6;
    property SamplesPerFinger: Integer dispid 7;
    property DefaultTimeout: Integer dispid 8;
    property EnrollImageQuality: Integer dispid 9;
    property VerifyImageQuality: Integer dispid 10;
    property IdentifyImageQuality: Integer dispid 11;
    property SecurityLevel: Integer dispid 12;
    property WindowStyle: Integer dispid 13;
    property WindowOption[nOption: Integer]: Integer dispid 14;
    property ParentWnd: Integer dispid 15;
    property FingerWnd: Integer dispid 16;
    property CaptionMsg: WideString dispid 17;
    property CancelMsg: WideString dispid 18;
    property FPForeColor: WideString dispid 19;
    property FPBackColor: WideString dispid 20;
    property DisableFingerForEnroll[nFingerID: Integer]: Integer dispid 21;
    procedure Capture(nPurpose: Integer); dispid 22;
    procedure Enroll(payload: OleVariant; storedFIR: OleVariant); dispid 23;
    procedure SetProperty_WindowOption(nOption: Integer; newVal: Integer); dispid 24;
    function GetProperty_WindowOption(nOption: Integer): Integer; dispid 25;
    procedure SetProperty_DisableFingerForEnroll(nFingerID: Integer; newVal: Integer); dispid 26;
    function GetProperty_DisableFingerForEnroll(nFingerID: Integer): Integer; dispid 27;
    property FIRFormat: Integer dispid 28;
    property EnrollSecurityLevel: Integer dispid 29;
    property NecessaryEnrollNum: Integer dispid 30;
    procedure CaptureEx(nPurpose: Integer; storedFIR: OleVariant; nMatchType: Integer); dispid 31;
    procedure RollCapture(nPurpose: Integer); dispid 32;
  end;

// *********************************************************************//
// Interface: IMatching
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {51C9F6C0-FE11-42E2-B0FD-32287D33FDAC}
// *********************************************************************//
  IMatching = interface(IDispatch)
    ['{51C9F6C0-FE11-42E2-B0FD-32287D33FDAC}']
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_MatchingResult: Integer; safecall;
    function Get_ExistPayload: Integer; safecall;
    function Get_TextEncodePayload: WideString; safecall;
    function Get_PayloadLength: Integer; safecall;
    function Get_payload: OleVariant; safecall;
    function Get_MaxFingerForEnroll: Integer; safecall;
    procedure Set_MaxFingerForEnroll(pVal: Integer); safecall;
    function Get_SamplesPerFinger: Integer; safecall;
    procedure Set_SamplesPerFinger(pVal: Integer); safecall;
    function Get_DefaultTimeout: Integer; safecall;
    procedure Set_DefaultTimeout(pVal: Integer); safecall;
    function Get_EnrollImageQuality: Integer; safecall;
    procedure Set_EnrollImageQuality(pVal: Integer); safecall;
    function Get_VerifyImageQuality: Integer; safecall;
    procedure Set_VerifyImageQuality(pVal: Integer); safecall;
    function Get_IdentifyImageQuality: Integer; safecall;
    procedure Set_IdentifyImageQuality(pVal: Integer); safecall;
    function Get_SecurityLevel: Integer; safecall;
    procedure Set_SecurityLevel(pVal: Integer); safecall;
    function Get_WindowStyle: Integer; safecall;
    procedure Set_WindowStyle(pVal: Integer); safecall;
    function Get_WindowOption(nOption: Integer): Integer; safecall;
    procedure Set_WindowOption(nOption: Integer; pVal: Integer); safecall;
    function Get_ParentWnd: Integer; safecall;
    procedure Set_ParentWnd(pVal: Integer); safecall;
    function Get_FingerWnd: Integer; safecall;
    procedure Set_FingerWnd(pVal: Integer); safecall;
    function Get_CaptionMsg: WideString; safecall;
    procedure Set_CaptionMsg(const pVal: WideString); safecall;
    function Get_CancelMsg: WideString; safecall;
    procedure Set_CancelMsg(const pVal: WideString); safecall;
    function Get_FPForeColor: WideString; safecall;
    procedure Set_FPForeColor(const pVal: WideString); safecall;
    function Get_FPBackColor: WideString; safecall;
    procedure Set_FPBackColor(const pVal: WideString); safecall;
    function Get_DisableFingerForEnroll(nFingerID: Integer): Integer; safecall;
    procedure Set_DisableFingerForEnroll(nFingerID: Integer; pVal: Integer); safecall;
    procedure Verify(storedFIR: OleVariant); safecall;
    procedure VerifyMatch(processedFIR: OleVariant; storedFIR: OleVariant); safecall;
    procedure SetProperty_WindowOption(nOption: Integer; newVal: Integer); safecall;
    function GetProperty_WindowOption(nOption: Integer): Integer; safecall;
    procedure SetProperty_DisableFingerForEnroll(nFingerID: Integer; newVal: Integer); safecall;
    function GetProperty_DisableFingerForEnroll(nFingerID: Integer): Integer; safecall;
    procedure FakeTest(processedFIR: OleVariant; storedFIR: OleVariant); safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property MatchingResult: Integer read Get_MatchingResult;
    property ExistPayload: Integer read Get_ExistPayload;
    property TextEncodePayload: WideString read Get_TextEncodePayload;
    property PayloadLength: Integer read Get_PayloadLength;
    property payload: OleVariant read Get_payload;
    property MaxFingerForEnroll: Integer read Get_MaxFingerForEnroll write Set_MaxFingerForEnroll;
    property SamplesPerFinger: Integer read Get_SamplesPerFinger write Set_SamplesPerFinger;
    property DefaultTimeout: Integer read Get_DefaultTimeout write Set_DefaultTimeout;
    property EnrollImageQuality: Integer read Get_EnrollImageQuality write Set_EnrollImageQuality;
    property VerifyImageQuality: Integer read Get_VerifyImageQuality write Set_VerifyImageQuality;
    property IdentifyImageQuality: Integer read Get_IdentifyImageQuality write Set_IdentifyImageQuality;
    property SecurityLevel: Integer read Get_SecurityLevel write Set_SecurityLevel;
    property WindowStyle: Integer read Get_WindowStyle write Set_WindowStyle;
    property WindowOption[nOption: Integer]: Integer read Get_WindowOption write Set_WindowOption;
    property ParentWnd: Integer read Get_ParentWnd write Set_ParentWnd;
    property FingerWnd: Integer read Get_FingerWnd write Set_FingerWnd;
    property CaptionMsg: WideString read Get_CaptionMsg write Set_CaptionMsg;
    property CancelMsg: WideString read Get_CancelMsg write Set_CancelMsg;
    property FPForeColor: WideString read Get_FPForeColor write Set_FPForeColor;
    property FPBackColor: WideString read Get_FPBackColor write Set_FPBackColor;
    property DisableFingerForEnroll[nFingerID: Integer]: Integer read Get_DisableFingerForEnroll write Set_DisableFingerForEnroll;
  end;

// *********************************************************************//
// DispIntf:  IMatchingDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {51C9F6C0-FE11-42E2-B0FD-32287D33FDAC}
// *********************************************************************//
  IMatchingDisp = dispinterface
    ['{51C9F6C0-FE11-42E2-B0FD-32287D33FDAC}']
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property MatchingResult: Integer readonly dispid 3;
    property ExistPayload: Integer readonly dispid 4;
    property TextEncodePayload: WideString readonly dispid 5;
    property PayloadLength: Integer readonly dispid 6;
    property payload: OleVariant readonly dispid 7;
    property MaxFingerForEnroll: Integer dispid 8;
    property SamplesPerFinger: Integer dispid 9;
    property DefaultTimeout: Integer dispid 10;
    property EnrollImageQuality: Integer dispid 11;
    property VerifyImageQuality: Integer dispid 12;
    property IdentifyImageQuality: Integer dispid 13;
    property SecurityLevel: Integer dispid 14;
    property WindowStyle: Integer dispid 15;
    property WindowOption[nOption: Integer]: Integer dispid 16;
    property ParentWnd: Integer dispid 17;
    property FingerWnd: Integer dispid 18;
    property CaptionMsg: WideString dispid 19;
    property CancelMsg: WideString dispid 20;
    property FPForeColor: WideString dispid 21;
    property FPBackColor: WideString dispid 22;
    property DisableFingerForEnroll[nFingerID: Integer]: Integer dispid 23;
    procedure Verify(storedFIR: OleVariant); dispid 24;
    procedure VerifyMatch(processedFIR: OleVariant; storedFIR: OleVariant); dispid 25;
    procedure SetProperty_WindowOption(nOption: Integer; newVal: Integer); dispid 26;
    function GetProperty_WindowOption(nOption: Integer): Integer; dispid 27;
    procedure SetProperty_DisableFingerForEnroll(nFingerID: Integer; newVal: Integer); dispid 28;
    function GetProperty_DisableFingerForEnroll(nFingerID: Integer): Integer; dispid 29;
    procedure FakeTest(processedFIR: OleVariant; storedFIR: OleVariant); dispid 30;
  end;

// *********************************************************************//
// Interface: IFPData
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {580CD79B-5BAF-487A-BE70-C1CFE1EA2ECC}
// *********************************************************************//
  IFPData = interface(IDispatch)
    ['{580CD79B-5BAF-487A-BE70-C1CFE1EA2ECC}']
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_TotalFingerCount: Integer; safecall;
    function Get_FingerID(nIndex: Integer): Integer; safecall;
    function Get_SampleNumber: Integer; safecall;
    function Get_FPDataSize(nFingerID: Integer): Integer; safecall;
    function Get_FPData(nFingerID: Integer; nSampleNum: Integer): OleVariant; safecall;
    function Get_TextEncodeFIR: WideString; safecall;
    function Get_FIRLength: Integer; safecall;
    function Get_FIR: OleVariant; safecall;
    procedure Export(storedFIR: OleVariant; nDesFPDataType: Integer); safecall;
    procedure Import(bInitialize: Integer; nFingerID: Integer; nPurpose: Integer; 
                     nSrcFPDataType: Integer; nFPDataSize: Integer; FPData1: OleVariant; 
                     FPData2: OleVariant); safecall;
    procedure CreateTemplate(capturedFIR: OleVariant; storedFIR: OleVariant; payload: OleVariant); safecall;
    function Get_FPSampleDataSize(nFingerID: Integer; SampleNum: Integer): Integer; safecall;
    procedure ImportBioAPI(nDataSize: Integer; OpaqueData: OleVariant); safecall;
    function Get_FIRFormat: Integer; safecall;
    procedure Set_FIRFormat(pVal: Integer); safecall;
    function Get_QualityInfo(nFingerID: Integer; nSampleNum: Integer): Integer; safecall;
    procedure CheckQuality(storedFIR: OleVariant; auditFIR: OleVariant); safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property TotalFingerCount: Integer read Get_TotalFingerCount;
    property FingerID[nIndex: Integer]: Integer read Get_FingerID;
    property SampleNumber: Integer read Get_SampleNumber;
    property FPDataSize[nFingerID: Integer]: Integer read Get_FPDataSize;
    property FPData[nFingerID: Integer; nSampleNum: Integer]: OleVariant read Get_FPData;
    property TextEncodeFIR: WideString read Get_TextEncodeFIR;
    property FIRLength: Integer read Get_FIRLength;
    property FIR: OleVariant read Get_FIR;
    property FPSampleDataSize[nFingerID: Integer; SampleNum: Integer]: Integer read Get_FPSampleDataSize;
    property FIRFormat: Integer read Get_FIRFormat write Set_FIRFormat;
    property QualityInfo[nFingerID: Integer; nSampleNum: Integer]: Integer read Get_QualityInfo;
  end;

// *********************************************************************//
// DispIntf:  IFPDataDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {580CD79B-5BAF-487A-BE70-C1CFE1EA2ECC}
// *********************************************************************//
  IFPDataDisp = dispinterface
    ['{580CD79B-5BAF-487A-BE70-C1CFE1EA2ECC}']
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property TotalFingerCount: Integer readonly dispid 3;
    property FingerID[nIndex: Integer]: Integer readonly dispid 4;
    property SampleNumber: Integer readonly dispid 5;
    property FPDataSize[nFingerID: Integer]: Integer readonly dispid 6;
    property FPData[nFingerID: Integer; nSampleNum: Integer]: OleVariant readonly dispid 7;
    property TextEncodeFIR: WideString readonly dispid 8;
    property FIRLength: Integer readonly dispid 9;
    property FIR: OleVariant readonly dispid 10;
    procedure Export(storedFIR: OleVariant; nDesFPDataType: Integer); dispid 11;
    procedure Import(bInitialize: Integer; nFingerID: Integer; nPurpose: Integer; 
                     nSrcFPDataType: Integer; nFPDataSize: Integer; FPData1: OleVariant; 
                     FPData2: OleVariant); dispid 12;
    procedure CreateTemplate(capturedFIR: OleVariant; storedFIR: OleVariant; payload: OleVariant); dispid 13;
    property FPSampleDataSize[nFingerID: Integer; SampleNum: Integer]: Integer readonly dispid 14;
    procedure ImportBioAPI(nDataSize: Integer; OpaqueData: OleVariant); dispid 15;
    property FIRFormat: Integer dispid 16;
    property QualityInfo[nFingerID: Integer; nSampleNum: Integer]: Integer readonly dispid 17;
    procedure CheckQuality(storedFIR: OleVariant; auditFIR: OleVariant); dispid 18;
  end;

// *********************************************************************//
// Interface: IFPImage
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {48CBE6EB-D40F-4CF8-9BFD-E368225E8E0E}
// *********************************************************************//
  IFPImage = interface(IDispatch)
    ['{48CBE6EB-D40F-4CF8-9BFD-E368225E8E0E}']
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_TotalFingerCount: Integer; safecall;
    function Get_FingerID(nIndex: Integer): Integer; safecall;
    function Get_ImageWidth: Integer; safecall;
    function Get_ImageHeight: Integer; safecall;
    function Get_RawData(nFingerID: Integer; nSampleNumber: Integer): OleVariant; safecall;
    procedure Export; safecall;
    procedure Save(const bszImgFilePath: WideString; nImageType: Integer; nFingerID: Integer; 
                   nSampleNumber: Integer); safecall;
    procedure ExportEx(capturedFIR: OleVariant); safecall;
    function Get_AuditData: OleVariant; safecall;
    function Get_AuditDataLength: Integer; safecall;
    function Get_TextEncodeAuditData: WideString; safecall;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property TotalFingerCount: Integer read Get_TotalFingerCount;
    property FingerID[nIndex: Integer]: Integer read Get_FingerID;
    property ImageWidth: Integer read Get_ImageWidth;
    property ImageHeight: Integer read Get_ImageHeight;
    property RawData[nFingerID: Integer; nSampleNumber: Integer]: OleVariant read Get_RawData;
    property AuditData: OleVariant read Get_AuditData;
    property AuditDataLength: Integer read Get_AuditDataLength;
    property TextEncodeAuditData: WideString read Get_TextEncodeAuditData;
  end;

// *********************************************************************//
// DispIntf:  IFPImageDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {48CBE6EB-D40F-4CF8-9BFD-E368225E8E0E}
// *********************************************************************//
  IFPImageDisp = dispinterface
    ['{48CBE6EB-D40F-4CF8-9BFD-E368225E8E0E}']
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property TotalFingerCount: Integer readonly dispid 3;
    property FingerID[nIndex: Integer]: Integer readonly dispid 4;
    property ImageWidth: Integer readonly dispid 5;
    property ImageHeight: Integer readonly dispid 6;
    property RawData[nFingerID: Integer; nSampleNumber: Integer]: OleVariant readonly dispid 7;
    procedure Export; dispid 8;
    procedure Save(const bszImgFilePath: WideString; nImageType: Integer; nFingerID: Integer; 
                   nSampleNumber: Integer); dispid 9;
    procedure ExportEx(capturedFIR: OleVariant); dispid 10;
    property AuditData: OleVariant readonly dispid 11;
    property AuditDataLength: Integer readonly dispid 12;
    property TextEncodeAuditData: WideString readonly dispid 13;
  end;

// *********************************************************************//
// Interface: INSearch
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {78141587-F586-4541-BC01-D6F7D7224A88}
// *********************************************************************//
  INSearch = interface(IDispatch)
    ['{78141587-F586-4541-BC01-D6F7D7224A88}']
    function Get_Item(index: Integer): OleVariant; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_MaxCandidatenumber: Integer; safecall;
    procedure Set_MaxCandidatenumber(pVal: Integer); safecall;
    function Get_GetDataCountFromDB: Integer; safecall;
    function Get_CheckDataExistFromDB(nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer): Integer; safecall;
    function Get_UserID: Integer; safecall;
    function Get_Count: Integer; safecall;
    procedure AddFIR(FIR: OleVariant; nUserID: Integer); safecall;
    procedure RemoveData(nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer); safecall;
    procedure RemoveUser(nUserID: Integer); safecall;
    procedure SearchData(storedFIR: OleVariant); safecall;
    procedure IdentifyUser(storedFIR: OleVariant; nSecuLevel: Integer); safecall;
    procedure ClearDB; safecall;
    procedure SaveDBToFile(const bszFilePath: WideString); safecall;
    procedure LoadDBFromFile(const bszFilePath: WideString); safecall;
    procedure ImportIndexSearchDB(const bszFilePath: WideString); safecall;
    property Item[index: Integer]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property MaxCandidatenumber: Integer read Get_MaxCandidatenumber write Set_MaxCandidatenumber;
    property GetDataCountFromDB: Integer read Get_GetDataCountFromDB;
    property CheckDataExistFromDB[nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer]: Integer read Get_CheckDataExistFromDB;
    property UserID: Integer read Get_UserID;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  INSearchDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {78141587-F586-4541-BC01-D6F7D7224A88}
// *********************************************************************//
  INSearchDisp = dispinterface
    ['{78141587-F586-4541-BC01-D6F7D7224A88}']
    property Item[index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property MaxCandidatenumber: Integer dispid 3;
    property GetDataCountFromDB: Integer readonly dispid 4;
    property CheckDataExistFromDB[nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer]: Integer readonly dispid 5;
    property UserID: Integer readonly dispid 6;
    property Count: Integer readonly dispid 7;
    procedure AddFIR(FIR: OleVariant; nUserID: Integer); dispid 8;
    procedure RemoveData(nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer); dispid 9;
    procedure RemoveUser(nUserID: Integer); dispid 10;
    procedure SearchData(storedFIR: OleVariant); dispid 11;
    procedure IdentifyUser(storedFIR: OleVariant; nSecuLevel: Integer); dispid 12;
    procedure ClearDB; dispid 13;
    procedure SaveDBToFile(const bszFilePath: WideString); dispid 14;
    procedure LoadDBFromFile(const bszFilePath: WideString); dispid 15;
    procedure ImportIndexSearchDB(const bszFilePath: WideString); dispid 16;
  end;

// *********************************************************************//
// Interface: ICandidateList
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8219FA9D-78B9-4E1F-A300-4BC6ECB38AF9}
// *********************************************************************//
  ICandidateList = interface(IDispatch)
    ['{8219FA9D-78B9-4E1F-A300-4BC6ECB38AF9}']
    function Get_UserID: Integer; safecall;
    function Get_FingerID: Integer; safecall;
    function Get_SampleNumber: Integer; safecall;
    function Get_ConfidenceLevel: Integer; safecall;
    property UserID: Integer read Get_UserID;
    property FingerID: Integer read Get_FingerID;
    property SampleNumber: Integer read Get_SampleNumber;
    property ConfidenceLevel: Integer read Get_ConfidenceLevel;
  end;

// *********************************************************************//
// DispIntf:  ICandidateListDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8219FA9D-78B9-4E1F-A300-4BC6ECB38AF9}
// *********************************************************************//
  ICandidateListDisp = dispinterface
    ['{8219FA9D-78B9-4E1F-A300-4BC6ECB38AF9}']
    property UserID: Integer readonly dispid 1;
    property FingerID: Integer readonly dispid 2;
    property SampleNumber: Integer readonly dispid 3;
    property ConfidenceLevel: Integer readonly dispid 4;
  end;

// *********************************************************************//
// Interface: IIndexSearch
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E4D5091-3C8E-4F1C-977B-2B90EF1F9A18}
// *********************************************************************//
  IIndexSearch = interface(IDispatch)
    ['{3E4D5091-3C8E-4F1C-977B-2B90EF1F9A18}']
    function Get_Item(index: Integer): OleVariant; safecall;
    function Get__NewEnum: IUnknown; safecall;
    function Get_ErrorCode: Integer; safecall;
    function Get_ErrorDescription: WideString; safecall;
    function Get_PresearchRate: Integer; safecall;
    procedure Set_PresearchRate(pVal: Integer); safecall;
    function Get_GetDataCountFromDB: Integer; safecall;
    function Get_CheckDataExistFromDB(nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer): Integer; safecall;
    function Get_UserID: Integer; safecall;
    function Get_FingerID: Integer; safecall;
    function Get_SampleNumber: Integer; safecall;
    function Get_Count: Integer; safecall;
    procedure AddFIR(FIR: OleVariant; nUserID: Integer); safecall;
    procedure RemoveData(nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer); safecall;
    procedure RemoveUser(nUserID: Integer); safecall;
    procedure IdentifyUser(storedFIR: OleVariant; nSecuLevel: Integer); safecall;
    procedure ClearDB; safecall;
    procedure SaveDBToFile(const bszFilePath: WideString); safecall;
    procedure LoadDBFromFile(const bszFilePath: WideString); safecall;
    function Get_MaxSearchTime: Integer; safecall;
    procedure Set_MaxSearchTime(pVal: Integer); safecall;
    property Item[index: Integer]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property PresearchRate: Integer read Get_PresearchRate write Set_PresearchRate;
    property GetDataCountFromDB: Integer read Get_GetDataCountFromDB;
    property CheckDataExistFromDB[nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer]: Integer read Get_CheckDataExistFromDB;
    property UserID: Integer read Get_UserID;
    property FingerID: Integer read Get_FingerID;
    property SampleNumber: Integer read Get_SampleNumber;
    property Count: Integer read Get_Count;
    property MaxSearchTime: Integer read Get_MaxSearchTime write Set_MaxSearchTime;
  end;

// *********************************************************************//
// DispIntf:  IIndexSearchDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3E4D5091-3C8E-4F1C-977B-2B90EF1F9A18}
// *********************************************************************//
  IIndexSearchDisp = dispinterface
    ['{3E4D5091-3C8E-4F1C-977B-2B90EF1F9A18}']
    property Item[index: Integer]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
    property ErrorCode: Integer readonly dispid 1;
    property ErrorDescription: WideString readonly dispid 2;
    property PresearchRate: Integer dispid 3;
    property GetDataCountFromDB: Integer readonly dispid 4;
    property CheckDataExistFromDB[nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer]: Integer readonly dispid 5;
    property UserID: Integer readonly dispid 6;
    property FingerID: Integer readonly dispid 7;
    property SampleNumber: Integer readonly dispid 8;
    property Count: Integer readonly dispid 9;
    procedure AddFIR(FIR: OleVariant; nUserID: Integer); dispid 10;
    procedure RemoveData(nUserID: Integer; nFingerID: Integer; nSampleNumber: Integer); dispid 11;
    procedure RemoveUser(nUserID: Integer); dispid 12;
    procedure IdentifyUser(storedFIR: OleVariant; nSecuLevel: Integer); dispid 13;
    procedure ClearDB; dispid 14;
    procedure SaveDBToFile(const bszFilePath: WideString); dispid 15;
    procedure LoadDBFromFile(const bszFilePath: WideString); dispid 16;
    property MaxSearchTime: Integer dispid 17;
  end;

// *********************************************************************//
// The Class CoNBioBSP provides a Create and CreateRemote method to          
// create instances of the default interface INBioBSP exposed by              
// the CoClass NBioBSP. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNBioBSP = class
    class function Create: INBioBSP;
    class function CreateRemote(const MachineName: string): INBioBSP;
  end;

  TNBioBSPOnEnrollEvent = procedure(ASender: TObject; EventID: Integer) of object;
  TNBioBSPOnCaptureEvent = procedure(ASender: TObject; Quality: Integer) of object;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TNBioBSP
// Help String      : NBioBSP Class
// Default Interface: INBioBSP
// Def. Intf. DISP? : No
// Event   Interface: _INBioBSPEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TNBioBSP = class(TOleServer)
  private
    FOnEnrollEvent: TNBioBSPOnEnrollEvent;
    FOnCaptureEvent: TNBioBSPOnCaptureEvent;
    FIntf: INBioBSP;
    function GetDefaultInterface: INBioBSP;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
    function Get_ErrorCode: Integer;
    function Get_ErrorDescription: WideString;
    function Get_Device: OleVariant;
    function Get_Extraction: OleVariant;
    function Get_Matching: OleVariant;
    function Get_FPData: OleVariant;
    function Get_FPImage: OleVariant;
    function Get_NSearch: OleVariant;
    function Get_CheckValidityModule: Integer;
    function Get_MajorVersion: WideString;
    function Get_MinorVersion: WideString;
    function Get_BuildNumber: WideString;
    function Get_IndexSearch: OleVariant;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: INBioBSP);
    procedure Disconnect; override;
    procedure SetSkinResource(const bszSkinPath: WideString);
    property DefaultInterface: INBioBSP read GetDefaultInterface;
    property ErrorCode: Integer read Get_ErrorCode;
    property ErrorDescription: WideString read Get_ErrorDescription;
    property Device: OleVariant read Get_Device;
    property Extraction: OleVariant read Get_Extraction;
    property Matching: OleVariant read Get_Matching;
    property FPData: OleVariant read Get_FPData;
    property FPImage: OleVariant read Get_FPImage;
    property NSearch: OleVariant read Get_NSearch;
    property CheckValidityModule: Integer read Get_CheckValidityModule;
    property MajorVersion: WideString read Get_MajorVersion;
    property MinorVersion: WideString read Get_MinorVersion;
    property BuildNumber: WideString read Get_BuildNumber;
    property IndexSearch: OleVariant read Get_IndexSearch;
  published
    property OnEnrollEvent: TNBioBSPOnEnrollEvent read FOnEnrollEvent write FOnEnrollEvent;
    property OnCaptureEvent: TNBioBSPOnCaptureEvent read FOnCaptureEvent write FOnCaptureEvent;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoNBioBSP.Create: INBioBSP;
begin
  Result := CreateComObject(CLASS_NBioBSP) as INBioBSP;
end;

class function CoNBioBSP.CreateRemote(const MachineName: string): INBioBSP;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NBioBSP) as INBioBSP;
end;

procedure TNBioBSP.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{F66B9251-67CA-4D78-90A3-28C2BFAE89BF}';
    IntfIID:   '{4511B19F-37BC-437B-B18E-2106A9AF7083}';
    EventIID:  '{E9E0119B-AB00-41CE-B176-F382DF81A052}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNBioBSP.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as INBioBSP;
  end;
end;

procedure TNBioBSP.ConnectTo(svrIntf: INBioBSP);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TNBioBSP.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TNBioBSP.GetDefaultInterface: INBioBSP;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call "Connect" or "ConnectTo" before this operation');
  Result := FIntf;
end;

constructor TNBioBSP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TNBioBSP.Destroy;
begin
  inherited Destroy;
end;

procedure TNBioBSP.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
    1: if Assigned(FOnEnrollEvent) then
         FOnEnrollEvent(Self, Params[0] {Integer});
    2: if Assigned(FOnCaptureEvent) then
         FOnCaptureEvent(Self, Params[0] {Integer});
  end; {case DispID}
end;

function TNBioBSP.Get_ErrorCode: Integer;
begin
  Result := DefaultInterface.ErrorCode;
end;

function TNBioBSP.Get_ErrorDescription: WideString;
begin
  Result := DefaultInterface.ErrorDescription;
end;

function TNBioBSP.Get_Device: OleVariant;
begin
  Result := DefaultInterface.Device;
end;

function TNBioBSP.Get_Extraction: OleVariant;
begin
  Result := DefaultInterface.Extraction;
end;

function TNBioBSP.Get_Matching: OleVariant;
begin
  Result := DefaultInterface.Matching;
end;

function TNBioBSP.Get_FPData: OleVariant;
begin
  Result := DefaultInterface.FPData;
end;

function TNBioBSP.Get_FPImage: OleVariant;
begin
  Result := DefaultInterface.FPImage;
end;

function TNBioBSP.Get_NSearch: OleVariant;
begin
  Result := DefaultInterface.NSearch;
end;

function TNBioBSP.Get_CheckValidityModule: Integer;
begin
  Result := DefaultInterface.CheckValidityModule;
end;

function TNBioBSP.Get_MajorVersion: WideString;
begin
  Result := DefaultInterface.MajorVersion;
end;

function TNBioBSP.Get_MinorVersion: WideString;
begin
  Result := DefaultInterface.MinorVersion;
end;

function TNBioBSP.Get_BuildNumber: WideString;
begin
  Result := DefaultInterface.BuildNumber;
end;

function TNBioBSP.Get_IndexSearch: OleVariant;
begin
  Result := DefaultInterface.IndexSearch;
end;

procedure TNBioBSP.SetSkinResource(const bszSkinPath: WideString);
begin
  DefaultInterface.SetSkinResource(bszSkinPath);
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TNBioBSP]);
end;

end.
