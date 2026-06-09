unit General;

interface

uses SysUtils, Forms, Controls, Windows, IniFiles, Graphics, extCtrls, stdCtrls,
     DbTables,Db, Classes, Registry, Math, uCUMTradutor, StrUtils, uRegExpr, DateUtils,
     Mask, Dialogs, DBGrids, Clipbrd, TypInfo,Grids, ShellAPI, ActiveX,
     WideStrings, Contnrs;

type
   TMethodProcedure = procedure(Sender : TObject) of object; // uma procedure que é um método

   TUMHackDbGrid = class(TDBGrid)
      public
         procedure SetEditText(const Value: string);
   end;



 TCharSet = Set of Char;
 Buffer = array of Byte;

var
  acRetorno : array[0..511] of Char;
  MyBitmap : TBitmap;
  iniBitmap : String;
  pWindows : PChar;
  strWindows: string;
  strPrograma : String;
  Tradutor: TUMTradutor;

const

  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;
  gaDiasSemana :Array[1..7] of String[7] = ('Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado');
  gaDiasSemanaAbreviado: Array[1..7] of String[3] = ('Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab');
  giNrAulas = 4;
  giNrDiasSemana = 5;


  intDV43 : Array[1..43] of Byte =
    ( 4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,
      9,8,7,6,5,4,3,2 );

  intDVBB : Array[1..11] of Byte = ( 7,8,9,2,3,4,5,6,7,8,9 );

//  intDV10 : Array[1..10] of Byte = ( 1,2,1,2,1,2,1,2,1,2 );



  intDV11_2_9 : Array[1..43] of Byte =
    ( 4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,
      9,8,7,6,5,4,3,2 );

  intDV11_2_9b: Array[1..43] of Byte = ( 2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2 );

  intDV11_9_2 : Array[1..43] of Byte =
    ( 7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,
      2,3,4,5,6,7,8,9 );

  intDV11_2_7 : Array[1..43] of Byte =
    ( 2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,
      3,2,7,6,5,4,3,2 );

  intDV10 : Array[1..10] of Byte = ( 1,2,1,2,1,2,1,2,1,2 );

  DaysPerMonth: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);



   function Mensagem(sMensagem: string; sTitulo: string = ''; iOpcoes: LongInt = -1; iHandle: Integer = -1): Integer;
   function MensagemCustomizavel(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; Captions: array of string; TamanhoFixo : Integer = 0; BotaoPadrao : TMsgDlgBtn=mbOK  ): Integer;overload;
   function PCopy( str : String ) : PChar;
   function Extenso( valor, retorno : Pchar ) : Integer; far; stdcall; external 'extens32.dll' index 1;
   function DV10BB( strCodigo : String ) : String;

   function DV10( ds_codigo, cd_banco : string ) : String;
   function DV11( ds_codigo, cd_tipo, cd_banco : string ) : String;
   function DVA2( ds_codigo, cd_tipo, cd_banco : string ) : String;
   function DV44( strCodigo : String ) : String;
   function DV440( strCodigo : String ) : String;
   function DV11BB( strCodigo : String ) : String;
   function DiaUtil( Ano, Mes, Dia : Word; Coligada: Integer) : TDateTime;
   function DiaDaSemana(Data: TDateTime) : String;
   function DiaUtilAteSabado( Ano, Mes, Dia : Word ) : TDateTime;
   function DataValida( Ano, Mes, Dia : Word ) : TDateTime;
   function ValidaCPF( strCPF : String ) : Boolean;
   function ValidaCNPJ( strCNPJ : String ) : Boolean;
   procedure Converte( dblValor: Double );
   function Meses( datIni, datFim : TDateTime ) : Word;
   function Maior21( datNasc, datHoje : TDateTime ) : Boolean;
   function Maior18( datNasc, datHoje : TDateTime ) : Boolean;
   function RoundFloat (AFloat : Double; ADigits : byte) : Currency;
   function RoundUp( AFloat: Double ): Double;
   function TruncFloat (AFloat: Double; ADigitos: Integer): Double;
   function IdadeDias( datIni, datFim : TDateTime ) : Double;
   function IsLeapYear(AYear: Integer): Boolean;
   function SemAcento( str : String ) : String;
   function FillString( str: String; alAlign: TAlign; chChar: Char;
     intSize: Integer; RemoveSinais : Boolean ) : String;
   procedure PapelParede(Sender: TObject);
   procedure TrataErroBanco(DataSet: TDataSet;E: EDatabaseError);
   function RemoveNoise(str:String):String;
   function Corrige( str : String ) : String;
   function RC_StrToInt(xStr:String):Integer;
   function RC_StrToFloat(xStr:String):Double;
   function CalculaFatorVencimento( datIni, datFim : TDateTime ) : string;

   function ReplaceStr (texto, str_localizar, str_substituir: string) : string;

   procedure SplitString(sBase, sQuebra: string; var slRetorno: TStringList);
   procedure JoinString(var sBase: String; const sQuebra: string; const sl: TStringList);

   function DataDiif(DataInic, DataFin: TDateTime): LongInt;
   function DataSoma(Data: TDateTime; DiasIncremento: Integer): TDateTime;
   function GetUserDirectoryAppData() : String;

   function SetSystemDate(dtData: TDateTime): Boolean;

   function ODBCInfo(sTipo: string): string;

   function ArredondaForcado(dValor: Double; APrecisao: Integer; Direcao : Integer): Double;
   function ExtractWindowsDirectory(): string;
   function ExtractTempDirectory(): string;
   function ExtractSystemDirectory(): string;
   function setODBCInfo(sODBC: string; slDados: TStringList): Boolean;
   function OnlyChars(sTexto: string; sValidos: string): string; overload;
   function OnlyChars(sTexto: string; sValidos: TCharSet): string; overload;
   function HexColorToDec(const HexColor: string): TColor;
   procedure ChangeChecked(ACheckBox: TCheckBox; AState: Boolean);
   function validaSenha(sSenha: string): boolean;
   function validaEmail( sEmail: string): boolean;
   function validaTelefone( sTelefone: string): boolean;
   function IsNumericStr(const Value: string): Boolean;
   function BinToDec(const AValor: string): integer;
   function InternalStrToInt(const AStr: string): integer;
   function SoNumeros(const AStr: string): string;
   function FileToHex(const AFilePath: string): string;
   function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
   function ehValorInteiro( sTexto: string ) : Boolean;
   function InputQueryMasked(const ACaption, APrompt: string; var Value:
            string; Formato: String): Boolean;

   // Abre links URL, no navegador padrão
   procedure OpenURL(const URL: String);

   // Função para copiar as informações de um DBGrid para o CTRL + C
   procedure FullDBGridToClipBoard(var DBGrid: TDBGrid; PastHeader :Boolean; IdentacoesTabs: array of integer);
   procedure SelDBGridToClipBoard(var DBGrid: TDBGrid; PastHeader :Boolean);
   procedure StringToClipBoard(const texto: String);
   procedure SetCtrlC(const texto: String);
   function GetCtrlC(): String;
   function IncNumericStr(const Value: AnsiString): AnsiString;

   procedure SetGridFocus(var SGrid: TStringGrid; Linha, Coluna: integer);
   function GetUltimoDia( data: TDateTime ): integer;
   function GetFuncaoEvento(const objeto: TObject; const ds_evento: String = 'OnClick'): String;
   function explode(str,separator : string): TStringList;
   function InputQueryCheck(const ACaption, APrompt , ACaptionCheck: string;var Value: string; var ValueCheck: boolean; ClickCheck: TMethodProcedure = nil): Boolean;
   function InputQueryEvento(const ACaption, APrompt: string; var Value: string; Evento: TMethodProcedure = nil): Boolean;
   function CreateNewGuid: string;
   function GenerateName(Dataset: TDataset; FieldName: string;
      FieldClass: TFieldClass; Number: Integer): string;
   function CreateUniqueName(Dataset: TDataset; const FieldName: string;
      FieldClass: TFieldClass; Component: TComponent): string;
   function DoCreateField(const FieldName: WideString; Origin: string; DataSet: TDataSet): TField;
   function DoAddFields(All: Boolean; DataSet: TDataSet; CamposNovos: TStringList): TField;
   function DateTimeToString(const data: TDateTime): String;
implementation

uses uDm, Messages, Consts, uGeneral;


function CreateNewGuid: string;
var
   GUID: TGUID;
begin
   if CoCreateGuid(GUID) = S_OK then
      Result := GUIDToString(GUID)
   else
      Result := '';
end;

function GenerateName(Dataset: TDataset; FieldName: string;
  FieldClass: TFieldClass; Number: Integer): string;
var
  Fmt: string;

  procedure CrunchFieldName;
  var
    I: Integer;
  begin
    I := 1;
    while I <= Length(FieldName) do
    begin
      if FieldName[I] in ['A'..'Z','a'..'z','_','0'..'9'] then
        Inc(I)
      else if FieldName[I] in LeadBytes then
        Delete(FieldName, I, 2)
      else
        Delete(FieldName, I, 1);
    end;
  end;

