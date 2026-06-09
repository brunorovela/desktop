program Extra_Curriculares;

uses
  Forms,
  SysUtils,
  Main in 'Main.pas' {PrincipalForm},
  General in 'General.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uDataHoje in 'uDataHoje.pas' {frmDataHoje},
  uCadTiposPessoas in 'uCadTiposPessoas.pas' {frm_CadTiposPessoas},
  uCadAtividades in 'uCadAtividades.pas' {frm_CadAtividades},
  uCadPlanosDescontos in 'uCadPlanosDescontos.pas' {frm_CadPlanosDescontos},
  uInscricoesPlanilha in 'uInscricoesPlanilha.pas' {frm_Inscricoes_Planilha},
  uSelAtividades in 'uSelAtividades.pas' {frm_SelAtividades},
  uInscrever in 'uInscrever.pas' {frm_Inscrever},
  uCobranca in 'uCobranca.pas' {frm_Cobranca},
  uRelatorios in 'uRelatorios.pas' {frm_Relatorios},
  UFGerarMens in 'UFGerarMens.pas' {fGerarMens},
  UFInputMoney in 'UFInputMoney.pas' {fInputMoney},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uTratamentoExcecaoExtraCurricular in 'uTratamentoExcecaoExtraCurricular.pas',
  uTrataExcecao in '..\..\..\..\..\sistemas\UMUteis\fontes\uTrataExcecao.pas';

{$R *.res}
{$R RESOURCES.RES}

var
   qtdTelas, telaAtual : Integer;

procedure atualizaQtdTelas(zerar : Boolean = False);
begin
   if zerar then
   begin
      qtdTelas := 5;
      telaAtual := 0;
   end;

   Inc(telaAtual);
   TfSplash.GetInstancia.ShowSplashScreen('', Format( 'Carregando recursos... %d de %d', [ telaAtual, qtdTelas ] ));
end;

begin

   Application.Initialize;
   Application.Title := 'UNIMESTRE - Cursos Extra Curriculares';

   // Cria e exibe a janela de inicialização

   TfSplash.GetInstancia.ShowSplashScreen();

   // Inicializa o módulo de dados (data module) que tentará abrir comunicação
   // com o banco de dados do Unimestre. Verificar-se-á se a conexão foi
   // estabelecida para realizar a inicialização do módulo.

   atualizaQtdTelas(True);
   Application.CreateForm(TDM, DM);
  //Verifica conexao
   if DM.db.Connected then
   begin

      // Inicializa o LoginManager com o DataModule
      TLoginManager.GetInstancia(DM);

      // Inicializa e mantém armazenados na memória os formulários mais
      // comumente utilizados pela aplicação, além da janela principal e janela
      // para tratamento e exibição de mensagens de erro

      atualizaQtdTelas();
      Application.CreateForm(TPrincipalForm, PrincipalForm);
      atualizaQtdTelas();
      Application.CreateForm(TfrmDataHoje, frmDataHoje);
      atualizaQtdTelas();
      Application.CreateForm(Tfrm_SelAtividades, frm_SelAtividades);
      atualizaQtdTelas();
      Application.CreateForm(Tfrm_Cobranca, frm_Cobranca);

      // Fecha e destrói a janela de inicialização

      TfSplash.GetInstancia.CloseSplashScreen;

      if TLoginManager.GetInstancia().RealizarLogin() then
      begin
         Application.OnException := TTrataExcecao.Create(TTratamentoExcecaoExtraCurricular.Create()).TrataExcecao;
         Application.Run
      end
      else
      begin
         DM.Free;
      end;
   end;
end.
