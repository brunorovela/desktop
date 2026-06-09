unit uUrania;

interface

uses
   XMLDoc, XMLIntf, Classes, SysUtils, Variants, ActiveX, Contnrs, DB, ZConnection,
   uDM, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

const
   // XML erros
   errImportacao = 'Ocorreu um erro durante o processo de importação:' + #13;
   errCampoNulo = errImportacao + 'O campo [%s] no registro de [%s] não pode ser NULO';
   errLeituraHorario = errImportacao + 'Ocorreu um erro na leitura dos horários durante o processo de importação:' + #13 + '[%s]';
   errArqInexistente = errImportacao + 'O arquivo de XML não foi encontrado: [%s]';
   errArqInvalido = errImportacao + 'Este não é um arquivo Urânia válido: [%s]';
   // DB erros
   errBuscaDisciplinas = 'Ocorreu um erro na tentativa de resgatar os dados das disciplinas no UNIMESTRE:' + #13 + '[%s]';
   errBuscaGrades = 'Ocorreu um erro na tentativa de resgatar os dados das grades no UNIMESTRE:' + #13 + '[%s]';
   errBuscaProfessores = 'Ocorreu um erro na tentativa de resgatar os dados dos professores no UNIMESTRE:' + #13 + '[%s]';
   errBuscaTurmas = 'Ocorreu um erro na tentativa de resgatar os dados das turmas no UNIMESTRE:' + #13 + '[%s]';
   errInsereHorario = 'Ocorreu um erro na tentativa de incluir um novo horário:' + #13 + '[%s]';
   errProcuraTurmaProfessor = 'Ocorreu um erro na tentativa de procurar turma/professor/disciplina:' + #13 + '[%s]';

