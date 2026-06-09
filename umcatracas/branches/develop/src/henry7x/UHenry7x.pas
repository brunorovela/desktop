unit UHenry7x;

interface

uses
   Classes, SysUtils, Windows, Kernel7x_TLB, uLkJSON, UMCatracasClasses;

type
   TKernelRequest = SRegistro;
   TKernelResponse = SResposta;
   TDeviceSettings = SConfiguracao;
   TComSettings = SComConfig;

   THenry7x = class(TCustomTurnstile)
   private
      FSettings: AnsiString;
      FLastRequest: TKernelRequest;
      FLastResponse: TKernelResponse;
      FThreadIndex: Integer;
   public
      destructor Destroy; override;
      procedure Initialize(const Settings: AnsiString); override;
      procedure UnInitialize; override;
      procedure ParseSettings(out DeviceSettings: TDeviceSettings);
      property LastRequest: TKernelRequest read FLastRequest write FLastRequest;
      property LastResponse: TKernelResponse read FLastResponse write FLastResponse;
      property Settings: AnsiString read FSettings;
      property ThreadIndex: Integer read FThreadIndex write FThreadIndex;
   end;

   THenry7xList = class(TList)
   protected
      function GetItem(Index: Integer): THenry7x;
      procedure SetItem(Index: Integer; Henry7x: THenry7x);
   public
      function Add(Henry7x: THenry7x): Integer;
      function Extract(Item: THenry7x): THenry7x;
      function Remove(Henry7x: THenry7x): Integer;
      function IndexOf(Henry7x: THenry7x): Integer;
      procedure Insert(Index: Integer; Henry7x: THenry7x);
      function First: THenry7x;
      function Last: THenry7x;
      property Items[Index: Integer]: THenry7x read GetItem write SetItem; default;
   end;

   TKernelManager = class
   private
      FKernel: TKernel;
      FCurrDevice: THenry7x;
      FDevices: THenry7xList;
      FLock: TRTLCriticalSection;
      class var FInstance: TKernelManager;
      class function GetInstance: TKernelManager; static;
      function CheckKernelError: Boolean;
      function CheckThreadError: Boolean;
      function GetDeviceByThreadIndex(const ThreadIndex: Integer): THenry7x;
      function ParseResponse(const JSON: AnsiString): TKernelResponse;
      procedure Initialize;
      procedure OnRegistro(ASender: TObject; pThreadIndex: Integer);
      procedure OnStatus(ASender: TObject; pThreadIndex, pDeviceID,
         pStatus: Integer);
      procedure SendResponse(Response: TKernelResponse);
      procedure Setup;
   public
      class property Instance: TKernelManager read GetInstance;
      constructor Create;
      destructor Destroy; override;
      procedure Add(const Device: THenry7x);
      property DeviceByThreadIndex[const ThreadIndex: Integer]: THenry7x
         read GetDeviceByThreadIndex; 
   end;

implementation

{$I consts.inc}

{ THenry7x }

destructor THenry7x.Destroy;
begin
   inherited;
end;

procedure THenry7x.Initialize(const Settings: AnsiString);
var
   S: AnsiString;
begin
   FSettings := Settings;

   S := 'THenry7x.Initialize(1): ' + Format(SEventInitializingDevFmt, [ID, IP, Port]);
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_INFORMATION_TYPE);

   TKernelManager.Instance.Add(Self);

   if Active then
   begin
      S := 'THenry7x.Initialize(2): ' + Format(SEventDevInitializedFmt, [ID, IP, Port]);
      TTurnstileManager.Instance.LogMessage(S, EVENTLOG_SUCCESS);
   end;

   if not Active then
   begin
      S := 'THenry7x.Initialize(3): ' + Format(SEventDevNotInitializedFmt, [ID, IP, Port]);
      TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
   end;
end;

procedure THenry7x.ParseSettings(out DeviceSettings: TDeviceSettings);
var
   Settings, Relays, Relay, Readers, BarCode, Inspect, Selection, Companies,
   CtrlAcessoEx, Ctrls, AntiPassBack, Sensors, Sensor, AutoOff, Flags,
   TimeCtrl: TlkJSONobject;
