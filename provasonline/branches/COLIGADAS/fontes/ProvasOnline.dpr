program ProvasOnline;

uses
  Forms,
  SysUtils,
  UFPrincipal in 'UFPrincipal.pas' {fPrincipal},
  UDM in 'UDM.pas' {DM: TDataModule},
  UUtils in 'UUtils.pas',
  UZDbcFuncs in 'UZDbcFuncs.pas',
  UFBuscaProva in 'UFBuscaProva.pas' {fBuscaProva},
  UFImpressao in 'UFImpressao.pas' {fImpressao},
  UFBuscaPessoa in 'UFBuscaPessoa.pas' {fBuscaPessoa},
  UFLeitura in 'UFLeitura.pas' {fLeitura},
  UOpticalReader in 'UOpticalReader.pas',
  UFArquivosProva in 'UFArquivosProva.pas' {fArquivosProva},
  uFSplash in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFSplash.pas' {fSplash},
  uFUMLogin in '..\..\..\..\..\sistemas\UMNucleo\fontes\uFUMLogin.pas' {fUMLogin},
  uLoginManager in '..\..\..\..\..\sistemas\UMNucleo\fontes\uLoginManager.pas',
  uTrataExcecao in '..\..\..\..\..\sistemas\UMUteis\fontes\uTrataExcecao.pas';

{$R *.res}
{$R RESOURCES.RES}

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
   Application.Title := 'Provas Online';

   TfSplash.GetInstancia.ShowSplashScreen();

   atualizaQtdTelas(True);
   Application.CreateForm(TfPrincipal, fPrincipal);
   atualizaQtdTelas();
   Application.CreateForm(TDM, DM);

   TfSplash.GetInstancia.CloseSplashScreen;

   if DM.conn.Connected then
   begin

      TLoginManager.GetInstancia(DM);

      if TLoginManager.GetInstancia.RealizarLogin(False, False) then
      begin
         // Application.OnException := TTrataExcecao.Create(nil).TrataExcecao;

         fPrincipal.sbUsuario.Caption := Format('Usuário: %s',
            [DM.qryUsuarioDS_LOGIN.AsString]);
         fPrincipal.sbDataHora.Caption := FormatDateTime('dd/mm/yyyy',
            DM.DateTimeFromDB);
         fPrincipal.sbServidor.Caption := Format('%s:%d/%s', [DM.conn.HostName,
            DM.conn.Port, DM.conn.Database]);
         Application.Run;
      end
      else
         DM.Free;
   end;
end.
