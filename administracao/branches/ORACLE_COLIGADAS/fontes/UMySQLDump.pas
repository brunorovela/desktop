unit UMySQLDump;

interface

uses
   Classes, SysUtils, Windows, TlHelp32, Controls, DateUtils, StrUtils, UUtils, UZDataset, Winsock, IdIPWatch, Dialogs, Forms;

type
   TParameterList = TStringList;

   TProcessID = Cardinal;

   TMySQLDump = class(TObject)
   private
      FID: Integer;
      FHostName: AnsiString;
      FPort: AnsiString;
      FDatabase: AnsiString;
      FExePath: TFileName;
      FLastError: AnsiString;
      FParameters: TParameterList;
      FProcessID: TProcessID;
      FResultFile: TFileName;
      class var FInstance: TMySQLDump;
      class var FProcessName: AnsiString;
      constructor Create;
      function GetID: Integer;
      function GetExePath: TFileName;
      function GetHostName: AnsiString;
      function GetLastError: AnsiString;
      function GetPort: AnsiString;
      function GetResultFile: TFileName;
      function IsRunning: Boolean;
      function ParseParams: AnsiString;
      procedure CatchLastError;
      procedure LoadProcess;
      procedure SetID(const Value: Integer);
      procedure SetDatabase(const Value: AnsiString);
      procedure SetExePath(const Value: TFileName);
      procedure SetHostName(const Value: AnsiString);
      procedure SetPort(const Value: AnsiString);
      procedure SetResultFile(const Value: TFileName);
   public
      class function GetInstance: TMySQLDump;
      destructor Destroy; override;
      function Execute: Boolean;
      function Stop: Boolean;
      function GetDatabase: AnsiString;
      function ParseCommand: AnsiString;
      procedure AddParameter(const AName: AnsiString); overload;
      procedure AddParameter(const AName, AValue: AnsiString); overload;
      procedure ReplaceParameter(const AName, AValue: AnsiString);
      property ID: Integer read GetID write SetID;
      property Database: AnsiString read GetDatabase write SetDatabase;
      property HostName: AnsiString read GetHostName write SetHostName;
      property LastError: AnsiString read GetLastError;
      property ExePath: TFileName read GetExePath write SetExePath;
      property Port: AnsiString read GetPort write SetPort;
      property ResultFile: TFileName read GetResultFile write SetResultFile;
      property Running: Boolean read IsRunning;
   end;

   TDatabaseList = TStringList;

   TScheduleFrequency = (sfDaily, sfHourly);

   TExecuteResult = (erSuccess, erError, erRunning, erWaiting, erDisabled,
      erUndefined);

   TScheduleManager = class(TObject)
   private
      FEnabled: Boolean;
      FStartDate: TDate;
      FStartTime: TTime;
      FInterval: Word;
      FSaveDir: TFileName;
      FDatabases: TDatabaseList;
      FFrequency: TScheduleFrequency;
      FSn_mongo: Boolean;
      function GetSn_mongo: Boolean;
      procedure SetSn_mongo(const Value: Boolean);
      class var FInstance: TScheduleManager;
      class var FToleranceInterval: Word;
      constructor Create;
      function GetDatabases: TDatabaseList;
      function GetFrequency: TScheduleFrequency;
      function GetInterval: Cardinal;
      function GetNextDatabase: AnsiString;
      function GetRemainingTime: Cardinal;
      function GetResultFile(const ADatabaseName: AnsiString): TFileName;
      function GetSaveDir: AnsiString;
      function GetStartTime: TTime;
      function GetStartDate: TDateTime;
      function HasNextDatabase: Boolean;
      function IsEnabled: Boolean;
      function IsStarted: Boolean;
      procedure ScheduleNext;
      procedure SetEnabled(const Value: Boolean);
      procedure SetFrequency(const Value: TScheduleFrequency);
      procedure SetInterval(const Value: Cardinal);
      procedure SetSaveDir(const Value: AnsiString);
      procedure SetStartDate(const Value: TDateTime);
      procedure SetStartTime(const Value: TTime);
   public
      class function GetInstance: TScheduleManager;
      destructor Destroy; override;
      function Execute: TExecuteResult;
      procedure AssignDatabases(const ADatabases: AnsiString);
      property Databases: TDatabaseList read GetDatabases;
      property Enabled: Boolean read IsEnabled write SetEnabled;
      property Frequency: TScheduleFrequency read GetFrequency
         write SetFrequency;
      property Interval: Cardinal read GetInterval write SetInterval;
      property SaveDir: AnsiString read GetSaveDir write SetSaveDir;
      property Sn_mongo: Boolean read GetSn_mongo write SetSn_mongo;
      property StartDate: TDateTime read GetStartDate write SetStartDate;
      property StartTime: TTime read GetStartTime write SetStartTime;
      property RemainingTime: Cardinal read GetRemainingTime;
      property Started: Boolean read IsStarted;
   end;

   TCommandList = TStringList;

   TMySQLRestore = class(TObject)
   private
      FHostName: AnsiString;
      FDatabase: AnsiString;
      FLastError: AnsiString;
      FUser: AnsiString;
      FPassword: AnsiString;
      FPort: Cardinal;
      FSourceFile: TFileName;
      FExePath: TFileName;
      FProcessID: TProcessID;
      FBeforeCommands: TCommandList;
      FAfterComands: TCommandList;
      class var FInstance: TMySQLRestore;
      constructor Create;
      function GetDatabase: AnsiString;
      function GetExePath: AnsiString;
      function GetHostName: AnsiString;
      function GetLastError: AnsiString;
      function GetPassword: AnsiString;
      function GetPort: Cardinal;
      function GetSourceFile: TFileName;
      function GetUser: AnsiString;
      function IsRunning: Boolean;
      function ParseCommand: AnsiString;
      function ParseAfterCommands: AnsiString;
      function ParseBeforeCommands: AnsiString;
      function ParseExtraCommands: AnsiString;
      procedure CatchLastError;
      procedure SetDatabase(const Value: AnsiString);
      procedure SetExePath(const Value: AnsiString);
      procedure SetHostName(const Value: AnsiString);
      procedure SetPassword(const Value: AnsiString);
      procedure SetPort(const Value: Cardinal);
      procedure SetSourceFile(const Value: TFileName);
      procedure SetUser(const Value: AnsiString);
   public
      class function GetInstance: TMySQLRestore;
      destructor Destroy; override;
      function Execute: Boolean;
      function Stop: Boolean;
      procedure AddAfterCommand(const Value: AnsiString);
      procedure AddBeforeCommand(const Value: AnsiString);
      property Database: AnsiString read GetDatabase write SetDatabase;
      property ExePath: AnsiString read GetExePath write SetExePath;
      property HostName: AnsiString read GetHostName write SetHostName;
      property LastError: AnsiString read GetLastError;
      property Password: AnsiString read GetPassword write SetPassword;
      property Port: Cardinal read GetPort write SetPort;
      property Running: Boolean read IsRunning;
      property SourceFile: TFileName read GetSourceFile write SetSourceFile;
      property User: AnsiString read GetUser write SetUser;
   end;

   function GetScheduleManager: TScheduleManager;

