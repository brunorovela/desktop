unit uListaAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, DBTables, Spin, ComCtrls, Mask,
  General, Menus, Buttons, ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  Tfrm_ListaAlunos = class(TForm)
    qyLista: TUMZQuery;
    srcLista: TDataSource;
    grd: TDBGrid;
    pmQtd: TPopupMenu;
    btnFechar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qyListacd_pessoa: TIntegerField;
    qyListanm_pessoa: TStringField;
    qyListaturma: TStringField;
    qyListads_status: TStringField;
    qyListads_curso: TStringField;
    qyListaanosemestre: TSmallintField;
    qyListacd_inst_vestibular: TIntegerField;
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
  frm_ListaAlunos: Tfrm_ListaAlunos;

implementation

uses Main, uDM;

{$R *.DFM}

procedure Tfrm_ListaAlunos.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure Tfrm_ListaAlunos.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure Tfrm_ListaAlunos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_ListaAlunos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure Tfrm_ListaAlunos.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure Tfrm_ListaAlunos.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

end;

procedure Tfrm_ListaAlunos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure Tfrm_ListaAlunos.SpeedButton1Click(Sender: TObject);
begin
  DM.qyAux1.Close;
  DM.qyAux1.SQL.Text := 'DELETE FROM alunos_vestibular WHERE cd_pessoa = :cd_pessoa AND cd_inst_vestibular = :cd_inst_vestibular';
  DM.qyAux1.ParamByName('cd_pessoa').AsInteger := qyLista.FieldByName('cd_pessoa').AsInteger;
  DM.qyAux1.ParamByName('cd_inst_vestibular').AsInteger := qyLista.FieldByName('cd_inst_vestibular').AsInteger;
  DM.qyAux1.ExecSQL;
  qyLista.Close;
  qyLista.Open;
end;

procedure Tfrm_ListaAlunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