type
   { Esta enumeração lista os dias da semana que podem haver aulas segundo o
     Urânia. São eles:
     dsDomingo: Domingo
     dsSegunda: Segunda-feira
     dsTerca: Terça-feira
     dsQuarta: Quarta-feira
     dsQuinta: Quinta-feira
     dsSexta: Sexta-feira
     dsSabado: Sábado
   }
   TUMUraniaDiaSemana = (dsDomingo, dsSegunda, dsTerca, dsQuarta, dsQuinta,
      dsSexta, dsSabado);

   { Esta enumeração lista os turnos cadastrados no UNIMESTRE. Eis:
     tMatutino: Matutino
     tVespertino: Vespertino
     tNoturno: Noturno
     tMisto: Misto
   }
   TUMUraniaTurnos = (tMatutino, tVespertino, tNoturno, tMisto);

   { Esta enumeração contém os tipos de ação válidas para integração do
     UNIMESTRE com o sistema Urânia.
     taImportacao: importação dos dados do Urânia para o UNIMESTRE
     taExportacao: exportação dos dados do UNIMESTRE para o Urânia
   }
   TUMUraniaTipoAcao = (taImportacao, taExportacao);

   { Conjunto de dias da semana. Ao exportar uma turma para o Urânia, a tag
     "DIAS" pode conter um conjunto de dias da semana.
   }
   TUMSetUraniaDiaSemana = set of TUMUraniaDiaSemana;

   { Conjunto de turnos. Ao exportar uma turma para o Urânia, a tag "TURNO" pode
     conter um conjunto de turnos. O conjunto não pode ser composto pelo turno
     misto (tMisto).
   }
   TUMSetUraniaTurnos = set of TUMUraniaTurnos;

   { Esta classe é um extensão da classe de erro padrão. É usada para gerar
     exceções decorrentes da leitura e escrita de arquivos XML Urânia.
   }
   EUMUraniaXMLError = class(Exception);

   { Esta classe é uma extensão da classe de erro padrão. É usada para gerar
     exceções decorrentes da execução de comandos de consulta e escrita no banco
     de dados do UNIMESTRE. 
   }
   EUMUraniaDBError = class(Exception);

   { Esta classe encapsula as informações referentes à uma disciplinas do
     UNIMESTRE. Tais informações são suficientes para exportar a disciplina
     para o sistema Urânia.
   }
   TUMUraniaDisciplina = class(TObject)
   strict private
      FICodigo: integer;
      FSNome: string;
      FSSigla: string;
   private
      constructor Create(const AICodigo: integer); overload;
      constructor Create(const AICodigo: integer; const ASNome, ASSigla: string);
         overload;
      destructor Destroy; override;
      property Codigo: integer read FICodigo;
      property Nome: string read FSNome;
      property Abreviatura: string read FSSigla;
   end;

   { Esta classe armazena as informações referentes a uma turma cadastrada no
     UNIMESTRE. Estas informações serão usadas para exportar turmas do UNIMESTRE
     para o sistema Urânia.
   }
   TUMUraniaTurma = class(TObject)
   strict protected
      FSCodigo: string;
      FSNome: string;
      FSSigla: string;
      FIAulas: integer;
      FTurnos: TUMSetUraniaTurnos;
      FDiasSemana: TUMSetUraniaDiaSemana;
   private
      constructor Create(const ASCodigo: string); overload;
      constructor Create(const ASCodigo, ASNome, ASSigla: string;
         const AIAulas: integer); overload;
      destructor Destroy; override;
      function GetTurnoUrania: string;
      function GetDiasSemanaUrania: string;
      procedure AdicionaTurno(const ACTurno: Char);
      procedure AdicionaDiaSemana(const AIDiaSemana: integer);
      property Codigo: string read FSCodigo;
      property Nome: string read FSNome;
      property Sigla: string read FSSigla;
      property Aulas: integer read FIAulas;
      property Turnos: TUMSetUraniaTurnos read FTurnos;
      property Dias: TUMSetUraniaDiaSemana read FDiasSemana;
   end;

   { Esta classe armazena as informações referentes a um professor no sistema
     UNIMESTRE. As informações encapsuladas nesta classe são utilizadas para
     efetuar a exportação dos dados para o sistema Urânia através de arquivos
     XML. 
   }
   TUMUraniaProfessor = class(TObject)
   strict private
      FICodigo: integer;
      FSNome: string;
      FSAlcunha: string;
   private
      constructor Create(const AICodigo: integer); overload;
      constructor Create(const AICodigo: integer;
         const ASNome, ASAlcunha: string); overload;
      destructor Destroy; override;
      property Codigo: integer read FICodigo;
      property Nome: string read FSNome write FSNome;
      property Alcunha: string read FSAlcunha write FSAlcunha;
   end;

   { Esta classe armazenas informações referentes à grades de horários do
     UNIMESTRE. A grade é composta por uma turma, uma disciplina, um professor
     e a quantidade de aulas na semana. Tais informações são exportadas através
     de arquivos XML para o sistema Urânia.
   }
   TUMUraniaGrade = class(TObject)
   strict private
      FUMUraniaTurma: TUMUraniaTurma;
      FUMUraniaDisciplina: TUMUraniaDisciplina;
      FUMUraniaProfessor: TUMUraniaProfessor;
      FIAulas: integer;
   private
      constructor Create(const AUMUraniaTurma: TUMUraniaTurma;
         const AUMUraniaDisciplina: TUMUraniaDisciplina;
         const AUMUraniaProfessor: TUMUraniaProfessor; const AIAulas: integer);
      destructor Destroy; override;
      property UraniaTurma: TUMUraniaTurma read FUMUraniaTurma
         write FUMUraniaTurma;
      property UraniaDisciplina: TUMUraniaDisciplina read FUMUraniaDisciplina
         write FUMUraniaDisciplina;
      property UraniaProfessor: TUMUraniaProfessor read FUMUraniaProfessor
         write FUMUraniaProfessor;
      property Aulas: integer read FIAulas write FIAulas;
   end;

   { Esta classe armazena as informações referentes a um horário importado do
     sistema Urânia. O horário é composto por uma turma (código), um ambiente
     (não obrigatório), uma dia da semana, um horário, um professor (código),
     uma disciplina (código) e o tipo da disciplina (não obrigatório). Essas
     informações são importadas do arquivo XML fornecido pelo Urânia.
   }
   TUMUraniaHorario = class(TObject)
   strict protected
      FSCodTurma: string;
      FSAmbiente: string;
      FSTipoDisciplina: string;
      FIHorario: integer;
      FICodProfessor: integer;
      FICodDisciplina: integer;
      FDiaSemana: TUMUraniaDiaSemana;
      function GetDiaSemana: integer;
      procedure SetCodTurma(const AVCodTurma: OleVariant);
      procedure SetAmbiente(const AVAmbiente: OleVariant);
      procedure SetTipoDisciplina(const AVTipoDisciplina: OleVariant);
      procedure SetHorario(const AVHorario: OleVariant);
      procedure SetCodProfessor(const AVCodProfessor: OleVariant);
      procedure SetCodDisciplina(const AVCodDisciplina: OleVariant);
      procedure SetDiaSemana(const AVDiaSemana: OleVariant);
      function IsCodigoCurso(const ASCodDisciplina: String): Boolean;
      function GetCodigoFromCodigoCurso(const ASCodDisciplina: String): Integer;
   protected
      destructor Destroy; override;
      property Ambiente: string read FSAmbiente write FSAmbiente;
      property TipoDisciplina: string read FSTipoDisciplina write FSTipoDisciplina;
   public
      constructor Create(const AVCodTurma, AVAmbiente, AVTipoDisciplina, AVHorario,
         AVCodProfessor, AVCodDisciplina, AVDiaSemana: OleVariant); overload;
      constructor Create; overload;
      property CodTurma: string read FSCodTurma write FSCodTurma;
      property Horario: integer read FIHorario write FIHorario;
      property CodProfessor: integer read FICodProfessor write FICodProfessor;
      property CodDisciplina: integer read FICodDisciplina write FICodDisciplina;
      property DiaSemana: TUMUraniaDiaSemana read FDiaSemana write FDiaSemana;
      property DiaSemanaUM: integer read GetDiaSemana;
   end;

   { Esta classe encapsula os métodos necessários para inclusão dos horários
     importados do sistema Urânia na base de dados do UNIMESTRE.
   }
   TUMUraniaImportacaoDB = class(TObject)
   strict private
      FQyHorario: TUMZQuery;
      FQyProcuraTurmaProfessor: TUMZQuery;
      FOlHorariosErrados: TObjectList;
      function IsBemSucedido: boolean;
      function ProcuraTurmaProfessor(const AIAnoSemestre, AICodDisciplina,
         AICodProfessor: integer; const ASCodTurma: string): boolean;
      function GetHorarioErrado(const AIndice: integer): TUMUraniaHorario;
      function GetHorarioErradoCount: integer;
   private
      constructor Create;
      destructor Destroy; override;
      procedure InsereHorario(const AIAnoSemestre, AICodHorario, AIDiaSemana,
         AICodDisciplina, AICodProfessor: integer; const ASCodTurma,
         ASCategoria: string; const AUMUraniaHorario: TUMUraniaHorario);
      property BemSucedido: boolean read IsBemSucedido;
   public
      property HorariosErrados[const I: integer]: TUMUraniaHorario read GetHorarioErrado;
      property HorariosErradosCount: integer read GetHorarioErradoCount;
   end;

   { Declaração antecipada da classe TUMUraniaExportacao }
   TUMUraniaExportacao = class;

   { Esta classe encapsula os métodos necessários para consulta das informações
     necessárias do sistema UNIMESTRE para exportação para o sistema Urânia,
     através de arquivos XML. 
   }
   TUMUraniaExportacaoDB = class(TObject)
   strict private
      FQyDisciplinas: TUMZQuery;
      FQyTurmas: TUMZQuery;
      FQyProfessores: TUMZQuery;
      FQyGrades: TUMZQuery;
   private
      constructor Create;
      destructor Destroy; override;
      procedure GetDisciplinas(AUMUraniaExportacao: TUMUraniaExportacao);
      procedure GetTurmas(AUMUraniaExportacao: TUMUraniaExportacao);
      procedure GetProfessores(AUMUraniaExportacao: TUMUraniaExportacao);
      procedure GetGrades(AUMUraniaExportacao: TUMUraniaExportacao);
   end;

   { Esta classe encapsula as informações importadas do sistema Urânia. Essas
     informações são lidas posteriormente para integração com o UNIMESTRE.
   }
   TUMUraniaImportacao = class(TObject)
   strict private
      FIAnoSemestre: integer;
      FSCategoria: string;
      FSCodigoEscola: string;
      FSNomeTurno: string;
      FICodigoTurno: integer;
      FOlHorarios: TObjectList;
      FUMUraniaImportacaoDB: TUMUraniaImportacaoDB;
      procedure SetCodigoEscola(const AVCodigoEscola: OleVariant);
      procedure SetNomeTurno(const AVNomeTurno: OleVariant);
      procedure SetCodigoTurno(const AVCodigoTurno: OleVariant);
      function GetHorarioCount: integer;
      function GetHorario(const AIndice: integer): TUMUraniaHorario;
   private
      constructor Create; overload;
      constructor Create(const AVCodigoEscola, AVNomeTurno, AVCodigoTurno: OleVariant;
         const AIAnoSemestre: integer; const ASCategoria: string); overload;
      destructor Destroy; override;
      function Executa: boolean; overload;
      procedure AdicionaHorario(const AUMUraniaHorario: TUMUraniaHorario); overload;
      procedure AdicionaHorario(const AVCodTurma, AVAmbiente, AVTipoDisciplina, AVHorario,
         AVCodProfessor, AVCodDisciplina, AVDiaSemana: OleVariant); overload;
   public
      function Executa(const AOlHorarios: TObjectList): boolean; overload;
      property AnoSemestre: integer read FIAnoSemestre;
      property Categoria: string read FSCategoria;
      property UraniaImportacaoDB: TUMUraniaImportacaoDB read FUMUraniaImportacaoDB;
      property HorarioCount: integer read GetHorarioCount;
      property Horarios[const I: integer]: TUMUraniaHorario read GetHorario;
   end;

   { Esta classe é responsável por resgatar as informações de disciplinas,
     professores, turmas e grades do UNIMESTRE para posteriormente exportar para
     o sistema Urânia.
   }
   TUMUraniaExportacao = class(TObject)
   strict private
      FIAnoSemestre: integer;
      FOlDisciplinas: TObjectList;
      FOlProfessores: TObjectList;
      FOlTurmas: TObjectList;
      FOlGrades: TObjectList;
      FUMUraniaExportacaoDB: TUMUraniaExportacaoDB;
      function GetTurma(const ASCodTurma: string): TUMUraniaTurma;
      function GetDisciplina(const AICodDisciplina: integer): TUMUraniaDisciplina;
      function GetProfessor(const AICodProfessor: integer): TUMUraniaProfessor;
   private
      constructor Create(const AIAnoSemestre: integer);
      destructor Destroy; override;
      procedure Executa;
      procedure AdicionaDisciplina(const AUMUraniaDisciplina: TUMUraniaDisciplina); overload;
      procedure AdicionaDisciplina(const AICodigo: integer;
         const ASNome, ASSigla: string); overload;
      procedure AdicionaTurma(const AUMUraniaTurma: TUMUraniaTurma); overload;
      procedure AdicionaTurma(const ASCodigo, ASNome, ASSigla: string;
         const AIAulas: integer); overload;
      procedure AdicionaProfessor(AUMUraniaProfessor: TUMUraniaProfessor); overload;
      procedure AdicionaProfessor(const AICodigo: integer;
         const ASNome, ASAlcunha: string); overload;
      procedure AdicionaGrade(const AUMUraniaTurma: TUMUraniaTurma;
         const AUMUraniaDisciplina: TUMUraniaDisciplina;
         const AUMUraniaProfessor: TUMUraniaProfessor; const AIAulas: integer); overload;
      procedure AdicionaGrade(const ASCodTurma: string;
         const AICodDisciplina, AICodProfessor, AIAulas: integer); overload;
      property AnoSemestre: integer read FIAnoSemestre;
   end;

   { Esta classe é uma extensão da class TXMLDocument. É responsável por efetuar
     e escrita de arquivos XML do sistema Urânia, usados para importação e
     exportação de informações de grades de horários.
   }
   TUMUraniaXML = class(TXMLDocument)
   strict private
      FIAnoSemestre: integer;
      FSCaminhoXML: string;
      FSCategoria: string;
      FUMTipoAcao: TUMUraniaTipoAcao;
      FUMUraniaImportacao: TUMUraniaImportacao;
      FUMUraniaExportacao: TUMUraniaExportacao;
      function ExecutaImportacao: boolean;
      procedure ExecutaExportacao;
      procedure CarregaImportacao;
      procedure CarregaHorarios;
      procedure SetTipoAcao;
   public
      constructor Create(const AIAnoSemestre: Integer; const ASCategoria: string;
         AOwner: TComponent);
      destructor Destroy; override;
      procedure CarregaXML(const ASCaminho: string);
      procedure SalvaXML(const ASCaminho: string); overload;
      procedure SalvaXML; overload;
      function Executa: boolean;
      property UraniaImportacao: TUMUraniaImportacao read FUMUraniaImportacao;
   end;

