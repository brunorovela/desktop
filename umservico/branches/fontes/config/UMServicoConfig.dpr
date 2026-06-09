program UMServicoConfig;

uses
  Forms,
  uFPrincipal in 'uFPrincipal.pas' {fPrincipal},
  uFBiblioshop in 'uFBiblioshop.pas' {fBiblioshop: TFrame},
  uFTasy in 'uFTasy.pas' {fTasy: TFrame},
  uFBorges in 'uFBorges.pas' {fBorges: TFrame},
  uFRecado in 'uFRecado.pas' {fRecado: TFrame},
  uSvcConfClasses in 'uSvcConfClasses.pas',
  uFConfigMsg in 'recados\uFConfigMsg.pas' {fConfigMsg},
  uFHistorico in 'recados\uFHistorico.pas' {fHistorico},
  uFLogs in 'recados\uFLogs.pas' {fLogs},
  uFLogin in 'uFLogin.pas' {fLogin},
  uFRecados in 'recados\uFRecados.pas' {fRecados},
  uFConexao in 'uFConexao.pas' {fConexao},
  uFSplashScreen in 'uFSplashScreen.pas' {fSplashScreen};

{$R *.res}

begin
   Application.Initialize;
   Application.Title := 'UNIMESTRE Serviços';
   Application.CreateForm(TfPrincipal, fPrincipal);
   Application.Run;
end.
