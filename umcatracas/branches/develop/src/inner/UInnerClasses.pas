unit UInnerClasses;

interface

uses
   Classes, SysUtils, Windows, DateUtils, StrUtils, uLkJSON, EasyInner_DLL,
   UMCatracasClasses;

type
   TInnerStatus = (
      isConnecting,
      isSendingOfflineSettings,
      isCollectingTickets,
      isSendingOnlineSettings,
      isSendingTimeStamp,
      isSendingDefaultMessage,
      isSettingInputMethod,
      isPolling,
      isReleasingTurnstile,
      isWatchingFlip,
      isOnlinePingging,
      isReconnecting,
      isWaitingMessageTimeout,
      isSettingKeyboard,
      isWaitingKeyboardSetting,
      isSendingBoxMessage,
      isWatchingBox,
      isSendingMessage,
      isSendingSchedules,
      isSendingOperationModeAutoChange,
      isSendingAccessDeniedMessage
   );

   TKeyboardStatus = (
      ksEmpty,
      ksWaiting
   );

   TDevicePosition = (
      dpLeft,
      dpRight
   );

   TCommandResult = Byte;

   TInnerNumber = 1..99;

   TConnectionKind = 0..2;

   TCard = array[0..15] of AnsiChar;

   TVersion = class
   private
      FMajor: Byte;
      FMinor: Byte;
      FRelease: Byte;
      FVariation: Byte;
   public
      property Major: Byte read FMajor write FMajor;
      property Minor: Byte read FMinor write FMinor;
      property Release: Byte read FRelease write FRelease;
      property Variation: Byte read FVariation write FVariation;
   end;

   TTicket = class
   private
      FCard: TCard;
      FKind: Byte;
      FComplement: Byte;
      FSource: Byte;
      FYear: Byte;
      FMonth: Byte;
      FDay: Byte;
      FHour: Byte;
      FMinute: Byte;
      FSecond: Byte;
   public
      constructor Create;
      property Card: TCard read FCard write FCard;
      property Kind: Byte read FKind write FKind;
      property Complement: Byte read FComplement write FComplement;
      property Source: Byte read FSource write FSource;
      property Year: Byte read FYear write FYear;
      property Month: Byte read FMonth write FMonth;
      property Day: Byte read FDay write FDay;
      property Hour: Byte read FHour write FHour;
      property Minute: Byte read FMinute write FMinute;
      property Second: Byte read FSecond write FSecond;
   end;

   TTicketList = class(TList)
   protected
      function GetItem(Index: Integer): TTicket;
      procedure SetItem(Index: Integer; Ticket: TTicket);
   public
      constructor Create;
      function Add(Ticket: TTicket): Integer;
      function Extract(Item: TTicket): TTicket;
      function Remove(Ticket: TTicket): Integer;
      function IndexOf(Ticket: TTicket): Integer;
      procedure Insert(Index: Integer; Ticket: TTicket);
      function First: TTicket;
      function Last: TTicket;
      property Items[Index: Integer]: TTicket read GetItem write SetItem; default;
   end;

   TInner = class(TCustomTurnstile)
   private
      FNumber: TInnerNumber;
      FDevicePosition: TDevicePosition;
      FProductLine: Byte;
      FBioModel: Byte;
      FVersion: TVersion;
      FBioVersion: TVersion;
      FCountCollect: Cardinal;
      FCountKeyTries: Cardinal;
      FCountTries: Cardinal;
      FLastPing: Cardinal;
      FMessageTime: Cardinal;
      FStatus: TInnerStatus;
      FPingStatus: TInnerStatus;
      FKeyboardStatus: TKeyboardStatus;
      FTickets: TTicketList;
      FSettings: TlkJSONobject;
      FLastResponse: TlkJSONobject;
      function TestConnection: Byte;
      procedure GetOfflineTickets;
      procedure GetTickets;
      procedure ParseSettings;
      procedure Connect;
      procedure SendOfflineSettings;
      procedure CollectTickets;
      procedure SendOnlineSettings;
      procedure SendTimeStamp;
      procedure SendDefaultMessage;
      procedure SetInputMethod;
      procedure Poll;
      procedure ReleaseTurnstile;
      procedure WatchFlip;
      procedure OnlinePing;
      procedure Reconnect;
      procedure WaitMessageTimeout;
      procedure SetKeyboard;
      procedure WaitKeyboardSetting;
      procedure SendBoxMessage;
      procedure WatchBox;
      procedure SendMessage;
      procedure SendSchedules;
      procedure SendOperationModeAutoChange;
      procedure SendAccessDeniedMessage;
      procedure SetVersion;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Execute;
      procedure Initialize(const Settings: AnsiString); override;
      procedure UnInitialize; override;
      procedure SendResponse(const Info: AnsiString);
   end;

   TInnerList = class(TList)
   protected
      function GetItem(Index: Integer): TInner;
      procedure SetItem(Index: Integer; Inner: TInner);
   public
      constructor Create;
      function Add(Inner: TInner): Integer;
      function Extract(Item: TInner): TInner;
      function Remove(Inner: TInner): Integer;
      function IndexOf(Inner: TInner): Integer;
      procedure Insert(Index: Integer; Inner: TInner);
      function First: TInner;
      function Last: TInner;
      property Items[Index: Integer]: TInner read GetItem write SetItem; default;
   end;

   TInnerThread = class(TThread)
   private
      FConnectionKind: Byte;
      FPort: Word;
      FCardPattern: Byte;
      FEventCount: Cardinal;
      FInners: TInnerList;
      class function GetInstance: TInnerThread; static;
      class var FInstance: TInnerThread;
      constructor Create;
   public
      class property Instance: TInnerThread read GetInstance;
      destructor Destroy; override;
      procedure Add(Inner: TInner);
      procedure Execute; override;
      property ConnectionKind: Byte read FConnectionKind write FConnectionKind;
      property Port: Word read FPort write FPort;
      property CardPattern: Byte read FCardPattern write FCardPattern;
   end;