implementation

const
   SQL_GET_DISCIPLINAS =
      'SELECT codigo, descricao, sigla FROM disciplinas ORDER BY codigo';

   SQL_GET_TURMAS =
      'SELECT codigo, descricao, turno FROM turmas WHERE anosemestre = :anosemestre';

   SQL_GET_PROFESSORES =
      'SELECT '+
         'p.cd_pessoa, p.nm_pessoa, r.nm_apelido '+
      'FROM '+
         'professores r '+
            'JOIN pessoas p ON (r.cd_pessoa = p.cd_pessoa) '+
               'JOIN turmasprofessores tp ON (p.cd_pessoa = tp.professor) '+
      'WHERE '+
         'r.sn_professor = "S" AND '+
         'tp.anosemestre = :anosemestre';

   SQL_GET_GRADES =
      'SELECT '+
         'tp.turma, tp.disciplina, tp.professor, g.nr_creditos_academicos '+
      'FROM '+
         'turmasprofessores tp '+
            'JOIN turmas t ON '+
               '(tp.anosemestre = t.anosemestre) AND '+
               '(tp.turma = t.codigo)'+
            'JOIN gradecurricular g ON'+
               '(tp.anosemestre = g.anosemestre) AND '+
               '(tp.curso = g.curso) AND '+
               '(tp.disciplina = g.disciplina) AND '+
               '(t.serie = g.serie) AND '+
               '(t.turno = g.turno)'+
      'WHERE '+
         'tp.anosemestre = :anosemestre';

   SQL_INSERE_HORARIO =
      'INSERT INTO turmas_horarios_config'+
         '(nr_anosemestre, cd_turma, cd_horario, nr_dia_semana, cd_disciplina, cd_professor, cd_turma_base, dt_inicial, dt_final, sn_ativo)'+
      'VALUES'+
         '(:anosemestre, :turma,'+
            '(SELECT codigo FROM horarios WHERE cd_horario_urania = :cd_horario AND ds_categoria = :ds_categoria),'+
         ':dia_semana, (SELECT codigo FROM disciplinas WHERE id_disciplina = :disciplina), :cd_professor, :turma, NULL, NULL, 1) ' +
      'ON DUPLICATE KEY UPDATE dt_inicial=VALUES(dt_inicial), dt_final=VALUES(dt_final), sn_ativo=VALUES(sn_ativo)';

   SQL_PROCURA_TURMA_PROFESSOR =
      'SELECT cd_turmaprofessor '+
      'FROM '+
         'turmasprofessores '+
      'WHERE '+
         'anosemestre = :anosemestre AND '+
         'turma = :turma AND '+
         'disciplina = (SELECT codigo FROM disciplinas WHERE id_disciplina = :disciplina) AND '+
         'professor = :professor';

   SQL_PROCURA_TURMA_PROFESSOR_COD =
      'SELECT cd_turmaprofessor '+
      'FROM '+
         'turmasprofessores '+
      'WHERE '+
         'anosemestre = :anosemestre AND '+
         'turma = :turma AND '+
         'disciplina = :disciplina AND '+
         'professor = :professor';

   SQL_INSERE_HORARIO_COD =
      'INSERT INTO turmas_horarios_config'+
         '(nr_anosemestre, cd_turma, cd_horario, nr_dia_semana, cd_disciplina, cd_professor, cd_turma_base, dt_inicial, dt_final, sn_ativo)'+
      'VALUES'+
         '(:anosemestre, :turma,'+
            '(SELECT codigo FROM horarios WHERE cd_horario_urania = :cd_horario AND ds_categoria = :ds_categoria),'+
         ':dia_semana, :disciplina, :cd_professor, :turma, NULL, NULL, 1) ' +
      'ON DUPLICATE KEY UPDATE dt_inicial=VALUES(dt_inicial), dt_final=VALUES(dt_final), sn_ativo=VALUES(sn_ativo)';

{ TUMUraniaDisciplina }

constructor TUMUraniaDisciplina.Create(const AICodigo: integer;
   const ASNome, ASSigla: string);
begin
   Self.FICodigo := AICodigo;
   Self.FSNome := ASNome;
   Self.FSSigla := ASSigla;
end;

