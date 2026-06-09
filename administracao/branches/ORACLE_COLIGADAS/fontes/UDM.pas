unit UDM;

interface

uses
   SysUtils, Classes, ExtCtrls, ZConnection, ZAbstractRODataset, IniFiles,
   Windows, Forms, ImgList, Controls, ZipMstr19, DB, ZAbstractDataset,
   UZDataset, UUtils, UMySQLDump, ZSqlUpdate, Menus, Math, StrUtils, ZDbcIntfs,
   ZSqlMonitor, UZStartConnection, Variants, uIUMDataModule, uLoginManager,
   uUsuario, Dialogs, UZDbcFuncs;
const
   CHAVE_LITE = '0DQOY2DjC1jLSZ7MNR74j8gQqVujgmVq';

type
   TIniSection = (isConnection, isBackup);

   TBackupIdentifier = (biMySQL, biMySQLDump);

   TConnectionIdentifier = (ciDatabase, ciPassword, ciPort, ciProtocol,
      ciServer, ciUser);

   {TPermissionLevel = (plAccess = 1, plInsert = 2, plEdit = 4, plDelete = 8,
      plSpecial = 16);}

   TCryptTypes = (ctEncode, ctDecode);

   TDM = class(TDataModule, IUMDataModule)
      tmAgenda: TTimer;
      conn: TZConnection;
      qryConfig: TUMZQuery;
      qryConfigNM_SERVIDOR: TStringField;
      qryConfigNM_USUARIO: TStringField;
      qryConfigDS_SENHA: TStringField;
      qryConfigDT_BACKUP: TDateTimeField;
      qryConfigHR_BACKUP: TTimeField;
      qryConfigDS_CAMINHO_BKP: TStringField;
      qryConfigDS_BASES: TStringField;
      qryConfigNR_INTERVALO: TSmallintField;
      qryConfigNR_TIPO: TSmallintField;
      qryConfigSN_ATIVO: TSmallintField;
      qryPermissoes: TUMZReadOnlyQuery;
      qryPermissoesCD_PESSOA: TIntegerField;
      qryPermissoesDS_LOGIN: TStringField;
      qryPermissoesDS_CHAVE: TStringField;
      qryPermissoesNR_PERMISSAO: TIntegerField;
      qryPermissoesCD_COLIGADA: TIntegerField;
      qryUsuario: TUMZReadOnlyQuery;
      qryUsuarioCD_PESSOA: TIntegerField;
      qryUsuarioDS_LOGIN: TStringField;
      qryUsuarioDS_SENHA: TStringField;
      tiAgenda: TTrayIcon;
      zmZipper: TZipMaster19;
      qryDataHora: TUMZReadOnlyQuery;
      qryDataHoraDATAHORA: TDateTimeField;
      pmOpcoes: TPopupMenu;
      miAbrir: TMenuItem;
      miBackup: TMenuItem;
      miAgendador: TMenuItem;
      qryConfigSN_ALTERADO: TSmallintField;
      sqlMonitor: TZSQLMonitor;
      startConn: TUMZStartConnection;
      qryConfigSN_AGENDADO: TIntegerField;
      qyVerificaPermissaoLite: TUMZQuery;
      dsConfig: TDataSource;
      qryConfigUpd: TZUpdateSQL;
      qryConfigSN_BACKUP_COMPLETO: TSmallintField;
      qryTabelasIgnoradas: TUMZReadOnlyQuery;
      qryTabelasIgnoradasDS_VALOR: TMemoField;
      qryConfigSN_BACKUP_MONGO: TSmallintField;
      qryConfigMAX_PACKET: TStringField;
    qryHistorico: TUMZQuery;
    qryHistoricoCD_BACKUP: TIntegerField;
    qryHistoricoDT_DATA_INICIO: TDateField;
    qryHistoricoDT_DATA_FIM: TDateField;
    qryHistoricoNR_HORA_INICIO: TTimeField;
    qryHistoricoNR_HORA_FIM: TTimeField;
    qryHistoricoSN_COMPLETO: TSmallintField;
    qryHistoricoNR_TAMANHO_BACKUP: TFloatField;
    qryHistoricoDS_IP_COMPUTADOR: TStringField;
    qryHistoricoDS_DATABASES: TStringField;
    qryHistoricoDS_MYSQLDUMP: TMemoField;
    qryHistoricoSN_MODULO_ADMINISTRACAO: TSmallintField;
      procedure startConnDefaultConnection(Sender: TObject);
      procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
      procedure miAgendadorClick(Sender: TObject);
      procedure miBackupClick(Sender: TObject);
      procedure pmOpcoesPopup(Sender: TObject);
      procedure miAbrirClick(Sender: TObject);
      procedure tmAgendaTimer(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
      procedure DataModuleCreate(Sender: TObject);
      procedure SetUsuarioLogado( UsuarioLogado : TUsuario );
      function GetDB() : TZConnection;
      function GetUsuarioLogado: TUsuario;
   private
      FYearSemesterInc: Integer;
      FSettings: TIniFile;
      FForcedStartup: Boolean;
      FForcedDatabases: TStringList;
      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
      {Variavel para alterar a basr do backup manual, porque ele não deixa se criado fora do dm}
      FMBases: string;
      FBackupUser: AnsiString;
      FBackupPass: AnsiString;

      function GetMBases: AnsiString;
      procedure SetMBases(const Value: AnsiString);
      function Connect: Boolean;
      function GetBackupDirectory: AnsiString;
      function GetDateTimeFromDB: TDateTime;
      function IsDebugging: Boolean;
      function LoadIniSettings: Boolean;
      function TryLoadDebugger: Boolean;
      procedure CompressAllFiles;
      procedure CallScheduleManager;
      procedure LoadMySQLApp;
      procedure LoadMySQLDumpApp;
      procedure LoadScheduleManager;
      procedure LoadZipperLibrary;
      procedure ReLoadSettings;
      procedure ReOpenApplication;
      procedure SetBackupDirectory(const Value: AnsiString);
      procedure StartForcedBackup;
      procedure UnloadZipperLibrary;
   public
      Lite: Boolean;
      UsuarioLogado: TUsuario;
      Agendado: Integer;
      Completo: Integer;
      Contador : Integer;
      completo_selecionado: Boolean;
      procedure CriarConsulta( var DataSet : TUMZQuery ); overload;
      procedure CriarConsulta( var DataSet : TUMZReadOnlyQuery ); overload;
      procedure SetLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0; ds_observacoes: string = ''); overload;
      procedure executaBackupMongo(dirBkp: String);
      function CompressFile(const FilePath: AnsiString): Boolean;
      function Logon(const ALogin, APassword: AnsiString): Boolean;
      function UnCompressFile(const FilePath: AnsiString): Boolean;
      function GetCurrYearSemester: string;
      function DecYearSemester(const Value: string): string;
      function IncYearSemester(const Value: string): string;
      function UseYearSemester: Boolean;
      function NewHistoryRecord: Integer;
      procedure CreateDirectoryBackup(const FilePath: AnsiString);
      procedure DisableScheduler;
      procedure EnableScheduler;
      procedure SaveSchedule;
      procedure LoadYearSemesterInc;
      procedure FinishBackup;
      property BackupDirectory: AnsiString read GetBackupDirectory
         write SetBackupDirectory;
      property MBases: string read GetMBases
         write SetMBases;

      property DateTimeFromDB: TDateTime read GetDateTimeFromDB;
      { Retorna TRUE caso seja LITE ou FALSE caso seja FULL }
      function GetChavePermissaoLite(const Chave: string; const ChaveModulo: string): Boolean;
       Function DataAtual(): TDateTime;
      function UMCrypt(sText: string; Action: TCryptTypes = ctEncode; Key: string = ''): string;
      property BackupUser: AnsiString read FBackupUser;
      property BackupPass: AnsiString read FBackupPass;   
   end;
