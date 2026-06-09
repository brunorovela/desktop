unit ClassTurmas;

interface

uses
   SysUtils, Classes, UZDataSet, ClassRegistros, UZDbcFuncs, ZDbcIntfs;

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
   SSQLSelectCronograma =
      'SELECT ' +
         'MIN(DT_CRONOGRAMA),' +
         'MAX(DT_CRONOGRAMA) ' +
      'FROM ' +
         'DIARIO_CRONOGRAMAS ' +
      'WHERE ' +
         'TURMA = ? AND ' +
         'ANOSEMESTRE = ?';

   SSQLUpdateInicioFimTurma =
      'UPDATE TURMAS ' +
      'SET ' +
         'DATAINICIO = ?,' +
         'DATAFIM = GREATEST(COALESCE(DATAFIM, 0), ?),' +
         'DATACONCLUSAO = GREATEST(COALESCE(DATACONCLUSAO, 0), ?) ' +
      'WHERE ' +
         'ANOSEMESTRE = ? AND ' +
         'CODIGO = ?';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Found: Boolean;
   Inicio, Fim: TDateTime;
begin
   Found := False;
   
   Stmt := PrepareStatement(SSQLSelectCronograma);
   try
      Stmt.SetString(1, cd_turma);
      Stmt.SetInt(2, nr_anosemestre);
      Rs := Stmt.ExecuteQueryPrepared;
      if Rs.Next then
      begin
         Found := True;
         Inicio := Rs.GetTimestamp(1);
         Fim := Rs.GetTimestamp(2);
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if Found then
   begin
      Stmt := PrepareStatement(SSQLUpdateInicioFimTurma);
      try
         Stmt.SetTimestamp(1, Inicio);
         Stmt.SetTimestamp(2, Fim);
         Stmt.SetTimestamp(3, Fim);
         Stmt.SetInt(4, nr_anosemestre);
         Stmt.SetString(5, cd_turma);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;

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
   SQL_GET_CURSO_TURMA_FROM_ALUNO_ANOSEMESTRE = ''
      + 'SELECT '
      + '	m.curso cd_curso, '
      + '	m.turma cd_turma, '
      + '	m.planopagamento cd_plano '
      + 'FROM '
      + '	matriculas m '
      + '		JOIN cursos_mestre cm ON '
      + '			(cm.CD_CURSO = m.curso) '
      + '		JOIN situacao s ON '
      + '			(m.situacao = s.cd_situacao) '
      + 'WHERE '
      + '	m.anosemestre = :nr_anosemestre AND '
      + '	m.codigoaluno = :cd_pessoa '
      + 'ORDER BY '
      + '	(s.cd_situacao_pai = 1) DESC, '
      + '	(s.cd_situacao_pai = 2) DESC, '
      + '	(s.cd_situacao_pai = 0) DESC, '
      + '	 cm.NR_RELEVANCIA DESC  '
      + ' LIMIT 1 ';
var
   qyGetCursoTurmaFromAlunoAnosemestre : TUMZQuery;
begin
   DM.CriarConsulta(qyGetCursoTurmaFromAlunoAnosemestre);
   Result := ClasseRegistros.Create();

   qyGetCursoTurmaFromAlunoAnosemestre.Close();
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
