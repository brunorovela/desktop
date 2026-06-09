unit uSelPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  Tfrm_SelPadrao = class(TForm)
    qryDepartamento: TUMZQuery;
    dtcTurmas: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    txtDepartamento: TEdit;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_SelPadrao: Tfrm_SelPadrao;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_SelPadrao.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_SelPadrao.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_SelPadrao.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_SelPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_SelPadrao.txtDepartamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure Tfrm_SelPadrao.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_SelPadrao.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  qryDepartamento.Active;


  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  txtDepartamento.SetFocus;

end;

procedure Tfrm_SelPadrao.Filtra;
begin
  qryDepartamento.Close;
  qryDepartamento.SQL.Clear;
  qryDepartamento.SQL.Add( 'select * from departamentos' );

  if txtDepartamento.Text <> '' then
    qryDepartamento.SQL.Add( ' where descricao like :depto' );

  qryDepartamento.SQL.Add( 'order by  descricao' );

  if txtDepartamento.Text <> '' then
    qryDepartamento.ParamByName('descricao').AsString := txtDepartamento.Text;

  qryDepartamento.Prepare;
  qryDepartamento.Open;

end;

procedure Tfrm_SelPadrao.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryDepartamento, pmQtd);

end;

procedure Tfrm_SelPadrao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_SelPadrao.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

end.

