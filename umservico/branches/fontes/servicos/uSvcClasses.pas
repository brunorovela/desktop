unit uSvcClasses;

interface

uses
   Windows, Classes, SysUtils, SvcMgr, uCFuncArquivos, IniFiles, uCFuncDatas,
   DateUtils, uCFuncString, uDMConexao;

type
   TInterfacedPersistentClass = class of TInterfacedPersistent;

   { Esta enumeração lista os tipos de retorno válidos para a execução de um
     serviço do Unimestre.
     srSuccess: execução efetuada com sucesso
     srError: ocorreu erro durante o processamento do serviço
     srParadaForcada: foi solicitada a finalização do processo pelo usuário
     srExecutando: o serviço está processando
     srIgnorar: deve ser ignorado
   }
   IUMServiceAppRet = (srSuccess, srError, srParadaForcada, srExecutando, srIgnorar);

   { A interface IUMServiceApp é um modelo para um aplicação do tipo serviço do
     Windows do Unimestre Serviços. Todas as aplicações desenvolvidas para o
     Unimestre Serviços deverão implementar esta interface.
   }
   IUMServiceApp = interface
      ['{F001A53F-88B7-477D-876F-D0FEC07424BF}']
      function processa: IUMServiceAppRet;
      procedure onLoadServico;     // executa ao carregar o serviço
      procedure onUnloadServico;   // executa ao finalizar o serviço
      procedure stopProcessamento; // pára o processamento do serviço
      procedure setConfig(var AConf: TIniFile);
      procedure setLogger(var ALog: TUMFileLogger);
      procedure LogaSvc(chave: String = '');
   end;

   { A classe TUMServiceDefault implementa a interface IUMServiceApp. É a classe
     padrão para todos os serviços do Unimestre Serviços.
   }
   TUMServiceDefault = class(TInterfacedPersistent, IUMServiceApp)
   strict private
      FLog: TUMFileLogger;    // arquivo de Log
      FConfig: TIniFile;      // arquivo de configuração do Serviço
   public
      property Log: TUMFileLogger read FLog;
      property Config: TIniFile read FConfig;
      function processa: IUMServiceAppRet; virtual; abstract;
      procedure onLoadServico; virtual; abstract;
      procedure onUnloadServico; virtual; abstract;
      procedure stopProcessamento; virtual; abstract;
      procedure setConfig(var AConf: TIniFile);
      procedure setLogger(var ALog: TUMFileLogger);
      procedure LogaSvc(chave: String = '');
   end;

   { A classe TUMServiceApp implementa uma TThread. A classe possui uma atributo
     do tipo IUMServiceApp que deve ser executado temporariamente conforme as
     configurações pré-definidas. Cada serviço inicializado do Unimestre é uma
     nova Thread.
   }
   TUMServiceApp = class(TThread)
   strict private
      FLog: TUMFileLogger;
      FConfig: TIniFile;
      FApp: IUMServiceApp;        // referência para a aplicação de serviço
      FRetorno: IUMServiceAppRet; // retorno da última execução do serviço
      FLastStarted: TDateTime;    // data e hora da última inicialização
      FLastExecution: TDateTime;  // data e hora da última execução
      FHModule: HMODULE;          // referência para o pacote do serviço
      FInterval: Integer;         // intervalo entre as execuções
      FAppPath: string;           // diretório do pacote
      FAppName: string;           // nome do serviço
      FAppDirectory: string;      // diretório da aplicação
      FRunning: boolean;          // indica se o serviço está em execução
      FStopExecution: boolean;    // indica se a execução deve ser finalizada
      FIntervaloEntreExecucoes: boolean; // quando ligado insere intervalo entre uma execução e outra
      procedure loadConfiguration;
   protected
      procedure Execute; override;
      procedure OnTerminateThread(Sender: TObject);
   public
      constructor Create(ASAppPath: string);
      property Log: TUMFileLogger read FLog;
      property Config: TIniFile read FConfig;
      property AppName: string read FAppName;
      property App: IUMServiceApp read FApp;
      property Interval: Integer read FInterval write FInterval;
      property IsRunning: Boolean read FRunning;
      property LastStarted: TDateTime read FLastStarted;
      property Retorno: IUMServiceAppRet read FRetorno;
      function loadApp: boolean;
      function startApp: boolean;
      function stopApp: boolean;
      function unloadApp: boolean;
      procedure executeApp;
      procedure StopExecution;
      procedure doUnloadPackage(Module: HModule);
   end;

implementation

uses UZDataSet;

