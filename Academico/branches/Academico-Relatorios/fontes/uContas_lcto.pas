unit uContas_lcto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  StdCtrls, Mask, ComCtrls, ImgList, ToolWin, Menus;

type
  Tfrm_contas_lcto = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel4: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
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
    tblConta_Lcto: TUMZQuery;
    dsConta_Lcto: TDataSource;
    tblConta_Lctocodigo: TStringField;
    tblConta_Lctodescricao: TStringField;
    tblConta_Lctotipomovimento: TStringField;
    tblConta_Lctoclasse: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    pmQtd: TPopupMenu;
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsConta_LctoStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure pmQtdPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_contas_lcto: Tfrm_contas_lcto;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_contas_lcto.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_contas_lcto.btnExcluirClick(Sender: TObject);
begin
  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin
     tblConta_Lcto.Delete;
  end;
end;

procedure Tfrm_contas_lcto.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_contas_lcto.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_contas_lcto.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

procedure Tfrm_contas_lcto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_contas_lcto.btnInserirClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   tblConta_Lcto.Insert;
end;

procedure Tfrm_contas_lcto.btnAlterarClick(Sender: TObject);
begin
   DBEdit1.SetFocus;
   tblConta_Lcto.Insert;
end;

procedure Tfrm_contas_lcto.btnSalvarClick(Sender: TObject);
Var xCodigo : String;
begin
   xCodigo := tblConta_Lctocodigo.AsString;
   tblConta_Lcto.Post;
   tblConta_Lcto.Close;
   tblConta_Lcto.Open;

   tblConta_Lcto.Locate('codigo', xCodigo, []);
end;

procedure Tfrm_contas_lcto.btnCancelarClick(Sender: TObject);
begin
   tblConta_Lcto.Cancel;
end;

procedure Tfrm_contas_lcto.dsConta_LctoStateChange(Sender: TObject);
begin
    btnInserir.Enabled := not (tblConta_Lcto.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblConta_Lcto.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblConta_Lcto.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblConta_Lcto.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblConta_Lcto.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblConta_Lcto.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_contas_lcto.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   tblConta_Lcto.Close;
   tblConta_Lcto.Open;
end;

procedure Tfrm_contas_lcto.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
   IF KEY = #13 tHEN
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;


procedure Tfrm_contas_lcto.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblConta_Lcto, pmQtd);

end;

end.

