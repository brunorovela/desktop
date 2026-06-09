unit uProfessorAfrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uPessoasAfrica, ZConnection, Db, ImgList, Buttons, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, Mask, ComCtrls, ToolWin, uFrame_Prof_Ativ_01,
  uFrame_Prof_Ativ_03, uFrame_Prof_Ativ_11, uFrame_Prof_Ativ_10,
  uFrame_Prof_Ativ_09, uFrame_Prof_Ativ_08, uFrame_Prof_Ativ_07,
  uFrame_Prof_Ativ_06, uFrame_Prof_Ativ_05, uFrame_Prof_Ativ_04, ExtDlgs,
  Menus, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  uPessoas, uFrameParentes, ZAbstractTable, DelphiTwain, DSPack, CropImage,
  ZSqlUpdate, UMComboBox;

type
  TfProfessoresAfrica = class(TfPessoasAfrica)
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
    SpeedButton3: TSpeedButton;
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
    tblDedicacao: TZTable;
    dsDedicacao: TDataSource;
    tblDedicacaocd_dedicacao: TIntegerField;
    tblDedicacaocd_pessoa: TIntegerField;
    tblDedicacaocd_tipo_atuacao: TSmallintField;
    tblDedicacaocd_curso: TStringField;
    tblDedicacaods_atividade: TStringField;
    tblDedicacaovl_horas: TFloatField;
    tblDedicacaovl_anosemestre: TSmallintField;
    tblDedicacaodescAtuacao: TStringField;
    tblDedicacaodescCurso: TStringField;
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
    DBLookupComboBox5: TDBLookupComboBox;
    tblProfTitulos: TZTable;
    dsProfTitulos: TDataSource;
    tblProfTituloscd_pessoa: TIntegerField;
    tblProfTituloscd_titulacao: TSmallintField;
    tblProfTitulosvl_ano: TSmallintField;
    tblProfTituloscd_instituicao: TIntegerField;
    tblProfTituloscd_area: TSmallintField;
    tblProfTitulosds_titulo_trabalho: TStringField;
    tblProfTitulosds_conceito: TStringField;
    tblProfTitulosds_habilitacao: TStringField;
    tblProfTitulosds_local: TStringField;
    tblProfTitulosds_estado: TStringField;
    tblProfTitulosvl_horas: TFloatField;
    tblProfTituloscd_titulo_professor: TIntegerField;
    tblProfTitulosds_Curso: TStringField;
    DBGrid4: TDBGrid;
    Panel12: TPanel;
    tblProfTitulosdescTitulacao: TStringField;
    tblProfTitulosdescInstituicao: TStringField;
    tblProfTitulosdescArea: TStringField;
    tblProfTitulosdescEstado: TStringField;
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
    tblCursoscodigo: TStringField;
    tblCursosdescricao: TStringField;
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
    tblContatosPadroes: TUMZQuery;
    qryProfTitulos: TUMZQuery;
    qryProfTituloscd_titulo_professor: TIntegerField;
    qryProfTituloscd_pessoa: TIntegerField;
    qryProfTituloscd_titulacao: TSmallintField;
    qryProfTitulosds_curso: TStringField;
    qryProfTitulosvl_ano: TSmallintField;
    qryProfTituloscd_instituicao: TIntegerField;
    qryProfTituloscd_area: TSmallintField;
    qryProfTitulosds_titulo_trabalho: TStringField;
    qryProfTitulosds_conceito: TStringField;
    qryProfTitulosds_habilitacao: TStringField;
    qryProfTitulosds_local: TStringField;
    qryProfTitulosds_estado: TStringField;
    qryProfTitulosvl_horas: TFloatField;
    qryProfTitulosdescEstados: TStringField;
    qryProfTitulosdescTitulacao: TStringField;
    qryProfTitulosdescInstituicao: TStringField;
    qryProfTitulosdescArea: TStringField;
    Panel14: TPanel;
    dbgUnidadesCargos: TDBGrid;
    sbUnCheckProfessor: TSpeedButton;
    sbCheckProfessor: TSpeedButton;
    sbUnCheckOrientador: TSpeedButton;
    sbCheckOrientador: TSpeedButton;
    sbCheckFuncionario: TSpeedButton;
    sbUnCheckFuncionario: TSpeedButton;
    qryProfessoresUnidades: TUMZQuery;
    qryProfessoresUnidadessn_funcionario: TSmallintField;
    qryProfessoresUnidadessn_professor: TSmallintField;
    qryProfessoresUnidadessn_orientador: TSmallintField;
    qryProfessoresUnidadescd_coligada: TIntegerField;
    qryProfessoresUnidadesnm_coligada: TStringField;
    dsProfessorUnidades: TDataSource;
    tsDocumentos: TTabSheet;
    dbgDocumentos: TDBGrid;
    Panel15: TPanel;
    toolDocumentos: TToolBar;
    btDocMarcar: TToolButton;
    btDocDesmarcar: TToolButton;
    tbDocSeparador1: TToolButton;
    btDocDigitalizar: TToolButton;
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
    qryProfessoresUnidadescd_professor: TIntegerField;
    procedure tsComplementaresExit(Sender: TObject);
    procedure tsComplementaresShow(Sender: TObject);
    procedure Limparadigitalizao1Click(Sender: TObject);
    procedure Digitalizardocumento1Click(Sender: TObject);
    procedure ProfessorEntregouDocumento1Click(Sender: TObject);
    procedure popDocumentacaoPopup(Sender: TObject);
    procedure qyDocumentosCalcFields(DataSet: TDataSet);
    procedure dbgDocumentosDblClick(Sender: TObject);
    procedure btDocFecharClick(Sender: TObject);
    procedure btDocDigitalizarClick(Sender: TObject);
    procedure btDocDesmarcarClick(Sender: TObject);
    procedure btDocMarcarClick(Sender: TObject);
    procedure tblPessoaAfterInsert(DataSet: TDataSet);
    procedure sbUnCheckProfessorClick(Sender: TObject);
    procedure sbCheckProfessorClick(Sender: TObject);
    procedure sbUnCheckOrientadorClick(Sender: TObject);
    procedure sbCheckOrientadorClick(Sender: TObject);
    procedure sbUnCheckFuncionarioClick(Sender: TObject);
    procedure sbCheckFuncionarioClick(Sender: TObject);
    procedure dbgUnidadesCargosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgUnidadesCargosCellClick(Column: TColumn);
    procedure qryProfTitulosNewRecord(DataSet: TDataSet);
    procedure tblPessoaBeforePost(DataSet: TDataSet);
    procedure toolDedicacaoClick(Sender: TObject);
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
    procedure tblProfTitulosAfterPost(DataSet: TDataSet);
    procedure tblProfAtividadesAfterPost(DataSet: TDataSet);
    procedure tblExperienciaNewRecord(DataSet: TDataSet);
    procedure tblDedicacaoNewRecord(DataSet: TDataSet);
    procedure tblAdmissoesNewRecord(DataSet: TDataSet);
    procedure tblProfTitulosNewRecord(DataSet: TDataSet);
    procedure tblProfAtividadesNewRecord(DataSet: TDataSet);
    procedure dsProfessorStateChange(Sender: TObject);
    procedure pgPessoaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure pmQtdExperienciaPopup(Sender: TObject);
    procedure pmQtdDedicacaoPopup(Sender: TObject);
    procedure pmQtdAdmissoesPopup(Sender: TObject);
    procedure pmQtdProfTitulosPopup(Sender: TObject);
    procedure pmQtdProfAtividadesPopup(Sender: TObject);
    procedure salvaUnidadades(Valor : Integer; Column : TColumn);
    procedure atualizaCargo;
  private
    procedure criaTodosColigadas;
    procedure AtualizarDocumentosProfessor;
    
    { Private declarations }

    procedure verificar_contatos_padroes(CodAluno : Integer);
  public
    { Public declarations }
  end;

