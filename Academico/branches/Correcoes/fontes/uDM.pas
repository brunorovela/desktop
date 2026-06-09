unit uDM;

interface

uses
  Forms, Db, ZConnection, Classes, Sysutils, Controls, General, IniFiles, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, DBCtrls,
  StdCtrls, DateUtils, Mask, DBGrids, uMLogZeos, UMQuery, DBTables, ZAbstractTable,
  ZDbcIntfs, ZDbcStatement, ZStoredProcedure, mysql_api, Windows, UZConnection,
  SynHighlighterSQL, uDMDiario, uItemCombo, ZSqlMonitor, DBClient, UZDbcFuncs,
  StrUtils, UZStartConnection, Variants, uMensagem,
   uIUMDataModule, uUsuario, uUMCriptografia,
  uLoginManager, UMComboBox, ExtCtrls, uLkJSON;

const
   DB_PROTOCOL_ORACLE = 'oracle';
   DB_PROTOCOL_MYSQL = 'mysql-5';
   DATE_FORMAT_GERAL = '%Y-%m-%d %H:%m:%S';
   CHAVE_LITE = '0DQOY2DjC1jLSZ7MNR74j8gQqVujgmVq';
   { Esta CONSTANTE deve ser utilizada quando a instituição não utiliza anosemestre,
      então por padrão o anosemestre será o valor que estiver na constante ANOSEMESTRE_PADRAO }
   ANOSEMESTRE_PADRAO = 1;

type
   TNota = record
      vl_nota: Double;
      IsNull: Boolean;
   end;

              
type
   TMySQLClientOption = (
    opCompress,             // CLIENT_COMPRESS
    opConnectWithDb,        // CLIENT_CONNECT_WITH_DB
    opFoundRows,            // CLIENT_FOUND_ROWS
    opIgnoreSigpipe,        // CLIENT_IGNORE_SIGPIPE
    opIgnoreSpace,          // CLIENT_IGNORE_SPACE
    opInteractive,          // CLIENT_INTERACTIVE
    opLocalFiles,           // CLIENT_LOCAL_FILES
    opLongFlag,             // CLIENT_LONG_FLAG
    opLongPassword,         // CLIENT_LONG_PASSWORD
    opMultiResults,         // CLIENT_MULTI_RESULTS
    opMultiStatements,      // CLIENT_MULTI_STATEMENTS
    opNoSchema,             // CLIENT_NO_SCHEMA
    opODBC,                 // CLIENT_ODBC
    opProtocol41,           // CLIENT_PROTOCOL_41
    opRememberOptions,      // CLIENT_REMEMBER_OPTIONS
    opReserved,             // CLIENT_RESERVED
    opSecureConnection,     // CLIENT_SECURE_CONNECTION
    opSSL,                  // CLIENT_SSL
    opTransactions          // CLIENT_TRANSACTIONS
    );
  TMySQLClientOptions = set of TMySQLClientOption;

type
   TAvisosRecalculoCreditos = (
      NenhumTituloEncontrado,
      NovoTituloGerado,
      SemTituloPendente,
      ProcedimentoExecutado
   );

type
  TAcaoRemessa = (arBaixa, arCancelar, arDesconto,
                    arProtestar, arEstornar, arAltMensalidade, arNegociar, arProrrogar, arImpBoleto, arGerarMensalidade, arBaixaDDA , arCancelamentoDDA);
  TStrSituacoes = (sitDescricao, sitSigla, sitCodigo, sitTexto);

  TPendenciaMatricula = (pmFinanceiro, pmDocumentacao);
  TPendenciasMatricula = set of TPendenciaMatricula;

   TDataModule = class(AUMDataModule)    
   end;

  TDM = class(TDataModule)
    tblModulos: TZTable;
    tblModulosCodigo: TSmallintField;
    tblMatriculas: TUMZQuery;
    tblMatriculasCodigoAluno: TIntegerField;
    tblMatriculasTurma: TStringField;
    tblMatriculasDataEmissao: TDateTimeField;
    tblMatriculasUsuario: TStringField;
    tblMatriculasPlanoPagamento: TIntegerField;
    tblMatriculasSituacao: TSmallintField;
    tblMatriculasImpresso: TStringField;
    tblMatriculasDataSaida: TDateTimeField;
    tblMatriculasPlanoDesconto: TIntegerField;
    tblMatriculasDiploma: TStringField;
    dtcMatriculas: TDataSource;
    tblMatriculasAnoSemestre: TSmallintField;
    dtcMensalidades: TDataSource;
    dtcAlunoMens: TDataSource;
    dtcMotivos: TDataSource;
    tblBonus: TZTable;
    tblBonusAlunoBeneficiado: TIntegerField;
    tblBonusAlunoIndicado: TIntegerField;
    tblBonusAnoSemestre: TIntegerField;
    tblBonusValorBonus: TFloatField;
    tblBonusPercentualBonus: TFloatField;
    tblBonusDescontoAplicado: TStringField;
    tblMensBloq: TUMZQuery;
    tblMensBloqCodigoAluno: TIntegerField;
    tblMensBloqParcela: TSmallintField;
    tblMensBloqDataVencimento: TDateTimeField;
    tblMensBloqTurma: TStringField;
    tblMensBloqDataEmissao: TDateTimeField;
    tblMensBloqNossoNumero: TStringField;
    tblMensBloqValorBruto: TFloatField;
    tblMensBloqValorDesconto: TFloatField;
    tblMensBloqDescontoExtra: TFloatField;
    tblMensBloqValorExtra: TFloatField;
    tblMensBloqValorTotal: TFloatField;
    tblMensBloqValorJuros: TFloatField;
    tblMensBloqValorPago: TFloatField;
    tblMensBloqDataPagamento: TDateTimeField;
    tblMensBloqSituacao: TSmallintField;
    tblMensBloqUsuario: TStringField;
    tblMensBloqBloqueto: TStringField;
    tblMensBloqAnoSemestre: TSmallintField;
    tblMensBloqDataBaseCorrecao: TDateTimeField;
    tblMensBloqIndiceCorrecao: TFloatField;
    tblPoupanca: TUMZQuery;
    tblControle: TUMZQuery;
    tblCaixa: TUMZQuery;
    tblFichaIndividual: TUMZQuery;
    tblFichaIndividualCodigoAluno: TIntegerField;
    tblFichaIndividualTurma: TStringField;
    tblFichaIndividualAnoSemestre: TSmallintField;
    tblFichaIndividualCurso: TStringField;
    tblFichaIndividualNota1: TFloatField;
    tblFichaIndividualNota2: TFloatField;
    tblFichaIndividualNota3: TFloatField;
    tblFichaIndividualNota4: TFloatField;
    tblFichaIndividualNotaExame: TFloatField;
    tblFichaIndividualSituacao: TSmallintField;
    tblCursosTurma: TUMZQuery;
    tblProfessores: TUMZQuery;
    tblProfessoresDisciplinas: TUMZQuery;
    tblTurmas: TUMZQuery;
    tblTurmasCodigo: TStringField;
    tblTurmasAnoSemestre: TSmallintField;
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
    tblTurmasDiasSemanaisLetivos: TStringField;
    tblTurmasHorarioLetivo: TStringField;
    tblTurmasHorasAula: TStringField;
    tblCursos: TUMZQuery;
    tblCursosCodigo: TStringField;
    tblCursosAnoSemestre: TSmallintField;
    tblCursosDescricao: TStringField;
    tblDeptoCursoTurma: TUMZQuery;
    tblDeptoCursoTurmaCodigo: TStringField;
    tblDeptoCursoTurmaAnoSemestre: TSmallintField;
    tblDeptoCursoTurmaCurso: TStringField;
    tblDeptoCursoTurmaDepto: TSmallintField;
    qryMatricularProvas: TUMZQuery;
    tblDisciplinas: TUMZQuery;
    tblDisciplinasCodigo: TSmallintField;
    tblDisciplinasSigla: TStringField;
    tblDisciplinasDescricao: TStringField;
    dtcFichaIndividual: TDataSource;
    tblFichaIndividualExame1: TFloatField;
    tblFichaIndividualExame2: TFloatField;
    tblFichaIndividualExame3: TFloatField;
    tblFichaIndividualExame4: TFloatField;
    tblNotas: TUMZQuery;
    dtcNotas: TDataSource;
    tblNotasAnoSemestre: TSmallintField;
    tblNotasCodigoAluno: TIntegerField;
    tblNotasTurma: TStringField;
    tblNotasDisciplina: TSmallintField;
    tblNotasBimestre: TSmallintField;
    tblNotasN1: TFloatField;
    tblNotasN2: TFloatField;
    tblNotasN3: TFloatField;
    tblNotasN4: TFloatField;
    tblNotasN5: TFloatField;
    tblNotasN6: TFloatField;
    tblNotasN7: TFloatField;
    tblNotasN8: TFloatField;
    tblNotasN9: TFloatField;
    tblNotasN10: TFloatField;
    tblNotasNAdicional: TFloatField;
    tblFichaIndividualUsuario: TIntegerField;
    tblMatriculasTurmaDependencia: TStringField;
    tblMatriculasCurso: TStringField;
    tblMatriculasDataEntrada: TDateTimeField;
    dtcEscolas: TDataSource;
    tblPlanos: TUMZQuery;
    tblPlanosCodigo: TIntegerField;
    tblPlanosAnoSemestre: TSmallintField;
    tblPlanosDescricao: TStringField;
    tblPlanosTurma: TStringField;
    tblPlanosParcelas: TSmallintField;
    tblPlanosValorCobrado: TFloatField;
    tblPlanosValorContrato: TFloatField;
    tblPlanosTaxaMaterial: TFloatField;
    tblPlanosTaxaApostila: TFloatField;
    tblPlanosDesconto: TFloatField;
    tblPlanosMatricula: TFloatField;
    tblPlanosApartir: TDateTimeField;
    tblPlanosNumeroTaxasMaterial: TSmallintField;
    tblItensPagamento: TUMZQuery;
    tblItensPagamentoCodigoPlano: TIntegerField;
    tblItensPagamentoMes: TSmallintField;
    tblItensPagamentoParcela: TSmallintField;
    tblItensPagamentoValorBruto: TFloatField;
    tblItensPagamentoValorDesconto: TFloatField;
    tblItensPagamentoValorExtra: TFloatField;
    tblItensPagamentoDescontoExtra: TFloatField;
    tblItensPagamentoValorTotal: TFloatField;
    dtcPlanos: TDataSource;
    tblDeptos: TUMZQuery;
    dtcDeptos: TDataSource;
    tblDeptosCodigo: TSmallintField;
    tblDeptosDescricao: TStringField;
    tblFichaIndividualGrau: TSmallintField;
    tblFichaIndividualSerie: TSmallintField;
    tblFichaIndividualMediaFinal: TFloatField;
    tblFichaIndividualCodigoEscola: TSmallintField;
    tblMatriculasQualSituacao: TStringField;
    qryUpdate: TUMZQuery;
    qrySum: TUMZQuery;
    tblGrade: TUMZQuery;
    tblGradeCurso: TStringField;
    tblGradeDisciplina: TSmallintField;
    tblGradeSerie: TSmallintField;
    tblGradeNumeroAulas: TFloatField;
    tblGradeValor: TFloatField;
    tblDeptoCursoTurmaSerie: TSmallintField;
    qryMax: TUMZQuery;
    tblUsuarios: TUMZQuery;
    tblFeriadosFilha: TUMZQuery;
    tblMotivos: TUMZQuery;
    tblMotivosCodigoAluno: TIntegerField;
    tblMotivosParcela: TSmallintField;
    tblMotivosDataMotivo: TDateTimeField;
    tblMotivosAutorizadoPor: TIntegerField;
    tblControleBonus: TUMZQuery;
    tblControleBonusCodigo: TIntegerField;
    tblControleBonusDataCalculo: TDateTimeField;
    tblControleBonusUsuario: TStringField;
    tblGradeTurno: TStringField;
    tblDeptoCursoTurmaTurno: TStringField;
    tblDisciplinasCurso: TStringField;
    tblDiscGrade: TUMZQuery;
    tblDiscGradeTurno: TStringField;
    tblDiscGradeSerie: TSmallintField;
    tblDiscGradeCurso: TStringField;
    tblDiscGradeGrau: TSmallintField;
    tblGradeCodigo: TStringField;
    tblDiscGradeCodigo: TStringField;
    tblFichaIndividualCodigoGrade: TStringField;
    tblCursosDepto: TSmallintField;
    tblNNBB: TUMZQuery;
    tblNNBBNumeroBB: TIntegerField;
    tblPI: TUMZQuery;
    tblPICodigoAluno: TIntegerField;
    tblPITurma: TStringField;
    tblPIAnoSemestre: TSmallintField;
    tblPINotaRedacao: TFloatField;
    tblPINotaProva: TFloatField;
    tblPIMediaInstitucional: TFloatField;
    quReprovaFreq: TUMZQuery;
    quReprova2aEp: TUMZQuery;
    tblDeptoCursoTurmaGrau: TSmallintField;
    tblProfessoresDisciplinasProfessor: TIntegerField;
    tblProfessoresDisciplinasDisciplina: TSmallintField;
    tblProfessoresDisciplinasCurso: TStringField;
    tblProfessoresDisciplinasCodigo: TSmallintField;
    tblProfessoresDisciplinasOrdem: TSmallintField;
    tblProfessoresDisciplinasCurso_1: TStringField;
    tblProfessoresDisciplinasSigla: TStringField;
    tblProfessoresDisciplinasDescricao: TStringField;
    tblFichaIndividualMediaAnual: TFloatField;
    tblFichaIndividualAproveitamento: TStringField;
    tblFichaIndividualTurmaMatricula: TStringField;
    tblMensalidades: TUMZQuery;
    tblMensalidadesCodigoAluno: TIntegerField;
    tblMensalidadesParcela: TSmallintField;
    tblMensalidadesDataVencimento: TDateTimeField;
    tblMensalidadesTurma: TStringField;
    tblMensalidadesDataEmissao: TDateTimeField;
    tblMensalidadesNossoNumero: TStringField;
    tblMensalidadesValorBruto: TFloatField;
    tblMensalidadesValorDesconto: TFloatField;
    tblMensalidadesDescontoExtra: TFloatField;
    tblMensalidadesValorExtra: TFloatField;
    tblMensalidadesValorTotal: TFloatField;
    tblMensalidadesValorJuros: TFloatField;
    tblMensalidadesValorPago: TFloatField;
    tblMensalidadesDataPagamento: TDateTimeField;
    tblMensalidadesSituacao: TSmallintField;
    tblMensalidadesUsuario: TStringField;
    tblMensalidadesBloqueto: TStringField;
    tblMensalidadesAnoSemestre: TSmallintField;
    tblMensalidadesDataBaseCorrecao: TDateTimeField;
    tblMensalidadesIndiceCorrecao: TFloatField;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesCurso: TStringField;
    tblMensalidadesDepto: TSmallintField;
    tblMensalidadesValorJurosCalc: TFloatField;
    tblMotivosMotivo: TMemoField;
    tblEmpresa: TUMZQuery;
    tblEmpresacd_empresa: TIntegerField;
    tblEmpresanm_empresa: TStringField;
    tblEmpresanm_razao_social: TStringField;
    tblEmpresads_endereco: TStringField;
    tblEmpresads_complemento: TStringField;
    tblEmpresads_bairro: TStringField;
    tblEmpresads_cidade: TStringField;
    tblEmpresads_estado: TStringField;
    tblEmpresads_cep: TStringField;
    tblEmpresanm_contato: TStringField;
    tblEmpresads_telefone1: TStringField;
    tblEmpresads_telefone2: TStringField;
    tblEmpresads_email: TStringField;
    tblEmpresads_site: TStringField;
    tblEmpresacd_area_atuacao: TIntegerField;
    tblTitulacoes: TZTable;
    tblTitulacoescd_titulacao: TIntegerField;
    tblTitulacoesds_titulacao: TStringField;
    tblFuncTipoAtuacao: TZTable;
    tblFuncTipoAtuacaocd_tipo_atuacao: TSmallintField;
    tblFuncTipoAtuacaods_tipo_atuacao: TStringField;
    tblEmpresas: TZTable;
    tblEmpresascd_empresa: TIntegerField;
    tblEmpresasnm_empresa: TStringField;
    tblEmpresasnm_razao_social: TStringField;
    tblEmpresasds_endereco: TStringField;
    tblEmpresasds_complemento: TStringField;
    tblEmpresasds_bairro: TStringField;
    tblEmpresasds_cidade: TStringField;
    tblEmpresasds_estado: TStringField;
    tblEmpresasds_cep: TStringField;
    tblEmpresasnm_contato: TStringField;
    tblEmpresasds_telefone1: TStringField;
    tblEmpresasds_telefone2: TStringField;
    tblEmpresasds_email: TStringField;
    tblEmpresasds_site: TStringField;
    tblEmpresascd_area_atuacao: TIntegerField;
    tblRegimeTrabalho: TZTable;
    tblRegimeTrabalhocd_regime: TIntegerField;
    tblRegimeTrabalhods_regime: TStringField;
    tblProf_Ativ_Evento: TZTable;
    tblProf_Ativ_Eventocd_tipo_participa: TIntegerField;
    tblProf_Ativ_Eventods_tipo_participa: TStringField;
    tblProf_Tipo_Atividade: TZTable;
    tblProf_Tipo_Atividadecd_ativadade: TSmallintField;
    tblProf_Tipo_Atividadeds_atividade: TStringField;
    tblContatosTipos: TUMZQuery;
    tblContatosTiposcd_contato: TIntegerField;
    tblContatosTiposds_contato: TStringField;
    tblEditoras: TZTable;
    tblProfessorescd_pessoa: TIntegerField;
    tblProfessoresnm_pessoa: TStringField;
    tblProfessoresnm_apelido: TStringField;
    tblFichaIndividualNota5: TFloatField;
    tblFichaIndividualExame5: TFloatField;
    tblFichaIndividualNota6: TFloatField;
    tblFichaIndividualExame6: TFloatField;
    tblFichaIndividualNota7: TFloatField;
    tblFichaIndividualExame7: TFloatField;
    tblFichaIndividualNota8: TFloatField;
    tblFichaIndividualExame8: TFloatField;
    tblFichaIndividualNota9: TFloatField;
    tblFichaIndividualExame9: TFloatField;
    tblFichaIndividualNota10: TFloatField;
    tblFichaIndividualExame10: TFloatField;
    tblFichaIndividualArrumarDiario: TStringField;
    tblEditorasCODIGOEDITORA: TIntegerField;
    tblEditorasEDITORA: TStringField;
    tblFuncFuncoes: TUMZQuery;
    tblFuncFuncoescd_funcao: TSmallintField;
    tblFuncFuncoesds_funcao: TStringField;
    tblIngressos: TZTable;
    tblIngressoscd_ingresso: TIntegerField;
    tblIngressosds_ingresso: TStringField;
    tblFichaIndividualSegunda_Epoca: TFloatField;
    tblPlanoDesc: TUMZQuery;
    tblPlanoDesccodigo: TIntegerField;
    tblPlanoDescdescricaoplano: TStringField;
    tblPlanoDescpercentualdesconto: TFloatField;
    tblPlanoDescvalordesconto: TFloatField;
    tblModulosUsuarios: TUMZQuery;
    tblModulosUsuarioscodigousuario: TIntegerField;
    tblModulosUsuarioscodigomodulo: TSmallintField;
    tblModulosUsuariosincluir: TStringField;
    tblModulosUsuariosalterar: TStringField;
    tblModulosUsuariosdeletar: TStringField;
    tblModulosUsuariosacessar: TStringField;
    tblModulosUsuariosespecial: TStringField;
    tblProf_Categorias: TUMZQuery;
    tblProf_Categoriascd_categoria: TSmallintField;
    tblProf_Categoriasds_categoria: TStringField;
    tblProf_Categoriasds_ascensao: TStringField;
    tblContatosTipossn_padrao: TStringField;
    tblMensalidadestipoparcela: TSmallintField;
    tblAvaliacao: TUMZQuery;
    tblAvaliacaocd_avaliacao: TSmallintField;
    tblAvaliacaods_avaliacao: TStringField;
    tblAvaliacaonr_avaliacoes: TSmallintField;
    tblAvaliacaocd_periodo_avaliacao: TSmallintField;
    tblAvaliacaods_cond_aprov_direta: TStringField;
    tblAvaliacaods_cond_repro_direta: TStringField;
    tblAvaliacaods_formula_media_exame: TStringField;
    tblAvaliacaods_formula_media_segunda: TStringField;
    tblAvaliacaods_cond_aprov_exame: TStringField;
    tblAvaliacaods_cond_aprov_segunda: TStringField;
    tblAvaliacaonr_max_disci_exame: TSmallintField;
    tblAvaliacaonr_max_disci_segunda: TSmallintField;
    tblAvaliacaosn_notas: TStringField;
    tblAvaliacaosn_conceitos: TStringField;
    tblAvaliacaosn_descricao: TStringField;
    tblAvaliacaosn_exame: TStringField;
    tblAvaliacaosn_pi: TStringField;
    tblAvaliacaosn_segunda_epoca: TStringField;
    tblAvaliacaosn_frequencia_global: TStringField;
    tblAvaliacaods_frequencia_tipo: TStringField;
    tblAvaliacaosn_recuperacao: TStringField;
    tblAvaliacaods_formula_recuperacao: TStringField;
    tblAvaliacaocodigo: TStringField;
    tblAvaliacaoanosemestre: TSmallintField;
    tblCalc: TUMZQuery;
    tblAvaliacaods_formula_media_final: TStringField;
    tblAvaliacaonr_casas_decimais: TSmallintField;
    tblAvaliacaods_cond_recuperacao: TStringField;
    tblAvaliacaovl_arredondamento: TFloatField;
    tblAvaliacaods_periodo_abreviado: TStringField;
    tblAvaliacaods_periodicidade: TStringField;
    qAux1: TUMZQuery;
    qAux2: TUMZQuery;
    tblMensa: TUMZQuery;
    tblParametros: TUMZQuery;
    tblAvaliacaods_formula_media_anual: TMemoField;
    tblMensalidadesocorrencia_remessa: TSmallintField;
    tblMensalidadesocorrencia_retorno: TSmallintField;
    tblSituacoes: TUMZQuery;
    tblSituacoescd_situacao: TIntegerField;
    tblSituacoesds_situacao: TStringField;
    tblSituacoesds_sigla_situacao: TStringField;
    dsSituacao: TDataSource;
    tblPlanoscurso: TStringField;
    tblPlanossn_creditos: TStringField;
    tblPlanosnr_creditos_base: TFloatField;
    tblItensPagamentonr_dia: TSmallintField;
    tblItensPagamentonr_ano: TSmallintField;
    tblItensPagamentonr_creditos_minimos: TFloatField;
    tblItensPagamentosn_credito_parcela: TStringField;
    qryInsert: TUMZQuery;
    dsInstituicoes: TDataSource;
    dtcPlanoDesc: TDataSource;
    tblMensalidadessn_credito_parcela: TStringField;
    tblMensalidadesnr_creditos: TFloatField;
    tblAvaliacaosn_notas_diario_online: TStringField;
    tblAvaliacaosn_notas_diario: TStringField;
    tblAvaliacaosn_desblo_coorde: TStringField;
    tblAvaliacaosn_diario_imp_notas: TStringField;
    tblAvaliacaosn_diario_imp_freqs: TStringField;
    tblAvaliacaosn_notas_truncar: TStringField;
    tblAvaliacaosn_diario_imp_contprog: TStringField;
    tblAvaliacaods_nota_exame: TStringField;
    tblAvaliacaods_nota_segunda: TStringField;
    tblInstituicoes: TUMZQuery;
    tblInstituicoesnm_instituicao: TStringField;
    tblInstituicoesds_endereco: TStringField;
    tblInstituicoesds_complemento: TStringField;
    tblInstituicoesds_bairro: TStringField;
    tblInstituicoesds_cidade: TStringField;
    tblInstituicoesds_estado: TStringField;
    tblInstituicoesds_cep: TStringField;
    tblInstituicoesds_diretor: TStringField;
    tblInstituicoesds_tipo: TStringField;
    tblInstituicoesds_telefone1: TStringField;
    tblInstituicoesds_telefone2: TStringField;
    tblInstituicoesds_email: TStringField;
    tblInstituicoesds_site: TStringField;
    tblInstituicoessn_educacao_infantil: TStringField;
    tblInstituicoessn_ensino_fundamental: TStringField;
    tblInstituicoessn_ensino_medio: TStringField;
    tblInstituicoessn_ensino_superior: TStringField;
    tblInstituicoessn_cursos_profissionalizantes: TStringField;
    tblInstituicoessn_ensino_especial: TStringField;
    dbDocs: TZConnection;
    tblAvaliacaosn_medias_truncar: TStringField;
    tblAvaliacaosn_anual_truncar: TStringField;
    dtcMoticos2: TDataSource;
    qyMotivos: TUMZQuery;
    qyMotivoscd_aluno: TIntegerField;
    qyMotivoscd_multa: TIntegerField;
    qyMotivosdt_motivo: TDateTimeField;
    qyMotivosmotivo: TMemoField;
    qyMotivoscd_autorizadopor: TIntegerField;
    tblNomeAcervo: TUMZQuery;
    tblNomeAcervoCODIGOLIVRO: TIntegerField;
    tblNomeAcervoTITULO: TStringField;
    tblNomeAcervoEMPRESTADO: TStringField;
    tblNomeAcervoEMPRESTIMO: TStringField;
    tblNomeAcervoTIPO: TStringField;
    tblNomeAcervocodigotipo: TStringField;
    tblNomeAcervoqt_dias_emp_aluno: TIntegerField;
    tblNomeAcervoqt_dias_emp_professor: TIntegerField;
    tblNomeAcervoqt_dias_emp_funcionario: TIntegerField;
    tblNomeAcervoqt_dias_emp_pessoa: TIntegerField;
    tblNomeAcervovl_multa_dia: TFloatField;
    tblNomeAcervoSN_EMPRESTIMO: TStringField;
    tblNomeAcervoqt_emp_aluno: TIntegerField;
    tblNomeAcervoqt_emp_professor: TIntegerField;
    tblNomeAcervoqt_emp_funcionario: TIntegerField;
    tblNomeAcervoqt_emp_pessoa: TIntegerField;
    dsSituacoesFinanceiras: TDataSource;
    tblSituacoesFinanceiras: TUMZQuery;
    tblControlecd_abertura_caixa: TIntegerField;
    tblControledt_abertura: TDateTimeField;
    tblControledt_fechamento: TDateTimeField;
    tblControlecd_conta_banco: TIntegerField;
    tblControlevl_saldo_abertura: TFloatField;
    tblControlevl_saldo_fechamento: TFloatField;
    tblControleds_situacao: TStringField;
    tblControlecd_usuario: TIntegerField;
    tblCaixacd_movimento_te: TIntegerField;
    tblCaixacd_caixa: TIntegerField;
    tblCaixacd_abertura_caixa: TIntegerField;
    tblCaixadt_movimento: TDateTimeField;
    tblCaixacd_acao: TIntegerField;
    tblCaixanr_documento: TStringField;
    tblCaixads_movimento: TStringField;
    tblCaixadt_liberacao: TDateTimeField;
    tblCaixacd_origem: TSmallintField;
    tblCaixads_observacao: TMemoField;
    tblCaixatp_entrada_saida: TSmallintField;
    tblCaixavl_movimento: TFloatField;
    tblCaixavl_saldo: TFloatField;
    tblCaixavl_dinheiro: TFloatField;
    tblCaixavl_cheque: TFloatField;
    tblMensalidadescd_mensalidade: TIntegerField;
    tblCaixacd_mensalidade: TIntegerField;
    tblCaixacd_usuario: TIntegerField;
    qyAux: TUMZQuery;
    tblMensalidadescd_mensalidade_origem: TIntegerField;
    qyAreasAtuacao: TUMZQuery;
    qyAreasAtuacaocd_area_atuacao: TIntegerField;
    qyAreasAtuacaods_area_atuacao: TStringField;
    srcAreasAtuacao: TDataSource;
    qyAux1: TUMZQuery;
    qyAux2: TUMZQuery;
    qyTiposConta: TUMZQuery;
    qyTiposContacd_tipo: TSmallintField;
    qyTiposContads_tipo: TStringField;
    srcTiposConta: TDataSource;
    qyTiposAcoes: TUMZQuery;
    qyTiposAcoescd_tipo_acao: TSmallintField;
    qyTiposAcoesds_tipo_acao: TStringField;
    srcTiposAcoes: TDataSource;
    qyLogsAcessos: TUMZQuery;
    qyLogsAcessoscd_modulo: TIntegerField;
    qyLogsAcessosdt_log: TDateTimeField;
    qyLogsAcessoshr_log: TTimeField;
    qyLogsAcessoscd_usuario: TIntegerField;
    qyLogsAcessossn_acessou: TStringField;
    qyLogsAcessossn_incluiu: TStringField;
    qyLogsAcessossn_alterou: TStringField;
    qyLogsAcessossn_excluiu: TStringField;
    qyTiposTitulo: TUMZQuery;
    qyTiposTitulods_tipo_titulo: TStringField;
    qyTiposTituloct_tipo_titulo: TSmallintField;
    srcTiposTitulo: TDataSource;
    tblMensalidadesvalorjuros_fixo: TFloatField;
    qyRecalculoFreq: TUMZQuery;
    tblAvaliacaosn_diario_online: TSmallintField;
    tblAvaliacaosn_diario_eletro: TIntegerField;
    tblAvaliacaosn_diario_online_provas: TSmallintField;
    tblAvaliacaosn_diario_online_aulas: TSmallintField;
    tblAvaliacaosn_diario_online_recalc_medias: TSmallintField;
    tblAvaliacaosn_diario_online_bloque_aulas: TIntegerField;
    tblAvaliacaosn_diario_online_bloque_provas: TIntegerField;
    tblAvaliacaonr_casas_decimais_forcado: TIntegerField;
    tblAvaliacaosn_altera_notas_direta: TIntegerField;
    tblFichaIndividualnota_d1: TFloatField;
    tblFichaIndividualnota_d2: TFloatField;
    tblFichaIndividualnota_d3: TFloatField;
    tblFichaIndividualnota_d4: TFloatField;
    tblFichaIndividualnota_d5: TFloatField;
    tblFichaIndividualnota_d6: TFloatField;
    tblFichaIndividualnota_d7: TFloatField;
    tblFichaIndividualnota_d8: TFloatField;
    tblFichaIndividualnota_d9: TFloatField;
    tblFichaIndividualnota_d10: TFloatField;
    tblAvaliacaosn_converter_notas_nulas: TIntegerField;
    tblFichaIndividualsn_bloqueado1: TSmallintField;
    tblFichaIndividualsn_bloqueado2: TSmallintField;
    tblFichaIndividualsn_bloqueado3: TSmallintField;
    tblFichaIndividualsn_bloqueado4: TSmallintField;
    tblFichaIndividualsn_bloqueado5: TSmallintField;
    tblFichaIndividualsn_bloqueado6: TSmallintField;
    tblFichaIndividualsn_bloqueado7: TSmallintField;
    tblFichaIndividualsn_bloqueado8: TSmallintField;
    tblFichaIndividualsn_bloqueado9: TSmallintField;
    tblFichaIndividualsn_bloqueado10: TSmallintField;
    tblFichaIndividualfrequencia: TFloatField;
    tblCaixacd_coligada: TSmallintField;
    tblCaixasn_compensado: TSmallintField;
    tblCaixacd_forma_pgto: TIntegerField;
    tblCaixadt_registro: TDateTimeField;
    tblCaixanr_cheque: TIntegerField;
    tblMensalidadescd_coligada: TSmallintField;
    tblMotivosturma: TStringField;
    qyTiposTitulocd_coligada: TSmallintField;
    tblMensalidadescd_tipo_titulo: TSmallintField;
    qyTitulosReceita: TUMZQuery;
    SmallintField1: TSmallintField;
    StringField3: TStringField;
    SmallintField2: TSmallintField;
    tblMensalidadesds_tipo_titulo: TStringField;
    tblMensalidadesdt_competencia: TDateTimeField;
    tblAvaliacaosn_copiar_conteudo_pordata: TSmallintField;
    tblAvaliacaosn_ajuste_apos_recuperacao: TSmallintField;
    tblAvaliacaotp_ajuste_forcado: TSmallintField;
    tblAvaliacaotp_ajuste_forcado_media: TSmallintField;
    tblAvaliacaosn_mostrar_alunos_curs_padrao: TSmallintField;
    tblAvaliacaosn_ins_aulas_semhorario: TSmallintField;
    tblAvaliacaods_formula_padrao: TStringField;
    tblAvaliacaosn_obrigar_formula_padrao: TSmallintField;
    tblAvaliacaods_formula_media_sem_pi: TStringField;
    tblMensalidadesds_historico: TStringField;
    tblAvaliacaods_criterio_recuperacao: TStringField;
    tblMensalidadeshr_atual: TStringField;
    tblMensalidadesdt_atual: TStringField;
    tblEstados: TUMZQuery;
    tblEstados2: TUMZQuery;
    tblAvaliacaods_formula_periodo: TStringField;
    tblAvaliacaosn_diario_online_mostra_ajuste: TSmallintField;
    tblAvaliacaods_condicao_situacao_periodo: TStringField;
    tblAvaliacaosn_usar_media_curso: TSmallintField;
    tblAvaliacaods_formula_media_curso: TStringField;
    tblAvaliacaods_sigla: TMemoField;
    tblMensalidadescd_caixa: TIntegerField;
    tblMensalidadescd_resp: TIntegerField;
    tblMensalidadesvl_pago_moeda: TFloatField;
    tblModulosUsuariosmodulo: TStringField;
    tblFichaIndividualds_media: TStringField;
    qyLastInsert: TUMZQuery;
    tblMensalidadesvl_credito: TFloatField;
    tblMensalidadesdt_credito: TDateTimeField;
    tblSituacoesFinanceirassn_protesto: TSmallintField;
    tblSituacoesFinanceirascd_situacao: TIntegerField;
    tblSituacoesFinanceirasds_situacao: TStringField;
    tblSituacoesFinanceirasds_sigla_situacao: TStringField;
    tblMensalidadessn_liberar_juros: TSmallintField;
    tblMensalidadessn_liberar_descontos: TSmallintField;
    tblMensalidadesds_deposito: TStringField;
    tblAvaliacaosn_extra_classe: TSmallintField;
    tblAvaliacaosn_descricao_fixa: TStringField;
    tblAvaliacaosn_freque_pergunta: TSmallintField;
    tblAvaliacaosn_freque_pergunta_padrao: TSmallintField;
    tblAvaliacaosn_professor_fecha_diario: TSmallintField;
    tblAvaliacaosn_profes_digita_peso: TStringField;
    tblAvaliacaonr_qtd_aulas_impressao: TSmallintField;
    tblEscolas: TUMZQuery;
    tblEscolasnm_instituicao: TStringField;
    tblEscolasds_endereco: TStringField;
    tblEscolasds_complemento: TStringField;
    tblEscolasds_bairro: TStringField;
    tblEscolasds_cidade: TStringField;
    tblEscolasds_estado: TStringField;
    tblEscolasds_cep: TStringField;
    tblEscolasds_diretor: TStringField;
    tblEscolasds_tipo: TStringField;
    tblEscolasds_telefone1: TStringField;
    tblEscolasds_telefone2: TStringField;
    tblEscolasds_email: TStringField;
    tblEscolasds_site: TStringField;
    tblEscolassn_educacao_infantil: TStringField;
    tblEscolassn_ensino_fundamental: TStringField;
    tblEscolassn_ensino_medio: TStringField;
    tblEscolassn_ensino_superior: TStringField;
    tblEscolassn_cursos_profissionalizantes: TStringField;
    tblEscolassn_ensino_especial: TStringField;
    tblAvaliacaods_formula_pi: TStringField;
    tblMensalidadesValorDescontoCalc: TCurrencyField;
    tblSituacoescd_situacao_pai: TIntegerField;
    tblAvaliacaocd_situacao_aprov_direta: TIntegerField;
    tblAvaliacaocd_situacao_aprov_exame: TIntegerField;
    tblAvaliacaocd_situacao_aprov_2epoca: TIntegerField;
    qyAreasConhecimento: TUMZQuery;
    qyAreasConhecimentocd_area: TIntegerField;
    qyAreasConhecimentods_area: TStringField;
    qTemp: TUMZQuery;
    QyProvas: TUMZQuery;
    tblFichaIndividualdisciplina: TIntegerField;
    tblAvaliacaonr_media_proficiencia: TFloatField;
    tblFichaIndividualsn_bloq_freq_global: TSmallintField;
    tblFichaIndividualsn_bloq_freq1: TSmallintField;
    tblFichaIndividualsn_bloq_freq2: TSmallintField;
    tblFichaIndividualsn_bloq_freq3: TSmallintField;
    tblFichaIndividualsn_bloq_freq4: TSmallintField;
    tblFichaIndividualsn_bloq_freq5: TSmallintField;
    tblFichaIndividualsn_bloq_freq6: TSmallintField;
    tblFichaIndividualsn_bloq_freq7: TSmallintField;
    tblFichaIndividualsn_bloq_freq8: TSmallintField;
    tblFichaIndividualsn_bloq_freq9: TSmallintField;
    tblFichaIndividualsn_bloq_freq10: TSmallintField;
    qryTaxaRecorrencia: TUMZQuery;
    qryTaxaRecorrenciacodigoaluno: TIntegerField;
    qryTaxaRecorrenciadisciplina: TIntegerField;
    qryTaxaRecorrenciacurso: TStringField;
    qryTaxaRecorrenciacd_tipo_titulo: TSmallintField;
    qryTaxaRecorrenciacd_conta: TIntegerField;
    qryTaxaRecorrenciavl_padrao: TFloatField;
    qryTaxaRecorrencianr_parcela: TSmallintField;
    qryTaxaRecorrenciadepto: TSmallintField;
    qryTaxaRecorrenciadt_vencto: TDateTimeField;
    qryTaxaRecorrenciadescricao: TStringField;
    qryTaxaRecorrenciacodigograde: TStringField;
    qryUpdFichaIndividual: TUMZQuery;
    qryTaxaRecorrenciacd_centro: TIntegerField;
    tblAvaliacaosn_falta_exame_forca_2epoca: TSmallintField;
    tblAvaliacaocd_disci_frequencia: TLargeintField;
    tblAvaliacaonr_maximo_aulas: TLargeintField;
    tblAvaliacaonr_periodos: TLargeintField;
    tblAvaliacaocd_situacao_concluida: TLargeintField;
    tblAvaliacaonr_inicio_aulas_extras: TLargeintField;
    tblAvaliacaonr_dias_diario_bloq_provas: TLargeintField;
    qyTitulosReceitacd_conta: TLargeintField;
    tblMensalidadescd_centro_custo: TLargeintField;
    tblMensalidadescd_plano_conta: TLargeintField;
    tblMensalidadescd_usuario: TLargeintField;
    tblMensalidadescd_moeda: TLargeintField;
    tblMensalidadescd_moeda_pgto: TLargeintField;
    tblMensalidadescd_cheque_devolvido: TLargeintField;
    tblDeptoCursoTurmacd_centro: TLargeintField;
    tblDeptoCursoTurmacd_coligada: TIntegerField;
    tblPoupancaDATA: TDateTimeField;
    tblPoupancaINDICECORRIGIDO: TFloatField;
    qyTiposTitulocd_conta: TLargeintField;
    qyTiposTitulocd_tipo_titulo: TIntegerField;
    tblUsuariosNOME2: TStringField;
    tblUsuariosSENHA: TStringField;
    tblUsuariosSN_ONLINE: TStringField;
    tblPoupancaINDICEPOUPANCA: TFloatField;
    qyDataHoraAtual: TUMZQuery;
    qyUsuariosParametros: TUMZQuery;
    tblAvaliacaoNR_CASAS_FORCADO_MEDIA: TIntegerField;
    tblAvaliacaoSN_GERAR_TAXA_RECORRENCIA: TSmallintField;
    qryInsertHist: TUMZReadOnlyQuery;
    qrySelectDescontos: TUMZReadOnlyQuery;
    qrySelectDescontosDECONTO: TFloatField;
    qrySelectAcresc: TUMZReadOnlyQuery;
    qrySelectAcrescACRESCIMO: TFloatField;
    qrySelectCheques: TUMZReadOnlyQuery;
    qrySelectChequesCD_CHEQUE: TIntegerField;
    qrySelectChequesNR_VALOR: TFloatField;
    qrySelectChequesDS_CHEQUE: TStringField;
    qrySelectChequesCD_SITUACAO: TLargeintField;
    qrySelectChequesCD_CAIXA: TLargeintField;
    qrySelectChequesNM_PESSOA: TStringField;
    tblUsuariosCODIGO: TIntegerField;
    tblUsuariosCD_PESSOA: TIntegerField;
    qrySelectEqui: TUMZReadOnlyQuery;
    qrySelectEquiRESULTADO: TStringField;
    qryUpdFreqCH: TUMZQuery;
    qryUpdFreqA: TUMZQuery;
    qryDelRemDados: TUMZQuery;
    qryPermissoes: TUMZReadOnlyQuery;
    qryPermissoesCD_GRUPO: TIntegerField;
    qryPermissoesDS_NOME_GRUPO: TStringField;
    qryPermissoesCD_COLIGADA: TIntegerField;
    qryPermissoesDS_LOGIN: TStringField;
    qryPermissoesDS_SENHA: TStringField;
    qryPermissoesCD_PESSOA: TIntegerField;
    qryPermissoesNR_PERMISSAO: TIntegerField;
    qryPermissoesDS_NOME_ACAO: TStringField;
    qryPermissoesDS_NOME_MODULO: TStringField;
    qryPermissoesDS_CHAVE_ACAO: TStringField;
    qryPermissoesDS_CHAVE_MODULO: TStringField;
    tblCursosTurmaANOSEMESTRE: TSmallintField;
    tblCursosTurmaCD_CURSO: TStringField;
    tblCursosTurmaDS_CONTRATO: TStringField;
    tblCursosTurmaDS_REQUERIMENTO: TStringField;
    qryColigadas: TUMZQuery;
    qryColigadasCD_COLIGADA: TIntegerField;
    qryColigadasNM_COLIGADA: TStringField;
    qryColigadasTodas: TUMZQuery;
    qyTurmasProfessores: TUMZQuery;
    qyTurmasProfessoresanosemestre: TSmallintField;
    qyTurmasProfessorescurso: TStringField;
    qyTurmasProfessoresturma: TStringField;
    qyTurmasProfessoresdisciplina: TIntegerField;
    qyTurmasProfessoresprofessor: TIntegerField;
    tblInstituicoescd_instituicao: TIntegerField;
    tblEscolascd_instituicao: TIntegerField;
    tblAvaliacaosn_conceitos_parciais: TStringField;
    SQLMonitor: TZSQLMonitor;
    tblMensalidadessn_nfe_gerada: TIntegerField;
    tblFichaIndividualcarga_horaria: TFloatField;
    tblMensalidadesvalordesconto_fixo: TFloatField;
    tblFichaIndividualsn_faltou_exame: TSmallintField;
    tblFichaIndividualsn_faltou_2epoca: TSmallintField;
    qyValidaQtdAvaliacoes: TUMZQuery;
    qyValidaQtdAvaliacoesmensagem_retorno: TMemoField;
    tblMensalidadescd_autenticacao: TStringField;
    tblAvaliacaonr_casas_decimais_frequencia: TSmallintField;
    qyVerificaNotasLancada: TUMZQuery;
    qyVerificaNotasLancadaretorno: TSmallintField;
    qryMensaNegociacao: TUMZQuery;
    startConn: TUMZStartConnection;
    tblFichaIndividualsn_possui_adap: TSmallintField;
    tblFichaIndividualsn_possui_depen: TSmallintField;
    qyVerificaPermissaoLite: TUMZQuery;
    tblFichaIndividualTotalFaltas: TFloatField;
    tblFichaIndividualfalta1: TFloatField;
    tblFichaIndividualfalta2: TFloatField;
    tblFichaIndividualfalta3: TFloatField;
    tblFichaIndividualfalta4: TFloatField;
    tblFichaIndividualfalta5: TFloatField;
    tblFichaIndividualfalta6: TFloatField;
    tblFichaIndividualfalta7: TFloatField;
    tblFichaIndividualfalta8: TFloatField;
    tblFichaIndividualfalta9: TFloatField;
    tblFichaIndividualfalta10: TFloatField;
    db: TZConnection;
    StartConnDocs: TUMZStartConnection;
    qyStoredProc: TUMZQuery;
    tblFichaIndividualsn_bloqueio_nota_exame: TIntegerField;
    tblFichaIndividualsn_bloqueio_2epoca: TIntegerField;
    qryPreRequisitoEspecial: TUMZQuery;
    qryPreRequisitoEspecialds_tipo_req: TStringField;
    qryPreRequisitoEspecialme_tipo_sql: TMemoField;
    tblFichaIndividualsn_bloqueio_ds_media: TIntegerField;
    tblAvaliacaosn_diario_online_bloque_cont: TIntegerField;
    tblFeriadosMatriz: TUMZQuery;
    tblInstituicoessn_irregular: TSmallintField;
    TTempoOcioso: TTimer;
    tblAvaliacaoDisciplina: TUMZQuery;
    SmallintField3: TSmallintField;
    StringField1: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    StringField2: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    SmallintField6: TSmallintField;
    SmallintField7: TSmallintField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    SmallintField8: TSmallintField;
    StringField20: TStringField;
    SmallintField9: TSmallintField;
    StringField21: TStringField;
    FloatField1: TFloatField;
    StringField22: TStringField;
    StringField23: TStringField;
    MemoField1: TMemoField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    SmallintField10: TSmallintField;
    IntegerField1: TIntegerField;
    SmallintField11: TSmallintField;
    SmallintField12: TSmallintField;
    SmallintField13: TSmallintField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    SmallintField14: TSmallintField;
    SmallintField15: TSmallintField;
    SmallintField16: TSmallintField;
    SmallintField17: TSmallintField;
    SmallintField18: TSmallintField;
    SmallintField19: TSmallintField;
    StringField35: TStringField;
    SmallintField20: TSmallintField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    SmallintField21: TSmallintField;
    StringField39: TStringField;
    SmallintField22: TSmallintField;
    StringField40: TStringField;
    MemoField2: TMemoField;
    SmallintField23: TSmallintField;
    StringField41: TStringField;
    SmallintField24: TSmallintField;
    SmallintField25: TSmallintField;
    SmallintField26: TSmallintField;
    StringField42: TStringField;
    SmallintField27: TSmallintField;
    StringField43: TStringField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    FloatField2: TFloatField;
    SmallintField28: TSmallintField;
    SmallintField29: TSmallintField;
    LargeintField1: TLargeintField;
    LargeintField2: TLargeintField;
    LargeintField3: TLargeintField;
    LargeintField4: TLargeintField;
    LargeintField5: TLargeintField;
    LargeintField6: TLargeintField;
    StringField44: TStringField;
    SmallintField30: TSmallintField;
    IntegerField11: TIntegerField;
    tblAvaliacaosn_diario_online_freq_bloq_cont: TSmallintField;
    tblAvaliacaosn_diario_online_freq_bloq_digi: TSmallintField;
    tblAvaliacaosn_diario_online_compart_aula: TSmallintField;
    tblAvaliacaosn_diario_online_mostra_resp: TIntegerField;
    qryUpdateMultas: TUMZQuery;
    tblAvaliacaods_cond_repro_falta: TStringField;
    tblAvaliacaocd_situacao_reprov_falta: TIntegerField;
    tblFichaIndividualsn_dispensado_pi: TSmallintField;
    tblFichaIndividualdt_matricula: TDateTimeField;
    tblFichaIndividualdt_saida: TDateTimeField;
    tblGradeAnoSemestre: TLargeintField;
    tiRemessa: TTrayIcon;
    qryBuscaHistorico: TUMZQuery;
    qryDeletaHistorico: TUMZQuery;
    qryBuscaHistoricods_escola: TStringField;
    tblFichaIndividualdt_inclusao: TDateTimeField;
    procedure tblInstituicoesBeforePost(DataSet: TDataSet);
    procedure TTempoOciosoTimer(Sender: TObject);
    procedure tblFichaIndividualNotaExameGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure tblFichaIndividualnota_d1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure StartConnDocsDefaultConnection(Sender: TObject);
    procedure tblMatriculasAfterPost(DataSet: TDataSet);
    procedure startConnDefaultConnection(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SQLMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
    procedure tblMensalidadesBeforeOpen(DataSet: TDataSet);
    procedure qyLogsAcessosAfterInsert(DataSet: TDataSet);
    procedure tblCaixaBeforePost(DataSet: TDataSet);
    procedure tblMensalidadesBeforePost(DataSet: TDataSet);
    procedure DMCreate(Sender: TObject);
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure tblMensalidadesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure tblFichaIndividualBeforePost(DataSet: TDataSet);
    procedure tblMatriculasCalcFields(DataSet: TDataSet);
    procedure tblMotivosAfterInsert(DataSet: TDataSet);
    procedure tblMotivosAfterPost(DataSet: TDataSet);
    procedure tblFichaIndividualNota1GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure tblFichaIndividualAfterOpen(DataSet: TDataSet);
    procedure tblFichaIndividualFalta1GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure dbDocsBeforeConnect(Sender: TObject);
    procedure ExcluirParcela(cd_mensalidade: integer);
    function getNomeCaixa(cd_caixa: Integer) : string;
    procedure LimpaMensaNegociacao();
    procedure LimpaMensaNegociacaoPaga(cd_mensalidade : integer ; cd_pessoa : integer);
   private
      AUtilizaAnosemestre: Boolean;

      strMotivos : String;
      dblParcial : Double;
      // Variaveis criada para efetuar confirmacao de matricula
      ArrayValores : Array[0..20] of Single;
      ArrayDescontos : Array[0..20] of Single;
      ArrayDescontosExtra : Array[0..20] of Single;
      ArrayDatas : Array[0..20] of TDateTime;
      ArrayParcelas : Array[0..20] of Integer;
      ArrayValorExtra : Array[0..20] of Single;

      ArrayEstadoFromColigada : TStringList;
      ArrayCidadeFromColigada : TStringList;

      FDLLHandle: THandle;
      FDLLProc: procedure(Event: Pointer); stdcall;
    procedure ajustarAcoesDescontosCondicionaisBaixaParcial(
      iCodigoMensalidadeOrigem, iCodigoMensalidadeParcial: Integer; cDescontoCondicionalOriginal, cNovoDescontoCondicionalOrigem, cNovoDescontoCondicionalParcial: Currency);
    procedure copiarAcoesMovimentoCondicionais(iCodigoMensalidadeOrigem,
      iCodigoMensalidadeDestino: Integer);
      function releaseLockMySQL(chaveLock: String): Integer;
      function getLockMySQL(chaveLock: String; tempoEspera: Integer): Integer;
      function getNomeColigadaSelecionadaRazao: String;
      function getNomeColigadaSelecionada: String;

      function GetCdPessoaLogado: Integer;
      function GetLoginLogado: String;

      function TryLoadDebugger: Boolean;

      Function BuscaDisciplinasSemPI(CodigoAluno : Integer; TurmaMatricula : String; AnoSemestre :Integer) : string;
      procedure CalcularMediaCurso(iCodigoAluno: Longint; strTurma: string; intAnoSemestre: Integer; tblAvaliacao: TUMZQuery);
      {**
         Esta função consulta a tabela diário de provas para verificar quais são
         as provas cadastradas para uma determinada turma e disciplina na etapa
         do ano/semestre, exceto as provas marcadas como sn_compoe igual a 0.
         A função retorna uma string com o conjunto de notas que serão usadas
         para calcular a média do aluno.
      }
      function GetProvasCadastradas(const ASTurma: string; const AIAnoSemestre, AIDisciplina, AIBimestre: integer): string;
      procedure limparConnection();
      function ConectaUnimestre: boolean;

      { Carrega dois StringLists com informações da coligada (Cidade-Estado) }
      procedure LoadEstadoCidadeColigadas();

  public
    // Variável para Formatação de Datas, geralmente será utilizado para o Oracle, mas pode também ser usada para mysql
    fsDateTimeFormatPadrao : TFormatSettings;

    paramTempoInatividade: Integer;

    { Lista de Situações que será resgatada da tabela }
    LogouNaFilha, lite, isCliente     : Boolean;
    iColigadaMatriz  : Integer;
    lst_situacao_desc : array[-1..100]  of String[100];
    lst_situacao_sigla : array[-1..100]  of String[100];
    lst_situacao_fin_desc : array[0..100] of String[100];
    lst_situacao_fin_prot : array[0..100] of Integer;
    lst_situacao_fin_sigla : array[0..100] of String[100];

    flg : Boolean;
    indIndice : Array[0..255] of Single;

    //Array Todas Coligadas Usuarios
    ArrayTodasColigadasUsuario : TStringList;

    function PreRequisitoEspecial(CodAluno: Integer; Curso: String; Disciplina, Grade, Anosemestre, Serie: Integer; var PreRequisitoEspecialList: TStringList; nr_serieAluno: Integer = -1): Integer;    
    procedure removerDisciplinaFrente(iDisciplina: Integer;
      sCurso: String);
    function isDisciplinaFazFrente(iDisciplina: Integer;
      sCurso: String): Boolean;
    procedure ComfirmarNegociacaoBaixa(cd_mensalidade: Integer);
    function getColigadaUnica : string;
    function GetTodasColigadas: string;
    function getColigadaByTurma(sTurma: String; iAnoSem : Integer = 1): Integer;
    function getColigadaTurma(STurma: String): Integer;overload;
    function getColigadaTurma(STurma: String;iAnoSem: Integer): Integer;overload;

    //Funções para manipulação de disciplinas a frente
    procedure DuplicarProvaDisciplinaFrente(iAnosemestre: Integer; sCurso: string; sTurma: string; iDisciplina: Integer; iDisciplinaFrente: Integer; iBimestre: Integer;iNrProvaFilha : Integer; bDuplicaTodas: Boolean = false; iCdTipo : Integer = 0);
    function getDisciplinaFrente(iDisciplina: Integer; iAnosemestre: Integer; sTurma: string): Integer;
    function existeProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplinaFrente: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer): Boolean;
    function getNroProximaProva(nr_anosemestre: Integer; cd_turma: String; cd_disciplina: Integer; cd_bimestre: Integer) : Integer;

    function getTipoAvaliacao(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iNrProva: Integer) : Integer;
    function getDisciplinasFazemFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer) : TStringList;
    function getAlunosPorTipoProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer) : TStringList;
    function getSomaNotasProvasMesmoTipo(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer) : TNota;

    function ExisteRegistroColigadas(tabela, campo_coligada: string; campos_filtros, valores_filtros: array of string): Boolean;

    procedure gerarLogAlteracaoNota(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer; rNota: TNota);
    procedure atribuiNotaProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer; rNota: TNota);
    procedure atribuiNotaProvaDisciplinaFrenteOrigem(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iNroNota: Integer; iCdPessoa: Integer);

    // Função para descobrir o valor do parâmetro tabelado
    Function NomeDoBoleto( iDepto : Integer; sTurma : String; iAnoSemestre : Integer; Caixa : String = '') : String;

    function getPorcentagemReprovacaoAluno(cd_pessoa: Integer; cd_curso: String): Double;

    function variavel_parametro(variavel : string; const parametro_geral: Boolean = True; coligada_filha: Integer = 0;coligada_matriz: Integer = 0) : string;
    function variavel_nu_parametro(variavel : String; coligada: Integer = -1) : string;

    function getParametroPorColigadaNaoLogada(variavel,cd_coligada : string) : string;

    function IsLite(): Boolean;

    // Funcão para setar o valor da variável
    procedure set_variavel_parametro(variavel : string; valor : string);

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TUMZQuery
    procedure quantidade_registros(DataSet: TUMZQuery; Popup: TPopupMenu; naoLimpaItem: Boolean = True);overload;
    procedure quantidade_registros(DataSet: TClientDataSet; Popup: TPopupMenu);overload;
    procedure quantidade_registros(DataSet: TZTable; Popup: TPopupMenu);overload;

    // Procedure para descobrir quantidade de registros do DataSet passado
    // Para TZTable
    procedure quantidade_registros_table(DataSet: TZTable; Popup: TPopupMenu);overload;
    procedure quantidade_registros_table(DataSet: TUMZQuery; Popup: TPopupMenu);overload;
    procedure gerarNegociacao(
       dtApartir           : TDatetime;
       cd_tipo_titulo      : integer;
       ArrayCalculados     : TStringList;
       TotalTela           : Currency;
       ArrayParcelasNovas  : TStringList;
       ArrayCodParcelas    : TStringList;
       ArrayDatasInicial   : TStringList;
       ParcelasNegociadas  : Integer;
       CodigoAluno         : Integer;
       CdNegociacao        : Integer;
       ArrayTodasTurmas    : TStringList;
       ArrayJuros          : TStringList;
       ArrayDescontosParc  : TStringList;
       cd_turma            : String;
       cd_tipo_conta       : Integer;
       ano_semestre        : Integer;
       ArrayJurosNovas     : Tstringlist;
       ArrayDescontosNovas : Tstringlist;
       ArrayCreditosNovas  : Tstringlist;
       ArrayParcelas       : TStringList;
       ParcelasGeradas     : Integer;
       ArrayDatas          : TStringList;
       bGerarPrimeiraParc  : Boolean;
       cd_simulacao        : Integer;
       liberarDescontos    : Boolean = false 
    );
    function isTrue(valor : String) : Boolean;
    function FindUser(strUsu:String):Boolean;
    function FindUserCodigo(const cd_pessoa:Longint):Boolean;
    function FindDate(dat: TDateTime; Coligada: Integer):Boolean;
    function FindMotivo(lngCodigoAluno:Longint; intParcela:Integer; dat:TDateTime; turma : string):Boolean;
    procedure InicializaTabelaMatriculas;
    function BaixarMensalidade(conta : Integer; Documento : String; coligada : integer = 0; AlterouJuros : Boolean = false; NovoRetorno : Boolean = false) : Boolean;
    function BaixarRecebimento(cd_mensalidade: integer; vl_jurosfixo: double; datapagamento: TDateTime; vl_juros:double; vl_desconto: double; valorpago:double; vl_cheque: double; vl_dinheiro:double; conta : Integer; Documento : String; coligada : integer = 0; AlterouJuros : Boolean = false; cd_cartao: string = ''; ds_deposito: string = ''; ds_observacao: string = ''; dt_credito: string = ''; isBaixaRetorno: Boolean = false) : Boolean;
    function NovoNumero(iDepto:Integer; sTurma:String; iAnoSemestre : Integer; Tentativas : integer = 0; iConta : Integer = 0; iColigada : Integer = 0; CodigoAluno : Integer = 0 ; anoVenc : String = ''; anoEmissao : String = '') : String;
    function GetContaBoleto(iDepto:Integer; sTurma:String; iAnoSemestre : Integer) : Integer;
    function ContaBoletoPadrao(iDepto:Integer; sTurma:String; iAnoSemestre : Integer) : String;
    function NovoCodMatricula(CodigoAluno : Integer; Curso : String; AnoSem : Integer; AnoSemAtual : Integer) : String;
    function NovoCodigoPessoa(const chave_local_chamada: String) : Longint;
    function Converter_para_ponto(Valor : Double) : String;
    function condicao_com_arredondamento(calculo_notas,  formula, arredonda : string) : string;
    function getSituacao(situacao, modulo: integer): String;
    procedure criarAcaoAutomaticaDescontoCondicional(iCodigoMensalidade: Integer; cNovoDescontoCondicionalParcela: Currency);
    procedure criarAcaoAutomaticaDescontoFixo(iCodigoMensalidade: Integer; cNovoDescontoFixoParcela: Currency);
    procedure aplicaAcoesMovimentoDescontosCondicionais(iCodigoMensalidade: Integer);
    procedure atualizarDescontosCondicionaisPrevisto(iCodigoMensalidade: Integer);
    procedure estornarAcoesMovimentoDescCondicional(iCodigoMensalidade: Integer);
    procedure acessarGestaoOnline();

    //funções referente a prestação de contas
    function getCdUltimaMsgPrestacaoConta( mes_ano : string; cd_coligada : string ) : integer;
    function getDtUltimoBloqueio(cd_coligada: string; dtbase : TDateTime): TDateTime;
    function getFinPrestacaoContaAberto( mes_ano : string; cd_coligada : string ) : Boolean;
    function getDataBloqueioPrestacaoConta(dataTitulo : TDateTime ) : TDateTime;
    //funções referente a prestação de contas

    function convertDateTimeToDate( data: TDateTime ): TDateTime;
    procedure salvaHistoricoCheques(iCodCheque: Integer; iCodCaixa: Integer; iCodCaixaAntigo: Integer; iCodSituacao: Integer; iCodSituacaoAntigo: Integer );
    procedure transfereCheque(iCodCaixaEntrada: Integer; iCodCheque: Integer; iCodNovaSituacao: Integer; dtMovimento : TDateTime; iCodColigada: Integer );
    procedure GeraTaxaExameRecorrencia(const AICodAluno, AIAnoSemestre: integer;
      const ASCodTurma: string);

    function getQueryJson( query: TZAbstractDataset ): String;
    function getQueryFields( query: TZAbstractDataset ): String;

    Function GerarMensalidade(
         CodigoAluno    : Longint;
         Parcela        : Integer;
         Turma          : String;
         ValorBruto     : Double;
         ValorJuros     : Double;
         AnoSemestre    : Integer;
         Vencimento     : TDateTime;
         Competencia    : TDateTime;
         Situacao       : Byte;
         Curso          : String;
         Departamento   : Integer;
         TipoParcela    : SmallInt;
         cd_mensa_origem: Integer;
         DescontoCondic : Double = 0;
         NRCreditos   : Double = 0;
         Historico      : string ='';
         TipoTitulo     : integer = 0;
         PlanoConta     : Integer = 0;
         CentroCusto    : Integer = 0;
         DescontoExtra  : Double = 0;
         ValorExtra     : Double = 0;
         SNCredito      : Char = 'N';
         ValorCredito   : Double = 0;
         CodItemPlano   : Integer = 0;
         AcaoCR         : Integer = 10;
         CodCheque      : Integer = 0;
         CodResp        : Integer = 0;
         cd_coligada    : Integer = 0;
         nr_nf    : Integer = 0;
         PercentualDivisao: Currency = 100;
         cd_desc_condicional : Integer = 0;
         ds_obs_desc         : string = '';
         DataEmissao : TDateTime = 0;
         liberarDescontos    : Boolean = false;
         criarAcaoCondicionalPadrao : Boolean = true;
         RespNFSE: Integer = -1) : Integer;

    function callProcedure( const SQL: String; const sn_exibi_erro: Boolean = True ): Boolean;

    function MatricularGrade( lngCodigoAluno : Longint;
                               strTurma : String;
                               intAnoSemestre: Integer; sGrade : String = '01';
                               forcarMatriculaPreRequisito: Boolean = False;
                               TransferenciaInterna: Boolean = False) : String;

    procedure DeptoCursoTurma( AnoSemestre : Integer; Turma : String );

    procedure CalculoPoupanca;

    function ProfessoresTurma( intAnoSemestre : Integer;
      strTurma : String; iDisciplina : Integer ) : String;

    procedure IniciarDiario(const nr_anosemestre, nr_etapa: Integer; const cd_curso, cd_turma: String;
      const cd_disciplina, cd_professor, cd_grupo: Integer);

    { OLIVER - CALCULO_MEDIA }
    procedure CalcularMediaFinal(const cd_pessoa, nr_anosemestre, cd_grupo: Integer; const cd_turma, cd_turma_matricula: String);

    procedure CalculaPeriodicas(iCodigoAluno: Longint; tblAvaliacao: TUMZQuery; tblCalc: TUMZQuery);

    { OLIVER - CALCULO_MEDIA }
    procedure SetaSituacaoFinal( const cd_pessoa: Integer; const cd_turma: String; const nr_anosemestre: Integer );

    procedure TotalFaltas( lngCodigoAluno : Longint;
				  strTurma : String;
				  intAnoSemestre : Integer);

    function FindDepto(xTurma:String; xAnoSemestre: Integer):Integer;

    function  FindCodigoDisciplina(aAnoSemestre:Integer; aTurma, aDisciplina:String):String;

    function  FindDisciplina(aTurma, aSigla:String; aAnoSemestre:Integer):String;

    function disciplinaAlocada(iCodigo: Integer; sCurso: String): boolean;

      procedure AtualizaDocumentacao(const CodigoAluno: Integer;
         const Curso: string);

    { Public declarations }

    Function pegar_acrescimo( CdMensalidade : Integer; DataPagamento : TDateTime) : Currency;
    Function pegar_desconto( CdMensalidade : Integer; DataPagamento : TDateTime) : Currency;

    Function recalcular_creditos_financeiros( intCodigoAluno : Integer; strTurmaMatricula : String; intAnoSemestre : Integer; avisar : boolean = true; snCancelando : boolean = false; snAlertas : boolean = true ) : TAvisosRecalculoCreditos;

    procedure Gerar_Series_Conclusao(intCodigoAluno : integer; strCurso : String; intAnosemestre : integer; turma: String = '');

    procedure gerar_log( tipo : integer; msg : string; usuario: integer; chaves : string );
    procedure recalcularDescCondicionalAcoesMovimento(iCodigoMensalidade: Integer; cDescontoCondicionalOriginal, cNovoDescontoCondicionalParcela: Double; atualizarDescontoPrevisto: Boolean = True; restauraDesconto:Boolean = false);
    procedure recalcularDescFixoAcoesMovimento(iCodigoMensalidade: Integer; cDescontoFixoOriginal, cNovoDescontoFixoParcela: Double; atualizarDescontoPrevisto: Boolean = True; restauraDesconto:Boolean = false);
    function getValorEntradaAcaoMensalidade(cd_mensalidade:Integer): Double;
    // Procedure para gravar LOGS de acessos
    Procedure gerar_log_acesso(cd_modulo: integer; sn_acessou,sn_incluiu,sn_alterou,sn_excluiu:string);

    function Ativar_Matricula(p_intCodigoAluno : integer; p_strTurma : string; p_intAnoSemestre : integer; forcar_ativacao : boolean = false; turma_especifica:boolean = false ) : Word;
    
      function TentaAtivarMatricula(const CodigoAluno, AnoSemestre: Integer;
         const Turma: string; const Forcar: Boolean): TPendenciasMatricula;

    procedure CriarUniConsulta( var DataSet : TUMZQuery );

    procedure getArraysFilhosSinteticos(cd_centro: Integer; var arrFilhosSinteticos: TList; tesouraria: Boolean = False);

    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculas(Formulario: TForm; campoIgnorado: String = '');

    // Procedure que verifica o parâmetro sn_todas_maiusculas
    procedure TodasMaiusculasFrame(Frame: TFrame);

    //seta uma preferencia do usuário
    procedure Set_Parametro_usuario(componente: TComponent;nomeFormulario:string);

    procedure Set_Parametro_usuario_valor(nomeParametro: String; valorParametro : String ;nomeFormulario:string);

    // Procedure para setar os parâmetros do usuário
    procedure Set_Parametros_usuario(Formulario: TForm);

    // Procedure para ler os parâmetros do usuário
    procedure Parametros_usuario(Formulario: TForm; camposIgnorados: TStringList = nil);

    // Procedure para remover um parametro do usuario
    procedure Delete_Parametro_Usuario(componente : TComponent;nomeFormulario:string);

    //Pega uma preferencia do usuário em relação a um campo
    function Get_Parametro_usuario(componente: TComponent;nomeFormulario:string):Boolean;

    function Get_Parametro_usuario_valor(nomeParametro: String; nomeFormulario:string):String;

    // Função para verificar se o indivíduo tem livros em atraso na biblioteca
    Function TemLivrosAtrasados( cd_pessoa: integer ): boolean;

    Function DataAtual(): TDateTime;
    // Função que retorna a quantidade de dias úteis num intervalo de datas para um setor informado
    // Setores possíveis: biblioteca, financeiro, secretaria
    Function DiasUteis(setor: string; dt_inicial,dt_final: TDateTime): integer;

    Function ProximoId(campo, tabela: string): integer;

    function ExisteRegistro(tabela: string; campo: ARRAY of string; valor: ARRAY of string):Boolean;

    function BuscarCodigoAcaoPadrao(CodPadrao: Integer): Integer;

    function CabecalhoCampos(iCodCabecalho: LongInt): string;

    function CabecalhoParamFixos(): TStringList;

    procedure SalvaColigada(SenderCombo: TObject);
    procedure CarregaColigadas(SenderCombo: TObject; bRelatorio: boolean = false);
    procedure LocalizaColigada(SenderCombo: TObject; iCodigoColigada: Integer); 
    
    function BuscaCodigoColigada(NomeCombo: String): Integer;

    function CalcularMediaAutomaticamente( const nr_anosemestre: Integer;
         const cd_turma: String; const cd_disciplina, nr_etapa, cd_grupo, cd_pessoa: Integer; CalculoForcado: Boolean = False ): Boolean;

    { OLIVER - CALCULO_MEDIA }
    function CalcularNotaDisciplina(nr_anosemestre: Integer; cd_turma: String;
         cd_disciplina, nr_etapa, cd_grupo, cd_pessoa: Integer; ds_formula: String): Boolean;

    function getGrupoAtividade(nr_anosemestre: Integer; cd_curso, cd_turma: String; cd_disciplina, cd_pessoa: Integer): Integer;

    // Procedure que registra observações no campo informado
    Procedure RegistraObservacoes(campo: TField; Observacao: String);

    // Procedure para mostrar o Log num Popup
    procedure MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);

    // Função para retornar o próximo ID a ser utilizado (considerando relacionamento entre tabelas)
    Function ProximoId2(campo_increment, campo_condicao, tabela: string; filtro: integer): integer;

    //remessa
    function FazAcaoRemessa(Acao: TAcaoRemessa; iCodMensalidade: LongInt; ForcarAgrupado : Boolean = false ; sListaMensa : String = ''): Boolean;

    function DefineNumeroMatricula(sTurma: string; iAnoSem: Integer): LongInt;

    Function DefinirHistoricoCaixa(iCodigoMensalidade : Integer; sParametroHistorico : String) : string;

    function CarregaSituacoes(var slDados: TStringList; iModulo: Integer; sitMostra: TStrSituacoes): Boolean;

    Function ConverterNullEmZero( sFormula : string ) : String;

    function getEtapaAtual(iPadrao: Integer = 1): Integer;

    procedure setLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0; ds_observacoes: string = ''); overload;

    procedure ApropriaCR(Movimento : Integer; ApagarAntes : Boolean = False);

    function ConverteCambio(iMoedaBase, iMoedaCambio : integer; dCambio : TDateTime; cValor : Currency; ParaMoedaBase : Boolean = false) : Currency;

    procedure atualizaResponsavelFinanc(iCodAluno: Integer; iCodResponsavel: Integer; iCodResponsavelOld: Integer = -1);

    function LastInsert: Integer;

    Function DataBloqueioFinanceiro(DataTitulo : TDateTime) : TDateTime;

    Function EstaBloqueado(DataTitulo : TDateTime; EmitirAviso : Boolean = false) : boolean;

    Function EhFeriado(Data : TDateTime; Modulo : byte) : Boolean;

    Procedure BaixarChequeDevolvido(CodCheque : Integer; DataBaixa : TDateTime; Mensa : Integer = 0);

    function isSituacaoValida(const AISituacoes: array of Integer; const AISituacao: integer): boolean;

    function getGrupos(cd_pessoa : integer): TStringList;
    
    function getSituacaoAprovacao(const ASTurma: string): string;
    function getSituacaoAprovacaoExame(const ASTurma: string): string;
    function getSituacaoAprovacao2Epoca(const ASTurma: string): string;
    function GetAnoSemestreAtual: integer;

    ///   <summary>Cálcula o próximo ano/semestre baseado no ano/semestre atual
    ///   e no parâmetro que define a forma de incremento do ano/semestre
    ///   </summary>
    ///
    ///   <returns>Próximo ano/semestre</returns>
    function GetNextAnoSemestre: Integer;
    function ConectaUnimestreDocs: boolean;
    function GetColigadas() : String;
    procedure DefineRateioApropriacaoPorMatriculas(const AICodApropriacao, AIAnoSemestre: integer);
    function FindUserName(codigo:Longint):String;

    function GetUnimestreINI(): TIniFile;

    function CurrDateFromDatabase: TDate;

    { Bloquear coluna anosemestre }
    procedure BloquearComponenteAnosemestre(var componente: TDBGrid; const nome_campo: String);

    { Retorna a cidade de uma coligada }
    function GetCidadeFromColigada( const cd_coligada: Integer ): String;
    { Retorna o estado de uma coligada }
    function GetEstadoFromColigada( const cd_coligada: Integer ): String;

    { Retorna se na data atual possui ou não expediente na instituição }
    function temExpedienteInstituicao( const dt_expediente_teste : TDate;
         const sn_mostra_msg : Boolean = True; cd_coligada : Integer = -1 ) : Boolean;

    function IsAlunoFIES(const Aluno: Integer): Boolean;

    { Retorna TRUE caso seja LITE ou FALSE caso seja FULL }
    function GetChavePermissaoLite(const Chave: string; const ChaveModulo: string): Boolean;

    function UtilizaMoodle(): Boolean;

    procedure atualizarGruposPessoa(iCodPessoa, iColigada: integer;
      bAluno : boolean = False);

    //Função para validação de campos nulos
    function CamposObrigatoriosPreenchidos(formulario: TForm; cadastro_especifico : String = ''; mostraMsg: Boolean = True; mensagemExtra : String = ''; bloqueiaMsgExtra : Boolean = true): Boolean;

    function GetArrayColigadasUsuario: TStringList;

    procedure CarregarInformacoesIniciaisDM();

    function GetDB() : TZConnection; override;

//    function OrdenaStringList(lstNaoOrdenado: TStringList): TStringList;

    function getFeriado(data:TDateTime): Boolean;

    function getColigadaByCurso(cd_curso:String):String;

    function geraLogForm(formulario: TForm;abaEspecifica: String = '';operacao: String = 'Alteração'):String;

    { Exclui um movimento de fin_mov_tesouraria }
     procedure ExcluirMovimento(cd_movimento_te: Integer; tipoMovimento: String);

    procedure CriarConsultaDOCs(var DataSet : TUMZQuery);

    procedure ZerarFaltaEtapaAluno(const etapa, anosemestre: Integer; const turma: String; const disciplina, codigoaluno: Integer);

    Procedure montarPlanilha(Grade : TDBGrid; dsChave: String);

    procedure verificaMultaRecebimento();

    function verificaTabelasMyISAM(qyTabelas: TUMZQuery; slCamposAlteracao, slTabelasIgnorar, slTabelasExcessao: TStringList) : Boolean;

    { Verifica se a Instituição Usa ou não Anosemestre }
    property UsaAnosemestre: Boolean read AUtilizaAnosemestre write AUtilizaAnosemestre;

    property sLogin: String read GetLoginLogado;
    property iCdPessoaLogado: Integer read GetCdPessoaLogado;

    property ArrayColigadasUsuario : TStringLIst read GetArrayColigadasUsuario;

    property sColigadaSelecionada: String read getNomeColigadaSelecionada;
    property sColigadaSelecionadaRazao: String read getNomeColigadaSelecionadaRazao;


    ///   <summary>Verifica se o código do aluno referenciado no parâmetro
    ///   <c>AlunoID</c> está inserido no parâmetro do sistema denominado
    ///   <c>estuda_reserv_matric_bloqueados</c>. Se o identificador do aluno
    ///   está presente nesse parâmetro, então sua matrícula deve ser bloqueada
    ///   pelo sistema.</summary>
    ///
    ///   <param name="AlunoID">Código identificador do aluno que deverá ser
    ///   verificado sobre bloqueio financeiro.</param>
    ///
    ///   <returns>Valor booleano <c>True</c> se a matrícula do aluno deve ser
    ///   bloqueada. Valor booleano <c>False</c>, caso contrário.</returns>
    function IsMatriculaBloqueada(const AlunoID: Cardinal): Boolean;

    ///   <summary>Atualiza a situação do aluno no curso baseado na situação do
    ///   aluno na turma. O campo <c>cd_situacao</c> da tabela <c>matriculas_curso</c>
    ///   é definido com o valor do campo <c>cd_situacao_curso</c> definido para
    ///   a situação da matrícula do aluno na turma.</summary>
    ///
    ///   <param name="ASituacao">Código da situação da matrícula do aluno na
    ///   turma</param>
    ///   <param name="AMatriculaCurso">Códido da matrícula do aluno no curso
    ///   cujo situação deverá ser atualizada</param>
    procedure UpdateSituacaoMatriculaCurso(const ASituacao: Integer; const AMatriculaCurso: Int64);

    function RecordToJSON(DataSet: TDataSet): TlkJSONobject;
    function DataSetToJson(DataSet: TDataSet): TlkJSONlist;

    ///   <summary>Consulta a tabela <c>NU_PESSOAS_PREF</c> para encontrar o
    ///   valor de uma preferência definida para o usuário.
    ///   </summary>
    ///
    ///   <param name="Key">Chave da preferência para a qual deseja-se
    ///   recuperar o valor
    ///   </param>
    ///   <param name="Module">Chave do módulo à qual a preferência está
    ///   associada
    ///   </param>
    ///   <param name="Default">Valor padrão que será assumido para a
    ///   preferência caso não seja encontrada no banco de dados
    ///   </param>
    ///
    ///   <returns>Valor da preferência consultada</returns>
    function GetUserSetting(const Key, Module, Default: AnsiString): AnsiString;

    ///   <summary>Salva na tabela <c>NU_PESSOAS_PREF</c> o valor de uma
    ///   preferência definida pelo usuário
    ///   </summary>
    ///
    ///   <param name="Key">Chave da preferência</param>
    ///   <param name="Module">Chave do módulo para o qual deseja-se salvar a
    ///   preferência</param>
    procedure SetUserSetting(const Key, Value, Module: AnsiString);

    procedure UpdateDescontoFixo(const MensalidadeId: Integer);
  end;

var
  DM: TDM;
  slPFixos: TStringList;
  bExameRecorrencia: Boolean;
  nr_tentativas_conexao : integer;

implementation

uses
   Main, uDinCh, uMotivos, Math, uClassMovimento, uFreq, uASQL,
   Dialogs, uRegExpr, uExportaContabil, Spin, ClassTurmas, uColigada,
   uListaColigadas, uColigadaMatriz, uUMNucleo, uGeneral, uAvaliacoesConceitos,
   uMensalidade, uCredito, uPessoa, Contnrs, UFinApropriaCPClass,
   uFinApropriaTesouraria, UMLookupComboBox, uFSplash, md5, uRemessaClass;

{$R *.DFM}

procedure TDM.atualizarGruposPessoa(iCodPessoa,
  iColigada: integer; bAluno : boolean = False);
Const
   SQL_RESPONSAVEIS = 'select CD_PESSOA, CD_RESP_ACAD, CD_RESP_FINAN, CD_PAI, CD_MAE from pessoas where cd_pessoa =:cd_pessoa';
var
   qyResponsaveisAluno: TUMZQuery;
begin
   // Chama a procedure para atualizar os grupos da pessoa
   callProcedure(
         'CALL SPA_ATUALIZA_GRUPOS_PESSOA ( ' +
            IntToStr(iCodPessoa) + ', ' +
            IntToStr(iColigada) + ') ');

   if bAluno then
   begin
      // atualizar também os responsáveis
      DM.CriarConsulta(qyResponsaveisAluno);

      qyResponsaveisAluno.SQL.Text := SQL_RESPONSAVEIS;
      qyResponsaveisAluno.ParamByName('cd_pessoa').AsInteger := iCodPessoa;
      qyResponsaveisAluno.Open();

      if (qyResponsaveisAluno.FieldByName('CD_RESP_ACAD').AsInteger <> iCodPessoa) or (qyResponsaveisAluno.FieldByName('CD_RESP_ACAD').AsString <> '') then
      begin
         // Executa para o responsável Acadêmico
         callProcedure(
            'CALL SPA_ATUALIZA_GRUPOS_PESSOA ( ' +
               IntToStr(qyResponsaveisAluno.FieldByName('CD_RESP_ACAD').AsInteger) + ', ' +
               IntToStr(iColigada) + ') ');
      end;

      if (qyResponsaveisAluno.FieldByName('CD_RESP_FINAN').AsInteger <> iCodPessoa) or (qyResponsaveisAluno.FieldByName('CD_RESP_FINAN').AsString <> '') then
      begin
         // Executa para o responsável Financeiro
         callProcedure(
            'CALL SPA_ATUALIZA_GRUPOS_PESSOA ( ' +
               IntToStr(qyResponsaveisAluno.FieldByName('CD_RESP_FINAN').AsInteger) + ', ' +
               IntToStr(iColigada) + ') ');

      end;
      if (qyResponsaveisAluno.FieldByName('CD_PAI').AsInteger <> iCodPessoa) or (qyResponsaveisAluno.FieldByName('CD_PAI').AsString <> '') then
      begin
         // Executa para o responsável Pai
         callProcedure(
            'CALL SPA_ATUALIZA_GRUPOS_PESSOA ( ' +
               IntToStr(qyResponsaveisAluno.FieldByName('CD_PAI').AsInteger) + ', ' +
               IntToStr(iColigada) + ') ');

      end;
      if (qyResponsaveisAluno.FieldByName('CD_MAE').AsInteger <> iCodPessoa) or (qyResponsaveisAluno.FieldByName('CD_MAE').AsString <> '') then
      begin
         // Executa para o responsável Mãe
         callProcedure(
            'CALL SPA_ATUALIZA_GRUPOS_PESSOA ( ' +
               IntToStr(qyResponsaveisAluno.FieldByName('CD_MAE').AsInteger) + ', ' +
               IntToStr(iColigada) + ') ');
      end;

      FreeAndNil(qyResponsaveisAluno);

   end;
end;

procedure TDM.tblCaixaBeforePost(DataSet: TDataSet);
begin
  tblCaixa.FieldByName('cd_caixa').AsInteger := tblControle.FieldByName('cd_conta_banco').AsInteger;
  tblCaixa.FieldByName('cd_abertura_caixa').AsInteger := tblControle.FieldByName('cd_abertura_caixa').AsInteger;;
  tblCaixa.FieldByName('cd_usuario').AsInteger := iCdPessoaLogado;
  tblCaixa.FieldByName('dt_movimento').AsString := DateToStr(DataHoje);
  tblCaixa.FieldByName('dt_registro').AsString := DateTimeToStr(DataAtual);
end;

procedure TDM.tblMensalidadesBeforePost(DataSet: TDataSet);
var
  wAno, wMes, wDia : Word;
  wY, wM, wD: Word;
  dblInd, dblIndAnt, dblVlrCorrigido: Double;
  n, x: Longint;
begin

  DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );
  tblMensalidadesDataBaseCorrecao.AsString := DateToStr(EncodeDate( wAno, wMes, 1 ));

  if tblMensalidadesDataVencimento.Value < tblMensalidadesDataPagamento.Value then
  begin
    tblPoupanca.Close;
    tblPoupanca.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',tblMensalidadesDataBaseCorrecao.AsDateTime);
    tblPoupanca.Open;
    if not flg then
      tblMensalidadesIndiceCorrecao.AsCurrency := tblPoupancaIndiceCorrigido.AsCurrency;
  end;

  if tblMensalidadesDataPagamento.Value < DataHoje then
  begin
    DecodeDate( tblMensalidadesDataPagamento.AsDateTime, wY, wM, wD );
    DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );

    try
      DM.qAux1.Close;
      DM.qAux1.SQL.Clear;
      DM.qAux1.SQL.Add( 'select * from Poupanca where' );
      if DM.qAux1.Connection.Protocol = 'oracle' then //Oracle
      begin
         DM.qAux1.SQL.add( 'TO_CHAR(Data, ''YYYY-MM-DD'') >= :DatIni and TO_CHAR(Data, ''YYYY-MM-DD'') <= :DatFim' );
      end else begin
         DM.qAux1.SQL.add( 'Data >= :DatIni and Data <= :DatFim' );
      end;
      DM.qAux1.SQL.Add( 'order by Data DESC' );
      DM.qAux1.ParamByName('DatIni').AsString := FormatDateTime('yyyy-mm-dd',EncodeDate( wAno, wMes, 1 ));
      DM.qAux1.ParamByName('DatFim').AsString := FormatDateTime('yyyy-mm-dd',EncodeDate( wY, wM, 1 ));
      DM.qAux1.Open;

      n := DM.qAux1.RecordCount;
      x := 1;
      dblInd := DM.qAux1.FieldByName('IndicePoupanca').AsFloat;
      dblIndAnt := 1.02; //valor pelo universitario
      DM.qAux1.First;
      dblVlrCorrigido := 1.02;
      while (not DM.qAux1.Eof) and (n > 1) do
      begin
        dblVlrCorrigido := RoundFloat( ( ( ( dblInd / 100 ) + 1 ) * dblIndAnt ), 4 );

        DM.qAux1.Next;
        dblInd := DM.qAux1.FieldByName('IndicePoupanca').AsFloat;
        dblIndAnt := dblVlrCorrigido;
        Inc(x);
        if n = x then Break;
      end;
      tblMensalidadesIndiceCorrecao.AsCurrency := dblVlrCorrigido;

    finally
    end;
  end;

  if  tblMensalidadesValorTotal.Value = 0 Then
     tblMensalidadesValorTotal.Value :=
          tblMensalidadesValorBruto.Value - tblMensalidadesValorDesconto.Value +
          tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value;

  if tblMensalidadesSituacao.AsInteger = 2 then
  begin
    tblMensalidadesValorPago.AsString := '';
    tblMensalidadesDataPagamento.AsString := '';
  end;

  if tblMensalidadesValorJuros.AsCurrency < 0 then begin

      tblMensalidadesValorJuros.AsCurrency := 0 ;

  end;

  tblDeptoCursoTurma.Close;
  tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := tblMensalidadesAnoSemestre.AsInteger;
  tblDeptoCursoTurma.ParamByName('Turma').AsString := tblMensalidadesTurma.AsString;
  tblDeptoCursoTurma.Open;

  if not tblDeptoCursoTurma.Eof Then
  Begin
     tblMensalidadesDepto.AsInteger := tblDeptoCursoTurmaDepto.AsInteger;
     tblMensalidadesCurso.AsString := tblDeptoCursoTurmaCurso.AsString;
  End;

  tblDeptoCursoTurma.Close;

  if tblMensalidades.State in [dsInsert] then begin
    tblMensalidadesNossoNumero.AsString := DM.NovoNumero(tblMensalidadesDepto.AsInteger, tblMensalidadesTurma.AsString, tblMensalidadesAnoSemestre.AsInteger, 0, 0, 0, tblMensalidadesCodigoAluno.AsInteger, Copy( tblMensalidadesDataVencimento.AsString, 9, 2 ), Copy( tblMensalidadesDataEmissao.AsString, 9, 2 ));

  end;


end;


procedure TDM.DMCreate(Sender: TObject);
var
   IniPath: TFileName;
   ConnIni: TIniFile;
begin
   // Limpa dados de conexão
   limparConnection;

   // Verifica se deve habilitar o depurador de SQL
   SQLMonitor.Active := True;

   isCliente := not(TGeneral.IsDebugging() and TryLoadDebugger);

   // Objeto para armzenamento das coligadas do usuário
   ArrayTodasColigadasUsuario := TStringList.Create;

   // Sinaliza o uso do exame de recorrência
   bExameRecorrencia := False;

   // Tenta estabelecer conexão com a base de inicialização

   IniPath := Format('%sunimestre.ini', [ExtractFilePath(ParamStr(0))]);
   ConnIni := TIniFile.Create(IniPath);
   try
      try
         startConn.Active := ConnIni.ReadBool('Conexao', 'Usa.Start', False);
         startConn.IniPath := IniPath;
         nr_tentativas_conexao := ConnIni.ReadInteger('Conexao', 'Tentativas.Conexao', 9 );
         startConn.ConnectUnimestre;
         // Configurar o formato padrão de data do sistema
         GetLocaleFormatSettings(GetUserDefaultLCID, fsDateTimeFormatPadrao);
         fsDateTimeFormatPadrao.DateSeparator := '-';
         fsDateTimeFormatPadrao.TimeSeparator := ':';
         fsDateTimeFormatPadrao.ShortDateFormat := 'yyyy-mm-dd';
         fsDateTimeFormatPadrao.ShortTimeFormat := 'hh:nn:ss';
      except
         raise;
      end;
   finally
      ConnIni.Free;
   end;

   TTempoOcioso.Enabled := False;

   flg := False;
end;

procedure TDM.DuplicarProvaDisciplinaFrente(
  iAnosemestre: Integer;
  sCurso,  sTurma: string;
  iDisciplina, iDisciplinaFrente, iBimestre: integer;
  iNrProvaFilha : Integer;
  bDuplicaTodas : Boolean;
  iCdTipo : Integer);
var
   qyProfessor, qyDuplicarProva, qyDescLog: TUMZQuery;
   sProfessor, sLogDesc, sNrProva: string;
begin
   DM.CriarConsulta(qyProfessor);
   DM.CriarConsulta(qyDuplicarProva);
   DM.CriarConsulta(qyDescLog);

   // Verifica qual o numero da prova que deverá ser criado para a disciplina frente
   if iCdTipo = 4 then
    sNrProva := '-1'
   else
    sNrProva := IntToStr(getNroProximaProva(iAnosemestre, sTurma, iDisciplinaFrente, iBimestre));

   // Verifica se a disciplina frente possui professor, nesse caso irá criar a prova no nome desse professor
   qyProfessor.SQL.Text := ' ' +
   ' SELECT ' +
   '     professor ' +
   ' FROM ' +
   '     turmasprofessores ' +
   ' WHERE ' +
   '     anosemestre = :nr_anosemestre ' +
   '     AND curso LIKE :cd_curso ' +
   '     AND turma LIKE :cd_turma ' +
   '     AND disciplina = :cd_disciplina ' +
   ' LIMIT 1 ';

   qyProfessor.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyProfessor.ParamByName('cd_curso').AsString := sCurso;
   qyProfessor.ParamByName('cd_turma').AsString := sTurma;
   qyProfessor.ParamByName('cd_disciplina').AsInteger := iDisciplinaFrente;

   qyProfessor.Open();

   if qyProfessor.RecordCount > 0 then
      // Professor da disciplina encontrado
      sProfessor := qyProfessor.FieldByName('professor').AsString
   else
      // Utiliza professor que criou a prova
      sProfessor := 'cd_professor';

   if bDuplicaTodas then //traz
   begin

      // Duplica a prova para a disciplina frente
      qyDuplicarProva.SQL.Text := ' ' +
      ' INSERT INTO diario_provas (turma, cd_professor, disciplina, anosemestre, bimestre, data, assunto, sn_bloqueado, sn_proficiencia, nro_nota, sn_especial, sn_compoe, ds_chave, cd_avaliacao_tipo, '+
      '     vl_peso, nr_nota_minima, nr_nota_maxima, dt_inclusao, cd_prova_origem) ' +
      ' SELECT ' +
      '     turma, cd_professor, '+IntToStr(iDisciplinaFrente)+', anosemestre, bimestre, data, assunto, sn_bloqueado, sn_proficiencia,'+sNrProva+', sn_especial, sn_compoe, ds_chave, cd_avaliacao_tipo, '+
      '     vl_peso, nr_nota_minima, nr_nota_maxima, dt_inclusao, cd_prova ' +
      ' FROM ' +
      '     diario_provas ' +
      ' WHERE ' +
      '     anosemestre = :nr_anosemestre ' +
      '     AND turma LIKE :cd_turma ' +
      '     AND disciplina = :cd_disciplina ' +
      '     AND bimestre = :nr_bimestre ' +
      '     AND nro_nota = :nr_prova ';

   end else begin

      // Duplica a prova para a disciplina frente
      qyDuplicarProva.SQL.Text := ' ' +
      ' INSERT INTO diario_provas (turma, cd_professor, disciplina, anosemestre, bimestre, data, assunto, sn_bloqueado, sn_proficiencia, nro_nota, sn_especial, sn_compoe, ds_chave, cd_avaliacao_tipo) ' +
      ' SELECT ' +
      '     turma, '+sProfessor+', '+IntToStr(iDisciplinaFrente)+', anosemestre, bimestre, data, assunto, sn_bloqueado, sn_proficiencia,'+sNrProva+', sn_especial, sn_compoe, ds_chave, cd_avaliacao_tipo ' +
      ' FROM ' +
      '     diario_provas ' +
      ' WHERE ' +
      '     anosemestre = :nr_anosemestre ' +
      '     AND turma LIKE :cd_turma ' +
      '     AND disciplina = :cd_disciplina ' +
      '     AND bimestre = :nr_bimestre ' +
      '     AND nro_nota = :nr_prova ';

   end;

   qyDuplicarProva.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyDuplicarProva.ParamByName('cd_turma').AsString := sTurma;
   qyDuplicarProva.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyDuplicarProva.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyDuplicarProva.ParamByName('nr_prova').AsInteger := iNrProvaFilha;

   qyDuplicarProva.ExecSQL();

   // Inserir log de inclusão de prova (automática para disciplina frente)
   qyDescLog.SQL.Text := ' ' +
   ' SELECT ' +
   '     DATE_FORMAT(data, "%d-%m-%Y") data, vl_peso, assunto, sn_compoe, sn_proficiencia, sn_especial, turma, cd_professor ' +
   ' FROM ' +
   '     diario_provas ' +
   ' WHERE ' +
   '     cd_prova = :cd_prova ';

   qyDescLog.ParamByName('cd_prova').AsInteger := DM.LastInsert;;
   qyDescLog.Open();

   sLogDesc := '';
   sLogDesc := sLogDesc + 'Nro. Prova: '+sNrProva+', ';
   sLogDesc := sLogDesc + 'Data: '+qyDescLog.FieldByName('data').AsString+', ';
   sLogDesc := sLogDesc + 'Peso: '+qyDescLog.FieldByName('vl_peso').AsString+', ';
   sLogDesc := sLogDesc + 'Assunto: '+qyDescLog.FieldByName('assunto').AsString+', ';

   if qyDescLog.FieldByName('sn_proficiencia').AsInteger = 1 then
   begin
      sLogDesc := sLogDesc + 'Prova de suficiência: Sim, ';
   end
   else if qyDescLog.FieldByName('sn_especial').AsInteger = 1 then
   begin
      sLogDesc := sLogDesc + 'Recuperação Etapa: Sim, ';
   end
   else if qyDescLog.FieldByName('sn_compoe').AsInteger = 1 then
   begin
      sLogDesc := sLogDesc + 'Compõe nota substituível: Sim, ';
   end
   else if qyDescLog.FieldByName('sn_compoe').AsInteger = 0 then
   begin
      sLogDesc := sLogDesc + 'Compõe nota substituível: Não, ';
   end;

   sLogDesc := sLogDesc + 'Anosemestre: '+IntToStr(iAnosemestre)+', ';
   sLogDesc := sLogDesc + 'Turma: '+sTurma+', ';
   sLogDesc := sLogDesc + 'Disciplina: '+IntToStr(iDisciplinaFrente)+', ';
   sLogDesc := sLogDesc + 'Etapa: '+IntToStr(iBimestre)+' (inclusão automática na disciplina frente) [Acadêmico]';

   { Insere log de inserção de provas }
   DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_PROVA, sLogDesc, qyDescLog.FieldByName('cd_professor').AsInteger );

   FreeAndNil(qyProfessor);
   FreeAndNil(qyDuplicarProva);
   FreeAndNil(qyDescLog);
end;

procedure TDM.CarregaColigadas(SenderCombo: TObject; bRelatorio: boolean = false );
var
   listaColigadas: TListaColigadas;
   i, codigo_coligada, j: Integer;
   nome, separador: String;
   componente: TComponent; 
begin

   nome := '';
   separador := '';

   componente := TUMComboBox(SenderCombo).Owner;

   while componente.Name <> '' do
   begin
      if componente.Name <> '' then
      begin
         nome := nome + separador + componente.Name;
      end;

      separador := '.';

      componente := componente.Owner;
   end;

   nome := nome + separador + TUMComboBox(SenderCombo).Name;

   codigo_coligada := BuscaCodigoColigada(nome);

   listaColigadas := GetUsuarioLogado.GetListaColigadasFilhaSelecionada;

   TUMComboBox(SenderCombo).Clear;

   if ( SenderCombo is TUMComboBox ) then
   begin
      TUMComboBox(SenderCombo).SelecionarUnicoAutomatico := False;
   end;

   // Pela tela de relatórios o nome da primeira opção remete a todas as unidades
   // de ensino, nas demais telas é para realmente exigir a seleção
   if not bRelatorio then
   begin
      TUMComboBox(SenderCombo).AddItem('Selecione uma Unidade de Ensino', nil);
   end
   else
   begin
      TUMComboBox(SenderCombo).AddItem('Todas as Unidades de Ensino', nil);
   end;

   j := 0;

   for I := 0 to listaColigadas.Count - 1 do
   begin
      if codigo_coligada = TColigada(listaColigadas[ i ]).Codigo then
      begin
         j := i+1;   
      end;

      TUMComboBox(SenderCombo).AddItem(
         TColigada(listaColigadas[ i ]).Nome,
         listaColigadas[ i ]
      );
   end;

   if ( codigo_coligada = 0 ) AND ( TUMComboBox(SenderCombo).Items.Count = 2 ) then
   begin
      TUMComboBox(SenderCombo).ItemIndex := 1;
   end else begin
      TUMComboBox(SenderCombo).ItemIndex := j;
   end;
end;

procedure TDM.CarregarInformacoesIniciaisDM;
var
   Stmt: IZStatement;
   Rs: IZResultSet;
begin
   // Calcula a poupança (?)
   CalculoPoupanca;

   // Resgata as situações de matrícula e armazena em arrays
   try
      Stmt := db.DbcConnection.CreateStatement;
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Rs := Stmt.ExecuteQuery('SELECT CD_SITUACAO, DS_SITUACAO, DS_SIGLA_SITUACAO FROM SITUACAO ORDER BY CD_SITUACAO');
      try
         while Rs.Next do
         begin
            lst_situacao_desc[Rs.GetInt(1)] := Rs.GetString(2);
            lst_situacao_sigla[Rs.GetInt(1)] := Rs.GetString(3);
         end;
      finally
         Rs.Close;
      end;
   except
      MessageDlg('Não foi possível resgatar as situações de matrícula. Por favor, contate o suporte técnico.', mtError, [mbOK], -1);
   end;

   // Resgata as situações financeiras e armazena em array
   try
      Stmt := db.DbcConnection.CreateStatement;
      Stmt.SetResultSetConcurrency(rcUpdatable);
      Rs := Stmt.ExecuteQuery('SELECT CD_SITUACAO, DS_SITUACAO, DS_SIGLA_SITUACAO, SN_PROTESTO FROM SITUACOES_FINANCEIRAS WHERE CD_SITUACAO < 100 ORDER BY CD_SITUACAO');
      try
         Rs.Last;
         {
           Comentamos os códigos abaixo pois no chamado 177943	para o
           cliente EARC, a alocação de memória nos arrays abaixo estavam
           estourando um erro de ACESS VIOLATION no delphi, (erro inexplicável)
           Na declaração dos arrays foi incluído um tamanho FIXO (nesse .pas)
           ao invés de setar dinamicamente.
         }
         //SetLength(lst_situacao_fin_desc, Rs.GetRow);
         //SetLength(lst_situacao_fin_prot, Rs.GetRow);
         //SetLength(lst_situacao_fin_sigla, Rs.GetRow);

         Rs.BeforeFirst;
         while Rs.Next do
         begin
            lst_situacao_fin_desc[Rs.GetInt(1)] := Rs.GetString(2);
            lst_situacao_fin_sigla[Rs.GetInt(1)] := Rs.GetString(3);
            lst_situacao_fin_prot[Rs.GetInt(1)] := Rs.GetInt(4);
         end;
      finally
         Rs.Close;
      end;
   except
      MessageDlg('Não foi possível resgatar as situações financeiras. Por favor, contate o suporte técnico.', mtError, [mbOK], -1);
   end;
end;

function TDM.CamposObrigatoriosPreenchidos(formulario: TForm; cadastro_especifico : String = ''; mostraMsg: Boolean = True; mensagemExtra : String = ''; bloqueiaMsgExtra : Boolean = true): Boolean;
var
   chave_tela, erro : String;
   listaCampos : TStringList;
   I : Integer;
   componente, pesquisa : TComponent;
   sql, qry_cd_cadastro, qry_nome_campo : TUMZReadOnlyQuery;
   parametros: TParamsIni;
begin
   erro := '';

   {
   Chave da tela recebe o nome do formulário passado, caso seja
   passado uma tabsheet é concatenado o nome do formulário + . + nome
   da tabsheet passada
   }

   chave_tela := formulario.Name;
   if cadastro_especifico <> '' then
   begin
      chave_tela := chave_tela + '.' + cadastro_especifico;
   end;

   pesquisa := formulario;

   //Pesquisa pela tela no banco de dados
   CriarConsulta(qry_cd_cadastro);
   qry_cd_cadastro.SQL.Text := 'SELECT cd_cadastro, ds_chave FROM nu_cadastro_obrigatorio WHERE ds_chave = :chave_tela';
   qry_cd_cadastro.ParamByName('chave_tela').AsString := chave_tela;
   qry_cd_cadastro.Open;

   //pesquisa pelos campos da tela onde sn_obrigatorio = 1
   CriarConsulta(sql);
   sql.SQL.Text := 'SELECT * FROM nu_cadastro_obrigatorio_campo WHERE sn_obrigatorio = 1 and cd_cadastro = :tela';
   sql.ParamByName('tela').AsInteger := qry_cd_cadastro.FieldByName('cd_cadastro').AsInteger;
   sql.open;

   //adiciona os campos da tela a uma StringList
   listaCampos := TStringList.Create;

   while not (sql.Eof) do
   begin
      listaCampos.add(sql.FieldByName('ds_chave').asString);
      sql.Next;
   end;

   //Verifica todos os campos na StringList
   for I := 0 to listaCampos.Count - 1 do
   begin
      //pega um componente da lista
      componente := pesquisa.FindComponent(listaCampos[i]);

      if componente = nil then
      begin
         Continue;
      end;
      
      //procura pelo Nome (descrição) do campo.
      CriarConsulta(qry_nome_campo);
      qry_nome_campo.SQL.Text := 'SELECT nm_campo FROM nu_cadastro_obrigatorio_campo WHERE ds_chave = :nome_campo AND cd_cadastro = :cd_cadastro';
      qry_nome_campo.ParamByName('nome_campo').AsString := componente.Name;
      qry_nome_campo.ParamByName('cd_cadastro').AsInteger := qry_cd_cadastro.FieldByName('cd_cadastro').AsInteger;
      qry_nome_campo.open;

      {Se o componente for diferente de nulo, é verificado o tipo do componente
      para realizar a devida comparação de conteudo do componente, caso o valor
      seja nulo é adicionado a variavel erro uma mensagem dizendo que o
      campo [nome do campo] deve ser preenchido.}
      if componente <> nil then
      begin
         if ( componente is TDBEdit )then
         begin
            if (TDataSource(TDBEdit(componente).DataSource).DataSet is TUMZQuery) then
            begin
               if TUMZQuery(TDataSource(TDBEdit(componente).DataSource).DataSet).FindField(TDBEdit(componente).DataField).AsString = '' then
               begin
                  erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido '+sLineBreak;
               end;
            end
            else
            begin
               if (TDataSource(TDBEdit(componente).DataSource).DataSet is TZQuery) then
               begin
                  if TZQuery(TDataSource(TDBEdit(componente).DataSource).DataSet).FindField(TDBEdit(componente).DataField).AsString = '' then
                  begin
                     erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido '+sLineBreak;
                  end;
               end;
            end;
         end;

         if ( componente is TEdit ) AND ( TEdit(componente).Text = '' ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TDBComboBox ) AND ( TDBComboBox(componente).ItemIndex = -1 ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TMaskEdit ) AND ( TMaskEdit(componente).Text = '' ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TComboBox ) AND ( TComboBox(componente).Text = '' ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TUMComboBox ) AND ( TUMComboBox(componente).Text = '' ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TDBLookupComboBox ) AND ( TDBLookupComboBox(componente).KeyValue = null ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TMemo ) AND ( TMemo(componente).text = '' ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;

         if ( componente is TDBMemo ) AND ( TDBMemo(componente).text = '' ) then
         begin
            erro := erro + 'O campo ' + qry_nome_campo.FieldByName('nm_campo').AsString + ' precisa ser preenchido'+sLineBreak;
            continue;
         end;
      end;
   end;

   //Se for passado para mostrar mensagem e existe uma mensagem, exibe a mesma.
  if ((mostraMsg = true) OR (mensagemExtra <> '')) then
   begin

      if ((erro <> '') OR ((mensagemExtra <> '') AND (bloqueiaMsgExtra))) then
      begin
         parametros.titulo := 'Atenção';
         parametros.opcoes := (BT_OK + ICO_WARNING);
         parametros.mensagens.msgPrincipal := erro + mensagemExtra;
         parametros.mensagens.msgTopo := 'Os seguintes campos abaixo são necessários';
         parametros.mensagens.msgRodape := 'Por favor preencha os campos citados acima!';
         parametros.dimensao.altura := 350;
         parametros.dimensao.largura := 600;

         with TfrmMensagem.create(Self, parametros) do
         begin
            ShowModal;
         end;

      end;
   end;

   //Retorna o resultado da função.
   Result := True;

   if (erro <> '') OR ((mensagemExtra <> '') AND (bloqueiaMsgExtra))then
   begin
      Result := False;
   end;
end;


function TDM.NovoNumero(
  iDepto:Integer;
  sTurma:String;
  iAnoSemestre : Integer;
  Tentativas : integer = 0;
  iConta : Integer = 0;
  iColigada : Integer = 0;
  CodigoAluno : Integer = 0;
  anoVenc : String = '';
  anoEmissao : String = ''
) : String;
var
  qyNN : TUMZQuery;
  pegouLock: Integer;
  nossoNumero : String;
begin
   Result := '';

   Dm.CriarConsulta(qyNN);

   pegouLock := Dm.getLockMySQL('gerar_nossonumero', 5);

   if pegouLock > 0 then
   begin

      try

         qyNN.Close();
         qyNN.SQL.Text := 'SELECT FCD_NOSSONUMERO(:cd_depto, :nr_anosemestre, :cd_turma, :nr_tentativas, :cd_aluno, :cd_caixa, :ano_venc, :ano_emissao ) nossonumero';
         qyNN.ParamByName('cd_depto').AsInteger := iDepto;
         qyNN.ParamByName('nr_anosemestre').AsInteger := iAnoSemestre;
         qyNN.ParamByName('cd_turma').AsString := sTurma;
         qyNN.ParamByName('nr_tentativas').AsInteger := Tentativas;
         qyNN.ParamByName('cd_aluno').AsInteger := CodigoAluno;
         qyNN.ParamByName('cd_caixa').AsInteger := iConta;
         qyNN.ParamByName('ano_venc').AsString := anoVenc;
         qyNN.ParamByName('ano_emissao').AsString := anoEmissao;
         qyNN.Open();

         if not qyNN.Eof then begin
            nossoNumero := qyNN.FieldByName('nossonumero').AsString;

            if IsNumericStr(nossoNumero) then
            begin
               Result := nossoNumero;
            end;

         end;

      finally
         DM.releaseLockMySQL('gerar_nossonumero');
         FreeAndNil(qyNN);
      end;

   end;
   
end;

//function TDM.OrdenaStringList(lstNaoOrdenado: TStringList): TStringList;
//var
//  i, j, t: Integer;
//begin
//  for i := lstNaoOrdenado.count downto 0 do
//    for j := 0 to lstNaoOrdenado.count - 1 do
//      if StrToInt(lstNaoOrdenado.Strings[j]) > lstNaoOrdenado.Strings[j+1] then
//      begin
//        VisualSwap(A[J], A[J + 1], J, J + 1);
//        T := A[J];
//        A[J] := A[J + 1];
//        A[J + 1] := T;
//        if Terminated then Exit;
//      end;
//end;

function TDM.getLockMySQL(chaveLock: String; tempoEspera: Integer) : Integer;
var
  qyLock: TUMZQuery;
begin
   Result := 0;

   {
     chaveLock: A chave do lock é o identificador que será verificado se está liberado ou não
                Essa chave não pode ser uma string vazia, deve ser repassado algum valor
     tempoEspera: O tempo de espera é um número inteiro maior ou igual a zero, corresponde
                  ao valor em segundos que o sistema irá esperar pela resposta caso a chave
                  requisitada para lock estiver ocupado
   }
   if (Length(Trim(chaveLock)) > 0) and (tempoEspera >= 0) then
   begin
      { Se obtiver sucesso ao pegar o lock, o mesmo pode ser liberado de duas maneiras:
        1) Liberado automaticamente assim que a sessão que requisitou ele é fechava, ou seja,
           fechar o Unimestre.exe libera o lock
        2) Liberado manualmente, quem requisita o lock deve liberá-lo quando ele puder ser
           utilizado por outro processo, usando a função releaseLockMySQL (definida nesse mesmo arquivo)
      }

      Dm.CriarConsulta(qyLock);

      qyLock.Close();
      qyLock.SQL.Text := 'SELECT GET_LOCK(:chave_lock, :tempo_espera) pegou_lock';
      qyLock.ParamByName('chave_lock').AsString := chaveLock;
      qyLock.ParamByName('tempo_espera').AsInteger := tempoEspera;
      qyLock.Open();

      { Caso a chave requisitada já estiver em uso irá esperar o tempo de espera definido
        se ela for liberada antes desse tempo irá então conseguir pegar o lock e o
        retorno dado por essa função será 1 (conseguiu adquirir o lock), caso contrário
        o retorno dado por essa função será 0 (não conseguiu adiquirir o lock)
      }
      Result := qyLock.FieldByName('pegou_lock').AsInteger;

   end;
end;

function TDM.releaseLockMySQL(chaveLock: String) : Integer;
var
  qyReleaseLock: TUMZQuery;
begin
   Result := 0;

   {
     chaveLock: A chave do lock é o identificador que será liberado para uso de outro processo
                Essa chave não pode ser uma string vazia, deve ser repassado algum valor
   }
   if Length(Trim(chaveLock)) > 0 then
   begin

      Dm.CriarConsulta(qyReleaseLock);

      qyReleaseLock.Close();
      qyReleaseLock.SQL.Text := 'SELECT COALESCE(RELEASE_LOCK(:chave_lock), 0) liberou_lock';
      qyReleaseLock.ParamByName('chave_lock').AsString := chaveLock;
      qyReleaseLock.Open();

      { Se conseguir liberar o uso da chave do lock repassada o retorno
        então será 1 (conseguiu liberar o lock) caso contrário o retorno
        será 0 (não conseguiu liberar o lock) 
      }
      Result := qyReleaseLock.FieldByName('liberou_lock').AsInteger;

   end;
end;


procedure TDM.tblMensalidadesCalcFields(DataSet: TDataSet);
var
  fDesconto, fJuros: double;
begin

  { Calculo dos Juros }

  tblMensalidadeshr_atual.AsString := FormatDateTime('hh:mm', now());
  tblMensalidadesdt_atual.AsString := FormatDateTime('dd/mm/yyyy', now());

    { Não tem data de pagamento ainda, comparar com a data de hoje }
  if ( tblMensalidadesDataPagamento.AsString = '' ) and
     ( tblMensalidadesSituacao.Value in [ 2, 10 ] ) then
  begin
    { PARCELAS VENCIDAS }

       // Pegar desconto para data de hoje
       if tblMensalidadesValorDesconto.AsCurrency > 0 then begin

          fDesconto:= DM.pegar_desconto(tblMensalidadescd_mensalidade.AsInteger, DataHoje);

       end else begin

           fDesconto := 0;

       end;

       fJuros:= tblMensalidadesValorJuros.Value + DM.pegar_acrescimo(tblMensalidadescd_mensalidade.AsInteger, DataHoje);

       tblMensalidadesValorDescontoCalc.Value := fDesconto;

       // Novo Cálculo, incluindo o Juros pendente
       tblMensalidadesValorTotalCalc.Value := RoundFloat(
             ( tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesDescontoExtra.Value - fDesconto + fJuros) ,2);

       // Novo Juros
       tblMensalidadesValorJurosCalc.Value := RoundFloat(
               tblMensalidadesValorTotalCalc.Value - (
               tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value - fDesconto ), 2 );

    Exit;
    
  end else
  if ( tblMensalidadesDataPagamento.AsString <> '' ) and
     ( tblMensalidadesSituacao.Value in [ 2, 10 ] ) then
  Begin

       fDesconto:= DM.pegar_desconto(tblMensalidadescd_mensalidade.AsInteger, tblMensalidadesDataPagamento.AsDateTime);

       tblMensalidadesValorDescontoCalc.Value := fDesconto;

       fJuros:= tblMensalidadesValorJuros.Value + DM.pegar_acrescimo(tblMensalidadescd_mensalidade.AsInteger, tblMensalidadesDataPagamento.AsDateTime);

       // Novo Cálculo, incluindo o Juros pendente
       tblMensalidadesValorTotalCalc.Value := RoundFloat(
             ( tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesDescontoExtra.Value - fDesconto + fJuros) ,2);

       // Novo Juros
       tblMensalidadesValorJurosCalc.Value := RoundFloat(
               tblMensalidadesValorTotalCalc.Value - (
               tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value - fDesconto ), 2 );

    Exit;

  end else begin

     if (tblMensalidadesSituacao.AsInteger in [0,1,3] ) Then begin
      	  tblMensalidadesValorTotalCalc.Value := RoundFloat( tblMensalidadesValorTotal.Value, 2 )
     end else begin
          tblMensalidadesValorTotalCalc.Value := RoundFloat(tblMensalidadesValorBruto.Value +
                  tblMensalidadesValorExtra.Value -
                  tblMensalidadesValorDesconto.Value -
                  tblMensalidadesDescontoExtra.Value +
                  tblMensalidadesValorJuros.Value, 2 );
     end;

     if (tblMensalidadesDataPagamento.AsString <> '') then
        tblMensalidadesValorDescontoCalc.Value := RoundFloat( DM.pegar_desconto(tblMensalidadescd_mensalidade.AsInteger, tblMensalidadesDataPagamento.AsDateTime) , 2 )
     else
        tblMensalidadesValorDescontoCalc.Value := RoundFloat( DM.pegar_desconto(tblMensalidadescd_mensalidade.AsInteger, DataHoje) , 2 );
        
     tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value, 2 );

  end;


end;

procedure TDM.CalculoPoupanca;
var
  n : Integer;
begin
  { ******* ROTINA PARA MELHORAR VELOCIDADE DO CALC DAS MENS ********* }
  tblPoupanca.Close;
  tblPoupanca.SQL.Clear;
  tblPoupanca.SQL.Add( 'SELECT * FROM POUPANCA ORDER BY DATA' );
  tblPoupanca.Open;
  tblPoupanca.Last;
  n := 1;
  indIndice[0] := 1;
  tblPoupanca.Prior;
  while not tblPoupanca.Bof do
  begin
    indIndice[n] := RoundFloat( tblPoupancaIndiceCorrigido.Value, 4 );
    Inc( n );
    if n > 255 then Break;
    tblPoupanca.Prior;
  end;
//  tblPoupanca.Close;
  { ******************************************************************* }

  //Verifica se a conexão é Oracle ou MySQL
  if tblMensalidades.Connection.Protocol = 'oracle' then //Oracle
  begin
     tblPoupanca.Close;
     tblPoupanca.SQL.Clear;
     tblPoupanca.SQL.Add( 'select * from Poupanca' );
     tblPoupanca.SQL.Add( 'where Data = TO_DATE(:Data, ''YYYY-MM-DD'')' );
  end else begin
     tblPoupanca.Close;
     tblPoupanca.SQL.Clear;
     tblPoupanca.SQL.Add( 'select * from Poupanca' );
     tblPoupanca.SQL.Add( 'where Data = :Data' );
  end;
end;

function TDM.callProcedure(const SQL: String; const sn_exibi_erro: Boolean): Boolean;
begin
   Result := False;

   try
      qyStoredProc.Close;
      qyStoredProc.SQL.Text := PAnsiChar(SQL);
      qyStoredProc.ExecSQL;
      Result := True;
   except on E:Exception do
      begin
         Result := False;

         if sn_exibi_erro then
         begin
            raise E;
         end;
      end;
   end;
end;

function TDM.getQueryFields(query: TZAbstractDataset): String;
var
   i: Integer;
   separador: String;
begin
   separador := '';

   for i := 0 to query.FieldCount - 1 do
   begin
      Result := Result + separador + query.Fields[i].FieldName;
      separador := ';';
   end;
end;

function TDM.getQueryJson(query: TZAbstractDataset): String;
var
   i: Integer;
   separador: String;
begin
   separador := '';

   Result := '{';

   for i := 0 to query.FieldCount - 1 do
   begin
      Result := Result + separador + '"'+ query.Fields[i].FieldName +'": "'+ query.FieldByName(query.Fields[i].FieldName).AsString +'"';
      separador := ', ';
   end;

   Result := Result + '}';
end;

function TDM.getSituacao(situacao,modulo:integer):String;
var
   qyAux : TUMZQuery;
begin
   CriarConsulta(qyAux);

   qyAux.Close();
   qyAux.SQL.Text:=
   ' SELECT ds_valor FROM situacoes WHERE cd_modulo='+IntToStr(modulo)+' AND cd_situacao='+IntToStr(situacao);

   qyAux.Open();
   qyAux.First();

   result := qyAux.FieldByName('ds_valor').AsString;
end;

function TDM.getSituacaoAprovacao(const ASTurma: string): string;
begin
   Result := '0';
   if Self.tblAvaliacao.Locate('codigo', ASTurma, [loCaseInsensitive]) then
   begin
      Result := Self.tblAvaliacao.FieldByName('cd_situacao_aprov_direta').AsString;   
   end;
end;

function TDM.getSituacaoAprovacao2Epoca(const ASTurma: string): string;
begin
   Result := '0';
   if Self.tblAvaliacao.Locate('codigo', ASTurma, [loCaseInsensitive]) then
   begin
      Result := Self.tblAvaliacao.FieldByName('cd_situacao_aprov_2epoca').AsString;   
   end;
end;

function TDM.getSituacaoAprovacaoExame(const ASTurma: string): string;
begin
   Result := '0';
   if Self.tblAvaliacao.Locate('codigo', ASTurma, [loCaseInsensitive]) then
   begin
      Result := Self.tblAvaliacao.FieldByName('cd_situacao_aprov_exame').AsString;   
   end;
end;

procedure TDM.transfereCheque(iCodCaixaEntrada: Integer; iCodCheque: Integer; iCodNovaSituacao: Integer; dtMovimento: TDateTime; iCodColigada: Integer);
const
   S_SQL_UPD_CHEQUES=
      'UPDATE FIN_CHEQUES '+
      'SET CD_CAIXA = %d, CD_SITUACAO = %d '+
      'WHERE CD_CHEQUE = %d';
   S_FMT_TRANS = 'Transferência do cheque %s %s – para %s';
   S_FMT_CHEQUE = 'Cheque %s %s – do(a) %s';
   S_MSG_CHEQUE_INST =
      'Atenção' + #13 + #13 + 'O Cheque "%s" de "%s" não pode ser transferido.' + #13 +
      'Para efetuar a transferência deste cheque, abra o caixa e repita a transferência.';
var
   LMovimento: TMovimento;
   LIContaAtual, LISituacaoAtual, LICodAbertura, LICodMov: integer;
   LWTipoConta: Word;
   LBContaAtiva: boolean;
begin
   qrySelectCheques.Close();
   qrySelectCheques.ParamByName('CD_CHEQUE').AsInteger := iCodCheque;
   qrySelectCheques.Open;
   LIContaAtual := qrySelectChequesCD_CAIXA.AsInteger;
   LISituacaoAtual := qrySelectChequesCD_SITUACAO.AsInteger;
   
   LMovimento := TMovimento.create;
   if LIContaAtual <> 0 then
      LBContaAtiva :=
         LMovimento.VerificaContaAtiva(
            LIContaAtual, LWTipoConta, LICodAbertura, 0)
   else
      LBContaAtiva := false;

   if (((not LBContaAtiva) or (LWTipoConta = 3)) and (LICodAbertura <= 0)) and
      (not qrySelectChequesCD_CAIXA.IsNull) then
   begin
      Mensagem(
         Format(S_MSG_CHEQUE_INST,
            [qrySelectChequesDS_CHEQUE.AsString,
             qrySelectChequesNM_PESSOA.AsString]),
         'UNIMESTRE',
         MB_OK + MB_ICONWARNING);
   end
   else
   begin
      if LIContaAtual <> iCodCaixaEntrada then
      begin
         LICodMov := 0;
         if LIContaAtual <> 0 then
            with LMovimento do
            begin
               DataMovimento := dtMovimento;
               CodAcao := BuscarCodigoAcaoPadrao(7);
               NumeroDocumento := qrySelectChequesDS_CHEQUE.AsString;
               Historico := Format(S_FMT_TRANS, [qrySelectChequesDS_CHEQUE.AsString, qrySelectChequesNM_PESSOA.AsString, dm.getNomeCaixa(iCodCaixaEntrada)]);
               Origem := 3;
               EntradaSaida := 2;
               ValorEmCheque := qrySelectChequesNR_VALOR.AsFloat;
               ValorEmDinheiro := 0;
               ValorMovimento := qrySelectChequesNR_VALOR.AsFloat;
               Coligada := iCodColigada;
               CodigoDoCheque := qrySelectChequesCD_CHEQUE.AsInteger;
               LICodMov := RegistrarMovimentacaoTe(LIContaAtual);
            end;

         with LMovimento do
         begin
            DataMovimento := dtMovimento;
            CodAcao := BuscarCodigoAcaoPadrao(7);
            NumeroDocumento := qrySelectChequesDS_CHEQUE.AsString;
            if LIContaAtual = 0 then
               Historico := Format(S_FMT_CHEQUE, [qrySelectChequesDS_CHEQUE.AsString, qrySelectChequesNM_PESSOA.AsString, ''])
            else
               Historico := Format(S_FMT_CHEQUE, [qrySelectChequesDS_CHEQUE.AsString, qrySelectChequesNM_PESSOA.AsString, Dm.getNomeCaixa(LIContaAtual)]);

            Origem := 3;
            EntradaSaida := 1;
            ValorEmCheque := qrySelectChequesNR_VALOR.AsFloat;
            ValorEmDinheiro := 0;
            ValorMovimento := qrySelectChequesNR_VALOR.AsFloat;
            Coligada := iCodColigada;
            CodigoDoCheque := qrySelectChequesCD_CHEQUE.AsInteger;
            CodigoSaida := LICodMov;
            RegistrarMovimentacaoTe(iCodCaixaEntrada);
         end;
      end;
      db.ExecuteDirect(Format(S_SQL_UPD_CHEQUES, [iCodCaixaEntrada, iCodNovaSituacao, iCodCheque]));
      salvaHistoricoCheques(iCodCheque, iCodCaixaEntrada, LIContaAtual, iCodNovaSituacao, LISituacaoAtual);
   end;
   FreeAndNil(LMovimento);
end;


function TDM.TryLoadDebugger: Boolean;
begin
   if FileExists('umSQLdebugger.dll') then
   begin
      FDLLHandle := LoadLibrary(PChar('umSQLdebugger.dll'));

      if FDLLHandle > 0 then
      begin
         @FDLLProc := GetProcAddress(FDLLHandle, PChar('LogEvent'));
         Result := Assigned(@FDLLProc);
      end
      else
         Result := False;
   end
   else
      Result := False;
end;                      

procedure TDM.TTempoOciosoTimer(Sender: TObject);
var
   i: Integer;
begin
   TTempoOcioso.Enabled := False;

   TLoginManager.GetInstancia().RealizarLogin(False);

   if DM.UsuarioLogado = nil then
   begin
      for i := 0 to Screen.Formcount - 1 do
      begin
         Screen.Forms[i].close;
      end;
      
      Application.Terminate;
   end
   else
   begin
      Main.PrincipalForm.CarregarInformacoesIniciais;
   end;

   TTempoOcioso.Enabled := True;
end;

procedure TDM.UpdateDescontoFixo(const MensalidadeId: Integer);
const
   SObsFmt = 'Ação de desconto fixo gerada automaticamente pelo sistema';
   SSQLSelectMov = ''
      + ' SELECT '
      + ' 	M.CD_MENSALIDADE_ORIGEM, '
      + '   M.CD_COLIGADA, '
      + ' 	M.DESCONTOEXTRA, '
      + ' 	M.SITUACAO, '
      + ' 	T.DS_TIPO_TITULO '
      + ' FROM '
      + ' 	MENSALIDADES M '
      + ' 		JOIN FIN_CONFIG_TIPOS_TITULO T ON '
      + ' 			(M.CD_TIPO_TITULO = T.CD_TIPO_TITULO) '
      + ' 		JOIN COLIGADAS C ON '
      + ' 			(T.CD_COLIGADA_MATRIZ = C.CD_COLIGADA_MATRIZ) AND '
      + ' 			(M.CD_COLIGADA = C.CD_COLIGADA) '
      + ' WHERE '
      + ' 	M.CD_MENSALIDADE = ? AND '
      + '   M.SITUACAO != 7 AND '
      + ' 	COALESCE(M.DESCONTOEXTRA, 0) > 0 AND '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT '
      + ' 			F.CD_MENSALIDADE '
      + ' 		FROM '
      + ' 			FIN_MOV_CR F '
      + ' 				JOIN FIN_ACOES_MOVIMENTO A ON '
      + ' 					(F.CD_ACAO = A.CD_ACAO) '
      + ' 		WHERE '
      + ' 			M.CD_MENSALIDADE = COALESCE(F.CD_MENSALIDADE_ORIGEM, F.CD_MENSALIDADE) AND '
      + ' 			F.SN_DESC_CONDICIONAL = 0 AND '
      + ' 			A.CD_TIPO_ACAO = 3 '
      + ' 	) ';
   SSQLUpdate = ''
      + ' UPDATE '
      + ' 	FIN_MOV_CR '
      + ' SET '
      + ' 	SN_DESC_APLICADO = 1 '
      + ' WHERE '
      + ' 	COALESCE(CD_MENSALIDADE_ORIGEM, CD_MENSALIDADE) = ? AND '
      + ' 	SN_DESC_CONDICIONAL = 0 AND '
      + ' 	CD_ACAO = ? ';
var
   Stmt, StmtUpdate: IZPreparedStatement;
   Rs: IZResultSet;
   AcaoId: Integer;
   Movimento: TMovimento;
begin
   Stmt := PrepareStatement(SSQLSelectMov);
   try
      Stmt.SetInt(1, MensalidadeId);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            AcaoId := DM.BuscarCodigoAcaoPadrao(11);

            Movimento := TMovimento.create;
            try
               Movimento.Observacao := SObsFmt;
               Movimento.TipoDeAcao := BaixarporDesconto;
               Movimento.CodigoTitulo := Rs.GetIntByName('CD_MENSALIDADE_ORIGEM');
               Movimento.MensalidadeOrigem := MensalidadeId;
               Movimento.CodAcao := AcaoId;
               Movimento.ValorMovimento := Rs.GetDoubleByName('DESCONTOEXTRA');
               Movimento.Coligada := Rs.GetIntByName('CD_COLIGADA');
               Movimento.DescCondicional := 0;
               Movimento.RegistrarMovimentacaoCR(0, False);
            finally
               Movimento.Free;
               Movimento := nil;
            end;

            if not (Rs.GetIntByName('SITUACAO') in [2, 10]) then
            begin
               StmtUpdate := PrepareStatement(SSQLUpdate);
               try
                  StmtUpdate.SetInt(1, MensalidadeId);
                  StmtUpdate.SetInt(2, AcaoId);
                  StmtUpdate.ExecutePrepared;
               finally
                  StmtUpdate.Close;
                  StmtUpdate := nil;
               end;
            end;
            
         end;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;

procedure TDM.UpdateSituacaoMatriculaCurso(const ASituacao: Integer;
  const AMatriculaCurso: Int64);
const
   MSG_ERR = 'Ocorreu um erro ao tentar atualizar a situação da matrícula do aluno no curso.'#13'Por favor, entre em contato com o suporte técnico.';
   SQL_SEL_SITUACAO = 'SELECT cd_situacao_curso FROM situacao WHERE cd_situacao = ?';
   SQL_UPD_SITUACAO = 'UPDATE matriculas_curso SET cd_situacao = ? WHERE cd_matricula_curso = ?';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   LSituacaoCurso: Integer;
begin
   try
   
      // Recupera o código de situação que deve ser atribuído para a matrícula
      // do aluno no curso, baseado na situação da matrículo do aluno na turma
      
      Stmt := db.DbcConnection.PrepareStatement(SQL_SEL_SITUACAO);
      try
         Stmt.SetInt(1, ASituacao);

         try

            ResultSet := Stmt.ExecuteQueryPrepared;
            try

               // Verifica se encontrou a situação da matrícula na turma e se
               // o campo "cd_situacao_curso" possui um valor válido
               
               if ResultSet.Next and (not ResultSet.IsNullByName('cd_situacao_curso')) then
               begin

                  // Guarda o código da situação que será atribuído para
                  // a matrícula do aluno no curso
                  LSituacaoCurso := ResultSet.GetIntByName('cd_situacao_curso');

                  Stmt.Close;

                  try

                     // Atualiza a situação da matrículo do aluno no curso

                     Stmt := db.DbcConnection.PrepareStatement(SQL_UPD_SITUACAO);
                     try
                        Stmt.SetInt(1, LSituacaoCurso);
                        Stmt.SetLong(2, AMatriculaCurso);
                        Stmt.ExecutePrepared;
                     finally
                        Stmt.Close;
                     end;

                  except on E: Exception do

                     MessageDlg(MSG_ERR, mtError, [mbOK], -1);
                     
                  end;

               end;

            finally
               ResultSet.Close;
            end;

         except on E: Exception do

            MessageDlg(MSG_ERR, mtError, [mbOK], -1);
            
         end;
         
      finally
         Stmt.Close;
      end;

   except on E: Exception do

      MessageDlg(MSG_ERR, mtError, [mbOK], -1);
      
   end;   
end;

function TDM.UtilizaMoodle: Boolean;
begin
   Result := Length(Trim(variavel_nu_parametro( 'UMNucleo.url_acesso_moodle' ))) > 0;
end;

procedure TDM.BaixarChequeDevolvido(CodCheque: Integer; DataBaixa : TDateTime; Mensa : Integer = 0);
const
   SQL_VERIFICA_MENSA =
   'SELECT count(cd_mensalidade) as nrPendentes FROM mensalidades where cd_cheque_devolvido = :cheque AND cd_mensalidade <> :mensa AND situacao in (2,10)';
var
   qyCheque, qyVerificaMensa : TUMZQuery;
   sSituacao : String;
   mCaixa : TMovimento;
   possuiMensalidade : Boolean;
begin
  // Baixar o Cheque Devolvido
  sSituacao := Dm.variavel_parametro('financeiro_situacao_cheques_compensados');
  if sSituacao = '' then begin
     Exit;
  end;

  Dm.CriarConsulta(qyVerificaMensa);
  qyVerificaMensa.sql.Add(SQL_VERIFICA_MENSA);
  qyVerificaMensa.ParamByName('cheque').AsInteger := CodCheque;
  qyVerificaMensa.ParamByName('mensa').AsInteger := Mensa;
  qyVerificaMensa.Open;
  possuiMensalidade := (qyVerificaMensa.FieldByName('nrPendentes').AsInteger > 0);
  qyVerificaMensa.Close;

  //Existe pelo menos mais uma mensalidade gerada para este cheque, não podemos dar baixa no mesmo
  if possuiMensalidade then
  begin
     exit;
  end; 

  Dm.CriarConsulta(qyCheque);
  qyCheque.SQL.Text :=
    ' SELECT fc.*, LEFT(GROUP_CONCAT(DISTINCT IFNULL(p.nm_pessoa, "") SEPARATOR " / "), 240) AS nm_pessoa, m.cd_mensalidade, fcc.cd_coligada ' +
    ' FROM 	fin_cheques fc ' +
    ' INNER JOIN situacoes s ON (s.cd_modulo = 2050 AND s.cd_situacao = fc.cd_situacao) ' +
    ' LEFT JOIN fin_cheques_mensalidades fcm ON (fcm.cd_cheque = fc.cd_cheque) ' +
    ' LEFT JOIN fin_cadastro_contas fcc ON (fcc.cd_caixa = fc.cd_caixa)' +
    '	LEFT OUTER JOIN mensalidades m ON (m.cd_mensalidade = fcm.cd_mensalidade) ' +
    ' LEFT OUTER JOIN pessoas p ON (p.cd_pessoa = m.codigoaluno) ' +
    ' WHERE fc.cd_cheque = ' + IntToStr(CodCheque) +
    ' GROUP BY fc.cd_cheque ';
  qyCheque.Open();

  mCaixa := TMovimento.create();

  with mCaixa do begin
       DataMovimento    := DataBaixa;
       CodAcao          := BuscarCodigoAcaoPadrao(7);
       NumeroDocumento  := qyCheque.FieldByName('ds_cheque').AsString;
       Historico        := 'Quitação do cheque ' + qyCheque.FieldByName('ds_cheque').AsString + '  ' + qyCheque.FieldByName('nm_pessoa').AsString;
       Origem           := 3;
       EntradaSaida     := 2;
       ValorEmCheque    := qyCheque.FieldByName('nr_valor').AsCurrency;
       ValorEmDinheiro  := 0;
       ValorMovimento   := qyCheque.FieldByName('nr_valor').AsCurrency;
       Coligada         := qyCheque.FieldByName('cd_coligada').AsInteger;
       Mensalidade      := Mensa;
       RegistrarMovimentacaoTe(qyCheque.FieldByName('cd_caixa').AsInteger);
  end;

   // Atualiza cd_caixa do cheque
   qyCheque.Close();
   qyCheque.SQL.Text := ''+
            ' UPDATE                                        '+
            '     fin_cheques                               '+
            ' SET                                           '+
           '     cd_situacao = '+  sSituacao            + ' '+
            ' WHERE                                         '+
            '     cd_cheque = '+IntToStr(CodCheque) +'      ';
   qyCheque.ExecSQL();

   FreeAndNil(mCaixa);
   FreeAndNil(qyCheque);
end;

function TDM.BaixarMensalidade(conta : Integer; Documento : String; coligada : integer = 0; AlterouJuros : Boolean = false; NovoRetorno : Boolean = false) : Boolean;
{ A Função Baixar Mensalidade, usa como parâmetro a posição do registro atual
  na tabela de mensalidades (tblMensalidades)}
var
  wAno, wMes, wDia : Word;
  NovoJuros : Currency;
  NovoBruto : Currency;
  NovoDesconto : Currency;
  ValorTotal : Currency;
  flg : Boolean;
  Movimento : TMovimento;
  tpConta :   Word;
  cdAbertura : Integer;
  iCodMovTe : Integer;
  iCodParcial: Integer;
  cDescontoCondicionalOriginal: Currency;
  GerarParcial : Boolean;
  BaixarJurosPrimeiro : Boolean;
  sAux : String;
  qyMd5                 : TUMZQuery;
  sChave                : String;
  objRemessa: TRemessa;

begin
  //criando chave unica para a mensalidade
  CriarConsulta(qyMd5);
  qyMd5.SQL.Text := '       '+
     ' SELECT                '+
     '   md5("'+FloatToStr(Now)+'") as ds_chave';
  qyMd5.Open;

  sChave := qyMd5.FieldByName('ds_chave').AsString;

  FreeAndNil(qyMd5);


  if DM.variavel_parametro('FinanceiroBaixaJurosOrdem') = 'JUROS' then begin
      BaixarJurosPrimeiro := True;
  end else begin
     BaixarJurosPrimeiro := False;
  end;

  GerarParcial := false;

  if ( tblMensalidadesSituacao.Value <> 4 ) and // PERDOADO
     ( tblMensalidadesSituacao.Value <> 8 ) and // PARA O BANCO
     ( tblMensalidadesSituacao.Value <> 9 ) then // PARCELA EM PROTESTO 
  begin
    // Calcular diferença de Pagamento 

    if coligada = 0 then begin

        coligada := tblMensalidadescd_coligada.AsInteger;

    end;

    // Verificar Data de Bloqueio
    // Caso a data de bloqueio seja maior que a data de pagamento
    // Definir a data do pagamento um dia após o bloqueio

    if DM.EstaBloqueado(DM.tblMensalidadesDataPagamento.AsDateTime, false) then begin

       sAux := 'Alteração de data da baixa devido ao bloqueio --> Data Pagamento: ' + FormatDateTime('dd/mm/yyyy', DM.tblMensalidadesDataPagamento.AsDateTime);
       sAux := sAux + ' Data Baixa: ' + FormatDateTime('dd/mm/yyyy', DM.DataBloqueioFinanceiro(DM.tblMensalidadesDataPagamento.AsDateTime) + 1);

       DM.tblMensalidadesDataPagamento.AsDateTime := DM.DataBloqueioFinanceiro(DM.tblMensalidadesDataPagamento.AsDateTime) + 1;

       DM.setLog(2004, 'alteracao', DM.tblMensalidadescd_mensalidade.AsString, DM.tblMensalidadescd_mensalidade.AsInteger, sAux);

    end;

    // o valor do desconto fixo deverá receber o valor do desconto antes de que o mesmo seja recalculado.
    tblMensalidadesvalordesconto_fixo.AsCurrency := tblMensalidadesValorDesconto.AsCurrency;

    if (Documento = '') OR (NovoRetorno) then begin // Baixa manual, assume os valores digitados
       ValorTotal :=  tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency -
                      tblMensalidadesDescontoExtra.AsCurrency - tblMensalidadesValorDesconto.AsCurrency +
                      tblMensalidadesValorJuros.AsCurrency;
    end else begin // Baixa pelo retorno, assume calculo do sistema
    
       if tblMensalidadessn_liberar_juros.AsInteger = 1 then begin
           // Incluido para funcionar a baixa do FIES, que terá que liberar online o juros

           tblMensalidadesValorDesconto.AsCurrency := tblMensalidadesValorDescontoCalc.AsCurrency;
           
           ValorTotal := tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency -
                      tblMensalidadesDescontoExtra.AsCurrency - tblMensalidadesValorDesconto.AsCurrency +
                      tblMensalidadesValorJuros.AsCurrency;

       end else begin

           tblMensalidadesValorDesconto.AsCurrency := tblMensalidadesValorDescontoCalc.AsCurrency;
           ValorTotal := tblMensalidadesValorTotalCalc.AsCurrency;
           tblMensalidadesValorJuros.AsCurrency := tblMensalidadesValorJurosCalc.AsCurrency;

       end;
    end;

    dblParcial := RoundFloat(( ValorTotal - tblMensalidadesValorPago.Value ), 2 );

    if ( dblParcial >= 0.01 )  then
    { Valor Pago = ou > Valor Total Devido - Não vai gerar a parcial }
    { VALOR PAGO é MENOR que VALOR DEVIDO - Verificar a Parcial}
    begin

      if ( (tblMensalidadesSituacao.Value = 2) or (tblMensalidadesSituacao.Value = 10))
            and ( tblMensalidadesValorPago.Value <> 0 ) then
      begin
         NovoDesconto := 0;
         // Se o sn_liberar_juros = 1 e tiver valor de juros, deve manter para histórico - opção de abono registrado
         if AlterouJuros OR (tblMensalidadessn_liberar_juros.AsInteger = 1) OR (BaixarJurosPrimeiro AND (tblMensalidadesValorJuros.AsCurrency > 0))  then begin

           if (tblMensalidadesValorPago.AsCurrency < tblMensalidadesValorJuros.AsCurrency) then begin
              NovoJuros := tblMensalidadesValorJuros.AsCurrency - tblMensalidadesValorPago.AsCurrency;
              NovoBruto := ValorTotal - tblMensalidadesValorJuros.AsCurrency;
              tblMensalidadesValorJuros.AsCurrency := tblMensalidadesValorPago.AsCurrency;
           end else begin
              NovoBruto := ValorTotal - tblMensalidadesValorPago.AsCurrency ;
              // tblMensalidadesValorJuros.Value := 0;
              NovoJuros := 0;
           end;

         end else begin

             if tblMensalidadesValorPago.Value > (tblMensalidadesValorBruto.Value +
                tblMensalidadesValorExtra.VAlue - tblMensalidadesDescontoExtra.Value) Then
                { Isso mostra que o valor pago é maior do que o bruto (ou seja, chegou a pagar juros }
             Begin
                 tblMensalidadesValorJuros.Value := tblMensalidadesValorPago.Value - (tblMensalidadesValorBruto.Value +
                                                    tblMensalidadesValorExtra.VAlue - tblMensalidadesDescontoExtra.Value );
                 NovoBruto := 0;
                 NovoJuros := dblParcial;
             End
             else
               { O valor Pago é menor ou igual ao Bruto, então, deve separar o bruto e o juros }
             Begin
                if tblMensalidadesValorDesconto.AsCurrency > 0 then begin

                     cDescontoCondicionalOriginal := tblMensalidadesValorDesconto.AsCurrency;

                    if (DM.variavel_parametro('FinanceiroBaixaDesconto') = 'PROPORCIONAL') then begin
                       // Fazer a baixa do valor bruto de forma proporcional

                       NovoDesconto := tblMensalidadesValorDesconto.AsCurrency;

                       tblMensalidadesValorDesconto.AsCurrency := RoundFloat((NovoDesconto / (tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency + tblMensalidadesValorExtra.AsCurrency)) * tblMensalidadesValorPago.AsCurrency, 2);

                       NovoDesconto := NovoDesconto - tblMensalidadesValorDesconto.AsCurrency;

                       dblParcial := RoundFloat(( ValorTotal - tblMensalidadesValorPago.Value + NovoDesconto), 2 );

                    end else if (DM.variavel_parametro('FinanceiroBaixaDesconto') = 'DIRETO') then begin

                       NovoDesconto := 0


                    end else begin

                       NovoDesconto := tblMensalidadesValorDesconto.AsCurrency;

                       tblMensalidadesValorDesconto.AsCurrency := 0;

                       dblParcial := RoundFloat(( ValorTotal - tblMensalidadesValorPago.Value + NovoDesconto), 2 );

                    end;

                end else begin
                    NovoDesconto := 0;
                end;

                NovoBruto := (ValorTotal - tblMensalidadesValorJuros.Value ) - tblMensalidadesValorPago.Value + NovoDesconto;
                tblMensalidadesValorJuros.Value := 0;
                NovoJuros := dblParcial - NovoBruto;
                 if NovoJuros < 0 then NovoJuros := 0;
             end;
         end;

         // Verificar a se deve gerar parcial de juros
         if (Documento = '') OR
            (NovoBruto > 0) OR
            (NovoJuros > 0) then
         begin
            tblMensalidadesSituacao.Value := 1;
            GerarParcial := true;
         end
         else
         begin
            tblMensalidadesSituacao.Value := 0;
            GerarParcial := False;
         end;

      end;
      if tblMensalidadesValorPago.Value = 0 then
          tblMensalidadesSituacao.Value := 2;
    end
    else begin // Não é Pagamento Parcial
        tblMensalidadesSituacao.Value := 0; {Baixado}
    end
  end
  Else Begin
     Mensagem( 'Não é possível baixar essa mensalidade, devido a sua situação.', 'Atenção', MB_OK + MB_ICONWARNING);
  End;

  { Pegar o índice de Correção e arquivar na Mensalidade }
  if tblMensalidadesDataVencimento.Value < (tblMensalidadesDataPagamento.Value + 1) then begin
    DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );
    tblMensalidadesDataBaseCorrecao.AsString := DateToStr(EncodeDate( wAno, wMes, 1 ));

    DM.tblPoupanca.Close;
    DM.tblPoupanca.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',tblMensalidadesDataBaseCorrecao.AsDateTime);
    DM.tblPoupanca.Open;
    tblMensalidadesIndiceCorrecao.Value := DM.tblPoupancaIndiceCorrigido.Value;
  end;

  { Registrar o Valor Total Calculado }
  tblMensalidadesValorTotal.Value := ValorTotal;

  { Registrar o Usuário que Baixou a Mensalidade }
  if tblMensalidadesUsuario.AsString <> 'RETORNO' then begin
     tblMensalidadesUsuario.AsString := DM.sLogin;
  end;

  tblMensalidadescd_usuario.AsInteger := DM.iCdPessoaLogado;

  if Dm.tblMensalidadesdt_credito.AsString = '' then begin

     DM.tblMensalidadesdt_credito.AsDateTime := DM.tblMensalidadesDataPagamento.AsDateTime;

  end;

  { *********** ROTINA QUE DÁ BAIXA NO CAIXA *************** }
  if ( tblMensalidadesSituacao.Value = 0 ) or
     ( tblMensalidadesSituacao.Value = 1 ) then
  begin

{ Movimento no Caixa }

    Movimento := TMovimento.Create;

    Movimento.Coligada := Coligada;

    if not Movimento.VerificaContaAtiva(Conta, tpConta, cdAbertura) then
    begin
        Mensagem('Ocorreu um erro na movimentação do caixa. O Caixa está fechado.', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    if DM.variavel_parametro('mensalidade_historico_caixa') <> '' then
       // Novo Financeiro - Continuar
       movimento.Historico := DefinirHistoricoCaixa(tblMensalidadescd_mensalidade.AsInteger, DM.variavel_parametro('mensalidade_historico_caixa') )
       // movimento.Historico := 'MENSALIDADE ' + tblMensalidadesCodigoAluno.DisplayText + '-' + tblMensalidadesParcela.DisplayText
    else
       movimento.Historico := 'MENSALIDADE ' + tblMensalidadesCodigoAluno.DisplayText + '-' + tblMensalidadesParcela.DisplayText;

    Movimento.ValorMovimento := RoundFloat( frmDinCh.dblDin, 2 ) + RoundFloat( frmDinCh.dblCh, 2 );

    if (Documento = '') then
    begin
        Movimento.ValorEmDinheiro := RoundFloat( frmDinCh.dblDin, 2 );
        Movimento.ValorEmCheque   := RoundFloat( frmDinCh.dblCh, 2 );
        Movimento.NumeroDocumento := tblMensalidadesCodigoAluno.AsString;

    end
    else
    begin
        Movimento.ValorEmDinheiro := tblMensalidadesValorPago.AsCurrency;
        Movimento.ValorEmCheque   := 0;
        Movimento.NumeroDocumento := Documento;

    end;

    Movimento.CodAcao         := BuscarCodigoAcaoPadrao( 4 );

    Movimento.Mensalidade     := tblMensalidadescd_mensalidade.AsInteger;
    Movimento.EntradaSaida    := 1;     
    
    Movimento.DataLiberacao := Date;
    Movimento.Origem := 1; // Contas a Receber;

    // Verificar qual data deve ser usado para registrar ne tesouraria;

    if Dm.variavel_parametro('financeiro_retorno_data_movimento') = 'CREDITO' then begin
       movimento.DataMovimento := DM.tblMensalidadesdt_credito.AsDateTime;
    end else if Dm.variavel_parametro('financeiro_retorno_data_movimento') <> 'ATUAL' then begin
       movimento.DataMovimento := DM.tblMensalidadesDataPagamento.AsDateTime;
    end else begin
       movimento.DataMovimento := Dm.DataAtual();
    end;

    Movimento.moeda := tblMensalidadescd_moeda_pgto.AsInteger;
    Movimento.ValorMoeda := tblMensalidadesvl_pago_moeda.AsCurrency;

    Movimento.Coligada := Coligada;
//    Movimento.FormaDePagamento := tblMensalidadescd_forma_pgto.AsInteger;

    Movimento.RegistrarMovimentacaoTe( conta );

    iCodMovTe := Movimento.CodigoMovimento;

    ApropriaCR(iCodMovTe, True);

    Movimento.Free;

  end
  else begin
    iCodMovTe := 0;
  end;
  { ********************************************************* }

  if (Documento = '') then begin // Está sendo baixado manualmente - Planilha de recebimentos
     DM.FazAcaoRemessa(arBaixa, tblMensalidades.FieldByName('cd_mensalidade').AsInteger);
  end;

  if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
  begin
    // registra a nova ação de baixa no novo modelo de remessa
    objRemessa := TRemessa.Create;
    objRemessa.registraAcaoBaixa(tblMensalidades.FieldByName('nossonumero').AsString);

    // Atualiza o status do título como baixado manualmente
    // quando não houver status cadastrado para o NN
    objRemessa.incluirStatusNossoNumero(
      tblMensalidades.FieldByName('nossonumero').AsString,
      // Busca o layout da conta da mensalidade
      objRemessa.getLayoutConta(tblMensalidades.FieldByName('cd_caixa').AsInteger),
      -1,
      snnLiquidadoSemRegistro
    );
  end;

//  DM.tblMensalidadescd_coligada.AsInteger := coligada;

  //Atualização de campos

   // Juros
   if not AlterouJuros AND (tblMensalidadessn_liberar_juros.AsInteger <> 1) AND ( (NOT BaixarJurosPrimeiro) OR (dblParcial < 0) ) then begin

     if ((roundfloat(tblMensalidadesvalorbruto.AsCurrency + tblmensalidadesvalorextra.AsCurrency,2)-
        roundfloat(tblmensalidadesdescontoextra.AsCurrency,2)) < roundfloat(tblmensalidadesvalorpago.AsCurrency,2) ) then begin
        tblmensalidadesValorJuros.Value:= tblmensalidadesvalorpago.AsCurrency -(tblmensalidadesvalorbruto.AsCurrency + tblmensalidadesvalorextra.AsCurrency - tblmensalidadesdescontoextra.AsCurrency);
     end
     else begin
        tblmensalidadesValorJuros.Value:=0;
     end;

     // Desconto
     if roundfloat(tblmensalidadesvalorpago.asCurrency,2) < roundfloat(tblmensalidadesvalorbruto.asCurrency + tblmensalidadesvalorextra.ascurrency - tblmensalidadesdescontoextra.ascurrency,2) then
        if  roundfloat(tblmensalidadesvalorpago.asCurrency,2) < roundfloat(tblmensalidadesvalorbruto.asCurrency + tblmensalidadesvalorextra.ascurrency - tblmensalidadesdescontoextra.ascurrency - tblmensalidadesvalordesconto.AsCurrency,2) then
           tblmensalidadesvalordesconto.value:= tblmensalidadesvalordesconto.AsCurrency
        else
           tblmensalidadesvalordesconto.value := roundfloat( (tblmensalidadesvalorbruto.asCurrency + tblmensalidadesvalorextra.asCurrency - tblmensalidadesdescontoextra.AsCurrency) - tblmensalidadesvalorpago.asCurrency,2)
     else
        tblmensalidadesvalordesconto.value:= 0;

   end
   else
   begin
   
      // Ele alterou o juros e também o valor pago
      if (dblParcial < 0) then
      begin
         // Está pagando mais do que deveria, então colocar a diferença como juros
         tblmensalidadesValorJuros.Value:= tblmensalidadesvalorpago.AsFloat -(tblmensalidadesvalorbruto.AsFloat + tblmensalidadesvalorextra.AsFloat - tblmensalidadesdescontoextra.AsFloat);
      end;
   end;

   ValorTotal := tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency -
               tblMensalidadesDescontoExtra.AsCurrency - tblMensalidadesValorDesconto.AsCurrency +
               tblMensalidadesValorJuros.AsCurrency;

   tblMensalidadesValorTotal.Value := ValorTotal;

   DM.tblMensalidadescd_autenticacao.AsString :=  sChave;  

   DM.tblMensalidades.Post;

   IncluirAcaoContabil( DM.tblMensalidadescd_mensalidade.AsInteger, acBaixarTituloCR );

   // Fim da Baixa de Mensalidade, Registrar a Movimentação

  movimento := TMovimento.create;
  Movimento.TipoDeAcao     := BaixarporPagamento;
  Movimento.CodigoTitulo   := tblMensalidadescd_mensalidade_origem.AsInteger;
  Movimento.MensalidadeOrigem := tblMensalidadescd_mensalidade.AsInteger;
  Movimento.Coligada       := tblMensalidadescd_coligada.AsInteger;
  Movimento.ValorLiquido   := DM.tblMensalidadesValorPago.AsCurrency;
  Movimento.ValorJuros     := DM.tblMensalidadesValorJuros.AsCurrency;
  Movimento.ValorDesconto  := DM.tblMensalidadesValorDesconto.AsCurrency;

  if (Documento = '') then begin // Está sendo baixado manualmente - Planilha de recebimentos
     Movimento.CodAcao        := BuscarCodigoAcaoPadrao( 3 );
  end else begin
     Movimento.CodAcao        := BuscarCodigoAcaoPadrao( 5 );
  end;
  Movimento.ValorMovimento := DM.tblMensalidadesValorPago.AsCurrency +
                              DM.tblMensalidadesValorDesconto.AsCurrency -
                              DM.tblMensalidadesValorJuros.AsCurrency;

  Movimento.RegistrarMovimentacaoCR( iCodMovTe );

  Movimento.Free;

  // Atualiza o valor do desconto condicional previsto nas ações de movimento condicionais
  DM.atualizarDescontosCondicionaisPrevisto(tblMensalidadescd_mensalidade.AsInteger);

  // Verifica se o usuário está pagando em dia (ganha os descontos condicionais)
  //if DM.tblMensalidadesDataPagamento.AsDateTime <= DM.tblMensalidadesDataVencimento.AsDateTime then
  //begin
     // Ganha os descontos condicionais por pagamento em dia
     //DM.aplicaAcoesMovimentoDescontosCondicionais(tblMensalidadescd_mensalidade.AsInteger);
  //end;

  // Aplica os descontos condicionais por pagamento em dia
  DM.aplicaAcoesMovimentoDescontosCondicionais(tblMensalidadescd_mensalidade.AsInteger);

  // Verificar se é um pagamento de cheque devolvido

  if Dm.tblMensalidadescd_cheque_devolvido.AsInteger <> 0 then begin

     BaixarChequeDevolvido(Dm.tblMensalidadescd_cheque_devolvido.AsInteger, DM.tblMensalidadesDataPagamento.AsDateTime, Dm.tblMensalidadescd_mensalidade.AsInteger);

  end;

   if GerarParcial then
   begin
      iCodParcial := GerarMensalidade(
         tblMensalidadesCodigoAluno.AsInteger,
         tblMensalidadesParcela.AsInteger,
         tblMensalidadesTurma.AsString,
         RoundFloat( NovoBruto, 2 ),
         RoundFloat( NovoJuros, 2 ),
         tblMensalidadesAnoSemestre.AsInteger,
         tblMensalidadesDataVencimento.AsDateTime,
         tblMensalidadesDt_Competencia.AsDateTime,
         2,
         tblMensalidadesCurso.AsString,
         tblMensalidadesDepto.AsInteger ,
         1,
         tblMensalidadescd_mensalidade_origem.AsInteger,
         NovoDesconto, 0,
         'Parcial de ' + tblMensalidadesds_historico.AsString,
         tblMensalidadescd_tipo_titulo.AsInteger,
         tblMensalidadescd_plano_conta.AsInteger,
         tblMensalidadescd_centro_custo.AsInteger
         , 0
         , 0
         , 'N'
         , 0
         , 0
         , 10
         , 0
         , tblMensalidadescd_resp.AsInteger
         , tblMensalidadescd_coligada.AsInteger
      );

      DM.ajustarAcoesDescontosCondicionaisBaixaParcial(DM.tblMensalidadescd_mensalidade.AsInteger, iCodParcial, cDescontoCondicionalOriginal, tblMensalidadesValorDesconto.AsCurrency, NovoDesconto);
      
      //1 - Parcela Gerada por Pgto Parcial
   end;

   Dm.Ativar_Matricula(Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesTurma.AsString, Dm.tblMensalidadesAnoSemestre.AsInteger);

  Result := not GerarParcial;
  // Retorna True quando a baixa foi completa
  // Retorna False quando a baixa foi Parcial

  DM.setLog(2004, 'especial', Dm.tblMensalidadescd_mensalidade.AsString , getColigadaByTurma(DM.tblMensalidadesTurma.AsString, DM.tblMensalidadesAnoSemestre.AsInteger), 'cd_mensalidade: '+Dm.tblMensalidadescd_mensalidade.AsString+ ' Cd. autenticação: '+sChave);

  if (DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1' ) then begin
     dm.ComfirmarNegociacaoBaixa(dm.tblMensalidadescd_mensalidade.AsInteger);
     DM.LimpaMensaNegociacaoPaga(dm.tblMensalidadescd_mensalidade.AsInteger, dm.tblMensalidadesCodigoAluno.AsInteger);
  end;


end;

function TDM.BaixarRecebimento(cd_mensalidade: integer; vl_jurosfixo: double;
  datapagamento: TDateTime; vl_juros, vl_desconto, valorpago, vl_cheque,
  vl_dinheiro: double; conta: Integer; Documento: String; coligada: integer;
  AlterouJuros: Boolean; cd_cartao, ds_deposito: string;
  ds_observacao: string; dt_credito: string; isBaixaRetorno: Boolean): Boolean;
var
  wAno, wMes, wDia      : Word;
  NovoJuros             : Currency;
  NovoBruto             : Currency;
  NovoDesconto          : Currency;
  ValorTotal            : Currency;
  flg                   : Boolean;
  Movimento             : TMovimento;
  iCodParcial: Integer;
  cDescontoCondicionalOriginal: Currency;
  tpConta               : Word;
  cdAbertura            : Integer;
  iCodMovTe             : Integer;
  GerarParcial          : Boolean;
  BaixarJurosPrimeiro   : Boolean;
  qyMd5                 : TUMZQuery;

  sAux                  : String;
  sChave                : String;

  objRemessa: TRemessa;
  financeiro_retorno_baixa_parcial: String;
  financeiro_retorno_baixa_parcial_limite: Boolean;
begin
   //criando chave unica para a mensalidade
   CriarConsulta(qyMd5);
   qyMd5.SQL.Text := '       '+
     ' SELECT                '+
     '   md5("'+FloatToStr(Now)+'") as ds_chave';
   qyMd5.Open;

   sChave := qyMd5.FieldByName('ds_chave').AsString;

  FreeAndNil(qyMd5);

   //seleciona a mensalidade de acordo com o cd_mensalidade
  tblMensalidades.Close;
  tblMensalidades.SQL.Clear();
  tblMensalidades.SQL.Add('SELECT * FROM mensalidades ');
  tblMensalidades.SQL.Add('WHERE ');
  tblMensalidades.SQL.Add('cd_mensalidade = :cd_mensalidade');
  tblMensalidades.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;
  tblMensalidades.Open;

  tblMensalidades.Edit;

  tblMensalidadesvalordesconto_fixo.AsCurrency := tblMensalidadesvalordesconto.AsCurrency;

  tblMensalidadescd_autenticacao.AsString    := sChave;
  tblMensalidadesvalorjuros_fixo.AsFloat     := vl_jurosfixo;
  tblMensalidadesDataPagamento.AsDateTime    := datapagamento;
  tblMensalidadesValorJuros.AsFloat          := vl_juros;
  tblMensalidadesValorDesconto.AsFloat       := vl_desconto;
  tblMensalidadesValorPago.AsFloat           := valorpago;
  if ds_deposito = '' then
     tblMensalidadesds_deposito.Clear
  else
     tblMensalidadesds_deposito.AsString := ds_deposito;

   if DM.variavel_parametro('FinanceiroBaixaJurosOrdem') = 'JUROS' then
  begin
     BaixarJurosPrimeiro := True;
  end
  else
  begin
     BaixarJurosPrimeiro := False;
  end;

  GerarParcial := false;

  if ( tblMensalidadesSituacao.Value <> 4 ) and // PERDOADO
     ( tblMensalidadesSituacao.Value <> 8 ) and // PARA O BANCO
     ( tblMensalidadesSituacao.Value <> 9 ) then // PARCELA EM PROTESTO
  begin
    // Calcular diferença de Pagamento

    if coligada = 0 then
    begin

        coligada := tblMensalidadescd_coligada.AsInteger;

    end;

    // Verificar Data de Bloqueio
    // Caso a data de bloqueio seja maior que a data de pagamento
    // Definir a data do pagamento um dia após o bloqueio

    if DM.EstaBloqueado(DM.tblMensalidadesDataPagamento.AsDateTime, false) then
    begin

       sAux := 'Alteração de data da baixa devido ao bloqueio --> Data Pagamento: ' + FormatDateTime('dd/mm/yyyy', DM.tblMensalidadesDataPagamento.AsDateTime);
       sAux := sAux + ' Data Baixa: ' + FormatDateTime('dd/mm/yyyy', DM.DataBloqueioFinanceiro(DM.tblMensalidadesDataPagamento.AsDateTime) + 1);

       DM.tblMensalidadesDataPagamento.AsDateTime := DM.DataBloqueioFinanceiro(DM.tblMensalidadesDataPagamento.AsDateTime) + 1;

       DM.setLog(2004, 'alteracao', DM.tblMensalidadescd_mensalidade.AsString, DM.GetUsuarioLogado.GetColigadaLogada.Codigo, sAux);

    end;

    if (Documento = '') then
    begin // Baixa manual, assume os valores digitados
       ValorTotal :=  tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency -
                      tblMensalidadesDescontoExtra.AsCurrency - tblMensalidadesValorDesconto.AsCurrency +
                      tblMensalidadesValorJuros.AsCurrency;
    end else
    begin // Baixa pelo retorno, assume calculo do sistema
       tblMensalidadesValorDesconto.AsCurrency := tblMensalidadesValorDescontoCalc.AsCurrency;
       ValorTotal := tblMensalidadesValorTotalCalc.AsCurrency;
       tblMensalidadesValorJuros.AsCurrency := tblMensalidadesValorJurosCalc.AsCurrency;
    end;

    dblParcial := RoundFloat(( ValorTotal - tblMensalidadesValorPago.Value ), 2 );

    if ( dblParcial >= 0.01 )  then
    { Valor Pago = ou > Valor Total Devido - Não vai gerar a parcial }
    { VALOR PAGO é MENOR que VALOR DEVIDO - Verificar a Parcial}
    begin

      if ( (tblMensalidadesSituacao.Value = 2) or (tblMensalidadesSituacao.Value = 10))
            and ( tblMensalidadesValorPago.Value <> 0 ) then
      begin
         NovoDesconto := 0;
         
         if AlterouJuros OR (BaixarJurosPrimeiro AND (tblMensalidadesValorJuros.AsCurrency > 0))  then
         begin

           if (tblMensalidadesValorPago.AsCurrency < tblMensalidadesValorJuros.AsCurrency) then
           begin
              NovoJuros := RoundFloat(tblMensalidadesValorJuros.AsCurrency - tblMensalidadesValorPago.AsCurrency,2);
              NovoBruto := RoundFloat(ValorTotal - tblMensalidadesValorJuros.AsCurrency, 2);
              tblMensalidadesValorJuros.AsCurrency := tblMensalidadesValorPago.AsCurrency;
           end
           else
           begin
              NovoBruto := RoundFloat(ValorTotal - tblMensalidadesValorPago.AsCurrency,2) ;
              // tblMensalidadesValorJuros.Value := 0;
              NovoJuros := 0;                         
           end;

         end
         else
         begin

             if tblMensalidadesValorPago.Value > (tblMensalidadesValorBruto.Value +
                tblMensalidadesValorExtra.VAlue - tblMensalidadesDescontoExtra.Value) Then
                { Isso mostra que o valor pago é maior do que o bruto (ou seja, chegou a pagar juros }
             Begin
                 tblMensalidadesValorJuros.Value := tblMensalidadesValorPago.Value - (tblMensalidadesValorBruto.Value +
                                                    tblMensalidadesValorExtra.VAlue - tblMensalidadesDescontoExtra.Value );
                 NovoBruto := 0;
                 NovoJuros := dblParcial;
             End
             else
               { O valor Pago é menor ou igual ao Bruto, então, deve separar o bruto e o juros }
             Begin
                if tblMensalidadesValorDesconto.AsCurrency > 0 then begin

                    cDescontoCondicionalOriginal := tblMensalidadesValorDesconto.AsCurrency;

                    if (DM.variavel_parametro('FinanceiroBaixaDesconto') = 'PROPORCIONAL') then
                    begin
                       // Fazer a baixa do valor bruto de forma proporcional

                       NovoDesconto := tblMensalidadesValorDesconto.AsCurrency;

                       tblMensalidadesValorDesconto.AsCurrency := RoundFloat((NovoDesconto / (tblMensalidadesValorBruto.AsCurrency - tblMensalidadesDescontoExtra.AsCurrency + tblMensalidadesValorExtra.AsCurrency)) * tblMensalidadesValorPago.AsCurrency, 2);

                       NovoDesconto := NovoDesconto - tblMensalidadesValorDesconto.AsCurrency;

                       dblParcial := RoundFloat(( ValorTotal - tblMensalidadesValorPago.Value + NovoDesconto), 2 );

                    end
                    else if (DM.variavel_parametro('FinanceiroBaixaDesconto') = 'DIRETO') then
                    begin

                       NovoDesconto := 0

                    end
                    else
                    begin

                       NovoDesconto := tblMensalidadesValorDesconto.AsCurrency;

                       tblMensalidadesValorDesconto.AsCurrency := 0;

                       dblParcial := RoundFloat(( ValorTotal - tblMensalidadesValorPago.Value + NovoDesconto), 2 );                       
                    
                    end;

                end
                else
                begin
                    NovoDesconto := 0;
                end;

                NovoBruto := RoundFloat((ValorTotal - tblMensalidadesValorJuros.Value ) - tblMensalidadesValorPago.Value + NovoDesconto,2);
                tblMensalidadesValorJuros.Value := 0;
                NovoJuros := dblParcial - NovoBruto;

                if NovoJuros < 0 then
                begin
                  NovoJuros := 0;
                end;
             End;

         end;

         financeiro_retorno_baixa_parcial :=
            DM.variavel_parametro('financeiro_retorno_baixa_parcial');

         financeiro_retorno_baixa_parcial_limite := True;

         if financeiro_retorno_baixa_parcial = 'S' then
         begin
            financeiro_retorno_baixa_parcial_limite :=
               (NovoJuros > StrToCurrDef(DM.variavel_parametro('financeiro_retorno_baixa_parcial_limite'), 0));
         end;

         // Verificar a se deve gerar parcial de juros
         if (Documento = '') OR
            (NovoBruto > 0) OR
            ((financeiro_retorno_baixa_parcial = 'S') AND
            (financeiro_retorno_baixa_parcial_limite)) then
         begin
            tblMensalidadesSituacao.Value := 1;
            GerarParcial := true;
         end
         else
         begin
            tblMensalidadesSituacao.Value := 0;
            GerarParcial := False;
         end;

      end;

      if tblMensalidadesValorPago.Value = 0 then
      begin
          tblMensalidadesSituacao.Value := 2;
      end;

    end
    else
    begin // Não é Pagamento Parcial
        tblMensalidadesSituacao.Value := 0; {Baixado}
    end
  end
  Else
  Begin
     Mensagem( 'Não é possível baixar essa mensalidade, devido a sua situação.', 'Atenção', MB_OK + MB_ICONWARNING);
  End;

  { Pegar o índice de Correção e arquivar na Mensalidade }
  if tblMensalidadesDataVencimento.Value < (tblMensalidadesDataPagamento.Value + 1) then
  begin
    DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );
    tblMensalidadesDataBaseCorrecao.AsString := DateToStr(EncodeDate( wAno, wMes, 1 ));

    DM.tblPoupanca.Close;
    DM.tblPoupanca.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',tblMensalidadesDataBaseCorrecao.AsDateTime);
    DM.tblPoupanca.Open;
    tblMensalidadesIndiceCorrecao.Value := DM.tblPoupancaIndiceCorrigido.Value;
  end;

  { Registrar o Valor Total Calculado }
  tblMensalidadesValorTotal.Value := ValorTotal;

   { Registrar o Usuário que Baixou a Mensalidade }
   if tblMensalidadesUsuario.AsString <> 'RETORNO' then
   begin
      tblMensalidadesUsuario.AsString := DM.sLogin;
   end;

   tblMensalidadescd_usuario.AsInteger := DM.iCdPessoaLogado;

   if dt_credito <> '' then
   begin
      DM.tblMensalidadesdt_credito.AsDateTime := StrToDateTime(dt_credito);
   end;

   if Dm.tblMensalidadesdt_credito.AsString = '' then
   begin
      DM.tblMensalidadesdt_credito.AsDateTime := DM.tblMensalidadesDataPagamento.AsDateTime;
   end;

  { *********** ROTINA QUE DÁ BAIXA NO CAIXA *************** }
  if ( tblMensalidadesSituacao.Value = 0 ) or
     ( tblMensalidadesSituacao.Value = 1 ) then
  begin

{ Movimento no Caixa }

    Movimento := TMovimento.Create;

    Movimento.Coligada := coligada;

    if not Movimento.VerificaContaAtiva(Conta, tpConta, cdAbertura) then
    begin
        Mensagem('Ocorreu um erro na movimentação do caixa. O Caixa está fechado.', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
    end;

    if DM.variavel_parametro('mensalidade_historico_caixa') <> '' then
       // Novo Financeiro - Continuar
       movimento.Historico := DefinirHistoricoCaixa(tblMensalidadescd_mensalidade.AsInteger, DM.variavel_parametro('mensalidade_historico_caixa') )
       // movimento.Historico := 'MENSALIDADE ' + tblMensalidadesCodigoAluno.DisplayText + '-' + tblMensalidadesParcela.DisplayText
    else
       movimento.Historico := 'MENSALIDADE ' + tblMensalidadesCodigoAluno.DisplayText + '-' + tblMensalidadesParcela.DisplayText;

    // Movimento.ValorMovimento := RoundFloat( frmDinCh.dblDin, 2 ) + RoundFloat( frmDinCh.dblCh, 2 );
    Movimento.ValorMovimento := RoundFloat( vl_dinheiro + vl_cheque, 2 );

    if (Documento = '') then
    begin // Está sendo baixado manualmente - Planilha de recebimentos
        Movimento.ValorEmDinheiro := RoundFloat( vl_dinheiro, 2 );
        Movimento.ValorEmCheque   := RoundFloat( vl_cheque, 2 );
        Movimento.NumeroDocumento := tblMensalidadesCodigoAluno.AsString;
    end
    else
    begin
        Movimento.ValorEmDinheiro := tblMensalidadesValorPago.AsCurrency;
        Movimento.ValorEmCheque   := 0;
        Movimento.NumeroDocumento := Documento;
    end;

//    if isBaixaRetorno then
//    begin
//      Movimento.CodAcao         := BuscarCodigoAcaoPadrao( 5 );
//    end
//    else
//    begin
      Movimento.CodAcao         := BuscarCodigoAcaoPadrao( 4 );
//    end;

    Movimento.Mensalidade     := tblMensalidadescd_mensalidade.AsInteger;
    Movimento.EntradaSaida    := 1;     
    
    Movimento.DataLiberacao := Date;
    Movimento.Origem := 1; // Contas a Receber;

    // Verificar qual data deve ser usado para registrar ne tesouraria;

    if (Dm.variavel_parametro('financeiro_retorno_data_movimento') = 'CREDITO') or
       (dt_credito <> '') then
    begin
       movimento.DataMovimento := DM.tblMensalidadesdt_credito.AsDateTime;
    end
    else
    if Dm.variavel_parametro('financeiro_retorno_data_movimento') <> 'ATUAL' then
    begin
       movimento.DataMovimento := DM.tblMensalidadesDataPagamento.AsDateTime;
    end
    else
    begin
       movimento.DataMovimento := Dm.DataAtual();
    end;

    Movimento.moeda := tblMensalidadescd_moeda_pgto.AsInteger;
    Movimento.ValorMoeda := tblMensalidadesvl_pago_moeda.AsCurrency;

    Movimento.Coligada := Coligada;

    Movimento.RegistrarMovimentacaoTe( conta );

    iCodMovTe := Movimento.CodigoMovimento;

    ApropriaCR(iCodMovTe, True);

    Movimento.Free;

  end
  else
  begin
    iCodMovTe := 0;
  end;
  { ********************************************************* }

  if (Documento = '') then begin // Está sendo baixado manualmente - Planilha de recebimentos
     DM.FazAcaoRemessa(arBaixa, tblMensalidades.FieldByName('cd_mensalidade').AsInteger);

     if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
     begin
       // registra a nova ação de baixa no novo modelo de remessa
       objRemessa := TRemessa.Create;
       objRemessa.registraAcaoBaixa(tblMensalidades.FieldByName('nossonumero').AsString);

       // Atualiza o status do título como baixado manualmente
       // quando não houver status cadastrado para o NN
       objRemessa.incluirStatusNossoNumero(
          tblMensalidades.FieldByName('nossonumero').AsString,
          // Busca o layout da conta da mensalidade
          objRemessa.getLayoutConta(tblMensalidades.FieldByName('cd_caixa').AsInteger),
          -1,
          snnLiquidadoSemRegistro
       );
     end;

  end;

  DM.tblMensalidadescd_coligada.AsInteger := coligada;

  //Atualização de campos

   // Juros
   if not AlterouJuros AND ( (NOT BaixarJurosPrimeiro) OR (dblParcial < 0) ) then
   begin

     if ((roundfloat(tblMensalidadesvalorbruto.AsCurrency + tblmensalidadesvalorextra.AsCurrency,2)-
        roundfloat(tblmensalidadesdescontoextra.AsCurrency,2)) < roundfloat(tblmensalidadesvalorpago.AsCurrency,2) ) then
     begin
        tblmensalidadesValorJuros.Value:= tblmensalidadesvalorpago.AsCurrency -(tblmensalidadesvalorbruto.AsCurrency + tblmensalidadesvalorextra.AsCurrency - tblmensalidadesdescontoextra.AsCurrency);
     end
     else
     begin
        tblmensalidadesValorJuros.Value:=0;
     end;

     // Desconto
     if roundfloat(tblmensalidadesvalorpago.asCurrency,2) < roundfloat(tblmensalidadesvalorbruto.asCurrency + tblmensalidadesvalorextra.ascurrency - tblmensalidadesdescontoextra.ascurrency,2) then
        if  roundfloat(tblmensalidadesvalorpago.asCurrency,2) < roundfloat(tblmensalidadesvalorbruto.asCurrency + tblmensalidadesvalorextra.ascurrency - tblmensalidadesdescontoextra.ascurrency - tblmensalidadesvalordesconto.AsCurrency,2) then
           tblmensalidadesvalordesconto.value:= tblmensalidadesvalordesconto.AsCurrency
        else
           tblmensalidadesvalordesconto.value := roundfloat( (tblmensalidadesvalorbruto.asCurrency + tblmensalidadesvalorextra.asCurrency - tblmensalidadesdescontoextra.AsCurrency) - tblmensalidadesvalorpago.asCurrency,2)
     else
        tblmensalidadesvalordesconto.value:= 0;

   end
   else
   begin
      // Ele alterou o juros e também o valor pago
      if (dblParcial < 0) then
      begin // Está pagando mais do que deveria, então colocar a diferença como juros
         tblmensalidadesValorJuros.Value:= tblmensalidadesvalorpago.AsCurrency -(tblmensalidadesvalorbruto.AsCurrency + tblmensalidadesvalorextra.AsCurrency - tblmensalidadesdescontoextra.AsCurrency);
      end;

   end;

   ValorTotal := tblMensalidadesValorBruto.AsCurrency + tblMensalidadesValorExtra.AsCurrency -
               tblMensalidadesDescontoExtra.AsCurrency - tblMensalidadesValorDesconto.AsCurrency +
               tblMensalidadesValorJuros.AsCurrency;
               
   tblMensalidadesValorTotal.Value := ValorTotal;

  DM.tblMensalidades.Post;

  IncluirAcaoContabil( DM.tblMensalidadescd_mensalidade.AsInteger, acBaixarTituloCR );

 // Fim da Baixa de Mensalidade, Registrar a Movimentação

  movimento                := TMovimento.create;
  Movimento.TipoDeAcao     := BaixarporPagamento;
  Movimento.CodigoTitulo   := tblMensalidadescd_mensalidade_origem.AsInteger;
  Movimento.MensalidadeOrigem := tblMensalidadescd_mensalidade.AsInteger;
  Movimento.Coligada       := coligada;
  Movimento.ValorLiquido   := DM.tblMensalidadesValorPago.AsCurrency;
  Movimento.ValorJuros     := DM.tblMensalidadesValorJuros.AsCurrency;
  Movimento.ValorDesconto  := DM.tblMensalidadesValorDesconto.AsCurrency;

  if (Documento = '') and not(isBaixaRetorno) then
  begin // Está sendo baixado manualmente - Planilha de recebimentos
     Movimento.CodAcao        := BuscarCodigoAcaoPadrao( 3 );
  end
  else
  begin
     Movimento.CodAcao        := BuscarCodigoAcaoPadrao( 5 );
  end;

  Movimento.ValorMovimento := DM.tblMensalidadesValorPago.AsCurrency +
                              DM.tblMensalidadesValorDesconto.AsCurrency -
                              DM.tblMensalidadesValorJuros.AsCurrency;

  Movimento.Observacao := ds_observacao;                               

  Movimento.RegistrarMovimentacaoCR( iCodMovTe );

  Movimento.Free;

  // Verificar se é um pagamento de cheque devolvido
  if Dm.tblMensalidadescd_cheque_devolvido.AsInteger <> 0 then
  begin

     BaixarChequeDevolvido(Dm.tblMensalidadescd_cheque_devolvido.AsInteger, DM.tblMensalidadesDataPagamento.AsDateTime, Dm.tblMensalidadescd_mensalidade.AsInteger);

  end;

   if GerarParcial then
   begin
      
      // Se for retorno bancário, e tiver algum valor de JUROS pendente, verificar se deve gerar a parcial
      iCodParcial := GerarMensalidade(         tblMensalidadesCodigoAluno.AsInteger,
                                tblMensalidadesParcela.AsInteger,
                                tblMensalidadesTurma.AsString,
                                RoundFloat( NovoBruto, 2 ),
                                RoundFloat( NovoJuros, 2 ),
                                tblMensalidadesAnoSemestre.AsInteger,
                                tblMensalidadesDataVencimento.AsDateTime,
                                tblMensalidadesDt_Competencia.AsDateTime,
                                2,
                                tblMensalidadesCurso.AsString,
                                tblMensalidadesDepto.AsInteger ,
                                1,
                                tblMensalidadescd_mensalidade_origem.AsInteger,
                                NovoDesconto, 0,
                                'Parcial de ' + tblMensalidadesds_historico.AsString,
                                tblMensalidadescd_tipo_titulo.AsInteger,
                                tblMensalidadescd_plano_conta.AsInteger,
                                tblMensalidadescd_centro_custo.AsInteger
                                , 0
                                , 0
                                , 'N'
                                , 0
                                , 0
                                , 10
                                , 0
                                , tblMensalidadescd_resp.AsInteger
                                , tblMensalidadescd_coligada.AsInteger
                                , 0
                                , 100
                                , 0
                                , ''
                                , 0
                                , false
                                , false

            ); //1 - Parcela Gerada por Pgto Parcial

      DM.ajustarAcoesDescontosCondicionaisBaixaParcial(DM.tblMensalidadescd_mensalidade.AsInteger, iCodParcial, cDescontoCondicionalOriginal, tblMensalidadesValorDesconto.AsCurrency, NovoDesconto);
  end;

  Dm.Ativar_Matricula(Dm.tblMensalidadesCodigoAluno.AsInteger, Dm.tblMensalidadesTurma.AsString, Dm.tblMensalidadesAnoSemestre.AsInteger, false, true);

  //Se não for uma parcial verifica as multas da biblioteca
  //O try é pra pegar casos de clientes sem as tabelas de multas
  if not(GerarParcial) AND (DM.tblMensalidadescd_mensalidade.AsString = DM.tblMensalidadescd_mensalidade_origem.AsString) then
  begin
     try
         verificaMultaRecebimento();
     except
         on E:Exception do
         begin
            //
         end;
     end;
  end;

  Result := not GerarParcial;
  DM.setLog(2004, 'especial', Dm.tblMensalidadescd_mensalidade.AsString , getColigadaByTurma(DM.tblMensalidadesTurma.AsString, DM.tblMensalidadesAnoSemestre.AsInteger), 'cd_mensalidade: '+Dm.tblMensalidadescd_mensalidade.AsString+ ' Cd. autenticação: '+sChave);
  // Retorna True quando a baixa foi completa
  // Retorna False quando a baixa foi Parcial
end;


procedure TDM.BloquearComponenteAnosemestre(var componente: TDBGrid; const nome_campo: String);
var
   i: Integer;
begin
   { TODO -cManutenção -oJosimar Zimermann : Modificar o primeiro parâmetro do método para o tipo TDBGridColumns, permitindo que método seja acionado por componentes TDBGrid e TZSortedGrid }

   for I := 0 to componente.Columns.Count - 1 do
   begin
      if (componente.Columns.Items[I].FieldName = nome_campo) then
      begin
         componente.Columns.Items[I].Visible := UsaAnosemestre;
         exit;
      end;      
   end;

   for I := 0 to componente.Columns.Count - 1 do
   begin
      if (componente.Columns.Items[I].Title.Caption = nome_campo) then
      begin
         componente.Columns.Items[I].Visible := UsaAnosemestre;
         exit;
      end;      
   end;
end;

procedure TDM.salvaHistoricoCheques(iCodCheque: Integer; iCodCaixa: Integer; iCodCaixaAntigo: Integer; iCodSituacao: Integer; iCodSituacaoAntigo: Integer);
var
   qyHistorico : TUMZQuery;
begin
   CriarConsulta(qyHistorico);
   qyHistorico.close();
   qyHistorico.SQL.Clear();

   qyHistorico.SQL.Text:=
                        'INSERT INTO                                                             '+
                           'fin_cheques_historicos                                               '+
                           '  (cd_caixa, cd_cheque,                                              '+
                           '  cd_situacao, dt_movimentacao, cd_caixa_antigo, cd_situacao_antigo) '+
                        'VALUES                                                                  '+
                           '  ('+IntToStr(iCodCaixa)+', '+IntToStr(iCodCheque)+',                '+
                           '   '+IntToStr(iCodSituacao)+', NOW(),'+IntToStr(iCodCaixaAntigo)+',  '+
                           '   '+IntToStr(iCodSituacaoAntigo)+')                                           ';
   qyHistorico.ExecSQL();
end;

// Gerar Mensalidade retorna o código da mensalidade gerada

Function TDM.GerarMensalidade(
	CodigoAluno    : Longint;
	Parcela        : Integer;
	Turma          : String;
	ValorBruto     : Double;
	ValorJuros     : Double;
   AnoSemestre    : Integer;
   Vencimento     : TDateTime;
   Competencia    : TDateTime;
   Situacao       : Byte;
	Curso          : String;
	Departamento   : Integer;
	TipoParcela    : SmallInt;
   cd_mensa_origem: Integer;
   DescontoCondic : Double = 0;
   NRCreditos     : Double = 0;
   Historico      : string ='';
   TipoTitulo     : integer = 0;
   PlanoConta     : Integer = 0;
   CentroCusto    : Integer = 0;
   DescontoExtra  : Double = 0;
   ValorExtra     : Double = 0;
   SNCredito      : Char = 'N';
   ValorCredito   : Double = 0;
   CodItemPlano   : Integer = 0;
   AcaoCR         : Integer = 10;
   CodCheque      : Integer = 0 ;
   CodResp        : Integer = 0;
   cd_coligada    : Integer = 0;
   nr_nf          : Integer = 0;
   PercentualDivisao   : Currency = 100;
   cd_desc_condicional : Integer = 0;
   ds_obs_desc         : string = '';
   DataEmissao : TDateTime = 0;
   liberarDescontos    : Boolean = false;
   criarAcaoCondicionalPadrao : Boolean = true;
   RespNFSE: Integer = -1) : Integer;
const
   MSG_QUESTIONA_USO_CREDITOS_DISPONIVEIS =
      'Atenção:' + #13 + #13 + 'O estudante possui créditos financeiros ' +
      'disponíveis para abater o valor das novas parcelas. Deseja utilizar ' +
      'estes créditos agora?';
var
  wAno, wMes, wDia : Word;
  Movimento : TMovimento;
  iCodMensa : Integer;
  chaves : String;
  qCaixaDepto : TUMZQuery;
  qyGetResp : TUMZQuery;
  snForcarComp : Boolean;
  qyGetTipoTitulo: TUMZQuery;
  qyUpdMensalidade  : TUMZQuery;
  sChaveAutenticao : String;
  qryGetDate : TUMZQuery;
  listaCreditosDisponiveis : TObjectList;
  valorCreditoDisponivel : Currency;
begin
  //criando chave unica para a mensalidade
  CriarConsulta(qryGetDate);

  qryGetDate.SQL.Text := 'SELECT md5(concat(now(), concat('''+IntToStr(CodigoAluno)+IntToStr(Parcela)+''','''+turma+'''))) as chave';
  qryGetDate.Open;
  sChaveAutenticao := qryGetDate.FieldByName('chave').AsString;

  CriarConsulta(qyGetResp);

  if cd_mensa_origem = -3 then begin

     snForcarComp := true;
     cd_mensa_origem :=  -1

  end;


  Screen.Cursor := crHourGlass;

  qryInsert.Close;
  qryInsert.ParamByName('CodigoAluno').asInteger     := CodigoAluno;

  //Verifica se o código do responsável está vazio
  if (CodResp = 0) then
  begin

    qyGetResp.Close();
    qyGetResp.SQL.Text := 'SELECT COALESCE(cd_resp_finan, cd_pessoa) as cd_resp FROM pessoas WHERE cd_pessoa = '+IntToStr(CodigoAluno);
    qyGetResp.Open();
  
    //Tenta, novamente, solicitar o código do responsável
    CodResp := qyGetResp.FieldByName('cd_resp').AsInteger;
    
    //Se o código continuar sendo vazio gera a parcela para o próprio aluno
    if (CodResp = 0) then
      qryInsert.ParamByName('cd_resp').asInteger       := CodigoAluno
    else
      qryInsert.ParamByName('cd_resp').asInteger       := CodResp;
      
  end
  else
    qryInsert.ParamByName('cd_resp').asInteger       := CodResp;

  qryInsert.ParamByname('Parcela').AsSmallInt        := Parcela;
  qryInsert.ParamByName('Turma').AsString            := Turma;

  if (DataEmissao = 0) then begin
      qryInsert.ParamByName('DataEmissao').AsString      := FormatDateTime('yyyy-mm-dd',DataHoje);
  end else begin
      qryInsert.ParamByName('DataEmissao').AsString      := FormatDateTime('yyyy-mm-dd',DataEmissao);
  end;
  
  // Pegar o código da conta que foi gerado a mensalidade

  Dm.CriarConsulta(qCaixaDepto);

  qCaixaDepto.SQL.Clear;
  qCaixaDepto.SQL.Add('select d.cd_caixa, d.cd_boleto_padrao from');
  qCaixaDepto.SQL.Add('departamentos d');
  qCaixaDepto.SQL.Add('where d.codigo = :depto ');

  qCaixaDepto.ParamByName('depto').AsInteger := Departamento;

  qCaixaDepto.Open();

  qryInsert.ParamByName('cd_caixa').asInteger := GetContaBoleto(Departamento, Turma, AnoSemestre );
  
  FreeAndNil(qCaixaDepto);

  qryInsert.ParamByName('ValorBruto').AsFloat         := RoundFloat( ValorBruto, 2 );
  qryInsert.ParamByName('ValorDesconto').AsFloat      := RoundFloat(DescontoCondic, 2);
  qryInsert.ParamByName('DescontoExtra').AsFloat      := RoundFloat(DescontoExtra,2 );
  qryInsert.ParamByName('ValorExtra').AsFloat         := RoundFloat(ValorExtra, 2);
  qryInsert.ParamByName('ValorTotal').AsFloat         := RoundFloat(ValorBruto + ValorExtra - DescontoExtra - DescontoCondic, 2);
  qryInsert.ParamByName('ValorJuros').AsFloat         := RoundFloat( ValorJuros, 2 );
  qryInsert.ParamByName('valorjuros_fixo').AsFloat    := RoundFloat( ValorJuros, 2 );
  qryInsert.ParamByName('Situacao').AsSmallInt        := Situacao;
  qryInsert.ParamByName('Usuario').AsString           := DM.sLogin;
  qryInsert.ParamByName('Bloqueto').AsString          := 'N';
  qryInsert.ParamByName('AnoSemestre').AsInteger      := AnoSemestre;
  qryInsert.ParamByName('Curso').AsString             := Curso;
  qryInsert.ParamByName('Depto').AsInteger            := Departamento;
  qryInsert.ParamByName('IndiceCorrecao').AsFloat     := 0;
  qryInsert.ParamByName('Tipo').AsInteger             := TipoParcela;
  qryInsert.ParamByName('cd_plano_conta').AsInteger   := PlanoConta;
  qryInsert.ParamByName('cd_centro_custo').AsInteger  := CentroCusto;
  qryInsert.ParamByName('cd_tipo_titulo').AsInteger   := TipoTitulo;
  qryInsert.ParamByName('ds_historico').AsString      := Historico;
  qryInsert.ParamByName('nr_creditos').AsFloat        := NRCreditos;
  qryInsert.ParamByName('ds_autentica_impressao').AsString := sChaveAutenticao;
  qryInsert.ParamByName('VL_PERCENTUAL_DIVISAO').AsFloat := PercentualDivisao;
  qryInsert.ParamByName('sn_liberar_descontos').AsInteger := 0;

  if(liberarDescontos) then
  begin
     qryInsert.ParamByName('sn_liberar_descontos').AsInteger := 1;
  end;

  // Se estiver gerando com o NR_NF (caso de divisão de título
  if nr_nf > 0 then begin
     qryInsert.ParamByName('NR_NF').AsString      := IntToStr(nr_nf);
     qryInsert.ParamByName('SN_NFE_GERADA').AsInteger := 1;
  end else begin
     qryInsert.ParamByName('NR_NF').Clear;
     qryInsert.ParamByName('SN_NFE_GERADA').AsInteger := 0;
  end;          

  // Se estiver passando o código da ação para desconto condicional, grava o mesmo na mensalidade
  if cd_desc_condicional > 0 then begin
     qryInsert.ParamByName('cd_desc_condicional').AsInteger := cd_desc_condicional;
  end else begin
     qryInsert.ParamByName('cd_desc_condicional').Clear;
  end;

  // Se estiver passando a observação do desconto condicional, grava o mesmo na mensalidade
  if ds_obs_desc <> '' then begin
     qryInsert.ParamByName('ds_obs_desc').AsString := ds_obs_desc;
  end else begin
     qryInsert.ParamByName('ds_obs_desc').Clear;
  end;

  qryInsert.ParamByName('cd_mensalidade_origem').AsInteger := cd_mensa_origem;
  // se a data de geração padrão  para o exame de recorrencia for difente de nula e o exame for um exame de recorencia pega ela como padrao
  DM.CriarConsulta(qyGetTipoTitulo);
  qyGetTipoTitulo.SQL.Text := 'SELECT DT_PADRAO_GERACAO AS DATA FROM FIN_TIPOS_TITULO WHERE CD_TIPO_TITULO =:CD_TIPO';
  qyGetTipoTitulo.ParamByName('CD_TIPO').Value := TipoTitulo;
  qyGetTipoTitulo.Open;
  if (qyGetTipoTitulo.FieldByName('DATA').AsDateTime <> 0)  and (bExameRecorrencia)   then
  begin
     Vencimento := qyGetTipoTitulo.FieldByName('DATA').AsDateTime;
     bExameRecorrencia := false;
  end;
  qryInsert.ParamByName('DataVencimento').AsString    := FormatDateTime('yyyy-mm-dd', Vencimento);

  // A competencia refere-se ao vencimento inicial da mensalidade
  // Porém, ela não pode ser gerada em datas retroativas

  if ( Competencia < DataHoje ) AND ( TipoParcela <> 1 ) AND (not snForcarComp) then begin
      qryInsert.ParamByName('dt_competencia').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
  end else begin
      qryInsert.ParamByName('dt_competencia').AsString := FormatDateTime('yyyy-mm-dd',Competencia);
  end;

  qryInsert.ParamByname('Parcela').AsSmallInt            := Parcela;
  qryInsert.ParamByName('sn_credito_parcela').AsString   := SNCredito;

  DecodeDate( Vencimento, wAno, wMes, wDia );
  qryInsert.ParamByName('DataBaseCorrecao').AsString     := FormatDateTime('yyyy-mm-dd',EncodeDate( wAno, wMes, 1 ));

  qryInsert.ParamByName('ValorCredito').AsFloat            := ValorCredito;
  qryInsert.ParamByName('CodItemPlano').AsInteger        := CodItemPlano;
  qryInsert.ParamByName('cd_cheque_devolvido').AsInteger :=  CodCheque;

  if cd_coligada = 0 then begin
     qryInsert.ParamByName('cd_coligada').AsInteger :=  getColigadaByTurma(turma, AnoSemestre);
     if qryInsert.ParamByName('cd_coligada').AsInteger =0 then begin
        qryInsert.ParamByName('cd_coligada').AsInteger := 1;
     end;

  end else begin
     qryInsert.ParamByName('cd_coligada').AsInteger :=  cd_coligada;
  end;

  // Movido a criação do NN para o final da funçao, para que o registro seja incluido
  // Logo apos ter solicitado um NN, evitando assim sua duplicacao
  if DM.variavel_parametro('financeiro_boleto_gerar_nn') <> 'N' then begin

     qryInsert.ParamByName('NossoNumero').AsString := DM.NovoNumero(Departamento, Turma, AnoSemestre, 0, 0, 0, CodigoAluno, Copy( qryInsert.ParamByName('DataVencimento').AsString , 3, 2 ), Copy( qryInsert.ParamByName('DataEmissao').AsString, 3, 2 )  );

  end else begin

     qryInsert.ParamByName('NossoNumero').AsString := '';

  end;

  if RespNFSE <= 0 then
  begin
     qryInsert.ParamByName('cd_resp_nfse').Clear;
  end;

  if RespNFSE > 0 then
  begin
     qryInsert.ParamByName('cd_resp_nfse').AsInteger := RespNFSE;
  end;

  qryInsert.ExecSQL;

  // Pegar o último cd_mensalidade
  iCodMensa := DM.LastInsert;

  // Definir o Código de Origem da Mensalidade, sendo igual ao código da própria Mensalidade

  with qyAux do begin
      Close;
      SQL.Clear;
      SQL.Add(
      ' UPDATE mensalidades                          ' +
      ' SET cd_mensalidade_origem  = cd_mensalidade  ' +
      '   , ds_autentica_impressao = md5(cd_mensalidade) ' +
      ' WHERE                                        ' +
      '   codigoaluno = :CdAluno  AND                ' +
      '   cd_mensalidade_origem = -1                        '
      );
      ParamByName('CdAluno').AsInteger := CodigoAluno;
      ExecSQL;
  end;



  // Criar movimento_cr
  // TipoParcela = 1 = Parcial não deverá criar

  if TipoParcela <> 1 then begin

         Movimento := TMovimento.create;

         Movimento.TipoDeAcao      := GerarTitulos;
         Movimento.CodigoTitulo    := iCodMensa;
         
         Movimento.Coligada :=  getColigadaByTurma(turma, AnoSemestre);

         if AcaoCR <> 10 then
            Movimento.CodAcao := DM.BuscarCodigoAcaoPadrao( AcaoCR )
        else
            if TipoParcela = 4 then
                Movimento.CodAcao    := DM.BuscarCodigoAcaoPadrao( 13 )
             else
                Movimento.CodAcao    := DM.BuscarCodigoAcaoPadrao( 10 );

         Movimento.ValorMovimento  := RoundFloat( ValorBruto, 2 ) + ValorExtra;

         Movimento.RegistrarMovimentacaoCR( 0 );

         Movimento.Free;

         // Gerar Remessa
         DM.FazAcaoRemessa(arGerarMensalidade, iCodMensa);

         // Enviar dados para a Contabilidade

         IncluirAcaoContabil(iCodMensa, acGerarTituloCR );
      
  end;

  if criarAcaoCondicionalPadrao and
     (DescontoCondic > 0) then
  begin
      DM.criarAcaoAutomaticaDescontoCondicional(iCodMensa, DescontoCondic);
  end;

  Screen.Cursor := crDefault;

  // Gravar Log

  chaves := FillString(IntToStr(CodigoAluno), alRight, '0', 10, true ) + ';' +
                   IntToStr(AnoSemestre) + ';' + Turma + ';' +
                   IntToStr(Parcela) + ';' +
                   FormatDateTime('dd/mm/yyyy',Vencimento) + ';';


  DM.setLog(2013, 'inclusao', chaves, getColigadaByTurma(turma, AnoSemestre), 'Parcela gerada (NN = ' + qryInsert.ParamByName('NossoNumero').AsString +  ')');

   try
      listaCreditosDisponiveis := TCredito.GetCreditosDisponiveisPessoa(TPessoa.Create(CodigoAluno));
      valorCreditoDisponivel := TCredito.GetSomaValorCreditoDisponivel(listaCreditosDisponiveis);
      if valorCreditoDisponivel > 0 then
      begin
         if TGeneral.Mensagem(MSG_QUESTIONA_USO_CREDITOS_DISPONIVEIS, '', MB_YESNO + MB_ICONQUESTION) = mrYes then
         begin
            TMensalidade.GetMensalidade(iCodMensa).AplicarDescontoCredito(listaCreditosDisponiveis, valorCreditoDisponivel);
         end;
      end;
   except
      on E:Exception do
      begin
         //
      end;
   end;

  Result := iCodMensa;
end;

procedure TDM.InicializaTabelaMatriculas;
begin
  tblMatriculas.Close;
  tblMatriculas.SQL.Clear;
  tblMatriculas.SQL.Add( 'select * from Matriculas where (CodigoAluno = :CodigoAluno) and ' );
  tblMatriculas.SQL.Add( '(AnoSemestre = :AnoSemestre) and ' );
  tblMatriculas.SQL.Add( '(Turma = :Turma) order by AnoSemestre' );
end;

procedure TDM.IniciarDiario(const nr_anosemestre, nr_etapa: Integer;
  const cd_curso, cd_turma: String; const cd_disciplina, cd_professor, cd_grupo: Integer);
const
   SQL_TURMAS_PROFESSORES = ' SELECT '+
                            '      tp.anosemestre, tp.curso, tp.turma, tp.disciplina, tp.professor '+
                            ' FROM '+
                            '      turmasprofessores tp '+
                            '      LEFT JOIN diario_grupos dg ON ( '+
                            '            dg.nr_anosemestre = tp.anosemestre AND '+
                            '            dg.cd_curso = tp.curso AND '+
                            '            dg.cd_turma = tp.turma AND '+
                            '            dg.cd_disciplina = tp.disciplina AND '+
                            '            dg.cd_professor = tp.professor '+
                            '      ) '+
                            ' WHERE '+
                            '      tp.anosemestre = :anosemestre ';
begin
   { Verifica se todos os parametros foram passados,
     caso não busca as informações em turmasprofessores }

   qyTurmasProfessores.SQL.Clear;

   qyTurmasProfessores.SQL.Text := SQL_TURMAS_PROFESSORES;
   qyTurmasProfessores.ParamByName('anosemestre').AsString := IntToStr(nr_anosemestre);

   if cd_curso <> '' then
      qyTurmasProfessores.SQL.Text := qyTurmasProfessores.SQL.Text + ' AND tp.curso LIKE ' + QuotedStr(cd_curso);

   if cd_turma <> '' then
      qyTurmasProfessores.SQL.Text := qyTurmasProfessores.SQL.Text + ' AND tp.turma LIKE ' + QuotedStr(cd_turma);

   if cd_disciplina <> 0 then
      qyTurmasProfessores.SQL.Text := qyTurmasProfessores.SQL.Text + ' AND tp.disciplina = ' + IntToStr(cd_disciplina);

   if cd_professor <> 0 then
      qyTurmasProfessores.SQL.Text := qyTurmasProfessores.SQL.Text + ' AND tp.professor = ' + IntToStr(cd_professor);

   if cd_grupo <> 0 then
      qyTurmasProfessores.SQL.Text := qyTurmasProfessores.SQL.Text + ' AND dg.cd_grupo = ' + IntToStr(cd_grupo);

   // Busca as informações das turmas para iniciar o diário
   qyTurmasProfessores.Open;

   // Para cada turma encontrada inicia o diário
   while not qyTurmasProfessores.Eof do
   begin
   
     callProcedure(
         'CALL DIA_INICIAR_DIARIO ( ' +
            QuotedStr( qyTurmasProfessores.FieldByName('curso').AsString ) + ', ' +
            QuotedStr( qyTurmasProfessores.FieldByName('turma').AsString ) + ', ' +
            qyTurmasProfessores.FieldByName('disciplina').AsString + ', ' +
            qyTurmasProfessores.FieldByName('professor').AsString + ', ' +
            IntToStr(nr_anosemestre) + ', ' +
            IntToStr(nr_etapa) + ', ' +
            IntToStr(cd_grupo) +
         ')'
     );

     qyTurmasProfessores.Next;
   end;
   
end;

function TDM.IsAlunoFIES(const Aluno: Integer): Boolean;
const
   SSQLBolsaFIES = 'SELECT SN_RE_FIES FROM PESSOAS_BOLSAS WHERE CD_PESSOA = ?';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Stmt := PrepareStatement(SSQLBolsaFIES);
   try
      Stmt.SetInt(1, Aluno);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
         begin
            Result := Rs.GetInt(1) = 1;
         end
         else
            Result := False;
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
   end;
end;

function TDM.IsLite: Boolean;
begin
   Result := TUMNucleo.IsVersaoLite();
end;

function TDM.IsMatriculaBloqueada(const AlunoID: Cardinal): Boolean;
const
   SVariavel = 'estuda_reserv_matric_bloqueados';
var
   I, ID: Integer;
   S: AnsiString;
   Values: TStrings;
begin
   Result := False;

   S := DM.variavel_parametro(SVariavel);
   S := Trim(S);

   if S <> EmptyStr then
   begin
      Values := TStringList.Create;
      try
         Values.Delimiter := ';';
         Values.StrictDelimiter := True;
         Values.DelimitedText := S;

         for I := 0 to Values.Count - 1 do
            if TryStrToInt(Trim(Values[I]), ID) then
               if AlunoID = ID then
               begin
                  Result := True;
                  Break;
               end;
      finally
         FreeAndNil(Values);
      end;
   end;   
end;

procedure TDM.tblMensalidadesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco( DataSet, E );
end;

function TDM.getCdUltimaMsgPrestacaoConta(mes_ano,
  cd_coligada: string): integer;
var
   zUltimoCodigo  : TUMZQuery;
   iUltimaMsg     : integer;
begin
   iUltimaMsg := 0;

   if mes_ano <> '' then
   begin
      Self.CriarConsulta( zUltimoCodigo );

      zUltimoCodigo.SQL.Text := 'SELECT MAX(cd_prestacao_contas) ' +
      'cd_prestacao_contas FROM fin_prestacao_contas WHERE '+
      'DATE_FORMAT(dt_periodo,''%m/%Y'') = :nr_mesano AND cd_coligada = '+
      ':cd_coligada';

      zUltimoCodigo.ParamByName('nr_mesano').AsString   := mes_ano;
      zUltimoCodigo.ParamByName('cd_coligada').AsString := cd_coligada;
      zUltimoCodigo.Open;

      iUltimaMsg := zUltimoCodigo.FieldByName('cd_prestacao_contas').AsInteger;

      FreeAndNil( zUltimoCodigo );
   end;

   Result := iUltimaMsg;
end;

function TDM.GetChavePermissaoLite(const Chave: string;
   const ChaveModulo: string): Boolean;
var
   licencaDecriptografada: String;
begin
   if not qyVerificaPermissaoLite.Active then
      qyVerificaPermissaoLite.Open;

   qyVerificaPermissaoLite.First;

   if qyVerificaPermissaoLite.Locate( 'ds_chave;chave', varArrayOf([Chave, ChaveModulo]) , []) then
   begin
      licencaDecriptografada := TUMCriptografia.UMCrypt( qyVerificaPermissaoLite.FieldByName('ds_licenca').AsString,
         ctDecode, CHAVE_LITE );
      Result := AnsiEndsStr( 'LITE', licencaDecriptografada);
   end
   else
      Result := false;
end;

function TDM.GetCidadeFromColigada(const cd_coligada: Integer): String;
begin
   LoadEstadoCidadeColigadas();

   Result := ArrayCidadeFromColigada.Values[ IntToStr( cd_coligada ) ];
end;

function TDM.getColigadaTurma(STurma: String): Integer;
var
  qyBuscaTurma: TUMZQuery;
begin
  if sTurma = '' then
  begin
     result := 0;
  end
  else
  begin
     CriarConsulta(qyBuscaTurma);

     qyBuscaTurma.SQL.Text := 'SELECT cd_coligada FROM turmas WHERE codigo = :turma';
     qyBuscaTurma.ParamByName('turma').AsString := sTurma;

     qyBuscaTurma.Open();

     result:=  qyBuscaTurma.FieldByName('cd_coligada').AsInteger;
     FreeAndNil(qyBuscaTurma);
  end;
end;

function TDM.getDtUltimoBloqueio( cd_coligada: string; dtbase : TDateTime): TDateTime;
var
   zPrestacao           : TUMZQuery;
   nr_ano               : integer;
   i                    : integer;
   mes_ano              : string;
   cd_prestacao_conta   : integer;
   dt_bloqueio          : TDateTime;
   dt_provisorio        : TDateTime;
begin
   dt_bloqueio    := 0;
   nr_ano         := YearOf( dtbase );

   Self.CriarConsulta( zPrestacao );

   for i := 1 to 12 do
   begin
      mes_ano              := Concat(FormatFloat( '00', i ),'/',FormatFloat( '0000', nr_ano ));
      cd_prestacao_conta   := getCdUltimaMsgPrestacaoConta( mes_ano, cd_coligada );

      //verifica se a ultima mensagem do periodo está finalizada
      if cd_prestacao_conta <> 0 then
      begin
         zPrestacao.Close();
         zPrestacao.SQL.Text := 'SELECT * FROM fin_prestacao_contas WHERE cd_prestacao_contas = :cd_prestacao_conta';
         zPrestacao.ParamByName('cd_prestacao_conta').AsInteger := cd_prestacao_conta;
         zPrestacao.Open();

         dt_provisorio := zPrestacao.FieldByName('dt_bloqueio_provisorio').AsDateTime;

         //se a data de bloqueio provisoria for maior então substitui.
         if dt_provisorio > dt_bloqueio then
         begin
            dt_bloqueio := dt_provisorio;
         end;

      end;
   end;

   FreeAndNil( zPrestacao );

   Result := dt_bloqueio;
end;

function TDM.GetEstadoFromColigada(const cd_coligada: Integer): String;
begin
   LoadEstadoCidadeColigadas();

   Result := ArrayEstadoFromColigada.Values[ IntToStr( cd_coligada ) ];
end;

function TDM.getColigadaByCurso(cd_curso: String): String;
var
  qyBuscaColigada: TUMZQuery;
begin
  if cd_curso = '' then
  begin
     result := '';
  end else begin
     CriarConsulta(qyBuscaColigada);

     qyBuscaColigada.SQL.Text := 'SELECT cd_coligada FROM cursos_coligadas WHERE cd_curso = :curso';
     qyBuscaColigada.ParamByName('curso').AsString := cd_curso;

     qyBuscaColigada.Open();

     result:=  qyBuscaColigada.FieldByName('cd_coligada').AsString;
     FreeAndNil(qyBuscaColigada);
  end;
end;

function TDM.getColigadaByTurma(sTurma: String; iAnoSem : Integer = 1): Integer;
var
  qyBuscaTurma: TUMZQuery;
begin
  if sTurma = '' then
  begin
     result := 0;
  end
  else
  begin
     CriarConsulta(qyBuscaTurma);

     qyBuscaTurma.SQL.Text := 'SELECT cd_coligada FROM turmas WHERE codigo = :turma AND anosemestre = :anosemestre';
     qyBuscaTurma.ParamByName('turma').AsString := sTurma;
     qyBuscaTurma.ParamByName('anosemestre').AsInteger := iAnoSem;

     qyBuscaTurma.Open();

     result:=  qyBuscaTurma.FieldByName('cd_coligada').AsInteger;
     FreeAndNil(qyBuscaTurma);
  end;
end;

function TDM.getDisciplinaFrente(iDisciplina: Integer; iAnosemestre: Integer; sTurma: string): Integer;
var
   qyDisciplinaFrente: TUMZQuery;
begin
   DM.CriarConsulta(qyDisciplinaFrente);

   qyDisciplinaFrente.SQL.Text := ''+
   ' SELECT ' +
	'   GD.CD_DISCIPLINA_FRENTE ' +
   ' FROM ' +
	'   TURMAS T ' +
	'   INNER JOIN GRADES_DISCIPLINAS GD ON (T.CURSO = GD.CD_CURSO AND T.CD_GRADE = GD.CD_GRADE AND T.SERIE = GD.NR_SERIE) ' +
   ' WHERE ' +
	'   GD.CD_DISCIPLINA =  :CD_DISCIPLINA ' +
	'   AND T.CODIGO LIKE :CD_TURMA ' +
   '   AND T.ANOSEMESTRE = :NR_ANOSEMESTRE ' +
	'   AND GD.CD_DISCIPLINA_FRENTE IS NOT NULL ';

   qyDisciplinaFrente.ParamByName('CD_DISCIPLINA').AsInteger := iDisciplina;
   qyDisciplinaFrente.ParamByName('CD_TURMA').AsString := sTurma;
   qyDisciplinaFrente.ParamByName('NR_ANOSEMESTRE').AsInteger := iAnosemestre;

   qyDisciplinaFrente.Open();

   if qyDisciplinaFrente.RecordCount > 0 then
      getDisciplinaFrente := qyDisciplinaFrente.FieldByName('CD_DISCIPLINA_FRENTE').AsInteger
   else
      getDisciplinaFrente := -1;

   FreeAndNil(qyDisciplinaFrente);
end;

function TDM.getTipoAvaliacao(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iNrProva: Integer) : Integer;
var
   qyTipoAvaliacao: TUMZQuery;
begin
   DM.CriarConsulta(qyTipoAvaliacao);

   // Busca o tipo de avaliação de uma prova
   qyTipoAvaliacao.Close;
   qyTipoAvaliacao.SQL.Text := ' ' +
   ' SELECT ' +
   '   cd_avaliacao_tipo ' +
   ' FROM ' +
   '   diario_provas ' +
   ' WHERE ' +
   '   anosemestre = :nr_anosemestre ' +
   '   AND turma = :cd_turma ' +
   '   AND disciplina = :cd_disciplina ' +
   '   AND bimestre = :nr_bimestre ' +
   '   AND nro_nota = :nr_prova ';

   qyTipoAvaliacao.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyTipoAvaliacao.ParamByName('cd_turma').AsString := sTurma;
   qyTipoAvaliacao.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyTipoAvaliacao.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyTipoAvaliacao.ParamByName('nr_prova').AsInteger := iNrProva;

   qyTipoAvaliacao.Open;

   getTipoAvaliacao := qyTipoAvaliacao.FieldByName('cd_avaliacao_tipo').AsInteger;
end;

function TDM.getDisciplinasFazemFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer) : TStringList;
var
   qyDisciplinasFazemFrente: TUMZQuery;
   arrDisciplinas: TStringList;
begin
   DM.CriarConsulta(qyDisciplinasFazemFrente);

   arrDisciplinas := TStringList.Create();
   arrDisciplinas.Clear;

   // Busca as disciplinas que fazem frente a disciplina frente passada como parametro
   qyDisciplinasFazemFrente.Close;
   qyDisciplinasFazemFrente.SQL.Text := ' ' +
   ' SELECT ' +
   '   gd.cd_disciplina ' +
   ' FROM ' +
   '   turmas t ' +
   '   INNER JOIN grades_disciplinas gd ON ( ' +
   '      gd.cd_grade = t.cd_grade AND ' +
   '      gd.cd_curso = t.curso AND ' +
   '      gd.nr_serie = t.serie ' +
   '   ) ' +
   ' WHERE ' +
   '   t.anosemestre = :nr_anosemestre ' +
   '   AND t.codigo = :cd_turma ' +
   '   AND gd.cd_disciplina_frente = :cd_disciplina ';

   qyDisciplinasFazemFrente.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyDisciplinasFazemFrente.ParamByName('cd_turma').AsString := sTurma;
   qyDisciplinasFazemFrente.ParamByName('cd_disciplina').AsInteger := iDisciplina;

   qyDisciplinasFazemFrente.Open;

   while not qyDisciplinasFazemFrente.Eof do
   begin
      // Adiciona as disciplinas encontradas no array de disciplinas
      arrDisciplinas.Add(qyDisciplinasFazemFrente.FieldByName('cd_disciplina').AsString);

      qyDisciplinasFazemFrente.Next;
   end;

   getDisciplinasFazemFrente := arrDisciplinas;
end;

function TDM.isDisciplinaFazFrente(iDisciplina: Integer; sCurso: String) : Boolean;
var
   qyDisciplinasFazFrente: TUMZQuery;
begin
   DM.CriarConsulta(qyDisciplinasFazFrente);

   // Busca as disciplinas que fazem frente a disciplina frente passada como parametro
   qyDisciplinasFazFrente.Close;
   qyDisciplinasFazFrente.SQL.Text := ' ' +
   ' SELECT ' +
   '   cd_disciplina ' +
   ' FROM ' +
   '   grades_disciplinas ' +
   ' WHERE ' +
   '   cd_disciplina_frente = :cd_disciplina_frente ' +
   '   AND cd_curso = :cd_curso ';

   qyDisciplinasFazFrente.ParamByName('cd_disciplina_frente').AsInteger := iDisciplina;
   qyDisciplinasFazFrente.ParamByName('cd_curso').AsString := sCurso;

   qyDisciplinasFazFrente.Open;

   Result := False;
   if not qyDisciplinasFazFrente.Eof then
   begin
      Result := True;
   end;
end;

procedure TDM.removerDisciplinaFrente(iDisciplina: Integer; sCurso: String);
var
   qyRemoverVinculoDisciplinaFazFrente: TUMZQuery;
begin
   DM.CriarConsulta(qyRemoverVinculoDisciplinaFazFrente);

   // Busca as disciplinas que fazem frente a disciplina frente passada como parametro
   qyRemoverVinculoDisciplinaFazFrente.Close;
   qyRemoverVinculoDisciplinaFazFrente.SQL.Text := ' ' +
   ' UPDATE ' +
   '   grades_disciplinas ' +
   ' SET ' +
   '   cd_disciplina_frente = NULL ' +
   ' WHERE ' +
   '   cd_disciplina_frente = :cd_disciplina_frente ' +
   '   AND cd_curso = :cd_curso ';

   qyRemoverVinculoDisciplinaFazFrente.ParamByName('cd_disciplina_frente').AsInteger := iDisciplina;
   qyRemoverVinculoDisciplinaFazFrente.ParamByName('cd_curso').AsString := sCurso;

   qyRemoverVinculoDisciplinaFazFrente.ExecSQL;
end;

function TDM.getAlunosPorTipoProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer) : TStringList;
var
   qyAlunos: TUMZQuery;
begin
   DM.CriarConsulta(qyAlunos);

   // Pega os alunos por tipo de prova de uma disciplina frente
   qyAlunos.Close;
   qyAlunos.SQL.Text := ' ' +
   ' SELECT ' +
   '   dpa.cd_pessoa ' +
   ' FROM ' +
   '   diario_provas dp ' +
	'   INNER JOIN diario_provas_alunos dpa ON ( ' +
	' 	   dp.anosemestre = dpa.nr_anosem ' +
	'	   AND dp.turma = dpa.cd_turma ' +
	'	   AND dp.disciplina = dpa.cd_disciplina ' +
	'     AND dp.bimestre = dpa.cd_bimestre ' +
	'     AND dp.nro_nota = dpa.nr_prova ' +
	'   ) ' +
   ' WHERE ' +
   '   dp.anosemestre = :nr_anosemestre ' +
   '   AND dp.turma LIKE :cd_turma ' +
   '   AND dp.disciplina = :cd_disciplina ' +
   '   AND dp.bimestre = :nr_bimestre ' +
   '   AND dp.cd_avaliacao_tipo = :cd_avaliacao_tipo ';

   qyAlunos.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyAlunos.ParamByName('cd_turma').AsString := sTurma;
   qyAlunos.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyAlunos.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyAlunos.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;

   qyAlunos.Open;

   Result := TStringList.Create;
   
   while not qyAlunos.Eof do
   begin
      Result.Add(qyAlunos.FieldByName('cd_pessoa').AsString);

      qyAlunos.Next;
   end;

   FreeAndNil(qyAlunos);
end;


function TDM.getSomaNotasProvasMesmoTipo(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer) : TNota;
var
   qySomaNotasMesmoTipo: TUMZQuery;
begin
   DM.CriarConsulta(qySomaNotasMesmoTipo);

   // Soma as notas das provas de mesmo tipo
   qySomaNotasMesmoTipo.Close;
   qySomaNotasMesmoTipo.SQL.Text := ' ' +
   ' SELECT ' +
   '   SUM(dpa.vl_nota) soma_notas ' +
   ' FROM ' +
   '   diario_provas dp ' +
	'   INNER JOIN diario_provas_alunos dpa ON ( ' +
	' 	   dp.anosemestre = dpa.nr_anosem ' +
	'	   AND dp.turma = dpa.cd_turma ' +
	'	   AND dp.disciplina = dpa.cd_disciplina ' +
	'     AND dp.bimestre = dpa.cd_bimestre ' +
	'     AND dp.nro_nota = dpa.nr_prova ' +
	'   ) ' +
   ' WHERE ' +
   '   dp.anosemestre = :nr_anosemestre ' +
   '   AND dp.turma LIKE :cd_turma ' +
   '   AND dp.disciplina = :cd_disciplina ' +
   '   AND dp.bimestre = :nr_bimestre ' +
   '   AND dp.cd_avaliacao_tipo = :cd_avaliacao_tipo ' +
   '   AND dpa.cd_pessoa = :cd_pessoa ';

   qySomaNotasMesmoTipo.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qySomaNotasMesmoTipo.ParamByName('cd_turma').AsString := sTurma;
   qySomaNotasMesmoTipo.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qySomaNotasMesmoTipo.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qySomaNotasMesmoTipo.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;
   qySomaNotasMesmoTipo.ParamByName('cd_pessoa').AsInteger := iCdPessoa;

   qySomaNotasMesmoTipo.Open;

   Result.vl_nota := qySomaNotasMesmoTipo.FieldByName('soma_notas').AsFloat;
   Result.IsNull := qySomaNotasMesmoTipo.FieldByName('soma_notas').IsNull;

   FreeAndNil(qySomaNotasMesmoTipo);
end;


function TDM.geraLogForm(formulario: TForm;abaEspecifica: String = '';operacao: String = 'Alteração'): String;
var
   valorAntigo,valorNovo,msgLog,campo : String;
   i: Integer;
   encontrouAba: Boolean;
   comp:TComponent;
   fieldUsado : TField;
begin
   msgLog := '';

   for  i := 0 to formulario.ComponentCount - 1 do
   begin
      valorNovo := '';
      valorAntigo := '';
      fieldUsado := nil;

      // Se não for um dos componentes usados vai pro proximo
      if not((formulario.Components[i] is TDBEdit) OR (formulario.Components[i] is TUMLookupComboBox) OR
         (formulario.Components[i] is TDBComboBox) OR (formulario.Components[i] is TDBLookupComboBox) OR
         (formulario.Components[i] is TDBMemo) OR (formulario.Components[i] is TDBCheckBox)) then
      begin
         continue;
      end;
      
      //Se forem componentes apenas de uma aba especifica verifica se esta nela
      comp :=  TComponent(formulario.Components[i]);
      if(abaEspecifica <> '') then
      begin

         encontrouAba := false;
         while comp.GetParentComponent <> nil do
         begin

            if(comp.GetParentComponent.Name = abaEspecifica) then
            begin
               encontrouAba := true;
               break;
            end;
            comp := comp.GetParentComponent;
         end;

         if not (encontrouAba) then
         begin
            continue;
         end;
      end;

      //Busca de cada componente da tela o field que ira trabalhar
      if (formulario.Components[i] is TDBEdit) then
      begin
         fieldUsado := TDBEdit(formulario.Components[i]).Field;
      end;

      if (formulario.Components[i] is TDBCheckBox) then
      begin
         fieldUsado := TDBCheckBox(formulario.Components[i]).Field;
      end;

      if (formulario.Components[i] is TDBMemo) then
      begin
         fieldUsado := TDBMemo(formulario.Components[i]).Field;
      end;

      if (formulario.Components[i] is TDBRadioGroup) then
      begin
         fieldUsado := TDBRadioGroup(formulario.Components[i]).Field;
      end;

      //Hierarquia de extensão das combobox, TumLook -> TdbLook
      if (formulario.Components[i] is TUMLookupComboBox) then
      begin
         fieldUsado := TUMLookupComboBox(formulario.Components[i]).Field;

         //Se usar Lookup por field pega o campo
         if (fieldUsado.LookupKeyFields <> '') then
         begin
            try
               fieldUsado := TUMLookupComboBox(formulario.Components[i]).DataSource.DataSet.FieldByName(fieldUsado.KeyFields);
            except
               //Não acho o campo continua
            end;
         end;
      end;

      //Tratamento para não entrar se for UMLookup
      if (formulario.Components[i] is TDBLookupComboBox) AND (fieldUsado = nil) then
      begin
         fieldUsado := TDBLookupComboBox(formulario.Components[i]).Field;

         //Se usar Lookup por field pega o campo
         if (fieldUsado.LookupKeyFields <> '') then
         begin
            try
               fieldUsado := TDBLookupComboBox(formulario.Components[i]).DataSource.DataSet.FieldByName(fieldUsado.KeyFields);
            except
               //Não acho o campo continua
            end;
         end;
      end;

      if (formulario.Components[i] is TDBComboBox) then
      begin
         fieldUsado := TDBComboBox(formulario.Components[i]).Field;
      end;

      if(fieldUsado = nil) then
      begin
         continue;
      end;

      campo := fieldUsado.FieldName;

      //retira possiveis campos repetidos
      if(pos(campo+':',msgLog) > 0) then
      begin
         continue;
      end; 


      if (fieldUsado.AsString <> '') then
      begin
         valorNovo := fieldUsado.AsString;
      end;

      try
      begin
         if (fieldUsado.OldValue <> null) then
         begin
            valorAntigo := fieldUsado.OldValue;
         end;
      end;
      except
          valorAntigo := '';
      end;

      // Retira a data padrão que o delphi pode colcoar em alguns campos
      valorNovo   := StringReplace(valorNovo, '30/12/1899 ', '',[rfReplaceAll, rfIgnoreCase]);
      valorAntigo := StringReplace(valorAntigo, '30/12/1899 ', '',[rfReplaceAll, rfIgnoreCase]);

      if (valorAntigo <> valorNovo) then
      begin
         if(operacao = 'Alteração') then
         begin
            msgLog := msgLog + campo + ': ' + valorAntigo + ' para ' + valorNovo + ', ';
         end else begin
            if (valorNovo <> '') then
            begin
               msgLog := msgLog + campo + ': ' + valorNovo + ', ';
            end;
         end;
      end;

   end;
   result := Copy(msgLog,0,Length(msgLog)-2);
end;

procedure TDM.gerarLogAlteracaoNota(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer; rNota: TNota);
var
   qyDadosLog: TUMZQuery;
   logDesc: string;
begin
   DM.CriarConsulta(qyDadosLog);

   // Busca o tipo de avaliação de uma prova
   qyDadosLog.Close;
   qyDadosLog.SQL.Text := ' ' +
   ' SELECT ' +
   '   dpa.nr_prova, dpa.vl_nota, dpa.sn_faltou ' +
   ' FROM ' +
   '   diario_provas dp ' +
	'   INNER JOIN diario_provas_alunos dpa ON ( ' +
	' 	   dp.anosemestre = dpa.nr_anosem ' +
	'	   AND dp.turma = dpa.cd_turma ' +
	'	   AND dp.disciplina = dpa.cd_disciplina ' +
	'     AND dp.bimestre = dpa.cd_bimestre ' +
	'     AND dp.nro_nota = dpa.nr_prova ' +
	'   ) ' +
   ' WHERE ' +
   '   dp.anosemestre = :nr_anosemestre ' +
   '   AND dp.turma LIKE :cd_turma ' +
   '   AND dp.disciplina = :cd_disciplina ' +
   '   AND dp.bimestre = :nr_bimestre ' +
   '   AND dp.cd_avaliacao_tipo = :cd_avaliacao_tipo ' +
   '   AND dpa.cd_pessoa = :cd_pessoa ';

   qyDadosLog.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyDadosLog.ParamByName('cd_turma').AsString := sTurma;
   qyDadosLog.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyDadosLog.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyDadosLog.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;
   qyDadosLog.ParamByName('cd_pessoa').AsInteger := iCdPessoa;

   qyDadosLog.Open;

   // Gera logs da alteração de notas na disciplina frente
   logDesc := '';
   logDesc := logDesc + 'Aluno: '+IntToStr(iCdPessoa)+', ';
   logDesc := logDesc + 'Prova: '+qyDadosLog.FieldByName('nr_prova').AsString+', ';
   logDesc := logDesc + 'Nota de: '+qyDadosLog.FieldByName('vl_nota').AsString+', ';
   logDesc := logDesc + 'Nota para: '+FloatToStr(rNota.vl_nota)+', ';
   logDesc := logDesc + 'Faltou: '+qyDadosLog.FieldByName('sn_faltou').AsString+', ';
   logDesc := logDesc + 'Anosemestre: '+IntToStr(iAnosemestre)+', ';
   logDesc := logDesc + 'Turma: '+sTurma+', ';
   logDesc := logDesc + 'Disciplina: '+IntToStr(iDisciplina)+', ';
   logDesc := logDesc + 'Etapa: '+IntToStr(iBimestre)+' (alteração de nota automática na disciplina frente) [Acadêmico]';

   { Insere log de alteração de notas }
   DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_NOTA, logDesc, DMDiario.qTurmas.FieldByName('PROFESSOR').AsInteger);

   FreeAndNil(qyDadosLog);
end;

procedure TDM.atribuiNotaProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer; iCdPessoa: Integer; rNota: TNota);
var
   qyUpdateNotaDisciplinaFrente: TUMZQuery;
begin
   DM.CriarConsulta(qyUpdateNotaDisciplinaFrente);

   // Busca o tipo de avaliação de uma prova
   qyUpdateNotaDisciplinaFrente.Close;
   qyUpdateNotaDisciplinaFrente.SQL.Text := ' ' +
   ' UPDATE ' +
   '   diario_provas dp ' +
	'   INNER JOIN diario_provas_alunos dpa ON ( ' +
	' 	   dp.anosemestre = dpa.nr_anosem ' +
	'	   AND dp.turma = dpa.cd_turma ' +
	'	   AND dp.disciplina = dpa.cd_disciplina ' +
	'     AND dp.bimestre = dpa.cd_bimestre ' +
	'     AND dp.nro_nota = dpa.nr_prova ' +
	'   ) ' +
   ' SET ' +
   '   dpa.vl_nota = :vl_nota ' +
   ' WHERE ' +
   '   dp.anosemestre = :nr_anosemestre ' +
   '   AND dp.turma LIKE :cd_turma ' +
   '   AND dp.disciplina = :cd_disciplina ' +
   '   AND dp.bimestre = :nr_bimestre ' +
   '   AND dp.cd_avaliacao_tipo = :cd_avaliacao_tipo ' +
   '   AND dpa.cd_pessoa = :cd_pessoa ';

   qyUpdateNotaDisciplinaFrente.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_turma').AsString := sTurma;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyUpdateNotaDisciplinaFrente.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;
   qyUpdateNotaDisciplinaFrente.ParamByName('cd_pessoa').AsInteger := iCdPessoa;
   if rNota.IsNull then
      qyUpdateNotaDisciplinaFrente.ParamByName('vl_nota').IsNull
   else
      qyUpdateNotaDisciplinaFrente.ParamByName('vl_nota').AsFloat := rNota.vl_nota;

   qyUpdateNotaDisciplinaFrente.ExecSQL;
end;

procedure TDM.atribuiNotaProvaDisciplinaFrenteOrigem(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iNroNota: Integer; iCdPessoa: Integer);
var
   qyUpdateNotaDisciplinaFrenteOrigem: TUMZQuery;
begin
   DM.CriarConsulta(qyUpdateNotaDisciplinaFrenteOrigem);

   // Busca o tipo de avaliação de uma prova
   qyUpdateNotaDisciplinaFrenteOrigem.Close;
   qyUpdateNotaDisciplinaFrenteOrigem.SQL.Text := ' ' +
   ' UPDATE '+
   '   diario_provas dp '+
   '   INNER JOIN diario_provas_alunos dpa ON ( '+
   '      dp.anosemestre = dpa.nr_anosem '+
   '      AND dp.turma = dpa.cd_turma '+
   '      AND dp.disciplina = dpa.cd_disciplina '+
   '      AND dp.bimestre = dpa.cd_bimestre '+
   '      AND dp.nro_nota = dpa.nr_prova '+
   '   ) '+
   '   INNER JOIN diario_provas dp2 ON ( '+
   '      dp.cd_prova = dp2.cd_prova_origem '+
   '   ) '+
   '   INNER JOIN diario_provas_alunos dpa2 ON ( '+
   '      dpa2.nr_anosem = dp2.anosemestre '+
   '      AND dpa2.cd_turma = dp2.turma '+
   '      AND dpa2.cd_disciplina = dp2.disciplina '+
   '      AND dpa2.cd_bimestre = dp2.bimestre '+
   '      AND dpa2.nr_prova = dp2.nro_nota '+
   '      AND dpa2.cd_pessoa = dpa.cd_pessoa '+
   '   ) '+
   ' SET '+
   '  dpa2.vl_nota = dpa.vl_nota '+
   ' WHERE '+
   '  dp.anosemestre = :nr_anosemestre '+
   '  AND dp.turma LIKE :cd_turma '+
   '  AND dp.disciplina = :cd_disciplina '+
   '  AND dp.bimestre = :nr_bimestre '+
   '  AND dp.nro_nota = :nro_nota '+
   '  AND dpa.cd_pessoa = :cd_pessoa ';

   qyUpdateNotaDisciplinaFrenteOrigem.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyUpdateNotaDisciplinaFrenteOrigem.ParamByName('cd_turma').AsString := sTurma;
   qyUpdateNotaDisciplinaFrenteOrigem.ParamByName('cd_disciplina').AsInteger := iDisciplina;
   qyUpdateNotaDisciplinaFrenteOrigem.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyUpdateNotaDisciplinaFrenteOrigem.ParamByName('nro_nota').AsInteger := iNroNota;
   qyUpdateNotaDisciplinaFrenteOrigem.ParamByName('cd_pessoa').AsInteger := iCdPessoa;

   qyUpdateNotaDisciplinaFrenteOrigem.ExecSQL;
end;

function TDM.MatricularGrade(lngCodigoAluno : Longint; strTurma : String;
   intAnoSemestre: Integer; sGrade : String = '01';
   forcarMatriculaPreRequisito: Boolean = False;
   TransferenciaInterna: Boolean = False) : String;
const
   SSQLDisciplinaSituacaoFinal =
      'SELECT ' +
         'S.SN_FINAL ' +
      'FROM ' +
         'DISCIPLINAS D ' +
            'JOIN FICHAINDIVIDUAL F ON ' +
               '(D.CODIGO = F.DISCIPLINA) AND ' +
               '(D.CURSO = F.CURSO) ' +
            'JOIN SITUACAO S ON ' +
               '(F.SITUACAO = S.CD_SITUACAO) ' +
      'WHERE ' +
         'F.CODIGOALUNO = ? AND ' +
         'D.CODIGO = ? AND ' +
         'D.CURSO = ? AND ' +
         'F.SERIE = ? AND ' +
         'S.SN_FINAL = 1 ' +
      'LIMIT 1';
   SSQLInsertDisc =
      'INSERT INTO FICHAINDIVIDUAL ' +
         '(ANOSEMESTRE, CODIGOALUNO, TURMA, TURMAMATRICULA, '
         + 'DISCIPLINA, SITUACAO, CURSO, SERIE, GRAU, dt_inclusao)' +
      'SELECT ' +
         'M.ANOSEMESTRE,' +
         'M.CODIGOALUNO,' +
         'M.TURMA,' +
         'M.TURMA,' +
         'D.CD_DISCIPLINA,' +
         'M.SITUACAO,' +
         'T.CURSO,' +
         'T.SERIE,' +
         'T.GRAU, ' +
         'Now()' +
      'FROM ' +
         'MATRICULAS M ' +
            'JOIN TURMAS T ON ' +
               '(M.ANOSEMESTRE = T.ANOSEMESTRE) AND ' +
               '(M.TURMA = T.CODIGO) ' +
            'JOIN GRADES G ON ' +
               '(T.CURSO = G.CD_CURSO) AND ' +
               '(T.CD_GRADE = G.CD_GRADE) ' +
            'JOIN GRADES_DISCIPLINAS D ON ' +
                  '(G.CD_GRADE = D.CD_GRADE) AND ' +
                  '(G.CD_CURSO = D.CD_CURSO) AND ' +
                  '(T.SERIE = D.NR_SERIE) ' +
      'WHERE ' +
         'G.SN_ATIVO = ''S'' AND ' +
         'M.ANOSEMESTRE = ? AND ' +
         'M.TURMA = ? AND ' +
         'M.CODIGOALUNO = ? AND ' +
         'G.CD_GRADE = ? AND ' +
         'D.SN_OPTATIVA = 0 AND ' +
         'D.NR_SERIE <> -100 AND  ' +
         'NOT EXISTS (' +
            'SELECT ' +
               'ANOSEMESTRE,' +
               'TURMA,' +
               'CODIGOALUNO,' +
               'DISCIPLINA,' +
               'SERIE ' +
            'FROM ' +
               'FICHAINDIVIDUAL ' +
            'WHERE ' +
               'ANOSEMESTRE = M.ANOSEMESTRE AND ' +
               'TURMA = M.TURMA AND ' +
               'CODIGOALUNO = M.CODIGOALUNO AND ' +
               'DISCIPLINA = D.CD_DISCIPLINA AND ' +
               'SERIE = T.SERIE) ';

   SSQLInsertDiscFromTurmasHorarios =
      ' INSERT INTO FICHAINDIVIDUAL (' +
      '     ANOSEMESTRE,' +
      '     CODIGOALUNO,' +
      '     TURMA,' +
      '     turmamatricula,' +
      '     DISCIPLINA,' +
      '     SITUACAO,' +
      '     CURSO,' +
      '     SERIE,' +
      '     GRAU,' +
      '     dt_inclusao '+
      '  ) SELECT' +
      '     t.anosemestre,' +
      '     p.cd_pessoa,' +
      '     th.codigo,' +
      '     ? as turmamatricula,' +
      '     d.codigo as cd_disciplina,' +
      '     m.situacao,' +
      '     th.curso,' +
      '     t.serie,' +
      '     t.grau,' +
      '     Now() ' +
      '  FROM' +
      '     MATRICULAS AS M' +
      '  INNER JOIN turmas as T on (' +
      '     M.ANOSEMESTRE = T.ANOSEMESTRE AND' +
      '    M.TURMA = T.CODIGO' +
      '  )' +
      '  INNER JOIN TURMAS_HORARIOS AS H ON (' +
      '    T.CODIGO = H.TURMA_BASE' +
      '    AND T.ANOSEMESTRE = H.ANOSEMESTRE' +
      ' )' +
      ' INNER JOIN TURMAS AS TH ON (' +
      '    H.TURMA = TH.CODIGO' +
      '    AND H.ANOSEMESTRE = TH.ANOSEMESTRE' +
      ' )' +
      ' INNER JOIN DISCIPLINAS AS D ON (' +
      '    D.CODIGO = H.DISCIPLINA' +
      '     AND TH.CURSO = D.CURSO' +
      '  )' +
      '  INNER JOIN GRADES_DISCIPLINAS AS GD ON (' +
      '     TH.CD_GRADE = GD.CD_GRADE' +
      '     AND TH.CURSO = GD.CD_CURSO' +
      '     AND GD.CD_DISCIPLINA = D.CODIGO' +
      '     AND GD.CD_CURSO = D.CURSO' +
      '     AND GD.NR_SERIE = TH.SERIE' +
      '  )' +
      '  INNER JOIN CURSOS_MESTRE AS C ON (T.CURSO = C.CD_CURSO)' +
      '  INNER JOIN pessoas p ON (p.cd_pessoa = ? AND m.codigoaluno = p.cd_pessoa)' +
      '  LEFT JOIN fichaindividual fi_cursando ON ( ' +
		'	   fi_cursando.codigoaluno = p.cd_pessoa AND ' +
   	'		fi_cursando.disciplina = d.codigo AND ' +
   	'		fi_cursando.curso = d.curso AND ' +
   	'		fi_cursando.situacao = 1 ' +
	   '	) ' +
      '  WHERE' +
      '     M.turma = ? ' +
      '     AND M.ANOSEMESTRE = ? ' +
      '     AND GD.NR_SERIE <> -100' +
      '     AND fi_cursando.situacao IS NULL ' +
      '     AND NOT EXISTS (' +
      '        SELECT' +
      '           ANOSEMESTRE,' +
      '        TURMA,' +
      '        CODIGOALUNO,' +
      '        DISCIPLINA,' +
      '        SERIE' +
      '      FROM' +
      '        FICHAINDIVIDUAL' +
      '      WHERE' +
      '        ANOSEMESTRE = M.ANOSEMESTRE AND ' +
      '        TURMA = M.TURMA AND ' +
      '        CODIGOALUNO = M.CODIGOALUNO AND ' +
      '        DISCIPLINA = D.codigo AND ' +
      '        SERIE = T.SERIE) ' +
      '     %s   ' +
      '  GROUP BY ' +
      '     T.CURSO,' +
      '     H.TURMA,' +
      '     GD.CD_DISCIPLINA,' +
      '     D.DESCRICAO,' +
      '     GD.NR_AULAS,' +
      '     T.CD_GRADE,' +
      '     GD.NR_SERIE,' +
      '     T.GRAU';


   SSQLSelectDiscFromTurmasHorarios =
      '  SELECT '+
      ' 	   t.anosemestre, '+
	   '     p.cd_pessoa as codigoaluno, '+
	   '     p.nm_pessoa, '+
	   '     t.codigo AS turma, '+
	   '     d.codigo as cd_disciplina, '+
	   '     d.DESCRICAO AS DS_DISCIPLINA, '+
	   '     T.CURSO, '+
	   '     T.SERIE, '+
	   '     CAST( '+
		'        FCD_GET_RESTRICAO_DISCIPLINA ( '+
		'	         p.cd_pessoa, '+
      '			   TH.CURSO, '+
		'      	   T.CODIGO, '+
      '			   D.CODIGO, '+
      '			   TH.SERIE, '+
      '			   TH.CD_GRADE, '+
      '			   t.anosemestre, '+
      '			   :SN_MOSTRA_DISCIPLINAS_HORARIOS '+
   	'	      ) AS CHAR '+
      '	   ) AS NR_RESTRICAO '+
      '  FROM '+
      '	   TURMAS AS T '+ 
      '  INNER JOIN TURMAS_HORARIOS AS H ON ( '+
      '	   T.CODIGO = H.TURMA_BASE '+
      '   	AND T.ANOSEMESTRE = H.ANOSEMESTRE '+
      '   ) '+
      '   INNER JOIN TURMAS AS TH ON ( '+
      '   	H.TURMA = TH.CODIGO '+
      '   	AND H.ANOSEMESTRE = TH.ANOSEMESTRE '+
      '   ) '+
      '   INNER JOIN DISCIPLINAS AS D ON ( '+
      '   	D.CODIGO = H.DISCIPLINA '+
      '   	AND TH.CURSO = D.CURSO '+
      '   ) '+
      '   INNER JOIN GRADES_DISCIPLINAS AS GD ON ( '+
      '   	TH.CD_GRADE = GD.CD_GRADE '+
      '	   AND TH.CURSO = GD.CD_CURSO '+
      '   	AND GD.CD_DISCIPLINA = D.CODIGO '+
      '   	AND GD.CD_CURSO = D.CURSO '+
      '   	AND GD.NR_SERIE = TH.SERIE '+
      '   ) '+
      '   INNER JOIN CURSOS_MESTRE AS C ON ( '+
      '   	T.CURSO = C.CD_CURSO '+
      '   ) '+
      '   INNER JOIN pessoas p ON ( '+
      '      p.cd_pessoa = :cd_pessoa '+
      '   ) '+
      '   LEFT JOIN fichaindividual fi_cursando ON ( '+
		'  	fi_cursando.codigoaluno = p.cd_pessoa AND '+
		'  	fi_cursando.disciplina = d.codigo AND '+
		'  	fi_cursando.curso = d.curso AND '+
		'  	fi_cursando.situacao = 1 '+
		'   ) '+
      '   WHERE '+
      '   	 T.CODIGO = :turma '+
      '      AND T.ANOSEMESTRE = :anosemestre '+
      '      AND GD.NR_SERIE <> - 100 '+
      '      AND fi_cursando.situacao IS NULL '+
      '   GROUP BY '+
      '   	T.CURSO, '+
      '   	H.TURMA, '+
      '   	GD.CD_DISCIPLINA, '+
	   '     D.DESCRICAO, '+
	   '     GD.NR_AULAS, '+
	   '     T.CD_GRADE, '+
	   '     GD.NR_SERIE, '+
	   '     T.GRAU ';

   // Mesmo SQL que o de cima, só que ele só retorna os registros sem inserir 
   SSQLSelectDisc =
      'SELECT ' +
         'M.ANOSEMESTRE,' +
         'M.CODIGOALUNO,' +
         'P.NM_PESSOA,' +
         'M.TURMA,' +
         'D.CD_DISCIPLINA, ' +
         'DISC.DESCRICAO DS_DISCIPLINA, ' +
         'T.CURSO, ' +
         'T.SERIE, ' +
         'G.NR_PERC_MAX_REPROVACAO, ' +
         'FCD_GET_RESTRICAO_DISCIPLINA(M.CODIGOALUNO, T.CURSO, T.CODIGO, D.CD_DISCIPLINA, T.SERIE, T.CD_GRADE, T.ANOSEMESTRE, :SN_MOSTRA_DISCIPLINAS_HORARIOS) NR_RESTRICAO ' +
      'FROM ' +
         'MATRICULAS M ' +
            'JOIN PESSOAS P ON (P.CD_PESSOA = M.CODIGOALUNO) ' +
            'JOIN TURMAS T ON ' +
               '(M.ANOSEMESTRE = T.ANOSEMESTRE) AND ' +
               '(M.TURMA = T.CODIGO) ' +
            'JOIN GRADES G ON ' +
               '(T.CURSO = G.CD_CURSO) AND ' +
               '(T.CD_GRADE = G.CD_GRADE) ' +
            'JOIN GRADES_DISCIPLINAS D ON ' +
                  '(G.CD_GRADE = D.CD_GRADE) AND ' +
                  '(G.CD_CURSO = D.CD_CURSO) AND ' +
                  '(T.SERIE = D.NR_SERIE) ' +
            'JOIN DISCIPLINAS DISC ON (DISC.CODIGO = D.CD_DISCIPLINA AND DISC.CURSO = D.CD_CURSO) ' +
      'WHERE ' +
         'G.SN_ATIVO = ''S'' AND ' +
         'M.ANOSEMESTRE = :anosemestre AND ' +
         'M.TURMA = :turma AND ' +
         'M.CODIGOALUNO = :codigoaluno AND ' +
         'G.CD_GRADE = :cd_grade AND ' +
         'D.SN_OPTATIVA = 0 AND ' +
         'D.NR_SERIE <> -100 ' +
         ':not_in_disciplinas ' +
      'ORDER BY ' +
         'CASE WHEN NR_RESTRICAO IN (1, 2, 32) THEN 1 ELSE 2 END ASC';
         
var
   LObs,
   LChave,
   sn_mostra_disciplinas_horarios: string;
   
   Statement: IZPreparedStatement;
   Rs: IZResultSet;
   qyVarreDisciplinas,
   qyExecuteProcedure: TUMZQuery;

   sDisc,
   retornoAviso,
   nmAluno,
   paramDiscFromTurmasHorarios: String;

   nrRestricao,coligada_filha,coligada_matriz: Integer;

   PreRequisitoEspecialList,
   discRestricoesNaoMatricularList,
   discRestricoesMatricularList: TStringList;
begin
   CriarConsulta(qyVarreDisciplinas);
   CriarConsulta(qyExecuteProcedure);

    coligada_filha  := DM.getColigadaByTurma(strTurma,intAnoSemestre);
    coligada_matriz := DM.UsuarioLogado.ColigadaLogada;

   // Cria a lista de restrições das disciplinas que puderam ser matrículadas e não puderam ser matriculadas
   discRestricoesMatricularList := TStringList.Create;
   discRestricoesNaoMatricularList := TStringList.Create;

   // Busca qual o valor do parametro "sn_mostra_disciplinas_horarios" na base do cliente
   sn_mostra_disciplinas_horarios := DM.variavel_parametro('sn_mostra_disciplinas_horarios');

   if DM.variavel_parametro('reserva_matric_disciplinas_horario',true,coligada_filha,coligada_matriz) = 'S' then
   begin
      qyVarreDisciplinas.SQL.Text := SSQLSelectDiscFromTurmasHorarios;
      
      qyVarreDisciplinas.ParamByName('cd_pessoa').AsInteger := lngCodigoAluno;
   end;

   if DM.variavel_parametro('reserva_matric_disciplinas_horario',true,coligada_filha,coligada_matriz) = 'N' then
   begin
      qyVarreDisciplinas.SQL.Text := StringReplace(SSQLSelectDisc, ':not_in_disciplinas', '', [rfReplaceAll]);

      qyVarreDisciplinas.ParamByName('codigoaluno').AsInteger := lngCodigoAluno;
      qyVarreDisciplinas.ParamByName('cd_grade').AsString := sGrade;
   end;

   qyVarreDisciplinas.ParamByName('turma').AsString := strTurma;
   qyVarreDisciplinas.ParamByName('anosemestre').AsInteger := intAnoSemestre;
   qyVarreDisciplinas.ParamByName('SN_MOSTRA_DISCIPLINAS_HORARIOS').AsString := sn_mostra_disciplinas_horarios;

   qyVarreDisciplinas.Open();
   qyVarreDisciplinas.First();

   nmAluno := qyVarreDisciplinas.FieldByName('nm_pessoa').AsString;

   sDisc := '(-1';
   while not qyVarreDisciplinas.Eof do
   begin

      if TransferenciaInterna and
         (DM.variavel_parametro('transferencia.nao_transferir_disc_situ_final') = '1') then
      begin
         Statement := PrepareStatement(SSQLDisciplinaSituacaoFinal);
         try
            Statement.SetInt(1, qyVarreDisciplinas.FieldByName('codigoaluno').AsInteger);
            Statement.SetInt(2, qyVarreDisciplinas.FieldByName('cd_disciplina').AsInteger);
            Statement.SetString(3, qyVarreDisciplinas.FieldByName('curso').AsString);
            Statement.SetInt(4, qyVarreDisciplinas.FieldByName('SERIE').AsInteger);

            Rs := Statement.ExecuteQueryPrepared;
            try
               if Rs.Next then
               begin
                  sDisc := sDisc + ', ' + qyVarreDisciplinas.FieldByName('cd_disciplina').AsString;
                  qyVarreDisciplinas.Next;
                  Continue;
               end;
            finally
               Rs.Close;
            end;
         finally
            Statement.Close;
         end;
      end;

      // Testar se a disciplina possui alguma disciplina de pré-requisito, pré-requisito especial ou aluno já tenha cursado a disciplina ou uma equivalente
      // e neste caso não matricular

      // Utilizada mesma verificação da matrícula, onde, se dentro das restrições encontradas está a condição 1 (pré-requisito)
      nrRestricao := qyVarreDisciplinas.FieldByName('NR_RESTRICAO').AsInteger +
                    PreRequisitoEspecial(qyVarreDisciplinas.FieldByName('codigoaluno').ASInteger,
                                         qyVarreDisciplinas.FieldByName('curso').AsString,
                                         qyVarreDisciplinas.FieldByName('cd_disciplina').AsInteger,
                                         StrToInt(sGrade),
                                         intAnoSemestre,
                                         qyVarreDisciplinas.FieldByName('SERIE').AsInteger,
                                         PreRequisitoEspecialList,
                                         qyVarreDisciplinas.FieldByName('SERIE').AsInteger);

      // 1 - pré-requisito, 2 - pré-requisito especial e 32 - disciplina cursada ou equivalente a outra cursada
      if (((nrRestricao and 1) = 1) or ((nrRestricao and 2) = 2) or ((nrRestricao and 32) = 32)) then
      begin
        if not(((nrRestricao and 1) = 1) and (forcarMatriculaPreRequisito)) then
        begin
           // eliminar essas disciplinas da matrícula
           sDisc := sDisc + ', ' + qyVarreDisciplinas.FieldByName('cd_disciplina').AsString;
        end;
      end;

      // Verifica se houve algum tipo de restrição na matrícula desse aluno
      if nrRestricao > 0 then
      begin
         
        ////////////////////////////////////////////////////////////////
        // Verifica se a restrição é IMPEDITIVA (não matrícula o aluno)
        ////////////////////////////////////////////////////////////////

        // Pré-requisito   
        if (nrRestricao and 1) = 1 then
        begin
           if not(forcarMatriculaPreRequisito) then
           begin
              discRestricoesNaoMatricularList.Add('     "'+qyVarreDisciplinas.FieldByName('ds_disciplina').AsString+'" possui pré-requisito não cursado.');
           end;
        end;

        // Pré-requisito especial
        if (nrRestricao and 2) = 2 then
        begin
           discRestricoesNaoMatricularList.Add('     "'+qyVarreDisciplinas.FieldByName('ds_disciplina').AsString+'" possui pré-requisito especial não cursado. ('+PreRequisitoEspecialList.CommaText+')');
        end;

        // Já cursou a disciplina ou equivalência
        if (nrRestricao and 32) = 32 then
        begin
           discRestricoesNaoMatricularList.Add('     "'+qyVarreDisciplinas.FieldByName('ds_disciplina').AsString+'" ou equivalente a ela já foi cursada pelo aluno.');
        end;

        ////////////////////////////////////////////////////////////////
        // Verifica se a restrição é AVISO (matrícula o aluno, mas gera um aviso)
        ////////////////////////////////////////////////////////////////

        // Conflito de horário
        if (nrRestricao and 4) = 4 then
        begin
           discRestricoesMatricularList.Add('     "'+qyVarreDisciplinas.FieldByName('ds_disciplina').AsString+'" conflitou horário.');
        end;

        // Sem Vagas
        if (nrRestricao and 8) = 8 then
        begin
           discRestricoesMatricularList.Add('     "'+qyVarreDisciplinas.FieldByName('ds_disciplina').AsString+'" ultrapassou o número de vagas da turma.');
        end;

        // Sem horário
        if (nrRestricao and 16) = 16 then
        begin
           discRestricoesMatricularList.Add('     "'+qyVarreDisciplinas.FieldByName('ds_disciplina').AsString+'" sem horário definido.');
        end;

      end;

      qyVarreDisciplinas.Next;
   end;

   sDisc := sDisc + ')';

   DM.qrySelectEqui.Close();

   try

      if DM.variavel_parametro('reserva_matric_disciplinas_horario',true,coligada_filha,coligada_matriz) = 'S' then
      begin
         Statement := PrepareStatement(Format(SSQLInsertDiscFromTurmasHorarios, [' AND D.codigo NOT IN ' + sDisc]));
         Statement.SetString(1, strTurma);
         Statement.SetInt(2, lngCodigoAluno);
         Statement.SetString(3, strTurma);
         Statement.SetInt(4, intAnoSemestre);
      end;

      if DM.variavel_parametro('reserva_matric_disciplinas_horario',true,coligada_filha,coligada_matriz) = 'N' then
      begin
         Statement := PrepareStatement(SSQLInsertDisc + ' AND D.CD_DISCIPLINA NOT IN ' + sDisc);
         Statement.SetInt(1, intAnoSemestre);
         Statement.SetString(2, strTurma);
         Statement.SetInt(3, lngCodigoAluno);
         Statement.SetString(4, sGrade);
      end;
      
      Statement.ExecutePrepared; // Insere o aluno na disciplina

      qyVarreDisciplinas.Close();

      if DM.variavel_parametro('reserva_matric_disciplinas_horario',true,coligada_filha,coligada_matriz) = 'S' then
      begin
         qyVarreDisciplinas.SQL.Text := StringReplace(SSQLSelectDiscFromTurmasHorarios, ':not_in_disciplinas', ' AND D.codigo NOT IN '+sDisc, [rfReplaceAll]);

         qyVarreDisciplinas.ParamByName('cd_pessoa').AsInteger := lngCodigoAluno;
      end;

      if DM.variavel_parametro('reserva_matric_disciplinas_horario',true,coligada_filha,coligada_matriz) = 'N' then
      begin
         qyVarreDisciplinas.SQL.Text := StringReplace(SSQLSelectDisc, ':not_in_disciplinas', ' AND D.CD_DISCIPLINA NOT IN '+sDisc, [rfReplaceAll]);

         qyVarreDisciplinas.ParamByName('turma').AsString := strTurma;
         qyVarreDisciplinas.ParamByName('codigoaluno').AsInteger := lngCodigoAluno;
         qyVarreDisciplinas.ParamByName('cd_grade').AsString := sGrade;
      end;

      qyVarreDisciplinas.ParamByName('turma').AsString := strTurma;
      qyVarreDisciplinas.ParamByName('anosemestre').AsInteger := intAnoSemestre;

      qyVarreDisciplinas.Open();
      qyVarreDisciplinas.First();

      while not qyVarreDisciplinas.Eof do
      begin
         qyExecuteProcedure.Close;
         qyExecuteProcedure.SQL.Text := 'CALL INICIAR_MATRICULA ( ' +
                  qyVarreDisciplinas.FieldByName('anosemestre').AsString + ', ' +
                  QuotedStr(qyVarreDisciplinas.FieldByName('turma').AsString) + ', ' +
                  qyVarreDisciplinas.FieldByName('cd_disciplina').AsString + ', ' +
                  qyVarreDisciplinas.FieldByName('codigoaluno').AsString + ')';

         qyExecuteProcedure.ExecSQL;

         qyVarreDisciplinas.Next;
      end;

      FreeAndNil(qyVarreDisciplinas);

   finally
      Statement.Close;
   end;

   // Prepara o Retorno
   retornoAviso := '';

   if (discRestricoesMatricularList.Count > 0) or (discRestricoesNaoMatricularList.Count > 0) then
   begin
      retornoAviso := #13 + 'ALUNO: ' + IntToStr(lngCodigoAluno) + ' - ' + nmAluno;

      if discRestricoesMatricularList.Count > 0 then
      begin
         retornoAviso := retornoAviso + #13 + ' - Disciplinas Matriculadas' + #13 + discRestricoesMatricularList.Text;
      end;

      if discRestricoesNaoMatricularList.Count > 0 then
      begin
         retornoAviso := retornoAviso + #13 + ' - Disciplinas não Matriculadas' + #13 + discRestricoesNaoMatricularList.Text;
      end;

   end;

   Result := retornoAviso;

   LChave := Format('%d;%s;%d', [lngCodigoAluno, strTurma, intAnoSemestre]);
   LObs := 'Matrícular Grade: ' + sGrade;
   DM.setLog(1033, 'Inclusao', LChave,
      getColigadaByTurma(strTurma, intAnoSemestre), LObs);
end;

function TDM.PreRequisitoEspecial(CodAluno: Integer; Curso: String; Disciplina: Integer; Grade : Integer; Anosemestre: Integer; Serie: Integer; var PreRequisitoEspecialList: TStringList; nr_serieAluno: Integer): Integer;
const
   SQL_BUSCA_VALOR_GRADE =
      ' SELECT '+
      '    g.NR_PERC_MAX_REPROVACAO, '+
      '    gd.NR_SERIE '+
      ' FROM '+
      '    grades g '+
      ' INNER JOIN grades_disciplinas gd ON ( '+
      '    gd.CD_CURSO = g.CD_CURSO '+
      '    AND gd.CD_GRADE = g.CD_GRADE '+
      ' )   '+
      ' WHERE '+
	   '    g.CD_CURSO = :cd_curso '+
	   '    AND g.CD_GRADE = :cd_grade '+
	   '    AND gd.CD_DISCIPLINA = :cd_disciplina ';
var
   sSql: String;
   qySQLDinamicoPreRequisitoEspecial: TUMZQuery;

   qyBuscaValorGrade: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qySQLDinamicoPreRequisitoEspecial);

   qryPreRequisitoEspecial.Close;

   qryPreRequisitoEspecial.ParamByName('CD_CURSO').AsString := Curso;
   qryPreRequisitoEspecial.ParamByName('CD_GRADE').AsInteger := Grade;
   qryPreRequisitoEspecial.ParamByName('CD_DISCIPLINA').AsInteger := Disciplina;

   qryPreRequisitoEspecial.Open;

   // Limpa a lista de Pré Requisitos Especiais necessários (considera que não necessita de nenhum no inicio)
   PreRequisitoEspecialList := TStringList.Create;

   while not qryPreRequisitoEspecial.Eof do
   begin
      // Monta o SQL dinamico do pré-requisito especial
      sSql := '';
      sSql := qryPreRequisitoEspecial.FieldByName('me_tipo_sql').AsString;

      // Substitui algumas variáveis no SQL dinâmico que podem ser utilizadas
      sSql := StringReplace(sSql, '[$cd_curso$]', '''' + Curso + '''', [rfReplaceAll, rfIgnoreCase]);
      sSql := StringReplace(sSql, '[$cd_grade$]', IntToStr(Grade), [rfReplaceAll, rfIgnoreCase]);
      sSql := StringReplace(sSql, '[$cd_disciplina$]', IntToStr(Disciplina), [rfReplaceAll, rfIgnoreCase]);
      sSql := StringReplace(sSql, '[$cd_pessoa$]', IntToStr(CodAluno), [rfReplaceAll, rfIgnoreCase]);
      sSql := StringReplace(sSql, '[$nr_anosem$]', IntToStr(Anosemestre), [rfReplaceAll, rfIgnoreCase]);
      sSql := StringReplace(sSql, '[$nr_serie$]', IntToStr(Serie), [rfReplaceAll, rfIgnoreCase]);

      // Prepara para executar o SQL dinâmico para verificar o pré-requisito especial
      qySQLDinamicoPreRequisitoEspecial.Close;
      qySQLDinamicoPreRequisitoEspecial.SQL.Clear;
      qySQLDinamicoPreRequisitoEspecial.SQL.Text := sSql;
      // Executa o pré-requisito especial
      qySQLDinamicoPreRequisitoEspecial.Open;

      // Verifica se o aluno precisa do pré-requisito especial
      if (qySQLDinamicoPreRequisitoEspecial.RecordCount > 0) then
      begin
         // Essa disciplina necessita de pré-requisito especial
         PreRequisitoEspecialList.Add(qryPreRequisitoEspecial.FieldByName('ds_tipo_req').AsString);
      end;

      qryPreRequisitoEspecial.Next;
   end;

   if (nr_serieAluno <> -1) then
   begin
      DM.CriarConsulta(qyBuscaValorGrade);

      qyBuscaValorGrade.SQL.Text := SQL_BUSCA_VALOR_GRADE;
      qyBuscaValorGrade.ParamByName('cd_curso').AsString := Curso;
      qyBuscaValorGrade.ParamByName('cd_grade').AsInteger := Grade;
      qyBuscaValorGrade.ParamByName('cd_disciplina').AsInteger := Disciplina;
      qyBuscaValorGrade.Open;

      if qyBuscaValorGrade.FieldByName('NR_PERC_MAX_REPROVACAO').AsInteger > 0 then
      begin
        if (DM.getPorcentagemReprovacaoAluno(CodAluno, Curso) > qyBuscaValorGrade.FieldByName('NR_PERC_MAX_REPROVACAO').AsInteger) and
           (qyBuscaValorGrade.FieldByName('nr_serie').AsInteger >= nr_serieAluno) then
        begin
           PreRequisitoEspecialList.Add('Aluno ultrapassou os '+qyBuscaValorGrade.FieldByName('NR_PERC_MAX_REPROVACAO').AsString+'% máximo de disciplinas reprovadas no curso');
        end;
      end;
   end;

   // Verifica se existe algum pré-requisito especial para a disciplina
   if PreRequisitoEspecialList.Count > 0 then
   begin
      // Necessita pré-requisito especial
      Result := 2;
   end else begin
      // Não necessita de pré-requisito especial
      Result := 0;
   end;

end;

function TDM.NovoCodigoPessoa(const chave_local_chamada: String) : Longint;
const
   SQL_GET_NOVO_CODIGO_PESSOA =
      ' SELECT GET_NOVO_CD_PESSOA_COLIGADA( :chave_local_chamada, :cd_coligada_matriz ) AS cd_pessoa_novo ';
var
   qyGetNovoCodigoPessoa: TUMZReadOnlyQuery;
begin
   CriarConsulta( qyGetNovoCodigoPessoa );

   qyGetNovoCodigoPessoa.SQL.Text := SQL_GET_NOVO_CODIGO_PESSOA;

   try
      qyGetNovoCodigoPessoa.ParamByName( 'chave_local_chamada' ).AsString := chave_local_chamada;
      qyGetNovoCodigoPessoa.ParamByName( 'cd_coligada_matriz' ).AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

      qyGetNovoCodigoPessoa.Open;
      Result := qyGetNovoCodigoPessoa.FieldByName('cd_pessoa_novo').AsInteger;
   finally
      FreeAndNil( qyGetNovoCodigoPessoa );
   end;
end;

function TDM.NovoCodMatricula(CodigoAluno: Integer; Curso: String; AnoSem : Integer; AnoSemAtual : Integer): String;
Var
   NovoCod : String;
   Cod : Integer;
   qyCod : TUMZQuery;
   mascara : String;
begin
   {
   parametro = ds_mascara_matricula - tabela de departamentos
   [AS] Ano/Semestre inicial de ingresso na Instituição
   [as] Ano/Semestre inicial de ingresso no Curso
   [curso]  = Código do Curso
   [turma] = Código da Turma
   [qqq] = Sequencial. Quantidade de Alunos + 1
   [cd_pessoa] = Código Pessoal de Aluno

   Exemplo: [AS][curso][qqq]
   }
   if AnoSemAtual = 0 then AnoSemAtual := AnoSem;

   // Selecionar a Máscara para o código do aluno

   CriarConsulta(qyCod);

   qyCod.Close();
   qyCod.SQL.Text :=
      ' SELECT DISTINCT D.DS_MASCARA_MATRICULA FROM CURSOS_MESTRE C ' +
      ' JOIN CURSOS_COLIGADAS CC ON (C.CD_CURSO = CC.CD_CURSO) ' +
      ' JOIN DEPARTAMENTOS D ON (CC.CD_DEPTO = D.CODIGO) ' +
      ' WHERE CC.SN_ATIVO = 1 AND C.CD_CURSO = ' + QuotedStr(Curso);

   try
      qyCod.Open();
      mascara := qyCod.FieldByName('ds_mascara_matricula').AsString;
   except
      mascara := '[cd_pessoa]';
   end;

   if mascara = '' then mascara := '[cd_pessoa]';

   NovoCod := mascara;

   NovoCod := ReplaceStr(NovoCod, '[as]', Copy(IntToStr(AnoSem), 4, 2));
   NovoCod := ReplaceStr(NovoCod, '[AS]', Copy(IntToStr(AnoSemAtual), 4, 2));
   NovoCod := ReplaceSTR(NovoCod, '[curso]', FillString(Curso, alRight, '0', 2, true));

   NovoCod := ReplaceStr(NovoCod, '[cd_pessoa]', IntToStr(CodigoAluno));

   NovoCod := ReplaceSTR(NovoCod, '[qqq]', '%');


   qyCod.Close();
   qyCod.SQL.Text :=
       ' Select nr_matricula from matriculas_curso ' +
       ' WHERE nr_matricula like ''' + NovoCod + ''' ' +
       ' ORDER BY nr_matricula DESC';
   qyCod.Open();

   if qyCod.IsEmpty then begin
      NovoCod := ReplaceStr(NovoCod, '%', FillString('1', alRight, '0', 3, false));
   end
   else begin
      qyCod.First;
      Cod := StrToInt( Copy(qyCod.FieldByName('nr_matricula').AsString, Length(qyCod.FieldByName('nr_matricula').AsString)-2,3 ) );
      Inc(Cod);
      NovoCod := ReplaceStr(NovoCod, '%', FillString( IntToStr(Cod), alRight, '0', 3, false ));
   end;

   if mascara <> '[cd_pessoa]' then begin
   
      with qyCod do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_login = ''' + NovoCod + ''' WHERE cd_pessoa = ' + IntToStr(CodigoAluno) + ' AND ds_login is NULL ';
        ExecSQL();
      end;

   end;   

   FreeAndNil(qyCod);
   Result := novoCod;

end;

procedure TDM.DeptoCursoTurma( AnoSemestre : Integer; Turma : String );
begin
  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := AnoSemestre;
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := Turma;
  DM.tblDeptoCursoTurma.Open;
end;

function TDM.ProfessoresTurma( intAnoSemestre : Integer;
  strTurma : String; iDisciplina : Integer ) : String;
var
  strAux : String;
  tblProfessoresTurma : TUMZQuery;
begin
  CriarConsulta(tblProfessoresTurma);

  tblProfessoresTurma.Close;
  tblProfessoresTurma.SQL.Text :=
    ' SELECT DISTINCT pessoas.nm_pessoa as Apelido          ' +
    ' FROM TurmasProfessores                                      '+
    ' INNER JOIN Disciplinas ON (TurmasProfessores.Disciplina = Disciplinas.Codigo) AND (TurmasProfessores.Curso = Disciplinas.Curso) '+
    ' INNER JOIN Professores ON TurmasProfessores.Professor = Professores.cd_pessoa  ' +
    ' INNER JOIN pessoas on (pessoas.cd_pessoa = professores.cd_pessoa)  '+
    ' WHERE TurmasProfessores.AnoSemestre = :AnoSemestre and        ' +
    '   TurmasProfessores.Turma = :Turma and                        ' +
    '   Disciplinas.Codigo = :Disciplina                            ';

  tblProfessoresTurma.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  tblProfessoresTurma.ParamByName('Turma').AsString := strTurma;
  tblProfessoresTurma.ParamByName('Disciplina').AsInteger := iDisciplina;
  tblProfessoresTurma.Open;

  strAux := '';

  while not tblProfessoresTurma.Eof do
  begin
    if strAux <> '' then
      strAux := strAux + ' / ';

    strAux := strAux + tblProfessoresTurma.FieldByName('Apelido').AsString;
    tblProfessoresTurma.Next;
  end;

  FreeAndNil(tblProfessoresTurma);

  Result := strAux;

end;



procedure TDM.tblFichaIndividualBeforePost(DataSet: TDataSet);
var
  n : word;
  dNotaMaxima : double;
begin
  tblFichaIndividualUsuario.AsInteger := DM.tblUsuariosCodigo.AsInteger;

  if Dm.variavel_parametro('valor_maximo_medias') <> '' then begin
     dNotaMaxima := StrToFloat(Dm.variavel_parametro('valor_maximo_medias'));
  end
  else begin
     dNotaMaxima := 10; 
  end;

  if tblFichaIndividualFalta1.AsString = '' then
     tblFichaIndividualFalta1.AsFloat := 0;

  if tblFichaIndividualFalta2.AsString = '' then
     tblFichaIndividualFalta2.AsFloat := 0;

  if tblFichaIndividualFalta3.AsString = '' then
     tblFichaIndividualFalta3.AsFloat := 0;

  if tblFichaIndividualFalta4.AsString = '' then
     tblFichaIndividualFalta4.AsFloat := 0;


  { cuidar com arredondamento de médias e médias maiores que 10 }

  for n:= 1 to 10 do
  begin

     if tblFichaIndividual.FieldByName('nota' + IntToStr(n)).AsCurrency > 0 then
     begin
        tblFichaIndividual.FieldByName('nota' + IntToStr(n)).AsCurrency :=
           RoundFloat(tblFichaIndividual.FieldByName('nota' + IntToStr(n)).AsCurrency, tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger);
     end;

     if tblFichaIndividual.FieldByName('exame' + IntToStr(n)).AsCurrency > 0 then
     begin
        tblFichaIndividual.FieldByName('exame' + IntToStr(n)).AsCurrency :=
           RoundFloat(tblFichaIndividual.FieldByName('exame' + IntToStr(n)).AsCurrency, tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger);
     end;

  end;

  // AFRICA - VERIFICAR COMO PARAMETRIZAR
  {
  if tblFichaIndividual.FieldByName('notaexame').AsCurrency > 0 then
  begin
     tblFichaIndividual.FieldByName('notaexame').AsCurrency :=
        RoundFloat(tblFichaIndividual.FieldByName('notaexame').AsCurrency, tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger);
  end;

  if tblFichaIndividual.FieldByName('segunda_epoca').AsCurrency > 0 then
  begin
     tblFichaIndividual.FieldByName('segunda_epoca').AsCurrency :=
        RoundFloat(tblFichaIndividual.FieldByName('segunda_epoca').AsCurrency, tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger);
  end;
}
  if tblFichaIndividual.FieldByName('mediaanual').AsCurrency > 0 then
  begin
     tblFichaIndividual.FieldByName('mediaanual').AsCurrency :=
        RoundFloat(tblFichaIndividual.FieldByName('mediaanual').AsCurrency, tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger);
  end;

  if (tblFichaIndividual.FieldByName('mediafinal').AsCurrency > 0) AND (tblFichaIndividual.FieldByName('situacao').AsCurrency <> 12) then
  begin
     tblFichaIndividual.FieldByName('mediafinal').AsCurrency :=
        RoundFloat(tblFichaIndividual.FieldByName('mediafinal').AsCurrency, tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger);
  end;


  { Notas Maiores que 10 }

  for n:= 1 to 10 do
  begin

     if tblFichaIndividual.FieldByName('nota' + IntToStr(n)).AsCurrency > dNotaMaxima then
     begin
        tblFichaIndividual.FieldByName('nota' + IntToStr(n)).AsCurrency := dNotaMaxima;
     end;

     if tblFichaIndividual.FieldByName('exame' + IntToStr(n)).AsCurrency > dNotaMaxima then
     begin
        tblFichaIndividual.FieldByName('exame' + IntToStr(n)).AsCurrency := dNotaMaxima;
     end;

  end;

  if tblFichaIndividual.FieldByName('notaexame').AsCurrency > dNotaMaxima then
  begin
     tblFichaIndividual.FieldByName('notaexame').AsCurrency := dNotaMaxima;
  end;

  if tblFichaIndividual.FieldByName('segunda_epoca').AsCurrency > dNotaMaxima then
  begin
     tblFichaIndividual.FieldByName('segunda_epoca').AsCurrency := dNotaMaxima;
  end;

  if tblFichaIndividual.FieldByName('mediaanual').AsCurrency > dNotaMaxima then
  begin
     tblFichaIndividual.FieldByName('mediaanual').AsCurrency := dNotaMaxima;
  end;

  if (tblFichaIndividual.FieldByName('mediafinal').AsCurrency > dNotaMaxima) and (tblFichaIndividual.FieldByName('turma').AsString <> 'HISTORICO') then
  begin
     tblFichaIndividual.FieldByName('mediafinal').AsCurrency := dNotaMaxima;
  end;

end;

procedure TDM.SetaSituacaoFinal( const cd_pessoa: Integer; const cd_turma: String; const nr_anosemestre: Integer );
begin
   callProcedure(
      'CALL DIA_SITUACAO_FINAL('+
      IntToStr(cd_pessoa) + ', ' +
      QuotedStr(cd_turma) + ', ' +
      IntToStr(nr_anosemestre) + ')'
   );
end;

procedure TDM.CalculaPeriodicas(iCodigoAluno: Longint; tblAvaliacao, tblCalc: TUMZQuery);
var
   iEtapa, iEtapaAux: Integer;
   iPeriodo, iUltimoPeriodo: Integer;
   iPrimeiraEtapa, iUltimaEtapa: Integer;
   qyAux: TUMZQuery;
   sSQLCondicoes: String;
   sSQLFormula: String;
   sSQLFormulaSituacao: String;
begin
   if (tblAvaliacao.FieldByName('nr_periodos').AsInteger <= 1) OR (tblAvaliacao.FieldByName('ds_condicao_situacao_periodo').AsString = '') OR (tblAvaliacao.FieldByName('ds_formula_periodo').AsString = '') then begin
      exit;
   end;

   CriarConsulta(qyAux);
   with qyAux do begin
      SQL.Text := SQL_VERIFICAR_ETAPA_DE_ALUNO;
      ParamByName('nr_anosemestre').AsInteger := tblAvaliacao.ParamByName('anosemestre').AsInteger;
      ParamByName('cd_turma').AsString := tblAvaliacao.ParamByName('turma').AsString;
      ParamByName('cd_pessoa').AsInteger := iCodigoAluno;
      Open();
   end;
//   iUltimoPeriodo := ((qyAux.FieldByName('nr_etapa').AsInteger+1) div tblAvaliacao.FieldByName('nr_periodos').AsInteger);

   iUltimoPeriodo := (tblAvaliacao.FieldByName('nr_avaliacoes').AsInteger div tblAvaliacao.FieldByName('nr_periodos').AsInteger);

   for iPeriodo := 1 to iUltimoPeriodo do begin
      iPrimeiraEtapa := 1+((iPeriodo-1)*(tblAvaliacao.FieldByName('nr_avaliacoes').AsInteger div tblAvaliacao.FieldByName('nr_periodos').AsInteger));
      iUltimaEtapa := iPeriodo*(tblAvaliacao.FieldByName('nr_avaliacoes').AsInteger div tblAvaliacao.FieldByName('nr_periodos').AsInteger);
      iEtapaAux := 1;

       sSQLCondicoes := ' ( ( 1= 1) ';
      //sSQLCondicoes := ' (not isNull(nota_d'+IntToStr(iUltimaEtapa)+')';
      sSQLFormula := ' ('+lowerCase(tblAvaliacao.FieldByName('ds_formula_periodo').AsString);
      for iEtapa := iPrimeiraEtapa to iUltimaEtapa do begin
         sSQLCondicoes := sSQLCondicoes + ' AND sn_bloqueado'+IntToStr(iEtapa)+' = 0';
         sSQLFormula := StringReplace(sSQLFormula, 'nota'+IntToStr(iEtapaAux), 'nota_d'+IntToStr(iEtapa), [rfReplaceAll]);;

         iEtapaAux := iEtapaAux + 1;
      end;
      sSQLCondicoes := sSQLCondicoes + ') ';
      sSQLFormula := sSQLFormula + ') ';

      if DM.Istrue(tblAvaliacao.FieldByName('sn_notas_truncar').AsString) then begin
         sSQLFormula := ' TRUNCATE(' + sSQLFormula + ', ' + IntToStr(tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger) + ') ';
      end
      else begin
         sSQLFormula := ' ROUND((' + sSQLFormula + ') + 0.0001 , ' + IntToStr(tblAvaliacao.FieldByName('nr_casas_decimais').AsInteger) + ') ';
      end;

      sSQLFormulaSituacao := ' ('+lowerCase(tblAvaliacao.FieldByName('ds_condicao_situacao_periodo').AsString)+') ';
      sSQLFormulaSituacao := StringReplace(sSQLFormulaSituacao, 'media_periodo', sSQLFormula, [rfReplaceAll]);
      sSQLFormulaSituacao := StringReplace(sSQLFormulaSituacao, 'se', 'if', [rfReplaceAll]);
      sSQLFormulaSituacao := StringReplace(sSQLFormulaSituacao, ';', ',', [rfReplaceAll]);

      with tblCalc do begin
         Close();
         SQL.Text := SQL_UPDATE_FI_PERIODOS;
         SQL.Text := StringReplace(SQL.Text, ':pPeriodo', IntToStr(iPeriodo), [rfReplaceAll]);
         SQL.Text := StringReplace(SQL.Text, ':pFormula', sSQLFormula, []);
         SQL.Text := StringReplace(SQL.Text, ':pFormulaSituacao', sSQLFormulaSituacao, []);
         SQL.Text := StringReplace(SQL.Text, ':pCondicoes', sSQLCondicoes, []);
         ParamByName('nr_anosemestre').AsInteger := tblAvaliacao.ParamByName('anosemestre').AsInteger;
         ParamByName('cd_turma').AsString := tblAvaliacao.ParamByName('turma').AsString;
         ParamByName('cd_pessoa').AsInteger := iCodigoAluno;
         ExecSQL();
      end;

   end;

   FreeAndNil(qyAux);

end;

function TDM.CalcularMediaAutomaticamente(const nr_anosemestre: Integer; const cd_turma: String;
   const cd_disciplina, nr_etapa, cd_grupo, cd_pessoa: Integer; CalculoForcado: Boolean): Boolean;

   function ExecutarCalculoMedia: Boolean;
   var
      sn_calculo_media_automatico: String;
   begin
      Result := False;
      sn_calculo_media_automatico := ClasseTurmas.GetParametroAvaliacao( nr_anosemestre, cd_turma,
                                                     IntToStr(cd_disciplina), 'sn_calculo_media_automatico' );

      if ( StrToIntDef( sn_calculo_media_automatico, 0 ) = 1 ) then
      begin
         Result := True;
      end;
   end;

var
   ds_formula, xSn_disc_frente_media: String;
   iDisciplinaFrente: Integer;
begin
   Result := False;

   if CalculoForcado OR ExecutarCalculoMedia then
   begin
      Result := True;

      if cd_grupo > 0 then
      begin
         ds_formula := DMDiario.getFormulaTurma(nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, cd_grupo);

      end else begin
         ds_formula := ClasseTurmas.GetInformacaoDiarioTurma( nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, 'formula_media' );

         if Length( Trim( ds_formula ) ) = 0 then
         begin
            ds_formula := ClasseTurmas.GetParametroAvaliacao( nr_anosemestre, cd_turma,
               IntToStr(cd_disciplina), 'ds_formula_padrao' );

            if ( Length( Trim( ds_formula ) ) = 0 ) then
            begin
               ds_formula := 'ARITMETICA';
            end;

         end;

      end;

      // Verifica se a disciplina que está sendo calculada a média é uma disciplina frente
      iDisciplinaFrente := DM.getDisciplinaFrente(cd_disciplina, nr_anosemestre, cd_turma);

      // Verifica se possui disciplina frente (mãe), nesse caso cálcula a média dessa disciplina
      if iDisciplinaFrente > 0 then
      begin
         xSn_disc_frente_media := ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma,
                                                     IntToStr(cd_disciplina), 'sn_disc_frente_media' );

         if (xSn_disc_frente_media = '2') then
            CalcularNotaDisciplina( nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, cd_grupo, cd_pessoa, ds_formula )
         else
            CalcularNotaDisciplina( nr_anosemestre, cd_turma, iDisciplinaFrente, nr_etapa, cd_grupo, cd_pessoa, ds_formula );
      end else begin
         CalcularNotaDisciplina( nr_anosemestre, cd_turma, cd_disciplina, nr_etapa, cd_grupo, cd_pessoa, ds_formula );
      end;
   end;
end;

procedure TDM.CalcularMediaCurso(iCodigoAluno: Longint; strTurma: string; intAnoSemestre: Integer; tblAvaliacao: TUMZQuery);
var
  sCursoAux : String;
  slMediaCurso: TStringList;
  slMediaCursoCredito : TStringList;
  qyMediaCursoAux: TUMZQuery;
  sFormulaAux, sAux, sCatAux:string;
  regExpr: TRegExpr;
begin
   CriarConsulta(qyMediaCursoAux);
   // qyMediaCursoAux.RequestLive := False;

   //carrega o Curso
   with qyMediaCursoAux do begin
      Close();
      SQL.Text := SQL_CALCULAR_MEDIA_CURSO_GETCURSOS;
      ParamByName('turma').AsString := strTurma;
      ParamByName('aluno').AsInteger := iCodigoAluno;
      ParamByName('anosem').ASInteger := intAnoSemestre;
      Open();
      if not IsEmpty() then begin
         sCursoAux := FieldByName('curso').AsString;
      end;
      Close();
   end;
   if (sCursoAux <> '') then begin
      slMediaCurso := TStringList.Create();
      slMediaCurso.Duplicates := dupIgnore;
      slMediaCursoCredito := TStringList.Create();
      slMediaCursoCredito.Duplicates := dupIgnore;
      with qyMediaCursoAux do begin
         Close();
         //carrega a tabela temporaria
            try
               SQL.Text := SQL_CALCULAR_MEDIA_CURSO_TEMP_TABLE_DELETE;
               ExecSQL();
            except
            end;
            try
               SQL.Text := SQL_CALCULAR_MEDIA_CURSO_TEMP_TABLE_CREATE;
               ExecSQL();
            except
            end;
            try
               SQL.Text := SQL_CALCULAR_MEDIA_CURSO_TEMP_TABLE_ALTER;
               ExecSQL();
            except
            end;
         //popula a fi que ele fez no curso
            SQL.Text := SQL_CALCULAR_MEDIA_CURSO_LOAD_FI;
            ParamByName('aluno').AsInteger := iCodigoAluno;
            ParamByName('curso').AsString := sCursoAux;
            ExecSQL();
         //popula as equivalencias
            SQL.Text := SQL_CALCULAR_MEDIA_CURSO_LOAD_FI_EQ;
            ParamByName('aluno').AsInteger := iCodigoAluno;
            ParamByName('curso').AsString := sCursoAux;
            ExecSQL();
         //calcula a media da categoria
            SQL.Text := SQL_CALCULAR_MEDIA_CURSO_CATEGORIAS;
            ParamByName('curso').AsString := sCursoAux;
            ParamByName('aluno').AsInteger := iCodigoAluno;
            Open();
            if not IsEmpty() then begin
               while not Eof do begin
                  slMediaCurso.Add(Uppercase(FieldByName('chave').AsString) + '=' + DM.Converter_para_ponto(FieldByName('media').AsFloat));
                  Next();
               end;
            end;
         //calcula a media da categoria
            SQL.Text := SQL_CALCULAR_MEDIA_CURSO_CREDITOS;
            ParamByName('curso').AsString := sCursoAux;
            ParamByName('aluno').AsInteger := iCodigoAluno;
            Open();
            if not IsEmpty() then begin
               while not Eof do begin
                  slMediaCursoCredito.Add(Uppercase(FieldByName('chave').AsString) + '=' + DM.Converter_para_ponto(FieldByName('media').AsFloat));
                  Next();
               end;
            end;

         Close();
      end;

      sFormulaAux := tblAvaliacao.FieldByName('ds_formula_media_curso').AsString;
      if (Trim(sFormulaAux) <> '') then begin

         regExpr := TRegExpr.Create();
         regExpr.ModifierI := True;
         regExpr.ModifierS := True;

         // Substituir CAT's
         if pos('CAT(',sFormulaAux) > 0 then begin

            regExpr.Expression := 'CAT\(([A-z0-9_-]{1,})\)';
            regExpr.Exec(sFormulaAux);
            repeat
               sCatAux := UpperCase(regExpr.Match[1]);
               if (slMediaCurso.IndexOfName(sCatAux) <> -1) then begin
                  sFormulaAux := StringReplace(sFormulaAux, regExpr.Match[0], slMediaCurso.Values[sCatAux], [rfIgnoreCase, rfReplaceAll]);
               end
               else begin
                  sFormulaAux := StringReplace(sFormulaAux, regExpr.Match[0], '0.0', [rfIgnoreCase, rfReplaceAll]);
               end;
            until (not regExpr.ExecNext());

         end;

         // Substituir
         if pos('CREDITO(',sFormulaAux) > 0 then begin
         
            regExpr.Expression := 'CREDITO\(([A-z0-9_-]{1,})\)';
            regExpr.Exec(sFormulaAux);
            repeat
               sCatAux := UpperCase(regExpr.Match[1]);
               if (slMediaCursoCredito.IndexOfName(sCatAux) <> -1) then begin
                  sFormulaAux := StringReplace(sFormulaAux, regExpr.Match[0], slMediaCursoCredito.Values[sCatAux], [rfIgnoreCase, rfReplaceAll]);
               end
               else begin
                  sFormulaAux := StringReplace(sFormulaAux, regExpr.Match[0], '0.0', [rfIgnoreCase, rfReplaceAll]);
               end;
            until (not regExpr.ExecNext());

         end;

         FreeAndNil(regExpr);


         FreeAndNil(slMediaCurso);
         FreeAndNil(slMediaCursoCredito);

         with qyMediaCursoAux do begin
            Close();
            SQL.Text := SQL_CALCULAR_MEDIA_CURSO_ATUALIZAR;
            SQL.Text := StringReplace(SQL.Text, '$media$', '(' + sFormulaAux + ')', [rfIgnoreCase, rfReplaceAll]);
            ParamByName('curso').AsString := sCursoAux;
            ParamByName('aluno').AsInteger := iCodigoAluno;
            ExecSQL();
            Close();
         end;
      end;
   end;
   FreeAndNil(qyMediaCursoAux);
end;


//IN PNR_ANOSEMESTRE INTEGER(11), IN PCD_TURMA VARCHAR(60), IN PCD_TURMA_MATRICULA VARCHAR(60), IN PCD_PESSOA INTEGER(11)
procedure TDM.CalcularMediaFinal( const cd_pessoa, nr_anosemestre, cd_grupo: Integer; const cd_turma, cd_turma_matricula: String );
var
   logDesc : string;
   cdLogAcesso : integer;
begin
   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
   end;

   { Insere log de acesso ao diário }
   DMDiario.inserirLogAcesso;

   cdLogAcesso := DM.LastInsert;

   callProcedure(
      'CALL DIA_CALCULO_MEDIA_FINAL('+
      IntToStr(nr_anosemestre)+', '+
      QuotedStr(cd_turma)+', '+
      QuotedStr(cd_turma_matricula)+', '+
      IntToStr(cd_grupo)+', '+
      IntToStr(cd_pessoa)+', '+
      IntToStr(cdLogAcesso)+', '+
      IntToStr(DM.iCdPessoaLogado)+')'
   );

end;

procedure TDM.tblMatriculasAfterPost(DataSet: TDataSet);
var
   iCodPessoa, iColigada: Integer;
begin
   // Pega dados para atualizar Grupos da pessoa
   iCodPessoa := tblMatriculasCODIGOALUNO.AsInteger;
   iColigada  :=  DM.getColigadaByTurma(
                        tblMatriculasTurma.AsString,
                        tblMatriculasAnoSemestre.AsInteger
                     );

   // atualizar grupos da pessoa
   atualizarGruposPessoa(iCodPessoa, iColigada, true);
end;

procedure TDM.tblMatriculasCalcFields(DataSet: TDataSet);
begin
  try
    tblMatriculasQualSituacao.AsString := lst_situacao_desc[ tblMatriculasSituacao.AsInteger ];
  except
    tblMatriculasQualSituacao.AsString := '';
  end;
end;

procedure TDM.TotalFaltas( lngCodigoAluno : Longint;
			   strTurma : String;
			   intAnoSemestre : Integer); //Referente a grade;
var
  dblFrequencia : Double;
  quFreq: TUMZQuery;
begin

  { Calcula o Total de Faltas de uma disciplina do aluno }

  dblFrequencia := 0;

  tblAvaliacao.Close;
  tblAvaliacao.ParamByName('turma').AsString := strTurma;
  tblAvaliacao.ParamByName('anosemestre').AsInteger := intAnoSemestre;
  tblAvaliacao.Open;


  { Colocar Total de Faltas em todos }
  qryUpdate.SQL.Clear;
  qryUpdate.SQL.Add( 'update fichaindividual set' );
  qryUpdate.SQL.Add( 'totalfaltas = (COALESCE(Falta1,0)+COALESCE(Falta2,0)+COALESCE(Falta3,0)+COALESCE(Falta4,0)+COALESCE(Falta5,0)+COALESCE(Falta6,0)+COALESCE(Falta7,0)+COALESCE(Falta8,0)+COALESCE(Falta9,0)+COALESCE(Falta10,0)), ' );
  qryUpdate.SQL.Add( 'frequencia = :frequencia' );
  qryUpdate.SQL.Add( 'where' );
  qryUpdate.SQL.Add('sn_bloq_freq_global = 0 AND');
  qryUpdate.SQL.Add( 'codigoaluno = :codigoaluno and' );
  qryUpdate.SQL.Add( 'turma = :turma and' );
  qryUpdate.SQL.Add( 'anoSemestre = :anosemestre' );
  qryUpdate.ParamByName('Frequencia').AsInteger := Round(dblFrequencia);
  qryUpdate.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
  qryUpdate.ParamByName('Turma').AsString := strTurma;
  qryUpdate.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  qryUpdate.ExecSQL;

  { Verificar a forma de Frequencia }

  CriarConsulta(quFreq);

  if tblAvaliacao.FieldByName('ds_frequencia_tipo').AsString = 'C' then
  Begin
      { Calcular frequencia pela Carga horária }
      { Número de Aulas semanais  x  Qtd. semanas Letivas da turma }
      qryUpdFreqCH.ParamByName('CODIGOALUNO').AsInteger := lngCodigoAluno;
      qryUpdFreqCH.ParamByName('TURMA').AsString := strTurma;
      qryUpdFreqCH.ParamByName('ANOSEMESTRE').AsInteger := intAnoSemestre;
      qryUpdFreqCH.ExecSQL;

      { Pegar a Frequencia Global }

      // O SQL Abaixo calcula a frequencia global com base na Grade Curricular : Tabela gradecurricular.valor

      quFreq.SQL.Text :=
             ' select '+
             ' CAST(ROUND((100 - (SUM(CASE WHEN f.sn_bloq_freq_global = 0 THEN f.totalfaltas ELSE gd.vl_valor -(f.frequencia * gd.vl_valor / 100) END)/SUM(gd.vl_valor) * 100)),2) as CHAR(6)) AS FREQUENCIA ' +
             ' FROM fichaindividual f INNER JOIN turmas t ON (f.turma = t.codigo and f.anosemestre = t.anosemestre) ' +             ' INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) ' +
             ' INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina) ' +
             ' WHERE ' +
             ' (f.mediafinal is null OR (f.mediafinal <> -1 and f.mediafinal <> -2)) '+
             ' and f.codigoaluno = :codigoaluno and f.turma = :turma and f.anosemestre = :anosemestre ';

      quFreq.ParamByName('anosemestre').Value := intAnoSemestre;
      quFreq.ParamByName('codigoaluno').Value := lngCodigoAluno;
      quFreq.ParamByName('Turma').Value := strTurma;
      quFreq.Open;

      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add( ' UPDATE matriculas ' );
      qryUpdate.SQL.Add( ' set frequencia_global = :frequencia ' );
      qryUpdate.SQL.Add( ' WHERE anosemestre = :anosemestre ');
      qryUpdate.SQL.Add( ' AND codigoaluno = :codigoaluno ' );
      qryUpdate.SQL.Add( ' AND turma = :turma ' );
      qryUpdate.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
      qryUpdate.ParamByName('Turma').AsString := strTurma;
      qryUpdate.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
      qryUpdate.ParamByName('frequencia').AsString := quFreq.FieldByName('FREQUENCIA').AsString;
      qryUpdate.ExecSQL;

  End
  else
  Begin
      { Calculo da Frenquencia pelas Aulas Dadas }
      qryUpdFreqA.ParamByName('codigoaluno').AsInteger := lngCodigoAluno;
      qryUpdFreqA.ParamByName('turma').AsString := strTurma;
      qryUpdFreqA.ParamByName('anosemestre').AsInteger := intAnoSemestre;
      qryUpdFreqA.ParamByName('nr_casas_decimais_frequencia').AsInteger := tblAvaliacao.FieldByName('nr_casas_decimais_frequencia').AsInteger;
      qryUpdFreqA.ExecSQL;

      { Pegar a Frequencia Global }

      // O SQL Abaixo Calcula a frequencia GLOBAL com base nas aulas dadas pelo professor. Tabela TURMASPROFESSORES

      quFreq.SQL.Text :=
             ' select '+
             'CAST(ROUND((100 - (SUM(CASE WHEN f.sn_bloq_freq_global = 0 THEN f.totalfaltas ELSE t.numeroaulas - (f.frequencia * t.numeroaulas / 100) END)/SUM(t.numeroaulas) * 100)),2) as CHAR(6)) AS FREQUENCIA ' +
             ' FROM fichaindividual f ' +
             ' INNER JOIN turmasprofessores t ON (f.turma = t.turma and f.anosemestre = t.anosemestre and  f.curso = t.curso and f.disciplina = t.disciplina and t.cd_categoria = 1 ) '+
             ' WHERE '+
             ' (f.mediafinal is null OR (f.mediafinal <> -1 and f.mediafinal <> -2)) '+
             ' and f.codigoaluno = :codigoaluno and f.turma = :turma and f.anosemestre = :anosemestre';

      quFreq.ParamByName('anosemestre').Value := intAnoSemestre;
      quFreq.ParamByName('codigoaluno').Value := lngCodigoAluno;
      quFreq.ParamByName('turma').Value := strTurma;
      quFreq.Open;

      qryUpdate.SQL.Clear;
      qryUpdate.SQL.Add( ' UPDATE matriculas ' );
      qryUpdate.SQL.Add( ' set frequencia_global = :frequencia ' );
      qryUpdate.SQL.Add( ' WHERE anosemestre = :anosemestre ');
      qryUpdate.SQL.Add( ' AND codigoaluno = :codigoaluno ' );
      qryUpdate.SQL.Add( ' AND turma = :turma ' );
      qryUpdate.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
      qryUpdate.ParamByName('Turma').AsString := strTurma;
      qryUpdate.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
      qryUpdate.ParamByName('frequencia').AsString := quFreq.FieldByName('FREQUENCIA').AsString;
      qryUpdate.ExecSQL;

  End;

  qryUpdate.SQL.Clear;
  qryUpdate.SQL.Add( 'update fichaindividual f set' );
  qryUpdate.SQL.Add( 'f.frequencia = 0 ' );
  qryUpdate.SQL.Add( 'where' );
  qryUpdate.SQL.Add('f.sn_bloq_freq_global = 0 AND');
  qryUpdate.SQL.Add( 'f.mediafinal < 0 and ');
  qryUpdate.SQL.Add( 'f.codigoaluno = :codigoaluno and' );
  qryUpdate.SQL.Add( 'f.turma = :turma and' );
  qryUpdate.SQL.Add( 'f.anoSemestre = :anosemestre' );
  qryUpdate.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
  qryUpdate.ParamByName('Turma').AsString := strTurma;
  qryUpdate.ParamByName('AnoSemestre').AsInteger := intAnoSemestre;
  qryUpdate.ExecSQL;

  FreeAndNil(quFreq);

end;

function TDM.FindUser(strUsu:String):Boolean;
var
   qyFindUser: TUMZQuery;
begin
  DM.CriarConsulta(qyFindUser);

  qyFindUser.Close;
  qyFindUser.SQL.Text := 'SELECT ds_login FROM pessoas WHERE UPPER(ds_login)= UPPER(:Nome)';
  qyFindUser.ParamByName('Nome').AsString := strUsu;
  qyFindUser.Open;

  Result := (qyFindUser.FieldByName('ds_login').AsString <> '');
  
  FreeAndNil(qyFindUser);
end;

function TDM.FindUserCodigo(const cd_pessoa:Longint):Boolean;
var
   qryFindUser: TUMZQuery;
begin
  DM.CriarConsulta(qryFindUser);

  qryFindUser.SQL.Text := 'SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = :cd_pessoa';
  qryFindUser.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
  qryFindUser.Open;

  Result := (qryFindUser.FieldByName('cd_pessoa').AsInteger <> 0);

  FreeAndNil(qryFindUser);
end;

function TDM.FindUserName(codigo:Longint):String;
var
   qryFindUser: TUMZQuery;
begin
  DM.CriarConsulta(qryFindUser);
  with qryFindUser do begin
     SQL.Text:= 'SELECT                   '+
                '   ds_login              '+
                'FROM                     '+
                '   pessoas               '+
                'WHERE                    '+
                '   cd_pessoa =  :codigo  ';
  end;

  qryFindUser.ParamByName('codigo').AsInteger:=codigo;
  qryFindUser.Open;

  Result := qryFindUser.FieldByName('ds_login').AsString;
end;

function TDM.FindDate(dat:TDateTime; Coligada: Integer):Boolean;
Var
  dia, mes, ano :Word;
begin

  DecodeDate(dat, ano, mes, dia);

  DM.tblFeriadosFilha.Close;
  DM.tblFeriadosFilha.ParamByName('dia').AsInteger := dia;
  DM.tblFeriadosFilha.ParamByName('mes').AsInteger := mes;
  DM.tblFeriadosFilha.ParamByName('ano').AsInteger := ano;
  DM.tblFeriadosFilha.ParamByName('coligada').AsInteger := Coligada;
  DM.tblFeriadosFilha.Open;

  Result := (NOT DM.tblFeriadosFilha.EOF);
end;

procedure TDM.tblMotivosAfterInsert(DataSet: TDataSet);
begin
  tblMotivosMotivo.AsString := strMotivos;
end;

procedure TDM.tblMotivosAfterPost(DataSet: TDataSet);
begin
  strMotivos := tblMotivosMotivo.AsString;
end;

function TDM.FindMotivo(lngCodigoAluno:Longint; intParcela:Integer; dat:TDateTime; turma : string):Boolean;
begin
  DM.tblMotivos.Close;
  DM.tblMotivos.ParamByName('CodigoAluno').AsInteger := lngCodigoAluno;
  DM.tblMotivos.ParamByName('Parcela').AsInteger := intParcela;
  DM.tblMotivos.ParamByName('DataMotivo').AsString := FormatDateTime('yyyy-mm-dd',dat);
  DM.tblMotivos.ParamByName('Turma').AsString := Turma;
  DM.tblMotivos.Open;

  Result := (DM.tblMotivosCodigoAluno.AsInteger <> 0);
end;

function TDM.FindCodigoDisciplina(aAnoSemestre:Integer; aTurma,
  aDisciplina :String):String;
begin

  with tblDiscGrade do
  begin
    ParamByName('AnoSemestre').AsInteger := aAnoSemestre;
    ParamByName('Sigla').AsString := aDisciplina;
    ParamByName('Turma').AsString := aTurma;
    Open;
  end;

  if tblDiscGrade.RecordCount > 1 then Mensagem('Mais de uma disciplina');

  Result := DM.tblDiscGradeCodigo.AsString;

end;

function TDM.FindDisciplina(aTurma, aSigla:String; aAnoSemestre:Integer):String;
var
  xCodigo: String;
begin
  xCodigo := '';

    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Add('select Disciplinas.Codigo from Disciplinas INNER JOIN Turmas ON' +
                   '(Turmas.Curso = Disciplinas.Curso)' +
                   'where Turmas.Codigo = :Turma and AnoSemestre = :AnoSemestre and ' +
                   'Disciplinas.Sigla = :Sigla');

    DM.qAux1.ParamByName('Turma').AsString := aTurma;
    DM.qAux1.ParamByName('AnoSemestre').AsInteger := aAnoSemestre;
    DM.qAux1.ParamByName('Sigla').AsString := aSigla;
    DM.qAux1.Open;

    xCodigo := DM.qAux1.FieldByName('Codigo').AsString;

  Result := xCodigo;

end;


function TDM.FindDepto(xTurma:String; xAnoSemestre: Integer):Integer;
begin
    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Add('SELECT DISTINCTROW Cursos.Depto' );
    DM.qAux1.SQL.Add('FROM Turmas INNER JOIN Cursos ON (Turmas.Curso = Cursos.Codigo)' );
    DM.qAux1.SQL.Add(' AND (Turmas.AnoSemestre = Cursos.AnoSemestre) where Turmas.Codigo = :Turma and' );
    DM.qAux1.SQL.Add('Turmas.AnoSemestre = :AnoSemestre' );
    DM.qAux1.ParamByName('Turma').AsString := xTurma;
    DM.qAux1.ParamByName('AnoSemestre').AsInteger := xAnoSemestre;
    DM.qAux1.Open;
    Result := DM.qAux1.Fields[0].AsInteger;
end;

function TDM.isSituacaoValida(const AISituacoes: array of Integer;
  const AISituacao: integer): boolean;
var
   i: integer;
begin
   if not tblSituacoes.Active  then begin
      tblSituacoes.Open();
   end;
   
   Result := False;
   for i := Low(AISituacoes) to High(AISituacoes) do
   begin
      if Self.tblSituacoes.Locate('cd_situacao_pai', AISituacoes[i], [loCaseInsensitive]) then
      begin
         if Self.tblSituacoes.FieldByName('cd_situacao').AsInteger = AISituacao then
         begin
            Result := True;
            Break;
         end;
      end;
   end;
end;

function TDM.isTrue(valor: String): Boolean;
begin
  if valor = 'S' Then result := True
  else result := False;
end;

function TDM.LastInsert: Integer;
const
   SQL_LAST_INSERT_ID =
      'SELECT LAST_INSERT_ID() VALOR';
var
   qyLastInsertID: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyLastInsertID);

   qyLastInsertID.SQL.Text := SQL_LAST_INSERT_ID;

   qyLastInsertID.Open;
   try
      if not qyLastInsertID.IsEmpty then
         Result := qyLastInsertID.FieldByName('VALOR').AsInteger
      else
         Result := -1;
   finally
      qyLastInsertID.Close;
      FreeAndNil( qyLastInsertID );
   end;
end;


procedure TDM.limparConnection;
begin
   if db.Connected then
      db.Disconnect;

   db.Protocol := '';
   db.HostName := '';
   db.Port := 0;
   db.Database := '';
   db.User := '';
   db.Password := '';
end;

procedure TDM.LoadEstadoCidadeColigadas;
var
   qyInformacoesColigadas: TUMZReadOnlyQuery;
begin
   if ( ArrayCidadeFromColigada = nil ) then
      ArrayCidadeFromColigada := TStringList.Create;

   if ( ArrayEstadoFromColigada = nil ) then
      ArrayEstadoFromColigada := TStringList.Create;

   if ( ArrayEstadoFromColigada.Count = 0 ) OR
      ( ArrayCidadeFromColigada.Count = 0 ) then
   begin
      ArrayEstadoFromColigada.Clear;
      ArrayCidadeFromColigada.Clear;

      DM.CriarConsulta(qyInformacoesColigadas);
      qyInformacoesColigadas.SQL.Text := ' SELECT cd_coligada, ds_estado, ds_cidade ' +
                                         ' FROM coligadas ORDER BY cd_coligada ';
      qyInformacoesColigadas.Open;

      while not qyInformacoesColigadas.Eof do
      begin
         ArrayEstadoFromColigada.Values[ qyInformacoesColigadas.FieldByName('cd_coligada').AsString ] :=
            qyInformacoesColigadas.FieldByName('ds_estado').AsString;

         ArrayCidadeFromColigada.Values[ qyInformacoesColigadas.FieldByName('cd_coligada').AsString ] :=
            qyInformacoesColigadas.FieldByName('ds_cidade').AsString;

         qyInformacoesColigadas.Next;
      end;      

      FreeAndNil( qyInformacoesColigadas );
   end;   
end;

procedure TDM.LocalizaColigada(SenderCombo: TObject; iCodigoColigada: Integer);
var
   i: Integer;
begin

   // Se não tem nenhuma coligada na combo
   if TUMComboBox(SenderCombo).Items.Count = 1 then
   begin
      Exit;
   end;

   for I := 1 to TUMComboBox(SenderCombo).Items.Count - 1 do
   begin
      if iCodigoColigada = TColigada(TUMComboBox(SenderCombo).Items.Objects[i]).Codigo then
      begin
         TUMComboBox(SenderCombo).ItemIndex := i;
      end;     
   end;
end;

function TDM.variavel_nu_parametro(variavel: String; coligada: Integer): string;
const
   SQL_GET_NU_PARAMETROS =
      ' SELECT np.ds_valor ' +
      ' FROM nu_parametros np INNER JOIN nu_modulos nm ON ( nm.cd_modulo = np.cd_modulo ) ' +
      ' WHERE CONCAT( nm.ds_chave, ''.'', np.ds_parametro ) = :variavel AND ' +
      '       np.cd_coligada = :cd_coligada ';
var
   qyGetNuParametros : TUMZReadOnlyQuery;
begin
    // Por enquanto não estamos implementando parametros por coligadas diferentes - BY MARCELO
    coligada := 0;
    
    // Utiliza o coligada atual
    if coligada = -1 then begin
      coligada := 0;
    end;

    // Tenta pegar o parametro pela coligada escolhida
    CriarConsulta(qyGetNuParametros);
    qyGetNuParametros.SQL.Text := SQL_GET_NU_PARAMETROS;
    qyGetNuParametros.ParambyName('variavel').AsString:= variavel;
    qyGetNuParametros.ParamByName('cd_coligada').AsInteger := coligada;
    qyGetNuParametros.Open;

    // se encontrou na coligada 0, senão ''
    if not qyGetNuParametros.Eof Then
       result := qyGetNuParametros.FieldByName('ds_valor').AsString
    else
       result := '';

    FreeAndNil( qyGetNuParametros );
end;

procedure TDM.ComfirmarNegociacaoBaixa(cd_mensalidade: Integer);
var
   qryNegociacao, qrySimula, qryGetParcelasAtuais, qryTipoTitulo, qryJuros : tumzquery;
   slMensa,slAnoSemestre,strCodParcelas,strParcelasBlob,
   strDatas,strParcelasNovas,strDescontosNovas,strJurosNovas,strCalculados,
   strDatainicial,strTodasTurmas,strJuros,strArrParcelas,strCreditosNovas,
   strDesconto : TStringList;
   somaJurosNovas : Currency;
   somaJurosAntigas : Currency;
   sMensa,sPosicao,turma     : string;
   ValorJuros,ValorDesconto,ValorCredito,totalDesc,totalParc,somaBruto,
   somaDescontoAntiga,diferencaDesc,somaDescontoAplicado : Currency;
   AnoSemestre,i,iDesconto : Integer;

begin
   DM.CriarConsulta(qrySimula);
   DM.CriarConsulta(qryGetParcelasAtuais);
   DM.CriarConsulta(qryNegociacao);
   Dm.CriarConsulta(qryTipoTitulo);
   DM.CriarConsulta(qryJuros);


   strCodParcelas     := TStringList.Create;
   strParcelasBlob    := TStringList.Create;
   strDatas           := TStringList.Create;
   strParcelasNovas   := TStringList.Create;
   strDescontosNovas  := TStringList.Create;
   strJurosNovas      := TStringList.Create;
   strCalculados      := TStringList.Create;
   strDatainicial     := TStringList.Create;
   strTodasTurmas     := TStringList.Create;
   strJuros           := TStringList.Create;
   strArrParcelas     := TStringList.Create;
   strCreditosNovas   := TStringList.Create;
   strDesconto        := TStringList.Create;

   qrySimula.Close();
   qrySimula.SQL.Text :=
   ' SELECT                                      '+
   '   *                                         '+
   ' FROM                                        '+
   '   fin_negocia_simula                        '+
   ' WHERE                                       '+
   '   cd_primeira_parc = :cd_primeira_parc  AND '+
   '   cd_situacao      = 0                      ';
   qrySimula.ParamByName('cd_primeira_parc').AsInteger := cd_mensalidade ;

   qrySimula.Open;

  // Verificar se as parcelas originais continuam as mesmas

   sMensa := qrySimula.FieldByName('lst_mensa_origem').AsString;
   if( sMensa <> '') then
   begin

     slMensa := TStringList.Create;

     SplitString(sMensa, ',', slMensa);

     qryGetParcelasAtuais.SQL.Text :=
     ' SELECT             '+
     '   cd_mensalidade,  '+
     '   codigoaluno,     '+
     '   turma,           '+
     '   datavencimento,  '+
     '   turma,           '+
     '   valorjuros,      '+
     '   parcela,         '+
     '   valordesconto    '+
     ' FROM               '+
     '   Mensalidades     '+
     ' WHERE              '+
     '   cd_mensalidade IN (' + sMensa + ') ';
     qryGetParcelasAtuais.Open;


     slAnoSemestre := explode( qrySimula.FieldByName('ds_turma_base').AsString ,' - ' );
     AnoSemestre := StrToInt(slAnoSemestre[1]);
     turma       := slAnoSemestre[0];

     qryTipoTitulo.Close;
     qryTipoTitulo.SQL.Text := ' '+
     ' SELECT                             '+
     '   cd_conta                         '+
     ' FROM                               '+
     '   fin_tipos_titulo                 '+
     ' WHERE                              '+
     '   cd_tipo_titulo = :cd_tipo_titulo ';
     qryTipoTitulo.ParamByName('cd_tipo_titulo').AsInteger := qrySimula.FieldByName('cd_tipo_titulo').AsInteger;
     qryTipoTitulo.Open;

     qryGetParcelasAtuais.First;

     while not( qryGetParcelasAtuais.eof ) do
     begin
       strCodParcelas.Add(qryGetParcelasAtuais.FieldByName('cd_mensalidade').AsString);
       qryGetParcelasAtuais.Next;
     end;

     strParcelasBlob.Delimiter := #13;
     strParcelasBlob.DelimitedText := qrySimula.FieldByName('me_negocia').AsString;
     somaJurosNovas := 0;
     totalDesc := 0;
     for I := 0 to strParcelasBlob.Count - 1  do
     begin

        if ( trim(strParcelasBlob[I]) = 'Par' ) or ( trim(strParcelasBlob[I]) = 'Venc.' ) or
        ( trim(strParcelasBlob[I]) = 'Vl.Desc.' ) or ( trim(strParcelasBlob[I]) = 'Vl.Acres.' ) or ( trim(strParcelasBlob[I]) = 'Vl.Bruto') or ( trim(strParcelasBlob[I]) = 'Vl.Liq.')
        then  begin
          sPosicao := strParcelasBlob[I];
        end;

        if( sPosicao = 'Par' ) and ( strParcelasBlob[I] <>  'Par' ) then
        begin
          strParcelasNovas.Add(strParcelasBlob[I]);
        end;

        if ( sPosicao = 'Venc.' )  and ( strParcelasBlob[I] <>  'Venc.' ) then
        begin
          strDatas.Add(strParcelasBlob[I]);
        end;

        if ( sPosicao = 'Vl.Desc.' ) and ( strParcelasBlob[I] <>  'Vl.Desc.'  ) then
        begin
          totalDesc := totalDesc + StrToCurr(strParcelasBlob[i]);
          strDescontosNovas.Add(strParcelasBlob[i])
        end;

        if ( sPosicao = 'Vl.Acres.' ) and ( strParcelasBlob[I] <> 'Vl.Acres.' ) then
        begin
          somaJurosNovas := somaJurosNovas +StrToCurr(strParcelasBlob[i]);
          strJurosNovas.Add(strParcelasBlob[i])
        end;

        somaBruto := 0;
        if ( sPosicao = 'Vl.Bruto' ) and ( strParcelasBlob[I] <> 'Vl.Bruto' ) then
        begin
          strCalculados.Add(strParcelasBlob[i]);
          somaBruto := somaBruto+ strTocurr(strParcelasBlob[i]);
        end;


     end;

     for I := 0 to strCalculados.Count - 1 do
     begin
        ValorCredito := (( StrToCurr(strCalculados[i]) - StrToCurr(strDescontosNovas[i]) + StrToCurr(strJurosNovas[i])) * qrySimula.FieldByName('vl_creditos').AsCurrency) / (qrySimula.fieldByName('vl_bruto').AsCurrency + qrySimula.fieldByName('vl_juros').AsCurrency);
        strCreditosNovas.Add(CurrToStr(ValorCredito));
     end;

     qryGetParcelasAtuais.First;

     somaDescontoAntiga := 0;
     iDesconto := 0;
     while not qryGetParcelasAtuais.Eof do
     begin

        qryJuros.Close;
        qryJuros.SQL.Text := 'SELECT GET_ACRESCIMOS(:cd_mensalidade, :data) as JUROS, GET_DESCONTOS(:cd_mensalidade, :data) as DESCONTO';
        qryJuros.ParamByName('cd_mensalidade').AsInteger := qryGetParcelasAtuais.FieldByName('cd_mensalidade').AsInteger;
        qryJuros.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', qrySimula.FieldByName('dt_apartir_de').AsDateTime);
        qryJuros.Open;
        strDataInicial.Add(qryGetParcelasAtuais.FieldByName('datavencimento').asString);
        strTodasTurmas.Add(qryGetParcelasAtuais.FieldByName('turma').asString);
        ValorJuros := qryJuros.FieldByName('JUROS').AsCurrency + qryGetParcelasAtuais.FieldByName('valorjuros').AsCurrency;
        strJuros.Add(CurrToStr(ValorJuros));

        somaDescontoAntiga := somaDescontoAntiga + qryGetParcelasAtuais.FieldByName('valordesconto').AsCurrency;
        if ( qryGetParcelasAtuais.FieldByName('valordesconto').AsCurrency <> 0 ) then
        begin
          iDesconto := iDesconto + 1;
        end;
        strDesconto.Add(currTostr(qryGetParcelasAtuais.FieldByName('valordesconto').AsCurrency));
    

        strArrParcelas.Add(qryGetParcelasAtuais.FieldByName('parcela').AsString);
        somaJurosAntigas := somaJurosAntigas + ValorJuros;

        qryGetParcelasAtuais.Next;

     end;



     if ( somaJurosNovas <> somaJurosAntigas ) then
     begin
       if somaJurosAntigas <> 0 then
       begin
          for I := 0 to  strJuros.Count - 1 do
          begin
            strJuros[i] := currTostr(( strTocurr(strJuros[i]) / somaJurosAntigas ) * somaJurosNovas );
          end;
       end
       else
       begin
          for I := 0 to  strCalculados.Count - 1 do
          begin
            strJuros[i] := currTostr(( strTocurr(strCalculados[i]) / somaBruto ) * somaJurosNovas );
          end;
       end;
     end;


     if somaDescontoAntiga <> totalDesc then
     begin
        if( somaDescontoAntiga <> 0 ) then
        begin
          for I := 0 to  strDesconto.Count - 1 do
          begin

            somaDescontoAplicado := somaDescontoAplicado + ( strTocurr(strDesconto[i]) / somaDescontoAntiga ) * totalDesc;
            strDesconto[i] := currTostr(( strTocurr(strDesconto[i]) / somaDescontoAntiga ) * totalDesc );

          end;
        end
        else
        begin
          for I := 0 to  strCalculados.Count - 1 do
          begin

            somaDescontoAplicado := somaDescontoAplicado + ( strTocurr(strCalculados[i]) / somaBruto ) * totalDesc;
            strDesconto[i] := currTostr(( strTocurr(strCalculados[i]) / somaBruto ) * totalDesc );

          end;
        end;
     end;

     if iDesconto <> 0 then
     begin
       diferencaDesc := (totalDesc - somaDescontoAplicado)/iDesconto;
       if(diferencaDesc <> 0 ) then
       begin
         for I := 0 to  strDesconto.Count - 1 do
         begin
           if(StrToCurr(strDesconto[i]) <> 0)then
           begin
             strDesconto[i] := currTostr(StrToCurr(strDesconto[i]) + diferencaDesc);
           end;
         end;
       end;
     end;




     qryNegociacao.SQL.Text := ' '+
     ' SELECT                    '+
     '   *                       '+
     ' FROM                      '+
     '   FIN_NEGOCIA             '+
     ' WHERE                     '+
     '   cd_pessoa = :cd_pessoa  ';
     qryNegociacao.ParamByName('cd_pessoa').AsInteger := qryGetParcelasAtuais.FieldByName('codigoaluno').AsInteger;

     qryNegociacao.Open;

     qryNegociacao.Insert;
     qryNegociacao.FieldByName('cd_simulacao').AsInteger  := qrySimula.FieldByName('cd_simulacao').asinteger;
     qryNegociacao.FieldByName('cd_pessoa').AsInteger  := qryGetParcelasAtuais.FieldByName('codigoaluno').AsInteger;
     qryNegociacao.FieldByName('dt_negocia').AsDateTime := Now;
     qryNegociacao.FieldByName('vl_juros_negocia').AsCurrency     := qrySimula.FieldByName('vl_juros').AsCurrency;
     qryNegociacao.FieldByName('vl_bruto_negocia').AsCurrency     := qrySimula.FieldByName('vl_bruto').AsCurrency;
     qryNegociacao.FieldByName('vl_desconto_negocia').AsCurrency  := totalDesc;
     qryNegociacao.FieldByName('vl_entrada').AsCurrency           := qrySimula.FieldByName('vl_entrada').AsCurrency;
     qryNegociacao.FieldByName('vl_creditos').AsCurrency          := qrySimula.FieldByName('vl_creditos').AsCurrency;
     qryNegociacao.Post;

     DM.gerarNegociacao(
                        qrySimula.FieldByName('dt_apartir_de').AsDateTime,
                        qrySimula.FieldByName('cd_tipo_titulo').AsInteger,
                        strCalculados,
                        qrySimula.FieldByName('vl_bruto').AsCurrency,
                        strParcelasNovas,
                        strCodParcelas,
                        strDataInicial,
                        qryGetParcelasAtuais.RecordCount,
                        qryGetParcelasAtuais.FieldByName('codigoaluno').AsInteger,
                        qryNegociacao.fieldByName('cd_negocia').AsInteger,
                        strTodasTurmas,
                        strJuros,
                        strDesconto,
                        turma,
                        qryTipoTitulo.FieldByName('cd_conta').AsInteger,
                        AnoSemestre,
                        strJurosNovas,
                        strDescontosNovas,
                        strCreditosNovas,
                        strArrParcelas,
                        qrySimula.fieldbyName('nr_parcelas').asInteger,
                        strDatas,
                        false,
                        qrySimula.FieldByName('cd_simulacao').asinteger
                      );
   end;

   FreeAndNil(strCodParcelas);
   FreeAndNil(strParcelasBlob);
   FreeAndNil(strDatas);
   FreeAndNil(strParcelasNovas);
   FreeAndNil(strDescontosNovas);
   FreeAndNil(strJurosNovas);
   FreeAndNil(strCalculados);
   FreeAndNil(strDatainicial);
   FreeAndNil(strTodasTurmas);
   FreeAndNil(strJuros);
   FreeAndNil(strArrParcelas);
   FreeAndNil(strCreditosNovas);
   FreeAndNil(strDesconto);

   FreeAndNil(qrySimula);
   FreeAndNil(qryGetParcelasAtuais);
   FreeAndNil(qryNegociacao);
   FreeAndNil(qryTipoTitulo);
   FreeAndNil(qryJuros);
   
end;

procedure TDM.LimpaMensaNegociacaoPaga( cd_mensalidade :integer; cd_pessoa : integer );
var
  qryMensalidade,qrySituacao : TUMZQuery;
  cd_simulacao   : Integer;
  sMensaIN       : string;
  sOperador      : string;
begin
  dm.criarConsulta(qryMensalidade);
  dm.CriarConsulta(qrySituacao);

  qryMensalidade.sql.text :=  '     '+
  ' SELECT                          '+
  '	  lst_mensa_origem '+
  ' FROM                            '+
	'   fin_negocia_simula            '+
	' WHERE' +
  ' 	cd_situacao = 0 ' + 
  ' AND cd_pessoa = ' + IntToStr(cd_pessoa);

  qryMensalidade.Open;


  qryMensalidade.First;
  sOperador := '';
  while not( qryMensalidade.eof) do
  begin
    sMensaIN := sMensaIN+sOperador+qryMensalidade.FieldByName('lst_mensa_origem').AsString;
    sOperador :=  ',';
    qryMensalidade.Next;
  end;
  if (qryMensalidade.RecordCount > 0) then
  begin
    qryMensalidade.Close;
    qryMensalidade.sql.text :=  ''+
    ' SELECT                      '+
    '	  cd_mensalidade            '+
    ' FROM                        '+
    '   mensalidades              '+
    ' WHERE' +
    '   cd_mensalidade in ('+sMensaIN +')	and cd_mensalidade='+inttostr(cd_mensalidade);
    qryMensalidade.Open;

    qryMensalidade.Close;
    qryMensalidade.sql.text := ''+
    ' SELECT                    '+
    '   cd_primeira_parc,cd_simulacao'+
    ' FROM                      '+
    '   fin_negocia_simula      '+
    ' WHERE' +
    '	  (lst_mensa_origem LIKE ''' +inttostr(cd_mensalidade)+ ''' OR'+
    '	  lst_mensa_origem LIKE ''' +inttostr(cd_mensalidade)+',%'' OR'+
    '   lst_mensa_origem LIKE ''%,'+inttostr(cd_mensalidade)+''' OR'+
    '   lst_mensa_origem LIKE ''%,'+inttostr(cd_mensalidade)+',%'')'+
    '   and cd_situacao = 0 ';
    qryMensalidade.Open;
    cd_simulacao := qryMensalidade.FieldByName('cd_simulacao').AsInteger;
    qrySituacao.Close;
    qrySituacao.SQL.Text  :='     '+
    'UPDATE                       '+
    '   FIN_NEGOCIA_SIMULA        '+
    'SET                          '+
    '   cd_situacao = 2           '+
    'WHERE                        '+
    '   cd_simulacao ='+IntToStr(cd_simulacao);
    qrySituacao.ExecSQL;
    qryMensalidade.First;
    while not( qryMensalidade.eof) do
    begin
      ExcluirParcela(qryMensalidade.FieldByName('cd_primeira_parc').AsInteger);
      qryMensalidade.Next;
    end;
  end;

end;

procedure TDM.LimpaMensaNegociacao();
var
  qryGetParcelaVencida : TUMZQuery;
  qrySetaFinalizada    : TUMZQuery;
begin

  dm.CriarConsulta(qryGetParcelaVencida);
  qryGetParcelaVencida.SQL.Text := ''+
  ' SELECT                          '+
  ' 	cd_primeira_parc              '+
  ' FROM                            '+
  ' 	fin_negocia_simula            '+
  ' WHERE                           '+
  '	cd_primeira_parc <> 0           '+
  ' and cd_situacao = 0             '+
  '	and dt_prazo < now()           ';
  qryGetParcelaVencida.Open;

  DM.CriarConsulta(qrySetaFinalizada);
  while not( qryGetParcelaVencida.eof ) do
  begin
    qrySetaFinalizada.SQL.Text :=
    ' UPDATE                          '+
    ' 	fin_negocia_simula            '+
    ' SET                             '+
    '   cd_situacao = 2               '+
    '	WHERE                           '+
    '   cd_primeira_parc= :cd_primeira_parc';

    qrySetaFinalizada.ParamByName('cd_primeira_parc').AsInteger := qryGetParcelaVencida.FieldByName('cd_primeira_parc').AsInteger;
    qrySetaFinalizada.ExecSQL;
    ExcluirParcela( qryGetParcelaVencida.FieldByName('cd_primeira_parc').AsInteger );
    qryGetParcelaVencida.Next
  end;

  FreeAndNil(qrySetaFinalizada);
  FreeAndNil(qryGetParcelaVencida);
  
end;

procedure TDM.ExcluirMovimento(cd_movimento_te: Integer; tipoMovimento: String);
var
   qryMovimento: TUMZQuery;
   Campo: String;
begin
   DM.CriarConsulta(qryMovimento);

   campo := 'cd_transfere';

   if tipoMovimento = 'MS' then
   begin
      Campo := 'cd_movimento_te';
   end;

   qryMovimento.SQL.Text :=
      ' DELETE '+
      ' FROM '+
      ' 	fin_mov_tesouraria '+
      ' WHERE '+
      ' 	'+ campo +' = :cd_titulo '+
      '  AND '+ campo +' <> 0 ';

   qryMovimento.ParamByName('cd_titulo').AsInteger := cd_movimento_te;

   qryMovimento.ExecSQL;

   if tipoMovimento = 'MS' then
   begin
      qryMovimento.SQL.Text :=
         ' DELETE '+
         ' FROM '+
         ' 	fin_apropria_te '+
         ' WHERE '+
         ' 	'+ campo +' = :cd_titulo ';

      qryMovimento.ParamByName('cd_titulo').AsInteger := cd_movimento_te;

      qryMovimento.ExecSQL;
   end;

end;

procedure TDM.ExcluirParcela( cd_mensalidade : integer);
Var
  chaves : string;
  sMsg : String;
  qryDelete : TUMZQuery;
  qryUniObs : TUMZQuery;
  qryGetUserAdmin : TUMZQuery;
begin
  qryMensaNegociacao.Close;
  qryMensaNegociacao.ParamByName('cd_mensalidade').AsInteger := cd_mensalidade;
  qryMensaNegociacao.Open;

  dm.CriarConsulta(qryDelete);
  dm.CriarConsulta(qryUniObs);
  dm.CriarConsulta(qryGetUserAdmin);

  if (qryMensaNegociacao.FieldByName('situacao').AsInteger in [0,1]) then begin


     Exit;
  end;

  // pega o cd_pessoa do admin
  qryGetUserAdmin.Close;
  qryGetUserAdmin.SQL.Text := ' SELECT             ' +
                              '   cd_pessoa        ' +
                              ' FROM               ' +
                              '   pessoas          ' +
                              ' WHERE              ' +
                              '   ds_login like ''admin''';
  qryGetUserAdmin.Open;





  // Verificar se houve nota fiscal gerada

  if qryMensaNegociacao.FieldByName('sn_nfe_gerada').AsInteger = 1 then begin

     Exit;

  end;


  // Verificar Bloqueio por Vencimento


  if (qryMensaNegociacao.FieldByName('cd_mensalidade').AsInteger = tblMensalidadescd_mensalidade_origem.AsInteger) or
      qryMensaNegociacao.FieldByName('cd_mensalidade_origem').IsNull
  then
  begin

     with qryDelete do begin
         Close;
         SQL.Clear;
         SQL.Add(
           ' DELETE from fin_mov_cr                 ' +
           ' WHERE cd_mensalidade = :CdMensalidade  ');
         ParamByName('CdMensalidade').AsInteger  := qryMensaNegociacao.FieldByName('cd_mensalidade').AsInteger;
         ExecSQL;
     end;

     with qryDelete do begin
         Close;
         SQL.Clear;
         SQL.Add(
           ' DELETE from fin_negocia_parc_nova      ' +
           ' WHERE cd_mensalidade = :CdMensalidade  ');
         ParamByName('CdMensalidade').AsInteger  := qryMensaNegociacao.FieldByName('cd_mensalidade').AsInteger;
         ExecSQL;
     end;

     with qryDelete do begin

         Close;
         SQL.Clear;
         SQL.Add( 'delete from Mensalidades where      ' );
         SQL.Add( 'cd_mensalidade = :CdMensalidade     ' );
         ParamByName('CdMensalidade').AsInteger := qryMensaNegociacao.FieldByName('cd_mensalidade').AsInteger;
         ExecSQL;

         chaves := FillString(IntToStr(qryMensaNegociacao.FieldByName('CodigoAluno').AsInteger), alRight, '0', 10, true ) + ';' +
                   qryMensaNegociacao.FieldByName('AnoSemestre').AsString + ';' + qryMensaNegociacao.FieldByName('Turma').AsString + ';' +
                   qryMensaNegociacao.FieldByName('Parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',qryMensaNegociacao.FieldByName('DataVencimento').AsDateTime) + ';';

        DM.gerar_log(2, 'Parcela Excluída (NN = ' + qryMensaNegociacao.FieldByName('NossoNumero').AsString +  ')', qryGetUserAdmin.FieldByName('cd_pessoa').AsInteger, chaves) ;

        DM.setLog(2013, 'Exclusao', chaves, Dm.getColigadaByTurma(qryMensaNegociacao.FieldByName('Turma').AsString, qryMensaNegociacao.FieldByName('AnoSemestre').AsInteger), 'Parcela Excluída (NN = ' + qryMensaNegociacao.FieldByName('NossoNumero').AsString +  ')');

     end;


  end
  else begin
         with qryDelete do begin
            Close;
            SQL.Clear;
            SQL.Add( 'delete from Mensalidades where      ' );
            SQL.Add( 'cd_mensalidade = :CdMensalidade     ' );
            ParamByName('CdMensalidade').AsInteger := qryMensaNegociacao.FieldByName('cd_mensalidade').AsInteger;
            ExecSQL;

            chaves := FillString(IntToStr(qryMensaNegociacao.FieldByName('CodigoAluno').AsInteger), alRight, '0', 10, true ) + ';' +
                    qryMensaNegociacao.FieldByName('AnoSemestre').AsString + ';' + qryMensaNegociacao.FieldByName('Turma').AsString + ';' +
                    qryMensaNegociacao.FieldByName('Parcela').AsString + ';' +
                    FormatDateTime('dd/mm/yyyy',qryMensaNegociacao.FieldByName('DataVencimento').AsDateTime) + ';';


            DM.gerar_log(2, 'Parcela Excluída. (NN = ' + qryMensaNegociacao.FieldByName('NossoNumero').AsString +  ')', qryGetUserAdmin.FieldByName('cd_pessoa').AsInteger, chaves) ;
            DM.setLog(2013, 'Exclusao', chaves, Dm.getColigadaByTurma(qryMensaNegociacao.FieldByName('Turma').AsString, qryMensaNegociacao.FieldByName('AnoSemestre').AsInteger), 'Parcela Excluída (NN = ' + qryMensaNegociacao.FieldByName('NossoNumero').AsString +  ')');
          end;

  end;


  DM.criarConsulta(qryUniObs);

  qryUniObs.SQL.Text :=
  'INSERT INTO                  '+
  '  uni_observacoes            '+
  '  (                          '+
  '     cd_pessoa,              '+
  '     cd_usuario,             '+
  '     dt_observacao,          '+
  '     sg_tipo,                '+
  '     me_observacao           '+
  '  )                          '+
  'VALUES                       '+
  ' (                           '+
  '     :cd_pessoa,             '+
  '     :cd_usuario,            '+
  '     now(),                  '+
  '     ''F'',                  '+
  '     :me_observacao          '+
  ' )' ;

  qryUniObs.ParamByName('cd_pessoa').AsInteger  := qryMensaNegociacao.FieldByName('codigoaluno').AsInteger;
  qryUniObs.ParamByName('cd_usuario').AsInteger := qryGetUserAdmin.FieldByName('cd_pessoa').AsInteger;
  qryUniObs.ParamByName('me_observacao').AsString :=  'Negociação cancelada por falta de pagamento da primeira parcela';

  qryUniObs.ExecSQL;


  FreeAndNil(qryDelete);
  FreeAndNil(qryUniObs);

end;


function TDM.existeProvaDisciplinaFrente(iAnosemestre: Integer; sTurma: string;
  iDisciplinaFrente, iBimestre, iCdAvaliacaoTipo: Integer): Boolean;
var
   qyProvaDisciplinaFrente: TUMZQuery;
begin
   CriarConsulta(qyProvaDisciplinaFrente);

   qyProvaDisciplinaFrente.SQL.Text := ''+
   ' SELECT ' +
	'   cd_prova ' +
   ' FROM ' +
	'   diario_provas ' +
   ' WHERE ' +
	'   anosemestre = :nr_anosemestre ' +
   '   AND turma LIKE :cd_turma ' +
   '   AND disciplina = :cd_disciplina ' +
   '   AND bimestre LIKE :nr_bimestre ' +
   '   AND cd_avaliacao_tipo = :cd_avaliacao_tipo ';

   qyProvaDisciplinaFrente.ParamByName('nr_anosemestre').AsInteger := iAnosemestre;
   qyProvaDisciplinaFrente.ParamByName('cd_turma').AsString := sTurma;
   qyProvaDisciplinaFrente.ParamByName('cd_disciplina').AsInteger := iDisciplinaFrente;
   qyProvaDisciplinaFrente.ParamByName('nr_bimestre').AsInteger := iBimestre;
   qyProvaDisciplinaFrente.ParamByName('cd_avaliacao_tipo').AsInteger := iCdAvaliacaoTipo;

   qyProvaDisciplinaFrente.Open();

   result := (qyProvaDisciplinaFrente.RecordCount > 0);
   
   FreeAndNil(qyProvaDisciplinaFrente);
end;

procedure TDM.gerarNegociacao(
   dtApartir           : TDatetime;
   cd_tipo_titulo      : integer;
   ArrayCalculados     : TStringList;
   TotalTela           : Currency;
   ArrayParcelasNovas  : TStringList;
   ArrayCodParcelas    : TStringList;
   ArrayDatasInicial   : TStringList;
   ParcelasNegociadas  : Integer;
   CodigoAluno         : Integer;
   CdNegociacao        : Integer;
   ArrayTodasTurmas    : TStringList;
   ArrayJuros          : TStringList;
   ArrayDescontosParc  : TStringList;
   cd_turma            : String;
   cd_tipo_conta       : Integer;
   ano_semestre        : Integer;
   ArrayJurosNovas     : Tstringlist;
   ArrayDescontosNovas : Tstringlist;
   ArrayCreditosNovas  : Tstringlist;
   ArrayParcelas       : TStringList;
   ParcelasGeradas     : Integer;
   ArrayDatas          : TStringList;
   bGerarPrimeiraParc  : Boolean;
   cd_simulacao        : Integer;
   liberarDescontos    : Boolean = false
);
const
   SSQLSelectDesconto = ''
      + 'SELECT '
      + '	GET_DESCONTOS(?, CURRENT_DATE) '
      + 'FROM '
      + '	DUAL ';
var
  strUsuario                        : String;
  strParcelas                       : String;
  iCodMensa                         : Integer;
  cd_primeira_mensalidade           : Integer;
  n, x                              : Integer;
  ValorTotal                        : Single;
  intIndice                         : Integer;
  TotalBruto                        : Currency;
  movimento                         : TMovimento;
  qryPrimeiraParc,qryUpdate         : TUMZQuery;
  wYear, wMonth, wDay               : Word;
  objRemessa                        : TRemessa;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   ValorDescCalc: Double;  
begin

  DM.CriarConsulta(qryUpdate);

  // Conferir Bloqueio de Alterações por data
  if DM.EstaBloqueado( dtApartir , True) then begin
     Exit;
  end;

  // Verificar se foi selecionado o Tipo de Título

  if cd_tipo_titulo = -1 then begin
    Mensagem('Você precisa selecionar um tipo de título para essa negociação.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
    Exit;
  end;


  

  strParcelas := '';

  // strParcelas terá uma string com o número de todas as parcelas    '20, 21, 22, 23....'

  TotalBruto := 0;
  for x := 0 to ArrayParcelasNovas.Count - 1 do begin
    strParcelas := strParcelas + ArrayParcelasNovas[x] + ', ';
    TotalBruto := TotalBruto + StrToCurr(ArrayCalculados[x]);
  end;


  if RoundFloat(TotalBruto,2) <> RoundFloat(TotalTela,2) then begin

     Mensagem('A soma das parcelas negociadas difere do valor total bruto original. Você deve corrigir o valor das parcelas antes de confirmar.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     Exit;

  end;

  Delete( strParcelas, Length( strParcelas ) - 1, 2 );

  strUsuario := DM.sLogin;



  Application.CreateForm( TfrmMotivos, frmMotivos );

  for n := 0 to ParcelasNegociadas - 1 do
  begin // Marcar cada parcela como negociada
    // Verificar se já existe motivo para essa parcela

    if DM.FindMotivo( CodigoAluno, StrToInt(ArrayParcelas[n]), StrToDateTime(ArrayDatasInicial[n]), ArrayTodasTurmas[n] ) then
       DM.tblMotivos.Edit
    else
       DM.tblMotivos.Insert;

    DM.tblMotivosMotivo.AsString := 'TRANSFERIDO PARA PARCELA ' + strParcelas;
    DM.tblMotivosCodigoAluno.AsInteger := codigoaluno;
    DM.tblMotivosParcela.AsInteger := StrToInt(ArrayParcelas[n]);
    Dm.tblMotivosturma.AsString := ArrayTodasTurmas[n];
    DM.tblMotivosDataMotivo.AsString := ArrayDatasInicial[n] ;
    DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
    DM.tblMotivos.Post;
    DM.tblMotivos.Close;

    ValorDescCalc := 0;
    
    Stmt := PrepareStatement(SSQLSelectDesconto);
    try
       Stmt.SetString(1, ArrayCodParcelas[n]);
       Rs := Stmt.ExecuteQueryPrepared;
       try
          if Rs.Next then
            ValorDescCalc := Rs.GetDouble(1);
       finally
          Rs.Close;
          Rs := nil;
       end;
    finally
       Stmt.Close;
       Stmt := nil;
    end;

    qryUpdate.Close;
    qryUpdate.SQL.Clear;
    qryUpdate.SQL.Add( 'select * from Mensalidades where' );
    qryUpdate.SQL.Add( '(cd_mensalidade = :CdMensalidade) ' );
    qryUpdate.ParamByName('CdMensalidade').AsInteger := StrToInt(ArrayCodParcelas[n]);
    qryUpdate.Open;

    qryUpdate.Edit;
    qryUpdate.FieldByName('DataPagamento').AsString := DateToStr(DataHoje);
    qryUpdate.FieldByName('dt_credito').AsString := DateToStr(DataHoje);

    qryUpdate.FieldByName('ValorPago').Value := 0;


    qryUpdate.FieldByName('valorjuros_fixo').AsCurrency := qryUpdate.FieldByName('ValorJuros').AsCurrency;
    qryUpdate.FieldByName('valordesconto_fixo').AsCurrency := qryUpdate.FieldByName('ValorDesconto').AsCurrency;

    try
      qryUpdate.FieldByName('ValorJuros').Value := StrToCurr(ArrayJuros[n]);
    except on E: Exception do
      qryUpdate.FieldByName('ValorJuros').Value := StrToCurr('0');
    end;

    qryUpdate.FieldByName('valordesconto').AsFloat := ValorDescCalc;

    ValorTotal := qryUpdate.FieldByName('ValorBruto').AsCurrency
                  + qryUpdate.FieldByName('ValorExtra').AsCurrency
                  - qryUpdate.FieldByName('DescontoExtra').AsCurrency
                  + StrToCurr(ArrayJuros[n])
                  - ValorDescCalc;

    qryUpdate.FieldByName('ValorTotal').Value := ValorTotal;

    qryUpdate.FieldByName('Situacao').Value := 3; // NEGOCIADA
    qryUpdate.Post;



      // Negociação de Cheques...
      // Criar uma linha de quitação de cheque
      // Associar com a mensalidadee
    if qryUpdate.FieldByName('cd_cheque_devolvido').AsInteger >0 then begin

       DM.BaixarChequeDevolvido(qryUpdate.FieldByName('cd_cheque_devolvido').AsInteger, DataHoje, qryUpdate.FieldByName('cd_mensalidade').AsInteger);

    end;

      // Criar movimento de Saida, como Negociada
      // Acão padrao = 12

    Movimento := TMovimento.create();
    Movimento.TipoDeAcao := BaixarporCancelamento;
    Movimento.CodigoTitulo := qryUpdate.FieldByName('cd_mensalidade_origem').AsInteger;
    Movimento.Coligada := qryUpdate.FieldByName('cd_coligada').AsInteger;
    Movimento.CodigoMovimento := qryUpdate.FieldByName('cd_mensalidade').AsInteger; // Aqui é que tem q alterar na planilha de mensalidades
    Movimento.CodAcao :=  DM.BuscarCodigoAcaoPadrao(12);
    Movimento.Observacao := 'TRANSFERIDO PARA PARCELA ' + strParcelas;
    Movimento.ValorMovimento := qryUpdate.FieldByName('ValorBruto').AsCurrency + qryUpdate.FieldByName('ValorExtra').AsCurrency  - qryUpdate.FieldByName('DescontoExtra').AsCurrency;

    Movimento.RegistrarMovimentacaoCR(0);

    movimento.Free;

    DM.FazAcaoRemessa(arNegociar, qryUpdate.FieldByName('cd_mensalidade').AsInteger);

    if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
    begin
      // registra a nova ação de cancelamento no novo modelo de remessa
      objRemessa := TRemessa.Create;
      objRemessa.registraAcaoBaixa(qryUpdate.FieldByName('nossonumero').AsString);
    end;

    // Registrar na tabela fin_negocia_parc_atuais

    qyAux.SQL.Text :=
      ' INSERT INTO fin_negocia_parc_atual ( cd_negocia, cd_mensalidade ) ' +
      ' VALUES (' + IntToStr(CdNegociacao) + ', ' + qryUpdate.FieldByName('cd_mensalidade').AsString + ') ';
    qyAux.ExecSQL();
  end;
   // Criar as Novas Parcelas

  if ( bGerarPrimeiraParc = true ) then
    intIndice := 0
  else
  begin
    DM.CriarConsulta(qryPrimeiraParc);
    qryPrimeiraParc.sql.Text :=''+
      ' SELECT                          '+
      '    cd_primeira_parc,vl_entrada  '+
      ' FROM                            '+
      '    fin_negocia_simula           '+
      ' WHERE                           '+
      '    cd_simulacao = :cd_simulacao '+
      '';
    qryPrimeiraParc.ParamByName('cd_simulacao').AsInteger :=  cd_simulacao;
    qryPrimeiraParc.Open;
    if ( qryPrimeiraParc.FieldByName('vl_entrada').AsInteger <> 0 ) then
      ParcelasGeradas := ParcelasGeradas + 1 ;

    intIndice := 1;
    

    cd_primeira_mensalidade := qryPrimeiraParc.FieldByName('cd_primeira_parc').AsInteger;

    qryPrimeiraParc.Close;
    qryPrimeiraParc.SQL.Text := ' UPDATE                ' +
                                '   mensalidades        ' +
                                ' SET                   ' +
                                '   situacao = 2        ' +
                                ' WHERE                 ' +
                                '   situacao = 10       ' +
                                '   AND cd_mensalidade= ' +
                                '   :cd_mensalidade     ' ;
    qryPrimeiraParc.ParamByName('cd_mensalidade').AsInteger := cd_primeira_mensalidade;
    qryPrimeiraParc.ExecSQL;


  end;

  if ( cd_simulacao <> 0 ) then
  begin
    qryPrimeiraParc.Close;
    qryPrimeiraParc.SQL.Text := '    '+
    ' UPDATE                         '+
    '   fin_negocia_simula           '+
    ' SET                            '+
    '   cd_situacao = 1              '+
    ' WHERE                          '+
    '   cd_simulacao = :cd_simulacao '+
    '';
    qryPrimeiraParc.ParamByName('cd_simulacao').AsInteger := cd_simulacao;
    qryPrimeiraParc.ExecSQL;
  end;

  FreeAndNil(qryPrimeiraParc);

  qyAux.SQL.Text :=
    ' INSERT INTO fin_negocia_parc_nova ( cd_negocia, cd_mensalidade ) ' +
    ' VALUES (' + IntToStr(CdNegociacao)+ ', ' + IntToStr(cd_primeira_mensalidade) + ') ';
  qyAux.ExecSQL();
  
  while intIndice <= ParcelasGeradas - 1do
  begin
     Screen.Cursor := crHourGlass;
     DecodeDate( StrToDateTime(ArrayDatas[intIndice]), wYear, wMonth, wDay );

     DM.tblDeptoCursoTurma.Close;
     DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := ano_semestre;
     DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := cd_turma;
     DM.tblDeptoCursoTurma.Open;

     iCodMensa := DM.GerarMensalidade(
         CodigoAluno,
         StrToInt(ArrayParcelasNovas[intIndice]),
         cd_turma,
         StrToCurr(ArrayCalculados[intIndice]),
         StrToCurr(ArrayJurosNovas[intIndice]),
         ano_semestre,
         StrToDateTime(ArrayDatas[intIndice]),
         StrToDateTime(ArrayDatas[intIndice]),
         2,
         DM.tblDeptoCursoTurmaCurso.AsString,
         DM.tblDeptoCursoTurmaDepto.AsInteger,
         4,
         -1,
         StrToCurr(ArrayDescontosNovas[intIndice]),
         StrToCurr(ArrayCreditosNovas[intIndice]),
         'Parcela de Negociação',
         cd_tipo_titulo,
         cd_tipo_conta,
         DM.tblDeptoCursoTurmacd_centro.AsInteger,
         0,
         0,
         'N',
         0,
         0,
         10,
         0,
         0,
         Dm.tblDeptoCursoTurmacd_coligada.AsInteger,
         0,
         100,
         0,
         '',
         0,
         liberarDescontos,
         False
     );
    // Registrar o movimento de contas a receber

    // Registrar na tabela fin_negocia_parc_atuais

    qyAux.SQL.Text :=
        ' INSERT INTO fin_negocia_parc_nova ( cd_negocia, cd_mensalidade ) ' +
        ' VALUES (' + IntToStr(CdNegociacao)+ ', ' + IntToStr(iCodMensa) + ') ';
    qyAux.ExecSQL();


    Screen.Cursor := crDefault;
    Inc( intIndice );
  end;

  // Registrar na tabela de Negociações

  // Chamar a procedure NEGOCIA_COMPETENCIA

  try
    qyAux.Close();
    qyAux.SQL.Text := 'SHOW PROCEDURE STATUS WHERE NAME = "PROC_COMPETENCIA"';
    qyAux.Open();

    if not qyAux.EOF then begin
       qyAux.Close();
       qyAux.SQL.Text := 'CALL PROC_COMPETENCIA(' +IntToStr(CdNegociacao) + ')';
       qyAux.ExecSQL();
    end;
  finally
     qyAux.Close();
  end;


  FreeAndNil(qryUpdate);
  Screen.Cursor := crDefault;

end;

function TDM.variavel_parametro(variavel: string; const parametro_geral: Boolean; coligada_filha: integer;coligada_matriz: integer): string;
begin
   Result := TUMNucleo.GetParametro(variavel, parametro_geral,coligada_filha,coligada_matriz);
end;

procedure TDM.verificaMultaRecebimento();
const
   SQL_VERIFICA_MULTAS =
   'SELECT cd_multa FROM bib_multas WHERE cd_mensalidade = :mensalidade';  
var
   qryVerificaMultasRecebimento : TUMZQuery;
begin
   Self.CriarConsulta(qryVerificaMultasRecebimento);

   qryVerificaMultasRecebimento.SQL.Text := SQL_VERIFICA_MULTAS;

   //Procura por multas
   qryVerificaMultasRecebimento.ParamByName('mensalidade').AsString := Dm.tblMensalidadescd_mensalidade.AsString;
   qryVerificaMultasRecebimento.Open;

   if not qryVerificaMultasRecebimento.IsEmpty then
   begin
      dm.qryUpdateMultas.Close;
      dm.qryUpdateMultas.ParamByName('cd_multa').AsString := qryVerificaMultasRecebimento.FieldByName('cd_multa').AsString;
      dm.qryUpdateMultas.ExecSQL;
   end;

   FreeAndNil(qryVerificaMultasRecebimento);
end;

function TDM.verificaTabelasMyISAM(qyTabelas: TUMZQuery; slCamposAlteracao,
  slTabelasIgnorar, slTabelasExcessao: TStringList): Boolean;
var
   slTabelasMyISAM: TStringList;
   qyCampos: TUMZQuery;
   sMensagemErro: String;
   parametros: TParamsIni;
   i: Integer;   
begin
   // Cria e configuração a query de campos
   DM.CriarConsulta(qyCampos);
   qyCampos.ParamCheck := false;

   // Retorna das tabelas que estão em MyISAM e precisam ser InnoDB
   slTabelasMyISAM := TStringList.Create();

   TfSplash.GetInstancia().ShowSplashScreen('Verificando estruturas...', 'Processando '+IntToStr(qyTabelas.RecordCount)+' tabelas');

   { Verifica se alguma tabela que será utilizada para
     troca de código é do tipo de Engine MyISAM }
   qyTabelas.First;
   while not qyTabelas.Eof do
   begin

      // Verifica se a Engine da tabela é NULL (views), nesse caso ignora elas
      if qyTabelas.Fields[1].IsNull then
      begin
         qyTabelas.Next;
         continue;
      end;

      // Verifica se a tabela deve ser ignorada por alguma excessão
      if (slTabelasIgnorar.IndexOf( qyTabelas.Fields[0].AsString ) > -1) or
         (slTabelasExcessao.IndexOf( qyTabelas.Fields[0].AsString ) > -1) then
      begin
         qyTabelas.Next;
         continue;
      end;

      { Busca todos os campos da tabela sendo varrida }
      qyCampos.Close;
      qyCampos.SQL.Text := 'SHOW FIELDS FROM ' + qyTabelas.Fields[0].AsString;
      qyCampos.Open;

      TfSplash.GetInstancia().SetSplashText('Processando '+IntToStr(qyTabelas.RecNo)+' de '+IntToStr(qyTabelas.RecordCount)+'.');

      // Varre a lista de campos encontrados para a tabela
      while not qyCampos.Eof do
      begin

         { Verifica se o campo NÃO esta previsto na lista de
           campos esperados para alteração pula ele }
         if slCamposAlteracao.IndexOf( qyCampos.FieldByName('Field').AsString ) = -1 then
         begin
            qyCampos.Next;
            continue;
         end;

         // Não prosseguir caso a tabela não seja InnoDB (não suportada em transactions)
         if qyTabelas.Fields[1].AsString <> 'InnoDB' then
         begin
            slTabelasMyISAM.Add(qyTabelas.Fields[0].AsString);
            qyCampos.Last;
            qyCampos.Next;
            continue;
         end;

         qyCampos.Next;
      end;

      qyTabelas.Next;
   end;

   TfSplash.GetInstancia().CloseSplashScreen();

   if slTabelasMyISAM.Count > 0 then
   begin

      // Monta a mensagem de erros com todos erros gerados
      for i := 0 to slTabelasMyISAM.Count-1 do
      begin
         sMensagemErro := sMensagemErro + slTabelasMyISAM[i] + #13;
      end;

      sMensagemErro := 'Existem tabelas que não são suportadas por essa operação. É necessário '+#13+
                       'executar o Otimizador de Banco de Dados através da administração '+#13+
                       'do portal online para continuar.'+#13#13+
                       'Tabelas não suportadas: ' + #13#13 + sMensagemErro;

      // Mostra os erros ocorridos
      parametros.titulo := 'Atenção';
      parametros.opcoes := (BT_OK + ICO_ERROR);
      parametros.mensagens.msgPrincipal := sMensagemErro;
      parametros.mensagens.msgTopo := 'Não foi possível realizar essa operação pelos seguintes motivos:'+#13;
      parametros.mensagens.msgRodape := '';
      parametros.dimensao.altura := 350;
      parametros.dimensao.largura := 600;

      TfrmMensagem.create(Self, parametros).ShowModal;

      Result := True;
      
   end else begin

      Result := False;

   end;
end;

procedure TDM.ZerarFaltaEtapaAluno(const etapa, anosemestre: Integer;
  const turma: String; const disciplina, codigoaluno: Integer);
var
   qyUpdateNullValueFicha: TUMZQuery;
begin
   CriarConsulta(qyUpdateNullValueFicha);

   qyUpdateNullValueFicha.SQL.Clear();
   qyUpdateNullValueFicha.SQL.Add('UPDATE fichaindividual');
   qyUpdateNullValueFicha.SQL.Add('SET falta' + IntToStr(etapa) + ' = NULL');
   qyUpdateNullValueFicha.SQL.Add('WHERE anosemestre = :anosemestre AND');
   qyUpdateNullValueFicha.SQL.Add('      turma = :turma AND');
   qyUpdateNullValueFicha.SQL.Add('      disciplina = :disciplina AND');
   qyUpdateNullValueFicha.SQL.Add('      codigoaluno = :codigoaluno');

   qyUpdateNullValueFicha.ParamByName('anosemestre').AsInteger := anosemestre;
   qyUpdateNullValueFicha.ParamByName('turma').AsString := turma;
   qyUpdateNullValueFicha.ParamByName('disciplina').AsInteger := disciplina;
   qyUpdateNullValueFicha.ParamByName('codigoaluno').AsInteger := codigoaluno;

   qyUpdateNullValueFicha.ExecSQL;

   FreeAndNil(qyUpdateNullValueFicha);
end;

procedure TDM.set_variavel_parametro(variavel, valor: string);
var
   ColigadaMatriz : TColigadaMatriz;
begin
   ColigadaMatriz := TColigadaMatriz.Create(0, '');
   ColigadaMatriz.SetParametro(variavel, valor);

   FreeAndNil( ColigadaMatriz );
end;

procedure TDM.SQLMonitorLogTrace(Sender: TObject; Event: TZLoggingEvent);
begin
   if not(isCliente) then
   begin
      FDllProc(Pointer(Event));

      if TGeneral.IsDebugging then
      begin
         OutputDebugString(PAnsiChar(Event.Message));
      end;
   end;

   TTempoOcioso.Interval := (Self.paramTempoInatividade * 60) * 1000;
   TTempoOcioso.Enabled := False;
   TTempoOcioso.Enabled := True;
end;

procedure TDM.startConnDefaultConnection(Sender: TObject);
begin
   ConectaUnimestre;
end;

procedure TDM.StartConnDocsDefaultConnection(Sender: TObject);
const
   S_MSG_SEMCONEXAO = 'Ocorreu um erro na tentativa de efetuar conexão com o banco de dados do UNIMESTRE: %s';
var
   LConnIni: TIniFile;
begin
   LConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');
   try
      if dbDocs.Connected then
         dbDocs.Disconnect;

      if LConnIni.ReadInteger( 'Configuracoes', 'EfeitosVisuais', 0 ) = 0 then
         dbDocs.SQLHourGlass := false
      else
         dbDocs.SQLHourGlass := true;

      dbDocs.HostName := LConnIni.ReadString('Conexao.Docs', 'Servidor', 'localhost');
      dbDocs.Database := LConnIni.ReadString('Conexao.Docs', 'Banco', 'unimestre_docs');
      dbDocs.User := LConnIni.ReadString('Conexao.Docs', 'Usuario', 'academico');
      dbDocs.Password := TUMCriptografia.UMCrypt(LConnIni.ReadString('Conexao.Docs', 'Senha', 'C946E11A2BA225D2095C9F5683EF5590BF'), ctDecode);
      dbDocs.Port := LConnIni.ReadInteger('Conexao.Docs', 'Porta', 3306);
      dbDocs.Protocol := LConnIni.ReadString('Conexao.Docs', 'Protocolo', 'mysql-5');
      try
         dbDocs.Connect;
      except
         on E: Exception do
            Mensagem(Format(S_MSG_SEMCONEXAO, [E.Message]), 'Erro', MB_ICONERROR);
      end;
   finally
      FreeAndNil(LConnIni);
   end;
end;

// Função para descobrir quantidade de registros do DataSet passado
// Para TUMZQuery
procedure TDM.quantidade_registros(DataSet: TUMZQuery; Popup: TPopupMenu; naoLimpaItem: Boolean = True);
var
  Item: TMenuItem;
begin
  { Alteração para manipular a popup da tela de matriculas}
  if naoLimpaItem then
    Popup.Items.Clear
  else
  begin
    if Popup.Items.Count = 3 then
      Popup.Items[2].Destroy;
  end;
  Item := TMenuItem.Create(self);

  if DataSet.RecordCount = -1 then
    Item.Caption := 'Total de registros: ' + IntToStr(Dataset.RowsAffected)
  else
    Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);

  Popup.Items.Add(Item);
end;

// Função para descobrir quantidade de registros do DataSet passado
// Para TZTable
procedure TDM.quantidade_registros_table(DataSet: TZTable; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;
  Item := TMenuItem.Create(self);
  Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);
  Popup.Items.Add(Item);
end;

procedure TDM.quantidade_registros(DataSet: TZTable; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;
  Item := TMenuItem.Create(self);

  if DataSet.RecordCount = -1 then
    Item.Caption := 'Total de registros: ' + IntToStr(Dataset.RowsAffected)
  else
    Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);

  Popup.Items.Add(Item);
end;

procedure TDM.quantidade_registros(DataSet: TClientDataSet; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;
  Item := TMenuItem.Create(self);

  if DataSet.RecordCount = -1 then
    Item.Caption := 'Total de registros: 0'
  else
    Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);

  Popup.Items.Add(Item);
end;

procedure TDM.quantidade_registros_table(DataSet: TUMZQuery; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;
  Item := TMenuItem.Create(self);
  Item.Caption := 'Total de registros: ' + IntToStr(DataSet.RecordCount);
  Popup.Items.Add(Item);
end;

procedure TDM.AtualizaDocumentacao(const CodigoAluno: Integer;
  const Curso: string);
const
   SSQLAtualizaDocs =
      'INSERT INTO DOCUMENTOS_ALUNOS (CODIGOALUNO, COD_DOCUMENTO, APRESENTOU)' +
      'SELECT ' +
         'MA.CODIGOALUNO,' +
         'DN.COD_DOCUMENTO,' +
         '''N'' ' +
      'FROM ' +
         'MATRICULAS MA ' +
            'JOIN PESSOAS PE ON ' +
               '(MA.CODIGOALUNO = PE.CD_PESSOA) ' +
            'JOIN DOCUMENTOS_NECESSARIOS DN ON ' +
               '(MA.CURSO = DN.CURSO) ' +
               'JOIN DOCUMENTOS D ON ' +
                  '(DN.COD_DOCUMENTO = D.CODIGO) AND ' +
                  '( ' +
                  '(D.DS_SEXO = ''A'') OR ' +
                  '(PE.DS_SEXO = D.DS_SEXO) ' +
                  ') ' +
               'LEFT JOIN DOCUMENTOS_ALUNOS DA ON ' +
                  '(MA.CODIGOALUNO = DA.CODIGOALUNO) AND ' +
                  '(DN.COD_DOCUMENTO = DA.COD_DOCUMENTO) ' +
      'WHERE ' +
         'MA.CODIGOALUNO = ? AND ' +
         'MA.CURSO = ? AND ' +
         'DA.CODIGOALUNO IS NULL ' +
      'GROUP BY ' +
         'MA.CODIGOALUNO,' +
         'DN.COD_DOCUMENTO';
var
   Stmt: IZPreparedStatement;
begin
   Stmt := PrepareStatement(SSQLAtualizaDocs);
   try
      Stmt.SetInt(1, CodigoAluno);
      Stmt.SetString(2, Curso);
      Stmt.ExecutePrepared;
   finally
      Stmt.Close;
   end;
end;

procedure TDM.atualizaResponsavelFinanc(iCodAluno, iCodResponsavel,
  iCodResponsavelOld: Integer);
var
   qyAuxAtu: TUMZQuery;
   mensagemLog : String;
   cdColigada : Integer;
begin
   DM.CriarConsulta(qyAuxAtu);

   if (iCodResponsavel <= 0) then begin
      Exit;
   end;
   if not (qyAux.Active) then begin
      qyAuxAtu := qyAux;
   end
   else if not (qyAux1.Active) then begin
      qyAuxAtu := qyAux1;
   end
   else if not (qyAux2.Active) then begin
      qyAuxAtu := qyAux2;
   end;
   if (iCodResponsavelOld <= 0) then begin
      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
      qyAuxAtu.SQL.Text := 'SELECT cd_resp_finan FROM pessoas WHERE cd_pessoa = :codaluno';
      qyAuxAtu.ParamByName('codaluno').AsInteger := iCodAluno;
      qyAuxAtu.Open();
      if not (qyAux.IsEmpty()) then begin
         iCodResponsavelOld := qyAuxAtu.FieldByName('cd_resp_finan').AsInteger;
      end;
      qyAuxAtu.Close();
   end;

   if (iCodResponsavelOld <> iCodResponsavel) then begin

      mensagemLog := 'Alterado responsável das mensalidades: ';
      //Busca os titulos que serão alterados pra gravar Log
      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
      qyAuxAtu.SQL.Text := '' +
      ' SELECT cd_mensalidade, cd_coligada FROM mensalidades '+
      ' WHERE codigoaluno = :codaluno '+
      ' AND situacao IN (2,10) AND datavencimento >= :data ' +
      ' AND (cd_resp is null OR cd_resp = 0 OR cd_resp = :oldresp )';
      qyAuxAtu.ParamByName('oldresp').AsInteger := iCodResponsavelOld;
      qyAuxAtu.ParamByName('codaluno').AsInteger := iCodAluno;
      qyAuxAtu.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', DataAtual);
      qyAuxAtu.Open();

      cdColigada := qyAuxAtu.FieldByName('cd_coligada').AsInteger;
      while not qyAuxAtu.Eof do
      begin
         mensagemLog := mensagemLog + qyAuxAtu.FieldByName('cd_mensalidade').AsString;
         if(qyAuxAtu.RecNo <> qyAuxAtu.RecordCount) then
         begin
            mensagemLog := mensagemLog + ',';
         end;
         qyAuxAtu.Next;
      end;
      mensagemLog := mensagemLog + ' de '+inttostr(iCodResponsavelOld)+' para '+inttostr(iCodResponsavel)+' via Cadastro de Aluno';

      DM.setLog(1001, 'Alteração',inttostr(iCodAluno) + ';' + inttostr(iCodResponsavelOld) + ';' + inttostr(iCodResponsavel),cdColigada, mensagemLog);

      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
      qyAuxAtu.SQL.Text := '' +
      ' UPDATE mensalidades SET cd_resp = :newresp '+
      ' WHERE codigoaluno = :codaluno '+
      ' AND situacao IN (2,10) AND datavencimento >= :data ' +
      ' AND (cd_resp is null OR cd_resp = 0 OR cd_resp = :oldresp )';
      qyAuxAtu.ParamByName('newresp').AsInteger := iCodResponsavel;
      qyAuxAtu.ParamByName('oldresp').AsInteger := iCodResponsavelOld;
      qyAuxAtu.ParamByName('codaluno').AsInteger := iCodAluno;
      qyAuxAtu.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', DataAtual);
      qyAuxAtu.ExecSQL();
      qyAuxAtu.Close();
      qyAuxAtu.Params.Clear();
   end;
end;

function TDM.pegar_desconto( CdMensalidade : Integer; DataPagamento : TDateTime) : Currency;
begin
   qrySelectDescontos.ParamByName('CD_MENSALIDADE').AsInteger := CdMensalidade;
   qrySelectDescontos.ParamByName('DT_BASE').AsDateTime := DataPagamento;
   qrySelectDescontos.Open;
   if qrySelectDescontos.IsEmpty then
      Result := 0
   else
      Result := qrySelectDescontosDECONTO.AsFloat;
   qrySelectDescontos.Close;
end;

function TDM.pegar_acrescimo( CdMensalidade : Integer; DataPagamento : TDateTime) : Currency;
begin
   qrySelectAcresc.ParamByName('CD_MENSALIDADE').AsInteger := CdMensalidade;
   qrySelectAcresc.ParamByName('DT_BASE').AsDateTime := DataPagamento;
   qrySelectAcresc.Open;
   if qrySelectAcresc.IsEmpty then
      Result := 0
   else
      Result := qrySelectAcrescACRESCIMO.AsFloat;
   qrySelectAcresc.Close;
end;

procedure TDM.tblFichaIndividualNota1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;


   if Sender.AsFloat = -2 then
   begin
      Text := '****'
   end
   else if Sender.AsFloat = -1 then
   begin
      Text := 'DISP'
   end
   else if Sender.AsString = '' then
   begin
      Text := '';
   end
   else if tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      );
   end else begin
      Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, tblAvaliacaonr_casas_decimais.AsInteger ) ;
   end;  
end;

procedure TDM.tblFichaIndividualNotaExameGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   DisplayText := True;

   if tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      );
   end else begin
      Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, tblAvaliacaonr_casas_decimais.AsInteger ) ;
   end;
end;

procedure TDM.tblFichaIndividualnota_d1GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   DisplayText := True;


   if Sender.AsFloat = -2 then
   begin
      Text := '****'
   end
   else if Sender.AsFloat = -1 then
   begin
      Text := 'DISP'
   end
   else if Sender.AsString = '' then
   begin
      Text := '';
   end
   else if tblAvaliacaosn_conceitos_parciais.AsString = 'S' then
   begin
      Text := TAvaliacoesConceitos.GetInstancia().GetConceitoFromNota(
         tblAvaliacaocd_avaliacao.AsInteger,
         Sender.AsFloat, Sender.IsNull
      );
   end else begin
      Text := FloatToStrF( Sender.AsFloat, ffFixed, 6, tblAvaliacaonr_casas_decimais.AsInteger ) ;
   end;
end;

procedure TDM.tblInstituicoesBeforePost(DataSet: TDataSet);
begin
   if(tblInstituicoesnm_instituicao.AsString = '') then
   begin
      tblInstituicoes.Cancel;
   end;
end;

procedure TDM.tblFichaIndividualAfterOpen(DataSet: TDataSet);
begin
   DM.tblAvaliacao.Close;
   DM.tblAvaliacao.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
   DM.tblAvaliacao.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
   DM.tblAvaliacao.Open;
end;

procedure TDM.tblFichaIndividualFalta1GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   DisplayText := True;
   if Sender.IsNull then
      Text := ''
   else
      Text := FloatToStr(Sender.AsFloat);
end;

function TDM.Converter_para_ponto(Valor: Double): String;
var text: string;
begin
   text := Trim(FloatToStrF(valor,  ffFixed, 6, 10));
   text := copy(text, 1, Pos(',', text)-1) + '.' + copy(text, pos(',',text)+1,5);

   Result := Trim(text);

end;

function TDM.condicao_com_arredondamento(calculo_notas, formula,
  arredonda: string): string;
var
   text : string;
   velho: string;
begin

   velho := lowercase(formula);
   text := ReplaceStr(velho, 'mediafinal', '(' + calculo_notas + ' + ' + arredonda + ')');

   result := text;

end;

function TDM.recalcular_creditos_financeiros( intCodigoAluno : Integer; strTurmaMatricula : String; intAnoSemestre : Integer; avisar : boolean = true; snCancelando : boolean = false; snAlertas : boolean = true ) : TAvisosRecalculoCreditos;
{
const
   SSQLUpdateMovCR =
      'UPDATE fin_mov_cr c ' +
      'SET ' +
         'c.vl_saida = ' +
            'CASE ' +
               'WHEN c.vl_saida > 0 THEN ROUND(c.vl_saida * ? / ?, 2) ' +
               'ELSE ROUND(c.vl_perc_desc_fixo * ? / 100, 2) ' +
            'END,' +
         'c.vl_perc_desc_fixo = ' +
            'CASE ' +
               'WHEN ? = 0 THEN c.vl_perc_desc_fixo ' +
               'ELSE 100 * ? / ? ' +
            'END ' +
      'WHERE ' +
         'c.cd_mensalidade = ? AND ' +
         'c.sn_desc_condicional = 0 AND ' +
         'EXISTS ( ' +
            'SELECT ' +
               'a.cd_acao ' +
            'FROM ' +
               'fin_acoes_movimento a ' +
            'WHERE ' +
               'c.cd_acao = a.cd_acao AND ' +
               'a.cd_tipo_acao = 3)';

}
const
  {
    O order by prioriza:
    1) Vigencia ativa
    2) A data de fim da vigencia esteja próxima da matricula do aluno
    3) Vigências que já passaram (maior prioridade que vigências futuras)
  }
  SQL_GET_CREDITOS_TURMA =
    ' SELECT '+
    '    fp.cd_plano, '+
    '    fp.vl_cobrado, '+
    '    fpi.vl_desconto, '+
    '    fpi.vl_desconto_extra, '+
    '    fp.nr_creditos_base, '+
    '    fp.nr_parcelas '+
    ' FROM '+
    '    turmas t '+
    '    INNER JOIN fin_planos_turmas fpt ON (fpt.cd_turma = t.codigo AND fpt.cd_curso = t.curso) '+
    '    INNER JOIN fin_planos fp ON ( '+
    '       fp.cd_plano = COALESCE(t.cd_plano_padrao, fpt.cd_plano) AND '+
    '       fp.nr_anosemestre = t.anosemestre '+    
    '    ) '+
    '    INNER JOIN fin_planos_itens fpi ON (fpi.cd_plano = fp.cd_plano) ' +
    ' WHERE ' +
    '    t.codigo LIKE :cd_turma ' +
    '    AND t.anosemestre = :nr_anosemestre ' +
    ' ORDER BY '+
    '    ((fp.sn_vigencia = 0) OR (:dt_matricula BETWEEN fp.dt_vigencia_inicio AND fp.dt_vigencia_fim)) DESC, '+
    '    ABS(DATE_FORMAT(COALESCE(fp.dt_vigencia_fim, :dt_matricula), "%Y%m%d") - DATE_FORMAT(:dt_matricula, "%Y%m%d")) ASC, '+
    '    (fp.dt_vigencia_fim < :dt_matricula) DESC '+
    ' LIMIT 1';

  SQL_ATUALIZAR_VL_CREDITO =
    ' UPDATE '+
    '    mensalidades m '+
    '    INNER JOIN pessoas r ON (m.cd_resp = r.cd_pessoa) '+
    '	   LEFT JOIN fin_planos_itens fpi ON ( '+
    '		    fpi.CD_PLANO_ITEM = m.cd_item_plano '+
    '	   ) '+
    ' SET '+
    '    m.vl_credito = COALESCE(m.vl_percentual_divisao/100, 1) * :vl_credito '+
    ' WHERE '+
    '    m.codigoaluno = :cd_pessoa AND '+
    '    m.turma LIKE :cd_turma AND '+
    '    m.anosemestre = :nr_anosemestre AND '+
    '    m.sn_credito_parcela IN ("S", "F") AND '+
    '    m.cd_item_plano IS NOT NULL AND '+
    '    m.cd_item_plano <> 0';
Var
   Stmt: IZPreparedStatement;
  VlAbatido,
  VlCompleto,
  QtdCreditos,
  VlFaltaPagar,
  VlPendente,
  NovoValor,
  NovoDesconto,
  NovoDescExtra,
  NovoCredito :  Double;

  qSel, qAtualiza, qDesconto,
  qQtdCreditosTurma, qParcelasPlano,
  qValorCreditoTurma, qAtualizarVlCredito : TUMZQuery;

  bAjustou, bCreditoPelaTurmaDisciplina: Boolean;
  sFiltro1, sFiltro2,
  sLog : String;
  dtBloqueio : TDateTime;
  dt_hoje : String;
  porcDescFisico,porcDescCondicional, cValorEntrada,
  vlCredito, vlParcela: Double;
  nrParcelasPlanoAluno: Integer;
  diaMesAtual, vlEntrada: String;
  wdia, wmes, wano : Word;
begin
 // Essa função é disparada sempre que houve mudança na grade curricular do aluno - matríuclas em disciplinas
  bAjustou := false;
  CriarConsulta(qSel);
  sFiltro1 := ''; 

  bCreditoPelaTurmaDisciplina := DM.variavel_parametro('CreditoMensalidadesPelaTurmaDisciplina') = 'S';

  // Inicia o resultado como processo executado, o status pode mudar ao decorrer dessa função
  Result := ProcedimentoExecutado;

  // Pegar o Valor que não deverá mais ser alterado pois a mensalidade foi
  // PAGA ou já passou do vencimento
  with qSel do begin

    sFiltro1 := '';
    if DM.variavel_parametro('credito_calculo_semvencida') = 'S' then begin

      dt_hoje := 'CURRENT_DATE';
      if snCancelando AND (DM.variavel_parametro('financeiro_cancelar_mes_atual') = 'N') then begin
         // não mexer na parcela do mês atual

         // Verificar se deve ser observado o dia do mês
         diaMesAtual :=  DM.variavel_parametro('financeiro_cancelar_mes_atual_dia');
         if diaMesAtual <> '' then begin   // Se o parametro for um número

            DecodeDate(Dm.DataAtual, wano, wmes, wdia);

            // Hoje não passou do dia do parametro
            IF (wdia < StrToInt(diaMesAtual)) then begin 
               dt_hoje := 'CURRENT_DATE';
            end else begin
               // Caso contrário não cancelar mais o mes atual - fixar o inicio do proximo mes. 
               dt_hoje := 'DATE_FORMAT(DATE_ADD(CURRENT_DATE,INTERVAL 1 MONTH), "%Y-%m-01")';
            end;               
             
         end else begin
             // Não usa dia do mes específico, então o mes atual não será ajustado
             dt_hoje := 'DATE_FORMAT(DATE_ADD(CURRENT_DATE,INTERVAL 1 MONTH), "%Y-%m-01")';
         end;
      end;

      sFiltro1 := sFiltro1 + ' OR ( situacao in (2,10) AND datavencimento < ' + dt_hoje + ' ) ';
    end;
    sFiltro1 := sFiltro1 + ' OR (sn_nfe_gerada = 1) ';

    {  Retirar o FIES do cálculo do valor da mensalidade
       As parcelas de responsabilidade do FIES serão consideradas como valores congelados, e neste acso, o ajuste terá que ser feito na parte do aluno somente.
    }

    if DM.variavel_parametro('credito_calculo_sem_fies') = 'S'  then begin
      sFiltro1 := sFiltro1 + ' OR (r.sn_nao_bloquear_financeiro = 1) ';
    end;

    // Incluir data de Bloqueio
    dtBloqueio := DM.DataBloqueioFinanceiro(0);

    if dtBloqueio <> 0 then begin
       if(DM.db.Protocol = DB_PROTOCOL_MYSQL) then
       begin
          sFiltro1 := sFiltro1 + ' OR ( situacao in (2,10) AND (datavencimento < ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtBloqueio)) + ' OR dt_competencia < ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtBloqueio)) + ' )) ';
       end
       else
       begin
          sFiltro1 := sFiltro1 + ' OR ( situacao in (2,10) AND (datavencimento < TO_TIMESTAMP(' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtBloqueio)) + ', ''YYYY-MM-DD'') OR dt_competencia <  TO_TIMESTAMP ( ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtBloqueio)) + ' ,''YYYY-MM-DD'')))';
       end;
    end;

    Close();
    SQL.Text := '' +
     ' SELECT SUM(valorbruto) VlAbatido FROM mensalidades ' +
     ' INNER JOIN pessoas as r ON (mensalidades.cd_resp = r.cd_pessoa) ' +      
     ' WHERE codigoaluno = ' + IntToStr(intCodigoAluno) +
     '   AND turma = ' + QuotedStr(strTurmaMatricula) + ' ' +
     '   AND anosemestre = ' + IntToStr(intAnoSemestre)  +
     '   AND sn_credito_parcela in (''S'',''F'') '  +
     '   AND ( situacao not in (2,10) '  +
     sFiltro1 +
     '         OR ( sn_credito_parcela = ''F'' ) ' + 
     '       ) ';
    Open();

    VlAbatido := FieldByName('VlAbatido').AsCurrency;
  end;

  // Pegar a Quantidade de Créditos que o aluno tem matriculado
  with qSel do begin

    Close();
    SQL.Text := '' +
     ' SELECT SUM(COALESCE(f.nr_cr_fin,gd.NR_AULAS)) QtdCreditos  ' +
     ' FROM  fichaindividual f                ' +
     ' INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) ' +
     ' INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) ' +
     ' INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina AND t.serie = gd.NR_SERIE) ' +
     ' WHERE                                 ' +
     '    f.codigoaluno = ' + IntToStr(intCodigoAluno) +
     '    AND f.turmamatricula = ' + QuotedStr(strTurmaMatricula) + ' ' +
     '    AND f.anosemestre = ' + IntToStr(intAnoSemestre)  +
     '    AND f.situacao not in (3,4,5,6,7,8) ' +
     '    AND f.turma <> ''HISTORICO'' ' +
     ' GROUP BY f.codigoaluno  ' ;
    Open();

    QtdCreditos := FieldByName('QtdCreditos').AsCurrency;
  end;

  // Se o parâmetro de crédito pela turma disciplina estiver ativo,
  // deve resgatar a quantidade de créditos individual
  if bCreditoPelaTurmaDisciplina then
  begin

    CriarConsulta(qQtdCreditosTurma);
    CriarConsulta(qParcelasPlano);
    CriarConsulta(qValorCreditoTurma);
    CriarConsulta(qAtualizarVlCredito);

    // Busca o valor total que o aluno deveria pagar pelos créditos contratados
    qParcelasPlano.Close();
    qParcelasPlano.SQL.Text := '' +
        ' SELECT '+
        '   m.dataemissao dt_matricula, '+
        '   fp.nr_parcelas '+
        ' FROM '+
        '   matriculas m ' +
        '   INNER JOIN fin_planos fp ON (fp.cd_plano = m.planopagamento) ' +
        '   INNER JOIN fin_planos_itens fpi ON (fpi.cd_plano = fp.cd_plano) ' +
        ' WHERE '+
        '   m.codigoaluno = ' + IntToStr(intCodigoAluno) +
        '   AND m.turma = ' + QuotedStr(strTurmaMatricula) +
        '   AND m.anosemestre = ' + IntToStr(intAnoSemestre) +
        '   AND fp.sn_creditos = 1 ' +
        '   AND fpi.sn_credito_parcela IN (1,2)';
    qParcelasPlano.Open();
    qParcelasPlano.First;
    nrParcelasPlanoAluno := qParcelasPlano.FieldByName('nr_parcelas').AsInteger;

    vlParcela := 0;

    // Pegar a Quantidade de Créditos que o aluno tem matriculado
    qQtdCreditosTurma.Close();
    qQtdCreditosTurma.SQL.Text := '' +
       ' SELECT f.anosemestre, f.turma, SUM(COALESCE(f.nr_cr_fin, gd.NR_AULAS)) QtdCreditos ' +
       ' FROM  fichaindividual f                ' +
       ' INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) ' +
       ' INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) ' +
       ' INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina AND t.serie = gd.NR_SERIE) ' +
       ' WHERE                                 ' +
       '    f.codigoaluno = ' + IntToStr(intCodigoAluno) +
       '    AND f.turmamatricula = ' + QuotedStr(strTurmaMatricula) + ' ' +
       '    AND f.anosemestre = ' + IntToStr(intAnoSemestre)  +
       '    AND f.situacao not in (3,4,5,6,7,8) ' +
       '    AND f.turma <> ''HISTORICO'' ' +
       ' GROUP BY	f.codigoaluno, f.anosemestre, f.turma ' ;
    qQtdCreditosTurma.Open();
    qQtdCreditosTurma.First;

    // Calcular o valor da parcela, considerando os créditos
    // dos planos de outras turmas
    while not qQtdCreditosTurma.Eof do
    begin
      // Pegar os valores de créditos do plano da turma que está sendo cursada pelo aluno
      qValorCreditoTurma.Close();
      qValorCreditoTurma.SQL.Text := SQL_GET_CREDITOS_TURMA;
      qValorCreditoTurma.ParamByName('cd_turma').AsString := qQtdCreditosTurma.FieldByName('turma').AsString;
      qValorCreditoTurma.ParamByName('nr_anosemestre').AsInteger := qQtdCreditosTurma.FieldByName('anosemestre').AsInteger;
      qValorCreditoTurma.ParamByName('dt_matricula').AsDatetime := qParcelasPlano.FieldByName('dt_matricula').AsDatetime;
      qValorCreditoTurma.Open();

      // Cálcula o valor da parcela
      vlCredito := (qValorCreditoTurma.FieldByName('vl_cobrado').AsFloat /
          qValorCreditoTurma.FieldByName('nr_creditos_base').AsFloat);
      // O valor do crédito é proporcional ao número de parcelas do plano da matricula
      vlCredito := ((vlCredito * qValorCreditoTurma.FieldByName('nr_parcelas').AsInteger) /
          nrParcelasPlanoAluno) * qQtdCreditosTurma.FieldByName('QtdCreditos').AsCurrency;
      vlParcela := vlParcela + vlCredito;

      qQtdCreditosTurma.Next;
    end;

    {
      Recálcula o valor dos créditos das mensalidades,
      considerando os planos de pagamentos das disciplinas cursadas
      em outras turmas. Para isso utiliza o valor da parcela que foi cálculado
      considerando esses planos e o total de créditos cursados pelo aluno:
      vlCredito = vlParcela / totalCreditos
    }
    vlCredito := 0;
    if QtdCreditos > 0 then
    begin
      vlCredito := vlParcela / QtdCreditos;
    end;

    // Atualiza as mensalidades com o novo valor do crédito
    qAtualizarVlCredito.Close;
    qAtualizarVlCredito.SQL.Text := SQL_ATUALIZAR_VL_CREDITO;
    qAtualizarVlCredito.ParamByName('cd_pessoa').AsInteger := intCodigoAluno;
    qAtualizarVlCredito.ParamByName('nr_anosemestre').AsInteger := intAnoSemestre;
    qAtualizarVlCredito.ParamByName('cd_turma').AsString := strTurmaMatricula;
    qAtualizarVlCredito.ParamByName('vl_credito').AsCurrency := vlCredito;
    qAtualizarVlCredito.ExecSQL;

  end;

  // Pegar o valor Total que o aluno deveria pagar pelo créditos contratados

  with qSel do
  begin
    Close();
    SQL.Text := '' +
      ' SELECT SUM(ROUND(m.vl_credito * IF(m.sn_credito_parcela = ''S'', IF(COALESCE(i.NR_CREDITOS_MINIMOS,0) > :Creditos, COALESCE(i.NR_CREDITOS_MINIMOS,0), :Creditos ), :Creditos) , 2)) VlCompleto ' +
      ' FROM mensalidades m' +
      ' INNER JOIN pessoas as r ON (m.cd_resp = r.cd_pessoa) ' +      
      ' LEFT JOIN fin_planos_itens as i ON (i.CD_PLANO_ITEM = m.cd_item_plano) ' +
      ' WHERE m.codigoaluno = ' + IntToStr(intCodigoAluno) +
      '   AND m.turma = ' + QuotedStr(strTurmaMatricula) + ' ' +
      '   AND m.anosemestre = ' + IntToStr(intAnoSemestre)  +
      '   AND m.sn_credito_parcela in (''S'',''F'')'  +
      '   AND m.cd_item_plano is not null AND m.cd_item_plano <> 0 ';      // Não verificar parcelas geradas fora do plano - ajuste de diferenças
    ParamByName('Creditos').AsFloat := QtdCreditos;
    Open();

    VlCompleto := FieldByName('VlCompleto').AsFloat;
  end;

  // Calcular o valor que o aluno ainda tem que pagar

  VlFaltaPagar := vlCompleto - VlAbatido;

  // Valor das parcelas pendentes referente ao Total que
  // o aluno deveria pagar pelo créditos contratados

  with qSel do begin

    Close();
    SQL.Text := '' +
      ' SELECT SUM( ROUND(IF(COALESCE(i.NR_CREDITOS_MINIMOS,0) * m.vl_credito > vl_credito * :creditos, COALESCE(i.NR_CREDITOS_MINIMOS,0) * m.vl_credito , vl_credito * :creditos) ,2)) VlPendente, MAX(m.cd_item_plano) as ITEM_PLANO, COUNT(*) As QTD_PENDENTE ' +
      ' FROM mensalidades m ' +
      ' INNER JOIN pessoas as r ON (m.cd_resp = r.cd_pessoa) ' +      
      ' LEFT JOIN fin_planos_itens as i ON (i.CD_PLANO_ITEM = m.cd_item_plano) ' +
      ' WHERE m.codigoaluno = ' + IntToStr(intCodigoAluno) +
      '   AND m.turma = ' + QuotedStr(strTurmaMatricula) + ' ' +
      '   AND m.anosemestre = ' + IntToStr(intAnoSemestre)  +
      '   AND m.sn_credito_parcela in (''S'',''F'') ' +
      '   AND NOT ( m.situacao not in (2,10) '  +
     sFiltro1 +
     '         OR ( m.sn_credito_parcela = ''F'' ) ' +
     '       ) ';
    ParamByName('Creditos').AsFloat := QtdCreditos;
    Open();

    if (qSel.FieldByName('QTD_PENDENTE').AsInteger = 1) AND (qSel.FieldByName('ITEM_PLANO').AsInteger = 0) then
    begin
       // só tem uma parcela pendente e foi gerada adicional
       VlPendente := VlFaltaPagar;
    end else begin
       VlPendente := FieldByName('VlPendente').AsFloat;
    end;

  end;

  if (qSel.FieldByName('QTD_PENDENTE').AsInteger = 0) AND (RoundFloat(VlFaltaPagar, 2) > 0) then
  begin
     // tem valor que o aluno teria que pagar, porém, não existe mais mensalidades disponiveis para alterar
     // Gerar um novo título

     // Selecionar o próximo numero de parcela, tipo de titulo
     qSel.Close();
     qSel.SQL.Text :=
       ' SELECT me.parcela as parcela ' +
       '      , me.cd_tipo_titulo, me.datavencimento, me.curso, me.depto, me.cd_tipo_titulo, me.cd_plano_conta, me.cd_centro_custo, me.cd_coligada, me.vl_credito ' +
       '      , (p.VL_DESCONTO / p.VL_COBRADO) AS INDICE_DESCONTO, me.VL_PERCENTUAL_DIVISAO ' +
       '   FROM mensalidades as me ' +
       ' INNER JOIN pessoas as r ON (me.cd_resp = r.cd_pessoa) ' +       
       '  INNER JOIN matriculas as ma ON (ma.codigoaluno = me.codigoaluno and ma.turma = me.turma and ma.anosemestre = me.anosemestre) ' +
       '  LEFT JOIN fin_planos as p ON (ma.planopagamento = p.CD_PLANO) ' +
       '  WHERE me.codigoaluno = :codigoaluno ' +
       '    AND me.turma = :turma ' +
       ' 	  AND me.anosemestre = :anosemestre ' +
       '    AND me.cd_item_plano is not null AND me.sn_credito_parcela in (''S'', ''F'') ' +
       '  ORDER BY me.parcela desc limit 1 ' ;

     qSel.ParamByName('codigoaluno').AsInteger := intCodigoAluno;
     qSel.ParamByName('turma').AsString := strTurmaMatricula;
     qSel.ParamByName('anosemestre').AsInteger := intAnoSemestre;

     qSel.Open();

     if qSel.Eof then begin
        // Nenhuma mensalidade encontrada  - avisar o usuario
        if snAlertas then
        begin
           Mensagem('Foi detectado inconsistência no financeiro deste aluno. O Sistema não conseguiu ajustar o financeiro do aluno. Por favor, comunique o departamento financeiro.', 'Atenção', MB_OK + MB_ICONINFORMATION );
        end;
        Result := NenhumTituloEncontrado;
        FreeAndNIl(qSel);
        FreeAndNil(qAtualiza);
        Exit;
     end;

     // Gerar a mensalidade
     QtdCreditos := 0;
     if qSel.FieldByName('vl_credito').Asfloat > 0 then
     begin
        QtdCreditos := VlFaltaPagar / qSel.FieldByName('vl_credito').Asfloat;
     end;


     GerarMensalidade( intCodigoAluno
                     , qSel.FieldByName('parcela').AsInteger + 1
                     , strTurmaMatricula
                     , VlFaltaPagar
                     , 0
                     , intAnoSemestre
                     , qSel.FieldByName('datavencimento').AsDateTime
                     , qSel.FieldByName('datavencimento').AsDateTime
                     , 2
                     , qSel.FieldByName('curso').AsString
                     , qSel.FieldByName('depto').AsInteger
                     , 0
                     , -1
                     , (VlFaltaPagar * qSel.FieldByName('INDICE_DESCONTO').AsFloat )
                     , QtdCreditos
                     , 'Diferença de Créditos Acadêmicos'
                     , qSel.FieldByName('cd_tipo_titulo').AsInteger
                     , qSel.FieldByName('cd_plano_conta').AsInteger
                     , qSel.FieldByName('cd_centro_custo').AsInteger
                     , 0
                     , 0
                     , 'S'
                     , qSel.FieldByName('vl_credito').Asfloat
                     , 0
                     , 1
                     , 0
                     , 0
                     , qSel.FieldByName('cd_coligada').AsInteger
                     , 0
     );
        if snAlertas then
        begin
           Mensagem('O procedimento executado efetuou alterações no financeiro do estudante. '  +
                    'O Sistema gerou um novo título, pois não foi possível alterar os títulos atuais.' , 'Atenção', MB_OK + MB_ICONINFORMATION );
        end;
        Result := NovoTituloGerado;
        FreeAndNIl(qSel);
        FreeAndNil(qAtualiza);
        Exit;
  end else if (qSel.FieldByName('QTD_PENDENTE').AsInteger = 0) AND (VlFaltaPagar < 0) then  begin
       if snAlertas then
       begin
          Mensagem('Não foi possível efetuar o ajuste no financeiro do aluno. '  +
                   'Nenhum título ref. mensalidades está pendente para alterações.' , 'Atenção', MB_OK + MB_ICONINFORMATION );
       end;
       Result := SemTituloPendente;
       FreeAndNIl(qSel);
       FreeAndNil(qAtualiza);
       Exit;
  end else begin
      // INICIO AJUSTES DE VALORES NAS PARCELAS PENDENTES

      // Selecior todas as parcelas do aluno
      with qSel do begin

        sFiltro2 := '1 <> 1';
        if (DM.variavel_parametro('credito_calculo_devolucao')='S') then begin
           sFiltro2 := '1 = 1';
        end;

        Close();
        SQL.Text := '' +
         ' SELECT me.sn_credito_parcela, me.cd_mensalidade, me.Vl_Credito, me.valorbruto, me.valorextra, me.descontoextra, me.valortotal, me.vl_perc_desc_fixo, ' +
         ' CASE WHEN COALESCE(ip.valorbruto,0) = 0 THEN 0 ELSE (ip.valordesconto / ip.valorbruto) END as ind_desconto, me.vl_perc_desc_cond,  ' +
         ' me.valordesconto, me.nr_creditos, COALESCE(ip.nr_creditos_minimos,0) * me.vl_credito as ValorMinimo, ip.nr_creditos_minimos, ' +
         ' CAST(  CASE WHEN me.situacao not in (2,10) ' + sFiltro1 + '  OR ( me.sn_credito_parcela = ''F'' ) THEN ' +
         '        me.valorbruto ELSE ' +
         ' CASE WHEN (me.CD_ITEM_PLANO IS NULL OR me.CD_ITEM_PLANO = 0) THEN :VlPendente1 ELSE ' +  // TRATANDO AJUSTES SOBRE PARCELAS GERADAS DE DIFERENCAS
         '        CASE WHEN ' + sFiltro2 + ' THEN ' +
         '      	    CASE WHEN :VlPendente1 != 0 THEN  ( :VlFaltaPagar1 * (me.Vl_Credito * :QtdCreditos1 )) / :VlPendente1 ELSE null END ELSE ' +
         ' 				 CASE WHEN CASE WHEN :VlPendente2 != 0 THEN (( :VlFaltaPagar2 * (me.Vl_Credito * :QtdCreditos2 )) / :VlPendente2) ELSE NULL END > (me.Vl_Credito * :QtdCreditos3 ) THEN ' +
         '				 CASE WHEN :VlPendente3 != 0 THEN ( :VlFaltaPagar3 * (me.Vl_Credito * :QtdCreditos4 )) / :VlPendente3 ELSE  null  END ELSE ' +
         '					  (me.Vl_Credito * :QtdCreditos5 ) ' +
         '			    END    ' +
         '		  END         ' +
         '  END END AS DECIMAL(15,3)) as NovoValor, VL_PERCENTUAL_DIVISAO ' +
         ' FROM mensalidades me ' +
         ' INNER JOIN pessoas as r ON (me.cd_resp = r.cd_pessoa) ' +         
         ' LEFT JOIN itensplanospagamento ip ON (me.cd_item_plano = ip.cd_item_plano) ' +
         ' WHERE me.codigoaluno = ' + IntToStr(intCodigoAluno) +
         '   AND me.turma = ' + QuotedStr(strTurmaMatricula) +
         '   AND me.anosemestre = ' + IntToStr(intAnoSemestre)  +
         '   AND me.sn_credito_parcela in (''S'',''F'') ORDER BY me.parcela';

        ParamByName('VlFaltaPagar1').AsFloat := VlFaltaPagar;
        ParamByName('VlFaltaPagar2').AsFloat := VlFaltaPagar;
        ParamByName('VlFaltaPagar3').AsFloat := VlFaltaPagar;
        ParamByName('QtdCreditos1').AsFloat := QtdCreditos;
        ParamByName('QtdCreditos2').AsFloat := QtdCreditos;
        ParamByName('QtdCreditos3').AsFloat := QtdCreditos;
        ParamByName('QtdCreditos4').AsFloat := QtdCreditos;
        ParamByName('QtdCreditos5').AsFloat := QtdCreditos;
        ParamByName('VlPendente1').AsFloat := VlPendente;
        ParamByName('VlPendente2').AsFloat := VlPendente;
        ParamByName('VlPendente3').AsFloat := VlPendente;
        Open();

        CriarConsulta(qAtualiza);

        while not EOF do
        begin
           if RoundFloat(FieldByName('valorbruto').AsFloat, 2) <> RoundFloat(FieldByName('NovoValor').AsFloat, 2) then
           begin
              // O valor do crédito NUNCA deve ser dividido, este processo somente deve ocorrer durante uma divisão de títulos
              qAtualiza.SQL.Text := '' +
               ' UPDATE mensalidades ' +
               '    SET valorbruto = :NovoValor, nr_creditos = ROUND((:NovoValor / vl_credito),2), ' +
               '        valordesconto = :NovoDesconto, descontoextra = :NovoDescExtra ' +
               // '        vl_perc_desc_fixo = :porcDescFisico, vl_perc_desc_cond = :porcDescCondicional  '+
               ' WHERE cd_mensalidade = ' + FieldByName('cd_mensalidade').AsString;

              if FieldByName('NovoValor').AsFloat < FieldByName('ValorMinimo').AsFloat then
              begin
                 NovoValor := FieldByName('ValorMinimo').AsFloat;
                 NovoCredito := FieldByName('nr_creditos_minimos').AsFloat;
              end else begin
                 NovoValor := FieldByName('NovoValor').AsFloat;

                 // Cálcula o valor da parcela com base no percentual de divisão, caso a parcela tenha sido dividida para outro responsável
                 NovoCredito := 0;
                 if NOT((FieldByName('NovoValor').AsFloat = 0) AND (FieldByName('Vl_Credito').AsFloat = 0)) then
                 begin
                    NovoCredito := NovoValor / FieldByName('Vl_Credito').AsFloat;
                 end;
              end;

              qAtualiza.ParamByName('NovoValor').AsFloat := NovoValor;
              // Tratar divisão por ZERO

              // Atualizar os descontos fixos com base na fin_mov_cr - tratar desconto de valor fixo

              Dm.CriarConsulta(qDesconto);
              qDesconto.SQL.Text :=
               ' UPDATE fin_mov_cr as c  ' +
               '  INNER JOIN fin_acoes_movimento as a ON (a.cd_acao = c.cd_acao AND a.cd_tipo_acao = 3)  '+
               '    SET c.vl_perc_desc_fixo = ' +
               '          CASE WHEN IFNULL(vl_perc_desc_fixo, 0) > 0 THEN c.vl_perc_desc_fixo ' +
               '          ELSE 100 * c.vl_saida / :old_value ' +
               '        END, ' +
               '        c.vl_saida = '+
               '          CASE WHEN c.vl_saida > 0 THEN ROUND(IF(IFNULL(a.sn_desconto_valor_fixo,0) = 1, c.vl_saida, c.vl_saida / :old_value * :new_value),2) '+
               '          ELSE ROUND(c.vl_perc_desc_fixo * :new_value / 100, 2) '+
               '        END '+
               '  WHERE c.cd_mensalidade = :cd_mensalidade_origem AND c.cd_mensalidade_origem = :cd_mensalidade ' +
               '    AND c.sn_desc_condicional = 0  ';

              qDesconto.ParamByName('cd_mensalidade').AsInteger := FieldByName('cd_mensalidade').AsInteger;
              qDesconto.ParamByName('cd_mensalidade_origem').AsInteger := FieldByName('cd_mensalidade').AsInteger;
              qDesconto.ParamByName('old_value').AsCurrency := FieldByName('valorbruto').AsCurrency;
              qDesconto.ParamByName('new_value').AsCurrency := qAtualiza.ParamByName('NovoValor').AsFloat;

              qDesconto.ExecSQL();

              qDesconto.SQL.Text :=
               ' SELECT SUM(c.vl_saida) as vl_desc_fixo   '+
               '   FROM fin_mov_cr as c ' +
               '  INNER JOIN fin_acoes_movimento as a ON (a.cd_acao = c.cd_acao AND a.cd_tipo_acao = 3)  '+
               '  WHERE c.cd_mensalidade = :cd_mensalidade_origem AND c.cd_mensalidade_origem = :cd_mensalidade ' +
               '    AND c.sn_desc_condicional = 0  ';

              qDesconto.ParamByName('cd_mensalidade').AsInteger := FieldByName('cd_mensalidade').AsInteger;
              qDesconto.ParamByName('cd_mensalidade_origem').AsInteger := FieldByName('cd_mensalidade').AsInteger;
              qDesconto.Open();


              NovoDescExtra := qDesconto.FieldByName('vl_desc_fixo').AsCurrency;

              // Calcula porcentagem de desconto fixo/Condicional da mensalidade atual
              // Clau porcDescFisico      := FieldByName('vl_perc_desc_fixo').AsFloat / 100;
              porcDescCondicional := FieldByName('vl_perc_desc_cond').AsFloat / 100;

              // clau  if (porcDescFisico = 0) and (FieldByName('valorbruto').AsFloat > 0) then begin
              // clau     porcDescFisico := FieldByName('descontoextra').AsFloat / FieldByName('valorbruto').AsFloat;
              // clau  end;

              if (porcDescCondicional = 0) and (FieldByName('valorbruto').AsFloat > 0) then begin
                 porcDescCondicional := FieldByName('valordesconto').AsFloat / FieldByName('valorbruto').AsFloat;
              end;

              if NovoValor > 0 then
              begin
                 NovoDesconto  := porcDescCondicional * NovoValor;

                 // clau  NovoDescExtra := porcDescFisico * qAtualiza.ParamByName('NovoValor').AsFloat;

              end else begin
                 NovoDesconto := 0;
                 NovoDescExtra := 0;
              end;

              //Se tiver valor para ser feito o calculo
              // if (NovoDesconto > 0) and (NovoValor > 0) then
              // begin
              //    porcDescCondicional := 100 * NovoDesconto / NovoValor;
              // end;

              //Se tiver valor para ser feito o calculo
              // if (NovoDescExtra > 0) and (NovoValor > 0) then
              // begin
              //     porcDescFisico := 100 * NovoDescExtra / NovoValor;
              // end;

              qAtualiza.ParamByName('NovoDesconto').AsFloat := RoundFloat(NovoDesconto, 2);
              qAtualiza.ParamByName('NovoDescExtra').AsFloat := RoundFloat(NovoDescExtra, 2);
              // qAtualiza.ParamByName('porcDescFisico').AsFloat := porcDescFisico;
              // qAtualiza.ParamByName('porcDescCondicional').AsFloat := porcDescCondicional;
              qAtualiza.ExecSQL();

              bAjustou := true;
              // Log de Alteração da Mensalidade;
              sLog := 'Alteração Créditos: [' + FloatToStr(RoundFloat(FieldByName('nr_creditos').AsFloat,2)) + '] ';
              sLog := sLog + '=> [' + FloatToStr(RoundFloat(NovoCredito,2)) + ']';
              sLog := sLog + ' Valor Bruto: ['+FloatToStr(FieldByName('valorbruto').AsFloat)+'] => ['+FloatToStr(NovoValor)+']';

              if FieldByName('valordesconto').AsFloat > 0 then
              begin
                 sLog := sLog + ' Desc. Cond.: ['+FloatToStr(FieldByName('valordesconto').AsFloat)+'] => ['+FloatToStr(NovoDesconto)+']';
              end;

              if FieldByName('descontoextra').AsFloat > 0 then
              begin
                 sLog := sLog + ' Desc. Fixo.: ['+FloatToStr(FieldByName('descontoextra').AsFloat)+'] => ['+FloatToStr(NovoDescExtra)+']';
              end;
              DM.gerar_log( 10, slog, DM.iCdPessoaLogado, FieldByName('cd_mensalidade').AsString );

              // Atualizar o movimento de Entrada do título
              qAtualiza.Close();
              qAtualiza.SQL.Clear();
              qAtualiza.SQL.Text := '' +
                      ' UPDATE fin_mov_cr f, fin_acoes_movimento a ' +
                      ' SET f.vl_entrada = Round(:NovoValor,2)              ' +
                      ' WHERE f.cd_acao = a.cd_acao AND            ' +
                      '       f.cd_mensalidade = :CdMensalidade AND ' +
                      '       a.cd_tipo_acao = 4  AND f.nr_sequencia = 1 ';

              if qAtualiza.Connection.Protocol = 'oracle' then //Oracle
              begin
                  qAtualiza.SQL.Text := ' MERGE INTO fin_mov_cr f USING ' +
                                        '    (SELECT f.CD_MENSALIDADE, f.CD_COLIGADA, ' +
                                        '            f.NR_SEQUENCIA, :NovoValor as vl_entrada ' +
                                        '     FROM fin_mov_cr f, fin_acoes_movimento A ' +
                                        '     WHERE f.cd_acao = A.cd_acao AND f.cd_mensalidade = :CdMensalidade ' +
                                        '           AND A.cd_tipo_acao = 4 AND f.nr_sequencia = 1) f2 ON ' +
                                        '     (f.CD_MENSALIDADE = f2.CD_MENSALIDADE AND ' +
                                        '      f.CD_COLIGADA = f2.CD_COLIGADA AND ' +
                                        '      f.NR_SEQUENCIA = f2.NR_SEQUENCIA) ' +
                                        ' WHEN MATCHED THEN ' +
                                        '    UPDATE SET f.vl_entrada = f2.vl_entrada ';
              end;

              // Ação Tipo = 4 => Geração de Títulos;
              qAtualiza.ParamByName('CdMensalidade').AsInteger := FieldByName('cd_mensalidade').AsInteger;

              vlEntrada := FloatToStr(NovoValor + FieldByName('valorextra').AsFloat);
              vlEntrada := StringReplace(vlEntrada, ',', '.', [] );

              qAtualiza.ParamByName('NovoValor').AsString    := vlEntrada;
              qAtualiza.ExecSQL();

              // Atualizar Movimento de Desconto Condicional
              DM.recalcularDescCondicionalAcoesMovimento(FieldByName('cd_mensalidade').AsInteger, FieldByName('valordesconto').AsFloat, NovoDesconto, false, true);

              //Busca valor de entrada da movimentação
              cValorEntrada := Self.getValorEntradaAcaoMensalidade(FieldByName('cd_mensalidade').AsInteger);
              {
              Retirado pois já foi atualizado acima
              
              Stmt := PrepareStatement(SSQLUpdateMovCR);
              try
                 Stmt.SetDouble(1, NovoDescExtra);
                 Stmt.SetDouble(2, FieldByName('descontoextra').AsFloat);
                 Stmt.SetDouble(3, NovoDescExtra);
                 Stmt.SetDouble(4, cValorEntrada);
                 Stmt.SetDouble(5, NovoDescExtra);
                 Stmt.SetDouble(6, cValorEntrada);
                 Stmt.SetInt(7, FieldByName('cd_mensalidade').AsInteger);
                 Stmt.ExecutePrepared;
              finally
                 Stmt.Close;
                 Stmt := nil;
              end;
              }
           end;

           Next();
        end;
      end;

      // TERMINO AJUSTES DE VALORES NAS PARCELAS PENDENTES
  end;

  FreeAndNIl(qSel);
  FreeAndNil(qAtualiza);

  if bAjustou AND avisar then
  begin
     Mensagem('O procedimento executado efetuou alterações no financeiro do estudante.', 'Atenção', MB_OK + MB_ICONINFORMATION );
     Result := ProcedimentoExecutado;
  end;

end;

procedure TDM.Gerar_Series_Conclusao(intCodigoAluno : integer; strCurso : String; intAnosemestre : integer; turma: String = '');
const
   SSQLConclusaoCurso =
      'SELECT '+
	      'c.GRAU, '+
	      'c.DESCRICAO, '+
      	'cc.NR_SERIES, '+
      	'co.nm_coligada, '+
      	'm.ds_municipio, '+
      	'e.ds_uf, '+
      	'd.cd_instituicao '+
      'FROM '+
      	'cursos c '+
      'INNER JOIN cursos_coligadas cc ON (cc.CD_CURSO = c.CD_CURSO) '+
      'INNER JOIN coligadas co ON (co.cd_coligada = cc.CD_COLIGADA) '+
      'INNER JOIN turmas t ON (t.curso = c.CD_CURSO AND t.anosemestre = c.ANOSEMESTRE AND t.cd_coligada = cc.CD_COLIGADA) '+
      'LEFT JOIN municipios m ON (m.cd_municipio = co.cd_municipio) '+
      'LEFT JOIN estados e ON (m.cd_estado = e.cd_mec) '+
      'LEFT JOIN departamentos d ON (d.cd_coligada = co.cd_coligada) '+
      'WHERE '+
      	'c.GRAU IN (1, 2, 3) '+
      	'AND c.CODIGO = :codigo '+
      	'AND c.ANOSEMESTRE = :anosemestre '+
      	'AND t.codigo = :turma '+
        'AND t.serie = c.NUMERODESERIES '+
      'GROUP BY '+
      	'c.CD_CURSO';

   SSQLSearchInst =
      'SELECT DISTINCT ' +
         'M.ANOSEMESTRE,' +
         'M.CODIGOALUNO,' +
         'T.SERIE,' +
         'C.NR_GRAU,' +
         'I.NM_INSTITUICAO,' +
         'I.DS_CIDADE,' +
         'I.DS_ESTADO,' +
         'I.CD_INSTITUICAO,' +
         'MONTH(T.DATAINICIO) MES_INICIO,' +
         'MONTH(T.DATAFIM) MES_FIM,' +
         'YEAR(T.DATAINICIO) ANO_INICIO,' +
         'YEAR(T.DATAFIM) ANO_FIM ' +
      'FROM ' +
         'DEPARTAMENTOS D ' +
            'JOIN INSTITUICOES_ENSINO I ON ' +
               '(D.CD_INSTITUICAO = I.CD_INSTITUICAO) ' +
            'JOIN CURSOS_COLIGADAS CC ON ' +
               '(D.CODIGO = CC.CD_DEPTO) ' +
               'JOIN CURSOS_MESTRE C ON ' +
                  '(CC.CD_CURSO = C.CD_CURSO) ' +
               'JOIN TURMAS T ON ' +
                  '(CC.CD_CURSO = T.CURSO) AND ' +
                  '(CC.CD_COLIGADA = T.CD_COLIGADA) ' +
                  'JOIN MATRICULAS M ON ' +
                     '(T.CODIGO = M.TURMA) AND ' +
                     '(T.ANOSEMESTRE = M.ANOSEMESTRE) ' +
                  'JOIN SITUACAO S ON ( S.CD_SITUACAO = M.SITUACAO ) ' +
      'WHERE ' +
         'CC.SN_ATIVO = 1 AND ' +
         'M.CODIGOALUNO = ? AND ' +
         'M.CURSO = ? AND ' +
         'M.ANOSEMESTRE = ? AND ' +
         '(S.CD_SITUACAO_PAI = 0 OR ' +
         'S.CD_SITUACAO_PAI = ?) ' +
      'ORDER BY ' +
         'S.CD_SITUACAO_PAI DESC';

   SSQLSearchSeries =
      'SELECT DISTINCT ' +
         'M.ANOSEMESTRE,' +
         'M.CODIGOALUNO,' +
         'C.NR_GRAU,' +
         'COALESCE(CC.NR_SERIES, 0) NR_SERIES, '+
         'month(datainicio) as mesInicio, month(datafim) as mesFim, year(datainicio) as anoInicio, year(datafim) as anoFim '+
      'FROM ' +
         'CURSOS_MESTRE C ' +
            'JOIN CURSOS_COLIGADAS CC ON ' +
               '(C.CD_CURSO = CC.CD_CURSO) ' +
               'JOIN TURMAS T ON ' +
                  '(T.CURSO = CC.CD_CURSO) AND ' +
                  '(T.CD_COLIGADA = CC.CD_COLIGADA) ' +
                  'JOIN MATRICULAS M ON ' +
                     '(C.CD_CURSO = M.CURSO) AND ' +
                     '(T.ANOSEMESTRE = M.ANOSEMESTRE) AND ' +
                     '(T.CODIGO = M.TURMA) ' +
      'WHERE ' +
         'CC.SN_ATIVO = 1 AND ' +
         'M.CODIGOALUNO = ? AND ' +
         'C.CD_CURSO = ? ' +
      'ORDER BY ' +
         'M.ANOSEMESTRE DESC';

   SSQLInsHist =
      'INSERT IGNORE INTO HISTORICO_ESCOLAS_SERIES (' +
         'CODIGOALUNO, ' +
         'GRAU, ' +
         'SERIE, ' +
         'ANO, ' +
         'DS_ESCOLA, ' +
         'DS_ESCOLA_CIDADE, ' +
         'DS_ESCOLA_ESTADO' +
      ') ' +
      'VALUES (?, ?, ?, 0, '''', '''', '''')';

   SSQLHistConcluido =
      'SELECT * FROM historico_escolas_grau WHERE codigoaluno = :codigoaluno AND grau = :grau';

   SSQLVerificarSerieInserida =
      'SELECT COUNT(*) nr_encontrado FROM historico_escolas_series WHERE codigoaluno = :codigoaluno AND grau = :grau AND serie = :serie';

   SSQLAprovado = 'SELECT m.codigoaluno FROM matriculas m '+
                  'INNER JOIN situacao s ON (m.situacao = s.cd_situacao) WHERE codigoaluno = :codigoaluno AND anosemestre = :anosemestre '+
                  'AND s.ds_sigla_situacao IN( ''APRO'', ''CONC'' )';
var
   I: Integer;
   Statement: IZPreparedStatement;
   ResultSet: IZResultSet;
   HasRecords: Boolean;
   qryInsereConclusao, qryConclusaoCurso, qryConcluido, qryAprovado, qryExcluiConclusao, qryVerificaSerieInserida: TUMZQuery;
   situacao: Integer;
   removerHistorico: Boolean;
begin

   DM.CriarConsulta(qryConclusaoCurso);
   qryConclusaoCurso.SQL.Text := SSQLConclusaoCurso;
   qryConclusaoCurso.ParamByName('codigo').AsString         := strCurso;
   qryConclusaoCurso.ParamByName('anosemestre').AsInteger   := intAnosemestre;
   qryConclusaoCurso.ParamByName('turma').AsString          := turma;
   qryConclusaoCurso.Open;

   {Verifica se o GRAU do curso é Ensino Medio ou Ensino Fundamental}
   if qryConclusaoCurso.RecordCount > 0 then
   begin

      {Busca se aluno ja não possui um histório de concluido para este tipo de curso}
      DM.CriarConsulta(qryConcluido);
      qryConcluido.SQL.Text := SSQLHistConcluido;
      qryConcluido.ParamByName('codigoaluno').AsInteger  := intCodigoAluno;
      qryConcluido.ParamByName('grau').AsInteger         := qryConclusaoCurso.FieldByName('GRAU').AsInteger;
      qryConcluido.Open;

      {Busca se o aluno possui matrícula concluida ou aprovada}
      DM.CriarConsulta(qryAprovado);
      qryAprovado.SQL.Text := SSQLAprovado;
      qryAprovado.ParamByName('codigoaluno').AsInteger   := intCodigoAluno;
      qryAprovado.ParamByName('anosemestre').AsInteger   := intAnosemestre;
      qryAprovado.Open;

      if (qryConclusaoCurso.RecordCount > 0) AND (qryConcluido.RecordCount = 0) AND (qryAprovado.RecordCount > 0)  then
      begin
      
         {Insere o histórico de conclusão de curso}
         DM.CriarConsulta(qryInsereConclusao);
         qryInsereConclusao.SQL.Text := 'INSERT INTO historico_escolas_grau(CODIGOALUNO, GRAU, ANO, DS_ESCOLA, DS_ESCOLA_CIDADE, DS_ESCOLA_ESTADO, DS_CURSO, CD_INSTITUICAO, SN_AUTOMATICO, NR_MES_CONCLUSAO)'+
            'VALUES(:cd_aluno, :grau, YEAR(NOW()), :ds_escola, :ds_escola_cidade, :ds_escola_estado, :ds_curso, :cd_instituicao, 1, MONTH(CURRENT_DATE()))';
         qryInsereConclusao.ParamByName('cd_aluno').AsInteger        := intCodigoAluno;
         qryInsereConclusao.ParamByName('grau').AsInteger            := qryConclusaoCurso.FieldByName('GRAU').AsInteger;
         qryInsereConclusao.ParamByName('ds_escola').AsString        := qryConclusaoCurso.FieldByName('nm_coligada').AsString;
         qryInsereConclusao.ParamByName('ds_escola_cidade').AsString := qryConclusaoCurso.FieldByName('ds_municipio').AsString;
         qryInsereConclusao.ParamByName('ds_escola_estado').AsString := qryConclusaoCurso.FieldByName('ds_uf').AsString;
         qryInsereConclusao.ParamByName('ds_curso').AsString         := qryConclusaoCurso.FieldByName('DESCRICAO').AsString;
         qryInsereConclusao.ParamByName('cd_instituicao').AsInteger  := qryConclusaoCurso.FieldByName('cd_instituicao').AsInteger;
         qryInsereConclusao.ExecSQL;
         
      end
      else
      begin
         if (qryConcluido.RecordCount > 0) AND (qryAprovado.RecordCount = 0) AND (qryConclusaoCurso.RecordCount > 0) then
         begin
            DM.CriarConsulta(qryExcluiConclusao);
            qryExcluiConclusao.SQL.Text := 'DELETE FROM historico_escolas_grau WHERE codigoaluno = :codigoaluno AND grau = :grau AND sn_automatico = 1';
            qryExcluiConclusao.ParamByName('codigoaluno').AsInteger  := intCodigoAluno;
            qryExcluiConclusao.ParamByName('grau').AsInteger         := qryConclusaoCurso.FieldByName('GRAU').AsInteger;
            qryExcluiConclusao.ExecSQL;            
         end;
      end;
   end;
   
   Statement := PrepareStatement(SSQLSearchInst);
   try
      Statement.SetInt(1, intCodigoAluno);
      Statement.SetString(2, strCurso);
      Statement.SetInt(3, intAnosemestre);

      // Verifica se o parâmetro para gerar histórico para alunos reprovados
      // está habilitado e então filtrar a situação nove também
      situacao := 0;
      if variavel_parametro('academico_historico_series_reprovado') = 'S' then
      begin
         situacao := 9;
      end;
      Statement.SetInt(4, situacao);

      ResultSet := Statement.ExecuteQueryPrepared;
      try
         HasRecords := False;
         while ResultSet.Next do
         begin
            HasRecords := True;
            removerHistorico := false;

            //verifica se ja existe a insituição mas com registro vazio
            qryBuscaHistorico.Close();
            qryBuscaHistorico.ParamByName('CODIGOALUNO').AsInteger := intCodigoAluno;
            qryBuscaHistorico.ParamByName('GRAU').AsInteger := ResultSet.GetInt(4);
            qryBuscaHistorico.ParamByName('SERIE').AsInteger := ResultSet.GetInt(3);
            qryBuscaHistorico.Open;

            if (qryBuscaHistorico.IsEmpty = false) then
            begin
               while not qryBuscaHistorico.Eof do
               begin
                  //se existe e é vazio exclui
                  if(qryBuscaHistorico.FieldByName('ds_escola').IsNull) OR (qryBuscaHistorico.FieldByName('ds_escola').AsString = '') THEN
                  begin
                     removerHistorico := true;
                     break;
                  end;
                  qryBuscaHistorico.Next;
               end;
               
               if (removerHistorico = true) then
               begin
                  qryDeletaHistorico.Close;
                  qryDeletaHistorico.ParamByName('CODIGOALUNO').AsInteger := intCodigoAluno;
                  qryDeletaHistorico.ParamByName('GRAU').AsInteger := ResultSet.GetInt(4);
                  qryDeletaHistorico.ParamByName('SERIE').AsInteger := ResultSet.GetInt(3);
                  qryDeletaHistorico.ExecSQL;
               end;
            end;

            qryInsertHist.ParamByName('CODIGOALUNO').AsInteger := intCodigoAluno;
            qryInsertHist.ParamByName('GRAU').AsInteger := ResultSet.GetInt(4);
            qryInsertHist.ParamByName('SERIE').AsInteger := ResultSet.GetInt(3);

            // Verifica parâmetro para definir se deve salvar
            // apenas o ano ou o ano/semestre completo
            if variavel_parametro('academico_historico_semestre') = 'S' then
            begin
               qryInsertHist.ParamByName('ANO').AsString :=  ResultSet.GetString(1)
            end
            else
            begin
               qryInsertHist.ParamByName('ANO').AsString := LeftStr(ResultSet.GetString(1), 4)
            end;

            qryInsertHist.ParamByName('DS_ESCOLA').AsString := ResultSet.GetString(5);
            qryInsertHist.ParamByName('DS_CIDADE').AsString := ResultSet.GetString(6);
            qryInsertHist.ParamByName('DS_ESTADO').AsString := ResultSet.GetString(7);
            qryInsertHist.ParamByName('CD_INSTITUICAO').AsInteger := ResultSet.GetInt(8);
            qryInsertHist.ParamByName('NR_MES_INICIO').AsInteger := ResultSet.GetInt(9);
            qryInsertHist.ParamByName('NR_MES_CONCLUSAO').AsInteger := ResultSet.GetInt(10);
            qryInsertHist.ParamByName('NR_ANO_INICIO').AsInteger := ResultSet.GetInt(11);
            qryInsertHist.ExecSQL;
         end;
      finally
         ResultSet.Close;
      end;
   finally
      Statement.Close;
   end;

   if (variavel_parametro('academico_historico_series_inserir') = 'S') then
   begin
      Statement := PrepareStatement(SSQLSearchSeries);
      try
         Statement.SetInt(1, intCodigoAluno);
         Statement.SetString(2, strCurso);
         ResultSet := Statement.ExecuteQueryPrepared;
         try
            if ResultSet.Next then
            begin
               Statement := PrepareStatement(SSQLInsHist);
               try
                  Statement.SetInt(1, intCodigoAluno);
                  Statement.SetInt(2, ResultSet.GetInt(3));

                  DM.CriarConsulta(qryVerificaSerieInserida);

                  for I := 1 to ResultSet.GetInt(4) do
                  begin
                  
                     // Verifica se já existe o registro aluno/grau/serie inserido na historico_escolas_series
                     qryVerificaSerieInserida.Close;
                     qryVerificaSerieInserida.SQL.Text := SSQLVerificarSerieInserida;
                     qryVerificaSerieInserida.ParamByName('codigoaluno').AsInteger := intCodigoAluno;
                     qryVerificaSerieInserida.ParamByName('serie').AsInteger       := I;
                     qryVerificaSerieInserida.ParamByName('grau').AsInteger        := ResultSet.GetInt(3);
                     qryVerificaSerieInserida.Open;

                     // Somente insere a série se ela NÃO foi encontrada
                     if not(qryVerificaSerieInserida.FieldByName('nr_encontrado').AsInteger > 0) then
                     begin

                       Statement.SetInt(3, I);

                       try
                          Statement.ExecutePrepared;
                       except
                          on E: EZSQLException do Continue;
                       end;

                     end;

                  end;
               finally
                  Statement.Close;
               end;
            end;
         finally
            ResultSet.Close;
         end;
      finally
      end;
   end;
End;

{ **
   Este método gera as parcelas para solicitação do exame de recorrência para as
   disciplinas nas quais o aluno ficou em segunda época.
}
procedure TDM.GeraTaxaExameRecorrencia(const AICodAluno, AIAnoSemestre: integer;
  const ASCodTurma: string);
const
   S_HISTORICO_TITULO = 'Disciplina de %s';
var
   LICodMensalidade: integer;
begin
   // Pega as disciplinas nas quais o aluno ficou em segunda época
   bExameRecorrencia:=true;
   qryTaxaRecorrencia.Close;
   qryTaxaRecorrencia.ParamByName('cd_turma').AsString := ASCodTurma;
   qryTaxaRecorrencia.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;
   qryTaxaRecorrencia.ParamByName('cd_pessoa').AsInteger := AICodAluno;
   qryTaxaRecorrencia.Open;
   try
      if not qryTaxaRecorrencia.IsEmpty then
         // Para cada disciplina encontrada...
         while not qryTaxaRecorrencia.Eof do
         begin
            // Gera a parcela para o exame de recorrência
            LICodMensalidade := 
               GerarMensalidade(
                  AICodAluno, qryTaxaRecorrencianr_parcela.AsInteger,
                  ASCodTurma, qryTaxaRecorrenciavl_padrao.AsCurrency, 0.0,
                  AIAnoSemestre, qryTaxaRecorrenciadt_vencto.AsDateTime,
                  qryTaxaRecorrenciadt_vencto.AsDateTime, 10,
                  qryTaxaRecorrenciacurso.AsString,
                  qryTaxaRecorrenciadepto.AsInteger, 0, -1, 0, 0,
                  Format(S_HISTORICO_TITULO, [qryTaxaRecorrenciadescricao.AsString]),
                  qryTaxaRecorrenciacd_tipo_titulo.AsInteger,
                  qryTaxaRecorrenciacd_conta.AsInteger,
                  qryTaxaRecorrenciacd_centro.AsInteger);
            // Define o código da mensalidade gerada para a disciplina na tabela fichaindividual
            qryUpdFichaIndividual.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;
            qryUpdFichaIndividual.ParamByName('cd_turma').AsString := ASCodTurma;
            qryUpdFichaIndividual.ParamByName('codigograde').AsString := qryTaxaRecorrenciacodigograde.AsString;
            qryUpdFichaIndividual.ParamByName('cd_disciplina').AsInteger := qryTaxaRecorrenciadisciplina.AsInteger;
            qryUpdFichaIndividual.ParamByName('cd_pessoa').AsInteger := AICodAluno;
            qryUpdFichaIndividual.ParamByName('cd_mensalidade_exame').AsInteger := LICodMensalidade;
            qryUpdFichaIndividual.ExecSQL;
            qryTaxaRecorrencia.Next;
         end;
   finally
      qryTaxaRecorrencia.Close;
   end;
end;

function TDM.GetAnoSemestreAtual: integer;
var
   LSAnoSemestre: string;
   LWAno, LWMes, LWDia: Word;
begin
   if UsaAnosemestre then
   begin
      DecodeDate(Now, LWAno, LWMes, LWDia);
      if (LWMes > 6) and (ano_semestre_incremento = 1) then
      begin
         LSAnoSemestre := Format('%d%d', [LWAno, 2]);
      end
      else
      begin
         LSAnoSemestre := Format('%d%d', [LWAno, 1]);
      end;
      Result := StrToInt(LSAnoSemestre);
   end
   else
      Result := 1;
end;

function TDM.GetArrayColigadasUsuario: TStringList;
var
   ListaColigadasFilhas : TListaColigadas;
   I : Integer;
   Coligada : TColigada;
begin
   ListaColigadasFilhas := TColigadaMatriz(
      UsuarioLogado.ListaColigadasPai[ DM.UsuarioLogado.ListaColigadasPai.IndexOf( DM.UsuarioLogado.ColigadaLogada ) ]
   ).ListaColigadasFilhas;

   Result := TStringList.Create;
   for I := 0 to ListaColigadasFilhas.Count - 1 do
   begin
      Coligada := TColigada( ListaColigadasFilhas.Items[ I ] );

      Result.AddObject(Coligada.Nome, TItemCombo.Create( IntToStr(Coligada.Codigo), Coligada.Nome, '0' ));
   end;
end;

procedure TDM.getArraysFilhosSinteticos(cd_centro: Integer;
   var arrFilhosSinteticos: TList; tesouraria: Boolean);
var
   qryBuscaCentro: TUMZReadOnlyQuery;

   objApropriacao: TFinApropriaCP;
   objApropriacaoTesouraria: TFinApropriaTesouraria;

const
   SQL_BUSCA_CENTRO =
      ' SELECT '+
      ' 	fccc.cd_centro, '+
      ' 	fccc.tp_centro, '+
      ' 	(SELECT count(cd_centro) FROM fin_config_centro_custos WHERE cd_centro_pai = fccc.cd_centro) AS numero_filhos '+
      ' FROM '+
      ' 	fin_config_centro_custos AS fccc '+
      ' WHERE '+
      ' 	fccc.cd_centro_pai = :cd_centro AND fccc.sn_ativo = 1 AND cd_coligada_matriz = :cd_coligada_matriz ';

begin

   DM.CriarConsulta(qryBuscaCentro);

   qryBuscaCentro.SQL.Text := SQL_BUSCA_CENTRO;
   qryBuscaCentro.ParamByName('cd_centro').AsInteger := cd_centro;
   qryBuscaCentro.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
   qryBuscaCentro.Open;

   while not qryBuscaCentro.Eof do
   begin
      if qryBuscaCentro.FieldByName('numero_filhos').AsInteger > 0 then
      begin
         getArraysFilhosSinteticos(
            qryBuscaCentro.FieldByName('cd_centro').AsInteger,
            arrFilhosSinteticos,
            tesouraria
         );
      end;

      // Se o centro de custo não possui nenhum filho (em regra todo centro analítico,
      // deveria ser o ultimo da árvore hierarquica) e também verifica se é um
      // centro analítico
      if (qryBuscaCentro.FieldByName('numero_filhos').AsInteger = 0) and
         (qryBuscaCentro.FieldByName('tp_centro').AsInteger = 1) then
      begin

         if tesouraria then
         begin
            objApropriacaoTesouraria := TFinApropriaTesouraria.Create();

            objApropriacaoTesouraria.setValorCampo(
               'cd_centro',
               qryBuscaCentro.FieldByName('cd_centro').AsString
            );

            arrFilhosSinteticos.Add(objApropriacaoTesouraria);
         end
         else
         begin
            objApropriacao := TFinApropriaCP.Create;

            objApropriacao.setValorCampo(
               'cd_centro',
               qryBuscaCentro.FieldByName('cd_centro').AsString
            );

            arrFilhosSinteticos.Add(objApropriacao);
         end;


      end;

      qryBuscaCentro.Next;
   end;
end;

function TDM.GetCdPessoaLogado: Integer;
begin
   Result := DM.UsuarioLogado.Pessoa.Codigo;
end;

function TDM.GetColigadas: String;
begin
   Result := UsuarioLogado.GetColigadasFilhaSelecionada();
end;

function TDM.GetTodasColigadas: String;
begin
   Result := UsuarioLogado.GetColigadasFilhaSelecionada();
end;

function TDM.GetUnimestreINI: TIniFile;
begin
   Result := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');;
end;

function TDM.GetUserSetting(const Key, Module, Default: AnsiString): AnsiString;
const
   SSQLSelectSetting = 'SELECT P.`DS_VALOR` FROM `NU_PESSOAS_PREF` P JOIN `NU_MODULOS` M ON (P.`CD_MODULO` = M.`CD_MODULO`) WHERE P.`DS_CHAVE` = ? AND M.`DS_CHAVE` = ? AND P.`CD_PESSOA` = ?';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Stmt := db.DbcConnection.PrepareStatement(SSQLSelectSetting);
   try
      Stmt.SetString(1, Key);
      Stmt.SetString(2, Module);
      stmt.SetInt(3, UsuarioLogado.Pessoa.Codigo);

      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := Rs.GetString(1)
         else
            Result := Default;
      finally
         Rs.Close;
      end;

   finally
      Stmt.Close;
   end;
end;

function TDM.getValorEntradaAcaoMensalidade(cd_mensalidade: Integer): Double;
const
   SQL_GET_VALOR_ENTRADA =
    'SELECT sum(mcr.vl_entrada) as entrada '+
    'FROM fin_mov_cr mcr '+
    'INNER JOIN fin_acoes_movimento am ON (mcr.cd_acao = am.cd_acao) '+
    'WHERE mcr.vl_entrada > 0 AND mcr.cd_mensalidade = :mensalidade AND AM.cd_tipo_acao = 4 ';
var
   qyGetEntrada: TUMZQuery;
   cValorEntrada: Double;
begin
   Dm.CriarConsulta(qyGetEntrada);
   cValorEntrada := 0;

   qyGetEntrada.SQL.Text := SQL_GET_VALOR_ENTRADA;
   qyGetEntrada.ParamByName('mensalidade').AsInteger := cd_mensalidade;
   qyGetEntrada.Open;
   
   cValorEntrada := qyGetEntrada.FieldByName('entrada').AsFloat;

   qyGetEntrada.Close;
   result := cValorEntrada;
end;

function TDM.GetLoginLogado: String;
begin
   Result := UpperCase(UsuarioLogado.Pessoa.Login);
end;

function TDM.getColigadaTurma(STurma: String; iAnoSem: Integer): Integer;
var
  qyBuscaTurma: TUMZQuery;
begin
  if sTurma = '' then
  begin
     result := 0;
  end
  else
  begin
     CriarConsulta(qyBuscaTurma);

     qyBuscaTurma.SQL.Text := 'SELECT cd_coligada FROM turmas WHERE codigo = :turma ORDER BY (anosemestre = :anosemestre) DESC, anosemestre desc';
     qyBuscaTurma.ParamByName('turma').AsString := sTurma;
     qyBuscaTurma.ParamByName('anosemestre').asInteger := iAnoSem;
     qyBuscaTurma.Open();

     result:=  qyBuscaTurma.FieldByName('cd_coligada').AsInteger;
     FreeAndNil(qyBuscaTurma);
  end;
end;

function TDM.getColigadaUnica: string;
var
   qryCountColigada : TUMZQuery;
begin
   CriarConsulta(qryCountColigada);
   qryCountColigada.SQL.Text :=
   'SELECT                          '+
   '  count(cd_coligada) as total   '+
   'FROM                            '+
   '  COLIGADAS                     ';
   qryCountColigada.open;
   if qryCountColigada.FieldByName('total').AsInteger = 1 then
   begin
      qryCountColigada.SQL.Text :=
      'SELECT                          '+
      '  cd_coligada as coligada       '+
      'FROM                            '+
      '  COLIGADAS                     ';
      qryCountColigada.open;
      Result := qryCountColigada.FieldByName('coligada').AsString;
   end
   else
      Result := '';
   qryCountColigada.Free;
end;

function TDM.GetContaBoleto(iDepto: Integer; sTurma: String;
  iAnoSemestre: Integer): Integer;
var
  lngAux : Longint;
  strAux : String;
  qyNN : TUMZQuery;
begin

    Dm.CriarConsulta(qyNN);
    qyNN.Close();

    // Pesquisar a conta a partir do cd_caixa no cadastro de turmas
    qyNN.SQL.Text :=
      ' SELECT fcc.cd_caixa, fcc.ds_nn_prefixo, fcc.nr_nn_ultimo FROM fin_cadastro_contas fcc ' +
      ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa) ' +
      ' WHERE t.codigo = ' + QuotedStr(sTurma) + ' AND t.anosemestre = ' + IntToStr(iAnoSemestre);
    qyNN.Open();

    if not qyNN.Eof then begin

       result := qyNN.FieldByName('cd_caixa').AsInteger;
    
    end else begin  // Pesquisar a conta a partir do cd_bloqueto_padrao nos departamentos
       qyNN.Close();
       qyNN.SQL.Text :=
        ' SELECT fcc.cd_caixa, fcc.ds_nn_prefixo, fcc.nr_nn_ultimo FROM fin_cadastro_contas fcc ' +
        ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao) ' +
        ' WHERE d.codigo = ' + IntToStr(iDepto);
        qyNN.Open();

        if not qyNN.Eof then begin

           result := qyNN.FieldByName('cd_caixa').AsInteger;
    
        end else begin

           result := 0;

        end
    end;

    FreeAndNil(qyNN);

end;


procedure TDM.gerar_log(tipo: integer; msg: string; usuario: integer; chaves : string);
Var
   qyLog : TUMZQuery;
begin
{
Função para Gerar um registro de Log
tipo =
1 - Alteração de Créditos de Mensalidades;
2 - Exclusão de mensalidade;
3 - Exclusão de matrícula;

}

   try
      DM.CriarConsulta(qyLog);

      qyLog.Close;
      qyLog.SQL.Clear;
      qyLog.SQL.Add('INSERT INTO LOGS (cd_tipo, dt_log, ds_log, cd_usuario, cd_chave) ');
      qyLog.SQL.Add('VALUES (:tipo, NOW(), :msg, :cd_usuario, :cd_chave)');

      qyLog.ParamByName('tipo').AsInteger := tipo;
      qyLog.ParamByName('msg').AsString := msg;
      qyLog.ParamByName('cd_usuario').AsInteger := usuario;
      qyLog.ParamByName('cd_chave').AsString := chaves;
      qyLog.execsql;
   finally
      qyLog.Free;
   end;
end;

function TDM.Ativar_Matricula(p_intCodigoAluno: integer; p_strTurma: string;
  p_intAnoSemestre: integer; forcar_ativacao : boolean = false; turma_especifica : boolean = false): Word;
  {
  FDES= Verifica a entrega da documentação necessária e pagamento das parcelas configuradas
        para Ativação da Matricula do Aluno;
  FRET= 0 = sem bloqueio >> matrícula ativada;
        1 = bloqueio financeiro >> matrícula não ativada;
        2 = bloqueio de documentação >> matrícula não ativada
        3 = Bloqueio financeiro e documentação
  FPAR= intCodigoAluno -> Código do aluno
        strTurma -> Turma de Matrícula do Aluno
        intAnoSemestre -> AnoSemestre da Matrícula;
  FAUT= Claudionor
  FREV= 30/10/2007
  }
Var
  intCodigoAluno : Integer;
  strTurma : String;
  intAnoSemestre : integer;
  qyVerifica : TUMZQuery;
  qyMatriculas : TUMZQuery;
  iColigada : Integer;
  bFinanceiro : Boolean;
  bDocumento : Boolean;

  lstGrupo_Apresentou, lstGrupo_NaoApresentou : TStringList;
  i : word;

begin

  CriarConsulta(qyVerifica);
  CriarConsulta(qyMatriculas);

  // Verificar se a matrícula está em RESERVA
  qyMatriculas.Close();
  qyMatriculas.SQL.Text := 'SELECT codigoaluno, turma, anosemestre, cd_matricula_curso  FROM matriculas ' +
   ' WHERE codigoaluno = :codigoaluno  ' +
   '   AND situacao = 10 ';
  qyMatriculas.ParamByName('codigoaluno').AsInteger := p_intCodigoAluno;

  if turma_especifica then begin
     // se for forcada, fazer só para a turma em questão
     qyMatriculas.SQL.Add(' AND turma = :turma ');
     qyMatriculas.SQL.Add(' AND anosemestre = :anosemestre ');
     qyMatriculas.ParamByName('anosemestre').AsInteger := p_intAnoSemestre;
     qyMatriculas.ParamByName('turma').AsString := p_strTurma;
  end;

  // Tentar ativar todas as matriculs em reserva do cara
  //  qyVerifica.ParamByName('turma').AsString := strTurma;
  //  qyVerifica.ParamByName('anosemestre').AsInteger := intAnoSemestre;

  qyMatriculas.Open();

  if qyMatriculas.RecordCount <= 0 then begin
     // Não está na reserva, pode finalizar.
     FreeAndNil(qyVerifica);
     FreeAndNil(qyMatriculas);
     Exit;
  end;

  while not qyMatriculas.EOF do begin

      bFinanceiro := true;
      bDocumento := false;

      intAnoSemestre := qyMatriculas.FieldByName('anosemestre').AsInteger ;
      strTurma :=  qyMatriculas.FieldByName('turma').AsString;
      intCodigoAluno := p_intCodigoAluno;

      // V E R I F I C A R   P E N D E N C I A S   F I N A N C E I R A S

      // 1) Verificar a existência do parametro "matricula_condicao_forcar_ativacao"

      if not forcar_ativacao then begin

          if DM.variavel_parametro('matricula_condicao_forcar_ativacao') <> '' then begin

             qyVerifica.Close();
             qyVerifica.SQL.Text := DM.variavel_parametro('matricula_condicao_forcar_ativacao');

             // Verificar se é necessário preencher o parametro cd_pessoa
             if not (qyVerifica.Params.FindParam('cd_pessoa') = nil) then begin
                qyVerifica.ParamByName('cd_pessoa').AsInteger := intCodigoAluno;
             end;

             // Verificar se é necessário preencher o parametro cd_turma
             if not (qyVerifica.Params.FindParam('cd_turma') = nil) then begin
                qyVerifica.ParamByName('cd_turma').AsString := strTurma;
             end;

             // Verificar se é necessário preencher o parametro nr_anosem
             if not (qyVerifica.Params.FindParam('nr_anosem') = nil) then begin
                qyVerifica.ParamByName('nr_anosem').AsInteger := intAnoSemestre;
             end;

             qyVerifica.Open();

             if qyVerifica.Fields[0].AsInteger > 0 then begin
                // Retornou positivo, pode ATIVAR A matrícula sem verificar outras situações financeiras;

                bFinanceiro := false;

             end;

          end;

          // 2) Verificar a existência do parametro "matricula_condicao_bloquear"
          if (bFinanceiro) AND (Dm.variavel_parametro('matricula_condicao_bloquear') <> '') then begin

             qyVerifica.Close();
             qyVerifica.SQL.Text := DM.variavel_parametro('matricula_condicao_bloquear');

             // Verificar se é necessário preencher o parametro cd_pessoa
             if not (qyVerifica.Params.FindParam('cd_pessoa') = nil) then begin
                qyVerifica.ParamByName('cd_pessoa').AsInteger := intCodigoAluno;
             end;

             // Verificar se é necessário preencher o parametro cd_turma
             if not (qyVerifica.Params.FindParam('cd_turma') = nil) then begin
                qyVerifica.ParamByName('cd_turma').AsString := strTurma;
             end;

             // Verificar se é necessário preencher o parametro nr_anosem
             if not (qyVerifica.Params.FindParam('nr_anosem') = nil) then begin
                qyVerifica.ParamByName('nr_anosem').AsInteger := intAnoSemestre;
             end;

             qyVerifica.Open();

             if qyVerifica.Fields[0].AsInteger > 0 then begin
                // Retornou positivo, pode ATIVAR A matrícula sem verificar outras situações financeiras;

                bFinanceiro := false;

             end else begin

                // Não ativar: Bloqueio Financeiro

                bFinanceiro := true;

             end;


          end;
      end else begin
  
        bFinanceiro := false;

      end;


      if not forcar_ativacao then begin

          // V E R I F I C A R   P E N D E N C I A S   E M   D O C U M E N T A C A O

          DeptoCursoTurma(intAnoSemestre, strTurma);

          // Verificar se os documentos sem grupos foram entregues
          qyVerifica.Close();
          qyVerifica.SQL.Clear();
          qyVerifica.SQL.Text := ''+
             ' SELECT                                                ' +
             '    COUNT(*) resultado                                 ' +
             ' FROM                                                  ' +
             '    documentos_necessarios dn                          ' +
             '    INNER JOIN documentos d ON (d.codigo = dn.cod_documento) ' +
             '    LEFT JOIN documentos_alunos da ON (da.cod_documento = dn.cod_documento )  '+
             '	 LEFT JOIN pessoas p ON (p.cd_pessoa = da.codigoaluno AND (d.ds_sexo = ''A'' OR d.ds_sexo = p.ds_sexo)) '+
             ' WHERE                                                          ' +
             '    da.codigoaluno = '+ IntToSTr(intCodigoAluno)+ ' and         ' +
             ' 	 dn.curso = '''+ tblDeptoCursoTurmaCurso.ASString +''' and     ' +
             '    dn.sn_obrigatorio = ''S'' and                                 ' +
             '    COALESCE(da.apresentou, ''N'') = ''N'' and                    ' +
             '    dn.nr_grupo = 0                                             ';

          qyVerifica.Open();

          if (qyVerifica.FieldByName('resultado').AsInteger > 0) then Begin

             bDocumento := true;

          end else begin
             // Verificar se pelo menos 1 documento por grupo foi apresentado

             qyVerifica.Close();
             qyVerifica.SQL.Clear();
             qyVerifica.SQL.Text := ''+
                ' SELECT                                                ' +
                '    dn.cod_documento cod_documento,                    ' +
                '    d.documento,                                       ' +
                '    dn.nr_grupo,                                       ' +
                '    COALESCE(da.apresentou, ''N'') apresentou              ' +
                ' FROM                                                  ' +
                '    documentos_necessarios dn                          ' +
                '    INNER JOIN documentos d ON (d.codigo = dn.cod_documento) ' +
                '    LEFT JOIN documentos_alunos da ON (da.cod_documento = dn.cod_documento )  '+
                '	 LEFT JOIN pessoas p ON (p.cd_pessoa = da.codigoaluno AND (d.ds_sexo = ''A'' OR d.ds_sexo = p.ds_sexo)) '+
                ' WHERE                                                          ' +
                '    da.codigoaluno = '+ IntToSTr(intCodigoAluno)+ ' and         ' +
                ' 	 dn.curso = '''+ tblDeptoCursoTurmaCurso.ASString +''' and     ' +
                '    dn.sn_obrigatorio = ''S'' and                                 ' +
                '    dn.nr_grupo <> 0                                             ';

             qyVerifica.Open();

             if not qyVerifica.EOF then Begin

                lstGrupo_Apresentou := TStringList.Create;
                lstGrupo_NaoApresentou := TStringList.Create;

                lstGrupo_Apresentou.Clear;
                lstGrupo_NaoApresentou.Clear;

                lstGrupo_Apresentou.Duplicates := dupIgnore;
                lstGrupo_NaoApresentou.Duplicates := dupIgnore;

                // Preencher as listas de documentos apresentados e não apresentados
                while not qyVerifica.Eof do Begin
                    if qyVerifica.FieldByName('apresentou').AsString = 'S' then begin
                       lstGrupo_Apresentou.Add(qyVerifica.FieldByNAme('nr_grupo').AsString);
                    end else begin
                       lstGrupo_NaoApresentou.Add(qyVerifica.FieldByNAme('nr_grupo').AsString);
                    end;

                    qyVerifica.Next();
                end;

                // Se tiver algum documento não apresentado
                if lstGrupo_NaoApresentou.Count > 0 then begin
                   // Para cada documento não apresentado, verificar se existe outro do mesmo grupo já apresentado
                   For i := 0 to lstGrupo_NaoApresentou.Count-1 do begin

                      if lstGrupo_Apresentou.IndexOf(lstGrupo_NaoApresentou.Strings[i]) < 0 then begin

                         bDocumento := True;

                      end;

                   end;

                end;

             end;

          end;
      end else begin

        bDocumento := false;

      end;

      // Verificar se houve algum bloqueio

      if (bFinanceiro OR bDocumento) then begin

         if not bFinanceiro then begin

            Result := 2;

         end else if not bDocumento then begin

            Result := 1;

         end else begin

            Result := 3;

         end;

         // Não é possível ativar
         // Não sair, porque tem outras turmas para verificar
         // FreeAndNil(qyVerifica);
         // FreeAndNil(lstGrupo_Apresentou);
         // FreeAndNil(lstGrupo_NaoApresentou);
         // Exit;
  
      end else begin

          Result := 0;

          // Nenhum bloqueio foi detectado... ativar a estudante

          // Ativar o financeiro

          qyVerifica.Close;
          qyVerifica.SQL.Clear;
          qyVerifica.SQL.Add( 'UPDATE mensalidades SET situacao = 2 where' );
          qyVerifica.SQL.Add( 'codigoaluno = ' + IntToStr(intCodigoAluno) + ' and ');
          qyVerifica.SQL.Add( 'turma = ''' + strTurma + ''' and anosemestre = ' + IntToStr(intAnoSemestre) +  ' and ' );
          qyVerifica.SQL.Add( 'situacao = 10 ' );
          qyVerifica.ExecSQL;

          //#CMD = Ativar as disciplinas em Reserva

          qyVerifica.Close;
          qyVerifica.SQL.Clear;
          qyVerifica.SQL.Add( 'UPDATE fichaIndividual SET situacao = 1' );
          qyVerifica.SQL.Add( 'WHERE anoSemestre = ' + IntToStr(intanosemestre) + ' and ');
          qyVerifica.SQL.Add( 'turmamatricula = ''' + strTurma + ''' and ');
          qyVerifica.SQL.Add( 'codigoaluno = ' + IntToStr(intCodigoAluno) + ' and ');
          qyVerifica.SQL.Add( 'situacao = 10');
          qyVerifica.ExecSQL;

          //#CMD = Ativar a matrícula do aluno

          qyVerifica.Close;
          qyVerifica.SQL.Text :=
             Format(
                'UPDATE MATRICULAS SET SITUACAO = 1, DATAEMISSAO = NOW() WHERE ' +
                'ANOSEMESTRE = %d AND TURMA = %s AND CODIGOALUNO = %d AND SITUACAO = 10',
                [intAnoSemestre, QuotedStr(strTurma), intCodigoAluno]
             );
          qyVerifica.ExecSQL;

          // Atualiza a situação da matrícula do aluno no curso
          UpdateSituacaoMatriculaCurso(1, qyMatriculas.FieldByName('cd_matricula_curso').AsInteger);

      end;

      qyMatriculas.Next();

  end; // Final do while da matricula

  iColigada := DM.getColigadaByTurma(
                        p_strTurma,
                        p_intAnoSemestre
                     );


  // atualiza os grupos
  DM.atualizarGruposPessoa(p_intCodigoAluno, iColigada, true);

  FreeAndNil(qyVerifica);
  FreeAndNil(qyMatriculas);
  FreeAndNil(lstGrupo_Apresentou);
  FreeAndNil(lstGrupo_NaoApresentou);


end;

procedure TDM.CriarConsultaDOCs(var DataSet: TUMZQuery);
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := Self.dbDocs;
   DataSet.UpdateMode := umUpdateChanged;
end;

procedure TDM.CriarUniConsulta(var DataSet: TUMZQuery);
begin
   DataSet := TUMZQuery.Create(Self);
   DataSet.Connection := db;
   // DataSet.DatabaseName := 'WMestre12';
   // DataSet.SessionName  := Dm.Session1.SessionName;
   DataSet.UpdateMode   := umUpdateChanged;
end;

function TDM.CurrDateFromDatabase: TDate;
var
   ResultSet: IZResultSet;
begin
   ResultSet := ExecuteQuery('SELECT NOW() FROM DUAL');
   try
      if ResultSet.Next then
         Result := ResultSet.GetTimeStamp(1)
      else
         Result := Now;
   finally
      ResultSet.Close;
   end;
end;

procedure TDM.TodasMaiusculas(Formulario: TForm; campoIgnorado: String = '');
var
   n : LongInt;
begin
   if variavel_parametro('sn_todas_maiusculas') = 'S' then
   begin
      for n := 0 to ( Formulario.ComponentCount - 1 ) do
      begin
         if (Formulario.Components[n].Name = campoIgnorado) then
         begin
            Continue;
         end;
         if ( Formulario.components[n].ClassType = TDBEdit ) then
         begin
            TDBEdit(Formulario.components[n]).CharCase := ecUpperCase
         end
         else if ( Formulario.components[n].ClassType = TEdit ) then
         begin
            TEdit(Formulario.components[n]).CharCase := ecUpperCase
         end
         else if ( Formulario.components[n].ClassType = TComboBox ) then
         begin
            TComboBox(Formulario.components[n]).CharCase := ecUpperCase
         end;
     end;
  end;
  
end;

procedure TDM.TodasMaiusculasFrame(Frame: TFrame);
var
  n : LongInt ;
begin

  for n := 0 to ( Frame.ComponentCount - 1 ) do
  begin
    if ( Frame.components[n].ClassType = TDBEdit ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TDBEdit(Frame.components[n]).CharCase := ecUpperCase
      else
        TDBEdit(Frame.components[n]).CharCase := ecNormal;
    end
    else if ( Frame.components[n].ClassType = TEdit ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TEdit(Frame.components[n]).CharCase := ecUpperCase
      else
        TEdit(Frame.components[n]).CharCase := ecNormal;
    end
    else if ( Frame.components[n].ClassType = TComboBox ) then
    begin
      if variavel_parametro('sn_todas_maiusculas') = 'S' then
        TComboBox(Frame.components[n]).CharCase := ecUpperCase
      else
        TComboBox(Frame.components[n]).CharCase := ecNormal;
    end;
  end ;

end;

//Esta função fará a atualização de um campo previamente selecionado pelo usuário
//Obs Já foi testado para : TComboBox , favor quem testar outros tipos de campos adicionar aqui no comentário
procedure TDM.Set_Parametro_usuario(componente : TComponent;nomeFormulario:string);
begin
 if ( componente.ClassType = TEdit )  then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   //Verifica se a conexão é Oracle ou MySQL
   if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
   begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
             IntToStr(Dm.iCdPessoaLogado)+' AS cd_usuario, ' +
             QuotedStr(nomeFormulario+'.'+TEdit(componente).Name)+' AS ds_parametro, ' +
             QuotedStr(TEdit(componente).Text)+' AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
   end else begin
      DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+intTostr(dm.iCdPessoaLogado)+','''+nomeFormulario+'.'+TEdit(componente).Name+''','''+TEdit(componente).Text+''')';
   end;
   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TMaskEdit )  then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;
   //Verifica se a conexão é Oracle ou MySQL
   if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
   begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
             intTostr(dm.iCdPessoaLogado)+' AS cd_usuario, ' +
             QuotedStr(nomeFormulario+'.'+TMaskEdit(componente).Name)+' AS ds_parametro, ' +
             QuotedStr(TMaskEdit(componente).Text)+' AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES ' +
         ' (up2.cd_usuario, up2.ds_parametro, up2.ds_valor) ';
   end else begin
      DM.qAux2.SQL.Text := ''
         + 'REPLACE INTO '
         + ' usuarios_parametros( '
         + '    cd_usuario,ds_parametro,ds_valor ) '
         + 'VALUES('
         +     intTostr(dm.iCdPessoaLogado)
         +  ','''
         +  nomeFormulario +  '.' + TMaskEdit(componente).Name
         +  ''','''
         +  TMaskEdit(componente).Text
         +''')';
   end;
   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TComboBox ) then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   //Verifica se a conexão é Oracle ou MySQL
   if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
   begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
             intTostr(dm.iCdPessoaLogado)+' AS cd_usuario, ' +
             QuotedStr(nomeFormulario+'.'+TComboBox(componente).Name)+' AS ds_parametro, ' +
             QuotedStr(TComboBox(componente).Text)+' AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
   end else begin
      DM.qAux2.SQL.Text := ''
         + ' REPLACE INTO '
         + ' usuarios_parametros( '
         + '    cd_usuario,ds_parametro,ds_valor ) '
         + ' VALUES( '
         + intTostr(dm.iCdPessoaLogado)
         + ','''
         + nomeFormulario
         + '.'
         + TComboBox(componente).Name
         + ''','''
         + TComboBox(componente).Text
         + ''')';
   end;
   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TCheckBox ) then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   //Verifica se a conexão é Oracle ou MySQL
   if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
   begin
      if TCheckBox(componente).checked then
      begin
        DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
             intTostr(dm.iCdPessoaLogado)+' AS cd_usuario, ' +
             QuotedStr(nomeFormulario+'.'+TCheckBox(componente).Name)+' AS ds_parametro, ' +
             QuotedStr('S')+' AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
      end else begin
        DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
             intTostr(dm.iCdPessoaLogado)+' AS cd_usuario, ' +
             QuotedStr(nomeFormulario+'.'+TCheckBox(componente).Name)+' AS ds_parametro, ' +
             QuotedStr('N')+' AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
      end;
   end else begin
      if TCheckBox(componente).checked then
         DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+intTostr(dm.iCdPessoaLogado)+','''+nomeFormulario+'.'+TCheckBox(componente).Name+''',''S'')'
      else
        DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+intTostr(dm.iCdPessoaLogado)+','''+nomeFormulario+'.'+TCheckBox(componente).Name+''',''N'')';
   end;

   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TRadioButton ) then
 begin
    //Verifica se a conexão é Oracle ou MySQL
    if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
    begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
         '   :cd_usuario  AS cd_usuario, ' +
         '   :ds_parametro AS ds_parametro, ' +
         '   :ds_valor AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
    end else begin
      DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES(:cd_usuario,:ds_parametro,:ds_valor)';
    end;
    DM.qAux2.ParamByName('cd_usuario').asInteger := dm.iCdPessoaLogado;
    DM.qAux2.ParamByName('ds_parametro').asString := nomeFormulario+'.'+TRadioButton(componente).Name;
    if TRadioButton(componente).checked then
    begin
      DM.qAux2.ParamByName('ds_valor').asString :=   'S';
    end
    else
    begin
      DM.qAux2.ParamByName('ds_valor').asString :=   'N';
    end;

    DM.qAux2.ExecSQL;
 end
 else if ( componente.ClassType = TSpinEdit ) then
 begin
    //Verifica se a conexão é Oracle ou MySQL
    if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
    begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
         '   :cd_usuario  AS cd_usuario, ' +
         '   :ds_parametro AS ds_parametro, ' +
         '   :ds_valor AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
    end else begin
       DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES(:cd_usuario,:ds_parametro,:ds_valor)';
    end;
    DM.qAux2.ParamByName('cd_usuario').asInteger := dm.iCdPessoaLogado;
    DM.qAux2.ParamByName('ds_parametro').asString := nomeFormulario+'.'+TSpinEdit(componente).Name;
    DM.qAux2.ParamByName('ds_valor').asString := Format('%d', [TSpinEdit(componente).Value]);
    DM.qAux2.ExecSQL;
 end
 else if componente.ClassType = TRadioGroup then
 begin
    //Verifica se a conexão é Oracle ou MySQL
    if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
    begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
         '   :cd_usuario  AS cd_usuario, ' +
         '   :ds_parametro AS ds_parametro, ' +
         '   :ds_valor AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
    end else begin
       DM.qAux2.SQL.Text :=
         'REPLACE INTO usuarios_parametros (cd_usuario,ds_parametro,ds_valor) '+
            'VALUES(:cd_usuario, :ds_parametro, :ds_valor)';
    end;
    DM.qAux2.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
    DM.qAux2.ParamByName('ds_parametro').AsString := nomeFormulario + '.' + componente.Name;
    DM.qAux2.ParamByName('ds_valor').AsString := Format('%d', [TRadioGroup(componente).ItemIndex]);
    DM.qAux2.ExecSQL;
 end
 else if componente.ClassType = TMenuItem then
 begin
    //Verifica se a conexão é Oracle ou MySQL
    if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
    begin
      DM.qAux2.SQL.Text :=
         ' MERGE INTO usuarios_parametros up USING ' +
         ' (SELECT ' +
         '   :cd_usuario  AS cd_usuario, ' +
         '   :ds_parametro AS ds_parametro, ' +
         '   :ds_valor AS ds_valor FROM dual) up2 ON ' +
         '        (up.cd_usuario = up2.cd_usuario AND up.ds_parametro = up2.ds_parametro) '+
         ' WHEN MATCHED THEN '+
         '    UPDATE SET up.ds_valor = up2.ds_valor '+
         ' WHEN NOT MATCHED THEN '+
         '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
    end else begin
       DM.qAux2.SQL.Text :=
         'REPLACE INTO usuarios_parametros (cd_usuario,ds_parametro,ds_valor) '+
            'VALUES(:cd_usuario, :ds_parametro, :ds_valor)';
    end;
    DM.qAux2.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
    DM.qAux2.ParamByName('ds_parametro').AsString := nomeFormulario + '.' + componente.Name;

    if TMenuItem(componente).Checked then
    begin
       DM.qAux2.ParamByName('ds_valor').AsInteger := 1;
    end else begin
       DM.qAux2.ParamByName('ds_valor').AsInteger := 0;
    end;

    DM.qAux2.ExecSQL;
 end;
end;

procedure TDM.Set_Parametro_usuario_valor(nomeParametro: String; valorParametro : String ;nomeFormulario:string);
begin
   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   //Verifica se a conexão é Oracle ou MySQL
   if DM.qAux2.Connection.Protocol = 'oracle' then //Oracle
   begin
      DM.qAux2.SQL.Text := 'MERGE INTO usuarios_parametros up USING '+
                           '(SELECT '+
                           '    '+ IntToStr( iCdPessoaLogado ) +' AS cd_usuario, '+
                           '    '+QuotedStr(nomeFormulario+'.'+nomeParametro)+' AS ds_parametro, '+
                           '    '+QuotedStr(valorParametro)+' AS ds_valor FROM dual) up2 ON '+
                           '       (up.cd_usuario = up2.cd_usuario AND '+
                           '        up.ds_parametro = up2.ds_parametro) '+
                           ' WHEN MATCHED THEN '+
                           '    UPDATE SET up.ds_valor = up2.ds_valor '+
                           ' WHEN NOT MATCHED THEN '+
                           '    INSERT (up.cd_usuario, up.ds_parametro, up.ds_valor) VALUES (up2.cd_usuario, up2.ds_parametro, up2.ds_valor)';
   end else begin
      DM.qAux2.SQL.Text := 'REPLACE INTO usuarios_parametros(cd_usuario,ds_parametro,ds_valor) VALUES('+IntToStr(DM.iCdPessoaLogado)+','''+nomeFormulario+'.'+nomeParametro+''','''+valorParametro+''')';
   end;

   DM.qAux2.ExecSQL;

end;

function TDM.Get_Parametro_usuario_valor(nomeParametro,
  nomeFormulario: string): String;
begin

  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qAux1.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
  DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+nomeParametro;

  DM.qAux1.Open();

  result :=  DM.qAux1.fieldByName('ds_valor').asString;


end;

function TDM.temExpedienteInstituicao( const dt_expediente_teste : TDate;
      const sn_mostra_msg : Boolean; cd_coligada : Integer ): Boolean;
const
   SQL_BUSCA_DATA_CALENDARIO =
      ' SELECT UPPER(sn_secretaria) AS sn_secretaria FROM calendario ' +
      ' WHERE ( cd_coligada = :cd_coligada OR cd_coligada = 0 ) AND ' +
      '       DATE_FORMAT( CONCAT( nr_ano, ''-'', nr_mes, ''-'', nr_dia ), ''%Y-%m-%d'' ) = DATE_FORMAT( :dt_expediente,''%Y-%m-%d'') ' +
      ' ORDER BY cd_coligada DESC ' +
      ' LIMIT 1 ';
   MENSAGEM_DIA_SEM_EXPEDIENTE =
      'A data selecionada não possui expediente acadêmico.';
var
   qyBuscaDataCalendario : TUMZReadOnlyQuery;
begin
   Result := True;

   if variavel_parametro( 'academico_considera_expediente' ) = '1' then
   begin

      CriarConsulta( qyBuscaDataCalendario );
      qyBuscaDataCalendario.SQL.Text := SQL_BUSCA_DATA_CALENDARIO;
      qyBuscaDataCalendario.ParamByName( 'dt_expediente' ).AsDate := dt_expediente_teste;
      qyBuscaDataCalendario.ParamByName( 'cd_coligada' ).AsInteger := cd_coligada;
      qyBuscaDataCalendario.Open();

      if ( qyBuscaDataCalendario.RecordCount = 1 ) AND
         ( qyBuscaDataCalendario.FieldByName( 'sn_secretaria' ).AsString = 'N' ) then
      begin
         Result := False;

         if sn_mostra_msg then
            Mensagem( MENSAGEM_DIA_SEM_EXPEDIENTE, '', MB_OK + MB_ICONEXCLAMATION );         
      end;

      FreeAndNil( qyBuscaDataCalendario );
   end;   
end;

//Esta função serve para remover um parametro de usuário
//Obs Já foi testado para : TComboBox ,TRadioButton favor quem testar outros tipos de campos adicionar aqui no comentário
procedure TDM.Delete_Parametro_Usuario(componente : TComponent;nomeFormulario:string);
begin
//Delete
if ( componente.ClassType = TEdit )  then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger  := dm.iCdPessoaLogado;
   DM.qAux2.ParamByName('ds_parametro').AsString := TEdit(componente).Name;

   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TMaskEdit )  then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger  := dm.iCdPessoaLogado;
   DM.qAux2.ParamByName('ds_parametro').AsString := TMaskEdit(componente).Name;


   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TComboBox ) then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;

   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
   DM.qAux2.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TComboBox(componente).Name;

   DM.qAux2.ExecSQL;

 end
 else if ( componente.ClassType = TCheckBox ) then
 begin

   DM.qAux2.Close;
   DM.qAux2.SQL.Clear;


   DM.qAux2.SQL.Text := 'DELETE FROM usuarios_parametros WHERE cd_usuario=:cd_usuario AND ds_parametro=:ds_parametro';
   DM.qAux2.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;
   DM.qAux2.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TCheckBox(componente).Name;

 
   DM.qAux2.ExecSQL;
 end;

end;

//Esta função retorna o valor de um campo digitado pelo usuário em um campo
//Obs Já foi testado para : TComboBox,TRadioButton , favor quem testar outros tipos de campos adicionar aqui no comentário
function TDM.Get_Parametro_usuario(componente: TComponent;nomeFormulario:string):Boolean;
var
  n : LongInt;
  i : LongInt;
begin
  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
  DM.qAux1.ParamByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;

 if ( componente.ClassType = TEdit ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TEdit(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
     TEdit(componente).Text := DM.qAux1.FieldByName('ds_valor').AsString;
 end
 else if ( componente.ClassType = TMaskEdit ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TMaskEdit(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
     TMaskEdit(componente).Text := DM.qAux1.FieldByName('ds_valor').AsString;
 end
 else if ( componente.ClassType = TRadioButton ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TRadioButton(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
   begin
      if(DM.qAux1.FieldByName('ds_valor').AsString ='S') then
      begin
         TRadioButton(componente).Checked := true;
      end
      else
      begin
         TRadioButton(componente).Checked := false;
      end;

   end;
 end
 else if ( componente.ClassType = TComboBox ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TComboBox(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
   begin
      //Tenta atualizar o combo com o indice que tiver o ds_valor do parametro
      for i:=0 to TComboBox(componente).Items.Count -1 do
      begin
         if((TComboBox(componente).Items.Strings[i]) = (DM.qAux1.FieldByName('ds_valor').AsString)) then
         begin
               TComboBox(componente).ItemIndex := i;
         end;
      end;
   end;
  
 end
 else if ( componente.ClassType = TCheckBox ) then
 begin
   DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario+'.'+TCheckBox(componente).Name;
   DM.qAux1.Open;

   if not DM.qAux1.Eof then
     TCheckBox(componente).Checked := IsTrue(DM.qAux1.FieldByName('ds_valor').AsString);
 end
 else if componente.ClassType = TRadioGroup then
 begin
    DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario + '.' + componente.Name;
    DM.qAux1.Open;
    if not DM.qAux1.IsEmpty then
      TRadioGroup(componente).ItemIndex := DM.qAux1.FieldByName('ds_valor').AsInteger;
 end
 else if componente.ClassType = TMenuItem then
 begin
    DM.qAux1.ParamByName('ds_parametro').AsString := nomeFormulario + '.' + componente.Name;
    DM.qAux1.Open;
    if not DM.qAux1.IsEmpty then
      TMenuItem(componente).Checked := DM.qAux1.FieldByName('ds_valor').AsInteger = 1;
 end;

 if not DM.qyAux1.Eof then
 begin
       Result:=false;
       DM.qAux1.Close;
       exit;
 end;
   Result:=true;
   DM.qAux1.Close;
   exit;
end;

procedure TDM.SetUserSetting(const Key, Value, Module: AnsiString);
const
   SSQLSelectSetting = 'SELECT P.`CD_PREFERENCIAS` FROM `NU_PESSOAS_PREF` P JOIN `NU_MODULOS` M ON (P.`CD_MODULO` = M.`CD_MODULO`) WHERE P.`DS_CHAVE` = ? AND M.`DS_CHAVE` = ? AND P.`CD_PESSOA` = ?';
   SSQLUpdateSetting = 'UPDATE `NU_PESSOAS_PREF` SET `DS_VALOR` = ? WHERE `CD_PREFERENCIAS` = ?';
   SSQLInsertSetting = 'INSERT INTO `NU_PESSOAS_PREF` (`CD_PESSOA`, `CD_MODULO`, `DS_CHAVE`, `DS_VALOR`) SELECT ?, `CD_MODULO`, ?, ? FROM `NU_MODULOS` WHERE `DS_CHAVE` = ?';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   Found: Boolean;
   SettingID: Integer;
begin
   Stmt := db.DbcConnection.PrepareStatement(SSQLSelectSetting);
   try
      Stmt.SetString(1, Key);
      Stmt.SetString(2, Module);
      Stmt.SetInt(3, UsuarioLogado.Pessoa.Codigo);

      Rs := Stmt.ExecuteQueryPrepared;
      try

         Found := Rs.Next;

         if Found then
            SettingID := Rs.GetInt(1);
      finally
         Rs.Close;
      end;
   finally
      Stmt.Close;
   end;

   if Found then
   begin
      Stmt := db.DbcConnection.PrepareStatement(SSQLUpdateSetting);
      try
         Stmt.SetString(1, Value);
         Stmt.SetInt(2, SettingID);
         Stmt.ExecuteUpdatePrepared;
      finally
         Stmt.Close;
      end;
   end;

   if not Found then
   begin
      Stmt := db.DbcConnection.PrepareStatement(SSQLInsertSetting);
      try
         Stmt.SetInt(1, UsuarioLogado.Pessoa.Codigo);
         Stmt.SetString(2, Key);
         Stmt.SetString(3, Value);
         Stmt.SetString(4, Module);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
      end;
   end;
end;

procedure TDM.Set_Parametros_usuario(Formulario: TForm);
var
  n : LongInt ;
begin

   if UsuarioLogado = nil then
   begin
      Exit;   
   end;

  for n := 0 to ( Formulario.ComponentCount - 1 ) do
  begin
      if Formulario.Components[n].ClassType = TSpinEdit then
      begin
         qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
         qyUsuariosParametros.ParamByName('ds_parametro').AsString := Formulario.Name + '.' + TSpinEdit(Formulario.components[n]).Name;
         qyUsuariosParametros.ParamByName('ds_valor').AsString := TSpinEdit(Formulario.components[n]).Text;
         qyUsuariosParametros.ExecSQL;
      end;

    if ( Formulario.components[n].ClassType = TEdit )  then
    begin

      qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
      qyUsuariosParametros.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
      qyUsuariosParametros.ParamByName('ds_valor').AsString := TEdit(Formulario.components[n]).Text;

      qyUsuariosParametros.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TMaskEdit )  then
    begin

      qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
      qyUsuariosParametros.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TMaskEdit(Formulario.components[n]).Name;
      qyUsuariosParametros.ParamByName('ds_valor').AsString := TMaskEdit(Formulario.components[n]).Text;

      qyUsuariosParametros.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TComboBox ) then
    begin

      qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
      qyUsuariosParametros.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
      qyUsuariosParametros.ParamByName('ds_valor').AsString := TComboBox(Formulario.components[n]).Text;

      qyUsuariosParametros.ExecSQL;

    end
    else if ( Formulario.components[n].ClassType = TCheckBox ) then
    begin

      DM.qAux2.Close;
      DM.qAux2.SQL.Clear;
      if TCheckBox(Formulario.components[n]).checked then begin
         qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
         qyUsuariosParametros.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TCheckBox(Formulario.components[n]).Name;
         qyUsuariosParametros.ParamByName('ds_valor').AsString := 'S';

      end else begin
         qyUsuariosParametros.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;
         qyUsuariosParametros.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TCheckBox(Formulario.components[n]).Name;
         qyUsuariosParametros.ParamByName('ds_valor').AsString := 'N';

      end;

      qyUsuariosParametros.ExecSQL;

    end;

  end ;

end;

procedure TDM.Parametros_usuario(Formulario: TForm; camposIgnorados: TStringList);
var
  n : LongInt;
   I: Integer;
begin
   if camposIgnorados = nil then
      camposIgnorados := TStringList.Create;

   DM.qAux1.Close;
   DM.qAux1.SQL.Clear;
   DM.qAux1.SQL.Text := 'SELECT ds_valor FROM usuarios_parametros WHERE cd_usuario = :cd_usuario AND ds_parametro = :ds_parametro';
   DM.qAux1.ParamByName('cd_usuario').AsInteger := iCdPessoaLogado;

   for n := 0 to ( Formulario.ComponentCount - 1 ) do
   begin

      if camposIgnorados.IndexOf(Formulario.components[n].Name) <> -1 Then
         Continue;

      if Formulario.Components[n].ClassType = TSpinEdit then
      begin
         DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name + '.' + TSpinEdit(Formulario.components[n]).Name;
         DM.qAux1.Open;

         if not DM.qAux1.IsEmpty then
         begin
            I := StrToIntDef(DM.qAux1.FieldByName('ds_valor').AsString, 0);
            TSpinEdit(Formulario.components[n]).Value := I;
         end;
      end;

      if ( Formulario.components[n].ClassType = TEdit ) then
      begin
         DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TEdit(Formulario.components[n]).Name;
         DM.qAux1.Open;

         if not DM.qAux1.Eof then
           TEdit(Formulario.components[n]).Text := DM.qAux1.FieldByName('ds_valor').AsString;
      end
      else if ( Formulario.components[n].ClassType = TMaskEdit ) then
      begin
        DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TMaskEdit(Formulario.components[n]).Name;
        DM.qAux1.Open;

        if not DM.qAux1.Eof then
          TMaskEdit(Formulario.components[n]).Text := DM.qAux1.FieldByName('ds_valor').AsString;
      end
      else if ( Formulario.components[n].ClassType = TComboBox ) then
      begin
        DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TComboBox(Formulario.components[n]).Name;
        DM.qAux1.Open;

        if not DM.qAux1.Eof then
          TComboBox(Formulario.components[n]).Text := DM.qAux1.FieldByName('ds_valor').AsString;
      end
      else if ( Formulario.components[n].ClassType = TCheckBox ) then
      begin
        DM.qAux1.ParamByName('ds_parametro').AsString := Formulario.Name+'.'+TCheckBox(Formulario.components[n]).Name;
        DM.qAux1.Open;

        if not DM.qAux1.Eof then
          TCheckBox(Formulario.components[n]).Checked := IsTrue(DM.qAux1.FieldByName('ds_valor').AsString);

      end;
      DM.qAux1.Close;
   end ;

end;

Function TDM.TemLivrosAtrasados( cd_pessoa: integer ): boolean;
begin

  qAux1.Close;
  qAux1.SQL.Clear;
  qAux1.SQL.Add( 'SELECT                                                       ');
  qAux1.SQL.Add( '	COUNT(*) AS qtde                                           ');
  qAux1.SQL.Add( 'FROM                                                         ');
  qAux1.SQL.Add( '	bib_emprestimos be                                         ');
  qAux1.SQL.Add( 'WHERE                                                        ');
  qAux1.SQL.Add( '	be.dt_devolucao < NOW() AND                                ');
  qAux1.SQL.Add( '	be.dt_entrega IS NULL AND                                  ');
  qAux1.SQL.Add( '	be.cd_pessoa = :cd_pessoa AND                              ');
  qAux1.SQL.Add( '	be.cd_situacao = 1                                         ');
  qAux1.ParamByName( 'cd_pessoa' ).AsInteger := cd_pessoa;
  qAux1.Open;

  Result := ( qAux1.FieldByName( 'qtde' ).AsInteger > 0 );

  qAux1.Close;
  
end;

function TDM.TentaAtivarMatricula(const CodigoAluno, AnoSemestre: Integer;
  const Turma: string; const Forcar: Boolean): TPendenciasMatricula;
const
   SSQLVerificaReserva =
      'SELECT M.CODIGOALUNO ' +
      'FROM MATRICULAS M JOIN SITUACAO S ON (M.SITUACAO = S.CD_SITUACAO) ' +
      'WHERE M.CODIGOALUNO = ? AND ' +
            'M.TURMA = ? AND ' +
            'M.ANOSEMESTRE = ? AND ' +
            'S.CD_SITUACAO_PAI = 10';

   SSQLVerificaDocs =
      'SELECT DN.COD_DOCUMENTO ' +
      'FROM DOCUMENTOS_NECESSARIOS DN ' +
         'JOIN DOCUMENTOS D ON (DN.COD_DOCUMENTO = D.CODIGO) ' +
         'LEFT JOIN DOCUMENTOS_ALUNOS DA ON (DN.COD_DOCUMENTO = DA.COD_DOCUMENTO) ' +
         'LEFT JOIN PESSOAS P ON (DA.CODIGOALUNO = P.CD_PESSOA) AND ((D.DS_SEXO = ''A'') OR (P.DS_SEXO = D.DS_SEXO)) ' +
      'WHERE DA.CODIGOALUNO = ? AND ' +
            'DN.CURSO = ? AND ' +
            'DN.SN_OBRIGATORIO = ''S'' AND ' +
            'COALESCE(DA.APRESENTOU, ''N'') = ''N'' AND ' +
            'DN.NR_GRUPO = 0';

   SSQLVerificaDocsGrupo =
      'SELECT DN.COD_DOCUMENTO, D.DOCUMENTO, DN.NR_GRUPO, COALESCE(DA.APRESENTOU, ''N'')' +
      'FROM DOCUMENTOS_NECESSARIOS DN ' +
         'JOIN DOCUMENTOS D ON (DN.COD_DOCUMENTO = D.CODIGO) ' +
         'LEFT JOIN DOCUMENTOS_ALUNOS DA ON (DN.COD_DOCUMENTO = DA.COD_DOCUMENTO) ' +
         'LEFT JOIN PESSOAS P ON (DA.CODIGOALUNO = P.CD_PESSOA) AND ((D.DS_SEXO = ''A'') OR (P.DS_SEXO = D.DS_SEXO)) ' +
      'WHERE DA.CODIGOALUNO = ? AND ' +
         'DN.CURSO = ? AND ' +
         'DN.SN_OBRIGATORIO = ''S'' AND ' +
         'DN.NR_GRUPO != 0';

   SSQLAtuMensalidades =
      'UPDATE MENSALIDADES ' +
      'SET SITUACAO = 2 ' +
      'WHERE CODIGOALUNO = ? AND ' +
            'TURMA = ? AND ' +
            'ANOSEMESTRE = ? AND ' +
            'SITUACAO = 10';

   SSQLAtuFichaIdividual =
      'UPDATE FICHAINDIVIDUAL ' +
      'SET SITUACAO = 1 ' +
      'WHERE ANOSEMESTRE = ? AND ' +
            'TURMAMATRICULA = ? AND ' +
            'CODIGOALUNO = ? AND ' +
            'SITUACAO = 10';

   SSQLAtivaMatricula =
      'UPDATE MATRICULAS ' +
      'SET SITUACAO = 1 ' +
      'WHERE ANOSEMESTRE = ? AND ' +
            'TURMA = ? AND ' +
            'CODIGOALUNO = ? AND ' +
            'SITUACAO = 10';

   SSQLAtivaMatriculaData =
      'UPDATE MATRICULAS ' +
      'SET SITUACAO = 1,' +
         'DATAEMISSAO = NOW() ' +
      'WHERE ANOSEMESTRE = ? AND ' +
            'TURMA = ? AND ' +
            'CODIGOALUNO = ? AND ' +
            'SITUACAO = 10'; 
var
   Achou: Boolean;
   S: string;
   I: Integer;
   Stmt: IZPreparedStatement;
   RS: IZResultSet;
   DocsApresentados, DocsNaoApresentados: TStringList;
begin
   Result := [];

   Stmt := PrepareStatement(SSQLVerificaReserva);
   try
      Stmt.SetInt(1, CodigoAluno);
      Stmt.SetString(2, Turma);
      Stmt.SetInt(3, AnoSemestre);
      RS := Stmt.ExecuteQueryPrepared;
      try
         Achou := RS.Next;
      finally
         RS.Close;
      end;
   finally
      Stmt.Close;
   end;

   if Achou then
   begin

      if not Forcar then
      begin
         S := variavel_parametro('matricula_condicao_forcar_ativacao');
         S := Trim(S);

         if S <> '' then
         begin
            S := StringReplace(S, ':CD_PESSOA', Format('%d', [CodigoAluno]),
               [rfReplaceAll, rfIgnoreCase]
            );
            S := StringReplace(S, ':NR_ANOSEM', Format('%d', [AnoSemestre]),
               [rfReplaceAll, rfIgnoreCase]
            );
            S := StringReplace(S, ':CD_TURMA', QuotedStr(Turma),
               [rfReplaceAll, rfIgnoreCase]
            );

            RS := ExecuteQuery(S);
            try
               if (not RS.Next) or (RS.GetInt(1) <= 0) then
               begin
                  Result := [pmFinanceiro];
               end;
            finally
               RS.Close;
            end;
         end;

         S := variavel_parametro('matricula_condicao_bloquear');
         S := Trim(S);
         if S <> '' then
         begin
            S := StringReplace(S, ':CD_PESSOA', Format('%d', [CodigoAluno]),
               [rfReplaceAll, rfIgnoreCase]
            );
            S := StringReplace(S, ':NR_ANOSEM', Format('%d', [AnoSemestre]),
               [rfReplaceAll, rfIgnoreCase]
            );
            S := StringReplace(S, ':CD_TURMA', QuotedStr(Turma),
               [rfReplaceAll, rfIgnoreCase]
            );

            RS := ExecuteQuery(S);
            try
               if RS.Next and (RS.GetInt(1) > 0) then
               begin
                  Result := [pmFinanceiro];
               end;
            finally
               RS.Close;
            end;
         end;

         DeptoCursoTurma(AnoSemestre, Turma);

         Stmt := PrepareStatement(SSQLVerificaDocs);
         try
            Stmt.SetInt(1, CodigoAluno);
            Stmt.SetString(2, tblDeptoCursoTurmaCurso.AsString);
            RS := Stmt.ExecuteQueryPrepared;
            try
               Achou := RS.Next;
            finally
               RS.Close;
            end;
         finally
            Stmt.Close;
         end;

         if not Achou then
         begin
            Stmt := PrepareStatement(SSQLVerificaDocsGrupo);
            try
               Stmt.SetInt(1, CodigoAluno);
               Stmt.SetString(2, tblDeptoCursoTurmaCurso.AsString);
               RS := Stmt.ExecuteQueryPrepared;
               try
                  DocsApresentados := TStringList.Create;
                  DocsNaoApresentados := TStringList.Create;
                  try
                     DocsApresentados.Duplicates := dupIgnore;
                     DocsNaoApresentados.Duplicates := dupIgnore;
                     
                     while RS.Next do
                     begin
                        if RS.GetString(4) = 'S' then
                        begin
                           DocsApresentados.Add(RS.GetString(3));
                        end
                        else
                        begin
                           DocsNaoApresentados.Add(RS.GetString(3));
                        end;
                     end;

                     for I := 0 to DocsNaoApresentados.Count - 1 do
                     begin
                        if DocsApresentados.IndexOf(DocsNaoApresentados.Strings[I]) < 0 then
                        begin
                           Include(Result, pmDocumentacao);
                           Break;
                        end;
                     end;
                  finally
                     DocsApresentados.Free;
                     DocsNaoApresentados.Free;
                  end;
               finally
                  RS.Close;
               end;
            finally
               Stmt.Close;
            end;
         end;
      end;

      if Result = [] then
      begin
         Stmt := PrepareStatement(SSQLAtuMensalidades);
         try
            Stmt.SetInt(1, CodigoAluno);
            Stmt.SetString(2, Turma);
            Stmt.SetInt(3, AnoSemestre);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
         end;

         Stmt := PrepareStatement(SSQLAtuFichaIdividual);
         try
            Stmt.SetInt(1, AnoSemestre);
            Stmt.SetString(2, Turma);
            Stmt.SetInt(3, CodigoAluno);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
         end;

         Stmt := PrepareStatement(SSQLAtivaMatriculaData);

         try
            Stmt.SetInt(1, AnoSemestre);
            Stmt.SetString(2, Turma);
            Stmt.SetInt(3, CodigoAluno);
            Stmt.ExecutePrepared;
         finally
            Stmt.Close;
         end;
      end;
   end;
end;

procedure TDM.dbDocsBeforeConnect(Sender: TObject);
begin
    if variavel_parametro('docs_digitalizados_base') <> '' then
    Begin
      dbDocs.Database := variavel_parametro('docs_digitalizados_base');
    end;
end;

Function TDM.DataAtual(): TDateTime;
Begin
   Result := TUMNucleo.GetDataAtual();
End;

function TDM.DataBloqueioFinanceiro(DataTitulo : TDateTime): TDateTime;
{Essa função tem por finalidade retornar a data do bloqueio financeiro.}
Var
   DtBloqueio                 : TDateTime;
   DtBloqueioPrestacaoConta   : TDateTime;
   qyDatas                    : TUMZQuery;
   sn_agrupa_financeiro       : string;
   iColigada                  : string;
begin

   iColigada := IntToStr(Self.GetUsuarioLogado.GetColigadaLogada.Codigo);

   //verifica se a data de bloqueio é geral
   CriarConsulta(qyDatas);
   qyDatas.SQL.Text := ''+
    ' SELECT sn_bloquear_financeiro, dt_bloqueio_financeiro FROM coligadas_matriz  ' +
    ' WHERE cd_coligada = ' + iColigada;
   qyDatas.Open();

   //se a data de bloqueio geral NÃO for utilizada coloca a data de bloqueio
   //como zero. Caso contrário usa a data de bloqueio informada no campo.
   DtBloqueio := 0;
   if not (qyDatas.FieldByName('sn_bloquear_financeiro').AsInteger = 0) then
   begin
     DtBloqueio := qyDatas.FieldByName('dt_bloqueio_financeiro').AsDateTime;
   end;

   FreeAndNil(qyDatas);

   //formata as datas no formato sem HORA.
   DtBloqueio := Self.convertDateTimeToDate(DtBloqueio);
   DataTitulo := Self.convertDateTimeToDate(DataTitulo);

   if DtBloqueio = 0 then // pela coligada
   begin

      // Pegar a Data do Bloqueio provisório
      //DtBloqueioPrestacaoConta := Self.getDataBloqueioPrestacaoConta( DataTitulo );
      DtBloqueioPrestacaoConta := Self.getDtUltimoBloqueio( iColigada, DataTitulo );
      DtBloqueioPrestacaoConta := Self.convertDateTimeToDate(DtBloqueioPrestacaoConta);

      // Bloqueio ligado, porém a data que está sendo alterada é maior
      Result := DataTitulo;
      if not (DataTitulo > DtBloqueioPrestacaoConta) then
      begin
         Result := DtBloqueioPrestacaoConta;
      end;

   end
   else
   begin

      //se a data da mensalidade for maior que a do bloqueio ele pode alterar no financeiro
      Result := DtBloqueio;
      if DataTitulo > DtBloqueio then
      begin

         //antes de alterar o financeiro verifica se nao existe pendencia na prestão de contas
         //DtBloqueioPrestacaoConta := Self.getDataBloqueioPrestacaoConta( DataTitulo );
         DtBloqueioPrestacaoConta := Self.getDtUltimoBloqueio( iColigada, DataTitulo );
         DtBloqueioPrestacaoConta := Self.convertDateTimeToDate(DtBloqueioPrestacaoConta);

         // Padrão - Bloqueio desligado. A data que está sendo alterada é maior
         Result := DataTitulo;
         if DtBloqueioPrestacaoConta <> 0 then
         begin
            if not (DataTitulo > DtBloqueioPrestacaoConta) then
            begin
               Result := DtBloqueioPrestacaoConta;
            end;
         end;
      end;
   end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
   if FDLLHandle > 0 then
   begin
      sqlMonitor.Active := False;
      FreeLibrary(FDLLHandle);
   end;
end;

function TDM.DataSetToJson(DataSet: TDataSet): TlkJSONlist;
var
   CanDisableControls: Boolean;
begin
   Result := TlkJSONlist.Create;

   CanDisableControls := not DataSet.ControlsDisabled;

   if CanDisableControls then
      DataSet.DisableControls;
      
   DataSet.First;
   while not DataSet.Eof do
   begin
      Result.Add(RecordToJSON(DataSet));
      DataSet.Next;
   end;
   DataSet.First;

   if CanDisableControls then
      DataSet.EnableControls;
end;

Function TDM.DiasUteis(setor: string; dt_inicial,dt_final:TDateTime): integer;
var
  data: TDateTime;
  dias: integer;
begin

  data := dt_inicial;
  dias := 0;

  while data <= dt_final do
  begin

    DM.qAux1.Close;
    DM.qAux1.SQL.Clear;
    DM.qAux1.SQL.Add('SELECT * FROM calendario WHERE nr_dia = :dia AND nr_mes = :mes AND nr_ano = :ano AND sn_'+setor+' = ''N''');
    DM.qAux1.ParamByName('dia').AsString := FormatDateTime('dd', data);
    DM.qAux1.ParamByName('mes').AsString := FormatDateTime('mm', data);
    DM.qAux1.ParamByName('ano').AsString := FormatDateTime('yyyy', data);
    DM.qAux1.Open;

    if DM.qAux1.Eof then
      Inc(dias);

    data := IncDay(data, 1);

  end;

  Result := dias;

end;

function TDM.disciplinaAlocada(iCodigo: Integer; sCurso: String): boolean;
var
   qyAux1, qyAux2 : TUMZQuery;
begin
  CriarConsulta(qyAux1);
  qyAux1.SQL.Clear;
  qyAux1.SQL.Text:= 'SELECT count(CD_TURMAPROFESSOR) as conta FROM turmasprofessores WHERE DISCIPLINA = '+IntToStr(iCodigo)+' AND curso LIKE '''+sCurso+'''';
  qyAux1.Open;

  Result:= true;

  if qyAux1.FieldByName('conta').AsInteger = 0 then begin
     CriarConsulta(qyAux2);
     qyAux2.SQL.Clear;
     qyAux2.SQL.Text:= 'SELECT count(ID_FICHAINDIVIDUAL) as conta FROM fichaindividual WHERE disciplina= '+IntToStr(iCodigo)+' AND curso LIKE '''+sCurso+'''';
     qyAux2.Open;

     if qyAux2.FieldByName('conta').AsInteger = 0 then begin
        Result:= false;
     end;
  end;

end;

Function TDM.ProximoId(campo, tabela: string): integer;
const
   SQL_PROXIMO_ID = 'SELECT MAX(%s) AS id FROM %s';
var
   qyProximoID: TUMZReadOnlyQuery;
begin
   CriarConsulta(qyProximoID);

   qyProximoID.SQL.Text := Format(SQL_PROXIMO_ID, [ campo, tabela ]);
   qyProximoID.Open;

   Result := qyProximoID.FieldByName('id').AsInteger + 1;

   FreeAndNil( qyProximoID );
end;

function TDM.EhFeriado(Data: TDateTime; Modulo: byte): Boolean;
Var
   qFeriado : TUMZQuery;
   Dia, Mes, Ano : Word;
begin

   DecodeDate(Data, Ano, Mes, Dia);

   Dm.CriarConsulta(qFeriado);

   qFeriado.SQL.Text :=
     '  SELECT * FROM CALENDARIO ' +
     '  WHERE NR_DIA = ' + IntToStr(Dia) +
     '    AND NR_MES = ' + IntToStr(Mes) +
     '    AND NR_ANO = ' + IntToStr(Ano); 

   Case Modulo of
     1 : qFeriado.SQL.Add(' AND SN_SECRETARIA = ''N'' ');

     2 : qFeriado.SQL.Add(' AND SN_FINANCEIRO = ''N'' ');

     4: qFeriado.SQL.Add(' AND SN_BIBLIOTECA = ''N'' ');

   end;

   qFeriado.Open();

   Result := not qFeriado.IsEmpty;

   FreeAndNil(qFeriado);

end;

function TDM.EstaBloqueado(DataTitulo: TDateTime;
  EmitirAviso: Boolean): boolean;
{Essa função tem a finalidade de dizer se a data passada via parametro está
ou não bloqueada.}
Var
   DtBloqueio                 : TDateTime;
   DtBloqueioPrestacaoConta   : TDateTime;
   qyDatas                    : TUMZQuery;
   sn_agrupa_financeiro       : string;
   iColigada                  : string;
begin

   iColigada := IntToStr(Self.GetUsuarioLogado.GetColigadaLogada.Codigo);

   //verifica se o bloqueio financeiro é geral
   CriarConsulta(qyDatas);
   qyDatas.SQL.Text := ''+
      ' SELECT sn_bloquear_financeiro, dt_bloqueio_financeiro FROM coligadas_matriz ' +
      ' WHERE cd_coligada = ' + iColigada;
   qyDatas.Open();

   //se a data de bloqueio geral NÃO for usado, atribui zero a data de bloqueio
   if (qyDatas.FieldByName('sn_bloquear_financeiro').AsInteger = 0) then
   begin
      DtBloqueio := 0;
   end
   else
   begin
      DtBloqueio := qyDatas.FieldByName('dt_bloqueio_financeiro').AsDateTime;
   end;

   FreeAndNil(qyDatas);

   //formata a data de bloqueio e a data do titulo sem HORA.
   DtBloqueio := Self.convertDateTimeToDate(DtBloqueio);
   DataTitulo := Self.convertDateTimeToDate(DataTitulo);

   //se a data de bloqueio geral não é utilizada verifica se existe o bloqueio
   //na prestação de contas
   if DtBloqueio = 0 then
   begin

      // Pegar a Data do Bloqueio provisório
      DtBloqueioPrestacaoConta := Self.getDataBloqueioPrestacaoConta( DataTitulo );
      DtBloqueioPrestacaoConta := Self.convertDateTimeToDate(DtBloqueioPrestacaoConta);

      if DataTitulo > DtBloqueioPrestacaoConta then
      begin
         // Bloqueio ligado, porém a data que está sendo alterada é maior
         Result := false;
      end
      else
      begin
         Result := true;

         if EmitirAviso then
         begin
            //recupera a data mais recente bloqueada para informar na mensagem
            DtBloqueioPrestacaoConta := Self.getDtUltimoBloqueio( iColigada, DataTitulo );

            Mensagem('Você não pode efetuar alterações/inclusões de títulos com data inferior a ' + FormatDateTime('dd/mm/yyyy', DtBloqueioPrestacaoConta), 'Atenção', MB_OK + MB_ICONINFORMATION );
         end;
      end;

   end
   else
   begin

      //se a data da mensalidade for maior que a do bloqueio ele pode alterar no financeiro
      if DataTitulo > DtBloqueio then
      begin

         //antes de alterar o financeiro verifica se nao existe pendencia na prestão de contas
         DtBloqueioPrestacaoConta := Self.getDataBloqueioPrestacaoConta( DataTitulo );
         DtBloqueioPrestacaoConta := Self.convertDateTimeToDate(DtBloqueioPrestacaoConta);

         if DtBloqueioPrestacaoConta <> 0 then
         begin
            if DataTitulo > DtBloqueioPrestacaoConta then
            begin
               // Bloqueio desligado. A data que está sendo alterada é maior
               Result := false;
            end
            else
            begin
               Result := true;

               if EmitirAviso then
               begin
                  //recupera a data mais recente bloqueada para informar na mensagem
                  DtBloqueioPrestacaoConta := Self.getDtUltimoBloqueio( iColigada, DataTitulo );

                  Mensagem('Você não pode efetuar alterações/inclusões de títulos com data inferior a ' + FormatDateTime('dd/mm/yyyy', DtBloqueioPrestacaoConta), 'Atenção', MB_OK + MB_ICONINFORMATION );
               end;
            end;
         end
         else
         begin
            Result := false;
         end;
      end
      else
      begin
         Result := true;

         if EmitirAviso then
         begin
            //recupera a data mais recente bloqueada para informar na mensagem
            DtBloqueioPrestacaoConta := DtBloqueio;// Self.getDtUltimoBloqueio( iColigada );
            Mensagem('Você não pode efetuar alterações/inclusões de títulos com data inferior a ' + FormatDateTime('dd/mm/yyyy', DtBloqueioPrestacaoConta), 'Atenção', MB_OK + MB_ICONINFORMATION );
         end;
      end;

   end;

end;

function TDM.ExisteRegistro(tabela: string; campo: ARRAY of string; valor: ARRAY of string):Boolean;
var
   qyAux1 : TUMZQuery;
   sOp : String;

   i : SmallInt;
begin

  CriarConsulta(qyAux1);

  qyAux1.Close;
  qyAux1.SQL.Clear;
  qyAux1.SQL.Add('SELECT COUNT(*) as qtde FROM ' + tabela);

  sOp := ' WHERE ' ;

  For i := 0 to Length(campo) - 1 do begin
      qyAux1.SQL.Add( sOP + ' ' + campo[i] + ' = ' + QuotedStr(valor[i]) + '' );
      sOp := ' AND '; 
  end;

  qyAux1.Open();

  if qyAux1.FieldByName('qtde').AsInteger > 0 then
    Result := True
   else
    Result := False;

end;

function TDM.ExisteRegistroColigadas(tabela, campo_coligada: string; campos_filtros, valores_filtros: array of string): Boolean;
const
   SQL_EXISTE_REGISTRO_COLIGADAS =
      ' SELECT COUNT(*) AS qtd FROM %s WHERE %s IN (%s) ';
var
   qyExisteRegistroColigadas : TUMZReadOnlyQuery;
   I : Integer;
begin
   CriarConsulta(qyExisteRegistroColigadas);

   qyExisteRegistroColigadas.SQL.Text := Format( SQL_EXISTE_REGISTRO_COLIGADAS, [tabela, campo_coligada, UsuarioLogado.GetColigadasFilhaSelecionada()] );

   for I := 0 to Length(campos_filtros) - 1 do
   begin
      qyExisteRegistroColigadas.SQL.Add( ' AND ' + campos_filtros[I] + ' = ' + QuotedStr(valores_filtros[I]) + '' );
   end;

   qyExisteRegistroColigadas.Open;

   Result := ( qyExisteRegistroColigadas.FieldByName('qtd').AsInteger > 0 );

   FreeAndNil(qyExisteRegistroColigadas);
end;

function TDM.BuscaCodigoColigada(NomeCombo: String): Integer;
const
   SQL_BUSCA_CODIGO_COLIGADA = ''+
      ' SELECT '+
      '   DS_VALOR '+
      ' FROM '+
      '   USUARIOS_PARAMETROS '+
      ' WHERE '+
      '   DS_PARAMETRO = :DS_PARAMETRO '+
      '   AND CD_USUARIO = :CD_USUARIO ';
var
   qryBuscaCodigoColigada: TUMZQuery;
begin
   CriarConsulta(qryBuscaCodigoColigada);

   Result := 0;

   with qryBuscaCodigoColigada do
   begin
      SQL.Text := SQL_BUSCA_CODIGO_COLIGADA;
      ParamByName('DS_PARAMETRO').AsString := NomeCombo;
      ParamByName('CD_USUARIO').AsInteger := GetUsuarioLogado.Pessoa.Codigo;
      Open;

      if FieldByName('DS_VALOR').AsString <> '' then
      begin
         Result := FieldByName('DS_VALOR').AsInteger;
      end;
   end;
end;

function TDM.BuscaDisciplinasSemPI(CodigoAluno: Integer; TurmaMatricula: String;
  AnoSemestre: Integer): string;
Var
   qBusca: TUMZQuery;
   sAux : String;
   sOP : String;

   usar_pi_novo : bool;
begin

    CriarConsulta(qBusca);

    qBusca.SQL.Text :=
      'SELECT ds_valor FROM parametros WHERE ds_variavel = ''dol_calcular_pi_novo'' ORDER BY ds_variavel';
    qBusca.Open();

    usar_pi_novo := false;

    if not qBusca.EOF then
    begin
      if qBusca.FieldByName('ds_valor').asString = '1' then
      begin
         usar_pi_novo := true
      end;
    end;
    qBusca.Close();

    CriarConsulta(qBusca);

    if usar_pi_novo = true then
    begin

     qBusca.SQL.Text :=
		 '	SELECT  ' +
		 '		uni_fi.turma, uni_fi.anosemestre, uni_fi.disciplina, uni_fi.curso,  ' +
		 '		pint_pt.cd_disciplina  ' +
		 '	FROM  ' +
		 '		fichaindividual uni_fi  ' +
     '  ' +
		 '		LEFT JOIN pint_provas_turmas pint_pt ON (  ' +
		 '			pint_pt.nr_anosemestre 	= uni_fi.anosemestre and  ' +
		 '			pint_pt.cd_curso 				= uni_fi.curso and  ' +
		 '			pint_pt.cd_turma 				= uni_fi.turma and  ' +
		 '			pint_pt.cd_disciplina   = uni_fi.disciplina  ' +
		 '		)  ' +
     '  ' +
		 '	WHERE  ' +
		 '		uni_fi.codigoaluno 	= '''+ IntToStr(CodigoAluno) +''' and  ' +
		 '		uni_fi.anosemestre	= '''+ IntToStr(AnoSemestre) +'''  and  ' +
		 '		pint_pt.cd_disciplina is  null  ';

    end
    else
    begin

      qBusca.SQL.Text :=
      ' SELECT fi.turma, fi.anosemestre, fi.disciplina, fi.curso  ' +
      ' FROM fichaindividual fi LEFT JOIN provas_turmas pt ' +
      '      ON (fi.turma = pt.cd_turma AND fi.disciplina = pt.cd_disciplina AND fi.anosemestre = pt.nr_anosemestre) ' +
      ' LEFT JOIN provas p ON (p.cd_prova = pt.cd_prova) ' +
      ' WHERE fi.codigoaluno = '+ IntToStr(CodigoAluno) +' AND fi.anosemestre = '+ IntToStr(AnoSemestre) +
      '   AND fi.turmamatricula = ' + QuotedStr(TurmaMatricula) + ' ' +
      '       AND pt.cd_provas_turmas is null ';

    end;


   qBusca.Open();

   sAux := '';
   sOp := '';

   while not qBusca.EOF do begin

       sAux := sAux + sOp + '(fichaindividual.disciplina=' + qBusca.FieldByName('disciplina').AsString;
       sAux := sAux + ' AND fichaindividual.curso = ' + QuotedStr(qBusca.FieldByName('curso').AsString) + '';
       sAux := sAux + ') ';
       sOp := ' OR ';
       qBusca.Next();

   end;

   result := sAux;

   qBusca.close();

   FreeAndNil(qBusca);

end;

function TDM.BuscarCodigoAcaoPadrao(CodPadrao: Integer): Integer;
var
   qyAcao : TUMZQuery;
begin

   CriarConsulta(qyAcao);

   qyAcao.SQL.Clear;
   qyAcao.SQL.Add(
   ' SELECT                              ' +
   '   *                                 ' +
   ' FROM                                ' +
   '    fin_acoes_movimento              ' +
   ' WHERE                               ' +
   '    cd_acao_automatica = ' + IntToStr(CodPadrao) );

   qyAcao.Open;

   if qyAcao.Eof then begin
      Result := -1;
   end
   else begin
      Result := qyAcao.FieldByName('cd_acao').AsInteger;
   end;

   FreeAndNil(qyAcao);

end;




function TDM.CabecalhoCampos(iCodCabecalho: Integer): string;
begin
  Result := '';

  if (iCodCabecalho > - 1) then begin
    with qyAux do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT ds_campos FROM relatorios_cabecalhos WHERE cd_cabecalho = :cdcabecalho LIMIT 1');
      ParamByName('cdcabecalho').Value := iCodCabecalho;
      Open();

      if not IsEmpty then begin
        Result := FieldByName('ds_campos').AsString;
      end;

      Close();
    end;
  end;
end;

function TDM.CabecalhoParamFixos(): TStringList;
begin
  Result := nil;

  if slPFixos = nil then begin

    slPFixos := TStringList.Create();
    with qyAux do begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT ds_variavel, ds_valor FROM parametros WHERE cd_categoria = :cdcategoria ORDER BY ds_variavel');
      ParamByName('cdcategoria').Value := 3;
      Open();

      if not IsEmpty then begin
        First();
        while not Eof do begin
          slPFixos.Add(FieldByName('ds_variavel').AsString + '=' + FieldByName('ds_valor').AsString);
          Next();  
        end;
        Result := slPFixos;
      end;
      Close();
    end;
  end;

end;

function TDM.CalcularNotaDisciplina(nr_anosemestre: Integer; cd_turma: String;
      cd_disciplina, nr_etapa, cd_grupo, cd_pessoa: Integer; ds_formula: String): Boolean;
var
   cdLogAcesso : integer;
begin
   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
   end;
               
   { Insere log de acesso ao diário }
   if DMDiario.dia_log_codigo_acesso > 0 then
   begin
      cdLogAcesso := DMDiario.dia_log_codigo_acesso;
   end else begin
      DMDiario.inserirLogAcesso;
      cdLogAcesso := DM.LastInsert;
   end;
                                   
   Result := callProcedure(
      'CALL DIA_CALCULO_MEDIA_DISCIPLINA ( ' + IntToStr(nr_anosemestre) + ', ' +
                                               QuotedStr(cd_turma) + ', ' +
                                               IntToStr(cd_disciplina) + ', ' +
                                               IntToStr(nr_etapa) + ', ' +
                                               IntToStr(cd_grupo) + ', ' +
                                               IntToStr(cd_pessoa) + ', ' +
                                               QuotedStr(ds_formula) + ', '+
                                               IntToStr(cdLogAcesso) + ', '+
                                               IntToStr(dm.iCdPessoaLogado) + ')',
      False
   );
end;

function TDM.FazAcaoRemessa(Acao: TAcaoRemessa;
  iCodMensalidade: Integer; ForcarAgrupado : Boolean = false; sListaMensa : String = ''): Boolean;
const
   SSQLSelectItens =
      'SELECT M1.CD_MENSALIDADE ' +
      'FROM MENSALIDADES M1 ' +
      'WHERE ' +
         'EXISTS (' +
            'SELECT M2.CD_MENSALIDADE ' +
            'FROM ' +
               'MENSALIDADES M2 ' +
                  'JOIN RETORNO_ITENS_TITULOS RIT ON ' +
                     '(M2.CD_MENSALIDADE = RIT.CD_MENSALIDADE) ' +
                     'JOIN RETORNO_ITENS RI ON ' +
                        '(RIT.CD_RETORNO = RI.CD_RETORNO) AND ' +
                        '(RIT.NR_SEQUENCIA = RI.NR_SEQUENCIA) ' +
                     'JOIN RETORNO R ON ' +
                        '(RIT.CD_RETORNO = R.CODIGO) ' +
                  'JOIN REM_DADOS RD ON ' +
                     '(M2.CD_MENSALIDADE = RD.CD_MENSALIDADE) ' +
                        'JOIN BANCO_CODIGO_RETORNO BCR ON ' +
                           '(RI.CD_OCORRENCIA = BCR.CD_RETORNO) AND ' +
                           '(R.CD_BANCO = BCR.CD_BANCO) ' +
                     'JOIN REM_LAYOUTS RL ON ' +
                        '(RD.CD_LAYOUT = RL.CD_LAYOUT) ' +
            'WHERE ' +
               'M1.CD_BOLETO = M2.CD_BOLETO AND ' +
               'M1.CD_RESP = M2.CD_RESP AND ' +
               'BCR.SN_ACEITO = 1 AND ' +
               'RL.SN_SEMPRE_REENVIAR = 0) AND ' +
         'M1.CD_MENSALIDADE = ?';

   S_SQL_DEL_REM_MYSQL =
      'DELETE FROM REM_DADOS ' +
      'USING ' +
         'REM_DADOS ' +
         'JOIN REM_OCORRENCIAS ' +
            'JOIN REM_LAYOUTS ON ' +
               '(REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA) ' +
      'WHERE ' +
         'REM_DADOS.SN_ENVIADO = 0 AND ' +
         'REM_OCORRENCIAS.SN_ATIVO = 1 AND ' +
         'REM_OCORRENCIAS.CD_ACAO = :CD_ACAO AND ' +
         'REM_DADOS.CD_MENSALIDADE = :CD_MENSALIDADE %s';

   S_SQL_DEL_REM_MYSQL_AGRUP =
      'DELETE FROM REM_DADOS ' +
      'USING ' +
      ' MENSALIDADES AS m1 '+
      ' INNER JOIN mensalidades as m2 ON (m2.cd_boleto = m1.cd_boleto AND m2.cd_resp = m1.cd_resp) '+
      ' INNER JOIN REM_DADOS ON (REM_DADOS.CD_MENSALIDADE = m2.cd_mensalidade) '+
      ' INNER JOIN REM_OCORRENCIAS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_DADOS.CD_LAYOUT AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA  ) '+
      ' INNER JOIN REM_LAYOUTS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT) '+
      'WHERE ' +
         'REM_DADOS.SN_ENVIADO = 0 AND ' +
         'REM_OCORRENCIAS.SN_ATIVO = 1 AND ' +
         'REM_OCORRENCIAS.CD_ACAO = :CD_ACAO AND ' +
         'm1.CD_MENSALIDADE = :CD_MENSALIDADE %s';

   S_SQL_DEL_REM_ORACLE =
      'DELETE FROM REM_DADOS ' +
      'WHERE EXISTS (' +
         '  SELECT                                 '+
         '     REM_OCORRENCIAS.CD_REM_OCORRENCIA   '+
         '  FROM                                   '+
         '		REM_OCORRENCIAS,                    '+
         '		REM_LAYOUTS                         '+
			'  WHERE                                  '+
         '  REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT  '+
         '	AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA'+
			'	AND REM_DADOS.SN_ENVIADO = 0                               '+
			'	AND REM_OCORRENCIAS.SN_ATIVO = 1                           '+
         '	AND REM_OCORRENCIAS.CD_ACAO = :CD_ACAO                     '+
			'	AND REM_DADOS.CD_MENSALIDADE = :CD_MENSALIDADE             '+
      ')';

   S_SQL_DEL_REM_ORACLE_AGRUP =
      'DELETE FROM REM_DADOS ' +
      'WHERE EXISTS (' +
         '  SELECT                                 '+
         '     REM_OCORRENCIAS.CD_REM_OCORRENCIA   '+
         '  FROM '+
      ' MENSALIDADES AS m1 '+
      ' INNER JOIN mensalidades as m2 ON (m2.cd_boleto = m1.cd_boleto AND m2.cd_resp = m1.cd_resp) '+
      ' INNER JOIN REM_DADOS ON (REM_DADOS.CD_MENSALIDADE = m2.cd_mensalidade) '+
      ' INNER JOIN REM_OCORRENCIAS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_DADOS.CD_LAYOUT AND REM_OCORRENCIAS.CD_OCORRENCIA = REM_DADOS.CD_OCORRENCIA  ) '+
      ' INNER JOIN REM_LAYOUTS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT) '+
      'WHERE ' +
         'REM_DADOS.SN_ENVIADO = 0 AND ' +
         'REM_OCORRENCIAS.SN_ATIVO = 1 AND ' +
         'REM_OCORRENCIAS.CD_ACAO = :CD_ACAO AND ' +
         'm1.CD_MENSALIDADE = :CD_MENSALIDADE ';

   S_SQL_DEBITO =
   '  SELECT                                                               '+
   '    sn_autoriza_debito                                                 '+
   '  FROM                                                                 '+
   '    pessoas_debito_automatico pda                                      '+
   '    INNER JOIN mensalidades m ON ( pda.cd_pessoa      = m.codigoaluno) '+
   '  WHERE                                                                '+
   '    m.cd_mensalidade = :cd_mensalidade                                 ';

   function GetSQLDeleteDadosByProtocol: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_DEL_REM_ORACLE
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_DEL_REM_MYSQL;
   end;

   function GetSQLDeleteDadosByProtocol_AGRUP: string;
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         Result := S_SQL_DEL_REM_ORACLE_AGRUP
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         Result := S_SQL_DEL_REM_MYSQL_AGRUP;
   end;

var
   iAcao: Integer;
   sAux: string;
   qyEx: TUMZQuery;   
   qryGetDDA : TUMZQuery;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   DM.CriarConsulta(qyEx);
   DM.CriarConsulta(qryGetDDA);

   Result := False;

   case Acao of
       arBaixa: iAcao := 0;
       arCancelar: iAcao := 1;
       arDesconto: iAcao := 2;
       arProtestar: iAcao := 3;
       arEstornar: iAcao := 4;
       arAltMensalidade: iAcao := 5;
       arNegociar: iAcao := 6;
       arProrrogar: iAcao := 7;
       arImpBoleto: iAcao := 8;
       arGerarMensalidade: iAcao := 9;
       arBaixaDDA: iAcao         := 100;
       arCancelamentoDDA: iAcao  := 101;
   end;

   // Se não for Impressão de boletos ou Geração de Títulos, ou seja, é algum
   // tipo de alteração ou baixa, então, verificar se ja foi gerada a remessa
   // anteriormente de Geração ou impressão, pois não pode dar baixa se o
   // título não foi registrado.
   if not (Acao in [arGerarMensalidade, arImpBoleto]) then begin
      with qyEx do begin

         // Verificar se tem registro de ENVIO de ação de REMESSA (Geração e impressão de boletos)
         Close();
         Params.Clear();
         SQL.Clear();
         SQL.Add(''+
         '  SELECT                 '+
         '     rd.cd_layout, COUNT(*) as conta   '+
         '  FROM                   '+
         '     rem_dados rd        '+
         '     INNER JOIN rem_ocorrencias ro ON (rd.cd_ocorrencia = ro.cd_ocorrencia AND rd.cd_layout = ro.cd_layout)   '+
         '  WHERE                  ');
         IF (sListaMensa <> '') THEN BEGIN
            SQL.Add('     rd.cd_mensalidade IN (' + sListaMensa + ')');
         END ELSE BEGIN
            SQL.Add('     rd.cd_mensalidade = ' + IntToStr(iCodMensalidade) + ' ');
         END;
         SQL.Add('     AND (ro.cd_acao = 9 OR ro.cd_acao = 8)        '+
         '     AND (rd.sn_enviado = 1) ' +
         '  GROUP BY                                         '+
         '     rd.cd_layout                                  '+
         '');
         Open();
         sAux := ' AND REM_OCORRENCIAS.CD_LAYOUT IN (-1';
         if not IsEmpty then begin
            while not Eof do begin

               if (FieldByName('conta').AsInteger > 0) then begin
                  sAux := sAux + ', ' + FieldByName('cd_layout').AsString;
               end;

               Next();
            end;

         end else begin
            // Nunca foi enviado registro de títulos.
            // Verificar então se estão enviando uma baixa de mensalidade, neste caso, não permitir.
            if Acao = arBaixa then begin
               //  Excluir qualquer remessa de registro de títulos, pois o título já foi baixado antes do registro
               Try
                  Close();
                  Params.Clear();
                  SQL.Clear();
                  SQL.Add(''+
                  '  DELETE rd.*                 '+
                  '  FROM                   '+
                  '     rem_dados rd        '+
                  '     INNER JOIN rem_ocorrencias ro ON (rd.cd_ocorrencia = ro.cd_ocorrencia AND rd.cd_layout = ro.cd_layout)   '+
                  '  WHERE                  '+
                  '     rd.cd_mensalidade = ' + IntToStr(iCodMensalidade) + ' '+
                  '     AND (ro.cd_acao = 9 OR ro.cd_acao = 8)        '+
                  '     AND (rd.sn_enviado = 0) ' +
                  '');
                  ExecSQL();
               Except

               end;
            end;
         end;


         sAux := sAux + ')';
         Close();
      end; //with
   end
   else begin

      // A Impressão ou geração envia o título para Remessa. Então, deve ser
      // verificado se o mesmo ja está registrado. Isso se faz comparando a
      // existencia do mesmo na REMESSA e também no RETORNO do título

      // Alterado para verificar em todas as parcelas de um boleto agrupado.
      // Se uma delas foi impressa, não reenviar.
      
      Stmt := PrepareStatement(SSQLSelectItens);
      try
         Stmt.SetInt(1, iCodMensalidade);

         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
            begin
               Result := False;
               Exit;
            end;
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;

      sAux := '';
   end;

   // Se a ação for de baixa verificar se existe algum envio em aberto daquela mensalidade
   if Acao in [arBaixa] then begin
      with qryDelRemDados do begin
         ParamByName('CD_MENSALIDADE').AsInteger := iCodMensalidade;
         ParamByName('CD_ACAO').AsInteger := iAcao;
         ParamByName('SN_ENVIADO').AsInteger := 0;
         ExecSQL();
      end;
   end;

   with qyEx do begin
      qyEx.Close();
      qyEx.Params.Clear();
      qyEx.SQL.Clear();

      // Verificar se tem conta financeira padrão no cadastro de turmas

      qyEx.SQL.Add(
      ' SELECT          ' +
      '   ME.CD_CAIXA AS ME_CAIXA, T.CD_CAIXA AS TU_CAIXA' +
      ' FROM            ' +
      '   TURMAS T INNER JOIN MENSALIDADES ME  ' +
      '    ON (ME.TURMA = T.CODIGO AND ME.ANOSEMESTRE = T.ANOSEMESTRE) ' +
      ' WHERE   ' +
      '    ME.CD_MENSALIDADE = ' + IntToStr(iCodMensalidade) +  ' AND ' +
      '   ((T.CD_CAIXA IS NOT NULL AND T.CD_CAIXA > 0) OR ME.CD_CAIXA IS NOT NULL)' +
      '');

      qyEx.Open();

      if not EOF then begin

         sAux := sAux + ' AND REM_LAYOUTS.CD_CAIXA IN (-1';

         while not Eof do begin
               if not (qyEx.FieldByName('ME_CAIXA').IsNull) then begin
                  sAux := sAux + ', ' + qyEx.FieldByName('ME_CAIXA').AsString;
               end
               else begin
                  sAux := sAux + ', ' + qyEx.FieldByName('TU_CAIXA').AsString;
               end;
               qyEx.Next();
         end;

         sAux := sAux + ')';

      end;

      //LIMPA DADOS
      // Esta ação vai limpar as ocorrências de mesma ação não enviada ainda, para inserir o novo pedido abaixo
      Close();
      Params.Clear();
      SQL.Clear();
      IF ForcarAgrupado THEN BEGIN
         SQL.Text := Format(GetSQLDeleteDadosByProtocol_AGRUP, [sAux]);
      end else begin
         SQL.Text := Format(GetSQLDeleteDadosByProtocol, [sAux]);;
      end;
      ParamByName('CD_MENSALIDADE').AsInteger := iCodMensalidade;
      ParamByName('CD_ACAO').AsInteger := iAcao;
      try
         ExecSQL();
      except
      end;

      //INSERE
      Close();
      Params.Clear();
      SQL.Clear();

      qryGetDDA.Close;
      qryGetDDA.SQL.Text := S_SQL_DEBITO;
      qryGetDDA.ParamByName('cd_mensalidade').AsInteger := iCodMensalidade ;
      qryGetDDA.Open;

      // Se for solicitado forcar boleto então deve inserir TODOS os registros vinculados ao boleto
      // Isso vai ocorrer nas telas de impressão de boletos para ações de remessa ou alterações
      IF ForcarAgrupado THEN BEGIN

            SQL.Add(''+      
            'INSERT INTO REM_DADOS                                                        '+
            '	(CD_LAYOUT, CD_OCORRENCIA, CD_MENSALIDADE, DT_ACAO, SN_ENVIADO) '+      
            ' ( SELECT        ' +
            '   REM_OCORRENCIAS.CD_LAYOUT, REM_OCORRENCIAS.CD_OCORRENCIA, m2.cd_mensalidade, NOW() AS DT_ACAO, 0 AS SN_ENVIADO ' +
            ' FROM   '+
            ' MENSALIDADES AS m1 '+
            ' INNER JOIN mensalidades as m2 ON (m2.cd_boleto = m1.cd_boleto AND m2.cd_resp = m1.cd_resp) '+
            ' INNER JOIN REM_OCORRENCIAS ON (REM_OCORRENCIAS.CD_ACAO = ' + IntToStr(iAcao) + ') '+
            ' INNER JOIN REM_LAYOUTS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT) '+
            ' WHERE REM_OCORRENCIAS.SN_ATIVO = 1 '+
            ' AND REM_LAYOUTS.cd_origem <>  3 '+
            ' AND m1.cd_mensalidade = '+ IntToStr(iCodMensalidade) +    
            '  '+ sAux + ')   '+  
            '');      

      END ELSE BEGIN      

            SQL.Add(''+
            'INSERT INTO REM_DADOS                                                        '+
            '	(CD_LAYOUT, CD_OCORRENCIA, CD_MENSALIDADE, DT_ACAO, SN_ENVIADO) '+
            ' (SELECT         ' +
            '  REM_OCORRENCIAS.CD_LAYOUT, REM_OCORRENCIAS.CD_OCORRENCIA, '+ IntToStr(iCodMensalidade) +', NOW() AS DT_ACAO, 0 AS SN_ENVIADO ' +
            ' FROM   ' +
            '   REM_OCORRENCIAS INNER JOIN REM_LAYOUTS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT) ' +
            ' WHERE REM_OCORRENCIAS.SN_ATIVO = 1 AND ' +
            '    REM_OCORRENCIAS.CD_ACAO = ' + IntToStr(iAcao) +
            '    AND REM_LAYOUTS.cd_origem <>  3 '+
            '  '+ sAux + ')   '+
            '');

      END;
      Sql.ADD('');

      try
         ExecSQL();
         SQL.Text := '';
         if ( qryGetDDA.FieldByName('sn_autoriza_debito').AsInteger = 1 ) then
         begin
           SQL.Add(''+
           'INSERT INTO REM_DADOS                                                        '+
           '	(CD_LAYOUT, CD_OCORRENCIA, CD_MENSALIDADE, DT_ACAO, SN_ENVIADO) '+
           ' (SELECT         ' +
           '  REM_OCORRENCIAS.CD_LAYOUT, REM_OCORRENCIAS.CD_OCORRENCIA, '+ IntToStr(iCodMensalidade) +', NOW() AS DT_ACAO, 0 AS SN_ENVIADO ' +
           ' FROM   ' +
           '   REM_OCORRENCIAS INNER JOIN REM_LAYOUTS ON (REM_OCORRENCIAS.CD_LAYOUT = REM_LAYOUTS.CD_LAYOUT) ' +
           ' WHERE REM_OCORRENCIAS.SN_ATIVO = 1 AND ' +
           '    REM_OCORRENCIAS.CD_ACAO = ' + IntToStr(iAcao) +
           '    AND REM_LAYOUTS.cd_origem = 3  '+
           ') ');
           ExecSQL();
         end;
         
         Result := True;
      except
         Result := False;
      end;
      Close();
      SQL.Clear();
   end;
   FreeAndNil(qryGetDDA);
end;

Procedure TDM.gerar_log_acesso(cd_modulo: integer; sn_acessou,sn_incluiu,sn_alterou,sn_excluiu: string);
Begin

  qyLogsAcessos.Close;
  qyLogsAcessos.ParamByName('cd_usuario').AsInteger := 0;
  qyLogsAcessos.Open;
  qyLogsAcessos.Insert;
  qyLogsAcessos.FieldByName('cd_modulo').AsInteger := cd_modulo;
  qyLogsAcessos.FieldByName('sn_acessou').AsString := sn_acessou;
  qyLogsAcessos.FieldByName('sn_incluiu').AsString := sn_incluiu;
  qyLogsAcessos.FieldByName('sn_alterou').AsString := sn_alterou;
  qyLogsAcessos.FieldByName('sn_excluiu').AsString := sn_excluiu;
  qyLogsAcessos.Post;
  qyLogsAcessos.Close;

End;

function TDM.RecordToJSON(DataSet: TDataSet): TlkJSONobject;
var
   I: Integer;
   Field: TField;
begin
   Result := TlkJSONobject.Create(False);
   for I := 0 to DataSet.FieldCount - 1 do
   begin
      Field := DataSet.Fields[I];
      case Field.DataType of
         ftUnknown, ftString, ftDate, ftTime, ftDateTime, ftMemo,
         ftWideString, ftVariant, ftTimeStamp, ftFixedWideChar, ftWideMemo:
            Result.Add(Field.FieldName, Field.AsString);
         ftSmallint, ftInteger, ftWord, ftLargeint:
            Result.Add(Field.FieldName, Field.AsInteger);
         ftBoolean:
            Result.Add(Field.FieldName, Field.AsBoolean);
         ftFloat:
            Result.Add(Field.FieldName, Field.AsFloat);
         ftCurrency:
            Result.Add(Field.FieldName, Field.AsCurrency);
         ftBlob, ftOraBlob:
            Result.Add(Field.FieldName, MD5Print(MD5String(Field.AsString)));
      end;
   end;
end;

Procedure TDM.RegistraObservacoes(campo: TField; Observacao: String);
begin

  campo.AsString := campo.AsString + CHR(13) + '==============================================' + CHR(13) + Observacao + CHR(13) + '--------------------------------------------------------' + CHR(13) + 'DATA: ' + DateTimeToStr(DataHoje) + '  USUÁRIO: ' + DM.sLogin;

end;

procedure TDM.SalvaColigada(SenderCombo: TObject);
const
   SQL_INSERE_ULTIMA_COLIGADA = ''+
      ' REPLACE INTO usuarios_parametros (cd_usuario, ds_parametro, ds_valor) '+
      ' VALUES (:cd_usuario, :ds_parametro, :ds_valor) ';   
var
   componente: TComponent;
   nome, separador: String;
   qryInsereUltimaColigadaSelecionada: TUMZQuery;
begin

   if TUMComboBox(SenderCombo).ItemIndex = 0 then
   begin
      Exit;
   end;

   nome := '';
   separador := '';

   componente := TUMComboBox(SenderCombo).Owner;

   while componente.Name <> '' do
   begin
      if componente.Name <> '' then
      begin
         nome := nome + separador + componente.Name;
      end;

      separador := '.';

      componente := componente.Owner;
   end;

   nome := nome + separador + TUMComboBox(SenderCombo).Name;

   TLoginManager.GetInstancia().GetDM.CriarConsulta(qryInsereUltimaColigadaSelecionada);

   with qryInsereUltimaColigadaSelecionada do
   begin
      SQL.Clear;
      SQL.Text := SQL_INSERE_ULTIMA_COLIGADA;

      ParamByName('cd_usuario').AsInteger :=
         DM.GetUsuarioLogado.Pessoa.Codigo;

      ParamByName('ds_parametro').AsString :=
         nome;

      ParamByName('ds_valor').AsString :=
         IntToStr(TColigada(TUMComboBox(SenderCombo).Items.Objects[TUMComboBox(SenderCombo).ItemIndex]).Codigo);

      ExecSQL;
   end;

end;

procedure TDM.MostraLog(cd_modulo,cd_titulo,cd_caixa,nr_sequencia: integer; dt_movimento: TDateTime; Popup: TPopupMenu);
var
  Item: TMenuItem;
begin
  Popup.Items.Clear;

  DM.qyAux1.Close;
  DM.qyAux1.SQL.Clear;
  DM.qyAux1.SQL.Add('SELECT                                 ');
  DM.qyAux1.SQL.Add('	u.nome,                               ');
  DM.qyAux1.SQL.Add('	l.dt_log,                             ');
  DM.qyAux1.SQL.Add('	l.hr_log                              ');
  DM.qyAux1.SQL.Add('FROM                                   ');
  DM.qyAux1.SQL.Add('	logs_financeiro l,                    ');
  DM.qyAux1.SQL.Add('	usuarios u                            ');
  DM.qyAux1.SQL.Add('WHERE                                  ');
  DM.qyAux1.SQL.Add('	(u.codigo = l.cd_usuario) AND (       ');
  DM.qyAux1.SQL.Add('	(l.cd_modulo = :cd_modulo) AND (      ');
  DM.qyAux1.SQL.Add('	(                                     ');
  DM.qyAux1.SQL.Add('	l.cd_caixa = :cd_caixa AND            ');
  DM.qyAux1.SQL.Add('	l.dt_movimento = :dt_movimento AND    ');
  DM.qyAux1.SQL.Add('	l.nr_sequencia = :nr_sequencia        ');
  DM.qyAux1.SQL.Add('	) OR (                                ');
  DM.qyAux1.SQL.Add('	l.cd_titulo = :cd_titulo AND          ');
  DM.qyAux1.SQL.Add('	l.nr_sequencia = :nr_sequencia        ');
  DM.qyAux1.SQL.Add('	)))                                   ');
  DM.qyAux1.ParamByName('cd_modulo').AsInteger := cd_modulo;
  DM.qyAux1.ParamByName('cd_titulo').AsInteger := cd_titulo;
  DM.qyAux1.ParamByName('cd_caixa').AsInteger := cd_caixa;
  DM.qyAux1.ParamByName('nr_sequencia').AsInteger := nr_sequencia;
  DM.qyAux1.ParamByName('dt_movimento').AsString := FormatDateTime('yyyy-mm-dd', dt_movimento);
  DM.qyAux1.Open;

  if not DM.qyAux1.eof then
  begin
    Item := TMenuItem.Create(self);
    Item.Caption := 'Usuário: ' + DM.qyAux1.FieldByName('nome').AsString;
    Popup.Items.Add(Item);
    Item := TMenuItem.Create(self);
    Item.Caption := 'Data: ' + DM.qyAux1.FieldByName('dt_log').AsString;
    Popup.Items.Add(Item);
    Item := TMenuItem.Create(self);
    Item.Caption := 'Hora: ' + DM.qyAux1.FieldByName('hr_log').AsString;
    Popup.Items.Add(Item);
  end;

end;

Function TDM.ProximoId2(campo_increment, campo_condicao, tabela: string; filtro: integer): integer;
const
   SQL_PROXIMO_ID_2 =
      'SELECT MAX(%s) AS id FROM %s WHERE %s = :filtro';
var
   qyProximoID2 : TUMZReadOnlyQuery;
begin
   CriarConsulta(qyProximoID2);

   qyProximoID2.SQL.Text := Format(SQL_PROXIMO_ID_2, [ campo_increment, tabela, campo_condicao ]);
   qyProximoID2.ParamByName('filtro').AsInteger := filtro;
   qyProximoID2.Open;

   Result := qyProximoID2.FieldByName('id').AsInteger + 1;

   FreeAndNil(qyProximoID2);
end;


function TDM.DefineNumeroMatricula(sTurma: string; iAnoSem: Integer): LongInt;
var
   iNum: LongInt;
begin
    iNum := 0;
    with qAux2 do begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT (MAX(nr_aluno)+1) as nro from matriculas ');
      SQL.Add(' WHERE turma = :CdTurma AND anosemestre = :NrAnoSem ');

      ParamByName('CdTurma').AsString := sTurma;
      ParamByName('NrAnoSem').AsInteger := iAnoSem;
      Open();

      if not IsEmpty then begin
         iNum := FieldByName('nro').AsInteger;
      end;
      Close();
    end;
    Result := iNum;
end;

{ **
   Calcula o rateio do critério de apropriação para os centros de custo com base
   na quantidade de matrículas por centro de custo.
}
procedure TDM.DefineRateioApropriacaoPorMatriculas(const AICodApropriacao,
  AIAnoSemestre: integer);
const
   // Agrupa o total de matrículas agrupados pelo centro de custo e coligada
   SQL_GET_MATRICULAS =
      'SELECT '+
         't.cd_centro,'+
         't.cd_coligada,'+
         'COUNT(*) total '+
      'FROM '+
         'matriculas m '+
            'JOIN turmas t ON '+
               '(m.anosemestre = t.anosemestre) AND '+
               '(m.turma = t.codigo) '+
            'JOIN situacao s ON '+
               '(m.situacao = s.cd_situacao)'+
      'WHERE '+
         'm.anosemestre = :nr_anosemestre AND '+
         'NOT t.cd_centro IS NULL AND '+
         's.cd_situacao_pai IN (1, 2) '+
      'GROUP BY '+
         't.cd_centro, t.cd_coligada';

   // Zera os valores dos critérios
   SQL_UPDATE_ZERA_PERCENTUAIS =
      'UPDATE fin_criterios_apropria_itens '+
      'SET vl_apropriacao = 0 '+
      'WHERE cd_apropriacao = :cd_apropriacao';

   // Atualizao rateio do critério para o centro de custo
   SQL_UPDATE_VLS_APROPRIA =
      'UPDATE fin_criterios_apropria_itens '+
      'SET vl_apropriacao = :vl_apropriacao '+
      'WHERE '+                                                              
         'cd_apropriacao = :cd_apropriacao AND '+
         'cd_centro = :cd_centro AND '+
         'cd_coligada = :cd_coligada';
var
   LQyGetMatriculas, LQyAtuVlsApropria: TUMZQuery;
   LITotalMatriculas: integer;
begin
   DM.CriarConsulta(LQyGetMatriculas);
   try
      // Pega as matrículas agrupadas pelo centro de custo
      LQyGetMatriculas.SQL.Text := SQL_GET_MATRICULAS;
      LQyGetMatriculas.ParamCheck := true;
      LQyGetMatriculas.ParamByName('nr_anosemestre').AsInteger := AIAnoSemestre;
      LQyGetMatriculas.Open;
      // Zera os percentuais atuais rateados para os centros
      DM.CriarConsulta(LQyAtuVlsApropria);
      try
         LQyAtuVlsApropria.SQL.Text := SQL_UPDATE_ZERA_PERCENTUAIS;
         LQyAtuVlsApropria.ParamCheck := true;
         LQyAtuVlsApropria.ParamByName('cd_apropriacao').AsInteger := AICodApropriacao;
         LQyAtuVlsApropria.ExecSQL;
         // Verifica se há registros
         if not LQyGetMatriculas.IsEmpty then
         begin
            // Inicializa SQL
            LQyAtuVlsApropria.SQL.Text := SQL_UPDATE_VLS_APROPRIA;
            LQyAtuVlsApropria.ParamByName('cd_apropriacao').AsInteger := AICodApropriacao;
            LITotalMatriculas := 0;
            // Cálcula o total de matrículas encontradas com centros de custo
            while not LQyGetMatriculas.Eof do
            begin
               Inc(LITotalMatriculas, LQyGetMatriculas.FieldByName('total').AsInteger);
               LQyGetMatriculas.Next;
            end;
            // Volta ao primeiro registro da Query
            LQyGetMatriculas.First;
            while not LQyGetMatriculas.Eof do
            begin
               // Para cada centro de custo, atualiza o valor percentual do rateio
               LQyAtuVlsApropria.ParamByName('cd_centro').AsInteger :=
                  LQyGetMatriculas.FieldByName('cd_centro').AsInteger;
               LQyAtuVlsApropria.ParamByName('cd_coligada').AsInteger :=
                  LQyGetMatriculas.FieldByName('cd_coligada').AsInteger;
               LQyAtuVlsApropria.ParamByName('vl_apropriacao').AsFloat :=
                  LQyGetMatriculas.FieldByName('total').AsFloat * 100 / LITotalMatriculas;
               LQyAtuVlsApropria.ExecSQL;
               LQyGetMatriculas.Next;
            end;
         end;
      finally
         FreeAndNil(LQyAtuVlsApropria);
      end;
   finally
      LQyGetMatriculas.Close;
      FreeAndNil(LQyGetMatriculas);
   end;
end;

function TDM.DefinirHistoricoCaixa(iCodigoMensalidade: Integer;
  sParametroHistorico: String): string;
var
  sDescricao : String;
  sDsParcela : String;
begin
   // Retorna a string para lançamento do caixa
   // [cd_pessoa], [nm_pessoa], [nm_responsavel], [nr_parcela], [dt_vencimento] e [ds_parcela]

   sDescricao := sParametroHistorico;

   qyAux2.Close;
   qyAux2.SQL.Clear;
   qyAux2.SQL.Add(
   ' SELECT                           ' +
   '    pe.cd_pessoa,                 ' +
   '    pe.nm_pessoa,                 ' +
   '    re.nm_pessoa nm_responsavel,  ' +
   '    me.parcela,                   ' +
   '    me.datavencimento,            ' +
   'me.TURMA,' +
   'me.CURSO,' +
   'me.ANOSEMESTRE,' +
   '    tp.ds_tipo_titulo             ' +
   ' FROM                             ' +
   '    mensalidades me               ' +
   '    INNER JOIN coligadas c ON (c.cd_coligada = me.cd_coligada) ' +
   '    INNER JOIN pessoas pe ON (me.codigoaluno = pe.cd_pessoa) ' +
   '    LEFT JOIN pessoas re ON (pe.cd_resp_finan = re.cd_pessoa) ' +
   '    INNER JOIN fin_tipos_titulo tp ON (me.cd_tipo_titulo = tp.cd_tipo_titulo AND c.cd_coligada_matriz = tp.cd_coligada_matriz) '+
   ' WHERE   ' +
   '    me.cd_mensalidade = :CdMensalidade '
   );

   qyAux2.ParamByName('CdMensalidade').AsInteger := iCodigoMensalidade;

   qyAux2.Open();

   if qyAux2.Eof then begin
      sParametroHistorico := 'MENSALIDADE ' + IntToStr(iCodigoMensalidade);
   end
   else begin
      sDsParcela := qyAux2.FieldByName('ds_tipo_titulo').AsString;

      if sDsParcela = '' then
         sDsParcela := 'MENSALIDADE';

      sParametroHistorico := ReplaceStr(sParametroHistorico, '[cd_pessoa]',      qyAux2.FieldByName('cd_pessoa').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[nm_pessoa]',      qyAux2.FieldByName('nm_pessoa').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[nm_responsavel]', qyAux2.FieldByName('nm_responsavel').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[nr_parcela]',     qyAux2.FieldByName('parcela').AsString);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[dt_vencimento]',  qyAux2.FieldByName('datavencimento').AsString);
      sParametroHistorico := StringReplace(sParametroHistorico, '[CD_TURMA]', qyAux2.FieldByName('TURMA').AsString, [rfReplaceAll, rfIgnoreCase]);
      sParametroHistorico := StringReplace(sParametroHistorico, '[CD_CURSO]', qyAux2.FieldByName('CURSO').AsString, [rfReplaceAll, rfIgnoreCase]);
      sParametroHistorico := StringReplace(sParametroHistorico, '[NR_ANOSEMESTRE]', qyAux2.FieldByName('ANOSEMESTRE').AsString, [rfReplaceAll, rfIgnoreCase]);
      sParametroHistorico := ReplaceStr(sParametroHistorico, '[ds_parcela]',     sDsParcela);
   end;

   Result := sParametroHistorico;

end;

function TDM.CarregaSituacoes(var slDados: TStringList; iModulo: Integer;
  sitMostra: TStrSituacoes): Boolean;
var
   sMostra: string;
begin
   //inicializa sldados
   if slDados = nil then begin
      slDados := TStringList.Create();
   end;

   //carrega a situacao
   case sitMostra of
      sitDescricao: sMostra := 'ds_valor';
      sitSigla: sMostra := 'ds_sigla';
      sitTexto: sMostra := 'me_descricao';
      sitCodigo: sMostra := 'cd_situacao';
      else sMostra := 'ds_valor';
   end;

   //carrega do sql
   with DM.qyAux1 do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      '   SELECT                                   '+
      '      cd_situacao, '+sMostra+'              '+
      '   FROM                                     '+
      '      situacoes                             '+
      '   WHERE                                    '+
      '      cd_modulo = '+IntToStr(iModulo)+'     '+
      '');
      Open();

      if not IsEmpty then begin
         slDados.Clear();
         while not Eof do begin
            slDados.Add(FieldByName('cd_situacao').AsString + '='+FieldByName(sMostra).AsString);
            Next();
         end;
         Result := True;
      end
      else begin
         slDados.Clear();
         Result := False;
      end;

   end;
end;

procedure TDM.qyLogsAcessosAfterInsert(DataSet: TDataSet);
begin

  qyLogsAcessos.FieldByName('dt_log').AsDateTime := DataHoje;
  qyLogsAcessos.FieldByName('hr_log').AsDateTime := Time;
  qyLogsAcessos.FieldByName('cd_usuario').AsInteger := dm.iCdPessoaLogado;

end;

function TDM.ConectaUnimestre: boolean;
const
   S_MSG_SEMCONEXAO = 'Ocorreu um erro na tentativa de efetuar conexão com o banco de dados do UNIMESTRE: %s';
var
   LConnIni: TIniFile;
begin
   LConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');
   try
      if db.Connected then
         db.Disconnect;

      if LConnIni.ReadInteger( 'Configuracoes', 'EfeitosVisuais', 0 ) = 0 then
         db.SQLHourGlass := false
      else
         db.SQLHourGlass := true;

      db.HostName := LConnIni.ReadString('Conexao', 'Servidor', 'localhost');
      db.Database := LConnIni.ReadString('Conexao', 'Banco', 'unimestre');
      db.User := LConnIni.ReadString('Conexao', 'Usuario', 'academico');
      db.Password := TUMCriptografia.UMCrypt(LConnIni.ReadString('Conexao', 'Senha', 'C946E11A2BA225D2095C9F5683EF5590BF'), ctDecode);
      db.Port := LConnIni.ReadInteger('Conexao', 'Porta', 3306);
      db.Protocol := LConnIni.ReadString('Conexao', 'Protocolo', 'mysql-5');
      try
         db.Connect;
      except
         on E: Exception do
            Mensagem(Format(S_MSG_SEMCONEXAO, [E.Message]), 'Erro', MB_ICONERROR);
      end;
      Result := db.Connected;
   finally
      FreeAndNil(LConnIni);
   end;
end;

function TDM.ConectaUnimestreDocs: boolean;
var
   LConnIni: TIniFile;
begin
   Result := False;
   LConnIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\unimestre.ini');

   if LConnIni.SectionExists(StartConnDocs.IniProps.SectionName) then
   begin
      StartConnDocs.Active := LConnIni.ReadBool('Conexao', 'Usa.Start', False);
      StartConnDocs.IniPath := ExtractFilePath(ParamStr(0)) + '\unimestre.ini';
      try
         StartConnDocs.ConnectUnimestre;
         Result := DM.dbDocs.Connected;
      except
         on E: Exception do
            Result := False;
      end;
   end;
end;

function TDM.ContaBoletoPadrao(iDepto: Integer; sTurma: String; iAnoSemestre: Integer): String;
var
  qyNN : TUMZQuery;
begin

    CriarConsulta(qyNN);
    qyNN.Close();

       // Pesquisar o NN a partir do cd_caixa no cadastro de turmas
    qyNN.SQL.Text :=
      ' SELECT fcc.cd_caixa, fcc.cd_coligada FROM fin_cadastro_contas fcc ' +
      ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa) ' +
      ' WHERE t.codigo = ' + QuotedStr(sTurma) + ' AND t.anosemestre = ' + IntToStr(iAnoSemestre);
    qyNN.Open();

    if not qyNN.Eof then begin
       result := qyNN.FieldByName('cd_caixa').AsString;
    end else
    begin  // Pesquisar o NN a partir do cd_bloqueto_padrao nos departamentos
       qyNN.Close();
       qyNN.SQL.Text :=
         ' SELECT fcc.cd_caixa, fcc.cd_coligada FROM fin_cadastro_contas fcc ' +
         ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao) ' +
         ' WHERE d.codigo = ' + IntToStr(iDepto);
       qyNN.Open();

       if not qyNN.Eof then begin
          result := qyNN.FieldByName('cd_caixa').AsString ;
       end else begin
          Result := '';
       end

    end;

    FreeAndNil(qyNN);

end;

function TDM.convertDateTimeToDate(data: TDateTime): TDateTime;
begin
   Result := TGeneral.DateTimeToDate(data);
end;

function TDM.ConverteCambio(iMoedaBase, iMoedaCambio : integer; dCambio : TDateTime; cValor : Currency; ParaMoedaBase : Boolean = false) : Currency;
var
   qyCambio : TUMZQuery;
   Valor : Currency;
begin

   CriarConsulta(qyCambio);

   // Tentar selecionar o cambio mais próximo - menor igual a data indicada

   qyCambio.SQL.Text :=
     ' SELECT * FROM fin_moedas_cotacoes ' +
     ' WHERE cd_moeda_base = ' + IntToStr(iMoedaBase) +
     '   AND cd_moeda_cota = ' + IntToStr(iMoedaCambio) +
     '   AND dt_cotacao <= ''' + FormatDateTime('yyyy-mm-dd', dCambio) + ''' '+
     ' ORDER BY dt_cotacao DESC ' +
     ' LIMIT 1 ';

   qyCambio.Open();

   if qyCambio.IsEmpty then begin

      Mensagem('Nenhum câmbio cadastrado para esta moeda', 'Anteção', MB_OK + MB_ICONWARNING);

      result := cValor;

      Exit

   end;

   if (qyCambio.FieldByName('dt_cotacao').AsDateTime <> dCambio) then begin

      Mensagem('Não existe câmbio para esta moeda em ' + FormatDateTime('dd/mm/yyyy', dCambio) + '.' +
      ' Será utilizado o cambio de ' + FormatDateTime('dd/mm/yyyy', qyCambio.FieldByName('dt_cotacao').AsDateTime),
      'Atenção', MB_OK + MB_ICONWARNING);

   end;

   if qyCambio.FieldByName('vl_moeda_cota').AsCurrency > 0 then begin

       if not ParaMoedaBase then begin

          Valor := cValor / qyCambio.FieldByName('vl_moeda_cota').AsCurrency;

       end else begin

          Valor := cValor * qyCambio.FieldByName('vl_moeda_cota').AsCurrency;

       end;

   end else begin

      Valor := 0;  

   end;


   result := Valor;


end;

function TDM.ConverterNullEmZero(sFormula: string): String;
var
   sNovaFormula : String;
   i : word;
begin
   // Converter os campos da fórmula em ISNULL

   sNovaFormula := lowercase(sFormula);

   For i := 25 downto 1 do begin
      sNovaFormula := ReplaceStr(sNovaFormula, 'nota' + IntToStr(i), 'COALESCE(!nota!'+IntToStr(i)+',0)');
   end;
   sNovaFormula := ReplaceStr(sNovaFormula, '!nota!', 'nota');
   sNovaFormula := ReplaceStr(sNovaFormula, 'ajuste','COALESCE(ajuste,0)');

   result := sNovaFormula

end;

function TDM.NomeDoBoleto(iDepto: Integer; sTurma: String;
  iAnoSemestre: Integer; Caixa : String = ''): String;
Var
  strAux : String;
  qyNN : TUMZQuery;
  iConta : Integer;
begin

    CriarConsulta(qyNN);
    qyNN.Close();

    if Caixa <> '' then begin

       if Pos('=', Caixa) > 0 then begin

         iConta := StrToInt( Copy(Caixa, 1, Pos('=',Caixa)-1) );

       end else begin

         iConta := StrToInt(Caixa);

       end;

       qyNN.SQL.Text :=
         ' SELECT fcc.nm_arquivo_bloqueto FROM fin_cadastro_contas fcc ' +
         ' WHERE fcc.cd_caixa = ' + IntToStr(iConta);

       // Retirada a coligada do caixa
       //   +  '   AND fcc.cd_coligada = ' + Copy(Caixa, Pos('=',Caixa)+1, length(Caixa));

       qyNN.Open();

       strAux := qyNN.FieldByName('nm_arquivo_bloqueto').AsString;

       strAux := strAux + '.rpt';

       Result := strAux;

       Exit; 

    end;

    // Pesquisar o NN a partir do cd_caixa no cadastro de turmas
    qyNN.SQL.Text :=
      ' SELECT fcc.nm_arquivo_bloqueto FROM fin_cadastro_contas fcc ' +
      ' INNER JOIN turmas t ON (fcc.cd_caixa = t.cd_caixa ) ' +
      ' WHERE t.codigo = ' + QuotedStr(sTurma) + ' AND t.anosemestre = ' + IntToStr(iAnoSemestre);
    qyNN.Open();

    if not qyNN.Eof then begin
       strAux := qyNN.FieldByName('nm_arquivo_bloqueto').AsString;
    end else
    begin
       qyNN.Close();
       qyNN.SQL.Text :=
         ' SELECT fcc.nm_arquivo_bloqueto FROM fin_cadastro_contas fcc ' +
         ' INNER JOIN departamentos d ON (fcc.cd_caixa = d.cd_boleto_padrao) ' +
         ' WHERE d.codigo = ' + IntToStr(iDepto);
       qyNN.Open();

       if not qyNN.Eof then begin
          strAux := qyNN.FieldByName('nm_arquivo_bloqueto').AsString;
       end else begin
          strAux := 'repBloquetos';
       end

    end;


    strAux := strAux + '.rpt';

    Result := strAux;

end;

function TDM.getDataBloqueioPrestacaoConta(dataTitulo: TDateTime): TDateTime;
{Essa função verifica se a data do título está em um periodo onde o sistema
financeiro se encontra bloqueado. Retorna a data do bloqueio do periodo.}
var
   nr_mes                  : integer;
   nr_ano                  : integer;
   iColigada               : String;
   sMesAno                 : String;
   cd_prestacao_contas     : integer;
   zPrestacaoConta         : TUMZQuery;
   zPrestacaoContaAgrupada : TUMZQuery;
   dt_provisoria           : TDateTime;
   sn_agrupa_financeiro    : string;
   nr_ultimo_dia_mes       : integer;
   DataUltimoDia           : TDateTime;
begin

   iColigada :=  IntToStr(Self.GetUsuarioLogado.GetColigadaLogada.Codigo); 

   //separa o mes e o ano de acordo com a data do título
   nr_mes      := MonthOf( dataTitulo );
   nr_ano      := YearOf( dataTitulo );

   //monta o mes/ano para consulta na prestação de contas.
   sMesAno     := Concat(FormatFloat( '00', nr_mes ),'/',FormatFloat( '0000', nr_ano ));

   //Recupera a ultima mensagem do periodo referente a data do título e verifica
   //a data de bloqueio provisório.
   cd_prestacao_contas   := Self.getCdUltimaMsgPrestacaoConta( sMesAno, iColigada );

   Self.CriarConsulta( zPrestacaoConta );
   zPrestacaoConta.SQL.Text := 'SELECT dt_bloqueio_provisorio FROM fin_prestacao_contas WHERE cd_prestacao_contas = :cd_prestacao_contas';
   zPrestacaoConta.ParamByName('cd_prestacao_contas').AsInteger := cd_prestacao_contas;
   zPrestacaoConta.Open();

   dt_provisoria := zPrestacaoConta.FieldByName('dt_bloqueio_provisorio').AsDateTime;

   
   FreeAndNil( zPrestacaoConta );

   Result  := dt_provisoria;
end;

function TDM.GetDB: TZConnection;
begin
   Result := Self.db;
end;

function TDM.getEtapaAtual(iPadrao: Integer = 1): Integer;
var
   iValor: Integer;
begin
   iValor := iPadrao;
   with Self.qyAux1 do begin
      try
         Close();
         SQL.Clear();
         Params.Clear();
         SQL.Text := 'SELECT nr_etapa as etapa FROM diario_prazos WHERE dt_envio_inicio < NOW() AND dt_envio_fim > NOW() AND cd_curso =  '''' AND cd_turma = '''' ORDER BY nr_anosemestre DESC';
         Open();

         if not IsEmpty then begin
            iValor := FieldByName('etapa').AsInteger;
         end;
         Close();

      except
         iValor := iPadrao;
         Close();
      end;
   end;
   Result := iValor;
end;

function TDM.getFeriado(data:TDateTime): Boolean;
Var
  dia, mes, ano :Word;
begin

  DecodeDate(data, ano, mes, dia);
  
  tblFeriadosMatriz.Close;
  tblFeriadosMatriz.ParamByName('dia').AsInteger := dia;
  tblFeriadosMatriz.ParamByName('mes').AsInteger := mes;
  tblFeriadosMatriz.ParamByName('ano').AsInteger := ano;
  tblFeriadosMatriz.ParamByName('coligada').AsInteger := UsuarioLogado.GetColigadaLogada.Codigo;
  tblFeriadosMatriz.Open;

  Result := (NOT DM.tblFeriadosMatriz.EOF);
end;

function TDM.getFinPrestacaoContaAberto(mes_ano, cd_coligada: string): Boolean;
var
   zPrestacaoConta      : TUMZQuery;
   cd_prestacao_conta   : integer;
   sn_aberto            : integer;
begin
   cd_prestacao_conta   := Self.getCdUltimaMsgPrestacaoConta( mes_ano, cd_coligada );
   sn_aberto            := 0;

   Self.CriarConsulta( zPrestacaoConta );
   
   zPrestacaoConta.SQL.Text := 'SELECT sn_aberto from fin_prestacao_contas '+
   'WHERE cd_prestacao_contas = :cd_prestacao_conta AND cd_coligada = :cd_coligada';
   zPrestacaoConta.ParamByName('cd_prestacao_conta').AsInteger :=
   cd_prestacao_conta;
   zPrestacaoConta.ParamByName('cd_coligada').AsString := cd_coligada;
   zPrestacaoConta.Open();

   if zPrestacaoConta.RecordCount > 0 then
   begin
      sn_aberto := zPrestacaoConta.FieldByName('sn_aberto').AsInteger;
   end;

   FreeAndNil( zPrestacaoConta );

   if sn_aberto = 1 then
   begin
      Result := true; //aberto
   end
   else
   begin
      Result := false; //fechado
   end;
end;

function TDM.GetProvasCadastradas(const ASTurma: string; const AIAnoSemestre,
  AIDisciplina, AIBimestre: integer): string;
begin
   Self.QyProvas.ParamByName('turma').AsString := ASTurma;
   Self.QyProvas.ParamByName('anosemestre').AsInteger := AIAnoSemestre;
   Self.QyProvas.ParamByName('disciplina').AsInteger := AIDisciplina;
   Self.QyProvas.ParamByName('bimestre').AsInteger := AIBimestre;
   Self.QyProvas.Open;
   Result := Self.QyProvas.FieldByName('provas').AsString;
   Self.QyProvas.Close;
end;

procedure TDM.montarPlanilha(Grade : TDBGrid; dsChave: String);
const
   SQL_MONTAR_PLANILHA =
      ' SELECT '+
      '     ds_coluna, '+
      '     nr_tamanho '+
      '  FROM '+
      '     nu_planilhas '+
      '  WHERE '+
      '     cd_pessoa = :cd_pessoa '+
      '     AND ds_chave = :ds_chave '+
      '  ORDER BY '+
      '     nr_ordem ASC ';
var
   qryCamposPlanilha: TUMZQuery;

   lstCampos: TStringList;

   count,
   i: Integer;
begin
   { TODO -cManutenção -oJosimar Zimermann : Modificar o primeiro parâmetro do método para o tipo TDBGridColumns, permitindo que método seja acionado por componentes TDBGrid e TZSortedGrid }
   criarConsulta(qryCamposPlanilha);

   qryCamposPlanilha.SQL.Text := SQL_MONTAR_PLANILHA;
   qryCamposPlanilha.ParamByName('cd_pessoa').AsInteger := Self.GetUsuarioLogado.Pessoa.Codigo;
   qryCamposPlanilha.ParamByName('ds_chave').AsString := dsChave;
   qryCamposPlanilha.Open;

   if qryCamposPlanilha.RecordCount = 0 then
   begin
      lstCampos := TStringList.Create ;

      SplitString(Self.variavel_parametro(dsChave), ';', lstCampos) ;

      if lstCampos.Count = 0 then
      begin
         Exit;
      end;

      Grade.Columns.Clear ;

      for i := 0 To lstCampos.Count -1 do
      begin
         Grade.Columns.Add;
         Grade.Columns[i].FieldName := lstCampos[i];
      end;

      Exit;
   end;

   count := 0;

   Grade.Columns.Clear;

   while not qryCamposPlanilha.Eof do
   begin
      Grade.Columns.Add;
      Grade.Columns[count].FieldName := qryCamposPlanilha.FieldByName('ds_coluna').AsString;
      Grade.Columns[count].Width := qryCamposPlanilha.FieldByName('nr_tamanho').AsInteger;

      Inc(count);
      qryCamposPlanilha.Next;
   end;
end;

procedure TDM.setLog(cd_modulo: integer; operacao: string; chave : string = ''; coligada : integer = 0;ds_observacoes: string = '');
var
   ALogBDE: TLogBDE;
begin
   ALogBDE := TLogBDE.getLogger(DB);
   ALogBDE.setLog(DM.iCdPessoaLogado, cd_modulo, operacao, chave, coligada, ds_observacoes);
end;

procedure TDM.tblMensalidadesBeforeOpen(DataSet: TDataSet);
begin
   qyTitulosReceita.Close();
   qyTitulosReceita.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qyTitulosReceita.Open();
end;

procedure TDM.ApropriaCR(Movimento: Integer; ApagarAntes : Boolean = false);
var
  qyUtil : TUMZQuery;
  qyAcao : TUMZQuery;
  iContaJuros : Integer;
begin

  CriarConsulta(qyUtil);
  CriarConsulta(qyAcao);

  if ApagarAntes then begin
     qyUtil.SQL.Text := ' DELETE FROM fin_apropria_te WHERE cd_movimento_te = ' + IntToStr(Movimento);
//     ' AND cd_coligada = ' + IntToStr(iColigadaSelecionada);

     qyUtil.ExecSQL();
  end;

  qyUtil.SQL.Text :=
   ' SELECT me.cd_coligada, mt.vl_movimento, mt.cd_movimento_te, me.cd_plano_conta, me.cd_centro_custo from fin_mov_tesouraria mt  ' +
   '  INNER JOIN mensalidades me ON ( mt.cd_mensalidade = me.cd_mensalidade )  ' +
   '  WHERE mt.cd_movimento_te = ' + IntToStr(Movimento);
//   '    AND me.cd_coligada = ' + IntToStr(DM.iColigadaSelecionada);

  qyUtil.Open();

  if not qyUtil.EOF then begin

     // Aqui está sento apropriado o valor líquido

     qyAcao.SQL.Text :=
      ' INSERT INTO fin_apropria_te (cd_movimento_te, cd_conta, cd_coligada, cd_centro, vl_movimento) ' +
      ' VALUES (:cd_movimento_te, :cd_conta, :cd_coligada, :cd_centro, :vl_movimento) ';

     qyAcao.ParamByName('cd_movimento_te').AsInteger :=  Movimento;
     qyAcao.ParamByName('cd_conta').AsInteger     := qyUtil.FieldByName('cd_plano_conta').AsInteger;
     qyAcao.ParamByName('cd_centro').AsInteger    := qyUtil.FieldByName('cd_centro_custo').AsInteger;
     qyAcao.ParamByName('cd_coligada').AsInteger  := qyUtil.FieldByName('cd_coligada').AsInteger;

     iContaJuros := 0;

     if Dm.variavel_parametro('plano_contas_juros_recebidos') <> '' then begin
        iContaJuros := StrToInt(Dm.variavel_parametro('plano_contas_juros_recebidos'));
     end;

     if iContaJuros <> 0 then begin
        qyAcao.ParamByName('vl_movimento').AsFloat := qyUtil.FieldByName('vl_movimento').AsFloat - DM.tblMensalidadesValorJuros.AsFloat;
     end else begin
        qyAcao.ParamByName('vl_movimento').AsFloat := qyUtil.FieldByName('vl_movimento').AsFloat;
     end;

     qyAcao.ExecSQL();

     if (iContaJuros <> 0) AND (DM.tblMensalidadesValorJuros.AsFloat > 0) then begin

        // Aqui será apropriado os juros/multa recebidos

        qyAcao.ParamByName('cd_movimento_te').AsInteger :=  Movimento;
        qyAcao.ParamByName('cd_conta').AsInteger        := iContaJuros;
        qyAcao.ParamByName('cd_centro').AsInteger       := qyUtil.FieldByName('cd_centro_custo').AsInteger;
        qyAcao.ParamByName('cd_coligada').AsInteger     := qyUtil.FieldByName('cd_coligada').AsInteger;
        qyAcao.ParamByName('vl_movimento').AsFloat      := DM.tblMensalidadesValorJuros.AsFloat;

        qyAcao.ExecSQL();

     end;

  end;

  FreeAndNil(qyAcao);
  FreeAndNil(qyUtil);

end;
{
Função que retorna todos os grupos que a pessoa faz parte
}
function TDM.getGrupoAtividade(nr_anosemestre: Integer; cd_curso,
  cd_turma: String; cd_disciplina, cd_pessoa: Integer): Integer;
const
   SQL_GRUPO_ATIVIDADE =
      'SELECT '+
      '  COALESCE(dgp.cd_grupo, 0) cd_grupo '+
      'FROM '+
      '  diario_grupos dg '+
      '  INNER JOIN diario_grupos_pessoas dgp ON (dg.cd_grupo = dgp.cd_grupo AND dgp.dt_saida IS NULL) '+
      'WHERE '+
      '  dg.nr_anosemestre = :nr_anosemestre AND '+
      '  dg.cd_curso LIKE :cd_curso AND '+
      '  dg.cd_turma LIKE :cd_turma AND '+
      '  dg.cd_disciplina = :cd_disciplina AND '+
      '  dgp.cd_pessoa = :cd_pessoa';
var
   qyGruposAtividade : TUMZReadOnlyQuery;
begin
   CriarConsulta(qyGruposAtividade);
   qyGruposAtividade.SQL.Text := SQL_GRUPO_ATIVIDADE;

   qyGruposAtividade.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyGruposAtividade.ParamByName('cd_curso').AsString := cd_curso;
   qyGruposAtividade.ParamByName('cd_turma').AsString := cd_turma;
   qyGruposAtividade.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyGruposAtividade.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyGruposAtividade.Open;

   Result := 0;
   if not qyGruposAtividade.Eof then
   begin
      Result := qyGruposAtividade.FieldByName('cd_grupo').AsInteger;
   end;

   FreeAndNil(qyGruposAtividade);
end;

function TDM.getGrupos(cd_pessoa : integer): TStringList;
const
   SQL_GRUPOS_PESSOA =
      'SELECT DISTINCT cd_grupo FROM nu_grupos_pessoas WHERE cd_pessoa = :cd_pessoa';
var
   qyGruposPessoa : TUMZReadOnlyQuery;
begin
   Result := TStringList.Create;

   CriarConsulta(qyGruposPessoa);
   qyGruposPessoa.SQL.Text := SQL_GRUPOS_PESSOA;

   qyGruposPessoa.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyGruposPessoa.Open;

   while not qyGruposPessoa.Eof do
   begin
      Result.Add(qyGruposPessoa.FieldByName('cd_grupo').AsString);
      qyGruposPessoa.Next;
   end;

   FreeAndNil(qyGruposPessoa);
end;

function TDM.GetNextAnoSemestre: Integer;
begin
   Result := GetAnoSemestreAtual;

   if ano_semestre_incremento = 1 then
   begin
      if (Result mod 2) = 0 then
      begin
         Inc(Result, 9);
      end
      else
         Inc(Result);
   end
   else
      Inc(Result, 10);   
end;

function TDM.getNomeCaixa(cd_caixa: Integer): String;
var
  qyUtil : TUMZReadOnlyQuery;
begin
  CriarConsulta(qyUtil);
  
  qyUtil.SQL.text := 'SELECT ds_caixa FROM fin_cadastro_contas WHERE cd_caixa = :cd_caixa';
  qyUtil.ParamByName('cd_caixa').AsInteger := cd_caixa;

  qyUtil.Open();

  Result := qyUtil.FieldByName('ds_caixa').AsString;

end;

function TDM.getNomeColigadaSelecionada: String;
begin
   Result := UsuarioLogado.GetColigadaLogada().Nome;
end;

function TDM.getNomeColigadaSelecionadaRazao: String;
begin
   Result := UsuarioLogado.GetColigadaLogada().RazaoSocial;   
end;

function TDM.getNroProximaProva(nr_anosemestre: Integer; cd_turma: String;
  cd_disciplina, cd_bimestre: Integer): Integer;
const
   SQL_NR_PROVAS =
   'SELECT '+
   '   MAX( nro_nota ) + 1 as nro_nota'+
   ' FROM '+
   '   diario_provas '+
   ' WHERE '+
   '   anosemestre = :nr_anosemestre '+
   '   AND turma LIKE :cd_turma '+
   '   AND disciplina = :cd_disciplina '+
   '   AND bimestre = :cd_bimestre '+
   '  AND ( sn_especial = 0 OR sn_especial IS NULL ) '+
   ' ORDER BY '+
   '  nro_nota ASC ';
var
   iNroProxProva : Integer;
   qyNroProvas: TUMZQuery;
begin
   DM.CriarConsulta(qyNroProvas);

   qyNroProvas.SQL.Text := SQL_NR_PROVAS;

   qyNroProvas.Close;
   qyNroProvas.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNroProvas.ParamByName('cd_turma').AsString := cd_turma;
   qyNroProvas.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNroProvas.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNroProvas.Open;

   // Inicia a váriavel de retorno com 1 (número da próxima prova)
   iNroProxProva := qyNroProvas.FieldByName('nro_nota').AsInteger;

   if iNroProxProva = 0 then
   begin
     iNroProxProva := 1
   end;

   // Retorna o número da aula
   getNroProximaProva := iNroProxProva;

end;

function TDM.getParametroPorColigadaNaoLogada(variavel,cd_coligada: string): string;
const
   SQL_GET_PARAMETRO =
      ' SELECT DS_VALOR FROM PARAMETROS ' +
      ' WHERE (CD_COLIGADA = :CD_COLIGADA) AND ' +
      '       DS_VARIAVEL = :DS_VARIAVEL ' +
      ' ORDER BY CD_COLIGADA DESC LIMIT 1 ';
var
   qyGetParametro: TUMZReadOnlyQuery;
begin
   Result := '';

   CriarConsulta(qyGetParametro);

   qyGetParametro.SQL.Text := SQL_GET_PARAMETRO;
   qyGetParametro.ParamByName('CD_COLIGADA').AsString := cd_coligada;
   qyGetParametro.ParamByName('DS_VARIAVEL').AsString := variavel;

   qyGetParametro.Open;

   Result := qyGetParametro.FieldByName('DS_VALOR').AsString;

   FreeAndNil(qyGetParametro);
end;

function TDM.getPorcentagemReprovacaoAluno(cd_pessoa: Integer;
  cd_curso: String): Double;
  
const
   SQL_QTD_REPROVADAS =
      ' SELECT ' +
      '     count(f.disciplina) AS qtd_reprovadas ' +
      ' FROM ' +
      '     fichaindividual f ' +
      ' INNER JOIN situacao s ON (f.situacao = s.cd_situacao) ' +
      ' WHERE ' +
      '     f.curso = :curso ' +
      '     AND f.codigoaluno = :codigoaluno ' +
      '     AND s.cd_situacao_pai = 9 ' +
      '     AND FCD_CURSOU_DISCIPLINA(f.codigoaluno, f.curso, f.disciplina, f.serie) = 0 ' ;

   SQL_TOTAL_GRADE =
      ' SELECT ' +
      '     count(gd.CD_DISCIPLINA) AS qtd_disciplinas ' +
      ' FROM ' +
      '     matriculas_curso mc ' +
      ' INNER JOIN grades_disciplinas gd ON ( ' +
      '     gd.CD_GRADE = mc.cd_grade ' +
      '     AND gd.CD_CURSO = mc.cd_curso ' +
      ' ) ' +
      ' WHERE ' +
      '     mc.cd_pessoa = :cd_pessoa ' +
      '     AND mc.cd_curso = :cd_curso ' ;
var
   qyQtdReprovadas, qyTotalGrade: TUMZReadOnlyQuery;
begin
   Self.CriarConsulta(qyQtdReprovadas);
   Self.CriarConsulta(qyTotalGrade);

   qyQtdReprovadas.SQL.Text := SQL_QTD_REPROVADAS;

   qyQtdReprovadas.ParamByName('curso').AsString := cd_curso;
   qyQtdReprovadas.ParamByName('codigoaluno').AsInteger := cd_pessoa;

   qyQtdReprovadas.Open;

   qyTotalGrade.SQL.Text := SQL_TOTAL_GRADE;

   qyTotalGrade.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyTotalGrade.ParamByName('cd_curso').AsString := cd_curso;

   qyTotalGrade.Open;

   if(qyTotalGrade.FieldByName('qtd_disciplinas').AsInteger = 0) then
   begin
      result := 0;
   end else begin
      Result := (qyQtdReprovadas.FieldByName('qtd_reprovadas').AsInteger * 100) / qyTotalGrade.FieldByName('qtd_disciplinas').AsInteger;
   end;

   FreeAndNil(qyQtdReprovadas);
   FreeAndNil(qyTotalGrade);   
end;

procedure TDM.recalcularDescCondicionalAcoesMovimento(iCodigoMensalidade: Integer; cDescontoCondicionalOriginal, cNovoDescontoCondicionalParcela: Double; atualizarDescontoPrevisto: Boolean; restauraDesconto:Boolean);
const
   SQL_UPDATE_MOV_CR = ' UPDATE fin_mov_cr SET '+
                       '   vl_desconto_previsto = CASE WHEN :atualizar_previsto > 0 THEN vl_desconto ELSE vl_desconto_previsto END, '+
                       '   vl_desconto = :vl_desconto, '+
                       '   vl_perc_desc_cond = :vl_percent '+
                       ' WHERE '+
                       '   cd_mensalidade = :cd_mensalidade AND cd_mensalidade_origem = :cd_mensalidade_origem AND '+
                       '   cd_coligada = :cd_coligada AND nr_sequencia = :nr_sequencia';

   SQL_GET_ACOES_MOVIMENTO = '' +
      ' SELECT ' +
      '   mcr.cd_mensalidade, mcr.cd_mensalidade_origem, '+
      '   mcr.cd_coligada, mcr.nr_sequencia, '+
      '   mcr.vl_desconto, ' +
      '   mcr.vl_perc_desc_cond '+
      ' FROM ' +
      '   fin_mov_cr mcr '+
      '   INNER JOIN fin_acoes_movimento am ON (mcr.cd_acao = am.cd_acao) ' +
      ' WHERE ' +
      '   mcr.cd_mensalidade_origem = :cd_mensalidade AND am.cd_tipo_acao = 3 AND mcr.sn_desc_condicional = 1 ' +
      ' ORDER BY ' +
      '   mcr.nr_sequencia ';
var
   qyAtualizarAcao, qyAcao: TUMZQuery;
   porcDescCondicional, cIndicePercentual, cValorMovimentacoes, cValorEntrada,
   cNovoDesconto: Double;
   sLog, sChaveLog: String;
   descExtra: Boolean;
begin

   // Criar consultas que serão utilizadas para a ação de recalculo dos descontos condicionais
   DM.CriarConsulta(qyAtualizarAcao);
   DM.CriarConsulta(qyAcao);

   // Monta SQL para atualizar o valor de uma ação de movimento quando aplicado desconto condicional proporcional
   qyAtualizarAcao.SQL.Text := SQL_UPDATE_MOV_CR;

   // Busca as ações de movimento do desconto condicional da parcela para fazer o ajuste proporcional
   qyAcao.Close;
   qyAcao.SQL.Clear;
   qyAcao.SQL.Text := SQL_GET_ACOES_MOVIMENTO;
   qyAcao.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAcao.Open;

   // Verifica se existe uma ação de movimento (desconto condicional) vinculada ao desconto atribuído,
   // se não existir deve criar uma quando o valor do condicional é maior que zero
   if qyAcao.Eof and (cNovoDescontoCondicionalParcela > 0) then
   begin

      // Cria a ação automática de desconto condicional
      DM.criarAcaoAutomaticaDescontoCondicional(iCodigoMensalidade, cNovoDescontoCondicionalParcela);

   end;

   {
      Se não existe ação de movimento ou o desconto condicional original for igual a zero
      Não continua o procedimento
   }
   if qyAcao.Eof or ((cDescontoCondicionalOriginal = 0) AND NOT(restauraDesconto)) then Exit;

   // Calcula o percentual para aplicar nas ações de movimento, com base no condicional novo em relacao ao antigo
   cIndicePercentual := 1;
   if(cDescontoCondicionalOriginal > 0) then
   begin
      cIndicePercentual := RoundFloat(((cNovoDescontoCondicionalParcela * 100) / cDescontoCondicionalOriginal)/100, 2);
   end;

   // Variavel vai armazenar a soma dos descontos das ações de movimento menos a última
   cValorMovimentacoes := 0;

   // Varre as ações de movimento para aplicar os indices de desconto
   while not qyAcao.Eof do
   begin
      // Seta a chave primária para o UPDATE
      qyAtualizarAcao.Close;
      qyAtualizarAcao.ParamByName('cd_mensalidade_origem').AsInteger := qyAcao.FieldByName('cd_mensalidade_origem').AsInteger;
      qyAtualizarAcao.ParamByName('cd_mensalidade').AsInteger := qyAcao.FieldByName('cd_mensalidade').AsInteger;
      qyAtualizarAcao.ParamByName('cd_coligada').AsInteger := qyAcao.FieldByName('cd_coligada').AsInteger;
      qyAtualizarAcao.ParamByName('nr_sequencia').AsInteger := qyAcao.FieldByName('nr_sequencia').AsInteger;
      qyAtualizarAcao.ParamByName('atualizar_previsto').AsInteger := 0;
      // Verifica se deve atualizar o valor do desconto previsto ou manter o que possui no campo
      if atualizarDescontoPrevisto then
      begin
         qyAtualizarAcao.ParamByName('atualizar_previsto').AsInteger := 1;
      end;

      // Gera log da alteração dos descontos na log geral
      sChaveLog := qyAcao.FieldByName('cd_mensalidade').AsString + ';' + qyAcao.FieldByName('cd_coligada').AsString + ';' + qyAcao.FieldByName('nr_sequencia').AsString;
      sLog := 'Ajuste da ação de movimento para o novo valor devido alteração do desconto condicional.'+#13+
              'Valor anterior: '+qyAcao.FieldByName('vl_desconto').AsString+', Valor novo: '+FloatToStr(RoundFloat(qyAcao.FieldByName('vl_desconto').AsCurrency * cIndicePercentual, 2))+', '+
              'Indice diferença (%): '+CurrToStr(cIndicePercentual)+
              '[cd_mensalidade: '+qyAcao.FieldByName('cd_mensalidade').AsString+','+
              ' cd_coligada: '+qyAcao.FieldByName('cd_coligada').AsString+','+
              ' nr_sequencia: '+qyAcao.FieldByName('nr_sequencia').AsString+'] ';
      DM.setLog(2020, 'Alteracao', sChaveLog, qyAcao.FieldByName('cd_coligada').AsInteger, sLog);

      {  Se a ação é a última aplicada o cálculo dela é a diferença do total - as ações já aplicadas
         O cálculo é realizado dessa maneira para tratar a diferença de centavos (na ultima ação de movimento) }
      if qyAcao.RecNo = qyAcao.RecordCount then
      begin
         cNovoDesconto := cNovoDescontoCondicionalParcela - cValorMovimentacoes;
      end else begin
         // Cálcula o proporcional das ações de movimento para incluir o novo valor na ação de movimento
         cNovoDesconto := qyAcao.FieldByName('vl_desconto').AsFloat * cIndicePercentual;
      end;

      // Atualiza o valor das porcentagens de desconto com base no valor de entrada da mensalidade na fin_mov_cr
      cValorEntrada := Self.getValorEntradaAcaoMensalidade(qyAcao.FieldByName('cd_mensalidade').AsInteger);

      // Calcula porcentagem de desconto fixo/Condicional da mensalidade atual
      porcDescCondicional := qyAcao.FieldByName('vl_perc_desc_cond').AsFloat;

      //Se o desconto está zerado mas a porcentagem não temos de restaurar o desconto
      descExtra := false;
      if((cNovoDesconto = 0) AND (porcDescCondicional > 0) AND (cValorEntrada > 0) ) then
      begin
         cNovoDesconto := porcDescCondicional * cValorEntrada / 100;
         descExtra := true;
      end;

      //Atualiza com o novo desconto
      qyAtualizarAcao.ParamByName('vl_desconto').AsFloat := RoundFloat(cNovoDesconto, 2);

      // Soma o valor que será aplicado aos valores já aplicados (para realizar o cálculo do valor da ultima ação de movimento)
      cValorMovimentacoes := cValorMovimentacoes + cNovoDesconto;

      //Se tiver valor para ser feito o calculo
      if(cValorEntrada > 0) and not(descExtra) then
      begin
         porcDescCondicional := ((100 * cNovoDesconto) / cValorEntrada);
      end;
      qyAtualizarAcao.ParamByName('vl_percent').AsFloat := porcDescCondicional;
     
      // Aplica o novo desconto condicional (proporcional)
      qyAtualizarAcao.ExecSQL;

      if qyAcao.RecNo = qyAcao.RecordCount then
      begin
         Break;
      end;

      qyAcao.Next;
   end;

end;


procedure TDM.recalcularDescFixoAcoesMovimento(iCodigoMensalidade: Integer; cDescontoFixoOriginal, cNovoDescontoFixoParcela: Double; atualizarDescontoPrevisto: Boolean = True; restauraDesconto:Boolean = false);
const
   SQL_UPDATE_MOV_CR =
        ' UPDATE fin_mov_cr SET '+
        '   vl_desconto_previsto = CASE WHEN :atualizar_previsto > 0 THEN vl_saida ELSE vl_desconto_previsto END, '+
        '   vl_saida = :vl_saida, '+
        '   vl_perc_desc_fixo = :vl_percent '+
        ' WHERE '+
        '   cd_mensalidade = :cd_mensalidade AND cd_mensalidade_origem = :cd_mensalidade_origem AND '+
        '   cd_coligada = :cd_coligada AND nr_sequencia = :nr_sequencia';

   SQL_GET_ACOES_MOVIMENTO =
      ' SELECT ' +
      '   mcr.cd_mensalidade, mcr.cd_mensalidade_origem, '+
      '   mcr.cd_coligada, mcr.nr_sequencia, '+
      '   mcr.vl_saida, ' +
      '   mcr.vl_perc_desc_fixo '+
      ' FROM ' +
      '   fin_mov_cr mcr '+
      '   INNER JOIN fin_acoes_movimento am ON (mcr.cd_acao = am.cd_acao) ' +
      ' WHERE ' +
      '   mcr.cd_mensalidade_origem = :cd_mensalidade AND am.cd_tipo_acao = 3 AND mcr.sn_desc_condicional = 0 ' +
      ' ORDER BY ' +
      '   mcr.nr_sequencia ';
var
   qyAtualizarAcao, qyAcao: TUMZQuery;
   cIndicePercentual, cValorMovimentacoes, cValorEntrada,
   porcDescCondicional, cNovoDesconto: Currency;
   sLog, sChaveLog: String;
   descExtra: Boolean;
begin

   // Criar consultas que serão utilizadas para a ação de recalculo dos descontos Fixos
   DM.CriarConsulta(qyAtualizarAcao);
   DM.CriarConsulta(qyAcao);

   // Monta SQL para atualizar o valor de uma ação de movimento quando aplicado desconto Fixo proporcional
   qyAtualizarAcao.SQL.Text := SQL_UPDATE_MOV_CR;

   // Busca as ações de movimento do desconto Fixo da parcela para fazer o ajuste proporcional
   qyAcao.Close;
   qyAcao.SQL.Clear;
   qyAcao.SQL.Text := SQL_GET_ACOES_MOVIMENTO;
   qyAcao.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAcao.Open;

   // Verifica se existe uma ação de movimento (desconto Fixo) vinculada ao desconto atribuído,
   // se não existir deve criar uma quando o valor do Fixo é maior que zero
   if qyAcao.Eof and (cNovoDescontoFixoParcela > 0) then
   begin
      // Cria a ação automática de desconto condicional
      DM.criarAcaoAutomaticaDescontoFixo(
         iCodigoMensalidade,
         cNovoDescontoFixoParcela
      );
   end;

   {
      Se não existe ação de movimento ou o desconto fixo original for igual a zero
      Não continua o procedimento
   }
   if qyAcao.Eof or ((cDescontoFixoOriginal = 0) AND NOT(restauraDesconto)) then Exit;

   // Calcula o percentual para aplicar nas ações de movimento, com base no fixo novo em relacao ao antigo
   cIndicePercentual := 1;
   if(cDescontoFixoOriginal > 0) then
   begin
      cIndicePercentual := RoundFloat(((cNovoDescontoFixoParcela * 100) / cDescontoFixoOriginal)/100, 2);
   end;

   // Variavel vai armazenar a soma dos descontos das ações de movimento menos a última
   cValorMovimentacoes := 0;

   // Varre as ações de movimento para aplicar os indices de desconto
   while not qyAcao.Eof do
   begin
      // Seta a chave primária para o UPDATE
      qyAtualizarAcao.Close;
      qyAtualizarAcao.ParamByName('cd_mensalidade_origem').AsInteger := qyAcao.FieldByName('cd_mensalidade_origem').AsInteger;
      qyAtualizarAcao.ParamByName('cd_mensalidade').AsInteger := qyAcao.FieldByName('cd_mensalidade').AsInteger;
      qyAtualizarAcao.ParamByName('cd_coligada').AsInteger := qyAcao.FieldByName('cd_coligada').AsInteger;
      qyAtualizarAcao.ParamByName('nr_sequencia').AsInteger := qyAcao.FieldByName('nr_sequencia').AsInteger;
      qyAtualizarAcao.ParamByName('atualizar_previsto').AsInteger := 0;
      // Verifica se deve atualizar o valor do desconto previsto ou manter o que possui no campo
      if atualizarDescontoPrevisto then
      begin
         qyAtualizarAcao.ParamByName('atualizar_previsto').AsInteger := 1;
      end;

      // Gera log da alteração dos descontos na log geral
      sChaveLog := qyAcao.FieldByName('cd_mensalidade').AsString + ';' + qyAcao.FieldByName('cd_coligada').AsString + ';' + qyAcao.FieldByName('nr_sequencia').AsString;
      sLog := 'Ajuste da ação de movimento para o novo valor devido alteração do desconto Fixo.'+#13+
              'Valor anterior: '+qyAcao.FieldByName('vl_saida').AsString+', Valor novo: '+FloatToStr(RoundFloat(qyAcao.FieldByName('vl_saida').AsCurrency * cIndicePercentual, 2))+', '+
              'Indice diferença (%): '+CurrToStr(cIndicePercentual)+
              '[cd_mensalidade: '+qyAcao.FieldByName('cd_mensalidade').AsString+','+
              ' cd_coligada: '+qyAcao.FieldByName('cd_coligada').AsString+','+
              ' nr_sequencia: '+qyAcao.FieldByName('nr_sequencia').AsString+'] ';
              
      DM.setLog(2020, 'Alteracao', sChaveLog, qyAcao.FieldByName('cd_coligada').AsInteger, sLog);

      {  Se a ação é a última aplicada o cálculo dela é a diferença do total - as ações já aplicadas
         O cálculo é realizado dessa maneira para tratar a diferença de centavos (na ultima ação de movimento) }
      if qyAcao.RecNo = qyAcao.RecordCount then
      begin
         cNovoDesconto := RoundFloat(cNovoDescontoFixoParcela - cValorMovimentacoes, 2);
      end else begin
         // Cálcula o proporcional das ações de movimento para incluir o novo valor na ação de movimento
         cNovoDesconto := RoundFloat(qyAcao.FieldByName('vl_saida').AsCurrency * cIndicePercentual, 2);;
      end;

      // Atualiza o valor das porcentagens de desconto com base no valor de entrada da mensalidade na fin_mov_cr
      cValorEntrada := Self.getValorEntradaAcaoMensalidade(qyAcao.FieldByName('cd_mensalidade').AsInteger);

      // Calcula porcentagem de desconto fixo/Condicional da mensalidade atual
      porcDescCondicional := qyAcao.FieldByName('vl_perc_desc_fixo').AsFloat;

      //Se o desconto está zerado mas a porcentagem não temos de restaurar o desconto
      descExtra := false;
      if((cNovoDesconto = 0) AND (porcDescCondicional > 0) AND (cValorEntrada > 0) ) then
      begin
         cNovoDesconto := RoundFloat(((porcDescCondicional * cValorEntrada) / 100),2);
         descExtra := true;
      end;

      //Atualiza com o novo desconto
      qyAtualizarAcao.ParamByName('vl_saida').AsCurrency := cNovoDesconto;

      // Soma o valor que será aplicado aos valores já aplicados (para realizar o cálculo do valor da ultima ação de movimento)
      cValorMovimentacoes := cValorMovimentacoes + cNovoDesconto;

      //Se tiver valor para ser feito o calculo
      if(cValorEntrada > 0) and not(descExtra) then
      begin
         porcDescCondicional := RoundFloat(((100 * cNovoDesconto) / cValorEntrada),2);
      end;
      qyAtualizarAcao.ParamByName('vl_percent').AsFloat := porcDescCondicional;
     
      // Aplica o novo desconto Fixo (proporcional)
      qyAtualizarAcao.ExecSQL;

      if qyAcao.RecNo = qyAcao.RecordCount then
      begin
         Break;
      end;

      qyAcao.Next;
   end;

end;

procedure TDM.criarAcaoAutomaticaDescontoCondicional(iCodigoMensalidade: Integer; cNovoDescontoCondicionalParcela: Currency);
const
   SQL_DADOS_MENSALIDADE = '' +
      ' SELECT ' +
      '   DISTINCT m.cd_mensalidade_origem, m.cd_coligada ' +
      ' FROM ' +
      '   mensalidades m ' +
      '   LEFT JOIN fin_mov_cr cr ON ( '+
      '         ((cr.cd_mensalidade_origem = m.cd_mensalidade) OR (cr.cd_mensalidade_origem IS NULL AND cr.cd_mensalidade = m.cd_mensalidade)) AND '+
      '         cr.cd_coligada = m.cd_coligada AND '+
      '         cr.sn_desc_condicional = 1 '+
      '   ) '+
      ' WHERE ' +
      '   m.cd_mensalidade = :cd_mensalidade AND '+
      '   m.situacao != 7 AND ' +
      '   cr.cd_mensalidade IS NULL '+
      ' LIMIT 1';
var
   qyDadosMensalidade: TUMZQuery;
   iAcaoDescontoCondicionalPadrao: Integer;
   movimento: TMovimento;
begin

   // Criar consultas que serão utilizadas para a ação de recalculo dos descontos condicionais
   DM.CriarConsulta(qyDadosMensalidade);

   // Busca dados da mensalidade para criação da ação de movimento
   qyDadosMensalidade.Close;
   qyDadosMensalidade.SQL.Text := SQL_DADOS_MENSALIDADE;
   qyDadosMensalidade.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyDadosMensalidade.Open;

   // Se a mensalidade já possui desconto condicional não executa esse processo
   if qyDadosMensalidade.Eof then Exit;

   // Busca a ação padrão para desconto condicional
   iAcaoDescontoCondicionalPadrao := DM.BuscarCodigoAcaoPadrao(24);

   // Cria a ação de movimento para o desconto condicional informado, na ação de movimento padrão para desconto condiconal
   movimento := TMovimento.create;
   try
      movimento.Observacao := 'Ação de desconto condicional gerada automaticamente pelo sistema';
      movimento.TipoDeAcao := BaixarporDesconto;
      movimento.CodigoTitulo := qyDadosMensalidade.FieldByName('cd_mensalidade_origem').AsInteger;
      movimento.MensalidadeOrigem := iCodigoMensalidade;
      movimento.CodAcao := iAcaoDescontoCondicionalPadrao;
      movimento.ValorDesconto := RoundFloat(cNovoDescontoCondicionalParcela, 2);
      movimento.Coligada := qyDadosMensalidade.FieldByName('cd_coligada').AsInteger;
      movimento.DescCondicional := 1;
      movimento.Flag := 1; // Essa flag vai indicar para não gravar o usuário que fez a ação, pois é uma ação específica do sistema.
      movimento.RegistrarMovimentacaoCR(0, false);
   finally
      Movimento.Free;
   end;

end;

procedure TDM.criarAcaoAutomaticaDescontoFixo(iCodigoMensalidade: Integer; cNovoDescontoFixoParcela: Currency);
const
   SQL_DADOS_MENSALIDADE = '' +
      ' SELECT ' +
      '   DISTINCT m.cd_mensalidade_origem, m.cd_coligada ' +
      ' FROM ' +
      '   mensalidades m ' +
      '   LEFT JOIN fin_mov_cr cr ON ( '+
      '         ((cr.cd_mensalidade_origem = m.cd_mensalidade) OR (cr.cd_mensalidade_origem IS NULL AND cr.cd_mensalidade = m.cd_mensalidade)) AND '+
      '         cr.cd_coligada = m.cd_coligada AND '+
      '         cr.sn_desc_condicional = 0 '+
      '   ) '+
      ' WHERE ' +
      '   m.cd_mensalidade = :cd_mensalidade AND '+
      '   cr.cd_mensalidade IS NULL '+
      ' LIMIT 1';
var
   qyDadosMensalidade: TUMZQuery;
   iAcaoDescontoCondicionalPadrao: Integer;
   movimento: TMovimento;
begin

   // Criar consultas que serão utilizadas para a ação de recalculo dos descontos condicionais
   DM.CriarConsulta(qyDadosMensalidade);

   // Busca dados da mensalidade para criação da ação de movimento
   qyDadosMensalidade.Close;
   qyDadosMensalidade.SQL.Text := SQL_DADOS_MENSALIDADE;
   qyDadosMensalidade.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyDadosMensalidade.Open;

   // Se a mensalidade já possui desconto condicional não executa esse processo
   if qyDadosMensalidade.Eof then Exit;

   // Busca a ação padrão para desconto condicional
   iAcaoDescontoCondicionalPadrao := DM.BuscarCodigoAcaoPadrao(24);

   // Cria a ação de movimento para o desconto Fixo informado, na ação de movimento padrão para desconto Fixo
   movimento := TMovimento.create;
   try
      movimento.Observacao := 'Ação de desconto fixo gerada automaticamente pelo sistema';
      movimento.TipoDeAcao := BaixarporDesconto;
      movimento.CodigoTitulo := qyDadosMensalidade.FieldByName('cd_mensalidade_origem').AsInteger;
      movimento.MensalidadeOrigem := iCodigoMensalidade;
      movimento.CodAcao := iAcaoDescontoCondicionalPadrao;
      movimento.ValorDesconto := RoundFloat(cNovoDescontoFixoParcela, 2);
      movimento.Coligada := qyDadosMensalidade.FieldByName('cd_coligada').AsInteger;
      movimento.DescCondicional := 0;
      movimento.RegistrarMovimentacaoCR(0, false);
   finally
      Movimento.Free;
   end;

end;

procedure TDM.ajustarAcoesDescontosCondicionaisBaixaParcial(iCodigoMensalidadeOrigem, iCodigoMensalidadeParcial: Integer; cDescontoCondicionalOriginal, cNovoDescontoCondicionalOrigem, cNovoDescontoCondicionalParcial: Currency);
var
   atualizarDescontoPrevisto: Boolean;
   sFinanceiroBaixaDesconto: String;
begin

   sFinanceiroBaixaDesconto := DM.variavel_parametro('FinanceiroBaixaDesconto');

   // Informa que não deve atualizar o desconto previsto
   atualizarDescontoPrevisto := False;

   // Verifica como o parametro de "FinanceiroBaixaDesconto" se comporta
   if (sFinanceiroBaixaDesconto = 'PROPORCIONAL') then
   begin
      // Cria as ações de movimento na nova parcela parcial
      DM.copiarAcoesMovimentoCondicionais(iCodigoMensalidadeOrigem, iCodigoMensalidadeParcial);
      
      // Ajusta os valores das ações em ambas as parcelas (origem e parcial)
      DM.recalcularDescCondicionalAcoesMovimento(iCodigoMensalidadeOrigem, cDescontoCondicionalOriginal, cNovoDescontoCondicionalOrigem, atualizarDescontoPrevisto);
      DM.recalcularDescCondicionalAcoesMovimento(iCodigoMensalidadeParcial, cDescontoCondicionalOriginal, cNovoDescontoCondicionalParcial, atualizarDescontoPrevisto);

   end else if (sFinanceiroBaixaDesconto = 'FINAL') then
   begin
      // Cria as ações de movimento na nova parcela parcial
      DM.copiarAcoesMovimentoCondicionais(iCodigoMensalidadeOrigem, iCodigoMensalidadeParcial);

      // Ajusta os valores das ações em ambas as parcelas (origem e parcial)
      DM.recalcularDescCondicionalAcoesMovimento(iCodigoMensalidadeOrigem, cDescontoCondicionalOriginal, cNovoDescontoCondicionalOrigem, atualizarDescontoPrevisto);
      
   end;

end;

procedure TDM.copiarAcoesMovimentoCondicionais(iCodigoMensalidadeOrigem, iCodigoMensalidadeDestino: Integer);
const
   SQL_ACOES_CONDICIONAIS = ''+
   ' SELECT * FROM fin_mov_cr '+
   ' WHERE '+
   '     (cd_mensalidade_origem = :cd_mensalidade_origem OR (cd_mensalidade_origem IS NULL AND cd_mensalidade = :cd_mensalidade_origem)) AND '+
   '     vl_desconto > 0 AND '+
   '     sn_desc_condicional = 1';
var
   qyAcoes: TUMZQuery;
   movimento: TMovimento;
begin

   DM.CriarConsulta(qyAcoes);   

   // Move as ações de movimento dos descontos condicionais da mensalidade origem para a mensalidade destino
   qyAcoes.Close;
   qyAcoes.SQL.Text := SQL_ACOES_CONDICIONAIS;
   qyAcoes.ParamByName('cd_mensalidade_origem').AsInteger := iCodigoMensalidadeOrigem;
   qyAcoes.Open;

   // Varre as ações de movimento da mensalidade origem
   while not qyAcoes.Eof do
   begin

      movimento := TMovimento.create;
      try
         movimento.Observacao := qyAcoes.FieldByName('ds_observacao').AsString;
         movimento.TipoDeAcao := BaixarporDesconto;
         movimento.CodigoTitulo := qyAcoes.FieldByName('cd_mensalidade').AsInteger;
         movimento.MensalidadeOrigem := iCodigoMensalidadeDestino;
         movimento.CodAcao := qyAcoes.FieldByName('cd_acao').AsInteger;
         movimento.ValorDesconto := qyAcoes.FieldByName('vl_desconto').AsCurrency;
         movimento.Coligada := qyAcoes.FieldByName('cd_coligada').AsInteger;
         movimento.DescCondicional := 1;
         movimento.RegistrarMovimentacaoCR(0, false);
      finally
         movimento.Free;
      end;

      qyAcoes.Next;
   end;

end;

procedure TDM.aplicaAcoesMovimentoDescontosCondicionais(iCodigoMensalidade: Integer);
const
   SQL_DESCONTO_MENSALIDADE_ACOES = ''+
   ' SELECT '+
   '    ROUND(m.valordesconto, 2) vl_desconto_mensalidade, '+
   '    ROUND(cr.vl_desconto, 2) vl_desconto_acao, '+
   '    cr.cd_mensalidade, '+
   '    cr.cd_coligada, '+
   '    cr.nr_sequencia '+
   ' FROM '+
   '	  mensalidades m '+
   '	  INNER JOIN fin_mov_cr cr ON ( '+
	 ' 	    ( '+
   '			  cr.cd_mensalidade_origem = m.cd_mensalidade OR '+
	 '    		(cr.cd_mensalidade_origem IS NULL AND cr.cd_mensalidade = m.cd_mensalidade) '+
   '  		) AND '+
   '		  cr.sn_desc_condicional = 1 '+
   '  	) '+
   ' WHERE '+
   '    m.cd_mensalidade = :cd_mensalidade';

   SQL_APLICA_ACOES_CONDICIONAIS = ''+
   ' UPDATE fin_mov_cr SET sn_desc_aplicado = 1 '+
   ' WHERE '+
   '     cd_mensalidade = :cd_mensalidade AND '+
   '     cd_coligada = :cd_coligada AND '+
   '     nr_sequencia = :nr_sequencia';
var
   qyMensalidadeAcoes: TUMZQuery;
   qyAcoes: TUMZQuery;

   vlDescontoMensalidade: Currency;
begin

   DM.CriarConsulta(qyMensalidadeAcoes);
   DM.CriarConsulta(qyAcoes);

   qyMensalidadeAcoes.Close;
   qyMensalidadeAcoes.SQL.Text := SQL_DESCONTO_MENSALIDADE_ACOES;
   qyMensalidadeAcoes.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyMensalidadeAcoes.Open();

   vlDescontoMensalidade := 0;

   // Checa se a mensalidade possui valor de desconto que poderia ter sido aplicado
   // Se a mensalidade não possui valor de desconto, não precisa tratar mais nada
   if not qyMensalidadeAcoes.Eof and (qyMensalidadeAcoes.FieldByName('vl_desconto_mensalidade').AsCurrency > 0) then
   begin
      vlDescontoMensalidade := qyMensalidadeAcoes.FieldByName('vl_desconto_mensalidade').AsCurrency;
   end;

   // Se a mensalidade não possui desconto condicional, não precisa ccntinuar
   if vlDescontoMensalidade = 0 then
   begin
     Exit;
   end;

   // Varre as ações da mensalidade
   while not qyMensalidadeAcoes.Eof do
   begin

      // Quando não possui mais desconto na parcela,
      // não é setdo como aplicado mais nenhum desconto condicional  
      if vlDescontoMensalidade <= 0 then
      begin
        break;
      end;

      // Aplica o desconto condicional na ação de movimento da mensalidade
      qyAcoes.Close;
      qyAcoes.SQL.Text := SQL_APLICA_ACOES_CONDICIONAIS;
      qyAcoes.ParamByName('cd_mensalidade').AsInteger := qyMensalidadeAcoes.FieldByName('cd_mensalidade').AsInteger;
      qyAcoes.ParamByName('cd_coligada').AsInteger := qyMensalidadeAcoes.FieldByName('cd_coligada').AsInteger;
      qyAcoes.ParamByName('nr_sequencia').AsInteger := qyMensalidadeAcoes.FieldByName('nr_sequencia').AsInteger;
      qyAcoes.ExecSQL;

      vlDescontoMensalidade := vlDescontoMensalidade -
        qyMensalidadeAcoes.FieldByName('vl_desconto_acao').AsCurrency;

      qyMensalidadeAcoes.Next;
   end;

end;

procedure TDM.atualizarDescontosCondicionaisPrevisto(iCodigoMensalidade: Integer);
const
   SQL_ATUALIZAR_DESC_PREVISTO_ACOES_CONDICIONAIS = ''+
   ' UPDATE fin_mov_cr SET '+
   '   vl_desconto_previsto = vl_desconto '+
   ' WHERE '+
   '     (cd_mensalidade_origem = :cd_mensalidade OR (cd_mensalidade_origem IS NULL AND cd_mensalidade = :cd_mensalidade)) AND '+
   '     sn_desc_condicional = 1';
var
   qyAcoes: TUMZQuery;
begin

   DM.CriarConsulta(qyAcoes);

   // Atualiza o valor do desconto previsto
   qyAcoes.Close;
   qyAcoes.SQL.Text := SQL_ATUALIZAR_DESC_PREVISTO_ACOES_CONDICIONAIS;
   qyAcoes.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAcoes.ExecSQL;

end;

procedure TDM.estornarAcoesMovimentoDescCondicional(iCodigoMensalidade: Integer);
const
   SQL_REMOVER_ACOES_CONDICIONAIS_BAIXA = ''+
   ' DELETE FROM fin_mov_cr ' +
   ' WHERE ' +
   '     (cd_mensalidade_origem = :cd_mensalidade OR (cd_mensalidade_origem IS NULL AND cd_mensalidade = :cd_mensalidade)) AND '+
   '     sn_desc_condicional = 1 AND ' +
   '     vl_desconto_previsto IS NULL';

   SQL_ESTORNAR_ACOES_CONDICIONAIS = ''+
   ' UPDATE ' +
   '     fin_mov_cr ' +
   ' SET ' +
   '     sn_desc_aplicado = 0, ' +
   '     vl_desconto = vl_desconto_previsto, ' +
   '     vl_desconto_previsto = NULL ' +
   ' WHERE ' +
   '     (cd_mensalidade_origem = :cd_mensalidade OR (cd_mensalidade_origem IS NULL AND cd_mensalidade = :cd_mensalidade)) AND '+
   '     sn_desc_condicional = 1';

   SQL_REMOVER_ACOES_CONDICIONAIS_PARCIAIS = ''+
   ' DELETE cr.* FROM ' +
   '     mensalidades mb ' +
   '     INNER JOIN mensalidades mp ON (mp.cd_mensalidade_origem = mb.cd_mensalidade_origem) ' +
	'     INNER JOIN fin_mov_cr cr ON (((cr.cd_mensalidade_origem = mp.cd_mensalidade) OR (cr.cd_mensalidade_origem IS NULL AND cr.cd_mensalidade = mp.cd_mensalidade)) AND cr.cd_coligada = mp.cd_coligada) ' +
   ' WHERE ' +
	'     mb.cd_mensalidade = :cd_mensalidade ' +
	'     AND mp.cd_mensalidade > mb.cd_mensalidade';
var
   qyAcoes: TUMZQuery;
begin

   DM.CriarConsulta(qyAcoes);

   {
      O SQL de remover ações condicionais de baixa, verifica se existe algum desconto condicional previsto,
      se ele não existir (se for NULL) significa que o desconto condicional foi apenas dado no momento da baixa,
      isso quer dizer que ele não existirá após o estorno, então a ação de movimento desses descontos condicionais
      serão removidas
   }
   qyAcoes.Close;
   qyAcoes.SQL.Text := SQL_REMOVER_ACOES_CONDICIONAIS_BAIXA;
   qyAcoes.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAcoes.ExecSQL;

   {
      Quando o usuário estornar uma parcela a qual foi dada baixa parcial e gerou novas parcelas, o sistema
      ira apagar as parcelas geradas novas após o estorno da parcela de origem, isso significa que também
      deve apagar as ações de movimento das mensalidades filhas (geradas pela baixa parcial)
   }
   qyAcoes.Close;
   qyAcoes.SQL.Text := SQL_REMOVER_ACOES_CONDICIONAIS_PARCIAIS;
   qyAcoes.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAcoes.ExecSQL;

   {
      Estorna os descontos condicionais nas ações de movimento da mensalidade estornada,
      setar o campo sn_desc_aplicado para zero (informando que o desconto não foi mais aplicado),
      voltando ao valor do desconto o que estava como previsto (vl_desconto = vl_desconto_previsto) e
      apagando o valor do desconto previsto (vl_desconto_previsto = NULL)
   }
   qyAcoes.Close;
   qyAcoes.SQL.Text := SQL_ESTORNAR_ACOES_CONDICIONAIS;
   qyAcoes.ParamByName('cd_mensalidade').AsInteger := iCodigoMensalidade;
   qyAcoes.ExecSQL;

end;

procedure TDM.acessarGestaoOnline();
var
   link: String;
   razao_social: String;
   usuario_senha: String;
   endereco_online_local: String;
begin
   // Habilitar botão de acesso ao portal on-line da instituição.
   endereco_online_local := trim( DM.variavel_parametro('online_endereco_local') );

   razao_social := trim(DM.variavel_parametro('cliente_razao_social'));
   razao_social := TUMCriptografia.UMCrypt( razao_social, ctEncode, 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ' );
   usuario_senha := TUMCriptografia.UMCrypt( DM.sLogin, ctEncode, 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ' ) + DM.UsuarioLogado.Pessoa.Senha;

   link := endereco_online_local + 'gestao/index.php?tipo=login_automatico';
   link := link + '&cal=' + razao_social + '&usu=' + usuario_senha;

   OpenURL( link );
end;

end.

