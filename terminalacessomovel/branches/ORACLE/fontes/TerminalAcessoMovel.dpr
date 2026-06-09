program TerminalAcessoMovel;

uses
  Forms,
  Main in 'Main.pas' {PrincipalForm},
  uTerminal in 'uTerminal.pas' {fTerminal},
  uXML in 'uXML.pas',
  General in 'General.pas',
  uDM in 'data_modules\uDM.pas' {DM: TDataModule},
  uModoTrabalho in 'login\uModoTrabalho.pas' {fModoTrabalho},
  uEscolhaAtividade in 'uEscolhaAtividade.pas' {fEscolheAtividade},
  uTerminalOnline in 'uTerminalOnline.pas' {fTerminalOnline},
  uModelTam in 'uModelTam.pas',
  uEscolhaAtividadeOffline in 'uEscolhaAtividadeOffline.pas' {fEscolheAtividadeOffline},
  uCertificados in 'uCertificados.pas' {fCertificados},
  uBuscaPessoa in 'uBuscaPessoa.pas' {fBuscaPessoas},
  uCadLivro in 'uCadLivro.pas' {fCadLivro},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Terminal de Acesso Móvel';
  Application.CreateForm(TPrincipalForm, PrincipalForm);
  Application.CreateForm(TfModoTrabalho, fModoTrabalho);
  Application.Run;
end.
