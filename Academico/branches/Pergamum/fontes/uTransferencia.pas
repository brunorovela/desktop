unit uTransferencia;

interface

uses
   Windows, Dialogs, SysUtils, Contnrs, DB, ZConnection, uDM, uClassMovimento, Classes, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Math;

type
   { **
      Enumeração que contém as formas como o sistema irá tratar as parcelas de
      mensalidade geradas para a nova matrícula com data de vencimento inferior
      à data de criação da nova matrícula.
   }
   TUMSituacaoParcelasAnteriores = (spaVencPlano, spaPerdoar, spaNaoGerar,
      spaVencAmanha, spaVencHoje);

   { **
      Esta enumerção contém as opções disponíveis para geração das parcelas no
      financeiro.
   }
   TUMFinanceiroTipoAjuste =
      (ftaManterValores, ftaGerarNovo, ftaAjustarCreditos);

   {**
      Tipo de erro decorrente do processo de transferência de curso.
   }
   EUMTransferenciaError = class(Exception);

   { **
      Classe que implementa métodos estáticos para registrar logs de operações
      na base de dados.
   }
   TUMTransferenciaLog = class(TObject)
   private
      class procedure RegistraLog(const AICodUsuario, AICodModulo,
         AICodColigada: integer; const ASOperacao, ASChave,
         ASObservacoes: string); overload;
      class procedure RegistraLog(const AICodModulo: integer;
         const ASOperacao: string); overload;
   end;

   { **
      Classe que encapsula as informações da forma de ingresso.
   }
   TUMFormaIngresso = class(TObject)
   strict private
      FICodigo: integer;
      FICodPadrao: integer;
      FSDescricao: string;
   public
      constructor Create(const AICodigo, AICodPadrao: integer;
         const ASDescricao: string); overload;
      constructor Create; overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMFormaIngresso: TUMFormaIngresso);
      property Codigo: integer read FICodigo write FICodigo;
      property CodPadrao: integer read FICodPadrao write FICodPadrao;
      property Descricao: string read FSDescricao write FSDescricao;
   end;

   { **
      Classe que encapsula as informações do turno.
   }
   TUMTurno = class(TObject)
   strict private
      FCCodigo: Char;
      FSDescricao: string;
   public
      constructor Create(const ACCodigo: Char; const ASDescricao: string); overload;
      constructor Create; overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMTurno: TUMTurno);
      property Codigo: Char read FCCodigo write FCCodigo;
      property Descricao: string read FSDescricao write FSDescricao;
   end;

   { **
      Classe que encapsula as informações de um item da grade curricular.
   }
   TUMItemGradeCurricular = class(TObject)
   strict private
      FICodDisc: integer;
      FICreditos: integer;
      FSCodGrade: string;
   private
      constructor Create; overload;
      constructor Create(const AICodDisc, AICreditos: integer; const ASCodGrade: string); overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMItemGradeCurricular: TUMItemGradeCurricular);
      property CodDisc: integer read FICodDisc;
      property Creditos: integer read FICreditos;
      property CodGrade: string read FSCodGrade;
   end;

   { **
      Classe que encapsula as informações da grade curricular. Contém uma lista
      com os itens que compõe a grade e uma lista com os turnos disponíveis para
      a grade.
   }
   TUMGradeCurricular = class(TObject)
   strict private
      FICodigo: integer;
      FIAnoSemestre: integer;
      FSCodCurso: string;
      FUMTurno: TUMTurno;
      FOlItems: TObjectList;
      FOlTurnos: TObjectList;
      FQyGetItems: TUMZQuery;
      FQyGetTurnos: TUMZQuery;
      function GetItemCount: integer;
      function GetTurnoCount: integer;
      function GetItem(const AIIndice: integer): TUMItemGradeCurricular;
      function GetTurno(const AIIndice: integer): TUMTurno;
      procedure AdicionaTurno(const AUMTurno: TUMTurno); overload;
      procedure AdicionaTurno(const ACodigo: Char; const ASDescricao: string); overload;
      procedure AdicionaItem(const AICodDisc, AICreditos: integer; const ASCodGrade: string); overload;
      procedure AdicionaItem(const AUMItemGradeCurricular: TUMItemGradeCurricular); overload;
      procedure ResetaGradeDisciplinas;
      procedure ResetaTurnos;
   public
      constructor Create; overload;
      constructor Create(const AICodigo, AIAnoSemestre: integer; const ASCodCurso: string;
         const AUMTurno: TUMTurno); overload;
      constructor Create(const AICodigo: integer; const ASCodCurso: string); overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMGradeCurricular: TUMGradeCurricular);
      procedure CarregaTurnos;
      procedure CarregaGrade(const ASCodTurma: string; const AIAnoSem: integer);
      property Codigo: integer read FICodigo write FICodigo;
      property AnoSemestre: integer read FIAnoSemestre write FIAnoSemestre;
      property CodCurso: string read FSCodCurso write FSCodCurso;
      property Turno: TUMTurno read FUMTurno;
      property TurnoCount: integer read GetTurnoCount;
      property ItemCount: integer read GetItemCount;
      property Turnos[const Indice: integer]: TUMTurno read GetTurno;
      property Items[const Indice: integer]: TUMItemGradeCurricular read GetItem;
   end;

   { **
      Classe que encapsula as informações do plano de pagamento.
   }
   TUMPlanoPagamento = class(TObject)
   strict private
      FICodigo: integer;
      FICodColigada: integer;
      FIAnoSemestre: integer;
      FIParcelas: integer;
      FITaxasMaterial: integer;
      FIDiasParcela0: integer;
      FIMaxDisciplinas: integer;
      FICodTipoPlano: integer;
      FSDescricao: string;
      FSCodTurma: string;
      FSCodCurso: string;
      FSParagrafo3: string;
      FDValorCobrado: double;
      FDValorContrato: double;
      FDTaxaMaterial: double;
      FDTaxaApostila: double;
      FDDesconto: double;
      FDMatricula: double;
      FDCreditosBase: double;
      FDtAPartir: TDateTime;
      FBDiasUteis: boolean;
      FBCreditos: boolean;
      function GetValorCredito: Double;
   public
      constructor Create(const AICodigo, AICodColigada, AIAnoSemestre, AIParcelas,
         AITaxasMaterial, AIDiasParcela0, AIMaxDisciplinas, AICodTipoPlano: integer;
         const ASDescricao, ASCodTurma, ASCodCurso, ASParagrafo3: string;
         const ADValorCobrado, ADValorContrato, ADTaxaMaterial, ADTaxaApostila,
            ADDesconto, ADMatricula, ADCreditosBase: double; const ADtAPartir: TDateTime;
         const ABDiasUteis, ABCreditos: boolean); overload;
      constructor Create; overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMPlanoPagamento: TUMPlanoPagamento);
      property Codigo: integer read FICodigo write FICodigo;
      property CodColigada: integer read FICodColigada write FICodColigada;
      property AnoSemestre: integer read FIAnoSemestre write FIAnoSemestre;
      property Parcelas: integer read FIParcelas write FIParcelas;
      property TaxasMaterial: integer read FITaxasMaterial write FITaxasMaterial;
      property DiasParcela0: integer read FIDiasParcela0 write FIDiasParcela0;
      property MaxDisciplinas: integer read FIMaxDisciplinas write FIMaxDisciplinas;
      property CodTipoPlano: integer read FICodTipoPlano write FICodTipoPlano;
      property Descricao: string read FSDescricao write FSDescricao;
      property CodTurma: string read FSCodTurma write FSCodTurma;
      property CodCurso: string read FSCodCurso write FSCodCurso;
      property Paragrafo3: string read FSParagrafo3 write FSParagrafo3;
      property ValorCobrado: double read FDValorCobrado write FDValorCobrado;
      property ValorContrato: double read FDValorContrato write FDValorContrato;
      property TaxaMaterial: double read FDTaxaMaterial write FDTaxaMaterial;
      property TaxaApostila: double read FDTaxaApostila write FDTaxaApostila;
      property Desconto: double read FDDesconto write FDDesconto;
      property Matricula: double read FDMatricula write FDMatricula;
      property CreditosBase: double read FDCreditosBase write FDCreditosBase;
      property APartir: TDateTime read FDtAPartir write FDtAPartir;
      property DiasUteis: boolean read FBDiasUteis write FBDiasUteis;
      property Creditos: boolean read FBCreditos write FBCreditos;
      property ValorCredito: double read GetValorCredito;
   end;

   { **
      Classe que encapsula as informações da matrícula no curso.
   }
   TUMMatriculaCurso = class(TObject)
   strict private
      FICodigo: integer;
      FICodAluno: integer;
      FIAnoSemIngresso: integer;
      FSCodCurso: string;
      FUMGradeCurricular: TUMGradeCurricular;
      FUMFormaIngresso: TUMFormaIngresso;
      FUMTurno: TUMTurno;
      FQyGetGradeCurricular: TUMZQuery;
      FQyGetFormaIngresso: TUMZQuery;
      FQyGetTurno: TUMZQuery;
   public
      constructor Create(const AICodigo, AICodAluno, AIAnoSemIngresso: integer;
         const ASCodCurso: string; const AUMGradeCurricular: TUMGradeCurricular;
         const AUMFormaIngresso: TUMFormaIngresso; const AUMTurno: TUMTurno); overload;
      constructor Create; overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMMatriculaCurso: TUMMatriculaCurso);
      procedure CarregaTurno;
      procedure CarregaFormaIngresso;
      procedure CarregaGradeCurricular;
      property Codigo: integer read FICodigo write FICodigo;
      property CodAluno: integer read FICodAluno write FICodAluno;
      property AnoSemIngresso: integer read FIAnoSemIngresso write FIAnoSemIngresso;
      property CodCurso: string read FSCodCurso write FSCodCurso;
      property GradeCurricular: TUMGradeCurricular read FUMGradeCurricular;
      property FormaIngresso: TUMFormaIngresso read FUMFormaIngresso;
      property Turno: TUMTurno read FUMTurno;
   end;

   { **
      Classe que encapsula as informações da matrícula na turma.
   }
   TUMMatriculaTurma = class(TObject)
   strict private
      FICodAluno: integer;
      FIAnoSemestre: integer;
      FICentroCusto: integer;
      FIDepartamento: integer;
      FICodColigada: integer;
      FSCodTurma: string;
      FSCodCurso: string;
      FUMGradeCurricular: TUMGradeCurricular;
      FUMPlanoPagamento: TUMPlanoPagamento;
      FUMMatriculaCurso: TUMMatriculaCurso;
      FQyGetPlanoPagamento: TUMZQuery;
      FQyGetCentroCusto_Depto: TUMZQuery;
      procedure CarregaCentroCusto_Depto;
      function GetCentroCusto: integer;
      function GetDepartamento: integer;
      function GetTotalCreditos: integer;
   private
      procedure CarregaGradeCurricular;
      property TotalCreditos: integer read GetTotalCreditos;
      property CentroCusto: integer read GetCentroCusto;
      property Departamento: integer read GetDepartamento;
   public
      constructor Create; overload;
      constructor Create(const AICodAluno, AIAnoSemestre: integer;
         const ASCodCurso, ASCodTurma: string; const AUMGradeCurricular: TUMGradeCurricular;
         const AUMPlanoPagamento: TUMPlanoPagamento; const AUMMatriculaCurso: TUMMatriculaCurso); overload;
      destructor Destroy; override;
      procedure CopyFrom(const AUMMatriculaTurma: TUMMatriculaTurma);
      procedure CarregaPlanoPagamento;
      property CodAluno: integer read FICodAluno write FICodAluno;
      property AnoSemestre: integer read FIAnoSemestre write FIAnoSemestre;
      property CodColigada: integer read FICodColigada write FICodColigada;
      property CodTurma: string read FSCodTurma write FSCodTurma;
      property CodCurso: string read FSCodCurso write FSCodCurso;
      property GradeCurricular: TUMGradeCurricular read FUMGradeCurricular write FUMGradeCurricular;
      property PlanoPagamento: TUMPlanoPagamento read FUMPlanoPagamento write FUMPlanoPagamento;
      property MatriculaCurso: TUMMatriculaCurso read FUMMatriculaCurso write FUMMatriculaCurso;
   end;

   { **
      Esta classe implementa um conjunto de métodos responsáveis pela geração das
      parcelas de mensalidade para a matrícula do aluno e também para recalculo
      dos créditos financeiros.
   }
   TUMGeradorFinanceiro = class(TObject)
   strict private
      FDtAtual: TDateTime;
      FBCancelarPendente: boolean;
      FBCancelarVencida: boolean;
      FBCancelarMesAtual: boolean;
      FSMensalidadeDataBaixa: string;
      FISituacaoPadrao: integer;
      FUMSituacaoParcelasAnteriores: TUMSituacaoParcelasAnteriores;
      FQyGetItensPlanoPgto: TUMZQuery;
      FQyGetMensCancelar: TUMZQuery;
      FQyAtualizaParcelas: TUMZQuery;
      FQyAtualizaDesconto: TUMZQuery;
      FQyCancelaMensalidades: TUMZQuery;
      FQyAtualizaTurmaParcelas: TUMZQuery;
      procedure SetSituacaoPadrao(const ASSituacaoPadrao: string);
      procedure SetSituacaoParcelasAnteriores(const ASSituacaoParcelasAnteriores: string);
      function GetSQLParcelasCancelar(const ASTitulosCancelar: string): string;
      procedure CancelaParcelasAntigas(const AUMMatriculaTurmaAtual: TUMMatriculaTurma);
      procedure RegistraMovimentoCancelamento(const AICodTitulo,
         AICodColigada, AICodMovimento: integer; const ADValorMovimento: Double);
      procedure RegistraMotivoCancelamento(const AICodAluno,
         AIParcela: integer; const ADtVencimento: TDateTime; const ASCodTurma: string);
      procedure RegistraDescontoExtra(const AICodMensalidade: Integer;
         const ADtPagamento: TDateTime; const ADValorMovimento: Double);
      procedure AtualizaParcelas(const AUMMatriculaTurmaAtual, AUMatriculaTurmaNovo: TUMMatriculaTurma);
      procedure ReajustaFinanceiro(const AUMMatriculaTurmaNovo: TUMMatriculaTurma); overload;
      procedure GeraFinanceiro(const AUMMatriculaTurmaNovo: TUMMatriculaTurma); overload;
      function GeraMensalidade(const AICodAluno, AIParcela, AIAnoSemestre,
         AISituacao, AIDepartamento, AITipoTitulo, AIPlanoConta, AICentroCusto,
         AICodItemPlano, AICodCheque, AICodResp: integer; const ASCodTurma,
         ASCodCurso, ASHistorico: string; const ADValorBruto, ADDescontoCond,
         ADCreditos, ADDescontoExtra, ADValorExtra, ADValorCredito: Double;
         const ADtVencimento, ADtApartirDe: TDateTime; const ACSnCredito: Char): integer;
   protected
      constructor Create;
      destructor Destroy; override;
      procedure AtualizaTurmaParcelas(const AUMMatriculaTurmaAtual, AUMatriculaTurmaNovo: TUMMatriculaTurma);
      procedure GeraFinanceiro(const AUMMatriculaTurmaNovo, AUMMatriculaTurmaAtual: TUMMatriculaTurma); overload;
      procedure ReajustaFinanceiro(const AUMMatriculaTurmaAtual, AUMMatriculaTurmaNovo: TUMMatriculaTurma); overload;
   end;

   { **
      Esta classe encapsula as informações das matrículas envolvidas no processo
      de transferência de curso, bem como uma objeto do tipo TUMGeradorFinanceiro
      para fins financeiros.
   }
   TUMTransferenciaCurso = class(TObject)
   strict private
      FUMGeradorFinanceiro: TUMGeradorFinanceiro;
      FUMMatriculaTurmaAtual: TUMMatriculaTurma;
      FUMMatriculaTurmaNovo: TUMMatriculaTurma;
      FQyDesativaMatriculaCurso: TUMZQuery;
      FQyDesativaMatriculaTurma: TUMZQuery;
      FQyDesativaFichaIndividual: TUMZQuery;
      FQyCriaMatriculaCurso: TUMZQuery;
      FQyCriaMatriculaTurma: TUMZQuery;
      FQyCriaFichaIndividual: TUMZQuery;
      procedure DesativaMatriculaCurso;
      procedure DesativaMatriculaTurma;
      procedure DesativaFichaIndividual;
      procedure DesativaMatricula;
      procedure AtivaMatriculaCurso;
      procedure AtivaMatriculaTurma;
      procedure AtivaMatricula;
      procedure CriaMatriculaCurso;
      procedure CriaMatriculaTurma;
      procedure CriaFichaIndividual;
      procedure CriaMatricula;
      procedure ReajustaFinanceiro;
      procedure GeraFinanceiro;
      procedure AtualizaTurmaParcelas;
      function verificaMatriculaCursoExistente: Boolean;
      function verificaMatriculaExistente: Boolean;
   public
      constructor Create(const AUMMatriculaTurmaAtual,
         AUMMatriculaTurmaNovo: TUMMatriculaTurma); overload;
      constructor Create; overload;
      destructor Destroy; override;
      procedure ProcessaTransferencia(const AUMFinanceiroTipoAjuste: TUMFinanceiroTipoAjuste);
      property MatriculaTurmaAtual: TUMMatriculaTurma read FUMMatriculaTurmaAtual;
      property MatriculaTurmaNovo: TUMMatriculaTurma read FUMMatriculaTurmaNovo;
   end;

