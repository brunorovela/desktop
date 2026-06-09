unit uCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Variants,
  Grids, DBGrids, ComCtrls, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, DBLookup, ToolWin, ImgList, Menus, OleCtrls, SHDocVw,
  Comobj, uListaConvenios, uDisciplinasOptativas, ZSqlUpdate, UMFiltroDataAnoSem, UMNavigator,
  UMLookupComboBox, UMComboBox, ZDbcIntfs, UZDbcFuncs, RegExpr, General,
  uCadCentros, uAvaliacoes_Parametros, uMensagem, uBuscaCentro;

type
  TfrmCursos = class(TForm)
    Bevel9: TBevel;
    pcGeral: TPageControl;
    tsCursos: TTabSheet;
    tsTurmas: TTabSheet;
    tsDisciplinas: TTabSheet;
    tsGrade: TTabSheet;
    tsDocumentos: TTabSheet;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    qryInsertCursos: TUMZQuery;
    dtcTurmas: TDataSource;
    tblTurmas: TUMZQuery;
    tblTurmasAnoSemestre: TSmallintField;
    tblTurmasCodigo: TStringField;
    tblTurmasCurso: TStringField;
    tblTurmasDataInicio: TDateTimeField;
    tblTurmasDataFim: TDateTimeField;
    tblTurmasDataConclusao: TDateTimeField;
    tblTurmasIdadeConclusao: TSmallintField;
    tblTurmasSerie: TSmallintField;
    tblTurmasTurno: TStringField;
    tblTurmasVagas: TSmallintField;
    tblTurmasContrato: TStringField;
    tblTurmasHorarioLetivo: TStringField;
    tblTurmasHorasAula: TStringField;
    tblTurmasGrau: TSmallintField;
    tblTurmasdescProfessor: TStringField;
    tblTurmasObsHistorico: TMemoField;
    tblTurmassn_inscricao_online: TStringField;
    tblTurmascd_avaliacao: TSmallintField;
    tblTurmasvl_ordem: TSmallintField;
    tblTurmascd_proxima_turma: TStringField;
    tblTurmassn_terminal_acesso: TSmallintField;
    tblTurmascd_coligada: TSmallintField;
    tblTurmasdescCaixa: TStringField;
    tblTurmassn_bloquear_disc_pendentes: TSmallintField;
    tblTurmascd_etapa_mec: TIntegerField;
    tblTurmasdescricao: TStringField;
    tblTurmasprofessor_responsavel: TIntegerField;
    tblTurmassn_bloquear_vagas: TSmallintField;
    tblTurmassn_turma_especial: TSmallintField;
    tblTurmasDIASSEMANAISLETIVOS: TFloatField;
    tblTurmasCD_CAMPUS: TLargeintField;
    tblTurmasCD_CENTRO: TLargeintField;
    tblTurmasCD_CAIXA: TLargeintField;
    tblTurmasCD_GRADE: TLargeintField;
    tblTurmasHORAFIM: TDateTimeField;
    tblTurmasHORAINICIO: TDateTimeField;
    tblTurmasSN_ATIVA: TIntegerField;
    tblTurmasobscontrato: TMemoField;
    tblTurmasobsgerais: TMemoField;
    tblTurmascd_proxima_turma_lk: TStringField;
    dtcTurnos: TDataSource;
    tblTurnos: TUMZQuery;
    tblTurnosDescricao: TStringField;
    tblTurnosCodigo: TStringField;
    tblGradeGroup: TUMZQuery;
    tblGradeGroupAnoSemestre: TSmallintField;
    tblGradeGroupCurso: TStringField;
    tblGradeGroupTurno: TStringField;
    tblGradeGroupSerie: TSmallintField;
    dtcGradeGroup: TDataSource;
    tblDeptos: TUMZQuery;
    tblDeptosCodigo: TSmallintField;
    dtcDeptos: TDataSource;
    dtcDisc: TDataSource;
    tblDisc: TUMZQuery;
    tblDiscDescricao: TStringField;
    tblDiscCurso: TStringField;
    tblDiscordem: TSmallintField;
    tblDiscsigla: TStringField;
    tblDisccodigo: TIntegerField;
    tblDiscCD_DISCIPLINA_PAI: TStringField;
    tblDisccd_disc_mec: TIntegerField;
    tblDisciplinas: TUMZQuery;
    tblDisciplinasCodigo: TSmallintField;
    tblDisciplinasCurso: TStringField;
    tblDisciplinasSigla: TStringField;
    tblDisciplinasDescricao: TStringField;
    dtcDisciplinas: TDataSource;
    qDocumentos: TUMZQuery;
    qDocumentosNecessarios: TUMZQuery;
    qDocumentosNecessariosCod_Documento: TIntegerField;
    qDocumentosNecessariosCurso: TStringField;
    qDocumentosNecessariosCodigo: TSmallintField;
    qDocumentosNecessariosDocumento: TStringField;
    qDocumentosNecessariosPrazo: TStringField;
    qDocumentosNecessariosSigla: TStringField;
    qDocumentosNecessariossn_obrigatorio: TStringField;
    qDocumentosNecessariosnr_grupo: TSmallintField;
    dsDocumentos: TDataSource;
    dsDocumentosNecessarios: TDataSource;
    updDoc: TZUpdateSQL;
    ImageList1: TImageList;
    ImageList2: TImageList;
    tblProfessores: TUMZQuery;
    tblProfessoresnm_pessoa: TStringField;
    tblProfessorescd_pessoa: TIntegerField;
    tblProfessoresnm_apelido: TStringField;
    tblProfessorescd_titulacao: TIntegerField;
    tblProfessorescd_area: TIntegerField;
    tblProfessoresds_obs_sistema: TMemoField;
    updGrade: TZUpdateSQL;
    tblEmentas: TUMZQuery;
    dsEmentas: TDataSource;
    tblAvaliacoes_Parametros: TUMZQuery;
    tblAvaliacoes_Parametroscd_avaliacao: TSmallintField;
    tblAvaliacoes_Parametrosds_avaliacao: TStringField;
    tblAvaliacoes_Parametrosnr_avaliacoes: TSmallintField;
    tblAvaliacoes_Parametroscd_periodo_avaliacao: TSmallintField;
    tblAvaliacoes_Parametrosds_cond_aprov_direta: TStringField;
    tblAvaliacoes_Parametrosds_cond_repro_direta: TStringField;
    tblAvaliacoes_Parametrosds_formula_media_exame: TStringField;
    tblAvaliacoes_Parametrosds_formula_media_segunda: TStringField;
    tblAvaliacoes_Parametrosds_cond_aprov_exame: TStringField;
    tblAvaliacoes_Parametrosds_cond_aprov_segunda: TStringField;
    tblAvaliacoes_Parametrosnr_max_disci_exame: TSmallintField;
    tblAvaliacoes_Parametrosnr_max_disci_segunda: TSmallintField;
    tblAvaliacoes_Parametrossn_notas: TStringField;
    tblAvaliacoes_Parametrossn_conceitos: TStringField;
    tblAvaliacoes_Parametrossn_descricao: TStringField;
    tblAvaliacoes_Parametrossn_exame: TStringField;
    tblAvaliacoes_Parametrossn_pi: TStringField;
    tblAvaliacoes_Parametrossn_segunda_epoca: TStringField;
    tblAvaliacoes_Parametrossn_frequencia_global: TStringField;
    tblAvaliacoes_Parametrosds_frequencia_tipo: TStringField;
    tblAvaliacoes_Parametrosds_formula_media_anual: TMemoField;
    tblAvaliacoes_Parametrosds_formula_media_final: TStringField;
    tblAvaliacoes_Parametrossn_recuperacao: TStringField;
    tblAvaliacoes_Parametrosds_formula_recuperacao: TStringField;
    tblAvaliacoes_Parametrosnr_casas_decimais: TSmallintField;
    tblAvaliacoes_Parametrosds_cond_recuperacao: TStringField;
    tblAvaliacoes_Parametrosvl_arredondamento: TFloatField;
    tblAvaliacoes_Parametrossn_notas_diario_online: TStringField;
    tblAvaliacoes_Parametrossn_notas_diario: TStringField;
    tblAvaliacoes_Parametrossn_desblo_coorde: TStringField;
    tblAvaliacoes_Parametrossn_diario_imp_notas: TStringField;
    tblAvaliacoes_Parametrossn_diario_imp_freqs: TStringField;
    tblAvaliacoes_Parametrossn_diario_imp_contprog: TStringField;
    tblAvaliacoes_Parametrossn_notas_truncar: TStringField;
    tblAvaliacoes_Parametrosds_nota_exame: TStringField;
    tblAvaliacoes_Parametrosds_nota_segunda: TStringField;
    tblAvaliacoes_Parametrossn_medias_truncar: TStringField;
    tblAvaliacoes_Parametrossn_anual_truncar: TStringField;
    tblAvaliacoes_Parametroscd_disci_frequencia: TLargeintField;
    dtcAvaliacoes_padroes: TDataSource;
    pmQtdDeptos: TPopupMenu;
    pmQtdTurmas: TPopupMenu;
    pmQtdGrade: TPopupMenu;
    pmQtdDisc: TPopupMenu;
    pmQtdDocumentosNecessarios: TPopupMenu;
    pmQtdGrades: TPopupMenu;
    qyAtosOficiais: TUMZQuery;
    qyAtosOficiaiscd_curso: TStringField;
    qyAtosOficiaisdt_ato: TDateTimeField;
    qyAtosOficiaisds_titulo_ato: TStringField;
    qyAtosOficiaissn_impressao: TStringField;
    qyAtosOficiaisnr_anosemestre: TLargeintField;
    srcAtosOficiais: TDataSource;
    pmQtdAtosOficiais: TPopupMenu;
    qyCampus: TUMZQuery;
    qyCampuscd_campus: TIntegerField;
    qyCampusds_endereco: TStringField;
    qyCampusnr_numero: TIntegerField;
    qyCampusds_bairro: TStringField;
    qyCampusds_cidade: TStringField;
    qyCampusds_estado: TStringField;
    qyCampuscd_pessoa_coordenador: TIntegerField;
    qyCampusds_codigo: TStringField;
    srcCampus: TDataSource;
    popPreRequisito: TPopupMenu;
    qyInstru: TUMZQuery;
    qyInstrucd_doc: TSmallintField;
    qyInstruds_titulo: TStringField;
    qyEdital: TUMZQuery;
    qyEditalcd_doc: TSmallintField;
    qyEditalds_titulo: TStringField;
    qyRegimento: TUMZQuery;
    qyRegimentocd_doc: TSmallintField;
    qyRegimentods_titulo: TStringField;
    dsInstru: TDataSource;
    dsEdital: TDataSource;
    dsRegimento: TDataSource;
    qyConta: TUMZQuery;
    qyContads_caixa: TStringField;
    qyColigada: TUMZQuery;
    qyColigadanm_coligada: TStringField;
    qyDiscCat: TUMZQuery;
    qyDiscCatcd_categoria: TIntegerField;
    qyDiscCatds_categoria: TStringField;
    dtcDisCat: TDataSource;
    qUnidadesCertificadoras: TUMZQuery;
    qUnidadesCertificadorasnm_instituicao: TStringField;
    qUnidadesCertificadorasds_endereco: TStringField;
    qUnidadesCertificadorasds_complemento: TStringField;
    qUnidadesCertificadorasds_bairro: TStringField;
    qUnidadesCertificadorasds_cidade: TStringField;
    qUnidadesCertificadorasds_estado: TStringField;
    qUnidadesCertificadorasds_cep: TStringField;
    qUnidadesCertificadorasds_diretor: TStringField;
    qUnidadesCertificadorasds_tipo: TStringField;
    qUnidadesCertificadorasds_telefone1: TStringField;
    qUnidadesCertificadorasds_telefone2: TStringField;
    qUnidadesCertificadorasds_email: TStringField;
    qUnidadesCertificadorasds_site: TStringField;
    qUnidadesCertificadorassn_educacao_infantil: TStringField;
    qUnidadesCertificadorassn_ensino_fundamental: TStringField;
    qUnidadesCertificadorassn_ensino_medio: TStringField;
    qUnidadesCertificadorassn_ensino_superior: TStringField;
    qUnidadesCertificadorassn_cursos_profissionalizantes: TStringField;
    qUnidadesCertificadorassn_ensino_especial: TStringField;
    qUnidadesCertificadorassn_unidade_certificadora: TSmallintField;
    dsUnidadesCertificadoras: TDataSource;
    qTurmasConvenios: TUMZQuery;
    dsTurmasConvenios: TDataSource;
    qConvenios: TUMZQuery;
    popPreRequisitoEspecial: TPopupMenu;
    qyAtualizarColigadasTurmas: TUMZQuery;
    qyAtualizarColigadasMensalidades: TUMZQuery;
    qryUpdateGrade: TUMZQuery;
    dtcColigadas: TDataSource;
    qyCursosMestre: TUMZQuery;
    dtcCursosMestre: TDataSource;
    qyCursosColigadas: TUMZQuery;
    qyCursosColigadasCD_CURSO: TStringField;
    qyCursosColigadasCD_CURSO_EQUIVALENTE: TStringField;
    qyCursosColigadasCD_GRADE: TIntegerField;
    qyCursosColigadasDS_CONTRATO: TStringField;
    qyCursosColigadasNR_CARGA_HORARIA: TFloatField;
    qyCursosColigadasCD_COLIGADA: TIntegerField;
    qyCursosColigadasCD_DEPTO: TIntegerField;
    qyCursosColigadasNR_DIAS_LETIVOS: TFloatField;
    qyCursosColigadasNR_DURACAO_AULA: TFloatField;
    qyCursosColigadasCD_CURSO_MEC: TIntegerField;
    qyCursosColigadasCD_GRAU_MEC: TStringField;
    qyCursosColigadasCD_HABILITACAO_MEC: TIntegerField;
    qyCursosColigadasDS_NOME_ETAPA: TStringField;
    qyCursosColigadasNR_SERIES: TIntegerField;
    qyCursosColigadasME_OBSERVACOES: TMemoField;
    qyCursosColigadasDS_REQUERIMENTO: TStringField;
    qyCursosColigadasSN_ACADEMICO: TIntegerField;
    dtcCursosColigadas: TDataSource;
    qyGrades: TUMZQuery;
    qyGradesCD_CURSO: TStringField;
    qyGradesDS_GRADE: TStringField;
    qyGradesNR_ANO_INICIAL: TIntegerField;
    dsGrades: TDataSource;
    qyGradesDisciplinas: TUMZQuery;
    qyGradesDisciplinasCD_CURSO: TStringField;
    qyGradesDisciplinasCD_DISCIPLINA: TIntegerField;
    qyGradesDisciplinasNR_SERIE: TIntegerField;
    qyGradesDisciplinasNR_AULAS: TFloatField;
    qyGradesDisciplinasVL_VALOR: TFloatField;
    qyGradesDisciplinasSN_COMPARTILHADA: TSmallintField;
    qyGradesDisciplinasCD_DISCIPLINA_CATEGORIA: TIntegerField;
    qyGradesDisciplinasNR_CARGA_HORARIA_PRATICA: TFloatField;
    qyGradesDisciplinasNR_CARGA_HORARIA_TEORICA: TFloatField;
    qyGradesDisciplinasDS_DISCIPLINA_CATEGORIA: TStringField;
    qyGradesDisciplinasSIGLA: TStringField;
    qyGradesDisciplinasDESCRICAO: TStringField;
    qyGradesDisciplinasNR_CREDITOS_ACADEMICOS: TLargeintField;
    dsGradesDisciplinas: TDataSource;
    updGradesDisciplinas: TZUpdateSQL;
    qyListaGrades: TUMZQuery;
    qyListaGradesDS_GRADE: TStringField;
    qyListaProximaTurma: TUMZQuery;
    qyCursosColigadasSN_ATIVO: TSmallintField;
    pnCursos: TPanel;
    Panel12: TPanel;
    ScrollBox3: TScrollBox;
    Panel29: TPanel;
    Label36: TLabel;
    Label33: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label29: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label37: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    dbmeObservacoes: TDBMemo;
    dbeRequerimento: TDBEdit;
    dbeContrato: TDBEdit;
    dbeDuracaoHorasAula: TDBEdit;
    dbeNomeEtapa: TDBEdit;
    dbeQtdEtapas: TDBEdit;
    dbeCursosEquivalentes: TDBEdit;
    dbeDiasLetivos: TDBEdit;
    dbeCargaHoraria: TDBEdit;
    ckbUtilizarCurso: TCheckBox;
    dbeCodigoMec: TDBEdit;
    dbeGrauMec: TDBEdit;
    dbeHabilitacaoMec: TDBEdit;
    dbcbGrade: TDBLookupComboBox;
    btnMostrarGradeCurso: TButton;
    Panel4: TPanel;
    grdCursos: TDBGrid;
    Panel33: TPanel;
    paCabecalho: TPanel;
    pnTurmas: TPanel;
    Panel8: TPanel;
    Panel13: TPanel;
    pgTurmas: TPageControl;
    TabSheet4: TTabSheet;
    lbTurmaEtapa: TLabel;
    Label26: TLabel;
    Label24: TLabel;
    Label17: TLabel;
    Label35: TLabel;
    Label52: TLabel;
    sbMaisInformacoes: TSpeedButton;
    dbeDiasSemLetivos: TDBEdit;
    dbeVagas: TDBEdit;
    cmbTurnosTurmas: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    btnMostrarGradeTurma: TButton;
    TabSheet5: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label23: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label61: TLabel;
    dbeHoraInicio: TDBEdit;
    dbeHoraFim: TDBEdit;
    dbeDataConclusao: TDBEdit;
    dbeDataFim: TDBEdit;
    dbeDatainicio: TDBEdit;
    TabSheet6: TTabSheet;
    ScrollBox4: TScrollBox;
    laHistturma: TLabel;
    Label48: TLabel;
    Label56: TLabel;
    mmHistTurma: TDBMemo;
    mmContratoTurma: TDBMemo;
    mmGeraisTurma: TDBMemo;
    tsFinanceiro: TTabSheet;
    TabSheet10: TTabSheet;
    dbcbProximaTurma: TDBLookupComboBox;
    tsConvenios: TTabSheet;
    TDBGTurmasConvenios: TDBGrid;
    TBConveniosIncluir: TButton;
    btExcluir: TButton;
    Panel23: TPanel;
    ScrollBox1: TScrollBox;
    Label39: TLabel;
    LabelunidadeCertificadora: TLabel;
    dbeDescricaoTurma: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBLCunidadeCertificadora: TDBLookupComboBox;
    dbchTurmaEspecial: TDBCheckBox;
    dbckbSN_ATIVA: TDBCheckBox;
    Panel25: TPanel;
    Bevel2: TBevel;
    btnCopiarTurma: TSpeedButton;
    Label11: TLabel;
    dbeTurma: TDBEdit;
    btnRenomearTurma: TButton;
    Panel1: TPanel;
    pnDisciplinas: TPanel;
    Panel16: TPanel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel18: TBevel;
    grdDisc: TDBGrid;
    Panel17: TPanel;
    Label44: TLabel;
    DBText1: TDBText;
    Panel15: TPanel;
    tpan: TPanel;
    Label40: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    dbCursoDis: TDBEdit;
    dbCodDisc: TDBEdit;
    dbDescDisc: TDBEdit;
    dbSiglaDisc: TDBEdit;
    dbOrdemDisc: TDBEdit;
    dbCdMECDisc: TDBEdit;
    Panel24: TPanel;
    Bevel5: TBevel;
    Bevel13: TBevel;
    pcEmenta: TPageControl;
    TabSheet2: TTabSheet;
    dbEmentaDisc: TDBMemo;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet11: TTabSheet;
    dbObjetivo: TDBMemo;
    Panel19: TPanel;
    pnGradeCurricular: TPanel;
    Bevel4: TBevel;
    Panel2: TPanel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    grdGrade: TDBGrid;
    Panel14: TPanel;
    blementa: TToolBar;
    btnCopiarGrade: TToolButton;
    btnMostrarDisciplinas: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton5: TToolButton;
    btnPreRequisito: TToolButton;
    btnPreRequisitoEspecial: TToolButton;
    Panel5: TPanel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    grdGrades: TDBGrid;
    Panel6: TPanel;
    pnCadastroGrade: TPanel;
    Bevel1: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label47: TLabel;
    Panel32: TPanel;
    edGradeCodigo: TDBEdit;
    edGradeCurso: TDBEdit;
    edGradeDescricao: TDBEdit;
    edGradeAnoSemestreInicial: TDBEdit;
    Panel3: TPanel;
    pnDocumentosNecessarios: TPanel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Panel20: TPanel;
    grdDoc: TDBGrid;
    Panel21: TPanel;
    Label22: TLabel;
    DBText3: TDBText;
    pnDoc: TPanel;
    Label30: TLabel;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Panel9: TPanel;
    pnTurmasFinanceiro: TPanel;
    DBLookupComboBox10: TDBLookupComboBox;
    sbLimparConta: TSpeedButton;
    Label42: TLabel;
    tblTurmascd_avaliacao_lk: TStringField;
    btnMostraGradesAtivas: TButton;
    DBCheckBox9: TDBCheckBox;
    qyGradesSN_ATIVO: TStringField;
    Label59: TLabel;
    dbCodDiscPai: TDBEdit;
    cbFormaAvaliacao: TUMLookupComboBox;
    lblSituacao: TLabel;
    dblSituacao: TDBLookupComboBox;
    qrySituacoesTurmas: TUMZQuery;
    qrySituacoesTurmascodigo: TLargeintField;
    qrySituacoesTurmascd_modulo: TLargeintField;
    qrySituacoesTurmascd_situacao: TIntegerField;
    qrySituacoesTurmasds_valor: TStringField;
    qrySituacoesTurmasds_sigla: TStringField;
    qrySituacoesTurmasme_descricao: TMemoField;
    qrySituacoesTurmascd_auxiliar: TLargeintField;
    tblTurmascd_situacao: TSmallintField;
    dsSituacoes: TDataSource;
    sbLimpa: TSpeedButton;
    dbcbDepartamento: TUMLookupComboBox;
    Label78: TLabel;
    Panel34: TPanel;
    Panel22: TPanel;
    Label73: TLabel;
    dbeCCodigo: TDBEdit;
    btnRenomearCurso: TButton;
    DBCheckBox8: TDBCheckBox;
    Label76: TLabel;
    dbeCApelido: TDBEdit;
    Label1: TLabel;
    dbeCHabilitacao: TDBEdit;
    dbeCNome: TDBEdit;
    Label74: TLabel;
    Label77: TLabel;
    Label60: TLabel;
    dbeCRelevancia: TDBEdit;
    SpeedButton2: TSpeedButton;
    Panel36: TPanel;
    Panel35: TPanel;
    grdColigadas: TDBGrid;
    Panel10: TPanel;
    Label62: TLabel;
    rgFiltroCursosMestres: TRadioGroup;
    cbDepartamento: TUMComboBox;
    Panel26: TPanel;
    grdAtosOficiais: TDBGrid;
    Panel31: TPanel;
    dbnAtosOficiais: TUMNavigator;
    Panel30: TPanel;
    Panel7: TPanel;
    dbnCursosColigadas: TUMNavigator;
    cbColigadas: TUMComboBox;
    Label4: TLabel;
    qyListaDeptos: TUMZReadOnlyQuery;
    qyListaDeptoscodigo: TSmallintField;
    qyCursosColigadasDS_DEPTO_LK: TStringField;
    Panel11: TPanel;
    grdTurmas: TDBGrid;
    UMFiltroDataAnoSem: TUMFiltroDataAnoSem;
    Label31: TLabel;
    lbColigada: TLabel;
    Label32: TLabel;
    lbDepartamento: TLabel;
    Panel27: TPanel;
    tblDisciplinassn_bloqueado: TSmallintField;
    Panel28: TPanel;
    Label38: TLabel;
    DBEdit12: TDBEdit;
    Label53: TLabel;
    Label5: TLabel;
    cbDisciplinaPai: TUMComboBox;
    tblAvaliacoes_Parametroscd_coligada: TIntegerField;
    dbedt_inicio_monografia: TDBEdit;
    Label6: TLabel;
    dbedt_fim_monografia: TDBEdit;
    Label25: TLabel;
    tblTurmasdt_inicio_monografia: TDateTimeField;
    tblTurmasdt_fim_monografia: TDateTimeField;
    pcProfessoresResponsaveis: TPageControl;
    ts1ProfessorResponsavel: TTabSheet;
    ts2ProfessorResponsavel: TTabSheet;
    Label54: TLabel;
    Label41: TLabel;
    tblTurmasprofessor_responsavel2: TIntegerField;
    tblTurmasdescProfessor2: TStringField;
    lbedPesquisaCurso: TLabeledEdit;
    qryColigadasComboCreate: TUMZQuery;
    qryColigadasComboCreatenm_coligada: TStringField;
    qyColigadasCadastroTurma: TUMZReadOnlyQuery;
    qyColigadasCadastroTurmacd_coligada: TIntegerField;
    qyColigadasCadastroTurmanm_coligada: TStringField;
    dbcbColigadas: TDBLookupComboBox;
    tblTurmascd_coligada_lk: TStringField;
	Panel37: TPanel;
    qyGetDepto: TUMZReadOnlyQuery;
    tblTurmassn_usar_plano: TSmallintField;
    DBCheckBox2: TDBCheckBox;
    qUnidadesCertificadorascd_instituicao: TIntegerField;
    cbNrEtapas: TUMComboBox;
    qrySituacoes: TUMZQuery;
    LargeintField1: TLargeintField;
    LargeintField2: TLargeintField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    MemoField1: TMemoField;
    LargeintField3: TLargeintField;
    tblTurmasdescSituacao: TStringField;
    Panel38: TPanel;
    lbTotais: TLabel;
    lblHR_A: TLabel;
    lblCR_F: TLabel;
    lblCH: TLabel;
    lblDisciplinas: TLabel;
    dbqtd: TDBText;
    dbhra: TDBText;
    dbCrFin: TDBText;
    dbCh: TDBText;
    qryTotais: TUMZQuery;
    dsTotal: TDataSource;
    qryTotaiscarga_horaria: TFloatField;
    qryTotaisqtd_disciplinas: TLargeintField;
    qryTotaiscredito_fin: TFloatField;
    qryTotaishora_aula: TLargeintField;
    tblTurmascd_unidade_certificadora: TLargeintField;
    tblDisciplinassn_ementa_padrao: TSmallintField;
    tblDiscsn_ementa_padrao: TSmallintField;
    qryGetDptoByColigada: TUMZReadOnlyQuery;
    qyColigadasCadastroTurmaInsert: TUMZQuery;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    SmallintField2: TSmallintField;
    qyContacd_caixa: TIntegerField;
    qyColigadacd_coligada: TLargeintField;
    qryColigadasComboCreatecd_coligada: TLargeintField;
    qyListaGradesCD_GRADE: TLargeintField;
    qyListaGradesCD_CURSO: TStringField;
    qyListaGradesNR_ANO_INICIAL: TIntegerField;
    qyListaGradesSN_ATIVO: TStringField;
    qyGradesCD_GRADE: TLargeintField;
    qyGradesDisciplinasCD_GRADE: TLargeintField;
    qyCursosColigadasCD_GRADE_LK: TLargeintField;
    tblTurmascd_grade_lk: TLargeintField;
    tblGradeGroupcd_grade: TLargeintField;
    qyPlanos: TUMZQuery;
    qyPlanosCD_PLANO: TIntegerField;
    qyPlanosDS_PLANO: TStringField;
    tblTurmasCD_PLANO_PADRAO: TIntegerField;
    tblTurmasdescPlanoPadrao: TStringField;
    DBLookupComboBox4: TDBLookupComboBox;
    Label63: TLabel;
    qyGradesDisciplinasCD_AVALIACAO: TIntegerField;
    cbAvaliacao: TUMComboBox;
    qyGradesDisciplinasDS_AVALIACAO: TStringField;
    qyGradesDisciplinasPRE_REQUISITO: TStringField;
    cbSnExtra: TUMComboBox;
    qyGradesDisciplinasSN_EXTRA: TSmallintField;
    qyGradesDisciplinasDS_EXTRA: TStringField;
    qyAtosOficiaiscd_coligada: TSmallintField;
    Label64: TLabel;
    Label65: TLabel;
    tblTurmasdt_inicio_financeiro: TDateTimeField;
    tblTurmasdt_fim_financeiro: TDateTimeField;
    dbeDatainicioFinanceiro: TDBEdit;
    dbeDataFimFinanceiro: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    tblTurmassn_alterar_boleto: TSmallintField;
    qyAtosOficiaisnm_coligada: TStringField;
    qyColigadasAtosOficiais: TUMZQuery;
    StringField8: TStringField;
    qyColigadasAtosOficiaiscd_coligada: TSmallintField;
    qyGradesNR_CARGA_CURSO: TLargeintField;
    qyGradesNR_CARGA_ATIVIDADES: TLargeintField;
    lblCargaHorariaCurso: TLabel;
    dbeCargaHorariaCurso: TDBEdit;
    Label66: TLabel;
    lblCargaHorariaComplementar: TLabel;
    dbeCargaHorariaComplementar: TDBEdit;
    tblTurmassn_cronograma_geren_inicio_fim: TSmallintField;
    dbchDataInicioFimCronograma: TDBCheckBox;
    dbreBibBasica: TDBRichEdit;
    tblEmentasCODIGO: TLargeintField;
    tblEmentasCURSO: TStringField;
    tblEmentasANOSEMESTRE: TSmallintField;
    tblEmentasEMENTA: TMemoField;
    tblEmentasBIBLIOGRAFIA_BASICA: TBlobField;
    tblEmentasBIBLIOGRAFIA_COMPLEMENTAR: TBlobField;
    tblEmentasOBJETIVO: TMemoField;
    tblEmentasTX_BIB_BASICA_HTML: TMemoField;
    tblEmentasTX_BIB_COMP_HTML: TMemoField;
    dbreBibComp: TDBRichEdit;
    qyTitulacao: TUMZQuery;
    qyTitulacaocd_titulacao: TIntegerField;
    qyTitulacaods_titulacao: TStringField;
    qyTitulacaods_titulacao_masculino: TStringField;
    qyTitulacaods_titulacao_feminino: TStringField;
    qyTitulacaods_chave: TStringField;
    dblbTitulacao: TDBLookupComboBox;
    dsTitulacao: TDataSource;
    lblTitulacao: TLabel;
    tblTurmascd_sala: TLargeintField;
    qrySalas: TUMZReadOnlyQuery;
    qrySalasCD_SALA: TLargeintField;
    qrySalasDS_SALA: TStringField;
    tblTurmasDS_UNI_SALA: TStringField;
    sbBuscaSala: TSpeedButton;
    cbFrentes: TUMComboBox;
    qyGradesDisciplinasFrentes: TUMZQuery;
    qyGradesDisciplinasFrentesSIGLA: TStringField;
    qyGradesDisciplinasFrentesDESCRICAO: TStringField;
    qyGradesDisciplinasFrentesCD_DISCIPLINA: TIntegerField;
    qyGradesDisciplinasDS_DISCIPLINA_FRENTE: TStringField;
    qyGradesDisciplinasCD_DISCIPLINA_FRENTE: TIntegerField;
    tblTurmassn_exporta_moodle: TSmallintField;
    dbcbExportaTurmaMOODLE: TDBCheckBox;
    qyGradesDisciplinasNR_QTD_DIAS_INICIO_MOODLE: TSmallintField;
    qyCursosMestreCD_CURSO: TStringField;
    qyCursosMestreDS_CURSO: TStringField;
    qyCursosMestreDS_APELIDO: TStringField;
    qyCursosMestreNR_GRAU: TSmallintField;
    qyCursosMestreDS_HABILITACAO: TStringField;
    qyCursosMestreSN_ATIVO: TStringField;
    qyCursosMestreNR_RELEVANCIA: TSmallintField;
    qyCursosMestreCD_TITULACAO: TIntegerField;
    qyCursosMestreDS_TITULACAO: TStringField;
    updCursosMestre: TZUpdateSQL;
    qyCursosMestreCD_COLIGADA: TSmallintField;
    qyCursosMestreCD_DEPTO: TSmallintField;
    qyCursosMestreSN_ATIVO_COLIGADA: TSmallintField;
    qyListaDeptosdescricao: TStringField;
    tblDeptosDESCRICAO: TStringField;
    pnOpcoesEmenta: TPanel;
    Label34: TLabel;
    sbBloqueiaValor: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Bevel12: TBevel;
    sbBibNegrito: TSpeedButton;
    sbBibItalico: TSpeedButton;
    sbBibSublinhado: TSpeedButton;
    Label27: TLabel;
    DBEdit5: TDBEdit;
    dbchExportaDisciplinaMoodle: TDBCheckBox;
    tblDiscsn_exporta_moodle: TSmallintField;
    qyGradesDisciplinasSN_OPTATIVA: TSmallintField;
    cbSnOptativa: TUMComboBox;
    qyGradesDisciplinasDS_OPTATIVA: TStringField;
    qyGradesDisciplinasDS_SERIE: TStringField;
    Optativas: TTabSheet;
    TDBGTurmasDisciplinasOptativas: TDBGrid;
    btIncluirOptativa: TButton;
    Button2: TButton;
    dsTurmasDiscilinasOptativas: TDataSource;
    qTurmasDisciplinasOptativas: TUMZQuery;
    qDisciplinasOptativas: TUMZQuery;
    qTurmasDisciplinasOptativasdescricao_generica: TStringField;
    qTurmasDisciplinasOptativasdescricao_optativa: TStringField;
    qTurmasDisciplinasOptativasnr_anosemestre: TIntegerField;
    qTurmasDisciplinasOptativascd_curso: TStringField;
    qTurmasDisciplinasOptativascd_turma: TStringField;
    qTurmasDisciplinasOptativascd_disciplina_generica: TIntegerField;
    qTurmasDisciplinasOptativascd_disciplina_optativa: TIntegerField;
    edFiltroUnidade: TEdit;
    cbFiltroEtapas: TUMComboBox;
    qyGradesDisciplinasNR_CH_TEORICA_PRATICA: TFloatField;
    sbSelecionarColuna: TSpeedButton;
    rgPeriodoTurmas: TDBRadioGroup;
    qyCursosMestreNR_INCREMENTO: TIntegerField;
    qryPendenciasBib: TUMZQuery;
    qryPendenciasFinanceirasBib: TUMZQuery;
    qyAtosOficiaisds_ato: TMemoField;
    qyGradesDisciplinasPRE_REQUISITO_ESPECIAL: TStringField;
    sbBuscaProxTurmaOutroCurso: TSpeedButton;
    sbLimpaProxTurmaOutroCurso: TSpeedButton;
    tblTurmascd_proximo_curso: TStringField;
    tblTurmassn_proximo_curso: TSmallintField;
    LabelProxTurmaMesmoCurso: TLabel;
    Label55: TLabel;
    dbeProxCurso: TDBEdit;
    dbeProxTurmaOutroCurso: TDBEdit;
    dbrgProxTurma: TDBRadioGroup;
    Label46: TLabel;
    qryAreasAtuacao: TUMZQuery;
    dblcbAreasAtuacao: TDBLookupComboBox;
    qryAreasAtuacaocd_area: TLargeintField;
    qryAreasAtuacaods_area: TStringField;
    qyCursosMestreCD_AREA: TIntegerField;
    qyCursosMestreAREA_ATUACAO: TStringField;
    BitBtn1: TBitBtn;
    DBCheckBox10: TDBCheckBox;
    qyCursosMestreSN_NAO_VERIF_DISC_APROVADAS: TSmallintField;
    TabSheet1: TTabSheet;
    dbreBibSup: TDBRichEdit;
    tblEmentasTX_BIB_SUP_HTML: TMemoField;
    tblEmentasBIBLIOGRAFIA_SUPLEMENTAR: TBlobField;
    qyVerificarFinanceiro: TUMZQuery;
    qyVerificarFinanceirocodigoaluno: TIntegerField;
    qyVerificarFinanceiroanosemestre: TSmallintField;
    qyVerificarFinanceiroturmamatricula: TStringField;
    qyVerificaAlunoVinculadoGrade: TUMZQuery;
    qyVerificaAlunoVinculadoGradeqtd: TLargeintField;
    btnMostrarParametroAvaliacao: TButton;
    DBEHorasAula: TDBEdit;
    Label28: TLabel;
    Label67: TLabel;
    cbBloqueioVagas: TUMComboBox;
    dbcbProxTurmaMesmoAnosemestre: TDBCheckBox;
    tblTurmassn_matricula_mesmo_anosem: TSmallintField;
    tblDiscsn_ativo: TSmallintField;
    tbsJustificativa: TTabSheet;
    tbsHabilidadesCompetencias: TTabSheet;
    dbreJustificativa: TDBRichEdit;
    dbreHabilidadesCompetencias: TDBRichEdit;
    tblEmentasME_JUSTIFICATIVA: TBlobField;
    tblEmentasME_HABILIDADES_COMPET: TBlobField;
    tblEmentasTX_JUSTIFICATIVA_HTML: TMemoField;
    tblEmentasTX_HABILIDADES_COMPET_HTML: TMemoField;
    sbLimpaSala: TSpeedButton;
    DBEditResp1: TDBEdit;
    txtResponsavelTurma1: TEdit;
    spResp1: TSpeedButton;
    DBEditResp2: TDBEdit;
    txtResponsavelTurma2: TEdit;
    spResp2: TSpeedButton;
    dbePercMaxReprovacao: TDBEdit;
    Label68: TLabel;
    qyGradesNR_PERC_MAX_REPROVACAO: TFloatField;
    cbSituacoes: TComboBox;
    edSala: TEdit;
    cbAjusteRematricula: TUMComboBox;
    qyGradesDisciplinasSN_AJUSTE_REMATRICULA: TSmallintField;
    qyGradesDisciplinasDS_AJUSTE_REMATRICULA: TStringField;
    DBCheckBox7: TDBCheckBox;
    tmSelecaoCurso: TTimer;
    tmSelecaoColigada: TTimer;
    popupCursoGrade: TPopupMenu;
    dbtCurso: TDBText;
    btnDataLimiteMatricula: TToolButton;
    qyGradesDisciplinasDT_LIMITE: TDateTimeField;
    LabelProxTurmaReprMesmoCurso: TLabel;
    tblTurmascd_proxima_turma_repr_lk: TStringField;
    qyListaProximaTurmaRepr: TUMZQuery;
    dbcbProximaTurmaRepr: TDBLookupComboBox;
    dsListaProximaTurmaRepr: TDataSource;
    tblTurmascd_proxima_turma_repr: TStringField;
    qyAtosOficiaiscd_unidade_certificadora: TIntegerField;
    qyGradesID: TLargeintField;
    tblDiscid_disciplina: TLargeintField;

    procedure dbcbProxTurmaMesmoAnosemestreClick(Sender: TObject);
    procedure btnDataLimiteMatriculaClick(Sender: TObject);
    procedure tmSelecaoColigadaTimer(Sender: TObject);
    procedure tmSelecaoCursoTimer(Sender: TObject);
    procedure dtcCursosMestreDataChange(Sender: TObject; Field: TField);
    procedure cbAjusteRematriculaChange(Sender: TObject);
    procedure cbSituacoesChange(Sender: TObject);
    procedure tblTurmasBeforeOpen(DataSet: TDataSet);
    procedure spResp2Click(Sender: TObject);
    procedure spResp1Click(Sender: TObject);
    procedure sbLimpaSalaClick(Sender: TObject);
    procedure btnPreRequisitoEspecialClick(Sender: TObject);
    procedure tblTurmasAfterOpen(DataSet: TDataSet);
    procedure cbBloqueioVagasChange(Sender: TObject);
    procedure qyGradesDisciplinasAfterRefresh(DataSet: TDataSet);
    procedure dbeDataFimExit(Sender: TObject);
    
    procedure btnMostrarParametroAvaliacaoClick(Sender: TObject);
    
    procedure qyCursosMestreBeforePost(DataSet: TDataSet);
    procedure dbrgProxTurmaChange(Sender: TObject);
    procedure sbLimpaProxTurmaOutroCursoClick(Sender: TObject);
    procedure sbBuscaProxTurmaOutroCursoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure tblAvaliacoes_ParametrosBeforeOpen(DataSet: TDataSet);
    procedure grdGradeColEnter(Sender: TObject);
    procedure edFiltroUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qyGradesDisciplinasAfterDelete(DataSet: TDataSet);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure cbFiltroEtapasChange(Sender: TObject);
    procedure TDBGTurmasDisciplinasOptativasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure TDBGTurmasDisciplinasOptativasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure TDBGTurmasDisciplinasOptativasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure btIncluirOptativaClick(Sender: TObject);
    procedure cbSnOptativaChange(Sender: TObject);
    procedure selecionaTipoProxTurma(isProxTurmaOutroCurso: Boolean);
    procedure updGradesDisciplinasAfterDeleteSQL(Sender: TObject);
    procedure updGradesDisciplinasAfterModifySQL(Sender: TObject);
    procedure cbFrentesChange(Sender: TObject);
    procedure dbeTurmaChange(Sender: TObject);
    procedure dbeTurmaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdGradesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbBuscaSalaClick(Sender: TObject);
    procedure dbreBibBasicaSelectionChange(Sender: TObject);
    procedure sbBibSublinhadoClick(Sender: TObject);
    procedure sbBibItalicoClick(Sender: TObject);
    procedure sbBibNegritoClick(Sender: TObject);
    procedure pcEmentaChange(Sender: TObject);
    procedure dbchDataInicioFimCronogramaClick(Sender: TObject);
    procedure qyGradesDisciplinasAfterPost(DataSet: TDataSet);
    procedure dsGradesDisciplinasDataChange(Sender: TObject; Field: TField);
    procedure cbSnExtraChange(Sender: TObject);
    procedure cbAvaliacaoChange(Sender: TObject);
    procedure sbBloqueiaValorClick(Sender: TObject);
    procedure cbNrEtapasChange(Sender: TObject);
    procedure qyGradesDisciplinasAfterOpen(DataSet: TDataSet);
    procedure lbedPesquisaCursoKeyPress(Sender: TObject; var Key: Char);
    procedure tblDiscAfterInsert(DataSet: TDataSet);
    procedure cbDisciplinaPaiSelect(Sender: TObject);
    procedure dtcDisciplinasStateChange(Sender: TObject);
    procedure cbColigadasDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbColigadasChange(Sender: TObject);
    procedure cbDepartamentoChange(Sender: TObject);
    procedure rgFiltroCursosMestresClick(Sender: TObject);
    procedure sbLimpaClick(Sender: TObject);
    procedure qyGradesAfterOpen(DataSet: TDataSet);
    procedure dbCodDiscPaiEnter(Sender: TObject);
    procedure dbCodDiscPaiKeyPress(Sender: TObject; var Key: Char);
    procedure btnMostraGradesAtivasClick(Sender: TObject);
    procedure btnMostrarGradeTurmaClick(Sender: TObject);
    procedure btnMostrarGradeCursoClick(Sender: TObject);
    procedure qyAtosOficiaisBeforeDelete(DataSet: TDataSet);
    procedure qyGradesAfterPost(DataSet: TDataSet);
    procedure qyGradesDisciplinasBeforePost(DataSet: TDataSet);
    procedure dbnCursosColigadasClick(Sender: TObject; Button: TNavigateBtn);
    procedure pgTurmasChange(Sender: TObject);
    procedure pgTurmasChanging(Sender: TObject; var AllowChange: Boolean);
    procedure UMFiltroDataAnoSemChangeAnoSemestre(Sender: TObject;
      var Valor: Integer; Direction: TUpDownDirection);
    procedure qyCursosColigadasBeforeInsert(DataSet: TDataSet);
    procedure qyCursosColigadasBeforeEdit(DataSet: TDataSet);
    procedure qyCursosColigadasBeforeDelete(DataSet: TDataSet);
    procedure qDocumentosNecessariosBeforeInsert(DataSet: TDataSet);
    procedure qyGradesBeforeInsert(DataSet: TDataSet);
    procedure qyGradesBeforeEdit(DataSet: TDataSet);
    procedure qyGradesBeforeDelete(DataSet: TDataSet);
    procedure tblDiscBeforeInsert(DataSet: TDataSet);
    procedure qyCursosMestreBeforeDelete(DataSet: TDataSet);
    procedure qyCursosMestreBeforeEdit(DataSet: TDataSet);
    procedure tblTurmasBeforeInsert(DataSet: TDataSet);
    procedure qyCursosMestreBeforeInsert(DataSet: TDataSet);
    procedure dsGradesDataChange(Sender: TObject; Field: TField);
    procedure grdGradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange(
      Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubDateTimePickerdtpDataInicioChange(
      Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubDateTimePickerdtpDataFimChange(
      Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubCheckBoxckTurmaAtivaClick(Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubCheckBoxckDataInicioClick(Sender: TObject);
    procedure UMFiltroDataAnoSemUMSubCheckBoxckDataFimClick(Sender: TObject);
    procedure dsGradesStateChange(Sender: TObject);
    procedure dbnAtosOficiaisClick(Sender: TObject; Button: TNavigateBtn);
    procedure dtcCursosColigadasStateChange(Sender: TObject);
    procedure ckbUtilizarCursoClick(Sender: TObject);
    procedure dtcColigadasDataChange(Sender: TObject; Field: TField);
    procedure dtcCursosMestreStateChange(Sender: TObject);
    procedure popPreRequisitoEspecialPopup(Sender: TObject);
    procedure grdDocCellClick(Column: TColumn);
    procedure qDocumentosNecessariosBeforeDelete(DataSet: TDataSet);
    procedure tblDiscBeforeDelete(DataSet: TDataSet);
    procedure tblTurmasBeforeDelete(DataSet: TDataSet);
    procedure tblEmentasBeforePost(DataSet: TDataSet);
    procedure qDocumentosNecessariosBeforePost(DataSet: TDataSet);
    procedure btExcluirClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure TDBGTurmasConveniosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TDBGTurmasConveniosDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure TDBGTurmasConveniosDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dtcTurmasDataChange(Sender: TObject; Field: TField);
    procedure TBConveniosIncluirClick(Sender: TObject);
    procedure btnRenomearTurmaClick(Sender: TObject);
    procedure btnRenomearCursoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbLimparContaClick(Sender: TObject);
    procedure grdCursosDblClick(Sender: TObject);
    procedure pcGeralChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tblEmentasBeforeEdit(DataSet: TDataSet);
    procedure tblGradeBeforeEdit(DataSet: TDataSet);
    procedure qyAtosOficiaisBeforeEdit(DataSet: TDataSet);
    procedure qDocumentosNecessariosBeforeEdit(DataSet: TDataSet);
    procedure tblDiscBeforeEdit(DataSet: TDataSet);
    procedure tblTurmasBeforeEdit(DataSet: TDataSet);
    procedure popPreRequisitoPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtcCursosStateChange(Sender: TObject);
    procedure tblCursosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCopiarTurmaClick(Sender: TObject);
    procedure tblTurmasBeforePost(DataSet: TDataSet);
    procedure dtcTurmasStateChange(Sender: TObject);
    procedure dtcGradeStateChange(Sender: TObject);
    procedure grdGradeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure grdGradeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdGradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblTurmasAfterInsert(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure tblTurmasHoraInicioSetText(Sender: TField;
      const Text: String);
    procedure tblTurmasHoraFimSetText(Sender: TField; const Text: String);
    procedure btnCopiarGradeClick(Sender: TObject);
    procedure tblTurmasAfterPost(DataSet: TDataSet);
    procedure btnMostrarDisciplinasClick(Sender: TObject);
    procedure grdDiscTitleClick(Column: TColumn);
    procedure tblDiscBeforePost(DataSet: TDataSet);
    procedure tblTurmasPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure txtAnoSemestreCursosKeyPress(Sender: TObject; var Key: Char);
    procedure dtcDiscStateChange(Sender: TObject);
    procedure tblDiscNewRecord(DataSet: TDataSet);
    procedure qDocumentosNecessariosAfterInsert(DataSet: TDataSet);
    procedure qDocumentosNecessariosAfterPost(DataSet: TDataSet);
    procedure dsDocumentosNecessariosStateChange(Sender: TObject);
    procedure pcGeralChange(Sender: TObject);
    procedure dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSemanasLetivasNKeyPress(Sender: TObject; var Key: Char);
    procedure DBEHorasAulaKeyPress(Sender: TObject; var Key: Char);
    procedure dbeHoraFimKeyPress(Sender: TObject; var Key: Char);
    procedure tblCursosAvaliacao_Descricao_formaGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure grdDocTitleClick(Column: TColumn);
    procedure DBEdit15KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3Exit(Sender: TObject);
    procedure dtcDiscDataChange(Sender: TObject; Field: TField);
    procedure tblEmentasAfterInsert(DataSet: TDataSet);
    procedure tblEmentasBeforeDelete(DataSet: TDataSet);
    procedure tblEmentasNewRecord(DataSet: TDataSet);
    procedure dsEmentasStateChange(Sender: TObject);

    procedure CopiarGrade( Grade, GradeNova : Integer; Curso: String );
    procedure pmQtdDeptosPopup(Sender: TObject);
    procedure pmQtdTurmasPopup(Sender: TObject);
    procedure pmQtdGradePopup(Sender: TObject);
    procedure pmQtdGradesPopup(Sender: TObject);
    procedure pmQtdDiscPopup(Sender: TObject);
    procedure pmQtdDocumentosNecessariosPopup(Sender: TObject);
    procedure pmQtdAtosOficiaisPopup(Sender: TObject);
    procedure sbPlanoEnsinoClick(Sender: TObject);
    procedure qyAtosOficiaisNewRecord(DataSet: TDataSet);
    procedure qyAtosOficiaisBeforePost(DataSet: TDataSet);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure grdAtosOficiaisDblClick(Sender: TObject);
    procedure BloquearCampoEtapa(Sender: TObject);
    procedure BloquearCampoDataLimite(Sender: TObject);
  strict private
    procedure HabilitarCamposMoodle(bHabilitar: Boolean);
    procedure RecarregarTotaisGC();
    procedure RecarregarFiltroEtapas();
    procedure atualizaGrauCursos(cd_curso : string);
    
  private
    { Private declarations }
      FDisableTimers: Boolean;
    arrUltimasEtapas : array of array of integer;
    arrCursosColigadas: TStringList;

    fieldOrdemDisciplina: String;

    FTelaCarregada,
    TrocouCurso,
    SelecionouColigada : Boolean;
    
    ValorColuna: String;

    PesquisaUnidade: String;
    etapaInicial: String;
    bloqueioIncial: String;
    snUsaProximoCurso : String;
    snMesmoAnoSem : String;
    procedure OnSelectCurso;
    procedure ChangeClassCode;
    function GetHtmlText(RichEdit: TCustomRichEdit): string;
    function permiteTrocarGradeTurma(): Boolean;
    procedure HabilitaEmenta(habilitar: boolean);
    procedure AtualizarEmentas(bMensagem:Boolean = True);
    
    function TemMatriculaNaDisciplina(cd_grade : integer; cd_curso : string; cd_disciplina : integer; nr_serie : integer) : Boolean;
    function getColigadaAtual(): Integer;
    function getColigadasAtivasFromCurso(cd_curso: String): Integer;
    function cancelarAlunosTurma(anosemestre: Integer; turma: String): Boolean;
    procedure cancelarAluno(anosemestre: Integer; curso: String; turma: String; codigoAluno: Integer);
    procedure cancelarDisciplinaAluno(anosemestre: Integer; turma: String; turmamatricula: String; disciplina: Integer; situacao: Integer; codigoAluno: Integer);
    function VerificaBib(codigoAluno: Integer): Boolean;

    procedure atualizaCheck;

    Procedure AlteraPreRequisitos( Sender : TObject );
    Procedure AlteraPreRequisitosEspecial( Sender : TObject );
    Procedure FiltraColigada();
    procedure carregarCursoColigada();
    procedure carregarCursoDepartamentos();
    procedure carregarDepartamentos();
    procedure criarAbasColigadas();
    procedure carregarDisciplinasPai();
    procedure utilizarCurso();
    procedure carregarTurmas();
    procedure alterarAtosOficiais();
    procedure inserirAtosOficiais();
    procedure deletarAtosOficiais();

    function isCentroUnico(): Integer;

    // Esta função desativa o centro caso ele só tenha UMA turma vinculada a ele
    procedure desativaCentro(cd_centro: Integer);

    procedure buscaSala(cd_sala: Integer);

    procedure ativaCentro(cd_centro: Integer);

    procedure direcionaCentro(cd_centro: Integer; sn_inclusao:Boolean);

    function isVinculavelCentro(cd_curso: String; coligada, area, departamento: Integer): Boolean;

    // Cria o centro de custo analítico caso a regra do centro de custo
    // seja "criar um para cada turma" e retorna o codigo do centro.
    function criaCentroCusto(nm_centro: String; cd_centro: Integer): Integer;

    // Tem a função de diferenciar qual tipo de vinculo vai ser criado
    // e se deve ou não criar um centro antes.
    procedure vinculaCentroTurma(nr_regra, cd_centro, nr_anosemestre: Integer; cd_turma: String);

    // Altera o centro de custo da turma
    procedure setCentroTurma(cd_turma: String; cd_centro, nr_anosemestre: Integer);

    // Executa o SQL Regra de um centro de custo específico para ver se é aceito
    function isSQLCentroCustoAceito(SQL: String): Boolean;

    function verificaRegrasCentroTurma(cd_turma: String): Integer;

    procedure CarregaComboAvaliacoes();
    procedure CarregaComboGrau();

    procedure CarregaComboFrentes();

    procedure mostraGrade(cd_grade: Integer);

    procedure mostraParametroAvaliacoes(cd_avaliacao: Integer);

    procedure FiltrarPlanos(filtro_anosemestre: Integer);
    procedure VerificaTurmaInPlanoPagamento();

    { Controle de Visibilidade das abas }
    procedure mostraAba(var painel: TPanel);

    { Ações de exclusão com verificação }
    procedure excluirGradeCurricular();

    procedure FiltraCursosMestres();

    procedure verificaPermissoes();

    procedure atualizaDepartamento();

    function tbKeyIsDown(const Key: integer): boolean;
    function validaCodigoTurma(codigo:string):boolean;
    function verificaPodeExcluirTurma(anosemestre: integer; turma: string): boolean;
    function verificaTabelasMysam(var numTabelas:integer): boolean;

    function verificarDiplomaCurriculoDigital(idGrade: Integer; snExibirAviso: Boolean = True): boolean;
    function verificarDiplomaCurriculoDigitalDisciplina(idDisciplina: Integer; snExibirAviso: Boolean = True): boolean;

    procedure FiltraCursos;
    procedure gravaLog();

  public
    { Public declarations }
    pedir_dados_grade : boolean;
    bCor : boolean;
    iSerieAtual: integer;
    bMostrarGrades  : boolean;
    bTrocandoCodigo : boolean;
    bTrocandoGrade  : boolean;
    bAlterarGrade, bIncluirGrade, bExcluirGrade : boolean;
    sDisciplinaPaiAntiga : String;

    expressaoRegularCodigoTurma: string;

    class procedure atualizaTurmas();

    // Copia da procedure de desativarcentro no contexto de class...
    class procedure desativaCentroAoAtualizarTurma(cd_centro: Integer);

    procedure realizaExpressaoRegular(Sender: TObject);

    // Esta procedure tem por objetivo inserir
    procedure setTurmaCentroCusto(cd_turma: String; nr_anosemestre: Integer; copiaTurma: Boolean = False);


      function LocateTurma(const TurmaId: AnsiString;
         const AnoSemestre: Integer): Boolean;
  end;

const
   SSQLSelectCursos =
      'SELECT DISTINCT ' +
         'CM.CD_CURSO,' +
         'CM.DS_CURSO,' +
         'CM.DS_APELIDO,' +
         'CM.NR_GRAU,' +
         'CM.DS_HABILITACAO,' +
         'CM.SN_ATIVO,' +
         'CM.NR_RELEVANCIA,' +
         'CM.CD_TITULACAO,' +
         'CC.CD_COLIGADA,' +
         'CC.CD_DEPTO,' +
         'CM.NR_INCREMENTO, ' +
         'CC.SN_ATIVO SN_ATIVO_COLIGADA, ' +
         'CM.CD_AREA, ' +
         'CM.SN_NAO_VERIF_DISC_APROVADAS, ' +
         'CC.CD_CURSO_EQUIVALENTE, ' +
         '(SELECT CD_COLIGADA FROM CURSOS_MESTRE where CD_CURSO = CC.CD_CURSO_EQUIVALENTE) AS ds_curso_equiv '+
      'FROM ' +
	      'CURSOS_MESTRE CM ' +
		      'LEFT JOIN CURSOS_COLIGADAS CC ON      ' +
			      '(CM.CD_CURSO = CC.CD_CURSO)        ' +
			   'JOIN NU_GRUPOS_PESSOAS GP ON          ' +
            '   (CC.CD_COLIGADA = GP.CD_COLIGADA)  ' +
      'WHERE ' +
	      'GP.CD_PESSOA = :CD_PESSOA AND ' +
	      '( ' +
            'CC.CD_COLIGADA IS NULL OR ' +
            'CC.CD_COLIGADA in ( ' +
               'SELECT ' +
                  'C.CD_COLIGADA ' +
               'FROM ' +
                  'COLIGADAS C ' +
               'WHERE ' +
                  'CC.CD_COLIGADA = C.CD_COLIGADA OR ' +
                  'GP.CD_COLIGADA = C.CD_COLIGADA_MATRIZ ' +
            ') ' +
         ') ';

   SSQLSelectCursosTodos =
      'SELECT DISTINCT ' +
         'CM.CD_CURSO, ' +
         'CM.DS_CURSO, ' +
         'CM.DS_APELIDO, ' +
         'CM.NR_GRAU, ' +
         'CM.DS_HABILITACAO, ' +
         'CM.SN_ATIVO, ' +
         'CM.NR_RELEVANCIA, ' +
         'CM.CD_TITULACAO, ' +
         'CC.CD_COLIGADA, ' +
         'CC.CD_DEPTO, ' +
         'CM.NR_INCREMENTO, ' +
         'CC.SN_ATIVO SN_ATIVO_COLIGADA, ' +
         'CM.CD_AREA, ' +
         'CM.SN_NAO_VERIF_DISC_APROVADAS ' +
      'FROM ' +
	      'CURSOS_MESTRE CM ' +
		      'LEFT JOIN CURSOS_COLIGADAS CC ON ' +
			      '(CM.CD_CURSO = CC.CD_CURSO) ' +
      'WHERE ' +
	      '( ' +
            'CC.CD_COLIGADA IS NULL OR ' +
            'CC.CD_COLIGADA IN ( ' +
               'SELECT ' +
                  'C.CD_COLIGADA ' +
               'FROM ' +
                  'COLIGADAS C ' +
               'WHERE ' +
                  'CC.CD_COLIGADA = C.CD_COLIGADA ' +
            ') ' +
         ')';

   SSQLCursosGroup = ' GROUP BY CM.CD_CURSO ';

var
  frmCursos: TfrmCursos;
  glogal_cd_instituicao : String;
  cd_coligada_locate : String;

implementation

uses
   uDM,Main, uTableFields, Math, StrUtils, uAtosOficiais, uGrade_Professor, uClassMovimento,
   uGrade_Horarios, uUsuario, uCursosCopia, uCursosTurmasAdicionais, uItemCombo,
   uFCopiaTurma , UFCadSalas, uCursoMestre, uChecarUsoColigada, uCamposPlanilhas, ClassDisciplinas,
   uSala, uTurma, uFSelecionarTurma,uFSelecionarPessoa, uProcessando,uFSplash, uRemessaClass;

{$R *.DFM}

procedure TfrmCursos.desativaCentro(cd_centro: Integer);
var
   qryVerificaNumeroTurmas,
   qryDesativaCentro: TUMZQuery;
const
   SQL_NUMERO_TURMAS =
      ' SELECT ' +
      ' 	count(t.codigo) AS qtd ' +
      ' FROM ' +
      ' 	turmas AS t ' +
      'INNER JOIN situacoes s ON (s.cd_situacao = t.cd_situacao AND s.cd_modulo=1148) '+
      ' WHERE ' +
      ' 	t.cd_centro = :cd_centro '+
      'AND s.cd_auxiliar = 1';

   SQL_DESATIVA_CENTRO =
      ' UPDATE ' +
      ' 	fin_config_centro_custos ' +
      ' SET ' +
      ' 	sn_ativo = 0 ' +
      ' WHERE ' +
      ' 	cd_centro = :cd_centro ';

begin
   DM.CriarConsulta(qryVerificaNumeroTurmas);
   DM.CriarConsulta(qryDesativaCentro);

   qryVerificaNumeroTurmas.SQL.Text := SQL_NUMERO_TURMAS;
   qryVerificaNumeroTurmas.ParamByName('cd_centro').AsInteger := cd_centro;
   qryVerificaNumeroTurmas.Open;

   if qryVerificaNumeroTurmas.FieldByName('qtd').AsInteger = 1 then
   begin
      qryDesativaCentro.SQL.Text := SQL_DESATIVA_CENTRO;
      qryDesativaCentro.ParamByName('cd_centro').AsInteger := cd_centro;
      qryDesativaCentro.ExecSQL;
   end;
end;


procedure TfrmCursos.ativaCentro(cd_centro: Integer);
var
   qryAtivaCentro: TUMZQuery;
const
   SQL_ATIVA_CENTRO =
      ' UPDATE ' +
      ' 	fin_config_centro_custos ' +
      ' SET ' +
      ' 	sn_ativo = 1 ' +
      ' WHERE ' +
      ' 	cd_centro = :cd_centro ';
begin
   DM.CriarConsulta(qryAtivaCentro);
   qryAtivaCentro.SQL.Text := SQL_ATIVA_CENTRO;
   qryAtivaCentro.ParamByName('cd_centro').AsInteger := cd_centro;
   qryAtivaCentro.ExecSQL;
   FreeAndNil(qryAtivaCentro);
end;

procedure TfrmCursos.direcionaCentro(cd_centro: Integer;sn_inclusao:Boolean);
var
   qryBuscaCentro: TUMZQuery;
begin
   //Se for inclusão vamos buscar o centro da turma, pois ele acabou de ser adicionado
   if(sn_inclusao = true) then
   begin
      DM.CriarConsulta(qryBuscaCentro);
      qryBuscaCentro.SQL.Text := 'select cd_centro from turmas where codigo = ' + QuotedStr(tblTurmasCodigo.AsString);
      qryBuscaCentro.Open;
      
      if(qryBuscaCentro.IsEmpty) then
      begin
         Exit;
      end;

      cd_centro := qryBuscaCentro.FieldByName('cd_centro').AsInteger;
      FreeAndNil(qryBuscaCentro);
   end;

   if not(qrySituacoesTurmascd_auxiliar.IsNull) then
   begin
      case qrySituacoesTurmascd_auxiliar.AsInteger of
         1:
         begin
            ativaCentro(cd_centro);
         end;
         2:
         begin
            desativaCentro(cd_centro);
         end;
         3:
         begin
            desativaCentro(cd_centro);
         end;
      end;
   end;
end;

class procedure TfrmCursos.atualizaTurmas();
const
   SQL_BUSCA_TURMAS =
      '  SELECT '+
      '     codigo, '+
      '     anosemestre,'+
      '     cd_centro  '+
      '  FROM '+
      '     turmas  '+
      '  WHERE '+
      '     cd_situacao = 1 '+
      '     AND NOW() >= dataconclusao '+
      '     AND dataconclusao <> ''0000-00-00 00:00:00''';

   SQL_BUSCA_SITUACAO =
      ' SELECT cd_auxiliar '+
      ' FROM  situacoes S WHERE cd_modulo = 1148 '+
      ' AND cd_situacao = 3';

   SQL_ALTERA_TURMAS =
      ' UPDATE '+
      '     turmas '+
      '  SET '+
      '     cd_situacao = 3 '+
      '  WHERE '+
      '     anosemestre = :anosemestre '+
      '     AND codigo = :codigo ';
var
   qryBuscaTurmas: TUMZReadOnlyQuery;
   qryAlteraTurma: TUMZQuery;
   qryBuscaSituacao : TUMZQuery;
begin

   if DM.variavel_parametro('atualizar_turmas_concluidas') <> 'S' then
   begin
      Exit;
   end;

   DM.CriarConsulta(qryBuscaTurmas);
   DM.CriarConsulta(qryAlteraTurma);
   DM.CriarConsulta(qryBuscaSituacao);


   qryBuscaSituacao.SQL.Text := SQL_BUSCA_SITUACAO;
   qryBuscaSituacao.Open;

   qryBuscaTurmas.SQL.Text := SQL_BUSCA_TURMAS;
   qryBuscaTurmas.Open;

   while not qryBuscaTurmas.Eof do
   begin
      qryAlteraTurma.Params.Clear;

      qryAlteraTurma.SQL.Text := SQL_ALTERA_TURMAS;

      qryAlteraTurma.ParamByName('anosemestre').AsInteger :=
         qryBuscaTurmas.FieldByName('anosemestre').AsInteger;
      qryAlteraTurma.ParamByName('codigo').AsString :=
         qryBuscaTurmas.FieldByName('codigo').AsString;
      qryAlteraTurma.ExecSQL;

      DM.setLog(
         1,
         'alteracao',
         qryBuscaTurmas.FieldByName('codigo').AsString + ';' +
         qryBuscaTurmas.FieldByName('anosemestre').AsString,
         DM.UsuarioLogado.GetColigadaLogada.Codigo,
         'Alteração da turma para situação CONCLUIDA, automático quando se abre o sistema. Chave = codigo;anosemestre'
      );

      //Chamamos o tratamento para desativar os centros de custos

      if (qryBuscaSituacao.FieldByName('cd_auxiliar').AsInteger = 2) OR (qryBuscaSituacao.FieldByName('cd_auxiliar').AsInteger = 3) then
      begin
         desativaCentroAoAtualizarTurma(qryBuscaTurmas.FieldByName('cd_centro').AsInteger);
      end;
      
      qryBuscaTurmas.Next;
   end;
end;

class procedure TfrmCursos.desativaCentroAoAtualizarTurma(cd_centro: Integer);
var
   qryVerificaNumeroTurmas,
   qryDesativaCentro: TUMZQuery;
const
   SQL_NUMERO_TURMAS =
      ' SELECT ' +
      ' 	count(t.codigo) AS qtd ' +
      ' FROM ' +
      ' 	turmas AS t ' +
      'INNER JOIN situacoes s ON (s.cd_situacao = t.cd_situacao AND s.cd_modulo=1148) '+
      ' WHERE ' +
      ' 	t.cd_centro = :cd_centro '+
      'AND s.cd_auxiliar = 1';

   SQL_DESATIVA_CENTRO =
      ' UPDATE ' +
      ' 	fin_config_centro_custos ' +
      ' SET ' +
      ' 	sn_ativo = 0 ' +
      ' WHERE ' +
      ' 	cd_centro = :cd_centro ';

begin
   DM.CriarConsulta(qryVerificaNumeroTurmas);
   DM.CriarConsulta(qryDesativaCentro);

   qryVerificaNumeroTurmas.SQL.Text := SQL_NUMERO_TURMAS;
   qryVerificaNumeroTurmas.ParamByName('cd_centro').AsInteger := cd_centro;
   qryVerificaNumeroTurmas.Open;

   if qryVerificaNumeroTurmas.FieldByName('qtd').AsInteger = 0 then
   begin
      qryDesativaCentro.SQL.Text := SQL_DESATIVA_CENTRO;
      qryDesativaCentro.ParamByName('cd_centro').AsInteger := cd_centro;
      qryDesativaCentro.ExecSQL;
   end;
end;

function TfrmCursos.isCentroUnico(): Integer;
const
   SQL_BUSCA_CENTRO = ' SELECT '+
                      '     cd_centro '+
                      '  FROM '+
                      '     fin_config_centro_custos '+
                      '  WHERE '+
                      '     tp_centro = 1 '+
                      '     AND cd_coligada_matriz = :cd_coligada_matriz ';

var
   qryBuscaCentro: TUMZReadOnlyQuery;
begin
   Result := -1;

   DM.CriarConsulta(qryBUscaCentro);

   qryBuscaCentro.SQL.Text := SQL_BUSCA_CENTRO;
   qryBuscaCentro.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.UsuarioLogado.ColigadaLogada;
   qryBuscaCentro.Open;

   if qryBuscaCentro.RecordCount = 1 then
   begin
      Result := qryBuscaCentro.FieldByName('cd_centro').AsInteger;
   end;
end;

function TfrmCursos.LocateTurma(const TurmaId: AnsiString;
   const AnoSemestre: Integer): Boolean;
const
   SQLSelectTurma = ''
      + ' SELECT '
      + ' 	CD_COLIGADA, '
      + ' 	CURSO '
      + ' FROM '
      + ' 	TURMAS '
      + ' WHERE '
      + ' 	CODIGO = ? AND '
      + ' 	ANOSEMESTRE = ? ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   CursoId: AnsiString;
   ColigadaId: Integer;
begin
   SendMessage(pcGeral.Handle, WM_SETREDRAW, WPARAM(False), 0);
   FDisableTimers := True;
   
   try
   
      Result := False;
      Stmt := PrepareStatement(SQLSelectTurma);
      try
         Stmt.SetString(1, TurmaId);
         Stmt.SetInt(2, AnoSemestre);
         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
            begin
               Result := True;
               CursoId := Rs.GetStringByName('CURSO');
               ColigadaId := Rs.GetIntByName('CD_COLIGADA');
            end;
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;

      if Result then
      begin
         rgFiltroCursosMestres.ItemIndex := 2;
         qyColigada.DisableControls;
         qyCursosMestre.DisableControls;
         tblTurmas.DisableControls;

         if qyColigada.Locate('cd_coligada', ColigadaId, []) then
         begin
            carregarDepartamentos;
            FiltraCursos;

            if qyCursosMestre.Locate('CD_CURSO', CursoId, []) then
            begin
               OnSelectCurso;
               pcGeral.ActivePage := tsTurmas;
               pcGeralChange(pcGeral);
               UMFiltroDataAnoSem.setAnosemestreInicial(AnoSemestre);
               UMFiltroDataAnoSem.FiltroDataCheckBoxTurmaAtiva.Checked := False;
               carregarTurmas;
               tblTurmas.Locate('CODIGO', TurmaId, []);
            end;
         end;

         qyColigada.EnableControls;
         qyCursosMestre.EnableControls;
         tblTurmas.EnableControls;
      end;

   finally
      FDisableTimers := False;
      SendMessage(pcGeral.Handle, WM_SETREDRAW, WPARAM(True), 0);
      pcGeral.Invalidate;
   end;
end;

function TfrmCursos.verificaRegrasCentroTurma(cd_turma: String): Integer;
var
   qryRegrasCentro,
   qryInfoTurma: TUMZReadOnlyQuery;

const
   SQL_INFO_TURMAS =
      ' SELECT ' +
      ' 	t.cd_coligada AS coligada, ' +
      ' 	cm.CD_AREA AS area, ' +
      ' 	d.codigo AS departamento, ' +
      ' 	cm.CD_CURSO AS curso ' +
      ' FROM ' +
      ' 	turmas AS t ' +
      ' LEFT JOIN cursos_mestre AS cm ON( ' +
      ' 	cm.CD_CURSO = t.curso ' +
      ' ) ' +
      ' LEFT JOIN cursos_coligadas AS cc ON( ' +
      ' 	cc.CD_CURSO = t.curso ' +
      ' 	AND cc.CD_COLIGADA = t.cd_coligada ' +
      ' ) ' +
      ' LEFT JOIN departamentos AS d ON( ' +
      ' 	d.codigo = cc.CD_DEPTO ' +
      ' ) ' +
      ' WHERE ' +
      '  t.codigo = :cd_turma ';

   SQL_REGRAS_CENTRO =
      ' SELECT ' +
      ' 	IFNULL(fcc.cd_coligada, '''') AS cd_coligada, ' +
      ' 	IFNULL(fca.cd_area, '''') AS cd_area, ' +
      ' 	IFNULL(fcd.cd_departamento,'''') AS cd_departamento, ' +
      ' 	IFNULL(fcu.cd_curso, '''') AS cd_curso, ' +
      ' 	fcc.cd_centro ' +
      ' FROM ' +
      ' 	fin_centro_coligadas AS fcc ' +
      ' LEFT JOIN fin_centro_departamentos AS fcd ON ( ' +
      ' 	fcd.cd_centro = fcc.cd_centro ' +
      ' 	AND fcd.cd_coligada = fcc.cd_coligada ' +
      ' ) ' +
      ' LEFT JOIN fin_centro_areas AS fca ON ( ' +
      ' 	fca.cd_centro = fcc.cd_centro ' +
      ' ) ' +
      ' LEFT JOIN fin_centro_cursos AS fcu ON ( ' +
      ' 	fcu.cd_centro = fcc.cd_centro ' +
      ' 	AND fcu.cd_departamento = fcd.cd_departamento ' +
      ' ) ' +
      ' LEFT JOIN fin_config_centro_custos AS fccc ON( ' +
      ' 	fccc.cd_centro = fcc.cd_centro ' +
      ' ) ' +
      ' WHERE ' +
      '  fccc.nr_tipo_regra > 1 ' + 
      ' ORDER BY ' +
      ' 	fcu.cd_curso DESC, fcd.cd_departamento DESC, fca.cd_area DESC, ' +
      '  fcc.cd_coligada DESC, fccc.cd_classificacao DESC ';

begin
   Result := -1;

   DM.CriarConsulta(qryRegrasCentro);
   DM.CriarConsulta(qryInfoTurma);

   qryInfoTurma.SQL.Text := SQL_INFO_TURMAS;
   qryInfoTurma.ParamByName('cd_turma').AsString := cd_turma;
   qryInfoTurma.Open;

   qryRegrasCentro.SQL.Text := SQL_REGRAS_CENTRO;
   qryRegrasCentro.Open;

   if qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         qryInfoTurma.FieldByName('coligada').AsInteger,
         qryInfoTurma.FieldByName('area').AsInteger,
         qryInfoTurma.FieldByName('departamento').AsInteger,
         qryInfoTurma.FieldByName('curso').AsString
      ]), []) then
   begin
      Result := qryRegrasCentro.FieldByName('cd_centro').AsInteger;
      Exit;
   end;

   if qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         qryInfoTurma.FieldByName('coligada').AsInteger,
         qryInfoTurma.FieldByName('area').AsInteger,
         qryInfoTurma.FieldByName('departamento').AsInteger,
         ''
      ]), []) then
   begin
      Result := qryRegrasCentro.FieldByName('cd_centro').AsInteger;
      Exit;
   end;

   if qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         qryInfoTurma.FieldByName('coligada').AsInteger,
         qryInfoTurma.FieldByName('area').AsInteger,
         '',
         ''
      ]), []) then
   begin
      Result := qryRegrasCentro.FieldByName('cd_centro').AsInteger;
      Exit;
   end;

   if qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         qryInfoTurma.FieldByName('coligada').AsInteger,
         '',
         '',
         ''
      ]), []) then
   begin
      Result := qryRegrasCentro.FieldByName('cd_centro').AsInteger;
      Exit;
   end;
end;

procedure TfrmCursos.vinculaCentroTurma(nr_regra, cd_centro, nr_anosemestre: Integer; cd_turma: String);
var
   nm_centro: String;
begin
   if nr_regra = 2 then
   begin
      setCentroTurma(
         cd_turma,
         cd_centro,
         nr_anosemestre
      );
   end;

   // Caso a regra esteja estabelecida que deve criar um centro de custo
   // analítico para cada turma, então usa o centro passado como parâmetro
   // para criar um filho dele.
   if nr_regra = 3 then
   begin

      nm_centro := cd_turma + ' - ' + IntToStr(nr_anosemestre);

      setCentroTurma(
         cd_turma,
         criaCentroCusto(
            nm_centro,
            cd_centro
         ),
         nr_anosemestre
      );
   end;
end;

function TfrmCursos.criaCentroCusto(nm_centro: String; cd_centro: Integer): Integer;
var
   grauCentro: Integer;
begin
   frm_CadCentros := Tfrm_CadCentros.Create(nil);

   frm_CadCentros.qyCentrosCustos.Insert;
   frm_CadCentros.qyCentrosCustoscd_centro_pai.AsInteger := cd_centro;

   grauCentro := frm_CadCentros.getGrauParentesco(cd_centro);
   
   frm_CadCentros.qyCentrosCustoscd_classificacao.AsString := frm_CadCentros.getClassificacao(grauCentro, cd_centro);
   frm_CadCentros.qyCentrosCustosnr_tipo_regra.AsInteger := 1;
   frm_CadCentros.qyCentrosCustostp_centro.AsInteger := 1;
   frm_CadCentros.qyCentrosCustosds_centro.AsString := nm_centro;
   frm_CadCentros.qyCentrosCustosds_observacao.AsString :=
      'Este centro de custo foi criado automáticamente para a turma: ' + nm_centro;

   Result := frm_CadCentros.qyCentrosCustoscd_centro.AsInteger;

   frm_CadCentros.qyCentrosCustos.Post;

   frm_CadCentros.Free;
end;

procedure TfrmCursos.setCentroTurma(cd_turma: String; cd_centro, nr_anosemestre: Integer);
var
   qryUpdateTurma: TUMZQuery;

const
   SQL_UPDATE_TURMA = ' UPDATE turmas SET cd_centro = :cd_centro WHERE ' +
      ' codigo = :cd_turma AND anosemestre = :nr_anosemestre ';

begin
   DM.CriarConsulta(qryUpdateTurma);

   qryUpdateTurma.SQL.Text := SQL_UPDATE_TURMA;

   qryUpdateTurma.ParamByName('cd_centro').AsInteger := cd_centro;
   qryUpdateTurma.ParamByName('cd_turma').AsString := cd_turma;
   qryUpdateTurma.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;

   qryUpdateTurma.ExecSQL;
end;

function TfrmCursos.isSQLCentroCustoAceito(SQL: String): Boolean;
var
   qryVerificaSQLAceito: TUMZReadOnlyQuery;
begin
   Result := False;

   if SQL = '' then
   begin
      Exit;
   end;

   DM.CriarConsulta(qryVerificaSQLAceito);
   SQL := StringReplace(SQL, ':nr_anosemestre', tblTurmas.FieldByName('ANOSEMESTRE').AsString, [rfReplaceAll]);
   SQL := StringReplace(SQL, ':cd_turma', '"' + tblTurmas.FieldByName('CODIGO').AsString + '"', [rfReplaceAll]);
   qryVerificaSQLAceito.SQL.Text := SQL;
   qryVerificaSQLAceito.Open;

   if qryVerificaSQLAceito.FieldByName('sn_aceito').AsInteger = 1 then
   begin
      Result := True;
   end;
end;

procedure TfrmCursos.setTurmaCentroCusto(cd_turma: String; nr_anosemestre: Integer; copiaTurma: Boolean = False );
var
   proximo                 : Boolean;

   nm_curso                : String;

   qryBuscaCentrosRegras   : TUMZReadOnlyQuery;
const
   SQL_CENTROS_REGRAS =
      ' SELECT ' +
      ' 	cd_centro, ' +
      ' 	ds_sql, ' +
      '  nr_tipo_regra ' +
      ' FROM ' +
      ' 	fin_config_centro_custos ' +
      ' WHERE ' +
      '	nr_tipo_regra > 1  ' +
      ' ORDER BY ' +
      '  cd_classificacao ';


begin
   DM.CriarConsulta(qryBuscaCentrosRegras);

   qryBuscaCentrosRegras.SQL.Text := SQL_CENTROS_REGRAS;
   qryBuscaCentrosRegras.Open;

   proximo := True;

   // Deve parar somente se ja encontrou algum centro para vincular,
   // ou se acabou os centros de custos possíveis.
   while not(qryBuscaCentrosRegras.Eof) and proximo do
   begin

      // Verifica se o SQL do centro de custo é aceito OU
      // as regras configuradas.
      if isSQLCentroCustoAceito(qryBuscaCentrosRegras.FieldByName('ds_sql').AsString) then
      begin
         proximo := False;

         // Aplica o CONTINUE pois não deve trocar qual centro de custo que
         // será aplicado o vínculo com a turma.
         Continue;
      end;

      qryBuscaCentrosRegras.Next;
   end;

   // Se não encontrou nenhum centro de custo por regras de SQL, verifica as
   // regras fixas
   if proximo and
      qryBuscaCentrosRegras.Locate('cd_centro', verificaRegrasCentroTurma(cd_turma), []) then
   begin
      proximo := False;
   end;

   // Faz o vínculo do centro de custo com turma, conforme regra do centro.
   if not(proximo) then
   begin
      vinculaCentroTurma(
         qryBuscaCentrosRegras.FieldByName('nr_tipo_regra').AsInteger,
         qryBuscaCentrosRegras.FieldByName('cd_centro').AsInteger,
         nr_anosemestre,
         cd_turma
      );
   end;
end;

procedure TfrmCursos.FiltraCursos;
const
   SFiltroAtivo = 'SN_ATIVO = ''S''';
   SFiltroInativo = 'SN_ATIVO = ''N''';
   SFiltroColigada = 'SN_ATIVO_COLIGADA = 1 AND CD_COLIGADA = %d';
   SFiltroDepto = 'CD_DEPTO = %s';
   SFiltroNome = ' DS_CURSO LIKE ''*%s*'' OR CD_CURSO LIKE ''*%s*'' ';

   SFiltroEquivalentes = ' SELECT '+
                         '   cd_curso '+
                         ' FROM '+
                         '    cursos_coligadas '+
                         ' WHERE '+
                         '    CD_CURSO_EQUIVALENTE LIKE ';

var
   S, Depto, Nome, SQL, SQLc, separador: string;
   Coligada: Integer;
   Agrupado, Desagrupar: Boolean;
   qryBuscaEquivalentes: TUMZReadOnlyQuery;
begin
   S := '';

   Agrupado := EndsText(Trim(SSQLCursosGroup), Trim(qyCursosMestre.SQL.Text));
   
   if rgFiltroCursosMestres.ItemIndex = 0 then
   begin
      S := SFiltroAtivo
   end
   else
   begin
      if rgFiltroCursosMestres.ItemIndex = 1 then
      begin
         S := SFiltroInativo;
      end;
   end;

   Coligada := qyColigadacd_coligada.AsInteger;

   Desagrupar := False;
   SQLc := SSQLSelectCursosTodos;
   SQL := SQLc + SSQLCursosGroup;

   if (Coligada > 0) or (cbDepartamento.ItemIndex > 0) then
   begin
      Desagrupar := True;
      SQL := SQLc;
   end;

   if Coligada > 0 then
   begin
      if S <> '' then
      begin
         S := S + ' AND ';
      end;

      S := S + Format(SFiltroColigada, [Coligada]);
   end;

   if cbDepartamento.ItemIndex > 0 then
   begin
      Depto := TItemCombo(cbDepartamento.Items.Objects[cbDepartamento.ItemIndex]).getCodigo;

      if S <> '' then
      begin
         S := S + ' AND ';
      end;
      
      S := S + Format(SFiltroDepto, [Depto]);
   end;

   Nome := Trim(lbedPesquisaCurso.Text);
   
   if Nome <> '' then
   begin

      if S <> '' then
      begin
         S := S + ' AND ';
      end;

      S := S + ' ( ' + Format(SFiltroNome, [Nome, Nome]);

      DM.CriarConsulta(qryBuscaEquivalentes);

      qryBuscaEquivalentes.SQL.Text := SFiltroEquivalentes + QuotedStr('%' + Nome + '%');
      qryBuscaEquivalentes.Open;

      if qryBuscaEquivalentes.RecordCount > 0 then
      begin
         S := S + ' OR ';

         separador := '';

         while not qryBuscaEquivalentes.Eof do
         begin
            S := S + separador + ' cd_curso LIKE ' + QuotedStr('*'+qryBuscaEquivalentes.FieldByName('cd_curso').AsString+'*');

            separador := ' OR ';
            qryBuscaEquivalentes.Next;
         end;
      end;

      S := S + ' )';
   end;

   if (Agrupado and Desagrupar) or ((not Agrupado) and (not Desagrupar)) then
   begin
      qyCursosMestre.Close;
      qyCursosMestre.SQL.Text := SQL;
   end;

   if S <> '' then
   begin
      qyCursosMestre.Filter := S;
      qyCursosMestre.Filtered := True;
   end
   else
   begin
      qyCursosMestre.Filtered := False;
   end;

   if not qyCursosMestre.Active then
   begin
      qyCursosMestre.Open;
   end;

   qyCursosMestre.First;
end;

Procedure TfrmCursos.FiltraColigada();
const
   SQL_FILTRO_COLIGADAS =
      ' SELECT '+
      '  * '+
      ' FROM '+
      '   (SELECT '+
      '      0 AS cd_coligada, '+
      '      ''Todas as Unidades de Ensino'' AS nm_coligada, '+
      '      0 AS nr_ordem '+
      '   FROM '+
      '      dual '+
      '   UNION '+
      '   SELECT '+
      '      cd_coligada, nm_coligada, 1 '+
      '   FROM '+
      '      coligadas '+
      '   WHERE' +
      '      nm_coligada LIKE :filtro_coligada '+
      ' ) tabela '+
      'ORDER BY '+
      '   nr_ordem, '+
      '   nm_coligada ';
var
   iAux: Integer;     
begin
   qyColigada.Close;
   qyColigada.SQL.Text := SQL_FILTRO_COLIGADAS;
   qyColigada.ParamByName('filtro_coligada').AsString := '%'+edFiltroUnidade.Text+'%';
   qyColigada.Open;

   if qyColigadacd_coligada.AsInteger = 0 then
   begin
      qyColigada.First;
      qyColigada.Next;
   end;
   
   qryColigadasComboCreate.SQL.Text := qyColigada.SQL.Text;

   qryColigadasComboCreate.Open;

   qryColigadasComboCreate.First();

   while not qryColigadasComboCreate.Eof do
   begin
      if qryColigadasComboCreatecd_coligada.AsInteger > 0 then
      begin
         iAux := cbColigadas.Items.AddObject( qryColigadasComboCreatenm_coligada.AsString,
            TItemCombo.Create(
                  qryColigadasComboCreatecd_coligada.AsString,
                  qryColigadasComboCreatenm_coligada.AsString
               )
            );
      end;

      qryColigadasComboCreate.Next();
   end;

   qryColigadasComboCreate.First();
end;

procedure TfrmCursos.FiltraCursosMestres();
var
   SQL_FILTRO_CURSOS_MESTRE: String;
begin
   if qyColigadacd_coligada.AsInteger > 0 then
      SQL_FILTRO_CURSOS_MESTRE := ' SELECT DISTINCT cm.* FROM CURSOS_MESTRE cm INNER JOIN CURSOS_COLIGADAS cc ON (cm.cd_curso = cc.cd_curso) WHERE 1=1 '
   else
      SQL_FILTRO_CURSOS_MESTRE := ' SELECT DISTINCT cm.* FROM CURSOS_MESTRE cm LEFT JOIN CURSOS_COLIGADAS cc ON (cm.cd_curso = cc.cd_curso) WHERE 1=1 ';


   if rgFiltroCursosMestres.ItemIndex = 0 then
   begin
      SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cm.SN_ATIVO = '+QuotedStr('S')+' ';

      if qyColigadacd_coligada.AsInteger > 0 then
         SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cc.SN_ATIVO = 1 ';
   end
   else
   begin
      if rgFiltroCursosMestres.ItemIndex = 1 then
      begin
         SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cm.SN_ATIVO = '+QuotedStr('N')+' ';

         if qyColigadacd_coligada.AsInteger > 0 then
            SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cc.SN_ATIVO = 1 ';
      end;

   end;

   if cbDepartamento.ItemIndex > 0 then
   begin
      SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cc.cd_depto = ' + TItemCombo(cbDepartamento.Items.Objects[cbDepartamento.ItemIndex]).getCodigo() + ' ';
   end;

   if qyColigadacd_coligada.AsInteger > 0 then
   begin
      SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cc.cd_coligada = ' + qyColigadacd_coligada.AsString + ' ';
   end
   else
   begin
      SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' AND cc.cd_coligada IN (' + DM.GetColigadas() + ')';
   end;


   SQL_FILTRO_CURSOS_MESTRE := SQL_FILTRO_CURSOS_MESTRE + ' ORDER BY DS_CURSO ';

   with qyCursosMestre do
   begin
      Close();
      SQL.Text := SQL_FILTRO_CURSOS_MESTRE;
      Open();
      First();
   end;
end;

procedure TfrmCursos.FiltrarPlanos(filtro_anosemestre: Integer);
const
   SQL_FILTRARPLANOS =
      ' SELECT CD_PLANO, DS_PLANO FROM FIN_PLANOS ' +
      ' WHERE NR_ANOSEMESTRE = :NR_ANOSEMESTRE ';
   SQL_FITRARPLANOS_COLIGADA =
      ' AND CD_COLIGADA = :CD_COLIGADA ';
   SQL_FILTRARPLANOS_ORDER =
      ' ORDER BY DS_PLANO ';
begin
   try
      qyPlanos.Close();
      qyPlanos.SQL.Text := SQL_FILTRARPLANOS;

      qyPlanos.SQL.Add(SQL_FITRARPLANOS_COLIGADA);
      qyPlanos.ParamByName('CD_COLIGADA').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

      qyPlanos.SQL.Add(SQL_FILTRARPLANOS_ORDER);

      qyPlanos.ParamByName('NR_ANOSEMESTRE').AsInteger := filtro_anosemestre;
      qyPlanos.Open();
   except
      Mensagem('Favor selecionar uma coligada','Aviso', MB_ICONEXCLAMATION+MB_OK);
   end;

end;

procedure TfrmCursos.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  n : Integer;
begin

   for n := 0 to ComponentCount - 1 do
   begin
      if Components[n] is TUMZQuery then
      begin
         if TUMZQuery(Components[n]).Active then TUMZQuery(Components[n]).Close;
      end;
   end;

   Action := caFree;
end;

procedure TfrmCursos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmCursos.sbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCursos.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(grdGrade, 'planilha_grades_disciplinas_campos');
end;

procedure TfrmCursos.carregarCursoColigada;
var
  ev: TNotifyEvent;
begin
  // Guardar o Evento para não disparar o OnClick
   ev := ckbUtilizarCurso.OnClick;
   
   ckbUtilizarCurso.OnClick := nil;

   qyCursosColigadas.Close();

   if cbColigadas.ItemIndex = -1 then
   begin
      qyCursosColigadas.ParamByName('COLIGADA').AsInteger := 0
   end
   else
   begin
      qyCursosColigadas.ParamByName('COLIGADA').AsInteger := StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
   end;

   qyCursosColigadas.ParamByName('CURSO').AsString := qyCursosMestreCD_CURSO.AsString;

   qyCursosColigadas.Open();

   if (qyCursosColigadas.RecordCount = 0) OR (qyCursosColigadasSN_ATIVO.AsInteger = 0) then
   begin
      ckbUtilizarCurso.Checked := false;
      dbnCursosColigadas.Enabled := false;
   end
   else
   begin
      // Carrega os atos oficiais
      ckbUtilizarCurso.Checked := true;
      dbnCursosColigadas.Enabled := true;
   end;

   // Restaura o evento original
   ckbUtilizarCurso.OnClick:=ev;
end;

procedure TfrmCursos.carregarCursoDepartamentos();
begin
   with qyListaDeptos do
   begin
      Close();
      SQL.Text := 'SELECT * FROM departamentos WHERE cd_coligada = :cd_coligada ORDER BY DESCRICAO';
      ParamByName('cd_coligada').AsInteger := StrToInt(TItemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
      Open();
   end;
end;

procedure TfrmCursos.carregarDepartamentos;
begin
   tblDeptos.Close();
   tblDeptos.SQL.Text := 'SELECT CODIGO, DESCRICAO FROM DEPARTAMENTOS ';

   if qyColigadacd_coligada.AsInteger > 0 then
   begin
      tblDeptos.SQL.Add( ' WHERE cd_coligada = :cd_coligada ' );
      tblDeptos.ParamByName('cd_coligada').AsInteger := qyColigadacd_coligada.AsInteger;
   end else begin
      tblDeptos.SQL.Add( ' WHERE cd_coligada IN (' + Dm.GetColigadas() + ' ) ');
   end;

   tblDeptos.SQL.Add(' ORDER BY DESCRICAO ' );

   tblDeptos.Open();

   cbDepartamento.Clear();

   cbDepartamento.Items.AddObject( 'TODOS', TItemCombo.Create('0', 'TODOS') );
   while not tblDeptos.Eof do
   begin
      cbDepartamento.Items.AddObject( tblDeptosDescricao.AsString,
         TItemCombo.Create(tblDeptosCodigo.AsString, tblDeptosDescricao.AsString) );

     tblDeptos.Next();
   end;

end;

procedure TfrmCursos.carregarDisciplinasPai;
const
   SQL_CARREGA_DISCIPLINAS_PAI =
      ' SELECT ds_disciplina, cd_disciplina_pai, sn_exporta_moodle ' +
      ' FROM disciplinas_mestre WHERE sn_ativa = 1 ORDER BY ds_disciplina ';
var
   qyBuscaDisciplinasMestre: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyBuscaDisciplinasMestre);

   qyBuscaDisciplinasMestre.SQL.Text := SQL_CARREGA_DISCIPLINAS_PAI;
   qyBuscaDisciplinasMestre.Open;

   cbDisciplinaPai.Items.AddObject( 'NOVA DISCIPLINA MESTRA', TItemCombo.Create( '0', 'NOVA DISCIPLINA MESTRA', 0 ) );
   while not qyBuscaDisciplinasMestre.Eof do
   begin
      cbDisciplinaPai.Items.AddObject(
         qyBuscaDisciplinasMestre.FieldByName('ds_disciplina').AsString,
         TItemCombo.Create( qyBuscaDisciplinasMestre.FieldByName('cd_disciplina_pai').AsString,
                  qyBuscaDisciplinasMestre.FieldByName('ds_disciplina').AsString,
                  qyBuscaDisciplinasMestre.FieldByName('sn_exporta_moodle').AsInteger )
      );
      
      qyBuscaDisciplinasMestre.Next();     
   end;   
end;

procedure TfrmCursos.carregarTurmas;
begin
   if (trim(UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Text) <> '') then
   begin
      with tblTurmas do
      begin
         Close();

         SQL.Clear();

         SQL.Add('SELECT * FROM turmas');
         SQL.Add('WHERE curso = :Codigo');

         if (qyColigadacd_coligada.AsInteger > 0) then
         begin
            SQL.Add('AND cd_coligada = :coligada');
            ParamByName('coligada').AsInteger := qyColigadacd_coligada.AsInteger;
         end else begin
            // Selecionou a opção todas as coligadas.
            // Deverá mostrar somente as coligadas que o usuário tenha permissão
            SQL.Add('AND cd_coligada in ('+ DM.GetTodasColigadas() + ')');
         end;

         if UMFiltroDataAnoSem.UsaAnoSemestre then
         begin
            SQL.Add(' AND anosemestre = :AnoSemestre');
            ParamByName('AnoSemestre').AsInteger := StrToInt(UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Text);
            FiltrarPlanos(StrToInt(UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Text));

         end else begin
            FiltrarPlanos(ANOSEMESTRE_PADRAO);
            SQL.Add(' AND sn_ativa = :sn_ativa');
            ParamByName('sn_ativa').AsInteger := UMFiltroDataAnoSem.getTurmasAtivas();

            if ( UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked ) then
            begin
               SQL.Add(' AND DATE_FORMAT(datainicio, :formato) >= :datainicio ');
               ParamByName('datainicio').AsString := UMFiltroDataAnoSem.getDataInicio();
            end;

            if ( UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked ) then
            begin
               SQL.Add(' AND DATE_FORMAT(datafim, :formato) <= :datafim ');
               ParamByName('datafim').AsString := UMFiltroDataAnoSem.getDataFim();
            end;

            if UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked OR
               UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked then
               ParamByName('formato').AsString := DATE_FORMAT_GERAL;

         end;

         SQL.Add('ORDER BY anosemestre, codigo');

         ParamByName('Codigo').AsString := qyCursosMestre.FieldByName('cd_curso').AsString;

         tblTurmas.Open;
      end;
   end;
end;

procedure TfrmCursos.cbAjusteRematriculaChange(Sender: TObject);
var
   valor_update, chaveLog, msgLog: String;
   P: Pointer;
begin
   try
      if cbAjusteRematricula.ItemIndex = 0 then
         valor_update := '1'
      else
         valor_update := '0';

      DM.db.ExecuteDirect( 'UPDATE grades_disciplinas SET SN_AJUSTE_REMATRICULA = ' + valor_update +
                           ' WHERE CD_GRADE = ' + qyGradesDisciplinasCD_GRADE.AsString +
                           ' AND CD_CURSO = ''' + qyGradesDisciplinasCD_CURSO.AsString + ''' ' +
                           ' AND CD_DISCIPLINA = ' + qyGradesDisciplinasCD_DISCIPLINA.AsString +
                           ' AND NR_SERIE = ' + qyGradesDisciplinasNR_SERIE.AsString  );

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
                'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
                'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
                'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
                'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
                'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
                'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
                'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
                'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
                'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
                'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
                'Avaliação: '+ qyGradesDisciplinas.FieldByName('CD_AVALIACAO').AsString +CHR(13)+
                'Extra: '+ valor_update +CHR(13)+
                'Optativa: '+ qyGradesDisciplinas.FieldByName('SN_OPTATIVA').AsString +CHR(13)+
                'Faz Frente: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_FRENTE').AsString +CHR(13){+
                'Ajuste rematrícula:'+ qyGradesDisciplinas.FieldByName('SN_AJUSTE_REMATRICULA').AsString};

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );
                           
   except
      on E: Exception do
      begin
         Mensagem('Não foi possível salvar a alteração da Disciplina.');
         Exit;
      end;
   end;

   try
      P := qyGradesDisciplinas.GetBookmark;
      qyGradesDisciplinas.Close();
      qyGradesDisciplinas.Open();
      qyGradesDisciplinas.GotoBookmark(P);
   except
   end;
end;

procedure TfrmCursos.cbAvaliacaoChange(Sender: TObject);
var
   valor_update, chaveLog, msgLog: String;
   P: Pointer;
begin
   try
      if cbAvaliacao.ItemIndex > 0 then
         valor_update := (cbAvaliacao.Items.Objects[cbAvaliacao.ItemIndex] AS TItemCombo).getCodigo()
      else
         valor_update := 'NULL';

      DM.db.ExecuteDirect( 'UPDATE grades_disciplinas SET CD_AVALIACAO = ' + valor_update +
                           ' WHERE CD_GRADE = ' + qyGradesDisciplinasCD_GRADE.AsString +
                           ' AND CD_CURSO = ''' + qyGradesDisciplinasCD_CURSO.AsString + ''' ' +
                           ' AND CD_DISCIPLINA = ' + qyGradesDisciplinasCD_DISCIPLINA.AsString +
                           ' AND NR_SERIE = ' + qyGradesDisciplinasNR_SERIE.AsString  );

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
                'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
                'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
                'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
                'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
                'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
                'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
                'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
                'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
                'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
                'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
                'Avaliação: '+ valor_update +CHR(13)+
                'Extra: '+ qyGradesDisciplinas.FieldByName('SN_EXTRA').AsString +CHR(13)+
                'Optativa: '+ qyGradesDisciplinas.FieldByName('SN_OPTATIVA').AsString +CHR(13)+
                'Faz Frente: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_FRENTE').AsString;

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

   except
      on E: Exception do
      begin
         Mensagem('Não foi possível salvar a alteração da Avaliação da Disciplina.');
         Exit;
      end;
   end;

   try
      P := qyGradesDisciplinas.GetBookmark;
      qyGradesDisciplinas.Close();
      qyGradesDisciplinas.Open();
      qyGradesDisciplinas.GotoBookmark(P);
   except
   end;
end;

procedure TfrmCursos.cbBloqueioVagasChange(Sender: TObject);
var
   indexBloqueio : integer;
begin
   if (tblTurmas.State in [dsinsert,dsedit]) then
   begin
      tblTurmas.Edit;
   end;

   indexBloqueio := cbBloqueioVagas.ItemIndex;

   if tblTurmasCodigo.AsString <> '' then
   begin
      tblTurmas.Edit;
   end else begin
      tblTurmas.Insert;
   end;
   
   cbBloqueioVagas.ItemIndex := indexBloqueio;
end;

procedure TfrmCursos.cbColigadasChange(Sender: TObject);
begin
   carregarCursoDepartamentos();
   carregarCursoColigada();
end;

procedure TfrmCursos.cbColigadasDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
   qyVerificaCursoColigada: TUMZQuery;
   sChave, sValor : String;
begin
   if arrCursosColigadas = nil then
      Exit;

   sChave := qyCursosMestreCD_CURSO.AsString + ';' + TItemCombo(cbColigadas.Items.Objects[Index]).getCodigo();
   with cbColigadas.Canvas do
   begin
      if arrCursosColigadas.Values[sChave] = '' then
      begin
         DM.CriarConsulta(qyVerificaCursoColigada);

         FillRect(Rect);
         // verifica se é o indice a ser desabilitado
         qyVerificaCursoColigada.Close();
         qyVerificaCursoColigada.SQL.Clear();
         qyVerificaCursoColigada.SQL.Text := ' SELECT COUNT(CD_CURSO) AS registros FROM cursos_coligadas WHERE cd_curso = :cd_curso AND cd_coligada = :cd_coligada AND sn_ativo = 1 ';
         qyVerificaCursoColigada.ParamByName('cd_curso').AsString := qyCursosMestreCD_CURSO.AsString;
         qyVerificaCursoColigada.ParamByName('cd_coligada').AsString := TItemCombo(cbColigadas.Items.Objects[Index]).getCodigo();
         qyVerificaCursoColigada.Open();

         arrCursosColigadas.Values[sChave] := qyVerificaCursoColigada.FieldByName('registros').AsString;
      end;

      if arrCursosColigadas.Values[sChave] = '0' then
      begin
//         Font.Style := Font.Style - [fsBold];
//         // Cor cinza
//         if (odSelected in State) then
//         begin
//            Font.Color := clWhite;
//         end
//         else
//            Font.Color := clGray;
         sValor := '      '+cbColigadas.Items.Strings[Index];
      end
      else
      begin
//         Font.Style := Font.Style + [fsBold];
//         if (odSelected in State) then
//         begin
//            Font.Color := clWhite;
//         end
//         else
//            Font.Color := clBlack;
         sValor := '[X] '+cbColigadas.Items.Strings[Index];
      end;

      TextOut(Rect.Left, Rect.Top, sValor);
   end;
end;

procedure TfrmCursos.cbDepartamentoChange(Sender: TObject);
begin
   FiltraCursos;
end;

procedure TfrmCursos.cbDisciplinaPaiSelect(Sender: TObject);
var
   iAtual, disciplina_selecionada: Integer;
begin
   if (tblDisc.State in [dsBrowse]) then
   begin
      iAtual := cbDisciplinaPai.ItemIndex;
      tblDisc.Edit();
      cbDisciplinaPai.ItemIndex := iAtual;
   end;

   disciplina_selecionada := cbDisciplinaPai.ItemIndex;
   tblDiscsn_exporta_moodle.AsInteger := 0;
   dbchExportaDisciplinaMoodle.Checked := False;

   if disciplina_selecionada = 0 then
   begin
      tblDiscCD_DISCIPLINA_PAI.AsString := '';
      dbCodDiscPai.Visible := True;
      Label59.Visible := True;
      dbCodDiscPai.SetFocus;
   end
   else
   begin
      dbCodDiscPai.Visible := False;
      Label59.Visible := False;

      tblDiscCD_DISCIPLINA_PAI.AsString := TItemCombo(cbDisciplinaPai.Items.Objects[disciplina_selecionada]).getCodigo();

      if ( TItemCombo(cbDisciplinaPai.Items.Objects[disciplina_selecionada]).getVariavel() = 1 ) then
      begin
         tblDiscsn_exporta_moodle.AsInteger := 1;
         dbchExportaDisciplinaMoodle.Checked := True;
      end;
   end;
end;

procedure TfrmCursos.cbFiltroEtapasChange(Sender: TObject);
begin
   if cbFiltroEtapas.ItemIndex > 0 then
   begin
      qyGradesDisciplinas.Filter := 'NR_SERIE = ' + TItemCombo(cbFiltroEtapas.Items.Objects[cbFiltroEtapas.ItemIndex]).getCodigo();
   end else begin
      qyGradesDisciplinas.Filter := '';
   end;

   RecarregarTotaisGC();
end;

procedure TfrmCursos.cbFrentesChange(Sender: TObject);
const
   SQL_UPDATE_DISCIPLINA_FRENTE =
      ' UPDATE grades_disciplinas SET cd_disciplina_frente = :cd_disciplina_frente ' +
      ' WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso AND ' +
      '       cd_disciplina = :cd_disciplina AND nr_serie = :nr_serie ';

   SQL_VERIFICA_DISCIPLINA_EH_FRENTE =
      ' SELECT cd_disciplina FROM grades_disciplinas ' +
      ' WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso AND ' +
      '       cd_disciplina_frente = :cd_disciplina AND nr_serie = :nr_serie ';

   SQL_VERIFICA_DISCIPLINA_FAZ_FRENTE =
      ' SELECT cd_disciplina FROM grades_disciplinas ' +
      ' WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso AND ' +
      '       cd_disciplina = :cd_disciplina AND nr_serie = :nr_serie AND cd_disciplina_frente IS NOT NULL ';
var
   P: Pointer;
   qyUpdateDisciplinaFrente, qyVerificaDisciplinaEhFrente, qyVerificaDisciplinaFazFrente: TUMZQuery;
   chaveLog, msgLog: string;
begin
   DM.CriarConsulta(qyUpdateDisciplinaFrente);
   DM.CriarConsulta(qyVerificaDisciplinaEhFrente);
   DM.CriarConsulta(qyVerificaDisciplinaFazFrente);
   qyUpdateDisciplinaFrente.SQL.Text := SQL_UPDATE_DISCIPLINA_FRENTE;
   qyVerificaDisciplinaEhFrente.SQL.Text := SQL_VERIFICA_DISCIPLINA_EH_FRENTE;
   qyVerificaDisciplinaFazFrente.SQL.Text := SQL_VERIFICA_DISCIPLINA_FAZ_FRENTE;

   try
      if cbFrentes.ItemIndex > 0 then
      begin
         // Verifica se a disciplina selecionada que faz frente é a ela própria
         if StrToInt((cbFrentes.Items.Objects[cbFrentes.ItemIndex] AS TItemCombo).getCodigo()) = qyGradesDisciplinasCD_DISCIPLINA.AsInteger then
         begin
            Mensagem('Não é possível selecionar a própria disciplina.');
            Exit;
         end;

         // Não se pode definir frente para uma disciplina que já é uma frente
         qyVerificaDisciplinaEhFrente.ParamByName('cd_grade').AsInteger := qyGradesDisciplinasCD_GRADE.AsInteger;
         qyVerificaDisciplinaEhFrente.ParamByName('cd_curso').AsString := qyGradesDisciplinasCD_CURSO.AsString;
         qyVerificaDisciplinaEhFrente.ParamByName('nr_serie').AsInteger := qyGradesDisciplinasNR_SERIE.AsInteger;
         qyVerificaDisciplinaEhFrente.ParamByName('cd_disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;

         qyVerificaDisciplinaEhFrente.Open;
         if qyVerificaDisciplinaEhFrente.RecordCount > 0 then
         begin
            Mensagem('Não é possível definir uma disciplina frente para essa disciplina, porque ela é uma disciplina frente.');
            Exit;
         end;

         // Não pode selecionar uma disciplina que já faz frente para outra disciplina
         qyVerificaDisciplinaFazFrente.ParamByName('cd_grade').AsInteger := qyGradesDisciplinasCD_GRADE.AsInteger;
         qyVerificaDisciplinaFazFrente.ParamByName('cd_curso').AsString := qyGradesDisciplinasCD_CURSO.AsString;
         qyVerificaDisciplinaFazFrente.ParamByName('nr_serie').AsInteger := qyGradesDisciplinasNR_SERIE.AsInteger;
         qyVerificaDisciplinaFazFrente.ParamByName('cd_disciplina').AsInteger := StrToInt((cbFrentes.Items.Objects[cbFrentes.ItemIndex] AS TItemCombo).getCodigo());

         qyVerificaDisciplinaFazFrente.Open;
         if qyVerificaDisciplinaFazFrente.RecordCount > 0 then
         begin
            Mensagem('Não é possível selecionar uma disciplina que já faz frente para outra disciplina.');
            Exit;
         end;

         qyUpdateDisciplinaFrente.ParamByName('cd_disciplina_frente').AsInteger :=
            StrToInt((cbFrentes.Items.Objects[cbFrentes.ItemIndex] AS TItemCombo).getCodigo())
      end else begin

         qyUpdateDisciplinaFrente.ParamByName('cd_disciplina_frente').Clear;
      end;

      // Se o usuário estiver alterando o vinculo de frente da disciplina, emite um alerta
      if not qyGradesDisciplinasCD_DISCIPLINA_FRENTE.IsNull then
      begin
         Mensagem('Aviso: Você está alterando o vínculo de "frente" dessa disciplina, podem existir provas criadas para essa disciplina e sua frente.');
      end;

      qyUpdateDisciplinaFrente.ParamByName('cd_grade').AsInteger := qyGradesDisciplinasCD_GRADE.AsInteger;
      qyUpdateDisciplinaFrente.ParamByName('cd_curso').AsString := qyGradesDisciplinasCD_CURSO.AsString;
      qyUpdateDisciplinaFrente.ParamByName('cd_disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
      qyUpdateDisciplinaFrente.ParamByName('nr_serie').AsInteger := qyGradesDisciplinasNR_SERIE.AsInteger;

      qyUpdateDisciplinaFrente.ExecSQL;

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
                'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
                'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
                'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
                'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
                'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
                'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
                'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
                'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
                'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
                'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
                'Avaliação: '+ qyGradesDisciplinas.FieldByName('CD_AVALIACAO').AsString +CHR(13)+
                'Extra: '+ qyGradesDisciplinas.FieldByName('SN_EXTRA').AsString +CHR(13)+
                'Optativa: '+ qyGradesDisciplinas.FieldByName('SN_OPTATIVA').AsString +CHR(13)+
                'Faz Frente: '+ (cbFrentes.Items.Objects[cbFrentes.ItemIndex] AS TItemCombo).getCodigo();

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

   except
      on E: Exception do
      begin
         FreeAndNil(qyUpdateDisciplinaFrente);
         Mensagem('Não foi possível salvar a alteração da Disciplina que Faz Frente.');
         Exit;
      end;
   end;
   FreeAndNil(qyUpdateDisciplinaFrente);
   FreeAndNil(qyVerificaDisciplinaEhFrente);
   FreeAndNil(qyVerificaDisciplinaFazFrente);

   try
      P := qyGradesDisciplinas.GetBookmark;
      qyGradesDisciplinas.Close();
      qyGradesDisciplinas.Open();
      qyGradesDisciplinas.GotoBookmark(P);
   except
   end;
end;

procedure TfrmCursos.cbNrEtapasChange(Sender: TObject);
var
   item: String;
   INrEtapa, i: Integer;
begin
   if not (cbNrEtapas.ItemIndex > -1) then
      Exit;

   item := cbNrEtapas.Items[cbNrEtapas.ItemIndex];

   if item = 'Optativa' then
   begin
      INrEtapa := -100;
   end else begin
      INrEtapa := StrToInt(item);
   end;

   // Verifica se possui disciplinas optativas configuradas
   qDisciplinasOptativas.Close;
   qDisciplinasOptativas.SQL.Clear;
   qDisciplinasOptativas.SQL.Text :=
     ' SELECT ' +
     '    COUNT(*) total ' +
     ' FROM ' +
     '    turmas_disciplinas_optativas ' +
     ' WHERE ' +
     '    cd_turma LIKE :cd_turma AND ' +
     '    nr_anosemestre = :nr_anosemestre AND ' +
     '    cd_curso = :cd_curso ';

   qDisciplinasOptativas.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('CODIGO').AsString;
   qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('ANOSEMESTRE').AsInteger;
   qDisciplinasOptativas.ParamByName('cd_curso').AsString := tblTurmas.FieldByName('CURSO').AsString;

   qDisciplinasOptativas.Open;

   // Se usuário mudou a série e possui disciplinas optativas configuradas, não permite a alteração
   if ( qDisciplinasOptativas.FieldByName('total').AsInteger > 0 ) then
   begin
      // Permanece a etapa anterior na combo
      for i := 0 to cbNrEtapas.Items.Count - 1 do
      begin
         if cbNrEtapas.Items[i] = tblTurmasSerie.AsString then
         begin
            cbNrEtapas.ItemIndex := i;
            break;
         end;
      end;
      // Apresenta mensagem de erro
      Mensagem('Não foi possível alterar a etapa da turma pois existem disciplinas optativas configuradas para esta turma na etapa atual.',  'Informação',  MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   // Verifica se o usuário está selecionando a série OPTATIVA
   if INrEtapa = -100 then
   begin
      // Verifica se já foi inserida uma turma de série = OPTATIVA nesse anosemestre, curso, gradecurricular e  turno
      qDisciplinasOptativas.Close;
      qDisciplinasOptativas.SQL.Clear;
      qDisciplinasOptativas.SQL.Text :=
        ' SELECT ' +
        '    COUNT(*) total ' +
        ' FROM ' +
        '    turmas ' +
        ' WHERE ' +
        '    anosemestre = :anosemestre AND ' +
        '    curso = :curso AND ' +
        '    cd_grade = :cd_grade AND ' +
        '    turno = :turno AND ' +
        '    serie = -100 ';

      qDisciplinasOptativas.ParamByName('anosemestre').AsInteger := tblTurmas.FieldByName('ANOSEMESTRE').AsInteger;
      qDisciplinasOptativas.ParamByName('curso').AsString := tblTurmas.FieldByName('CURSO').AsString;
      qDisciplinasOptativas.ParamByName('cd_grade').AsInteger := tblTurmas.FieldByName('CD_GRADE').AsInteger;
      qDisciplinasOptativas.ParamByName('turno').AsString := tblTurmas.FieldByName('TURNO').AsString;

      qDisciplinasOptativas.Open;

      if ( qDisciplinasOptativas.FieldByName('total').AsInteger > 0 ) then
      begin
         // Permanece a etapa anterior na combo
         cbNrEtapas.ItemIndex := -1;
         for i := 0 to cbNrEtapas.Items.Count - 1 do
         begin
            if cbNrEtapas.Items[i] = tblTurmasSerie.AsString then
            begin
               cbNrEtapas.ItemIndex := i;
               break;
            end;
         end;
         // Apresenta mensagem de erro
         Mensagem('Não é possível selecionar a etapa "Optativa", pois já existe uma turma com essa etapa nesse ano/semestre, grade, curso e turno.',  'Informação',  MB_OK + MB_ICONINFORMATION, Handle);
         Exit;
      end;
   end;

   if not (tblTurmas.State in [dsInsert, dsEdit]) then
      tblTurmas.Edit();

   tblTurmasSerie.AsInteger := INrEtapa;
end;

procedure TfrmCursos.selecionaTipoProxTurma(isProxTurmaOutroCurso: Boolean);
begin
   LabelProxTurmaMesmoCurso.Visible := not isProxTurmaOutroCurso;
   LabelProxTurmaReprMesmoCurso.Visible := not isProxTurmaOutroCurso;
   dbcbProximaTurma.Visible := not isProxTurmaOutroCurso;
   dbcbProximaTurmaRepr.Visible := not isProxTurmaOutroCurso;

   Label55.Visible := isProxTurmaOutroCurso;
   dbeProxCurso.Visible := isProxTurmaOutroCurso;
   dbeProxTurmaOutroCurso.Visible := isProxTurmaOutroCurso;
   sbBuscaProxTurmaOutroCurso.Visible := isProxTurmaOutroCurso;
   sbLimpaProxTurmaOutroCurso.Visible := isProxTurmaOutroCurso;
end;

procedure TfrmCursos.cbSnOptativaChange(Sender: TObject);
var
   valor_update, chaveLog, msgLog: String;
   P: Pointer;
begin
   try
      if cbSnOptativa.ItemIndex = 0 then
         valor_update := '1'
      else
         valor_update := '0';

      DM.db.ExecuteDirect( ' UPDATE grades_disciplinas SET SN_OPTATIVA = ' + valor_update +
                           ' WHERE CD_GRADE = ' + qyGradesDisciplinasCD_GRADE.AsString +
                           ' AND CD_CURSO = ''' + qyGradesDisciplinasCD_CURSO.AsString + ''' ' +
                           ' AND CD_DISCIPLINA = ' + qyGradesDisciplinasCD_DISCIPLINA.AsString +
                           ' AND NR_SERIE = ' + qyGradesDisciplinasNR_SERIE.AsString  );

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
                'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
                'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
                'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
                'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
                'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
                'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
                'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
                'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
                'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
                'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
                'Avaliação: '+ qyGradesDisciplinas.FieldByName('CD_AVALIACAO').AsString +CHR(13)+
                'Extra: '+ qyGradesDisciplinas.FieldByName('SN_EXTRA').AsString +CHR(13)+
                'Optativa: '+ valor_update +CHR(13)+
                'Faz Frente: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_FRENTE').AsString;

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

   except
      on E: Exception do
      begin
         Mensagem('Não foi possível salvar a alteração da Disciplina.');
         Exit;
      end;
   end;

   try
      P := qyGradesDisciplinas.GetBookmark;
      qyGradesDisciplinas.Close();
      qyGradesDisciplinas.Open();
      qyGradesDisciplinas.GotoBookmark(P);
   except
   end;
end;


procedure TfrmCursos.cbSituacoesChange(Sender: TObject);
begin
   if not (qyCursosMestre.State in [dsInsert, dsEdit]) then
   begin
      qyCursosMestre.Edit();
   end;
end;

procedure TfrmCursos.cbSnExtraChange(Sender: TObject);
var
   valor_update, chaveLog, msgLog: String;
   P: Pointer;
begin
   try
      if cbSnExtra.ItemIndex = 0 then
         valor_update := '1'
      else
         valor_update := '0';

      DM.db.ExecuteDirect( 'UPDATE grades_disciplinas SET SN_EXTRA = ' + valor_update +
                           ' WHERE CD_GRADE = ' + qyGradesDisciplinasCD_GRADE.AsString +
                           ' AND CD_CURSO = ''' + qyGradesDisciplinasCD_CURSO.AsString + ''' ' +
                           ' AND CD_DISCIPLINA = ' + qyGradesDisciplinasCD_DISCIPLINA.AsString +
                           ' AND NR_SERIE = ' + qyGradesDisciplinasNR_SERIE.AsString  );

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
                'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
                'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
                'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
                'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
                'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
                'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
                'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
                'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
                'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
                'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
                'Avaliação: '+ qyGradesDisciplinas.FieldByName('CD_AVALIACAO').AsString +CHR(13)+
                'Extra: '+ valor_update +CHR(13)+
                'Optativa: '+ qyGradesDisciplinas.FieldByName('SN_OPTATIVA').AsString +CHR(13)+
                'Faz Frente: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_FRENTE').AsString;

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );
                           
   except
      on E: Exception do
      begin
         Mensagem('Não foi possível salvar a alteração da Disciplina.');
         Exit;
      end;
   end;

   try
      P := qyGradesDisciplinas.GetBookmark;
      qyGradesDisciplinas.Close();
      qyGradesDisciplinas.Open();
      qyGradesDisciplinas.GotoBookmark(P);
   except
   end;
end;

procedure TfrmCursos.OnSelectCurso;
const
   KeyFmt = '%s;%s';
   SQLCount = 'SELECT COUNT(CD_CURSO), CD_COLIGADA FROM CURSOS_COLIGADAS WHERE CD_CURSO = ? AND SN_ATIVO = 1 GROUP BY CD_COLIGADA';
   SQLAtos = 'SELECT * FROM CURSOS_ATOS_OFICIAIS WHERE CD_CURSO = :CD_CURSO AND (CD_COLIGADA = :CD_COLIGADA OR CD_COLIGADA IS NULL) ORDER BY NR_ANOSEMESTRE DESC';
   SQLAtosTodasColigadas = 'SELECT * FROM CURSOS_ATOS_OFICIAIS WHERE CD_CURSO = :CD_CURSO ORDER BY NR_ANOSEMESTRE DESC';
var
   I: Integer;
   ColigadaId, CursoId, SituacaoId, Grau: AnsiString;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   if arrCursosColigadas = nil then
      arrCursosColigadas := TStringList.Create;

   arrCursosColigadas.Clear;
   cbColigadas.Repaint;
   TrocouCurso := True;
   carregarCursoColigada;

   CursoId := qyCursosMestre.FieldByName('CD_CURSO').AsString;

   if qyCursosMestre.State = dsBrowse then
   begin

      Grau := qyCursosMestreNR_GRAU.AsString;

      for I := 0 to cbSituacoes.Items.Count - 1 do
      begin
         SituacaoId := TItemCombo(cbSituacoes.Items.Objects[I]).getCodigo;

         if SituacaoId = Grau then
         begin
            cbSituacoes.ItemIndex := I;
            Break;
         end;
      end;
   end;

   qyAtosOficiais.Close;

   if qyColigadacd_coligada.AsInteger = 0 then
   begin
      qyAtosOficiais.SQL.Text := SQLAtosTodasColigadas;
   end;

   if qyColigadacd_coligada.AsInteger > 0 then
   begin
      qyAtosOficiais.SQL.Text := SQLAtos;
      qyAtosOficiais.ParamByName('CD_COLIGADA').AsInteger := qyColigadacd_coligada.AsInteger;
   end;

   qyAtosOficiais.ParamByName('CD_CURSO').AsString := CursoId;
   qyAtosOficiais.Open;

   if qyColigadacd_coligada.AsInteger <> 0 then
   begin
      ColigadaId := TItemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo;

      if ColigadaId <> qyColigadacd_coligada.AsString then
      begin

         for I := 0 to cbColigadas.Items.Count - 1 do
         begin
            ColigadaId := TItemCombo(cbColigadas.Items.Objects[I]).getCodigo;

            if ColigadaId = qyColigadacd_coligada.AsString then
            begin
               cbColigadas.ItemIndex := I;
               Break;
            end;
         end;
      end;
   end;

   Stmt := PrepareStatement(SQLCount);
   try
      Stmt.SetString(1, CursoId);

      Rs := Stmt.ExecuteQueryPrepared;
      try
         while Rs.Next do
         begin
            ColigadaId := Rs.GetString(2);
            arrCursosColigadas.Values[ColigadaId] := Rs.GetString(1);
         end;
      finally
         Rs.Close;
      end;
            
   finally
      Stmt.Close;
   end;

   try
      cbColigadasChange(cbColigadas);
   except
      //
   end;
end;

procedure TfrmCursos.ChangeClassCode;
const
   SMsgAtencao = 'Atenção';
   SMsgConfirma = 'Confirmação';
   SMsgInfoCaption = 'Informação';
   SMsgConfirmaTodosAnoSem = 'Deseja alterar o código da turma para todos os anos/semestres?';
   SMsgConformaTodasMudancas = 'Tem certeza que deseja realizar a alteração do código da turma?'#13#13'De: %s'#13'Para: %s'#13#13'em todos os anos/semestres?';
   SMsgConfirmaMudanca = 'Tem certeza que deseja realizar a alteração do código da turma?'#13#13'De: %s'#13'Para: %s'#13#13'apenas no ano/semestre %d?';
   SMsgTurmaDuplicada = 'Já existe uma turma com esse código. Não será possível realizar a alteração';
   SMsgSucesso = 'Código da turma alterado com sucesso.';
   SMsgErro = 'Alteração do código da turma não concluído.'#13' A seguir, será apresentada uma tela de erro ao qual deverá ser encaminhada ao Atendimento.';
   SMsgErroOutro = 'Alteração do código da turma não concluído.'#13#13'Foram encontradas inconformidades nas seguintes tabelas:'#13'%s';
   MsgFlagsQuestion = MB_YESNO or MB_ICONQUESTION;
   MsgFlagsWarning = MB_YESNO or MB_ICONWARNING;
   MsgFlagsAttention = MB_OK or MB_ICONWARNING;
   MsgFlagsInfo = MB_OK or MB_ICONINFORMATION;

   SSQLDesabilitaFk = 'SET FOREIGN_KEY_CHECKS=0;';
   SSQLHabilitaFk = 'SET FOREIGN_KEY_CHECKS=1;';
   SSQLGetTables = 'SHOW TABLE STATUS FROM %s';
   SSQLGetColumns = 'SHOW FIELDS FROM %s';
   SSQLBuscaTurma = 'SELECT CODIGO FROM TURMAS WHERE CODIGO LIKE ?';
   SSQLBuscaTurmaAnoSem = SSQLBuscaTurma + ' AND ANOSEMESTRE = ?';
   SSQLUpdateTurma = 'UPDATE %s SET %s = trim(%s) WHERE trim(%s) = trim(%s)';
   SSQLUpdateTurmaAnoSem = 'UPDATE %s SET %s = trim(%s) WHERE trim(%s) = trim(%s) AND %s = %d';

   SLogMudancaAnoSem = 'Mudança de código de turma. De: [%s] Para: [%s] em todos os anos/semestres';
   SLogMudanca = 'Mudança de código de turma. De: [%s] Para: [%s] apenas para o ano/semestre [%d]';
   SLogErro = '[ERRO] Mudança de código de turma. Erro ao alterar o código De: [%s] Para: [%s]. ' + #13 +
                          '   Erro gerado: %s' + #13 + '   SQL Executado:' + #13 + '%s';
var
   FieldsCode, OtherFields, IgnoreTables, TabelasSQLsEspecificos: TStringList;

   procedure InitializeFieldList;
   begin
      FieldsCode := TStringList.Create;
      FieldsCode.Delimiter := #59;
      FieldsCode.DelimitedText :=
         'CODIGO;CD_PROXIMA_TURMA;CD_TURMA;FILTRO_TURMA;GRUPO_TURMA;TURMA;' +
         'TURMADEPENDENCIA;TURMAMAT;TURMAMATRICULA;TURMA_BASE;DS_CENTRO;CD_PROXIMA_TURMA_REPR;';

      OtherFields := TStringList.Create;
      OtherFields.Delimiter := #59;
      OtherFields.DelimitedText :=
         'ANOSEMESTRE;EQ_ANOSEMESTRE;FILTRO_ANOSEMESTRE;NR_ANOSEM;' +
         'NR_ANOSEMESTRE;NR_ANOSEM_GRADE;NR_ANO_SEM;';

      IgnoreTables := TStringList.Create;
      IgnoreTables.Delimiter := #59;
      IgnoreTables.DelimitedText :=
         'ATUALIZACOES_ANTIGA;BANCOS;CODIGORETORNOSPC;CURSOS_MUDADO;' +
         'DEPARTAMENTOS;DIARIO_LOGS;DIARIO_TERMINAL_ACESSOS;DISCIPLINAS;' +
         'DISCIPLINAS_EMENTAS;DOCUMENTOS;DOCUMENTOS_CURSOS;' +
         'EXPO_CONSULTA_CAMPOS;GRADECURRICULAR_MUDADO;GRADUACOESPROFESSORES;' +
         'HORARIOS;MATRICULAS_NOTIFICA;MENSAGENS;MENSAGENS_GERAIS;MODULOS;NU_LOG;' +
         'NU_PESSOAS_AREAS;PLANOSDESCONTO;PROVAINSTITUCIONAL_GABARITOS;' +
         'PROVAINSTITUCIONAL_REDACAO;RETORNO;RETORNO_MUDADO;SITUACOES;' +
         'TAM_INSCRICAO_GE_ALUNOS;TIPOSMOVIMENTO;TMP_ORD_AULAS;' +
         'TMP_POL_ORDEM_GABARITOS;USUARIOS_MUDADO;PROD_ANEXO;';
   end;

   procedure InicializaTabelasSQLsEspecificos;
   begin
      TabelasSQLsEspecificos := TStringList.Create;
      TabelasSQLsEspecificos.Delimiter := #59;

      TabelasSQLsEspecificos.Values['fin_planos_turmas'] :=
         ' UPDATE                         '+
	      ' %s fpt                         '+
	      ' INNER JOIN fin_planos fp ON (  '+
	      '  fpt.cd_plano = fp.cd_plano    '+
	      ' )                              '+
         ' SET                            '+
         ' 	%s = trim(%s)                 '+
         ' WHERE                          '+
         '	trim(%s) = trim(%s)           '+
         '	AND NR_ANOSEMESTRE = %d;      ';
   end;

   procedure FinalizeFieldList;
   begin
      FieldsCode.Free;
      OtherFields.Free;
      IgnoreTables.Free;
   end;

var
   CurrCode, NewCode, KeyField, KeyFieldSemester, SQLUpdate, MsgLog, MsgConfirm,
   STabelasErro, sConcat: string;
   Change, confirmaAnoSem: Boolean;
   Statement: IZPreparedStatement;
   ResultSet, RsFields: IZResultSet;
   I, Period: Integer;
   ListaTabelasErro: TStringList;
   NewCentro,CurrCentro: String;
   parametros: TParamsIni;
   numTabelas,contador: Integer;
   Errors: TStrings;
begin
   Period := tblTurmasAnoSemestre.AsInteger;
   CurrCode := tblTurmasCodigo.AsString;
   NewCode := tblTurmasCodigo.AsString;
   contador := 1;
   Errors := TStringList.Create;

   // Solicita ao usuário entrar com o novo código para a turma
   Change := InputQueryEvento(
      'UNIMESTRE',
      'Digite o novo código da turma:',
      NewCode,
      realizaExpressaoRegular
   );

   // Exclusivo para alterar os nomes dos centros de custos
   NewCentro := NewCode+' - '+IntToStr(Period);
   CurrCentro := CurrCode+' - '+IntToStr(Period);

   // Verifica se o usuário confirmou a entrada do novo código de turma e se
   // o código informado é diferente do atual código da turma
   if not (Change and (not SameText(CurrCode, NewCode))) then
   begin
      tblTurmas.Cancel;
      exit;
   end;

   ListaTabelasErro := TStringList.Create;

   // Se utiliza ano/semestre pergunta ao usuário se deseja que a alteração seja replicada para todos os ano/semestres
   confirmaAnoSem := True;
   if DM.UsaAnosemestre then
   begin
      confirmaAnoSem := MessageBox(Handle, PChar(SMsgConfirmaTodosAnoSem), PChar(SMsgConfirma), MsgFlagsQuestion) = ID_YES;
   end;

   // Solicita a confirmação do usuário exibindo os dados que serão trocados
   if confirmaAnoSem then
   begin
      MsgConfirm := Format(SMsgConformaTodasMudancas, [CurrCode, NewCode])
   end else begin
      MsgConfirm := Format(SMsgConfirmaMudanca, [CurrCode, NewCode, Period]);
   end;

   //Usuário não quis continuar
   if MessageBox(Handle, PChar(MsgConfirm), PChar(SMsgConfirma), MsgFlagsWarning) = ID_NO then
   begin
      exit;
   end;

   DM.db.ShowSQLHourGlass;
   Application.ProcessMessages;

   // Verifica se o código de turma informado está disponível
   if confirmaAnoSem then
   begin
      Statement := PrepareStatement(SSQLBuscaTurma)
   end else begin
      Statement := PrepareStatement(SSQLBuscaTurmaAnoSem);
      Statement.SetInt(2, UMFiltroDataAnoSem.getAnosemestre);
   end;
      
   Statement.SetString(1, NewCode);
   ResultSet := Statement.ExecuteQueryPrepared;
   //Se já existe o código não pode proseguir, avisa o usuário e sai
   if ResultSet.Next then
   begin
      MessageBox(Handle, PChar(SMsgTurmaDuplicada), PChar(SMsgAtencao), MsgFlagsAttention);
      
      //Executa essa ações aqui para melhor entendimento do código (sem gerar outro else)
      DM.db.HideSQLHourGlass;
      tblTurmas.Post;
      Application.ProcessMessages;
      
      exit;
   end;

   if self.verificaTabelasMysam(numTabelas) then
   begin
      DM.db.HideSQLHourGlass;
      tblTurmas.Post;
      Application.ProcessMessages;
      exit;
   end;

   { Abre uma transaction para efetuar as alterações}
   DM.db.StartTransaction;

   // Desabilita a verificação de chaves estrangeiras
   Execute(SSQLDesabilitaFk);

   //Mensagem
   TfSplash.GetInstancia().ShowSplashScreen('Estruturas', 'Buscando estruturas a serem atualizadas.');

   // Recupera todas as tabelas do banco de dados
   ResultSet := ExecuteQuery(Format(SSQLGetTables, [DM.db.Database]));

   TfSplash.GetInstancia().ShowSplashScreen('Ajustando', 'Ajustando '+IntToStr(numTabelas)+' tabelas.');

   InitializeFieldList;
   InicializaTabelasSQLsEspecificos;

   // Percorre as tabelas para verificar quais fazem referência ao código de turma
   while ResultSet.Next do
   begin

      TfSplash.GetInstancia().SetSplashText(
         'Processando '
         + IntToStr(contador)
         + ' de '
         + IntToStr(numTabelas)
         +'.'
      );
      
      inc(contador);
      
      // Ignora views
      if not ResultSet.IsNullByName('Engine') then
      begin

         // Verifica se esta tabela deve ser ignorada na alteração
         IgnoreTables.Sort;
         if IgnoreTables.Find(ResultSet.GetStringByName('Name'), I) then
         begin
            continue;
         end;

         // Recupera todas as colunas da tabela
         RsFields := ExecuteQuery(Format(SSQLGetColumns,[ResultSet.GetStringByName('Name')]));

         // Se a alteração é para ano/semestre específico verifica se a tabela possui 
         // campo que armazena tal informação para aplicar o filtro na atualização do valor
         if not confirmaAnoSem then
         begin
            KeyFieldSemester := '';
            while RsFields.Next do
            begin
               OtherFields.Sort;
               if OtherFields.Find(UpperCase(RsFields.GetStringByName('Field')), I) then
               begin
                  KeyFieldSemester := RsFields.GetStringByName('Field');
               end;
            end;
            RsFields.First;
         end;

         while RsFields.Next do
         begin
            if confirmaAnoSem or (KeyFieldSemester <> '') or (TabelasSQLsEspecificos.Values[ResultSet.GetStringByName('Name')] <> '') then
            begin
               // Verifica se é um campo que armazena o código da turma
               FieldsCode.Sort;
               KeyField := RsFields.GetStringByName('Field');

               if FieldsCode.Find(UpperCase(KeyField), I) then
               begin

                  //Inicia com o de ano/sem
                  SQLUpdate := Format(SSQLUpdateTurma, [
                        ResultSet.GetStringByName('Name'),
                        KeyField,
                        QuotedStr(NewCode),
                        KeyField,
                        QuotedStr(CurrCode)
                  ]);

                  // Aplica a atualização
                  if not confirmaAnoSem then
                  begin
                     //Inicia com o padrão sem ano/sem
                     SQLUpdate := Format(SSQLUpdateTurmaAnoSem, [
                           ResultSet.GetStringByName('Name'),
                           KeyField,
                           QuotedStr(NewCode),
                           KeyField,
                           QuotedStr(CurrCode),
                           KeyFieldSemester, Period
                     ]);

                     // existe um sql especifico para essa tabela
                     if TabelasSQLsEspecificos.Values[ResultSet.GetStringByName('Name')] <> '' then
                     begin
                        SQLUpdate := Format(TabelasSQLsEspecificos.Values[ResultSet.GetStringByName('Name')], [
                           ResultSet.GetStringByName('Name'),
                           KeyField,
                           QuotedStr(NewCode),
                           KeyField,
                           QuotedStr(CurrCode),
                           Period
                        ]);
                     end;
                  end;

                  // Verifica se o nome do campo é diferente de código e
                  // força a atualização depois quebra a repetição
                  if not SameText(KeyField, 'CODIGO') then
                  begin
                     try
                        Execute(SQLUpdate);

                        // Código específico para a tabela de fichaindividual,
                        // pois na fichaindividual temos dois campos de turmas
                        // para serem copiados.
                        if (ResultSet.GetStringByName('Name') = 'fichaindividual') then
                        begin
                           if (ResultSet.GetStringByName('Name') = 'fichaindividual') and confirmaAnoSem then
                           begin
                              SQLUpdate := Format(SSQLUpdateTurma, [
                                 ResultSet.GetStringByName('Name'),
                                 'turmamatricula',
                                 QuotedStr(NewCode),
                                 'turmamatricula',
                                 QuotedStr(CurrCode)
                              ]);
                           end
                           else if (ResultSet.GetStringByName('Name') = 'fichaindividual') and not confirmaAnoSem then
                           begin
                              SQLUpdate := Format(SSQLUpdateTurmaAnoSem, [
                                 ResultSet.GetStringByName('Name'),
                                 'turmamatricula',
                                 QuotedStr(NewCode),
                                 'turmamatricula',
                                 QuotedStr(CurrCode),
                                 KeyFieldSemester, Period
                              ]);
                           end;

                           Execute(SQLUpdate);
                        end;

                        // Código específico para a tabela de turmas_horarios_config,
                        // pois na turmas_horarios_config temos dois campos de turmas
                        // para serem alterados
                        if (ResultSet.GetStringByName('Name') = 'turmas_horarios_config') then
                        begin
                           // Verifica se deve alterar para todos os ano/semestre
                           if (ResultSet.GetStringByName('Name') = 'turmas_horarios_config') and confirmaAnoSem then
                           begin
                              SQLUpdate := Format(SSQLUpdateTurma, [
                                 ResultSet.GetStringByName('Name'),
                                 'cd_turma_base',
                                 QuotedStr(NewCode),
                                 'cd_turma_base',
                                 QuotedStr(CurrCode)
                              ]);
                           end
                           // Verifica se deve alterar apenas para um ano/semestre específico
                           else if (ResultSet.GetStringByName('Name') = 'turmas_horarios_config') and not confirmaAnoSem then
                           begin
                              SQLUpdate := Format(SSQLUpdateTurmaAnoSem, [
                                 ResultSet.GetStringByName('Name'),
                                 'cd_turma_base',
                                 QuotedStr(NewCode),
                                 'cd_turma_base',
                                 QuotedStr(CurrCode),
                                 KeyFieldSemester, Period
                              ]);
                           end;

                           Execute(SQLUpdate);
                        end;

                        // Código específico para a tabela de fin_config_centro_custos,
                        // pois na fin_config_centro_custos temos dois campos de turmas
                        // para serem alterados
                        if (ResultSet.GetStringByName('Name') = 'fin_config_centro_custos') then
                        begin
                           //
                           SQLUpdate := Format(SSQLUpdateTurma, [
                              ResultSet.GetStringByName('Name'),
                              'ds_centro',
                              QuotedStr(NewCentro),
                              'ds_centro',
                              QuotedStr(CurrCentro)
                           ]);


                           Execute(SQLUpdate);
                        end;

                     except
                        on E: Exception do
                        begin
                           Errors.Add(Format(SLogErro, [CurrCode, NewCode, E.Message, SQLUpdate]));
                           ListaTabelasErro.Add('Tabela: ' + ResultSet.GetStringByName('Name') + '; Código Log: ' + IntToStr(DM.LastInsert));
                        end;
                     end;

                     Break;
                  end;
               end;
            end;

            // Se o último campo encontrado denomina-se código,
            // siginifica que o único campo compatível e faz
            // a atualização deste
            if SameText(KeyField, 'CODIGO') then
            begin
               try
                  Execute(SQLUpdate);
               except
               on E: Exception do
                  begin
                     Errors.Add(Format(SLogErro, [CurrCode, NewCode, E.Message, SQLUpdate]));
                     ListaTabelasErro.Add('Tabela: ' + ResultSet.GetStringByName('Name') + '; Código Log: ' + IntToStr(DM.LastInsert));
                  end;
               end;
            end;
            
         end;
      end;
   end;
   if confirmaAnoSem then
      MsgLog := Format(SLogMudancaAnoSem, [CurrCode, NewCode])
   else
      MsgLog := Format(SLogMudanca, [CurrCode, NewCode, Period]);

   // Grava logs de alteração
   DM.setLog(1006, 'Alteracao', NewCode, tblTurmascd_coligada.AsInteger,
      MsgLog);

   FinalizeFieldList;

   tblTurmasCodigo.AsString := trim(NewCode);
   Execute(SSQLHabilitaFk);

   TfSplash.GetInstancia().CloseSplashScreen();

   if ListaTabelasErro.Count > 0 then
   begin
      STabelasErro := '';
      sConcat := '';
      for I := 0 to ListaTabelasErro.Count -1 do
      begin
         if(STabelasErro = '') then
         begin
            STabelasErro := 'Não foi possivel atualizar o código da turma na(s) seguinte(s) estrutura(s):';
         end;

         STabelasErro := STabelasErro + sConcat + #13 + '  - '  + ListaTabelasErro[I];
         sConcat := ', ';
      end;

      // Volta as alterações realizadas (pois ocorreu erros)
      Dm.db.Rollback;                                      

      // Mostra os erros ocorridos
      parametros.titulo := 'Atenção';
      parametros.opcoes := (BT_OK + ICO_ERROR);
      parametros.mensagens.msgPrincipal := STabelasErro;
      parametros.mensagens.msgTopo := 'Não foi possível realizar essa operação pelos seguintes motivos:'+#13;
      parametros.mensagens.msgRodape := '';
      parametros.dimensao.altura := 350;
      parametros.dimensao.largura := 600;

      // Grava os erros na tabela de logs

      for I := 0 to Errors.Count - 1 do
      begin
         DM.setLog(1006, 'Alteracao', CurrCode, tblTurmascd_coligada.AsInteger, Errors[I]);
      end;

      Errors.Free;

      TfrmMensagem.create(Self, parametros).ShowModal;
   end else begin
      Dm.db.Commit;

      MessageBox(Handle, PChar(SMsgSucesso), PChar(SMsgInfoCaption), MsgFlagsInfo);
   end;

   DM.db.HideSQLHourGlass;

   tblTurmas.Post;

   Application.ProcessMessages;
end;

procedure TfrmCursos.ckbUtilizarCursoClick(Sender: TObject);
var
   ev: TNotifyEvent;
   continua : boolean;
   i: Integer;
   ColigadaId : String;
begin
   // Guardar o Evento para não disparar o OnClick
   ev := ckbUtilizarCurso.OnClick;
   ckbUtilizarCurso.OnClick := nil;

   cd_coligada_locate := TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo();

   if (cbSituacoes.ItemIndex = 0) then
   begin
      Mensagem(
      'Para concluir o cadastro, favor selecionar o Grau antes de clicar em salvar.',
         'Aviso',
        MB_ICONWARNING + MB_OK,
        Handle
      );
      ckbUtilizarCurso.Checked := not ckbUtilizarCurso.Checked;
      ckbUtilizarCurso.OnClick := ev;
      cbSituacoes.SetFocus;

      Abort;
   end
   else
   begin
      // Função que marca e desmarca a utilização do curso
      utilizarCurso();

      if arrCursosColigadas = nil then
      begin
         arrCursosColigadas := TStringList.Create();
      end
      else
      begin
         arrCursosColigadas.Clear();
      end;
         
      ckbUtilizarCurso.OnClick := ev;
      cbColigadas.SetFocus;
      ckbUtilizarCurso.SetFocus;
   end;


   for i := 0 to cbColigadas.Items.Count - 1 do
   begin
      ColigadaId := TItemCombo(cbColigadas.Items.Objects[I]).getCodigo;

      if ColigadaId = cd_coligada_locate then
      begin
         cbColigadas.ItemIndex := I;
         Break;
      end;
   end;

end;

procedure TfrmCursos.SpeedButton2Click(Sender: TObject);
begin
   if (qyCursosMestre.State in [dsInsert, dsEdit]) then begin
      Mensagem('Salve as alterações antes de acessar a opção de Mais Informações.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      exit;
   end;
   { Apresentar a tela de campos adicionais }
   Application.CreateForm(Tfrm_cursos_turmas_adicional, frm_cursos_turmas_adicional);

   if not frm_cursos_turmas_adicional.Montar_Dados('CURSOS', qyCursosMestreCD_CURSO.AsString,0)
   then
      Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING);

   FreeAndNil(frm_cursos_turmas_adicional);
end;

procedure TfrmCursos.spResp1Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Responsével}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpFuncionario);

   if resultado_filtro.filtrado then
   Begin
      btnAlterar.Click;
      DBEditResp1.Text := IntToStr( resultado_filtro.cd_pessoa );
      txtResponsavelTurma1.Text := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfrmCursos.spResp2Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Responsével 2}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpFuncionario);

   if resultado_filtro.filtrado then
   begin
      btnAlterar.Click;
      DBEditResp2.Text := IntToStr( resultado_filtro.cd_pessoa );
      txtResponsavelTurma2.Text := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfrmCursos.FormCreate(Sender: TObject);
begin
   FDisableTimers := False;
   qyCursosMestre.ParamByName('CD_PESSOA').AsInteger := DM.iCdPessoaLogado;
   
   //   DM.Parametros_usuario(TForm(Sender));
   FTelaCarregada := False;

   UMFiltroDataAnoSem.UsaAnoSemestre := DM.UsaAnosemestre;
                                      
   UMFiltroDataAnoSem.FiltroDataCheckBoxDataInicio.Checked := False;
   UMFiltroDataAnoSem.FiltroDataCheckBoxDataFim.Checked := False;

   UMFiltroDataAnoSem.FiltroDataDateTimePickerDataInicio.Date := Now();
   UMFiltroDataAnoSem.FiltroDataDateTimePickerDataFim.Date := Now();

   if (not DM.UsaAnosemestre) then
   begin
      Bevel2.Enabled := false;
      Bevel2.Visible := false;
   end;
   

   pcGeral.ActivePage := tsCursos;
   
   with qyColigadasCadastroTurma do
   begin
      Close();
      SQL.Clear();
      SQL.Add('SELECT cd_coligada, nm_coligada FROM coligadas');
      SQL.Add('WHERE cd_coligada IN (' + DM.GetColigadas() + ') ORDER BY nm_coligada');
      Open();
   end;


   qyColigada.SQL.Clear();
   if(DM.db.Protocol = DB_PROTOCOL_MYSQL)then
   begin
      qyColigada.SQL.Add(' (SELECT 0 AS cd_coligada, ' + QuotedStr('Todas as Unidades de Ensino') +' AS nm_coligada, 0 AS nr_ordem) ');
      qyColigada.SQL.Add(' UNION ');
      qyColigada.SQL.Add(' (SELECT cd_coligada, nm_coligada, 1 FROM coligadas WHERE cd_coligada IN (' + DM.GetColigadas() + ') ) ORDER BY nr_ordem, nm_coligada ');
      qyColigada.Open;
   end
   else
   begin
      qyColigada.SQL.Add(' SELECT cast(cd_coligada as NUMBER(19)) as cd_coligada , nm_coligada , nr_ordem ');
      qyColigada.SQL.Add(' FROM                                                                           ');
      qyColigada.SQL.Add(' ( ');
      qyColigada.SQL.Add('    SELECT 0 AS cd_coligada, ' + QuotedStr('Todas as Unidades de Ensino') +' AS nm_coligada, 0 AS nr_ordem FROM DUAL ');
      qyColigada.SQL.Add(' UNION ');
      qyColigada.SQL.Add('    SELECT cd_coligada, nm_coligada, 1 FROM coligadas WHERE cd_coligada IN (' + DM.GetColigadas() + ') ORDER BY nr_ordem, nm_coligada ');
      qyColigada.sql.add(') tbl ');

      qyColigada.Open;
   end;

   criarAbasColigadas();
//   qyCursosMestre.Open;

//   tblTurnos.Open;
//   tblTurmas.Open;

//   tblDisciplinas.Open;
//   tblGradeGroup.Open;

//   tblDisc.Open;
//    qUnidadesCertificadoras.Open;
end;

procedure TfrmCursos.dtcCursosStateChange(Sender: TObject);
begin
  {Habilitando e Desabilitando os botoes}
  if pcGeral.ActivePage <> tsCursos then Exit;

  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  { ALTERACAO_CURSOS
  btnRenomearCurso.Enabled:= TDataSource( Sender ).State in [dsEdit, dsInsert];
  }
  btnRenomearTurma.Enabled:= TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];

  { ALTERACAO_CURSOS
  dbeCodigo.Enabled := (tblCursos.State in [dsInsert,dsEdit]);
  dbeCursosAnoSem.Enabled := (tblCursos.State in [dsInsert,dsEdit]);
   }
end;

procedure TfrmCursos.tblCursosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco(DataSet,E);
end;

procedure TfrmCursos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnIncluir.Enabled  then btnIncluirClick( nil );
    VK_F3 : if btnAlterar.Enabled  then btnAlterarClick( nil );
    VK_F9 : if btnExcluir.Enabled  then btnExcluirClick( nil );
    VK_F5 : if btnSalvar.Enabled   then btnSalvarClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F10 :
            case pcGeral.ActivePageIndex of
               0 : SpeedButton2Click(nil);
               1 : sbMaisInformacoesClick(nil);
             End;
    VK_F11 :  case pcGeral.ActivePageIndex of
             1 : if btnCopiarTurma.Enabled   then btnCopiarTurmaClick( nil );
             3 : if btnCopiarGrade.Enabled   then btnCopiarGradeClick( nil );
             End;
    VK_F12 : if btnSair.Enabled    then btnSairClick( nil );
  end;
end;

procedure TfrmCursos.btnIncluirClick(Sender: TObject);
begin
   // Habilita o Filtro de ano semestre
   UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := True;
   UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clBlack;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0 : begin
         if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True) then Exit;

         if qyColigadacd_coligada.AsInteger = 0 then
         begin
            Mensagem('Você precisa selecionar uma Unidade de Ensino em específico!', 'UNIMESTRE', MB_OK);

            Exit;
         end;

         dbeCcodigo.Enabled := true;
         dbeCCodigo.SetFocus();

         qyCursosMestre.Insert;
         cbSituacoes.ItemIndex := 0;
         rgPeriodoTurmas.ItemIndex := ano_semestre_incremento;
      end;

      1 : begin
         if not DM.UsuarioLogado.TemPermissao( 1148, npIncluir, True ) then Exit;

         tblTurmas.Insert;
         cbNrEtapas.Enabled := true;

         // Habilita o Filtro de ano semestre
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := False;
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clSilver;

         grdTurmas.Enabled:=false;

         if UMFiltroDataAnoSem.UsaAnoSemestre then
            tblTurmasAnoSemestre.AsInteger := strtoint(UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Text)
         else
            tblTurmasAnoSemestre.AsInteger := ANOSEMESTRE_PADRAO;

         with qyColigadasCadastroTurma do
         begin
            Close();
            SQL.Clear();
            SQL.Add(' SELECT DISTINCT c.cd_coligada, c.nm_coligada FROM coligadas c ');
            SQL.Add('    INNER JOIN cursos_coligadas cc ON ( cc.CD_COLIGADA = c.cd_coligada )');
            SQL.Add(' WHERE ' );
            SQL.Add('   cc.SN_ATIVO = 1 AND cc.CD_CURSO = "' +  qyCursosMestreCD_CURSO.AsString + '"');
            SQL.Add(' ORDER BY nm_coligada');
            Open();
         end;
         
         tblTurmascd_coligada.AsInteger := qyCursosMestreCD_COLIGADA.AsInteger;
         atualizaDepartamento();
         
         tblTurmasCurso.AsString := qyCursosMestreCD_CURSO.AsString;

         dbeTurma.Enabled:= true;
         dbeTurma.SetFocus;

         dbchTurmaEspecial.Checked:=false;
      end;

      2 : begin
         if not DM.UsuarioLogado.TemPermissao( 1112, npIncluir, True) then Exit;
         cbDisciplinaPai.ItemIndex := 0;

         dbCodDiscPai.Visible := False;
         Label59.Visible := False;

         dbDescDisc.SetFocus;
         tblDisc.Append;
         HabilitaEmenta(true);
         end;

      3 : begin
         if not DM.UsuarioLogado.TemPermissao( 1149, npIncluir, True) then Exit;

         Mensagem('Essa função foi desabilitada. Prossiga com essa ação pelo o gestão online.', Application.Title);
         Exit;

         qyGrades.Close;
         qyGrades.Open;
         qyGrades.Insert();

         
         if not DM.UsuarioLogado.TemPermissao( 1149, npIncluir, True) then Exit;
         
         qyGradesCD_CURSO.AsString := qyCursosMestreCD_CURSO.AsString;
         edGradeCodigo.SetFocus;
      end;

      4 : begin
         if not DM.UsuarioLogado.TemPermissao( 1150, npIncluir, True  ) then Exit;

         qDocumentosNecessarios.Insert;
         DBLookupComboBox1.SetFocus();
      end;
   end;
end;

procedure TfrmCursos.AlteraPreRequisitosEspecial(Sender: TObject);
var
   chaveLog, msgLog: string;
begin
   // Retirar o Pré-Requisito Especial
   if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True ) then Exit;

   with DM.qyAux2 do
   begin
      Close;
      SQL.Clear;

      if TMenuItem(Sender).Checked then
         SQL.Text := ' DELETE FROM disciplinas_prereq_especial ' +
                     ' WHERE cd_curso = :cd_curso AND cd_grade = :cd_grade AND ' +
                     '       cd_disciplina = :cd_disciplina AND cd_tipo_req = :cd_tipo_req '
      else
         SQL.Text := ' INSERT INTO disciplinas_prereq_especial ' +
                     ' VALUES (:cd_curso, :cd_grade, :cd_disciplina, :cd_tipo_req) ';

      ParamByName('cd_curso').AsString := qyGradesCD_CURSO.AsString;
      ParamByName('cd_grade').AsInteger := qyGradesCD_GRADE.AsInteger;
      ParamByName('cd_disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
      ParamByName('cd_tipo_req').AsInteger := TMenuItem(Sender).Tag;
      ExecSQL;

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
             'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
             'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
             'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13);

      if TMenuItem(Sender).Checked then
         msgLog := msgLog + 'Removida disciplina pré-requisito especial: '+IntToStr(TMenuItem(Sender).Tag)
      else
         msgLog := msgLog + 'Incluida disciplina pré-requisito especial: '+IntToStr(TMenuItem(Sender).Tag);         

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );


   end;
   qyGradesDisciplinas.Close();
   qyGradesDisciplinas.Open();
end;

procedure TfrmCursos.alterarAtosOficiais;
begin
  qyAtosOficiais.Edit;

   if not PrincipalForm.ProcuraForm( TForm(frmAtosOficiais) ) then
     Application.CreateForm(TfrmAtosOficiais, frmAtosOficiais);

   frmAtosOficiais.ShowModal;
end;

procedure TfrmCursos.atualizaCheck;
begin
   if ( DM.UsuarioLogado.TemPermissao(1997, npAlterar, False) ) then
   begin

      if DBLookupComboBox10.Text = '' then
      Begin
         DBCheckBox5.Enabled := false
      end
      else
         DBCheckBox5.Enabled := true;
   end;
end;

procedure TfrmCursos.btExcluirClick(Sender: TObject);
begin
      if not DM.UsuarioLogado.TemPermissao( 1148, npExcluir, True ) then Exit;

      qConvenios.SQL.Clear;
      qConvenios.SQL.add('DELETE FROM TURMAS_CONVENIOS WHERE  CD_TURMAS_CONVENIOS = :CD_TURMAS_CONVENIOS');
      qConvenios.ParamByName('CD_TURMAS_CONVENIOS').AsString := qTurmasConvenios.FieldByName('CD_TURMAS_CONVENIOS').asString;
      qConvenios.ExecSQL;

      qTurmasConvenios.close;
      qTurmasConvenios.Open;
end;

procedure TfrmCursos.btnAlterarClick(Sender: TObject);
begin

   // Habilita o Filtro de ano semestre
   UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := True;
   UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clBlack;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0 : begin

         if NOT(DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True )) OR
            TChecarUsoColigada.Create( TCursoMestre.Create( qyCursosMestreCD_CURSO.AsString ) ).NaoPossuiPermissao() then
         begin
            Exit;
         end;

         qyCursosMestre.Edit;
      end;

      1 : begin
         if not DM.UsuarioLogado.TemPermissao( 1148, npAlterar, True) then Exit;

         // Desabilita o Filtro de ano semestre
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := False;
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clSilver;
         tblTurmas.Edit;
      end;

      2 : Begin
         if not DM.UsuarioLogado.TemPermissao( 1112, npAlterar, True ) then
           Exit;

         if (not verificarDiplomaCurriculoDigitalDisciplina(tblDisc.FieldByName('id_disciplina').AsInteger)) then
           Exit;

         dbDescDisc.SetFocus;
         tblDisc.Edit;
      End;

      3 : begin
         Mensagem('Essa função foi desabilitada. Prossiga com essa ação pelo o gestão online.', Application.Title);
         Exit;

         if not DM.UsuarioLogado.TemPermissao( 1149, npAlterar, True ) then
           Exit;

         if (not verificarDiplomaCurriculoDigital(qyGrades.FieldByName('id').AsInteger)) then
           Exit;

         qyGrades.Edit;
      end;

      4 : Begin
         if not DM.UsuarioLogado.TemPermissao( 1150, npAlterar, True) then Exit;

         qDocumentosNecessarios.Edit;
         DBLookupComboBox1.SetFocus;
      end;
   end;
end;

function TfrmCursos.isVinculavelCentro(cd_curso: String; coligada, area, departamento: Integer): Boolean;
const
   SQL_CENTROS_REGRAS =
      ' SELECT ' +
      ' 	cd_centro, ' +
      ' 	ds_sql, ' +
      '  nr_tipo_regra ' +
      ' FROM ' +
      ' 	fin_config_centro_custos ' +
      ' WHERE ' +
      '	nr_tipo_regra > 1  ' +
      ' ORDER BY ' +
      '  cd_classificacao ';
      
   SQL_REGRAS_CENTRO =
      ' SELECT ' +
      ' 	IFNULL(fcc.cd_coligada, '''') AS cd_coligada, ' +
      ' 	IFNULL(fca.cd_area, '''') AS cd_area, ' +
      ' 	IFNULL(fcd.cd_departamento,'''') AS cd_departamento, ' +
      ' 	IFNULL(fcu.cd_curso, '''') AS cd_curso, ' +
      ' 	fcc.cd_centro ' +
      ' FROM ' +
      ' 	fin_centro_coligadas AS fcc ' +
      ' LEFT JOIN fin_centro_departamentos AS fcd ON ( ' +
      ' 	fcd.cd_centro = fcc.cd_centro ' +
      ' 	AND fcd.cd_coligada = fcc.cd_coligada ' +
      ' ) ' +
      ' LEFT JOIN fin_centro_areas AS fca ON ( ' +
      ' 	fca.cd_centro = fcc.cd_centro ' +
      ' ) ' +
      ' LEFT JOIN fin_centro_cursos AS fcu ON ( ' +
      ' 	fcu.cd_centro = fcc.cd_centro ' +
      ' 	AND fcu.cd_departamento = fcd.cd_departamento ' +
      ' ) ' +
      ' LEFT JOIN fin_config_centro_custos AS fccc ON( ' +
      ' 	fccc.cd_centro = fcc.cd_centro ' +
      ' ) ' +
      ' WHERE ' +
      '  fccc.nr_tipo_regra > 1 ' + 
      ' ORDER BY ' +
      ' 	fcu.cd_curso DESC, fcd.cd_departamento DESC, fca.cd_area DESC, ' +
      '  fcc.cd_coligada DESC, fccc.cd_classificacao DESC ';      
var
   qryBuscaCentrosRegras,
   qryRegrasCentro: TUMZReadOnlyQuery;
   
   proximo: Boolean;      
begin
   DM.CriarConsulta(qryBuscaCentrosRegras);

   qryBuscaCentrosRegras.SQL.Text := SQL_CENTROS_REGRAS;
   qryBuscaCentrosRegras.Open;

   proximo := True;
   Result := False;

   // Deve parar somente se ja encontrou algum centro para vincular,
   // ou se acabou os centros de custos possíveis.
   while not(qryBuscaCentrosRegras.Eof) and proximo do
   begin

      // Verifica se o SQL do centro de custo é aceito OU
      // as regras configuradas.
      if isSQLCentroCustoAceito(qryBuscaCentrosRegras.FieldByName('ds_sql').AsString) then
      begin
         proximo := False;

         // Aplica o CONTINUE pois não deve trocar qual centro de custo que
         // será aplicado o vínculo com a turma.
         Continue;
      end;

      qryBuscaCentrosRegras.Next;
   end;

   if proximo = false then
   begin
      Result := True;
      Exit;
   end;

   DM.CriarConsulta(qryRegrasCentro);

   qryRegrasCentro.SQL.Text := SQL_REGRAS_CENTRO;
   qryRegrasCentro.Open;

   if proximo and qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         coligada,
         area,
         departamento,
         cd_curso
      ]), []) then
   begin
      Result := True;
      Exit;
   end;

   if proximo and qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         coligada,
         area,
         departamento,
         ''
      ]), []) then
   begin
      Result := True;
      Exit;
   end;

   if qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         coligada,
         area,
         '',
         ''
      ]), []) then
   begin
      Result := True;
      Exit;
   end;

   if qryRegrasCentro.Locate('cd_coligada;cd_area;cd_departamento;cd_curso', VarArrayOf([
         coligada,
         '',
         '',
         ''
      ]), []) then
   begin
      Result := True;
      Exit;
   end;
end;

procedure TfrmCursos.gravalog();
var
   operacao,msgLogTurmas,msgLogFom: String;
begin
   operacao := 'Alteração';
   msgLogFom := 'Alterados dados da turma ' + tblTurmasCodigo.AsString + ', ';

   if tblTurmas.State in [DsInsert] then
   begin
      operacao := 'Inclusão';
      msgLogFom := 'Incluidos dados da turma ' + tblTurmasCodigo.AsString + ', ';
   end;

   if cbBloqueioVagas.Items[cbBloqueioVagas.ItemIndex] <> bloqueioIncial then
   begin
      msgLogTurmas := 'Bloqueio de vagas: ' + bloqueioIncial + ' para ' + cbBloqueioVagas.Items[cbBloqueioVagas.ItemIndex] + ', ';
   end;

   if cbNrEtapas.Items[cbNrEtapas.ItemIndex] <> etapaInicial then
   begin
      msgLogTurmas := msgLogTurmas + 'Etapa: ' + etapaInicial + ' para ' + cbNrEtapas.Items[cbNrEtapas.ItemIndex] + ', ';
   end;

   if tblTurmassn_proximo_curso.AsString <> snUsaProximoCurso then
   begin
      msgLogTurmas := 'Tipo próxima turma: ' + snUsaProximoCurso + ' para ' + tblTurmassn_proximo_curso.AsString + ', ';
   end;

   //Força atualizar a query
   tblTurmascd_etapa_mec.AsString := DBEdit12.Text;
   tblTurmasdescricao.AsString := dbeDescricaoTurma.Text;
   tblTurmasobsgerais.AsString := mmGeraisTurma.Lines.Text;

   if (dbcbExportaTurmaMOODLE.Checked) then
   begin
      tblTurmassn_exporta_moodle.AsString := dbcbExportaTurmaMOODLE.ValueChecked;
   end else begin
      tblTurmassn_exporta_moodle.AsString := dbcbExportaTurmaMOODLE.ValueUnchecked;
   end;

   msgLogTurmas := msgLogTurmas + DM.geraLogForm(frmCursos,'tsTurmas',operacao);

   if (tblTurmassn_matricula_mesmo_anosem.AsString <> snMesmoAnoSem) AND (pos('sn_matricula_mesmo_anosem',msgLogTurmas) = 0)  then
   begin
      msgLogTurmas := msgLogTurmas + 'sn_matricula_mesmo_anosem: ' + snMesmoAnoSem + ' para ' + tblTurmassn_matricula_mesmo_anosem.AsString  + ', ';
   end;

   if(msgLogTurmas <> '') then
   begin
      DM.setLog(1006, operacao, tblTurmasCodigo.AsString + ';' + tblTurmasAnoSemestre.AsString, tblTurmascd_coligada.AsInteger , msgLogFom + msgLogTurmas);
   end;
end;

function tfrmCursos.verificaTabelasMysam(var numTabelas:integer): boolean;
var
   qyTabelas:TUMZQuery;
   slCamposAlteracao,slTabelasIgnorar,slTabelasExcessao: TStringList;
begin
   dm.CriarConsulta(qyTabelas);
   
   { Define os campos que serão verificados ao alterar o código da pessoa em todas as tabelas }
   slCamposAlteracao := TStringList.Create();
   slCamposAlteracao.Add(LowerCase('CODIGO'));
   slCamposAlteracao.Add(LowerCase('CD_PROXIMA_TURMA'));
   slCamposAlteracao.Add(LowerCase('CD_TURMA'));
   slCamposAlteracao.Add(LowerCase('FILTRO_TURMA'));
   slCamposAlteracao.Add(LowerCase('GRUPO_TURMA'));
   slCamposAlteracao.Add(LowerCase('TURMA'));
   slCamposAlteracao.Add(LowerCase('TURMADEPENDENCIA'));
   slCamposAlteracao.Add(LowerCase('TURMAMATRICULA'));
   slCamposAlteracao.Add(LowerCase('TURMAMAT'));
   slCamposAlteracao.Add(LowerCase('TURMA_BASE'));
   slCamposAlteracao.Add(LowerCase('DS_CENTRO'));
   slCamposAlteracao.Add(LowerCase('CD_PROXIMA_TURMA_REPR'));

   { Define quais tabelas serão ignoradas nessa varredura }
   slTabelasIgnorar := TStringList.Create();
   slTabelasIgnorar.Add('sabio_integracao_pessoas');
   slTabelasIgnorar.Add(LowerCase('ATUALIZACOES_ANTIGA'));
   slTabelasIgnorar.Add(LowerCase('BANCOS'));
   slTabelasIgnorar.Add(LowerCase('CODIGORETORNOSPC'));
   slTabelasIgnorar.Add(LowerCase('CURSOS_MUDADO'));
   slTabelasIgnorar.Add(LowerCase('DEPARTAMENTOS'));
   slTabelasIgnorar.Add(LowerCase('DIARIO_LOGS'));
   slTabelasIgnorar.Add(LowerCase('DIARIO_TERMINAL_ACESSOS'));
   slTabelasIgnorar.Add(LowerCase('DISCIPLINAS'));
   slTabelasIgnorar.Add(LowerCase('DISCIPLINAS_EMENTAS'));
   slTabelasIgnorar.Add(LowerCase('DOCUMENTOS'));
   slTabelasIgnorar.Add(LowerCase('DOCUMENTOS_CURSOS'));
   slTabelasIgnorar.Add(LowerCase('EXPO_CONSULTA_CAMPOS'));
   slTabelasIgnorar.Add(LowerCase('GRADECURRICULAR_MUDADO'));
   slTabelasIgnorar.Add(LowerCase('GRADUACOESPROFESSORES'));
   slTabelasIgnorar.Add(LowerCase('HORARIOS'));
   slTabelasIgnorar.Add(LowerCase('MATRICULAS_NOTIFICA'));
   slTabelasIgnorar.Add(LowerCase('MENSAGENS'));
   slTabelasIgnorar.Add(LowerCase('MENSAGENS_GERAIS'));
   slTabelasIgnorar.Add(LowerCase('MODULOS'));
   slTabelasIgnorar.Add(LowerCase('NU_LOG'));
   slTabelasIgnorar.Add(LowerCase('NU_PESSOAS_AREAS'));
   slTabelasIgnorar.Add(LowerCase('PLANOSDESCONTO'));
   slTabelasIgnorar.Add(LowerCase('PROD_ANEXO'));
   slTabelasIgnorar.Add(LowerCase('PROVAINSTITUCIONAL_GABARITOS'));
   slTabelasIgnorar.Add(LowerCase('PROVAINSTITUCIONAL_REDACAO'));
   slTabelasIgnorar.Add(LowerCase('RETORNO'));
   slTabelasIgnorar.Add(LowerCase('RETORNO_MUDADO'));
   slTabelasIgnorar.Add(LowerCase('SITUACOES'));
   slTabelasIgnorar.Add(LowerCase('TAM_INSCRICAO_GE_ALUNOS'));
   slTabelasIgnorar.Add(LowerCase('TMP_POL_ORDEM_GABARITOS'));
   slTabelasIgnorar.Add(LowerCase('TMP_ORD_AULAS'));
   slTabelasIgnorar.Add(LowerCase('TIPOSMOVIMENTO'));
   slTabelasIgnorar.Add(LowerCase('USUARIOS_MUDADO'));

   { Define quais tabelas devem fazer o ajuste (apenas no final) mas serão ignoradas na verificação de MyISAM }
   slTabelasExcessao := TStringList.Create();
   slTabelasExcessao.Add('fin_mov_cr');
   slTabelasExcessao.Add('itensretorno');
   slTabelasExcessao.Add('memory_diario_terminal_acessos');

   DM.CriarConsulta(qyTabelas);
   TfSplash.GetInstancia().ShowSplashScreen('Estruturas', 'Buscando estruturas a serem verificadas.');

   { Busca todas as tabelas (e suas informações) existentes na base de dados }
   qyTabelas.Close;
   qyTabelas.SQL.Text := 'SHOW TABLE STATUS FROM '+DM.db.Database;
   qyTabelas.Open;

   //Passa o contador ja que o statement não tem essa propriedade...
   numTabelas := qyTabelas.RecordCount;

   TfSplash.GetInstancia().CloseSplashScreen();

   // Verifica primeiramente se existem tabelas que estão em MySQL e precisam ser InnoDB
   result := DM.verificaTabelasMyISAM(qyTabelas, slCamposAlteracao, slTabelasIgnorar, slTabelasExcessao);
end;

procedure TfrmCursos.atualizaDepartamento();
begin
   qyGetDepto.Close();
   qyGetDepto.ParamByName('CURSO').AsString:= tblTurmasCurso.AsString;
   qyGetDepto.ParamByName('COLIGADA').AsInteger:= tblTurmascd_coligada.AsInteger;
   qyGetDepto.Open();

   lbDepartamento.Caption := qyGetDepto.FieldByName('descricao').AsString;
end;

procedure TfrmCursos.btnSalvarClick(Sender: TObject);
const
   MSG_VALIDACAO = 'O campo $$campo$$ é obrigatório.';
   SQL_HAS_GRADE_PADRAO = 'SELECT COUNT(CD_GRADE) as qtd_grade FROM GRADES WHERE CD_CURSO = :CURSO AND SN_PADRAO = 1 AND CD_GRADE <> :GRADE_ATUAL';
   SQL_UPATE_GRADE_PADRAO = 'UPDATE GRADES SET SN_PADRAO = 0 WHERE CD_CURSO = :CURSO';
const
   SSQLUpdateCentroCusto = ''
      + 'UPDATE '
      + '	fin_config_centro_custos c '
      + 'SET '
      + '	c.ds_centro = ? '
      + 'WHERE '
      + '	c.cd_centro = ? AND '
      + '	c.ds_centro = ? AND '
      + '	EXISTS ( '
      + '		SELECT '
      + '			t.codigo '
      + '		FROM '
      + '			turmas t '
      + '		WHERE '
      + '			c.cd_centro = t.cd_centro AND '
      + '			t.codigo = ? AND '
      + '			t.anosemestre = ? '
      + '	) ';
type
   tabela = record
      nome: String;
      descricao: String;
      campo_curso: String;
      campo_grade: String;
   end;
var
   bIncluindo,
   bAlterar,
   centroNullo    : Boolean;

   xAnoSemestre,
   iDisciplinaRet : Integer;

   xCurso,
   retorno,
   msgLog,
   chaveLog,
   state,
   xCodigo        : String;

   qryInsere,
   qyHasGradePadrao,
   qyUpdateCurso,
   qryCriaDiscPaiLite,
   qryBuscaUltCodDisc   : TUMZQuery;
   
   ordem,
   codMec,
   observacao: String;

   sList: TList;

   i,
   iBloqVag,
   cd_centro_unico: integer;

   qryAltera,
   qrySalva: TUMZQuery;

   sMensagem: String;

   tabelas: array[1..6] of tabela;

   naoAltera: boolean;

   qryUpdateEmentas: TUMZQuery;

   resultadoBuscaCentro: TResultadoBuscaCentro;
   Stmt: IZPreparedStatement;

   j, x: integer;
   sChave : String;
begin

   if ((pcGeral.ActivePage = tsTurmas) and (dblSituacao.Text = 'CONCLUIDA') and
   ((dbeDataConclusao.Text = '  /  /    ') or (dbeDataConclusao.Text = ''))) then
   begin
      Mensagem('Favor preencher uma data de conclusão na aba agenda local, para as turmas em situação Concluída','Atenção');
      pgTurmas.ActivePage := TabSheet5;
      dbeDataConclusao.SetFocus;
      exit;
   end;

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0 : begin
         sChave := qyCursosMestreCD_CURSO.AsString + ';' + TItemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo();
         bIncluindo := qyCursosMestre.State in [dsInsert];

         for j := 0 to cbColigadas.Items.Count - 1 do
         begin
            sChave := qyCursosMestreCD_CURSO.AsString + ';'
               + TItemCombo(cbColigadas.Items.Objects[j]).getCodigo();
               
            if (arrCursosColigadas.Values[sChave] <> '0') AND
               (arrCursosColigadas.Values[sChave] <> '') then
            begin
               SelecionouColigada := true;
            end;
         end;

         if bIncluindo and not(SelecionouColigada) then
         begin
            Mensagem(
               'Para concluir o cadastro, favor selecionar uma coligada antes de clicar em salvar.',
               'Aviso',
               MB_ICONWARNING + MB_OK,
               Handle
            );

            Exit;
         end;
         
         qyCursosMestreCD_CURSO.AsString := trim(qyCursosMestreCD_CURSO.AsString);

         xCodigo := qyCursosMestreCD_CURSO.AsString;

         if (qyCursosMestreSN_ATIVO_COLIGADA.IsNull) then
         begin
            qyCursosMestreSN_ATIVO_COLIGADA.AsInteger := 0;
         end;


         qyCursosMestre.Post;
         atualizaGrauCursos(qyCursosMestreCD_CURSO.AsString);


         dbeCcodigo.Enabled := false;
         qyCursosMestre.DisableControls;
         qyCursosMestre.Close;
         qyCursosMestre.Open;
         qyCursosMestre.Locate( 'CD_CURSO', xCodigo, [loPartialKey] );
         qyCursosMestre.EnableControls;
      end;

      1 : begin

         if (dblSituacao.Text = 'CONCLUIDA') OR (dblSituacao.Text = 'CANCELADA') then
         begin
            tblTurmasSN_ATIVA.AsInteger := 0;
         end;

         // Habilita o Filtro de ano semestre
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := True;
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clBlack;

         iBloqVag := cbBloqueioVagas.ItemIndex;

         grdTurmas.Enabled:=true;

         bIncluindo := (tblTurmas.State in [dsInsert]);
         bAlterar := (tblTurmas.State in [dsEdit]);

         if tblTurmas.State in [dsInsert] then
         begin
            tblTurmasCodigo.AsString := trim(tblTurmasCodigo.AsString);
         end;

         { Quando a situação escolhida possui o cd_auxiliar = 2 o
           sistema irá tentar cancelar os alunos nas disciplinas/matrícula }
         if (qrySituacoesTurmas.FieldByName('cd_auxiliar').AsInteger = 2) and (tblTurmascd_situacao.AsInteger > 0) then
         begin
            if not cancelarAlunosTurma(tblTurmasAnoSemestre.AsInteger, tblTurmasCodigo.AsString) then
            begin
               Exit;
            end;
         end;

         // verifica a combo de turno se esta selecionada

         if cmbTurnosTurmas.Text = '' then
         begin
            Mensagem('A turma precisa possuir um turno definido');
            pgTurmas.ActivePage := TabSheet4;
            cmbTurnosTurmas.SetFocus;
            exit;
         end;

         // verifica a combo de turno se esta selecionada

         if cbFormaAvaliacao.Text = '' then
         begin
            Mensagem('Para prosseguir, selecione uma forma de avaliação');
            pgTurmas.ActivePage := TabSheet4;
            cbFormaAvaliacao.SetFocus;
            exit;
         end;

         if cbFormaAvaliacao.Text = '' then
         begin
            Mensagem('Para prosseguir, selecione uma forma de avaliação');
            pgTurmas.ActivePage := TabSheet4;
            cbFormaAvaliacao.SetFocus;
            exit;
         end;

         // Verifica se o usuário está selecionando a série OPTATIVA
         if cbNrEtapas.Items[cbNrEtapas.ItemIndex] = 'Optativa' then
         begin
            // Verifica se já foi inserida uma turma de série = OPTATIVA nesse anosemestre, curso, gradecurricular e turno
            qDisciplinasOptativas.Close;
            qDisciplinasOptativas.SQL.Clear;
            qDisciplinasOptativas.SQL.Text :=
              ' SELECT ' +
              '    COUNT(*) total ' +
              ' FROM ' +
              '    turmas ' +
              ' WHERE ' +
              '    anosemestre = :anosemestre AND ' +
              '    codigo <> :turma AND ' +
              '    curso = :curso AND ' +
              '    cd_grade = :cd_grade AND ' +
              '    turno = :turno AND ' +
              '    serie = -100 ';

            qDisciplinasOptativas.ParamByName('anosemestre').AsInteger := tblTurmas.FieldByName('ANOSEMESTRE').AsInteger;
            qDisciplinasOptativas.ParamByName('curso').AsString := tblTurmas.FieldByName('CURSO').AsString;
            qDisciplinasOptativas.ParamByName('cd_grade').AsInteger := tblTurmas.FieldByName('CD_GRADE').AsInteger;
            qDisciplinasOptativas.ParamByName('turno').AsString := tblTurmas.FieldByName('TURNO').AsString;
            qDisciplinasOptativas.ParamByName('turma').AsString := tblTurmas.FieldByName('CODIGO').AsString;

            qDisciplinasOptativas.Open;

            if ( qDisciplinasOptativas.FieldByName('total').AsInteger > 0 ) then
            begin
               // Apresenta mensagem de erro
               Mensagem('Não é possível selecionar a etapa "Optativa", pois já existe uma turma com essa etapa nesse ano/semestre, grade, curso e turno.',  'Informação',  MB_OK + MB_ICONINFORMATION, Handle);
               Exit;
            end;
         end;

         cd_centro_unico := isCentroUnico;

         if cd_centro_unico <> -1 then
         begin
            tblTurmasCD_CENTRO.AsInteger := cd_centro_unico;                           
         end;
         
         centroNullo := tblTurmasCD_CENTRO.IsNull;

         //Ativa/Desativa o centro de custo
         direcionaCentro(tblTurmasCD_CENTRO.AsInteger,false);

         observacao := DM.variavel_parametro('obs_mensagem_turma_sem_centro');

         if observacao <> '' then
         begin
            observacao := observacao + chr(13) + chr(10) + chr(13) + chr(10);
         end;
         
         if centroNullo then
         begin
            if not(isVinculavelCentro(
                  qyCursosMestreCD_CURSO.AsString,
                  qyCursosMestreCD_COLIGADA.AsInteger,
                  qyCursosMestreCD_AREA.AsInteger,
                  qyCursosMestreCD_DEPTO.AsInteger )) then
            begin
               cbBloqueioVagas.ItemIndex := iBloqVag;
               if Mensagem(
                     'Não foi possível identificar o centro de custo da turma. Você deverá ' +
                     'selecionar o centro de custo para concluir a criação da turma.' + chr(13) + chr(10) + chr(13) + chr(10) +
                     observacao +
                     'Deseja selecionar o centro de custo agora e confirmar o cadastramento da turma?',
                     'Aviso',
                     MB_YESNO + MB_ICONWARNING
                  ) = mrNo then
               begin
                  Exit;
              end
               else
               begin
                  resultadoBuscaCentro := TfrmBuscaCentro.getInstancia.ShowModal(false, tcAnalitico);

                  cbBloqueioVagas.ItemIndex := iBloqVag;

                  if resultadoBuscaCentro.objCentro <> nil then
                  begin
                     tblTurmasCD_CENTRO.AsInteger :=
                        resultadoBuscaCentro.objCentro.Centro;
                  end
                  else
                  begin
                     Exit;
                  end;
               end;

            end;
         end;

         if tblTurmas.State in [dsInsert,dsEdit] then
         begin
            tblTurmassn_bloquear_vagas.AsInteger := cbBloqueioVagas.ItemIndex;

            if (dblSituacao.Text = 'CONCLUIDA') OR (dblSituacao.Text = 'CANCELADA') then
            begin
               tblTurmasSN_ATIVA.AsInteger := 0;
            end;
         end;


         // Gera Log
         gravaLog();

         if bAlterar then
         begin
            Stmt := PrepareStatement(SSQLUpdateCentroCusto);
            try
               Stmt.SetString(1, tblTurmasCodigo.AsString);
               Stmt.SetInt(2, tblTurmasCD_CENTRO.AsLargeInt);
               Stmt.SetString(3, tblTurmasCodigo.OldValue);
               Stmt.SetString(4, tblTurmasCodigo.OldValue);
               Stmt.SetInt(5, tblTurmasAnoSemestre.OldValue);
               Stmt.ExecutePrepared;
            finally
               Stmt.Close;
               Stmt := nil;
            end;
         end;

         if tblTurmas.State in [dsInsert,dsEdit] then
         begin
            cbBloqueioVagas.ItemIndex := iBloqVag;
            tblTurmas.Post;
         end;

         xCodigo := tblTurmasCodigo.AsString;
         xAnoSemestre := tblTurmasAnoSemestre.AsInteger;

         if bIncluindo or centroNullo then
         begin
            setTurmaCentroCusto(
               xCodigo,
               xAnoSemestre
            );

            //Ativa/Desativa o centro de custo que foi criado
            direcionaCentro(tblTurmasCD_CENTRO.AsInteger,true);

            cbBloqueioVagas.ItemIndex := iBloqVag;
            if tblTurmas.State in [dsInsert, dsEdit] then
            begin
               tblTurmas.Post;
            end;
         end;

         tblTurmas.DisableControls;
         tblTurmas.Close;
         tblTurmas.Open;
         tblTurmas.Locate( 'AnoSemestre;Codigo', VarArrayOf([xAnoSemestre,xCodigo]), [loPartialKey] );
         tblTurmas.EnableControls;
      end;

      2 : begin
         if dbCodDisc.Text = trim('') then begin
            Mensagem(StringReplace(MSG_VALIDACAO,'$$campo$$','Código', [rfReplaceAll]),'Validação', MB_OK+MB_ICONSTOP, handle);
            exit;
         end;

         if dbDescDisc.Text = trim('') then begin
            Mensagem(StringReplace(MSG_VALIDACAO,'$$campo$$','Descrição', [rfReplaceAll]),'Validação', MB_OK+MB_ICONSTOP, handle);
            exit;
         end;

         if dbSiglaDisc.Text = trim('') then begin
            Mensagem(StringReplace(MSG_VALIDACAO,'$$campo$$','Sigla', [rfReplaceAll]),'Validação', MB_OK+MB_ICONSTOP, handle);
            exit;
         end;

         if (dbCodDiscPai.Text = trim('')) and not(DM.lite) then begin
            Mensagem(StringReplace(MSG_VALIDACAO,'$$campo$$','Disciplina Pai', [rfReplaceAll]),'Validação', MB_OK+MB_ICONSTOP, handle);
            exit;
         end;


         if tblDisc.State in [dsEdit] then
         begin
            if (dbDescDisc.Text <> tblDiscDescricao.AsString) AND
               (not DM.UsuarioLogado.TemPermissao( 1112, npEspecial, True  )) then
            begin
               tblDisc.Cancel;
            end;
         end;

         {Aqui criamos a disciplina MESTRA igual a disciplina atual CASO cliente
         estiver usando versão LITE.}
         if DM.lite then
         begin
            DM.CriarConsulta(qryCriaDiscPaiLite);
            DM.CriarConsulta(qryBuscaUltCodDisc);

            qryBuscaUltCodDisc.SQL.Text := 'SELECT IFNULL(MAX(codigo)+1, 1) as '+
                        'prox FROM disciplinas';
            qryBuscaUltCodDisc.Open;

            ordem := '0';
            codMec := '0';

            if dbOrdemDisc.Text <> '' then
               ordem := dbOrdemDisc.Text;

            if dbCdMECDisc.Text <> '' then
               codMec := dbCdMECDisc.Text;
            


            qryCriaDiscPaiLite.SQL.Text :=  ' INSERT INTO '+
                                             ' disciplinas_mestre '+
                                             ' ( '+
                                             ' cd_disciplina_pai, '+
                                             ' ds_disciplina, '+
                                             ' nr_ordem, '+
                                             ' ds_sigla, '+
                                             ' ds_descricao, '+
                                             ' cd_disc_mec, '+
                                             ' sn_ativa '+
                                             ' ) '+
                                         ' VALUES '+
                                             ' ( '+
                                             ' '+qryBuscaUltCodDisc.FieldByName('prox').AsString+', '+
                                             ' '+QuotedStr(dbDescDisc.Text)+', '+
                                             ' '+ordem+', '+
                                             ' '+QuotedStr(dbSiglaDisc.Text)+', '+
                                             ' '+QuotedStr(dbDescDisc.Text)+', '+
                                             ' '+codMec+', '+
                                             ' 1 '+
                                             ' ) ';
            qryCriaDiscPaiLite.ExecSQL;

            tblDiscCD_DISCIPLINA_PAI.AsString := qryBuscaUltCodDisc.FieldByName('prox').AsString;
         end;


         if tblEmentas.State in [dsInsert, dsEdit] Then
         Begin
            xAnoSemestre := tblEmentasanosemestre.AsInteger;
            tblEmentas.Post;
            tblEmentas.close;
            tblEmentas.Open;
            tblEmentas.Locate('anosemestre', xAnoSemestre, []);
         End;

         if tblDisc.State in [dsInsert, dsEdit] Then
         begin
            xCodigo := tblDiscCodigo.AsString;
            xCurso := tblDiscCurso.AsString;

            // Verifica se houve mudanças no código da disciplina ou no nome
            if ( tblDisc.FieldByName('codigo').AsInteger <> StrToInt(dbCodDisc.Text) ) or (tblDisc.FieldByName('descricao').AsString <> dbDescDisc.Text) then
            begin
               // Verifica se disciplina está alocada para algum Professor ou Aluno
               if(DM.disciplinaAlocada(tblDisc.FieldByName('codigo').AsInteger, tblDisc.FieldByName('curso').AsString) = true) then
               begin
                  bAlterar := Mensagem('Você está tentando alterar uma disciplina que já '    +
                   'tem matrículas. Aconselhamos a inclusão de uma nova'  +
                   ' disciplina e vínculo desta com a grade curricular.'  +
                   'A alteração da nomenclatura da disciplina, altera os '+
                   'diários de professores, históricos escolares, entre ' +
                   'outros documentos. Tem certeza que deseja prosseguir?',
                   'Confirmação', MB_YESNO, Handle) = mrYes;
                  if not bAlterar then
                  begin
                     tblDisc.Cancel();
                     exit;
                  end;
               end;
            end;

            if not(DM.lite) then
            begin
               if ((cbDisciplinaPai.ItemIndex = 0) AND (dbCodDiscPai.Text = '') OR (cbDisciplinaPai.ItemIndex = -1)) then
               begin
                  Mensagem( 'É necessário informar um código para cadastrar uma nova diciplina mestra.',
                            'Aviso', MB_OK + MB_ICONEXCLAMATION, Handle );
                  Exit;
               end;
            end;


            // na inclusão a ementa sera copiada

            if (cbDisciplinaPai.ItemIndex = 0)and(tblDisc.State = dsInsert) then
            begin
               DM.CriarConsulta(qryInsere);
               tblEmentas.First;
               while not(tblEmentas.Eof) do
               begin
                  if DM.lite then
                  begin   
                     qryInsere.sql.Text :=                    ''+
                       'INSERT INTO                           '+
                       '  disciplinas_mestre_ementas          '+
                       '(                                     '+
                       '  cd_disciplina_pai,                  '+
                       '  nr_anosemestre,                     '+
                       '  me_ementa,                          '+
                       '  me_bibliografia_basica,             '+
                       '  me_bibliografia_complementar,       '+
                       '  me_bibliografia_suplementar,        '+
                       '  me_objetivo,                        '+
                       '  me_justificativa,                   '+
                       '  me_habilidades_compet               '+
                       ')                                     '+
                       'VALUES                                '+
                       '(                                     '+
                       qryBuscaUltCodDisc.FieldByName('prox').AsString+' ,   '+
                       tblEmentasanosemestre.AsString  +' , '''+
                       tblEmentasementa.AsString       +''' , '''+
                       dbreBibBasica.Text+''' ,'''+
                       dbreBibComp.Text+''','''+
                       dbreBibSup.Text+''','''+
                       dbObjetivo.Text+''','''+
                       dbreJustificativa.Text+''','''+
                       dbreHabilidadesCompetencias.Text+''')';
                  end
                  else
                  begin
                     qryInsere.sql.Text :=                    ''+
                       'INSERT INTO                           '+
                       '  disciplinas_mestre_ementas          '+
                       '(                                     '+
                       '  cd_disciplina_pai,                  '+
                       '  nr_anosemestre,                     '+
                       '  me_ementa,                          '+
                       '  me_bibliografia_basica,             '+
                       '  me_bibliografia_complementar,       '+
                       '  me_bibliografia_suplementar,        '+
                       '  me_objetivo,                        '+
                       '  me_justificativa,                   '+
                       '  me_habilidades_compet               '+
                       ')                                     '+
                       'VALUES                                '+
                       '(                                     '+
                       QuotedStr(dbCodDiscPai.Text)+' ,   '+
                       tblEmentasanosemestre.AsString  +' , '''+
                       tblEmentasementa.AsString       +''' , '''+
                       dbreBibBasica.Text+''' ,'''+
                       dbreBibComp.Text+''','''+
                       dbreBibSup.Text+''','''+
                       dbObjetivo.Text+''','''+
                       dbreJustificativa.Text+''','''+
                       dbreHabilidadesCompetencias.Text+''')';
                  end;
                  qryInsere.ExecSQL;
                  tblEmentas.Next;
               end;
               tblEmentas.Locate('anosemestre', xAnoSemestre, []);
            end;

            tblDisc.Post;
            iDisciplinaRet := tblDisccodigo.AsInteger;
            tblDisc.DisableControls;

            // vincular as ementas corretas
            if sbBloqueiaValor.Down = true then
            begin
               DM.CriarConsulta(qryUpdateEmentas);

               //deleta os registros de informacao da disciplinas ementas
               qryUpdateEmentas.sql.Text := ' '+
               'DELETE                        '+
               'FROM                          '+
               '  disciplinas_ementas         '+
               'WHERE                         '+
               '  curso  =     '''+tblDiscCurso.AsString+''' AND '+
               '  codigo =     '+tblDisccodigo.AsString;
               qryUpdateEmentas.ExecSQL;

               qryUpdateEmentas.SQL.Text := ''+
               'INSERT INTO disciplinas_ementas (codigo,anosemestre,ementa,bibliografia_basica,bibliografia_complementar,bibliografia_suplementar,objetivo,curso, TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML, TX_BIB_SUP_HTML, '+
               '  ME_JUSTIFICATIVA, TX_JUSTIFICATIVA_HTML, ME_HABILIDADES_COMPET, TX_HABILIDADES_COMPET_HTML) '+
               'SELECT                                                           '+
                  tblDisccodigo.AsString+',                                      '+
               '  nr_anosemestre,                                                '+
               '  me_ementa,                                                     '+
               '  me_bibliografia_basica,                                        '+
               '  me_bibliografia_complementar,                                  '+
               '  me_bibliografia_suplementar,                                   '+
               '  me_objetivo,                                                   '+
               '' + QuotedStr(tblDiscCurso.AsString) + ',                        '+
               ' TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML, TX_BIB_SUP_HTML,          '+
               ' ME_JUSTIFICATIVA, TX_JUSTIFICATIVA_HTML,                        '+
               ' ME_HABILIDADES_COMPET, TX_HABILIDADES_COMPET_HTML               '+
               'FROM                                                             '+
               '  disciplinas_mestre_ementas                                     '+
               'WHERE                                                            '+
               '	cd_disciplina_pai like '''+tblDiscCD_DISCIPLINA_PAI.AsString+'''';
               qryUpdateEmentas.ExecSQL;
               DBNavigator1.VisibleButtons := [nbPrior,nbNext];

               FreeAndNil(qryUpdateEmentas);
            end;

            tblDisc.Close;
            tblDisc.Open;
            tblDisc.Locate('codigo',iDisciplinaRet,[]);
            tblDisc.EnableControls;
         end;
      end;

      3 : begin
         {  xCodigo := tblGradeDisciplina.AsString;
            xAnoSemestre := tblGradeAnoSemestre.AsInteger;
            xTurno := tblGradeTurno.AsString;
            xSerie := tblGradeSerie.AsInteger;
            if tblGrade.State in [dsInsert, dsEdit] then tblGrade.Post;
            tblGrade.DisableControls;
            tblGrade.Close;
            tblGradeGroup.Close;
            tblGradeGroup.Open;
            tblGradeGroup.Locate('AnoSemestre;Curso;Turno;Serie', VarArrayOf([
            xAnoSemestre, xCurso, xTurno, xSerie]), [loPartialKey] );
            tblGrade.Open;
            //       tblGrade.Locate('Disciplina', xCodigo, [loPartialKey] );
            tblGrade.EnableControls;}

         naoAltera := false;

         Mensagem('Essa função foi desabilitada. Prossiga com essa ação pelo o gestão online.', Application.Title);
         Exit;

         if (edGradeCodigo.Text = '0') or (trim(edGradeCodigo.Text) = '') then
         begin
            Mensagem( 'O código da grade é inválido.', 'Aviso' );
            exit;
         end;

         if (edGradeCodigo.Text <> qyGradesCD_GRADE.AsString) and (dsGrades.State = dsEdit) then
         begin
            DM.CriarConsulta(qryAltera);
            DM.CriarConsulta(qryInsere);

            sList := TList.Create;

            tabelas[1].nome         := 'disciplinas_equiv_interna';
            tabelas[1].descricao    := '[Equivalência interna]';
            tabelas[1].campo_curso  := 'cd_curso';
            tabelas[1].campo_grade  := 'cd_grade';

            tabelas[2].nome         := 'disciplinas_prereq';
            tabelas[2].descricao    := '[Pré-requisitos]';
            tabelas[2].campo_curso  := 'cd_curso';
            tabelas[2].campo_grade  := 'cd_grade';

            tabelas[3].nome         := 'disciplinas_prereq_especial';
            tabelas[3].descricao    := '[Pré-requisitos Especiais]';
            tabelas[3].campo_curso  := 'cd_curso';
            tabelas[3].campo_grade  := 'cd_grade';

            tabelas[4].nome         := 'ge_cursos';
            tabelas[4].descricao    := '[Atividades Complementares]';
            tabelas[4].campo_curso  := 'cd_curso';
            tabelas[4].campo_grade  := 'cd_grade';

            tabelas[5].nome         := 'matriculas_curso';
            tabelas[5].descricao    := '[Matrículas no curso]';
            tabelas[5].campo_curso  := 'cd_curso';
            tabelas[5].campo_grade  := 'cd_grade';

            tabelas[6].nome         := 'turmas';
            tabelas[6].descricao    := '[Turmas]';
            tabelas[6].campo_curso  := 'curso';
            tabelas[6].campo_grade  := 'cd_grade';            

            sMensagem := '';   

            for i := 1 to 6 do
            begin
               qryAltera.SQL.Text :=
                  'SELECT count(*) AS qtd FROM '+
                  tabelas[i].nome+
                  ' WHERE '+
                  tabelas[i].campo_grade+
                  ' = '+
                  QuotedStr(qyGradesCD_GRADE.AsString)+' AND '+
                  tabelas[i].campo_curso+
                  '='+
                  QuotedStr(qyGradesCD_CURSO.AsString);
                  
               qryAltera.Open;

               if qryAltera.FieldByName('qtd').AsInteger > 0 then
               begin
                  sMensagem := sMensagem + #13 + tabelas[i].descricao;
                  naoAltera := true;
               end;
            end;
         end;

         if naoAltera and (edGradeCodigo.Text <> qyGradesCD_GRADE.AsString) then
         begin
            Mensagem( 'O código da grade não pode ser modificado devido a já estar relacionado as seguintes informações: '+sMensagem, 'Aviso' );
            exit;
         end
         else if (edGradeCodigo.Text <> qyGradesCD_GRADE.AsString) then
         begin
            qryAltera.Close;
            qryAltera.SQL.Text :=
               'UPDATE grades_disciplinas SET cd_grade = '+
               QuotedStr(edGradeCodigo.Text)+
               ' WHERE cd_grade = '+
               QuotedStr(qyGradesCD_GRADE.AsString)+
               ' and cd_curso = '+
               QuotedStr(qyGradesCD_CURSO.AsString);
            qryAltera.ExecSQL;
         end;

         DM.CriarConsulta(qyHasGradePadrao);
         qyHasGradePadrao.SQL.Text := SQL_HAS_GRADE_PADRAO;
         qyHasGradePadrao.ParamByName('CURSO').AsString        := edGradeCurso.Text;
         qyHasGradePadrao.ParamByName('GRADE_ATUAL').AsString  := edGradeCodigo.Text;
         qyHasGradePadrao.Open();

         if (qyHasGradePadrao.FieldByName('qtd_grade').AsInteger > 0)
            and (qyGrades.FieldByName('SN_PADRAO').AsInteger = 0) then
         begin
            if MessageDlg('Existe outra grade marcada como padrão para este curso. Deseja efetuar a troca?',
               mtConfirmation, [mbYes, mbNo], -1) = mrYes then
            begin
               DM.CriarConsulta(qyUpdateCurso);
               qyUpdateCurso.SQL.Text := SQL_UPATE_GRADE_PADRAO;
               qyUpdateCurso.ParamByName('CURSO').AsString := edGradeCurso.Text;
               qyUpdateCurso.ExecSQL();
            end
            else
            begin
               qyGrades.FieldByName('SN_PADRAO').AsInteger := 0;
            end;
         end;

         retorno := qyGradesCD_GRADE.AsString;

         // define qual a operação que está sendo executada
         if (qyGrades.State in [dsInsert]) then
            state := 'Inclusao'
         else
            state := 'Alteracao';

         qyGrades.Post;

         // Grava log das alterações realizadas na grade curricular
         chaveLog := qyGradesCD_GRADE.AsString +';'+ qyGradesCD_CURSO.AsString;
         // Cria a mensagem do LOG que contém as informações alteradas
         msgLog := 'Grade: '+ qyGrades.FieldByName('CD_GRADE').AsString +CHR(13)+
                   'Curso: '+ qyGrades.FieldByName('CD_CURSO').AsString +CHR(13)+
                   'Anosemestre Inicial: '+ qyGrades.FieldByName('NR_ANO_INICIAL').AsString +CHR(13)+
                   'Descrição: '+ qyGrades.FieldByName('DS_GRADE').AsString +CHR(13)+
                   'Ativo: '+ qyGrades.FieldByName('SN_ATIVO').AsString +CHR(13)+
                   'Grade Padrão: '+ qyGrades.FieldByName('SN_PADRAO').AsString +CHR(13)+
                   'C.H. Curso: '+ qyGrades.FieldByName('NR_CARGA_CURSO').AsString +CHR(13)+
                   'C.H. AC: '+ qyGrades.FieldByName('NR_CARGA_ATIVIDADES').AsString +CHR(13)+
                   'Percentual máximo de reprovação: ' + qyGrades.FieldByName('NR_PERC_MAX_REPROVACAO').AsString;

         // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
         DM.setLog( 1006, state, chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );
         qyGrades.Close;
         qyGrades.Open;
         qyGrades.Locate('CD_GRADE', retorno, []);
      end;

      4 : begin

         if (qDocumentosNecessarios.State = dsInsert) then
         begin
            DM.setLog(
               1020,
               '',
               qDocumentosNecessarios.FieldByName('codigo').AsString + ';' +
                  qDocumentosNecessarios.FieldByName('curso').AsString,
               0,
               'Documento inserido como documento necessário'
            );
         end;

         qDocumentosNecessarios.Post;
         qDocumentosNecessarios.ApplyUpdates;
         xCodigo := qDocumentosNecessarios.FieldByName('Cod_documento').AsString;
         qDocumentosNecessarios.DisableControls;
         qDocumentosNecessarios.Close;
         qDocumentosNecessarios.Open;
         qDocumentosNecessarios.Locate( 'Cod_Documento', xCodigo, [loPartialKey] );
         qDocumentosNecessarios.EnableControls;
      end;

   end;

end;

procedure TfrmCursos.CarregaComboAvaliacoes;
begin
   tblAvaliacoes_Parametros.Open();
   tblAvaliacoes_Parametros.First();

   cbAvaliacao.AddItem( '', TItemCombo.Create( '', '' ) );
   while not tblAvaliacoes_Parametros.Eof do
   begin
      cbAvaliacao.AddItem( tblAvaliacoes_Parametrosds_avaliacao.AsString, TItemCombo.Create(
         tblAvaliacoes_Parametroscd_avaliacao.AsString, tblAvaliacoes_Parametrosds_avaliacao.AsString
      ) );

      tblAvaliacoes_Parametros.Next;
   end;

   tblAvaliacoes_Parametros.First();   
end;

procedure TfrmCursos.CarregaComboGrau;
const
   SQL_COMBO_GRAU = 'SELECT * FROM situacoes WHERE cd_modulo = 1006';
var
   qySituacoesGrau : TUMZQuery;
begin
   DM.CriarConsulta(qySituacoesGrau);
   qySituacoesGrau.SQL.Text := SQL_COMBO_GRAU;

   qySituacoesGrau.Open();
   cbSituacoes.Clear();
   
   cbSituacoes.AddItem( '', TItemCombo.Create( '', '' ) );

   while not qySituacoesGrau.Eof do
   begin
      cbSituacoes.AddItem( qySituacoesGrau.FieldByName('me_descricao').AsString, TItemCombo.Create(
         qySituacoesGrau.FieldByName('cd_situacao').AsString, qySituacoesGrau.FieldByName('me_descricao').AsString
      ) );

      qySituacoesGrau.Next;
   end;
end;

procedure TfrmCursos.CarregaComboFrentes;
var
   descricao: string;
begin
   qyGradesDisciplinasFrentes.Close();
   
   qyGradesDisciplinasFrentes.ParamByName('CD_GRADE').AsInteger :=
      qyGradesDisciplinasCD_GRADE.AsInteger;
   qyGradesDisciplinasFrentes.ParamByName('NR_SERIE').AsInteger :=
      qyGradesDisciplinasNR_SERIE.AsInteger;
   qyGradesDisciplinasFrentes.ParamByName('CD_CURSO').AsString :=
      qyGradesDisciplinasCD_CURSO.AsString;

   qyGradesDisciplinasFrentes.Open();

   cbFrentes.Clear;
   cbFrentes.AddItem( '', TItemCombo.Create( '', '' ) );
   
   while not qyGradesDisciplinasFrentes.Eof do
   begin
      descricao := qyGradesDisciplinasFrentesSIGLA.AsString + ' - ' +
         qyGradesDisciplinasFrentesDESCRICAO.AsString;

      cbFrentes.AddItem( descricao, TItemCombo.Create(
         qyGradesDisciplinasFrentesCD_DISCIPLINA.AsString, descricao
      ) );

      qyGradesDisciplinasFrentes.Next;
   end;
end;

procedure TfrmCursos.btnMostrarGradeCursoClick(Sender: TObject);
begin
   mostraGrade(qyCursosColigadasCD_GRADE.AsInteger);
end;

procedure TfrmCursos.btnMostrarGradeTurmaClick(Sender: TObject);
begin
   mostraGrade(tblTurmasCD_GRADE.AsInteger);
end;

procedure TfrmCursos.btnMostrarParametroAvaliacaoClick(Sender: TObject);
begin
   mostraParametroAvaliacoes(tblAvaliacoes_Parametroscd_avaliacao.AsInteger);
end;

procedure TfrmCursos.btnPreRequisitoEspecialClick(Sender: TObject);
begin

end;

// apresenta as instituicoes que são convenio sn_convenio = 1
procedure TfrmCursos.TBConveniosIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npIncluir, True ) then Exit;

   qConvenios.SQL.Clear;
   qConvenios.SQL.add('select count(*) as total from instituicoes_ensino where sn_convenio=1');
   qConvenios.Open;

   if ( qConvenios.FieldByName('total').AsInteger = 0 ) then
   begin
      Mensagem('Não existem instituições habilitadas como convênios. Acesse Cadastros > Instituições de Ensino e informe quais convênios estão ativos.',  'Informação',  MB_OK + MB_ICONINFORMATION, Handle);
   end
   else
   begin

      if ( fListaConvenios = nil ) then
      begin
         Application.CreateForm( TfListaConvenios, fListaConvenios );
      end;

      // Isso vai indicar que está aberto a janela de Grade
      fListaConvenios.Tag := 2;
      fListaConvenios.BloquearConveniosTurma( tblTurmasAnoSemestre.AsInteger, tblTurmasCurso.AsString, tblTurmasCodigo.AsString );
      fListaConvenios.iniciaTree;
      fListaConvenios.Show;
      
   end;

end;

procedure TfrmCursos.btnRenomearTurmaClick(Sender: TObject);
begin
   Mensagem('Essa função foi desabilitada. Para renomear a turma utilize o gestão online.', Application.Title);

{
   if tblTurmas.State = dsEdit then
   begin
      tblTurmas.Post;
      tblTurmas.Edit;
      bTrocandoCodigo := true;
      ChangeClassCode;

      UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := True;
      UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clBlack;
   end;
}
end;

procedure TfrmCursos.btnRenomearCursoClick(Sender: TObject);
Var
  sNovoCodigo : String;
  flg : Boolean;
  qAltera, qTabelas, qCampos, qForeigns, qVerificaCodigoExistente: TUMZQuery;
  sCodigos, sAux : String;
  arrCodigos : TStringList;
begin
   inherited;

   // Campos que podem possuir código do curso
   sCodigos := ' cd_curso, codigocurso, cd_curso_equivalente, mec_cd_curso, curso, eq_curso, cd_curso_origem, ';
   sCodigos := sCodigos + 'cd_curso_destino, grupo_curso, filtro_curso, ds_curso, curso_inscricao';


   if qyCursosMestre.State = dsEdit then
   begin

      sNovoCodigo := qyCursosMestreCD_CURSO.AsString;

      flg := InputQueryWithMaxLength('UNIMESTRE', 'Digite o novo código do Curso: ', sNovoCodigo, 15);

      if not flg then
         Exit;

      DM.CriarConsulta(qVerificaCodigoExistente);

      qVerificaCodigoExistente.SQL.Text := 'SELECT count(*) AS qtd FROM cursos_mestre ';
      qVerificaCodigoExistente.SQL.Add(Format(' WHERE cd_curso LIKE %s ', [QuotedStr(sNovoCodigo)]));

      qVerificaCodigoExistente.Open;

      if qVerificaCodigoExistente.FieldByName('qtd').AsInteger > 0 then
      begin
         Mensagem('Já existe um curso com esse código. Não será possível realizar a alteração', 'Aviso', + MB_ICONWARNING, Handle);
         Exit;                                                                                  
      end;

      if (not flg) or (qyCursosMestreCD_CURSO.AsString = sNovoCodigo) then
      begin
         Exit;
      end;

      // Pede confirmação de alteração do código do curso
      if Mensagem('Tem certeza que deseja alterar o código do Curso:' + CHR(13) + '>> De: ' + qyCursosMestreCD_CURSO.AsString + '   Para: ' + sNovoCodigo + sAux,'Confirmação', + MB_YESNO + MB_ICONWARNING, Handle) <> mrYes  then
      begin
         Exit;
      end;

      DM.CriarConsulta(qAltera);
      DM.CriarConsulta(qTabelas);
      DM.CriarConsulta(qCampos);
      DM.CriarConsulta(qForeigns);

      qAltera.Close();

      qTabelas.ParamCheck := false;
      // qTabelas.UniDirectional := true;
      qCampos.ParamCheck := false;
      // qCampos.UniDirectional := false;

      { Continuar programação para MySQL e Oracle aqui - Oliver }
      if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
      begin
         {qTabelas.SQL.Text := ' SELECT LOWER(T.TABLE_NAME) AS TABLE_NAME ' +
                              ' FROM SYS.ALL_ALL_TABLES T ' +
	                           '      INNER JOIN CAT C ON (C.TABLE_NAME = T.TABLE_NAME) ' +
                              ' WHERE LOWER(T.OWNER) = LOWER('+QuotedStr(DM.db.User)+') AND ' +
                              '       LOWER(C.TABLE_TYPE) = LOWER(' + QuotedStr('table') + ')';}
         qTabelas.SQL.Clear();
         qTabelas.SQL.Add(' SELECT ');
         qTabelas.SQL.Add('    LOWER(T.TABLE_NAME) AS TABLE_NAME, ');
         qTabelas.SQL.Add('    LOWER(C.COLUMN_NAME) AS COLUMN_NAME ');
         qTabelas.SQL.Add(' FROM SYS.ALL_ALL_TABLES T ');
         qTabelas.SQL.Add('      INNER JOIN CAT CA ON (CA.TABLE_NAME = T.TABLE_NAME) ');
         qTabelas.SQL.Add('      INNER JOIN SYS.ALL_TAB_COLUMNS C ON (C.OWNER = T.OWNER AND C.TABLE_NAME = T.TABLE_NAME) ');
         qTabelas.SQL.Add(' WHERE LOWER(T.OWNER) = LOWER(' + QuotedStr(DM.db.User) + ') AND ');
         qTabelas.SQL.Add('       LOWER(CA.TABLE_TYPE) = LOWER(' + QuotedStr('table') + ') AND ');
         qTabelas.SQL.Add('       instr( LOWER(' + QuotedStr(sCodigos) + '), LOWER(C.COLUMN_NAME) ) > 0 ');

         qTabelas.Open();

         qForeigns.Close();
         qForeigns.SQL.Text := ' SELECT C.CONSTRAINT_NAME, C.TABLE_NAME ' +
                               ' FROM SYS.ALL_CONSTRAINTS C ' +
                               ' WHERE LOWER(C.OWNER) = LOWER(' + QuotedStr(DM.db.User) + ') AND ' +
                               '       LOWER(C.CONSTRAINT_TYPE) = LOWER(' + QuotedStr('R') + ') AND ' +
                               '       LOWER(C.STATUS) = LOWER(' + QuotedStr('ENABLED') + ') ';
         qForeigns.Open();

         try
            qForeigns.First();
            while not qForeigns.Eof do
            begin
               qAltera.SQL.Text := 'ALTER TABLE ' + qForeigns.FieldByName('TABLE_NAME').AsString + ' DISABLE CONSTRAINT ' + qForeigns.FieldByName('CONSTRAINT_NAME').AsString;
               qAltera.ExecSQL();

               qForeigns.Next();
            end;            
         except
            Mensagem('Não foi possível desabilitar a checagem de ligações das tabela.', Application.Title, MB_OK + MB_ICONERROR, Handle);
         end;

         { Percorre todas as tabelas para verificar as colunas }
         while not qTabelas.Eof do
         begin
            if (qTabelas.FieldByName('TABLE_NAME').AsString = 'atualizacoes') AND
               (qTabelas.FieldByName('TABLE_NAME').AsString = 'bancos') then
            begin
               qTabelas.Next();
               Continue;
            end;

            { Atualiza campos }
            if (qTabelas.FieldByName('COLUMN_NAME').AsString = 'codigo') AND (qTabelas.FieldByName('TABLE_NAME').AsString = 'turmas') then
            begin
               qTabelas.Next();
               Continue;
            end;

            // Campo é um campo de código de curso?
            if Pos(qTabelas.FieldByName('COLUMN_NAME').AsString, sCodigos) > 0 then
            begin
               try
                  qAltera.SQL.Text := ' UPDATE ' + qTabelas.FieldByName('TABLE_NAME').AsString +
                                      ' SET ' + qTabelas.FieldByName('COLUMN_NAME').AsString + '  = trim(' + QuotedStr(sNovoCodigo) + ')' +
                                      ' WHERE ' + qTabelas.FieldByName('COLUMN_NAME').AsString + ' = ' + QuotedStr(qyCursosMestreCD_CURSO.AsString);
                  qAltera.ExecSQL();
               except
                  Mensagem('Não foi possível atualizar a tabela ' + qTabelas.FieldByName('TABLE_NAME').AsString, Application.Title, MB_OK + MB_ICONERROR, Handle);
               end;
            end;
            { Atualiza campos }

            qTabelas.Next();
         end;

         try
            qForeigns.First();
            while not qForeigns.Eof do
            begin
               qAltera.SQL.Text := 'ALTER TABLE ' + qForeigns.FieldByName('TABLE_NAME').AsString + ' ENABLE CONSTRAINT ' + qForeigns.FieldByName('CONSTRAINT_NAME').AsString;
               qAltera.ExecSQL();

               qForeigns.Next();
            end;            
         except
            Mensagem('Não foi possível desabilitar a checagem de ligações das tabela.', Application.Title, MB_OK + MB_ICONERROR, Handle);
         end;
      end
      else if (DM.db.Protocol = DB_PROTOCOL_MYSQL) then
      begin

         qTabelas.SQL.Text := 'SHOW TABLE STATUS FROM ' + DM.db.Database;
         qTabelas.Open();

         try
            qAltera.SQL.Text := 'SET FOREIGN_KEY_CHECKS=0';
            qAltera.ExecSQL();
         except
            Mensagem('Não foi possível desabilitar a checagem de ligações das tabela.', Application.Title, MB_OK + MB_ICONERROR, Handle);
         end;


         // Campos que podem possuir código do curso
         arrCodigos := TStringList.create();
         arrCodigos.Add( 'cd_curso' );
         arrCodigos.Add( 'codigocurso' );
         arrCodigos.Add( 'cd_curso_equivalente' );
         arrCodigos.Add( 'mec_cd_curso' );
         arrCodigos.Add( 'curso' );
         arrCodigos.Add( 'eq_curso' );
         arrCodigos.Add( 'cd_curso_origem' );
         arrCodigos.Add( 'cd_curso_destino' );
         arrCodigos.Add( 'grupo_curso' );
         arrCodigos.Add( 'filtro_curso' );
         arrCodigos.Add( 'curso_inscricao' );
         // retirado da verificação arrCodigos.Add( 'cd_matricula_curso' );

         { Percorre todas as tabelas para verificar as colunas }
         while not qTabelas.Eof do
         begin

            { Verifica se a coluna Engine é nula, se for nula significa que possivelmente é uma VIEW,
               então passamos para o próximo registro }
            if ((qTabelas.FieldByName('Engine').IsNull) OR (trim(qTabelas.FieldByName('Engine').AsString) = '')) OR
               ((qTabelas.FieldByName('Name').AsString = 'atualizacoes') OR
               (qTabelas.FieldByName('Name').AsString = 'bancos') OR
               (qTabelas.FieldByName('Name').AsString = 'cursos') OR
               (qTabelas.FieldByName('Name').AsString = 'gradecurricular')) then
            begin
               qTabelas.Next;
               Continue;
            end;

            { Recupera todas as colunas de determinada tabela que está percorrendo no while acima }
            qCampos.Close();
            qCampos.SQL.Text := 'SHOW FIELDS FROM ' + qTabelas.FieldByName('Name').AsString;
            qCampos.Open();

            // Colocamos o ponteiro das colunas novamente em primeiro, para agora verificar os cursos
            qCampos.First();
            
            while not qCampos.Eof do
            begin
               if (qCampos.FieldByName('Field').AsString ='codigo') and (qTabelas.FieldByName('Name').AsString = 'turmas') then
               begin
                  qCampos.Next();
                  continue;
               end;

               // Campo é um campo de código de curso?
               if arrCodigos.IndexOf(  qCampos.FieldByName('Field').AsString ) > -1 then
               begin

                  if ( qCampos.FieldByName('Field').AsString = 'cd_matricula_curso' ) then
                  begin
                     Mensagem('a tabela tem cd_matricula_curso'  + qTabelas.FieldByName('Name').AsString, Application.Title, MB_OK + MB_ICONERROR, Handle);
                  end;
                  

                  try
                     qAltera.SQL.Text := ' UPDATE ' + qTabelas.FieldByName('Name').AsString +
                                         ' SET ' + qCampos.FieldByName('Field').AsString + '  = trim("' + sNovoCodigo + '")'+
                                         ' WHERE ' + qCampos.FieldByName('Field').AsString + ' = "' + qyCursosMestreCD_CURSO.AsString +'"';
                     qAltera.ExecSQL();
                  except
                     Mensagem('Não foi possível atualizar a tabela ' + qTabelas.Fields[0].AsString, Application.Title, MB_OK + MB_ICONERROR, Handle);
                  end;
               end;
               qCampos.Next();
            end;

            qTabelas.Next();

         end;


         FreeAndNil( arrCodigos );

         try
            qAltera.SQL.Text := 'SET FOREIGN_KEY_CHECKS=1';
            qAltera.ExecSQL();
         except
            Mensagem('Não foi possível desabilitar a checagem de ligações das tabela.', Application.Title, MB_OK + MB_ICONERROR, Handle);
         end;
         
      end;

      // Forçar a criação das disciplinas para esse novo curso.

      {if not bTodosAnosem then
      begin
         qAltera.Close();
         qAltera.SQL.Text :=
         ' INSERT IGNORE INTO disciplinas (codigo, ordem, curso , sigla, descricao, qtd_frases_fixas, cd_disc_mec ) ' +
         ' select codigo, ordem, "' + sNovoCodigo + '", sigla, descricao, qtd_frases_fixas, cd_disc_mec '+
         '   from disciplinas WHERE curso = "' + qyCursosMestreCD_CURSO.AsString + '" ';
         qAltera.ExecSQL;
      end;}

      if (qyColigadacd_coligada.AsInteger >0) then
      begin
         DM.setLog(1006, 'Alteracao', sNovoCodigo, qyColigadacd_coligada.AsInteger, 'Mudança de Código de Curso: De: ' + qyCursosMestreCD_CURSO.AsString + ' Para: ' + sNovoCodigo+sAux);
      end
      else
      begin
         DM.setLog(1006, 'Alteracao', sNovoCodigo, DM.GetUsuarioLogado.GetColigadaLogada.Codigo, 'Mudança de Código de Curso: De: ' + qyCursosMestreCD_CURSO.AsString + ' Para: ' + sNovoCodigo+sAux);
      end;


      qyCursosMestre.Close();
      qyCursosMestre.Open;
      qyCursosMestre.Locate('CD_CURSO',sNovoCodigo,[]);

      Mensagem('Código alterado com sucesso!', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION, Handle);
   end;
end;

procedure TfrmCursos.btnExcluirClick(Sender: TObject);
var
   bApagar  : Boolean;
   qyApagar, qyVerificaCurso : TUMZQuery;
   Statement: IZPreparedStatement;
begin

   // Delete Grade
   if pcGeral.ActivePage = tsGrade then
   begin
      Mensagem('Essa função foi desabilitada. Prossiga com essa ação pelo o gestão online.', Application.Title);
      Exit;

      excluirGradeCurricular();
      Exit;
   end;

   {Emite um alerta caso o usuário tente excluir um curso
   que já possui uma turma vinculada.}
   if (TTabSheet(pcGeral.ActivePage).PageIndex = 0) then
   begin
      DM.CriarConsulta(qyVerificaCurso);
      qyVerificaCurso.SQL.Text := ''+
      ' SELECT count(codigo) as qtd_turmas ' +
      ' FROM turmas t                      ' +
      ' WHERE curso = :cd_curso            ';

      qyVerificaCurso.ParamByName('cd_curso').AsString :=
         qyCursosMestre.FieldByName('cd_curso').AsString;

      qyVerificaCurso.Open;

      if (qyVerificaCurso.FieldByName('qtd_turmas').asInteger > 0) then
      begin
         Mensagem('Não é possível realizar a exclusão deste curso pois o mesmo possui vínculo com turmas. Para desabilitar o uso deste curso em sua instituição, inative-o ou desvincule-o de sua unidade de ensino.','Alerta',MB_OK + MB_ICONEXCLAMATION);
         exit;
      end;

   end;

   if Mensagem('Deseja excluir este registro?',Application.Title,
      MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then
   begin
      case TTabSheet(pcGeral.ActivePage).PageIndex of
         // Delete Cursos
         0 : begin
            if NOT(DM.UsuarioLogado.TemPermissao( 1006, npExcluir, True )) OR
               TChecarUsoColigada.Create( TCursoMestre.Create( qyCursosMestreCD_CURSO.AsString ) ).NaoPossuiPermissao() then
            begin
               Exit;
            end;

            qyCursosMestre.Delete;
         end;

         // Delete Turmas
         1 : begin
            if not verificaPodeExcluirTurma(tblTurmasAnoSemestre.AsInteger, tblTurmasCodigo.AsString) then
               exit;

            if not DM.UsuarioLogado.TemPermissao( 1148, npExcluir, True ) then Exit;
            
            // Deleta os horários da turma
            Statement := PrepareStatement('DELETE FROM turmas_horarios_config WHERE cd_turma = ? AND nr_anosemestre = ?');
            Statement.SetString(1, tblTurmasCodigo.AsString);
            Statement.SetInt(2, tblTurmasAnoSemestre.AsInteger);
            Statement.ExecutePrepared;
            
            // Deleta as optativas da turma
            Statement := PrepareStatement('DELETE FROM TURMAS_DISCIPLINAS_OPTATIVAS WHERE CD_TURMA = ? AND NR_ANOSEMESTRE = ?');
            Statement.SetString(1, tblTurmasCodigo.AsString);
            Statement.SetInt(2, tblTurmasAnoSemestre.AsInteger);
            Statement.ExecutePrepared;

            // Deleta os planos de pagamento vinculados a turma
            Statement := PrepareStatement(
              ' DELETE FROM	fin_planos_turmas  ' +
              ' WHERE cd_turma = ? ' +
              ' AND cd_plano IN ( SELECT f1.cd_plano FROM	fin_planos f1	WHERE	f1.cd_plano = cd_plano AND f1.nr_anosemestre = ? )');
            Statement.SetString(1, tblTurmasCodigo.AsString);
            Statement.SetInt(2, tblTurmasAnoSemestre.AsInteger);
            Statement.ExecutePrepared;

            desativaCentro(tblTurmasCD_CENTRO.AsInteger);

            // Deleta a turma
            tblTurmas.Delete;
         end;

         // Delete Disciplinas
         2 : begin
            if not DM.UsuarioLogado.TemPermissao( 1112, npExcluir, True ) then
              Exit;

            if (not verificarDiplomaCurriculoDigitalDisciplina(tblDisc.FieldByName('id_disciplina').AsInteger)) then
              Exit;

            // Verifica se disciplina está alocada para algum Professor ou Aluno
            if(DM.disciplinaAlocada(tblDisc.FieldByName('codigo').AsInteger, tblDisc.FieldByName('curso').AsString) = true) then
            begin
               bApagar := Mensagem('Existem alunos vinculados a essa disciplina. Aconselhamos a exclusão destas matrículas antes da exclusão deste registro. Você tem certeza que deseja excluir essa disciplina?','Confirmação', + MB_YESNO, Handle) = mrYes;

               if not bApagar then
               begin
                  exit;
               end;
            end;

            // Verifica se a disciplina Faz frente para alguma outra discilina
            if (DM.isDisciplinaFazFrente(tblDisc.FieldByName('codigo').AsInteger, tblDisc.FieldByName('curso').AsString) = true) then
            begin
               bApagar := Mensagem('Essa disciplina "Faz Frente" a outras disciplinas de mesma etapa na grade curricular, ao apagar essa disciplinas o vínculo de disciplina frente será perdido. Você tem certeza que deseja excluir essa disciplina?','Confirmação', + MB_YESNO, Handle) = mrYes;
               if not bApagar then
               begin
                  exit;
               end else begin
                  // Remover o vinculo da disciplina frente na grade curricular
                  DM.removerDisciplinaFrente(tblDisc.FieldByName('codigo').AsInteger, tblDisc.FieldByName('curso').AsString);
               end;                 
            end;

            //Alterado para ao invés de excluir alterar ele para desativalo
            tblDisc.Edit;
            tblDiscsn_ativo.AsInteger := 0;
            tblDisc.Post;
            tblDisc.Refresh;
         end;

         // Delete Documentos Necessários
         4 : begin
            if not DM.UsuarioLogado.TemPermissao( 1150, npExcluir, True ) then Exit;

            DM.CriarConsulta(qyApagar);
            qyApagar.SQL.Text := 'DELETE FROM documentos_necessarios WHERE cod_documento = :documento AND curso = :curso';
            qyApagar.ParamByName('documento').AsInteger := qDocumentosNecessariosCod_Documento.AsInteger;
            qyApagar.ParamByName('curso').AsString := qyCursosMestreCD_CURSO.AsString;
            qyApagar.ExecSQL();

            if (qyColigadacd_coligada.AsInteger >0) then
            begin
               DM.setLog(1006, 'Exclusao', qyCursosMestreCD_CURSO.AsString + ';' + qDocumentosNecessariosCod_Documento.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, qDocumentosNecessariosDocumento.AsString);
            end
            else
            begin
               DM.setLog(1006, 'Exclusao', qyCursosMestreCD_CURSO.AsString + ';' + qDocumentosNecessariosCod_Documento.AsString, DM.GetUsuarioLogado.GetColigadaLogada.Codigo, qDocumentosNecessariosDocumento.AsString);
            end;

            FreeAndNil(qyApagar);

            qDocumentosNecessarios.Refresh();
         end;
      end;
   end;
end;

procedure TfrmCursos.btnCancelarClick(Sender: TObject);
begin
  case TTabSheet(pcGeral.ActivePage).PageIndex of
    0 : begin
      qyCursosMestre.Cancel;
      dbeCcodigo.Enabled := false;
    end;
    1 : begin
      // Habilita o Filtro de ano semestre
      UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Enabled := True;
      UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.Font.Color := clBlack;
      
      grdTurmas.Enabled:=true;
      tblTurmas.Cancel;
    end;
    3 : begin
       qyGrades.Cancel;
       pcGeralChange( nil );
    end;
    2 : Begin
          tblEmentas.Cancel;
	  tblDisc.Cancel;
        End;
    4 : Begin
         qDocumentosNecessarios.Cancel;
    End
  end;
end;

procedure TfrmCursos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCursos.btnCopiarTurmaClick(Sender: TObject);
var
   coligadas: String;
begin
   if ( fCopiaTurma = nil ) then
   begin
      Application.CreateForm(TfCopiaTurma, fCopiaTurma);
   end;

   if (qyColigada.RecordCount > 1) then
      fCopiaTurma.pnTop.Height := 49
   else
   begin
      fCopiaTurma.pnTop.Height := 0;

      fCopiaTurma.rgCopiarMaisUnidades.ItemIndex := 1;
      fCopiaTurma.CopiarMaisColigadas := False;
   end;

   tblTurmas.DisableControls;
   tblTurmas.First;
   while not tblTurmas.Eof do
   begin
      coligadas := coligadas + tblTurmascd_coligada.AsString;

      tblTurmas.Next;

      if not tblTurmas.Eof then
         coligadas := coligadas + ', ';
   end;
   tblTurmas.EnableControls;

   if (DM.UsaAnosemestre) then
   begin
      fCopiaTurma.carregarTela(
         qyColigadacd_coligada.AsInteger,
         tblTurmascd_coligada.AsInteger,
         coligadas,
         tblTurmasCurso.AsString,
         UMFiltroDataAnoSem.getAnosemestre(),
         tblTurmasDataInicio.AsDateTime,
         tblTurmasDataFim.AsDateTime
      );
   end
   else
   begin
      fCopiaTurma.carregarTela(
         qyColigadacd_coligada.AsInteger,
         tblTurmascd_coligada.AsInteger,
         coligadas,
         tblTurmasCurso.AsString,
         ANOSEMESTRE_PADRAO,
         tblTurmasDataInicio.AsDateTime,
         tblTurmasDataFim.AsDateTime
      );
   end;

   FreeAndNil(fCopiaTurma);

   tblTurmas.Refresh();
end;

procedure TfrmCursos.btnDataLimiteMatriculaClick(Sender: TObject);
var
  flag: boolean;
  sem_limite : boolean;
  data_limite : TDateTime;
begin
  sem_limite := qyGradesDisciplinas.FieldByName('dt_limite').Isnull;

  if sem_limite then
  begin
     data_limite := now();
  end
  else
  begin
    data_limite := qyGradesDisciplinas.FieldByName('dt_limite').AsDateTime;
  end;
  
  flag := InputQueryDateTime(Application.Title, 
          'Informe a data limite para aceitar matrículas na Disciplina:', 
          'Sem limite', 
          data_limite, 
          sem_limite, 
          BloquearCampoDataLimite);

  qyGradesDisciplinas.edit;
  if (sem_limite) then
  begin
    qyGradesDisciplinas.FieldByName('dt_limite').clear;
  end
  else
  begin
    qyGradesDisciplinas.FieldByName('dt_limite').AsDateTime := data_limite;
  end;
  qyGradesDisciplinas.Post;
  qyGradesDisciplinas.Refresh;
end;

procedure TfrmCursos.tblTurmasBeforePost(DataSet: TDataSet);
var
   lsMensagem :String;
   sala, salaAntiga : TSala;
begin
   // Assinala que o usuário não está trocando o código da grade da turma (de inicio)
   bTrocandoGrade := False;

   { Verifica se está ocorrendo a troca de grade da turma e é permitada (atende os requisitos),
     nesse caso marca como true a variável acima "bTrocandoGrade" }

   if (tblTurmas.State = dsEdit) and
      (VarToStr(tblTurmasCD_GRADE.OldValue) <> tblTurmas.FieldByName('CD_GRADE').AsString) and
      (not permiteTrocarGradeTurma()) then
   begin
      Abort;
   end;

   salaAntiga := nil;

   {Consistencia dos campos antes de gravar}

   lsMensagem := '';

   if not bTrocandoCodigo then
   begin
   
      if (tblTurmas.FieldByName('AnoSemestre').AsInteger = 0) then
      begin
         lsMensagem := 'O Ano/Semestre não deve ser nulo...';
         UMFiltroDataAnoSem.FiltroAnosemestreMaskEdit.SetFocus;
      end
      else if tblTurmas.FieldByName('Codigo').AsString = '' then
      begin
         lsMensagem := 'A Turma não deve ser nula...';
         dbeTurma.SetFocus;
      end
      else if ( tblTurmassn_cronograma_geren_inicio_fim.AsInteger = 0 ) AND
              ( tblTurmas.FieldByName('DataInicio').AsDateTime = 0 ) then
      begin
         lsMensagem := 'A data inicial não deve ser nula.';
         pgTurmas.TabIndex := 1;
         dbeDatainicio.SetFocus;
      end
      else if ( tblTurmassn_cronograma_geren_inicio_fim.AsInteger = 0 ) AND
              ( tblTurmas.FieldByName('DataFim').AsDateTime = 0 ) then
      begin
         lsMensagem := 'A data final não deve ser nula.';
         pgTurmas.TabIndex := 1;
         dbeDataFim.SetFocus;
      end
      else if ( tblTurmassn_cronograma_geren_inicio_fim.AsInteger = 0 ) AND
              ( tblTurmas.FieldByName('DataFim').AsDateTime < tblTurmas.FieldByName('DataInicio').AsDateTime ) then
      begin
         lsMensagem := 'A data final não pode ser menor que a data inicial.';
         pgTurmas.TabIndex := 1;
         dbeDataFim.SetFocus;
      end
      else if tblTurmas.FieldByName('dt_fim_monografia').AsDateTime < tblTurmas.FieldByName('dt_inicio_monografia').AsDateTime then
      begin
         lsMensagem := 'A data final da monografia não pode ser menor que a data inicial.';
         pgTurmas.TabIndex := 1;
         dbedt_fim_monografia.SetFocus;
      end;

   end;

   bTrocandoCodigo := false;

   {Se alguma mensagem de erro ocorrer o procedimento é abortado}
   if lsMensagem <> '' then
   begin
      Mensagem(lsMensagem, Application.Title, MB_OK + MB_ICONSTOP, Handle);
      Abort;
   end;
   tblTurmasGrau.AsInteger := qyCursosMestreNR_GRAU.AsInteger;

   if qyColigadacd_coligada.AsInteger >= 1 then
      tblTurmascd_coligada.AsInteger := qyColigadacd_coligada.AsInteger;
   if (tblTurmas.State = dsEdit) then
   begin
      try
         if ((tblTurmascd_sala.AsInteger <> tblTurmascd_sala.OldValue) and (tblTurmascd_sala.OldValue <> null)) then
         begin
            salaAntiga := TSala.Create(tblTurmascd_sala.OldValue, '');

            if tblTurmascd_sala.AsInteger > 0 then
            begin
               try
                  sala := TSala.Create(tblTurmascd_sala.AsInteger);
                  sala.CorrigirSalasPadroes(salaAntiga,
                     TTurma.Create(tblTurmasCodigo.AsString, tblTurmasAnoSemestre.AsInteger));
               except
               end;
            end;
         end;
      except
      end;
   end;
end;

function TfrmCursos.permiteTrocarGradeTurma(): Boolean;
const
   // SQL Verifica quais alunos estão matriculados em quais disciplinas que não estão na grade nova
   SQL_VERIFICA_MATRICULAS = 'SELECT '+
                             '  CONCAT(p.cd_pessoa, "-", p.nm_pessoa) ds_pessoa, '+
                             '  CONCAT(d.codigo, "-", d.descricao) ds_disciplina '+
                             'FROM '+
                             '   fichaindividual fi '+
                             ' INNER JOIN pessoas p ON (p.cd_pessoa = fi.codigoaluno) '+
                             ' INNER JOIN disciplinas d ON (d.codigo = fi.disciplina AND d.curso = fi.curso) '+
                             ' LEFT JOIN grades_disciplinas gd	ON ( '+
                             '       gd.cd_disciplina = fi.disciplina AND '+
                             '       gd.nr_serie = fi.serie AND '+
                             '       gd.cd_curso = :cd_curso AND '+
                             '       gd.cd_grade = :cd_grade_nova '+
                             ' ) '+
                             'WHERE '+
                             '   fi.anosemestre = :nr_anosemestre AND '+
                             '   fi.turma LIKE :cd_turma AND '+
                             '   gd.cd_disciplina IS NULL '+
                             'GROUP BY fi.disciplina, fi.codigoaluno '+
                             'ORDER BY d.codigo, p.nm_pessoa ';
var
   qyVerificarMatriculas: TUMZQuery;
   msgLog: String;
   frmMensagem : TfrmMensagem;
   parametros: TParamsIni;
   discipinaAnterior,mensagemConteudo,disciplina : String;
begin
   DM.CriarConsulta(qyVerificarMatriculas);

   // Assinala que o usuário esta trocando o código da grade da turma
   bTrocandoGrade := True;

   { 1) Ao tentar alterar a grade de uma turma, no cadastro de turma, deveremos fazer uma checagem se
     existem alunos matrículados nas disciplinas da turma considerando a totalidades de disciplinas da grade antiga:
      - Se tiver alunos matriculados, verificar se todas as disciplinas matrículadas estão sendo oferecidas na nova grade também.
      - Se não tiver, não pode deixar alterar a grade. Avisar que tem alunos matriculados em disciplinas que não estão sendo ofertadas na grade nova. }

   qyVerificarMatriculas.SQL.Text := SQL_VERIFICA_MATRICULAS;
   qyVerificarMatriculas.Close;
   qyVerificarMatriculas.ParamByName('cd_curso').AsString := tblTurmas.FieldByName('Curso').AsString;
   qyVerificarMatriculas.ParamByName('cd_grade_nova').AsInteger := tblTurmas.FieldByName('CD_GRADE').AsInteger;
   qyVerificarMatriculas.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('AnoSemestre').AsInteger;
   qyVerificarMatriculas.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('Codigo').AsString;
   qyVerificarMatriculas.Open;

   if qyVerificarMatriculas.RecordCount > 0 then
   begin

      discipinaAnterior := '';
      mensagemConteudo := '';
      while not qyVerificarMatriculas.Eof  do
      begin
         disciplina := qyVerificarMatriculas.FieldByName('ds_disciplina').AsString;
         if(disciplina <> discipinaAnterior) then
         begin
            if(discipinaAnterior <> '') then
            begin
               mensagemConteudo := mensagemConteudo + #13;
            end;
            discipinaAnterior := disciplina;
            mensagemConteudo := mensagemConteudo + 'Disciplina: ' + disciplina + #13 + 'Alunos:' +  #13;
         end;

         mensagemConteudo := mensagemConteudo + qyVerificarMatriculas.FieldByName('ds_pessoa').AsString + #13;
         qyVerificarMatriculas.Next;
      end;
      

      parametros.snErroBanco := false;
      parametros.titulo := 'Aviso';
      parametros.opcoes := (BT_OK + ICO_WARNING);
      parametros.mensagens.msgPrincipal := mensagemConteudo;
      parametros.mensagens.msgTopo := 'Não é possível trocar a grade curricular da turma.'+#13
         +'Existem alunos matriculados nessa turma em disciplinas que não estão sendo oferecidas '+#13
         +'na mesma série na grade curricular selecionada.';
      parametros.dimensao.altura := 450;
      parametros.dimensao.largura := 600;

      frmMensagem := TfrmMensagem.create(nil, parametros);
      frmMensagem.ShowModal;


      Result := False;
      Exit;
   end;

   msgLog := 'Troca do código da grade realizada realizada pelo usuário.'+#13;
   msgLog := msgLog + 'Grade antiga: '+VarToStr(tblTurmas.FieldByName('CD_GRADE').OldValue)+#13;
   msgLog := msgLog + 'Grade Nova: '+tblTurmas.FieldByName('CD_GRADE').AsString;

   { 2) Verificar também se tiveram disciplinas com alterações de créditos financeiros, em relação a grade antiga e nova.
     Se teve, verificar se tem alunos matriculas nessa disciplina que mudou os créditos financeiros, cuja parcela tenha sn_credito_parcela = S.
      - Se tiver, mandar mensagem informando que será recalculado o financeiro dos alunos, e solicitar confirmação.
      - Se o cliente confirmar, então, ALTERAR A GRADE, e depois EXECUTAR o Dm.recalcular_creditos_financeiros.
      - Se o cliente não confirma, então NÃO MUDA A GRADE. }
   qyVerificarFinanceiro.Close;
   qyVerificarFinanceiro.ParamByName('cd_grade_nova').AsInteger := tblTurmas.FieldByName('CD_GRADE').AsInteger;
   qyVerificarFinanceiro.ParamByName('cd_grade_antiga').AsInteger := StrToInt(VarToStr(tblTurmas.FieldByName('CD_GRADE').OldValue));
   qyVerificarFinanceiro.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('AnoSemestre').AsInteger;
   qyVerificarFinanceiro.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('Codigo').AsString;
   qyVerificarFinanceiro.Open;

   if not qyVerificarFinanceiro.Eof then
   begin
      // Apresenta mensagem dizendo que existe diferença nos créditos financeiro e solicitando o recálculo dos alunos para usuario confirmar
      if Mensagem('Existem alunos matriculados em disciplinas que o número de créditos financeiros da grade curricular nova é diferente da grade curricular antiga. '+#13+
                  'Para prosseguir é necessário ajustar os créditos desses alunos, deseja ajustar os créditos dos alunos envolvidos?', 'Confirmação', MB_YESNO, Handle) <> mrYes then
      begin
         // Se NÃO então deve dar um Result := False e Exit para sair da funcao
         Result := False;
         Exit;
      end;

      // Se confirmou apenas deixar prosseguir para o Result True
      msgLog := msgLog + #13 + 'Havia diferenças de créditos financeiros entre as grades, para continuar era necessario recalcular os créditos financeiros dos alunos que estavam matriculados nesses disciplinas, o usuário confirmou essa ação.';
   end;

   // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
   DM.setLog( 1006, 'Alteracao', tblTurmasCodigo.AsString + ';' + tblTurmasAnoSemestre.AsString, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

   Result := True;
end;


procedure TfrmCursos.dtcTurmasDataChange(Sender: TObject; Field: TField);
var
   I, IEtapaAtual, GuardaAnoSemestre: Integer;
   qryBuscaResponsavel : TUMZQuery;
begin

   if tblTurmas.State = dsInsert then
      atualizaDepartamento();

   if tblTurmas.State <> dsBrowse then
       exit;

   dbeDatainicio.Enabled := not dbchDataInicioFimCronograma.Checked;
   dbeDataFim.Enabled := not dbchDataInicioFimCronograma.Checked;

   dbckbSN_ATIVA.Enabled := True;
   { Verifica se turma esta inativa }   
   if tblTurmascd_situacao.AsInteger in [2,3] then
   begin
      // Desabilita a check de turma ativa
      dbckbSN_ATIVA.Enabled := False;
   end;

   { Combo Nr. Etapa }
   cbNrEtapas.Items.Clear;
   IEtapaAtual := -1;

   if tblTurmasSerie.AsInteger = -100 then
   begin
      IEtapaAtual := cbNrEtapas.Items.Add('Optativa');
   end else begin
      cbNrEtapas.Items.Add('Optativa');
   end;

   for I := 1 to qyCursosColigadasNR_SERIES.AsInteger do
   begin
      if tblTurmasSerie.AsInteger = I then
         IEtapaAtual := cbNrEtapas.Items.Add(IntToStr(I))
      else
         cbNrEtapas.Items.Add(IntToStr(I));
   end;

   atualizaCheck;

   cbNrEtapas.ItemIndex := IEtapaAtual;

   cbNrEtapas.Enabled := false;
   { Combo Nr. Etapa }

   qyGetDepto.Close();
   qyGetDepto.ParamByName('CURSO').AsString:= tblTurmasCurso.AsString;
   qyGetDepto.ParamByName('COLIGADA').AsInteger:= tblTurmascd_coligada.AsInteger;
   qyGetDepto.Open();

   qTurmasConvenios.Close;
   qTurmasConvenios.ParamByName('turma').AsString := tblTurmas.FieldByName('codigo').AsString;
   qTurmasConvenios.ParamByName('anosemestre').AsString := tblTurmas.FieldByName('anosemestre').AsString;
   qTurmasConvenios.ParamByName('curso').AsString := tblTurmas.FieldByName('curso').AsString;
   qTurmasConvenios.Open;

   // Apresenta ou Esconde a guia de disciplinas optativas
   if tblTurmasSerie.AsInteger = -100 then
   begin
      // Se a turma for da série -100 a guia nao precisa ser mostrada
      Optativas.TabVisible := False;
   end else begin
      // Se a turma for de qualquer outra sério exibe a guia de optativas
      Optativas.TabVisible := True;

      // Busca as disciplinas optativas para serem exibidas
      qTurmasDisciplinasOptativas.Close;
      qTurmasDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('anosemestre').AsInteger;
      qTurmasDisciplinasOptativas.ParamByName('cd_curso').AsString := tblTurmas.FieldByName('curso').AsString;
      qTurmasDisciplinasOptativas.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('codigo').AsString;
      qTurmasDisciplinasOptativas.Open;
   end;

   qyListaProximaTurma.Close();
   qyListaProximaTurmaRepr.Close();
   qyListaProximaTurma.ParamByName('curso').AsString       := tblTurmas.FieldByName('curso').AsString;
   qyListaProximaTurmaRepr.ParamByName('curso').AsString       := tblTurmas.FieldByName('curso').AsString;
   // qyListaProximaTurma.ParamByName('cd_coligada').AsString := tblTurmas.FieldByName('cd_coligada').AsString;

   if tblTurmassn_matricula_mesmo_anosem.AsInteger = 1 then
   begin
      qyListaProximaTurma.ParamByName('nr_anosemestre').AsString := tblTurmasAnoSemestre.AsString;
      qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsString := tblTurmasAnoSemestre.AsString;
   end else begin
      if ( trim(tblTurmas.FieldByName('anosemestre').AsString) <> '' ) then
      begin
         GuardaAnoSemestre := ano_semestre_incremento;
         if ano_semestre_incremento <> qyCursosMestreNR_INCREMENTO.AsInteger then
         begin
            ano_semestre_incremento := qyCursosMestreNR_INCREMENTO.AsInteger;
         end;

         if ano_semestre_incremento = 1 then
         begin
            if (tblTurmasAnoSemestre.AsInteger mod 2) = 0 then
            begin
               qyListaProximaTurma.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 9;
               qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 9;
            end;

            if (tblTurmasAnoSemestre.AsInteger mod 2) <> 0 then
            begin
               qyListaProximaTurma.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 1;
               qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 1;
            end;
         end;

         if ano_semestre_incremento = 2 then
         begin
            qyListaProximaTurma.ParamByName('nr_anosemestre').AsInteger :=
               tblTurmasAnoSemestre.AsInteger + 10;
            qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsInteger :=
               tblTurmasAnoSemestre.AsInteger + 10;
         end;

        ano_semestre_incremento := GuardaAnoSemestre;
      end;
   end;
   qyListaProximaTurma.Open();   
   qyListaProximaTurmaRepr.Open();

   { Verifica se a próxima turma para rematrícula a partir dessa turma
     pertençe ao mesmo curso ou a outro curso }
   if dbrgProxTurma.ItemIndex = 1 then
   begin
      // Habilita os campos da próxima turma de outro curso
      selecionaTipoProxTurma(true);
   end else begin
      // Habilita os campos da próxima turma de outro curso
      selecionaTipoProxTurma(false);
   end;

   if tblTurmas.IsEmpty then
   begin
      lbColigada.Caption := '';
      lbDepartamento.Caption := '';
   end
   else
   begin
      lbColigada.Caption := qyColigadasCadastroTurmanm_coligada.AsString;
      lbDepartamento.Caption := qyGetDepto.FieldByName('descricao').AsString;
   end;

   btnMostrarParametroAvaliacao.Enabled := not (TDataSource( Sender ).State in [dsEdit, dsInsert]);

   if cbFormaAvaliacao.Text = '' then
   begin
      btnMostrarParametroAvaliacao.Enabled := False;
   end;

   if not(tblTurmas.State in [dsInsert, dsEdit]) then
   begin
      cbBloqueioVagas.ItemIndex := tblTurmassn_bloquear_vagas.AsInteger;
   end;

   if (tblTurmas.State in [dsBrowse]) then
   begin
      etapaInicial := cbNrEtapas.Items[cbNrEtapas.ItemIndex];
      bloqueioIncial := cbBloqueioVagas.Items[cbBloqueioVagas.ItemIndex];
      snUsaProximoCurso := tblTurmassn_proximo_curso.AsString;
      snMesmoAnoSem := tblTurmassn_matricula_mesmo_anosem.AsString;
   end;

   //Busca o nome do responsavel da turma
   txtResponsavelTurma1.Text := '';
   txtResponsavelTurma2.Text := '';
   
   if not(tblTurmasprofessor_responsavel.IsNull) then
   begin
     dm.CriarConsulta(qryBuscaResponsavel);
      qryBuscaResponsavel.Close();
      qryBuscaResponsavel.SQL.Text := '' +
    'SELECT nm_pessoa from pessoas ' +
    'WHERE cd_pessoa = :cd_professor ';
    qryBuscaResponsavel.ParamByName('cd_professor').AsInteger := tblTurmasprofessor_responsavel.AsInteger;
    qryBuscaResponsavel.ExecSQL;
    qryBuscaResponsavel.Open();
    txtResponsavelTurma1.Text := qryBuscaResponsavel.FieldByName('nm_pessoa').AsString;
   end;

   if not(tblTurmasprofessor_responsavel2.IsNull) then
   begin
      dm.CriarConsulta(qryBuscaResponsavel);
      qryBuscaResponsavel.Close();
      qryBuscaResponsavel.SQL.Text := '' +
      'SELECT nm_pessoa from pessoas ' +
      'WHERE cd_pessoa = :cd_professor ';
      qryBuscaResponsavel.ParamByName('cd_professor').AsInteger := tblTurmasprofessor_responsavel2.AsInteger;
      qryBuscaResponsavel.ExecSQL;
      qryBuscaResponsavel.Open();
      txtResponsavelTurma2.Text := qryBuscaResponsavel.FieldByName('nm_pessoa').AsString;
   end;
   //busca a sala e já adiona no campo
   buscaSala(tblTurmascd_sala.AsInteger);

end;

procedure TfrmCursos.dtcTurmasStateChange(Sender: TObject);
begin
  if pcGeral.ActivePage <> tsTurmas then Exit;

  btnIncluir.Enabled       := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled       := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled        := TDataSource( Sender ).State in [dsEdit, dsInsert];
  {    ALTERACAO_CURSOS
  btnRenomearCurso.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  }
  btnRenomearTurma.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled       := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];

  dbeTurma.Enabled         := TDataSource( Sender ).State in [dsInsert];

  btnMostrarGradeTurma.Enabled := not (TDataSource( Sender ).State in [dsEdit, dsInsert]);
  btnMostrarParametroAvaliacao.Enabled := not (TDataSource( Sender ).State in [dsEdit, dsInsert]);

  if cbFormaAvaliacao.Text = '' then
  begin
     btnMostrarParametroAvaliacao.Enabled := False;
  end;

  dbcbColigadas.Visible := (tblTurmascd_coligada.AsInteger < 1) AND (TDataSource( Sender ).State in [dsInsert]);
  lbColigada.Visible := not ((tblTurmascd_coligada.AsInteger < 1) AND (TDataSource( Sender ).State in [dsInsert]));

  grdTurmas.Enabled := not (TDataSource( Sender ).State in [dsEdit, dsInsert]);
end;

procedure TfrmCursos.edFiltroUnidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
   begin
      FiltraColigada();
   end;
end;

procedure TfrmCursos.excluirGradeCurricular();
const
   SQL_EXCLUI_PRE_REQ =
      'DELETE FROM disciplinas_prereq ' +
      'WHERE (cd_discipli_pre = ? or cd_discipli = ?) ' +
      'AND cd_curso = ? ' +
      'AND cd_grade = ? ';
var
   sAviso,
   separador: String;
   Stmt: IZPreparedStatement;
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npExcluir, True ) then Exit;

   if (not verificarDiplomaCurriculoDigital(qyGrades.FieldByName('id').AsInteger)) then
     Exit;

   grdGrades.SetFocus;
   
   if (grdGrades.Focused) and (qyGradesDisciplinas.RecordCount = 0) then
   begin
      if (Mensagem('Tem certeza que deseja excluir a grade?', 'Novo Curso', MB_YESNO + MB_ICONQUESTION, Handle)  = mrYes) then
      begin
         qyGrades.Delete;
         exit;
      end
      else
      begin
         exit;
      end;
   end;

   if Mensagem('Tem certeza que deseja excluir essa disciplina da grade?', 'Confirmação', MB_YESNO + MB_ICONQUESTION, Handle) <> mrYes then
      Exit;

   DM.qAux1.Close;
   DM.qAux1.Sql.Text := ' SELECT '+
                        '   CONCAT(p.nm_pessoa, '', '', f.anosemestre, '', '', f.turma) as nomes '+
                        ' FROM fichaindividual f '+
                        '   INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) ' +
	                     '   INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) '+
                        '   INNER JOIN pessoas p ON (p.cd_pessoa = f.codigoaluno) '+
                        ' WHERE '+
                        '   g.cd_grade = :cd_grade '+
                        '   AND g.cd_curso = :cd_curso '+
                        '   AND f.disciplina = ' + qyGradesDisciplinasCD_DISCIPLINA.AsString +
                        '   AND f.serie = ' + qyGradesDisciplinasNR_SERIE.AsString;
                        
   DM.qAux1.ParamByName('cd_grade').AsInteger := qyGradesDisciplinasCD_GRADE.AsInteger;
   DM.qAux1.ParamByName('cd_curso').AsString := qyGradesDisciplinasCD_CURSO.AsString;

   DM.qAux1.Open;

   if DM.qAux1.EOF Then
   begin
      Stmt := PrepareStatement(SQL_EXCLUI_PRE_REQ);
      try
         Stmt.SetInt(1, qyGradesDisciplinasCD_DISCIPLINA.AsInteger);
         Stmt.SetInt(2, qyGradesDisciplinasCD_DISCIPLINA.AsInteger);
         Stmt.SetString(3, qyGradesDisciplinasCD_CURSO.AsString);
         Stmt.SetInt(4, qyGradesDisciplinasCD_GRADE.AsInteger);
         Stmt.ExecutePrepared;

      finally
         Stmt.Close;
         Stmt := nil;
      end;
      qyGradesDisciplinas.Delete;
      qyGradesDisciplinas.Refresh;

   end
   else
   begin
      DM.qAux1.First;

      separador := '';

      while not DM.qAux1.Eof do
      begin
         sAviso := sAviso + separador + #13 + DM.qAux1.FieldByName('nomes').AsString;

         separador := ', ';
         DM.qAux1.Next;
      end;

      Mensagem(
         'Não é possível excluir essa disciplina da grade porque contém estas matrículas relacionadas: ' +
         sAviso,
         'Atenção',
         MB_OK + MB_ICONWARNING,
         Handle
      );
   end;

   if qyGradesDisciplinas.RecordCount = 0 then
   begin
      { Ação de excluir antiga, somente é deletada a grade quando a última disciplinas é apagada }
      if TemMatriculaNaDisciplina(
            qyGradesDisciplinasCD_GRADE.AsInteger,
            qyGradesDisciplinasCD_CURSO.AsString,
            qyGradesDisciplinasCD_DISCIPLINA.AsInteger,
            qyGradesDisciplinasNR_SERIE.AsInteger ) then
      begin
         if Mensagem('Existem matrículas nesta disciplina. Se excluir poderá ocultar os dados para visualização. Deseja continuar?', 'Atenção', MB_YESNOCANCEL + MB_ICONWARNING, Handle) <> mrYes then
         begin
            Exit;
         end;
      end;
      qyGrades.Delete;
   end;
end;

procedure TfrmCursos.dtcGradeStateChange(Sender: TObject);
begin
  if pcGeral.ActivePage <> tsGrade then Exit;

  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  {ALTERACAO_CURSOS
  btnRenomearCurso.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  }
  btnRenomearTurma.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmCursos.grdGradeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TTreeView);
end;

procedure TfrmCursos.grdGradeDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   I, cor, cd_disciplina_pesquisa: Integer;
begin

   if (Column.FieldName = 'DS_AVALIACAO') AND (gdSelected IN State) then
   begin
      cbAvaliacao.Left := Rect.Left + grdGrade.Left;
      cbAvaliacao.Top := Rect.Top + grdGrade.Top;

      cbAvaliacao.Width := Rect.Right - Rect.Left;
      cbAvaliacao.Height := Rect.Bottom - Rect.Top;

      cbAvaliacao.ItemIndex := 0;
      for I := 0 to cbAvaliacao.Items.Count - 1 do
      begin
         if ( cbAvaliacao.Items.Objects[I] as TItemCombo ).getCodigo() = qyGradesDisciplinasCD_AVALIACAO.AsString then
         begin
            cbAvaliacao.ItemIndex := I;
            Break;
         end;
      end;

      cbAvaliacao.Visible := True;
      cbAvaliacao.Enabled := bAlterarGrade;
   end
   else
   begin
      cbAvaliacao.Visible := False;
   end;

   if (Column.FieldName = 'DS_DISCIPLINA_FRENTE') AND (gdSelected IN State) then
   begin
      cbFrentes.Left := Rect.Left + grdGrade.Left;
      cbFrentes.Top := Rect.Top + grdGrade.Top;

      cbFrentes.Width := Rect.Right - Rect.Left;
      cbFrentes.Height := Rect.Bottom - Rect.Top;

      cbFrentes.ItemIndex := 0;

      if not qyGradesDisciplinasCD_DISCIPLINA_FRENTE.IsNull then
         cd_disciplina_pesquisa := qyGradesDisciplinasCD_DISCIPLINA_FRENTE.AsInteger;

      if cbFrentes.Items.Count > 1 then
      begin
         for I := 1 to cbFrentes.Items.Count - 1 do
         begin
            if StrToInt(( cbFrentes.Items.Objects[I] as TItemCombo ).getCodigo()) = cd_disciplina_pesquisa then
            begin
               cbFrentes.ItemIndex := I;
               Break;
            end;
         end;
      end;

      cbFrentes.Visible := True;
      cbFrentes.Enabled := bAlterarGrade;
   end else begin
      cbFrentes.Visible := False;
   end;

   if (Column.FieldName = 'DS_EXTRA') AND (gdSelected IN State) then
   begin
      cbSnExtra.Left := Rect.Left + grdGrade.Left;
      cbSnExtra.Top := Rect.Top + grdGrade.Top;

      cbSnExtra.Width := Rect.Right - Rect.Left;
      cbSnExtra.Height := Rect.Bottom - Rect.Top;

      if qyGradesDisciplinasSN_EXTRA.AsInteger = 1 then
         cbSnExtra.ItemIndex := 0
      else
         cbSnExtra.ItemIndex := 1;

      cbSnExtra.Visible := True;
      cbSnExtra.Enabled := bAlterarGrade;
   end else begin
      cbSnExtra.Visible := False;
   end;

   if (Column.FieldName = 'DS_AJUSTE_REMATRICULA') AND (gdSelected IN State) then
   begin
      cbAjusteRematricula.Left := Rect.Left + grdGrade.Left;
      cbAjusteRematricula.Top := Rect.Top + grdGrade.Top;

      cbAjusteRematricula.Width := Rect.Right - Rect.Left;
      cbAjusteRematricula.Height := Rect.Bottom - Rect.Top;

      if qyGradesDisciplinasSN_AJUSTE_REMATRICULA.AsInteger = 1 then
         cbAjusteRematricula.ItemIndex := 0
      else
         cbAjusteRematricula.ItemIndex := 1;

      cbAjusteRematricula.Visible := True;
      cbAjusteRematricula.Enabled := bAlterarGrade;
   end else begin
      cbAjusteRematricula.Visible := False;
   end;

   if (Column.FieldName = 'DS_OPTATIVA') AND (gdSelected IN State) AND
      (qyGradesDisciplinasNR_SERIE.AsInteger <> -100) then
   begin
      cbSnOptativa.Left := Rect.Left + grdGrade.Left;
      cbSnOptativa.Top := Rect.Top + grdGrade.Top;

      cbSnOptativa.Width := Rect.Right - Rect.Left;
      cbSnOptativa.Height := Rect.Bottom - Rect.Top;

      if qyGradesDisciplinasSN_OPTATIVA.AsInteger = 1 then
         cbSnOptativa.ItemIndex := 0
      else
         cbSnOptativa.ItemIndex := 1;

      cbSnOptativa.Visible := True;
      cbSnOptativa.Enabled := bAlterarGrade;
   end else begin
      cbSnOptativa.Visible := False;
   end;

   // pega a cor que vem do campo calculado
   cor := clWhite;
   case qyGradesDisciplinasNR_SERIE.AsInteger of
      1, 6, 11, 16, 21, 26: cor := clWebLemonChiffon;
      2, 7, 12, 17, 22, 27: cor := clWebIvory;
      3, 8, 13, 18, 23, 28: cor := clWebPapayaWhip;
      4, 9, 14, 19, 24, 29: cor := clWebBisque;
      5, 10, 15, 20, 25, 30: cor := clWebLavenderBlush;
      else begin
         cor := clWebLavender;
      end;
   end;

   grdGrade.Canvas.Brush.Color := cor;

   if gdFocused in State then
   begin
      grdGrade.Canvas.Brush.Color:= clBlue;
   end;

   grdGrade.Canvas.FillRect(Rect);
   grdGrade.DefaultDrawDataCell(Rect, Column.Field, State);
end;


procedure TfrmCursos.grdGradeColEnter(Sender: TObject);
var
   gridOptions : TDBGridOptions;
begin
   gridOptions :=  grdGrade.Options;

   Include(
      gridOptions,
      dgEditing
   );

   if NOT bAlterarGrade then
   begin
      {
         RETIRA A OPÇÃO DE EDICAO DA TABELA
         SE O USUÁRIO NÃO POSSUI PERMISSÃO PARA ALTERAR
      }
      Exclude(
         gridOptions,
         dgEditing
      );
   end;

   bAlterarGrade := DM.UsuarioLogado.TemPermissao(
      1149,
      npAlterar,
      False
   );

   // nao permite alterar grade vinculada com curriculo digital
   if (not verificarDiplomaCurriculoDigital(qyGrades.FieldByName('id').AsInteger, False)) then
   begin
      Exclude(
         gridOptions,
         dgEditing
      );

      bAlterarGrade := False;
      cbSnOptativa.Enabled := False;
      cbAvaliacao.Enabled := False;
      cbSnExtra.Enabled := False;
      cbFrentes.Enabled := False;
      cbAjusteRematricula.Enabled := False;
   end;

   grdGrade.Options := gridOptions;
   TUMHackDbGrid(grdGrade).SetEditText(grdGrade.SelectedField.Text);
end;

procedure TfrmCursos.grdGradeDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyTreeNode : TTreeNode;
  flg, bOptativa: Boolean;
  xEtapa, xDisciplina: String;
  qyVerificaDisciplina: TUMZQuery;
  i: Integer;
begin

   // Se o drag and drop estiver recebendo um treeview, então tente inserir a disciplina
   if Source is TTreeView then
   begin
      DM.CriarConsulta(qyVerificaDisciplina);

      for i := 0 to frmTableFields.Tree.SelectionCount-1 do
      begin

         MyTreeNode := frmTableFields.Tree.Selections[i];

         xDisciplina := MyTreeNode.Text;
         xDisciplina := Copy(xDisciplina,1,11);

         try
            qyGradesDisciplinas.Insert;

            qyGradesDisciplinasCD_GRADE.AsInteger := qyGradesCD_GRADE.AsInteger;
            qyGradesDisciplinasCD_CURSO.AsString := qyGradesCD_CURSO.AsString;
            qyGradesDisciplinasCD_DISCIPLINA.AsInteger := StrToInt(xDisciplina);

            if pedir_dados_grade then
            begin
               try
                  xEtapa := IntToStr(arrUltimasEtapas[qyCursosMestre.RecNo-1][qyGrades.RecNo-1]);
               except on E:Exception do
                  SetLength(arrUltimasEtapas[qyCursosMestre.RecNo-1], qyGrades.RecordCount);
               end;


               if xEtapa = '0' then
               begin
                  xEtapa := '';
               end;

               if xEtapa = '-100' then
               begin
                  xEtapa := '';
               end;

               flg := InputQueryCheck(Application.Title, 'Digite o número da etapa para a disciplina "' + MyTreeNode.Text + '":','Etapa Optativa', xEtapa, bOptativa, BloquearCampoEtapa);

               if bOptativa then
               begin
                  xEtapa := '-100';
               end;

               if trim(xEtapa) = '' then
                  arrUltimasEtapas[qyCursosMestre.RecNo-1][qyGrades.RecNo-1] := 0
               else
                  arrUltimasEtapas[qyCursosMestre.RecNo-1][qyGrades.RecNo-1] := strtoint(xEtapa);

               if not flg then
               begin
                  qyGradesDisciplinas.Cancel;
                  Exit;
               end else
                  qyGradesDisciplinasNR_SERIE.AsInteger := strtoint(xEtapa);

               // Verifica se já existe a disciplina na grade, turno, etapa selecionada
               with qyVerificaDisciplina do
               begin
                  Close();
                  SQL.Clear();
                  SQL.Add('SELECT CD_DISCIPLINA FROM GRADES_DISCIPLINAS');
                  SQL.Add('WHERE CD_GRADE = :CD_GRADE AND CD_CURSO = :CD_CURSO AND');
                  SQL.Add('CD_DISCIPLINA = :CD_DISCIPLINA AND NR_SERIE = :ETAPA');

                  ParamByName('CD_GRADE').AsInteger := qyGradesCD_GRADE.AsInteger;
                  ParamByName('CD_CURSO').AsString := qyGradesCD_CURSO.AsString;
                  ParamByName('CD_DISCIPLINA').AsInteger := StrToInt(xDisciplina);
                  ParamByName('ETAPA').AsInteger := StrToInt(xEtapa);

                  Open();

                  if RecordCount > 0 then
                  begin
                     qyGradesDisciplinas.Cancel;
                     Mensagem('Está disciplina já está nessa grade, na mesma etapa e turno.',
                              'Atenção', MB_OK + MB_ICONWARNING, Handle);
                  end else   
                  begin
                     qyGradesDisciplinas.Post;
                     qyGradesDisciplinas.Refresh;
                  end;
               end;
            end;
         except
            on E:Exception do
            begin
               Mensagem('Ocorreu um erro ao tentar vincular a Disciplina.',
                        'Atenção', MB_OK + MB_ICONWARNING, Handle);
               qyGradesDisciplinas.Cancel;
            end;
         end;
      end;
   end;

end;

procedure TfrmCursos.BitBtn1Click(Sender: TObject);
begin
   if not(qyCursosMestre.State in [dsBrowse]) then
   begin
      qyCursosMestreCD_AREA.Clear;
   end;
end;

procedure TfrmCursos.BloquearCampoEtapa(Sender: TObject);
var
   Edit: TEdit;
begin
   Edit := TEdit(TCheckBox(Sender).Parent.FindComponent('Edit'));
   Edit.Text := '';
   Edit.Enabled := not TCheckBox(Sender).Checked;  
end;

procedure TfrmCursos.BloquearCampoDataLimite(Sender: TObject);
var
   dt_limite: TDateTimePicker;
begin
   dt_limite := TDateTimePicker(TCheckBox(Sender).Parent.FindComponent('Data'));
   dt_limite.Enabled := not TCheckBox(Sender).Checked;
end;

procedure TfrmCursos.grdGradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_DELETE: begin
         { Se for pressionado Ctrl + Del, executa a função de excluir disciplina/grade }
         if ( Shift = [ssCtrl] ) then
            excluirGradeCurricular();

         { Bloqueia ação de Ctrl + Del padrão do componente DBGrid }
         Key := 0;
      end;
      VK_INSERT: begin
         btnMostrarDisciplinasClick(nil);
      end;
   end;
end;

procedure TfrmCursos.grdGradesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   if ( Key = VK_DELETE ) then
   begin
      { Se for pressionado Ctrl + Del, executa a função de excluir disciplina/grade }
      if ( Shift = [ssCtrl] ) then
         excluirGradeCurricular();

      { Bloquear ação de delete default do DBGrid }      
      Key := 0;
   end;
end;

procedure TfrmCursos.inserirAtosOficiais;
begin

  if not PrincipalForm.ProcuraForm( TForm(frmAtosOficiais) ) then
  begin
     Application.CreateForm(TfrmAtosOficiais, frmAtosOficiais);
  end;
     
  qyAtosOficiais.Insert;
  
  frmAtosOficiais.DBEdit5.Text := qyCursosMestreCD_CURSO.AsString;
  frmAtosOficiais.ShowModal;

end;

procedure TfrmCursos.lbedPesquisaCursoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then FiltraCursos;
end;

procedure TfrmCursos.mostraAba(var painel: TPanel);
var
   anosem: Integer;
   qryVerificaUltimaTurma: TUMZReadOnlyQuery;
const
   SQL_ULTIMA_TURMA =
      'SELECT '+
      '	anosemestre '+
      'FROM '+
      '	turmas AS t '+
      'WHERE '+
      '	t.curso = :curso '+
      'ORDER BY '+
      '	t.anosemestre DESC '+
      'LIMIT '+
      '	1';
begin
   anosem := UMFiltroDataAnoSem.getAnosemestre();

   DM.CriarConsulta(qryVerificaUltimaTurma);

   qryVerificaUltimaTurma.SQL.Text := SQL_ULTIMA_TURMA;
   qryVerificaUltimaTurma.ParamByName('curso').AsString :=
      qyCursosMestreCD_CURSO.AsString;
   qryVerificaUltimaTurma.Open;   

   if anosem = 0 then
   begin
      anosem := ano_semestre;
   end;

   if qryVerificaUltimaTurma.RecordCount > 0 then
   begin
      anosem := qryVerificaUltimaTurma.FieldByName('anosemestre').AsInteger;
   end;

   pnCursos.Visible := False;
   pnTurmas.Visible := False;
   pnDisciplinas.Visible := False;
   pnGradeCurricular.Visible := False;
   pnDocumentosNecessarios.Visible := False;

   painel.Visible := True;

   if painel.Name = 'pnTurmas' then
   begin
      if (TrocouCurso) and (DM.UsaAnosemestre) then
      begin
         UMFiltroDataAnoSem.setAnosemestreInicial(anosem);
         TrocouCurso := False;
      end;
   end;
end;

procedure TfrmCursos.mostraParametroAvaliacoes(cd_avaliacao: Integer);
begin

   if not DM.UsuarioLogado.TemPermissao( 1034, npAcesso, True ) then
   begin
      Exit;
   end;

   if (btnSalvar.Enabled) OR
      (qyColigada.State IN [dsInsert, dsEdit]) OR
      (qyCursosColigadas.State IN [dsInsert, dsEdit]) OR
      (tblDeptos.State IN [dsInsert, dsEdit]) OR
      (qyCursosMestre.State IN [dsInsert, dsEdit]) OR
      (tblTurmas.State IN [dsInsert, dsEdit]) OR
      (tblDisc.State IN [dsInsert, dsEdit]) OR
      (qyCursosMestre.State IN [dsInsert, dsEdit]) OR
      (qyGrades.State IN [dsInsert, dsEdit]) OR
      (qyGradesDisciplinas.State IN [dsInsert, dsEdit]) OR
      (qDocumentosNecessarios.State IN [dsInsert, dsEdit]) then
   begin
      Mensagem('Salve as alterações antes de visualizar a tela de parâmetros de avaliação.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
   end
   else
   begin

      Application.CreateForm(Tfrm_Avaliacoes_parametros, frm_Avaliacoes_parametros);

      frm_Avaliacoes_parametros.Show;

      frm_Avaliacoes_parametros.tblAvaliacoes.Locate('cd_avaliacao', cd_avaliacao, []);
      
   end;

end;


procedure TfrmCursos.mostraGrade(cd_grade: Integer);
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npAcesso, True ) then
   begin
      Exit;
   end;

   qyCursosColigadas.Cancel();
   tblTurmas.Cancel();

   if (btnSalvar.Enabled) OR
      (qyColigada.State IN [dsInsert, dsEdit]) OR
      (qyCursosColigadas.State IN [dsInsert, dsEdit]) OR
      (tblDeptos.State IN [dsInsert, dsEdit]) OR
      (qyCursosMestre.State IN [dsInsert, dsEdit]) OR
      (tblTurmas.State IN [dsInsert, dsEdit]) OR
      (tblDisc.State IN [dsInsert, dsEdit]) OR
      (qyCursosMestre.State IN [dsInsert, dsEdit]) OR
      (qyGrades.State IN [dsInsert, dsEdit]) OR
      (qyGradesDisciplinas.State IN [dsInsert, dsEdit]) OR
      (qDocumentosNecessarios.State IN [dsInsert, dsEdit]) then
   begin
      Mensagem('Salve as alterações antes de visualizar a grade.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
   end
   else
   begin
      if (qyGrades.State IN [dsInactive]) then
         qyGrades.Open();

      qyGrades.Locate('CD_GRADE', cd_grade, []);
      pcGeral.ActivePage := tsGrade; 
      mostraAba(pnGradeCurricular);
      // Trocou de aba então deve executar as verificações referentes a essa ação
      pcGeralChange(pcGeral);
   end;
end;

procedure TfrmCursos.tblTurmasAfterInsert(DataSet: TDataSet);
begin
   if not (tblTurmas.State in [dsInsert,dsEdit] ) then
   begin
      tblTurmas.Insert;
   end;
   tblTurmasCurso.AsString := qyCursosMestreCD_CURSO.AsString;
   tblTurmascd_grade.AsInteger := qyCursosColigadasCD_GRADE.AsInteger;
end;

procedure TfrmCursos.tblTurmasAfterOpen(DataSet: TDataSet);
begin
   cbBloqueioVagas.ItemIndex := tblTurmassn_bloquear_vagas.AsInteger;
end;

procedure TfrmCursos.FormDestroy(Sender: TObject);
begin
   frmCursos := nil;
end;


procedure TfrmCursos.tblTurmasHoraInicioSetText(Sender: TField;
  const Text: String);
begin
  tblTurmasHoraInicio.AsString := FormatDateTime('dd/mm/yyyy', tblTurmasDataInicio.AsDateTime) +
    ' ' + Text;
end;

procedure TfrmCursos.tblTurmasHoraFimSetText(Sender: TField;
  const Text: String);
begin
  tblTurmasHoraFim.AsString := FormatDateTime('dd/mm/yyyy', tblTurmasDataFim.AsDateTime) +
    ' ' + Text;

end;


procedure TfrmCursos.btnCopiarGradeClick(Sender: TObject);
var
  flg, mostraMsg, pergunta : Boolean;
  qyNovaGrade: TUMZQuery;
  {strAnoSemestre, strTurma : String;}
  {Codigo, AnoSemestre : String;}
  strGrade, strGradeMaior{, strTurno, strSerie} : String;
begin
   mostraMsg := False;
   pergunta := True;

   if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True ) then Exit;

   DM.CriarConsulta(qyNovaGrade);

   strGrade := '';
   strGradeMaior := strGrade;

   {if Mensagem( 'Deseja copiar esta grade para outro período?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = ID_NO then Exit;}
   if Mensagem( 'Deseja duplicar esta grade com outro código?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = ID_NO then Exit;

   repeat
      if mostraMsg then
      begin
         Mensagem('Não é possível cadastrar uma grade com o mesmo código ou com valor 0 (zero),'+
                     Chr(13)+'escolha outro código.',
                  'Atenção', MB_OK + MB_ICONEXCLAMATION );
         if trim(strGrade) = '' then
            strGrade := strGradeMaior;
      end;
      flg := InputQuery(Application.Title, 'Digite o novo código da Grade', strGrade);
      if not flg then Exit;

      DM.CriarConsulta(qyNovaGrade);
      if (trim(strGrade) <> '') AND (strtoint(strGrade) > 0) then
      begin
         qyNovaGrade.SQL.Text := 'SELECT cd_grade FROM grades WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso ';
         qyNovaGrade.ParamByName('cd_grade').AsString := strGrade;
         qyNovaGrade.ParamByName('cd_curso').AsString := qyCursosMestreCD_CURSO.AsString;
         qyNovaGrade.Open();
      end;

      mostraMsg := True;

      if ( (trim(strGrade) <> '') AND (strtoint(strGrade) > 0) ) AND (qyNovaGrade.RecordCount = 0) then
         pergunta := False;
   until not pergunta;

   {strAnoSemestre := tblGradeAnoSemestre.AsString;
   flg := InputQuery( Application.Title, 'Digite o Ano/Semestre (aaaas)',strAnoSemestre );

   strTurno := tblGradeTurno.AsString;
   flg := InputQuery( Application.Title, 'Digite o Turno (M=Mat, V=Ves, N=Not, S=Misto', strTurno );

   strSerie := tblGradeSerie.AsString;
   flg := InputQuery( Application.Title, 'Digite o número da Etapa',strSerie );

   strGrade := tblGradecd_grade.AsString;
   flg := InputQuery( Application.Title, 'Digite o número da Grade', strGrade );}

   if not flg then Exit;

   {CopiarGrade(StrToInt(strGrade), StrToInt(strAnoSemestre),strTurno,StrToInt(strSerie) );}
   CopiarGrade(qyGradesCD_GRADE.AsInteger, StrToInt(strGrade), qyGradesCD_CURSO.AsString);

   {tblGradeGroup.Close();
   tblGradeGroup.Open();

   tblGrade.Close();
   tblGrade.Open();}

end;


procedure TfrmCursos.tblTurmasAfterPost(DataSet: TDataSet);
var
   mensagemGeralAjusteCreditos: String;
   slNenhumTituloEncontrado, slNovoTituloGerado, slSemTituloPendente: TStringList;
   i: Integer;
   retornoAjusteAluno: TAvisosRecalculoCreditos;
   parametros: TParamsIni;
begin
   grdTurmas.SetFocus;
   VerificaTurmaInPlanoPagamento();

   // Se estiver trocando o código da grade da turma
   if bTrocandoGrade then
   begin
      { Foi verificado anteriormente (beforePOST > [função] permiteTrocarGradeTurma) que existem alunos vinculados
        a grade e foi modificado o valor do crédito financeiro nas disciplinas que esses alunos estão matriculados,
        então varre os alunos que deve-se recalcular o financeiro pela diferença de créditos }

      if qyVerificarFinanceiro.RecordCount > 0 then
      begin
         frmProcessando.Bar.Max := qyVerificarFinanceiro.RecordCount;
         frmProcessando.Bar.Position := 0;
         frmProcessando.Show;
         Application.ProcessMessages;

         slNenhumTituloEncontrado := TStringList.Create;
         slNovoTituloGerado := TStringList.Create;
         slSemTituloPendente := TStringList.Create;

         qyVerificarFinanceiro.First;
         while not qyVerificarFinanceiro.Eof do
         begin
            frmProcessando.lblRegistros.Caption := Format('Ajustando créditos do aluno %d', [qyVerificarFinanceiro.FieldByName('codigoaluno').AsInteger]);
            frmProcessando.Bar.StepIt;
            Application.ProcessMessages;

            retornoAjusteAluno := Dm.recalcular_creditos_financeiros(
                                       qyVerificarFinanceiro.FieldByName('codigoaluno').AsInteger,
                                       qyVerificarFinanceiro.FieldByName('turmamatricula').AsString,
                                       qyVerificarFinanceiro.FieldByName('anosemestre').AsInteger,
                                       false,
                                       false,
                                       false
                                  );

            if retornoAjusteAluno = NenhumTituloEncontrado then
            begin
               slNenhumTituloEncontrado.Add(qyVerificarFinanceiro.FieldByName('codigoaluno').AsString);
            end else if retornoAjusteAluno = NovoTituloGerado then
            begin
               slNovoTituloGerado.Add(qyVerificarFinanceiro.FieldByName('codigoaluno').AsString);
            end else if retornoAjusteAluno = SemTituloPendente then
            begin
               slSemTituloPendente.Add(qyVerificarFinanceiro.FieldByName('codigoaluno').AsString);
            end;

            qyVerificarFinanceiro.Next;
         end;
         frmProcessando.Close;

         mensagemGeralAjusteCreditos := '';

         if slNenhumTituloEncontrado.Count > 0 then
         begin
            mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + 'Nenhum título foi encontrado para que o sistema realizasse ajustes para os estudantes:';
            for i := 0 to slNenhumTituloEncontrado.Count-1 do
            begin
               mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + #13 + ' - '+slNenhumTituloEncontrado[i];
            end;
            mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + #13#13;
         end;

         if slNovoTituloGerado.Count > 0 then
         begin
            mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + 'O sistema gerou um novo título, pois não foi possível alterar os títulos atuais para os estudantes:';
            for i := 0 to slNovoTituloGerado.Count-1 do
            begin
               mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + #13 + ' - '+slNovoTituloGerado[i];
            end;
            mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + #13#13;
         end;

         if slSemTituloPendente.Count > 0 then
         begin
            mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + 'Nenhum título ref. mensalidades está pendente para alterações para os estudantes:';
            for i := 0 to slSemTituloPendente.Count-1 do
            begin
               mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + #13 + ' - '+slSemTituloPendente[i];
            end;
            mensagemGeralAjusteCreditos := mensagemGeralAjusteCreditos + #13#13;
         end;

         if Length(mensagemGeralAjusteCreditos) > 0 then
         begin
            parametros.titulo := 'Atenção';
            parametros.opcoes := (BT_OK + ICO_CONFIRMATION);
            parametros.mensagens.msgPrincipal := mensagemGeralAjusteCreditos;
            parametros.mensagens.msgTopo := 'Não foi possível ajustar os créditos dos alunos listados abaixo pelos seguintes motivos:'+#13;
            parametros.mensagens.msgRodape := '';
            parametros.dimensao.altura := 350;
            parametros.dimensao.largura := 600;

            TfrmMensagem.create(Self, parametros).ShowModal;
         end;

      end;
   end;

end;

procedure TfrmCursos.btnMostraGradesAtivasClick(Sender: TObject);
const
   TEXTO_BOTAO_TODAS = 'Mostrar todas as grades';
   TEXTO_BOTAO_ATIVAS = 'Mostrar grades ativas';
begin

   if (btnMostraGradesAtivas.Caption = TEXTO_BOTAO_TODAS) then
   begin

      bMostrarGrades := true;
      qyGrades.Close();
      qyGrades.SQL.Text := 'SELECT * FROM GRADES WHERE CD_CURSO = :CD_CURSO ORDER BY CD_GRADE, DS_GRADE';

      qyGrades.SQLList.Values['mysql-5'] := 'SELECT * FROM GRADES WHERE CD_CURSO = :CD_CURSO ORDER BY CD_GRADE, DS_GRADE';
      qyGrades.SQLList.Values['oracle'] := 'SELECT CD_GRADE, CD_CURSO,  DS_GRADE,  NR_ANO_INICIAL,  SN_ATIVO FROM GRADES WHERE CD_CURSO = :CD_CURSO ORDER BY CD_GRADE, DS_GRADE';


      qyGrades.Open();
      qyGrades.First();
      btnMostraGradesAtivas.Caption := TEXTO_BOTAO_ATIVAS;

   end
   else
   begin

      bMostrarGrades := false;
      qyGrades.Close();
      qyGrades.SQL.Text := 'SELECT * FROM GRADES WHERE CD_CURSO = :CD_CURSO AND SN_ATIVO = '+QuotedStr('S')+' ORDER BY CD_GRADE, DS_GRADE';

      qyGrades.SQLList.Values['mysql-5'] := 'SELECT * FROM GRADES WHERE CD_CURSO = :CD_CURSO AND SN_ATIVO = '+QuotedStr('S')+' ORDER BY CD_GRADE, DS_GRADE';
      qyGrades.SQLList.Values['oracle'] := 'SELECT CD_GRADE, CD_CURSO,  DS_GRADE,  NR_ANO_INICIAL,  SN_ATIVO FROM GRADES WHERE CD_CURSO = :CD_CURSO AND SN_ATIVO = '+QuotedStr('S')+' ORDER BY CD_GRADE, DS_GRADE';

      qyGrades.Open();
      qyGrades.First();
      btnMostraGradesAtivas.Caption := TEXTO_BOTAO_TODAS;

   end;
end;

procedure TfrmCursos.btnMostrarDisciplinasClick(Sender: TObject);
begin
  Mensagem('Essa funcionalidade está habilitada apenas no Gestão Online devido a uma adequação Legal para o Currículo Digital.',
    'Atenção', MB_OK + MB_ICONWARNING, Handle);
  Exit;

  if not DM.UsuarioLogado.TemPermissao( 1149, npAlterar, True ) then Exit;

  if pcGeral.ActivePage = tsGrade then
   begin
      if qyGrades.State in [dsInsert, dsEdit] then
      begin
         Mensagem('É necessário salvar a grade atual que está sendo editada, para vincular disciplinas.',
                  'Aviso', MB_OK + MB_ICONEXCLAMATION, Handle);
         Exit;
      end;
   end;

  pedir_dados_grade := True;

  Application.CreateForm( TfrmTableFields, frmTableFields );

  frmTableFields.ConstroiTreeTodasDisc(qyGradesCD_CURSO.AsString, qyCursosColigadasCD_COLIGADA.AsInteger);
  if frmTableFields.tblDisciplinas.IsEmpty then
     Mensagem('Não existem disciplinas cadastradas para este curso.',
              'Atenção', MB_OK + MB_ICONWARNING, Handle)
  else
    frmTableFields.Show;

end;

procedure TfrmCursos.grdDiscTitleClick(Column: TColumn);
var
   n : Integer;
begin
   if grdDisc.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
   begin
      exit;
   end;

   for n:= 0 to grdDisc.Columns.Count - 1 do
   begin
      grdDisc.Columns[n].Title.Font.Style := [];
   end;

   if (fieldOrdemDisciplina = Column.FieldName) then
   begin
      fieldOrdemDisciplina := Column.FieldName + ' DESC ';
   end
   else if Pos('DESC', fieldOrdemDisciplina) > 0 then
   begin
      fieldOrdemDisciplina := '';
   end
   else
   begin
      fieldOrdemDisciplina := Column.FieldName;
   end;

   if fieldOrdemDisciplina <> '' then
   begin
    Column.Title.Font.Style := [fsUnderline];
   end;

   tblDisc.Close;
   tblDisc.SQL.Clear;
   tblDisc.SQL.Add(
        ' SELECT '
      + '   cd_disciplina_pai, '
      + '   id_disciplina, '
      + '   codigo, '
      + '   ordem, '
      + '   curso, '
      + '   sigla, '
      + '   descricao, '
      + '   ementa_backup, '
      + '   qtd_frases_fixas, '
      + '   cd_disc_mec, '
      + '   sn_bloqueado, '
      + '   sn_ementa_padrao, '
      + '   sn_exporta_moodle, '
      + '   sn_ativo '
      + ' FROM '
      + '   disciplinas '
      + ' WHERE '
      + '   Curso = :Codigo AND '
      + '   sn_ativo = 1 '
   );
   
   if fieldOrdemDisciplina <> '' then
   begin
    tblDisc.sql.Add('ORDER BY '+fieldOrdemDisciplina);
   end;

   tblDisc.ParamByName('Codigo').AsString := qyCursosMestreCD_CURSO.AsString;
   tblDisc.Open;
end;

procedure TfrmCursos.tblDiscBeforePost(DataSet: TDataSet);
var
   qyInsertDisciplinaMestre: TUMZQuery;
   qyVerificarDiscMestra: TUMZQuery;
begin
   tblDiscCurso.AsString := qyCursosMestreCD_CURSO.AsString;

   if (cbDisciplinaPai.ItemIndex = 0)and not(DM.lite) then
   begin
      DM.CriarConsulta(qyInsertDisciplinaMestre);
      DM.CriarConsulta(qyVerificarDiscMestra);
      qyVerificarDiscMestra.Close();
      qyVerificarDiscMestra.SQL.Text := 'SELECT cd_disciplina_pai FROM disciplinas_mestre WHERE cd_disciplina_pai = :cd_disciplina_pai';
      qyVerificarDiscMestra.ParamByName('cd_disciplina_pai').AsString := tblDiscCD_DISCIPLINA_PAI.AsString;
      qyVerificarDiscMestra.Open();

      if qyVerificarDiscMestra.RecordCount > 0 then begin
         Mensagem('O Novo Código de Disciplina Mestra informado já está em uso!','Código Indisponível', MB_ICONSTOP+MB_OK);
         abort;
      end;    

      with qyColigadasCadastroTurmaInsert do
      begin
         ParamByName('cd_disciplina_pai').AsString := tblDiscCD_DISCIPLINA_PAI.AsString;
         ParamByName('ds_disciplina').AsString := tblDiscDescricao.AsString;
         ParamByName('nr_ordem').AsInteger := tblDiscordem.AsInteger;
         ParamByName('ds_sigla').AsString := tblDiscsigla.AsString;
         ParamByName('cd_disc_mec').AsInteger := tblDisccd_disc_mec.AsInteger;

         ExecSQL();

         carregarDisciplinasPai();
      end;

      FreeAndNil(qyInsertDisciplinaMestre);
      FreeAndNil(qyVerificarDiscMestra);
   end;

   if tblDisc.State = dsInsert then
   begin
      DM.setLog(1006, 'Inclusao', tblDiscCurso.AsString + ';' + tblDisccodigo.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, tblDiscDescricao.AsString);
   end
   else
   begin
      if tblDiscCD_DISCIPLINA_PAI.AsString = '' then
      DM.setLog(1006, 'Alteracao', tblDiscCurso.AsString + ';' + tblDisccodigo.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, tblDiscDescricao.AsString);
   end;  
end;

procedure TfrmCursos.UMFiltroDataAnoSemChangeAnoSemestre(Sender: TObject;
  var Valor: Integer; Direction: TUpDownDirection);
begin

   if (tblTurmas.State in [dsInsert, dsEdit]) then
   begin
      Exit;
   end;


   DM.inc_dec_ano_semestre(valor, Direction);
end;

procedure TfrmCursos.UMFiltroDataAnoSemUMSubCheckBoxckDataFimClick(
  Sender: TObject);
begin
   if FTelaCarregada then
      carregarTurmas();
end;

procedure TfrmCursos.UMFiltroDataAnoSemUMSubCheckBoxckDataInicioClick(
  Sender: TObject);
begin
   if FTelaCarregada then
      carregarTurmas();
end;

procedure TfrmCursos.UMFiltroDataAnoSemUMSubCheckBoxckTurmaAtivaClick(
  Sender: TObject);
begin
   if FTelaCarregada then
      carregarTurmas();
end;

procedure TfrmCursos.UMFiltroDataAnoSemUMSubDateTimePickerdtpDataFimChange(
  Sender: TObject);
begin
   if FTelaCarregada then
      carregarTurmas();
end;

procedure TfrmCursos.UMFiltroDataAnoSemUMSubDateTimePickerdtpDataInicioChange(
  Sender: TObject);
begin
   if FTelaCarregada then
      carregarTurmas();
end;

procedure TfrmCursos.UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange(
  Sender: TObject);
begin
   if FTelaCarregada then
      carregarTurmas();
end;

procedure TfrmCursos.updGradesDisciplinasAfterDeleteSQL(Sender: TObject);
var
   chaveLog, msgLog: string;
begin

   // Grava log das alterações realizadas na grade curricular
   chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
   // Cria a mensagem do LOG que contém as informações alteradas
   msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
             'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
             'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
             'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
             'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
             'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
             'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
             'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
             'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
             'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
             'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
             'Avaliação: '+ qyGradesDisciplinas.FieldByName('CD_AVALIACAO').AsString +CHR(13)+
             'Extra: '+ qyGradesDisciplinas.FieldByName('SN_EXTRA').AsString +CHR(13)+
             'Optativa: '+ qyGradesDisciplinas.FieldByName('SN_OPTATIVA').AsString +CHR(13)+
             'Faz Frente: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_FRENTE').AsString;

   // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
   DM.setLog( 1006, 'Exclusao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

end;

procedure TfrmCursos.updGradesDisciplinasAfterModifySQL(Sender: TObject);
var
   chaveLog, msgLog, state: string;
begin

   // Grava log das alterações realizadas na grade curricular
   chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
   // Cria a mensagem do LOG que contém as informações alteradas
   msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
             'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
             'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
             'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
             'CR/Fin: '+ qyGradesDisciplinas.FieldByName('NR_AULAS').AsString +CHR(13)+
             'Carga Hr.: '+ qyGradesDisciplinas.FieldByName('VL_VALOR').AsString +CHR(13)+
             'Compart.: '+ qyGradesDisciplinas.FieldByName('SN_COMPARTILHADA').AsString +CHR(13)+
             'H/A: '+ qyGradesDisciplinas.FieldByName('NR_CREDITOS_ACADEMICOS').AsString +CHR(13)+
             'Categoria: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_CATEGORIA').AsString +CHR(13)+
             'C.H. Prática: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_PRATICA').AsString +CHR(13)+
             'C.H. Teórica: '+ qyGradesDisciplinas.FieldByName('NR_CARGA_HORARIA_TEORICA').AsString +CHR(13)+
             'Avaliação: '+ qyGradesDisciplinas.FieldByName('CD_AVALIACAO').AsString +CHR(13)+
             'Extra: '+ qyGradesDisciplinas.FieldByName('SN_EXTRA').AsString +CHR(13)+
             'Optativa: '+ qyGradesDisciplinas.FieldByName('SN_OPTATIVA').AsString +CHR(13)+
             'Faz Frente: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA_FRENTE').AsString;

   // define qual a operação que está sendo executada
   if (qyGradesDisciplinas.State in [dsInsert]) then
      state := 'Inclusao'
   else 
      state := 'Alteracao';

   // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
   DM.setLog( 1006, state, chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

end;

procedure TfrmCursos.utilizarCurso;
var
   bFazer : boolean;
   qyAlteraCursoColigada,
   qyVerificaCursoColigada: TUMZQuery;
   codCurso: String;
begin
   DM.CriarConsulta(qyAlteraCursoColigada);
   codCurso := qyCursosMestreCD_CURSO.AsString;

   if ckbUtilizarCurso.Checked then
   begin
      if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then
      begin
         ckbUtilizarCurso.Checked := not ckbUtilizarCurso.Checked;
         Exit;
      end;

      bFazer := Mensagem('Você está prestes a Habilitar o curso de '+qyCursosMestreDS_CURSO.Value+
      ', para a Unidade de Ensino '+TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getDescricao()+'.'+CHR(13)+
      'Deseja Prosseguir?',
      'Habilitar Curso', MB_YESNO+MB_ICONQUESTION, Handle) = mrYes;

      if (bFazer) then
      begin
         SelecionouColigada := True;

         with qyAlteraCursoColigada do
         begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT cd_curso FROM cursos_coligadas');
            SQl.Add('WHERE cd_curso = :cd_curso AND cd_coligada = :cd_coligada');

            ParamByName('cd_coligada').AsInteger := strtoint(TItemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
            ParamByName('cd_curso').AsString := qyCursosMestreCD_CURSO.AsString;

            Open();
         end;

         { Se o curso já existir então deve somente alterar o sn_ativo da tabela de
            cursos_coligadas para 0, senão o curso deverá ser adicionado normalmente para a coligada }
         if (qyAlteraCursoColigada.RecordCount > 0) then
         begin
            with DM.qyAux2 do
            begin
               Close();
               SQL.Clear();
               SQL.Add('UPDATE cursos_coligadas SET sn_ativo = 1 WHERE cd_curso = :cd_curso AND cd_coligada = :cd_coligada');
               ParamByName('cd_curso').AsString := qyCursosMestreCD_CURSO.AsString;
               ParamByName('cd_coligada').AsInteger := StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
               ExecSQL();
            end;
         end else begin
            qryGetDptoByColigada.Close;
            qryGetDptoByColigada.ParamByName('coligada').AsInteger :=  StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
            qryGetDptoByColigada.open;
            qyCursosColigadas.Insert();
            qyCursosColigadas.FieldByName('CD_COLIGADA').AsInteger := StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
            qyCursosColigadas.FieldByName('CD_CURSO').AsString := qyCursosMestreCD_CURSO.Value;

            if cbDepartamento.ItemIndex > 0 then
            begin
               qyCursosColigadas.FieldByName('CD_DEPTO').AsInteger := StrToInt(
                  TItemCombo(cbDepartamento.Items.Objects[cbDepartamento.ItemIndex]).getCodigo()
               );
            end else begin
               qyCursosColigadas.FieldByName('CD_DEPTO').AsInteger := qryGetDptoByColigada.FieldByName('CODIGO').AsInteger;
            end;

            qyCursosColigadas.Post();
         end;

         if DM.UsuarioLogado.TemPermissao( 1006, npAlterar, False, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then
         begin
            qyCursosColigadas.Edit();
            dbcbGrade.SetFocus();
         end;
         dbnCursosColigadas.Enabled := true;
         //       dbeGrade.
      end else begin
         ckbUtilizarCurso.Checked := not ckbUtilizarCurso.Checked;
      end;
   end
   else
   begin
   
      if not DM.UsuarioLogado.TemPermissao( 1006, npExcluir, True, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then
      begin
         ckbUtilizarCurso.Checked := not ckbUtilizarCurso.Checked;
         Exit;
      end;

      DM.CriarConsulta(qyVerificaCursoColigada);

      qyVerificaCursoColigada.Close();
      qyVerificaCursoColigada.SQL.Clear();
      qyVerificaCursoColigada.SQL.Text := ' SELECT COUNT(CD_CURSO) AS registros FROM cursos_coligadas WHERE cd_curso = :cd_curso AND sn_ativo = 1 ';
      qyVerificaCursoColigada.ParamByName('cd_curso').AsString := qyCursosMestreCD_CURSO.AsString;
      qyVerificaCursoColigada.Open();

      if qyVerificaCursoColigada.FieldByName('registros').AsInteger = 1 then
      begin
         Mensagem('O curso selecionado deve possuir ao menos uma coligada vinculada a ele.', 'Aviso', MB_ICONWARNING + MB_OK, Handle);
         ckbUtilizarCurso.Checked := True;
         Exit;
      end;

      bFazer := Mensagem('Você está prestes a Desabilitar o curso de '+qyCursosMestreDS_CURSO.Value+
         ', da Unidade de Ensino '+TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getDescricao()+'.'+CHR(13)+
         'Deseja Prosseguir?',
         'Desabilitar Curso', MB_YESNO+MB_ICONQUESTION, Handle) = mrYes;
      
      if (bFazer) then
      begin
         qyCursosColigadas.Edit();
         qyCursosColigadas.FieldByName('sn_ativo').AsInteger := 0;
         qyCursosColigadasCD_CURSO.AsString := qyCursosMestreCD_CURSO.AsString;
         qyCursosColigadasCD_COLIGADA.AsInteger := StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo);
         qyCursosColigadasCD_DEPTO.AsInteger := qyCursosMestreCD_DEPTO.AsInteger;
         qyCursosColigadas.Post();
         dbnCursosColigadas.Enabled := false;
      end
      else
      begin
         ckbUtilizarCurso.Checked := not ckbUtilizarCurso.Checked;
      end;
   end;

   qyCursosColigadas.Close();
   qyCursosColigadas.ParamByName('COLIGADA').AsInteger :=  StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ;
   qyCursosColigadas.Open();
   // Desativado o comando abaixo, pois ele faz uma atualização desnecessária, perdendo a posição da ultima coligada selecionada.
   // qyCursosMestre.Locate( 'CD_CURSO', codCurso, [loPartialKey] );

end;

function TfrmCursos.validaCodigoTurma(codigo: string): boolean;
var
   bRes : boolean;
   {bRegExp : string;}
begin
   bRes := True;
   
   {bRegExp := '^[\sa-zA-Z0-9]+$';}
     
   if not ExecRegExpr(expressaoRegularCodigoTurma,codigo) then
      bRes := False;
      
   Result := bRes;
end;

procedure TfrmCursos.verificaPermissoes;
begin
   { Definir as permissões para aguia TURMAS}
   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.CursosTurmas.Turmas.Responsavel',npAcesso, False) then
      DBEditResp2.Enabled := true
   else
      DBEditResp2.Enabled := false;

   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.CursosTurmas.Turmas.Responsavel',npAcesso, False) then
      DBEditResp1.Enabled := true
   else
      DBEditResp1.Enabled := false;

   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.CursosTurmas.Turmas.UnidadeCertificadora',npAcesso, False) then
      DBLCunidadeCertificadora.Enabled := true
   else
      DBLCunidadeCertificadora.Enabled := false;   

   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.CursosTurmas.Turmas.Situacao',npAcesso, False) then
      dblSituacao.Enabled := true
   else
      dblSituacao.Enabled := false;

   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.CursosTurmas.Turmas.Situacao',npAcesso, False) then
      sbLimpa.Enabled := true
   else
      sbLimpa.Enabled := false;   

   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.CursosTurmas.Turmas.Grade',npAcesso, False) then
      DBLookupComboBox5.Enabled := true
   else
      DBLookupComboBox5.Enabled := false; 
end;

function TfrmCursos.verificaPodeExcluirTurma(anosemestre: integer;
  turma: string): boolean;
CONST
   SQL_BUSCA_MATRICULAS = 'SELECT COUNT(*) as qtd FROM matriculas m WHERE '+
      'm.anosemestre = :anosemestre AND m.turma = :turma';
   SQL_BUSCA_FICHAINDIVIDUAL = 'SELECT COUNT(*) as qtd FROM fichaindividual f WHERE '+
      'f.anosemestre = :anosemestre AND f.turma = :turma';
   SQL_BUSCA_TURMASPROFESSORES = 'SELECT COUNT(*) as qtd FROM turmasprofessores tp WHERE '+
      'tp.anosemestre = :anosemestre AND tp.turma = :turma';      
var
   qyVerificaPossuiVinculoTurma: TUMZQuery;
begin

   Result := true;

   DM.CriarConsulta(qyVerificaPossuiVinculoTurma);

   qyVerificaPossuiVinculoTurma.SQL.Text := SQL_BUSCA_MATRICULAS;
   qyVerificaPossuiVinculoTurma.ParamByName('anosemestre').AsInteger := anosemestre;
   qyVerificaPossuiVinculoTurma.ParamByName('turma').AsString        := turma;
   qyVerificaPossuiVinculoTurma.Open;

   if qyVerificaPossuiVinculoTurma.FieldByName('qtd').AsInteger > 0 then
   begin
      Mensagem('A turma selecionada não pode ser removida pois já existem professores e alunos relacionados.');
      Result := false;
   end;

   qyVerificaPossuiVinculoTurma.Close;
   qyVerificaPossuiVinculoTurma.SQL.Text := SQL_BUSCA_FICHAINDIVIDUAL;
   qyVerificaPossuiVinculoTurma.ParamByName('anosemestre').AsInteger := anosemestre;
   qyVerificaPossuiVinculoTurma.ParamByName('turma').AsString        := turma;
   qyVerificaPossuiVinculoTurma.Open;

   if (qyVerificaPossuiVinculoTurma.FieldByName('qtd').AsInteger > 0) and Result then
   begin
      Mensagem('A turma selecionada não pode ser removida pois já existem professores e alunos relacionados.');
      Result := false;
   end;

   qyVerificaPossuiVinculoTurma.Close;
   qyVerificaPossuiVinculoTurma.SQL.Text := SQL_BUSCA_TURMASPROFESSORES;
   qyVerificaPossuiVinculoTurma.ParamByName('anosemestre').AsInteger := anosemestre;
   qyVerificaPossuiVinculoTurma.ParamByName('turma').AsString        := turma;
   qyVerificaPossuiVinculoTurma.Open;

   if (qyVerificaPossuiVinculoTurma.FieldByName('qtd').AsInteger > 0) and Result then
   begin
      Mensagem('A turma selecionada não pode ser removida pois já existem professores e alunos relacionados.');
      Result := false;
   end;

   FreeAndNil(qyVerificaPossuiVinculoTurma);

end;

procedure TfrmCursos.VerificaTurmaInPlanoPagamento;
const
   SQL_VERIFICATURMAPLANOPADRAO =
      ' SELECT CD_PLANO FROM FIN_PLANOS_TURMAS ' +
      ' WHERE CD_PLANO = :CD_PLANO AND CD_CURSO = :CD_CURSO AND CD_TURMA = :CD_TURMA ';
   SQL_INSERETURMAPLANOPADRAO =
      ' INSERT INTO FIN_PLANOS_TURMAS ( CD_PLANO, CD_CURSO, CD_TURMA ) ' +
      ' VALUES ( :CD_PLANO, :CD_CURSO, :CD_TURMA ) ';
var
   qyVerificaInsereTurmaPlano: TUMZQuery;
begin
   if tblTurmasCD_PLANO_PADRAO.IsNull then Exit;

   DM.CriarConsulta(qyVerificaInsereTurmaPlano);

   qyVerificaInsereTurmaPlano.Close();
   qyVerificaInsereTurmaPlano.SQL.Text := SQL_VERIFICATURMAPLANOPADRAO;
   qyVerificaInsereTurmaPlano.ParamByName('CD_PLANO').AsInteger := tblTurmasCD_PLANO_PADRAO.AsInteger;
   qyVerificaInsereTurmaPlano.ParamByName('CD_CURSO').AsString := tblTurmasCurso.AsString;
   qyVerificaInsereTurmaPlano.ParamByName('CD_TURMA').AsString := tblTurmasCodigo.AsString;
   qyVerificaInsereTurmaPlano.Open();

   if ( qyVerificaInsereTurmaPlano.RecordCount = 0 ) then
   begin
      qyVerificaInsereTurmaPlano.Close();
      qyVerificaInsereTurmaPlano.SQL.Text := SQL_INSERETURMAPLANOPADRAO;
      qyVerificaInsereTurmaPlano.ParamByName('CD_PLANO').AsInteger := tblTurmasCD_PLANO_PADRAO.AsInteger;
      qyVerificaInsereTurmaPlano.ParamByName('CD_CURSO').AsString := tblTurmasCurso.AsString;
      qyVerificaInsereTurmaPlano.ParamByName('CD_TURMA').AsString := tblTurmasCodigo.AsString;
      qyVerificaInsereTurmaPlano.ExecSQL();
   end;

   FreeAndNil(qyVerificaInsereTurmaPlano);
end;

procedure TfrmCursos.tblTurmasPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErroBanco( DataSet, E );  
end;

procedure TfrmCursos.dtcColigadasDataChange(Sender: TObject; Field: TField);
begin
   tmSelecaoColigada.Enabled := not FDisableTimers;
end;

procedure TfrmCursos.dtcCursosColigadasStateChange(Sender: TObject);
begin
  // Turma visivel os campos
  dbcbGrade.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeCargaHoraria.Enabled:= TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeDiasLetivos.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeCursosEquivalentes.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeDuracaoHorasAula.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeNomeEtapa.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeQtdEtapas.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeContrato.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeRequerimento.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeCodigoMec.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeGrauMec.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbeHabilitacaoMec.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbcbGrade.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbcbDepartamento.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  dbmeObservacoes.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnMostrarGradeCurso.Enabled := not (TDataSource( Sender ).State in [dsEdit, dsInsert]);
end;

procedure TfrmCursos.dtcCursosMestreDataChange(Sender: TObject; Field: TField);
const
   SSQLFindColigada = ''
      + 'SELECT '
      + '	c.cd_coligada '
      + 'FROM '
      + '	coligadas c '
      + 'WHERE '
      + '	EXISTS ( '
      + '		SELECT '
      + '			cc.CD_CURSO '
      + '		FROM '
      + '			cursos_coligadas cc '
      + '		WHERE '
      + '			c.cd_coligada = cc.CD_COLIGADA AND '
      + '			cc.CD_CURSO = ? AND '
      + '			cc.SN_ATIVO = 1 '
      + '	) '
      + 'ORDER BY '
      + '	c.nm_coligada '
      + 'LIMIT '
      + '	1 ';
var
   Stmt: IZPreparedStatement;
   ResultSet: IZResultSet;
   I: Integer;
   ColigadaId: AnsiString;
   Item: TItemCombo;
begin
   ColigadaId := '';
   
   Stmt := PrepareStatement(SSQLFindColigada);
   try
      Stmt.SetString(1, qyCursosMestreCD_CURSO.AsString);
      ResultSet := Stmt.ExecuteQueryPrepared;
      try
         if ResultSet.Next then
            ColigadaId := ResultSet.GetString(1);
      finally
         ResultSet.Close;
         ResultSet := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if ColigadaId <> '' then
   begin
      for I := 0 to cbColigadas.Items.Count - 1 do
      begin
         Item := TItemCombo(cbColigadas.Items.Objects[I]);

         if Item.codigo = ColigadaId then
         begin
            cbColigadas.ItemIndex := I;
            Break;
         end;
      end;
   end;

   tmSelecaoCurso.Enabled := not FDisableTimers;
//   OnSelectCurso;
end;

procedure TfrmCursos.dtcCursosMestreStateChange(Sender: TObject);
var
   permissao : TUMNivelPermissao;
begin

   if qyCursosMestre.State = dsInsert then
   begin
      grdColigadas.Enabled := False;
   end
   else
   begin
      grdColigadas.Enabled := True;
   end;

  {Habilitando e Desabilitando os botoes}
   if pcGeral.ActivePage <> tsCursos then Exit;

   if ( qyCursosMestre.State = dsInsert ) then
      permissao := npIncluir
   else
      permissao := npAlterar;

   if ( qyCursosMestre.State in [dsInsert, dsEdit] ) and
      (NOT(DM.UsuarioLogado.TemPermissao( 1006, permissao, True ))) then
   begin
      qyCursosMestre.Cancel;      
   end;
  
   btnIncluir.Enabled     := qyCursosMestre.State in [dsBrowse];
   btnAlterar.Enabled     := qyCursosMestre.State in [dsBrowse];
   btnSalvar.Enabled      := qyCursosMestre.State in [dsEdit, dsInsert];
   { ALTERACAO_CURSOS
   btnRenomearCurso.Enabled:= TDataSource( Sender ).State in [dsEdit, dsInsert];
   }
   btnExcluir.Enabled     := qyCursosMestre.State in [dsBrowse];
   btnCancelar.Enabled    := qyCursosMestre.State in [dsEdit, dsInsert];

   btnRenomearCurso.Enabled := (qyCursosMestre.State in [dsEdit]);

   { ALTERACAO_CURSOS
   dbeCodigo.Enabled := (tblCursos.State in [dsInsert,dsEdit]);
   dbeCursosAnoSem.Enabled := (tblCursos.State in [dsInsert,dsEdit]);
   }
end;

procedure TfrmCursos.txtAnoSemestreCursosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin

    Key := #0;
  end;
end;


procedure TfrmCursos.dtcDiscStateChange(Sender: TObject);
begin

  if pcGeral.ActivePage <> tsDisciplinas then Exit;

  btnIncluir.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (tblEmentas.State in [dsBrowse, dsInactive]) ;
  btnAlterar.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (tblEmentas.State in [dsBrowse, dsInactive]) ;
  btnSalvar.Enabled      := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (tblEmentas.State in [dsInsert, dsEdit]) ;

  {  ALTERACAO_CURSOS
  btnRenomearCurso.Enabled   := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (tblEmentas.State in [dsInsert, dsEdit]) ;
  }
  btnRenomearTurma.Enabled   := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
			    (tblEmentas.State in [dsInsert, dsEdit]) ;
  btnExcluir.Enabled     := (TDataSource( Sender ).State in [dsBrowse]) and
			    (tblEmentas.State in [dsBrowse, dsInactive]) ;
  btnCancelar.Enabled    := (TDataSource( Sender ).State in [dsEdit, dsInsert]) OR
                            (tblEmentas.State in [dsInsert, dsEdit]) ;
End;


procedure TfrmCursos.tblDiscNewRecord(DataSet: TDataSet);
begin
  DM.qAux2.Close;
  DM.qAux2.SQL.Clear;
  Dm.qAux2.SQL.Add( 'select Max(Codigo) from Disciplinas where' );
  Dm.qAux2.SQL.Add( 'Curso = :Curso');
  Dm.qAux2.ParamByName('Curso').AsString := qyCursosMestreCD_CURSO.AsString;
  Dm.qAux2.Open;
  if not Dm.qAux2.IsEmpty then
     tblDiscCodigo.AsInteger := Dm.qAux2.Fields[0].AsInteger + 1;
  tblDiscCurso.AsString := qyCursosMestreCD_CURSO.AsString;
end;

procedure TfrmCursos.qDocumentosNecessariosAfterInsert(DataSet: TDataSet);
begin
   qDocumentosNecessariosCurso.AsString := qyCursosMestreCD_CURSO.AsString;
end;

procedure TfrmCursos.qDocumentosNecessariosAfterPost(DataSet: TDataSet);
begin
  grdDoc.SetFocus;
end;

procedure TfrmCursos.dsDocumentosNecessariosStateChange(Sender: TObject);
begin
  if pcGeral.ActivePage <> tsDocumentos then Exit;

  btnIncluir.Enabled       := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled       := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled        := TDataSource( Sender ).State in [dsEdit, dsInsert];
  { ALTERACAO_CURSOS
  btnRenomearCurso.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  }
  btnRenomearTurma.Enabled := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled       := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
end;

procedure TfrmCursos.pcEmentaChange(Sender: TObject);
begin
   if pcEmenta.ActivePageIndex in [1, 2, 3, 5, 6] then
   begin
      sbBibNegrito.Visible := True;
      sbBibItalico.Visible := True;
      sbBibSublinhado.Visible := True;
      sbBibNegrito.Enabled := tblEmentas.State in dsEditModes;
      sbBibItalico.Enabled := tblEmentas.State in dsEditModes;
      sbBibSublinhado.Enabled := tblEmentas.State in dsEditModes;
   end
   else
   begin
      sbBibNegrito.Visible := False;
      sbBibItalico.Visible := False;
      sbBibSublinhado.Visible := False;
   end;
end;

procedure TfrmCursos.pcGeralChange(Sender: TObject);
begin
   case pcGeral.TabIndex of
      0: begin // Cursos
         if not DM.UsuarioLogado.TemPermissao( 1006, npAcesso, True ) then
         begin
            pcGeral.TabIndex := pcGeral.Tag;
            Exit;
         end else begin
            if pcGeral.TabIndex <> 1 then
               mostraAba(pnCursos);
         end;
      end;

      1: begin // Turmas
         if not DM.UsuarioLogado.TemPermissao( 1148, npAcesso, True ) then
         begin
            pcGeral.TabIndex := pcGeral.Tag;
            Exit;
         end else begin

             tblDisc.Open;
            
             // carrega as turmas para o curso e anosemestre atual

             if not qUnidadesCertificadoras.Active then
                qUnidadesCertificadoras.Open;

             if not tblTurnos.Active then
                tblTurnos.Open;

             if not qrySituacoesTurmas.Active then
                qrySituacoesTurmas.Open;

             if not qyConta.Active then begin
                if (dm.db.Protocol = DB_PROTOCOL_MYSQL)then begin
                   qyConta.sql.text := 'SELECT cd_caixa, ds_caixa FROM fin_cadastro_contas WHERE cd_coligada IN (' + Dm.GetColigadas() + ' )'+ ' ORDER BY ds_caixa ';
                end else begin
                   qyConta.sql.text := 'SELECT CAST(cd_caixa AS NUMBER(9)) cd_caixa, ds_caixa FROM fin_cadastro_contas WHERE cd_coligada IN (' + Dm.GetColigadas() + ' )'+ ' ORDER BY ds_caixa ';
                end;
                qyConta.Open();
             end;

             if not qyListaGrades.Active then
                qyListaGrades.Open();

             carregarTurmas();

             pgTurmas.ActivePage := TabSheet4;


             DBLookupComboBox10.Enabled := DM.UsuarioLogado.TemPermissao(
               1997,
               npAlterar,
               False
             );

             sbLimparConta.Enabled := DM.UsuarioLogado.TemPermissao(
               1997,
               npAlterar,
               False
             );

             DBCheckBox5.Enabled := DM.UsuarioLogado.TemPermissao(
               1997,
               npAlterar,
               False
             );

             mostraAba(pnTurmas);

             verificaPermissoes;

             btnCopiarTurma.Enabled := DM.UsuarioLogado.TemPermissao( 1198, npAlterar, False );

         end;
      end;

      2: begin // Disciplinas
         if not DM.UsuarioLogado.TemPermissao( 1112, npAcesso, True ) then
         begin
            pcGeral.TabIndex := pcGeral.Tag;
            Exit;
         end else
            carregarDisciplinasPai();
            tblDisc.Close;
            tblDisc.SQL.Clear;
            tblDisc.SQL.Add(
               ' SELECT '
               + '   cd_disciplina_pai,'
               + '   id_disciplina, '
               + '   codigo, '
               + '   ordem, '
               + '   curso, '
               + '   sigla, '
               + '   descricao, '
               + '   ementa_backup, '
               + '   qtd_frases_fixas, '
               + '   cd_disc_mec, '
               + '   sn_bloqueado, '
               + '   sn_ementa_padrao, '
               + '   sn_exporta_moodle, '
               + '   sn_ativo '
               + ' FROM ' 
               + '   disciplinas ' 
               + ' WHERE'
               + '   Curso = :Codigo AND '
               + '   sn_ativo = 1 '
            );
            tblDisc.SQL.Add( ' Order By Descricao ' );
            tblDisc.ParamByName('Codigo').AsString := qyCursosMestreCD_CURSO.AsString;
            tblDisc.Open;
            
            mostraAba(pnDisciplinas);
      end;

      3: begin // Grade Curricular
         if not DM.UsuarioLogado.TemPermissao( 1149, npAcesso, True ) then
         begin
            pcGeral.TabIndex := pcGeral.Tag;
            Exit;
         end else begin
            RecarregarTotaisGC();
            RecarregarFiltroEtapas();

            bIncluirGrade := DM.UsuarioLogado.TemPermissao(
               1149,
               npIncluir,
               False
             );

            bAlterarGrade := DM.UsuarioLogado.TemPermissao(
               1149,
               npAlterar,
               False
             );

            bExcluirGrade := DM.UsuarioLogado.TemPermissao(
               1149,
               npExcluir,
               False
             );

            btnIncluir.Enabled := bIncluirGrade;
            btnAlterar.Enabled := bAlterarGrade;
            btnExcluir.Enabled := bExcluirGrade;

            mostraAba(pnGradeCurricular);
         end;
      end;

      4: begin // Documentos
         if not DM.UsuarioLogado.TemPermissao( 1150, npAcesso, True ) then
         begin
            pcGeral.TabIndex := pcGeral.Tag;
            Exit;
         end else
            qDocumentos.Open();
            qDocumentosNecessarios.Open();
            mostraAba(pnDocumentosNecessarios);
      end;

   end;
  if pcGeral.ActivePage = tsCursos then begin
    btnIncluir.Enabled     := qyCursosMestre.State in [dsBrowse];
    btnAlterar.Enabled     := qyCursosMestre.State in [dsBrowse];
    btnSalvar.Enabled      := qyCursosMestre.State in [dsEdit, dsInsert];

    btnExcluir.Enabled     := qyCursosMestre.State in [dsBrowse];
    btnCancelar.Enabled    := qyCursosMestre.State in [dsEdit, dsInsert];
  end
  else
  if pcGeral.ActivePage = tsDocumentos Then
  Begin
     if not qDocumentos.Active Then qDocumentos.Active := True;
     if not qDocumentosNecessarios.Active Then qDocumentosNecessarios.Active := TRue;
  End;
   if pcGeral.ActivePage = tsTurmas Then
   begin
      if Trim(qyCursosColigadasDS_NOME_ETAPA.AsString) <> '' Then
      begin
         lbTurmaEtapa.Caption := qyCursosColigadasDS_NOME_ETAPA.AsString
      end
      else
      begin
         lbTurmaEtapa.Caption := 'Etapa';
      end;
   end;

   if pcGeral.ActivePage = tsGrade Then
   begin
      qyGrades.Open;
   end;

   if pcGeral.ActivePage = tsDisciplinas then
   begin
      pcEmenta.TabIndex := 0;
   end;
end;

procedure TfrmCursos.dbeDataFimExit(Sender: TObject);
begin
   if (tblTurmas.State in [dsEdit, dsInsert]) and
      (tblTurmasDataFim.AsString <> '') and
      (tblTurmasDataConclusao.AsString = '') then
   begin
      tblTurmasDataConclusao.AsDateTime := tblTurmasDataFim.AsDateTime;
   end;
end;

procedure TfrmCursos.dbeDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
     SelectNext(ActiveControl,True,True);
     Key := #0;
   end
   else
   begin
      if (dbSiglaDisc.Text = dbCodDiscPai.Text) and
         (tblDisc.State in [dsInsert]) then
      begin
         dbCodDiscPai.Tag := 1;
      end;
   end;
end;

procedure TfrmCursos.dbeSemanasLetivasNKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
   end;
end;

procedure TfrmCursos.dbeTurmaChange(Sender: TObject);
var
   x: string;
begin
   if dbeTurma.Enabled then
   begin
      if dbeTurma.Focused() then
      begin
         if tbKeyIsDown(VK_CONTROL) AND tbKeyIsDown(Ord('V')) then
         begin
            dbeTurma.Text := '';
         end;
      end;

      if expressaoRegularCodigoTurma <> '' then
      begin
         if not validaCodigoTurma(copy(dbeTurma.Text,length(dbeTurma.Text),1)) then
         begin
            x := dbeTurma.Text;
            delete(x,length(x),1);
            dbeTurma.Text := x;
            dbeTurma.SetFocus;
            dbeTurma.Selstart := Length(dbeTurma.text);
         end;
      end;
   end;
end;

procedure TfrmCursos.dbeTurmaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   dbeTurma.Selstart := Length(dbeTurma.text);
end;

procedure TfrmCursos.dbnAtosOficiaisClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbEdit then begin
    alterarAtosOficiais();
  end
  else if Button = nbInsert then
  begin
    inserirAtosOficiais();
  end;
end;

procedure TfrmCursos.dbnCursosColigadasClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   if Button = nbEdit then
      if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then
         qyCursosColigadas.Cancel();
end;

procedure TfrmCursos.dbreBibBasicaSelectionChange(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   RichEdit := TCustomRichEdit(Sender);
   sbBibNegrito.Down := fsBold in RichEdit.SelAttributes.Style;
   sbBibItalico.Down := fsItalic in RichEdit.SelAttributes.Style;
   sbBibSublinhado.Down := fsUnderline in RichEdit.SelAttributes.Style;
end;

procedure TfrmCursos.dbrgProxTurmaChange(Sender: TObject);
begin
   if dtcTurmas.State in [dsInsert, dsEdit] then
   begin
      // Limpa o próximo Curso/Turma selecionados
      tblTurmas.FieldByName('cd_proximo_curso').Clear;
      tblTurmas.FieldByName('cd_proxima_turma').Clear;
      tblTurmas.FieldByName('cd_proxima_turma_repr').Clear;
   end;

   // Se a próxima turma pertence ao mesmo curso
   if dbrgProxTurma.ItemIndex = 0 then
   begin
      selecionaTipoProxTurma(false);

   // Se a próxima turma pertence a outro curso
   end else if dbrgProxTurma.ItemIndex = 1 then
   begin
      selecionaTipoProxTurma(true);

   end;
end;

procedure TfrmCursos.deletarAtosOficiais;
begin
   if Mensagem('Deseja excluir este registro?',Application.Title,
      MB_YESNO + MB_ICONQUESTION, Handle) = ID_NO then
   begin
      Abort;
   end;
end;

procedure TfrmCursos.DBEHorasAulaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    pgTurmas.ActivePageIndex := 1;
    dbeDatainicio.SetFocus;
    Key := #0;
  end;

end;

procedure TfrmCursos.dbeHoraFimKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    pgTurmas.ActivePageIndex := 2;
    mmHistTurma.SetFocus;
    Key := #0;
  end;

end;



procedure TfrmCursos.dbcbProxTurmaMesmoAnosemestreClick(Sender: TObject);
begin
   qyListaProximaTurma.Close();
   qyListaProximaTurmaRepr.Close();
   qyListaProximaTurma.ParamByName('curso').AsString       := tblTurmas.FieldByName('curso').AsString;
   qyListaProximaTurmaRepr.ParamByName('curso').AsString       := tblTurmas.FieldByName('curso').AsString;
   // qyListaProximaTurma.ParamByName('cd_coligada').AsString := tblTurmas.FieldByName('cd_coligada').AsString;

   if dbcbProxTurmaMesmoAnosemestre.Checked = true then
   begin
      qyListaProximaTurma.ParamByName('nr_anosemestre').AsString := tblTurmasAnoSemestre.AsString;
      qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsString := tblTurmasAnoSemestre.AsString;
   end else begin
      if ( trim(tblTurmas.FieldByName('anosemestre').AsString) <> '' ) then
      begin
         if ano_semestre_incremento <> qyCursosMestreNR_INCREMENTO.AsInteger then
         begin
            ano_semestre_incremento := qyCursosMestreNR_INCREMENTO.AsInteger;
         end;

         if ano_semestre_incremento = 1 then
         begin
            if (tblTurmasAnoSemestre.AsInteger mod 2) = 0 then
            begin
               qyListaProximaTurma.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 9;
               qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 9;
            end;

            if (tblTurmasAnoSemestre.AsInteger mod 2) <> 0 then
            begin
               qyListaProximaTurma.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 1;
               qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsInteger :=
                  tblTurmasAnoSemestre.AsInteger + 1;
            end;
         end;

         if ano_semestre_incremento = 2 then
         begin
            qyListaProximaTurma.ParamByName('nr_anosemestre').AsInteger :=
               tblTurmasAnoSemestre.AsInteger + 10;
            qyListaProximaTurmaRepr.ParamByName('nr_anosemestre').AsInteger :=
               tblTurmasAnoSemestre.AsInteger + 10;
         end;

      end;
   end;
   qyListaProximaTurma.Open();   
   qyListaProximaTurmaRepr.Open();
end;

procedure TfrmCursos.dbchDataInicioFimCronogramaClick(Sender: TObject);
begin
   dbeDatainicio.Enabled := not dbchDataInicioFimCronograma.Checked;
   dbeDataFim.Enabled := not dbchDataInicioFimCronograma.Checked;
end;

procedure TfrmCursos.dbCodDiscPaiEnter(Sender: TObject);
begin
   PrincipalForm.MostraHint2(Sender);
end;

procedure TfrmCursos.dbCodDiscPaiKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
  begin
    SelectNext(ActiveControl,True,True);
    Key := #0;
  end;
end;

function TfrmCursos.tbKeyIsDown(const Key: integer): boolean;
begin
   Result := GetKeyState(Key) and 128 > 0;
end;

procedure TfrmCursos.tblAvaliacoes_ParametrosBeforeOpen(DataSet: TDataSet);
begin
   tblAvaliacoes_Parametros.ParamByName('cd_coligada_matriz').AsInteger :=
      DM.GetUsuarioLogado.GetColigadaLogada.Codigo;
end;

procedure TfrmCursos.tblCursosAvaliacao_Descricao_formaGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
   if Sender.AsString = '1' Then
      Text := '1 - Descrição por Disciplina';
   if Sender.AsString = '2' Then
      Text := '2 - Descrição por Área';
   if Sender.AsString = '3' Then
      Text := '3 - Descrição por Aluno';
end;

procedure TfrmCursos.FormShow(Sender: TObject);
var
   qyVerificaMaisculo: TUMZQuery;
begin
   expressaoRegularCodigoTurma := DM.variavel_nu_parametro('Academico.expressao_regular_codigo_turma');

   DM.MontarPlanilha(grdGrade, 'planilha_grades_disciplinas_campos');
   HabilitarCamposMoodle( DM.UtilizaMoodle() AND NOT ( DM.lite ) );

   DM.BloquearComponenteAnosemestre(grdTurmas, 'AnoSemestre');

  { Todas em maiúsculas }
   dm.CriarConsulta(qyVerificaMaisculo);

   qyVerificaMaisculo.SQL.Text := '' +
   'Select ds_valor ' +
   'FROM parametros ' +
   'WHERE ds_variavel = ''descricao_disciplina_maisculo''';

   qyVerificaMaisculo.Open;

   // Define o CHAR CASE como Normal,
   // Permitir letras minusculas e maiusculas
   dbDescDisc.CharCase := ecNormal;

   if qyVerificaMaisculo.FieldByName('ds_valor').asString = 'S' then
   begin
      // Define o CHAR CASE como UpperCase,
      // Permitir APENAS letras maiusculas
      dbDescDisc.CharCase := ecUpperCase;
   end;
   
   CarregaComboAvaliacoes();
   CarregaComboGrau();
   mostraAba(pnCursos);

   UMFiltroDataAnoSem.UsaAnoSemestre := DM.UsaAnosemestre;
   UMFiltroDataAnoSem.setAnosemestreInicial(ano_semestre);

   FiltraCursos;

   qyCursosMestre.First();

   qyTitulacao.Open;

   verificaPermissoes;

   // Ajusta posição dos componentes de [Rematricula] > Próxima Turma da guia de turma
   Label55.Top := 90;
   dbeProxCurso.Top := 106;
   dbeProxTurmaOutroCurso.Top := 106;
   sbBuscaProxTurmaOutroCurso.Top := 106;
   sbLimpaProxTurmaOutroCurso.Top := 106;
   
   { Definir as primeiras guias como padrão }
   pcGeral.ActivePageIndex := 0;

   pgTurmas.ActivePageIndex := 0;
   pcEmenta.ActivePageIndex := 0;

   if (DM.variavel_parametro('grades_preencher_chtotal')='N') or
      (DM.variavel_parametro('grades_preencher_chtotal')='n') then
   begin
      lblCargaHorariaCurso.Visible := False;
      dbeCargaHorariaCurso.Visible := False;
      lblCargaHorariaComplementar.Visible := False;
      dbeCargaHorariaComplementar.Visible := False;
   end
   else
   begin
      lblCargaHorariaCurso.Visible := true;
      dbeCargaHorariaCurso.Visible := true;
      lblCargaHorariaComplementar.Visible := true;
      dbeCargaHorariaComplementar.Visible := true;

   end;

   FTelaCarregada := True;

   if DM.lite then
   begin
      cbDisciplinaPai.Visible := false;
      dbCodDiscPai.Visible := false;
      Label5.Visible := false;
      Label59.Visible := false;
      SpeedButton2.Visible := false;
      lblTitulacao.Visible := false;
      dblbTitulacao.Visible := false;
      sbMaisInformacoes.Visible := false;
      DBCheckBox3.Visible := false;
   end;
end;

procedure TfrmCursos.grdDocCellClick(Column: TColumn);
begin
   qDocumentosNecessarios.ApplyUpdates;
end;

procedure TfrmCursos.grdDocTitleClick(Column: TColumn);
var
  strAux : String;
begin
  case Column.Index of
    0 : strAux := 'order by Documentos.Codigo';
    1 : strAux := 'Order by Documentos.Documento';
    2 : strAux := 'Order by Documentos.Prazo';
    3 : strAux := 'Order by Documentos.Sigla';
  end;

  qDocumentosNecessarios.Close;
  qDocumentosNecessarios.SQL.Clear;
  qDocumentosNecessarios.SQL.Add( '  Select * From Documentos_Necessarios, Documentos ');
  qDocumentosNecessarios.SQL.Add( ' WHERE Documentos_Necessarios.Cod_Documento = Documentos.Codigo');
  qDocumentosNecessarios.SQL.Add( ' AND CURSO = :CD_CURSO');
  qDocumentosNecessarios.SQL.Add( strAux );
  qDocumentosNecessarios.Open;

end;

procedure TfrmCursos.DBEdit15KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    { ALTERACAO_CURSOS
    pgCursos.ActivePageIndex := 2;
    }
//    dbeDataCEE.SetFocus;
    Key := #0;
  end;
end;

procedure TfrmCursos.DBEdit3Exit(Sender: TObject);
begin
   { Verificar se a série é maior do que a qtd. de etapas }
   if  tblTurmasSerie.AsInteger > qyCursosColigadasNR_SERIES.AsInteger Then
   Begin
       Mensagem('Etapa da turma não pode ser maior que a quantidade de etapas.',  'Atenção', MB_OK + MB_ICONWARNING, Handle);
       Exit; 
   End;
end;

procedure TfrmCursos.dtcDiscDataChange(Sender: TObject; Field: TField);
var
   I, iSelecionado,codigoDiscCorrecao: Integer;
begin
   iSelecionado := -1;
   
 if (tblDisc.State in [dsEdit, dsInsert]) then begin
    //corrigir erro de ao clicar fora da grid salvar com valor zero o codigo da disc
    if (tblDiscCodigo.AsInteger = 0) then begin
    dbCodDisc.Text := IntToStr(tblEmentas.ParamByName('codigo').AsInteger);
    codigoDiscCorrecao := tblEmentas.ParamByName('codigo').AsInteger;
    grdDisc.Fields[0].AsInteger := codigoDiscCorrecao;
    end
    else
    begin
     dbCodDisc.Text := IntToStr(tblDiscCodigo.AsInteger);
    end;
 //---
 end;

   if (tblDisc.State in [dsEdit, dsInsert]) AND (cbDisciplinaPai.ItemIndex = 0) then
      Exit;

   for I := 0 to cbDisciplinaPai.Items.Count - 1 do
      if TItemCombo(cbDisciplinaPai.Items.Objects[I]).getCodigo() = tblDiscCD_DISCIPLINA_PAI.AsString then begin
         iSelecionado := I;
         break;
      end;

   cbDisciplinaPai.ItemIndex := iSelecionado;

   if (cbDisciplinaPai.ItemIndex = 0) then begin
      dbCodDiscPai.Text := '';
      dbCodDiscPai.Visible := true;
      label59.Visible := true;
   end
   else begin
     dbCodDiscPai.Visible := False;
     Label59.Visible := False;
   end;

   tblEmentas.Close;
   tblEmentas.ParamByName('codigo').AsInteger := tblDiscCodigo.AsInteger;
   tblEmentas.ParamByName('curso').AsString := tblDiscCurso.AsString;
   tblEmentas.Open;

   //
   if (tblDiscsn_ementa_padrao.AsInteger = 0) then
   begin
      DBNavigator1.VisibleButtons := [nbPrior,nbNext,nbInsert,nbDelete];
      HabilitaEmenta(true);
      sbBloqueiaValor.Down := False;
   end
   else
   begin
      HabilitaEmenta(false);
      DBNavigator1.VisibleButtons := [nbPrior,nbNext];
      sbBloqueiaValor.Down := True;
   end;


   sDisciplinaPaiAntiga := tblDiscCD_DISCIPLINA_PAI.AsString;
end;

procedure TfrmCursos.dtcDisciplinasStateChange(Sender: TObject);
begin
   dbCodDisc.Enabled := ( tblDisciplinas.State in [dsInsert] ) OR ( (tblDisciplinas.State in [dsEdit]) AND (tblDisciplinassn_bloqueado.AsInteger = 0) );
end;

procedure TfrmCursos.tblEmentasAfterInsert(DataSet: TDataSet);
begin
   if (not dbEmentaDisc.Focused) AND (not dbreBibBasica.Focused) AND (not dbreBibComp.Focused) AND (not dbreBibSup.Focused) AND (not dbObjetivo.Focused) AND (not dbreJustificativa.Focused) AND (not dbreHabilidadesCompetencias.Focused) then
      DBEdit5.SetFocus;
end;

procedure TfrmCursos.tblEmentasBeforeDelete(DataSet: TDataSet);
begin
   if Mensagem('Tem certeza que deseja remover a ementa selecionada?', 'Confirmação', MB_YESNO + MB_ICONQUESTION, Handle)
   <> mrYes Then Abort;

   DM.setLog(1006, 'Exclusao', tblEmentascurso.AsString + ';' + tblEmentascodigo.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, 'Ementa excluída');

end;

procedure TfrmCursos.tblEmentasNewRecord(DataSet: TDataSet);
begin
   tblEmentascodigo.AsInteger := tblDiscCodigo.ASInteger;
   tblEmentascurso.AsString := tblDiscCurso.AsString;
end;

procedure TfrmCursos.dsEmentasStateChange(Sender: TObject);
begin
   if tblEmentas.State in [dsEdit, dsInsert] then begin
      if not DM.UsuarioLogado.TemPermissao( 1112, npAlterar, True ) then begin
         tblEmentas.Cancel();
         Exit;
      end;      
   end;

   if (tblEmentas.State in dsEditModes) and
      (pcEmenta.ActivePageIndex in [1, 2, 3, 5, 6]) then
   begin
      sbBibNegrito.Enabled := True;
      sbBibItalico.Enabled := True;
      sbBibSublinhado.Enabled := True;
   end
   else
   begin
      sbBibNegrito.Enabled := False;
      sbBibItalico.Enabled := False;
      sbBibSublinhado.Enabled := False;
   end;
   dtcDiscStateChange(dtcDisc);
end;

function TfrmCursos.verificarDiplomaCurriculoDigitalDisciplina(idDisciplina: Integer; snExibirAviso: Boolean = True): boolean;
const
  SQL_VERIFICAR_GRADE_DISCIPLINA = 'SELECT ' +
                                      'g.id ' +
                                      'FROM ' +
                                        'disciplinas d ' +
                                        'INNER JOIN grades_disciplinas gd ON (gd.cd_curso = d.curso AND gd.CD_DISCIPLINA = d.codigo) ' +
                                        'INNER JOIN grades g ON (g.CD_GRADE = gd.CD_GRADE AND g.CD_CURSO = gd.CD_CURSO) ' +
                                      'WHERE ' +
                                        'd.id_disciplina = :id_disciplina AND ' +
                                        'g.SN_ATIVO = "S" ' +
                                      'LIMIT 1;';
var
  qyVerificarGradeDisciplina: TUMZQuery;
begin
   Result := True;

   if (idDisciplina > 0) then
   begin
     DM.CriarConsulta(qyVerificarGradeDisciplina);
     qyVerificarGradeDisciplina.SQL.Text := SQL_VERIFICAR_GRADE_DISCIPLINA;
     qyVerificarGradeDisciplina.Close;
     qyVerificarGradeDisciplina.ParamByName('id_disciplina').AsInteger := idDisciplina;
     qyVerificarGradeDisciplina.Open;

     if (not qyVerificarGradeDisciplina.eof) then
     begin
       Result := verificarDiplomaCurriculoDigital(qyVerificarGradeDisciplina.FieldByName('id').AsInteger, snExibirAviso);
     end;
   end;
end;

function TfrmCursos.verificarDiplomaCurriculoDigital(idGrade: Integer; snExibirAviso: Boolean = True): boolean;
const
  SQL_VERIFICA_CURRICULO_GRADE = 'SELECT id, enum_situacao FROM uni_diploma_curriculo_digital WHERE id_grade = :id_grade;';
var
  qyVerificarCurriculoGrade: TUMZQuery;
begin
  Result:= True;

  if (idGrade > 0) then
  begin
    DM.CriarConsulta(qyVerificarCurriculoGrade);
    qyVerificarCurriculoGrade.SQL.Text := SQL_VERIFICA_CURRICULO_GRADE;
    qyVerificarCurriculoGrade.Close;
    qyVerificarCurriculoGrade.ParamByName('id_grade').AsInteger := idGrade;
    qyVerificarCurriculoGrade.Open;

    if (not qyVerificarCurriculoGrade.Eof) then
    begin
      if (qyVerificarCurriculoGrade.FieldByName('id').AsInteger > 0) then
      begin
        if ((qyVerificarCurriculoGrade.FieldByName('enum_situacao').AsString = 'ENVIADO_COM_SUCESSO') OR
          (qyVerificarCurriculoGrade.FieldByName('enum_situacao').AsString = 'FINALIZADO')) then
        begin
          Result := False;

          if (snExibirAviso) then
          begin
            Mensagem('O registro selecionado não pode ser alterado ou removido, pois, possui vinculo com o currículo digital.');
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmCursos.dsGradesDataChange(Sender: TObject; Field: TField);
begin
   // inicialização para montar cores da grade
   bCor := false;
   iSerieAtual:= 0;
   RecarregarTotaisGC();
   RecarregarFiltroEtapas();

   // joga o cursor para a primeira coluna para validaçao do evento grdGradeColEnter()
   grdGrade.SelectedIndex := -1;
end;

procedure TfrmCursos.dsGradesDisciplinasDataChange(Sender: TObject;
  Field: TField);
begin
   CarregaComboFrentes();
end;

procedure TfrmCursos.dsGradesStateChange(Sender: TObject);
begin
   qyGradesDisciplinas.Tag := 1;
   qyGradesDisciplinas.ParamByName('CD_GRADE').AsInteger := qyGradesCD_GRADE.AsInteger;
   qyGradesDisciplinas.ParamByName('CD_CURSO').AsString := qyGradesCD_CURSO.AsString;
   qyGradesDisciplinas.Open();

   {Habilitando e Desabilitando os botoes}
   if pcGeral.ActivePage <> tsGrade then Exit;

   {
      Se o botão não estiver habilitado, é porque foi bloqueado pela permissao
   }
   if bIncluirGrade then
      btnIncluir.Enabled := TDataSource( Sender ).State in [dsBrowse];

   if bIncluirGrade OR bAlterarGrade then
   begin
      btnCopiarGrade.Enabled := True;
      btnPreRequisito.Enabled := True;
      btnMostrarDisciplinas.Enabled := True;
      btnPreRequisitoEspecial.Enabled := True;

      edGradeCodigo.Enabled := True;
      edGradeDescricao.Enabled := True;
      edGradeAnoSemestreInicial.Enabled := True;
      dbeCargaHorariaCurso.Enabled := True;
      dbeCargaHorariaComplementar.Enabled := True;
      dbePercMaxReprovacao.Enabled := True;
      DBCheckBox9.Enabled := True;
      DBCheckBox7.Enabled := True;

      btnCancelar.Enabled  := TDataSource( Sender ).State in [dsEdit, dsInsert];
      btnSalvar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
   end else
   begin
      btnCopiarGrade.Enabled := False;
      btnMostrarDisciplinas.Enabled := False;                                        
      btnPreRequisito.Enabled := False;
      btnPreRequisitoEspecial.Enabled := False;

      
      edGradeCodigo.Enabled := False;
      edGradeDescricao.Enabled := False;
      edGradeAnoSemestreInicial.Enabled := False;
      dbeCargaHorariaCurso.Enabled := False;
      dbeCargaHorariaComplementar.Enabled := False;
      dbePercMaxReprovacao.Enabled := False;
      DBCheckBox9.Enabled := False;
      DBCheckBox7.Enabled := False;

      btnCancelar.Enabled  := TDataSource( Sender ).State in [dsEdit, dsInsert];
      btnSalvar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];
   end;

   if bAlterarGrade then
      btnAlterar.Enabled := TDataSource( Sender ).State in [dsBrowse];

   if bExcluirGrade then
      btnExcluir.Enabled := TDataSource( Sender ).State in [dsBrowse];

   grdGrades.Enabled     := TDataSource( Sender ).State in [dsBrowse];
end;

function TfrmCursos.cancelarAlunosTurma(anosemestre: Integer; turma: String): Boolean;
const
   SQL_BUSCA_MATRICULAS = 'SELECT m.codigoaluno FROM matriculas m WHERE '+
      'm.anosemestre = :anosemestre AND m.turma = :turma AND m.situacao IN (1)';
   SQL_BUSCA_FICHAINDIVIDUAL = 'SELECT fi.codigoaluno, fi.situacao, fi.turma, fi.turmamatricula, fi.disciplina, fi.anosemestre FROM fichaindividual fi WHERE '+
      'fi.anosemestre = :anosemestre AND fi.turma = :turma AND fi.turma <> fi.turmamatricula AND fi.situacao IN (1)';
var
   qyAlunosMatriculaCancelar: TUMZQuery;
   qyAlunosOutraTurmaCancelar: TUMZQuery;
   totalAlunosMatriculados: Integer;
   pendenciaBiblioteca: Boolean;
   msg: String;
begin
   Result := True;

   DM.CriarConsulta(qyAlunosMatriculaCancelar);
   DM.CriarConsulta(qyAlunosOutraTurmaCancelar);

   // Busca os alunos que possuem matrícula na turma, que podem ser canceladas
   qyAlunosMatriculaCancelar.Close;
   qyAlunosMatriculaCancelar.SQL.Text := SQL_BUSCA_MATRICULAS;
   qyAlunosMatriculaCancelar.ParamByName('anosemestre').AsInteger := tblTurmasAnoSemestre.AsInteger;
   qyAlunosMatriculaCancelar.ParamByName('turma').AsString := tblTurmasCodigo.AsString;
   qyAlunosMatriculaCancelar.Open;

   // Busca os alunos que possuem vinculo com disciplinas da turma que será cancelada
   qyAlunosOutraTurmaCancelar.Close;
   qyAlunosOutraTurmaCancelar.SQL.Text := SQL_BUSCA_FICHAINDIVIDUAL;
   qyAlunosOutraTurmaCancelar.ParamByName('anosemestre').AsInteger := tblTurmasAnoSemestre.AsInteger;
   qyAlunosOutraTurmaCancelar.ParamByName('turma').AsString := tblTurmasCodigo.AsString;
   qyAlunosOutraTurmaCancelar.Open;

   // Verifica se a turma possui algum aluno que deva mudar de situação para cancelamento
   if (qyAlunosMatriculaCancelar.RecordCount > 0) or (qyAlunosOutraTurmaCancelar.RecordCount > 0) then
   begin
      msg := 'A turma possui '+ IntToStr(qyAlunosMatriculaCancelar.RecordCount) + ' aluno(s) matriculado(s) e '+
             IntToStr(qyAlunosOutraTurmaCancelar.RecordCount)+' aluno(s) que cursa(m) disciplina(s) nessa turma, '+
             'as disciplinas desses alunos vinculados a essa turma serão canceladas também.'+#13+
             'Você deseja realmente cancelar essa turma?';

      // Pergunta ao usuário se o mesmo deseja realmente cancelar a turma e todos alunos vinculados a mesma               
      if Mensagem(msg, 'Atenção', MB_YESNO+MB_ICONQUESTION, Handle) = mrYes then
      begin

         if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then
         begin
            Result := False;
            Exit;
         end;

         // CANCELA A MATRICULA DOS ALUNOS MATRICULADOS NESSA TURMA

         // Checa se os alunos possuem pendencia na biblioteca (obras não devolvidas ou multas em aberto)
         pendenciaBiblioteca := False;
         qyAlunosMatriculaCancelar.First;
         while not qyAlunosMatriculaCancelar.Eof do
         begin
            if dm.variavel_parametro('acad_saida_verifica_biblioteca', True) = '1'  then
            begin
               if VerificaBib(qyAlunosMatriculaCancelar.FieldByName('codigoaluno').AsInteger) = False then
               begin
                  pendenciaBiblioteca := True;
                  Break;
               end;
            end;
            qyAlunosMatriculaCancelar.Next;
         end;

         if pendenciaBiblioteca = True then
         begin

            if DM.UsuarioLogado.TemPermissao(dm.iCdPessoaLogado, 'Academico.Verifica.Pendecias.Biblioteca' , npAcesso, False) then
            begin
               msg := 'A turma que está tentando cancelar possui alunos com pendências na Biblioteca (obras não devolvidas ou multas em aberto).'+#13+
                      'Você deseja realmente cancelar essa turma?';
               if Mensagem(msg, 'Atenção', MB_YESNO+MB_ICONQUESTION, Handle) = mrNo then
               begin
                  Result := False;
                  Exit;
               end;
            end else begin
               Mensagem('Não é possível cancelar a turma, existem alunos com pendências na Biblioteca (obras não devolvidas ou multas em aberto).');
               Result := False;
               Exit;
            end;

         end;
         
         qyAlunosMatriculaCancelar.First;
         while not qyAlunosMatriculaCancelar.Eof do
         begin
            cancelarAluno(tblTurmasAnoSemestre.AsInteger, tblTurmasCurso.AsString, tblTurmasCodigo.AsString, qyAlunosMatriculaCancelar.FieldByName('codigoaluno').AsInteger);
            qyAlunosMatriculaCancelar.Next;
         end;

         // CANCELA A MATRÍCULA DOS ALUNOS MATRICULADOS EM OUTRAS TURMAS CURSANDO DISCIPLINAS NESSA TURMA
         qyAlunosOutraTurmaCancelar.First;
         while not qyAlunosOutraTurmaCancelar.Eof do
         begin
            cancelarDisciplinaAluno(
                  qyAlunosOutraTurmaCancelar.FieldByName('anosemestre').AsInteger,
                  qyAlunosOutraTurmaCancelar.FieldByName('turma').AsString,
                  qyAlunosOutraTurmaCancelar.FieldByName('turmamatricula').AsString,
                  qyAlunosOutraTurmaCancelar.FieldByName('disciplina').AsInteger,
                  qyAlunosOutraTurmaCancelar.FieldByName('situacao').AsInteger,
                  qyAlunosOutraTurmaCancelar.FieldByName('codigoaluno').AsInteger
            );
                  
            qyAlunosOutraTurmaCancelar.Next;
         end;

         Mensagem('Operação realizada com sucesso.', 'Sucesso', MB_OK);

         Result := True;

      end else begin
         // Não processa a ação se a opção escolhida pelo usuário for Não
         Result := False;
      end;
   end;

end;

procedure TfrmCursos.cancelarDisciplinaAluno(anosemestre: Integer; turma: String; turmamatricula: String; disciplina: Integer; situacao: Integer; codigoAluno: Integer);
begin
   // Se estiver tentando fazer setar a situação da disciplina com a mesma que da matrícula, não precisa verificar se só tem 1 disciplina
   if ( ClasseDisciplinas.IsUltimaDisciplinaAtiva( anosemestre, turmamatricula, disciplina, codigoAluno, turma ) ) then
   begin
      cancelarAluno(anosemestre, tblTurmasCurso.AsString, turmamatricula, codigoAluno);
   end;

   Screen.Cursor := crHourGlass;

   // atualizacao da ficha individual
   Dm.qAux1.Close;
   DM.qAux1.SQL.Clear;

   Dm.qAux1.SQL.Add('update FichaIndividual set Situacao = :Situacao,');
   // Verifica se a situação é 3, 4, 5 ou 6 (cancelamento, trancamento, desistência ou abandono)
   // Caso sim então seta a data de saida do aluno com a data atual, caso contrário limpa a data de saída
   Dm.qAux1.SQL.Add('dt_saida = now()');
   Dm.qAux1.SQL.Add('where');
   Dm.qAux1.SQL.Add('CodigoAluno = :CodigoAluno and');
   Dm.qAux1.SQL.Add('Turma = :Turma and');
   Dm.qAux1.SQL.Add('AnoSemestre = :AnoSemestre');
   Dm.qAux1.SQL.Add('and disciplina = :disciplina');

   Dm.qAux1.ParamByName('Situacao').AsInteger    := 3;
   Dm.qAux1.ParamByName('CodigoAluno').AsInteger := codigoAluno;
   Dm.qAux1.ParamByName('Turma').AsString        := turma;
   Dm.qAux1.ParamByName('AnoSemestre').AsInteger := anosemestre;
   Dm.qAux1.ParamByName('Disciplina').AsInteger  := disciplina;

   Dm.qAux1.ExecSQL;

   { Verificar Créditos }
   DM.recalcular_creditos_financeiros(codigoAluno, turma, anosemestre, true, true);

   DM.SetaSituacaoFinal(codigoAluno, turma, anosemestre);

   Screen.Cursor := crDefault;
end;

procedure TfrmCursos.cancelarAluno(anosemestre: Integer; curso: String; turma: String; codigoAluno: Integer);
var
   bCancelar: Boolean;
   sTitulos, sMesVenc, sMesAtual, sMesSeguinte: String;
   wAno, wMes, wDia: Word;
   movimento: TMovimento;
   objRemessa: TRemessa;
begin
   Screen.Cursor := crHourGlass;

   DM.tblMatriculas.Close;
   DM.tblMatriculas.ParamByName('CodigoAluno').AsInteger := codigoAluno;
   DM.tblMatriculas.ParamByName('AnoSemestre').AsInteger := anosemestre;
   DM.tblMatriculas.ParamByName('Turma').AsString := turma;
   DM.tblMatriculas.Open;

  // atualizacao da ficha individual
   Dm.qAux1.Close;
   Dm.qAux1.SQL.Clear;

   Dm.qAux1.SQL.Add('update FichaIndividual set Situacao = :Situacao, ');
   // Verifica se a situação é 3, 4, 5 ou 6 (cancelamento, trancamento, desistência ou abandono)

   // Caso sim então seta a data de saida do aluno com a data saida da matrícula, caso contrário limpa a data de saída
   if not DM.tblMatriculasDataSaida.IsNull then
   begin
      Dm.qAux1.SQL.Add('dt_saida = CASE WHEN dt_saida IS NULL THEN :dt_saida ELSE dt_saida END ');
   end
   else
   begin
      // senão seta null mesmo
      Dm.qAux1.SQL.Add('dt_saida = CASE WHEN dt_saida IS NULL THEN null ELSE dt_saida END ');
   end;

   Dm.qAux1.SQL.Add('where');
   Dm.qAux1.SQL.Add('CodigoAluno = :CodigoAluno and');
   Dm.qAux1.SQL.Add('situacao in (SELECT cd_situacao FROM situacao WHERE cd_situacao_pai NOT IN (0,9)) AND ');
   Dm.qAux1.SQL.Add('TurmaMatricula = :Turma and');
   Dm.qAux1.SQL.Add('AnoSemestre = :AnoSemestre');

   // só seta o parametro se a data de saída da matrícula tiver valor
   if not DM.tblMatriculasDataSaida.IsNull then
   begin
      Dm.qAux1.ParamByName('dt_saida').AsString := FormatDateTime('yyyy-mm-dd', DM.DataAtual());
   end;

   Dm.qAux1.ParamByName('Situacao').AsInteger := 3; // Situação de cancelamento para alunos (tabela de situacao)
   Dm.qAux1.ParamByName('CodigoAluno').AsInteger := codigoAluno;
   Dm.qAux1.ParamByName('Turma').AsString := turma;
   Dm.qAux1.ParamByName('AnoSemestre').AsInteger := anosemestre;
   Dm.qAux1.ExecSQL;

   DM.tblMatriculas.Edit;

   Dm.tblMensalidades.Close;
   Dm.tblMensalidades.SQL.Text := 'select * from mensalidades';
   Dm.tblMensalidades.SQL.Add(' where codigoaluno = :codigo and ');
   Dm.tblMensalidades.SQL.Add(' turma = :turma and anosemestre = :anosemestre ');
   Dm.tblMensalidades.SQL.Add(' AND tipoparcela <> 4 ' );

   if ((Dm.variavel_parametro('financeiro_cancelar_pendente') = 'S') or
      (Dm.variavel_parametro('financeiro_cancelar_vencida') = 'S')) then begin
      // cancelar pendentes / vencidas e reservas
      Dm.tblMensalidades.SQL.Add(' and ( situacao = 2 OR situacao = 10 ) ' );
   end else begin
     // Cancelar somente reservas
     Dm.tblMensalidades.SQL.Add(' and ( situacao = 10 )  ' );
   end;

   sTitulos := Trim(Dm.variavel_parametro('financeiro_cancelar_titulos'));

   if sTitulos <> '' then begin

     sTitulos := ' AND (cd_tipo_titulo = ' + sTitulos;
     sTitulos := StringReplace(sTitulos, ',', ' OR cd_tipo_titulo = ', [rfReplaceAll]);
     sTitulos := sTitulos + ' )';

     Dm.tblMensalidades.SQL.Add(sTitulos);
   end;


   Dm.tblMensalidades.ParamByName('codigo').AsInteger := DM.tblMatriculasCodigoAluno.AsInteger;
   DM.tblMensalidades.ParamByName('turma').AsString := DM.tblMatriculasTurma.AsString;
   DM.tblMensalidades.ParamByName('anosemestre').AsInteger := DM.tblMatriculasAnoSemestre.AsInteger;
   Dm.tblMensalidades.Open;

   if not DM.tblMensalidades.EOF then
   begin
      Dm.tblMensalidades.First;

      While not Dm.tblMensalidades.Eof do
        Begin
           // Verificar se deve ou não cancelar essa parcela
           bCancelar := False;

           // O sistema deverá SEMPRE CANCELAR as parcelas de RESERVA,
           // INDEPENDENTE DA DATA DE VENCIMENTO
           if (DM.tblMensalidadesSituacao.AsInteger = 10 ) then begin
              bCancelar := True;

           end else begin
              // Se não for RESERVA, VERIFICAR A DATA

               // Verificar se está vencido e o parametro está ativo
               if  (DM.tblMensalidadesDataVencimento.AsDateTime < DM.DataAtual())
               AND (Dm.variavel_parametro('financeiro_cancelar_vencida') = 'S')
               then begin

                  bCancelar := True;

               end;

               // Verificar se está pendente e o parametro está ativo
               if  (DM.tblMensalidadesDataVencimento.AsDateTime >= DM.DataAtual())
               AND (Dm.variavel_parametro('financeiro_cancelar_pendente') = 'S')
               then begin

                  bCancelar := True;

                  sMesVenc := (FormatDateTime('yyyy-mm', DM.tblMensalidadesDataVencimento.AsDateTime));
                  sMesAtual := (FormatDateTime('yyyy-mm', DM.DataAtual()));

                  if ((sMesVenc = sMesAtual) and ((Dm.variavel_parametro('financeiro_cancelar_mes_atual') = 'N'))) then begin
                      // Está pendente, porém, não é para cancelar o mês atual.
                      bCancelar := False;
                  end;
               end;

               // Verificar se está pendente e o parametro está ativo
               if  (DM.tblMensalidadesDataVencimento.AsDateTime >= DM.DataAtual())
               AND (Dm.variavel_parametro('financeiro_cancelar_pendente') = 'S') AND (bCancelar)
               then begin

                  bCancelar := True;

                  sMesVenc := (FormatDateTime('yyyy-mm', DM.tblMensalidadesDataVencimento.AsDateTime));
                  sMesSeguinte := (FormatDateTime('yyyy-mm', IncMonth(DM.DataAtual())));

                  if ((sMesVenc = sMesSeguinte) and ((Dm.variavel_parametro('financeiro_cancelar_proximo_mes') = 'N'))) then begin
                      // Está pendente, porém, não é para cancelar o mês atual.

                      bCancelar := False;

                  end;


               end;
           end;

           // Não vai cancelar as parcelas se financeiro estiver bloqueado
           if (DM.variavel_parametro('FinanceiroCancelaDataBloqueada') = 'N') then begin
              if (DM.EstaBloqueado(DM.tblMensalidadesDataVencimento.AsDateTime, false)) then begin
                 bCancelar:= false;
              end;
           end;

           if bCancelar then begin

             DM.tblMensalidades.Edit;

             DM.tblMensalidadesSituacao.AsInteger := 5; // Motivo Cancelado.


             if ( (DM.DataAtual() < DM.tblMensalidadesDataVencimento.AsDateTime ) OR
                ( Dm.variavel_parametro('mensalidades_data_baixa') = '[VENCIMENTO]' ) ) AND
                ( (Dm.variavel_parametro('mensalidades_data_baixa') <> '[BAIXA]') AND
                  (Dm.variavel_parametro('mensalidades_data_baixa') <> '[ATUAL]') )
             then
                DM.tblMensalidadesDataPagamento.AsString := DateToStr( DM.tblMensalidadesDataVencimento.AsDateTime )
             else
                DM.tblMensalidadesDataPagamento.AsString := DateToStr( DM.DataAtual() );

             // Se estiver bloqueado, a data de pagamento deve ser sempre mais 1
             if Dm.EstaBloqueado(DM.tblMensalidadesDataPagamento.AsDateTime, false) then begin
                DM.tblMensalidadesDataPagamento.AsString := DateToStr(DM.DataBloqueioFinanceiro(DM.tblMensalidadesDataPagamento.AsDateTime) + 1);
             end;

             { A parcela do mes atual não pode ser perdoada }
             DecodeDate(DM.tblMensalidadesDataVencimento.Value, wAno, wMes, wDia);

             DM.FazAcaoRemessa(arCancelar, Dm.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);

             if DM.variavel_parametro('sn_processo_remessa_novo') = '1' then
             begin
               // registra a nova ação de cancelamento no novo modelo de remessa
               objRemessa := TRemessa.Create;
               objRemessa.registraAcaoCancelamento(Dm.tblMensalidades.FieldByName('nossonumero').AsString);
             end;

             Dm.tblMensalidades.Post;

             // Registrar Movimentação de Cancelamento

             Movimento := TMovimento.create();
             Movimento.TipoDeAcao := BaixarporCancelamento;
             Movimento.CodigoTitulo := DM.tblMensalidadescd_mensalidade_origem.AsInteger;
             Movimento.Coligada := DM.tblMensalidadescd_coligada.AsInteger;
             Movimento.CodigoMovimento := DM.tblMensalidadescd_mensalidade.AsInteger; // Aqui é que tem q alterar na planilha de mensalidades
             Movimento.CodAcao :=  DM.BuscarCodigoAcaoPadrao(14);  // Cancelamento de mensalidades
             Movimento.Observacao := 'Matrícula Cancelada';

             Movimento.ValorMovimento := DM.tblMensalidadesValorBruto.AsCurrency + DM.tblMensalidadesValorExtra.AsCurrency  - DM.tblMensalidadesDescontoExtra.AsCurrency;

             Movimento.RegistrarMovimentacaoCR(0);

             movimento.free;

             { Colocar Motivo da Mensalidade }

             if DM.FindMotivo( Dm.tblMensalidades.FieldByNAMe('codigoaluno').AsInteger, Dm.tblMensalidades.FieldByNAMe('parcela').AsInteger, Dm.tblMensalidades.FieldByName('datavencimento').AsDateTime, DM.tblMensalidades.FieldByName('turma').AsString)
             then
                DM.tblMotivos.Edit
             else
                DM.tblMotivos.Insert;

             DM.tblMotivosCodigoAluno.AsInteger := Dm.tblMensalidades.FieldByNAMe('codigoaluno').AsInteger;
             DM.tblMotivosParcela.AsInteger := Dm.tblMensalidades.FieldByNAMe('parcela').AsInteger;
             Dm.tblMotivosturma.AsString := DM.tblMensalidades.FieldByName('turma').AsString;
             DM.tblMotivosDataMotivo.AsString := DateToStr(Dm.tblMensalidades.FieldByNAMe('dataVencimento').AsDateTime);
             DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
             DM.tblMotivosMotivo.AsString := 'Matrícula Cancelada';

             DM.tblMotivos.Post;
             DM.tblMotivos.Close;
           end;

           DM.tblMensalidades.Next;
        End;
   end;

   { Colocar motivo na Matrícula e permitir alterar}

   if DM.FindMotivo( Dm.tblMatriculas.FieldByNAMe('codigoaluno').AsInteger, 999, Dm.tblMatriculas.FieldByName('datasaida').AsDateTime, DM.tblMatriculas.FieldByName('turma').AsString) then
   begin
      DM.tblMotivos.Edit
   end else begin
      DM.tblMotivos.Insert;
   end;

   DM.tblMotivosCodigoAluno.AsInteger := Dm.tblMatriculas.FieldByNAMe('codigoaluno').AsInteger;
   DM.tblMotivosParcela.AsInteger := 999;
   DM.tblMotivosturma.AsString := DM.tblMatriculas.FieldByName('turma').AsString ;
   DM.tblMotivosDataMotivo.AsString := DateToStr(Dm.tblMatriculas.FieldByNAMe('datasaida').AsDateTime);
   DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;
   DM.tblMotivosMotivo.AsString := 'Matrícula Cancelada';

   DM.tblMotivos.Post;
   DM.tblMotivos.Close;

   // Registra na tabela de matriculas o usuário que efetuou a alteração
   DM.tblMatriculasUsuario.AsString := Dm.sLogin;

   DM.tblMatriculasSituacao.AsInteger := 3; // Cancela a situação de matricula do aluno
   DM.tblMatriculas.Post;

   Screen.Cursor := crDefault;
end;

function TfrmCursos.VerificaBib(codigoAluno: Integer): Boolean;
var
   sMensagem : string;
begin
   Result := True;

   //emprestimos pendentes
   qryPendenciasBib.Close;
   qryPendenciasBib.ParamByName('cd_pessoa').AsInteger := codigoAluno;
   qryPendenciasBib.open;

   //multas bib
   qryPendenciasFinanceirasBib.Close;
   qryPendenciasFinanceirasBib.ParamByName('cd_pessoa').AsInteger := codigoAluno;
   qryPendenciasFinanceirasBib.Open;

   if not(qryPendenciasBib.Eof) or not(qryPendenciasFinanceirasBib.Eof) then
   begin
      Result := False;
      Exit;
   end;
end;

procedure TfrmCursos.criarAbasColigadas;
var
   iAux : Integer;
begin
   qryColigadasComboCreate.SQL.Text := qyColigada.SQL.Text;

   qryColigadasComboCreate.Open;

   qryColigadasComboCreate.First();

   cbColigadas.Items.BeginUpdate;
   cbColigadas.Items.Clear();

   while not qryColigadasComboCreate.Eof do
   begin
      if qryColigadasComboCreatecd_coligada.AsInteger > 0 then
      begin
         iAux := cbColigadas.Items.AddObject( qryColigadasComboCreatenm_coligada.AsString,
            TItemCombo.Create(
                  qryColigadasComboCreatecd_coligada.AsString,
                  qryColigadasComboCreatenm_coligada.AsString
               )
            );
      end;

      qryColigadasComboCreate.Next();
   end;

   cbColigadas.ItemIndex := 0;
   cbColigadas.Items.EndUpdate;

   carregarCursoDepartamentos();

   qryColigadasComboCreate.First();
end;


procedure TfrmCursos.CopiarGrade( Grade, GradeNova : Integer; Curso: String );
var
  qyInsereGrade: TUMZQuery;
  chaveLog, msgLog: string;
begin
   { Duplicar Grade atual para outro código }
   DM.CriarConsulta(qyInsereGrade);
   
   qyInsereGrade.SQL.Text :=
      'INSERT INTO grades(cd_grade, cd_curso, ds_grade, nr_ano_inicial) '+
      'SELECT :cd_grade_nova, cd_curso, ds_grade, nr_ano_inicial FROM grades WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso';
   qyInsereGrade.ParamByName('cd_grade_nova').AsInteger := GradeNova;
   qyInsereGrade.ParamByName('cd_grade').AsInteger := Grade;
   qyInsereGrade.ParamByName('cd_curso').AsString := Curso;
   qyInsereGrade.ExecSQL;

   DM.CriarConsulta(qyInsereGrade);
   qyInsereGrade.SQL.Text :=
      'INSERT INTO grades_disciplinas ( ' +
      '      cd_grade, cd_curso, cd_disciplina, nr_serie, ' +
      '      nr_aulas, vl_valor, sn_compartilhada, nr_creditos_academicos, ' +
      '      cd_disciplina_categoria, nr_carga_horaria_pratica, ' +
      '      nr_carga_horaria_teorica, NR_CH_TEORICA_PRATICA) '+
      'SELECT :cd_grade_nova, cd_curso, cd_disciplina, nr_serie, ' +
      '      nr_aulas, vl_valor, sn_compartilhada, nr_creditos_academicos, ' +
      '      cd_disciplina_categoria, nr_carga_horaria_pratica, ' +
      '      nr_carga_horaria_teorica, NR_CH_TEORICA_PRATICA ' +
      'FROM grades_disciplinas ' +
      'WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso';
   qyInsereGrade.ParamByName('cd_grade_nova').AsInteger := GradeNova;
   qyInsereGrade.ParamByName('cd_grade').AsInteger := Grade;
   qyInsereGrade.ParamByName('cd_curso').AsString := Curso;
   qyInsereGrade.ExecSQL;

   DM.CriarConsulta(qyInsereGrade);
   qyInsereGrade.SQL.Text :=
      'INSERT INTO disciplinas_prereq ( ' +
      '      cd_curso, cd_grade, cd_discipli, cd_discipli_pre ) ' +
      'SELECT cd_curso, :cd_grade_nova, cd_discipli, cd_discipli_pre ' +
      'FROM disciplinas_prereq ' +
      'WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso';
   qyInsereGrade.ParamByName('cd_grade_nova').AsInteger := GradeNova;
   qyInsereGrade.ParamByName('cd_grade').AsInteger := Grade;
   qyInsereGrade.ParamByName('cd_curso').AsString := Curso;
   qyInsereGrade.ExecSQL;

   DM.CriarConsulta(qyInsereGrade);
   qyInsereGrade.SQL.Text :=
      'INSERT INTO disciplinas_prereq_especial ( ' +
      '      cd_curso, cd_grade, cd_disciplina, cd_tipo_req ) ' +
      'SELECT cd_curso, :cd_grade_nova, cd_disciplina, cd_tipo_req ' +
      'FROM disciplinas_prereq_especial ' +
      'WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso';
   qyInsereGrade.ParamByName('cd_grade_nova').AsInteger := GradeNova;
   qyInsereGrade.ParamByName('cd_grade').AsInteger := Grade;
   qyInsereGrade.ParamByName('cd_curso').AsString := Curso;
   qyInsereGrade.ExecSQL;

   qyGrades.Refresh();
   qyGradesDisciplinas.Refresh();

   // Grava log das alterações realizadas na grade curricular
   chaveLog := IntToStr(Grade) +';'+ Curso;
   // Cria a mensagem do LOG que contém as informações alteradas
   msgLog := 'Grade: '+ IntToStr(Grade) +CHR(13)+
             'Curso: '+ Curso +CHR(13)+
             'Cópia para a grade: '+IntToStr(GradeNova);

   // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
   DM.setLog( 1006, 'Inclusao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

   

   { Copiar Grade para outro Período }

   {ind := 0;

   tblGrade.First;

   with Dm.qAux2 do
   begin
      while not tblGrade.Eof do
      begin
         Inc(ind);
         DM.qAux2.Close;
         DM.qAux2.SQL.Clear;
         Dm.qAux2.SQL.Add('INSERT INTO GRADECURRICULAR');
         //Dm.qAux2.SQL.Add('( AnoSemestre, Curso, Turno, Disciplina, Serie, NumeroAulas, Valor, cd_grade, Codigo, sn_compartilhada, nr_creditos_academicos, cd_disc_categoria,nr_ch_teorica,nr_ch_pratica)');
         campos := '( AnoSemestre, Curso, Turno, Disciplina, Serie, Valor, cd_grade, Codigo, nr_creditos_academicos, cd_disc_categoria,NumeroAulas,sn_compartilhada';
         parametros := '(:NAnoSemestre, :NCurso, :NTurno, :NDisciplina, :NSerie,:NValor, :cd_grade, :NCodigo, :Nnr_creditos_academicos, :Ncd_disc_categoria,:NNumeroAulas,:Nsn_compartilhada';


         if not (tblGradenr_ch_teorica.IsNull) then
         begin
            campos := campos + ',nr_ch_teorica';
            parametros := parametros + ',:Nnr_ch_teorica';
         end;

         if not (tblGradenr_ch_pratica.IsNull) then
         begin
            campos := campos + ',nr_ch_pratica';
            parametros := parametros + ',:Nnr_ch_pratica';
         end;

         campos := campos + ')';
         parametros := parametros + ')';


         Dm.qAux2.SQL.Add(campos);
         Dm.qAux2.SQL.Add('values');
         Dm.qAux2.SQL.Add('');
         Dm.qAux2.SQL.Add(parametros);




         ParamByName('NAnoSemestre').asInteger := AnoSemestre;
         ParamByName('NTurno').AsString := Turno;
         ParamByName('NCurso').AsString := tblGradeCurso.AsString;
         ParamByName('NDisciplina').AsInteger := tblGradeDisciplina.AsInteger;
         ParamByName('NNumeroAulas').AsFloat := tblGradeNumeroAulas.AsFloat;
         ParamByName('NSerie').AsInteger := Etapa;
         ParamByName('NValor').AsFloat := tblGradeValor.AsFloat;
         ParamByName('cd_grade').AsInteger := Grade;
         ParamByName('Nsn_compartilhada').AsInteger := tblGradesn_compartilhada.AsInteger;

      

         ParamByName('Nnr_creditos_academicos').AsFloat := tblGradenr_creditos_academicos.AsFloat;
         ParamByName('Ncd_disc_categoria').AsInteger := tblGradecd_disc_categoria.AsInteger;
         ParamByName('NCodigo').AsString :=
         InTToStr(AnoSemestre) +
         tblGrade.FieldByName('Curso').asString +
         Format( '%.2d', [ind] ) +
         Format('%.2d', [Etapa] ) + Turno +
         Format('%.2d', [Grade]) +
         Format('%.10d', [tblGrade.FieldByName('Disciplina').AsInteger] );


         if not (tblGradenr_ch_teorica.IsNull) then
            ParamByName('Nnr_ch_teorica').AsInteger := tblGradenr_ch_teorica.asInteger;


         if not (tblGradenr_ch_pratica.IsNull) then
            ParamByName('Nnr_ch_pratica').AsInteger := tblGradenr_ch_pratica.asInteger;


         ExecSQL;
         tblGrade.Next;
      end;
   end;}

end;

procedure TfrmCursos.pmQtdDeptosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDeptos, pmQtdDeptos);

end;

procedure TfrmCursos.pmQtdTurmasPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblTurmas, pmQtdTurmas);

end;

procedure TfrmCursos.pmQtdGradePopup(Sender: TObject);
begin
  DM.quantidade_registros(qyGrades, pmQtdGrade);

end;

procedure TfrmCursos.pmQtdGradesPopup(Sender: TObject);
begin
//  DM.quantidade_registros(tblGradeGroup, pmQtdGrades);

end;

procedure TfrmCursos.pmQtdDiscPopup(Sender: TObject);
begin
   if pcGeral.ActivePage = tsDisciplinas then
     DM.quantidade_registros(tblDisc, pmQtdDisc);
end;

procedure TfrmCursos.pmQtdDocumentosNecessariosPopup(Sender: TObject);
begin
  DM.quantidade_registros(qDocumentosNecessarios, pmQtdDocumentosNecessarios);

end;

procedure TfrmCursos.pmQtdAtosOficiaisPopup(Sender: TObject);
begin
  DM.quantidade_registros(qyAtosOficiais, pmQtdAtosOficiais);

end;

procedure TfrmCursos.HabilitaEmenta(habilitar: boolean);
begin
   if(tblDisc.State <> dsInsert)then
   begin
      dbEmentaDisc.ReadOnly   := not habilitar;
      dbreBibBasica.readOnly := not habilitar;
      dbreBibComp.readOnly := not habilitar;
      dbreBibSup.readOnly := not habilitar;
      dbObjetivo.readOnly     := not habilitar;
      DBEdit5.ReadOnly        := not habilitar;
   end
   else
   begin
      dbEmentaDisc.ReadOnly   := false;
      dbreBibBasica.readOnly := false;
      dbreBibComp.readOnly := false;
      dbreBibSup.readOnly := false;
      dbObjetivo.readOnly     := false;
      DBEdit5.ReadOnly        := false;
   end;

end;

procedure TfrmCursos.HabilitarCamposMoodle(bHabilitar: Boolean);
const
   CAMPO_MOODLE = 'NR_QTD_DIAS_INICIO_MOODLE';
var
   I: Integer;
begin	
   { habilita/desabilita checkbox exporta moodle }
   dbcbExportaTurmaMOODLE.Visible := bHabilitar;

   { habilita/desabilita coluna qtd dias moodle }
   for I := 0 to grdGrade.Columns.Count - 1 do
   begin
      if grdGrade.Columns[I].FieldName = CAMPO_MOODLE then
      begin
         grdGrade.Columns[I].Visible := bHabilitar;
      end;
   end; 

   if bHabilitar then
      qyGradesDisciplinas.Fields.FindField(CAMPO_MOODLE).Tag := 1
   else
      qyGradesDisciplinas.Fields.FindField(CAMPO_MOODLE).Tag := 0;

   { habilita/desabilita campo exporta moodle na DISCIPLINA }
   if bHabilitar then
   begin
      dbchExportaDisciplinaMoodle.Visible := True;
      tpan.Height := dbchExportaDisciplinaMoodle.Height + dbchExportaDisciplinaMoodle.Top + pnOpcoesEmenta.Height + 7;
   end else begin
      dbchExportaDisciplinaMoodle.Visible := False;
      tpan.Height := cbDisciplinaPai.Height + cbDisciplinaPai.Top + pnOpcoesEmenta.Height + 7;
   end;
end;

procedure TfrmCursos.RecarregarTotaisGC();
const
   SQL_TOTAIS_GC =
      'SELECT sum(gd.vl_valor) carga_horaria,count(GD.CD_DISCIPLINA) qtd_disciplinas, ' +
      '       sum(gd.nr_aulas) credito_fin,sum(gd.nr_creditos_academicos) hora_aula ' +
      'FROM GRADES G ' +
      '     INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CURSO = G.CD_CURSO) ' +
      '     INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA AND D.CURSO = GD.CD_CURSO) ' +
      'WHERE G.CD_GRADE = :CD_GRADE AND G.CD_CURSO = :CD_CURSO %s ' +
      'ORDER BY GD.NR_SERIE';

   SQL_TOTAIS_GC_COM_SERIE =
      'SELECT sum(gd.vl_valor) carga_horaria,count(GD.CD_DISCIPLINA) qtd_disciplinas, ' +
      '       sum(gd.nr_aulas) credito_fin,sum(gd.nr_creditos_academicos) hora_aula ' +
      'FROM GRADES G ' +
      '     INNER JOIN GRADES_DISCIPLINAS GD ON (GD.CD_GRADE = G.CD_GRADE AND GD.CD_CURSO = G.CD_CURSO) ' +
      '     INNER JOIN DISCIPLINAS D ON (D.CODIGO = GD.CD_DISCIPLINA AND D.CURSO = GD.CD_CURSO) ' +
      'WHERE GD.NR_SERIE = :NR_SERIE AND G.CD_GRADE = :CD_GRADE AND G.CD_CURSO = :CD_CURSO ' +
      'ORDER BY GD.NR_SERIE';
var
   sql_filtro, descricao_totais : String;
   nr_serie : Integer;

begin
   nr_serie := 0;
   if cbFiltroEtapas.ItemIndex <> -1 then
      nr_serie := StrToInt( TItemCombo(cbFiltroEtapas.Items.Objects[cbFiltroEtapas.ItemIndex]).getCodigo() );

   sql_filtro := '';
   qryTotais.Close;

   if nr_serie <> 0 then
   begin                            
      lbTotais.AutoSize := True;
      descricao_totais := '    Total ';

      if nr_serie < 0 then
         descricao_totais := descricao_totais + 'Optativas:'
      else
         descricao_totais := descricao_totais + 'etapa ' + IntToStr( nr_serie ) + ':';

      sql_filtro := 'AND GD.NR_SERIE = ' + IntToStr( nr_serie );

      qryTotais.SQLList.Values[DM.db.Protocol] := SQL_TOTAIS_GC_COM_SERIE;
      qryTotais.ParamByName('NR_SERIE').AsInteger := nr_serie;

   end
   else
   begin
      descricao_totais := 'Totais:';
      lbTotais.AutoSize := False;
      lbTotais.Width := 64;


      qryTotais.SQLList.Values[DM.db.Protocol] := Format( SQL_TOTAIS_GC, [sql_filtro] );
   end;

   lbTotais.Caption := descricao_totais;
   
   qryTotais.ParamByName('CD_GRADE').AsInteger := qyGradesDisciplinas.FieldByName('CD_GRADE').asInteger;
   qryTotais.ParamByName('CD_CURSO').asString := qyGradesDisciplinas.FieldByName('CD_CURSO').asString;

   qryTotais.open;
end;

procedure TfrmCursos.RecarregarFiltroEtapas();
const
   SQL_RECARREGAR_FILTRO_ETAPAS =
      ' SELECT ' +
      ' CASE WHEN nr_serie = -100 THEN ''Visualizar optativas'' ELSE CONCAT( ''Visualizar etapa '', nr_serie ) END AS descricao, nr_serie ' +
      ' FROM grades_disciplinas ' +
      ' WHERE cd_grade = :cd_grade AND cd_curso = :cd_curso ' +
      ' GROUP BY	nr_serie ORDER BY	nr_serie ';
var
   qyRecarregarFiltroEtapas : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyRecarregarFiltroEtapas);
   qyRecarregarFiltroEtapas.SQL.Text := SQL_RECARREGAR_FILTRO_ETAPAS;
   qyRecarregarFiltroEtapas.ParamByName('cd_grade').AsInteger := qyGradesDisciplinas.FieldByName('CD_GRADE').asInteger;
   qyRecarregarFiltroEtapas.ParamByName('cd_curso').AsString := qyGradesDisciplinas.FieldByName('CD_CURSO').asString;
   qyRecarregarFiltroEtapas.Open();

   cbFiltroEtapas.Clear;
   cbFiltroEtapas.AddItem('Visualizar todas as etapas', TItemCombo.Create('0', '0'));
   cbFiltroEtapas.ItemIndex := 0;

   while not qyRecarregarFiltroEtapas.Eof do
   begin
      cbFiltroEtapas.AddItem(
         qyRecarregarFiltroEtapas.FieldByName('descricao').AsString,
         TItemCombo.Create(
            qyRecarregarFiltroEtapas.FieldByName('nr_serie').AsString,
            qyRecarregarFiltroEtapas.FieldByName('nr_serie').AsString
         )
      );      

      qyRecarregarFiltroEtapas.Next();
   end;

   cbFiltroEtapas.Enabled := cbFiltroEtapas.Items.Count > 2;

   qyRecarregarFiltroEtapas.Close();
   FreeAndNil(qyRecarregarFiltroEtapas);

   qyGradesDisciplinas.Filter := '';

   if qyGradesDisciplinas.State = dsBrowse then
   begin
      qyGradesDisciplinas.First;
   end;
   
end;

procedure TfrmCursos.sbBibItalicoClick(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   Application.ProcessMessages;

   if pcEmenta.ActivePageIndex = 1 then
   begin
      RichEdit := dbreBibBasica;
   end
   else
   if pcEmenta.ActivePageIndex = 2 then
   begin
      RichEdit := dbreBibComp;
   end
   else
   if pcEmenta.ActivePageIndex = 3 then
   begin
      RichEdit := dbreBibSup;
   end   
   else
   if pcEmenta.ActivePageIndex = 5 then
   begin
      RichEdit := dbreJustificativa;
   end
   else
   if pcEmenta.ActivePageIndex = 6 then
   begin
      RichEdit := dbreHabilidadesCompetencias;
   end
   else
   begin
      RichEdit := nil;
   end;

   if Assigned(RichEdit) then
   begin
      if sbBibItalico.Down then
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style + [fsItalic];
      end
      else
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style - [fsItalic];
      end;
   end;
end;

procedure TfrmCursos.sbBibNegritoClick(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   Application.ProcessMessages;

   if pcEmenta.ActivePageIndex = 1 then
   begin
      RichEdit := dbreBibBasica;
   end
   else
   if pcEmenta.ActivePageIndex = 2 then
   begin
      RichEdit := dbreBibComp;
   end
   else
   if pcEmenta.ActivePageIndex = 3 then
   begin
      RichEdit := dbreBibSup;
   end
   else
   if pcEmenta.ActivePageIndex = 5 then
   begin
      RichEdit := dbreJustificativa;
   end
   else
   if pcEmenta.ActivePageIndex = 6 then
   begin
      RichEdit := dbreHabilidadesCompetencias;
   end
   else
   begin
      RichEdit := nil;
   end;

   if Assigned(RichEdit) then
   begin
      if sbBibNegrito.Down then
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style + [fsBold];
      end
      else
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style - [fsBold];
      end;
   end;
end;

procedure TfrmCursos.sbBibSublinhadoClick(Sender: TObject);
var
   RichEdit: TCustomRichEdit;
begin
   Application.ProcessMessages;

   if pcEmenta.ActivePageIndex = 1 then
   begin
      RichEdit := dbreBibBasica;
   end
   else
   if pcEmenta.ActivePageIndex = 2 then
   begin
      RichEdit := dbreBibComp;
   end
   else
   if pcEmenta.ActivePageIndex = 3 then
   begin
      RichEdit := dbreBibSup;
   end
   else
   if pcEmenta.ActivePageIndex = 5 then
   begin
      RichEdit := dbreJustificativa;
   end
   else
   if pcEmenta.ActivePageIndex = 6 then
   begin
      RichEdit := dbreHabilidadesCompetencias;
   end
   else
   begin
      RichEdit := nil;
   end;

   if Assigned(RichEdit) then
   begin
      if sbBibSublinhado.Down then
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style + [fsUnderline];
      end
      else
      begin
         RichEdit.SelAttributes.Style := RichEdit.SelAttributes.Style - [fsUnderline];
      end;
   end;
end;

procedure TfrmCursos.AtualizarEmentas(bMensagem:Boolean);
const
   MSG_DESMARCAR_EMENTAS = 'Ao desmarcar esta opção as ementas serão desvinculadas da disciplina mestra. ' +
         'Com isso será possível realizar alterações por este espaço. ' +
         'As mudanças feitas na disciplina mestra NÃO serão replicadas para este local. ' +
         'Tem certeza que deseja prosseguir?';
var
   qryUpdateEmentas : TUMZQuery;
begin
   DM.CriarConsulta(qryUpdateEmentas);
//
   if(sbBloqueiaValor.Down = False)then
   begin
      if(tblDisc.State <> dsInsert)then
      begin
         if (Mensagem(MSG_DESMARCAR_EMENTAS,'Atenção',MB_ICONEXCLAMATION+MB_YESNO, Handle)=mrYes)then
         begin
            DBNavigator1.VisibleButtons := [nbPrior,nbNext,nbInsert,nbDelete];
            if(tblDisc.State = dsBrowse)then
               tblDisc.Edit;
            tblDiscsn_ementa_padrao.AsInteger := 0;
            tblDisc.Post;
            HabilitaEmenta(true);
         end
         else
         begin
            if(tblDisc.State = dsBrowse)then
               tblDisc.Edit;
            tblDiscsn_ementa_padrao.AsInteger := 1;
            sbBloqueiaValor.Down := true
         end;
      end;
   end
   else
   begin
      if(tblDisc.State <> dsInsert)then
      begin
         if(Mensagem('Ao marcar esta opção todas as ementas serão excluídas e serão padronizadas com as cadastradas na disciplina mestra. Qualquer alteração realizada será replicada para este espaço. Tem certeza que deseja prosseguir?','Atenção',MB_ICONEXCLAMATION+MB_YESNO,Handle) = mrYes)then
         begin
           //deleta os registros de informacao da disciplinas ementas
           qryUpdateEmentas.sql.Text := ' '+
           'DELETE                        '+
           'FROM                          '+
           '  disciplinas_ementas         '+
           'WHERE                         '+
           '  curso  =     '''+tblDiscCurso.AsString+''' AND '+
           '  codigo =     '+tblDisccodigo.AsString;
           qryUpdateEmentas.ExecSQL;

           qryUpdateEmentas.SQL.Text := ''+
            'INSERT INTO disciplinas_ementas (codigo,anosemestre,ementa,bibliografia_basica,bibliografia_complementar,bibliografia_suplementar,objetivo,curso, TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML, TX_BIB_SUP_HTML, '+
            '   ME_JUSTIFICATIVA, TX_JUSTIFICATIVA_HTML, ME_HABILIDADES_COMPET, TX_HABILIDADES_COMPET_HTML) '+
            'SELECT                                                           '+
               tblDisccodigo.AsString+',                                     '+
            '  nr_anosemestre,                                                '+
            '  me_ementa,                                                     '+
            '  me_bibliografia_basica,                                        '+
            '  me_bibliografia_complementar,                                  '+
            '  me_bibliografia_suplementar,                                   '+
            '  me_objetivo,                                                   '+
            '' + QuotedStr(tblDiscCurso.AsString) + ',                        '+
            ' TX_BIB_BASICA_HTML, TX_BIB_COMP_HTML, TX_BIB_SUP_HTML,          '+
            ' ME_JUSTIFICATIVA, TX_JUSTIFICATIVA_HTML,                        '+
            ' ME_HABILIDADES_COMPET, TX_HABILIDADES_COMPET_HTML               '+
            'FROM                                                             '+
            '  disciplinas_mestre_ementas                                     '+
            'WHERE                                                            '+
            '	cd_disciplina_pai like '''+tblDiscCD_DISCIPLINA_PAI.AsString+''''+
            ' LIMIT 1 ';
            qryUpdateEmentas.ExecSQL;
            DBNavigator1.VisibleButtons := [nbPrior,nbNext];
            HabilitaEmenta(false);
            if(tblDisc.State = dsBrowse)then
               tblDisc.Edit;
            tblDiscsn_ementa_padrao.AsInteger := 1;
            tblDisc.Post;
         end
         else
         begin
            if(tblDisc.State = dsBrowse)then
               tblDisc.Edit;
            tblDiscsn_ementa_padrao.AsInteger := 0;
            sbBloqueiaValor.Down := False;
         end;
      end;
   end;
   tblEmentas.Close;
   tblEmentas.ParamByName('codigo').AsInteger := tblDiscCodigo.AsInteger;
   tblEmentas.ParamByName('curso').AsString := tblDiscCurso.AsString;
   tblEmentas.Open;
end;

procedure TfrmCursos.sbBloqueiaValorClick(Sender: TObject);
begin
   AtualizarEmentas();
end;

procedure TfrmCursos.sbBuscaProxTurmaOutroCursoClick(Sender: TObject);
var
   anoSemestre: Integer;
   resultado_filtro : TResultadoFiltroTurma;
begin

   if dbcbProxTurmaMesmoAnosemestre.Checked then
   begin
      anoSemestre := tblTurmasAnoSemestre.AsInteger;
   end else begin
      anoSemestre := StrToInt(DM.incrementar_ano_semestre(tblTurmasAnoSemestre.AsString));
   end;

   // Pesquisar Turmas / Curso
   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre], anoSemestre, tblTurmascd_coligada.AsInteger);

   if not resultado_filtro.filtrado then Exit;

   // Verifica se o anosemestre é MENOR que o anosemestre da turma atual,
   // nesse caso não permite selecionar essa turma
   if resultado_filtro.nr_anosemestre < tblTurmasAnoSemestre.AsInteger then
   begin
      Mensagem('O anosemestre da turma selecionada deve ser igual ou maior que o anosemestre da turma atual!','Aviso', MB_ICONEXCLAMATION+MB_OK);
      Exit;
   end;

   // Verifica se o curso da turma selecionado é o mesmo
   // curso da turma atual, nesse caso não permite (somente outros cursos)
   if resultado_filtro.cd_curso = tblTurmasCurso.AsString then
   begin
      Mensagem('A turma selecionada precisa ser de outro curso!','Aviso', MB_ICONEXCLAMATION+MB_OK);
      Exit;
   end;

   if not (dtcTurmas.State in [dsInsert, dsEdit]) then
   begin
      tblTurmas.Edit;
   end;

   // Seta o curso escolhido
   tblTurmas.FieldByName('cd_proximo_curso').AsString := resultado_filtro.cd_curso;
   // Seta a turma escolhida
   tblTurmas.FieldByName('cd_proxima_turma').AsString := resultado_filtro.cd_turma;
end;

procedure TfrmCursos.sbBuscaSalaClick(Sender: TObject);
begin
   if not PrincipalForm.ProcuraForm(fCadSalas) then
   begin
      Application.CreateForm(TfCadSalas, fCadSalas);
   end;
   if fCadSalas.ShowModal = mrOk then
   begin
      qrySalas.Refresh;

      if not (tblTurmas.State in dsEditModes) then
      begin
         tblTurmas.Edit;
      end;
      tblTurmascd_sala.AsInteger := fCadSalas.qrySalasCD_SALA.AsInteger;
      edSala.Text:= fCadSalas.qrySalasDS_SALA.AsString;
   end;
end;

procedure TfrmCursos.sbLimpaClick(Sender: TObject);
begin
   if (tblTurmas.State = dsEdit) or (tblTurmas.State = dsInsert)  then
   begin
      tblTurmascd_situacao.AsInteger := 0;
   end
   else
   begin
      btnAlterarClick(nil);
      tblTurmascd_situacao.AsInteger := 0;
   end;
end;

procedure TfrmCursos.sbLimpaProxTurmaOutroCursoClick(Sender: TObject);
begin
   if not (dtcTurmas.State in [dsInsert, dsEdit]) then
   begin
      tblTurmas.Edit;
   end;

   // Limpa o próximo Curso/Turma selecionados
   tblTurmas.FieldByName('cd_proximo_curso').Clear;
   tblTurmas.FieldByName('cd_proxima_turma').Clear;
end;

procedure TfrmCursos.sbLimparContaClick(Sender: TObject);
begin
   if not (tblTurmas.State in [dsinsert, dsedit]) then begin
      tblTurmas.Edit;
   end;
   tblTurmascd_caixa.AsInteger := 0;
end;



procedure TfrmCursos.sbLimpaSalaClick(Sender: TObject);
begin
    tblTurmas.Edit;
    edSala.Text := '';
    tblTurmascd_sala.Clear;
end;

procedure TfrmCursos.sbMaisInformacoesClick(Sender: TObject);
begin
   if (tblTurmas.State in [dsInsert, dsEdit]) then begin
      Mensagem('Salve as alterações antes de acessar a opção de Mais Informações.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      exit;
   end;
   
   { Apresentar a tela de campos adicionais }
   Application.CreateForm(Tfrm_cursos_turmas_adicional, frm_cursos_turmas_adicional);

   if not frm_cursos_turmas_adicional.Montar_Dados('TURMAS', tblTurmascodigo.AsString, tblTurmasAnoSemestre.AsInteger) then
      Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING, Handle);

   FreeAndNil(frm_cursos_turmas_adicional);
end;

procedure TfrmCursos.sbPlanoEnsinoClick(Sender: TObject);
var
  IEApp: Variant;
  endereco: string;
begin
   IEApp := CreateOLEObject('InternetExplorer.Application');
   IEApp.visible := true;
   IEApp.Top := 0;
   IEApp.Left := 0;
   IEApp.width := screen.width;
   IEApp.height := screen.height;
   { ALTERACAO_CURSOS
   endereco := DM.variavel_parametro('plano_ensino_local_download') + txtAnoSemestreCursos.Text + '/';
   }
               
//   if tblCursosAnoSemestre.AsString < DM.variavel_parametro('profes_coorde_plano_ensino_anosem') then
//      endereco := endereco + tblCursosAnoSemestre.AsString + '/';
      
   endereco := endereco + tblTurmas.FieldByName('Codigo').AsString + '_' + LeftStr(tblTurmas.FieldByName('AnoSemestre').AsString, 4) + '_' + RightStr(tblTurmas.FieldByName('AnoSemestre').AsString, 1) + '_' + tblDisc.fieldByName('Codigo').AsString + '.doc';

   IEApp.Navigate(endereco);
end;

procedure TfrmCursos.qyAtosOficiaisNewRecord(DataSet: TDataSet);
begin
  qyAtosOficiaiscd_curso.AsString := qyCursosMestreCD_CURSO.AsString;
  qyAtosOficiaissn_impressao.AsString := 'N';
end;

procedure TfrmCursos.qyCursosColigadasBeforeDelete(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npExcluir, True, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then Abort;
end;

procedure TfrmCursos.qyCursosColigadasBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then Abort;
end;

procedure TfrmCursos.qyCursosColigadasBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True, StrToInt(TitemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo()) ) then Abort;
end;

procedure TfrmCursos.qyCursosMestreBeforeDelete(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npExcluir, True ) then Abort;
end;

procedure TfrmCursos.qyCursosMestreBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True ) then Abort;
   dbeCcodigo.Enabled := false;
end;

procedure TfrmCursos.qyCursosMestreBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True ) then Abort;
end;

procedure TfrmCursos.qyCursosMestreBeforePost(DataSet: TDataSet);
begin
   if (cbSituacoes.ItemIndex = 0) then
   begin
      Mensagem(
        'Para concluir o cadastro, favor selecionar o Grau antes de clicar em salvar.',
        'Aviso',
        MB_ICONWARNING + MB_OK,
        Handle
      );
      Abort;
   end;
   qyCursosMestreNR_GRAU.AsInteger := StrToInt(TItemCombo(cbSituacoes.Items.Objects[cbSituacoes.ItemIndex]).getCodigo);
   atualizaGrauCursos(qyCursosMestreCD_CURSO.AsString);

   // Esta condição foi feita para o usuário salvar um novo curso somente se o mesmo
   // clicar no botão: Salvar   
   if (qyCursosMestre.State in [dsInsert]) and not(SelecionouColigada) then
   begin
      btnCancelarClick(nil);
   end;
end;

procedure TfrmCursos.qyGradesAfterOpen(DataSet: TDataSet);
var
   I, J: Integer;
begin
   SetLength(arrUltimasEtapas, qyCursosMestre.RecordCount);
   SetLength(arrUltimasEtapas[qyCursosMestre.RecNo - 1], qyGrades.RecordCount);
   for I := Low(arrUltimasEtapas) to High(arrUltimasEtapas) do
      for J := Low(arrUltimasEtapas[I]) to High(arrUltimasEtapas[I]) do
         arrUltimasEtapas[I][J] := 0;
end;

procedure TfrmCursos.qyGradesAfterPost(DataSet: TDataSet);
begin
   qyListaGrades.Close();
   qyListaGrades.Open();
   RecarregarTotaisGC();
   RecarregarFiltroEtapas();
end;

procedure TfrmCursos.qyGradesBeforeDelete(DataSet: TDataSet);
var
   chaveLog, msgLog: string;
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npExcluir, True ) then Abort;

   // Grava log das alterações realizadas na grade curricular
   chaveLog := qyGradesCD_GRADE.AsString +';'+ qyGradesCD_CURSO.AsString;
   // Cria a mensagem do LOG que contém as informações alteradas
   msgLog := 'Grade: '+ qyGrades.FieldByName('CD_GRADE').AsString +CHR(13)+
             'Curso: '+ qyGrades.FieldByName('CD_CURSO').AsString +CHR(13)+
             'Anosemestre Inicial: '+ qyGrades.FieldByName('NR_ANO_INICIAL').AsString +CHR(13)+
             'Descrição: '+ qyGrades.FieldByName('DS_GRADE').AsString +CHR(13)+
             'Ativo: '+ qyGrades.FieldByName('SN_ATIVO').AsString +CHR(13)+
             'Grade Padrão: '+ qyGrades.FieldByName('SN_PADRAO').AsString +CHR(13)+
             'C.H. Curso: '+ qyGrades.FieldByName('NR_CARGA_CURSO').AsString +CHR(13)+
             'C.H. AC: '+ qyGrades.FieldByName('NR_CARGA_ATIVIDADES').AsString;

   // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
   DM.setLog( 1006, 'Exclusao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );
end;

procedure TfrmCursos.qyGradesBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npAlterar, True ) then Abort;
end;

procedure TfrmCursos.qyGradesBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npIncluir, True ) then Abort;
end;

procedure TfrmCursos.qyGradesDisciplinasAfterDelete(DataSet: TDataSet);
begin
   RecarregarTotaisGC();
   RecarregarFiltroEtapas();
end;

procedure TfrmCursos.qyGradesDisciplinasAfterOpen(DataSet: TDataSet);
begin
   RecarregarTotaisGC();
   RecarregarFiltroEtapas();
   qyGradesDisciplinas.First;
end;

procedure TfrmCursos.qyGradesDisciplinasAfterPost(DataSet: TDataSet);
var
   P: Pointer;
begin   
   RecarregarTotaisGC();

   P := qyGradesDisciplinas.GetBookmark;
   qyGradesDisciplinas.Refresh;

   if qyGradesDisciplinas.BookmarkValid(P) then
      qyGradesDisciplinas.GotoBookmark(P);
end;

procedure TfrmCursos.qyGradesDisciplinasAfterRefresh(DataSet: TDataSet);
begin
   qyGradesDisciplinas.First;
end;

procedure TfrmCursos.qyGradesDisciplinasBeforePost(DataSet: TDataSet);
begin
   { Se a carga horária prática ou teórica forem maior do que zero,
      o sistema calcula as duas somando e jogando na variável VL_VALOR,
      caso contrário, o sistema irá manter o valor da VL_VALOR }
   if (qyGradesDisciplinasNR_CARGA_HORARIA_PRATICA.AsFloat > 0) OR
      (qyGradesDisciplinasNR_CARGA_HORARIA_TEORICA.AsFloat > 0) OR
      (qyGradesDisciplinasNR_CH_TEORICA_PRATICA.AsFloat > 0)
   then
   begin
      qyGradesDisciplinasVL_VALOR.AsFloat := (
         qyGradesDisciplinasNR_CARGA_HORARIA_PRATICA.AsFloat +
         qyGradesDisciplinasNR_CARGA_HORARIA_TEORICA.AsFloat +
         qyGradesDisciplinasNR_CH_TEORICA_PRATICA.AsFloat
      );
   end;

   { Na tentativa de ALTERAÇÃO do crédito financeiro na grade, verificar se tem alunos matriculados nessas disciplinas
     que mudou os créditos financeiros, cuja parcela tenha sn_credito_parcela = S, se houver informar que não é possível
     fazer alteração. }
   qyVerificaAlunoVinculadoGrade.Close;
   qyVerificaAlunoVinculadoGrade.ParamByName('cd_grade').AsInteger := qyGradesDisciplinasCD_GRADE.AsInteger;
   qyVerificaAlunoVinculadoGrade.ParamByName('cd_disciplina').AsString := qyGradesDisciplinasCD_DISCIPLINA.AsString;
   qyVerificaAlunoVinculadoGrade.ParamByName('cd_curso').AsString := qyGradesDisciplinasCD_CURSO.AsString;
   qyVerificaAlunoVinculadoGrade.ParamByName('nr_serie').AsInteger := qyGradesDisciplinasNR_SERIE.AsInteger;
   qyVerificaAlunoVinculadoGrade.Open;
   if qyGradesDisciplinas.State in [dsEdit] then
   begin
      if (qyGradesDisciplinasNR_AULAS.OldValue <> qyGradesDisciplinasNR_AULAS.AsVariant) and
      (qyVerificaAlunoVinculadoGrade.FieldByName('qtd').AsInteger > 0) then
      begin
         Mensagem('Não é possível alterar o valor do crédito financeiro da grade.'+#13+
                  'Existem alunos matriculados nessa disciplina.', 'Aviso', MB_ICONEXCLAMATION+MB_OK);
         qyGradesDisciplinasNR_AULAS.AsVariant := qyGradesDisciplinasNR_AULAS.OldValue;
         Abort;
      end;
   end;
end;

procedure TfrmCursos.realizaExpressaoRegular(Sender: TObject);
var
   x: string;
   Edit: TEdit;
begin
   Edit := TEdit(Sender);

   if Edit.Enabled then
   begin
      if Edit.Focused() then
      begin
         if tbKeyIsDown(VK_CONTROL) AND tbKeyIsDown(Ord('V')) then
         begin
            Edit.Text := '';
         end;
      end;

      if expressaoRegularCodigoTurma <> '' then
      begin
         if not validaCodigoTurma(copy(Edit.Text,length(Edit.Text),1)) then
         begin
            x := Edit.Text;
            delete(x,length(x),1);
            Edit.Text := x;
            Edit.SetFocus;
            Edit.Selstart := Length(Edit.text);
         end;
      end;
   end;
end;

procedure TfrmCursos.rgFiltroCursosMestresClick(Sender: TObject);
begin
   FiltraCursos;
end;

procedure TfrmCursos.qyAtosOficiaisBeforePost(DataSet: TDataSet);
begin
  qyAtosOficiais.FieldByName('dt_ato').AsString := DateToStr(frmAtosOficiais.umdtAto.Date);
end;

procedure TfrmCursos.ToolButton3Click(Sender: TObject);
begin
  DM.qAux1.Close;
  DM.qAux1.SQL.Clear;
  DM.qAux1.SQL.Add('SELECT                               ');
  DM.qAux1.SQL.Add('	p.cd_pessoa,                        ');
  DM.qAux1.SQL.Add('	p.nm_pessoa                         ');
  DM.qAux1.SQL.Add('FROM                                 ');
  DM.qAux1.SQL.Add('	pessoas p                           ');
  DM.qAux1.SQL.Add('	INNER JOIN turmasprofessores tp ON (tp.professor = p.cd_pessoa) ');
  DM.qAux1.SQL.Add('WHERE                                ');
  {DM.qAux1.SQL.Add('	tp.anosemestre = :anosemestre AND   ');}
  DM.qAux1.SQL.Add('	tp.curso = :curso AND               ');
  DM.qAux1.SQL.Add('	tp.disciplina = :disciplina AND     ');
  DM.qAux1.SQL.Add('	tp.turma = :turma                   ');

  {DM.qAux1.ParamByName('anosemestre').AsInteger := tblGrade.FieldByName('anosemestre').AsInteger;}
  DM.qAux1.ParamByName('curso').AsString := qyGradesCD_CURSO.AsString;
  DM.qAux1.ParamByName('disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
  DM.qAux1.ParamByName('turma').AsString := tblTurmas.FieldByName('codigo').AsString;

  DM.qAux1.Open;

  if DM.qAux1.Eof then
    Mensagem('Esta turma ainda não possui um professor.',   'Informação', MB_OK + MB_ICONINFORMATION, Handle)
  else
  begin
    if frm_Grade_Professor = nil then
      Application.CreateForm(Tfrm_Grade_Professor, frm_Grade_Professor);

    frm_Grade_Professor.lbProfessor.caption := DM.qAux1.FieldByName('cd_pessoa').AsString + ' - ' + DM.qAux1.FieldByName('nm_pessoa').AsString;
    frm_Grade_Professor.ShowModal;

    frm_Grade_Professor.Free;
    frm_Grade_Professor := nil;
  end;
end;

procedure TfrmCursos.ToolButton6Click(Sender: TObject);
begin
   if frm_Grade_Horarios = nil then
      Application.CreateForm(Tfrm_Grade_Horarios, frm_Grade_Horarios);

  frm_Grade_Horarios.qyHorarios.Close;
  {frm_Grade_Horarios.qyHorarios.ParamByName('anosemestre').AsInteger := tblGrade.FieldByName('anosemestre').AsInteger;}
  frm_Grade_Horarios.qyHorarios.ParamByName('turma').AsString := tblTurmas.FieldByName('codigo').AsString;
  frm_Grade_Horarios.qyHorarios.ParamByName('disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
  frm_Grade_Horarios.qyHorarios.Open;

  if frm_Grade_Horarios.qyHorarios.Eof then
    Mensagem('Esta turma ainda não possui horário definido.',  'Informação', MB_OK + MB_ICONINFORMATION, Handle)
  else
  begin
    frm_Grade_Horarios.ShowModal;
  end;

  frm_Grade_Horarios.Free;
  frm_Grade_Horarios := nil;
end;

function TfrmCursos.getColigadaAtual: Integer;
begin
   {
   if qyColigadacd_coligada.AsInteger < 1 then
      qyColigada.Next;
   }

   Result := qyColigadacd_coligada.AsInteger;
end;

function TfrmCursos.getColigadasAtivasFromCurso(cd_curso: String): Integer;
Const
   SQL = 'SELECT ' +
      	'  count(*) AS qtd_coligadas ' +
         'FROM ' +
         '	cursos_coligadas ' +
         'WHERE ' +
         '	cd_curso = :cd_curso ' +
         'AND SN_ATIVO = 1;';
var
   qryColigadasFromCurso: TUMZQuery;
begin
   DM.CriarConsulta(qryColigadasFromCurso);
   qryColigadasFromCurso.SQL.Text := SQL;
   qryColigadasFromCurso.ParamByName('cd_curso').AsString := cd_curso;
   qryColigadasFromCurso.Open();
   Result := qryColigadasFromCurso.FieldByName('qtd_coligadas').AsInteger;
   FreeAndNil(qryColigadasFromCurso);
end;

function TfrmCursos.GetHtmlText(RichEdit: TCustomRichEdit): string;
var
   I, TextLen: Integer;
   Bold, Italic, Underline: Boolean;
begin
   LockWindowUpdate(RichEdit.Handle);
   Bold := False;
   Italic := False;
   Underline := False;
   Result := '';
   TextLen := Length(RichEdit.Text);

   for I := 0 to TextLen - 1 do
   begin
      RichEdit.SelStart := I;
      RichEdit.SelLength := 1;

      if fsBold in RichEdit.SelAttributes.Style then
      begin
         if not Bold then
         begin
            Result := Result + '<b>';
            Bold := True;
         end;
      end
      else
      begin
         if Bold then
         begin
            Result := Result + '</b>';
            Bold := False;
         end;
      end;

      if fsItalic in RichEdit.SelAttributes.Style then
      begin
         if not Italic then
         begin
            Result := Result + '<i>';
            Italic := True;
         end;
      end
      else
      begin
         if Italic then
         begin
            Result := Result + '</i>';
            Italic := False;
         end;
      end;

      if fsUnderline in RichEdit.SelAttributes.Style then
      begin
         if not Underline then
         begin
            Result := Result + '<u>';
            Underline := True;
         end;
      end
      else
      begin
         if Underline then
         begin
            Result := Result + '</u>';
            Underline := False;
         end;
      end;

      Result := Result + Copy(RichEdit.Text, I + 1, 1);
   end;

   if Bold then
   begin
      Result := Result + '</b>';
   end;

   if Italic then
   begin
      Result := Result + '</i>';
   end;

   if Underline then
   begin
      Result := Result + '</u>';
   end;

   LockWindowUpdate(0);
end;

procedure TfrmCursos.grdAtosOficiaisDblClick(Sender: TObject);
begin
   qyAtosOficiais.Edit;

   if not PrincipalForm.ProcuraForm( TForm(frmAtosOficiais) ) then
     Application.CreateForm(TfrmAtosOficiais, frmAtosOficiais);

   frmAtosOficiais.ShowModal;
end;

// quando alguma coisa for arrastada até a grade
procedure TfrmCursos.TDBGTurmasConveniosDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin

  if Source is TTreeView then
  begin

    if fListaConvenios.Tag = 1 then
    Begin
      Mensagem( 'Arraste para a grade de Convênios.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
      Exit;
    End;

   // qTurmasConvenios.FilterOptions := [foNoPartialCompare];

   fListaConvenios.treeofConvenios.EndDrag(true);

   qConvenios.SQL.Clear;
   qConvenios.SQL.add('INSERT INTO TURMAS_CONVENIOS ( TURMA, ANOSEMESTRE, CURSO, CD_INSTITUICAO ) VALUES ');
   qConvenios.SQL.Add('(  :TURMA, :ANOSEMESTRE, :CURSO, :CD_INSTITUICAO )');

   qConvenios.ParamByName('TURMA').AsString := tblTurmas.FieldByName('CODIGO').asString;
   qConvenios.ParamByName('ANOSEMESTRE').AsString := tblTurmas.FieldByName('ANOSEMESTRE').asString;
   qConvenios.ParamByName('CURSO').AsString := tblTurmas.FieldByName('CURSO').asString;
   qConvenios.ParamByName('CD_INSTITUICAO').AsString := glogal_cd_instituicao;

   qConvenios.ExecSQL;

   qTurmasConvenios.close;
   qTurmasConvenios.Open;
  end;

  fListaConvenios.BloquearConveniosTurma( tblTurmasAnoSemestre.AsInteger, tblTurmasCurso.AsString, tblTurmasCodigo.AsString );
  fListaConvenios.iniciaTree;

end;

procedure TfrmCursos.TDBGTurmasConveniosDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;



procedure TfrmCursos.TDBGTurmasConveniosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if  key = VK_DELETE then
   begin
      qConvenios.SQL.Clear;
      qConvenios.SQL.add('delete from turmas_convenios where  cd_turmas_convenios = :cd_turmas_convenios');
      qConvenios.ParamByName('cd_turmas_convenios').AsString := qTurmasConvenios.FieldByName('cd_turmas_convenios').asString;
      qConvenios.ExecSQL;

      qTurmasConvenios.close;
      qTurmasConvenios.Open;
   end;
end;

procedure TfrmCursos.TDBGTurmasDisciplinasOptativasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  if Source is TTreeView then
  begin

   if fDisciplinasOptativas.Tag = 1 then
   Begin
      Mensagem( 'Arraste para a grade de Disciplinas Optativas.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
      Exit;
   End;

   fDisciplinasOptativas.tvDisciplinasOptativas.EndDrag(true);

   // Inclui a disciplina como uma disciplina frente
   qDisciplinasOptativas.SQL.Clear;
   qDisciplinasOptativas.SQL.add('INSERT INTO turmas_disciplinas_optativas ( nr_anosemestre, cd_curso, cd_turma, cd_disciplina_generica, cd_disciplina_optativa ) VALUES ');
   qDisciplinasOptativas.SQL.Add('(:nr_anosemestre, :cd_curso, :cd_turma, :cd_disciplina_generica, :cd_disciplina_optativa)');

   qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('anosemestre').AsInteger;
   qDisciplinasOptativas.ParamByName('cd_curso').AsString := tblTurmas.FieldByName('curso').AsString;
   qDisciplinasOptativas.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('codigo').AsString;
   qDisciplinasOptativas.ParamByName('cd_disciplina_generica').AsInteger := fDisciplinasOptativas.qDisciplinasOptativas.FieldByName('cd_disciplina_generica').AsInteger;
   qDisciplinasOptativas.ParamByName('cd_disciplina_optativa').AsInteger := fDisciplinasOptativas.qDisciplinasOptativas.FieldByName('cd_disciplina_optativa').AsInteger;

   qDisciplinasOptativas.ExecSQL;

   // Recarrega os registros da grid de disciplinas optativas da turma
   qTurmasDisciplinasOptativas.Close;
   qTurmasDisciplinasOptativas.Open;

   // Recarrega os valores das disciplinas optativas para serem incluídas na turma
   fDisciplinasOptativas.CarregaDisciplinasOptativas( tblTurmas.FieldByName('ANOSEMESTRE').AsInteger, tblTurmas.FieldByName('CODIGO').AsString );
  end;
end;

procedure TfrmCursos.TDBGTurmasDisciplinasOptativasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;

procedure TfrmCursos.TDBGTurmasDisciplinasOptativasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if  key = VK_DELETE then
   begin
      if not DM.UsuarioLogado.TemPermissao( 1148, npExcluir, True ) then Exit;

      qDisciplinasOptativas.SQL.Clear;
      qDisciplinasOptativas.SQL.Add('DELETE FROM turmas_disciplinas_optativas');
      qDisciplinasOptativas.SQL.Add('WHERE nr_anosemestre = :nr_anosemestre AND ');
      qDisciplinasOptativas.SQL.Add('cd_curso = :cd_curso AND ');
      qDisciplinasOptativas.SQL.Add('cd_turma = :cd_turma AND ');
      qDisciplinasOptativas.SQL.Add('cd_disciplina_generica = :cd_disciplina_generica AND ');
      qDisciplinasOptativas.SQL.Add('cd_disciplina_optativa = :cd_disciplina_optativa');

      qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := qTurmasDisciplinasOptativas.FieldByName('nr_anosemestre').AsInteger;
      qDisciplinasOptativas.ParamByName('cd_curso').AsString := qTurmasDisciplinasOptativas.FieldByName('cd_curso').AsString;
      qDisciplinasOptativas.ParamByName('cd_turma').AsString := qTurmasDisciplinasOptativas.FieldByName('cd_turma').AsString;
      qDisciplinasOptativas.ParamByName('cd_disciplina_generica').AsInteger := qTurmasDisciplinasOptativas.FieldByName('cd_disciplina_generica').AsInteger;
      qDisciplinasOptativas.ParamByName('cd_disciplina_optativa').AsInteger := qTurmasDisciplinasOptativas.FieldByName('cd_disciplina_optativa').AsInteger;
      qDisciplinasOptativas.ExecSQL;

      qTurmasDisciplinasOptativas.close;
      qTurmasDisciplinasOptativas.Open;
   end;
end;

function TfrmCursos.TemMatriculaNaDisciplina(cd_grade : integer; cd_curso : string; cd_disciplina : integer; nr_serie : integer): Boolean;
begin
   // Verificar se existe matrícula na disciplina
   with DM.qAux2 do begin
      Close;
      SQL.Clear;
      SQL.Add(
      '  SELECT                      ' +
      '    COUNT(*) qtd              ' +
      '  FROM                        ' +
      '    fichaindividual f         ' +
      '    INNER JOIN TURMAS t ON (t.codigo = f.turma and f.anosemestre = t.anosemestre) ' +
	   '    INNER JOIN GRADES g ON (g.cd_grade = t.cd_grade and t.curso = g.CD_CURSO) ' +
	   '    INNER JOIN grades_disciplinas gd ON (gd.CD_GRADE = g.CD_GRADE AND gd.CD_CURSO = f.curso AND gd.CD_DISCIPLINA = f.disciplina) ' +
      '  WHERE                       ' +
      '    gd.cd_grade = ' + inttostr(cd_grade) +  ' AND ' +
      '    gd.cd_curso = ''' + cd_curso +  ''' AND ' +
      '    gd.cd_disciplina = ' + inttostr(cd_disciplina) +  ' AND ' +
      '    gd.nr_serie = ' + inttostr(nr_serie)
      );

      Open;

      result := FieldByName('QTD').AsInteger > 0;

   end;
end;

procedure TfrmCursos.tmSelecaoColigadaTimer(Sender: TObject);
begin
   tmSelecaoColigada.Enabled := False;
   carregarDepartamentos;
   FiltraCursos;
end;

procedure TfrmCursos.tmSelecaoCursoTimer(Sender: TObject);
begin
   tmSelecaoCurso.Enabled := False;
   OnSelectCurso;
end;

procedure TfrmCursos.popPreRequisitoEspecialPopup(Sender: TObject);
Var
  mMenu : TMenuItem;
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npAlterar, True ) then Exit;

   // Selecionar as disciplinas da Grade

   DM.qyAux2.Close();

   DM.qyAux2.SQL.Text :=
     ' SELECT cd_tipo_req, ds_tipo_req FROM disciplinas_tipos_req ORDER BY	ds_tipo_req ';

   DM.qyAux2.Open();

   popPreRequisitoEspecial.Items.Clear;

   while not DM.qyAux2.Eof do begin
      mMenu := TMenuItem.Create(popPreRequisito);

      mMenu.Caption := FillString(Dm.qyAux2.FieldByName('ds_tipo_req').AsString, alRight, '0',2, false);
      mMenu.Tag := Dm.qyAux2.FieldByName('cd_tipo_req').AsInteger;
      mMenu.OnClick := AlteraPreRequisitosEspecial;

      with DM.qyAux1 do
      begin
         Close;
         SQL.Clear;
         SQL.Text := 'SELECT cd_tipo_req FROM	disciplinas_prereq_especial ' +
                     ' WHERE cd_curso = :cd_curso AND	cd_grade = :cd_grade AND ' +
                     ' cd_disciplina = :cd_disciplina AND cd_tipo_req = :cd_tipo_req';
         ParamByName('cd_curso').AsString := qyGradesCD_CURSO.AsString;
         ParamByName('cd_grade').AsInteger := qyGradesCD_GRADE.AsInteger;
         ParamByName('cd_disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
         ParamByName('cd_tipo_req').AsInteger := DM.qyAux2.FieldByName('cd_tipo_req').AsInteger;
         Open;

         if RecordCount > 0 then
            mMenu.Checked := true
         else
            mMenu.Checked := false;
         Close;
      end;

      popPreRequisitoEspecial.Items.Add(mMenu);

      DM.qyAux2.Next;
   end;
end;

procedure TfrmCursos.popPreRequisitoPopup(Sender: TObject);
Var
  mMenu : TMenuItem;
  mSubMenu : TMenuItem;
  iSerie : Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1149, npAlterar, True ) then Exit;

   // Selecionar as disciplinas da Grade

   DM.qyAux2.Close();

   DM.qyAux2.SQL.Text :=
   ' SELECT DISTINCT GD.NR_SERIE, D.CODIGO, D.DESCRICAO, DPR.CD_DISCIPLI ' +
   ' FROM GRADES G ' +
   '      INNER JOIN GRADES_DISCIPLINAS GD ON ( ' +
   '         GD.CD_CURSO = G.CD_CURSO AND GD.CD_GRADE = G.CD_GRADE ' +
   '      ) ' +
   '      INNER JOIN DISCIPLINAS D ON ( ' +
   '         D.CODIGO = GD.CD_DISCIPLINA AND D.CURSO = GD.CD_CURSO ' +
   '      ) ' +
   '      LEFT JOIN DISCIPLINAS_PREREQ DPR ON ( ' +
   '         DPR.CD_CURSO = GD.CD_CURSO AND ' +
   '         DPR.CD_DISCIPLI_PRE = GD.CD_DISCIPLINA AND ' +
   '         DPR.CD_DISCIPLI = :CD_DISCIPLINA AND DPR.CD_GRADE = :CD_GRADE ' +
   '      ) ' +
   ' WHERE G.CD_CURSO = :CD_CURSO AND G.CD_GRADE = :CD_GRADE ' +
   ' ORDER BY GD.NR_SERIE, D.DESCRICAO ';

   DM.qyAux2.ParamByName('CD_CURSO').AsString := qyGradesCD_CURSO.AsString;
   {DM.qyAux2.ParamByName('anosemestre').AsString := tblCursosAnoSemestre.AsString;}
   DM.qyAux2.ParamByName('CD_DISCIPLINA').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
   DM.qyAux2.ParamByName('CD_GRADE').AsInteger := qyGradesCD_GRADE.AsInteger;

   DM.qyAux2.Open();

   popPreRequisito.Items.Clear;

   iSerie := 999999;

   while not DM.qyAux2.Eof do begin

      if iSerie <> DM.qyAux2.FieldByName('NR_SERIE').AsInteger then begin

         mMenu := TMenuItem.Create(popPreRequisito);

         mMenu.Caption := 'Etapa ' + FillString(Dm.qyAux2.FieldByName('NR_SERIE').AsString, alRight, '0',2, false);

         popPreRequisito.Items.Add(mMenu);

         iSerie := DM.qyAux2.FieldByName('NR_SERIE').AsInteger;

      end;

      mSubMenu := TMenuItem.Create(popPreRequisito);

      mSubMenu := TMenuItem.Create(mSubMenu);

      mSubMenu.Caption := DM.qyAux2.FieldByName('DESCRICAO').AsString;
      mSubMenu.Tag := DM.qyAux2.FieldByName('CODIGO').AsInteger;

      mSubMenu.OnClick := AlteraPreRequisitos;

      // Verificar se a disciplina ja está amarrada como pré-requisitada

      if DM.qyAux2.FieldByName('CD_DISCIPLI').AsString <> '' then begin
            mMenu.Checked := True;
            mSubMenu.Checked := True;
      end;
      mMenu.Add(mSubMenu);

      DM.qyAux2.Next;

   end;

end;

procedure TfrmCursos.AlteraPreRequisitos(Sender: TObject);
var
   Bookmark: TBookmark;
   chaveLog, msgLog: string;
begin
 // Retirar o Pré-Requisito

 if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True ) then Exit;

 Bookmark := qyGradesDisciplinas.GetBookmark;
 if TMenuItem(Sender).Checked then begin

      DM.qyAux2.Close;
      Dm.qyAux2.SQL.Text :=
         ' DELETE FROM disciplinas_prereq ' +
         ' WHERE cd_discipli = :disciplina AND ' +
         ' cd_discipli_pre = :disciplina_pre AND ' +
         ' cd_curso = :curso AND ' + 
         ' cd_grade = :grade ';

      DM.qyAux2.ParamByName('disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
      DM.qyAux2.ParamByName('disciplina_pre').AsInteger := TMenuItem(Sender).Tag;
      DM.qyAux2.ParamByName('grade').AsInteger := qyGradesCD_GRADE.AsInteger;
      DM.qyAux2.ParamByName('curso').AsString := qyGradesCD_CURSO.AsString;

      Dm.qyAux2.ExecSQL;

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
             'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
             'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
             'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
             'Removida disciplina pré-requisito: '+IntToStr(TMenuItem(Sender).Tag);

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

 end
 else begin // Acrescentar o Pré-Requisito

      DM.qyAux2.Close;
      Dm.qyAux2.SQL.Text :=
         ' INSERT INTO disciplinas_prereq (cd_curso, cd_discipli, cd_discipli_pre, cd_grade) ' +
         ' VALUES (:curso, :disciplina, :disciplina_pre, :grade ) ';

      DM.qyAux2.ParamByName('disciplina').AsInteger := qyGradesDisciplinasCD_DISCIPLINA.AsInteger;
      DM.qyAux2.ParamByName('disciplina_pre').AsInteger := TMenuItem(Sender).Tag;
      DM.qyAux2.ParamByName('curso').AsString := qyGradesCD_CURSO.AsString;
      DM.qyAux2.ParamByName('grade').AsInteger := qyGradesCD_GRADE.AsInteger;

      Dm.qyAux2.ExecSQL;

      // Grava log das alterações realizadas na grade curricular
      chaveLog := qyGradesDisciplinasCD_GRADE.AsString +';'+ qyGradesDisciplinasCD_CURSO.AsString +';'+ qyGradesDisciplinasCD_DISCIPLINA.AsString +';'+ qyGradesDisciplinasNR_SERIE.AsString;
      // Cria a mensagem do LOG que contém as informações alteradas
      msgLog := 'Grade: '+ qyGradesDisciplinas.FieldByName('CD_GRADE').AsString +CHR(13)+
             'Curso: '+ qyGradesDisciplinas.FieldByName('CD_CURSO').AsString +CHR(13)+
             'Disciplina: '+ qyGradesDisciplinas.FieldByName('CD_DISCIPLINA').AsString +CHR(13)+
             'Série: '+ qyGradesDisciplinas.FieldByName('NR_SERIE').AsString +CHR(13)+
             'Incluida disciplina pré-requisito: '+IntToStr(TMenuItem(Sender).Tag);

      // Registro log no módulo 1006 - Cadastro de Departamentos e Cursos (mesmo que é checada a permissão de acesso)
      DM.setLog( 1006, 'Alteracao', chaveLog, qyCursosColigadasCD_COLIGADA.AsInteger, msgLog );

 end;
//   qyGradesDisciplinas.Close();
//   qyGradesDisciplinas.Open();
   qyGradesDisciplinas.Refresh;
   if qyGradesDisciplinas.BookmarkValid(Bookmark) then
      qyGradesDisciplinas.GotoBookmark(Bookmark);
end;

procedure TfrmCursos.tblTurmasBeforeDelete(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npExcluir, True ) then Abort;
   DM.setLog(1006, 'Exclusao', tblTurmasCodigo.AsString + ';' + tblTurmasAnoSemestre.AsString, tblTurmascd_coligada.AsInteger, tblTurmasdescricao.AsString);
end;

procedure TfrmCursos.tblTurmasBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npAlterar, True) then Abort;
end;

procedure TfrmCursos.tblTurmasBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npIncluir, True ) then Abort;
end;

procedure TfrmCursos.tblTurmasBeforeOpen(DataSet: TDataSet);
var
  qryBuscaResponsavel : TUMZQuery;
begin

end;

procedure TfrmCursos.tblDiscAfterInsert(DataSet: TDataSet);
begin
   dbCodDiscPai.Text := '';
   dbCodDiscPai.Visible := true and not(DM.lite);
   label59.Visible := true and not(DM.lite);
end;

procedure TfrmCursos.tblDiscBeforeDelete(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1112, npExcluir, True) then Abort;
   DM.setLog(1006, 'Exclusao', tblDiscCurso.AsString + ';' + tblDisccodigo.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, tblDiscDescricao.AsString);
end;

procedure TfrmCursos.tblDiscBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1112, npAlterar, True ) then Abort;
end;

procedure TfrmCursos.tblDiscBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1112, npIncluir, True ) then Abort;
end;

procedure TfrmCursos.qDocumentosNecessariosBeforeDelete(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1150, npExcluir, True ) then Abort;
   DM.setLog(1006, 'Exclusao', qyCursosMestreCD_CURSO.AsString + ';' + qDocumentosNecessariosCod_Documento.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, qDocumentosNecessariosDocumento.AsString);
end;

procedure TfrmCursos.qDocumentosNecessariosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1150, npAlterar, True ) then Abort;
end;

procedure TfrmCursos.qDocumentosNecessariosBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1150, npIncluir, True ) then Abort;
end;

procedure TfrmCursos.qDocumentosNecessariosBeforePost(DataSet: TDataSet);
begin

  if qDocumentosNecessarios.State = dsInsert then begin
      DM.setLog(1006, 'Inclusao', qyCursosMestreCD_CURSO.AsString + ';' + qDocumentosNecessariosCod_Documento.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, qDocumentosNecessariosDocumento.AsString);
  end else begin
      DM.setLog(1006, 'Alteracao', qyCursosMestreCD_CURSO.AsString + ';' + qDocumentosNecessariosCod_Documento.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, qDocumentosNecessariosDocumento.AsString);
  end;

end;

procedure TfrmCursos.qyAtosOficiaisBeforeDelete(DataSet: TDataSet);
begin
   deletarAtosOficiais();
end;

procedure TfrmCursos.qyAtosOficiaisBeforeEdit(DataSet: TDataSet);
begin
if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, true ) then Abort;
end;

procedure TfrmCursos.tblGradeBeforeEdit(DataSet: TDataSet);
begin
if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, true ) then Abort;
end;

procedure TfrmCursos.tblEmentasBeforeEdit(DataSet: TDataSet);
begin
if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, true ) then Abort;
end;

procedure TfrmCursos.tblEmentasBeforePost(DataSet: TDataSet);
begin
   tblEmentasTX_BIB_BASICA_HTML.AsString := GetHtmlText(dbreBibBasica);
   tblEmentasTX_BIB_COMP_HTML.AsString := GetHtmlText(dbreBibComp);
   tblEmentasTX_BIB_SUP_HTML.AsString := GetHtmlText(dbreBibSup);
   tblEmentasTX_JUSTIFICATIVA_HTML.AsString := GetHtmlText(dbreJustificativa);
   tblEmentasTX_HABILIDADES_COMPET_HTML.AsString := GetHtmlText(dbreHabilidadesCompetencias);
  if tblEmentas.State = dsInsert then
  begin
      DM.setLog(1006, 'Inclusao', tblEmentascurso.AsString + ';' + tblEmentascodigo.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, 'Nova Ementa');
  end
  else
  begin
      DM.setLog(1006, 'Alteracao', tblEmentascurso.AsString + ';' + tblEmentascodigo.AsString, DM.UsuarioLogado.GetColigadaLogada.Codigo, 'Ementa alterada');
  end;
end;

procedure TfrmCursos.pcGeralChanging(Sender: TObject; var AllowChange: Boolean);
begin
   pcGeral.Tag := pcGeral.TabIndex;

   if (btnSalvar.Enabled) OR
      (qyColigada.State IN [dsInsert, dsEdit]) OR
      (qyCursosColigadas.State IN [dsInsert, dsEdit]) OR
      (tblDeptos.State IN [dsInsert, dsEdit]) OR
      (qyCursosMestre.State IN [dsInsert, dsEdit]) OR
      (tblTurmas.State IN [dsInsert, dsEdit]) OR
      (tblDisc.State IN [dsInsert, dsEdit]) OR
      (qyGrades.State IN [dsInsert, dsEdit]) OR
      (qyGradesDisciplinas.State IN [dsInsert, dsEdit]) OR
      (qDocumentosNecessarios.State IN [dsInsert, dsEdit]) then
   begin
      Mensagem('Salve as alterações antes de passar para a próxima guia.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      AllowChange := False;
   end
   else
      AllowChange := True;

end;

procedure TfrmCursos.pgTurmasChange(Sender: TObject);
begin
   pnTurmasFinanceiro.Visible := False;
   case pgTurmas.TabIndex of
      3: begin
         if not DM.UsuarioLogado.TemPermissao( 1151, npAcesso, True, DM.UsuarioLogado.GetColigadaLogada.Codigo ) then
         begin
            pgTurmas.TabIndex := pgTurmas.Tag;
         end else begin
            pnTurmasFinanceiro.Visible := True;
         end;
      end;      
   end;

   // Apresenta ou Esconde a guia de disciplinas optativas
   if tblTurmasSerie.AsInteger = -100 then
   begin
      // Se a turma for da série -100 a guia nao precisa ser mostrada
      Optativas.TabVisible := False;
   end else begin
      // Se a turma for de qualquer outra sério exibe a guia de optativas
      Optativas.TabVisible := True;
   end;
end;

procedure TfrmCursos.pgTurmasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   pgTurmas.Tag := pgTurmas.TabIndex;
end;

procedure TfrmCursos.grdCursosDblClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npAcesso, True ) then
   begin
      Exit;
   end
   else
   begin
      carregarTurmas();
      pcGeral.ActivePage := tsTurmas;
      DBLookupComboBox10.Enabled := DM.UsuarioLogado.TemPermissao( 1151, npAlterar, False );
      sbLimparConta.Enabled := DM.UsuarioLogado.TemPermissao( 1151, npAlterar, False );
      mostraAba(pnTurmas);
      if not qUnidadesCertificadoras.Active then
         qUnidadesCertificadoras.Open;

      if not qrySituacoesTurmas.Active then
         qrySituacoesTurmas.Open;

      pcGeralChange(nil);
   end;
end;

procedure TfrmCursos.btIncluirOptativaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npIncluir, True ) then Exit;

   qDisciplinasOptativas.Close;
   qDisciplinasOptativas.SQL.Clear;
   qDisciplinasOptativas.SQL.Text :=
     ' SELECT ' +
     '    COUNT(*) total ' +
     ' FROM ' +
     '    turmas t ' +
     '    INNER JOIN grades_disciplinas gd ON ( ' +
     '       gd.cd_grade = t.cd_grade AND ' +
     '       gd.nr_serie = t.serie AND ' +
     '       gd.cd_curso = t.curso ' +
     '    ) ' +
     ' WHERE ' +
     '    t.codigo LIKE :cd_turma AND ' +
     '    t.anosemestre = :nr_anosemestre AND ' +
     '    gd.sn_optativa = 1';

   qDisciplinasOptativas.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('CODIGO').AsString;
   qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('ANOSEMESTRE').AsInteger;

   qDisciplinasOptativas.Open;

   if ( qDisciplinasOptativas.FieldByName('total').AsInteger = 0 ) then
   begin
      Mensagem('Não existem disciplinas optativas configuradas na etapa dessa turma. Acesse Cadastros > Cursos e Turmas > Grade Curricular e informe as disciplinas optativas na etapa da turma.',  'Informação',  MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   qDisciplinasOptativas.Close;
   qDisciplinasOptativas.SQL.Clear;
   qDisciplinasOptativas.SQL.Text :=
     ' SELECT ' +
     '    COUNT(*) total ' +
     ' FROM ' +
     '    turmas t ' +
     '    INNER JOIN grades_disciplinas gd ON ( ' +
     '       gd.cd_grade = t.cd_grade AND ' +
     '       gd.cd_curso = t.curso ' +
     '    ) ' +
     ' WHERE ' +
     '    t.codigo LIKE :cd_turma AND ' +
     '    t.anosemestre = :nr_anosemestre AND ' +
     '    gd.nr_serie = -100';

   qDisciplinasOptativas.ParamByName('cd_turma').AsString := tblTurmas.FieldByName('CODIGO').AsString;
   qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := tblTurmas.FieldByName('ANOSEMESTRE').AsInteger;

   qDisciplinasOptativas.Open;

   if ( qDisciplinasOptativas.FieldByName('total').AsInteger = 0 ) then
   begin
      Mensagem('Não foi encontrada nenhuma disciplina inserida na etapa "Optativa". Acesse Cadastros > Cursos e Turmas > Grade Curricular e insera as disciplinas na etapa "Optativa" para prosseguir.',  'Informação',  MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   if ( fDisciplinasOptativas = nil ) then
   begin
      Application.CreateForm( TfDisciplinasOptativas, fDisciplinasOptativas );
   end;

   // A Tag serve para indicar que a janela de Optativas foi aberta
   fDisciplinasOptativas.Tag := 2;
   fDisciplinasOptativas.CarregaDisciplinasOptativas( tblTurmas.FieldByName('ANOSEMESTRE').AsInteger, tblTurmas.FieldByName('CODIGO').AsString );
   fDisciplinasOptativas.Show;

end;

procedure TfrmCursos.Button2Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1148, npExcluir, True ) then Exit;

   qDisciplinasOptativas.SQL.Clear;
   qDisciplinasOptativas.SQL.Add('DELETE FROM turmas_disciplinas_optativas');
   qDisciplinasOptativas.SQL.Add('WHERE nr_anosemestre = :nr_anosemestre AND ');
   qDisciplinasOptativas.SQL.Add('cd_curso = :cd_curso AND ');
   qDisciplinasOptativas.SQL.Add('cd_turma = :cd_turma AND ');
   qDisciplinasOptativas.SQL.Add('cd_disciplina_generica = :cd_disciplina_generica AND ');
   qDisciplinasOptativas.SQL.Add('cd_disciplina_optativa = :cd_disciplina_optativa');

   qDisciplinasOptativas.ParamByName('nr_anosemestre').AsInteger := qTurmasDisciplinasOptativas.FieldByName('nr_anosemestre').AsInteger;
   qDisciplinasOptativas.ParamByName('cd_curso').AsString := qTurmasDisciplinasOptativas.FieldByName('cd_curso').AsString;
   qDisciplinasOptativas.ParamByName('cd_turma').AsString := qTurmasDisciplinasOptativas.FieldByName('cd_turma').AsString;
   qDisciplinasOptativas.ParamByName('cd_disciplina_generica').AsInteger := qTurmasDisciplinasOptativas.FieldByName('cd_disciplina_generica').AsInteger;
   qDisciplinasOptativas.ParamByName('cd_disciplina_optativa').AsInteger := qTurmasDisciplinasOptativas.FieldByName('cd_disciplina_optativa').AsInteger;
   qDisciplinasOptativas.ExecSQL;

   qTurmasDisciplinasOptativas.close;
   qTurmasDisciplinasOptativas.Open;
end;
{
Função para atualizar a base de dados quando houver uma alteracao
de grau
}
procedure TfrmCursos.atualizaGrauCursos(cd_curso : string);
const
   SQL_ATUALIZA_TURMAS =
   'UPDATE turmas t '+
   'INNER JOIN cursos_mestre cm ON(t.curso = cm.CD_CURSO) '+
   'SET t.grau = cm.NR_GRAU WHERE ((t.grau <> cm.NR_GRAU)OR (t.grau IS NULL)) AND cm.cd_curso = :CURSO_EM_ALTERACAO';

   SQL_ATUALIZA_FICHAINDIVIDUAL =
   'UPDATE turmas t '+
   'INNER JOIN fichaindividual f ON(t.anosemestre=f.anosemestre and t.codigo=f.turma) '+
   'SET f.grau = t.grau WHERE ((t.grau <> f.grau) OR (f.grau IS NULL))AND f.curso = :CURSO_EM_ALTERACAO ';

   SQL_ATUALIZA_FICHA_REMATRICULAS =
   'UPDATE turmas t INNER JOIN fichaindividual_rematriculas fr ON(t.anosemestre=fr.anosemestre and t.codigo=fr.turma and t.serie=fr.serie) '+
   'SET fr.cd_grau = t.grau WHERE ((t.grau <> fr.cd_grau) OR (fr.cd_grau IS NULL)) AND t.curso = :CURSO_EM_ALTERACAO; ';
var
   qyAtualizaTurmas, qyAtualizaFichaIndividual, qyAtualizaFichaRematriculas: TUMZQuery;
begin
   DM.CriarConsulta(qyAtualizaTurmas);
   DM.CriarConsulta(qyAtualizaFichaIndividual);
   DM.CriarConsulta(qyAtualizaFichaRematriculas);

   qyAtualizaTurmas.SQL.Text:= SQL_ATUALIZA_TURMAS;
   qyAtualizaFichaIndividual.SQL.Text := SQL_ATUALIZA_FICHAINDIVIDUAL;
   qyAtualizaFichaRematriculas.SQL.Text := SQL_ATUALIZA_FICHA_REMATRICULAS;

   qyAtualizaTurmas.ParamByName('CURSO_EM_ALTERACAO').AsString := cd_curso;
   qyAtualizaFichaIndividual.ParamByName('CURSO_EM_ALTERACAO').AsString :=  cd_curso;
   qyAtualizaFichaRematriculas.ParamByName('CURSO_EM_ALTERACAO').AsString :=  cd_curso;

   qyAtualizaTurmas.ExecSQL;
   qyAtualizaFichaIndividual.ExecSQL;
   qyAtualizaFichaRematriculas.ExecSQL;

end;

procedure TfrmCursos.buscaSala(cd_sala: integer);
const
   SQL_BUSCA_SALA_TURMA = 'SELECT DS_SALA FROM unim_sala WHERE id = :CD_SALA ';
var
  qryBuscaSala: TUMZQuery;
begin
  DM.CriarConsulta(qryBuscaSala);
  qryBuscaSala.SQL.Text := SQL_BUSCA_SALA_TURMA;
  qryBuscaSala.ParamByName('CD_SALA').AsInteger := cd_sala;
  qryBuscaSala.Open();

  edSala.Text:= '';
  edSala.Text:= qryBuscaSala.FieldByName('DS_SALA').AsString;
end;
end.

