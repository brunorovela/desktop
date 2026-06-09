unit uProfessor;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   uPessoas, ZConnection, Db, ImgList, Buttons, StdCtrls, Grids,
   DBGrids, ExtCtrls, Mask, ComCtrls, ToolWin, uFrame_Prof_Ativ_01,
   uFrame_Prof_Ativ_03, uFrame_Prof_Ativ_11, uFrame_Prof_Ativ_10,
   uFrame_Prof_Ativ_09, uFrame_Prof_Ativ_08, uFrame_Prof_Ativ_07,
   uFrame_Prof_Ativ_06, uFrame_Prof_Ativ_05, uFrame_Prof_Ativ_04, ExtDlgs,
   Menus, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
   uFrameParentes, DelphiTwain, CropImage, ZAbstractTable, DBCtrls , DBClient, DSPack,
   ClassPessoas, UMComboBox, ZSqlUpdate, VirtualTrees, UMAjuda,DateUtils,
  UMLookupComboBox;

type
  Tfrm_Professores = class(Tfrm_Pessoas)
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    tblExperiencia: TZTable;
    dsExperiencia: TDataSource;
    tblExperienciacd_pessoa: TIntegerField;
    tblExperienciacd_tipo_atuacao: TSmallintField;
    tblExperienciavl_tempo_anos: TSmallintField;
    tblExperienciavl_tempo_meses: TSmallintField;
    tblExperienciacd_instituicao: TIntegerField;
    tblExperienciacd_empresa: TIntegerField;
    tblExperienciads_local: TStringField;
    tblExperienciads_estado: TStringField;
    tblExperienciacd_funcao: TSmallintField;
    tblExperienciacd_area: TSmallintField;
    tblExperienciadescEstado: TStringField;
    tblExperienciadescFuncoes: TStringField;
    tblExperienciadescAreas: TStringField;
    tblExperienciadescTipoAtuacao: TStringField;
    tblExperienciadescInstituicoes: TStringField;
    tblExperienciadescEmpresa: TStringField;
    Label27: TLabel;
    dbAtuacao: TDBLookupComboBox;
    Label30: TLabel;
    dbTempoAnos: TDBEdit;
    Label31: TLabel;
    dbTempoMeses: TDBEdit;
    Label34: TLabel;
    dbInstituicao: TDBLookupComboBox;
    Label43: TLabel;
    dbEmpresa: TDBLookupComboBox;
    Label44: TLabel;
    dbLocal: TDBEdit;
    Label45: TLabel;
    dbEstado: TDBLookupComboBox;
    Label46: TLabel;
    dbFuncao: TDBLookupComboBox;
    Label47: TLabel;
    dbAreaConhecimento: TDBLookupComboBox;
    toolExperiencia: TToolBar;
    ToolButton3: TToolButton;
    btExp_Incluir: TToolButton;
    btExp_Alterar: TToolButton;
    btExp_Excluir: TToolButton;
    ToolButton10: TToolButton;
    btExp_Salvar: TToolButton;
    btExp_Cancelar: TToolButton;
    ToolButton14: TToolButton;
    btExp_Fechar: TToolButton;
    ToolButton20: TToolButton;
    tblExperienciacd_experiencia: TIntegerField;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    dsDedicacao: TDataSource;
    Label48: TLabel;
    dbAtuacaoDedicacao: TDBLookupComboBox;
    Label49: TLabel;
    dbDescCurso: TDBLookupComboBox;
    Label50: TLabel;
    dbCurso: TDBEdit;
    Label51: TLabel;
    dbDescAtividade: TDBEdit;
    Label52: TLabel;
    dbHorasSemanais: TDBEdit;
    Label53: TLabel;
    dbAnoSemestre: TDBEdit;
    toolDedicacao: TToolBar;
    ToolButton5: TToolButton;
    btDed_Incluir: TToolButton;
    btDed_Alterar: TToolButton;
    btDed_Excluir: TToolButton;
    ToolButton13: TToolButton;
    btDed_Salvar: TToolButton;
    btDed_Cancelar: TToolButton;
    ToolButton19: TToolButton;
    btDed_Fechar: TToolButton;
    ToolButton26: TToolButton;
    Dedicacao: TToolButton;
    Experiencia: TToolButton;
    TabSheet9: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBGrid3: TDBGrid;
    Panel11: TPanel;
    tblAdmissoes: TZTable;
    dsAdmissoes: TDataSource;
    toolAdmissoes: TToolBar;
    Admissoes: TToolButton;
    ToolButton15: TToolButton;
    btCont_Incluir: TToolButton;
    btCont_Alterar: TToolButton;
    btCont_Excluir: TToolButton;
    ToolButton21: TToolButton;
    btCont_Salvar: TToolButton;
    btCont_Cancelar: TToolButton;
    ToolButton24: TToolButton;
    btCont_Fechar: TToolButton;
    ToolButton27: TToolButton;
    tblAdmissoescd_pessoa: TIntegerField;
    tblAdmissoescd_funcao: TSmallintField;
    tblAdmissoesds_funcao: TStringField;
    tblAdmissoescd_regime_trabalho: TSmallintField;
    tblAdmissoesdescFuncao: TStringField;
    tblAdmissoesvl_horas_semanais: TFloatField;
    tblAdmissoesdescRegime: TStringField;
    Label54: TLabel;
    dbRegime: TDBLookupComboBox;
    Label55: TLabel;
    dbHoras: TDBEdit;
    Label56: TLabel;
    dbAdmi: TDBEdit;
    Label57: TLabel;
    dbSaida: TDBEdit;
    Label58: TLabel;
    dbFuncaoAdmi: TDBLookupComboBox;
    Label59: TLabel;
    dbObsFuncao: TDBEdit;
    pgFormacao: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    Panel10: TPanel;
    tblProfessor: TUMZQuery;
    dsProfessor: TDataSource;
    tblProfessorcd_pessoa: TIntegerField;
    tblProfessornm_apelido: TStringField;
    tblProfessorcd_titulacao: TIntegerField;
    tblProfessorcd_area: TIntegerField;
    tblProfessordescArea: TStringField;
    tblProfessordescTitulacao: TStringField;
    Label60: TLabel;
    DBEdit5: TDBEdit;
    Label61: TLabel;
    Label62: TLabel;
    dblcAreaConhecimento: TDBLookupComboBox;
    dsProfTitulos: TDataSource;
    DBGrid4: TDBGrid;
    Panel12: TPanel;
    Label63: TLabel;
    dbTitulacao: TDBLookupComboBox;
    Label64: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label65: TLabel;
    DBEdit6: TDBEdit;
    Label66: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    Label67: TLabel;
    DBEdit7: TDBEdit;
    Label68: TLabel;
    DBEdit8: TDBEdit;
    Label69: TLabel;
    DBEdit9: TDBEdit;
    Label70: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    Label71: TLabel;
    DBEdit10: TDBEdit;
    Label72: TLabel;
    DBEdit11: TDBEdit;
    Label73: TLabel;
    DBEdit12: TDBEdit;
    Panel13: TPanel;
    DBGrid5: TDBGrid;
    tblProfAtividades: TZTable;
    dsProfAtividades: TDataSource;
    tblProfAtividadescd_professores_atividades: TIntegerField;
    tblProfAtividadescd_pessoa: TIntegerField;
    tblProfAtividadescd_atividade: TSmallintField;
    tblProfAtividadesds_atividade: TStringField;
    tblProfAtividadescd_area: TSmallintField;
    tblProfAtividadescd_instituicao: TIntegerField;
    tblProfAtividadesds_local: TStringField;
    tblProfAtividadesds_estado: TStringField;
    tblProfAtividadesvl_ano_inicio: TSmallintField;
    tblProfAtividadesvl_ano_fim: TSmallintField;
    tblProfAtividadescd_funcao: TSmallintField;
    tblProfAtividadescd_tipo_evento: TSmallintField;
    tblProfAtividadesnm_evento: TStringField;
    tblProfAtividadesvl_horas: TFloatField;
    tblProfAtividadesds_autoria: TStringField;
    tblProfAtividadesds_titulo_obra: TStringField;
    tblProfAtividadesds_edicao: TStringField;
    tblProfAtividadescd_editora: TIntegerField;
    tblProfAtividadesvl_paginas: TStringField;
    tblProfAtividadesvl_mes: TSmallintField;
    tblProfAtividadesds_outras_publicacoes: TBlobField;
    tblProfAtividadesdescAtividade: TStringField;
    tblProfAtividadesdescAreaConhecimento: TStringField;
    tblProfAtividadesdescInstituicao: TStringField;
    tblProfAtividadesdescEstado: TStringField;
    tblProfAtividadesdescFuncao: TStringField;
    tblProfAtividadesdescTipoEvento: TStringField;
    tblProfAtividadesds_tipo_tcc: TStringField;
    Frame_Prof_Ativ_011: Tfrm_Professores_Ativ_01;
    Frame_Prof_Ativ_031: Tfrm_Professores_Ativ_03;
    Frame_Prof_Ativ_041: Tfrm_Professores_Ativ_04;
    Frame_Prof_Ativ_051: Tfrm_Professores_Ativ_05;
    Frame_Prof_Ativ_061: Tfrm_Professores_Ativ_06;
    Frame_Prof_Ativ_071: Tfrm_Professores_Ativ_07;
    Frame_Prof_Ativ_081: Tfrm_Professores_Ativ_08;
    Frame_Prof_Ativ_091: Tfrm_Professores_Ativ_09;
    Frame_Prof_Ativ_101: Tfrm_Professores_Ativ_10;
    Frame_Prof_Ativ_111: Tfrm_Professores_Ativ_11;
    toolTitulos: TToolBar;
    Titulos: TToolButton;
    ToolButton17: TToolButton;
    btTit_Incluir: TToolButton;
    btTit_Alterar: TToolButton;
    btTit_Excluir: TToolButton;
    ToolButton25: TToolButton;
    btTit_Salvar: TToolButton;
    btTit_Cancelar: TToolButton;
    ToolButton30: TToolButton;
    btTit_Fechar: TToolButton;
    ToolButton32: TToolButton;
    toolAtividades: TToolBar;
    Atividades: TToolButton;
    ToolButton22: TToolButton;
    btAtiv_Incluir: TToolButton;
    btAtiv_Alterar: TToolButton;
    btAtiv_Excluir: TToolButton;
    ToolButton31: TToolButton;
    btAtiv_Salvar: TToolButton;
    btAtiv_Cancelar: TToolButton;
    ToolButton35: TToolButton;
    btAtiv_Fechar: TToolButton;
    ToolButton37: TToolButton;
    DBLookupComboBox6: TDBLookupComboBox;
    tblCursos: TUMZQuery;
    tblAdmissoesdt_admissao: TDateTimeField;
    tblAdmissoesdt_saida: TDateTimeField;
    tblAdmissoescd_admissao: TIntegerField;
    pmQtdExperiencia: TPopupMenu;
    pmQtdDedicacao: TPopupMenu;
    pmQtdAdmissoes: TPopupMenu;
    pmQtdProfTitulos: TPopupMenu;
    pmQtdProfAtividades: TPopupMenu;
    tblProfessorsn_funcionario: TStringField;
    tblProfessorsn_professor: TStringField;
    tblProfessorsn_coordena_ativo: TStringField;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    tblAdmissoessn_temporario: TSmallintField;
    tblAdmissoessn_bolsa_pesquisa: TSmallintField;
    dbclRacas: TDBLookupComboBox;
    lbRaca: TLabel;
    qyRacas: TUMZQuery;
    tblPessoadescRaca: TStringField;
    tblCursoscodigo: TStringField;
    tblCursosdescricao: TStringField;
    qryFuncionarioUpdateColigada: TUMZQuery;
    pnl: TPanel;
    pnlAreas: TPanel;
    pnlButtons: TPanel;
    btnAdd: TBitBtn;
    btnDell: TBitBtn;
    dbgAreasProfessor: TDBGrid;
    qryAreasProfessor: TUMZQuery;
    dsAreasProfessores: TDataSource;
    qryAreasProfessorcd_area: TIntegerField;
    qryAreasProfessords_area: TStringField;
    qryAreasProfessorcd_pessoa: TLargeintField;
    qryInsereAreas: TUMZQuery;
    qryInsereAreascd_pessoa: TLargeintField;
    qryInsereAreascd_area: TLargeintField;
    lblColigada: TLabel;
    dblProfessor: TDBLookupComboBox;
    tblProfessorcd_coligada: TSmallintField;
    tblProfessornm_pessoa: TStringField;
    tblProfTitulos: TUMZQuery;
    tblProfTituloscd_titulo_professor: TIntegerField;
    tblProfTituloscd_pessoa: TIntegerField;
    tblProfTituloscd_titulacao: TSmallintField;
    tblProfTitulosds_curso: TStringField;
    tblProfTitulosvl_ano: TSmallintField;
    tblProfTituloscd_instituicao: TIntegerField;
    tblProfTituloscd_area: TSmallintField;
    tblProfTitulosds_titulo_trabalho: TStringField;
    tblProfTitulosds_conceito: TStringField;
    tblProfTitulosds_habilitacao: TStringField;
    tblProfTitulosds_local: TStringField;
    tblProfTitulosds_estado: TStringField;
    tblProfTitulosvl_horas: TFloatField;
    tblProfTitulosdescEstado: TStringField;
    tblProfTitulosdescTitulacao: TStringField;
    tblProfTitulosdescInstituicao: TStringField;
    tblProfTitulosdescArea: TStringField;
    tblDedicacao: TUMZQuery;
    tblDedicacaocd_pessoa: TIntegerField;
    tblDedicacaocd_dedicacao: TIntegerField;
    tblDedicacaocd_tipo_atuacao: TSmallintField;
    tblDedicacaocd_curso: TStringField;
    tblDedicacaods_atividade: TStringField;
    tblDedicacaovl_horas: TFloatField;
    tblDedicacaovl_anosemestre: TSmallintField;
    tblDedicacaodescCursos: TStringField;
    tblDedicacaodescAtuacao: TStringField;
    qryProfessoresUnidades: TUMZQuery;
    dsProfessorUnidade: TDataSource;
    qryProfessoresUnidadessn_funcionario: TSmallintField;
    qryProfessoresUnidadessn_professor: TSmallintField;
    qryProfessoresUnidadessn_orientador: TSmallintField;
    qryProfessoresUnidadescd_coligada: TSmallintField;
    qryProfessoresUnidadesnm_coligada: TStringField;
    Panel14: TPanel;
    dbgUnidadesCargos: TDBGrid;
    sbCheckFuncionario: TSpeedButton;
    sbCheckOrientador: TSpeedButton;
    sbCheckProfessor: TSpeedButton;
    sbUnCheckFuncionario: TSpeedButton;
    sbUnCheckOrientador: TSpeedButton;
    sbUnCheckProfessor: TSpeedButton;
    tblSituacoes: TUMZQuery;
    tblSituacoescd_situacao: TIntegerField;
    tblSituacoesds_valor: TStringField;
    dsSituacoes: TDataSource;
    Label75: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    pnSituacaoDocente: TPanel;
    Label76: TLabel;
    dbcbSequencial: TDBCheckBox;
    dbcbPosDistancia: TDBCheckBox;
    dbcbGraduacaoPresencial: TDBCheckBox;
    dbcbPesquisa: TDBCheckBox;
    dbcbGraduacaoDistancia: TDBCheckBox;
    dbcbExtensao: TDBCheckBox;
    dbcbPosPresencial: TDBCheckBox;
    dbcbGestao: TDBCheckBox;
    tblAdmissoescd_situacao_doc: TIntegerField;
    tblAdmissoessn_sequencial: TSmallintField;
    tblAdmissoessn_graduacao_presencial: TSmallintField;
    tblAdmissoessn_graduacao_distancia: TSmallintField;
    tblAdmissoessn_pos_presencial: TSmallintField;
    tblAdmissoessn_pos_distancia: TSmallintField;
    tblAdmissoessn_pesquisa: TSmallintField;
    tblAdmissoessn_extensao: TSmallintField;
    tblAdmissoessn_gestao: TIntegerField;
    tsDocumentos: TTabSheet;
    dbgDocumentos: TDBGrid;
    Panel15: TPanel;
    toolDocumentos: TToolBar;
    btDocMarcar: TToolButton;
    btDocDesmarcar: TToolButton;
    btDocDigitalizar: TToolButton;
    tbDocSeparador1: TToolButton;
    tbDocSeparador2: TToolButton;
    btDocFechar: TToolButton;
    tbDocSeparador3: TToolButton;
    dsDocumentos: TDataSource;
    qyDocumentos: TUMZQuery;
    qyDocumentosCodigo: TSmallintField;
    qyDocumentosDocumento: TStringField;
    qyDocumentosSigla: TStringField;
    qyDocumentosExiste: TBooleanField;
    qyDocumentosapresentou: TStringField;
    qyDocumentosobservacao: TStringField;
    qyDocumentossn_digitalizado: TStringField;
    qyDocumentosDigitalizou: TBooleanField;
    qyDocumentosnr_dpi: TSmallintField;
    qyDocumentosnr_largura: TSmallintField;
    qyDocumentosnr_altura: TSmallintField;
    qyDocumentosdt_entrega: TDateTimeField;
    popDocumentacao: TPopupMenu;
    ProfessorEntregouDocumento1: TMenuItem;
    Digitalizardocumento1: TMenuItem;
    Limparadigitalizao1: TMenuItem;
    dbdtinicialperiodo: TDBEdit;
    Label1: TLabel;
    Label28: TLabel;
    dbdtfinalperiodo: TDBEdit;
    tblExperienciadt_inicial_periodo: TDateTimeField;
    tblExperienciadt_final_periodo: TDateTimeField;
    tblDedicacaocd_atividade: TIntegerField;
    tblDedicacaodescAtividade: TStringField;
    tblDedicacaocd_instituicao: TIntegerField;
    tblDedicacaodescInstituicao: TStringField;
    Label29: TLabel;
    dbAtividade: TDBLookupComboBox;
    Label77: TLabel;
    DBLookupComboBox10: TUMLookupComboBox;
    tblDedicacaods_local: TStringField;
    Label78: TLabel;
    dbeditlocal: TDBEdit;
    DBEdit14: TDBEdit;
    Label80: TLabel;
    DBEdit3: TDBEdit;
    Label79: TLabel;
    tblDedicacaodt_final_periodo: TDateField;
    tblDedicacaodt_inicial_periodo: TDateField;
    DBRadioGroup4: TDBRadioGroup;
    tblAdmissoessn_membro_cpa: TSmallintField;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    tblAdmissoessn_membro_nde: TSmallintField;
    tblAdmissoessn_coordenacao_nde: TSmallintField;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    tbsAdmissoes: TTabSheet;
    qryProfessoresUnidadescd_professor: TIntegerField;
    procedure edLoginExit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure dbAdmiExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dsExperienciaDataChange(Sender: TObject; Field: TField);
    procedure dbdtfinalperiodoExit(Sender: TObject);
    procedure dbdtinicialperiodoExit(Sender: TObject);
    procedure popDocumentacaoPopup(Sender: TObject);
    procedure Limparadigitalizao1Click(Sender: TObject);
    procedure Digitalizardocumento1Click(Sender: TObject);
    procedure ProfessorEntregouDocumento1Click(Sender: TObject);
    procedure btDocFecharClick(Sender: TObject);
    procedure qyDocumentosCalcFields(DataSet: TDataSet);
    procedure btDocDigitalizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btDocDesmarcarClick(Sender: TObject);
    procedure btDocMarcarClick(Sender: TObject);
    procedure dbgDocumentosDblClick(Sender: TObject);
    procedure dsAdmissoesDataChange(Sender: TObject; Field: TField);
    procedure tsComplementaresShow(Sender: TObject);
    procedure sbPaisComboExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryProfessoresUnidadesBeforeOpen(DataSet: TDataSet);
    procedure sbPaisComboCloseUp(Sender: TObject);
    procedure sbUnCheckProfessorClick(Sender: TObject);
    procedure sbCheckProfessorClick(Sender: TObject);
    procedure sbUnCheckOrientadorClick(Sender: TObject);
    procedure sbCheckOrientadorClick(Sender: TObject);
    procedure sbUnCheckFuncionarioClick(Sender: TObject);
    procedure sbCheckFuncionarioClick(Sender: TObject);
    procedure dbgUnidadesCargosCellClick(Column: TColumn);
    procedure dbgUnidadesCargosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tblProfTitulosNewRecord(DataSet: TDataSet);
    procedure tblDedicacaoNewRecord(DataSet: TDataSet);
    procedure btnObservacoesClick(Sender: TObject);
    procedure DBCheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDellClick(Sender: TObject);
    procedure dbgAreasProfessorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgAreasProfessorDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure tblPessoaAfterPost(DataSet: TDataSet);
    procedure tblPessoaBeforePost(DataSet: TDataSet);
    procedure btExcluir_PessoaClick(Sender: TObject);
    procedure btAlterar_PessoaClick(Sender: TObject);
    procedure btIncluir_PessoaClick(Sender: TObject);
    procedure btSalvar_PessoaClick(Sender: TObject);
    procedure tblPessoaAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dsExperienciaStateChange(Sender: TObject);
    procedure btExp_IncluirClick(Sender: TObject);
    procedure btExp_AlterarClick(Sender: TObject);
    procedure btExp_ExcluirClick(Sender: TObject);
    procedure btExp_SalvarClick(Sender: TObject);
    procedure btExp_CancelarClick(Sender: TObject);
    procedure btAtiv_BuscarClick(Sender: TObject);
    procedure btExp_FecharClick(Sender: TObject);
    procedure pgPessoaChange(Sender: TObject);
    procedure tblExperienciaAfterPost(DataSet: TDataSet);
    procedure dsDedicacaoStateChange(Sender: TObject);
    procedure btDed_IncluirClick(Sender: TObject);
    procedure btDed_AlterarClick(Sender: TObject);
    procedure btDed_ExcluirClick(Sender: TObject);
    procedure btDed_SalvarClick(Sender: TObject);
    procedure btDed_CancelarClick(Sender: TObject);
    procedure btDed_BuscarClick(Sender: TObject);
    procedure btDed_FecharClick(Sender: TObject);
    procedure tblDedicacaoAfterPost(DataSet: TDataSet);
    procedure tblAdmissoesAfterPost(DataSet: TDataSet);
    procedure dsAdmissoesStateChange(Sender: TObject);
    procedure btCont_IncluirClick(Sender: TObject);
    procedure btCont_AlterarClick(Sender: TObject);
    procedure btCont_ExcluirClick(Sender: TObject);
    procedure btCont_SalvarClick(Sender: TObject);
    procedure btCont_CancelarClick(Sender: TObject);
    procedure btCont_FecharClick(Sender: TObject);
    procedure tblProfessorNewRecord(DataSet: TDataSet);
    procedure dsProfAtividadesDataChange(Sender: TObject; Field: TField);
    procedure btTit_IncluirClick(Sender: TObject);
    procedure btTit_AlterarClick(Sender: TObject);
    procedure btTit_ExcluirClick(Sender: TObject);
    procedure btTit_SalvarClick(Sender: TObject);
    procedure btTit_CancelarClick(Sender: TObject);
    procedure btTit_FecharClick(Sender: TObject);
    procedure dsProfTitulosStateChange(Sender: TObject);
    procedure btAtiv_IncluirClick(Sender: TObject);
    procedure btAtiv_AlterarClick(Sender: TObject);
    procedure btAtiv_ExcluirClick(Sender: TObject);
    procedure btAtiv_SalvarClick(Sender: TObject);
    procedure btAtiv_CancelarClick(Sender: TObject);
    procedure btAtiv_FecharClick(Sender: TObject);
    procedure pgFormacaoChange(Sender: TObject);
    procedure dsProfAtividadesStateChange(Sender: TObject);
    procedure btBuscar_PessoaClick(Sender: TObject);
    procedure tblPessoaAfterCancel(DataSet: TDataSet);
    procedure tblProfessorBeforeEdit(DataSet: TDataSet);
    procedure tblProfTitulos2AfterPost(DataSet: TDataSet);
    procedure tblProfAtividadesAfterPost(DataSet: TDataSet);
    procedure tblExperienciaNewRecord(DataSet: TDataSet);
    procedure tblAdmissoesNewRecord(DataSet: TDataSet);
    procedure tblProfAtividadesNewRecord(DataSet: TDataSet);
    procedure dsProfessorStateChange(Sender: TObject);
    procedure pgPessoaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure pmQtdExperienciaPopup(Sender: TObject);
    procedure pmQtdDedicacaoPopup(Sender: TObject);
    procedure pmQtdAdmissoesPopup(Sender: TObject);
    procedure pmQtdProfTitulosPopup(Sender: TObject);
    procedure pmQtdProfAtividadesPopup(Sender: TObject);
  private
    FPreviousPage: Integer;
    hasPermObsGerais : Boolean;
    permIncluir : Boolean;
    permAlterar : Boolean;
    procedure AtualizarDocumentosProfessor;

    procedure atualizaCargo;
    procedure criaTodosColigadas;
    procedure salvaUnidadades(Valor: Integer; Column : TColumn);
    procedure verificaPeriodo();
    procedure atualizaCursosNde(sn_coordenacao,novoValor:integer);

    function verificaPassaporteCpf: Boolean;


    { Private declarations }

  public
    { Public declarations }
  end;