var
  erroTransferencia: Boolean;

implementation

uses ClassPlanosPagamento, ClassRegistros, uMatriculas;

const
   {TUMGradeCurricular SQL e Mensagens}

   MSG_ERRO_GET_DISCIPLINAS_GRADE =
      'Ocorreu um erro ao tentar resgatar as informações da grade curricular: %s';

   MSG_ERRO_GET_TURNOS_GRADE =
      'Ocorreu um erro ao tentar resgatar os turnos disponíveis para a grade curricular: %s';

   SQL_GET_TURNOS =
      'SELECT DISTINCT '+
         't.codigo,'+
         't.descricao '+
      'FROM grades g '+
            'JOIN turmas tu ON (g.cd_grade = tu.cd_grade AND g.cd_curso = tu.curso) ' +
            'JOIN turnos t '+
               'ON (t.codigo = tu.turno) '+
      'WHERE '+
         'g.cd_grade = :cd_grade AND '+
         'g.cd_curso = :curso AND '+
         'tu.anosemestre = :anosemestre';

   SQL_GET_DISCIPLINAS_GRADE =
      'SELECT ' +
      '   CAST(CONCAT(t.ANOSEMESTRE, G.CD_GRADE, G.CD_CURSO, LPAD(G.NR_SERIE, 2, 0), t.TURNO, LPAD(G.CD_DISCIPLINA, 10, 0)) AS char) codigo, ' + 
      '   g.CD_DISCIPLINA disciplina, '+
      '   g.NR_AULAS numeroaulas '+
      ' FROM ' +
      '   grades_disciplinas as g ' +
      ' INNER JOIN turmas as t ON (t.curso = g.CD_CURSO AND t.cd_grade = g.CD_GRADE AND t.serie = g.NR_SERIE) '+
      ' WHERE '+
      '   t.anosemestre = :anosemestre AND '+
      ' t.codigo = :turma ';

   {TUMMatriculaCurso SQL e Mensagens}

   MSG_ERRO_GET_GRADE_CURRICULAR =
      'Ocorreu um erro ao tentar resgatar as informações da grade curricular da matrícula no curso: %s';

   MSG_ERRO_GET_FORMA_INGRESSO =
      'Ocorreu um erro ao tentar resgatar as informações da forma de ingresso da matrícula no curso: %s';

   MSG_ERRO_GE_TURNO =
      'Ocorreu um erro ao tentar resgatar as informações do turno da matrícula no curso: %s';

   SQL_GET_GRADE_CURRICULAR =
      'SELECT '+
         'g.cd_grade,'+
         'mc.nr_anosem_grade anosemestre,'+
         'g.cd_curso curso,'+
         'mc.cd_turno turno,'+
         't.descricao ds_turno '+
      'FROM '+
         'grades g '+
            'JOIN matriculas_curso mc ON '+
               '(g.cd_grade = mc.cd_grade) AND '+
               '(g.cd_curso = mc.cd_curso) '+
            'JOIN turnos t '+
               'ON (mc.cd_turno = t.codigo) '+
      'WHERE '+
         'mc.cd_matricula_curso = :cd_matricula_curso '+
      'GROUP BY '+
         'g.cd_grade';

   SQL_GET_GRADE_CURRICULAR_ORACLE =
      'SELECT '+
         'g.cd_grade,'+
         'FIRST_OCCURRENCE(mc.nr_anosem_grade) as anosemestre,'+
         'FIRST_OCCURRENCE(g.cd_curso) as curso,'+
         'FIRST_OCCURRENCE(g.cd_turno) as turno,'+
         'FIRST_OCCURRENCE(t.descricao) ds_turno '+
      'FROM '+
         'grades g '+
            'JOIN matriculas_curso mc ON '+
               '(g.cd_grade = mc.cd_grade) AND '+
               '(g.cd_curso = mc.cd_curso) '+
            'JOIN turnos t '+
               'ON (mc.cd_turno = t.codigo) '+
      'WHERE '+
         'mc.cd_matricula_curso = :cd_matricula_curso '+
      'GROUP BY '+
         'g.cd_grade';

   SQL_GET_FORMA_INGRESSO =
      'SELECT '+
         'i.cd_ingresso,'+
         'i.ds_ingresso,'+
         'i.cd_padrao '+
      'FROM '+
         'matriculas_ingresso i '+
         'INNER JOIN matriculas_curso mc ON (mc.cd_ingresso = i.cd_ingresso) '+
      'WHERE '+
         'mc.cd_matricula_curso = :cd_matricula_curso';

   SQL_GET_TURNO =
      'SELECT '+
         't.codigo,'+
         't.descricao '+
      'FROM '+
         'turnos t '+
            'JOIN matriculas_curso mc '+
               'ON (t.codigo = mc.cd_turno) '+
      'WHERE '+
         'mc.cd_matricula_curso = :cd_matricula_curso';

   {TUMMatriculaTurma SQL e Mensagens}

   MSG_ERRO_GET_CENTROCUSTO_DEPTO =
      'Ocorreu um erro ao tentar resgatar as informações de centro de custo de departamento: %s';

   MSG_ERRO_GET_PLANO_PAGAMENTO =
      'Ocorreu um erro ao tentar resgatar as informações do plano de pagamento da matrícula: %s';

   SQL_GET_CENTROCUSTO_DEPTO =
      'SELECT '+
         'c.depto,'+
         't.cd_centro '+
      'FROM '+
         'turmas t '+
            'JOIN cursos c ON '+
               '(t.anosemestre = c.anosemestre) AND '+
               '(t.curso = c.codigo) '+
      'WHERE '+
         't.anosemestre = :anosemestre AND '+
         't.codigo = :codigo';

   SQL_GET_PLANO_PAGAMENTO =
      'SELECT '+
         'p.codigo,'+
         'p.cd_coligada,'+
         'p.anosemestre,'+
         'p.descricao,'+
         'p.turma,'+
         'p.curso,'+
         'p.parcelas,'+
         'p.valorcobrado,'+
         'p.valorcontrato,'+
         'p.taxamaterial,'+
         'p.taxaapostila,'+
         'p.desconto,'+
         'p.matricula,'+
         'p.apartir,'+
         'p.numerotaxasmaterial,'+
         'p.paragrafo3,'+
         'p.nr_dias_parczero,'+
         'p.sn_dias_uteis,'+
         'p.sn_creditos,'+
         'p.nr_creditos_base,'+
         'p.nr_max_disciplinas,'+
         'p.cd_tipo_plano '+
      'FROM '+
         'planospagamento p '+
            'JOIN matriculas m '+
               'ON(p.codigo = m.planopagamento) '+
      'WHERE '+
         'm.codigoaluno = :codigoaluno AND '+
         'm.anosemestre = :anosemestre AND '+
         'm.curso = :curso AND '+
         'm.turma = :turma';

   {TUMGeradorFinanceiro SQL e Mensagens}

   MSG_ERRO_ATUALIZAR_TURMA_PARCELAS =
      'Ocorreu um erro ao tentar atualizar a turma das parcelas do aluno: %s';

   MSG_ERRO_ATUALIZAR_PARCELAS =
      'Ocorreu um erro ao tentar atualizar as parcelas do aluno para reajustar o financeiro: %s';

   MSG_ERRO_GET_MENSALIDADES_A_CANCELAR =
      'Ocorreu um erro ao tentar resgatar as parcelas que seriam canceladas: %s';

   MSG_ERRO_CANCELAR_PARCELAS =
      'Ocorreu um erro ao tentar cancelar as parcelas da antiga matrícula: %s';

   MSG_ERRO_GET_ITENS_PLANO_PAGAMENTO =
      'Ocorreu um erro ao tentar resgatar as informações dos itens do plano de pagamento: %s';

   MSG_ERRO_AJUSTAR_FINANCEIRO =
      'Ocorreu um erro ao tentar ajustar o financeiro do aluno: %s';

   MSG_ERRO_REGISTRAR_DESCONTO_MENS =
      'Ocorreu um erro ao tentar registrar o desconto na mensalidade %d: %s';

   SQL_ATUALIZA_TURMA_PARCELAS =
      'UPDATE '+
         'mensalidades '+
      'SET '+
         'turma = :turma_nova, cd_coligada = :coligada_nova, '+
         'curso = :curso_novo, depto = :depto_novo           '+
      'WHERE '+
         'codigoaluno = :codigoaluno AND '+
         'turma = :turma AND '+
         'curso = :curso AND '+
         'anosemestre = :anosemestre AND '+
         'situacao = 2 and '+
         'date(datavencimento) > date(NOW())';
         
   SQL_ATUALIZA_PARCELAS =
      'UPDATE '+
         'mensalidades '+
      'SET '+
         'turma = :turma_nova,'+
         'curso = :curso_novo,'+
         'cd_coligada = :coligada_nova,'+
         'vl_credito = :vl_credito '+
      'WHERE '+
         'codigoaluno = :codigoaluno AND '+
         'turma = :turma AND '+
         'curso = :curso AND '+
         'anosemestre = :anosemestre';

   SQL_ATUALIZA_DESCONTO_PARCELA =
      'UPDATE '+
         'mensalidades '+
      'SET '+
         'datapagamento = :datapagamento,'+
         'valordesconto = 0 '+
      'WHERE '+
         'cd_mensalidade = :cd_mensalidade';

   SQL_GET_MENSALIDADES_CANCELAR =
      'SELECT '+
         'cd_mensalidade,'+
         'cd_mensalidade_origem,'+
         'cd_coligada,'+
         'valorbruto,'+
         'valorextra,'+
         'descontoextra,'+
         'codigoaluno,'+
         'parcela,'+
         'turma,'+
         'datavencimento '+
      'FROM '+
         'mensalidades '+
      'WHERE '+
         'codigoaluno = :codigoaluno AND '+
         'turma = :turma AND '+
         'anosemestre = :anosemestre AND '+
         'situacao IN(2, 10) AND '+
         'tipoparcela <> 4 '+
         '%s';

   SQL_CANCELA_MENSALIDADES =
      'UPDATE '+
         'mensalidades '+
      'SET '+
         'situacao = 5,'+
         'datapagamento = :datapagamento '+
      'WHERE '+
         'cd_mensalidade = :cd_mensalidade';

   SQL_GET_ITENS_PLANOS_PAGAMENTO =
      'SELECT '+
         'i.mes,'+
         'i.parcela,'+
         'i.valorbruto,'+
         'i.valordesconto,'+
         'i.valorextra,'+
         'i.descontoextra,'+
         'i.nr_dia,'+
         'i.nr_ano,'+
         'i.nr_creditos_minimos,'+
         'i.sn_credito_parcela,'+
         'i.cd_tipo_parcela,'+
         'i.cd_item_plano,'+
         't.cd_conta,'+
         't.ds_tipo_titulo '+
      'FROM '+
         'itensplanospagamento i '+
            'LEFT JOIN fin_tipos_titulo t ON '+
               '(i.cd_tipo_parcela = t.cd_tipo_titulo) AND '+
               '(i.cd_coligada = t.cd_coligada) '+
      'WHERE '+
         'codigoplano = :codigoplano '+
      'ORDER BY '+
         'parcela';

   {TUMTransferenciaCurso SQL e mensagens}

   MSG_ERRO_DESATIVA_MATRICULA_CURSO =
      'Ocorreu um erro ao tentar desativar a matrícula no curso: %s';

   MSG_ERRO_DESATIVA_MATRICULA_TURMA =
      'Ocorreu um erro ao tentar desativar a matrícula: %s';

   MSG_ERRO_DESATIVA_FICHAINDIVIDUAL =
      'Ocorreu um erro ao tentar desativar a ficha individual: %s';

   MSG_ERRO_INSERIR_MATRICULA_CURSO =
      'Ocorreu um erro ao tentar registrar uma nova matrícula no curso: %s';

   MSG_ERRO_INSERIR_MATRICULA_TURMA =
      'Ocorreu um erro ao tentar registrar uma nova matrícula: %s';

   MSG_ERRO_INSERIR_FICHAINDIVIDUAL =
      'Ocorreu um erro ao tentar registrar uma nova ficha individual: %s';

   SQL_DESATIVA_MATRICULA_CURSO =
      'UPDATE '+
         'matriculas_curso '+
      'SET '+
         'dt_saida = NOW(),'+
         'cd_situacao = :cd_situacao '+
      'WHERE '+
         'cd_matricula_curso = :cd_matricula_curso';

   SQL_DESATIVA_MATRICULA_TURMA =
      'UPDATE '+
         'matriculas '+
      'SET '+
         'datasaida = NOW(),'+
         'situacao = :situacao '+
      'WHERE '+
         'codigoaluno = :codigoaluno AND '+
         'anosemestre = :anosemestre AND '+
         'curso = :curso AND '+
         'turma = :turma';

   SQL_DESATIVA_FICHAINDIVIDUAL_ORACLE =
      'MERGE INTO FICHAINDIVIDUAL FI USING '+
         '(SELECT FI.ANOSEMESTRE, FI.TURMA, FI.CODIGOALUNO, ' +
         '        FI.DISCIPLINA, FI.SERIE, FI.CURSO, :SITUACAO SITUACAO ' +
         ' FROM FICHAINDIVIDUAL FI, MATRICULAS M ' +
         ' WHERE FI.ANOSEMESTRE = M.ANOSEMESTRE AND FI.TURMAMATRICULA = M.TURMA AND  ' +
         '       FI.CODIGOALUNO = M.CODIGOALUNO AND M.CODIGOALUNO = :CODIGOALUNO AND ' +
         '       M.ANOSEMESTRE = :ANOSEMESTRE AND M.TURMA = :TURMA) FI2 ON ' +
         '(FI.ANOSEMESTRE = FI2.ANOSEMESTRE AND FI.TURMA = FI2.TURMA AND ' +
			' FI.CODIGOALUNO = FI2.CODIGOALUNO AND FI.DISCIPLINA = FI2.DISCIPLINA AND ' +
			' FI.SERIE = FI2.SERIE AND FI.CURSO = FI2.CURSO) ' +
      'WHEN MATCHED THEN ' +
         ' UPDATE SET FI.SITUACAO = FI2.SITUACAO ';

   
   SQL_DESATIVA_FICHAINDIVIDUAL =
      'UPDATE '+
         'fichaindividual fi '+
            'JOIN matriculas m ON '+
               '(fi.anosemestre = m.anosemestre) AND '+
               '(fi.turmamatricula = m.turma) AND '+
               '(fi.codigoaluno = m.codigoaluno) '+
      'SET '+
         'fi.situacao = :situacao '+
      'WHERE '+
         'm.codigoaluno = :codigoaluno AND '+
         'm.anosemestre = :anosemestre AND '+
         'm.turma = :turma';

   SQL_INSERE_MATRICULA_CURSO =
      'INSERT INTO matriculas_curso '+
         '(cd_pessoa, nr_matricula, cd_curso, cd_grade, nr_anosem_grade, nr_anosem_ingresso, cd_turno, dt_ingresso, cd_ingresso, cd_situacao)'+
      'VALUES '+
         '(:cd_pessoa, :nr_matricula, :curso, :cd_grade, :nr_anosem_grade, :nr_anosem_ingresso, :cd_turno, NOW(), :cd_ingresso, :cd_situacao)';

   SQL_INSERE_MATRICULA_TURMA =
      'INSERT INTO matriculas '+
         '(anosemestre, turma, codigoaluno, curso, dataemissao, usuario, planopagamento, situacao, dataentrada, cd_ingresso, cd_matricula_curso, cd_turma_anterior)'+
      'VALUES '+
         '(:anosemestre, :turma, :codigoaluno, :curso, NOW(), :usuario, :planopagamento, :situacao, NOW(), :cd_ingresso, :cd_matricula_curso, :cd_turma_anterior)';

   SQL_INSERE_FICHAINDIVIDUAL =
      'INSERT INTO fichaindividual '+
         '(anosemestre, turma, codigograde, codigoaluno, curso, disciplina, serie, situacao, turmamatricula) '+
      'VALUES '+
         '(:anosemestre, :turma, :codigograde, :codigoaluno, :curso, :disciplina,'+
            '(SELECT serie FROM turmas WHERE codigo = :turma AND anosemestre = :anosemestre),'+
         ':situacao, :turma)';

   {Logs}
   CODIGO_MODULO = 1108;

   LOG_FIN_ALTERA_TURMA = 'Alteração do Código da Turma';

   LOG_FIN_REAJUSTE = 'Reajuste Financeiro';

   LOG_FIN_GERACAO = 'Geração de Novas Parcelas';

   LOG_TRANSFERENCIA_CURSO =
      '[Transferência de Curso]' + #13 + #13 +
      #9 + 'Informações da Matrícula Anterior:' + #13 +
      #9 + #9 + 'CD_MATRICULA_CURSO: %d' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Informações da Matrícula Nova:' + #13 +
      #9 + #9 + 'CD_MATRICULA_CURSO: %d' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Método de Atualização Financeira: %s';