constructor TUMUraniaDisciplina.Create(const AICodigo: integer);
begin
   Self.FICodigo := AICodigo;
end;

destructor TUMUraniaDisciplina.Destroy;
begin
   inherited;
end;

{ TUMUraniaTurma }

{ Adiciona um dia da semana ao conjunto de dias da semana nos quais a turma
  tem aula.
}
procedure TUMUraniaTurma.AdicionaDiaSemana(const AIDiaSemana: integer);
begin
   case AIDiaSemana of
      1: Self.FDiasSemana := Self.FDiasSemana + [dsDomingo];
      2: Self.FDiasSemana := Self.FDiasSemana + [dsSegunda];
      3: Self.FDiasSemana := Self.FDiasSemana + [dsTerca];
      4: Self.FDiasSemana := Self.FDiasSemana + [dsQuarta];
      5: Self.FDiasSemana := Self.FDiasSemana + [dsQuinta];
      6: Self.FDiasSemana := Self.FDiasSemana + [dsSexta];
      7: Self.FDiasSemana := Self.FDiasSemana + [dsSabado];
   end;
end;

{ Adiciona um turno ao conjunto de turnos da turma.
}
procedure TUMUraniaTurma.AdicionaTurno(const ACTurno: Char);
begin
   case Ord(ACTurno) of
      Ord('M'): Self.FTurnos := Self.FTurnos + [tMatutino];
      Ord('N'): Self.FTurnos := Self.FTurnos + [tNoturno];
      Ord('S'): Self.FTurnos := Self.FTurnos + [tMisto];
      Ord('V'): Self.FTurnos := Self.FTurnos + [tVespertino];    
   end;
end;

constructor TUMUraniaTurma.Create(const ASCodigo: string);
begin
   Self.FSCodigo := ASCodigo;
end;

constructor TUMUraniaTurma.Create(const ASCodigo, ASNome, ASSigla: string;
  const AIAulas: integer);
begin
   Self.FSCodigo := ASCodigo;
   Self.FSNome := ASNome;
   Self.FSSigla := ASSigla;
   Self.FIAulas := AIAulas;
end;

destructor TUMUraniaTurma.Destroy;
begin
   inherited;
end;

{ Verifica os dias da semana que a turma possui aula e retorna o código Urânia
  equivalente. Os dias da semana são representados no Urânia da seguinte forma:
  2: segunda-feira
  3: terça-feira
  4: quarta-feira
  5: quinta-feira
  6: sexta-feira
  S: sábado
  D: domingo
  Para informar um conjunto desses dias basta concatenar os valores. O valor
  246S indica que a turma tem aula na segunda(2), quarta(4), sexta(6) e no
  sábado(S).
}
function TUMUraniaTurma.GetDiasSemanaUrania: string;
const
   DiaSemanaToUrania: array[TUMUraniaDiaSemana] of Char =
      ('D', '2', '3', '4', '5', '6', 'S');
begin
   Result := '';
   if dsSegunda in Self.FDiasSemana then
      Result := DiaSemanaToUrania[dsSegunda];
   if dsTerca in Self.FDiasSemana then
      Result := Result + DiaSemanaToUrania[dsTerca];
   if dsQuarta in Self.FDiasSemana then
      Result := Result + DiaSemanaToUrania[dsQuarta];
   if dsQuinta in Self.FDiasSemana then
      Result := Result + DiaSemanaToUrania[dsQuinta];
   if dsSexta in Self.FDiasSemana then
      Result := Result + DiaSemanaToUrania[dsSexta];
   if dsSabado in Self.FDiasSemana then
      Result := Result + DiaSemanaToUrania[dsSabado];
   if dsDomingo in Self.FDiasSemana then
      Result := Result + DiaSemanaToUrania[dsDomingo];
end;

{ Verifica os turnos do dia nos quais a turma tem aula e retorna uma string no
  formato do Urânia. Os turnos são representados pelo Urânia da seguinte forma:
  M: Matutino
  T: Vespertino (tarde)
  N: Noturno
  Para indicar que a turma tem aula em dois períodos, basta concatenar os
  valores.
}
function TUMUraniaTurma.GetTurnoUrania: string;
const
   TurnoToUrania: array[TUMUraniaTurnos] of string = ('M', 'T', 'N', 'MT');
begin
   Result := '';
   if tMatutino in Self.FTurnos then
      Result := TurnoToUrania[tMatutino];
   if tVespertino in Self.FTurnos then
      Result := Result + TurnoToUrania[tVespertino];
   if tNoturno in Self.FTurnos then
      Result := Result + TurnoToUrania[tNoturno];
   if tMisto in Self.FTurnos then
      Result := TurnoToUrania[tMisto];
end;

{ TUMUraniaProfessor }

constructor TUMUraniaProfessor.Create(const AICodigo: integer; const ASNome,
  ASAlcunha: string);
begin
   Self.FICodigo := AICodigo;
   Self.FSNome := ASNome;
   Self.FSAlcunha := ASAlcunha;
end;

constructor TUMUraniaProfessor.Create(const AICodigo: integer);
begin
   Self.FICodigo := AICodigo;
end;

destructor TUMUraniaProfessor.Destroy;
begin
   inherited;
end;

{ TUMUraniaGrade }

constructor TUMUraniaGrade.Create(const AUMUraniaTurma: TUMUraniaTurma;
  const AUMUraniaDisciplina: TUMUraniaDisciplina;
  const AUMUraniaProfessor: TUMUraniaProfessor; const AIAulas: integer);
begin
   Self.FUMUraniaTurma := AUMUraniaTurma;
   Self.FUMUraniaDisciplina := AUMUraniaDisciplina;
   Self.FUMUraniaProfessor := AUMUraniaProfessor;
   Self.FIAulas := AIAulas;
end;

destructor TUMUraniaGrade.Destroy;
begin
   FreeAndNil(Self.FUMUraniaTurma);
   FreeAndNil(Self.FUMUraniaDisciplina);
   FreeAndNil(Self.FUMUraniaProfessor);
   inherited;
end;

{ TUMUraniaHorario }

constructor TUMUraniaHorario.Create(const AVCodTurma, AVAmbiente,
  AVTipoDisciplina, AVHorario, AVCodProfessor, AVCodDisciplina,
  AVDiaSemana: OleVariant);
begin
   try
      Self.SetCodTurma(AVCodTurma);
      Self.SetHorario(AVHorario);
      Self.SetCodProfessor(AVCodProfessor);
      Self.SetCodDisciplina(AVCodDisciplina);
      Self.SetDiaSemana(AVDiaSemana);
   except
      on EUMUraniaXMLError do raise;
   end;
   Self.SetAmbiente(AVAmbiente);
   Self.SetTipoDisciplina(AVTipoDisciplina);
end;

constructor TUMUraniaHorario.Create;
begin
   //
end;

destructor TUMUraniaHorario.Destroy;
begin
   inherited;
end;

function TUMUraniaHorario.GetCodigoFromCodigoCurso(
  const ASCodDisciplina: String): Integer;
const
   SQL_GET_CODIGO_FROM_CODIGO_CURSO =
      'SELECT codigo FROM disciplinas WHERE CONCAT(codigo, curso) = :codigo';
