unit uSenha;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, md5;

type
  Tipo_Acesso = (taIncluir, taAlterar, taDeletar, taAcessar, taEspecial);

  TfrmSenha = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    imLogo: TImage;
    procedure FormDestroy(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure txtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function Login : Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    bytVezes : Byte;
    { Private declarations }
  public
    intTipo : Byte;
   function Autorizar( intModulo : Integer; TipoAcesso : Tipo_Acesso ) : Boolean;
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;

implementation

uses uDM;

{$R *.DFM}


procedure TfrmSenha.CancelBtnClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmSenha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  case intTipo of
    0 : begin { Login de Entrada }
      if Login then CanClose := True else CanClose := False;
    end;
  end;
end;

procedure TfrmSenha.txtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    txtSenha.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSenha.txtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfrmSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Application.Terminate;
end;

function TfrmSenha.Login : Boolean;
{ Verificação do Login e da Senha do Usuário }
begin
  Result := True;
  if DM.FindUser(txtUsuario.Text) then //localizado o usuário
  begin
    { Testar Senha }
    
    if MD5Print(MD5String(txtSenha.Text)) <> DM.tblUsuariosNomeSenha.Text then
    begin
      Mensagem( 'Senha inválida.', Application.Title, MB_OK + MB_ICONSTOP );
      txtSenha.SetFocus;
      if bytVezes = 3 then Application.Terminate;
      Inc( bytVezes );
      Result := False;
      txtSenha.SetFocus;
      txtSenha.SelectAll;
    end;
    { Verificar se o usuário pode entrar }
    if not Dm.isTrue(DM.tblUsuariosNomeOnLine.AsString) then
    begin
      Mensagem( 'Este usuário está bloqueado para acesso ao sistema.', Application.Title,
		MB_OK + MB_ICONSTOP );
      Application.Terminate;
      Exit;
    end;
  end
  else
  begin
    Mensagem( 'Usuário não cadastrado.', Application.Title, MB_OK + MB_ICONSTOP );
    Result := False;
    {CanClose := }
    txtUsuario.SetFocus;
    txtUsuario.SelectAll;
  end;
end;

procedure TfrmSenha.FormCreate(Sender: TObject);
begin
  intTipo := 0;
end;

procedure TfrmSenha.FormDestroy(Sender: TObject);
begin
   frmSenha := nil;
end;

function TfrmSenha.Autorizar( intModulo : Integer; TipoAcesso : Tipo_Acesso ) : Boolean;
  { Verificação de Permissão de Acesso a cada Módulo }
begin
  intTipo := 1;
  Result := True;

  DM.tblModulosUsuarios.Close;
    DM.tblModulosUsuarios.ParamByName('codigousuario').AsInteger := DM.tblUsuariosNomeCodigo.AsInteger;
    DM.tblModulosUsuarios.ParamByName('codigomodulo').AsInteger := intModulo;
  DM.tblModulosUsuarios.Open;

  case TipoAcesso of
      taIncluir : Begin
		      if not Dm.isTrue(Dm.tblModulosUsuariosIncluir.AsString) Then
			 Begin
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
		      if not Dm.isTrue(Dm.tblModulosUsuariosAlterar.AsString) Then
			 Begin
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
		      if not Dm.isTrue(Dm.tblModulosUsuariosDeletar.AsString) Then
			 Begin
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
		      if not Dm.isTrue(Dm.tblModulosUsuariosIncluir.AsString) Then
			 Begin
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
		      if not Dm.isTrue(Dm.tblModulosUsuariosIncluir.AsString) Then
			 Begin
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

procedure TfrmSenha.FormShow(Sender: TObject);
begin
  bytVezes := 1;
  frmSenha.Caption := DM.variavel_parametro('cliente_nome_fantasia') + ' - [' + ODBCInfo('Server') + ']';
  txtUsuario.Text := '';
  txtSenha.Text := '';
  txtUsuario.SetFocus;
end;


procedure TfrmSenha.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;

end.