{ TUMServiceDefault }

procedure TUMServiceDefault.LogaSvc(chave: String);
var
   LoggerServices : TUMLoggerServices;
   NomeServico : String;
begin
   if chave <> '' then
      chave := '.' + chave;

   NomeServico := LowerCase(StringReplace(Self.ClassName, 'TUMSvc', '', [rfIgnoreCase]));

   LoggerServices := TUMLoggerServices.Create(Self.Config);

   if not LoggerServices.logar(NomeServico + chave) then
      Self.Log.log(LoggerServices.LastError);

   LoggerServices.Destroy;

end;

procedure TUMServiceDefault.setConfig(var AConf: TIniFile);
begin
   Self.FConfig := AConf;
end;

procedure TUMServiceDefault.setLogger(var ALog: TUMFileLogger);
begin
   Self.FLog := ALog;
end;

{ TUMServiceApp }

constructor TUMServiceApp.Create(ASAppPath: string);
begin
   inherited Create(true);
   Self.FAppPath := ASAppPath;
   Self.FApp := nil;
   Self.FAppDirectory := ExtractFilePath(Self.FAppPath);
   Self.FAppName := Copy(ExtractFileName(Self.FAppPath), 1, Length(ExtractFileName(Self.FAppPath)) - 4);
   Self.FInterval := 1;
   Self.FRetorno := srExecutando;
   Self.FLastStarted := Now - 1;
   Self.FLastExecution := Now - 1;
   Self.loadConfiguration;
end;

{ Descarrega o pacote da memória.
}
procedure TUMServiceApp.doUnloadPackage(Module: HModule);
var
   i: Integer;
   M: TMemoryBasicInformation;
begin
   { Make sure there aren't any instances of any
    of the classes from Module instantiated, if
    so then free them.  (This assumes that the
    classes are owned by the application)
   }
   for i := Application.ComponentCount - 1 downto 0 do
   begin
      VirtualQuery(GetClass(Application.Components[i].ClassName), M, SizeOf(M));
      if (Module = 0) or (HMODULE(M.AllocationBase) = Module) then
      begin
         Application.Components[i].Free;
      end;
   end;
   UnRegisterModuleClasses(Module);
   UnloadPackage(Module);
end;

procedure TUMServiceApp.Execute;
begin
   while not Self.Terminated do
   begin
      if not Self.FStopExecution then
         Self.executeApp
      else
         Self.Terminate;
   end;
end;

{ Executa a aplicação.
}
procedure TUMServiceApp.executeApp;
const
   SLEEP_MAX_TIME = 60 * 60;
   SLEEP_MAX_ROUND = 2;
var
   sRet: string;
   dtProx: TDateTime;
   iSleep, iTimes: integer;
begin
   if Self.FInterval < 1 then Self.FInterval := 1;
   // intervalo entre as exceuções ?
   if Self.FIntervaloEntreExecucoes then
   begin
      // pega a próxima data para execução com intervalo sobre a última execução
      dtProx := TFuncDatas.dataSoma(Self.FLastExecution, Self.FInterval, dpSegundo);
   end
   else
   begin
      // pega a próxima data para execução com intervalor sobre a data de início
      dtProx := TFuncDatas.dataSoma(Self.FLastStarted, Self.FInterval, dpSegundo);
   end;
   // pega o intervalo entre a data atual e a próxima execução
   iSleep := SecondsBetween(Now, dtProx);
   if Now > dtProx then iSleep := iSleep * -1;

   // aguarda até que seja o momento de executar
   while iSleep > 0 do
   begin
      if Self.Terminated then Exit;
      iSleep := SecondsBetween(Now, dtProx);
      if Now > dtProx then iSleep := iSleep * -1;

      if iSleep > SLEEP_MAX_TIME then iSleep := SLEEP_MAX_TIME
      else if iSleep <= 0 then Continue;

      if iSleep <= SLEEP_MAX_ROUND then Sleep(iSleep)
      else
      begin
         iTimes := iSleep div SLEEP_MAX_ROUND;
         while iTimes > 0 do
         begin
            Sleep(SLEEP_MAX_ROUND * 1000);
            if Self.Terminated then Exit;
            Dec(iTimes);
         end;
      end;
   end;
   if Self.Terminated then Exit;

   // verifica o tempo de espera restante
   iSleep := SecondsBetween(Now, dtProx);
   if Now > dtProx then iSleep := iSleep * -1;

   // é hora de executar
   if iSleep < 1 then
   begin
      Self.FRunning := True;
      Self.FLastStarted := Now;
      try
         Self.FApp.LogaSvc();

         // processa o serviço
         Self.FRetorno := Self.FApp.processa;
      except
         on E: Exception do
         begin
            Self.FRetorno := srError;
            sRet := E.Message;
         end;
      end;
      // verifica o retorno ...
      if Self.FRetorno = srSuccess then
      begin
         Self.FLog.log('EXEC [SUCESSO]: ' + Self.FAppName);
      end
      else if Self.FRetorno in[srError, srParadaForcada] then
      begin
         // e a causa do erro...
         if sRet = '' then
         begin
            case Self.FRetorno of
               srError: sRet := 'Erro interno';
               srParadaForcada: sRet := 'Parada forçada';
               else
                  sRet := 'desconhecido';
            end;
         end;
         Self.FLog.log('EXEC [ERRO]: ' + Self.FAppName + ' Motivo: ' + sRet);
      end;
      Self.FLastExecution := Now;
      Self.FRunning := False;
   end;
