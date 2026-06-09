unit uNotasProf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QuickRpt, ExtCtrls, ZConnection, StdCtrls, Mask, DBCtrls, Qrctrls, uDM;

type
  TfmNotasProf = class(TForm)
    quAluno: TUMZQuery;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    detalhe: TQRBand;
    QRGroup2: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    fim: TQRBand;
    quAlunoDisciplina: TSmallintField;
    quAlunoNota1: TFloatField;
    quAlunoMediaFinal: TFloatField;
    quAlunoTotalFaltas: TSmallintField;
    quAlunoSituacao: TSmallintField;
    quAlunoNome: TStringField;
    QRDBText6: TQRDBText;
    dtmedia: TQRDBText;
    dttotalfaltas: TQRDBText;
    quAlunonotaaprov: TFloatField;
    quAlunofreq: TFloatField;
    QRLabel7: TQRLabel;
    QRDBText12: TQRDBText;
    dtnotaaprov: TQRDBText;
    lasituacao: TQRLabel;
    quAlunomediaanual: TFloatField;
    quAlunoCodigo: TStringField;
    quAlunoParecerAutorizacao: TStringField;
    quAlunoAnoSemestre: TSmallintField;
    quAlunoTurma: TStringField;
    quAlunoCodigoAluno: TIntegerField;
    quAlunodsdisciplina: TStringField;
    quAlunodscurso: TStringField;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText3: TQRDBText;
    quAlunocddisciplina: TSmallintField;
    QRLabel15: TQRLabel;
    QRSysData2: TQRSysData;
    quAlunoMediaInstitucional: TFloatField;
    quAlunoFrequencia: TSmallintField;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    quAlunoNotaExame: TFloatField;
    ColumnHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    quAlunoNomeProfessor: TStringField;
    QRDBText13: TQRDBText;
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure lasituacaoPrint(sender: TObject; var Value: String);
    procedure dtmediaPrint(sender: TObject; var Value: String);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    Function PreparaImpressao (Curso : String;
                               Turma : String;
                               AnoSemestre : Integer;
                               Disciplina : string) : Boolean;
  end;

var
  fmNotasProf: TfmNotasProf;

implementation

uses ufuncao;
{$R *.DFM}

Function TfmNotasProf.PreparaImpressao (Curso : String; Turma : String; AnoSemestre : Integer; Disciplina : string) : Boolean;
Var
   filtro, op : string;
Begin
   //
   With quAluno do Begin
       filtro := '';
       op := ' AND ';
       Close;
       Sql.Clear;
       Sql.Add('SELECT F.AnoSemestre, F.Turma, F.CodigoAluno, F.Disciplina, F.Nota1,');
       Sql.Add('       F.MediaFinal, F.TotalFaltas, F.Situacao, PI.MediaInstitucional,');
       Sql.Add('       Alunos.Nome, D.DESCRICAO as dsdisciplina,D.codigo as cddisciplina,');
       Sql.Add('       T.Codigo, Cursos.Descricao as dscurso,Cursos.ParecerAutorizacao, F.Frequencia, F.NotaExame, P.Nome as NomeProfessor');
       Sql.Add('FROM Alunos Alunos, Fichaindividual F,DISCIPLINAS D,cursos cursos, turmas t, ProvaInstitucional PI, TurmasProfessores TP, Professores P');
       Sql.Add('WHERE  (F.CodigoAluno = Alunos.Codigo) AND');
       Sql.Add('       (F.DISCIPLINA  = D.CODIGO)      AND');
       Sql.Add('       (F.CURSO       = D.CURSO)       AND');
       Sql.Add('       (F.CodigoAluno = PI.CodigoAluno) AND');
       Sql.Add('       (F.Turma = PI.Turma) AND');
       Sql.Add('       (F.AnoSemestre = PI.AnoSemestre) AND');
       Sql.Add('       (TP.AnoSemestre = F.AnoSemestre) AND');
       Sql.Add('       (TP.Curso = F.Curso ) AND');
       Sql.Add('       (TP.Turma = F.Turma) AND');
       Sql.Add('       (TP.Disciplina = F.Disciplina) AND');
       Sql.Add('       (TP.Professor = P.Codigo) AND');
       Sql.Add('       (F.anosemestre = t.anosemestre) AND');
       Sql.Add('       (F.Turma       = t.codigo)      AND');
       Sql.Add('       (F.anosemestre = cursos.anosemestre)  AND');
       Sql.Add('       (F.curso       = cursos.codigo)       AND');
       Sql.Add('       (F.Turma       = :turma)             AND');
       Sql.Add('       (F.AnoSemestre = :anosemestre)');

       op := ' AND ';

       if Disciplina <> '' then
          filtro := filtro + op + ' (F.DISCIPLINA  = :DISCIPLINA) ';
       if Curso <> '' Then
          filtro := filtro + op + ' (Cursos.Codigo = :Curso) ';
       if Turma <> '' Then
          filtro := filtro + op + ' (T.Codigo = :Turma) ';

       Sql.Add(filtro);
       Sql.Add('ORDER BY F.Disciplina,Alunos.Nome, Alunos.Codigo');

       ParamByNAme('AnoSemestre').Value := AnoSemestre;
       
       if Curso <> '' Then
          ParamByName('Curso').AsString := Curso;
       if Turma <> '' Then
          ParamByName('Turma').AsString := Turma;
       if Disciplina <> '' then
          ParamByName('disciplina').asstring := Disciplina;

       Open;

       if RecordCount > 0 Then Begin
          result := true;
       End
       Else Begin
          result := False;
          Close;
       End
   End;
End;


procedure TfmNotasProf.QRDBText6Print(sender: TObject; var Value: String);
begin
  value := formatanota(strtofloat(value));
end;

procedure TfmNotasProf.dtmediaPrint(sender: TObject;
  var Value: String);
begin
  value := formatanota(strtofloat(value));
end;

procedure TfmNotasProf.lasituacaoPrint(sender: TObject;
  var Value: String);
begin
  value := fnsituacao(qualuno.fieldbyname('situacao').asinteger)
end;

procedure TfmNotasProf.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   QRGroup2.Height:=2;
end;

procedure TfmNotasProf.ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Height := 31;
end;

end.