implementation

{$I consts.inc}

{ TInner }

procedure TInner.CollectTickets;
begin
   if FProductLine = 14 then
   begin
      GetOfflineTickets;
      Exit;
   end;

   if FCountCollect > 3 then
   begin
      GetTickets;
      Exit;
   end;

   FStatus := isSendingOnlineSettings;
end;

procedure TInner.Connect;
var
   Elapsed: Cardinal;
   CR: TCommandResult;
   S: AnsiString;
begin
   try
      S := 'TInner.Connect(1): ' + Format(SEventTryingConnFmt, [FNumber]);
      TTurnstileManager.Instance.LogMessage(S,
         EVENTLOG_INFORMATION_TYPE);

      Elapsed := GetTickCount - FLastPing;

      if Elapsed < 2 then
         Exit;

      FLastPing := GetTickCount;

      CR := TestConnection;

      if CR = 0 then
      begin
         SetVersion;
         FCountTries := 0;
         FStatus := isSendingOfflineSettings;         
         S := 'TInner.Connect(2): ' + Format(SEventSuccessConnFmt, [FNumber]);
         TTurnstileManager.Instance.LogMessage(S,
            EVENTLOG_INFORMATION_TYPE);
         Exit;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);
      
   except
      FStatus := isConnecting;
   end;
end;

constructor TInner.Create;
begin
   FDevicePosition := dpLeft;
   FProductLine := 0;
   FBioModel := 0;
   FVersion := TVersion.Create;
   FBioVersion := TVersion.Create;
   FCountCollect := 0;
   FCountKeyTries := 0;
   FCountTries := 0;
   FMessageTime := GetTickCount;
   FStatus := isConnecting;
   FPingStatus := isConnecting;
   FKeyboardStatus := ksEmpty;
   FTickets := TTicketList.Create;
   TInnerThread.Instance.Add(Self);
end;

destructor TInner.Destroy;
var
   I: Integer;
begin
   for I := FTickets.Count - 1 downto 0 do
      FTickets.Extract(FTickets[I]).Free;
   FTickets.Free;
   inherited;
end;

procedure TInner.Execute;
begin
   case FStatus of
      isConnecting: Connect;
      isSendingOfflineSettings: SendOfflineSettings;
      isCollectingTickets: CollectTickets;
      isSendingOnlineSettings: SendOnlineSettings;
      isSendingTimeStamp: SendTimeStamp;
      isSendingDefaultMessage: SendDefaultMessage;
      isSettingInputMethod: SetInputMethod;
      isPolling: Poll;
      isReleasingTurnstile: ReleaseTurnstile;
      isWatchingFlip: WatchFlip;
      isOnlinePingging: OnlinePing;
      isReconnecting: Reconnect;
      isWaitingMessageTimeout: WaitMessageTimeout;
      isSettingKeyboard: SetKeyboard;
      isWaitingKeyboardSetting: WaitKeyboardSetting;
      isSendingBoxMessage: SendBoxMessage;
      isWatchingBox: WatchBox;
      isSendingMessage: SendMessage;
      isSendingSchedules: SendSchedules;
      isSendingOperationModeAutoChange: SendOperationModeAutoChange;
      isSendingAccessDeniedMessage: SendAccessDeniedMessage;
   end;
