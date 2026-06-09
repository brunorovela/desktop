unit General;

interface

uses SysUtils, Forms, Controls, Windows, IniFiles, Graphics, extCtrls, stdCtrls,
     DbTables,Db, Classes, Registry, Math, StrUtils, uRegExpr, DateUtils,
     Mask, Dialogs, DBGrids, Clipbrd, TypInfo,Grids, ShellAPI, ActiveX,
     WideStrings, Contnrs;

type
 TCryptTypes = (ctEncode, ctDecode);
 TCharSet = Set of Char;

var
  acRetorno : array[0..511] of Char;
  MyBitmap : TBitmap;
  iniBitmap : String;
  iniWMestre : TIniFile;
  pWindows : PChar;
  strPrograma : String;

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

   function PCopy( str : String ) : PChar;
   function Extenso( valor, retorno : Pchar ) : Integer; far; stdcall; external 'extens32.dll' index 1;
   function DV10BB( strCodigo : String ) : String;

   function DV10( ds_codigo, cd_banco : string ) : String;
   function DV11( ds_codigo, cd_tipo, cd_banco : string ) : String;
   function DVA2( ds_codigo, cd_tipo, cd_banco : string ) : String;
   function DV44( strCodigo : String ) : String;
   function DV440( strCodigo : String ) : String;
   function DV11BB( strCodigo : String ) : String;

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

   // Função para copiar as informações de um DBGrid para o CTRL + C
   procedure FullDBGridToClipBoard(var DBGrid: TDBGrid; PastHeader :Boolean; IdentacoesTabs: array of integer);
   procedure SelDBGridToClipBoard(var DBGrid: TDBGrid; PastHeader :Boolean);
   procedure StringToClipBoard(const texto: String);
   procedure SetCtrlC(const texto: String);
   function GetCtrlC(): String;
   function IncNumericStr(const Value: AnsiString): AnsiString;
   function IsNumericStr(const Value: string): Boolean;

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
   function UMCrypt(sText: string; Action: TCryptTypes = ctEncode; Key: string = ''): string;
   function OnlyChars(sTexto: string; sValidos: string): string; overload;
   function OnlyChars(sTexto: string; sValidos: TCharSet): string; overload;
   function HexColorToDec(const HexColor: string): TColor;
   procedure ChangeChecked(ACheckBox: TCheckBox; AState: Boolean);
   function validaSenha(sSenha: string): boolean;
   function validaEmail( sEmail: string): boolean;
   function validaTelefone( sTelefone: string): boolean;
   function IsStringNumerica(const AValor: string): boolean;
   function BinToDec(const AValor: string): integer;
   function InternalStrToInt(const AStr: string): integer;
   function SoNumeros(const AStr: string): string;
   function ConcatStrings(const ASlStrings: TStringList;
      const ASSeparador: string): string;
implementation

uses uDm, Messages;

function ConcatStrings(const ASlStrings: TStringList;
   const ASSeparador: string): string;
var
   I: integer;
begin
   Result := '';
   for I := 0 to ASlStrings.Count - 1 do
   begin
      if Result <> '' then
         Result := Result + ASSeparador;
      Result := Result + ASlStrings.Strings[I];
   end;
end;

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

   {**
      Função de
      Descricao
    }
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

procedure ChangeChecked(ACheckBox: TCheckBox; AState: Boolean);
begin
  ACheckBox.Perform(BM_SETCHECK, Ord(AState), 0);
end;

function Mensagem(sMensagem: string; sTitulo: string = ''; iOpcoes: LongInt = -1; iHandle: Integer = -1): Integer;
var
  h: Integer;
begin
  if (iHandle < 0) then begin
    h := Application.Handle;
  end
  else
    h := iHandle;
  if (sTitulo = '') then begin
    sTitulo := 'UNIMESTRE';
  end;
  if (iOpcoes = -1) then begin
    iOpcoes := MB_OK + MB_ICONINFORMATION;
  end;
  iOpcoes := iOpcoes + MB_TOPMOST + MB_DEFBUTTON1; 

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
var
  n : Byte;
const
  strCom : Array[0..42] of Char =
    ( 'Á', 'À', 'Ã', 'Ä', 'Â',
      'É', 'È', 'Ë', 'Ê',
      'Í', 'Ì', 'Ï', 'Î',
      'Ó', 'Ò', 'Õ', 'Ö', 'Ô',
      'Ú', 'Ù', 'Ü', 'Û',
      'Ç', 'Ñ', 'á', 'é', 'í', 'ó', 'ú', 'ã', 'õ', 'à', 'è', 'ì', 'ò', 'ù',
      'ä','ë','ï','ö','ü', 'ç', 'ñ' );
  strSem : Array[0..42] of Char =
    ( 'A', 'A', 'A', 'A', 'A',
      'E', 'E', 'E', 'E',
      'I', 'I', 'I', 'I',
      'O', 'O', 'O', 'O', 'O',
      'U', 'U', 'U', 'U',
      'C', 'N', 'a', 'e', 'i', 'o', 'u', 'a', 'o', 'a', 'e', 'i', 'o', 'u',
      'a','e','i','o','u', 'c', 'n'  );

begin

  for n := Low( strCom ) to High( strCom ) do
  begin
    while Pos( strCom[n], str ) <> 0 do
      if Pos( strCom[n], str ) > 0 then str[Pos(strCom[n],str)] := strSem[n];
  end;
  Result := str;
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
var
   EndOfCurrentString: Integer;
begin
   slRetorno.Clear();
   repeat
      EndOfCurrentString := Pos(sQuebra, sBase);
      if EndOfCurrentString = 0 then begin
         slRetorno.Add(sBase);
      end
      else begin
         slRetorno.Add(Copy(sBase, 1, EndOfCurrentString - 1));
      end;
      sBase := Copy(sBase, EndOfCurrentString + Length(sQuebra), Length(sBase) - EndOfCurrentString);
   until EndOfCurrentString = 0;
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
   sExpr, sMsg: string;
   i: integer;
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
   sExpr, sMsg: string;
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

function IsStringNumerica(const AValor: string): boolean;
var
   P: PChar;
begin
   P := PChar(AValor);
   Result := true;
   while P^ <> #0 do
   begin
      if not (P^ in['0'..'9']) then
      begin
         Result := false;
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

initialization


  try
      strPrograma := ExtractFilePath(Application.ExeName);

      iniWMestre := TIniFile.Create(strPrograma + '\unimestre.ini' );
//    iniBitmap := iniWMestre.ReadString( 'Configuracoes', 'Bitmap', strWindows + '\areia.bmp' );

//    MyBitmap := TBitmap.Create;
//    MyBitmap.LoadFromFile( iniBitmap );
    MyBitmap := nil;
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



