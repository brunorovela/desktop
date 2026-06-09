unit General;

interface

uses
   SysUtils, Forms, Controls, Windows, IniFiles, Classes;

   function Mensagem(const Msg, Titulo: string; const Tipo: Longint): Integer;
   
   function SemAcento(const S: string): string;
   
   procedure SplitString(sBase, sQuebra: string; var slRetorno: TStringList);

   ///   <summary>Aplica criptografia sobre a cadeia de caracteres enviada
   ///   utilizando como base para criptografia o valor da chave passada
   ///   </summary>
   ///
   ///   <param name="S">Cadeia de caracteres (<c>string</c>) sobre a qual
   ///   deseja-se aplicar a criptografia</param>
   ///   <param name="Key">Chave que será utilizada para realizar a criptografia
   ///   sobre o valor enviado</param>
   ///
   ///   <returns>Retorna a cadeia de caracteres criptografada</returns>
   function Encrypt(const S, Key: string): string; overload;

   ///   <summary>Realiza criptografia sobre a cadeia de caracteres passada como
   ///   parâmetro para o método. Utiliza uma chave padrão para aplicação da
   ///   criptografia</summary>
   ///
   ///   <param name="S">Cadeia de caracteres (<c>string</c>) sobre a qual
   ///   deseja-se aplicar a criptografia</param>
   ///   <returns>Retorna a cadeia de caracteres criptografada</returns>
   function Encrypt(const S: string): string; overload;

   ///   <summary>Reverte a criptografia aplicada sobre uma <c>string</c> com o
   ///   método <c>Encrypt</c>. Deve-se informar a mesma chave utilizada na
   ///   criptografia para que reversão possa ser realizada.</summary>
   ///
   ///   <param name="S"><c>string</c> criptograda com o método <c>Encrypt</c>
   ///   que deseja-se reverter a criptografia.</param>
   ///   <param name="Key">Chave para reversão da criptografia aplicada sobre a
   ///   <c>string</c> por ocasião da utilização do método <c>Encrypt</c>.
   ///   Deve-se informar o mesmo valor utilizado para criptografar.</param>
   ///
   ///   <returns>Retorna a <c>string</c> descriptografada com auxílio da chave
   ///   </returns>
   function Decrypt(const S: string; Key: string): string; overload;

   ///   <summary>Reverte a criptografia aplicada sobre uma <c>string</c>
   ///   utilizando uma chave de descriptografia padrão.</summary>
   ///
   ///   <param name="S"><c>string</c> criptografada pelo método <c>Encrypt</c>
   ///   da qual deseja-se obter o valor original</param>
   ///
   ///   <returns>Retorna a <c>string</c> descriptografada.</returns>
   function Decrypt(const S: string): string; overload;

implementation

uses uDm;

function Encrypt(const S, Key: string): string;
var
   OffSet, KeyPos, KeyLen, Code, I: Integer;
begin
   if Length(S) = 0 then
      Result := EmptyStr
   else
   begin
      Result := EmptyStr;
      Randomize;
      KeyPos := 0;
      KeyLen := Length(Key);
      OffSet := Random(256);
      Result := Format('%1.2x', [OffSet]);
      
      for I := 1 to Length(S) do
      begin
         Code := (Ord(S[I]) + OffSet) mod 255;
         if KeyPos < KeyLen then Inc(KeyPos)
         else KeyPos := 1;
         Code := Code xor Ord(Key[KeyPos]);
         Result := Result + Format('%1.2x', [Code]);
         OffSet := Code;
      end;
   end;
end;

function Encrypt(const S: string): string;
var
   Key: string;
begin
   Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';
   Result := Encrypt(S, Key);
end;

function Decrypt(const S: string; Key: string): string;
var
   OffSet, I, KeyLen, Code, TempCode, KeyPos: Integer;
begin
   if Length(S) = 0 then
      Result := EmptyStr
   else
   begin
      Result := EmptyStr;
      KeyLen := Length(Key);
      KeyPos := 0;
      OffSet := StrToInt('$' + Copy(S, 1, 2));
      I := 3;

      repeat
         Code := StrToInt('$' + Copy(S, I, 2));
         if KeyPos < KeyLen then Inc(KeyPos)
         else KeyPos := 1;
         TempCode := Code xor Ord(Key[KeyPos]);
         if TempCode <= OffSet then TempCode := 255 + TempCode - OffSet
         else TempCode := TempCode - OffSet;
         Result := Result + Chr(TempCode);
         OffSet := Code;
         Inc(I, 2);
      until I >= Length(S);
   end;
end;

function Decrypt(const S: string): string;
var
   Key: string;
begin
   Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';
   Result := Decrypt(S, Key);
end;

function Mensagem(const Msg, Titulo: string; const Tipo: Longint): Integer;
begin
   Result := MessageBox(Application.Handle, PChar(Msg), PChar(Titulo), Tipo);
end;

function SemAcento(const S: string): string;
var
   I: Byte;
const
   Procura: array [0..23] of Char =
      ('Á', 'À', 'Ã', 'Ä', 'Â',
       'É', 'È', 'Ë', 'Ê',
       'Í', 'Ì', 'Ï', 'Î',
       'Ó', 'Ò', 'Õ', 'Ö', 'Ô',
       'Ú', 'Ù', 'Ü', 'Û',
       'Ç', 'Ñ');

   Substituicao: array [0..23] of Char =
      ('A', 'A', 'A', 'A', 'A',
       'E', 'E', 'E', 'E',
       'I', 'I', 'I', 'I',
       'O', 'O', 'O', 'O', 'O',
       'U', 'U', 'U', 'U',
       'C', 'N');
begin
   Result := S;
   for I := Low(Procura) to High(Procura) do
      while Pos(Procura[I], Result) <> 0 do
         if Pos(Procura[I], Result) > 0 then
            Result[Pos(Procura[I], Result)] := Substituicao[I];
end;

procedure SplitString(sBase, sQuebra: string; var slRetorno: TStringList);
var
   EndOfCurrentString: byte;
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

end.