end;

procedure TInner.GetOfflineTickets;
var
   CR: TCommandResult;
   TicketCount: Cardinal;
   Ticket: TTicket;
begin
   CR := ReceberQuantidadeBilhetes(FNumber, @TicketCount);
   Inc(FCountCollect);

   while (CR = 0) and (TicketCount > 0) do
   begin

      repeat
         Ticket := TTicket.Create;

         CR := ColetarBilhete(FNumber, @Ticket.Kind, @Ticket.Day, @Ticket.Month,
            @Ticket.Year, @Ticket.Hour, @Ticket.Minute, @Ticket.Card);

         if CR = 0 then
            FTickets.Add(Ticket);

         Dec(TicketCount);
         
      until TicketCount = 0;

      CR := ReceberQuantidadeBilhetes(FNumber, @TicketCount)
   end;

   FStatus := isSendingOnlineSettings;
end;

procedure TInner.GetTickets;
var
   CR: TCommandResult;
   Timeout: Cardinal;
   Ticket: TTicket;
begin
   repeat
      Timeout := GetTickCount + 200;

      Ticket := TTicket.Create;
      
      CR := ColetarBilhete(FNumber, @Ticket.Kind, @Ticket.Day, @Ticket.Month,
         @Ticket.Year, @Ticket.Hour, @Ticket.Minute, @Ticket.Card);

      if CR = 0 then
         FTickets.Add(Ticket);
         
   until GetTickCount > Timeout;

   Inc(FCountCollect);
end;

procedure TInner.Initialize(const Settings: AnsiString);
var
   GlobalSettings: TlkJSONobject;
begin
   FSettings := TlkJSON.ParseText(Settings) as TlkJSONobject;
   FNumber := FSettings.getInt('id');
   FDevicePosition := TDevicePosition(FSettings.getInt('position'));
   
   GlobalSettings := FSettings.Field['global'] as TlkJSONobject;
   TInnerThread.Instance.ConnectionKind := GlobalSettings.getInt('conn_type');
   TInnerThread.Instance.Port := GlobalSettings.getInt('port');
   TInnerThread.Instance.CardPattern := GlobalSettings.getInt('card_pattern');
end;

procedure TInner.OnlinePing;
var
   CR: TCommandResult;
begin
   try
      CR := PingOnLine(FNumber);

      if CR = 0 then
      begin
         FStatus := FPingStatus;
         FLastPing := GetTickCount;
         Exit;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);
      FLastPing := GetTickCount;
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.ParseSettings;
var
   InnerSettings: TlkJSONlist;
   I: Integer;
begin
   InnerSettings := FSettings.Field['inner'] as TlkJSONlist;

   for I := 0 to InnerSettings.Count - 1 do
   begin
      TEasyInner.Instance.Call(InnerSettings.Child[I] as TlkJSONobject);
   end;
end;

procedure TInner.Poll;
var
   CR: TCommandResult;
   Ticket: TTicket;
   S: AnsiString;
   Elapsed: Cardinal;
