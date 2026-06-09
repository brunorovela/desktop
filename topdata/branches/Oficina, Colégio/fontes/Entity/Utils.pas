unit Utils;

interface

uses constantes, windows, SysUtils, Inner, StrUtils, stdCtrls, ComObj, Variants,
      ComCtrls, Grids;

Function IntegerToHex(p: array of byte): string; overload;
Function IntegerToHex(p: array of byte; indexArray: Integer; LengthArray: Integer): string; overload;
Function RemZeroEsquerda(valor: string): string;
FUNCTION HexToInt(const HexStr: string): longint;

implementation
Function IntegerToHex(p: array of byte): string;
const
  Hexas: array [0 .. 15] of Char = '0123456789ABCDEF';
var
  i: Integer;
  sai: string;
  p1, p2: Integer;
begin

  for i := 0 to length(p) - 1 do
  begin
    p1 := trunc(p[i] / 16);
    p2 := p[i] mod 16;
    sai := sai + Hexas[p1];
    sai := sai + Hexas[p2];
  end;
  result := sai;
end;

Function IntegerToHex(p: array of byte; indexArray: Integer; LengthArray: Integer): string;
const
  Hexas: array [0 .. 15] of Char = '0123456789ABCDEF';
var
  i: Integer;
  sai: string;
  p1, p2: Integer;
begin
  for i := indexArray to (indexArray + LengthArray)-1 do
  begin
    p1 := trunc(p[i] / 16);
    p2 := p[i] mod 16;
    sai := sai + Hexas[p1];
    sai := sai + Hexas[p2];
  end;
  result := sai;
end;

Function RemZeroEsquerda(valor: string): string;
Var
   Ret: string;
   index: integer;
Begin
  for index := 0 to Length(valor) do
  Begin
      if (copy(valor, index, 1)) > '0' then
      Begin
          Ret := Ret + copy(valor, index, 1);
      end;
  end;
  Result := Ret;
end;

FUNCTION HexToInt(const HexStr: string): longint;
var
  iNdx: Integer;
  cTmp: Char;
BEGIN
  Result := 0;
  for iNdx := 1 to Length(HexStr) do
  begin
    cTmp := HexStr[iNdx];
    case cTmp of
      '0' .. '9':
        Result := 16 * Result + (Ord(cTmp) - $30);
      'A' .. 'F':
        Result := 16 * Result + (Ord(cTmp) - $37);
      'a' .. 'f':
        Result := 16 * Result + (Ord(cTmp) - $57);
    else
      raise EConvertError.Create('Illegal character in hex string');
    end;
  end;
end;
end.
