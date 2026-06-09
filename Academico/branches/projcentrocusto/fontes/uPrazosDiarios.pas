unit uPrazosDiarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls, Buttons;

type
  TfrmSelTurmas = class(TForm)
    qryTurmas: TUMZQuery;
    dtcTurmas: TDataSource;
    Bevel1: TBevel;
    Label1: TLabel;
    grd: TDBGrid;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    pmQtd: TPopupMenu;
    qryTurmasdepto: TStringField;
    qryTurmascurso: TStringField;
    qryTurmasanosemestre: TSmallintField;
    qryTurmasturma: TStringField;
    cbDepto: TComboBox;
    cbCurso: TComboBox;
    cbTurma: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnFechar: TSpeedButton;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra;
    procedure pmQtdPopup(Sender: TObject);
    procedure cbDeptoChange(Sender: TObject);
    procedure cbCursoChange(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure cbTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    flgSearch : Boolean;
    { Public declarations }
  end;

var
  frmSelTurmas: TfrmSelTurmas;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelTurmas.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelTurmas.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelTurmas.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelTurmas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelTurmas.txtTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  Filtra;
end;

procedure TfrmSelTurmas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
    txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  Filtra;

end;


procedure TfrmSelTurmas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelTurmas.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));


  if qryTurmas.Active then Exit;

  txtAnoSemestre.text := IntToStr(ano_semestre);

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  Filtra;

end;

procedure TfrmSelTurmas.Filtra;
var
  depto, curso, turma: integer;
begin

  qryTurmas.Close;
  qryTurmas.SQL.Clear;

  qryTurmas.SQL.Add( 'SELECT                                                 ');
  qryTurmas.SQL.Add( '	d.descricao as depto,                                ');
  qryTurmas.SQL.Add( '	c.codigo as curso,                                   ');
  qryTurmas.SQL.Add( '	c.anosemestre,                                       ');
  qryTurmas.SQL.Add( '	t.codigo as turma                                    ');
  qryTurmas.SQL.Add( 'FROM                                                   ');
  qryTurmas.SQL.Add( '	departamentos d,                                     ');
  qryTurmas.SQL.Add( '	cursos c,                                            ');
  qryTurmas.SQL.Add( '	turmas t                                             ');
  qryTurmas.SQL.Add( 'WHERE                                                  ');
  qryTurmas.SQL.Add( '	c.depto = d.codigo AND                               ');
  qryTurmas.SQL.Add( '	t.curso = c.codigo                                   ');
  qryTurmas.SQL.Add( '	AND c.anosemestre = :anosemestre                     ');

  if cbDepto.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND d.descricao = :depto                             ');
    qryTurmas.ParamByName('depto').AsString := cbDepto.Text;
  end;

  if cbCurso.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND c.codigo = :curso                                ');
    qryTurmas.ParamByName('curso').AsString := cbCurso.Text;
  end;

  if cbTurma.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND t.codigo = :turma                                ');
    qryTurmas.ParamByName('turma').AsString := cbTurma.Text;
  end;

  qryTurmas.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);

  qryTurmas.SQL.Add( 'GROUP BY                                               ');
  qryTurmas.SQL.Add( '	d.codigo,                                            ');
  qryTurmas.SQL.Add( '	c.codigo,                                            ');
  qryTurmas.SQL.Add( '	t.codigo                                             ');
  qryTurmas.SQL.Add( 'ORDER BY                                               ');
  qryTurmas.SQL.Add( '	t.codigo                                             ');

  qryTurmas.Prepare;
  qryTurmas.Open;

 { Preenchendo o combo Departamentos }
  depto := cbDepto.ItemIndex;
  cbDepto.Items.Clear;
  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Add('SELECT                                 ');
  DM.qAux1.SQL.Add('	DISTINCT(d.descricao) as depto       ');
  DM.qAux1.SQL.Add('FROM                                   ');
  DM.qAux1.SQL.Add('	departamentos d,                     ');
  DM.qAux1.SQL.Add('	cursos c                             ');
  DM.qAux1.SQL.Add('WHERE                                  ');
  DM.qAux1.SQL.Add('	c.depto = d.codigo AND               ');
  DM.qAux1.SQL.Add('	c.anosemestre = :anosemestre         ');
  DM.qAux1.SQL.Add('ORDER BY                               ');
  DM.qAux1.SQL.Add('	d.descricao                          ');
  DM.qAux1.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  DM.qAux1.Open;
  while not DM.qAux1.eof do
  begin
    cbDepto.Items.Add(DM.qAux1.FieldByName('depto').AsString);
    DM.qAux1.Next;
  end;
  cbDepto.ItemIndex := depto;
  { / Preenchendo o combo Departamentos }

  { Preenchendo o combo Cursos }
  curso := cbCurso.ItemIndex;
  cbCurso.Items.Clear;
  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Add('SELECT                                 ');
  DM.qAux1.SQL.Add('	DISTINCT(c.codigo) as curso          ');
  DM.qAux1.SQL.Add('FROM                                   ');
  DM.qAux1.SQL.Add('	departamentos d,                     ');
  DM.qAux1.SQL.Add('	cursos c                             ');
  DM.qAux1.SQL.Add('WHERE                                  ');
  DM.qAux1.SQL.Add('	c.depto = d.codigo AND               ');
  DM.qAux1.SQL.Add('	c.anosemestre = :anosemestre         ');

  if cbDepto.Text <> '' then
    DM.qAux1.SQL.Add('	AND d.descricao = :depto             ');

  DM.qAux1.SQL.Add('ORDER BY                               ');
  DM.qAux1.SQL.Add('	c.codigo                             ');
  DM.qAux1.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);

  if cbDepto.Text <> '' then
    DM.qAux1.ParamByName('depto').AsString := cbDepto.Text;

  DM.qAux1.Open;
  while not DM.qAux1.eof do
  begin
    cbCurso.Items.Add(DM.qAux1.FieldByName('curso').AsString);
    DM.qAux1.Next;
  end;
  cbCurso.ItemIndex := curso;
  { / Preenchendo o combo Cursos }

  { Preenchendo o combo Turmas }
  turma := cbTurma.ItemIndex;
  cbTurma.Items.Clear;
  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Text := qryTurmas.SQL.Text;

  DM.qAux1.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);

  if cbDepto.Text <> '' then
    DM.qAux1.ParamByName('depto').AsString := cbDepto.Text;

  if cbCurso.Text <> '' then
    DM.qAux1.ParamByName('curso').AsString := cbCurso.Text;

  if cbTurma.Text <> '' then
    DM.qAux1.ParamByName('turma').AsString := cbTurma.Text;

  DM.qAux1.Open;
  while not DM.qAux1.eof do
  begin
    cbTurma.Items.Add(DM.qAux1.FieldByName('turma').AsString);
    DM.qAux1.Next;
  end;
  cbTurma.ItemIndex := turma;
  { / Preenchendo o combo Turmas }

end;

procedure TfrmSelTurmas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryTurmas, pmQtd);

end;

procedure TfrmSelTurmas.cbDeptoChange(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmSelTurmas.cbCursoChange(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmSelTurmas.cbTurmaChange(Sender: TObject);
begin
  Filtra;
end;

procedure TfrmSelTurmas.cbTurmaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelTurmas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

end.

