unit UFunctions;

interface

uses
   SysUtils, Windows, Forms, Nb30;

type
   TAppVersion = AnsiString;

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

   ///   <summary>Verifica se a cadeia de caracteres é um <c>string</c>
   ///   codificada com um valor válido</summary>
   ///
   ///   <param name="S"><c>string</c> codificada contendo o valor que deseja-se
   ///   verificar</param>
   ///
   ///   <returns>Valor lógico <c>True</c> indicando que a <c>string</c> possui
   ///   uma codificação válida ou <c>False</c> caso contrário</returns>
   function EncodedStr(const S: string): Boolean;

   ///   <summary>Recupera o valor do endereço MAC do computador que está
   ///   executando o atualizador de banco de dados do Unimestre</summary>
   ///
   ///   <param name="HostName">Nome do computador que deseja-se recuperar
   ///   o endereço MAC</param>
   ///
   ///   <returns>Retorna o endereço MAC do computador</returns>
   function GetMacAddress(HostName: string): string;

   function GetAppVersion: TAppVersion;

implementation

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

function GetAppVersion: TAppVersion;
var
   ExeName: AnsiString;
   InfoSize, VerSize, Wnd: DWORD;
   VersionBuf: Pointer;
   FileInfo: PVSFixedFileInfo;
begin
   ExeName := Application.ExeName;
   InfoSize := GetFileVersionInfoSize(PAnsiChar(ExeName), Wnd);
   if InfoSize = 0 then
      Result := EmptyStr
   else
   begin
      GetMem(VersionBuf, InfoSize);
      try
         if GetFileVersionInfo(PChar(ExeName), Wnd, InfoSize, VersionBuf) then
            if VerQueryValue(VersionBuf, '\', Pointer(FileInfo), VerSize) then
               Result := Format('%d.%d.%d.%d',
                  [HiWord(FileInfo.dwFileVersionMS),
                   LoWord(FileInfo.dwFileVersionMS),
                   HiWord(FileInfo.dwFileVersionLS),
                   LoWord(FileInfo.dwFileVersionLS)])
      finally
         FreeMem(VersionBuf);
      end;
   end;
end;

function EncodedStr(const S: string): Boolean;
var
   I, Len: Integer;
begin
   Result := True;
   Len := Length(S);
   for I := 1 to Len do
      if not (S[I] in [#48..#57, #65..#122]) then
      begin
         Result := False;
         Break;
      end;
end;

function GetMacAddress(HostName: string): string;
type
  TASTAT = packed record
    adapt: nb30.TADAPTERSTATUS;
    NameBuff: array [0..30] of TNAMEBUFFER;
  end;
var
   NCB: TNCB;
   S: string;
   PASTAT: Pointer;
   AST: TASTAT;
begin
   FillChar(NCB, SizeOf(NCB), 0);
   NCB.ncb_command := Chr(NCBRESET);
   NetBios(@NCB);

   FillChar(NCB, SizeOf(NCB), 0);
   FillChar(NCB.ncb_callname[0], 16, ' ');
   Move(HostName[1], NCB.ncb_callname[0], Length(HostName));
   NCB.ncb_command := Chr(NCBASTAT);

   NCB.ncb_lana_num := #0;
   NCB.ncb_length := SizeOf(AST);

   GetMem(PASTAT, NCB.ncb_length);

   if PASTAT = nil then
   begin
      Result := 'memory allocation failed!';
      Exit;
   end;
   NCB.ncb_buffer := PASTAT;
   NetBios(@NCB);

   Move(NCB.ncb_buffer, AST, SizeOf(AST));

   with AST.adapt do
      S := Format('%.2x-%.2x-%.2x-%.2x-%.2x-%.2x', [
         Ord(adapter_address[0]),
         Ord(adapter_address[1]),
         Ord(adapter_address[2]),
         Ord(adapter_address[3]),
         Ord(adapter_address[4]),
         Ord(adapter_address[5])]
      );
   
   FreeMem(PASTAT);
   Result := S;
end;

end.