{ TUMTransferenciaLog }

class procedure TUMTransferenciaLog.RegistraLog(const AICodUsuario, AICodModulo,
  AICodColigada: integer; const ASOperacao, ASChave, ASObservacoes: string);
begin
   DM.setLog(AICodModulo, ASOperacao, ASChave, AICodColigada, ASObservacoes);
end;

class procedure TUMTransferenciaLog.RegistraLog(const AICodModulo: integer;
  const ASOperacao: string);
begin
   DM.setLog(AICodModulo, ASOperacao);
end;

{ TUMFormaIngresso }

constructor TUMFormaIngresso.Create(const AICodigo, AICodPadrao: integer;
  const ASDescricao: string);
begin
   Self.FICodigo := AICodigo;
   Self.FICodPadrao := AICodPadrao;
   Self.FSDescricao := ASDescricao;
end;

procedure TUMFormaIngresso.CopyFrom(const AUMFormaIngresso: TUMFormaIngresso);
begin
   Self.FICodigo := AUMFormaIngresso.FICodigo;
   Self.FICodPadrao := AUMFormaIngresso.FICodPadrao;
   Self.FSDescricao := AUMFormaIngresso.FSDescricao;
end;

constructor TUMFormaIngresso.Create;
begin
   //
end;

destructor TUMFormaIngresso.Destroy;
begin
   inherited;
end;

{ TUMTurno }

procedure TUMTurno.CopyFrom(const AUMTurno: TUMTurno);
begin
   Self.FCCodigo := AUMTurno.FCCodigo;
   Self.FSDescricao := AUMTurno.FSDescricao;
end;

constructor TUMTurno.Create(const ACCodigo: Char; const ASDescricao: string);
begin
   Self.FCCodigo := ACCodigo;
   Self.FSDescricao := ASDescricao;
end;

constructor TUMTurno.Create;
begin
   //
end;

destructor TUMTurno.Destroy;
begin
   inherited;
end;

{ TUMItemGradeCurricular }

procedure TUMItemGradeCurricular.CopyFrom(
  const AUMItemGradeCurricular: TUMItemGradeCurricular);
begin
   Self.FICodDisc := AUMItemGradeCurricular.FICodDisc;
   Self.FICreditos := AUMItemGradeCurricular.FICreditos;
   Self.FSCodGrade := AUMItemGradeCurricular.FSCodGrade;
end;

constructor TUMItemGradeCurricular.Create;
begin
   //
end;

constructor TUMItemGradeCurricular.Create(const AICodDisc, AICreditos: integer;
  const ASCodGrade: string);
begin
   Self.FICodDisc := AICodDisc;
   Self.FICreditos := AICreditos;
   Self.FSCodGrade := ASCodGrade;
end;

destructor TUMItemGradeCurricular.Destroy;
begin
   inherited;
end;

{ TUMGradeCurricular }

procedure TUMGradeCurricular.AdicionaItem(const AICodDisc, AICreditos: integer;
  const ASCodGrade: string);
begin
   Self.AdicionaItem(TUMItemGradeCurricular.Create(AICodDisc, AICreditos, ASCodGrade));
end;

procedure TUMGradeCurricular.AdicionaItem(
  const AUMItemGradeCurricular: TUMItemGradeCurricular);
begin
   Self.FOlItems.Add(AUMItemGradeCurricular);
end;

procedure TUMGradeCurricular.AdicionaTurno(const ACodigo: Char;
  const ASDescricao: string);
begin
   Self.AdicionaTurno(TUMTurno.Create(ACodigo, ASDescricao));
end;

procedure TUMGradeCurricular.AdicionaTurno(const AUMTurno: TUMTurno);
begin
   Self.FOlTurnos.Add(AUMTurno);
end;

procedure TUMGradeCurricular.CarregaGrade(const ASCodTurma: string;
  const AIAnoSem: integer);
begin
   Self.ResetaGradeDisciplinas;
   // Selecionar a grade pela TURMA somente
   Self.FQyGetItems.ParamByName('anosemestre').AsInteger := AIAnoSem;
   Self.FQyGetItems.ParamByName('turma').AsString := ASCodTurma;
//   Self.FQyGetItems.ParamByName('curso').AsString := Self.FSCodCurso;
//   Self.FQyGetItems.ParamByName('turno').AsString := Self.FUMTurno.Codigo;
//   Self.FQyGetItems.ParamByName('cd_grade').AsInteger := Self.FICodigo;
   try
      try
         Self.FQyGetItems.Open;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_DISCIPLINAS_GRADE, [E.Message]);
      end;
      while not Self.FQyGetItems.Eof do
      begin
         Self.AdicionaItem(
            Self.FQyGetItems.FieldByName('disciplina').AsInteger,
            Self.FQyGetItems.FieldByName('numeroaulas').AsInteger,
            Self.FQyGetItems.FieldByName('codigo').AsString);
         Self.FQyGetItems.Next;
      end;
   finally
      Self.FQyGetItems.Close;
   end;
end;

procedure TUMGradeCurricular.CarregaTurnos;
begin
   Self.ResetaTurnos;
   Self.FQyGetTurnos.ParamByName('cd_grade').AsInteger := Self.FICodigo;
   Self.FQyGetTurnos.ParamByName('curso').AsString := Self.FSCodCurso;
   Self.FQyGetTurnos.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   try
      try
         Self.FQyGetTurnos.Open;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_TURNOS_GRADE, [E.Message]);
      end;
      while not Self.FQyGetTurnos.Eof do
      begin
         Self.AdicionaTurno(
            Self.FQyGetTurnos.FieldByName('codigo').AsString[1],
            Self.FQyGetTurnos.FieldByName('descricao').AsString);
         Self.FQyGetTurnos.Next;
      end;
   finally
      Self.FQyGetTurnos.Close;
   end;
end;

procedure TUMGradeCurricular.CopyFrom(
  const AUMGradeCurricular: TUMGradeCurricular);
var
   LIndice: integer;
begin
   Self.ResetaTurnos;
   Self.ResetaGradeDisciplinas;
   Self.FICodigo := AUMGradeCurricular.FICodigo;
   Self.FIAnoSemestre := AUMGradeCurricular.FIAnoSemestre;
   Self.FSCodCurso := AUMGradeCurricular.FSCodCurso;
   Self.FUMTurno.CopyFrom(AUMGradeCurricular.FUMTurno);
   for LIndice := 0 to AUMGradeCurricular.GetItemCount - 1 do
      Self.AdicionaItem(
         AUMGradeCurricular.GetItem(LIndice).CodDisc,
         AUMGradeCurricular.GetItem(LIndice).Creditos,
         AUMGradeCurricular.GetItem(LIndice).CodGrade);
   for LIndice := 0 to AUMGradeCurricular.GetTurnoCount - 1 do
      Self.AdicionaTurno(
         AUMGradeCurricular.GetTurno(LIndice).Codigo,
         AUMGradeCurricular.GetTurno(LIndice).Descricao);
end;

constructor TUMGradeCurricular.Create(const AICodigo: integer;
  const ASCodCurso: string);
begin
   Self.Create;
   Self.FICodigo := AICodigo;
   Self.FSCodCurso := ASCodCurso;
end;

constructor TUMGradeCurricular.Create(const AICodigo, AIAnoSemestre: integer;
  const ASCodCurso: string; const AUMTurno: TUMTurno);
begin
   Self.Create;
   Self.FICodigo := AICodigo;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FSCodCurso := ASCodCurso;
   Self.FUMTurno.CopyFrom(AUMTurno);
   try
      Self.CarregaTurnos;
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

constructor TUMGradeCurricular.Create;
begin
   Self.FUMTurno := TUMTurno.Create;
   Self.FOlItems := TObjectList.Create;
   Self.FOlTurnos := TObjectList.Create;

   DM.CriarConsulta(Self.FQyGetItems);
   DM.CriarConsulta(Self.FQyGetTurnos);

   Self.FQyGetItems.SQL.Text := SQL_GET_DISCIPLINAS_GRADE;
   Self.FQyGetTurnos.SQL.Text := SQL_GET_TURNOS;

   Self.FQyGetItems.ParamCheck := true;
   Self.FQyGetTurnos.ParamCheck := true;
end;

destructor TUMGradeCurricular.Destroy;
begin
   Self.ResetaGradeDisciplinas;
   Self.ResetaTurnos;
   FreeAndNil(Self.FUMTurno);
   FreeAndNil(Self.FOlItems);
   FreeAndNil(Self.FOlTurnos);
   FreeAndNil(Self.FQyGetItems);
   FreeAndNil(Self.FQyGetTurnos);
   inherited;
end;

function TUMGradeCurricular.GetItem(
  const AIIndice: integer): TUMItemGradeCurricular;
begin
   Result := TUMItemGradeCurricular(Self.FOlItems.Items[AIIndice]);
end;

function TUMGradeCurricular.GetItemCount: integer;
begin
   Result := Self.FOlItems.Count;
end;

function TUMGradeCurricular.GetTurno(const AIIndice: integer): TUMTurno;
begin
   Result := TUMTurno(Self.FOlTurnos.Items[AIIndice]);
end;

function TUMGradeCurricular.GetTurnoCount: integer;
begin
   Result := Self.FOlTurnos.Count;
end;

procedure TUMGradeCurricular.ResetaGradeDisciplinas;
var
   LIndice: integer;
begin
   for LIndice := Self.GetItemCount - 1 downto 0 do
      Self.FOlItems.Extract(Self.GetItem(LIndice)).Free;
end;

procedure TUMGradeCurricular.ResetaTurnos;
var
   LIndice: integer;
begin
   for LIndice := Self.GetTurnoCount - 1 downto 0 do
      Self.FOlTurnos.Extract(Self.GetTurno(LIndice)).Free;
end;

{ TUMPlanoPagamento }

procedure TUMPlanoPagamento.CopyFrom(
  const AUMPlanoPagamento: TUMPlanoPagamento);