var
  fProfessoresAfrica: TfProfessoresAfrica;

implementation

Uses uDM, uFSelecionarPessoa, uPessoas_adicional, uUsuario, uDigDocumentos;

{$R *.DFM}

procedure TfProfessoresAfrica.FormShow(Sender: TObject);
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

  qryProfessoresUnidades.Close;
  qryProfessoresUnidades.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
  qryProfessoresUnidades.Open;

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

  { inicia permissao }
  iPermissao := 1001;

end;

procedure TfProfessoresAfrica.Limparadigitalizao1Click(Sender: TObject);
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

procedure TfProfessoresAfrica.dsExperienciaStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;
   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblExperiencia.State in [dsEdit, dsInsert] );

      btExp_Incluir.Enabled  := (not EstaEditando);
      btExp_Alterar.Enabled  := (not EstaEditando);
      btExp_Excluir.Enabled  := (not EstaEditando);
      btExp_Fechar.Enabled   := not EstaEditando;

      btExp_Salvar.Enabled   := EstaEditando;
      btExp_Cancelar.Enabled := EstaEditando;
end;

procedure TfProfessoresAfrica.btExp_IncluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npIncluir, True ) then Exit;

  dbAtuacao.SetFocus;
  tblExperiencia.Insert;
end;

procedure TfProfessoresAfrica.btExp_AlterarClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;

  tblExperiencia.Edit;
  dbAtuacao.SetFocus;

