unit uContasPagar_Apropriacoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  Tfrm_ContasPagar_Apropriacoes = class(TForm)
    qyApropriacoes: TUMZQuery;
    srcApropriacoes: TDataSource;
    pmQtd: TPopupMenu;
    qyApropriacoesds_conta: TStringField;
    qyApropriacoesds_centro: TStringField;
    qyApropriacoesvl_movimento: TFloatField;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    sbFechar: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_ContasPagar_Apropriacoes: Tfrm_ContasPagar_Apropriacoes;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_ContasPagar_Apropriacoes.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_ContasPagar_Apropriacoes.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_ContasPagar_Apropriacoes.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_ContasPagar_Apropriacoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_ContasPagar_Apropriacoes.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_ContasPagar_Apropriacoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_ContasPagar_Apropriacoes.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_ContasPagar_Apropriacoes.sbFecharClick(Sender: TObject);
begin
  Close;
end;

end.