begin
   Self.FICodigo := AUMPlanoPagamento.FICodigo;
   Self.FICodColigada := AUMPlanoPagamento.FICodColigada;
   Self.FIAnoSemestre := AUMPlanoPagamento.FIAnoSemestre;
   Self.FIParcelas := AUMPlanoPagamento.FIParcelas;
   Self.FITaxasMaterial := AUMPlanoPagamento.FITaxasMaterial;
   Self.FIDiasParcela0 := AUMPlanoPagamento.FIDiasParcela0;
   Self.FIMaxDisciplinas := AUMPlanoPagamento.FIMaxDisciplinas;
   Self.FICodTipoPlano := AUMPlanoPagamento.FICodTipoPlano;
   Self.FSDescricao := AUMPlanoPagamento.FSDescricao;
   Self.FSCodTurma := AUMPlanoPagamento.FSCodTurma;
   Self.FSCodCurso := AUMPlanoPagamento.FSCodCurso;
   Self.FSParagrafo3 := AUMPlanoPagamento.FSParagrafo3;
   Self.FDValorCobrado := AUMPlanoPagamento.FDValorCobrado;
   Self.FDValorContrato := AUMPlanoPagamento.FDValorContrato;
   Self.FDTaxaMaterial := AUMPlanoPagamento.FDTaxaMaterial;
   Self.FDTaxaApostila := AUMPlanoPagamento.FDTaxaApostila;
   Self.FDDesconto := AUMPlanoPagamento.FDDesconto;
   Self.FDMatricula := AUMPlanoPagamento.FDMatricula;
   Self.FDCreditosBase := AUMPlanoPagamento.FDCreditosBase;
   Self.FDtAPartir := AUMPlanoPagamento.FDtAPartir;
   Self.FBDiasUteis := AUMPlanoPagamento.FBDiasUteis;
   Self.FBCreditos := AUMPlanoPagamento.FBCreditos;
end;

constructor TUMPlanoPagamento.Create(const AICodigo, AICodColigada, AIAnoSemestre,
  AIParcelas, AITaxasMaterial, AIDiasParcela0, AIMaxDisciplinas,
  AICodTipoPlano: integer; const ASDescricao, ASCodTurma, ASCodCurso,
  ASParagrafo3: string; const ADValorCobrado, ADValorContrato, ADTaxaMaterial,
  ADTaxaApostila, ADDesconto, ADMatricula, ADCreditosBase: double;
  const ADtAPartir: TDateTime; const ABDiasUteis, ABCreditos: boolean);
begin
   Self.FICodigo := AICodigo;
   Self.FICodColigada := AICodColigada;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FIParcelas := AIParcelas;
   Self.FITaxasMaterial := AITaxasMaterial;
   Self.FIDiasParcela0 := AIDiasParcela0;
   Self.FIMaxDisciplinas := AIMaxDisciplinas;
   Self.FICodTipoPlano := AICodTipoPlano;
   Self.FSDescricao := ASDescricao;
   Self.FSCodTurma := ASCodTurma;
   Self.FSCodCurso := ASCodCurso;
   Self.FSParagrafo3 := ASParagrafo3;
   Self.FDValorCobrado := ADValorCobrado;
   Self.FDValorContrato := ADValorContrato;
   Self.FDTaxaMaterial := ADTaxaMaterial;
   Self.FDTaxaApostila := ADTaxaApostila;
   Self.FDDesconto := ADDesconto;
   Self.FDMatricula := ADMatricula;
   Self.FDCreditosBase := ADCreditosBase;
   Self.FDtAPartir := ADtAPartir;
   Self.FBDiasUteis := ABDiasUteis;
   Self.FBCreditos := ABCreditos;
end;

constructor TUMPlanoPagamento.Create;
begin
   //
end;

destructor TUMPlanoPagamento.Destroy;
begin
   inherited;
end;

function TUMPlanoPagamento.GetValorCredito: Double;
begin

   if Self.CreditosBase = 0 then
   begin
      Result := Self.ValorCobrado;
   end
   else
   begin
      Result := Self.ValorCobrado / Self.CreditosBase;
   end;

end;

{ TUMMatriculaCurso }

procedure TUMMatriculaCurso.CarregaFormaIngresso;
begin
   Self.FQyGetFormaIngresso.ParamByName('cd_matricula_curso').AsInteger := Self.FICodigo;
   try
      try
         Self.FQyGetFormaIngresso.Open;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_FORMA_INGRESSO, [E.Message]);
      end;
      if not Self.FQyGetFormaIngresso.IsEmpty then
      begin
         Self.FUMFormaIngresso.Codigo := Self.FQyGetFormaIngresso.FieldByName('cd_ingresso').AsInteger;
         Self.FUMFormaIngresso.CodPadrao := Self.FQyGetFormaIngresso.FieldByName('cd_padrao').AsInteger;
         Self.FUMFormaIngresso.Descricao := Self.FQyGetFormaIngresso.FieldByName('ds_ingresso').AsString;
      end;
   finally
      Self.FQyGetFormaIngresso.Close;
   end;
end;

procedure TUMMatriculaCurso.CarregaGradeCurricular;
begin
   Self.FQyGetGradeCurricular.ParamByName('cd_matricula_curso').AsInteger := Self.FICodigo;
   try
      try
         Self.FQyGetGradeCurricular.Open;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_GRADE_CURRICULAR, [E.Message]);
      end;
      if not Self.FQyGetGradeCurricular.IsEmpty then
      begin
         Self.FUMGradeCurricular.Codigo := Self.FQyGetGradeCurricular.FieldByName('cd_grade').AsInteger;
         Self.FUMGradeCurricular.AnoSemestre := Self.FQyGetGradeCurricular.FieldByName('anosemestre').AsInteger;
         Self.FUMGradeCurricular.CodCurso := Self.FQyGetGradeCurricular.FieldByName('curso').AsString;
         Self.FUMGradeCurricular.Turno.Codigo := Self.FQyGetGradeCurricular.FieldByName('turno').AsString[1];
         Self.FUMGradeCurricular.Turno.Descricao := Self.FQyGetGradeCurricular.FieldByName('ds_turno').AsString;
      end;
   finally
      Self.FQyGetGradeCurricular.Close;
   end;
end;

procedure TUMMatriculaCurso.CarregaTurno;
begin
   Self.FQyGetTurno.ParamByName('cd_matricula_curso').AsInteger := Self.FICodigo;
   try
      try
         Self.FQyGetTurno.Open;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GE_TURNO, [E.Message]);
      end;
      if not Self.FQyGetTurno.IsEmpty then
      begin
         Self.FUMTurno.Codigo := Self.FQyGetTurno.FieldByName('codigo').AsString[1];
         Self.FUMTurno.Descricao := Self.FQyGetTurno.FieldByName('descricao').AsString;
      end;
   finally
      Self.FQyGetTurno.Close;
   end;
end;

procedure TUMMatriculaCurso.CopyFrom(
  const AUMMatriculaCurso: TUMMatriculaCurso);
begin
   FreeAndNil(Self.FUMGradeCurricular);
   FreeAndNil(Self.FUMFormaIngresso);
   FreeAndNil(Self.FUMTurno);
   Self.FUMGradeCurricular := TUMGradeCurricular.Create;
   Self.FUMFormaIngresso := TUMFormaIngresso.Create;
   Self.FUMTurno := TUMTurno.Create;
   Self.FICodigo := AUMMatriculaCurso.FICodigo;
   Self.FICodAluno := AUMMatriculaCurso.FICodAluno;
   Self.FIAnoSemIngresso := AUMMatriculaCurso.FIAnoSemIngresso;
   Self.FSCodCurso := AUMMatriculaCurso.FSCodCurso;
   Self.FUMGradeCurricular.CopyFrom(AUMMatriculaCurso.FUMGradeCurricular);
   Self.FUMFormaIngresso.CopyFrom(AUMMatriculaCurso.FUMFormaIngresso);
   Self.FUMTurno.CopyFrom(AUMMatriculaCurso.FUMTurno);
end;

constructor TUMMatriculaCurso.Create(const AICodigo, AICodAluno,
  AIAnoSemIngresso: integer; const ASCodCurso: string;
  const AUMGradeCurricular: TUMGradeCurricular;
  const AUMFormaIngresso: TUMFormaIngresso; const AUMTurno: TUMTurno);
begin
   Self.Create;
   Self.FICodigo := AICodigo;
   Self.FICodAluno := AICodAluno;
   Self.FIAnoSemIngresso := AIAnoSemIngresso;
   Self.FSCodCurso := ASCodCurso;
   Self.FUMGradeCurricular.CopyFrom(AUMGradeCurricular);
   Self.FUMFormaIngresso.CopyFrom(AUMFormaIngresso);
   Self.FUMTurno.CopyFrom(AUMTurno);
end;

constructor TUMMatriculaCurso.Create;
begin
   Self.FUMGradeCurricular := TUMGradeCurricular.Create;
   Self.FUMFormaIngresso := TUMFormaIngresso.Create;
   Self.FUMTurno := TUMTurno.Create;

   DM.CriarConsulta(Self.FQyGetGradeCurricular);
   DM.CriarConsulta(Self.FQyGetFormaIngresso);
   DM.CriarConsulta(Self.FQyGetTurno);

   //Verifica se a conexão é Oracle ou MySQL
   if Self.FQyGetGradeCurricular.Connection.Protocol = 'oracle' then //Oracle
   begin
      Self.FQyGetGradeCurricular.SQL.Text := SQL_GET_GRADE_CURRICULAR_ORACLE;
   end else begin
      Self.FQyGetGradeCurricular.SQL.Text := SQL_GET_GRADE_CURRICULAR;
   end;
   Self.FQyGetFormaIngresso.SQL.Text := SQL_GET_FORMA_INGRESSO;
   Self.FQyGetTurno.SQL.Text := SQL_GET_TURNO;

   Self.FQyGetGradeCurricular.ParamCheck := true;
   Self.FQyGetFormaIngresso.ParamCheck := true;
   Self.FQyGetTurno.ParamCheck := true;
end;

destructor TUMMatriculaCurso.Destroy;
begin
   FreeAndNil(Self.FUMGradeCurricular);
   FreeAndNil(Self.FUMFormaIngresso);
   FreeAndNil(Self.FUMTurno);
   FreeAndNil(Self.FQyGetGradeCurricular);
   FreeAndNil(Self.FQyGetFormaIngresso);
   FreeAndNil(Self.FQyGetTurno);
   inherited;
end;

{ TUMMatriculaTurma }

procedure TUMMatriculaTurma.CarregaCentroCusto_Depto;
begin
   if (Self.FICentroCusto = 0) and (Self.FIDepartamento = 0) then
   begin
      Self.FQyGetCentroCusto_Depto.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
      Self.FQyGetCentroCusto_Depto.ParamByName('codigo').AsString := Self.FSCodTurma;
      try
         try
            Self.FQyGetCentroCusto_Depto.Open;
         except
            on E: EDatabaseError do
               raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_CENTROCUSTO_DEPTO, [E.Message]);
         end;
         if not Self.FQyGetCentroCusto_Depto.IsEmpty then
         begin
            Self.FICentroCusto := Self.FQyGetCentroCusto_Depto.FieldByName('cd_centro').AsInteger;
            Self.FIDepartamento := Self.FQyGetCentroCusto_Depto.FieldByName('depto').AsInteger;
         end;
      finally
         Self.FQyGetCentroCusto_Depto.Close;
      end;
   end;
end;

procedure TUMMatriculaTurma.CarregaGradeCurricular;
begin
   Self.FUMGradeCurricular.Codigo := Self.FUMMatriculaCurso.GradeCurricular.Codigo;
   Self.FUMGradeCurricular.AnoSemestre := Self.FIAnoSemestre;
   Self.FUMGradeCurricular.CodCurso := Self.FSCodCurso;
   Self.FUMGradeCurricular.Turno.CopyFrom(Self.FUMMatriculaCurso.Turno);
   Self.FUMGradeCurricular.CarregaGrade(Self.FSCodTurma, Self.FIAnoSemestre);
end;

procedure TUMMatriculaTurma.CarregaPlanoPagamento;
begin
   Self.FQyGetPlanoPagamento.ParamByName('codigoaluno').AsInteger := Self.FICodAluno;
   Self.FQyGetPlanoPagamento.ParamByName('anosemestre').AsInteger := Self.FIAnoSemestre;
   Self.FQyGetPlanoPagamento.ParamByName('curso').AsString := Self.FSCodCurso;
   Self.FQyGetPlanoPagamento.ParamByName('turma').AsString := Self.FSCodTurma;
   try
      try
         Self.FQyGetPlanoPagamento.Open;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_PLANO_PAGAMENTO, [E.Message]);
      end;
      if not Self.FQyGetPlanoPagamento.IsEmpty then
      begin
         Self.FUMPlanoPagamento.Codigo := Self.FQyGetPlanoPagamento.FieldByName('codigo').AsInteger;
         Self.FUMPlanoPagamento.CodColigada := Self.FQyGetPlanoPagamento.FieldByName('cd_coligada').AsInteger;
         Self.FUMPlanoPagamento.AnoSemestre := Self.FQyGetPlanoPagamento.FieldByName('anosemestre').AsInteger;
         Self.FUMPlanoPagamento.Parcelas := Self.FQyGetPlanoPagamento.FieldByName('parcelas').AsInteger;
         Self.FUMPlanoPagamento.TaxasMaterial := Self.FQyGetPlanoPagamento.FieldByName('numerotaxasmaterial').AsInteger;
         Self.FUMPlanoPagamento.DiasParcela0 := Self.FQyGetPlanoPagamento.FieldByName('nr_dias_parczero').AsInteger;
         Self.FUMPlanoPagamento.MaxDisciplinas := Self.FQyGetPlanoPagamento.FieldByName('nr_max_disciplinas').AsInteger;
         Self.FUMPlanoPagamento.CodTipoPlano := Self.FQyGetPlanoPagamento.FieldByName('cd_tipo_plano').AsInteger;
         Self.FUMPlanoPagamento.Descricao := Self.FQyGetPlanoPagamento.FieldByName('descricao').AsString;
         Self.FUMPlanoPagamento.CodTurma := Self.FQyGetPlanoPagamento.FieldByName('turma').AsString;
         Self.FUMPlanoPagamento.CodCurso := Self.FQyGetPlanoPagamento.FieldByName('curso').AsString;
         Self.FUMPlanoPagamento.Paragrafo3 := Self.FQyGetPlanoPagamento.FieldByName('paragrafo3').AsString;
         Self.FUMPlanoPagamento.ValorCobrado := Self.FQyGetPlanoPagamento.FieldByName('valorcobrado').AsCurrency;
         Self.FUMPlanoPagamento.ValorContrato := Self.FQyGetPlanoPagamento.FieldByName('valorcontrato').AsCurrency;
         Self.FUMPlanoPagamento.TaxaMaterial := Self.FQyGetPlanoPagamento.FieldByName('taxamaterial').AsCurrency;
         Self.FUMPlanoPagamento.TaxaApostila := Self.FQyGetPlanoPagamento.FieldByName('taxaapostila').AsCurrency;
         Self.FUMPlanoPagamento.Desconto := Self.FQyGetPlanoPagamento.FieldByName('desconto').AsCurrency;
         Self.FUMPlanoPagamento.Matricula := Self.FQyGetPlanoPagamento.FieldByName('matricula').AsCurrency;
         Self.FUMPlanoPagamento.CreditosBase := Self.FQyGetPlanoPagamento.FieldByName('nr_creditos_base').AsCurrency;
         Self.FUMPlanoPagamento.APartir := Self.FQyGetPlanoPagamento.FieldByName('apartir').AsDateTime;
         Self.FUMPlanoPagamento.DiasUteis := Self.FQyGetPlanoPagamento.FieldByName('sn_dias_uteis').AsString = 'S';
         Self.FUMPlanoPagamento.Creditos := Self.FQyGetPlanoPagamento.FieldByName('sn_creditos').AsString = 'S';
      end;
   finally
      Self.FQyGetPlanoPagamento.Close;
   end;