var
   qyGetCodigoFromCodigoCurso : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyGetCodigoFromCodigoCurso);
   qyGetCodigoFromCodigoCurso.SQL.Text := SQL_GET_CODIGO_FROM_CODIGO_CURSO;
   qyGetCodigoFromCodigoCurso.ParamByName('codigo').AsString := ASCodDisciplina;
   qyGetCodigoFromCodigoCurso.Open();

   Result := -1;
   if qyGetCodigoFromCodigoCurso.RecordCount = 1 then
   begin
      Result := qyGetCodigoFromCodigoCurso.FieldByName('codigo').AsInteger;
   end;

   FreeAndNil(qyGetCodigoFromCodigoCurso);
end;

function TUMUraniaHorario.GetDiaSemana: integer;
begin
   case Self.FDiaSemana of
      dsDomingo: Result := 1;
      dsSegunda: Result := 2;
      dsTerca: Result := 3;
      dsQuarta: Result := 4;
      dsQuinta: Result := 5;
      dsSexta: Result := 6;
      dsSabado: Result := 7;
   end;
end;

function TUMUraniaHorario.IsCodigoCurso(const ASCodDisciplina: String): Boolean;
begin
   Result := GetCodigoFromCodigoCurso(ASCodDisciplina) <> -1;
end;

procedure TUMUraniaHorario.SetAmbiente(const AVAmbiente: OleVariant);
begin
   if AVAmbiente <> Null then
      Self.FSAmbiente := AVAmbiente;
end;

procedure TUMUraniaHorario.SetCodDisciplina(const AVCodDisciplina: OleVariant);
begin
   if AVCodDisciplina = Null then
      raise EUMUraniaXMLError.CreateFmt(errCampoNulo, ['CODDISC', 'HORARIO'])
   else if IsNumericStr(AVCodDisciplina) then
      Self.FICodDisciplina := AVCodDisciplina
   else if IsCodigoCurso(AVCodDisciplina) then
      Self.FICodDisciplina := GetCodigoFromCodigoCurso(AVCodDisciplina)
   else
      Self.FICodDisciplina := -1;
end;

procedure TUMUraniaHorario.SetCodProfessor(const AVCodProfessor: OleVariant);
begin
   if AVCodProfessor = Null then
      raise EUMUraniaXMLError.CreateFmt(errCampoNulo, ['CODPROF', 'HORARIO'])
   else
      Self.FICodProfessor := AVCodProfessor;
end;

procedure TUMUraniaHorario.SetCodTurma(const AVCodTurma: OleVariant);
begin
   if AVCodTurma = Null then
      raise EUMUraniaXMLError.CreateFmt(errCampoNulo, ['CODTURMA', 'HORARIO'])
   else
      Self.FSCodTurma := AVCodTurma;
end;

procedure TUMUraniaHorario.SetDiaSemana(const AVDiaSemana: OleVariant);
var
   LSDiaSemana: string;
begin
   if AVDiaSemana = Null then
      raise EUMUraniaXMLError.CreateFmt(errCampoNulo, ['DIA', 'HORARIO'])
   else
   begin
      LSDiaSemana := AVDiaSemana;
      if LSDiaSemana = 'SEG' then
         Self.FDiaSemana := dsSegunda
      else if LSDiaSemana = 'TER' then
         Self.FDiaSemana := dsTerca
      else if LSDiaSemana = 'QUA' then
         Self.FDiaSemana := dsQuarta
      else if LSDiaSemana = 'QUI' then
         Self.FDiaSemana := dsQuinta
      else if LSDiaSemana = 'SEX' then
         Self.FDiaSemana := dsSexta
      else if LSDiaSemana = 'SAB' then
         Self.FDiaSemana := dsSabado
      else if LSDiaSemana = 'DOM' then
         Self.FDiaSemana := dsDomingo;
   end;
end;

procedure TUMUraniaHorario.SetHorario(const AVHorario: OleVariant);
begin
   if AVHorario = Null then
      raise EUMUraniaXMLError.CreateFmt(errCampoNulo, ['HOR', 'HORARIO'])
   else
      Self.FIHorario := AVHorario;   
end;

procedure TUMUraniaHorario.SetTipoDisciplina(
  const AVTipoDisciplina: OleVariant);
begin
   if AVTipoDisciplina <> Null then
      Self.FSTipoDisciplina := AVTipoDisciplina;
end;

{ TUMUraniaImportacao }

{ Adiciona um horário à lista de horários importados do Urânia.
}
procedure TUMUraniaImportacao.AdicionaHorario(const AVCodTurma, AVAmbiente,
  AVTipoDisciplina, AVHorario, AVCodProfessor, AVCodDisciplina,
  AVDiaSemana: OleVariant);
begin
   Self.FOlHorarios.Add(
      TUMUraniaHorario.Create(AVCodTurma, AVAmbiente, AVTipoDisciplina,
         AVHorario, AVCodProfessor, AVCodDisciplina, AVDiaSemana));
end;

{ Adiciona um horário à lista de horários importador do Urânia.
}
procedure TUMUraniaImportacao.AdicionaHorario(
  const AUMUraniaHorario: TUMUraniaHorario);
begin
   Self.FOlHorarios.Add(AUMUraniaHorario);
end;

constructor TUMUraniaImportacao.Create(const AVCodigoEscola, AVNomeTurno,
   AVCodigoTurno: OleVariant; const AIAnoSemestre: integer;
   const ASCategoria: string);
begin
   Self.Create;
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FSCategoria := ASCategoria;
   try
      Self.SetCodigoEscola(AVCodigoEscola);
   except
      on EUMUraniaXMLError do raise;
   end;
   Self.SetNomeTurno(AVNomeTurno);
   Self.SetCodigoTurno(AVCodigoTurno);
end;

constructor TUMUraniaImportacao.Create;
begin
   Self.FOlHorarios := TObjectList.Create;
   Self.FUMUraniaImportacaoDB := TUMUraniaImportacaoDB.Create;
end;

destructor TUMUraniaImportacao.Destroy;
var
   I: integer;
begin
   for I := Self.GetHorarioCount - 1 downto 0 do
      TUMUraniaHorario(Self.FOlHorarios.Items[I]).Free;
   inherited;
end;

function TUMUraniaImportacao.Executa(const AOlHorarios: TObjectList): boolean;
var
   I: integer;
begin
   for I := 0 to AOlHorarios.Count - 1 do
      Self.FUMUraniaImportacaoDB.InsereHorario(
         Self.FIAnoSemestre,
         TUMUraniaHorario(AOlHorarios.Items[I]).Horario,
         TUMUraniaHorario(AOlHorarios.Items[I]).DiaSemanaUM,
         TUMUraniaHorario(AOlHorarios.Items[I]).CodDisciplina,
         TUMUraniaHorario(AOlHorarios.Items[I]).CodProfessor,
         TUMUraniaHorario(AOlHorarios.Items[I]).CodTurma,
         Self.FSCategoria, TUMUraniaHorario(AOlHorarios.Items[I]));
   Result := Self.FUMUraniaImportacaoDB.BemSucedido;
end;

function TUMUraniaImportacao.Executa: boolean;
var
   I: integer;
