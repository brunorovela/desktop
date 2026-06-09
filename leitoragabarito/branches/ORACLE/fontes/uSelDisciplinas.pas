unit uSelDisciplinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Menus;

type
  TfrmSelDisciplinas = class(TForm)
    qryCursos: TUMZQuery;
    dtcCursos: TDataSource;
    grd: TDBGrid;
    btnFechar: TButton;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    qryCursosdescricao: TStringField;
    qryCursoscurso: TStringField;
    qryCursoscd_prova_disciplina: TIntegerField;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    PadraoCurso : String;
    PadraoTurma : String;
    PadraoProfessor : Integer;
    PadraoAnosemestre : Integer;

    cd_prova : integer;

    { Public declarations }
  end;

var
  frmSelDisciplinas: TfrmSelDisciplinas;

implementation

uses Main, uDM, uSelCursos, Math;

{$R *.DFM}

procedure TfrmSelDisciplinas.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelDisciplinas.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelDisciplinas.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelDisciplinas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelDisciplinas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelDisciplinas.FormShow(Sender: TObject);
begin
   qryCursos.Close();
   qryCursos.ParamByName('cd_prova').AsInteger := cd_prova;
   qryCursos.Open();
end;

procedure TfrmSelDisciplinas.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.
