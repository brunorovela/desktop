unit uContAulasProvas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, ToolWin, ImgList, StdCtrls, Grids, DBGrids,
  Buttons, ExtCtrls, DB, ZConnection, uDiarioClasses, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, UZDataset, uDMDiario, UMComboBox, Mask, uDM,
  uColigada;

type
  TfrmContAulasProvas = class(TForm)
    Bevel4: TBevel;
    Bevel6: TBevel;
    Panel3: TPanel;
    qyAux: TUMZQuery;
    qyAulas: TUMZQuery;
    dtcAulas: TDataSource;
    ImageList2: TImageList;
    qyProvas: TUMZQuery;
    dtcProvas: TDataSource;
    qyAprovacao: TUMZQuery;
    dtcAprovacao: TDataSource;
    lbUnidadeEnsino: TLabel;
    qyAprovacaocd_alteracao: TIntegerField;
    qyAprovacaonro_nota: TSmallintField;
    qyAprovacaoturma: TStringField;
    qyAprovacaoanosemestre: TSmallintField;
    qyAprovacaodisciplina: TIntegerField;
    qyAprovacaobimestre: TSmallintField;
    qyAprovacaocodaluno: TIntegerField;
    qyAprovacaonr_nota_antiga: TFloatField;
    qyAprovacaonr_nota_nova: TFloatField;
    qyAprovacaocd_situacao: TSmallintField;
    qyAprovacaods_requerimento: TMemoField;
    qyAprovacaods_resposta: TMemoField;
    qyAprovacaosigla: TStringField;
    qyAprovacaonm_pessoa: TStringField;
    qyAprovacaoassunto: TStringField;
    qyAprovacaocd_professor: TIntegerField;
    qyAprovacaosituacao: TStringField;
    qyProvasturma: TStringField;
    qyProvasanosemestre: TSmallintField;
    qyProvasdisciplina: TIntegerField;
    qyProvasbimestre: TSmallintField;
    qyProvasassunto: TStringField;
    qyProvassn_bloqueado: TSmallintField;
    qyProvascd_professor: TIntegerField;
    qyProvasnro_nota: TSmallintField;
    qyAulasturma: TStringField;
    qyAulasanosemestre: TSmallintField;
    qyAulasbimestre: TSmallintField;
    qyAulassn_bloqueado: TIntegerField;
    qyAulasnro_aula: TSmallintField;
    qyAulasqtd_aulas: TSmallintField;
    qyAulascd_professor: TIntegerField;
    qyProvasdata: TDateTimeField;
    qyAulasdata: TDateTimeField;
    qyAjustes: TUMZQuery;
    dtcAjuste: TDataSource;
    qyAjustescd_turma: TStringField;
    qyAjustesds_ajuste: TStringField;
    qyProvasdescricao: TStringField;
    qyProvassigla: TStringField;
    qyProvasnm_pessoa: TStringField;
    qyAulasdescricao: TStringField;
    qyAulassigla: TStringField;
    qyAulasdisciplina: TIntegerField;
    qyAulasnm_pessoa: TStringField;
    qyAprovacaodescricao: TStringField;
    qyAprovacaonm_professor: TStringField;
    qyAprovacaodesc_motivo: TStringField;
    qyAprovacaodesc_resposta: TStringField;
    qyAulasdesc_conteudo: TStringField;
    qyAulasconteudo: TMemoField;
    qyAulasbloqueado: TStringField;
    qCronogramas: TUMZQuery;
    dsCronogramas: TDataSource;
    qyProvassn_especial: TIntegerField;
    qyProvassn_proficiencia: TIntegerField;
    qyProvasds_tipo: TStringField;
    qyProvassn_compoe: TIntegerField;
    qyProvasbloqueado: TStringField;
    qyAjustesnr_anosem: TLargeintField;
    qyAjustesnr_etapa: TLargeintField;
    qyAjustescd_ajuste_turma: TLargeintField;
    qyAjustescd_ajuste: TLargeintField;
    qyProvasvl_peso: TFloatField;
    qCronogramasnm_professor: TStringField;
    qCronogramasdt_cronograma: TDateTimeField;
    qCronogramasds_horario: TStringField;
    qCronogramasds_turma: TStringField;
    qCronogramasnm_coligada: TStringField;
    qCronogramasdia_semana: TStringField;
    qCronogramasds_disciplina: TStringField;
    qCronogramascd_cronograma: TLargeintField;
    qCronogramasturma: TStringField;
    qCronogramasdisciplina: TLargeintField;
    qCronogramasanosemestre: TIntegerField;
    qCronogramascurso: TStringField;
    qCronogramasordem: TStringField;
    qCronogramascd_coligada: TIntegerField;
    qCronogramascd_horario: TLargeintField;
    Bevel7: TBevel;
    qyAprovacaodt_alteracao: TDateTimeField;
    qyAprovacaodt_deferimento: TDateTimeField;
    pgcAulasNotas: TPageControl;
    tsAulas: TTabSheet;
    Bevel1: TBevel;
    ultimoseparador: TBevel;
    Panel1: TPanel;
    sbBuscaCurso: TSpeedButton;
    lblCurso: TLabel;
    lblDisciplina: TLabel;
    lblTurma: TLabel;
    sbBuscaTurma: TSpeedButton;
    sbBuscaDisciplina: TSpeedButton;
    Label18: TLabel;
    spProf: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    dtFiltroData: TDateTimePicker;
    txtCurso: TEdit;
    txtDisciplina: TEdit;
    txtTurma: TEdit;
    cbData: TCheckBox;
    txtBim: TEdit;
    cbBim: TCheckBox;
    udBim: TUpDown;
    btnFiltrar: TBitBtn;
    ckbSerie: TCheckBox;
    txtSerie: TEdit;
    udSerie: TUpDown;
    edCurso: TEdit;
    txtProfessorAula: TEdit;
    edProfessorAula: TEdit;
    edDisc: TEdit;
    cbData2: TCheckBox;
    dtFiltroDataFim: TDateTimePicker;
    BitBtn3: TBitBtn;
    dbgAulas: TDBGrid;
    toolAula: TToolBar;
    sbSelecionarColuna: TSpeedButton;
    ToolButton4: TToolButton;
    btIncluirAula: TToolButton;
    btAlterarAula: TToolButton;
    btExcluirAula: TToolButton;
    ToolButton2: TToolButton;
    tblRecalculo: TToolButton;
    ToolButton1: TToolButton;
    btFecharAula: TToolButton;
    tsProvas: TTabSheet;
    Bevel2: TBevel;
    dbgProvas: TDBGrid;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    SpeedButton12: TSpeedButton;
    dtpPDataInicio: TDateTimePicker;
    txtPCurso: TEdit;
    txtPDisciplina: TEdit;
    txtPTurma: TEdit;
    ckbPData: TCheckBox;
    txtPBim: TEdit;
    ckbPBim: TCheckBox;
    udPBim: TUpDown;
    btnFiltrar2: TBitBtn;
    udPSerie: TUpDown;
    txtPSerie: TEdit;
    ckbPSerie: TCheckBox;
    edCursoProvas: TEdit;
    txtProfessorProva: TEdit;
    edProfessorProva: TEdit;
    edDiscDesc: TEdit;
    ckbDataProva: TCheckBox;
    dtpPdata: TDateTimePicker;
    BitBtn4: TBitBtn;
    ToolBar1: TToolBar;
    SpeedButton11: TSpeedButton;
    ToolButton8: TToolButton;
    btIncluirProva: TToolButton;
    btAlterarProva: TToolButton;
    btExcluirProva: TToolButton;
    ToolButton19: TToolButton;
    btCalcularNotas: TToolButton;
    ToolButton17: TToolButton;
    btFecharProva: TToolButton;
    tsAprovacao: TTabSheet;
    Bevel3: TBevel;
    Panel4: TPanel;
    SpeedButton4: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    Label26: TLabel;
    SpeedButton13: TSpeedButton;
    Label27: TLabel;
    Label28: TLabel;
    txtACurso: TEdit;
    txtADisciplina: TEdit;
    txtATurma: TEdit;
    txtABim: TEdit;
    ckbABim: TCheckBox;
    udABim: TUpDown;
    BitBtn2: TBitBtn;
    cbASituacao: TComboBox;
    edAcurso: TEdit;
    edADisciplina: TEdit;
    txtAProfessor: TEdit;
    edAProfessor: TEdit;
    ckbADtIncio: TCheckBox;
    dtpADtInicio: TDateTimePicker;
    ckbADtFim: TCheckBox;
    dtpADtFim: TDateTimePicker;
    BitBtn5: TBitBtn;
    dbgAprovacao: TDBGrid;
    ToolBar2: TToolBar;
    SpeedButton14: TSpeedButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    tsComplemento: TTabSheet;
    Bevel5: TBevel;
    Panel5: TPanel;
    btnCurso: TSpeedButton;
    Label8: TLabel;
    Label10: TLabel;
    btnturma: TSpeedButton;
    txtCCurso: TEdit;
    txtCTurma: TEdit;
    txtCBim: TEdit;
    cbCBim: TCheckBox;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    edCCurso: TEdit;
    BitBtn6: TBitBtn;
    dbgComplemento: TDBGrid;
    ToolBar3: TToolBar;
    SpeedButton17: TSpeedButton;
    ToolButton36: TToolButton;
    btIncluirComp: TToolButton;
    btAlterarComp: TToolButton;
    btExcluirComp: TToolButton;
    ToolButton45: TToolButton;
    btFecharComp: TToolButton;
    tsCronogramas: TTabSheet;
    Bevel8: TBevel;
    Panel6: TPanel;
    SpeedButton9: TSpeedButton;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    SpeedButton10: TSpeedButton;
    sbTurmaBuscaCronograma: TSpeedButton;
    sbBuscaCronogramaDisciplina: TSpeedButton;
    txtCronogramasCurso: TEdit;
    btnCronogramasFiltrar: TBitBtn;
    btnLimpar: TBitBtn;
    txtCronogramasCursoDescricao: TEdit;
    edCodigoProfessor: TEdit;
    edNomeProfessor: TEdit;
    ckbUsaDtInicio: TCheckBox;
    ckbUsaDtFim: TCheckBox;
    dtpDtInicio: TDateTimePicker;
    dtpDtFim: TDateTimePicker;
    txtDiscCronograma: TEdit;
    txtTurmaCronograma: TEdit;
    edCodDiscCrono: TEdit;
    dbgCronogramas: TDBGrid;
    ToolBar4: TToolBar;
    Panel13: TPanel;
    sbPgAnterior: TSpeedButton;
    sbPgProximo: TSpeedButton;
    txtPg: TPanel;
    ToolButton61: TToolButton;
    btIncluirCro: TToolButton;
    btAlterarCro: TToolButton;
    btExcluirCro: TToolButton;
    ToolButton59: TToolButton;
    btCopiarCro: TToolButton;
    ToolButton3: TToolButton;
    btFecharCro: TToolButton;
    btnCopiar: TToolButton;
    ToolButton6: TToolButton;
    qyProvascd_avaliacao_tipo: TIntegerField;
    qyProvasds_avaliacao: TStringField;
    pnFiltroEstadoCidadeAulas: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    sbBuscaEstados: TSpeedButton;
    sbBuscaCidades: TSpeedButton;
    edEstadosAulas: TEdit;
    edCidadesAulas: TEdit;
    pnFiltroEstadoCidadeProvas: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    edEstadosProvas: TEdit;
    edCidadesProvas: TEdit;
    pnFiltroEstadoCidadeCronogramas: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    edEstadosCronogramas: TEdit;
    edCidadesCronogramas: TEdit;
    pnFiltroEstadoCidadeComplementosMedia: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    edEstadosComplementosMedia: TEdit;
    edCidadesComplementosMedia: TEdit;
    pnFiltroEstadoCidadeAprovacao: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    edEstadosAprovacao: TEdit;
    edCidadesAprovacao: TEdit;
    btnLimparFiltroEstadoCidade: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    qyAulascd_situacao: TIntegerField;
    qyAulascurso: TStringField;
    qyAprovacaosn_faltou_antigo: TSmallintField;
    qyAprovacaosn_faltou_novo: TSmallintField;
    qyAprovacaonr_nota_antiga_calc: TStringField;
    qyAprovacaonr_nota_nova_calc: TStringField;
    qyAulasnm_unidade: TStringField;
    qyProvascurso: TStringField;
    qyAulasaula: TStringField;
    qyAulasds_situacao_material_aula: TStringField;
    qyAulasds_situacao_local_aula: TStringField;
    qyAulasds_situacao_gerenc_prof: TStringField;
    qyAulasds_situacao_transporte: TStringField;
    qyAulasds_situacao_hospedagem: TStringField;
    qyAulasds_situacao_gerenc_gest: TStringField;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    pnSituacaoLogistica: TPanel;
    cbSituacaoMaterialAula: TUMComboBox;
    Label45: TLabel;
    cbSituacaoHospedagem: TUMComboBox;
    Label46: TLabel;
    cbSituacaoTransporte: TUMComboBox;
    Label47: TLabel;
    cbSituacaoGerenProfessor: TUMComboBox;
    Label48: TLabel;
    cbSituacaoLocalAula: TUMComboBox;
    Label49: TLabel;
    cbSituacaoGerenGestor: TUMComboBox;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    edUnidadeEnsino: TEdit;
    sbSelecionaUnidadeEnsino: TSpeedButton;
    qyProvasnr_nota_maxima: TFloatField;
    qyProvasnr_nota_minima: TFloatField;
    lbGrupoAulas: TLabel;
    edCodGrupoAulas: TEdit;
    edNomeGrupoAulas: TEdit;
    sbBuscaGrupoAulas: TSpeedButton;
    qyAulasnm_grupo: TStringField;
    qyGrupoAtividade: TUMZQuery;
    qyGrupoAtividadeqtd: TLargeintField;
    lbGrupoProvas: TLabel;
    edCodGrupoProvas: TEdit;
    edNomeGrupoProvas: TEdit;
    sbBuscaGrupoProvas: TSpeedButton;
    qyProvasnm_grupo: TStringField;
    lbGrupoCronogramas: TLabel;
    edCodGrupoCronogramas: TEdit;
    edNomeGrupoCronogramas: TEdit;
    sbBuscaGrupoCronogramas: TSpeedButton;
    qCronogramasnm_grupo: TStringField;
    ToolButton10: TToolButton;
    SpeedButton22: TSpeedButton;
    qyAulascd_grupo: TIntegerField;
    qCronogramascd_grupo: TIntegerField;
    qyProvascd_grupo: TIntegerField;
    qCronogramasds_sala: TStringField;
    btDuplicarAvaliacao: TToolButton;
    ToolButton11: TToolButton;
    qyProvascd_prova: TIntegerField;
    qyProvascd_tipo: TIntegerField;
    qyAulascd_diario_aula: TLargeintField;
    qyAulascd_coligada: TIntegerField;
    qCronogramascd_professor: TLargeintField;
    pnEtapa: TPanel;
    Label11: TLabel;
    edBimestreCronograma: TEdit;
    UpDown2: TUpDown;
    qCronogramasbimestre: TSmallintField;
    procedure UpDown2ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure btDuplicarAvaliacaoClick(Sender: TObject);
    procedure sbBuscaGrupoCronogramasClick(Sender: TObject);
    procedure sbBuscaGrupoProvasClick(Sender: TObject);
    procedure sbBuscaGrupoAulasClick(Sender: TObject);
    procedure sbSelecionaUnidadeEnsinoClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure btnLimparFiltroEstadoCidadeClick(Sender: TObject);
    procedure sbBuscaCidadesClick(Sender: TObject);
    procedure sbBuscaEstadosClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure ckbADtFimClick(Sender: TObject);
    procedure ckbDataProvaClick(Sender: TObject);
    procedure ckbADtIncioClick(Sender: TObject);
    procedure dtFiltroDataFimChange(Sender: TObject);
    procedure dtpPdataChange(Sender: TObject);
    procedure ckbPDataClick(Sender: TObject);
    procedure cbData2Click(Sender: TObject);
    procedure spProfClick(Sender: TObject);
    procedure cbDataClick(Sender: TObject);
    procedure edCodDiscCronoExit(Sender: TObject);
    procedure edCodDiscCronoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoProfessorExit(Sender: TObject);
    procedure edCodigoProfessorKeyPress(Sender: TObject; var Key: Char);
    procedure sbPgProximoClick(Sender: TObject);
    procedure sbPgAnteriorClick(Sender: TObject);
    procedure sbBuscaCronogramaDisciplinaClick(Sender: TObject);
    procedure qCronogramasBeforeOpen(DataSet: TDataSet);
    procedure btnCopiarInformacoesClick(Sender: TObject);
    procedure sbTurmaBuscaCronogramaClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure qCronogramasCalcFields(DataSet: TDataSet);
    procedure btnLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure sbSelecionarColunaClick(Sender: TObject);
    procedure udPSerieClick(Sender: TObject; Button: TUDBtnType);
    procedure udSerieClick(Sender: TObject; Button: TUDBtnType);
    procedure ckbSerieClick(Sender: TObject);
    procedure ckbPSerieClick(Sender: TObject);
    procedure btnturmaClick(Sender: TObject);
    procedure btnCursoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblRecalculoClick(Sender: TObject);
    procedure SelecionaTudo(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblCalcularClick(Sender: TObject);
    procedure btDeferirClick(Sender: TObject);
    procedure cbASituacaoChange(Sender: TObject);
    procedure qyAprovacaoCalcFields(DataSet: TDataSet);
    procedure pgcAulasNotasChange(Sender: TObject);
    procedure qyProvasCalcFields(DataSet: TDataSet);
    procedure dbgAulasTitleClick(Column: TColumn);
    procedure dtFiltroDataChange(Sender: TObject);
    procedure btExcluirAulaClick(Sender: TObject);
    procedure btAlterarAulaClick(Sender: TObject);
    procedure btIncluirAulaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharAulaClick(Sender: TObject);
    procedure ChecaLimpa(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbBuscaDisciplinaClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure udBimClick(Sender: TObject; Button: TUDBtnType);
    procedure cbBimClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure qyAulasCalcFields(DataSet: TDataSet);
    procedure sbCursoBusca(Sender: TObject);
    procedure dtcAulasStateChange(Sender: TObject);
  strict private
      coligada_filtrada : TColigada;

      procedure PosicionarElementosAbas();

  private
      sAnoSem: string;
      sPCurso: string;
      sPTurma: string;
      sPDescCurso: string;
      sPDisciplina: string;
      sPDescDisciplina: string;
      sPData: string;
      sPGrupo: Integer;
      sPDescGrupo: string;
      sAOrdemPadrao: string;
      sPOrdemPadrao: string;
      sCAnoSem: string;
      sCCurso: string;
      sCTurma: string;
      sCDisciplina: string;       
      sCronogramaAnoSem: string;
      sCronogramaCurso: string;
      sCronogramaTurma: string;
      sCronogramaDisciplina: string;

      // Filtro estados e cidades
      sEstadosFiltrados: String;
      sCidadesFiltradas: String;
      sEstadosFiltradosAspas: String;
      sCidadesFiltradasAspas: String;
      // Esta String salva os CÓDIGOS das cidades para realizar os filtros
      sIntCidadeFiltradas: String;

      // Parâmetros
      parametro_aulas_provas_filtro_cidade: Boolean;

      slCountAulas, slNroAula: TStringList;
    procedure removerNotificacoes(nr_anosemestre: Integer; cd_turma: String;
      cd_disciplina, cd_bimestre, nr_prova: Integer);
      procedure SetCidadesFiltradas(Value: String);
      procedure SetEstadosFiltrados(Value: String);

      Procedure GetProfessor();
      Procedure GetDisciplina();

      Procedure CarregarComboAulasSituacoes();

      function GetTodasColigadasFiltrada(var combo: TUMComboBox): String;

      function getSomaNotasProvasMesmoTipoTodosAlunos(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer) : TNota;

      property EstadosFiltrados: String read sEstadosFiltrados write SetEstadosFiltrados;
      property CidadesFiltradas: String read sCidadesFiltradas write SetCidadesFiltradas;

    { Private declarations }
  public
    { Public declarations }
      sPAnoSem: string;
      iColigada: Integer;

      procedure FiltroGridAulas( sOrdem: string = ''; bExecutar : boolean = false );
      procedure CheckCreateAcoes();
      procedure CarregaItemBusca();
      procedure AtualizaAcoes(iResp: Integer; sJust: string; sFiltra: Boolean = True);
      procedure statusSerie(bStatus:Boolean);
      procedure FiltrarTurmas();
      procedure FiltrarDisciplinas();

      procedure LimparFiltroColigada();
  end;

var
  frmContAulasProvas: TfrmContAulasProvas;


implementation

{$R *.dfm}

uses
   uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, General, uAulasProvasAcoes,
   uUsuario, uCamposPlanilhas, Main, uItemCombo, uFSelecionarPessoa, ClassCursos,
   ClassTurmas, uFSelEstados, uFSelCidades, ClassSituacoes, uFSelecionarColigada,
   uIUMDataModule, uFSelecionarGrupo, uProvasDuplicar;

procedure TfrmContAulasProvas.dtcAulasStateChange(Sender: TObject);
var
   bEstado: Boolean;
begin
   bEstado := qyAulas.State in [dsEdit, dsInsert];

   btIncluirAula.Enabled := not bEstado;
   btAlterarAula.Enabled := not bEstado;
   btExcluirAula.Enabled := not bEstado;
   btFecharAula.Enabled := not bEstado;
end;

procedure TfrmContAulasProvas.sbCursoBusca(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   if ( coligada_filtrada <> nil ) then
   begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([], coligada_filtrada.Codigo);
   end else begin
      resultado_filtro := TfrmSelecionarCurso.Filtrar([]);
   end;   

   if resultado_filtro.filtrado then
   begin
      sCronogramaAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
      sCronogramaCurso  := resultado_filtro.cd_curso;
      txtCronogramasCursoDescricao.Text := resultado_filtro.ds_curso;
      edCursoProvas.Text := resultado_filtro.ds_curso;
      edAcurso.Text      := resultado_filtro.ds_curso;
      txtCCurso.Text     := resultado_filtro.cd_curso;
      edCCurso.text      := resultado_filtro.ds_curso;

      sPCurso := resultado_filtro.cd_curso;
      sCCurso := resultado_filtro.cd_curso;
      sPDescCurso := resultado_filtro.ds_curso;
      sPAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
      sCAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
      CarregaItemBusca();
      //FiltroGridAulas();
      sPTurma := '';
      sCronogramaTurma := '';
      FiltrarTurmas();
      iColigada := resultado_filtro.cd_coligada;
   end;
   statusSerie(true);
end;

procedure TfrmContAulasProvas.sbPgAnteriorClick(Sender: TObject);
begin
   txtPg.Tag := txtPg.Tag - 1;
   FiltroGridAulas('', true );
end;

procedure TfrmContAulasProvas.sbPgProximoClick(Sender: TObject);
begin
   txtPg.Tag := txtPg.Tag + 1;
   FiltroGridAulas('', true );
end;

procedure TfrmContAulasProvas.sbSelecionarColunaClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);

   case pgcAulasNotas.TabIndex of
      0 : begin
          frmSelColunas.SelecionaColunas(dbgAulas, 'planilha_cad_aulas');
      end;
      1 : begin
          frmSelColunas.SelecionaColunas(dbgProvas, 'planilha_cad_provas');
      end;
      2 : begin
          frmSelColunas.SelecionaColunas(dbgAprovacao, 'planilha_cad_aprovacao');
      end;
      3 : begin
          frmSelColunas.SelecionaColunas(dbgComplemento, 'planilha_cad_complemento');
      end;
      4 : begin
          frmSelColunas.SelecionaColunas(dbgCronogramas, 'planilha_cad_cronogramas');
      end;
   end;

end;

procedure TfrmContAulasProvas.sbSelecionaUnidadeEnsinoClick(Sender: TObject);
begin
   if TfrmSelecionarColigada.ShowModal(EstadosFiltrados, CidadesFiltradas) then
   begin
      coligada_filtrada := TfrmSelecionarColigada.getResultado();
      edUnidadeEnsino.Text := coligada_filtrada.Nome;
      FiltrarTurmas();
   end;
end;

procedure TfrmContAulasProvas.sbTurmaBuscaCronogramaClick(Sender: TObject);
var
   I: Integer;
   resultado_filtro : TResultadoFiltroTurma;
   cd_coligada_filtro : Integer;
begin
   { Pesquisar Turmas }
   if (Length( sCronogramaCurso ) > 0) then
   begin
      cd_coligada_filtro := -1;
      if coligada_filtrada <> nil then
         cd_coligada_filtro := coligada_filtrada.Codigo;

      resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(sCronogramaAnoSem), cd_coligada_filtro, -1, sCronogramaCurso);
   end else begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);
   end;

   iColigada := resultado_filtro.cd_coligada;

   if not resultado_filtro.filtrado then Exit;

   sCronogramaAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
   sCronogramaCurso  := resultado_filtro.cd_curso;
   txtCronogramasCurso.Text := sCronogramaCurso;
   txtCronogramasCursoDescricao.Text := resultado_filtro.ds_curso;
   txtTurmaCronograma.Text := resultado_filtro.cd_turma;

   sPCurso := sCronogramaCurso;
   sPAnoSem := sCronogramaAnoSem;

   sCronogramaTurma := resultado_filtro.cd_turma;
   sPTurma := sCronogramaTurma;
