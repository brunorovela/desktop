unit UHenry8x;

interface

uses
   SysUtils, Windows, Types, ScktComp, Contnrs, Classes, Forms, uLkJSON,
   UMCatracasClasses;

type
   THenry8x = class(TCustomTurnstile)
   private
      FSettings: AnsiString;
      FSocket: TClientSocket;
      function ToBytes(const Value: AnsiString): TByteDynArray;
      function ToString(const Value: TByteDynArray): AnsiString;
      procedure Connect;
      procedure Disconnect;
      procedure OnConnect(Sender: TObject; Socket: TCustomWinSocket);
      procedure OnConnecting(Sender: TObject; Socket: TCustomWinSocket);
      procedure OnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
      procedure OnError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
      procedure OnRead(Sender: TObject; Socket: TCustomWinSocket);
      procedure ProcessRequest(Socket: TCustomWinSocket);
      procedure SendPackage(const Value: AnsiString);
      procedure SendSettings;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Initialize(const Settings: AnsiString); override;
      procedure UnInitialize; override;
   end;

implementation

{$I consts.inc}

{ THenry8x }

procedure THenry8x.Connect;
var
   S: AnsiString;
begin
   if Assigned(FSocket) then
   begin
      if FSocket.Active then
         FSocket.Close;
      FSocket.Free;
   end;

   Active := False;
   FSocket := TClientSocket.Create(nil);
   FSocket.ClientType := ctNonBlocking;
   FSocket.OnConnecting := OnConnecting;
   FSocket.OnConnect := OnConnect;
   FSocket.OnDisconnect := OnDisconnect;
   FSocket.OnError := OnError;
   FSocket.OnRead := OnRead;
   FSocket.Address := IP;
   FSocket.Port := Port;
   
   try
      FSocket.Open;
   except
      on E: Exception do //ESocketError
      begin
         S := 'THenry8x.Connect: ' + Format(SEventDeviceErrorConnetingFmt, [ID, IP, Port, E.Message]);
         TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      end;
   end;   
end;

constructor THenry8x.Create;
begin
   //
end;

destructor THenry8x.Destroy;
begin
   Disconnect;
   inherited;
end;

procedure THenry8x.Disconnect;
var
   S: AnsiString;
begin
   try
     if not Assigned(FSocket) then
        Exit;

     if FSocket.Active then
     begin
        FSocket.Close;
        S := 'THenry8x.Destroy: ' + Format(SEventDeviceDisconnectedFmt, [ID, IP, Port]);
        TTurnstileManager.Instance.LogMessage(S, EVENTLOG_SUCCESS);
     end;

     FSocket.Free;
   except
      on E: Exception do
      begin
         S := 'THenry8x.Disconnect: ' + E.Message;
         TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      end;
   end;
end;

procedure THenry8x.Initialize(const Settings: AnsiString);
var
   S: AnsiString;
begin
   S := 'THenry8x.Initialize: ' + Format(SEventDeviceConnectedFmt, [ID, IP, Port]);
   //TTurnstileManager.Instance.LogMessage(S, EVENTLOG_SUCCESS);
   FSettings := Settings;
   Connect;
end;

procedure THenry8x.OnConnect(Sender: TObject; Socket: TCustomWinSocket);
var
   S: AnsiString;
begin
   S := 'THenry8x.OnConnect: ' + Format(SEventDeviceConnectedFmt, [ID, IP, Port]);
   //TTurnstileManager.Instance.LogMessage(S, EVENTLOG_SUCCESS);
   SendSettings;
end;

procedure THenry8x.OnConnecting(Sender: TObject; Socket: TCustomWinSocket);
var
   S: AnsiString;
begin
   S := 'THenry8x.OnConnecting: ' + Format(SEventDeviceConnectingFmt, [ID, IP, Port]);
   //TTurnstileManager.Instance.LogMessage(S, EVENTLOG_SUCCESS);
end;

procedure THenry8x.OnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
   S: AnsiString;
begin
   S := 'THenry8x.OnDisconnect: ' + Format(SEventDeviceDisconnectedFmt, [ID, IP, Port]);
   //TTurnstileManager.Instance.LogMessage(S, EVENTLOG_SUCCESS);
end;

procedure THenry8x.OnError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
const
   EventToStr: array[TErrorEvent] of AnsiString = ('General', 'Send', 'Receive',
      'Connect', 'Disconnect', 'Accept', 'Lookup');
var
   S: AnsiString;
