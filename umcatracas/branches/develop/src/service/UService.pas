unit UService;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
   ActiveX, UMCatracasClasses;

type
   TSvcUnimestreCatracas = class(TService)
      procedure ServiceShutdown(Sender: TService);
      procedure ServiceAfterInstall(Sender: TService);
      procedure ServiceAfterUninstall(Sender: TService);
      procedure ServiceContinue(Sender: TService; var Continued: Boolean);
      procedure ServiceExecute(Sender: TService);
      procedure ServiceStart(Sender: TService; var Started: Boolean);
      procedure ServiceStop(Sender: TService; var Stopped: Boolean);
   private
      FPackages: array of HMODULE;
      function GetTurnstileManager: TTurnstileManager;
      procedure LoadPackages;
      procedure salvarLog(aMensagem: String);
   public
      function GetServiceController: TServiceController; override;
      procedure LogMessageLocal(Message: String; EventType: DWord);      
   end;

var
   SvcUnimestreCatracas: TSvcUnimestreCatracas;

implementation

uses
   UDMCatracas, UHenry7x, UHenry8x;

{$I consts.inc}
{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
   SvcUnimestreCatracas.Controller(CtrlCode);
end;

function TSvcUnimestreCatracas.GetServiceController: TServiceController;
begin
  try
    Result := ServiceController;
  except
		on E: Exception do
		begin
      salvarLog('[TSvcUnimestreCatracas.GetServiceController] Ocorreu um erro: ' + E.Message);
		end;
  end;
end;

function TSvcUnimestreCatracas.GetTurnstileManager: TTurnstileManager;
var
   ClassRef: TPersistentClass;
begin
  try
     Result := nil;

     ClassRef := GetClass('TTurnstileManager');

     if ClassRef <> nil then
        Result := TTurnstileManagerClass(ClassRef).Instance;
  except
    on E: Exception do
      salvarLog('[TSvcUnimestreCatracas.GetTurnstileManager] Ocorreu ao carregar o serviço: ' + E.Message);
  end;
end;

procedure TSvcUnimestreCatracas.LoadPackages;
var
   SR: TSearchRec;
   I: Integer;
   xErros: String;
begin
   I := 0;
   if FindFirst('catracas\*.bpl', faAnyFile and not faDirectory, SR) = 0 then
   begin
      xErros := '';
      repeat
         try                                                                     
            Inc(I);
            SetLength(FPackages, I);
            FPackages[I - 1] := LoadPackage('catracas\' + SR.Name);
         except
            on E: Exception do
            begin
               if (Trim(xErros) = EmptyStr) then
                  xErros := SR.Name + ' - ' + E.Message
               else
                  xErros := xErros + ';' + SR.Name + ' - ' + E.Message;
            end;
         end;
      until FindNext(SR) <> 0;
      SysUtils.FindClose(SR);
   end;

   if (Trim(xErros) <> '') then
   begin
      salvarLog('[TSvcUnimestreCatracas.LoadPackages] Erro ao carregar package: ' + xErros);
   end;
end;

procedure TSvcUnimestreCatracas.salvarLog(aMensagem: String);
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

procedure TSvcUnimestreCatracas.LogMessageLocal(Message: String; EventType: DWord);
begin
   LogMessage(Message, EventType);
end;

procedure TSvcUnimestreCatracas.ServiceAfterInstall(Sender: TService);
begin
   LogMessageLocal('TSvcUnimestreCatracas.ServiceAfterInstall: ' + SEventAfterInstall, EVENTLOG_INFORMATION_TYPE);
end;

procedure TSvcUnimestreCatracas.ServiceAfterUninstall(Sender: TService);
begin
   LogMessageLocal('TSvcUnimestreCatracas.ServiceAfterUninstall: ' + SEventAfterUninstall, EVENTLOG_INFORMATION_TYPE);
end;

procedure TSvcUnimestreCatracas.ServiceContinue(Sender: TService;
  var Continued: Boolean);
begin
   LogMessageLocal('TSvcUnimestreCatracas.ServiceContinue: ' + SEventOnContinue, EVENTLOG_INFORMATION_TYPE);
end;

procedure TSvcUnimestreCatracas.ServiceExecute(Sender: TService);
var
   xContador: Integer;
begin
  try
     xContador := 1;
     LogMessageLocal('TSvcUnimestreCatracas.ServiceExecute.B: ' + SEventOnContinue, EVENTLOG_INFORMATION_TYPE);
     while not Terminated do
     begin
        LogMessageLocal('TSvcUnimestreCatracas.ServiceExecute(' + IntToStr(xContador) + '): ' + SEventOnContinue, EVENTLOG_INFORMATION_TYPE);
        Sleep(1);
        //Sender.ReportStatus;
        try
          ServiceThread.Priority := tpHighest;
          //ServiceThread.FreeOnTerminate := False;
          ServiceThread.ProcessRequests(True);
        except
           on E: Exception do
              salvarLog('[TSvcUnimestreCatracas.ServiceExecute] Ocorreu um erro ao executar o serviço: ' + E.Message);
        end;
        Inc(xContador);
     end;
     LogMessageLocal('TSvcUnimestreCatracas.ServiceExecute.A: ' + SEventOnContinue, EVENTLOG_INFORMATION_TYPE);
  except
     on E: Exception do
        salvarLog('[TSvcUnimestreCatracas.ServiceExecute] Ocorreu na execução do serviço: ' + E.Message);
  end;
end;

procedure TSvcUnimestreCatracas.ServiceShutdown(Sender: TService);
begin
   LogMessageLocal('TSvcUnimestreCatracas.ServiceShutdown', EVENTLOG_INFORMATION_TYPE);
end;

procedure TSvcUnimestreCatracas.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
   CoInitialize(nil);
   LogMessageLocal('TSvcUnimestreCatracas.ServiceStart: ' + SEventOnStart, EVENTLOG_INFORMATION_TYPE);

   Application.CreateForm(TDMCatracas, DMCatracas);

   if not DMCatracas.conn.Connected then
   begin
      salvarLog(Format('[TSvcUnimestreCatracas.ServiceStart] não foi possível se conectar na base de dados. Host: %s Porta: %s', [DMCatracas.conn.HostName,
                                                                                                                                  IntToStr(DMCatracas.conn.Port)]));

      Started := False;
   end;

   if DMCatracas.conn.Connected then
   begin
      try
         Started := True;
         LoadPackages;
         GetTurnstileManager.Start(DMCatracas.conn.DbcConnection, Self);
      except
         on E: Exception do
            salvarLog('[TSvcUnimestreCatracas.ServiceStart - conn.Connected] Ocorreu um erro ao tentar iniciar o serviço: ' + E.Message);
      end;
   end;
end;

procedure TSvcUnimestreCatracas.ServiceStop(Sender: TService;
  var Stopped: Boolean);
var
   I, L, H: Integer;
begin
   LogMessageLocal('TSvcUnimestreCatracas.ServiceStop: ' + SEventOnStop, EVENTLOG_INFORMATION_TYPE);
   L := Low(FPackages);
   H := High(FPackages);
   for I := H downto L do
   begin
      UnloadPackage(FPackages[I]);
   end;
   CoUninitialize;
end;

end.
