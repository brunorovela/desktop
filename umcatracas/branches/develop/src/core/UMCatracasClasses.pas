unit UMCatracasClasses;

interface

uses
   Classes, Windows, SysUtils, SvcMgr, ZDbcIntfs, ScktComp, StdCtrls;

type
   ITurnstile = interface
   ['{082415BF-F3D8-4267-9802-478799A69F91}']
      function GetActive: Boolean;
      function GetID: Word;
      function GetIP: AnsiString;
      function GetMacAddress: AnsiString;
      function GetName: AnsiString;
      function GetPort: Word;
      procedure SetActive(const Value: Boolean);
      procedure SetID(const Value: Word);
      procedure SetIP(const Value: AnsiString);
      procedure SetMacAddress(const Value: AnsiString);
      procedure SetName(const Value: AnsiString);
      procedure SetPort(const Value: Word);
      procedure Initialize(const Settings: AnsiString);
      procedure UnInitialize;
      property Active: Boolean read GetActive write SetActive;
      property ID: Word read GetID write SetID;
      property IP: AnsiString read GetIP write SetIP;
      property MacAddress: AnsiString read GetMacAddress write SetMacAddress;
      property Name: AnsiString read GetName write SetName;
      property Port: Word read GetPort write SetPort;
   end;

   TCustomTurnstile = class(TInterfacedPersistent, ITurnstile)
   private
      FActive: Boolean;
      FID: Word;
      FIP: AnsiString;
      FMacAddress: AnsiString;
      FName: AnsiString;
      FPort: Word;
      function GetActive: Boolean;
      function GetID: Word;
      function GetIP: AnsiString;
      function GetMacAddress: AnsiString;
      function GetName: AnsiString;
      function GetPort: Word;
      procedure SetActive(const Value: Boolean);
      procedure SetID(const Value: Word);
      procedure SetIP(const Value: AnsiString);
      procedure SetMacAddress(const Value: AnsiString);
      procedure SetName(const Value: AnsiString);
      procedure SetPort(const Value: Word);
   public
      procedure Initialize(const Settings: AnsiString); virtual; abstract;
      procedure UnInitialize; virtual; abstract;
      property Active: Boolean read GetActive write SetActive;
      property ID: Word read GetID write SetID;
      property IP: AnsiString read GetIP write SetIP;
      property MacAddress: AnsiString read GetMacAddress write SetMacAddress;
      property Name: AnsiString read GetName write SetName;
      property Port: Word read GetPort write SetPort;
   end;

   TCustomTurnstileClass = class of TCustomTurnstile;

   TTurnstileList = class(TInterfaceList)
   protected
      function Get(Index: Integer): ITurnstile;
      procedure Put(Index: Integer; const Item: ITurnstile);
   public
      function First: ITurnstile;
      function IndexOf(const Item: ITurnstile): Integer;
      function Add(const Item: ITurnstile): Integer;
      procedure Insert(Index: Integer; const Item: ITurnstile);
      function Last: ITurnstile;
      function Remove(const Item: ITurnstile): Integer;
      property Items[Index: Integer]: ITurnstile read Get write Put; default;
   end;

   TTurnstileManager = class(TPersistent)
   private
      FConnection: IZConnection;
      FTurnstiles: TTurnstileList;
      FService: TService;
      FMemoLogs: TMemo;
      FGerarLogs: Boolean;
      class function GetInstance: TTurnstileManager; static;
      class var FInstance: TTurnstileManager;
      constructor Create;
      function FindClass(const AClassName: AnsiString): ITurnstile;
      procedure CheckConnection;
      procedure Load;
      procedure Unload;
   public
      class property Instance: TTurnstileManager read GetInstance;
      destructor Destroy; override;
      function GetAccessType(const Turnstile: ITurnstile; const ID: AnsiString): AnsiString;
      procedure RecordAccess(const ID, EventType: AnsiString; const Turnstile: ITurnstile);
      procedure SaveEvent(const Turnstile: ITurnstile; const ID, EventType, Info: AnsiString);
      procedure Start(const Connection: IZConnection; const AService: TService); overload;
      procedure Start(const Connection: IZConnection; aMemoLogs: TMemo; aGerarLogs: Boolean); overload;
      procedure Stop;
      procedure OnError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
      procedure LogMessage(Message: String; EventType: DWord = 1; Category: Integer = 0; ID: Integer = 0);
      function GetServiceExecutablePath(strMachine: string; strServiceName: string): String;      

      property Service: TService read FService;
   end;

   TTurnstileManagerClass = class of TTurnstileManager;