begin
   for I := 0 to Self.GetHorarioCount - 1 do
      Self.FUMUraniaImportacaoDB.InsereHorario(
         Self.FIAnoSemestre, Self.GetHorario(I).Horario,
         Self.GetHorario(I).DiaSemanaUM, Self.GetHorario(I).CodDisciplina,
         Self.GetHorario(I).CodProfessor, Self.GetHorario(I).CodTurma,
         Self.FSCategoria, Self.GetHorario(I));
   Result := Self.FUMUraniaImportacaoDB.BemSucedido;
end;

function TUMUraniaImportacao.GetHorario(
  const AIndice: integer): TUMUraniaHorario;
begin
   Result := TUMUraniaHorario(Self.FOlHorarios.Items[AIndice]);
end;

function TUMUraniaImportacao.GetHorarioCount: integer;
begin
   Result := Self.FOlHorarios.Count;
end;

procedure TUMUraniaImportacao.SetCodigoEscola(const AVCodigoEscola: OleVariant);
begin
   if AVCodigoEscola = Null then
      raise EUMUraniaXMLError.CreateFmt(errCampoNulo, ['CODESCOLA', 'IMPORTAÇÃO'])
   else
      Self.FSCodigoEscola := AVCodigoEscola;
end;

procedure TUMUraniaImportacao.SetCodigoTurno(const AVCodigoTurno: OleVariant);
begin
   if AVCodigoTurno <> Null then
      Self.FICodigoTurno := AVCodigoTurno;
end;

procedure TUMUraniaImportacao.SetNomeTurno(const AVNomeTurno: OleVariant);
begin
   if AVNomeTurno <> Null then
      Self.FSNomeTurno := AVNomeTurno;
end;

{ TUMUraniaExportacao }

procedure TUMUraniaExportacao.AdicionaDisciplina(const AICodigo: integer;
  const ASNome, ASSigla: string);
begin
   Self.FOlDisciplinas.Add(TUMUraniaDisciplina.Create(AICodigo, ASNome, ASSigla));
end;

procedure TUMUraniaExportacao.AdicionaGrade(
  const AUMUraniaTurma: TUMUraniaTurma;
  const AUMUraniaDisciplina: TUMUraniaDisciplina;
  const AUMUraniaProfessor: TUMUraniaProfessor; const AIAulas: integer);
begin
   Self.FOlGrades.Add(
      TUMUraniaGrade.Create(AUMUraniaTurma, AUMUraniaDisciplina, AUMUraniaProfessor, AIAulas));
end;

procedure TUMUraniaExportacao.AdicionaGrade(const ASCodTurma: string;
  const AICodDisciplina, AICodProfessor, AIAulas: integer);
begin
   Self.FOlGrades.Add(
      TUMUraniaGrade.Create(Self.GetTurma(ASCodTurma),
         Self.GetDisciplina(AICodDisciplina),
         Self.GetProfessor(AICodProfessor),AIAulas));
end;

procedure TUMUraniaExportacao.AdicionaDisciplina(
  const AUMUraniaDisciplina: TUMUraniaDisciplina);
begin
   Self.FOlDisciplinas.Add(AUMUraniaDisciplina);
end;

procedure TUMUraniaExportacao.AdicionaProfessor(const AICodigo: integer;
  const ASNome, ASAlcunha: string);
begin
   Self.FOlProfessores.Add(TUMUraniaProfessor.Create(AICodigo, ASNome, ASAlcunha));
end;

procedure TUMUraniaExportacao.AdicionaProfessor(
  AUMUraniaProfessor: TUMUraniaProfessor);
begin
   Self.FOlProfessores.Add(AUMUraniaProfessor);
end;

procedure TUMUraniaExportacao.AdicionaTurma(
  const AUMUraniaTurma: TUMUraniaTurma);
begin
   Self.FOlTurmas.Add(AUMUraniaTurma);
end;

procedure TUMUraniaExportacao.AdicionaTurma(const ASCodigo, ASNome,
  ASSigla: string; const AIAulas: integer);
begin
   Self.FOlTurmas.Add(TUMUraniaTurma.Create(ASCodigo, ASNome, ASSigla, AIAulas));
end;

constructor TUMUraniaExportacao.Create(const AIAnoSemestre: integer);
begin
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FOlDisciplinas := TObjectList.Create;
   Self.FOlProfessores := TObjectList.Create;
   Self.FOlTurmas := TObjectList.Create;
   Self.FOlGrades := TObjectList.Create;
   Self.FUMUraniaExportacaoDB := TUMUraniaExportacaoDB.Create; 
end;

destructor TUMUraniaExportacao.Destroy;
var
   I: integer;
begin
   for I := Self.FOlDisciplinas.Count - 1 downto 0 do
      TUMUraniaDisciplina(Self.FOlDisciplinas.Items[I]).Free;
   for I := Self.FOlProfessores.Count - 1 downto 0 do
      TUMUraniaProfessor(Self.FOlProfessores.Items[I]).Free;
   for I := Self.FOlTurmas.Count - 1 downto 0 do
      TUMUraniaTurma(Self.FOlTurmas.Items[I]).Free;
   for I := Self.FOlGrades.Count - 1 downto 0 do
      TUMUraniaGrade(Self.FOlGrades.Items[I]).Free;
   inherited;
end;

procedure TUMUraniaExportacao.Executa;
begin
   Self.FUMUraniaExportacaoDB.GetDisciplinas(Self);
   Self.FUMUraniaExportacaoDB.GetTurmas(Self);
   Self.FUMUraniaExportacaoDB.GetProfessores(Self);
   Self.FUMUraniaExportacaoDB.GetGrades(Self);
end;

{ Procura a disciplina na lista de disciplinas pelo código da disciplina.
}
function TUMUraniaExportacao.GetDisciplina(
  const AICodDisciplina: integer): TUMUraniaDisciplina;
var
   I: integer;
begin
   for I := 0 to Self.FOlDisciplinas.Count - 1 do
   begin
      Result := TUMUraniaDisciplina(Self.FOlDisciplinas.Items[I]);
      if Result.Codigo = AICodDisciplina then Break;
   end;
   Result := nil;
end;

{ Procura o professor na lista de professores pelo código de professor.
}
function TUMUraniaExportacao.GetProfessor(
  const AICodProfessor: integer): TUMUraniaProfessor;
var
   I: integer;
begin
   for I := 0 to Self.FOlProfessores.Count - 1 do
   begin
      Result := TUMUraniaProfessor(Self.FOlProfessores.Items[I]);
      if Result.Codigo = AICodProfessor then Break;
   end;
   Result := nil;
end;

{ Procura a turma na lista de turmas pelo código da turma.
}
function TUMUraniaExportacao.GetTurma(const ASCodTurma: string): TUMUraniaTurma;
var
   I: integer;
begin
   for I := 0 to Self.FOlTurmas.Count - 1 do
   begin
      Result := TUMUraniaTurma(Self.FOlTurmas.Items[I]);
      if Result.Codigo = ASCodTurma then Break;
   end;
   Result := nil;
end;

{ TUMUraniaXML }

