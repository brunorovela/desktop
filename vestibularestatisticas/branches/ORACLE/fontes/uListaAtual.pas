unit uListaAtual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  Tfrm_Lista = class(TForm)
    qyLista: TUMZQuery;
    srcLista: TDataSource;
    grd: TDBGrid;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    qyListanm_pessoa: TStringField;
    qyListads_curso: TStringField;
    lbAnoSemestre: TLabel;
    lbInstituicao: TLabel;
    SpeedButton1: TSpeedButton;
    qyListacd_candidato: TIntegerField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frm_Lista: Tfrm_Lista;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_Lista.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_Lista.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_Lista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Lista.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_Lista.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_Lista.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

end;

procedure Tfrm_Lista.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_Lista.SpeedButton1Click(Sender: TObject);
begin
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Text := 'DELETE FROM classificados_vestibular WHERE cd_candidato = :cd_candidato';
  DM.qyAux1.ParamByName('cd_candidato').AsInteger := qyLista.FieldByName('cd_candidato').AsInteger;
  DM.qyAux1.ExecSQL;
  qyLista.Close;
  qyLista.Open;
end;

procedure Tfrm_Lista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
