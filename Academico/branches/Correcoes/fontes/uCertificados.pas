{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
unit uCertificados;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Mask, Grids, DBGrids, uDM, DB,
   ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   UMDateTimePicker;

type
   EUMCertLivroError = class of Exception;

   TUMCertificadoLivro = class(TObject)
   strict private
      FQyRegistros: TUMZQuery;
      FQyRegistrosPag: TUMZQuery;
      FQyIsCheio: TUMZQuery;
      FQyIsPagCheia: TUMZQuery;
      FQyFecha: TUMZQuery;
      FQyAtuPagina: TUMZQuery;
      FICodigo: integer;
      FIPaginas: integer;
      FILinhas: integer;
      FIPaginaAtual: integer;
      FSNome: string;
      FSTipo: string;
      FBAberto: boolean;
      procedure fecha;
      function isCheio: boolean;
      function isPaginaCheia(const AIPagina: integer): boolean;
      function getTotalRegistros: integer;
      function getTotalRegistrosPagina(const AIPagina: integer): integer;
      function getPagina: integer;
   private
      constructor Create(const AICodigo, AIPaginas, AILinhas, AIPaginaAtual: integer;
         const ASNome, ASTipo: string; const ABAberto: boolean);
      destructor Destroy; override;
      procedure atualizaPagina;
      property Codigo: integer read FICodigo;
      property Nome: string read FSNome;
      property PaginaAtual: integer read FIPaginaAtual write FIPaginaAtual;
      property Cheio: boolean read isCheio;
      property PaginaCheia[const Pagina: integer]: boolean read isPaginaCheia;
      property Registros: integer read getTotalRegistros;
      property RegistrosPagina[const Pagina: integer]: integer read getTotalRegistrosPagina;
      property Pagina: integer read getPagina;
   end;

   TfrmCertificados = class(TForm)
    ProgressBar1: TProgressBar;
    bnAddLivro: TSpeedButton;
    bnFechar: TSpeedButton;
    qCertificadoscd_matricula_curso: TLargeintField;
    qCertificadosnr_anosem_conclusao: TLargeintField;
    Label3: TLabel;
    dtpRegistro: TUMDateTimePicker;
    btLimpar: TBitBtn;
    qCertificadosturma: TStringField;
    qCertificadosnr_cert_folha: TIntegerField;
    qCertificadosnr_cert_registro: TIntegerField;
    procedure Edit1Change(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure bnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   published
      Bevel6: TBevel;
      Panel3: TPanel;
      Panel1: TPanel;
      sbBuscaCurso: TSpeedButton;
      lblCurso: TLabel;
      lblDisciplina: TLabel;
      lblTurma: TLabel;
      sbBuscaTurma: TSpeedButton;
      sbBuscaAluno: TSpeedButton;
      txtCurso: TEdit;
      txtAluno: TEdit;
      txtTurma: TEdit;
      ckAnoSemestre: TCheckBox;
      txtAnoSemestreCursos: TMaskEdit;
      UpDownCursos: TUpDown;
      DBGrid1: TDBGrid;
      qCertificados: TUMZQuery;
      dsCertificados: TDataSource;
      qCertificadoscd_pessoa: TIntegerField;
      qCertificadosdt_conclusao: TDateTimeField;
      qCertificadosdt_colacao: TDateTimeField;
      qCertificadosdt_exp_diploma: TDateTimeField;
      qCertificadosnm_livro: TStringField;
      qCertificadosnm_pessoa: TStringField;
      qCertificadoscd_curso: TStringField;
      Panel2: TPanel;
      btnFiltrar: TBitBtn;
      SpeedButton1: TSpeedButton;
      ComboBox1: TComboBox;
      Label1: TLabel;
      Label2: TLabel;
      Edit1: TEdit;
      procedure filtra(Sender: TObject);
      procedure buscaCurso(Sender: TObject);
      procedure buscaTurma(Sender: TObject);
      procedure buscaPessoa(Sender: TObject);
      procedure incDecAnoSem(Sender: TObject; Button: TUDBtnType);
      procedure mostraFormulario(Sender: TObject);
      procedure fechaFormulario(Sender: TObject; var Action: TCloseAction);
      procedure selecionaLivro(Sender: TObject);
      procedure informaPaginaAtual(Sender: TObject; var Key: Char);
      procedure atualizarUltimoRegistroLivro(const cdLivro, nrCertRegistro: integer);
      procedure registraCertificados(Sender: TObject);
      procedure criaFomulario(Sender: TObject);
      procedure AdicionaLivro(Sender: TObject);
   strict private
      FQyAtualizaNrUltimoRegistroLivro: TUMZQuery;
      FQyVerificaConflitoRegistraCert: TUMZQuery;
      FQyRegistraCert: TUMZQuery;
      FQyProxRegCert: TUMZQuery;
      FQyLivros: TUMZQuery;
      FISituacaoFormado: integer;
      procedure carregaLivros;
      function getAnoSemestreAtual: string;
      function getProximaRegistroCert(const AICodLivro,nrCodFolha: Integer): integer;
      function registraCertificadoAluno(const AIMatriculaCurso, AICodAluno,
         AICodLivro, AINumPagina: integer; const ASCodCurso: string): boolean;
      function possuiConflitoRegistroCertificado(const cdLivro, nrFolha, nrCertRegistro: integer): boolean;   
   end;

var
   frmCertificados: TfrmCertificados;
   POrdCertificados: Integer;
implementation

uses
   uFSelecionarCurso, uFSelecionarTurma, uFSelecionarPessoa, uCadLivro, Main,
   uUMNucleo;

const
   ERRO_VERIFICA_PAGINA_CHEIA =
      'Ocorreu um erro ao tentar verificar a disponibilidade de linhas na página $nr_pagina$ do livro $nm_livro$: ' +
      #13 + '$erro$';

   ERRO_VERIFICA_LIVRO_CHEIO =
      'Ocorreu um erro ao tentar verificar a disponibilidade de páginas e linhas no livro $nm_livro$: ' +
      #13 + '$erro$';

   ERRO_GET_TOTAL_REGS_PAGINA =
      'Ocorreu um erro ao tentar resgatar o total de registros cadastrados na página $nr_pagina$ do livro $nm_livro$: ' +
      #13 + '$erro$';

   ERRO_GET_TOTAL_REGS_LIVRO =
      'Ocorreu um erro ao tentar resgatar o total de registros cadastrados para o livro $nm_livro$: '+
      #13 + '$erro$';

   ERRO_FECHA_LIVRO =
      'Ocorreu um erro ao tentar fechar o livro $nm_livro$: ' + #13 + '$erro$';
      
   MSG_LIMITE_PAGINAS =
      'O livro atingiu o limite de páginas!' + #13 +
      'Você precisa selecionar outro livro para continuar!';

   MSG_LIVRO_CHEIO =
      'O livro está completo! Não é possível inserir mais registros.' + #13 +
      'Você precisa selecionar outro livro para continuar!';

   MSG_ERRO =
      'Não foi possível registrar o certificado para o aluno $cd_pessoa$' + #13 + #13 +
      'Cód. Matrícula no curso : $cd_matricula_curso$' + #13 +
      'Cód. Curso : $cd_curso$' + #13 +
      'Erro : $erro$';

   SQL_ATU_PAGINA =
      'UPDATE '+
         'certificado_livros '+
      'SET '+
         'pg_atual = :nr_pagina_atual '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro';
      
   SQL_TOT_REGISTROS_LIVRO =
      'SELECT '+
         'cd_matricula_curso '+
      'FROM '+
         'matriculas_curso '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro';

   SQL_TOT_REGISTROS_FOLHA =
      'SELECT '+
         'cd_matricula_curso '+
      'FROM '+
         'matriculas_curso '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro AND '+
         'nr_cert_folha = :nr_cert_folha';

   SQL_IS_LIVRO_CHEIO =
      'SELECT '+
         'CASE WHEN ((NR_PAGINAS * NR_LINHAS) <= :NR_REGISTROS) THEN 1 ELSE 0 END AS CHEIO '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro';

   SQL_IS_PAGINA_CHEIA =
      'SELECT '+
         'CASE WHEN nr_linhas <= :nr_registros THEN 1 ELSE 0 END AS cheio '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro';

   SQL_FECHA_LIVRO =
      'UPDATE '+
         'certificado_livros '+
      'SET '+
         'sn_aberto = 0 '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro';

   SQL_LIVROS =
      'SELECT '+
         'cd_cert_livro,'+
         'nm_livro,'+
         'cd_tipo,'+
         'nr_paginas,'+
         'nr_linhas,'+
         'pg_atual,'+
         'sn_aberto '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'sn_aberto = 1 AND '+
         'cd_tipo = ''F''';

   SQL_PROX_REGISTRO_CERT_FOLHA =
      'SELECT '+
         ' CASE WHEN nr_ultimo_cert_registro >= nr_linhas THEN 1 '+
         '     ELSE nr_ultimo_cert_registro + 1 '+
         ' END nr_ultimo_cert_registro '+
      'FROM '+
         'certificado_livros '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro ';

   SQL_PROX_REGISTRO_CERT_LIVRO =
      'SELECT ' +
	      'COALESCE(nr_ultimo_cert_registro, 0) + 1 nr_ultimo_cert_registro ' +
      'FROM  ' +
	      'certificado_livros ' +
      'WHERE  ' +
	      'cd_cert_livro = :cd_cert_livro ';

   SQL_PROX_REGISTRO_CERT_GLOBAL =
      'SELECT ' +
	      'COALESCE(nr_ultimo_cert_registro, 0) + 1 nr_ultimo_cert_registro ' +
      'FROM  ' +
	      'certificado_livros ' +
      'WHERE  ' +
	      'cd_cert_livro = :cd_cert_livro ';

   SQL_ATUALIZA_NR_ULTIMO_CERT_REGISTRO_LIVRO =
      'UPDATE ' +
	      'certificado_livros ' +
      'SET '+
	      'nr_ultimo_cert_registro = :nr_ultimo_cert_registro ' +
      'WHERE  ' +
	      'cd_cert_livro = :cd_cert_livro ';

   SQL_ATUALIZA_NR_ULTIMO_CERT_REGISTRO_GLOBAL =
      'UPDATE ' +
	      'certificado_livros ' +
      'SET '+
	      'nr_ultimo_cert_registro = :nr_ultimo_cert_registro ';

   SQL_REGISTRA_CERT =
      'UPDATE '+
         'matriculas_curso '+
      'SET '+
         'cd_cert_livro = :cd_cert_livro,'+
         'nr_cert_folha = :nr_cert_folha,'+
         'nr_cert_registro = :nr_cert_registro, '+
         'sn_gerado_manual = 0, ' +
         'dt_certificado = :dt_certificado '+
      'WHERE '+
         'cd_matricula_curso = :cd_matricula_curso AND '+
         'cd_pessoa = :cd_pessoa AND '+
         'cd_curso = :cd_curso AND '+
         'cd_cert_livro IS NULL AND '+
         'nr_cert_folha IS NULL AND '+
         'nr_cert_registro IS NULL';

   SQL_VERIFICA_CONFLITO_REGISTRA_CERT =
      'SELECT '+
         'COUNT(cd_matricula_curso) nr_registros '+
      'FROM '+
         'matriculas_curso '+
      'WHERE '+
         'cd_cert_livro = :cd_cert_livro AND '+
         'nr_cert_folha = :nr_cert_folha AND '+
         'nr_cert_registro = :nr_cert_registro';

   SQL_CERTIFICADOS_TURMA_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.curso = :cd_curso AND '+
         'm.turma = :cd_turma '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_TURMA_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.TURMA = :CD_TURMA AND '+
         'M.CURSO = :CD_CURSO '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_CURSO_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.curso = :cd_curso '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_CURSO_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CURSO = :CD_CURSO '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.turma = :cd_turma AND '+
         'm.curso = :cd_curso '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.TURMA = :CD_TURMA AND '+
         'M.CURSO = :CD_CURSO '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO, '+
         'NM_PESSOA';

   SQL_CERTIFICADOS_CURSO_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso mc '+
            'JOIN pessoas p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.curso = :cd_curso AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_CURSO_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CURSO = :CD_CURSO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_TURMA_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.turma = :cd_turma AND '+
         'm.curso = :cd_curso AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_TURMA_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.TURMA = :CD_TURMA AND '+
         'M.CURSO = :CD_CURSO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_CURSO_TURMA_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.turma = :cd_turma AND '+
         'm.curso = :cd_curso AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_CURSO_TURMA_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.TURMA = :CD_TURMA AND '+
         'M.CURSO = :CD_CURSO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_CURSO_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.curso = :cd_curso '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_CURSO_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.CURSO = :CD_CURSO '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_TURMA_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.turma = :cd_turma '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_TURMA_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.TURMA = :CD_TURMA '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_CURSO_TURMA =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.turma = :cd_turma AND '+
         'm.curso = :cd_curso '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_CURSO_TURMA_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_CURSO_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.curso = :cd_curso AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_CURSO_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.CURSO = :CD_CURSO AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

   SQL_CERTIFICADOS_ALUNO_TURMA_ANOSEM_MYSQL =
      'SELECT '+
         'mc.cd_matricula_curso,'+
         'p.cd_pessoa,'+
         'p.nm_pessoa,'+
         'mc.cd_curso,'+
         'mc.nr_anosem_conclusao,'+
         'mc.dt_conclusao,'+
         'mc.dt_colacao,'+
         'mc.dt_exp_diploma,'+
         'cl.nm_livro,'+
         'mc.nr_cert_folha,'+
         'mc.nr_cert_registro, '+
         'm.turma '+
      'FROM '+
         'matriculas_curso  mc '+
            'JOIN pessoas  p ON(p.cd_pessoa = mc.cd_pessoa) '+
            'JOIN matriculas  m ON(mc.cd_matricula_curso = m.cd_matricula_curso) '+
            'LEFT JOIN certificado_livros  cl ON (cl.cd_cert_livro = mc.cd_cert_livro) '+
      'WHERE '+
         'mc.cd_situacao = :cd_situacao AND '+
         'm.codigoaluno = :cd_aluno AND '+
         'm.turma = :cd_turma AND '+
         'm.anosemestre = :nr_anosemestre '+
      'GROUP BY '+
         'mc.cd_matricula_curso '+
      'ORDER BY '+
         'mc.cd_curso, nm_pessoa, m.anosemestre DESC';

   SQL_CERTIFICADOS_ALUNO_TURMA_ANOSEM_ORACLE =
      'SELECT '+
         'MC.CD_MATRICULA_CURSO,'+
         'CAST(FIRST_OCCURRENCE(P.CD_PESSOA) AS NUMBER(9)) CD_PESSOA,'+
         'FIRST_OCCURRENCE(P.NM_PESSOA) NM_PESSOA,'+
         'FIRST_OCCURRENCE(MC.CD_CURSO) CD_CURSO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_ANOSEM_CONCLUSAO) AS NUMBER(15)) NR_ANOSEM_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_CONCLUSAO), ''YYYY-MM-DD HH24:MI:SS'') DT_CONCLUSAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_COLACAO), ''YYYY-MM-DD HH24:MI:SS'') DT_COLACAO,'+
         'TO_DATE(FIRST_OCCURRENCE(MC.DT_EXP_DIPLOMA), ''YYYY-MM-DD HH24:MI:SS'') DT_EXP_DIPLOMA,'+
         'FIRST_OCCURRENCE(CL.NM_LIVRO) NM_LIVRO,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_FOLHA) AS NUMBER(15)) NR_CERT_FOLHA,'+
         'CAST(FIRST_OCCURRENCE(MC.NR_CERT_REGISTRO) AS NUMBER(15)) NR_CERT_REGISTRO '+
      'FROM '+
         'MATRICULAS_CURSO MC '+
            'JOIN PESSOAS P ON '+
               '(P.CD_PESSOA = MC.CD_PESSOA) '+
            'JOIN MATRICULAS M ON '+
               '(MC.CD_MATRICULA_CURSO = M.CD_MATRICULA_CURSO) '+
            'LEFT JOIN CERTIFICADO_LIVROS CL ON '+
               '(CL.CD_CERT_LIVRO = MC.CD_CERT_LIVRO) '+
      'WHERE '+
         'MC.CD_SITUACAO = :CD_SITUACAO AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         'M.TURMA = :CD_TURMA AND '+
         'M.ANOSEMESTRE = :NR_ANOSEMESTRE '+
      'GROUP BY '+
         'MC.CD_MATRICULA_CURSO '+
      'ORDER BY '+
         'CD_CURSO,'+
         'NM_PESSOA';

{$R *.dfm}

{ TfrmCertificados }

procedure TfrmCertificados.AdicionaLivro(Sender: TObject);
var
   sLivro: string;
   i: integer;
begin
   sLivro := TfCadLivro.AdicionaLivro(Self);
   if sLivro <> '' then
   begin
      Self.ComboBox1.Clear;
      Self.carregaLivros;
      for i := 0 to Self.ComboBox1.Items.Count - 1 do
         if Self.ComboBox1.Items.Strings[i] = sLivro then
            Break;
      Self.ComboBox1.ItemIndex := i;
      Self.Edit1.Text := IntToStr(TUMCertificadoLivro(Self.ComboBox1.Items.Objects[i]).PaginaAtual);
   end;
end;

procedure TfrmCertificados.bnFecharClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmCertificados.btLimparClick(Sender: TObject);
begin
   txtCurso.Clear;
   txtTurma.Clear;
   txtAluno.Clear;
end;

procedure TfrmCertificados.buscaCurso(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, StrToInt(Self.txtAnoSemestreCursos.Text));

   if resultado_filtro.filtrado then
   begin
      Self.txtCurso.Text := resultado_filtro.cd_curso;
      Self.txtAnoSemestreCursos.Text := IntToStr(resultado_filtro.nr_anosemestre);
   end;
end;

procedure TfrmCertificados.buscaPessoa(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      if (resultado_filtro.cd_turma = '') or (resultado_filtro.nr_anosemestre = -1) then
      begin
         Mensagem('Não foi possível filtrar a turma ou ano/semestre do aluno selecionado.', Application.Title, MB_ICONERROR);
      end
      else
      begin
         Self.txtAluno.Text := IntToStr(resultado_filtro.cd_pessoa);
         Self.txtTurma.Text := resultado_filtro.cd_turma;
         Self.txtAnoSemestreCursos.Text := IntToStr(resultado_filtro.nr_anosemestre);
      end;
   end;
end;

procedure TfrmCertificados.buscaTurma(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(Self.txtAnoSemestreCursos.Text), -1, -1, Self.txtCurso.Text);

   if resultado_filtro.filtrado then
   begin
      Self.txtAnoSemestreCursos.Text := IntToStr( resultado_filtro.nr_anosemestre );
      Self.txtCurso.Text := resultado_filtro.cd_curso;
      Self.txtTurma.Text := resultado_filtro.cd_turma;
      Self.txtAluno.Clear;
   end;
end;

procedure TfrmCertificados.carregaLivros;
begin
   Self.FQyLivros.Close;
   Self.FQyLivros.Open;
   while not Self.FQyLivros.Eof do
   begin
      Self.ComboBox1.AddItem(Self.FQyLivros.FieldByName('nm_livro').AsString,
         TUMCertificadoLivro.Create(
            Self.FQyLivros.FieldByName('cd_cert_livro').AsInteger,
            Self.FQyLivros.FieldByName('nr_paginas').AsInteger,
            Self.FQyLivros.FieldByName('nr_linhas').AsInteger,
            Self.FQyLivros.FieldByName('pg_atual').AsInteger,
            Self.FQyLivros.FieldByName('nm_livro').AsString,
            Self.FQyLivros.FieldByName('cd_tipo').AsString,
            Self.FQyLivros.FieldByName('sn_aberto').AsInteger = 1
         )
      );
      Self.FQyLivros.Next;
   end;

   Self.ComboBox1.ItemIndex := ComboBox1.Items.Count - 1;

   if not FQyLivros.IsEmpty then
      Self.Edit1.Text := IntToStr(TUMCertificadoLivro(
         ComboBox1.Items.Objects[ComboBox1.ItemIndex]).PaginaAtual);
end;

procedure TfrmCertificados.criaFomulario(Sender: TObject);
begin
   DM.CriarConsulta(Self.FQyAtualizaNrUltimoRegistroLivro);
   DM.CriarConsulta(Self.FQyVerificaConflitoRegistraCert);
   DM.CriarConsulta(Self.FQyRegistraCert);
   DM.CriarConsulta(Self.FQyProxRegCert);
   DM.CriarConsulta(Self.FQyLivros);

   Self.FQyRegistraCert.SQL.Text := 'SELECT ds_valor FROM nu_parametros WHERE ds_parametro = "ordenacao.certificados" AND cd_modulo = ( SELECT cd_modulo FROM nu_modulos WHERE ds_chave = "UMNucleo" )';
   Self.FQyRegistraCert.Open;
   POrdCertificados := StrToInt(Self.FQyRegistraCert.FieldByName('ds_valor').AsString);
   Self.FQyRegistraCert.Close;

   Self.FQyRegistraCert.SQL.Text := SQL_REGISTRA_CERT;
   Self.FQyVerificaConflitoRegistraCert.SQL.Text := SQL_VERIFICA_CONFLITO_REGISTRA_CERT;

   Self.FQyAtualizaNrUltimoRegistroLivro.SQL.Text := SQL_ATUALIZA_NR_ULTIMO_CERT_REGISTRO_LIVRO;
   Self.FQyProxRegCert.SQL.Text := SQL_PROX_REGISTRO_CERT_LIVRO;
   if POrdCertificados = 0 then
      Self.FQyProxRegCert.SQL.Text := SQL_PROX_REGISTRO_CERT_FOLHA
   else if POrdCertificados = 2 then
   begin
      Self.FQyProxRegCert.SQL.Text := SQL_PROX_REGISTRO_CERT_GLOBAL;
      Self.FQyAtualizaNrUltimoRegistroLivro.SQL.Text := SQL_ATUALIZA_NR_ULTIMO_CERT_REGISTRO_GLOBAL;
   end;

   Self.FQyLivros.SQL.Text := SQL_LIVROS;
   Self.dtpRegistro.setDate(Date);
end;

procedure TfrmCertificados.Edit1Change(Sender: TObject);
begin
   SpeedButton1.Enabled := (Edit1.Text <> '') and (ComboBox1.ItemIndex > 0);
end;

procedure TfrmCertificados.fechaFormulario(Sender: TObject;
  var Action: TCloseAction);
var
   i: integer;
begin
   for i := 0 to Self.ComboBox1.Items.Count - 1 do
      TUMCertificadoLivro(Self.ComboBox1.Items.Objects[i]).Free;
   Self.FQyAtualizaNrUltimoRegistroLivro.Free;
   Self.FQyVerificaConflitoRegistraCert.Free;
   Self.FQyRegistraCert.Free;
   Self.FQyProxRegCert.Free;
   Self.FQyLivros.Free;
   Action := caFree;
end;

procedure TfrmCertificados.filtra(Sender: TObject);
begin
   Self.qCertificados.Close;
   if Trim(Self.txtAluno.Text) = '' then
   begin
      if Trim(Self.txtTurma.Text) = '' then
      begin
         if Trim(Self.txtCurso.Text) = '' then
         begin
            // fitlrar apenas o ano/semestre
            if Self.ckAnoSemestre.Checked then
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ANOSEM_ORACLE;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.Open;
            end;
         end
         // filtrar o curso
         else
         begin
            // filtrar curso e anosemestre
            if Self.ckAnoSemestre.Checked then
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_CURSO_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_CURSO_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_CURSO_ANOSEM_ORACLE;
               Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.Open;
            end
            // filtrar curso sem anosemestre
            else
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_CURSO_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_CURSO_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_CURSO_ORACLE;
               Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.Open;
            end;
         end;
      end
      // filtrar a turma
      else
      begin
         // filtrar a turma e anosemestre
         if Self.ckAnoSemestre.Checked then
         begin
            Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_TURMA_ANOSEM_MYSQL;
            Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_TURMA_ANOSEM_MYSQL;
            Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_TURMA_ANOSEM_ORACLE;
            Self.qCertificados.ParamByName('cd_turma').AsString := Self.txtTurma.Text;
            Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
            Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
            Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
            Self.qCertificados.Open;
         end
         // filtrar a turma sem anosemestre
         else
         begin
            Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_TURMA_MYSQL;
            Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_TURMA_MYSQL;
            Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_TURMA_ORACLE;
            Self.qCertificados.ParamByName('cd_turma').AsString := Self.txtTurma.Text;
            Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
            Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
            Self.qCertificados.Open;
         end;
      end;
   end
   // filtrar o código do aluno
   else
   begin
      if Trim(Self.txtTurma.Text) = '' then
      begin
         if Trim(Self.txtCurso.Text) = '' then
         begin
            if Self.ckAnoSemestre.Checked then
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_ANOSEM_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.Open;
            end
            else
            begin
               //
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.Open;
            end;
         end
         else
         begin
            if Self.ckAnoSemestre.Checked then
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_CURSO_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_CURSO_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_CURSO_ANOSEM_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.Open;
            end
            else
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_CURSO_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_CURSO_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_CURSO_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
               Self.qCertificados.Open;
            end;
         end;
      end
      else
      begin
         if Trim(Self.txtCurso.Text) = '' then
         begin
            if Self.ckAnoSemestre.Checked then
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_TURMA_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_TURMA_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_TURMA_ANOSEM_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('cd_turma').AsString := Self.txtTurma.Text;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.Open;
            end
            else
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_TURMA_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_TURMA_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_TURMA_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('cd_turma').AsString := Self.txtTurma.Text;
               Self.qCertificados.Open;
            end;
         end
         else
         begin
            if Self.ckAnoSemestre.Checked then
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_CURSO_TURMA_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_CURSO_TURMA_ANOSEM_MYSQL;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_CURSO_TURMA_ANOSEM_ORACLE;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
               Self.qCertificados.ParamByName('cd_turma').AsString := Self.txtTurma.Text;
               Self.qCertificados.ParamByName('nr_anosemestre').AsString := Self.txtAnoSemestreCursos.Text;
               Self.qCertificados.Open;
            end
            else
            begin
               Self.qCertificados.SQL.Text := SQL_CERTIFICADOS_ALUNO_CURSO_TURMA;
               Self.qCertificados.SQLList.Values['mysql-5'] := SQL_CERTIFICADOS_ALUNO_CURSO_TURMA;
               Self.qCertificados.SQLList.Values['oracle'] := SQL_CERTIFICADOS_ALUNO_CURSO_TURMA;
               Self.qCertificados.ParamByName('cd_curso').AsString := Self.txtCurso.Text;
               Self.qCertificados.ParamByName('cd_aluno').AsString := Self.txtAluno.Text;
               Self.qCertificados.ParamByName('cd_situacao').AsInteger := Self.FISituacaoFormado;
               Self.qCertificados.ParamByName('cd_turma').AsString := Self.txtTurma.Text;
               Self.qCertificados.Open;
            end;
         end;
      end;
   end;
end;

procedure TfrmCertificados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F12 : if bnFechar.Enabled then bnFecharClick( nil );
             
  end;
end;

{ Pega o código de identificação do próximo certificado.
}
function TfrmCertificados.getAnoSemestreAtual: string;
begin
   Result := IntToSTR(dm.GetAnoSemestreAtual);

end;

function TfrmCertificados.getProximaRegistroCert(const AICodLivro,nrCodFolha: Integer): integer;
begin
   Self.FQyProxRegCert.Close;
   Self.FQyProxRegCert.ParamByName('cd_cert_livro').AsInteger := AICodLivro;
   Self.FQyProxRegCert.Open;

   if (Self.FQyProxRegCert.IsEmpty) then
      Result := 1
   else
      Result := Self.FQyProxRegCert.FieldByName('nr_ultimo_cert_registro').AsInteger;
end;

{ Incrementa/decrementa o ano/semestre
}
procedure TfrmCertificados.incDecAnoSem(Sender: TObject; Button: TUDBtnType);
begin
   if Button = btNext then
      Self.txtAnoSemestreCursos.Text := DM.incrementar_ano_semestre(Self.txtAnoSemestreCursos.Text)
   else
      Self.txtAnoSemestreCursos.Text := DM.decrementar_ano_semestre(Self.txtAnoSemestreCursos.Text);
end;

{ Permite apenas números ao informar a página
}
procedure TfrmCertificados.informaPaginaAtual(Sender: TObject; var Key: Char);
begin
   if not (Key in[#48..#57, #8]) then Key := #0;
end;

procedure TfrmCertificados.mostraFormulario(Sender: TObject);
begin
   Self.FISituacaoFormado := StrToInt(DM.variavel_parametro('certificado_situacao_formado'));
   Self.txtAnoSemestreCursos.Text := Self.getAnoSemestreAtual;

   // Bloquear anosemestre
   ckAnoSemestre.Visible := TUMNucleo.GetParametroUsaAnosemestre;
   txtAnoSemestreCursos.Visible := ckAnoSemestre.Visible;
   UpDownCursos.Visible := ckAnoSemestre.Visible;

   if not ckAnoSemestre.Visible then ckAnoSemestre.Checked := False;

   Self.carregaLivros;
end;
 
{ Registra o ceritifado para apenas um aluno.
}
function TfrmCertificados.registraCertificadoAluno(const AIMatriculaCurso,
  AICodAluno, AICodLivro, AINumPagina: integer;
  const ASCodCurso: string): boolean;
var
   sErro: string;
   iNrCertProxRegistro: integer;
begin
   iNrCertProxRegistro := Self.getProximaRegistroCert(AICodLivro,AINumPagina);

   Result := True;
   Self.FQyRegistraCert.ParamByName('cd_cert_livro').AsInteger := AICodLivro;
   Self.FQyRegistraCert.ParamByName('nr_cert_folha').AsInteger := AINumPagina;
   Self.FQyRegistraCert.ParamByName('nr_cert_registro').AsInteger := iNrCertProxRegistro;
   Self.FQyRegistraCert.ParamByName('cd_matricula_curso').AsInteger := AIMatriculaCurso;
   Self.FQyRegistraCert.ParamByName('cd_pessoa').AsInteger := AICodAluno;
   Self.FQyRegistraCert.ParamByName('cd_curso').AsString := ASCodCurso;
   Self.FQyRegistraCert.ParamByName('dt_certificado').AsDate := dtpRegistro.getDate;
   try

      // Somente faz a alteração se não houver conflito, ou seja,
      // se não existir outra matrícula curso conflitando no mesmo LIVRO, FOLHA e REGISTRO
      // se houver conflito, pula para o próximo
      if (Self.possuiConflitoRegistroCertificado(AICodLivro, AINumPagina, iNrCertProxRegistro)) then
      begin
         Self.atualizarUltimoRegistroLivro(AICodLivro, iNrCertProxRegistro);
         Self.registraCertificadoAluno(AIMatriculaCurso, AICodAluno, AICodLivro, AINumPagina, ASCodCurso);
         Exit;
      end;

      Self.FQyRegistraCert.ExecSQL;

      // Se houve alteração de matricula curso atualiza o ultimo registro do livro
      if Self.FQyRegistraCert.RowsAffected > 0 then
      begin
        Self.atualizarUltimoRegistroLivro(AICodLivro, iNrCertProxRegistro);
      end;
   except
      on E: Exception do
      begin
         Result := False;
         sErro := StringReplace(MSG_ERRO, '$cd_pessoa$', IntToStr(AICodAluno), []);
         sErro := StringReplace(sErro, '$cd_matricula_curso$', IntToStr(AIMatriculaCurso), []);
         sErro := StringReplace(sErro, '$cd_curso$', ASCodCurso, []);
         sErro := StringReplace(sErro, '$erro$', E.Message, []);
         Mensagem(sErro, Application.Title, MB_ICONERROR, Application.Handle);
      end;
   end;
end;

function TfrmCertificados.possuiConflitoRegistroCertificado(const cdLivro, nrFolha, nrCertRegistro: integer): boolean;
begin
   Result := False;

   Self.FQyVerificaConflitoRegistraCert.Close;
   Self.FQyVerificaConflitoRegistraCert.ParamByName('cd_cert_livro').AsInteger := cdLivro;
   Self.FQyVerificaConflitoRegistraCert.ParamByName('nr_cert_folha').AsInteger := nrFolha;
   Self.FQyVerificaConflitoRegistraCert.ParamByName('nr_cert_registro').AsInteger := nrCertRegistro;
   Self.FQyVerificaConflitoRegistraCert.Open;

   if (Self.FQyVerificaConflitoRegistraCert.FieldByName('nr_registros').AsInteger > 0) then
   begin
      Result := True;
   end;
end;

procedure TfrmCertificados.atualizarUltimoRegistroLivro(const cdLivro, nrCertRegistro: integer);
begin
   Self.FQyAtualizaNrUltimoRegistroLivro.ParamByName('nr_ultimo_cert_registro').AsInteger := nrCertRegistro;

   if POrdCertificados <> 2 then
   begin
      Self.FQyAtualizaNrUltimoRegistroLivro.ParamByName('cd_cert_livro').AsInteger := cdLivro;
   end;

   Self.FQyAtualizaNrUltimoRegistroLivro.ExecSQL;
end;

{ Registra os certificados.
}
procedure TfrmCertificados.registraCertificados(Sender: TObject);
var
   oUMCertLivro: TUMCertificadoLivro;
begin
   if Self.ComboBox1.ItemIndex > 0 then
   begin
      oUMCertLivro := TUMCertificadoLivro(Self.ComboBox1.Items.Objects[Self.ComboBox1.ItemIndex]);
      try
         // livro cheio
         if oUMCertLivro.Cheio then
         begin
            Mensagem(MSG_LIVRO_CHEIO, Application.Title, MB_ICONINFORMATION, Application.Handle);
         end
         // ainda há espaço
         else
         begin
            oUMCertLivro.PaginaAtual := StrToInt(Self.Edit1.Text);
            Self.ProgressBar1.Min := 0;
            Self.ProgressBar1.Max := Self.qCertificados.RecordCount;
            Self.qCertificados.First;
            while not Self.qCertificados.Eof do
            begin
               // registra certificado aluno a aluno
               try
                  Self.registraCertificadoAluno(
                     Self.qCertificadoscd_matricula_curso.AsInteger,
                     Self.qCertificadoscd_pessoa.AsInteger,
                     oUMCertLivro.Codigo,
                     oUMCertLivro.Pagina,
                     Self.qCertificadoscd_curso.AsString
                     );
                  Self.ProgressBar1.Position := Self.ProgressBar1.Position + 1;
                  Self.qCertificados.Next;
               except
                  on E: Exception do
                  begin
                     Mensagem(E.Message, Application.Title, MB_ICONERROR);
                     Self.ProgressBar1.Position := 0;
                     Self.filtra(nil);
                     Self.ComboBox1.ItemIndex := 0;
                     Self.Edit1.Clear;
                     oUMCertLivro.atualizaPagina;
                     Exit;
                  end;
               end;
            end;
            Mensagem('Certificados registrados com sucesso!');
            Self.ProgressBar1.Position := 0;
            Self.filtra(nil);
            oUMCertLivro.atualizaPagina;
            Self.Edit1.Text := IntToStr(TUMCertificadoLivro(
               ComboBox1.Items.Objects[ComboBox1.ItemIndex]).PaginaAtual);
         end;
      finally
         oUMCertLivro := nil;
      end;
   end;
end;

{ Seleciona um livro na combo box.
}
procedure TfrmCertificados.selecionaLivro(Sender: TObject);
begin
   SpeedButton1.Enabled := (Edit1.Text <> '') and (ComboBox1.ItemIndex > 0);
   if Self.ComboBox1.ItemIndex > 0 then
      Self.Edit1.Text := IntToStr(TUMCertificadoLivro(Self.ComboBox1.Items.Objects[Self.ComboBox1.ItemIndex]).PaginaAtual);
end;

{ TUMCertificadoLivro }

procedure TUMCertificadoLivro.atualizaPagina;
begin
   Self.FQyAtuPagina.ParamByName('nr_pagina_atual').AsInteger := Self.FIPaginaAtual;
   Self.FQyAtuPagina.ParamByName('cd_cert_livro').AsInteger := Self.FICodigo;
   Self.FQyAtuPagina.ExecSQL;
end;

{ Construtor.
}
constructor TUMCertificadoLivro.Create(const AICodigo, AIPaginas, AILinhas,
  AIPaginaAtual: integer; const ASNome, ASTipo: string;
  const ABAberto: boolean);
begin
   Self.FICodigo := AICodigo;
   Self.FIPaginas := AIPaginas;
   Self.FILinhas := AILinhas;
   Self.FIPaginaAtual := AIPaginaAtual;
   Self.FSNome := ASNome;
   Self.FSTipo := ASTipo;

   DM.CriarConsulta(Self.FQyRegistros);
   DM.CriarConsulta(Self.FQyRegistrosPag);
   DM.CriarConsulta(Self.FQyIsCheio);
   DM.CriarConsulta(Self.FQyIsPagCheia);
   DM.CriarConsulta(Self.FQyFecha);
   DM.CriarConsulta(Self.FQyAtuPagina);

   Self.FQyRegistros.SQL.Text := SQL_TOT_REGISTROS_LIVRO;
   Self.FQyRegistrosPag.SQL.Text := SQL_TOT_REGISTROS_FOLHA;
   Self.FQyIsCheio.SQL.Text := SQL_IS_LIVRO_CHEIO;
   Self.FQyIsPagCheia.SQL.Text := SQL_IS_PAGINA_CHEIA;
   Self.FQyFecha.SQL.Text := SQL_FECHA_LIVRO;
   Self.FQyAtuPagina.SQL.Text := SQL_ATU_PAGINA;
end;

{ Destrutor.
}
destructor TUMCertificadoLivro.Destroy;
begin
   Self.FQyRegistros.Close;
   Self.FQyRegistrosPag.Close;
   Self.FQyRegistros.Free;
   Self.FQyRegistrosPag.Free;
   Self.FQyIsCheio.Free;
   Self.FQyIsPagCheia.Free;
   Self.FQyFecha.Free;
   Self.FQyAtuPagina.Free;
   inherited;
end;

{ Fecha o livro pois atingiu o limite de páginas.
}
procedure TUMCertificadoLivro.fecha;
var
   sErro: string;
begin
   Self.FQyFecha.ParamByName('cd_cert_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyFecha.ExecSQL;
   except
      on E: Exception do
      begin
         sErro := StringReplace(ERRO_FECHA_LIVRO, '$nm_livro$', Self.FSNome, []);
         sErro := StringReplace(sErro, '$erro$', E.Message, []);
         raise EUMCertLivroError.Create(sErro);
      end;
   end;
end;

{ Pega a página seguinte para inserir o registro.
}
function TUMCertificadoLivro.getPagina: integer;
begin
   Result := Self.FIPaginaAtual;
   while Self.isPaginaCheia(Result) and (Result <= Self.FIPaginas) do
      Inc(Result);
   if Result > Self.FIPaginas then
   begin
      Self.fecha;
      raise EUMCertLivroError.Create(MSG_LIMITE_PAGINAS);
   end
   else
      Self.FIPaginaAtual := Result;
end;

{ Pega o total de registros cadastrados para o livro.
}
function TUMCertificadoLivro.getTotalRegistros: integer;
var
   sErro: string;
begin
   Result := 0;
   Self.FQyRegistros.Close;
   Self.FQyRegistros.ParamByName('cd_cert_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyRegistros.Open;
   except
      on E: Exception do
      begin
         sErro := StringReplace(ERRO_GET_TOTAL_REGS_LIVRO, '$nm_livro$', Self.FSNome, []);
         sErro := StringReplace(sErro, '$erro$', E.Message, []);
         raise EUMCertLivroError.Create(sErro);
      end;
   end;
   Result := Self.FQyRegistros.RecordCount;
end;

{ Pega o total de registros cadastrados para uma determinada página no livro.
}
function TUMCertificadoLivro.getTotalRegistrosPagina(
  const AIPagina: integer): integer;
var
   sErro: string;
begin
   Result := 0;
   Self.FQyRegistrosPag.Close;
   Self.FQyRegistrosPag.ParamByName('cd_cert_livro').AsInteger := Self.FICodigo;
   Self.FQyRegistrosPag.ParamByName('nr_cert_folha').AsInteger := AIPagina;
   try
      Self.FQyRegistrosPag.Open;
   except
      on E: Exception do
      begin
         sErro := StringReplace(ERRO_GET_TOTAL_REGS_PAGINA, '$nr_pagina$', IntToStr(AIPagina), []);
         sErro := StringReplace(sErro, '$nm_livro$', Self.FSNome, []);
         sErro := StringReplace(sErro, '$erro$', E.Message, []);
         raise EUMCertLivroError.Create(sErro);      
      end;
   end;
   Result := Self.FQyRegistrosPag.RecordCount;
end;

{ Verifica se o livro está cheio.
}
function TUMCertificadoLivro.isCheio: boolean;
var
   sErro: string;
begin
   Result := false;
   Self.FQyIsCheio.Close;
   Self.FQyIsCheio.ParamByName('cd_cert_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyIsCheio.ParamByName('nr_registros').AsInteger := Self.getTotalRegistros;
      Self.FQyIsCheio.Open;
   except
      on E: Exception do
      begin
         sErro := StringReplace(ERRO_VERIFICA_LIVRO_CHEIO, '$nm_livro$', Self.FSNome, []);
         sErro := StringReplace(sErro, '$erro$', E.Message, []);
         raise EUMCertLivroError.Create(sErro);
      end;
   end;
   Result := Self.FQyIsCheio.FieldByName('cheio').AsInteger = 1;
end;

{ Verifica se a página do livro está cheia.
}
function TUMCertificadoLivro.isPaginaCheia(const AIPagina: integer): boolean;
var
   sErro: string;
begin
   Result := False;
   Self.FQyIsPagCheia.Close;
   Self.FQyIsPagCheia.ParamByName('cd_cert_livro').AsInteger := Self.FICodigo;
   try
      Self.FQyIsPagCheia.ParamByName('nr_registros').AsInteger := Self.getTotalRegistrosPagina(AIPagina);
      Self.FQyIsPagCheia.Open;
   except
      on E: Exception do
      begin
         sErro := StringReplace(ERRO_VERIFICA_PAGINA_CHEIA, '$nr_pagina$', IntToStr(AIPagina), []);
         sErro := StringReplace(sErro, '$nm_livro$', Self.FSNome, []);
         sErro := StringReplace(sErro, '$erro$', E.Message, []);
         raise EUMCertLivroError.Create(sErro);
      end;
   end;
   Result := Self.FQyIsPagCheia.FieldByName('cheio').AsInteger = 1;
end;

end.