implementation

uses
   ShellAPI,
   WinSvc;

{$I consts.inc}

{ TTurnstileList }

function TTurnstileList.Add(const Item: ITurnstile): Integer;
begin
   Result := inherited Add(Item);
end;

function TTurnstileList.First: ITurnstile;
begin
   Result := inherited First as ITurnstile;
end;

function TTurnstileList.Get(Index: Integer): ITurnstile;
begin
   Result := inherited Items[Index] as ITurnstile;
end;

function TTurnstileList.IndexOf(const Item: ITurnstile): Integer;
begin
   Result := inherited IndexOf(Item);
end;

procedure TTurnstileList.Insert(Index: Integer; const Item: ITurnstile);
begin
   inherited Insert(Index, Item);
end;

function TTurnstileList.Last: ITurnstile;
begin
   Result := inherited Last as ITurnstile;
end;

procedure TTurnstileList.Put(Index: Integer; const Item: ITurnstile);
begin
   inherited Put(Index, Item);
end;

function TTurnstileList.Remove(const Item: ITurnstile): Integer;
begin
   Result := inherited Remove(Item);
end;

{ TCustomTurnstile }

function TCustomTurnstile.GetActive: Boolean;
begin
   Result := FActive;
end;

function TCustomTurnstile.GetID: Word;
begin
   Result := FID;
end;

function TCustomTurnstile.GetIP: AnsiString;
begin
   Result := FIP;
end;

function TCustomTurnstile.GetMacAddress: AnsiString;
begin
   Result := FMacAddress;
end;

function TCustomTurnstile.GetName: AnsiString;
begin
   Result := FName;
end;

function TCustomTurnstile.GetPort: Word;
begin
   Result := FPort;
end;

procedure TCustomTurnstile.SetActive(const Value: Boolean);
begin
   FActive := Value;
end;

procedure TCustomTurnstile.SetID(const Value: Word);
begin
   FID := Value;
end;

procedure TCustomTurnstile.SetIP(const Value: AnsiString);
begin
   FIP := Value;
end;

procedure TCustomTurnstile.SetMacAddress(const Value: AnsiString);
begin
   FMacAddress := Value;
end;

procedure TCustomTurnstile.SetName(const Value: AnsiString);
begin
   FName := Value;
end;

procedure TCustomTurnstile.SetPort(const Value: Word);
begin
   FPort := Value;
end;

{ TTurnstileManager }

procedure TTurnstileManager.CheckConnection;
begin
  try
    if FConnection.PingServer <> 0 then
    begin
       FConnection.Close;
       FConnection.Open;
    end;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.CheckConnection: ' + E.Message);
  end;
end;

constructor TTurnstileManager.Create;
begin
   FTurnstiles := TTurnstileList.Create;
end;

destructor TTurnstileManager.Destroy;
begin
   FTurnstiles.Free;
   inherited;
end;

function TTurnstileManager.FindClass(const AClassName: AnsiString): ITurnstile;
var
   ClassRef: TPersistentClass;
begin
   Result := nil;
   try
     ClassRef := GetClass(AClassName);

     if ClassRef <> nil then
       Result := TCustomTurnstileClass(ClassRef).Create;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.CheckConnection: ' + E.Message);
  end;
end;

function TTurnstileManager.GetAccessType(const Turnstile: ITurnstile;
   const ID: AnsiString): AnsiString;
var
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
begin
   Result := '';

   CheckConnection;

   try
     Statement := FConnection.PrepareStatement(SSQLSelectAccessType);
     Self.LogMessage('1: TTurnstileManager.GetAccessType - SQL: ' + SSQLSelectAccessType, EVENTLOG_INFORMATION_TYPE);
     try
        Statement.SetInt(1, Turnstile.ID);
        Statement.SetString(2, ID);
        ResultSet := Statement.ExecuteQueryPrepared;
        try
           if ResultSet.Next then
           begin
              Result := ResultSet.GetStringByName('response');
           end;
        finally
           ResultSet.Close;
           ResultSet := nil;
        end;
     finally
        Statement.Close;
        Statement := nil;
     end;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.GetAccessType: ' + E.Message);
  end;
