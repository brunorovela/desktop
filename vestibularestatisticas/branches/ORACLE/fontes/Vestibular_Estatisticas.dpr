program Vestibular_Estatisticas;

uses
  Forms,
  SysUtils,
  Main in 'Main.pas' {PrincipalForm},
  General in 'General.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uDataHoje in 'uDataHoje.pas' {frmDataHoje},
  uRelatorios in 'uRelatorios.pas' {frm_Relatorios},
  uSelIES in 'uSelIES.pas' {frm_Sel_IES},
  uSelDepartamento in 'uSelDepartamento.pas' {frmSelDepartamento},
  uInserirAluno in 'uInserirAluno.pas' {frm_InserirAluno},
  uListaAtual in 'uListaAtual.pas' {frm_Lista},
  uListaAlunos in 'uListaAlunos.pas' {frm_ListaAlunos},
  uAlunosDetalhes in 'uAlunosDetalhes.pas' {frm_Detalhes},
  uSelIESVest in 'uSelIESVest.pas' {frm_Sel_IES_Vest},
  uParametros in '..\..\..\..\configuracao\branches\ORACLE\fontes\uParametros.pas' {frmParametros},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas';

{$R *.res}

var
   qtdTelas, telaAtual : Integer;

procedure atualizaQtdTelas(zerar : Boolean = False);
begin
   if zerar then
   begin
      qtdTelas := 6;
      telaAtual := 0;
   end;

   Inc(telaAtual);
   TfSplash.GetInstancia.ShowSplashScreen('', Format( 'Carregando recursos... %d de %d', [ telaAtual, qtdTelas ] ));
end;

begin

   Application.Initialize;
   Application.Title := 'UNIMESTRE - Estatísticas do Vestibular';

   Application.CreateForm(TDM, DM);

   // Verifica se á conexão
   if DM.db.Connected then
   Begin

      TLoginManager.GetInstancia(DM);

      TfSplash.GetInstancia.ShowSplashScreen();

      atualizaQtdTelas(True);
      Application.CreateForm(TPrincipalForm, PrincipalForm);
      atualizaQtdTelas();
      Application.CreateForm(TfrmDataHoje, frmDataHoje);

      { Popups de selecionar itens }
      atualizaQtdTelas();
      Application.CreateForm(Tfrm_Sel_IES, frm_Sel_IES);
      atualizaQtdTelas();
      Application.CreateForm(TfrmSelDepartamento, frmSelDepartamento);
      atualizaQtdTelas();
      Application.CreateForm(Tfrm_Detalhes, frm_Detalhes);
      atualizaQtdTelas();
      Application.CreateForm(Tfrm_Sel_IES_Vest, frm_Sel_IES_Vest);
      { Popups de selecionar itens }

      TfSplash.GetInstancia.CloseSplashScreen;

      if TLoginManager.GetInstancia().RealizarLogin(True, False) then
      begin
         Application.Run;
      end
      else
      begin
         Application.Terminate;
      end;
   end;
end.
