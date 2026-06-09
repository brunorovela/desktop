unit uSelIESVest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  Tfrm_Sel_IES_Vest = class(TForm)
    qyIES: TUMZQuery;
    srcIES: TDataSource;
    grd: TDBGrid;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    btnSelecionar: TSpeedButton;
    qyIEScd_inst_vestibular: TIntegerField;
    qyIEScd_instituicao: TSmallintField;
    qyIESnm_instituicao: TStringField;
    qyIESds_curso: TStringField;
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
  frm_Sel_IES_Vest: Tfrm_Sel_IES_Vest;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Sel_IES_Vest.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Sel_IES_Vest.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Sel_IES_Vest.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Sel_IES_Vest.edNomeIESKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_Sel_IES_Vest.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Sel_IES_Vest.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

end;

procedure Tfrm_Sel_IES_Vest.Filtra;
begin
  qyIES.Close;
  qyIES.Open;
end;

procedure Tfrm_Sel_IES_Vest.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Sel_IES_Vest.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Sel_IES_Vest.btnSelecionarClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.
