unit uCadTiposPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset;

type
  Tfrm_CadTiposPessoas = class(TForm)
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
    srcTiposPessoas: TDataSource;
    pmQtd: TPopupMenu;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    qyTiposPessoas: TUMZQuery;
    qyTiposPessoasCD_TIPO_PESSOA: TIntegerField;
    qyTiposPessoasDS_TIPO_PESSOA: TStringField;
    qyTiposPessoasSN_ATIVO: TIntegerField;
    qyTiposPessoasTP_PESSOA: TStringField;
    qyTiposPessoasDS_OBSERVACAO: TBlobField;
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
    procedure srcTiposPessoasStateChange(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure qyTiposPessoasAfterInsert(DataSet: TDataSet);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_CadTiposPessoas: Tfrm_CadTiposPessoas;

implementation

uses
   Main, uDM, uUsuario;

{$R *.dfm}

procedure Tfrm_CadTiposPessoas.FormShow(Sender: TObject);
var
  n: LongInt;
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Avançar controle com ENTER }
  for n := 0 to ( ComponentCount - 1 ) do
  begin
    if Components[n].ClassType = TDBEdit then
      TDBEdit(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TDBLookupComboBox then
      TDBLookupComboBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TDBComboBox then
      TDBComboBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TDBCheckBox then
      TDBCheckBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TEdit then
      TEdit(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TCheckBox then
      TCheckBox(Components[n]).OnKeyPress := KeyPressEvent;
    if Components[n].ClassType = TRadioButton then
      TRadioButton(Components[n]).OnKeyPress := KeyPressEvent;
  end ;

   qyTiposPessoas.Close;
   qyTiposPessoas.Open;
end;

procedure Tfrm_CadTiposPessoas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_CadTiposPessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : btnInserirClick( nil );
    VK_F3 : btnAlterarClick( nil );
    VK_F5 : btnSalvarClick( nil );
    VK_F9 : btnExcluirClick( nil );
    VK_F6 : btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;

end;

procedure Tfrm_CadTiposPessoas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_CadTiposPessoas.btnExcluirClick(Sender: TObject);
begin
      if Mensagem('Deseja realmente excluir?', Application.Title,
         MB_YESNO + MB_ICONQUESTION) = ID_YES then
         qyTiposPessoas.Delete;
end;

procedure Tfrm_CadTiposPessoas.btnFecharClick(Sender: TObject);
begin
   qyTiposPessoas.Close;
   qyTiposPessoas.Open;
   Close;
end;

procedure Tfrm_CadTiposPessoas.btnInserirClick(Sender: TObject);
begin
      DBEdit2.SetFocus;
      qyTiposPessoas.Insert;
end;

procedure Tfrm_CadTiposPessoas.btnAlterarClick(Sender: TObject);
begin
      DBEdit2.SetFocus;
      qyTiposPessoas.Edit;
end;

procedure Tfrm_CadTiposPessoas.btnSalvarClick(Sender: TObject);
Var
  reg: integer;
begin
  reg := qyTiposPessoas.FieldByName('cd_tipo_pessoa').AsInteger;
  qyTiposPessoas.Post;
  qyTiposPessoas.Close;
  qyTiposPessoas.Open;
  qyTiposPessoas.Locate('cd_tipo_pessoa', reg, []);
end;

procedure Tfrm_CadTiposPessoas.btnCancelarClick(Sender: TObject);
begin
   qyTiposPessoas.Cancel;
end;

procedure Tfrm_CadTiposPessoas.srcTiposPessoasStateChange(Sender: TObject);
begin
    btnInserir.Enabled := (qyTiposPessoas.State = dsBrowse) and
         DM.RequestPermission('Cadastros.TiposPessoas', npIncluir, False, Handle);
    
    btnAlterar.Enabled := (qyTiposPessoas.State = dsBrowse) and
         DM.RequestPermission('Cadastros.TiposPessoas', npAlterar, False, Handle);
    
    btnExcluir.Enabled := (qyTiposPessoas.State = dsBrowse) and
         (not qyTiposPessoas.IsEmpty) and
         DM.RequestPermission('Cadastros.TiposPessoas', npExcluir, False, Handle);
    
    btnSalvar.Enabled := qyTiposPessoas.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := qyTiposPessoas.State in [dsInsert, dsEdit];
    btnFechar.Enabled := qyTiposPessoas.State = dsBrowse;
end;

procedure Tfrm_CadTiposPessoas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyTiposPessoas, pmQtd);
end;

procedure Tfrm_CadTiposPessoas.qyTiposPessoasAfterInsert(DataSet: TDataSet);
begin
  qyTiposPessoas.FieldByName('cd_tipo_pessoa').AsInteger := DM.ProximoId('cd_tipo_pessoa', 'extra_tipos_pessoas');
end;

procedure Tfrm_CadTiposPessoas.KeyPressEvent(
  Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;


end.