implementation

uses
   UDM;

{ TMySQLDump }

procedure TMySQLDump.AddParameter(const AName, AValue: AnsiString);
var
   I: Integer;
begin
   if not FParameters.Find(AName, I) then
      FParameters.Values[AName] := AValue;
end;

procedure TMySQLDump.AddParameter(const AName: AnsiString);
begin
   AddParameter(AName, 'NULL');
end;

procedure TMySQLDump.CatchLastError;
begin
   FLastError := SysErrorMessage(Windows.GetLastError);
end;

constructor TMySQLDump.Create;
begin
   FParameters := TParameterList.Create;
   FProcessName := 'mysqldump.exe';
   FHostName := 'localhost';
   FPort := '3306';
   LoadProcess;
end;

destructor TMySQLDump.Destroy;
begin
   FParameters.Free;
   inherited;
end;

{function TMySQLDump.Execute: Boolean;
var
   SUInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
begin
   ID := DM.NewHistoryRecord;

   FillChar(SUInfo, SizeOf(SUInfo), #0);
   SUInfo.cb := SizeOf(SUInfo);
   SUInfo.dwFlags := STARTF_USESHOWWINDOW;
   SUInfo.wShowWindow := SW_HIDE;


   Result := CreateProcess(nil, PChar(ParseCommand), nil, nil, False,
      CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, SUInfo,
      ProcessInfo);

   if Result then
   begin
     // caso ocorreu um erro ao executar o mysqldump
      if not(self.IsRunning) then
      begin
         Result := False;
         CatchLastError;
      end;

      FProcessID := ProcessInfo.dwProcessId;
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
   end
   else
      CatchLastError;
end;                                 }

function TMySQLDump.Execute: Boolean;
const
  CReadBuffer = 2400;
var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dRead: DWORD;
  dRunning: DWORD;
  dAvailable: DWORD;

  xMsgErro: String;
begin
  ID := DM.NewHistoryRecord;

  saSecurity.nLength := SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle := true;
  saSecurity.lpSecurityDescriptor := nil;
  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
    try
      FillChar(suiStartup, SizeOf(TStartupInfo), #0);
      suiStartup.cb := SizeOf(TStartupInfo);
      suiStartup.hStdInput := hRead;
      suiStartup.hStdOutput := hWrite;
      suiStartup.hStdError := hWrite;
      suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      suiStartup.wShowWindow := SW_HIDE;

      if CreateProcess(nil, PChar(ParseCommand), @saSecurity, @saSecurity, true, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup,
        piProcess) then
        begin
            Result := True;
            FProcessID := piProcess.dwProcessId;

            try
               dRunning := WaitForSingleObject(piProcess.hProcess, 30000);
               PeekNamedPipe(hRead, nil, 0, nil, @dAvailable, nil);

               // Se nao estiver rodando, captura o erro ocorrido
               if (dAvailable > 0) and (dRunning <= 0) then
               begin
                  self.FLastError := '';
                  Result := False;

                  repeat
                     dRead := 0;
                     ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
                     pBuffer[dRead] := #0;
                     OemToCharA(pBuffer, dBuffer);

                     self.FLastError := self.FLastError + #13#10 + String(dBuffer);
                  until (dRead < CReadBuffer);
               end;
            finally
               CloseHandle(piProcess.hProcess);
               CloseHandle(piProcess.hThread);
            end;
        end
        else
        begin
           Result := False;
           CatchLastError;
        end;
    finally
      CloseHandle(hRead);
      CloseHandle(hWrite);
    end;
end;

function TMySQLDump.GetDatabase: AnsiString;
begin
   Result := FDatabase;
end;

function TMySQLDump.GetExePath: TFileName;
begin
   Result := FExePath;
end;

function TMySQLDump.GetHostName: AnsiString;
begin
   Result := FHostName;
end;

function TMySQLDump.GetID: Integer;
begin
   Result := FID;
end;

class function TMySQLDump.GetInstance: TMySQLDump;
begin
   if FInstance = nil then
      FInstance := TMySQLDump.Create;
   Result := FInstance;
end;

function TMySQLDump.GetLastError: AnsiString;
begin
   Result := FLastError;
end;

function TMySQLDump.GetPort: AnsiString;
begin
   Result := FPort;
end;

function TMySQLDump.GetResultFile: TFileName;
begin
   Result := AnsiDequotedStr(FResultFile, #34);
end;

function TMySQLDump.IsRunning: Boolean;
var
   HasNext: BOOL;
   SnapHandle: THandle;
   ProcEntry: TProcessEntry32;
begin
   if FProcessID > 0 then
   begin
      SnapHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      ProcEntry.dwSize := SizeOf(ProcEntry);
      HasNext := Process32First(SnapHandle, ProcEntry);
      Result := False;
      while Integer(HasNext) <> 0 do
      begin
         if FProcessID = ProcEntry.th32ProcessID then
         begin
            Result := True;
            Break;
         end;
         HasNext := Process32Next(SnapHandle, ProcEntry);
      end;
      CloseHandle(SnapHandle);
      if not Result then
         FProcessID := 0;
   end
   else
      Result := False;
end;

procedure TMySQLDump.LoadProcess;
var
   HasNext: BOOL;
   SnapHandle: THandle;
   ProcEntry: TProcessEntry32;
begin
   SnapHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   ProcEntry.dwSize := SizeOf(ProcEntry);
   HasNext := Process32First(SnapHandle, ProcEntry);
   while Integer(HasNext) <> 0 do
   begin
      if StrPas(ProcEntry.szExeFile) = FProcessName then
      begin
         FProcessID := ProcEntry.th32ProcessID;
         Break;
      end;
      HasNext := Process32Next(SnapHandle, ProcEntry);
   end;
   CloseHandle(SnapHandle);
end;

function TMySQLDump.ParseCommand: AnsiString;
const
   SCommandFormat = '%s %s %s';
begin
   Result := Format(SCommandFormat, [FExePath, ParseParams, FDatabase]);
end;

function TMySQLDump.ParseParams: AnsiString;
var
   I,J: Integer;
   listaTabelas : String;
   ultimaPos : Integer;
begin
   Result := EmptyStr;
   DM.qryTabelasIgnoradas.close;
   DM.qryTabelasIgnoradas.open;
   ultimaPos := 1;
   listaTabelas :=  DM.qryTabelasIgnoradasDS_VALOR.AsString;
   for I := 0 to FParameters.Count - 1 do
   begin
      if Result <> EmptyStr then
         Result := Result + #32;
      if FParameters.ValueFromIndex[I] <> 'NULL' then
      begin
         if FParameters.Names[I] = '--result-file' then
            begin
               { Coloca a lista de tabelas ignoradas antes do result-file no arquivo, caso seja otimizado }
               DM.qryConfig.Close;
               DM.qryConfig.ParamByName('completo').AsInteger := DM.Completo;
               DM.qryConfig.Open;
               if DM.qryConfigSN_BACKUP_COMPLETO.AsInteger = 1 then
               begin
                  for J := 0 to Length(listaTabelas) do
                     begin
                        if (listaTabelas[J] = ';') then
                        begin
                           Result := Result + #32 + '--ignore-table=' + GetDatabase + '.' +
                              (Copy(listaTabelas,ultimaPos,(J - ultimaPos)));
                           ultimaPos := J +1;
                        end;

                     end;
                  { Pega a ultima tabela, que não é filtrada pelo for }
                  Result := Result + #32 + '--ignore-table=' + GetDatabase + '.' +
                              (Copy(listaTabelas,ultimaPos,(J - ultimaPos)));

                  Result := Result + #32 + FParameters.Strings[I];

               end
               else
                  Result := Result + FParameters.Strings[I]

            end
            { Altera o Usuario e a senha caso seja uma base que utiliza o projeto de segurança }
            else if FParameters.Names[I] = '--password' then
            begin
             if Length(DM.BackupPass) > 0 then
               Result := Result + FParameters.Names[I] + '=' + DM.BackupPass
             else
               Result := Result + FParameters.Strings[I]
            end
            else if FParameters.Names[I] = '--user' then
            begin
             if Length(DM.BackupPass) > 0 then
               Result := Result + FParameters.Names[I] + '=' + DM.BackupUser
             else
               Result := Result + FParameters.Strings[I]
            end
            else
            Result := Result + FParameters.Strings[I]
      end
      else
         Result := Result + FParameters.Names[I];
   end;
end;

procedure TMySQLDump.ReplaceParameter(const AName, AValue: AnsiString);
begin
   FParameters.Values[AName] := AValue;
end;

procedure TMySQLDump.SetDatabase(const Value: AnsiString);
begin
   FDatabase := Value;
end;

procedure TMySQLDump.SetExePath(const Value: TFileName);
begin
   FExePath := Value;
end;

procedure TMySQLDump.SetHostName(const Value: AnsiString);
begin
   ReplaceParameter('--host', Value);
   FHostName := Value;
end;

procedure TMySQLDump.SetID(const Value: Integer);
begin
   FID := Value;
end;

procedure TMySQLDump.SetPort(const Value: AnsiString);
begin
   ReplaceParameter('--port', Value);
   FPort := Value;
end;

procedure TMySQLDump.SetResultFile(const Value: TFileName);
begin
   ReplaceParameter('--result-file', Value);
   FResultFile := Value;
end;

function TMySQLDump.Stop: Boolean;
begin
   if IsRunning then
   begin
      Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
         FProcessID), 0);
      FProcessID := 0;
   end
   else
      Result := True;
end;

{ TScheduleManager }

procedure TScheduleManager.AssignDatabases(const ADatabases: AnsiString);
var
   I: Integer;
   Temp: TStringList;
begin
   Temp := TStringList.Create;
   FDatabases.Clear;
   try
      Temp.Delimiter := #59;
      Temp.DelimitedText := ADatabases;
      if Temp.Count = 0 then
         FDatabases.Values[DM.conn.Database] := 'false'
      else
         for I := 0 to Temp.Count - 1 do
            FDatabases.Values[Temp.Strings[I]] := 'false';
   finally
      Temp.Free;
   end;
end;

constructor TScheduleManager.Create;
begin
   FEnabled := False;
   FStartDate := Now;
   FStartTime := Time;
   FInterval := 1;
   FSaveDir := GetTempDirectory;
   FFrequency := sfDaily;
   FDatabases := TStringList.Create;
   FDatabases.Delimiter := #59;
   FToleranceInterval := 10000;
end;

destructor TScheduleManager.Destroy;
begin
   FDatabases.Free;
   inherited;
end;

function TScheduleManager.Execute: TExecuteResult;
var
   NewInterval: Cardinal;
   Database: AnsiString;
begin
   Result := erUndefined;
   if FEnabled then
      if TMySQLDump.GetInstance.Running then
         Result := erRunning
      else
      begin
         NewInterval := GetRemainingTime;
         if NewInterval <= FToleranceInterval then
         begin
            if HasNextDatabase then
            begin
               Sleep(NewInterval);
               Database := GetNextDatabase;
               TMySQLDump.GetInstance.Database := Database;
               TMySQLDump.GetInstance.ResultFile := GetResultFile(Database);
               if TMySQLDump.GetInstance.Execute then
               begin
                  FStartDate := Date;
                  Result := erSuccess;
               end
               else
                  Result := erError
            end;
            if not HasNextDatabase then
            begin
               ScheduleNext;
               Result := Execute;
            end;
         end
         else
            Result := erWaiting;
      end
   else
      Result := erDisabled;
end;

function TScheduleManager.GetDatabases: TDatabaseList;
begin
   Result := FDatabases;
end;

function TScheduleManager.GetFrequency: TScheduleFrequency;
begin
   Result := FFrequency;
end;

class function TScheduleManager.GetInstance: TScheduleManager;
begin
   if FInstance = nil then
      FInstance := TScheduleManager.Create;
   Result := FInstance;
end;

function TScheduleManager.GetInterval: Cardinal;
begin
   Result := FInterval;
end;

function TScheduleManager.GetNextDatabase: AnsiString;
var
   I: Integer;
begin
   for I := 0 to FDatabases.Count - 1 do
      if FDatabases.ValueFromIndex[I] = 'false' then
      begin
         Result := FDatabases.Names[I];
         FDatabases.ValueFromIndex[I] := 'true';
         Break;
      end;
end;

function TScheduleManager.GetRemainingTime: Cardinal;
var
   BackupStart: TDateTime;
begin
   ReplaceDate(BackupStart, FStartDate);
   ReplaceTime(BackupStart, FStartTime);

   if Now > BackupStart then
      Result := 0
   else
      Result := MilliSecondsBetween(Now, BackupStart);
end;

function TScheduleManager.GetResultFile(
   const ADatabaseName: AnsiString): TFileName;
const
   SDateTimeFileFormat = 'yyyymmddhhnn';
   SFileNameFormat = '%s_AUT_%s.sql';
   SFilePathFormat = '%s\%s';
var
   FileDateTime, FileName: AnsiString;
begin
   FileDateTime := FormatDateTime(SDateTimeFileFormat, Now);
   FileName := Format(SFileNameFormat, [ADatabaseName, FileDateTime]);
   Result := Format(SFilePathFormat, [FSaveDir, FileName]);
   Result := AnsiQuotedStr(Result, #34);
end;

function TScheduleManager.GetSaveDir: AnsiString;
begin
   Result := FSaveDir;
end;

function TScheduleManager.GetSn_mongo: Boolean;
begin
   Result := FSn_mongo;
end;

function TScheduleManager.GetStartDate: TDateTime;
begin
   Result := FStartDate;
end;

function TScheduleManager.GetStartTime: TTime;
begin
   Result := FStartTime;
end;

function TScheduleManager.HasNextDatabase: Boolean;
var
   I: Integer;
begin
   Result := False;
   for I := 0 to FDatabases.Count - 1 do
      if FDatabases.ValueFromIndex[I] = 'false' then
      begin
         Result := True;
         Break;
      end;
end;

function TScheduleManager.IsEnabled: Boolean;
begin
   Result := FEnabled;
end;

function TScheduleManager.IsStarted: Boolean;
var
   I: Integer;
begin
   Result := False;
   for I := 0 to FDatabases.Count - 1 do
      if FDatabases.ValueFromIndex[I] = 'true' then
      begin
         Result := True;
         Break;
      end;
end;

procedure TScheduleManager.ScheduleNext;
var
   I: Integer;
   NewDate: TDateTime;
begin
   for I := 0 to FDatabases.Count - 1 do
      FDatabases.ValueFromIndex[I] := 'false';
   case FFrequency of
      sfDaily:
         FStartDate := IncDay(FStartDate, FInterval);
      sfHourly:
         begin
            ReplaceDate(NewDate, Date);
            ReplaceTime(NewDate, FStartTime);
            NewDate := IncHour(NewDate, FInterval);
            FStartTime := TTime(NewDate);
            FStartDate := TDate(NewDate);
         end;
   end;
   DM.SaveSchedule;
end;

procedure TScheduleManager.SetEnabled(const Value: Boolean);
begin
   FEnabled := Value;
end;

procedure TScheduleManager.SetFrequency(const Value: TScheduleFrequency);
begin
   FFrequency := Value;
end;

procedure TScheduleManager.SetInterval(const Value: Cardinal);
begin
   FInterval := Value;
end;

procedure TScheduleManager.SetSaveDir(const Value: AnsiString);
begin
   FSaveDir := Value;
end;

procedure TScheduleManager.SetSn_mongo(const Value: Boolean);
begin
   FSn_mongo := Value;
end;

procedure TScheduleManager.SetStartDate(const Value: TDateTime);
begin
   FStartDate := Value;
end;

procedure TScheduleManager.SetStartTime(const Value: TTime);
begin
   FStartTime := Value;
end;

{ TMySQLRestore }

procedure TMySQLRestore.AddAfterCommand(const Value: AnsiString);
var
   I: Integer;
begin
   if not FAfterComands.Find(Value, I) then
      FAfterComands.Add(Value);
end;

procedure TMySQLRestore.AddBeforeCommand(const Value: AnsiString);
var
   I: Integer;
begin
   if not FBeforeCommands.Find(Value, I) then
      FBeforeCommands.Add(Value);
end;

procedure TMySQLRestore.CatchLastError;
begin
   FLastError := SysErrorMessage(Windows.GetLastError);
end;

constructor TMySQLRestore.Create;
begin
   FBeforeCommands := TCommandList.Create;
   FAfterComands := TCommandList.Create;
   FBeforeCommands.LineBreak := #59;
   FAfterComands.LineBreak := #59;
   FProcessID := 0;
end;

destructor TMySQLRestore.Destroy;
begin
   FBeforeCommands.Free;
   FAfterComands.Free;
   inherited;
end;

function TMySQLRestore.Execute: Boolean;
var
   SUInfo: TStartupInfo;
   ProcessInfo: TProcessInformation;
begin
   FillChar(SUInfo, SizeOf(SUInfo), #0);
   SUInfo.cb := SizeOf(SUInfo);
   SUInfo.dwFlags := STARTF_USESHOWWINDOW;
   SUInfo.wShowWindow := SW_HIDE;

   Result := CreateProcess(nil, PChar(ParseCommand), nil, nil, False,
      CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, nil, SUInfo,
      ProcessInfo);

   if Result then
   begin
      FProcessID := ProcessInfo.dwProcessID;
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
   end
   else
      CatchLastError;
end;

function TMySQLRestore.GetDatabase: AnsiString;
begin
   Result := FDatabase;
end;

function TMySQLRestore.GetExePath: AnsiString;
begin
   Result := FExePath;
end;

function TMySQLRestore.GetHostName: AnsiString;
begin
   Result := FHostName;
end;

class function TMySQLRestore.GetInstance: TMySQLRestore;
begin
   if FInstance = nil then
      FInstance := TMySQLRestore.Create;
   Result := FInstance;
end;

function TMySQLRestore.GetLastError: AnsiString;
begin
   Result := FLastError;
end;

function TMySQLRestore.GetPassword: AnsiString;
begin
   Result := FPassword;
end;

function TMySQLRestore.GetPort: Cardinal;
begin
   Result := FPort;
end;

function TMySQLRestore.GetSourceFile: TFileName;
begin
   Result := FSourceFile;
end;

function TMySQLRestore.GetUser: AnsiString;
begin
   Result := FUser;
end;

function TMySQLRestore.IsRunning: Boolean;
var
   HasNext: BOOL;
   SnapHandle: THandle;
   ProcEntry: TProcessEntry32;
begin
   if FProcessID > 0 then
   begin
      SnapHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
      ProcEntry.dwSize := SizeOf(ProcEntry);
      HasNext := Process32First(SnapHandle, ProcEntry);
      Result := False;
      while Integer(HasNext) <> 0 do
      begin
         if FProcessID = ProcEntry.th32ProcessID then
         begin
            Result := True;
            Break;
         end;
         HasNext := Process32Next(SnapHandle, ProcEntry);
      end;
      CloseHandle(SnapHandle);
      if not Result then
         FProcessID := 0;
   end
   else
      Result := False;
end;

function TMySQLRestore.ParseAfterCommands: AnsiString;
begin
   Result := FAfterComands.Text;
end;

function TMySQLRestore.ParseBeforeCommands: AnsiString;
begin
   Result := FBeforeCommands.Text;
end;

function TMySQLRestore.ParseCommand: AnsiString;
const
   SCommandFmt = '%s %s --host=%s --port=%d --user=%s --password=%s ' +
      '--execute="%s"';
begin
   Result := Format(SCommandFmt, [FExePath, FDatabase, FHostName, FPort, FUser,
      FPassword, ParseExtraCommands]);
end;

function TMySQLRestore.ParseExtraCommands: AnsiString;
const
   SSrcFileFmt = 'source "%s";';
begin
   Result := ParseBeforeCommands;
   Result := Result + Format(SSrcFileFmt, [FSourceFile]);
   Result := Result + ParseAfterCommands;
   if not AnsiEndsStr(#59, Result) then
      Result := Result + #59;
end;

procedure TMySQLRestore.SetDatabase(const Value: AnsiString);
begin
   FDatabase := Value;
end;

procedure TMySQLRestore.SetExePath(const Value: AnsiString);
begin
   FExePath := Value;
end;

procedure TMySQLRestore.SetHostName(const Value: AnsiString);
begin
   FHostName := Value;
end;

procedure TMySQLRestore.SetPassword(const Value: AnsiString);
begin
   FPassword := Value;
end;

procedure TMySQLRestore.SetPort(const Value: Cardinal);
begin
   FPort := Value;
end;

procedure TMySQLRestore.SetSourceFile(const Value: TFileName);
begin
   FSourceFile := Value;
end;

procedure TMySQLRestore.SetUser(const Value: AnsiString);
begin
   FUser := Value;
end;

function TMySQLRestore.Stop: Boolean;
begin
   if IsRunning then
   begin
      Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
         FProcessID), 0);
      FProcessID := 0;
   end
   else
      Result := True;
end;

function GetScheduleManager: TScheduleManager;
begin
   Result := TScheduleManager.GetInstance;
end;

initialization
   TMySQLDump.GetInstance.ExePath := 'mysqldump';
   TMySQLDump.GetInstance.AddParameter('--add-drop-table');
   TMySQLDump.GetInstance.AddParameter('-C');
   TMySQLDump.GetInstance.AddParameter('-a');
   TMySQLDump.GetInstance.AddParameter('-K');
   TMySQLDump.GetInstance.AddParameter('--extended-insert', 'FALSE');
   TMySQLDump.GetInstance.AddParameter('--hex-blob');
   TMySQLDump.GetInstance.AddParameter('--protocol', 'tcp');
   TMySQLDump.GetInstance.AddParameter('-R');
   TMySQLDump.GetInstance.AddParameter('--triggers');

   TMySQLRestore.GetInstance.ExePath := 'mysql';
   TMySQLRestore.GetInstance.AddBeforeCommand('SET GLOBAL log_bin_trust_function_creators=1');
   TMySQLRestore.GetInstance.AddBeforeCommand('SET FOREIGN_KEY_CHECKS=0');
   TMySQLRestore.GetInstance.AddAfterCommand('SET FOREIGN_KEY_CHECKS=1');

finalization
   TMySQLDump.GetInstance.Free;
   TMySQLRestore.GetInstance.Free;
   TScheduleManager.GetInstance.Free;

end.