begin
   try
     S := Format(SEventDeviceErrorFmt, [ID, EventToStr[ErrorEvent], IP, Port]);
     S := S + #13+#10+'ErrorCode: ' + IntToStr(ErrorCode);
     S := S + #13+#10+'Socket: '+Socket.RemoteHost+':'+IntToStr(Socket.RemotePort);
     TTurnstileManager.Instance.LogMessage('THenry8x.OnError: ' + S, EVENTLOG_ERROR_TYPE);
     TTurnstileManager.Instance.Service.ReportStatus;
     TTurnstileManager.Instance.OnError(Sender, Socket, ErrorEvent, ErrorCode);
   except
      on E: Exception do
      begin
         ErrorCode := 0;
         S := 'THenry8x.OnError Exception: ' + E.Message;
         TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      end;

      on E: ESocketError do
      begin
         ErrorCode := 0;
         S := 'THenry8x.OnError ESocketError: ' + E.Message;
         TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);      
      end;
   end;
end;

procedure THenry8x.OnRead(Sender: TObject; Socket: TCustomWinSocket);
begin
   ProcessRequest(Socket);
end;

procedure THenry8x.ProcessRequest(Socket: TCustomWinSocket);
var
   Package: TByteDynArray;
   PackageSize: Integer;
   S, Log, Response, EventType: AnsiString;
   PackageHead, PackageBody: TStrings;
   ValidPackage: Boolean;
//   I: Integer;
begin
   PackageSize := Socket.ReceiveBuf(Pointer(nil)^, -1);
   SetLength(Package, PackageSize);
   Socket.ReceiveBuf(Pointer(Package)^, PackageSize);
   
   try
      Response := '';
      S := ToString(Package);