begin
  CrunchFieldName;
  if (FieldName = '') or (FieldName[1] in ['0'..'9']) then
  begin
    if FieldClass <> nil then
      FieldName := FieldClass.ClassName + FieldName else
      FieldName := 'Field' + FieldName;
    if FieldName[1] = 'T' then Delete(FieldName, 1, 1);
    CrunchFieldName;
  end;
  Fmt := '%s%s%d';
  if Number < 2 then Fmt := '%s%s';
  Result := Format(Fmt, [Dataset.Name, FieldName, Number]);
end;

function CreateUniqueName(Dataset: TDataset; const FieldName: string;
  FieldClass: TFieldClass; Component: TComponent): string;
var
  I: Integer;

  function IsUnique(const AName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    with Dataset.Owner do
      for I := 0 to ComponentCount - 1 do
        if (Component <> Components[i]) and (CompareText(AName, Components[I].Name) = 0) then Exit;
    Result := True;
  end;

begin
  for I := 1 to MaxInt do
  begin
    Result := GenerateName(Dataset, FieldName, FieldClass, I);
    if IsUnique(Result) then Exit;
  end;
end;

function DoCreateField(const FieldName: WideString; Origin: string; DataSet: TDataSet): TField;
var
  FieldDef: TFieldDef;
  ParentField: TField;
  SubScript,
  ShortName,
  ParentFullName: String;
begin
  FieldDef := Dataset.FieldDefList.FieldByName(FieldName);
  ParentField := nil;
  if Dataset.ObjectView then
  begin
    if FieldDef.ParentDef <> nil then
    begin
      if FieldDef.ParentDef.DataType = ftArray then
      begin
        { Strip off the subscript to determine the parent's full name }
        SubScript := Copy(FieldName, Pos('[', FieldName), MaxInt);
        ParentFullName := Copy(FieldName, 1, Length(FieldName) - Length(SubScript));
        ShortName := FieldDef.ParentDef.Name + SubScript;
      end
      else
      begin
        if faUnNamed in FieldDef.ParentDef.Attributes then
          ParentFullName := FieldDef.ParentDef.Name else
          ParentFullName := ChangeFileExt(FieldName, '');
        ShortName := FieldDef.Name;
      end;
      ParentField := Dataset.FieldList.Find(ParentFullName);
      if ParentField = nil then
        ParentField := DoCreateField(ParentFullName, Origin, DataSet);
    end
    else
      ShortName := FieldDef.Name;
  end
  else
    ShortName := FieldName;
  Result := FieldDef.CreateField(DataSet.Owner, ParentField as TObjectField, ShortName, False);
  try
    Result.Origin := Origin;
    Result.Name := CreateUniqueName(Dataset, FieldName, TFieldClass(Result.ClassType), nil);
  except
    Result.Free;
    raise;
  end;
end;

function DoAddFields(All: Boolean; DataSet: TDataSet; CamposNovos: TStringList): TField;
var
  I,X: Integer;
  FieldName: WideString;
  Field: TField;
begin
  Result := nil;
  DataSet.FieldDefs.Update;
  try
    { Add physical fields not already represented by TField components to the
      to the list of available fields }
    for I := 0 to DataSet.FieldDefList.Count - 1 do
      with Dataset.FieldDefList[I] do
      begin
        if (FieldClass <> nil) and not (faHiddenCol in Attributes) then
        begin
          FieldName := DataSet.FieldDefList.Strings[I];
          Field := DataSet.FindField(FieldName);
        end;
        {$IFDEF MSWINDOWS}
        for x := 0 to CamposNovos.Count - 1 do
        begin
          if CamposNovos[x] = FieldName then
          begin
            if All then
              Result := DoCreateField(FieldName, '', DataSet);
          end;
          

        end;
          

       {$ENDIF}
      end;

    { Show the dialog }

  finally
  end;
end;

function InputQueryEvento(const ACaption, APrompt: string;
   var Value: string; Evento: TMethodProcedure = nil): Boolean;
   function GetAveCharSize(Canvas: TCanvas): TPoint;
   var
      I: Integer;
      Buffer: array[0..51] of Char;
   begin
      for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
      for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
      GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
      Result.X := Result.X div 52;
   end;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        Caption := APrompt;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
        name := 'Label'
      end;
      Edit := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Text := Value;
        SelectAll;
        if (Assigned(Evento)) then
        begin
           OnChange := Evento;
        end;
      end;
      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;          
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;


function InputQueryCheck(const ACaption, APrompt, ACaptionCheck: string;
  var Value: string;  var ValueCheck: boolean; ClickCheck: TMethodProcedure): Boolean;
  function GetAveCharSize(Canvas: TCanvas): TPoint;
   var
     I: Integer;
     Buffer: array[0..51] of Char;
   begin
     for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
     for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
     GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
     Result.X := Result.X div 52;
   end;
var
  Form: TForm;
  Prompt: TLabel;
  Check: TCheckBox;
  Edit: TEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        Caption := APrompt;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      Check := TCheckBox.Create(Form);
      with Check do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        Caption := ACaptionCheck;
        Name := 'Check';
        Checked := ValueCheck;
        if ( Assigned(ClickCheck) ) then
        begin
            OnClick := ClickCheck;
        end;
      end;

      Edit := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Check.Left;
        Top := Check.Top + Check.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        Name := 'Edit';
        Text := Value;
        SelectAll;
      end;
      ButtonTop := Edit.Top + Edit.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;          
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Text;
        ValueCheck := Check.Checked; 
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

Function explode(str , separator : string):TStringList;
var
   p : Integer;
begin
   Result := TstringList.create;
   p := Pos(separator,str);
   while(p >0)do
   begin
      Result.Add(Copy(str,1,p-1));
      Delete(str,1,p+length(separator)-1);
      p:= Pos(separator,str);
   end;
   if(str <>'') then
   begin
      result.add(str)
   end;
end;


function ehValorInteiro( sTexto: string ) : Boolean;
begin

 Try
    StrToInt(sTexto);
    Result  := True;
 Except
   Result   := False;
 end;

end;

function GetUltimoDia(data: TDateTime): integer;
var
   data_dia : TDateTime;
   dia      : word;
   mes      : word;
   ano      : word;
begin
   data_dia := EndOfTheMonth(data);
   DecodeDate(data_dia, ano, mes, dia);

   Result := dia;
end;

procedure SetGridFocus(var SGrid: TStringGrid; Linha, Coluna: integer);
begin
   SGrid.SetFocus;
   SGrid.Row := Linha;
   SGrid.Col := Coluna;
   keybd_event( VK_RETURN, 0, 0, 0 );
end;

function InputQueryMasked(const ACaption, APrompt: string; var Value:
string; Formato: String): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  MaskEdit: TMaskEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do
      Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do
      Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    Position := poScreenCenter;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      Caption := APrompt;
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 8);
      Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
      WordWrap := True;
    end;
    MaskEdit := TMaskEdit.Create(Form);
    with MaskEdit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := Prompt.Top + Prompt.Height + 5;
      Width := MulDiv(164, DialogUnits.X, 4);
      Text := Value;
      EditMask := Formato;
      SelectAll;
    end;
    ButtonTop := MaskEdit.Top + MaskEdit.Height + 15;
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Confirmar';
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
        ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := 'Cancelar';
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4), MaskEdit.Top + MaskEdit.Height + 15,
        ButtonWidth, ButtonHeight);
      Form.ClientHeight := Top + Height + 13;
    end;
    if ShowModal = mrOk then
    begin
      Value := MaskEdit.Text;
      Result := True;
    end;
  finally
    Form.Free;
  end;
end;

function Meses( datIni, datFim : TDateTime ) : Word;
var
  n : Integer;
  strIni, strFim : String;
  AnoIni, MesIni, AnoFim, MesFim, DiaIni, DiaFim : Word;
begin
  DecodeDate( datIni, AnoIni, MesIni, DiaIni );
  DecodeDate( datFim, AnoFim, MesFim, DiaFim );
  n := 0;
  strIni := Format( '%.4d', [AnoIni] ) + Format( '%.2d', [MesIni] );
  strFim := Format( '%.4d', [AnoFim] ) + Format( '%.2d', [MesFim] );
  if ( StrToInt( strIni ) >= StrToInt( strFim ) ) or
     ( ( Trim( strIni ) = '' ) or ( Trim( strFim ) = '' ) ) then
  begin
    Result := 0;
  end
  else
  begin
  while strIni < strFim do
  begin
    Inc( MesIni );
    if MesIni = 13 then
    begin
      MesIni := 1;
      AnoIni := AnoIni + 1;
    end;
    strIni := Format( '%.4d', [AnoIni] ) + Format( '%.2d', [MesIni] );
    Inc( n );
  end;
  end;
  Result := n;
