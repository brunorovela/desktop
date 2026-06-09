program LeitoraGabarito;

uses
  Forms,
  SysUtils,
  Main in 'Main.pas' {PrincipalForm},
  General in 'General.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uDataHoje in 'uDataHoje.pas' {frmDataHoje},
  uSplash in 'uSplash.pas' {frmSplash},
  uCadProvas in 'uCadProvas.pas' {frmCadProvas},
  uCadProvasDisciplinas in 'uCadProvasDisciplinas.pas' {frmCadProvasDisciplinas},
  uCadProvasTurmas in 'uCadProvasTurmas.pas' {frmCadProvasTurmas},
  uCadProvasGabaritos in 'uCadProvasGabaritos.pas' {frmCadProvasGabaritos},
  uSelDisciplinas in 'uSelDisciplinas.pas' {frmSelDisciplinas},
  uCadProvasAlunos in 'uCadProvasAlunos.pas' {frmCadProvasAlunos},
  uCorrigir in 'uCorrigir.pas' {frmCorrigir},
  uSelProvas in 'uSelProvas.pas' {frmSelProvas},
  uCadProvasCadAlunos in 'uCadProvasCadAlunos.pas' {frmCadProvasCadAlunos},
  uCorrecaoManual in 'uCorrecaoManual.pas' {frmCorrecaoManual},
  uSelProva in 'uSelProva.pas' {frmSelProva},
  uAtribuicaoAvancada in 'uAtribuicaoAvancada.pas' {frmAtribuicaoAvancada},
  uDigitarQuestoes in 'uDigitarQuestoes.pas' {frmDigitarQuestoes},
  uDigitarQuestoesDiscursivas in 'uDigitarQuestoesDiscursivas.pas' {frmDigitarQuestoesDiscursivas},
  uCorrecaoManualPorQuestao in 'uCorrecaoManualPorQuestao.pas' {frmCorrecaoManualPorQuestao},
  uCadProvasDiario in 'uCadProvasDiario.pas' {frmCadProvasDiario},
  uSelDisciplinasAcad in 'uSelDisciplinasAcad.pas' {frmSelDisciplinasAcad},
  uSelCursos in 'uSelCursos.pas' {frmSelCursos},
  uCorrecaoRecalculo in 'uCorrecaoRecalculo.pas' {frmCorrecoesRecalculo},
  uCorrecoes in 'uCorrecoes.pas' {frmCorrecoes},
  uFuncoesGerais in 'uFuncoesGerais.pas',
  uImportarLayouts in 'uImportarLayouts.pas' {FrmImportarLayouts},
  uTableFields in 'uTableFields.pas' {frmTableFields},
  uParametros in '..\..\..\..\configuracao\branches\ORACLE\fontes\uParametros.pas' {frmParametros},
  uItemCombo in 'uItemCombo.pas',
  uSelAnoSemestres in 'uSelAnoSemestres.pas' {frmSelAnoSemestres},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uTProva in 'uTProva.pas',
  uLkJSON in 'uLkJSON.pas',
  md5 in 'md5.pas';

{$R *.res}
var
   qtdTelas, telaAtual : Integer;

procedure atualizaQtdTelas(zerar : Boolean = False);
begin
   if zerar then
   begin
      qtdTelas := 17;
      telaAtual := 0;
   end;

   Inc(telaAtual);
   TfSplash.GetInstancia.ShowSplashScreen('', Format( 'Carregando recursos... %d de %d', [ telaAtual, qtdTelas ] ));
end;

begin
   Application.Initialize;
   Application.Title := 'UNIMESTRE - Leitora de Gabarito';
   
   TfSplash.GetInstancia.ShowSplashScreen(); 

   { Cria o DM e carrega a conexão }
   atualizaQtdTelas(True);
   Application.CreateForm(TDM, DM);
  atualizaQtdTelas();

   TfSplash.GetInstancia.CloseSplashScreen;
   
   if DM.db.Connected then
   Begin
      TLoginManager.GetInstancia(DM);

      Application.CreateForm(TPrincipalForm, PrincipalForm);

      if TLoginManager.GetInstancia().RealizarLogin(True, True) then
      begin
         Application.CreateForm(TPrincipalForm, PrincipalForm);
         atualizaQtdTelas();
         Application.CreateForm(TfrmCadProvasDisciplinas, frmCadProvasDisciplinas);
         atualizaQtdTelas();
         Application.CreateForm(TfrmCadProvasTurmas, frmCadProvasTurmas);
         atualizaQtdTelas();
         Application.CreateForm(TfrmSelCursos, frmSelCursos);
         atualizaQtdTelas();
         Application.CreateForm(TfrmSelDisciplinasAcad, frmSelDisciplinasAcad);
         atualizaQtdTelas();
         Application.CreateForm(TfrmCadProvasGabaritos, frmCadProvasGabaritos);
         atualizaQtdTelas();
         Application.CreateForm(TfrmSelDisciplinas, frmSelDisciplinas);
         atualizaQtdTelas();
         Application.CreateForm(TfrmCadProvasAlunos, frmCadProvasAlunos);
         atualizaQtdTelas();
         Application.CreateForm(TfrmCorrigir, frmCorrigir);
         atualizaQtdTelas();
         Application.CreateForm(TfrmSelProvas, frmSelProvas);
         atualizaQtdTelas();
         Application.CreateForm(TfrmDigitarQuestoes, frmDigitarQuestoes);
         atualizaQtdTelas();
         Application.CreateForm(TfrmDigitarQuestoesDiscursivas, frmDigitarQuestoesDiscursivas);
         atualizaQtdTelas();
         Application.CreateForm(TfrmCadProvasCadAlunos, frmCadProvasCadAlunos);
         atualizaQtdTelas();
         Application.CreateForm(TfrmSelProva, frmSelProva);
         atualizaQtdTelas();
         Application.CreateForm(TfrmAtribuicaoAvancada, frmAtribuicaoAvancada);
         atualizaQtdTelas();
         Application.CreateForm(TFrmImportarLayouts, FrmImportarLayouts);
         TfSplash.GetInstancia.CloseSplashScreen();

         Application.Run;
      end else
         Application.Terminate;
   end;
end.
