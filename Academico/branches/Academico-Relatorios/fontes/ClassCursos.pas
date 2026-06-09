unit ClassCursos;

interface

uses
   SysUtils, Classes, UZDataSet, ClassRegistros;

Type
   TClasseCursos = class(TObject)
      public
         function GetDepartamento( cd_curso: String; cd_coligada: Integer ): Integer;
         function GetCursoFromTurma( cd_turma: String; nr_anosemestre: Integer ): String;
         function GetTurmasFromCurso( cd_curso: String; nr_anosemestre: Integer ): TStringList;
   end;

var
   ClasseCursos: TClasseCursos;

implementation

uses uDM, DB;

{ TClasseCursos }

function TClasseCursos.GetCursoFromTurma(cd_turma: String;
  nr_anosemestre: Integer): String;
const
   SQL_GET_CURSO_FROM_TURMA =
      ' SELECT curso AS CD_CURSO FROM turmas ' +
      ' WHERE codigo = :CD_TURMA AND anosemestre = :NR_ANOSEMESTRE ';
var
   qyGetCursoFromTurma: TUMZQuery;
begin
   DM.CriarConsulta(qyGetCursoFromTurma);
   qyGetCursoFromTurma.Close();
   qyGetCursoFromTurma.SQL.Text := SQL_GET_CURSO_FROM_TURMA;
   qyGetCursoFromTurma.ParamByName('CD_TURMA').AsString := cd_turma;
   qyGetCursoFromTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyGetCursoFromTurma.Open();

   Result := '';

   if ( qyGetCursoFromTurma.RecordCount > 0 ) then
      Result := qyGetCursoFromTurma.FieldByName('CD_CURSO').AsString;

   FreeAndNil(qyGetCursoFromTurma);
end;

function TClasseCursos.GetDepartamento(cd_curso: String;
  cd_coligada: Integer): Integer;
const
   SQL_GETDEPARTAMENTO =
      ' SELECT CD_DEPTO FROM CURSOS_COLIGADAS ' +
      ' WHERE CD_CURSO = :CD_CURSO AND CD_COLIGADA = :CD_COLIGADA ';
var
   qyGetDepartamento: TUMZQuery;
begin
   DM.CriarConsulta(qyGetDepartamento);

   qyGetDepartamento.SQL.Text := SQL_GETDEPARTAMENTO;
   qyGetDepartamento.ParamByName('CD_CURSO').AsString := cd_curso;
   qyGetDepartamento.ParamByName('CD_COLIGADA').AsInteger := cd_coligada;
   qyGetDepartamento.Open();

   Result := qyGetDepartamento.FieldByName('CD_DEPTO').AsInteger;
   FreeAndNil(qyGetDepartamento);
end;


function TClasseCursos.GetTurmasFromCurso(cd_curso: String;
  nr_anosemestre: Integer): TStringList;
const
   SQL_TURMAS_FROM_CURSO =
      'SELECT codigo FROM turmas WHERE anosemestre = :nr_anosemestre AND curso = :cd_curso';   
var
   qyTurmasFromCurso: TUMZQuery;
begin

   Result := TStringList.Create;

   DM.CriarConsulta(qyTurmasFromCurso);

   with qyTurmasFromCurso do
   begin

      sql.Text := SQL_TURMAS_FROM_CURSO;

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_curso').AsString := cd_curso;

      Open();

      while not eof do
      begin

         Result.Add( FieldByName('codigo').AsString );
         next();
         
      end;

   end;

end;

end.