begin
   try
      Ticket := TTicket.Create;
      CR := ReceberDadosOnLine(FNumber, @Ticket.Source, @Ticket.Complement,
         @Ticket.Card, @Ticket.Day, @Ticket.Month, @Ticket.Year, @Ticket.Hour,
         @Ticket.Minute, @Ticket.Second);

      FTickets.Add(Ticket);

      if CR <> 0 then
      begin
         Elapsed := GetTickCount - FLastPing;

         if Elapsed >= 3000 then
         begin
            FPingStatus := FStatus;
            FCountTries := 0;
            FLastPing := GetTickCount;
            FStatus := isOnlinePingging;
         end;

         Exit;
      end;

      S := 'TInner.Poll: ' + Format(SEventCardReadFmt, [FNumber, Ticket.Card]);
      TTurnstileManager.Instance.LogMessage(S,
         EVENTLOG_INFORMATION_TYPE);

      S := Format(SJsonInfoFmt, [
         Ticket.Source,
         Ticket.Complement,
         Ticket.Card,
         Ticket.Day,
         Ticket.Month,
         Ticket.Year,
         Ticket.Hour,
         Ticket.Minute,
         Ticket.Second
      ]);
      TTurnstileManager.Instance.SaveEvent(Self, Ticket.Card, 'leitura_barras',
         S);

      if (Ticket.Complement in [5, 6, 42, 65]) or
         ((Ticket.Card = '') and (FKeyboardStatus <> ksWaiting)) then
      begin
         FCountTries := 0;
         FStatus := isSendingDefaultMessage;
         Exit;
      end;

      S := TTurnstileManager.Instance.GetAccessType(Self, Ticket.Card);
      SendResponse(S);
         
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.Reconnect;
var
   CR: TCommandResult;
   Elapsed: Cardinal;
begin
   try
      Elapsed := GetTickCount - FLastPing;

      if Elapsed < 10000 then
         Exit;

      FLastPing := GetTickCount;

      CR := TestConnection;

      if CR = 0 then
      begin
         FCountTries := 0;
         FStatus := isSendingOfflineSettings;
         Exit;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);
      
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.ReleaseTurnstile;
var
   CR: TCommandResult;
   S: AnsiString;
begin
   try
      CR := 128;

      EnviarMensagemPadraoOnLine(FNumber,
         FLastResponse.getInt('mostrar_data'),
         FLastResponse.getString('mensagem'));

      S := FLastResponse.getString('acesso');
      TTurnstileManager.Instance.LogMessage('TInner.ReleaseTurnstile: ' + S, EVENTLOG_INFORMATION_TYPE);      

      if S = 'entrada' then
         CR := LiberarCatracaEntrada(FNumber);

      if S = 'entrada_invertida' then
         CR := LiberarCatracaEntradaInvertida(FNumber);

      if S = 'saida' then
         CR := LiberarCatracaSaida(FNumber);

      if S = 'saida_invertida' then
         CR := LiberarCatracaSaidaInvertida(FNumber);

      if S = 'liberacao_dupla' then
         CR := LiberarCatracaDoisSentidos(FNumber);

      S := 'TInner.ReleaseTurnstile: ' + Format(SEventReleaseFmt, [FNumber, S]);
      TTurnstileManager.Instance.LogMessage(S,
         EVENTLOG_INFORMATION_TYPE);
      TTurnstileManager.Instance.LogMessage('TInner.ReleaseTurnstile CR: ' + IntToStr(CR), EVENTLOG_INFORMATION_TYPE);

      if CR = 0 then
      begin
         AcionarBipCurto(FNumber);
         FCountTries := 0;
         FLastPing := GetTickCount;
         FStatus := isWatchingFlip;
         Exit;
      end;

      if FCountTries > 2 then
      begin
         FCountTries := 0;
         FStatus := isReconnecting;
      end;

      Inc(FCountTries);
      
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.SendAccessDeniedMessage;
var
   CR: TCommandResult;
   S: AnsiString;
begin
   CR := EnviarMensagemPadraoOnLine(FNumber,
      FLastResponse.getInt('mostrar_data'),
      FLastResponse.getString('mensagem'));

   S := 'TInner.SendAccessDeniedMessage: ' + Format(SEventAccessDeniedFmt, [FNumber, FTickets.Last.Card]);
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_INFORMATION_TYPE);

   S := Format(SJsonInfoFmt, [
      FTickets.Last.Source,
      FTickets.Last.Complement,
      FTickets.Last.Card,
      FTickets.Last.Day,
      FTickets.Last.Month,
      FTickets.Last.Year,
      FTickets.Last.Hour,
      FTickets.Last.Minute,
      FTickets.Last.Second
   ]);

   S := 'TInner S: ' + S;
   TTurnstileManager.Instance.LogMessage(S, EVENTLOG_INFORMATION_TYPE);

   TTurnstileManager.Instance.SaveEvent(Self, FTickets.Last.Card,
      FLastResponse.getString('evento'), S);

   if CR = 0 then
   begin
      AcionarBipLongo(FNumber);
      if FProductLine = 14 then
         LigarLedVermelho(FNumber);
      FMessageTime := GetTickCount;
      FCountTries := 0;
      FStatus := isWaitingMessageTimeout;
      Exit;
   end;

   if FCountTries > 3 then
      FStatus := isReconnecting;

   Inc(FCountTries);
