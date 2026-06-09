unit General;

interface

uses SysUtils, Forms, Controls, Windows, IniFiles, Graphics, extCtrls, stdCtrls,
     DbTables,Db, Classes, Registry, uRegExpr;

type
 TCryptTypes = (ctEncode, ctDecode);
 TCharSet = Set of Char;
 Buffer = array of Byte;
     

var
  acRetorno : array[0..511] of Char;
  MyBitmap : TBitmap;
  iniBitmap : String;
  iniWMestre : TIniFile;

const

  eKeyViol = 9729;
  eRequiredFieldMissing = 9732;
  eForeignKey = 9733;
  eDetailsExist = 9734;
  gaDiasSemana :Array[1..6] of String[7] = ('Segunda','Terça','Quarta','Quinta','Sexta','Sábado');
  giNrAulas = 4;
  giNrDiasSemana = 5;


  intDV43 : Array[1..43] of Byte =
    ( 4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,
      9,8,7,6,5,4,3,2 );

  intDVBB : Array[1..11] of Byte = ( 7,8,9,2,3,4,5,6,7,8,9 );

  intDV10 : Array[1..10] of Byte = ( 1,2,1,2,1,2,1,2,1,2 );

  DaysPerMonth: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);


function Mensagem( strMensagem, strTitulo : String; lngType : Longint ) : Integer;
function PCopy( str : String ) : PChar;
function Extenso( valor, retorno : Pchar ) : Integer; far; stdcall; external 'extens32.dll' index 1;
function DV10( strCodigo : String ) : String;
function DV10BB( strCodigo : String ) : String;
function DV44( strCodigo : String ) : String;
function DV440( strCodigo : String ) : String;
function DV11BB( strCodigo : String ) : String;
function ValidaCPF( strCPF : String ) : Boolean;
procedure Converte( dblValor: Double );
function Meses( datIni, datFim : TDateTime ) : Word;
function Maior21( datNasc, datHoje : TDateTime ) : Boolean;
function Maior18( datNasc, datHoje : TDateTime ) : Boolean;
function RoundFloat (AFloat : Double; ADigits : byte) : Double;
function RoundUp( AFloat: Double ): Double;
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
function ODBCInfo(sTipo: string): string;
function VerificaInicializacao(sCaminho,sChave:string) : boolean;
procedure RegistraInicializacao(sCaminho,sChave:string);
procedure CancelaInicializacao(sCaminho,sChave:string);
function validaSenha(sSenha: string): boolean;
function UMCrypt(sText: string; Action: TCryptTypes = ctEncode; Key: string = ''): string;

implementation

uses uDm;

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


function Meses( datIni, datFim : TDateTime ) : Word;
var
  nIni, nFim, n : Integer;
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

function Mensagem( strMensagem, strTitulo : String; lngType : Longint ) : Integer;
var
  pAux1, pAux2 : PChar;
begin
   pAux1 := strAlloc( Length( strMensagem ) + 1 );
   pAux2 := strAlloc( Length( strTitulo ) + 1 );
   strPCopy( pAux1, strMensagem );
   strPCopy( pAux2, strTitulo );
   Result := MessageBox( Application.Handle, pAux1, pAux2, lngType );
   strDispose( pAux1 );
   strDispose( pAux2 );
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
  i, n : Integer;
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

function DV10( strCodigo : String ) : String;
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
      strAux := Copy( IntToStr( intMul ), 1, 2 );
      intMul := StrToInt( strAux[1] ) + StrToInt( strAux[2] );
    end;
    intSoma := intSoma + intMul;
    Dec( n, 1 );
    if n = 0 then Break;
  end;
  intDV := 10 - ( intSoma mod 10 );
  if intDV = 10 then intDV := 0;
  except
    Exit;
  end;
  Result := IntToStr( intDV );
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



function ValidaCPF( strCPF : String ) : Boolean;
var
  strCPF1, strCPF2 : String;
  n : Byte;
  intSoma : Integer;
  flgDig1, flgDig2 : Boolean;
