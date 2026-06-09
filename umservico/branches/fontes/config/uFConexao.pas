unit uFConexao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Spin, ImgList, ComCtrls, ToolWin, Buttons,
   ZConnection, uSvcConfClasses, ZAbstractRODataset, uDMConexao, Inifiles,
   UZStartConnection, uUMAuth;

type
   TfConexao = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   published
      ledServidor: TLabeledEdit;
      ledUsuario: TLabeledEdit;
      ledBanco: TLabeledEdit;
      ledSenha: TLabeledEdit;
      pnTitulo: TPanel;
      lbPorta: TLabel;
      sePorta: TSpinEdit;
      lbProtocolo: TLabel;
      cbProtocolos: TComboBox;
      liImagens: TImageList;
      tbOpcoes: TToolBar;
      bnSep1: TToolButton;
      bnSalvar: TToolButton;
      bnSep2: TToolButton;
      bnCancelar: TToolButton;
      bnSep3: TToolButton;
      bnTestarConexao: TSpeedButton;
      lbStatusConexao: TLabel;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure bnCancelarClick(Sender: TObject);
      procedure bnSalvarClick(Sender: TObject);
      procedure bnTestarConexaoClick(Sender: TObject);
      procedure startConnDefaultConnection(Sender: TObject);
   private
      iniConexao: TIniFile;
      section: String;

      constructor Create(AOwner: TComponent; var ASlDadosConn: TStringList;
         const ASDescricaoBanco: string);
   public

      class function GetDadosConexao(AOwner: TComponent;
         var ASlDadosConn: TStringList;
         const ASDescricaoBanco: string; AIniFile: TIniFile = nil): boolean;
   end;

var
   fConexao: TfConexao;

implementation

{$R *.dfm}

{ TfConexao }

procedure TfConexao.bnCancelarClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   CloseModal;
end;

procedure TfConexao.bnSalvarClick(Sender: TObject);
begin
   ModalResult := mrOk;
   CloseModal;
end;

procedure TfConexao.bnTestarConexaoClick(Sender: TObject);
var
//   stConexao: TStringList;
   conexaoInicial: TUMZStartConnection;
   conexaoTest: TZConnection;
begin
   try
      try
//         stConexao := TStringList.Create;
//
//         stConexao.Values[CONN_SERVIDOR] := fConexao.ledServidor.Text;
//         stConexao.Values[CONN_PORTA] := Format('%d', [fConexao.sePorta.Value]);
//         stConexao.Values[CONN_BANCO] := fConexao.ledBanco.Text;
//         stConexao.Values['protocol'] := fConexao.cbProtocolos.Text;
//         stConexao.Values[CONN_USUARIO] := fConexao.ledUsuario.Text;
//         stConexao.Values[CONN_SENHA] := fConexao.ledSenha.Text;

         conexaoInicial := TUMZStartConnection.Create(nil);
         conexaoTest := TZConnection.Create(nil);
         conexaoInicial.Connection := conexaoTest;

         conexaoInicial.Active := fConexao.iniConexao.ReadBool(Self.section, 'Usa.Start', False);

         conexaoInicial.IniProps.ProtocolIdent := CONN_PROTOCOLO;
         conexaoInicial.IniProps.SectionName := Self.section;
         conexaoInicial.IniProps.HostNameIdent := CONN_SERVIDOR;
         conexaoInicial.IniProps.PortIdent := CONN_PORTA;
         conexaoInicial.IniProps.DatabaseIdent := CONN_BANCO;
         conexaoInicial.IniProps.UserIdent := CONN_USUARIO;
         conexaoInicial.IniProps.PasswordIdent := CONN_SENHA;
         conexaoInicial.UnimestreUser := 'umsistema';
         conexaoInicial.DefaultConnection := startConnDefaultConnection; 

         conexaoInicial.IniPath := fConexao.iniConexao.FileName;
         conexaoInicial.ConnectUnimestre;
      except
         on E: Exception do;
      end;
      
      if conexaoInicial.Connection.Connected then
      begin
         lbStatusConexao.Caption := 'Conexão estabelecida com sucesso.';
         lbStatusConexao.Font.Color := clGreen;
         lbStatusConexao.Font.Style := [fsBold];
      end
      else
      begin
         lbStatusConexao.Caption := 'Não há conexão com o banco de dados.';
         lbStatusConexao.Font.Color := clRed;
         lbStatusConexao.Font.Style := [fsBold];
      end;
      
      lbStatusConexao.Visible := true;
      
      conexaoInicial.Disconnect;
   finally
      FreeAndNil(conexaoInicial);
   end;
