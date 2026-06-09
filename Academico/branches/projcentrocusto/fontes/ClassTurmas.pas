unit ClassTurmas;

interface

uses
   SysUtils, Classes, UZDataSet, ClassRegistros;

Type
   TClasseTurmas = class(TObject)
      public
         function GetCentroCusto( nr_anosemestre: Integer; cd_curso, cd_turma: String; cd_coligada: Integer = 0 ): Integer;
         function GetCursoTurmaFromAlunoAnosemestre( const cd_pessoa, nr_anosemestre: Integer ): ClasseRegistros;
         function GetParametroAvaliacao( const nr_anosemestre: Integer;
            const cd_turma: String; const cd_disciplina: String; const campo: String; const condicao_in: Boolean = False ): String;
         function IsDataInicioFimFromCronograma(const nr_anosemestre: Integer;
            const cd_turma: String): Boolean;
         function GetInformacaoDiarioTurma( const nr_anosemestre: Integer; const cd_turma: String;
            const cd_disciplina, nr_etapa: Integer; const campo: String ): String;
         procedure CalculaDataInicioFimTurma(const nr_anosemestre: Integer;
            const cd_turma: String);
   end;

var
   ClasseTurmas: TClasseTurmas;

implementation

uses uDM, DB;

{ TClasseTurmas }

procedure TClasseTurmas.CalculaDataInicioFimTurma(const nr_anosemestre: Integer;
  const cd_turma: String);
const
   SQL_VERIFICA_CRONOGRAMA_TODAS_DISCIPLINAS =
      ' SELECT t.anosemestre, t.codigo, gd.CD_DISCIPLINA, dc.cd_cronograma ' +
      ' FROM turmas t ' +
      '      INNER JOIN grades_disciplinas gd ON ( ' +
      '         gd.CD_CURSO = t.curso AND gd.CD_GRADE = t.cd_grade ' +
      '      ) ' +
      '      LEFT JOIN diario_cronogramas dc ON ( ' +
      '         dc.anosemestre = t.anosemestre AND dc.turma = t.codigo AND ' +
      '         dc.disciplina = gd.CD_DISCIPLINA ' +
      '      ) ' +
      ' WHERE t.anosemestre = :nr_anosemestre AND ' +
      '       t.codigo = :cd_turma ' +
      ' GROUP BY t.anosemestre, t.codigo, gd.CD_DISCIPLINA, dc.cd_cronograma ' +
      ' HAVING cd_cronograma IS NULL ';
   SQL_ALTERA_DATA_INICIO_FIM_TURMA_INICIO =
      ' UPDATE turmas t ' +
      ' SET ' +
      '    t.datainicio = ( ' +
      '       SELECT MIN(dc.dt_cronograma) FROM diario_cronogramas dc ' +
      '       WHERE dc.anosemestre = t.anosemestre AND dc.turma = t.codigo ' +
      '    ) ' +
      ' WHERE t.anosemestre = :nr_anosemestre AND ' +
      '       t.codigo = :cd_turma ';
   SQL_ALTERA_DATA_INICIO_FIM_TURMA_FIM =
      ' UPDATE turmas t ' +
      ' SET ' +
      '    t.datafim = ( ' +
      '       SELECT MAX(dc.dt_cronograma) FROM diario_cronogramas dc ' +
      '       WHERE dc.anosemestre = t.anosemestre AND dc.turma = t.codigo ' +
      '    ), ' +
      '    t.dataconclusao = ( ' +
      '       SELECT MAX(dc.dt_cronograma) FROM diario_cronogramas dc ' +
      '       WHERE dc.anosemestre = t.anosemestre AND dc.turma = t.codigo ' +
      '    )' +
      ' WHERE t.anosemestre = :nr_anosemestre AND ' +
      '       t.codigo = :cd_turma ';
var
   qyCalculaDataInicioFimTurma: TUMZQuery;
begin
   DM.CriarConsulta(qyCalculaDataInicioFimTurma);

   qyCalculaDataInicioFimTurma.SQL.Text := SQL_ALTERA_DATA_INICIO_FIM_TURMA_INICIO;
   qyCalculaDataInicioFimTurma.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyCalculaDataInicioFimTurma.ParamByName('cd_turma').AsString := cd_turma;
   qyCalculaDataInicioFimTurma.ExecSQL();

   qyCalculaDataInicioFimTurma.Close();
   qyCalculaDataInicioFimTurma.SQL.Text := SQL_VERIFICA_CRONOGRAMA_TODAS_DISCIPLINAS;
   qyCalculaDataInicioFimTurma.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyCalculaDataInicioFimTurma.ParamByName('cd_turma').AsString := cd_turma;

   qyCalculaDataInicioFimTurma.Open();

   if ( qyCalculaDataInicioFimTurma.RecordCount = 0 ) then
   begin
      qyCalculaDataInicioFimTurma.Close();
      qyCalculaDataInicioFimTurma.SQL.Text := SQL_ALTERA_DATA_INICIO_FIM_TURMA_FIM;
      qyCalculaDataInicioFimTurma.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      qyCalculaDataInicioFimTurma.ParamByName('cd_turma').AsString := cd_turma;
      qyCalculaDataInicioFimTurma.ExecSQL();
   end;

   FreeAndNil( qyCalculaDataInicioFimTurma );   