end;

procedure TfProfessoresAfrica.btExp_ExcluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npExcluir, True ) then Exit;

  if Mensagem('Tem certeza que deseja excluir o registro de atividade selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblExperiencia.Delete;
end;

procedure TfProfessoresAfrica.btExp_SalvarClick(Sender: TObject);
begin
  inherited;

  dbFuncao.SetFocus;
  dbEmpresa.SetFocus;
   
  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit; 
  tblExperiencia.Post;
end;

procedure TfProfessoresAfrica.btSalvar_PessoaClick(Sender: TObject);
begin
  inherited;

  if (pgPessoa.ActivePage = tsDadosPessoais) then
  begin
     dbEndereco.SetFocus;
     dbNome.SetFocus;
  end;

  if (pgPessoa.ActivePage = tsComplementares) then
  begin
     DBEdit1.SetFocus;
     DBEdit13.SetFocus;
  end;
  
  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not tblPessoa.EOF Then begin
     tblContatoPessoa.Close();
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
     tblContatoPessoa.Open();
  end;
end;

procedure TfProfessoresAfrica.btExp_CancelarClick(Sender: TObject);
begin
  inherited;
  tblExperiencia.Cancel;
end;

procedure TfProfessoresAfrica.btAtiv_BuscarClick(Sender: TObject);
begin
  btBuscar_PessoaClick(nil);

end;

procedure TfProfessoresAfrica.btExp_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;


procedure TfProfessoresAfrica.criaTodosColigadas();
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
      tblProfessorsn_professor.AsString := 'N';
      tblPessoa.Post;
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


procedure TfProfessoresAfrica.pgPessoaChange(Sender: TObject);
begin
  inherited;

  qryProfessoresUnidades.Close;
  qryProfessoresUnidades.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
  qryProfessoresUnidades.Open;
  
  if (pgPessoa.ActivePageIndex = 0) or (pgPessoa.ActivePageIndex = 1) or (pgPessoa.ActivePageIndex = 2) Then  // Dados Pessoais e Complementares e Parentes
  Begin
      toolAtividades.Visible  := False;
      toolDocumentos.Visible  := False;
      toolTitulos.Visible     := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := True;
      criaTodosColigadas;
  End
  Else if pgPessoa.ActivePageIndex = 3 Then //Experiência Profissional
  Begin

      if not DM.UsuarioLogado.TemPermissao( 1002, npAcesso, True ) then
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

      if not DM.UsuarioLogado.TemPermissao( 1002, npAcesso, True ) then
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
      tblDedicacao.Open();
  End
  Else if pgPEssoa.ActivePageIndex = 5 Then // Contratações
  Begin

      if not DM.UsuarioLogado.TemPermissao( 1002, npAcesso, True ) then
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
  End
  Else if pgPessoa.ActivePageIndex = 6 Then //FORMAÇÃO ACADÊMICA
  Begin

      if not DM.UsuarioLogado.TemPermissao( 1002, npAcesso, True ) then
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

      tblProfTitulos.Close();
      tblProfTitulos.Open();

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
      toolDocumentos.Visible  := False;
      toolAdmissoes.Visible   := False;
      toolDedicacao.Visible   := False;
      toolExperiencia.Visible := False;
      toolPessoa.Visible      := False;


      {** abre filtro de titulos do professor **}
      qryProfTitulos.close;
      qryProfTitulos.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
      qryProfTitulos.open;


  end
  Else if pgPessoa.ActivePageIndex = 7 Then //DOCUMENTAÇÃO
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

     toolDocumentos.Visible  := True;
     toolAtividades.Visible  := False;
     toolTitulos.Visible     := False;
     toolAdmissoes.Visible   := False;
     toolDedicacao.Visible   := False;
     toolExperiencia.Visible := False;
     toolPessoa.Visible      := False;

     AtualizarDocumentosProfessor();

     qyDocumentos.Close;
     qyDocumentos.ParamByName('cd_professor').AsInteger := tblProfessorcd_pessoa.AsInteger;
     qyDocumentos.Open;

  End;
end;

procedure TfProfessoresAfrica.tblExperienciaAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure TfProfessoresAfrica.dsDedicacaoStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;
   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblDedicacao.State in [dsEdit, dsInsert] );

      btDed_Incluir.Enabled  := (not EstaEditando);
      btDed_Alterar.Enabled  := (not EstaEditando);
      btDed_Excluir.Enabled  := (not EstaEditando);
      btDed_Fechar.Enabled   := not EstaEditando;

      btDed_Salvar.Enabled   := EstaEditando;
      btDed_Cancelar.Enabled := EstaEditando;