end;

procedure ChangeChecked(ACheckBox: TCheckBox; AState: Boolean);
begin
  ACheckBox.Perform(BM_SETCHECK, Ord(AState), 0);
end;

function MensagemCustomizavel(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; Captions: array of string; TamanhoFixo : Integer = 0; BotaoPadrao : TMsgDlgBtn=mbOK  ): Integer;
begin
   Result := TGeneral.Mensagem(Msg, DlgType, Buttons, Captions, TamanhoFixo, BotaoPadrao);
end;


function Mensagem(sMensagem: string; sTitulo: string = ''; iOpcoes: LongInt = -1; iHandle: Integer = -1): Integer;
begin
   Result := TGeneral.Mensagem(sMensagem, sTitulo, iOpcoes, iHandle);
end;

function PCopy( str : String ) : PChar;
var
  pAux : PChar;
begin
  str := '"' + str + '"';
  pAux := strAlloc( Length( str ) + 1 );
  strPCopy( pAux, str );
  Result := pAux;
end;

procedure Converte( dblValor: Double );
var
  acValor : array[0..511] of char;
  strAux : string;
  i : Integer;
begin
   DecimalSeparator := ',';
   ThousandSeparator := '.';
   strAux := Format('%8.2n', [dblValor]);
   for i := 0 to 510 do acRetorno[i] := ' ';
   acRetorno[511] := chr(0);  //Preenche todo o buffer de retorno com
   strPCopy( acValor, strAux );
   i := Extenso( acValor, acRetorno ); // i contém o número de caracteres
   acRetorno[i] := chr(0);
end;



function DV10 ( ds_codigo, cd_banco : string ) : string;
var
  intDV, intSoma, intMul, i, n : Integer;
  strAux : String[02];
begin
  try
    intSoma := 0;  // Inicia a var intSoma
    intDV := 0;    // Inicia a var intDV
    n := Length( ds_codigo ); // tamanho da string

    for i := High( intDV10 ) downto Low( intDV10 ) do
      begin
        intMul := StrToInt( ds_codigo[n] ) * intDV10[i];

        if intMul >= 10 then  // Reduzir para apenas um dígito
          begin
            strAux := IntToStr( intMul );
            intMul := StrToInt( strAux[1] ) + StrToInt( strAux[2] );
          end;

        intSoma := intSoma + intMul; // Soma as "parcelas"

        Dec(n);

        if n = 0 then Break;
    end;

    intDV := 10 - ( intSoma mod 10 ); // 10 - resto da divisão

    if intDV = 10 then intDV := 0;    // Se não existir resto, assume 0 como DV
  except

    exit; // Em caso de erro, saia

  end;

  result := IntToStr( intDV ); // Passa o resultado
end;

function DVA2( ds_codigo, cd_tipo, cd_banco: string): string;
var
  dv1: string;
  digito: string;
  intDV, intSoma, intMul, i, n : Integer;
begin
  dv1 := DV11(ds_codigo, cd_tipo, cd_banco);

  ds_codigo := ds_codigo + dv1;

  repeat
    intSoma := 0;
    intDV := 0;
    n := Length( ds_codigo );

    for i := High(intDV11_2_7) downto Low(intDV11_2_7) do begin
      intMul := StrToInt( ds_codigo[n] ) * intDV11_2_7[ABS(i)];
      intSoma := intSoma + intMul;
      n := n - 1;
      if n = 0 then begin
        break;
      end;
    end;

    digito := RightStr(ds_codigo, 1);

    intDV := intSoma mod 11;

    if (RightStr(ds_codigo, 1) = '9') then begin
      ds_codigo := LeftStr(ds_codigo, Length(ds_codigo)-1) + '0';
    end
    else begin
      ds_codigo := LeftStr(ds_codigo, Length(ds_codigo)-1) +  IntToStr(StrToInt(RightStr(ds_codigo, 1)) + 1);
    end;
  until (intDV <> 1);

  if intDV > 1 then begin
    intDV := 11 - intDV;
  end;

  case intDV of // 003.2
    10 : Result := '0';
    11 : Result := '1';
  else
    Result := IntToStr(intDV);
  end;

  Result := digito + Result;
end;

function DV11( ds_codigo, cd_tipo, cd_banco: string ): String;
// tipo = 'LD' -> Linha digitável
// tipo = 'CB' -> Código de Barras
// tipo = 'NN' -> NóssoNúmero
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
    intSoma := 0; // Inicia a variável intSoma
    intDV := 0;   // Inicia a variável intDV

    case StrToInt(cd_banco) of
    1: // 001 -> Banco do Brasil
      begin // 001.1
        if cd_tipo = 'LD' then // Linha digitável => Nosso número, Código do cedente, prefixo da agência
          begin // 002

            n := Length( ds_codigo ); // Tamanho da string

            for i := High( intDV11_9_2 ) downto Low( intDV11_9_2 ) do
              begin // 002.1
                intMul := StrToInt( ds_codigo[n] ) * intDV11_9_2[i]; // Número * peso
                intSoma := intSoma + intMul; // Soma das "parcelas

                Dec(n);

                if n = 0 then Break;
              end; // 002.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 002.2
              10 : Result := 'X';
            else // 002.2
              Result := IntToStr(intDV);
            end; // 002.2

          end;   // 002

        if cd_tipo = 'NN' then // Linha digitável => Nosso número, Código do cedente, prefixo da agência
          begin // 002

            n := Length( ds_codigo ); // Tamanho da string

            for i := High( intDV11_9_2 ) downto Low( intDV11_9_2 ) do
              begin // 002.1
                intMul := StrToInt( ds_codigo[n] ) * intDV11_9_2[i]; // Número * peso
                intSoma := intSoma + intMul; // Soma das "parcelas

                Dec(n);

                if n = 0 then Break;
              end; // 002.1

            intDV := intSoma mod 11; // Resto da Divisão

            case intDV of // 002.2
              10 : Result := 'X';
            else // 002.2
              Result := IntToStr(intDV);
            end; // 002.2

          end;   // 002


        if cd_tipo = 'CB' then // Código de Barras
          // Para calcular o DV do código de barras deve-se considerar
          //  43 das 44 posições da string, ou seja, pular a posição 5
          begin // 003

            n := Length( ds_codigo ); // Tamanho da string

            for i := High( intDV11_2_9 ) downto Low( intDV11_2_9 ) do
              begin // 003.1
                intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9[i]; // Número * peso
                intSoma := intSoma + intMul; // Soma das "parcelas

                Dec(n);

                if n = 0 then Break;
              end; // 003.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 003.2
              10 : Result := '1';
              11 : Result := '1';
            else // 003.2
              Result := IntToStr(intDV);
            end; // 003.2

          end;   // 003
      end; // 001.1
//-----------------------------------------------------------------------
      104: // 104 -> Caixa Econômica
        begin // 001.2

          if cd_tipo = 'NN' then begin

             n := Length( ds_codigo ); // Tamanho da string

             for i := High( intDV11_9_2 ) downto Low( intDV11_9_2 ) do
             begin // 004.1
                 intMul := StrToInt( ds_codigo[n] ) * intDV11_9_2[i]; // Número * peso
                 intSoma := intSoma + intMul; // Soma das "parcelas

                 Dec(n);

                 if n = 0 then Break;
             end; // 004.1

             intDV := intSoma mod 11; // Resto da Divisão

             case intDV of // 004.2
                 10 : Result := '0';
             else // 004.2
                 Result := IntToStr(intDV);
             end; // 004.2

          end
          else begin

             n := Length( ds_codigo ); // Tamanho da string

             for i := High( intDV11_2_9 ) downto Low( intDV11_2_9 ) do
             begin // 004.1
                 intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9[i]; // Número * peso
                 intSoma := intSoma + intMul; // Soma das "parcelas

                 Dec(n);

                 if n = 0 then Break;
             end; // 004.1

             intDV := intSoma mod 11; // Resto da Divisão

             intDV := 11 - intDV;

             case intDV of // 004.2
                 10 : Result := '1';
                 11 : Result := '1';
             else // 004.2
                 Result := IntToStr(intDV);
             end; // 004.2

          end;


        end;  // 001.2
//-----------------------------------------------------------------------
      237: // 237 -> Bradesco
        begin // 001.2

          n := Length( ds_codigo ); // Tamanho da string

          if cd_tipo = 'NN' then // Nossonumero
          Begin

          for i := High( intDV11_2_7 ) downto Low( intDV11_2_7 ) do
            begin // 004.1
              intMul := StrToInt( ds_codigo[n] ) * intDV11_2_7[i]; // Número * peso
              intSoma := intSoma + intMul; // Soma das "parcelas

              Dec(n);

              if n = 0 then Break;
            end; // 004.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 004.2
              1 : Result := '1';
              10 : Result := 'P';
              11 : Result := '0';
            else // 004.2
              Result := IntToStr(intDV);
            end; // 004.2

          end
          else
          Begin

          for i := High( intDV11_2_9 ) downto Low( intDV11_2_9 ) do
            begin // 004.1
              intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9[i]; // Número * peso
              intSoma := intSoma + intMul; // Soma das "parcelas

              Dec(n);

              if n = 0 then Break;
            end; // 004.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 004.2
              1 : Result := '1';
              10 : Result := '1';
              11 : Result := '1';
            else // 004.2
              Result := IntToStr(intDV);
            end; // 004.2

          End;

        end;  // 001.2
