unit UFPrincipal;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Buttons, ComCtrls, UUtils, ToolWin, ImgList, uLoginManager, uUsuario,
   uTrataExcecao, uMensagem, uTratamentoExcecaoPadrao;

type
   TfPrincipal = class(TForm)
      stbOpcoes: TStatusBar;
      sbUsuario: TSpeedButton;
      sbDataHora: TSpeedButton;
      tblOpcoes: TToolBar;
      btnSep1: TToolButton;
      btnModulo: TToolButton;
      btnSep2: TToolButton;
      btnImpressao: TToolButton;
      btnLeitura: TToolButton;
      btnSep3: TToolButton;
      btnSair: TToolButton;
      btnSep4: TToolButton;
      ilBotoes: TImageList;
      sbServidor: TSpeedButton;
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure btnSairClick(Sender: TObject);
      procedure sbUsuarioClick(Sender: TObject);
      procedure btnLeituraClick(Sender: TObject);
      procedure btnImpressaoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure stbOpcoesDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
         const Rect: TRect);
      procedure tratarErroBanco(Sender: TObject);
   end;

var
   fPrincipal: TfPrincipal;
   tentativas_conexao : integer;
   nr_tentativas_conexao : integer;

implementation

uses
   UDM, UFImpressao, UFLeitura;

{$R *.dfm}

procedure TfPrincipal.btnImpressaoClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo,
         'ProvaOnline.Desktop.Impressao',
         npAcesso,
         True)then
   begin
      if fImpressao = nil then
         Application.CreateForm(TfImpressao, fImpressao);
      fImpressao.ShowModal;
   end;
end;

procedure TfPrincipal.btnLeituraClick(Sender: TObject);
begin
   if DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo,
         'ProvaOnline.Desktop.Acesso',
         npAcesso,
         True )then
   begin
      if fLeitura = nil then
         Application.CreateForm(TfLeitura, fLeitura);
      fLeitura.ShowModal;
   end;
end;

procedure TfPrincipal.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SConfirmCap = 'Confirmação';
   SConfirmExit = 'Deseja realmente finalizar a aplicação?';
begin
   CanClose := (MessageBox(Handle, PChar(SConfirmExit),
      PChar(SConfirmCap), MB_ICONQUESTION or MB_YESNO) = ID_YES);
end;

procedure TfPrincipal.FormCreate(Sender: TObject);
var
   RotinaTratarErroBancoP: Pointer;
   RotinaTratarErroBancoM: Pointer;

begin
   sbUsuario.Parent := stbOpcoes;
   sbServidor.Parent := stbOpcoes;
   sbDataHora.Parent := stbOpcoes;

   RotinaTratarErroBancoP := Pointer(self);
   RotinaTratarErroBancoM := self.MethodAddress('tratarErroBanco');

   Application.OnException := TTrataExcecao.Create(nil, RotinaTratarErroBancoP, RotinaTratarErroBancoM ).TrataExcecao;


end;

{ Essa função foi criada para tentar fazer o banco de dados se reconectar}
procedure TfPrincipal.tratarErroBanco(Sender:Tobject);
var
   Parametros: TParamsIni;
   FormularioErro : TfrmMensagem;
   problema_resolvido : boolean;
begin
   Sleep(1000);
   inc(tentativas_conexao);
   problema_resolvido := False;

   Try

      dm.conn.Disconnect;
      dm.conn.Reconnect;
      dm.conn.Connect;

      if dm.conn.Ping = true then
      begin
         problema_resolvido := true;
         tentativas_conexao := 0;
      end;
   Except
      // nada
   end;


   // nao teve como... a conexao nao foi mais realizada
   // mostra mensagem de erro
   if problema_resolvido = false then
   begin

      // se chegou no limite de tentativas, mostra tela para usuario
      if (tentativas_conexao > nr_tentativas_conexao) then
      begin
         Parametros.titulo := 'Encontrada uma inconsistência no sistema!';
         Parametros.opcoes := (BT_OK + ICO_ERROR);
         Parametros.mensagens.msgPrincipal := 'Falha na conexão: o UNIMESTRE não está mais conseguindo se conectar ao banco de dados. O sistema será fechado.';
         Parametros.dimensao.altura := 250;
         Parametros.dimensao.largura := 600;
         Parametros.snErroBanco := true;

         tentativas_conexao := 0;

         FormularioErro := TfrmMensagem.create(nil, parametros);
         FormularioErro.btnReconectar.Visible := true;  
         FormularioErro.ShowModal;

         FormularioErro.setValores(
            Pointer(self),
            self.MethodAddress('tratarErroBanco')
         );


      end
      else
      begin
         // apenas abre a tela para rechamar esta funcao
         Parametros.titulo := 'Encontrada uma inconsistência no sistema!';
         Parametros.opcoes := (BT_OK + ICO_ERROR);
         Parametros.mensagens.msgPrincipal := 'Falha na conexão: o UNIMESTRE não está mais conseguindo se conectar ao banco de dados. O sistema será fechado.';
         Parametros.dimensao.altura := 250;
         Parametros.dimensao.largura := 600;
         Parametros.snErroBanco := true;

         FormularioErro := TfrmMensagem.create(nil, parametros);
         FormularioErro.Show;

         FormularioErro.setValores(
            Pointer(self),
            self.MethodAddress('tratarErroBanco')
         );

         FormularioErro.btnReconectar.Visible := false;
         FormularioErro.btnReconectarClick(Sender);
      end;
   end;



end;


procedure TfPrincipal.FormShow(Sender: TObject);
begin

   if not DM.GetUsuarioLogado.TemPermissao(
         DM.GetUsuarioLogado.Pessoa.Codigo, 'ProvaOnline.Desktop.Acesso', npAcesso, True) then
   begin
      Application.Terminate;
   end;         

   // Configura título do módulo
   Caption := Format('%s - %s - (%s)', [Application.Title, DM.conn.HostName,
      UUtils.GetVersion]);

   // Caption para apresentar login do usuário logado no canto da tela.
   sbUsuario.Caption := Format('Usuário: %s',
         [DM.GetUsuarioLogado.Pessoa.Login]);
end;

procedure TfPrincipal.sbUsuarioClick(Sender: TObject);
var
   I: Integer;
begin
   if TLoginManager.GetInstancia().RealizarLogin(False, False) then
   begin
      for I := MDIChildCount - 1 downto 0 do
         MDIChildren[I].Close;
      sbUsuario.Caption := Format('Usuário: %s',
         [DM.GetUsuarioLogado.Pessoa.Login]);
   end
   else
   begin
      Close;
   end;
end;

procedure TfPrincipal.stbOpcoesDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   case Panel.Index of
      0:
         begin
            sbUsuario.Top := Rect.Top;
            sbUsuario.Left := Rect.Left;
            sbUsuario.Width := Rect.Right - Rect.Left;
            sbUsuario.Height := Rect.Bottom - Rect.Top;
         end;
      1:
         begin
            sbServidor.Top := Rect.Top;
            sbServidor.Left := Rect.Left;
            sbServidor.Width := Rect.Right - Rect.Left;
            sbServidor.Height := Rect.Bottom - Rect.Top;
         end;
      2:
         begin
            sbDataHora.Top := Rect.Top;
            sbDataHora.Left := Rect.Left;
            sbDataHora.Width := Rect.Right - Rect.Left;
            sbDataHora.Height := Rect.Bottom - Rect.Top;
         end;
   end;
end;

end.