end;

procedure TfProfessoresAfrica.btDed_IncluirClick(Sender: TObject);
begin
  inherited;
  dbAtuacaoDedicacao.SetFocus;
  tblDedicacao.Insert;
end;

procedure TfProfessoresAfrica.btDed_AlterarClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;

  tblDedicacao.Edit;
  dbAtuacaoDedicacao.SetFocus;
end;

procedure TfProfessoresAfrica.btDed_ExcluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npExcluir, True ) then Exit;

  if Mensagem('Tem certeza que deseja excluir o registro de dedicação selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblDedicacao.Delete;

end;

procedure TfProfessoresAfrica.btDed_SalvarClick(Sender: TObject);
begin
  inherited;

  dbCurso.SetFocus;
  dbDescCurso.SetFocus;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;
  tblDedicacao.Post;
end;

procedure TfProfessoresAfrica.btDocDesmarcarClick(Sender: TObject);
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
   DM.qyAux.ParamByName('aluno').AsInteger := tblProfessorcd_pessoa.AsInteger;
   DM.qyAux.ParamByName('doc').AsInteger := qyDocumentosCodigo.AsInteger;
   DM.qyAux.ExecSQL;

   lugar := qyDocumentos.GetBookmark;
   qyDocumentos.Close;
   qyDocumentos.Open;
   qyDocumentos.GotoBookmark(lugar);
end;

procedure TfProfessoresAfrica.btDocDigitalizarClick(Sender: TObject);
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
   FDigDocumentos.iCodAluno := tblProfessorcd_pessoa.AsInteger;

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

procedure TfProfessoresAfrica.btDocFecharClick(Sender: TObject);
begin
   inherited;
   close;
end;

procedure TfProfessoresAfrica.btDocMarcarClick(Sender: TObject);
var
   lugar: Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   DM.qyAux.SQL.Clear;
   DM.qyAux.SQL.Add('UPDATE documentos_alunos SET apresentou = "S", dt_entrega = NOW() ');
   DM.qyAux.SQL.Add('WHERE codigoaluno = :aluno AND cod_documento = :doc');
   DM.qyAux.ParamByName('aluno').AsInteger := tblProfessorcd_pessoa.AsInteger;
   DM.qyAux.ParamByName('doc').AsInteger := qyDocumentosCodigo.AsInteger;
   DM.qyAux.ExecSQL;

   lugar := qyDocumentos.GetBookmark;
   qyDocumentos.Close;
   qyDocumentos.Open;
   qyDocumentos.GotoBookmark(lugar);
end;

procedure TfProfessoresAfrica.btDed_CancelarClick(Sender: TObject);
begin
  inherited;
  tblDedicacao.Cancel;
end;

procedure TfProfessoresAfrica.btDed_BuscarClick(Sender: TObject);
begin
  inherited;
  btBuscar_PessoaClick(nil);
end;

procedure TfProfessoresAfrica.btDed_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfProfessoresAfrica.tblDedicacaoAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure TfProfessoresAfrica.tblAdmissoesAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure TfProfessoresAfrica.dbgDocumentosDblClick(Sender: TObject);
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

procedure TfProfessoresAfrica.dbgUnidadesCargosCellClick(Column: TColumn);
var
   cd_coligada : Integer;
begin
  inherited;
   if ( tblPessoa.State = dsInsert ) or ( tblPessoa.State = dsEdit ) then
   begin
      Mensagem('Você não pode estar em modo de edição para alterar este campo');
      Exit
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
   cd_coligada  := qryProfessoresUnidadescd_coligada.AsInteger;
   atualizaCargo;

   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;


   qryProfessoresUnidades.Locate('cd_coligada', cd_coligada,[]);

end;


procedure TfProfessoresAfrica.dbgUnidadesCargosDrawColumnCell(Sender: TObject;
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

procedure TfProfessoresAfrica.Digitalizardocumento1Click(Sender: TObject);
begin
   btDocDigitalizarClick(nil);
end;

procedure TfProfessoresAfrica.atualizaCargo;
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
   tblPessoacd_pessoa.AsString;

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




procedure TfProfessoresAfrica.salvaUnidadades(Valor : Integer; Column : TColumn);
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
                                '   cd_professor = '+tblPessoacd_pessoa.AsString;
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
                                   '   cd_professor = '+tblPessoacd_pessoa.AsString;
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
      qryInsereProf.ParamByName('cd_professor').AsInteger := tblPessoacd_pessoa.AsInteger;
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


procedure TfProfessoresAfrica.dsAdmissoesStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;
   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblAdmissoes.State in [dsEdit, dsInsert] );

      btCont_Incluir.Enabled  := (not EstaEditando);
      btCont_Alterar.Enabled  := (not EstaEditando);
      btCont_Excluir.Enabled  := (not EstaEditando);
      btCont_Fechar.Enabled   := not EstaEditando;

      btCont_Salvar.Enabled   := EstaEditando;
      btCont_Cancelar.Enabled := EstaEditando;
end;

procedure TfProfessoresAfrica.btCont_IncluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npIncluir, True ) then Exit;

  dbRegime.SetFocus;
  tblAdmissoes.Insert;