end;

procedure TfrmContAulasProvas.qyAulasCalcFields(DataSet: TDataSet);
var
  qryGetTodos : TUMZQuery;
  total : Integer;
begin
   dm.CriarConsulta(qryGetTodos);

   qryGetTodos.SQL.Text := ''+
   '  SELECT                ' +
   '    count(*) as total   ' +
   '  FROM                  ' +
   '    diario_aulas        ' +
   '  WHERE                 ' +
   '    turma = :cd_turma AND             ' +
   '    anosemestre = :nr_anosemestre AND ' +
   '    disciplina = :disciplina AND      ' +
   '    cd_professor = :cd_professor AND  ' +
   '    bimestre = :bimestre              ' +
   '';

   qryGetTodos.ParamByName('cd_turma').AsString := qyAulasturma.AsString;
   qryGetTodos.ParamByName('nr_anosemestre').AsInteger := qyAulasanosemestre.AsInteger;
   qryGetTodos.ParamByName('disciplina').AsInteger := qyAulasdisciplina.AsInteger;
   qryGetTodos.ParamByName('cd_professor').AsInteger := qyAulascd_professor.AsInteger;
   qryGetTodos.ParamByName('bimestre').AsString := qyAulasbimestre.AsString;
   qryGetTodos.Open;

   total := qryGetTodos.FieldByName('total').AsInteger;



   qryGetTodos.SQL.Text := ''+
   '  SELECT                ' +
   '    count(*) as total   ' +
   '  FROM                  ' +
   '    diario_aulas        ' +
   '  WHERE                 ' +
   '    turma = :cd_turma AND             ' +
   '    anosemestre = :nr_anosemestre AND ' +
   '    disciplina = :disciplina AND      ' +
   '    cd_professor = :cd_professor AND  ' +
   '    bimestre = :bimestre AND          ' +
   '    nro_aula <= :nro_aula              ' +
   '';

   qryGetTodos.ParamByName('cd_turma').AsString := qyAulasturma.AsString;
   qryGetTodos.ParamByName('nr_anosemestre').AsInteger := qyAulasanosemestre.AsInteger;
   qryGetTodos.ParamByName('disciplina').AsInteger := qyAulasdisciplina.AsInteger;
   qryGetTodos.ParamByName('cd_professor').AsInteger := qyAulascd_professor.AsInteger;
   qryGetTodos.ParamByName('bimestre').AsString := qyAulasbimestre.AsString;
   qryGetTodos.ParamByName('nro_aula').AsString := qyAulasnro_aula.AsString;
   qryGetTodos.Open;




   qyAulasaula.AsString :=qryGetTodos.FieldByName('total').AsString +'/'+ IntToStr(total);
   FreeAndNil(qryGetTodos);

   if qyAulas.FieldByName('sn_bloqueado').AsInteger = 0 then begin
      qyAulas.FieldByName('bloqueado').AsString := 'NÃO';
   end
   else begin
      qyAulas.FieldByName('bloqueado').AsString := 'SIM';
   end;

   qyAulas.FieldByName('desc_conteudo').AsString := Copy(qyAulasconteudo.AsString, 1, 150);


end;