var
   DM: TDM;

implementation

uses
   UFPrincipal;

const
   IniSections: array [TIniSection] of AnsiString = ('Conexao', 'Backup');
   BackupIdentifiers: array [TBackupIdentifier] of AnsiString = ('mysql',
      'mysqldump');
   BackupDefaults: array [TBackupIdentifier] of AnsiString = ('mysql',
      'mysqldump');

{$R *.dfm}

{ TDM }

procedure TDM.CallScheduleManager;
const
   SSuccessHint = 'Um processo de backup agendado foi inicializado...';
   SErrorHint = '1 - Ocorreu um erro na tentativa de inicializar o backup...';
   SWaitingHint = 'O próximo backup será iniciado em %s às %s';
   SSuccessEvent = 'Processo de backup inicializado pelo agendador com sucesso';
   SErrorEvent = '2 - Ocorreu um erro na tentativa de inicializar o backup: %s';
   SInfoEvent = 'O processo de backup já foi inicializado.';
var
   MsgHint: AnsiString;
begin
   case TScheduleManager.GetInstance.Execute of
      erSuccess:
         begin
            WriteEventLog(SSuccessEvent, ekSuccess);
            MsgHint := SSuccessHint;
         end;
      erError:
         begin
            WriteEventLog(
               Format(SErrorEvent, [TMySQLDump.GetInstance.LastError]),
               ekError);
            MsgHint := SErrorHint;
         end;
      erRunning:
         begin
            WriteEventLog(SInfoEvent, ekInfo);
            MsgHint := EmptyStr;
         end;
      erWaiting:
         begin
            MsgHint := Format(SWaitingHint,
               [DateToStr(TScheduleManager.GetInstance.StartDate),
                TimeToStr(TScheduleManager.GetInstance.StartTime)]);
            CompressAllFiles;
         end;
      else
         CompressAllFiles;
   end;
   if MsgHint <> EmptyStr then
   begin
      tiAgenda.BalloonHint := MsgHint;
      tiAgenda.ShowBalloonHint
   end;
end;

procedure TDM.CompressAllFiles;
const
   SMsgSuccess =
      'O backup foi finalizado com sucesso.' + #13 +
      'A próxima execução está agendada para %s às %s';
