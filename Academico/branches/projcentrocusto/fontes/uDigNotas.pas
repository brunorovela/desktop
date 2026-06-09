unit uDigNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls, Db, ZConnection, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls, wwidlg, wwDialog;

type
  TfrmDigNotas = class(TForm)
    Panel3: TPanel;
    btnFechar: TSpeedButton;
    grd: TDBGrid;
    tblNotas: TUMZQuery;
    dtcNotas: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    lblN1: TLabel;
    dbeN1: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbeCodigo: TDBEdit;
    txtBimestre: TMaskEdit;
    UpDown1: TUpDown;
    Label5: TLabel;
    Label7: TLabel;
    txtDisciplina: TEdit;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    lblProfessores: TLabel;
    txtAnoSemestre: TMaskEdit;
    UpDown2: TUpDown;
    Label9: TLabel;
    LookupDisciplinas: TwwLookupDialog;
    tblNotasAnoSemestre: TSmallintField;
    tblNotasCodigoAluno: TIntegerField;
    tblNotasTurma: TStringField;
    tblNotasNome: TStringField;
    tblNotasSigla: TStringField;
    tblNotasBimestre: TSmallintField;
    tblNotasN1: TFloatField;
    tblNotasN2: TFloatField;
    tblNotasN3: TFloatField;
    tblNotasN4: TFloatField;
    tblNotasN5: TFloatField;
    tblNotasN6: TFloatField;
    tblNotasN7: TFloatField;
    tblNotasN8: TFloatField;
    tblNotasN9: TFloatField;
    tblNotasN10: TFloatField;
    tblNotasNAdicional: TFloatField;
    tblNotasDisciplina: TSmallintField;
    Label3: TLabel;
    DBText2: TDBText;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure dbeCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure dtcNotasDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Filtra;
    procedure dbeE1KeyPress(Sender: TObject; var Key: Char);
    procedure grdCellClick(Column: TColumn);
    procedure SalvaRegistro;
    procedure dbeN1KeyPress(Sender: TObject; var Key: Char);
  private
    intAnoSemestre : Integer;
    strTurma : String;
    intDisciplina : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDigNotas: TfrmDigNotas;

implementation

uses uDM, uNotas;

{$R *.DFM}

procedure TfrmDigNotas.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDigNotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM.tblNotas.State in [dsInsert, dsEdit] then DM.tblNotas.Cancel;
  Action := caFree;
end;

procedure TfrmDigNotas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick(nil);
  end;
end;

procedure TfrmDigNotas.FormShow(Sender: TObject);
begin

  intAnoSemestre := frmNotas.tblNotasAnoSemestre.AsInteger;
  intDisciplina := frmNotas.tblNotasDisciplina.AsInteger;
  strTurma := frmNotas.tblNotasTurma.AsString;
  txtAnoSemestre.Text := frmNotas.tblNotasAnoSemestre.AsString;
  txtDisciplina.Text := DM.tblDisciplinasSigla.AsString;

  Filtra;
end;

procedure TfrmDigNotas.Filtra;
begin

  DM.tblNotas.Close;
  DM.tblNotas.SQL.Clear;
  DM.tblNotas.SQL.Add( 'select * from Provas where' );
  DM.tblNotas.SQL.Add( 'Turma = :Turma and' );
  DM.tblNotas.SQL.Add( 'AnoSemestre = :AnoSemestre and' );

  if frmNotas.popFicha.Items[0].Checked then
  begin
    DM.tblNotas.SQL.Add( 'CodigoAluno = :CodigoAluno' );
    DM.tblNotas.ParamByName('CodigoAluno').AsInteger :=
      frmNotas.tblNotasCodigoAluno.AsInteger;
  end
  else
  begin
    DM.tblNotas.SQL.Add( 'Disciplina = :Disciplina' );
    DM.tblNotas.ParamByName('Disciplina').AsInteger := intDisciplina;
  end;

  DM.tblNotas.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  DM.tblNotas.ParamByName('Turma').AsString := strTurma;
  DM.tblNotas.Prepare;
  DM.tblNotas.Open;

  tblNotas.Close;
  tblNotas.SQL.Clear;
  tblNotas.SQL.Add( 'SELECT DISTINCTROW Provas.AnoSemestre, Provas.CodigoAluno,');
  tblNotas.SQL.Add( 'Provas.Turma, Provas.Disciplina, Alunos.Nome, Disciplinas.Sigla,');
  tblNotas.SQL.Add( 'Provas.Bimestre, Provas.N1, Provas.N2, Provas.N3, Provas.N4,');
  tblNotas.SQL.Add( 'Provas.N5, Provas.N6, Provas.N7, Provas.N8, Provas.N9,');
  tblNotas.SQL.Add( 'Provas.N10, Provas.NAdicional FROM (Provas INNER JOIN Disciplinas ON');
  tblNotas.SQL.Add( 'Provas.Disciplina = Disciplinas.Codigo) INNER JOIN Alunos ON');
  tblNotas.SQL.Add( 'Provas.CodigoAluno = Alunos.Codigo');
  tblNotas.SQL.Add( 'WHERE' );

  if frmNotas.popFicha.Items[1].Checked then
    tblNotas.SQL.Add( 'Notas.Disciplina = :Disciplina and' )
  else
    tblNotas.SQL.Add( 'Notas.CodigoAluno = :CodigoAluno and' );

  tblNotas.SQL.Add( 'Notas.Turma = :Turma' );
  tblNotas.SQL.Add( 'order by Alunos.Nome, Notas.CodigoDisciplina' );

  tblNotas.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  tblNotas.ParamByName('Turma').AsString := strTurma;

  if frmNotas.popFicha.Items[1].Checked then
    tblNotas.ParamByName('Disciplina').asInteger := intDisciplina
  else
    tblNotas.ParamByName('CodigoAluno').AsInteger :=
      frmNotas.tblNotasCodigoAluno.AsInteger;

  tblNotas.SQL.Add( 'order by Alunos.Nome');
  tblNotas.Prepare;
  tblNotas.Open;

  lblProfessores.Caption :=
    DM.ProfessoresTurma( intAnoSemestre, strTurma, txtDisciplina.Text );

