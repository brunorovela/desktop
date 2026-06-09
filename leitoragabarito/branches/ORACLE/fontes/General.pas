{
#TIT= Arquivo contendo apenas funções e procedures
#OBJ= Todas as principais Funções e Procedures
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit General;

interface

uses SysUtils, Forms, Controls, Windows, IniFiles, Graphics, extCtrls, stdCtrls,
     DbTables, Db, Classes, StrUtils, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
   TCryptTypes = (ctEncode, ctDecode);
   TDatePart = (dpSegundo, dpMinuto, dpHora, dpDia, dpAno);

var
  acRetorno : array[0..511] of Char;
  MyBitmap : TBitmap;
  iniBitmap : String;
  iniWMestre : TIniFile;
  pWindows : PChar;

const

  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;
  gaDiasSemana :Array[1..6] of String[7] = ('Segunda','Terça','Quarta','Quinta','Sexta','Sábado');
  giNrAulas = 4;
  giNrDiasSemana = 5;



  function Mensagem(sMensagem: string; sTitulo: string = ''; iOpcoes: LongInt = -1; iHandle: Integer = -1): Integer;
  function PCopy( str : String ) : PChar;
  function RoundFloat (AFloat : Double; ADigits : byte) : Double;
  function RoundUp( AFloat: Double ): Double;
  function SemAcento( str : String ) : String;
  function FillString( str: String; alAlign: TAlign; chChar: Char; intSize: Integer; RemoveSinais : Boolean ) : String;
  function RC_StrToInt(xStr:String):Integer;
  function RC_StrToFloat(xStr:String):Double;
  procedure PapelParede(Sender: TObject);
  procedure TrataErroBanco(DataSet: TDataSet;E: EDatabaseError);

  function DataSoma(Data: TDateTime; Tempo: Integer; dpTipo: TDatePart): TDateTime;

  function SetSystemDate(dtData: TDateTime): Boolean;
  {*
    Função:
      setBloqueio(bStatus: Boolean): Integer;

    Bloqueia as Teclas CTRL + ALT + DEL, CTRL + ESC entre outras e também
    esconde a barra de tarefas

    Parametros:
      bSatus: Boolean = Estado do Bloqueio (Ligado / Desligado)
  *}
  procedure setBloqueio(bStatus: Boolean);
  procedure setBloqTeclas(bStatus: Boolean);
  procedure setBloqTaskBar(bStatus: Boolean);
  procedure setBloqTaskMgr(bStatus: Boolean);

  function getTeclaEstado(iTecla: Integer): Boolean;

  function soNumeros(sTexto: string): string;

  function splitstr(valor, caracter: string; index: integer): string; overload;
  function splitstr(sBase, sQuebra: string): TStringList; overload;

  function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;

  function SortChar(sTexto: string): string;
  function ReplaceStr (texto, str_localizar, str_substituir: string) : string;

  function UMCrypt(sText: string; Action: TCryptTypes = ctEncode; Key: string = ''): string;

implementation

uses uDm, Registry, Grids;

function Mensagem(sMensagem: string; sTitulo: string = ''; iOpcoes: LongInt = -1; iHandle: Integer = -1): Integer;
var
  h: Integer;
begin
  if (iHandle < 0) then begin
    h := Application.Handle;
  end
  else
  begin
     h := iHandle;
  end;
  if (sTitulo = '') then begin
    sTitulo := 'UniMestre';
  end;
  if (iOpcoes = -1) then begin
    iOpcoes := MB_OK + MB_ICONINFORMATION;
  end;
  iOpcoes := iOpcoes + MB_TOPMOST + MB_DEFBUTTON1 + MB_APPLMODAL;

  Result := MessageBox( h, PChar(sMensagem), PChar(sTitulo), iOpcoes );
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


function RoundFloat (AFloat : Double; ADigits : byte) : Double;
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

function SemAcento( str : String ) : String;
var
  n : Byte;
const
  strCom : Array[0..23] of Char =
    ( 'Á', 'À', 'Ã', 'Ä', 'Â',
      'É', 'È', 'Ë', 'Ê',
      'Í', 'Ì', 'Ï', 'Î',
      'Ó', 'Ò', 'Õ', 'Ö', 'Ô',
      'Ú', 'Ù', 'Ü', 'Û',
      'Ç', 'Ñ' );
  strSem : Array[0..23] of Char =
    ( 'A', 'A', 'A', 'A', 'A',
      'E', 'E', 'E', 'E',
      'I', 'I', 'I', 'I',
      'O', 'O', 'O', 'O', 'O',
      'U', 'U', 'U', 'U',
      'C', 'N' );

begin

  for n := Low( strCom ) to High( strCom ) do
  begin
    while Pos( strCom[n], str ) <> 0 do
      if Pos( strCom[n], str ) > 0 then str[Pos(strCom[n],str)] := strSem[n];
  end;
  Result := str;

end;

function FillString( str: String; alAlign: TAlign; chChar: Char; intSize: Integer; RemoveSinais : Boolean ) : String;
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



function RC_StrToInt(xStr:String):Integer;
begin
  try
    Result := StrToInt(xStr);
  except
    Result := 0;
  end;
end;

function RC_StrToFloat(xStr:String):Double;
begin
  try
    Result := StrToFloat(xStr);
  except
    Result := 0;
  end;
end;

procedure setBloqueio(bStatus: Boolean);
begin
  setBloqTeclas(bStatus);
  setBloqTaskBar(bStatus);
  setBloqTaskMgr(bStatus);
end;

procedure setBloqTeclas(bStatus: Boolean);
var
  iOldValue: Longint;
begin
  SystemParametersInfo(SPI_SCREENSAVERRUNNING, Word(bStatus), @iOldValue, 0);
  SystemParametersInfo(SPI_SETFASTTASKSWITCH, Word(bStatus), @iOldValue, 0);
end;

procedure setBloqTaskBar(bStatus: Boolean);
var
  iValue: Integer;
begin
  if bStatus then
    iValue := SW_HIDE
  else
    iValue := SW_SHOWNA;

  ShowWindow(FindWindow('Shell_TrayWnd',nil), iValue) ;
end;


procedure setBloqTaskMgr(bStatus: Boolean);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create();
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Policies\System', True);
    if bStatus then
      Reg.WriteString('DisableTaskMgr', '1')
    else
      Reg.DeleteValue('DisableTaskMgr');
    Reg.CloseKey();
  except
    FreeAndNil(Reg);
    Exit;
  end;
  FreeAndNil(Reg);
end;

function getTeclaEstado(iTecla: Integer): Boolean;
begin
  Result := Odd (GetKeyState (iTecla));

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

function soNumeros(sTexto: string): string;
var
  i: Integer;
  sRet: string;
begin
  for i := 1 to Length(sTexto) do
  begin
    if ((Ord(sTexto[i]) > 47) and (Ord(sTexto[i]) < 58)) then
    begin
      sRet := sRet + sTexto[i];
    end;
  end;
  Result := sRet;
end;

function DataSoma(Data: TDateTime; Tempo: Integer; dpTipo: TDatePart): TDateTime;
var
  iTempo: Integer;
  iVal,iVal2: Integer;
  dTempo: Double;
begin
  iVal := 0;
  iVal2 := 1;
  iTempo := 0;
  dTempo := 0;
  case dpTipo of
    dpSegundo:
    begin
      iVal := 86400; iVal2 := 1;
    end;
    dpMinuto:
    begin
      iVal := 1440; iVal2 := 60;
    end;
    dpHora:
    begin
      iVal := 24; iVal2 := 3600;
    end;
    dpDia:
    begin
      iVal := -1; iVal2 := 1;
    end;
    dpAno:
    begin
      iVal := -365; iVal2 := 1;
    end;
  end;

  Tempo := iVal2 * Tempo;

  //calcula em segundos e dias
  if (iVal < 0) then
  begin
    dTempo := Abs(iVal) * Tempo;
  end
  else if (Abs(Tempo) >= Abs(iVal)) then
  begin
    dTempo := Abs(Tempo) mod iVal;
    iTempo := Abs(Tempo) div iVal;
  end
  else
  begin
    iTempo := Tempo;
  end;

  //converte segundos em fracional
  dTempo := dTempo + (iTempo / 84600);

  if Tempo > 0 then
    Result := Data + dTempo
  else
    Result := Data - dTempo;
end;

function splitstr(valor, caracter: string; index: integer): string;
var
anterior,i,contador:integer;
begin
contador:=0;
for i:=0 to length(valor) do
begin
  if valor[i]=caracter then
  begin
  if (contador = index-1) then
  begin
  result:=copy(valor,anterior+1,i-anterior-1);
  exit;
  end;
  anterior:=i;
  inc(contador,1);
  end;
 
  if i=length(valor) then
  begin
  result:=copy(valor,anterior+1,i-anterior);
  exit;
  end;
 
  if index=1 then
  begin
  result:=copy(valor,0,pos(caracter,valor)-1);
  exit;
  end;
end;
end;

   function splitstr(sBase, sQuebra: string): TStringList;
   var
      EndOfCurrentString: Integer;
   begin
      Result := TStringList.Create();
      repeat
         EndOfCurrentString := Pos(sQuebra, sBase);
         if EndOfCurrentString = 0 then begin
            Result.Add(sBase);
         end
         else begin
            Result.Add(Copy(sBase, 1, EndOfCurrentString - 1));
         end;
         sBase := Copy(sBase, EndOfCurrentString + Length(sQuebra), Length(sBase) - EndOfCurrentString);
      until EndOfCurrentString = 0;
   end;


function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
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

function SortChar(sTexto: string): string;
var
   i, y, z: Integer;
   sChar: Char;
   sAux: string;
begin
   sAux := DupeString(' ', Length(sTexto));
   for i := 1 to (Length(sTexto)) do begin
      y := 1;
      sChar := sTexto[i];
      for z := 1 to (Length(sTexto)) do begin
         if (z <> i) then begin
            if ((sChar > sTexto[z])) then begin
               Inc(y);
            end;
         end;
      end;
      while(sChar = sAux[y]) do begin
         Inc(y);
      end;
      sAux[y] := sChar;
   end;
   Result := sAux;
end;

function UMCrypt(sText: string; Action: TCryptTypes = ctEncode; Key: string = ''): string;
   var
     Dest: String;
     KeyLen,KeyPos,OffSet,SrcPos: Integer;
     TmpSrcAsc,Range,SrcAsc: Integer;
   begin
     if Key = '' then
       Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';

     Dest := '';
     KeyLen := Length(Key);
     KeyPos := 0;
     Range := 256;
     if (Length(sText) <= 0) Then
     begin
       Dest := '';
     end
     else if Action = ctEncode then
     begin
       Randomize;
       OffSet := Random(Range);
       Dest := Format('%1.2x',[OffSet]);
       for SrcPos := 1 to Length(sText) do
       begin
         SrcAsc := (Ord(sText[SrcPos]) + OffSet) Mod 255;
         if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
         SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         Dest := Dest + Format('%1.2x',[SrcAsc]);
         OffSet := SrcAsc;
       end;
     end
     else if Action = ctDecode then
     begin
       OffSet := StrToInt('$'+ Copy(sText,1,2));
       SrcPos := 3;
       repeat
         SrcAsc := StrToInt('$'+ Copy(sText,SrcPos,2));
         if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
         TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
         else TmpSrcAsc := TmpSrcAsc - OffSet;
         Dest := Dest + Chr(TmpSrcAsc);
         OffSet := SrcAsc;
         SrcPos := SrcPos + 2;
       until (SrcPos >= Length(sText));
     end;
     Result:= Dest;
   end; //FUNÇÃO Crypt

initialization

  try

    pWindows := strAlloc( 144 );
    GetWindowsDirectory( pWindows, 144 );

    iniWMestre := TIniFile.Create( 'WMESTRE.INI' );
    iniBitmap := iniWMestre.ReadString( 'Configuracoes', 'Bitmap', strPas( pWindows ) );

    MyBitmap := TBitmap.Create;
    MyBitmap.LoadFromFile( iniBitmap );
  except
    MyBitmap := nil;
  end;

finalization
  try
  if iniWMestre <> nil then iniWMestre.Free;
  if MyBitmap <> nil then MyBitmap.Free;
  setBloqueio(False);

  except
  end;

end.


