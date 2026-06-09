unit uFLogin;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, DB, ZAbstractRODataset, uDMConexao, UZDataset,
  ZDataset, ZAbstractDataset, Buttons, jpeg;

type
   TfLogin = class(TForm)
    bvlSep1: TBevel;
    bvlSep2: TBevel;
    pnlLogo: TPanel;
    Image1: TImage;
    pnlLogin: TPanel;
    pnlBotoes: TPanel;
    bbtnConfirmar: TBitBtn;
    bitCancelar: TBitBtn;
    ledUsuario: TLabeledEdit;
    ledSenha: TLabeledEdit;
    qyLogin: TUMZQuery;
    procedure bitCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
   published
      procedure ConfirmaUsuario(Sender: TObject; var Key: Char);
      procedure ConfirmaSenha(Sender: TObject; var Key: Char);
      procedure ProcessaTeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
   strict private
      procedure Confirma;
   private
      constructor Create(AOwner: TComponent; AConn: TUMConexao);
   public
      class function Autentica(AOwner: TComponent; AConn: TUMConexao): boolean;
   end;

var
   fLogin: TfLogin;

implementation

{$R *.dfm}

{ TfLogin }

class function TfLogin.Autentica(AOwner: TComponent; AConn: TUMConexao): boolean;
var
   i: integer;
begin
   i := 0;
   Result := false;
   if not Assigned(fLogin) then
      fLogin := TfLogin.Create(AOwner, AConn);
   try
      while fLogin.ShowModal = mrCancel do
      begin
         if i = 2 then Exit;
         fLogin.ledSenha.SelectAll;
         Inc(i);
      end;
      Result := true;
   finally
      FreeAndNil(fLogin);
   end;
end;

procedure TfLogin.bbtnConfirmarClick(Sender: TObject);
begin
   Confirma;
end;

procedure TfLogin.bitCancelarClick(Sender: TObject);
begin
   Application.Terminate;
   Application.ProcessMessages;
end;

procedure TfLogin.Confirma;
const
   BoolToMR: array[boolean] of TModalResult = (mrOk, mrCancel);
begin
   qyLogin.ParamByName('cd_pessoa').AsString := ledUsuario.Text;
   qyLogin.ParamByName('ds_senha').AsString := ledSenha.Text;
   qyLogin.Open;
   try
      ModalResult := BoolToMR[qyLogin.IsEmpty];
      CloseModal;
   finally
      qyLogin.Close;
   end;
end;

procedure TfLogin.ConfirmaSenha(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      Confirma;
end;

procedure TfLogin.ConfirmaUsuario(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      ledSenha.SetFocus;
end;

constructor TfLogin.Create(AOwner: TComponent; AConn: TUMConexao);
begin
   inherited Create(AOwner);
   qyLogin.Connection := AConn.Conn;
end;

procedure TfLogin.ProcessaTeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
   begin
      bitCancelarClick(nil);
   end;
end;

end.
