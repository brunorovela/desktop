unit UDM;

interface

uses
   SysUtils, Classes, IniFiles, Windows, Dialogs, Forms, ZDbcIntfs,
   UZStartConnection, ZConnection, ZSqlMonitor, ExtCtrls;

type
   TTipoAcesso = (
      taNenhum,
      taEntradaLiberada,
      taSaidaLiberada,
      taEntradaBloqueada,
      taSaidaBloqueada
   );

   TDM = class(TDataModule)
      db: TZConnection;
      SQLMonitor: TZSQLMonitor;
      startConn: TUMZStartConnection;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure SQLMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
      procedure startConnDefaultConnection(Sender: TObject);
   private
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function Decrypt(const S: AnsiString): AnsiString;
   public
      function GetTipoAcesso(const Cartao: AnsiString): TTipoAcesso;
      procedure RegistraEntrada(const Cartao: AnsiString);
      procedure RegistraSaida(const Cartao: AnsiString);
      function IsDebugging: Boolean;
      function TryLoadDebugger: Boolean;
      function DataAtual(): TDateTime;
   end;

var
   DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   SQLMonitor.Active := IsDebugging and TryLoadDebugger;

   IniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);
   ConnIni := TIniFile.Create(IniPath);
   try
      try
         startConn.IniPath := IniPath;
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
         startConn.ConnectUnimestre;
      except
         on E: EUMZDatabaseError do raise;
      end;
   finally
      ConnIni.Free;
   end;

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   SQLMonitor.Active := False;
   @FDLLProc := nil;
   FreeLibrary(FDLLHandle);
end;

function TDM.Decrypt(const S: AnsiString): AnsiString;
const
   Key = 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';
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
      try
         OffSet := StrToInt('$' + Copy(S, 1, 2));
      except
         raise EUMZDatabaseError.Create(SDecryptError);
      end;
      I := 3;

      repeat
         try
            Code := StrToInt('$' + Copy(S, I, 2));
         except
            raise EUMZDatabaseError.Create(SDecryptError);
         end;

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

function TDM.GetTipoAcesso(const Cartao: AnsiString): TTipoAcesso;
const
   SQL = 'SELECT FCD_TA_GET_ACESSO(?) FROM DUAL';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := taNenhum;
   Stmt := db.DbcConnection.PrepareStatement(SQL);
   
   try
      Stmt.SetString(1, Cartao);

      try
         Rs := Stmt.ExecuteQueryPrepared;

         if Rs.Next then
            Result := TTipoAcesso(Rs.GetInt(1));
            
      finally
         Rs.Close;
         Rs := nil;
      end;
      
   finally
      Stmt.Close;
      Stmt := nil;
   end;
   
end;

function TDM.IsDebugging: Boolean;
var
   I: Integer;
begin
   Result := False;
   for I := 1 to ParamCount do
      if AnsiUpperCase(ParamStr(I)) = 'DEBUG' then
      begin
         Result := True;
         Break;
      end;

   {$WARN SYMBOL_PLATFORM OFF}
   if not Result then
      Result := DebugHook <> 0;
   {$WARN SYMBOL_PLATFORM ON}
end;

procedure TDM.RegistraEntrada(const Cartao: AnsiString);
const
   SQL = 'CALL SPX_TA_REGISTRA_ENTRADA(?)';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := db.DbcConnection.PrepareStatement(SQL);
   try
      Stmt.SetString(1, Cartao);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TDM.RegistraSaida(const Cartao: AnsiString);
const
   SQL = 'CALL SPX_TA_REGISTRA_SAIDA(?)';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := db.DbcConnection.PrepareStatement(SQL);
   try
      Stmt.SetString(1, Cartao);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TDM.SQLMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
   OutputDebugString(PAnsiChar(Event.Message));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
const
   DefPassword = 'C946E11A2BA225D2095C9F5683EF5590BF';
   ConnErrorMsg = 'Ocorreu um erro ao tentar conectar no banco de dados do Unimestre: %s';
var
   ConnIni: TIniFile;
   S: AnsiString;
begin
   ConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');
   try
      try
         db.HostName := ConnIni.ReadString('Conexao.Local', 'Servidor', 'localhost');
         db.Database := ConnIni.ReadString('Conexao.Local', 'Banco', 'unimestre');
         db.User := ConnIni.ReadString('Conexao.Local', 'Usuario', 'academico');
         db.Password := Decrypt(ConnIni.ReadString('Conexao.Local', 'Senha', DefPassword));
         db.Port := ConnIni.ReadInteger('Conexao.Local', 'Porta', 3306);
         db.Protocol := ConnIni.ReadString('Conexao.Local', 'Protocolo', 'mysql-5');

         if not db.Connected then
            db.Connect;
            
      except

         on E: Exception do
         begin
            S := Format(ConnErrorMsg, [E.Message]);
            MessageDlg(S, mtError, [mbOK], -1);
            Application.ProcessMessages;
            Application.Terminate;
         end;
                  
      end;
      
   finally
      ConnIni.Free;
   end;
end;

function TDM.TryLoadDebugger: Boolean;
begin
   if FileExists('umSQLdebugger.dll') then
   begin
 
      FDLLHandle := LoadLibrary(PChar('umSQLdebugger.dll'));
 
      if FDLLHandle > 0 then
      begin
         @FDLLProc := GetProcAddress(FDLLHandle, PChar('LogEvent'));
         Result := Assigned(@FDLLProc);
      end
      else
         Result := False;
   end
   else
      Result := False;
end;

function TDM.DataAtual(): TDateTime;
const
  SQL = 'SELECT NOW() AS data_atual';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   try
      Stmt := db.DbcConnection.PrepareStatement(SQL);
      try
         Rs := Stmt.ExecuteQueryPrepared;

         if Rs.Next then
            Result := Rs.GetTimestamp(1);

      finally
         Rs.Close;
         Rs := nil;
      end;

   finally
      Stmt.Close;
      Stmt := nil;
   end;
End;

end.