//-----------------------------------------------------------------------

      399: // 399 -> HSBC
        begin // 001.2

          n := Length( ds_codigo ); // Tamanho da string

          if cd_tipo = 'NN' then // Nossonumero
          Begin

          for i := High( intDV11_2_7 ) downto Low( intDV11_2_7 ) do
            begin // 004.1
              intMul := StrToInt( ds_codigo[n] ) * intDV11_2_7[i]; // Número * peso
              intSoma := intSoma + intMul; // Soma das "parcelas

              Dec(n);

              if n = 0 then Break;
            end; // 004.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 004.2
              10 : Result := '0';
              11 : Result := '0';
            else // 004.2
              Result := IntToStr(intDV);
            end; // 004.2

          end
          else
          Begin

          for i := High( intDV11_2_9 ) downto Low( intDV11_2_9 ) do
            begin // 004.1
              intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9[i]; // Número * peso
              intSoma := intSoma + intMul; // Soma das "parcelas

              Dec(n);

              if n = 0 then Break;
            end; // 004.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 004.2
              1 : Result := '1';
              10 : Result := '1';
              11 : Result := '1';
            else // 004.2
              Result := IntToStr(intDV);
            end; // 004.2

          End;

        end;  // 001.2
//-----------------------------------------------------------------------
      291: // 104 -> BCN
        begin // 001.2

          if  cd_tipo = 'NN' then
          Begin

          n := Length( ds_codigo ); // Tamanho da string

          for i := High( intDV11_2_9 ) downto Low( intDV11_2_9 ) do
            begin // 004.1
              intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9[i] * 10; // Número * peso
              intSoma := intSoma + intMul; // Soma das "parcelas

              Dec(n);

              if n = 0 then Break;
            end; // 004.1

            intDV := intSoma mod 11; // Resto da Divisão

            case intDV of // 004.2
              10 : REsult := '0';
            else // 004.2
              Result := IntToStr(intDV);
            end; // 004.2

          End
          else
          Begin

          n := Length( ds_codigo ); // Tamanho da string

          for i := High( intDV11_2_9 ) downto Low( intDV11_2_9 ) do
            begin // 004.1
              intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9[i]; // Número * peso
              intSoma := intSoma + intMul; // Soma das "parcelas

              Dec(n);

              if n = 0 then Break;
            end; // 004.1

            intDV := intSoma mod 11; // Resto da Divisão

            intDV := 11 - intDV;

            case intDV of // 004.2
               0 : REsult := '1';
              10 : Result := '1';
              11 : Result := '1';
            else // 004.2
              Result := IntToStr(intDV);
            end; // 004.2

          end;
        end;  // 001.2
//-----------------------------------------------------------------------
//         BANRISUL
      041: begin
         intSoma := 0;
         intDV := 0;

         n := Length(ds_codigo);

         for i := High(intDV11_2_9b) downto low(intDV11_2_9b) do begin
             intMul := StrToInt( ds_codigo[n] ) * intDV11_2_9b[ABS(i)];
             if intMul > 9 then begin
              intMul := intMul - 9
             end;
             intSoma := intSoma + intMul;
             n := n - 1;
             if n = 0 then begin
                break;
             end;
         end;

         intDV := intSoma mod 10;
         intDV := 10 - intDV;

         case intDV of
            10: Result := '0';
            else Result := IntToStr(intDV);
         end;

      end
      else // 001
        exit; // Saia
      end; // 001

  except
    exit; // Em caso de erro, saia
  end;

end;



function DV10BB( strCodigo : String ) : String;
var
  intDV, intSoma, intMul, i, n : Integer;
  strAux : String[02];
begin
  try
  intSoma := 0;
  intDV := 0;
  n := Length( strCodigo );
  for i := High( intDV10 ) downto Low( intDV10 ) do
  begin
    intMul := StrToInt( strCodigo[n] ) * intDV10[i];
    if intMul >= 10 then
    begin
      strAux := IntToStr( intMul );
      intMul := StrToInt( strAux[1] ) + StrToInt( strAux[2] );
    end;
    intSoma := intSoma + intMul;
    Dec( n, 1 );
    if n = 0 then Break;
  end;

  if intSoma < 10 then
    intDV := 10 - intSoma
  else
    intDV := (StrToInt(Copy(IntToStr(intSoma),1,1))+1)*10 - intSoma;

  if intDV = 10 then intDV := 0;
  except
    Exit;
  end;
  Result := IntToStr( intDV );
end;


function DV44( strCodigo : String ) : String;
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
  intSoma := 0;
  intDV := 0;
  n := Length( strCodigo );
  for i := High( intDV43 ) downto Low( intDV43 ) do
  begin
    intMul := StrToInt( strCodigo[n] ) * intDV43[i];
    intSoma := intSoma + intMul;
    Dec( n, 1 );
    if n = 0 then Break;
  end;
  intDV := 11 - ( intSoma mod 11 );
  if ( intDV = 0 ) or ( intDV > 9 ) then intDV := 1;
  except
    Exit;
  end;
  Result := IntToStr( intDV );
end;

function DV440( strCodigo : String ) : String;
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
  intSoma := 0;
  intDV := 0;
  n := Length( strCodigo );
  for i := High( intDV43 ) downto Low( intDV43 ) do
  begin
    intMul := StrToInt( strCodigo[n] ) * intDV43[i];
    intSoma := intSoma + intMul;
    Dec( n, 1 );
    if n = 0 then Break;
  end;
  intDV := 11 - ( intSoma mod 11 );
  if ( intDV = 0 ) or ( intDV > 9 ) then intDV := 0;
  except
    Exit;
  end;
  Result := IntToStr( intDV );
end;


function DV11BB( strCodigo : String ) : String;
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
    intSoma := 0;
    intDV := 0;
    n := Length( strCodigo );
    for i := High( intDV43 ) downto Low( intDV43 ) do
    begin
      intMul := StrToInt( strCodigo[n] ) * intDV43[i];
      intSoma := intSoma + intMul;
      Dec( n, 1 );
      if n = 0 then Break;
    end;

    intDV := intSoma mod 11;

    intDV := 11 - intDV;

    case intDV of
      10 : Result := '1';
      11 : Result := '1';
      else
        Result := IntToStr(intDV);
    end;
  except
    Exit;
  end;
end;

function DataValida( Ano, Mes, Dia : Word ) : TDateTime;
var
  MyDate : TDateTime;
begin

  While Dia >= 1 do begin

     try
        MyDate := EncodeDate(Ano, Mes, Dia);
        Dia := 0;
     except
        Dia := Dia - 1;
     end;
          
  End;

  Result := MyDate;

end;

{ Calcula o próximo dia útil com base na tabela de feriados e descontando
  sábados e domingos.
}
function DiaUtil(Ano, Mes, Dia: Word; Coligada: Integer): TDateTime;
var
   bInverter: boolean;
   mesAtual: word;
begin
   mesAtual := Mes;
   bInverter := false;
   try
      Result := EncodeDate(Ano, Mes, Dia);
      while DM.FindDate(Result, Coligada) or (DayOfWeek(Result) in [1, 7]) or (MES <> mesAtual) do
      begin
         if MES <> mesAtual then
         begin
            bInverter := true;
         end;

         if not bInverter then
         begin
            Result := IncDay(Result);
            DecodeDate(Result, Ano, mesAtual, Dia);
         end
         else
         begin
            Result := IncDay(Result, -1);
            DecodeDate(Result, Ano, mesAtual, Dia);
         end;
      end;
   except
      on E: EConvertError do
      begin
         if ( ( Mes = 2 ) AND (Dia > 28) ) OR
            ( ( Mes <> 2 ) AND ( Dia = 31 ) ) then
         begin
            Result := DiaUtil( Ano, Mes, Dia-1, Coligada );
         end else begin
            raise;
         end;    
      end;
   end;
end;

{*
 * Função para retornar o Dia da Semana (somente os 3 primeiros digitos)
 *}
function DiaDaSemana(Data: TDateTime) : String;
begin
   Result := gaDiasSemanaAbreviado[DayOfWeek(Data)];
end;

function DiaUtilAteSabado(Ano, Mes, Dia: Word):TDateTime;
begin
   // tenta validar a data
   Result := DataValida(Ano, Mes, Dia);
   // verifica se a data caiu num sábado ou domingo
   case DayOfWeek(Result) of
      1: Result := IncDay(Result);    // caiu num domingo, joga para segunda
   end;
