program Administracao;

{%TogetherDiagram 'ModelSupport_Administracao\default.txaPackage'}

uses
  Forms,
  SysUtils,
  Windows,
  UFPrincipal in 'UFPrincipal.pas' {fPrincipal},
  UMySQLDump in 'UMySQLDump.pas',
  UDM in 'UDM.pas' {DM: TDataModule},
  UUtils in 'UUtils.pas',
  UFRelConfig in 'UFRelConfig.pas' {fRelConfig},
  UFAgendamento in 'UFAgendamento.pas' {fAgendamento},
  UFBackup in 'UFBackup.pas' {fBackup},
  UFRestaura in 'UFRestaura.pas' {fRestaura},
  MemCheck in 'MemCheck.pas',
  UFSenhas in 'UFSenhas.pas' {fSenhas},
  UFBuscaGrupo in 'UFBuscaGrupo.pas' {fBuscaGrupo},
  UFBuscaPessoa in 'UFBuscaPessoa.pas' {fBuscaPessoa},
  UFBuscaTurma in 'UFBuscaTurma.pas' {fBuscaTurma},
  UFParams in 'UFParams.pas' {fParams},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uTratamentoExcecaoAdm in 'uTratamentoExcecaoAdm.pas',
  uUsuario in '..\..\..\..\..\sistemas\umnucleo\fontes\uUsuario.pas',
  UFReportWizard in 'UFReportWizard.pas' {frmReportWizard},
  UFReportWizardStepBase in 'UFReportWizardStepBase.pas' {frmReportWizardStepBase: TFrame},
  UFReportWizardStepCustomFilters in 'UFReportWizardStepCustomFilters.pas' {frmReportWizardStepCustomFilters: TFrame},
  UFReportWizardStepFile in 'UFReportWizardStepFile.pas' {frmReportWizardStepFile: TFrame},
  UFReportWizardStepFilters in 'UFReportWizardStepFilters.pas' {frmReportWizardStepFilters: TFrame},
  UFReportWizardStepFormulas in 'UFReportWizardStepFormulas.pas' {frmReportWizardStepFormulas: TFrame},
  UFReportWizardStepSelection in 'UFReportWizardStepSelection.pas' {frmReportWizardStepSelection: TFrame},
  md5 in 'md5.pas',
  UZDbcFuncs in 'UZDbcFuncs.pas',
  uLkJSON in 'uLkJSON.pas';

{$R *.res}
{$R RESOURCES.RES}

const
   SActionKey = 'UMAdministracao.Modulo.Acesso';

var
   OpenedHandle: HWND;
   qtdTelas, telaAtual : Integer;

procedure atualizaQtdTelas(zerar : Boolean = False);
begin
   if zerar then
   begin
      qtdTelas := 2;
      telaAtual := 0;
   end;

   Inc(telaAtual);
   TfSplash.GetInstancia.ShowSplashScreen('', Format( 'Carregando recursos... %d de %d', [ telaAtual, qtdTelas ] ));
end;

begin
   OpenedHandle := CreateMutex(nil, False, PChar('Adiministracao'));
   if GetLastError = ERROR_ALREADY_EXISTS then
   begin
      SendMessage(HWND_BROADCAST, WM_REOPENAPPLICATION, 0, 0);
      Halt(0);
   end
   else
   begin
      Application.Initialize;
      Application.Title := 'UNIMESTRE - Administração';

      TfSplash.GetInstancia.ShowSplashScreen();

      atualizaQtdTelas(True);
      Application.CreateForm(TfPrincipal, fPrincipal);
  atualizaQtdTelas();
      Application.CreateForm(TDM, DM);

      TfSplash.GetInstancia.CloseSplashScreen;

      if DM.conn.Connected then
      begin

         TLoginManager.GetInstancia(DM);

         if (TLoginManager.GetInstancia().RealizarLogin(True, False)) and
            (DM.Logon(DM.GetUsuarioLogado.Pessoa.Login, DM.GetUsuarioLogado.Pessoa.Senha)) and
            (TLoginManager.GetInstancia().getDM.GetUsuarioLogado.TemPermissao(
            TLoginManager.GetInstancia().getDM.GetUsuarioLogado.Pessoa.Codigo, SActionKey, npAcesso, True)) then
         begin
            fPrincipal.sbUsuario.Caption :=
               Format('Usuário: %s', [DM.qryUsuarioDS_LOGIN.AsString]);
            fPrincipal.sbServidor.Caption := Format('%s:%d/%s',
                  [DM.conn.HostName, DM.conn.Port, DM.conn.Database]);
            fPrincipal.sbDataHora.Caption := FormatDateTime('dd/mm/yyyy',
                  DM.DateTimeFromDB);
            Application.Run;
         end
         else
         begin
            DM.Free;
         end;
      end;
   end;
end.
