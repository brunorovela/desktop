unit unBAckupAgendado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ExtCtrls, StdCtrls, Registry, DateUtils, DB, ZConnection;

const
  BKP_DIARIO = 'diario';
  BKP_HORA   = 'hora';

type
  TfrmBackupAgendado = class(TForm)
    pmTray: TPopupMenu;
    MostrarAgendador1: TMenuItem;
    Fechar1: TMenuItem;
    Fechar2: TMenuItem;
    Timer: TTimer;
    Label1: TLabel;
    Bevel1: TBevel;
    lbData: TLabel;
    Bevel2: TBevel;
    lbObs: TLabel;
    Iniciaragora1: TMenuItem;
    pmHint: TPopupMenu;
    ItemHint: TMenuItem;
    trayUniMestreNormal: TTrayIcon;
    trayUniMestreBackup: TTrayIcon;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure trayUniMestreBackupRightClick(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure trayUniMestreBackupClick(Sender: TObject);
    procedure Iniciaragora1Click(Sender: TObject);
    procedure trayUniMestreNormalRightClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure MostrarAgendador1Click(Sender: TObject);
    procedure Fechar2Click(Sender: TObject);
    procedure trayUniMestreNormalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    posicaoX, posicaoY : integer;
    Mostrado, MensagemMostrada, Fechar : boolean;
    bck_data, bck_hora, bck_intervalo, bck_pasta, bck_base, bck_host, bck_port, bck_usuario, bck_senha, bck_tipo : string;

    procedure MostrarTela();
    procedure SumirTela();
    procedure ExecutaBackup();
  public
    { Public declarations }
    aTabelas : array of string;
  end;

var
  frmBackupAgendado: TfrmBackupAgendado;
  backupeando: Boolean;

implementation

uses uDM, uSplash, dBackupProgresso, uBaseDados;

{$R *.dfm}

procedure TfrmBackupAgendado.FormShow(Sender: TObject);
var
  H : HWnd;
begin

   frmSplash := TfrmSplash.Create(nil);
   frmSplash.Show;

   // Conexão com a base
   DM.db.Disconnect;
   DM.db.Connect;

   H := FindWindow(Nil,'UNIMESTRE - Configurações e Manutenção');
   if H <> 0 then ShowWindow(H,SW_HIDE);

   lbData.Caption := bck_data;

   { Login do Usuário }
   frmSplash.Close;

end;

procedure TfrmBackupAgendado.trayUniMestreNormalClick(Sender: TObject);
var
  pt : TPoint;
begin
  GetCursorPos(pt);

  pmTray.Popup(pt.X, pt.Y);
end;

procedure TfrmBackupAgendado.Fechar2Click(Sender: TObject);
begin
  Fechar := True;
  Close();
  Application.Terminate;
end;

procedure TfrmBackupAgendado.MostrarAgendador1Click(Sender: TObject);
begin
  MostrarTela();
end;

procedure TfrmBackupAgendado.FormCreate(Sender: TObject);
begin
  SumirTela();
  Fechar := False;
  Mostrado := False;
  MensagemMostrada := False;

  //TimerTimer(nil);
end;

procedure TfrmBackupAgendado.FormDestroy(Sender: TObject);
begin
   frmBackupAgendado := nil;
end;

procedure TfrmBackupAgendado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmBackupAgendado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := Fechar;
  if not Fechar then begin
    SumirTela();
    if MensagemMostrada = false then begin
      MensagemMostrada := True;
      Mensagem('O backup automático do UNIMESTRE continua ativo na bandeja do Windows.'+chr(13)+'Para fechar clique no ícone do UNIMESTRE na bandeja e clique em Fechar.', Application.Title, MB_OK+MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmBackupAgendado.MostrarTela();
begin
  with frmBackupAgendado do begin
    if not Mostrado then begin
      Mostrado := True;
      Position := poScreenCenter
    end
    else begin
      Left := posicaoX;
      Top := posicaoY;
    end;
    BringToFront;
    Focused;
  end;
end;

procedure TfrmBackupAgendado.SumirTela();
begin
  with frmBackupAgendado do begin
    posicaoX := Left;
    posicaoY := Top;

    Left := 100000;
    Top := 100000;
  end;

  trayUniMestreNormal.BalloonTitle := Application.Title;
  trayUniMestreNormal.BalloonFlags := bfInfo;
  trayUniMestreNormal.BalloonHint := 'O agendador de backup do UNIMESTRE está ativo !';
  trayUniMestreNormal.ShowBalloonHint;
end;

procedure TfrmBackupAgendado.TimerTimer(Sender: TObject);
var
  data_hora, data_hora_atual, data_hora_bkp : TDateTime;
  Registro : TRegistry;
  Raiz : String;
  f : TextFile;
begin

  //De 3 em 3 minutos o procedimento TimerTimer chega se há backup a ser executado
  if Timer.Interval = 1000 then Timer.Interval := 180000;

  bck_data := DM.variavel_parametro('backup_data');
  bck_hora := DM.variavel_parametro('backup_hora');
  //bck_qtd_dias := DM.variavel_parametro('backup_qtd_dias');
  bck_intervalo := DM.variavel_parametro('backup_intervalo');
  bck_pasta := DM.variavel_parametro('backup_caminho_restaura');
  bck_base := DM.variavel_parametro('backup_base');
  bck_usuario := DM.variavel_parametro('backup_usuario');
  bck_senha := DM.variavel_parametro('backup_senha');
  bck_tipo := DM.variavel_parametro('backup_tipo');

  if bck_hora = '' then begin
    CancelaInicializacao(Application.ExeName+' backup', 'UNIMESTRE - Backup Automático');
    exit;
  end;

  {Raiz := 'SOFTWARE\ODBC\ODBC.INI\' + DM.db.AliasName;}

  Registro := TRegistry.Create;
  with Registro do begin

    RootKey := HKEY_LOCAL_MACHINE;

    // Somente abre se a chave existir
    if not (OpenKey (Raiz, False)) then begin
      RootKey := HKEY_CURRENT_USER;
    end;
    OpenKey (Raiz, False);
    bck_host := ODBCInfo('Server');
    bck_port := ODBCInfo('Port');

    // Fecha a chave e o objeto
    Registro.CloseKey;
    Registro.Free;

  end;

  if bck_intervalo = '' then begin
    bck_intervalo := '1';
    //DM.set_variavel_parametro('backup_qtd_dias', bck_qtd_dias);
    DM.set_variavel_parametro('backup_intervalo', bck_intervalo);
  end;

  if bck_pasta = '' then begin
    bck_pasta := ExtractFilePath(Application.ExeName);
    DM.set_variavel_parametro('backup_caminho_restaura', bck_pasta);
  end;

  if bck_base = '' then begin
    bck_base := 'unimestre';
    DM.set_variavel_parametro('backup_base', bck_base);
  end;
  bck_base := bck_base + ';';

  if bck_tipo = BKP_DIARIO then
  begin
    data_hora := StrToDateTime( bck_data  + ' ' + bck_hora );
    data_hora_bkp := data_hora + StrToInt(bck_intervalo);
  end
  else if bck_tipo = BKP_HORA then
  begin
    data_hora_bkp := StrToDateTime( bck_data  + ' ' + bck_hora );
    //data_hora_bkp := IncHour(data_hora, StrToInt(bck_intervalo));
  end
  else
  begin //por padrão assume que o backup é diário
    data_hora := StrToDateTime( bck_data  + ' ' + bck_hora );
    data_hora_bkp := data_hora + StrToInt(bck_intervalo);
  end;

  //data_hora := StrToDateTime( bck_data  + ' ' + bck_hora );
  data_hora_atual := DM.getDataHoraAtual;

  if data_hora_atual >= data_hora_bkp then begin

    //no caso do backup por hora, atualiza na base de dados a próxima hora na qual será executado
    if bck_tipo = BKP_HORA then
      DM.set_variavel_parametro('backup_hora',TimeToStr(IncHour(StrToTime(bck_hora), StrToInt(bck_intervalo))));
    DM.set_variavel_parametro('backup_ultima_hora', bck_hora);
    if not backupeando then
    begin
      if bck_tipo = BKP_DIARIO then
        DM.set_variavel_parametro('backup_data',DateTimeToStr(data_hora_bkp));
      lbObs.Caption := 'Executando backup ...';
      ItemHint.Caption := lbObs.Caption;

      trayUniMestreNormal.visible := False;
      trayUniMestreBackup.visible := True;
      ExecutaBackup();
      trayUniMestreNormal.visible := True;
      trayUniMestreBackup.visible := False;
      lbObs.Caption := 'Backup recém executado ...';
      ItemHint.Caption := lbObs.Caption;

      trayUniMestreNormal.BalloonHint := 'O backup do banco de dados do UNIMESTRE'+chr(13)+'acabou de ser concluído !';
      trayUniMestreNormal.ShowBalloonHint;

      AssignFile(f, ExtractFilePath(Application.Exename)+'execPrograma.bat');
      Rewrite(f);

      Writeln(f, 'sleep 3');
      Writeln(f, 'start ' + ExtractFilePath(Application.Exename) + 'UniMestre_Parametros.exe backup');
      Writeln(f, 'del '+ExtractFilePath(Application.Exename)+'execPrograma.bat');
      Write(f, 'exit');

      CloseFile(f);

      WinExec(PChar(ExtractFilePath(Application.Exename)+'execPrograma.bat'), SW_SHOWMINIMIZED);
      Application.Terminate;
    end;
  end
  else if not backupeando then begin
    if bck_tipo = BKP_DIARIO then
      lbObs.Caption := 'Aguardando para execução do próximo backup.'+chr(13)+'O próximo backup será executado dia '+FormatDateTime('dd/mm/yyyy', data_hora_bkp)+' por volta das '+bck_hora+'.'
    else if bck_tipo = BKP_HORA then
      lbObs.Caption := 'Aguardando para execução do próximo backup.'+chr(13)+'O próximo backup será executado dia '+FormatDateTime('dd/mm/yyyy hh:mm:ss', data_hora_bkp)+'.'
    else //assume como diário por padrão
      lbObs.Caption := 'Aguardando para execução do próximo backup.'+chr(13)+'O próximo backup será executado dia '+FormatDateTime('dd/mm/yyyy', data_hora+StrToInt(bck_intervalo))+' por volta das '+bck_hora+'.';
    ItemHint.Caption := lbObs.Caption;
  end;
end;

procedure TfrmBackupAgendado.trayUniMestreNormalRightClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  trayUniMestreNormalClick(nil);
end;

procedure TfrmBackupAgendado.ExecutaBackup;
var
  bases, base, nome_arquivo : string;
  i : integer;
  ano, mes, dia, hora, min, sec, msec : word;
  presente : TDateTime;
begin
  backupeando := true;
  bases := bck_base;
  while Pos(';', bases) > 0 do begin
    base := Copy(bases,1,Pos(';', bases)-1);
    bases := Copy(bases,Pos(';', bases)+1);

    // Extraindo data e hora
    presente := DM.getDataHoraAtual();

    DecodeDate(presente, ano, mes, dia);
    DecodeTime(presente, hora, min, sec, msec);

    nome_arquivo := 'bck_auto_'+base+'_';
    nome_arquivo := nome_arquivo + frmBaseDados.completar_string(IntToStr(dia), '0', 'E', 2);
    nome_arquivo := nome_arquivo + frmBaseDados.completar_string(IntToStr(mes), '0', 'E', 2);
    nome_arquivo := nome_arquivo + copy(frmBaseDados.completar_string(IntToStr(ano), '0', 'E', 4), 3, 2);
    nome_arquivo := nome_arquivo + '_';
    nome_arquivo := nome_arquivo + frmBaseDados.completar_string(IntToStr(hora), '0', 'E', 2);
    nome_arquivo := nome_arquivo + frmBaseDados.completar_string(IntToStr(min), '0', 'E', 2);
    nome_arquivo := nome_arquivo + frmBaseDados.completar_string(IntToStr(sec), '0', 'E', 2);
    nome_arquivo := nome_arquivo + '.zip';

    SetLength(aTabelas, 0);

    with DM.qyAux do begin
      Close();
      SQL.Text := 'SHOW TABLES FROM '+base;
      Open();
      i := 0;
      while not Eof do begin
        SetLength(aTabelas, i+1);
        aTabelas[i] := Fields[0].AsString;

        i := i + 1;

        Next;
      end;
    end;

    Application.CreateForm(TfdBackupProgresso, fdBackupProgresso);
    Cursor := crSQLWait;

    if not DirectoryExists(bck_pasta) then
      CreateDir(bck_pasta);

    trayUniMestreBackup.BalloonTitle := Application.Title;
    trayUniMestreBackup.BalloonFlags := bfInfo;
    trayUniMestreBackup.BalloonHint := 'Executando o backup automático da base "'+base+'"...';
    trayUniMestreBackup.ShowBalloonHint;

    //fdBackupProgresso.lbProgresso.Caption := 'Executando o backup automático da base "'+base+'"...';
    //fdBackupProgresso.Show;
    fdBackupProgresso.backup(base, bck_host, bck_port, bck_usuario, bck_senha, bck_pasta+'\'+nome_arquivo, 'backup', aTabelas, false);
    Cursor := crDefault;
    //fdBackupProgresso.Close;
    //fdBackupProgresso.free;

  end;
  backupeando := false;

end;

procedure TfrmBackupAgendado.Iniciaragora1Click(Sender: TObject);
begin
    lbObs.Caption := 'Executando backup ...';
    ItemHint.Caption := lbObs.Caption;

    trayUniMestreNormal.visible := False;
    trayUniMestreBackup.visible := True;
    ExecutaBackup();
    trayUniMestreNormal.visible := True;
    trayUniMestreBackup.visible := False;
    lbObs.Caption := 'Backup recém executado ...';
    ItemHint.Caption := lbObs.Caption;
end;

procedure TfrmBackupAgendado.trayUniMestreBackupClick(Sender: TObject);
var
  pt : TPoint;
begin
  GetCursorPos(pt);

  pmHint.Popup(pt.X, pt.Y);
end;

procedure TfrmBackupAgendado.trayUniMestreBackupRightClick(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  trayUniMestreBackupClick(nil);
end;

end.
