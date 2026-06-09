{
#TIT= Senha
#OBJ= Capturar para verificar o nome de usuário e senha. Para não haver acesso indevido ao sistema.
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uSenha;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, md5;

type
  Tipo_Acesso = (taIncluir, taAlterar, taDeletar, taAcessar, taEspecial);
  TPasswordDlg = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure txtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
  private
    bytVezes : Byte;  
    procedure Login();
    function PodeEntrar(): Boolean;

    { Private declarations }
  public
    intTipo : Byte;
    autologin : boolean;
    Logado : boolean;
   function Autorizar( intModulo : Integer; TipoAcesso : Tipo_Acesso; responder : boolean ) : Boolean;
    { Public declarations }

   function EfetuaLogin(): Boolean;
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses 
  uDM;

{$R *.DFM}


procedure TPasswordDlg.txtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    txtSenha.SetFocus;
    Key := #0;
  end;
end;

procedure TPasswordDlg.txtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Login();
    Key := #0;
  end;
end;

procedure TPasswordDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Self.ModalResult := mrCancel;
    Self.CloseModal();
  end;
end;
{
procedure TPasswordDlg.Login1();
 Verificação do Login e da Senha do Usuário
begin
  if DM.FindUser(txtUsuario.Text) then //localizado o usuário
  begin
    //estar Senha

    if MD5Print(MD5String(txtSenha.Text)) <> DM.qyUsuariosNome.FieldByName('Senha').Text then
    begin
      Mensagem( 'Senha inválida.', Application.Title, MB_OK + MB_ICONSTOP );
      if bytVezes >= 3 then
      begin
        ModalResult := mrCancel;
        Close();
      end
      else
      begin
        Inc( bytVezes );
        txtSenha.SelectAll();
        Exit;
      end;
    end;
    // Verificar se o usuário pode entrar 
    if not Dm.isTrue(DM.qyUsuariosNome.FieldByName('OnLine').AsString) then
    begin
      Mensagem( 'Este usuário está bloqueado para acesso ao sistema.', Application.Title,
   		MB_OK + MB_ICONSTOP );
      ModalResult := mrCancel;
      Close();
    end
    else
    begin
      Self.ModalResult := mrOk;
      Self.Close(); 
    end;

  end
  else
  begin
    Mensagem( 'Usuário não cadastrado.', Application.Title, MB_OK + MB_ICONSTOP );
    //CanClose := 
    txtUsuario.SelectAll();
  end;
  
end;
}

function TPasswordDlg.PodeEntrar(): Boolean;
begin
  if not Dm.isTrue(DM.qyUsuariosNome.FieldByName('OnLine').AsString) then begin
    Mensagem( 'Este usuário está bloqueado para acesso ao sistema.', Application.Title, MB_OK + MB_ICONSTOP );
    Result := False;
  end
  else begin
    Result := True;
  end;
end;



procedure TPasswordDlg.Login();
begin
  //checa numero de vezes erros!!
  if bytVezes > 3 then
  begin
    Self.ModalResult := mrCancel;
    Self.CloseModal();
    Exit;
  end;

  //verifica nome de usuario
  if DM.FindUser(txtUsuario.Text) then begin

    //verifica a senha
    if MD5Print(MD5String(txtSenha.Text)) <> DM.qyUsuariosNome.FieldByName('Senha').Text then begin

      //senha invalida
      Mensagem( 'Senha inválida.', Application.Title, MB_OK + MB_ICONSTOP );
      Inc( bytVezes );
      txtSenha.SelectAll();
    end
    else begin
      //usuario e senha aceitos, faz outras verificacoes.
      if not Self.PodeEntrar() then begin
        Self.ModalResult := mrCancel;
        Self.CloseModal();
        Exit;
      end;

      //libera o cara
      Self.ModalResult := mrOk;
      Self.CloseModal();
  
    end;  

  end 
  else begin
    Mensagem( 'Usuário não cadastrado.', Application.Title, MB_OK + MB_ICONSTOP );
    Inc(bytVezes);
    txtUsuario.SelectAll();
    txtSenha.Text := ''; 
    txtusuario.SetFocus();
  end;
end;

function TPasswordDlg.Autorizar( intModulo : Integer; TipoAcesso : Tipo_Acesso; responder : Boolean ) : Boolean;
  { Verificação de Permissão de Acesso a cada Módulo }
begin
  intTipo := 1;
  Result := True;
  DM.qyModulosUsuarios.Close;
  DM.qyModulosUsuarios.ParamByName('codigousuario').AsInteger := DM.qyUsuariosNome.FieldByName('Codigo').AsInteger;
  DM.qyModulosUsuarios.ParamByName('codigomodulo').AsInteger := intModulo;
  DM.qyModulosUsuarios.Open;

  if DM.qyModulosUsuarios.IsEmpty Then
  begin
      if Responder then
        Mensagem( 'Usuário não tem permissão para usar esse módulo.', Application.Title, MB_OK + MB_ICONSTOP );

      Result := False;
      Exit;
  end;

  case TipoAcesso of
      taIncluir : Begin
		      if not Dm.isTrue(Dm.qyModulosUsuarios.FieldByName('Incluir').AsString) Then
			 Begin
			    if responder then
			        Mensagem( 'Usuário não tem permissão de inclusão para este módulo.', Application.Title,
			    MB_OK + MB_ICONSTOP );
			    Result := False;
			 End
		      Else
			 Begin
			     Result := True;
			 End;
		  End;
      taAlterar : Begin
		      if not Dm.isTrue(Dm.qyModulosUsuarios.FieldByName('Alterar').AsString) Then
			 Begin
			    if responder then
	             	       Mensagem( 'Usuário não tem permissão de alteração para este módulo.', Application.Title,
			    MB_OK + MB_ICONSTOP );
			    Result := False;
			 End
		      Else
			 Begin
			     Result := True;
			 End;
		  End;
      taDeletar : Begin
		      if not Dm.isTrue(Dm.qyModulosUsuarios.FieldByName('Deletar').AsString) Then
			 Begin
			    if responder then
			       Mensagem( 'Usuário não tem permissão de exclusão para este módulo.', Application.Title,
			    MB_OK + MB_ICONSTOP );
			    Result := False;
			 End
		      Else
			 Begin
			     Result := True;
			 End;
		  End;
      taAcessar : Begin
		      if not Dm.isTrue(Dm.qyModulosUsuarios.FieldByName('acessar').AsString) Then
			 Begin
			    if responder then
			       Mensagem( 'Usuário não tem permissão de acesso para este módulo.', Application.Title,
			    MB_OK + MB_ICONSTOP );
			    Result := False;
			 End
		      Else
			 Begin
			     Result := True;
			 End;
		  End;
      taEspecial : Begin
		      if not Dm.isTrue(Dm.qyModulosUsuarios.FieldByName('especial').AsString) Then
			 Begin
			    if Responder then
			       Mensagem( 'Usuário não tem permissão para esta operação.', Application.Title,
			    MB_OK + MB_ICONSTOP );
			    Result := False;
			 End
		      Else
			 Begin
			     Result := True;
			 End;
		  End;
  End;
end;

procedure TPasswordDlg.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;


function TPasswordDlg.EfetuaLogin(): Boolean;
begin
  bytVezes := 1;
  PasswordDlg.Caption := Dm.variavel_parametro('cliente_nome_fantasia');

  Self.ShowModal();

  if (Self.ModalResult = mrOk) then
    Result := True
  else
    Result := False;
end;

procedure TPasswordDlg.FormShow(Sender: TObject);
begin
  txtUsuario.Text := '';
  txtSenha.Text := '';
  txtUsuario.SetFocus();
end;

end.

