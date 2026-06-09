unit UFBackup;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Spin, Buttons,
   FileCtrl, UMySQLDump, UDM, uUsuario, UMAjuda, ZAbstractDataset, UZDataset,
   UUtils, UZStartConnection, ZConnection, Math;

type
   TfBackup = class(TForm)
      bvlSep1: TBevel;
      tlbFerrmnts: TToolBar;
      btnSep1: TToolButton;
      btnIniciar: TToolButton;
      btnParar: TToolButton;
      btnSep2: TToolButton;
      btnFechar: TToolButton;
      btnSep3: TToolButton;
      bvlSep2: TBevel;
      ilFerrmnts: TImageList;
      aniExecutando: TAnimate;
      tmBackup: TTimer;
      lblBackupExterno: TLabel;
      pnlDados: TPanel;
      lblServidor: TLabel;
      edtServidor: TEdit;
      lblPorta: TLabel;
      edtPorta: TEdit;
      lblBanco: TLabel;
      cbBancos: TComboBox;
      lblDiretorio: TLabel;
      edtDiretorio: TEdit;
      sbDiretorio: TSpeedButton;
      pnlMensagem: TPanel;
    rgTipoBackup: TRadioGroup;
    UMAjuda1: TUMAjuda;
    ckbBkpMongo: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure rgTipoBackupClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure tmBackupTimer(Sender: TObject);
      procedure btnPararClick(Sender: TObject);
      procedure btnIniciarClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbDiretorioClick(Sender: TObject);
      procedure edtDiretorioChange(Sender: TObject);
      procedure cbBancosChange(Sender: TObject);
      procedure edtServidorChange(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure btnFecharClick(Sender: TObject);
   private
      procedure DisableControls;
      procedure DisableTimer;
      procedure EnableControls;
      procedure EnableTimer;
      procedure LoadDefaultSettings;
      procedure StartBackup;
      procedure StopBackup;
      procedure UpdateButtonState;
   end;

var
   fBackup: TfBackup;

implementation

uses DB;

{$R *.dfm}

procedure TfBackup.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfBackup.btnIniciarClick(Sender: TObject);
begin
   DisableControls;
   StartBackup;
   if TMySQLDump.GetInstance.Running then
   begin
      DM.DisableScheduler;
      btnIniciar.Enabled := False;
      btnParar.Enabled := True;
      btnFechar.Enabled := False;
      EnableTimer;
   end
   else
      EnableControls;
end;

procedure TfBackup.btnPararClick(Sender: TObject);
begin
   StopBackup;
   if not TMySQLDump.GetInstance.Running then
   begin
      EnableControls;
      btnIniciar.Enabled := (Trim(edtServidor.Text) <> EmptyStr) and
         (Trim(cbBancos.Text) <> EmptyStr) and (edtDiretorio.Text <> EmptyStr);
      btnParar.Enabled := False;
      btnFechar.Enabled := True;
      pnlMensagem.Visible := False;
      aniExecutando.Visible := False;
      DisableTimer;
   end;
end;

procedure TfBackup.cbBancosChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfBackup.DisableControls;
begin
   cbBancos.Enabled := False;
   sbDiretorio.Enabled := False;
end;

procedure TfBackup.DisableTimer;
begin
   tmBackup.Enabled := False;
end;

procedure TfBackup.edtDiretorioChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfBackup.edtServidorChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfBackup.EnableControls;
begin
   cbBancos.Enabled := True;
   sbDiretorio.Enabled := True;
end;

procedure TfBackup.EnableTimer;
begin
   tmBackup.Enabled := True;
end;

procedure TfBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   DM.MBases := cbBancos.Text;
   DM.BackupDirectory := edtDiretorio.Text;

   Action := caFree;
end;

procedure TfBackup.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SCaptionCannotClose = 'Atenção';
   SMessageCannotClose =
      'Não é possível fechar a janela, pois um processo de backup foi ' +
      'inicializado.' + #13 + 'Aguarde a finalização do mesmo.';
begin
   CanClose := (not TMySQLDump.GetInstance.Running) or lblBackupExterno.Visible;
   if not CanClose then
      MessageBox(Handle, PChar(SMessageCannotClose), PChar(SCaptionCannotClose),
         MB_ICONINFORMATION + MB_OK)
end;

procedure TfBackup.FormCreate(Sender: TObject);
begin
   DM.Completo := 0;
   LoadDefaultSettings;
   lblBackupExterno.Visible := TMySQLDump.GetInstance.Running;
   aniExecutando.ResName := 'LOADING';
   UpdateButtonState;
end;

procedure TfBackup.FormDestroy(Sender: TObject);
begin
   fBackup := nil;
end;

procedure TfBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F7:
         if btnIniciar.Enabled then
            btnIniciar.Click;
      VK_F8:
         if btnParar.Enabled then
            btnParar.Click;
      VK_F12:
         if btnFechar.Enabled then
            btnFechar.Click;
   end;
end;

procedure TfBackup.LoadDefaultSettings;
begin
   DM.Agendado := 0;
   edtServidor.Text := DM.conn.HostName;
   edtPorta.Text := Format('%d', [DM.conn.Port]);
   edtDiretorio.Text := DM.BackupDirectory;
   rgTipoBackup.ItemIndex := DM.Completo;

   if (DM.qryConfigDS_BASES.AsString <> '') then
   begin
      cbBancos.Items.Clear;
      cbBancos.Items.Delimiter := ';';
      cbBancos.Items.DelimitedText := DM.qryConfigDS_BASES.AsString;
      cbBancos.Text := DM.qryConfigDS_BASES.AsString;
   end;   
end;

procedure TfBackup.rgTipoBackupClick(Sender: TObject);
begin
    if DM.Completo <> rgTipoBackup.ItemIndex then
   begin
      DM.Completo := rgTipoBackup.ItemIndex;

      if rgTipoBackup.ItemIndex = 0 then
      begin
         DM.completo_selecionado := True;
      end;

      DM.qryConfig.Close;
      DM.qryConfig.ParamByName('completo').AsInteger := rgTipoBackup.ItemIndex;
      DM.qryConfig.Open;
      LoadDefaultSettings;
   end;
end;

procedure TfBackup.sbDiretorioClick(Sender: TObject);
const
   SCaption = 'Selecione o diretório para armazenamento do backup';
var
   Directory: AnsiString;
begin
   if SelectDirectory(SCaption, EmptyStr, Directory) then
      edtDiretorio.Text := Directory;
end;

procedure TfBackup.StartBackup;
const
   SFmtDateTime = 'yyyymmddhhnn';
   SFmtFilePath = '%s\%s_%s.sql';
   SCapConfirm = 'Confirmação';
   SCapSuccess = 'Finalizado';
   SCapError = 'Erro';
   SMsgConfirm = 'Deseja realmente iniciar o processo de backup?';
   SMsgError =
      '4 - Ocorreu um erro na tentativa de iniciar o processo de backup.' + #13 +
      'Certifique-se de os dados estão corretos no arquivo unimestre.ini e na tela. ' +
      'Lembre-se de que o executavel do mysqldump está definido no unimestre.ini.' + #13 +
      'O comando utilizado para realizar o backup está salvo na tabela "backup_historico".' + #13 +      
      #13 +
      'Exceção disparada pelo sistema operacional:' + #13 +
      #13 + '%s';
begin
   if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm),
      MB_ICONQUESTION + MB_YESNO) = IDYES then
   begin

      if ckbBkpMongo.Checked then
      begin
         
         pnlMensagem.Caption := 'Realizando Backup do banco MongoDB, este processo pode demorar';
         btnIniciar.Enabled := False;
         btnParar.Enabled := False;
         btnFechar.Enabled := False;
         pnlMensagem.Visible := True;
         aniExecutando.Visible := True;
         aniExecutando.Active := True;
         Refresh;

         DM.executaBackupMongo(Format('%s\%s_%s',
         [TScheduleManager.GetInstance.SaveDir, 'unimestre',
         FormatDateTime('yyyymmddhhnn', Now)]));

         pnlMensagem.Caption := 'Processando backup, este processo pode demorar alguns minutos';
         btnIniciar.Enabled := True;
         btnParar.Enabled := True;
         btnFechar.Enabled := True;
         pnlMensagem.Visible := False;
         aniExecutando.Visible := False;
         aniExecutando.Active := False;
         Refresh;
         Application.ProcessMessages;
         
      end;

      TMySQLDump.GetInstance.ReplaceParameter('--host', edtServidor.Text);
      TMySQLDump.GetInstance.ReplaceParameter('--port', edtPorta.Text);
      try
         TMySQLDump.GetInstance.Database := cbBancos.Text;
         TMySQLDump.GetInstance.ResultFile := AnsiQuotedStr(Format(SFmtFilePath,
            [edtDiretorio.Text, cbBancos.Text, FormatDateTime(SFmtDateTime, Now)]),
            #34);
         DM.CreateDirectoryBackup( edtDiretorio.Text );
         if TMySQLDump.GetInstance.Execute then
         begin
            btnIniciar.Enabled := False;
            btnParar.Enabled := False;
            btnFechar.Enabled := False;
            pnlMensagem.Visible := True;
            aniExecutando.Visible := True;
            aniExecutando.Active := True;
            Refresh;
            Application.ProcessMessages;
         end
         else
            MessageBox(Handle,
               PChar(Format(SMsgError, [TMySQLDump.GetInstance.LastError])),
               PChar(SCapError), MB_ICONERROR + MB_OK);
      finally
         TMySQLDump.GetInstance.ReplaceParameter('--host',
            TMySQLDump.GetInstance.HostName);

         TMySQLDump.GetInstance.ReplaceParameter('--port',
            TMySQLDump.GetInstance.Port);
      end;
   end;
end;

procedure TfBackup.StopBackup;
const
   SCapConfirm = 'Confirmação';
   SCapSuccess = 'Finalizado';
   SCapError = 'Erro';
   SMsgConfirm = 'Deseja realmente interromper o processo de backup?';
   SMsgSuccess = 'O processo de backup foi interrompido.';
   SMsgError = 'Não foi possível interromper o processo de backup.';
begin
   if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      if TMySQLDump.GetInstance.Stop then
         MessageBox(Handle, PChar(SMsgSuccess), PChar(SCapSuccess),
            MB_ICONINFORMATION + MB_OK)
      else
         MessageBox(Handle, PChar(SMsgError), PChar(SCapError),
            MB_ICONINFORMATION + MB_OK)
end;

procedure TfBackup.tmBackupTimer(Sender: TObject);
const
   SCapSuccess = 'Finalizado';
   SCapError = 'Erro';
   SMsgSuccess =
      'A operação foi finalizada. Agora você precisa conferir se o arquivo de backup foi gerado corretamente.' + #13 + 'O arquivo ' +
      '"%s" foi armazenado na pasta "%s"';
   SMsgError =
      '5 - Ocorreu um erro durante o processo de compressão do arquivo de backup.';
begin
   DisableTimer;
   if TMySQLDump.GetInstance.Running then
      EnableTimer
   else
   begin
      btnParar.Enabled := False;
      if DM.CompressFile(TMySQLDump.GetInstance.ResultFile) then
      begin
         MessageBox(Handle, PChar(Format(SMsgSuccess,
            [ExtractFileName(TMySQLDump.GetInstance.ResultFile),
            edtDiretorio.Text])), PChar(SCapSuccess),
            MB_OK + MB_ICONINFORMATION);

         DM.conn.Reconnect;
         DM.FinishBackup;
      end
      else
         MessageBox(Handle, PChar(SMsgError), PChar(SCapError),
            MB_OK + MB_ICONERROR);

      TMySQLDump.GetInstance.Stop;
      EnableControls;
      btnIniciar.Enabled := True;
      btnFechar.Enabled := True;
      pnlMensagem.Visible := False;
      aniExecutando.Active := False;
      aniExecutando.Visible := False;
      Application.ProcessMessages;
      DM.EnableScheduler;
   end;
end;

procedure TfBackup.UpdateButtonState;
begin
   btnIniciar.Enabled := (Trim(edtServidor.Text) <> EmptyStr) and
      (Trim(cbBancos.Text) <> EmptyStr) and (edtDiretorio.Text <> EmptyStr) and
      (not TMySQLDump.GetInstance.Running) and
      DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Backup', npIncluir, False);

   btnParar.Enabled := TMySQLDump.GetInstance.Running and
      (not lblBackupExterno.Visible) and
      DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Backup', npAlterar, False);

   btnFechar.Enabled := (not TMySQLDump.GetInstance.Running) or
      lblBackupExterno.Visible;
end;

end.