begin
   Settings := TlkJSON.ParseText(FSettings) as TlkJSONobject;
   try
      if Settings.Field['Versao'] is TlkJSONstring then
         DeviceSettings.Versao := Settings.getString('Versao');

      if Settings.Field['PlacaCard'] is TlkJSONnumber then
         DeviceSettings.PlacaCard := Settings.getInt('PlacaCard');

      if Settings.Field['Expansao'] is TlkJSONboolean then
         DeviceSettings.Expansao := Settings.getBoolean('Expansao');

      if Settings.Field['ModoComunicacao'] is TlkJSONnumber then
         DeviceSettings.ModoComunicacao := Settings.getInt('ModoComunicacao');

      if Settings.Field['Teclado'] is TlkJSONnumber then
         DeviceSettings.Teclado := Settings.getInt('Teclado');

      if Settings.Field['Reles'] is TlkJSONobject then
      begin
         Relays := TlkJSONobject(Settings.Field['Reles']);

         if Relays.Field['Rele1'] is TlkJSONobject then
         begin
            Relay := TlkJSONobject(Relays.Field['Rele1']);
            DeviceSettings.Reles.Rele1.Status := Relay.getInt('Status');
            DeviceSettings.Reles.Rele1.TipoNANF := Relay.getInt('TipoNANF');
            DeviceSettings.Reles.Rele1.Tempo := Relay.getInt('Tempo');
         end;

         if Relays.Field['Rele2'] is TlkJSONobject then
         begin
            Relay := TlkJSONobject(Relays.Field['Rele2']);
            DeviceSettings.Reles.Rele2.Status := Relay.getInt('Status');
            DeviceSettings.Reles.Rele2.TipoNANF := Relay.getInt('TipoNANF');
            DeviceSettings.Reles.Rele2.Tempo := Relay.getInt('Tempo');
         end;

         if Relays.Field['Rele3'] is TlkJSONobject then
         begin
            Relay := TlkJSONobject(Relays.Field['Rele3']);
            DeviceSettings.Reles.Rele3.Status := Relay.getInt('Status');
            DeviceSettings.Reles.Rele3.TipoNANF := Relay.getInt('TipoNANF');
            DeviceSettings.Reles.Rele3.Tempo := Relay.getInt('Tempo');
         end;

         if Relays.Field['Rele4'] is TlkJSONobject then
         begin
            Relay := TlkJSONobject(Relays.Field['Rele4']);
            DeviceSettings.Reles.Rele4.Status := Relay.getInt('Status');
            DeviceSettings.Reles.Rele4.TipoNANF := Relay.getInt('TipoNANF');
            DeviceSettings.Reles.Rele4.Tempo := Relay.getInt('Tempo');
         end;

         if Relays.Field['Rele5'] is TlkJSONobject then
         begin
            Relay := TlkJSONobject(Relays.Field['Rele5']);
            DeviceSettings.Reles.Rele5.Status := Relay.getInt('Status');
            DeviceSettings.Reles.Rele5.TipoNANF := Relay.getInt('TipoNANF');
            DeviceSettings.Reles.Rele5.Tempo := Relay.getInt('Tempo');
         end;
      end;

      if Settings.Field['Leitores'] is TlkJSONobject then
      begin
         Readers := TlkJSONobject(Settings.Field['Leitores']);

         if Readers.Field['Leitor1'] is TlkJSONnumber then
            DeviceSettings.Leitores.Leitor1 := Readers.getInt('Leitor1');

         if Readers.Field['Leitor2'] is TlkJSONnumber then
            DeviceSettings.Leitores.Leitor2 := Readers.getInt('Leitor2');

         if Readers.Field['Leitor3'] is TlkJSONnumber then
            DeviceSettings.Leitores.Leitor3 := Readers.getInt('Leitor3');
      end;

      if Settings.Field['NivelAcesso'] is TlkJSONnumber then
         DeviceSettings.NivelAcesso := Settings.getInt('NivelAcesso');

      if Settings.Field['CodigoBarras'] is TlkJSONobject then
      begin
         BarCode := TlkJSONobject(Settings.Field['CodigoBarras']);

         DeviceSettings.CodigoBarras.PadraoD := BarCode.getBoolean('PadraoD');
         DeviceSettings.CodigoBarras.Letras := BarCode.getBoolean('Letras');
         DeviceSettings.CodigoBarras.PadraoLivre := BarCode.getBoolean('PadraoLivre');
         DeviceSettings.CodigoBarras.DigitosAutomatico := BarCode.getBoolean('DigitosAutomatico');
         DeviceSettings.CodigoBarras.PadraoT := BarCode.getBoolean('PadraoT');
         DeviceSettings.CodigoBarras.OcultarDigitos := BarCode.getBoolean('OcultarDigitos');
         DeviceSettings.CodigoBarras.ArquivoT := BarCode.getString('ArquivoT');
      end;

      if Settings.Field['NumDigitos'] is TlkJSONnumber then
         DeviceSettings.NumDigitos := Settings.getInt('NumDigitos');

      if Settings.Field['Revista'] is TlkJSONobject then
      begin
         Inspect := TlkJSONobject(Settings.Field['Revista']);
         DeviceSettings.Revista.Tipo := Inspect.getInt('Tipo');
         DeviceSettings.Revista.PercentRevista := Inspect.getInt('PercentRevista');
      end;

      if Settings.Field['SenhaMenu'] is TlkJSONboolean then
         DeviceSettings.SenhaMenu := Settings.getBoolean('SenhaMenu');

      if Settings.Field['Senha'] is TlkJSONstring then
         DeviceSettings.Senha := Settings.getString('Senha');

      if Settings.Field['DigitosSel'] is TlkJSONobject then
      begin
         Selection := TlkJSONobject(Settings.Field['DigitosSel']);
         DeviceSettings.DigitosSel.Selecionados := Selection.getString('Selecionados');
      end;

      if Settings.Field['Empresas'] is TlkJSONobject then
      begin
         Companies := TlkJSONobject(Settings.Field['Empresas']);

         if Companies.Field['Empresa1'] is TlkJSONstring then
            DeviceSettings.Empresas.Empresa1 := Companies.getString('Empresa1');

         if Companies.Field['Empresa2'] is TlkJSONstring then
            DeviceSettings.Empresas.Empresa2 := Companies.getString('Empresa2');

         if Companies.Field['Empresa3'] is TlkJSONstring then
            DeviceSettings.Empresas.Empresa3 := Companies.getString('Empresa3');

         if Companies.Field['Empresa4'] is TlkJSONstring then
            DeviceSettings.Empresas.Empresa4 := Companies.getString('Empresa4');

         if Companies.Field['Empresa5'] is TlkJSONstring then
            DeviceSettings.Empresas.Empresa5 := Companies.getString('Empresa5');
      end;

      if Settings.Field['Biometria'] is TlkJSONnumber then
         DeviceSettings.Biometria := Settings.getInt('Biometria');

      if Settings.Field['CtrlAcesso'] is TlkJSONnumber then
         DeviceSettings.CtrlAcesso := Settings.getInt('CtrlAcesso');

      if Settings.Field['CtrlAcessoEx'] is TlkJSONobject then
      begin
         CtrlAcessoEx := TlkJSONobject(Settings.Field['CtrlAcessoEx']);
         DeviceSettings.CtrlAcessoEx.Gravacao := CtrlAcessoEx.getInt('Gravacao');
         DeviceSettings.CtrlAcessoEx.AtivarMaster := CtrlAcessoEx.getBoolean('AtivarMaster');
         DeviceSettings.CtrlAcessoEx.Sinaliza50Percent := CtrlAcessoEx.getBoolean('Sinaliza50Percent');
         DeviceSettings.CtrlAcessoEx.SenhaPadraoHenry := CtrlAcessoEx.getBoolean('SenhaPadraoHenry');
         DeviceSettings.CtrlAcessoEx.Catraca := CtrlAcessoEx.getBoolean('Catraca');
         DeviceSettings.CtrlAcessoEx.CatracaInvertida := CtrlAcessoEx.getBoolean('CatracaInvertida');
         DeviceSettings.CtrlAcessoEx.CatracaDupla := CtrlAcessoEx.getBoolean('CatracaDupla');
      end;

      if Settings.Field['ToquesAtender'] is TlkJSONnumber then
         DeviceSettings.ToquesAtender := Settings.getInt('ToquesAtender');

      if Settings.Field['Controles'] is TlkJSONobject then
      begin
         Ctrls := TlkJSONobject(Settings.Field['Controles']);
         DeviceSettings.Controles.BloqueiaPeriodo := Ctrls.getBoolean('BloqueiaPeriodo');
         DeviceSettings.Controles.BiometriaOnline := Ctrls.getBoolean('BiometriaOnline');
         DeviceSettings.Controles.FuncoesEspecificas := Ctrls.getBoolean('FuncoesEspecificas');
         DeviceSettings.Controles.CatBioLiberaAmbos := Ctrls.getBoolean('CatBioLiberaAmbos');
         DeviceSettings.Controles.Visitantes := Ctrls.getBoolean('Visitantes');
         DeviceSettings.Controles.Touch := Ctrls.getBoolean('Touch');
         DeviceSettings.Controles.AutoOn := Ctrls.getInt('AutoOn');
         DeviceSettings.Controles.Digitais11 := Ctrls.getBoolean('Digitais11');
         DeviceSettings.Controles.LeitorDigitalFree := Ctrls.getBoolean('LeitorDigitalFree');
         DeviceSettings.Controles.BiometriaImagem := Ctrls.getBoolean('BiometriaImagem');
      end;

      if Settings.Field['AntiPassBack'] is TlkJSONobject then
      begin
         AntiPassBack := TlkJSONobject(Settings.Field['AntiPassBack']);
         DeviceSettings.AntiPassBack.Habilitado := AntiPassBack.getBoolean('Habilitado');
         DeviceSettings.AntiPassBack.EntradaSaida := AntiPassBack.getBoolean('EntradaSaida');
         DeviceSettings.AntiPassBack.Tempo := AntiPassBack.getInt('Tempo');
      end;

      if Settings.Field['Sensores'] is TlkJSONobject then
      begin
         Sensors := TlkJSONobject(Settings.Field['Sensores']);

         if Sensors.Field['Sensor1'] is TlkJSONobject then
         begin
            Sensor := TlkJSONobject(Sensors.Field['Sensor1']);
            DeviceSettings.Sensores.Sensor1.Habilitado := Sensor.getBoolean('Habilitado');
            DeviceSettings.Sensores.Sensor1.Porta := Sensor.getBoolean('Porta');
            DeviceSettings.Sensores.Sensor1.Botao := Sensor.getBoolean('Botao');
            DeviceSettings.Sensores.Sensor1.Rele1 := Sensor.getBoolean('Rele1');
            DeviceSettings.Sensores.Sensor1.Rele2 := Sensor.getBoolean('Rele2');
            DeviceSettings.Sensores.Sensor1.Rele3 := Sensor.getBoolean('Rele3');
            DeviceSettings.Sensores.Sensor1.Rele4 := Sensor.getBoolean('Rele4');
            DeviceSettings.Sensores.Sensor1.Rele5 := Sensor.getBoolean('Rele5'); 
         end;

         if Sensors.Field['Sensor2'] is TlkJSONobject then
         begin
            Sensor := TlkJSONobject(Sensors.Field['Sensor2']);
            DeviceSettings.Sensores.Sensor2.Habilitado := Sensor.getBoolean('Habilitado');
            DeviceSettings.Sensores.Sensor2.Porta := Sensor.getBoolean('Porta');
            DeviceSettings.Sensores.Sensor2.Botao := Sensor.getBoolean('Botao');
            DeviceSettings.Sensores.Sensor2.Rele1 := Sensor.getBoolean('Rele1');
            DeviceSettings.Sensores.Sensor2.Rele2 := Sensor.getBoolean('Rele2');
            DeviceSettings.Sensores.Sensor2.Rele3 := Sensor.getBoolean('Rele3');
            DeviceSettings.Sensores.Sensor2.Rele4 := Sensor.getBoolean('Rele4');
            DeviceSettings.Sensores.Sensor2.Rele5 := Sensor.getBoolean('Rele5'); 
         end;
         
      end;

      if Settings.Field['AutoOff'] is TlkJSONobject then
      begin
         AutoOff := TlkJSONobject(Settings.Field['AutoOff']);
         DeviceSettings.AutoOff.Habilitado := AutoOff.getBoolean('Habilitado');
         DeviceSettings.AutoOff.Tempo := AutoOff.getInt('Tempo');
      end;

      if Settings.Field['Orion'] is TlkJSONboolean then
         DeviceSettings.Orion := Settings.getBoolean('Orion');

      if Settings.Field['FaixaAcesso'] is TlkJSONboolean then
         DeviceSettings.FaixaAcesso := Settings.getBoolean('FaixaAcesso');

      if Settings.Field['ConfigFlags'] is TlkJSONobject then
      begin
         Flags := TlkJSONobject(Settings.Field['ConfigFlags']);
         DeviceSettings.ConfigFlags.LeitorasAutomaticas := Flags.getBoolean('LeitorasAutomaticas');
      end;

      if Settings.Field['ControleTempos'] is TlkJSONobject then
      begin
         TimeCtrl := TlkJSONobject(Settings.Field['ControleTempos']);
         DeviceSettings.ControleTempos.ProcessamentoOnline := TimeCtrl.getInt('ProcessamentoOnline');
         DeviceSettings.ControleTempos.LatenciaOffline := TimeCtrl.getInt('LatenciaOffline');
      end;

      if Settings.Field['Controladores'] is TlkJSONstring then
         DeviceSettings.Controladores := Settings.getString('Controladores');

   finally
      Settings.Free;
   end;
