unit uGrade_Professor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus;

type
  Tfrm_Grade_Professor = class(TForm)
    Bevel1: TBevel;
    btnFechar: TButton;
    pmQtd: TPopupMenu;
    bvProfessor: TBevel;
    lbProfessor: TLabel;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_Grade_Professor: Tfrm_Grade_Professor;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Grade_Professor.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Grade_Professor.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Grade_Professor.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Grade_Professor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Grade_Professor.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

end.