{ Percorre o conteúdo do arquivo XML e faz a leitura dos registros de horários.
}
procedure TUMUraniaXML.CarregaHorarios;
var
   I: integer;
   LNodoHorario: IXMLNode;
begin
   try
      try
         // procura a tag de horários
         LNodoHorario := Self.DocumentElement.ChildNodes.FindNode('HORARIO');
         // percorre as tags de registros dentro dos horários
         for I := 0 to LNodoHorario.ChildNodes.Count - 1 do
         begin
            if LNodoHorario.ChildNodes.Get(I).NodeName = 'REGISTRO' then
            begin
               Self.FUMUraniaImportacao.AdicionaHorario(
                  LNodoHorario.ChildNodes.Get(I).ChildValues['CODTURMA'],
                  LNodoHorario.ChildNodes.Get(I).ChildValues['AMBIENTE'],
                  LNodoHorario.ChildNodes.Get(I).ChildValues['TIPODISC'],
                  LNodoHorario.ChildNodes.Get(I).ChildValues['HOR'],
                  LNodoHorario.ChildNodes.Get(I).ChildValues['CODPROF'],
                  LNodoHorario.ChildNodes.Get(I).ChildValues['CODDISC'],
                  LNodoHorario.ChildNodes.Get(I).ChildValues['DIA']);
            end;
         end;
      except
         on EUMUraniaXMLError do raise;
         on E: EXMLDocError do raise EUMUraniaXMLError.CreateFmt(errLeituraHorario, [E.Message]);
      end;
   finally
      LNodoHorario := nil;
   end;
end;

procedure TUMUraniaXML.CarregaImportacao;
begin
   try
      Self.FUMUraniaImportacao := TUMUraniaImportacao.Create(
         Self.DocumentElement.ChildValues['CODESCOLA'],
         Self.DocumentElement.ChildValues['CODTURNO'],
         Self.DocumentElement.ChildValues['NOMETURNO'],
         Self.FIAnoSemestre, Self.FSCategoria);
      Self.CarregaHorarios;
   except
      on EUMUraniaXMLError do raise;
   end;
end;

procedure TUMUraniaXML.CarregaXML(const ASCaminho: string);
begin
   if FileExists(ASCaminho) then
   begin
      Self.FSCaminhoXML := ASCaminho;
      Self.LoadFromFile(ASCaminho);
      Self.Active := true;
      Self.SetTipoAcao;
   end
   else
      raise EUMUraniaXMLError.CreateFmt(errArqInexistente, [ASCaminho]);
end;

constructor TUMUraniaXML.Create(const AIAnoSemestre: Integer;
   const ASCategoria: string; AOwner: TComponent);
begin
   inherited Create(AOwner);
   Self.FIAnoSemestre := AIAnoSemestre;
   Self.FSCategoria := ASCategoria;
   Self.NodeIndentStr := #9;
   Self.Options := Self.Options + [doNodeAutoIndent];
   Self.ParseOptions := Self.ParseOptions + [poResolveExternals];
end;

destructor TUMUraniaXML.Destroy;
begin
   FreeAndNil(Self.FUMUraniaImportacao);
   FreeAndNil(Self.FUMUraniaExportacao);
   inherited;
end;

function TUMUraniaXML.Executa: boolean;
begin
   case Self.FUMTipoAcao of
      taImportacao:
         try
            Result := Self.ExecutaImportacao;
         except
            on EUMUraniaXMLError do raise;
         end;
      taExportacao:
         try
            Self.ExecutaExportacao
         except
            on EUMUraniaDBError do raise;
         end;
   end;
end;

procedure TUMUraniaXML.ExecutaExportacao;
begin
   Self.FUMUraniaExportacao.Executa;
end;

function TUMUraniaXML.ExecutaImportacao: boolean;
begin
   Self.CarregaImportacao;
   Result := Self.FUMUraniaImportacao.Executa;
end;

procedure TUMUraniaXML.SalvaXML;
begin
   Self.DocumentElement.GetChildNodes.Clear;
   
   if FileExists(Self.FSCaminhoXML) then
      DeleteFile(Self.FSCaminhoXML);
   Self.SaveToFile(Self.FSCaminhoXML);
end;

procedure TUMUraniaXML.SalvaXML(const ASCaminho: string);
begin
   Self.FSCaminhoXML := ASCaminho;
   Self.SalvaXML;
end;

procedure TUMUraniaXML.SetTipoAcao;
begin
   if Self.DocumentElement.NodeName = 'IMPORT_URANIA' then
      Self.FUMTipoAcao := taImportacao
   else if Self.DocumentElement.NodeName = 'EXPORT_URANIA_INSERT' then
      Self.FUMTipoAcao := taExportacao
   else
      raise EUMUraniaXMLError.CreateFmt(errArqInvalido, [Self.FSCaminhoXML]);
end;

{ TUMUraniaImportacaoDB }

constructor TUMUraniaImportacaoDB.Create;
begin
   DM.CriarConsulta(Self.FQyHorario);
   DM.CriarConsulta(Self.FQyProcuraTurmaProfessor);
   Self.FQyHorario.ParamCheck := true;
   Self.FQyProcuraTurmaProfessor.ParamCheck := true;

   Self.FQyHorario.SQL.Text := SQL_INSERE_HORARIO;
   Self.FQyProcuraTurmaProfessor.SQL.Text := SQL_PROCURA_TURMA_PROFESSOR;
   if(DM.variavel_nu_parametro('Academico.sn_codigo_disciplina_import_urania') = '1' ) then
   begin
      Self.FQyHorario.SQL.Text := SQL_INSERE_HORARIO_COD;
      Self.FQyProcuraTurmaProfessor.SQL.Text := SQL_PROCURA_TURMA_PROFESSOR_COD;
   end;
   Self.FOlHorariosErrados := TObjectList.Create;
end;

destructor TUMUraniaImportacaoDB.Destroy;
begin
   FreeAndNil(Self.FQyHorario);
   inherited;
end;

function TUMUraniaImportacaoDB.GetHorarioErrado(
  const AIndice: integer): TUMUraniaHorario;
begin
   Result := TUMUraniaHorario(Self.FOlHorariosErrados.Items[AIndice]);
end;

function TUMUraniaImportacaoDB.GetHorarioErradoCount: integer;
begin
   Result := Self.FOlHorariosErrados.Count;
end;

{ Insere um novo horário na grade de horários do UNIMESTRE, tabela
  "turmas_horarios". Antes da inclusão verifica se existe a relação de turma,
  professor e disciplina no ano/semestre vigente. Se o professor não foi
  cadastrado então adiciona à uma lista de professores não encontrados.
}
procedure TUMUraniaImportacaoDB.InsereHorario(const AIAnoSemestre, AICodHorario,
   AIDiaSemana, AICodDisciplina, AICodProfessor: integer;
   const ASCodTurma, ASCategoria: string;
   const AUMUraniaHorario: TUMUraniaHorario);
