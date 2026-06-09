unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UMCatracasClasses, UService, ExtCtrls, Grids, DBGrids, DB,
  DBClient, ShellAPI, ComCtrls, IniFiles, XPMan, TypInfo, ComObj, ActiveX, WinSvc;

type
  TfrmPrincipal = class(TForm)
    gbBotoes: TGroupBox;
    gbMonitor: TGroupBox;
    btnIniciar: TButton;
    btnParar: TButton;
    tmrMonitorLogs: TTimer;
    tmrAtualizacoes: TTimer;
    stMonitor: TStatusBar;
    tmrMonitorServico: TTimer;
    xpmnfst1: TXPManifest;
    imgLogo: TImage;
    mmLogServico: TMemo;
    grbLogServico: TGroupBox;
    mmDump: TMemo;
    btnLogServico: TButton;
    procedure btnLogServicoClick(Sender: TObject);
    procedure tmrMonitorLogsTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrMonitorServicoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrAtualizacoesTimer(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
  private
    { Private declarations }
    FSettings: TIniFile;
    FServicoAtivo: Boolean;
    FNomeServico,
    FUser,
    FPassword: string;
    FSCManHandle: SC_Handle;

    procedure reiniciarServico;
    function VerificarServico(sMachine, sService: PChar): Boolean;
    function retornarStatusServico(sMachine, sService: PChar): DWORD;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
   UDMCatracas, UHenry7x, UHenry8x;

{$R *.dfm}

function FileSize(Arquivo: string): Integer;
Begin
   With TFileStream.Create(Arquivo, fmOpenRead or fmShareExclusive) do
      Try
         Result := Size;
      Finally
         Free;
      End;
End;


function TfrmPrincipal.retornarStatusServico(sMachine, sService: PChar): DWORD;
var
  SCManHandle, SvcHandle: SC_Handle;
  SS: TServiceStatus;
  dwStat: DWORD;
begin
  dwStat := 0;
  // Open service manager handle.
   if (FSCManHandle <= 0) then
     FSCManHandle := OpenSCManager(sMachine, nil, SC_MANAGER_CONNECT);

  if (FSCManHandle > 0) then
  begin
    SvcHandle := OpenService(FSCManHandle, sService, SERVICE_QUERY_STATUS);

    // if Service installed
    if (SvcHandle > 0) then
    begin
      // SS structure holds the service status (TServiceStatus);
      if (QueryServiceStatus(SvcHandle, SS)) then
         dwStat := ss.dwCurrentState;
      CloseServiceHandle(SvcHandle);
    end;
    //CloseServiceHandle(SCManHandle);
  end;
  Result := dwStat;
end;

function TfrmPrincipal.VerificarServico(sMachine, sService: PChar): Boolean;
begin
  Result := SERVICE_RUNNING = retornarStatusServico(sMachine, sService);
end;

procedure TfrmPrincipal.reiniciarServico;
begin
   if FServicoAtivo then
   begin
      // Abre o cmd com permissão.
      Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('cmd /c runas /savecred /password:'+FPassword+' /user:'+FUser+' cmd.exe'), nil, SW_HIDE);
      Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('/c net stop ' +FNomeServico), nil, SW_HIDE);
      mmDump.Lines.Append(DateTimeToStr(Now) + ': Serviço parado!');
      sleep(500);
      // Abre o cmd com permissão.
      Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('cmd /c runas /savecred /password:'+FPassword+' /user:'+FUser+' cmd.exe'), nil, SW_HIDE);
      Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('/c net start ' +FNomeServico), nil, SW_HIDE);
      mmDump.Lines.Append(DateTimeToStr(Now) + ': Serviço reinciado!');
   end;
end;  

procedure TfrmPrincipal.tmrAtualizacoesTimer(Sender: TObject);
begin
   btnIniciar.Enabled := not(FServicoAtivo);
   btnParar.Enabled := FServicoAtivo;
   stMonitor.Panels[0].Text := 'Data/hota: ' + DateTimeToStr(Now);

   if not(VerificarServico(nil, PAnsiChar(FNomeServico))) then
   begin
      stMonitor.Panels[1].Text := 'Serviço de catracas está parado!';
   end
   else
   begin
      stMonitor.Panels[1].Text := 'Serviço de catracas em execução!';
   end;  
end;

function StringListSortProc(List: TStringList; Index1, Index2: Integer): Integer;
var
  i1, i2: Integer;
begin
  i1 := StrToIntDef(List.Names[Index1], -1);
  i2 := StrToIntDef(List.Names[Index2], -1);
  Result := i2 - i1;
end;

procedure TfrmPrincipal.tmrMonitorLogsTimer(Sender: TObject);
begin
   if (FileExists('uni-servico-catracas.log')) then
   begin
      mmLogServico.Lines.Clear;
      mmLogServico.Lines.LoadFromFile('uni-servico-catracas.log');

      // Verifica se é maior que 1/2 mb.
      if (FileSize('uni-servico-catracas.log') > 256000) then
      begin
         Randomize;
         // Salva com outro nome, renomeia.
         RenameFile('uni-servico-catracas.log', FormatDateTime('yyyy-mm-dd-' + Format('%5.5d',[Random(7)]), Now()) + '-uni-servico-catracas.log');
      end;
   end;