var
  frm_Professores: Tfrm_Professores;

implementation

uses
   uDM, uFSelecionarPessoa, uPessoas_adicional, uUsuario,
   uCadDeficiencias,uFbuscaAreas, uDigDocumentos, UFObservacoes, uFListaDeCursos,
   UFAdmissoes;

{$R *.DFM}

procedure Tfrm_Professores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  
   DM.tblEstados.SQL.Text := ''+
      ' SELECT * FROM estados '+
      ' ORDER BY ds_estado ';

   DM.tblEstados2.SQL.Text := ''+
      ' SELECT * FROM estados '+
      ' ORDER BY ds_estado ';
   tblSituacoes.Close();
end;

procedure Tfrm_Professores.FormCreate(Sender: TObject);
begin
   inherited;
   DM.qryColigadas.Close;
   DM.qryColigadas.Open;
   if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
   begin
      btnObservacoes.Caption := DM.variavel_parametro('botao_observacoes_nome');
      if Trim(btnObservacoes.Caption) = EmptyStr then
         btnObservacoes.Caption := 'Observações'
   end;

   if DM.variavel_parametro('Academico.Professor.Contratacao.Novo') = 'S' then
   begin
      pgPessoa.Pages[5].TabVisible := False;
      pgPessoa.Pages[6].TabVisible := True;
   end
   else
   begin
      pgPessoa.Pages[5].TabVisible := True;
      pgPessoa.Pages[6].TabVisible := False;
   end;
