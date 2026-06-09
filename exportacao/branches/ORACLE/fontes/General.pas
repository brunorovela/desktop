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
     DbTables, Db, Classes;

type
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


implementation

uses uDm, Registry, Grids;

function Mensagem(sMensagem: string; sTitulo: string = ''; iOpcoes: LongInt = -1; iHandle: Integer = -1): Integer;
var
  h: Integer;
begin
  if (iHandle < 0) then begin
    h := Application.Handle;
  end
  else begin
    h := iHandle;
  end;
  if (sTitulo = '') then begin
    sTitulo := 'UniMestre';
  end;
  if (iOpcoes = -1) then begin
    iOpcoes := MB_OK + MB_ICONINFORMATION;
  end;
  iOpcoes := iOpcoes + MB_TOPMOST + MB_DEFBUTTON1 + MB_APPLMODAL;

  Result := MessageBox( h, PChar(sMensagem), PChar(sTitulo), iOpcoes);
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


initialization

finalization

end.