end;

procedure TUMMatriculaTurma.CopyFrom(
  const AUMMatriculaTurma: TUMMatriculaTurma);
begin
   FreeAndNil(Self.FUMGradeCurricular);
   FreeAndNil(Self.FUMPlanoPagamento);
   Self.FICodAluno := AUMMatriculaTurma.FICodAluno;
   Self.FIAnoSemestre := AUMMatriculaTurma.FIAnoSemestre;
   Self.FICentroCusto := AUMMatriculaTurma.FICentroCusto;
   Self.FIDepartamento := AUMMatriculaTurma.FIDepartamento;
   Self.FSCodTurma := AUMMatriculaTurma.FSCodTurma;
   Self.FSCodCurso := AUMMatriculaTurma.FSCodCurso;
   Self.FUMGradeCurricular.CopyFrom(AUMMatriculaTurma.FUMGradeCurricular);
   Self.FUMPlanoPagamento.CopyFrom(AUMMatriculaTurma.FUMPlanoPagamento);
end;

constructor TUMMatriculaTurma.Create(const AICodAluno, AIAnoSemestre: integer;
  const ASCodCurso, ASCodTurma: string;
  const AUMGradeCurricular: TUMGradeCurricular;
  const AUMPlanoPagamento: TUMPlanoPagamento;
  const AUMMatriculaCurso: TUMMatriculaCurso);
begin
   Self.Create;
   Self.FICodAluno := AICodAluno;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FSCodTurma := ASCodTurma;
   Self.FSCodCurso := ASCodCurso;
   Self.FUMGradeCurricular.CopyFrom(AUMGradeCurricular);
   Self.FUMPlanoPagamento.CopyFrom(AUMPlanoPagamento);
   Self.FUMMatriculaCurso.CopyFrom(AUMMatriculaCurso);
end;

constructor TUMMatriculaTurma.Create;
begin
   Self.FICentroCusto := 0;
   Self.FIDepartamento := 0;
   Self.FUMGradeCurricular := TUMGradeCurricular.Create;
   Self.FUMPlanoPagamento := TUMPlanoPagamento.Create;
   Self.FUMMatriculaCurso := TUMMatriculaCurso.Create;

   DM.CriarConsulta(Self.FQyGetPlanoPagamento);
   DM.CriarConsulta(Self.FQyGetCentroCusto_Depto);

   Self.FQyGetPlanoPagamento.SQL.Text := SQL_GET_PLANO_PAGAMENTO;
   Self.FQyGetCentroCusto_Depto.SQL.Text := SQL_GET_CENTROCUSTO_DEPTO;

   Self.FQyGetPlanoPagamento.ParamCheck := true;
   Self.FQyGetCentroCusto_Depto.ParamCheck := true;
end;

destructor TUMMatriculaTurma.Destroy;
begin
   FreeAndNil(Self.FUMGradeCurricular);
   FreeAndNil(Self.FUMPlanoPagamento);
   FreeAndNil(Self.FUMMatriculaCurso);
   FreeAndNil(Self.FQyGetPlanoPagamento);
   FreeAndNil(Self.FQyGetCentroCusto_Depto);
   inherited;
end;

function TUMMatriculaTurma.GetCentroCusto: integer;
begin
   try
      Self.CarregaCentroCusto_Depto;
   except
      on E: EUMTransferenciaError do raise;
   end;
   Result := Self.FICentroCusto;
end;

function TUMMatriculaTurma.GetDepartamento: integer;
begin
   try
      Self.CarregaCentroCusto_Depto;
   except
      on E: EUMTransferenciaError do raise;
   end;
   Result := Self.FIDepartamento;
end;

function TUMMatriculaTurma.GetTotalCreditos: integer;
var
   LIndice: integer;
begin
   Result := 0;
   for LIndice := 0 to Self.FUMGradeCurricular.ItemCount - 1 do
      Inc(Result, Self.FUMGradeCurricular.Items[LIndice].Creditos);
end;

{ TUMGeradorFinanceiro }

procedure TUMGeradorFinanceiro.AtualizaParcelas(const AUMMatriculaTurmaAtual,
  AUMatriculaTurmaNovo: TUMMatriculaTurma);
begin
   Self.FQyAtualizaParcelas.ParamByName('turma_nova').AsString := AUMatriculaTurmaNovo.CodTurma;
   Self.FQyAtualizaParcelas.ParamByName('coligada_nova').AsInteger := AUMatriculaTurmaNovo.CodColigada;
   Self.FQyAtualizaParcelas.ParamByName('curso_novo').AsString := AUMatriculaTurmaNovo.CodCurso;
   Self.FQyAtualizaParcelas.ParamByName('vl_credito').AsFloat := AUMatriculaTurmaNovo.PlanoPagamento.ValorCredito;
   Self.FQyAtualizaParcelas.ParamByName('codigoaluno').AsInteger := AUMMatriculaTurmaAtual.CodAluno;
   Self.FQyAtualizaParcelas.ParamByName('turma').AsString := AUMMatriculaTurmaAtual.CodTurma;
   Self.FQyAtualizaParcelas.ParamByName('curso').AsString := AUMMatriculaTurmaAtual.CodCurso;
   Self.FQyAtualizaParcelas.ParamByName('anosemestre').AsInteger := AUMMatriculaTurmaAtual.AnoSemestre;
   try
      Self.FQyAtualizaParcelas.ExecSQL;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_ATUALIZAR_PARCELAS, [E.Message]);
   end;
end;

constructor TUMGeradorFinanceiro.Create;
var
   LSMatSitPadrao, LSFinParcAnt, LSTitulosCancelar: string;
begin
   Self.FDtAtual := DM.DataAtual;
   Self.FBCancelarPendente := DM.variavel_parametro('financeiro_cancelar_pendente') = 'S';
   Self.FBCancelarVencida := DM.variavel_parametro('financeiro_cancelar_vencida') = 'S';
   Self.FBCancelarMesAtual := DM.variavel_parametro('financeiro_cancelar_mes_atual') = 'S';
   Self.FSMensalidadeDataBaixa := DM.variavel_parametro('mensalidades_data_baixa');
   Self.SetSituacaoPadrao(DM.variavel_parametro('matriculas_situacao_padrao'));
   Self.SetSituacaoParcelasAnteriores(DM.variavel_parametro('financeiro_parcelas_anteriores'));
   DM.CriarConsulta(Self.FQyGetItensPlanoPgto);
   DM.CriarConsulta(Self.FQyGetMensCancelar);
   DM.CriarConsulta(Self.FQyAtualizaParcelas);
   DM.CriarConsulta(Self.FQyAtualizaDesconto);
   DM.CriarConsulta(Self.FQyCancelaMensalidades);
   DM.CriarConsulta(Self.FQyAtualizaTurmaParcelas);
   Self.FQyGetItensPlanoPgto.SQL.Text := SQL_GET_ITENS_PLANOS_PAGAMENTO;
   Self.FQyGetMensCancelar.SQL.Text :=
      Self.GetSQLParcelasCancelar(
         DM.variavel_parametro('financeiro_cancelar_titulos'));
   Self.FQyAtualizaParcelas.SQL.Text := SQL_ATUALIZA_PARCELAS;
   Self.FQyAtualizaDesconto.SQL.Text := SQL_ATUALIZA_DESCONTO_PARCELA;
   Self.FQyCancelaMensalidades.SQL.Text := SQL_CANCELA_MENSALIDADES;
   Self.FQyAtualizaTurmaParcelas.SQL.Text := SQL_ATUALIZA_TURMA_PARCELAS;
   Self.FQyGetItensPlanoPgto.ParamCheck := true;
   Self.FQyGetMensCancelar.ParamCheck := true;
   Self.FQyAtualizaParcelas.ParamCheck := true;
   Self.FQyAtualizaDesconto.ParamCheck := true;
   Self.FQyCancelaMensalidades.ParamCheck := true;
   Self.FQyAtualizaTurmaParcelas.ParamCheck := true;
end;

destructor TUMGeradorFinanceiro.Destroy;
begin
   FreeAndNil(Self.FQyGetItensPlanoPgto);
   FreeAndNil(Self.FQyGetMensCancelar);
   FreeAndNil(Self.FQyAtualizaParcelas);
   FreeAndNil(Self.FQyAtualizaDesconto);
   FreeAndNil(Self.FQyCancelaMensalidades);
   FreeAndNil(Self.FQyAtualizaTurmaParcelas);
   inherited;
end;

{ **
   Pega os itens do plano de pagamento e gera as parcelas de mensalidade.
}
procedure TUMGeradorFinanceiro.GeraFinanceiro(
  const AUMMatriculaTurmaNovo: TUMMatriculaTurma);
var
   LDIndDesconto, LDValorCredito, LDValorBruto, LDCreditosRestantes, LDCreditos,
   LDDesconto, LDDescExtra, LDValorExtra: Double;
   LDtAux, LDtVencto, LDtHoje: TDateTime;
   LCSnCredito: Char;
   LIParcelas, LIParcela, LIItemPlano, LITipoTitulo, LIPlanoContas: integer;
   LBParcela0: boolean;
   LSDescTipo, LDTrataValorExtra: string;
   LWAno, LWMes, LWDia: Word;
   situacaoFinanMensalidade: Integer;
