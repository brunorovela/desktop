unit uRelPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, ZConnection, uDM;

type
  TfrmRelProvaInstitucional = class(TForm)
    tblCursosTurmas: TUMZQuery;
    tblCursosTurmasCURSO: TStringField;
    tblCursosTurmasTURMA: TStringField;
    tblCursosTurmasAnoSemestre: TSmallintField;
    tblAlunosPI: TUMZQuery;
    dsCursosTurmas: TDataSource;
    tblAlunosPICodigo: TIntegerField;
    tblAlunosPINome: TStringField;
    tblAlunosPINotaRedacao: TFloatField;
    tblAlunosPINotaProva: TFloatField;
    tblAlunosPIMediaInstitucional: TFloatField;
    Pagina: TQuickRep;
    DetailBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    CabAlunos: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    RodaAlunos: TQRBand;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    Function PreparaImpressao (Curso : String;
                               Turma : String;
                               AnoSemestre : Integer) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProvaInstitucional: TfrmRelProvaInstitucional;

implementation

{$R *.DFM}

Function TfrmRelProvaInstitucional.PreparaImpressao (Curso : String; Turma : String; AnoSemestre : Integer) : Boolean;
Var
   filtro, op : string;
Begin
   //
   With tblCursosTurmas do Begin
       filtro := '';
       op := ' AND ';
       Close;
       Sql.Clear;
       Sql.Add('Select Cursos.Descricao AS CURSO, Turmas.Codigo As TURMA,');
       Sql.Add('Turmas.AnoSemestre From Cursos, Turmas');
       Sql.Add('Where Cursos.Codigo = Turmas.Curso and Cursos.AnoSemestre = Turmas.AnoSemestre');

       filtro := filtro + op + 'Turmas.AnoSemestre = :AnoSemestre';
       op := ' AND ';

       if Curso <> '' Then
          filtro := filtro + op + 'Cursos.Codigo = :Curso';
       if Turma <> '' Then
          filtro := filtro + op + 'Turmas.Codigo = :Turma';

       Sql.Add(filtro);
       Sql.Add('Order By Cursos.Codigo, Turmas.Codigo');

       ParamByNAme('AnoSemestre').Value := AnoSemestre;
       if Curso <> '' Then
          ParamByName('Curso').AsString := Curso;
       if Turma <> '' Then
          ParamByName('Turma').AsString := Turma;

       Open;

       if RecordCount > 0 Then Begin
          tblAlunosPI.Open;
          result := true;
       End
       Else Begin
          result := False;
          Close;
       End
   End;
End;

end.

