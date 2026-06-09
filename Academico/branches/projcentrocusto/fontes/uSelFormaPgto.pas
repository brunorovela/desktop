unit uSelFormaPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons;

type
  TfrmSelFormaPgto = class(TForm)
    qyFormaPgto: TUMZQuery;
    srcCaixa: TDataSource;
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    edDescricao: TEdit;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    qyFormaPgtocd_forma_pgto: TIntegerField;
    qyFormaPgtods_forma_pgto: TStringField;
    qyFormaPgtosn_cadastra_cheque: TSmallintField;
    qyFormaPgtosn_ativo: TSmallintField;
    qyFormaPgtosn_compensa_auto: TSmallintField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescricaoKeyPress(Sender: TObject; var Key: Char);
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
  frmSelFormaPgto: TfrmSelFormaPgto;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelFormaPgto.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelFormaPgto.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelFormaPgto.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelFormaPgto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelFormaPgto.edDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelFormaPgto.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelFormaPgto.FormShow(Sender: TObject);
begin
  qyFormaPgto.Active;

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

  edDescricao.SetFocus;

end;

procedure TfrmSelFormaPgto.Filtra;
var
   sOp : String;
begin
  qyFormaPgto.Close;
  qyFormaPgto.SQL.Clear;
  qyFormaPgto.SQL.Add( 'SELECT               ');
  qyFormaPgto.SQL.Add( '  *                  ');
  qyFormaPgto.SQL.Add( 'FROM                 ');
  qyFormaPgto.SQL.Add( '  fin_config_formas_pgto    ');

  sOp := ' WHERE ' ;

  if edDescricao.Text <> '' then
  begin
    qyFormaPgto.SQL.Add( sOP + ' ds_forma_pgto LIKE :descricao ' );
    qyFormaPgto.ParamByName('descricao').AsString := edDescricao.Text;
    sOP := ' AND ';
  end;

  qyFormaPgto.SQL.Add( sOp + ' cd_coligada_matriz = :cd_coligada_matriz ' );
  qyFormaPgto.SQL.Add( ' ORDER BY                       ');
  qyFormaPgto.SQL.Add( '   ds_forma_pgto                     ');
  qyFormaPgto.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;

  qyFormaPgto.Open;
end;

procedure TfrmSelFormaPgto.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyFormaPgto, pmQtd);

end;

procedure TfrmSelFormaPgto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelFormaPgto.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

end.