end;

procedure TfProfessoresAfrica.btCont_AlterarClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;

  tblAdmissoes.Edit;
  dbRegime.SetFocus;

end;

procedure TfProfessoresAfrica.btCont_ExcluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npExcluir, True ) then Exit;

  if Mensagem('Tem certeza que deseja excluir o registro de Contratação selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblAdmissoes.Delete;

end;

procedure TfProfessoresAfrica.btCont_SalvarClick(Sender: TObject);
begin
  inherited;

  dbHoras.SetFocus;
  dbSaida.SetFocus;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit; 
  tblAdmissoes.Post;
end;

procedure TfProfessoresAfrica.btCont_CancelarClick(Sender: TObject);
begin
  inherited;
  tblAdmissoes.Cancel;
end;

procedure TfProfessoresAfrica.btCont_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfProfessoresAfrica.tblProfessorNewRecord(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Edit;
  tblProfessorcd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
  tblProfessorsn_professor.AsString := 'N';
  tblProfessorsn_funcionario.AsString := 'N';
end;

procedure TfProfessoresAfrica.tblPessoaBeforePost(DataSet: TDataSet);
begin
  inherited;
  IF tblProfessor.State IN [dsEdit, dsInsert] Then
     tblProfessor.Post;
end;

procedure TfProfessoresAfrica.dsProfAtividadesDataChange(Sender: TObject;
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

procedure TfProfessoresAfrica.btTit_IncluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npIncluir, True ) then Exit;

  dbTitulacao.SetFocus;

  qryProfTitulos.Insert;

end;

procedure TfProfessoresAfrica.btTit_AlterarClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;

  qryProfTitulos.Edit;
  dbTitulacao.SetFocus;
end;

procedure TfProfessoresAfrica.btTit_ExcluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npExcluir, True ) then Exit;

  if Mensagem('Tem certeza que deseja excluir o registro de Títulos selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     qryProfTitulos.Delete;
end;

procedure TfProfessoresAfrica.btTit_SalvarClick(Sender: TObject);
begin
  inherited;

  DBEdit12.SetFocus;
  DBEdit9.SetFocus;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit; 
  qryProfTitulos.Post;
end;

procedure TfProfessoresAfrica.btTit_CancelarClick(Sender: TObject);
begin
  inherited;
  qryProfTitulos.Cancel;
end;

procedure TfProfessoresAfrica.btTit_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfProfessoresAfrica.dsProfTitulosStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;

   if qryProfTitulos.State = dsInsert Then

      if not DM.UsuarioLogado.TemPermissao( 1002, npIncluir, True ) then Begin
         qryProfTitulos.Cancel;

      Exit;
   End;

   if qryProfTitulos.State = dsEdit Then

      if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Begin
         qryProfTitulos.Cancel;

      Exit;
   End;

   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
   EstaEditando := ( qryProfTitulos.State in [dsEdit, dsInsert] );

   btTit_Incluir.Enabled  := (not EstaEditando);
   btTit_Alterar.Enabled  := (not EstaEditando);
   btTit_Excluir.Enabled  := (not EstaEditando);
   btTit_Fechar.Enabled   := not EstaEditando;

   btTit_Salvar.Enabled   := EstaEditando;
   btTit_Cancelar.Enabled := EstaEditando;   

end;

procedure TfProfessoresAfrica.btAtiv_IncluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npIncluir, True ) then Exit;

  tblProfAtividades.Insert;
end;

procedure TfProfessoresAfrica.AtualizarDocumentosProfessor;
const
   SQL_ATUALIZAR_DOCUMENTOS = 'INSERT IGNORE INTO DOCUMENTOS_ALUNOS (CODIGOALUNO, COD_DOCUMENTO, APRESENTOU) '+
                              '  SELECT :cd_professor, codigo, "N" FROM documentos';
var
   qyAtualizarDocumentosProfessor: TUMZQuery;
begin
   DM.CriarConsulta(qyAtualizarDocumentosProfessor);

   qyAtualizarDocumentosProfessor.SQL.Text := SQL_ATUALIZAR_DOCUMENTOS;
   qyAtualizarDocumentosProfessor.Close;
   qyAtualizarDocumentosProfessor.ParamByName('cd_professor').AsInteger := tblProfessorcd_pessoa.AsInteger;
   qyAtualizarDocumentosProfessor.ExecSQL;
end;

procedure TfProfessoresAfrica.btAtiv_AlterarClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;

  tblProfAtividades.Edit;
end;

procedure TfProfessoresAfrica.btAtiv_ExcluirClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npExcluir, True ) then Exit;

  if Mensagem('Tem certeza que deseja excluir o registro de Atividades selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
     tblProfAtividades.Delete;

end;

procedure TfProfessoresAfrica.btAtiv_SalvarClick(Sender: TObject);
begin
  inherited;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not DM.UsuarioLogado.TemPermissao( 1002, npAlterar, True ) then Exit;
  tblProfAtividades.Post;
end;

procedure TfProfessoresAfrica.btAtiv_CancelarClick(Sender: TObject);
begin
  inherited;
   tblProfAtividades.Cancel;
end;

procedure TfProfessoresAfrica.btAtiv_FecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfProfessoresAfrica.pgFormacaoChange(Sender: TObject);
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

procedure TfProfessoresAfrica.dsProfAtividadesStateChange(Sender: TObject);
Var EstaEditando : Boolean;
begin
  inherited;
   { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblProfAtividades.State in [dsEdit, dsInsert] );

      btAtiv_Incluir.Enabled  := (not EstaEditando);
      btAtiv_Alterar.Enabled  := (not EstaEditando);
      btAtiv_Excluir.Enabled  := (not EstaEditando);
      btAtiv_Fechar.Enabled   := not EstaEditando;

      btAtiv_Salvar.Enabled   := EstaEditando;
      btAtiv_Cancelar.Enabled := EstaEditando;
end;

procedure TfProfessoresAfrica.btBuscar_PessoaClick(Sender: TObject);
begin
  inherited;
  tblProfessor.Close;
  tblProfessor.Open;

   if not tblPessoa.EOF Then begin
     tblContatoPessoa.Close();
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
     tblContatoPessoa.Open();
  end;

end;

procedure TfProfessoresAfrica.tblPessoaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Cancel;
end;

procedure TfProfessoresAfrica.tblPessoaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Insert;
  tblProfessorcd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
end;

procedure TfProfessoresAfrica.tblProfessorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  tblPessoa.Edit;
end;

procedure TfProfessoresAfrica.tblProfTitulosAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure TfProfessoresAfrica.tblProfAtividadesAfterPost(DataSet: TDataSet);
begin
  inherited;
  DataSet.Refresh;
end;

procedure TfProfessoresAfrica.tblExperienciaNewRecord(DataSet: TDataSet);
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

procedure TfProfessoresAfrica.tblDedicacaoNewRecord(DataSet: TDataSet);
begin
  { Faz a auto-numeração no primeiro campo da tabela }

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Text := 'Select Max(cd_dedicacao) from funcionarios_dedicacao';
  Dm.qAux1.Open;

  if Dm.qAux1.Eof Then
      DataSet.Fields[0].AsInteger := 1
  else
      DataSet.Fields[0].AsInteger := Dm.qAux1.Fields[0].AsInteger + 1;

end;

procedure TfProfessoresAfrica.tblAdmissoesNewRecord(DataSet: TDataSet);
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


procedure TfProfessoresAfrica.tblProfTitulosNewRecord(DataSet: TDataSet);
begin
  { Faz a auto-numeração no primeiro campo da tabela }

  Dm.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Text := 'Select Max(cd_titulo_professor) from professores_titulos';
  Dm.qAux1.Open;

  if Dm.qAux1.Eof Then
      DataSet.Fields[0].AsInteger := 1
  else
      DataSet.Fields[0].AsInteger := Dm.qAux1.Fields[0].AsInteger + 1;

end;


procedure TfProfessoresAfrica.toolDedicacaoClick(Sender: TObject);
begin
  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1002, npIncluir, True ) then Exit;

