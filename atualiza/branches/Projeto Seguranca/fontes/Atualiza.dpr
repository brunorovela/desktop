program Atualiza;

uses
   Forms,
   SysUtils,
   XPMan,
   Windows,
   UFPrincipal in 'UFPrincipal.pas' {fPrincipal},
   UDM in 'UDM.pas' {DM: TDataModule},
   UFLogin in 'UFLogin.pas' {fLogin},
   UFunctions in 'UFunctions.pas',
   UFSplash in 'UFSplash.pas' {fSplash},
   UFConexao in 'UFConexao.pas' {fConexao},
   UDMNotify in 'UDMNotify.pas' {DMNotify: TDataModule};

{$R *.res}
{$R RESOURCES.RES}

var
   I: Integer;

begin
   Application.Initialize;
   Application.Title := 'UNIMESTRE - Atualizador do banco de dados';

   SetWindowLong(Application.Handle, GWL_EXSTYLE,
      GetWindowLong(Application.Handle, GWL_EXSTYLE) or
      WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW
   );

   Application.NormalizeTopMosts;
   SetWindowPos(Application.Handle, HWND_TOPMOST, 0, 0, 0, 0,
   SWP_NOACTIVATE + SWP_NOMOVE + SWP_NOSIZE);

   fSplash := TfSplash.Create(Application);
   fSplash.aniCarregnd.Active := True;
   fSplash.Show;
   fSplash.Update;

   Application.CreateForm(TDM, DM);

   if DM.connUnimestre.Connected then
   begin
      Application.CreateForm(TfPrincipal, fPrincipal);

      fSplash.Hide;
      fSplash.Free;

      for I := 1 to ParamCount do
      begin
         if UpperCase(ParamStr(I)) = '--SHOW-CONN' then
         begin
            DM.ConfirmConn := True;
            Break;
         end;
      end;

      // indica se mostra mensagem ao finalizar execução
      // false irá mostrar a mensagem
      fPrincipal.speed_process := false;

      // passou login e senha?
      // CUIDADO: isso vai executar o atualiza sem confirmação de banco
      // usar isso apenas em ambente de testes!
      if (fPrincipal.ds_login <> EmptyStr) and (fPrincipal.ds_senha <> EmptyStr) then
      begin
         if fPrincipal.LoadFile then
         begin
            fPrincipal.speed_process := true;
            Application.CreateForm(TDMNotify, DMNotify);
            Application.Run;
         end
         else
         begin
            DM.Free;
         end;
      end
      else
      begin
         if fPrincipal.LoadFile and (fPrincipal.SilentAuth or TfLogin.Logon) and
            ((not DM.ConfirmConn) or TfConexao.ConfirmConnection) then
         begin
            Application.CreateForm(TDMNotify, DMNotify);
            Application.Run;
         end
         else
         begin
            DM.Free;
         end;
      end;
   end;
end.
