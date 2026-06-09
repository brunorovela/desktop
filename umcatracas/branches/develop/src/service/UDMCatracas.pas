unit UDMCatracas;

interface

uses
   SysUtils, Classes, ZConnection, UZStartConnection, IniFiles, ZSqlMonitor,
   Windows;

type
   TDebuggerLogEvent = procedure(Event: Pointer); stdcall;

   TDMCatracas = class(TDataModule)
      conn: TZConnection;
      sqlMonitor: TZSQLMonitor;
      startConn: TUMZStartConnection;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
      procedure startConnDefaultConnection(Sender: TObject);
   private
      FSettings: TIniFile;
      FDebuggerDll: THandle;
      FOnDebuggerLog: TDebuggerLogEvent;
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
      procedure salvarLog(aMensagem: String);
   end;

var
   DMCatracas: TDMCatracas;

implementation

uses
   uUMAuth;

{$R *.dfm}

procedure TDMCatracas.DataModuleCreate(Sender: TObject);
const
   SIniPathFmt = '%sunimestre.ini';
var
   IniPath, IniDir, Pass: AnsiString;
   xUsuario: String;
   xActive: Boolean;
begin
   try
      IniDir := ExtractFilePath(ParamStr(0));
      IniPath := Format(SIniPathFmt, [IniDir]);
      FSettings := TIniFile.Create(IniPath);

      Pass := FSettings.ReadString('Conexao', 'Senha', '87B25FC170E61D28ED60928B8E');
      Pass := TUMAuthCryptography.crypt(Pass, actDecode);
      xUsuario := FSettings.ReadString('Conexao', 'Usuario', 'umstart');
      xActive := FSettings.ReadBool('Conexao', 'Usa.Start', False);

      startConn.IniPath := IniPath;
      startConn.Active := xActive;
      startConn.Protocol := FSettings.ReadString('Conexao', 'Protocolo', 'mysql-5');
      startConn.HostName := FSettings.ReadString('Conexao', 'Servidor', 'localhost');
      startConn.Port := FSettings.ReadInteger('Conexao', 'Porta', 3306);
      startConn.Database := FSettings.ReadString('Conexao', 'Banco', 'umstart');
      startConn.User := xUsuario;
      startConn.Password := Pass;

      startConn.ConnectUnimestre;
   except
      on E: Exception do
         salvarLog('[DataModuleCreate] Ocorreu um erro ao tentar se conectar na base de dados: ' + E.Message);

   end;
end;

procedure TDMCatracas.DataModuleDestroy(Sender: TObject);
begin
   if conn.Connected then
      conn.Disconnect;
   FreeAndNil(FSettings);
end;

function TDMCatracas.IsDebugging: Boolean;
var
   I: Integer;
begin
   Result := False;

   for I := 1 to ParamCount do
   begin
      if AnsiUpperCase(ParamStr(I)) = 'DEBUG' then
      begin
         Result := True;
         Exit;
      end;
   end;

   {$WARN SYMBOL_PLATFORM OFF}
   Result := DebugHook <> 0;
   {$WARN SYMBOL_PLATFORM ON}
end;

procedure TDMCatracas.salvarLog(aMensagem: String);
var
   xLog: TextFile;
begin
   try
      AssignFile(xLog, ExtractFileDir(ParamStr(0)) + '\uni-servico-catracas.log');

      Rewrite(xLog);

      aMensagem := '[' + DateTimeToStr(Now) + ']: ' + aMensagem;
      Writeln(xLog, aMensagem);

      Closefile(xLog);
   except
   end;
end;

procedure TDMCatracas.sqlMonitorLogTrace(Sender: TObject;
  Event: TZLoggingEvent);
begin
   FOnDebuggerLog(Pointer(Event));

   {$WARN SYMBOL_PLATFORM OFF}
   if DebugHook <> 0 then
   begin
      OutputDebugString(PAnsiChar(Event.Message));
   end;
   {$WARN SYMBOL_PLATFORM ON}
end;

procedure TDMCatracas.startConnDefaultConnection(Sender: TObject);
var
   Pass: AnsiString;
begin
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;

   try
      Pass := FSettings.ReadString('Conexao', 'Senha', '6F9D5993AC20A05E9C30B36297D379BC6A');
      Pass := TUMAuthCryptography.crypt(Pass, actDecode);

      conn.Protocol := FSettings.ReadString('Conexao', 'Protocolo', 'mysql-5');
      conn.HostName := FSettings.ReadString('Conexao', 'Servidor', 'localhost');
      conn.Port := FSettings.ReadInteger('Conexao', 'Porta', 3306);
      conn.Database := FSettings.ReadString('Conexao', 'Banco', 'unimestre');
      conn.User := FSettings.ReadString('Conexao', 'Usuario', 'academico');
      conn.Password := Pass;
      conn.Connect;
   except
      on E: Exception do
         salvarLog('[startConnDefaultConnection] Ocorreu um erro ao tentar se conectar na base de dados: ' + E.Message);
   end;
end;

function TDMCatracas.TryLoadDebugger: Boolean;
const
   SDllName = 'umSQLdebugger.dll';
   SLogEventName = 'LogEvent';
begin
   Result := False;
   
   if not FileExists(SDllName) then
   begin
      Exit;
   end;

   FDebuggerDll := LoadLibrary(SDllName);

   if FDebuggerDll = 0 then
   begin
      Exit;
   end;

   @FOnDebuggerLog := GetProcAddress(FDebuggerDll, SLogEventName);
   Result := Assigned(@FOnDebuggerLog);
end;

end.
