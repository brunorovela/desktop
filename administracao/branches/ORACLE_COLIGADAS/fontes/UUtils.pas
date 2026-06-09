unit UUtils;

interface

uses
   SysUtils, Windows, Forms;

type
   TEventLogKind = (ekSuccess = $0000, ekError = $0001, ekWarning = $0002,
      ekInfo = $0004, ekAuditSuccess = $0008, ekAuditFail = $0010);

function Decrypt(const Source: AnsiString): AnsiString; overload;
function Decrypt(const Source, Key: AnsiString): AnsiString; overload;
function Encrypt(const Source: AnsiString): AnsiString; overload;
function Encrypt(const Source, Key: AnsiString): AnsiString; overload;
function GetTempDirectory: AnsiString;
function GetVersion: AnsiString;
function WriteEventLog(const LogMessage: AnsiString; const Kind: TEventLogKind):
   Boolean;
function GetIP: AnsiString;
function FileSize(const FileName: AnsiString): Double;

implementation

uses
   Classes, UrlMon, Math;

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

function WriteEventLog(const LogMessage: AnsiString; const Kind: TEventLogKind):
   Boolean;
const
   SSourceName = 'UNIMESTRE - Administração';
var
   EventLog: Cardinal;
   P: Pointer;
begin
   Result := False;
   P := PAnsiChar(LogMessage);
   EventLog := RegisterEventSource(nil, PAnsiChar(SSourceName));
   if EventLog > 0 then
      try
         ReportEvent(EventLog, Ord(Kind), 0, 0, nil, 1, 0, @P, nil);
         Result := True;
      finally
         DeregisterEventSource(EventLog);
      end;
end;

function GetIP: AnsiString;

   function IpFilter(const Value: AnsiString): AnsiString;
   var
      I: SHORT;
      Tmp: AnsiString;
   begin
      Tmp := '';
      for I := 1 to Length(Value) do
      begin
         if Value[I] in ['0'..'9', '.'] then
         begin
            AppendStr(Tmp, Value[I]);
         end;
         Result := Tmp;
      end;
   end;

const
   SURL = 'http://checkip.dyndns.org/';
var
   FileName: AnsiString;
   Parser: TStrings;
begin
   Result := '';
   FileName := ExtractFilePath(Application.ExeName) + 'externalip.txt';

   if URLDownloadToFile(nil, SURL, PAnsiChar(FileName), 0, nil) = 0 then
   begin
      Parser := TStringList.Create;
      try
         Parser.LoadFromFile(FileName);
         Result := IpFilter(Copy(Parser.Text, Pos('IP Address: ', Parser.Text) + 12, 16));
      finally
         FreeAndNil(Parser);
      end;
   end;
   
end;

function FileSize(const FileName: AnsiString): Double;
var
   FileHandle, FileLength: Integer;
begin
   FileHandle := FileOpen(FileName, fmOpenRead);

   FileLength := FileSeek(FileHandle, 0, 2);

   Result := SimpleRoundTo(FileLength / 1024 /1024, -2);

   FileSeek(FileHandle, 0, 0);

   FileClose(FileHandle);   
end;

end.
