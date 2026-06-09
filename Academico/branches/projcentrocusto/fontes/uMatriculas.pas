unit uMatriculas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, DBCtrls, Buttons, ExtCtrls, StdCtrls, Mask, Grids, DBGrids,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, ComCtrls,
  Menus, ImgList, ToolWin, Variants, Jpeg, ZDbcIntfs, UZDbcFuncs, ClassRegistros,
  uFSelecionarTurma, uFSelecionarDisciplina, Math;

type
  TFiltroPadro = (FiltroAluno, FiltroTurma, FiltroMatriculas, FiltroData);

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
    grd: TDBGrid;
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
    TransfernciaInterna1: TMenuItem;
    TransferenciaExterna1: TMenuItem;
    popSituacaoDisciplina: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Panel6: TPanel;
    grdDoc: TDBGrid;
    Panel7: TPanel;
    Bevel3: TBevel;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
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
    qryUpdateNotas: TUMZQuery;
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
    qryTransfereFreqs: TUMZQuery;
    qryTransfereNotas: TUMZQuery;
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
    tblFichaIndividualnm_grupo: TStringField;
    qyGruposAtividadesAluno: TUMZQuery;
    qyInativarAluno: TUMZQuery;
    qyPossuiGruposAtividades: TUMZQuery;
    tblFichaIndividualcd_grupo: TIntegerField;
    tblMatriculasnm_pessoa_matriculou: TStringField;
    tblMatriculascd_turma_anterior: TStringField;
    qryInsertMatricula: TUMZQuery;
    tblMatriculasSituacao: TSmallintField;
    tblMatriculasCD_SITUACAO_ALTERADO: TStringField;
    tblDoccd_siga: TIntegerField;
    tblFichaIndividualnm_disciplina_generica: TStringField;
    qyInserirDiscGenerica: TUMZQuery;
    discGenerica: TMenuItem;
    tblFichaIndividualcd_disciplina_generica: TIntegerField;
    qyTrocarDiscGenerica: TUMZQuery;
    tblFichaIndividualnr_serie_generica: TSmallintField;
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
    procedure TransferenciaInterna;
    procedure TrocaDeTurma;
    procedure FormCreate(Sender: TObject);
    procedure Filtrar;
    procedure AtivarMatricula;
    procedure btnMotivosClick(Sender: TObject);
    procedure btnReprovarClick(Sender: TObject);
    procedure btnDiplomaClick(Sender: TObject);
    procedure tblMatriculasCalcFields(DataSet: TDataSet);
    procedure grdTitleClick(Column: TColumn);
    procedure btnObsClick(Sender: TObject);
    procedure dtcMatriculasDataChange(Sender: TObject; Field: TField);
    procedure tblFichaIndividualCalcFields(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure btnMatricularDiscClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
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
    procedure TransfernciaInterna1Click(Sender: TObject);
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
   resultado_filtro_turma : TResultadoFiltroTurma;
  private
    { Private declarations }
      FBloqueiaCreditosAlunosFIES: Boolean;
    intSalvar : Integer;
    sOrdem : String;
    sGuardaFiltro: string;
    sFiltroCurso, sFiltroTurma, sFiltroAnosemestre: String;
    numerarCurso,bAdicionouCampo : boolean;
    function DoAddFields(All: Boolean): TField;
    function DoCreateField(const FieldName: WideString; Origin: string): TField;
    procedure ConfirmarMatricula;
    procedure ConfirmarMatriculaAulas(strTurma : String; intAnoSemestre : Integer; lngCodigoAluno: Longint  );
    procedure ConfirmarDisciplina;
    procedure RenumerarAlunos(iTipo : word; anosemestre : Integer; curso, turma : String);
    procedure TrocarCursoVestibular ( anosemestre : Integer; codigoAluno : Integer; CursoAtual : String; CursoNovo : String);
    Function TemMensalidadeComCredito( codigoaluno : Integer; turma : String; anosemestre : Integer ) : Boolean;
    function RegistraMotivo(const AICodSituacao: integer): boolean;
    Procedure registraDocumentoTabelaSiga( codDoc : String; aluno : String );
  public
    TipoFiltro : TFiltroPadro;
    lngCodigoAluno : Longint;
    procedure setApresentou(sT: string);
    { Public declarations }
  end;

var
  frmMatriculas: TfrmMatriculas;

implementation

uses
   uDM, Main, uDataSaida, uMotivos, uFinanceiro, uDig,
   uMatriculaDisc, uSelDisciplinaGenerica, uMatricularGrade, uManutMens, uObsDocumento, uAluno,
   uFSelecionarPessoa, uMatriculas_Alterar, uExportarDoc, uAddDocumento,
   uClassMovimento, uCamposPlanilhas, uMatricularCurso, uDigDocumentos,
   uProcessando, uBuscaDisciplina, uFTransferencia, uFRegistraMotivoMatricula,
   uFMatriculaMotivos, uHorariosPessoa, UFObservacoes, uContAulasProvas,
  uTransferir, uNovaMens, uMensalidades, uAlunoAfrica, uCursos,
  ClassDisciplinas, ClassPlanosPagamento, UFMatriculasFiltroData, uUsuario,
  uIUMDataModule,uFTrocaDeTurma;

{$R *.DFM}

procedure TfrmMatriculas.btnSairClick(Sender: TObject);
begin
  Close;
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

   DM.BloquearComponenteAnosemestre(grd, 'AnoSemestre');
   DM.BloquearComponenteAnosemestre(grdDisci, 'AnoSemestre');
   DM.BloquearComponenteAnosemestre(grdDoc, 'AnoSemestre');

  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  Screen.Cursor := crHourGlass;

  TipoFiltro := FiltroMatriculas;

  Filtrar();

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
      DM.qAux1.SQL.Add( '     INNER JOIN fin_mov_cr fmc ON ( fmc.cd_mensalidade = m.cd_mensalidade )' );
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


procedure TfrmMatriculas.TransferenciaInterna;
const
   SSQLUpdDiscOutraTurma =
      'UPDATE FICHAINDIVIDUAL ' +
      'SET TURMAMATRICULA = ? ' +
      'WHERE ' +
         'TURMA != TURMAMATRICULA AND ' +
         'ANOSEMESTRE = ? AND ' +
         'TURMAMATRICULA = ? AND ' +
         'CODIGOALUNO = ?';
         
   LOG_TRANSFERENCIA_INTERNA =
      '[Transferência INTERNA]' + #13 + #13 +
      #9 + 'Informações da Matrícula Anterior:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Informações da Matrícula Nova:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Disciplinas Matriculadas:' + #13 +
      #9 + #9 + '%s';

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

var
   strNova, Observacao, chaves : String;
   strNovoAnoSeme : Integer;
   vl_credito_from_plano : Double;
   iNum: LongInt;
   iSituacao : Integer;
   qyAux: TUMZQuery;
   iReclassificacao : Integer;
   Statement: IZPreparedStatement;
   sCodigosTitulosJaCancelados : String;
   qyDisciplinasMatriculadas: TUMZReadOnlyQuery;
   qyAlteraMonografia: TUMZQuery;
   QryPlanoPagamento: TUMZQuery;
   cdPlanoPgtAntigo,quantPlanoPgtNovo: Integer;
   nrParcelasPlanoPgtAntigo: Integer;
   planoPgtPadraoPorCre: Integer;
   planoValido: Boolean;
   situacao_anterior_fi, situacao_anterior_mat: Integer;
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

   resultado_filtro_turma := TfrmSelecionarTurma.Filtrar([bftMostraReclassificacao,bftAnosemestre,bftCurso], tblMatriculasAnoSemestre.AsInteger, -1, -1, tblMatriculasCurso.AsString);

  { Apresentar as turmas para seleção }
   if not resultado_filtro_turma.filtrado then Exit;

   strNova := resultado_filtro_turma.cd_turma;
   strNovoAnoSeme := resultado_filtro_turma.nr_anosemestre;

  { verificar se foi selecionada uma turma diferente }
  if (strNova = tblMatriculasTurma.AsString) AND
     (strNovoAnoSeme = tblMatriculasAnoSemestre.AsInteger)
  then Begin
     Mensagem('O aluno já está matriculado na turma selecionada. A troca de turma foi cancelada.', 'Atenção', MB_OK + MB_ICONWARNING);

     Exit;
  End;

  { Verificar se é no mesmo anosemestre }
  if (tblMatriculasAnoSemestre.AsInteger <> strNovoAnoSeme) then
  begin
     if Mensagem('Você está tentando alterar a turma em diferentes Ano/Semestre. É aconselhável re-matricular o aluno na nova turma. Deseja continuar com a transferência mesmo assim?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then
        Exit;
  end;
  
  situacao_anterior_mat := tblMatriculasSituacao.AsInteger;

  { Verifica se o plano de pagamento do aluno é por crédito, se for checa se existe }
  { um plano que possa ser utulizado na turma de destino sem causar erros no financeiro }
  planoPgtPadraoPorCre := 0;
  
  DM.CriarConsulta(QryPlanoPagamento);

  { Qual o tipo de plano do aluno }
  With QryPlanoPagamento do
  begin
     SQL.Add('SELECT cd_tipo_plano, parcelas FROM planospagamento ');
     SQL.Add('WHERE codigo = ( SELECT planopagamento from matriculas where codigoaluno = :aluno AND anosemestre = :anosemestre AND turma = :turma )');
     SQL.Add('AND anosemestre = :anosemestre  AND turma = :turma');
     ParamByName('anosemestre').AsString := tblMatriculasAnoSemestre.AsString;
     ParamByName('turma').AsString := tblMatriculasTurma.AsString;
     ParamByName('aluno').AsString := tblMatriculasCODIGOALUNO.AsString;
     Open;
  end;

  cdPlanoPgtAntigo := QryPlanoPagamento.FieldByName('cd_tipo_plano').AsInteger;
  nrParcelasPlanoPgtAntigo := QryPlanoPagamento.FieldByName('parcelas').AsInteger;

  if (cdPlanoPgtAntigo = 2) then
  begin
  
     { Checa quantos planos na turma destino tem o mesmo numero de parcelas que o aluno tinha na turma de origem }
     With QryPlanoPagamento do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT codigo FROM planospagamento WHERE anosemestre = :anosemestre AND turma = :turma AND parcelas = :parcelas ');
        ParamByName('anosemestre').AsInteger := strNovoAnoSeme;
        ParamByName('turma').AsString := strNova;
        ParamByName('parcelas').AsInteger := nrParcelasPlanoPgtAntigo;
        Open;
     end;

     quantPlanoPgtNovo := QryPlanoPagamento.RecordCount;
     
     if quantPlanoPgtNovo = 0 then
     begin
         Mensagem('Não será possível efetuar a transferência interna pois a turma destino não possui um plano de pagamento com o mesmo número de parcelas do plano de pagamento da turma de origem. ', 'Atenção', MB_OK + MB_ICONWARNING);
         Exit;
     end
     else if quantPlanoPgtNovo > 1 then
     begin

         planoValido := False;

         while not (QryPlanoPagamento.Eof) do
         begin
            if tblMatriculasPlanoPagamento.AsInteger = QryPlanoPagamento.FieldByName('codigo').AsInteger then
            begin
               planoValido := True;
            end;

            QryPlanoPagamento.Next;
         end;

         if not(planoValido) then
         begin
            { Caso tenha mais de 1 verifica se a turma possui um padrão, se não possuir a transferência é interferida, caso possua guarda o plano para utilizar na hora de alterar a mensalidade do aluno }
            with QryPlanoPagamento do
            begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT codigo, parcelas FROM planospagamento ');
              SQL.Add('WHERE codigo = (select cd_plano_padrao from turmas where codigo = :turma and anosemestre = :anosemestre) ');
              SQL.Add('AND turma = :turma AND anosemestre = :anosemestre');
              ParamByName('anosemestre').AsInteger := strNovoAnoSeme;
              ParamByName('turma').AsString := strNova;
              Open;
            end;

            if QryPlanoPagamento.RecordCount = 0 then
            begin
               Mensagem('Não sera possível realizar a transferência interna, para efetua-la será necessario definir um plano de pagamento padrão na turma de destino do aluno. ', 'Atenção', MB_OK + MB_ICONWARNING);
               Exit;
            end
            else
            begin
               if QryPlanoPagamento.FieldByName('parcelas').AsInteger = nrParcelasPlanoPgtAntigo  then
                  planoPgtPadraoPorCre :=  QryPlanoPagamento.FieldByName('codigo').AsInteger
               else
               begin
                  Mensagem('Não sera possível realizar a transferência interna, pois o plano padrão da turma de destino possui o numero de parcelas diferente do da turma atual do aluno. ', 'Atenção', MB_OK + MB_ICONWARNING);
                  Exit;
               end;
            end;
         end;
     end;
  end;

  { Verificar se é uma troca de turma ou transferencia interna }

  qryNova.Close;
  qryNova.SQL.Clear;
  qryNova.SQL.Add( 'select t.Codigo, t.Curso, t.Serie, t.Turno, c.depto , t.cd_grade, t.cd_coligada from Turmas t, Cursos c' );
  qryNova.SQL.Add( 'where t.curso = c.codigo and t.anosemestre = c.anosemestre ');
  qryNova.SQL.Add( ' and t.Codigo = :Turma and t.AnoSemestre = :AnoSemestre ');

  qryNova.ParamByName('AnoSemestre').AsInteger := strNovoAnoSeme;
  qryNova.ParamByName('Turma').AsString := strNova;
  qryNova.Open;

  qryAtual.Close;
  qryAtual.SQL.Clear;
  qryAtual.SQL.Add( 'select Codigo, Curso, Serie, Turno  from Turmas where Codigo = :Turma and AnoSemestre = :AnoSemestre' );

  qryAtual.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
  qryAtual.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
  qryAtual.Open;

  iSituacao := tblMatriculasSituacao.AsInteger;

  Screen.Cursor := crHourGlass;

  try
	    // Verificar como fica a mensalidade na transferencia interna

	    { Alteração na Tabela de Matriculas }
	    qryAlterarTurma.SQL.Clear;
       // caso a check reclassificação esteja habilitada a situação fica com recalssificação
       if resultado_filtro_turma.sn_reclassificacao then
         iReclassificacao := 15
       else
         iReclassificacao := 8;

	    qryAlterarTurma.SQL.Add('update Matriculas set Situacao = '+intToStr(iReclassificacao)+', DataSaida = :data, usuario = "'+DM.sLogin+'"'); // Transferencia Interna
	    qryAlterarTurma.SQL.Add('where CodigoAluno = :CodigoAluno and Turma = :Turma and AnoSemestre = :AnoSemestre');

	    qryAlterarTurma.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
	    qryAlterarTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
	    qryAlterarTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
	    qryAlterarTurma.ParamByName('Data').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);
	    qryAlterarTurma.ExecSQL;

      sCodigosTitulosJaCancelados := ClassePlanosPagamento.getDistratoTitulosCancelados(
            tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString,
            tblMatriculasTurma.AsString, tblMatriculasCODIGOALUNO.AsInteger);

       if ClassePlanosPagamento.hasDistratoContratual(
            tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString,
            tblMatriculasTurma.AsString, tblMatriculasCodigoAluno.AsInteger, iReclassificacao ) then
      begin
         ClassePlanosPagamento.GeraMensalidadeDistratoContratual(
                                 tblMatriculasAnoSemestre.AsInteger, tblMatriculasCurso.AsString,
                                 tblMatriculasTurma.AsString, tblMatriculasCodigoAluno.AsInteger, sCodigosTitulosJaCancelados );
      end;

      if planoPgtPadraoPorCre = 0 then
         vl_credito_from_plano := ClassePlanosPagamento.getPlanoFromTurma( strNovoAnoSeme,
                                                                        qryNova.fieldByName('cd_coligada').AsInteger,
                                                                        tblMatriculasPlanoPagamento.AsInteger,
                                                                        qryNova.fieldByName('curso').AsString,
                                                                        strNova )
      else
         vl_credito_from_plano := ClassePlanosPagamento.getPlanoFromTurma( strNovoAnoSeme,
                                                                        qryNova.fieldByName('cd_coligada').AsInteger,
                                                                        planoPgtPadraoPorCre,
                                                                        qryNova.fieldByName('curso').AsString,
                                                                        strNova );

      // Houve algum problema no cálculo do valor de credito (não deve ser zero)
      if vl_credito_from_plano = 0 then
      begin
         { A mensagem informa que não foi possível cálcular o valor dos créditos
           e que nesse caso sera mantido o valor que o aluno já possui, esse processo está sendo realizado
           no UPDATE da tabela de mensalidades através de um CASE (verificando se o valor é maior que zero) }
         Mensagem('Não foi possível determinar o novo valor dos créditos financeiros, nesse caso a transferência interna sera realizada, no entanto, o valor dos créditos financeiros do aluno não foi alterado mantendo os valores que o aluno já possuia.', 'Atenção', MB_OK + MB_ICONWARNING);
      end;

	   { Alteração na Tabela de Mensalidades }
      qryAlterarTurma.SQL.Clear;
	   qryAlterarTurma.SQL.Add('update Mensalidades set Turma = :NovaTurma, AnoSemestre = :NovoAnoSem, Curso = :NovoCurso, Depto = :NovoDepto, cd_coligada = :NovaColigada ');
      qryAlterarTurma.SQL.Add(', vl_credito = CASE WHEN :vl_credito > 0 THEN ( :vl_credito * ( VL_PERCENTUAL_DIVISAO / 100 ) ) ELSE vl_credito END ');
      qryAlterarTurma.SQL.Add('where CodigoAluno = :CodigoAluno and Turma = :Turma and AnoSemestre = :AnoSemestre');

      qryAlterarTurma.ParamByName('vl_credito').AsFloat := vl_credito_from_plano;
      qryAlterarTurma.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      qryAlterarTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
      qryAlterarTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      qryAlterarTurma.ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
      qryAlterarTurma.ParamByName('NovoDepto').AsInteger := qryNova.fieldByName('depto').AsInteger;
      qryAlterarTurma.ParamByName('NovaTurma').AsString := strNova;
      qryAlterarTurma.ParamByName('NovoAnoSem').AsInteger := strNovoAnoSeme;
      qryAlterarTurma.ParamByName('NovaColigada').AsInteger := qryNova.fieldByName('cd_coligada').AsInteger;
	   qryAlterarTurma.ExecSQL;


      { Alteração na Tabela de FichaIndividual }

      qryAlterarTurma.SQL.Clear;
      qryAlterarTurma.SQL.Add('SELECT Situacao FROM FichaIndividual WHERE');
      qryAlterarTurma.SQL.Add('CodigoAluno = :CodigoAluno and Turma = :Turma and AnoSemestre = :AnoSemestre');

      qryAlterarTurma.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      qryAlterarTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
      qryAlterarTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      qryAlterarTurma.Open;

      situacao_anterior_fi := qryAlterarTurma.FieldByName('situacao').AsInteger;


      qryAlterarTurma.SQL.Clear;
      qryAlterarTurma.SQL.Add('update FichaIndividual set Situacao = '+intToStr(iReclassificacao)+' '); // Transferencia Interna
      qryAlterarTurma.SQL.Add('where CodigoAluno = :CodigoAluno and Turma = :Turma and AnoSemestre = :AnoSemestre');

      qryAlterarTurma.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      qryAlterarTurma.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
      qryAlterarTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
      qryAlterarTurma.ExecSQL;

      {Verifica se o aluno possui alguma monografia cadastrada e
      altera a tabela de monografias caso o aluno possua algum registro}
      qryAlterarTurma.SQL.Clear;
      qryAlterarTurma.SQL.Add(' SELECT count(cd_pessoa) as qtd FROM monografias ');
      qryAlterarTurma.SQL.Add(' where cd_pessoa = :CodigoAluno ');

      qryAlterarTurma.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      qryAlterarTurma.Open;

      if (qryAlterarTurma.FieldByName('qtd').AsInteger > 0) then
      begin
         DM.CriarConsulta(qyAlteraMonografia);

         while not(qryAlterarTurma.eof) do
         begin
            qyAlteraMonografia.SQL.Text :=
               'UPDATE monografias set cd_turma = :NovaTurma,  ' +
               '   cd_curso = :NovoCurso,                      ' +
               '   nr_anosemestre = :NovoAnoSem                ' +
               'WHERE cd_pessoa = :CodigoAluno                 ' +
               '   AND cd_turma = :Turma                       ' +
               '   AND nr_anosemestre = :AnoSem                ';

            qyAlteraMonografia.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
            qyAlteraMonografia.ParamByName('Turma').AsString := tblMatriculasTurma.AsString;
            qyAlteraMonografia.ParamByName('AnoSem').AsInteger := tblMatriculasAnoSemestre.AsInteger;
            qyAlteraMonografia.ParamByName('NovoCurso').AsString := qryNova.fieldByName('curso').AsString;
            qyAlteraMonografia.ParamByName('NovaTurma').AsString := strNova;
            qyAlteraMonografia.ParamByName('NovoAnoSem').AsInteger := strNovoAnoSeme;

            qyAlteraMonografia.ExecSQL;

            qryAlterarTurma.Next;
         end;
      end;
      {FIM - Altera tabela de monografia do aluno}

      { Criar nova Matrícula para o aluno }
      iNum := 0;
      // Pegar o Número do Aluno na turma
      if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') = 'S') then begin
         iNum := DM.DefineNumeroMatricula(strNova, tblMatriculasAnoSemestre.AsInteger)
      end;

      qryInsertMatricula.ParamByName('CODIGOALUNO').AsInteger := tblMatriculasCodigoAluno.AsInteger;
      qryInsertMatricula.ParamByName('TURMA').AsString := strNova;
      qryInsertMatricula.ParamByName('ANOSEMESTRE').AsInteger := strNovoAnoSeme;
      qryInsertMatricula.ParamByName('CURSO').AsString := qryNova.FieldByName('Curso').AsString;
      qryInsertMatricula.ParamByName('DATAEMISSAO').AsDate := DataHoje;
      qryInsertMatricula.ParamByName('USUARIO').AsString := DM.sLogin;

      { Caso nas verificações do plano de pagamento for verificado que a turma de destino possui mais de 1 plano e tinha um padrao, passa a utilizar este para o aluno }
      if planoPgtPadraoPorCre <> 0 then
         qryInsertMatricula.ParamByName('PLANOPAGAMENTO').AsInteger := planoPgtPadraoPorCre
      else
         qryInsertMatricula.ParamByName('PLANOPAGAMENTO').AsInteger := tblMatriculasPlanoPagamento.AsInteger;

      qryInsertMatricula.ParamByName('SITUACAO').AsInteger := situacao_anterior_mat;
      qryInsertMatricula.ParamByName('PLANODESCONTO').AsInteger := tblMatriculasPlanoDesconto.AsInteger;
      qryInsertMatricula.ParamByName('CD_INGRESSO').AsInteger := tblMatriculascd_ingresso.AsInteger;
      qryInsertMatricula.ParamByName('CD_INSTITUICAO_ORIGEM').AsInteger := tblMatriculascd_instituicao_origem.AsInteger;
      qryInsertMatricula.ParamByName('NR_ALUNO').AsInteger := iNum;
      qryInsertMatricula.ParamByName('CD_MATRICULA_CURSO').AsInteger := tblMatriculascd_matricula_curso.AsInteger;
      qryInsertMatricula.ParamByName('CD_MATRICULA').AsString := tblMatriculasnr_matricula.AsString;
      qryInsertMatricula.ParamByName('CD_TURMA_ANTERIOR').AsString := tblMatriculasTurma.AsString;
      qryInsertMatricula.ExecSQL;

	    { Tentar alterar a tabela de Vestibular }

	    TrocarCursoVestibular( tblMatriculasAnoSemestre.AsInteger, tblMatriculasCodigoAluno.AsInteger, tblMatriculasCurso.AsString, qryNova.FieldByName('Curso').AsString );

	    { Registrar em observações }

       Observacao := 'TRANSFERIDO DA TURMA: ' + tblMatriculasTurma.AsString  +
							'  PARA A TURMA: ' + strNova;

       TfObservacoes.RegisterObservation(
         tblMatriculasCODIGOALUNO.AsInteger, okMatriculation, Observacao);

       // Transferir as disciplinas matriculadas em
       // turmas diferentes da turma de matrícula do aluno

       Statement := PrepareStatement(SSQLUpdDiscOutraTurma);
       try
          Statement.SetString(1, strNova);
          Statement.SetInt(2, tblMatriculasAnoSemestre.AsInteger);
          Statement.SetString(3, tblMatriculasTurma.AsString);
          Statement.SetInt(4, tblMatriculasCODIGOALUNO.AsInteger);
          Statement.ExecutePrepared;
       finally
          Statement.Close;
       end;

	    if Mensagem('Matricular as disciplinas da nova turma para o aluno?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes
	    Then begin
         DM.MatricularGrade(tblMatriculasCodigoAluno.AsInteger, strNova, strNovoAnoSeme, qryNova.FieldByName('cd_grade').AsString);

        { Alteração na Tabela de FichaIndividual }
          qryAlterarTurma.SQL.Clear;
          qryAlterarTurma.SQL.Add('update FichaIndividual set Situacao = ' + IntToStr(situacao_anterior_fi) ); // Transferencia Interna
          qryAlterarTurma.SQL.Add('where CodigoAluno = :CodigoAluno and TurmaMatricula = :Turma and AnoSemestre = :AnoSemestre');

          qryAlterarTurma.ParamByName('CodigoAluno').AsInteger := tblMatriculasCodigoAluno.AsInteger;
          qryAlterarTurma.ParamByName('Turma').AsString := strNova;
          qryAlterarTurma.ParamByName('AnoSemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
          qryAlterarTurma.ExecSQL;

         { Tranferência de Notas }
         { Bloquear as Notas ja digitadas }
         qryUpdateNotas.ParamByName('SITUACAO').AsInteger := iReclassificacao;
         qryUpdateNotas.ParamByName('CODIGOALUNO').AsInteger := tblMatriculasCodigoAluno.AsInteger;
         qryUpdateNotas.ParamByName('ANOSEMESTRE').AsInteger := tblMatriculasAnoSemestre.AsInteger;
         qryUpdateNotas.ParamByName('TURMA_DESTINO').AsString := strNova;
         qryUpdateNotas.ParamByName('TURMA_ORIGEM').AsString := tblMatriculasTurma.AsString;
         qryUpdateNotas.ExecSQL;
         { Fim da transferência de notas }

        // Transferir as notas parciais

        // Inserir no diario matriculas

        if Dm.variavel_parametro('TransferenciaLevarNotasParciais') = 'S' then begin
            qryTransfereFreqs.ParamByName('CD_PESSOA').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;
            qryTransfereFreqs.ParamByName('CD_TURMA').AsString := tblMatriculasTurma.AsString;
            qryTransfereFreqs.ParamByName('NR_ANOSEM').AsInteger := tblMatriculasAnoSemestre.AsInteger;
            qryTransfereFreqs.ParamByName('CD_TURMA_NOVA').AsString := strNova;
            qryTransfereFreqs.ParamByName('NR_ANOSEM_NOVO').AsInteger := strNovoAnoSeme;
            qryTransfereFreqs.ExecSQL;

            qryTransfereNotas.ParamByName('CD_PESSOA').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;
            qryTransfereNotas.ParamByName('CD_TURMA').AsString := tblMatriculasTurma.AsString;
            qryTransfereNotas.ParamByName('NR_ANOSEM').AsInteger := tblMatriculasAnoSemestre.AsInteger;
            qryTransfereNotas.ParamByName('CD_TURMA_NOVA').AsString := strNova;
            qryTransfereNotas.ParamByName('NR_ANOSEM_NOVO').AsInteger := strNovoAnoSeme;
            qryTransfereNotas.ExecSQL;
        end;

      end;

	    { Terminar aqui a troca de turmas }
	 Except on E:Exception do
	    begin
	      Screen.Cursor := crDefault;
	      Mensagem( 'Não foi possível efetuar a transferencia interna.', Application.Title ,MB_OK + MB_ICONSTOP );
	      Screen.Cursor := crDefault;
	      Exit;
	    end;
	 End;

    if vl_credito_from_plano > 0 then
      DM.recalcular_creditos_financeiros( tblMatriculasCODIGOALUNO.AsInteger, strNova, strNovoAnoSeme, true );

  Mensagem( 'Operação realizada com sucesso.', Application.Title,
	    MB_OK + MB_ICONINFORMATION );

  DM.CriarConsulta(qyDisciplinasMatriculadas);

  qyDisciplinasMatriculadas.SQL.Text :=
            'SELECT                                                                                '+
            '   GROUP_CONCAT(CONCAT(lpad(codigo,8,0)," - ",descricao ) SEPARATOR "\n\t\t") as msg  '+
            'FROM                                                                                  '+
            '   disciplinas as d                                                                   '+
            '   INNER JOIN fichaindividual as f ON (d.codigo = f.disciplina and d.curso = f.curso) '+
            'WHERE                                                                                 '+
            '   f.anosemestre = "'+IntToStr(strnovoAnoseme)+'" AND                                 '+
            '   f.turmamatricula = "'+strNova+'"                                                            '+
            'AND                                                                                   '+
            '   f.codigoaluno = '+tblMatriculasCODIGOALUNO.AsString+'                              ';
  qyDisciplinasMatriculadas.Open();

  { *************************************** }
   DM.setLog(
      1018,
      'Alteracao',
      tblMatriculasCODIGOALUNO.AsString+';'+IntToStr(strNovoAnoSeme)+';'+tblMatriculasTurma.AsString+';'+strNova,
      DM.getColigadaByTurma(strNova,strNovoAnoSeme),
      {
      LOG_TRANSFERENCIA_INTERNA =
      '[Transferência INTERNA]' + #13 + #13 +
      #9 + 'Informações da Matrícula Anterior:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 + #13 +
      #9 + 'Informações da Matrícula Nova:' + #13 +
      #9 + #9 + 'CODIGOALUNO: %d' + #13 +
      #9 + #9 + 'ANOSEMESTRE: %d' + #13 +
      #9 + #9 + 'CURSO: %s' + #13 +
      #9 + #9 + 'TURMA: %s' + #13 +
      #9 + 'Disciplinas Matriculadas:' + #13 +
      #9 + #9 + '%s';
      }

      Format(LOG_TRANSFERENCIA_INTERNA,
            [tblMatriculasCODIGOALUNO.AsInteger,
             strNovoAnoSeme,
             tblMatriculasCurso.AsString,
             tblMatriculasTurma.AsString,
             tblMatriculasCODIGOALUNO.AsInteger,
             strNovoAnoSeme,
             qryNova.fieldByName('curso').AsString,
             strNova ,
             qyDisciplinasMatriculadas.FieldByName('msg').AsString
            ]
         )
      );

   // Verifica se a matrícula do aluno está vinculado em disciplinas com grupos de atividades criados
   qyGruposAtividadesAluno.SQL.Text := SQL_GRUPOS_ATIVIDADES_ALUNO;
      
   qyGruposAtividadesAluno.Close;
   qyGruposAtividadesAluno.ParamByName('nr_anosemestre').AsInteger := tblMatriculasAnoSemestre.AsInteger;
   qyGruposAtividadesAluno.ParamByName('cd_curso').AsString := tblMatriculasCurso.AsString;
   qyGruposAtividadesAluno.ParamByName('cd_turma').AsString := tblMatriculasTurma.AsString;
   qyGruposAtividadesAluno.ParamByName('cd_pessoa').AsInteger := tblMatriculasCODIGOALUNO.AsInteger;
   qyGruposAtividadesAluno.Open;

   // Aluno vinculado a grupos de atividades (nessa matrícula)
   if not qyGruposAtividadesAluno.Eof then
   begin
      // Avisa o usuário que ele está transferindo a matrícula de um aluno que possui vinculos em disciplinas com grupos de atividades
      Mensagem('Você transferiu um aluno que possui disciplinas com grupos de atividades, o aluno foi inativado nesses grupos.', 'Informação', MB_OK + MB_ICONINFORMATION );

      // Varre os grupos de atividade que o aluno será desativado
      while not qyGruposAtividadesAluno.Eof do
      begin
         // Inativa o aluno no grupo de atividade que ele estiver relacionado
         qyInativarAluno.Close;
         qyInativarAluno.ParamByName('cd_pessoa').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsInteger;
         qyInativarAluno.ParamByName('cd_grupo').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger;

         // Verifica se foi informada uma data de saída do aluno
         if not DM.tblMatriculasDataSaida.IsNull then
         begin
            qyInativarAluno.ParamByName('dt_saida').AsDateTime := tblMatriculasDataSaida.AsDateTime;
         end else begin
            qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;
         end;

         qyInativarAluno.ExecSQL;

         // Guardar log de inativação do aluno no grupo (tabela: log_geral)
         // Chave: CD_PESSOA;CD_GRUPO
         chaves := FillString(qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString, alRight, '0', 10, true ) + ';' + qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString;

         observacao := 'Transferência interna do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'", portanto o estudante foi inativado no grupo '+
                       qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                       'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', qyInativarAluno.ParamByName('dt_saida').AsDateTime);

         DM.setLog(
            1018,
            'Alteracao',
            chaves,
            dm.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger),
            observacao
         );
         
         qyGruposAtividadesAluno.Next;
      end;

   end;

  FreeAndNil(qyDisciplinasMatriculadas);

  Screen.Cursor := crDefault;

  tblMatriculas.Close;
  tblMatriculas.Open;

end;

procedure TfrmMatriculas.FormCreate(Sender: TObject);
begin
   FBloqueiaCreditosAlunosFIES :=
      DM.variavel_parametro('BLOQUEAR.AJUSTE.CREDITO.FIES') = 'S';
      
   qrySituacaoMatricula.Open;
  DM.MontarPlanilha(grd, 'planilha_matriculas_campos');
  DM.MontarPlanilha(DBGrid2, 'planilha_matriculas_disciplinas_campos');
  
  sOrdem := ' nome, matriculas.anosemestre ';

  Screen.Cursor := crHourGlass;
  Application.CreateForm( TfrmMatriculaDisc, frmMatriculaDisc );
  Application.CreateForm( TfrmSelDisciplinaGenerica, frmSelDisciplinaGenerica );
  Application.CreateForm( TformTransferenciaDeTurma, formTransferenciaDeTurma );
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
        btnObs.Caption := 'Obesrvações';
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


procedure TfrmMatriculas.Filtrar();
const
   SSQLFiltroDatas =
      'SELECT ' +
         'MATRICULAS.ANOSEMESTRE,' +
         'MATRICULAS.TURMA,' +
         'MATRICULAS.CODIGOALUNO,' +
         'MATRICULAS.CURSO,' +
         'MATRICULAS.DATAEMISSAO,' +
         'MATRICULAS.USUARIO,' +
         'MATRICULAS.PLANOPAGAMENTO,' +
         'MATRICULAS.SITUACAO,' +
         'MATRICULAS.SITUACAOESCOLAR,' +
         'MATRICULAS.IMPRESSO,' +
         'MATRICULAS.DATASAIDA,' +
         'MATRICULAS.DATAENTRADA,' +
         'MATRICULAS.PLANODESCONTO,' +
         'MATRICULAS.DIPLOMA,' +
         'MATRICULAS.CD_INGRESSO,' +
         'MATRICULAS.CD_INSTITUICAO_ORIGEM,' +
         'MATRICULAS.TURMADEPENDENCIA,' +
         'MATRICULAS.NR_ALUNO,' +
         'MATRICULAS.CD_MATRICULA,' +
         'MATRICULAS.FREQUENCIA_GLOBAL,' +
         'MATRICULAS.NR_DIA_PGTO,' +
         'MATRICULAS.CD_MATRICULA_CURSO,' +
         'MATRICULAS.CD_TURMA_ANTERIOR, ' +
         'PESSOAS.NM_PESSOA NOME,' +
         'CASE WHEN MATRICULAS.SN_MATRICULA_INTERNET = 0 THEN PES_MATRICULOU.NM_PESSOA ELSE "INTERNET" END NM_PESSOA_MATRICULOU,' +
         'MATRICULAS_INGRESSO.DS_INGRESSO,' +
         'MATRICULAS_CURSO.CD_MATRICULA_CURSO,' +
         'MATRICULAS_CURSO.CD_PESSOA,' +
         'MATRICULAS_CURSO.NR_MATRICULA,' +
         'MATRICULAS_CURSO.CD_CURSO,' +
         'MATRICULAS_CURSO.CD_GRADE,' +
         'MATRICULAS_CURSO.NR_ANOSEM_GRADE,' +
         'MATRICULAS_CURSO.NR_ANOSEM_INGRESSO,' +
         'MATRICULAS_CURSO.CD_TURNO,' +
         'MATRICULAS_CURSO.DT_INGRESSO,' +
         'MATRICULAS_CURSO.CD_INGRESSO,' +
         'MATRICULAS_CURSO.CD_INSTITUICAO,' +
         'MATRICULAS_CURSO.CD_SITUACAO,' +
         'MATRICULAS_CURSO.NR_ANOSEM_CONCLUSAO,' +
         'MATRICULAS_CURSO.DT_CONCLUSAO,' +
         'MATRICULAS_CURSO.DT_COLACAO,' +
         'MATRICULAS_CURSO.DT_EXP_DIPLOMA,' +
         'MATRICULAS_CURSO.DT_SAIDA,' +
         'MATRICULAS_CURSO.DS_OBS,' +
         'MATRICULAS_CURSO.NR_MEDIA_CURSO,' +
         'MATRICULAS_CURSO.NR_CERT_FOLHA,' +
         'MATRICULAS_CURSO.NR_CERT_REGISTRO,' +
         'MATRICULAS_CURSO.CD_CERT_LIVRO,' +
         'SITUACOES.DS_VALOR DSSITUACAO,' +
         'SITUACOES.DS_SIGLA DSSITUACAOSIGLA, '+
         'CASE WHEN matriculas.situacao = 8 THEN CASE WHEN ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) = matriculas.curso) OR '+
         '((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) is null) '+
         ' THEN matriculas.situacao ELSE ''-8'' END ELSE matriculas.situacao END AS CD_SITUACAO_ALTERADO '+
      'FROM ' +
         'MATRICULAS ' +

            'INNER JOIN PESSOAS ON ' +
               '(MATRICULAS.CODIGOALUNO = PESSOAS.CD_PESSOA) ' +

            'LEFT JOIN PESSOAS PES_MATRICULOU ON ' +
               '(MATRICULAS.CD_PESSOA_MATRICULOU = PES_MATRICULOU.CD_PESSOA) ' +

            'INNER JOIN TURMAS ON ' +
               '(TURMAS.CODIGO = MATRICULAS.TURMA) AND ' +
               '(TURMAS.ANOSEMESTRE = MATRICULAS.ANOSEMESTRE) ' +

            'LEFT JOIN MATRICULAS_INGRESSO ON ' +
               '(MATRICULAS.CD_INGRESSO = MATRICULAS_INGRESSO.CD_INGRESSO) ' +

            'LEFT JOIN MATRICULAS_CURSO ON ' +
               '(MATRICULAS.CD_MATRICULA_CURSO = MATRICULAS_CURSO.CD_MATRICULA_CURSO) ' +
               
            'LEFT JOIN SITUACOES ON ' +
               '(MATRICULAS_CURSO.CD_SITUACAO = SITUACOES.CD_SITUACAO) AND ' +
               '(SITUACOES.CD_MODULO = 1019) ' +
               
      'WHERE ' +
         'TURMAS.CD_COLIGADA IN (%s) AND ' +
         'MATRICULAS.DATAEMISSAO BETWEEN :DT_INICIO AND :DT_FIM ' +

      'ORDER BY ' +
         '%s';

var
   i :Integer;
   strSubSelectTblMensalidades,planilha_matriculas_tabelas_especiais,planilha_matriculas_campos_especiais  : string;
   arrLinha,arrPosicao,arrApelidos,arrCampos: TStringList;
   sApelido, sCampos, sOperador  : string;
   LOrdem: string;
begin

   planilha_matriculas_tabelas_especiais := DM.variavel_nu_parametro('Academico.planilha_matriculas_tabelas_especiais',0);
   planilha_matriculas_campos_especiais  := DM.variavel_nu_parametro('Academico.planilha_matriculas_campos_especiais',0);

   arrLinha := explode(planilha_matriculas_campos_especiais, ';' );
   sOperador := '';
   if(arrLinha.Count > 0) then
   begin
     for I := 0 to arrLinha.Count - 1 do
     begin
       arrPosicao := explode(arrLinha[i], '=' );
       sCampos    := sCampos+sOperador+arrPosicao[0];
       sApelido   := sApelido+sOperador+arrPosicao[1];
       sOperador := ',';
       FreeAndNil(arrPosicao);
     end;
   end;

   arrApelidos := explode(sApelido , ',');
   arrCampos   := explode(sCampos, ',');
   for I := 0 to arrCampos.Count - 1 do
   begin
     arrPosicao := explode(arrCampos[i] , '.');
     arrCampos[i]  := arrPosicao[arrPosicao.Count - 1];
     FreeAndNil(arrPosicao);
   end;

   if TipoFiltro = FiltroData then
   begin
      if Trim(sOrdem) = '' then
      begin
         LOrdem := 'NOME, MATRICULAS.ANOSEMESTRE';
      end
      else
      begin
         LOrdem := sOrdem + ', NOME';
      end;

      tblMatriculas.Close;
      tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] :=
         Format(SSQLFiltroDatas, [DM.UsuarioLogado.GetColigadasFilhaSelecionada(), LOrdem]);

      tblMatriculas.ParamByName('DT_INICIO').AsDateTime :=
         fMatriculasFiltroData.dtpInicio.DateTime;
      tblMatriculas.ParamByName('DT_FIM').AsDateTime :=
         fMatriculasFiltroData.dtpFim.DateTime;

      if( bAdicionouCampo = false )then
      begin
        General.DoAddFields(True, tblMatriculas,arrCampos);
        bAdicionouCampo := true;
      end;

      tblMatriculas.Open;
   end

  else if TipoFiltro = FiltroTurma then
  begin

     tblMatriculas.Close;
     tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] :=
       ' select                 '+
       '   matriculas.*,        '+
       '   CASE WHEN matriculas.sn_matricula_internet = 0 THEN pes_matriculou.nm_pessoa ELSE "INTERNET" END nm_pessoa_matriculou, '+       
       '   pessoas.nm_pessoa as nome, matriculas_ingresso.ds_ingresso,  matriculas_curso.*, situacoes.ds_valor dsSituacao, situacoes.ds_sigla dsSituacaoSigla, ' +
       '   CASE WHEN matriculas.situacao = 8 THEN CASE WHEN ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) = matriculas.curso) OR '+
       '   ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) is null) '+
       ' THEN matriculas.situacao ELSE ''-8'' END ELSE matriculas.situacao END AS CD_SITUACAO_ALTERADO ';
       if(  sCampos <> '' ) then
       begin
         tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]+','+sCampos;
       end;
       tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]+
       ' From                                                                '+
       '        matriculas                                                   '+
       ' INNER JOIN pessoas ON (matriculas.codigoaluno = pessoas.cd_pessoa) ' +
       ' LEFT JOIN pessoas pes_matriculou ON (matriculas.cd_pessoa_matriculou = pes_matriculou.cd_pessoa) '+
       ' INNER JOIN turmas ON (turmas.codigo = matriculas.turma AND turmas.anosemestre = matriculas.anosemestre) ' +
       ' LEFT JOIN matriculas_ingresso ON (matriculas.cd_ingresso = matriculas_ingresso.cd_ingresso) ' +
       ' LEFT JOIN matriculas_curso ON (matriculas.cd_matricula_curso = matriculas_curso.cd_matricula_curso) '+
       ' LEFT JOIN situacoes ON (matriculas_curso.cd_situacao = situacoes.cd_situacao AND situacoes.cd_modulo = 1019)'+
       planilha_matriculas_tabelas_especiais+
       ' where (matriculas.turma = :turma) and '+
       ' (matriculas.anosemestre = :anosemestre) ' +
       ' AND turmas.cd_coligada in (' + DM.GetColigadas() + ') ';  // Adicionar Filtro das coligadas Somente apresentar as matriculas que o usuário tiver permissão para olhar

     if Length( sOrdem ) > 0 then
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' ORDER BY ' + sOrdem + ', nome '
     else
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' ORDER BY nome, matriculas.anosemestre ';
     tblMatriculas.SQL.Text := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol];

     tblMatriculas.ParamByName('turma').AsString := resultado_filtro_turma.cd_turma;
     tblMatriculas.ParamByName('anosemestre').AsInteger := resultado_filtro_turma.nr_anosemestre;

     if( bAdicionouCampo = false )then
     begin
       General.DoAddFields(True, tblMatriculas,arrCampos);
       bAdicionouCampo := true;
     end;

     tblMatriculas.Open();

  end
  else if TipoFiltro = FiltroAluno then begin

     tblMatriculas.Close;
     tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] :=
       ' select matriculas.*, CASE WHEN matriculas.sn_matricula_internet = 0 THEN pes_matriculou.nm_pessoa ELSE "INTERNET" END nm_pessoa_matriculou, pessoas.nm_pessoa as nome, '+
       ' matriculas_ingresso.ds_ingresso,  matriculas_curso.*, situacoes.ds_valor dsSituacao, situacoes.ds_sigla dsSituacaoSigla, ' +
       ' CASE WHEN matriculas.situacao = 8 THEN CASE WHEN ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) = matriculas.curso) OR '+
       ' ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) is null) '+
       ' THEN matriculas.situacao ELSE ''-8'' END ELSE matriculas.situacao END AS CD_SITUACAO_ALTERADO ';
       if(  sCampos <> '' ) then
       begin
         tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]+','+sCampos;
       end;
       tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]+
       ' From  matriculas INNER JOIN pessoas ON (matriculas.codigoaluno = pessoas.cd_pessoa) ' +
       ' LEFT JOIN pessoas pes_matriculou ON (matriculas.cd_pessoa_matriculou = pes_matriculou.cd_pessoa) ' +
       ' INNER JOIN turmas ON (turmas.codigo = matriculas.turma AND turmas.anosemestre = matriculas.anosemestre) ' +
       ' LEFT JOIN matriculas_ingresso ON (matriculas.cd_ingresso = matriculas_ingresso.cd_ingresso) ' +
       ' LEFT JOIN matriculas_curso ON (matriculas.cd_matricula_curso = matriculas_curso.cd_matricula_curso) '+
       ' LEFT JOIN situacoes ON (matriculas_curso.cd_situacao = situacoes.cd_situacao AND situacoes.cd_modulo = 1019) '+
       planilha_matriculas_tabelas_especiais+
       ' where matriculas.codigoaluno = :Codigo ' +
       ' AND turmas.cd_coligada in (' + DM.GetColigadas() + ') ';  // Adicionar Filtro das coligadas Somente apresentar as matriculas que o usuário tiver permissão para olhar

     if Length( sOrdem ) > 0 then
       tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' ORDER BY ' + sOrdem + ', nome '
     else
       tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' ORDER BY nome, matriculas.anosemestre ';
     tblMatriculas.SQL.Text := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol];
     tblMatriculas.ParamByName('Codigo').AsInteger := lngCodigoAluno;

     if( bAdicionouCampo = false )then
     begin
       General.DoAddFields(True, tblMatriculas,arrCampos);
       bAdicionouCampo := true;
     end;

     tblMatriculas.Open;

  end
  else if TipoFiltro = FiltroMatriculas then
  begin
     if self.sGuardaFiltro = '' then
     begin
        tblMatriculas.Close;
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] :=
          ' select matriculas.*, CASE WHEN matriculas.sn_matricula_internet = 0 THEN pes_matriculou.nm_pessoa ELSE "INTERNET" END nm_pessoa_matriculou, '+
          ' pessoas.nm_pessoa as nome, matriculas_ingresso.ds_ingresso,  matriculas_curso.*, situacoes.ds_valor dsSituacao, situacoes.ds_sigla dsSituacaoSigla, ' +
          ' CASE WHEN matriculas.situacao = 8 THEN CASE WHEN ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) = matriculas.curso) OR '+
          ' ((Select curso from matriculas m2 where m2.cd_turma_anterior = matriculas.turma AND m2.anosemestre = matriculas.anosemestre AND m2.codigoaluno = matriculas.codigoaluno LIMIT 1) is null) '+
          ' THEN matriculas.situacao ELSE ''-8'' END ELSE matriculas.situacao END AS CD_SITUACAO_ALTERADO ';
        if(  sCampos <> '' ) then
        begin
          tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]+','+sCampos;
        end;
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]+
          ' From  matriculas INNER JOIN pessoas ON (matriculas.codigoaluno = pessoas.cd_pessoa) ' +
          ' LEFT JOIN pessoas pes_matriculou ON (matriculas.cd_pessoa_matriculou = pes_matriculou.cd_pessoa) '+
          ' INNER JOIN turmas ON (turmas.codigo = matriculas.turma AND turmas.anosemestre = matriculas.anosemestre) ' +
          ' LEFT JOIN matriculas_ingresso ON (matriculas.cd_ingresso = matriculas_ingresso.cd_ingresso) ' +
          ' LEFT JOIN matriculas_curso ON (matriculas.cd_matricula_curso = matriculas_curso.cd_matricula_curso) '+
          ' LEFT JOIN situacoes ON (matriculas_curso.cd_situacao = situacoes.cd_situacao AND situacoes.cd_modulo = 1019)'+
        planilha_matriculas_tabelas_especiais;
        //Verifica se a conexão é Oracle ou MySQL
        if tblMatriculas.Connection.Protocol = 'oracle' then //Oracle
        begin
           tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' where TO_CHAR(DataEmissao, ''YYYY-MM-DD'') = :DataEmissao';
        end else begin
           tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' where date_format(DataEmissao, "%Y-%m-%d") = :DataEmissao';
        end;

        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol]
           + ' AND turmas.cd_coligada in (' + DM.GetColigadas() + ') ';  // Adicionar Filtro das coligadas Somente apresentar as matriculas que o usuário tiver permissão para olhar

        tblMatriculas.SQL.Text := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol];

        tblMatriculas.ParamByName('DataEmissao').AsString := FormatDateTime('yyyy-mm-dd',DataHoje);

     end else begin
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := self.sGuardaFiltro;
     end;

     if Length( sOrdem ) > 0 then
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' ORDER BY ' + sOrdem + ', nome '
     else
        tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] + ' ORDER BY nome, matriculas.anosemestre ';

     if( bAdicionouCampo = false )then
     begin
       General.DoAddFields(True, tblMatriculas,arrCampos);
       bAdicionouCampo := true;
     end;

     tblMatriculas.Open;

  end;

   if( bAdicionouCampo = false )then
   begin
     General.DoAddFields(True, tblMatriculas,arrCampos);
     bAdicionouCampo := true;
   end;

  tblMatriculas.Open;

  for I := 0 to arrApelidos.Count - 1 do
  begin
    tblMatriculas.FieldByName(arrCampos[i]).DisplayLabel  := arrApelidos[i];
    tblMatriculas.FieldByName(arrCampos[i]).Tag := 1;
  end;

  if( arrApelidos.Count > 0 )then
  begin
     for I := 0 to arrApelidos.Count - 1 do
     begin
        DoAddFields(true);
     end;
  end;