end;

function ValidaCPF( strCPF : String ) : Boolean;
var
  strCPF1, strCPF2  : String;
  n : Byte;
  i: Integer;
  CPF: char;
  intSoma : Integer;
  cpfIgual, flgDig1, flgDig2 : Boolean;
begin

  Result := False;
  try                    
  flgDig1 := False;
  flgDig2 := False;
  while Pos( ',', strCPF ) <> 0 do
    Delete( strCPF, Pos( ',', strCPF ), 1 );
  while Pos( '.', strCPF ) <> 0 do
    Delete( strCPF, Pos( '.', strCPF ), 1 );
  while Pos( '-', strCPF ) <> 0 do
    Delete( strCPF, Pos( '-', strCPF ), 1 );
  if Length( strCPF ) <> 11 then
    Exit;
  cpf := strCPF[1];
  if (DM.variavel_parametro('permite_cpf_zerado') = 'N') then
  begin
     for I := 2 to Length(strCPF)+1  do
     begin
        if (strCPF[i] <> cpf) then
        begin
         Break;
        end;
        if i = 11 then
        begin
          Result := false;
          Exit
        end;
     end;
  end;

  strCPF1 := Copy( strCPF, 1, 9 );
  strCPF2 := Copy( strCPF, 1, 10 );

  cpfIgual := False;

  { TESTA DIGITO 1 }
  intSoma := 0;
  for n := 1 to Length( strCPF1 ) do
    intSoma := intSoma + ( StrToInt( strCPF1[n] ) * ( 10 - n + 1 ) );
  intSoma := intSoma - ( ( intSoma div 11 ) * 11 );
  if intSoma < 2 then
    intSoma := 0
  else
    intSoma := 11 - intSoma;
  if IntToStr( intSoma ) = Copy( strCPF, 10, 1 ) then
     flgDig1 := True;

  { TESTA DIGITO 2 }
  intSoma := 0;
  for n := 1 to Length( strCPF2 ) do
   intSoma := intSoma + ( StrToInt( strCPF2[n] ) * ( 11 - n + 1 ) );
  intSoma := intSoma - ( ( intSoma div 11 ) * 11 );
  if intSoma < 2 then
    intSoma := 0
  else
    intSoma := 11 - intSoma;
  if IntToStr( intSoma ) = Copy( strCPF, 11, 1 ) then
    flgDig2 := True;
  except
    Result := False;
  end;

  if (strCPF = '11111111111') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '22222222222') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '33333333333') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '44444444444') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '55555555555') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '66666666666') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '77777777777') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '88888888888') then
  begin
     cpfIgual := True;
  end;
  if (strCPF = '99999999999') then
  begin
     cpfIgual := True;
  end;

  if cpfIgual = True then
  begin
     Result := False;
  end
  else
  begin
     Result := flgDig1 and flgDig2;
  end;
  
end;


function ValidaCNPJ( strCNPJ : String ) : Boolean;
var
  strCNPJ1, strCNPJ2 : String;
  d1, i : integer;
begin

  while Pos( ',', strCNPJ ) <> 0 do Delete( strCNPJ, Pos( ',', strCNPJ ), 1 );
  while Pos( '.', strCNPJ ) <> 0 do Delete( strCNPJ, Pos( '.', strCNPJ ), 1 );
  while Pos( '-', strCNPJ ) <> 0 do Delete( strCNPJ, Pos( '-', strCNPJ ), 1 );
  while Pos( '/', strCNPJ ) <> 0 do Delete( strCNPJ, Pos( '/', strCNPJ ), 1 );

  if Length( strCNPJ ) <> 14 then begin
    Result := false;
    Exit;
  end;

  strCNPJ1 := Copy(strCNPJ, 1, 12);
  strCNPJ2 := Copy(strCNPJ, 13, 2);
  d1 := 0;

  for i := 0 to 11 do begin
    d1 := d1 + StrToInt( Copy(strCNPJ1, (12-i), 1) )*(2+(i mod 8));
  end;
  if d1 = 0 then begin
    Result := false;
    Exit;
  end;

  d1 := 11 - (d1 mod 11);  // TESTAR AQUI
  if d1 > 9 then begin
    d1 := 0;
  end;
  if Copy(strCNPJ2, 1, 1) <> IntToStr(d1) then begin
    Result := false;
    Exit;
  end;

  d1 := d1 * 2;
  for i := 0 to 11 do begin
    d1 := d1 + StrToInt( Copy(strCNPJ1, (12-i), 1) )*(2+((i+1) mod 8)); // TESTAR AQUI TAMBÉM
  end;

  d1 := 11 - (d1 mod 11);  // TESTAR AQUI
  if d1 > 9 then begin
    d1 := 0;
  end;
  if Copy(strCNPJ2, 2, 1) <> IntToStr(d1) then begin
    Result := false;
    Exit;
  end;

  Result := true;

end;

function Maior21( datNasc, datHoje : TDateTime ) : Boolean;
var
  wDiaNasc, wMesNasc, wAnoNasc : Word;
  wDiaHoje, wMesHoje, wAnoHoje : Word;
begin
  if Meses( datNasc, datHoje ) = 252 then { 252 MESES = 21 ANOS }
  begin
    DecodeDate( datHoje, wAnoHoje, wMesHoje, wDiaHoje );
    DecodeDate( datNasc, wAnoNasc, wMesNasc, wDiaNasc );
    if datHoje >= EncodeDate( wAnoHoje, wMesNasc, wDiaNasc ) then
      Result := True
    else
      Result := False;
  end;

  if Meses( datNasc, datHoje ) > 252 then Result := True;

  if Meses( datNasc, datHoje ) < 252 then Result := False;

end;

function Maior18( datNasc, datHoje : TDateTime ) : Boolean;
var
  wDiaNasc, wMesNasc, wAnoNasc : Word;
  wDiaHoje, wMesHoje, wAnoHoje : Word;
begin
  if Meses( datNasc, datHoje ) = 216 then { 216 MESES = 18 ANOS }
  begin
    DecodeDate( datHoje, wAnoHoje, wMesHoje, wDiaHoje );
    DecodeDate( datNasc, wAnoNasc, wMesNasc, wDiaNasc );
    if datHoje >= EncodeDate( wAnoHoje, wMesNasc, wDiaNasc ) then
      Result := True
    else
      Result := False;
  end;

  if Meses( datNasc, datHoje ) > 216 then Result := True;

  if Meses( datNasc, datHoje ) < 216 then Result := False;

end;

function TruncFloat (AFloat: Double; ADigitos: Integer): Double;
var
   sValor: string;
   sGlue: char;
begin
   sValor := FloatToStrF(AFloat, ffFixed, 20, 20);
   if (Pos('.', sValor) > 0) then begin
      sGlue := '.';
   end
   else begin
      sGlue := ',';
   end;
   sValor := Copy(sValor, 1, Pos(sGlue, sValor) + ADigitos);
   AFloat := StrToFloat(sValor);
   Result := RoundFloat(AFloat, ADigitos);
end;

function RoundFloat (AFloat : Double; ADigits : byte) : Currency;
var
  TempStr : string;
  FloatResult : Double;
begin
  if ADigits <= 15 then
  begin
    TempStr := FloatToStrF( AFloat, ffFixed, 20, ADigits);
    FloatResult := StrToFloat (TempStr);

    Result := FloatResult;
  end
  else
    Result := AFloat;
end;

function RoundUp( AFloat: Double ): Double;
var
  xAux: Double;
  xNum: String;
  xInt: Integer;
begin
  xAux := RoundFloat(AFloat,2);
  xNum := FloatToStr(xAux);
  xInt := StrToInt(xNum[Length(xNum)]);

  if xInt > 0 then // >= 5
    Result := RoundFloat(Int(AFloat)+Frac(AFloat)+StrToFloat('0,0'+IntToStr(10-xInt)),2)
  else
    Result := AFloat;
end;

function ArredondaForcado(dValor: Double; APrecisao: Integer; Direcao : Integer): Double;
var
   dFracao: Double;
   dDiv: array[1..4] of Double;
   AMult: Integer;
   dDif: Double;