begin
   Self.FQyGetItensPlanoPgto.ParamByName('codigoplano').AsInteger :=
      AUMMatriculaTurmaNovo.PlanoPagamento.Codigo;
   try
      try
         LDtHoje := Self.FDtAtual;
         try
            DecodeDate(AUMMatriculaTurmaNovo.PlanoPagamento.APartir, LWAno, LWMes, LWDia);
         except
            DecodeDate(Self.FDtAtual, LWAno, LWMes, LWDia);
         end;
         LIParcela :=
            AUMMatriculaTurmaNovo.PlanoPagamento.Parcelas;
         LDCreditosRestantes :=
            AUMMatriculaTurmaNovo.TotalCreditos *
            AUMMatriculaTurmaNovo.PlanoPagamento.Parcelas;
         Self.FQyGetItensPlanoPgto.Open;
         while not Self.FQyGetItensPlanoPgto.Eof do
         begin
            // resgata o índice de desconto para calcular proporcional
            if Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').AsCurrency > 0 then
            begin
               LDIndDesconto :=
                  Self.FQyGetItensPlanoPgto.FieldByName('valordesconto').AsCurrency /
                  Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').AsCurrency;
            end
            else
               LDIndDesconto := 0;
            // monta a data de vencimento configurada no plano de pagamento
            LDtAux := DataValida(
               Self.FQyGetItensPlanoPgto.FieldByName('nr_ano').AsInteger,
               Self.FQyGetItensPlanoPgto.FieldByName('mes').AsInteger,
               Self.FQyGetItensPlanoPgto.FieldByName('nr_dia').AsInteger);

            // verifica se trabalha com créditos ou créditos fixos
            if Self.FQyGetItensPlanoPgto.FieldByName('sn_credito_parcela').AsString[1] in ['S', 'F'] then
            begin
               // calcula o valor do crédito
               LDValorCredito :=
                  Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').AsCurrency /
                  AUMMatriculaTurmaNovo.PlanoPagamento.CreditosBase;
               LCSnCredito :=
                  Self.FQyGetItensPlanoPgto.FieldByName('sn_credito_parcela').AsString[1];

               // verifica se foi definifo um número mínimo de créditos
               if Self.FQyGetItensPlanoPgto.FieldByName('nr_creditos_minimos').AsInteger > 0 then
               begin
                  // verifica se trabalha com créditos
                  if Self.FQyGetItensPlanoPgto.FieldByName('sn_credito_parcela').AsString = 'S' then
                  begin
                     // verifica se o total de créditos é inferior ao número de
                     // créditos mínimos definido no plano de pagamento
                     if AUMMatriculaTurmaNovo.TotalCreditos <
                        Self.FQyGetItensPlanoPgto.FieldByName('nr_creditos_minimos').AsInteger then
                     begin
                        // se sim, então assume a quantidade de créditos mínimos
                        LDCreditos :=
                           Self.FQyGetItensPlanoPgto.FieldByName('nr_creditos_minimos').AsInteger;
                     end
                     else
                     begin
                        // caso contrário, utiliza a quantidade de créditos da matrícula
                        LDCreditos := AUMMatriculaTurmaNovo.TotalCreditos;
                     end;
                     // calcula o valor bruto
                     LDValorBruto :=
                           Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').Value /
                           AUMMatriculaTurmaNovo.PlanoPagamento.CreditosBase * LDCreditos;
                     LDCreditosRestantes :=
                        LDCreditosRestantes - AUMMatriculaTurmaNovo.TotalCreditos;
                  end
                  else
                  begin
                     // trabalha com créditos fixos
                     LDCreditos :=
                        Self.FQyGetItensPlanoPgto.FieldByName('nr_creditos_minimos').AsInteger;
                     LDValorBruto :=
                        Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').Value /
                        AUMMatriculaTurmaNovo.PlanoPagamento.CreditosBase *
                        Self.FQyGetItensPlanoPgto.FieldByName('nr_creditos_minimos').AsInteger;
                     LDCreditosRestantes :=
                        LDCreditosRestantes - Self.FQyGetItensPlanoPgto.FieldByName('nr_creditos_minimos').AsInteger;
                  end;
               end
               else
               begin
                  // créditos mínimos não definidos
                  LDCreditos := LDCreditosRestantes / LIParcela;
                  LDValorBruto :=
                     Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').Value /
                     AUMMatriculaTurmaNovo.PlanoPagamento.CreditosBase * LDCreditos;
                  LDCreditosRestantes := LDCreditosRestantes - LDCreditos;
               end;
               Dec(LIParcela);
               LDDesconto := LDValorBruto * LDIndDesconto;
               LDDescExtra :=
                  (  Self.FQyGetItensPlanoPgto.FieldByName('descontoextra').Value /
                     Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').Value
                  ) * LDValorBruto;
            end
            else
            begin
               // não trabalha com créditos
               LDValorCredito := 0;
               LCSnCredito := 'N';
               LDCreditos := 0;
               LDValorBruto := Self.FQyGetItensPlanoPgto.FieldByName('valorbruto').Value;
               LDDesconto := Self.FQyGetItensPlanoPgto.FieldByName('valordesconto').Value;
               LDDescExtra := Self.FQyGetItensPlanoPgto.FieldByName('descontoextra').Value;

               LDTrataValorExtra := Self.FQyGetItensPlanoPgto.FieldByName('valorextra').AsString;
               if ( LDTrataValorExtra = '' ) then
               begin
                  LDTrataValorExtra := '0';
               end;
               LDValorExtra := StrToInt(LDTrataValorExtra);
            end;
            LBParcela0 := false;
            // verifica se é a parcela 0
            if Self.FQyGetItensPlanoPgto.FieldByName('nr_dia').AsInteger = 0 then
            begin
               LIParcelas := Self.FQyGetItensPlanoPgto.FieldByName('parcela').AsInteger;
               LDtVencto := LDtHoje + AUMMatriculaTurmaNovo.PlanoPagamento.DiasParcela0;
               LBParcela0 := true;
            end
            // a data de vencimento da parcela é inferior à data de hoje
            else if LDtAux < LDtHoje then
            begin
               // verifica como irá tratar a parcela
               case Self.FUMSituacaoParcelasAnteriores of
                  spaVencPlano: // utiliza a data de vencimento configurada no plano
                  begin
                     LDtVencto := LDtAux;
                     LIParcelas := Self.FQyGetItensPlanoPgto.FieldByName('parcela').AsInteger;
                  end;
                  spaPerdoar: // perdoa a parcela
                  begin
                     LDtVencto := LDtHoje;
                     LIParcelas := - Self.FQyGetItensPlanoPgto.FieldByName('parcela').AsInteger;
                  end;
                  spaNaoGerar: // não gera a parcela
                  begin
                     LDtVencto := LDtHoje;
                     LIParcelas := -99;
                  end;
                  spaVencAmanha: // joga a data de vencimento para o dia seguinte
                  begin
                     LDtVencto := LDtHoje + 1;
                     case DayOfWeek(LDtVencto) of
                        1: LDtVencto := LDtVencto + 1; // caiu no domingo, joga para segunda
                        7: LDtVencto := LDtVencto + 2; // caiu no sábado, joga para segunda
                     end;
                     LIParcelas := Self.FQyGetItensPlanoPgto.FieldByName('parcela').AsInteger;
                  end;
                  spaVencHoje: // define a data de vencimento para a data de hoje
                  begin
                     LDtVencto := LDtHoje;
                     LIParcelas := Self.FQyGetItensPlanoPgto.FieldByName('parcela').AsInteger;
                  end;
               end;
            end
            else
            begin
               LDtVencto := LDtAux;
               LIParcelas := Self.FQyGetItensPlanoPgto.FieldByName('parcela').AsInteger;
            end;
            LIItemPlano := Self.FQyGetItensPlanoPgto.FieldByName('cd_item_plano').AsInteger;
            LITipoTitulo := Self.FQyGetItensPlanoPgto.FieldByName('cd_tipo_parcela').AsInteger;
            LIPlanoContas := Self.FQyGetItensPlanoPgto.FieldByName('cd_conta').AsInteger;
            LSDescTipo := Self.FQyGetItensPlanoPgto.FieldByName('ds_tipo_titulo').AsString;
            if LBParcela0 then
            begin
               Inc(LWMes);
               if LWMes = 13 then
               begin
                  LWMes := 1;
                  Inc(LWAno);
               end;
               LDtAux := DataValida(LWAno, LWMes, LWDia);
            end;
            try
               if LIParcelas <> -99 then
               begin

                  if (uMatriculas.frmMatriculas.tblMatriculasSituacao.AsInteger = 1) then
                  begin
                     situacaoFinanMensalidade := 2;
                  end
                  else if (uMatriculas.frmMatriculas.tblMatriculasSituacao.AsInteger = 10) then
                  begin
                     situacaoFinanMensalidade := 10;
                  end
                  else
                  begin
                     situacaoFinanMensalidade := Self.FISituacaoPadrao;
                  end;

                  // gera a parcela de mensalidade
                  Self.GeraMensalidade(
                     AUMMatriculaTurmaNovo.CodAluno,
                     LIParcelas,
                     AUMMatriculaTurmaNovo.AnoSemestre,
                     situacaoFinanMensalidade,
                     AUMMatriculaTurmaNovo.Departamento,
                     LITipoTitulo,
                     LIPlanoContas,
                     AUMMatriculaTurmaNovo.CentroCusto,
                     LIItemPlano,
                     0,
                     0,
                     AUMMatriculaTurmaNovo.CodTurma,
                     AUMMatriculaTurmaNovo.CodCurso,
                     LSDescTipo,
                     LDValorBruto,
                     LDDesconto,
                     LDCreditos,
                     LDDescExtra,
                     LDValorExtra,
                     LDValorCredito,
                     LDtVencto,
                     AUMMatriculaTurmaNovo.PlanoPagamento.APartir,
                     LCSnCredito
                  );
               end;
            except
               on E: EUMTransferenciaError do raise;
            end;
            Self.FQyGetItensPlanoPgto.Next;
         end;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_ITENS_PLANO_PAGAMENTO, [E.Message]);
      end;
   finally
      Self.FQyGetItensPlanoPgto.Close;
   end;
end;

procedure TUMGeradorFinanceiro.GeraFinanceiro(const AUMMatriculaTurmaNovo,
  AUMMatriculaTurmaAtual: TUMMatriculaTurma);
begin
   try
      Self.CancelaParcelasAntigas(AUMMatriculaTurmaAtual);
      Self.GeraFinanceiro(AUMMatriculaTurmaNovo);
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

function TUMGeradorFinanceiro.GeraMensalidade(const AICodAluno, AIParcela,
  AIAnoSemestre, AISituacao, AIDepartamento, AITipoTitulo, AIPlanoConta, AICentroCusto,
  AICodItemPlano, AICodCheque, AICodResp: integer; const ASCodTurma, ASCodCurso,
  ASHistorico: string; const ADValorBruto, ADDescontoCond, ADCreditos,
  ADDescontoExtra, ADValorExtra, ADValorCredito: Double; const ADtVencimento,
  ADtApartirDe: TDateTime; const ACSnCredito: Char): integer;
var
   LDtCompetencia: TDateTime;
begin
   LDtCompetencia := Max(Max(DM.DataAtual, ADtVencimento), ADtApartirDe);
   Result :=
      DM.GerarMensalidade(
         AICodAluno, Abs(AIParcela), ASCodTurma, RoundFloat(ADValorBruto, 2), 0,
         AIAnoSemestre, ADtVencimento, LDtCompetencia, AISituacao, ASCodCurso,
         AIDepartamento, 0, -1, ADDescontoCond, RoundFloat(ADCreditos, 5),
         ASHistorico, AITipoTitulo, AIPlanoConta, AICentroCusto, ADDescontoExtra,
         ADValorExtra, ACSnCredito, ADValorCredito, AICodItemPlano, 1, 0, 0
      );
   if ADDescontoExtra > 0 then
      try
         Self.RegistraDescontoExtra(Result, ADtVencimento, ADDescontoExtra);
      except
         on E: EUMTransferenciaError do raise;
      end;
end;

procedure TUMGeradorFinanceiro.AtualizaTurmaParcelas(
  const AUMMatriculaTurmaAtual, AUMatriculaTurmaNovo: TUMMatriculaTurma);
begin
   Self.FQyAtualizaTurmaParcelas.ParamByName('curso_novo').AsString :=  AUMatriculaTurmaNovo.CodCurso;
   Self.FQyAtualizaTurmaParcelas.ParamByName('turma_nova').AsString := AUMatriculaTurmaNovo.CodTurma;
   Self.FQyAtualizaTurmaParcelas.ParamByName('coligada_nova').AsInteger := AUMatriculaTurmaNovo.CodColigada;
   Self.FQyAtualizaTurmaParcelas.ParamByName('depto_novo').AsInteger    := AUMatriculaTurmaNovo.Departamento;
   Self.FQyAtualizaTurmaParcelas.ParamByName('codigoaluno').AsInteger := AUMMatriculaTurmaAtual.CodAluno;
   Self.FQyAtualizaTurmaParcelas.ParamByName('turma').AsString := AUMMatriculaTurmaAtual.CodTurma;
   Self.FQyAtualizaTurmaParcelas.ParamByName('curso').AsString := AUMMatriculaTurmaAtual.CodCurso;
   Self.FQyAtualizaTurmaParcelas.ParamByName('anosemestre').AsInteger := AUMMatriculaTurmaAtual.AnoSemestre;
   try
      Self.FQyAtualizaTurmaParcelas.ExecSQL;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_ATUALIZAR_TURMA_PARCELAS, [E.Message]);
   end;
end;

{ **
   Cancela as parcelas da matrícula anterior do aluno. Altera a situação para 5
   (CANCELADA) e atualiza a data de pagamento.
}
procedure TUMGeradorFinanceiro.CancelaParcelasAntigas(
  const AUMMatriculaTurmaAtual: TUMMatriculaTurma);
var
   LSAnoMesVencto, LSAnoMesAtual: string;
   LDtVencimento, LDtAux: TDateTime;
   LBCancelar: boolean;
begin
   LBCancelar := false;
   if Self.FBCancelarPendente and Self.FBCancelarVencida then
   begin
      Self.FQyGetMensCancelar.ParamByName('codigoaluno').AsInteger := AUMMatriculaTurmaAtual.CodAluno;
      Self.FQyGetMensCancelar.ParamByName('turma').AsString := AUMMatriculaTurmaAtual.CodTurma;
      Self.FQyGetMensCancelar.ParamByName('anosemestre').AsInteger := AUMMatriculaTurmaAtual.AnoSemestre;
      try
         try
            Self.FQyGetMensCancelar.Open;
         except
            on E: EDatabaseError do
               raise EUMTransferenciaError.CreateFmt(MSG_ERRO_GET_MENSALIDADES_A_CANCELAR, [E.Message]);
         end;
         while not Self.FQyGetMensCancelar.Eof do
         begin
            LDtVencimento := Self.FQyGetMensCancelar.FieldByName('datavencimento').AsDateTime;
            LSAnoMesVencto := FormatDateTime('yyyy-mm', LDtVencimento);
            LSAnoMesAtual := FormatDateTime('yyyy-mm', Self.FDtAtual);
            // verifica se a parcela pode ser cancelada
            LBCancelar :=
               ((LDtVencimento < Self.FDtAtual) and Self.FBCancelarVencida) or
               (((LDtVencimento >= Self.FDtAtual) and Self.FBCancelarPendente) and
               (not ((LSAnoMesVencto = LSAnoMesAtual) and (not Self.FBCancelarMesAtual))));
            if LBCancelar then
            begin
               // calcula a data de pagamento
               if (Self.FSMensalidadeDataBaixa <> '[BAIXA]') and
                  (Self.FSMensalidadeDataBaixa <> '[ATUAL]') and
                  ((Self.FDtAtual < LDtVencimento) or
                   (Self.FSMensalidadeDataBaixa = '[VENCIMENTO]')) then
               begin
                  Self.FQyCancelaMensalidades.ParamByName('datapagamento').AsDateTime := LDtVencimento;
               end
               else
               begin
                  Self.FQyCancelaMensalidades.ParamByName('datapagamento').AsDateTime := Self.FDtAtual;
               end;
               // excecuta ação de remessa
               DM.FazAcaoRemessa(arCancelar, Self.FQyGetMensCancelar.FieldByName('cd_mensalidade').AsInteger);
               Self.FQyCancelaMensalidades.ParamByName('cd_mensalidade').AsInteger :=
                  Self.FQyGetMensCancelar.FieldByName('cd_mensalidade').AsInteger;
               try
                  // cancela a parcela de mensalidade
                  Self.FQyCancelaMensalidades.ExecSQL;
               except
                  on E: EDatabaseError do
                     raise EUMTransferenciaError.CreateFmt(MSG_ERRO_CANCELAR_PARCELAS, [E.Message]);
               end;
               // registra movimento de cancelamento na tesouraria
               Self.RegistraMovimentoCancelamento(
                  Self.FQyGetMensCancelar.FieldByName('cd_mensalidade_origem').AsInteger,
                  Self.FQyGetMensCancelar.FieldByName('cd_coligada').AsInteger,
                  Self.FQyGetMensCancelar.FieldByName('cd_mensalidade').AsInteger,
                  Self.FQyGetMensCancelar.FieldByName('valorbruto').AsCurrency +
                  Self.FQyGetMensCancelar.FieldByName('valorextra').AsCurrency -
                  Self.FQyGetMensCancelar.FieldByName('descontoextra').AsCurrency
               );
               // registra movito do cancelamento
               Self.RegistraMotivoCancelamento(
                  AUMMatriculaTurmaAtual.CodAluno,
                  Self.FQyGetMensCancelar.FieldByName('parcela').AsInteger,
                  Self.FQyGetMensCancelar.FieldByName('datavencimento').AsDateTime,
                  Self.FQyGetMensCancelar.FieldByName('turma').AsString
               );
            end;
            Self.FQyGetMensCancelar.Next;
         end;
      finally
         Self.FQyGetMensCancelar.Close;
      end;
   end;
end;

function TUMGeradorFinanceiro.GetSQLParcelasCancelar(
  const ASTitulosCancelar: string): string;
begin
   if Trim(ASTitulosCancelar) <> '' then
      Result := Format(SQL_GET_MENSALIDADES_CANCELAR, [' AND cd_tipo_titulo IN(' + ASTitulosCancelar + ')'])
   else
      Result := Format(SQL_GET_MENSALIDADES_CANCELAR, ['']);
end;

procedure TUMGeradorFinanceiro.ReajustaFinanceiro(
  const AUMMatriculaTurmaNovo: TUMMatriculaTurma);
begin
   try
      DM.recalcular_creditos_financeiros(
         AUMMatriculaTurmaNovo.CodAluno,
         AUMMatriculaTurmaNovo.CodTurma,
         AUMMatriculaTurmaNovo.AnoSemestre, false);
   except
      on E: Exception do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_AJUSTAR_FINANCEIRO, [E.Message]);
   end;
end;

procedure TUMGeradorFinanceiro.ReajustaFinanceiro(const AUMMatriculaTurmaAtual,
  AUMMatriculaTurmaNovo: TUMMatriculaTurma);
begin
   try
      Self.AtualizaParcelas(AUMMatriculaTurmaAtual, AUMMatriculaTurmaNovo);
      Self.ReajustaFinanceiro(AUMMatriculaTurmaNovo);
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

procedure TUMGeradorFinanceiro.RegistraDescontoExtra(
  const AICodMensalidade: Integer; const ADtPagamento: TDateTime;
  const ADValorMovimento: Double);
