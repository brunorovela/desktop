unit uMatriculaEtapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZConnection;

type
  TFrmMatricula_Etapa = class(TFrame)
    grd: TDBGrid;
    ckbEtapaSeguinte: TCheckBox;
    Label14: TLabel;
    tblTurmas: TUMZQuery;
    tblTurmasAnoSemestre: TSmallintField;
    tblTurmasCodigo: TStringField;
    tblTurmasSerie: TSmallintField;
    tblTurmasCurso: TStringField;
    tblTurmasTurno: TStringField;
    tblTurmasDescricao: TStringField;
    tblTurmasContrato: TStringField;
    tblTurmasVagas: TSmallintField;
    tblTurmasHoraInicio: TDateTimeField;
    tblTurmasHoraFim: TDateTimeField;
    tblTurmasDataInicio: TDateTimeField;
    tblTurmasDataFim: TDateTimeField;
    tblTurmasIdadeConclusao: TSmallintField;
    tblTurmasDataConclusao: TDateTimeField;
    tblTurmasDepto: TSmallintField;
    tblTurmasqtd_matriculas: TIntegerField;
    tblTurmascd_centro: TIntegerField;
    tblTurmascd_coligada: TSmallintField;
    dtcTurmas: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Filtrar();
  end;

implementation

{$R *.dfm}

{ TFrmMatricula_Etapa }

procedure TFrmMatricula_Etapa.Filtrar;
begin
   if ckbEtapaSeguinte.Visible Then Begin
      if ckbEtapaSeguinte.Checked Then Begin
      	  tblTurmas.Close;
	        tblTurmas.SQL.Text := ' select Turmas.*, Cursos.Depto from Turmas,  Cursos';
	        tblTurmas.SQL.Add('where Turmas.AnoSemestre = :AnoSemestre AND Turmas.Curso = Cursos.Codigo');
	        tblTurmas.SQL.Add('AND Cursos.AnoSemestre = Turmas.AnoSemestre AND Cursos.Codigo = :Curso');
	        tblTurmas.SQL.Add('AND Turmas.Serie = :serie');
          tblTurmas.SQL.Add('order by Turmas.Codigo');

	        tblTurmas.ParamByName('Curso').AsString := tblMatriculasCurso.ASString;
	        tblTurmas.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.ASInteger;
	        tblTurmas.ParamByName('Serie').AsInteger := Serie;

	        tblTurmas.Open;
	        exit;
       End
   end;

   tblTurmas.Close;
   tblTurmas.SQL.Text := ' select Turmas.*, Cursos.Depto from Turmas,  Cursos';
   tblTurmas.SQL.Add('where Turmas.AnoSemestre = :AnoSemestre AND Turmas.Curso = Cursos.Codigo');
   tblTurmas.SQL.Add('AND Cursos.AnoSemestre = Turmas.AnoSemestre AND Cursos.Codigo = :Curso');
   tblTurmas.SQL.Add('order by Turmas.Codigo');

   tblTurmas.ParamByName('Curso').AsString := tblMatriculasCurso.ASString;
   tblTurmas.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.ASInteger;

   tblTurmas.Open;
end;

end.

