unit uSelTurmas;

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
    qyCombo: TUMZQuery;
    cbAnoSemextre: TCheckBox;
    SpeedButton1: TSpeedButton;
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Filtra(Sender : TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure cbDeptoChange(Sender: TObject);
    procedure cbCursoChange(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure cbTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbAnoSemextreClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  Filtra(Sender);
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

  Filtra(Sender);

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

  txtAnoSemestre.Enabled := cbAnoSemextre.Checked;
  UpDown2.Enabled := cbAnoSemextre.Checked;;

  Filtra(Sender);

end;

procedure TfrmSelTurmas.Filtra(Sender : TObject);
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
  qryTurmas.SQL.Add( '	t.curso = c.codigo AND                               ');
  qryTurmas.SQL.Add( '	t.anosemestre = c.anosemestre                        ');
  if cbAnoSemextre.Checked then
  begin
     qryTurmas.SQL.Add( '	AND c.anosemestre = :anosemestre                     ');
     qryTurmas.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);
  end;

  if cbDepto.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND d.descricao like :depto                             ');
    qryTurmas.ParamByName('depto').AsString := cbDepto.Text + '%';
  end;

  if cbCurso.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND c.codigo like :curso                                ');
    qryTurmas.ParamByName('curso').AsString := cbCurso.Text  + '%';
  end;

  if cbTurma.Text <> '' then
  begin
    qryTurmas.SQL.Add( '	AND t.codigo like :turma                                ');
    qryTurmas.ParamByName('turma').AsString := cbTurma.Text + '%';
  end;

  qryTurmas.SQL.Add( 'GROUP BY                                               ');
  qryTurmas.SQL.Add( '	d.codigo,                                            ');
  qryTurmas.SQL.Add( '	c.codigo,                                            ');
  qryTurmas.SQL.Add( '	t.codigo                                             ');
  qryTurmas.SQL.Add( 'ORDER BY                                               ');
  qryTurmas.SQL.Add( '	t.codigo                                             ');

  qryTurmas.Prepare;
  qryTurmas.Open;

  if TWinControl(Sender).Tag < 2 then
  begin
   { Preenchendo o combo Departamentos }
     depto := cbDepto.ItemIndex;
     cbDepto.Items.Clear;
     qyCombo.Close;
     qyCombo.SQL.Clear;
     qyCombo.SQL.Add('SELECT                                 ');
     qyCombo.SQL.Add('	DISTINCT(d.descricao) as depto       ');
     qyCombo.SQL.Add('FROM                                   ');
     qyCombo.SQL.Add('	departamentos d,                     ');
     qyCombo.SQL.Add('	cursos c                             ');
     qyCombo.SQL.Add('WHERE                                  ');
     qyCombo.SQL.Add('	c.depto = d.codigo                   ');

     if cbAnoSemextre.Checked then
     begin
        qyCombo.SQL.Add('	AND c.anosemestre = :anosemestre         ');
        qyCombo.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
     end;

     qyCombo.SQL.Add('ORDER BY                               ');
     qyCombo.SQL.Add('	d.descricao                          ');
     qyCombo.Open;


     while not qyCombo.eof do
     begin
       cbDepto.Items.Add(qyCombo.FieldByName('depto').AsString);
       qyCombo.Next;
     end;
     cbDepto.ItemIndex := depto;
     { / Preenchendo o combo Departamentos }

  end;

  if TWinControl(Sender).Tag < 3 then
  begin
     { Preenchendo o combo Cursos }
     curso := cbCurso.ItemIndex;
     cbCurso.Items.Clear;
     qyCombo.Close;
     qyCombo.SQL.Clear;
     qyCombo.SQL.Add('SELECT                                 ');
     qyCombo.SQL.Add('	DISTINCT(c.codigo) as curso          ');
     qyCombo.SQL.Add('FROM                                   ');
     qyCombo.SQL.Add('	departamentos d,                     ');
     qyCombo.SQL.Add('	cursos c                             ');
     qyCombo.SQL.Add('WHERE                                  ');
     qyCombo.SQL.Add('	c.depto = d.codigo                   ');

     if cbAnoSemextre.Checked then
     begin
        qyCombo.SQL.Add('	AND c.anosemestre = :anosemestre         ');
        qyCombo.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
     end;

     if cbDepto.Text <> '' then
       qyCombo.SQL.Add('	AND d.descricao like :depto             ');

     qyCombo.SQL.Add('ORDER BY                               ');
     qyCombo.SQL.Add('	c.codigo                             ');

     if cbDepto.Text <> '' then
       qyCombo.ParamByName('depto').AsString := cbDepto.Text + '%';

     qyCombo.Open;
     while not qyCombo.eof do
     begin
       cbCurso.Items.Add(qyCombo.FieldByName('curso').AsString);
       qyCombo.Next;
     end;
     cbCurso.ItemIndex := curso;
     { / Preenchendo o combo Cursos }

  end;

  if TWinControl(Sender).Tag < 4 then
  begin

     { Preenchendo o combo Turmas }
     turma := cbTurma.ItemIndex;
     cbTurma.Items.Clear;

     qyCombo.Close;
     qyCombo.SQL.Clear;

     qyCombo.SQL.Add( 'SELECT                                                 ');
     qyCombo.SQL.Add( '	d.descricao as depto,                                ');
     qyCombo.SQL.Add( '	c.codigo as curso,                                   ');
     qyCombo.SQL.Add( '	c.anosemestre,                                       ');
     qyCombo.SQL.Add( '	t.codigo as turma                                    ');
     qyCombo.SQL.Add( 'FROM                                                   ');
     qyCombo.SQL.Add( '	departamentos d,                                     ');
     qyCombo.SQL.Add( '	cursos c,                                            ');
     qyCombo.SQL.Add( '	turmas t                                             ');
     qyCombo.SQL.Add( 'WHERE                                                  ');
     qyCombo.SQL.Add( '	c.depto = d.codigo AND                               ');
     qyCombo.SQL.Add( '	t.curso = c.codigo AND                               ');
     qyCombo.SQL.Add( '	t.anosemestre = c.anosemestre                        ');

     if cbAnoSemextre.Checked then
     begin
        qyCombo.SQL.Add( '	AND c.anosemestre = :anosemestre                     ');
        qyCombo.ParamByName('anosemestre').asInteger := StrToInt(txtAnoSemestre.Text);
     end;

     if cbDepto.Text <> '' then
     begin
        qyCombo.SQL.Add( '	AND d.descricao like :depto                             ');
        qyCombo.ParamByName('depto').AsString := cbDepto.Text + '%';
     end;

     if cbCurso.Text <> '' then
     begin
        qyCombo.SQL.Add( '	AND c.codigo like :curso                                ');
        qyCombo.ParamByName('curso').AsString := cbCurso.Text + '%';
     end;

     if cbTurma.Text <> '' then
     begin
       qyCombo.SQL.Add( '	AND t.codigo like :turma                                ');
       qyCombo.ParamByName('turma').AsString := cbTurma.Text + '%';
     end;

     qyCombo.SQL.Add( 'GROUP BY                                               ');
     qyCombo.SQL.Add( '	d.codigo,                                            ');
     qyCombo.SQL.Add( '	c.codigo,                                            ');
     qyCombo.SQL.Add( '	t.codigo                                             ');
     qyCombo.SQL.Add( 'ORDER BY                                               ');
     qyCombo.SQL.Add( '	t.codigo                                             ');

     qyCombo.Prepare;
     qyCombo.Open;

     while not qyCombo.eof do
     begin
       cbTurma.Items.Add(qyCombo.FieldByName('turma').AsString);
       qyCombo.Next;
     end;
     cbTurma.ItemIndex := turma;
     { / Preenchendo o combo Turmas }
   End;

end;

procedure TfrmSelTurmas.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(qryTurmas, pmQtd);

end;

procedure TfrmSelTurmas.cbDeptoChange(Sender: TObject);
begin
  Filtra(Sender);
end;

procedure TfrmSelTurmas.cbCursoChange(Sender: TObject);
begin
  Filtra (Sender);
end;

procedure TfrmSelTurmas.cbTurmaChange(Sender: TObject);
begin
  Filtra (Sender) ;
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

procedure TfrmSelTurmas.cbAnoSemextreClick(Sender: TObject);
begin
   Filtra(Sender);
end;

procedure TfrmSelTurmas.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

end.