begin
  Result := False;
  try
  flgDig1 := False;
  flgDig2 := False;
  while Pos( ',', strCPF ) <> 0 do Delete( strCPF, Pos( ',', strCPF ), 1 );
  while Pos( '.', strCPF ) <> 0 do Delete( strCPF, Pos( '.', strCPF ), 1 );
  while Pos( '-', strCPF ) <> 0 do Delete( strCPF, Pos( '-', strCPF ), 1 );
  if Length( strCPF ) <> 11 then Exit;
  strCPF1 := Copy( strCPF, 1, 9 );
  strCPF2 := Copy( strCPF, 1, 10 );

  { TESTA DIGITO 1 }
  intSoma := 0;
  for n := 1 to Length( strCPF1 ) do
   intSoma := intSoma + ( StrToInt( strCPF1[n] ) * ( 10 - n + 1 ) );
  intSoma := intSoma - ( ( intSoma div 11 ) * 11 );
  if intSoma < 2 then intSoma := 0 else intSoma := 11 - intSoma;
  if IntToStr( intSoma ) = Copy( strCPF, 10, 1 ) then flgDig1 := True;

  { TESTA DIGITO 2 }
  intSoma := 0;
  for n := 1 to Length( strCPF2 ) do
   intSoma := intSoma + ( StrToInt( strCPF2[n] ) * ( 11 - n + 1 ) );
  intSoma := intSoma - ( ( intSoma div 11 ) * 11 );
  if intSoma < 2 then intSoma := 0 else intSoma := 11 - intSoma;
  if IntToStr( intSoma ) = Copy( strCPF, 11, 1 ) then flgDig2 := True;
  except
    Result := False;
  end;
  Result := flgDig1 and flgDig2;
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

function FillString( str: String; alAlign: TAlign; chChar: Char;
  intSize: Integer; RemoveSinais : Boolean ) : String;
var
  n : Integer;
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



function CalculaFatorVencimento( datIni, datFim : TDateTime ) : string;
Var dias : integer;
Begin
   dias := round(datFim - datIni);
   result := IntToStr(dias);
End;

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

function VerificaInicializacao(sCaminho,sChave:string) : boolean;
var
  reg : TRegistry;
  s, s2 : string;
begin

  Reg:=TRegistry.Create();

  S := ExtractFileDir(sCaminho);
  S2 := ExtractFileName(sCaminho);
  S := S + '\' + S2;

  reg.RootKey := HKEY_USERS;
  reg.Openkey('\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run', false);

  Result := reg.ReadString(sChave) = sCaminho;

end;

procedure RegistraInicializacao(sCaminho, sChave:string);
var
  reg : TRegIniFile;
  s, s2 : string;
begin

  Reg:=TRegIniFile.Create('UniMestre');

  S := ExtractFileDir(sCaminho);
  S2 := ExtractFileName(sCaminho);
  S := S + '\' + S2;

  reg.RootKey := HKEY_USERS;
  reg.Openkey('\.DEFAULT\Software\Microsoft\Windows\CurrentVersion', false);
  reg.WriteString('Run', sChave, s);

end;

procedure CancelaInicializacao(sCaminho, sChave:string);
var
  reg : TRegIniFile;
  s, s2 : string;
begin

  Reg:=TRegIniFile.Create('UniMestre');

  S := ExtractFileDir(sCaminho);
  S2 := ExtractFileName(sCaminho);
  S := S + '\' + S2;

  reg.RootKey := HKEY_USERS;
  reg.Openkey('\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run', false);
  reg.DeleteValue(sChave);

  FreeAndNil(reg);

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
         for i := 0 to Length(sSenha) - 1 do begin
            if not regExpr.Exec(Copy(sSenha, i, 1)) then begin
               Result := false;
               Mensagem(sMsg, 'Atenção!!', MB_ICONINFORMATION);
               Exit;
            end;
         end;
         regExpr.LastError;
      except
         on E: ERegExpr do begin
            Result := false;
            Mensagem('Ocorreu um erro na validação da senha.'+#13+E.Message, 'Erro!!', MB_ICONERROR);
         end;
      end;
   finally
      regExpr.Free;
   end;
end;

initialization

  try
    iniWMestre := TIniFile.Create( 'WMESTRE.INI' );
    iniBitmap := iniWMestre.ReadString( 'Configuracoes', 'Bitmap', 'C:\WINDOWS' );

    MyBitmap := TBitmap.Create;
    MyBitmap.LoadFromFile( iniBitmap );
  except
    MyBitmap := nil;
  end;

finalization
  try
  if iniWMestre <> nil then iniWMestre.Free;
  if MyBitmap <> nil then MyBitmap.Free;
  except
  end;
end.

