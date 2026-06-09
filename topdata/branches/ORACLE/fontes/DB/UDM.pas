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
      taSaidaBloqueada);

   TDM = class(TDataModule)
      db: TZConnection;
      dbRemote: TZConnection;
      SQLMonitor: TZSQLMonitor;
      startConn: TUMZStartConnection;
      startConnRemote: TUMZStartConnection;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure SQLMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
      procedure startConnDefaultConnection(Sender: TObject);
      procedure startConnRemoteDefaultConnection(Sender: TObject);
   private
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      function Decrypt(const S: AnsiString): AnsiString;

   public
      function GetTipoAcesso(const Cartao: AnsiString; const Connection: IZConnection): TTipoAcesso;
      //function GetTipoAcesso(const Cartao: AnsiString): TTipoAcesso;
      function FindConnection(const Cartao: AnsiString): IZConnection;
      procedure RegistraEntrada(const Cartao: AnsiString; const Connection: IZConnection);
      procedure RegistraSaida(const Cartao: AnsiString; const Connection: IZConnection);
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
   // adrw SQLMonitor.Active := IsDebugging and TryLoadDebugger;

   IniPath := Format('%s%sunimestre.ini', [ExtractFilePath(ParamStr(0)), PathDelim]);
   ConnIni := TIniFile.Create(IniPath);
   try
      try
         startConn.IniPath := IniPath;
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
         startConn.ConnectUnimestre;

         startConnRemote.IniPath := IniPath;
         startConnRemote.Active := ConnIni.ReadBool('Conexao.Remoto', 'Usa.Start', False);

         // adrw startConnRemote.ConnectUnimestre;
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

function TDM.FindConnection(const Cartao: AnsiString): IZConnection;
const
   SQL =
    '   SELECT  '
  + '      CODIGOALUNO '
  + '  FROM '
  + '      MATRICULAS '
  + '  WHERE '
  + '     CODIGOALUNO = ? AND '
  + '      ANOSEMESTRE BETWEEN FCD_GET_ANOSEMESTRE_MINIMO(NULL) AND '
  + '     FCD_GET_ANOSEMESTRE_CORRENTE(NULL)';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := nil;

    // inicia a conexao
    startConnRemote.ConnectUnimestre;

    // adrw
    // if not db.Connected then
        // db.Connect;

   Stmt := db.DbcConnection.PrepareStatement(SQL);
   try
      Stmt.SetString(1, Cartao);

      try
         try
            Rs := Stmt.ExecuteQueryPrepared;

            if Rs.Next then
            begin
               Result := db.DbcConnection;
            end;
         except
            on E: EZSQLException do
            begin
               db.Reconnect;
               FindConnection(Cartao);
            end;
         end;
            
      finally
         Rs.Close;
         Rs := nil;
         startConnRemote.Disconnect;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
      startConnRemote.Disconnect;
   end;

   if Result = nil then
   begin
      // adrw
      // if not dbRemote.Connected then
         // dbRemote.Connect;

      startConnRemote.ConnectUnimestre;
      Stmt := dbRemote.DbcConnection.PrepareStatement(SQL);
      try
         Stmt.SetString(1, Cartao);

         try
            try
               Rs := Stmt.ExecuteQueryPrepared;

               if Rs.Next then
                  Result := dbRemote.DbcConnection;
            except
               on E: EZSQLException do
               begin
                  dbRemote.Reconnect;
                  FindConnection(Cartao);
               end;
            end;
         finally
            Rs.Close;
            Rs := nil;
            startConnRemote.Disconnect;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
         startConnRemote.Disconnect;
      end;
   end;
end;

function TDM.GetTipoAcesso(const Cartao: AnsiString;
   const Connection: IZConnection): TTipoAcesso;
const
   SQL = 'SELECT FCD_TA_GET_ACESSO(?) FROM DUAL';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := taNenhum;

   //adrw if Connection.IsClosed then
      // Connection.Open;

      // inicia a conexao
      startConnRemote.ConnectUnimestre;

   if Connection <> nil then
   begin
      Stmt := Connection.PrepareStatement(SQL);
      try
         Stmt.SetString(1, Cartao);

         try
            try
               Rs := Stmt.ExecuteQueryPrepared;

               if Rs.Next then
                  Result := TTipoAcesso(Rs.GetInt(1));
            except
               on E: EZSQLException do
               begin
                  Connection.Close;
                  Connection.Open;
                  Result := GetTipoAcesso(Cartao, Connection);
               end;
            end;
         finally
            Rs.Close;
            Rs := nil;
            startConnRemote.Disconnect;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
         startConnRemote.Disconnect;
      end;
   end
   else
   begin
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
end;

