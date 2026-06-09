unit uSelIESVestiba;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons;

type
  Tfrm_Sel_IESVestiba = class(TForm)
    qyIES: TQuery;
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
  frm_Sel_IESVestiba: Tfrm_Sel_IESVestiba;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Sel_IESVestiba.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Sel_IESVestiba.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Sel_IESVestiba.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Sel_IESVestiba.edNomeIESKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_Sel_IESVestiba.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Sel_IESVestiba.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  edNomeIES.SetFocus;

end;

procedure Tfrm_Sel_IESVestiba.Filtra;
begin
  qyIES.Close;
  qyIES.ParamByName('nm_instituicao').AsString := '%'+edNomeIES.Text+'%';
  qyIES.Open;
end;

procedure Tfrm_Sel_IESVestiba.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Sel_IESVestiba.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Sel_IESVestiba.btnSelecionarClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.
