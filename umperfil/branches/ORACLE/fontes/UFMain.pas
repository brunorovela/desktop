unit UFMain;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, DBCtrls, StdCtrls, ExtCtrls, IniFiles, ComCtrls,
   Buttons, Registry, UUtils, Midas, StrUtils, Menus, MMSystem, md5;

type
   TfMain = class(TForm)
      dsConnections: TDataSource;
      cdsConnections: TClientDataSet;
      cdsConnectionsName: TStringField;
      cdsConnectionsServer: TStringField;
      cdsConnectionsDatabase: TStringField;
      cdsConnectionsUser: TStringField;
      cdsConnectionsPassword: TStringField;
      cdsConnectionsPort: TIntegerField;
      cdsConnectionsRepDir: TStringField;
      dblcConnections: TDBLookupComboBox;
      lblSelection: TLabel;
      pnlImage: TPanel;
      imgUnimestre: TImage;
      chkDefault: TCheckBox;
      bbtnOk: TBitBtn;
      bbtnCancel: TBitBtn;
      cdsConnectionsProfile: TStringField;
      cdsConnectionsUseDocs: TBooleanField;
      cdsConnectionsDocsServer: TStringField;
      cdsConnectionsDocsDatabase: TStringField;
      cdsConnectionsDocsUser: TStringField;
      cdsConnectionsDocsPass: TStringField;
      cdsConnectionsDocsPort: TIntegerField;
      cdsConnectionsNameLower: TStringField;
      ticoConn: TTrayIcon;
      pmTray: TPopupMenu;
      miReopen: TMenuItem;
      miExit: TMenuItem;
      cdsConnectionsusaStart: TIntegerField;
      cdsConnectionsDocsUsaStart: TStringField;
      cdsAtualiza: TClientDataSet;
      cdsAtualizaBanco: TStringField;
      cdsAtualizaUser: TStringField;
      cdsAtualizaPass: TStringField;
      cdsAtualizaConfirm: TIntegerField;
      cdsAtualizaNotifica: TIntegerField;
      cdsAtualizaDir: TStringField;
      cdsAtualizaBusca: TIntegerField;
      cdsAtualizaProtocolo: TStringField;
      cdsConnectionsUseAtu: TBooleanField;
    cdsConnectionsStartDatabase: TStringField;
    cdsConnectionsDocsStartDatabase: TStringField;
    cdsConnectionsChave: TStringField;
    cdsConnectionsDocsChave: TStringField;
    cdsAtualizaChave: TStringField;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure miExitClick(Sender: TObject);
      procedure miReopenClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bbtnCancelClick(Sender: TObject);
      procedure bbtnOkClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      FIniFile: TIniFile;
      FTargetApp: string;
      function GetArguments: string;
      procedure ChangeIniFile;
      procedure ChangeODBC;
      procedure LoadConnections;
      procedure LoadProfile;
      procedure LoadTargetApp;
      procedure PlayToast;
      procedure RunTargetApp;
      procedure SetProfile;
   end;

var
   fMain: TfMain;

implementation

{$R *.dfm}

{ TfPrincipal }

procedure TfMain.bbtnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfMain.bbtnOkClick(Sender: TObject);
begin
   ChangeIniFile;
   ChangeODBC;
   Hide;
   RunTargetApp;
   Close;
end;

procedure TfMain.ChangeIniFile;
const
   SCapError = 'Erro';
   SMsgFileNotFound = 'O arquivo de configuração [unimestre.ini] não foi encontrado.'#13'Os dados de conexão não podem ser replicados.';
   MsgFlags = MB_OK or MB_ICONERROR;
var
   FileName, Path: string;