{function TDM.GetTipoAcesso(const Cartao: AnsiString): TTipoAcesso;
const
   SQL = 'SELECT FCD_TA_GET_ACESSO(?) FROM DUAL';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := taNenhum;

    // inicia a conexao
    startConnRemote.ConnectUnimestre;

    // adrw
    // if not db.Connected then
        // db.Connect;

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
end;}

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

procedure TDM.RegistraEntrada(const Cartao: AnsiString;
   const Connection: IZConnection);
const
   SQL = 'CALL SPX_TA_REGISTRA_ENTRADA(?)';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;   
begin

   // adrw if Connection.IsClosed then
      // adrw Connection.Open;

   // inicia a conexao
   startConnRemote.ConnectUnimestre;

   if Connection <> nil then
   begin
      Stmt := Connection.PrepareStatement(SQL);
      try
         Stmt.SetString(1, Cartao);
         try
            Stmt.ExecutePrepared;
         except
            on E: EZSQLException do
            begin
               Connection.Close;
               Connection.Open;
               RegistraEntrada(Cartao, Connection);
            end;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
         startConnRemote.Disconnect;
      end;
   end
   else
   begin
     Stmt := db.DbcConnection.PrepareStatement(SQL);

     try
        Stmt.SetString(1, Cartao);

        try
          Stmt.ExecuteQueryPrepared;
        finally
           Rs.Close;
           Rs := nil;
        end;

     finally
        Stmt.Close;
        Stmt := nil;
     end;
   end;
end;

procedure TDM.RegistraSaida(const Cartao: AnsiString;
   const Connection: IZConnection);
const
   SQL = 'CALL SPX_TA_REGISTRA_SAIDA(?)';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin

   // adrw if Connection.IsClosed then
      // adrw Connection.Open;

   // inicia a conexao
   startConnRemote.ConnectUnimestre;
   
   if Connection <> nil then
   begin
      Stmt := Connection.PrepareStatement(SQL);
      try
         Stmt.SetString(1, Cartao);
         try
            Stmt.ExecutePrepared;
         except
            on E: EZSQLException do
            begin
               Connection.Close;
               Connection.Open;
               RegistraSaida(Cartao, Connection);
            end;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
         startConnRemote.Disconnect;
      end;
   end
   else
   begin
     Stmt := db.DbcConnection.PrepareStatement(SQL);

     try
        Stmt.SetString(1, Cartao);

        try
          Stmt.ExecuteQueryPrepared;
        finally
           Rs.Close;
           Rs := nil;
        end;

     finally
        Stmt.Close;
        Stmt := nil;
     end;
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

procedure TDM.startConnRemoteDefaultConnection(Sender: TObject);
const
   DefPassword = 'C946E11A2BA225D2095C9F5683EF5590BF';
   ConnErrorMsg = 'Ocorreu um erro ao tentar conectar no banco de dados remoto do Unimestre: %s';
var
   ConnIni: TIniFile;
   S: AnsiString;
begin
   ConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');
   try
      try
         dbRemote.HostName := ConnIni.ReadString('Conexao.Remoto', 'Servidor', 'localhost');
         dbRemote.Database := ConnIni.ReadString('Conexao.Remoto', 'Banco', 'unimestre');
         dbRemote.User := ConnIni.ReadString('Conexao.Remoto', 'Usuario', 'academico');
         dbRemote.Password := Decrypt(ConnIni.ReadString('Conexao.Remoto', 'Senha', DefPassword));
         dbRemote.Port := ConnIni.ReadInteger('Conexao.Remoto', 'Porta', 3306);
         dbRemote.Protocol := ConnIni.ReadString('Conexao.Remoto', 'Protocolo', 'mysql-5');

         if not dbRemote.Connected then
            dbRemote.Connect;
            
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
   // adr
   {
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
      }

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
        // inicia a conexao
        startConnRemote.ConnectUnimestre;

      Stmt := db.DbcConnection.PrepareStatement(SQL);
      try
         Rs := Stmt.ExecuteQueryPrepared;

         if Rs.Next then
         begin
            Result := Rs.GetTimestamp(1);
         end;
      Except
      end;

      try
        Rs.Close;
        Rs := nil;
      except
      end;

          // fecha a conexao
          startConnRemote.Disconnect;

    finally
        if stmt <> nil then
        begin
            stmt.Close;
        end;

        stmt := nil;

        // fecha a conexao
        startConnRemote.Disconnect;
   end;


End;

end.