end;

procedure TfProfessoresAfrica.tsComplementaresExit(Sender: TObject);
begin
  inherited;
    lbFormaConheceuInst.Visible := True;
    cbFormaConhece.Visible := True;
    lbInformeFicouSabendo.Visible := True;
    btnNecessidaEspecial.Visible := True;
end;

procedure TfProfessoresAfrica.tsComplementaresShow(Sender: TObject);
begin
  inherited;
   lbFormaConheceuInst.Visible := False;
   cbFormaConhece.Visible := False;
   lbInformeFicouSabendo.Visible := false;
   btnNecessidaEspecial.Visible := False;
end;

procedure TfProfessoresAfrica.verificar_contatos_padroes(CodAluno: Integer);
begin
 { Verificar contratos padrões }
 with DM.qyAux2 do begin
   Close();
   Params.Clear();
   SQL.Text :=
   ' SELECT ' + IntToStr(CodAluno) + ' as codaluno, ct.cd_contato, "" as dscontato FROM contatos_tipos ct ' +
   ' LEFT join contatos_pessoas cp ON (ct.cd_contato = cp.cd_contato AND cp.cd_pessoa = ' + IntToStr(CodAluno) + ') '+
   ' WHERE cp.cd_pessoa is null AND ct.sn_padrao = "S" ';
   Open();
   tblContatosPadroes.Close();
   tblContatosPadroes.SQL.Clear();
   tblContatosPadroes.Params.Clear();
   tblContatosPadroes.SQL.Text :=
   'INSERT IGNORE INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) '+
   'VALUES (:pessoa, :contato, :dscontato)';
   while not Eof do begin
      tblContatosPadroes.ParamByName('pessoa').AsInteger := FieldByName('codaluno').AsInteger;
      tblContatosPadroes.ParamByName('contato').ASInteger := FieldByName('cd_contato').AsInteger;
      tblContatosPadroes.ParamByName('dscontato').asString := FieldByName('dscontato').AsString;
      tblContatosPadroes.ExecSQL();
      Next();
   end;
   tblContatosPadroes.Close();
   tblContatosPadroes.SQL.Clear();
   tblContatosPadroes.Params.Clear();
   Close();
 end;
