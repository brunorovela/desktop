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
    Bevel1: TBevel;
    Label3: TLabel;
    grd: TDBGrid;
    btnFechar: TButton;
    txtCurso: TEdit;
    btnCodigoCurso: TSpeedButton;
    qryCursoscodigo: TIntegerField;
    qryCursoscurso: TStringField;
    qryCursosdescricao: TStringField;
    qryCursossigla: TStringField;
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtCursoKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure btnCodigoCursoClick(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    PadraoCurso : String;
    PadraoTurma : String;
    PadraoProfessor : Integer;
    PadraoAnosemestre : Integer;

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

procedure TfrmSelDisciplinas.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelDisciplinas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  Filtra;

end;


procedure TfrmSelDisciplinas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelDisciplinas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

 if PadraoCurso <> '' then
    txtCurso.Text := PadraoCurso;

// if qryCursos.Active then Exit;

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

 Filtra;

end;

procedure TfrmSelDisciplinas.Filtra;
begin
  qryCursos.Close;
  qryCursos.SQL.Clear;
  qryCursos.SQL.Add( 'select DISTINCT d.codigo, d.curso, d.descricao, sigla from disciplinas d, turmasprofessores tp ');
  qryCursos.SQL.Add( 'where d.codigo = tp.disciplina and d.curso = tp.curso' );

  If  txtCurso.Text <> '' then
     qryCursos.SQL.Add( ' and  d.curso = :curso' );

  if PadraoTurma <> '' then
     qryCursos.SQL.Add( ' and  tp.turma = :turma' );

  if PadraoProfessor > 0  then
     qryCursos.SQL.Add( ' and  tp.professor = :professor' );

  if PadraoAnosemestre > 0  then
     qryCursos.SQL.Add( ' and  tp.anosemestre = :anosemestre' );


  qryCursos.SQL.Add( 'order by d.curso, d.descricao' );

  if txtCurso.Text <> '' then
     qryCursos.ParamByName('curso').AsString := txtCurso.Text;

  if PadraoTurma <> '' then
     qryCursos.ParamByName('turma').AsString := PadraoTurma;

  if PadraoProfessor > 0  then
     qryCursos.ParamByName('professor').AsInteger := PadraoProfessor;

  if PadraoAnosemestre > 0  then
     qryCursos.ParamByName('anosemestre').AsInteger := PadraoAnosemestre;

  qryCursos.Prepare;
  qryCursos.Open;

end;

procedure TfrmSelDisciplinas.btnCodigoCursoClick(Sender: TObject);
begin
  { Pesquisar Cursos }
  frmSelCursos.ShowModal;
  if frmSelCursos.flgSearch then
  Begin
     txtCurso.Text := frmSelCursos.qryCursoscodigo.AsString;
     Exit;
  end;

end;

procedure TfrmSelDisciplinas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryCursos, pmQtd);

end;

procedure TfrmSelDisciplinas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelDisciplinas.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.

