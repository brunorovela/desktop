program Exportacao;

uses
  Forms,
  SysUtils,
  uScriptFunctions in 'uScriptFunctions.pas',
  uCadCampos in 'uCadCampos.pas' {fCadCampos},
  uDM in 'uDM.pas' {DM: TDataModule},
  uMain in 'uMain.pas' {fMain},
  uCadTabelas in 'uCadTabelas.pas' {fCadTabelas},
  uCadConsultas in 'uCadConsultas.pas' {fCadConsultas},
  uCadLayout in 'uCadLayout.pas' {fCadLayout},
  uListaCampos in 'uListaCampos.pas' {fListaCampos},
  uExporta in 'uExporta.pas' {fExportar},
  uExportaClasses in 'uExportaClasses.pas',
  uFiltroConsulta in 'uFiltroConsulta.pas' {fFiltrosConsulta},
  uProgresso in 'uProgresso.pas' {frmProg},
  uDefineSQL in 'uDefineSQL.pas' {fDefineSQL},
  uDiretivas in 'uDiretivas.pas',
  uMGerais in '..\..\..\..\..\SISTEMAS\Funcoes\Units\uMGerais.pas',
  General in 'General.pas',
  uFiltrosExporta in 'uFiltrosExporta.pas' {fFiltroExporta},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uTratamentoExcecaoExportacao in 'uTratamentoExcecaoExportacao.pas',
  uTrataExcecao in '..\..\..\..\..\sistemas\UMUteis\fontes\uTrataExcecao.pas';

{$R *.res}
{$R RESOURCES.RES}

var
   qtdTelas, telaAtual : Integer;

procedure atualizaQtdTelas(zerar : Boolean = False);
begin
   if zerar then
   begin
      qtdTelas := 3;
      telaAtual := 0;
   end;

   Inc(telaAtual);
   TfSplash.GetInstancia.ShowSplashScreen('', Format( 'Carregando recursos... %d de %d', [ telaAtual, qtdTelas ] ));
end;

begin
   Application.Initialize;
   Application.Title := 'UNIMESTRE - Exportação';
   Application.ShowMainForm := True;

   TfSplash.GetInstancia.ShowSplashScreen();

   atualizaQtdTelas(True);
   Application.CreateForm(TDM, DM);
   
   if DM.ZConn.Connected then
   begin
      atualizaQtdTelas();
      Application.CreateForm(TfMain, fMain);
      atualizaQtdTelas();
      Application.CreateForm(TfFiltroExporta, fFiltroExporta);

      TLoginManager.GetInstancia(DM);

      TfSplash.GetInstancia.CloseSplashScreen;

      if fMain.VerificaParametros and
         (fMain.ALogado or TLoginManager.GetInstancia().RealizarLogin(True, False)) then
      begin
         Application.OnException := TTrataExcecao.Create(TTratamentoExcecaoExportacao.Create).TrataExcecao;
         Application.Run;
      end
      else
         DM.Free;
   end;
end.