begin
   // Direcao:   1 = Para cima,  2 = Para Baixo,  3 = Ambos
   dFracao := dValor - TruncFloat(dValor, (APrecisao-1));

   // Sem nenhuma casa decimal - deve arredondar de forma diferenciada
   if Aprecisao = 0 then begin

      if (Direcao in [2]) OR (dFracao = 0) then begin
         dDif := - dFracao;
      end else if (Direcao in [1]) then begin
         dDif := (1 - dFracao);
      end else begin
         if (dFracao < 0.5) then begin
            dDif := -dFracao;
         end else begin
            dDif := (1 - dFracao);
         end;
      end;


   end else begin


      AMult := Trunc(IntPower(10.0, APrecisao));

      dDiv[1] := 2.5 / AMult;
      dDiv[2] := 5 / AMult;
      dDiv[3] := 7.5 / AMult;
      dDiv[4] := 10 / AMult;

      if (dFracao < dDiv[1]) then begin //menor que 2.5
         if (Direcao in [2,3]) OR (dFracao = 0) then
            dDif := -dFracao
         else
            dDif := (dDiv[2] - dFracao);
      end
      else if ((dFracao >= dDiv[1]) and (dFracao <= dDiv[2])) then begin //maior que 2.5 e menor que 5
         if (Direcao in [1,3]) OR (dFracao = dDiv[2]) then
            dDif := (dDiv[2] - dFracao)
         else
            dDif := -dFracao;
      end
      else if ((dFracao > dDiv[2]) and (dFracao < dDiv[3])) then begin //maior que 5 e menor que 7.5
         if Direcao in [2,3] then
            dDif := - (dFracao - dDiv[2])
         else
            dDif := (dDiv[4] - dFracao);
      end
      else if (dFracao >= dDiv[3]) then begin //maior que 7.5
         if Direcao in [1,3] then
            dDif := + (dDiv[4] - dFracao)
         else
            dDif := dDiv[2] - dFracao;
      end;

   end;

   Result := RoundFloat(dValor + dDif, APrecisao);

end;

function IdadeDias( datIni, datFim : TDateTime ) : Double;
var
  wAnoI, wMesI, wDiaI : Word;
  wAnoF, wMesF, wDiaF : Word;
  intQtdade : Integer;
begin
  intQtdade := 0;
  DecodeDate( datIni, wAnoI, wMesI, wDiaI );
  DecodeDate( datFim, wAnoF, wMesF, wDiaF );

  while wAnoF >= wAnoI do
  begin
    if isLeapYear( wAnoI ) then Inc( intQtdade );
    Inc( wAnoI );
  end;

  Result := datFim - datIni - intQtdade;
end;

