unit uAvaliacoes_Parametros;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
   ZConnection, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls, General, ComCtrls,
   ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, StdCtrls, Mask,
   ImgList, ToolWin, Menus , uItemCombo, CheckLst, ZSqlUpdate, UMLookupComboBox,
   Variants;

type
  Tfrm_Avaliacoes_parametros = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    grd: TDBGrid;
    Panel2: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    tblAvaliacoes: TUMZQuery;
    tblAvaliacoescd_avaliacao: TSmallintField;
    tblAvaliacoesds_avaliacao: TStringField;
    tblAvaliacoesnr_avaliacoes: TSmallintField;
    tblAvaliacoescd_periodo_avaliacao: TSmallintField;
    tblAvaliacoesds_cond_aprov_direta: TStringField;
    tblAvaliacoesds_cond_repro_direta: TStringField;
    tblAvaliacoesds_formula_media_final: TStringField;
    tblAvaliacoesds_formula_media_exame: TStringField;
    tblAvaliacoesds_formula_media_segunda: TStringField;
    tblAvaliacoesds_cond_aprov_exame: TStringField;
    tblAvaliacoesds_cond_aprov_segunda: TStringField;
    tblAvaliacoesnr_max_disci_exame: TSmallintField;
    tblAvaliacoesnr_max_disci_segunda: TSmallintField;
    tblAvaliacoessn_conceitos: TStringField;
    tblAvaliacoessn_descricao: TStringField;
    tblAvaliacoessn_exame: TStringField;
    tblAvaliacoessn_pi: TStringField;
    tblAvaliacoessn_segunda_epoca: TStringField;
    tblAvaliacoessn_frequencia_global: TStringField;
    tblAvaliacoesds_frequencia_tipo: TStringField;
    tblAvaliacoessn_recuperacao: TStringField;
    tblAvaliacoesds_formula_recuperacao: TStringField;
    tblAvaliacoesnr_casas_decimais: TSmallintField;
    tblAvaliacoesds_cond_recuperacao: TStringField;
    dsAvaliacoes: TDataSource;
    tblPeriodicidade: TUMZQuery;
    tblPeriodicidadecd_periodo_avaliacao: TSmallintField;
    tblPeriodicidadeds_periodicidade: TStringField;
    tblPeriodicidadeds_periodo_avaliacao: TStringField;
    tblPeriodicidadeds_periodo_abreviado: TStringField;
    tblAvaliacoesdescPeriodoAvaliacoes: TStringField;
    Panel5: TPanel;
    pgParametros: TPageControl;
    tsMedia1: TTabSheet;
    tsMedia2: TTabSheet;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    tsMedia3: TTabSheet;
    tblAvaliacoesvl_arredondamento: TFloatField;
    tblAvaliacoesds_formula_media_anual: TMemoField;
    pmQtd: TPopupMenu;
    tblAvaliacoessn_notas_diario_online: TStringField;
    tblAvaliacoessn_notas_diario: TStringField;
    tblAvaliacoessn_desblo_coorde: TStringField;
    tblAvaliacoessn_diario_imp_notas: TStringField;
    tblAvaliacoessn_diario_imp_freqs: TStringField;
    tblAvaliacoessn_notas_truncar: TStringField;
    tblAvaliacoessn_diario_imp_contprog: TStringField;
    tblAvaliacoesds_nota_exame: TStringField;
    tblAvaliacoesds_nota_segunda: TStringField;
    ScrollBox1: TScrollBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label12: TLabel;
    ScrollBox2: TScrollBox;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    DBCheckBox7: TDBCheckBox;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    DBEdit9: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    Label20: TLabel;
    DBEdit6: TDBEdit;
    Label21: TLabel;
    DBEdit19: TDBEdit;
    ScrollBox3: TScrollBox;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBCheckBox13: TDBCheckBox;
    Label22: TLabel;
    tblAvaliacoessn_medias_truncar: TStringField;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    tblAvaliacoessn_anual_truncar: TStringField;
    tsDiarioOnline: TTabSheet;
    tsDiarioEletro: TTabSheet;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    tblAvaliacoessn_diario_online_recalc_medias: TSmallintField;
    tblAvaliacoessn_diario_online: TSmallintField;
    tblAvaliacoessn_diario_eletro: TIntegerField;
    tblAvaliacoessn_diario_online_aulas: TSmallintField;
    tblAvaliacoessn_diario_online_provas: TSmallintField;
    tblAvaliacoessn_diario_online_bloque_aulas: TIntegerField;
    tblAvaliacoessn_diario_online_bloque_provas: TIntegerField;
    tblAvaliacoesnr_casas_decimais_forcado: TIntegerField;
    tblAvaliacoessn_altera_notas_direta: TIntegerField;
    DBCheckBox17: TDBCheckBox;
    ckBaixar: TDBCheckBox;
    ckImportarFrequencia: TDBCheckBox;
    ckImportarConteudo: TDBCheckBox;
    ckImportarNotas: TDBCheckBox;
    ckDigitaMedias: TDBCheckBox;
    ckOnline: TDBCheckBox;
    ckOnlineRecalcMedias: TDBCheckBox;
    ckOnlineAulas: TDBCheckBox;
    ckOnlineProvas: TDBCheckBox;
    ckOnlineBloqueAulas: TDBCheckBox;
    ckOnlineBloqueProvas: TDBCheckBox;
    ckOnlineAlteracaoDireta: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    tblAvaliacoessn_converter_notas_nulas: TIntegerField;
    DBCheckBox10: TDBCheckBox;
    tblAvaliacoessn_mostrar_alunos_curs_padrao: TSmallintField;
    DBCheckBox11: TDBCheckBox;
    tblAvaliacoessn_ins_aulas_semhorario: TSmallintField;
    sbConceitos: TSpeedButton;
    pnConceitos: TPanel;
    DBGrid1: TDBGrid;
    dsConceitos: TDataSource;
    qyConceitos: TUMZQuery;
    qyConceitosnr_inicial: TFloatField;
    qyConceitosnr_final: TFloatField;
    qyConceitosds_conceito: TStringField;
    qyConceitoscd_avaliacao: TSmallintField;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label23: TLabel;
    tblAvaliacoessn_ajuste_apos_recuperacao: TSmallintField;
    Label29: TLabel;
    dbeCasasArredondamentoForcado: TDBEdit;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    tblAvaliacoesds_formula_padrao: TStringField;
    tblAvaliacoessn_obrigar_formula_padrao: TSmallintField;
    DBCheckBox18: TDBCheckBox;
    DBEdit21: TDBEdit;
    Label25: TLabel;
    ckbForcadoCima: TCheckBox;
    ckbForcadoBaixo: TCheckBox;
    ckbForcadoMediaCima: TCheckBox;
    ckbForcadoMediaBaixo: TCheckBox;
    tblAvaliacoestp_ajuste_forcado: TSmallintField;
    tblAvaliacoestp_ajuste_forcado_media: TSmallintField;
    tblAvaliacoesds_criterio_recuperacao: TStringField;
    tblAvaliacoesds_formula_media_sem_pi: TStringField;
    tblAvaliacoessn_diario_online_mostra_ajuste: TSmallintField;
    DBCheckBox19: TDBCheckBox;
    tsAvaliacaoPeriodica: TTabSheet;
    ScrollBox6: TScrollBox;
    Label26: TLabel;
    DBEdit22: TDBEdit;
    Label27: TLabel;
    DBEdit23: TDBEdit;
    tblAvaliacoesds_formula_periodo: TStringField;
    tblAvaliacoesds_condicao_situacao_periodo: TStringField;
    Label28: TLabel;
    DBEdit24: TDBEdit;
    tsCurso: TTabSheet;
    Label30: TLabel;
    DBEdit25: TDBEdit;
    tblAvaliacoesds_formula_media_curso: TStringField;
    DBCheckBox20: TDBCheckBox;
    tblAvaliacoessn_usar_media_curso: TSmallintField;
    Label31: TLabel;
    Label32: TLabel;
    TabSheet1: TTabSheet;
    tblAvaliacoesds_sigla: TMemoField;
    Label33: TLabel;
    DBMemo2: TDBMemo;
    Label34: TLabel;
    Label35: TLabel;
    tsDiarioOnline2: TTabSheet;
    DBEdit26: TDBEdit;
    Label36: TLabel;
    ckbBloqDigProf: TCheckBox;
    tblAvaliacoessn_extra_classe: TSmallintField;
    tblAvaliacoessn_descricao_fixa: TStringField;
    tblAvaliacoessn_freque_pergunta: TSmallintField;
    tblAvaliacoessn_freque_pergunta_padrao: TSmallintField;
    tblAvaliacoessn_professor_fecha_diario: TSmallintField;
    tblAvaliacoesnr_qtd_aulas_impressao: TSmallintField;
    dbchkAulaExtra: TDBCheckBox;
    dbchkExtraClasse: TDBCheckBox;
    dbchkFechaDiarioAntes: TDBCheckBox;
    Label37: TLabel;
    DBEdit27: TDBEdit;
    Label38: TLabel;
    DBEdit28: TDBEdit;
    tblAvaliacoesnr_notas_max_alteracoes: TSmallintField;
    Label39: TLabel;
    DBEdit29: TDBEdit;
    tblAvaliacoessn_digita_exame_diario_online: TSmallintField;
    dbchkExameDiarioOnline: TDBCheckBox;
    Label40: TLabel;
    DBEdit30: TDBEdit;
    tblAvaliacoesds_formula_pi: TStringField;
    lbTipoHorario: TLabel;
    tblAvaliacoescd_tipo_horario: TSmallintField;
    cbTipoHorario: TComboBox;
    ScrollBox7: TScrollBox;
    lbAproDireta: TLabel;
    lbAproExame: TLabel;
    lbAprovSEpoca: TLabel;
    dsSituacoes: TDataSource;
    qySituacoes: TUMZQuery;
    cbAprovDireta: TDBLookupComboBox;
    cbAprovExame: TDBLookupComboBox;
    cbAprov2Epoca: TDBLookupComboBox;
    tblAvaliacoescd_situacao_aprov_direta: TIntegerField;
    tblAvaliacoescd_situacao_aprov_exame: TIntegerField;
    tblAvaliacoescd_situacao_aprov_2epoca: TIntegerField;
    qySituacoescd_situacao: TIntegerField;
    qySituacoesds_situacao: TStringField;
    qySituacoesds_sigla_situacao: TStringField;
    qySituacoescd_situacao_pai: TIntegerField;
    tblAvaliacoeslookupSitAprovDireta: TStringField;
    tblAvaliacoeslookupSitAprovExame: TStringField;
    tblAvaliacoeslookupSitAprov2Epoca: TStringField;
    dbckFrequenciaGlobal: TDBCheckBox;
    tblAvaliacoessn_frequencia_turma: TSmallintField;
    dbSNAtividadesCad: TDBCheckBox;
    tblAvaliacoessn_diario_online_atividades: TSmallintField;
    DBCheckBox21: TDBCheckBox;
    Shape1: TShape;
    tblAvaliacoessn_conceitos_parciais: TStringField;
    lblNrProficiencia: TLabel;
    tblAvaliacoesnr_media_proficiencia: TFloatField;
    dbNrMediaProficiencia: TDBEdit;
    DBCheckBox22: TDBCheckBox;
    tblAvaliacoessn_alterar_nota_exame: TIntegerField;
    dbSNDigitaTodasNotas: TDBCheckBox;
    tblAvaliacoessn_digita_todas_notas: TSmallintField;
    bvlSep1: TBevel;
    lblNomeExameEtapa: TLabel;
    tblAvaliacoesnm_nome_exame_etapa: TStringField;
    tblAvaliacoesnm_nome_exame_especial: TStringField;
    dbeNomeExameEtapa: TDBEdit;
    bvlSep2: TBevel;
    lblNomeExameEspecial: TLabel;
    dbeNomeExameEspecial: TDBEdit;
    dbchRecorrencia: TDBCheckBox;
    lblTipoTitulo: TLabel;
    qryTiposTitulo: TUMZQuery;
    qryTiposTitulocd_tipo_titulo: TSmallintField;
    qryTiposTitulods_tipo_titulo: TStringField;
    qryTiposTituloct_tipo_titulo: TSmallintField;
    qryTiposTitulocd_padrao: TSmallintField;
    qryTiposTitulovl_padrao: TFloatField;
    qryTiposTitulonr_parcela: TSmallintField;
    qryTiposTitulosn_faturamento: TSmallintField;
    qryTiposTitulods_grupo_boleto: TStringField;
    qryTiposTitulosn_libera_juros: TSmallintField;
    dsTiposTitulo: TDataSource;
    dblcTiposTitulo: TDBLookupComboBox;
    tblAvaliacoeslfTipoTiulo: TStringField;
    tblAvaliacoescd_titulo_2epoca: TSmallintField;
    bvlSep3: TBevel;
    tblAvaliacoessn_falta_exame_forca_2epoca: TSmallintField;
    dbchForcar2epoca: TDBCheckBox;
    Label41: TLabel;
    DBEdit31: TDBEdit;
    ToolButton5: TToolButton;
    btnCopiaParametro: TToolButton;
    qyDuplicaRegistro: TUMZQuery;
    tblAvaliacoescd_disci_frequencia: TLargeintField;
    tblAvaliacoesnr_maximo_aulas: TLargeintField;
    tblAvaliacoesnr_periodos: TLargeintField;
    tblAvaliacoesnr_dias_diario_bloq_provas: TLargeintField;
    tblAvaliacoescd_situacao_concluida: TLargeintField;
    tblAvaliacoesnr_inicio_aulas_extras: TLargeintField;
    qryTiposTitulocd_conta: TLargeintField;
    qryTiposTitulocd_conta_debito: TLargeintField;
    dbSnFreque: TDBCheckBox;
    dbSnfrequePerguntaPadrao: TDBCheckBox;
    tblAvaliacoesSN_GERAR_TAXA_RECORRENCIA: TSmallintField;
    tblAvaliacoesNR_CASAS_FORCADO_MEDIA: TIntegerField;
    tblAvaliacoesSN_NOTAS: TStringField;
    tblAvaliacoesSN_COPIAR_CONTEUDO_PORDATA: TSmallintField;
    tblAvaliacoesSN_PROFES_DIGITA_PESO: TStringField;
    DBCheckBox23: TDBCheckBox;
    tblAvaliacoescalcular_media_fecha_diario: TSmallintField;
    dbchGerarAulasDatas: TDBCheckBox;
    tblAvaliacoessn_aulas_datas: TSmallintField;
    tsTiposProva: TTabSheet;
    Label42: TLabel;
    clbProvasTiposNaoUsado: TListBox;
    Label43: TLabel;
    Label44: TLabel;
    btnAdicionarProvaTipo: TButton;
    btnRemoverProvaTipo: TButton;
    clbProvasTiposUsado: TListBox;
    qyProvasUsadas: TUMZQuery;
    dsProvasUsadas: TDataSource;
    qyProvasUsadasUpdate: TZUpdateSQL;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    btnSalvarTipoProva: TToolButton;
    btnCancelarTipoProva: TToolButton;
    ToolButton15: TToolButton;
    GroupBox1: TGroupBox;
    Label48: TLabel;
    edQuantidadeMinima: TDBEdit;
    cbSemLimiteMinima: TDBCheckBox;
    edQuantidadeMaxima: TDBEdit;
    cbSemLimiteMaxima: TDBCheckBox;
    Label45: TLabel;
    GroupBox3: TGroupBox;
    dbrgPadraoBloqueado: TDBRadioGroup;
    Label46: TLabel;
    edPeso: TDBEdit;
    cbSemPesoFixo: TDBCheckBox;
    qyProvasUsadascd_avaliacao: TIntegerField;
    qyProvasUsadascd_avaliacao_tipo: TIntegerField;
    qyProvasUsadasnr_peso: TIntegerField;
    qyProvasUsadassn_bloqueada: TSmallintField;
    qyProvasUsadasnr_qtd_maxima: TIntegerField;
    qyProvasUsadasnr_qtd_minima: TIntegerField;
    qyProvasUsadassn_sem_limite_minima: TSmallintField;
    qyProvasUsadassn_sem_limite_maxima: TSmallintField;
    qyProvasUsadasds_avaliacao: TStringField;
    qyProvasUsadassn_sem_peso_fixo: TSmallintField;
    qyProvasUsadascd_tipo: TIntegerField;
    qyDuplicaTipoAvaliacaoParametro: TUMZQuery;
    qyProvasUsadasds_chave: TStringField;
    tblAvaliacoessn_exibir_descricao: TSmallintField;
    DBCheckBox24: TDBCheckBox;
    sbxTiposProva: TScrollBox;
    Label47: TLabel;
    cbAprovSuficiencia: TUMLookupComboBox;
    tblAvaliacoescd_situacao_proficiencia: TIntegerField;
    tblAvaliacoeslookupSituacaoProficiencia: TStringField;
    DBCheckBox25: TDBCheckBox;
    tblAvaliacoessn_agrupar_aulas_online: TSmallintField;
    pgPrazos: TTabSheet;
    Label49: TLabel;
    GroupBox2: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    tblAvaliacoesds_cronograma_visualiza_inicio: TStringField;
    tblAvaliacoesds_cronograma_visualiza_fim: TStringField;
    tblAvaliacoesds_cronograma_notas_inicio: TStringField;
    tblAvaliacoesds_cronograma_notas_fim: TStringField;
    tblAvaliacoesds_cronograma_aulas_inicio: TStringField;
    tblAvaliacoesds_cronograma_aulas_fim: TStringField;
    tblAvaliacoesds_cronograma_liberacao: TStringField;
    DBEInicioDiario: TDBEdit;
    DBEFimDiario: TDBEdit;
    GroupBox7: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    DBEInicioNota: TDBEdit;
    DBEFimNota: TDBEdit;
    GroupBox4: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    DBEInicioFrequencia: TDBEdit;
    DBEFimFrequencia: TDBEdit;
    GroupBox5: TGroupBox;
    Label53: TLabel;
    DBELiberacaoResultado: TDBEdit;
    Label50: TLabel;
    DBEdit32: TDBEdit;
    tblAvaliacoesnr_casas_decimais_frequencia: TSmallintField;
    DBRadioGroup2: TDBRadioGroup;
    tblAvaliacoesds_frequencia_registro: TStringField;
    DBCheckBox26: TDBCheckBox;
    tblAvaliacoessn_calcular_media_aritmetica: TSmallintField;
    DBCheckBox27: TDBCheckBox;
    tblAvaliacoessn_calculo_media_automatico: TSmallintField;
    DBCheckBox28: TDBCheckBox;
    tblAvaliacoessn_observacao_nota: TSmallintField;
    Label56: TLabel;
    Bevel1: TBevel;
    DBCheckBox29: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    Bevel2: TBevel;
    tblAvaliacoessn_agrupar_avaliacao_tipo: TSmallintField;
    tblAvaliacoessn_media_notas_digitadas: TSmallintField;
    DBCheckBox30: TDBCheckBox;
    tblAvaliacoessn_notas_calcular_medias: TSmallintField;
    Label57: TLabel;
    Label60: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBCheckBox31: TDBCheckBox;
    tblAvaliacoessn_falta_cancela_taxa: TSmallintField;
    DBCheckBox32: TDBCheckBox;
    tblAvaliacoessn_verificar_data_matricula: TSmallintField;
    DBEdit35: TDBEdit;
    Label61: TLabel;
    tblAvaliacoesvl_media_arredondamento: TFloatField;
    tblAvaliacoesvl_media_arredondamento_exame: TFloatField;
    tblAvaliacoesvl_media_arredondamento_2epoca: TFloatField;
    lbArredondamentoExame: TLabel;
    dbArredondamentoExame: TDBEdit;
    Bevel4: TBevel;
    dbArredondamento2Epoca: TDBEdit;
    lbArredondamento2Epoca: TLabel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    tblAvaliacoessn_libera_freq_apos_fim_etapa: TSmallintField;
    DBCheckBox34: TDBCheckBox;
    tblAvaliacoessn_preencher_notas_nulas_zero: TSmallintField;
    tblAvaliacoesvl_ajuste_min: TFloatField;
    tblAvaliacoesvl_ajuste_max: TFloatField;
    tblAvaliacoescd_coligada_matriz: TIntegerField;
    Label62: TLabel;
    dbedValorHoraAula: TDBEdit;
    tblAvaliacoesvl_hora_aula: TFloatField;
    tblAvaliacoessn_bloquear_diario: TSmallintField;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    tblAvaliacoessn_valida_fecha_diario: TSmallintField;
    DBCheckBox37: TDBCheckBox;
    tblAvaliacoessn_alterar_provas: TSmallintField;
    DBCheckBox38: TDBCheckBox;
    tblAvaliacoessn_alterar_2epoca: TIntegerField;
    Bevel9: TBevel;
    Label64: TLabel;
    tblAvaliacoessn_ajuste_media: TStringField;
    tblAvaliacoessn_digita_2epoca_diario_online: TSmallintField;
    tblAvaliacoessn_arred_forcado_antes_ajuste: TSmallintField;
    tblAvaliacoesds_sintese_avaliacao: TMemoField;
    DBMemo3: TDBMemo;
    DBCheckBox39: TDBCheckBox;
    tblAvaliacoessn_deferir_notas_diario: TSmallintField;
    Label63: TLabel;
    ckOnlineBloqueCont: TDBCheckBox;
    tblAvaliacoessn_diario_online_bloque_cont: TIntegerField;
    lbReproDireta: TLabel;
    cbReprovDireta: TDBLookupComboBox;
    tblAvaliacoeslookupSitReprovDireta: TStringField;
    tblAvaliacoescd_situacao_reprov_direta: TIntegerField;
    tblAvaliacoescd_situacao_reprov_exame: TIntegerField;
    tblAvaliacoescd_situacao_reprov_2epoca: TIntegerField;
    tblAvaliacoeslookupSitReprovExame: TStringField;
    tblAvaliacoeslookupSitReprov2Epoca: TStringField;
    lbReproExame: TLabel;
    cbReprovExame: TDBLookupComboBox;
    lbReproSEpoca: TLabel;
    cbReprov2Epoca: TDBLookupComboBox;
    cbConclusao: TDBLookupComboBox;
    Label66: TLabel;
    tblAvaliacoeslookupSitConclusao: TStringField;
    DBCheckBox40: TDBCheckBox;
    tblAvaliacoessn_agrupar_aulas_mesma_data: TSmallintField;
    DBCheckBox41: TDBCheckBox;
    tblAvaliacoessn_falta_sem_nota_2epoca: TSmallintField;
    DBCheckBox42: TDBCheckBox;
    Bevel10: TBevel;
    tblAvaliacoessn_faltas_justificadas: TSmallintField;
    DBCheckBox43: TDBCheckBox;
    sbComportamentos: TSpeedButton;
    tblAvaliacoessn_comportamento: TSmallintField;
    pnComportamentos: TPanel;
    DBGrid2: TDBGrid;
    dsComportamentos: TDataSource;
    qyComportamentos: TUMZQuery;
    qyComportamentosds_comportamento: TStringField;
    qyComportamentoscd_avaliacao: TSmallintField;
    qyComportamentosnr_ordem: TLargeintField;
    qyComportamentoscd_comportamento: TIntegerField;
    DBCheckBox44: TDBCheckBox;
    DBCheckBox45: TDBCheckBox;
    Label65: TLabel;
    tblAvaliacoessn_diario_online_freq_bloq_cont: TSmallintField;
    tblAvaliacoessn_diario_online_freq_bloq_digi: TSmallintField;
    tblAvaliacoessn_diario_online_compart_aula: TSmallintField;
    DBCheckBox46: TDBCheckBox;
    TabSheet2: TTabSheet;
    lbNaoUsados: TListBox;
    lbUsados: TListBox;
    btnRemover: TButton;
    btnAdicionar: TButton;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    qyRemoveTipoAula: TUMZQuery;
    qyInsereTipoAula: TUMZQuery;
    qyColocaMenorPadrao: TUMZQuery;
    DBCheckBox47: TDBCheckBox;
    DBCheckBox48: TDBCheckBox;
    tblAvaliacoessn_professor_informar_motivo_media: TIntegerField;
    tblAvaliacoessn_diario_online_mostra_resp: TIntegerField;
    cbAulaTipoPadrao: TCheckBox;
    DBCheckBox49: TDBCheckBox;
    tblAvaliacoessn_permitir_justificar: TSmallintField;
    Label70: TLabel;
    DBEdit36: TDBEdit;
    Label71: TLabel;
    cbReprovaFalta: TDBLookupComboBox;
    tblAvaliacoesds_cond_repro_falta: TStringField;
    tblAvaliacoescd_situacao_reprov_falta: TIntegerField;
    tblAvaliacoeslookupSituacaoReprovaFalta: TStringField;
    DBCheckBox50: TDBCheckBox;
    tblAvaliacoessn_converter_frequencias_nulas: TSmallintField;
    DBCheckBox51: TDBCheckBox;
    tblAvaliacoessn_ocultar_conteudo_portal: TSmallintField;
    tblAvaliacoesSN_FREQUENCIAS_CALCULAR_MEDIAS: TSmallintField;
    dbchFrequenciaCalcularMedia: TDBCheckBox;
    Bevel11: TBevel;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox52: TDBCheckBox;
    tblAvaliacoessn_libera_notas_apos_fim_etapa: TSmallintField;
    DBCheckBox53: TDBCheckBox;
    tblAvaliacoessn_profes_digita_nota_max: TSmallintField;
    tblAvaliacoessn_esconder_notas_parciais: TSmallintField;
    DBCheckBox54: TDBCheckBox;
    dbrgDiscFrenteMedia: TDBRadioGroup;
    tblAvaliacoessn_disc_frente_media: TSmallintField;
    procedure sbRemoveSituacaoClick(Sender: TObject);
    procedure cbAulaTipoPadraoClick(Sender: TObject);
    procedure lbUsadosClick(Sender: TObject);
    procedure clbProvasTiposUsadoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure DBCheckBox43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCheckBox43Click(Sender: TObject);
    procedure qyComportamentosNewRecord(DataSet: TDataSet);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbComportamentosClick(Sender: TObject);
    procedure tblAvaliacoesBeforePost(DataSet: TDataSet);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblAvaliacoesNewRecord(DataSet: TDataSet);
    procedure DBCheckBox29Click(Sender: TObject);
    procedure dsProvasUsadasDataChange(Sender: TObject; Field: TField);
    procedure cbSemPesoFixoClick(Sender: TObject);
    procedure cbSemLimiteMinimaClick(Sender: TObject);
    procedure qyProvasUsadasAfterRefresh(DataSet: TDataSet);
    procedure cbSemLimiteMaximaClick(Sender: TObject);
    procedure btnCancelarTipoProvaClick(Sender: TObject);
    procedure btnSalvarTipoProvaClick(Sender: TObject);
    procedure dsProvasUsadasStateChange(Sender: TObject);
    procedure qyProvasUsadasAfterOpen(DataSet: TDataSet);
    procedure btnRemoverProvaTipoClick(Sender: TObject);
    procedure btnAdicionarProvaTipoClick(Sender: TObject);
    procedure btnCopiaParametroClick(Sender: TObject);
    procedure grdCellClick(Column: TColumn);
    procedure tblAvaliacoesAfterOpen(DataSet: TDataSet);
    procedure cbTipoHorarioClick(Sender: TObject);
    procedure ckbBloqDigProfClick(Sender: TObject);
    procedure ckbForcadoCimaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ckbForcadoMediaCimaClick(Sender: TObject);
    procedure ckbForcadoCimaClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qyConceitosNewRecord(DataSet: TDataSet);
    procedure sbConceitosClick(Sender: TObject);
    procedure dsAvaliacoesDataChange(Sender: TObject; Field: TField);
    procedure tblAvaliacoesBeforeInsert(DataSet: TDataSet);
    procedure tblAvaliacoesBeforeEdit(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsAvaliacoesStateChange(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmQtdPopup(Sender: TObject);
  strict private
      cd_avaliacao: Integer;

      procedure FiltrarAvaliacoes();
      procedure gerarLogAvaliacao(Sender: TObject);
      procedure setTipoAulaPadrao(cd_aula_tipo, cd_avaliacao: Integer);

      function isAvaliacaoSemPadrao(cd_avaliacao: Integer): Boolean;
      function isTipoPadrao(cd_aula_tipo, cd_avaliacao: Integer): Boolean;
      function isExclusaoValida(cd_avaliacao, cd_aula_tipo: Integer): Boolean;

  private
    { Private declarations }
    procedure DBGridClick(Sender: TObject);
    
    procedure CarregarListBoxTiposProvas(const cd_avaliacao: Integer);
    procedure CarregarListBoxTiposAulas(const cd_avaliacao: Integer);

    procedure SomenteNumeros(Sender: TObject; var Key: Char);

    procedure setaCamposTiposProva();

    function hasTipoAvaliacao(cd_avaliacao_tipo, cd_tipo: Integer): Boolean;
    function hasChaveTipoAvaliacao(cd_avaliacao_tipo: Integer; ds_chave: String): Boolean;

    function getCdTipo(cd_avaliacao_tipo: Integer): Integer;
    function getDsChave(cd_avaliacao_tipo: Integer): String;

  public
    { Public declarations }
  end;

const
  SQL_PARAMETROS_AVALIACOES =
                 ' SELECT                     ' +
                 '    *                       ' +
                 ' FROM                       ' +
                 '    avaliacoes_parametros_matriz   ' +
                 ' WHERE                      ' +
                 '    cd_coligada_matriz = :cd_coligada_matriz ' +
                 ' ORDER BY cd_avaliacao DESC ';


var
  frm_Avaliacoes_parametros: Tfrm_Avaliacoes_parametros;

implementation

uses Main, uDM, uUsuario, uFSelecionarColigada;

{$R *.DFM}

procedure Tfrm_Avaliacoes_parametros.DBGridClick(Sender: TObject);
begin
   if tblAvaliacoes.State in [dsEdit, dsInsert] then
   begin
      tblAvaliacoescd_avaliacao.AsInteger := cd_avaliacao;
   end;
end;

procedure Tfrm_Avaliacoes_parametros.DBRadioGroup2Change(Sender: TObject);
begin
   dbedValorHoraAula.Enabled := ( DBRadioGroup2.Value = 'A' );

   // Caso não utilize o tipo de registro de frequência por Aula, define o padrão do campo para 1
   if NOT(dbedValorHoraAula.Enabled) AND (tblAvaliacoesvl_hora_aula.AsInteger <> 1) AND
      ( tblAvaliacoes.State IN [dsInsert, dsEdit] ) then
   begin
      tblAvaliacoesvl_hora_aula.AsInteger := 1;
   end;
end;

procedure Tfrm_Avaliacoes_parametros.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Avaliacoes_parametros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnInserir.Enabled then btnInserirClick( nil );
    VK_F3 : if btnAlterar.Enabled then btnAlterarClick( nil );
    VK_F5 : if btnSalvar.Enabled then btnSalvarClick( nil );
    VK_F9 : if btnExcluir.Enabled then btnExcluirClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : btnSairClick( nil );
  end;
end;

procedure Tfrm_Avaliacoes_parametros.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Avaliacoes_parametros.dbeDescricaoEnter(Sender: TObject);
begin
   PrincipalForm.MostraHint2(Sender);
end;

procedure Tfrm_Avaliacoes_parametros.FormShow(Sender: TObject);
const
   MSG_LITE =  'Caro usuário, você está utilizando a versão LITE, algumas '+
      'informações ficarão desabilitadas para uso.';
var
   indice : Integer;
   lite: Boolean;
begin
   { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   qryTiposTitulo.Close();
   qryTiposTitulo.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   qryTiposTitulo.Open();

   tblPeriodicidade.Close;
   tblPeriodicidade.Open;

   edQuantidadeMinima.OnKeyPress := SomenteNumeros;
   edQuantidadeMaxima.OnKeyPress := SomenteNumeros;
   edPeso.OnKeyPress := SomenteNumeros;

   FiltrarAvaliacoes();

   pgParametros.ActivePageIndex := 0;

   if DM.lite then
   begin
      tblAvaliacoes.DisableControls;
      qySituacoes.DisableControls;

      lite := DM.GetChavePermissaoLite('1034','Academico');

      DBCheckBox5.enabled  := lite;
      DBCheckBox4.enabled  := lite;
      DBCheckBox21.enabled := lite;
      Label40.enabled := lite;
      DBEdit30.enabled := lite;
      DBEdit7.enabled := lite;
      Label7.enabled := lite;
      dbchRecorrencia.Enabled := lite;
      DBCheckBox31.Enabled := lite;
      lblTipoTitulo.Enabled := lite;
      dblcTiposTitulo.Enabled := lite;
      Label16.Enabled := lite;
      DBEdit15.Enabled := lite;
      Label15.Enabled := lite;
      DBEdit14.Enabled := lite;
      DBRadioGroup1.Enabled := lite;
      DBRadioGroup2.Enabled := lite;
      DBEdit32.Enabled := lite;
      Label50.Enabled := lite;
      lblNrProficiencia.Enabled := lite;
      dbNrMediaProficiencia.Enabled := lite;
      Label47.Enabled := lite;
      cbAprovSuficiencia.Enabled := lite;
      DBCheckBox10.Enabled := lite;
      DBCheckBox11.Enabled := lite;
      dbchGerarAulasDatas.Enabled := lite;
      DBCheckBox30.Enabled := lite;
      ckbBloqDigProf.Enabled := lite;
      Label36.Enabled := lite;
      DBEdit26.Enabled := lite;
      DBCheckBox22.Enabled := lite;
      dbchkAulaExtra.Enabled := lite;
      dbchkFechaDiarioAntes.Enabled := lite;
      dbchkExtraClasse.Enabled := lite;
      dbchkExameDiarioOnline.Enabled := lite;
      dbckFrequenciaGlobal.Enabled := lite;
      DBCheckBox28.Enabled := lite;
      DBCheckBox23.Enabled := lite;
      Label37.Enabled := lite;
      DBEdit27.Enabled := lite;
      Label38.Enabled := lite;
      DBEdit28.Enabled := lite;
      Label39.Enabled := lite;
      DBEdit29.Enabled := lite;
      lbTipoHorario.Enabled := lite;
      cbTipoHorario.Enabled := lite;
      Label41.Enabled := lite;
      DBEdit31.Enabled := lite;
      DBCheckBox33.Enabled := lite;
      DBEdit35.Enabled := lite;
      dbArredondamentoExame.Enabled := lite;
      dbArredondamento2Epoca.Enabled := lite;

      tsDiarioEletro.TabVisible := lite;
      tsAvaliacaoPeriodica.tabVisible := lite;
      tsCurso.tabVisible := lite;
      TabSheet1.tabVisible := lite;
      pgPrazos.tabVisible := lite;
      tsTiposProva.tabVisible := lite;

      Mensagem( MSG_LITE, '', MB_OK + MB_ICONWARNING, Handle);

      qySituacoes.EnableControls;
      tblAvaliacoes.EnableControls;
   end;

end;

procedure Tfrm_Avaliacoes_parametros.grdCellClick(Column: TColumn);
begin
   if not ( tblAvaliacoes.state = dsEdit ) then
   begin
      cbTipoHorario.ItemIndex := tblAvaliacoes.FieldByName('cd_tipo_horario').AsInteger - 1;
   end;
end;

procedure Tfrm_Avaliacoes_parametros.dsAvaliacoesStateChange(
  Sender: TObject);
begin
    btnInserir.Enabled := not (tblAvaliacoes.State in [dsInsert, dsEdit]);
    btnAlterar.Enabled := not (tblAvaliacoes.State in [dsInsert, dsEdit]);
    btnExcluir.Enabled := not (tblAvaliacoes.State in [dsInsert, dsEdit]);
    btnSalvar.Enabled := tblAvaliacoes.State in [dsInsert, dsEdit];
    btnCancelar.Enabled := tblAvaliacoes.State in [dsInsert, dsEdit];
    btnFechar.Enabled := not (tblAvaliacoes.State in [dsInsert, dsEdit]);
end;

procedure Tfrm_Avaliacoes_parametros.dsProvasUsadasDataChange(Sender: TObject;
  Field: TField);
begin
   setaCamposTiposProva();
end;

procedure Tfrm_Avaliacoes_parametros.dsProvasUsadasStateChange(Sender: TObject);
begin
   btnSalvarTipoProva.Enabled := qyProvasUsadas.State IN [dsInsert, dsEdit];
   btnCancelarTipoProva.Enabled := qyProvasUsadas.State IN [dsInsert, dsEdit];
end;

procedure Tfrm_Avaliacoes_parametros.btnInserirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1034, npIncluir, True ) then Exit;

   dbEdit2.SetFocus;
   tblAvaliacoes.Insert;
end;

procedure Tfrm_Avaliacoes_parametros.btnAlterarClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( 1034, npAlterar, True ) then Exit;

   DBEdit2.SetFocus;
   tblAvaliacoes.Edit;

end;

procedure Tfrm_Avaliacoes_parametros.btnExcluirClick(Sender: TObject);
begin

  if not DM.UsuarioLogado.TemPermissao( 1034, npExcluir, True ) then Exit;

  if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  Begin
       tblAvaliacoes.Delete;
       tblAvaliacoes.Close;
       tblAvaliacoes.Open;
  End;

end;

procedure Tfrm_Avaliacoes_parametros.btnSalvarClick(Sender: TObject);
Var
   xCodigo : Integer;
   bPossuiValor, bMsg : boolean;
begin
   bPossuiValor := DBEInicioDiario.Text <> '';
   bMsg := false;

   if ((DBEFimDiario.Text <> '') <> bPossuiValor) then
      bMsg := true;
   if ((DBEInicioNota.Text <> '') <> bPossuiValor) then
      bMsg := true;
   if ((DBEFimNota.Text <> '') <> bPossuiValor) then
      bMsg := true;
   if ((DBEInicioFrequencia.Text <> '') <> bPossuiValor) then
      bMsg := true;
   if ((DBEFimFrequencia.Text <> '') <> bPossuiValor) then
      bMsg := true;
   if ((DBELiberacaoResultado.Text <> '') <> bPossuiValor) then
      bMsg := true;

   if bMsg then
   begin
      Mensagem('Todos os campos de prazo devem ser preenchidos ou, caso não deseje utilizar, deixe todos os campos em branco.','Atenção',MB_OK,Handle);
      Abort;
   end;

   if (not(StrToIntDef(DBEdit3.Text, 0) > 0)) then
   begin
      Mensagem('O Nr. de Avaliações na Etapa informado deve ser maior que zero.','Atenção',MB_OK,Handle);
      Abort;
   end;

   xCodigo := tblAvaliacoescd_avaliacao.AsInteger;

   tblAvaliacoes.FieldByName('cd_tipo_horario').AsInteger := cbTipoHorario.ItemIndex + 1;
   tblAvaliacoes.Post;
   tblAvaliacoes.Close;
   tblAvaliacoes.Open;

   tblAvaliacoes.Locate('cd_avaliacao', xCodigo, []);
end;


procedure Tfrm_Avaliacoes_parametros.btnSalvarTipoProvaClick(Sender: TObject);
begin
   if ( trim(edQuantidadeMinima.Text) = '' ) then
      if ( cbSemLimiteMinima.Checked ) then
         qyProvasUsadas.fieldByName('nr_qtd_minima').AsInteger := 0
      else begin
         Mensagem('Você precisar digitar um número mínima de provas para este tipo.');
         Exit;
      end;

   if ( trim(edQuantidadeMaxima.Text) = '' ) then
      if ( cbSemLimiteMaxima.Checked ) then
         qyProvasUsadas.fieldByName('nr_qtd_maxima').AsInteger := 0
      else begin
         Mensagem('Você precisar digitar um número máximo de provas para este tipo.');
         Exit;
      end;

   if ( not cbSemLimiteMaxima.Checked and not cbSemLimiteMinima.Checked) then
      if ( StrToInt(edQuantidadeMaxima.Text) < StrToInt(edQuantidadeMinima.Text) ) then begin
         Mensagem('A quantidade máxima não pode ser inferior a quantidade mínima, favor ajustar.');
         Exit;
      end;

   if ( trim(edPeso.Text) = '' ) then
      if ( cbSemPesoFixo.Checked ) then
         qyProvasUsadas.fieldByName('nr_peso').AsInteger := 0
      else begin
         Mensagem('Você precisar digitar um peso para este tipo.');
         Exit;
      end;
      
   //grava o log do tipo de avaliação   
   gerarLogAvaliacao(self);
   
   qyProvasUsadas.Post;
end;

procedure Tfrm_Avaliacoes_parametros.gerarLogAvaliacao(Sender: TObject);
var
   log, pulaLinha, operacao :String;
begin
   operacao := 'Inclusão';

   if(qyProvasUsadas.State In [dsEdit]) then
   begin
      operacao := 'Alteração';
   end;

   pulaLinha := #13;
   log :=  pulaLinha + '[Cadastros > Avaliações Parametros > Tipos de Prova] '+ operacao +' tipo de avaliacao';

   log := log + ' Codigo da Avaliação: ' + IntToStr(tblAvaliacoescd_avaliacao.AsInteger) + ',' + pulaLinha;

   log := log + ' Descrição da Avaliacao : ' + tblAvaliacoesds_avaliacao.AsString + ',' + pulaLinha;

   log := log + ' Agrupar Avaliações : ' + IntToStr(tblAvaliacoessn_agrupar_avaliacao_tipo.AsInteger) + ',' + pulaLinha;

   log := log + ' Apresentar Média: ' + IntToStr(tblAvaliacoessn_media_notas_digitadas.AsInteger) + ',' + pulaLinha;

   log := log + ' Tipos de Prova usados: ' + IntToStr(qyProvasUsadascd_avaliacao_tipo.AsInteger) + ',' + pulaLinha;

   log := log + ' Quantidade de Avaliaçõe por etapa: qtd min: ' + IntToStr(qyProvasUsadasnr_qtd_minima.AsInteger) + 'sem limite: '+ IntToStr(qyProvasUsadassn_sem_limite_minima.AsInteger) + ','+ pulaLinha;

   log := log + ' Quantidade de Avaliaçõe por etapa: qtd min: ' + IntToStr(qyProvasUsadasnr_qtd_maxima.AsInteger) + 'sem limite: '+ IntToStr(qyProvasUsadassn_sem_limite_maxima.AsInteger) + ','+ pulaLinha;

   log := log + ' Inclusão padrão bloqueada: ' + dbrgPadraoBloqueado.Value + ',' + pulaLinha;

   log := log + ' Peso calculo de média: ' + IntToStr(qyProvasUsadasnr_peso.AsInteger) + ' sem peso fixo :' + IntToStr(qyProvasUsadassn_sem_peso_fixo.AsInteger) + ',' + pulaLinha;
   
   if(log <> '') then
   begin
      DM.setLog(1006, operacao, IntToStr(DM.iCdPessoaLogado), DM.UsuarioLogado.ColigadaLogada , log);
   end;

end;

procedure Tfrm_Avaliacoes_parametros.btnAdicionarClick(Sender: TObject);
var
   objItem: TItemCombo;
begin
   if lbNaoUsados.ItemIndex = -1 then Exit;

   objItem := TItemCombo(lbNaoUsados.Items.Objects[lbNaoUsados.ItemIndex]);

   qyInsereTipoAula.ParamByName('cd_avaliacao').AsInteger := tblAvaliacoescd_avaliacao.AsInteger;
   qyInsereTipoAula.ParamByName('cd_aula_tipo').AsInteger := StrToInt(objItem.getCodigo);

   if lbUsados.Tag > 0 then
   begin
      qyInsereTipoAula.ParamByName('sn_padrao').AsInteger := 0;
   end
   else
   begin
      qyInsereTipoAula.ParamByName('sn_padrao').AsInteger := 1;
   end;

   qyInsereTipoAula.ExecSQL;

   if isAvaliacaoSemPadrao(tblAvaliacoescd_avaliacao.AsInteger) then
   begin
      qyColocaMenorPadrao.ParamByName('cd_avaliacao').AsInteger :=
         tblAvaliacoescd_avaliacao.AsInteger;

      qyColocaMenorPadrao.ExecSQL;
   end;

   lbNaoUsados.Items.Delete(lbNaoUsados.ItemIndex);
   lbUsados.Items.AddObject(objItem.getDescricao, objItem);

   CarregarListBoxTiposAulas(tblAvaliacoescd_avaliacao.AsInteger);
end;

procedure Tfrm_Avaliacoes_parametros.btnAdicionarProvaTipoClick(Sender: TObject);
var
   ItemIndex, cdAvaliacaoTipoNaoUsado, cdTipoNaoUsado: Integer;
   sTipo, dsChaveNaoUsado: string;
begin
   ItemIndex := clbProvasTiposNaoUsado.ItemIndex;

   if ( clbProvasTiposNaoUsado.Count = 0 ) then
   begin
      Mensagem('Não existe provas não usadas para adicionar.');
      Exit;
   end;

   if ItemIndex = -1 then
   begin
      Mensagem('Você deve selecionar um tipo de prova na listagem da direita, para adicionar.');
      Exit;
   end;

   cdAvaliacaoTipoNaoUsado := StrToInt(TItemCombo(clbProvasTiposNaoUsado.Items.Objects[clbProvasTiposNaoUsado.ItemIndex]).getCodigo);
   cdTipoNaoUsado := getCdTipo(cdAvaliacaoTipoNaoUsado);
   dsChaveNaoUsado := getDsChave(cdAvaliacaoTipoNaoUsado);

   // Garante que não possa existir 2 tipos PS, 2 tipos RE ou 2 tipos PI em um mesmo parametro de avaliação
   if ( (cdTipoNaoUsado IN [3, 4, 5]) and hasTipoAvaliacao( cdAvaliacaoTipoNaoUsado, cdTipoNaoUsado ) ) then begin

      if cdTipoNaoUsado = 3 then begin
         sTipo := 'SUFICIÊNCIA';
      end else if cdTipoNaoUsado = 4 then begin
         sTipo := 'RECUPERAÇÃO DA ETAPA';
      end;

      Mensagem('Já existe uma avaliação do tipo ' + sTipo + ' ' +
              'para este parâmetro de avaliação.'+ Chr(VK_RETURN) +'Não pode ser vínculada mais uma. ',
              Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   // Garante que não possa existir 2 chaves iguais em um mesmo parametro de avaliação
   if hasChaveTipoAvaliacao( cdAvaliacaoTipoNaoUsado, dsChaveNaoUsado ) then begin

      Mensagem('Já existe uma avaliação com o mesmo código de chave para este parâmetro de avaliação.' +
               Chr(VK_RETURN) +'Não pode ser vínculado dois tipos de avaliação com a mesma chave.',
               Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      Exit;
   end;

   qyProvasUsadas.Insert;

   // seta as quantidades mínimas e máximas quando o tipo for PS, RE ou PI
   if ( cdTipoNaoUsado IN [3, 4, 5] ) then
   begin
      qyProvasUsadassn_sem_limite_minima.AsInteger := 0;
      qyProvasUsadassn_sem_limite_maxima.AsInteger := 0;

      if ( cdTipoNaoUsado = 3 ) then
      begin
         qyProvasUsadasnr_qtd_minima.AsString := '0';
         qyProvasUsadasnr_qtd_maxima.AsString := '1';
      end
      else
      begin
         qyProvasUsadasnr_qtd_minima.AsString := '1';
         qyProvasUsadasnr_qtd_maxima.AsString := '1';
      end;
   end;

   qyProvasUsadasCD_AVALIACAO.AsInteger := tblAvaliacoescd_avaliacao.AsInteger;
   qyProvasUsadascd_avaliacao_tipo.AsInteger := cdAvaliacaoTipoNaoUsado;
   qyProvasUsadas.Post;

   clbProvasTiposNaoUsado.Items.Delete(ItemIndex);

   qyProvasUsadas.Refresh;
end;

function Tfrm_Avaliacoes_parametros.getCdTipo(cd_avaliacao_tipo : Integer): Integer;
const
   SQL_TIPO_AVALIACAO =
      ' SELECT cd_tipo FROM avaliacoes_tipos WHERE cd_avaliacao_tipo = :CD_AVALIACAO_TIPO';
var
   qyHasTipoAvaliacoes: TUMZQuery;
begin
   DM.CriarConsulta(qyHasTipoAvaliacoes);

   qyHasTipoAvaliacoes.Close;
   qyHasTipoAvaliacoes.SQL.Text := SQL_TIPO_AVALIACAO;
   qyHasTipoAvaliacoes.ParamByName('CD_AVALIACAO_TIPO').AsInteger := cd_avaliacao_tipo;
   qyHasTipoAvaliacoes.Open;

   Result := qyHasTipoAvaliacoes.FieldByName('cd_tipo').AsInteger;

   FreeAndNil(qyHasTipoAvaliacoes);
end;

function Tfrm_Avaliacoes_parametros.getDsChave(cd_avaliacao_tipo : Integer): String;
const
   SQL_TIPO_AVALIACAO =
      ' SELECT ds_chave FROM avaliacoes_tipos WHERE cd_avaliacao_tipo = :CD_AVALIACAO_TIPO';
var
   qyHasTipoAvaliacoes: TUMZQuery;
begin
   DM.CriarConsulta(qyHasTipoAvaliacoes);

   qyHasTipoAvaliacoes.Close;
   qyHasTipoAvaliacoes.SQL.Text := SQL_TIPO_AVALIACAO;
   qyHasTipoAvaliacoes.ParamByName('CD_AVALIACAO_TIPO').AsInteger := cd_avaliacao_tipo;
   qyHasTipoAvaliacoes.Open;

   Result := qyHasTipoAvaliacoes.FieldByName('ds_chave').AsString;

   FreeAndNil(qyHasTipoAvaliacoes);
end;

function Tfrm_Avaliacoes_parametros.hasTipoAvaliacao(cd_avaliacao_tipo, cd_tipo: integer): Boolean;
begin
   Result := false;

   qyProvasUsadas.First;
   while not qyProvasUsadas.Eof do
   begin
      if qyProvasUsadas.FieldByName('cd_tipo').AsInteger = cd_tipo then begin
        Result := true;
        break;
      end;

      qyProvasUsadas.Next;
   end;

end;

function Tfrm_Avaliacoes_parametros.isAvaliacaoSemPadrao(cd_avaliacao: Integer): Boolean;
const
   SQL_IS_SEM_PADRAO =
      ' SELECT '+
	   '    count(cd_aula_tipo) as qtd '+
      ' FROM '+
      '	  aulas_tipos_parametros '+
      ' WHERE '+
      '    cd_avaliacao = :cd_avaliacao '+
      '	  AND sn_padrao = 1 ';
var
   i: Integer;
   qyIsSemPadrao: TUMZReadOnlyQuery; 
begin
   DM.CriarConsulta(qyIsSemPadrao);

   qyIsSemPadrao.SQL.Text := SQL_IS_SEM_PADRAO;
   qyIsSemPadrao.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qyIsSemPadrao.Open;

   Result := qyIsSemPadrao.FieldByName('qtd').AsInteger = 0;
end;

function Tfrm_Avaliacoes_parametros.isTipoPadrao(cd_aula_tipo,
  cd_avaliacao: Integer): Boolean;
const
   SQL_IS_TIPO_PADRAO =
      ' SELECT '+
      '     COUNT(cd_aula_tipo) AS qtd '+
      '  FROM '+
      '     aulas_tipos_parametros '+
      '  WHERE '+
      '     cd_aula_tipo = :cd_aula_tipo '+
      '     AND cd_avaliacao = :cd_avaliacao '+
      '     AND sn_padrao = 1 ';

var
   qyIsTipoPadrao: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsTipoPadrao);

   qyIsTipoPadrao.SQL.Text := SQL_IS_TIPO_PADRAO;
   qyIsTipoPadrao.ParamByName('cd_aula_tipo').AsInteger := cd_aula_tipo;
   qyIsTipoPadrao.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qyIsTipoPadrao.Open;

   Result := qyIsTipoPadrao.FieldByName('qtd').AsInteger > 0;
end;

procedure Tfrm_Avaliacoes_parametros.lbUsadosClick(Sender: TObject);
begin
   cbAulaTipoPadrao.OnClick := nil;
   cbAulaTipoPadrao.Checked := isTipoPadrao(
      StrToInt(TItemCombo(lbUsados.Items.Objects[lbUsados.ItemIndex]).getCodigo),
      tblAvaliacoescd_avaliacao.AsInteger
   );
   cbAulaTipoPadrao.Enabled := not(cbAulaTipoPadrao.Checked);
   cbAulaTipoPadrao.OnClick := cbAulaTipoPadraoClick;
end;

function Tfrm_Avaliacoes_parametros.hasChaveTipoAvaliacao(cd_avaliacao_tipo: integer; ds_chave: string): Boolean;
begin
   Result := false;

   qyProvasUsadas.First;

   while not qyProvasUsadas.Eof do
   begin
      if UpperCase(qyProvasUsadas.FieldByName('ds_chave').AsString) = UpperCase(ds_chave) then
      begin
         Result := true;
         break;
      end;

      qyProvasUsadas.Next;
   end;
end;

function Tfrm_Avaliacoes_parametros.isExclusaoValida(cd_avaliacao, cd_aula_tipo: Integer): Boolean;
const
   SQL_IS_EXCLUSAO_VALIDA =
      ' SELECT '+
      '    COUNT(da.cd_aula_tipo) AS qtd '+
      ' FROM '+
      '    turmas AS t '+
      ' INNER JOIN grades_disciplinas gd ON ( '+
      '    gd.cd_curso = t.curso '+
      '    AND gd.nr_serie = t.serie '+
      '    AND gd.cd_grade = t.cd_grade '+
      ' ) '+
      ' INNER JOIN diario_aulas da ON( '+
      '    da.anosemestre = t.anosemestre '+
      '    AND da.turma = t.codigo '+
      ' ) '+
      ' WHERE '+
      '   COALESCE(gd.cd_avaliacao, t.cd_avaliacao) = :cd_avaliacao '+
      '    AND da.cd_aula_tipo = :cd_aula_tipo ';
var
   qyIsExclusaoValida: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsExclusaoValida);

   qyIsExclusaoValida.SQL.Text := SQL_IS_EXCLUSAO_VALIDA;
   qyIsExclusaoValida.ParamByName('cd_aula_tipo').AsInteger := cd_aula_tipo;
   qyIsExclusaoValida.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qyIsExclusaoValida.Open;

   Result := not(qyIsExclusaoValida.FieldByName('qtd').AsInteger > 0);
end;

procedure Tfrm_Avaliacoes_parametros.btnRemoverClick(Sender: TObject);
var
   objItem: TItemCombo;
   isExcValida: Boolean;
begin
   if lbUsados.ItemIndex = -1 then Exit;

   objItem := TItemCombo(lbUsados.Items.Objects[lbUsados.ItemIndex]);

   isExcValida := isExclusaoValida(
      tblAvaliacoescd_avaliacao.AsInteger,
      StrToInt(objItem.getCodigo)
   );

   if not(isExcValida) then
   begin
      Mensagem(
         'Você não pode remover um tipo de aula que está sendo usado por este parâmetro de avaliação.',
         'Aviso',
         MB_OK + MB_ICONWARNING,
         Handle
      );
      
      Exit;
   end;

   // Validar para só permitir excluir SE não estiver sendo usado
   if isExcValida then
   begin
      qyRemoveTipoAula.ParamByName('cd_avaliacao').AsInteger := tblAvaliacoescd_avaliacao.AsInteger;
      qyRemoveTipoAula.ParamByName('cd_aula_tipo').AsInteger := StrToInt(objItem.getCodigo);

      qyRemoveTipoAula.ExecSQL;

      lbUsados.Items.Delete(lbUsados.ItemIndex);
      lbNaoUsados.Items.AddObject(objItem.getDescricao, objItem);

      lbUsados.Tag := lbUsados.Tag - 1;

      if isAvaliacaoSemPadrao(tblAvaliacoescd_avaliacao.AsInteger) then
      begin
         qyColocaMenorPadrao.ParamByName('cd_avaliacao').AsInteger :=
            tblAvaliacoescd_avaliacao.AsInteger;

         qyColocaMenorPadrao.ExecSQL;
      end;
   end;

   CarregarListBoxTiposAulas(tblAvaliacoescd_avaliacao.AsInteger);
end;

procedure Tfrm_Avaliacoes_parametros.btnRemoverProvaTipoClick(Sender: TObject);
begin
   if ( qyProvasUsadas.RecordCount = 0 ) then
   begin
      Mensagem('Não existe provas usadas para remover.');
      Exit;
   end;

   if Mensagem( 'Deseja realmente excluir ?', Application.Title,
     MB_YESNO + MB_ICONQUESTION ) <> mrYes then
   begin
      Exit;
   end;

   clbProvasTiposNaoUsado.AddItem(
      qyProvasUsadasds_avaliacao.AsString,
      TItemCombo.Create(
         qyProvasUsadascd_avaliacao_tipo.AsString,
         qyProvasUsadasds_avaliacao.AsString
      )
   );

   qyProvasUsadas.Delete;

   qyProvasUsadas.Refresh;
end;

procedure Tfrm_Avaliacoes_parametros.CarregarListBoxTiposAulas(
  const cd_avaliacao: Integer);
const
   SQL_TIPOS_AULA =
      '  SELECT '+
	   '     ati.*, '+
      '     atp.cd_avaliacao '+
      '  FROM '+
      '     aulas_tipos ati '+
      '  LEFT JOIN aulas_tipos_parametros atp ON( '+
      '   	ati.cd_aula_tipo = atp.cd_aula_tipo '+
      '     AND atp.cd_avaliacao = :cd_avaliacao '+
      '  ) '+
      '  ORDER BY ati.ds_aula_tipo ';
var
   qyListaTiposAula: TUMZReadOnlyQuery;
begin
   lbUsados.Items.Clear;
   lbNaoUsados.Items.Clear;

   lbUsados.Tag := 0;

   DM.CriarConsulta(qyListaTiposAula);

   qyListaTiposAula.SQL.Text := SQL_TIPOS_AULA;
   qyListaTiposAula.ParamByName('cd_avaliacao').AsInteger := tblAvaliacoescd_avaliacao.AsInteger;
   qyListaTiposAula.Open;

   while not qyListaTiposAula.Eof do
   begin
      if qyListaTiposAula.FieldByName('cd_avaliacao').AsInteger = cd_avaliacao then
      begin
         lbUsados.Items.AddObject(
            qyListaTiposAula.FieldByName('ds_aula_tipo').AsString,
            TItemCombo.Create(
               qyListaTiposAula.FieldByName('cd_aula_tipo').AsString,
               qyListaTiposAula.FieldByName('ds_aula_tipo').AsString
            )
         );

         lbUsados.Tag := lbUsados.Tag + 1;
      end
      else
      begin
         lbNaoUsados.Items.AddObject(
            qyListaTiposAula.FieldByName('ds_aula_tipo').AsString,
            TItemCombo.Create(
               qyListaTiposAula.FieldByName('cd_aula_tipo').AsString,
               qyListaTiposAula.FieldByName('ds_aula_tipo').AsString
            )
         );
      end;

      qyListaTiposAula.Next;
   end;
end;

procedure Tfrm_Avaliacoes_parametros.CarregarListBoxTiposProvas(
  const cd_avaliacao: Integer);
const
   SQL_LISTA_PROVAS_TIPOS =
      ' SELECT avt.cd_avaliacao_tipo,	avt.ds_avaliacao, ' +
      '        CASE WHEN avtp.cd_avaliacao IS NULL THEN 0 ELSE 1 END sn_ativo ' +
      ' FROM avaliacoes_tipos avt ' +
      '      LEFT JOIN avaliacoes_tipos_parametros avtp ON ( avtp.cd_avaliacao_tipo = avt.cd_avaliacao_tipo AND avtp.cd_avaliacao = :cd_avaliacao ) ' +
      ' ORDER BY avt.ds_avaliacao ';
var
   qyListaProvasTipos: TUMZQuery;
begin
   qyProvasUsadas.Close;
   qyProvasUsadas.ParamByName('cd_avaliacao').AsInteger := tblAvaliacoescd_avaliacao.AsInteger;
   qyProvasUsadas.Open;

   clbProvasTiposNaoUsado.Clear;

   DM.CriarConsulta(qyListaProvasTipos);

   qyListaProvasTipos.SQL.Text := SQL_LISTA_PROVAS_TIPOS;
   qyListaProvasTipos.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qyListaProvasTipos.Open();

   while not qyListaProvasTipos.Eof do
   begin
      if ( qyListaProvasTipos.FieldByName('sn_ativo').AsInteger <> 1 ) then
      begin
         clbProvasTiposNaoUsado.AddItem(
            qyListaProvasTipos.FieldByName('ds_avaliacao').AsString,
            TItemCombo.Create(
               qyListaProvasTipos.FieldByName('cd_avaliacao_tipo').AsString,
               qyListaProvasTipos.FieldByName('ds_avaliacao').AsString
            )
         );
      end;

      qyListaProvasTipos.Next();
   end;
end;

procedure Tfrm_Avaliacoes_parametros.cbSemLimiteMinimaClick(Sender: TObject);
begin
   if ( not (qyProvasUsadascd_tipo.AsInteger IN [3, 4]) ) then begin
      edQuantidadeMinima.Enabled := not cbSemLimiteMinima.Checked;
   end
end;

procedure Tfrm_Avaliacoes_parametros.cbSemPesoFixoClick(Sender: TObject);
begin
   edPeso.Enabled := not cbSemPesoFixo.Checked;
end;

procedure Tfrm_Avaliacoes_parametros.cbAulaTipoPadraoClick(Sender: TObject);
begin
   if Mensagem(
      'Colocar este tipo de aula como padrão irá alterar o seu tipo de aula padrão atual, deseja prosseguir com esta operação?',
      'Aviso',
      MB_YESNO + MB_ICONEXCLAMATION,
      Handle
   ) = IDYES then
   begin
      setTipoAulaPadrao(
         StrToInt(TItemCombo(lbUsados.Items.Objects[lbUsados.ItemIndex]).getCodigo),
         tblAvaliacoescd_avaliacao.AsInteger
      );

      cbAulaTipoPadrao.Enabled := False;
      Exit;
   end;

   cbAulaTipoPadrao.OnClick := nil;
   cbAulaTipoPadrao.Checked := False;
   cbAulaTipoPadrao.OnClick := cbTipoHorarioClick;
end;

procedure Tfrm_Avaliacoes_parametros.cbSemLimiteMaximaClick(Sender: TObject);
begin
   edQuantidadeMaxima.Enabled := not cbSemLimiteMaxima.Checked;
end;

procedure Tfrm_Avaliacoes_parametros.cbTipoHorarioClick(Sender: TObject);
begin

   if not ( tblAvaliacoes.state = dsEdit ) then
   begin
      tblAvaliacoes.Edit;
   end;

end;

procedure Tfrm_Avaliacoes_parametros.ckbBloqDigProfClick(Sender: TObject);
begin
   label26.Enabled := ckbBloqDigProf.Checked;
   DBEdit26.Enabled := ckbBloqDigProf.Checked;
end;

procedure Tfrm_Avaliacoes_parametros.ckbForcadoCimaClick(Sender: TObject);
Var
   soma : integer;
begin
    if tblAvaliacoes.State in [dsInsert, dsEdit] then begin
    
      soma := 0;

      if ckbForcadoCima.checked then soma := soma + 1;
      if ckbForcadoBaixo.Checked then soma := soma + 2;

      tblAvaliacoestp_ajuste_forcado.AsInteger := soma;

    end;

end;

procedure Tfrm_Avaliacoes_parametros.ckbForcadoCimaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if not (tblAvaliacoes.State in [dsInsert, dsEdit]) then begin
    tblAvaliacoes.Edit;
  end;

end;

procedure Tfrm_Avaliacoes_parametros.ckbForcadoMediaCimaClick(Sender: TObject);
Var
   soma : integer;
begin
   if tblAvaliacoes.State in [dsInsert, dsEdit] then begin

      soma := 0;

      if ckbForcadoMediaCima.checked then soma := soma + 1;
      if ckbForcadoMediaBaixo.Checked then soma := soma + 2;

      tblAvaliacoestp_ajuste_forcado_media.AsInteger := soma;

   end;
end;

procedure Tfrm_Avaliacoes_parametros.clbProvasTiposUsadoClick(Sender: TObject);
begin
   if ( qyProvasUsadas.State IN [dsInsert, dsEdit] ) then
      qyProvasUsadas.Cancel;

   if ( clbProvasTiposUsado.ItemIndex > -1 ) then
      qyProvasUsadas.Locate('cd_avaliacao_tipo', TItemCombo(clbProvasTiposUsado.Items.Objects[clbProvasTiposUsado.ItemIndex]).getCodigo, []);
end;

procedure Tfrm_Avaliacoes_parametros.DBCheckBox29Click(Sender: TObject);
begin
   DBRadioGroup3.Enabled := not DBRadioGroup3.Enabled;
end;

procedure Tfrm_Avaliacoes_parametros.DBCheckBox43Click(Sender: TObject);
begin
   sbComportamentos.Enabled := DBCheckBox43.Checked;
end;

procedure Tfrm_Avaliacoes_parametros.DBCheckBox43KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   sbComportamentos.Enabled := DBCheckBox43.Checked;
end;

procedure Tfrm_Avaliacoes_parametros.btnCancelarClick(Sender: TObject);
begin
   tblAvaliacoes.Cancel;  
end;

procedure Tfrm_Avaliacoes_parametros.btnCancelarTipoProvaClick(Sender: TObject);
begin
   qyProvasUsadas.Cancel;
end;

procedure Tfrm_Avaliacoes_parametros.btnCopiaParametroClick(Sender: TObject);
var
   sNome : string ;
   novoCdAvaliacao, iCodigo : Integer;
   qyCopiaAvaliacaoConceito: TUMZQuery;
begin
   sNome :='';
   sNome := InputBox('Copiar novo parâmetro', 'Digite o nome do novo parâmetro:','');
   iCodigo := tblAvaliacoescd_avaliacao.AsInteger;
   if (sNome <> '') then
   begin
      qyDuplicaRegistro.ParamByName('cd_avaliacao').AsInteger :=  iCodigo;
      qyDuplicaRegistro.ParamByName('ds_avaliacao').AsString :=  sNome;
      qyDuplicaRegistro.ExecSQL;

      novoCdAvaliacao := DM.LastInsert;

      qyDuplicaTipoAvaliacaoParametro.ParamByName('cd_avaliacao').AsInteger :=  iCodigo;
      qyDuplicaTipoAvaliacaoParametro.ParamByName('cd_avaliacao_inserida').AsInteger := novoCdAvaliacao;
      qyDuplicaTipoAvaliacaoParametro.ExecSQL;

      // Copia as informações da tabela avaliacoes_conceitos
      DM.CriarConsulta(qyCopiaAvaliacaoConceito);
      qyCopiaAvaliacaoConceito.SQL.Text := ' '+
      ' INSERT INTO avaliacoes_conceitos (nr_inicial, nr_final, ds_conceito, cd_avaliacao) '+
      ' (SELECT nr_inicial, nr_final, ds_conceito, :cd_avaliacao_novo                      '+
      ' FROM avaliacoes_conceitos                                                          '+
      ' WHERE cd_avaliacao = :cd_avaliacao_antigo)                                         ';
      qyCopiaAvaliacaoConceito.ParamByName('cd_avaliacao_antigo').AsInteger := iCodigo;
      qyCopiaAvaliacaoConceito.ParamByName('cd_avaliacao_novo').AsInteger := novoCdAvaliacao;
      qyCopiaAvaliacaoConceito.ExecSQL;
      
      tblAvaliacoes.Close;
      tblAvaliacoes.Open;
   end;

end;

procedure Tfrm_Avaliacoes_parametros.FiltrarAvaliacoes();
begin
   tblAvaliacoes.Close;
   tblAvaliacoes.SQL.Text := SQL_PARAMETROS_AVALIACOES;
   tblAvaliacoes.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;
   tblAvaliacoes.Open;
end;

procedure Tfrm_Avaliacoes_parametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure Tfrm_Avaliacoes_parametros.FormCreate(Sender: TObject);
begin
   grd.ControlStyle := grd.ControlStyle + [csClickEvents];
   TForm(grd).OnClick := DBGridClick;
end;

procedure Tfrm_Avaliacoes_parametros.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblAvaliacoes, pmQtd);

end;


procedure Tfrm_Avaliacoes_parametros.tblAvaliacoesAfterOpen(DataSet: TDataSet);
begin
   if not ( tblAvaliacoes.State = dsEdit ) then
   begin
      cbTipoHorario.ItemIndex :=  tblAvaliacoes.FieldByName('cd_tipo_horario').AsInteger - 1;
   end;
end;

procedure Tfrm_Avaliacoes_parametros.tblAvaliacoesBeforeEdit(DataSet: TDataSet);
begin
  if not DM.UsuarioLogado.TemPermissao( 1034, npAlterar, True ) then Abort;

end;

procedure Tfrm_Avaliacoes_parametros.tblAvaliacoesBeforeInsert(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1034, npIncluir, True ) then Abort;
end;

procedure Tfrm_Avaliacoes_parametros.tblAvaliacoesBeforePost(DataSet: TDataSet);
begin
   if ( tblAvaliacoesvl_hora_aula.AsFloat = 0 ) then
   begin
      Mensagem('O valor da Hora/Aula precisa ser um número maior que zero.');

      if ( pgParametros.ActivePage <> tsMedia3 ) then
         pgParametros.ActivePage := tsMedia3;

      if ( ( pgParametros.ActivePage = tsMedia3 ) AND dbedValorHoraAula.Enabled AND dbedValorHoraAula.Visible ) then
      begin
         dbedValorHoraAula.SetFocus;
      end;

      Abort;
   end;

   if tblAvaliacoescd_situacao_concluida.AsInteger = -1 then
      tblAvaliacoescd_situacao_concluida.Clear;
end;

procedure Tfrm_Avaliacoes_parametros.tblAvaliacoesNewRecord(DataSet: TDataSet);
begin
   tblAvaliacoescd_coligada_matriz.AsInteger := DM.UsuarioLogado.ColigadaLogada;
end;

procedure Tfrm_Avaliacoes_parametros.dsAvaliacoesDataChange(Sender: TObject;
  Field: TField);
begin
   if tblAvaliacoescd_avaliacao.AsInteger <> 0 then
   begin
      // Salva o último código de avaliação válido
      cd_avaliacao := tblAvaliacoescd_avaliacao.AsInteger;
   end;

   DBRadioGroup3.Enabled := tblAvaliacoes.FieldByName('sn_agrupar_avaliacao_tipo').AsInteger = 1;

   sbConceitos.Enabled := tblAvaliacoes.FieldByName('sn_conceitos').AsString = 'S';
   if not sbConceitos.Enabled then
   begin
      sbConceitos.Enabled := tblAvaliacoes.FieldByName('sn_conceitos_parciais').AsString = 'S';
   end;

   sbComportamentos.Enabled := DBCheckBox43.Checked;
   pnComportamentos.Visible := False;
   sbComportamentos.Flat := True;
   // Verificar os checks do ajuste forçado

   dbedValorHoraAula.Enabled := ( tblAvaliacoesds_frequencia_registro.AsString = 'A' );

   ckbForcadoCima.Checked := (tblAvaliacoestp_ajuste_forcado.AsInteger = 1) OR (tblAvaliacoestp_ajuste_forcado.AsInteger = 3);
   ckbForcadoBaixo.Checked := (tblAvaliacoestp_ajuste_forcado.AsInteger = 2) OR (tblAvaliacoestp_ajuste_forcado.AsInteger = 3);

   ckbForcadoMediaCima.Checked := (tblAvaliacoestp_ajuste_forcado_media.AsInteger = 1) OR (tblAvaliacoestp_ajuste_forcado_media.AsInteger = 3);
   ckbForcadoMediaBaixo.Checked := (tblAvaliacoestp_ajuste_forcado_media.AsInteger = 2) OR (tblAvaliacoestp_ajuste_forcado_media.AsInteger = 3);
   ckbBloqDigProf.Checked := (tblAvaliacoesnr_dias_diario_bloq_provas.AsInteger > 0);

   dbedValorHoraAula.Enabled := (tblAvaliacoesds_frequencia_registro.AsString = 'A');

   // Verifica se deve mostrar as caixas para informar a média após o arredondamento de média (após exame e após segunda época) 

   if not dm.lite then
   begin
     // Verifica se está utilizando o exame final
     lbArredondamentoExame.Visible := (tblAvaliacoessn_exame.AsString = 'S');
     dbArredondamentoExame.Visible := (tblAvaliacoessn_exame.AsString = 'S');

     // Verifica se está utilizando a segunda época
     lbArredondamento2Epoca.Visible := (tblAvaliacoessn_segunda_epoca.AsString = 'S');
     dbArredondamento2Epoca.Visible := (tblAvaliacoessn_segunda_epoca.AsString = 'S');
   end
   else
   begin
      lbArredondamentoExame.Visible := false;
      dbArredondamentoExame.Visible := false;
      lbArredondamento2Epoca.Visible := false;
      dbArredondamento2Epoca.Visible := false;
      DBEdit35.visible := false;
      Label61.Visible := false;
   end;

   CarregarListBoxTiposProvas(tblAvaliacoescd_avaliacao.AsInteger);
   CarregarListBoxTiposAulas(tblAvaliacoescd_avaliacao.AsInteger);
end;

procedure Tfrm_Avaliacoes_parametros.sbComportamentosClick(Sender: TObject);
begin

   if sbComportamentos.Flat then begin
      qyComportamentos.Close();
      qyComportamentos.Open();
   end
   else begin
      qyComportamentos.Close();
   end;

  sbComportamentos.Flat := not sbComportamentos.Flat;
  pnComportamentos.Visible := not sbComportamentos.Flat;
end;

procedure Tfrm_Avaliacoes_parametros.sbConceitosClick(Sender: TObject);
begin

  if sbConceitos.Flat then begin
    qyConceitos.Close();
    qyConceitos.Open();
  end
  else begin
    qyConceitos.Close();
  end;

  sbConceitos.Flat := not sbConceitos.Flat;
  pnConceitos.Visible := not sbConceitos.Flat;
end;

procedure Tfrm_Avaliacoes_parametros.sbRemoveSituacaoClick(Sender: TObject);
begin
   if tblAvaliacoes.IsEmpty then
      Exit;

   if not (tblAvaliacoes.State in dsEditModes) then
      tblAvaliacoes.Edit;

   tblAvaliacoescd_situacao_concluida.Clear;
end;

procedure Tfrm_Avaliacoes_parametros.SomenteNumeros(Sender: TObject;
  var Key: Char);
begin
   if not ( Key IN ['0'..'9', Chr(8), Chr(9)] ) then Key := #0;
end;

procedure Tfrm_Avaliacoes_parametros.qyComportamentosNewRecord(
  DataSet: TDataSet);
begin
  qyComportamentos.FieldByName('cd_avaliacao').AsInteger := tblAvaliacoes.FieldByName('cd_avaliacao').AsInteger;
end;

procedure Tfrm_Avaliacoes_parametros.qyConceitosNewRecord(DataSet: TDataSet);
begin
  qyConceitos.FieldByName('cd_avaliacao').AsInteger := tblAvaliacoes.FieldByName('cd_avaliacao').AsInteger;
end;

procedure Tfrm_Avaliacoes_parametros.qyProvasUsadasAfterOpen(DataSet: TDataSet);
begin
   qyProvasUsadas.First;
   clbProvasTiposUsado.Clear;

   while not qyProvasUsadas.Eof do
   begin
      clbProvasTiposUsado.AddItem(
         qyProvasUsadasds_avaliacao.AsString,
         TItemCombo.Create(
            qyProvasUsadascd_avaliacao_tipo.AsString,
            qyProvasUsadasds_avaliacao.AsString
         )
      );

      qyProvasUsadas.Next;
   end;

   qyProvasUsadas.First;

   if ( clbProvasTiposUsado.Count > 0 ) then
      clbProvasTiposUsado.ItemIndex := 0;

   setaCamposTiposProva();

end;

procedure Tfrm_Avaliacoes_parametros.setaCamposTiposProva();
begin

   dbrgPadraoBloqueado.Enabled := clbProvasTiposUsado.Count > 0;
   cbSemPesoFixo.Enabled := (clbProvasTiposUsado.Count > 0);
   edPeso.Enabled := (clbProvasTiposUsado.Count > 0) AND
                                 not cbSemPesoFixo.Checked;

   // Verifica se o tipo for PS ou RE e bloqueia os campos de quantidade de avaliações minima e maxima
   if ( qyProvasUsadascd_tipo.AsInteger IN [3, 4] ) then
   begin

      if qyProvasUsadascd_tipo.AsInteger = 3 then
      begin
         cbSemLimiteMinima.Enabled := false;
      end;

      cbSemLimiteMaxima.Enabled := false;
      edQuantidadeMinima.Enabled := false;
      edQuantidadeMaxima.Enabled := false;
      cbSemPesoFixo.Enabled := false;
      edPeso.Enabled := false;
   end else begin
      cbSemLimiteMaxima.Enabled := true;
      cbSemPesoFixo.Enabled := true;
      edQuantidadeMinima.Enabled := (clbProvasTiposUsado.Count > 0) AND
                                     not cbSemLimiteMinima.Checked;
      cbSemLimiteMaxima.Enabled := (clbProvasTiposUsado.Count > 0);
      edQuantidadeMaxima.Enabled := (clbProvasTiposUsado.Count > 0) AND
                                     not cbSemLimiteMaxima.Checked;
      cbSemPesoFixo.Enabled := (clbProvasTiposUsado.Count > 0);
      edPeso.Enabled := (clbProvasTiposUsado.Count > 0) AND
                         not cbSemPesoFixo.Checked;
    end;

end;

procedure Tfrm_Avaliacoes_parametros.setTipoAulaPadrao(cd_aula_tipo,
  cd_avaliacao: Integer);
const
   SQL_UNSET_TODOS_PADRAO =
      ' UPDATE '+
      '    aulas_tipos_parametros '+
      ' SET '+
      '    sn_padrao = 0 '+
      ' WHERE '+
      '    cd_avaliacao = :cd_avaliacao ';

   SQL_SET_PADRAO =
      ' UPDATE '+
      '    aulas_tipos_parametros '+
      ' SET '+
      '    sn_padrao = 1 '+
      ' WHERE '+
      '    cd_avaliacao = :cd_avaliacao '+
      '    AND cd_aula_tipo = :cd_aula_tipo ';   
var
   qySetTipoPadrao: TUMZQuery;
begin
   DM.CriarConsulta(qySetTipoPadrao);

   qySetTipoPadrao.SQL.Text := SQL_UNSET_TODOS_PADRAO;
   qySetTipoPadrao.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qySetTipoPadrao.ExecSQL;

   qySetTipoPadrao.SQL.Text := SQL_SET_PADRAO;
   qySetTipoPadrao.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qySetTipoPadrao.ParamByName('cd_aula_tipo').AsInteger := cd_aula_tipo;
   qySetTipoPadrao.ExecSQL;
end;

procedure Tfrm_Avaliacoes_parametros.qyProvasUsadasAfterRefresh(
  DataSet: TDataSet);
begin
   qyProvasUsadasAfterOpen(DataSet);
end;

procedure Tfrm_Avaliacoes_parametros.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if not (qyConceitos.State in [dsInsert,dsEdit]) AND (Key = VK_DELETE) then begin

    if not DM.UsuarioLogado.TemPermissao( 1034, npEspecial, True ) then Exit;

    if Mensagem('Deseja realmente excluir este conceito ?', Application.Title, MB_ICONQUESTION+MB_YESNO, -1) = ID_YES then begin
      with DM.qyAux do begin
        Close();
        SQL.Text := 'DELETE FROM avaliacoes_conceitos WHERE cd_avaliacao = :cd_avaliacao AND ds_conceito = :ds_conceito';
        ParamByName('cd_avaliacao').AsInteger := qyConceitos.FieldByName('cd_avaliacao').AsInteger;
        ParamByName('ds_conceito').AsString := qyConceitos.FieldByName('ds_conceito').AsString;
        ExecSQL();
      end;

      qyConceitos.Close();
      qyConceitos.Open();
    end;

  end;

end;

procedure Tfrm_Avaliacoes_parametros.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if not (qyComportamentos.State in [dsInsert,dsEdit]) AND (Key = VK_DELETE) then begin

      if not DM.UsuarioLogado.TemPermissao( 1034, npEspecial, True ) then Exit;

      // Conferir se o comportamento que está tentando excluir está já sendo utilizado
      DM.qyAux.Close();
      DM.qyAux.SQL.Text := 'SELECT COUNT(*) qtd FROM matriculas_comportamento WHERE cd_comportamento = :cd_comportamento';
      DM.qyAux.ParamByName('cd_comportamento').AsInteger := qyComportamentos.FieldByName('cd_comportamento').AsInteger;
      DM.qyAux.Open();

      if (DM.qyAux.FieldByName('qtd').AsInteger > 0) then
      begin
         Mensagem('O comportamento possui alunos vinculados, não será possível remover o mesmo.', Application.Title, MB_OK, -1);
         Exit;
      end;      

      if Mensagem('Deseja realmente excluir este comportamento?', Application.Title, MB_ICONQUESTION+MB_YESNO, -1) = ID_YES then begin
         // Excluir o comportamento
         DM.qyAux.Close();
         DM.qyAux.SQL.Text := 'DELETE FROM avaliacoes_comportamento WHERE cd_comportamento = :cd_comportamento';
         DM.qyAux.ParamByName('cd_comportamento').AsInteger := qyComportamentos.FieldByName('cd_comportamento').AsInteger;
         DM.qyAux.ExecSQL();

         qyComportamentos.Close();
         qyComportamentos.Open();
      end;

   end;

end;

end.
