program ProvaInterdisciplinar;

uses
  Forms,
  SysUtils,
  General in 'General.pas',
  Main in 'Main.pas' {PrincipalForm},
  uDataHoje in 'uDataHoje.pas' {frmDataHoje},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFPIntBuscaPessoas in 'uFPIntBuscaPessoas.pas' {fPIntBuscaPessoas},
  uFPintBuscaProva in 'uFPintBuscaProva.pas' {fPIntBuscaProvas},
  uFPintBuscaSalas in 'uFPintBuscaSalas.pas' {fPintBuscaSalas},
  uFPIntImportacao in 'uFPIntImportacao.pas' {fPIntImportacao},
  uPIntLeitora in 'uPIntLeitora.pas',
  uRelUtils in 'uRelUtils.pas',
  uSobre in 'uSobre.pas' {frmSobre},
  ufPIntRelatorios in 'ufPIntRelatorios.pas' {fPIntRelatorios},
  ufPIntGeracao in 'ufPIntGeracao.pas' {fPIntGeracao},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uTratamentoExcecaoPI in 'uTratamentoExcecaoPI.pas';

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
   Application.Title := 'UNIMESTRE - Prova Interdisciplinar';

   TfSplash.GetInstancia().ShowSplashScreen();

   atualizaQtdTelas(True);
   Application.CreateForm(TDM, DM);
  atualizaQtdTelas();
   Application.CreateForm(TPrincipalForm, PrincipalForm);

   TfSplash.GetInstancia().CloseSplashScreen;

   //Verifica se está conectado
   if DM.db.Connected then
   Begin
      TLoginManager.GetInstancia(DM);

      if TLoginManager.GetInstancia().RealizarLogin(True, False) then
      begin
         Application.Run;
      end else
      begin
         Application.Terminate;      
      end;
   end;   
end.