end;

procedure TInner.SendBoxMessage;
var
   CR: TCommandResult;
begin
   TTurnstileManager.Instance.LogMessage('TInner.SendBoxMessage', EVENTLOG_INFORMATION_TYPE);
   CR := EnviarMensagemPadraoOnLine(FNumber, 0, 'DEPOSITE O CARTAO');

   if CR = 0 then
   begin
      AcionarRele2(FNumber);
      FCountTries := 0;
      FStatus := isWatchingBox;
      Exit;
   end;

   if FCountTries > 2 then
      FStatus := isReconnecting;

   Inc(FCountTries);
end;

procedure TInner.SendDefaultMessage;
var
   CR: TCommandResult;
begin
   try
      TTurnstileManager.Instance.LogMessage('TInner.SendDefaultMessage', EVENTLOG_INFORMATION_TYPE);
      CR := EnviarMensagemPadraoOnLine(FNumber, 1, 'UNIMESTRE :)');

      if CR = 0 then
      begin
         FCountTries := 0;
         FStatus := isSettingInputMethod;
         Exit;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);

   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.SendMessage;
var
   CR: TCommandResult;
begin
   TTurnstileManager.Instance.LogMessage('TInner.SendMessage', EVENTLOG_INFORMATION_TYPE);
   DefinirMensagemEntradaOffLine(1, 'Acesso liberado');
   DefinirMensagemSaidaOffLine(1, 'Acesso liberado');
   DefinirMensagemPadraoOffLine(1, 'UNIMESTRE :(');
   
   CR := EnviarMensagensOffLine(FNumber);

   if CR = 0 then
   begin
      FCountTries := 0;
      FStatus := isSendingOperationModeAutoChange;
      Exit;      
   end;

   if FCountTries > 2 then
      FStatus := isReconnecting;

   Inc(FCountTries);
end;

procedure TInner.SendOfflineSettings;
var
   CR: TCommandResult;
begin
   try
      TTurnstileManager.Instance.LogMessage('TInner.SendOfflineSettings', EVENTLOG_INFORMATION_TYPE);
      ParseSettings;

      CR := EnviarConfiguracoes(FNumber);

      if CR = 0 then
      begin
         FCountTries := 0;
         FStatus := isSendingMessage;
         Exit;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);
      
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.SendOnlineSettings;
var
   CR: TCommandResult;
begin
   try
      TTurnstileManager.Instance.LogMessage('TInner.SendOnlineSettings', EVENTLOG_INFORMATION_TYPE);
      ParseSettings;

      CR := EnviarConfiguracoes(FNumber);

      if CR = 0 then
      begin
         FCountTries := 0;
         FStatus := isSendingTimeStamp;
         Exit;
      end;

      if FCountTries >2 then
         FStatus := isReconnecting;

      Inc(FCountTries);

   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.SendOperationModeAutoChange;
var
   CR: TCommandResult;
begin
   ParseSettings;

   CR := EnviarConfiguracoesMudancaAutomaticaOnLineOffLine(FNumber);

   if CR = 0 then
   begin
      FCountTries := 0;
      FCountCollect := 0;
      FStatus := isCollectingTickets;
      Exit;
   end;

   if FCountTries > 2 then
      FStatus := isReconnecting;

   Inc(FCountTries);
end;

procedure TInner.SendResponse(const Info: AnsiString);
begin
   FStatus := isSendingAccessDeniedMessage;

   if Assigned(FLastResponse) then
      FLastResponse.Free;

   FLastResponse := TlkJSON.ParseText(Info) as TlkJSONobject;
   TTurnstileManager.Instance.LogMessage('TInner.SendResponse', EVENTLOG_INFORMATION_TYPE);
   
   if FLastResponse.getBoolean('liberar') then
      FStatus := isReleasingTurnstile;
end;

procedure TInner.SendSchedules;
begin
   FCountTries := 0;
   FStatus := isSendingMessage;
end;

procedure TInner.SendTimeStamp;
var
   CR: TCommandResult;
   Year, Month, Day, Hour, Minute, Second, MilliSecond: Word;