end;

procedure Tfrm_Professores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if pgPessoa.ActivePageIndex = 7 then
   begin
      case Key of
         VK_F3 : btDocMarcarClick( nil );
         VK_F4 : btDocDesmarcarClick( nil );
         VK_F6 : btDocDigitalizarClick( nil );
         VK_F12 : btDocFecharClick( nil );
      end;

      Exit;
   end;

   if pgPessoa.ActivePageIndex = 3 then
   begin
      case Key of
         VK_F2: btExp_IncluirClick(nil); 
         VK_F3: btExp_AlterarClick(nil);
         VK_F9: btExp_ExcluirClick(nil);
         VK_F5: btExp_SalvarClick(nil); 
         VK_F12: btExp_FecharClick(nil);
      end;

      Exit;
   end;

   inherited;
end;

procedure Tfrm_Professores.FormShow(Sender: TObject);
begin
  inherited;
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  edLogin.CharCase := ecNormal;
  edSenha1.CharCase := ecNormal;
  edSenha2.CharCase := ecNormal;

  { Abrir Tabelas Relacionadas }

  DM.tblInstituicoes.Close;
  DM.tblInstituicoes.Open;

  DM.tblFuncFuncoes.Close;
  DM.tblFuncFuncoes.Open;

  DM.tblFuncTipoAtuacao.Close;
  DM.tblFuncTipoAtuacao.Open;

  Dm.tblEstados.Close;
  Dm.tblEstados.Open;

  DM.qyAreasConhecimento.Close;
  DM.qyAreasConhecimento.Open;

  Dm.tblTitulacoes.Close;
  Dm.tblTitulacoes.Open;

  DM.tblEmpresa.Close;
  DM.tblEmpresa.Open;

  DM.tblProf_Tipo_Atividade.Close;
  Dm.tblProf_Tipo_Atividade.Open;

//  tblProfessor.Close;
//  tblProfessor.Open;

//  tblExperiencia.Close;
//  tblExperiencia.Open;

//  tblDedicacao.Close;
//  tblDedicacao.Open;

//  tblAdmissoes.Close;
//  tblAdmissoes.Open;

//  tblProfTitulos.Close;
//  tblProfTitulos.Open;

//  tblProfAtividades.Close;
//  tblProfAtividades.Open;

//  DM.tblCursos.Close;
//  DM.tblCursos.Open;

  AbaSelecionada := afpProfessor;

  { inicia permissao como sendo form professores }
  iPermissao := 1002;

  hasPermObsGerais := DM.UsuarioLogado.TemPermissao( 0, 'Academico.PessoasProfessorObservacoes', npAcesso, False );
  permIncluir := DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, False );
  permAlterar := DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, False );

  if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
  begin
     dbObs.DataSource := dsObsGerais;
  end;
end;

procedure Tfrm_Professores.Limparadigitalizao1Click(Sender: TObject);
var
   lugar : Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   if Mensagem('Tem certeza que deseja excluir da base de dados a digitalização do documento? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrNo then Exit;

   DM.qyAux.SQL.Clear();
   DM.qyAux.SQL.Add('UPDATE documentos_digitalizados SET im_doc1=NULL AND im_doc2=NULL AND im_doc3=NULL AND im_doc4=NULL where cd_pessoa = :cd_pessoa AND cd_documento = :cd_documento LIMIT 1');
   DM.qyAux.Params.ParamByName('cd_documento').AsInteger := qyDocumentosCodigo.AsInteger;
   DM.qyAux.Params.ParamByName('cd_pessoa').AsInteger := tblProfessorcd_pessoa.AsInteger;
   DM.qyAux.ExecSQL;

   DM.qyAux.SQL.Clear;
	DM.qyAux.SQL.Add('UPDATE documentos_alunos SET apresentou = "S", sn_digitalizado = "N" ');
	DM.qyAux.SQL.Add('WHERE codigoaluno = :aluno AND cod_documento = :doc');
	DM.qyAux.ParamByName('aluno').AsInteger := tblProfessorcd_pessoa.AsInteger;
	DM.qyAux.ParamByName('doc').AsInteger := qyDocumentosCodigo.AsInteger;
	DM.qyAux.ExecSQL;

	lugar := qyDocumentos.GetBookmark;
	qyDocumentos.Close;
	qyDocumentos.Open;
	qyDocumentos.GotoBookmark(lugar);
end;

procedure Tfrm_Professores.dsExperienciaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  dbTempoAnos.Enabled := ((tblExperienciadt_inicial_periodo.AsString = '') OR tblExperienciadt_inicial_periodo.isnull);
  dbTempoMeses.Enabled := ((tblExperienciadt_inicial_periodo.AsString = '') OR tblExperienciadt_inicial_periodo.isnull);
end;

procedure Tfrm_Professores.dsExperienciaStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;

      if tblExperiencia.State = dsInsert Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	       tblExperiencia.Cancel;
	       Exit;
      End;

      if tblExperiencia.State = dsEdit Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
	          tblExperiencia.Cancel;
	       Exit;
	    End;

   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblExperiencia.State in [dsEdit, dsInsert] );

      btExp_Incluir.Enabled  := (not EstaEditando);
      btExp_Alterar.Enabled  := (not EstaEditando);
      btExp_Excluir.Enabled  := (not EstaEditando);
      btExp_Fechar.Enabled   := not EstaEditando;

      btExp_Salvar.Enabled   := EstaEditando;
      btExp_Cancelar.Enabled := EstaEditando;
end;

procedure Tfrm_Professores.btExp_IncluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  inherited;
  dbAtuacao.SetFocus;
  tblExperiencia.Insert;
end;

procedure Tfrm_Professores.btExcluir_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
  inherited;
end;

procedure Tfrm_Professores.btExp_AlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  inherited;
  tblExperiencia.Edit;
  dbAtuacao.SetFocus;

end;

