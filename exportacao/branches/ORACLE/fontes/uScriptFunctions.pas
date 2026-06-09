unit uScriptFunctions;

interface

uses
   SysUtils, Forms, Controls, Windows, IniFiles, Graphics, Classes,
   StrUtils, uPSRuntime, uPSComponent, DateUtils, Math, Variants, Dialogs;

const
  intDV43 : Array[1..43] of Byte = (4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2);
  intDVBB : Array[1..11] of Byte = (7,8,9,2,3,4,5,6,7,8,9);
  intDV11_2_9 : Array[1..43] of Byte = (4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2,9,8,7,6,5,4,3,2);
  intDV11_9_2 : Array[1..43] of Byte = (7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9,2,3,4,5,6,7,8,9);
  intDV11_2_7 : Array[1..43] of Byte = (2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2,7,6,5,4,3,2);
  intDV10 : Array[1..10] of Byte = ( 1,2,1,2,1,2,1,2,1,2 );


//   procedure GetFunctions();
   procedure PSAddFunctions(var PS: TPSScript);

   procedure PSGetAllFunctions(var slDados: TStringList);
   function Esquerda(sTexto: Variant; iQtd: Variant): string;
   function Direita(sTexto: Variant; iQtd: Variant): string;
   function Meio(sTexto: Variant; Posicao,  iQtd: Variant): string;
   function Tamanho(sTexto: Variant): Integer;
   function Maiuscula(sTexto: Variant): string;
   function Minuscula(sTexto: Variant): string;
   function Substituir(sTexto: Variant; OldValue: Variant; NewValue: Variant): string;
   function TiraEspaco(sTexto: Variant): string;
   function TiraEspacoEsquerda(sTexto: Variant): string;
   function TiraEspacoDireita(sTexto: Variant): string;
   function SoCaracteres(sTexto: Variant; Caracteres: Variant): string;

   //Matemáticas
   function Soma(iNumero1: Variant; iNumero2: Variant): string;
   function Subtrai(iNumero1: Variant; iNumero2: Variant): string;
   function Divide(iNumero1: Variant; iNumero2: Variant): string;
   function RestoDiv(iNumero1: Variant; iNumero2: Variant): string;
   function DivNumero(iNumero1: Variant; iNumero2: Variant): string;
   function Potencia(iNumero1: Variant; iNumero2: Variant): string;
   function Multiplica(iNumero: Variant; iNumero2: Variant): string;
   function Maior(iNumero1: Variant; iNumero2: Variant): string;
   function Menor(iNumero1: Variant; iNumero2: Variant): string;
   function Media(iNumero1: Variant; iNumero2: Variant): string;
   function FormataNumero(sTexto: Variant; sFormato: Variant): string;

   //Datas
   function FormataData(sTexto: Variant; sData: Variant): string;
   function Dia(sData: Variant): string;
   function Mes(sData: Variant): string;
   function Ano(sData: Variant): string;
   function Hora(sData: Variant): string;
   function Minuto(sData: Variant): string;
   function Segundo(sData: Variant): string;
   function DiaDaSemana(sData: Variant): string;
   function DiaDoAno(sData: Variant): string;
   function SomaData(sData1: Variant; sData2: Variant): string;
   function DifData(sData1: Variant; sData2: Variant): string;
   function DiferencaDias(sData1: Variant; sData2: Variant): String;
   function Hoje(): string;

   //Gerais
   //function Maiuscula(sTexto: Variant): string;
   //function Minuscula(sTexto: Variant): string;

   //Financeiras
   function DV10(ds_codigo, cd_banco: Variant): string;
   function DV10BB(strCodigo: Variant): string;
   function DV11(ds_codigo, cd_tipo, cd_banco: Variant): string;
   function DV11BB(strCodigo: Variant): string;
   function DV44(strCodigo: Variant): string;
   function DV440(strCodigo: Variant): string;
   /////////////////
   //internas
   //////////////////
   function ToDateTime(sTexto: Variant): TDateTime;
   function ToExtended(sNumero: Variant): Extended;
   function VariantToType(vVariant: Variant; varType: Word): Variant;

implementation