begin
   Path := ExtractFilePath(FTargetApp);
   FileName := Format('%s%sunimestre.ini', [Path, PathDelim]);

   if FileExists(FileName) then
      with TIniFile.Create(FileName) do
      try
         WriteString('Conexao', 'Servidor', cdsConnectionsServer.AsString);
         WriteString('Conexao', 'Banco', cdsConnectionsDatabase.AsString);
         WriteString('Conexao', 'Usuario', cdsConnectionsUser.AsString);
         WriteString('Conexao', 'Senha', cdsConnectionsPassword.AsString);
         WriteInteger('Conexao', 'Porta', cdsConnectionsPort.AsInteger);
         WriteString('Conexao', 'Protocolo', 'mysql-5');
         WriteInteger('Conexao', 'Usa.Start', cdsConnectionsusaStart.AsInteger);
         WriteString('Conexao', 'Start.Banco', cdsConnectionsStartDatabase.AsString);
         WriteString('Configuracoes', 'Relatorios', cdsConnectionsRepDir.AsString);
         WriteString('Conexao', 'Chave', cdsConnectionsChave.AsString);

         if cdsConnectionsUseDocs.AsBoolean then
         begin
            WriteString('Conexao.Docs', 'Servidor', cdsConnectionsDocsServer.AsString);
            WriteString('Conexao.Docs', 'Banco', cdsConnectionsDocsDatabase.AsString);
            WriteString('Conexao.Docs', 'Usuario', cdsConnectionsDocsUser.AsString);
            WriteString('Conexao.Docs', 'Senha', cdsConnectionsDocsPass.AsString);
            WriteInteger('Conexao.Docs', 'Porta', cdsConnectionsDocsPort.AsInteger);
            WriteString('Conexao.Docs', 'Protocolo', 'mysql-5');
            WriteInteger('Conexao.Docs', 'Usa.Start', cdsConnectionsDocsUsaStart.AsInteger);
            WriteString('Conexao.Docs', 'Start.Banco', cdsConnectionsDocsStartDatabase.AsString);
            WriteString('Conexao.Docs', 'Chave', cdsConnectionsDocsChave.AsString);
         end;

         if cdsConnectionsUseAtu.AsBoolean then
         begin
            WriteString('Atualiza', 'Servidor', cdsConnectionsServer.AsString);
            WriteString('Atualiza', 'Banco',   cdsAtualizaBanco.AsString);
            WriteString('Atualiza', 'Usuario', cdsAtualizaUser.AsString);
            WriteString('Atualiza', 'Senha',   cdsAtualizaPass.AsString);
            WriteString('Atualiza', 'Protocolo', cdsAtualizaProtocolo.AsString);
            WriteString('Atualiza', 'DirPadrao', cdsAtualizaDir.AsString);
            WriteInteger('Atualiza', 'Porta',  cdsConnectionsPort.AsInteger);
            WriteInteger('Atualiza', 'Usa.Start', cdsConnectionsusaStart.AsInteger);
            WriteInteger('Atualiza', 'Confirma.Conexao', cdsAtualizaConfirm.AsInteger);
            WriteInteger('Atualiza', 'Notifica.Erros', cdsAtualizaNotifica.AsInteger);
            WriteInteger('Atualiza', 'BuscaComputadores', cdsAtualizaBusca.AsInteger);
            WriteString('Atualiza', 'Chave', cdsAtualizaChave.AsString);
         end;

      finally
         Free;
      end
   else
      MessageBox(Handle, PChar(SMsgFileNotFound), PChar(SCapError), MsgFlags);
end;

procedure TfMain.ChangeODBC;
const
   ConnKey = 'SOFTWARE\ODBC\ODBC.INI\unimestre';
   ConnDocsKey = 'SOFTWARE\ODBC\ODBC.INI\unimestre_docs';
   
   procedure SetChangesODBC(const ROOT_KEY: HKEY);
   begin
      with TRegistry.Create(KEY_ALL_ACCESS) do
      try
         RootKey := ROOT_KEY;

         if OpenKey(ConnKey, True) then
            try
               WriteString('Server', cdsConnectionsServer.AsString);
               WriteString('Database', cdsConnectionsDatabase.AsString);
               WriteString('User', cdsConnectionsUser.AsString);
               WriteString('Port', cdsConnectionsPort.AsString);

               if cdsConnectionsusaStart.AsInteger <> 1 then
               begin
                  WriteString('Password', Decrypt(cdsConnectionsPassword.AsString));
               end;

               if cdsConnectionsusaStart.AsInteger = 1 then
               begin
                  WriteString('PWD', '');
               end;

            finally
               CloseKey;
            end;

         if cdsConnectionsUseDocs.AsBoolean then
         begin
            if OpenKey(ConnDocsKey, True) then
               try
                  WriteString('Server', cdsConnectionsDocsServer.AsString);
                  WriteString('Database', cdsConnectionsDocsDatabase.AsString);
                  WriteString('User', cdsConnectionsDocsUser.AsString);
                  WriteString('Port', cdsConnectionsDocsPort.AsString);

                  if cdsConnectionsusaStart.AsInteger <> 1 then
                  begin
                     WriteString('Password', Decrypt(cdsConnectionsPassword.AsString));
                  end;

                  if cdsConnectionsusaStart.AsInteger = 1 then
                  begin
                     WriteString('PWD', '');
                  end;
               finally
                  CloseKey;
               end;
         end;
      
      finally
         Free;
      end;
   end;