end;

class function TTurnstileManager.GetInstance: TTurnstileManager;
begin
   if not Assigned(TTurnstileManager.FInstance) then
      TTurnstileManager.FInstance := TTurnstileManager.Create;
   Result := TTurnstileManager.FInstance;
end;

function TTurnstileManager.GetServiceExecutablePath(strMachine,
  strServiceName: string): String;
var
  hSCManager,hSCService: SC_Handle;
  lpServiceConfig: PQueryServiceConfigA;
  nSize, nBytesNeeded: DWord;
begin
  Result := '';

  try
    hSCManager := OpenSCManager(PChar(strMachine), nil, SC_MANAGER_CONNECT);
    if (hSCManager > 0) then
    begin
      hSCService := OpenService(hSCManager, PChar(strServiceName), SERVICE_QUERY_CONFIG);
      if (hSCService > 0) then
      begin
        QueryServiceConfig(hSCService, nil, 0, nSize);
        lpServiceConfig := AllocMem(nSize);
        try
          if not QueryServiceConfig(
            hSCService, lpServiceConfig, nSize, nBytesNeeded) Then Exit;
            Result := lpServiceConfig^.lpBinaryPathName;
        finally
          Dispose(lpServiceConfig);
        end;
        
        CloseServiceHandle(hSCService);
      end;
    end;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.GetServiceExecutablePath: ' + E.Message);
  end;
end;

procedure TTurnstileManager.Load;
var
   ResultSet: IZResultSet;
   Turnstile: ITurnstile;
begin
  try
   CheckConnection;
   ResultSet := FConnection.CreateStatement.ExecuteQuery(SSQLSelectCatracas);
   try
      while ResultSet.Next do
      begin
         Turnstile := FindClass('T' + ResultSet.GetStringByName('DS_CHAVE'));

         if Turnstile <> nil then
         begin
            if (not(Turnstile.Active)) then
               Turnstile.Active := True;

            Turnstile.ID := ResultSet.GetIntByName('CD_CATRACA');
            Turnstile.IP := ResultSet.GetStringByName('DS_IP');
            Turnstile.MacAddress := ResultSet.GetStringByName('DS_MAC_ADDRESS');
            Turnstile.Name := ResultSet.GetStringByName('NM_CATRACA');
            Turnstile.Port := ResultSet.GetIntByName('NR_PORTA');

            Self.LogMessage('2: TTurnstileManager.Load.Initialize - Class: ' + Turnstile.Name + ' - ' + Turnstile.IP, EVENTLOG_INFORMATION_TYPE);

            Turnstile.Initialize(ResultSet.GetStringByName('DS_CONFIG'));
            FTurnstiles.Add(Turnstile);
         end
         else
         begin
            Self.LogMessage('2: TTurnstileManager.Load.Initialize - Class - Classe T' + ResultSet.GetStringByName('DS_CHAVE') + ' não encontrada');
         end;
      end;
   finally
      ResultSet.Close;
      ResultSet := nil;
   end;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.Load - Ocorreu um erro ao tentar carregar as catracas: ' + E.Message);
  end;
end;

procedure TTurnstileManager.Unload;
var
   Turnstile: ITurnstile;
   i: Integer;
begin
  try
    for i := 0 to Pred(FTurnstiles.Count) do
    begin
      Turnstile := FTurnstiles.Get(i);
      Turnstile.UnInitialize;
    end;

    FTurnstiles.Clear;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.Load - Ocorreu um erro ao tentar carregar as catracas: ' + E.Message);
  end;
end;

procedure TTurnstileManager.LogMessage(Message: String; EventType: DWord = 1; Category: Integer = 0; ID: Integer = 0);
var
   strLog: String;
   Txt: TextFile;
   Buffer: Array[1..4096] of byte;
begin
  if (FGerarLogs = False) then
    Exit;

   if (FService <> nil) then
     FService.LogMessage(Message, EventType);

   if (FMemoLogs <> nil) then
     FMemoLogs.Lines.Add(Message);

   strLog := '[' + DateTimeToStr(Now) + ']: ';
   strLog := strLog + Message;
   AssignFile(Txt, ExtractFileDir(ParamStr(0)) + '\uni-servico-catracas.log');
   if (FileExists(ExtractFileDir(ParamStr(0)) + '\uni-servico-catracas.log')) then
      Append(Txt)
   else
      Rewrite(Txt);
   SetTextBuf(Txt, Buffer, SizeOf(Buffer));
   try
      Writeln(Txt, strLog);
   finally
      CloseFile(Txt);
   end;
