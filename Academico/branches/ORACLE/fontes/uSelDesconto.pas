unit uSelDesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  TfrmSelDesconto = class(TForm)
    qryPlanoDesconto: TUMZQuery;
    dtcTurmas: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    txtDescricao: TEdit;
    btnFechar: TButton;
    qryPlanoDescontocodigo: TIntegerField;
    qryPlanoDescontodescricaoplano: TStringField;
    qryPlanoDescontopercentualdesconto: TFloatField;
    qryPlanoDescontovalordesconto: TFloatField;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDescricaoKeyPress(Sender: TObject; var Key: Char);
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
  frmSelDesconto: TfrmSelDesconto;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelDesconto.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelDesconto.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelDesconto.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelDesconto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelDesconto.txtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelDesconto.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelDesconto.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  if qryPlanoDesconto.Active then Exit;


  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  txtDescricao.SetFocus;

end;

procedure TfrmSelDesconto.Filtra;
begin
  qryPlanoDesconto.Close;
  qryPlanoDesconto.SQL.Clear;
  qryPlanoDesconto.SQL.Add( 'select * from planosdesconto' );

  if txtDescricao.Text <> '' then
    qryPlanoDesconto.SQL.Add( ' where descricaoplano like :descricao' );

  qryPlanoDesconto.SQL.Add( 'order by  descricaoplano' );

  if txtDescricao.Text <> '' then
    qryPlanoDesconto.ParamByName('descricao').AsString := '%'+txtDescricao.Text+'%';

  qryPlanoDesconto.Open;

end;

procedure TfrmSelDesconto.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryPlanoDesconto, pmQtd);

end;

procedure TfrmSelDesconto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

end.

