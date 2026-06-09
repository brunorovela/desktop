unit uAtosOficiais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, uItemCombo, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls, ToolWin;

type
  TfrmAtosOficiais = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    DBCheckBox1: TDBCheckBox;
    Bevel1: TBevel;
    DBMemo1: TDBMemo;
    dtpAto: TDateTimePicker;
    UpDownCursos: TUpDown;
    Label4: TLabel;
    cbUnidades: TComboBox;
    procedure DBEdit6Enter(Sender: TObject);
    procedure UpDownCursosClick(Sender: TObject; Button: TUDBtnType);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frmAtosOficiais: TfrmAtosOficiais;

implementation

uses Main, uDM, uCursos, uUsuario;

{$R *.DFM}

procedure TfrmAtosOficiais.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmAtosOficiais.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmAtosOficiais.UpDownCursosClick(Sender: TObject;
  Button: TUDBtnType);
begin
  if Button = btNext then
  begin
     DBEdit6.text := DM.incrementar_ano_semestre(DBEdit6.Text);
  end
  else
  begin
     DBEdit6.text := DM.decrementar_ano_semestre(DBEdit6.Text);
  end;
end;

procedure TfrmAtosOficiais.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmAtosOficiais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5 : btnSalvarClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmAtosOficiais.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  
end;

{ Verifica o estado da Query que traz as informações dos atos oficiais.
  Se a query está vazia ou trata-se de uma inserção de um novo ato, então exibe
  a data de hoje, caso contrário exibe a data do ato selecionado.

  @author Josimar Zimermann <josimar@unimestre.com>
  @version 28/07/2008
}
procedure TfrmAtosOficiais.FormShow(Sender: TObject);
var
   i : integer;
   estaTodasMatrizes : Boolean;
begin
   if (frmCursos.qyAtosOficiais.State in [dsInsert]) or (frmCursos.qyAtosOficiais.IsEmpty) then
      Self.dtpAto.DateTime := Now
   else
      Self.dtpAto.DateTime := frmCursos.qyAtosOficiais.FieldByName('dt_ato').AsDateTime;
   if DBEdit6.Text = '' then 
      DBEdit6.text := IntToStr(ano_semestre);

   // Preenche a combo de coligadas de acordo com as coligadas do usuário
   cbUnidades.Clear;

   // Verifica se o usuário está em TODAS as coligadas matrizes
   estaTodasMatrizes := DM.UsuarioLogado.TemPermissao(0, 'Academico.CursosTurmas.Cursos.AtosOficiais.TodasUnidades', npAcesso, False);

   if estaTodasMatrizes then
   begin
      cbUnidades.AddItem('Todas', TItemCombo.Create( '0', 'Todas' ));
   end;

   for i := 0 to DM.ArrayColigadasUsuario.Count - 1 do
   begin
      cbUnidades.Items.AddObject(
         TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getDescricao(),
         DM.ArrayColigadasUsuario.Objects[i]
      );

      // Verifica se a coligada selecionada é a coligada que está varrendo
      if StrToInt(TItemCombo(DM.ArrayColigadasUsuario.Objects[i]).getCodigo()) = frmCursos.qyAtosOficiais.FieldByName('cd_coligada').AsInteger then begin
         if estaTodasMatrizes then
            cbUnidades.ItemIndex := i+1
         else
            cbUnidades.ItemIndex := i;

      end

   end;

   if frmCursos.qyAtosOficiais.FieldByName('cd_coligada').AsInteger = 0 then
   begin
      cbUnidades.ItemIndex := 0;
   end;

end;

procedure TfrmAtosOficiais.btnSalvarClick(Sender: TObject);
begin

   if StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo()) <> 0 then begin
      frmCursos.qyAtosOficiais.FieldByName('cd_coligada').AsInteger :=
         StrToInt(TItemCombo(cbUnidades.Items.Objects[cbUnidades.ItemIndex]).getCodigo());
   end;

   frmCursos.qyAtosOficiais.Post;
   frmCursos.qyAtosOficiais.Close;
   frmCursos.qyAtosOficiais.Open;
   Close;
end;

procedure TfrmAtosOficiais.DBEdit6Enter(Sender: TObject);
begin
   Exit;
end;

procedure TfrmAtosOficiais.btnCancelarClick(Sender: TObject);
begin
  frmCursos.qyAtosOficiais.Cancel;
  Close;
end;

procedure TfrmAtosOficiais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  btnCancelarClick( nil );
  
end;

procedure TfrmAtosOficiais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
