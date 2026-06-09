program CandidatosClassificados;

uses
  Forms,
  SysUtils,
  General in 'General.pas',
  Main in 'Main.pas' {PrincipalForm},
  uDM in 'uDM.pas' {DM: TDataModule},
  uSobre in 'uSobre.pas' {frmSobre},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uTratamentoExcecaoPI in 'uTratamentoExcecaoPI.pas',
  uImportarDados in 'uImportarDados.pas' {frmImportarDados},
  uInserirFiltros in 'uInserirFiltros.pas' {frmInserirFiltros},
  uFSelecionarColigada in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSelecionarColigada.pas',
  uFSelecionarCurso in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSelecionarCurso.pas',
  uFSelecionarTurma in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSelecionarTurma.pas' {frmSelecionarTurma},
  uFSelecionarDisciplina in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSelecionarDisciplina.pas',
  uCarregaCursosFiltro in 'uCarregaCursosFiltro.pas',
  uProcessaBuscaMetodos in 'uProcessaBuscaMetodos.pas' {frmProcessaBuscaMetodos},
  ClassRegistros in 'ClassRegistros.pas',
  uCamposPlanilhas in 'uCamposPlanilhas.pas' {frmSelColunas};

{$R *.RES}

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
   Application.Title := 'UNIMESTRE - Candidatos Classificados';

   TfSplash.GetInstancia().ShowSplashScreen();

   atualizaQtdTelas(True);
   Application.CreateForm(TDM, DM);
   atualizaQtdTelas(false);

   //Verifica se está conectado
   if DM.db.Connected then
   Begin
      TLoginManager.GetInstancia(DM);

      if TLoginManager.GetInstancia().RealizarLogin(True, False) then
      begin
         TfSplash.GetInstancia().CloseSplashScreen;

         Application.CreateForm(
            TPrincipalForm,
            PrincipalForm
         );

         Application.Run;
      end
      else
      begin
         TfSplash.GetInstancia().CloseSplashScreen;
         TfSplash.GetInstancia().Destroy;
         DM.Free;
         Application.Terminate;
      end;
   end;
end.