var
   SearchRec: TSearchRec;
begin
   if FindFirst(TScheduleManager.GetInstance.SaveDir + '\*.sql', faArchive,
      SearchRec) = 0 then
   begin
      repeat
         CompressFile(TScheduleManager.GetInstance.SaveDir + #92 +
            SearchRec.Name);         
      until FindNext(SearchRec) <> 0;
      SysUtils.FindClose(SearchRec);

      if (TScheduleManager.GetInstance.Sn_mongo) then
      begin
         dm.executaBackupMongo(Format('%s\%s_%s',
            [TScheduleManager.GetInstance.SaveDir, 'unimestre',
            FormatDateTime('yyyymmddhhnn', Now)]));
      end;

      FinishBackup;
      tiAgenda.BalloonHint := Format(SMsgSuccess,
         [DateToStr(TScheduleManager.GetInstance.StartDate),
          TimeToStr(TScheduleManager.GetInstance.StartTime)]);
      tiAgenda.ShowBalloonHint;
   end;
end;

function TDM.CompressFile(const FilePath: AnsiString): Boolean;
var
   ZipFileName: AnsiString;
begin
   LoadZipperLibrary;
   ZipFileName := ChangeFileExt(FilePath, '.zip');
   Result := (not FileExists(ZipFileName)) or DeleteFile(PChar(ZipFileName));
   if Result then
   begin
      zmZipper.ZipFileName := ZipFileName;
      zmZipper.FSpecArgs.Add(FilePath);
      zmZipper.Add;
      while zmZipper.Busy do;
      Result := FileExists(ZipFileName);
   end;
   UnloadZipperLibrary;
end;

function TDM.Connect: Boolean;
const
   ConnIdentifiers: array [TConnectionIdentifier] of AnsiString =
      ('Banco', 'Senha', 'Porta', 'Protocolo', 'Servidor', 'Usuario');
      
   ConnDefaults: array [TConnectionIdentifier] of AnsiString =
      ('unimestre', 'DD6A8DA7B82CAC6A90C72BD90F5BE00423', '3306', 'mysql-5',
       'localhost', 'academico');
   
   SCapError = 'Erro';
   SMsgWithOutConnection =
      'Não foi possível estabelecer conexão com o banco de dados do ' +
      'UNIMESTRE.' + #13 + 'Erro: %s' + #13 + #13 + 'Entre em contato com ' +
      'o Suporte Técnico.';
begin
   conn.Database := FSettings.ReadString(IniSections[isConnection],
      ConnIdentifiers[ciDatabase], ConnDefaults[ciDatabase]);
   conn.HostName := FSettings.ReadString(IniSections[isConnection],
      ConnIdentifiers[ciServer], ConnDefaults[ciServer]);
   conn.Password := Decrypt(FSettings.ReadString(IniSections[isConnection],
      ConnIdentifiers[ciPassword], ConnDefaults[ciPassword]));
   conn.Port := FSettings.ReadInteger(IniSections[isConnection],
      ConnIdentifiers[ciPort], 3306);
   conn.Protocol := FSettings.ReadString(IniSections[isConnection],
      ConnIdentifiers[ciProtocol], ConnDefaults[ciProtocol]);
   conn.User := FSettings.ReadString(IniSections[isConnection],
      ConnIdentifiers[ciUser], ConnDefaults[ciUser]);
   try
      conn.Connect;
      Result := conn.Connected;
   except
      on E: EZDatabaseError do
      begin
         MessageBox(Application.Handle, PChar(SMsgWithOutConnection),
            PChar(SCapError), MB_ICONERROR + MB_OK);
         Result := False;
      end;
   end;
end;

procedure TDM.CreateDirectoryBackup(const FilePath: AnsiString);
begin
   if not DirectoryExists(FilePath) then
      ForceDirectories(FilePath);
end;

procedure TDM.CriarConsulta(var DataSet: TUMZReadOnlyQuery);
begin
   DataSet := TUMZReadOnlyQuery.Create(Self);
   DataSet.Connection := Self.GetDB();
end;

procedure TDM.CriarConsulta(var DataSet: TUMZQuery);
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := Self.GetDB;
   DataSet.UpdateMode := umUpdateChanged;
end;

function TDM.DataAtual: TDateTime;
const
   SQL_DATA_ATUAL = 'SELECT NOW() AS data_atual';
var
   qyDataAtual : TUMZReadOnlyQuery;
begin
   TLoginManager.GetInstancia().GetDM.CriarConsulta(qyDataAtual);
   qyDataAtual.SQL.Text := SQL_DATA_ATUAL;
   qyDataAtual.Open;

   Result := qyDataAtual.FieldByName('data_atual').AsDateTime;

   FreeAndNil(qyDataAtual);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
   User, Pass: AnsiString;
