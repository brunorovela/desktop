unit CRAXDRT_TLB;

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
// File generated on 24/01/2018 15:19:10 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Common Files\Business Objects\3.0\bin\craxdrt.dll (1)
// LIBID: {EFA3761F-4265-4464-A2DE-519B8E7E34ED}
// LCID: 0
// Helpfile: 
// HelpString: Crystal Reports ActiveX Designer Run Time Library 11.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Hint: Parameter 'type' of IReport.AddReportVariable changed to 'type_'
//   Hint: Parameter 'var' of IReport.SetReportVariableValue changed to 'var_'
//   Hint: Parameter 'end' of IParameterFieldDefinition.AddCurrentRange changed to 'end_'
// ************************************************************************ //
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
  CRAXDRTMajorVersion = 11;
  CRAXDRTMinorVersion = 0;

  LIBID_CRAXDRT: TGUID = '{EFA3761F-4265-4464-A2DE-519B8E7E34ED}';

  IID_IReport: TGUID = '{AF376800-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICrystalReportSource: TGUID = '{3DCC8FB4-C434-11D1-A817-00A0C92784CD}';
  IID_IAreas: TGUID = '{AF376803-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IArea: TGUID = '{AF376805-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISections: TGUID = '{AF376804-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISection: TGUID = '{AF376806-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IReportObjects: TGUID = '{AF376807-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFieldObject: TGUID = '{AF376809-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ITextObject: TGUID = '{AF37680C-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFieldElements: TGUID = '{AF37680B-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFieldElement: TGUID = '{AF37680A-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFieldDefinition: TGUID = '{AF37680D-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IBlobFieldObject: TGUID = '{AF376827-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IDatabaseFieldDefinition: TGUID = '{AF37680E-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISubreportObject: TGUID = '{AF376810-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISubreportLinks: TGUID = '{AF37684E-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISubreportLink: TGUID = '{AF37684D-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ILineObject: TGUID = '{AF376828-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IBoxObject: TGUID = '{AF376829-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICrossTabObject: TGUID = '{AF37682A-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IObjectSummaryFieldDefinitions: TGUID = '{AF376852-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISummaryFieldDefinition: TGUID = '{AF376815-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IReportObject: TGUID = '{AF376808-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICrossTabGroups: TGUID = '{AF37684F-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICrossTabGroup: TGUID = '{AF376850-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICROleObject: TGUID = '{AF376826-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IGraphObject: TGUID = '{AF376824-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFieldDefinitions: TGUID = '{AF376851-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IDatabase: TGUID = '{AF376818-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IDatabaseTables: TGUID = '{AF376819-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IDatabaseTable: TGUID = '{AF37681A-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IDatabaseFieldDefinitions: TGUID = '{AF37681D-6120-4E28-96DD-63FD2DC27B7A}';
  IID_INameValuePairs: TGUID = '{AF376860-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ITableQualifiers: TGUID = '{18B4704D-8501-444C-8207-256BADB31F07}';
  IID_ITableLinks: TGUID = '{AF37681B-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ITableLink: TGUID = '{AF37681C-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFormulaFieldDefinitions: TGUID = '{AF37681E-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IFormulaFieldDefinition: TGUID = '{AF37680F-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IParameterFieldDefinitions: TGUID = '{AF37681F-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IParameterFieldDefinition: TGUID = '{AF376812-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IGroupNameFieldDefinitions: TGUID = '{AF376820-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IGroupNameFieldDefinition: TGUID = '{AF376813-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISummaryFieldDefinitions: TGUID = '{AF376821-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IPageEngine: TGUID = '{AF37682B-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IPageGenerator: TGUID = '{AF37682C-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IPages: TGUID = '{AF37682D-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IPage: TGUID = '{AF37682E-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IExportOptions: TGUID = '{AF37682F-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IApplication: TGUID = '{AF376830-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISortFields: TGUID = '{AF376831-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISortField: TGUID = '{AF376832-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IPrintingStatus: TGUID = '{AF376833-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IRunningTotalFieldDefinitions: TGUID = '{AF376822-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IRunningTotalFieldDefinition: TGUID = '{AF376816-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISQLExpressionFieldDefinitions: TGUID = '{AF376823-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ISQLExpressionFieldDefinition: TGUID = '{AF376817-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IReportAlerts: TGUID = '{AF37685C-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IReportAlert: TGUID = '{AF37685B-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IReportAlertInstances: TGUID = '{AF37685E-6120-4E28-96DD-63FD2DC27B7A}';
  IID_IReportAlertInstance: TGUID = '{AF37685D-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICrystalReportProperties: TGUID = '{3DCC8FB5-C434-11D1-A817-00A0C92784CD}';
  IID_ICrystalReportSourceProperties: TGUID = '{6876D971-F0F2-11D1-BEDF-00A0C95A6A5C}';
  IID_ICrystalReportSourceProperties2: TGUID = '{B25F55D1-2313-11D2-BF21-00A0C95A6A5C}';
  IID_ICrystalReportSourceProperties3: TGUID = '{25A6CB81-5A76-11D3-BFC3-00A0C9DA4FA2}';
  IID_ICrystalReportSourceProperties4: TGUID = '{A9A6C0EE-956B-4C15-9B1C-B4255508B244}';
  IID_ICrystalReportPrinterPort: TGUID = '{B4742013-45A6-11D1-ABEC-00A0C9274B91}';
  IID_ICrystalReportPrinterPortEx: TGUID = '{B4742143-45A6-11D1-ABEC-00A0C9274B91}';
  IID_ICrystalReportSourceEvents: TGUID = '{3DCC8FB3-C434-11D1-A817-00A0C92784CD}';
  DIID_IReportEvent: TGUID = '{AF376802-6120-4E28-96DD-63FD2DC27B7A}';
  IID_ICrystalReportExport: TGUID = '{BD10A9C0-07CC-11D2-BEFF-00A0C95A6A5C}';
  IID_ICrystalReportExportEvents: TGUID = '{4D773761-0AD4-11D2-BF01-00A0C95A6A5C}';
  CLASS_Report: TGUID = '{06D9CD51-12E4-49D2-BC0E-4F2EFE4AFD5D}';
  CLASS_Areas: TGUID = '{EFF90743-0D60-4D6E-89DF-00D11D5165F0}';
  CLASS_Sections: TGUID = '{1BEE8D05-97EE-441E-980B-E924F76CFE21}';
  CLASS_Area: TGUID = '{C52FD92C-32BE-4675-BAFA-71F025883885}';
  DIID_ISectionEvent: TGUID = '{AF37684B-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_Section: TGUID = '{89B48BC9-B291-43BB-B3C1-4034D9EEC792}';
  CLASS_ReportObjects: TGUID = '{0D7A42D4-84EF-4EF8-BBF3-2211B8800055}';
  CLASS_FieldObject: TGUID = '{657B50F9-8331-465C-A0A2-FD50A021A5C8}';
  CLASS_TextObject: TGUID = '{D02FABEB-E973-4F74-B044-C76AE84B0DBE}';
  CLASS_SubreportObject: TGUID = '{C24AFB57-CB1C-4901-BF3F-E4BE7A341157}';
  CLASS_DatabaseFieldDefinition: TGUID = '{1B3AB16F-780E-44C9-AA01-FEF75EB76C5F}';
  CLASS_FormulaFieldDefinition: TGUID = '{6395DE75-FC7B-40EA-9D51-B5893228CCBF}';
  CLASS_ParameterFieldDefinition: TGUID = '{A53F6187-5CDB-4449-B220-817EBBA1C637}';
  CLASS_GroupNameFieldDefinition: TGUID = '{0B664C3E-4291-4F0B-A792-D23AC3C7455D}';
  IID_ISpecialVarFieldDefinition: TGUID = '{AF376814-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_SpecialVarFieldDefinition: TGUID = '{5DC2D80B-7011-42F2-A739-9DBFCD838145}';
  CLASS_SummaryFieldDefinition: TGUID = '{16BF2029-A467-481A-9FAF-0AD0416269BC}';
  CLASS_RunningTotalFieldDefinition: TGUID = '{043C43ED-093C-4E58-91A1-BBADE89FF54F}';
  CLASS_SQLExpressionFieldDefinition: TGUID = '{B01DB520-B176-4CD0-8D2D-82A907F0B58D}';
  CLASS_Database: TGUID = '{5B869D00-1C1E-490E-9299-4A636FDE2465}';
  CLASS_DatabaseTables: TGUID = '{A3EA6D03-646F-42B8-8266-F6665A12B3B6}';
  CLASS_DatabaseTable: TGUID = '{93984E31-2F5F-4BD0-B2E8-37A32B6BC0C2}';
  CLASS_DatabaseFieldDefinitions: TGUID = '{380986F9-52A2-4AB0-A9CB-EEB3C65C1DC2}';
  CLASS_FormulaFieldDefinitions: TGUID = '{8F178643-C488-48A3-8B11-E45EBB1F22DA}';
  CLASS_ParameterFieldDefinitions: TGUID = '{EC995383-26CB-486B-B60D-127C33523203}';
  CLASS_GroupNameFieldDefinitions: TGUID = '{963D3187-8298-4C41-AA74-45899AA64120}';
  CLASS_SummaryFieldDefinitions: TGUID = '{4660223E-5DAB-401A-A6B4-B07BED8A6C83}';
  CLASS_RunningTotalFieldDefinitions: TGUID = '{9EEAFA4F-58AC-4A5F-8079-69DD716DEA7A}';
  CLASS_SQLExpressionFieldDefinitions: TGUID = '{0A91D185-8866-4C5B-B19F-AA97484F6C3D}';
  CLASS_GraphObject: TGUID = '{96C5C7E2-FAFD-449B-AB5D-ED4ADBCCBD8A}';
  IID_IMapObject: TGUID = '{AF376825-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_MapObject: TGUID = '{F8197462-39D7-48FE-8F63-A914FA7BDC89}';
  CLASS_OleObject: TGUID = '{A70E9FCF-12B8-4B02-9C9E-42713E70754E}';
  CLASS_BlobFieldObject: TGUID = '{019C4F26-5DC4-4610-9BE1-A58A0AA1ADD4}';
  CLASS_LineObject: TGUID = '{F4BA7DC0-3283-4966-AFF4-A4A6C6281816}';
  CLASS_BoxObject: TGUID = '{A13E3769-9375-4111-9A24-7A69E1689E17}';
  IID_IOlapGridObject: TGUID = '{AF37685F-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_OlapGridObject: TGUID = '{BBDB16B0-EA7E-434E-B690-CB22DAF59D92}';
  CLASS_CrossTabObject: TGUID = '{572C7E70-2395-4369-BA34-2FD28A6F5A14}';
  CLASS_PageEngine: TGUID = '{62BBEEFF-8C3D-487D-8192-BE317278EF5D}';
  CLASS_PageGenerator: TGUID = '{B3E25C4C-D016-4862-93A0-8211604FFEC3}';
  CLASS_Pages: TGUID = '{72C52F0E-9712-487F-9A67-C3F9B0668DA1}';
  CLASS_Page: TGUID = '{5062F2D0-F2C5-4978-8C7B-163CB034AE8B}';
  CLASS_ExportOptions: TGUID = '{CA5E1C27-100B-432E-B99C-8850B4F98284}';
  CLASS_Application: TGUID = '{166EB857-8CCD-4D83-8F27-CADDB2800374}';
  IID_IFormattingInfo: TGUID = '{AF37684C-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_FormattingInfo: TGUID = '{508169FC-BBCA-4AE0-845E-46A811FAF8C6}';
  CLASS_SortFields: TGUID = '{64B20BF0-C639-4A70-B1C4-74ECDBE875AC}';
  CLASS_SortField: TGUID = '{93FA0632-B378-483A-A8E8-9C6F78310E9A}';
  CLASS_PrintingStatus: TGUID = '{32548B65-D9C0-4C23-80BA-FBBE1E0961C1}';
  CLASS_SubreportLink: TGUID = '{99A590AD-CDE3-4CB1-BB00-D16BD45F9210}';
  CLASS_SubreportLinks: TGUID = '{5D8027A0-178D-4585-8DE6-6FBE6307E5EA}';
  CLASS_CrossTabGroups: TGUID = '{969BD12F-2EB7-4E8B-A124-09A18B4487F7}';
  CLASS_CrossTabGroup: TGUID = '{C2914CA5-99D3-4CE4-B561-5085403265C3}';
  CLASS_FieldDefinitions: TGUID = '{A9871FEB-F433-4F66-925E-21C8E5BC4453}';
  CLASS_ObjectSummaryFieldDefinitions: TGUID = '{AAB9D2E9-1F43-4E60-9EAD-8BE2930F5E27}';
  CLASS_TableLink: TGUID = '{A53EE091-7A27-4239-9745-F82B50B24854}';
  CLASS_TableLinks: TGUID = '{CDC53FCD-3341-42D3-9CF6-1518620672DC}';
  IID_IFieldMappingData: TGUID = '{AF376856-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_FieldMappingData: TGUID = '{6DE01B3F-92B6-437B-BDAC-12AE530A0978}';
  IID_IParameterValue: TGUID = '{AF376857-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_ParameterValue: TGUID = '{D6E643A3-F246-4A53-A302-A5E832613686}';
  IID_IParameterValues: TGUID = '{AF376858-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_ParameterValues: TGUID = '{5A1D1995-F01C-4C68-9BA8-38F86BC89FC8}';
  IID_IParameterValueInfo: TGUID = '{AF376859-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_ParameterValueInfo: TGUID = '{92231DF0-5BA9-4A37-8371-7A90718FC737}';
  IID_IParameterValueInfos: TGUID = '{AF37685A-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_ParameterValueInfos: TGUID = '{8F74D564-C34A-4FAD-AF80-C32C4B406B26}';
  CLASS_ReportAlert: TGUID = '{0FBE8A64-1761-4621-AC00-67BB1E88E4A8}';
  CLASS_ReportAlerts: TGUID = '{37A46097-B2B7-4132-926E-B7486616E2F5}';
  CLASS_ReportAlertInstance: TGUID = '{DD10AA5E-3BBE-4ABA-A1A9-42F6519CD38A}';
  CLASS_ReportAlertInstances: TGUID = '{E5FABDE6-9879-4060-8219-E0B833E96033}';
  CLASS_FieldElements: TGUID = '{6606BAE8-F9D5-4F80-8B0D-F315FE7BC123}';
  CLASS_FieldElement: TGUID = '{55C1F08B-D0B1-4DA1-BF6A-83946786AD4C}';
  CLASS_ConnectionProperties: TGUID = '{B5615F20-ABD8-4216-9BFE-0CC067D8CF06}';
  IID_IConnectionProperty: TGUID = '{AF376861-6120-4E28-96DD-63FD2DC27B7A}';
  CLASS_ConnectionProperty: TGUID = '{7F913D98-50D3-4C1F-B3B7-1AE915D8E4F7}';
  CLASS_TableQualifiers: TGUID = '{4356D065-B339-49D0-84D9-FB08D4EAE5AF}';
  IID_ICrystalReportSourceEx: TGUID = '{3DCC8FB6-C434-11D1-A817-00A0C92784CD}';
  IID_ICrystalReportSourceEx2: TGUID = '{B4742163-45A6-11D1-ABEC-00A0C9274B91}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum CRAreaKind
type
  CRAreaKind = TOleEnum;
const
  crReportHeader = $00000001;
  crPageHeader = $00000002;
  crGroupHeader = $00000003;
  crDetail = $00000004;
  crGroupFooter = $00000005;
  crPageFooter = $00000007;
  crReportFooter = $00000008;

// Constants for enum CRObjectKind
type
  CRObjectKind = TOleEnum;
const
  crFieldObject = $00000001;
  crTextObject = $00000002;
  crLineObject = $00000003;
  crBoxObject = $00000004;
  crSubreportObject = $00000005;
  crOleObject = $00000006;
  crGraphObject = $00000007;
  crCrossTabObject = $00000008;
  crBlobFieldObject = $00000009;
  crMapObject = $0000000A;
  crOlapGridObject = $0000000B;

// Constants for enum CRLineStyle
type
  CRLineStyle = TOleEnum;
const
  crLSNoLine = $00000000;
  crLSSingleLine = $00000001;
  crLSDoubleLine = $00000002;
  crLSDashLine = $00000003;
  crLSDotLine = $00000004;

// Constants for enum CRAlignment
type
  CRAlignment = TOleEnum;
const
  crDefaultAlign = $00000000;
  crLeftAlign = $00000001;
  crHorCenterAlign = $00000002;
  crRightAlign = $00000003;
  crJustified = $00000004;

// Constants for enum CRNegativeType
type
  CRNegativeType = TOleEnum;
const
  crNotNegative = $00000000;
  crLeadingMinus = $00000001;
  crTrailingMinus = $00000002;
  crBracketed = $00000003;

// Constants for enum CRRoundingType
type
  CRRoundingType = TOleEnum;
const
  crRoundToTenBillionth = $00000001;
  crRoundToBillionth = $00000002;
  crRoundToHundredMillionth = $00000003;
  crRoundToTenMillionth = $00000004;
  crRoundToMillionth = $00000005;
  crRoundToHundredThousandth = $00000006;
  crRoundToTenThousandth = $00000007;
  crRoundToThousandth = $00000008;
  crRoundToHundredth = $00000009;
  crRoundToTenth = $0000000A;
  crRoundToUnit = $0000000B;
  crRoundToTen = $0000000C;
  crRoundToHundred = $0000000D;
  crRoundToThousand = $0000000E;
  crRoundToTenThousand = $0000000F;
  crRoundToHundredThousand = $00000010;
  crRoundToMillion = $00000011;

// Constants for enum CRCurrencySymbolType
type
  CRCurrencySymbolType = TOleEnum;
const
  crCSTNoSymbol = $00000000;
  crCSTFixedSymbol = $00000001;
  crCSTFloatingSymbol = $00000002;

// Constants for enum CRCurrencyPositionType
type
  CRCurrencyPositionType = TOleEnum;
const
  crLeadingCurrencyInsideNegative = $00000000;
  crLeadingCurrencyOutsideNegative = $00000001;
  crTrailingCurrencyInsideNegative = $00000002;
  crTrailingCurrencyOutsideNegative = $00000003;

// Constants for enum CRBooleanOutputType
type
  CRBooleanOutputType = TOleEnum;
const
  crTrueOrFalse = $00000000;
  crTOrF = $00000001;
  crYesOrNo = $00000002;
  crYOrN = $00000003;
  crOneOrZero = $00000004;

// Constants for enum CRDateWindowsDefaultType
type
  CRDateWindowsDefaultType = TOleEnum;
const
  crUseWindowsLongDate = $00000000;
  crUseWindowsShortDate = $00000001;
  crNotUsingWindowsDefaults = $00000002;

// Constants for enum CRDateOrder
type
  CRDateOrder = TOleEnum;
const
  crYearMonthDay = $00000000;
  crDayMonthYear = $00000001;
  crMonthDayYear = $00000002;

// Constants for enum CRYearType
type
  CRYearType = TOleEnum;
const
  crShortYear = $00000000;
  crLongYear = $00000001;
  crNoYear = $00000002;

// Constants for enum CRMonthType
type
  CRMonthType = TOleEnum;
const
  crNumericMonth = $00000000;
  crLeadingZeroNumericMonth = $00000001;
  crShortMonth = $00000002;
  crLongMonth = $00000003;
  crNoMonth = $00000004;

// Constants for enum CRDayType
type
  CRDayType = TOleEnum;
const
  crNumericDay = $00000000;
  crLeadingZeroNumericDay = $00000001;
  crNoDay = $00000002;

// Constants for enum CRLeadingDayType
type
  CRLeadingDayType = TOleEnum;
const
  crShortLeadingDay = $00000000;
  crLongLeadingDay = $00000001;
  crNoLeadingDay = $00000002;

// Constants for enum CRTimeBase
type
  CRTimeBase = TOleEnum;
const
  cr12Hour = $00000000;
  cr24Hour = $00000001;

// Constants for enum CRAmPmType
type
  CRAmPmType = TOleEnum;
const
  crAmPmBefore = $00000000;
  crAmPmAfter = $00000001;

// Constants for enum CRHourType
type
  CRHourType = TOleEnum;
const
  crNumericHour = $00000000;
  crNumericHourNoLeadingZero = $00000001;
  crNoHour = $00000002;

// Constants for enum CRMinuteType
type
  CRMinuteType = TOleEnum;
const
  crNumericMinute = $00000000;
  crNumericMinuteNoLeadingZero = $00000001;
  crNoMinute = $00000002;

// Constants for enum CRSecondType
type
  CRSecondType = TOleEnum;
const
  crNumericSecond = $00000000;
  crNumericSecondNoLeadingZero = $00000001;
  crNumericNoSecond = $00000002;

// Constants for enum CRLeadingDayPosition
type
  CRLeadingDayPosition = TOleEnum;
const
  crLeadingDayOfWeek = $00000000;
  crTrailingDayOfWeek = $00000001;

// Constants for enum CRDateEraType
type
  CRDateEraType = TOleEnum;
const
  crShortEra = $00000000;
  crLongEra = $00000001;
  crNoEra = $00000002;

// Constants for enum CRDateCalendarType
type
  CRDateCalendarType = TOleEnum;
const
  crGregorianCalendar = $00000001;
  crGregorianUSCalendar = $00000002;
  crJapaneseCalendar = $00000003;
  crTaiwaneseCalendar = $00000004;
  crKoreanCalendar = $00000005;
  crHijriCalendar = $00000006;
  crThaiCalendar = $00000007;
  crHebrewCalendar = $00000008;
  crGregorianMEFrenchCalendar = $00000009;
  crGregorianArabicCalendar = $0000000A;
  crGregorianXlitEnglishCalendar = $0000000B;
  crGregorianXlitFrenchCalendar = $0000000C;

// Constants for enum CRLineSpacingType
type
  CRLineSpacingType = TOleEnum;
const
  crMultipleSpacing = $00000000;
  crExactSpacing = $00000001;

// Constants for enum CRRotationAngle
type
  CRRotationAngle = TOleEnum;
const
  crRotate0 = $00000000;
  crRotate90 = $00000001;
  crRotate270 = $00000002;

// Constants for enum CRTextFormat
type
  CRTextFormat = TOleEnum;
const
  crStandardText = $00000000;
  crRTFText = $00000001;
  crHTMLText = $00000002;

// Constants for enum CRHyperlinkType
type
  CRHyperlinkType = TOleEnum;
const
  crHyperlinkWebsite = $00000000;
  crHyperlinkEmail = $00000001;
  crHyperlinkHtml = $00000002;
  crHyperlinkCrystalReport = $00000003;
  crHyperlinkWebsiteFieldValue = $00000004;
  crHyperlinkEmailFieldValue = $00000005;
  crHyperlinkUndefined = $00000006;
  crHyperlinkDrilldown = $00000007;
  crHyperlinkReportObject = $00000008;

// Constants for enum CRFieldKind
type
  CRFieldKind = TOleEnum;
const
  crDatabaseField = $00000001;
  crFormulaField = $00000002;
  crSummaryField = $00000003;
  crSpecialVarField = $00000004;
  crGroupNameField = $00000005;
  crParameterField = $00000006;
  crRunningTotalField = $00000007;
  crSQLExpressionField = $00000008;

// Constants for enum __MIDL___MIDL_itf_crvb60r_0280_0001
type
  __MIDL___MIDL_itf_crvb60r_0280_0001 = TOleEnum;
const
  crInt8sField = $00000001;
  crInt8uField = $00000002;
  crInt16sField = $00000003;
  crInt16uField = $00000004;
  crInt32sField = $00000005;
  crInt32uField = $00000006;
  crNumberField = $00000007;
  crCurrencyField = $00000008;
  crBooleanField = $00000009;
  crDateField = $0000000A;
  crTimeField = $0000000B;
  crStringField = $0000000C;
  crTransientMemoField = $0000000D;
  crPersistentMemoField = $0000000E;
  crBlobField = $0000000F;
  crDateTimeField = $00000010;
  crBitmapField = $00000011;
  crIconField = $00000012;
  crPictureField = $00000013;
  crOleField = $00000014;
  crChartField = $00000015;
  crUnknownField = $00000016;

// Constants for enum CRSpecialVarType
type
  CRSpecialVarType = TOleEnum;
const
  crSVTPrintDate = $00000000;
  crSVTPrintTime = $00000001;
  crSVTModificationDate = $00000002;
  crSVTModificationTime = $00000003;
  crSVTDataDate = $00000004;
  crSVTDataTime = $00000005;
  crSVTRecordNumber = $00000006;
  crSVTPageNumber = $00000007;
  crSVTGroupNumber = $00000008;
  crSVTTotalPageCount = $00000009;
  crSVTReportTitle = $0000000A;
  crSVTReportComments = $0000000B;
  crSVTRecordSelection = $0000000C;
  crSVTGroupSelection = $0000000D;
  crSVTFilename = $0000000E;
  crSVTFileAuthor = $0000000F;
  crSVTFileCreationDate = $00000010;
  crSVTPageNofM = $00000011;
  crSVHPageNumber = $00000012;
  crSVCurrentUserName = $00000013;
  crSVCurrentUserID = $00000014;
  crSVCurrentUserTimeZone = $00000015;
  crSVPrintTimeZone = $00000016;
  crSVDataTimeZone = $00000017;
  crSVContentLocale = $00000018;

// Constants for enum CRSummaryType
type
  CRSummaryType = TOleEnum;
const
  crSTSum = $00000000;
  crSTAverage = $00000001;
  crSTSampleVariance = $00000002;
  crSTSampleStandardDeviation = $00000003;
  crSTMaximum = $00000004;
  crSTMinimum = $00000005;
  crSTCount = $00000006;
  crSTPopVariance = $00000007;
  crSTPopStandardDeviation = $00000008;
  crSTDistinctCount = $00000009;
  crSTDCorrelation = $0000000A;
  crSTDCovariance = $0000000B;
  crSTDWeightedAvg = $0000000C;
  crSTDMedian = $0000000D;
  crSTDPercentile = $0000000E;
  crSTDNthLargest = $0000000F;
  crSTDNthSmallest = $00000010;
  crSTDMode = $00000011;
  crSTDNthMostFrequent = $00000012;
  crSTDPercentage = $00000013;

// Constants for enum CRHierarchicalSummaryType
type
  CRHierarchicalSummaryType = TOleEnum;
const
  crHierarchicalSummaryNone = $00000000;
  crSummaryAcrossHierarchy = $00000001;

// Constants for enum CRGroupCondition
type
  CRGroupCondition = TOleEnum;
const
  crGCDaily = $00000000;
  crGCWeekly = $00000001;
  crGCBiweekly = $00000002;
  crGCSemimonthly = $00000003;
  crGCMonthly = $00000004;
  crGCQuarterly = $00000005;
  crGCSemiAnnually = $00000006;
  crGCAnnually = $00000007;
  crGCToYes = $00000008;
  crGCToNo = $00000009;
  crGCEveryYes = $0000000A;
  crGCEveryNo = $0000000B;
  crGCNextIsYes = $0000000C;
  crGCNextIsNo = $0000000D;
  crGCAnyValue = $0000000E;
  crGCBySecond = $0000000F;
  crGCByMinute = $00000010;
  crGCByHour = $00000011;
  crGCByAMPM = $00000012;

// Constants for enum CRSortDirection
type
  CRSortDirection = TOleEnum;
const
  crAscendingOrder = $00000000;
  crDescendingOrder = $00000001;
  crOriginalOrder = $00000002;
  crSpecifiedOrder = $00000003;

// Constants for enum CRGraphDataType
type
  CRGraphDataType = TOleEnum;
const
  crGroupGraph = $00000000;
  crDetailGraph = $00000001;
  crCrossTabGraph = $00000002;
  crOlapGraph = $00000003;

// Constants for enum CRGraphType
type
  CRGraphType = TOleEnum;
const
  crSideBySideBarGraph = $00000000;
  crStackedBarGraph = $00000001;
  crPercentBarGraph = $00000002;
  crFaked3DSideBySideBarGraph = $00000003;
  crFaked3DStackedBarGraph = $00000004;
  crFaked3DPercentBarGraph = $00000005;
  crRegularLineGraph = $0000000A;
  crStackedLineGraph = $0000000B;
  crPercentageLineGraph = $0000000C;
  crLineGraphWithMarkers = $0000000D;
  crStackedLineGraphWithMarkers = $0000000E;
  crPercentageLineGraphWithMarkers = $0000000F;
  crStackedAreaGraph = $00000015;
  crPercentAreaGraph = $00000016;
  crFaked3DStackedAreaGraph = $00000018;
  crFaked3DPercentAreaGraph = $00000019;
  crRegularPieGraph = $0000001E;
  crFaked3DRegularPieGraph = $0000001F;
  crMultiplePieGraph = $00000020;
  crMultipleProportionalPieGraph = $00000021;
  crRegularDoughnutGraph = $00000028;
  crMultipleDoughnutGraph = $00000029;
  crMultipleProportionalDoughnutGraph = $0000002A;
  crThreeDRegularGraph = $00000032;
  crThreeDPyramidGraph = $00000033;
  crThreeDOctagonGraph = $00000034;
  crThreeDCutCornersGraph = $00000035;
  crThreeDSurfaceRegularGraph = $0000003C;
  crThreeDSurfaceWithSidesGraph = $0000003D;
  crThreeDSurfaceHoneycombGraph = $0000003E;
  crXyScatterGraph = $00000046;
  crRegularRadarGraph = $00000050;
  crStackedRadarGraph = $00000051;
  crRegularBubbleGraph = $0000005A;
  crHighLowGraph = $00000064;
  crHighLowOpenCloseGraph = $00000068;
  crUnknownGraph = $000003E8;

// Constants for enum CRGraphDataPoint
type
  CRGraphDataPoint = TOleEnum;
const
  crNone = $00000000;
  crShowLabel = $00000001;
  crShowValue = $00000002;

// Constants for enum CRGridlineType
type
  CRGridlineType = TOleEnum;
const
  crNoGridlines = $00000000;
  crMinorGridlines = $00000001;
  crMajorGridlines = $00000002;
  crMajorAndMinorGridlines = $00000003;

// Constants for enum CRLegendPosition
type
  CRLegendPosition = TOleEnum;
const
  crPlaceRight = $00000004;
  crPlaceLeft = $00000005;
  crPlaceBottom = $00000006;
  crPlaceCustom = $00000007;

// Constants for enum CRGraphDirection
type
  CRGraphDirection = TOleEnum;
const
  crHorizontalGraph = $00000000;
  crVerticalGraph = $00000001;

// Constants for enum CRPieSize
type
  CRPieSize = TOleEnum;
const
  crMinimumPieSize = $00000040;
  crSmallPieSize = $00000030;
  crAveragePieSize = $00000020;
  crLargePieSize = $00000010;
  crMaximumPieSize = $00000000;

// Constants for enum CRSliceDetachment
type
  CRSliceDetachment = TOleEnum;
const
  crNoDetachment = $00000000;
  crSmallestSlice = $00000001;
  crLargestSlice = $00000002;

// Constants for enum CRBarSize
type
  CRBarSize = TOleEnum;
const
  crMinimumBarSize = $00000000;
  crSmallBarSize = $00000001;
  crAverageBarSize = $00000002;
  crLargeBarSize = $00000003;
  crMaximumBarSize = $00000004;

// Constants for enum CRMarkerSize
type
  CRMarkerSize = TOleEnum;
const
  crSmallMarkers = $00000000;
  crMediumSmallMarkers = $00000001;
  crMediumMarkers = $00000002;
  crMediumLargeMarkers = $00000003;
  crLargeMarkers = $00000004;

// Constants for enum CRMarkerShape
type
  CRMarkerShape = TOleEnum;
const
  crRectangleShape = $00000001;
  crCircleShape = $00000004;
  crDiamondShape = $00000005;
  crTriangleShape = $00000008;

// Constants for enum CRNumberFormat
type
  CRNumberFormat = TOleEnum;
const
  crNoDecimal = $00000000;
  crOneDecimal = $00000001;
  crTwoDecimal = $00000002;
  crCurrencyNoDecimal = $00000003;
  crCurrencyTwoDecimal = $00000004;
  crPercentNoDecimal = $00000005;
  crPercentOneDecimal = $00000006;
  crPercentTwoDecimal = $00000007;
  crCustomNumberFormat = $00000008;
  crThousandsNoDecimal = $00000009;
  crMillionsNoDecimal = $0000000A;
  crCurrencyThousands = $0000000B;
  crCurrencyMillions = $0000000C;

// Constants for enum CRDivisionMethod
type
  CRDivisionMethod = TOleEnum;
const
  crAutomaticDivision = $00000000;
  crManualDivision = $00000001;

// Constants for enum CRGraphColor
type
  CRGraphColor = TOleEnum;
const
  crColorGraph = $00000000;
  crBlackAndWhiteGraph = $00000001;

// Constants for enum CRViewingAngle
type
  CRViewingAngle = TOleEnum;
const
  crStandardView = $00000001;
  crTallView = $00000002;
  crTopView = $00000003;
  crDistortedView = $00000004;
  crShortView = $00000005;
  crGroupEyeView = $00000006;
  crGroupEmphasisView = $00000007;
  crFewSeriesView = $00000008;
  crFewGroupsView = $00000009;
  crDistortedStdView = $0000000A;
  crThickGroupsView = $0000000B;
  crShorterView = $0000000C;
  crThickSeriesView = $0000000D;
  crThickStdView = $0000000E;
  crBirdsEyeView = $0000000F;
  crMaxView = $00000010;

// Constants for enum CRPieLegendLayout
type
  CRPieLegendLayout = TOleEnum;
const
  crPercentLayout = $00000000;
  crAmountLayout = $00000001;
  crBothLayout = $00000002;
  crNoneLayout = $00000003;

// Constants for enum CRTopBottomNGroupSortOrder
type
  CRTopBottomNGroupSortOrder = TOleEnum;
const
  crAllGroupsUnsorted = $00000000;
  crAllGroupsSorted = $00000001;
  crTopNGroups = $00000002;
  crBottomNGroups = $00000003;
  crUnknownGroupsSortOrder = $0000000A;

// Constants for enum CRConvertDateTimeType
type
  CRConvertDateTimeType = TOleEnum;
const
  crConvertDateTimeToString = $00000000;
  crConvertDateTimeToDate = $00000001;
  crKeepDateTimeType = $00000002;

// Constants for enum CRDatabaseType
type
  CRDatabaseType = TOleEnum;
const
  crStandardDatabase = $00000001;
  crSQLDatabase = $00000002;

// Constants for enum CRLinkJoinType
type
  CRLinkJoinType = TOleEnum;
const
  crJTEqual = $00000004;
  crJTLeftOuter = $00000005;
  crJTRightOutter = $00000006;
  crJROuter = $00000007;
  crJTGreaterThan = $00000008;
  crJTLessThan = $00000009;
  crJTGreaterOrEqual = $0000000A;
  crJTLessOrEqual = $0000000B;
  crJTNotEqual = $0000000C;
  crJTAdvance = $0000000D;

// Constants for enum CRLinkLookUpType
type
  CRLinkLookUpType = TOleEnum;
const
  crLTLookupParallel = $00000001;
  crLTLookupProduct = $00000002;
  crLTLookupSeries = $00000003;

// Constants for enum CRPaperOrientation
type
  CRPaperOrientation = TOleEnum;
const
  crDefaultPaperOrientation = $00000000;
  crPortrait = $00000001;
  crLandscape = $00000002;

// Constants for enum CRPaperSize
type
  CRPaperSize = TOleEnum;
const
  crDefaultPaperSize = $00000000;
  crPaperLetter = $00000001;
  crPaperLetterSmall = $00000002;
  crPaperTabloid = $00000003;
  crPaperLedger = $00000004;
  crPaperLegal = $00000005;
  crPaperStatement = $00000006;
  crPaperExecutive = $00000007;
  crPaperA3 = $00000008;
  crPaperA4 = $00000009;
  crPaperA4Small = $0000000A;
  crPaperA5 = $0000000B;
  crPaperB4 = $0000000C;
  crPaperB5 = $0000000D;
  crPaperFolio = $0000000E;
  crPaperQuarto = $0000000F;
  crPaper10x14 = $00000010;
  crPaper11x17 = $00000011;
  crPaperNote = $00000012;
  crPaperEnvelope9 = $00000013;
  crPaperEnvelope10 = $00000014;
  crPaperEnvelope11 = $00000015;
  crPaperEnvelope12 = $00000016;
  crPaperEnvelope14 = $00000017;
  crPaperCsheet = $00000018;
  crPaperDsheet = $00000019;
  crPaperEsheet = $0000001A;
  crPaperEnvelopeDL = $0000001B;
  crPaperEnvelopeC5 = $0000001C;
  crPaperEnvelopeC3 = $0000001D;
  crPaperEnvelopeC4 = $0000001E;
  crPaperEnvelopeC6 = $0000001F;
  crPaperEnvelopeC65 = $00000020;
  crPaperEnvelopeB4 = $00000021;
  crPaperEnvelopeB5 = $00000022;
  crPaperEnvelopeB6 = $00000023;
  crPaperEnvelopeItaly = $00000024;
  crPaperEnvelopeMonarch = $00000025;
  crPaperEnvelopePersonal = $00000026;
  crPaperFanfoldUS = $00000027;
  crPaperFanfoldStdGerman = $00000028;
  crPaperFanfoldLegalGerman = $00000029;
  crPaperUser = $00000100;

// Constants for enum CRParameterFieldType
type
  CRParameterFieldType = TOleEnum;
const
  crReportParameter = $00000000;
  crQueryParameter = $00000001;
  crStoreProcedureParameter = $00000002;

// Constants for enum CRDiscreteOrRangeKind
type
  CRDiscreteOrRangeKind = TOleEnum;
const
  crDiscreteValue = $00000000;
  crRangeValue = $00000001;
  crDiscreteAndRangeValue = $00000002;

// Constants for enum CRRangeInfo
type
  CRRangeInfo = TOleEnum;
const
  crRangeNotIncludeUpperLowerBound = $00000000;
  crRangeIncludeUpperBound = $00000001;
  crRangeIncludeLowerBound = $00000002;
  crRangeNoUpperBound = $00000004;
  crRangeNoLowerBound = $00000008;

// Constants for enum CRParameterPicklistSortMethod
type
  CRParameterPicklistSortMethod = TOleEnum;
const
  crNoSort = $00000000;
  crAlphanumericAscending = $00000001;
  crAlphanumericDescending = $00000002;
  crNumericAscending = $00000003;
  crNumericDescending = $00000004;

// Constants for enum CRReportKind
type
  CRReportKind = TOleEnum;
const
  crColumnarReport = $00000001;
  crLabelReport = $00000002;
  crMulColumnReport = $00000003;

// Constants for enum CRImageType
type
  CRImageType = TOleEnum;
const
  crImageUnknown = $00000000;
  crDIBImageType = $00000001;
  crJPEGImageType = $00000002;

// Constants for enum CRRenderResultType
type
  CRRenderResultType = TOleEnum;
const
  crUISafeArrayType = $00002011;
  crBSTRType = $00000008;

// Constants for enum CRHTMLPageStyle
type
  CRHTMLPageStyle = TOleEnum;
const
  crPlainPageStyle = $00000000;
  crToolbarPageStyle = $00000001;
  crFramePageStyle = $00000002;
  crToolbarAtTopPageStyle = $00000003;
  crToolbarAtBottomPageStyle = $00000004;

// Constants for enum CRHTMLToolbarStyle
type
  CRHTMLToolbarStyle = TOleEnum;
const
  crToolbarRefreshButton = $00000001;
  crToolbarSearchBox = $00000002;

// Constants for enum CRSearchDirection
type
  CRSearchDirection = TOleEnum;
const
  crForward = $00000000;
  crBackward = $00000001;

// Constants for enum CRPlaceHolderType
type
  CRPlaceHolderType = TOleEnum;
const
  crDelayTotalPageCountCalc = $00000001;
  crAllowPlaceHolders = $00000002;

// Constants for enum CRValueFormatType
type
  CRValueFormatType = TOleEnum;
const
  crIncludeFieldValues = $00000001;
  crIncludeHiddenFields = $00000002;
  crAllowComplexFieldFormatting = $00000004;

// Constants for enum CRExportFormatType
type
  CRExportFormatType = TOleEnum;
const
  crEFTNoFormat = $00000000;
  crEFTCrystalReport = $00000001;
  crEFTDataInterchange = $00000002;
  crEFTRecordStyle = $00000003;
  crEFTRichText = $00000004;
  crEFTCommaSeparatedValues = $00000005;
  crEFTTabSeparatedValues = $00000006;
  crEFTCharSeparatedValues = $00000007;
  crEFTText = $00000008;
  crEFTTabSeparatedText = $00000009;
  crEFTPaginatedText = $0000000A;
  crEFTLotus123WKS = $0000000B;
  crEFTLotus123WK1 = $0000000C;
  crEFTLotus123WK3 = $0000000D;
  crEFTWordForWindows = $0000000E;
  crEFTExcel21 = $00000012;
  crEFTExcel30 = $00000013;
  crEFTExcel40 = $00000014;
  crEFTExcel50 = $00000015;
  crEFTExcel50Tabular = $00000016;
  crEFTODBC = $00000017;
  crEFTHTML32Standard = $00000018;
  crEFTExplorer32Extend = $00000019;
  crEFTNetScape20 = $0000001A;
  crEFTExcel70 = $0000001B;
  crEFTExcel70Tabular = $0000001C;
  crEFTExcel80 = $0000001D;
  crEFTExcel80Tabular = $0000001E;
  crEFTPortableDocFormat = $0000001F;
  crEFTHTML40 = $00000020;
  crEFTCrystalReport70 = $00000021;
  crEFTReportDefinition = $00000022;
  crEFTExactRichText = $00000023;
  crEFTExcel97 = $00000024;
  crEFTXML = $00000025;
  crEFTExcelDataOnly = $00000026;
  crEFTEditableRichText = $00000027;
  crEFTSeparatedValues = $00000028;

// Constants for enum CRExportDestinationType
type
  CRExportDestinationType = TOleEnum;
const
  crEDTNoDestination = $00000000;
  crEDTDiskFile = $00000001;
  crEDTEMailMAPI = $00000002;
  crEDTEMailVIM = $00000003;
  crEDTMicrosoftExchange = $00000004;
  crEDTApplication = $00000005;
  crEDTLotusDomino = $00000006;

// Constants for enum CRExchangeDestinationType
type
  CRExchangeDestinationType = TOleEnum;
const
  crExhangeFolderType = $00000000;
  crExchangePostDocMessage = $000003F3;

// Constants for enum CRExcelExportPageAreaPair
type
  CRExcelExportPageAreaPair = TOleEnum;
const
  crExportNoPageAreaPair = $00000000;
  crExportPageAreaPairOncePerReport = $00000001;
  crExportPageAreaPairForEachPage = $00000002;

// Constants for enum CRPrintingProgress
type
  CRPrintingProgress = TOleEnum;
const
  crPrintingNotStarted = $00000001;
  crPrintingInProgress = $00000002;
  crPrintingCompleted = $00000003;
  crPrintingFailed = $00000004;
  crPrintingCancelled = $00000005;
  crPrintingHalted = $00000006;

// Constants for enum CRRunningTotalCondition
type
  CRRunningTotalCondition = TOleEnum;
const
  crRTEvalNoCondition = $00000000;
  crRTEvalOnChangeOfField = $00000001;
  crRTEvalOnChangeOfGroup = $00000002;
  crRTEvalOnFormula = $00000003;

// Constants for enum CRReportVariableValueType
type
  CRReportVariableValueType = TOleEnum;
const
  crRVNumber = $00000000;
  crRVCurrency = $00000001;
  crRVBoolean = $00000002;
  crRVDate = $00000003;
  crRVTime = $00000004;
  crRVDateTime = $00000005;
  crRVString = $00000006;

// Constants for enum CRReportFormatStyle
type
  CRReportFormatStyle = TOleEnum;
const
  crRFStandardStyle = $00000000;
  crRFLeadingBreakStyle = $00000001;
  crRFTrailingBreakStyle = $00000002;
  crRFTableStyle = $00000003;
  crRFDropTableStyle = $00000004;
  crRFExecutiveLeadingBreakStyle = $00000005;
  crRFExecutiveTrailingBreakStyle = $00000006;
  crRFShadingStyle = $00000007;
  crRFRedBlueBorderStyle = $00000008;
  crRFMartoonTealBoxStyle = $00000009;

// Constants for enum CRPrinterDuplexType
type
  CRPrinterDuplexType = TOleEnum;
const
  crPRDPDefault = $00000000;
  crPRDPSimplex = $00000001;
  crPRDPVertical = $00000002;
  crPRDPHorizontal = $00000003;

// Constants for enum CRPaperSource
type
  CRPaperSource = TOleEnum;
const
  crPRBinUpper = $00000001;
  crPRBinLower = $00000002;
  crPRBinMiddle = $00000003;
  crPRBinManual = $00000004;
  crPRBinEnvelope = $00000005;
  crPRBinEnvManual = $00000006;
  crPRBinAuto = $00000007;
  crPRBinTractor = $00000008;
  crPRBinSmallFmt = $00000009;
  crPRBinLargeFmt = $0000000A;
  crPRBinLargeCapacity = $0000000B;
  crPRBinCassette = $0000000E;
  crPRBinFormSource = $0000000F;

// Constants for enum CRBindingMatchType
type
  CRBindingMatchType = TOleEnum;
const
  crBMTName = $00000000;
  crBMTNameAndValue = $00000001;

// Constants for enum CRReportFileFormat
type
  CRReportFileFormat = TOleEnum;
const
  crDefaultFileFormat = $00000000;
  cr70FileFormat = $00000700;
  cr80FileFormat = $00000800;

// Constants for enum CRFieldMappingType
type
  CRFieldMappingType = TOleEnum;
const
  crAutoFieldMapping = $00000000;
  crPromptFieldMapping = $00000001;
  crEventFieldMapping = $00000002;

// Constants for enum CRFormulaSyntax
type
  CRFormulaSyntax = TOleEnum;
const
  crCrystalSyntaxFormula = $00000000;
  crBasicSyntaxFormula = $00000001;

// Constants for enum CROpenReportMethod
type
  CROpenReportMethod = TOleEnum;
const
  crOpenReportByDefault = $00000000;
  crOpenReportByTempCopy = $00000001;

// Constants for enum CRSectionAreaFormatConditionFormulaType
type
  CRSectionAreaFormatConditionFormulaType = TOleEnum;
const
  crSectionAreaEnableSuppressConditionFormulaType = $00000000;
  crSectionAreaEnablePrintAtBottomOfPageConditionFormulaType = $00000001;
  crSectionAreaEnableNewPageAfterConditionFormulaType = $00000002;
  crSectionAreaEnableNewPageBeforeConditionFormulaType = $00000003;
  crSectionAreaEnableKeepTogetherConditionFormulaType = $00000004;
  crSectionAreaEnableSuppressIfBlankConditionFormulaType = $00000005;
  crSectionAreaEnableResetPageNumberAfterConditionFormulaType = $00000006;
  crSectionAreaEnableUnderlaySectionConditionFormulaType = $00000007;
  crSectionAreaBackgroundColorConditionFormulaType = $00000008;
  crSectionAreaShowAreaConditionFormulaType = $00000009;
  crSectionAreaEnableHideForDrillDownConditionFormulaType = $0000000A;
  crSectionAreaCssClassConditionFormulaType = $0000000B;

// Constants for enum CRBooleanFieldFormatConditionFormulaType
type
  CRBooleanFieldFormatConditionFormulaType = TOleEnum;
const
  crOutputFormatConditionFormulaType = $00000014;

// Constants for enum CRBorderConditionFormulaType
type
  CRBorderConditionFormulaType = TOleEnum;
const
  crLeftLineStyleConditionFormulaType = $00000028;
  crRightLineStyleConditionFormulaType = $00000029;
  crTopLineStyleConditionFormulaType = $0000002A;
  crBottomLineStyleConditionFormulaType = $0000002B;
  crHasDropShadowConditionFormulaType = $0000002C;
  crBackgroundColorConditionFormulaType = $0000002D;
  crBorderColorConditionFormulaType = $0000002E;
  crTightHorizontalConditionFormulaType = $0000002F;
  crTightVerticalConditionFormulaType = $00000030;

// Constants for enum CRObjectFormatConditionFormulaType
type
  CRObjectFormatConditionFormulaType = TOleEnum;
const
  crEnableSuppressConditionFormulaType = $0000003C;
  crEnableKeepTogetherConditionFormulaType = $0000003D;
  crEnableCloseAtPageBreakConditionFormulaType = $0000003E;
  crHorizontalAlignmentConditionFormulaType = $0000003F;
  crEnableCanGrowConditionFormulaType = $00000040;
  crToolTipTextConditionFormulaType = $00000041;
  crRotationConditionFormulaType = $00000042;
  crHyperLinkConditionFormulaType = $00000043;
  crCssClassConditionFormulaType = $00000044;
  crDeltaXConditionFormulaType = $00000045;
  crDeltaWidthConditionFormulaType = $00000046;

// Constants for enum CRCommonFieldFormatConditionFormulaType
type
  CRCommonFieldFormatConditionFormulaType = TOleEnum;
const
  crSuppressIfDuplicatedConditionFormulaType = $00000050;
  crUseSystemDefaultConditionFormulaType = $00000051;

// Constants for enum CRNumericFieldFormatConditionFormulaType
type
  CRNumericFieldFormatConditionFormulaType = TOleEnum;
const
  crNDecimalPlacesConditionFormulaType = $00000064;
  crRoundingFormatConditionFormulaType = $00000065;
  crEnableUseLeadZeroConditionFormulaType = $00000066;
  crNegativeFormatConditionFormulaType = $00000067;
  crCurrencySymbolFormatConditionFormulaType = $00000068;
  crEnableSuppressIfZeroConditionFormulaType = $00000069;
  crThousandsSeparatorConditionFormulaType = $0000006A;
  crThousandSymbolConditionFormulaType = $0000006B;
  crDecimalSymbolConditionFormulaType = $0000006C;
  crCurrencySymbolConditionFormulaType = $0000006D;
  crHasOneSymbolPerPageConditionFormulaType = $0000006E;
  crCurrencyPositionConditionFormulaType = $0000006F;
  crDisplayReverseSignConditionFormulaType = $00000070;
  crZeroValueStringConditionFormulaType = $00000071;
  crAllowFieldClippingConditionFormulaType = $00000072;

// Constants for enum CRDateFieldFormatConditionFormulaType
type
  CRDateFieldFormatConditionFormulaType = TOleEnum;
const
  crYearFormatConditionFormulaType = $00000078;
  crMonthFormatConditionFormulaType = $00000079;
  crDayFormatConditionFormulaType = $0000007A;
  crWindowsDefaultTypeConditionFormulaType = $0000007B;
  crDateOrderConditionFormulaType = $0000007C;
  crDayOfWeekTypeConditionFormulaType = $0000007D;
  crDayOfWeekSeparatorConditionFormulaType = $0000007E;
  crDayOfWeekPositionConditionFormulaType = $0000007F;
  crDateFirstSeparatorConditionFormulaType = $00000080;
  crDateSecondSeparatorConditionFormulaType = $00000081;
  crEraTypeConditionFormulaType = $00000082;
  crCalendarTypeConditionFormulaType = $00000083;
  crDatePrefixSeparatorConditionFormulaType = $00000084;
  crDateSuffixSeparatorConditionFormulaType = $00000085;
  crDayOfWeekEnclosureConditionFormulaType = $00000086;

// Constants for enum CRDateTimeFieldFormatConditionFormulaType
type
  CRDateTimeFieldFormatConditionFormulaType = TOleEnum;
const
  crDateTimeOrderConditionFormulaType = $0000008C;
  crDateTimeSeparatorConditionFormulaType = $0000008D;

// Constants for enum CRTimeFieldFormatConditionFormulaType
type
  CRTimeFieldFormatConditionFormulaType = TOleEnum;
const
  crTimeBaseConditionFormulaType = $000000A0;
  crAMPMFormatConditionFormulaType = $000000A1;
  crHourFormatConditionFormulaType = $000000A2;
  crMinuteFormatConditionFormulaType = $000000A3;
  crSecondFormatConditionFormulaType = $000000A4;
  crPMStringConditionFormulaType = $000000A5;
  crAMStringConditionFormulaType = $000000A6;
  crMinuteSecondSeparatorConditionFormulaType = $000000A7;
  crHourMinuteSeparatorConditionFormulaType = $000000A8;

// Constants for enum CRFontColorConditionFormulaType
type
  CRFontColorConditionFormulaType = TOleEnum;
const
  crColorConditionFormulaType = $000000B4;
  crFontConditionFormulaType = $000000B5;
  crFontStyleConditionFormulaType = $000000B6;
  crFontSizeConditionFormulaType = $000000B7;
  crFontStrikeOutConditionFormulaType = $000000B8;
  crFontUnderLineConditionFormulaType = $000000B9;

// Constants for enum CRStringFieldConditionFormulaType
type
  CRStringFieldConditionFormulaType = TOleEnum;
const
  crTextInterpretationConditionFormulaType = $000000C8;

// Constants for enum CRSubreportConditionFormulaType
type
  CRSubreportConditionFormulaType = TOleEnum;
const
  crCaptionConditionFormulaType = $000000DC;
  crDrillDownTabTextConditionFormulaType = $000000DD;

// Constants for enum CRTableDifferences
type
  CRTableDifferences = TOleEnum;
const
  crTDOK = $00000000;
  crTDDatabaseNotFound = $00000001;
  crTDServerNotFound = $00000002;
  crTDServerNotOpened = $00000004;
  crTDAliasChanged = $00000008;
  crTDIndexesChanged = $00000010;
  crTDDriverChanged = $00000020;
  crTDDictionaryChanged = $00000040;
  crTDFileTypeChanged = $00000080;
  crTDRecordSizeChanged = $00000100;
  crTDAccessChanged = $00000200;
  crTDParametersChanged = $00000400;
  crTDLocationChanged = $00000800;
  crTDDatabaseOtherChanges = $00001000;
  crTDNumberFieldChanged = $00010000;
  crTDFieldOtherChanges = $00020000;
  crTDFieldNameChanged = $00040000;
  crTDFieldDescChanged = $00080000;
  crTDFieldTypeChanged = $00100000;
  crTDFieldSizeChanged = $00200000;
  crTDNativeFieldTypeChanged = $00400000;
  crTDNativeFieldOffsetChanged = $00800000;
  crTDNativeFieldSizeChanged = $01000000;
  crTDFieldDecimalPlacesChanged = $02000000;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IReport = interface;
  IReportDisp = dispinterface;
  ICrystalReportSource = interface;
  IAreas = interface;
  IAreasDisp = dispinterface;
  IArea = interface;
  IAreaDisp = dispinterface;
  ISections = interface;
  ISectionsDisp = dispinterface;
  ISection = interface;
  ISectionDisp = dispinterface;
  IReportObjects = interface;
  IReportObjectsDisp = dispinterface;
  IFieldObject = interface;
  IFieldObjectDisp = dispinterface;
  ITextObject = interface;
  ITextObjectDisp = dispinterface;
  IFieldElements = interface;
  IFieldElementsDisp = dispinterface;
  IFieldElement = interface;
  IFieldElementDisp = dispinterface;
  IFieldDefinition = interface;
  IFieldDefinitionDisp = dispinterface;
  IBlobFieldObject = interface;
  IBlobFieldObjectDisp = dispinterface;
  IDatabaseFieldDefinition = interface;
  IDatabaseFieldDefinitionDisp = dispinterface;
  ISubreportObject = interface;
  ISubreportObjectDisp = dispinterface;
  ISubreportLinks = interface;
  ISubreportLinksDisp = dispinterface;
  ISubreportLink = interface;
  ISubreportLinkDisp = dispinterface;
  ILineObject = interface;
  ILineObjectDisp = dispinterface;
  IBoxObject = interface;
  IBoxObjectDisp = dispinterface;
  ICrossTabObject = interface;
  ICrossTabObjectDisp = dispinterface;
  IObjectSummaryFieldDefinitions = interface;
  IObjectSummaryFieldDefinitionsDisp = dispinterface;
  ISummaryFieldDefinition = interface;
  ISummaryFieldDefinitionDisp = dispinterface;
  IReportObject = interface;
  IReportObjectDisp = dispinterface;
  ICrossTabGroups = interface;
  ICrossTabGroupsDisp = dispinterface;
  ICrossTabGroup = interface;
  ICrossTabGroupDisp = dispinterface;
  ICROleObject = interface;
  ICROleObjectDisp = dispinterface;
  IGraphObject = interface;
  IGraphObjectDisp = dispinterface;
  IFieldDefinitions = interface;
  IFieldDefinitionsDisp = dispinterface;
  IDatabase = interface;
  IDatabaseDisp = dispinterface;
  IDatabaseTables = interface;
  IDatabaseTablesDisp = dispinterface;
  IDatabaseTable = interface;
  IDatabaseTableDisp = dispinterface;
  IDatabaseFieldDefinitions = interface;
  IDatabaseFieldDefinitionsDisp = dispinterface;
  INameValuePairs = interface;
  INameValuePairsDisp = dispinterface;
  ITableQualifiers = interface;
  ITableQualifiersDisp = dispinterface;
  ITableLinks = interface;
  ITableLinksDisp = dispinterface;
  ITableLink = interface;
  ITableLinkDisp = dispinterface;
  IFormulaFieldDefinitions = interface;
  IFormulaFieldDefinitionsDisp = dispinterface;
  IFormulaFieldDefinition = interface;
  IFormulaFieldDefinitionDisp = dispinterface;
  IParameterFieldDefinitions = interface;
  IParameterFieldDefinitionsDisp = dispinterface;
  IParameterFieldDefinition = interface;
  IParameterFieldDefinitionDisp = dispinterface;
  IGroupNameFieldDefinitions = interface;
  IGroupNameFieldDefinitionsDisp = dispinterface;
  IGroupNameFieldDefinition = interface;
  IGroupNameFieldDefinitionDisp = dispinterface;
  ISummaryFieldDefinitions = interface;
  ISummaryFieldDefinitionsDisp = dispinterface;
  IPageEngine = interface;
  IPageEngineDisp = dispinterface;
  IPageGenerator = interface;
  IPageGeneratorDisp = dispinterface;
  IPages = interface;
  IPagesDisp = dispinterface;
  IPage = interface;
  IPageDisp = dispinterface;
  IExportOptions = interface;
  IExportOptionsDisp = dispinterface;
  IApplication = interface;
  IApplicationDisp = dispinterface;
  ISortFields = interface;
  ISortFieldsDisp = dispinterface;
  ISortField = interface;
  ISortFieldDisp = dispinterface;
  IPrintingStatus = interface;
  IPrintingStatusDisp = dispinterface;
  IRunningTotalFieldDefinitions = interface;
  IRunningTotalFieldDefinitionsDisp = dispinterface;
  IRunningTotalFieldDefinition = interface;
  IRunningTotalFieldDefinitionDisp = dispinterface;
  ISQLExpressionFieldDefinitions = interface;
  ISQLExpressionFieldDefinitionsDisp = dispinterface;
  ISQLExpressionFieldDefinition = interface;
  ISQLExpressionFieldDefinitionDisp = dispinterface;
  IReportAlerts = interface;
  IReportAlertsDisp = dispinterface;
  IReportAlert = interface;
  IReportAlertDisp = dispinterface;
  IReportAlertInstances = interface;
  IReportAlertInstancesDisp = dispinterface;
  IReportAlertInstance = interface;
  IReportAlertInstanceDisp = dispinterface;
  ICrystalReportProperties = interface;
  ICrystalReportSourceProperties = interface;
  ICrystalReportSourceProperties2 = interface;
  ICrystalReportSourceProperties3 = interface;
  ICrystalReportSourceProperties4 = interface;
  ICrystalReportPrinterPort = interface;
  ICrystalReportPrinterPortEx = interface;
  ICrystalReportSourceEvents = interface;
  IReportEvent = dispinterface;
  ICrystalReportExport = interface;
  ICrystalReportExportEvents = interface;
  ISectionEvent = dispinterface;
  ISpecialVarFieldDefinition = interface;
  ISpecialVarFieldDefinitionDisp = dispinterface;
  IMapObject = interface;
  IMapObjectDisp = dispinterface;
  IOlapGridObject = interface;
  IOlapGridObjectDisp = dispinterface;
  IFormattingInfo = interface;
  IFormattingInfoDisp = dispinterface;
  IFieldMappingData = interface;
  IFieldMappingDataDisp = dispinterface;
  IParameterValue = interface;
  IParameterValueDisp = dispinterface;
  IParameterValues = interface;
  IParameterValuesDisp = dispinterface;
  IParameterValueInfo = interface;
  IParameterValueInfoDisp = dispinterface;
  IParameterValueInfos = interface;
  IParameterValueInfosDisp = dispinterface;
  IConnectionProperty = interface;
  IConnectionPropertyDisp = dispinterface;
  ICrystalReportSourceEx = interface;
  ICrystalReportSourceEx2 = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Report = IReport;
  Areas = IAreas;
  Sections = ISections;
  Area = IArea;
  Section = ISection;
  ReportObjects = IReportObjects;
  FieldObject = IFieldObject;
  TextObject = ITextObject;
  SubreportObject = ISubreportObject;
  DatabaseFieldDefinition = IDatabaseFieldDefinition;
  FormulaFieldDefinition = IFormulaFieldDefinition;
  ParameterFieldDefinition = IParameterFieldDefinition;
  GroupNameFieldDefinition = IGroupNameFieldDefinition;
  SpecialVarFieldDefinition = ISpecialVarFieldDefinition;
  SummaryFieldDefinition = ISummaryFieldDefinition;
  RunningTotalFieldDefinition = IRunningTotalFieldDefinition;
  SQLExpressionFieldDefinition = ISQLExpressionFieldDefinition;
  Database = IDatabase;
  DatabaseTables = IDatabaseTables;
  DatabaseTable = IDatabaseTable;
  DatabaseFieldDefinitions = IDatabaseFieldDefinitions;
  FormulaFieldDefinitions = IFormulaFieldDefinitions;
  ParameterFieldDefinitions = IParameterFieldDefinitions;
  GroupNameFieldDefinitions = IGroupNameFieldDefinitions;
  SummaryFieldDefinitions = ISummaryFieldDefinitions;
  RunningTotalFieldDefinitions = IRunningTotalFieldDefinitions;
  SQLExpressionFieldDefinitions = ISQLExpressionFieldDefinitions;
  GraphObject = IGraphObject;
  MapObject = IMapObject;
  OleObject = ICROleObject;
  BlobFieldObject = IBlobFieldObject;
  LineObject = ILineObject;
  BoxObject = IBoxObject;
  OlapGridObject = IOlapGridObject;
  CrossTabObject = ICrossTabObject;
  PageEngine = IPageEngine;
  PageGenerator = IPageGenerator;
  Pages = IPages;
  Page = IPage;
  ExportOptions = IExportOptions;
  Application = IApplication;
  FormattingInfo = IFormattingInfo;
  SortFields = ISortFields;
  SortField = ISortField;
  PrintingStatus = IPrintingStatus;
  SubreportLink = ISubreportLink;
  SubreportLinks = ISubreportLinks;
  CrossTabGroups = ICrossTabGroups;
  CrossTabGroup = ICrossTabGroup;
  FieldDefinitions = IFieldDefinitions;
  ObjectSummaryFieldDefinitions = IObjectSummaryFieldDefinitions;
  TableLink = ITableLink;
  TableLinks = ITableLinks;
  FieldMappingData = IFieldMappingData;
  ParameterValue = IParameterValue;
  ParameterValues = IParameterValues;
  ParameterValueInfo = IParameterValueInfo;
  ParameterValueInfos = IParameterValueInfos;
  ReportAlert = IReportAlert;
  ReportAlerts = IReportAlerts;
  ReportAlertInstance = IReportAlertInstance;
  ReportAlertInstances = IReportAlertInstances;
  FieldElements = IFieldElements;
  FieldElement = IFieldElement;
  ConnectionProperties = INameValuePairs;
  ConnectionProperty = IConnectionProperty;
  TableQualifiers = ITableQualifiers;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PInteger1 = ^Integer; {*}
  POleVariant1 = ^OleVariant; {*}
  PWordBool1 = ^WordBool; {*}

  CRFieldValueType = __MIDL___MIDL_itf_crvb60r_0280_0001; 

// *********************************************************************//
// Interface: IReport
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF376800-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReport = interface(IDispatch)
    ['{AF376800-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Areas: IAreas; safecall;
    function Get_Sections: ISections; safecall;
    function Get_PrintDate: TDateTime; safecall;
    procedure Set_PrintDate(pDate: TDateTime); safecall;
    function Get_UseIndexForSpeed: WordBool; safecall;
    procedure Set_UseIndexForSpeed(pBool: WordBool); safecall;
    function Get_TranslateDosStrings: WordBool; safecall;
    procedure Set_TranslateDosStrings(pBool: WordBool); safecall;
    function Get_TranslateDosMemos: WordBool; safecall;
    procedure Set_TranslateDosMemos(pBool: WordBool); safecall;
    function Get_ConvertDateTimeType: CRConvertDateTimeType; safecall;
    procedure Set_ConvertDateTimeType(pDateTimeType: CRConvertDateTimeType); safecall;
    function Get_ConvertNullFieldToDefault: WordBool; safecall;
    procedure Set_ConvertNullFieldToDefault(pBool: WordBool); safecall;
    function Get_CaseInsensitiveSQLData: WordBool; safecall;
    procedure Set_CaseInsensitiveSQLData(pBool: WordBool); safecall;
    function Get_VerifyOnEveryPrint: WordBool; safecall;
    procedure Set_VerifyOnEveryPrint(pBool: WordBool); safecall;
    function Get_Database: IDatabase; safecall;
    function Get_PrinterName: WideString; safecall;
    function Get_DriverName: WideString; safecall;
    function Get_PortName: WideString; safecall;
    function Get_PaperOrientation: CRPaperOrientation; safecall;
    procedure Set_PaperOrientation(pPaperOrientation: CRPaperOrientation); safecall;
    function Get_PaperSize: CRPaperSize; safecall;
    procedure Set_PaperSize(pPaperSize: CRPaperSize); safecall;
    procedure Save(const pReportFileName: WideString); safecall;
    procedure PrintOut(promptUser: OleVariant; numberOfCopy: OleVariant; collated: OleVariant; 
                       startPageN: OleVariant; stopPageN: OleVariant); safecall;
    procedure SelectPrinter(const pDriverName: WideString; const pPrinterName: WideString; 
                            const pPortName: WideString); safecall;
    function Get_FormulaFields: IFormulaFieldDefinitions; safecall;
    function Get_ParameterFields: IParameterFieldDefinitions; safecall;
    function Get_GroupNameFields: IGroupNameFieldDefinitions; safecall;
    function Get_SummaryFields: ISummaryFieldDefinitions; safecall;
    function Get_Kind: CRReportKind; safecall;
    function Get_Parent: IReport; safecall;
    function Get_NumberOfGroup: Integer; safecall;
    function Get_MorePrintEngineErrorMessages: WordBool; safecall;
    procedure Set_MorePrintEngineErrorMessages(pBool: WordBool); safecall;
    function Get_LeftMargin: Integer; safecall;
    procedure Set_LeftMargin(pLeftMargin: Integer); safecall;
    function Get_RightMargin: Integer; safecall;
    procedure Set_RightMargin(pRightMargin: Integer); safecall;
    function Get_TopMargin: Integer; safecall;
    procedure Set_TopMargin(pTopMargin: Integer); safecall;
    function Get_BottomMargin: Integer; safecall;
    procedure Set_BottomMargin(pBottomMargin: Integer); safecall;
    function Get_PageEngine: IPageEngine; safecall;
    procedure Export(promptUser: OleVariant); safecall;
    function Get_ExportOptions: IExportOptions; safecall;
    function Get_Application: IApplication; safecall;
    function Get_EnableParameterPrompting: WordBool; safecall;
    procedure Set_EnableParameterPrompting(pBool: WordBool); safecall;
    function Get_DisplayProgressDialog: WordBool; safecall;
    procedure Set_DisplayProgressDialog(pBool: WordBool); safecall;
    function Get_RecordSelectionFormula: WideString; safecall;
    procedure Set_RecordSelectionFormula(const ppRecordSelectionFormula: WideString); safecall;
    function Get_GroupSelectionFormula: WideString; safecall;
    procedure Set_GroupSelectionFormula(const ppGroupSelectionFormula: WideString); safecall;
    function Get_RecordSortFields: ISortFields; safecall;
    procedure CancelPrinting; safecall;
    function Get_HasSavedData: WordBool; safecall;
    procedure DiscardSavedData; safecall;
    function Get_PrintingStatus: IPrintingStatus; safecall;
    function Get_ReportTitle: WideString; safecall;
    procedure Set_ReportTitle(const ppReportTitle: WideString); safecall;
    function Get_ReportSubject: WideString; safecall;
    procedure Set_ReportSubject(const ppReportSubject: WideString); safecall;
    function Get_ReportAuthor: WideString; safecall;
    procedure Set_ReportAuthor(const ppReportAuthor: WideString); safecall;
    function Get_ReportComments: WideString; safecall;
    procedure Set_ReportComments(const ppReportComments: WideString); safecall;
    function Get_ReportTemplate: WideString; safecall;
    procedure Set_ReportTemplate(const ppReportTemplate: WideString); safecall;
    function Get_KeywordsInReport: WideString; safecall;
    procedure Set_KeywordsInReport(const ppKeywordsInReport: WideString); safecall;
    function Get_ApplicationName: WideString; safecall;
    procedure Set_ApplicationName(const ppApplicationName: WideString); safecall;
    procedure ReadRecords; safecall;
    function GetNextRows(startRowN: Integer; var pRowN: Integer): OleVariant; safecall;
    function Get_RunningTotalFields: IRunningTotalFieldDefinitions; safecall;
    function Get_PerformGroupingOnServer: WordBool; safecall;
    procedure Set_PerformGroupingOnServer(pBool: WordBool); safecall;
    function Get_CanPerformGroupingOnServer: WordBool; safecall;
    function Get_SQLQueryString: WideString; safecall;
    procedure Set_SQLQueryString(const ppSQLQueryString: WideString); safecall;
    function Get_SQLExpressionFields: ISQLExpressionFieldDefinitions; safecall;
    function OpenSubreport(const pSubreportName: WideString): IReport; safecall;
    function Get_GroupSortFields: ISortFields; safecall;
    procedure AddGroup(GroupNumber: Smallint; const pConditionField: IDispatch; 
                       Condition: CRGroupCondition; SortDirection: CRSortDirection); safecall;
    procedure SetDialogParentWindow(hWnd: Integer); safecall;
    function Get_EnablePerformQueriesAsynchronously: WordBool; safecall;
    procedure Set_EnablePerformQueriesAsynchronously(pBool: WordBool); safecall;
    function Get_EnableSelectDistinctRecords: WordBool; safecall;
    procedure Set_EnableSelectDistinctRecords(pBool: WordBool); safecall;
    procedure AddReportVariable(type_: CRReportVariableValueType; const pName: WideString; 
                                arraySize: Integer; reserved: OleVariant); safecall;
    function GetReportVariableValue(const pName: WideString): OleVariant; safecall;
    procedure SetReportVariableValue(const pName: WideString; var_: OleVariant); safecall;
    function Get_ReportFormatStyle: CRReportFormatStyle; safecall;
    procedure Set_ReportFormatStyle(pFormatStyle: CRReportFormatStyle); safecall;
    procedure DeleteGroup(GroupNumber: Smallint); safecall;
    function Get_EnableAsyncQuery: WordBool; safecall;
    procedure Set_EnableAsyncQuery(pBool: WordBool); safecall;
    function Get_EnableGeneratingDataForHiddenObject: WordBool; safecall;
    procedure Set_EnableGeneratingDataForHiddenObject(pBool: WordBool); safecall;
    procedure Set_PrinterDuplex(pPrinterDuplexType: CRPrinterDuplexType); safecall;
    function Get_PrinterDuplex: CRPrinterDuplexType; safecall;
    procedure Set_PaperSource(pPaperSource: CRPaperSource); safecall;
    function Get_PaperSource: CRPaperSource; safecall;
    function Get_SavePreviewPicture: WordBool; safecall;
    procedure Set_SavePreviewPicture(pBool: WordBool); safecall;
    procedure PrinterSetup(hWnd: Integer); safecall;
    procedure AutoSetUnboundFieldSource(matchType: CRBindingMatchType; bindSubReports: OleVariant); safecall;
    procedure SaveAs(const pFilePath: WideString; fileFormat: CRReportFileFormat); safecall;
    procedure Set_FieldMappingType(fldMappingType: CRFieldMappingType); safecall;
    function Get_FieldMappingType: CRFieldMappingType; safecall;
    function Get_FormulaSyntax: CRFormulaSyntax; safecall;
    procedure Set_FormulaSyntax(pFormulaSyntax: CRFormulaSyntax); safecall;
    function Get_LastGetFormulaSyntax: CRFormulaSyntax; safecall;
    function Get_NeedUpdatePages: WordBool; safecall;
    function Get_ReportAlerts: IReportAlerts; safecall;
    procedure SwapGroups(sourceGroupN: Smallint; targetGroupN: Smallint); safecall;
    procedure SetUserPaperSize(length: Smallint; Width: Smallint); safecall;
    procedure PrintOutEx(promptUser: OleVariant; numberOfCopy: OleVariant; collated: OleVariant; 
                         startPageN: OleVariant; stopPageN: OleVariant; 
                         const printFileName: WideString); safecall;
    function PrinterSetupEx(hWnd: Integer): Integer; safecall;
    property Areas: IAreas read Get_Areas;
    property Sections: ISections read Get_Sections;
    property PrintDate: TDateTime read Get_PrintDate write Set_PrintDate;
    property UseIndexForSpeed: WordBool read Get_UseIndexForSpeed write Set_UseIndexForSpeed;
    property TranslateDosStrings: WordBool read Get_TranslateDosStrings write Set_TranslateDosStrings;
    property TranslateDosMemos: WordBool read Get_TranslateDosMemos write Set_TranslateDosMemos;
    property ConvertDateTimeType: CRConvertDateTimeType read Get_ConvertDateTimeType write Set_ConvertDateTimeType;
    property ConvertNullFieldToDefault: WordBool read Get_ConvertNullFieldToDefault write Set_ConvertNullFieldToDefault;
    property CaseInsensitiveSQLData: WordBool read Get_CaseInsensitiveSQLData write Set_CaseInsensitiveSQLData;
    property VerifyOnEveryPrint: WordBool read Get_VerifyOnEveryPrint write Set_VerifyOnEveryPrint;
    property Database: IDatabase read Get_Database;
    property PrinterName: WideString read Get_PrinterName;
    property DriverName: WideString read Get_DriverName;
    property PortName: WideString read Get_PortName;
    property PaperOrientation: CRPaperOrientation read Get_PaperOrientation write Set_PaperOrientation;
    property PaperSize: CRPaperSize read Get_PaperSize write Set_PaperSize;
    property FormulaFields: IFormulaFieldDefinitions read Get_FormulaFields;
    property ParameterFields: IParameterFieldDefinitions read Get_ParameterFields;
    property GroupNameFields: IGroupNameFieldDefinitions read Get_GroupNameFields;
    property SummaryFields: ISummaryFieldDefinitions read Get_SummaryFields;
    property Kind: CRReportKind read Get_Kind;
    property Parent: IReport read Get_Parent;
    property NumberOfGroup: Integer read Get_NumberOfGroup;
    property MorePrintEngineErrorMessages: WordBool read Get_MorePrintEngineErrorMessages write Set_MorePrintEngineErrorMessages;
    property LeftMargin: Integer read Get_LeftMargin write Set_LeftMargin;
    property RightMargin: Integer read Get_RightMargin write Set_RightMargin;
    property TopMargin: Integer read Get_TopMargin write Set_TopMargin;
    property BottomMargin: Integer read Get_BottomMargin write Set_BottomMargin;
    property PageEngine: IPageEngine read Get_PageEngine;
    property ExportOptions: IExportOptions read Get_ExportOptions;
    property Application: IApplication read Get_Application;
    property EnableParameterPrompting: WordBool read Get_EnableParameterPrompting write Set_EnableParameterPrompting;
    property DisplayProgressDialog: WordBool read Get_DisplayProgressDialog write Set_DisplayProgressDialog;
    property RecordSelectionFormula: WideString read Get_RecordSelectionFormula write Set_RecordSelectionFormula;
    property GroupSelectionFormula: WideString read Get_GroupSelectionFormula write Set_GroupSelectionFormula;
    property RecordSortFields: ISortFields read Get_RecordSortFields;
    property HasSavedData: WordBool read Get_HasSavedData;
    property PrintingStatus: IPrintingStatus read Get_PrintingStatus;
    property ReportTitle: WideString read Get_ReportTitle write Set_ReportTitle;
    property ReportSubject: WideString read Get_ReportSubject write Set_ReportSubject;
    property ReportAuthor: WideString read Get_ReportAuthor write Set_ReportAuthor;
    property ReportComments: WideString read Get_ReportComments write Set_ReportComments;
    property ReportTemplate: WideString read Get_ReportTemplate write Set_ReportTemplate;
    property KeywordsInReport: WideString read Get_KeywordsInReport write Set_KeywordsInReport;
    property ApplicationName: WideString read Get_ApplicationName write Set_ApplicationName;
    property RunningTotalFields: IRunningTotalFieldDefinitions read Get_RunningTotalFields;
    property PerformGroupingOnServer: WordBool read Get_PerformGroupingOnServer write Set_PerformGroupingOnServer;
    property CanPerformGroupingOnServer: WordBool read Get_CanPerformGroupingOnServer;
    property SQLQueryString: WideString read Get_SQLQueryString write Set_SQLQueryString;
    property SQLExpressionFields: ISQLExpressionFieldDefinitions read Get_SQLExpressionFields;
    property GroupSortFields: ISortFields read Get_GroupSortFields;
    property EnablePerformQueriesAsynchronously: WordBool read Get_EnablePerformQueriesAsynchronously write Set_EnablePerformQueriesAsynchronously;
    property EnableSelectDistinctRecords: WordBool read Get_EnableSelectDistinctRecords write Set_EnableSelectDistinctRecords;
    property ReportFormatStyle: CRReportFormatStyle read Get_ReportFormatStyle write Set_ReportFormatStyle;
    property EnableAsyncQuery: WordBool read Get_EnableAsyncQuery write Set_EnableAsyncQuery;
    property EnableGeneratingDataForHiddenObject: WordBool read Get_EnableGeneratingDataForHiddenObject write Set_EnableGeneratingDataForHiddenObject;
    property PrinterDuplex: CRPrinterDuplexType read Get_PrinterDuplex write Set_PrinterDuplex;
    property PaperSource: CRPaperSource read Get_PaperSource write Set_PaperSource;
    property SavePreviewPicture: WordBool read Get_SavePreviewPicture write Set_SavePreviewPicture;
    property FieldMappingType: CRFieldMappingType read Get_FieldMappingType write Set_FieldMappingType;
    property FormulaSyntax: CRFormulaSyntax read Get_FormulaSyntax write Set_FormulaSyntax;
    property LastGetFormulaSyntax: CRFormulaSyntax read Get_LastGetFormulaSyntax;
    property NeedUpdatePages: WordBool read Get_NeedUpdatePages;
    property ReportAlerts: IReportAlerts read Get_ReportAlerts;
  end;

// *********************************************************************//
// DispIntf:  IReportDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF376800-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportDisp = dispinterface
    ['{AF376800-6120-4E28-96DD-63FD2DC27B7A}']
    property Areas: IAreas readonly dispid 166;
    property Sections: ISections readonly dispid 167;
    property PrintDate: TDateTime dispid 170;
    property UseIndexForSpeed: WordBool dispid 171;
    property TranslateDosStrings: WordBool dispid 172;
    property TranslateDosMemos: WordBool dispid 173;
    property ConvertDateTimeType: CRConvertDateTimeType dispid 174;
    property ConvertNullFieldToDefault: WordBool dispid 175;
    property CaseInsensitiveSQLData: WordBool dispid 176;
    property VerifyOnEveryPrint: WordBool dispid 177;
    property Database: IDatabase readonly dispid 178;
    property PrinterName: WideString readonly dispid 179;
    property DriverName: WideString readonly dispid 180;
    property PortName: WideString readonly dispid 181;
    property PaperOrientation: CRPaperOrientation dispid 182;
    property PaperSize: CRPaperSize dispid 183;
    procedure Save(const pReportFileName: WideString); dispid 184;
    procedure PrintOut(promptUser: OleVariant; numberOfCopy: OleVariant; collated: OleVariant; 
                       startPageN: OleVariant; stopPageN: OleVariant); dispid 185;
    procedure SelectPrinter(const pDriverName: WideString; const pPrinterName: WideString; 
                            const pPortName: WideString); dispid 186;
    property FormulaFields: IFormulaFieldDefinitions readonly dispid 187;
    property ParameterFields: IParameterFieldDefinitions readonly dispid 189;
    property GroupNameFields: IGroupNameFieldDefinitions readonly dispid 191;
    property SummaryFields: ISummaryFieldDefinitions readonly dispid 207;
    property Kind: CRReportKind readonly dispid 101;
    property Parent: IReport readonly dispid 100;
    property NumberOfGroup: Integer readonly dispid 211;
    property MorePrintEngineErrorMessages: WordBool dispid 212;
    property LeftMargin: Integer dispid 215;
    property RightMargin: Integer dispid 216;
    property TopMargin: Integer dispid 217;
    property BottomMargin: Integer dispid 218;
    property PageEngine: IPageEngine readonly dispid 243;
    procedure Export(promptUser: OleVariant); dispid 259;
    property ExportOptions: IExportOptions readonly dispid 260;
    property Application: IApplication readonly dispid 289;
    property EnableParameterPrompting: WordBool dispid 306;
    property DisplayProgressDialog: WordBool dispid 307;
    property RecordSelectionFormula: WideString dispid 308;
    property GroupSelectionFormula: WideString dispid 309;
    property RecordSortFields: ISortFields readonly dispid 310;
    procedure CancelPrinting; dispid 323;
    property HasSavedData: WordBool readonly dispid 324;
    procedure DiscardSavedData; dispid 325;
    property PrintingStatus: IPrintingStatus readonly dispid 326;
    property ReportTitle: WideString dispid 331;
    property ReportSubject: WideString dispid 332;
    property ReportAuthor: WideString dispid 333;
    property ReportComments: WideString dispid 334;
    property ReportTemplate: WideString dispid 335;
    property KeywordsInReport: WideString dispid 336;
    property ApplicationName: WideString dispid 337;
    procedure ReadRecords; dispid 341;
    function GetNextRows(startRowN: Integer; var pRowN: Integer): OleVariant; dispid 292;
    property RunningTotalFields: IRunningTotalFieldDefinitions readonly dispid 343;
    property PerformGroupingOnServer: WordBool dispid 346;
    property CanPerformGroupingOnServer: WordBool readonly dispid 347;
    property SQLQueryString: WideString dispid 349;
    property SQLExpressionFields: ISQLExpressionFieldDefinitions readonly dispid 350;
    function OpenSubreport(const pSubreportName: WideString): IReport; dispid 159;
    property GroupSortFields: ISortFields readonly dispid 376;
    procedure AddGroup(GroupNumber: Smallint; const pConditionField: IDispatch; 
                       Condition: CRGroupCondition; SortDirection: CRSortDirection); dispid 380;
    procedure SetDialogParentWindow(hWnd: Integer); dispid 381;
    property EnablePerformQueriesAsynchronously: WordBool dispid 464;
    property EnableSelectDistinctRecords: WordBool dispid 465;
    procedure AddReportVariable(type_: CRReportVariableValueType; const pName: WideString; 
                                arraySize: Integer; reserved: OleVariant); dispid 471;
    function GetReportVariableValue(const pName: WideString): OleVariant; dispid 472;
    procedure SetReportVariableValue(const pName: WideString; var_: OleVariant); dispid 473;
    property ReportFormatStyle: CRReportFormatStyle dispid 476;
    procedure DeleteGroup(GroupNumber: Smallint); dispid 550;
    property EnableAsyncQuery: WordBool dispid 551;
    property EnableGeneratingDataForHiddenObject: WordBool dispid 552;
    property PrinterDuplex: CRPrinterDuplexType dispid 477;
    property PaperSource: CRPaperSource dispid 478;
    property SavePreviewPicture: WordBool dispid 480;
    procedure PrinterSetup(hWnd: Integer); dispid 481;
    procedure AutoSetUnboundFieldSource(matchType: CRBindingMatchType; bindSubReports: OleVariant); dispid 482;
    procedure SaveAs(const pFilePath: WideString; fileFormat: CRReportFileFormat); dispid 483;
    property FieldMappingType: CRFieldMappingType dispid 485;
    property FormulaSyntax: CRFormulaSyntax dispid 533;
    property LastGetFormulaSyntax: CRFormulaSyntax readonly dispid 534;
    property NeedUpdatePages: WordBool readonly dispid 548;
    property ReportAlerts: IReportAlerts readonly dispid 742;
    procedure SwapGroups(sourceGroupN: Smallint; targetGroupN: Smallint); dispid 751;
    procedure SetUserPaperSize(length: Smallint; Width: Smallint); dispid 778;
    procedure PrintOutEx(promptUser: OleVariant; numberOfCopy: OleVariant; collated: OleVariant; 
                         startPageN: OleVariant; stopPageN: OleVariant; 
                         const printFileName: WideString); dispid 779;
    function PrinterSetupEx(hWnd: Integer): Integer; dispid 791;
  end;

// *********************************************************************//
// Interface: ICrystalReportSource
// Flags:     (272) Hidden OleAutomation
// GUID:      {3DCC8FB4-C434-11D1-A817-00A0C92784CD}
// *********************************************************************//
  ICrystalReportSource = interface(IUnknown)
    ['{3DCC8FB4-C434-11D1-A817-00A0C92784CD}']
    function GetPage(lCookie: Integer; const bstrBranch: WideString; const bstrFormula: WideString; 
                     lPageNumber: Integer; DrillDownLevel: Smallint): HResult; stdcall;
    function GetTotaller(lCookie: Integer; const bstrBranch: WideString; 
                         const bstrFormula: WideString; const bstrRootGroup: WideString; 
                         lStartFrom: Integer; nLevelsPastRoot: Smallint; vtMaxNodeCount: OleVariant): HResult; stdcall;
    function GetLastPageNumber(lCookie: Integer; const bstrBranch: WideString; 
                               const bstrFormula: WideString; DrillDownLevel: Smallint): HResult; stdcall;
    function FindGroup(lCookie: Integer; const bstrBranch: WideString; 
                       const bstrFormula: WideString; const bstrGroupPath: WideString; 
                       DrillDownLevel: Smallint): HResult; stdcall;
    function FindText(lCookie: Integer; const bstrBranch: WideString; 
                      const bstrFormula: WideString; lFromPage: Integer; lFromInstance: Integer; 
                      const bstrText: WideString; nMode: CRSearchDirection; DrillDownLevel: Smallint): HResult; stdcall;
    function DrillGraph(lCookie: Integer; const bstrBranch: WideString; 
                        const bstrFormula: WideString; lPageNumber: Integer; xOffset: Integer; 
                        yOffset: Integer; DrillDownLevel: Smallint): HResult; stdcall;
    function Refresh(lCookie: Integer): HResult; stdcall;
    function Cancel(lCookie: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IAreas
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376803-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IAreas = interface(IDispatch)
    ['{AF376803-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: OleVariant): IArea; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: OleVariant]: IArea read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IAreasDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376803-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IAreasDisp = dispinterface
    ['{AF376803-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: OleVariant]: IArea readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
  end;

// *********************************************************************//
// Interface: IArea
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376805-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IArea = interface(IDispatch)
    ['{AF376805-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRAreaKind; safecall;
    function Get_Sections: ISections; safecall;
    function Get_Parent: IReport; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_HideForDrillDown: WordBool; safecall;
    procedure Set_HideForDrillDown(pBool: WordBool); safecall;
    function Get_GroupNumber: Smallint; safecall;
    function Get_CopiesToPrint: Smallint; safecall;
    procedure Set_CopiesToPrint(pCopiesToPrint: Smallint); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_NewPageAfter: WordBool; safecall;
    procedure Set_NewPageAfter(pBool: WordBool); safecall;
    function Get_NewPageBefore: WordBool; safecall;
    procedure Set_NewPageBefore(pBool: WordBool); safecall;
    function Get_PrintAtBottomOfPage: WordBool; safecall;
    procedure Set_PrintAtBottomOfPage(pBool: WordBool); safecall;
    function Get_ResetPageNumberAfter: WordBool; safecall;
    procedure Set_ResetPageNumberAfter(pBool: WordBool); safecall;
    function Get_SortDirection: CRSortDirection; safecall;
    procedure Set_SortDirection(pSortDirection: CRSortDirection); safecall;
    function Get_RepeatGroupHeader: WordBool; safecall;
    procedure Set_RepeatGroupHeader(pBool: WordBool); safecall;
    function Get_KeepGroupTogether: WordBool; safecall;
    procedure Set_KeepGroupTogether(pBool: WordBool); safecall;
    function Get_GroupCondition: CRGroupCondition; safecall;
    procedure Set_GroupCondition(pGroupCondition: CRGroupCondition); safecall;
    function Get_GroupConditionField: IDispatch; safecall;
    procedure Set_GroupConditionField(const ppConditionField: IDispatch); safecall;
    function Get_DetailWidth: Integer; safecall;
    function Get_DetailHeight: Integer; safecall;
    function Get_HorizontalGap: Integer; safecall;
    function Get_TopOrBottomNGroupSortOrder: CRTopBottomNGroupSortOrder; safecall;
    procedure Set_TopOrBottomNGroupSortOrder(pTopOrBottomNGroupSortOrder: CRTopBottomNGroupSortOrder); safecall;
    function Get_NumberOfTopOrBottomNGroups: Smallint; safecall;
    procedure Set_NumberOfTopOrBottomNGroups(pNumberOfTopOrBottomNGroups: Smallint); safecall;
    function Get_DiscardOtherGroups: WordBool; safecall;
    procedure Set_DiscardOtherGroups(pBool: WordBool); safecall;
    function Get_TopOrBottomNSortField: ISummaryFieldDefinition; safecall;
    procedure Set_TopOrBottomNSortField(const ppTopOrBottomNSortField: ISummaryFieldDefinition); safecall;
    function Get_EnableHierarchicalGroupSorting: WordBool; safecall;
    procedure Set_EnableHierarchicalGroupSorting(pBool: WordBool); safecall;
    function Get_ParentIDField: IFieldDefinition; safecall;
    procedure SetParentIDField(ParentIDField: OleVariant); safecall;
    function Get_InstanceIDField: IFieldDefinition; safecall;
    procedure SetInstanceIDField(InstanceIDField: OleVariant); safecall;
    function Get_GroupIndent: Integer; safecall;
    procedure Set_GroupIndent(pGroupIndent: Integer); safecall;
    function Get_SpecifiedGroups: OleVariant; safecall;
    procedure Set_SpecifiedGroups(var pSpecifedGroupArray: OleVariant); safecall;
    function Get_ConditionFormula(FormulaName: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaName: OleVariant; const pVal: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRAreaKind read Get_Kind;
    property Sections: ISections read Get_Sections;
    property Parent: IReport read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property HideForDrillDown: WordBool read Get_HideForDrillDown write Set_HideForDrillDown;
    property GroupNumber: Smallint read Get_GroupNumber;
    property CopiesToPrint: Smallint read Get_CopiesToPrint write Set_CopiesToPrint;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property NewPageAfter: WordBool read Get_NewPageAfter write Set_NewPageAfter;
    property NewPageBefore: WordBool read Get_NewPageBefore write Set_NewPageBefore;
    property PrintAtBottomOfPage: WordBool read Get_PrintAtBottomOfPage write Set_PrintAtBottomOfPage;
    property ResetPageNumberAfter: WordBool read Get_ResetPageNumberAfter write Set_ResetPageNumberAfter;
    property SortDirection: CRSortDirection read Get_SortDirection write Set_SortDirection;
    property RepeatGroupHeader: WordBool read Get_RepeatGroupHeader write Set_RepeatGroupHeader;
    property KeepGroupTogether: WordBool read Get_KeepGroupTogether write Set_KeepGroupTogether;
    property GroupCondition: CRGroupCondition read Get_GroupCondition write Set_GroupCondition;
    property GroupConditionField: IDispatch read Get_GroupConditionField write Set_GroupConditionField;
    property DetailWidth: Integer read Get_DetailWidth;
    property DetailHeight: Integer read Get_DetailHeight;
    property HorizontalGap: Integer read Get_HorizontalGap;
    property TopOrBottomNGroupSortOrder: CRTopBottomNGroupSortOrder read Get_TopOrBottomNGroupSortOrder write Set_TopOrBottomNGroupSortOrder;
    property NumberOfTopOrBottomNGroups: Smallint read Get_NumberOfTopOrBottomNGroups write Set_NumberOfTopOrBottomNGroups;
    property DiscardOtherGroups: WordBool read Get_DiscardOtherGroups write Set_DiscardOtherGroups;
    property TopOrBottomNSortField: ISummaryFieldDefinition read Get_TopOrBottomNSortField write Set_TopOrBottomNSortField;
    property EnableHierarchicalGroupSorting: WordBool read Get_EnableHierarchicalGroupSorting write Set_EnableHierarchicalGroupSorting;
    property ParentIDField: IFieldDefinition read Get_ParentIDField;
    property InstanceIDField: IFieldDefinition read Get_InstanceIDField;
    property GroupIndent: Integer read Get_GroupIndent write Set_GroupIndent;
    property ConditionFormula[FormulaName: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
  end;

// *********************************************************************//
// DispIntf:  IAreaDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376805-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IAreaDisp = dispinterface
    ['{AF376805-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRAreaKind readonly dispid 101;
    property Sections: ISections readonly dispid 167;
    property Parent: IReport readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property HideForDrillDown: WordBool dispid 219;
    property GroupNumber: Smallint readonly dispid 220;
    property CopiesToPrint: Smallint dispid 221;
    property KeepTogether: WordBool dispid 116;
    property NewPageAfter: WordBool dispid 194;
    property NewPageBefore: WordBool dispid 193;
    property PrintAtBottomOfPage: WordBool dispid 196;
    property ResetPageNumberAfter: WordBool dispid 195;
    property SortDirection: CRSortDirection dispid 222;
    property RepeatGroupHeader: WordBool dispid 223;
    property KeepGroupTogether: WordBool dispid 224;
    property GroupCondition: CRGroupCondition dispid 225;
    property GroupConditionField: IDispatch dispid 226;
    property DetailWidth: Integer readonly dispid 338;
    property DetailHeight: Integer readonly dispid 339;
    property HorizontalGap: Integer readonly dispid 340;
    property TopOrBottomNGroupSortOrder: CRTopBottomNGroupSortOrder dispid 373;
    property NumberOfTopOrBottomNGroups: Smallint dispid 374;
    property DiscardOtherGroups: WordBool dispid 375;
    property TopOrBottomNSortField: ISummaryFieldDefinition dispid 376;
    property EnableHierarchicalGroupSorting: WordBool dispid 535;
    property ParentIDField: IFieldDefinition readonly dispid 536;
    procedure SetParentIDField(ParentIDField: OleVariant); dispid 704;
    property InstanceIDField: IFieldDefinition readonly dispid 537;
    procedure SetInstanceIDField(InstanceIDField: OleVariant); dispid 705;
    property GroupIndent: Integer dispid 538;
    function SpecifiedGroups: OleVariant; dispid 722;
    property ConditionFormula[FormulaName: OleVariant]: WideString dispid 759;
  end;

// *********************************************************************//
// Interface: ISections
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376804-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISections = interface(IDispatch)
    ['{AF376804-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: OleVariant): ISection; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IDispatch; safecall;
    function Add(index: OleVariant): ISection; safecall;
    procedure Delete(index: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: OleVariant]: ISection read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IDispatch read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ISectionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376804-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISectionsDisp = dispinterface
    ['{AF376804-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: OleVariant]: ISection readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IDispatch readonly dispid 100;
    function Add(index: OleVariant): ISection; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
  end;

// *********************************************************************//
// Interface: ISection
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376806-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISection = interface(IDispatch)
    ['{AF376806-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_ReportObjects: IReportObjects; safecall;
    function Get_Width: Integer; safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_Parent: IArea; safecall;
    function Get_Number: Smallint; safecall;
    function Get_NewPageBefore: WordBool; safecall;
    procedure Set_NewPageBefore(pBool: WordBool); safecall;
    function Get_NewPageAfter: WordBool; safecall;
    procedure Set_NewPageAfter(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_ResetPageNumberAfter: WordBool; safecall;
    procedure Set_ResetPageNumberAfter(pBool: WordBool); safecall;
    function Get_PrintAtBottomOfPage: WordBool; safecall;
    procedure Set_PrintAtBottomOfPage(pBool: WordBool); safecall;
    function Get_UnderlaySection: WordBool; safecall;
    procedure Set_UnderlaySection(pBool: WordBool); safecall;
    function Get_SuppressIfBlank: WordBool; safecall;
    procedure Set_SuppressIfBlank(pBool: WordBool); safecall;
    function Get_MinimumHeight: Integer; safecall;
    function AddFieldObject(Field: OleVariant; Left: Integer; Top: Integer): IFieldObject; safecall;
    function AddTextObject(const pText: WideString; Left: Integer; Top: Integer; 
                           formatText: OleVariant): ITextObject; safecall;
    function AddBlobFieldObject(Field: OleVariant; Left: Integer; Top: Integer): IBlobFieldObject; safecall;
    function AddSpecialVarFieldObject(specialVarType: CRSpecialVarType; Left: Integer; Top: Integer): IFieldObject; safecall;
    function AddSubreportObject(const pSubreportName: WideString; Left: Integer; Top: Integer): ISubreportObject; safecall;
    function ImportSubreport(const subreportFileName: WideString; Left: Integer; Top: Integer): ISubreportObject; safecall;
    procedure DeleteObject(reportObject: OleVariant); safecall;
    function AddLineObject(Left: Integer; Top: Integer; Right: Integer; Bottom: Integer; 
                           pEndSection: OleVariant): ILineObject; safecall;
    function AddBoxObject(Left: Integer; Top: Integer; Right: Integer; Bottom: Integer; 
                          pEndSection: OleVariant): IBoxObject; safecall;
    function AddCrossTabObject(Left: Integer; Top: Integer): ICrossTabObject; safecall;
    function AddPictureObject(const pImageFilePath: WideString; Left: Integer; Top: Integer): ICROleObject; safecall;
    function AddGraphObject(graphDataType: CRGraphDataType; Left: Integer; Top: Integer; 
                            pCrossTabObject: OleVariant): IGraphObject; safecall;
    function AddSummaryFieldObject(Field: OleVariant; SummaryType: CRSummaryType; Left: Integer; 
                                   Top: Integer; secondSummaryFieldOrFactor: OleVariant): IFieldObject; safecall;
    function AddUnboundFieldObject(ValueType: CRFieldValueType; Left: Integer; Top: Integer): IFieldObject; safecall;
    function Get_ConditionFormula(FormulaName: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaName: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Height: Integer read Get_Height write Set_Height;
    property ReportObjects: IReportObjects read Get_ReportObjects;
    property Width: Integer read Get_Width;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property Parent: IArea read Get_Parent;
    property Number: Smallint read Get_Number;
    property NewPageBefore: WordBool read Get_NewPageBefore write Set_NewPageBefore;
    property NewPageAfter: WordBool read Get_NewPageAfter write Set_NewPageAfter;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property ResetPageNumberAfter: WordBool read Get_ResetPageNumberAfter write Set_ResetPageNumberAfter;
    property PrintAtBottomOfPage: WordBool read Get_PrintAtBottomOfPage write Set_PrintAtBottomOfPage;
    property UnderlaySection: WordBool read Get_UnderlaySection write Set_UnderlaySection;
    property SuppressIfBlank: WordBool read Get_SuppressIfBlank write Set_SuppressIfBlank;
    property MinimumHeight: Integer read Get_MinimumHeight;
    property ConditionFormula[FormulaName: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
  end;

// *********************************************************************//
// DispIntf:  ISectionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376806-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISectionDisp = dispinterface
    ['{AF376806-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Height: Integer dispid 105;
    property ReportObjects: IReportObjects readonly dispid 160;
    property Width: Integer readonly dispid 104;
    property BackColor: OLE_COLOR dispid 112;
    property Suppress: WordBool dispid 114;
    property Parent: IArea readonly dispid 100;
    property Number: Smallint readonly dispid 192;
    property NewPageBefore: WordBool dispid 193;
    property NewPageAfter: WordBool dispid 194;
    property KeepTogether: WordBool dispid 116;
    property ResetPageNumberAfter: WordBool dispid 195;
    property PrintAtBottomOfPage: WordBool dispid 196;
    property UnderlaySection: WordBool dispid 197;
    property SuppressIfBlank: WordBool dispid 198;
    property MinimumHeight: Integer readonly dispid 235;
    function AddFieldObject(Field: OleVariant; Left: Integer; Top: Integer): IFieldObject; dispid 462;
    function AddTextObject(const pText: WideString; Left: Integer; Top: Integer; 
                           formatText: OleVariant): ITextObject; dispid 463;
    function AddBlobFieldObject(Field: OleVariant; Left: Integer; Top: Integer): IBlobFieldObject; dispid 553;
    function AddSpecialVarFieldObject(specialVarType: CRSpecialVarType; Left: Integer; Top: Integer): IFieldObject; dispid 555;
    function AddSubreportObject(const pSubreportName: WideString; Left: Integer; Top: Integer): ISubreportObject; dispid 560;
    function ImportSubreport(const subreportFileName: WideString; Left: Integer; Top: Integer): ISubreportObject; dispid 561;
    procedure DeleteObject(reportObject: OleVariant); dispid 554;
    function AddLineObject(Left: Integer; Top: Integer; Right: Integer; Bottom: Integer; 
                           pEndSection: OleVariant): ILineObject; dispid 558;
    function AddBoxObject(Left: Integer; Top: Integer; Right: Integer; Bottom: Integer; 
                          pEndSection: OleVariant): IBoxObject; dispid 559;
    function AddCrossTabObject(Left: Integer; Top: Integer): ICrossTabObject; dispid 557;
    function AddPictureObject(const pImageFilePath: WideString; Left: Integer; Top: Integer): ICROleObject; dispid 556;
    function AddGraphObject(graphDataType: CRGraphDataType; Left: Integer; Top: Integer; 
                            pCrossTabObject: OleVariant): IGraphObject; dispid 562;
    function AddSummaryFieldObject(Field: OleVariant; SummaryType: CRSummaryType; Left: Integer; 
                                   Top: Integer; secondSummaryFieldOrFactor: OleVariant): IFieldObject; dispid 479;
    function AddUnboundFieldObject(ValueType: CRFieldValueType; Left: Integer; Top: Integer): IFieldObject; dispid 532;
    property ConditionFormula[FormulaName: OleVariant]: WideString dispid 759;
    property CssClass: WideString dispid 549;
  end;

// *********************************************************************//
// Interface: IReportObjects
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376807-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportObjects = interface(IDispatch)
    ['{AF376807-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: OleVariant): IDispatch; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: ISection; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: OleVariant]: IDispatch read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: ISection read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IReportObjectsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376807-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportObjectsDisp = dispinterface
    ['{AF376807-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: OleVariant]: IDispatch readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: ISection readonly dispid 100;
  end;

// *********************************************************************//
// Interface: IFieldObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376809-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldObject = interface(IDispatch)
    ['{AF376809-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_EnableTightHorizontal: WordBool; safecall;
    procedure Set_EnableTightHorizontal(pBool: WordBool); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_TextColor: OLE_COLOR; safecall;
    procedure Set_TextColor(pTextColor: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const ppFont: IFontDisp); safecall;
    function Get_Field: IDispatch; safecall;
    function Get_HorAlignment: CRAlignment; safecall;
    procedure Set_HorAlignment(pHorAlignment: CRAlignment); safecall;
    function Get_Value: OleVariant; safecall;
    function Get_CanGrow: WordBool; safecall;
    procedure Set_CanGrow(pBool: WordBool); safecall;
    function Get_SuppressIfDuplicated: WordBool; safecall;
    procedure Set_SuppressIfDuplicated(pBool: WordBool); safecall;
    function Get_UseSystemDefaults: WordBool; safecall;
    procedure Set_UseSystemDefaults(pBool: WordBool); safecall;
    function Get_SuppressIfZero: WordBool; safecall;
    procedure Set_SuppressIfZero(pBool: WordBool); safecall;
    function Get_NegativeType: CRNegativeType; safecall;
    procedure Set_NegativeType(pNegativeType: CRNegativeType); safecall;
    function Get_ThousandsSeparators: WordBool; safecall;
    procedure Set_ThousandsSeparators(pBool: WordBool); safecall;
    function Get_UseLeadingZero: WordBool; safecall;
    procedure Set_UseLeadingZero(pBool: WordBool); safecall;
    function Get_DecimalPlaces: Smallint; safecall;
    procedure Set_DecimalPlaces(pDecimalPlaces: Smallint); safecall;
    function Get_RoundingType: CRRoundingType; safecall;
    procedure Set_RoundingType(pRoundingType: CRRoundingType); safecall;
    function Get_ThousandSymbol: WideString; safecall;
    procedure Set_ThousandSymbol(const ppThousandSymbol: WideString); safecall;
    function Get_DecimalSymbol: WideString; safecall;
    procedure Set_DecimalSymbol(const ppDecimalSymbol: WideString); safecall;
    function Get_CurrencySymbolType: CRCurrencySymbolType; safecall;
    procedure Set_CurrencySymbolType(pCurrencySymbolType: CRCurrencySymbolType); safecall;
    function Get_UseOneSymbolPerPage: WordBool; safecall;
    procedure Set_UseOneSymbolPerPage(pBool: WordBool); safecall;
    function Get_CurrencyPositionType: CRCurrencyPositionType; safecall;
    procedure Set_CurrencyPositionType(pCurrencyPositionType: CRCurrencyPositionType); safecall;
    function Get_CurrencySymbol: WideString; safecall;
    procedure Set_CurrencySymbol(const ppCurrencySymbol: WideString); safecall;
    function Get_BooleanOutputType: CRBooleanOutputType; safecall;
    procedure Set_BooleanOutputType(pBooleanOutputType: CRBooleanOutputType); safecall;
    function Get_DateWindowsDefaultType: CRDateWindowsDefaultType; safecall;
    procedure Set_DateWindowsDefaultType(pDateWindowsDefaultType: CRDateWindowsDefaultType); safecall;
    function Get_DateOrder: CRDateOrder; safecall;
    procedure Set_DateOrder(pDateOrder: CRDateOrder); safecall;
    function Get_YearType: CRYearType; safecall;
    procedure Set_YearType(pYearType: CRYearType); safecall;
    function Get_MonthType: CRMonthType; safecall;
    procedure Set_MonthType(pMonthType: CRMonthType); safecall;
    function Get_DayType: CRDayType; safecall;
    procedure Set_DayType(pDayType: CRDayType); safecall;
    function Get_LeadingDayType: CRLeadingDayType; safecall;
    procedure Set_LeadingDayType(pLeadingDayType: CRLeadingDayType); safecall;
    function Get_LeadingDaySeparator: WideString; safecall;
    procedure Set_LeadingDaySeparator(const ppLeadingDaySeparator: WideString); safecall;
    function Get_DateFirstSeparator: WideString; safecall;
    procedure Set_DateFirstSeparator(const ppDateFirstSeparator: WideString); safecall;
    function Get_DateSecondSeparator: WideString; safecall;
    procedure Set_DateSecondSeparator(const ppDateSecondSeparator: WideString); safecall;
    function Get_TimeBase: CRTimeBase; safecall;
    procedure Set_TimeBase(pTimeBase: CRTimeBase); safecall;
    function Get_AmPmType: CRAmPmType; safecall;
    procedure Set_AmPmType(pAmPmType: CRAmPmType); safecall;
    function Get_HourType: CRHourType; safecall;
    procedure Set_HourType(pHourType: CRHourType); safecall;
    function Get_MinuteType: CRMinuteType; safecall;
    procedure Set_MinuteType(pMinuteType: CRMinuteType); safecall;
    function Get_SecondType: CRSecondType; safecall;
    procedure Set_SecondType(pSecondType: CRSecondType); safecall;
    function Get_PmString: WideString; safecall;
    procedure Set_PmString(const ppPmString: WideString); safecall;
    function Get_AmString: WideString; safecall;
    procedure Set_AmString(const ppAmString: WideString); safecall;
    function Get_MinuteSecondSeparator: WideString; safecall;
    procedure Set_MinuteSecondSeparator(const ppMinuteSecondSeparator: WideString); safecall;
    function Get_HourMinuteSeparator: WideString; safecall;
    procedure Set_HourMinuteSeparator(const ppHourMinuteSeparator: WideString); safecall;
    function Get_MaxNumberOfLines: Smallint; safecall;
    procedure Set_MaxNumberOfLines(pMaxNumberOfLines: Smallint); safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_LeadingDayPosition: CRLeadingDayPosition; safecall;
    procedure Set_LeadingDayPosition(pLeadingDayPosition: CRLeadingDayPosition); safecall;
    function Get_DateEraType: CRDateEraType; safecall;
    procedure Set_DateEraType(pDateEraType: CRDateEraType); safecall;
    function Get_DateCalendarType: CRDateCalendarType; safecall;
    procedure Set_DateCalendarType(pDateCalendarType: CRDateCalendarType); safecall;
    function Get_DatePrefixSeparator: WideString; safecall;
    procedure Set_DatePrefixSeparator(const ppDatePrefixSeparator: WideString); safecall;
    function Get_DateSuffixSeparator: WideString; safecall;
    procedure Set_DateSuffixSeparator(const ppDateSuffixSeparator: WideString); safecall;
    procedure SetUnboundFieldSource(const pUnboundFieldSource: WideString); safecall;
    function Get_DisplayReverseSign: WordBool; safecall;
    procedure Set_DisplayReverseSign(pBool: WordBool); safecall;
    function Get_ZeroValueString: WideString; safecall;
    procedure Set_ZeroValueString(const ppZeroValue: WideString); safecall;
    function Get_CharacterSpacing: Integer; safecall;
    procedure Set_CharacterSpacing(pCharacterSpacing: Integer); safecall;
    function Get_LineSpacing: Double; safecall;
    function Get_LineSpacingType: CRLineSpacingType; safecall;
    procedure SetLineSpacing(LineSpacing: Double; LineSpacingType: CRLineSpacingType); safecall;
    function Get_TextRotationAngle: CRRotationAngle; safecall;
    procedure Set_TextRotationAngle(pRotationAngle: CRRotationAngle); safecall;
    function Get_FirstLineIndent: Integer; safecall;
    procedure Set_FirstLineIndent(pFirstLineIndent: Integer); safecall;
    function Get_LeftIndent: Integer; safecall;
    procedure Set_LeftIndent(pLeftIndent: Integer); safecall;
    function Get_RightIndent: Integer; safecall;
    procedure Set_RightIndent(pRightIndent: Integer); safecall;
    function Get_TextFormat: CRTextFormat; safecall;
    procedure Set_TextFormat(pTextFormat: CRTextFormat); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property EnableTightHorizontal: WordBool read Get_EnableTightHorizontal write Set_EnableTightHorizontal;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property TextColor: OLE_COLOR read Get_TextColor write Set_TextColor;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Field: IDispatch read Get_Field;
    property HorAlignment: CRAlignment read Get_HorAlignment write Set_HorAlignment;
    property Value: OleVariant read Get_Value;
    property CanGrow: WordBool read Get_CanGrow write Set_CanGrow;
    property SuppressIfDuplicated: WordBool read Get_SuppressIfDuplicated write Set_SuppressIfDuplicated;
    property UseSystemDefaults: WordBool read Get_UseSystemDefaults write Set_UseSystemDefaults;
    property SuppressIfZero: WordBool read Get_SuppressIfZero write Set_SuppressIfZero;
    property NegativeType: CRNegativeType read Get_NegativeType write Set_NegativeType;
    property ThousandsSeparators: WordBool read Get_ThousandsSeparators write Set_ThousandsSeparators;
    property UseLeadingZero: WordBool read Get_UseLeadingZero write Set_UseLeadingZero;
    property DecimalPlaces: Smallint read Get_DecimalPlaces write Set_DecimalPlaces;
    property RoundingType: CRRoundingType read Get_RoundingType write Set_RoundingType;
    property ThousandSymbol: WideString read Get_ThousandSymbol write Set_ThousandSymbol;
    property DecimalSymbol: WideString read Get_DecimalSymbol write Set_DecimalSymbol;
    property CurrencySymbolType: CRCurrencySymbolType read Get_CurrencySymbolType write Set_CurrencySymbolType;
    property UseOneSymbolPerPage: WordBool read Get_UseOneSymbolPerPage write Set_UseOneSymbolPerPage;
    property CurrencyPositionType: CRCurrencyPositionType read Get_CurrencyPositionType write Set_CurrencyPositionType;
    property CurrencySymbol: WideString read Get_CurrencySymbol write Set_CurrencySymbol;
    property BooleanOutputType: CRBooleanOutputType read Get_BooleanOutputType write Set_BooleanOutputType;
    property DateWindowsDefaultType: CRDateWindowsDefaultType read Get_DateWindowsDefaultType write Set_DateWindowsDefaultType;
    property DateOrder: CRDateOrder read Get_DateOrder write Set_DateOrder;
    property YearType: CRYearType read Get_YearType write Set_YearType;
    property MonthType: CRMonthType read Get_MonthType write Set_MonthType;
    property DayType: CRDayType read Get_DayType write Set_DayType;
    property LeadingDayType: CRLeadingDayType read Get_LeadingDayType write Set_LeadingDayType;
    property LeadingDaySeparator: WideString read Get_LeadingDaySeparator write Set_LeadingDaySeparator;
    property DateFirstSeparator: WideString read Get_DateFirstSeparator write Set_DateFirstSeparator;
    property DateSecondSeparator: WideString read Get_DateSecondSeparator write Set_DateSecondSeparator;
    property TimeBase: CRTimeBase read Get_TimeBase write Set_TimeBase;
    property AmPmType: CRAmPmType read Get_AmPmType write Set_AmPmType;
    property HourType: CRHourType read Get_HourType write Set_HourType;
    property MinuteType: CRMinuteType read Get_MinuteType write Set_MinuteType;
    property SecondType: CRSecondType read Get_SecondType write Set_SecondType;
    property PmString: WideString read Get_PmString write Set_PmString;
    property AmString: WideString read Get_AmString write Set_AmString;
    property MinuteSecondSeparator: WideString read Get_MinuteSecondSeparator write Set_MinuteSecondSeparator;
    property HourMinuteSeparator: WideString read Get_HourMinuteSeparator write Set_HourMinuteSeparator;
    property MaxNumberOfLines: Smallint read Get_MaxNumberOfLines write Set_MaxNumberOfLines;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property LeadingDayPosition: CRLeadingDayPosition read Get_LeadingDayPosition write Set_LeadingDayPosition;
    property DateEraType: CRDateEraType read Get_DateEraType write Set_DateEraType;
    property DateCalendarType: CRDateCalendarType read Get_DateCalendarType write Set_DateCalendarType;
    property DatePrefixSeparator: WideString read Get_DatePrefixSeparator write Set_DatePrefixSeparator;
    property DateSuffixSeparator: WideString read Get_DateSuffixSeparator write Set_DateSuffixSeparator;
    property DisplayReverseSign: WordBool read Get_DisplayReverseSign write Set_DisplayReverseSign;
    property ZeroValueString: WideString read Get_ZeroValueString write Set_ZeroValueString;
    property CharacterSpacing: Integer read Get_CharacterSpacing write Set_CharacterSpacing;
    property LineSpacing: Double read Get_LineSpacing;
    property LineSpacingType: CRLineSpacingType read Get_LineSpacingType;
    property TextRotationAngle: CRRotationAngle read Get_TextRotationAngle write Set_TextRotationAngle;
    property FirstLineIndent: Integer read Get_FirstLineIndent write Set_FirstLineIndent;
    property LeftIndent: Integer read Get_LeftIndent write Set_LeftIndent;
    property RightIndent: Integer read Get_RightIndent write Set_RightIndent;
    property TextFormat: CRTextFormat read Get_TextFormat write Set_TextFormat;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  IFieldObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376809-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldObjectDisp = dispinterface
    ['{AF376809-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property EnableTightHorizontal: WordBool dispid 110;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property TextColor: OLE_COLOR dispid 117;
    property Font: IFontDisp dispid 118;
    property Field: IDispatch readonly dispid 119;
    property HorAlignment: CRAlignment dispid 120;
    property Value: OleVariant readonly dispid 121;
    property CanGrow: WordBool dispid 122;
    property SuppressIfDuplicated: WordBool dispid 123;
    property UseSystemDefaults: WordBool dispid 125;
    property SuppressIfZero: WordBool dispid 124;
    property NegativeType: CRNegativeType dispid 126;
    property ThousandsSeparators: WordBool dispid 127;
    property UseLeadingZero: WordBool dispid 128;
    property DecimalPlaces: Smallint dispid 129;
    property RoundingType: CRRoundingType dispid 130;
    property ThousandSymbol: WideString dispid 131;
    property DecimalSymbol: WideString dispid 132;
    property CurrencySymbolType: CRCurrencySymbolType dispid 133;
    property UseOneSymbolPerPage: WordBool dispid 134;
    property CurrencyPositionType: CRCurrencyPositionType dispid 135;
    property CurrencySymbol: WideString dispid 136;
    property BooleanOutputType: CRBooleanOutputType dispid 137;
    property DateWindowsDefaultType: CRDateWindowsDefaultType dispid 138;
    property DateOrder: CRDateOrder dispid 139;
    property YearType: CRYearType dispid 140;
    property MonthType: CRMonthType dispid 141;
    property DayType: CRDayType dispid 142;
    property LeadingDayType: CRLeadingDayType dispid 143;
    property LeadingDaySeparator: WideString dispid 144;
    property DateFirstSeparator: WideString dispid 145;
    property DateSecondSeparator: WideString dispid 146;
    property TimeBase: CRTimeBase dispid 147;
    property AmPmType: CRAmPmType dispid 148;
    property HourType: CRHourType dispid 149;
    property MinuteType: CRMinuteType dispid 150;
    property SecondType: CRSecondType dispid 151;
    property PmString: WideString dispid 152;
    property AmString: WideString dispid 153;
    property MinuteSecondSeparator: WideString dispid 154;
    property HourMinuteSeparator: WideString dispid 155;
    property MaxNumberOfLines: Smallint dispid 156;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property LeadingDayPosition: CRLeadingDayPosition dispid 399;
    property DateEraType: CRDateEraType dispid 400;
    property DateCalendarType: CRDateCalendarType dispid 401;
    property DatePrefixSeparator: WideString dispid 402;
    property DateSuffixSeparator: WideString dispid 403;
    procedure SetUnboundFieldSource(const pUnboundFieldSource: WideString); dispid 474;
    property DisplayReverseSign: WordBool dispid 497;
    property ZeroValueString: WideString dispid 498;
    property CharacterSpacing: Integer dispid 499;
    property LineSpacing: Double readonly dispid 500;
    property LineSpacingType: CRLineSpacingType readonly dispid 501;
    procedure SetLineSpacing(LineSpacing: Double; LineSpacingType: CRLineSpacingType); dispid 503;
    property TextRotationAngle: CRRotationAngle dispid 502;
    property FirstLineIndent: Integer dispid 504;
    property LeftIndent: Integer dispid 505;
    property RightIndent: Integer dispid 506;
    property TextFormat: CRTextFormat dispid 507;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: ITextObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ITextObject = interface(IDispatch)
    ['{AF37680C-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_TextColor: OLE_COLOR; safecall;
    procedure Set_TextColor(pTextColor: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const ppFont: IFontDisp); safecall;
    function Get_Text: WideString; safecall;
    function Get_HorAlignment: CRAlignment; safecall;
    procedure Set_HorAlignment(pHorAlignment: CRAlignment); safecall;
    function Get_SuppressIfDuplicated: WordBool; safecall;
    procedure Set_SuppressIfDuplicated(pBool: WordBool); safecall;
    function Get_MaxNumberOfLines: Smallint; safecall;
    procedure Set_MaxNumberOfLines(pMaxNumberOfLines: Smallint); safecall;
    function Get_CanGrow: WordBool; safecall;
    procedure Set_CanGrow(pBool: WordBool); safecall;
    procedure SetText(const pText: WideString); safecall;
    function Get_CharacterSpacing: Integer; safecall;
    procedure Set_CharacterSpacing(pCharacterSpacing: Integer); safecall;
    function Get_LineSpacing: Double; safecall;
    function Get_LineSpacingType: CRLineSpacingType; safecall;
    procedure SetLineSpacing(LineSpacing: Double; LineSpacingType: CRLineSpacingType); safecall;
    function Get_TextRotationAngle: CRRotationAngle; safecall;
    procedure Set_TextRotationAngle(pRotationAngle: CRRotationAngle); safecall;
    function Get_FirstLineIndent: Integer; safecall;
    procedure Set_FirstLineIndent(pFirstLineIndent: Integer); safecall;
    function Get_LeftIndent: Integer; safecall;
    procedure Set_LeftIndent(pLeftIndent: Integer); safecall;
    function Get_RightIndent: Integer; safecall;
    procedure Set_RightIndent(pRightIndent: Integer); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_FieldElements: IFieldElements; safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property TextColor: OLE_COLOR read Get_TextColor write Set_TextColor;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Text: WideString read Get_Text;
    property HorAlignment: CRAlignment read Get_HorAlignment write Set_HorAlignment;
    property SuppressIfDuplicated: WordBool read Get_SuppressIfDuplicated write Set_SuppressIfDuplicated;
    property MaxNumberOfLines: Smallint read Get_MaxNumberOfLines write Set_MaxNumberOfLines;
    property CanGrow: WordBool read Get_CanGrow write Set_CanGrow;
    property CharacterSpacing: Integer read Get_CharacterSpacing write Set_CharacterSpacing;
    property LineSpacing: Double read Get_LineSpacing;
    property LineSpacingType: CRLineSpacingType read Get_LineSpacingType;
    property TextRotationAngle: CRRotationAngle read Get_TextRotationAngle write Set_TextRotationAngle;
    property FirstLineIndent: Integer read Get_FirstLineIndent write Set_FirstLineIndent;
    property LeftIndent: Integer read Get_LeftIndent write Set_LeftIndent;
    property RightIndent: Integer read Get_RightIndent write Set_RightIndent;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property FieldElements: IFieldElements read Get_FieldElements;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  ITextObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ITextObjectDisp = dispinterface
    ['{AF37680C-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property TextColor: OLE_COLOR dispid 117;
    property Font: IFontDisp dispid 118;
    property Text: WideString readonly dispid 157;
    property HorAlignment: CRAlignment dispid 120;
    property SuppressIfDuplicated: WordBool dispid 123;
    property MaxNumberOfLines: Smallint dispid 156;
    property CanGrow: WordBool dispid 122;
    procedure SetText(const pText: WideString); dispid 236;
    property CharacterSpacing: Integer dispid 499;
    property LineSpacing: Double readonly dispid 500;
    property LineSpacingType: CRLineSpacingType readonly dispid 501;
    procedure SetLineSpacing(LineSpacing: Double; LineSpacingType: CRLineSpacingType); dispid 503;
    property TextRotationAngle: CRRotationAngle dispid 502;
    property FirstLineIndent: Integer dispid 504;
    property LeftIndent: Integer dispid 505;
    property RightIndent: Integer dispid 506;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property FieldElements: IFieldElements readonly dispid 765;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: IFieldElements
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldElements = interface(IDispatch)
    ['{AF37680B-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IFieldElement; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: ITextObject; safecall;
    procedure Add(position: Integer; Field: OleVariant); safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IFieldElement read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: ITextObject read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IFieldElementsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldElementsDisp = dispinterface
    ['{AF37680B-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IFieldElement readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: ITextObject readonly dispid 100;
    procedure Add(position: Integer; Field: OleVariant); dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: IFieldElement
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldElement = interface(IDispatch)
    ['{AF37680A-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Font: IFontDisp; safecall;
    procedure _Set_Font(const ppFont: IFontDisp); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(pTextColor: OLE_COLOR); safecall;
    function Get_FieldDefinition: IFieldDefinition; safecall;
    procedure Set_FieldDefinition(const ppFieldDefinition: IFieldDefinition); safecall;
    function Get_Parent: ITextObject; safecall;
    function Get_SuppressIfDuplicated: WordBool; safecall;
    procedure Set_SuppressIfDuplicated(pBool: WordBool); safecall;
    function Get_UseSystemDefaults: WordBool; safecall;
    procedure Set_UseSystemDefaults(pBool: WordBool); safecall;
    function Get_SuppressIfZero: WordBool; safecall;
    procedure Set_SuppressIfZero(pBool: WordBool); safecall;
    function Get_NegativeType: CRNegativeType; safecall;
    procedure Set_NegativeType(pNegativeType: CRNegativeType); safecall;
    function Get_ThousandsSeparators: WordBool; safecall;
    procedure Set_ThousandsSeparators(pBool: WordBool); safecall;
    function Get_UseLeadingZero: WordBool; safecall;
    procedure Set_UseLeadingZero(pBool: WordBool); safecall;
    function Get_DecimalPlaces: Smallint; safecall;
    procedure Set_DecimalPlaces(pDecimalPlaces: Smallint); safecall;
    function Get_RoundingType: CRRoundingType; safecall;
    procedure Set_RoundingType(pRoundingType: CRRoundingType); safecall;
    function Get_ThousandSymbol: WideString; safecall;
    procedure Set_ThousandSymbol(const ppThousandSymbol: WideString); safecall;
    function Get_DecimalSymbol: WideString; safecall;
    procedure Set_DecimalSymbol(const ppDecimalSymbol: WideString); safecall;
    function Get_CurrencySymbolType: CRCurrencySymbolType; safecall;
    procedure Set_CurrencySymbolType(pCurrencySymbolType: CRCurrencySymbolType); safecall;
    function Get_UseOneSymbolPerPage: WordBool; safecall;
    procedure Set_UseOneSymbolPerPage(pBool: WordBool); safecall;
    function Get_CurrencyPositionType: CRCurrencyPositionType; safecall;
    procedure Set_CurrencyPositionType(pCurrencyPositionType: CRCurrencyPositionType); safecall;
    function Get_CurrencySymbol: WideString; safecall;
    procedure Set_CurrencySymbol(const ppCurrencySymbol: WideString); safecall;
    function Get_BooleanOutputType: CRBooleanOutputType; safecall;
    procedure Set_BooleanOutputType(pBooleanOutputType: CRBooleanOutputType); safecall;
    function Get_DateWindowsDefaultType: CRDateWindowsDefaultType; safecall;
    procedure Set_DateWindowsDefaultType(pDateWindowsDefaultType: CRDateWindowsDefaultType); safecall;
    function Get_DateOrder: CRDateOrder; safecall;
    procedure Set_DateOrder(pDateOrder: CRDateOrder); safecall;
    function Get_YearType: CRYearType; safecall;
    procedure Set_YearType(pYearType: CRYearType); safecall;
    function Get_MonthType: CRMonthType; safecall;
    procedure Set_MonthType(pMonthType: CRMonthType); safecall;
    function Get_DayType: CRDayType; safecall;
    procedure Set_DayType(pDayType: CRDayType); safecall;
    function Get_LeadingDayType: CRLeadingDayType; safecall;
    procedure Set_LeadingDayType(pLeadingDayType: CRLeadingDayType); safecall;
    function Get_LeadingDaySeparator: WideString; safecall;
    procedure Set_LeadingDaySeparator(const ppLeadingDaySeparator: WideString); safecall;
    function Get_DateFirstSeparator: WideString; safecall;
    procedure Set_DateFirstSeparator(const ppDateFirstSeparator: WideString); safecall;
    function Get_DateSecondSeparator: WideString; safecall;
    procedure Set_DateSecondSeparator(const ppDateSecondSeparator: WideString); safecall;
    function Get_TimeBase: CRTimeBase; safecall;
    procedure Set_TimeBase(pTimeBase: CRTimeBase); safecall;
    function Get_AmPmType: CRAmPmType; safecall;
    procedure Set_AmPmType(pAmPmType: CRAmPmType); safecall;
    function Get_HourType: CRHourType; safecall;
    procedure Set_HourType(pHourType: CRHourType); safecall;
    function Get_MinuteType: CRMinuteType; safecall;
    procedure Set_MinuteType(pMinuteType: CRMinuteType); safecall;
    function Get_SecondType: CRSecondType; safecall;
    procedure Set_SecondType(pSecondType: CRSecondType); safecall;
    function Get_PmString: WideString; safecall;
    procedure Set_PmString(const ppPmString: WideString); safecall;
    function Get_AmString: WideString; safecall;
    procedure Set_AmString(const ppAmString: WideString); safecall;
    function Get_MinuteSecondSeparator: WideString; safecall;
    procedure Set_MinuteSecondSeparator(const ppMinuteSecondSeparator: WideString); safecall;
    function Get_HourMinuteSeparator: WideString; safecall;
    procedure Set_HourMinuteSeparator(const ppHourMinuteSeparator: WideString); safecall;
    function Get_MaxNumberOfLines: Smallint; safecall;
    procedure Set_MaxNumberOfLines(pMaxNumberOfLines: Smallint); safecall;
    function Get_LeadingDayPosition: CRLeadingDayPosition; safecall;
    procedure Set_LeadingDayPosition(pLeadingDayPosition: CRLeadingDayPosition); safecall;
    function Get_DateEraType: CRDateEraType; safecall;
    procedure Set_DateEraType(pDateEraType: CRDateEraType); safecall;
    function Get_DateCalendarType: CRDateCalendarType; safecall;
    procedure Set_DateCalendarType(pDateCalendarType: CRDateCalendarType); safecall;
    function Get_DatePrefixSeparator: WideString; safecall;
    procedure Set_DatePrefixSeparator(const ppDatePrefixSeparator: WideString); safecall;
    function Get_DateSuffixSeparator: WideString; safecall;
    procedure Set_DateSuffixSeparator(const ppDateSuffixSeparator: WideString); safecall;
    function Get_DisplayReverseSign: WordBool; safecall;
    procedure Set_DisplayReverseSign(pBool: WordBool); safecall;
    function Get_ZeroValueString: WideString; safecall;
    procedure Set_ZeroValueString(const ppZeroValue: WideString); safecall;
    function Get_CharacterSpacing: Integer; safecall;
    procedure Set_CharacterSpacing(pCharacterSpacing: Integer); safecall;
    function Get_LineSpacing: Double; safecall;
    function Get_LineSpacingType: CRLineSpacingType; safecall;
    procedure SetLineSpacing(LineSpacing: Double; LineSpacingType: CRLineSpacingType); safecall;
    function Get_FirstLineIndent: Integer; safecall;
    procedure Set_FirstLineIndent(pFirstLineIndent: Integer); safecall;
    function Get_LeftIndent: Integer; safecall;
    procedure Set_LeftIndent(pLeftIndent: Integer); safecall;
    function Get_RightIndent: Integer; safecall;
    procedure Set_RightIndent(pRightIndent: Integer); safecall;
    function Get_TextFormat: CRTextFormat; safecall;
    procedure Set_TextFormat(pTextFormat: CRTextFormat); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_BeginPosition: Integer; safecall;
    function Get_EndPosition: Integer; safecall;
    property Font: IFontDisp read Get_Font write _Set_Font;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property FieldDefinition: IFieldDefinition read Get_FieldDefinition write Set_FieldDefinition;
    property Parent: ITextObject read Get_Parent;
    property SuppressIfDuplicated: WordBool read Get_SuppressIfDuplicated write Set_SuppressIfDuplicated;
    property UseSystemDefaults: WordBool read Get_UseSystemDefaults write Set_UseSystemDefaults;
    property SuppressIfZero: WordBool read Get_SuppressIfZero write Set_SuppressIfZero;
    property NegativeType: CRNegativeType read Get_NegativeType write Set_NegativeType;
    property ThousandsSeparators: WordBool read Get_ThousandsSeparators write Set_ThousandsSeparators;
    property UseLeadingZero: WordBool read Get_UseLeadingZero write Set_UseLeadingZero;
    property DecimalPlaces: Smallint read Get_DecimalPlaces write Set_DecimalPlaces;
    property RoundingType: CRRoundingType read Get_RoundingType write Set_RoundingType;
    property ThousandSymbol: WideString read Get_ThousandSymbol write Set_ThousandSymbol;
    property DecimalSymbol: WideString read Get_DecimalSymbol write Set_DecimalSymbol;
    property CurrencySymbolType: CRCurrencySymbolType read Get_CurrencySymbolType write Set_CurrencySymbolType;
    property UseOneSymbolPerPage: WordBool read Get_UseOneSymbolPerPage write Set_UseOneSymbolPerPage;
    property CurrencyPositionType: CRCurrencyPositionType read Get_CurrencyPositionType write Set_CurrencyPositionType;
    property CurrencySymbol: WideString read Get_CurrencySymbol write Set_CurrencySymbol;
    property BooleanOutputType: CRBooleanOutputType read Get_BooleanOutputType write Set_BooleanOutputType;
    property DateWindowsDefaultType: CRDateWindowsDefaultType read Get_DateWindowsDefaultType write Set_DateWindowsDefaultType;
    property DateOrder: CRDateOrder read Get_DateOrder write Set_DateOrder;
    property YearType: CRYearType read Get_YearType write Set_YearType;
    property MonthType: CRMonthType read Get_MonthType write Set_MonthType;
    property DayType: CRDayType read Get_DayType write Set_DayType;
    property LeadingDayType: CRLeadingDayType read Get_LeadingDayType write Set_LeadingDayType;
    property LeadingDaySeparator: WideString read Get_LeadingDaySeparator write Set_LeadingDaySeparator;
    property DateFirstSeparator: WideString read Get_DateFirstSeparator write Set_DateFirstSeparator;
    property DateSecondSeparator: WideString read Get_DateSecondSeparator write Set_DateSecondSeparator;
    property TimeBase: CRTimeBase read Get_TimeBase write Set_TimeBase;
    property AmPmType: CRAmPmType read Get_AmPmType write Set_AmPmType;
    property HourType: CRHourType read Get_HourType write Set_HourType;
    property MinuteType: CRMinuteType read Get_MinuteType write Set_MinuteType;
    property SecondType: CRSecondType read Get_SecondType write Set_SecondType;
    property PmString: WideString read Get_PmString write Set_PmString;
    property AmString: WideString read Get_AmString write Set_AmString;
    property MinuteSecondSeparator: WideString read Get_MinuteSecondSeparator write Set_MinuteSecondSeparator;
    property HourMinuteSeparator: WideString read Get_HourMinuteSeparator write Set_HourMinuteSeparator;
    property MaxNumberOfLines: Smallint read Get_MaxNumberOfLines write Set_MaxNumberOfLines;
    property LeadingDayPosition: CRLeadingDayPosition read Get_LeadingDayPosition write Set_LeadingDayPosition;
    property DateEraType: CRDateEraType read Get_DateEraType write Set_DateEraType;
    property DateCalendarType: CRDateCalendarType read Get_DateCalendarType write Set_DateCalendarType;
    property DatePrefixSeparator: WideString read Get_DatePrefixSeparator write Set_DatePrefixSeparator;
    property DateSuffixSeparator: WideString read Get_DateSuffixSeparator write Set_DateSuffixSeparator;
    property DisplayReverseSign: WordBool read Get_DisplayReverseSign write Set_DisplayReverseSign;
    property ZeroValueString: WideString read Get_ZeroValueString write Set_ZeroValueString;
    property CharacterSpacing: Integer read Get_CharacterSpacing write Set_CharacterSpacing;
    property LineSpacing: Double read Get_LineSpacing;
    property LineSpacingType: CRLineSpacingType read Get_LineSpacingType;
    property FirstLineIndent: Integer read Get_FirstLineIndent write Set_FirstLineIndent;
    property LeftIndent: Integer read Get_LeftIndent write Set_LeftIndent;
    property RightIndent: Integer read Get_RightIndent write Set_RightIndent;
    property TextFormat: CRTextFormat read Get_TextFormat write Set_TextFormat;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property BeginPosition: Integer read Get_BeginPosition;
    property EndPosition: Integer read Get_EndPosition;
  end;

// *********************************************************************//
// DispIntf:  IFieldElementDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldElementDisp = dispinterface
    ['{AF37680A-6120-4E28-96DD-63FD2DC27B7A}']
    property Font: IFontDisp dispid 118;
    property Color: OLE_COLOR dispid 762;
    property FieldDefinition: IFieldDefinition dispid 763;
    property Parent: ITextObject readonly dispid 100;
    property SuppressIfDuplicated: WordBool dispid 123;
    property UseSystemDefaults: WordBool dispid 125;
    property SuppressIfZero: WordBool dispid 124;
    property NegativeType: CRNegativeType dispid 126;
    property ThousandsSeparators: WordBool dispid 127;
    property UseLeadingZero: WordBool dispid 128;
    property DecimalPlaces: Smallint dispid 129;
    property RoundingType: CRRoundingType dispid 130;
    property ThousandSymbol: WideString dispid 131;
    property DecimalSymbol: WideString dispid 132;
    property CurrencySymbolType: CRCurrencySymbolType dispid 133;
    property UseOneSymbolPerPage: WordBool dispid 134;
    property CurrencyPositionType: CRCurrencyPositionType dispid 135;
    property CurrencySymbol: WideString dispid 136;
    property BooleanOutputType: CRBooleanOutputType dispid 137;
    property DateWindowsDefaultType: CRDateWindowsDefaultType dispid 138;
    property DateOrder: CRDateOrder dispid 139;
    property YearType: CRYearType dispid 140;
    property MonthType: CRMonthType dispid 141;
    property DayType: CRDayType dispid 142;
    property LeadingDayType: CRLeadingDayType dispid 143;
    property LeadingDaySeparator: WideString dispid 144;
    property DateFirstSeparator: WideString dispid 145;
    property DateSecondSeparator: WideString dispid 146;
    property TimeBase: CRTimeBase dispid 147;
    property AmPmType: CRAmPmType dispid 148;
    property HourType: CRHourType dispid 149;
    property MinuteType: CRMinuteType dispid 150;
    property SecondType: CRSecondType dispid 151;
    property PmString: WideString dispid 152;
    property AmString: WideString dispid 153;
    property MinuteSecondSeparator: WideString dispid 154;
    property HourMinuteSeparator: WideString dispid 155;
    property MaxNumberOfLines: Smallint dispid 156;
    property LeadingDayPosition: CRLeadingDayPosition dispid 399;
    property DateEraType: CRDateEraType dispid 400;
    property DateCalendarType: CRDateCalendarType dispid 401;
    property DatePrefixSeparator: WideString dispid 402;
    property DateSuffixSeparator: WideString dispid 403;
    property DisplayReverseSign: WordBool dispid 497;
    property ZeroValueString: WideString dispid 498;
    property CharacterSpacing: Integer dispid 499;
    property LineSpacing: Double readonly dispid 500;
    property LineSpacingType: CRLineSpacingType readonly dispid 501;
    procedure SetLineSpacing(LineSpacing: Double; LineSpacingType: CRLineSpacingType); dispid 503;
    property FirstLineIndent: Integer dispid 504;
    property LeftIndent: Integer dispid 505;
    property RightIndent: Integer dispid 506;
    property TextFormat: CRTextFormat dispid 507;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property BeginPosition: Integer readonly dispid 776;
    property EndPosition: Integer readonly dispid 777;
  end;

// *********************************************************************//
// Interface: IFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldDefinition = interface(IDispatch)
    ['{AF37680D-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_UseCount: Integer; safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property UseCount: Integer read Get_UseCount;
  end;

// *********************************************************************//
// DispIntf:  IFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldDefinitionDisp = dispinterface
    ['{AF37680D-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property UseCount: Integer readonly dispid 161;
  end;

// *********************************************************************//
// Interface: IBlobFieldObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376827-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IBlobFieldObject = interface(IDispatch)
    ['{AF376827-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_LeftCropping: Integer; safecall;
    procedure Set_LeftCropping(pLeftCropping: Integer); safecall;
    function Get_RightCropping: Integer; safecall;
    procedure Set_RightCropping(pRightCropping: Integer); safecall;
    function Get_TopCropping: Integer; safecall;
    procedure Set_TopCropping(pTopCropping: Integer); safecall;
    function Get_BottomCropping: Integer; safecall;
    procedure Set_BottomCropping(pBottomCropping: Integer); safecall;
    function Get_XScaling: Double; safecall;
    procedure Set_XScaling(pXScaling: Double); safecall;
    function Get_YScaling: Double; safecall;
    procedure Set_YScaling(pYScaling: Double); safecall;
    function Get_Field: IDatabaseFieldDefinition; safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property LeftCropping: Integer read Get_LeftCropping write Set_LeftCropping;
    property RightCropping: Integer read Get_RightCropping write Set_RightCropping;
    property TopCropping: Integer read Get_TopCropping write Set_TopCropping;
    property BottomCropping: Integer read Get_BottomCropping write Set_BottomCropping;
    property XScaling: Double read Get_XScaling write Set_XScaling;
    property YScaling: Double read Get_YScaling write Set_YScaling;
    property Field: IDatabaseFieldDefinition read Get_Field;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  IBlobFieldObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376827-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IBlobFieldObjectDisp = dispinterface
    ['{AF376827-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property LeftCropping: Integer dispid 237;
    property RightCropping: Integer dispid 238;
    property TopCropping: Integer dispid 239;
    property BottomCropping: Integer dispid 240;
    property XScaling: Double dispid 241;
    property YScaling: Double dispid 242;
    property Field: IDatabaseFieldDefinition readonly dispid 119;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: IDatabaseFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseFieldDefinition = interface(IDispatch)
    ['{AF37680E-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_DatabaseFieldName: WideString; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_TableAliasName: WideString; safecall;
    function Get_DatabaseFieldDisplayName: WideString; safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property DatabaseFieldName: WideString read Get_DatabaseFieldName;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property TableAliasName: WideString read Get_TableAliasName;
    property DatabaseFieldDisplayName: WideString read Get_DatabaseFieldDisplayName;
  end;

// *********************************************************************//
// DispIntf:  IDatabaseFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseFieldDefinitionDisp = dispinterface
    ['{AF37680E-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property DatabaseFieldName: WideString readonly dispid 165;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property TableAliasName: WideString readonly dispid 351;
    property DatabaseFieldDisplayName: WideString readonly dispid 369;
  end;

// *********************************************************************//
// Interface: ISubreportObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376810-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISubreportObject = interface(IDispatch)
    ['{AF376810-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_SubreportName: WideString; safecall;
    procedure Set_SubreportName(const ppSubreportName: WideString); safecall;
    function OpenSubreport: IReport; safecall;
    function Get_CanGrow: WordBool; safecall;
    procedure Set_CanGrow(pBool: WordBool); safecall;
    function Get_EnableOnDemand: WordBool; safecall;
    function Get_Links: ISubreportLinks; safecall;
    procedure ReimportSubreport(out pReimported: WordBool); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property SubreportName: WideString read Get_SubreportName write Set_SubreportName;
    property CanGrow: WordBool read Get_CanGrow write Set_CanGrow;
    property EnableOnDemand: WordBool read Get_EnableOnDemand;
    property Links: ISubreportLinks read Get_Links;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
  end;

// *********************************************************************//
// DispIntf:  ISubreportObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376810-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISubreportObjectDisp = dispinterface
    ['{AF376810-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property SubreportName: WideString dispid 158;
    function OpenSubreport: IReport; dispid 159;
    property CanGrow: WordBool dispid 122;
    property EnableOnDemand: WordBool readonly dispid 385;
    property Links: ISubreportLinks readonly dispid 563;
    procedure ReimportSubreport(out pReimported: WordBool); dispid 720;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
  end;

// *********************************************************************//
// Interface: ISubreportLinks
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37684E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISubreportLinks = interface(IDispatch)
    ['{AF37684E-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): ISubreportLink; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: ISubreportObject; safecall;
    function Add(MainReportField: OleVariant; SubreportField: OleVariant): ISubreportLink; safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: ISubreportLink read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: ISubreportObject read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ISubreportLinksDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37684E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISubreportLinksDisp = dispinterface
    ['{AF37684E-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: ISubreportLink readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: ISubreportObject readonly dispid 100;
    function Add(MainReportField: OleVariant; SubreportField: OleVariant): ISubreportLink; dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: ISubreportLink
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37684D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISubreportLink = interface(IDispatch)
    ['{AF37684D-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: ISubreportObject; safecall;
    function Get_MainReportField: IFieldDefinition; safecall;
    function Get_SubreportField: IFieldDefinition; safecall;
    property Parent: ISubreportObject read Get_Parent;
    property MainReportField: IFieldDefinition read Get_MainReportField;
    property SubreportField: IFieldDefinition read Get_SubreportField;
  end;

// *********************************************************************//
// DispIntf:  ISubreportLinkDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37684D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISubreportLinkDisp = dispinterface
    ['{AF37684D-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: ISubreportObject readonly dispid 100;
    property MainReportField: IFieldDefinition readonly dispid 564;
    property SubreportField: IFieldDefinition readonly dispid 565;
  end;

// *********************************************************************//
// Interface: ILineObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376828-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ILineObject = interface(IDispatch)
    ['{AF376828-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_LineColor: OLE_COLOR; safecall;
    procedure Set_LineColor(pLineColor: OLE_COLOR); safecall;
    function Get_Right: Integer; safecall;
    procedure Set_Right(pRight: Integer); safecall;
    function Get_Bottom: Integer; safecall;
    procedure Set_Bottom(pBottom: Integer); safecall;
    function Get_LineThickness: Integer; safecall;
    procedure Set_LineThickness(pLineThickness: Integer); safecall;
    function Get_ExtendToBottomOfSection: WordBool; safecall;
    procedure Set_ExtendToBottomOfSection(pBool: WordBool); safecall;
    function Get_LineStyle: CRLineStyle; safecall;
    procedure Set_LineStyle(pLineStyle: CRLineStyle); safecall;
    function Get_EndSection: ISection; safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property LineColor: OLE_COLOR read Get_LineColor write Set_LineColor;
    property Right: Integer read Get_Right write Set_Right;
    property Bottom: Integer read Get_Bottom write Set_Bottom;
    property LineThickness: Integer read Get_LineThickness write Set_LineThickness;
    property ExtendToBottomOfSection: WordBool read Get_ExtendToBottomOfSection write Set_ExtendToBottomOfSection;
    property LineStyle: CRLineStyle read Get_LineStyle write Set_LineStyle;
    property EndSection: ISection read Get_EndSection;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
  end;

// *********************************************************************//
// DispIntf:  ILineObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376828-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ILineObjectDisp = dispinterface
    ['{AF376828-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property LineColor: OLE_COLOR dispid 200;
    property Right: Integer dispid 202;
    property Bottom: Integer dispid 203;
    property LineThickness: Integer dispid 208;
    property ExtendToBottomOfSection: WordBool dispid 209;
    property LineStyle: CRLineStyle dispid 204;
    property EndSection: ISection readonly dispid 210;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
  end;

// *********************************************************************//
// Interface: IBoxObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376829-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IBoxObject = interface(IDispatch)
    ['{AF376829-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Right: Integer; safecall;
    procedure Set_Right(pRight: Integer); safecall;
    function Get_Bottom: Integer; safecall;
    procedure Set_Bottom(pBottom: Integer); safecall;
    function Get_LineStyle: CRLineStyle; safecall;
    procedure Set_LineStyle(pLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_LineColor: OLE_COLOR; safecall;
    procedure Set_LineColor(pLineColor: OLE_COLOR); safecall;
    function Get_FillColor: OLE_COLOR; safecall;
    procedure Set_FillColor(pFillColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_BottomRightSection: ISection; safecall;
    function Get_LineThickness: Integer; safecall;
    procedure Set_LineThickness(pLineThickness: Integer); safecall;
    function Get_ExtendToBottomOfSection: WordBool; safecall;
    procedure Set_ExtendToBottomOfSection(pBool: WordBool); safecall;
    function Get_CornerEllipseHeight: Integer; safecall;
    procedure Set_CornerEllipseHeight(pCornerEllipseHeight: Integer); safecall;
    function Get_CornerEllipseWidth: Integer; safecall;
    procedure Set_CornerEllipseWidth(pCornerEllipseWidth: Integer); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Right: Integer read Get_Right write Set_Right;
    property Bottom: Integer read Get_Bottom write Set_Bottom;
    property LineStyle: CRLineStyle read Get_LineStyle write Set_LineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property LineColor: OLE_COLOR read Get_LineColor write Set_LineColor;
    property FillColor: OLE_COLOR read Get_FillColor write Set_FillColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property BottomRightSection: ISection read Get_BottomRightSection;
    property LineThickness: Integer read Get_LineThickness write Set_LineThickness;
    property ExtendToBottomOfSection: WordBool read Get_ExtendToBottomOfSection write Set_ExtendToBottomOfSection;
    property CornerEllipseHeight: Integer read Get_CornerEllipseHeight write Set_CornerEllipseHeight;
    property CornerEllipseWidth: Integer read Get_CornerEllipseWidth write Set_CornerEllipseWidth;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
  end;

// *********************************************************************//
// DispIntf:  IBoxObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376829-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IBoxObjectDisp = dispinterface
    ['{AF376829-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Right: Integer dispid 202;
    property Bottom: Integer dispid 203;
    property LineStyle: CRLineStyle dispid 204;
    property HasDropShadow: WordBool dispid 111;
    property LineColor: OLE_COLOR dispid 200;
    property FillColor: OLE_COLOR dispid 201;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property BottomRightSection: ISection readonly dispid 210;
    property LineThickness: Integer dispid 208;
    property ExtendToBottomOfSection: WordBool dispid 209;
    property CornerEllipseHeight: Integer dispid 543;
    property CornerEllipseWidth: Integer dispid 544;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
  end;

// *********************************************************************//
// Interface: ICrossTabObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICrossTabObject = interface(IDispatch)
    ['{AF37682A-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    function Get_Height: Integer; safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_SummaryFields: IObjectSummaryFieldDefinitions; safecall;
    function Get_RowGroups: ICrossTabGroups; safecall;
    function Get_ColumnGroups: ICrossTabGroups; safecall;
    function Get_EnableShowGrid: WordBool; safecall;
    procedure Set_EnableShowGrid(pBool: WordBool); safecall;
    function Get_EnableShowCellMargins: WordBool; safecall;
    procedure Set_EnableShowCellMargins(pBool: WordBool); safecall;
    function Get_EnableSuppressEmptyRows: WordBool; safecall;
    procedure Set_EnableSuppressEmptyRows(pBool: WordBool); safecall;
    function Get_EnableSuppressEmptyColumns: WordBool; safecall;
    procedure Set_EnableSuppressEmptyColumns(pBool: WordBool); safecall;
    function Get_EnableKeepColumnsTogether: WordBool; safecall;
    procedure Set_EnableKeepColumnsTogether(pBool: WordBool); safecall;
    function Get_EnableSuppressRowGrandTotals: WordBool; safecall;
    procedure Set_EnableSuppressRowGrandTotals(pBool: WordBool); safecall;
    function Get_EnableSuppressColumnGrandTotals: WordBool; safecall;
    procedure Set_EnableSuppressColumnGrandTotals(pBool: WordBool); safecall;
    function Get_RowGrandTotalColor: OLE_COLOR; safecall;
    procedure Set_RowGrandTotalColor(pColor: OLE_COLOR); safecall;
    function Get_ColumnGrandTotalColor: OLE_COLOR; safecall;
    procedure Set_ColumnGrandTotalColor(pColor: OLE_COLOR); safecall;
    function Get_EnableRepeatRowLabels: WordBool; safecall;
    procedure Set_EnableRepeatRowLabels(pBool: WordBool); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width;
    property Height: Integer read Get_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property SummaryFields: IObjectSummaryFieldDefinitions read Get_SummaryFields;
    property RowGroups: ICrossTabGroups read Get_RowGroups;
    property ColumnGroups: ICrossTabGroups read Get_ColumnGroups;
    property EnableShowGrid: WordBool read Get_EnableShowGrid write Set_EnableShowGrid;
    property EnableShowCellMargins: WordBool read Get_EnableShowCellMargins write Set_EnableShowCellMargins;
    property EnableSuppressEmptyRows: WordBool read Get_EnableSuppressEmptyRows write Set_EnableSuppressEmptyRows;
    property EnableSuppressEmptyColumns: WordBool read Get_EnableSuppressEmptyColumns write Set_EnableSuppressEmptyColumns;
    property EnableKeepColumnsTogether: WordBool read Get_EnableKeepColumnsTogether write Set_EnableKeepColumnsTogether;
    property EnableSuppressRowGrandTotals: WordBool read Get_EnableSuppressRowGrandTotals write Set_EnableSuppressRowGrandTotals;
    property EnableSuppressColumnGrandTotals: WordBool read Get_EnableSuppressColumnGrandTotals write Set_EnableSuppressColumnGrandTotals;
    property RowGrandTotalColor: OLE_COLOR read Get_RowGrandTotalColor write Set_RowGrandTotalColor;
    property ColumnGrandTotalColor: OLE_COLOR read Get_ColumnGrandTotalColor write Set_ColumnGrandTotalColor;
    property EnableRepeatRowLabels: WordBool read Get_EnableRepeatRowLabels write Set_EnableRepeatRowLabels;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  ICrossTabObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICrossTabObjectDisp = dispinterface
    ['{AF37682A-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer readonly dispid 104;
    property Height: Integer readonly dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property SummaryFields: IObjectSummaryFieldDefinitions readonly dispid 578;
    property RowGroups: ICrossTabGroups readonly dispid 579;
    property ColumnGroups: ICrossTabGroups readonly dispid 580;
    property EnableShowGrid: WordBool dispid 581;
    property EnableShowCellMargins: WordBool dispid 582;
    property EnableSuppressEmptyRows: WordBool dispid 583;
    property EnableSuppressEmptyColumns: WordBool dispid 584;
    property EnableKeepColumnsTogether: WordBool dispid 585;
    property EnableSuppressRowGrandTotals: WordBool dispid 586;
    property EnableSuppressColumnGrandTotals: WordBool dispid 587;
    property RowGrandTotalColor: OLE_COLOR dispid 588;
    property ColumnGrandTotalColor: OLE_COLOR dispid 589;
    property EnableRepeatRowLabels: WordBool dispid 590;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: IObjectSummaryFieldDefinitions
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376852-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IObjectSummaryFieldDefinitions = interface(IDispatch)
    ['{AF376852-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): ISummaryFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReportObject; safecall;
    procedure Add(summaryField: OleVariant); safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: ISummaryFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReportObject read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IObjectSummaryFieldDefinitionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376852-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IObjectSummaryFieldDefinitionsDisp = dispinterface
    ['{AF376852-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: ISummaryFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReportObject readonly dispid 100;
    procedure Add(summaryField: OleVariant); dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: ISummaryFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376815-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISummaryFieldDefinition = interface(IDispatch)
    ['{AF376815-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_SummaryType: CRSummaryType; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_HeaderArea: IArea; safecall;
    function Get_FooterArea: IArea; safecall;
    function Get_SummarizedField: IDispatch; safecall;
    procedure SetSummarizedField(SummarizedField: OleVariant); safecall;
    function Get_SecondarySummarizedField: IDispatch; safecall;
    procedure SetSecondarySummarizedField(secondarySummariedField: OleVariant); safecall;
    function Get_SummaryOperationParameter: Integer; safecall;
    procedure Set_SummaryOperationParameter(pOperationParameter: Integer); safecall;
    procedure Set_SummaryType(pSummaryType: CRSummaryType); safecall;
    function Get_ForCrossTab: WordBool; safecall;
    function Get_HierarchicalSummaryType: CRHierarchicalSummaryType; safecall;
    procedure Set_HierarchicalSummaryType(pHierarchicalType: CRHierarchicalSummaryType); safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property SummaryType: CRSummaryType read Get_SummaryType write Set_SummaryType;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property HeaderArea: IArea read Get_HeaderArea;
    property FooterArea: IArea read Get_FooterArea;
    property SummarizedField: IDispatch read Get_SummarizedField;
    property SecondarySummarizedField: IDispatch read Get_SecondarySummarizedField;
    property SummaryOperationParameter: Integer read Get_SummaryOperationParameter write Set_SummaryOperationParameter;
    property ForCrossTab: WordBool read Get_ForCrossTab;
    property HierarchicalSummaryType: CRHierarchicalSummaryType read Get_HierarchicalSummaryType write Set_HierarchicalSummaryType;
  end;

// *********************************************************************//
// DispIntf:  ISummaryFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376815-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISummaryFieldDefinitionDisp = dispinterface
    ['{AF376815-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property SummaryType: CRSummaryType dispid 206;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property HeaderArea: IArea readonly dispid 378;
    property FooterArea: IArea readonly dispid 379;
    property SummarizedField: IDispatch readonly dispid 371;
    procedure SetSummarizedField(SummarizedField: OleVariant); dispid 700;
    property SecondarySummarizedField: IDispatch readonly dispid 663;
    procedure SetSecondarySummarizedField(secondarySummariedField: OleVariant); dispid 701;
    property SummaryOperationParameter: Integer dispid 664;
    property ForCrossTab: WordBool readonly dispid 665;
    property HierarchicalSummaryType: CRHierarchicalSummaryType dispid 749;
  end;

// *********************************************************************//
// Interface: IReportObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376808-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportObject = interface(IDispatch)
    ['{AF376808-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_EnableTightHorizontal: WordBool; safecall;
    procedure Set_EnableTightHorizontal(pBool: WordBool); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property EnableTightHorizontal: WordBool read Get_EnableTightHorizontal write Set_EnableTightHorizontal;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  IReportObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376808-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportObjectDisp = dispinterface
    ['{AF376808-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property EnableTightHorizontal: WordBool dispid 110;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: ICrossTabGroups
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF37684F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICrossTabGroups = interface(IDispatch)
    ['{AF37684F-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Parent: ICrossTabObject; safecall;
    function Get_Count: Integer; safecall;
    function Get_Item(index: Integer): ICrossTabGroup; safecall;
    function Add(Field: OleVariant): ICrossTabGroup; safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Parent: ICrossTabObject read Get_Parent;
    property Count: Integer read Get_Count;
    property Item[index: Integer]: ICrossTabGroup read Get_Item; default;
  end;

// *********************************************************************//
// DispIntf:  ICrossTabGroupsDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF37684F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICrossTabGroupsDisp = dispinterface
    ['{AF37684F-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Parent: ICrossTabObject readonly dispid 100;
    property Count: Integer readonly dispid 161;
    property Item[index: Integer]: ICrossTabGroup readonly dispid 0; default;
    function Add(Field: OleVariant): ICrossTabGroup; dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: ICrossTabGroup
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF376850-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICrossTabGroup = interface(IDispatch)
    ['{AF376850-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: ICrossTabObject; safecall;
    function Get_Field: IFieldDefinition; safecall;
    procedure Set_Field(ppField: OleVariant); safecall;
    function Get_Condition: CRGroupCondition; safecall;
    procedure Set_Condition(pGroupCondition: CRGroupCondition); safecall;
    function Get_SortDirection: CRSortDirection; safecall;
    procedure Set_SortDirection(pSortDirection: CRSortDirection); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_EnableSuppressSubtotal: WordBool; safecall;
    procedure Set_EnableSuppressSubtotal(pBool: WordBool); safecall;
    function Get_EnableSuppressLabel: WordBool; safecall;
    procedure Set_EnableSuppressLabel(pBool: WordBool); safecall;
    function Get_SpecifiedGroups: OleVariant; safecall;
    procedure Set_SpecifiedGroups(var pSpecifedGroupArray: OleVariant); safecall;
    property Parent: ICrossTabObject read Get_Parent;
    property Condition: CRGroupCondition read Get_Condition write Set_Condition;
    property SortDirection: CRSortDirection read Get_SortDirection write Set_SortDirection;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property EnableSuppressSubtotal: WordBool read Get_EnableSuppressSubtotal write Set_EnableSuppressSubtotal;
    property EnableSuppressLabel: WordBool read Get_EnableSuppressLabel write Set_EnableSuppressLabel;
  end;

// *********************************************************************//
// DispIntf:  ICrossTabGroupDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF376850-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICrossTabGroupDisp = dispinterface
    ['{AF376850-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: ICrossTabObject readonly dispid 571;
    function Field: IFieldDefinition; dispid 572;
    property Condition: CRGroupCondition dispid 573;
    property SortDirection: CRSortDirection dispid 574;
    property BackColor: OLE_COLOR dispid 575;
    property EnableSuppressSubtotal: WordBool dispid 576;
    property EnableSuppressLabel: WordBool dispid 577;
    function SpecifiedGroups: OleVariant; dispid 722;
  end;

// *********************************************************************//
// Interface: ICROleObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376826-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICROleObject = interface(IDispatch)
    ['{AF376826-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_LeftCropping: Integer; safecall;
    procedure Set_LeftCropping(pLeftCropping: Integer); safecall;
    function Get_RightCropping: Integer; safecall;
    procedure Set_RightCropping(pRightCropping: Integer); safecall;
    function Get_TopCropping: Integer; safecall;
    procedure Set_TopCropping(pTopCropping: Integer); safecall;
    function Get_BottomCropping: Integer; safecall;
    procedure Set_BottomCropping(pBottomCropping: Integer); safecall;
    function Get_XScaling: Double; safecall;
    procedure Set_XScaling(pXScaling: Double); safecall;
    function Get_YScaling: Double; safecall;
    procedure Set_YScaling(pYScaling: Double); safecall;
    function Get_FormattedPicture: IPictureDisp; safecall;
    procedure _Set_FormattedPicture(const ppPicture: IPictureDisp); safecall;
    procedure SetOleLocation(const pLocation: WideString); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function GetLinkSource: WideString; safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property LeftCropping: Integer read Get_LeftCropping write Set_LeftCropping;
    property RightCropping: Integer read Get_RightCropping write Set_RightCropping;
    property TopCropping: Integer read Get_TopCropping write Set_TopCropping;
    property BottomCropping: Integer read Get_BottomCropping write Set_BottomCropping;
    property XScaling: Double read Get_XScaling write Set_XScaling;
    property YScaling: Double read Get_YScaling write Set_YScaling;
    property FormattedPicture: IPictureDisp read Get_FormattedPicture write _Set_FormattedPicture;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  ICROleObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376826-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ICROleObjectDisp = dispinterface
    ['{AF376826-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property LeftCropping: Integer dispid 237;
    property RightCropping: Integer dispid 238;
    property TopCropping: Integer dispid 239;
    property BottomCropping: Integer dispid 240;
    property XScaling: Double dispid 241;
    property YScaling: Double dispid 242;
    property FormattedPicture: IPictureDisp dispid 311;
    procedure SetOleLocation(const pLocation: WideString); dispid 475;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    function GetLinkSource: WideString; dispid 761;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: IGraphObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376824-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IGraphObject = interface(IDispatch)
    ['{AF376824-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_DataType: CRGraphDataType; safecall;
    function Get_GraphType: CRGraphType; safecall;
    procedure Set_GraphType(pGraphType: CRGraphType); safecall;
    function Get_Title: WideString; safecall;
    procedure Set_Title(const ppTitle: WideString); safecall;
    function Get_SubTitle: WideString; safecall;
    procedure Set_SubTitle(const ppSubTitle: WideString); safecall;
    function Get_FootNote: WideString; safecall;
    procedure Set_FootNote(const ppFootNote: WideString); safecall;
    function Get_GroupsTitle: WideString; safecall;
    procedure Set_GroupsTitle(const ppGroupsTitle: WideString); safecall;
    function Get_SeriesTitle: WideString; safecall;
    procedure Set_SeriesTitle(const ppSeriesTitle: WideString); safecall;
    function Get_XAxisTitle: WideString; safecall;
    procedure Set_XAxisTitle(const ppXAxisTitle: WideString); safecall;
    function Get_YAxisTitle: WideString; safecall;
    procedure Set_YAxisTitle(const ppYAxisTitle: WideString); safecall;
    function Get_Y2AxisTitle: WideString; safecall;
    procedure Set_Y2AxisTitle(const ppY2AxisTitle: WideString); safecall;
    function Get_MaxDataAxisValue: Double; safecall;
    procedure Set_MaxDataAxisValue(pMaxDataAxisValue: Double); safecall;
    function Get_MinDataAxisValue: Double; safecall;
    procedure Set_MinDataAxisValue(pMinDataAxisValue: Double); safecall;
    function Get_MaxData2AxisValue: Double; safecall;
    procedure Set_MaxData2AxisValue(pMaxData2AxisValue: Double); safecall;
    function Get_MinData2AxisValue: Double; safecall;
    procedure Set_MinData2AxisValue(pMinData2AxisValue: Double); safecall;
    function Get_MaxSeriesAxisValue: Double; safecall;
    procedure Set_MaxSeriesAxisValue(pMaxSeriesAxisValue: Double); safecall;
    function Get_MinSeriesAxisValue: Double; safecall;
    procedure Set_MinSeriesAxisValue(pMinSeriesAxisValue: Double); safecall;
    function Get_DataPoint: CRGraphDataPoint; safecall;
    procedure Set_DataPoint(pDataPoint: CRGraphDataPoint); safecall;
    function Get_GroupAxisGridline: CRGridlineType; safecall;
    procedure Set_GroupAxisGridline(pGroupAxisGridline: CRGridlineType); safecall;
    function Get_SeriesAxisGridline: CRGridlineType; safecall;
    procedure Set_SeriesAxisGridline(pSeriesAxisGridline: CRGridlineType); safecall;
    function Get_DataAxisGridline: CRGridlineType; safecall;
    procedure Set_DataAxisGridline(pDataAxisGridline: CRGridlineType); safecall;
    function Get_Data2AxisGridline: CRGridlineType; safecall;
    procedure Set_Data2AxisGridline(pData2AxisGridline: CRGridlineType); safecall;
    function Get_EnableShowLegend: WordBool; safecall;
    procedure Set_EnableShowLegend(pEnableShowLegend: WordBool); safecall;
    function Get_LegendPosition: CRLegendPosition; safecall;
    procedure Set_LegendPosition(pLegendPosition: CRLegendPosition); safecall;
    function Get_GraphDirection: CRGraphDirection; safecall;
    procedure Set_GraphDirection(pDirection: CRGraphDirection); safecall;
    function Get_PieSize: CRPieSize; safecall;
    procedure Set_PieSize(pPieSize: CRPieSize); safecall;
    function Get_SliceDetachment: CRSliceDetachment; safecall;
    procedure Set_SliceDetachment(pSliceDetachment: CRSliceDetachment); safecall;
    function Get_BarSize: CRBarSize; safecall;
    procedure Set_BarSize(pBarSize: CRBarSize); safecall;
    function Get_MarkerSize: CRMarkerSize; safecall;
    procedure Set_MarkerSize(pMarkerSize: CRMarkerSize); safecall;
    function Get_MarkerShape: CRMarkerShape; safecall;
    procedure Set_MarkerShape(pMarkerShape: CRMarkerShape); safecall;
    function Get_DataAxisNumberFormat: CRNumberFormat; safecall;
    procedure Set_DataAxisNumberFormat(pDataAxisNumberFormat: CRNumberFormat); safecall;
    function Get_Data2AxisNumberFormat: CRNumberFormat; safecall;
    procedure Set_Data2AxisNumberFormat(pData2AxisNumberFormat: CRNumberFormat); safecall;
    function Get_SeriesAxisNumberFormat: CRNumberFormat; safecall;
    procedure Set_SeriesAxisNumberFormat(pSeriesAxisNumberFormat: CRNumberFormat); safecall;
    function Get_AutoRangeDataAxis: WordBool; safecall;
    procedure Set_AutoRangeDataAxis(pAutoRangeDataAxis: WordBool); safecall;
    function Get_AutoRangeData2Axis: WordBool; safecall;
    procedure Set_AutoRangeData2Axis(pAutoRangeData2Axis: WordBool); safecall;
    function Get_AutoRangeSeriesAxis: WordBool; safecall;
    procedure Set_AutoRangeSeriesAxis(pAutoRangeSeriesAxis: WordBool); safecall;
    function Get_DataAxisDivisionMethod: CRDivisionMethod; safecall;
    procedure Set_DataAxisDivisionMethod(pDataAxisDivisionMethod: CRDivisionMethod); safecall;
    function Get_Data2AxisDivisionMethod: CRDivisionMethod; safecall;
    procedure Set_Data2AxisDivisionMethod(pData2AxisDivisionMethod: CRDivisionMethod); safecall;
    function Get_SeriesAxisDivisionMethod: CRDivisionMethod; safecall;
    procedure Set_SeriesAxisDivisionMethod(pSeriesAxisDivisionMethod: CRDivisionMethod); safecall;
    function Get_DataAxisDivisionNumber: Integer; safecall;
    procedure Set_DataAxisDivisionNumber(pDataAxisDivisionNumber: Integer); safecall;
    function Get_Data2AxisDivisionNumber: Integer; safecall;
    procedure Set_Data2AxisDivisionNumber(pData2AxisDivisionNumber: Integer); safecall;
    function Get_SeriesAxisDivisionNumber: Integer; safecall;
    procedure Set_SeriesAxisDivisionNumber(pSeriesAxisDivisionNumber: Integer); safecall;
    function Get_GraphColor: CRGraphColor; safecall;
    procedure Set_GraphColor(pGraphColor: CRGraphColor); safecall;
    function Get_DataValueNumberFormat: CRNumberFormat; safecall;
    procedure Set_DataValueNumberFormat(pDataValueNumberFormat: CRNumberFormat); safecall;
    function Get_ViewingAngle: CRViewingAngle; safecall;
    procedure Set_ViewingAngle(pViewingAngle: CRViewingAngle); safecall;
    function Get_ZAxisTitle: WideString; safecall;
    procedure Set_ZAxisTitle(const ppZAxisTitle: WideString); safecall;
    function Get_ConditionFields: IFieldDefinitions; safecall;
    function Get_SummaryFields: IObjectSummaryFieldDefinitions; safecall;
    function Get_EnableForEachRecord: WordBool; safecall;
    procedure Set_EnableForEachRecord(pBool: WordBool); safecall;
    function Get_EnableSummarizeValues: WordBool; safecall;
    procedure Set_EnableSummarizeValues(pBool: WordBool); safecall;
    function Get_CrossTabObject: ICrossTabObject; safecall;
    function Get_TitleFont: IFontDisp; safecall;
    procedure _Set_TitleFont(const ppFont: IFontDisp); safecall;
    function Get_SubTitleFont: IFontDisp; safecall;
    procedure _Set_SubTitleFont(const ppFont: IFontDisp); safecall;
    function Get_FootnoteFont: IFontDisp; safecall;
    procedure _Set_FootnoteFont(const ppFont: IFontDisp); safecall;
    function Get_GroupTitleFont: IFontDisp; safecall;
    procedure _Set_GroupTitleFont(const ppFont: IFontDisp); safecall;
    function Get_DataTitleFont: IFontDisp; safecall;
    procedure _Set_DataTitleFont(const ppFont: IFontDisp); safecall;
    function Get_SeriesTitleFont: IFontDisp; safecall;
    procedure _Set_SeriesTitleFont(const ppFont: IFontDisp); safecall;
    function Get_LegendFont: IFontDisp; safecall;
    procedure _Set_LegendFont(const ppFont: IFontDisp); safecall;
    function Get_GroupLabelFont: IFontDisp; safecall;
    procedure _Set_GroupLabelFont(const ppFont: IFontDisp); safecall;
    function Get_DataLabelFont: IFontDisp; safecall;
    procedure _Set_DataLabelFont(const ppFont: IFontDisp); safecall;
    function Get_SeriesLabelFont: IFontDisp; safecall;
    procedure _Set_SeriesLabelFont(const ppFont: IFontDisp); safecall;
    function Get_IsTitleByDefault: WordBool; safecall;
    procedure Set_IsTitleByDefault(pBool: WordBool); safecall;
    function Get_IsSubTitleByDefault: WordBool; safecall;
    procedure Set_IsSubTitleByDefault(pBool: WordBool); safecall;
    function Get_IsFootnoteByDefault: WordBool; safecall;
    procedure Set_IsFootnoteByDefault(pBool: WordBool); safecall;
    function Get_IsXAxisTitleByDefault: WordBool; safecall;
    procedure Set_IsXAxisTitleByDefault(pBool: WordBool); safecall;
    function Get_IsYAxisTitleByDefault: WordBool; safecall;
    procedure Set_IsYAxisTitleByDefault(pBool: WordBool); safecall;
    function Get_IsZAxisTitleByDefault: WordBool; safecall;
    procedure Set_IsZAxisTitleByDefault(pBool: WordBool); safecall;
    function Get_EnableAutoScaleDataAxis: WordBool; safecall;
    procedure Set_EnableAutoScaleDataAxis(pBool: WordBool); safecall;
    function Get_EnableAutoScaleData2Axis: WordBool; safecall;
    procedure Set_EnableAutoScaleData2Axis(pBool: WordBool); safecall;
    function Get_EnableAutoScaleSeriesAxis: WordBool; safecall;
    procedure Set_EnableAutoScaleSeriesAxis(pBool: WordBool); safecall;
    function Get_LegendLayout: CRPieLegendLayout; safecall;
    procedure Set_LegendLayout(pLegendLayout: CRPieLegendLayout); safecall;
    function Get_ConditionFieldSortOrder(index: SYSINT): CRSortDirection; safecall;
    procedure Set_ConditionFieldSortOrder(index: SYSINT; pSortOrder: CRSortDirection); safecall;
    function Get_SpecifiedGroups(index: SYSINT): OleVariant; safecall;
    procedure Set_SpecifiedGroups(index: SYSINT; pSpecifedGroupArray: OleVariant); safecall;
    function Get_DataTitle: WideString; safecall;
    procedure Set_DataTitle(const ppDataTitle: WideString); safecall;
    function Get_Data2Title: WideString; safecall;
    procedure Set_Data2Title(const ppData2Title: WideString); safecall;
    function Get_IsGroupsTitleByDefault: WordBool; safecall;
    procedure Set_IsGroupsTitleByDefault(pBool: WordBool); safecall;
    function Get_IsSeriesTitleByDefault: WordBool; safecall;
    procedure Set_IsSeriesTitleByDefault(pBool: WordBool); safecall;
    function Get_IsDataTitleByDefault: WordBool; safecall;
    procedure Set_IsDataTitleByDefault(pBool: WordBool); safecall;
    function Get_IsData2TitleByDefault: WordBool; safecall;
    procedure Set_IsData2TitleByDefault(pBool: WordBool); safecall;
    function Get_Data2TitleFont: IFontDisp; safecall;
    procedure _Set_Data2TitleFont(const ppFont: IFontDisp); safecall;
    function Get_Data2LabelFont: IFontDisp; safecall;
    procedure _Set_Data2LabelFont(const ppFont: IFontDisp); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property DataType: CRGraphDataType read Get_DataType;
    property GraphType: CRGraphType read Get_GraphType write Set_GraphType;
    property Title: WideString read Get_Title write Set_Title;
    property SubTitle: WideString read Get_SubTitle write Set_SubTitle;
    property FootNote: WideString read Get_FootNote write Set_FootNote;
    property GroupsTitle: WideString read Get_GroupsTitle write Set_GroupsTitle;
    property SeriesTitle: WideString read Get_SeriesTitle write Set_SeriesTitle;
    property XAxisTitle: WideString read Get_XAxisTitle write Set_XAxisTitle;
    property YAxisTitle: WideString read Get_YAxisTitle write Set_YAxisTitle;
    property Y2AxisTitle: WideString read Get_Y2AxisTitle write Set_Y2AxisTitle;
    property MaxDataAxisValue: Double read Get_MaxDataAxisValue write Set_MaxDataAxisValue;
    property MinDataAxisValue: Double read Get_MinDataAxisValue write Set_MinDataAxisValue;
    property MaxData2AxisValue: Double read Get_MaxData2AxisValue write Set_MaxData2AxisValue;
    property MinData2AxisValue: Double read Get_MinData2AxisValue write Set_MinData2AxisValue;
    property MaxSeriesAxisValue: Double read Get_MaxSeriesAxisValue write Set_MaxSeriesAxisValue;
    property MinSeriesAxisValue: Double read Get_MinSeriesAxisValue write Set_MinSeriesAxisValue;
    property DataPoint: CRGraphDataPoint read Get_DataPoint write Set_DataPoint;
    property GroupAxisGridline: CRGridlineType read Get_GroupAxisGridline write Set_GroupAxisGridline;
    property SeriesAxisGridline: CRGridlineType read Get_SeriesAxisGridline write Set_SeriesAxisGridline;
    property DataAxisGridline: CRGridlineType read Get_DataAxisGridline write Set_DataAxisGridline;
    property Data2AxisGridline: CRGridlineType read Get_Data2AxisGridline write Set_Data2AxisGridline;
    property EnableShowLegend: WordBool read Get_EnableShowLegend write Set_EnableShowLegend;
    property LegendPosition: CRLegendPosition read Get_LegendPosition write Set_LegendPosition;
    property GraphDirection: CRGraphDirection read Get_GraphDirection write Set_GraphDirection;
    property PieSize: CRPieSize read Get_PieSize write Set_PieSize;
    property SliceDetachment: CRSliceDetachment read Get_SliceDetachment write Set_SliceDetachment;
    property BarSize: CRBarSize read Get_BarSize write Set_BarSize;
    property MarkerSize: CRMarkerSize read Get_MarkerSize write Set_MarkerSize;
    property MarkerShape: CRMarkerShape read Get_MarkerShape write Set_MarkerShape;
    property DataAxisNumberFormat: CRNumberFormat read Get_DataAxisNumberFormat write Set_DataAxisNumberFormat;
    property Data2AxisNumberFormat: CRNumberFormat read Get_Data2AxisNumberFormat write Set_Data2AxisNumberFormat;
    property SeriesAxisNumberFormat: CRNumberFormat read Get_SeriesAxisNumberFormat write Set_SeriesAxisNumberFormat;
    property AutoRangeDataAxis: WordBool read Get_AutoRangeDataAxis write Set_AutoRangeDataAxis;
    property AutoRangeData2Axis: WordBool read Get_AutoRangeData2Axis write Set_AutoRangeData2Axis;
    property AutoRangeSeriesAxis: WordBool read Get_AutoRangeSeriesAxis write Set_AutoRangeSeriesAxis;
    property DataAxisDivisionMethod: CRDivisionMethod read Get_DataAxisDivisionMethod write Set_DataAxisDivisionMethod;
    property Data2AxisDivisionMethod: CRDivisionMethod read Get_Data2AxisDivisionMethod write Set_Data2AxisDivisionMethod;
    property SeriesAxisDivisionMethod: CRDivisionMethod read Get_SeriesAxisDivisionMethod write Set_SeriesAxisDivisionMethod;
    property DataAxisDivisionNumber: Integer read Get_DataAxisDivisionNumber write Set_DataAxisDivisionNumber;
    property Data2AxisDivisionNumber: Integer read Get_Data2AxisDivisionNumber write Set_Data2AxisDivisionNumber;
    property SeriesAxisDivisionNumber: Integer read Get_SeriesAxisDivisionNumber write Set_SeriesAxisDivisionNumber;
    property GraphColor: CRGraphColor read Get_GraphColor write Set_GraphColor;
    property DataValueNumberFormat: CRNumberFormat read Get_DataValueNumberFormat write Set_DataValueNumberFormat;
    property ViewingAngle: CRViewingAngle read Get_ViewingAngle write Set_ViewingAngle;
    property ZAxisTitle: WideString read Get_ZAxisTitle write Set_ZAxisTitle;
    property ConditionFields: IFieldDefinitions read Get_ConditionFields;
    property SummaryFields: IObjectSummaryFieldDefinitions read Get_SummaryFields;
    property EnableForEachRecord: WordBool read Get_EnableForEachRecord write Set_EnableForEachRecord;
    property EnableSummarizeValues: WordBool read Get_EnableSummarizeValues write Set_EnableSummarizeValues;
    property CrossTabObject: ICrossTabObject read Get_CrossTabObject;
    property TitleFont: IFontDisp read Get_TitleFont write _Set_TitleFont;
    property SubTitleFont: IFontDisp read Get_SubTitleFont write _Set_SubTitleFont;
    property FootnoteFont: IFontDisp read Get_FootnoteFont write _Set_FootnoteFont;
    property GroupTitleFont: IFontDisp read Get_GroupTitleFont write _Set_GroupTitleFont;
    property DataTitleFont: IFontDisp read Get_DataTitleFont write _Set_DataTitleFont;
    property SeriesTitleFont: IFontDisp read Get_SeriesTitleFont write _Set_SeriesTitleFont;
    property LegendFont: IFontDisp read Get_LegendFont write _Set_LegendFont;
    property GroupLabelFont: IFontDisp read Get_GroupLabelFont write _Set_GroupLabelFont;
    property DataLabelFont: IFontDisp read Get_DataLabelFont write _Set_DataLabelFont;
    property SeriesLabelFont: IFontDisp read Get_SeriesLabelFont write _Set_SeriesLabelFont;
    property IsTitleByDefault: WordBool read Get_IsTitleByDefault write Set_IsTitleByDefault;
    property IsSubTitleByDefault: WordBool read Get_IsSubTitleByDefault write Set_IsSubTitleByDefault;
    property IsFootnoteByDefault: WordBool read Get_IsFootnoteByDefault write Set_IsFootnoteByDefault;
    property IsXAxisTitleByDefault: WordBool read Get_IsXAxisTitleByDefault write Set_IsXAxisTitleByDefault;
    property IsYAxisTitleByDefault: WordBool read Get_IsYAxisTitleByDefault write Set_IsYAxisTitleByDefault;
    property IsZAxisTitleByDefault: WordBool read Get_IsZAxisTitleByDefault write Set_IsZAxisTitleByDefault;
    property EnableAutoScaleDataAxis: WordBool read Get_EnableAutoScaleDataAxis write Set_EnableAutoScaleDataAxis;
    property EnableAutoScaleData2Axis: WordBool read Get_EnableAutoScaleData2Axis write Set_EnableAutoScaleData2Axis;
    property EnableAutoScaleSeriesAxis: WordBool read Get_EnableAutoScaleSeriesAxis write Set_EnableAutoScaleSeriesAxis;
    property LegendLayout: CRPieLegendLayout read Get_LegendLayout write Set_LegendLayout;
    property ConditionFieldSortOrder[index: SYSINT]: CRSortDirection read Get_ConditionFieldSortOrder write Set_ConditionFieldSortOrder;
    property SpecifiedGroups[index: SYSINT]: OleVariant read Get_SpecifiedGroups write Set_SpecifiedGroups;
    property DataTitle: WideString read Get_DataTitle write Set_DataTitle;
    property Data2Title: WideString read Get_Data2Title write Set_Data2Title;
    property IsGroupsTitleByDefault: WordBool read Get_IsGroupsTitleByDefault write Set_IsGroupsTitleByDefault;
    property IsSeriesTitleByDefault: WordBool read Get_IsSeriesTitleByDefault write Set_IsSeriesTitleByDefault;
    property IsDataTitleByDefault: WordBool read Get_IsDataTitleByDefault write Set_IsDataTitleByDefault;
    property IsData2TitleByDefault: WordBool read Get_IsData2TitleByDefault write Set_IsData2TitleByDefault;
    property Data2TitleFont: IFontDisp read Get_Data2TitleFont write _Set_Data2TitleFont;
    property Data2LabelFont: IFontDisp read Get_Data2LabelFont write _Set_Data2LabelFont;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  IGraphObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376824-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IGraphObjectDisp = dispinterface
    ['{AF376824-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property DataType: CRGraphDataType readonly dispid 199;
    property GraphType: CRGraphType dispid 353;
    property Title: WideString dispid 354;
    property SubTitle: WideString dispid 355;
    property FootNote: WideString dispid 356;
    property GroupsTitle: WideString dispid 357;
    property SeriesTitle: WideString dispid 358;
    property XAxisTitle: WideString dispid 359;
    property YAxisTitle: WideString dispid 360;
    property Y2AxisTitle: WideString dispid 361;
    property MaxDataAxisValue: Double dispid 362;
    property MinDataAxisValue: Double dispid 363;
    property MaxData2AxisValue: Double dispid 367;
    property MinData2AxisValue: Double dispid 368;
    property MaxSeriesAxisValue: Double dispid 413;
    property MinSeriesAxisValue: Double dispid 414;
    property DataPoint: CRGraphDataPoint dispid 364;
    property GroupAxisGridline: CRGridlineType dispid 415;
    property SeriesAxisGridline: CRGridlineType dispid 416;
    property DataAxisGridline: CRGridlineType dispid 417;
    property Data2AxisGridline: CRGridlineType dispid 418;
    property EnableShowLegend: WordBool dispid 366;
    property LegendPosition: CRLegendPosition dispid 412;
    property GraphDirection: CRGraphDirection dispid 372;
    property PieSize: CRPieSize dispid 419;
    property SliceDetachment: CRSliceDetachment dispid 420;
    property BarSize: CRBarSize dispid 421;
    property MarkerSize: CRMarkerSize dispid 422;
    property MarkerShape: CRMarkerShape dispid 423;
    property DataAxisNumberFormat: CRNumberFormat dispid 424;
    property Data2AxisNumberFormat: CRNumberFormat dispid 425;
    property SeriesAxisNumberFormat: CRNumberFormat dispid 426;
    property AutoRangeDataAxis: WordBool dispid 427;
    property AutoRangeData2Axis: WordBool dispid 428;
    property AutoRangeSeriesAxis: WordBool dispid 429;
    property DataAxisDivisionMethod: CRDivisionMethod dispid 430;
    property Data2AxisDivisionMethod: CRDivisionMethod dispid 431;
    property SeriesAxisDivisionMethod: CRDivisionMethod dispid 432;
    property DataAxisDivisionNumber: Integer dispid 433;
    property Data2AxisDivisionNumber: Integer dispid 434;
    property SeriesAxisDivisionNumber: Integer dispid 435;
    property GraphColor: CRGraphColor dispid 436;
    property DataValueNumberFormat: CRNumberFormat dispid 437;
    property ViewingAngle: CRViewingAngle dispid 438;
    property ZAxisTitle: WideString dispid 458;
    property ConditionFields: IFieldDefinitions readonly dispid 566;
    property SummaryFields: IObjectSummaryFieldDefinitions readonly dispid 567;
    property EnableForEachRecord: WordBool dispid 568;
    property EnableSummarizeValues: WordBool dispid 569;
    property CrossTabObject: ICrossTabObject readonly dispid 570;
    property TitleFont: IFontDisp dispid 508;
    property SubTitleFont: IFontDisp dispid 509;
    property FootnoteFont: IFontDisp dispid 510;
    property GroupTitleFont: IFontDisp dispid 511;
    property DataTitleFont: IFontDisp dispid 512;
    property SeriesTitleFont: IFontDisp dispid 513;
    property LegendFont: IFontDisp dispid 514;
    property GroupLabelFont: IFontDisp dispid 515;
    property DataLabelFont: IFontDisp dispid 516;
    property SeriesLabelFont: IFontDisp dispid 517;
    property IsTitleByDefault: WordBool dispid 520;
    property IsSubTitleByDefault: WordBool dispid 521;
    property IsFootnoteByDefault: WordBool dispid 522;
    property IsXAxisTitleByDefault: WordBool dispid 525;
    property IsYAxisTitleByDefault: WordBool dispid 526;
    property IsZAxisTitleByDefault: WordBool dispid 527;
    property EnableAutoScaleDataAxis: WordBool dispid 528;
    property EnableAutoScaleData2Axis: WordBool dispid 529;
    property EnableAutoScaleSeriesAxis: WordBool dispid 530;
    property LegendLayout: CRPieLegendLayout dispid 531;
    property ConditionFieldSortOrder[index: SYSINT]: CRSortDirection dispid 724;
    property SpecifiedGroups[index: SYSINT]: OleVariant dispid 722;
    property DataTitle: WideString dispid 712;
    property Data2Title: WideString dispid 713;
    property IsGroupsTitleByDefault: WordBool dispid 714;
    property IsSeriesTitleByDefault: WordBool dispid 717;
    property IsDataTitleByDefault: WordBool dispid 715;
    property IsData2TitleByDefault: WordBool dispid 716;
    property Data2TitleFont: IFontDisp dispid 718;
    property Data2LabelFont: IFontDisp dispid 719;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: IFieldDefinitions
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376851-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldDefinitions = interface(IDispatch)
    ['{AF376851-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReportObject; safecall;
    procedure Add(Field: OleVariant); safecall;
    procedure Delete(Field: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReportObject read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IFieldDefinitionsDisp
// Flags:     (4544) Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376851-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldDefinitionsDisp = dispinterface
    ['{AF376851-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReportObject readonly dispid 100;
    procedure Add(Field: OleVariant); dispid 230;
    procedure Delete(Field: OleVariant); dispid 377;
  end;

// *********************************************************************//
// Interface: IDatabase
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376818-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabase = interface(IDispatch)
    ['{AF376818-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Tables: IDatabaseTables; safecall;
    function Get_Parent: IReport; safecall;
    procedure LogOnServer(const pDllName: WideString; const pServerName: WideString; 
                          pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); safecall;
    procedure LogOffServer(const pDllName: WideString; const pServerName: WideString; 
                           pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); safecall;
    procedure SetDataSource(data: OleVariant; dataTag: OleVariant; tableNumber: OleVariant); safecall;
    procedure Verify; safecall;
    function Get_Links: ITableLinks; safecall;
    procedure AddOLEDBSource(const pConnectionString: WideString; const pTableName: WideString); safecall;
    procedure AddADOCommand(pConnection: OleVariant; pCommand: OleVariant); safecall;
    procedure LogOnServerEx(const pDllName: WideString; const pServerName: WideString; 
                            pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant; 
                            pServerType: OleVariant; pConnectionString: OleVariant); safecall;
    function Get_DictionaryLocation: WideString; safecall;
    procedure Set_DictionaryLocation(const ppLocation: WideString); safecall;
    procedure LogOnServerWithPrivateInfo(const pDllName: WideString; privateInfo: OleVariant); safecall;
    procedure ConvertDatabaseDriver(const pDllName: WideString; blDoImmediateConvert: WordBool); safecall;
    property Tables: IDatabaseTables read Get_Tables;
    property Parent: IReport read Get_Parent;
    property Links: ITableLinks read Get_Links;
    property DictionaryLocation: WideString read Get_DictionaryLocation write Set_DictionaryLocation;
  end;

// *********************************************************************//
// DispIntf:  IDatabaseDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376818-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseDisp = dispinterface
    ['{AF376818-6120-4E28-96DD-63FD2DC27B7A}']
    property Tables: IDatabaseTables readonly dispid 227;
    property Parent: IReport readonly dispid 100;
    procedure LogOnServer(const pDllName: WideString; const pServerName: WideString; 
                          pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); dispid 228;
    procedure LogOffServer(const pDllName: WideString; const pServerName: WideString; 
                           pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); dispid 229;
    procedure SetDataSource(data: OleVariant; dataTag: OleVariant; tableNumber: OleVariant); dispid 234;
    procedure Verify; dispid 322;
    property Links: ITableLinks readonly dispid 650;
    procedure AddOLEDBSource(const pConnectionString: WideString; const pTableName: WideString); dispid 539;
    procedure AddADOCommand(pConnection: OleVariant; pCommand: OleVariant); dispid 540;
    procedure LogOnServerEx(const pDllName: WideString; const pServerName: WideString; 
                            pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant; 
                            pServerType: OleVariant; pConnectionString: OleVariant); dispid 545;
    property DictionaryLocation: WideString dispid 723;
    procedure LogOnServerWithPrivateInfo(const pDllName: WideString; privateInfo: OleVariant); dispid 725;
    procedure ConvertDatabaseDriver(const pDllName: WideString; blDoImmediateConvert: WordBool); dispid 721;
  end;

// *********************************************************************//
// Interface: IDatabaseTables
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376819-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseTables = interface(IDispatch)
    ['{AF376819-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IDatabaseTable; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IDatabase; safecall;
    procedure Add(const pLocation: WideString; pSubLocation: OleVariant; pConnectInfo: OleVariant; 
                  tableType: OleVariant; pDllName: OleVariant; pServerName: OleVariant; 
                  pServerType: OleVariant; pDatabaseName: OleVariant; pUserID: OleVariant; 
                  pPassword: OleVariant); safecall;
    procedure Delete(index: Integer); safecall;
    procedure AddStoredProcedure(const pLocation: WideString; pSubLocation: OleVariant; 
                                 pConnectInfo: OleVariant; tableType: OleVariant; 
                                 pDllName: OleVariant; pServerName: OleVariant; 
                                 pServerType: OleVariant; pDatabaseName: OleVariant; 
                                 pUserID: OleVariant; pPassword: OleVariant; 
                                 paramValueInfos: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IDatabaseTable read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IDatabase read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IDatabaseTablesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376819-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseTablesDisp = dispinterface
    ['{AF376819-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IDatabaseTable readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IDatabase readonly dispid 100;
    procedure Add(const pLocation: WideString; pSubLocation: OleVariant; pConnectInfo: OleVariant; 
                  tableType: OleVariant; pDllName: OleVariant; pServerName: OleVariant; 
                  pServerType: OleVariant; pDatabaseName: OleVariant; pUserID: OleVariant; 
                  pPassword: OleVariant); dispid 230;
    procedure Delete(index: Integer); dispid 377;
    procedure AddStoredProcedure(const pLocation: WideString; pSubLocation: OleVariant; 
                                 pConnectInfo: OleVariant; tableType: OleVariant; 
                                 pDllName: OleVariant; pServerName: OleVariant; 
                                 pServerType: OleVariant; pDatabaseName: OleVariant; 
                                 pUserID: OleVariant; pPassword: OleVariant; 
                                 paramValueInfos: OleVariant); dispid 731;
  end;

// *********************************************************************//
// Interface: IDatabaseTable
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseTable = interface(IDispatch)
    ['{AF37681A-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Location: WideString; safecall;
    procedure Set_Location(const ppLocation: WideString); safecall;
    function Get_Fields: IDatabaseFieldDefinitions; safecall;
    procedure SetPrivateData(dataTag: Integer; data: OleVariant); safecall;
    function Get_Parent: IDatabase; safecall;
    procedure SetDataSource(data: OleVariant; dataTag: OleVariant); safecall;
    function Get_DllName: WideString; safecall;
    function Get_DecriptiveName: WideString; safecall;
    function Get_LogOnServerName: WideString; safecall;
    function Get_LogOnDatabaseName: WideString; safecall;
    function Get_LogOnUserID: WideString; safecall;
    function Get_SessionUserID: WideString; safecall;
    function TestConnectivity: WordBool; safecall;
    procedure SetLogOnInfo(const pServerName: WideString; pDatabaseName: OleVariant; 
                           pUserID: OleVariant; pPassword: OleVariant); safecall;
    procedure SetSessionInfo(const pSessionUserID: WideString; const pSessionPassword: WideString); safecall;
    function Get_DatabaseType: CRDatabaseType; safecall;
    procedure CheckDifferences(out pDifferences: Integer; out reserved: OleVariant); safecall;
    function Get_SubLocation: WideString; safecall;
    procedure SetTableLocation(const pLocation: WideString; const pSubLocation: WideString; 
                               const pConnectBufferSting: WideString); safecall;
    function Get_ConnectBufferString: WideString; safecall;
    procedure Set_ConnectBufferString(const ppConnectBufferString: WideString); safecall;
    procedure Set_DllName(const ppDllName: WideString); safecall;
    function Get_ConnectionProperties: INameValuePairs; safecall;
    function Get_Qualifiers: ITableQualifiers; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Location: WideString read Get_Location write Set_Location;
    property Fields: IDatabaseFieldDefinitions read Get_Fields;
    property Parent: IDatabase read Get_Parent;
    property DllName: WideString read Get_DllName write Set_DllName;
    property DecriptiveName: WideString read Get_DecriptiveName;
    property LogOnServerName: WideString read Get_LogOnServerName;
    property LogOnDatabaseName: WideString read Get_LogOnDatabaseName;
    property LogOnUserID: WideString read Get_LogOnUserID;
    property SessionUserID: WideString read Get_SessionUserID;
    property DatabaseType: CRDatabaseType read Get_DatabaseType;
    property SubLocation: WideString read Get_SubLocation;
    property ConnectBufferString: WideString read Get_ConnectBufferString write Set_ConnectBufferString;
    property ConnectionProperties: INameValuePairs read Get_ConnectionProperties;
    property Qualifiers: ITableQualifiers read Get_Qualifiers;
  end;

// *********************************************************************//
// DispIntf:  IDatabaseTableDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseTableDisp = dispinterface
    ['{AF37681A-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Location: WideString dispid 231;
    property Fields: IDatabaseFieldDefinitions readonly dispid 232;
    procedure SetPrivateData(dataTag: Integer; data: OleVariant); dispid 233;
    property Parent: IDatabase readonly dispid 100;
    procedure SetDataSource(data: OleVariant; dataTag: OleVariant); dispid 234;
    property DllName: WideString dispid 312;
    property DecriptiveName: WideString readonly dispid 313;
    property LogOnServerName: WideString readonly dispid 314;
    property LogOnDatabaseName: WideString readonly dispid 315;
    property LogOnUserID: WideString readonly dispid 316;
    property SessionUserID: WideString readonly dispid 317;
    function TestConnectivity: WordBool; dispid 318;
    procedure SetLogOnInfo(const pServerName: WideString; pDatabaseName: OleVariant; 
                           pUserID: OleVariant; pPassword: OleVariant); dispid 319;
    procedure SetSessionInfo(const pSessionUserID: WideString; const pSessionPassword: WideString); dispid 320;
    property DatabaseType: CRDatabaseType readonly dispid 382;
    procedure CheckDifferences(out pDifferences: Integer; out reserved: OleVariant); dispid 651;
    property SubLocation: WideString readonly dispid 652;
    procedure SetTableLocation(const pLocation: WideString; const pSubLocation: WideString; 
                               const pConnectBufferSting: WideString); dispid 654;
    property ConnectBufferString: WideString dispid 653;
    property ConnectionProperties: INameValuePairs readonly dispid 789;
    property Qualifiers: ITableQualifiers readonly dispid 800;
  end;

// *********************************************************************//
// Interface: IDatabaseFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseFieldDefinitions = interface(IDispatch)
    ['{AF37681D-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IDatabaseFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IDatabaseTable; safecall;
    function GetItemByName(const Name: WideString): IDatabaseFieldDefinition; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IDatabaseFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IDatabaseTable read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IDatabaseFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IDatabaseFieldDefinitionsDisp = dispinterface
    ['{AF37681D-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IDatabaseFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IDatabaseTable readonly dispid 100;
    function GetItemByName(const Name: WideString): IDatabaseFieldDefinition; dispid 750;
  end;

// *********************************************************************//
// Interface: INameValuePairs
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376860-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  INameValuePairs = interface(IDispatch)
    ['{AF376860-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(const Name: WideString): OleVariant; safecall;
    function Get_Count: Integer; safecall;
    procedure Add(const Name: WideString; Value: OleVariant); safecall;
    procedure Delete(index: OleVariant); safecall;
    procedure DeleteAll; safecall;
    function Get_NameIDs: OleVariant; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[const Name: WideString]: OleVariant read Get_Item; default;
    property Count: Integer read Get_Count;
    property NameIDs: OleVariant read Get_NameIDs;
  end;

// *********************************************************************//
// DispIntf:  INameValuePairsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376860-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  INameValuePairsDisp = dispinterface
    ['{AF376860-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[const Name: WideString]: OleVariant readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    procedure Add(const Name: WideString; Value: OleVariant); dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
    procedure DeleteAll; dispid 782;
    property NameIDs: OleVariant readonly dispid 783;
  end;

// *********************************************************************//
// Interface: ITableQualifiers
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {18B4704D-8501-444C-8207-256BADB31F07}
// *********************************************************************//
  ITableQualifiers = interface(IDispatch)
    ['{18B4704D-8501-444C-8207-256BADB31F07}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): WideString; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: WideString read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ITableQualifiersDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {18B4704D-8501-444C-8207-256BADB31F07}
// *********************************************************************//
  ITableQualifiersDisp = dispinterface
    ['{18B4704D-8501-444C-8207-256BADB31F07}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: WideString readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
  end;

// *********************************************************************//
// Interface: ITableLinks
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ITableLinks = interface(IDispatch)
    ['{AF37681B-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    function Get_Item(index: Integer): ITableLink; safecall;
    function Get_Parent: IDatabase; safecall;
    function Add(const psrcTable: IDatabaseTable; const pDestTable: IDatabaseTable; 
                 srcFields: OleVariant; destFields: OleVariant; JoinType: CRLinkJoinType; 
                 LookupType: CRLinkLookUpType; PartialMatchEnabled: WordBool; indexInUse: Smallint): ITableLink; safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Item[index: Integer]: ITableLink read Get_Item; default;
    property Parent: IDatabase read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ITableLinksDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ITableLinksDisp = dispinterface
    ['{AF37681B-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 161;
    property Item[index: Integer]: ITableLink readonly dispid 0; default;
    property Parent: IDatabase readonly dispid 100;
    function Add(const psrcTable: IDatabaseTable; const pDestTable: IDatabaseTable; 
                 srcFields: OleVariant; destFields: OleVariant; JoinType: CRLinkJoinType; 
                 LookupType: CRLinkLookUpType; PartialMatchEnabled: WordBool; indexInUse: Smallint): ITableLink; dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: ITableLink
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ITableLink = interface(IDispatch)
    ['{AF37681C-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IDatabase; safecall;
    function Get_SourceTable: IDatabaseTable; safecall;
    function Get_DestinationTable: IDatabaseTable; safecall;
    function Get_JoinType: CRLinkJoinType; safecall;
    function Get_LookupType: CRLinkLookUpType; safecall;
    function Get_PartialMatchEnabled: WordBool; safecall;
    function Get_IndexUsed: Smallint; safecall;
    function Get_SourceFields: IDatabaseFieldDefinitions; safecall;
    function Get_DestinationFields: IDatabaseFieldDefinitions; safecall;
    property Parent: IDatabase read Get_Parent;
    property SourceTable: IDatabaseTable read Get_SourceTable;
    property DestinationTable: IDatabaseTable read Get_DestinationTable;
    property JoinType: CRLinkJoinType read Get_JoinType;
    property LookupType: CRLinkLookUpType read Get_LookupType;
    property PartialMatchEnabled: WordBool read Get_PartialMatchEnabled;
    property IndexUsed: Smallint read Get_IndexUsed;
    property SourceFields: IDatabaseFieldDefinitions read Get_SourceFields;
    property DestinationFields: IDatabaseFieldDefinitions read Get_DestinationFields;
  end;

// *********************************************************************//
// DispIntf:  ITableLinkDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ITableLinkDisp = dispinterface
    ['{AF37681C-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IDatabase readonly dispid 100;
    property SourceTable: IDatabaseTable readonly dispid 655;
    property DestinationTable: IDatabaseTable readonly dispid 656;
    property JoinType: CRLinkJoinType readonly dispid 657;
    property LookupType: CRLinkLookUpType readonly dispid 658;
    property PartialMatchEnabled: WordBool readonly dispid 659;
    property IndexUsed: Smallint readonly dispid 660;
    property SourceFields: IDatabaseFieldDefinitions readonly dispid 661;
    property DestinationFields: IDatabaseFieldDefinitions readonly dispid 662;
  end;

// *********************************************************************//
// Interface: IFormulaFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFormulaFieldDefinitions = interface(IDispatch)
    ['{AF37681E-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IFormulaFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    function Add(const FormulaName: WideString; const Text: WideString): IFormulaFieldDefinition; safecall;
    procedure Delete(index: OleVariant); safecall;
    function GetItemByName(const Name: WideString): IFormulaFieldDefinition; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IFormulaFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IFormulaFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFormulaFieldDefinitionsDisp = dispinterface
    ['{AF37681E-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IFormulaFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    function Add(const FormulaName: WideString; const Text: WideString): IFormulaFieldDefinition; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
    function GetItemByName(const Name: WideString): IFormulaFieldDefinition; dispid 750;
  end;

// *********************************************************************//
// Interface: IFormulaFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFormulaFieldDefinition = interface(IDispatch)
    ['{AF37680F-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_FormulaFieldName: WideString; safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const ppText: WideString); safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    procedure Check(out pBool: WordBool; out ppErrorString: WideString); safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property FormulaFieldName: WideString read Get_FormulaFieldName;
    property Text: WideString read Get_Text write Set_Text;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
  end;

// *********************************************************************//
// DispIntf:  IFormulaFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37680F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFormulaFieldDefinitionDisp = dispinterface
    ['{AF37680F-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property FormulaFieldName: WideString readonly dispid 164;
    property Text: WideString dispid 157;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    procedure Check(out pBool: WordBool; out ppErrorString: WideString); dispid 352;
  end;

// *********************************************************************//
// Interface: IParameterFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterFieldDefinitions = interface(IDispatch)
    ['{AF37681F-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IParameterFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    function Add(const parameterName: WideString; ValueType: CRFieldValueType): IParameterFieldDefinition; safecall;
    procedure Delete(index: OleVariant); safecall;
    function GetItemByName(const Name: WideString; SubreportName: OleVariant): IParameterFieldDefinition; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IParameterFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IParameterFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37681F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterFieldDefinitionsDisp = dispinterface
    ['{AF37681F-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IParameterFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    function Add(const parameterName: WideString; ValueType: CRFieldValueType): IParameterFieldDefinition; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
    function GetItemByName(const Name: WideString; SubreportName: OleVariant): IParameterFieldDefinition; dispid 750;
  end;

// *********************************************************************//
// Interface: IParameterFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376812-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterFieldDefinition = interface(IDispatch)
    ['{AF376812-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_ParameterFieldName: WideString; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_Prompt: WideString; safecall;
    procedure Set_Prompt(const ppPrompt: WideString); safecall;
    function Get_IsDefaultValueSet: WordBool; safecall;
    function Get_ReportName: WideString; safecall;
    function Get_NeedsCurrentValue: WordBool; safecall;
    function Get_IsCurrentValueSet: WordBool; safecall;
    function Get_CurrentValue: OleVariant; safecall;
    function Get_DefaultValue: OleVariant; safecall;
    procedure SetCurrentValue(CurrentValue: OleVariant; ValueType: OleVariant); safecall;
    procedure SetDefaultValue(DefaultValue: OleVariant; ValueType: OleVariant); safecall;
    function Get_EnableRangeLimit: WordBool; safecall;
    procedure Set_EnableRangeLimit(pBool: WordBool); safecall;
    function Get_MinimumValue: OleVariant; safecall;
    procedure Set_MinimumValue(pMinimumValue: OleVariant); safecall;
    function Get_MaximumValue: OleVariant; safecall;
    procedure Set_MaximumValue(pMaximumValue: OleVariant); safecall;
    function Get_EditMask: WideString; safecall;
    procedure Set_EditMask(const ppEditMask: WideString); safecall;
    function Get_ParameterType: CRParameterFieldType; safecall;
    function Get_DisallowEditing: WordBool; safecall;
    procedure Set_DisallowEditing(pBool: WordBool); safecall;
    function Get_NumberOfDefaultValues: Smallint; safecall;
    function GetNthDefaultValue(index: Smallint): OleVariant; safecall;
    procedure SetNthDefaultValue(index: Smallint; nthDefaultValue: OleVariant); safecall;
    procedure AddDefaultValue(DefaultValue: OleVariant); safecall;
    procedure DeleteNthDefaultValue(index: Smallint); safecall;
    function Get_EnableNullValue: WordBool; safecall;
    procedure Set_EnableNullValue(pBool: WordBool); safecall;
    function Get_EnableMultipleValues: WordBool; safecall;
    procedure Set_EnableMultipleValues(pBool: WordBool); safecall;
    function Get_DiscreteOrRangeKind: CRDiscreteOrRangeKind; safecall;
    procedure Set_DiscreteOrRangeKind(pDiscreteOrRangeKind: CRDiscreteOrRangeKind); safecall;
    function Get_PlaceInGroup: WordBool; safecall;
    procedure Set_PlaceInGroup(pBool: WordBool); safecall;
    function Get_GroupNumber: Smallint; safecall;
    procedure Set_GroupNumber(pGroupNumber: Smallint); safecall;
    function Get_EnableExclusiveGroup: WordBool; safecall;
    procedure Set_EnableExclusiveGroup(pBool: WordBool); safecall;
    function Get_NumberOfCurrentValues: Smallint; safecall;
    function Get_NumberOfCurrentRanges: Smallint; safecall;
    function GetNthCurrentValue(index: Smallint): OleVariant; safecall;
    procedure AddCurrentValue(CurrentValue: OleVariant); safecall;
    procedure GetNthCurrentRange(index: Smallint; out pStart: OleVariant; out pEnd: OleVariant; 
                                 out pRangeInfo: CRRangeInfo); safecall;
    procedure AddCurrentRange(start: OleVariant; end_: OleVariant; rangeInfo: CRRangeInfo); safecall;
    procedure ClearCurrentValueAndRange; safecall;
    function Get_NthValueDescription(index: Smallint): WideString; safecall;
    procedure Set_NthValueDescription(index: Smallint; const pValueDescription: WideString); safecall;
    function Get_EnableShowDescriptionOnly: WordBool; safecall;
    procedure Set_EnableShowDescriptionOnly(pBool: WordBool); safecall;
    function Get_PicklistSortMethod: CRParameterPicklistSortMethod; safecall;
    procedure Set_PicklistSortMethod(pMethod: CRParameterPicklistSortMethod); safecall;
    function Get_EnableSortBasedOnDesc: WordBool; safecall;
    procedure Set_EnableSortBasedOnDesc(pBool: WordBool); safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property ParameterFieldName: WideString read Get_ParameterFieldName;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property Prompt: WideString read Get_Prompt write Set_Prompt;
    property IsDefaultValueSet: WordBool read Get_IsDefaultValueSet;
    property ReportName: WideString read Get_ReportName;
    property NeedsCurrentValue: WordBool read Get_NeedsCurrentValue;
    property IsCurrentValueSet: WordBool read Get_IsCurrentValueSet;
    property CurrentValue: OleVariant read Get_CurrentValue;
    property DefaultValue: OleVariant read Get_DefaultValue;
    property EnableRangeLimit: WordBool read Get_EnableRangeLimit write Set_EnableRangeLimit;
    property MinimumValue: OleVariant read Get_MinimumValue write Set_MinimumValue;
    property MaximumValue: OleVariant read Get_MaximumValue write Set_MaximumValue;
    property EditMask: WideString read Get_EditMask write Set_EditMask;
    property ParameterType: CRParameterFieldType read Get_ParameterType;
    property DisallowEditing: WordBool read Get_DisallowEditing write Set_DisallowEditing;
    property NumberOfDefaultValues: Smallint read Get_NumberOfDefaultValues;
    property EnableNullValue: WordBool read Get_EnableNullValue write Set_EnableNullValue;
    property EnableMultipleValues: WordBool read Get_EnableMultipleValues write Set_EnableMultipleValues;
    property DiscreteOrRangeKind: CRDiscreteOrRangeKind read Get_DiscreteOrRangeKind write Set_DiscreteOrRangeKind;
    property PlaceInGroup: WordBool read Get_PlaceInGroup write Set_PlaceInGroup;
    property GroupNumber: Smallint read Get_GroupNumber write Set_GroupNumber;
    property EnableExclusiveGroup: WordBool read Get_EnableExclusiveGroup write Set_EnableExclusiveGroup;
    property NumberOfCurrentValues: Smallint read Get_NumberOfCurrentValues;
    property NumberOfCurrentRanges: Smallint read Get_NumberOfCurrentRanges;
    property NthValueDescription[index: Smallint]: WideString read Get_NthValueDescription write Set_NthValueDescription;
    property EnableShowDescriptionOnly: WordBool read Get_EnableShowDescriptionOnly write Set_EnableShowDescriptionOnly;
    property PicklistSortMethod: CRParameterPicklistSortMethod read Get_PicklistSortMethod write Set_PicklistSortMethod;
    property EnableSortBasedOnDesc: WordBool read Get_EnableSortBasedOnDesc write Set_EnableSortBasedOnDesc;
  end;

// *********************************************************************//
// DispIntf:  IParameterFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376812-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterFieldDefinitionDisp = dispinterface
    ['{AF376812-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property ParameterFieldName: WideString readonly dispid 188;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property Prompt: WideString dispid 296;
    property IsDefaultValueSet: WordBool readonly dispid 297;
    property ReportName: WideString readonly dispid 298;
    property NeedsCurrentValue: WordBool readonly dispid 299;
    property IsCurrentValueSet: WordBool readonly dispid 300;
    property CurrentValue: OleVariant readonly dispid 301;
    property DefaultValue: OleVariant readonly dispid 302;
    procedure SetCurrentValue(CurrentValue: OleVariant; ValueType: OleVariant); dispid 303;
    procedure SetDefaultValue(DefaultValue: OleVariant; ValueType: OleVariant); dispid 304;
    property EnableRangeLimit: WordBool dispid 387;
    property MinimumValue: OleVariant dispid 388;
    property MaximumValue: OleVariant dispid 389;
    property EditMask: WideString dispid 390;
    property ParameterType: CRParameterFieldType readonly dispid 391;
    property DisallowEditing: WordBool dispid 392;
    property NumberOfDefaultValues: Smallint readonly dispid 393;
    function GetNthDefaultValue(index: Smallint): OleVariant; dispid 397;
    procedure SetNthDefaultValue(index: Smallint; nthDefaultValue: OleVariant); dispid 394;
    procedure AddDefaultValue(DefaultValue: OleVariant); dispid 395;
    procedure DeleteNthDefaultValue(index: Smallint); dispid 396;
    property EnableNullValue: WordBool dispid 439;
    property EnableMultipleValues: WordBool dispid 440;
    property DiscreteOrRangeKind: CRDiscreteOrRangeKind dispid 441;
    property PlaceInGroup: WordBool dispid 442;
    property GroupNumber: Smallint dispid 220;
    property EnableExclusiveGroup: WordBool dispid 443;
    property NumberOfCurrentValues: Smallint readonly dispid 444;
    property NumberOfCurrentRanges: Smallint readonly dispid 445;
    function GetNthCurrentValue(index: Smallint): OleVariant; dispid 446;
    procedure AddCurrentValue(CurrentValue: OleVariant); dispid 447;
    procedure GetNthCurrentRange(index: Smallint; out pStart: OleVariant; out pEnd: OleVariant; 
                                 out pRangeInfo: CRRangeInfo); dispid 448;
    procedure AddCurrentRange(start: OleVariant; end_: OleVariant; rangeInfo: CRRangeInfo); dispid 449;
    procedure ClearCurrentValueAndRange; dispid 450;
    property NthValueDescription[index: Smallint]: WideString dispid 466;
    property EnableShowDescriptionOnly: WordBool dispid 467;
    property PicklistSortMethod: CRParameterPicklistSortMethod dispid 468;
    property EnableSortBasedOnDesc: WordBool dispid 469;
  end;

// *********************************************************************//
// Interface: IGroupNameFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376820-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IGroupNameFieldDefinitions = interface(IDispatch)
    ['{AF376820-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IGroupNameFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IGroupNameFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IGroupNameFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376820-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IGroupNameFieldDefinitionsDisp = dispinterface
    ['{AF376820-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IGroupNameFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
  end;

// *********************************************************************//
// Interface: IGroupNameFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376813-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IGroupNameFieldDefinition = interface(IDispatch)
    ['{AF376813-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_GroupNameFieldName: WideString; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_GroupNumber: Smallint; safecall;
    function Get_GroupNameConditionFormula: WideString; safecall;
    procedure Set_GroupNameConditionFormula(const pVal: WideString); safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property GroupNameFieldName: WideString read Get_GroupNameFieldName;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property GroupNumber: Smallint read Get_GroupNumber;
    property GroupNameConditionFormula: WideString read Get_GroupNameConditionFormula write Set_GroupNameConditionFormula;
  end;

// *********************************************************************//
// DispIntf:  IGroupNameFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376813-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IGroupNameFieldDefinitionDisp = dispinterface
    ['{AF376813-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property GroupNameFieldName: WideString readonly dispid 190;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property GroupNumber: Smallint readonly dispid 220;
    property GroupNameConditionFormula: WideString dispid 760;
  end;

// *********************************************************************//
// Interface: ISummaryFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376821-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISummaryFieldDefinitions = interface(IDispatch)
    ['{AF376821-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): ISummaryFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    function Add(groupLevel: Integer; Field: OleVariant; SummaryType: CRSummaryType; 
                 secondSummaryFieldOrFactor: OleVariant): ISummaryFieldDefinition; safecall;
    procedure Delete(index: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: ISummaryFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ISummaryFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376821-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISummaryFieldDefinitionsDisp = dispinterface
    ['{AF376821-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: ISummaryFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    function Add(groupLevel: Integer; Field: OleVariant; SummaryType: CRSummaryType; 
                 secondSummaryFieldOrFactor: OleVariant): ISummaryFieldDefinition; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
  end;

// *********************************************************************//
// Interface: IPageEngine
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPageEngine = interface(IDispatch)
    ['{AF37682B-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_ImageOptions: CRImageType; safecall;
    procedure Set_ImageOptions(pImageOptions: CRImageType); safecall;
    function CreatePageGenerator(GroupPath: OleVariant; DrillDownLevel: OleVariant): IPageGenerator; safecall;
    function RenderTotallerETF(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                               pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                               resultType: CRRenderResultType): OleVariant; safecall;
    function RenderTotallerHTML(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                                pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                                openGroupPath: OleVariant; includeDrillDownLinks: WordBool; 
                                const baseURL: WideString; resultType: CRRenderResultType): OleVariant; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PlaceHolderOptions: CRPlaceHolderType; safecall;
    procedure Set_PlaceHolderOptions(pPlaceHolderType: CRPlaceHolderType); safecall;
    function Get_ValueFormatOptions: CRValueFormatType; safecall;
    procedure Set_ValueFormatOptions(pValueFormatType: CRValueFormatType); safecall;
    property ImageOptions: CRImageType read Get_ImageOptions write Set_ImageOptions;
    property Parent: IReport read Get_Parent;
    property PlaceHolderOptions: CRPlaceHolderType read Get_PlaceHolderOptions write Set_PlaceHolderOptions;
    property ValueFormatOptions: CRValueFormatType read Get_ValueFormatOptions write Set_ValueFormatOptions;
  end;

// *********************************************************************//
// DispIntf:  IPageEngineDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPageEngineDisp = dispinterface
    ['{AF37682B-6120-4E28-96DD-63FD2DC27B7A}']
    property ImageOptions: CRImageType dispid 244;
    function CreatePageGenerator(GroupPath: OleVariant; DrillDownLevel: OleVariant): IPageGenerator; dispid 245;
    function RenderTotallerETF(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                               pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                               resultType: CRRenderResultType): OleVariant; dispid 246;
    function RenderTotallerHTML(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                                pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                                openGroupPath: OleVariant; includeDrillDownLinks: WordBool; 
                                const baseURL: WideString; resultType: CRRenderResultType): OleVariant; dispid 247;
    property Parent: IReport readonly dispid 100;
    property PlaceHolderOptions: CRPlaceHolderType dispid 518;
    property ValueFormatOptions: CRValueFormatType dispid 546;
  end;

// *********************************************************************//
// Interface: IPageGenerator
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPageGenerator = interface(IDispatch)
    ['{AF37682C-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IPageEngine; safecall;
    function Get_Pages: IPages; safecall;
    function Get_DrillDownLevel: Smallint; safecall;
    function Get_GroupPath: OleVariant; safecall;
    function GetPageNumberForGroup(GroupPath: OleVariant): Integer; safecall;
    function DrillOnGraph(PageNumber: Integer; xOffset: Integer; yOffset: Integer): IPageGenerator; safecall;
    procedure SearchForText(const Text: WideString; direction: CRSearchDirection; 
                            out pPageNumber: Integer); safecall;
    function Get_GroupName: WideString; safecall;
    function Get_ReportName: WideString; safecall;
    function Get_ContainingPageNumber: Integer; safecall;
    function Get_ContainingGroupPath: OleVariant; safecall;
    function Get_ContainingGroupName: WideString; safecall;
    function Get_xOffset: Integer; safecall;
    function Get_yOffset: Integer; safecall;
    function RenderTotallerETF(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                               pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                               resultType: CRRenderResultType): OleVariant; safecall;
    function RenderTotallerHTML(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                                pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                                openGroupPath: OleVariant; includeDrillDownLinks: WordBool; 
                                const baseURL: WideString; resultType: CRRenderResultType): OleVariant; safecall;
    function DrillOnMap(PageNumber: Integer; xOffset: Integer; yOffset: Integer): IPageGenerator; safecall;
    function DrillOnSubreport(PageNumber: Integer; xOffset: Integer; yOffset: Integer): IPageGenerator; safecall;
    function Export(resultType: CRRenderResultType): OleVariant; safecall;
    function CreateSubreportPageGenerator(GroupPath: OleVariant; DrillDownLevel: OleVariant): IPageGenerator; safecall;
    function FindText(const Text: WideString; direction: CRSearchDirection; 
                      var pPageNumber: OleVariant): WordBool; safecall;
    property Parent: IPageEngine read Get_Parent;
    property Pages: IPages read Get_Pages;
    property DrillDownLevel: Smallint read Get_DrillDownLevel;
    property GroupPath: OleVariant read Get_GroupPath;
    property GroupName: WideString read Get_GroupName;
    property ReportName: WideString read Get_ReportName;
    property ContainingPageNumber: Integer read Get_ContainingPageNumber;
    property ContainingGroupPath: OleVariant read Get_ContainingGroupPath;
    property ContainingGroupName: WideString read Get_ContainingGroupName;
    property xOffset: Integer read Get_xOffset;
    property yOffset: Integer read Get_yOffset;
  end;

// *********************************************************************//
// DispIntf:  IPageGeneratorDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPageGeneratorDisp = dispinterface
    ['{AF37682C-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IPageEngine readonly dispid 100;
    property Pages: IPages readonly dispid 248;
    property DrillDownLevel: Smallint readonly dispid 249;
    property GroupPath: OleVariant readonly dispid 250;
    function GetPageNumberForGroup(GroupPath: OleVariant): Integer; dispid 251;
    function DrillOnGraph(PageNumber: Integer; xOffset: Integer; yOffset: Integer): IPageGenerator; dispid 252;
    procedure SearchForText(const Text: WideString; direction: CRSearchDirection; 
                            out pPageNumber: Integer); dispid 253;
    property GroupName: WideString readonly dispid 254;
    property ReportName: WideString readonly dispid 298;
    property ContainingPageNumber: Integer readonly dispid 451;
    property ContainingGroupPath: OleVariant readonly dispid 452;
    property ContainingGroupName: WideString readonly dispid 453;
    property xOffset: Integer readonly dispid 454;
    property yOffset: Integer readonly dispid 455;
    function RenderTotallerETF(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                               pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                               resultType: CRRenderResultType): OleVariant; dispid 246;
    function RenderTotallerHTML(rootGroupPath: OleVariant; startingChildNumber: Integer; 
                                pastRootLevels: Smallint; maxNodeCount: OleVariant; 
                                openGroupPath: OleVariant; includeDrillDownLinks: WordBool; 
                                const baseURL: WideString; resultType: CRRenderResultType): OleVariant; dispid 247;
    function DrillOnMap(PageNumber: Integer; xOffset: Integer; yOffset: Integer): IPageGenerator; dispid 456;
    function DrillOnSubreport(PageNumber: Integer; xOffset: Integer; yOffset: Integer): IPageGenerator; dispid 457;
    function Export(resultType: CRRenderResultType): OleVariant; dispid 259;
    function CreateSubreportPageGenerator(GroupPath: OleVariant; DrillDownLevel: OleVariant): IPageGenerator; dispid 459;
    function FindText(const Text: WideString; direction: CRSearchDirection; 
                      var pPageNumber: OleVariant): WordBool; dispid 547;
  end;

// *********************************************************************//
// Interface: IPages
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPages = interface(IDispatch)
    ['{AF37682D-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IPage; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IPageGenerator; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IPage read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IPageGenerator read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IPagesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPagesDisp = dispinterface
    ['{AF37682D-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IPage readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IPageGenerator readonly dispid 100;
  end;

// *********************************************************************//
// Interface: IPage
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPage = interface(IDispatch)
    ['{AF37682E-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IPageGenerator; safecall;
    function Get_PageNumber: Integer; safecall;
    function Get_IsLastPage: WordBool; safecall;
    function RenderEPF(resultType: CRRenderResultType): OleVariant; safecall;
    function RenderHTML(includeDrillDownLinks: WordBool; pageStyle: CRHTMLPageStyle; 
                        toolbarStyle: CRHTMLToolbarStyle; const baseURL: WideString; 
                        resultType: CRRenderResultType): OleVariant; safecall;
    function Get_IsMissingTotalPageCount: WordBool; safecall;
    property Parent: IPageGenerator read Get_Parent;
    property PageNumber: Integer read Get_PageNumber;
    property IsLastPage: WordBool read Get_IsLastPage;
    property IsMissingTotalPageCount: WordBool read Get_IsMissingTotalPageCount;
  end;

// *********************************************************************//
// DispIntf:  IPageDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPageDisp = dispinterface
    ['{AF37682E-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IPageGenerator readonly dispid 100;
    property PageNumber: Integer readonly dispid 255;
    property IsLastPage: WordBool readonly dispid 256;
    function RenderEPF(resultType: CRRenderResultType): OleVariant; dispid 257;
    function RenderHTML(includeDrillDownLinks: WordBool; pageStyle: CRHTMLPageStyle; 
                        toolbarStyle: CRHTMLToolbarStyle; const baseURL: WideString; 
                        resultType: CRRenderResultType): OleVariant; dispid 258;
    property IsMissingTotalPageCount: WordBool readonly dispid 519;
  end;

// *********************************************************************//
// Interface: IExportOptions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IExportOptions = interface(IDispatch)
    ['{AF37682F-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IReport; safecall;
    function Get_FormatType: CRExportFormatType; safecall;
    procedure Set_FormatType(pFormatType: CRExportFormatType); safecall;
    function Get_DestinationType: CRExportDestinationType; safecall;
    procedure Set_DestinationType(pDestinationType: CRExportDestinationType); safecall;
    function Get_ExchangeProfile: WideString; safecall;
    procedure Set_ExchangeProfile(const ppExchangeProfile: WideString); safecall;
    function Get_DiskFileName: WideString; safecall;
    procedure Set_DiskFileName(const ppDiskFileName: WideString); safecall;
    function Get_UseReportDateFormat: WordBool; safecall;
    procedure Set_UseReportDateFormat(pBool: WordBool); safecall;
    function Get_UseReportNumberFormat: WordBool; safecall;
    procedure Set_UseReportNumberFormat(pBool: WordBool); safecall;
    function Get_CharFieldDelimiter: WideString; safecall;
    procedure Set_CharFieldDelimiter(const ppCharFieldDelimiter: WideString); safecall;
    function Get_CharStringDelimiter: WideString; safecall;
    procedure Set_CharStringDelimiter(const ppCharStringDelimiter: WideString); safecall;
    function Get_NumberOfLinesPerPage: Smallint; safecall;
    procedure Set_NumberOfLinesPerPage(pNumberOfLinesPerPage: Smallint); safecall;
    function Get_ODBCDataSourceName: WideString; safecall;
    procedure Set_ODBCDataSourceName(const ppODBCDataSourceName: WideString); safecall;
    function Get_ODBCDataSourceUserID: WideString; safecall;
    procedure Set_ODBCDataSourceUserID(const ppODBCDataSourceUserID: WideString); safecall;
    procedure Set_ODBCDataSourcePassword(const Param1: WideString); safecall;
    function Get_ODBCExportTableName: WideString; safecall;
    procedure Set_ODBCExportTableName(const ppODBCExportTableName: WideString); safecall;
    function Get_HTMLFileName: WideString; safecall;
    procedure Set_HTMLFileName(const ppHTMLFileName: WideString); safecall;
    procedure Set_ExchangePassword(const Param1: WideString); safecall;
    function Get_ExchangeDestinationType: CRExchangeDestinationType; safecall;
    procedure Set_ExchangeDestinationType(pExchangeDestinationType: CRExchangeDestinationType); safecall;
    function Get_ExchangeFolderPath: WideString; safecall;
    procedure Set_ExchangeFolderPath(const ppExchangeFolderPath: WideString); safecall;
    function Get_MailCcList: WideString; safecall;
    procedure Set_MailCcList(const ppMailCcList: WideString); safecall;
    function Get_MailToList: WideString; safecall;
    procedure Set_MailToList(const ppMailToList: WideString); safecall;
    function Get_MailSubject: WideString; safecall;
    procedure Set_MailSubject(const ppMailSubject: WideString); safecall;
    function Get_MailMessage: WideString; safecall;
    procedure Set_MailMessage(const ppMailMessage: WideString); safecall;
    function Get_MailBccList: WideString; safecall;
    procedure Set_MailBccList(const ppMailBccList: WideString); safecall;
    function Get_FormatDllName: WideString; safecall;
    function Get_DestinationDllName: WideString; safecall;
    function Get_ExchangeTabHasColumnHeadings: WordBool; safecall;
    procedure Set_ExchangeTabHasColumnHeadings(pBool: WordBool); safecall;
    procedure Reset; safecall;
    procedure PromptForExportOptions; safecall;
    function Get_ExcelTabHasColumnHeadings: WordBool; safecall;
    procedure Set_ExcelTabHasColumnHeadings(pBool: WordBool); safecall;
    function Get_ExcelUseWorksheetFunctions: WordBool; safecall;
    procedure Set_ExcelUseWorksheetFunctions(pBool: WordBool); safecall;
    function Get_ExcelUseConstantColumnWidth: WordBool; safecall;
    procedure Set_ExcelUseConstantColumnWidth(pBool: WordBool); safecall;
    function Get_ExcelConstantColumnWidth: Double; safecall;
    procedure Set_ExcelConstantColumnWidth(pColWidth: Double); safecall;
    function Get_ExcelAreaType: CRAreaKind; safecall;
    procedure Set_ExcelAreaType(pAreaKind: CRAreaKind); safecall;
    function Get_ExcelAreaGroupNumber: Smallint; safecall;
    procedure Set_ExcelAreaGroupNumber(pGroupNumber: Smallint); safecall;
    function Get_ExcelUseTabularFormat: WordBool; safecall;
    procedure Set_ExcelUseTabularFormat(pBool: WordBool); safecall;
    function Get_ApplicationFileName: WideString; safecall;
    procedure Set_ApplicationFileName(const ppAppFileName: WideString); safecall;
    function Get_LotusDominoDatabaseName: WideString; safecall;
    procedure Set_LotusDominoDatabaseName(const ppLotusDominoDatabaseName: WideString); safecall;
    function Get_LotusDominoFormName: WideString; safecall;
    procedure Set_LotusDominoFormName(const ppLotusDominoFormName: WideString); safecall;
    function Get_LotusDominoComments: WideString; safecall;
    procedure Set_LotusDominoComments(const ppLotusDominoComments: WideString); safecall;
    function Get_HTMLEnableSeparatedPages: WordBool; safecall;
    procedure Set_HTMLEnableSeparatedPages(pBool: WordBool); safecall;
    function Get_HTMLHasPageNavigator: WordBool; safecall;
    procedure Set_HTMLHasPageNavigator(pBool: WordBool); safecall;
    function Get_PDFExportAllPages: WordBool; safecall;
    procedure Set_PDFExportAllPages(pBool: WordBool); safecall;
    function Get_PDFFirstPageNumber: Integer; safecall;
    procedure Set_PDFFirstPageNumber(pFirstPageNumber: Integer); safecall;
    function Get_PDFLastPageNumber: Integer; safecall;
    procedure Set_PDFLastPageNumber(pLastPageNumber: Integer); safecall;
    function Get_RTFExportAllPages: WordBool; safecall;
    procedure Set_RTFExportAllPages(pBool: WordBool); safecall;
    function Get_RTFFirstPageNumber: Integer; safecall;
    procedure Set_RTFFirstPageNumber(pFirstPageNumber: Integer); safecall;
    function Get_RTFLastPageNumber: Integer; safecall;
    procedure Set_RTFLastPageNumber(pLastPageNumber: Integer); safecall;
    function Get_XMLFileName: WideString; safecall;
    procedure Set_XMLFileName(const ppXMLFileName: WideString); safecall;
    function Get_XMLAllowMultipleFiles: WordBool; safecall;
    procedure Set_XMLAllowMultipleFiles(pBool: WordBool); safecall;
    function Get_WORDWExportAllPages: WordBool; safecall;
    procedure Set_WORDWExportAllPages(pBool: WordBool); safecall;
    function Get_WORDWFirstPageNumber: Integer; safecall;
    procedure Set_WORDWFirstPageNumber(pFirstPageNumber: Integer); safecall;
    function Get_WORDWLastPageNumber: Integer; safecall;
    procedure Set_WORDWLastPageNumber(pLastPageNumber: Integer); safecall;
    function Get_UseDefaultCharactersPerInch: WordBool; safecall;
    procedure Set_UseDefaultCharactersPerInch(pBool: WordBool); safecall;
    function Get_UserDefinedCharactersPerInch: Integer; safecall;
    procedure Set_UserDefinedCharactersPerInch(pUserDefinedCPI: Integer); safecall;
    procedure Set_ExcelPageBreaks(pBool: WordBool); safecall;
    function Get_ExcelPageBreaks: WordBool; safecall;
    procedure Set_ExcelConvertDateToString(pBool: WordBool); safecall;
    function Get_ExcelConvertDateToString: WordBool; safecall;
    function Get_ExcelExportAllPages: WordBool; safecall;
    procedure Set_ExcelExportAllPages(pBool: WordBool); safecall;
    function Get_ExcelFirstPageNumber: Integer; safecall;
    procedure Set_ExcelFirstPageNumber(pFirstPageNumber: Integer); safecall;
    function Get_ExcelLastPageNumber: Integer; safecall;
    procedure Set_ExcelLastPageNumber(pLastPageNumber: Integer); safecall;
    function Get_MailUserName: WideString; safecall;
    procedure Set_MailUserName(const ppUserName: WideString); safecall;
    function Get_MailPassword: WideString; safecall;
    procedure Set_MailPassword(const ppPassword: WideString); safecall;
    function Get_ExcelExportPageAreaPair: CRExcelExportPageAreaPair; safecall;
    procedure Set_ExcelExportPageAreaPair(exportPageAreaPair: CRExcelExportPageAreaPair); safecall;
    function Get_ExcelMaintainRelativeObjectPosition: WordBool; safecall;
    procedure Set_ExcelMaintainRelativeObjectPosition(pBool: WordBool); safecall;
    function Get_ExcelShowGridlines: WordBool; safecall;
    procedure Set_ExcelShowGridlines(pBool: WordBool); safecall;
    function Get_ExcelChopPageHeader: WordBool; safecall;
    procedure Set_ExcelChopPageHeader(pBool: WordBool); safecall;
    function Get_ExcelExportImagesInDataOnly: WordBool; safecall;
    procedure Set_ExcelExportImagesInDataOnly(pBool: WordBool); safecall;
    function Get_ExcelUseFormatInDataOnly: WordBool; safecall;
    procedure Set_ExcelUseFormatInDataOnly(pBool: WordBool); safecall;
    function Get_ExcelMaintainColumnAlignment: WordBool; safecall;
    procedure Set_ExcelMaintainColumnAlignment(pBool: WordBool); safecall;
    procedure Set_ExportPageBreaks(pBool: WordBool); safecall;
    function Get_ExportPageBreaks: WordBool; safecall;
    property Parent: IReport read Get_Parent;
    property FormatType: CRExportFormatType read Get_FormatType write Set_FormatType;
    property DestinationType: CRExportDestinationType read Get_DestinationType write Set_DestinationType;
    property ExchangeProfile: WideString read Get_ExchangeProfile write Set_ExchangeProfile;
    property DiskFileName: WideString read Get_DiskFileName write Set_DiskFileName;
    property UseReportDateFormat: WordBool read Get_UseReportDateFormat write Set_UseReportDateFormat;
    property UseReportNumberFormat: WordBool read Get_UseReportNumberFormat write Set_UseReportNumberFormat;
    property CharFieldDelimiter: WideString read Get_CharFieldDelimiter write Set_CharFieldDelimiter;
    property CharStringDelimiter: WideString read Get_CharStringDelimiter write Set_CharStringDelimiter;
    property NumberOfLinesPerPage: Smallint read Get_NumberOfLinesPerPage write Set_NumberOfLinesPerPage;
    property ODBCDataSourceName: WideString read Get_ODBCDataSourceName write Set_ODBCDataSourceName;
    property ODBCDataSourceUserID: WideString read Get_ODBCDataSourceUserID write Set_ODBCDataSourceUserID;
    property ODBCDataSourcePassword: WideString write Set_ODBCDataSourcePassword;
    property ODBCExportTableName: WideString read Get_ODBCExportTableName write Set_ODBCExportTableName;
    property HTMLFileName: WideString read Get_HTMLFileName write Set_HTMLFileName;
    property ExchangePassword: WideString write Set_ExchangePassword;
    property ExchangeDestinationType: CRExchangeDestinationType read Get_ExchangeDestinationType write Set_ExchangeDestinationType;
    property ExchangeFolderPath: WideString read Get_ExchangeFolderPath write Set_ExchangeFolderPath;
    property MailCcList: WideString read Get_MailCcList write Set_MailCcList;
    property MailToList: WideString read Get_MailToList write Set_MailToList;
    property MailSubject: WideString read Get_MailSubject write Set_MailSubject;
    property MailMessage: WideString read Get_MailMessage write Set_MailMessage;
    property MailBccList: WideString read Get_MailBccList write Set_MailBccList;
    property FormatDllName: WideString read Get_FormatDllName;
    property DestinationDllName: WideString read Get_DestinationDllName;
    property ExchangeTabHasColumnHeadings: WordBool read Get_ExchangeTabHasColumnHeadings write Set_ExchangeTabHasColumnHeadings;
    property ExcelTabHasColumnHeadings: WordBool read Get_ExcelTabHasColumnHeadings write Set_ExcelTabHasColumnHeadings;
    property ExcelUseWorksheetFunctions: WordBool read Get_ExcelUseWorksheetFunctions write Set_ExcelUseWorksheetFunctions;
    property ExcelUseConstantColumnWidth: WordBool read Get_ExcelUseConstantColumnWidth write Set_ExcelUseConstantColumnWidth;
    property ExcelConstantColumnWidth: Double read Get_ExcelConstantColumnWidth write Set_ExcelConstantColumnWidth;
    property ExcelAreaType: CRAreaKind read Get_ExcelAreaType write Set_ExcelAreaType;
    property ExcelAreaGroupNumber: Smallint read Get_ExcelAreaGroupNumber write Set_ExcelAreaGroupNumber;
    property ExcelUseTabularFormat: WordBool read Get_ExcelUseTabularFormat write Set_ExcelUseTabularFormat;
    property ApplicationFileName: WideString read Get_ApplicationFileName write Set_ApplicationFileName;
    property LotusDominoDatabaseName: WideString read Get_LotusDominoDatabaseName write Set_LotusDominoDatabaseName;
    property LotusDominoFormName: WideString read Get_LotusDominoFormName write Set_LotusDominoFormName;
    property LotusDominoComments: WideString read Get_LotusDominoComments write Set_LotusDominoComments;
    property HTMLEnableSeparatedPages: WordBool read Get_HTMLEnableSeparatedPages write Set_HTMLEnableSeparatedPages;
    property HTMLHasPageNavigator: WordBool read Get_HTMLHasPageNavigator write Set_HTMLHasPageNavigator;
    property PDFExportAllPages: WordBool read Get_PDFExportAllPages write Set_PDFExportAllPages;
    property PDFFirstPageNumber: Integer read Get_PDFFirstPageNumber write Set_PDFFirstPageNumber;
    property PDFLastPageNumber: Integer read Get_PDFLastPageNumber write Set_PDFLastPageNumber;
    property RTFExportAllPages: WordBool read Get_RTFExportAllPages write Set_RTFExportAllPages;
    property RTFFirstPageNumber: Integer read Get_RTFFirstPageNumber write Set_RTFFirstPageNumber;
    property RTFLastPageNumber: Integer read Get_RTFLastPageNumber write Set_RTFLastPageNumber;
    property XMLFileName: WideString read Get_XMLFileName write Set_XMLFileName;
    property XMLAllowMultipleFiles: WordBool read Get_XMLAllowMultipleFiles write Set_XMLAllowMultipleFiles;
    property WORDWExportAllPages: WordBool read Get_WORDWExportAllPages write Set_WORDWExportAllPages;
    property WORDWFirstPageNumber: Integer read Get_WORDWFirstPageNumber write Set_WORDWFirstPageNumber;
    property WORDWLastPageNumber: Integer read Get_WORDWLastPageNumber write Set_WORDWLastPageNumber;
    property UseDefaultCharactersPerInch: WordBool read Get_UseDefaultCharactersPerInch write Set_UseDefaultCharactersPerInch;
    property UserDefinedCharactersPerInch: Integer read Get_UserDefinedCharactersPerInch write Set_UserDefinedCharactersPerInch;
    property ExcelPageBreaks: WordBool read Get_ExcelPageBreaks write Set_ExcelPageBreaks;
    property ExcelConvertDateToString: WordBool read Get_ExcelConvertDateToString write Set_ExcelConvertDateToString;
    property ExcelExportAllPages: WordBool read Get_ExcelExportAllPages write Set_ExcelExportAllPages;
    property ExcelFirstPageNumber: Integer read Get_ExcelFirstPageNumber write Set_ExcelFirstPageNumber;
    property ExcelLastPageNumber: Integer read Get_ExcelLastPageNumber write Set_ExcelLastPageNumber;
    property MailUserName: WideString read Get_MailUserName write Set_MailUserName;
    property MailPassword: WideString read Get_MailPassword write Set_MailPassword;
    property ExcelExportPageAreaPair: CRExcelExportPageAreaPair read Get_ExcelExportPageAreaPair write Set_ExcelExportPageAreaPair;
    property ExcelMaintainRelativeObjectPosition: WordBool read Get_ExcelMaintainRelativeObjectPosition write Set_ExcelMaintainRelativeObjectPosition;
    property ExcelShowGridlines: WordBool read Get_ExcelShowGridlines write Set_ExcelShowGridlines;
    property ExcelChopPageHeader: WordBool read Get_ExcelChopPageHeader write Set_ExcelChopPageHeader;
    property ExcelExportImagesInDataOnly: WordBool read Get_ExcelExportImagesInDataOnly write Set_ExcelExportImagesInDataOnly;
    property ExcelUseFormatInDataOnly: WordBool read Get_ExcelUseFormatInDataOnly write Set_ExcelUseFormatInDataOnly;
    property ExcelMaintainColumnAlignment: WordBool read Get_ExcelMaintainColumnAlignment write Set_ExcelMaintainColumnAlignment;
    property ExportPageBreaks: WordBool read Get_ExportPageBreaks write Set_ExportPageBreaks;
  end;

// *********************************************************************//
// DispIntf:  IExportOptionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37682F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IExportOptionsDisp = dispinterface
    ['{AF37682F-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IReport readonly dispid 100;
    property FormatType: CRExportFormatType dispid 261;
    property DestinationType: CRExportDestinationType dispid 262;
    property ExchangeProfile: WideString dispid 263;
    property DiskFileName: WideString dispid 264;
    property UseReportDateFormat: WordBool dispid 265;
    property UseReportNumberFormat: WordBool dispid 266;
    property CharFieldDelimiter: WideString dispid 267;
    property CharStringDelimiter: WideString dispid 268;
    property NumberOfLinesPerPage: Smallint dispid 269;
    property ODBCDataSourceName: WideString dispid 270;
    property ODBCDataSourceUserID: WideString dispid 271;
    property ODBCDataSourcePassword: WideString writeonly dispid 272;
    property ODBCExportTableName: WideString dispid 273;
    property HTMLFileName: WideString dispid 274;
    property ExchangePassword: WideString writeonly dispid 275;
    property ExchangeDestinationType: CRExchangeDestinationType dispid 276;
    property ExchangeFolderPath: WideString dispid 277;
    property MailCcList: WideString dispid 278;
    property MailToList: WideString dispid 279;
    property MailSubject: WideString dispid 280;
    property MailMessage: WideString dispid 281;
    property MailBccList: WideString dispid 282;
    property FormatDllName: WideString readonly dispid 283;
    property DestinationDllName: WideString readonly dispid 284;
    property ExchangeTabHasColumnHeadings: WordBool dispid 285;
    procedure Reset; dispid 286;
    procedure PromptForExportOptions; dispid 287;
    property ExcelTabHasColumnHeadings: WordBool dispid 490;
    property ExcelUseWorksheetFunctions: WordBool dispid 491;
    property ExcelUseConstantColumnWidth: WordBool dispid 492;
    property ExcelConstantColumnWidth: Double dispid 493;
    property ExcelAreaType: CRAreaKind dispid 494;
    property ExcelAreaGroupNumber: Smallint dispid 495;
    property ExcelUseTabularFormat: WordBool dispid 496;
    property ApplicationFileName: WideString dispid 706;
    property LotusDominoDatabaseName: WideString dispid 707;
    property LotusDominoFormName: WideString dispid 708;
    property LotusDominoComments: WideString dispid 709;
    property HTMLEnableSeparatedPages: WordBool dispid 711;
    property HTMLHasPageNavigator: WordBool dispid 710;
    property PDFExportAllPages: WordBool dispid 734;
    property PDFFirstPageNumber: Integer dispid 735;
    property PDFLastPageNumber: Integer dispid 736;
    property RTFExportAllPages: WordBool dispid 737;
    property RTFFirstPageNumber: Integer dispid 738;
    property RTFLastPageNumber: Integer dispid 739;
    property XMLFileName: WideString dispid 740;
    property XMLAllowMultipleFiles: WordBool dispid 741;
    property WORDWExportAllPages: WordBool dispid 766;
    property WORDWFirstPageNumber: Integer dispid 767;
    property WORDWLastPageNumber: Integer dispid 768;
    property UseDefaultCharactersPerInch: WordBool dispid 780;
    property UserDefinedCharactersPerInch: Integer dispid 781;
    property ExcelPageBreaks: WordBool dispid 769;
    property ExcelConvertDateToString: WordBool dispid 770;
    property ExcelExportAllPages: WordBool dispid 771;
    property ExcelFirstPageNumber: Integer dispid 772;
    property ExcelLastPageNumber: Integer dispid 773;
    property MailUserName: WideString dispid 774;
    property MailPassword: WideString dispid 775;
    property ExcelExportPageAreaPair: CRExcelExportPageAreaPair dispid 792;
    property ExcelMaintainRelativeObjectPosition: WordBool dispid 793;
    property ExcelShowGridlines: WordBool dispid 794;
    property ExcelChopPageHeader: WordBool dispid 795;
    property ExcelExportImagesInDataOnly: WordBool dispid 796;
    property ExcelUseFormatInDataOnly: WordBool dispid 797;
    property ExcelMaintainColumnAlignment: WordBool dispid 798;
    property ExportPageBreaks: WordBool dispid 801;
  end;

// *********************************************************************//
// Interface: IApplication
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376830-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IApplication = interface(IDispatch)
    ['{AF376830-6120-4E28-96DD-63FD2DC27B7A}']
    function OpenReport(const pFileName: WideString; OpenMethod: OleVariant): IReport; safecall;
    function CanClose: WordBool; safecall;
    procedure LogOnServer(const pDllName: WideString; const pServerName: WideString; 
                          pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); safecall;
    procedure LogOffServer(const pDllName: WideString; const pServerName: WideString; 
                           pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); safecall;
    procedure SetMorePrintEngineErrorMessages(bl: WordBool); safecall;
    procedure SetMatchLogOnInfo(bl: WordBool); safecall;
    function NewReport: IReport; safecall;
    function GetVersion: Smallint; safecall;
    procedure LogOnServerEx(const pDllName: WideString; const pServerName: WideString; 
                            pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant; 
                            pServerType: OleVariant; pConnectionString: OleVariant); safecall;
    procedure LogOnServerWithPrivateInfo(const pDllName: WideString; privateInfo: OleVariant); safecall;
    function GetLicenseStatus(out pMaxLicenseNumber: OleVariant; out pLicenseUsed: OleVariant): WordBool; safecall;
    procedure SetLicenseKeycode(const pKeycode: WideString); safecall;
    procedure RunReportWizard(const pReport: IReport; dataSource: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IApplicationDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376830-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IApplicationDisp = dispinterface
    ['{AF376830-6120-4E28-96DD-63FD2DC27B7A}']
    function OpenReport(const pFileName: WideString; OpenMethod: OleVariant): IReport; dispid 288;
    function CanClose: WordBool; dispid 305;
    procedure LogOnServer(const pDllName: WideString; const pServerName: WideString; 
                          pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); dispid 228;
    procedure LogOffServer(const pDllName: WideString; const pServerName: WideString; 
                           pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant); dispid 229;
    procedure SetMorePrintEngineErrorMessages(bl: WordBool); dispid 344;
    procedure SetMatchLogOnInfo(bl: WordBool); dispid 345;
    function NewReport: IReport; dispid 461;
    function GetVersion: Smallint; dispid 470;
    procedure LogOnServerEx(const pDllName: WideString; const pServerName: WideString; 
                            pDatabaseName: OleVariant; pUserID: OleVariant; pPassword: OleVariant; 
                            pServerType: OleVariant; pConnectionString: OleVariant); dispid 545;
    procedure LogOnServerWithPrivateInfo(const pDllName: WideString; privateInfo: OleVariant); dispid 725;
    function GetLicenseStatus(out pMaxLicenseNumber: OleVariant; out pLicenseUsed: OleVariant): WordBool; dispid 733;
    procedure SetLicenseKeycode(const pKeycode: WideString); dispid 790;
    procedure RunReportWizard(const pReport: IReport; dataSource: OleVariant); dispid 900;
  end;

// *********************************************************************//
// Interface: ISortFields
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376831-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISortFields = interface(IDispatch)
    ['{AF376831-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): ISortField; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    procedure Add(const pFieldDefinition: IFieldDefinition; SortDirection: CRSortDirection); safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: ISortField read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ISortFieldsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376831-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISortFieldsDisp = dispinterface
    ['{AF376831-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: ISortField readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    procedure Add(const pFieldDefinition: IFieldDefinition; SortDirection: CRSortDirection); dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: ISortField
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376832-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISortField = interface(IDispatch)
    ['{AF376832-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IReport; safecall;
    function Get_SortDirection: CRSortDirection; safecall;
    procedure Set_SortDirection(pSortDirection: CRSortDirection); safecall;
    function Get_Field: IDispatch; safecall;
    procedure Set_Field(const ppField: IDispatch); safecall;
    property Parent: IReport read Get_Parent;
    property SortDirection: CRSortDirection read Get_SortDirection write Set_SortDirection;
    property Field: IDispatch read Get_Field write Set_Field;
  end;

// *********************************************************************//
// DispIntf:  ISortFieldDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376832-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISortFieldDisp = dispinterface
    ['{AF376832-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IReport readonly dispid 100;
    property SortDirection: CRSortDirection dispid 222;
    property Field: IDispatch dispid 119;
  end;

// *********************************************************************//
// Interface: IPrintingStatus
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376833-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPrintingStatus = interface(IDispatch)
    ['{AF376833-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IReport; safecall;
    function Get_NumberOfRecordRead: Integer; safecall;
    function Get_NumberOfRecordSelected: Integer; safecall;
    function Get_NumberOfRecordPrinted: Integer; safecall;
    function Get_Progress: CRPrintingProgress; safecall;
    function Get_NumberOfPages: Integer; safecall;
    property Parent: IReport read Get_Parent;
    property NumberOfRecordRead: Integer read Get_NumberOfRecordRead;
    property NumberOfRecordSelected: Integer read Get_NumberOfRecordSelected;
    property NumberOfRecordPrinted: Integer read Get_NumberOfRecordPrinted;
    property Progress: CRPrintingProgress read Get_Progress;
    property NumberOfPages: Integer read Get_NumberOfPages;
  end;

// *********************************************************************//
// DispIntf:  IPrintingStatusDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376833-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IPrintingStatusDisp = dispinterface
    ['{AF376833-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IReport readonly dispid 100;
    property NumberOfRecordRead: Integer readonly dispid 327;
    property NumberOfRecordSelected: Integer readonly dispid 328;
    property NumberOfRecordPrinted: Integer readonly dispid 329;
    property Progress: CRPrintingProgress readonly dispid 330;
    property NumberOfPages: Integer readonly dispid 398;
  end;

// *********************************************************************//
// Interface: IRunningTotalFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376822-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IRunningTotalFieldDefinitions = interface(IDispatch)
    ['{AF376822-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IRunningTotalFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    function Add(const runningTotalName: WideString): IRunningTotalFieldDefinition; safecall;
    procedure Delete(index: OleVariant); safecall;
    function GetItemByName(const Name: WideString): IRunningTotalFieldDefinition; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IRunningTotalFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IRunningTotalFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376822-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IRunningTotalFieldDefinitionsDisp = dispinterface
    ['{AF376822-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IRunningTotalFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    function Add(const runningTotalName: WideString): IRunningTotalFieldDefinition; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
    function GetItemByName(const Name: WideString): IRunningTotalFieldDefinition; dispid 750;
  end;

// *********************************************************************//
// Interface: IRunningTotalFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376816-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IRunningTotalFieldDefinition = interface(IDispatch)
    ['{AF376816-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_RunningTotalFieldName: WideString; safecall;
    function Get_SummarizedField: IDispatch; safecall;
    procedure SetSummarizedField(SummarizedField: OleVariant); safecall;
    function Get_SecondarySummarizedField: IDispatch; safecall;
    procedure SetSecondarySummarizedField(secondarySummariedField: OleVariant); safecall;
    function Get_SummaryOperationParameter: Integer; safecall;
    procedure Set_SummaryOperationParameter(pOperationParameter: Integer); safecall;
    function Get_SummaryType: CRSummaryType; safecall;
    procedure Set_SummaryType(pSummaryType: CRSummaryType); safecall;
    function Get_EvaluateCondition: CRRunningTotalCondition; safecall;
    procedure SetNoEvaluateCondition; safecall;
    function Get_ResetCondition: CRRunningTotalCondition; safecall;
    procedure SetNoResetCondition; safecall;
    function Get_EvaluateGroupNumber: Smallint; safecall;
    procedure Set_EvaluateGroupNumber(pEvaluateGroupNumber: Smallint); safecall;
    function Get_ResetGroupNumber: Smallint; safecall;
    procedure Set_ResetGroupNumber(pResetGroupNumber: Smallint); safecall;
    function Get_EvaluateConditionField: IDispatch; safecall;
    procedure SetEvaluateConditionField(pEvaluateConditionField: OleVariant); safecall;
    function Get_ResetConditionField: IDispatch; safecall;
    procedure SetResetConditionField(pResetConditionField: OleVariant); safecall;
    function Get_EvaluateConditionFormula: WideString; safecall;
    procedure Set_EvaluateConditionFormula(const ppText: WideString); safecall;
    function Get_ResetConditionFormula: WideString; safecall;
    procedure Set_ResetConditionFormula(const ppText: WideString); safecall;
    function Get_HierarchicalSummaryType: CRHierarchicalSummaryType; safecall;
    procedure Set_HierarchicalSummaryType(pHierarchicalType: CRHierarchicalSummaryType); safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property RunningTotalFieldName: WideString read Get_RunningTotalFieldName;
    property SummarizedField: IDispatch read Get_SummarizedField;
    property SecondarySummarizedField: IDispatch read Get_SecondarySummarizedField;
    property SummaryOperationParameter: Integer read Get_SummaryOperationParameter write Set_SummaryOperationParameter;
    property SummaryType: CRSummaryType read Get_SummaryType write Set_SummaryType;
    property EvaluateCondition: CRRunningTotalCondition read Get_EvaluateCondition;
    property ResetCondition: CRRunningTotalCondition read Get_ResetCondition;
    property EvaluateGroupNumber: Smallint read Get_EvaluateGroupNumber write Set_EvaluateGroupNumber;
    property ResetGroupNumber: Smallint read Get_ResetGroupNumber write Set_ResetGroupNumber;
    property EvaluateConditionField: IDispatch read Get_EvaluateConditionField;
    property ResetConditionField: IDispatch read Get_ResetConditionField;
    property EvaluateConditionFormula: WideString read Get_EvaluateConditionFormula write Set_EvaluateConditionFormula;
    property ResetConditionFormula: WideString read Get_ResetConditionFormula write Set_ResetConditionFormula;
    property HierarchicalSummaryType: CRHierarchicalSummaryType read Get_HierarchicalSummaryType write Set_HierarchicalSummaryType;
  end;

// *********************************************************************//
// DispIntf:  IRunningTotalFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376816-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IRunningTotalFieldDefinitionDisp = dispinterface
    ['{AF376816-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property RunningTotalFieldName: WideString readonly dispid 386;
    property SummarizedField: IDispatch readonly dispid 371;
    procedure SetSummarizedField(SummarizedField: OleVariant); dispid 700;
    property SecondarySummarizedField: IDispatch readonly dispid 663;
    procedure SetSecondarySummarizedField(secondarySummariedField: OleVariant); dispid 701;
    property SummaryOperationParameter: Integer dispid 664;
    property SummaryType: CRSummaryType dispid 206;
    property EvaluateCondition: CRRunningTotalCondition readonly dispid 666;
    procedure SetNoEvaluateCondition; dispid 541;
    property ResetCondition: CRRunningTotalCondition readonly dispid 667;
    procedure SetNoResetCondition; dispid 542;
    property EvaluateGroupNumber: Smallint dispid 668;
    property ResetGroupNumber: Smallint dispid 669;
    property EvaluateConditionField: IDispatch readonly dispid 670;
    procedure SetEvaluateConditionField(pEvaluateConditionField: OleVariant); dispid 702;
    property ResetConditionField: IDispatch readonly dispid 671;
    procedure SetResetConditionField(pResetConditionField: OleVariant); dispid 703;
    property EvaluateConditionFormula: WideString dispid 672;
    property ResetConditionFormula: WideString dispid 673;
    property HierarchicalSummaryType: CRHierarchicalSummaryType dispid 749;
  end;

// *********************************************************************//
// Interface: ISQLExpressionFieldDefinitions
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376823-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISQLExpressionFieldDefinitions = interface(IDispatch)
    ['{AF376823-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): ISQLExpressionFieldDefinition; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    function Add(const SQLExpressionName: WideString; const Text: WideString): ISQLExpressionFieldDefinition; safecall;
    procedure Delete(index: OleVariant); safecall;
    function GetItemByName(const Name: WideString): ISQLExpressionFieldDefinition; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: ISQLExpressionFieldDefinition read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  ISQLExpressionFieldDefinitionsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376823-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISQLExpressionFieldDefinitionsDisp = dispinterface
    ['{AF376823-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: ISQLExpressionFieldDefinition readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    function Add(const SQLExpressionName: WideString; const Text: WideString): ISQLExpressionFieldDefinition; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
    function GetItemByName(const Name: WideString): ISQLExpressionFieldDefinition; dispid 750;
  end;

// *********************************************************************//
// Interface: ISQLExpressionFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376817-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISQLExpressionFieldDefinition = interface(IDispatch)
    ['{AF376817-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    function Get_SQLExpressionFieldName: WideString; safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const ppText: WideString); safecall;
    procedure Check(out pBool: WordBool; out ppErrorString: WideString); safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
    property SQLExpressionFieldName: WideString read Get_SQLExpressionFieldName;
    property Text: WideString read Get_Text write Set_Text;
  end;

// *********************************************************************//
// DispIntf:  ISQLExpressionFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376817-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISQLExpressionFieldDefinitionDisp = dispinterface
    ['{AF376817-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
    property SQLExpressionFieldName: WideString readonly dispid 383;
    property Text: WideString dispid 157;
    procedure Check(out pBool: WordBool; out ppErrorString: WideString); dispid 384;
  end;

// *********************************************************************//
// Interface: IReportAlerts
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlerts = interface(IDispatch)
    ['{AF37685C-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: OleVariant): IReportAlert; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReport; safecall;
    function Add(const Name: WideString; const DefaultMessage: WideString; IsEnabled: WordBool; 
                 const ConditionFormula: WideString; const MessageFormula: WideString): IReportAlert; safecall;
    procedure Delete(index: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: OleVariant]: IReportAlert read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReport read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IReportAlertsDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlertsDisp = dispinterface
    ['{AF37685C-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: OleVariant]: IReportAlert readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReport readonly dispid 100;
    function Add(const Name: WideString; const DefaultMessage: WideString; IsEnabled: WordBool; 
                 const ConditionFormula: WideString; const MessageFormula: WideString): IReportAlert; dispid 230;
    procedure Delete(index: OleVariant); dispid 377;
  end;

// *********************************************************************//
// Interface: IReportAlert
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlert = interface(IDispatch)
    ['{AF37685B-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IReport; safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_DefaultMessage: WideString; safecall;
    procedure Set_DefaultMessage(const ppMessage: WideString); safecall;
    function Get_IsEnabled: WordBool; safecall;
    procedure Set_IsEnabled(pBool: WordBool); safecall;
    function Get_ConditionFormula: WideString; safecall;
    procedure Set_ConditionFormula(const ppText: WideString); safecall;
    function Get_MessageFormula: WideString; safecall;
    procedure Set_MessageFormula(const ppText: WideString); safecall;
    function Get_AlertInstances: IReportAlertInstances; safecall;
    property Parent: IReport read Get_Parent;
    property Name: WideString read Get_Name write Set_Name;
    property DefaultMessage: WideString read Get_DefaultMessage write Set_DefaultMessage;
    property IsEnabled: WordBool read Get_IsEnabled write Set_IsEnabled;
    property ConditionFormula: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property MessageFormula: WideString read Get_MessageFormula write Set_MessageFormula;
    property AlertInstances: IReportAlertInstances read Get_AlertInstances;
  end;

// *********************************************************************//
// DispIntf:  IReportAlertDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlertDisp = dispinterface
    ['{AF37685B-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IReport readonly dispid 100;
    property Name: WideString dispid -800;
    property DefaultMessage: WideString dispid 745;
    property IsEnabled: WordBool dispid 747;
    property ConditionFormula: WideString dispid 748;
    property MessageFormula: WideString dispid 744;
    property AlertInstances: IReportAlertInstances readonly dispid 743;
  end;

// *********************************************************************//
// Interface: IReportAlertInstances
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlertInstances = interface(IDispatch)
    ['{AF37685E-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IReportAlertInstance; safecall;
    function Get_Count: Integer; safecall;
    function Get_Parent: IReportAlert; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IReportAlertInstance read Get_Item; default;
    property Count: Integer read Get_Count;
    property Parent: IReportAlert read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IReportAlertInstancesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685E-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlertInstancesDisp = dispinterface
    ['{AF37685E-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IReportAlertInstance readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    property Parent: IReportAlert readonly dispid 100;
  end;

// *********************************************************************//
// Interface: IReportAlertInstance
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlertInstance = interface(IDispatch)
    ['{AF37685D-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Parent: IReportAlert; safecall;
    function Get_AlertMessage: WideString; safecall;
    property Parent: IReportAlert read Get_Parent;
    property AlertMessage: WideString read Get_AlertMessage;
  end;

// *********************************************************************//
// DispIntf:  IReportAlertInstanceDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685D-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportAlertInstanceDisp = dispinterface
    ['{AF37685D-6120-4E28-96DD-63FD2DC27B7A}']
    property Parent: IReportAlert readonly dispid 100;
    property AlertMessage: WideString readonly dispid 746;
  end;

// *********************************************************************//
// Interface: ICrystalReportProperties
// Flags:     (272) Hidden OleAutomation
// GUID:      {3DCC8FB5-C434-11D1-A817-00A0C92784CD}
// *********************************************************************//
  ICrystalReportProperties = interface(IUnknown)
    ['{3DCC8FB5-C434-11D1-A817-00A0C92784CD}']
    function GetTitle(out pVal: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceProperties
// Flags:     (272) Hidden OleAutomation
// GUID:      {6876D971-F0F2-11D1-BEDF-00A0C95A6A5C}
// *********************************************************************//
  ICrystalReportSourceProperties = interface(IUnknown)
    ['{6876D971-F0F2-11D1-BEDF-00A0C95A6A5C}']
    function GetImageType(out pVal: CRImageType): HResult; stdcall;
    function SupportsSelectionFormula(out pVal: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceProperties2
// Flags:     (272) Hidden OleAutomation
// GUID:      {B25F55D1-2313-11D2-BF21-00A0C95A6A5C}
// *********************************************************************//
  ICrystalReportSourceProperties2 = interface(ICrystalReportSourceProperties)
    ['{B25F55D1-2313-11D2-BF21-00A0C95A6A5C}']
    function SupportsExport(out pVal: WordBool): HResult; stdcall;
    function SupportsSearchExpert(out pVal: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceProperties3
// Flags:     (272) Hidden OleAutomation
// GUID:      {25A6CB81-5A76-11D3-BFC3-00A0C9DA4FA2}
// *********************************************************************//
  ICrystalReportSourceProperties3 = interface(ICrystalReportSourceProperties2)
    ['{25A6CB81-5A76-11D3-BFC3-00A0C9DA4FA2}']
    function SetContainer(const newVal: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceProperties4
// Flags:     (272) Hidden OleAutomation
// GUID:      {A9A6C0EE-956B-4C15-9B1C-B4255508B244}
// *********************************************************************//
  ICrystalReportSourceProperties4 = interface(ICrystalReportSourceProperties3)
    ['{A9A6C0EE-956B-4C15-9B1C-B4255508B244}']
    function SupportsExportInDrilldownViews(out pVal: WordBool): HResult; stdcall;
    function RequestSmartImageHandling(newVal: WordBool): HResult; stdcall;
    function SupportsExportPageRanges(out pVal: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportPrinterPort
// Flags:     (272) Hidden OleAutomation
// GUID:      {B4742013-45A6-11D1-ABEC-00A0C9274B91}
// *********************************************************************//
  ICrystalReportPrinterPort = interface(IUnknown)
    ['{B4742013-45A6-11D1-ABEC-00A0C9274B91}']
    function Print(const pBstrBranch: WideString; DrillDownLevel: Smallint): HResult; stdcall;
    function GetPrinterName(out ppPrinterName: WideString): HResult; stdcall;
    function GetDriverName(out ppDriverName: WideString): HResult; stdcall;
    function GetPortName(out ppPortName: WideString): HResult; stdcall;
    function GetPaperOrientation(out pPaperOrientation: CRPaperOrientation): HResult; stdcall;
    function GetPaperSize(out pPaperSize: CRPaperSize): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportPrinterPortEx
// Flags:     (400) Hidden NonExtensible OleAutomation
// GUID:      {B4742143-45A6-11D1-ABEC-00A0C9274B91}
// *********************************************************************//
  ICrystalReportPrinterPortEx = interface(IUnknown)
    ['{B4742143-45A6-11D1-ABEC-00A0C9274B91}']
    function Print(const pBstrBranch: WideString; DrillDownLevel: Smallint; 
                   const bstrSubreportContext: WideString): HResult; stdcall;
    function GetPrinterName(out ppPrinterName: WideString): HResult; stdcall;
    function GetDriverName(out ppDriverName: WideString): HResult; stdcall;
    function GetPortName(out ppPortName: WideString): HResult; stdcall;
    function GetPaperOrientation(out pPaperOrientation: CRPaperOrientation): HResult; stdcall;
    function GetPaperSize(out pPaperSize: CRPaperSize): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceEvents
// Flags:     (272) Hidden OleAutomation
// GUID:      {3DCC8FB3-C434-11D1-A817-00A0C92784CD}
// *********************************************************************//
  ICrystalReportSourceEvents = interface(IUnknown)
    ['{3DCC8FB3-C434-11D1-A817-00A0C92784CD}']
    function OnStartBinding(dwReserved: Integer): HResult; stdcall;
    function OnStopBinding(hrStatus: HResult; const bstrStatusText: WideString): HResult; stdcall;
    function OnDataAvailable(vtDataDescription: OleVariant; vtData: OleVariant; vtParam: OleVariant): HResult; stdcall;
    function OnProgress(ulProgress: Integer; ulProgressMax: Integer; ulStatusCode: Integer; 
                        const szStatusText: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  IReportEvent
// Flags:     (4112) Hidden Dispatchable
// GUID:      {AF376802-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IReportEvent = dispinterface
    ['{AF376802-6120-4E28-96DD-63FD2DC27B7A}']
    procedure NoData(var pCancel: WordBool); dispid 1;
    procedure BeforeFormatPage(PageNumber: Integer); dispid 2;
    procedure AfterFormatPage(PageNumber: Integer); dispid 3;
    procedure FieldMapping(var reportFieldArray: OleVariant; databaseFieldArray: OleVariant; 
                           var useDefault: WordBool); dispid 484;
  end;

// *********************************************************************//
// Interface: ICrystalReportExport
// Flags:     (400) Hidden NonExtensible OleAutomation
// GUID:      {BD10A9C0-07CC-11D2-BEFF-00A0C95A6A5C}
// *********************************************************************//
  ICrystalReportExport = interface(IUnknown)
    ['{BD10A9C0-07CC-11D2-BEFF-00A0C95A6A5C}']
    function SetReportSource(const pNewVal: IUnknown): HResult; stdcall;
    function Export(hWnd: OLE_HANDLE; const pBstrBranch: WideString; 
                    const bstrSubreportContext: WideString; const pBstrFormula: WideString; 
                    vtPromptingInfo: OleVariant): HResult; stdcall;
    function GetFileName(out ppVal: WideString): HResult; stdcall;
    function SetFileName(const pNewVal: WideString): HResult; stdcall;
    function GetExportType(out format: OleVariant; out reserved: OleVariant): HResult; stdcall;
    function SetExportType(format: OleVariant; reserved: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportExportEvents
// Flags:     (400) Hidden NonExtensible OleAutomation
// GUID:      {4D773761-0AD4-11D2-BF01-00A0C95A6A5C}
// *********************************************************************//
  ICrystalReportExportEvents = interface(IUnknown)
    ['{4D773761-0AD4-11D2-BF01-00A0C95A6A5C}']
    function ExportCancelled: HResult; stdcall;
    function ExportFailed: HResult; stdcall;
    function ExportComplete(const pFileName: WideString; const pFileType: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// DispIntf:  ISectionEvent
// Flags:     (4112) Hidden Dispatchable
// GUID:      {AF37684B-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISectionEvent = dispinterface
    ['{AF37684B-6120-4E28-96DD-63FD2DC27B7A}']
    procedure format(const pFormattingInfo: IDispatch); dispid 1;
  end;

// *********************************************************************//
// Interface: ISpecialVarFieldDefinition
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376814-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISpecialVarFieldDefinition = interface(IDispatch)
    ['{AF376814-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Kind: CRFieldKind; safecall;
    function Get_ValueType: CRFieldValueType; safecall;
    function Get_NumberOfBytes: Smallint; safecall;
    function Get_Name: WideString; safecall;
    function Get_Value: OleVariant; safecall;
    function Get_specialVarType: CRSpecialVarType; safecall;
    function Get_Parent: IReport; safecall;
    function Get_PreviousValue: OleVariant; safecall;
    function Get_NextValue: OleVariant; safecall;
    property Kind: CRFieldKind read Get_Kind;
    property ValueType: CRFieldValueType read Get_ValueType;
    property NumberOfBytes: Smallint read Get_NumberOfBytes;
    property Name: WideString read Get_Name;
    property Value: OleVariant read Get_Value;
    property specialVarType: CRSpecialVarType read Get_specialVarType;
    property Parent: IReport read Get_Parent;
    property PreviousValue: OleVariant read Get_PreviousValue;
    property NextValue: OleVariant read Get_NextValue;
  end;

// *********************************************************************//
// DispIntf:  ISpecialVarFieldDefinitionDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376814-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  ISpecialVarFieldDefinitionDisp = dispinterface
    ['{AF376814-6120-4E28-96DD-63FD2DC27B7A}']
    property Kind: CRFieldKind readonly dispid 101;
    property ValueType: CRFieldValueType readonly dispid 162;
    property NumberOfBytes: Smallint readonly dispid 163;
    property Name: WideString readonly dispid -800;
    property Value: OleVariant readonly dispid 121;
    property specialVarType: CRSpecialVarType readonly dispid 205;
    property Parent: IReport readonly dispid 100;
    property PreviousValue: OleVariant readonly dispid 290;
    property NextValue: OleVariant readonly dispid 291;
  end;

// *********************************************************************//
// Interface: IMapObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376825-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IMapObject = interface(IDispatch)
    ['{AF376825-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    procedure Set_Width(pWidth: Integer); safecall;
    function Get_Height: Integer; safecall;
    procedure Set_Height(pHeight: Integer); safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    function Get_CssClass: WideString; safecall;
    procedure Set_CssClass(const ppCssClass: WideString); safecall;
    function Get_HyperlinkType: CRHyperlinkType; safecall;
    procedure Set_HyperlinkType(pType: CRHyperlinkType); safecall;
    function Get_HyperlinkText: WideString; safecall;
    procedure Set_HyperlinkText(const pText: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width write Set_Width;
    property Height: Integer read Get_Height write Set_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
    property CssClass: WideString read Get_CssClass write Set_CssClass;
    property HyperlinkType: CRHyperlinkType read Get_HyperlinkType write Set_HyperlinkType;
    property HyperlinkText: WideString read Get_HyperlinkText write Set_HyperlinkText;
  end;

// *********************************************************************//
// DispIntf:  IMapObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376825-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IMapObjectDisp = dispinterface
    ['{AF376825-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer dispid 104;
    property Height: Integer dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
    property CssClass: WideString dispid 549;
    property HyperlinkType: CRHyperlinkType dispid 901;
    property HyperlinkText: WideString dispid 902;
  end;

// *********************************************************************//
// Interface: IOlapGridObject
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IOlapGridObject = interface(IDispatch)
    ['{AF37685F-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const ppName: WideString); safecall;
    function Get_Kind: CRObjectKind; safecall;
    function Get_Left: Integer; safecall;
    procedure Set_Left(pLeft: Integer); safecall;
    function Get_Top: Integer; safecall;
    procedure Set_Top(pTop: Integer); safecall;
    function Get_Width: Integer; safecall;
    function Get_Height: Integer; safecall;
    function Get_LeftLineStyle: CRLineStyle; safecall;
    procedure Set_LeftLineStyle(pLeftLineStyle: CRLineStyle); safecall;
    function Get_RightLineStyle: CRLineStyle; safecall;
    procedure Set_RightLineStyle(pRightLineStyle: CRLineStyle); safecall;
    function Get_TopLineStyle: CRLineStyle; safecall;
    procedure Set_TopLineStyle(pTopLineStyle: CRLineStyle); safecall;
    function Get_BottomLineStyle: CRLineStyle; safecall;
    procedure Set_BottomLineStyle(pBottomLineStyle: CRLineStyle); safecall;
    function Get_HasDropShadow: WordBool; safecall;
    procedure Set_HasDropShadow(pBool: WordBool); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_BackColor(pBackColor: OLE_COLOR); safecall;
    function Get_BorderColor: OLE_COLOR; safecall;
    procedure Set_BorderColor(pBorderColor: OLE_COLOR); safecall;
    function Get_Parent: ISection; safecall;
    function Get_Suppress: WordBool; safecall;
    procedure Set_Suppress(pBool: WordBool); safecall;
    function Get_CloseAtPageBreak: WordBool; safecall;
    procedure Set_CloseAtPageBreak(pBool: WordBool); safecall;
    function Get_KeepTogether: WordBool; safecall;
    procedure Set_KeepTogether(pBool: WordBool); safecall;
    function Get_ConditionFormula(FormulaType: OleVariant): WideString; safecall;
    procedure Set_ConditionFormula(FormulaType: OleVariant; const pVal: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Kind: CRObjectKind read Get_Kind;
    property Left: Integer read Get_Left write Set_Left;
    property Top: Integer read Get_Top write Set_Top;
    property Width: Integer read Get_Width;
    property Height: Integer read Get_Height;
    property LeftLineStyle: CRLineStyle read Get_LeftLineStyle write Set_LeftLineStyle;
    property RightLineStyle: CRLineStyle read Get_RightLineStyle write Set_RightLineStyle;
    property TopLineStyle: CRLineStyle read Get_TopLineStyle write Set_TopLineStyle;
    property BottomLineStyle: CRLineStyle read Get_BottomLineStyle write Set_BottomLineStyle;
    property HasDropShadow: WordBool read Get_HasDropShadow write Set_HasDropShadow;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property BorderColor: OLE_COLOR read Get_BorderColor write Set_BorderColor;
    property Parent: ISection read Get_Parent;
    property Suppress: WordBool read Get_Suppress write Set_Suppress;
    property CloseAtPageBreak: WordBool read Get_CloseAtPageBreak write Set_CloseAtPageBreak;
    property KeepTogether: WordBool read Get_KeepTogether write Set_KeepTogether;
    property ConditionFormula[FormulaType: OleVariant]: WideString read Get_ConditionFormula write Set_ConditionFormula;
  end;

// *********************************************************************//
// DispIntf:  IOlapGridObjectDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685F-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IOlapGridObjectDisp = dispinterface
    ['{AF37685F-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid -800;
    property Kind: CRObjectKind readonly dispid 101;
    property Left: Integer dispid 102;
    property Top: Integer dispid 103;
    property Width: Integer readonly dispid 104;
    property Height: Integer readonly dispid 105;
    property LeftLineStyle: CRLineStyle dispid 106;
    property RightLineStyle: CRLineStyle dispid 107;
    property TopLineStyle: CRLineStyle dispid 108;
    property BottomLineStyle: CRLineStyle dispid 109;
    property HasDropShadow: WordBool dispid 111;
    property BackColor: OLE_COLOR dispid 112;
    property BorderColor: OLE_COLOR dispid 113;
    property Parent: ISection readonly dispid 100;
    property Suppress: WordBool dispid 114;
    property CloseAtPageBreak: WordBool dispid 115;
    property KeepTogether: WordBool dispid 116;
    property ConditionFormula[FormulaType: OleVariant]: WideString dispid 760;
  end;

// *********************************************************************//
// Interface: IFormattingInfo
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF37684C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFormattingInfo = interface(IDispatch)
    ['{AF37684C-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_IsRepeatedGroupHeader: WordBool; safecall;
    function Get_IsStartOfGroup: WordBool; safecall;
    function Get_IsEndOfGroup: WordBool; safecall;
    property IsRepeatedGroupHeader: WordBool read Get_IsRepeatedGroupHeader;
    property IsStartOfGroup: WordBool read Get_IsStartOfGroup;
    property IsEndOfGroup: WordBool read Get_IsEndOfGroup;
  end;

// *********************************************************************//
// DispIntf:  IFormattingInfoDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AF37684C-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFormattingInfoDisp = dispinterface
    ['{AF37684C-6120-4E28-96DD-63FD2DC27B7A}']
    property IsRepeatedGroupHeader: WordBool readonly dispid 321;
    property IsStartOfGroup: WordBool readonly dispid 294;
    property IsEndOfGroup: WordBool readonly dispid 295;
  end;

// *********************************************************************//
// Interface: IFieldMappingData
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376856-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldMappingData = interface(IDispatch)
    ['{AF376856-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_ValueType: CRFieldValueType; safecall;
    procedure Set_ValueType(pValueType: CRFieldValueType); safecall;
    function Get_TableName: WideString; safecall;
    procedure Set_TableName(const pTableName: WideString); safecall;
    function Get_FieldName: WideString; safecall;
    procedure Set_FieldName(const pFieldName: WideString); safecall;
    function Get_MappingToFieldIndex: Smallint; safecall;
    procedure Set_MappingToFieldIndex(pMappingTo: Smallint); safecall;
    property ValueType: CRFieldValueType read Get_ValueType write Set_ValueType;
    property TableName: WideString read Get_TableName write Set_TableName;
    property FieldName: WideString read Get_FieldName write Set_FieldName;
    property MappingToFieldIndex: Smallint read Get_MappingToFieldIndex write Set_MappingToFieldIndex;
  end;

// *********************************************************************//
// DispIntf:  IFieldMappingDataDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376856-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IFieldMappingDataDisp = dispinterface
    ['{AF376856-6120-4E28-96DD-63FD2DC27B7A}']
    property ValueType: CRFieldValueType dispid 486;
    property TableName: WideString dispid 487;
    property FieldName: WideString dispid 488;
    property MappingToFieldIndex: Smallint dispid 489;
  end;

// *********************************************************************//
// Interface: IParameterValue
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376857-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValue = interface(IDispatch)
    ['{AF376857-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_StartValue: OleVariant; safecall;
    procedure Set_StartValue(StartValue: OleVariant); safecall;
    function Get_EndValue: OleVariant; safecall;
    procedure Set_EndValue(EndValue: OleVariant); safecall;
    function Get_RangeValue: WordBool; safecall;
    procedure Set_RangeValue(pBool: WordBool); safecall;
    function Get_rangeInfo: CRRangeInfo; safecall;
    procedure Set_rangeInfo(rangeInfo: CRRangeInfo); safecall;
    property StartValue: OleVariant read Get_StartValue write Set_StartValue;
    property EndValue: OleVariant read Get_EndValue write Set_EndValue;
    property RangeValue: WordBool read Get_RangeValue write Set_RangeValue;
    property rangeInfo: CRRangeInfo read Get_rangeInfo write Set_rangeInfo;
  end;

// *********************************************************************//
// DispIntf:  IParameterValueDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376857-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValueDisp = dispinterface
    ['{AF376857-6120-4E28-96DD-63FD2DC27B7A}']
    property StartValue: OleVariant dispid 732;
    property EndValue: OleVariant dispid 726;
    property RangeValue: WordBool dispid 727;
    property rangeInfo: CRRangeInfo dispid 728;
  end;

// *********************************************************************//
// Interface: IParameterValues
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376858-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValues = interface(IDispatch)
    ['{AF376858-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IParameterValue; safecall;
    function Get_Count: Integer; safecall;
    procedure Add(const pValue: IParameterValue); safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IParameterValue read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IParameterValuesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376858-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValuesDisp = dispinterface
    ['{AF376858-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IParameterValue readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    procedure Add(const pValue: IParameterValue); dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: IParameterValueInfo
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376859-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValueInfo = interface(IDispatch)
    ['{AF376859-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_ParameterValues: IParameterValues; safecall;
    procedure Set_ParameterValues(const ppValues: IParameterValues); safecall;
    function Get_parameterName: WideString; safecall;
    procedure Set_parameterName(const pParameterName: WideString); safecall;
    property ParameterValues: IParameterValues read Get_ParameterValues write Set_ParameterValues;
    property parameterName: WideString read Get_parameterName write Set_parameterName;
  end;

// *********************************************************************//
// DispIntf:  IParameterValueInfoDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376859-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValueInfoDisp = dispinterface
    ['{AF376859-6120-4E28-96DD-63FD2DC27B7A}']
    property ParameterValues: IParameterValues dispid 729;
    property parameterName: WideString dispid 730;
  end;

// *********************************************************************//
// Interface: IParameterValueInfos
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValueInfos = interface(IDispatch)
    ['{AF37685A-6120-4E28-96DD-63FD2DC27B7A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Item(index: Integer): IParameterValueInfo; safecall;
    function Get_Count: Integer; safecall;
    procedure Add(const pValueInfo: IParameterValueInfo); safecall;
    procedure Delete(index: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Item[index: Integer]: IParameterValueInfo read Get_Item; default;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IParameterValueInfosDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF37685A-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IParameterValueInfosDisp = dispinterface
    ['{AF37685A-6120-4E28-96DD-63FD2DC27B7A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Item[index: Integer]: IParameterValueInfo readonly dispid 0; default;
    property Count: Integer readonly dispid 161;
    procedure Add(const pValueInfo: IParameterValueInfo); dispid 230;
    procedure Delete(index: Integer); dispid 377;
  end;

// *********************************************************************//
// Interface: IConnectionProperty
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376861-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IConnectionProperty = interface(IDispatch)
    ['{AF376861-6120-4E28-96DD-63FD2DC27B7A}']
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pName: WideString); safecall;
    function Get_LocalizedName: WideString; safecall;
    procedure Set_LocalizedName(const pLocName: WideString); safecall;
    function Get_Description: WideString; safecall;
    procedure Set_Description(const pDescription: WideString); safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pValue: OleVariant); safecall;
    function Get_ChildProperties: INameValuePairs; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property LocalizedName: WideString read Get_LocalizedName write Set_LocalizedName;
    property Description: WideString read Get_Description write Set_Description;
    property Value: OleVariant read Get_Value write Set_Value;
    property ChildProperties: INameValuePairs read Get_ChildProperties;
  end;

// *********************************************************************//
// DispIntf:  IConnectionPropertyDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {AF376861-6120-4E28-96DD-63FD2DC27B7A}
// *********************************************************************//
  IConnectionPropertyDisp = dispinterface
    ['{AF376861-6120-4E28-96DD-63FD2DC27B7A}']
    property Name: WideString dispid 784;
    property LocalizedName: WideString dispid 785;
    property Description: WideString dispid 786;
    property Value: OleVariant dispid 0;
    property ChildProperties: INameValuePairs readonly dispid 788;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceEx
// Flags:     (272) Hidden OleAutomation
// GUID:      {3DCC8FB6-C434-11D1-A817-00A0C92784CD}
// *********************************************************************//
  ICrystalReportSourceEx = interface(IUnknown)
    ['{3DCC8FB6-C434-11D1-A817-00A0C92784CD}']
    function GetPage(lCookie: Integer; const bstrViewContext: WideString; 
                     const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                     vtPromptingInfo: OleVariant; lPageNumber: Integer; vtReserved: OleVariant): HResult; stdcall;
    function GetTotaller(lCookie: Integer; const bstrViewContext: WideString; 
                         const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                         vtPromptingInfo: OleVariant; lStartFrom: Integer; 
                         nLevelsPastRoot: Smallint; vtMaxNodeCount: OleVariant): HResult; stdcall;
    function GetLastPageNumber(lCookie: Integer; const bstrViewContext: WideString; 
                               const bstrSubreportContext: WideString; 
                               const bstrFormula: WideString; vtPromptingInfo: OleVariant; 
                               vtReserved: OleVariant): HResult; stdcall;
    function FindGroup(lCookie: Integer; const bstrViewContext: WideString; 
                       const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                       vtPromptingInfo: OleVariant; const bstrGroupPath: WideString; 
                       vtReserved: OleVariant): HResult; stdcall;
    function FindText(lCookie: Integer; const bstrViewContext: WideString; 
                      const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                      vtPromptingInfo: OleVariant; lFromPage: Integer; lFromInstance: Integer; 
                      const bstrText: WideString; nMode: CRSearchDirection; vtReserved: OleVariant): HResult; stdcall;
    function DrillGraph(lCookie: Integer; const bstrViewContext: WideString; 
                        const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                        vtPromptingInfo: OleVariant; lPageNumber: Integer; xOffset: Integer; 
                        yOffset: Integer; const bstrReserved: WideString; vtReserved: OleVariant; 
                        vtReserved2: OleVariant): HResult; stdcall;
    function DrillMap(lCookie: Integer; const bstrViewContext: WideString; 
                      const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                      vtPromptingInfo: OleVariant; lPageNumber: Integer; xOffset: Integer; 
                      yOffset: Integer; const bstrReserved: WideString; vtReserved: OleVariant; 
                      vtReserved2: OleVariant): HResult; stdcall;
    function Search(lCookie: Integer; const bstrViewContext: WideString; 
                    const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                    vtPromptingInfo: OleVariant; lPageN: Integer; lSectionInstN: Integer; 
                    const bstrSearchFormula: WideString; const bstrReserved: WideString; 
                    vtReserved: OleVariant): HResult; stdcall;
    function Export(lCookie: Integer; const bstrViewContext: WideString; 
                    const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                    vtPromptingInfo: OleVariant; exportFormat: OleVariant; pageRange: OleVariant): HResult; stdcall;
    function GetExportFormats(lCookie: Integer): HResult; stdcall;
    function Refresh(lCookie: Integer; vtPromptingInfo: OleVariant): HResult; stdcall;
    function Cancel(lCookie: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrystalReportSourceEx2
// Flags:     (400) Hidden NonExtensible OleAutomation
// GUID:      {B4742163-45A6-11D1-ABEC-00A0C9274B91}
// *********************************************************************//
  ICrystalReportSourceEx2 = interface(IUnknown)
    ['{B4742163-45A6-11D1-ABEC-00A0C9274B91}']
    function GetPage(lCookie: Integer; const bstrViewContext: WideString; 
                     const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                     vtPromptingInfo: OleVariant; lPageNumber: Integer; vtReserved: OleVariant): HResult; stdcall;
    function GetTotaller(lCookie: Integer; const bstrViewContext: WideString; 
                         const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                         vtPromptingInfo: OleVariant; lStartFrom: Integer; 
                         nLevelsPastRoot: Smallint; vtMaxNodeCount: OleVariant): HResult; stdcall;
    function GetLastPageNumber(lCookie: Integer; const bstrViewContext: WideString; 
                               const bstrSubreportContext: WideString; 
                               const bstrFormula: WideString; vtPromptingInfo: OleVariant; 
                               vtReserved: OleVariant): HResult; stdcall;
    function FindGroup(lCookie: Integer; const bstrViewContext: WideString; 
                       const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                       vtPromptingInfo: OleVariant; const bstrGroupPath: WideString; 
                       vtReserved: OleVariant): HResult; stdcall;
    function FindText(lCookie: Integer; const bstrViewContext: WideString; 
                      const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                      vtPromptingInfo: OleVariant; lFromPage: Integer; lFromInstance: Integer; 
                      const bstrText: WideString; nMode: CRSearchDirection; vtReserved: OleVariant): HResult; stdcall;
    function DrillGraph(lCookie: Integer; const bstrViewContext: WideString; 
                        const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                        vtPromptingInfo: OleVariant; lPageNumber: Integer; xOffset: Integer; 
                        yOffset: Integer; const bstrReserved: WideString; vtReserved: OleVariant; 
                        vtReserved2: OleVariant): HResult; stdcall;
    function DrillMap(lCookie: Integer; const bstrViewContext: WideString; 
                      const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                      vtPromptingInfo: OleVariant; lPageNumber: Integer; xOffset: Integer; 
                      yOffset: Integer; const bstrReserved: WideString; vtReserved: OleVariant; 
                      vtReserved2: OleVariant): HResult; stdcall;
    function Search(lCookie: Integer; const bstrViewContext: WideString; 
                    const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                    vtPromptingInfo: OleVariant; lPageN: Integer; lSectionInstN: Integer; 
                    const bstrSearchFormula: WideString; const bstrReserved: WideString; 
                    vtReserved: OleVariant): HResult; stdcall;
    function Export(lCookie: Integer; const bstrViewContext: WideString; 
                    const bstrSubreportContext: WideString; const bstrFormula: WideString; 
                    vtPromptingInfo: OleVariant; exportFormat: OleVariant; pageRange: OleVariant): HResult; stdcall;
    function GetExportFormats(lCookie: Integer): HResult; stdcall;
    function Refresh(lCookie: Integer; vtPromptingInfo: OleVariant): HResult; stdcall;
    function Cancel(lCookie: Integer): HResult; stdcall;
    function Update(lCookie: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoReport provides a Create and CreateRemote method to          
// create instances of the default interface IReport exposed by              
// the CoClass Report. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReport = class
    class function Create: IReport;
    class function CreateRemote(const MachineName: string): IReport;
  end;

// *********************************************************************//
// The Class CoAreas provides a Create and CreateRemote method to          
// create instances of the default interface IAreas exposed by              
// the CoClass Areas. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAreas = class
    class function Create: IAreas;
    class function CreateRemote(const MachineName: string): IAreas;
  end;

// *********************************************************************//
// The Class CoSections provides a Create and CreateRemote method to          
// create instances of the default interface ISections exposed by              
// the CoClass Sections. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSections = class
    class function Create: ISections;
    class function CreateRemote(const MachineName: string): ISections;
  end;

// *********************************************************************//
// The Class CoArea provides a Create and CreateRemote method to          
// create instances of the default interface IArea exposed by              
// the CoClass Area. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoArea = class
    class function Create: IArea;
    class function CreateRemote(const MachineName: string): IArea;
  end;

// *********************************************************************//
// The Class CoSection provides a Create and CreateRemote method to          
// create instances of the default interface ISection exposed by              
// the CoClass Section. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSection = class
    class function Create: ISection;
    class function CreateRemote(const MachineName: string): ISection;
  end;

// *********************************************************************//
// The Class CoReportObjects provides a Create and CreateRemote method to          
// create instances of the default interface IReportObjects exposed by              
// the CoClass ReportObjects. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReportObjects = class
    class function Create: IReportObjects;
    class function CreateRemote(const MachineName: string): IReportObjects;
  end;

// *********************************************************************//
// The Class CoFieldObject provides a Create and CreateRemote method to          
// create instances of the default interface IFieldObject exposed by              
// the CoClass FieldObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFieldObject = class
    class function Create: IFieldObject;
    class function CreateRemote(const MachineName: string): IFieldObject;
  end;

// *********************************************************************//
// The Class CoTextObject provides a Create and CreateRemote method to          
// create instances of the default interface ITextObject exposed by              
// the CoClass TextObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTextObject = class
    class function Create: ITextObject;
    class function CreateRemote(const MachineName: string): ITextObject;
  end;

// *********************************************************************//
// The Class CoSubreportObject provides a Create and CreateRemote method to          
// create instances of the default interface ISubreportObject exposed by              
// the CoClass SubreportObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSubreportObject = class
    class function Create: ISubreportObject;
    class function CreateRemote(const MachineName: string): ISubreportObject;
  end;

// *********************************************************************//
// The Class CoDatabaseFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface IDatabaseFieldDefinition exposed by              
// the CoClass DatabaseFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabaseFieldDefinition = class
    class function Create: IDatabaseFieldDefinition;
    class function CreateRemote(const MachineName: string): IDatabaseFieldDefinition;
  end;

// *********************************************************************//
// The Class CoFormulaFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface IFormulaFieldDefinition exposed by              
// the CoClass FormulaFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFormulaFieldDefinition = class
    class function Create: IFormulaFieldDefinition;
    class function CreateRemote(const MachineName: string): IFormulaFieldDefinition;
  end;

// *********************************************************************//
// The Class CoParameterFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface IParameterFieldDefinition exposed by              
// the CoClass ParameterFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterFieldDefinition = class
    class function Create: IParameterFieldDefinition;
    class function CreateRemote(const MachineName: string): IParameterFieldDefinition;
  end;

// *********************************************************************//
// The Class CoGroupNameFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface IGroupNameFieldDefinition exposed by              
// the CoClass GroupNameFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGroupNameFieldDefinition = class
    class function Create: IGroupNameFieldDefinition;
    class function CreateRemote(const MachineName: string): IGroupNameFieldDefinition;
  end;

// *********************************************************************//
// The Class CoSpecialVarFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface ISpecialVarFieldDefinition exposed by              
// the CoClass SpecialVarFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSpecialVarFieldDefinition = class
    class function Create: ISpecialVarFieldDefinition;
    class function CreateRemote(const MachineName: string): ISpecialVarFieldDefinition;
  end;

// *********************************************************************//
// The Class CoSummaryFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface ISummaryFieldDefinition exposed by              
// the CoClass SummaryFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSummaryFieldDefinition = class
    class function Create: ISummaryFieldDefinition;
    class function CreateRemote(const MachineName: string): ISummaryFieldDefinition;
  end;

// *********************************************************************//
// The Class CoRunningTotalFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface IRunningTotalFieldDefinition exposed by              
// the CoClass RunningTotalFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRunningTotalFieldDefinition = class
    class function Create: IRunningTotalFieldDefinition;
    class function CreateRemote(const MachineName: string): IRunningTotalFieldDefinition;
  end;

// *********************************************************************//
// The Class CoSQLExpressionFieldDefinition provides a Create and CreateRemote method to          
// create instances of the default interface ISQLExpressionFieldDefinition exposed by              
// the CoClass SQLExpressionFieldDefinition. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSQLExpressionFieldDefinition = class
    class function Create: ISQLExpressionFieldDefinition;
    class function CreateRemote(const MachineName: string): ISQLExpressionFieldDefinition;
  end;

// *********************************************************************//
// The Class CoDatabase provides a Create and CreateRemote method to          
// create instances of the default interface IDatabase exposed by              
// the CoClass Database. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabase = class
    class function Create: IDatabase;
    class function CreateRemote(const MachineName: string): IDatabase;
  end;

// *********************************************************************//
// The Class CoDatabaseTables provides a Create and CreateRemote method to          
// create instances of the default interface IDatabaseTables exposed by              
// the CoClass DatabaseTables. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabaseTables = class
    class function Create: IDatabaseTables;
    class function CreateRemote(const MachineName: string): IDatabaseTables;
  end;

// *********************************************************************//
// The Class CoDatabaseTable provides a Create and CreateRemote method to          
// create instances of the default interface IDatabaseTable exposed by              
// the CoClass DatabaseTable. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabaseTable = class
    class function Create: IDatabaseTable;
    class function CreateRemote(const MachineName: string): IDatabaseTable;
  end;

// *********************************************************************//
// The Class CoDatabaseFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IDatabaseFieldDefinitions exposed by              
// the CoClass DatabaseFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDatabaseFieldDefinitions = class
    class function Create: IDatabaseFieldDefinitions;
    class function CreateRemote(const MachineName: string): IDatabaseFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoFormulaFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IFormulaFieldDefinitions exposed by              
// the CoClass FormulaFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFormulaFieldDefinitions = class
    class function Create: IFormulaFieldDefinitions;
    class function CreateRemote(const MachineName: string): IFormulaFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoParameterFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IParameterFieldDefinitions exposed by              
// the CoClass ParameterFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterFieldDefinitions = class
    class function Create: IParameterFieldDefinitions;
    class function CreateRemote(const MachineName: string): IParameterFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoGroupNameFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IGroupNameFieldDefinitions exposed by              
// the CoClass GroupNameFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGroupNameFieldDefinitions = class
    class function Create: IGroupNameFieldDefinitions;
    class function CreateRemote(const MachineName: string): IGroupNameFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoSummaryFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface ISummaryFieldDefinitions exposed by              
// the CoClass SummaryFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSummaryFieldDefinitions = class
    class function Create: ISummaryFieldDefinitions;
    class function CreateRemote(const MachineName: string): ISummaryFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoRunningTotalFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IRunningTotalFieldDefinitions exposed by              
// the CoClass RunningTotalFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRunningTotalFieldDefinitions = class
    class function Create: IRunningTotalFieldDefinitions;
    class function CreateRemote(const MachineName: string): IRunningTotalFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoSQLExpressionFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface ISQLExpressionFieldDefinitions exposed by              
// the CoClass SQLExpressionFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSQLExpressionFieldDefinitions = class
    class function Create: ISQLExpressionFieldDefinitions;
    class function CreateRemote(const MachineName: string): ISQLExpressionFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoGraphObject provides a Create and CreateRemote method to          
// create instances of the default interface IGraphObject exposed by              
// the CoClass GraphObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGraphObject = class
    class function Create: IGraphObject;
    class function CreateRemote(const MachineName: string): IGraphObject;
  end;

// *********************************************************************//
// The Class CoMapObject provides a Create and CreateRemote method to          
// create instances of the default interface IMapObject exposed by              
// the CoClass MapObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMapObject = class
    class function Create: IMapObject;
    class function CreateRemote(const MachineName: string): IMapObject;
  end;

// *********************************************************************//
// The Class CoOleObject provides a Create and CreateRemote method to          
// create instances of the default interface ICROleObject exposed by              
// the CoClass OleObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOleObject = class
    class function Create: ICROleObject;
    class function CreateRemote(const MachineName: string): ICROleObject;
  end;

// *********************************************************************//
// The Class CoBlobFieldObject provides a Create and CreateRemote method to          
// create instances of the default interface IBlobFieldObject exposed by              
// the CoClass BlobFieldObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBlobFieldObject = class
    class function Create: IBlobFieldObject;
    class function CreateRemote(const MachineName: string): IBlobFieldObject;
  end;

// *********************************************************************//
// The Class CoLineObject provides a Create and CreateRemote method to          
// create instances of the default interface ILineObject exposed by              
// the CoClass LineObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLineObject = class
    class function Create: ILineObject;
    class function CreateRemote(const MachineName: string): ILineObject;
  end;

// *********************************************************************//
// The Class CoBoxObject provides a Create and CreateRemote method to          
// create instances of the default interface IBoxObject exposed by              
// the CoClass BoxObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBoxObject = class
    class function Create: IBoxObject;
    class function CreateRemote(const MachineName: string): IBoxObject;
  end;

// *********************************************************************//
// The Class CoOlapGridObject provides a Create and CreateRemote method to          
// create instances of the default interface IOlapGridObject exposed by              
// the CoClass OlapGridObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoOlapGridObject = class
    class function Create: IOlapGridObject;
    class function CreateRemote(const MachineName: string): IOlapGridObject;
  end;

// *********************************************************************//
// The Class CoCrossTabObject provides a Create and CreateRemote method to          
// create instances of the default interface ICrossTabObject exposed by              
// the CoClass CrossTabObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCrossTabObject = class
    class function Create: ICrossTabObject;
    class function CreateRemote(const MachineName: string): ICrossTabObject;
  end;

// *********************************************************************//
// The Class CoPageEngine provides a Create and CreateRemote method to          
// create instances of the default interface IPageEngine exposed by              
// the CoClass PageEngine. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPageEngine = class
    class function Create: IPageEngine;
    class function CreateRemote(const MachineName: string): IPageEngine;
  end;

// *********************************************************************//
// The Class CoPageGenerator provides a Create and CreateRemote method to          
// create instances of the default interface IPageGenerator exposed by              
// the CoClass PageGenerator. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPageGenerator = class
    class function Create: IPageGenerator;
    class function CreateRemote(const MachineName: string): IPageGenerator;
  end;

// *********************************************************************//
// The Class CoPages provides a Create and CreateRemote method to          
// create instances of the default interface IPages exposed by              
// the CoClass Pages. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPages = class
    class function Create: IPages;
    class function CreateRemote(const MachineName: string): IPages;
  end;

// *********************************************************************//
// The Class CoPage provides a Create and CreateRemote method to          
// create instances of the default interface IPage exposed by              
// the CoClass Page. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPage = class
    class function Create: IPage;
    class function CreateRemote(const MachineName: string): IPage;
  end;

// *********************************************************************//
// The Class CoExportOptions provides a Create and CreateRemote method to          
// create instances of the default interface IExportOptions exposed by              
// the CoClass ExportOptions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoExportOptions = class
    class function Create: IExportOptions;
    class function CreateRemote(const MachineName: string): IExportOptions;
  end;

// *********************************************************************//
// The Class CoApplication provides a Create and CreateRemote method to          
// create instances of the default interface IApplication exposed by              
// the CoClass Application. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoApplication = class
    class function Create: IApplication;
    class function CreateRemote(const MachineName: string): IApplication;
  end;

// *********************************************************************//
// The Class CoFormattingInfo provides a Create and CreateRemote method to          
// create instances of the default interface IFormattingInfo exposed by              
// the CoClass FormattingInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFormattingInfo = class
    class function Create: IFormattingInfo;
    class function CreateRemote(const MachineName: string): IFormattingInfo;
  end;

// *********************************************************************//
// The Class CoSortFields provides a Create and CreateRemote method to          
// create instances of the default interface ISortFields exposed by              
// the CoClass SortFields. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSortFields = class
    class function Create: ISortFields;
    class function CreateRemote(const MachineName: string): ISortFields;
  end;

// *********************************************************************//
// The Class CoSortField provides a Create and CreateRemote method to          
// create instances of the default interface ISortField exposed by              
// the CoClass SortField. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSortField = class
    class function Create: ISortField;
    class function CreateRemote(const MachineName: string): ISortField;
  end;

// *********************************************************************//
// The Class CoPrintingStatus provides a Create and CreateRemote method to          
// create instances of the default interface IPrintingStatus exposed by              
// the CoClass PrintingStatus. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoPrintingStatus = class
    class function Create: IPrintingStatus;
    class function CreateRemote(const MachineName: string): IPrintingStatus;
  end;

// *********************************************************************//
// The Class CoSubreportLink provides a Create and CreateRemote method to          
// create instances of the default interface ISubreportLink exposed by              
// the CoClass SubreportLink. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSubreportLink = class
    class function Create: ISubreportLink;
    class function CreateRemote(const MachineName: string): ISubreportLink;
  end;

// *********************************************************************//
// The Class CoSubreportLinks provides a Create and CreateRemote method to          
// create instances of the default interface ISubreportLinks exposed by              
// the CoClass SubreportLinks. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSubreportLinks = class
    class function Create: ISubreportLinks;
    class function CreateRemote(const MachineName: string): ISubreportLinks;
  end;

// *********************************************************************//
// The Class CoCrossTabGroups provides a Create and CreateRemote method to          
// create instances of the default interface ICrossTabGroups exposed by              
// the CoClass CrossTabGroups. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCrossTabGroups = class
    class function Create: ICrossTabGroups;
    class function CreateRemote(const MachineName: string): ICrossTabGroups;
  end;

// *********************************************************************//
// The Class CoCrossTabGroup provides a Create and CreateRemote method to          
// create instances of the default interface ICrossTabGroup exposed by              
// the CoClass CrossTabGroup. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCrossTabGroup = class
    class function Create: ICrossTabGroup;
    class function CreateRemote(const MachineName: string): ICrossTabGroup;
  end;

// *********************************************************************//
// The Class CoFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IFieldDefinitions exposed by              
// the CoClass FieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFieldDefinitions = class
    class function Create: IFieldDefinitions;
    class function CreateRemote(const MachineName: string): IFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoObjectSummaryFieldDefinitions provides a Create and CreateRemote method to          
// create instances of the default interface IObjectSummaryFieldDefinitions exposed by              
// the CoClass ObjectSummaryFieldDefinitions. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjectSummaryFieldDefinitions = class
    class function Create: IObjectSummaryFieldDefinitions;
    class function CreateRemote(const MachineName: string): IObjectSummaryFieldDefinitions;
  end;

// *********************************************************************//
// The Class CoTableLink provides a Create and CreateRemote method to          
// create instances of the default interface ITableLink exposed by              
// the CoClass TableLink. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTableLink = class
    class function Create: ITableLink;
    class function CreateRemote(const MachineName: string): ITableLink;
  end;

// *********************************************************************//
// The Class CoTableLinks provides a Create and CreateRemote method to          
// create instances of the default interface ITableLinks exposed by              
// the CoClass TableLinks. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTableLinks = class
    class function Create: ITableLinks;
    class function CreateRemote(const MachineName: string): ITableLinks;
  end;

// *********************************************************************//
// The Class CoFieldMappingData provides a Create and CreateRemote method to          
// create instances of the default interface IFieldMappingData exposed by              
// the CoClass FieldMappingData. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFieldMappingData = class
    class function Create: IFieldMappingData;
    class function CreateRemote(const MachineName: string): IFieldMappingData;
  end;

// *********************************************************************//
// The Class CoParameterValue provides a Create and CreateRemote method to          
// create instances of the default interface IParameterValue exposed by              
// the CoClass ParameterValue. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterValue = class
    class function Create: IParameterValue;
    class function CreateRemote(const MachineName: string): IParameterValue;
  end;

// *********************************************************************//
// The Class CoParameterValues provides a Create and CreateRemote method to          
// create instances of the default interface IParameterValues exposed by              
// the CoClass ParameterValues. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterValues = class
    class function Create: IParameterValues;
    class function CreateRemote(const MachineName: string): IParameterValues;
  end;

// *********************************************************************//
// The Class CoParameterValueInfo provides a Create and CreateRemote method to          
// create instances of the default interface IParameterValueInfo exposed by              
// the CoClass ParameterValueInfo. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterValueInfo = class
    class function Create: IParameterValueInfo;
    class function CreateRemote(const MachineName: string): IParameterValueInfo;
  end;

// *********************************************************************//
// The Class CoParameterValueInfos provides a Create and CreateRemote method to          
// create instances of the default interface IParameterValueInfos exposed by              
// the CoClass ParameterValueInfos. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoParameterValueInfos = class
    class function Create: IParameterValueInfos;
    class function CreateRemote(const MachineName: string): IParameterValueInfos;
  end;

// *********************************************************************//
// The Class CoReportAlert provides a Create and CreateRemote method to          
// create instances of the default interface IReportAlert exposed by              
// the CoClass ReportAlert. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReportAlert = class
    class function Create: IReportAlert;
    class function CreateRemote(const MachineName: string): IReportAlert;
  end;

// *********************************************************************//
// The Class CoReportAlerts provides a Create and CreateRemote method to          
// create instances of the default interface IReportAlerts exposed by              
// the CoClass ReportAlerts. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReportAlerts = class
    class function Create: IReportAlerts;
    class function CreateRemote(const MachineName: string): IReportAlerts;
  end;

// *********************************************************************//
// The Class CoReportAlertInstance provides a Create and CreateRemote method to          
// create instances of the default interface IReportAlertInstance exposed by              
// the CoClass ReportAlertInstance. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReportAlertInstance = class
    class function Create: IReportAlertInstance;
    class function CreateRemote(const MachineName: string): IReportAlertInstance;
  end;

// *********************************************************************//
// The Class CoReportAlertInstances provides a Create and CreateRemote method to          
// create instances of the default interface IReportAlertInstances exposed by              
// the CoClass ReportAlertInstances. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoReportAlertInstances = class
    class function Create: IReportAlertInstances;
    class function CreateRemote(const MachineName: string): IReportAlertInstances;
  end;

// *********************************************************************//
// The Class CoFieldElements provides a Create and CreateRemote method to          
// create instances of the default interface IFieldElements exposed by              
// the CoClass FieldElements. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFieldElements = class
    class function Create: IFieldElements;
    class function CreateRemote(const MachineName: string): IFieldElements;
  end;

// *********************************************************************//
// The Class CoFieldElement provides a Create and CreateRemote method to          
// create instances of the default interface IFieldElement exposed by              
// the CoClass FieldElement. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFieldElement = class
    class function Create: IFieldElement;
    class function CreateRemote(const MachineName: string): IFieldElement;
  end;

// *********************************************************************//
// The Class CoConnectionProperties provides a Create and CreateRemote method to          
// create instances of the default interface INameValuePairs exposed by              
// the CoClass ConnectionProperties. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConnectionProperties = class
    class function Create: INameValuePairs;
    class function CreateRemote(const MachineName: string): INameValuePairs;
  end;

// *********************************************************************//
// The Class CoConnectionProperty provides a Create and CreateRemote method to          
// create instances of the default interface IConnectionProperty exposed by              
// the CoClass ConnectionProperty. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoConnectionProperty = class
    class function Create: IConnectionProperty;
    class function CreateRemote(const MachineName: string): IConnectionProperty;
  end;

// *********************************************************************//
// The Class CoTableQualifiers provides a Create and CreateRemote method to          
// create instances of the default interface ITableQualifiers exposed by              
// the CoClass TableQualifiers. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTableQualifiers = class
    class function Create: ITableQualifiers;
    class function CreateRemote(const MachineName: string): ITableQualifiers;
  end;

implementation

uses ComObj;

class function CoReport.Create: IReport;
begin
  Result := CreateComObject(CLASS_Report) as IReport;
end;

class function CoReport.CreateRemote(const MachineName: string): IReport;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Report) as IReport;
end;

class function CoAreas.Create: IAreas;
begin
  Result := CreateComObject(CLASS_Areas) as IAreas;
end;

class function CoAreas.CreateRemote(const MachineName: string): IAreas;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Areas) as IAreas;
end;

class function CoSections.Create: ISections;
begin
  Result := CreateComObject(CLASS_Sections) as ISections;
end;

class function CoSections.CreateRemote(const MachineName: string): ISections;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Sections) as ISections;
end;

class function CoArea.Create: IArea;
begin
  Result := CreateComObject(CLASS_Area) as IArea;
end;

class function CoArea.CreateRemote(const MachineName: string): IArea;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Area) as IArea;
end;

class function CoSection.Create: ISection;
begin
  Result := CreateComObject(CLASS_Section) as ISection;
end;

class function CoSection.CreateRemote(const MachineName: string): ISection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Section) as ISection;
end;

class function CoReportObjects.Create: IReportObjects;
begin
  Result := CreateComObject(CLASS_ReportObjects) as IReportObjects;
end;

class function CoReportObjects.CreateRemote(const MachineName: string): IReportObjects;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReportObjects) as IReportObjects;
end;

class function CoFieldObject.Create: IFieldObject;
begin
  Result := CreateComObject(CLASS_FieldObject) as IFieldObject;
end;

class function CoFieldObject.CreateRemote(const MachineName: string): IFieldObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FieldObject) as IFieldObject;
end;

class function CoTextObject.Create: ITextObject;
begin
  Result := CreateComObject(CLASS_TextObject) as ITextObject;
end;

class function CoTextObject.CreateRemote(const MachineName: string): ITextObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TextObject) as ITextObject;
end;

class function CoSubreportObject.Create: ISubreportObject;
begin
  Result := CreateComObject(CLASS_SubreportObject) as ISubreportObject;
end;

class function CoSubreportObject.CreateRemote(const MachineName: string): ISubreportObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SubreportObject) as ISubreportObject;
end;

class function CoDatabaseFieldDefinition.Create: IDatabaseFieldDefinition;
begin
  Result := CreateComObject(CLASS_DatabaseFieldDefinition) as IDatabaseFieldDefinition;
end;

class function CoDatabaseFieldDefinition.CreateRemote(const MachineName: string): IDatabaseFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatabaseFieldDefinition) as IDatabaseFieldDefinition;
end;

class function CoFormulaFieldDefinition.Create: IFormulaFieldDefinition;
begin
  Result := CreateComObject(CLASS_FormulaFieldDefinition) as IFormulaFieldDefinition;
end;

class function CoFormulaFieldDefinition.CreateRemote(const MachineName: string): IFormulaFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FormulaFieldDefinition) as IFormulaFieldDefinition;
end;

class function CoParameterFieldDefinition.Create: IParameterFieldDefinition;
begin
  Result := CreateComObject(CLASS_ParameterFieldDefinition) as IParameterFieldDefinition;
end;

class function CoParameterFieldDefinition.CreateRemote(const MachineName: string): IParameterFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterFieldDefinition) as IParameterFieldDefinition;
end;

class function CoGroupNameFieldDefinition.Create: IGroupNameFieldDefinition;
begin
  Result := CreateComObject(CLASS_GroupNameFieldDefinition) as IGroupNameFieldDefinition;
end;

class function CoGroupNameFieldDefinition.CreateRemote(const MachineName: string): IGroupNameFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GroupNameFieldDefinition) as IGroupNameFieldDefinition;
end;

class function CoSpecialVarFieldDefinition.Create: ISpecialVarFieldDefinition;
begin
  Result := CreateComObject(CLASS_SpecialVarFieldDefinition) as ISpecialVarFieldDefinition;
end;

class function CoSpecialVarFieldDefinition.CreateRemote(const MachineName: string): ISpecialVarFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SpecialVarFieldDefinition) as ISpecialVarFieldDefinition;
end;

class function CoSummaryFieldDefinition.Create: ISummaryFieldDefinition;
begin
  Result := CreateComObject(CLASS_SummaryFieldDefinition) as ISummaryFieldDefinition;
end;

class function CoSummaryFieldDefinition.CreateRemote(const MachineName: string): ISummaryFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SummaryFieldDefinition) as ISummaryFieldDefinition;
end;

class function CoRunningTotalFieldDefinition.Create: IRunningTotalFieldDefinition;
begin
  Result := CreateComObject(CLASS_RunningTotalFieldDefinition) as IRunningTotalFieldDefinition;
end;

class function CoRunningTotalFieldDefinition.CreateRemote(const MachineName: string): IRunningTotalFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RunningTotalFieldDefinition) as IRunningTotalFieldDefinition;
end;

class function CoSQLExpressionFieldDefinition.Create: ISQLExpressionFieldDefinition;
begin
  Result := CreateComObject(CLASS_SQLExpressionFieldDefinition) as ISQLExpressionFieldDefinition;
end;

class function CoSQLExpressionFieldDefinition.CreateRemote(const MachineName: string): ISQLExpressionFieldDefinition;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SQLExpressionFieldDefinition) as ISQLExpressionFieldDefinition;
end;

class function CoDatabase.Create: IDatabase;
begin
  Result := CreateComObject(CLASS_Database) as IDatabase;
end;

class function CoDatabase.CreateRemote(const MachineName: string): IDatabase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Database) as IDatabase;
end;

class function CoDatabaseTables.Create: IDatabaseTables;
begin
  Result := CreateComObject(CLASS_DatabaseTables) as IDatabaseTables;
end;

class function CoDatabaseTables.CreateRemote(const MachineName: string): IDatabaseTables;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatabaseTables) as IDatabaseTables;
end;

class function CoDatabaseTable.Create: IDatabaseTable;
begin
  Result := CreateComObject(CLASS_DatabaseTable) as IDatabaseTable;
end;

class function CoDatabaseTable.CreateRemote(const MachineName: string): IDatabaseTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatabaseTable) as IDatabaseTable;
end;

class function CoDatabaseFieldDefinitions.Create: IDatabaseFieldDefinitions;
begin
  Result := CreateComObject(CLASS_DatabaseFieldDefinitions) as IDatabaseFieldDefinitions;
end;

class function CoDatabaseFieldDefinitions.CreateRemote(const MachineName: string): IDatabaseFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DatabaseFieldDefinitions) as IDatabaseFieldDefinitions;
end;

class function CoFormulaFieldDefinitions.Create: IFormulaFieldDefinitions;
begin
  Result := CreateComObject(CLASS_FormulaFieldDefinitions) as IFormulaFieldDefinitions;
end;

class function CoFormulaFieldDefinitions.CreateRemote(const MachineName: string): IFormulaFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FormulaFieldDefinitions) as IFormulaFieldDefinitions;
end;

class function CoParameterFieldDefinitions.Create: IParameterFieldDefinitions;
begin
  Result := CreateComObject(CLASS_ParameterFieldDefinitions) as IParameterFieldDefinitions;
end;

class function CoParameterFieldDefinitions.CreateRemote(const MachineName: string): IParameterFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterFieldDefinitions) as IParameterFieldDefinitions;
end;

class function CoGroupNameFieldDefinitions.Create: IGroupNameFieldDefinitions;
begin
  Result := CreateComObject(CLASS_GroupNameFieldDefinitions) as IGroupNameFieldDefinitions;
end;

class function CoGroupNameFieldDefinitions.CreateRemote(const MachineName: string): IGroupNameFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GroupNameFieldDefinitions) as IGroupNameFieldDefinitions;
end;

class function CoSummaryFieldDefinitions.Create: ISummaryFieldDefinitions;
begin
  Result := CreateComObject(CLASS_SummaryFieldDefinitions) as ISummaryFieldDefinitions;
end;

class function CoSummaryFieldDefinitions.CreateRemote(const MachineName: string): ISummaryFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SummaryFieldDefinitions) as ISummaryFieldDefinitions;
end;

class function CoRunningTotalFieldDefinitions.Create: IRunningTotalFieldDefinitions;
begin
  Result := CreateComObject(CLASS_RunningTotalFieldDefinitions) as IRunningTotalFieldDefinitions;
end;

class function CoRunningTotalFieldDefinitions.CreateRemote(const MachineName: string): IRunningTotalFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RunningTotalFieldDefinitions) as IRunningTotalFieldDefinitions;
end;

class function CoSQLExpressionFieldDefinitions.Create: ISQLExpressionFieldDefinitions;
begin
  Result := CreateComObject(CLASS_SQLExpressionFieldDefinitions) as ISQLExpressionFieldDefinitions;
end;

class function CoSQLExpressionFieldDefinitions.CreateRemote(const MachineName: string): ISQLExpressionFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SQLExpressionFieldDefinitions) as ISQLExpressionFieldDefinitions;
end;

class function CoGraphObject.Create: IGraphObject;
begin
  Result := CreateComObject(CLASS_GraphObject) as IGraphObject;
end;

class function CoGraphObject.CreateRemote(const MachineName: string): IGraphObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GraphObject) as IGraphObject;
end;

class function CoMapObject.Create: IMapObject;
begin
  Result := CreateComObject(CLASS_MapObject) as IMapObject;
end;

class function CoMapObject.CreateRemote(const MachineName: string): IMapObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MapObject) as IMapObject;
end;

class function CoOleObject.Create: ICROleObject;
begin
  Result := CreateComObject(CLASS_OleObject) as ICROleObject;
end;

class function CoOleObject.CreateRemote(const MachineName: string): ICROleObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OleObject) as ICROleObject;
end;

class function CoBlobFieldObject.Create: IBlobFieldObject;
begin
  Result := CreateComObject(CLASS_BlobFieldObject) as IBlobFieldObject;
end;

class function CoBlobFieldObject.CreateRemote(const MachineName: string): IBlobFieldObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BlobFieldObject) as IBlobFieldObject;
end;

class function CoLineObject.Create: ILineObject;
begin
  Result := CreateComObject(CLASS_LineObject) as ILineObject;
end;

class function CoLineObject.CreateRemote(const MachineName: string): ILineObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LineObject) as ILineObject;
end;

class function CoBoxObject.Create: IBoxObject;
begin
  Result := CreateComObject(CLASS_BoxObject) as IBoxObject;
end;

class function CoBoxObject.CreateRemote(const MachineName: string): IBoxObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BoxObject) as IBoxObject;
end;

class function CoOlapGridObject.Create: IOlapGridObject;
begin
  Result := CreateComObject(CLASS_OlapGridObject) as IOlapGridObject;
end;

class function CoOlapGridObject.CreateRemote(const MachineName: string): IOlapGridObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_OlapGridObject) as IOlapGridObject;
end;

class function CoCrossTabObject.Create: ICrossTabObject;
begin
  Result := CreateComObject(CLASS_CrossTabObject) as ICrossTabObject;
end;

class function CoCrossTabObject.CreateRemote(const MachineName: string): ICrossTabObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CrossTabObject) as ICrossTabObject;
end;

class function CoPageEngine.Create: IPageEngine;
begin
  Result := CreateComObject(CLASS_PageEngine) as IPageEngine;
end;

class function CoPageEngine.CreateRemote(const MachineName: string): IPageEngine;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PageEngine) as IPageEngine;
end;

class function CoPageGenerator.Create: IPageGenerator;
begin
  Result := CreateComObject(CLASS_PageGenerator) as IPageGenerator;
end;

class function CoPageGenerator.CreateRemote(const MachineName: string): IPageGenerator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PageGenerator) as IPageGenerator;
end;

class function CoPages.Create: IPages;
begin
  Result := CreateComObject(CLASS_Pages) as IPages;
end;

class function CoPages.CreateRemote(const MachineName: string): IPages;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Pages) as IPages;
end;

class function CoPage.Create: IPage;
begin
  Result := CreateComObject(CLASS_Page) as IPage;
end;

class function CoPage.CreateRemote(const MachineName: string): IPage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Page) as IPage;
end;

class function CoExportOptions.Create: IExportOptions;
begin
  Result := CreateComObject(CLASS_ExportOptions) as IExportOptions;
end;

class function CoExportOptions.CreateRemote(const MachineName: string): IExportOptions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ExportOptions) as IExportOptions;
end;

class function CoApplication.Create: IApplication;
begin
  Result := CreateComObject(CLASS_Application) as IApplication;
end;

class function CoApplication.CreateRemote(const MachineName: string): IApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Application) as IApplication;
end;

class function CoFormattingInfo.Create: IFormattingInfo;
begin
  Result := CreateComObject(CLASS_FormattingInfo) as IFormattingInfo;
end;

class function CoFormattingInfo.CreateRemote(const MachineName: string): IFormattingInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FormattingInfo) as IFormattingInfo;
end;

class function CoSortFields.Create: ISortFields;
begin
  Result := CreateComObject(CLASS_SortFields) as ISortFields;
end;

class function CoSortFields.CreateRemote(const MachineName: string): ISortFields;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SortFields) as ISortFields;
end;

class function CoSortField.Create: ISortField;
begin
  Result := CreateComObject(CLASS_SortField) as ISortField;
end;

class function CoSortField.CreateRemote(const MachineName: string): ISortField;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SortField) as ISortField;
end;

class function CoPrintingStatus.Create: IPrintingStatus;
begin
  Result := CreateComObject(CLASS_PrintingStatus) as IPrintingStatus;
end;

class function CoPrintingStatus.CreateRemote(const MachineName: string): IPrintingStatus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PrintingStatus) as IPrintingStatus;
end;

class function CoSubreportLink.Create: ISubreportLink;
begin
  Result := CreateComObject(CLASS_SubreportLink) as ISubreportLink;
end;

class function CoSubreportLink.CreateRemote(const MachineName: string): ISubreportLink;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SubreportLink) as ISubreportLink;
end;

class function CoSubreportLinks.Create: ISubreportLinks;
begin
  Result := CreateComObject(CLASS_SubreportLinks) as ISubreportLinks;
end;

class function CoSubreportLinks.CreateRemote(const MachineName: string): ISubreportLinks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SubreportLinks) as ISubreportLinks;
end;

class function CoCrossTabGroups.Create: ICrossTabGroups;
begin
  Result := CreateComObject(CLASS_CrossTabGroups) as ICrossTabGroups;
end;

class function CoCrossTabGroups.CreateRemote(const MachineName: string): ICrossTabGroups;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CrossTabGroups) as ICrossTabGroups;
end;

class function CoCrossTabGroup.Create: ICrossTabGroup;
begin
  Result := CreateComObject(CLASS_CrossTabGroup) as ICrossTabGroup;
end;

class function CoCrossTabGroup.CreateRemote(const MachineName: string): ICrossTabGroup;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CrossTabGroup) as ICrossTabGroup;
end;

class function CoFieldDefinitions.Create: IFieldDefinitions;
begin
  Result := CreateComObject(CLASS_FieldDefinitions) as IFieldDefinitions;
end;

class function CoFieldDefinitions.CreateRemote(const MachineName: string): IFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FieldDefinitions) as IFieldDefinitions;
end;

class function CoObjectSummaryFieldDefinitions.Create: IObjectSummaryFieldDefinitions;
begin
  Result := CreateComObject(CLASS_ObjectSummaryFieldDefinitions) as IObjectSummaryFieldDefinitions;
end;

class function CoObjectSummaryFieldDefinitions.CreateRemote(const MachineName: string): IObjectSummaryFieldDefinitions;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjectSummaryFieldDefinitions) as IObjectSummaryFieldDefinitions;
end;

class function CoTableLink.Create: ITableLink;
begin
  Result := CreateComObject(CLASS_TableLink) as ITableLink;
end;

class function CoTableLink.CreateRemote(const MachineName: string): ITableLink;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TableLink) as ITableLink;
end;

class function CoTableLinks.Create: ITableLinks;
begin
  Result := CreateComObject(CLASS_TableLinks) as ITableLinks;
end;

class function CoTableLinks.CreateRemote(const MachineName: string): ITableLinks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TableLinks) as ITableLinks;
end;

class function CoFieldMappingData.Create: IFieldMappingData;
begin
  Result := CreateComObject(CLASS_FieldMappingData) as IFieldMappingData;
end;

class function CoFieldMappingData.CreateRemote(const MachineName: string): IFieldMappingData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FieldMappingData) as IFieldMappingData;
end;

class function CoParameterValue.Create: IParameterValue;
begin
  Result := CreateComObject(CLASS_ParameterValue) as IParameterValue;
end;

class function CoParameterValue.CreateRemote(const MachineName: string): IParameterValue;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterValue) as IParameterValue;
end;

class function CoParameterValues.Create: IParameterValues;
begin
  Result := CreateComObject(CLASS_ParameterValues) as IParameterValues;
end;

class function CoParameterValues.CreateRemote(const MachineName: string): IParameterValues;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterValues) as IParameterValues;
end;

class function CoParameterValueInfo.Create: IParameterValueInfo;
begin
  Result := CreateComObject(CLASS_ParameterValueInfo) as IParameterValueInfo;
end;

class function CoParameterValueInfo.CreateRemote(const MachineName: string): IParameterValueInfo;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterValueInfo) as IParameterValueInfo;
end;

class function CoParameterValueInfos.Create: IParameterValueInfos;
begin
  Result := CreateComObject(CLASS_ParameterValueInfos) as IParameterValueInfos;
end;

class function CoParameterValueInfos.CreateRemote(const MachineName: string): IParameterValueInfos;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ParameterValueInfos) as IParameterValueInfos;
end;

class function CoReportAlert.Create: IReportAlert;
begin
  Result := CreateComObject(CLASS_ReportAlert) as IReportAlert;
end;

class function CoReportAlert.CreateRemote(const MachineName: string): IReportAlert;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReportAlert) as IReportAlert;
end;

class function CoReportAlerts.Create: IReportAlerts;
begin
  Result := CreateComObject(CLASS_ReportAlerts) as IReportAlerts;
end;

class function CoReportAlerts.CreateRemote(const MachineName: string): IReportAlerts;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReportAlerts) as IReportAlerts;
end;

class function CoReportAlertInstance.Create: IReportAlertInstance;
begin
  Result := CreateComObject(CLASS_ReportAlertInstance) as IReportAlertInstance;
end;

class function CoReportAlertInstance.CreateRemote(const MachineName: string): IReportAlertInstance;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReportAlertInstance) as IReportAlertInstance;
end;

class function CoReportAlertInstances.Create: IReportAlertInstances;
begin
  Result := CreateComObject(CLASS_ReportAlertInstances) as IReportAlertInstances;
end;

class function CoReportAlertInstances.CreateRemote(const MachineName: string): IReportAlertInstances;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ReportAlertInstances) as IReportAlertInstances;
end;

class function CoFieldElements.Create: IFieldElements;
begin
  Result := CreateComObject(CLASS_FieldElements) as IFieldElements;
end;

class function CoFieldElements.CreateRemote(const MachineName: string): IFieldElements;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FieldElements) as IFieldElements;
end;

class function CoFieldElement.Create: IFieldElement;
begin
  Result := CreateComObject(CLASS_FieldElement) as IFieldElement;
end;

class function CoFieldElement.CreateRemote(const MachineName: string): IFieldElement;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FieldElement) as IFieldElement;
end;

class function CoConnectionProperties.Create: INameValuePairs;
begin
  Result := CreateComObject(CLASS_ConnectionProperties) as INameValuePairs;
end;

class function CoConnectionProperties.CreateRemote(const MachineName: string): INameValuePairs;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ConnectionProperties) as INameValuePairs;
end;

class function CoConnectionProperty.Create: IConnectionProperty;
begin
  Result := CreateComObject(CLASS_ConnectionProperty) as IConnectionProperty;
end;

class function CoConnectionProperty.CreateRemote(const MachineName: string): IConnectionProperty;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ConnectionProperty) as IConnectionProperty;
end;

class function CoTableQualifiers.Create: ITableQualifiers;
begin
  Result := CreateComObject(CLASS_TableQualifiers) as ITableQualifiers;
end;

class function CoTableQualifiers.CreateRemote(const MachineName: string): ITableQualifiers;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TableQualifiers) as ITableQualifiers;
end;

end.
