unit uFServicoMain;

interface

uses
   Windows, Classes, SysUtils, Controls, SvcMgr, uCFuncArquivos, IniFiles,
   uSvcClasses;

const
   TIME_TO_DEBUG_SVC_DB = 60000;
   LOG_ERRO_CONEXAO = '[Não foi possível estabelecer conexão com o banco de dados] ';

type
   { A classe TUMService implementa a classe TService.
     Para instalar o serviço digite umservico /install
     Para desinstalar o serviço digite umservico /uninstall
   }
   TUMService = class(TService)
   published
      procedure ServiceStart(Sender: TService; var Started: Boolean);
      procedure ServiceStop(Sender: TService; var Stopped: Boolean);
      procedure ServiceExecute(Sender: TService);
      procedure ServiceCreate(Sender: TObject);
      procedure ServiceExecuteApp(Sender: TService);
   strict private
      FSExePath: string;       // diretório do executável
      FISleepTime: Integer;    // tempo de intervalo
      FITimeLogDB: Integer;    // tempo de intervalo para executar o Log de DB
      FIfConfig: TIniFile;     // arquivo de configuração do serviço
      FSlAppList: TStringList; // lista de aplicações que serão excutadas pelo serviço
      function getAppCount: Integer;
      function getApp(const ASNome: string): TUMServiceApp;
      function getAppByPos(const AIPos: Integer): TUMServiceApp;
      function loadApplications: boolean;
      function unloadApplications: boolean;
      procedure LogSvcDB(const ISleepTime: Integer);
   public
      property ExePath: string read FSExePath;
      property AppCount: integer read getAppCount;
      property App[const s: string]: TUMServiceApp read getApp;
      property AppByPos[const i: Integer]: TUMServiceApp read getAppByPos;
      function GetServiceController: TServiceController; override;
   end;

var
   UMService: TUMService;
   Logger: TUMFileLogger;

implementation

uses
   uDMConexao, uSvcIntegraTasy, uSvcIntegraBiblioshop,
   uSvcIntegraBorgesMendonca, uSvcRecados, uSvcImportacaoTerminalCatraca,
   uSvcIntegraIdeau, uSvcIntegraPessoasPadrao, uSvcIntegraPessoasArquivo,
   USvcSecullum;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
   UMService.Controller(CtrlCode);
end;

function TUMService.getApp(const ASNome: string): TUMServiceApp;
begin
   Result := Self.getAppByPos(Self.FSlAppList.IndexOfName(ASNome));
end;

function TUMService.getAppByPos(const AIPos: Integer): TUMServiceApp;
begin
   Result := nil;
   if (AIPos >= 0) and (AIPos < Self.FSlAppList.Count) then
      Result := TUMServiceApp(Self.FSlAppList.Objects[AIPos]);
end;

function TUMService.getAppCount: Integer;
begin
   Result := Self.FSlAppList.Count;
end;

function TUMService.GetServiceController: TServiceController;
begin
   Result := ServiceController;
end;

{ Carrega todas as aplicações encontradas no diretório "services" e configuradas
  no arquivo de configuração.
  Apenas os pacotes que foram configurados com o valor "S" no arquivo de
  configuração serão carregados. Os outros serão ignorados.
}
function TUMService.loadApplications: boolean;
var
   i: Integer;
   oApp: TUMServiceApp;
   slApps: TStringList;
   sAppDir, sAppConfig, sResStr: string;