begin
   try
      DecodeDateTime(Now, Year, Month, Day, Hour, Minute, Second, MilliSecond);
      CR := EnviarRelogio(FNumber, Day, Month, Year, Hour, Minute, Second);

      if CR = 0 then
      begin
         FCountTries := 0;
         FStatus := isSendingDefaultMessage;
         Exit;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);
      
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.SetInputMethod;
var
   InputSettings: TlkJSONobject;
   CR: TCommandResult;
begin
   try
      if FSettings.Field['input'] is TlkJSONobject then
      begin
         InputSettings := FSettings.Field['input'] as TlkJSONobject;

         CR := EnviarFormasEntradasOnLine(
            FNumber,
            InputSettings.getInt('card_length'),
            InputSettings.getInt('echo'),
            InputSettings.getInt('method'),
            InputSettings.getInt('timeout'),
            InputSettings.getInt('cursor_pos')
         );   

         if CR = 0 then
         begin
            FLastPing := GetTickCount;
            FCountTries := 0;
            FStatus := isPolling;
            Exit;
         end;
      end;

      if FCountTries > 2 then
         FStatus := isReconnecting;

      Inc(FCountTries);
      
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.SetKeyboard;
var
   CR: TCommandResult;
begin
   CR := EnviarMensagemPadraoOnLine(FNumber, 0, 'Entrar ou sair?');

   if CR = 0 then
   begin
      FCountKeyTries := 0;
      FKeyboardStatus := ksWaiting;
      FStatus := isWaitingKeyboardSetting;
      Exit;
   end;

   Inc(FCountKeyTries);

   if FCountKeyTries > 3 then
      FStatus := isConnecting;
end;

procedure TInner.SetVersion;
var
   CR: TCommandResult;
   BioSupport: Byte;
begin
   CR := ReceberVersaoFirmware(FNumber, @FProductLine, @FVersion.Variation,
      @FVersion.Major, @FVersion.Minor, @FVersion.Release, @BioSupport);

   if CR = 0 then
   begin
      if (FProductLine = 6) or (BioSupport = 1) then
      begin
         CR := SolicitarModeloBio(FNumber);

         if CR = 0 then
         begin
            repeat
               Sleep(1);
               CR := ReceberModeloBio(FNumber, 0, @FBioModel);
            until CR <> 128;
         end;

         CR := SolicitarVersaoBio(FNumber);

         if CR = 0 then
         begin
            repeat
               Sleep(1);
               CR := ReceberVersaoBio(FNumber, 0, @FBioVersion.Major,
                  @FBioVersion.Minor);
            until CR <> 128;
         end;
      end;
   end;
end;

function TInner.TestConnection: Byte;
var
   Year, Month, Day, Hour, Minute, Second: Byte;
begin
   Year := 0;
   Month := 0;
   Day := 0;
   Hour := 0;
   Minute := 0;
   Second := 0;
   Result := ReceberRelogio(FNumber, @Day, @Month, @Year, @Hour, @Minute, @Second);
end;

procedure TInner.UnInitialize;
begin
   inherited;
end;

procedure TInner.WaitKeyboardSetting;
var
   Ticket: TTicket;
   CR: TCommandResult;
   Info, S: AnsiString;
   Elapsed: Cardinal;
begin
   try
      Ticket := TTicket.Create;
      FTickets.Add(Ticket);

      CR := ReceberDadosOnLine(FNumber, @Ticket.Source, @Ticket.Complement,
         @Ticket.Card, @Ticket.Day, @Ticket.Month, @Ticket.Year, @Ticket.Hour,
         @Ticket.Minute, @Ticket.Second);

      if CR = 0 then
      begin

         if Ticket.Complement = 42 then
         begin
            FCountTries := 0;
            FStatus := isSendingDefaultMessage;
            Exit;
         end;

         if Ticket.Complement = 65 then
         begin
            FStatus := isWaitingKeyboardSetting;
            Exit;
         end;

         if Ticket.Complement in [35, 66, 67] then
         begin
            FStatus := isSendingAccessDeniedMessage;

            S := 'TInner.WaitKeyboardSetting: ' + Format(SJsonInfoFmt, [
               Ticket.Source,
               Ticket.Complement,
               Ticket.Card,
               Ticket.Day,
               Ticket.Month,
               Ticket.Year,
               Ticket.Hour,
               Ticket.Minute,
               Ticket.Second
            ]);
            TTurnstileManager.Instance.SaveEvent(Self, Ticket.Card,
               'leitura_teclado', S);
            TTurnstileManager.Instance.LogMessage(S,
               EVENTLOG_INFORMATION_TYPE);

            Info := TTurnstileManager.Instance.GetAccessType(Self, Ticket.Card);

            if Assigned(FLastResponse) then
               FLastResponse.Free;
               
            FLastResponse := TlkJSON.ParseText(Info) as TlkJSONobject;

            if FLastResponse.getBoolean('liberar') then
            begin            
               S := FLastResponse.getString('acesso');

               if (S = 'liberacao_dupla') or
                  (Ticket.Complement = 35) or
                  (AnsiStartsText('entrada', S) and (Ticket.Complement = 66)) or
                  (AnsiStartsText('saida', S) and (Ticket.Complement = 67)) then
               begin
                  FStatus := isReleasingTurnstile;
                  Exit;
               end;
            end;
         end;

         FKeyboardStatus := ksEmpty;
         Exit;

      end;

      Elapsed := GetTickCount - FLastPing;

      if Elapsed >= 3000 then
      begin
         FPingStatus := FStatus;
         FCountTries := 0;
         FLastPing := GetTickCount;
         FStatus := isOnlinePingging;
      end;
      
   except
      FStatus := isConnecting;
   end;
