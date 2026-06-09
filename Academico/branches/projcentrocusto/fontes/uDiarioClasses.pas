unit uDiarioClasses;

interface

uses
   uDM, ZConnection, SysUtils, Contnrs, UZDataset, uDMDiario;

const
   MAX_AULAS = 160; // Número máximo de aulas no diário

type
   { Esta enumeração possui todos os possíveis valores de retorno na tentativa
     de efetuar a exclusão de uma ou várias aulas do diário do professor.
     derErrExcAula: erro ao tentar efetuar a exclusão da(s) aula(s)
     derErrAtuFreq: erro ao tentar efetuar a atualização das freqüências dos alunos no diário
     derErrAtuNums: erro ao tentar efetuar a atualização dos números das aulas após a exclusão de aula(s)
     derErrLimpaFreq: erro ao tentar excluir as freqüências de aulas excluídas no diário dos alunos
     derErrAtuTotAulas: erro ao tentar atualizar o valor de total de aulas do professor
     derErrAtuFaltas: erro ao tentar atualizar o número de faltas no diário de matrículas e ficha individual
     derErrAtuFI: erro ao tentar atualizar as freqüências na ficha individual
     derSucesso: o processo de exclusão da aula ocorreu com sucesso
   }
   TUMDiarioExclusaoRet = (derErrExcAula, derErrAtuFreq, derErrAtuNums,
      derErrLimpaFreq, derErrAtuTotAulas, derErrAtuFaltas, derErrAtuFI,
      derSucesso);

   TUMDiarioAulas = class;

   { Esta classe guarda todas as informações pertinentes a uma aula no diário de
     aulas. Também disponibiliza métodos para exclusão da aula na base de dados
     efetuando a atualização das freqüências dos alunos.
   }
   TUMAula = class(TObject)
   strict private
      FSCodTurma: string;
      FINumero: integer;
      FIEtapa: integer;
      FIAnoSemestre: integer;
      FICodDisciplina: integer;
      FBExcluida: boolean;
      FUMDiarioAulas: TUMDiarioAulas;
      function atualizaFrequencias: TUMDiarioExclusaoRet; overload;
      function atualizaFrequencias(const AINumDestino: integer): TUMDiarioExclusaoRet; overload;
   private
      constructor Create(const ASCodTurma: string; const AINumero, AIEtapa, AIAnoSemestre, AICodDisciplina: integer; AUMDiarioAulas: TUMDiarioAulas);
      destructor Destroy; override;
      function exclui: TUMDiarioExclusaoRet;
//      function setNumero(const AINumero: integer): TUMDiarioExclusaoRet;
      property Numero: integer read FINumero;
      property Excluida: boolean read FBExcluida write FBExcluida;
   end;

   { Esta classe possui os atributos necessários para armazenar as informações
     do diário do professor. Possuí métodos que permitem a exclusão de aulas,
     para apenas o número das aulas que deseja excluir.
   }
   TUMDiarioAulas = class(TObject)
   strict private
      FSMsgErro: string;
      FSCodTurma: string;
      FIAulaMaxima: integer;
      FIEtapa: integer;
      FIAnoSemestre: integer;
      FICodProfessor: integer;
      FICodDisciplina: integer;
      FOlAulas: TObjectList;
      procedure carregaDiario;
      procedure setAulaMaxima;
      function getTipoFrequencia: string;
      function getTotalAulas: integer;
      function getUltimaAula: integer;
//      function limpaFrequencias: TUMDiarioExclusaoRet;
//      function atualizaFaltas: TUMDiarioExclusaoRet;
      function atualizaFrequenciaFI: TUMDiarioExclusaoRet;
      function atualizaTotalAulas(const AIQuantidade: integer): TUMDiarioExclusaoRet;
//      function atualizaNumeroAulas(const AINumExcluido: integer): TUMDiarioExclusaoRet; overload;
//      function atualizaNumeroAulas(const AAulas: array of integer): TUMDiarioExclusaoRet; overload;
   private
      procedure setMsgErro(const ASMsgErro: string);
      property AulaMaxima: integer read FIAulaMaxima;
   public
      constructor Create(const ASCodTurma: string; const AIEtapa, AIAnoSemestre, AICodProfessor, AICodDisciplina: integer);
      destructor Destroy; override;
      function excluiAula(const AINumero: integer): TUMDiarioExclusaoRet; overload;
//      function excluiAula(const AAulas: array of integer): TUMDiarioExclusaoRet; overload;
      property MsgErro: string read FSMsgErro;
   end;

implementation

{ TUMAula }

{ Efetua a atualização das freqüências dos alunos no diário após a exclusão
  deste registro de aula, ou seja, após a exclusão somente desta aula.
}
function TUMAula.atualizaFrequencias: TUMDiarioExclusaoRet;
const
   SQL_AFREQS =
      'DELETE FROM diario_aulas_alunos '+
      'WHERE '+
         'cd_turma = :turma AND '+
         'nr_anosem = :anosemestre AND '+
         'cd_disciplina = :disciplina AND '+
         'cd_bimestre = :bimestre AND ' +
         'nr_aula = :aula';
         
   SQL_AFREQS2 =
      'UPDATE diario_aulas_alunos '+
      '   SET nr_aula = nr_aula - 1 '+
      'WHERE '+
         'cd_turma = :turma AND '+
         'nr_anosem = :anosemestre AND '+
         'cd_disciplina = :disciplina AND '+
         'cd_bimestre = :bimestre AND ' +
         'nr_aula > :aula AND ' +
         'nr_aula <= :aula2';

   SQL_AFREQS3 =
      'UPDATE diario_aulas '+
      '   SET nro_aula = nro_aula - 1 '+
      'WHERE '+
         'turma = :turma AND '+
         'anosemestre = :anosemestre AND '+
         'disciplina = :disciplina AND '+
         'bimestre = :bimestre AND ' +
         'nro_aula > :aula AND ' +
         'nro_aula <= :aula2';