end;

procedure TfProfessoresAfrica.tblProfAtividadesNewRecord(DataSet: TDataSet);
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

end;


procedure TfProfessoresAfrica.dsProfessorStateChange(Sender: TObject);
begin
  inherited;
  if tblProfessor.State in [ dsInsert, dsEdit ] Then
     tblPessoa.Edit;
end;

procedure TfProfessoresAfrica.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if (tblPessoa.State in [dsInsert, dsEdit]) Then
  Begin
      Mensagem('Salve as alterações antes de passar para a próxima guia.',  'Atenção', MB_OK + MB_ICONWARNING);
      AllowChange := False;
  End
  Else
      AllowChange := True;

end;

procedure TfProfessoresAfrica.sbCheckFuncionarioClick(Sender: TObject);
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
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger :=  tblProfessorcd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;
end;

procedure TfProfessoresAfrica.sbCheckOrientadorClick(Sender: TObject);
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
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger :=  tblProfessorcd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;
end;

procedure TfProfessoresAfrica.sbCheckProfessorClick(Sender: TObject);
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
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger :=  tblProfessorcd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;
end;

procedure TfProfessoresAfrica.sbMaisInformacoesClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('P', tblPessoacd_Pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING);

  frm_pessoas_adicional.Free;

end;

