unit UFLogin;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, DB, ZAbstractRODataset,
   UZDataset;

const
   MaxAuthAttempts = 3;

type
   ///   <summary>Enumeração que contém as possibilidades de resultado em uma
   ///   tentativa de autenticação do usuário no banco de dados. Os seguintes
   ///   retornos à tentativa de autenticação são previstos:
   ///
   ///   <c>lrInvalidUserOrPass</c>: indica que o nome do usuário e/ou senha
   ///   informados são inválidos;
   ///   <c>lrLockedUser</c>: indica que o usuário informado teve acesso
   ///   bloqueado ao sistema;
   ///   <c>lrForbidden</c>: indica que o usuário não possui privilégios para
   ///   acesso ao módulo;
   ///   <c>lrSuccess</c>: indica que o usuário foi autenticado com sucesso no
   ///   banco de dados.
   ///   </summary>
   TLogonResult = (lrInvalidUserOrPass, lrLockedUser, lrForbidden, lrSuccess);

   TfLogin = class(TForm)
      bvlSep1: TBevel;
      ledUsuario: TLabeledEdit;
      ledSenha: TLabeledEdit;
      pnlLogo: TPanel;
      imLogo: TImage;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryBuscaPessoa: TUMZReadOnlyQuery;
      qryBuscaPessoaCD_PESSOA: TIntegerField;
      qryBuscaPessoaSN_BLOQUEADO: TSmallintField;
      qryBuscaPermissao: TUMZReadOnlyQuery;
      qryBuscaPermissaoNR_PERMISSAO: TIntegerField;
      dsBuscaPessoa: TDataSource;
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure ledSenhaChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure ledSenhaKeyPress(Sender: TObject; var Key: Char);
      procedure ledUsuarioKeyPress(Sender: TObject; var Key: Char);
      procedure FormCreate(Sender: TObject);
   private
      FAttempts: Byte;
      class var FLoggedUser: string;

      ///   <summary>Verifica se usuário e senha informados existem no banco de
      ///   dados e se possui permissão para acessar o módulo.</summary>
      ///
      ///   <param name="User">Código ou login do usuário que deseja realizar
      ///   a autenticação</param>
      ///   <param name="Pass">Senha do usuário para realizar a autenticação
      ///   </param>
      ///
      ///   <returns>Retorna um valor do tipo <c>TLogonResult</c> indicando o
      ///   resultado na tentativa de autenticação no banco de dados.</returns>
      function DoLogon(const User, Pass: string): TLogonResult;

   public
   
      ///   <summary>Método estático utilizado para tentar realizar a
      ///   autenticação do usuário no banco de dados.</summary>
      ///
      ///   <returns>Retorna valor lógico <c>True</c> caso a autenticação tenha
      ///   sido bem sucedida ou <c>False</c> caso contrário.</returns>
      class function Logon: Boolean;

      class function GetLoggedUser: string;
   end;

implementation

{$R *.dfm}

{ TfLogin }

procedure TfLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
   SInfoCaption = 'Informação';
   SMsgInvalidUserPass = 'Usuário e/ou senha inválido(s).';
   SMsgLockedUser = 'Usuário bloqueado para acesso ao sistema.';
   SMsgForbidden = 'Usuário não possui permissão para acesso a funcionalidade.';
var
   User, Pass, Msg: string;
   LogonResult: TLogonResult;
begin
   if ModalResult = mrOk then
   begin
      if FAttempts < MaxAuthAttempts then
      begin
         Inc(FAttempts);
         FLoggedUser := ledUsuario.Text;
         User := ledUsuario.Text;
         Pass := ledSenha.Text;
         LogonResult := DoLogon(User, Pass);
         case LogonResult of
            lrInvalidUserOrPass: Msg := SMsgInvalidUserPass;
            lrLockedUser: Msg := SMsgLockedUser;
            lrForbidden: Msg := SMsgForbidden;
         end;
         if LogonResult <> lrSuccess then
         begin
            if FAttempts < MaxAuthAttempts then
            begin
               ModalResult := mrNone;
               CanClose := False;
               MessageBox(Handle, PChar(Msg), PChar(SInfoCaption),
                     MB_ICONINFORMATION or MB_OK);
            end
            else
            begin
               ModalResult := mrCancel;
               CloseModal;
            end;
         end;
      end
      else
      begin
         ModalResult := mrCancel;
         CloseModal;
      end;
   end;
end;

procedure TfLogin.FormCreate(Sender: TObject);
begin
   FAttempts := 0;
   Application.NormalizeTopMosts;
   SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
end;

class function TfLogin.GetLoggedUser: string;
begin
   Result := FLoggedUser;
end;

procedure TfLogin.ledSenhaChange(Sender: TObject);
begin
   bbtnConfirmar.Enabled := (Trim(ledUsuario.Text) <> EmptyStr) and
         (Trim(ledSenha.Text) <> EmptyStr);
end;

procedure TfLogin.ledSenhaKeyPress(Sender: TObject; var Key: Char);
const
   SInfoCaption = 'Informação';
   SMsgInvalidUserPass = 'Usuário e/ou senha inválido(s).';
   SMsgLockedUser = 'Usuário bloqueado para acesso ao sistema.';
   SMsgForbidden = 'Usuário não possui permissão para acesso a funcionalidade.';
var
   User, Pass, Msg: string;
   LogonResult: TLogonResult;
begin
   if Key = #13 then
   begin
      Key := #0;
      if FAttempts < MaxAuthAttempts then
      begin
         Inc(FAttempts);
         FLoggedUser := ledUsuario.Text;
         User := ledUsuario.Text;
         Pass := ledSenha.Text;
         LogonResult := DoLogon(User, Pass);
         case LogonResult of
            lrInvalidUserOrPass: Msg := SMsgInvalidUserPass;
            lrLockedUser: Msg := SMsgLockedUser;
            lrForbidden: Msg := SMsgForbidden;
         end;
         if LogonResult = lrSuccess then
         begin
            ModalResult := mrOk;
            CloseModal;
         end
         else
         begin
            if FAttempts < MaxAuthAttempts then
            begin
               MessageBox(Handle, PChar(Msg), PChar(SInfoCaption),
                  MB_ICONINFORMATION or MB_OK);
               ModalResult := mrNone;
            end
            else
            begin
               ModalResult := mrCancel;
               CloseModal;
            end;
         end;
      end
      else
      begin
         ModalResult := mrCancel;
         CloseModal;
      end;
   end;
end;

procedure TfLogin.ledUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      ledSenha.SetFocus;
   end;
end;

class function TfLogin.Logon: Boolean;
var
   fLogin: TfLogin;
begin
   Application.CreateForm(TfLogin, fLogin);
   try
      Result := fLogin.ShowModal = mrOk;
   finally
      fLogin.Free;
   end;
end;

function TfLogin.DoLogon(const User, Pass: string): TLogonResult;
begin
   qryBuscaPessoa.Close;
   qryBuscaPessoa.ParamByName('DS_LOGIN').AsString := User;
   qryBuscaPessoa.ParamByName('DS_SENHA').AsString := Pass;
   qryBuscaPessoa.Open;
   qryBuscaPermissao.Open;

   if qryBuscaPessoa.IsEmpty then
      Result := lrInvalidUserOrPass
   else if qryBuscaPessoaSN_BLOQUEADO.AsInteger = 1 then
      Result := lrLockedUser
   else if qryBuscaPermissao.IsEmpty then
      Result := lrForbidden
   else
      Result := lrSuccess;

   qryBuscaPermissao.Close;
   qryBuscaPessoa.Close;
end;

end.