begin
   SetChangesODBC(HKEY_CURRENT_USER);
   SetChangesODBC(HKEY_LOCAL_MACHINE);
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if chkDefault.Checked then SetProfile;
   cdsConnections.Close;
   FIniFile.Free;
   Action := caFree;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if ticoConn.Visible then
   begin
      CanClose := False;
      Hide;
      ticoConn.ShowBalloonHint;
   end
   else
      CanClose := True;
end;

procedure TfMain.FormCreate(Sender: TObject);
const
   SCapInfo = 'Informação';
   SMsgFileNotFound = 'O arquivo de conexões não foi encontrado.';
   MsgFlags = MB_OK or MB_ICONINFORMATION;
var
   FileName, Path: string;
begin
   Path := ExtractFilePath(Application.ExeName);
   FileName := Format('%s%s%s', [Path, PathDelim, 'conexoes.ini']);
   
   if FileExists(FileName) then
   begin
      FIniFile := TIniFile.Create(FileName);
      cdsConnections.CreateDataSet;
      cdsConnections.Open;
      cdsAtualiza.CreateDataSet;
      cdsAtualiza.Open;
      LoadConnections;
      LoadTargetApp;
      LoadProfile;
   end
   else
   begin
      MessageBox(Handle, PChar(SMsgFileNotFound), PChar(SCapInfo), MsgFlags);
      Application.ProcessMessages;
      Application.Terminate;
   end;
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = 80) and (ssShift in Shift) and (ssAlt in Shift) and
      (ssCtrl in Shift) then
   begin
      PlayToast;
   end;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
   Caption := Format('%s - %s', [Caption, GetVersion]);
end;

function TfMain.GetArguments: string;
var
   User, Pass, &Unit: string;
begin
   if UpperCase(FIniFile.ReadString('INFO', 'AutoLogin', 'False')) = 'TRUE' then
   begin
      User := FIniFile.ReadString('INFO', 'Login.Usuario', '');
      Pass := Decrypt(FIniFile.ReadString('INFO', 'Login.Senha', ''));
      Pass := MD5Print(MD5String(Pass));
      &Unit := FIniFile.ReadString('INFO', 'Login.coligada', '');
      if User <> '' then
      begin
         Result := User;
         if Pass <> '' then
         begin
            Result := Result + #32 + Pass;
            if &Unit <> '' then
               Result := Result + #32 + &Unit;
         end;
      end;
   end
   else
      Result := '';
end;

procedure TfMain.LoadConnections;
var
   Sections: TStringList;
   I: Integer;