end;

function TClasseTurmas.GetCentroCusto(nr_anosemestre: Integer; cd_curso,
  cd_turma: String; cd_coligada: Integer): Integer;
const
   SQL_GETCENTROCUSTO =
      ' SELECT COALESCE( cd_centro, 0 ) AS cd_centro_custo FROM turmas ' +
      ' WHERE anosemestre = :NR_ANOSEMESTRE AND curso = :CD_CURSO AND codigo = :CD_TURMA AND cd_coligada = :CD_COLIGADA ';
var
   qyGetCentroCusto: TUMZQuery;
begin
   DM.CriarConsulta(qyGetCentroCusto);

   if ( cd_coligada = 0 ) then
   begin
      cd_coligada := DM.getColigadaByTurma(cd_turma, nr_anosemestre);
   end;   

   qyGetCentroCusto.SQL.Text := SQL_GETCENTROCUSTO;
   qyGetCentroCusto.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
   qyGetCentroCusto.ParamByName('CD_CURSO').AsString := cd_curso;
   qyGetCentroCusto.ParamByName('CD_TURMA').AsString := cd_turma;
   qyGetCentroCusto.ParamByName('CD_COLIGADA').AsInteger := cd_coligada;

   qyGetCentroCusto.Open();

   try
      Result := qyGetCentroCusto.FieldByName('cd_centro_custo').AsInteger;
   except
      Result := 0;
   end;

   FreeAndNil(qyGetCentroCusto);
end;

function TClasseTurmas.GetCursoTurmaFromAlunoAnosemestre(const cd_pessoa,
  nr_anosemestre: Integer): ClasseRegistros;
const
   SQL_GET_CURSO_TURMA_FROM_ALUNO_ANOSEMESTRE =
      ' SELECT m.curso AS cd_curso, m.turma AS cd_turma, m.planopagamento AS cd_plano ' +
      ' FROM matriculas m ' +
      '      INNER JOIN cursos_mestre cm ON ( cm.CD_CURSO = m.curso ) ' +
      ' WHERE m.anosemestre = :nr_anosemestre AND m.codigoaluno = :cd_pessoa ' +
      ' ORDER BY cm.NR_RELEVANCIA ' +
      ' LIMIT 1 '; 
   SQL_GET_CURSO_TURMA_FROM_ALUNO_ANOSEMESTRE_ORACLE =
      ' SELECT * FROM ( SELECT curso AS cd_curso, turma AS cd_turma, planopagamento AS cd_plano ' +
      ' FROM matriculas m ' +
      '      INNER JOIN cursos_mestre cm ON ( cm.CD_CURSO = m.curso ) ' +
      ' WHERE m.anosemestre = :nr_anosemestre AND m.codigoaluno = :cd_pessoa ' +
      ' ORDER BY cm.NR_RELEVANCIA ) tabela WHERE ROWNUM = 1 ';
var
   qyGetCursoTurmaFromAlunoAnosemestre : TUMZQuery;
begin
   DM.CriarConsulta(qyGetCursoTurmaFromAlunoAnosemestre);
   Result := ClasseRegistros.Create();

   qyGetCursoTurmaFromAlunoAnosemestre.Close();

   if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
      qyGetCursoTurmaFromAlunoAnosemestre.SQL.Text := SQL_GET_CURSO_TURMA_FROM_ALUNO_ANOSEMESTRE_ORACLE
   else
      qyGetCursoTurmaFromAlunoAnosemestre.SQL.Text := SQL_GET_CURSO_TURMA_FROM_ALUNO_ANOSEMESTRE;

   qyGetCursoTurmaFromAlunoAnosemestre.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyGetCursoTurmaFromAlunoAnosemestre.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;

   qyGetCursoTurmaFromAlunoAnosemestre.Open();

   Result.CarregarQuery(qyGetCursoTurmaFromAlunoAnosemestre);
end;

function TClasseTurmas.GetInformacaoDiarioTurma(const nr_anosemestre: Integer; const cd_turma: String;
  const cd_disciplina, nr_etapa: Integer; const campo: String): String;