function IsLeapYear(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function SemAcento( str : String ) : String;
begin
   Result := TGeneral.RemoverAcentuacao(str);
end;

function onlyChars(sTexto: string; sValidos: string): string;
var
   i: Integer;
   sRet: string;
begin
   sRet := '';
   for i := 1 to Length(sTexto) do begin
      if (Pos(sTexto[i], sValidos) <> 0) then begin
         sRet := sRet + sTexto[i];
      end;
   end;
   Result := sRet;
end;

function OnlyChars(sTexto: string; sValidos: TCharSet): string;
var
   i: Integer;
   sRet: string;
begin
   sRet := '';
   for i := 1 to Length(sTexto) do begin
      if (sTexto[i] in sValidos) then begin
         sRet := sRet + sTexto[i];
      end;
   end;
   Result := sRet;
end;


function FillString( str: String; alAlign: TAlign; chChar: Char;
  intSize: Integer; RemoveSinais : Boolean ) : String;
begin

  if RemoveSinais then
  begin
    while Pos( '.', str ) > 0 do Delete( str, Pos( '.', str ), 1 );
    while Pos( '-', str ) > 0 do Delete( str, Pos( '-', str ), 1 );
    while Pos( '/', str ) > 0 do Delete( str, Pos( '/', str ), 1 );
    while Pos( '\', str ) > 0 do Delete( str, Pos( '\', str ), 1 );
    while Pos( ',', str ) > 0 do Delete( str, Pos( ',', str ), 1 );     
  end;

  str := TrimLeft( str );
  str := TrimRight( str );

  case alAlign of
    alLeft : begin
      while Length( str ) < intSize do str := str + chChar;
    end;

    alRight : begin
      while Length( str ) < intSize do str := chChar + str;
    end;
  end;

  Result := str;

end;



procedure PapelParede(Sender: TObject);
var
  nx, ny, PosX, PosY, n : Integer;
begin
  PosX := 0;
  PosY := 0;
  nx := 0;
  ny := 0;
  if MyBitmap = nil then Exit;

  if Sender is TForm then
  begin
    for n := 0 to TForm( Sender ).ComponentCount - 1 do
      if TForm( Sender ).Components[n] is TLabel then
        TLabel( TForm( Sender ).Components[n] ).Transparent := True;

    while ny < TForm( Sender ).Height do
    begin
      while nx < TForm( Sender ).Width do
      begin
        if Sender is TForm then
          TForm( Sender ).Canvas.Draw( PosX, PosY, MyBitmap );
        PosX := PosX + MyBitmap.Width;
        nx := PosX;
      end;
      PosY := PosY + MyBitmap.Height;
      ny := PosY;
      nx := 0;
      PosX := 0;
    end;
  end;

  if Sender is TImage then
  begin
    while ny < TImage( Sender ).Height do
    begin
      while nx < TImage( Sender ).Width do
      begin
        if Sender is TImage then
          TImage( Sender ).Canvas.Draw( PosX, PosY, MyBitmap );
        PosX := PosX + MyBitmap.Width;
        nx := PosX;
      end;
      PosY := PosY + MyBitmap.Height;
      ny := PosY;
      nx := 0;
      PosX := 0;
    end;
    TImage( Sender ).SendToBack;
  end;


end;

procedure TrataErroBanco(DataSet: TDataSet;E: EDatabaseError);
var
  lsMensagem :String;
begin
  if (E is EDBEngineError) then
     begin
       case (E as EDBEngineError).Errors[0].Errorcode Of
         eKeyViol              :lsMensagem := 'Chave Duplicada!'+#13+#10+
                                              'Registro já foi incluído...'+#13+#10;
         eRequiredFieldMissing :lsMensagem := 'Campo Requerido!';
         eForeignKey           :lsMensagem := 'Campo Estrangeiro Inválido ou Inexistente!';
       else
         lsMensagem := 'Problemas na gravação... Verifique!' + #13+#10+
                       (E as EDBEngineError).Errors[0].Message;
       end;
       Mensagem( IntToStr((E as EDBEngineError).Errors[0].Errorcode)+' - ' +
                 lsMensagem,Application.Title,MB_ICONSTOP + MB_OK);
       Abort;
    end;
end;

function RemoveNoise(str:String):String;
begin
  while Pos( '.', str ) > 0 do Delete( str, Pos( '.', str ), 1 );
  while Pos( '-', str ) > 0 do Delete( str, Pos( '-', str ), 1 );
  while Pos( '/', str ) > 0 do Delete( str, Pos( '/', str ), 1 );
  while Pos( '\', str ) > 0 do Delete( str, Pos( '\', str ), 1 );
  while Pos( ',', str ) > 0 do Delete( str, Pos( ',', str ), 1 );
  Result := str;
end;

function Corrige( str : String ) : String;
begin
  //CORRIGE ACENTUAÇÃO - CASO DO UNIVERSITARIO (IMPORTACAO DE DADOS)
  while Pos( Chr( ( 144 )), str ) <> 0 do
    if Pos( Chr( ( 144 )), str ) > 0 then str[Pos(Chr((144)),str)] := 'É';

  while Pos( Chr( ( 128 )), str ) <> 0 do
    if Pos( Chr( ( 128 )), str ) > 0 then str[Pos(Chr((128)),str)] := 'Ç';

  while Pos( Chr( ( 129 )), str ) <> 0 do
    if Pos( Chr( ( 129 )), str ) > 0 then str[Pos(Chr((129)),str)] := 'Ü';

  while Pos( Chr( ( 160 )), str ) <> 0 do
    if Pos( Chr( ( 160 )), str ) > 0 then str[Pos(Chr((160)),str)] := 'Á';

  while Pos( Chr( ( 163 )), str ) <> 0 do
    if Pos( Chr( ( 163 )), str ) > 0 then str[Pos(Chr((163)),str)] := 'Ú';

  while Pos( Chr( ( 161 )), str ) <> 0 do
    if Pos( Chr( ( 161 )), str ) > 0 then str[Pos(Chr((161)),str)] := 'Í';

  while Pos( Chr( ( 148 )), str ) <> 0 do
    if Pos( Chr( ( 148 )), str ) > 0 then str[Pos(Chr((148)),str)] := 'Ö';

  while Pos( Chr( ( 147 )), str ) <> 0 do
    if Pos( Chr( ( 147 )), str ) > 0 then str[Pos(Chr((147)),str)] := 'Ô';

  while Pos( Chr( ( 131 )), str ) <> 0 do
    if Pos( Chr( ( 131 )), str ) > 0 then str[Pos(Chr((131)),str)] := 'Â';

  while Pos( Chr( ( 136 )), str ) <> 0 do
    if Pos( Chr( ( 136 )), str ) > 0 then str[Pos(Chr((136)),str)] := 'Ê';

  while Pos( Chr( ( 142 )), str ) <> 0 do
    if Pos( Chr( ( 142 )), str ) > 0 then str[Pos(Chr((142)),str)] := 'Ã';

  while Pos( Chr( ( 162 )), str ) <> 0 do
    if Pos( Chr( ( 162 )), str ) > 0 then str[Pos(Chr((162)),str)] := 'Ó';

  while Pos( Chr( ( 153 )), str ) <> 0 do
    if Pos( Chr( ( 153 )), str ) > 0 then str[Pos(Chr((153)),str)] := 'Õ';

  Result := str;
end;

function RC_StrToInt(xStr:String):Integer;
var
   i : Integer;
   sNum : String;
   aNumeros : String;
begin
  aNumeros := '0123456789';

  sNum := '0';

  For i := 1 to Length(xStr) do begin
     if Pos(xStr[i], aNumeros) > 0 then
        sNum := sNum + xStr[i];
  end;

  Result := StrToInt(sNum);
  
end;

function SoNumeros(const AStr: string): string;
const
   NUMEROS = '0123456789';
var
   I: integer;
begin
   for I := 1 to Length(AStr) do
      if AnsiPos(AStr[I], NUMEROS) > 0 then
         Result := Result + AStr[I];
end;

function InternalStrToInt(const AStr: string): integer;
begin
   try
      Result := StrToInt(SoNumeros(AStr));
   except
      on E: EConvertError do
         Result := 0;
   end;
end;

function RC_StrToFloat(xStr:String):Double;
begin
  if (Trim(xStr) = '') then begin
     Result := 0;
     Exit;
  end;
  try
    Result := StrToFloat(xStr);
  except
    Result := 0;
  end;
end;


function ReplaceStr(texto, str_localizar,

  str_substituir: string): string;

Var

  atual, str_encontrar, originalstr: pchar;

  str_novotexto: string;

  lenstr_localizar, lenstr_substituir, m, index: integer;

begin

  str_novotexto := texto;

  originalstr := pchar(texto);

  str_encontrar := pchar(str_localizar);

  lenstr_localizar := length(str_localizar);

  lenstr_substituir := length(str_substituir);

  atual := strpos(originalstr, str_encontrar);

  index := 0;

 

  while atual <> nil do

    begin

      m := atual - originalstr - index + 1;

      delete(str_novotexto, m, lenstr_localizar);

      insert(str_substituir, str_novotexto, m);

      inc(index, lenstr_localizar - lenstr_substituir);

      atual := strpos(atual + lenstr_localizar, str_encontrar);

    end;



  result := str_novotexto;

end;


function CalculaFatorVencimento( datIni, datFim : TDateTime ) : string;
Var dias : integer;
Begin
   dias := round(datFim - datIni);
   result := IntToStr(dias);
End;

function DV10Novo(strCodigo : String; cd_banco : integer) : string;
begin { DV10 }
end; { DV10 }

procedure SplitString(sBase, sQuebra: string; var slRetorno: TStringList);
begin
   TGeneral.SplitString(sBase, sQuebra, slRetorno);
end;

procedure JoinString(var sBase: String; const sQuebra: string; const sl: TStringList);
var
   I: Integer;
begin
   sBase := '';
   for I := 0 to sl.Count - 1 do
      if I < sl.Count-1 then
         sBase := sBase + sl[I] + sQuebra
      else
         sBase := sBase + sl[I];
end;

function DataDiif(DataInic, DataFin: TDateTime): LongInt;
begin
   Result := Trunc(DataFin - DataInic);
end;

function DataSoma(Data: TDateTime; DiasIncremento: Integer): TDateTime;
begin
   Result := (Data + DiasIncremento);
end;

function GetUserDirectoryAppData() : String;
var
    Registro: TRegistry;
begin
    Registro := TRegistry.Create();
    Registro.RootKey := HKEY_CURRENT_USER;
    Registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', False);
    Result := Registro.ReadString('AppData');
    FreeAndNil(Registro);
end;

function SetSystemDate(dtData: TDateTime): Boolean;
var
  SystemTime : TSystemTime;
begin
  with SystemTime do
  begin
    //Definindo o dia do sistema
    wYear:= StrToInt(FormatDateTime('yyyy', dtData));
    wMonth:= StrToInt(FormatDateTime('mm', dtData));;
    wDay:= StrToInt(FormatDateTime('dd', dtData));;
    //Definindo a hora do sistema
    wHour:= StrToInt(FormatDateTime('hh', dtData));; //hora
    wMinute:= StrToInt(FormatDateTime('nn', dtData));; //minutos
    wSecond:= StrToInt(FormatDateTime('ss', dtData));; //segundos
  end;
  //Colocar a hora e data do sistema
  Result := SetLocalTime(SystemTime);
end;


function ODBCInfo(sTipo: string): string;
const
   UNIMESTRE_SISTEMA: string = 'Software\ODBC\ODBC.INI\unimestre';
var
    reg: TRegistry;
    sValor: string;
begin
    reg := TRegistry.Create();
    reg.RootKey := HKEY_CURRENT_USER;
    if (reg.KeyExists(UNIMESTRE_SISTEMA)) then begin

      reg.OpenKey('Software\ODBC\ODBC.INI\unimestre', False);
      sValor := reg.ReadString(sTipo);

    end
    else begin
         reg.RootKey := HKEY_LOCAL_MACHINE;
         if (reg.KeyExists(UNIMESTRE_SISTEMA)) then begin
            reg.OpenKey('Software\ODBC\ODBC.INI\unimestre', False);
            sValor := reg.ReadString(sTipo);
         end
         else begin
            sValor := '' ;
         end;
    end;
    FreeAndNil(reg);
    Result := sValor;
end;

function ExtractWindowsDirectory(): string;
var
   Buffer: array[0..144] of Char;
begin
   GetWindowsDirectory(Buffer,144);
   Result := (StrPas(Buffer));
end;

function ExtractTempDirectory(): string;
var
   Buffer: array[0..144] of Char;
begin
   GetTempPath(144,Buffer);
   Result := (StrPas(Buffer));
end;

function ExtractSystemDirectory(): string;
var
   Buffer : array[0..144] of Char;
begin
   GetSystemDirectory(Buffer,144);
   Result := (StrPas(Buffer));
end;


function setODBCInfo(sODBC: string; slDados: TStringList): Boolean;
const
   REG_UNIMESTREODBC: string = 'Software\ODBC\ODBC.INI\';
var
   Reg: TRegistry;
begin
   Result := False;
   Reg := TRegistry.Create();
   try
      Reg.RootKey := HKEY_CURRENT_USER;

      if (Reg.KeyExists(REG_UNIMESTREODBC+sODBC)) then begin
         Reg.OpenKey(REG_UNIMESTREODBC+sODBC, False);
         Reg.WriteString('Server', slDados.Values['Servidor']);
         Reg.WriteString('Database', slDados.Values['Banco']);
         Reg.WriteString('Password', slDados.Values['Senha']);
         Reg.WriteString('User', slDados.Values['Usuario']);
         Reg.WriteString('Port', slDados.Values['Porta']);
         Result := True;
      end
      else begin
         Result := False;
      end;
      FreeAndNil(Reg);
   except
      FreeAndNil(Reg);
   end;
end;

function HexColorToDec(const HexColor: string): TColor;
var
   iRed, iGreen, iBlue: Byte;
begin
   try
      iRed := StrToInt('$'+ Copy(HexColor, 2, 2));
      iGreen := StrToInt('$'+ Copy(HexColor, 4, 2));
      iBlue := StrToInt('$'+ Copy(HexColor, 6, 2));
   except
      iRed := 0;
      iGreen := 0;
      iBlue := 0;
   end;
   Result := RGB(ired, iGreen, iBlue);
end;

function validaSenha(sSenha: string): boolean;
const
   MSG_PADRAO = 'A senha informada não respeita os padrões definido pela instituição para criação de senhas.';
var
   regExpr: TRegExpr;
   sExpr, sMsg: string;
   i: integer;
begin
   Result := true;
   sExpr := DM.variavel_parametro('senha_expr');
   sMsg := DM.variavel_parametro('senha_erro_msg');
   if Trim(sExpr) = '' then begin
      Exit;
   end;
   if Trim(sMsg) = '' then begin
      sMsg := MSG_PADRAO;
   end;
   regExpr := TRegExpr.Create;
   try
      regExpr.Expression := sExpr;
      try
         for i := 1 to Length(sSenha) do begin
            if not regExpr.Exec(Copy(sSenha, i, 1)) then begin
               Result := false;
               Mensagem(sMsg, 'Atenção!!');
               Exit;
            end;
         end;
         regExpr.LastError;
      except
         on E: ERegExpr do begin
            Result := false;
            Mensagem('Ocorreu um erro na validação da senha.'+#13+E.Message, 'Erro!!');
         end;
      end;
   finally
      regExpr.Free;
   end;
end;
{ Valida uma string que precisa ser um email }
function validaEmail( sEmail: string): boolean;
var
   regExpr: TRegExpr;
begin
   Result := true;
   regExpr := TRegExpr.Create;
   try
      regExpr.Expression := '[\w\d\-\.]+@[\w\d\-]+(\.[\w\d\-]+)+';
      try
         regExpr.InputString := sEmail;
         if not regExpr.Exec( sEmail ) then
         begin
            Result := false;
            Exit;
         end;

         regExpr.LastError;

      except
         on E: ERegExpr do begin
            Result := false;
            Mensagem('Ocorreu um erro na validação do E-mail.'+#13+E.Message, 'Erro!!');
         end;
      end;
   finally
      regExpr.Free;
   end;
end;

function validaTelefone( sTelefone: string): boolean;
var
   regExpr: TRegExpr;
   sExpr: string;
   i: integer;
begin
   Result := true;
   regExpr := TRegExpr.Create;
   sExpr:='[\d-\S]';
   try
      regExpr.Expression := sExpr;
      try
         for i := 1 to Length(sTelefone) do begin
            if not regExpr.Exec(Copy(sTelefone, i, 1)) then begin
               Result := false;
               Exit;
            end;
         end;
         regExpr.LastError;
      except
         on E: ERegExpr do begin
            Result := false;
            Mensagem('Ocorreu um erro na validação da senha.'+#13+E.Message, 'Erro!!');
         end;
      end;
   finally
      regExpr.Free;
   end;
end;

function IsNumericStr(const Value: string): Boolean;
var
   P: PChar;
begin
   P := PChar(Value);
   Result := True;
   while P^ <> #0 do
   begin
      if not (P^ in ['0'..'9']) then
      begin
         Result := False;
         Break;
      end;
      Inc(P);
   end;
end;

function BinToDec(const AValor: string): integer;
var
   I, LTam, BitCount: integer;
begin
   Result := 0;
   BitCount := 1;
   LTam := Length(AValor);
   for I := LTam downto 1 do
   begin
      if AValor[I] = '1' then
         Result := Result + BitCount;
      BitCount := BitCount * 2;
   end;
end;

function FileToHex(const AFilePath: string): string;
var
   I: integer;
   LSContent: string;
   LSlContent: TStringList;
begin
   LSlContent := TStringList.Create;
   try
      Result := '';
      LSlContent.LoadFromFile(AFilePath);
      LSContent := LSlContent.Text;
      for I := 1 to Length(LSContent) do
         Result := Result + IntToHex(Ord(LSContent[I]), 2);
   finally
      LSlContent.Free;
   end;
end;

// Abre links URL, no navegador padrão
procedure OpenURL(const URL: String);
begin
   ShellExecute(0, 'open', PAnsiChar(URL), nil, nil, SW_SHOW);
end;

procedure FullDBGridToClipBoard(var DBGrid: TDBGrid; PastHeader :Boolean; IdentacoesTabs: array of integer);
var
  StrToCopy, TabAux :string;
  I, IdxCol :Integer;
  SavedBookMark :TBookMark;
begin
  StrToCopy := '';
  if PastHeader then// se for para colar o nome das colunas...
  begin
    StrToCopy := DBGrid.Columns[0].Title.Caption;

    for IdxCol := 1 to DBGrid.Columns.Count -1 do
    begin
      TabAux := '';

      if IdxCol <= Length(IdentacoesTabs) then
      begin
         for I := 1 to IdentacoesTabs[IdxCol-1] do
            TabAux := TabAux + #9;
      end else begin
         TabAux := #9;
      end;

      StrToCopy := format('%s'+TabAux+'%s', [StrToCopy, DBGrid.Columns[IdxCol].Title.Caption]);
    end;

    StrToCopy := StrToCopy +#13#10;
  end;
  with DBGrid.DataSource.DataSet do  // utilizaremos o dataset do DBGrid - evidente...
  begin
    SavedBookMark := GetBookmark;  // salvamos a posição atual do cursor - linha selecionada no DBGrid
    DisableControls;  // evitamos que a movimentação no dataset provoque o scroll do DBGrid
    First;  // posicionamos no primeiro registro do dataset
    while not EOF do  // varremos todas as linhas no DBGrid
    begin
      StrToCopy := StrToCopy +DBGrid.Columns[0].Field.AsString;
      for IdxCol := 1 to DBGrid.Columns.Count -1 do
        StrToCopy := Format('%s'#9'%s', [StrToCopy, DBGrid.Columns[IdxCol].Field.AsString]);
      StrToCopy := StrToCopy +#13#10;
      Next;  // processando próxima linha...
    end;
    ClipBoard.Clear;  // limpamos o ClipBoard
    ClipBoard.SetTextBuf(PAnsiChar(StrToCopy));  // Copiamos o texto montado para o ClipBoard
    GotoBookMark(SavedBookMark);  // reposicionamos o cursor na linha em que estava antes do processo
    FreeBookMark(SavedBookMark);  // liberamos a memória alocada pelo BookMark
    EnableControls;
  end;
end;

procedure SelDBGridToClipBoard(var DBGrid: TDBGrid; PastHeader :Boolean);
var
  StrToCopy :string;
  Idx,
  IdxCol :Integer;
  SavedBookMark :TBookMark;
begin
  if DBGrid.SelectedRows.Count = 0 then // só processamos algo se houver linhas selecionadas
    Exit;
  StrToCopy := '';
  if PastHeader then// se for para colar o nome das colunas...
  begin
    StrToCopy := DBGrid.Columns[0].Title.Caption;
    for IdxCol := 1 to DBGrid.Columns.Count -1 do
      StrToCopy := format('%s'#9'%s', [StrToCopy, DBGrid.Columns[IdxCol].Title.Caption]);
    StrToCopy := StrToCopy +#13#10;
  end;
  with DBGrid.DataSource.DataSet do  // utilizaremos o dataset do DBGrid - evidente...
  begin
    SavedBookMark := GetBookmark;  // salvamos a posição atual do cursor - linha selecionada no DBGrid
    DisableControls;  // evitamos que a movimentação no dataset provoque o scroll do DBGrid
    for Idx := 0 to DBGrid.SelectedRows.Count -1 do // percorreremos todas as linhas selecionadas
    begin
      GotoBookMark(Pointer(DBGrid.SelectedRows[Idx])); // posicionando na linha a ser exportada
      StrToCopy := StrToCopy +DBGrid.Columns[0].Field.AsString;
      for IdxCol := 1 to DBGrid.Columns.Count -1 do
        StrToCopy := Format('%s'#9'%s', [StrToCopy, DBGrid.Columns[IdxCol].Field.AsString]);
      StrToCopy := StrToCopy +#13#10;
    end;
    ClipBoard.Clear;  // limpamos o ClipBoard
    ClipBoard.SetTextBuf(PAnsiChar(StrToCopy));  // Copiamos o texto montado para o ClipBoard
    GotoBookMark(SavedBookMark);  // reposicionamos o cursor na linha em que estava antes do processo
    FreeBookMark(SavedBookMark);  // liberamos a memória alocada pelo BookMark
    EnableControls;
  end;
end;

procedure StringToClipBoard(const texto: String);
begin
   Clipboard.AsText := texto;
end;

procedure SetCtrlC(const texto: String);
begin
   StringToClipBoard( texto );
end;

function GetCtrlC(): String;
begin
   Result := Clipboard.AsText;
end;

function IncNumericStr(const Value: AnsiString): AnsiString;
begin
   if IsNumericStr(Value) then
      Result := Format('%d', [StrToInt(Value) + 1])
   else
      Result := Value;
end;


function GetFuncaoEvento(const objeto: TObject;
  const ds_evento: String = 'OnClick'): String;
var
   I: Integer;
   Method: TMethod;
   Prop: PPropInfo;
   PropList: PPropList;
   PropCount: Integer;
begin
   PropCount := GetPropList(objeto, PropList);

   Result := '';

   for I := Low(PropList^) to PropCount - 1 do
   begin
      if (PropList^[I] <> nil) AND (PropList^[I].Name = ds_evento) then
      begin
         Prop := GetPropInfo(objeto, PropList^[I].Name);

         if Prop.PropType^.Kind = tkMethod then
         begin
            Method := GetMethodProp(objeto, PropList^[I].Name);
            Result := TComponent(objeto).Owner.MethodName(Method.Code);
         end;
      end;            
   end;
end;

function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido
    aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '" ' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);

  { Aguarda até ser finalizado }
  if Result then begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
    { Libera os Handles }
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;

function DateTimeToString(const data: TDateTime): String;
begin
   Result := TGeneral.DateTimeToString(data);
end;

{ TUMHackDbGrid }

procedure TUMHackDbGrid.SetEditText(const Value: string);
begin
   inherited SetEditText(-1, -1, Value);
end;

initialization
  try
    Tradutor := TUMTradutor.Create();
    
  { Diretório do Windows }
    strWindows := ExtractWindowsDirectory();

    MyBitmap := nil;
  except
    MyBitmap := nil;
  end;

finalization
  try
  if MyBitmap <> nil then MyBitmap.Free;
  FreeAndNil(Tradutor);

  except
  end;

end.