end;

procedure TInner.WaitMessageTimeout;
var
   Elapsed: Cardinal;
begin
   Elapsed := GetTickCount - FMessageTime;
   
   if Elapsed >= 2000 then
      FStatus := isSendingDefaultMessage;
end;

procedure TInner.WatchBox;
begin
   FPingStatus := FStatus;
   FCountTries := 0;
   FLastPing := GetTickCount;
   FStatus := isOnlinePingging; 
end;

procedure TInner.WatchFlip;
var
   Ticket: TTicket;
   CR: TCommandResult;
   EventType, S: AnsiString;
   Elapsed: Cardinal;
begin
   try
      Ticket := TTicket.Create;
      FTickets.Add(Ticket);
      
      CR := ReceberDadosOnLine(FNumber, @Ticket.Source, @Ticket.Complement,
         @Ticket.Card, @Ticket.Day, @Ticket.Month, @Ticket.Year, @Ticket.Hour,
         @Ticket.Minute, @Ticket.Second);

      if CR = 0 then
      begin
      
         if Ticket.Source = 5 then
         begin
            EventType := 'timeout';
            S := 'TInner.WatchFlip(1): ' + Format(SEventTimeoutFmt, [FNumber]);
            TTurnstileManager.Instance.LogMessage(S,
               EVENTLOG_INFORMATION_TYPE);
         end;
            
         if Ticket.Source = 6 then
         begin
            S := 'TInner.WatchFlip(2): ' + Format(SEventTurnedFmt, [FNumber, 'in']);
            EventType := 'entrada_registrada';

            if ((FDevicePosition = dpRight) and (Ticket.Complement = 1)) or
               ((FDevicePosition = dpLeft) and (Ticket.Complement <> 1)) then
            begin
               S := 'TInner.WatchFlip(3): ' + Format(SEventTurnedFmt, [FNumber, 'out']);
               EventType := 'saida_registrada';
            end;

            TTurnstileManager.Instance.LogMessage(S,
               EVENTLOG_INFORMATION_TYPE);
         end;

         S := 'TInner.WatchFlip(4): ' + Format(SJsonInfoFmt, [
            Ticket.Source,
            Ticket.Complement,
            Ticket.Card,
            Ticket.Day,
            Ticket.Month,
            Ticket.Year,
            Ticket.Hour,
            Ticket.Minute,
            Ticket.Second
         ]);

         TTurnstileManager.Instance.RecordAccess(Ticket.Card, EventType, Self);
         TTurnstileManager.Instance.SaveEvent(Self, Ticket.Card, EventType, S);

         FStatus := isSendingDefaultMessage;
         Exit;
      end;

      Elapsed := GetTickCount - FLastPing;

      if Elapsed >= 3000 then
      begin
         FPingStatus := FStatus;
         FCountTries := 0;
         FLastPing := GetTickCount;
         FStatus := isOnlinePingging;
      end;

   except
      FStatus := isConnecting;
   end;
end;

{ TTicket }

constructor TTicket.Create;
begin
   FCard := '';
   FKind := 0;
   FComplement := 0;
   FSource := 0;
   FYear := 0;
   FMonth := 0;
   FDay := 0;
   FHour := 0;
   FMinute := 0;
   FSecond := 0;