end;

procedure THenry7x.UnInitialize;
begin
   inherited;
end;

{ THenry7xList }

function THenry7xList.Add(Henry7x: THenry7x): Integer;
begin
   Result := inherited Add(Henry7x);
end;

function THenry7xList.Extract(Item: THenry7x): THenry7x;
begin
   Result := THenry7x(inherited Extract(Item));
end;

function THenry7xList.First: THenry7x;
begin
   Result := THenry7x(inherited First);
end;

function THenry7xList.GetItem(Index: Integer): THenry7x;
begin
   Result := THenry7x(inherited Items[Index]);
end;

function THenry7xList.IndexOf(Henry7x: THenry7x): Integer;
begin
   Result := inherited IndexOf(Henry7x);
end;

procedure THenry7xList.Insert(Index: Integer; Henry7x: THenry7x);
begin
   inherited Insert(Index, Henry7x);
end;

function THenry7xList.Last: THenry7x;
begin
   Result := THenry7x(inherited Last);
end;

function THenry7xList.Remove(Henry7x: THenry7x): Integer;
begin
   Result := inherited Remove(Henry7x);
end;

procedure THenry7xList.SetItem(Index: Integer; Henry7x: THenry7x);
begin
   inherited Items[Index] := Henry7x;
end;

{ TKernelManager }