end;

procedure TTurnstileManager.OnError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
const
   EventToStr: array[TErrorEvent] of AnsiString = ('General', 'Send', 'Receive',
      'Connect', 'Disconnect', 'Accept', 'Lookup');
var
   S: AnsiString;        
begin
  try
    S := EventToStr[ErrorEvent];
    S := S + #13+#10+'ErrorCode: ' + IntToStr(ErrorCode);
    S := S + #13+#10+'Socket: '+Socket.RemoteHost+':'+IntToStr(Socket.RemotePort);
    Self.LogMessage('1: TTurnstileManager.OnError: ' + S, EVENTLOG_ERROR_TYPE);
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.OnError: ' + E.Message);
  end;
end;

procedure TTurnstileManager.RecordAccess(const ID, EventType: AnsiString;
   const Turnstile: ITurnstile);
var
   Statement: IZPreparedStatement;
   s: String;
begin
   CheckConnection;

  try
    Statement := FConnection.PrepareStatement(SSQLRecordAccess);

    s := Format('1: TTurnstileManager.RecordAccess - SQL %d, %s, %s', [Turnstile.ID, ID, EventType]);
    Self.LogMessage(s, EVENTLOG_INFORMATION_TYPE);

    try
       Statement.SetInt(1, Turnstile.ID);
       Statement.SetString(2, ID);
       Statement.SetString(3, EventType);
       Statement.ExecutePrepared;
    finally
       Statement.Close;
       Statement := nil;
    end;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.RecordAccess: ' + E.Message);
  end;
end;

procedure TTurnstileManager.SaveEvent(const Turnstile: ITurnstile; const ID,
  EventType, Info: AnsiString);
var
   Statement: IZPreparedStatement;
   s: string;
begin
   CheckConnection;
  try
    if ((FGerarLogs = False) and (Info <> EmptyStr)) then
    begin
      FGerarLogs := True;
      Self.LogMessage(Info, EVENTLOG_ERROR_TYPE);
      FGerarLogs := False;
    end;

    Statement := FConnection.PrepareStatement(SSQLInsertEvent);
    try
       try
          Statement.SetInt(1, Turnstile.ID);
          Statement.SetString(2, EventType);
          Statement.SetString(3, ID);
          Statement.SetString(4, Info);
          Statement.ExecutePrepared;
          FConnection.Commit;
          s := Format('2: TTurnstileManager.SaveEvent.ExecutePrepared (%d, %s, %s, %s, )', [Turnstile.ID, EventType, ID, Info]);
          Self.LogMessage(s, EVENTLOG_INFORMATION_TYPE);
       except
          on E: Exception do
          begin
             FConnection.Rollback;
             Self.LogMessage('3: TTurnstileManager.SaveEvent.ExecutePrepared(Error): ' + e.Message,
                EVENTLOG_ERROR_TYPE);
          end;
       end;
    finally
       Statement.Close;
       Statement := nil;
    end;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.SaveEvent: ' + E.Message);
  end;
end;

procedure TTurnstileManager.Start(const Connection: IZConnection; aMemoLogs: TMemo; aGerarLogs: Boolean);
begin
  try
    FGerarLogs := aGerarLogs;
    FMemoLogs := aMemoLogs;
    FConnection := Connection;
    Load;
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.Start: ' + E.Message);
  end;
end;

procedure TTurnstileManager.Stop;
begin
  Unload;
end;

procedure TTurnstileManager.Start(const Connection: IZConnection;  const AService: TService);
begin
  try
    FGerarLogs := True;
    FService := AService;
    FConnection := Connection;
    Load;
    Self.LogMessage('A: TTurnstileManager.Start', EVENTLOG_INFORMATION_TYPE);
  except
    on E: Exception do
      Self.LogMessage('TTurnstileManager.Start: ' + E.Message);
  end;
end;

initialization
   Classes.RegisterClass(TTurnstileManager);

finalization
   Classes.UnRegisterClass(TTurnstileManager);

end.