procedure Tfrm_Professores.btExp_ExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
  inherited;
  if Mensagem('Tem certeza que deseja excluir o registro de atividade selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblExperiencia.Delete;
end;

procedure Tfrm_Professores.btExp_SalvarClick(Sender: TObject);
begin
  jaGerouLog := false;
  inherited;

  if (pgPessoa.ActivePage = TabSheet6) then
   begin
      if (dbdtinicialperiodo.Focused = true) then
      begin
         dbEmpresa.SetFocus;
      end
      else
      begin
         dbdtinicialperiodo.SetFocus;
      end;
   end;

  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;
   

  tblExperiencia.Post;
end;

procedure Tfrm_Professores.btIncluir_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  inherited;
end;

procedure Tfrm_Professores.btnAddClick(Sender: TObject);
begin
   if (tblProfessor.State <> dsEdit) and (tblProfessor.State <> dsInsert)
       AND (tblPessoa.State <> dsEdit) and (tblPessoa.State <> dsInsert)   then
   begin
      Application.CreateForm(TFBuscaAreas , FBuscaAreas );
      FBuscaAreas.Show;
   end
   else
   begin
      Mensagem('É necessário salvar o registro antes de adicionar áreas de conhecimento','Atenção',MB_OK,Handle)
   end;
end;

procedure Tfrm_Professores.btnDellClick(Sender: TObject);
var
   qryDeletaAreas : TUMZQuery;
begin
   DM.CriarConsulta(qryDeletaAreas);
   qryDeletaAreas.SQL.Text :=  'DELETE                                    '+
                               'FROM                                      '+
                               '   professores_areas_escolhidas           '+
                               'WHERE                                     '+
                               '   cd_pessoa =  '+tblPessoacd_pessoa.AsString+
                               '   AND cd_area= '+qryAreasProfessorcd_area.AsString;
   qryDeletaAreas.ExecSQL;
   qryAreasProfessor.Close;
   qryAreasProfessor.Open;

end;

procedure Tfrm_Professores.btnObservacoesClick(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblPessoacd_pessoa.AsInteger,
         okPedagogical)
   else
      Mensagem('Selecione um professor para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure Tfrm_Professores.btSalvar_PessoaClick(Sender: TObject);
var
   bUsaResponsavel, camposValidos : Boolean;
begin
   //coloca foco em um campo não focado para garantir que as alterações
   //do ultimo campo em foco sejam salvas
   jaGerouLog := false;

   if (pgPessoa.ActivePage = tsDadosPessoais) then
   begin
      if (dbNome.Focused = true) then
      begin
         dbNacionalidade.SetFocus;
      end
      else if dbNome.Enabled then           
      begin
         dbNome.SetFocus;
      end;
   end;

   if (pgPessoa.ActivePage = tsComplementares) then
   begin
      if (DBEdit1.Focused = true) then
      begin
         DBEdit13.SetFocus;
      end
      else
      begin
         DBEdit1.SetFocus;
      end;
   end;

   //verifica campos obrigatórios
    if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
       exit;

    if verificaPassaporteCpf = False then
    begin
      Abort;
    end;

   if (dbnasc.Text = '  /  /    ' ) and (pgPessoa.ActivePage = tsDadosPessoais) and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
   begin
      if (Mensagem('O campo data de nascimento é obrigatório. Você deseja preenchê-lo agora?','Atenção',MB_YESNO) = IDYES) then
      begin
         dbNasc.SetFocus;
         Abort;
      end;
   end;
   
   {if not(bExcluido) and  (bComImagem) and (sbAplicar.Enabled) then
   begin
      sbAplicar.Click;
   end;
   if( tblPessoa.State = dsEdit ) AND ( not avisoAlteracaoCadastro() ) AND not(pgPessoa.ActivePage = tsComplementares) then
   begin
      tblPessoa.Cancel;
      exit;
   end;}

   {
   Self.FBSenhaValidada := true;
   if Self.edSenha1.Text <> '*****' then begin
      if (not validaSenha(Self.edSenha1.Text)) then begin
         Self.FBSenhaValidada := false;
         Exit;
      end else begin
         tblPessoasn_senha_provisoria.Value := 'S';
      end;
   end;
                                }
   if (tblPessoaim_pessoa.IsNull)then
   begin
      tblPessoasn_foto.AsString := 'N'
   end;

   tblPessoa.FieldByName('nm_pessoa').Value := trim(  dbNome.Text );
   if tblPessoa.FieldByName('sn_nome_social').AsInteger = 1 then
   begin
      tblPessoa.FieldByName('nm_pessoa_oficial').Value := trim(  dbNomeOficial.Text );
   end else begin
      tblPessoa.FieldByName('nm_pessoa_oficial').Clear; // Preenche o campo com NULL
   end;

   if (tblPessoa.State in [dsInsert]) then
     bUsaResponsavel := true;

{  if gradeContato.Visible and gradeContato.Enabled then
   gradeContato.SetFocus;}

  tblPessoa.Post();

  if (tblPessoacd_resp_finan.AsInteger = 0 )and not(bMenorIdade) and(bUsaResponsavel) then begin
     tblPessoa.Edit;
     tblPessoacd_resp_finan.AsInteger := tblPessoacd_pessoa.asInteger ;
     tblPessoa.Post;
  end;

  bExcluido :=false;
  bComImagem :=false;
  pgPessoa.SetFocus();

  // realizava apenas na unit uAluno
  if not Self.FBSenhaValidada then Exit;
  if not tblPessoa.EOF Then begin
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
  end;
end;



procedure Tfrm_Professores.btExp_CancelarClick(Sender: TObject);
begin
  inherited;
  tblExperiencia.Cancel;
end;

procedure Tfrm_Professores.btAtiv_BuscarClick(Sender: TObject);
begin
  btBuscar_PessoaClick(nil);

end;

procedure Tfrm_Professores.btExp_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_Professores.pgPessoaChange(Sender: TObject);
begin
  inherited;

   if pgPessoa.ActivePageIndex = 6 then
   begin
      if not DM.UsuarioLogado.TemPermissao(
         DM.UsuarioLogado.Pessoa.Codigo,
         'Academico.Pessoas.Professores.Contratacao',
         npAcesso,
         True
      ) then
      begin
         pgPessoa.ActivePageIndex := FPreviousPage;
      end
      else
      begin
         toolDocumentos.Visible := False;
         toolAtividades.Visible := False;
         toolTitulos.Visible := False;
         toolAdmissoes.Visible := False;
         toolDedicacao.Visible := False;
         toolExperiencia.Visible := False;
         toolPessoa.Visible := False;
      end;
   end;

  dm.tblEstados.Close;
  dm.tblEstados.SQL.Text := 'SELECT * from estados order by ds_estado';
  dm.tblEstados.Open;

  if (pgPessoa.ActivePageIndex = 0) or (pgPessoa.ActivePageIndex = 1) Then  // Dados Pessoais e Complementares
  Begin
      toolDocumentos.Visible  := False;
      toolAtividades.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := True;
      cbFormaConhece.Visible        := False;
      lbFormaConheceuInst.Visible   := False;
      cbRetiraMaterial.Visible := False;
      lbInformeFicouSabendo.Visible := False;
      edFormaConheceuOutro.Visible := False;

      // alimentando a grid de areas
      if(tblPessoacd_pessoa.AsInteger <> 0) then
      begin
         qryInsereAreas.Close;
         qryInsereAreas.Open;
         qryAreasProfessor.Close;
         qryAreasProfessor.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
         qryAreasProfessor.Open;
         qryProfessoresUnidades.Close;
         qryProfessoresUnidades.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
         qryProfessoresUnidades.Open;
      end;
      if pgPessoa.ActivePageIndex = 1 then
      begin
         if tblProfessorsn_professor.AsString = 'S' then
         begin
            dblProfessor.Visible := true;
            lblColigada.Visible := true;
         end
         else
         begin
            dblProfessor.Visible := false;
            lblColigada.Visible := false;
         end;
         criaTodosColigadas;
      end;

      dbObs.Enabled := hasPermObsGerais;
      if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
      begin
         btnAlteraObs.Visible := True;
         btnSalvarObs.Visible := True;
         btnCancelarObs.Visible := True;

         qryObsGerais.Close();
         qryObsGerais.ParamByName('cd_pessoa').AsInteger := resultado_filtro.cd_pessoa;
         qryObsGerais.Open();
      end;
  End
  Else if pgPessoa.ActivePageIndex = 3 Then //Experiência Profissional
  Begin

      if not DM.UsuarioLogado.TemPermissao( iPermissao, npAcesso, True ) then
      begin
         toolDocumentos.Visible  := False;
         toolAtividades.Visible  := False;
         toolTitulos.Visible     := False;
         toolAdmissoes.Visible   := False;
         toolDedicacao.Visible   := False;
         toolExperiencia.Visible := False;
         toolPessoa.Visible      := True;

         pgPessoa.ActivePageIndex := 0;
         exit;
      end;

      toolDocumentos.Visible  := False;
      toolAtividades.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := True;
      toolPessoa.Visible      := False;
      tblExperiencia.Close();
      tblExperiencia.Open();
  End
  Else if pgPEssoa.ActivePageIndex = 4 Then //Dedicação na Instituição
  Begin

      if not DM.UsuarioLogado.TemPermissao( iPermissao, npAcesso, True ) then
      begin
         toolDocumentos.Visible  := False;
         toolAtividades.Visible  := False;
         toolTitulos.Visible     := False;
         toolAdmissoes.Visible   := False;
         toolDedicacao.Visible   := False;
         toolExperiencia.Visible := False;
         toolPessoa.Visible      := True;

         pgPessoa.ActivePageIndex := 0;
         exit;
      end;

      toolDocumentos.Visible  := False;
      toolAtividades.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible        := True;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := False;
      tblDedicacao.Close();
      tblDedicacao.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
      tblDedicacao.Open();
  End
  Else if pgPEssoa.ActivePageIndex = 5 Then // Contratações
  Begin
      if not DM.UsuarioLogado.TemPermissao(
         DM.UsuarioLogado.Pessoa.Codigo,
         'Academico.Pessoas.Professores.Contratacao',
         npAcesso,
         True
      ) then
      begin
         toolDocumentos.Visible  := False;      
         toolAtividades.Visible  := False;
         toolTitulos.Visible     := False;
         toolAdmissoes.Visible   := False;
         toolDedicacao.Visible   := False;
         toolExperiencia.Visible := False;
         toolPessoa.Visible      := True;

         pgPessoa.ActivePageIndex := 0;
         exit;
      end;

      toolDocumentos.Visible  := False;      
      toolAtividades.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible        := True;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := False;
      tblAdmissoes.Close();
      tblAdmissoes.Open();
      tblSituacoes.Close();
      tblSituacoes.Open();
  End
  Else if pgPessoa.ActivePageIndex = 7 Then
  Begin
      if not DM.UsuarioLogado.TemPermissao( iPermissao, npAcesso, True ) then
      begin
         toolDocumentos.Visible  := False;
         toolAtividades.Visible  := False;
         toolTitulos.Visible     := False;
         toolAdmissoes.Visible   := False;
         toolDedicacao.Visible   := False;
         toolExperiencia.Visible := False;
         toolPessoa.Visible      := True;
         pgPessoa.ActivePageIndex := 0;
         exit;
      end;

      tblProfAtividades.Close();
      tblProfAtividades.Open;
      tblProfTitulos.close;
      tblProfTitulos.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
      tblProfTitulos.open;
      if pgFormacao.ActivePageIndex = 0 Then
      Begin
          toolTitulos.Visible     := True;
          toolAtividades.Visible  := False;
      End
      Else
      Begin
          toolTitulos.Visible     := False;
          toolAtividades.Visible  := True;
      End;
      toolDocumentos.Visible  := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := False;
  End
  else if pgPessoa.ActivePageIndex = 8 then
  begin
      if not DM.UsuarioLogado.TemPermissao( iPermissao, npAcesso, True ) then
      begin
         toolDocumentos.Visible  := False;
         toolAtividades.Visible  := False;
         toolTitulos.Visible     := False;
         toolAdmissoes.Visible   := False;
         toolDedicacao.Visible   := False;
         toolExperiencia.Visible := False;
         toolPessoa.Visible      := True;

         pgPessoa.ActivePageIndex := 0;
         exit;
      end;

      toolDocumentos.Visible  := True;
      toolAtividades.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := False;

      AtualizarDocumentosProfessor();

      qyDocumentos.Close;
      qyDocumentos.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
      qyDocumentos.Open;

  end else if pgPessoa.ActivePageIndex = 2 then
  begin
      toolDocumentos.Visible  := False;
      toolAtividades.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := False;
  end;
end;

procedure Tfrm_Professores.atualizaCursosNde(sn_coordenacao,novoValor: integer);
const
   SQL_ATUALIZAR_NDE =
   'UPDATE funcionarios_cursos_nde SET sn_membro_nde = :valor WHERE cd_admissao = :admissao ';
   SQL_ATUALIZAR_COORD =
   'UPDATE funcionarios_cursos_nde SET sn_coordenacao_nde = :valor WHERE cd_admissao = :admissao ';
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   if(sn_coordenacao = 1) then
   begin
      qryUpdate.SQL.Add(SQL_ATUALIZAR_COORD);
   end else begin
      qryUpdate.SQL.Add(SQL_ATUALIZAR_NDE);
   end;

   qryUpdate.ParamByName('admissao').AsString := tblAdmissoescd_admissao.AsString;
   qryUpdate.ParamByName('valor').AsInteger := novoValor;
   qryUpdate.ExecSQL;
   FreeAndNil(qryUpdate);
end;

procedure Tfrm_Professores.AtualizarDocumentosProfessor();
const
   SQL_ATUALIZAR_DOCUMENTOS = 'INSERT IGNORE INTO DOCUMENTOS_ALUNOS (CODIGOALUNO, COD_DOCUMENTO, APRESENTOU) '+
                              '  SELECT :cd_professor, codigo, "N" FROM documentos';
var
   qyAtualizarDocumentosProfessor: TUMZQuery;
begin
   DM.CriarConsulta(qyAtualizarDocumentosProfessor);

   qyAtualizarDocumentosProfessor.SQL.Text := SQL_ATUALIZAR_DOCUMENTOS;
   qyAtualizarDocumentosProfessor.Close;
   qyAtualizarDocumentosProfessor.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
   qyAtualizarDocumentosProfessor.ExecSQL;
end;

procedure Tfrm_Professores.tblExperienciaAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure Tfrm_Professores.dsDedicacaoStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;

      if tblDedicacao.State = dsInsert Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	       tblDedicacao.Cancel;
	       Exit;
      End;

      if tblDedicacao.State = dsEdit Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
	          tblDedicacao.Cancel;
	       Exit;
	    End;
   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblDedicacao.State in [dsEdit, dsInsert] );

      btDed_Incluir.Enabled  := (not EstaEditando);
      btDed_Alterar.Enabled  := (not EstaEditando);
      btDed_Excluir.Enabled  := (not EstaEditando);
      btDed_Fechar.Enabled   := not EstaEditando;

      btDed_Salvar.Enabled   := EstaEditando;
      btDed_Cancelar.Enabled := EstaEditando;
end;

procedure Tfrm_Professores.btDed_IncluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  inherited;
  dbAtuacaoDedicacao.SetFocus;
  tblDedicacao.Insert;
end;

procedure Tfrm_Professores.btDed_AlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  inherited;
  tblDedicacao.Edit;
  dbAtuacaoDedicacao.SetFocus;
end;

procedure Tfrm_Professores.btDed_ExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
  inherited;
  if Mensagem('Tem certeza que deseja excluir o registro de dedicação selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblDedicacao.Delete;

end;

procedure Tfrm_Professores.btDed_SalvarClick(Sender: TObject);
begin
  jaGerouLog := false;
  inherited;

  if (pgPessoa.ActivePage = TabSheet7) then
   begin
      if (dbCurso.Focused = true) then
      begin
         dbdescatividade.SetFocus;
      end
      else
      begin
         dbCurso.SetFocus;
      end;
   end;

  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  tblDedicacao.Post;

end;

procedure Tfrm_Professores.btDocDesmarcarClick(Sender: TObject);
var
   lugar: Pointer;
   msg: String;   
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   msg := 'Atenção' + CHR(13)+CHR(13)+
          'Você está tentando desmarcar a entrega do documento "' + qyDocumentosDocumento.AsString + '"';

   if trim(qyDocumentosdt_entrega.AsString) <> '' then
   begin
      msg := msg + ' entregue no dia "' + qyDocumentosdt_entrega.DisplayText + '".';
   end;

   msg := msg + CHR(13) + CHR(13) + 'Tem certeza que deseja continuar?';

   if Mensagem(msg, 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONWARNING + MB_DEFBUTTON3, Handle) <> mrYes then Exit;

   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('UPDATE documentos_alunos SET apresentou = "N", dt_entrega = NULL ');
   DM.qyAux.SQL.Add('WHERE codigoaluno = :aluno AND cod_documento = :doc');
   DM.qyAux.ParamByName('aluno').AsInteger := tblPessoacd_pessoa.AsInteger;
   DM.qyAux.ParamByName('doc').AsInteger := qyDocumentosCodigo.AsInteger;
   DM.qyAux.ExecSQL;

   lugar := qyDocumentos.GetBookmark;
   qyDocumentos.Close;
   qyDocumentos.Open;
   qyDocumentos.GotoBookmark(lugar);
end;

procedure Tfrm_Professores.btDocDigitalizarClick(Sender: TObject);
var
   LDocsNecessarios: TIntegerArray;
   lugar : Pointer;
begin

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   Application.CreateForm(TFDigDocumentos, FDigDocumentos);

   qyDocumentos.First;
   while not qyDocumentos.Eof do
   begin
      SetLength(LDocsNecessarios, Length(LDocsNecessarios) + 1);
      LDocsNecessarios[Length(LDocsNecessarios) - 1] := qyDocumentos.FieldByName('codigo').AsInteger;
      qyDocumentos.Next;
   end;
   
   // Modifica a label para informar que os documentos apresentados são para o Professor
   FDigDocumentos.tsDocsAlunos.Caption := 'Documentos do Professor';

   FDigDocumentos.DocsNecessarios := LDocsNecessarios;
   FDigDocumentos.iCodAluno := tblPessoacd_pessoa.AsInteger;

   FDigDocumentos.DelphiTwain1.LibraryLoaded := True;
   FDigDocumentos.DelphiTwain1.SourceManagerLoaded := True;

   // Deixar entrar na tela mesmo se não tiver scanner.
   if not ((FDigDocumentos.DelphiTwain1.LibraryLoaded) and (FDigDocumentos.DelphiTwain1.SourceManagerLoaded)) then
   begin
      FDigDocumentos.btnDigitalizar.Enabled := false;
   end;

   // Selecionar a última origem de digitalização utilizada
   try
     Origem := StrToInt(Dm.variavel_parametro('digitalizacao_origem'));
   except
     Origem := -1;
   end;

   FDigDocumentos.ShowModal();

   lugar := qyDocumentos.GetBookmark;
   qyDocumentos.Close;
   qyDocumentos.Open;
   qyDocumentos.GotoBookmark(lugar);
end;

procedure Tfrm_Professores.btDocFecharClick(Sender: TObject);
begin
   inherited;
   close;
end;

procedure Tfrm_Professores.btDocMarcarClick(Sender: TObject);
var
   lugar: Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('UPDATE documentos_alunos SET apresentou = "S", dt_entrega = NOW() ');
   DM.qyAux.SQL.Add('WHERE codigoaluno = :aluno AND cod_documento = :doc');
   DM.qyAux.ParamByName('aluno').AsInteger := tblPessoacd_pessoa.AsInteger;
   DM.qyAux.ParamByName('doc').AsInteger := qyDocumentosCodigo.AsInteger;
   DM.qyAux.ExecSQL;

   lugar := qyDocumentos.GetBookmark;
   qyDocumentos.Close;
   qyDocumentos.Open;
   qyDocumentos.GotoBookmark(lugar);
end;

procedure Tfrm_Professores.btDed_CancelarClick(Sender: TObject);
begin
  inherited;
  tblDedicacao.Cancel;
end;

procedure Tfrm_Professores.btDed_BuscarClick(Sender: TObject);
begin
  inherited;
  btBuscar_PessoaClick(nil);
end;

procedure Tfrm_Professores.btDed_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_Professores.tblDedicacaoAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure Tfrm_Professores.tblDedicacaoNewRecord(DataSet: TDataSet);
begin
   inherited;
   tblDedicacaocd_pessoa.AsInteger :=  tblPessoacd_pessoa.AsInteger;
end;

procedure Tfrm_Professores.tblAdmissoesAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure Tfrm_Professores.dbdtfinalperiodoExit(Sender: TObject);
begin
  inherited;
  verificaPeriodo();
end;

procedure Tfrm_Professores.dbdtinicialperiodoExit(Sender: TObject);
begin
  inherited;
  verificaPeriodo();
end;

procedure Tfrm_Professores.DBEdit3Exit(Sender: TObject);
begin
  inherited;
   if not(tblDedicacao.State in [dsInsert,dsEdit]) then
   begin
      exit;
   end;

   if( tblDedicacaodt_inicial_periodo.IsNull OR (tblDedicacaodt_inicial_periodo.asString = '') ) OR
     ( tblDedicacaodt_final_periodo.IsNull OR (tblDedicacaodt_final_periodo.asString = '')) then
   begin
      exit;
   end;

   if( tblDedicacaodt_inicial_periodo.AsDateTime > tblDedicacaodt_final_periodo.AsDateTime ) then
   begin
      Mensagem('A data inicial do periodo não deve ser maior que a final');
      tblDedicacaodt_final_periodo.AsString := '';
      tblDedicacaodt_inicial_periodo.AsString := '';

      try
         if(tblDedicacao.State in [dsEdit]) then
         begin
            tblDedicacaodt_final_periodo.AsString := tblDedicacaodt_final_periodo.OldValue;
            tblDedicacaodt_inicial_periodo.AsString := tblDedicacaodt_inicial_periodo.OldValue;
         end;
      except
         //Caso ja tenha um registro mas sem data
      end;

      exit;
   end;
end;

procedure Tfrm_Professores.dbgAreasProfessorDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   // try para ignorar a tentativa de inserir registros duplicados
   try
      qryInsereAreas.Close;
      qryInsereAreas.Open;
      qryInsereAreas.Insert;
      qryInsereAreascd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
      qryInsereAreascd_area.AsInteger   := FBuscaAreas.qryAreascd_area.AsInteger;
      qryInsereAreas.Post;
      qryAreasProfessor.Close;
      qryAreasProfessor.Open;

   except on E: Exception do
   end;


end;

procedure Tfrm_Professores.dbgAreasProfessorDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TDBGrid);
end;

procedure Tfrm_Professores.dbgDocumentosDblClick(Sender: TObject);
begin
   inherited;

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   if Dm.isTrue(qyDocumentosapresentou.AsString) Then
   begin
      btDocDesmarcarClick(Sender);
   end else begin
      btDocMarcarClick(Sender);
   end;

end;

procedure Tfrm_Professores.dbgUnidadesCargosCellClick(Column: TColumn);
CONST
   SQL_VERIFICA_QTD_PROFESSOR = '            '+
   ' SELECT                                  '+
   '   count(sn_professor) as sn_professor   '+
   ' FROM                                    '+
   '   professores_unidades                  '+
   ' WHERE                                   '+
   '   sn_professor = 1 AND                  '+
   '   cd_professor =                        ';

   SQL_VERIFICA_UNIDADE = '                  '+
   ' SELECT                                  '+
   '    sn_professor                         '+
   ' FROM                                    '+
   '    professores_unidades                 '+
   ' WHERE                                   '+
   '    cd_coligada = :cd_coligada           '+
   '    AND cd_professor = :cd_professor ';

    SQL_QTD_DESATIVAR_PROFESSOR = '          '+
   ' SELECT                                  '+
   '    COUNT(*) AS quantidade               '+
   ' FROM                                    '+
   '    turmasprofessores as tp              '+
   ' LEFT JOIN professores_unidades as pu ON('+
   ' tp.professor = pu.cd_professor  )       '+
   ' WHERE                                   '+
   '    tp.professor =  :cd_professor        '+
   '    AND pu.cd_coligada = :cd_coligada    '+
   '    AND tp.anosemestre >= :anosemestreAtual ';

var
   qryVerificaVinculo: TUMZquery;
   anosemestreAtual : String;
begin
   if ( tblPessoa.State = dsInsert ) or ( tblPessoa.State = dsEdit ) then
   begin
      Mensagem('Você não pode estar em modo de edição para alterar este campo');
      Exit;
   end;

   DM.CriarConsulta(qryVerificaVinculo);

   qryVerificaVinculo.SQL.Text := SQL_VERIFICA_QTD_PROFESSOR + tblProfessorcd_pessoa.AsString;
   qryVerificaVinculo.Open;

   
   if (qryVerificaVinculo.FieldByName('sn_professor').AsInteger = 1) then
   begin

      qryVerificaVinculo.SQL.Text := SQL_VERIFICA_UNIDADE;
      qryVerificaVinculo.ParamByName('cd_coligada').AsString := qryProfessoresUnidadescd_coligada.AsString;
      qryVerificaVinculo.ParamByName('cd_professor').AsString := tblProfessorcd_pessoa.AsString;
      qryVerificaVinculo.Open;

      if ((qryVerificaVinculo.FieldByName('sn_professor').AsInteger = 1)
         and (Self.dbgUnidadesCargos.SelectedField.AsInteger = 1)) then
      begin

        anosemestreAtual := IntToStr(DM.GetAnoSemestreAtual);
        qryVerificaVinculo.SQL.Text := SQL_QTD_DESATIVAR_PROFESSOR;
        qryVerificaVinculo.ParamByName('cd_professor').AsString := tblProfessorcd_pessoa.AsString;
        qryVerificaVinculo.ParamByName('cd_coligada').AsString := qryProfessoresUnidadescd_coligada.AsString;
        qryVerificaVinculo.ParamByName('anosemestreAtual').AsString := anosemestreAtual;
        qryVerificaVinculo.Open;

        if(qryVerificaVinculo.FieldByName('quantidade').AsInteger > 0) then
           if Mensagem('Este professor possui vínculos com turmas, você realmente deseja retirar ele como professor?',
              'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrNo then
              begin
                Exit;
           end;
         end;
      end;
   if( Column.FieldName <> 'nm_coligada' ) then
   begin
      if (Self.dbgUnidadesCargos.SelectedField.AsInteger = 1) then
      begin
         salvaUnidadades( 0 , Column );
      end
      else
      begin
         salvaUnidadades( 1 , Column );
      end;
   end;
   // Chama a função que atualiza os grupos das pessoas
   DM.atualizarGruposPessoa(tblProfessorcd_pessoa.AsInteger, qryProfessoresUnidadescd_coligada.AsInteger);

   atualizaCargo;
end;

procedure Tfrm_Professores.salvaUnidadades(Valor : Integer; Column : TColumn);
var
   qryInsereProf : TUMZQuery;
   qryBuscaRegistro : TUMZQuery;
   snFuncionario    : Integer;
   snOrientador     : Integer;
   snProfessor      : Integer;
   cd_coligada      : Integer;
begin

   snFuncionario := qryProfessoresUnidadessn_funcionario.AsInteger;
   snOrientador  := qryProfessoresUnidadessn_orientador.AsInteger;
   snProfessor   := qryProfessoresUnidadessn_professor.AsInteger;
   
   if( Column.FieldName =  'sn_funcionario' )then
   begin
      snFuncionario := Valor;
   end
   else if (Column.FieldName =  'sn_professor') then
   begin
      snProfessor := Valor;
   end
   else
   begin
      snOrientador := Valor;

   end;

   DM.CriarConsulta(qryInsereProf);
   DM.CriarConsulta(qryBuscaRegistro);
   qryBuscaRegistro.SQL.Text := ' SELECT             '+
                                '   count(*) as qtd  '+
                                ' FROM               '+
                                '   professores_unidades '+
                                ' WHERE                  '+
                                '   cd_coligada = '+qryProfessoresUnidadescd_coligada.AsString +' AND '+
                                '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryBuscaRegistro.Open;

   if (qryBuscaRegistro.FieldByName('qtd').AsInteger > 0 ) then
   begin
      qryInsereProf.SQL.Text := ' UPDATE                                   '+
                                   '   professores_unidades                '+
                                   ' SET                                   '+
                                   '   sn_funcionario = :sn_funcionario,   '+
                                   '   sn_professor   = :sn_professor,     '+
                                   '   sn_orientador  = :sn_orientador     '+
                                   ' WHERE                                 '+
                                   '   cd_coligada = '+qryProfessoresUnidadescd_coligada.AsString+
                                   ' AND                                   '+
                                   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   end
   else
   begin
      qryInsereProf.SQL.Text := ' INSERT INTO            '+
                                '   professores_unidades '+
                                ' (                      '+
                                '    cd_professor,       '+
                                '    cd_coligada,        '+
                                '    sn_funcionario,     '+
                                '    sn_professor,       '+
                                '    sn_orientador       '+
                                ' ) VALUES               '+
                                ' (                      '+
                                '   :cd_professor,       '+
                                '   :cd_coligada,        '+
                                '   :sn_funcionario,     '+
                                '   :sn_professor,       '+
                                '   :sn_orientador       '+
                                ')';
      qryInsereProf.ParamByName('cd_professor').AsInteger := tblProfessorcd_pessoa.AsInteger;
      qryInsereProf.ParamByName('cd_coligada').AsInteger  := qryProfessoresUnidadescd_coligada.AsInteger;

   end;
   cd_coligada  := qryProfessoresUnidadescd_coligada.AsInteger;

   qryInsereProf.ParamByName('sn_funcionario').AsInteger := snFuncionario;
   qryInsereProf.ParamByName('sn_professor').AsInteger   := snProfessor;
   qryInsereProf.ParamByName('sn_orientador').AsInteger :=  snOrientador;

   qryInsereProf.ExecSQL;


   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;

   qryProfessoresUnidades.Locate('cd_coligada', cd_coligada,[]);


end;



procedure Tfrm_Professores.dbgUnidadesCargosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Const
   CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   CheckBoxRectangle : TRect;
begin
   if Pos('sn_', Column.FieldName) > 0 then begin
      self.dbgUnidadesCargos.Canvas.FillRect(Rect);
      CheckBoxRectangle.Left := Rect.Left + 2;
      CheckBoxRectangle.Right := Rect.Right - 2;
      CheckBoxRectangle.Top := Rect.Top + 2;
      CheckBoxRectangle.Bottom := Rect.Bottom - 2;
      DrawFrameControl(self.dbgUnidadesCargos.Canvas.Handle,
      CheckBoxRectangle,
      DFC_BUTTON,
      CtrlState[(Column.Field.AsString = '1')
      or (Column.Field.AsString = 'S')]
      );
   end;

end;

procedure Tfrm_Professores.Digitalizardocumento1Click(Sender: TObject);
begin
   btDocDigitalizarClick(nil);
end;

procedure Tfrm_Professores.dsAdmissoesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  pnSituacaoDocente.Visible := (tblAdmissoescd_situacao_doc.AsInteger = 1);
end;

procedure Tfrm_Professores.dsAdmissoesStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;

      if tblAdmissoes.State = dsInsert Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	       tblAdmissoes.Cancel;
	       Exit;
      End;

      if tblAdmissoes.State = dsEdit Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
	          tblAdmissoes.Cancel;
	       Exit;
	    End;

   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblAdmissoes.State in [dsEdit, dsInsert] );

      btCont_Incluir.Enabled  := (not EstaEditando);
      btCont_Alterar.Enabled  := (not EstaEditando);
      btCont_Excluir.Enabled  := (not EstaEditando);
      btCont_Fechar.Enabled   := not EstaEditando;

      btCont_Salvar.Enabled   := EstaEditando;
      btCont_Cancelar.Enabled := EstaEditando;
end;

procedure Tfrm_Professores.btCont_IncluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  inherited;
  dbRegime.SetFocus;
  tblAdmissoes.Insert;
end;

procedure Tfrm_Professores.btCont_AlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  inherited;
  tblAdmissoes.Edit;
  dbRegime.SetFocus;

end;

procedure Tfrm_Professores.btCont_ExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
  inherited;
  if Mensagem('Tem certeza que deseja excluir o registro de Contratação selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblAdmissoes.Delete;

end;

procedure Tfrm_Professores.btCont_SalvarClick(Sender: TObject);
begin
  jaGerouLog := false;
  inherited;

  if (pgPessoa.ActivePage = TabSheet9) then
  begin
      if (DBHORAS.Focused = true) then
      begin
         DBADMI.SetFocus;
      end
      else
      begin
         DBHORAS.SetFocus;
      end;
  end;

  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if((tblAdmissoes.State IN [dsInsert])  OR (tblAdmissoessn_membro_nde.OldValue <> tblAdmissoessn_membro_nde.AsString)) then
  begin
    if(tblAdmissoessn_membro_nde.AsString = '0') then
    begin
      atualizaCursosNde(0,tblAdmissoessn_membro_nde.AsInteger);
    end;
  end;

  if((tblAdmissoes.State IN [dsInsert])  OR (tblAdmissoessn_coordenacao_nde.OldValue <> tblAdmissoessn_coordenacao_nde.AsString)) then
  begin
    if(tblAdmissoessn_coordenacao_nde.AsString = '0') then
    begin
      atualizaCursosNde(1,tblAdmissoessn_coordenacao_nde.AsInteger);
    end;
  end;

  if(tblAdmissoescd_funcao.IsNull) then begin
     Mensagem('Você deve selecionar uma função antes de continuar.');
     exit;
  end;

  tblAdmissoes.Post;
end;

procedure Tfrm_Professores.btCont_CancelarClick(Sender: TObject);
begin
  inherited;
  tblAdmissoes.Cancel;
end;

procedure Tfrm_Professores.btCont_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_Professores.tblProfessorNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Edit;
  tblProfessorcd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
  tblProfessorsn_professor.AsString := 'N';
  tblProfessorsn_funcionario.AsString := 'N';
end;

procedure Tfrm_Professores.dsProfAtividadesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  { Mostrar o frame correspondente a atividade selecionada }
  Frame_Prof_Ativ_011.Visible := (tblProfAtividadescd_atividade.AsInteger <=2 ) or (tblProfAtividadescd_atividade.AsInteger > 11);
  Frame_Prof_Ativ_031.Visible := (tblProfAtividadescd_atividade.AsInteger = 3 );
  Frame_Prof_Ativ_041.Visible := (tblProfAtividadescd_atividade.AsInteger = 4 );
  Frame_Prof_Ativ_051.Visible := (tblProfAtividadescd_atividade.AsInteger = 5 );
  Frame_Prof_Ativ_061.Visible := (tblProfAtividadescd_atividade.AsInteger = 6 );
  Frame_Prof_Ativ_071.Visible := (tblProfAtividadescd_atividade.AsInteger = 7 );
  Frame_Prof_Ativ_081.Visible := (tblProfAtividadescd_atividade.AsInteger = 8 );
  Frame_Prof_Ativ_091.Visible := (tblProfAtividadescd_atividade.AsInteger = 9 );
  Frame_Prof_Ativ_101.Visible := (tblProfAtividadescd_atividade.AsInteger = 10 );
  Frame_Prof_Ativ_111.Visible := (tblProfAtividadescd_atividade.AsInteger = 11 );
end;

procedure Tfrm_Professores.btTit_IncluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  inherited;
  dbTitulacao.SetFocus;
  tblProfTitulos.Insert;

end;

procedure Tfrm_Professores.btTit_AlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  inherited;
  tblProfTitulos.Edit;
  dbTitulacao.SetFocus;
end;

procedure Tfrm_Professores.btTit_ExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
  inherited;
  if Mensagem('Tem certeza que deseja excluir o registro de Títulos selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblProfTitulos.Delete;
end;

procedure Tfrm_Professores.btTit_SalvarClick(Sender: TObject);
begin
   jaGerouLog := false;
  inherited;

  if (pgPessoa.ActivePage = TabSheet8) then
   begin
      if (dbEdit12.Focused = true) then
      begin
         DBEdit9.SetFocus;
      end
      else
      begin
         dbEdit12.SetFocus;
      end;
   end;

  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit; 

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;
  tblProfTitulos.Post;
end;

procedure Tfrm_Professores.DBCheckBox3Click(Sender: TObject);
begin
   inherited;
   if tblProfessorsn_professor.AsString = 'S'  then
   begin
      dblProfessor.Visible := true;
      lblColigada.Visible := true;
   end
   else
   begin
      dblProfessor.Visible := false;
      lblColigada.Visible := false;
   end;
end;

procedure Tfrm_Professores.btTit_CancelarClick(Sender: TObject);
begin
  inherited;
  tblProfTitulos.Cancel;
end;

procedure Tfrm_Professores.btTit_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_Professores.dsProfTitulosStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;

      if tblProfTitulos.State = dsInsert Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	       tblProfTitulos.Cancel;
	       Exit;
      End;

      if tblProfTitulos.State = dsEdit Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
	          tblProfTitulos.Cancel;
	       Exit;
	    End;  

   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblProfTitulos.State in [dsEdit, dsInsert] );

      btTit_Incluir.Enabled  := (not EstaEditando);
      btTit_Alterar.Enabled  := (not EstaEditando);
      btTit_Excluir.Enabled  := (not EstaEditando);
      btTit_Fechar.Enabled   := not EstaEditando;

      btTit_Salvar.Enabled   := EstaEditando;
      btTit_Cancelar.Enabled := EstaEditando;
end;

procedure Tfrm_Professores.edLoginExit(Sender: TObject);
const
   SQL_VERIFICA_LOGIN = 'SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = :login';
var
   qryVerificaLogin : TUMZQuery;
begin
   if(edLogin.Text = tblPessoacd_pessoa.AsString ) OR NOT(IsNumericStr(edLogin.Text)) then
   begin
      exit;
   end;

   //Verifica se o login digitado ja é codigo de outra pessoa
   Dm.CriarConsulta(qryVerificaLogin);
   qryVerificaLogin.SQL.Add(SQL_VERIFICA_LOGIN);
   qryVerificaLogin.ParamByName('login').AsString := edLogin.Text;
   qryVerificaLogin.Open;

   if not (qryVerificaLogin.IsEmpty) then
   begin
      MessageBox(Handle, PChar('O login digitado já está em uso no sistema, favor digitar outro.'), PChar('Aviso'), MB_ICONWARNING or MB_OK);
      edLogin.Text := tblPessoads_login.AsString;
   end;

   FreeAndNil(qryVerificaLogin);
end;

procedure Tfrm_Professores.btAtiv_IncluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  inherited;
  tblProfAtividades.Insert;
end;

procedure Tfrm_Professores.btAlterar_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  inherited;
end;

procedure Tfrm_Professores.btAtiv_AlterarClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  inherited;
  tblProfAtividades.Edit;
end;

procedure Tfrm_Professores.btAtiv_ExcluirClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
  inherited;
  if Mensagem('Tem certeza que deseja excluir o registro de Atividades selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblProfAtividades.Delete;

end;

procedure Tfrm_Professores.btAtiv_SalvarClick(Sender: TObject);
begin
  jaGerouLog := false;
  inherited;


  if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  tblProfAtividades.Post;
end;

procedure Tfrm_Professores.btAtiv_CancelarClick(Sender: TObject);
begin
  inherited;
   tblProfAtividades.Cancel;
end;

procedure Tfrm_Professores.btAtiv_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_Professores.pgFormacaoChange(Sender: TObject);
begin
  inherited;
      if pgFormacao.ActivePageIndex = 0 Then
      Begin
          toolTitulos.Visible           := True;
          toolAtividades.Visible  := False;
      End
      Else
      Begin
          toolTitulos.Visible     := False;
          toolAtividades.Visible          := True;
      End;

end;

procedure Tfrm_Professores.dsProfAtividadesStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;


      if tblProfAtividades.State = dsInsert Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	       tblProfAtividades.Cancel;
	       Exit;
      End;

      if tblProfAtividades.State = dsEdit Then
	       if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
	          tblProfAtividades.Cancel;
	       Exit;
	    End;

   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblProfAtividades.State in [dsEdit, dsInsert] );

      btAtiv_Incluir.Enabled  := (not EstaEditando);
      btAtiv_Alterar.Enabled  := (not EstaEditando);
      btAtiv_Excluir.Enabled  := (not EstaEditando);
      btAtiv_Fechar.Enabled   := not EstaEditando;

      btAtiv_Salvar.Enabled   := EstaEditando;
      btAtiv_Cancelar.Enabled := EstaEditando;
end;

procedure Tfrm_Professores.btBuscar_PessoaClick(Sender: TObject);
begin
  inherited;

  tblProfessor.Close;
  tblProfessor.Open;

   if not tblPessoa.EOF Then begin
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
  end;

end;

procedure Tfrm_Professores.tblPessoaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Cancel;
end;

procedure Tfrm_Professores.tblProfessorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  //tblPessoa.Edit;
end;

procedure Tfrm_Professores.tblProfTitulos2AfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure Tfrm_Professores.tblProfAtividadesAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure Tfrm_Professores.tblExperienciaNewRecord(DataSet: TDataSet);
begin
  { Faz a auto-numeração no primeiro campo da tabela }

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Text := 'Select Max(cd_experiencia) from funcionarios_experiencia';
  Dm.qAux1.Open;

  if Dm.qAux1.Eof Then
      DataSet.Fields[0].AsInteger := 1
  else
      DataSet.Fields[0].AsInteger := Dm.qAux1.Fields[0].AsInteger + 1;

end;

procedure Tfrm_Professores.tblAdmissoesNewRecord(DataSet: TDataSet);
begin
  { Faz a auto-numeração no primeiro campo da tabela }

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Text := 'Select Max(cd_admissao) from funcionarios_admissoes';
  Dm.qAux1.Open;

  if Dm.qAux1.Eof Then
      DataSet.Fields[0].AsInteger := 1
  else
      DataSet.Fields[0].AsInteger := Dm.qAux1.Fields[0].AsInteger + 1;

end;


procedure Tfrm_Professores.tblProfTitulosNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblProfTituloscd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Text := 'Select Max(cd_titulo_professor) from professores_titulos';
  Dm.qAux1.Open;

  if Dm.qAux1.Eof Then
      DataSet.Fields[0].AsInteger := 1
  else
      DataSet.Fields[0].AsInteger := Dm.qAux1.Fields[0].AsInteger + 1;
end;

procedure Tfrm_Professores.tsComplementaresShow(Sender: TObject);
begin
  inherited;
   dbObs.Align := alClient;
   dbObs.Refresh;
   Refresh;

   if dbObs.Height < 30 then
   begin
      dbObs.Align := alTop;
      dbObs.Height := 45;
      dbObs.Refresh;
      Refresh;
   end;
end;

function Tfrm_Professores.verificaPassaporteCpf: Boolean;
begin
   Result := true;

   if ((LowerCase(dbNacionalidade.Text) <> 'brasileira') AND (dbNacionalidade.Text <> '')) then
   begin

      if(tblpessoads_cpf.AsString = '')then
      begin
         tblpessoads_cpf.AsString := '00000000000';
      end;

      if ((not ValidaCPF( tblpessoads_cpf.AsString )) AND (tblpessoads_passaporte.AsString = '')) then
      begin
         Mensagem( 'Informe um CPF válido ou um passaporte', Application.Title, MB_OK + MB_ICONSTOP, Handle);
         Result := false;
      end;
      
   end
   else //Se a nacionalidade for brasileira então valida somente o CPF.
   begin
      if(tblpessoads_cpf.AsString = '')then
      begin
         tblpessoads_cpf.AsString := '00000000000';
      end;

      if not ValidaCPF( tblpessoads_cpf.AsString ) then
      begin
         Mensagem( 'CPF informado é inválido.', Application.Title, MB_OK + MB_ICONSTOP, Handle);
         Result := false;
      end;
   end;

   if Result <> false then
   begin
      Result := true;
   end;
end;

procedure Tfrm_Professores.verificaPeriodo;
var
   diferencaDeAnos : TDateTime;
   mesAtual: TDateTime;
   mesFinal: TDateTime;
   diaAtual: TDateTime;
   diaFinal: TDateTime;
begin
   inherited;

   if not(tblExperiencia.State in [dsInsert,dsEdit]) then
   begin
      exit;
   end;

   if( tblExperienciadt_inicial_periodo.IsNull OR (tblExperienciadt_inicial_periodo.asString = '') ) OR
     ( tblExperienciadt_final_periodo.IsNull OR (tblExperienciadt_final_periodo.asString = '')) then
   begin
      dbTempoAnos.Enabled := true;
      dbTempoMeses.Enabled := true;
      exit;
   end;

   if (tblExperienciadt_inicial_periodo.AsDateTime > tblExperienciadt_final_periodo.AsDateTime) then
   begin
      Mensagem('A data inicial do periodo não deve ser maior que a final');
      tblExperienciadt_final_periodo.AsString := '';
      tblExperienciadt_inicial_periodo.AsString := '';

      try
         if(tblExperiencia.State in [dsEdit]) then
         begin
            tblExperienciadt_final_periodo.AsString := tblExperienciadt_final_periodo.OldValue;
            tblExperienciadt_inicial_periodo.AsString := tblExperienciadt_inicial_periodo.OldValue;
         end;
      except
         //registro sem data
      end;

      exit;
   end;

   //Diferença de Ano
   diferencaDeAnos := YearOf(tblExperienciadt_final_periodo.AsDateTime) - YearOf(tblExperienciadt_inicial_periodo.AsDateTime); 
   tblExperienciavl_tempo_anos.AsInteger := StrToInt(FloatToStr(diferencaDeAnos));

   //Diferença de Mês
   mesAtual := MonthOf(tblExperienciadt_inicial_periodo.AsDateTime);
   mesFinal := MonthOf(tblExperienciadt_final_periodo.AsDateTime);

   diaAtual := DayOf(tblExperienciadt_inicial_periodo.AsDateTime);
   diaFinal := DayOf(tblExperienciadt_final_periodo.AsDateTime);

   if (mesFinal = mesAtual) then
   begin
      tblExperienciavl_tempo_meses.AsString := '0';
      if(diaAtual = diaFinal) then
      begin
         tblExperienciavl_tempo_anos.AsInteger := tblExperienciavl_tempo_anos.AsInteger +1;
      end;
   end else if (mesFinal > mesAtual) then
   begin
      tblExperienciavl_tempo_meses.AsString := (FloatToStr(mesFinal - mesAtual));
   end else begin
      //Diminui o ano
      tblExperienciavl_tempo_anos.AsInteger := (tblExperienciavl_tempo_anos.AsInteger -1);

      //Mês
      tblExperienciavl_tempo_meses.AsString := FloatToStr((12 - mesAtual) + mesFinal);
   end;

   dbTempoAnos.Enabled := false;
   dbTempoMeses.Enabled := false;
end;

procedure Tfrm_Professores.tblProfAtividadesNewRecord(DataSet: TDataSet);
begin
  { Faz a auto-numeração no primeiro campo da tabela }

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Text := 'Select Max(cd_professores_atividades) from professores_atividades';
  Dm.qAux1.Open;

  if Dm.qAux1.Eof Then
      DataSet.Fields[0].AsInteger := 1
  else
      DataSet.Fields[0].AsInteger := Dm.qAux1.Fields[0].AsInteger + 1;

  tblProfAtividadescd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;

end;


procedure Tfrm_Professores.dsProfessorStateChange(Sender: TObject);
begin
  inherited;
  if tblProfessor.State in [ dsInsert, dsEdit ] Then
     tblPessoa.Edit;
end;

procedure Tfrm_Professores.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if (tblPessoacd_pessoa.AsInteger = 0) then begin
     AllowChange := False;
     exit;
  end;
  inherited;
  if (tblPessoa.State in [dsInsert, dsEdit]) Then
  Begin
      Mensagem('Salve as alterações antes de passar para a próxima guia.',  'Atenção', MB_OK + MB_ICONWARNING);
      AllowChange := False;
  End
  Else
      AllowChange := True;

  if AllowChange then
  begin
     FPreviousPage := pgPessoa.ActivePageIndex;
  end;

end;

procedure Tfrm_Professores.criaTodosColigadas();
var
   qryUnidadesColigada   : TUMZQuery;
   qryUnidadesJaExitente : TUMZQuery;
   qryInsereRegistro     : TUMZQuery;
begin
   if(tblProfessorcd_pessoa.AsInteger = 0) then
   begin
      tblProfessor.Insert;
      tblProfessorcd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
      tblProfessorsn_funcionario.AsString := 'N';
      tblProfessorsn_coordena_ativo.AsString := 'N';
      tblProfessorsn_professor.AsString := 'N';
      tblProfessor.Post;
      tblProfessor.Close;
      tblProfessor.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
      tblProfessor.Open;
   end;
   DM.CriarConsulta(qryInsereRegistro);
   DM.CriarConsulta(qryUnidadesColigada);
   Dm.CriarConsulta(qryUnidadesJaExitente);
   qryUnidadesColigada.close;
   qryUnidadesColigada.SQL.Text :=
   '  SELECT                     '+
   '     count(*) as qtd         '+
   '  FROM                       '+
   '     coligadas               ';
   qryUnidadesColigada.Open;
   qryUnidadesJaExitente.Close;
   qryUnidadesJaExitente.SQL.Text :=
   ''+
   ' SELECT                      '+
   '    count(*) as qtd          '+
   ' FROM                        '+
   '    professores_unidades     '+
   ' WHERE                       '+
   '    cd_professor = '+tblPessoacd_pessoa.AsString;
   qryUnidadesJaExitente.Open;
   if qryUnidadesColigada.FieldByName('qtd').AsInteger <> qryUnidadesJaExitente.FieldByName('qtd').AsInteger then
   begin
      qryUnidadesColigada.Close;
      qryUnidadesColigada.SQL.Text :=
      '  SELECT                     '+
      '     cd_coligada             '+
      '  FROM                       '+
      '     coligadas               ';
      qryUnidadesColigada.Open;
      qryUnidadesColigada.First;
      while not qryUnidadesColigada.Eof do
      begin
         try
            qryInsereRegistro.SQL.Text := 'INSERT INTO professores_unidades(cd_professor, cd_coligada) VALUES ('+tblProfessorcd_pessoa.AsString+' , '+qryUnidadesColigada.FieldByName('cd_coligada').AsString+' )';
            qryInsereRegistro.ExecSQL;
         except on E: Exception do
         end;
         qryUnidadesColigada.Next;
      end;
   end;
   FreeAndNil(qryUnidadesColigada);
   FreeAndNil(qryUnidadesJaExitente);
   FreeAndNil(qryInsereRegistro);
end;

procedure Tfrm_Professores.dbAdmiExit(Sender: TObject);
begin
  inherited;
   if not(tblAdmissoes.State in [dsInsert,dsEdit]) then
   begin
      exit;
   end;

   if( tblAdmissoesdt_saida.IsNull OR (tblAdmissoesdt_saida.asString = '') ) OR
     ( tblAdmissoesdt_admissao.IsNull OR (tblAdmissoesdt_admissao.asString = '')) then
   begin
      exit;
   end;

   if( tblAdmissoesdt_saida.AsDateTime < tblAdmissoesdt_admissao.AsDateTime ) then
   begin
      Mensagem('A data de admissão não deve ser maior que a de saída.');
      tblAdmissoesdt_saida.AsString := '';
      tblAdmissoesdt_admissao.AsString := '';

      try
         if(tblAdmissoes.State in [dsEdit]) then
         begin
            tblAdmissoesdt_saida.AsString := tblAdmissoesdt_saida.OldValue;
            tblAdmissoesdt_admissao.AsString := tblAdmissoesdt_admissao.OldValue;
         end;
      except
         //registro sem data
      end;
      exit;
   end;
end;

procedure Tfrm_Professores.ProfessorEntregouDocumento1Click(Sender: TObject);
begin
   if popDocumentacao.Items[0].Checked then
   begin
      btDocDesmarcarClick(nil);
   end else begin
      btDocMarcarClick(nil);
   end;
end;

procedure Tfrm_Professores.atualizaCargo;
var
   qryTotalGrupo : TUMZQuery;
   qryUpdate     : TUMZQuery;
begin
   DM.CriarConsulta(qryTotalGrupo);

   
   qryTotalGrupo.Close;

   qryTotalGrupo.SQL.Text :=''+
   ' SELECT                                  '+
   '   max(sn_professor) as sn_professor,    '+
   '   max(sn_orientador) as sn_orientador,  '+
   '   max(sn_funcionario) as sn_funcionario '+
   ' FROM                                    '+
   '   professores_unidades                  '+
   ' WHERE                                   '+
   '   cd_professor=                         '+
   tblProfessorcd_pessoa.AsString;

   qryTotalGrupo.Open;

   DM.CriarConsulta(qryUpdate);

   qryUpdate.Close;

   qryUpdate.SQL.Text :=      ''+
   ' UPDATE                   '+
   '    professores           '+
   ' SET                      '+
   '    sn_funcionario = :sn_funcionario ,'+
   '    sn_coordena_ativo = :sn_coordena_ativo ,'+
   '    sn_professor = :sn_professor            '+
   ' WHERE                                      '+
   '   cd_pessoa = :cd_pessoa';

   qryUpdate.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;

   if ( qryTotalGrupo.FieldByName('sn_funcionario').AsInteger = 1 ) then
      qryUpdate.ParamByName('sn_funcionario').AsString := 'S'
   else
      qryUpdate.ParamByName('sn_funcionario').AsString := 'N';

   if ( qryTotalGrupo.FieldByName('sn_professor').AsInteger = 1 ) then
      qryUpdate.ParamByName('sn_professor').AsString := 'S'
   else
      qryUpdate.ParamByName('sn_professor').AsString := 'N' ;

   if ( qryTotalGrupo.FieldByName('sn_orientador').AsInteger = 1 ) then
      qryUpdate.ParamByName('sn_coordena_ativo').AsString := 'S'
   else
      qryUpdate.ParamByName('sn_coordena_ativo').AsString  := 'N';

   qryUpdate.ExecSQL;


   FreeAndNil(qryTotalGrupo);
end;


procedure Tfrm_Professores.sbCheckFuncionarioClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades   '+
   ' SET                       '+
   '   sn_funcionario  = 1     '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;
end;

procedure Tfrm_Professores.sbCheckOrientadorClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades   '+
   ' SET                       '+
   '   sn_orientador  = 1     '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   atualizaCargo;
   qryUpdate.ExecSQL;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;
end;

procedure Tfrm_Professores.sbCheckProfessorClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades   '+
   ' SET                       '+
   '   sn_professor  = 1     '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;
end;

procedure Tfrm_Professores.sbMaisInformacoesClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  if tblPessoacd_pessoa.AsInteger = 0 then
  begin
    Mensagem('Você precisa selecionar um professor para poder executar esta ação',  'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('P', tblPessoacd_Pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING);

  frm_pessoas_adicional.Free;

end;

procedure Tfrm_Professores.sbPaisComboCloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
   inherited;
   DBCheckBox10.Enabled := true;
   if sbPaisCombo.text = 'BRASIL' then
   begin
      DBCheckBox10.Enabled := false;
   end;

   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString :=
      tblPessoa.FieldByName('descPaisNasc').asString;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      ' SELECT * '+
      ' FROM estados ' +
      ' WHERE cd_pais = :cd_pais_selecionado ' +
      ' ORDER BY ds_estado';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;
end;

procedure Tfrm_Professores.sbPaisComboExit(Sender: TObject);
begin
  inherited;

  //
end;

procedure Tfrm_Professores.sbUnCheckFuncionarioClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades    '+
   ' SET                       '+
   '   sn_funcionario  = 0     '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;
end;

procedure Tfrm_Professores.sbUnCheckOrientadorClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades    '+
   ' SET                       '+
   '   sn_orientador  = 0      '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;
end;

procedure Tfrm_Professores.sbUnCheckProfessorClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades    '+
   ' SET                       '+
   '   sn_professor  = 0       '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.Open;
end;

procedure Tfrm_Professores.SpeedButton2Click(Sender: TObject);
begin
   if not (tblAdmissoes.State in [dsInsert,dsEdit]) then
   begin
      exit;
   end;


   if (DBRadioGroup3.ItemIndex <> 0) then
   begin
      Mensagem('O usuario deve ser membro NDE para podermos relacionar os cursos');
      exit;
   end;

   Application.CreateForm( TformListagemDeCursos, formListagemDeCursos );
   formListagemDeCursos.cd_admisssao := tblAdmissoescd_admissao.AsInteger;
   formListagemDeCursos.sn_coordenacao := 0;
   formListagemDeCursos.ShowModal();
   formListagemDeCursos.Free;
end;

procedure Tfrm_Professores.SpeedButton3Click(Sender: TObject);
begin
   if not (tblAdmissoes.State in [dsInsert,dsEdit]) then
   begin
      exit;
   end;

   if (DBRadioGroup5.ItemIndex <> 0) then
   begin
      Mensagem('O usuario deve ser da coordenação para podermos relacionar os cursos');
      exit;
   end;
   
   Application.CreateForm( TformListagemDeCursos, formListagemDeCursos );
   formListagemDeCursos.cd_admisssao := tblAdmissoescd_admissao.AsInteger;
   formListagemDeCursos.sn_coordenacao := 1;
   formListagemDeCursos.ShowModal();
   formListagemDeCursos.Free;
end;

procedure Tfrm_Professores.pmQtdExperienciaPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblExperiencia, pmQtdExperiencia);

end;

procedure Tfrm_Professores.pmQtdDedicacaoPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblDedicacao, pmQtdDedicacao);

end;

procedure Tfrm_Professores.pmQtdAdmissoesPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblAdmissoes, pmQtdAdmissoes);
end;

