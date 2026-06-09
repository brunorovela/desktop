unit uSelPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons;

type
  Tfrm_Sel_IES = class(TForm)
    qryDepartamento: TQuery;
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

procedure Tfrm_Sel_IES.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure Tfrm_Sel_IES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Sel_IES.txtDepartamentoKeyPress(Sender: TObject; var Key: Char);
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

  qryDepartamento.Active;


  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  txtDepartamento.SetFocus;

end;

procedure Tfrm_Sel_IES.Filtra;
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

procedure Tfrm_Sel_IES.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryDepartamento, pmQtd);

end;

procedure Tfrm_Sel_IES.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Sel_IES.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

end.