var
   qyAFreqs: TUMZQuery;
   i: integer;
begin
   Result := derSucesso;
   DM.CriarConsulta(qyAFreqs);

  // Atualizar o número das aulas

   qyAFreqs.SQL.Clear;
   qyAFreqs.SQL.Text := SQL_AFREQS3;

   qyAFreqs.ParamCheck := True;
   qyAFreqs.ParamByName('turma').AsString := Self.FSCodTurma;
   qyAFreqs.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   qyAFreqs.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
   qyAFreqs.ParamByName('bimestre').AsInteger := Self.FIEtapa;
   qyAFreqs.ParamByName('aula').AsInteger := Self.FINumero; // Numero da Aula a Ser atualizada
   qyAFreqs.ParamByName('aula2').AsInteger := Self.FUMDiarioAulas.AulaMaxima; // Atualizar somente até o número de aulas máxima;

   qyAFreqs.ExecSQL(); // Atualizar o número de Aulas

   // Excluir as frequencias da aula excluida
   qyAFreqs.SQL.Text := SQL_AFREQS;

   qyAFreqs.ParamCheck := True;
   qyAFreqs.ParamByName('turma').AsString := Self.FSCodTurma;
   qyAFreqs.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   qyAFreqs.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
   qyAFreqs.ParamByName('bimestre').AsInteger := Self.FIEtapa;
   qyAFreqs.ParamByName('aula').AsInteger := Self.FINumero; // Numero da Aula a Ser excluida

   qyAFreqs.ExecSQL(); // Excluida a frequencia dos alunos

   // Atualizar agora o número das demais aulas

   qyAFreqs.SQL.Clear;
   qyAFreqs.SQL.Text := SQL_AFREQS2;

   qyAFreqs.ParamCheck := True;
   qyAFreqs.ParamByName('turma').AsString := Self.FSCodTurma;
   qyAFreqs.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   qyAFreqs.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
   qyAFreqs.ParamByName('bimestre').AsInteger := Self.FIEtapa;
   qyAFreqs.ParamByName('aula').AsInteger := Self.FINumero; // Numero da Aula a Ser atualizada
   qyAFreqs.ParamByName('aula2').AsInteger := Self.FUMDiarioAulas.AulaMaxima; // Atualizar somente até o número de aulas máxima;

   qyAFreqs.ExecSQL(); // Atualizar o número de Aulas

   FreeAndNil(qyAFreqs);       

end;

{ Atualiza as freqüências dos alunos no diário após a exclusão da aula.
  As freqüências são copiadas da aula cujo número é o especificado no parâmetro
  para o número de aula que foi redefinido.
}
function TUMAula.atualizaFrequencias(
  const AINumDestino: integer): TUMDiarioExclusaoRet;
const
   SQL_AFREQ =
      'UPDATE diario_aulas_alunos '+
      '   SET nr_aula = :aula '+
      'WHERE '+
         'cd_turma = :turma AND '+
         'nr_anosem = :anosemestre AND '+
         'cd_disciplina = :disciplina AND '+
         'cd_bimestre = :bimestre AND ' +
         'nr_aula = :aula2';
var
   qyAFreq: TUMZQuery;
begin
   Result := derSucesso;
   // Monta string para efetuar atualização das freqüências
   DM.CriarConsulta(qyAFreq);
   try
      qyAFreq.SQL.Text := SQL_AFREQ;
      qyAFreq.ParamCheck := True;
      qyAFreq.ParamByName('turma').AsString := Self.FSCodTurma;
      qyAFreq.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyAFreq.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyAFreq.ParamByName('bimestre').AsInteger := Self.FIEtapa;
      qyAFreq.ParamByName('aula').AsInteger := AINumDestino; // Nova Aula
      qyAFreq.ParamByName('aula2').AsInteger := Self.FINumero; // Aula Atual
      // Tenta efetuar a atualização das freqüências
      try
         qyAFreq.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrAtuFreq;
            Self.FUMDiarioAulas.setMsgErro(E.Message);
         end;
      end;
   finally
      FreeAndNil(qyAFreq);
   end;
end;

{ Construtor. }
constructor TUMAula.Create(const ASCodTurma: string; const AINumero, AIEtapa,
  AIAnoSemestre, AICodDisciplina: integer; AUMDiarioAulas: TUMDiarioAulas);
begin
   inherited Create;
   Self.FSCodTurma := ASCodTurma;
   Self.FINumero := AINumero;
   Self.FIEtapa := AIEtapa;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FICodDisciplina := AICodDisciplina;
   Self.FBExcluida := False;
   Self.FUMDiarioAulas := AUMDiarioAulas;
end;

{ Destrutor. }
destructor TUMAula.Destroy;
begin
   Self.FUMDiarioAulas := nil;
   inherited;
end;