procedure TfrmContAulasProvas.btnCopiarClick(Sender: TObject);
begin
   FullDBGridToClipBoard(dbgProvas, True, [1, 1, 1, 1, 1, 1,1,1]);
   Mensagem('Informações copiadas.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
end;

procedure TfrmContAulasProvas.btnCopiarInformacoesClick(Sender: TObject);
begin
   FullDBGridToClipBoard(dbgCronogramas, True, [2, 2, 1, 2, 1, 2]);
   Mensagem('Informações copiadas.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
end;

procedure TfrmContAulasProvas.btnFiltrarClick(Sender: TObject);
begin
   txtPg.Tag := 1;
   FiltroGridAulas( '', true );
end;

procedure TfrmContAulasProvas.FiltroGridAulas(sOrdem: string = ''; bExecutar : boolean = false );
var
   sAux: string;
   bExecSQL: Boolean;
   I : Integer;

   lista_combo_situacoes : Array[1..6] of TUMComboBox;
begin
   if pgcAulasNotas.ActivePage = tsAulas then
   begin
      bExecSQL := true;

      with qyAulas do begin
         Close();

         SQL.Clear();

         SQL.Add(''+
         ' SELECT                                                                                              ' +
         '    da.cd_diario_aula, da.turma, da.anosemestre, d.descricao, d.sigla, da.disciplina, t.curso,       ' +
         '    da.bimestre, da.data, da.sn_bloqueado as sn_bloqueado, c.cd_coligada,                            ' +
         '    c.nm_coligada, da.nro_aula, da.qtd_aulas,                                                        ' +
         '    da.cd_professor, p.nm_pessoa, da.conteudo, s.cd_situacao, s.ds_valor AS ds_situacao,             ' +
         '    s0.ds_valor AS ds_situacao_material_aula, s1.ds_valor AS ds_situacao_local_aula,                 ' +
         '    s2.ds_valor AS ds_situacao_gerenc_prof, s3.ds_valor AS ds_situacao_transporte,                   ' +
         '    s4.ds_valor AS ds_situacao_hospedagem, s5.ds_valor AS ds_situacao_gerenc_gest,                   ' +
         '    dg.cd_grupo, dg.nm_grupo                                                                         ' +
         ' FROM                                                                                                ' +
         '   diario_aulas da                                                                                   ' +
         '   INNER JOIN turmas t ON (da.anosemestre = t.anosemestre AND da.turma = t.codigo)                   ' +
         '   INNER JOIN disciplinas d ON (da.disciplina = d.codigo AND t.curso = d.curso)                      ' +
         '   INNER JOIN coligadas c ON (c.cd_coligada = t.cd_coligada)                                         ' +
         '   LEFT JOIN situacoes s ON (s.cd_modulo = 1029 AND s.cd_situacao = da.cd_situacao)                  ' +
         '   LEFT JOIN situacoes s0 ON (s0.cd_modulo = 1090 AND s0.cd_situacao = da.cd_situacao_material_aula) ' +
         '   LEFT JOIN situacoes s1 ON (s1.cd_modulo = 1091 AND s1.cd_situacao = da.cd_situacao_local_aula)    ' +
         '   LEFT JOIN situacoes s2 ON (s2.cd_modulo = 1092 AND s2.cd_situacao = da.cd_situacao_gerenc_prof)   ' +
         '   LEFT JOIN situacoes s3 ON (s3.cd_modulo = 1093 AND s3.cd_situacao = da.cd_situacao_transporte)    ' +
         '   LEFT JOIN situacoes s4 ON (s4.cd_modulo = 1094 AND s4.cd_situacao = da.cd_situacao_hospedagem)    ' +
         '   LEFT JOIN situacoes s5 ON (s5.cd_modulo = 1095 AND s5.cd_situacao = da.cd_situacao_gerenc_gest)   ' +
         '   LEFT JOIN pessoas p ON (da.cd_professor = p.cd_pessoa)                                            ' +
         '   LEFT JOIN diario_grupos dg ON (dg.cd_grupo = da.cd_grupo)                                         ' +
         ' WHERE                                                                                               ' +
         '');
         sAux := '';

         if (Length(txtCurso.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('t.curso = ''' + txtCurso.Text + ''' ');
            sAux := ' and ';
         end;

         if (Length(txtProfessorAula.Text) > 0) then
         begin
            SQL.Add(sAux);
            SQL.Add('p.cd_pessoa = '+txtProfessorAula.Text);
            sAux := ' and ';
         end;

         if (Length(txtTurma.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('da.turma = ''' + txtTurma.Text+ ''' ');
            sAux := ' and ';
         end;

         if (Length(sAnoSem) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('da.anosemestre = ' + sAnoSem + ' ');
            sAux := ' and ';
         end;

         if (Length(txtDisciplina.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('da.disciplina = ' + txtDisciplina.Text+ ' ');
            sAux := ' and ';
         end;

         if (Length(edCodGrupoAulas.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('da.cd_grupo = ' + edCodGrupoAulas.Text+ ' ');
            sAux := ' and ';
         end;

         if pnSituacaoLogistica.Visible then
         begin
            lista_combo_situacoes[1] := cbSituacaoMaterialAula;
            lista_combo_situacoes[2] := cbSituacaoTransporte;
            lista_combo_situacoes[3] := cbSituacaoLocalAula;
            lista_combo_situacoes[4] := cbSituacaoHospedagem;
            lista_combo_situacoes[5] := cbSituacaoGerenProfessor;
            lista_combo_situacoes[6] := cbSituacaoGerenGestor;

            for I := Low(lista_combo_situacoes) to High(lista_combo_situacoes) do
               if TUMComboBox(lista_combo_situacoes[I]).ItemIndex > 0 then
               begin
                  SQL.Add(sAux);
                  SQL.Add(
                     'da.' + lista_campos_situacoes_logistica[I] + ' = ' +
                     IntToStr(TSituacaoLogistica(TUMComboBox(lista_combo_situacoes[I]).Items.Objects[TUMComboBox(lista_combo_situacoes[I]).ItemIndex]).Codigo));
                  sAux := ' and ';
               end;
         end;

         if (cbData.Checked) then begin
            SQL.Add(sAux);
            SQL.Add('da.data >= ''' + FormatDateTime('yyyy-mm-dd', dtFiltroData.Date) + ''' ');
            sAux := ' and ';
         end;

         if (cbData2.Checked) then begin
            SQL.Add(sAux);
            SQL.Add('da.data <= ''' + FormatDateTime('yyyy-mm-dd', dtFiltroDataFim.Date) + ''' ');
            sAux := ' and ';
         end;

         if EstadosFiltrados <> '' then
         begin
            SQL.Add(sAux);
            SQL.Add('c.ds_estado IN ('+sEstadosFiltradosAspas+')');
            sAux := ' and ';
         end;

         if sIntCidadeFiltradas <> '' then
         begin
            SQL.Add(sAux);
            SQL.Add('c.cd_municipio IN ('+sIntCidadeFiltradas+')');
            sAux := ' and ';
         end;

         if (cbBim.Checked) then begin
            SQL.Add(sAux);
            SQL.Add('da.bimestre = ' + txtBim.Text+ ' ');
            sAux := ' and ';
         end;

         if (ckbSerie.Checked) then begin
            SQL.Add(sAux);
            SQL.Add('t.serie = ' + txtSerie.Text+ ' ');
            sAux := ' and ';
         end;

         if coligada_filtrada <> nil then
         begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada = ' + IntToStr(coligada_filtrada.Codigo) + ' ';
            sAux := ' and ';
         end else begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada IN ( ' + DM.UsuarioLogado.GetColigadasFilhaSelecionada() + ' ) ';
            sAux := ' and ';
         end;

         if (Trim(sAux) = '') then begin
            bExecSQL := false;
            //SQL.Add('1 = 1 LIMIT 0');
         end
         else
         begin

            if (Length(sOrdem) > 0) then begin
               SQL.Add('   ORDER BY ' + sOrdem);
            end
            else begin
               if Length(sAOrdemPadrao) > 0 then begin
                  SQL.Add('   ORDER BY ' + sAOrdemPadrao);
               end
               else begin
                  SQL.Add('   ORDER BY anosemestre, turma, sigla, data')
               end;
            end;

            if not (Length(txtCurso.Text) > 0) then begin
               bExecSQL := false;
               // SQL.Add('LIMIT 0');
            end;

         end;

         if bExecSQL or bExecutar then
            Open();

      end;

      if bExecSQL then
         // Seleciona automaticamente a primeira linha da Grid
         Self.dbgAulas.SelectedRows.CurrentRowSelected := True;

   end
   //aba Provas
   else if pgcAulasNotas.ActivePage = tsProvas then begin

      with qyProvas do begin
         bExecSQL := true;

         Close();
         SQL.Clear();
         // DATE_FORMAT(dp.data, "%d/%m/%Y") as
         SQL.Add(''+
         'SELECT ' +
         '    dp.cd_prova, dp.turma, dp.anosemestre, dp.disciplina, dp.bimestre, t.curso, '+
         '    data, dp.assunto, dp.sn_bloqueado, dp.cd_professor,  '+
         '    dp.nro_nota, d.descricao, d.sigla, p.nm_pessoa, '+
         '    dp.sn_compoe, dp.sn_especial, dp.sn_proficiencia, dp.vl_peso, dp.cd_avaliacao_tipo, avt.ds_avaliacao, '+
         '    dp.nr_nota_maxima, dp.nr_nota_minima, dg.cd_grupo, dg.nm_grupo, avt.cd_tipo  '+         
         ' FROM diario_provas dp '+
         ' INNER JOIN turmas t ON (dp.turma = t.codigo AND dp.anosemestre = t.anosemestre) ' +
         ' INNER JOIN disciplinas d ON (dp.disciplina = d.codigo AND d.curso = t.curso ) '+
         ' INNER JOIN coligadas c ON (c.cd_coligada = t.cd_coligada) ' +
         ' LEFT JOIN avaliacoes_tipos avt ON ( avt.cd_avaliacao_tipo = dp.cd_avaliacao_tipo ) ' +
         ' LEFT JOIN pessoas p ON (dp.cd_professor = p.cd_pessoa) '+
         ' LEFT JOIN diario_grupos dg ON (dg.cd_grupo = dp.cd_grupo) '+
         ' WHERE ');
         sAux := '';
         if (Length(txtPCurso.Text) > 0) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.curso = ''' + txtPCurso.Text + ''' ';
            sAux := ' and ';
         end;
         if (Length(sPAnoSem) > 0) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.anosemestre = ' + sPAnoSem + ' ';
            sAux := ' and ';
         end;
         if (Length(txtPTurma.Text) > 0) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.turma = ''' + txtPTurma.Text+ ''' ';
            sAux := ' and ';
         end;
         if (Length(txtPDisciplina.Text) > 0) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.disciplina = ' + txtPDisciplina.Text+ ' ';
            sAux := ' and ';
         end;
         if (Length(edCodGrupoProvas.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dp.cd_grupo = ' + edCodGrupoProvas.Text+ ' ');
            sAux := ' and ';
         end;
         if (ckbPData.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.data >= ''' + FormatDateTime('yyyy-mm-dd', dtpPDataInicio.Date) + ''' ';
            sAux := ' and ';
         end;
         if (ckbDataProva.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.data <= ''' + FormatDateTime('yyyy-mm-dd', dtpPdata.Date) + ''' ';
            sAux := ' and ';
         end;
         if (ckbPBim.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.bimestre = ' + txtPBim.Text+ ' ';
            sAux := ' and ';
         end;
         if (Length(txtProfessorProva.Text) > 0) then
         begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'p.cd_pessoa = ' + txtProfessorProva.Text+ ' ';
            sAux := ' and ';
         end;
         if EstadosFiltrados <> '' then
         begin
            SQL.Add(sAux);
            SQL.Add('c.ds_estado IN ('+sEstadosFiltradosAspas+')');
            sAux := ' and ';
         end;
         if sIntCidadeFiltradas <> '' then
         begin
            SQL.Add(sAux);
            SQL.Add('c.cd_municipio IN ('+sIntCidadeFiltradas+')');
            sAux := ' and ';
         end;
         if (ckbPSerie.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.serie = ' + txtPSerie.Text+ ' ';
            sAux := ' and ';
         end;

         if coligada_filtrada <> nil then
         begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada = ' + IntToStr(coligada_filtrada.Codigo) + ' ';
            sAux := ' and ';
         end else begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada IN ( ' + DM.UsuarioLogado.GetColigadasFilhaSelecionada() + ' ) ';
            sAux := ' and ';
         end;
         
         if (ckbPData.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.data >= ''' + FormatDateTime('yyyy-mm-dd', dtpPDataInicio.Date) + ''' ';
            sAux := ' and ';
         end;

         if (ckbDataProva.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.data <= ''' + FormatDateTime('yyyy-mm-dd', dtpPdata.Date) + ''' ';
            sAux := ' and ';
         end;

         if (Trim(sAux) = '') then begin
            bExecSQL := false;
            //SQL.Text := SQL.Text + ' ' + '1 = 1 LIMIT 0';
         end
         else begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada in (' + dm.GetColigadas() + ') ';

            if (Length(sOrdem) > 0) then begin
               SQL.Text := SQL.Text + ' ' + '   ORDER BY ' + sOrdem;
            end
            else begin
               if Length(sPOrdemPadrao) > 0 then begin
                  SQL.Text := SQL.Text + ' ' + '   ORDER BY ' + sPOrdemPadrao;
               end
               else begin
                  SQL.Text := SQL.Text + ' ' + '   ORDER BY anosemestre, turma, sigla, data'
               end;
            end;
            {if not (Length(txtPCurso.Text) > 0) then begin
               bExecSQL := false;
               //SQL.Text := SQL.Text + ' ' + ' LIMIT 0';
            end;}
         end;

         if bExecSQL then
            Open();

      end; //with qyProvas

      if bExecSQL then
         // Seleciona automaticamente o primeiro registro da Grid
         Self.dbgProvas.SelectedRows.CurrentRowSelected := True;

   end
   //aba Aprovacao
   else if pgcAulasNotas.ActivePage = tsAprovacao then begin

      with qyAprovacao do begin

         bExecSQL := true;

         Close();
         SQL.Clear();
         SQL.Add(''+
         'SELECT                                                                                '+
         '   dpa.cd_alteracao, dpa.nro_nota,  dpa.turma, dpa.anosemestre, dpa.disciplina,       '+
         '   dpa.bimestre, dpa.codaluno, dpa.nr_nota_antiga, dpa.nr_nota_nova,                  '+
         '   dpa.sn_faltou_antigo, dpa.sn_faltou_novo,                                          '+
         '   dpa.cd_situacao, dpa.ds_requerimento, dpa.ds_resposta, d.sigla, d.descricao,       '+
         '   p_aluno.nm_pessoa, dp.assunto, dp.cd_professor, dpa.nm_professor AS nm_professor,       '+
         '   dpa.dt_deferimento, dpa.dt_alteracao         '+
         'FROM                                                                                  '+
         '   diario_provas_alteracoes dpa                                                       '+
         '   INNER JOIN diario_provas dp ON (dpa.nro_nota = dp.nro_nota AND dpa.turma = dp.turma AND dpa.anosemestre = dp.anosemestre AND dpa.disciplina = dp.disciplina AND dpa.bimestre = dp.bimestre) '+
         '   INNER JOIN turmas t ON (dpa.turma = t.codigo AND dpa.anosemestre = t.anosemestre) '+
         '   INNER JOIN disciplinas d ON (dpa.disciplina = d.codigo AND d.curso = t.curso )     '+
         '   INNER JOIN pessoas p_aluno ON (dpa.codaluno = p_aluno.cd_pessoa)                   '+
         'WHERE                                                                                 '+
         '');
         sAux := '';
         if (Length(txtACurso.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('t.curso = ''' + txtACurso.Text + ''' ');
            sAux := ' and ';
         end
         else begin
            bExecSQL := false;
            //SQL.Add('1 = 1 LIMIT 0');
            //Open();
            //Exit;
         end;
         if (Length(sPAnoSem) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dpa.anosemestre = ' + sPAnoSem + ' ');
            sAux := ' and ';
         end;
         if (Length(txtATurma.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dpa.turma = ''' + txtATurma.Text+ ''' ');
            sAux := ' and ';
         end;
         if (Length(txtAProfessor.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dp.cd_professor = ' + txtAProfessor.Text );
            sAux := ' and ';
         end;
         if (Length(txtADisciplina.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dpa.disciplina = ' + txtADisciplina.Text+ ' ');
            sAux := ' and ';
         end;
         if (ckbABim.Checked) then begin
            SQL.Add(sAux);
            SQL.Add('dp.bimestre = ' + txtABim.Text+ ' ');
            sAux := ' and ';
         end;
         if (cbASituacao.ItemIndex > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dpa.cd_situacao = ' + IntToStr(cbASituacao.ItemIndex) + ' ');
            sAux := ' and ';
         end;


         if (ckbADtIncio.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.data >= ''' + FormatDateTime('yyyy-mm-dd', dtpADtInicio.Date) + ''' ';
            sAux := ' and ';
         end;

         if (ckbADtFim.Checked) then begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 'dp.data <= ''' + FormatDateTime('yyyy-mm-dd', dtpADtFim.Date) + ''' ';
            sAux := ' and ';
         end;

         if coligada_filtrada <> nil then
         begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada = ' + IntToStr(coligada_filtrada.Codigo) + ' ';
            sAux := ' and ';
         end else begin
            SQL.Text := SQL.Text + ' ' + sAux;
            SQL.Text := SQL.Text + ' ' + 't.cd_coligada IN ( ' + DM.UsuarioLogado.GetColigadasFilhaSelecionada() + ' ) ';
            sAux := ' and ';
         end;

         if (Trim(sAux) = '') then begin
            bExecSQL := false;
            //SQL.Add('1 = 1 LIMIT 0');
         end
         else begin
            SQL.Add(sAux);
            SQL.Add('t.cd_coligada in (' + dm.GetColigadas() + ') ');

            if (Length(sOrdem) > 0) then begin
               SQL.Add('   ORDER BY ' + sOrdem);
            end
            else begin
               if Length(sPOrdemPadrao) > 0 then begin
                  SQL.Add('   ORDER BY ' + sPOrdemPadrao);
               end
               else begin
                  SQL.Add('   ORDER BY anosemestre, turma, sigla')
               end;
            end;
         end;

         if bExecSQL then
            Open();
            
      end; //with qyProvas

      if bExecSQL then
         // Seleciona automaticamente a primeira linha da Grid
         Self.dbgAprovacao.SelectedRows.CurrentRowSelected := True;

   end
   else if pgcAulasNotas.ActivePage = tsComplemento then begin

      with qyAjustes do begin

         bExecSQL := true;

         Close();
         SQL.Clear();
         SQL.Add(''+
         ' SELECT dat.*, da.ds_ajuste ' +
         ' FROM diario_ajustes_turmas dat ' +
         ' INNER JOIN turmas tu ON (dat.cd_turma = tu.codigo AND dat.nr_anosem = tu.anosemestre) ' +
         ' INNER JOIN diario_ajustes da ON (da.cd_ajuste = dat.cd_ajuste) ' +
         'WHERE                                                                                 '+
         '');
         sAux := '';
         if (Length(txtCCurso.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('tu.curso = ''' + txtCCurso.Text + ''' ');
            sAux := ' and ';
         end;
         if (Length(txtCTurma.Text) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dat.cd_turma = ''' + txtCTurma.Text+ ''' ');
            sAux := ' and ';
         end;
         if (Length(sCAnoSem) > 0) then begin
            SQL.Add(sAux);
            SQL.Add('dat.nr_anosem = ' + sCAnoSem + ' ');
            sAux := ' and ';
         end;
         if (cbCBim.Checked) then begin
            SQL.Add(sAux);
            SQL.Add('dat.nr_etapa = ' + txtCBim.Text+ ' ');
            sAux := ' and ';
         end;

         if (Trim(sAux) = '') then begin
            bExecSQL := false;
            //SQL.Add('1 = 1 LIMIT 0');
         end
         else begin
            if coligada_filtrada <> nil then
            begin
               sAux := sAux + ' AND tu.cd_coligada = ' + IntToStr(coligada_filtrada.Codigo) + ' ';
            end else begin
               sAux := sAux + ' AND tu.cd_coligada IN ( ' + DM.UsuarioLogado.GetColigadasFilhaSelecionada() + ') ' ;
            end;

            SQL.Add(' ORDER BY da.ds_ajuste, dat.cd_turma ');
            if not (Length(txtCCurso.Text) > 0) then begin
               bExecSQL := false;
               //SQL.Add(' LIMIT 0');
            end;
         end;

         if bExecSQL then
            Open();
         
      end;

      if bExecSQL then
         // Seleciona automaticamente a primeira linha da Grid
         Self.dbgComplemento.SelectedRows.CurrentRowSelected := True;

   end
   //////////////////////
   // aba Cronogramas
   else if pgcAulasNotas.ActivePage = tsCronogramas then
   begin
      with qCronogramas do begin

         bExecSQL := true;

         Close();
         SQL.Clear();

         SQL.Text :=
         ''+
         ' SELECT COALESCE(us.ds_sala, crono.ds_sala) AS ds_sala, crono.*, p.nm_pessoa AS nm_professor, dg.cd_grupo, dg.nm_grupo, ' +
         '        d.descricao as ds_disciplina, LEFT( crono.ds_conteudo, 240 ) as ds_ds_conteudo, h.ds_horario, ' +
         '        tu.descricao AS ds_turma, c.cd_coligada, c.nm_coligada, tu.curso, ' +
         '        tu.anosemestre AS nr_anosemestre ' +
         ' FROM diario_cronogramas crono ' +
         ' INNER JOIN horarios h ON ( h.codigo = crono.cd_horario ) ' +
         ' INNER JOIN pessoas p ON ( p.cd_pessoa = crono.cd_professor ) ' +
         ' INNER JOIN turmas tu ON (crono.turma = tu.codigo AND crono.anosemestre = tu.anosemestre) ' +
         ' INNER JOIN disciplinas d ON ( crono.disciplina = d.codigo AND tu.curso = d.curso ) ' +
         ' INNER JOIN coligadas c ON (c.cd_coligada = tu.cd_coligada) ' +
         ' LEFT JOIN unim_sala us ON (us.id = crono.cd_sala) ' +
         ' LEFT JOIN diario_grupos dg ON (dg.cd_grupo = crono.cd_grupo) ' +
         'WHERE 1=1 '+
         '';

         sAux := '';

         if (Length(txtCronogramasCurso.Text) > 0) then
            sAux := sAux + ' AND tu.curso = ''' + txtCronogramasCurso.Text + ''' ';

         if (Length(sPAnoSem) > 0) then begin
            sAux := sAux + ' AND tu.anosemestre = ' + sPAnoSem + ' ';
         end;

         if (TRIM(txtTurmaCronograma.Text) <> '') then begin
            sAux := sAux + ' AND crono.turma = ''' + TRIM(txtTurmaCronograma.Text) + ''' ';
         end;

         if (sCronogramaDisciplina <> '') then
         begin
            sAux := sAux + ' AND crono.disciplina = ' + sCronogramaDisciplina+ ' ';
         end;
         if (Length(edCodGrupoCronogramas.Text) > 0) then begin
            sAux := sAux + ' AND crono.cd_grupo = ' + edCodGrupoCronogramas.Text+ ' ';
         end;

         if EstadosFiltrados <> '' then
         begin
            sAux := sAux + ' AND c.ds_estado IN ('+sEstadosFiltradosAspas+')';
         end;

         if sIntCidadeFiltradas <> '' then
         begin
            sAux := sAux + ' AND c.cd_municipio IN ('+sIntCidadeFiltradas+') ';
         end;

         if ( Length(edCodigoProfessor.Text) > 0 ) then
         begin
            SQL.Add( ' AND crono.cd_professor = :cd_professor ' );
            ParamByName('cd_professor').AsInteger := StrToInt(edCodigoProfessor.Text);
         end;

         if (ckbUsaDtInicio.Checked) then
         begin
            SQL.Add( ' AND crono.dt_cronograma >= :dt_cronograma_inicio ' );
            ParamByName('dt_cronograma_inicio').AsDate := dtpDtInicio.Date;
         end;

         if (ckbUsaDtFim.Checked) then
         begin
            SQL.Add( ' AND crono.dt_cronograma <= :dt_cronograma_fim ' );
            ParamByName('dt_cronograma_fim').AsDate := dtpDtFim.Date;
         end;

         if coligada_filtrada <> nil then
         begin
            sAux := sAux + ' AND tu.cd_coligada = ' + IntToStr(coligada_filtrada.Codigo) + ' ';
         end else begin
            sAux := sAux + ' AND tu.cd_coligada IN ( ' + DM.UsuarioLogado.GetColigadasFilhaSelecionada() + ') ' ;
         end;
      
         SQL.Add( ' AND crono.bimestre = :bimestre ' );
         ParamByName('bimestre').AsString := edBimestreCronograma.Text;

         if (Length(sOrdem) > 0) then
         begin
            sAux := sAux + '   ORDER BY ' + sOrdem + ', p.nm_pessoa ';
         end
         else begin
            if Length(sPOrdemPadrao) > 0 then begin
               sAux := sAux + '   ORDER BY ' + sPOrdemPadrao + ', p.nm_pessoa ';
            end
            else begin
               sAux := sAux + '   ORDER BY crono.dt_cronograma, h.hr_inicio, h.hr_fim, crono.anosemestre, crono.turma, d.sigla, p.nm_pessoa ';
            end;
         end;

         SQL.Add( sAux );

         // Controle de Página
         txtPg.Caption := 'Pág. ' + IntToStr(txtPg.Tag);

         if (DM.db.Protocol <> DB_PROTOCOL_ORACLE) then begin
            SQL.Add( ' LIMIT ' + IntToStr(( txtPg.Tag * 100) - 100) + ', ' + IntToStr(txtPg.Tag * 100) );
         end;

         if bExecSQL then
            Open();

         sbPgAnterior.Enabled := ( txtPg.Tag > 1 );
         sbPgProximo.Enabled  := ( qCronogramas.RecordCount >= 100 );

            
      end;

      if bExecSQL then
         // Seleciona automaticamente a primeira linha da Grid
         Self.dbgCronogramas.SelectedRows.CurrentRowSelected := True;

   end;
end;

procedure TfrmContAulasProvas.FiltrarDisciplinas;
begin

   txtDiscCronograma.Clear();
   sCronogramaDisciplina := '';
   sPDisciplina := '';
   sPDescDisciplina := '';

   
end;

procedure TfrmContAulasProvas.FiltrarTurmas;
begin

   sPDisciplina := '';
   sCronogramaDisciplina := '';
   txtTurmaCronograma.Text := '';

   FiltrarDisciplinas();
end;

procedure TfrmContAulasProvas.ckbSerieClick(Sender: TObject);
begin
  udSerie.Enabled := ckbSerie.Checked;
  udPSerie.Enabled := ckbSerie.Checked;
  FiltroGridAulas('', true );
end;

procedure TfrmContAulasProvas.dtpPdataChange(Sender: TObject);
begin
   FiltroGridAulas('', true );
end;

procedure TfrmContAulasProvas.cbBimClick(Sender: TObject);
begin
   udBim.Enabled := cbBim.Checked;
   udPBim.Enabled := ckbPBim.Checked;
   udABim.Enabled := ckbABim.Checked;
   FiltroGridAulas( '', true );
end;

procedure TfrmContAulasProvas.cbData2Click(Sender: TObject);
begin
   dtFiltroDataFim.Enabled   := cbData2.Checked;
   dtpPdata.Enabled          := cbData2.Checked;
   dtpADtFim.Enabled         := cbData2.Checked;
   ckbADtFim.Checked         := cbData2.Checked;
   ckbDataProva.Checked      := cbData2.Checked;
end;

procedure TfrmContAulasProvas.cbDataClick(Sender: TObject);
begin
   dtFiltroData.Enabled   := cbData.Checked;
   dtpPDataInicio.Enabled := cbData.Checked;
   dtpADtInicio.Enabled   := cbData.Checked;
   ckbPData.Checked       := cbData.Checked;
   ckbADtIncio.Checked    := cbData.Checked;
end;

procedure TfrmContAulasProvas.udBimClick(Sender: TObject; Button: TUDBtnType);
var
   i: Integer;
   ed: TEdit;
begin
   ed := nil;
   if pgcAulasNotas.ActivePage = tsAulas then begin
      ed := txtBim;
   end
   else if pgcAulasNotas.ActivePage = tsProvas then begin
      ed := txtPBim;
   end
   else if pgcAulasNotas.ActivePage = tsAprovacao then begin
      ed := txtABim;
   end
   else if pgcAulasNotas.ActivePage = tsComplemento then begin
      ed := txtCBim;
   end;

   if ed.Text = '' then begin
      ed.Text := '1';
   end
   else begin
      i := StrToIntDef(ed.Text, 1);

      if Button = btNext then begin
         Inc(i);
      end
      else begin
         if (i > 1) then begin
            Dec(i);
         end;
      end;
      if (IntToStr(i) <> ed.Text) then begin
         ed.Text := IntToStr(i);
         FiltroGridAulas( '', true  );
      end;

   end;
end;

procedure TfrmContAulasProvas.udPSerieClick(Sender: TObject;
  Button: TUDBtnType);
var
   iCont: Integer;
   ed: TEdit;
   aSeries: array of integer;
begin
   ed := nil;

   if txtPCurso.Text = '' then
      exit;
   
   if pgcAulasNotas.ActivePage = tsAulas then begin
      ed := txtSerie;
   end
   else if pgcAulasNotas.ActivePage = tsProvas then begin
      ed := txtPSerie;
   end;

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Text := 'Select                    '+
                     ' 	serie                   '+
                     'FROM                      '+
                     '   gradecurricular as  g  '+
                     'WHERE                     '+
                     '   g.curso = :curso       '+
                     'GROUP BY                  '+
                     '   g.serie                ';

   qyAux.ParamByName('curso').AsString:= txtPCurso.Text;

   qyAux.Open();

   SetLength(aSeries,qyAux.RecordCount);

   qyAux.First();
   iCont:=0;

   while not qyAux.Eof do begin
      aSeries[iCont]:=qyAux.FieldByName('serie').AsInteger;
      qyAux.Next();
      Inc(iCont);
   end;

   try
      if ed.Text = '' then begin
        ed.Text := IntToStr(aSeries[0]);
        exit;
      end
      else begin

         for iCont := 0 to Length(aSeries) - 1 do begin
            if(txtPSerie.text = IntToStr(aSeries[iCont])) then
              break;
         end;

        if Button = btNext then begin
           if iCont = Length(aSeries)-1 then
              exit
           else
              ed.text := IntToStr(aSeries[(iCont+1)]);
        end
        else begin
           if iCont = 0 then
              exit
           else
              ed.text := IntToStr(aSeries[(iCont-1)]);
        end;
        FiltroGridAulas('', true );

      end;
   except
      ed.Text := '1';
   end;

end;

procedure TfrmContAulasProvas.udSerieClick(Sender: TObject; Button: TUDBtnType);
var
   iCont: Integer;
   ed: TEdit;
   aSeries: array of integer;
begin
   ed := nil;

   if txtCurso.Text = '' then
      exit;

   if pgcAulasNotas.ActivePage = tsAulas then begin
      ed := txtSerie;
   end
   else if pgcAulasNotas.ActivePage = tsProvas then begin
      ed := txtPSerie;
   end;

   qyAux.Close();
   qyAux.SQL.Clear();
   qyAux.SQL.Text := 'Select                    '+
                     ' 	serie                   '+
                     'FROM                      '+
                     '   gradecurricular as  g  '+
                     'WHERE                     '+
                     '   g.curso = :curso       '+
                     'GROUP BY                  '+
                     '   g.serie                ';

   qyAux.ParamByName('curso').AsString:= txtCurso.Text;

   qyAux.Open();

   SetLength(aSeries,qyAux.RecordCount);

   qyAux.First();
   iCont:=0;

   while not qyAux.Eof do begin
      aSeries[iCont]:=qyAux.FieldByName('serie').AsInteger;
      qyAux.Next();
      Inc(iCont);
   end;

   try
      if ed.Text = '' then begin
        ed.Text := IntToStr(aSeries[0]);
        exit;
      end
      else begin

         for iCont := 0 to Length(aSeries) - 1 do begin
            if(txtSerie.text = IntToStr(aSeries[iCont])) then
              break;
         end;

        if Button = btNext then begin
           if iCont = Length(aSeries)-1 then
              exit
           else
              ed.text := IntToStr(aSeries[(iCont+1)]);
        end
        else begin
           if iCont = 0 then
              exit
           else
              ed.text := IntToStr(aSeries[(iCont-1)]);
        end;
        FiltroGridAulas( '', true );

      end;
   except
      ed.Text := '1';
   end;

end;

procedure TfrmContAulasProvas.UpDown2ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
begin
   edBimestreCronograma.Text := inttostr(NewValue);
end;

procedure TfrmContAulasProvas.sbBuscaTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   if (Length( sCronogramaCurso ) = 0) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma turma, por causa do Ano/Semestre', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro.cd_coligada := -1;
   if coligada_filtrada <> nil then
      resultado_filtro.cd_coligada := coligada_filtrada.Codigo;

   if (pgcAulasNotas.ActivePage =  tsAulas) then
      resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(sCronogramaAnoSem), resultado_filtro.cd_coligada, -1,
         sPCurso)
   else if (pgcAulasNotas.ActivePage =  tsProvas) then
      resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(sCronogramaAnoSem), resultado_filtro.cd_coligada, -1,
         sPCurso)
   else
      resultado_filtro := TfrmSelecionarTurma.Filtrar([], StrToInt(sCronogramaAnoSem), -1, -1,
         sPCurso);

   if not resultado_filtro.filtrado then Exit;

   txtPSerie.Text := IntToStr( resultado_filtro.nr_serie );
   txtSerie.Text  := IntToStr( resultado_filtro.nr_serie );
   sPTurma := resultado_filtro.cd_turma;
   sCTurma := resultado_filtro.cd_turma;
   CarregaItemBusca();
   FiltroGridAulas( '', true );

   ckbSerie.Enabled:= False;
   udSerie.Enabled:= False;
   ckbPSerie.Enabled:= False;
   udPSerie.Enabled:= False;
end;

procedure TfrmContAulasProvas.sbBuscaCidadesClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelCidades, frmSelCidades);
   frmSelCidades.CarregaTelaFiltro(sEstadosFiltradosAspas, CidadesFiltradas, sccFromColigadas);

   if ( frmSelCidades.Filtrar ) then
   begin
      CidadesFiltradas := frmSelCidades.GetStrCidadesSelecionadas(True);
      sIntCidadeFiltradas := frmSelCidades.GetIntCidadesSelecionadas;
   end;
end;

procedure TfrmContAulasProvas.sbBuscaCronogramaDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplinas }
   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([], sCronogramaCurso, -1, sCronogramaTurma);

   if not resultado_filtro.filtrado then Exit;

   sCronogramaDisciplina := IntToStr( resultado_filtro.cd_disciplina );
   sPDisciplina := sCronogramaDisciplina;
   sPDescDisciplina := resultado_filtro.ds_disciplina;


   txtCronogramasCursoDescricao.text := resultado_filtro.ds_curso;
   txtCronogramasCurso.text := resultado_filtro.cd_curso;

   txtDiscCronograma.Text := sPDescDisciplina;
   edCodDiscCrono.Text := sCronogramaDisciplina;
end;

procedure TfrmContAulasProvas.sbBuscaDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma disciplina, por causa do Ano/Semestre', 'Atenção!!', MB_OK);
      Exit;
   end;

   { Pesquisar Disciplina }
   if ( Length(sPAnoSem) > 0 ) then
     resultado_filtro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], sPCurso, StrToInt(sPAnoSem))
   else
     resultado_filtro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], sPCurso);
     
   if resultado_filtro.filtrado then
   begin
     sPDisciplina := IntToStr( resultado_filtro.cd_disciplina );
     sPDescDisciplina := resultado_filtro.ds_disciplina;
     sPCurso := resultado_filtro.cd_curso;
     CarregaItemBusca();
     FiltroGridAulas( '', true );
   end;
end;

procedure TfrmContAulasProvas.sbBuscaEstadosClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelEstados, frmSelEstados);
   frmSelEstados.CarregaTelaFiltro(EstadosFiltrados, sceFromColigadas);

   if ( frmSelEstados.Filtrar ) then
      EstadosFiltrados := frmSelEstados.GetStrEstadosSelecionados(True);
end;

procedure TfrmContAulasProvas.sbBuscaGrupoAulasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
   iAnoSemestre, iDisciplina, iProfessor : Integer;
begin
   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar um grupo', 'Atenção!!', MB_OK);
      Exit;
   end;

   { Pesquisar Grupo }
   if Length(sPAnoSem) > 0 then
   begin
      iAnoSemestre := StrToInt(sPAnoSem);
   end else begin
      iAnoSemestre := -1;
   end;

   if Length(sPDisciplina) > 0 then
   begin
      iDisciplina := StrToInt(sPDisciplina);
   end else begin
      iDisciplina := -1;
   end;

   if Length(txtProfessorAula.Text) > 0 then
   begin
      iProfessor := StrToInt(txtProfessorAula.Text);
   end else begin
      iProfessor := -1;
   end;                      
   
   resultado_filtro := TfrmSelecionarGrupo.Filtrar([], sCCurso, iAnoSemestre, sPTurma, iDisciplina, iProfessor);

   if not resultado_filtro.filtrado then Exit;

   edCodGrupoAulas.Text  := IntToStr(resultado_filtro.cd_grupo);
   edNomeGrupoAulas.Text := resultado_filtro.nm_grupo;
   sPGrupo := resultado_filtro.cd_grupo;
   sPDescGrupo := resultado_filtro.nm_grupo;

   txtProfessorAula.Text := IntToStr(resultado_filtro.cd_professor);
   edProfessorAula.Text := resultado_filtro.nm_professor;

   FiltroGridAulas( '', true );
end;

procedure TfrmContAulasProvas.sbBuscaGrupoCronogramasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
   iAnoSemestre, iDisciplina, iProfessor : Integer;
begin

   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar um grupo', 'Atenção!!', MB_OK);
      Exit;
   end;

   { Pesquisar Grupo }
   if Length(sPAnoSem) > 0 then
   begin
      iAnoSemestre := StrToInt(sPAnoSem);
   end else begin
      iAnoSemestre := -1;
   end;

   if Length(sPDisciplina) > 0 then
   begin
      iDisciplina := StrToInt(sPDisciplina);
   end else begin
      iDisciplina := -1;
   end;

   if Length(edCodigoProfessor.Text) > 0 then
   begin
      iProfessor := StrToInt(edCodigoProfessor.Text);
   end else begin
      iProfessor := -1;
   end;

   resultado_filtro := TfrmSelecionarGrupo.Filtrar([], sCCurso, iAnoSemestre, sPTurma, iDisciplina, iProfessor);

   if not resultado_filtro.filtrado then Exit;

   edCodGrupoCronogramas.Text  := IntToStr(resultado_filtro.cd_grupo);
   edNomeGrupoCronogramas.Text := resultado_filtro.nm_grupo;
   sPGrupo := resultado_filtro.cd_grupo;
   sPDescGrupo := resultado_filtro.nm_grupo;

   edCodigoProfessor.Text := IntToStr(resultado_filtro.cd_professor);
   edNomeProfessor.Text := resultado_filtro.nm_professor;

   FiltroGridAulas( '', true );
end;

procedure TfrmContAulasProvas.sbBuscaGrupoProvasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
   iAnoSemestre, iDisciplina, iProfessor : Integer;
begin

   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar um grupo', 'Atenção!!', MB_OK);
      Exit;
   end;

   { Pesquisar Grupo }
   if Length(sPAnoSem) > 0 then
   begin
      iAnoSemestre := StrToInt(sPAnoSem);
   end else begin
      iAnoSemestre := -1;
   end;

   if Length(sPDisciplina) > 0 then
   begin
      iDisciplina := StrToInt(sPDisciplina);
   end else begin
      iDisciplina := -1;
   end;

   if Length(txtProfessorProva.Text) > 0 then
   begin
      iProfessor := StrToInt(txtProfessorProva.Text);
   end else begin
      iProfessor := -1;
   end;

   resultado_filtro := TfrmSelecionarGrupo.Filtrar([], sCCurso, iAnoSemestre, sPTurma, iDisciplina, iProfessor);

   if not resultado_filtro.filtrado then Exit;

   edCodGrupoProvas.Text  := IntToStr(resultado_filtro.cd_grupo);
   edNomeGrupoProvas.Text := resultado_filtro.nm_grupo;
   sPGrupo := resultado_filtro.cd_grupo;
   sPDescGrupo := resultado_filtro.nm_grupo;   

   txtProfessorProva.Text := IntToStr(resultado_filtro.cd_professor);
   edProfessorProva.Text := resultado_filtro.nm_professor;

   FiltroGridAulas( '', true );
end;

procedure TfrmContAulasProvas.ChecaLimpa(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('Disciplina', TEDit(Sender).Name) > 0) then begin
         sPDisciplina := '';
      end else if (Pos('Turma', TEDit(Sender).Name) > 0) then begin
         sPTurma := '';
      end else if (Pos('Grupo', TEDit(Sender).Name) > 0) then begin
         sPGrupo := 0;
      end;
   end;
end;

procedure TfrmContAulasProvas.btFecharAulaClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmContAulasProvas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmContAulasProvas.FormCreate(Sender: TObject);
begin
   pgcAulasNotas.ActivePageIndex := 0;
   PosicionarElementosAbas();

   if DMDiario = nil then
   begin
      Application.CreateForm(TDMDiario, DMDiario);
      { Insere log de acesso ao diário }
      DMDiario.inserirLogAcesso;
   end;
end;

procedure TfrmContAulasProvas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if pgcAulasNotas.ActivePage = tsAulas then begin
      case key of
         VK_F1 : PrincipalForm.confSobreClick( nil );
         VK_F2 : if btIncluirAula.Enabled then btIncluirAulaClick( nil );
         VK_F3 : if btAlterarAula.Enabled then btAlterarAulaClick( nil );
         VK_F9 : if btExcluirAula.Enabled then btExcluirAulaClick( nil );
         VK_F12 : if btFecharAula.Enabled then btFecharAulaClick( nil );
      end;
   end else if pgcAulasNotas.ActivePage = tsProvas then begin

      case key of
         VK_F1 : PrincipalForm.confSobreClick( nil );
         VK_F2 : if btIncluirProva.Enabled then btIncluirAulaClick( nil );
         VK_F3 : if btAlterarProva.Enabled then btAlterarAulaClick( nil );
         VK_F9 : if btExcluirProva.Enabled then btExcluirAulaClick( nil );
         VK_F12 : if btFecharProva.Enabled then btFecharAulaClick( nil );
      end;
   end else if pgcAulasNotas.ActivePage = tsComplemento then begin

      case key of
         VK_F1 : PrincipalForm.confSobreClick( nil );
         VK_F2 : if btIncluirComp.Enabled then btIncluirAulaClick( nil );
         VK_F3 : if btAlterarComp.Enabled then btAlterarAulaClick( nil );
         VK_F9 : if btExcluirComp.Enabled then btExcluirAulaClick( nil );
         VK_F12 : if btFecharComp.Enabled then btFecharAulaClick( nil );
      end;
   end else if pgcAulasNotas.ActivePage = tsCronogramas then begin

      case key of
         VK_F1 : PrincipalForm.confSobreClick( nil );
         VK_F2 : if DM.UsuarioLogado.TemPermissao( 1070, npIncluir, False ) then btIncluirAulaClick( nil );
         VK_F3 : if DM.UsuarioLogado.TemPermissao( 1070, npAlterar, False ) then btAlterarAulaClick( nil );
         VK_F9 : if DM.UsuarioLogado.TemPermissao( 1070, npExcluir, False ) then btExcluirAulaClick( nil );
         VK_F12 : if btFecharComp.Enabled then btFecharAulaClick( nil );
      end;
   end;
end;

procedure TfrmContAulasProvas.btIncluirAulaClick(Sender: TObject);
begin
   { Controle da aba de Aulas }
   if pgcAulasNotas.ActivePage = tsAulas then begin
      CheckCreateAcoes();
      with frmAulasProvasAcoes do begin
         SelecionaTab('tsAulas');
         txtAProf.Text := txtProfessorAula.Text;
         setPadrao(sPCurso, sPAnoSem, sPTurma, sPDisciplina, self.txtBim.Text, self.txtSerie.Text,self.ckbSerie.Checked);
         statusSerie(self.ckbSerie.Visible);
         DefineInsere(True);
         CarregaItemBusca();
         if sPGrupo > 0 then
         begin
            setGrupo(sPGrupo);
            edGrupoAulas.Text := IntToStr(sPGrupo);
         end;
         // Bloqueia os campos necessários caso o grupo seja selecionado
         bloqueiaCamposGrupoSelecionado();
         ShowModal();
         FiltroGridAulas( '', true  );
      end;
      FreeAndNil(frmAulasProvasAcoes);
   end
   { Controle da aba de Provas }
   else if pgcAulasNotas.ActivePage = tsProvas then
   begin
      if edCursoProvas.Text = '' then
      begin
         Mensagem('Favor, selecionar primeiro o curso que deseja trabalhar.');
         exit;
      end;

      CheckCreateAcoes();
      
      with frmAulasProvasAcoes do
      begin

         iCodColigada := Self.iColigada;
         SelecionaTab('tsProvas');
         txtPProf.Text := txtProfessorProva.Text;
         setPadrao(sPCurso, sPAnoSem, sPTurma, sPDisciplina, self.txtPBim.Text, self.txtPSerie.Text, self.ckbPSerie.Checked);
         if sPGrupo > 0 then
         begin
            setGrupo(sPGrupo);
            edGrupoProvas.Text := IntToStr(sPGrupo);
         end;
         // Bloqueia os campos necessários caso o grupo seja selecionado
         bloqueiaCamposGrupoSelecionado();
         setListaTurmas(False, sPCurso, StrToInt(sPAnoSem));
         statusSerie(self.ckbSerie.Visible);
         CarregaItemBusca();
         ListaProvaTurmasDisciplinas();
         DefineInsere(True);

         if Length( trim( sPTurma ) ) = 0 then
            setListaTurmas(True, sPCurso, StrToInt(sPAnoSem));

         CarregaTiposProva();

         if cbTiposProvas.Items.Count = 0 then
            MessageBox(Handle, 'Existem parâmetros de avaliação sem tipos de avaliações definidos. Acesse o menu Cadastros > Parâmetro de Avaliação e faça o ajuste antes de prosseguir.', 'Atenção', MB_ICONEXCLAMATION or MB_OK)
         else
         begin
            ShowModal();
            FiltroGridAulas( '', true  );
         end;
      end;
      FreeAndNil(frmAulasProvasAcoes);
   end
   {Controle da aba de Complementos }
   else if pgcAulasNotas.ActivePage = tsComplemento then begin
      if (sCAnoSem = '') then begin
         Mensagem('Você precisa selecionar um curso!', 'Atenção', MB_OK);
         Exit;
      end;
      CheckCreateAcoes();
      with frmAulasProvasAcoes do begin
         SelecionaTab('tsComplemento');
         setPadrao(sCCurso, sCAnoSem, sCTurma, sPDisciplina, txtPBim.Text);
         qyCompl.Close();
         qyCompl.ParamByName('cd_ajuste_turma').AsInteger := -1;
         qyCompl.Open();
         qyCompl.Insert;
         qyComplnr_anosem.AsInteger := StrToInt(sCAnoSem);
         qyComplnr_etapa.AsInteger := StrToInt(txtCBim.Text);
         if ShowModal() = mrOk then begin
            FiltroGridAulas( '', true  );
         end;
      end;
   end
   { Controle da aba de cronogramas }
   else if pgcAulasNotas.ActivePage = tsCronogramas then begin

      CheckCreateAcoes();
      with frmAulasProvasAcoes do
      begin
         { Define o curso, turma e disciplina selecionados na tela de listagem de cronogramas,
           na tela de inserção }
         sPTurma := txtTurmaCronograma.Text;
         setPadrao( sPCurso, sPAnoSem, sPTurma, sPDisciplina, edBimestreCronograma.Text);
         setGrupo(sPGrupo);
         // Bloqueia os campos necessários caso o grupo seja selecionado
         bloqueiaCamposGrupoSelecionado();
         txtCronogramasProfessor.Text := edCodigoProfessor.Text;
         txtTurmaCronograma.Text :=  sPTurma;
         frmAulasProvasAcoes.cbGrupos.Items.Clear();
         frmAulasProvasAcoes.cbDisciplinas.Items.Clear();
         
         frmAulasProvasAcoes.filtro_coligada := iColigada;

         { Seleciona a Aba "Cronogramas Gerenciar" na Unit uAulasProvasAcoes,
            e exibe somente ela }
         SelecionaTab('tsCronogramasGerenciar');

         rgPeriodicidade.ItemIndex := -1;

         qCronograma.Close;
         if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
            qCronograma.SQL.Text := ' SELECT * FROM diario_cronogramas WHERE rownum = 1 '
         else
            qCronograma.SQL.Text := ' SELECT * FROM diario_cronogramas LIMIT 1 ';
         qCronograma.Open;
         qCronograma.Insert;

         AcaoIncluirCampos := Limpar;
         pnEtapaCoord.Visible := dm.UsaAnosemestre;

         if ShowModal() = mrOk then
         begin
            FiltroGridAulas( '', true );
         end;
      end;
   end;
   
end;

procedure TfrmContAulasProvas.ckbADtFimClick(Sender: TObject);
begin
   dtFiltroData.Enabled   := ckbADtFim.Checked;
   dtpPDataInicio.Enabled := ckbADtFim.Checked;
   dtpADtInicio.Enabled   := ckbADtFim.Checked;
   ckbADtFim.Checked      := cbData.Checked;
   ckbPData.Checked       := ckbADtFim.Checked;
end;

procedure TfrmContAulasProvas.ckbADtIncioClick(Sender: TObject);
begin
   dtFiltroData.Enabled   := ckbADtIncio.Checked;
   dtpPDataInicio.Enabled := ckbADtIncio.Checked;
   dtpADtInicio.Enabled   := ckbADtIncio.Checked;
   cbData.Checked         := ckbADtIncio.Checked;
   ckbPData.Checked       := ckbADtIncio.Checked;
end;

procedure TfrmContAulasProvas.ckbDataProvaClick(Sender: TObject);
begin
   dtFiltroDataFim.Enabled   := ckbDataProva.Checked;
   dtpPdata.Enabled          := ckbDataProva.Checked;
   dtpADtFim.Enabled         := ckbDataProva.Checked;
   cbData2.Checked           := ckbDataProva.Checked;
   ckbDataProva.Checked      := ckbDataProva.Checked;
end;

procedure TfrmContAulasProvas.ckbPDataClick(Sender: TObject);
begin
   dtFiltroData.Enabled   := ckbPData.Checked;
   dtpPDataInicio.Enabled := ckbPData.Checked;
   dtpADtInicio.Enabled   := ckbPData.Checked;
   cbData.Checked         := ckbPData.Checked;
   ckbADtIncio.Checked    := ckbPData.Checked;
end;

procedure TfrmContAulasProvas.ckbPSerieClick(Sender: TObject);
begin
  udSerie.Enabled := ckbPSerie.Checked;
  udPSerie.Enabled := ckbPSerie.Checked;
  FiltroGridAulas( '', true );
end;

procedure TfrmContAulasProvas.CheckCreateAcoes;
begin
   if frmAulasProvasAcoes = nil then begin
      Application.CreateForm(TfrmAulasProvasAcoes, frmAulasProvasAcoes);
   end;
end;

procedure TfrmContAulasProvas.btnLimparClick(Sender: TObject);
begin
   sPCurso := '';
   sPTurma := '';
   sPDisciplina := '';
   sPGrupo := 0;

   sCCurso := '';
   sCAnoSem := '';
   sCTurma := '';

   sCronogramaCurso := '';
   sCronogramaTurma := '';
   sCronogramaDisciplina := '';

   LimparFiltroColigada();

   sCronogramaDisciplina := '';
   txtDiscCronograma.Clear();

   txtCronogramasCurso.Text := '';
   txtCronogramasCursoDescricao.Text := '';

   edCodigoProfessor.Text := '';
   edNomeProfessor.Text := '';

   txtProfessorProva.Text  := '';
   edProfessorProva.Text   := '';
   txtProfessorAula.Text   := '';
   edProfessorAula.Text    := '';
   txtAProfessor.Text      := '';
   edAProfessor.Text       := '';
   edCodGrupoAulas.Text    := '';
   edCodGrupoProvas.Text   := '';
   edCodGrupoCronogramas.Text := '';

   edCursoProvas.Text    := '';
   txtPCurso.Text        := '';
   edCurso.Text          := '';
   txtCurso.Text         := '';
   edAcurso.Text         := '';
   txtACurso.Text        := '';
   edCCurso.Text         := '';
   txtCCurso.Text        := '';
   edNomeGrupoAulas.Text := '';
   edNomeGrupoProvas.Text := '';
   edNomeGrupoCronogramas.Text := '';

   txtTurma.Text      := '';
   txtPTurma.Text     := '';
   txtATurma.Text     := '';
   txtCTurma.Text     := '';

   txtPDisciplina.Text := '';
   edDiscDesc.Text     := '';
   txtDisciplina.Text  := '';
   txtADisciplina.Text := '';
   edADisciplina.Text  := '';

   dtpDtInicio.Date := Now;
   dtpDtFim.Date := Now;
   dtpADtInicio.Date :=  Now;
   dtpADtFim.Date :=  Now;
   dtpPDataInicio.Date := Now;
   dtpPdata.Date := Now;
   dtFiltroData.Date := Now;
   dtFiltroDataFim.Date := Now;

   cbData.Checked  := False;
   cbData2.Checked := False;
   ckbPData.Checked := False;
   ckbDataProva.Checked := False;
   ckbUsaDtInicio.Checked := False;
   ckbUsaDtFim.Checked := False;
   ckbADtIncio.Checked := False;
   ckbADtFim.Checked   := False;

   cbSituacaoMaterialAula.ItemIndex := 0;
   cbSituacaoHospedagem.ItemIndex := 0;
   cbSituacaoTransporte.ItemIndex := 0;
   cbSituacaoGerenProfessor.ItemIndex := 0;
   cbSituacaoLocalAula.ItemIndex := 0;
   cbSituacaoGerenGestor.ItemIndex := 0;

   sPDescCurso := '';
   FiltrarTurmas();
   FiltrarDisciplinas();
   if(frmAulasProvasAcoes <> nil) then
      frmAulasProvasAcoes.txtCronogramaTurma.Text := '';
end;

procedure TfrmContAulasProvas.btnLimparFiltroEstadoCidadeClick(Sender: TObject);
begin
   EstadosFiltrados := '';
   CidadesFiltradas := '';

   btnLimparClick(Sender);
end;

procedure TfrmContAulasProvas.btAlterarAulaClick(Sender: TObject);
begin

   { Controle aba de Aulas }
   if pgcAulasNotas.ActivePage = tsAulas then begin
      if Self.dbgAulas.SelectedRows.Count > 0 then begin
         CheckCreateAcoes();
         frmAulasProvasAcoes.SelecionaTab('tsAulas');
         frmAulasProvasAcoes.DefineInsere(False);
         frmAulasProvasAcoes.setPadrao(qyAulascurso.AsString, qyAulasanosemestre.AsString, qyAulasturma.AsString, qyAulasdisciplina.AsString);
         frmAulasProvasAcoes.CarregaItemBusca();
         frmAulasProvasAcoes.txtBim.Text := qyAulasbimestre.AsString;
         frmAulasProvasAcoes.txtSerie.Text := txtSerie.Text;
         frmAulasProvasAcoes.AtualizaAulaDados(qyAulasnro_aula.AsString);
         if qyAulascd_grupo.AsInteger > 0 then
         begin
         	frmAulasProvasAcoes.setGrupo(qyAulascd_grupo.AsInteger);
            frmAulasProvasAcoes.edGrupoAulas.Text := IntToStr(qyAulascd_grupo.AsInteger);
            // Bloqueia os campos necessários caso o grupo seja selecionado
            frmAulasProvasAcoes.bloqueiaCamposGrupoSelecionado();
         end;
         if frmAulasProvasAcoes.ShowModal() = mrOk then begin
            FiltroGridAulas( '', true  );
         end;
         FreeAndNil(frmAulasProvasAcoes);
      end
      else begin
         Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
         Exit;
      end;
   end
   { Controle aba de Provas }
   else if pgcAulasNotas.ActivePage = tsProvas then begin
      if Self.dbgProvas.SelectedRows.Count > 0 then begin
         if edCursoProvas.Text = '' then
         begin
            Mensagem('Favor, selecionar primeiro o curso que deseja trabalhar.');
            exit;
         end;

         CheckCreateAcoes();
         frmAulasProvasAcoes.Professor :=
            TProfessor.Create(qyProvas.FieldByName('cd_professor').AsInteger, qyProvas.FieldByName('nm_pessoa').AsString);
         if qyProvas.FieldByName('cd_avaliacao_tipo').AsInteger > 0 then
            frmAulasProvasAcoes.TipoProva :=
               TTipoProva.Create(qyProvas.FieldByName('cd_avaliacao_tipo').AsInteger, qyProvas.FieldByName('ds_avaliacao').AsString)
         else
            frmAulasProvasAcoes.TipoProva := nil;
         frmAulasProvasAcoes.SelecionaTab('tsProvas');
         frmAulasProvasAcoes.DefineInsere(False);
         frmAulasProvasAcoes.setPadrao(sPCurso, sPAnoSem, qyProvasturma.AsString, qyProvasdisciplina.AsString, '', txtSerie.Text);
         if qyProvascd_grupo.AsInteger > 0 then
         begin
         	frmAulasProvasAcoes.setGrupo(qyProvascd_grupo.AsInteger);
            frmAulasProvasAcoes.edGrupoProvas.Text := IntToStr(qyProvascd_grupo.AsInteger);
            // Bloqueia os campos necessários caso o grupo seja selecionado
            frmAulasProvasAcoes.bloqueiaCamposGrupoSelecionado();
         end;
         frmAulasProvasAcoes.CarregaItemBusca();
         frmAulasProvasAcoes.txtPBim.Text := qyProvasbimestre.AsString;
         frmAulasProvasAcoes.AtualizaProvasDados(qyProvasnro_nota.AsString);
         if frmAulasProvasAcoes.ShowModal() = mrOk then begin
            FiltroGridAulas('', true );
         end;
         FreeAndNil(frmAulasProvasAcoes);
      end
      else begin
         Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
         Exit;
      end;
   end
   { Controle aba de Complemento }
   else if pgcAulasNotas.ActivePage = tsComplemento then begin
      if (sCAnoSem = '') then begin
         Mensagem('Você precisa selecionar um curso!', 'Atenção', MB_OK);
         Exit;
      end;
         CheckCreateAcoes();
         with frmAulasProvasAcoes do begin
            SelecionaTab('tsComplemento');
            setPadrao(sCCurso, sCAnoSem, sCTurma, sPDisciplina, txtPBim.Text);
            qyCompl.Close();
            qyCompl.ParamByName('cd_ajuste_turma').AsInteger := qyAjustescd_ajuste_turma.AsInteger;
            qyCompl.Open();
            qyCompl.Edit();
         end;
         if frmAulasProvasAcoes.ShowModal() = mrOk then begin
            FiltroGridAulas( '', true );
         end;
   end
   { cronogramas }
   else if pgcAulasNotas.ActivePage = tsCronogramas then
   begin

         if qCronogramas.FieldByName('cd_cronograma').AsInteger <= 0 then
         begin
            exit;
         end;

         CheckCreateAcoes();
         with frmAulasProvasAcoes do
         begin
            frmAulasProvasAcoes.qCronograma.Close();

            frmAulasProvasAcoes.qCronograma.SQL.Clear;
            frmAulasProvasAcoes.qCronograma.SQL.Add('select * from diario_cronogramas ' +
                                'where cd_cronograma = :cd_cronograma' );
            frmAulasProvasAcoes.qCronograma.ParamByName('cd_cronograma').AsInteger := self.qCronogramas.FieldByName('cd_cronograma').AsInteger;
            frmAulasProvasAcoes.qCronograma.Open();

            SelecionaTab('tsCronogramasGerenciar');
            setPadrao(
               Self.qCronogramas.FieldByName('curso').AsString, Self.qCronogramas.FieldByName('anosemestre').AsString,
               Self.qCronogramas.FieldByName('turma').AsString,
               Self.qCronogramas.FieldByName('disciplina').AsString, txtPBim.Text
            );
            if Self.qCronogramas.FieldByName('cd_grupo').AsInteger > 0 then
            begin
            	frmAulasProvasAcoes.setGrupo(Self.qCronogramas.FieldByName('cd_grupo').AsInteger);
               // Bloqueia os campos necessários caso o grupo seja selecionado
               frmAulasProvasAcoes.bloqueiaCamposGrupoSelecionado();
            end;
            filtro_coligada := Self.qCronogramas.FieldByName('cd_coligada').AsInteger;

            AcaoIncluirCampos := Editar;

            qCronograma.Edit();

            frmAulasProvasAcoes.filtro_coligada := qCronogramascd_coligada.AsInteger;

            frmAulasProvasAcoes.CarregaDataDiario(
               ano_semestre,
               Self.qCronogramas.FieldByName('turma').AsString,
               StrToInt(Self.qCronogramas.FieldByName('disciplina').AsString),
               Self.qCronogramas.FieldByName('curso').AsString
            );
         end;
         if frmAulasProvasAcoes.ShowModal() = mrOk then
         begin
            FiltroGridAulas( '', true );
         end;
   end;

end;

procedure TfrmContAulasProvas.btExcluirAulaClick(Sender: TObject);
const
   MSG_ERR_EAULA = 'Ocorreu um erro na tentativa de efetuar a exclusão da(s) aula(s) selecionada(s).';
   MSG_ERR_AFREQ = 'Ocorreu um erro na tentativa de efetuar a atualização das freqüências no diário.';
   MSG_ERR_ANUMS = 'Ocorreu um erro na tentativa de efetuar a atualização dos números das aulas.';
   MSG_ERR_LFREQ = 'Ocorreu um erro na tentativa de excluir as freqüências da(s) aula(s) excluída(s).';
   MSG_ERR_ATOTA = 'Ocorreu um erro na tentativa de efetuar o total de aulas lecionadas pelo professor.';
   MSG_ERR_AFALT = 'Ocorreu um erro na tentativa de efetuat a atualização do número de faltas no diário.';
   MSG_ERR_AFICH = 'Ocorrer um erro na tentativa de efetuar a atualização das freqüências na ficha individual.';
   MSG_SUCESSO = 'O processo de exclusão da(s) aula(s) foi efetuado com sucesso.';

   SQL_EXCLUI_AULA =
      'DELETE FROM diario_aulas '+
      'WHERE '+
         'nro_aula = :nro_aula AND '+
         'turma = :turma AND '+
         'anosemestre = :anosemestre AND '+
         'disciplina = :disciplina AND '+
         'bimestre = :bimestre';

   SQL_EXCLUI_FREQ =
      'DELETE FROM diario_aulas_alunos '+
      'WHERE '+
         'cd_turma = :turma AND '+
         'nr_anosem = :anosemestre AND '+
         'cd_disciplina = :disciplina AND '+
         'cd_bimestre = :bimestre AND ' +
         'nr_aula = :nro_aula';

   SQL_EXCLUI_NOTAS =
      'DELETE FROM diario_provas_alunos '+
      'WHERE '+
         'cd_turma = :turma AND '+
         'nr_anosem = :anosemestre AND '+
         'cd_disciplina = :disciplina AND '+
         'cd_bimestre = :bimestre AND ' +
         'nr_prova = :nro_prova';
var
  n, j : Integer;
  logDesc, sMsg: string;
  qyAFreqs: TUMZQuery;
  qyAAulas: TUMZQuery;
  qyANotas: TUMZQuery;
  iDisciplinaFrente, iDisciplina, iCdTipoAvaliacao, i: Integer;
  rSomaTotalNotas, rSomaNotas: TNota;
  arrDisciplinasFazemFrente, arrPessoas: TStringList;
  notaMaxima, notaMinima: Double;
begin
   //Aulas
   if pgcAulasNotas.ActivePage = tsAulas then begin
      if Self.dbgAulas.SelectedRows.Count > 0 then begin
         //excluir

         if Mensagem('Você tem certeza que deseja excluir os registros selecionados?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
         begin

             DM.CriarConsulta(qyAFreqs);
             DM.CriarConsulta(qyAAulas);

             qyAAulas.Close();
             qyAAulas.SQL.Clear();
             qyAAulas.Params.Clear();
             qyAAulas.SQL.Text := SQL_EXCLUI_AULA;

             qyAFreqs.Close();
             qyAFreqs.SQL.Clear();
             qyAFreqs.Params.Clear();
             qyAFreqs.SQL.Text := SQL_EXCLUI_FREQ;


             for n := 0 to Self.dbgAulas.SelectedRows.Count - 1 do
             begin

                // Posicionar no registro a ser excluido

                Self.dbgAulas.DataSource.DataSet.GotoBookmark(Pointer(Self.dbgAulas.SelectedRows.Items[n]));

                // Inserir log de exclusão de aulas

                logDesc := '';
                logDesc := logDesc + 'Código da aula: '+Self.qyAulas.FieldByName('cd_diario_aula').AsString+', ';
                logDesc := logDesc + 'Nro. Aula: '+Self.qyAulas.FieldByName('nro_aula').AsString+', ';
                logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', Self.qyAulas.FieldByName('data').AsDateTime)+', ';
                logDesc := logDesc + 'Qtd. Aulas: '+Self.qyAulas.FieldByName('qtd_aulas').AsString+', ';
                logDesc := logDesc + 'Conteúdo: '+Self.qyAulas.FieldByName('conteudo').AsString+', ';
                logDesc := logDesc + 'Anosemestre: '+Self.qyAulas.FieldByName('anosemestre').AsString+', ';
                logDesc := logDesc + 'Turma: '+Self.qyAulas.FieldByName('turma').AsString+', ';
                logDesc := logDesc + 'Disciplina: '+Self.qyAulas.FieldByName('disciplina').AsString+', ';
                logDesc := logDesc + 'Etapa da Turma (Série, Ano, Fase...): '+Self.qyAulas.FieldByName('bimestre').AsString+' [Acadêmico]';

                { Insere log de inserção de aulas }
                DMDiario.inserirLog(uDMDiario.ACAO_EXCLUSAO, uDMDiario.ATIVIDADE_AULA, logDesc, Self.qyAulas.FieldByName('cd_professor').AsInteger);

                //Excluir a aula
                qyAAulas.ParamByName('turma').AsString := qyAulasturma.AsString;
                qyAAulas.ParamByName('anosemestre').AsInteger := qyAulasanosemestre.AsInteger;
                qyAAulas.ParamByName('disciplina').AsInteger := qyAulasdisciplina.AsInteger;
                qyAAulas.ParamByName('bimestre').AsInteger := qyAulasbimestre.AsInteger;
                qyAAulas.ParamByName('nro_aula').AsInteger := qyAulasnro_aula.AsInteger;

                qyAAulas.ExecSQL();

                // Excluir a Frequencia
                qyAFreqs.ParamByName('turma').AsString := qyAulasturma.AsString;
                qyAFreqs.ParamByName('anosemestre').AsInteger := qyAulasanosemestre.AsInteger;
                qyAFreqs.ParamByName('disciplina').AsInteger := qyAulasdisciplina.AsInteger;
                qyAFreqs.ParamByName('bimestre').AsInteger := qyAulasbimestre.AsInteger;
                qyAFreqs.ParamByName('nro_aula').AsInteger := qyAulasnro_aula.AsInteger;

                qyAFreqs.ExecSQL();

             end;

             FreeAndNil(qyAFreqs);
             FreeAndNil(qyAAulas);

             Self.FiltroGridAulas( '', true );
         end;
      end
      else begin
         Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
         Exit;
      end;
   end
   //Aulas
   else if pgcAulasNotas.ActivePage = tsProvas then begin
      if Self.dbgProvas.SelectedRows.Count > 0 then begin
         //excluir

         if Mensagem('Você tem certeza que deseja excluir estes registros e todas as notas vinculadas a eles?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

            DM.CriarConsulta(qyANotas);

            qyANotas.Close();
            qyANotas.SQL.Clear();
            qyANotas.Params.Clear();
            qyANotas.SQL.Text := SQL_EXCLUI_NOTAS;

            notaMaxima := StrToFloat(DM.variavel_parametro('diario_online_digita_max'));
            notaMinima := StrToFloat(DM.variavel_parametro('diario_online_digita_min'));

            with qyAux do begin
               Close();
               SQL.Clear();
               Params.Clear();

               SQL.Add('DELETE  '+
                  'FROM diario_provas '+
                  'WHERE turma = :turma AND anosemestre = :anosemestre AND disciplina = :disciplina AND bimestre = :bimestre AND nro_nota = :nro_nota AND cd_professor = :prof ');

               for n := 0 to dbgProvas.SelectedRows.Count - 1 do begin

                  dbgProvas.DataSource.DataSet.GotoBookmark(Pointer(dbgProvas.SelectedRows.Items[n]));

                  // Verifica se a disciplina das provas é uma disciplina frente
                  arrDisciplinasFazemFrente := DM.getDisciplinasFazemFrente(qyProvasanosemestre.AsInteger, qyProvasturma.AsString, qyProvasdisciplina.AsInteger);

                  if arrDisciplinasFazemFrente.Count > 0 then
                  begin
                     if Mensagem('A prova "'+qyProvasassunto.AsString+'" que você está tentando excluir pertence a uma disciplina frente, se a mesma for removida o sistema perderá o vínculo com as outras provas de mesmo tipo das disciplinas vinculadas a essa.'+#13+'Tem certeza que deseja excluir esta prova?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_NO then
                     begin
                        Continue;
                     end;
                  end;

                  // Inserir log de alteração de aulas
                  logDesc := '';
                  logDesc := logDesc + 'Nro. Prova: '+qyProvasnro_nota.AsString+', ';
                  logDesc := logDesc + 'Data: '+FormatDateTime('yyyy-mm-dd', qyProvasdata.AsDateTime)+', ';
                  logDesc := logDesc + 'Peso: '+qyProvasvl_peso.AsString+', ';
                  logDesc := logDesc + 'Assunto: '+qyProvasassunto.AsString+', ';
                  logDesc := logDesc + 'Anosemestre: '+qyProvasanosemestre.AsString+', ';
                  logDesc := logDesc + 'Turma: '+qyProvasturma.AsString+', ';
                  logDesc := logDesc + 'Disciplina: '+qyProvasdisciplina.AsString+', ';
                  logDesc := logDesc + 'Etapa da Turma (Série, Ano, Fase...): '+qyProvasbimestre.AsString+', ';
                  logDesc := logDesc + 'Tipo de Avaliação: ' + qyProvascd_tipo.AsString + ' [Acadêmico]';

                  { Insere log de excluir de provas }
                  DMDiario.inserirLog(uDMDiario.ACAO_EXCLUSAO, uDMDiario.ATIVIDADE_PROVA, logDesc, qyProvascd_professor.AsInteger);

                  { Excluir as notas da prova }
                  qyANotas.ParamByName('turma').AsString := qyProvasturma.AsString;
                  qyANotas.ParamByName('anosemestre').AsInteger := qyProvasanosemestre.AsInteger;
                  qyANotas.ParamByName('disciplina').AsInteger := qyProvasdisciplina.AsInteger;
                  qyANotas.ParamByName('bimestre').AsInteger := qyProvasbimestre.AsInteger;
                  qyANotas.ParamByName('nro_prova').AsInteger := qyProvasnro_nota.AsInteger;

                  qyANotas.ExecSQL();

                  // Remove os notificadores e pendencias de deferimento ou deferimentos realizados vinculados a eles
                  removerNotificacoes(qyProvasanosemestre.AsInteger, qyProvasturma.AsString, qyProvasdisciplina.AsInteger, qyProvasbimestre.AsInteger, qyProvasnro_nota.AsInteger);
                  
                  {TRATAMENTO DISCIPLINAS COM FRENTES}

                  // Busca a disciplina frente da disciplina que o usuário está excluindo
                  iDisciplinaFrente := DM.getDisciplinaFrente(qyProvasdisciplina.AsInteger, qyProvasanosemestre.AsInteger, qyProvasturma.AsString);

                  // Se é uma disciplina frente
                  if iDisciplinaFrente > 0 then begin

                     // Busca o codigo do tipo de avaliação utilizada nessa prova que está alterando a nota
                     iCdTipoAvaliacao := DM.getTipoAvaliacao(
                        qyProvasanosemestre.AsInteger,
                        qyProvasturma.AsString,
                        qyProvasdisciplina.AsInteger,
                        qyProvasbimestre.AsInteger,
                        qyProvasnro_nota.AsInteger
                     );

                     // Busca os alunos da disciplina frente
                     arrPessoas := DM.getAlunosPorTipoProvaDisciplinaFrente(
                                       qyProvasanosemestre.AsInteger,
                                       qyProvasturma.AsString,
                                       iDisciplinaFrente,
                                       qyProvasbimestre.AsInteger,
                                       iCdTipoAvaliacao
                                   );

                     // Busca as disciplinas que fazem frente
                     arrDisciplinasFazemFrente := DM.getDisciplinasFazemFrente(qyProvasanosemestre.AsInteger, qyProvasturma.AsString, iDisciplinaFrente);

                     for j := 0 to arrPessoas.Count - 1 do
                     begin

                        // Varre as disciplinas que fazem frente buscando as notas de mesmo tipo de prova que está sendo editado
                        rSomaTotalNotas.vl_nota := 0;
                        rSomaTotalNotas.IsNull := True;

                        for i := 0 to arrDisciplinasFazemFrente.Count - 1 do
                        begin
                           iDisciplina := StrToInt(arrDisciplinasFazemFrente.Strings[i]);

                           rSomaNotas := DM.getSomaNotasProvasMesmoTipo(
                                             qyProvasanosemestre.AsInteger,
                                             qyProvasturma.AsString,
                                             iDisciplina,
                                             qyProvasbimestre.AsInteger,
                                             iCdTipoAvaliacao,
                                             StrToInt(arrPessoas.Strings[j])
                                         );

                           if not rSomaNotas.IsNull then
                           begin
                              rSomaTotalNotas.vl_nota := rSomaTotalNotas.vl_nota + rSomaNotas.vl_nota;
                              rSomaTotalNotas.IsNull := False;
                           end;
                        end;

                        // Verifica se a nota da disciplina pai está nos limites de mínima e máxima
                        if rSomaTotalNotas.vl_nota > notaMaxima then
                           rSomaTotalNotas.vl_nota := notaMaxima;

                        if rSomaTotalNotas.vl_nota < notaMinima then
                           rSomaTotalNotas.vl_nota := notaMinima;

                        // Retorna alguns dados da prova da disciplina frente
                        DM.gerarLogAlteracaoNota(
                           qyProvasanosemestre.AsInteger,
                           qyProvasturma.AsString,
                           iDisciplinaFrente,
                           qyProvasbimestre.AsInteger,
                           iCdTipoAvaliacao,
                           StrToInt(arrPessoas.Strings[j]),
                           rSomaTotalNotas
                        );

                        // Atribui a soma das notas das provas de mesmo tipo das disciplinas que fazem frente para a prova da disciplina frente
                        DM.atribuiNotaProvaDisciplinaFrente(
                           qyProvasanosemestre.AsInteger,
                           qyProvasturma.AsString,
                           iDisciplinaFrente,
                           qyProvasbimestre.AsInteger,
                           iCdTipoAvaliacao,
                           StrToInt(arrPessoas.Strings[j]),
                           rSomaTotalNotas
                        );
                        
                     end;

                  end;

                  { Excluir a prova }
                  ParamByName('turma').AsString := qyProvasturma.AsString;
                  ParamByName('anosemestre').AsInteger := qyProvasanosemestre.AsInteger;
                  ParamByName('disciplina').AsInteger := qyProvasdisciplina.AsInteger;
                  ParamByName('bimestre').AsInteger := qyProvasbimestre.AsInteger;
                  ParamByName('nro_nota').AsInteger := qyProvasnro_nota.AsInteger;
                  ParamByName('prof').AsInteger := qyProvascd_professor.AsInteger;
                  ExecSQL();

               end;

               FreeAndNil(qyANotas);

               Close();
               SQL.Clear();
               Params.Clear();
               FiltroGridAulas( '', true );
            end;
         end;
      end
      else begin
         Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
         Exit;
      end;
   end
   else if pgcAulasNotas.ActivePage = tsComplemento then begin
      if (Self.dbgComplemento.SelectedRows.Count < 1) then begin
         Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
         Exit;
      end;
      if Mensagem('Você tem certeza que deseja excluir este registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
         CheckCreateAcoes();
         with frmAulasProvasAcoes do begin
            SelecionaTab('tsComplemento');
            qyCompl.Close();
            qyCompl.ParamByName('cd_ajuste_turma').AsInteger := qyAjustescd_ajuste_turma.AsInteger;
            qyCompl.Open();
            if not qyCompl.IsEmpty then begin
               qyCompl.Delete();
            end;
            FiltroGridAulas( '', true );
         end;
      end;
   end
   //////////////
   // cronograma
   else if pgcAulasNotas.ActivePage = tsCronogramas then begin
      if Self.dbgCronogramas.SelectedRows.Count > 0 then begin

         //excluir
         if Mensagem('Você tem certeza que deseja excluir este registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

            with qyAux do begin
               Close();
               SQL.Clear();
               Params.Clear();

               SQL.Add('DELETE  '+
                  'FROM diario_cronogramas '+
                  'WHERE cd_cronograma = :cd_cronograma ');

               for n := 0 to dbgCronogramas.SelectedRows.Count - 1 do begin
                  dbgCronogramas.DataSource.DataSet.GotoBookmark(Pointer(dbgCronogramas.SelectedRows.Items[n]));

                  // Inserir log de exclusão dos cronogramas
                  logDesc := 'Exclusão do cronograma, ação realizada pelo usuário com mensagem de confirmação.'+CHR(13);
                  logDesc := logDesc + 'Código do cronograma (cd_cronograma): '+qCronogramas.FieldByName('cd_cronograma').AsString+', ';
                  logDesc := logDesc + 'Anosemestre: '+qCronogramas.FieldByName('anosemestre').AsString+', ';
                  logDesc := logDesc + 'Turma: '+qCronogramas.FieldByName('turma').AsString+', ';
                  logDesc := logDesc + 'Disciplina: '+qCronogramas.FieldByName('disciplina').AsString+', ';
                  logDesc := logDesc + 'Data: '+FormatDateTime('dd/mm/yyyy', qCronogramas.FieldByName('dt_cronograma').AsDateTime)+', ';
                  logDesc := logDesc + 'Horário: '+qCronogramas.FieldByName('ds_horario').AsString+', ';
                  logDesc := logDesc + 'Bimestre: '+qCronogramas.FieldByName('bimestre').AsString+', ';
                  logDesc := logDesc + CHR(13) + '[Acadêmico]';

                  { Insere log de inserção de aulas }
                  DMDiario.inserirLog(uDMDiario.ACAO_EXCLUSAO, uDMDiario.ATIVIDADE_CRONOGRAMA, logDesc, qCronogramas.FieldByName('cd_professor').AsInteger);

                  ParamByName('cd_cronograma').AsString := qCronogramas.FieldByName('cd_cronograma').AsString;
                  frmAulasProvasAcoes.ExcluirTurmasProfessor(qCronogramas.FieldByName('cd_cronograma').AsInteger);
                  ExecSQL();
               end;

               if ClasseTurmas.IsDataInicioFimFromCronograma( qCronogramasanosemestre.AsInteger,
                                                              qCronogramasturma.AsString ) then
               begin
                  ClasseTurmas.CalculaDataInicioFimTurma( qCronogramasanosemestre.AsInteger,
                                                          qCronogramasturma.AsString );
               end;               

               Close();
               SQL.Clear();
               Params.Clear();
               FiltroGridAulas( '', true  );
            end;
         end;
      end
      else begin
         Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
         Exit;
      end;
   end;

end;

procedure TfrmContAulasProvas.removerNotificacoes(nr_anosemestre: Integer; cd_turma: String; cd_disciplina: Integer; cd_bimestre: Integer; nr_prova: Integer);
var
   qyNotDef: TUMZQuery;
begin
   DM.CriarConsulta(qyNotDef);

   // Remove os Notificadores da turma/disciplina/prova
   qyNotDef.Close;
   qyNotDef.SQL.Clear;
   qyNotDef.SQL.Text := 'DELETE n.* FROM uni_notificacoes n INNER JOIN diario_provas_not_deferimentos dpnd ON (n.cd_notificacao = dpnd.cd_notificacao) WHERE '+
                        ' dpnd.cd_turma = :cd_turma AND dpnd.nr_anosemestre = :nr_anosemestre AND dpnd.cd_disciplina = :cd_disciplina AND dpnd.cd_bimestre = :cd_bimestre AND dpnd.nr_prova = :nr_prova';
   qyNotDef.ParamByName('cd_turma').AsString := cd_turma;
   qyNotDef.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNotDef.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNotDef.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNotDef.ParamByName('nr_prova').AsInteger := nr_prova;
   qyNotDef.ExecSQL();

   qyNotDef.Close;
   qyNotDef.SQL.Clear;
   qyNotDef.SQL.Text := 'DELETE n.* FROM uni_notificacoes n INNER JOIN diario_provas_notif_deferir dpnd ON (n.cd_notificacao = dpnd.cd_notificacao) WHERE '+
                        ' dpnd.cd_turma = :cd_turma AND dpnd.nr_anosemestre = :nr_anosemestre AND dpnd.cd_disciplina = :cd_disciplina AND dpnd.cd_bimestre = :cd_bimestre AND dpnd.nr_prova = :nr_prova';
   qyNotDef.ParamByName('cd_turma').AsString := cd_turma;
   qyNotDef.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNotDef.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNotDef.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNotDef.ParamByName('nr_prova').AsInteger := nr_prova;
   qyNotDef.ExecSQL();

   // Remove os Notificadores de deferir notas da turma/disciplina/prova
   qyNotDef.Close;
   qyNotDef.SQL.Clear;
   qyNotDef.SQL.Text := 'DELETE FROM diario_provas_notif_deferir WHERE '+
                        ' cd_turma = :cd_turma AND nr_anosemestre = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND cd_bimestre = :cd_bimestre AND nr_prova = :nr_prova';
   qyNotDef.ParamByName('cd_turma').AsString := cd_turma;
   qyNotDef.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNotDef.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNotDef.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNotDef.ParamByName('nr_prova').AsInteger := nr_prova;
   qyNotDef.ExecSQL();

   // Remove os Notificadores de notas deferidas da turma/disciplina/prova
   qyNotDef.Close;
   qyNotDef.SQL.Clear;
   qyNotDef.SQL.Text := 'DELETE FROM diario_provas_not_deferimentos WHERE '+
                        ' cd_turma = :cd_turma AND nr_anosemestre = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND cd_bimestre = :cd_bimestre AND nr_prova = :nr_prova';
   qyNotDef.ParamByName('cd_turma').AsString := cd_turma;
   qyNotDef.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNotDef.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNotDef.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNotDef.ParamByName('nr_prova').AsInteger := nr_prova;
   qyNotDef.ExecSQL();

   // Remove a solicitação de deferimento de notas da turma/disciplina/prova
   qyNotDef.Close;
   qyNotDef.SQL.Clear;
   qyNotDef.SQL.Text := 'DELETE FROM diario_provas_deferir WHERE '+
                        ' cd_turma = :cd_turma AND nr_anosemestre = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND cd_bimestre = :cd_bimestre AND nr_prova = :nr_prova';
   qyNotDef.ParamByName('cd_turma').AsString := cd_turma;
   qyNotDef.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNotDef.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNotDef.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNotDef.ParamByName('nr_prova').AsInteger := nr_prova;
   qyNotDef.ExecSQL();

   // Remove o deferimento de notas da turma/disciplina/prova
   qyNotDef.Close;
   qyNotDef.SQL.Clear;
   qyNotDef.SQL.Text := 'DELETE FROM diario_provas_deferimentos WHERE '+
                        ' cd_turma = :cd_turma AND nr_anosemestre = :nr_anosemestre AND cd_disciplina = :cd_disciplina AND cd_bimestre = :cd_bimestre AND nr_prova = :nr_prova';
   qyNotDef.ParamByName('cd_turma').AsString := cd_turma;
   qyNotDef.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyNotDef.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyNotDef.ParamByName('cd_bimestre').AsInteger := cd_bimestre;
   qyNotDef.ParamByName('nr_prova').AsInteger := nr_prova;
   qyNotDef.ExecSQL();
end;

procedure TfrmContAulasProvas.dtFiltroDataChange(Sender: TObject);
begin
   FiltroGridAulas( '', true  );
end;

procedure TfrmContAulasProvas.dtFiltroDataFimChange(Sender: TObject);
begin
   FiltroGridAulas( '', true  );
end;

procedure TfrmContAulasProvas.edCodDiscCronoExit(Sender: TObject);
begin
   GetDisciplina();
end;

procedure TfrmContAulasProvas.edCodDiscCronoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then begin
       dtpDtInicio.SetFocus();
       Key := #0;
    end;
end;

procedure TfrmContAulasProvas.edCodigoProfessorExit(Sender: TObject);
begin
   GetProfessor();
end;

procedure TfrmContAulasProvas.edCodigoProfessorKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then begin
       edCodDiscCrono.SetFocus();
       Key := #0;
    end;
end;

procedure TfrmContAulasProvas.dbgAulasTitleClick(Column: TColumn);
var
   sAux, sChaveCount, sChaveNroAula: string;
begin
   sAux := Column.FieldName;
   if sAux = 'bloqueado' then
      sAux := 'sn_bloqueado'
   else if sAux = 'dia_semana' then
      sAux := 'DAYOFWEEK(dt_cronograma)'
   else if sAux = 'aula' then
      sAux := 'nro_aula'
   else if sAux = 'bloqueado' then
      sAux := 'sn_bloqueado'
   else if sAux = 'desc_conteudo' then
      sAux := 'conteudo'
   else if sAux = 'ordem' then
      exit;        

   FiltroGridAulas( sAux, true );
end;

procedure TfrmContAulasProvas.CarregaItemBusca();
var
   I: Integer;
begin
   //Aulas
   if pgcAulasNotas.ActivePage = tsAulas then begin
      sAnoSem := sPAnoSem;
      
      txtCurso.Text := sPCurso;
      edCurso.Text  := sPDescCurso;
      txtTurma.Text := sPTurma;
      txtDisciplina.Text := sPDisciplina;
      edDisc.Text        := sPDescDisciplina;
      if sPGrupo > 0 then
      begin
         edCodGrupoAulas.Text  := IntToStr(sPGrupo);
         edNomeGrupoAulas.Text := sPDescGrupo;
      end;
   end
   else if pgcAulasNotas.ActivePage = tsProvas then begin
      txtPCurso.Text  := sPCurso;
      txtPTurma.Text  := sPTurma;
      edDiscDesc.Text := sPDescDisciplina;
      txtPDisciplina.Text := sPDisciplina;
      if sPGrupo > 0 then
      begin
         edCodGrupoProvas.Text  := IntToStr(sPGrupo);
         edNomeGrupoProvas.Text := sPDescGrupo;
      end;
   end
   else if pgcAulasNotas.ActivePage = tsAprovacao then begin
      txtACurso.Text := sPCurso;
      txtATurma.Text := sPTurma;
      edADisciplina.Text := sPDescDisciplina;
      txtADisciplina.Text := sPDisciplina;
   end
   else if pgcAulasNotas.ActivePage = tsComplemento then begin
      sAnoSem := sCAnoSem;
      txtCCurso.Text := sPCurso;
      txtCTurma.Text := sCTurma;
   end
   else if pgcAulasNotas.ActivePage = tsCronogramas then begin

      sAnoSem := sCAnoSem;

      if DM.UsaAnosemestre then
      begin
         pnEtapa.Visible := true;
         if trim(sAnoSem) = '' then
            sCronogramaAnoSem := IntToStr(ano_semestre)
         else
            sCronogramaAnoSem := sAnoSem
      end
      else begin
         pnEtapa.Visible := false;
         sCronogramaAnoSem := IntToStr(ANOSEMESTRE_PADRAO);
      end;


      txtCronogramasCurso.Text            := sPCurso;
      txtCronogramasCursoDescricao.Text   := sPDescCurso;
      txtTurmaCronograma.Text             := sPTurma;
      edCodDiscCrono.Text                 := sPDisciplina;
      txtDiscCronograma.Text              := sPDescDisciplina;
      if sPGrupo > 0 then
      begin
         edCodGrupoCronogramas.Text  := IntToStr(sPGrupo);
         edNomeGrupoCronogramas.Text := sPDescGrupo;
      end;

      {FiltrarTurmas();}
      if ( trim(sPTurma) <> '' ) then
      begin
         txtTurmaCronograma.Text := sPTurma;
         sCronogramaTurma := sPTurma;
         {FiltrarDisciplinas();}

         if ( trim(sPDisciplina) <> '' ) then begin
            sCronogramaDisciplina := sPDisciplina;
         end;
      end;
   end;


end;

procedure TfrmContAulasProvas.CarregarComboAulasSituacoes;
const
   SQL_SITUACOES_LOGISTICA =
      ' SELECT cd_modulo, cd_situacao, ds_valor, cd_auxiliar ' +
      ' FROM situacoes WHERE cd_modulo IN ( 1090, 1091, 1092, 1093, 1094, 1095 ) ' +
      ' ORDER BY cd_modulo, ds_valor ';
var
   qyCarregarSituacoesLogistica : TUMZReadOnlyQuery;
   cbAddItem: TUMComboBox;
begin
   DM.CriarConsulta( qyCarregarSituacoesLogistica );

   cbSituacaoMaterialAula.Clear;
   cbSituacaoTransporte.Clear;
   cbSituacaoLocalAula.Clear;
   cbSituacaoHospedagem.Clear;
   cbSituacaoGerenProfessor.Clear;
   cbSituacaoGerenGestor.Clear;

   qyCarregarSituacoesLogistica.SQL.Text := SQL_SITUACOES_LOGISTICA;
   qyCarregarSituacoesLogistica.Open;

   while not qyCarregarSituacoesLogistica.Eof do
   begin
      case qyCarregarSituacoesLogistica.FieldByName('cd_modulo').AsInteger of
         1090: cbAddItem := cbSituacaoMaterialAula;
         1091: cbAddItem := cbSituacaoLocalAula;
         1092: cbAddItem := cbSituacaoGerenProfessor;
         1093: cbAddItem := cbSituacaoTransporte;
         1094: cbAddItem := cbSituacaoHospedagem;
         1095: cbAddItem := cbSituacaoGerenGestor;         
      end;

      if cbAddItem.Items.Count = 0 then
      begin
         cbAddItem.AddItem( '- Selecione -', nil );
         cbAddItem.ItemIndex := 0;
      end;
      
      cbAddItem.AddItem(
         qyCarregarSituacoesLogistica.FieldByName('ds_valor').AsString,
         TSituacaoLogistica.Create(
            qyCarregarSituacoesLogistica.FieldByName('cd_situacao').AsInteger,
            qyCarregarSituacoesLogistica.FieldByName('cd_auxiliar').AsInteger,
            qyCarregarSituacoesLogistica.FieldByName('ds_valor').AsString
         ) );

      qyCarregarSituacoesLogistica.Next;
   end;

   FreeAndNil(qyCarregarSituacoesLogistica);
end;

procedure TfrmContAulasProvas.qyProvasCalcFields(DataSet: TDataSet);
begin
   with qyProvas do
   begin
      if qyProvas.FieldByName('sn_bloqueado').AsInteger = 0 then begin
         qyProvas.FieldByName('bloqueado').AsString := 'NÃO';
      end
      else begin
         qyProvas.FieldByName('bloqueado').AsString := 'SIM';
      end;

      if StrToBool(IntToStr(FieldByName('sn_compoe').AsInteger)) then
         FieldByName('ds_tipo').AsString := 'CNS'
      else if StrToBool(IntToStr(FieldByName('sn_especial').AsInteger)) then
         FieldByName('ds_tipo').AsString := 'RE'
      else if StrToBool(IntToStr(FieldByName('sn_proficiencia').AsInteger)) then
         FieldByName('ds_tipo').AsString := 'PS'
      else
         FieldByName('ds_tipo').AsString := 'NCNS';
   end;

end;

procedure TfrmContAulasProvas.pgcAulasNotasChange(Sender: TObject);
begin
   PosicionarElementosAbas();
   Application.ProcessMessages();

   if Sender <> nil then
      CarregaItemBusca();

   FiltroGridAulas( '', false  );

   {if pgcAulasNotas.ActivePage = tsCronogramas then
   begin
      FiltrarDisciplinas();
      btnLimparClick(nil);
   end;}

end;

procedure TfrmContAulasProvas.PosicionarElementosAbas;
begin
   case pgcAulasNotas.TabIndex of
      0: begin
         // Aulas
         edUnidadeEnsino.Parent := Panel1;
         sbSelecionaUnidadeEnsino.Parent := Panel1;
         lbUnidadeEnsino.Parent := Panel1;
      end;
      1: begin
         // Provas
         edUnidadeEnsino.Parent := Panel2;
         sbSelecionaUnidadeEnsino.Parent := Panel2;
         lbUnidadeEnsino.Parent := Panel2;
      end;
      2: begin
         // Aprovação
         edUnidadeEnsino.Parent := Panel4;
         sbSelecionaUnidadeEnsino.Parent := Panel4;
         lbUnidadeEnsino.Parent := Panel4;
      end;
      3: begin
         // Complementos de Média
         edUnidadeEnsino.Parent := Panel5;
         sbSelecionaUnidadeEnsino.Parent := Panel5;
         lbUnidadeEnsino.Parent := Panel5;
      end;
      4: begin
         // Cronogramas
         edUnidadeEnsino.Parent := Panel6;
         sbSelecionaUnidadeEnsino.Parent := Panel6;
         lbUnidadeEnsino.Parent := Panel6;
      end;
   end;
end;

procedure TfrmContAulasProvas.qCronogramasBeforeOpen(DataSet: TDataSet);
begin
   if slCountAulas = nil then
      slCountAulas := TStringList.Create();
   if slNroAula = nil then
      slNroAula := TStringList.Create();

   slCountAulas.Clear();
   slNroAula.Clear();
end;

procedure TfrmContAulasProvas.qCronogramasCalcFields(DataSet: TDataSet);
var
   iNroAula: Integer;
   sChave: String;
   qyBuscaNroAula: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyBuscaNroAula);

   qCronogramasdia_semana.AsString := DiaDaSemana(qCronogramasdt_cronograma.AsDateTime);
   sChave := qCronogramasanosemestre.AsString + '_' + qCronogramasturma.AsString + '_' + qCronogramasdisciplina.AsString + '_' + qCronogramascd_grupo.AsString;

   if ( trim(slCountAulas.Values[ sChave ]) = '' ) then
   begin
      with qyBuscaNroAula do
      begin
         SQL.Text := 'SELECT count(*) AS registros FROM diario_cronogramas ' +
                                    'where turma = :turma and anosemestre = :anosemestre AND disciplina = :disciplina AND CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END ';
         ParamByName('anosemestre').AsInteger := qCronogramasanosemestre.AsInteger;
         ParamByName('turma').AsString := qCronogramasturma.AsString;
         ParamByName('disciplina').AsInteger := qCronogramasdisciplina.AsInteger;
         if qCronogramascd_grupo.AsInteger > 0 then
         begin
            ParamByName('cd_grupo').AsInteger := qCronogramascd_grupo.AsInteger;
         end else begin
            ParamByName('cd_grupo').Clear;
         end;

         Open();

         slCountAulas.Values[ sChave ] := FieldByName('registros').AsString;
      end;
   end;

   if (trim(slNroAula.Values[ sChave + '_' + qCronogramascd_cronograma.AsString ]) = '') then
   begin
      iNroAula := 0;

      with qyBuscaNroAula do
      begin
         SQL.Clear();
         SQL.Add('SELECT dt_cronograma, cd_horario');
         SQL.Add('FROM diario_cronogramas dc');
         SQL.Add('     INNER JOIN horarios h ON (h.codigo = dc.cd_horario)');
         SQL.Add('WHERE dc.turma = :turma and dc.anosemestre = :anosemestre AND dc.disciplina = :disciplina AND CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END ');
         SQL.Add('ORDER BY dc.dt_cronograma, h.hr_inicio');
         ParamByName('anosemestre').AsInteger := qCronogramasanosemestre.AsInteger;
         ParamByName('turma').AsString := qCronogramasturma.AsString;
         ParamByName('disciplina').AsInteger := qCronogramasdisciplina.AsInteger;
         if qCronogramascd_grupo.AsInteger > 0 then
         begin
            ParamByName('cd_grupo').AsInteger := qCronogramascd_grupo.AsInteger;
         end else begin
            ParamByName('cd_grupo').Clear;
         end;

         Open();

         while not Eof do
         begin
            Inc(iNroAula);
            // qyBuscaNroAula.FieldByName('cd_cronograma').AsInteger = qCronogramascd_cronograma.AsInteger
            if (qCronogramasdt_cronograma.AsDateTime = qyBuscaNroAula.FieldByName('dt_cronograma').AsDateTime) AND
               (qCronogramascd_horario.AsInteger = qyBuscaNroAula.FieldByName('cd_horario').AsInteger) then
            begin
               slNroAula.Values[ sChave + '_' + qCronogramascd_cronograma.AsString ] := IntToStr(iNroAula);
               break;
            end;

            Next();
         end;               
      end;
   end;
   

   qCronogramasordem.AsString := slNroAula.Values[ sChave + '_' + qCronogramascd_cronograma.AsString ] +
                                 '/' + slCountAulas.Values[ sChave ];
end;

procedure TfrmContAulasProvas.qyAprovacaoCalcFields(DataSet: TDataSet);
begin
   if qyAprovacao.FieldByName('cd_situacao').AsInteger = 1 then begin
      qyAprovacao.FieldByName('situacao').AsString := 'ABERTO';
   end
   else if qyAprovacao.FieldByName('cd_situacao').AsInteger = 2 then begin
      qyAprovacao.FieldByName('situacao').AsString := 'DEFERIDO';
   end
   else if qyAprovacao.FieldByName('cd_situacao').AsInteger = 3 then begin
      qyAprovacao.FieldByName('situacao').AsString := 'INDEFERIDO';
   end;

   if qyAprovacao.FieldByName('sn_faltou_antigo').AsInteger = 1 then
   begin
      qyAprovacao.FieldByName('nr_nota_antiga_calc').AsString := '(faltou)';
   end else begin
      qyAprovacao.FieldByName('nr_nota_antiga_calc').AsString := FormatFloat('##.00', qyAprovacao.FieldByName('nr_nota_antiga').AsFloat);
   end;

   if qyAprovacao.FieldByName('sn_faltou_novo').AsInteger = 1 then
   begin
      qyAprovacao.FieldByName('nr_nota_nova_calc').AsString := '(faltou)';
   end else begin
      qyAprovacao.FieldByName('nr_nota_nova_calc').AsString := FormatFloat('##.00', qyAprovacao.FieldByName('nr_nota_nova').AsFloat);
   end;

   qyAprovacaodesc_motivo.AsString := Copy(qyAprovacaods_requerimento.AsString, 1, 100);
   qyAprovacaodesc_resposta.AsString := Copy(qyAprovacaods_resposta.AsString, 1, 100);

end;

procedure TfrmContAulasProvas.cbASituacaoChange(Sender: TObject);
begin
   FiltroGridAulas( '', true  );
end;

procedure TfrmContAulasProvas.btDeferirClick(Sender: TObject);
var
   iResp: integer;
   sJust: string;
   i: Integer;
begin
   //Aulas
   if pgcAulasNotas.ActivePage = tsAprovacao then begin

      if dbgAprovacao.SelectedRows.Count > 1 then begin
         for i := 0 to dbgAprovacao.SelectedRows.Count -1 do begin
            if (qyAprovacao.BookmarkValid(Pointer(dbgAprovacao.SelectedRows.Items[i]))) then begin
               qyAprovacao.GotoBookmark(Pointer(dbgAprovacao.SelectedRows.Items[i]));
            end
            else begin
               Continue;
            end;
            if (TToolButton(Sender).Name = 'btIndeferir') then begin
               AtualizaAcoes(3, '', False);
            end
            else begin
               AtualizaAcoes(2, '', False);
            end;
         end;
         FiltroGridAulas( '', true  );
      end
      else if qyAprovacaocd_situacao.AsInteger = 1 then
      begin
      
         CheckCreateAcoes();
         frmAulasProvasAcoes.SelecionaTab('tsAprovacao');

         with frmAulasProvasAcoes do
         begin
         
            lblAssunto.Caption := qyAprovacaoassunto.AsString;
            lblACurso.Caption := txtACurso.Text;
            lblAturma.Caption := qyAprovacaoturma.AsString;
            lblAAluno.Caption := qyAprovacaonm_pessoa.Asstring;
            lblADisciplina.Caption := qyAprovacaodisciplina.AsString;
            
            meAJust.Lines.Text := qyAprovacaods_requerimento.AsString;

            if (TToolButton(Sender).Name = 'ToolButton24') then
            begin
               frmAulasProvasAcoes.btDeferir.Enabled := False;
               frmAulasProvasAcoes.btIndeferir.Enabled := True;
            end
            else
            begin
               frmAulasProvasAcoes.btDeferir.Enabled := True;
               frmAulasProvasAcoes.btIndeferir.Enabled := False;
            end;
            
            frmAulasProvasAcoes.ShowModal();
            iResp := getRetorno();
            sJust := frmAulasPRovasAcoes.meResposta.Lines.Text;
            AtualizaAcoes(iResp, sJust);
            
         end;
      end
      else begin
         Mensagem('Situação desta alteração já foi definida!', 'Atenção!', MB_OK + MB_ICONINFORMATION);
      end;
   end;
end;

procedure TfrmContAulasProvas.btDuplicarAvaliacaoClick(Sender: TObject);
var
   i: Integer;
   arrProvas: TStringList;
begin
   if not DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.AulasProvasDuplicarAvaliacoes', npAcesso, True ) then Exit;

   if Self.dbgProvas.SelectedRows.Count > 0 then
   begin

      if edCursoProvas.Text = '' then
      begin
         Mensagem('Favor, selecionar primeiro o curso no filtro que você deseja trabalhar.');
         exit;
      end;

      if not ckbPBim.Checked then
      begin
         Mensagem('Favor, selecionar primeiro a etapa no filtro que você deseja trabalhar.');
         exit;
      end;

      // Inicializa o StringList que ira armazenar os codigos das provas 
      arrProvas := TStringList.Create;

      // Repassa as provas selecionadas para a nova tela
      with Self.dbgProvas.DataSource.DataSet do
      begin
         for i := 0 to Self.dbgProvas.SelectedRows.Count-1 do
         begin
            // Busca os registros (provas) selecionados
            GotoBookmark(Pointer(Self.dbgProvas.SelectedRows.Items[i]));
            // Adiciona o registro (prova) selecionado no StringList
            arrProvas.Add(qyProvas.FieldByName('cd_prova').AsString);
         end;
      end;

      Application.CreateForm(TfrmDuplicarAvaliacoes, frmDuplicarAvaliacoes);
      frmDuplicarAvaliacoes.setEtapaSelecionada(txtPBim.Text);
      frmDuplicarAvaliacoes.addProvas(arrProvas);
      frmDuplicarAvaliacoes.ShowModal;
      
   end
   else begin
      Mensagem('Nenhum registro selecionado. Por favor, revise o filtro!', 'Atenção', MB_OK);
      Exit;
   end;
end;

procedure TfrmContAulasProvas.AtualizaAcoes(iResp: Integer; sJust: string; sFiltra: Boolean = True);
var
   iDisciplinaFrente, iDisciplina, iCdTipoAvaliacao, i: Integer;
   rSomaTotalNotas, rSomaNotas: TNota;
   arrDisciplinasFazemFrente: TStringList;
   notaMaxima, notaMinima: Double;   
begin
   if iResp in [2,3] then
   begin
      with qyAux do begin
         SQL.Clear();
         Params.Clear();
         SQL.Add(''+
         'UPDATE diario_provas_alteracoes SET                         '+
         'cd_situacao = :sit, ds_resposta = :resp, dt_deferimento = :dt_deferimento '+
         'WHERE cd_alteracao = :cd_alteracao                          ');
         ParamByName('sit').AsInteger := iResp;
         ParamByName('resp').AsString := sJust;
         ParamByName('cd_alteracao').AsInteger := qyAprovacaocd_alteracao.AsInteger;
         ParamByName('dt_deferimento').AsDateTime := DM.DataAtual();
         ExecSQL();

         if iResp = 2 then begin
            SQL.Clear();
            Params.Clear();

            if qyAprovacaonro_nota.AsString = '-1' then begin
              SQL.Add(''+
              'UPDATE diario_provas_alunos SET '+
              'vl_nota = :novanota '+
              'WHERE cd_pessoa = :codaluno AND cd_turma = :turma '+
              'AND nr_anosem = :anosem AND cd_disciplina = :disciplina AND cd_bimestre = :bim AND nr_prova = :nrprova  ');
            end
            else begin
              SQL.Add(''+
              'UPDATE diario_provas_alunos SET '+
              'vl_nota = :novanota '+
              'WHERE cd_pessoa = :codaluno AND cd_turma = :turma '+
              'AND nr_anosem = :anosem AND cd_disciplina = :disciplina AND cd_bimestre = :bim AND nr_prova = :nrprova  ');
            end;

            ParamByName('novanota').AsFloat := qyAprovacaonr_nota_nova.AsFloat;
            ParamByName('codaluno').ASInteger := qyAprovacaocodaluno.AsInteger;
            ParamByName('turma').AsString := qyAprovacaoturma.AsString;
            ParamByName('anosem').AsInteger := qyAprovacaoanosemestre.AsInteger;
            ParamByName('disciplina').AsInteger := qyAprovacaodisciplina.AsInteger;
            ParamByName('bim').ASInteger := qyAprovacaobimestre.AsInteger;
            ParamByName('nrprova').ASInteger := qyAprovacaonro_nota.AsInteger;
            ExecSQL();

            DM.CalcularMediaAutomaticamente(
               qyAprovacaoanosemestre.AsInteger,
               qyAprovacaoturma.AsString,
               qyAprovacaodisciplina.AsInteger,
               qyAprovacaobimestre.AsInteger,
               DM.getGrupoAtividade(qyAprovacaoanosemestre.AsInteger, sPCurso, qyAprovacaoturma.AsString, qyAprovacaodisciplina.AsInteger, qyAprovacaocodaluno.AsInteger),
               qyAprovacaocodaluno.AsInteger
            );

            // TRATAMENTO SE HOUVER DISCIPLINA FRENTE

            //Busca a disciplina frente da disciplina que o usuário está modificando as notas
            iDisciplinaFrente := DM.getDisciplinaFrente(qyAprovacaodisciplina.AsInteger, qyAprovacaoanosemestre.AsInteger, qyAprovacaoturma.AsString);

            // Se houver disciplinas frente
            if iDisciplinaFrente > 0 then begin

               // Busca o codigo do tipo de avaliação utilizada nessa prova que está alterando a nota
               iCdTipoAvaliacao := DM.getTipoAvaliacao(
                  qyAprovacaoanosemestre.AsInteger,
                  qyAprovacaoturma.AsString,
                  qyAprovacaodisciplina.AsInteger,
                  qyAprovacaobimestre.AsInteger,
                  qyAprovacaonro_nota.AsInteger
               );

               // Busca as disciplinas que fazem frente
               arrDisciplinasFazemFrente := DM.getDisciplinasFazemFrente(qyAprovacaoanosemestre.AsInteger, qyAprovacaoturma.AsString, iDisciplinaFrente);

               // Varre as disciplinas que fazem frente buscando as notas de mesmo tipo de prova que está sendo editado
               rSomaTotalNotas.vl_nota := 0;
               rSomaTotalNotas.IsNull := True;
               for i := 0 to arrDisciplinasFazemFrente.Count - 1 do
               begin
                  iDisciplina := StrToInt(arrDisciplinasFazemFrente.Strings[i]);

                  rSomaNotas := DM.getSomaNotasProvasMesmoTipo(
                                    qyAprovacaoanosemestre.AsInteger,
                                    qyAprovacaoturma.AsString,
                                    iDisciplina,
                                    qyAprovacaobimestre.AsInteger,
                                    iCdTipoAvaliacao,
                                    qyAprovacaocodaluno.AsInteger
                                 );

                  if not rSomaNotas.IsNull then
                  begin
                     rSomaTotalNotas.vl_nota := rSomaTotalNotas.vl_nota + rSomaNotas.vl_nota;
                     rSomaTotalNotas.IsNull := False;
                  end;
               end;

               // Verifica se a nota da disciplina pai está nos limites de mínima e máxima
               notaMaxima := StrToFloat(DM.variavel_parametro('diario_online_digita_max'));
               notaMinima := StrToFloat(DM.variavel_parametro('diario_online_digita_min'));

               if rSomaTotalNotas.vl_nota > notaMaxima then
                  rSomaTotalNotas.vl_nota := notaMaxima;

               if rSomaTotalNotas.vl_nota < notaMinima then
                  rSomaTotalNotas.vl_nota := notaMinima;

               // Retorna alguns dados da prova da disciplina frente
               DM.gerarLogAlteracaoNota(
                  qyAprovacaoanosemestre.AsInteger,
                  qyAprovacaoturma.AsString,
                  iDisciplinaFrente,
                  qyAprovacaobimestre.AsInteger,
                  iCdTipoAvaliacao,
                  qyAprovacaocodaluno.AsInteger,
                  rSomaTotalNotas
               );

               // Atribui a soma das notas das provas de mesmo tipo das disciplinas que fazem frente para a prova da disciplina frente
               DM.atribuiNotaProvaDisciplinaFrente(
                  qyAprovacaoanosemestre.AsInteger,
                  qyAprovacaoturma.AsString,
                  iDisciplinaFrente,
                  qyAprovacaobimestre.AsInteger,
                  iCdTipoAvaliacao,
                  qyAprovacaocodaluno.AsInteger,
                  rSomaTotalNotas
               );

            end;

         end;
         if sFiltra then begin
            FiltroGridAulas( '', true  );
         end;
      end;


   end;


end;


procedure TfrmContAulasProvas.tblCalcularClick(Sender: TObject);
begin
   //Provas
   if ckbPBim.Checked then begin
      if pgcAulasNotas.ActivePage = tsProvas then begin
         CheckCreateAcoes();
         frmAulasProvasAcoes.SelecionaTab('tsCalculo');
         frmAulasProvasAcoes.edNFormula.Text := '';
         frmAulasProvasAcoes.setPadrao(sPCurso, sPAnoSem, sPTurma, sPDisciplina);
         frmAulasProvasAcoes.setBim(txtPBim.Text);
         frmAulasProvasAcoes.setGrupo(sPGrupo);
         if frmAulasProvasAcoes.ShowModal() = mrOk then begin
            FiltroGridAulas( '', true  );
         end;
         FreeAndNil(frmAulasProvasAcoes);
      end;
   end
   else begin
      Mensagem('É preciso selecionar uma etapa!!', 'Atenção!', MB_OK);
   end;
end;

procedure TfrmContAulasProvas.SelecionaTudo(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  lugar : Pointer;
begin
    // Selecionar tudo
    if ((Key = ord('A')) OR (Key = ord('a'))) AND (Shift = [ssCtrl]) then
    begin

      lugar := TDBGrid(Sender).DataSource.DataSet.GetBookmark;

      TDBGrid(Sender).DataSource.DataSet.DisableControls;

      TDBGrid(Sender).DataSource.DataSet.First;

      while not TDBGrid(Sender).DataSource.DataSet.EOF do begin

         TDBGrid(Sender).SelectedRows.CurrentRowSelected := true;
         TDBGrid(Sender).DataSource.DataSet.Next;
         
      end;

      TDBGrid(Sender).DataSource.DataSet.GotoBookmark(lugar);

      TDBGrid(Sender).DataSource.DataSet.EnableControls;

    end;

end;

procedure TfrmContAulasProvas.SetCidadesFiltradas(Value: String);
var
   slCidades : TStringList;
begin
   sCidadesFiltradas := Value;

   if coligada_filtrada <> nil then
   begin
      slCidades := TStringList.Create;
      SplitString(Value, ',', slCidades);

      if ( slCidades.Count > 0 ) AND ( slCidades.IndexOf( coligada_filtrada.Cidade ) = -1 ) then
      begin
         LimparFiltroColigada();
         Exit;
      end;

      FreeAndNil(slCidades);
   end;

   // Faz isso: BLUMENAU, CURITIBA
   // Virar isso: BLUMENAU', 'CURITIBA
   sCidadesFiltradasAspas := StringReplace(Value, ',', QuotedStr(', '), [rfReplaceAll]);
   // Faz isso: BLUMENAU', 'CURITIBA
   // Virar isso: 'BLUMENAU', 'CURITIBA'; sendo assim possível utilizar em filtro IN
   if ( Trim(sCidadesFiltradasAspas) <> '' ) then
      sCidadesFiltradasAspas := '''' + sCidadesFiltradasAspas + '''';

   Value := StringReplace(Value, ',', ', ', [rfReplaceAll]);

   edCidadesAulas.Text := Value;
   edCidadesProvas.Text := Value;
   edCidadesCronogramas.Text := Value;
   edCidadesComplementosMedia.Text := Value;
   edCidadesAprovacao.Text := Value;
end;

procedure TfrmContAulasProvas.SetEstadosFiltrados(Value: String);
var
   slEstados : TStringList;
begin
   sEstadosFiltrados := Value;

   if coligada_filtrada <> nil then
   begin
      slEstados := TStringList.Create;
      SplitString(Value, ',', slEstados);

      if ( slEstados.Count > 0 ) AND ( slEstados.IndexOf( coligada_filtrada.Estado ) = -1 ) then
      begin
         LimparFiltroColigada();
         Exit;
      end;

      FreeAndNil(slEstados);
   end;

   // Faz isso: SC, PR
   // Virar isso: SC', 'PR
   sEstadosFiltradosAspas := StringReplace(Value, ',', QuotedStr(', '), [rfReplaceAll]);
   // Faz isso: SC', 'PR
   // Virar isso: 'SC', 'PR'; sendo assim possível utilizar em filtro IN
   if ( Trim(sEstadosFiltradosAspas) <> '' ) then
      sEstadosFiltradosAspas := '''' + sEstadosFiltradosAspas + '''';

   Value := StringReplace(Value, ',', ', ', [rfReplaceAll]);

   edEstadosAulas.Text := Value;
   edEstadosProvas.Text := Value;
   edEstadosCronogramas.Text := Value;
   edEstadosComplementosMedia.Text := Value;
   edEstadosAprovacao.Text := Value;
end;

procedure TfrmContAulasProvas.SpeedButton10Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Professor}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if resultado_filtro.filtrado then
   Begin
      edCodigoProfessor.Text := IntToStr( resultado_filtro.cd_pessoa );
      edNomeProfessor.Text := resultado_filtro.nm_pessoa;
   End;
end;

procedure TfrmContAulasProvas.spProfClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Professor}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

   if resultado_filtro.filtrado then
   Begin
      txtProfessorAula.Text  := IntToStr( resultado_filtro.cd_pessoa );
      edProfessorAula.Text   := resultado_filtro.nm_pessoa;
      txtProfessorProva.Text := IntToStr( resultado_filtro.cd_pessoa );
      edProfessorProva.Text  := resultado_filtro.nm_pessoa;
      txtAProfessor.Text     := IntToStr( resultado_filtro.cd_pessoa );
      edAProfessor.Text      := resultado_filtro.nm_pessoa;
   End;
   FiltroGridAulas( '', true  );
end;

procedure TfrmContAulasProvas.btnCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
      sCCurso := resultado_filtro.cd_curso;
      sCAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
      txtCronogramasCursoDescricao.Text := resultado_filtro.ds_curso;
      CarregaItemBusca();
      FiltroGridAulas( '', true  )
   end;
end;

procedure TfrmContAulasProvas.btnturmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
   { Pesquisar Turmas }
   if (Length(sCCurso) = 0) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma turma, por causa do Ano/Semestre', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftAnosemestre], StrToInt(sCAnoSem), -1, -1, sCCurso);

   if not resultado_filtro.filtrado then Exit;

   sCTurma := resultado_filtro.cd_turma;
   CarregaItemBusca();
   FiltroGridAulas( '', true  );
end;

procedure TfrmContAulasProvas.statusSerie(bStatus: Boolean);
begin

    ckbSerie.Visible:= bStatus;
    txtSerie.Visible:= bStatus;
    udSerie.Visible := bStatus;

    if bStatus then begin
      qyAux.Close();
      qyAux.SQL.Clear();
      qyAux.SQL.Text := 'SELECT                    '+
                        ' 	nome_etapa              '+
                        'FROM                      '+
                        '   cursos c               '+
                        'WHERE                     '+
                        '   c.codigo= :curso       '+
                        'AND c.anosemestre= :anosem';                      

      qyAux.ParamByName('curso').AsString:= txtCurso.Text;
      qyAux.ParamByName('anosem').AsString:= sAnoSem;
      qyAux.Open();

      if not (qyAux.FieldByName('nome_etapa').IsNull and (trim(qyAux.FieldByName('nome_etapa').AsString) = '')) then begin
         ckbSerie.Caption:= qyAux.FieldByName('nome_etapa').AsString+';';
      end
      else
         ckbSerie.Caption:= 'Etapa da Turma (Série, Ano, Fase...):';
    end;

    ckbPSerie.Visible:= bStatus;
    txtPSerie.Visible:= bStatus;
    udPSerie.Visible := bStatus;

    if bStatus then begin
      qyAux.Close();
      qyAux.SQL.Clear();
      qyAux.SQL.Text := 'SELECT                    '+
                        ' 	nome_etapa             '+
                        'FROM                      '+
                        '   cursos c            '+
                        'WHERE                     '+
                        '   c.codigo= :curso       '+
                        'AND c.anosemestre= :anosem';                      

      qyAux.ParamByName('curso').AsString:= txtPCurso.Text;
      qyAux.ParamByName('anosem').AsString:= sPAnoSem;
      qyAux.Open();

      if not (qyAux.FieldByName('nome_etapa').IsNull and (trim(qyAux.FieldByName('nome_etapa').AsString) = '')) then begin
         ckbPSerie.Caption:= qyAux.FieldByName('nome_etapa').AsString+';';
      end else
         ckbPSerie.Caption:= 'Etapa da Turma (Série, Ano, Fase...):';
    end;
end;

procedure TfrmContAulasProvas.tblRecalculoClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1036, npAcesso, True ) then Exit;

   if (Length(txtCurso.Text) = 0) then begin
      Mensagem('Um Curso precisa ser selecionado!');
      Exit;
   end;
   if not (cbBim.Checked) then begin
      Mensagem('Uma Etapa precisa ser selecionado!');
      Exit;
   end;
   CheckCreateAcoes();
   frmAulasProvasAcoes.SelecionaTab('tsFrequencia');
   frmAulasProvasAcoes.setPadrao(sPCurso, sPAnoSem, sPTurma, sPDisciplina);
   frmAulasProvasAcoes.setBim(txtBim.Text);
   frmAulasProvasAcoes.setGrupo(sPGrupo);
   if (cbData.Checked) then begin
      frmAulasProvasAcoes.setData(dtFiltroData.Date);
   end
   else begin
      frmAulasProvasAcoes.setData(0);
   end;
   if frmAulasProvasAcoes.ShowModal() = mrOk then begin
      FiltroGridAulas( '', true  );
   end;
   FreeAndNil(frmAulasProvasAcoes);
end;

procedure TfrmContAulasProvas.ToolButton5Click(Sender: TObject);
begin
   FullDBGridToClipBoard(dbgAulas, True, [1, 1, 1, 1, 1, 1,1,1]);
   Mensagem('Informações copiadas.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
end;

procedure TfrmContAulasProvas.FormShow(Sender: TObject);
begin
   parametro_aulas_provas_filtro_cidade := StrToBoolDef(DM.variavel_parametro( 'aulas_provas_filtro_cidade' ), False);

   // Limpa os filtros de Estados e Cidades
   EstadosFiltrados := '';
   CidadesFiltradas := '';

   // Verifica através de parâmetro se precisa mostrar ou não o panel de Estado/Cidade
   pnFiltroEstadoCidadeAulas.Visible := parametro_aulas_provas_filtro_cidade;
   pnFiltroEstadoCidadeProvas.Visible := parametro_aulas_provas_filtro_cidade;
   pnFiltroEstadoCidadeCronogramas.Visible := parametro_aulas_provas_filtro_cidade;
   pnFiltroEstadoCidadeComplementosMedia.Visible := parametro_aulas_provas_filtro_cidade;
   pnFiltroEstadoCidadeAprovacao.Visible := parametro_aulas_provas_filtro_cidade;

   { Habilita/Desabilita as abas, conforme permissão }
   //Permissões referentes a aulas.
   pgcAulasNotas.Pages[tsAulas.PageIndex].TabVisible := DM.UsuarioLogado.TemPermissao( 1027, npAcesso, False );
   btIncluirAula.Enabled := DM.UsuarioLogado.TemPermissao( 1027, npIncluir, False );
   btAlterarAula.Enabled := DM.UsuarioLogado.TemPermissao( 1027, npAlterar, False );
   btExcluirAula.Enabled := DM.UsuarioLogado.TemPermissao( 1027, npExcluir, False );

   //Permissões referentes a provas.
   pgcAulasNotas.Pages[tsProvas.PageIndex].TabVisible := pgcAulasNotas.Pages[tsAulas.PageIndex].TabVisible;
   btIncluirProva.Enabled := DM.UsuarioLogado.TemPermissao( 1027, npIncluir, False );
   btAlterarProva.Enabled := DM.UsuarioLogado.TemPermissao( 1027, npAlterar, False );
   btExcluirProva.Enabled := DM.UsuarioLogado.TemPermissao( 1027, npExcluir, False );
   
   // Permissão Diário de Cronogramas
   pgcAulasNotas.Pages[tsCronogramas.PageIndex].TabVisible := DM.UsuarioLogado.TemPermissao( 1070, npAcesso, False );
   btIncluirCro.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npIncluir, False );
   btAlterarCro.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npAlterar, False );
   btExcluirCro.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npExcluir, False );

   txtPg.Caption := 'Pág. 1';
   txtPg.Tag := 1;
   sbPgAnterior.Enabled := false;

   if not DM.UsaAnosemestre then
   begin
      sAnoSem := IntToStr(ANOSEMESTRE_PADRAO);
   end else begin
      sAnoSem := IntToStr(ano_semestre);
   end;

   sCronogramaAnoSem := sAnoSem;
   sPAnoSem := sAnoSem;   

   qyGrupoAtividade.Close;
   qyGrupoAtividade.Open;
      
   if (qyGrupoAtividade.FieldByName('qtd').AsInteger > 0) then
   begin
      edCodGrupoAulas.Enabled := True;
      edCodGrupoAulas.Color := clWindow;
      edNomeGrupoAulas.Enabled := True;
      sbBuscaGrupoAulas.Enabled := True;

      edCodGrupoProvas.Enabled := True;
      edCodGrupoProvas.Color := clWindow;
      edNomeGrupoProvas.Enabled := True;
      sbBuscaGrupoProvas.Enabled := True;

      edCodGrupoCronogramas.Enabled := True;
      edCodGrupoCronogramas.Color := clWindow;
      edNomeGrupoCronogramas.Enabled := True;
      sbBuscaGrupoCronogramas.Enabled := True;
   end else begin
      edCodGrupoAulas.Enabled := False;
      edCodGrupoAulas.Color := clMenuBar;
      edNomeGrupoAulas.Enabled := False;
      sbBuscaGrupoAulas.Enabled := False;

      edCodGrupoProvas.Enabled := False;
      edCodGrupoProvas.Color := clMenuBar;
      edNomeGrupoProvas.Enabled := False;
      sbBuscaGrupoProvas.Enabled := False;

      edCodGrupoCronogramas.Enabled := False;
      edCodGrupoCronogramas.Color := clMenuBar;
      edNomeGrupoCronogramas.Enabled := False;
      sbBuscaGrupoCronogramas.Enabled := False;
   end;

   udBim.Enabled := cbBim.Checked;
   udPBim.Enabled := ckbPBim.Checked;
   udABim.Enabled := ckbABim.Checked;
   txtBim.Text := IntToStr(DM.getEtapaAtual(1));
   udBim.Position := DM.getEtapaAtual(1);
   txtPBim.Text := IntToStr(DM.getEtapaAtual(1));
   udPBim.Position := DM.getEtapaAtual(1);
   txtABim.Text := IntToStr(DM.getEtapaAtual(1));
   udABim.Position := DM.getEtapaAtual(1);
   dtFiltroData.Date := Now();
   dtpPDataInicio.Date := Now();
   statusSerie(false);

   if (DM.variavel_parametro('local.aulas.informacoes_logisticas') = 'S') then
   begin
      DM.MontarPlanilha(dbgAulas, 'planilha_cad_aulas');
      CarregarComboAulasSituacoes();
      pnSituacaoLogistica.Visible := True;
      Panel1.Height := 276;
   end else begin
      DM.MontarPlanilha(dbgAulas, 'planilha_cad_aulas');
      pnSituacaoLogistica.Visible := False;
      Panel1.Height := 140;
   end;

   DM.MontarPlanilha(dbgProvas, 'planilha_cad_provas');
   DM.MontarPlanilha(dbgAprovacao, 'planilha_cad_aprovacao');
   DM.MontarPlanilha(dbgComplemento, 'planilha_cad_complemento');
   DM.MontarPlanilha(dbgCronogramas, 'planilha_cad_cronogramas');

   dtpDtInicio.Date := Now;
   dtpDtFim.Date := Now;
   dtpPdata.Date := now;
   dtpPDataInicio.Date  := Now;
   dtpADtInicio.Date   := Now;
   dtpADtFim.Date      := Now;
    
   FiltrarTurmas();
   
   if DM.lite then
     tsCronogramas.TabVisible := false;

end;

procedure TfrmContAulasProvas.GetDisciplina;
Var
   qBusca: TUMZQuery;
begin
   // Buscar o nome do professor e atualizar as variáveis, após ter digitado no edit

   if trim(edCodDiscCrono.Text) = '' then begin
      txtDiscCronograma.Clear();
   end else begin

     Dm.CriarConsulta(qBusca);
     qBusca.Close();
     qBusca.SQL.Text :=
       ' SELECT codigo, descricao from disciplinas ' +
       '  WHERE codigo = :codigo ';
     qBusca.ParamByName('codigo').AsString := TRIM(edCodDiscCrono.Text);

     if Trim(txtCronogramasCurso.Text) <> '' then begin
        qBusca.SQL.Add(' AND curso = :curso ');
        qBusca.ParamByName('curso').AsString := Trim(txtCronogramasCurso.Text)
     end;
     qBusca.Open();

     if not qBusca.Eof then begin
       txtDiscCronograma.Text := qBusca.FieldByName('descricao').AsString;
       sCronogramaDisciplina := qBusca.FieldByName('codigo').AsString;
       sPDisciplina := qBusca.FieldByName('codigo').AsString;
       dtpDtInicio.SetFocus();
     end else begin
        txtDiscCronograma.Clear();
        Mensagem('Código da disciplina não encontrada.', 'UNIMESTRE', MB_OK + MB_ICONWARNING, Handle);
        edCodDiscCrono.SetFocus();
     end;
   end;  
end;

procedure TfrmContAulasProvas.GetProfessor;
Var
   qBusca: TUMZQuery;
begin
   // Buscar o nome do professor e atualizar as variáveis, após ter digitado no edit

   if trim(edCodigoProfessor.Text) = '' then begin
      edNomeProfessor.Clear();
   end else begin

     Dm.CriarConsulta(qBusca);
     qBusca.Close();
     qBusca.SQL.Text :=
       ' SELECT cd_pessoa, nm_pessoa from pessoas ' +
       '  WHERE cd_pessoa = :cd_pessoa ';
     qBusca.ParamByName('cd_pessoa').AsString := edCodigoProfessor.Text;

     qBusca.Open();

     if not qBusca.Eof then begin
       edNomeProfessor.Text := qBusca.FieldByName('nm_pessoa').AsString;
       edCodDiscCrono.SetFocus();
     end else begin
        edNomeProfessor.Clear();
        Mensagem('Código do professor não encontrado.', 'UNIMESTRE', MB_OK + MB_ICONWARNING, Handle);
        edCodigoProfessor.SetFocus();
     end;
   end;  
end;

function TfrmContAulasProvas.GetTodasColigadasFiltrada(var combo: TUMComboBox): String;
var
   Separador: String;
   I: Integer;
begin
   Result := '';
   Separador := '';

   for I := 1 to combo.Items.Count - 1 do
   begin
      Result := Result + Separador + TItemCombo( combo.Items.Objects[ I ] ).getCodigo();
      Separador := ',';
   end;         
end;

procedure TfrmContAulasProvas.LimparFiltroColigada;
begin
   coligada_filtrada := nil;
   edUnidadeEnsino.Text := '';
end;

function TfrmContAulasProvas.getSomaNotasProvasMesmoTipoTodosAlunos(iAnosemestre: Integer; sTurma: string; iDisciplina: Integer; iBimestre: Integer; iCdAvaliacaoTipo: Integer): TNota;
begin

end;

end.
