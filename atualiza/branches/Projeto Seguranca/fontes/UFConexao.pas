unit UFConexao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Buttons;

type
   TfConexao = class(TForm)
      ledServidor: TLabeledEdit;
      ledBanco: TLabeledEdit;
      ledProtocolo: TLabeledEdit;
      ledUsuario: TLabeledEdit;
      ledPorta: TLabeledEdit;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      lbMensagemUsuarioInvalido: TLabel;
    lbMensagemUsuarioInvalidoSolucao: TLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   public
      class function ConfirmConnection: Boolean;
   end;

implementation

uses
   UDM, ZConnection;

{$R *.dfm}

class function TfConexao.ConfirmConnection: Boolean;
var
   fConexao: TfConexao;
begin
   Application.CreateForm(TfConexao, fConexao);
   try
      Result := fConexao.ShowModal = mrOk;
   finally
      fConexao.Free;
   end;
end;

procedure TfConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfConexao.FormCreate(Sender: TObject);
var
   strUsuario: string;
begin
   ledServidor.Text := DM.connUnimestre.HostName;
   ledPorta.Text := Format('%d', [DM.connUnimestre.Port]);
   ledBanco.Text := DM.connUnimestre.Database;
   ledProtocolo.Text := DM.connUnimestre.Protocol;
   ledUsuario.Text := DM.connUnimestre.User;

   // Atribui o usuário do campo na variável para verificarmos
   strUsuario := ledUsuario.Text;

   {
    Não permite atualizar, se o usuário configurado para atualização
    não for o usuário "atualizacao..." ou "backup...",
    onde "..." é o código do cliente no UniControle quando for
    DC Compartilhado.

    Apenas os usuários de "atualizacao..." e "backup..." tem permissões de
    rodar os atualizas completamente.
   }

   bbtnConfirmar.Enabled := false;
   lbMensagemUsuarioInvalido.Visible := true;
   lbMensagemUsuarioInvalidoSolucao.Visible := true;

   if (ansipos('backup', strUsuario) > 0) or (ansipos('atualizacao', strUsuario) > 0) then
   begin
      bbtnConfirmar.Enabled := true;
      lbMensagemUsuarioInvalido.Visible := false;
      lbMensagemUsuarioInvalidoSolucao.Visible := false;

      {
       Faz ajuste de layout, porque se a mensagem não aparece o
       tamanho do form diminui, bem como a distancia do botão de OK e Cancelar
      }
      bbtnConfirmar.Top := 195;
      bbtnCancelar.Top := 195;
      Self.Height := 260;
   end;

   Application.NormalizeTopMosts;
   SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

end.