begin
   FForcedDatabases := TStringList.Create;
   FDLLHandle := 0;
   sqlMonitor.Active := IsDebugging and TryLoadDebugger;
   
   if LoadIniSettings then
   begin
      try
         startConn.ConnectUnimestre;
         if startConn.Active then
         begin
            startConn.FindUser('umbackup', User, Pass);
            FBackupUser := User;
            FBackupPass := Pass;
         end;
      except
         on E: EUMZDatabaseError do raise;
      end;
      Completo := 0;
      qryConfig.ParamByName('agendado').AsInteger := 1;
      qryConfig.ParamByName('completo').AsInteger := Completo;
      qryConfig.Open;
      LoadMySQLApp;
      LoadMySQLDumpApp;
      LoadScheduleManager;
      tmAgenda.Enabled := TScheduleManager.GetInstance.Enabled;
      LoadYearSemesterInc;
   end
   else
   begin
      Application.ProcessMessages;
      Application.Terminate;
   end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   FForcedDatabases.Free;
   SaveSchedule;
   if FDLLHandle > 0 then
   begin
      sqlMonitor.Active := False;
      FreeLibrary(FDLLHandle);
   end;
end;

function TDM.DecYearSemester(const Value: string): string;
var
   Year, Semester: Integer;
   S: string;
begin
   S := LeftStr(Value, Length(Value) - 1);
   if TryStrToInt(S, Year) then
   begin
      S := RightStr(Value, 1);
      if TryStrToInt(S, Semester) then
      begin
         if FYearSemesterInc = 1 then
            if Semester = 2 then
               Dec(Semester)
            else
            begin
               Dec(Year);
               Semester := 2;
            end
         else if FYearSemesterInc = 2 then
         begin
            Dec(Year);
            Semester := 1;
         end;
         Result := Format('%d%d', [Year, Semester]);
      end
      else
         Result := Value;
   end
   else
      Result := Value;
end;

procedure TDM.DisableScheduler;
begin
   tmAgenda.Enabled := False;
   tiAgenda.Visible := False;
end;

procedure TDM.EnableScheduler;
begin
   tmAgenda.Enabled := True;
   tiAgenda.Visible := True;
end;

procedure TDM.executaBackupMongo(dirBkp: String);
const
   sqlParametrosMongo = ''+
   '  SELECT ds_valor AS porta, ' +
   '   ( SELECT ds_valor FROM nu_parametros WHERE ds_parametro = "conexao.mongodb.host" ) AS host ' +
   '     FROM '+
   '        nu_parametros '+
   '     WHERE '+
   '       ds_parametro = "conexao.mongodb.port";';

   SSQLSelectComando = ''
      + 'SELECT '
      + '	p.ds_valor '
      + 'FROM '
      + '	nu_parametros p '
      + 'WHERE '
      + '	p.ds_parametro = ''mongodb.backup'' AND '
      + '	EXISTS ( '
      + '		SELECT '
      + '			m.cd_modulo '
      + '		FROM '
      + '			nu_modulos m '
      + '		WHERE '
      + '			p.cd_modulo = m.cd_modulo AND '
      + '			m.ds_chave = ''UMNucleo'' '
      + '	) ';

   SCommandDef = 'mongodump --host=%s:%s --username=%s --password=%s --authenticationDatabase=unimestre --db=unimestre --out=%s';
var
   qyParametro: TUMZquery;
   StartupInfo : TStartupInfo;
   ProcessInfo : TProcessInformation;
   State       : INTEGER;
   Host, Porta, Pass, User, Command: String;
   ResultSet: IZResultSet;
begin

   Command := SCommandDef;
   ResultSet := ExecuteQuery(SSQLSelectComando);
   try
      if ResultSet.Next then
         Command := ResultSet.GetString(1);
   finally
      ResultSet.Close;
      ResultSet := nil;
   end;

   dm.CriarConsulta(qyParametro);
   qyParametro.SQL.Text := sqlParametrosMongo;
   qyParametro.Open;

   Host := qyParametro.FieldByName('host').AsString;
   Porta := qyParametro.FieldByName('porta').AsString;

   //Pega a senha.
   User := 'ummongo';
   Pass := 'UniSeguro';

   if DM.startConn.Active then
   begin
      startConn.FindUser('ummongo', User, Pass);
   end;

   Command := Format(Command, [Host, Porta, User, Pass, dirBkp]);

   FillChar(StartupInfo, SizeOf(StartupInfo), #0);
   StartupInfo.cb := Sizeof(StartupInfo);
   StartupInfo.wShowWindow := SW_HIDE ;
   StartupInfo.dwFlags := STARTF_USESHOWWINDOW;

   //Cria processo chamando mongodump
   if not CreateProcess(nil,
      PAnsiChar(Command),
      nil,
      nil,
      False,
      CREATE_NO_WINDOW,
      nil,
      nil,
      StartupInfo,
      ProcessInfo)
   then
   begin
      //Caso não conseguiu iniciar o mongodump
      ShowMessage('Não foi possível fazer o backup do dados do mongodb');

   end
   else
   begin
      Application.ProcessMessages;
     
      REPEAT
         State := WaitforSingleObject(ProcessInfo.hProcess, 50);
         Application.ProcessMessages;
      UNTIL State <> WAIT_TIMEOUT;

      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread );
   end;
end;

