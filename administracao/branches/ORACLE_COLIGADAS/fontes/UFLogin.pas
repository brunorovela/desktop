unit UFLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, UDM, Buttons, jpeg;

type
   TfLogin = class(TForm)
      ledUsuario: TLabeledEdit;
      ledSenha: TLabeledEdit;
      pnlLogo: TPanel;
      imLogo: TImage;
      bvlSep1: TBevel;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure ledUsuarioChange(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure ledSenhaKeyPress(Sender: TObject; var Key: Char);
      procedure ledUsuarioKeyPress(Sender: TObject; var Key: Char);
   private
      FAttemptCount: Byte;
      FFinalize: Boolean;
      FLogged: Boolean;
      function IsLogged: Boolean;
      function Logon: Boolean;
      procedure SetLogged(const Value: Boolean);
   public
      property Logged: Boolean read IsLogged write SetLogged;
   end;

var
   fLogin: TfLogin;

implementation

const
   SActionKey = 'Modulo.Acesso';

{$R *.dfm}

procedure TfLogin.bbtnCancelarClick(Sender: TObject);
begin
   FFinalize := True;
   Close;
end;

procedure TfLogin.bbtnConfirmarClick(Sender: TObject);
begin
   FFinalize := False;
   Close;
end;

procedure TfLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := FFinalize or Logon;
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
   FAttemptCount := 1;
   FFinalize := False;
   FLogged := False;
end;

procedure TfLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
   begin
      FFinalize := True;
      Close;
   end;
end;

procedure TfLogin.FormShow(Sender: TObject);
begin
   ledUsuario.Clear;
   ledSenha.Clear;
   ledUsuario.SetFocus;
end;

function TfLogin.IsLogged: Boolean;
begin
   Result := FLogged;
end;

procedure TfLogin.ledSenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      FFinalize := False;
      Key := #0;
      Close;
   end;
end;

procedure TfLogin.ledUsuarioChange(Sender: TObject);
begin
   bbtnConfirmar.Enabled := (Trim(ledUsuario.Text) <> EmptyStr) and
      (Trim(ledSenha.Text) <> EmptyStr);
end;

procedure TfLogin.ledUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      ledSenha.SetFocus;
      Key := #0;
   end;
end;

function TfLogin.Logon: Boolean;
const
   SCapAttention = 'Atenção';
   SMsgInvalidUserPass = 'Usuário e/ou senha inválido(s)';
   SMsgAccessDenied = 'Acesso negado.';
begin
   Result := DM.Logon(ledUsuario.Text, ledSenha.Text);
   FLogged := Result;
   
   if not FLogged then
   begin
      MessageBox(Handle, PChar(SMsgInvalidUserPass), PChar(SCapAttention),
         MB_OK + MB_ICONWARNING);
      Inc(FAttemptCount);
      Result := False;
      
      if FAttemptCount > 2 then
         FFinalize := True
      else
      begin
         ledUsuario.SetFocus;
         ledUsuario.SelectAll;
      end;
   end
   else
   begin
      Result := DM.RequestPermission(SActionKey, plAccess, False, Handle);
      FLogged := Result;
      if not Result then
         MessageBox(Handle, PChar(SMsgAccessDenied), PChar(Application.Title),
             MB_OK + MB_ICONEXCLAMATION);
   end;
end;

procedure TfLogin.SetLogged(const Value: Boolean);
begin
   FLogged := Value;
end;

end.