{ Efetua a exclusão da aula na base de dados. }
function TUMAula.exclui: TUMDiarioExclusaoRet;
const
   SQL_EXCLUI =
      'DELETE FROM diario_aulas '+
      'WHERE '+
         'nro_aula = :nro_aula AND '+
         'turma = :turma AND '+
         'anosemestre = :anosemestre AND '+
         'disciplina = :disciplina AND '+
         'bimestre = :bimestre';
var
   qyEAula: TUMZQuery;
begin
   Result := derSucesso;
   DM.CriarConsulta(qyEAula);
   try
      qyEAula.SQL.Text := SQL_EXCLUI;
      qyEAula.ParamCheck := True;
      qyEAula.ParamByName('nro_aula').AsInteger := Self.FINumero;
      qyEAula.ParamByName('turma').AsString := Self.FSCodTurma;
      qyEAula.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyEAula.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyEAula.ParamByName('bimestre').AsInteger := Self.FIEtapa;
      // Tenta excluir a aula na base de dados
      try
         qyEAula.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrExcAula;
            Self.FUMDiarioAulas.setMsgErro(E.Message);
         end;
      end;
   finally
      FreeAndNil(qyEAula);
   end;
   // Se o processo de exclusão ocorreu normalmente,
   // então atualiza as freqüências para a aula
   if Result = derSucesso then
   begin
      Result := Self.atualizaFrequencias;
      Self.FBExcluida := True;
   end;
end;

{ Altera o número da aula para o número definido no parâmetro. }
{
function TUMAula.setNumero(const AINumero: integer): TUMDiarioExclusaoRet;
const
   SQL_ANUM_AULA =
      'UPDATE diario_aulas '+
      'SET nro_aula = :nro_novo '+
      'WHERE turma = :turma AND '+
            'anosemestre = :anosemestre AND '+
            'disciplina = :disciplina AND '+
            'bimestre = :bimestre AND '+
            'nro_aula = :nro_aula';
var
   qyANumAula: TUMZQuery;
begin
   Result := derSucesso;
   DM.CriarConsulta(qyANumAula);
   try
      qyANumAula.SQL.Text := SQL_ANUM_AULA;
      qyANumAula.ParamCheck := True;
      qyANumAula.ParamByName('nro_novo').AsInteger := AINumero;
      qyANumAula.ParamByName('turma').AsString := Self.FSCodTurma;
      qyANumAula.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyANumAula.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyANumAula.ParamByName('bimestre').AsInteger := Self.FIEtapa;
      qyANumAula.ParamByName('nro_aula').AsInteger := Self.FINumero;
      // Tenta alterar o número da aula
      try
         qyANumAula.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrAtuNums;
            Self.FUMDiarioAulas.setMsgErro(E.Message);
         end;
      end;
   finally
      FreeAndNil(qyANumAula);
   end;
   // Se a alteração do número da aula ocorreu sem erros...
   // ...então atualiza as freqüências dos alunos para a nova aula.
   if Result = derSucesso then
   begin
      Result := Self.atualizaFrequencias(AINumero);
      Self.FINumero := AINumero;
   end;
end;
}

{ TUMDiarioAulas }

