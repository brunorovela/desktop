unit UFRestaura;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Buttons, Grids,
   DBGrids, DB, DBClient, Spin, FileCtrl,
   UMySQLDump, UDM, StrUtils, Midas, uUsuario;

type
   TfRestaura = class(TForm)
      ilFerrmnts: TImageList;
      bvlSep2: TBevel;
      tlbFerrmnts: TToolBar;
      btnSep1: TToolButton;
      btnIniciar: TToolButton;
      btnParar: TToolButton;
      btnSep2: TToolButton;
      btnFechar: TToolButton;
      btnSep3: TToolButton;
      bvlSep1: TBevel;
      lblDiretorio: TLabel;
      edtDiretorio: TEdit;
      sbDiretorio: TSpeedButton;
      lblArquivos: TLabel;
      dbgArquivos: TDBGrid;
      dsArquivos: TDataSource;
      cdsArquivos: TClientDataSet;
      cdsArquivosDateTime: TDateTimeField;
      cdsArquivosDatabase: TStringField;
      cdsArquivosFileName: TStringField;
      cdsArquivosFilePath: TStringField;
      lblServidor: TLabel;
      edtServidor: TEdit;
      lblPorta: TLabel;
      spePorta: TSpinEdit;
      lblExecutando: TLabel;
      aniExecutando: TAnimate;
      tmRestaura: TTimer;
      procedure edtServidorChange(Sender: TObject);
      procedure edtDiretorioChange(Sender: TObject);
      procedure tmRestauraTimer(Sender: TObject);
      procedure btnPararClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure btnIniciarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure sbDiretorioClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnFecharClick(Sender: TObject);
   private
      function ExtractDateTime(const FileName: TFileName): TDateTime;
      function ExtractDatabase(const FileName: TFileName): AnsiString;
      procedure AppendFile(const FileName: TFileName);
      procedure DisableControls;
      procedure DisableTimer;
      procedure EnableControls;
      procedure EnableTimer;
      procedure LoadDefaultSettings;
      procedure LoadFiles;
      procedure StartRestore;
      procedure StopRestore;
      procedure UpdateButtonState;
   end;

var
   fRestaura: TfRestaura;

implementation

{$R *.dfm}

procedure TfRestaura.AppendFile(const FileName: TFileName);
begin
   cdsArquivos.Append;
   cdsArquivosDateTime.AsDateTime := ExtractDateTime(FileName);
   cdsArquivosDatabase.AsString := ExtractDatabase(FileName);
   cdsArquivosFileName.AsString := FileName;
   cdsArquivosFilePath.AsString := Format('%s\%s', [edtDiretorio.Text, FileName]);
end;

procedure TfRestaura.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfRestaura.btnIniciarClick(Sender: TObject);
begin
   btnIniciar.Enabled := False;
   btnParar.Enabled := False;
   btnFechar.Enabled := False;
   DisableControls;
   StartRestore;
   if TMySQLRestore.GetInstance.Running then
   begin
      UpdateButtonState;
      DM.DisableScheduler;
      btnIniciar.Enabled := False;
      btnParar.Enabled := True;
      btnFechar.Enabled := False;
      EnableTimer;
   end
   else
   begin
      UpdateButtonState;
      EnableControls;
   end;
end;

procedure TfRestaura.btnPararClick(Sender: TObject);
begin
   StopRestore;
   if not TMySQLRestore.GetInstance.Running then
   begin
      DisableTimer;
      EnableControls;
      UpdateButtonState;
   end;
end;

procedure TfRestaura.DisableControls;
begin
   sbDiretorio.Enabled := False;
   edtServidor.ReadOnly := True;
   spePorta.ReadOnly := True;
   dbgArquivos.Enabled := False;
end;

procedure TfRestaura.DisableTimer;
begin
   tmRestaura.Enabled := False;
end;

procedure TfRestaura.edtDiretorioChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfRestaura.edtServidorChange(Sender: TObject);
begin
   UpdateButtonState;
end;

