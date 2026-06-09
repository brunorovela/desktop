unit uSelDisciplinasAcad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Buttons, Menus;

type
  TfrmSelDisciplinasAcad = class(TForm)
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
  frmSelDisciplinasAcad: TfrmSelDisciplinasAcad;

implementation

uses Main, uDM, uSelCursos, Math;

{$R *.DFM}

procedure TfrmSelDisciplinasAcad.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelDisciplinasAcad.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelDisciplinasAcad.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelDisciplinasAcad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelDisciplinasAcad.txtCursoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Filtra;
    grd.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmSelDisciplinasAcad.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  Filtra;

end;


procedure TfrmSelDisciplinasAcad.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelDisciplinasAcad.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

 if PadraoCurso <> '' then
    txtCurso.Text := PadraoCurso
 else
    DM.Parametros_usuario(TForm(Sender));

 Filtra;

end;

procedure TfrmSelDisciplinasAcad.Filtra;
begin

  qryCursos.Close();
  qryCursos.SQL.Clear();

  qryCursos.SQL.Add(
   ' SELECT DISTINCT                                       ' +
   '    d.codigo, d.curso, d.descricao, d.sigla            ' +
   ' FROM                                                  ' +
   '    disciplinas d                                      ' +
   ' INNER JOIN gradecurricular g                          ' +
   '    ON (d.codigo = g.disciplina AND d.curso = g.curso) ' );

  if PadraoProfessor > 0 then begin
     qryCursos.SQL.Add(
      ' INNER JOIN turmasprofessores tp                         ' +
      '    ON (d.codigo = tp.disciplina AND d.curso = tp.curso AND g.anosemestre = tp.anosemestre ) ' );
  end;

  if PadraoTurma <> '' then begin
     qryCursos.SQL.Add(
      ' INNER JOIN turmas t                                             ' +
      '    ON (t.anosemestre = g.anosemestre AND t.curso = g.curso AND ' +
      '        t.serie = g.serie AND t.turno = g.turno )               ' );
  end;

  qryCursos.SQL.Add(' WHERE d.curso = :curso ');
  qryCursos.ParamByName('curso').AsString := txtCurso.Text;

  if PadraoAnosemestre > 0  then begin
     qryCursos.SQL.Add( ' and  g.anosemestre = :anosemestre ' );
     qryCursos.ParamByName('anosemestre').AsInteger := PadraoAnosemestre;
  end;

  if PadraoTurma <> '' then begin
     qryCursos.SQL.Add( ' and  t.codigo = :turma' );
     qryCursos.ParamByName('turma').AsString := PadraoTurma;
  end;

  if PadraoProfessor > 0  then begin
     qryCursos.SQL.Add(' and tp.professor = :professor  ');
     qryCursos.ParamByName('professor').AsInteger := PadraoProfessor;
  end;

  qryCursos.SQL.Add( 'order by d.curso, d.descricao' );  

  qryCursos.Open;

end;

procedure TfrmSelDisciplinasAcad.btnCodigoCursoClick(Sender: TObject);
begin
  { Pesquisar Cursos }
  frmSelCursos.ShowModal;
  if frmSelCursos.flgSearch then
  Begin
     txtCurso.Text := frmSelCursos.qryCursoscodigo.AsString;
     filtra;

     exit;
  end;

end;

procedure TfrmSelDisciplinasAcad.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryCursos, pmQtd);

end;

procedure TfrmSelDisciplinasAcad.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelDisciplinasAcad.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.