procedure Tfrm_Professores.pmQtdProfTitulosPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblProfTitulos, pmQtdProfTitulos);

end;

procedure Tfrm_Professores.popDocumentacaoPopup(Sender: TObject);
begin
   popDocumentacao.Items[0].Checked := qyDocumentosExiste.AsBoolean;
   popDocumentacao.Items[2].Enabled := qyDocumentosDigitalizou.AsBoolean;
end;

procedure Tfrm_Professores.qryProfessoresUnidadesBeforeOpen(DataSet: TDataSet);
begin
   inherited;
   qryProfessoresUnidades.SQL.Text := Format(qryProfessoresUnidades.SQL.Text, [DM.UsuarioLogado.GetColigadasFilhaSelecionada]);
end;

procedure Tfrm_Professores.qyDocumentosCalcFields(DataSet: TDataSet);
begin
   qyDocumentosExiste.AsBoolean := DM.IsTrue(qyDocumentos.FieldByName('Apresentou').AsString);
   qyDocumentosDigitalizou.AsBoolean := DM.IsTrue(qyDocumentos.FieldByName('sn_digitalizado').AsString);
end;

procedure Tfrm_Professores.pmQtdProfAtividadesPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblProfAtividades, pmQtdProfAtividades);

end;

procedure Tfrm_Professores.tblPessoaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Close();
  tblProfessor.Open;
  if DM.UsuarioLogado.TemPermissao(DM.UsuarioLogado.Pessoa.Codigo, 'Academico.Pessoas.Professores.Contratacao', npAcesso, False) then
   TfrmAdmissoes.Load(Self, tbsAdmissoes, tblPessoacd_pessoa.AsInteger);
end;

procedure Tfrm_Professores.tblPessoaAfterPost(DataSet: TDataSet);
begin
  inherited;
  // SE a opção sn_funcionario foi ativado, salva a coligada do funcionário na tabela de professores (professores > cd_coligada)
  // FUNCIONARIO e ADMIN
  if tblProfessorsn_funcionario.AsString <> 'S' then begin
     qryFuncionarioUpdateColigada.ParamByName('CD_PESSOA').AsInteger := tblProfessorcd_pessoa.AsInteger;
     qryFuncionarioUpdateColigada.ParamByName('CD_COLIGADA').AsInteger := tblProfessorcd_coligada.AsInteger;
     qryFuncionarioUpdateColigada.ExecSQL;
  end;
end;

procedure Tfrm_Professores.tblPessoaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IF tblProfessor.State IN [dsEdit, dsInsert] Then
     tblProfessor.Post;
end;


end.