procedure TfRestaura.EnableControls;
begin
   sbDiretorio.Enabled := True;
   edtDiretorio.ReadOnly := False;
   spePorta.ReadOnly := False;
   dbgArquivos.Enabled := True;
end;

procedure TfRestaura.EnableTimer;
begin
   tmRestaura.Enabled := True;
end;

function TfRestaura.ExtractDatabase(const FileName: TFileName): AnsiString;
begin
   Result := Copy(FileName, 1, LastDelimiter(#95, FileName) - 1);
   if AnsiEndsStr('_AUT', Result) then
      Result := AnsiLeftStr(Result, LastDelimiter(#95, Result) - 1);
end;

function TfRestaura.ExtractDateTime(const FileName: TFileName): TDateTime;
var
   DateTimeStr, Day, Month, Year, Hours, Minutes: AnsiString;
begin
   DateTimeStr := Copy(FileName, LastDelimiter(#95, FileName) + 1, 14);
   Year := Copy(DateTimeStr, 1, 4);
   Month := Copy(DateTimeStr, 5, 2);
   Day := Copy(DateTimeStr, 7, 2);
   Hours := Copy(DateTimeStr, 9, 2);
   Minutes := Copy(DateTimeStr, 11, 2);
   DateTimeStr := Format('%s/%s/%s %s:%s', [Day, Month, Year, Hours, Minutes]);
   Result := StrToDateTime(DateTimeStr);
end;

procedure TfRestaura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsArquivos.Close;
   DM.BackupDirectory := edtDiretorio.Text;
   Action := caFree;
end;

procedure TfRestaura.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SCapInfo = 'Atenção';
   SMsgInfo =
      'Não é possível fechar a janela, pois um processo de restauração está ' +
      'em execução' + #13 + 'Aguarde a finalização.';
begin
   if TMySQLRestore.GetInstance.Running then
   begin
      CanClose := False;
      MessageBox(Handle, PChar(SMsgInfo), PChar(SCapInfo),
         MB_ICONWARNING + MB_OK)
   end;
end;

procedure TfRestaura.FormCreate(Sender: TObject);
begin
   DM.Agendado := 1;
   aniExecutando.ResName := 'LOADING';
   cdsArquivos.CreateDataSet;
   cdsArquivos.Open;
   LoadDefaultSettings;
   if DirectoryExists(edtDiretorio.Text) then
      LoadFiles;
   UpdateButtonState;
end;

procedure TfRestaura.FormDestroy(Sender: TObject);
begin
   fRestaura := nil;
end;

procedure TfRestaura.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfRestaura.LoadDefaultSettings;
begin
   edtDiretorio.Text := DM.BackupDirectory;
   edtServidor.Text := DM.conn.HostName;
   spePorta.Value := DM.conn.Port;
end;

procedure TfRestaura.LoadFiles;
var
   SearchRec: TSearchRec;
begin
   cdsArquivos.EmptyDataSet;
   if FindFirst(edtDiretorio.Text + '\*.zip', faArchive, SearchRec) = 0 then
   begin
      repeat
         AppendFile(SearchRec.Name);
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
      if cdsArquivos.State = dsInsert then
         cdsArquivos.Post;
   end;
end;

procedure TfRestaura.sbDiretorioClick(Sender: TObject);
const
   SCaption = 'Selecione a pasta de backup';
var
   Directory: AnsiString;
begin
   if SelectDirectory(SCaption, EmptyStr, Directory) then
   begin
      edtDiretorio.Text := Directory;
      LoadFiles;
   end;
end;

procedure TfRestaura.StartRestore;
const
   SCapConfirm = 'Confirmação';
   SCapSuccess = 'Sucesso';
   SCapError = 'Erro';
   SMsgConfirm =
      'Tem certeza que deseja restaurar os dados da base de dados ' +
      'selecionada?' + #13 + 'Todos os dados na base de dados atual serão ' +
      'substituídos pelas informações existentes na data do arquivo ' +
      'selecionado' + #13 + #13 + 'Deseja realmente prosseguir com a ' +
      'restauração?';
   SMsgSuccess = 'O processo de restauração foi inicializado com sucesso.';
   SMsgError = '6 - Ocorreu um erro na tentativa de inicializar a restauração.';
   SMsgErrorZip =
      '7 - Ocorreu um erro durante a descompressão do arquivo.' + #13 +
      'Não é possível iniciar o processo de restauração.';
begin
   if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      if DM.UnCompressFile(cdsArquivosFilePath.AsString) then
      begin
         TMySQLRestore.GetInstance.Database := cdsArquivosDatabase.AsString;
         TMySQLRestore.GetInstance.HostName := edtServidor.Text;
         TMySQLRestore.GetInstance.Port := spePorta.Value;
         TMySQLRestore.GetInstance.SourceFile := StringReplace(ChangeFileExt(
            cdsArquivosFilePath.AsString, '.sql'), '\', '/', [rfReplaceAll]);
         if TMySQLRestore.GetInstance.Execute then
         begin
            MessageBox(Handle, PChar(SMsgSuccess), PChar(SCapSuccess),
               MB_ICONINFORMATION + MB_OK);
            lblExecutando.Visible := True;
            aniExecutando.Visible := True;
            aniExecutando.Active := True;
            Application.ProcessMessages;
         end
         else
            MessageBox(Handle, PChar(SMsgError), PChar(SCapError),
               MB_ICONERROR + MB_OK)
      end
      else
         MessageBox(Handle, PChar(SMsgErrorZip), PChar(SCapError),
               MB_ICONERROR + MB_OK)
end;

procedure TfRestaura.StopRestore;
const
   SCapConfirm = 'Confirmação';
   SCapSuccess = 'Sucesso';
   SCapError = 'Erro';
   SMsgConfirm =
      'Tem certeza que deseja cancelar o processo de restauração?' + #13 +
      'Esta ação pode danificar a integridade das informações no banco de ' +
      'dados.' + #13 + #13 + 'Deseja realmente prosseguir?';
   SMsgSuccess = 'O processo de restauração foi cancelado com sucesso.';
   SMsgError =
      '8 - Ocorreu um erro na tentativa de interromper o processo de restauração.';
begin
   if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      if TMySQLRestore.GetInstance.Stop then
         MessageBox(Handle, PChar(SMsgSuccess), PChar(SCapSuccess),
            MB_ICONINFORMATION + MB_OK)
      else
         MessageBox(Handle, PChar(SMsgError), PChar(SCapError),
            MB_ICONERROR + MB_OK)
end;

procedure TfRestaura.tmRestauraTimer(Sender: TObject);
const
   SCapSuccess = 'Sucesso';
   SMsgSuccess =
      'O processo de restauração da base de dados foi finalizada com sucesso.';
begin
   DisableTimer;
   if TMySQLRestore.GetInstance.Running then
      EnableTimer
   else
   begin
      MessageBox(Handle, PChar(SMsgSuccess), PChar(SCapSuccess),
         MB_ICONINFORMATION + MB_OK);
      DeleteFile(AnsiDequotedStr(TMySQLRestore.GetInstance.SourceFile, #34));
      lblExecutando.Visible := False;
      aniExecutando.Active := False;
      aniExecutando.Visible := False;
      Application.ProcessMessages;
      if DM.tiAgenda.Visible then
         DM.EnableScheduler;
      UpdateButtonState;
   end;
end;

procedure TfRestaura.UpdateButtonState;
begin
   btnIniciar.Enabled := (not TMySQLRestore.GetInstance.Running) and
      (edtDiretorio.Text <> EmptyStr) and
      (Trim(edtServidor.Text) <> EmptyStr) and (not cdsArquivos.IsEmpty) and
      DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Restore', npIncluir, False);

   btnParar.Enabled := TMySQLRestore.GetInstance.Running and
      DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'UMAdministracao.Restore', npAlterar, False);

   btnFechar.Enabled := not btnParar.Enabled;
end;

end.