procedure TDM.FinishBackup;
begin
   if qryHistorico.Active then
      qryHistorico.Close;
   
   qryHistorico.ParamByName('CD_BACKUP').AsInteger := TMySQLDump.GetInstance.ID;
   qryHistorico.Open;

   if qryHistorico.RecordCount = 1 then
   begin
      qryHistorico.Edit;
      qryHistoricoDT_DATA_FIM.AsDateTime := Date;
      qryHistoricoNR_HORA_FIM.AsDateTime := Time;
      qryHistoricoNR_TAMANHO_BACKUP.AsFloat := Abs(FileSize(ChangeFileExt(TMySQLDump.GetInstance.ResultFile, '.zip')));
      qryHistorico.Post;
   end;
end;

function TDM.GetBackupDirectory: AnsiString;
begin
   qryConfig.Close;
   qryConfig.ParamByName('completo').AsInteger := Completo;
   qryConfig.ParamByName('agendado').AsInteger := Agendado;
   qryConfig.Open;
   Result := qryConfigDS_CAMINHO_BKP.AsString;
end;

function TDM.GetChavePermissaoLite(const Chave, ChaveModulo: string): Boolean;
var
   licencaDecriptografada: String;
begin
   if not qyVerificaPermissaoLite.Active then
      qyVerificaPermissaoLite.Open;

   qyVerificaPermissaoLite.First;

   if qyVerificaPermissaoLite.Locate( 'ds_chave;chave', varArrayOf([Chave, ChaveModulo]) , []) then
   begin
      licencaDecriptografada := UMCrypt( qyVerificaPermissaoLite.FieldByName('ds_licenca').AsString,
         ctDecode, CHAVE_LITE );
      Result := AnsiEndsStr( 'LITE', licencaDecriptografada);
   end
   else
      Result := false;
end;

function TDM.GetCurrYearSemester: string;
var
   ResultSet: IZResultSet;
begin
   ResultSet := conn.DbcConnection.CreateStatement.ExecuteQuery(
      'SELECT FCD_GET_ANOSEMESTRE_CORRENTE(NULL) NR_ANOSEMESTRE FROM DUAL');
   ResultSet.Next;
   Result := ResultSet.GetStringByName('NR_ANOSEMESTRE');
   ResultSet.Close;
end;

function TDM.GetDateTimeFromDB: TDateTime;
begin
   qryDataHora.Open;
   Result := qryDataHoraDATAHORA.AsDateTime;
   qryDataHora.Close;
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.conn;
end;


function TDM.GetMBases: string;
begin
   result := self.FMBases;
end;

function TDM.GetUsuarioLogado: TUsuario;
begin
   Result := Self.UsuarioLogado;
end;

function TDM.IncYearSemester(const Value: string): string;
var
   Year, Semester: Integer;
   S: string;
begin
   S := LeftStr(Value, Length(Value) - 1);
   if TryStrToInt(S, Year) then
   begin
      S := RightStr(Value, 1);
      if TryStrToInt(S, Semester) then
      begin
         if FYearSemesterInc = 1 then
            if Semester = 2 then
            begin
               Inc(Year);
               Dec(Semester);
            end
            else
               Inc(Semester)
         else if FYearSemesterInc = 2 then
         begin
            Inc(Year);
            Semester := 1;
         end;
         Result := Format('%d%d', [Year, Semester]);
      end
      else
         Result := Value;
   end
   else
      Result := Value;
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
end;

function TDM.LoadIniSettings: Boolean;
const
   SIniPathFmt = '%s%s';
   SIniName = 'unimestre.ini';
   SCapError = 'Erro';
   SMsgIniFileNotFound =
      'O arquivo de inicialização UNIMESTRE.INI não foi encontrado' + #13 +
      'Não é possível incializar o sistema.' + #13 + #13 + 'Entre em contato ' +
      'com o Suporte Técnico.';
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   IniPath := Format(SIniPathFmt, [ExtractFilePath(ParamStr(0)), SIniName]);
   Result := FileExists(IniPath);
   if Result then
   begin
      ConnIni := TIniFile.Create(IniPath);
      try
         FSettings := TIniFile.Create(IniPath);
         startConn.IniPath := IniPath;
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
      finally
         ConnIni.Free;
      end;
   end
   else
      MessageBox(Application.Handle, PChar(SMsgIniFileNotFound),
         PChar(SCapError), MB_ICONERROR + MB_OK);
end;

procedure TDM.LoadMySQLApp;
var
   ds_login : string;
   ds_senha : string;
begin
   TMySQLRestore.GetInstance.ExePath := FSettings.ReadString(
      IniSections[isBackup], BackupIdentifiers[biMySQL],
      BackupDefaults[biMySQL]);


      ds_login :=  FSettings.ReadString(
         IniSections[isBackup],
         'Usuario',
         qryConfigNM_USUARIO.AsString
      );

      ds_senha := FSettings.ReadString(
         IniSections[isBackup],
         'Senha',
         qryConfigDS_SENHA.AsString
      );

      if ((ds_login = '') or (ds_senha = '')) then
      begin
         MessageBox(
            Application.Handle,
            PChar('O Login ou a senha estão inválidas. Verificar na tabela backup_config. O login e senha precisam estar criptografados'),
            PChar('Error'), MB_ICONERROR + MB_OK);
      end
      else
      begin
        TMySQLRestore.GetInstance.User := Decrypt(
         ds_login
        );

         TMySQLRestore.GetInstance.Password := Decrypt(
         ds_senha
        );

      end;