end;

constructor TfConexao.Create(AOwner: TComponent;
   var ASlDadosConn: TStringList; const ASDescricaoBanco: string);
var
   I: integer;
begin
   inherited Create(AOwner);
   pnTitulo.Caption := 'CONFIGURAR CONEXÃO - ' + AnsiUpperCase(ASDescricaoBanco);
   ledServidor.Text := ASlDadosConn.Values[CONN_SERVIDOR];
   sePorta.Value := StrToInt(ASlDadosConn.Values[CONN_PORTA]);
   ledBanco.Text := ASlDadosConn.Values[CONN_BANCO];
   for I := 0 to cbProtocolos.Items.Count - 1 do
      if cbProtocolos.Items.Strings[I] = ASlDadosConn.Values[CONN_PROTOCOLO] then
      begin
         cbProtocolos.ItemIndex := I;
         Break;
      end;
   ledUsuario.Text := ASlDadosConn.Values[CONN_USUARIO];
   ledSenha.Text := ASlDadosConn.Values[CONN_SENHA];
end;

procedure TfConexao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfConexao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F5:
         bnSalvarClick(nil);
      VK_F6:
         bnCancelarClick(nil);
   end;
end;

class function TfConexao.GetDadosConexao(AOwner: TComponent;
   var ASlDadosConn: TStringList; const ASDescricaoBanco: string; AIniFile: TIniFile = nil): boolean;
begin
   if not Assigned(fConexao) then
   begin
      fConexao := TfConexao.Create(AOwner, ASlDadosConn, ASDescricaoBanco);
      fConexao.iniConexao := AIniFile;
      fConexao.section := ASDescricaoBanco;
   end;
   
   try
      case fConexao.ShowModal of
         mrOk:
         begin
            Result := true;
            ASlDadosConn.Values[CONN_SERVIDOR] := fConexao.ledServidor.Text;
            ASlDadosConn.Values[CONN_PORTA] := Format('%d', [fConexao.sePorta.Value]);
            ASlDadosConn.Values[CONN_BANCO] := fConexao.ledBanco.Text;
            ASlDadosConn.Values[CONN_PROTOCOLO] := fConexao.cbProtocolos.Text;
            ASlDadosConn.Values[CONN_USUARIO] := fConexao.ledUsuario.Text;
            ASlDadosConn.Values[CONN_SENHA] := fConexao.ledSenha.Text;
         end;
         mrCancel:
            Result := false;
      end;
   finally
      FreeAndNil(fConexao);
   end;
end;

procedure TfConexao.startConnDefaultConnection(Sender: TObject);
var
   ConnIni: TIniFile;
   User, Pass, Host, Protocol, Database, Port: string;
begin
   ConnIni := TIniFile.Create(TUMZStartConnection(Sender).IniPath);

   with TUMZStartConnection(Sender).IniProps do
   try
      TUMZStartConnection(Sender).Connection.HostName := ConnIni.ReadString(SectionName, HostNameIdent, 'localhost');
      TUMZStartConnection(Sender).Connection.User := ConnIni.ReadString(SectionName, UserIdent, 'academico');
      TUMZStartConnection(Sender).Connection.Protocol := ConnIni.ReadString(SectionName, ProtocolIdent, 'mysql-5');
      TUMZStartConnection(Sender).Connection.Port := ConnIni.ReadInteger(SectionName, PortIdent, 0);
      TUMZStartConnection(Sender).Connection.Database := ConnIni.ReadString(SectionName, DatabaseIdent, 'unimestre');
      TUMZStartConnection(Sender).Connection.Password := TUMAuthCryptography.crypt(ConnIni.ReadString(SectionName, PasswordIdent, '07033DFB035AFB2FDC'), actDecode);

      TUMZStartConnection(Sender).Connection.Connect;
   finally
      ConnIni.Free;
   end;
end;

end.