procedure TKernelManager.Add(const Device: THenry7x);
begin
   FDevices.Add(Device);
   FCurrDevice := Device;
   Initialize;
end;

function TKernelManager.CheckKernelError: Boolean;
var
   Code: Integer;
   S: AnsiString;
begin
   EnterCriticalSection(FLock);
   Result := True;
   Code := FKernel.KernelLastError;

   if Code = 0 then
   begin
      LeaveCriticalSection(FLock);
      Exit;
   end;

   Result := False;
   S := FKernel.ErrorDescription[Code];
   S := 'THenry7x.CheckKernelError(1): ' + Format(SEventKernelErrorFmt, [FCurrDevice.IP, FCurrDevice.Port, Code, S]);
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
   LeaveCriticalSection(FLock);
end;

function TKernelManager.CheckThreadError: Boolean;
var
   Code: Integer;
   S: AnsiString;
begin
   EnterCriticalSection(FLock);
   Result := True;
   Code := FKernel.ThreadLastError[FCurrDevice.ThreadIndex];

   if Code = 0 then
   begin
      LeaveCriticalSection(FLock);
      Exit;
   end;

   Result := False;
   S := FKernel.ErrorDescription[Code];
   S := 'TKernelManager.CheckThreadError: ' + Format(SEventKernelErrorFmt, [FCurrDevice.IP, FCurrDevice.Port, Code, S]);
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
   LeaveCriticalSection(FLock);