const
   SQL_GET_INFORMACAO_DIARIO_TURMA =
      ' SELECT %s AS valor FROM diario_turmas ' +
      ' WHERE turma = :cd_turma AND anosemestre = :nr_anosemestre AND ' +
      '       disciplina = :cd_disciplina AND bimestre = :nr_etapa ';
var
   qyGetInformacaoDiarioturma: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetInformacaoDiarioturma);
   qyGetInformacaoDiarioturma.SQL.Text := Format( SQL_GET_INFORMACAO_DIARIO_TURMA, [ campo ] );

   qyGetInformacaoDiarioturma.ParamByName('cd_turma').AsString          := cd_turma;
   qyGetInformacaoDiarioturma.ParamByName('nr_anosemestre').AsInteger   := nr_anosemestre;
   qyGetInformacaoDiarioturma.ParamByName('cd_disciplina').AsInteger    := cd_disciplina;
   qyGetInformacaoDiarioturma.ParamByName('nr_etapa').AsInteger         := nr_etapa;

   Result := EmptyStr;

   try
      try
         qyGetInformacaoDiarioturma.Open();

         Result := qyGetInformacaoDiarioturma.FieldByName('valor').AsString;
      except
      end;
   finally
      FreeAndNil(qyGetInformacaoDiarioturma);
   end;
end;

function TClasseTurmas.GetParametroAvaliacao(const nr_anosemestre: Integer;
  const cd_turma, cd_disciplina, campo: String; const condicao_in: Boolean): String;
const
   SQL_GET_PARAMETRO_AVALIACAO =
      ' SELECT DISTINCT ap.[campo] AS valor ' +
      ' FROM turmas t ' +
      ' 	    LEFT JOIN grades_disciplinas gd ON ( ' +
		'         gd.cd_curso = t.curso ' +
		'         AND gd.nr_serie = t.serie ' +
		'         AND gd.cd_grade = t.cd_grade ' +
      '         AND gd.cd_disciplina = :cd_disciplina ' +
      '      ) '+
      '      INNER JOIN avaliacoes_parametros ap ON ( ap.cd_avaliacao = COALESCE( gd.cd_avaliacao, t.cd_avaliacao	) ) ' +
      ' WHERE t.anosemestre = :NR_ANOSEMESTRE ';
var
   qyGetParametroAvaliacao: TUMZQuery;
   separador : string;
begin
   DM.CriarConsulta(qyGetParametroAvaliacao);

   qyGetParametroAvaliacao.SQL.Text := StringReplace( SQL_GET_PARAMETRO_AVALIACAO, '[campo]', campo, [rfIgnoreCase] );

   if ( condicao_in ) then
      qyGetParametroAvaliacao.SQL.Add( ' AND t.codigo IN ( ' + cd_turma + ' ) ' )
   else begin
      qyGetParametroAvaliacao.SQL.Add( ' AND t.codigo = :CD_TURMA ' );
      qyGetParametroAvaliacao.ParamByName('CD_TURMA').AsString := cd_turma;
   end;

   qyGetParametroAvaliacao.ParamByName('cd_disciplina').AsString := cd_disciplina;

   qyGetParametroAvaliacao.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;

   qyGetParametroAvaliacao.Open;

   separador := '';
   Result := '';
   while not qyGetParametroAvaliacao.EOF do
   begin
      Result := Result + separador + qyGetParametroAvaliacao.FieldByName('valor').AsString;
      separador := ',';
      qyGetParametroAvaliacao.Next;
   end;

   FreeAndNil(qyGetParametroAvaliacao);
end;

{
  Verifica se a turma passada por parâmetro tem a data de início e fim
  condicionadas a data dos cronogramas
}
function TClasseTurmas.IsDataInicioFimFromCronograma(
  const nr_anosemestre: Integer; const cd_turma: String): Boolean;
const
   SQL_IS_DATA_INICIO_FIM_FROM_CRONOGRAMA =
      ' SELECT sn_cronograma_geren_inicio_fim FROM turmas ' +
      ' WHERE anosemestre = :nr_anosemestre AND codigo = :cd_turma ';
var
   qyIsDataInicioFimFromCronograma: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsDataInicioFimFromCronograma);

   qyIsDataInicioFimFromCronograma.SQL.Text := SQL_IS_DATA_INICIO_FIM_FROM_CRONOGRAMA;
   qyIsDataInicioFimFromCronograma.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyIsDataInicioFimFromCronograma.ParamByName('cd_turma').AsString := cd_turma;

   qyIsDataInicioFimFromCronograma.Open();

   Result := ( qyIsDataInicioFimFromCronograma.FieldByName('sn_cronograma_geren_inicio_fim').AsInteger = 1 );

   FreeAndNil(qyIsDataInicioFimFromCronograma);
end;

end.