end;

{ TTicketList }

function TTicketList.Add(Ticket: TTicket): Integer;
begin
   Result := inherited Add(Ticket);
end;

constructor TTicketList.Create;
begin
   inherited Create;
end;

function TTicketList.Extract(Item: TTicket): TTicket;
begin
   Result := TTicket(inherited Extract(Item));
end;

function TTicketList.First: TTicket;
begin
   Result := TTicket(inherited First);
end;

function TTicketList.GetItem(Index: Integer): TTicket;
begin
   Result := TTicket(inherited Items[Index]);
end;

function TTicketList.IndexOf(Ticket: TTicket): Integer;
begin
   Result := inherited IndexOf(Ticket);
end;

procedure TTicketList.Insert(Index: Integer; Ticket: TTicket);
begin
   inherited Insert(Index, Ticket);
end;

function TTicketList.Last: TTicket;
begin
   Result := TTicket(inherited Last);
end;

function TTicketList.Remove(Ticket: TTicket): Integer;
begin
   Result := inherited Remove(Ticket);
end;

procedure TTicketList.SetItem(Index: Integer; Ticket: TTicket);
begin
   inherited Items[Index] := Ticket;
end;

{ TInnerThread }

procedure TInnerThread.Add(Inner: TInner);
begin
   FInners.Add(Inner);
end;

constructor TInnerThread.Create;
begin
   inherited Create(False);
   FInners := TInnerList.Create;
   FEventCount := 0;
end;

destructor TInnerThread.Destroy;
var
   I: Integer;
begin
   for I := FInners.Count - 1 downto 0 do
      FInners.Extract(FInners[I]).Free;
   FInners.Free;
   inherited;
end;

procedure TInnerThread.Execute;
var
   CR: TCommandResult;
   I: Integer;
   S: AnsiString;
begin
   CR := DefinirTipoConexao(FConnectionKind);

   if CR <> 0 then
   begin
      S := 'TInnerThread.Execute(1): ' + Format(SEventErrSettingConnectionTypeFmt, [FPort, CR]);
      TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      Suspend;
   end;

   CR := DefinirPadraoCartao(FCardPattern);

   if CR <> 0 then
   begin
      S := 'TInnerThread.Execute(2): ' + Format(SEventErrSettingCardPatternFmt, [FPort, CR]);
      TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      Suspend;
   end;

   FecharPortaComunicacao;
   
   CR := AbrirPortaComunicacao(FPort);

   if CR <> 0 then
   begin
      S := 'TInnerThread.Execute(3): ' + Format(SEventErrOpeningPortFmt, [FPort, CR]);
      TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      Suspend;
   end;

   while True do
   begin
      for I := 0 to FInners.Count - 1 do
      begin
         FInners[I].Execute;

         if Terminated then
         begin
            FecharPortaComunicacao;
            Suspend;
         end;

         Inc(FEventCount);

         if FEventCount > 10 then
         begin
            FEventCount := 0;
            Sleep(1);
         end;
         
      end;
   end;
end;

class function TInnerThread.GetInstance: TInnerThread;
begin
   if not Assigned(TInnerThread.FInstance) then
      TInnerThread.FInstance := TInnerThread.Create;
   Result := TInnerThread.FInstance;
end;

{ TInnerList }

function TInnerList.Add(Inner: TInner): Integer;
begin
   Result := inherited Add(Inner);
end;

constructor TInnerList.Create;
begin
   inherited Create;
end;

function TInnerList.Extract(Item: TInner): TInner;
begin
   Result := TInner(inherited Extract(Item));
end;

function TInnerList.First: TInner;
begin
   Result := TInner(inherited First);
end;

function TInnerList.GetItem(Index: Integer): TInner;
begin
   Result := TInner(inherited Items[Index]);
end;

function TInnerList.IndexOf(Inner: TInner): Integer;
begin
   Result := inherited IndexOf(Inner);
end;

procedure TInnerList.Insert(Index: Integer; Inner: TInner);
begin
   inherited Insert(Index, Inner);
end;

function TInnerList.Last: TInner;
begin
   Result := TInner(inherited Last);
end;

function TInnerList.Remove(Inner: TInner): Integer;
begin
   Result := inherited Remove(Inner);
end;

procedure TInnerList.SetItem(Index: Integer; Inner: TInner);
begin
   inherited Items[Index] := Inner;
end;

end.
