unit uBackupSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBXpress, DB, SqlExpr, ZConnection;

type
  TfrmBackupSenha = class(TForm)
    Panel1: TPanel;
    leHost: TLabeledEdit;
    BitBtn1: TBitBtn;
    btConfirmar: TBitBtn;
    lePath: TLabeledEdit;
    sdSalvar: TSaveDialog;
    btProcurar: TBitBtn;
    odRestaurar: TOpenDialog;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure leHostKeyPress(Sender: TObject; var Key: Char);
    procedure lePathKeyPress(Sender: TObject; var Key: Char);
    procedure leSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackupSenha: TfrmBackupSenha;
  ds_host, ds_path, ds_senha, ds_usuario : string;

implementation

uses uBaseDados, uDM, uBackup, Math;

{$R *.dfm}

procedure TfrmBackupSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmBackupSenha.FormDestroy(Sender: TObject);
begin
   frmBackupSenha := nil;
end;

procedure TfrmBackupSenha.FormShow(Sender: TObject);
Var
  presente: TDateTime;
  ano, mes, dia, hora, min, sec, msec : Word;
begin

  // Diretório inicial
  sdSalvar.InitialDir := DM.variavel_parametro('backup_caminho_restaura');

  if Copy(sdSalvar.InitialDir, Length(sdSalvar.InitialDir), 1) = '\' then
  begin
    sdSalvar.InitialDir := Copy(sdSalvar.InitialDir, 1, Length(sdSalvar.InitialDir) - 1);
  end;

  if ds_acao = 'backup' then
  begin
    // Extraindo data e hora
    presente := now;

    DecodeDate(presente, ano, mes, dia);
    DecodeTime(presente, hora, min, sec, msec);

    sdSalvar.FileName := 'b';
    sdSalvar.FileName := sdSalvar.FileName + copy(frmBaseDados.completar_string(IntToStr(ano), '0', 'E', 4), 3, 2);
    sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(mes), '0', 'E', 2);
    sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(dia), '0', 'E', 2);
    sdSalvar.FileName := sdSalvar.FileName + '_';
    sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(hora), '0', 'E', 2);
    sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(min), '0', 'E', 2);
    sdSalvar.FileName := sdSalvar.FileName + frmBaseDados.completar_string(IntToStr(sec), '0', 'E', 2);

    lePath.Text := sdSalvar.InitialDir + '\' + sdSalvar.FileName + '.' + sdSalvar.DefaultExt;
    leHost.Text := DM.variavel_parametro('backup_host');
  end
  else
  begin
    lePath.Text := sdSalvar.InitialDir + '\';
    leHost.Text := DM.variavel_parametro('backup_host_restaura');
  end;

  leHost.SetFocus;

end;

procedure TfrmBackupSenha.btProcurarClick(Sender: TObject);
begin
  if ds_acao = 'backup' then
      begin
        if sdSalvar.Execute = true then
          begin
            lePath.Text := sdSalvar.FileName;
          end;
      end
    else
      begin
        If odRestaurar.Execute = true then
          begin
            lePath.Text := odRestaurar.FileName;
          end;
      end;

end;

procedure TfrmBackupSenha.leHostKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      lePath.SetFocus;
      key := #0;
    end;
end;

procedure TfrmBackupSenha.lePathKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      key := #0;
      btConfirmar.Click;
    end;
end;

procedure TfrmBackupSenha.leSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
      begin
        key := #0;
        btConfirmar.Click;
      end;

end;

procedure TfrmBackupSenha.btConfirmarClick(Sender: TObject);
begin

  if leHost.Text = '' then
    begin
      MessageDlg('Complete o campo host.', mtInformation, [mbOk], 0);
      leHost.SetFocus;
      ModalResult := mrNone;
      abort;
    end;

  if lePath.Text = '' then
    begin
      MessageDlg('Complete o campo caminho.', mtInformation, [mbOk], 0);
      lePath.SetFocus;
      ModalResult := mrNone;
      abort;
    end;

  if ds_acao = 'backup' then
      begin
        if UpperCase(copy(lePath.Text, 1, 1)) = 'A' then
          begin
            MessageDlg('Não é possível fazer o backup no drive de disquete (A:)!' + chr(13) + 'Selecione outro drive.', mtInformation, [mbOk], 0);
            lePath.SetFocus;
            ModalResult := mrNone;
            abort;
          end;
      end;

  if ((ds_acao = 'restauracao') and (ExtractFileName(lePath.Text) = '')) then
    begin
      MessageDlg('Selecione um arquivo de backup.', mtInformation, [mbOk], 0);
      btProcurar.SetFocus;
      ModalResult := mrNone;
      abort;
    end;

  ds_host := leHost.Text;
  ds_path := lePath.Text;
  ds_senha := DM.variavel_parametro('backup_senha');
  ds_usuario := DM.variavel_parametro('backup_usuario');
end;

end.