end;

procedure TDM.LoadMySQLDumpApp;
var
   ColonPos, HostNameLen: Integer;
   HostName, Port: AnsiString;
begin
   TMySQLDump.GetInstance.ExePath := FSettings.ReadString(
      IniSections[isBackup], BackupIdentifiers[biMySQLDump],
      BackupDefaults[biMySQLDump]);
   TMySQLDump.GetInstance.AddParameter('--user', Decrypt(
      FSettings.ReadString(IniSections[isBackup], 'Usuario',
      qryConfigNM_USUARIO.AsString)));
   TMySQLDump.GetInstance.AddParameter('--password', Decrypt(
      FSettings.ReadString(IniSections[isBackup], 'Senha',
      qryConfigDS_SENHA.AsString)));
   TMySQLDump.GetInstance.AddParameter('--max_allowed_packet', qryConfigMAX_PACKET.AsString);

   ColonPos := AnsiPos(#58, qryConfigNM_SERVIDOR.AsString);
   HostNameLen := Length(qryConfigNM_SERVIDOR.AsString);

   if ColonPos = 0 then
      TMySQLDump.GetInstance.HostName := qryConfigNM_SERVIDOR.AsString
   else
   begin
      HostName := LeftStr(qryConfigNM_SERVIDOR.AsString, ColonPos - 1);
      Port := RightStr(qryConfigNM_SERVIDOR.AsString, HostNameLen - ColonPos);
      TMySQLDump.GetInstance.AddParameter('--port', Port);
      TMySQLDump.GetInstance.HostName := HostName;
      TMySQLDump.GetInstance.Port := Port;
   end;
end;

procedure TDM.LoadScheduleManager;
begin
   with TScheduleManager.GetInstance do
   begin
      Enabled := qryConfigSN_ATIVO.AsInteger = 1;
      Frequency := TScheduleFrequency(qryConfigNR_TIPO.AsInteger);
      Interval := qryConfigNR_INTERVALO.AsInteger;
      SaveDir := qryConfigDS_CAMINHO_BKP.AsString;
      StartDate := qryConfigDT_BACKUP.AsDateTime;
      StartTime := qryConfigHR_BACKUP.AsDateTime;
      AssignDatabases(qryConfigDS_BASES.AsString);
   end;
end;

procedure TDM.LoadYearSemesterInc;
var
   ResultSet: IZResultSet;
begin
   ResultSet := conn.DbcConnection.CreateStatement.ExecuteQuery(
      'SELECT DS_VALOR FROM PARAMETROS WHERE DS_VARIAVEL = ''ano_semestre_incremento'' AND CD_COLIGADA = 0');
   if ResultSet.Next then
      FYearSemesterInc := ResultSet.GetIntByName('DS_VALOR')
   else
      FYearSemesterInc := 1;
end;

procedure TDM.LoadZipperLibrary;
begin
   zmZipper.DLLDirectory := ExtractFilePath(ParamStr(0));
   zmZipper.Active := True;
end;

function TDM.Logon(const ALogin, APassword: AnsiString): Boolean;
begin
   qryUsuario.Close;
   qryUsuario.ParamByName('DS_LOGIN').AsString := ALogin;
   qryUsuario.ParamByName('DS_SENHA').AsString := APassword;
   qryUsuario.Open;
   Result := not qryUsuario.IsEmpty;
   if Result then
   begin
      qryPermissoes.Close;
      qryPermissoes.ParamByName('DS_LOGIN').AsString := ALogin;
      qryPermissoes.Open;
   end;
end;

procedure TDM.miAbrirClick(Sender: TObject);
begin
   ReOpenApplication;
end;

procedure TDM.miAgendadorClick(Sender: TObject);
begin
   TScheduleManager.GetInstance.Enabled := False;
   if not fPrincipal.Visible then
   begin
      Application.ProcessMessages;
      Application.Terminate;
   end;
end;

procedure TDM.miBackupClick(Sender: TObject);
const
   SSuccessHint = 'Backup inicializado com sucesso';
   SErrorHint =
      '3 - Ocorreu um erro na tentativa de inicializar o backup' + #13 + #13 + '%s';
var
   BallomHint: AnsiString;
begin
   tmAgenda.Enabled := False;
   FForcedStartup := True;
   FForcedDatabases.Assign(TScheduleManager.GetInstance.Databases);
   StartForcedBackup;
   if TMySQLDump.GetInstance.Running then
      BallomHint := SSuccessHint
   else
   begin
      BallomHint := Format(SErrorHint, [TMySQLDump.GetInstance.LastError]);
      FForcedDatabases.Clear;
      FForcedStartup := False;
   end;
   tiAgenda.BalloonHint := BallomHint;
   tiAgenda.ShowBalloonHint;
   tmAgenda.Enabled := True;
end;

function TDM.NewHistoryRecord: Integer;
begin
   if qryHistorico.Active then
      qryHistorico.Close;
   
   qryHistorico.Open;
   qryHistorico.Insert;
   qryHistoricoDT_DATA_INICIO.AsDateTime := Date;
   qryHistoricoNR_HORA_INICIO.AsDateTime := Time;
   qryHistoricoSN_COMPLETO.AsInteger := Integer((not Boolean(Completo)));
   qryHistoricoNR_TAMANHO_BACKUP.AsFloat := 0;
   qryHistoricoDS_IP_COMPUTADOR.AsString := GetIP;
   qryHistoricoDS_DATABASES.AsString := TMySQLDump.GetInstance.GetDatabase;
   qryHistoricoDS_MYSQLDUMP.AsString := TMySQLDump.GetInstance.ParseCommand;
   qryHistorico.Post;
   Result := qryHistoricoCD_BACKUP.AsInteger;
end;

procedure TDM.pmOpcoesPopup(Sender: TObject);
begin
   miAbrir.Enabled := not fPrincipal.Visible;
   miBackup.Enabled := not (TMySQLDump.GetInstance.Running or
      TScheduleManager.GetInstance.Started);
end;

procedure TDM.ReLoadSettings;
begin
   qryConfig.Close;
   qryConfig.Open;
   if qryConfigSN_ALTERADO.AsInteger = 1 then
   begin
      LoadScheduleManager;
      qryConfig.Edit;
      qryConfigSN_ALTERADO.AsInteger := 0;
      qryConfig.Post;
   end;
end;

procedure TDM.ReOpenApplication;
begin
   if not fPrincipal.Visible then
   begin
      if TLoginManager.GetInstancia.RealizarLogin(False, False) then
         fPrincipal.Show;
   end;
end;

procedure TDM.SaveSchedule;
var
   I: Integer;
   Databases: AnsiString;
begin
   qryConfig.Edit;
   qryConfigDT_BACKUP.AsDateTime := TScheduleManager.GetInstance.StartDate;
   qryConfigHR_BACKUP.AsDateTime := TScheduleManager.GetInstance.StartTime;
   qryConfigDS_CAMINHO_BKP.AsString := TScheduleManager.GetInstance.SaveDir;

   Databases := EmptyStr;
   for I := 0 to TScheduleManager.GetInstance.Databases.Count - 1 do
   begin
      if Databases <> EmptyStr then
         Databases := Databases + #59;
      Databases := Databases + TScheduleManager.GetInstance.Databases.Names[I];
   end;

   qryConfigDS_BASES.AsString := Databases;
   qryConfigNR_INTERVALO.AsInteger := TScheduleManager.GetInstance.Interval;
   qryConfigNR_TIPO.AsInteger := Ord(TScheduleManager.GetInstance.Frequency);
   qryConfigSN_ATIVO.AsInteger := Ord(TScheduleManager.GetInstance.Enabled);
   qryConfig.Post;
end;

procedure TDM.SetBackupDirectory(const Value: AnsiString);
var
   qryAlteraConfig: TUMzQuery;
begin

   qryConfig.Close;

   if Agendado = 1 then
   begin
     qryConfig.ParamByName('completo').AsInteger := Completo; 
     qryConfig.ParamByName('agendado').AsInteger := Agendado;
     qryConfig.Open;
     qryConfig.Edit;
     qryConfigDS_CAMINHO_BKP.AsString :=  Value;
     qryConfig.Post;
   end
   else
   begin
      DM.CriarConsulta(qryAlteraConfig);

      qryAlteraConfig.SQL.Text := 'UPDATE backup_config SET ds_caminho_bkp = :caminho_backup, ds_bases = :bases, dt_backup = :dtbackup, hr_backup = :hrbackup where sn_agendado = :agendado and sn_backup_completo = :completo ';

      qryAlteraConfig.ParamByName('caminho_backup').AsString := Value;
      qryAlteraConfig.ParamByName('bases').AsString := GetMBases;
      qryAlteraConfig.ParamByName('dtbackup').AsDateTime := Now;
      qryAlteraConfig.ParamByName('hrbackup').AsTime := Time;
      qryAlteraConfig.ParamByName('agendado').AsInteger := Agendado;
      qryAlteraConfig.ParamByName('completo').AsInteger := Completo;

      qryAlteraConfig.ExecSQL;


      qryConfig.ParamByName('agendado').AsInteger := 0;
      qryConfig.ParamByName('agendado').AsInteger := Completo;
      qryConfig.Open;
   end;
   TScheduleManager.GetInstance.SaveDir := Value;
end;

procedure TDM.SetLog(cd_modulo: integer; operacao, chave: string;
  coligada: integer; ds_observacoes: string);
begin
   {Teste}
end;

procedure TDM.SetMBases(const Value: string);
begin
   self.FMBases := Value;
end;

procedure TDM.SetUsuarioLogado(UsuarioLogado: TUsuario);
begin
   Self.UsuarioLogado := UsuarioLogado;
end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDLLProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
begin
   Connect;
end;

procedure TDM.StartForcedBackup;
const
   SFmtDateTime = 'yyyymmddhhnn';
   SFmtFilePath = '%s\%s_%s.sql';
begin
   CreateDirectoryBackup(TScheduleManager.GetInstance.SaveDir);

   TMySQLDump.GetInstance.ReplaceParameter('--host', conn.HostName);
   TMySQLDump.GetInstance.ReplaceParameter('--port', IntToStr(conn.Port));
   try
     TMySQLDump.GetInstance.Database := FForcedDatabases.Names[0];
     TMySQLDump.GetInstance.ResultFile := AnsiQuotedStr(Format(SFmtFilePath,
           [TScheduleManager.GetInstance.SaveDir, FForcedDatabases.Names[0],
           FormatDateTime(SFmtDateTime, Now)]), #34);
     TMySQLDump.GetInstance.Execute;
     FForcedDatabases.Delete(0);
     FForcedStartup := FForcedDatabases.Count > 0;
   finally
     TMySQLDump.GetInstance.ReplaceParameter('--host',
        TMySQLDump.GetInstance.HostName);
     TMySQLDump.GetInstance.ReplaceParameter('--port',
        TMySQLDump.GetInstance.Port);
   end;
end;

procedure TDM.tmAgendaTimer(Sender: TObject);
begin
   tmAgenda.Enabled := False;
   ReLoadSettings;

   if FForcedStartup and (not TMySQLDump.GetInstance.Running) then
   begin
      StartForcedBackup;
   end
   else
   begin
      TMySQLDump.GetInstance.ReplaceParameter('--host', conn.HostName);
      TMySQLDump.GetInstance.ReplaceParameter('--port', IntToStr(conn.Port));
      try
         CallScheduleManager;
      finally
        TMySQLDump.GetInstance.ReplaceParameter('--host',
           TMySQLDump.GetInstance.HostName);
        TMySQLDump.GetInstance.ReplaceParameter('--port',
           TMySQLDump.GetInstance.Port);
      end;
   end;
   
   tmAgenda.Enabled := True;
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
   begin
      FDLLHandle := 0;
      Result := False;
   end;
end;

function TDM.UMCrypt(sText: string; Action: TCryptTypes; Key: string): string;
var
   Dest: String;
   KeyLen,KeyPos,OffSet,SrcPos: Integer;
   TmpSrcAsc,Range,SrcAsc: Integer;
begin
   if Key = '' then
      Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';

   Dest := '';
   KeyLen := Length(Key);
   KeyPos := 0;
   Range := 256;
   if (Length(sText) <= 0) Then
   begin
     Dest := '';
   end
   else if Action = ctEncode then
   begin
     Randomize;
     OffSet := Random(Range);
     Dest := Format('%1.2x',[OffSet]);
     for SrcPos := 1 to Length(sText) do
     begin
       SrcAsc := (Ord(sText[SrcPos]) + OffSet) Mod 255;
       if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
       SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
       Dest := Dest + Format('%1.2x',[SrcAsc]);
       OffSet := SrcAsc;
     end;
   end
   else if Action = ctDecode then
   begin
      OffSet := StrToInt('$'+ Copy(sText,1,2));
      SrcPos := 3;
      repeat
       SrcAsc := StrToInt('$'+ Copy(sText,SrcPos,2));
       if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
       TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
       if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
       else TmpSrcAsc := TmpSrcAsc - OffSet;
       Dest := Dest + Chr(TmpSrcAsc);
       OffSet := SrcAsc;
       SrcPos := SrcPos + 2;
     until (SrcPos >= Length(sText));
   end;
   Result:= Dest;
end; //FUNÇÃO Crypt

function TDM.UnCompressFile(const FilePath: AnsiString): Boolean;
begin
   LoadZipperLibrary;
   Result := FileExists(FilePath);
   if Result then
   begin
      zmZipper.ZipFileName := FilePath;
      zmZipper.FSpecArgs.Add('*.*');
      zmZipper.ExtrBaseDir := ExtractFilePath(FilePath);
      zmZipper.Extract;
      while zmZipper.Busy do;
      Result := FileExists(ChangeFileExt(FilePath, '.sql'));
   end;
   UnloadZipperLibrary;
end;

procedure TDM.UnloadZipperLibrary;
begin
   zmZipper.Active := False;
   zmZipper.AbortDLL;
end;

function TDM.UseYearSemester: Boolean;
var
   ResultSet: IZResultSet;
begin
   ResultSet := conn.DbcConnection.CreateStatement.ExecuteQuery(
      'SELECT DS_VALOR FROM PARAMETROS WHERE DS_VARIAVEL = ''sn_utilizar_anosemestre'' AND CD_COLIGADA = 0');
   if ResultSet.Next then
      Result := ResultSet.GetStringByName('DS_VALOR') = '1'
   else
      Result := True;
   ResultSet.Close;
end;

end.