begin
   Sections := TStringList.Create;
   try
      FIniFile.ReadSections(Sections);
      for I := 0 to Sections.Count - 1 do
      begin
         if AnsiUpperCase(FIniFile.ReadString(Sections.Strings[I], 'Conexao', 'False')) = 'TRUE' then
         begin
            cdsConnections.Append;
            
            cdsConnectionsName.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Perfil.Nome', Sections.Strings[I]
            );
            cdsConnectionsNameLower.AsString :=
               AnsiLowerCase(cdsConnectionsName.AsString);
            cdsConnectionsServer.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Conexao.Servidor', 'localhost'
            );
            cdsConnectionsDatabase.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Conexao.Banco', 'unimestre'
            );
            cdsConnectionsUser.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Conexao.Usuario', 'academico'
            );
            cdsConnectionsPassword.AsString := FIniFile.ReadString(
               Sections.Strings[I],
               'Conexao.Senha',
               '91BF7BB54F86CA74AA2241F7214DF232D1'
            );
            cdsConnectionsPort.AsInteger := FIniFile.ReadInteger(
               Sections.Strings[I], 'Conexao.Porta', 3306
            );
            cdsConnectionsusaStart.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Conexao.Usa.Start', ''
            );
            cdsConnectionsStartDatabase.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Conexao.Start.Banco', 'umstart'
            );
            cdsConnectionsRepDir.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Relatorio.Diretorio', ''
            );
            cdsConnectionsChave.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Conexao.Chave', '');

            if UpperCase(FIniFile.ReadString(Sections.Strings[I], 'Conexao.Docs', 'False')) = 'TRUE' then
            begin
               cdsConnectionsUseDocs.AsBoolean := True;
               cdsConnectionsDocsServer.AsString := FIniFile.ReadString(
                  Sections.Strings[I], 'Docs.Servidor', cdsConnectionsServer.AsString
               );
               cdsConnectionsDocsDatabase.AsString := FIniFile.ReadString(
                  Sections.Strings[I], 'Docs.Banco', cdsConnectionsDatabase.AsString
               );
               cdsConnectionsDocsUser.AsString := FIniFile.ReadString(
                  Sections.Strings[I], 'Docs.Usuario', cdsConnectionsUser.AsString
               );
               cdsConnectionsDocsPass.AsString := FIniFile.ReadString(
                  Sections.Strings[I], 'Docs.Senha', cdsConnectionsPassword.AsString
               );
               cdsConnectionsDocsPort.AsInteger := FIniFile.ReadInteger(
                  Sections.Strings[I], 'Docs.Porta', cdsConnectionsPort.AsInteger
               );
               cdsConnectionsDocsUsaStart.AsInteger := FIniFile.ReadInteger(
                  Sections.Strings[I], 'Docs.Usa.Start', cdsConnectionsusaStart.AsInteger
               );
               cdsConnectionsDocsStartDatabase.AsString := FIniFile.ReadString(
                  Sections.Strings[I], 'Docs.Start.Banco', cdsConnectionsStartDatabase.AsString
               );
               cdsConnectionsDocsChave.AsString := FIniFile.ReadString(
                  Sections.Strings[I], 'Docs.Chave', cdsConnectionsChave.AsString);
               
            end
            else
               cdsConnectionsUseDocs.AsBoolean := False;

            cdsConnectionsUseAtu.AsBoolean := (UpperCase(FIniFile.ReadString(Sections.Strings[I], 'Conexao.Atualiza', 'False')) = 'TRUE' );
            cdsConnectionsProfile.AsString := Sections.Strings[I];
            cdsConnections.Post;
         end;

         //le da tag [Atualiza]
         if (UpperCase(Sections.Strings[I]) = 'ATUALIZA') then
         begin
            cdsAtualiza.Append;

            cdsAtualizaBanco.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Atualiza.Banco', 'mysql'
            );
            cdsAtualizaUser.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Atualiza.Usuario', 'atualizacao'
            );
            cdsAtualizaPass.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Atualiza.Senha', ''
            );
            cdsAtualizaConfirm.AsInteger := FIniFile.ReadInteger(
               Sections.Strings[I], 'Atualiza.Confirma', -1
            );
            cdsAtualizaNotifica.AsInteger := FIniFile.ReadInteger(
               Sections.Strings[I], 'Atualiza.Notifica.Erros', -1
            );
            cdsAtualizaDir.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Atualiza.DirPadrao', ''
            );
            cdsAtualizaBusca.AsInteger := FIniFile.ReadInteger(
               Sections.Strings[I], 'Atualiza.BuscaComputadores', -1
            );
            cdsAtualizaProtocolo.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Atualiza.Protocolo', ''
            );
            cdsAtualizaChave.AsString := FIniFile.ReadString(
               Sections.Strings[I], 'Atualiza.Chave', ''
            );
            cdsAtualiza.Post; 
         end;
      end;
   finally
      Sections.Free;
   end;
end;

procedure TfMain.LoadProfile;
begin
   if cdsConnections.Locate('Profile', FIniFile.ReadString('INFO', 'Perfil.Padrao', ''), []) then
      dblcConnections.KeyValue := cdsConnectionsProfile.AsString;

   if FIniFile.ReadBool('INFO', 'SysTray', False) then
   begin
      ticoConn.Visible := True;
      KeyPreview := True;
   end;
end;

procedure TfMain.LoadTargetApp;
begin
   if ParamCount > 0 then
      if FileExists(ParamStr(1)) then
         FTargetApp := ParamStr(1)
      else
         FTargetApp := ''
   else
      FTargetApp := '';
end;

procedure TfMain.miExitClick(Sender: TObject);
begin
   ticoConn.Visible := False;
   Close;
end;

procedure TfMain.miReopenClick(Sender: TObject);
begin
   Show;
end;

procedure TfMain.PlayToast;
begin
   PlaySound(PChar('TOASTY'), 0, SND_RESOURCE);
end;

procedure TfMain.RunTargetApp;
var
   S: string;
begin
   if FileExists(FTargetApp) then
   begin
      S := Format('"%s" %s', [FTargetApp, GetArguments]);
      WinExec(PChar(S), SW_SHOWNORMAL);
   end;
end;

procedure TfMain.SetProfile;
begin
   FIniFile.WriteString('INFO', 'Perfil.Padrao', cdsConnectionsProfile.AsString);
end;

end.