end;

constructor TKernelManager.Create;
begin
   InitializeCriticalSection(FLock);
   FDevices := THenry7xList.Create;
   FKernel := TKernel.Create(nil);
   FKernel.OnRegistro := OnRegistro;
   FKernel.OnStatus := OnStatus;
end;

destructor TKernelManager.Destroy;
var
   I: Integer;
begin
   for I := FDevices.Count - 1 downto 0 do
   begin
      FKernel.RemoveCard[FDevices[I].ThreadIndex];
      FDevices.Extract(FDevices[I]).Free;
   end;
   FKernel.Free;
   FDevices.Free;
   FCurrDevice := nil;
   DeleteCriticalSection(FLock);
   inherited;
end;

function TKernelManager.GetDeviceByThreadIndex(
  const ThreadIndex: Integer): THenry7x;
var
   I: Integer;
begin
   Result := nil;
   
   for I := 0 to FDevices.Count - 1 do
   begin
      if FDevices[I].ThreadIndex = ThreadIndex then
      begin
         Result := FDevices[I];
         Break;
      end;
   end;
end;

class function TKernelManager.GetInstance: TKernelManager;
begin
   if not Assigned(TKernelManager.FInstance) then
      TKernelManager.FInstance := TKernelManager.Create;
   Result := TKernelManager.FInstance;