procedure PSAddFunctions(var PS: TPSScript);
begin
   with PS do begin
      //String
      AddFunction(@Esquerda, 'function Esquerda(sTexto: Variant; iQtd: Variant): string;');
      AddFunction(@Direita, 'function Direita(sTexto: Variant; iQtd: Variant): string;');
      AddFunction(@Meio, 'function Meio(sTexto: Variant; Posicao,  iQtd: Variant): string;');
      AddFunction(@Tamanho, 'function Tamanho(sTexto: Variant): Integer;');
      AddFunction(@Maiuscula, 'function Maiuscula(sTexto: Variant): string;');
      AddFunction(@Minuscula, 'function Minuscula(sTexto: Variant): string;');
      AddFunction(@Substituir, 'function Substituir(sTexto: Variant; OldValue: Variant; NewValue: Variant): string;');
      AddFunction(@TiraEspaco, 'function TiraEspaco(sTexto: Variant): string;');
      AddFunction(@TiraEspacoEsquerda, 'function TiraEspacoEsquerda(sTexto: Variant): string;');
      AddFunction(@TiraEspacoDireita, 'function TiraEspacoDireita(sTexto: Variant): string;');
      AddFunction(@SoCaracteres, 'function SoCaracteres(sTexto: Variant; Caracteres: Variant): string;');

      //Matemáticas
      AddFunction(@Soma, 'function Soma(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@Subtrai, 'function Subtrai(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@Divide, 'function Divide(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@RestoDiv, 'function RestoDiv(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@DivNumero, 'function DivNumero(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@Potencia, 'function Potencia(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@Multiplica, 'function Multiplica(iNumero: Variant; iNumero2: Variant): string;');
      AddFunction(@Maior, 'function Maior(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@Menor, 'function Menor(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@Media, 'function Media(iNumero1: Variant; iNumero2: Variant): string;');
      AddFunction(@FormataNumero, 'function FormataNumero(sTexto: Variant; sFormato: Variant): string;');

      //Datas
      AddFunction(@FormataData, 'function FormataData(sTexto: Variant; sData: Variant): string;');
      AddFunction(@Dia, 'function Dia(sData: Variant): string;');
      AddFunction(@Mes, 'function Mes(sData: Variant): string;');
      AddFunction(@Ano, 'function Ano(sData: Variant): string;');
      AddFunction(@Hora, 'function Hora(sData: Variant): string;');
      AddFunction(@Minuto, 'function Minuto(sData: Variant): string;');
      AddFunction(@Segundo, 'function Segundo(sData: Variant): string;');
      AddFunction(@DiaDaSemana, 'function DiaDaSemana(sData: Variant): string;');
      AddFunction(@DiaDoAno, 'function DiaDoAno(sData: Variant): string;');
      AddFunction(@SomaData, 'function SomaData(sData1: Variant; sData2: Variant): string;');
      AddFunction(@DifData, 'function DifData(sData1: Variant; sData2: Variant): string;');
      AddFunction(@Hoje, 'function Hoje(): string;');
      AddFunction(@DiferencaDias, 'function DiferencaDias(sData1: Variant; sData2: Variant): string;');

      //Financeiras
      AddFunction(@DV10, 'function DV10(ds_codigo, cd_banco: Variant): string;');
      AddFunction(@DV10BB, 'function DV10BB(strCodigo: Variant): string;');
      AddFunction(@DV11, 'function DV11(ds_codigo, cd_tipo, cd_banco: Variant): string;');
      AddFunction(@DV11BB, 'function DV11BB(strCodigo: string ): string;');
      AddFunction(@DV44, 'function DV44(strCodigo: Variant): string;');
      AddFunction(@DV440, 'function DV440(strCodigo: Variant): string;');
   end;
end;

function TiraEspaco(sTexto: Variant): string;
var
   vsTexto: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   Result := Trim(vsTexto);
end;

function TiraEspacoEsquerda(sTexto: Variant): string;
var
   vsTexto: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   Result := TrimLeft(vsTexto);
end;

function TiraEspacoDireita(sTexto: Variant): string;
var
   vsTexto: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   Result := TrimRight(vsTexto);
end;

function Esquerda(sTexto: Variant; iQtd: Variant): string;
var
   vsTexto: string;
   viQtd: Integer;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   viQtd := VariantToType(iQtd, varInteger);
   Result := LeftStr(vsTexto, viQtd);
 end;

function Direita(sTexto: Variant; iQtd: Variant): string;
var
   vsTexto: string;
   viQtd: Integer;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   viQtd := VariantToType(iQtd, varInteger);
   Result := RightStr(vsTexto, viQtd);
end;

function Meio(sTexto: Variant; Posicao,  iQtd: Variant): string;
var
   vsTexto: string;
   viPosicao, viQtd: Integer;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   viPosicao := VariantToType(Posicao, varInteger);
   viQtd := VariantToType(iQtd, varInteger);
   Result := Copy(vsTexto, viPosicao, viQtd);
end;

function Tamanho(sTexto: Variant): Integer;
var
   vsTexto: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   Result := (Length(vsTexto));
end;

function Maiuscula(sTexto: Variant): string;
var
   vsTexto: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   Result := UpperCase(vsTexto);
end;

function Minuscula(sTexto: Variant): string;
var
   vsTexto: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   Result := LowerCase(vsTexto);
end;

function Substituir(sTexto: Variant; OldValue: Variant; NewValue: Variant): string;
var
   vsTexto, vsOld, vsNew: string;
begin
   vsTexto :=  VariantToType(sTexto, varString);
   vsOld :=  VariantToType(OldValue, varString);
   vsNew :=  VariantToType(NewValue, varString);
   Result := StringReplace(stexto, OldValue, NewValue, [rfReplaceAll, rfIgnoreCase]);
end;

function SoCaracteres(sTexto: Variant; Caracteres: Variant): string;
var
   vsTexto, vsCaracteres, vsNew: string;
   i: Integer;
begin
   vsTexto := VariantToType(sTexto, varString);
   vsCaracteres :=  VariantToType(Caracteres, varString);
  for i := 1 to Length(vsTexto) do begin
     if (Pos(vsTexto[i], vsCaracteres) > 0) then begin
        vsNew := vsNew + vsTexto[i];
     end;
  end;
  Result := vsNew;
end;

//matemáticas
function Soma(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   Result := FloatToStr(viNum1+viNum2);
end;

function Subtrai(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   Result := FloatToStr(viNum1-viNum2);
end;

function Divide(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   if ((viNum1 = 0) or (viNum2 = 0)) then begin
      Result := '0';
   end
   else begin
      Result := FloatToStr(viNum1/viNum2);
   end;
end;

function RestoDiv(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Integer;
begin
   viNum1 := Trunc(VariantToType(iNumero1, varDouble));
   viNum2 := Trunc(VariantToType(iNumero2, varDouble));
   if ((viNum1 = 0) or (viNum2 = 0)) then begin
      Result := '0';
   end
   else begin
      Result := IntToStr(viNum1 mod viNum1);
   end;
end;

function DivNumero(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Integer;
begin
   viNum1 := Trunc(VariantToType(iNumero1, varDouble));
   viNum2 := Trunc(VariantToType(iNumero2, varDouble));
   if ((viNum1 = 0) or (viNum2 = 0)) then begin
      Result := '0';
   end
   else begin
      Result := IntToStr(viNum1 div viNum1);
   end;
end;

function Potencia(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   Result := FloatToStr(Power(viNum1, viNum2));
end;

function Multiplica(iNumero: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   Result := FloatToStr(viNum1 * viNum2);
end;

function Maior(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   if (viNum1 > viNum2) then begin
      Result := FloatToStr(viNum1);
   end
   else begin
      Result := FloatToStr(viNum2);
   end;
end;

function Menor(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   if (viNum1 < viNum2) then begin
      Result := FloatToStr(viNum1);
   end
   else begin
      Result := FloatToStr(viNum2);
   end;
end;

function Media(iNumero1: Variant; iNumero2: Variant): string;
var
   viNum1, viNum2: Double;
begin
   viNum1 := VariantToType(iNumero1, varDouble);
   viNum2 := VariantToType(iNumero2, varDouble);
   if ((viNum1 = 0) and (viNum2 = 0)) then begin
      Result := '0';
   end
   else begin
      Result := FloatToStr((viNum1+viNum2)/2);
   end;
end;

function FormataNumero(sTexto: Variant; sFormato: Variant): string;
var
   vsFormato: string;
   viNum1: Double;
begin
   vsFormato := VariantToType(sFormato, varString);
   viNum1 := VariantToType(sTexto, varDouble);
   Result := FormatFloat(vsFormato, viNum1);
end;

//Datas
function FormataData(sTexto: Variant; sData: Variant): string;
var
   vsTexto: string;
   dt: TDateTime;
begin
   Result := '';
   vsTexto := VariantToType(sTexto, varString);
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime(vsTexto, dt);
   end;
end;

function Dia(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime('dd', dt);
   end;
end;

function Mes(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime('mm', dt);
   end;
end;

function Ano(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime('yyyy', dt);
   end;
end;

function Hora(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime('hh', dt);
   end;
end;

function Minuto(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime('nn', dt);
   end;
end;


function Segundo(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := FormatDateTime('ss', dt);
   end;
end;


function DiaDaSemana(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := IntToStr(DayOfWeek(dt));
   end;
end;

function DiaDoAno(sData: Variant): string;
var
   dt: TDateTime;
begin
   Result := '';
   dt := ToDateTime(sData);
   if dt > 0 then begin
      Result := IntToStr(DayOfTheYear(dt));
   end;
end;

function SomaData(sData1: Variant; sData2: Variant): string;
var
   dt1, dt2: TDateTime;
begin
   Result := '';
   dt1 := ToDateTime(sData1);
   dt2 := ToDateTime(sData2);

   if ((dt1 > 0) and (dt2 > 0)) then begin
      Result := FormatDateTime('c', (dt1+dt2));
   end;
end;

function DifData(sData1: Variant; sData2: Variant): string;
var
   dt1, dt2: TDateTime;
begin
   Result := '';
   dt1 := ToDateTime(sData1);
   dt2 := ToDateTime(sData2);

   if ((dt1 > 0) and (dt2 > 0)) then begin
      Result := FormatDateTime('c', (dt1-dt2));
   end;
end;

function DiferencaDias(sData1: Variant; sData2: Variant): string;
var
   dt1, dt2: TDateTime;
begin
   Result := '';
   dt1 := VarToDateTime(sData1);
   dt2 := VarToDateTime(sData2);

   Result := IntToStr(DaysBetween(dt1, dt2));
end;

function Hoje(): string;
begin
   Result := DateTimeToStr(Now());
end;

//Diversas


function ToExtended(sNumero: Variant): Extended;
var
   dRet: Extended;
begin
   try
      dRet := StrToFloat(sNumero);
   except
      dRet := 0;
   end;
   Result := dRet;
end;

/////////////////
// FINANCEIRAS
/////////////////


function DV10(ds_codigo, cd_banco: Variant): string;
var
  intDV, intSoma, intMul, i, n : Integer;
  strAux : String[02];
begin
  try
    intSoma := 0;  // Inicia a var intSoma
   // intDV := 0;    // Inicia a var intDV
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

function DV11(ds_codigo, cd_tipo, cd_banco: Variant): string;
// tipo = 'LD' -> Linha digitável
// tipo = 'CB' -> Código de Barras
// tipo = 'NN' -> NóssoNúmero
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
    intSoma := 0; // Inicia a variável intSoma
    //intDV := 0;   // Inicia a variável intDV

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

      else // 001
        exit; // Saia
      end; // 001

  except
    exit; // Em caso de erro, saia
  end;

end;

function DV10BB(strCodigo: Variant): string;
var
  intDV, intSoma, intMul, i, n : Integer;
  strAux : String[02];
begin
  try
  intSoma := 0;
  //intDV := 0;
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


function DV44(strCodigo: Variant): string;
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
  intSoma := 0;
//  intDV := 0;
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

function DV440(strCodigo: Variant): string;
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
  intSoma := 0;
  //intDV := 0;
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

function DV11BB(strCodigo: Variant): string;
var
  intDV, intSoma, intMul, i, n : Integer;
begin
  try
    intSoma := 0;
    //intDV := 0;
    n := Length( strCodigo );
    for i := High( intDV43 ) downto Low( intDV43 ) do begin
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

function VariantToType(vVariant: Variant; varType: Word): Variant;
begin
   try
      Result := VarAsType(vVariant, varType);
   except
      case varType of
        varInteger, varDouble, varShortInt, varByte:
            Result := 0;
         else
            Result := '';
      end;
   end;
end;

function ToDateTime(sTexto: Variant): TDateTime;
var
   dtRet: TDateTime;
begin
   //identifica o tipo
   try
      dtRet := VarToDateTime(sTexto);
   except
      try
         case VarType(sTexto) of
            varInteger, varDouble, varShortInt, varByte:
               dtRet := VariantToType(sTexto, varDouble);
            else
               dtRet := StrToDateTime(VariantToType(sTexto, varString));
         end;
      except
         dtRet := 0;
      end;
   end;
   Result := dtRet;
end;

procedure PSGetAllFunctions(var slDados: TStringList);
begin
   slDados.Clear();
   slDados.Duplicates := dupAccept;

   //String
   slDados.Add('String=Esquerda(Texto, QtdCaracteres)');
   slDados.Add('String=Direita(Texto, QtdCaracteres)');
   slDados.Add('String=Meio(Texto, Posicao, QtdCaracteres)');
   slDados.Add('String=Tamanho(Texto)');
   slDados.Add('String=Maiuscula(Texto)');
   slDados.Add('String=Minuscula(Texto)');
   slDados.Add('String=Substituir(Texto, Subst, Inicio)');
   slDados.Add('String=ToInteiro(Texto)');
   slDados.Add('String=FormataNumero(Texto, Formato)');
   slDados.Add('String=SoCaracteres(Texto, Caracteres)');

   //Matemáticas
   slDados.Add('Numero=Soma(Numero, Base)');
   slDados.Add('Numero=Subtrai(Numero1, Numero2)');
   slDados.Add('Numero=Divide(Numero1, Numero2)');
   slDados.Add('Numero=Multiplica(Numero1, Numero2)');
   slDados.Add('Numero=RestoDiv(Numero1, Numero2)');
   slDados.Add('Numero=Potencia(Numero1, Expoente)');
   slDados.Add('Numero=DivNumero(Numero1, Numero2)');
   slDados.Add('Numero=Maior(Numero1, Numero2)');
   slDados.Add('Numero=Menor(Numero1, Numero2)');
   slDados.Add('Numero=Media(Numero1, Numero2)');

   //Datas
   slDados.Add('Data=FormataData(Formato, Data)');
   slDados.Add('Data=Dia(Data)');
   slDados.Add('Data=Mes(Data)');
   slDados.Add('Data=Ano(Data)');
   slDados.Add('Data=Hora(Data)');
   slDados.Add('Data=Minuto(Data)');
   slDados.Add('Data=Segundo(Data)');
   slDados.Add('Data=DiaDaSemana(Data)');
   slDados.Add('Data=DiaDoAno(Data)');
   slDados.Add('Data=SomaData(Data1, Data2)');
   slDados.Add('Data=DifData(Data1, Data2)');
   slDados.Add('Data=Hoje()');
   slDados.Add('Data=DiferencaDias(Data1, Data2)');

   //Gerais
  // slDados.Add('Gerais=Maiuscula(Texto)');
   //slDados.Add('Gerais=Minuscula(Texto)');

   //Financeiras
   slDados.Add('Financeiras=DV11(Texto)');
   slDados.Add('Financeiras=DV10(Texto)');
   slDados.Add('Financeiras=DV10(Texto, Banco)');
   slDados.Add('Financeiras=DV10BB(Texto)');
   slDados.Add('Financeiras=DV11(Texto, Tipo, Banco)');
   slDados.Add('Financeiras=DV11BB(Texto)');
   slDados.Add('Financeiras=DV44(Texto)');
   slDados.Add('Financeiras=DV440(Texto)');

   slDados.Sort;
end;

end.
