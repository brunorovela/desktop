unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, ExtCtrls, Types, XPMan;

type
  TForm1 = class(TForm)
    mmLog: TMemo;
    GroupBox1: TGroupBox;
    rbPasso1: TRadioButton;
    rbPasso2: TRadioButton;
    rbPasso3: TRadioButton;
    edComando: TEdit;
    btEnviar: TButton;
    Label1: TLabel;
    XPManifest1: TXPManifest;
    rbPasso4: TRadioButton;
    procedure rbPasso4Click(Sender: TObject);
    procedure rbPasso1Click(Sender: TObject);
    procedure rbPasso2Click(Sender: TObject);
    procedure rbPasso3Click(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure OnConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure OnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure OnError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
    xSocket: TServerSocket;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
  MAX_BUF = 100;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  xSocket := TServerSocket.Create(nil);
  xSocket.Port := 3000;

  xSocket.OnClientRead := OnClientRead;
  xSocket.OnClientConnect := OnConnecting;
  xSocket.OnClientDisconnect := OnConnecting;
  xSocket.OnClientError := OnError;

  xSocket.Active := True;  
end;

function ToBytes(const Value: AnsiString): TByteDynArray;
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

procedure TForm1.btEnviarClick(Sender: TObject);
var
  Package: TByteDynArray;
  xTemp: TCustomWinSocket;
  I: Integer;
begin
  for I := 0 to xSocket.Socket.ActiveConnections-1 do
  begin
    xTemp := xSocket.Socket.Connections[i];
    if xTemp <> nil then
    begin
      Package := ToBytes(edComando.Text);
      xTemp.SendBuf(Pointer(Package)^, Length(Package));
      break;
    end;
  end;
end;

function ToString(const Value: TByteDynArray): AnsiString;
var
   I, PackageSize: Integer;
begin
   PackageSize := Length(Value);

   Result := '';
   for I := 3 to PackageSize - 3 do
      Result := Result + Chr(Value[I]);
end;

procedure TForm1.OnClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  PackageSize: Integer;
  Package: TByteDynArray;
  xStrPackage: string;
begin
  PackageSize := Socket.ReceiveBuf(Pointer(nil)^, -1);
  SetLength(Package, PackageSize);
  Socket.ReceiveBuf(Pointer(Package)^, PackageSize);
  xStrPackage := ToString(Package);
  mmLog.Lines.Add('[' + DateTimeToStr(Now) + ']: ' + xStrPackage);
end;

procedure TForm1.OnConnecting(Sender: TObject; Socket: TCustomWinSocket);
begin
  mmLog.Lines.Add('[' + DateTimeToStr(Now) + ']: IP conectou: ' + Socket.RemoteAddress);
end;

procedure TForm1.OnDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  mmLog.Lines.Add('[' + DateTimeToStr(Now) + ']: IP desconectou: ' + Socket.RemoteAddress);
end;

procedure TForm1.OnError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  xStrMsg: String;
begin
  try
    case ErrorEvent of
      eeGeneral: xStrMsg := 'eeGeneral';
      eeSend: xStrMsg := 'eeSend';
      eeReceive: xStrMsg := 'eeReceive';
      eeConnect: xStrMsg := 'eeConnect';
      eeDisconnect: xStrMsg := 'eeDisconnect';
      eeAccept: xStrMsg := 'eeAccept';
      eeLookup: xStrMsg := 'eeLookup';
    end;
    mmLog.Lines.Add('[' + DateTimeToStr(Now) + ']: Erro ('+IntToStr(ErrorCode)+') IP: '+Socket.RemoteAddress + ' | ' + xStrMsg);
    ErrorCode := 0;
  except
    on xErro: Exception do
      mmLog.Lines.Add('[' + DateTimeToStr(Now) + ']: Erro: '+xErro.Message);
  end;
end;

procedure TForm1.rbPasso1Click(Sender: TObject);
begin
  // Passou carteirinha 08+REON+000+0 <======== 08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]1 <====== sentido entrada
  edComando.Text := '08+REON+000+0]00000000000014205056]' + DateTimeToStr(Now) + ']1]0]2';
end;

procedure TForm1.rbPasso2Click(Sender: TObject);
begin
  // Girou catraca (08+REON+000+81 <========) 08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]1 <====== sentido entrada
  edComando.Text := '08+REON+000+81]00000000000014205056]' + DateTimeToStr(Now) + ']1]0]2';
end;

procedure TForm1.rbPasso3Click(Sender: TObject);
begin
  // Passou carteirinha 08+REON+000+0 <======== 08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]2 <====== sentido saída
  edComando.Text := '08+REON+000+0]00000000000014205056]' + DateTimeToStr(Now) + ']1]0]2';
end;

procedure TForm1.rbPasso4Click(Sender: TObject);
begin
  // Girou catraca (08+REON+000+81 <========) 08+REON+000+81]00000000000014205056]31/10/2019 09:29:50]2 <====== sentido saída
  edComando.Text := '08+REON+000+81]00000000000014205056]' + DateTimeToStr(Now) + ']2]0]2';
end;

end.