end;

procedure TKernelManager.Initialize;
var
   ComSettings: TComSettings;
   ThreadIndex: Integer;
begin
   FCurrDevice.Active := False;

   ComSettings.Tcp.Ip := FCurrDevice.IP;
   ComSettings.Tcp.Porta := FCurrDevice.Port;
   ComSettings.Tcp.MAC := FCurrDevice.MacAddress;
   ComSettings.Serial.NumeroRelogio := 0;
   ComSettings.Serial.Porta := '';
   ComSettings.Serial.Velocidade := cv9600;
   ComSettings.ModoComunicacao := cmcOnline;
   ComSettings.Modem.Fone := '';
   ComSettings.Modem.Porta := '';
   ComSettings.TipoComunicacao := ctcTcpIp;
   ComSettings.GPRS.Porta := 0;
   ComSettings.IsCatraca := True;

   FCurrDevice.Active :=
      FKernel.AdicionaCard[ComSettings, ThreadIndex];
   if FCurrDevice.Active then
      FCurrDevice.ThreadIndex := ThreadIndex;
   CheckKernelError;
   CheckThreadError;

   if not FCurrDevice.Active then
      Exit;
   Setup;
end;

procedure TKernelManager.OnRegistro(ASender: TObject; pThreadIndex: Integer);
var
   Request: TKernelRequest;
   Response: TKernelResponse;
   S, JSON, EventType: AnsiString;
begin
   EnterCriticalSection(FLock);
   FCurrDevice := DeviceByThreadIndex[pThreadIndex];

   if FCurrDevice = nil then
   begin
      LeaveCriticalSection(FLock);
      Exit;
   end;

   if not FCurrDevice.Active then
   begin
      LeaveCriticalSection(FLock);
      Exit;
   end;

   FKernel.RegistroOn(FCurrDevice.ThreadIndex, Request);

   {$B+}
   if CheckKernelError or CheckThreadError then
      Exit;
   {$B-}

   S := 'TKernelManager.OnRegistro: ' + Format(SEventRequestFmt, [
      FCurrDevice.IP,
      FCurrDevice.Port,
      Request.Matricula,
      FormatDateTime(SDateTimeToISOFmt, Request.DataHora),
      Request.Funcao,
      Request.Flag,
      BooleanToString[Request.Tipo.Saida],
      BooleanToString[Request.Tipo.MasterLiberou],
      Request.Tipo.FonteEntrada,
      BooleanToString[Request.Tipo.FuncaoLiberou],
      BooleanToString[Request.Tipo.AcessoNegado],
      Request.Tipo.TipoNegado,
      Request.IDControlador,
      Request.IDSensor
   ]);
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_INFORMATION_TYPE);

   S := Format(SRequestFmt, [
      FCurrDevice.IP,
      FCurrDevice.Port,
      Request.Matricula,
      FormatDateTime(SDateTimeToISOFmt, Request.DataHora),
      Request.Funcao,
      Request.Flag,
      BooleanToString[Request.Tipo.Saida],
      BooleanToString[Request.Tipo.MasterLiberou],
      Request.Tipo.FonteEntrada,
      BooleanToString[Request.Tipo.FuncaoLiberou],
      BooleanToString[Request.Tipo.AcessoNegado],
      Request.Tipo.TipoNegado,
      Request.IDControlador,
      Request.IDSensor
   ]);
   TTurnstileManager.Instance.SaveEvent(FCurrDevice, Request.Matricula,
      EventType, S);

   FCurrDevice.LastRequest := Request;

   case Request.Flag of
      sfrNaoGirou:
         begin
            case Request.Tipo.FonteEntrada of
               cfeTeclado:
                  EventType := 'leitura_teclado';
               cfeCracha:
                  EventType := 'leitura_barras';
               cfeDigital1N, cfeDigital11:
                  EventType := 'leitura_biometria';
               else
                  EventType := 'leitura_desconhecida';
            end;

            JSON := TTurnstileManager.Instance.GetAccessType(FCurrDevice,
               Request.Matricula);
            Response := ParseResponse(JSON);
            FCurrDevice.LastResponse := Response;
            SendResponse(Response);
         end;
      sfrGirou:
         begin
            case FCurrDevice.LastResponse.Acesso of
               canLibEntrada:
                  EventType := 'entrada_registrada';
               canLibSaida:
                  EventType := 'saida_registrada';
               canRevista:
                  EventType := 'saida_registrada';
               else
                  EventType := '';
            end;

            TTurnstileManager.Instance.RecordAccess(Request.Matricula,
               EventType, FCurrDevice);
         end;
      sfrDesistenciaAcesso:
         EventType := 'timeout';
      else
         EventType := '';
   end;

   LeaveCriticalSection(FLock);
