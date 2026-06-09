{
#TIT= Cadastro padrão
#OBJ= Cadastro padrão
#AUT= Jonathan
#DAT= 18/08/2004
#MOD= ...
#DES=
}
unit uCadPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_CadPadrao = class(TForm)
    Bevel3: TBevel;
    Bevel7: TBevel;
    Panel3: TPanel;
    Panel1: TPanel;
    Bevel5: TBevel;
    grd: TDBGrid;
    Panel2: TPanel;
    pnAnoSemestre: TPanel;
    Panel4: TPanel;
    Bevel6: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qy: TUMZQuery;
    src: TDataSource;
    pmQtd: TPopupMenu;
    qycodigo: TSmallintField;
    qydocumento: TStringField;
    qyprazo: TStringField;
    qysigla: TStringField;
    qyordem: TIntegerField;
    qyds_sexo: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure srcStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyAfterInsert(DataSet: TDataSet);
    procedure KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadPadrao: Tfrm_CadPadrao;

implementation

uses Main, uDM;

{$R *.dfm}

procedure Tfrm_CadPadrao.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPress;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPress;
  end ;

   qy.Close;
   qy.Open;
end;

procedure Tfrm_CadPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F4 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadPadrao.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadPadrao.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     qy.Delete;
  end;
end;

procedure Tfrm_CadPadrao.btnFecharClick(Sender: TObject);
begin
   qy.Close;
   qy.Open;
   Close;
end;

procedure Tfrm_CadPadrao.btnInserirClick(Sender: TObject);
begin
//   DBEdit1.SetFocus;
   qy.Insert;
end;

procedure Tfrm_CadPadrao.btnAlterarClick(Sender: TObject);
begin
//   DBEdit1.SetFocus;
   qy.Edit;
end;

procedure Tfrm_CadPadrao.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qy.FieldByName('codigo').AsInteger;
  qy.Post;
  qy.Close;
  qy.Open;
  qy.Locate('codigo', reg, []);
end;

procedure Tfrm_CadPadrao.btnCancelarClick(Sender: TObject);
begin
   qy.Cancel;
end;

procedure Tfrm_CadPadrao.srcStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (qy.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (qy.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (qy.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := qy.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qy.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (qy.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_CadPadrao.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qy, pmQtd);
end;

procedure Tfrm_CadPadrao.qyAfterInsert(DataSet: TDataSet);
begin
  qy.FieldByName('codigo').AsInteger := DM.ProximoId('codigo', 'tabela');
end;

procedure Tfrm_CadPadrao.KeyPress(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


end.