var
   LMovimento: TMovimento;
begin
   LMovimento := TMovimento.create;
   try
      LMovimento.TipoDeAcao := BaixarporDesconto;
      LMovimento.CodigoTitulo := AICodMensalidade;
      LMovimento.CodAcao := DM.BuscarCodigoAcaoPadrao(11);
      LMovimento.ValorMovimento := ADValorMovimento;
      LMovimento.RegistrarMovimentacaoCR(0);
   finally
      FreeAndNil(LMovimento);
   end;
   if (Self.FSMensalidadeDataBaixa <> '[BAIXA]') and
      (Self.FSMensalidadeDataBaixa <> '[ATUAL]') and
      ((Self.FDtAtual < ADtPagamento) or (Self.FSMensalidadeDataBaixa = '[VENCIMENTO]')) then
      Self.FQyAtualizaDesconto.ParamByName('datapagamento').AsDateTime := ADtPagamento
   else
      Self.FQyAtualizaDesconto.ParamByName('datapagamento').AsDateTime := Self.FDtAtual;

   Self.FQyAtualizaDesconto.ParamByName('cd_mensalidade').AsInteger := AICodMensalidade;
   try
      Self.FQyAtualizaDesconto.ExecSQL;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_REGISTRAR_DESCONTO_MENS, [E.Message]);
   end;
end;

procedure TUMGeradorFinanceiro.RegistraMotivoCancelamento(const AICodAluno,
  AIParcela: integer; const ADtVencimento: TDateTime; const ASCodTurma: string);
begin
   if DM.FindMotivo(AICodAluno, AIParcela, ADtVencimento, ASCodTurma) then
      DM.tblMotivos.Edit
   else
      DM.tblMotivos.Insert;
   DM.tblMotivosCodigoAluno.AsInteger := AICodAluno;
   DM.tblMotivosParcela.AsInteger := AIParcela;
   DM.tblMotivosturma.AsString := ASCodTurma;
   DM.tblMotivosDataMotivo.AsDateTime := ADtVencimento;
   DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
   DM.tblMotivosMotivo.AsString := 'Matrícula Cancelada';
   DM.tblMotivos.Post;
   DM.tblMotivos.Close;
end;

procedure TUMGeradorFinanceiro.RegistraMovimentoCancelamento(const AICodTitulo,
  AICodColigada, AICodMovimento: integer; const ADValorMovimento: Double);
var
   LMovimento: TMovimento;
begin
   LMovimento := TMovimento.create;
   try
      LMovimento.TipoDeAcao := BaixarporCancelamento;
      LMovimento.CodigoTitulo := AICodTitulo;
      LMovimento.Coligada := AICodColigada;
      LMovimento.CodigoMovimento := AICodMovimento;
      LMovimento.CodAcao := DM.BuscarCodigoAcaoPadrao(14);
      LMovimento.Observacao := 'Matrícula Cancelada';
      LMovimento.ValorMovimento := ADValorMovimento;
      LMovimento.RegistrarMovimentacaoCR(0);
   finally
      FreeAndNil(LMovimento);
   end;
end;

procedure TUMGeradorFinanceiro.SetSituacaoPadrao(
  const ASSituacaoPadrao: string);
begin
   if Trim(ASSituacaoPadrao) <> '' then
      try
         Self.FISituacaoPadrao := StrToInt(ASSituacaoPadrao)
      except
         on E: EConvertError do Self.FISituacaoPadrao := 2
      end
   else
      Self.FISituacaoPadrao := 2;
end;

procedure TUMGeradorFinanceiro.SetSituacaoParcelasAnteriores(
  const ASSituacaoParcelasAnteriores: string);
begin
   if ASSituacaoParcelasAnteriores = '[VENCIMENTO=PLANO]' then
   begin
      Self.FUMSituacaoParcelasAnteriores := spaVencPlano;
   end
   else if ASSituacaoParcelasAnteriores = '[PERDOAR]' then
   begin
      Self.FUMSituacaoParcelasAnteriores := spaPerdoar;
   end
   else if ASSituacaoParcelasAnteriores = '[NAO_GERAR]' then
   begin
      Self.FUMSituacaoParcelasAnteriores := spaNaoGerar;
   end
   else if ASSituacaoParcelasAnteriores = '[VENCIMENTO=AMANHA]' then
   begin
      Self.FUMSituacaoParcelasAnteriores := spaVencAmanha;
   end
   else if ASSituacaoParcelasAnteriores = '[VENCIMENTO=HOJE]' then
   begin
      Self.FUMSituacaoParcelasAnteriores := spaVencHoje;
   end;
end;

{ TUMTransferenciaCurso }
procedure TUMTransferenciaCurso.AtivaMatricula;
begin
   try
      Self.AtivaMatriculaTurma;
      //Esse procedimento ja verifica se existe e então da o update
      Self.CriaFichaIndividual;
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

procedure TUMTransferenciaCurso.AtivaMatriculaCurso;
const
   SQL_ATIVA_MATRICULA_CURSO =
      'UPDATE '+
         'matriculas_curso '+
      'SET '+
         'dt_saida = NULL,'+
         'cd_situacao = :cd_situacao, '+
         'cd_grade = :cd_grade, '+
         'cd_turno = :cd_turno, '+
         'cd_ingresso = :cd_ingresso '+
      'WHERE '+
         'cd_matricula_curso = :cd_matricula_curso';
var
   qryAtiva : TUMZQuery;