begin
   Result := True;
   Self.unloadApplications;
   Logger.log('Carregando aplicações ...' + #13);
   sAppDir := ExtractFilePath(ParamStr(0)) + 'services\';
   slApps := TFuncArquivos.listaArquivos(sAppDir, 'UMSvc*.bpl');
   try
      Logger.log('Diretório das aplicações: ' + sAppDir + #13);
      // percorre a lista de pacotes
      for i := 0 to slApps.Count - 1 do
      begin
         // cria o objeto da aplicação
         oApp := TUMServiceApp.Create(sAppDir + slApps.Strings[i]);
         // verifica se o pacote deve ser carregado
         sAppConfig := Trim(Self.FIfConfig.ReadString('UMServico', oApp.AppName, '0'));
         if not (sAppConfig = 'S') then // ignorar pacote
         begin
            Logger.log('Ignorado: ' + oApp.AppName);
            FreeAndNil(oApp);
            Continue;
         end
         else if oApp.loadApp then // tenta carregar o pacote
         begin
            Self.FSlAppList.AddObject(oApp.AppName, oApp);
            oApp.startApp;
            sResStr := 'SUCESSO';
         end
         else // ocorreu erro ao tentar carregar o pacote
         begin
            sResStr := 'ERRO';
            Result := False;
         end;

         if ( Result ) then
         begin
            Logger.log('Carregando ' + slApps.Strings[i] + ': ['+ sResStr + ']');
         end else begin
            Logger.log('Carregando ' + slApps.Strings[i] + ': ['+ sResStr + ']: ' + SysErrorMessage(GetLastError));
         end;

         // se ocorrer erro pára o processo de carregamento dos pacotes
         if not Result then Break;
      end;
   finally
      slApps.Free;
   end;
end;

{ Loga no banco de dados que o serviço está rodando.
   Neste procedimento também é executado uma verificação dos segundos percorridos pelo serviço.
   É aqui onde é feito o controle de a cada quanto tempo o Log deve ir para o banco de dados
}
procedure TUMService.LogSvcDB(const ISleepTime: Integer);
var
   LoggerServices : TUMLoggerServices;
begin
   Dec(Self.FITimeLogDB, ISleepTime);

   if ( Self.FITimeLogDB <= 0 ) then
   begin
      Self.FITimeLogDB := TIME_TO_DEBUG_SVC_DB;

      LoggerServices := TUMLoggerServices.Create(Self.FIfConfig);

      if not LoggerServices.logar() then
         Logger.log(LoggerServices.LastError);

      LoggerServices.Destroy;
   end;
end;

procedure TUMService.ServiceCreate(Sender: TObject);
begin
   Self.FISleepTime := 1000;
   Self.FITimeLogDB := TIME_TO_DEBUG_SVC_DB;
   Self.FSlAppList := TStringList.Create;
   Self.FSExePath := ExtractFilePath(ParamStr(0));
   if not DirectoryExists(Self.FSExePath + '\logs') then
   begin
      CreateDir(Self.FSExePath + '\logs');
   end;
   if Logger = nil then
   begin
      Logger := TUMFileLogger.Create(Self.FSExePath + '\logs\umservico.log', False);
   end;
   if Self.FIfConfig = nil then
   begin
      Self.FIfConfig := TIniFile.Create(Self.FSExePath + 'unimestre.ini');
   end;
end;

procedure TUMService.ServiceExecute(Sender: TService);
begin
   while not Terminated do
   begin
      Sleep(Self.FISleepTime);

      // Loga a execução do Serviço no banco de dados
      Self.LogSvcDB(Self.FISleepTime);

      ServiceThread.ProcessRequests(True);// wait for termination
   end;
end;

procedure TUMService.ServiceExecuteApp(Sender: TService);
begin
   while not Terminated do
   begin
      // Loga a execução do Serviço no banco de dados
      Self.LogSvcDB(Self.FISleepTime);

      Sleep(Self.FISleepTime);
   end;
end;

procedure TUMService.ServiceStart(Sender: TService; var Started: Boolean);
begin
   // Ao iniciar o Serviço, logamos a primeira vez que ele foi executado.
   Self.LogSvcDB(TIME_TO_DEBUG_SVC_DB);

   Logger.log('Iniciando serviço...');
   Started := Self.loadApplications;
end;

procedure TUMService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
   Logger.log('Parando serviço...');
   try
      Self.unloadApplications;
   except

   end;
   Stopped := True;
end;

{ Descrrega todos os pacotes carregados na inicialização do serviço.
}
function TUMService.unloadApplications: boolean;
var
   i: integer;
   slAppsOk: TStringList;
   slAppsErro: TStringList;
begin
   Result := True;
   slAppsOk := TSTringList.Create;
   slAppsErro := TSTringList.Create;
   slAppsOk.Delimiter := ',';
   slAppsErro.Delimiter := ',';

   // percorre a lista de pacotes carregados
   for i := 0 to Self.FSlAppList.Count - 1 do
   begin
      // tenta descarregar o pacote
      if TUMServiceApp(Self.FSlAppList.Objects[i]).unloadApp then
      begin
         slAppsOk.Add(TUMServiceApp(Self.FSlAppList.Objects[i]).AppName);
      end
      else
      begin
         Result := False;
         slAppsErro.Add(TUMServiceApp(Self.FSlAppList.Objects[i]).AppName);
      end;
   end;

   if slAppsOk.Count > 0 then
   begin
      Logger.log('Descarregando [SUCESSO]: ' + slAppsOk.Text);
   end;
   if slAppsErro.Count > 0 then
   begin
      Logger.log('Descarregando [ERRO]: ' + slAppsErro.Text);
   end;
   Self.FSlAppList.Clear;
end;

end.