end;


procedure TfrmDigNotas.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
var
  intBimestre : Integer;
begin

  intBimestre := StrToInt(txtBimestre.Text);

  if Button = btNext then
  begin
    Inc( intBimestre );
  end
  else
  begin
    Dec( intBimestre );
  end;

  txtBimestre.Text := IntToStr( intBimestre );

  tblNotas.First;
  dbeCodigo.SetFocus;
end;



procedure TfrmDigNotas.UpDown2Click(Sender: TObject;
  Button: TUDBtnType);
var
  intAno, intSemestre : Integer;
begin

  intAno := StrToInt(Copy(txtAnoSemestre.Text,1,4));
  intSemestre := StrToInt(Copy(txtAnoSemestre.Text,5,1));

  if Button = btNext then
  begin
    Inc( intSemestre );
    if intSemestre = 3 then
    begin
      Inc( intAno );
      intSemestre := 1;
    end;
  end
  else
  begin
    Dec( intSemestre );
    if intSemestre = 0 then
    begin
      Dec( intAno );
      intSemestre := 2;
    end;
  end;

  txtAnoSemestre.Text := IntToStr( intAno ) + IntToStr( intSemestre );
  intAnoSemestre := StrToInt(txtAnoSemestre.Text);

end;

procedure TfrmDigNotas.dbeCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if dbeCodigo.Modified then
    begin
      DM.tblNotas.Cancel;
      dbeCodigo.SetFocus;
      dbeCodigo.SelectAll;
      Key := #0;
      Exit;
    end;
    SelectNext(ActiveControl, True, True );
    DM.tblNotas.Edit;
    Key := #0;
  end;
end;

procedure TfrmDigNotas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmDigNotas.dtcNotasDataChange(Sender: TObject;
  Field: TField);
begin
  DM.tblNotas.Locate( 'AnoSemestre;CodigoAluno;Turma;Disciplina',
    VarArrayOf( [tblNotasAnoSemestre.AsInteger, tblNotasCodigoAluno.AsInteger,
                 tblNotasTurma.AsString, tblNotasDisciplina.AsInteger]),
                 [loPartialKey] );
  lblProfessores.Caption := DM.ProfessoresTurma(
    tblNotasAnoSemestre.AsInteger, tblNotasTurma.AsString, txtDisciplina.Text );


end;

procedure TfrmDigNotas.SpeedButton1Click(Sender: TObject);
begin
  DM.tblDisciplinas.SQL.Clear;
  DM.tblDisciplinas.SQL.Add( 'select * from Disciplinas order by Sigla' );
  DM.tblDisciplinas.Prepare;
  DM.tblDisciplinas.Open;
  if LookupDisciplinas.Execute then
  begin
    txtDisciplina.Text := DM.tblDisciplinasSigla.AsString;
    intDisciplina := DM.tblDisciplinasCodigo.AsInteger;
    Filtra;
  end;
end;

procedure TfrmDigNotas.dbeE1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if DM.tblNotas.State in [dsInsert, dsEdit] then
      SalvaRegistro;
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfrmDigNotas.grdCellClick(Column: TColumn);
begin
  dbeCodigo.SetFocus;
end;

procedure TfrmDigNotas.SalvaRegistro;
var
  MyBookmark : TBookmark;
begin
  try
    MyBookmark := tblNotas.GetBookmark;
  except
  end;

  tblNotas.DisableControls;
  DM.tblNotas.Post;
  tblNotas.Close;
  tblNotas.Open;

  try
    tblNotas.GotoBookmark( MyBookmark );
    tblNotas.FreeBookmark( MyBookmark );
  except
    tblNotas.FreeBookmark( MyBookmark );
  end;

  tblNotas.Next;
  tblNotas.EnableControls;

  if tblNotas.Eof then
  begin
    Mensagem( 'Digitação chegou ao final da lista.', Application.Title,
               MB_OK + MB_ICONINFORMATION );
  end;

  dbeCodigo.SetFocus;
end;



procedure TfrmDigNotas.dbeN1KeyPress(Sender: TObject;
  var Key: Char);
begin

  if TUMZQuery( TDataSource( TDBEdit(Sender).DataSource ).DataSet).FieldByName(
    TDBEdit(Sender).DataField ) is TFloatField then
  begin
    if Key = '.' then Key := DecimalSeparator;
  end;

  if Key = #13 then
  begin
    SalvaRegistro;
    dbeCodigo.SetFocus;
    Key := #0;
  end;
end;

end.