begin
   if Self.ProcuraTurmaProfessor(AIAnoSemestre, AICodDisciplina, AICodProfessor, ASCodTurma) then
   begin
      Self.FQyHorario.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
      Self.FQyHorario.ParamByName('cd_horario').AsInteger := AICodHorario;
      Self.FQyHorario.ParamByName('dia_semana').AsInteger := AIDiaSemana;
      Self.FQyHorario.ParamByName('disciplina').AsInteger := AICodDisciplina;
      Self.FQyHorario.ParamByName('cd_professor').AsInteger := AICodProfessor;
      Self.FQyHorario.ParamByName('ds_categoria').AsString := ASCategoria;
      Self.FQyHorario.ParamByName('turma').AsString := ASCodTurma;
      try
         Self.FQyHorario.ExecSQL;
      except
         on E: EDatabaseError do
            raise EUMUraniaDBError.CreateFmt(errInsereHorario, [E.Message]);
      end;
   end
   else
   begin
      Self.FOlHorariosErrados.Add(AUMUraniaHorario);
   end;
end;

{ Verifica se o processo de importação foi bem sucedido, ou seja, se não há
  nenhum turma/professor adicionado à lista de turmas/professores não
  localizados.
}
function TUMUraniaImportacaoDB.IsBemSucedido: boolean;
begin
   Result := Self.FOlHorariosErrados.Count = 0;
end;

{ Procura um professor na relação disciplina/turma/professor na tabela
  "turmasprofessores" no UNIMESTRE.
}
function TUMUraniaImportacaoDB.ProcuraTurmaProfessor(const AIAnoSemestre,
  AICodDisciplina, AICodProfessor: integer; const ASCodTurma: string): boolean;
begin
   Self.FQyProcuraTurmaProfessor.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
   Self.FQyProcuraTurmaProfessor.ParamByName('disciplina').AsInteger := AICodDisciplina;
   Self.FQyProcuraTurmaProfessor.ParamByName('professor').AsInteger := AICodProfessor;
   Self.FQyProcuraTurmaProfessor.ParamByName('turma').AsString := ASCodTurma;
   try
      try
         Self.FQyProcuraTurmaProfessor.Open;
         Result := not Self.FQyProcuraTurmaProfessor.IsEmpty;
      except
         on E: EDatabaseError do
            raise EUMUraniaDBError.CreateFmt(errProcuraTurmaProfessor, [E.Message]);
      end;
   finally
      Self.FQyProcuraTurmaProfessor.Close;
   end;
end;

{ TUMUraniaExportacaoDB }

constructor TUMUraniaExportacaoDB.Create;
begin
   DM.CriarConsulta(Self.FQyDisciplinas);
   DM.CriarConsulta(Self.FQyTurmas);
   DM.CriarConsulta(Self.FQyProfessores);
   DM.CriarConsulta(Self.FQyGrades);

   Self.FQyDisciplinas.SQL.Text := SQL_GET_DISCIPLINAS;
   Self.FQyTurmas.SQL.Text := SQL_GET_TURMAS;
   Self.FQyProfessores.SQL.Text := SQL_GET_PROFESSORES;
   Self.FQyGrades.SQL.Text := SQL_GET_GRADES;

   Self.FQyDisciplinas.ParamCheck := true;
   Self.FQyTurmas.ParamCheck := true;
   Self.FQyProfessores.ParamCheck := true;
   Self.FQyGrades.ParamCheck := true;
end;

destructor TUMUraniaExportacaoDB.Destroy;
begin
   FreeAndNil(Self.FQyDisciplinas);
   FreeAndNil(Self.FQyTurmas);
   FreeAndNil(Self.FQyProfessores);
   FreeAndNil(Self.FQyGrades);
   inherited;
end;

procedure TUMUraniaExportacaoDB.GetDisciplinas(
  AUMUraniaExportacao: TUMUraniaExportacao);
begin
   try
      try
         Self.FQyDisciplinas.Open;
         while not Self.FQyDisciplinas.Eof do
         begin
            AUMUraniaExportacao.AdicionaDisciplina(
               Self.FQyDisciplinas.FieldByName('codigo').AsInteger,
               Self.FQyDisciplinas.FieldByName('descricao').AsString,
               Self.FQyDisciplinas.FieldByName('sigla').AsString);
            Self.FQyDisciplinas.Next;
         end;
      except
         on E: EDatabaseError do
            raise EUMUraniaDBError.CreateFmt(errBuscaDisciplinas, [E.Message]);
      end;
   finally
      Self.FQyDisciplinas.Close;
   end;
end;

procedure TUMUraniaExportacaoDB.GetGrades(
  AUMUraniaExportacao: TUMUraniaExportacao);
begin
   try
      try
         Self.FQyGrades.ParamByName('anosemestre').AsInteger :=
            AUMUraniaExportacao.AnoSemestre;
         Self.FQyGrades.Open;
         while not Self.FQyGrades.Eof do
         begin
            AUMUraniaExportacao.AdicionaGrade(
               Self.FQyGrades.FieldByName('turma').AsString,
               Self.FQyGrades.FieldByName('disciplina').AsInteger,
               Self.FQyGrades.FieldByName('professor').AsInteger,
               Self.FQyGrades.FieldByName('nr_creditos_academicos').AsInteger);
            Self.FQyGrades.Next;
         end;
      except
         on E: EDatabaseError do
            raise EUMUraniaDBError.CreateFmt(errBuscaGrades, [E.Message]);
      end;
   finally
      Self.FQyGrades.Close;
   end;
end;

procedure TUMUraniaExportacaoDB.GetProfessores(
  AUMUraniaExportacao: TUMUraniaExportacao);
begin
   try
      try
         Self.FQyProfessores.ParamByName('anosemestre').AsInteger :=
            AUMUraniaExportacao.AnoSemestre;
         Self.FQyProfessores.Open;
         while not Self.FQyProfessores.Eof do
         begin
            AUMUraniaExportacao.AdicionaProfessor(
               Self.FQyProfessores.FieldByName('cd_pessoa').AsInteger,
               Self.FQyProfessores.FieldByName('nm_pessoa').AsString,
               Self.FQyProfessores.FieldByName('nm_apelido').AsString);
            Self.FQyProfessores.Next;
         end;
      except
         on E: EDatabaseError do
            raise EUMUraniaDBError.CreateFmt(errBuscaProfessores, [E.Message]);
      end;
   finally
      Self.FQyProfessores.Close;
   end;
end;

procedure TUMUraniaExportacaoDB.GetTurmas(
  AUMUraniaExportacao: TUMUraniaExportacao);
begin
   try
      try
         Self.FQyTurmas.ParamByName('anosemestre').AsInteger :=
            AUMUraniaExportacao.AnoSemestre;
         Self.FQyTurmas.Open;
         while not Self.FQyTurmas.Eof do
         begin
            AUMUraniaExportacao.AdicionaTurma(
               Self.FQyTurmas.FieldByName('codigo').AsString,
               Self.FQyTurmas.FieldByName('descricao').AsString,
               Self.FQyTurmas.FieldByName('codigo').AsString, 5);
            Self.FQyTurmas.Next;
         end;
      except
         on E: EDatabaseError do
            raise EUMUraniaDBError.CreateFmt(errBuscaTurmas, [E.Message]);
      end;
   finally
      Self.FQyTurmas.Close;
   end;
end;

initialization
   CoInitialize(nil);

finalization
   CoUninitialize;

end.

