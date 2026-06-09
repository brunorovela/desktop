unit uTrocarSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Menus, md5;

type
  TfrmTrocarSenha = class(TForm)
    qySenha: TUMZQuery;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNovaSenha2: TEdit;
    edNovaSenha1: TEdit;
    edSenhaAtual: TEdit;
    qySenhads_senha: TStringField;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure edSenhaAtualKeyPress(Sender: TObject; var Key: Char);
    procedure edNovaSenha1KeyPress(Sender: TObject; var Key: Char);
    procedure edNovaSenha2KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    function Troca:boolean;
  private
    bFecha : boolean;
  public
    { Public declarations }
  end;

var
  frmTrocarSenha: TfrmTrocarSenha;

implementation

uses Main, uDM, uFSelecionarCurso, Math;

{$R *.DFM}

procedure TfrmTrocarSenha.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmTrocarSenha.FormShow(Sender: TObject);
begin
   bFecha := False;
end;

procedure TfrmTrocarSenha.edSenhaAtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    edNovaSenha1.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmTrocarSenha.bbtnCancelarClick(Sender: TObject);
begin
   bFecha := True;
   Close;
end;

procedure TfrmTrocarSenha.bbtnConfirmarClick(Sender: TObject);
var
   teclado : char;
begin
   teclado := #13;

   edNovaSenha2KeyPress(nil,teclado);
end;

procedure TfrmTrocarSenha.edNovaSenha1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    edNovaSenha2.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmTrocarSenha.edNovaSenha2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfrmTrocarSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin
    edSenhaAtual.Text := '';
    edNovaSenha1.Text := '';
    edNovaSenha2.Text := '';
    Close;
  end;
end;

procedure TfrmTrocarSenha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

      if Troca then
          Begin
            CanClose := True;
          End
      else CanClose := False;

end;

function TfrmTrocarSenha.Troca:boolean;
var
  qrySenha : TUMZQuery;
begin
   if ( bFecha ) then 
   begin
      result := true;
      Exit;   
   end;

  dm.CriarConsulta(qrySenha);
  if (edSenhaAtual.Text = '') AND (edNovaSenha1.Text = '') AND (edNovaSenha2.Text = '') then
    result:= true
  else begin

    qySenha.Close;
    qySenha.ParamByName('nome').AsString := DM.sLogin;
    qySenha.ParamByName('senha').AsString := MD5Print(MD5String(edSenhaAtual.Text));
    qySenha.Open;

    if qySenha.Eof then begin
      if Mensagem('Senha atual incorreta !'+chr(13)+'Deseja tentar novamente ?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes then
        result:=true
      else begin
        edSenhaAtual.Text := '';
        edSenhaAtual.SetFocus;
        result:= false;
      end;
    end else begin

      if ( edNovaSenha1.Text <> edNovaSenha2.Text ) then begin
        if Mensagem('Nova senha e Repita a nova senha devem ser iguais !'+chr(13)+'Deseja tentar novamente ?',  'Confirmação', MB_YESNO + MB_ICONQUESTION ) <> mrYes then
          result:=true
        else begin
          edNovaSenha1.Text := '';
          edNovaSenha2.Text := '';
          edNovaSenha1.SetFocus;
          result:= false;
        end;
      end else begin

        qrySenha.SQL.Text :=  ' UPDATE PESSOAS SET DS_SENHA = '
                              +''''+MD5Print(MD5String(edNovaSenha2.Text))+''''+
                              ' WHERE cd_pessoa ='+IntToStr(DM.iCdPessoaLogado);

        qrySenha.ExecSQL;

        Mensagem( 'Senha alterada com sucesso!', '', MB_OK + MB_ICONEXCLAMATION );
        
         // < Grava o log da alteração da senha >
        DM.setLog(
         35,
         'Alteração',
         'AlteracaoSenhaViaModuloAcademico',
         DM.UsuarioLogado.ColigadaLogada,
         'Alteração de senha efetuada pelo usuário: '
         + IntToStr(DM.GetUsuarioLogado.Pessoa.Codigo)
         + ' via Módulo Acadêmico[Configurações > Trocar Senha].'
        );
        // </Grava o log da alteração da senha >

        Result := true;

      end;
    end;
  end;
end;

end.