{ Atualiza o número de faltas nas tabelas de diário de matrículas e ficha
  individual.
}
{function TUMDiarioAulas.atualizaFaltas: TUMDiarioExclusaoRet;
const
   SQL_AFALTAS_MYQL =
      'UPDATE '+
         'diario_matriculas dm LEFT JOIN fichaindividual fi '+
            'ON (dm.codaluno = fi.codigoaluno AND '+
               'dm.anosemestre = fi.anosemestre AND '+
               'dm.turma = fi.turma AND '+
               'dm.disciplina = fi.disciplina)'+
      ' SET '+
         'dm.faltas = (LENGTH(REPLACE(REPLACE(CONCAT($freqs), ''C'', ''''), ''-'', ''''))),'+
         'fi.falta$etapa = IF(sn_bloqueado$etapa = 1, fi.falta$etapa, dm.faltas) '+
      'WHERE '+
         'dm.anosemestre = :anosemestre AND '+
         'dm.turma = :turma AND '+
         'dm.disciplina = :disciplina AND '+
         'dm.bimestre = :bimestre';

   SQL_AFALTAS_ORACLE1 =
      'MERGE INTO DIARIO_MATRICULAS DM USING '+
         '(SELECT '+
            'DM.CODALUNO AS CODALUNO, '+
            'DM.TURMA AS TURMA, '+
            'DM.ANOSEMESTRE AS ANOSEMESTRE, '+
            'DM.DISCIPLINA AS DISCIPLINA, '+
            'DM.BIMESTRE AS BIMESTRE '+
      'FROM '+
         'DIARIO_MATRICULAS DM '+
         'LEFT JOIN FICHAINDIVIDUAL FI ON ( '+
         'DM.CODALUNO = FI.CODIGOALUNO AND '+
         'DM.ANOSEMESTRE = FI.ANOSEMESTRE AND '+
         'DM.TURMA = FI.TURMA AND '+
         'DM.DISCIPLINA = FI.DISCIPLINA) '+
      'WHERE '+
         'DM.ANOSEMESTRE = :anosemestre AND '+
         'DM.TURMA = :turma AND '+
         'DM.DISCIPLINA = :disciplina AND '+
         'DM.BIMESTRE = :bimestre) DM2 ON (DM.CODALUNO = DM2.CODALUNO AND '+
                                          'DM.TURMA = DM2.TURMA AND '+
                                          'DM.ANOSEMESTRE = DM2.ANOSEMESTRE AND '+
                                          'DM.DISCIPLINA = DM2.DISCIPLINA AND '+
                                          'DM.BIMESTRE = DM2.BIMESTRE) '+
      'WHEN MATCHED THEN '+
         'UPDATE SET DM.FALTAS = (LENGTH(REPLACE(REPLACE($freqs, ''C'', ''''), ''-'', '''')))';

   SQL_AFALTAS_ORACLE2 =
      'MERGE INTO FICHAINDIVIDUAL FI USING '+
         '(SELECT '+
            'FI.ANOSEMESTRE AS ANOSEMESTRE, '+
            'FI.TURMA AS TURMA, '+
            'FI.CODIGOALUNO AS CODIGOALUNO, '+
            'FI.CURSO AS CURSO, '+
            'FI.DISCIPLINA AS DISCIPLINA, '+
            'FI.SERIE AS SERIE, '+
            'FI.SITUACAO AS SITUACAO, '+
            'FI.SN_BLOQUEADO1 AS SN_BLOQUEADO1, '+
            'FI.FALTA1 AS FALTA1, '+
            'DM.FALTAS AS FALTAS '+
      'FROM '+
         'DIARIO_MATRICULAS DM '+
         'LEFT JOIN FICHAINDIVIDUAL FI ON ( '+
         'DM.CODALUNO = FI.CODIGOALUNO AND '+
         'DM.ANOSEMESTRE = FI.ANOSEMESTRE AND '+
         'DM.TURMA = FI.TURMA AND '+
         'DM.DISCIPLINA = FI.DISCIPLINA) '+
      'WHERE '+
         'DM.ANOSEMESTRE = :anosemestre AND '+
         'DM.TURMA = :turma AND '+
         'DM.DISCIPLINA = :disciplina AND '+
         'DM.BIMESTRE = :bimestre) FI2 ON (FI.ANOSEMESTRE = FI2.ANOSEMESTRE AND '+
													   'FI.TURMA = FI2.TURMA AND '+
													   'FI.CODIGOALUNO = FI2.CODIGOALUNO AND '+
													   'FI.CURSO = FI2.CURSO AND '+
													   'FI.DISCIPLINA = FI2.DISCIPLINA AND '+
													   'FI.SERIE = FI2.SERIE AND '+
													   'FI.SITUACAO = FI2.SITUACAO) '+
      'WHEN MATCHED THEN '+
         'UPDATE SET FI.FALTA$etapa = DECODE(FI2.SN_BLOQUEADO$etapa, 1, FI2.FALTA$etapa, FI2.FALTAS)';

var
   qyAFaltas: TUMZQuery;
   qyAFaltasOracle: TUMZQuery;
   sFreqs: string;
   i: integer;
begin
   // Monta comando SQL para efetuar a atualização
   DM.CriarConsulta(qyAFaltas);
   DM.CriarConsulta(qyAFaltasOracle);

   Result := derSucesso;
   sFreqs := '';
   //Verifica se a conexão é Oracle ou MySQL
   if qyAFaltas.Connection.Protocol = 'oracle' then //Oracle
   begin
      sFreqs := '''''';
      // Monta string para atualização das faltas nas aulas
      for i := 1 to Self.getUltimaAula do
      begin
         if sFreqs <> '' then
         begin
            AppendStr(sFreqs, '||');
         end;
         AppendStr(sFreqs, 'NVL(dm.freq' + IntToStr(i) + ', '''')');
      end;
   end else begin //MySQL
      // Monta string para atualização das faltas nas aulas
      for i := 1 to Self.getUltimaAula do
      begin
         if sFreqs <> '' then
         begin
            AppendStr(sFreqs, ',');
         end;
         AppendStr(sFreqs, 'IFNULL(dm.freq' + IntToStr(i) + ', "")');
      end;
   end;

   try
      qyAFaltas.ParamCheck := True;
      //Verifica se a conexão é Oracle ou MySQL
      if qyAFaltas.Connection.Protocol = 'oracle' then //Oracle
      begin
         qyAFaltas.SQL.Text := StringReplace(SQL_AFALTAS_ORACLE1, '$freqs', sFreqs, []);
         qyAFaltasOracle.SQL.Text := StringReplace(SQL_AFALTAS_ORACLE2, '$etapa', IntToStr(Self.FIEtapa), [rfReplaceAll]);

         qyAFaltasOracle.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
         qyAFaltasOracle.ParamByName('turma').AsString := Self.FSCodTurma;
         qyAFaltasOracle.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
         qyAFaltasOracle.ParamByName('bimestre').AsInteger := Self.FIEtapa;

      end else begin
         qyAFaltas.SQL.Text := StringReplace(SQL_AFALTAS_MYQL, '$freqs', sFreqs, []);
         qyAFaltas.SQL.Text := StringReplace(qyAFaltas.SQL.Text, '$etapa', IntToStr(Self.FIEtapa), [rfReplaceAll]);
      end;

      qyAFaltas.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyAFaltas.ParamByName('turma').AsString := Self.FSCodTurma;
      qyAFaltas.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyAFaltas.ParamByName('bimestre').AsInteger := Self.FIEtapa;

      try
         // Tenta atualizar
         qyAFaltas.ExecSQL;
         if qyAFaltas.Connection.Protocol = 'oracle' then
            qyAFaltasOracle.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrAtuFaltas;
            Self.setMsgErro(E.Message);
         end;
      end;
   finally
      FreeAndNil(qyAFaltas);
      FreeAndNil(qyAFaltasOracle);
   end;
   // Atualiza as freqüências na ficha individual
   if Result = derSucesso then
   begin
      Result := Self.atualizaFrequenciaFI;
   end;
end;
}

{ Atualiza as faltas e freqüências na ficha individual. }
function TUMDiarioAulas.atualizaFrequenciaFI: TUMDiarioExclusaoRet;
const
   SQL_AFREQS =
      'UPDATE '+
         'fichaindividual '+
      'SET '+
         'totalfaltas = '+
            'COALESCE(falta1, 0)+'+
            'COALESCE(falta2, 0)+'+
            'COALESCE(falta3, 0)+'+
            'COALESCE(falta4, 0)+'+
            'COALESCE(falta5, 0)+'+
            'COALESCE(falta6, 0)+'+
            'COALESCE(falta7, 0)+'+
            'COALESCE(falta8, 0)+'+
            'COALESCE(falta9, 0)+'+
            'COALESCE(falta10, 0),'+
         'frequencia = ROUND(100 - ((('+
            'COALESCE(falta1, 0)+'+
            'COALESCE(falta2, 0)+'+
            'COALESCE(falta3, 0)+'+
            'COALESCE(falta4, 0)+'+
            'COALESCE(falta5, 0)+'+
            'COALESCE(falta6, 0)+'+
            'COALESCE(falta7, 0)+'+
            'COALESCE(falta8, 0)+'+
            'COALESCE(falta9, 0)+'+
            'COALESCE(falta10, 0)'+
         ')/:qtd_aulas) * 100), 0) '+
      'WHERE '+
         'anosemestre = :anosemestre AND '+
         'turma = :turma AND '+
         'disciplina = :disciplina AND '+
         '(situacao NOT IN(3,4,5,6,7,8,12) AND aproveitamento <> ''S'')';
var
   qyAFreqFI: TUMZQuery;
begin
   Result := derSucesso;
   DM.CriarConsulta(qyAFreqFI);
   try
      qyAFreqFI.ParamCheck := True;
      qyAFreqFI.SQL.Text := SQL_AFREQS;
      qyAFreqFI.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyAFreqFI.ParamByName('turma').AsString := Self.FSCodTurma;
      qyAFreqFI.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyAFreqFI.ParamByName('qtd_aulas').AsInteger := Self.getTotalAulas;
      try
         qyAFreqFI.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrAtuFI;
            Self.setMsgErro(E.Message);
         end;
      end;
   finally
      FreeAndNil(qyAFreqFI);
   end;
end;

{ Atualiza o número de várias aulas. }
{function TUMDiarioAulas.atualizaNumeroAulas(
  const AAulas: array of integer): TUMDiarioExclusaoRet;
var
   i, j, iDiff: integer;
begin
   Result := derSucesso;
   // Percorre todas as aulas do diário
   for i := 0 to Self.FOlAulas.Count - 1 do
   begin
      iDiff := 0;
      // Percorre as aulas excluídas definidas no array
      for j := Low(AAulas) to High(AAulas) do
      begin
         // Se o número da aula no diário é maior que o número da aula excluída...
         if (TUMAula(Self.FOlAulas.Items[i]).Numero > AAulas[j]) and (not TUMAula(Self.FOlAulas.Items[i]).Excluida) then
         begin
            // ...então incrementa a diferença entre as aulas.
            Inc(iDiff);
         end;
      end;
      // Se há diferença ...
      if iDiff > 0 then
      begin
         // ...atualiza o número da aula no diário
         Result := TUMAula(Self.FOlAulas.Items[i]).setNumero(TUMAula(Self.FOlAulas.Items[i]).Numero - iDiff);
         // No primeiro erro finaliza o processo
         if Result <> derSucesso then
         begin
            Exit;
         end;
      end;
   end;
end;
}

{ Atualiza o número das aulas posteriores à aula excluída. }
{function TUMDiarioAulas.atualizaNumeroAulas(
  const AINumExcluido: integer): TUMDiarioExclusaoRet;
var
   i: integer;
begin
   Result := derSucesso;
   // Percorre todas as aulas do diário...
   for i := 0 to Self.FOlAulas.Count - 1 do
   begin
      // Se o número da aula é maior que o número da aula excluída e menor que a aula máxima permitida...
      if (TUMAula(Self.FOlAulas.Items[i]).Numero > AINumExcluido) and (TUMAula(Self.FOlAulas.Items[i]).Numero < Self.AulaMaxima) then
      begin
         // ...então efetua a atualização do número da aula
         Result := TUMAula(Self.FOlAulas.Items[i]).setNumero(TUMAula(Self.FOlAulas.Items[i]).Numero - 1);
      end;
   end;
end;
}

{ Atualiza o total de aulas na tabela de turmasprofessores. }
function TUMDiarioAulas.atualizaTotalAulas(
  const AIQuantidade: integer): TUMDiarioExclusaoRet;
const
   SQL_QTD_AULA =
      ' SELECT SUM(qtd_aulas) SOMA '+
      '   FROM diario_aulas ' +
      '  WHERE anosemestre = :anosemestre '+
      '    AND turma = :turma'+
      '    AND disciplina = :disciplina ';

   SQL_ATU_TOT =
      'UPDATE turmasprofessores '+
      'SET numeroaulas = :qtd '+
      'WHERE turma = :turma AND '+
            'anosemestre = :anosemestre AND '+
            'disciplina = :disciplina';
var
   qyATotAulas: TUMZQuery;
   iAulas : Integer;
begin
   Result := derSucesso;
   DM.CriarConsulta(qyATotAulas);

   // Descobrir qual é a Qtd. Aulas
   qyATotAulas.SQL.Text :=  SQL_QTD_AULA;
   qyATotAulas.ParamByName('turma').AsString := Self.FSCodTurma;
   qyATotAulas.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   qyATotAulas.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
   qyATotAulas.Open();

   iAulas := qyATotAulas.FieldByName('SOMA').AsInteger;

   qyATotAulas.Close();
   qyATotAulas.SQL.Clear();   

   try
      qyATotAulas.SQL.Text := SQL_ATU_TOT;
      qyATotAulas.ParamCheck := True;
      qyATotAulas.ParamByName('qtd').AsInteger := iAulas;
      qyATotAulas.ParamByName('turma').AsString := Self.FSCodTurma;
      qyATotAulas.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyATotAulas.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      // Tenta atualizar o total de aulas lecionadas pelo professor
      try
         qyATotAulas.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrAtuTotAulas;
            Self.setMsgErro(E.Message);
         end;
      end;
   finally
      FreeAndNil(qyATotAulas);
   end;
end;

{ Carrega todas as aulas do diário do professor. }
procedure TUMDiarioAulas.carregaDiario;
const
   SQL_DIARIO =
      'SELECT turma, anosemestre, disciplina, bimestre, nro_aula '+
      'FROM diario_aulas '+
      'WHERE turma = :turma AND '+
            'anosemestre = :anosemestre AND '+
            'disciplina = :disciplina AND '+
            'bimestre = :bimestre AND '+
            'nro_aula <= :maior';
var
   qyAulas: TUMZQuery;
begin
   DM.CriarConsulta(qyAulas);
   try
      qyAulas.SQL.Text := SQL_DIARIO;
      qyAulas.ParamCheck := True;
      qyAulas.ParamByName('turma').AsString := Self.FSCodTurma;
      qyAulas.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyAulas.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyAulas.ParamByName('bimestre').AsInteger := Self.FIEtapa;
      qyAulas.ParamByName('maior').AsInteger := Self.FIAulaMaxima;
      try
         qyAulas.Open;
         // Percorre todas as aulas encontradas e adiciona na lista de aulas
         while not qyAulas.Eof do
         begin
            Self.FOlAulas.Add(
               TUMAula.Create(
                  qyAulas.FieldByName('turma').AsString,
                  qyAulas.FieldByName('nro_aula').AsInteger,
                  qyAulas.FieldByName('bimestre').AsInteger,
                  qyAulas.FieldByName('anosemestre').AsInteger,
                  qyAulas.FieldByName('disciplina').AsInteger, Self));
            qyAulas.Next;
         end;
      except
         on E: Exception do
         begin
            //
         end;
      end;
   finally
      qyAulas.Close;
      FreeAndNil(qyAulas);
   end;
end;

{ Construtor. }
constructor TUMDiarioAulas.Create(const ASCodTurma: string; const AIEtapa,
  AIAnoSemestre, AICodProfessor, AICodDisciplina: integer);
begin
   inherited Create;
   Self.FSMsgErro := '';
   Self.FOlAulas := TObjectList.Create;
   Self.FSCodTurma := ASCodTurma;
   Self.FIEtapa := AIEtapa;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FICodProfessor := AICodProfessor;
   Self.FICodDisciplina := AICodDisciplina;
   Self.setAulaMaxima;
   Self.carregaDiario;
end;

{ Destrutor. }
destructor TUMDiarioAulas.Destroy;
var
   i: integer;
begin
   for i := 0 to Self.FOlAulas.Count - 1 do
   begin
      TUMAula(Self.FOlAulas.Items[i]).Free;
   end;
   Self.FOlAulas := nil;
   inherited;
end;

{ Este método recebe um array com os números das aulas que devem ser excluídas
  do diário e efetua sua exclusão se possível.
}
{function TUMDiarioAulas.excluiAula(
  const AAulas: array of integer): TUMDiarioExclusaoRet;
const
   SQL_EAULAS =
      'DELETE FROM diario_aulas '+
      'WHERE '+
         'nro_aula IN(:nros_aulas) AND '+
         'turma = :turma AND '+
         'anosemestre = :anosemestre AND '+
         'disciplina = :disciplina AND '+
         'bimestre = :bimestre';
var
   sAulas: string;
   i, j: integer;
   qyEAulas: TUMZQuery;
begin
   Result := derSucesso;
   // Monta a string com as aulas que serão excluídas
   sAulas := '';
   for i := Low(AAulas) to High(AAulas) do
   begin
      if sAulas <> '' then AppendStr(sAulas, ',');
      AppendStr(sAulas, IntToStr(AAulas[i]));
   end;
   // Monta o comando SQL para efetuar a exlcusão das aulas
   DM.CriarConsulta(qyEAulas);
   try
      qyEAulas.SQL.Text := StringReplace(SQL_EAULAS, ':nros_aulas', sAulas, []);
      qyEAulas.ParamCheck := True;
      qyEAulas.ParamByName('turma').AsString := Self.FSCodTurma;
      qyEAulas.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyEAulas.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyEAulas.ParamByName('bimestre').AsInteger := Self.FIEtapa;
      // Tenta efetuar a exclusão das aulas na base de dados...
      try
         qyEAulas.ExecSQL;
      except
         on E: Exception do
         begin
            Result := derErrExcAula;
         end;
      end;
   finally
      FreeAndNil(qyEAulas);
   end;
   // Percorre as aulas que foram excluídas...
   for i := Low(AAulas) to High(AAulas) do
   begin
      // Percorre a lista de aulas do diário...
      for j := 0 to Self.FOlAulas.Count - 1 do
      begin
         if TUMAula(Self.FOlAulas.Items[j]).Numero = AAulas[i] then
         begin
            // ...para definir a propriedade Excluida
            TUMAula(Self.FOlAulas.Items[j]).Excluida := True;
            Break;
         end;
      end;
   end;
   // Se o processo de exclusão ocorreu sem problemas...
   if Result = derSucesso then
   begin
      // ...então vamos atualizar o número das outras aulas...
      Result := Self.atualizaNumeroAulas(AAulas);
      // Se atualizou os números das aulas com sucesso...
      if Result = derSucesso then
      begin
         // ...atualiza o total de aulas lecionadas pelo professor...
         Result := Self.atualizaTotalAulas(Length(AAulas));
         // Se atualizou o total de aulas com sucesso...
         if Result = derSucesso then
         begin
            // ...limpa as freqüências no diário.
            Result := Self.limpaFrequencias;
            if Result = derSucesso then
            begin
               // ...atualiza as faltas e freqüências no diário de matrículas
               // e na ficha individual
               Result := Self.atualizaFaltas;
            end;
         end;
      end;
   end;
end;
}

{ Este método recebe o número da aula que deve ser excluída do diário. }
function TUMDiarioAulas.excluiAula(
  const AINumero: integer): TUMDiarioExclusaoRet;
var
   i: integer;
   logDesc : String;
begin
   Result := derSucesso;
   // Percorre a lista de aulas do diário...
   for i := 0 to Self.FOlAulas.Count - 1 do
   begin
      // É esta a aula que deve ser excluída ? (compara o número da aula)
      if (TUMAula(Self.FOlAulas.Items[i]).Numero = AINumero) and (not TUMAula(Self.FOlAulas.Items[i]).Excluida) then
      begin
         // Efetua a exclusão
         Result := TUMAula(Self.FOlAulas.Items[i]).exclui;
                                                    
         // Quebra o FOR
         Break;
      end;
   end;
   // Se o processo de exclusão ocorreu normalmente...
   if Result = derSucesso then
   begin
      // ...atualiza o número das aulas posteriores...
//      Result := Self.atualizaNumeroAulas(AINumero);
//      if Result = derSucesso then
//      begin
         // ...atualiza o total de aulas lecionadas pelo professor...
         Result := Self.atualizaTotalAulas(1);
//         if Result = derSucesso then
//         begin
            // ...limpa as freqüências no diário.
//            Result := Self.limpaFrequencias;
//            if Result = derSucesso then
//            begin
               // ...atualiza as faltas e freqüências no diário de matrículas
               // e na ficha individual
//               Result := Self.atualizaFaltas;
//            end;
//         end;
//      end;
   end;
end;

{ Retorna o tipo de freqüência cadastrado no parâmetro de avaliação. }
function TUMDiarioAulas.getTipoFrequencia: string;
const
   SQL_STIPOFREQ =
      'SELECT '+
         'ds_frequencia_tipo '+
      'FROM '+
         'turmas t JOIN avaliacoes_parametros USING(cd_avaliacao) '+
      'WHERE '+
         't.anosemestre = :anosemestre AND '+
         't.codigo = :turma AND '+
         't.cd_coligada = :cd_coligada ';
var
   qyTipoFreq: TUMZQuery;
begin
   DM.CriarConsulta(qyTipoFreq);
   try
      qyTipoFreq.ParamCheck := True;
      qyTipoFreq.SQL.Text := SQL_STIPOFREQ;
      qyTipoFreq.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyTipoFreq.ParamByName('turma').AsString := Self.FSCodTurma;
      qyTipoFreq.ParamByName('cd_coligada').AsInteger := DM.getColigadaByTurma(Self.FSCodTurma, Self.FIAnoSemestre);
      qyTipoFreq.Open;
      Result := qyTipoFreq.FieldByName('ds_frequencia_tipo').AsString;
   finally
      qyTipoFreq.Close;
      FreeAndNil(qyTipoFreq);
   end;
end;

{ Retorna a quantidade total de aulas com base no tipo de freqüência. }
function TUMDiarioAulas.getTotalAulas: integer;
const
   SQL_SDIARIO =
      'SELECT '+
         'SUM(qtd_aulas) AS qtd_aulas '+
      'FROM '+
         'diario_aulas '+
      'WHERE '+
         'turma = :turma AND '+
         'anosemestre = :anosemestre AND '+
         'disciplina = :disciplina';
   SQL_SGRADE =
      'SELECT '+
         'gc.valor AS qtd_aulas '+
      'FROM '+
         'gradecurricular gc JOIN turmas t '+
            'ON(t.anosemestre = gc.anosemestre AND t.curso = gc.curso AND t.serie = gc.serie) '+
      'WHERE '+
         't.codigo = :turma AND '+
         't.anosemestre = :anosemestre AND '+
         'gc.disciplina = :disciplina';
var
   qyTotAulas: TUMZQuery;
begin
   DM.CriarConsulta(qyTotAulas);
   try
      if Self.getTipoFrequencia = 'A' then
      begin
         qyTotAulas.SQL.Text := SQL_SDIARIO;
      end else
      begin
         qyTotAulas.SQL.Text := SQL_SGRADE;
      end;     
      qyTotAulas.ParamCheck := True;
      qyTotAulas.ParamByName('turma').AsString := Self.FSCodTurma;
      qyTotAulas.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyTotAulas.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyTotAulas.Open;
      Result := qyTotAulas.FieldByName('qtd_aulas').AsInteger;
   finally
      qyTotAulas.Close;
      FreeAndNil(qyTotAulas);
   end;
end;

{ Pega a última aula digitada pelo professor no diário. }
function TUMDiarioAulas.getUltimaAula: integer;
const
   SQL_ULTIMA_AULA =
      'SELECT MAX(nro_aula) maior '+
      'FROM diario_aulas '+
      'WHERE turma = :turma AND '+
            'anosemestre = :anosemestre AND '+
            'disciplina = :disciplina AND '+
            'bimestre = :bimestre AND '+
            'nro_aula < '+
               '(SELECT DISTINCT COALESCE(nr_inicio_aulas_extras, 161) '+
               'FROM avaliacoes_parametros JOIN turmas t USING(cd_avaliacao) '+
               'WHERE t.codigo = :turma)';
var
   qyUltAula: TUMZQuery;
begin
   Result := 0;
   DM.CriarConsulta(qyUltAula);
   try
      qyUltAula.SQL.Text := SQL_ULTIMA_AULA;
      qyUltAula.ParamCheck := True;
      qyUltAula.ParamByName('turma').AsString := Self.FSCodTurma;
      qyUltAula.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      qyUltAula.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
      qyUltAula.ParamByName('bimestre').AsInteger := Self.FIEtapa;
      try
         qyUltAula.Open;
         if qyUltAula.FieldByName('maior').IsNull then
         begin
            // Se o resultado é nulo então retorna 0 pois não há aulas cadastradas
            Result := 0;
         end
         else
         begin
            Result := qyUltAula.FieldByName('maior').AsInteger;
         end;
      except
         on E: Exception do
         begin
            //
         end;
      end;
   finally
      qyUltAula.Close;
      FreeAndNil(qyUltAula);
   end;
end;

{ Excluí as freqüências das aulas que não existem mais. }
{function TUMDiarioAulas.limpaFrequencias: TUMDiarioExclusaoRet;
const
   SQL_EXCLUI_FREQ =
      'UPDATE diario_aulas_alunos '+
      'SET ds_freq = NULL '+
      'WHERE '+
         'cd_turma = :turma AND '+
         'nr_anosem = :anosemestre AND '+
         'cd_disciplina = :disciplina AND '+
         'cd_bimestre = :bimestre AND ' +
         'nr_aula >= :aula AND '+
         'nr_aula <= :aula2 ';
var
   qyAFreqs: TUMZQuery;
   i: integer;
begin
   Result := derSucesso;
   // Monta a parte SET do comando SQL para limpar as freqüências no diário
    // Monta comando SQL para efetuar a limpeza...
    DM.CriarConsulta(qyAFreqs);
    try
       qyAFreqs.SQL.Text := SQL_EXCLUI_FREQ;
       qyAFreqs.ParamCheck := True;
       qyAFreqs.ParamByName('turma').AsString := Self.FSCodTurma;
       qyAFreqs.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
       qyAFreqs.ParamByName('disciplina').AsInteger := Self.FICodDisciplina;
       qyAFreqs.ParamByName('bimestre').AsInteger := Self.FIEtapa;
       qyAFreqs.ParamByName('aula').AsInteger := Self.getUltimaAula + 1;
       qyAFreqs.ParamByName('aula2').AsInteger := Self.AulaMaxima ;
       // Tenta efetuar a limpeza das freqüências na base de dados...
       try
          qyAFreqs.ExecSQL;
       except
          on E: Exception do
          begin
             Result := derErrLimpaFreq;
             Self.setMsgErro(E.Message);
          end;
       end;
    finally
       FreeAndNil(qyAFreqs);
    end;
end;  }

{ Pega a máxima aula permitida no diário de aulas. }
procedure TUMDiarioAulas.setAulaMaxima;
const
   SQL_AULA_MAX =
      'SELECT '+
         'COALESCE(nr_inicio_aulas_extras - 1, 159) AS maior_aula '+
      'FROM '+
         'avaliacoes_parametros p JOIN turmas t USING(cd_avaliacao) '+
      'WHERE '+
         't.codigo = :turma';
var
   i: integer;
   qyAulaMax: TUMZQuery;
begin
   DM.CriarConsulta(qyAulaMax);
   try
      qyAulaMax.SQL.Text := SQL_AULA_MAX;
      qyAulaMax.ParamCheck := True;
      qyAulaMax.ParamByName('turma').AsString := Self.FSCodTurma;
      try
         qyAulaMax.Open;
         if qyAulaMax.IsEmpty then
         begin
            // Se não encontrou registros utiliza o máximo permitido para o
            // diário que hoje é de 160 aulas.
            Self.FIAulaMaxima := MAX_AULAS;
         end
         else
         begin
            Self.FIAulaMaxima := qyAulaMax.FieldByName('maior_aula').AsInteger;
         end;
      except
         on E: Exception do
         begin
            //
         end;
      end;
   finally
      qyAulaMax.Close;
      FreeAndNil(qyAulaMax);
   end;
end;

procedure TUMDiarioAulas.setMsgErro(const ASMsgErro: string);
begin
   Self.FSMsgErro := ASMsgErro;
end;

end.

