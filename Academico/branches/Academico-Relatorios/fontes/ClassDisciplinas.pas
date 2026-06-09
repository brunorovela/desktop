unit ClassDisciplinas;

interface

uses
   SysUtils, Classes, UZDataSet, ClassRegistros;

Type
   TClasseDisciplinas = class(TObject)

      private
      protected
      public
         function GetDisciplinasFromTurma( nr_anosemestre: Integer; cd_turma: String ): ClasseRegistros;

         function IsUltimaDisciplinaAtiva( nr_anosemestre: Integer; cd_turma: String;
                                    cd_disciplina, cd_pessoa: Integer; turma_disciplina: String): Boolean;

   end;

var
   ClasseDisciplinas: TClasseDisciplinas;

implementation

uses uDM;

{ ClassDisciplinas }

function TClasseDisciplinas.GetDisciplinasFromTurma(nr_anosemestre: Integer; cd_turma: String): ClasseRegistros;
const
   SQL_GETDISCIPLINASFROMTURMA =
      ' SELECT d.codigo AS cd_disciplina, d.descricao AS ds_disciplina ' +
      ' FROM turmas t ' +
      '      INNER JOIN grades_disciplinas gd ON ( gd.CD_CURSO = t.curso AND gd.CD_GRADE = t.cd_grade AND gd.NR_SERIE = t.serie ) ' +
      '      INNER JOIN disciplinas d ON ( d.curso = t.curso AND d.codigo = gd.CD_DISCIPLINA ) ' +
      ' WHERE t.codigo = :CD_TURMA AND t.anosemestre = :NR_ANOSEMESTRE ' +
      ' ORDER BY t.descricao '; 
var
   qyGetDisciplinasFromTurma: TUMZQuery;
begin
   DM.CriarConsulta( qyGetDisciplinasFromTurma );
   Result := ClasseRegistros.Create();

   qyGetDisciplinasFromTurma.SQL.Text := SQL_GETDISCIPLINASFROMTURMA;
   qyGetDisciplinasFromTurma.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyGetDisciplinasFromTurma.ParamByName('CD_TURMA').AsString := cd_turma;
   qyGetDisciplinasFromTurma.Open();

   Result.CarregarQuery(qyGetDisciplinasFromTurma);

   FreeAndNil(qyGetDisciplinasFromTurma);
end;

function TClasseDisciplinas.IsUltimaDisciplinaAtiva(nr_anosemestre: Integer;
  cd_turma: String; cd_disciplina, cd_pessoa: Integer; turma_disciplina: String): Boolean;
const
   SQL_ISULTIMADISCIPLINAATIVA =
      ' SELECT fi.disciplina ' +
      ' FROM fichaindividual fi ' +
      '      INNER JOIN situacao s ON ( s.cd_situacao = fi.situacao ) ' +
      ' WHERE fi.turmamatricula = :CD_TURMA AND fi.anosemestre = :NR_ANOSEMESTRE AND ' +
      '       fi.codigoaluno = :CD_PESSOA AND s.cd_situacao_pai IN ( 0, 1, 2, 9, 10, 11, 12 ) AND ' +
      '     NOT  (fi.disciplina = :CD_DISCIPLINA  AND fi.turma = :turma_disciplina)';
var
   qyIsUltimaDisciplinaAtiva: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsUltimaDisciplinaAtiva);

   qyIsUltimaDisciplinaAtiva.SQL.Text := SQL_ISULTIMADISCIPLINAATIVA;
   qyIsUltimaDisciplinaAtiva.ParamByName('CD_TURMA').AsString := cd_turma;
   qyIsUltimaDisciplinaAtiva.ParamByName('TURMA_DISCIPLINA').AsString := turma_disciplina;
   qyIsUltimaDisciplinaAtiva.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyIsUltimaDisciplinaAtiva.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyIsUltimaDisciplinaAtiva.ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;
   qyIsUltimaDisciplinaAtiva.Open();

   Result := ( qyIsUltimaDisciplinaAtiva.RecordCount = 0 );

   FreeAndNil( qyIsUltimaDisciplinaAtiva );
end;

end.