end;

procedure TfrmPrincipal.tmrMonitorServicoTimer(Sender: TObject);
begin
   reiniciarServico;
   Sleep(10);
   Application.ProcessMessages;   
end;

procedure TfrmPrincipal.btnIniciarClick(Sender: TObject);
begin
   if not(VerificarServico(nil, PAnsiChar(FNomeServico))) then
   begin
      // Abre o cmd com permissão.
      Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('cmd /c runas /savecred /password:'+FPassword+' /user:'+FUser+' cmd.exe'), nil, SW_HIDE);
      // Inicia o serviço.
      Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('/c net start ' +FNomeServico), nil, SW_HIDE);
      mmDump.Lines.Append(DateTimeToStr(Now) + ': Iniciando o Serviço!');
   end;
   FServicoAtivo := True;
   tmrMonitorLogs.Enabled := true;
end;

procedure TfrmPrincipal.btnLogServicoClick(Sender: TObject);
begin
   if (tmrMonitorLogs.Enabled = True) then
   begin
      tmrMonitorLogs.Enabled := false;
      btnLogServico.Caption := 'Continuar log';
   end
   else
   begin
      tmrMonitorLogs.Enabled := True;
      btnLogServico.Caption := 'Parar log';
   end;    
end;

procedure TfrmPrincipal.btnPararClick(Sender: TObject);
begin
   tmrMonitorLogs.Enabled := False;
   FServicoAtivo :=  False;
   // Abre o cmd com permissão.
   Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('cmd /c runas /savecred /password:'+FPassword+' /user:'+FUser+' cmd.exe'), nil, SW_HIDE);
   // Para o serviço.      
   Shellexecute(Handle, 'open', 'cmd.exe', PAnsiChar('/c net stop ' +FNomeServico), nil, SW_HIDE);
   mmDump.Lines.Append(DateTimeToStr(Now) + ': Parando o Serviço!');
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (FServicoAtivo) then
   begin
      Application.MessageBox('Não será possível fechar o programa, para tal processo, clique no botão Parar', 'Atenção', MB_ICONEXCLAMATION +MB_OK+MB_TASKMODAL);
      Action := caNone;
      mmDump.Lines.Append(DateTimeToStr(Now) + ': Tentiva fechamento aplicação!');
   end;
   mmDump.Lines.SaveToFile('uni-monitor-catracas.log');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
const
   SIniPathFmt = '%sunimestre.ini';
var
   IniPath, IniDir: AnsiString;
   xTempoReinicarServico: Integer;
begin
   // Verifica se o arquivo existe.
   if (FileExists('uni-monitor-catracas.log')) then
   begin
      // Carrega o mesmo para manipulações.
      mmDump.Lines.LoadFromFile('uni-monitor-catracas.log');
      // Verifica se é maior que 1/2 mb.
      if (FileSize('uni-monitor-catracas.log') > 256000) then
      begin
         Randomize;
         // Salva com outro nome, renomeia.
         mmDump.Lines.SaveToFile(FormatDateTime('yyyy-mm-dd-' + Format('%5.5d',[Random(7)]), Now()) + '-uni-monitor-catracas.log');
         // Limpa o objeto.
         mmDump.Lines.Clear;
         // Salva o arquivo como vazio, iniciando um novo log.
         mmDump.Lines.SaveToFile('uni-monitor-catracas.log');
         // O carrega novamente, só que agora vazio.
         mmDump.Lines.LoadFromFile('uni-monitor-catracas.log');
      end;
   end;

   mmDump.Lines.Append(DateTimeToStr(Now) + ': Iniciando aplicação!');
   IniDir := ExtractFilePath(ParamStr(0));
   IniPath := Format(SIniPathFmt, [IniDir]);
   FSettings := TIniFile.Create(IniPath);

   FNomeServico := FSettings.ReadString('Monitor', 'nomeServico', 'SvcUnimestreCatracas');
   FUser := FSettings.ReadString('Monitor', 'usuario', 'SvcUnimestreCatracas');
   FPassword := FSettings.ReadString('Monitor', 'senhaUsuario', 'SvcUnimestreCatracas');
   xTempoReinicarServico := FSettings.ReadInteger('Monitor', 'tempoReinicarServico', 0);
   tmrMonitorServico.Enabled := False;
   if (xTempoReinicarServico > 0) then
   begin
      tmrMonitorServico.Interval := xTempoReinicarServico;
      tmrMonitorServico.Enabled := True;
   end;
   tmrMonitorLogs.Interval := FSettings.ReadInteger('Monitor', 'tempoMonitorLogServico', 60000);
   
   if (FSettings.ReadInteger('Monitor', 'inicializacaoAutomatica', 0) = 1) then
   begin
      mmDump.Lines.Append(DateTimeToStr(Now) + ': Iniciando automaticamente Serviço!');
      btnIniciarClick(Self);
   end;
end;

end.
