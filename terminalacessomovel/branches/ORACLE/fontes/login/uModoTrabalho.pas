unit uModoTrabalho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Main, uUsuario,
  uDM, uDMConexao, UZDataset, uLoginManager, uFSplash;

type
  TfModoTrabalho = class(TForm)
    btModoOffLine: TButton;
    btModoOnline: TButton;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btModoOnlineClick(Sender: TObject);
    procedure btModoOffLineClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fModoTrabalho: TfModoTrabalho;

implementation

{$R *.dfm}

procedure TfModoTrabalho.btModoOffLineClick(Sender: TObject);
begin
   fModoTrabalho.Visible := false;
   PrincipalForm.setModoTerminal(C_MODO_OFFLINE);
   Self.Close;
 end;

procedure TfModoTrabalho.btModoOnlineClick(Sender: TObject);
var
   qtdTelas, telaAtual: Integer;
   queryUsuario: TUMZQuery;

   procedure atualizaQtdTelas(zerar : Boolean = False);
   begin
      if zerar then
      begin
         qtdTelas := 1;
         telaAtual := 0;
      end;

      Inc(telaAtual);
      TfSplash.GetInstancia.ShowSplashScreen('', Format( 'Carregando recursos... %d de %d', [ telaAtual, qtdTelas ] ));
   end;
begin

   //esconde tela de seleção de modo de trabalho
   fModoTrabalho.Visible := false;

   TfSplash.GetInstancia().ShowSplashScreen();

   //cria conexão e o Data Module
   atualizaQtdTelas(True);
   Application.CreateForm(TDM, DM);

   TfSplash.GetInstancia().CloseSplashScreen;

   //verifica se conectou com sucesso
   if(DM.ZConnTAM.Connected) then
   begin

      TLoginManager.GetInstancia(DM);

      if TLoginManager.GetInstancia().RealizarLogin(True, False) then
      begin

         if not DM.GetUsuarioLogado.TemPermissao(
            DM.GetUsuarioLogado.Pessoa.Codigo, 'TermAcessMovel.AcessoTerminalMovel', npAcesso, True) then
         begin
            Application.Terminate;
         end;

         fModoTrabalho.Visible := false;
         PrincipalForm.setModoTerminal(C_MODO_ONLINE);
         Self.Close;
      end
      else
      begin
         Application.Terminate;
      end;   
  end;
end;

procedure TfModoTrabalho.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