end;

{ Carrega uma aplicação.
}
function TUMServiceApp.loadApp: boolean;
var
   LClass: TPersistentClass;
   LObj: TInterfacedPersistent;
   sAppFileName: string;
begin

   LClass := nil;
   Result := FileExists(Self.FAppPath);
   if Result then
   begin
      // tenta carregar o pacote
      try
         Self.FHModule := LoadPackage(Self.FAppPath);
      except
         on E: Exception do
         begin
            Self.FLog.log('[ERRO] onLoadServico (LoadPackage): ' + E.Message);
            Result := False;
         end;
      end;
      // verifica se o pacote foi carregado
      Result := Result and (Self.FHModule <> 0);
      if Result then
      begin
         // procura a classe que implementa o serviço
         sAppFileName := ExtractFileName(Self.FAppPath);
         LClass := FindClass('T' + Self.FAppName);
         if LClass <> nil then
         begin
            LObj := TInterfacedPersistentClass(LClass).Create;
            if Supports(LObj, IUMServiceApp) then
            begin
               Self.FApp := LObj as IUMServiceApp;
               Self.FApp.setLogger(Self.FLog);
               Self.FApp.setConfig(Self.FConfig);
               // carrega o serviço
               try
                  Self.FApp.onLoadServico;
               except
                  on E: Exception do
                  begin
                     Self.FLog.log('[ERRO] onLoadServico: ' + E.Message);
                  end;
               end;
            end;            
         end
         else
         begin
            UnloadPackage(FHModule);
         end;
         Result := True;
      end;
   end;
end;

procedure TUMServiceApp.loadConfiguration;
var
   sInterval, sKey: string;
   iInterval: integer;
begin
   Self.FLog := TUMFileLogger.Create(Self.FAppDirectory + '\..\logs\' + Self.FAppName + '.log');
   Self.FConfig := TIniFile.Create(Self.FAppDirectory + '\' + Self.FAppName + '.ini');

   sInterval := Trim(Self.FConfig.ReadString('Configuracoes', 'Intervalo', '5m'));
   iInterval := StrToInt(TFuncString.soNumeros(sInterval));
   sKey := TFuncString.soLetras(sInterval);
   if sKey = '' then sKey := 'm';
   case Ord(sKey[1]) of
      Ord('m'):
         Self.FInterval := iInterval * 60;
      Ord('h'):
         Self.FInterval := iInterval * 60 * 60;
      Ord('d'):
         Self.FInterval := iInterval * 60 * 60 * 24; 
   end;
   Self.FIntervaloEntreExecucoes := Trim(Self.FConfig.ReadString('Configuracoes', 'IntervaloEntreExecucoes', 'N')) = 'S';  
end;

procedure TUMServiceApp.OnTerminateThread(Sender: TObject);
begin
   try
      FreeAndNil(Self.FLog);
   except

   end;
end;

function TUMServiceApp.startApp: boolean;
begin
   Self.Resume;
   Result := Self.IsRunning;
end;

function TUMServiceApp.stopApp: boolean;
begin
   Self.Suspend;
   Result := not Self.IsRunning;
end;

procedure TUMServiceApp.StopExecution;
begin
   Self.FApp.stopProcessamento;
end;

function TUMServiceApp.unloadApp: boolean;
begin
   Self.FStopExecution := True;
   Result := True;
   try
      Self.Terminate;
      Self.FApp.onUnloadServico;
      Self.doUnloadPackage(Self.FHModule);
   except
      on E: Exception do Result := False
   end;
end;

end.