//      for I := 1 to 3 do
//      begin
//         if I = 1 then
//            // Passou carteirinha 08+REON+000+0 <========
//            S := '08+REON+000+0]00000000000014205056]31/10/2019 09:29:00]1]0]2'
//         else if I = 2 then
//            // Girou catraca (08+REON+000+81 <========) 08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]1 <====== sentido entrada
//            S := '08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]1]0]2'
//         else
//            // Girou catraca (08+REON+000+81 <========) 08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]2 <====== sentido saída
//            S := '08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]2]0]2';


         Log := 'THenry8x.ProcessRequest: ' + Format(SEventPackageReceivedFmt, [ID, S]);
         TTurnstileManager.Instance.LogMessage('THenry8x.ProcessRequest: ' + Log, EVENTLOG_INFORMATION_TYPE);

         PackageBody := TStringList.Create;
         try
            PackageBody.Delimiter := ']';
            PackageBody.StrictDelimiter := True;
            PackageBody.DelimitedText := S;
            TTurnstileManager.Instance.LogMessage('PackageBody =  ' + S, EVENTLOG_INFORMATION_TYPE);

            ValidPackage := PackageBody.Count = 6;
            TTurnstileManager.Instance.LogMessage('PackageBody.Count = ' + IntToStr(PackageBody.Count), EVENTLOG_INFORMATION_TYPE);

            if ValidPackage then
            begin

               PackageHead := TStringList.Create;
               try
                  PackageHead.Delimiter := '+';
                  PackageHead.StrictDelimiter := True;
                  PackageHead.DelimitedText := PackageBody[0];
                  TTurnstileManager.Instance.LogMessage('PackageHead =  ' + PackageBody[0], EVENTLOG_INFORMATION_TYPE);

                  ValidPackage := PackageHead.Count = 4;
                  TTurnstileManager.Instance.LogMessage('PackageHead.Count = ' + IntToStr(PackageHead.Count), EVENTLOG_INFORMATION_TYPE);

                  if ValidPackage then
                     ValidPackage := PackageHead[1] = 'REON';

                  if ValidPackage then
                  begin
                     S := Format(SJsonEventRequestFmt, [
                        PackageHead[3],
                        PackageBody[1],
                        PackageBody[2],
                        PackageBody[3],
                        PackageBody[4],
                        PackageBody[5]
                     ]);
                     TTurnstileManager.Instance.LogMessage('SJsonEventRequestFmt = ' + S, EVENTLOG_INFORMATION_TYPE);

                     TTurnstileManager.Instance.LogMessage('PackageBody[0] = ' + PackageBody[0], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageBody[1] = ' + PackageBody[1], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageBody[2] = ' + PackageBody[2], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageBody[3] = ' + PackageBody[3], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageBody[4] = ' + PackageBody[4], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageBody[5] = ' + PackageBody[5], EVENTLOG_INFORMATION_TYPE);

                     TTurnstileManager.Instance.LogMessage('PackageHead[0] = ' + PackageHead[0], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageHead[1] = ' + PackageHead[1], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageHead[2] = ' + PackageHead[2], EVENTLOG_INFORMATION_TYPE);
                     TTurnstileManager.Instance.LogMessage('PackageHead[3] = ' + PackageHead[3], EVENTLOG_INFORMATION_TYPE);

                     EventType := '';

                     if PackageHead[3] = '0' then
                     begin
                        EventType := 'leitura_desconhecida';

                        if PackageBody[5] = '4' then
                           EventType := 'leitura_teclado';

                        if PackageBody[5] = '5' then
                           EventType := 'leitura_biometria';

                        Response := TTurnstileManager.Instance.GetAccessType(Self,
                           PackageBody[1]);
                     end;

                     if PackageHead[3] = '7' then
                        Response := '01+REON+00+1]3]ACESSO LIBERADO]';

                     if (PackageHead[3] = '1') or
                        (PackageHead[3] = '3') or
                        (PackageHead[3] = '4') then
                        EventType := 'liberacao_dupla';

                     if PackageHead[3] = '81' then
                     begin
                        if PackageBody[3] = '1' then
                           EventType := 'entrada_registrada';

                        if PackageBody[3] = '2' then
                           EventType := 'saida_registrada';

                        //Response := EventType;
                        TTurnstileManager.Instance.RecordAccess(PackageBody[1], EventType, Self);
                     end;

                     if PackageHead[3] = '82' then
                        EventType := 'timeout';

                     if EventType <> '' then
                        TTurnstileManager.Instance.SaveEvent(Self, PackageBody[1],EventType, S);

                     if Response <> '' then
                        SendPackage(Response);

                     TTurnstileManager.Instance.LogMessage('Response = ' + Response, EVENTLOG_INFORMATION_TYPE);
                  end;

               finally
                  PackageHead.Free;
               end;

            end;

         finally
            PackageBody.Free;
         end;
//      end;
   finally
      Finalize(Package);
   end;
end;

procedure THenry8x.SendPackage(const Value: AnsiString);
var
   Package: TByteDynArray;
   S: AnsiString;
begin
   Package := ToBytes(Value);
   try
      try
         FSocket.Socket.SendBuf(Pointer(Package)^, Length(Package));
         S := '1: THenry8x.SendPackage: ' + Format(SEventPackageSentFmt, [ID, Value]);
         TTurnstileManager.Instance.LogMessage('THenry8x.SendPackage: ' + S, EVENTLOG_SUCCESS);
      except
         on E: Exception do // ESocketError
         begin
            S := 'THenry8x.SendPackage(Error): ' + Format(SEventPackageErrorSendingFmt, [ID, Value, E.Message]);
            TTurnstileManager.Instance.LogMessage(S,
               EVENTLOG_ERROR_TYPE);
         end;
      end;
   finally
      Finalize(Package);
   end;
end;

procedure THenry8x.SendSettings;
var
   Commands: TlkJSONlist;
   I: Integer;
   S: String;
begin
  try
   Commands := TlkJSON.ParseText(FSettings) as TlkJSONlist;
   try
      if (Assigned(Commands)) then
      begin
        for I := 0 to Commands.Count - 1 do
        begin
           SendPackage(Commands.getString(I));
           Sleep(200);
        end;
      end;
   finally
      Commands.Free;
   end;
  except
      on E: Exception do
      begin
         S := 'THenry8x.SendSettings: ' + E.Message;
         TTurnstileManager.Instance.LogMessage(S, EVENTLOG_ERROR_TYPE);
      end;
  end;
end;

function THenry8x.ToBytes(const Value: AnsiString): TByteDynArray;
var
   I, PackageSize, CheckSum: Integer;
begin
   PackageSize := Length(Value);
   SetLength(Result, PackageSize + 5);

   Result[0] := 02;
   Result[1] := PackageSize and $FF;
   Result[2] := (PackageSize shr 8) and $FF;

   for I := 1 to PackageSize do
      Result[I + 2] := Ord(Value[I]);

   CheckSum := 0;
   for I := 0 to PackageSize do
      CheckSum := CheckSum xor Ord(Value[I]);

   CheckSum := CheckSum xor (PackageSize and $FF);
   CheckSum := CheckSum xor ((PackageSize shr 8) and $FF);
   Result[High(Result) - 1] := CheckSum;
   Result[High(Result)] := 03;
end;

function THenry8x.ToString(const Value: TByteDynArray): AnsiString;
var
   I, PackageSize: Integer;
begin
   PackageSize := Length(Value);

   Result := '';
   for I := 3 to PackageSize - 3 do
      Result := Result + Chr(Value[I]);
end;

procedure THenry8x.UnInitialize;
begin
 TTurnstileManager.Instance.LogMessage('Henry8x parando...');

   inherited;
   Disconnect;
end;

initialization
   Classes.RegisterClass(THenry8x);

finalization
   Classes.UnRegisterClass(THenry8x);

end.
