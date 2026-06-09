unit uSelIES;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  Tfrm_Sel_IES = class(TForm)
    qyIES: TUMZQuery;
    srcIES: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    edNomeIES: TEdit;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    qyIESnm_instituicao: TStringField;
    qyIEScd_instituicao: TSmallintField;
    btnSelecionar: TSpeedButton;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNomeIESKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_Sel_IES: Tfrm_Sel_IES;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Sel_IES.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Sel_IES.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Sel_IES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Sel_IES.edNomeIESKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_Sel_IES.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Sel_IES.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  edNomeIES.SetFocus;

end;

procedure Tfrm_Sel_IES.Filtra;
begin
  qyIES.Close;
  qyIES.ParamByName('nm_instituicao').AsString := '%'+edNomeIES.Text+'%';
  qyIES.Open;
end;

procedure Tfrm_Sel_IES.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Sel_IES.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Sel_IES.btnSelecionarClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.
