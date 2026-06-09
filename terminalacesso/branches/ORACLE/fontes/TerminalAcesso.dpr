program TerminalAcesso;

uses
  Forms,
  Windows,
  SysUtils,
  Main in 'Main.pas' {PrincipalForm},
  General in 'General.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uTerminal in 'uTerminal.pas' {frmTerminal},
  uProgresso in 'uProgresso.pas' {frmProg},
  uConsulta in 'uConsulta.pas' {frmConsulta},
  uFreq in 'uFreq.pas',
  uFechamento in 'uFechamento.pas' {fFechamento},
  uImportaDados in 'uImportaDados.pas' {fImportaDados},
  uCImpCatracas in 'uCImpCatracas.pas',
  uFConfiguracao in 'uFConfiguracao.pas' {fConfiguracao},
  uParametros in '..\..\..\..\configuracao\branches\ORACLE\fontes\uParametros.pas' {frmParametros},
  uFAgendamentoEncerramentoPeriodo in 'uFAgendamentoEncerramentoPeriodo.pas' {frmAgendamentoEncerramentoPeriodo},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uFGerenciamentoPresencas in 'uFGerenciamentoPresencas.pas' {frmGerenciamentoPresencas},
  uTratamentoExcecaoAcademico in 'uTratamentoExcecaoAcademico.pas',
  UFCadCatracas in 'UFCadCatracas.pas' {frmCadCatracas},
  UFCadIdentificacao in 'UFCadIdentificacao.pas' {frmCadIdentificacao},
  UZDbcFuncs in 'UZDbcFuncs.pas';

{$R *.res}

var
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
   Application.Initialize;
   Application.Title := 'UNIMESTRE - Terminal de Acesso';

   TfSplash.GetInstancia.ShowSplashScreen();

   atualizaQtdTelas(True);
   Application.CreateForm(TPrincipalForm, PrincipalForm);
  // Criando conexão com banco de dados
   atualizaQtdTelas();
   Application.CreateForm(TDM, DM);

   // Verifica conexão efetuada com exito
   if DM.db.Connected then
   Begin
      TfSplash.GetInstancia.CloseSplashScreen;

      TLoginManager.GetInstancia(DM);

      if TLoginManager.GetInstancia().RealizarLogin() then
      begin
         Application.Run;
         TLoginManager.GetInstancia().Destroy();
         setBloqueio(False);
      end else begin
         Application.Terminate;
      end;
   end
   else
   begin
     TfSplash.GetInstancia.CloseSplashScreen;
     FreeAndNil(DM);
     FreeAndNil(PrincipalForm);
   end;

end.