end;

procedure TKernelManager.OnStatus(ASender: TObject; pThreadIndex, pDeviceID,
  pStatus: Integer);
begin
   EnterCriticalSection(FLock);

   if (pStatus = cdsOffline) and FCurrDevice.Active then
   begin
      LeaveCriticalSection(FLock);
      FCurrDevice.Active := False;
      Exit;
   end;

   if (pStatus = cdsOnline) and (not FCurrDevice.Active) then
   begin
      FCurrDevice.Active := True;
      Setup;
   end;

   LeaveCriticalSection(FLock);
end;

function TKernelManager.ParseResponse(const JSON: AnsiString): TKernelResponse;
var
   Response: TlkJSONobject;
   EventType: AnsiString;
begin
   Response := TlkJSON.ParseText(JSON) as TlkJSONobject;
   try
      Result.Acesso := Response.getInt('acesso');
      Result.Mensagem := Response.getString('mensagem');
      Result.Tempo := Response.getInt('tempo');
      Result.IDControlador := Response.getInt('id_controlador');
      Result.TempoRele1 := Response.getInt('tempo_rele1');
      Result.TempoRele2 := Response.getInt('tempo_rele2');
      Result.TempoRele3 := Response.getInt('tempo_rele3');
   finally
      Response.Free;
   end;

   case Result.Acesso of
      canNegado, canMensagem:
         EventType := 'bloqueio_duplo';
      canLibEntrada:
         EventType := 'entrada_liberada';
      canLibSaida, canRevista:
         EventType := 'saida_liberada';
      canAmbosLados:
         EventType := 'liberacao_dupla';
      else
         EventType := '';
   end;

   TTurnstileManager.Instance.SaveEvent(FCurrDevice,
      FCurrDevice.LastRequest.Matricula, EventType, JSON);
end;

procedure TKernelManager.SendResponse(Response: TKernelResponse);
var
   S: AnsiString;
begin
   EnterCriticalSection(FLock);
   
   S := 'TKernelManager.SendResponse: ' + Format(SEventResponseFmt, [
      FCurrDevice.IP,
      FCurrDevice.Port,
      Response.Acesso,
      Response.Mensagem,
      Response.Tempo,
      Response.IDControlador,
      Response.TempoRele1,
      Response.TempoRele2,
      Response.TempoRele3
   ]);
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_INFORMATION_TYPE);

   FKernel.RespostaOn(FCurrDevice.ThreadIndex, Response);
   CheckKernelError;
   CheckThreadError;
   LeaveCriticalSection(FLock);
end;

procedure TKernelManager.Setup;
var
   Settings: TDeviceSettings;
begin
   FCurrDevice.Active :=
      FKernel.RecebeConfiguracao[FCurrDevice.ThreadIndex, Settings];
   CheckKernelError;
   CheckThreadError;
   
   if not FCurrDevice.Active then
      Exit;

   FCurrDevice.ParseSettings(Settings);
   FCurrDevice.Active :=
      FKernel.EnviaConfiguracao[FCurrDevice.ThreadIndex, Settings];
   CheckKernelError;
   CheckThreadError;
end;

initialization
   Classes.RegisterClass(THenry7x);

finalization
   Classes.UnRegisterClass(THenry7x);

end.
