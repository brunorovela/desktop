unit uDM;

interface

uses
  SysUtils, Classes, uIUMDataModule, ZConnection, UZStartConnection, IniFiles,
  ZSqlMonitor;

type
   TDataModule = class(AUMDataModule)
   end;

   TDM = class(TDataModule)
      db: TZConnection;
      startConn: TUMZStartConnection;
      procedure sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
      procedure startConnDefaultConnection(Sender: TObject);
      procedure DataModuleCreate(Sender: TObject);

   private
      ConnIni: TIniFile;
      IniPath: TFileName;

      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;

      procedure ResetarConexao();
      procedure RealizarConexao();
      procedure ConexaoPadrao();

   public
      function GetDB() : TZConnection; override;

   end;

var
   DM: TDM;

implementation

uses uGeneral, uUMCriptografia, Windows, Forms;

{$R *.dfm}

{ TDM }

procedure TDM.ConexaoPadrao;
begin
   db.HostName := ConnIni.ReadString('Conexao', 'Servidor', 'localhost');
   db.Database := ConnIni.ReadString('Conexao', 'Banco', 'unimestre');
   db.User := ConnIni.ReadString('Conexao', 'Usuario', 'academico');
   db.Password := TUMCriptografia.UMCrypt(ConnIni.ReadString('Conexao', 'Senha', ''), ctDecode);
   db.Port := ConnIni.ReadInteger('Conexao', 'Porta', 3306);
   db.Protocol := ConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');
   try
      db.Connect;
   except
      on E: Exception do
      begin
         TGeneral.Mensagem('Não foi possível estabelecer conexão com o banco de dados.', '', MB_ICONERROR + MB_OK);
         Application.Terminate;
      end;
   end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
   IniPath := Format('%sunimestre.ini', [ExtractFilePath(ParamStr(0))]);
   if NOT(FileExists(IniPath)) then
   begin
      TGeneral.Mensagem('Não foi possível encontrar o arquivo de configuração unimestre.ini', '', MB_ICONERROR + MB_OK);
      Application.Terminate;
   end;

   ConnIni := TIniFile.Create(IniPath);

   Self.ResetarConexao();
   Self.RealizarConexao();

   if NOT(db.Connected) then Exit;
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.db;
end;

procedure TDM.RealizarConexao;
begin
   try
      try
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
         startConn.IniPath := IniPath;
         startConn.ConnectUnimestre;
      except
         raise;
      end;
   finally
      ConnIni.Free;
   end;
end;

procedure TDM.ResetarConexao;
begin
   if Self.db.Connected then
      db.Disconnect;

   db.Protocol := '';
   db.HostName := '';
   db.Port := 0;
   db.Database := '';
   db.User := '';
   db.Password := '';
end;

procedure TDM.sqlMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   FDllProc(Pointer(Event));
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
begin
   DM.ConexaoPadrao();
end;

end.