end;

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

          DM.setLog(1055, 'Alteracao', IntToStr(lngCodigoAluno) + ';' + tblMatriculasTurma.AsString + ';' + tblMatriculasAnoSemestre.AsString, dm.getColigadaByTurma( tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger) , sMsgLog );
       end;

       ConfirmarMatriculaAulas(strTurma,intAnoSemestre, lngCodigoAluno);


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


procedure TfrmMatriculas.grdTitleClick(Column: TColumn);
var
  n : Integer;
begin

  if grd.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to grd.Columns.Count - 1 do begin
       grd.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  Column.Title.Font.Style := [fsUnderline];

  Filtrar();

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
    End;
  end;

end;


procedure TfrmMatriculas.btnMatricularDiscClick(Sender: TObject);

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
          't.sn_bloquear_vagas = 1)';

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
               if qryTurmasLotacaoVagassn_bloquear_vagas.AsInteger = 1 then
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
  n : Integer;
  lugar : pointer;
  bDiscOptativa: Boolean;

  total_creditos, iSerie : integer;
  turma_antiga : string;

  sMsg : String;
  sAux, sAuxOpt, sChave : String;
  qyAlterarDiscExistente : TUMZQuery;
begin

  if not DM.UsuarioLogado.TemPermissao( 1033, npIncluir, True ) then Exit;

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
                  frmSelDisciplinaGenerica.sTurma := txtTurma.Text;
                  frmSelDisciplinaGenerica.SetDisciplinaOptativa(tblGradeDisciplina.AsInteger, tblGradeDescricao.AsString);

                  // Se o usuário selecionou uma disciplina genérica válida
                 if frmSelDisciplinaGenerica.ShowModal = mrOk then
                 begin
                    // Grava a série da disciplina optativa
                    iSerie := frmSelDisciplinaGenerica.qyDisciplinasGenericas.FieldByName('nr_serie').AsInteger;
                 end else begin
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

