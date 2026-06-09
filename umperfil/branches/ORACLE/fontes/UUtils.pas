unit UUtils;

interface

uses
   SysUtils, Windows, Forms;

function Decrypt(const Source: AnsiString): AnsiString; overload;
function Decrypt(const Source, Key: AnsiString): AnsiString; overload;
function Encrypt(const Source: AnsiString): AnsiString; overload;
function Encrypt(const Source, Key: AnsiString): AnsiString; overload;
function GetTempDirectory: AnsiString;
function GetVersion: AnsiString;

implementation

uses
   Classes;

const
   SDefaultKey =
      'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKD' +
      'F3424SKLK3LAKDJSL9RTIKJ';

function Decrypt(const Source: AnsiString): AnsiString;
begin
   Result := Decrypt(Source, SDefaultKey);
end;

function Decrypt(const Source, Key: AnsiString): AnsiString;
var
   KeyIndex, KeyLength, OffSet, SrcIndex, SrcAsc, TmpSrcAsc: Integer;
begin
   KeyLength := Length(Key);
   KeyIndex := 0;
   
   OffSet := StrToInt('$' + Copy(Source, 1, 2));
   SrcIndex := 3;
   repeat
      SrcAsc := StrToInt('$' + Copy(Source, SrcIndex, 2));
      if KeyIndex < KeyLength then
         Inc(KeyIndex)
      else
         KeyIndex := 1;
      TmpSrcAsc := SrcAsc xor Ord(Key[KeyIndex]);
      if TmpSrcAsc <= OffSet then
         TmpSrcAsc := 255 + TmpSrcAsc - OffSet
      else
         TmpSrcAsc := TmpSrcAsc - OffSet;
      Result := Result + Chr(TmpSrcAsc);
      OffSet := SrcAsc;
      Inc(SrcIndex, 2);
   until SrcIndex >= Length(Source);
end;

function Encrypt(const Source: AnsiString): AnsiString;
begin
   Result := Encrypt(Source, SDefaultKey);
end;

function Encrypt(const Source, Key: AnsiString): AnsiString;
const
   Range = 256;
var
   KeyLength, KeyIndex, SrcIndex, OffSet, SrcAsc: Integer;
begin
   KeyLength := Length(Key);
   KeyIndex := 0;

   if Trim(Source) <> EmptyStr then
   begin
      Randomize;
      OffSet := Random(Range);
      Result := Format('%1.2x', [OffSet]);
      for SrcIndex := 1 to Length(Source) do
      begin
         SrcAsc := (Ord(Source[SrcIndex]) + OffSet) mod 255;
         if KeyIndex < KeyLength then
            Inc(KeyIndex)
         else
            KeyIndex := 1;
         SrcAsc := SrcAsc xor Ord(Key[KeyIndex]);
         Result := Result + Format('%1.2x', [SrcAsc]);
         OffSet := SrcAsc;
      end;
   end
   else
      Result := EmptyStr;
end;

function GetTempDirectory: AnsiString;
var
   PathName: array [0..MAX_PATH] of Char;
begin
   GetTempPath(MAX_PATH, @PathName);
   Result := StrPas(PathName);
end;

function GetVersion: AnsiString;
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

end.
