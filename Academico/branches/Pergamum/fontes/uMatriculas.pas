unit uMatriculas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls,
  Menus, ImgList, ToolWin, Variants, Jpeg, ZDbcIntfs, UZDbcFuncs, ClassRegistros,
  uFSelecionarTurma, uFSelecionarDisciplina, uMensagem, Math, UZSortedGrid;

type
  TFiltroPadro = (FiltroAluno, FiltroTurma, FiltroMatriculas, FiltroData, FiltroDisciplina);

  TfrmMatriculas = class(TForm)
    dtcMatriculas: TDataSource;
    qryUpdate: TUMZQuery;
    qryAlterarTurma: TUMZQuery;
    qryCancelar: TUMZQuery;
    qryReativar: TUMZQuery;
    qryPendentes: TUMZQuery;
    tblMatriculas: TUMZQuery;
    tblMatriculasTurma: TStringField;
    tblMatriculasDataEmissao: TDateTimeField;
    tblMatriculasUsuario: TStringField;
    tblMatriculasPlanoPagamento: TIntegerField;
    tblMatriculasDataSaida: TDateTimeField;
    tblMatriculasPlanoDesconto: TIntegerField;
    tblMatriculasNome: TStringField;
    qryDelete: TUMZQuery;
    qryCodigo: TUMZQuery;
    PageControl1: TPageControl;
    tabAlunos: TTabSheet;
    grd: TZSortedGrid;
    tabDisciplinas: TTabSheet;
    Panel3: TPanel;
    tblFichaIndividual: TUMZQuery;
    dtcFichaIndividual: TDataSource;
    tblFichaIndividualCodigo: TSmallintField;
    tblFichaIndividualSigla: TStringField;
    tblFichaIndividualDescricao: TStringField;
    tblFichaIndividualCodigoAluno: TIntegerField;
    tblFichaIndividualTurma: TStringField;
    tblFichaIndividualAnoSemestre: TSmallintField;
    tblFichaIndividualNota1: TFloatField;
    tblFichaIndividualNota2: TFloatField;
    tblFichaIndividualNota3: TFloatField;
    tblFichaIndividualNota4: TFloatField;
    tblFichaIndividualNotaExame: TFloatField;
    tblFichaIndividualSituacao: TSmallintField;
    tblFichaIndividualCurso: TStringField;
    tblFichaIndividualSerie: TSmallintField;
    tblFichaIndividualDescricaoDisciplina: TStringField;
    qryDeleteAluno: TUMZQuery;
    tblMatriculasAnoSemestre: TSmallintField;
    tblFichaIndividualDescricaoSituacao: TStringField;
    qryFichaUpdate: TUMZQuery;
    qryFichaDelete: TUMZQuery;
    qryAlterarFicha: TUMZQuery;
    qryReativarFicha: TUMZQuery;
    tblMatriculasTurmaDependencia: TStringField;
    tblMatriculasTurmaCalc: TStringField;
    qryAlterarDependencia: TUMZQuery;
    tblMatriculasCurso: TStringField;
    tblFichaIndividualCodigoGrade: TStringField;
    tsDoc: TTabSheet;
    tblDoc: TUMZQuery;
    dtcDoc: TDataSource;
    qAux: TUMZQuery;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Panel1: TPanel;
    grdDisci: TDBGrid;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    tblFichaIndividualTurmaMatricula: TStringField;
    popSituacaoMatricula: TPopupMenu;
    ReativarMatrculaCursando1: TMenuItem;
    CancelarMatrcula1: TMenuItem;
    TrancarMatrcula1: TMenuItem;
    RegistrarAbandono1: TMenuItem;
    MarcarcomoReserva1: TMenuItem;
    popTransferencia: TPopupMenu;
    TransferenciaExterna1: TMenuItem;
    popSituacaoDisciplina: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Panel6: TPanel;
    grdDoc: TDBGrid;
    Panel8: TPanel;
    Splitter2: TSplitter;
    ImageList1: TImageList;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    ToolButton12: TToolButton;
    tblMatriculasImpresso: TStringField;
    tblDocCurso: TStringField;
    tblDocCodigo: TSmallintField;
    tblDocDocumento: TStringField;
    tblDocSigla: TStringField;
    tblDocExiste: TBooleanField;
    tblFichaIndividualSegunda_Epoca: TFloatField;
    tblMatriculascd_ingresso: TIntegerField;
    tblMatriculasds_ingresso: TStringField;
    tblMatriculasdiploma: TStringField;
    toolDoc: TToolBar;
    ToolButton10: TToolButton;
    DBNavigator2: TDBNavigator;
    btnMarcar: TToolButton;
    btnDesmarcar: TToolButton;
    btnObsDoc: TToolButton;
    btnImpDoc: TToolButton;
    btnFecharDoc: TToolButton;
    toolDisciplinas: TToolBar;
    ToolButton1: TToolButton;
    btnTurmas: TToolButton;
    btnAlunos: TToolButton;
    btnAlterarSituacaoDisciplina: TToolButton;
    btnMatricularGrade: TToolButton;
    btnMatricularDisc: TToolButton;
    btnRemover: TToolButton;
    btnImprimir: TToolButton;
    SpeedButton6: TToolButton;
    toolAlunos1: TToolBar;
    ToolButton5: TToolButton;
    SpeedButton2: TToolButton;
    SpeedButton1: TToolButton;
    btnAlterarSituacaoMatriculas: TToolButton;
    btnTransferencias: TToolButton;
    btnMotivos: TToolButton;
    btnObs: TToolButton;
    btnFormaIngresso: TToolButton;
    SpeedButton3: TToolButton;
    ultimoseparador: TBevel;
    tblDocapresentou: TStringField;
    tblDocobservacao: TStringField;
    tblMatriculascd_instituicao_origem: TIntegerField;
    qryAtual: TUMZQuery;
    qryNova: TUMZQuery;
    qryGRade: TUMZQuery;
    xFicha: TUMZQuery;
    xUpd: TUMZQuery;
    xDel: TUMZQuery;
    xIns: TUMZQuery;
    rocadeTurma1: TMenuItem;
    RegistrarDesistncia1: TMenuItem;
    RegistrarDesistncia2: TMenuItem;
    tblDocsn_obrigatorio: TStringField;
    pmQtdMatriculas: TPopupMenu;
    pmQtdFichaIndividual: TPopupMenu;
    pmQtdDoc: TPopupMenu;
    btnDigitalizar: TToolButton;
    tblDocsn_digitalizado: TStringField;
    tblDocDigitalizou: TBooleanField;
    popDocumentacao: TPopupMenu;
    AlunoEntregouDocumento1: TMenuItem;
    Digitalizardocumento1: TMenuItem;
    Limparadigitalizao1: TMenuItem;
    tblDocnr_dpi: TSmallintField;
    tblDocnr_largura: TSmallintField;
    tblDocnr_altura: TSmallintField;
    qyDocDigital: TUMZQuery;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    btnIncluirDoc: TToolButton;
    btnExcluirDoc: TToolButton;
    ToolButton11: TToolButton;
    ToolButton6: TToolButton;
    tblMatriculasnr_aluno: TSmallintField;
    popNumerarAlunos: TPopupMenu;
    GerarNumeraodaTurmaXXXX200511: TMenuItem;
    GerarNumeraodoCursoXXXX200511: TMenuItem;
    btnRenumerar: TToolButton;
    sbSelecionarColuna: TSpeedButton;
    tblMatriculascd_matricula: TStringField;
    tblMatriculasfrequencia_global: TFloatField;
    tblMatriculascd_turno: TStringField;
    tblMatriculasdt_ingresso: TDateTimeField;
    tblMatriculasdt_conclusao: TDateTimeField;
    tblMatriculasdt_colacao: TDateTimeField;
    tblMatriculasdt_exp_diploma: TDateTimeField;
    tblMatriculasdt_saida: TDateTimeField;
    tblMatriculasds_obs: TStringField;
    tblMatriculasdsSituacao: TStringField;
    tblMatriculasdsSituacaoSigla: TStringField;
    popFormaIngresso: TPopupMenu;
    MatrculanoCurso1: TMenuItem;
    MatrculanaEtapa1: TMenuItem;
    tblMatriculasnr_media_curso: TFloatField;
    tblDocnr_grupo: TIntegerField;
    tbnBuscaDisciplina: TToolButton;
    tblFichaIndividualdisciplina: TIntegerField;
    ransfernciadeCurso1: TMenuItem;
    qryTurmasLotacaoVagas: TUMZQuery;
    qryTurmasLotacaoVagasnr_anosemestre: TSmallintField;
    qryTurmasLotacaoVagascd_turma: TStringField;
    qryTurmasLotacaoVagascd_disciplina: TIntegerField;
    qryTurmasLotacaoVagascd_curso: TStringField;
    qryTurmasLotacaoVagassn_bloquear_vagas: TSmallintField;
    qryTurmasLotacaoVagasnr_vagas: TSmallintField;
    qryTurmasLotacaoVagasds_disciplina: TStringField;
    tblMatriculascd_grade: TLargeintField;
    tblMatriculasnr_anosem_ingresso: TLargeintField;
    tblMatriculasnr_anosem_conclusao: TLargeintField;
    tblFichaIndividualnr_creditos_academicos: TLargeintField;
    qryTurmasLotacaoVagasnr_matriculados: TLargeintField;
    tblMatriculasNR_DIA_PGTO: TLargeintField;
    tblMatriculasCODIGOALUNO: TIntegerField;
    tblMatriculascd_matricula_curso: TLargeintField;
    qryQtdMatriculas: TUMZQuery;
    qryQtdMatriculasqtd_matriculas: TLargeintField;
    qryQtdAlunosSituacao: TUMZQuery;
    qryTotalAlunosAtivos: TUMZQuery;
    qryReservas: TUMZQuery;
    qryQtdAlunosSituacaods_situacao: TStringField;
    qryQtdAlunosSituacaoqtd_matriculas: TLargeintField;
    qryTotalAlunosAtivosqtd_matriculas: TLargeintField;
    qryReservasqtd_matriculas: TLargeintField;
    tblDocdt_entrega: TDateTimeField;
    tblFichaIndividualVL_VALOR: TFloatField;
    Panel10: TPanel;
    Label1: TLabel;
    lblHR_A: TLabel;
    lblCR_F: TLabel;
    lblCH: TLabel;
    lblDisciplinas: TLabel;
    tblResumoFicha: TUMZQuery;
    dtcResumoFicha: TDataSource;
    tblResumoFichaQTD_DISCIPLINAS: TLargeintField;
    tblResumoFichaSOMA_CR_FINAN: TFloatField;
    tblResumoFichaSOMA_CR_ACAD: TLargeintField;
    tblResumoFichaSOMA_CH: TFloatField;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    btnOutrasAcoes: TToolButton;
    popOutrasAcoes: TPopupMenu;
    CadastrodeTurmas1: TMenuItem;
    Cronograma1: TMenuItem;
    PlanilhadeRecebimentos1: TMenuItem;
    CadastrodeAlunos1: TMenuItem;
    qryTurmas: TUMZQuery;
    qryTurmascodigo: TStringField;
    qryTurmasanosemestre: TSmallintField;
    tblFichaIndividualnr_aulas: TFloatField;
    qryPendenciasBib: TUMZQuery;
    qryPendenciasFinanceirasBib: TUMZQuery;
    btnFiltroData: TToolButton;
    qrySituacaoMatricula: TUMZReadOnlyQuery;
    qrySituacaoMatriculaCD_SITUACAO: TIntegerField;
    qrySituacaoMatriculaDS_SITUACAO: TStringField;
    qrySituacaoMatriculaDS_SIGLA_SITUACAO: TStringField;
    qrySituacaoMatriculaCD_SITUACAO_PAI: TIntegerField;
    qrySituacaoMatriculaNR_ORDEM_FINAL: TIntegerField;
    tblMatriculasQualSituacao: TStringField;
    tblMatriculasSituacaoMatricula: TStringField;
    tblMatriculasCD_SITUACAO_PAI: TIntegerField;
    tblMatriculasnr_matricula: TStringField;
    tblFichaIndividualsn_possui_compl: TIntegerField;
    tblFichaIndividualsn_possui_compl_calc: TStringField;
    tblFichaIndividualsn_possui_adap: TSmallintField;
    tblFichaIndividualsn_possui_depen: TSmallintField;
    tblFichaIndividualsn_possui_adap_calc: TStringField;
    tblFichaIndividualsn_possui_depen_calc: TStringField;
    btnObservacao: TToolButton;
    qryExtras: TUMZQuery;
    dtcExtras: TDataSource;
    qryExtrasserie: TIntegerField;
    qryExtrasdisciplina: TLargeintField;
    qryExtrascodigoaluno: TLargeintField;
    qryExtrasanosemestre: TIntegerField;
    qryExtrasturma: TStringField;
    qryExtrasds_observacao: TStringField;
    tblFichaIndividualFalta1: TFloatField;
    tblFichaIndividualFalta2: TFloatField;
    tblFichaIndividualFalta3: TFloatField;
    tblFichaIndividualFalta4: TFloatField;
    tblFichaIndividualdt_saida: TDateTimeField;
    tblMatriculascd_curso: TStringField;
    Line: TMenuItem;
    creditoFinan: TMenuItem;
    QryAlterarCrFinanPDisc: TUMZQuery;
    QryLogGeral: TUMZQuery;
    tblFichaIndividualNR_CR_FIN: TFloatField;
    tblFichaIndividualnr_aulas_mask: TFloatField;
    sbSelecionarColunaDisc: TSpeedButton;
    qyGruposAtividadesAluno: TUMZQuery;
    qyInativarAluno: TUMZQuery;
    qyPossuiGruposAtividades: TUMZQuery;
    tblMatriculasnm_pessoa_matriculou: TStringField;
    tblMatriculascd_turma_anterior: TStringField;
    tblMatriculasSituacao: TSmallintField;
    tblMatriculasCD_SITUACAO_ALTERADO: TStringField;
    tblDoccd_siga: TIntegerField;
    tblFichaIndividualnm_disciplina_generica: TStringField;
    qyInserirDiscGenerica: TUMZQuery;
    discGenerica: TMenuItem;
    tblFichaIndividualcd_disciplina_generica: TIntegerField;
    qyTrocarDiscGenerica: TUMZQuery;
    tblFichaIndividualnr_serie_generica: TSmallintField;
    popMatricularDisciplina: TPopupMenu;
    menuAdicionarDisciplinaVariosAlunos: TMenuItem;
    menuAdicionarDisciplinaAluno: TMenuItem;
    popRemoverDisciplina: TPopupMenu;
    menuRemoverDisciplinaVariosAlunos: TMenuItem;
    menuRemoverDisciplinaAluno: TMenuItem;
    pgDocumentos: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel7: TPanel;
    Bevel3: TBevel;
    DBGrid4: TDBGrid;
    Panel9: TPanel;
    Panel11: TPanel;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    Panel12: TPanel;
    MatrculanoCursoTurma1: TMenuItem;
    qryVerificaGrupos: TUMZQuery;
    qryInativaGrupo: TUMZQuery;
    tblFichaIndividualcd_grupo: TStringField;
    tblFichaIndividualnm_grupo: TStringField;
    tblFichaIndividualsn_final: TIntegerField;
    procedure dtcFichaIndividualDataChange(Sender: TObject; Field: TField);
    procedure MatrculanoCursoTurma1Click(Sender: TObject);
    procedure pgDocumentosChange(Sender: TObject);
    procedure menuRemoverDisciplinaVariosAlunosClick(Sender: TObject);
    procedure menuAdicionarDisciplinaVariosAlunosClick(Sender: TObject);
    procedure menuRemoverDisciplinaAlunoClick(Sender: TObject);
    procedure menuAdicionarDisciplinaAlunoClick(Sender: TObject);
    procedure matricularDisciplina();
    procedure trocarDisciplinaGenerica(Sender: TObject);
    procedure sbSelecionarColunaDiscClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdDisciColExit(Sender: TObject);
    procedure btnObservacaoClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFiltroDataClick(Sender: TObject);
    procedure VerificaBib();
    procedure popOutrasAcoesPopup(Sender: TObject);
    procedure CadastrodeAlunos1Click(Sender: TObject);
    procedure PlanilhadeRecebimentos1Click(Sender: TObject);
    procedure Cronograma1Click(Sender: TObject);
    procedure CadastrodeTurmas1Click(Sender: TObject);
    procedure grdDblClick(Sender: TObject);
    procedure ranferenciadeCurso1Click(Sender: TObject);
    procedure btnFormaIngressoClick(Sender: TObject);
    procedure MatrculanoCurso1Click(Sender: TObject);
    procedure MatrculanaEtapa1Click(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure grdDocTitleClick(Column: TColumn);
    procedure grdDisciTitleClick(Column: TColumn);
    procedure ToolButton6Click(Sender: TObject);
    procedure GerarNumeraodoCursoXXXX200511Click(Sender: TObject);
    procedure GerarNumeraodaTurmaXXXX200511Click(Sender: TObject);
    procedure btnRenumerarClick(Sender: TObject);
    procedure popNumerarAlunosPopup(Sender: TObject);
    procedure btnIncluirDocClick(Sender: TObject);
    procedure btnExcluirDocClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure grdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrocaDeTurma;
    procedure FormCreate(Sender: TObject);
    procedure AtivarMatricula;
    procedure btnMotivosClick(Sender: TObject);
    procedure btnReprovarClick(Sender: TObject);
    procedure btnDiplomaClick(Sender: TObject);
    procedure tblMatriculasCalcFields(DataSet: TDataSet);
    procedure btnObsClick(Sender: TObject);
    procedure dtcMatriculasDataChange(Sender: TObject; Field: TField);
    procedure tblFichaIndividualCalcFields(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnMatricularGradeClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnImpDocClick(Sender: TObject);
    procedure btnObsDocClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure tblDocCalcFields(DataSet: TDataSet);
    procedure btnAlunosClick(Sender: TObject);
    procedure btnTurmasClick(Sender: TObject);
    procedure btnAlterarSituacaoMatriculasClick(Sender: TObject);
    procedure ReativarMatrculaCursando1Click(Sender: TObject);
    procedure CancelarMatrcula1Click(Sender: TObject);
    procedure btnTransferenciasClick(Sender: TObject);
    procedure btnAlterarSituacaoDisciplinaClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btnFecharDocClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure rocadeTurma1Click(Sender: TObject);
    procedure pmQtdMatriculasPopup(Sender: TObject);
    procedure pmQtdFichaIndividualPopup(Sender: TObject);
    procedure pmQtdDocPopup(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure popDocumentacaoPopup(Sender: TObject);
    procedure AlunoEntregouDocumento1Click(Sender: TObject);
    procedure Digitalizardocumento1Click(Sender: TObject);
    procedure Limparadigitalizao1Click(Sender: TObject);
    procedure Digitalizaroversododocumento1Click(Sender: TObject);
    procedure buscaDisciplina(Sender: TObject);
    procedure alteraCreditosFinanceiroPorAluno(Sender: TObject);
    procedure realizaExpressaoRegular(Sender: TObject);
  strict private
      resultado_filtro_turma: TResultadoFiltroTurma;
      FResultadoFiltroDisciplina: TResultadoFiltroDisciplina;
  private
    { Private declarations }
      FBloqueiaCreditosAlunosFIES: Boolean;
    intSalvar : Integer;
    sOrdem : String;
    sGuardaFiltro: string;
    sFiltroCurso, sFiltroTurma : String;
    numerarCurso,bAdicionouCampo : boolean;
    procedure matricularVariasDisciplinas;
    procedure removerVariasDisciplinas;
    procedure removerDisciplina;
    function DoAddFields(All: Boolean): TField;
    function DoCreateField(const FieldName: WideString; Origin: string): TField;
    procedure ConfirmarMatricula;
    procedure ConfirmarMatriculaAulas(strTurma : String; intAnoSemestre : Integer; lngCodigoAluno: Longint  );
    procedure ConfirmarDisciplina;
    procedure RenumerarAlunos(iTipo : word; anosemestre : Integer; curso, turma : String);
    Function TemMensalidadeComCredito( codigoaluno : Integer; turma : String; anosemestre : Integer ) : Boolean;
    function RegistraMotivo(const AICodSituacao: integer): boolean;
    Procedure registraDocumentoTabelaSiga( codDoc : String; aluno : String );
    function podeAtivarDisciplina(): Boolean;
    procedure inativaGrupo(cd_pessoa,cd_grupo: Integer; dt_saida: TDateTime; mensagemLog : String; mostraMensagemInicial : Boolean = true);
    function getSerie(curso: String; anosemestre: Integer; turma: String): Integer;
    procedure verificaTitulosPendentes();
  public

    TipoFiltro : TFiltroPadro;
    lngCodigoAluno : Longint;
    filtro_disciplina_exportar : string;
    filtro_dt_inicio, filtro_dt_fim: String ;
    sn_filtra_data, sn_filtra_aluno,
    sn_filtra_turma, sn_filtra_disciplina : Boolean;
    sFiltroAnosemestre: String;
    sFiltroDisciplina : Integer;
    procedure setApresentou(sT: string);
    function verificaAlunosComEstagio(cd_pessoa: integer; cd_coligada: integer): Boolean;
    procedure gravaLogInterrompeEstagio(cd_estagio, cd_aluno, cd_empresa, cd_coligada : integer; dt_inicial, dt_final : string);
    procedure interrompeEstagio(cd_estagio: integer);
    procedure salvaEstagioInterrompido(cd_estagio, cd_pessoa, cd_empresa, cd_coligada: integer);
    procedure Filtrar;
    { Public declarations }
  end;

var
  frmMatriculas: TfrmMatriculas;

implementation

uses
   uDM, Main, uDataSaida, uMotivos, uFinanceiro, uDig,
   uMatriculaDisc, uMatriculaDiscMassa, uRemoveDiscMassa, uSelDisciplinaGenerica, uMatricularGrade, uManutMens, uObsDocumento, uAluno,
   uFSelecionarPessoa, uMatriculas_Alterar, uExportarDoc, uAddDocumento,
   uClassMovimento, uCamposPlanilhas, uMatricularCurso, uDigDocumentos,
   uProcessando, uBuscaDisciplina, uFTransferencia, uFRegistraMotivoMatricula,
   uFMatriculaMotivos, uHorariosPessoa, UFObservacoes, uContAulasProvas,
  uTransferir, uNovaMens, uMensalidades, uAlunoAfrica, uCursos,
  ClassDisciplinas, ClassPlanosPagamento, UFMatriculasFiltroData, uUsuario,
  uIUMDataModule, uFTrocaDeTurma, uFMatriculaCursoTurma;

{$R *.DFM}

procedure TfrmMatriculas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMatriculas.Filtrar;
const
   SParametrosTabelasEspeciais = 'Academico.planilha_matriculas_tabelas_especiais';
   SParametrosCamposEspeciais = 'Academico.planilha_matriculas_campos_especiais';
   SSQLMatriculas =
      'SELECT ' +
         'MATRICULAS.*,' +
         'MATRICULAS_CURSO.*,' +
         'CASE ' +
            'WHEN MATRICULAS.SN_MATRICULA_INTERNET = 0 THEN PES_MATRICULOU.NM_PESSOA ' +
            'ELSE ''INTERNET'' ' +
         'END NM_PESSOA_MATRICULOU,' +
         'PESSOAS.NM_PESSOA NOME,' +
         'MATRICULAS_INGRESSO.DS_INGRESSO,' +
         'SITUACOES.DS_VALOR DSSITUACAO,' +
         'SITUACOES.DS_SIGLA DSSITUACAOSIGLA,' +
         'CASE ' +
            'WHEN MATRICULAS.SITUACAO = 8 THEN ' +
               'CASE ' +
                  'WHEN ' +
                     '(MATRICULAS.CURSO IN (SELECT CURSO FROM MATRICULAS M2 WHERE M2.CD_TURMA_ANTERIOR = MATRICULAS.TURMA AND M2.ANOSEMESTRE = MATRICULAS.ANOSEMESTRE AND M2.CODIGOALUNO = MATRICULAS.CODIGOALUNO)) OR ' +
                     '((SELECT GROUP_CONCAT(CURSO) FROM MATRICULAS M2 WHERE M2.CD_TURMA_ANTERIOR = MATRICULAS.TURMA AND M2.ANOSEMESTRE = MATRICULAS.ANOSEMESTRE AND M2.CODIGOALUNO = MATRICULAS.CODIGOALUNO LIMIT 1) IS NULL) ' +
                  'THEN ' +
                     'MATRICULAS.SITUACAO ' +
                  'ELSE ' +
                     '''-8'' ' +
               'END ' +
            'ELSE ' +
                  'MATRICULAS.SITUACAO ' +
         'END CD_SITUACAO_ALTERADO %s ' +
      'FROM ' +
         'MATRICULAS ' +
            'JOIN PESSOAS ON (MATRICULAS.CODIGOALUNO = PESSOAS.CD_PESSOA) ' +
            'JOIN TURMAS ON (MATRICULAS.TURMA = TURMAS.CODIGO) AND (MATRICULAS.ANOSEMESTRE = TURMAS.ANOSEMESTRE) ' +
            'LEFT JOIN PESSOAS PES_MATRICULOU ON (MATRICULAS.CD_PESSOA_MATRICULOU = PES_MATRICULOU.CD_PESSOA) ' +
            'LEFT JOIN MATRICULAS_INGRESSO ON (MATRICULAS.CD_INGRESSO = MATRICULAS_INGRESSO.CD_INGRESSO) ' +
            'LEFT JOIN MATRICULAS_CURSO ON (MATRICULAS.CD_MATRICULA_CURSO = MATRICULAS_CURSO.CD_MATRICULA_CURSO) ' +
               'LEFT JOIN SITUACOES ON (MATRICULAS_CURSO.CD_SITUACAO = SITUACOES.CD_SITUACAO) AND (SITUACOES.CD_MODULO = 1019) %s ' +
      'WHERE ' +
         'TURMAS.CD_COLIGADA IN (%s) AND %s %s';
   SFiltroAluno = 'MATRICULAS.CODIGOALUNO = :CODIGOALUNO ';
   SFiltroTurma = 'MATRICULAS.TURMA = :TURMA AND MATRICULAS.ANOSEMESTRE = :ANOSEMESTRE';
   SFiltroEmissaoHoje = 'DATE(MATRICULAS.DATAEMISSAO) = CURRENT_DATE';
   SFiltroEmissao = 'MATRICULAS.DATAEMISSAO BETWEEN :INICIO AND :FIM';
   SFiltroDisciplina =
      'EXISTS (' +
         'SELECT FI.ID_FICHAINDIVIDUAL ' +
         'FROM FICHAINDIVIDUAL FI ' +
         'WHERE '+
            'MATRICULAS.TURMA = FI.TURMA AND ' +
            'MATRICULAS.CODIGOALUNO = FI.CODIGOALUNO AND ' +
            'MATRICULAS.ANOSEMESTRE = FI.ANOSEMESTRE AND ' +
            'FI.ANOSEMESTRE = :ANOSEMESTRE AND ' +
            'FI.DISCIPLINA = :DISCIPLINA AND ' +
            'FI.CURSO = :CURSO)';
   SAgrupaAluno = 'GROUP BY MATRICULAS.CODIGOALUNO';
var
   I: Integer;
   LTabelasEspecias, LCamposEspeciais, LCampos, LProtocol: AnsiString;
   LFields, LFieldDef: TStrings;
   LFieldNames: TStringList;
   LParams: TParams;
begin
   sn_filtra_data := False;
   sn_filtra_aluno := False;
   sn_filtra_turma := False;
   sn_filtra_disciplina := False;

   LTabelasEspecias := DM.variavel_nu_parametro(SParametrosTabelasEspeciais, 0);
   LCamposEspeciais := DM.variavel_nu_parametro(SParametrosCamposEspeciais, 0);

   LFields := TStringList.Create;
   try
      LFields.Delimiter := ';';
      LFields.StrictDelimiter := True;
      LFields.NameValueSeparator := '=';
      LFields.DelimitedText := LCamposEspeciais;

      LCampos := EmptyStr;

      for I := 0 to LFields.Count - 1 do
      begin
         LCampos := Format('%s,%s', [LCampos, LFields.Names[I]]);
      end;

      tblMatriculas.Close;
      LProtocol := tblMatriculas.Connection.Protocol;

      LParams := TParams.Create;
      try
   
         case TipoFiltro of

            FiltroAluno:
            begin
               tblMatriculas.SQLList.Values[LProtocol] := Format(SSQLMatriculas,
                  [LCampos, LTabelasEspecias, DM.GetColigadas, SFiltroAluno,
                  '']);
               LParams.CreateParam(ftUnknown, 'CODIGOALUNO', ptUnknown).Value :=
                  lngCodigoAluno;

               sn_filtra_aluno := True;
            end;

            FiltroTurma:
            begin
               tblMatriculas.SQLList.Values[LProtocol] := Format(SSQLMatriculas,
                  [LCampos, LTabelasEspecias, DM.GetColigadas, SFiltroTurma,
                   SAgrupaAluno]);
               LParams.CreateParam(ftUnknown, 'TURMA', ptUnknown).Value :=
                  resultado_filtro_turma.cd_turma;
               LParams.CreateParam(ftUnknown, 'ANOSEMESTRE', ptUnknown).Value :=
                  resultado_filtro_turma.nr_anosemestre;

               sn_filtra_turma := True;
            end;
         
            FiltroMatriculas:
            begin
               tblMatriculas.SQLList.Values[LProtocol] := Format(SSQLMatriculas,
                  [LCampos, LTabelasEspecias, DM.GetColigadas,
                  SFiltroEmissaoHoje, '']);
               sn_filtra_aluno := True;
            end;
         
            FiltroData:
            begin
               tblMatriculas.SQLList.Values[LProtocol] := Format(SSQLMatriculas,
                  [LCampos, LTabelasEspecias, DM.GetColigadas, SFiltroEmissao,
                  '']);
               LParams.CreateParam(ftUnknown, 'INICIO', ptUnknown).AsDate :=
                  fMatriculasFiltroData.umdtInicio.Date;
               LParams.CreateParam(ftUnknown, 'FIM', ptUnknown).AsDate :=
                  fMatriculasFiltroData.umdtFim.Date;

               sn_filtra_data := True;
            end;

            FiltroDisciplina:
            begin
               tblMatriculas.SQLList.Values[LProtocol] := Format(SSQLMatriculas,
                  [LCampos, LTabelasEspecias, DM.GetColigadas,
                  SFiltroDisciplina, SAgrupaAluno]);
               LParams.CreateParam(ftUnknown, 'ANOSEMESTRE', ptUnknown).Value :=
                  FResultadoFiltroDisciplina.nr_anosemestre;
               LParams.CreateParam(ftUnknown, 'DISCIPLINA', ptUnknown).Value :=
                  FResultadoFiltroDisciplina.cd_disciplina;
               LParams.CreateParam(ftUnknown, 'CURSO', ptUnknown).Value :=
                  FResultadoFiltroDisciplina.cd_curso;

               sn_filtra_disciplina := True;
            end;

         end;

         tblMatriculas.SQL.Text := tblMatriculas.SQLList.Values[LProtocol];

         for I := 0 to LParams.Count - 1 do
            tblMatriculas.ParamByName(LParams.Items[I].Name).Value :=
               LParams.Items[I].Value;

         if not bAdicionouCampo then
         begin
            LFieldDef := TStringList.Create;
            LFieldNames := TStringList.Create;
            try

               LFieldDef.Delimiter := '.';
               LFieldDef.StrictDelimiter := True;
               
               for I := 0 to LFields.Count - 1 do
               begin
                  LFieldDef.DelimitedText := LFields.Names[I];
                  LFieldNames.Add(LFieldDef.Strings[1]);
               end;

               General.DoAddFields(True, tblMatriculas, LFieldNames);

               for I := 0 to LFields.Count - 1 do
               begin
                  LFieldDef.DelimitedText := LFields.Names[I];
                  tblMatriculas.FieldByName(LFieldDef.Strings[1]).DisplayLabel :=
                     LFields.ValueFromIndex[I];
                  tblMatriculas.FieldByName(LFieldDef.Strings[1]).Tag := 1;
               end;

            finally
               FreeAndNil(LFieldNames);
               FreeAndNil(LFieldDef);
            end;

            bAdicionouCampo := True;
         end;

         DoAddFields(True);

         tblMatriculas.Open;

      finally
         FreeAndNil(LParams);
      end;
      
   finally
      FreeAndNil(LFields);
   end;

   if sn_filtra_data then
   begin
      filtro_dt_fim := DateToStr(fMatriculasFiltroData.umdtFim.Date);
      filtro_dt_inicio := DateToStr(fMatriculasFiltroData.umdtInicio.Date);
   end
   else
   begin
      filtro_dt_fim := '';
      filtro_dt_inicio := '';
   end;
   
end;

procedure TfrmMatriculas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblMatriculas.Close;
  Action := caFree;
end;

procedure TfrmMatriculas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if btnIncluirDoc.Enabled then btnIncluirDocClick( nil );            
    VK_F3 : btnMarcarClick( nil );
    VK_F4 : btnDesmarcarClick( nil );
    VK_F5 : if PageControl1.ActivePageIndex = 2 Then
            begin   
               btnObsDocClick( nil );
            end
            Else if PageControl1.ActivePageIndex = 0 then
            begin
               btnObsClick( nil );
            end
            else
            begin
               btnObservacaoClick( nil );
            end;
    VK_F7 : if PageControl1.ActivePageIndex = 2 Then
               btnImpDocClick( nil )
            else if PageControl1.ActivePageIndex = 0 then
               Self.buscaDisciplina(nil)
            Else
               btnImprimirClick( nil );
    VK_F8 : btnAlunosClick( nil );
    VK_F9 : btnTurmasClick( nil );
    VK_F12 : btnSairClick( nil );
    VK_F6 : if PageControl1.ActivePageIndex = 2 Then
               btnDigitalizarClick( nil );
      VK_F10:
         begin
            btnFiltroData.Click;
         end;
  end;
end;

procedure TfrmMatriculas.FormShow(Sender: TObject);

begin
   sFiltroCurso := '';
   sFiltroTurma := '';
   sFiltroAnosemestre := '';

   // Type cast para permitir acessar a propriedade Columns
   // Será modificado futuramente após substituir todos os componentes TDBGrid
   DM.BloquearComponenteAnosemestre(TDBGrid(TCustomDBGrid(grd)), 'AnoSemestre');
   DM.BloquearComponenteAnosemestre(grdDisci, 'AnoSemestre');
   DM.BloquearComponenteAnosemestre(grdDoc, 'AnoSemestre');

  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Screen.Cursor := crHourGlass;

  TipoFiltro := FiltroMatriculas;

  Filtrar();

  // Faz com que a aba de alunos seja aberta como padrão
  PageControl1.ActivePageIndex := 0;
  tblDoc.Open;
  Screen.Cursor := crDefault;
  PageControl1Change(nil);
  numerarCurso := False;

   if DM.lite then
   begin
      Cronograma1.Visible := false;
   end;
  
end;

procedure TfrmMatriculas.grdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   chaves : string;
   sMsg : String;
   i: Integer;
   iCodPessoa, iColigada: Integer;
begin

   { Botões programados no evento:
      Ctrl + Shift + Delete,
      Ctrl + Shift + Alt + A }

   if ( Key = VK_DELETE ) AND ( Shift = [ssCtrl] ) then
   begin
      Abort();
   end;


  if ( Key = VK_DELETE ) and ( Shift = [ssCtrl, ssShift] ) then
  Begin

      if not DM.UsuarioLogado.TemPermissao( 1009, npExcluir, True ) then Exit;

      if not DM.UsuarioLogado.TemPermissao( 1019, npExcluir, True ) then Exit; 

      Key := 0;

      sMsg := 'Você está tentando excluir a matrícula do estudante: ' + CHR(13);
      sMsg := sMsg + tblMatriculasNome.AsString + CHR(13);
      sMsg := sMsg + 'Turma: ' + tblMatriculasTurma.AsString + ' (' + tblMatriculasAnoSemestre.AsString + ') ' + CHR(13) + CHR(13);
      sMsg := sMsg + 'Deseja continuar?';


      if Mensagem(sMsg, 'Atenção', MB_YESNO + MB_ICONQUESTION + + MB_DEFBUTTON2)
      <> mrYes Then Exit;

      Dm.qAux1.Close;
      Dm.qAux1.SQL.Text := 'SELECT COUNT(*) QTD FROM fichaindividual';
      Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      Dm.qAux1.Open();

      if (Dm.qAux1.FieldByName('QTD').Value > 0 ) Then begin

         sMsg := 'A exclusão dessa matrícula irá eliminar todas as disciplinas vinculadas.' + CHR(13);
         sMsg := sMsg + 'Todas as informações de notas e freqüência serão perdidas.'+ CHR(13) + CHR(13);

         sMsg := sMsg + 'Deseja continuar?';

         if Mensagem(sMsg, 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYes
         Then
            Exit;
      end;

      Dm.qAux1.Close;
      Dm.qAux1.SQL.Text := 'SELECT COUNT(*) QTD FROM mensalidades';
      Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre ');
      Dm.qAux1.SQL.Add(' AND (situacao = 0 OR situacao = 1) ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      Dm.qAux1.Open();

      if (Dm.qAux1.FieldByName('QTD').Value > 0 ) Then
      Begin
         sMsg := 'O estudante já efetuou pagamentos referente a esta matrícula.' + CHR(13);
         sMsg := sMsg + 'É aconselhável fazer somente um cancelamento de matrícula. ' + CHR(13) + CHR(13);
         sMsg := sMsg + 'Se você continuar, todos os débitos posteriores a esta data serão excluídos. '+ CHR(13) + CHR(13);

         sMsg := sMsg + 'Tem certeza que deseja continuar?';

         if Mensagem(sMsg, 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES
         then
          	 Exit;
      End;
      if dm.variavel_parametro('acad_saida_verifica_biblioteca') = '1'  then
      begin
         VerificaBib;
      end;
      { As perguntas ja foram feitas acima, se chegou até aqui, podemos remover }

      { Elimiar as mensalidades não quitadas }

      // Guardar logs das mensalidades excluidas
      Dm.qAux1.Close();
      Dm.qAux1.SQL.Text := 'SELECT cd_mensalidade, codigoaluno, parcela, anosemestre, turma, datavencimento, nossonumero FROM mensalidades';
      Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre ');
      Dm.qAux1.SQL.Add(' AND situacao in ( 2, 10 ) AND datavencimento >= :DataAtual AND tipoparcela <> 4  ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      Dm.qAux1.ParamByName('DataAtual').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);

      Dm.qAux1.Open();

      while not DM.qAux1.EOF do begin

         chaves := FillString(DM.qAux1.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                   DM.qAux1.FieldByName('anosemestre').AsString + ';' + DM.qAux1.FieldByName('turma').AsString + ';' +
                   DM.qAux1.FieldByName('parcela').AsString + ';' +
                   FormatDateTime('dd/mm/yyyy',DM.qAux1.FieldByName('datavencimento').AsDateTime) + ';';

         DM.FazAcaoRemessa(arCancelar, DM.qAux1.FieldByName('cd_mensalidade').AsInteger);

         DM.setLog(2013, 'Exclusao', chaves, DM.getColigadaByTurma(DM.qAux1.FieldByName('turma').AsString, Dm.qAux1.ParamByName('anosemestre').AsInteger), 'Parcela Excluída pela matrícula (NN = ' + DM.qAux1.FieldByName('nossonumero').AsString +  ')');
         DM.qAux1.Next();

      end;
      // fim - Log das mensalidades excluídas

      // Logs das médias
      Dm.qAux1.Close;
      Dm.qAux1.SQL.Text := 'SELECT codigoaluno, codigograde, anosemestre, turma, disciplina, situacao, mediafinal, frequencia, serie FROM fichaindividual';
      Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      Dm.qAux1.Open();

      while not Dm.qAux1.Eof do begin
      
         chaves := FillString(DM.qAux1.FieldByName('codigoaluno').AsString, alRight, '0', 10, true ) + ';' +
                   DM.qAux1.FieldByName('anosemestre').AsString + ';' + DM.qAux1.FieldByName('turma').AsString + ';' +
                   DM.qAux1.FieldByName('disciplina').AsString + ';';

         DM.setLog(1014, 'Exclusao', chaves, Dm.getColigadaByTurma(dm.qAux1.FieldByName('turma').AsString, DM.qAux1.FieldByName('anosemestre').AsInteger), 'Codigo Grade: ' + DM.qAux1.FieldByName('codigograde').AsString +
                                                                      ' Série: ' + DM.qAux1.FieldByName('serie').AsString +
                                                                      ' Sit: ' + DM.qAux1.FieldByName('situacao').AsString +
                                                                      ' MF: ' + DM.qAux1.FieldByName('mediafinal').AsString +
                                                                      ' F%: ' + DM.qAux1.FieldByName('frequencia').AsString
                  );
                  
         DM.qAux1.Next();

      end;


      Dm.qAux1.Close();
      DM.qAux1.SQL.Clear();
      DM.qAux1.SQL.Add( 'DELETE fmc, m' );
      DM.qAux1.SQL.Add( 'FROM mensalidades m' );
      DM.qAux1.SQL.Add( '     LEFT JOIN fin_mov_cr fmc ON ( fmc.cd_mensalidade = m.cd_mensalidade )' );
      DM.qAux1.SQL.Add( 'WHERE m.codigoaluno = :codigoaluno AND m.turma = :turma AND' );
      DM.qAux1.SQL.Add( '      m.anosemestre = :anosemestre AND m.sn_nfe_gerada <> 1 AND' );
      DM.qAux1.SQL.Add( '      m.situacao in ( 2, 10 ) AND m.datavencimento >= :DataAtual AND' );
      DM.qAux1.SQL.Add( '      m.tipoparcela = 0' );

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      Dm.qAux1.ParamByName('DataAtual').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);

      Dm.qAux1.ExecSQL;

      { Eliminar as fichaindividual_optativas }

      Dm.qAux1.Close;
      DM.qAux1.SQL.Clear();
      Dm.qAux1.SQL.Add(' DELETE fio.* FROM fichaindividual fi ');
      Dm.qAux1.SQL.Add(' INNER JOIN fichaindividual_optativas fio ON ( ');
      Dm.qAux1.SQL.Add('    fio.anosemestre = fi.anosemestre AND ');
      Dm.qAux1.SQL.Add('    fio.turma = fi.turma AND ');
      Dm.qAux1.SQL.Add('    fio.codigoaluno = fi.codigoaluno AND ');
      Dm.qAux1.SQL.Add('    fio.disciplina = fi.disciplina AND ');
      Dm.qAux1.SQL.Add('    fio.serie = fi.serie ');
      Dm.qAux1.SQL.Add(' ) ');
      Dm.qAux1.SQL.Add(' WHERE fi.codigoaluno = :codigoaluno AND fi.turmamatricula = :turma AND fi.anosemestre = :anosemestre ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      Dm.qAux1.ExecSQL;

      { Eliminar a fichaindividual }

      Dm.qAux1.Close;
      DM.qAux1.SQL.Clear();
      Dm.qAux1.SQL.Text := ' DELETE FROM fichaindividual ';
      Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turmamatricula = :turma AND anosemestre = :anosemestre ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      Dm.qAux1.ExecSQL;

      // Deletar informações de matriculas no vestibualr
      Dm.qAux1.Close;
      Dm.qAux1.SQL.Text :=
        ' DELETE FROM vestibular ' +
        ' WHERE anosemestre = :anosemestre AND codigoaluno = :codigoaluno and curso = :curso ';

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('curso').AsString := tblMatriculasCurso.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      Dm.qAux1.ExecSQL();
      // Vestibular

      Dm.qAux1.Close;
      Dm.qAux1.SQL.Text := ' DELETE FROM matriculas ';
      Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre ');

      Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      Dm.qAux1.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
      Dm.qAux1.ParamByName('anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

      Dm.qAux1.ExecSQL;

      chaves := FillString(tblMatriculasCodigoAluno.AsString, alRight, '0', 10, true ) + ';' +
                tblMatriculasAnoSemestre.AsString + ';' +
                tblMatriculasTurma.AsString + ';';

      DM.setLog(1009, 'Exclusao', chaves, Dm.getColigadaByTurma(tblMatriculasTurma.AsString,tblMatriculasAnoSemestre.AsInteger), 'Situação: '+tblMatriculasSituacao.AsString+', Data de Entrada: '+FormatDateTime('dd/mm/yyyy',tblMatriculasDataEmissao.AsDateTime)+', Data de Saída: '+FormatDateTime('dd/mm/yyyy',tblMatriculasDataSaida.AsDateTime) );

      Mensagem('Exclusão da matrícula efetuada com sucesso.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

      iCodPessoa := tblMatriculasCODIGOALUNO.AsInteger;
      iColigada  :=  DM.getColigadaByTurma(
                        tblMatriculasTurma.AsString,
                        tblMatriculasAnoSemestre.AsInteger
                     );
      
      DM.atualizarGruposPessoa(iCodPessoa, iColigada, true);

      tblMatriculas.Close;
      tblMatriculas.Open;

      Key := 0;
  End;

  if ( Key = ord('A') ) and ( Shift = [ssCtrl, ssShift, ssAlt] ) AND (not tblMatriculas.IsEmpty) then  Begin


    if Mensagem('Tem certeza que deseja tentar ativar todas as matrículas de ' + tblMatriculasAnoSemestre.AsString + '? ', 'Atenção', MB_YESNOCANCEL + MB_ICONWARNING) <> mrYes then exit;

    DM.qAux1.Close();
    DM.qAux1.SQL.Text := ' SELECT codigoaluno, turma, anosemestre FROM matriculas ' +
                         ' WHERE anosemestre = ' + tblMatriculasAnoSemestre.AsString +
                         ' ORDER BY turma, codigoaluno ';
    DM.qAux1.Open();

    i := 1;

    frmProcessando.Bar.Max := DM.qAux1.RecordCount;
    frmProcessando.Show;

    while not DM.qAux1.Eof do begin

       frmProcessando.lblRegistros.Caption := 'Registros: ' + IntToStr(i) + ' de ' + IntToStr( frmProcessando.Bar.Max );
       frmProcessando.Bar.Position := i;
       Application.ProcessMessages;
       INC(i);

       DM.Ativar_Matricula(Dm.qAux1.FieldByName('codigoaluno').AsInteger, Dm.qAux1.FieldByName('turma').AsString, Dm.qAux1.FieldByName('anosemestre').AsInteger, false, true);
       DM.qAux1.Next();
    
    end;

    frmProcessando.Close;

    Mensagem('Ativações de matrículas finalizas.','Atenção', MB_OK + MB_ICONEXCLAMATION);

  end;

end;

procedure TfrmMatriculas.FormCreate(Sender: TObject);
begin
   FBloqueiaCreditosAlunosFIES :=
      DM.variavel_parametro('BLOQUEAR.AJUSTE.CREDITO.FIES') = 'S';
      
   qrySituacaoMatricula.Open;
   // Type cast para permitir acessar a propriedade Columns
   // Será modificado futuramente após substituir todos os componentes TDBGrid
  DM.MontarPlanilha(TDBGrid(TCustomDBGrid(grd)), 'planilha_matriculas_campos');
  DM.MontarPlanilha(DBGrid2, 'planilha_matriculas_disciplinas_campos');
  
  sOrdem := ' nome, matriculas.anosemestre ';

  Screen.Cursor := crHourGlass;
  Application.CreateForm( TfrmMatriculaDisc, frmMatriculaDisc );
  Application.CreateForm( TfrmMatriculaDiscMassa, frmMatriculaDiscMassa );
  Application.CreateForm( TfrmRemoveDiscMassa, frmRemoveDiscMassa );
  Application.CreateForm( TfrmSelDisciplinaGenerica, frmSelDisciplinaGenerica );
  Application.CreateForm( TformTransferenciaDeTurma, formTransferenciaDeTurma );
  Application.CreateForm( TformMatriculaCursoTurma, formMatriculaCursoTurma );
  PageControl1.ActivePage := tabAlunos;
  grd.Options := grd.Options - [dgRowLines];

  toolDisciplinas.Visible := False;
  toolDoc.Visible := False;
  toolAlunos1.Visible := True;

//  grd.Columns[0].Visible :=  (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S');
  btnRenumerar.Visible :=  (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S');

  if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
  begin
     btnObs.Caption := DM.variavel_parametro('botao_observacoes_nome');
     if Trim(btnObs.Caption) = EmptyStr then
        btnObs.Caption := 'Observações';
  end;
  Application.ProcessMessages;
end;

function TfrmMatriculas.DoCreateField(const FieldName: WideString; Origin: string): TField;
var
  FieldDef: TFieldDef;
  ParentField: TField;
  SubScript,
  ShortName,
  ParentFullName: String;
begin
  FieldDef := tblMatriculas.FieldDefList.FieldByName(FieldName);
  ParentField := nil;
  if tblMatriculas.ObjectView then
  begin
    if FieldDef.ParentDef <> nil then
    begin
      if FieldDef.ParentDef.DataType = ftArray then
      begin
        { Strip off the subscript to determine the parent's full name }
        SubScript := Copy(FieldName, Pos('[', FieldName), MaxInt);
        ParentFullName := Copy(FieldName, 1, Length(FieldName) - Length(SubScript));
        ShortName := FieldDef.ParentDef.Name + SubScript;
      end
      else
      begin
        if faUnNamed in FieldDef.ParentDef.Attributes then
          ParentFullName := FieldDef.ParentDef.Name else
          ParentFullName := ChangeFileExt(FieldName, '');
        ShortName := FieldDef.Name;
      end;
      ParentField := tblMatriculas.FieldList.Find(ParentFullName);
      if ParentField = nil then
        ParentField := DoCreateField(ParentFullName, Origin);
    end
    else
      ShortName := FieldDef.Name;
  end
  else
    ShortName := FieldName;
  Result := FieldDef.CreateField(tblMatriculas.Owner, ParentField as TObjectField, ShortName, False);
  try
    Result.Origin := Origin;
    Result.Name := FieldName;
  except
    Result.Free;
    raise;
  end;
end;


function TfrmMatriculas.DoAddFields(All: Boolean): TField;
var
  I: Integer;
  FieldName: WideString;
  Field: TField;
begin

  try
    { Add physical fields not already represented by TField components to the
      to the list of available fields }
    for I := 0 to tblMatriculas.FieldDefList.Count - 1 do
      with tblMatriculas.FieldDefList[I] do
        if (FieldClass <> nil) and not (faHiddenCol in Attributes) then
        begin
          FieldName := tblMatriculas.FieldDefList.Strings[I];
          Field := tblMatriculas.FindField(FieldName);
          Tag := 1;
        end;
    { Show the dialog }
  finally

  end;
end;

{
function TfrmMensalidades.CreateField(Owner: TComponent; ParentField: TObjectField = nil;
  const FieldName: WideString = ''; CreateChildren: Boolean = True): TField;
var
  FieldCount, I: Integer;
begin
  Result := CreateFieldComponent(Owner, ParentField, FieldName);
  if CreateChildren and HasChildDefs then
  begin
    if (DataType = ftArray) then
    begin
      if TFieldDefs(Collection).DataSet.SparseArrays then
        FieldCount := 1 else
        FieldCount := Size;
      for I := 0 to FieldCount - 1 do
        ChildDefs[0].CreateField(nil, TObjectField(Result), Format('%s[%d]',
          [Result.FieldName, I]))
    end else
      for I := 0 to ChildDefs.Count - 1 do
        ChildDefs[I].CreateField(nil, TObjectField(Result), '');
  end;
end;

 }


procedure TfrmMatriculas.AtivarMatricula;
Var
  qyAlteraUsuario : TUMZQuery;
  sTitulos : string;
  bAtivar : boolean;
  qTemp : TUMZQuery;
  chaves : String;
begin

  if ( not (tblMatriculasSituacao.AsInteger in [3,4,5,6,7,8] )) then
  begin
    Mensagem( 'Só é possível reativar a matrícula em caso de' + #13 +
	      'transferência, abandono ou desistência do aluno.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  qryReativarFicha.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
  qryReativarFicha.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  qryReativarFicha.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;

  qryReativarFicha.ParamByName('Situacao').AsInteger := tblMatriculasSituacao.AsInteger;

{  qryReativar.ExecSQL; }
  qryReativarFicha.ExecSQL;

  DM.tblMatriculas.Close;
  DM.tblMatriculas.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
  DM.tblMatriculas.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  DM.tblMatriculas.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  DM.tblMatriculas.Open;

  DM.tblMatriculas.Edit;
  DM.tblMatriculasDataSaida.AsString := '';
  DM.tblMatriculasSituacao.AsInteger := 1;
  DM.tblMatriculas.Post;

  // Atualiza a situação de matrícula do aluno no curso
  DM.UpdateSituacaoMatriculaCurso(DM.tblMatriculasSituacao.AsInteger, tblMatriculascd_matricula_curso.AsLargeInt);

  if DM.FindMotivo(tblMatriculasCodigoAluno.AsInteger, 999, tblMatriculasDataSaida.AsDateTime, tblMatriculasTurma.AsString) then
  DM.tblMotivos.Delete;

// Reativar mensalidades

if (Dm.variavel_parametro('financeiro_cancelar_pendente') = 'S') then begin

        Dm.tblMensalidades.Close;
        Dm.tblMensalidades.SQL.Text := 'select * from mensalidades';
        Dm.tblMensalidades.SQL.Add(' where codigoaluno = :codigo and ');
        Dm.tblMensalidades.SQL.Add(' turma = :turma and anosemestre = :anosemestre ');
        Dm.tblMensalidades.SQL.Add(' and ( situacao = 5 ) AND tipoparcela <> 4 ' );

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

        bAtivar := False;

        Dm.tblMensalidades.First;
        While not Dm.tblMensalidades.Eof do Begin

           // Verificar se deve ser ativada a mensalidade

           bAtivar := False;

           // Somente ativar se a parcela não estiver vencida e se o cancelamento ocorreu dentro do mês..
           if  (FormatDateTime('yyyymm', DM.tblMensalidadesDataVencimento.AsDateTime) >= FormatDateTime('yyyymm', DataHoje))
           AND (FormatDateTime('yyyymm', DM.tblMensalidadesdt_competencia.AsDateTime) >= FormatDateTime('yyyymm', DataHoje))
           AND (FormatDateTime('yyyymm', DM.tblMensalidadesDataPagamento.AsDateTime) >= FormatDateTime('yyyymm', DataHoje))
           AND (not DM.EstaBloqueado(DM.tblMensalidadesDataVencimento.AsDateTime, False) )
           AND (not DM.EstaBloqueado(DM.tblMensalidadesdt_competencia.AsDateTime, False) )
           AND (not DM.EstaBloqueado(DM.tblMensalidadesDataPagamento.AsDateTime, False) )
           then begin

              bAtivar := True;

           end;


           if bAtivar then begin

             DM.tblMensalidades.Edit;

             DM.tblMensalidadesSituacao.AsInteger := 2; // Mensalidade volta a ficar pendente.

             DM.tblMensalidadesDataPagamento.AsString := '';
             DM.tblMensalidadesdt_credito.AsString := '';

             Dm.tblMensalidades.Post;

             // Gravar Log

             chaves := FillString(IntToStr(DM.tblMensalidadesCodigoAluno.AsInteger), alRight, '0', 10, true ) + ';' +
                       Dm.tblMensalidadesAnoSemestre.AsString + ';' + Dm.tblMensalidadesTurma.AsString + ';' +
                       Dm.tblMensalidadesParcela.AsString + ';' +
                       FormatDateTime('dd/mm/yyyy',Dm.tblMensalidadesDataVencimento.AsDateTime) + ';';


             DM.setLog(1009, 'Alteracao', chaves, DM.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger), 'Matricula reativada: Mensalidade: ' + Dm.tblMensalidadescd_mensalidade.AsString);
             
             // Apagar a movimentação de desconto

             DM.Criarconsulta(qTemp);

             qTemp.Close;
             qTemp.SQL.Clear;
             qTemp.SQL.Add(
               ' DELETE cr.* FROM fin_mov_cr as cr '+
               '  INNER JOIN fin_acoes_movimento as a ON (cr.cd_acao = a.cd_acao) '+
               '  WHERE cr.cd_mensalidade = :CdMensalidade '+
               '    AND cd_coligada = :CdColigada '+
               '    AND a.cd_tipo_acao = 2 '
             );
             qTemp.ParamByName('CdMensalidade').AsString := DM.tblMensalidadescd_mensalidade_origem.AsString;
             qTemp.ParamByName('CdColigada').AsInteger := DM.tblMensalidadescd_coligada.AsInteger;
             qTemp.ExecSQL();

           end;

           DM.tblMensalidades.Next;
        End;

     End;

// fim da reativação das mensalidades

  Screen.Cursor := crDefault;

  Mensagem( 'Aluno reativado com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
  
  // altera nome do usuario para o que ativou
   DM.CriarConsulta(qyAlteraUsuario);
   qyAlteraUsuario.SQL.Text := ''+
                           'UPDATE                       '+
                           '  matriculas                 '+
                           'SET                          '+
                           '  usuario =:nm_usuario       '+
                           'WHERE                        '+
                           '  codigoaluno =:cd_aluno  AND   '+
                           '  anosemestre =:ano_semestre AND '+
                           '  turma =:cd_turma           ';
   qyAlteraUsuario.ParamByName('nm_usuario').AsString := DM.sLogin;
   qyAlteraUsuario.ParamByName('cd_aluno').AsInteger := DM.tblMatriculasCodigoAluno.AsInteger;
   qyAlteraUsuario.ParamByName('cd_turma').AsString :=  DM.tblMatriculasTurma.AsString;
   qyAlteraUsuario.ParamByName('ano_semestre').AsInteger :=  DM.tblMatriculasAnoSemestre.AsInteger;
   qyAlteraUsuario.ExecSQL;

  tblMatriculas.Close;
  tblMatriculas.Open;

end;

procedure TfrmMatriculas.btnMotivosClick(Sender: TObject);
//var
//  n : Longint;
begin
   if not(DM.UsuarioLogado.TemPermissao(1145, npAcesso, true)) then
   begin
     Abort;
   end;
   TfMatriculaMotivos.MostraMotivos(Self.tblMatriculasCodigoAluno.AsInteger, Self.tblMatriculasNome.AsString, Self);
//  if DM.FindMotivo( tblMatriculasCodigoAluno.AsInteger, 999, tblMatriculasDataSaida.AsDateTime, tblMatriculasTurma.AsString )
//  OR (tblMatriculasSituacao.AsInteger in [3,4,5,6,7,8])
//  then begin
//
//     Application.CreateForm( TfrmMotivos, frmMotivos );
//     DM.FindUserCodigo(DM.tblMotivosAutorizadoPor.AsInteger);
//
//    if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, False ) then begin
//
//         for n := 0 to frmMotivos.ComponentCount - 1 do
//            if TWinControl( frmMotivos.Components[n] ).Tag = 0 then
//               TWinControl( frmMotivos.Components[n] ).Enabled := False;
//    end;
//
//    frmMotivos.pnlUsuario.Caption := DM.tblUsuariosNome2.AsString;
//    frmMotivos.ShowModal;
//
//    if DM.tblMotivos.State in [dsInsert, dsEdit] then begin
//       DM.tblMotivos.Post;
//       DM.tblMotivos.Close;
//    end;
//  end
  
end;

procedure TfrmMatriculas.PlanilhadeRecebimentos1Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2001, npAcesso, True ) then Exit;

   Application.CreateForm( TfrmTransferir, frmTransferir );

   Application.CreateForm( Tfrm_mensa_alterar, frm_mensa_alterar );

   if not PrincipalForm.ProcuraForm( TForm(frmMensalidades) ) then
   begin
      Application.CreateForm( TfrmMensalidades, frmMensalidades );
      frmMensalidades.lngCodigoAluno := tblMatriculasCODIGOALUNO.AsInteger;
      frmMensalidades.sNomeAluno := tblMatriculasNome.AsString;
      frmMensalidades.xTurma := tblMatriculasTurma.AsString;
      frmMensalidades.btnAlunoClick(nil);
   end
   else
   begin
      frmMensalidades.lngCodigoAluno := tblMatriculasCODIGOALUNO.AsInteger;
      frmMensalidades.sNomeAluno := tblMatriculasNome.AsString;
      frmMensalidades.xTurma := tblMatriculasTurma.AsString;
      frmMensalidades.btnAlunoClick(nil);
      frmMensalidades.Show;
   end;
end;

procedure TfrmMatriculas.ConfirmarMatricula;
var
  lngCodigoAluno : Longint;
  strTurma : String;
  intAnoSemestre : Integer;
  iAtiva : Integer;
  sMsg : String;
  sMsgLog : String;
begin

  if tblMatriculasSituacao.AsInteger <> 10 then
  begin
    Mensagem( 'Só é possível confirmar matrícula do aluno que tem,' + #13 +
	      'reserva de vaga nesta turma/período.', Application.title,
	      MB_OK + MB_ICONSTOP );
    Exit;
  end;

  if Mensagem( 'Deseja confirmar a matrícula do aluno selecionado?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  lngCodigoAluno := tblMatriculasCodigoAluno.AsInteger;
  strTurma := tblMatriculasTurma.AsString;
  intAnoSemestre := tblMatriculasAnoSemestre.AsInteger;

  iAtiva := DM.Ativar_Matricula(lngCodigoAluno, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.ASInteger, false, true);

  if (iAtiva > 0) then begin

    sMsg := 'Não é possível ativar a matrícula do estudante ';
    sMsgLog := 'Matrícula Ativada com: '+ CHR(13);

    if iAtiva = 1 then begin

       sMsg := sMsg + 'pelo seguinte motivo: ' + CHR(13) + CHR(13);
       sMsg := sMsg + 'Existe pendência no financeiro.';
       sMsgLog := sMsgLog + 'pendência financeira';

    end else if iAtiva = 2 then begin

       sMsg := sMsg + 'pelo seguinte motivo: ' + CHR(13) + CHR(13);
       sMsg := sMsg + 'Existe pendência de documentação.';
       sMsgLog := sMsgLog + 'pendência de documentação';

    end else begin

       sMsg := sMsg + 'pelos seguintes motivos: ' + CHR(13) + CHR(13);
       sMsg := sMsg + 'Existe pendência no financeiro.' + CHR(13);
       sMsg := sMsg + 'Existe pendência de documentação.';
       
       sMsgLog := sMsgLog + 'pendência financeira' + CHR(13);
       sMsgLog := sMsgLog + 'pendência de documentação';

    end;

    // Verificar se a pessoa tem acesso para ativar a matrícula do aluno mesmo com pendências

    if DM.UsuarioLogado.TemPermissao(1055, npEspecial, false) then 
    begin

       sMsg :=  sMsg + CHR(13) + CHR(13) + 'Porém, você tem permissão para ativar a matrícula ignorando as pendências. ';
       sMsg :=  sMsg + CHR(13) + CHR(13) + 'Deseja ativar a matrícula mesmo com as pendências? ';

       if Mensagem( sMsg, 'Atenção', MB_YESNOCANCEL + MB_ICONWARNING ) = mrYes then begin

          iAtiva := DM.Ativar_Matricula(lngCodigoAluno, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.ASInteger, true, true );

          ConfirmarMatriculaAulas(strTurma,intAnoSemestre, lngCodigoAluno);

          DM.setLog(1055, 'Alteracao', IntToStr(lngCodigoAluno) + ';' + tblMatriculasTurma.AsString + ';' + tblMatriculasAnoSemestre.AsString, dm.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger) , sMsgLog );
       end;

    end else begin
      Mensagem( sMsg, 'Atenção', MB_OK + MB_ICONWARNING );
    end;

  end else 
  begin      
      ConfirmarMatriculaAulas(strTurma,intAnoSemestre, lngCodigoAluno);
  end;

end;

{ Procedure criada para evitar a duplicidade no codigo da ConfirmarMatricula }
procedure TfrmMatriculas.ConfirmarMatriculaAulas(strTurma : String; intAnoSemestre : Integer; lngCodigoAluno: Longint  );
var
   qyAlteraUsuario: TUMZQuery;
begin
   DM.CriarConsulta(qyAlteraUsuario);
   tblMatriculas.DisableControls;
   tblMatriculas.Close;
   tblMatriculas.Open;
   tblMatriculas.Locate( 'CodigoAluno;Turma;AnoSemestre', VarArrayOf( [lngCodigoAluno,strTurma,intAnoSemestre] ), [loCaseInsensitive] );
 
   tblMatriculas.EnableControls;
 
   Mensagem( 'Matrícula ativada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
   // altera nome do usuario para o que ativou
   qyAlteraUsuario.SQL.Text := ''+
                         'UPDATE                       '+
                         '  matriculas                 '+
                         'SET                          '+
                         '  usuario =:nm_usuario       '+
                         'WHERE                        '+
                         '  codigoaluno =:cd_aluno  AND   '+
                         '  anosemestre =:ano_semestre AND '+
                         '  turma =:cd_turma           ';
   qyAlteraUsuario.ParamByName('nm_usuario').AsString := DM.sLogin;
   qyAlteraUsuario.ParamByName('cd_aluno').AsInteger := lngCodigoAluno;
   qyAlteraUsuario.ParamByName('cd_turma').AsString :=  strTurma;
   qyAlteraUsuario.ParamByName('ano_semestre').AsInteger := intAnoSemestre;
   qyAlteraUsuario.ExecSQL;



    //Atribui valores aos dias de aula que aconteceram antes da matricula
    with tblFichaIndividual do
    begin
       ParamByName('CodigoAluno').AsString := tblMatriculasCodigoAluno.AsString;
       ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
       ParamByName('AnoSemestre').AsString := tblMatriculasAnoSemestre.AsString;
       Open;

       while not Eof  do
       begin
          DM.callProcedure('CALL INICIAR_MATRICULA ( ' +
             tblFichaIndividualAnoSemestre.AsString + ', ' +
             QuotedStr(tblFichaIndividualTurma.AsString) + ', ' +
             tblFichaIndividualdisciplina.AsString + ', ' +
             tblFichaIndividualCodigoAluno.AsString + ')',
             False
          ); 
          Next;             
       end;
       Close;
    end; 
end;

procedure TfrmMatriculas.Cronograma1Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1027, npAcesso, True ) then Exit;
   Application.CreateForm(TfrmContAulasProvas, frmContAulasProvas);
   frmContAulasProvas.pgcAulasNotas.ActivePageIndex := frmContAulasProvas.tsCronogramas.PageIndex;

   if (tblMatriculas.RecNo >= 1) then
   begin
      frmContAulasProvas.txtCronogramasCurso.Text := tblMatriculasCurso.AsString;
      frmContAulasProvas.txtTurmaCronograma.Text := tblMatriculasTurma.AsString;
      frmContAulasProvas.sPAnoSem := tblMatriculasAnoSemestre.AsString;
   end else begin
      frmContAulasProvas.txtCronogramasCurso.Text := sFiltroCurso;
      frmContAulasProvas.txtTurmaCronograma.Text := sFiltroTurma;
      frmContAulasProvas.sPAnoSem := sFiltroAnosemestre;
   end;

   frmContAulasProvas.LimparFiltroColigada();
   frmContAulasProvas.pgcAulasNotasChange(nil);
   frmContAulasProvas.Show();
end;

procedure TfrmMatriculas.btnReprovarClick(Sender: TObject);
begin

  DM.tblMatriculas.Close;
  DM.tblMatriculas.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
  DM.tblMatriculas.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  DM.tblMatriculas.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  DM.tblMatriculas.Open;

  DM.tblMatriculas.Edit;
  DM.tblMatriculasDataEntrada.AsString := DateToStr(DataHoje);

  Application.CreateForm( TfrmDataSaida, frmDataSaida );
  frmDataSaida.Label1.Caption := 'Confirmar Data de Entrada:';
  frmDataSaida.DBEdit1.DataField := 'DataEntrada';
  frmDataSaida.ShowModal;

//  DM.tblMatriculasSituacao.AsInteger := bytAux;
//  intSalvar := TSpeedButton( Sender ).Tag;
  DM.tblMatriculas.Post;

  Mensagem( 'Operação realizada com sucesso.', Application.Title,
            MB_OK + MB_ICONINFORMATION );
  { *************************************** }


  tblMatriculas.Close;
  tblMatriculas.Open;
  Screen.Cursor := crDefault;

end;


procedure TfrmMatriculas.btnDiplomaClick(Sender: TObject);
var
  intAnoSemestre : Integer;
  lngCodigoAluno : Longint;
  strTurma : String;
begin

  DM.tblMatriculas.Close;
  DM.tblMatriculas.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
  DM.tblMatriculas.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  DM.tblMatriculas.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  DM.tblMatriculas.Open;

  DM.tblMatriculas.Edit;
  if Dm.isTrue(tblMatriculasDiploma.AsString) Then
     DM.tblMatriculasDiploma.AsString := 'N'
  else
     DM.tblMatriculasDiploma.AsString := 'S';

  intSalvar := TSpeedButton( Sender ).Tag;
  DM.tblMatriculas.Post;

  intAnoSemestre := tblMatriculasAnoSemestre.AsInteger;
  strTurma := tblMatriculasTurma.AsString;
  lngCodigoAluno := tblMatriculasCodigoAluno.AsInteger;

  tblMatriculas.DisableControls;
  tblMatriculas.Close;
  tblMatriculas.Open;
  tblMatriculas.Locate( 'CodigoAluno;Turma;AnoSemestre', VarArrayOf( [
    lngCodigoAluno,strTurma,intAnoSemestre] ), [loCaseInsensitive] );
  tblMatriculas.EnableControls;
end;

procedure TfrmMatriculas.tblMatriculasCalcFields(DataSet: TDataSet);
begin
  { Remover após remoção do campo na base de dados }
  if tblMatriculasTurmaDependencia.AsString = '' then
      tblMatriculasTurmaCalc.AsString := tblMatriculasTurma.AsString
  else
      tblMatriculasTurmaCalc.AsString := tblMatriculasTurma.AsString + '/' + tblMatriculasTurmaDependencia.AsString;
end;


procedure TfrmMatriculas.inativaGrupo(cd_pessoa, cd_grupo: Integer;
  dt_saida: TDateTime; mensagemLog : String; mostraMensagemInicial : Boolean = true);
var
   chaves : String;
begin
   // Avisa o usuário que ele está desativando uma disciplina com grupo de atividade
   if(mostraMensagemInicial) then
   begin
      Mensagem(
         'Você desativou uma disciplina com grupo de atividade, o aluno foi inativado nesse grupo.',
         'Informação',
         MB_OK + MB_ICONINFORMATION
      );
   end;

   // Inativa o aluno no grupo de atividade
   qyInativarAluno.Close;
   qyInativarAluno.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyInativarAluno.ParamByName('cd_grupo').AsInteger := cd_grupo;
   qyInativarAluno.ParamByName('dt_saida').AsDateTime := dt_saida;

   qyInativarAluno.ExecSQL;

   // Guardar log de inativação do aluno no grupo (tabela: log_geral)
   // Chave: CD_PESSOA;CD_GRUPO
   chaves := FillString(inttostr(cd_pessoa), alRight, '0', 10, true ) + ';' + inttostr(cd_grupo);
   
   DM.setLog(
      1033,
      'Alteracao',
      chaves,
      dm.getColigadaByTurma(DM.tblMatriculasTurma.AsString, DM.tblMatriculasAnoSemestre.AsInteger),
      mensagemLog
   );

   //Verifica se é o ultimo do grupo
   qryVerificaGrupos.Close;
   qryVerificaGrupos.ParamByName('grupo').AsInteger := cd_grupo;
   qryVerificaGrupos.Open;

   if(qryVerificaGrupos.FieldByName('nr_alunos').AsInteger = 0) then
   begin
      qryInativaGrupo.Close;
      qryInativaGrupo.ParamByName('grupo').AsInteger := cd_grupo;
      qryInativaGrupo.ExecSQL;

      // Guardar log de inativação do grupo
      DM.setLog(
         1033,
         'Alteracao',
         inttostr(cd_grupo),
         dm.getColigadaByTurma(DM.tblMatriculasTurma.AsString, DM.tblMatriculasAnoSemestre.AsInteger),
         'Desativado grupo' + inttostr(cd_grupo) + ' pois não existem mais alunos ativos no mesmo'
      );
   end;
end;

procedure TfrmMatriculas.btnObsClick(Sender: TObject);
begin
   if not tblMatriculas.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblMatriculasCODIGOALUNO.AsInteger,
         okMatriculation)
   else
      Mensagem('Selecione um aluno para visualizar as observações.', 'Atenção',
         MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure TfrmMatriculas.dtcFichaIndividualDataChange(Sender: TObject;
  Field: TField);
begin
   // Verifica observacoes na aba de disciplinas
   qryExtras.Close;
   qryExtras.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
   qryExtras.ParamByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
   qryExtras.ParamByName('disciplina').AsInteger := tblFichaIndividualdisciplina.AsInteger;
   qryExtras.ParamByName('serie').AsInteger := tblFichaIndividualSerie.AsInteger;
   qryExtras.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
   qryExtras.Open;
   
   btnObservacao.Marked := False;
   if ( qryExtras.RecordCount > 0 ) AND
      ( qryExtrasds_observacao.AsString <> '' )
   then
   begin
      btnObservacao.Marked := True;
   end;
end;

procedure TfrmMatriculas.dtcMatriculasDataChange(Sender: TObject;
  Field: TField);
begin
  if PageControl1.ActivePage = tabDisciplinas then
  begin
    tblFichaIndividual.Close;
    tblFichaIndividual.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
    tblFichaIndividual.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
    tblFichaIndividual.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
    tblFichaIndividual.Open;
    tblResumoFicha.Close;
    tblResumoFicha.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
    tblResumoFicha.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
    tblResumoFicha.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
    tblResumoFicha.Open;
  end;
  

  btnObs.Marked :=
   TfObservacoes.HasObservations(
      tblMatriculasCODIGOALUNO.AsInteger, okMatriculation);
end;

procedure TfrmMatriculas.tblFichaIndividualCalcFields(DataSet: TDataSet);
begin
  tblFichaIndividualDescricaoDisciplina.AsString := tblFichaIndividualDescricao.AsString;

  try
     tblFichaIndividualDescricaoSituacao.AsString := Dm.lst_situacao_sigla[tblFichaIndividualSituacao.AsInteger];
  except
     tblFichaIndividualDescricaoSituacao.AsString := '';
  end;

  if (tblFichaIndividualsn_possui_compl.AsInteger = 1) then
  begin
     tblFichaIndividualsn_possui_compl_calc.AsString:= 'X';
  end
  else
  begin
     tblFichaIndividualsn_possui_compl_calc.AsString:= '';
  end;

  if (tblFichaIndividualsn_possui_adap.AsInteger = 1) then
  begin
     tblFichaIndividualsn_possui_adap_calc.AsString:= 'X';
  end
  else
  begin
     tblFichaIndividualsn_possui_adap_calc.AsString:= '';
  end;

  if (tblFichaIndividualsn_possui_depen.AsInteger = 1) then
  begin
     tblFichaIndividualsn_possui_depen_calc.AsString:= 'X';
  end
  else
  begin
     tblFichaIndividualsn_possui_depen_calc.AsString:= '';
  end;
end;

procedure TfrmMatriculas.PageControl1Change(Sender: TObject);
begin

  case TTabSheet( PageControl1.ActivePage ).PageIndex of
    0 : begin
      toolAlunos1.Visible := True;
      toolDisciplinas.Visible := False;
      toolDoc.Visible := False;
    end;

    1 : begin
      toolDisciplinas.Visible := True;
      toolDoc.Visible := False;
      toolAlunos1.Visible := False;
      dtcMatriculasDataChange(nil,nil);
      if not (DM.GetUsuarioLogado.TemPermissao(DM.iCdPessoaLogado,'Academico.Matricula.Disciplinas.CreditosFinanceiros',npAcesso,false)) then
        begin
         if pmQtdFichaIndividual.Items.Count = 2 then
            begin
               pmQtdFichaIndividual.Items[1].Destroy;
               pmQtdFichaIndividual.Items[0].Destroy;
            end;
        end;
    end;
    2 : begin
      toolDoc.Visible := True;
      toolDisciplinas.Visible := False;
      toolAlunos1.Visible := False;
      pgDocumentosChange(self);
    End;
  end;

end;

procedure TfrmMatriculas.pgDocumentosChange(Sender: TObject);
CONST

   SQL_CURSOS_DOCUMENTOS = ''+
      'SELECT                    '+
      '  dd.curso,               '+
      '  dd.sn_obrigatorio,      '+
      '  dd.nr_grupo,            '+
      '  d.codigo,               '+
      '  d.documento,            '+
      '  d.sigla,                '+
      '  da.apresentou,          '+
      '  da.observacao,          '+
      '  da.sn_digitalizado,     '+
      '  d.nr_dpi,               '+
      '  d.nr_largura,           '+
      '  d.nr_altura,            '+
      '  da.dt_entrega,          '+
      '  d.cd_siga               '+
      'FROM                      '+
      '  documentos_alunos da    '+
      '  INNER JOIN pessoas pe ON (da.codigoaluno = pe.cd_pessoa) '+
      '  INNER JOIN documentos_necessarios dd ON (da.cod_documento = dd.cod_documento AND dd.curso = :curso) '+
      '  INNER JOIN documentos d ON (da.cod_documento = d.codigo) '+
      'WHERE                     '+
      '  (da.codigoaluno = :codigoaluno) '+
      '  AND (d.ds_sexo = "A" OR d.ds_sexo = pe.ds_sexo) '+
      '  AND (d.cd_tipo_pessoa = 1 OR d.cd_tipo_pessoa = 2) '+
      'ORDER BY                  '+
      '  d.ordem, d.documento    ';


   SQL_TODOS_DOCUMENTOS = ''+
      'SELECT                          '+
      '  dd.curso,                     '+
      '  dd.sn_obrigatorio,            '+
      '  dd.nr_grupo,                  '+
      '  d.codigo,                     '+
	   '  d.documento,                  '+
	   '  d.sigla,                      '+
	   '  da.apresentou,                '+
	   '  da.observacao,                '+
	   '  da.sn_digitalizado,           '+
	   '  d.nr_dpi,                     '+
	   '  d.nr_largura,                 '+
	   '  d.nr_altura,                  '+
	   '  da.dt_entrega,                '+
	   '  d.cd_siga                     '+
      'FROM                            '+
	   '  documentos AS d               '+
      '  LEFT JOIN Documentos_Alunos da ON (       '+
	   '     d.codigo = da.cod_documento            '+
	   '     AND da.CodigoAluno = :codigoaluno      '+
      '  )                                         '+
      '  LEFT JOIN documentos_necessarios dd ON (  '+
      '     da.cod_documento = dd.cod_documento    '+
      '     AND dd.curso = :curso                  '+
      '  )                             '+
      'WHERE                           '+
	   '  d.cd_tipo_pessoa IN (1, 2)    '+
      'ORDER BY                        '+
	   '  d.documento;                  ';


begin
   if pgDocumentos.ActivePage = TabSheet2 then
   begin
      tblDoc.SQL.Text := SQL_TODOS_DOCUMENTOS;
   end
   else
   begin
      tblDoc.SQL.Text := SQL_CURSOS_DOCUMENTOS;
   end;

   tblDoc.ParamByName('codigoaluno').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;
   tblDoc.ParamByName('curso').AsString := tblMatriculasCurso.AsString;

   tblDoc.Open;
end;

procedure TfrmMatriculas.matricularDisciplina;

   { Verifica a disponibilidade de vagas para as turmas/disciplinas selecionadas
   }
   function VerificaVagas: boolean;
   const
      S_SQL_LOTACAO_ORACLE =
         'SELECT '+
            'fi.anosemestre nr_anosemestre,'+
            'fi.turma cd_turma,'+
            'fi.disciplina cd_disciplina,'+
            'FIRST_OCCURRENCE(fi.curso) cd_curso, '+
	         'CAST(FIRST_OCCURRENCE(T.sn_bloquear_vagas) AS NUMBER(4)) sn_bloquear_vagas, '+
	         'CAST(FIRST_OCCURRENCE(T.vagas) AS NUMBER(5)) nr_vagas, '+
	         'FIRST_OCCURRENCE(D.descricao) ds_disciplina, '+
            'CAST(COUNT(*) AS NUMBER(19)) nr_matriculados '+
         'FROM '+
            'fichaindividual fi '+
               'JOIN situacao s ON '+
                  '(fi.situacao = s.cd_situacao) '+
               'JOIN turmas t ON '+
                  '(fi.turma = t.codigo) AND '+
                  '(fi.anosemestre = t.anosemestre) '+
               'JOIN disciplinas d ON '+
                  '(fi.disciplina = d.codigo) AND '+
                  '(fi.curso = d.curso) '+
         'WHERE '+
            's.cd_situacao_pai NOT IN (3, 4, 5, 6, 7, 8) AND (%s) '+
         'GROUP BY '+
            'fi.turma,'+
            'fi.disciplina,'+
            'fi.anosemestre';

      S_SQL_LOTACAO =
         'SELECT '+
            'fi.anosemestre nr_anosemestre,'+
            'fi.turma cd_turma,'+
            'fi.disciplina cd_disciplina,'+
            'fi.curso cd_curso,'+
            't.sn_bloquear_vagas,'+
            't.vagas nr_vagas,'+
            'd.descricao ds_disciplina,'+
            'COUNT(*) nr_matriculados '+
         'FROM '+
            'fichaindividual fi '+
               'JOIN situacao s ON '+
                  '(fi.situacao = s.cd_situacao) '+
               'JOIN turmas t ON '+
                  '(fi.turma = t.codigo) AND '+
                  '(fi.anosemestre = t.anosemestre) '+
               'JOIN disciplinas d ON '+
                  '(fi.disciplina = d.codigo) AND '+
                  '(fi.curso = d.curso) '+
         'WHERE '+
            's.cd_situacao_pai NOT IN (3, 4, 5, 6, 7, 8) AND (%s) '+
         'GROUP BY '+
            'fi.turma,'+
            'fi.disciplina,'+
            'fi.anosemestre';

      S_FILTRO_DISCIPLINA =
         '(fi.turma = ''%s'' AND '+
          'fi.disciplina = %d AND '+
          'fi.curso = ''%s'' AND '+
          'fi.anosemestre = %d AND '+
          't.sn_bloquear_vagas = 2)';

      S_OP = ' OR ';

      S_MSG_DISCIPLINAS =
         'O aluno não pode ser matriculado nas seguintes turmas/disciplinas '+
         'pois todas as vagas estão preenchidas:' + #13 + #13 + '%s';
   var
      I: integer;
      LSDisciplinas, LSFiltro: string;
   begin
      Result := true;
      LSFiltro := '';
      LSDisciplinas := '';

      for I := 0 to frmMatriculaDisc.grd.SelectedRows.Count - 1 do
      begin
         frmMatriculaDisc.tblGrade.GotoBookmark(
            Pointer(frmMatriculaDisc.grd.SelectedRows.Items[I]));
         if LSFiltro <> '' then
            LSFiltro := LSFiltro + S_OP;
         LSFiltro :=
            LSFiltro +
            Format(
               S_FILTRO_DISCIPLINA,
               [frmMatriculaDisc.tblGradeCodigoTurma.AsString,
                frmMatriculaDisc.tblGradeDisciplina.AsInteger,
                frmMatriculaDisc.tblGradeCurso.AsString,
                frmMatriculaDisc.tblGradeAnoSemestre.AsInteger]);
      end;

      qryTurmasLotacaoVagas.Close;
      //Verifica se a conexão é Oracle ou MySQL
      if qryTurmasLotacaoVagas.Connection.Protocol = 'oracle' then //Oracle
      begin
         qryTurmasLotacaoVagas.SQL.Text := Format(S_SQL_LOTACAO_ORACLE, [LSFiltro]);
      end else begin
         qryTurmasLotacaoVagas.SQL.Text := Format(S_SQL_LOTACAO, [LSFiltro]);
      end;

      qryTurmasLotacaoVagas.Open;

      if not qryTurmasLotacaoVagas.IsEmpty then
      begin
         for I := 0 to frmMatriculaDisc.grd.SelectedRows.Count - 1 do
         begin
            frmMatriculaDisc.tblGrade.GotoBookmark(
               Pointer(frmMatriculaDisc.grd.SelectedRows.Items[I]));
            if qryTurmasLotacaoVagas.Locate(
                  'cd_turma;cd_disciplina;cd_curso;nr_anosemestre',
                  VarArrayOf(
                     [frmMatriculaDisc.tblGradeCodigoTurma.AsString,
                      frmMatriculaDisc.tblGradeDisciplina.AsInteger,
                      frmMatriculaDisc.tblGradeCurso.AsString,
                      frmMatriculaDisc.tblGradeAnoSemestre.AsInteger
                     ]),
                  [loCaseInsensitive]) then
            begin
               if qryTurmasLotacaoVagassn_bloquear_vagas.AsInteger = 2 then
               begin
                  if qryTurmasLotacaoVagasnr_matriculados.AsInteger >= qryTurmasLotacaoVagasnr_vagas.AsInteger then
                  begin
                     if LSDisciplinas <> '' then
                        LSDisciplinas := LSDisciplinas + #13;
                     LSDisciplinas :=
                        LSDisciplinas +
                        Format('%s/%s', [qryTurmasLotacaoVagascd_turma.AsString,
                           qryTurmasLotacaoVagasds_disciplina.AsString]);
                  end;
               end;
            end;
         end;
         if LSDisciplinas <> '' then
         begin
            Mensagem(Format(S_MSG_DISCIPLINAS, [LSDisciplinas]), 'Atenção', MB_ICONWARNING);
            Result := false;
         end;
      end;
   end;

const
   SQL_POSSUI_GRUPOS_ATIVIDADE = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.cd_disciplina = :cd_disciplina AND '+
                                 '	dg.sn_ativo = 1';

   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível realizar alterações na matrícula que implicam em ajustes nos créditos acadêmicos.';
var
  n ,cdFicha: Integer;
  lugar : pointer;
  bDiscOptativa: Boolean;

  total_creditos, iSerie : integer;
  turma_antiga : string;

  sMsg : String;
  sAux, sAuxOpt, sChave : String;
  qyAlterarDiscExistente : TUMZQuery;
  qyAlterarFichaFalta : TUMZQuery;
begin

  if not DM.UsuarioLogado.TemPermissao( 1033, npIncluir, True ) then Exit;

   if not(podeAtivarDisciplina) then
   begin
      MessageDlg('Este aluno esta com a matrícula curso cancelada ou transferida!', mtWarning, [mbOK], -1);
      Exit;
   end;

   // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
   // cadastrados no programa bolsa FIES está habilitada.
   // Se estiver habilitado, verifica se o usuário possui permissão para
   // alterar os créditos mesmo com o bloqueio habilitado.
   
   if DM.IsAlunoFIES(tblMatriculasCODIGOALUNO.AsInteger) and
      FBloqueiaCreditosAlunosFIES then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
      begin
         if MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
         begin
            Exit;
         end;
      end
      else
      begin
         MessageDlg(SMsgBloqueio, mtInformation, [mbOK], -1);
         Exit;
      end;
   end;

  frmMatriculaDisc.txtAnoSemestre.ReadOnly := True;
  frmMatriculaDisc.udAnoSemestre.Enabled := False;

   frmMatriculaDisc.iCodigoAluno :=  tblMatriculasCodigoAluno.AsInteger;
   frmMatriculaDisc.iAnoSemestre := tblMatriculasAnoSemestre.AsInteger;
   frmMatriculaDisc.sTurma := tblMatriculasTurma.AsString;
   frmMatriculaDisc.sCurso := tblMatriculasCurso.AsString;
   frmMatriculaDisc.seriealuno:= Self.getSerie(
      tblMatriculasCurso.AsString,
      tblMatriculasAnoSemestre.AsInteger,
      tblMatriculasTurma.AsString
   );

  if frmMatriculaDisc.ShowModal = mrOk then
  begin

    if frmMatriculaDisc.grd.SelectedRows.Count = 0 then Exit;

    // Montar a Mensagem;

    sMsg := sMsg + 'Você está tentando matricular disciplinas para o estudante:' + CHR(13);
    sMsg := sMsg + tblMatriculasNome.AsString + CHR(13) + CHR(13);

    if TemMensalidadeComCredito(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger) then begin

       sMsg := sMsg + 'Este procedimento poderá efetuar alterações no financeiro.' + CHR(13) + CHR(13);

    end;

    sMsg := sMsg + 'Deseja continuar? ';

    if (Mensagem( sMsg , 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = ID_YES) and VerificaVagas then
    begin

      DM.tblFichaIndividual.Close;
      DM.tblFichaIndividual.SQL.Clear;
      DM.tblFichaIndividual.SQL.Add( 'SELECT * from FichaIndividual where' );
      DM.tblFichaIndividual.SQL.Add( 'CodigoAluno = :CodigoAluno and' );
      DM.tblFichaIndividual.SQL.Add( 'TurmaMatricula = :Turma and' );
      DM.tblFichaIndividual.SQL.Add( 'AnoSemestre = :AnoSemestre' );
      DM.tblFichaIndividual.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      DM.tblFichaIndividual.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
      DM.tblFichaIndividual.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      DM.tblFichaIndividual.Open();

      try

      total_creditos := 0;

      for n := 0 to frmMatriculaDisc.grd.SelectedRows.Count - 1 do
      begin

        with frmMatriculaDisc do
        begin
          grd.DataSource.DataSet.GotoBookmark(Pointer(grd.SelectedRows.Items[n]));
          if tblGradeAnoSemestre.AsInteger <> tblMatriculasAnoSemestre.AsInteger then begin
              Mensagem('Não é possível matricular uma disciplina com ano/semestre diferente da matrícula.', 'Atenção', MB_OK + MB_ICONWARNING );
          end
          else begin

              // Grava a série da disciplina escolhida
              iSerie := tblGradeSerie.AsInteger;
              bDiscOptativa := False;

              sAuxOpt := '';

              // Verifica se a disciplina selecionada é optativa, nesse caso apresenta a
              // opção para selecionar a disciplina genérica da optativa selecionada
              if iSerie = -100 then
              begin
                  bDiscOptativa := True;

                  frmSelDisciplinaGenerica.iAnoSemestre := frmMatriculaDisc.iAnoSemestre;
                  frmSelDisciplinaGenerica.iCodigoAluno := frmMatriculaDisc.iCodigoAluno;
                  frmSelDisciplinaGenerica.sTurma := tblMatriculasTurma.AsString;
                  frmSelDisciplinaGenerica.sCurso := tblMatriculasCurso.AsString;
                  frmSelDisciplinaGenerica.SetDisciplinaOptativa(tblGradeDisciplina.AsInteger, tblGradeDescricao.AsString);

                  // Se o usuário selecionou uma disciplina genérica válida
                 if frmSelDisciplinaGenerica.ShowModal = mrOk then
                 begin
                     bDiscOptativa := not(frmSelDisciplinaGenerica.discNormal);

                     // Grava a série da disciplina optativa
                     iSerie := frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('nr_serie').AsInteger;
                 end
                 else
                 begin
                    continue;
                 end;
              end;

              DM.CriarConsulta(qyAlterarDiscExistente);

              qyAlterarDiscExistente.SQL.Text :=
               'SELECT                                      '+
               '  *                                         '+
               ' FROM fichaindividual                       '+
               'WHERE                                       '+
               '  codigoaluno= :codigoaluno AND             '+
               '  turma= :turma AND                         '+
               '  anosemestre= :anosemestre AND             '+
               '  serie = :serie AND                        '+
               '  disciplina = :disciplina                  ';

               qyAlterarDiscExistente.ParamByName('codigoaluno').AsInteger:= tblMatriculasCodigoAluno.AsInteger;
               qyAlterarDiscExistente.ParamByName('turma').AsString :=txtTurma.Text;
               qyAlterarDiscExistente.ParamByName('anosemestre').AsInteger :=tblGradeAnoSemestre.AsInteger;
               qyAlterarDiscExistente.ParamByName('serie').AsInteger := iSerie;
               qyAlterarDiscExistente.ParamByName('disciplina').AsInteger := tblGradeDisciplina.AsInteger;

               qyAlterarDiscExistente.Open();

              if (qyAlterarDiscExistente.RecordCount = 0) then
              begin
                 // Se é uma disciplina optativa registra seleção da generica
                 if bDiscOptativa then
                 begin
                    // Registra a disciplina genérica
                    qyInserirDiscGenerica.Close;
                    qyInserirDiscGenerica.ParamByName('anosemestre').AsInteger := tblGradeAnoSemestre.AsInteger;
                    qyInserirDiscGenerica.ParamByName('turma').AsString := txtTurma.Text;
                    qyInserirDiscGenerica.ParamByName('codigoaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
                    qyInserirDiscGenerica.ParamByName('disciplina').AsInteger := tblGradeDisciplina.AsInteger;
                    qyInserirDiscGenerica.ParamByName('serie').AsInteger := frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('nr_serie').AsInteger;
                    qyInserirDiscGenerica.ParamByName('cd_turma_generica').AsString := tblMatriculas.FieldByName('turma').AsString;
                    qyInserirDiscGenerica.ParamByName('cd_disciplina_generica').AsInteger := frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('cd_disciplina_generica').AsInteger;
                    qyInserirDiscGenerica.ExecSQL;

                    sAuxOpt := ' (Disciplina Genérica: ['+frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('cd_disciplina_generica').AsString+'] '+frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('ds_disciplina_generica').AsString+')';
                 end;

                 DM.tblFichaIndividual.Append;
                 DM.tblFichaIndividualCodigoAluno.AsInteger := tblMatriculasCodigoAluno.AsInteger;
                 DM.tblFichaIndividualTurma.AsString := txtTurma.Text;
                 Dm.tblFichaIndividualTurmaMatricula.AsString := tblMatriculasTurma.AsString;
                 DM.tblFichaIndividualAnoSemestre.AsInteger := tblGradeAnoSemestre.AsInteger;
                 DM.tblFichaIndividualGrau.AsInteger := tblGradeGrau.AsInteger;
                 DM.tblFichaIndividualSerie.AsInteger := iSerie;

                 if tblMatriculasSituacao.AsInteger = 10 then begin
                    DM.tblFichaIndividualSituacao.AsInteger := 10;  // Reserva
                 end else begin
                    DM.tblFichaIndividualSituacao.AsInteger := 1;   // Cursando
                 end;

                 // A Nova versão não usa mais este campo.. será mantido apenas para compatibilidade
                 DM.tblFichaIndividualCodigoGrade.AsString :=
                    tblGradeAnoSemestre.AsString +
                    tblGradeCurso.AsString +
                    FillString(IntToStr(iSerie), alRight, '0', 2, true) +
                    tblGradeTurno.AsString +
                    FillString(tblGradeDisciplina.AsString, alRight, '0', 10, true);

                 DM.tblFichaIndividualDisciplina.AsInteger := tblGradeDisciplina.AsInteger;

                 DM.tblFichaIndividualCurso.AsString := tblGradeCurso.AsString;
                 DM.tblFichaIndividual.Post;


                 {Foi gerado esse update para setar as faltas com o valor null
                  para nao gerar alterações na media do aluno
                 }
                  DM.CriarConsulta(qyAlterarFichaFalta);

                  // retorna o id da ultima ficha inserida
                  //cdFicha :=  DM.LastInsert();

                  qyAlterarFichaFalta.SQL.Text :=
                     'UPDATE                '+
                     '    fichaindividual   '+
                     'SET'+
                     '    falta1 = NULL, '+
                     '    falta2 = NULL, '+
                     '    falta3 = NULL, '+
                     '    falta4 = NULL, '+
                     '    falta5 = NULL, '+
                     '    falta6 = NULL, '+
                     '    falta7 = NULL, '+
                     '    falta8 = NULL, '+
                     '    falta9 = NULL, '+
                     '    falta10 = NULL '+
                     'WHERE '+
                     '  codigoaluno= :codigoaluno AND             '+
                     '  turma= :turma AND                         '+
                     '  anosemestre= :anosemestre AND             '+
                     '  serie = :serie AND                        '+
                     '  disciplina = :disciplina                  ';
                  qyAlterarFichaFalta.Close;
                  qyAlterarFichaFalta.ParamByName('codigoaluno').AsInteger:= tblMatriculasCodigoAluno.AsInteger;
                  qyAlterarFichaFalta.ParamByName('turma').AsString := txtTurma.Text;
                  qyAlterarFichaFalta.ParamByName('anosemestre').AsInteger := tblGradeAnoSemestre.AsInteger;
                  qyAlterarFichaFalta.ParamByName('serie').AsInteger := iSerie;
                  qyAlterarFichaFalta.ParamByName('disciplina').AsInteger := tblGradeDisciplina.AsInteger;
                  qyAlterarFichaFalta.ExecSQL;

                 // Define mensagem do log
                 sAux := 'Ajuste de Matrícula - Incluiu disciplina: ' + tblGradeDescricao.AsString + sAuxOpt;

                 // Verifica se a disciplina possui grupo de atividade criado
                 qyPossuiGruposAtividades.SQL.Text := SQL_POSSUI_GRUPOS_ATIVIDADE;

                 qyPossuiGruposAtividades.Close;
                 qyPossuiGruposAtividades.ParamByName('nr_anosemestre').AsInteger := DM.tblFichaIndividualAnoSemestre.AsInteger;
                 qyPossuiGruposAtividades.ParamByName('cd_curso').AsString := DM.tblFichaIndividualCurso.AsString;
                 qyPossuiGruposAtividades.ParamByName('cd_turma').AsString := DM.tblFichaIndividualTurma.AsString;
                 qyPossuiGruposAtividades.ParamByName('cd_disciplina').AsInteger := DM.tblFichaIndividualDisciplina.AsInteger;
                 qyPossuiGruposAtividades.Open;

                 // Aluno vinculado a grupos de atividades (nessa matrícula)
                 if not qyPossuiGruposAtividades.Eof then
                 begin
                    // Avisa o usuário que ele está adicionando uma disciplina com grupo de atividade
                    Mensagem('Você matriculou uma disciplina para o aluno que estava relacionada um grupo de atividade, é necessário incluir o aluno ao grupo de atividade vinculado através da tela de Cadastros > Grupos de Atividades Práticas.', 'Informação', MB_OK + MB_ICONINFORMATION );
                 end;
              end
              else
              begin
                 // Guarda a turma de onde o aluno já tinha a matricula
                 turma_antiga := qyAlterarDiscExistente.FieldByName('turmamatricula').AsString;
                 
                 qyAlterarDiscExistente.Edit();
                 if tblMatriculasSituacao.AsInteger = 10 then begin
                    qyAlterarDiscExistente.FieldByName('situacao').AsInteger := 10;  // Reserva
                 end
                 else begin
                    qyAlterarDiscExistente.FieldByName('situacao').AsInteger := 1;   // Cursando
                 end;
                 qyAlterarDiscExistente.FieldByName('turmamatricula').AsString := tblMatriculasTurma.AsString;
                 qyAlterarDiscExistente.Post();
                 
                 // Define mensagem do log                 
                 sAux := 'Ajuste de Matrícula - Alterou disciplina: ' + tblGradeDescricao.AsString+' ( de '+turma_antiga+' para '+tblMatriculasTurma.AsString+')';
              end;

              DM.callProcedure('CALL INICIAR_MATRICULA ( ' +
                 DM.tblFichaIndividualAnoSemestre.AsString + ', ' +
                 QuotedStr(DM.tblFichaIndividualTurma.AsString) + ', ' +
                 DM.tblFichaIndividualDisciplina.AsString + ', ' +
                 DM.tblFichaIndividualCodigoAluno.AsString + ')',
                 False
              );

              total_creditos := total_creditos + grd.DataSource.DataSet.FieldByName('NumeroAulas').AsInteger;

              // Gravar Ação da Mudança
              sChave := tblMatriculasCodigoAluno.AsString + ';' + txtTurma.Text + ';' + IntToStr(tblGradeDisciplina.AsInteger);

              DM.setLog(1033, 'Inclusao', sChave, dm.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger), sAux );
          end;

        end;
      end;

      if total_creditos > 0 then begin
         DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString,
                                             tblMatriculasAnoSemestre.AsInteger);
      end;

      except
      	  Mensagem( 'Ocorreu um erro ao matricular a disciplina. Verifique se a estudante já tem a disciplina matriculada. Caso contrário contate o suporte técnico.', Application.Title, MB_OK + MB_ICONSTOP );
      end;

      lugar := tblMatriculas.GetBookmark;
      tblMatriculas.Close;
      tblMatriculas.Open;
      tblMatriculas.GotoBookmark(Lugar);

      tblFichaIndividual.Close;
      tblFichaIndividual.Open;

      tblResumoFicha.Close();
      tblResumoFicha.Open();

    end;
  end;
end;

procedure TfrmMatriculas.matricularVariasDisciplinas;

   { Verifica a disponibilidade de vagas para as turmas/disciplinas selecionadas
   }
   function VerificaVagas(nr_anosemestre: Integer; cd_turma: String; cd_disciplina, totalAlunosMatricular: Integer): boolean;
   const
      S_SQL_LOTACAO =
         'SELECT '+
            'fi.anosemestre nr_anosemestre,'+
            'fi.turma cd_turma,'+
            'fi.disciplina cd_disciplina,'+
            'fi.curso cd_curso,'+
            't.sn_bloquear_vagas,'+
            't.vagas nr_vagas,'+
            'd.descricao ds_disciplina,'+
            'COUNT(*) nr_matriculados '+
         'FROM '+
            'fichaindividual fi '+
               'JOIN situacao s ON '+
                  '(fi.situacao = s.cd_situacao) '+
               'JOIN turmas t ON '+
                  '(fi.turma = t.codigo) AND '+
                  '(fi.anosemestre = t.anosemestre) '+
               'JOIN disciplinas d ON '+
                  '(fi.disciplina = d.codigo) AND '+
                  '(fi.curso = d.curso) '+
         'WHERE '+
            's.cd_situacao_pai NOT IN (3, 4, 5, 6, 7, 8) AND '+
            'fi.turma LIKE :cd_turma AND '+
            'fi.anosemestre LIKE :nr_anosemestre AND '+
            'fi.disciplina LIKE :cd_disciplina AND '+
            't.sn_bloquear_vagas = 2 '+
         'GROUP BY '+
            'fi.turma,'+
            'fi.disciplina,'+
            'fi.anosemestre';

      S_MSG_DISCIPLINAS =
         'Os alunos não podem ser matriculados na turma/disciplina, '+
         'pois não existem vagas suficientes para o total de alunos selecionados.' + #13 +
         'Total de vagas restantes: %d' + #13 +
         'Total de alunos selecionados: %d';
   var
      vagasRestantes: Integer;
   begin
      Result := true;

      qryTurmasLotacaoVagas.Close;
      qryTurmasLotacaoVagas.SQL.Text := S_SQL_LOTACAO;
      qryTurmasLotacaoVagas.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      qryTurmasLotacaoVagas.ParamByName('cd_turma').AsString := cd_turma;
      qryTurmasLotacaoVagas.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      qryTurmasLotacaoVagas.Open;
      if not qryTurmasLotacaoVagas.IsEmpty then
      begin
         if (totalAlunosMatricular+qryTurmasLotacaoVagasnr_matriculados.AsInteger) >= qryTurmasLotacaoVagasnr_vagas.AsInteger then
         begin
            vagasRestantes := qryTurmasLotacaoVagasnr_vagas.AsInteger - qryTurmasLotacaoVagasnr_matriculados.AsInteger;
            if vagasRestantes < 0 then
            begin
               vagasRestantes := 0;
            end;           

            Mensagem(Format(S_MSG_DISCIPLINAS, [vagasRestantes, totalAlunosMatricular]), 'Atenção', MB_ICONWARNING);
            Result := false;
         end;
      end;
   end;

const
   SQL_POSSUI_GRUPOS_ATIVIDADE = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.cd_disciplina = :cd_disciplina AND '+
                                 '	dg.sn_ativo = 1';

   SQL_SITUACAO_MATRICULA = 'SELECT '+
                            '  situacao '+
                            'FROM '+
                            '  matriculas '+
                            'WHERE '+
                            '	anosemestre = :nr_anosemestre AND '+
                            '	turma LIKE :cd_turma AND '+
                            '	codigoaluno = :cd_pessoa';

   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível realizar alterações na matrícula que implicam em ajustes nos créditos acadêmicos.';
var
  lugar : pointer;
  qySituacaoMatricula, qyAlterarFichaFalta: TUMZQuery;
  i, iAnosemestreSel, iDisciplina, iPessoa, iSerie, iGrau,cdFicha: Integer;
  slNenhumTituloEncontrado, slNovoTituloGerado, slSemTituloPendente, slAlunosMatricular: TStringList;
  sTurmaSel, sDisciplina, sCurso, mensagemGeralAjusteCreditos, sChave, sMsg: String;
  retornoAjusteAluno: TAvisosRecalculoCreditos;
  parametros: TParamsIni;
  dNrCreditos: Double;
  bSucesso: Boolean;
begin

   if not DM.UsuarioLogado.TemPermissao( 1033, npIncluir, True ) then Exit;

   // Inicia os TStringList
   slNenhumTituloEncontrado := TStringList.Create;
   slNovoTituloGerado := TStringList.Create;
   slSemTituloPendente := TStringList.Create;
   slAlunosMatricular := TStringList.Create;

   frmMatriculaDiscMassa.iAnoSemestre := tblMatriculasAnoSemestre.AsInteger;
   frmMatriculaDiscMassa.setTurma(tblMatriculasTurma.AsString);
//   frmMatriculaDiscMassa.turmaAluno := tblMatriculasTurma.AsString;

   if frmMatriculaDiscMassa.ShowModal <> mrOk then Exit;

   iAnosemestreSel := frmMatriculaDiscMassa.iAnoSemestre;
   sTurmaSel := frmMatriculaDiscMassa.getTurmaSelecionada();
   iDisciplina := frmMatriculaDiscMassa.getDisciplinaSelecionada();
   sDisciplina := frmMatriculaDiscMassa.getDescDisciplinaSelecionada();
   slAlunosMatricular := frmMatriculaDiscMassa.getAlunosSelecionados();
   iSerie := frmMatriculaDiscMassa.getSerie();
   iGrau := frmMatriculaDiscMassa.getGrau();
   sCurso := frmMatriculaDiscMassa.getCurso();
   dNrCreditos := frmMatriculaDiscMassa.getNrCreditos();

   if slAlunosMatricular.Count = 0 then Exit;

   // Montar a Mensagem;
   sMsg := 'Você está tentando matricular uma disciplina para vários estudantes, este procedimento pode efetuar alterações no financeiro dos estudantes.' + CHR(13) + CHR(13);
   sMsg := sMsg + 'Deseja continuar? ';

   if not (Mensagem( sMsg , 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = ID_YES) or
      not VerificaVagas(iAnosemestreSel, sTurmaSel, iDisciplina, slAlunosMatricular.Count) then Exit;

   try
      bSucesso := True;

      DM.CriarConsulta(qySituacaoMatricula);
      qySituacaoMatricula.SQL.Text := SQL_SITUACAO_MATRICULA;

      for i := 0 to slAlunosMatricular.Count - 1 do
      begin
         iPessoa := StrToInt(slAlunosMatricular[i]);

         // Busca a situação da matricula do aluno que esta sendo varrido, será a situação incluída nas fichaindividuais
         qySituacaoMatricula.Close;
         qySituacaoMatricula.ParamByName('nr_anosemestre').AsInteger := iAnosemestreSel;
         qySituacaoMatricula.ParamByName('cd_turma').AsString := tblMatriculasTurma.AsString;
         qySituacaoMatricula.ParamByName('cd_pessoa').AsInteger := iPessoa;
         qySituacaoMatricula.Open;

         DM.tblFichaIndividual.Close;
         DM.tblFichaIndividual.SQL.Clear;
         DM.tblFichaIndividual.SQL.Add( 'SELECT * FROM fichaindividual WHERE ' );
         DM.tblFichaIndividual.SQL.Add( 'codigoaluno = :codigoaluno AND ' );
         DM.tblFichaIndividual.SQL.Add( 'turmamatricula = :turma AND ' );
         DM.tblFichaIndividual.SQL.Add( 'anosemestre = :anosemestre' );
         DM.tblFichaIndividual.ParamByName('codigoaluno').AsInteger := iPessoa;
         DM.tblFichaIndividual.ParamByName('turma').AsString := tblMatriculasTurma.AsString;
         DM.tblFichaIndividual.ParamByName('anosemestre').AsInteger := iAnosemestreSel;
         DM.tblFichaIndividual.Open();

         DM.tblFichaIndividual.Append;

         DM.tblFichaIndividualCodigoAluno.AsInteger := iPessoa;
         DM.tblFichaIndividualTurma.AsString := sTurmaSel;
         DM.tblFichaIndividualTurmaMatricula.AsString := tblMatriculasTurma.AsString;
         DM.tblFichaIndividualAnoSemestre.AsInteger := iAnosemestreSel;
         DM.tblFichaIndividualGrau.AsInteger := iGrau;
         DM.tblFichaIndividualSerie.AsInteger := iSerie;

         if qySituacaoMatricula.FieldByName('situacao').AsInteger = 10 then begin
           DM.tblFichaIndividualSituacao.AsInteger := 10;  // Reserva
         end else begin
           DM.tblFichaIndividualSituacao.AsInteger := 1;   // Cursando
         end;

         DM.tblFichaIndividualDisciplina.AsInteger := iDisciplina;
         DM.tblFichaIndividualCurso.AsString := sCurso;
         DM.tblFichaIndividual.Post;

         {Foi gerado esse update para setar as faltas com o valor null
         para nao gerar alterações na media do aluno
        }
         DM.CriarConsulta(qyAlterarFichaFalta);

         // retorna o id da ultima ficha inserida
         //cdFicha :=  DM.LastInsert();

         qyAlterarFichaFalta.SQL.Text :=
            'UPDATE                '+
            '    fichaindividual   '+
            'SET'+
            '    falta1 = NULL, '+
            '    falta2 = NULL, '+
            '    falta3 = NULL, '+
            '    falta4 = NULL, '+
            '    falta5 = NULL, '+
            '    falta6 = NULL, '+
            '    falta7 = NULL, '+
            '    falta8 = NULL, '+
            '    falta9 = NULL, '+
            '    falta10 = NULL '+
            'WHERE '+
            '  codigoaluno= :codigoaluno AND             '+
            '  turma= :turma AND                         '+
            '  anosemestre= :anosemestre AND             '+
            '  serie = :serie AND                        '+
            '  disciplina = :disciplina                  ';
         qyAlterarFichaFalta.Close;
         qyAlterarFichaFalta.ParamByName('codigoaluno').AsInteger:= iPessoa;
         qyAlterarFichaFalta.ParamByName('turma').AsString := sTurmaSel;
         qyAlterarFichaFalta.ParamByName('anosemestre').AsInteger := iAnosemestreSel;
         qyAlterarFichaFalta.ParamByName('serie').AsInteger := iSerie;
         qyAlterarFichaFalta.ParamByName('disciplina').AsInteger := iDisciplina;
         qyAlterarFichaFalta.ExecSQL;

         DM.callProcedure('CALL INICIAR_MATRICULA( ' +
            IntToStr(iAnosemestreSel) + ', ' +
            QuotedStr(sTurmaSel) + ', ' +
            IntToStr(iDisciplina) + ', ' +
            IntToStr(iPessoa) + ')',
            False
         );

         // Gravar Ação da Mudança
         sChave := IntToStr(iPessoa) + ';' + sTurmaSel + ';' + IntToStr(iDisciplina);
         DM.setLog(1033, 'Inclusao', sChave, DM.getColigadaByTurma(tblMatriculasTurma.AsString, iAnosemestreSel), ('Ajuste de Matrícula - Incluiu disciplina: '+sDisciplina) );

         if dNrCreditos > 0 then
         begin
            retornoAjusteAluno := Dm.recalcular_creditos_financeiros(
                                       iPessoa,
                                       tblMatriculasTurma.AsString,
                                       iAnosemestreSel,
                                       false,
                                       false,
                                       false
                                  );

            if retornoAjusteAluno = NenhumTituloEncontrado then
            begin
               slNenhumTituloEncontrado.Add(IntToStr(iPessoa));
            end else if retornoAjusteAluno = NovoTituloGerado then
            begin
               slNovoTituloGerado.Add(IntToStr(iPessoa));
            end else if retornoAjusteAluno = SemTituloPendente then
            begin
               slSemTituloPendente.Add(IntToStr(iPessoa));
            end;
         end;
      end;

   except
      bSucesso := False;
      Mensagem( 'Ocorreu um erro ao matricular a disciplina. Verifique se a estudante já tem a disciplina matriculada. Caso contrário contate o suporte técnico.', Application.Title, MB_OK + MB_ICONSTOP );
   end;

   if bSucesso then
   begin
      // Verifica se a disciplina possui grupo de atividade criado
      qyPossuiGruposAtividades.SQL.Text := SQL_POSSUI_GRUPOS_ATIVIDADE;

      qyPossuiGruposAtividades.Close;
      qyPossuiGruposAtividades.ParamByName('nr_anosemestre').AsInteger := iAnosemestreSel;
      qyPossuiGruposAtividades.ParamByName('cd_curso').AsString := sCurso;
      qyPossuiGruposAtividades.ParamByName('cd_turma').AsString := sTurmaSel;
      qyPossuiGruposAtividades.ParamByName('cd_disciplina').AsInteger := iDisciplina;
      qyPossuiGruposAtividades.Open;

      // Aluno vinculado a grupos de atividades (nessa matrícula)
      if not qyPossuiGruposAtividades.Eof then
      begin
         // Avisa o usuário que ele está adicionando uma disciplina com grupo de atividade
         Mensagem('Você matriculou uma disciplina para os alunos selecionados que estava relacionada um grupo de atividade, é necessário incluir os alunos aos grupos de atividades, através da tela de Cadastros > Grupos de Atividades Práticas.', 'Informação', MB_OK + MB_ICONINFORMATION );
      end;

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

   lugar := tblMatriculas.GetBookmark;
   tblMatriculas.Close;
   tblMatriculas.Open;
   tblMatriculas.GotoBookmark(Lugar);

   tblFichaIndividual.Close;
   tblFichaIndividual.Open;

   tblResumoFicha.Close();
   tblResumoFicha.Open();

end;

procedure TfrmMatriculas.menuAdicionarDisciplinaAlunoClick(Sender: TObject);
begin
   matricularDisciplina;
end;

procedure TfrmMatriculas.menuAdicionarDisciplinaVariosAlunosClick(Sender: TObject);
begin
   matricularVariasDisciplinas;
end;

procedure TfrmMatriculas.removerDisciplina;
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível realizar alterações na matrícula que implicam em ajustes nos créditos acadêmicos.';
var
  sMsg : String;
  sChave, sAux, observacao : String;
begin
  if not DM.UsuarioLogado.TemPermissao( 1033, npExcluir, True ) then Exit;

   // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
   // cadastrados no programa bolsa FIES está habilitada.
   // Se estiver habilitado, verifica se o usuário possui permissão para
   // alterar os créditos mesmo com o bloqueio habilitado.

   if DM.IsAlunoFIES(tblMatriculasCODIGOALUNO.AsInteger) and
      FBloqueiaCreditosAlunosFIES then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
      begin
         if MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
         begin
            Exit;
         end;
      end
      else
      begin
         MessageDlg(SMsgBloqueio, mtInformation, [mbOK], -1);
         Exit;
      end;
   end;

  if ( tblFichaIndividualsn_final.AsInteger = 1 ) AND
     (NOT DM.UsuarioLogado.TemPermissao(1033, npEspecial, True))
  then
  begin
     Exit;
  end;

  sMsg := sMsg + 'Você está tentando remover disciplinas para o estudante:' + CHR(13);
  sMsg := sMsg + tblMatriculasNome.AsString + CHR(13) + CHR(13);
  sMsg := sMsg + 'Todas as informações de notas e freqüência serão excluídas.' + CHR(13) ;

  if TemMensalidadeComCredito(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger) then begin

       sMsg := sMsg + 'Este procedimento também poderá efetuar alterações no financeiro.' + CHR(13) + CHR(13);

  end;
  
  sMsg := sMsg + 'Deseja continuar? ';


  if Mensagem( sMsg, 'Confirmação: ', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION ) = ID_NO then Exit;

  Dm.qAux1.Close;
  DM.qAux1.SQL.Clear();
  Dm.qAux1.SQL.Add(' DELETE FROM fichaindividual_optativas ');
  Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre AND disciplina = :disciplina ');
  Dm.qAux1.ParamByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
  Dm.qAux1.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
  Dm.qAux1.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
  Dm.qAux1.ParamByName('disciplina').AsInteger := tblFichaIndividualDisciplina.AsInteger;
  Dm.qAux1.ExecSQL;


  DM.tblFichaIndividual.Close;
  DM.tblFichaIndividual.SQL.Clear;
  DM.tblFichaIndividual.SQL.Add( 'select * from FichaIndividual where' );
  DM.tblFichaIndividual.SQL.Add( 'CodigoAluno = :CodigoAluno and' );
  DM.tblFichaIndividual.SQL.Add( 'Turma = :Turma and' );
  DM.tblFichaIndividual.SQL.Add( 'AnoSemestre = :AnoSemestre and' );
  DM.tblFichaIndividual.SQL.Add( 'Disciplina = :CodigoDisciplina' );
//  DM.tblFichaIndividual.SQL.Add( 'CodigoGrade = :CodigoGrade' );
  DM.tblFichaIndividual.ParamByName('CodigoAluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
  DM.tblFichaIndividual.ParamByName('Turma').AsString := tblFichaIndividualTurma.AsString;
  DM.tblFichaIndividual.ParamByName('AnoSemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
  DM.tblFichaIndividual.ParamByName('CodigoDisciplina').AsInteger := tblFichaIndividualDisciplina.AsInteger;
//  DM.tblFichaIndividual.ParamByName('CodigoGrade').AsString := tblFichaIndividualCodigoGrade.AsString;
  DM.tblFichaIndividual.Open;

  DM.DeptoCursoTurma(tblFichaIndividualAnoSemestre.AsInteger, tblFichaIndividualTurma.AsString);

  { Pegar o número de Créditos da Disciplina }
  DM.tblGrade.Close;
  DM.tblGrade.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
  DM.tblGrade.ParamByName('Curso').AsString  := Dm.tblDeptoCursoTurmaCurso.AsString;
  DM.tblGrade.ParamByName('Serie').AsInteger :=  Dm.tblDeptoCursoTurmaSerie.AsInteger;
  DM.tblGrade.ParamByName('Turno').AsString  := DM.tblDeptoCursoTurmaTurno.AsString;
  DM.tblGrade.ParamByName('Disciplina').AsInteger := tblFichaIndividualDisciplina.AsInteger;
  Dm.tblGrade.Open;

  // Gravar Ação da Mudança
  sChave := IntToStr(tblFichaIndividualCodigoAluno.AsInteger) + ';' + tblFichaIndividualTurma.AsString + ';' + IntToStr(tblFichaIndividualDisciplina.AsInteger);
  sAux := 'Ajuste de Matrícula - Retirou disciplina: ' + tblFichaIndividualDescricao.AsString;
  DM.setLog(1033, 'Exclusao', sChave, dm.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger), sAux );

   // Disciplina do aluno possui grupo de atividade
   if tblFichaIndividual.FieldByName('cd_grupo').AsString > '0' then
   begin

      observacao := 'Disciplina do estudante '+tblFichaIndividualCodigoAluno.AsString+' - "'+tblMatriculasNome.AsString+'" foi removida, portanto o estudante foi inativado no grupo '+
                    tblFichaIndividual.FieldByName('cd_grupo').AsString+' - "'+tblFichaIndividual.FieldByName('nm_grupo').AsString+'" [disciplina: '+tblFichaIndividualDescricaoDisciplina.AsString+'] '+
                    'na data '+FormatDateTime('dd/mm/yyyy', DataHoje);

      Self.inativaGrupo(
         tblFichaIndividualCodigoAluno.AsInteger,
         strtoint(tblFichaIndividual.FieldByName('cd_grupo').AsString),
         DM.DataAtual,
         observacao
      );
   end;

  DM.tblFichaIndividual.Delete;

  tblFichaIndividual.Close;
  tblFichaIndividual.Open;

  tblResumoFicha.Close();
  tblResumoFicha.Open();

  DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger, true, true);

end;

procedure TfrmMatriculas.removerVariasDisciplinas;
const
   SQL_GRUPO_ATIVIDADE = ' SELECT '+
                         '   dg.cd_grupo, dg.nm_grupo, p.nm_pessoa '+
                         ' FROM '+
                         '  	diario_grupos dg '+
                         '  	INNER JOIN diario_grupos_pessoas dgp ON (dgp.cd_grupo = dg.cd_grupo) '+
                         '  	INNER JOIN pessoas p ON (p.cd_pessoa = dgp.cd_pessoa) '+
                         ' WHERE '+
                         '  	dg.nr_anosemestre = :nr_anosemestre '+
                         '  	AND dg.cd_curso = :cd_curso '+
                         '  	AND dg.cd_turma = :cd_turma '+
                         '  	AND dg.cd_disciplina = :cd_disciplina '+
                         '  	AND dg.sn_ativo = 1 '+
                         '  	AND dgp.cd_pessoa = :cd_pessoa '+
                         '  	AND dgp.dt_saida IS NULL';
var
   qyGrupoAtividade: TUMZQuery;
   i, iAnosemestreSel, iDisciplina, iPessoa: Integer;
   slNenhumTituloEncontrado, slNovoTituloGerado, slSemTituloPendente, slAlunosRemover: TStringList;
   sTurmaSel, sDisciplina, sCurso, mensagemGeralAjusteCreditos, sChave, sMsg: String;
   retornoAjusteAluno: TAvisosRecalculoCreditos;
   parametros: TParamsIni;
   bSucesso, bUltimaDisciplinaAtivaAluno, bDisciplinaGrupoAtividade: Boolean;
begin
   if not DM.UsuarioLogado.TemPermissao( 1033, npExcluir, True ) then Exit;

   DM.CriarConsulta(qyGrupoAtividade);
   qyGrupoAtividade.SQL.Text := SQL_GRUPO_ATIVIDADE;

   // Inicia os TStringList
   slNenhumTituloEncontrado := TStringList.Create;
   slNovoTituloGerado := TStringList.Create;
   slSemTituloPendente := TStringList.Create;
   slAlunosRemover := TStringList.Create;

   frmRemoveDiscMassa.iAnoSemestre := tblMatriculasAnoSemestre.AsInteger;
   frmRemoveDiscMassa.setTurma(tblMatriculasTurma.AsString);

   if frmRemoveDiscMassa.ShowModal <> mrOk then Exit;

   iAnosemestreSel := frmRemoveDiscMassa.iAnoSemestre;
   sTurmaSel := frmRemoveDiscMassa.getTurmaSelecionada();
   iDisciplina := frmRemoveDiscMassa.getDisciplinaSelecionada();
   sDisciplina := frmRemoveDiscMassa.getDescDisciplinaSelecionada();
   slAlunosRemover := frmRemoveDiscMassa.getAlunosSelecionados();
   sCurso := frmRemoveDiscMassa.getCurso();

   if slAlunosRemover.Count = 0 then Exit;

   // Montar a Mensagem;
   sMsg := 'Você está tentando remover uma disciplina de vários estudantes, este procedimento pode efetuar alterações no financeiro dos estudantes.' + CHR(13) + CHR(13);
   sMsg := sMsg + 'Se essa ação for confirmada, todas as informações de notas e frequências do estudante serão excluídas.' + CHR(13) + CHR(13);
   sMsg := sMsg + 'Deseja continuar? ';

   if not (Mensagem( sMsg , 'Confirmação', MB_YESNO + MB_ICONQUESTION ) = ID_YES) then Exit;

   try
      bSucesso := True;

      bUltimaDisciplinaAtivaAluno := False;
      bDisciplinaGrupoAtividade := False;

      for i := 0 to slAlunosRemover.Count - 1 do
      begin
         iPessoa := StrToInt(slAlunosRemover[i]);

         // Verifica se é a última disciplina ativa do aluno, nesse caso não pode remover
         if (ClasseDisciplinas.IsUltimaDisciplinaAtiva(iAnosemestreSel, tblMatriculasTurma.AsString,
                  iDisciplina, iPessoa, sTurmaSel)) then
         begin
            bUltimaDisciplinaAtivaAluno := True;
            continue;
         end;

         // Remove essa disciplina de fichaindividual_optativas se ela for uma optativa
         DM.qAux1.Close;
         DM.qAux1.SQL.Clear();
         DM.qAux1.SQL.Add(' DELETE FROM fichaindividual_optativas ');
         DM.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND turma = :turma AND anosemestre = :anosemestre AND disciplina = :disciplina ');
         DM.qAux1.ParamByName('codigoaluno').AsInteger := iPessoa;
         DM.qAux1.ParamByName('turma').AsString := sTurmaSel;
         DM.qAux1.ParamByName('anosemestre').AsInteger := iAnosemestreSel;
         DM.qAux1.ParamByName('disciplina').AsInteger := iDisciplina;
         DM.qAux1.ExecSQL;

         DM.tblFichaIndividual.Close;
         DM.tblFichaIndividual.SQL.Clear;
         DM.tblFichaIndividual.SQL.Add( 'SELECT * FROM fichaindividual WHERE ' );
         DM.tblFichaIndividual.SQL.Add( 'codigoaluno = :codigoaluno AND ' );
         DM.tblFichaIndividual.SQL.Add( 'turma = :turma AND ' );
         DM.tblFichaIndividual.SQL.Add( 'anosemestre = :anosemestre AND ' );
         DM.tblFichaIndividual.SQL.Add( 'disciplina = :codigodisciplina' );
         DM.tblFichaIndividual.ParamByName('codigoaluno').AsInteger := iPessoa;
         DM.tblFichaIndividual.ParamByName('turma').AsString := sTurmaSel;
         DM.tblFichaIndividual.ParamByName('anosemestre').AsInteger := iAnosemestreSel;
         DM.tblFichaIndividual.ParamByName('codigodisciplina').AsInteger := iDisciplina;
         DM.tblFichaIndividual.Open;

         DM.DeptoCursoTurma(iAnosemestreSel, sTurmaSel);

         { Pegar o número de Créditos da Disciplina }
         DM.tblGrade.Close;
         DM.tblGrade.ParamByName('anosemestre').AsInteger := iAnosemestreSel;
         DM.tblGrade.ParamByName('Curso').AsString  := Dm.tblDeptoCursoTurmaCurso.AsString;
         DM.tblGrade.ParamByName('Serie').AsInteger :=  Dm.tblDeptoCursoTurmaSerie.AsInteger;
         DM.tblGrade.ParamByName('Turno').AsString  := DM.tblDeptoCursoTurmaTurno.AsString;
         DM.tblGrade.ParamByName('Disciplina').AsInteger := iDisciplina;
         DM.tblGrade.Open;

         // Gravar Ação da Mudança
         sChave := IntToStr(iPessoa) + ';' + sTurmaSel + ';' + IntToStr(iDisciplina);
         DM.setLog(1033, 'Exclusao', sChave, DM.getColigadaByTurma( tblMatriculasTurma.AsString, iAnosemestreSel), ('Ajuste de Matrícula - Retirou disciplina: ' + sDisciplina) );

         qyGrupoAtividade.Close;
         qyGrupoAtividade.ParamByName('nr_anosemestre').AsInteger := iAnosemestreSel;
         qyGrupoAtividade.ParamByName('cd_curso').AsString := sCurso;
         qyGrupoAtividade.ParamByName('cd_turma').AsString := sTurmaSel;
         qyGrupoAtividade.ParamByName('cd_disciplina').AsInteger := iDisciplina;
         qyGrupoAtividade.ParamByName('cd_pessoa').AsInteger := iPessoa;
         qyGrupoAtividade.Open;

         // Disciplina do aluno possui grupo de atividade
         if qyGrupoAtividade.FieldByName('cd_grupo').AsInteger > 0 then
         begin
            bDisciplinaGrupoAtividade := True;

            sMsg := 'Disciplina do estudante '+IntToStr(iPessoa)+' - "'+qyGrupoAtividade.FieldByName('nm_pessoa').AsString+'" foi removida, portanto o estudante foi inativado no grupo '+
                    qyGrupoAtividade.FieldByName('cd_grupo').AsString+' - "'+qyGrupoAtividade.FieldByName('nm_grupo').AsString+'" [disciplina: '+sDisciplina+'] '+
                    'na data '+FormatDateTime('dd/mm/yyyy', DataHoje);

            Self.inativaGrupo(
               iPessoa,
               qyGrupoAtividade.FieldByName('cd_grupo').AsInteger,
               DM.DataAtual,
               sMsg
            );
         end;

         // Remove a disciplina da fichaindividual do aluno 
         DM.tblFichaIndividual.Delete;

         retornoAjusteAluno := Dm.recalcular_creditos_financeiros(
                                    iPessoa,
                                    tblMatriculasTurma.AsString,
                                    iAnosemestreSel,
                                    false,
                                    false,
                                    false
                               );

         if retornoAjusteAluno = NenhumTituloEncontrado then
         begin
            slNenhumTituloEncontrado.Add(IntToStr(iPessoa));
         end else if retornoAjusteAluno = NovoTituloGerado then
         begin
            slNovoTituloGerado.Add(IntToStr(iPessoa));
         end else if retornoAjusteAluno = SemTituloPendente then
         begin
            slSemTituloPendente.Add(IntToStr(iPessoa));
         end;

      end;
   except
      bSucesso := False;
      Mensagem( 'Ocorreu um erro inesperado ao remover a disciplina.', Application.Title, MB_OK + MB_ICONSTOP );
   end;

   if bSucesso then
   begin

      // Avisa usuário caso não pode remover algumas disciplinas que era a última ativa do aluno
      if bUltimaDisciplinaAtivaAluno then
      begin
         Mensagem('Para alguns alunos a disciplina removida era a única que estava ativa na turma. Não foi possível remover a disciplina desses alunos, você deve cancelar manualmente a disciplina para isso utilize a opção de ajuste da situação da turma.',
            Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      end;

      // Avisa o usuário que ele está removendo uma disciplina com grupo de atividade      
      if bDisciplinaGrupoAtividade then
      begin
         Mensagem('Você removeu uma disciplina que estava relacionada um grupo de atividade, os alunos foram inativados nesse grupo.', 'Informação', MB_OK + MB_ICONINFORMATION );
      end;

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

   tblFichaIndividual.Close;
   tblFichaIndividual.Open;

   tblResumoFicha.Close();
   tblResumoFicha.Open();

end;

procedure TfrmMatriculas.FormDestroy(Sender: TObject);
begin
  // Libera os filtros utilizados para apresentação de informação de poup-up
  frmMatriculas := nil;
  FreeAndNil(formTransferenciaDeTurma);
end;


procedure TfrmMatriculas.btnMatricularGradeClick(Sender: TObject);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível realizar alterações na matrícula que implicam em ajustes nos créditos acadêmicos.';
var
   AnoSemestre: Integer;
   alunosNaoPodem, Turma: String;
begin
   if DM.UsuarioLogado.TemPermissao(1033, npIncluir, True) then
   begin

      // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
      // cadastrados no programa bolsa FIES está habilitada.
      // Se estiver habilitado, verifica se o usuário possui permissão para
      // alterar os créditos mesmo com o bloqueio habilitado.

      if DM.IsAlunoFIES(tblMatriculasCODIGOALUNO.AsInteger) and
         FBloqueiaCreditosAlunosFIES then
      begin
         if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
         begin
            if MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
            begin
               Exit;
            end;
         end
         else
         begin
            MessageDlg(SMsgBloqueio, mtInformation, [mbOK], -1);
            Exit;
         end;
      end;
      
      Application.CreateForm(TfrmMatricularGrade, frmMatricularGrade);

      frmMatricularGrade.cursoFiltro := tblMatriculasCurso.AsString;
      frmMatricularGrade.gradeFiltro := tblMatriculascd_grade.AsString;
      frmMatricularGrade.turmaFiltro := tblMatriculasTurma.AsString;
      frmMatricularGrade.anoSemestre := tblMatriculasAnoSemestre.AsInteger;
      frmMatricularGrade.ShowModal;

      DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger);

      AnoSemestre := tblMatriculasAnoSemestre.AsInteger;
      Turma := tblMatriculasTurma.AsString;
      lngCodigoAluno := tblMatriculasCodigoAluno.AsInteger;

      tblMatriculas.DisableControls;
      tblMatriculas.Close;
      tblMatriculas.Open;
      tblMatriculas.Locate('CodigoAluno;Turma;AnoSemestre',
         VarArrayOf([lngCodigoAluno, Turma, AnoSemestre]), [loCaseInsensitive]
      );
      tblMatriculas.EnableControls;
   end;
end;

procedure TfrmMatriculas.btnMarcarClick(Sender: TObject);
Var lugar : Pointer;
begin
    if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;
    {
    - Verificar se foi selecionado algum aluno na tabela de Matriculas
    - Verificar se a linha selecionada na tblDoc possui um
    Código para o Aluno. Isso indica que o Documento já foi Adicionado
    na tabela de Documentos do Aluno.
    }
    if not tblMatriculas.EOF Then   { Existe algum aluno Selecionado }
    Begin
        { Inserir o Documento e Atualizar a consulta }
        qAux.SQL.Clear;
        qAux.SQL.Add('REPLACE INTO documentos_alunos (codigoaluno, cod_documento, apresentou, dt_entrega)');
        qAux.SQL.Add(' VALUES (:codigoaluno, :cod_documento, ''S'', now()) ');
        qAux.ParamByName('codigoaluno').Value := tblMatriculasCodigoAluno.Value;
        qAux.ParamByName('cod_documento').Value := tblDocCodigo.Value;
        qAux.ExecSQL;

        DM.setLog(1020, 'Alteracao', tblMatriculasCodigoAluno.AsString + ';' + tblDocCodigo.AsString, DM.getColigadaByTurma(tblMatriculas.fieldbyName('turma').AsString, tblMatriculasAnoSemestre.AsInteger), 'Marcou');

        {Se possui um cd_siga informado na tabela de documentos para o documento
        atual, será inserido um registro em siga_documentos para o módulo de
        controle de documentos}
        if tblDoccd_siga.AsInteger > 0 then
        begin
           registraDocumentoTabelaSiga(IntToStr(tblDocCodigo.Value), IntToStr(tblMatriculasCodigoAluno.Value));
        end;

        lugar := tblDoc.GetBookmark;
        tblDoc.Close;
        tblDoc.Open;
        tblDoc.GotoBookmark(lugar);        

        if tblMatriculasSituacao.AsInteger = 10 then
        Begin
           if (DM.Ativar_Matricula(tblMatriculas.FieldByName('codigoaluno').AsInteger,
                               tblMatriculas.fieldbyName('turma').AsString,
                               tblMatriculas.FieldByName('anosemestre').AsInteger, false, true)) = 0
           then Begin
                  tblMatriculas.Close;
                  tblMatriculas.Open;
           end
        End;


    End
    Else
       Begin
          Mensagem('Nenhum aluno está selecionado!', 'Atenção', MB_OK + MB_ICONWARNING);
       End;
end;

procedure TfrmMatriculas.btnDesmarcarClick(Sender: TObject);
Var Lugar : Pointer;
   msg : String;
   qyDocumentos: TUMZQuery;
begin
    if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;
    
    if not tblMatriculas.EOF Then   { Existe algum aluno Selecionado }
    Begin
	  { Inserir o Documento e Atualizar a consulta }
      msg:= 'Atenção' + CHR(13)+CHR(13)+
            'Você está tentando desmarcar a entrega do documento "' + tblDocDocumento.AsString + '"';

      if TRIM(tblDocdt_entrega.AsString) <> '' then begin
         msg := msg + ' entregue no dia "' + tblDocdt_entrega.DisplayText + '".';
      end;
      msg := msg + CHR(13) + CHR(13) + 'Tem certeza que deseja continuar?';

      if (tblDoccd_siga.AsInteger > 0) then
      begin

         DM.CriarConsulta(qyDocumentos);

         qyDocumentos.SQL.Text := ''+
         ' SELECT               '+
	      '    nr_codigo_siga    '+
         ' FROM                 '+
	      '    siga_documentos   '+
         ' WHERE                '+
	      '    cd_siga = :cd_siga';

         qyDocumentos.ParamByName('cd_siga').asInteger := tblDoccd_siga.AsInteger;
         qyDocumentos.Open;


         if (qyDocumentos.RecordCount > 0) then
         begin

            Mensagem(
               'Você está indicando que um documento recebido não está mais recebido.' + #10+#13 +
                  'Favor verificar o recebimento deste documento também no módulo de Documentação '+
                  'SIGA que está habilitado para a sua instituição.',
               'UNMIESTRE',
               MB_OK + MB_ICONWARNING + MB_DEFBUTTON3,
               Handle
            );

         end;

      end;

      if Mensagem(msg, 'UNIMESTRE', MB_YESNOCANCEL + MB_ICONWARNING + MB_DEFBUTTON3, Handle) = mrYes then begin

          qAux.SQL.Clear;
          qAux.SQL.Add('Update Documentos_Alunos Set Apresentou = ''N'', dt_entrega=NULL');
          qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
          qAux.ParamByName('ALUNO').Value := tblMatriculasCodigoAluno.Value;
          qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
          qAux.ExecSQL;

          DM.setLog(1020, 'Alteracao', tblMatriculasCodigoAluno.AsString + ';' + tblDocCodigo.AsString, dm.getColigadaByTurma(tblMatriculas.fieldbyName('turma').AsString, tblMatriculasAnoSemestre.AsInteger), 'Desmarcou');

          lugar := tblDoc.GetBookmark;
          tblDoc.Close;
          tblDoc.Open;
          tblDoc.GotoBookmark(lugar);

      end;


    End
    Else
       Begin
          Mensagem('Nenhum aluno está selecionado!', 'Atenção', MB_OK + MB_ICONWARNING);
       End;

end;

procedure TfrmMatriculas.btnImpDocClick(Sender: TObject);
var
   sSFormula: string;
   sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   sSFormula := '{dd.cd_pessoa}=' + frmMatriculas.tblMatriculasCodigoAluno.AsString;
   sSFormula := sSFormula + ' AND {dd.cd_documento}=' + frmMatriculas.tblDocCodigo.AsString;

   infoRelatorio := PrincipalForm.GetInfoRpt('relDocDigital');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sSFormula, '', nil, nil, nil, nil, True, False, nil, PodeExportar);
end;
procedure TfrmMatriculas.btnImprimirClick(Sender: TObject);
begin
//
end;

procedure TfrmMatriculas.btnObsDocClick(Sender: TObject);
Var Lugar : Pointer;
begin
    if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar , True) then Exit;
    
    if not tblMatriculas.EOF Then   { Existe algum aluno Selecionado }
    Begin
       if frmObsDoc = nil then
          Application.CreateForm(TfrmObSDoc, frmObSDoc);

       frmObsDoc.lbDoc.Caption := tblDocDocumento.Value;
       frmObSDoc.eDoc.Text := tblDocObservacao.Value;
       if frmObsDoc.ShowModal = mrOk Then  { Apresentar o form para digitar OBS. }
       Begin
          { Atualizar a Observação do Documento }
          qAux.SQL.Clear;
          qAux.SQL.Add('Update Documentos_Alunos Set Observacao = :OBS');
          qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
          qAux.ParamByName('ALUNO').Value := tblMatriculasCodigoAluno.Value;
          qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
          qAux.ParamByName('OBS').Value := frmObsDoc.eDoc.Text;
          qAux.ExecSQL;
          lugar := tblDoc.GetBookmark;
          tblDoc.Close;
          tblDoc.Open;
          tblDoc.GotoBookmark(lugar);
       End;

       frmObsDoc.Free;
       frmObsDoc := nil;
    End
    Else
       Begin
          Mensagem('Nenhum aluno está selecionado!', 'Anteção', MB_OK + MB_ICONWARNING);
       End;
end;

procedure TfrmMatriculas.btnObservacaoClick(Sender: TObject);
Var
   altera: Boolean;
   obs: String;   
begin
   if not DM.UsuarioLogado.TemPermissao( 1018, npAcesso, True ) then Exit;

   qryExtras.Close;
   qryExtras.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
   qryExtras.ParamByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
   qryExtras.ParamByName('disciplina').AsInteger := tblFichaIndividualdisciplina.AsInteger;
   qryExtras.ParamByName('serie').AsInteger := tblFichaIndividualSerie.AsInteger;
   qryExtras.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
   qryExtras.Open;

   obs := qryExtrasds_observacao.AsString;

   altera := InputQuery('UNIMESTRE', 'Digite a observação:', obs);

   if altera then
   begin  
      qryExtras.Edit;
      qryExtrasds_observacao.AsString := obs;
      qryExtras.FieldByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
      qryExtras.FieldByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
      qryExtras.FieldByName('disciplina').AsInteger := tblFichaIndividualdisciplina.AsInteger;
      qryExtras.FieldByName('serie').AsInteger := tblFichaIndividualSerie.AsInteger;
      qryExtras.FieldByName('turma').AsString := tblFichaIndividualTurma.AsString;
      qryExtras.Post;
   end;

end;

procedure TfrmMatriculas.DBGrid2CellClick(Column: TColumn);
var
   lugar: Pointer;
   qyAux: TUMZQuery;
begin
   if Column.FieldName = 'sn_possui_compl_calc' then
   begin
     DM.CriarConsulta(qyAux);

     qyAux.SQL.Text :=
                       'UPDATE                                            '+
                       '  fichaindividual                                 '+
                       'SET                                               '+
                       '  sn_possui_compl = :sn_possui_compl              '+
                       'WHERE                                             '+
                       '  anosemestre = :anosemestre AND                  '+
                       '  turma = :turma AND                              '+
                       '  curso = :curso AND                              '+
                       '  codigoaluno = :codigoaluno AND                  '+
                       '  disciplina = :disciplina AND                    '+
                       '  serie = :serie                                  ';

     if tblFichaIndividualsn_possui_compl.AsInteger = 1 then begin
        qyAux.ParamByName('sn_possui_compl').AsInteger := 0;
     end
     else
     begin
        qyAux.ParamByName('sn_possui_compl').AsInteger := 1;
     end;

     qyAux.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
     qyAux.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
     qyAux.ParamByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
     qyAux.ParamByName('disciplina').AsInteger := tblFichaIndividualdisciplina.AsInteger;
     qyAux.ParamByName('serie').AsInteger := tblFichaIndividualSerie.AsInteger;
     qyAux.ParamByName('curso').AsString := tblFichaIndividualCurso.AsString;
     qyAux.ExecSQL();

     lugar := tblFichaIndividual.GetBookmark();
     tblFichaIndividual.Close();
     tblFichaIndividual.Open();
     tblFichaIndividual.GotoBookmark(lugar);
   end
   else if Column.FieldName = 'sn_possui_adap_calc' then
   begin
     DM.CriarConsulta(qyAux);

     qyAux.SQL.Text :=
                       'UPDATE                                            '+
                       '  fichaindividual                                 '+
                       'SET                                               '+
                       '  sn_possui_adap = :sn_possui_adap              '+
                       'WHERE                                             '+
                       '  anosemestre = :anosemestre AND                  '+
                       '  turma = :turma AND                              '+
                       '  curso = :curso AND                              '+
                       '  codigoaluno = :codigoaluno AND                  '+
                       '  disciplina = :disciplina AND                    '+
                       '  serie = :serie                                  ';

     if tblFichaIndividualsn_possui_adap.AsInteger = 1 then begin
        qyAux.ParamByName('sn_possui_adap').AsInteger := 0;
     end
     else
     begin
        qyAux.ParamByName('sn_possui_adap').AsInteger := 1;
     end;

     qyAux.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
     qyAux.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
     qyAux.ParamByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
     qyAux.ParamByName('disciplina').AsInteger := tblFichaIndividualdisciplina.AsInteger;
     qyAux.ParamByName('serie').AsInteger := tblFichaIndividualSerie.AsInteger;
     qyAux.ParamByName('curso').AsString := tblFichaIndividualCurso.AsString;
     qyAux.ExecSQL();

     lugar := tblFichaIndividual.GetBookmark();
     tblFichaIndividual.Close();
     tblFichaIndividual.Open();
     tblFichaIndividual.GotoBookmark(lugar);
   end
   else if Column.FieldName = 'sn_possui_depen_calc' then
   begin
      DM.CriarConsulta(qyAux);

      qyAux.SQL.Text :=
                       'UPDATE                                            '+
                       '  fichaindividual                                 '+
                       'SET                                               '+
                       '  sn_possui_depen = :sn_possui_depen              '+
                       'WHERE                                             '+
                       '  anosemestre = :anosemestre AND                  '+
                       '  turma = :turma AND                              '+
                       '  curso = :curso AND                              '+
                       '  codigoaluno = :codigoaluno AND                  '+
                       '  disciplina = :disciplina AND                    '+
                       '  serie = :serie                                  ';

      if tblFichaIndividualsn_possui_depen.AsInteger = 1 then begin
         qyAux.ParamByName('sn_possui_depen').AsInteger := 0;
      end
      else
      begin
         qyAux.ParamByName('sn_possui_depen').AsInteger := 1;
      end;

      qyAux.ParamByName('anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
      qyAux.ParamByName('turma').AsString := tblFichaIndividualTurma.AsString;
      qyAux.ParamByName('codigoaluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
      qyAux.ParamByName('disciplina').AsInteger := tblFichaIndividualdisciplina.AsInteger;
      qyAux.ParamByName('serie').AsInteger := tblFichaIndividualSerie.AsInteger;
      qyAux.ParamByName('curso').AsString := tblFichaIndividualCurso.AsString;
      qyAux.ExecSQL();

      lugar := tblFichaIndividual.GetBookmark();
      tblFichaIndividual.Close();
      tblFichaIndividual.Open();
      tblFichaIndividual.GotoBookmark(lugar);
   end

end;

procedure TfrmMatriculas.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if DataCol = 6 then
   begin
     if not tblFichaIndividualNR_CR_FIN.IsNull then
      DBGrid2.Canvas.Brush.Color := clSkyBlue;

      DBGrid2.Canvas.FillRect(Rect);
      DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;

end;

procedure TfrmMatriculas.DBGrid4DblClick(Sender: TObject);
begin
    if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;
    {
    - Verificar se foi selecionado algum aluno na tabela de Matriculas
    - Verificar se a linha selecionada na tblDoc possui um
    Código para o Aluno. Isso indica que o Documento já foi Adicionado
    na tabela de Documentos do Aluno.
    }
    if not tblMatriculas.EOF Then   { Existe algum aluno Selecionado }
    Begin
	    if Dm.isTrue(tblDocApresentou.AsString) Then
         btnDesmarcarClick(Sender)
	    else
         btnMarcarClick(Sender);

    End
    Else
       Begin
          Mensagem('Nenhum aluno está selecionado!', 'Atenção', MB_OK + MB_ICONWARNING);
       End;
end;

procedure TfrmMatriculas.tblDocCalcFields(DataSet: TDataSet);
begin

   tblDocExiste.AsBoolean := DM.IsTrue(tblDoc.FieldByName('Apresentou').AsString);
   tblDocDigitalizou.AsBoolean := DM.IsTrue(tblDoc.FieldByName('sn_digitalizado').AsString);
end;

procedure TfrmMatriculas.btnAlunosClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      lngCodigoAluno := resultado_filtro.cd_pessoa;
      TipoFiltro := FiltroAluno;

      btnFiltroData.Marked := False;
      SpeedButton2.Marked := False;
      SpeedButton1.Marked := True;
      tbnBuscaDisciplina.Marked := False;

      btnMatricularGrade.Enabled := False;
      btnMatricularGrade.Hint := 'Para matricular a grade, você deve realizar um filtro por turma.';
      Filtrar();
   end;
end;

procedure TfrmMatriculas.btnTurmasClick(Sender: TObject);
begin
   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([]);
   
   if resultado_filtro_turma.filtrado then
   begin
      sFiltroCurso := resultado_filtro_turma.cd_curso;
      sFiltroTurma := resultado_filtro_turma.cd_turma;
      sFiltroAnosemestre := IntToStr( resultado_filtro_turma.nr_anosemestre );
      
      btnFiltroData.Marked := False;
      SpeedButton2.Marked := True;
      SpeedButton1.Marked := False;
      tbnBuscaDisciplina.Marked := False;
      
      TipoFiltro := FiltroTurma;
      btnMatricularGrade.Enabled := True;
      btnMatricularGrade.Hint := 'Matricular a grade para toda a turma';
      Filtrar();
   end;
end;

{ Busca de disciplinas }
procedure TfrmMatriculas.buscaDisciplina(Sender: TObject);
var
   slFiltros: TStringList;
begin
   FResultadoFiltroDisciplina := TfrmSelecionarDisciplina.Filtrar([]);

   if not FResultadoFiltroDisciplina.filtrado then Exit;

   btnFiltroData.Marked := False;
   SpeedButton2.Marked := False;
   SpeedButton1.Marked := False;
   tbnBuscaDisciplina.Marked := True;

   TipoFiltro := FiltroDisciplina;
   Filtrar;
   
   sFiltroAnosemestre   := IntToSTr(FResultadoFiltroDisciplina.nr_anosemestre);
   sFiltroDisciplina    := FResultadoFiltroDisciplina.cd_disciplina;
end;

procedure TfrmMatriculas.btnAlterarSituacaoMatriculasClick(
  Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   { Alterar Situação de Matrículas }

   if not DM.UsuarioLogado.TemPermissao( 1018, npAcesso, True ) then Exit;

   PosX := btnAlterarSituacaoMatriculas.Left + PrincipalForm.Left + 20;
   PosY := toolAlunos1.Top + PrincipalForm.Top;

   popSituacaoMatricula.Popup(PosX, PosY);
end;

procedure TfrmMatriculas.ReativarMatrculaCursando1Click(Sender: TObject);
const
   SQL_POSSUI_GRUPOS_ATIVIDADE = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.sn_ativo = 1';
var
   iCodPessoa, iColigada: Integer;
   chaves : String;
begin

   iCodPessoa := tblMatriculasCODIGOALUNO.AsInteger;
   iColigada  := DM.getColigadaByTurma(
                     tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger
                  );
   if tblMatriculasSituacao.AsInteger = 10 Then
      ConfirmarMatricula
   Else
   begin
      if Self.RegistraMotivo(1) then
         AtivarMatricula;
   end;

   // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
   qyPossuiGruposAtividades.SQL.Text := SQL_POSSUI_GRUPOS_ATIVIDADE;

   qyPossuiGruposAtividades.Close;
   qyPossuiGruposAtividades.ParamByName('nr_anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
   qyPossuiGruposAtividades.ParamByName('cd_curso').AsString := tblMatriculasCurso.AsString;
   qyPossuiGruposAtividades.ParamByName('cd_turma').AsString := tblMatriculasTurma.AsString;
   qyPossuiGruposAtividades.Open;

   // Grupo de atividade vinculado a disciplinas da matrícula
   if not qyPossuiGruposAtividades.Eof then
   begin
      // Avisa o usuário que ele está ativando a matrícula de um aluno que possui vinculos em disciplinas com grupos de atividades
      Mensagem('Você ativou a matrícula de um aluno que possui disciplinas com grupos de atividades. '+
               'Favor vincular este aluno a um grupo de atividade para que ele seja exibido no diário.'+#13+
               'Para vincular o aluno no grupo acesse a tela "Cadastros > Grupos de Atividades Práticas"', 'Informação', MB_OK + MB_ICONINFORMATION );
   end;

   DM.atualizarGruposPessoa(iCodPessoa, iColigada, true);

      //Gera Log da operação
   chaves := FillString(tblMatriculasCodigoAluno.AsString, alRight, '0', 10, true ) + ';' +
                tblMatriculasAnoSemestre.AsString + ';' +
                tblMatriculasTurma.AsString + ';';

   DM.setLog(1009, 'Alteração', chaves, Dm.getColigadaByTurma(tblMatriculasTurma.AsString,tblMatriculasAnoSemestre.AsInteger),
      'Efetuada a ativação da matrícula do aluno(a) ' + tblMatriculasCodigoAluno.AsString + ' na turma ' + tblMatriculasTurma.AsString + ' e no ano/semestre ' + tblMatriculasAnoSemestre.AsString );


   tblMatriculas.Close;
   tblMatriculas.Open;
end;

procedure TfrmMatriculas.registraDocumentoTabelaSiga( codDoc : String; aluno : String );
var
   qyDocumentos: TUMZQuery;
   cd_coligada, nr_codigo_siga_maior, nr_codigo_siga_atual, cd_local, cd_siga: Integer;
   me_observacao, ds_codigo_siga: String;

begin

   dm.CriarConsulta(qyDocumentos);

   {INICIO - BUSCA INFORMAÇÕES DE SIGA_TABELA}

   qyDocumentos.SQL.Text := ''+
   'SELECT '+
	'   doc.cd_siga AS cd_siga, '+
	'   st.cd_local AS cd_local, '+
   '   st.ds_codigo_siga AS ds_codigo_siga,  ' +
   '   st.me_observacao as me_observacao ' +
   ' FROM '+
	'    documentos doc '+
   ' INNER JOIN siga_tabela st ON (st.cd_siga = doc.cd_siga) '+
   ' WHERE '+
	'    codigo = :codigo ';
   
   qyDocumentos.ParamByName('codigo').asInteger := StrToInt(codDoc);
   qyDocumentos.Open;

   cd_siga := qyDocumentos.FieldByName('cd_siga').asInteger;
   cd_local := qyDocumentos.FieldByName('cd_local').asInteger;
   ds_codigo_siga := qyDocumentos.FieldByName('ds_codigo_siga').asString;
   me_observacao := qyDocumentos.FieldByName('me_observacao').asString;

   {FIM - BUSCA INFORMAÇÕES DE SIGA_TABELA}

   {INICIO - BUSCA PELO ATUAL NR_CODIGO_SIGA}

   qyDocumentos.SQL.Text := ''+
   ' SELECT                                   '+
	'    max(nr_codigo_siga) as nr_codigo_siga '+
   ' FROM                                     '+
	'    siga_documentos                       '+
   ' WHERE                                    '+
	'    cd_siga = :cd_siga                    ';

   qyDocumentos.ParamByName('cd_siga').asInteger := cd_siga;
   qyDocumentos.Open;

   nr_codigo_siga_atual := qyDocumentos.FieldByName('nr_codigo_siga').asInteger + 1;
   
   {FIM - BUSCA PELO ATUAL NR_CODIGO_SIGA}

   {INCIO - BUSCA CÓDIGO DA COLIGADA DO CURSO}

   qyDocumentos.SQL.Text := ' '+
   ' SELECT                   '+
   '     cd_coligada          '+
   ' FROM                     '+
   '     cursos_coligadas     '+
   ' WHERE                    '+
   '     cd_curso = :cd_curso ';

   qyDocumentos.ParamByName('cd_curso').AsString := tblMatriculascd_curso.AsString;
   qyDocumentos.Open;

   cd_coligada := qyDocumentos.FieldByName('cd_coligada').AsInteger;

   {FIM - BUSCA CÓDIGO DA COLIGADA DO CURSO}

   {INCIO - INSERE REGISTRO EM SIGA_DOCUMENTOS}
   qyDocumentos.SQL.Text := '     ' +
   'INSERT INTO siga_documentos ( ' +
   '    cd_documento,             ' +
   '    cd_uni_documento,         ' +
   '    cd_local,                 ' +
   '    cd_curso,                 ' +
   '    cd_siga,                  ' +
   '    cd_pessoa_cadastro,       ' +
   '    cd_pessoa_doc ,           ' +
   '    cd_pessoa_resp,           ' +
   '    cd_coligada,              ' +
   '    nr_codigo_siga,           ' + 
   '    ds_codigo_siga,           ' +
   '    me_descricao,             ' +
   '    dt_cadastro,              ' +
   '    cd_origem_documento       ' +
   ' )                            ' +
   ' VALUES                       ' +
   ' (                            ' +
   '    null,                     ' +
   '    :cd_documento ,           ' +
   '    :cd_local ,               ' +
   '    :cd_curso ,               ' +
   '    :cd_siga ,                ' +
   '    :cd_pessoa_cadastro ,     ' +
   '    :cd_pessoa_doc ,          ' +
   '    :cd_pessoa_resp ,         ' +
   '    :cd_coligada ,            ' +
   '    :nr_codigo_siga ,         ' +
   '    :ds_codigo_siga ,         ' +
   '    :me_descricao ,           ' +
   '    :dt_cadastro,             ' +
   '    2                         ' +
   ' );                           ' ;

   qyDocumentos.ParamByName('cd_documento').asInteger := StrToInt(codDoc);

   {Caso o registro siga do documento não possua um cd_local informado será
   informado nulo no campo, caso contrário será informado o cd_local normalmente}
   if cd_local <> 0 then
   begin
      qyDocumentos.ParamByName('cd_local').asInteger := cd_local;
   end
   else
   begin
      qyDocumentos.ParamByName('cd_local').Clear;
   end;

   qyDocumentos.ParamByName('cd_curso').asString := tblMatriculascd_curso.AsString;
   qyDocumentos.ParamByName('cd_siga').asInteger := cd_siga;
   qyDocumentos.ParamByName('cd_pessoa_cadastro').asInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
   qyDocumentos.ParamByName('cd_pessoa_doc').asInteger := tblMatriculasCODIGOALUNO.AsInteger; 
   qyDocumentos.ParamByName('cd_pessoa_resp').asInteger := DM.GetUsuarioLogado.Pessoa.Codigo;
   qyDocumentos.ParamByName('cd_coligada').asInteger := cd_coligada;
   qyDocumentos.ParamByName('nr_codigo_siga').asInteger := nr_codigo_siga_atual;
   qyDocumentos.ParamByName('ds_codigo_siga').asString := ds_codigo_siga + '.' + IntToStr(nr_codigo_siga_atual);
   qyDocumentos.ParamByName('me_descricao').asString := me_observacao;
   qyDocumentos.ParamByName('dt_cadastro').asString :=   FormatDateTime('YYYY-MM-DD HH:MM:SS', Now);

   qyDocumentos.ExecSQL;
   {FIM - INSERE REGISTRO EM SIGA_DOCUMENTOS}

end;

function TfrmMatriculas.RegistraMotivo(const AICodSituacao: integer): boolean;
begin
   Result :=
      TfRegistraMotivoMatricula.RegistraMotivoMatricula(
         Self.tblMatriculasCodigoAluno.AsInteger, AICodSituacao,
         Self.tblMatriculasAnoSemestre.AsInteger,
         Self.tblMatriculasNome.AsString,
         Self.tblMatriculasCurso.AsString,
         Self.tblMatriculasTurma.AsString, Self);
end;

procedure TfrmMatriculas.CadastrodeAlunos1Click(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then Exit;

   if (DM.variavel_parametro('sn_africa') = 'S') then begin
      if not PrincipalForm.ProcuraForm( TForm(fAlunosAfrica) ) then
      begin
         Application.CreateForm( TfAlunosAfrica, fAlunosAfrica );
         fAlunosAfrica.filtro_cd_pessoa := tblMatriculasCODIGOALUNO.AsInteger;
         fAlunosAfrica.btBuscar_PessoaClick(nil);
      end
      else
      begin
         fAlunosAfrica.filtro_cd_pessoa := tblMatriculasCODIGOALUNO.AsInteger;
         fAlunosAfrica.btBuscar_PessoaClick(nil);
         fAlunosAfrica.Show;
      end;
   end
   else begin
      if not PrincipalForm.ProcuraForm( TForm(frm_Alunos) ) then
      begin
         Application.CreateForm( Tfrm_Alunos, frm_Alunos );
         frm_Alunos.filtro_cd_pessoa := tblMatriculasCODIGOALUNO.AsInteger;
         frm_Alunos.btBuscar_PessoaClick(nil);
      end
      else
      begin
         frm_Alunos.filtro_cd_pessoa := tblMatriculasCODIGOALUNO.AsInteger;
         frm_Alunos.btBuscar_PessoaClick(nil);
         frm_Alunos.Show;
      end;
   end;
end;

procedure TfrmMatriculas.CadastrodeTurmas1Click(Sender: TObject);
var
   encontrou: Boolean;
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npAcesso, True ) then Exit;

   if not PrincipalForm.ProcuraForm( TForm(frmCursos) ) then
   begin
      Application.CreateForm( TfrmCursos, frmCursos );

      if (tblMatriculas.RecNo >= 1) then
      begin
         frmCursos.qyCursosMestre.Locate('CD_CURSO', tblMatriculasCurso.AsString, [loCaseInsensitive])
      end else
         frmCursos.qyCursosMestre.Locate('CD_CURSO', sFiltroCurso, [loCaseInsensitive]);

      frmCursos.pcGeral.ActivePageIndex := 1;

      if (tblMatriculas.RecNo >= 1) then
         frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(tblMatriculasAnoSemestre.AsInteger)
      else
         frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(StrToInt(sFiltroAnosemestre));

      frmCursos.pcGeralChange(nil);

      frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxTurmaAtiva.Checked := False;

      if (tblMatriculas.RecNo >= 1) then
         encontrou := frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
      else
         encontrou := frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);

      if encontrou = False then
      begin
         frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(tblMatriculasAnoSemestre.AsInteger);
         frmCursos.tblTurmas.Locate('anosemestre', tblMatriculasAnoSemestre.AsString, [loCaseInsensitive]);

         if (tblMatriculas.RecNo >= 1) then
            encontrou := frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
         else
            encontrou := frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);
      end;

      if encontrou = False then
      begin
         frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxTurmaAtiva.Checked := True;

         if (tblMatriculas.RecNo >= 1) then
         begin
            encontrou := frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
         end
         else
         begin
            encontrou := frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);
         end;

         if encontrou = False then
         begin

            frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(tblMatriculasAnoSemestre.AsInteger);
            frmCursos.tblTurmas.Locate('anosemestre', tblMatriculasAnoSemestre.AsString, [loCaseInsensitive]);

            if (tblMatriculas.RecNo >= 1) then
            begin
               frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
            end
            else
            begin
               frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);
            end;

         end;
         
      end;

   end
   else
   begin
      if (tblMatriculas.RecNo >= 1) then
         frmCursos.qyCursosMestre.Locate('CD_CURSO', tblMatriculasCurso.AsString, [loCaseInsensitive])
      else
         frmCursos.qyCursosMestre.Locate('CD_CURSO', sFiltroCurso, [loCaseInsensitive]);
      frmCursos.pcGeral.ActivePageIndex := 1;

      if (tblMatriculas.RecNo >= 1) then
         frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(tblMatriculasAnoSemestre.AsInteger)
      else
         frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(StrToInt(sFiltroAnosemestre));

      frmCursos.pcGeralChange(nil);

      frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxTurmaAtiva.Checked := True;

      if (tblMatriculas.RecNo >= 1) then
      begin
         encontrou := frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
      end
      else
      begin
         encontrou := frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);
      end;

      if encontrou = False then
      begin
         frmCursos.UMFiltroDataAnoSem.FiltroDataCheckBoxTurmaAtiva.Checked := False;

         frmCursos.UMFiltroDataAnoSem.setAnosemestreInicial(tblMatriculasAnoSemestre.AsInteger);
         frmCursos.tblTurmas.Locate('anosemestre', tblMatriculasAnoSemestre.AsString, [loCaseInsensitive]);

      end;

      frmCursos.Show;
      
   end;
end;

procedure TfrmMatriculas.VerificaBib();
var
   sMensagem : string;
begin
   //emprestimos pendentes
   qryPendenciasBib.Close;
   qryPendenciasBib.ParamByName('cd_pessoa').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;
   qryPendenciasBib.open;

   //multas bib
   qryPendenciasFinanceirasBib.Close;
   qryPendenciasFinanceirasBib.ParamByName('cd_pessoa').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;
   qryPendenciasFinanceirasBib.Open;

   if not(qryPendenciasBib.Eof) or not(qryPendenciasFinanceirasBib.Eof) then
   begin
      sMensagem := 'O aluno possui pendências na Biblioteca.' +#13;
      if qryPendenciasFinanceirasBib.FieldByName('valor_total').AsString <> '' then
      begin
         sMensagem := sMensagem+ 'Multas em aberto: R$'+Format(' %f',[qryPendenciasFinanceirasBib.FieldByName('valor_total').AsFloat]) + #13;
      end;
      if qryPendenciasBib.FieldByName('obras').AsString <> '' then
      begin
        sMensagem :=  sMensagem+'Obras não devolvidas: '+ReplaceStr(qryPendenciasBib.FieldByName('obras').AsString,'#13',Chr(13));
      end;
  
      if DM.UsuarioLogado.TemPermissao(dm.iCdPessoaLogado, 'Academico.Verifica.Pendecias.Biblioteca' , npAcesso, False) then
      begin
         if MensagemCustomizavel( sMensagem , mtInformation, mbOKCancel  ,['Confirmar Saída', 'Cancelar Operação'],120,mbCancel) <> mrOk  then
         begin
            Abort;
         end;
      end
      else
      begin
         MensagemCustomizavel(sMensagem , mtInformation, [mbOK],['Cancelar Operação'],120);
         Abort;
      end;
   end;
end;

procedure TfrmMatriculas.verificaTitulosPendentes;
const
   SQL_VERIFICA_TITULO = 'select count(*) as nrPendentes from mensalidades where situacao = 2 and codigoaluno = :codigoaluno';
var
   qryTitulos : TUMZQuery;
   msgCancelamento : String;
begin
   DM.CriarConsulta(qryTitulos);
   qryTitulos.SQL.Add(SQL_VERIFICA_TITULO);
   qryTitulos.ParamByName('codigoaluno').AsString := tblMatriculasCODIGOALUNO.AsString;
   qryTitulos.Open;

   msgCancelamento := 'Você está prestes a cancelar a matrícula de ' + tblMatriculasNome.AsString;

   if qryTitulos.FieldByName('nrPendentes').AsInteger > 0 then
   begin
      msgCancelamento := msgCancelamento +#10 + #13  +#10 + #13
                         + 'Existem títulos pendentes e vencimentos vinculados a esta matrícula'
                         +#10 + #13 + 'Os títulos pendentes serão cancelados e os vencidos permancem pendentes.';
   end;

   qryTitulos.Close;
   FreeAndNil(qryTitulos);

   Mensagem( msgCancelamento, Application.Title, MB_OK + MB_ICONWARNING );
end;

procedure TfrmMatriculas.CancelarMatrcula1Click(Sender: TObject);
const
   SQL_GRUPOS_ATIVIDADES_ALUNO = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo, '+
                                 '  dgp.cd_pessoa, '+
                                 '  d.descricao nm_disciplina, '+
                                 '  p.nm_pessoa '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 '	INNER JOIN diario_grupos_pessoas dgp ON ( '+
                                 '		dgp.cd_grupo =  dg.cd_grupo AND '+
                                 '    dgp.dt_saida IS NULL '+
                                 '	) '+
                                 '  INNER JOIN disciplinas d ON ( '+
                                 '		dg.cd_disciplina = d.codigo AND '+
                                 '		dg.cd_curso = d.curso '+
                                 '	) '+
                                 '  INNER JOIN pessoas p ON (p.cd_pessoa = dgp.cd_pessoa) '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.sn_ativo = 1 AND '+
                                 '	dgp.cd_pessoa = :cd_pessoa';

   SQL_POSSUI_GRUPOS_ATIVIDADE = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.sn_ativo = 1';
var
  wAno, wMes, wDia : Word;
  msgCancelamento, strAux2 : String;
  bytAux : Byte;
  sMesVenc, sMesAtual, sMesSeguinte: string;
  qryDDA : TUMZQuery;

  sTitulos : string;

  movimento : TMovimento;

  bCancelar, bCancelamentosImpedidos, bCancelarDDA , continua: Boolean;
  iCancelamento : Integer;
  Chaves, observacao : String;
  iColigada : integer;

  dtCancelamento : TDateTime;

  sCodigosTitulosJaCancelados : String;
  iDiaCancela : Integer;
  dataGrupo : TDateTime;
begin

  if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then Exit;

  case TPopupMenu( Sender ).Tag of
    3 : msgCancelamento := 'o cancelamento da matrícula ';
    4 : msgCancelamento := 'o trancamento da matrícula ';
    5 : msgCancelamento := 'a desistência ';
    6 : msgCancelamento := 'o abandono da matrícula ';
    7 : msgCancelamento := 'a transferência ';
    10: msgCancelamento := 'o registro de reserva da matrícula ';
  end;

  try
     strAux2 := Dm.lst_situacao_desc[TPopupMenu( Sender ).Tag]
  Except
     strAux2 :=  '';
  End;

  bytAux := TPopupMenu( Sender ).Tag;

  // Se a situação já for cancelada ou APROVADO, então recusar...
  if tblMatriculasSituacao.AsInteger IN [3, 4, 5, 6, 7, 8, 0] then
  begin
    Mensagem( 'Só é possível efetuar ' + msgCancelamento + ' de um aluno cursando.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

   if TPopupMenu(Sender).Tag IN [3,4,5,6,7]  then
   begin
      if dm.variavel_parametro('acad_saida_verifica_biblioteca', True) = '1'  then
      begin
         VerificaBib;
      end;
   end;

   verificaTitulosPendentes();

   //verifica se o aluno antes de cancelar a matricula possui estagio ativo
   if verificaAlunosComEstagio(
      tblMatriculasCodigoAluno.AsInteger,
      DM.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger)
      ) = false then
   begin
     exit;
   end;


//  if Mensagem('Confirma ' + strAux + ' do aluno selecionado ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes
//  Then exit;

   if TPopupMenu(Sender).Tag <> 10 then
      if not Self.RegistraMotivo(TPopupMenu(Sender).Tag) then Exit;

   Screen.Cursor := crHourGlass;

   // Antes de Qualquer operação, verificar titulos já cancelados na planilha do aluno

   sCodigosTitulosJaCancelados := ClassePlanosPagamento.getDistratoTitulosCancelados(
            tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString,
            tblMatriculasTurma.AsString, tblMatriculasCODIGOALUNO.AsInteger );

   DM.tblMatriculas.Close;
   DM.tblMatriculas.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
   DM.tblMatriculas.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
   DM.tblMatriculas.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
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
   
   if TPopupMenu( Sender ).Tag in [5,6] then Dm.qAux1.SQL.Add( ', Frequencia = 0' );
   Dm.qAux1.SQL.Add('where');
   Dm.qAux1.SQL.Add('CodigoAluno = :CodigoAluno and');
   Dm.qAux1.SQL.Add('situacao in (SELECT cd_situacao FROM situacao WHERE cd_situacao_pai NOT IN (0,9)) AND ');
   Dm.qAux1.SQL.Add('TurmaMatricula = :Turma and');

   if TSpeedButton( Sender ).Tag = 10 then
   begin
      Dm.qAux1.SQL.Add(' (dt_saida IS NULL and situacao <> 3) and ');
   end;

   Dm.qAux1.SQL.Add('AnoSemestre = :AnoSemestre');

   // só seta o parametro se a data de saída da matrícula tiver valor
   if not DM.tblMatriculasDataSaida.IsNull then
   begin
      Dm.qAux1.ParamByName('dt_saida').AsString := FormatDateTime('yyyy-mm-dd', DM.tblMatriculasDataSaida.AsDateTime) + FormatDateTime(' hh:nn:ss', DM.DataAtual);
   end;

   Dm.qAux1.ParamByName('Situacao').AsInteger := TSpeedButton( Sender ).Tag;
   Dm.qAux1.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
   Dm.qAux1.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
   Dm.qAux1.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
   Dm.qAux1.ExecSQL;            

  DM.tblMatriculas.Edit;

  if TPopupMenu( Sender ).Tag <> 10 Then
  Begin

//     DM.tblMatriculasDataSaida.AsString := DateToStr(DataHoje);

//     Application.CreateForm( TfrmDataSaida, frmDataSaida );
//     frmDataSaida.Label1.Caption := 'Confirmar Data de Saída:';
//     frmDataSaida.DBEdit1.DataField := 'DataSaida';
//     frmDataSaida.ShowModal;

     { Verificar o Financeiro }

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

     if not DM.tblMensalidades.EOF then begin


        bCancelamentosImpedidos := false;

        Dm.tblMensalidades.First;

        if Dm.variavel_parametro('mensalidades_data_baixa') = '[ATUAL]' then
        begin
           dtCancelamento := DM.DataAtual();
        end else begin
           dtCancelamento := DM.tblMatriculasDataSaida.AsDateTime;
        end;

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
               if  (DM.tblMensalidadesDataVencimento.AsDateTime < dtCancelamento)
               AND (Dm.variavel_parametro('financeiro_cancelar_vencida') = 'S')
               then begin

                  bCancelar := True;

               end;

               // Verificar se está pendente e o parametro está ativo
               if  (DM.tblMensalidadesDataVencimento.AsDateTime >= dtCancelamento)
               AND (Dm.variavel_parametro('financeiro_cancelar_pendente') = 'S')
               then begin

                  bCancelar := True;

                  sMesVenc := (FormatDateTime('yyyy-mm', DM.tblMensalidadesDataVencimento.AsDateTime));
                  sMesAtual := (FormatDateTime('yyyy-mm', dtCancelamento));

                  if ((sMesVenc = sMesAtual) and ((Dm.variavel_parametro('financeiro_cancelar_mes_atual') = 'N'))) then begin
                      // Está pendente, porém, não é para cancelar o mês atual.
                      bCancelar := False;
                  end
                  else if ( (sMesVenc = sMesAtual)) then begin
                      // Verificar se o parametro esta preenchido com numero
                      // Se tiver, esse número será o DIA do vencimento a qual o sistema poderá já cancelar o financeiro
                      iDiaCancela := 0;
                      if ( TryStrToInt(Dm.variavel_parametro('financeiro_cancelar_mes_atual'), iDiaCancela) ) then begin

                          if ( StrToInt(FormatDateTime('dd', dtCancelamento)) > iDiaCancela )then begin
                              bCancelar := False;
                          end;
                      end;

                  end;
               end;

               // Verificar se está pendente e o parametro está ativo
               if  (DM.tblMensalidadesDataVencimento.AsDateTime >= dtCancelamento)
               AND (Dm.variavel_parametro('financeiro_cancelar_pendente') = 'S') AND (bCancelar)
               then begin

                  bCancelar := True;

                  sMesVenc := (FormatDateTime('yyyy-mm', DM.tblMensalidadesDataVencimento.AsDateTime));
                  sMesSeguinte := (FormatDateTime('yyyy-mm', IncMonth(dtCancelamento)));

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
                 bCancelamentosImpedidos:= true;
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
                DM.tblMensalidadesDataPagamento.AsString := DateToStr(dtCancelamento);

             // Se estiver bloqueado, a data de pagamento deve ser sempre mais 1
             if Dm.EstaBloqueado(DM.tblMensalidadesDataPagamento.AsDateTime, false) then begin
                DM.tblMensalidadesDataPagamento.AsString := DateToStr(DM.DataBloqueioFinanceiro(DM.tblMensalidadesDataPagamento.AsDateTime) + 1);
             end;

             { A parcela do mes atual não pode ser perdoada }
             DecodeDate(DM.tblMensalidadesDataVencimento.Value, wAno, wMes, wDia);

             DM.FazAcaoRemessa(arCancelar, Dm.tblMensalidades.FieldByName('cd_mensalidade').AsInteger);

             // ajuste da remessa quando mensalidade consta no DDA
             if TPopupMenu(Sender).Tag IN [3,4,5,6,7]  then
             begin
                DM.CriarConsulta(qryDDA);
                qryDDA.Close;
                qryDDA.SQL.Text := ''+
                '  SELECT                         '+
                '   	rl.cd_origem,ro.cd_acao      '+
                '  FROM                           '+
                '  	rem_dados rd'+
                '	   INNER JOIN rem_layouts rl ON (rl.cd_layout = rd.cd_layout)'+
                '  	INNER JOIN rem_ocorrencias ro on (ro.cd_ocorrencia = rd.cd_ocorrencia)'+
                '  WHERE                                                       '+
                '	  rd.cd_mensalidade = :cd_mensalidade';

                qryDDA.ParamByName('cd_mensalidade').AsInteger := DM.tblMensalidadescd_mensalidade.AsInteger;
                qryDDA.Open;

                bCancelarDDA := false;
                while not qryDDA.Eof do
                begin
                  if qryDDA.FieldByName('cd_origem').AsInteger = 3 then
                    bCancelarDDA := true;
                  if qryDDA.FieldByName('cd_origem').AsInteger = 101 then
                    iCancelamento := iCancelamento +1;
                  qryDDA.Next;
                end;
                if iCancelamento > 1 then
                  bCancelarDDA := false;

                if ( bCancelarDDA = true ) then
                begin
                  if ( Mensagem('Deseja cancelar o Débito Automático?', Application.Title, MB_YESNO) = mrYes ) then
                  begin
                     DM.FazAcaoRemessa(arCancelamentoDDA, DM.tblMensalidadescd_mensalidade.AsInteger);
                     Mensagem('Será necessário retransmitir o arquivo de remessa para que o cancelamento do DDA ocorra.', Application.Title, MB_OK, Handle);
                  end
                end;
             end;
             // fim do ajuste da remessa quando mensalidade consta no DDA
             
             Dm.tblMensalidades.Post;

             // Registrar Movimentação de Cancelamento

             Movimento := TMovimento.create();
             Movimento.TipoDeAcao := BaixarporCancelamento;
             Movimento.CodigoTitulo := DM.tblMensalidadescd_mensalidade_origem.AsInteger;
             Movimento.Coligada := DM.tblMensalidadescd_coligada.AsInteger;
             Movimento.CodigoMovimento := DM.tblMensalidadescd_mensalidade.AsInteger; // Aqui é que tem q alterar na planilha de mensalidades
             Movimento.CodAcao :=  DM.BuscarCodigoAcaoPadrao(14);  // Cancelamento de mensalidades

             case TPopupMenu( Sender ).Tag of
                 3 : Movimento.Observacao := 'Matrícula Cancelada';
                 4 : Movimento.Observacao := 'Matrícula Trancada';
                 5 : Movimento.Observacao := 'Desistência';
                 6 : Movimento.Observacao := 'Abandono de Matrícula';
                 7 : Movimento.Observacao := 'Transferência';
             end;

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

             case TPopupMenu( Sender ).Tag of
                  3 : DM.tblMotivosMotivo.AsString := 'Matrícula Cancelada';
                  4 : DM.tblMotivosMotivo.AsString := 'Matrícula Trancada';
                  5 : DM.tblMotivosMotivo.AsString := 'Desistência';
                  6 : DM.tblMotivosMotivo.AsString := 'Abandono de Matrícula';
                  7 : DM.tblMotivosMotivo.AsString := 'Transferência';
             end;

             DM.tblMotivos.Post;
             DM.tblMotivos.Close;
           end;

           DM.tblMensalidades.Next;
        End;

     End;

     { Colocar motivo na Matrícula e permitir alterar}
//     Application.CreateForm( TfrmMotivos, frmMotivos );

         if DM.FindMotivo( Dm.tblMatriculas.FieldByNAMe('codigoaluno').AsInteger, 999, Dm.tblMatriculas.FieldByName('datasaida').AsDateTime, DM.tblMatriculas.FieldByName('turma').AsString)
              then
              	 DM.tblMotivos.Edit
              else
              	 DM.tblMotivos.Insert;

              DM.tblMotivosCodigoAluno.AsInteger := Dm.tblMatriculas.FieldByNAMe('codigoaluno').AsInteger;
              DM.tblMotivosParcela.AsInteger := 999;
              DM.tblMotivosturma.AsString := DM.tblMatriculas.FieldByName('turma').AsString ;
              DM.tblMotivosDataMotivo.AsString := DateToStr(Dm.tblMatriculas.FieldByNAMe('datasaida').AsDateTime);
              DM.tblMotivosAutorizadoPor.AsInteger := DM.iCdPessoaLogado;


              case TPopupMenu( Sender ).Tag of
                  3 : DM.tblMotivosMotivo.AsString := 'Matrícula Cancelada';
                  4 : DM.tblMotivosMotivo.AsString := 'Matrícula Trancada';
                  5 : DM.tblMotivosMotivo.AsString := 'Desistência';
                  6 : DM.tblMotivosMotivo.AsString := 'Abandono de Matrícula';
                  7 : DM.tblMotivosMotivo.AsString := 'Transferência';
              end;

//              frmMotivos.pnlUsuario.Caption := DM.tblUsuariosNomeNome.AsString;

//              frmMotivos.ShowModal;

              DM.tblMotivos.Post;
              DM.tblMotivos.Close;

  End else begin


  // colocar as mensalidades como reserva

        Dm.tblMensalidades.Close;
        Dm.tblMensalidades.SQL.Text := 'select * from mensalidades';
        Dm.tblMensalidades.SQL.Add(' where codigoaluno = :codigo and ');
        Dm.tblMensalidades.SQL.Add(' turma = :turma and anosemestre = :anosemestre ');
        Dm.tblMensalidades.SQL.Add(' and ( situacao = 2 ) AND tipoparcela = 0 ' );

        Dm.tblMensalidades.ParamByName('codigo').AsInteger := DM.tblMatriculasCodigoAluno.AsInteger;
        DM.tblMensalidades.ParamByName('turma').AsString := DM.tblMatriculasTurma.AsString;
        DM.tblMensalidades.ParamByName('anosemestre').AsInteger := DM.tblMatriculasAnoSemestre.AsInteger;
        Dm.tblMensalidades.Open;

        Dm.tblMensalidades.First;
        While not Dm.tblMensalidades.Eof do Begin

           // Verificar se deve ser marcada como  reserva

           // Somente colcoar como reserva se a parcela não estiver vencida e se o cancelamento ocorreu dentro do mês..
           if  (FormatDateTime('yyyymm', DM.tblMensalidadesDataVencimento.AsDateTime) >= FormatDateTime('yyyymm', DataHoje))
           AND (FormatDateTime('yyyymm', DM.tblMensalidadesdt_competencia.AsDateTime) >= FormatDateTime('yyyymm', DataHoje))
           AND (not DM.EstaBloqueado(DM.tblMensalidadesDataVencimento.AsDateTime, False) )
           AND (not DM.EstaBloqueado(DM.tblMensalidadesdt_competencia.AsDateTime, False) )
           then begin

             DM.tblMensalidades.Edit;

             DM.tblMensalidadesSituacao.AsInteger := 10; // RESERVA

             Dm.tblMensalidades.Post;

             // Gravar Log

             chaves := FillString(IntToStr(DM.tblMensalidadesCodigoAluno.AsInteger), alRight, '0', 10, true ) + ';' +
                       Dm.tblMensalidadesAnoSemestre.AsString + ';' + Dm.tblMensalidadesTurma.AsString + ';' +
                       Dm.tblMensalidadesParcela.AsString + ';' +
                       FormatDateTime('dd/mm/yyyy',Dm.tblMensalidadesDataVencimento.AsDateTime) + ';';


             DM.setLog(1009, 'Alteracao', chaves, dm.getColigadaByTurma(DM.tblMatriculasTurma.AsString, DM.tblMatriculasAnoSemestre.AsInteger), 'Matricula em reserva ' + Dm.tblMensalidadescd_mensalidade.AsString);

             // Apagar a movimentação de desconto

           end;

           DM.tblMensalidades.Next;
        End;

     End;

// fim da reativação das mensalidades

  // Se a situação estiver em Cancelamento, Reserva, Abandono, Desistência ou Transferência
  if bytAux in [3, 10, 6, 5, 7, 8] then
  begin

      // Registra na tabela de matriculas o usuário que efetuou a alteração
      DM.tblMatriculasUsuario.AsString := Dm.sLogin;

  end;

   DM.tblMatriculasSituacao.AsInteger := bytAux;
   intSalvar := TSpeedButton( Sender ).Tag;
   DM.tblMatriculas.Post;

   // Atualiza a situação de matrícula do aluno no curso
   DM.UpdateSituacaoMatriculaCurso(DM.tblMatriculasSituacao.AsInteger, tblMatriculascd_matricula_curso.AsLargeInt);

   if TPopupMenu(Sender).Tag <> 10 then
   begin
      // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
      qyGruposAtividadesAluno.SQL.Text := SQL_GRUPOS_ATIVIDADES_ALUNO;
      
      qyGruposAtividadesAluno.Close;
      qyGruposAtividadesAluno.ParamByName('nr_anosemestre').AsInteger := DM.tblMatriculasAnoSemestre.AsInteger;
      qyGruposAtividadesAluno.ParamByName('cd_curso').AsString := DM.tblMatriculasCurso.AsString;
      qyGruposAtividadesAluno.ParamByName('cd_turma').AsString := DM.tblMatriculasTurma.AsString;
      qyGruposAtividadesAluno.ParamByName('cd_pessoa').AsInteger := DM.tblMatriculasCodigoAluno.AsInteger;
      qyGruposAtividadesAluno.Open;

      // Aluno vinculado a grupos de atividades (nessa matrícula)
      if not qyGruposAtividadesAluno.Eof then
      begin
         // Avisa o usuário que ele está desativando a matrícula de um aluno que possui vinculos em disciplinas com grupos de atividades
         Mensagem('Você desativou a matrícula de um aluno que possui disciplinas com grupos de atividades, o aluno foi inativado nesses grupos.', 'Informação', MB_OK + MB_ICONINFORMATION );

         dataGrupo := DM.DataAtual;
         if not DM.tblMatriculasDataSaida.IsNull then
         begin
            dataGrupo := DM.tblMatriculasDataSaida.AsDateTime;
         end;

         // Varre os grupos de atividade que o aluno será desativado
         while not qyGruposAtividadesAluno.Eof do
         begin
            observacao := 'Matricula do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'" foi inativada, portanto o estudante foi inativado no grupo '+
                          qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                          'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', DM.DataAtual);

            Self.inativaGrupo(
               qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsInteger,
               qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger,
               dataGrupo,
               observacao,
               false
            );

            
            qyGruposAtividadesAluno.Next;
         end;

      end;
   end else begin
      // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
      qyPossuiGruposAtividades.SQL.Text := SQL_POSSUI_GRUPOS_ATIVIDADE;
      
      qyPossuiGruposAtividades.Close;
      qyPossuiGruposAtividades.ParamByName('nr_anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      qyPossuiGruposAtividades.ParamByName('cd_curso').AsString := tblMatriculasCurso.AsString;
      qyPossuiGruposAtividades.ParamByName('cd_turma').AsString := tblMatriculasTurma.AsString;
      qyPossuiGruposAtividades.Open;

      // Disciplinas vinculadas a  grupos de atividades nessa matrícula
      if not qyPossuiGruposAtividades.Eof then
      begin
         // Avisa o usuário que ele está ativando a matrícula de um aluno que possui vinculos em disciplinas com grupos de atividades
         Mensagem('Você ativou a matrícula de um aluno que possui disciplinas com grupos de atividades. '+
                  'Favor vincular este aluno a um grupo de atividade para que ele seja exibido no diário.'+#13+
                  'Para vincular o aluno no grupo acesse a tela "Cadastros > Grupos de Atividades Práticas"', 'Informação', MB_OK + MB_ICONINFORMATION );
      end;
   end;

//  if TPopupMenu(Sender).Tag in [3, 4, 5] then
//     Mensagem('Você deverá registrar um motivo para alteração da situação da matrícula do aluno.', 'Informação', MB_OK + MB_ICONINFORMATION);

   if ClassePlanosPagamento.hasDistratoContratual(
            tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString,
            tblMatriculasTurma.AsString, tblMatriculasCODIGOALUNO.AsInteger, TPopupMenu(Sender).Tag ) then
   begin
      ClassePlanosPagamento.GeraMensalidadeDistratoContratual(
                                 tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString,
                                 tblMatriculasTurma.AsString, tblMatriculasCODIGOALUNO.AsInteger, sCodigosTitulosJaCancelados);
   end else begin
      Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION);
   end;

   if (bCancelamentosImpedidos) then
   begin
      iColigada := 0;
      if (DM.variavel_parametro('forcar_agrupamento_colcen') = '0') or (DM.variavel_parametro('forcar_agrupamento_colcen') = '') then
      begin
         iColigada   := DM.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger );
      end;

      //recupera a data mais recente bloqueada para informar na mensagem
      Mensagem('Existem títulos que não puderam ser cancelados, pois para a sua data de vencimento, o sistema financeiro estava bloqueado.  ', 'Atenção', MB_OK + MB_ICONINFORMATION );
   end;


   //Gera Log da operação
   chaves := FillString(tblMatriculasCodigoAluno.AsString, alRight, '0', 10, true ) + ';' +
                tblMatriculasAnoSemestre.AsString + ';' +
                tblMatriculasTurma.AsString + ';';

   DM.setLog(1009, 'Alteração', chaves, Dm.getColigadaByTurma(tblMatriculasTurma.AsString,tblMatriculasAnoSemestre.AsInteger),
      'Efetuado(a) ' + msgCancelamento + ' do aluno(a) ' + tblMatriculasCodigoAluno.AsString + ' na turma ' + tblMatriculasTurma.AsString + ' e no ano/semestre ' + tblMatriculasAnoSemestre.AsString );

   tblMatriculas.Close;
   tblMatriculas.Open;

   Screen.Cursor := crDefault;
end;

procedure TfrmMatriculas.btnTransferenciasClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   { Alterar Situação de Matrículas }

   if not DM.UsuarioLogado.TemPermissao( 1018, npAcesso, True ) then Exit;

   PosX := btnTransferencias.Left + PrincipalForm.Left + 10;
   PosY := toolAlunos1.Top + PrincipalForm.Top + 55;

   popTransferencia.Popup(PosX, PosY);
end;

procedure TfrmMatriculas.btnAlterarSituacaoDisciplinaClick(Sender: TObject);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível realizar alterações na matrícula que implicam em ajustes nos créditos acadêmicos.';
var
   PosX, PosY : Integer;
begin

   if not DM.UsuarioLogado.TemPermissao( 1018, npAcesso, True ) then Exit;

   // Verifica se o parâmetro de bloqueio de ajuste de créditos para alunos
   // cadastrados no programa bolsa FIES está habilitada.
   // Se estiver habilitado, verifica se o usuário possui permissão para
   // alterar os créditos mesmo com o bloqueio habilitado.

   if DM.IsAlunoFIES(tblMatriculasCODIGOALUNO.AsInteger) and
      FBloqueiaCreditosAlunosFIES then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.Matriculas.Ajustes.FIES', npAcesso, False) then
      begin
         if MessageDlg(SMsgConfirm, mtConfirmation, [mbYes, mbNo], -1) = mrNo then
         begin
            Exit;
         end;
      end
      else
      begin
         MessageDlg(SMsgBloqueio, mtInformation, [mbOK], -1);
         Exit;
      end;
   end;

   PosX := btnAlterarSituacaoDisciplina.Left + PrincipalForm.Left + 20;
   PosY := toolDisciplinas.Top + PrincipalForm.Top;

   popSituacaoDisciplina.Popup(PosX, PosY);

   tblResumoFicha.Close;
   tblResumoFicha.Open;
end;

procedure TfrmMatriculas.MenuItem2Click(Sender: TObject);
const
   SQL_POSSUI_GRUPOS_ATIVIDADE = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.cd_disciplina = :cd_disciplina AND '+
                                 '	dg.sn_ativo = 1';
var
   strAux, strAux2 : String;
   chaves, observacao : String;
   bytAux : Byte;
   x: Integer;
begin
   // Se estiver tentando fazer setar a situação da disciplina com a mesma que da matrícula, não precisa verificar se só tem 1 disciplina
   if not ((tblMatriculasSituacao.AsInteger = TPopupMenu( Sender ).Tag) AND (tblMatriculasSituacao.AsInteger in [3,4,5,6])) then
   begin
      x := -8;

      if not(tblFichaIndividualSituacao.AsInteger in [3, 4, 5, 6, 7, 8, x]) and ( ClasseDisciplinas.IsUltimaDisciplinaAtiva( tblFichaIndividualAnoSemestre.AsInteger,
               tblFichaIndividualTurmaMatricula.AsString, tblFichaIndividualDisciplina.AsInteger,
               tblFichaIndividualCodigoAluno.AsInteger,  tblFichaIndividualTurma.AsString ) ) then
      begin
         Mensagem(
            'Existe apenas uma disciplina vinculada a turma, para cancelá-la utilize a opção de ajuste da situação da turma.',
            Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
         Exit;
      end;
   end;
   

  case TPopupMenu( Sender ).Tag of
    3 : strAux := 'o cancelamento da disciplina ';
    4 : strAux := 'o trancamento da disciplina ';
    5 : strAux := 'a desistência da disciplina ';
    6 : strAux := 'o abandono da disciplina ';
    10: strAux := 'o registro de reserva da disciplina ';
  end;

  try
     strAux2 := Dm.lst_situacao_desc[TPopupMenu( Sender ).Tag]
  Except
     strAux2 :=  '';
  End;

  bytAux := TPopupMenu( Sender ).Tag;

  if tblFichaIndividualSituacao.AsInteger <> 1 then
  begin
    Mensagem( 'Só é possível efetuar ' + strAux + ' de um aluno cursando.',
	      Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

  if Mensagem('Confirma ' + strAux + ' do aluno selecionado ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes
  Then exit;

  Screen.Cursor := crHourGlass;

  // atualizacao da ficha individual
     Dm.qAux1.Close;
     DM.qAux1.SQL.Clear;

     Dm.qAux1.SQL.Add('update FichaIndividual set Situacao = :Situacao,');
     // Verifica se a situação é 3, 4, 5 ou 6 (cancelamento, trancamento, desistência ou abandono)
     // Caso sim então seta a data de saida do aluno com a data atual, caso contrário limpa a data de saída
     Dm.qAux1.SQL.Add('dt_saida = CASE WHEN :Situacao IN (3, 4, 5, 6) THEN now() ELSE null END ');
     if TPopupMenu( Sender ).Tag in [5,6] then Dm.qAux1.SQL.Add( ', Frequencia = 0' );
     Dm.qAux1.SQL.Add('where');
     Dm.qAux1.SQL.Add('CodigoAluno = :CodigoAluno and');
     Dm.qAux1.SQL.Add('Turma = :Turma and');
     Dm.qAux1.SQL.Add('AnoSemestre = :AnoSemestre');
     Dm.qAux1.SQL.Add('and disciplina = :disciplina');

     Dm.qAux1.ParamByName('Situacao').AsInteger    := TSpeedButton( Sender ).Tag;
     Dm.qAux1.ParamByName('CodigoAluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
     Dm.qAux1.ParamByName('Turma').AsString        := tblFichaIndividualTurma.AsString;
     Dm.qAux1.ParamByName('AnoSemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
     Dm.qAux1.ParamByName('Disciplina').AsInteger  := tblFichaIndividualDisciplina.AsInteger;

     Dm.qAux1.ExecSQL;

   if TPopupMenu(Sender).Tag <> 10 then
   begin
      // Disciplina do aluno possui grupo de atividade
      if tblFichaIndividual.FieldByName('cd_grupo').AsString > '0' then
      begin

         observacao := 'Disciplina do estudante '+tblFichaIndividualCodigoAluno.AsString+' - "'+
                        tblMatriculasNome.AsString+'" foi inativada, portanto o estudante foi inativado no grupo '+
                        tblFichaIndividual.FieldByName('cd_grupo').AsString+' - "'+
                        tblFichaIndividual.FieldByName('nm_grupo').AsString+'" [disciplina: '+
                        tblFichaIndividualDescricaoDisciplina.AsString+'] '+'na data '+FormatDateTime('dd/mm/yyyy', DataHoje);

         Self.inativaGrupo(
            tblFichaIndividualCodigoAluno.AsInteger,
            strtoint(tblFichaIndividual.FieldByName('cd_grupo').AsString),
            DM.DataAtual,
            observacao
         );
      end;
      
   end else begin
      // Verifica se a disciplina possui grupo de atividade criado
      qyPossuiGruposAtividades.SQL.Text := SQL_POSSUI_GRUPOS_ATIVIDADE;

      qyPossuiGruposAtividades.Close;
      qyPossuiGruposAtividades.ParamByName('nr_anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
      qyPossuiGruposAtividades.ParamByName('cd_curso').AsString := tblFichaIndividualCurso.AsString;
      qyPossuiGruposAtividades.ParamByName('cd_turma').AsString := tblFichaIndividualTurma.AsString;
      qyPossuiGruposAtividades.ParamByName('cd_disciplina').AsInteger := tblFichaIndividualDisciplina.AsInteger;
      qyPossuiGruposAtividades.Open;

      // Aluno vinculado a grupos de atividades (nessa matrícula)
      if not qyPossuiGruposAtividades.Eof then
      begin
         // Avisa o usuário que ele está ativando uma disciplina relacionada a um grupo de atividade
         Mensagem('Você ativou uma disciplina com grupos de atividades relacionados. Favor vincular este aluno a um grupo de atividade para que ele seja exibido no diário.'+#13+
                  'Para vincular o aluno no grupo acesse a tela "Cadastros > Grupos de Atividades Práticas"', 'Informação', MB_OK + MB_ICONINFORMATION );
      end;
   end;

  { Verificar Créditos }

  if bytAux in [3..8] then
  Begin

     DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger, true, true);

  End;

  { OLIVER - CALCULO_MEDIA - OK - }
  DM.SetaSituacaoFinal(
      tblMatriculasCodigoAluno.AsInteger,
      tblMatriculasTurma.AsString,
      tblMatriculasAnoSemestre.AsInteger
  );

  chaves := FillString(tblMatriculasCodigoAluno.AsString, alRight, '0', 10, true ) + ';' +
                tblMatriculasAnoSemestre.AsString + ';' +
                tblFichaIndividualTurma.AsString + ';'+
                tblFichaIndividualDisciplina.AsString;

  DM.setLog(1009, 'Alteração', chaves, Dm.getColigadaByTurma(tblFichaIndividualTurma.AsString,tblMatriculasAnoSemestre.AsInteger),
      'Efetuado(a) ' + strAux + ' do aluno(a) ' + tblMatriculasCodigoAluno.AsString + ' na turma ' + tblFichaIndividualTurma.AsString + ', no ano/semestre ' + tblMatriculasAnoSemestre.AsString + ' e na disciplina ' + tblFichaIndividualDisciplina.AsString );

  Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

  tblFichaIndividual.Close;
  tblFichaIndividual.Open;
  tblResumoFicha.Close;
  tblResumoFicha.Open;
  Screen.Cursor := crDefault;
end;


procedure TfrmMatriculas.menuRemoverDisciplinaAlunoClick(Sender: TObject);
begin
   removerDisciplina;
end;

procedure TfrmMatriculas.menuRemoverDisciplinaVariosAlunosClick(
  Sender: TObject);
begin
   removerVariasDisciplinas;
end;

procedure TfrmMatriculas.ConfirmarDisciplina;
const
   SQL_POSSUI_GRUPOS_ATIVIDADE = 'SELECT '+
                                 '  dg.cd_grupo, '+
                                 '	dg.nm_grupo '+
                                 'FROM '+
                                 '  diario_grupos dg '+
                                 'WHERE '+
                                 '	dg.nr_anosemestre = :nr_anosemestre AND '+
                                 '	dg.cd_curso LIKE :cd_curso AND '+
                                 '	dg.cd_turma LIKE :cd_turma AND '+
                                 '	dg.cd_disciplina = :cd_disciplina AND '+
                                 '	dg.sn_ativo = 1';
var
  intAux: Integer;
begin

  intAux := tblFichaIndividualSituacao.AsInteger;

  if ( not (tblFichaIndividualSituacao.AsInteger in [3,4,5,6,7,8, 10] )) then
  begin
    Mensagem( 'Só é possível reativar a matrícula em caso de' + #13 +
	      'reserva, transferência, abandono ou desistência do aluno.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

  if not DM.UsuarioLogado.TemPermissao(1055, npAcesso, true) then Exit;

  if Mensagem( 'Deseja confirmar a matrícula para a disciplina do aluno selecionado?', Application.Title,
	       MB_YESNO + MB_ICONQUESTION ) = ID_NO then Exit;

  Dm.qAux1.Close;

  Dm.qAux1.SQL.Clear;
  Dm.qAux1.SQL.Add('update FichaIndividual set Situacao = 1, dt_saida = null ');

  Dm.qAux1.SQL.Add('where');
  Dm.qAux1.SQL.Add('CodigoAluno = :CodigoAluno and');
  Dm.qAux1.SQL.Add('Turma = :Turma and');
  Dm.qAux1.SQL.Add('AnoSemestre = :AnoSemestre');
  Dm.qAux1.SQL.Add('and disciplina = :disciplina');

  Dm.qAux1.ParamByName('CodigoAluno').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
  Dm.qAux1.ParamByName('Turma').AsString        := tblFichaIndividualTurma.AsString;
  Dm.qAux1.ParamByName('AnoSemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
  Dm.qAux1.ParamByName('Disciplina').AsInteger  := tblFichaIndividualDisciplina.AsInteger;

  Dm.qAux1.ExecSQL;

  // Verifica se a disciplina possui grupo de atividade criado
  qyPossuiGruposAtividades.SQL.Text := SQL_POSSUI_GRUPOS_ATIVIDADE;

  qyPossuiGruposAtividades.Close;
  qyPossuiGruposAtividades.ParamByName('nr_anosemestre').AsInteger := tblFichaIndividualAnoSemestre.AsInteger;
  qyPossuiGruposAtividades.ParamByName('cd_curso').AsString := tblFichaIndividualCurso.AsString;
  qyPossuiGruposAtividades.ParamByName('cd_turma').AsString := tblFichaIndividualTurma.AsString;
  qyPossuiGruposAtividades.ParamByName('cd_disciplina').AsInteger := tblFichaIndividualDisciplina.AsInteger;
  qyPossuiGruposAtividades.Open;

  // Disciplina possui grupo de atividade criado
  if not qyPossuiGruposAtividades.Eof then
  begin
     // Avisa o usuário que ele está ativando uma disciplina relacionada a um grupo de atividade
     Mensagem('Você ativou uma disciplina com grupos de atividades relacionados. Favor vincular este aluno a um grupo de atividade para que ele seja exibido no diário.'+#13+
              'Para vincular o aluno no grupo acesse a tela "Cadastros > Grupos de Atividades Práticas"', 'Informação', MB_OK + MB_ICONINFORMATION );
  end;

  DM.setLog(1055, 'Alteracao', IntToStr(tblFichaIndividualCodigoAluno.AsInteger) + ';' + tblFichaIndividualTurma.AsString + ';' + tblFichaIndividualAnoSemestre.AsString, DM.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger),
  'Ativação manual da disciplina: ' + tblFichaIndividualDescricaoDisciplina.AsString + ' código: ' + tblFichaIndividualDisciplina.AsString);


  tblFichaIndividual.Close;
  tblFichaIndividual.Open;

  if intAux in [3..8] then
  Begin

     DM.DeptoCursoTurma(tblFichaIndividualAnoSemestre.AsInteger, tblFichaIndividualTurma.AsString);

     DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger);

  End;

  Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
end;

procedure TfrmMatriculas.MatrculanaEtapa1Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then Exit;

   Application.CreateForm(TFrmMatriculasAlterar, FrmMatriculasAlterar);

   FrmMatriculasAlterar.CodigoPessoa := tblMatriculasCodigoAluno.AsInteger;
   FrmMatriculasAlterar.Turma        := tblMatriculasTurma.AsString;
   FrmMatriculasAlterar.AnoSmemestre := tblMatriculasAnoSemestre.AsInteger;

   if frmMatriculasAlterar.ShowModal = mrAll Then
   Begin
	   tblMatriculas.Close;
	   tblMatriculas.Open;

	   tblMatriculas.Locate('turma;anosemestre;codigoaluno', vararrayof( [
			     FrmMatriculasAlterar.Turma, FrmMatriculasAlterar.AnoSmemestre,
			     FrmMatriculasAlterar.CodigoPessoa] ), [loCaseInsensitive]);
   End;

   FrmMatriculasAlterar.Free;
end;

procedure TfrmMatriculas.MatrculanoCurso1Click(Sender: TObject);
var
   lugar : Pointer;
begin
     if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then Exit;

     lugar := tblMatriculas.GetBookmark();

     Application.CreateForm(TFrmMatricularCurso, FrmMatricularCurso);
     FrmMatricularCurso.qyMatriculaCurso.Close();
     FrmMatricularCurso.qyMatriculaCurso.Close();
     FrmMatricularCurso.qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := tblMatriculascd_matricula_curso.AsInteger;
     FrmMatricularCurso.qyMatriculaCurso.Open();
     FrmMatricularCurso.qyMatriculaCurso.Edit();

     FrmMatricularCurso.ShowModal;

     tblMatriculas.Close();
     tblMatriculas.Open();
     tblMatriculas.GotoBookmark(lugar);

     FreeAndNil( FrmMatricularCurso );
end;

procedure TfrmMatriculas.MatrculanoCursoTurma1Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1090, npAlterar, True ) then Exit;


   if (tblMatriculasTurma.IsNull) then
   begin
      Mensagem( 'Favor filtrar algum aluno antes de prosseguir.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
   end;

   Application.CreateForm(TformMatriculaCursoTurma, formMatriculaCursoTurma);


   formMatriculaCursoTurma.Turma        := tblMatriculasTurma.AsString;
   formMatriculaCursoTurma.anoSemestre := tblMatriculasAnoSemestre.AsString;
   formMatriculaCursoTurma.curso := tblMatriculasCurso.AsString;
   formMatriculaCursoTurma.cdPessoa := tblMatriculasCODIGOALUNO.AsString;
   formMatriculaCursoTurma.carregaAlunosTurma();

   formMatriculaCursoTurma.ShowModal;

   formMatriculaCursoTurma.Free;
end;

procedure TfrmMatriculas.MenuItem1Click(Sender: TObject);
begin
   ConfirmarDisciplina;
   tblResumoFicha.Close;
   tblResumoFicha.Open;
end;


procedure TfrmMatriculas.SpeedButton6Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmMatriculas.btnFecharDocClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmMatriculas.btnFiltroDataClick(Sender: TObject);
const
   SHintFiltroData = 'De: %s até: %s';
var
   HintFiltro: string;
   mrFiltroData: Integer;
begin
   if not Assigned(fMatriculasFiltroData) then
   begin
      Application.CreateForm(TfMatriculasFiltroData, fMatriculasFiltroData);
   end;
   fMatriculasFiltroData.Left := btnFiltroData.ClientOrigin.X;
   fMatriculasFiltroData.Top := btnFiltroData.ClientOrigin.Y - fMatriculasFiltroData.Height;

   mrFiltroData := fMatriculasFiltroData.ShowModal;

   if mrFiltroData = mrOk then
   begin
      HintFiltro := Format(SHintFiltroData, [
         DateToStr(fMatriculasFiltroData.umdtInicio.Date),
         DateToStr(fMatriculasFiltroData.umdtFim.Date)]
      );
      btnFiltroData.Hint := HintFiltro;
      btnFiltroData.Marked := True;
      SpeedButton2.Marked := False;
      SpeedButton1.Marked := False;
      tbnBuscaDisciplina.Marked := False;
      TipoFiltro := FiltroData;
      Filtrar;
   end
   else if mrFiltroData = mrCancel then
   begin
      btnFiltroData.Marked := False;
      SpeedButton2.Marked := False;
      SpeedButton1.Marked := False;
      tbnBuscaDisciplina.Marked := False;
      TipoFiltro := FiltroMatriculas;
      Filtrar;
   end;
end;

procedure TfrmMatriculas.btnFormaIngressoClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   { Alterar Situação de Matrículas }

   if not DM.UsuarioLogado.TemPermissao( 1018, npAcesso, True ) then Exit;

   PosX := btnFormaIngresso.Left + PrincipalForm.Left + 10;
   PosY := toolAlunos1.Top + PrincipalForm.Top + 55;

   popFormaIngresso.Popup(PosX, PosY);
end;

procedure TfrmMatriculas.SpeedButton3Click(Sender: TObject);
begin
   close
end;

procedure TfrmMatriculas.trocarDisciplinaGenerica(Sender: TObject);
var
   sAux, sChave: String;
begin

   if not DM.UsuarioLogado.TemPermissao( 1033, npAlterar, True ) then Exit;

   if tblFichaIndividual.FieldByName('cd_disciplina_generica').IsNull then
   begin
      Mensagem( 'Essa disciplina não possui uma disciplina genérica vinculada ou não é uma disciplina optativa.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
   end;

   frmSelDisciplinaGenerica.iAnoSemestre := tblFichaIndividual.FieldByName('anosemestre').AsInteger;
   frmSelDisciplinaGenerica.iCodigoAluno := tblFichaIndividual.FieldByName('codigoaluno').AsInteger;
   frmSelDisciplinaGenerica.sTurma := tblMatriculasTurma.AsString;
   frmSelDisciplinaGenerica.sCurso := tblFichaIndividual.FieldByName('curso').AsString;
   frmSelDisciplinaGenerica.SetDisciplinaOptativa(tblFichaIndividual.FieldByName('disciplina').AsInteger, tblFichaIndividual.FieldByName('descricaodisciplina').AsString);

   // Se o usuário selecionou uma disciplina genérica válida
   if frmSelDisciplinaGenerica.ShowModal = mrOk then
   begin

      // Atualiza a fichaindividual optativas para a nova disciplina genérica
      qyTrocarDiscGenerica.Close;
      qyTrocarDiscGenerica.ParamByName('anosemestre').AsInteger := tblFichaIndividual.FieldByName('anosemestre').AsInteger;
      qyTrocarDiscGenerica.ParamByName('turma').AsString := tblFichaIndividual.FieldByName('turma').AsString;
      qyTrocarDiscGenerica.ParamByName('codigoaluno').AsInteger := tblFichaIndividual.FieldByName('codigoaluno').AsInteger;
      qyTrocarDiscGenerica.ParamByName('disciplina').AsInteger := tblFichaIndividual.FieldByName('disciplina').AsInteger;
      qyTrocarDiscGenerica.ParamByName('nr_serie').AsInteger := tblFichaIndividual.FieldByName('nr_serie_generica').AsInteger;
      qyTrocarDiscGenerica.ParamByName('cd_disciplina_generica').AsInteger := tblFichaIndividual.FieldByName('cd_disciplina_generica').AsInteger;

      qyTrocarDiscGenerica.ParamByName('nr_serie_nova').AsInteger := frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('nr_serie').AsInteger;
      qyTrocarDiscGenerica.ParamByName('cd_disciplina_generica_nova').AsInteger := frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('cd_disciplina_generica').AsInteger;

      qyTrocarDiscGenerica.ExecSQL;

      // Define mensagem do log e grava
      sAux := 'Ajuste de Matrícula - Alterou disciplina: "['+tblFichaIndividual.FieldByName('cd_disciplina_generica').AsString+'] ' + tblFichaIndividual.FieldByName('DescricaoDisciplina').AsString+'" (Modificou disciplina genérica de "['+tblFichaIndividual.FieldByName('cd_disciplina_generica').AsString+'] '+tblFichaIndividual.FieldByName('nm_disciplina_generica').AsString+'" para "['+frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('cd_disciplina_generica').AsString+'] '+frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('ds_disciplina_generica').AsString+'")';
      sChave := tblMatriculasCodigoAluno.AsString + ';' + tblFichaIndividual.FieldByName('turma').AsString + ';' + tblFichaIndividual.FieldByName('disciplina').AsString;
      DM.setLog(1033, 'Alteracao', sChave, dm.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger), sAux );

      // Apresenta a mensagem de sucesso
      Mensagem('Troca de disciplina genérica efetuada com sucesso.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

      // Recarrega informações em tela
      tblFichaIndividual.Close;
      tblFichaIndividual.Open;

   end;

end;

procedure TfrmMatriculas.TrocaDeTurma;
begin
  { Esse procedimento permite:
    - Alterar a Turma de Matrícula
    - Registrar uma transferencia Interna e matricular na nova turma
  }

  case tblMatriculasSituacao.AsInteger of
    0,2,4..9 : begin
      Mensagem( 'Só é possível alterar turma de um aluno cursando.', Application.Title, MB_OK + MB_ICONSTOP );
      Exit;
    end;
  end;

  formTransferenciaDeTurma.carregaDados(
      tblMatriculasTurma.AsString,
      tblMatriculasCurso.AsString,
      tblMatriculasAnoSemestre.AsString,
      tblMatriculasCODIGOALUNO.AsInteger,
      DateTimeToString(tblMatriculasDataSaida.AsDateTime),
      tblMatriculascd_turno.AsString
  );

  formTransferenciaDeTurma.Show;

  tblMatriculas.Close;
  tblMatriculas.Open;
end;

procedure TfrmMatriculas.rocadeTurma1Click(Sender: TObject);
begin
   TrocaDeTurma;
end;

procedure TfrmMatriculas.pmQtdMatriculasPopup(Sender: TObject);
const
   STotalRegs = 'Total de registros';
   STotalMats = 'Quantidade total de matrículas';
   STotalAtvs = 'Total de Alunos Ativos';
   STotalRevs = 'Total de Reservas não efetivadas';
var
   Item: TMenuItem;
   I: Integer;
   SLSituacoes: TStringList;
   Marcador: TBookmark;
begin
   Marcador := tblMatriculas.GetBookmark;
   tblMatriculas.DisableControls;
   tblMatriculas.First;

   SLSituacoes := TStringList.Create;
   try

      SLSituacoes.Values[STotalRegs] := StringOfChar(#42, tblMatriculas.RecordCount);

      while not tblMatriculas.Eof do
      begin
         if qrySituacaoMatriculaCD_SITUACAO_PAI.AsInteger = 10 then
         begin
            SLSituacoes.Values[STotalRevs] :=
               StringOfChar(#42, Length(SLSituacoes.Values[STotalRevs]) + 1); 
         end
         else
         begin
            if not (tblMatriculasCD_SITUACAO_PAI.AsInteger in [3, 4, 5, 6, 7, 8]) then
            begin
               SLSituacoes.Values[STotalAtvs] :=
                  StringOfChar(#42, Length(SLSituacoes.Values[STotalAtvs]) + 1);
            end;

            SLSituacoes.Values[STotalMats] :=
                  StringOfChar(#42, Length(SLSituacoes.Values[STotalMats]) + 1);

            SLSituacoes.Values[tblMatriculasSituacaoMatricula.AsString] :=
                  StringOfChar(#42, Length(
                     SLSituacoes.Values[tblMatriculasSituacaoMatricula.AsString]) + 1);
         end;

         tblMatriculas.Next;
      end;

      pmQtdMatriculas.Items.Clear;
      
      for I := 0 to SLSituacoes.Count - 1 do
      begin
         Item := TMenuItem.Create(Self);
         try
            Item.Caption := Format('%s: %d', [SLSituacoes.Names[I],
               Length(SLSituacoes.ValueFromIndex[I])]);
            pmQtdMatriculas.Items.Add(Item);
         finally
            Item := nil;
         end;
      end;
      
   finally
      SLSituacoes.Clear;
   end;
   tblMatriculas.GotoBookmark(Marcador);
   tblMatriculas.EnableControls;
end;

procedure TfrmMatriculas.pmQtdFichaIndividualPopup(Sender: TObject);
var
   i: integer;
   encontrou : Boolean;
begin
  encontrou := false;
  for i := 0 to pmQtdFichaIndividual.Items.Count - 1 do
  begin
     if pmQtdFichaIndividual.Items[i].Name = 'creditoFinan' then
     begin
      encontrou := true;
      break;
     end;
  end;

  if encontrou then
   DM.quantidade_registros(tblFichaIndividual, pmQtdFichaIndividual, False)
  else
   DM.quantidade_registros(tblFichaIndividual, pmQtdFichaIndividual);
end;

procedure TfrmMatriculas.pmQtdDocPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDoc, pmQtdDoc);

end;

procedure TfrmMatriculas.btnDigitalizarClick(Sender: TObject);
var
   LDocsNecessarios: TIntegerArray;
  largura, altura, dpi: Integer;
  lugar : Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npAcesso, True ) then Exit;

   if (DM.variavel_parametro('sn_digitaliza_nova') = 'S') then
   begin
      Application.CreateForm(TFDigDocumentos, FDigDocumentos);

      if tblMatriculasCodigoAluno.AsInteger <> 0 then
      begin
         tblDoc.First;

         while not tblDoc.Eof do
         begin
            if not tblDoc.FieldByName('curso').IsNull then
            begin
               SetLength(LDocsNecessarios, Length(LDocsNecessarios) + 1);
               LDocsNecessarios[Length(LDocsNecessarios) - 1] :=
                  tblDoc.FieldByName('codigo').AsInteger;
            end;

            tblDoc.Next;
         end;
         
         FDigDocumentos.DocsNecessarios := LDocsNecessarios;
         FDigDocumentos.iCodAluno:=tblMatriculasCodigoAluno.AsInteger;
         FDigDocumentos.iCodCurso := tblMatriculasCurso.AsString;

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
         tblDoc.close();
         tblDoc.Open();
      end;
   end
   else
   begin
      Application.CreateForm(TfrmDig, frmDig);

      largura := tblDoc.FieldByName('nr_altura').AsInteger;
      altura := tblDoc.FieldByName('nr_altura').AsInteger;
      dpi := tblDoc.FieldByName('nr_dpi').AsInteger;

      if frmDig.AdquirirImagem(largura, altura, dpi, tblDocDocumento.AsString) then
      begin
         lugar := tblDoc.GetBookmark;
         
         tblDoc.Close;
         tblDoc.Open;
         tblDoc.GotoBookmark(lugar);
      end;
   end;
end;


function TfrmMatriculas.podeAtivarDisciplina: Boolean;
var
   qryVerificaSituacao: TUMZQuery;
begin

   dm.CriarConsulta(qryVerificaSituacao);



   qryVerificaSituacao.SQL.Text := ''+
   'SELECT '+
   '  cd_situacao '+
   'FROM '+
   '  matriculas_curso '+
   'WHERE '+
   '  cd_matricula_curso = :cd_matricula_curso'+
   '  AND cd_pessoa = :cd_pessoa';

   qryVerificaSituacao.ParamByName('cd_matricula_curso').AsInteger := tblMatriculascd_matricula_curso.AsInteger;
   qryVerificaSituacao.ParamByName('cd_pessoa').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;

   qryVerificaSituacao.Open;

   if (qryVerificaSituacao.FieldByName('cd_situacao').AsInteger in [3, 7, 8]) then
   begin
      Result := False;
   end
   else
   begin
      Result := True;
   end;

end;

procedure TfrmMatriculas.popDocumentacaoPopup(Sender: TObject);
begin
   popDocumentacao.Items[0].Checked := tblDocExiste.AsBoolean;
   popDocumentacao.Items[2].Enabled := tblDocDigitalizou.AsBoolean;
end;

procedure TfrmMatriculas.alteraCreditosFinanceiroPorAluno(Sender: TObject);
var
   nrCreditosFinanceiros,observacao,codigoUsuario,observacaoUsuario,nrCreditosFinanceirosInicial: string;
   codigoUsuarioPos,contadorObsAntes,contadorObsDps: Integer;
   qryAux: TUMZQuery;
begin
   { Realiza a alteração de créditos financeiros por aluno }

   nrCreditosFinanceirosInicial := tblFichaIndividualNR_CR_FIN.AsString;;
   nrCreditosFinanceiros := tblFichaIndividualNR_CR_FIN.AsString;
   InputQueryEvento('UNIMESTRE', 'Informe o numero de créditos financeiros para este aluno na disciplina ' + DBGrid2.Fields[1].Text + ':',nrCreditosFinanceiros,realizaExpressaoRegular);

   { Caso ele tenha mudado o valor dos creditos, se ja possuir anteriormente, e o campo não estando vazio, caso ele possua credito o campo poed ser vazio para retirar a alteração }
   if (nrCreditosFinanceirosInicial <> nrCreditosFinanceiros) and ((nrCreditosFinanceiros <> '') or (not tblFichaIndividualNR_CR_FIN.IsNull)) then
   begin

      codigoUsuario := grdDisci.Fields[0].Text;
      codigoUsuarioPos := Pos('-',codigoUsuario);
      codigoUsuario := Copy(codigoUsuario,0,(codigoUsuarioPos -1)) +
                       Copy(codigoUsuario,(codigoUsuarioPos +1),Length(codigoUsuario));

      observacao := 'Alteração de créditos financeiros para disciplina '
                     + DBGrid2.Fields[1].Text
                     + ' Valor: ' + nrCreditosFinanceiros
                     + ' Motivo: ';

      { Checa se o numero de registros de observações para este usuario mudou, caso não significa que o usuario nao digitou o motivo, e isto cancela a alteração }
      DM.CriarConsulta(qryAux);
      qryAux.SQL.Text := 'select count(CD_OBSERVACAO) as cd_obs from uni_observacoes where cd_pessoa = :CDPESSOA and CD_USUARIO = :CDUSUARIO and SG_TIPO = :TIPO';
      qryAux.ParamByName('CDPESSOA').AsString := codigoUsuario;
      qryAux.ParamByName('CDUSUARIO').AsString := inttostr(dm.GetUsuarioLogado.Pessoa.Codigo);
      qryAux.ParamByName('TIPO').AsString := 'F';
      qryAux.Open;
      contadorObsAntes :=  qryAux.FieldByName('cd_obs').AsInteger;
      qryAux.Close;

      TfObservacoes.ShowObservations(Self, strtoint(codigoUsuario),
         okFinancial,true,observacao);

      qryAux.Open;
      contadorObsDps :=  qryAux.FieldByName('cd_obs').AsInteger;

      if ( contadorObsDps > contadorObsAntes ) then
      begin

         { Caso tenha sido inserido a obs insere na fichaindividual e na log geral }
         with QryAlterarCrFinanPDisc do
         begin
            if nrCreditosFinanceiros = '' then
               ParamByName('CRFIN').value := Null
            else
               ParamByName('CRFIN').value := nrCreditosFinanceiros;

            ParamByName('CODIGOALUNO').value := codigoUsuario;
            ParamByName('DISICPLINA').value := tblFichaIndividualdisciplina.AsInteger;
            ParamByName('ANOSEMESTRE').value := tblFichaIndividualAnoSemestre.AsInteger;
            ExecSQL;
         end;

         with QryLogGeral do
         begin

			observacao := 'Alteração de créditos financeiros para disciplina '
                     + DBGrid2.Fields[1].Text
                     + ' Valor: ' + nrCreditosFinanceiros;

         
            ParamByName('PESSOA').value := codigoUsuario;
            ParamByName('USUARIO').value  := dm.GetUsuarioLogado.Pessoa.Codigo;
            ParamByName('DATALOG').value := Now;
            ParamByName('MODULO').value := '53';
            ParamByName('CHAVE').value := codigoUsuario + ';'
               + tblFichaIndividualAnoSemestre.AsString
               + ';' + DBGrid2.Fields[1].Text
               + ';' + DateTimeToStr(Now) ;

            ParamByName('ACAO').value := Null;
            ParamByName('OPERACAO').value := 1;
            ParamByName('COLIGADA').value := DM.UsuarioLogado.GetColigadaLogada.Codigo;
            ParamByName('OBSERVACAO').value := observacao;
            ExecSQL;
         end;

         DM.recalcular_creditos_financeiros(tblFichaIndividualCodigoAluno.AsInteger,tblFichaIndividualTurmaMatricula.AsString,tblFichaIndividualAnoSemestre.AsInteger,true,false);
         tblFichaIndividual.Refresh;
         tblResumoFicha.Refresh;
      end;
   end;
end;

procedure TfrmMatriculas.AlunoEntregouDocumento1Click(Sender: TObject);
begin
   if popDocumentacao.Items[0].Checked then
      btnDesmarcarClick(nil)
   else
      btnMarcarClick(nil);
end;

procedure TfrmMatriculas.Digitalizardocumento1Click(Sender: TObject);
begin
   btnDigitalizarClick(nil);
end;

procedure TfrmMatriculas.Limparadigitalizao1Click(Sender: TObject);
var lugar : Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;

   if Mensagem('Tem certeza que deseja excluir da base de dados a digitalização do documento? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
   = mrNo then Exit;

   { Coloca a tabela em modo de edição }
    qyDocDigital.SQL.Clear();
    qyDocDigital.SQL.Add('UPDATE documentos_digitalizados SET im_doc1=NULL AND im_doc2=NULL AND im_doc3=NULL AND im_doc4=NULL where cd_pessoa = :cdpessoa AND cd_documento = :cddocumento LIMIT 1');
    qyDocDigital.Params.ParamByName('cddocumento').Value := tblDocCodigo.AsInteger;
    qyDocDigital.Params.ParamByName('cdpessoa').Value := tblMatriculasCodigoAluno.AsInteger;
    qyDocDigital.ExecSQL;


   { Atualizar Tabela de Documentos }

	  qAux.SQL.Clear;
	  qAux.SQL.Add('Update Documentos_Alunos Set Apresentou = ''S'', sn_digitalizado = ''N''');
	  qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
	  qAux.ParamByName('ALUNO').Value := tblMatriculasCodigoAluno.Value;
	  qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
	  qAux.ExecSQL;
	  lugar := tblDoc.GetBookmark;
	  tblDoc.Close;
	  tblDoc.Open;
	  tblDoc.GotoBookmark(lugar);

end;

procedure TfrmMatriculas.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   // Type cast para permitir acessar a propriedade Columns
   // Será modificado futuramente após substituir todos os componentes TDBGrid 
   frmSelColunas.SelecionaColunas(TDBGrid(TCustomDBGrid(grd)), 'planilha_matriculas_campos');
end;

procedure TfrmMatriculas.sbSelecionarColunaDiscClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(DBGrid2, 'planilha_matriculas_disciplinas_campos');
end;

procedure TfrmMatriculas.setApresentou(sT: string);
var lugar : Pointer;
begin
	  qAux.SQL.Clear;
    
     if (sT = 'N') then
         qAux.SQL.Add('Update Documentos_Alunos SET dt_entrega = NULL, sn_digitalizado = ''' + sT + '''')
     else
         qAux.SQL.Add('Update Documentos_Alunos Set dt_entrega = now(), Apresentou = ''' + sT + ''', sn_digitalizado = ''' + sT + '''');
         
	  qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
	  qAux.ParamByName('ALUNO').Value := tblMatriculasCodigoAluno.Value;
	  qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
	  qAux.ExecSQL;
	  lugar := tblDoc.GetBookmark;
	  tblDoc.Close;
	  tblDoc.Open;
	  tblDoc.GotoBookmark(lugar);
end;

procedure TfrmMatriculas.Digitalizaroversododocumento1Click(
  Sender: TObject);
begin
   btnDigitalizarClick(nil);
end;

procedure TfrmMatriculas.btnExcluirDocClick(Sender: TObject);
var
   sAux: string;
   lugar: Pointer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npExcluir, True ) then Exit;

   if not tblDoc.IsEmpty then begin
      if tblDocsn_obrigatorio.AsString = 'S' then begin
         Mensagem('Documento não pode ser removido pois é definido como obrigatório!!!', 'Atenção', MB_OK);
         Exit;
      end
      else begin
         sAux := 'Você tem certeza que deseja excluir o documento: '+ tblDocDocumento.AsString+ ' ?';
         if (Mensagem(sAux, 'Atenção!!', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin
            with qAux do begin
               Close();
               SQL.Clear();
               Params.Clear();
               SQL.Text := 'DELETE FROM documentos_alunos WHERE codigoaluno = :codaluno AND cod_documento = :coddocumento';
               ParamByName('codaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
               ParamByName('coddocumento').AsInteger := tbldocCodigo.AsInteger;
               ExecSQL();

               DM.setLog(1020, 'Exclusao', tblMatriculasCodigoAluno.AsString + ';' + tblDocCodigo.AsString, DM.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger));

               Close();
            end;

            if not tblDoc.Bof then
               tblDoc.Prior()
            else if not tblDoc.Eof then
               tblDoc.Next()
            else
               tblDoc.First();
            lugar := tblDoc.GetBookmark;
            tblDoc.Close;
            tblDoc.Open;
            tblDoc.GotoBookmark(lugar);
         end;
      end;
   end;
end;

procedure TfrmMatriculas.btnIncluirDocClick(Sender: TObject);
var
   iRes: Integer;
   iCodDoc: LongInt;
   lugar: Pointer;
begin

   if not DM.UsuarioLogado.TemPermissao( 1020, npIncluir, True ) then Exit;

   frmAddDocumento := TfrmAddDocumento.Create(Self);
   frmAddDocumento.qyDoc.Connection := DM.db;
   iRes := frmAddDocumento.ShowModal();
   if iRes = mrCancel then begin
      FreeAndNil(frmAddDocumento);
      Exit;
   end
   else if iRes = mrOk then begin
      iCodDoc := frmAddDocumento.getCodDoc();
   end;
   FreeAndNil(frmAddDocumento);

   if (iCodDoc > 0) then begin
      with qAux do begin
         Close();
         SQL.Clear();
         Params.Clear();
         SQL.Text := 'INSERT INTO documentos_alunos (codigoaluno, cod_documento, apresentou) VALUES (:codaluno, :coddocumento, ''N'')';
         ParamByName('codaluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
         ParamByName('coddocumento').AsInteger := iCodDoc;
         ExecSQL();

         DM.setLog(1020, 'Inclusao', tblMatriculasCodigoAluno.AsString + ';' + tblDocCodigo.AsString, dm.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger));

         Close();
      end;
      lugar := tblDoc.GetBookmark;
      tblDoc.Close;
      tblDoc.Open;
      tblDoc.GotoBookmark(lugar);
   end;

end;

procedure TfrmMatriculas.popNumerarAlunosPopup(Sender: TObject);
begin
   if tblMatriculas.IsEmpty then begin
      popNumerarAlunos.Items[0].Caption := 'Nenhuma turma selecionada para renumerar';
      popNumerarAlunos.Items[0].Enabled := False;
      popNumerarAlunos.Items[1].Visible := False;
   end
   else begin
      popNumerarAlunos.Items[0].Caption := 'Renumerar turma ' + tblMatriculasTurma.AsString +  ' (' + tblMatriculasAnoSemestre.DisplayText + ')';
      popNumerarAlunos.Items[1].Caption := 'Renumarar curso ' + tblMatriculasCurso.AsString +  ' (' + tblMatriculasAnoSemestre.DisplayText + ')';

      popNumerarAlunos.Items[0].Enabled := True;
      popNumerarAlunos.Items[1].Visible := True;

   end;

end;

procedure TfrmMatriculas.popOutrasAcoesPopup(Sender: TObject);
var
   IsFiltroTurma, IsFiltroAluno: Boolean;
begin
   IsFiltroTurma := False;
   IsFiltroAluno := False;

   if (tblMatriculas.RecNo < 1) AND ((sFiltroAnosemestre = '') AND (sFiltroCurso = '') AND (sFiltroTurma = '')) then
   begin
      Mensagem('É necessário selecionar uma matrícula ou uma Turma.', 'Atenção', MB_OK + MB_ICONINFORMATION, Handle);
      Abort;
   end else begin
      IsFiltroAluno := (tblMatriculas.RecNo >= 1);
      IsFiltroTurma := ((sFiltroAnosemestre <> '') AND (sFiltroCurso <> '') AND (sFiltroTurma <> ''));
   end;

   CadastrodeTurmas1.Enabled := IsFiltroAluno OR IsFiltroTurma;
   Cronograma1.Enabled := IsFiltroAluno OR IsFiltroTurma;
   PlanilhadeRecebimentos1.Enabled := IsFiltroAluno;
   CadastrodeAlunos1.Enabled := IsFiltroAluno;
end;

procedure TfrmMatriculas.ranferenciadeCurso1Click(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1108, npAcesso, true) then
   begin

      //Caso a situação do aluno esteja como aprovado ou reprovado.
      if (Self.tblMatriculasSituacao.AsInteger in [0, 9]) then
      begin

         Mensagem(
            'Este aluno não pode realizar a transferência de curso, pois o mesmo'+
            ' esta com a sua situação de matrícula como aprovado ou reprovado!' +
            #13 + 'Para o caso deste aluno deverá ser feita uma nova matrícula!',
            'Atenção',
            MB_OK + MB_ICONWARNING
         );
         
         Exit;
      end;


      TfTransferencia.ExecutaTransferencia(
         Self.tblMatriculascd_matricula_curso.AsInteger,
         Self.tblMatriculasCodigoAluno.AsInteger,
         Self.tblMatriculasAnoSemestre.AsInteger,
         Self.tblMatriculasnr_anosem_ingresso.AsInteger,
         Self.tblMatriculascd_ingresso.AsInteger,
         Self.tblMatriculasPlanoPagamento.AsInteger,
         Self.tblMatriculasCurso.AsString,
         Self.tblMatriculasTurma.AsString,
         Self.tblMatriculasNome.AsString,
         Self);
      Self.tblMatriculas.Close;
      Self.tblMatriculas.Open;
   end;
end;

procedure TfrmMatriculas.realizaExpressaoRegular(Sender: TObject);
var
   stringAux: string;
   Edit: TEdit;
   charAux : Char;
begin
   { Realiza os filtros no edit da alteração de créditos financeiros por aluno  }
   Edit := TEdit(Sender);
   if Edit.MaxLength <> 6 then
      Edit.MaxLength := 6;

   if length(Edit.Text) = 0 then
   begin
      exit;
   end;
   
   stringAux := copy(Edit.Text,length(Edit.Text),1);
   charAux := stringAux[1];

   if Edit.Enabled then
   begin
      if Edit.Focused() then
      begin
         if charAux in ['1','2','3','4','5','6','7','8','9','0','.'] then
            exit
         else
         begin
            stringAux := Edit.Text;
            delete(stringAux,length(stringAux),1);
            Edit.Text := stringAux;
            Edit.SetFocus;
            Edit.Selstart := Length(Edit.text);
            exit;
         end;
      end;
   end;
end;

procedure TfrmMatriculas.btnRenumerarClick(Sender: TObject);
Var
  PosX, PosY : Word;
begin

   if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then Exit;

   PosX := btnRenumerar.Left + PrincipalForm.Left + 20;
   PosY := toolAlunos1.Top + PrincipalForm.Top + 75 ;

   popNumerarAlunos.Popup(PosX, PosY);

end;

procedure TfrmMatriculas.RenumerarAlunos(iTipo : word; anosemestre : Integer; curso, turma : String);
var
   iNumero : Word;
begin

case  iTipo of

  1 : begin
      if numerarCurso = False then
        if Mensagem('Tem certeza que deseja renumerar a turma selecionada?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes then Exit;

        with DM.qAux2 do begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE matriculas m ');
            SQL.Add(' SET m.nr_aluno = 0 ');
            SQL.Add(' WHERE m.turma = :CdTurma AND m.anosemestre = :NrAnoSem ');
            SQL.Add('   AND m.situacao in (3,4,5,6,7,8) ');

            ParamByName('CdTurma').AsString := turma;
            ParamByName('NrAnoSem').AsInteger := anosemestre;
            ExecSQL();
        end;

        with DM.qAux2 do begin
            Close;
            SQL.Clear;
            SQL.Add(' SELECT m.codigoaluno, m.turma, m.anosemestre, p.nm_pessoa ');
            SQL.Add(' FROM matriculas m, pessoas p ');
            SQL.Add(' WHERE m.codigoaluno = p.cd_pessoa ');
            SQL.Add('   AND m.turma = :CdTurma AND m.anosemestre = :NrAnoSem ');
            SQL.Add('   AND m.situacao not in (3,4,5,6,7,8) ');
            SQL.Add(' ORDER by p.nm_pessoa ');

            ParamByName('CdTurma').AsString := turma;
            ParamByName('NrAnoSem').AsInteger := anosemestre;
            Open();
        end;

        with DM.qyAux do begin
            Close;
            SQL.Clear;
            SQL.Add(' UPDATE matriculas m set m.nr_aluno = :NrAluno ');
            SQL.Add(' WHERE m.codigoaluno = :CdAluno ');
            SQL.Add('   AND m.turma = :CdTurma AND m.anosemestre = :NrAnoSem ');

        end;

        iNumero := 1;

        while not Dm.qAux2.Eof do begin
            Dm.qyAux.ParamByName('CdAluno').AsInteger :=  Dm.qAux2.FieldByName('codigoaluno').AsInteger;
            DM.qyAux.ParamByName('CdTurma').AsString := DM.qAux2.FieldByName('turma').AsString;
            DM.qyAux.ParamByName('NrAnoSem').AsInteger := DM.qAux2.FieldByName('anosemestre').AsInteger;
            Dm.qyAux.ParamByName('NrAluno').AsInteger := iNumero;
            DM.qyAux.ExecSQL();

            Inc(iNumero);

            DM.qAux2.Next;

        end;

        tblMatriculas.Close;
        tblMatriculas.Open;


      end;

end;

end;

procedure TfrmMatriculas.GerarNumeraodaTurmaXXXX200511Click(Sender: TObject);
begin
   RenumerarAlunos( TMenuItem(Sender).Tag, tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString, tblMatriculasTurma.AsString );
end;

procedure TfrmMatriculas.GerarNumeraodoCursoXXXX200511Click(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja renumerar o curso selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes then Exit;
   begin
      numerarCurso := True;
      qryTurmas.Close();
      qryTurmas.ParamByName('CURSO').AsString := tblMatriculasCurso.AsString;
      qryTurmas.ParamByName('ANOSEMESTRE').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      qryTurmas.Open;
      while not qryTurmas.Eof do
      begin
         RenumerarAlunos( 1, qryTurmasanosemestre.AsInteger, tblMatriculasCurso.AsString, qryTurmascodigo.AsString );
         qryTurmas.Next;
      end;
   end;
end;

function TfrmMatriculas.TemMensalidadeComCredito(codigoaluno: Integer;
  turma: String; anosemestre: Integer): Boolean;
Var
   qAux : TUMZQuery;
begin
   DM.CriarConsulta(qAux);

   qAux.SQL.Text := 'SELECT count(*) QTD FROM mensalidades ' +
    ' WHERE codigoaluno = ' + IntToStr(codigoaluno) +
    '   AND turma = ' + QuotedStr(turma) + ' ' +
    '   AND anosemestre = ' + IntToStr(anosemestre) +
    '   AND sn_credito_parcela = ''S'' ' ;

   qAux.Open();

   result := (qAux.FieldByName('QTD').AsInteger > 0); 
   
   FreeAndNil(qAux);
end;

procedure TfrmMatriculas.ToolButton6Click(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1020, npAcesso, True ) then Exit;

   Application.CreateForm(TfrmExportarDoc, frmExportarDoc);
end;

function TfrmMatriculas.getSerie(curso: String; anosemestre: Integer;
  turma: String): Integer;
const
   SQL_BUSCA =
      ' SELECT '+
      '   serie '+
      ' FROM '+
      '   turmas '+
      ' WHERE '+
      '  curso = :cd_curso '+
      '  AND codigo = :codigo '+
      '  AND anosemestre = :anosemestre ';
var
   qybusca: TUMZReadOnlyQuery;
begin
   dm.CriarConsulta(qybusca);

   qybusca.SQL.Text := SQL_BUSCA;

   qybusca.ParamByName('cd_curso').AsString := curso;
   qybusca.ParamByName('codigo').AsString := turma;
   qybusca.ParamByName('anosemestre').AsInteger := anosemestre;

   qybusca.Open;

   Result := qybusca.FieldByName('serie').AsInteger;
end;

procedure TfrmMatriculas.grdDblClick(Sender: TObject);
begin
   frm_Horarios_Pessoa := Tfrm_Horarios_Pessoa.Create( nil );
   frm_Horarios_Pessoa.setInfPessoa(
         tblMatriculasCodigoAluno.AsInteger,
         tblMatriculasanosemestre.AsInteger,
         tblMatriculasturma.AsString,
         tblMatriculasNome.AsString);
   frm_Horarios_Pessoa.ShowModal; 
end;

procedure TfrmMatriculas.grdDisciColExit(Sender: TObject);
begin
  DM.quantidade_registros(tblFichaIndividual, pmQtdFichaIndividual, False);
end;

procedure TfrmMatriculas.grdDisciTitleClick(Column: TColumn);
var
  n : Integer;
begin

  if grdDisci.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to grdDisci.Columns.Count - 1 do begin
       grdDisci.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  Column.Title.Font.Style := [fsUnderline];

  Filtrar();

end;

procedure TfrmMatriculas.grdDocTitleClick(Column: TColumn);
var
  n : Integer;
begin

  if grdDoc.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to grdDoc.Columns.Count - 1 do begin
       grdDoc.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  Column.Title.Font.Style := [fsUnderline];

  Filtrar();

end;

{
  verifica se a pessoa possui estagio, caso possui emite uma mensagem
  perguntando se deseja interromper o estagio
}
function TfrmMatriculas.verificaAlunosComEstagio(cd_pessoa: integer; cd_coligada: integer): Boolean;
const
   SQL_VERIFICA_ALUNO_COM_ESTAGIO =
      'SELECT '+
         'ee.cd_estagio as cd_estagio, '+
         'ee.cd_pessoa as cd_pessoa, '+
         'p.nm_pessoa as nomeAluno, '+
         'ee.cd_empresa as cd_empresa, '+
         'emp.nm_empresa as nomeEmpresa, '+
         'DATE_FORMAT(ee.dt_inicial,"%d/%m/%Y") as dt_inicial, ' +
         'DATE_FORMAT(ee.dt_final, "%d/%m/%Y") as dt_final '+
     'FROM '+
         'estnc_estagios as ee '+
            'INNER JOIN pessoas as p ON (p.cd_pessoa = ee.cd_pessoa) '+
            'INNER JOIN empresas as emp ON (emp.cd_empresa = ee.cd_empresa) '+
      'WHERE '+
             'ee.cd_situacao IN(1) AND ee.dt_final >= NOW() AND ee.cd_pessoa = :cd_pessoa ';
var
   qryVerificaEstagio: TUMZQuery;
   sMsg: String;
begin
   result := true;
   DM.CriarConsulta(qryVerificaEstagio);

   try
      qryVerificaEstagio.SQL.Text:= SQL_VERIFICA_ALUNO_COM_ESTAGIO;
      qryVerificaEstagio.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      qryVerificaEstagio.Open;
   except
      on E : Exception do
      begin
         exit;
      end;
   end;

    if qryVerificaEstagio.RecordCount > 0 then
    begin
       sMsg := 'O aluno '+ qryVerificaEstagio.FieldByName('nomeAluno').AsString + CHR(13);
       sMsg := sMsg + ' possui estágio ativo na empresa ' + qryVerificaEstagio.FieldByName('nomeEmpresa').AsString + CHR(13);
       sMsg := sMsg + ' no período de '+ qryVerificaEstagio.FieldByName('dt_inicial').AsString + ' até ' + qryVerificaEstagio.FieldByName('dt_final').AsString + '.' + CHR(13);
       sMsg := sMsg + 'Deseja realmente cancelar a matrícula ?';

       if (Mensagem(sMsg, 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes)  Then
       begin
          while not qryVerificaEstagio.Eof do
          begin
             // caso o usuario confirme
             //interrompe o estagio e grava log
             interrompeEstagio(qryVerificaEstagio.FieldByName('cd_estagio').AsInteger);
             //grava o log da operacao
             gravaLogInterrompeEstagio(
             qryVerificaEstagio.FieldByName('cd_estagio').AsInteger,
             qryVerificaEstagio.FieldByName('cd_pessoa').AsInteger,
             qryVerificaEstagio.FieldByName('cd_empresa').AsInteger,
             cd_coligada,
             qryVerificaEstagio.FieldByName('dt_inicial').AsString,
             qryVerificaEstagio.FieldByName('dt_final').AsString
             );

             //salva o estagio que foi interrompido
             salvaEstagioInterrompido(
             qryVerificaEstagio.FieldByName('cd_estagio').AsInteger,
             qryVerificaEstagio.FieldByName('cd_pessoa').AsInteger,
             qryVerificaEstagio.FieldByName('cd_empresa').AsInteger,
             cd_coligada
             );
             qryVerificaEstagio.Next;
          end;

       end else begin
         result := false;
       end;
    end;
end;

{
 Função que interrompe o estagio caso solicitado pelo usuario

}
procedure TfrmMatriculas.interrompeEstagio(cd_estagio: integer);
const
  SQL_INTERROMPE_ESTAGIO =
  'UPDATE estnc_estagios SET cd_situacao = 3, dt_final = NOW() WHERE cd_estagio = :cd_estagio';
var
  qryInterrompeEstagio: TUMZQuery;
  ds_observacao: String;
begin
  DM.CriarConsulta(qryInterrompeEstagio);
  try
  qryInterrompeEstagio.SQL.Text :=  SQL_INTERROMPE_ESTAGIO;
  qryInterrompeEstagio.ParamByName('cd_estagio').AsInteger := cd_estagio;
  qryInterrompeEstagio.ExecSQL;
  except
    on E : Exception do
      ShowMessage(e.Message);
  end;
end;
{
  grava log dos estagio interrompidos
}
procedure TfrmMatriculas.gravaLogInterrompeEstagio(cd_estagio, cd_aluno, cd_empresa, cd_coligada : integer; dt_inicial, dt_final : string);
var
  ds_observacao: String;
begin
  ds_observacao := 'Estágio ' + IntToStr(cd_estagio) + ' interrompido do Aluno: '+ IntToStr(cd_aluno) + CHR(13);
  ds_observacao :=   ds_observacao + 'na empresa : '+ IntToStr(cd_empresa) + CHR(13);
  ds_observacao :=   ds_observacao + 'no periodo de  : '+ dt_inicial + ' até ' + dt_final ;

  DM.setLog(1033, 'Alteração', '', cd_coligada, ds_observacao);
end;

procedure TfrmMatriculas.salvaEstagioInterrompido(cd_estagio, cd_pessoa, cd_empresa, cd_coligada: integer);
const
  SQL_INSERE_ESTAGIO_INTERROMPIDO =
      'INSERT INTO estnc_estagio_interrompido (cd_estagio, cd_pessoa, cd_empresa, sn_verificado, dt_interrupcao)'+
      'Values (:cd_estagio, :cd_pessoa, :cd_empresa, 0, NOW())';
var
  qryIserirEstagioInterrompido: TUMZQuery;
  ds_observacao: string;
begin
  DM.CriarConsulta(qryIserirEstagioInterrompido);
  qryIserirEstagioInterrompido.SQL.Text:= SQL_INSERE_ESTAGIO_INTERROMPIDO;
  try
  qryIserirEstagioInterrompido.ParamByName('cd_estagio').AsInteger:= cd_estagio;
  qryIserirEstagioInterrompido.ParamByName('cd_pessoa').AsInteger:= cd_pessoa;
  qryIserirEstagioInterrompido.ParamByName('cd_empresa').AsInteger:= cd_empresa;
  qryIserirEstagioInterrompido.ExecSQL;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
  ds_observacao:= ' Inserido um estágio interrompido cd_estagio: '+ IntToStr(cd_estagio) + CHR(13);
  ds_observacao:= ds_observacao + ' e a pessoa : ' + IntToStr(cd_pessoa) + CHR(13);
  ds_observacao:= ds_observacao + ' na empresa : '+ IntToStr(cd_empresa) +';';
  DM.setLog(1033, 'Inclusão', '', cd_coligada, ds_observacao );
end;
end.