procedure TfrmMatriculas.btnRemoverClick(Sender: TObject);
const
   SMsgConfirm = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Realizar alterações na matrícula do aluno implicará em ajustes nos créditos acadêmicos.'#13'Deseja realmente prosseguir?';
   SMsgBloqueio = 'Este aluno está cadastrado no financiamento estudantil FIES.'#13'Não é possível realizar alterações na matrícula que implicam em ajustes nos créditos acadêmicos.';
var
  sMsg : String;
  sChave, sAux, observacao : String;
begin
   if ( ClasseDisciplinas.IsUltimaDisciplinaAtiva( tblFichaIndividualAnoSemestre.AsInteger,
            tblFichaIndividualTurmaMatricula.AsString, tblFichaIndividualDisciplina.AsInteger,
            tblFichaIndividualCodigoAluno.AsInteger, tblFichaIndividualTurma.AsString ) ) then
   begin
      Mensagem(
         'Existe apenas uma disciplina vinculada a turma, para cancelá-la utilize a opção de ajuste da situação da turma.',
         Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      Exit;
   end;

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
   if tblFichaIndividual.FieldByName('cd_grupo').AsInteger > 0 then
   begin
      // Avisa o usuário que ele está removendo uma disciplina com grupo de atividade
      Mensagem('Você removeu uma disciplina do aluno que estava relacionada um grupo de atividade, o aluno foi inativado nesse grupo.', 'Informação', MB_OK + MB_ICONINFORMATION );

      // Inativa o aluno no grupo de atividade que ele estiver relacionado
      qyInativarAluno.Close;
      qyInativarAluno.ParamByName('cd_pessoa').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
      qyInativarAluno.ParamByName('cd_grupo').AsInteger := tblFichaIndividual.FieldByName('cd_grupo').AsInteger;
      qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;

      qyInativarAluno.ExecSQL;

      // Guardar log de inativação do aluno no grupo (tabela: log_geral)
      // Chave: CD_PESSOA;CD_GRUPO
      sChave := FillString(tblFichaIndividualCodigoAluno.AsString, alRight, '0', 10, true ) + ';' + tblFichaIndividual.FieldByName('cd_grupo').AsString;

      observacao := 'Disciplina do estudante '+tblFichaIndividualCodigoAluno.AsString+' - "'+tblMatriculasNome.AsString+'" foi removida, portanto o estudante foi inativado no grupo '+
                    tblFichaIndividual.FieldByName('cd_grupo').AsString+' - "'+tblFichaIndividual.FieldByName('nm_grupo').AsString+'" [disciplina: '+tblFichaIndividualDescricaoDisciplina.AsString+'] '+
                    'na data '+FormatDateTime('dd/mm/yyyy', DataHoje);

      DM.setLog(
         1033,
         'Exclusao',
         sChave,
         dm.getColigadaByTurma(DM.tblMatriculasTurma.AsString, DM.tblMatriculasAnoSemestre.AsInteger),
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
   Turma: string;
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
        qAux.SQL.Add('Update Documentos_Alunos Set Apresentou = ''S'', dt_entrega = now()');
        qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
        qAux.ParamByName('ALUNO').Value := tblMatriculasCodigoAluno.Value;
        qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
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
const
   SQL =
   'SELECT DISTINCT m.codigoaluno codigoaluno, m.*, p.nm_pessoa nome, '+
   ' CASE WHEN m.sn_matricula_internet = 0 THEN pes_matriculou.nm_pessoa ELSE "INTERNET" END nm_pessoa_matriculou, '+
   ' mi.ds_ingresso, mc.*, s.ds_valor dsSituacao, s.ds_sigla dsSituacaoSigla, '+
   'CASE WHEN M.situacao = 8 THEN CASE WHEN ((Select curso from matriculas m2 where m2.cd_turma_anterior = M.turma AND m2.anosemestre = M.anosemestre AND m2.codigoaluno = M.codigoaluno) = M.curso) OR '+
   '((Select curso from matriculas m2 where m2.cd_turma_anterior = M.turma AND m2.anosemestre = M.anosemestre AND m2.codigoaluno = M.codigoaluno) is null) THEN M.situacao ELSE ''-8'' END ELSE M.situacao END AS CD_SITUACAO_ALTERADO '+
   'FROM matriculas m JOIN pessoas p ON(m.codigoaluno = p.cd_pessoa) '+
   ' LEFT JOIN pessoas pes_matriculou ON (m.cd_pessoa_matriculou = pes_matriculou.cd_pessoa) '+
   'JOIN fichaindividual fi '+
      'ON(m.turma = fi.turmamatricula AND '+
         'm.codigoaluno = fi.codigoaluno AND '+
         'fi.anosemestre = m.anosemestre AND '+
         'fi.anosemestre = :anosemestre AND '+
         'fi.disciplina = :disciplina AND '+
         'fi.curso = :curso) '+
   'LEFT JOIN matriculas_ingresso mi ON(m.cd_ingresso = mi.cd_ingresso) '+
   'LEFT JOIN matriculas_curso mc ON(m.cd_matricula_curso = mc.cd_matricula_curso) '+
   'LEFT JOIN situacoes s ON(mc.cd_situacao = s.cd_situacao AND s.cd_modulo = 1019) ';
var
   slFiltros: TStringList;
   resultado_filtro: TResultadoFiltroDisciplina;
begin
   resultado_filtro := TfrmSelecionarDisciplina.Filtrar([]);

   if not resultado_filtro.filtrado then Exit;

   btnFiltroData.Marked := False;
   SpeedButton2.Marked := False;
   SpeedButton1.Marked := False;
   tbnBuscaDisciplina.Marked := True;

   Self.tblMatriculas.Close;

   Self.tblMatriculas.SQLList.Values[tblMatriculas.Connection.Protocol] := SQL;

   Self.tblMatriculas.SQL.Text := SQL;

   Self.tblMatriculas.ParamByName('curso').AsString := resultado_filtro.cd_curso;
   Self.tblMatriculas.ParamByName('disciplina').AsInteger := resultado_filtro.cd_disciplina;
   Self.tblMatriculas.ParamByName('anosemestre').AsInteger := resultado_filtro.nr_anosemestre;
   Self.tblMatriculas.Open;
   
   self.sGuardaFiltro := Self.tblMatriculas.SQL.Text;
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
   '    dt_cadastro               ' +
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
   '    :dt_cadastro              ' +
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

      if (tblMatriculas.RecNo >= 1) then
         frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
      else
         frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);
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
      if (tblMatriculas.RecNo >= 1) then
         frmCursos.tblTurmas.Locate('CODIGO', tblMatriculasTurma.AsString, [loCaseInsensitive])
      else
         frmCursos.tblTurmas.Locate('CODIGO', sFiltroTurma, [loCaseInsensitive]);
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
  strAux, strAux2 : String;
  bytAux : Byte;
  sMesVenc, sMesAtual, sMesSeguinte: string;
  qryDDA : TUMZQuery;

  sTitulos : string;

  movimento : TMovimento;

  bCancelar, bCancelamentosImpedidos, bCancelarDDA : Boolean;
  iCancelamento : Integer;
  Chaves, observacao : String;
  iColigada : integer;

  dtCancelamento : TDateTime;

  sCodigosTitulosJaCancelados : String;
  iDiaCancela : Integer;

begin

  if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then Exit;

  case TPopupMenu( Sender ).Tag of
    3 : strAux := 'o cancelamento da matrícula ';
    4 : strAux := 'o trancamento da matrícula ';
    5 : strAux := 'a desistência ';
    6 : strAux := 'o abandono da matrícula ';
    7 : strAux := 'a transferência ';
    10: strAux := 'o registro de reserva da matrícula ';
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
    Mensagem( 'Só é possível efetuar ' + strAux + ' de um aluno cursando.', Application.Title, MB_OK + MB_ICONSTOP );
    Exit;
  end;

   if TPopupMenu(Sender).Tag IN [3,4,5,6,7]  then
   begin
      if dm.variavel_parametro('acad_saida_verifica_biblioteca', True) = '1'  then
      begin
         VerificaBib;
      end;
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

         // Varre os grupos de atividade que o aluno será desativado
         while not qyGruposAtividadesAluno.Eof do
         begin
            // Inativa o aluno no grupo de atividade que ele estiver relacionado
            qyInativarAluno.Close;
            qyInativarAluno.ParamByName('cd_pessoa').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsInteger;
            qyInativarAluno.ParamByName('cd_grupo').AsInteger := qyGruposAtividadesAluno.FieldByName('cd_grupo').AsInteger;

            // Verifica se foi informada uma data de saída do aluno
            if not DM.tblMatriculasDataSaida.IsNull then
            begin
               qyInativarAluno.ParamByName('dt_saida').AsString := FormatDateTime('yyyy-mm-dd', DM.tblMatriculasDataSaida.AsDateTime) + FormatDateTime(' hh:nn:ss', DM.DataAtual);
            end else begin
               qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;
            end;

            qyInativarAluno.ExecSQL;

            // Guardar log de inativação do aluno no grupo (tabela: log_geral)
            // Chave: CD_PESSOA;CD_GRUPO
            chaves := FillString(qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString, alRight, '0', 10, true ) + ';' + qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString;

            observacao := 'Matricula do estudante '+qyGruposAtividadesAluno.FieldByName('cd_pessoa').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_pessoa').AsString+'" foi inativada, portanto o estudante foi inativado no grupo '+
                          qyGruposAtividadesAluno.FieldByName('cd_grupo').AsString+' - "'+qyGruposAtividadesAluno.FieldByName('nm_grupo').AsString+'" [disciplina: '+qyGruposAtividadesAluno.FieldByName('nm_disciplina').AsString+'] '+
                          'na data informada pelo usuário de '+FormatDateTime('dd/mm/yyyy', qyInativarAluno.ParamByName('dt_saida').AsDateTime);

            DM.setLog(
               1009,
               'Alteracao',
               chaves,
               dm.getColigadaByTurma(DM.tblMatriculasTurma.AsString, DM.tblMatriculasAnoSemestre.AsInteger),
               observacao
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

procedure TfrmMatriculas.TransfernciaInterna1Click(Sender: TObject);
begin
   TransferenciaInterna;
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
begin
   // Se estiver tentando fazer setar a situação da disciplina com a mesma que da matrícula, não precisa verificar se só tem 1 disciplina
   if not ((tblMatriculasSituacao.AsInteger = TPopupMenu( Sender ).Tag) AND (tblMatriculasSituacao.AsInteger in [3,4,5,6])) then
   begin
   
      if ( ClasseDisciplinas.IsUltimaDisciplinaAtiva( tblFichaIndividualAnoSemestre.AsInteger,
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
      if tblFichaIndividual.FieldByName('cd_grupo').AsInteger > 0 then
      begin
         // Avisa o usuário que ele está desativando uma disciplina com grupo de atividade
         Mensagem('Você desativou uma disciplina com grupo de atividade, o aluno foi inativado nesse grupo.', 'Informação', MB_OK + MB_ICONINFORMATION );

         // Inativa o aluno no grupo de atividade que ele estiver relacionado
         qyInativarAluno.Close;
         qyInativarAluno.ParamByName('cd_pessoa').AsInteger := tblFichaIndividualCodigoAluno.AsInteger;
         qyInativarAluno.ParamByName('cd_grupo').AsInteger := tblFichaIndividual.FieldByName('cd_grupo').AsInteger;
         qyInativarAluno.ParamByName('dt_saida').AsDateTime := DM.DataAtual;

         qyInativarAluno.ExecSQL;

         // Guardar log de inativação do aluno no grupo (tabela: log_geral)
         // Chave: CD_PESSOA;CD_GRUPO
         chaves := FillString(tblFichaIndividualCodigoAluno.AsString, alRight, '0', 10, true ) + ';' + tblFichaIndividual.FieldByName('cd_grupo').AsString;

         observacao := 'Disciplina do estudante '+tblFichaIndividualCodigoAluno.AsString+' - "'+tblMatriculasNome.AsString+'" foi inativada, portanto o estudante foi inativado no grupo '+
                       tblFichaIndividual.FieldByName('cd_grupo').AsString+' - "'+tblFichaIndividual.FieldByName('nm_grupo').AsString+'" [disciplina: '+tblFichaIndividualDescricaoDisciplina.AsString+'] '+
                       'na data '+FormatDateTime('dd/mm/yyyy', DataHoje);

         DM.setLog(
            1033,
            'Alteracao',
            chaves,
            dm.getColigadaByTurma(DM.tblMatriculasTurma.AsString, DM.tblMatriculasAnoSemestre.AsInteger),
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

  Mensagem( 'Operação realizada com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );

  tblFichaIndividual.Close;
  tblFichaIndividual.Open;
  tblResumoFicha.Close;
  tblResumoFicha.Open;
  Screen.Cursor := crDefault;
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

  tblFichaIndividual.Close;
  tblFichaIndividual.Open;

  if intAux in [3..8] then
  Begin

     DM.DeptoCursoTurma(tblFichaIndividualAnoSemestre.AsInteger, tblFichaIndividualTurma.AsString);

     DM.recalcular_creditos_financeiros(tblMatriculasCodigoAluno.AsInteger, tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger);

  End;

  DM.setLog(1055, 'Alteracao', IntToStr(tblFichaIndividualCodigoAluno.AsInteger) + ';' + tblFichaIndividualTurma.AsString + ';' + tblFichaIndividualAnoSemestre.AsString, DM.getColigadaByTurma(tblMatriculasTurma.AsString, tblMatriculasAnoSemestre.AsInteger), 'Ativação manual da disciplina: ' + tblFichaIndividualDescricaoDisciplina.AsString );

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
         DateToStr(fMatriculasFiltroData.dtpInicio.Date),
         DateToStr(fMatriculasFiltroData.dtpFim.Date)]
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

procedure TfrmMatriculas.TrocarCursoVestibular(anosemestre : Integer; codigoAluno: Integer;
  CursoAtual, CursoNovo: String);
begin

   { Ao trocar a turma de matrícula, verificar se existe uma ligação na tabela de Vestibular }
   { Se não tiver registro, nada será alterado }

   Dm.qAux1.Close;
   Dm.qAux1.SQL.Text := 'UPDATE vestibular SET curso = :cursonovo';
   Dm.qAux1.SQL.Add(' WHERE codigoaluno = :codigoaluno AND anosemestre = :anosemestre and curso = :cursoatual ');

   Dm.qAux1.ParamByName('codigoaluno').AsInteger := codigoAluno;
   Dm.qAux1.ParamByName('cursonovo').AsString := CursoNovo;
   Dm.qAux1.ParamByName('cursoatual').AsString := CursoAtual;
   Dm.qAux1.ParamByName('anosemestre').AsInteger := anosemestre;

   Dm.qAux1.ExecSQL;

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
   frmSelDisciplinaGenerica.sTurma := tblFichaIndividual.FieldByName('turma').AsString;
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

{ TrocarCursoVestibular }
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
      DateTimeToString(tblMatriculasDataSaida.AsDateTime)
  );
  formTransferenciaDeTurma.Show;
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
   if not DM.UsuarioLogado.TemPermissao( 1020, npAlterar, True ) then Exit;

//
   if (DM.variavel_parametro('sn_digitaliza_nova') = 'S') then begin
      Application.CreateForm(TFDigDocumentos, FDigDocumentos);
      if tblMatriculasCodigoAluno.AsInteger <> 0 then begin

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

         FDigDocumentos.DelphiTwain1.LibraryLoaded := True;
         FDigDocumentos.DelphiTwain1.SourceManagerLoaded := True;

// Deixar entrar na tela mesmo se não tiver scanner.         
         if not ((FDigDocumentos.DelphiTwain1.LibraryLoaded) and (FDigDocumentos.DelphiTwain1.SourceManagerLoaded)) then
         begin
          //Mensagem('Não foi possível carregar a biblioteca Twain ou alguma origem.', '', MB_ICONERROR + MB_OK);
          //Exit;
            FDigDocumentos.btnDigitalizar.Enabled := false;
         end;

         // Selecionar a última origem de digitalização utilizada
         try
           Origem := StrToInt(Dm.variavel_parametro('digitalizacao_origem'));
           //origem := 0;
          // sbDigitalizar.Enabled := true;
         except
           Origem := -1;
         end;

         FDigDocumentos.ShowModal();
         tblDoc.close();
         tblDoc.Open();
      end;
   end else begin

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

{
   qyDocDigital.Close;
   qyDocDigital.ParamByName('cd_pessoa').AsInteger := tblMatriculasCodigoAluno.AsInteger;
   qyDocDigital.ParamByName('cd_documento').AsInteger := tblDocCodigo.AsInteger;
   qyDocDigital.Open;

   if qyDocDigital.Eof then
   begin
       qyDocDigital.Insert;
       qyDocDigital.FieldByName('cd_pessoa').AsInteger := tblMatriculasCodigoAluno.AsInteger;
       qyDocDigital.FieldByName('cd_documento').AsInteger := tblDocCodigo.AsInteger;
   end
   else
   begin
      // Verificar se a imagem ja foi digitalizada

      if qyDocDigitalim_documento.AsString <> '' then
      begin
          BS := TBlobStream.Create((qyDocDigitalim_documento as TBlobField), BMREAD);
          // Cria o componente JPEG
          ImagemAtual := TJPEGImage.Create;
          //Abre no componente JPEG baseado no Stream criado anteriormente que já possui a imagem da base
          ImagemAtual.LoadFromStream(BS);

          ImagemFrenteVerso(Imagem, ImagemAtual);

          ImagemAtual.Free;
      end;

      qyDocDigital.Edit;

   end;

   BS := TBlobStream.Create((qyDocDigitalim_documento as TBlobField), BMWRITE);

   Imagem.SaveToStream(BS);

   //Libera da memória os componentes que foram criados
   BS.Free;
   Imagem.Free;

   //Salva as alterações feitas
   qyDocDigital.Post;

   //Atualizar Tabela de Documentos

	  qAux.SQL.Clear;
	  qAux.SQL.Add('Update Documentos_Alunos Set Apresentou = ''S'', sn_digitalizado = ''S''');
	  qAux.SQL.Add('WHERE CodigoAluno = :ALUNO AND Cod_Documento = :DOC');
	  qAux.ParamByName('ALUNO').Value := tblMatriculasCodigoAluno.Value;
	  qAux.ParamByName('DOC').Value := tblDocCodigo.Value;
	  qAux.Prepare;
	  qAux.ExecSQL;
     }
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
   frmSelColunas.SelecionaColunas(grd, 'planilha_matriculas_campos');
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

end.