begin
   DM.CriarConsulta(qryAtiva);

   With qryAtiva do
   begin
      SQL.Text := SQL_ATIVA_MATRICULA_CURSO;

      ParamByName('cd_matricula_curso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo;;
      ParamByName('cd_situacao').AsInteger := 1;

      ParamByName('cd_grade').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.GradeCurricular.Codigo;
      ParamByName('cd_turno').AsString := Self.FUMMatriculaTurmaNovo.MatriculaCurso.Turno.Codigo;
      ParamByName('cd_ingresso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.FormaIngresso.Codigo;
      ExecSQL;

      Free;
   end;
end;

procedure TUMTransferenciaCurso.AtivaMatriculaTurma;
const
   SQL_ATIVA_MATRICULA_TURMA =
      'UPDATE '+
         'matriculas '+
      'SET '+
         'datasaida = null,'+
         'situacao = :situacao, '+
         'usuario = :usuario, '+
         'planopagamento = :planopagamento, '+
         'cd_ingresso = :cd_ingresso, '+
         'cd_turma_anterior = :cd_turma_anterior '+
      'WHERE '+
         'cd_matricula_curso = :cd_matricula_curso AND ' +
         'turma = :turma AND ' +
         'anosemestre = :anosemestre';
var
   qryAtiva : TUMZQuery;
begin
   DM.CriarConsulta(qryAtiva);

   With qryAtiva do
   begin
      SQL.Text := SQL_ATIVA_MATRICULA_TURMA;

      ParamByName('cd_matricula_curso').AsInteger := Self.FUMMatriculaTurmaNovo.CodAluno;
      ParamByName('usuario').AsString := DM.sLogin;
      ParamByName('situacao').AsInteger := umatriculas.frmMatriculas.tblMatriculasSituacao.AsInteger;
      ParamByName('cd_ingresso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.FormaIngresso.Codigo;
      ParamByName('cd_turma_anterior').AsString := Self.FUMMatriculaTurmaAtual.CodTurma;

      ParamByName('cd_matricula_curso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo;
      ParamByName('turma').AsString := Self.FUMMatriculaTurmaNovo.CodTurma;
      ParamByName('anosemestre').AsInteger := Self.FUMMatriculaTurmaNovo.AnoSemestre;

      // Se selecionou a opção - Manter valores financeiros atuais, o código do plano vem zerado, então, manter o plano atual
      if Self.FUMMatriculaTurmaNovo.PlanoPagamento.Codigo = 0 then begin
        ParamByName('planopagamento').AsInteger := Self.FUMMatriculaTurmaAtual.PlanoPagamento.Codigo;
      end else begin
        ParamByName('planopagamento').AsInteger := Self.FUMMatriculaTurmaNovo.PlanoPagamento.Codigo;
      end;
      
      try
         ExecSQL;
      except
         on E: EDatabaseError do
            raise EUMTransferenciaError.CreateFmt(MSG_ERRO_INSERIR_MATRICULA_TURMA, [E.Message]);
      end;

      Free;
   end;
end;

procedure TUMTransferenciaCurso.AtualizaTurmaParcelas;
begin
   try
      Self.FUMGeradorFinanceiro.AtualizaTurmaParcelas(Self.FUMMatriculaTurmaAtual, Self.FUMMatriculaTurmaNovo);
   except
      on EUMTransferenciaError do raise;
   end;
end;

constructor TUMTransferenciaCurso.Create;
begin
   Self.FUMGeradorFinanceiro := TUMGeradorFinanceiro.Create;
   Self.FUMMatriculaTurmaAtual := TUMMatriculaTurma.Create;
   Self.FUMMatriculaTurmaNovo := TUMMatriculaTurma.Create;

   DM.CriarConsulta(Self.FQyDesativaMatriculaCurso);
   DM.CriarConsulta(Self.FQyDesativaMatriculaTurma);
   DM.CriarConsulta(Self.FQyDesativaFichaIndividual);
   DM.CriarConsulta(Self.FQyCriaMatriculaCurso);
   DM.CriarConsulta(Self.FQyCriaMatriculaTurma);
   DM.CriarConsulta(Self.FQyCriaFichaIndividual);

   Self.FQyDesativaMatriculaCurso.SQL.Text := SQL_DESATIVA_MATRICULA_CURSO;
   Self.FQyDesativaMatriculaTurma.SQL.Text := SQL_DESATIVA_MATRICULA_TURMA;
   //Verifica se a conexão é Oracle ou MySQL
   if Self.FQyDesativaFichaIndividual.Connection.Protocol = 'oracle' then //Oracle
   begin
      Self.FQyDesativaFichaIndividual.SQL.Text := SQL_DESATIVA_FICHAINDIVIDUAL_ORACLE;
   end else begin
      Self.FQyDesativaFichaIndividual.SQL.Text := SQL_DESATIVA_FICHAINDIVIDUAL;
   end;

   Self.FQyCriaMatriculaCurso.SQL.Text := SQL_INSERE_MATRICULA_CURSO;
   Self.FQyCriaMatriculaTurma.SQL.Text := SQL_INSERE_MATRICULA_TURMA;
   Self.FQyCriaFichaIndividual.SQL.Text := SQL_INSERE_FICHAINDIVIDUAL;

   Self.FQyDesativaMatriculaCurso.ParamCheck := true;
   Self.FQyDesativaMatriculaTurma.ParamCheck := true;
   Self.FQyDesativaFichaIndividual.ParamCheck := true;
   Self.FQyCriaMatriculaCurso.ParamCheck := true;
   Self.FQyCriaMatriculaTurma.ParamCheck := true;
   Self.FQyCriaFichaIndividual.ParamCheck := true;
end;

constructor TUMTransferenciaCurso.Create(const AUMMatriculaTurmaAtual,
  AUMMatriculaTurmaNovo: TUMMatriculaTurma);
begin
   Self.Create;
   Self.FUMMatriculaTurmaAtual.CopyFrom(AUMMatriculaTurmaAtual);
   Self.FUMMatriculaTurmaNovo.CopyFrom(AUMMatriculaTurmaNovo);
end;

procedure TUMTransferenciaCurso.CriaFichaIndividual;
var
   LIndice: integer;
   qyVerificaFichaExistente: TUMZReadOnlyQuery;
   qyAlteraFichaExistente: TUMZQuery;   
begin
   Self.FUMMatriculaTurmaNovo.CarregaGradeCurricular;
   Self.FQyCriaFichaIndividual.ParamByName('anosemestre').AsInteger := Self.FUMMatriculaTurmaNovo.AnoSemestre;
   Self.FQyCriaFichaIndividual.ParamByName('turma').AsString := Self.FUMMatriculaTurmaNovo.CodTurma;
   Self.FQyCriaFichaIndividual.ParamByName('codigoaluno').AsInteger := Self.FUMMatriculaTurmaNovo.CodAluno;
   Self.FQyCriaFichaIndividual.ParamByName('curso').AsString := Self.FUMMatriculaTurmaNovo.CodCurso;
   Self.FQyCriaFichaIndividual.ParamByName('situacao').AsInteger := umatriculas.frmMatriculas.tblMatriculasSituacao.AsInteger;

   DM.CriarConsulta(qyVerificaFichaExistente);
   DM.CriarConsulta(qyAlteraFichaExistente);

   for LIndice := 0 to Self.FUMMatriculaTurmaNovo.GradeCurricular.ItemCount - 1 do
   begin
      qyVerificaFichaExistente.Close();
      qyVerificaFichaExistente.SQL.Clear();
      qyVerificaFichaExistente.SQL.Text :=
         'SELECT * from fichaindividual where  '+
         ' disciplina =:disciplina AND  anosemestre = :anosemestre AND turma = :turma AND codigoaluno = :codigoaluno AND curso = :curso';
      qyVerificaFichaExistente.Params :=  Self.FQyCriaFichaIndividual.Params;
      qyVerificaFichaExistente.ParamByName('disciplina').AsInteger:= Self.FUMMatriculaTurmaNovo.GradeCurricular.Items[LIndice].CodDisc;
      qyVerificaFichaExistente.Open;

      if qyVerificaFichaExistente.RecordCount = 0 then
      begin
         Self.FQyCriaFichaIndividual.ParamByName('codigograde').AsString := Self.FUMMatriculaTurmaNovo.GradeCurricular.Items[LIndice].CodGrade;
         Self.FQyCriaFichaIndividual.ParamByName('disciplina').AsInteger := Self.FUMMatriculaTurmaNovo.GradeCurricular.Items[LIndice].CodDisc;
         try
            Self.FQyCriaFichaIndividual.ExecSQL;
         except
            on E: EDatabaseError do
               raise EUMTransferenciaError.CreateFmt(MSG_ERRO_INSERIR_FICHAINDIVIDUAL, [E.Message]);
         end;
      end
      else
      begin
         qyAlteraFichaExistente.Close;
         qyAlteraFichaExistente.SQL.Clear;
         qyAlteraFichaExistente.SQL.Text := 'UPDATE fichaindividual SET turmamatricula = :turmamatricula, situacao = :situacao  WHERE '+
         ' disciplina =:disciplina AND  anosemestre = :anosemestre AND turma = :turma AND codigoaluno = :codigoaluno AND curso = :curso';
         qyAlteraFichaExistente.Params := qyVerificaFichaExistente.Params;
         qyAlteraFichaExistente.ParamByName('turmamatricula').AsString := Self.FUMMatriculaTurmaNovo.CodTurma;
         qyAlteraFichaExistente.ParamByName('situacao').AsInteger := 1;
         qyAlteraFichaExistente.ExecSQL();
      end;
   end;
   FreeAndNil(qyAlteraFichaExistente);
   FreeAndNil(qyVerificaFichaExistente);
end;

procedure TUMTransferenciaCurso.CriaMatricula;
begin
   try
      Self.CriaMatriculaTurma;
      Self.CriaFichaIndividual;
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

procedure TUMTransferenciaCurso.CriaMatriculaCurso;
begin
   Self.FQyCriaMatriculaCurso.ParamByName('cd_pessoa').AsInteger := Self.FUMMatriculaTurmaNovo.CodAluno;
   Self.FQyCriaMatriculaCurso.ParamByName('nr_matricula').AsInteger := Self.FUMMatriculaTurmaAtual.MatriculaCurso.Codigo;
   Self.FQyCriaMatriculaCurso.ParamByName('curso').AsString := Self.FUMMatriculaTurmaNovo.MatriculaCurso.CodCurso;
   Self.FQyCriaMatriculaCurso.ParamByName('cd_grade').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.GradeCurricular.Codigo;
   Self.FQyCriaMatriculaCurso.ParamByName('nr_anosem_grade').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.GradeCurricular.AnoSemestre;
   Self.FQyCriaMatriculaCurso.ParamByName('nr_anosem_ingresso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.AnoSemIngresso;
   Self.FQyCriaMatriculaCurso.ParamByName('cd_turno').AsString := Self.FUMMatriculaTurmaNovo.MatriculaCurso.Turno.Codigo;
   Self.FQyCriaMatriculaCurso.ParamByName('cd_ingresso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.FormaIngresso.Codigo;
   Self.FQyCriaMatriculaCurso.ParamByName('cd_situacao').AsInteger := uMatriculas.frmMatriculas.tblMatriculasSituacao.AsInteger;
   try
      Self.FQyCriaMatriculaCurso.ExecSQL;
   except
      raise EUMTransferenciaError.CreateFmt('O aluno já possui uma Matricula curso para este curso!', []);
      erroTransferencia := True;
   end;
   Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo := DM.LastInsert;
end;

procedure TUMTransferenciaCurso.CriaMatriculaTurma;
begin
   Self.FQyCriaMatriculaTurma.ParamByName('anosemestre').AsInteger := Self.FUMMatriculaTurmaNovo.AnoSemestre;
   Self.FQyCriaMatriculaTurma.ParamByName('turma').AsString := Self.FUMMatriculaTurmaNovo.CodTurma;
   Self.FQyCriaMatriculaTurma.ParamByName('codigoaluno').AsInteger := Self.FUMMatriculaTurmaNovo.CodAluno;
   Self.FQyCriaMatriculaTurma.ParamByName('curso').AsString := Self.FUMMatriculaTurmaNovo.CodCurso;
   Self.FQyCriaMatriculaTurma.ParamByName('usuario').AsString := DM.sLogin;
   // Se selecionou a opção - Manter valores financeiros atuais, o código do plano vem zerado, então, manter o plano atual
   if Self.FUMMatriculaTurmaNovo.PlanoPagamento.Codigo = 0 then begin
     Self.FQyCriaMatriculaTurma.ParamByName('planopagamento').AsInteger := Self.FUMMatriculaTurmaAtual.PlanoPagamento.Codigo;
   end else begin
     Self.FQyCriaMatriculaTurma.ParamByName('planopagamento').AsInteger := Self.FUMMatriculaTurmaNovo.PlanoPagamento.Codigo;
   end;
   Self.FQyCriaMatriculaTurma.ParamByName('situacao').AsInteger := umatriculas.frmMatriculas.tblMatriculasSituacao.AsInteger;
   Self.FQyCriaMatriculaTurma.ParamByName('cd_ingresso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.FormaIngresso.Codigo;
   Self.FQyCriaMatriculaTurma.ParamByName('cd_matricula_curso').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo;
   Self.FQyCriaMatriculaTurma.ParamByName('cd_turma_anterior').AsString := Self.FUMMatriculaTurmaAtual.CodTurma;
   try
      Self.FQyCriaMatriculaTurma.ExecSQL;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_INSERIR_MATRICULA_TURMA, [E.Message]);
   end;
end;

procedure TUMTransferenciaCurso.DesativaFichaIndividual;
begin
   Self.FQyDesativaFichaIndividual.ParamByName('codigoaluno').AsInteger := Self.FUMMatriculaTurmaAtual.CodAluno;
   Self.FQyDesativaFichaIndividual.ParamByName('anosemestre').AsInteger := Self.FUMMatriculaTurmaAtual.AnoSemestre;
   Self.FQyDesativaFichaIndividual.ParamByName('turma').AsString := Self.FUMMatriculaTurmaAtual.CodTurma;
   Self.FQyDesativaFichaIndividual.ParamByName('situacao').AsInteger := 8;
   try
      Self.FQyDesativaFichaIndividual.ExecSQL;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_DESATIVA_FICHAINDIVIDUAL, [E.Message]);
   end;
end;

procedure TUMTransferenciaCurso.DesativaMatricula;
begin
   try
      Self.DesativaMatriculaCurso;
      Self.DesativaMatriculaTurma;
      Self.DesativaFichaIndividual;
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

procedure TUMTransferenciaCurso.DesativaMatriculaCurso;
begin
   Self.FQyDesativaMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := Self.FUMMatriculaTurmaAtual.MatriculaCurso.Codigo;
   Self.FQyDesativaMatriculaCurso.ParamByName('cd_situacao').AsString := DM.variavel_parametro('transferencia.curso.situacao');
   try
      Self.FQyDesativaMatriculaCurso.ExecSQL;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_DESATIVA_MATRICULA_CURSO, [E.Message]);
   end;
end;

procedure TUMTransferenciaCurso.DesativaMatriculaTurma;
var
   arrDistrato: ClasseRegistros;
   strAux3: String;
   sCodigosTitulosJaCancelados : String;
begin
   sCodigosTitulosJaCancelados := ClassePlanosPagamento.getDistratoTitulosCancelados(
            Self.FUMMatriculaTurmaAtual.AnoSemestre, Self.FUMMatriculaTurmaAtual.CodCurso,
            Self.FUMMatriculaTurmaAtual.CodTurma, Self.FUMMatriculaTurmaAtual.CodAluno);

   Self.FQyDesativaMatriculaTurma.ParamByName('codigoaluno').AsInteger := Self.FUMMatriculaTurmaAtual.CodAluno;
   Self.FQyDesativaMatriculaTurma.ParamByName('anosemestre').AsInteger := Self.FUMMatriculaTurmaAtual.AnoSemestre;
   Self.FQyDesativaMatriculaTurma.ParamByName('curso').AsString := Self.FUMMatriculaTurmaAtual.CodCurso;
   Self.FQyDesativaMatriculaTurma.ParamByName('turma').AsString := Self.FUMMatriculaTurmaAtual.CodTurma;
   Self.FQyDesativaMatriculaTurma.ParamByName('situacao').AsInteger := 8;
   try
      Self.FQyDesativaMatriculaTurma.ExecSQL;

      if ClassePlanosPagamento.hasDistratoContratual(
            Self.FUMMatriculaTurmaAtual.AnoSemestre, Self.FUMMatriculaTurmaAtual.CodCurso,
            Self.FUMMatriculaTurmaAtual.CodTurma, Self.FUMMatriculaTurmaAtual.CodAluno, 8 ) then
      begin
         ClassePlanosPagamento.GeraMensalidadeDistratoContratual(
                                 Self.FUMMatriculaTurmaAtual.AnoSemestre, Self.FUMMatriculaTurmaAtual.CodCurso,
                                 Self.FUMMatriculaTurmaAtual.CodTurma, Self.FUMMatriculaTurmaAtual.CodAluno, sCodigosTitulosJaCancelados );
      end;
   except
      on E: EDatabaseError do
         raise EUMTransferenciaError.CreateFmt(MSG_ERRO_DESATIVA_MATRICULA_TURMA, [E.Message]);
   end;
end;

destructor TUMTransferenciaCurso.Destroy;
begin
   FreeAndNil(Self.FUMGeradorFinanceiro);
   FreeAndNil(Self.FUMMatriculaTurmaAtual);
   FreeAndNil(Self.FUMMatriculaTurmaNovo);
   FreeAndNil(Self.FQyDesativaMatriculaCurso);
   FreeAndNil(Self.FQyDesativaMatriculaTurma);
   FreeAndNil(Self.FQyDesativaFichaIndividual);
   FreeAndNil(Self.FQyCriaMatriculaCurso);
   FreeAndNil(Self.FQyCriaMatriculaTurma);
   FreeAndNil(Self.FQyCriaFichaIndividual);
   inherited;
end;

procedure TUMTransferenciaCurso.GeraFinanceiro;
begin
   try
      Self.FUMGeradorFinanceiro.GeraFinanceiro(Self.FUMMatriculaTurmaNovo, Self.FUMMatriculaTurmaAtual);
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

procedure TUMTransferenciaCurso.ProcessaTransferencia(
  const AUMFinanceiroTipoAjuste: TUMFinanceiroTipoAjuste);
var
   LSChave, LSFinModo: string;
   matriculaCursoExiste,matriculaExiste : Boolean;
   msgLog : String;
begin
   try

      erroTransferencia := False;
      
      matriculaCursoExiste := Self.verificaMatriculaCursoExistente();
      if(matriculaCursoExiste) then
      begin
         Self.AtivaMatriculaCurso;
      end else begin
         Self.CriaMatriculaCurso;
      end;

      if (erroTransferencia = True) then
      begin
         Exit;
      end;

      Self.DesativaMatricula;

      matriculaExiste := Self.verificaMatriculaExistente();
      if(matriculaExiste) then
      begin
         Self.AtivaMatricula;
      end else begin
         Self.CriaMatricula;
      end;

      case AUMFinanceiroTipoAjuste of
         ftaManterValores:
         begin
            Self.AtualizaTurmaParcelas;
            LSFinModo := LOG_FIN_ALTERA_TURMA;
         end;
         ftaGerarNovo:
         begin
            Self.GeraFinanceiro;
            LSFinModo := LOG_FIN_GERACAO;
            //DM.Ativar_Matricula(Self.FUMMatriculaTurmaNovo.CodAluno, Self.FUMMatriculaTurmaNovo.CodTurma, Self.FUMMatriculaTurmaNovo.AnoSemestre, true, true );
         end;
         ftaAjustarCreditos:
         begin
            Self.ReajustaFinanceiro;
            LSFinModo := LOG_FIN_REAJUSTE;
         end;
      end;
      LSChave :=
         Format('%d;%d;%d;%d',
            [Self.FUMMatriculaTurmaAtual.CodAluno,
             Self.FUMMatriculaTurmaAtual.AnoSemestre,
             Self.FUMMatriculaTurmaAtual.MatriculaCurso.Codigo,
             Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo
            ]
         );

      msgLog := Format(LOG_TRANSFERENCIA_CURSO,
         [Self.FUMMatriculaTurmaAtual.MatriculaCurso.Codigo,
          Self.FUMMatriculaTurmaAtual.CodAluno,
          Self.FUMMatriculaTurmaAtual.AnoSemestre,
          Self.FUMMatriculaTurmaAtual.CodCurso,
          Self.FUMMatriculaTurmaAtual.CodTurma,
          Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo,
          Self.FUMMatriculaTurmaNovo.CodAluno,
          Self.FUMMatriculaTurmaNovo.AnoSemestre,
          Self.FUMMatriculaTurmaNovo.CodCurso,
          Self.FUMMatriculaTurmaNovo.CodTurma,
          LSFinModo
         ]
      );

      if(matriculaCursoExiste) then
      begin
         msgLog := msgLog + #13 + #9 + 'Já existia uma matrícula curso para a nova matrícula, reativamos então a mesma.';

         if(matriculaExiste) then
         begin
            msgLog := msgLog + #13 + #9 + 'Já existia uma matrícula na turma destino para a nova matrícula, reativamos então a mesma.';
         end;
      end;

      TUMTransferenciaLog.RegistraLog(
         DM.iCdPessoaLogado, CODIGO_MODULO, 0, 'Alteracao', LSChave, msgLog
      );
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

procedure TUMTransferenciaCurso.ReajustaFinanceiro;
begin
   try
      Self.FUMGeradorFinanceiro.ReajustaFinanceiro(Self.FUMMatriculaTurmaAtual, Self.FUMMatriculaTurmaNovo);
   except
      on E: EUMTransferenciaError do raise;
   end;
end;

function TUMTransferenciaCurso.verificaMatriculaCursoExistente: Boolean;
const
   SQL_VERIFICA =
      ' SELECT cd_matricula_curso FROM matriculas_curso ' +
      ' WHERE cd_pessoa = :pessoa AND cd_curso = :curso AND nr_anosem_ingresso = :anosem ';
var
   qryVerifica : TUMZQuery;
   retorno : Integer;
begin
   DM.CriarConsulta(qryVerifica);

   qryVerifica.SQL.Text := SQL_VERIFICA;
   qryVerifica.ParamByName('pessoa').AsInteger := Self.FUMMatriculaTurmaNovo.CodAluno;
   qryVerifica.ParamByName('curso').AsString := Self.FUMMatriculaTurmaNovo.MatriculaCurso.CodCurso;
   qryVerifica.ParamByName('anosem').AsInteger := Self.FUMMatriculaTurmaNovo.MatriculaCurso.AnoSemIngresso;

   qryVerifica.Open;

   result :=  not(qryVerifica.FieldByName('cd_matricula_curso').IsNull);

   if (result = true) then
   begin
      Self.FUMMatriculaTurmaNovo.MatriculaCurso.Codigo := qryVerifica.FieldByName('cd_matricula_curso').AsInteger;
   end;

   qryVerifica.Free;
end;

function TUMTransferenciaCurso.verificaMatriculaExistente: Boolean;
const
   SQL_VERIFICA =
      ' SELECT codigoaluno FROM matriculas ' +
      ' WHERE codigoaluno = :pessoa AND curso = :curso AND anosemestre = :anosem AND turma = :turma ';
var
   qryVerifica : TUMZQuery;
   retorno : Integer;
begin
   DM.CriarConsulta(qryVerifica);

   qryVerifica.SQL.Text := SQL_VERIFICA;
   qryVerifica.ParamByName('pessoa').AsInteger := Self.FUMMatriculaTurmaNovo.CodAluno;
   qryVerifica.ParamByName('curso').AsString := Self.FUMMatriculaTurmaNovo.MatriculaCurso.CodCurso;
   qryVerifica.ParamByName('anosem').AsInteger := Self.FUMMatriculaTurmaNovo.AnoSemestre;
   qryVerifica.ParamByName('turma').AsString := Self.FUMMatriculaTurmaNovo.CodTurma;

   qryVerifica.Open;

   result := not(qryVerifica.FieldByName('codigoaluno').IsNull);

   qryVerifica.Free;
end;

end.