procedure TfProfessoresAfrica.sbUnCheckFuncionarioClick(Sender: TObject);
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
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger :=  tblProfessorcd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;
end;

procedure TfProfessoresAfrica.sbUnCheckOrientadorClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades   '+
   ' SET                       '+
   '   sn_orientador  = 0     '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   atualizaCargo;
   qryUpdate.ExecSQL;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger :=  tblProfessorcd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;
end;

procedure TfProfessoresAfrica.sbUnCheckProfessorClick(Sender: TObject);
var
   qryUpdate : TUMZQuery;
begin
   dm.CriarConsulta(qryUpdate);
   qryUpdate.SQL.Text :=
   ' UPDATE                    '+
   '   professores_unidades   '+
   ' SET                       '+
   '   sn_professor  = 0     '+
   ' WHERE                     '+
   '   cd_professor = '+tblProfessorcd_pessoa.AsString;
   qryUpdate.ExecSQL;
   atualizaCargo;
   FreeAndNil(qryUpdate);
   qryProfessoresUnidades.Close;
   qryProfessoresUnidades.ParamByName('cd_professor').AsInteger :=  tblProfessorcd_pessoa.AsInteger;
   qryProfessoresUnidades.Open;
end;

procedure TfProfessoresAfrica.pmQtdExperienciaPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblExperiencia, pmQtdExperiencia);

end;

procedure TfProfessoresAfrica.pmQtdDedicacaoPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblDedicacao, pmQtdDedicacao);

end;

procedure TfProfessoresAfrica.pmQtdAdmissoesPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblAdmissoes, pmQtdAdmissoes);

end;

procedure TfProfessoresAfrica.pmQtdProfTitulosPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(qryProfTitulos, pmQtdProfTitulos);

end;

procedure TfProfessoresAfrica.popDocumentacaoPopup(Sender: TObject);
begin
   popDocumentacao.Items[0].Checked := qyDocumentosExiste.AsBoolean;
   popDocumentacao.Items[2].Enabled := qyDocumentosDigitalizou.AsBoolean;
end;

procedure TfProfessoresAfrica.ProfessorEntregouDocumento1Click(Sender: TObject);
begin
   if popDocumentacao.Items[0].Checked then
   begin
      btDocDesmarcarClick(nil);
   end else begin
      btDocMarcarClick(nil);
   end;
end;

procedure TfProfessoresAfrica.qryProfTitulosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryProfTituloscd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
end;

procedure TfProfessoresAfrica.qyDocumentosCalcFields(DataSet: TDataSet);
begin
   qyDocumentosExiste.AsBoolean := DM.IsTrue(qyDocumentos.FieldByName('Apresentou').AsString);
   qyDocumentosDigitalizou.AsBoolean := DM.IsTrue(qyDocumentos.FieldByName('sn_digitalizado').AsString);
end;

procedure TfProfessoresAfrica.pmQtdProfAtividadesPopup(Sender: TObject);
begin
  inherited;
  DM.quantidade_registros_table(tblProfAtividades, pmQtdProfAtividades);

end;

procedure TfProfessoresAfrica.tblPessoaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  tblProfessor.Close();
  tblProfessor.Open;
end;

end.

