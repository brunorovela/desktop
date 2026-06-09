unit uSelDepartamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  TfrmSelDepartamento = class(TForm)
    qryDepartamento: TUMZQuery;
    dtcTurmas: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    txtDepartamento: TEdit;
    btnFechar: TButton;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
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
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frmSelDepartamento: TfrmSelDepartamento;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelDepartamento.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelDepartamento.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelDepartamento.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelDepartamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelDepartamento.txtDepartamentoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelDepartamento.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelDepartamento.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  qryDepartamento.Active;


  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  txtDepartamento.SetFocus;

end;

procedure TfrmSelDepartamento.Filtra;
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

procedure TfrmSelDepartamento.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryDepartamento, pmQtd);

end;

procedure TfrmSelDepartamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

end.

