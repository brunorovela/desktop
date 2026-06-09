unit uAulasProvasAcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, ToolWin, StdCtrls, Buttons, ExtCtrls, DB, ZConnection,
  CheckLst, DBCtrls, Mask, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, UMEditMonetario, uDMDiario, UMComboBox, StrUtils, UMAjuda,
  UMDateTimePicker, ZDbcIntfs, UZDbcFuncs, DateUtils, RegExpr, Math ;

const
   lista_campos_situacoes_logistica : Array[1..6] of String = (
      'cd_situacao_material_aula', 'cd_situacao_transporte', 'cd_situacao_local_aula', 'cd_situacao_hospedagem',
      'cd_situacao_gerenc_prof', 'cd_situacao_gerenc_gest' );
   TAMANHO_TELA = 640;

type
   AcaoInsereCampos = (Padrao, Limpar, Editar);
   TiposPrazos = (
      tpVisualizacao, tpNotas, tpAulas, tpLiberacao
   );

   TProfessor = class(TObject)
   strict private
      FICodigo: integer;
      FSNome: string;
   public
      constructor Create(const AICodigo: integer; const ASNome: string);

      property Codigo: integer read FICodigo write FICodigo;
      property Nome: string read FSNome write FSNome;
   end;

   TTipoProva = class(TObject)
   strict private
      FICodigo: integer;
      FSNome: string;
   public
      constructor Create(const AICodigo: integer; const ASNome: string);

      property Codigo: integer read FICodigo write FICodigo;
      property Nome: string read FSNome write FSNome;
   end;

   TProva = class(TObject)
   strict private
      FSAssunto: string;
      FSChave: string;
      FProfessor: TProfessor;
   private
      constructor Create(const ASAssunto, ASChave: string; AProfessor: TProfessor);
      destructor Destroy; override;
      property Assunto: string read FSAssunto;
      property Chave: string read FSChave;
      property Professor: TProfessor read FProfessor;
   end;

   TSituacaoLogistica = class(TObject)
      strict private
         FICodigo: integer;
         FIAuxiliar : integer;
         FSDescricao: string;
      public
         constructor Create(const ICodigo, IAuxiliar: Integer; const SDescricao: String);
         property Codigo: Integer read FICodigo;
         property Auxiliar: Integer read FIAuxiliar;
         property Descricao: string read FSDescricao;
   end;

  TAulaDado = record
      sChave: ShortString;
      sTurma: ShortString;
      iDisciplina: Integer;
      iProfessor: Integer;
      iNumAulas: Byte;
  end;

  TfrmAulasProvasAcoes = class(TForm)
    Bevel1: TBevel;
    Bevel6: TBevel;
    Bevel2: TBevel;
    pcAulas: TPageControl;
    tsAulas: TTabSheet;
    tsProvas: TTabSheet;
    ImageList2: TImageList;
    qyAux: TUMZQuery;
    qyAux2: TUMZQuery;
    pcProvas: TPanel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lblProva: TLabel;
    txtPDisciplina: TEdit;
    txtPTurma: TEdit;
    txtPCurso: TEdit;
    txtPBim: TEdit;
    udPBim: TUpDown;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    clbPTD: TCheckListBox;
    Label14: TLabel;
    txtPAssunto: TEdit;
    btnNenhuma: TBitBtn;
    btnTodas: TBitBtn;
    txtPProf: TEdit;
    lblPProf: TLabel;
    qyAux3: TUMZQuery;
    tsAprovacao: TTabSheet;
    Panel2: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lblAssunto: TLabel;
    ToolBar2: TToolBar;
    btDeferir: TToolButton;
    ToolButton6: TToolButton;
    btIndeferir: TToolButton;
    Label23: TLabel;
    lblACurso: TLabel;
    lblAturma: TLabel;
    Label22: TLabel;
    lblADisciplina: TLabel;
    Label21: TLabel;
    lblAAluno: TLabel;
    btACancelar: TToolButton;
    ToolButton9: TToolButton;
    Label27: TLabel;
    meAJust: TMemo;
    meResposta: TMemo;
    Label20: TLabel;
    tsCalculo: TTabSheet;
    Panel3: TPanel;
    Label31: TLabel;
    ToolBar3: TToolBar;
    tblNCalcular: TToolButton;
    ToolButton7: TToolButton;
    tblNCancelar: TToolButton;
    edNFormula: TEdit;
    ckbNForcar: TCheckBox;
    meDados: TMemo;
    ckbMedia: TCheckBox;
    lblFiltro: TLabel;
    Label24: TLabel;
    tsFrequencia: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    Memo1: TMemo;
    txtPDiasBloq: TEdit;
    Label25: TLabel;
    tsComplemento: TTabSheet;
    Label28: TLabel;
    SpeedButton4: TSpeedButton;
    Label29: TLabel;
    UpDown1: TUpDown;
    Label30: TLabel;
    Label32: TLabel;
    qyCompl: TUMZQuery;
    dsComplemento: TDataSource;
    Label34: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ToolBar5: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    qyAjuste: TUMZQuery;
    dsAjuste: TDataSource;
    qyAjusteds_ajuste: TStringField;
    txtChave: TEdit;
    Label33: TLabel;
    Label35: TLabel;
    txtPSerie: TEdit;
    udPSerie: TUpDown;
    txtPPeso: TEdit;
    Label37: TLabel;
    ckbPSerie: TCheckBox;
    tsCronogramasGerenciar: TTabSheet;
    Label43: TLabel;
    Label49: TLabel;
    txtCronogramasConteudo: TMemo;
    ToolBar6: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Label44: TLabel;
    txtCronogramasSala: TEdit;
    qCronograma: TUMZQuery;
    dsCronograma: TDataSource;
    qCronogramaCompleto: TUMZQuery;
    lbResponsavel: TLabel;
    cbResponsavel: TComboBox;
    spLimpaResp: TSpeedButton;
    txtAnoSemestre: TEdit;
    Label47: TLabel;
    txtPNotaMinima: TEdit;
    Label48: TLabel;
    txtPNotaMaxima: TEdit;
    ckbBloqueiaProva: TCheckBox;
    qyNovaAula: TUMZQuery;
    qyInsereAulaDados: TUMZQuery;
    qyComplCD_AJUSTE_TURMA: TLargeintField;
    qyComplCD_TURMA: TStringField;
    qyComplNR_ANOSEM: TLargeintField;
    qyComplNR_ETAPA: TLargeintField;
    qyAjusteCD_AJUSTE: TLargeintField;
    qCronogramaCD_CRONOGRAMA: TLargeintField;
    qCronogramaTURMA: TStringField;
    qCronogramaANOSEMESTRE: TIntegerField;
    qCronogramaDISCIPLINA: TLargeintField;
    qCronogramaDT_CRONOGRAMA: TDateField;
    qCronogramaDS_SALA: TStringField;
    qCronogramaCD_PROFESSOR: TLargeintField;
    qCronogramaDS_CONTEUDO: TMemoField;                            
    qCronogramacd_prof_substituto: TIntegerField;
    qyComplCD_AJUSTE: TLargeintField;
    pnPrimeiraAula: TPanel;
    lbAula1: TLabel;
    cbHorarioAula1: TUMComboBox;
    rgPeriodicidade: TRadioGroup;
    qCronogramaSN_CONFIRMADO: TSmallintField;
    qCronogramaNR_VALOR: TFloatField;
    qCronogramaCD_HORARIO: TLargeintField;
    lbAula2: TLabel;
    cbHorarioAula2: TUMComboBox;
    Panel4: TPanel;
    Label39: TLabel;
    edQtdAulas: TEdit;
    UpDown2: TUpDown;
    Label46: TLabel;
    txtCronogramasProfessor: TEdit;
    Label40: TLabel;
    txtCronogramasCurso: TEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ckbChecarConflitos: TCheckBox;
    ckConfirmado: TCheckBox;
    Label41: TLabel;
    Label42: TLabel;
    cbDisciplinas: TUMComboBox;
    Label38: TLabel;
    edmValor: TUMEditMonetario;
    ckbCriaProvaUltimaAula: TCheckBox;
    Panel5: TPanel;
    Label51: TLabel;
    Label52: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    cbTiposProvas: TUMComboBox;
    Bevel4: TBevel;
    lbTipoProva: TLabel;
    chkAI: TCheckBox;
    sbAulas: TScrollBox;
    pnOrientacaoTopo: TPanel;
    sbSubstituto: TSpeedButton;
    txtSubstituto: TEdit;
    Label77: TLabel;
    lbGrupoProvas: TLabel;
    edGrupoProvas: TEdit;
    sbBuscaGrupoProvas: TSpeedButton;
    Label50: TLabel;
    cbGrupos: TUMComboBox;
    qCronogramacd_grupo: TIntegerField;
    Label90: TLabel;
    sbFiltroSala: TSpeedButton;
    sbLimparSala: TSpeedButton;
    edNomeSala: TEdit;
    qCronogramacd_sala: TLargeintField;
    umAjudaModeloHorarios: TUMAjuda;
    umAjudaAula1: TUMAjuda;
    umAjudaAula2: TUMAjuda;
    ckbChecarConflitosSalas: TCheckBox;
    sbTurmaBuscaCronograma: TSpeedButton;
    txtCronogramaTurma: TEdit;
    umAjudaTrocaProfessor: TUMAjuda;
    qyProfessorAntigo: TUMZQuery;
    qCronogramabimestre: TSmallintField;
    pnEtapaCoord: TPanel;
    umAjuda: TUMAjuda;
    upDownEtapa: TUpDown;
    edBimestre: TEdit;
    Label91: TLabel;
    umdtPData: TUMDateTimePicker;
    dtpDataAula1: TUMDateTimePicker;
    dtpDataAula2: TUMDateTimePicker;
    umdtAvaliacao: TMaskEdit;
    umdtInicioDiario: TUMDateTimePicker;
    umdtFimDiario: TUMDateTimePicker;
    cbFecharDiario: TCheckBox;
    cbTipoDigitacao: TUMComboBox;
    lbTipoDigitacao: TLabel;
    ScrollBox1: TScrollBox;
    Label6: TLabel;
    meConteudo: TMemo;
    meObservacao: TMemo;
    Label71: TLabel;
    pnControleLogistica: TPanel;
    lbl: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    meMaterial: TMemo;
    meTransporte: TMemo;
    meLocal: TMemo;
    meHospagem: TMemo;
    meGerenciamentoProf: TMemo;
    meGerenciamentoGestor: TMemo;
    cbSituacaoMaterialAula: TUMComboBox;
    cbSituacaoTransporte: TUMComboBox;
    cbSituacaoLocalAula: TUMComboBox;
    cbSituacaoHospedagem: TUMComboBox;
    cbSituacaoGerenProfessor: TUMComboBox;
    cbSituacaoGerenGestor: TUMComboBox;
    Panel7: TPanel;
    Label73: TLabel;
    edmValorKm: TUMEditMonetario;
    Panel6: TPanel;
    Label72: TLabel;
    edmKm: TUMEditMonetario;
    Panel8: TPanel;
    Label74: TLabel;
    edmTotalKm: TUMEditMonetario;
    Panel9: TPanel;
    Label78: TLabel;
    edmQtdDiariasLocal: TUMEditMonetario;
    Panel10: TPanel;
    Label79: TLabel;
    edmVlDiariaLocal: TUMEditMonetario;
    Panel11: TPanel;
    Label80: TLabel;
    edmTotalLocal: TUMEditMonetario;
    Panel12: TPanel;
    Label81: TLabel;
    edmQtdDiariasHospedagem: TUMEditMonetario;
    Panel13: TPanel;
    Label82: TLabel;
    edmVlDiariaHospedagem: TUMEditMonetario;
    Panel14: TPanel;
    Label83: TLabel;
    edmTotalHospedagem: TUMEditMonetario;
    Panel15: TPanel;
    Label84: TLabel;
    edmQtdDiariasMaterial: TUMEditMonetario;
    Panel16: TPanel;
    Label85: TLabel;
    edmVlDiariaMaterial: TUMEditMonetario;
    Panel17: TPanel;
    Label86: TLabel;
    edmTotalMaterial: TUMEditMonetario;
    ToolBar7: TToolBar;
    btSalvar: TToolButton;
    ToolButton17: TToolButton;
    btCancelar: TToolButton;
    Label2: TLabel;
    Label1: TLabel;
    txtCurso: TEdit;
    sbBuscaCurso: TSpeedButton;
    Label45: TLabel;
    Label7: TLabel;
    txtTurma: TEdit;
    sbBuscaTurma: TSpeedButton;
    lblDisciplina: TLabel;
    txtDisciplina: TEdit;
    sbBuscaDisciplina: TSpeedButton;
    lblAProf: TLabel;
    txtAProf: TEdit;
    sbAProf: TSpeedButton;
    sbBuscaGrupoAulas: TSpeedButton;
    edGrupoAulas: TEdit;
    lbGrupoAulas: TLabel;
    ckbBloqueado: TCheckBox;
    txtAulas: TEdit;
    udAulas: TUpDown;
    Label5: TLabel;
    udBim: TUpDown;
    txtBim: TEdit;
    Label3: TLabel;
    umdtDataFim: TUMDateTimePicker;
    Label8: TLabel;
    umdtDataInic: TUMDateTimePicker;
    Label4: TLabel;
    Label26: TLabel;
    cbTipoAula: TUMComboBox;
    ckbAtividadeComplementares: TCheckBox;
    ckbConfGrade: TCheckBox;
    ckbCompartilha: TCheckBox;
    Label36: TLabel;
    lbAvisoPrazoCronograma: TLabel;
    cbAvaliacao: TUMComboBox;
    qyAvaliacaoCronograma: TUMZQuery;
    umAjudaAvaliacao: TUMAjuda;
    qrySituacoes: TUMZReadOnlyQuery;
    qrySituacoesCD_SITUACAO: TIntegerField;
    qrySituacoesDS_VALOR: TStringField;
    qrySituacoesDS_SIGLA: TStringField;
    cbSituacaoAula: TComboBox;
    lblSituacaoAula: TLabel;
    procedure txtChaveExit(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ckbCriaProvaUltimaAulaClick(Sender: TObject);
    procedure dtpDataAula1ChangeDate(Sender: TObject);
    procedure dtpDataAula2ChangeDate(Sender: TObject);
    procedure umdtFimDiarioChangeDate(Sender: TObject);
    procedure umdtInicioDiarioChangeDate(Sender: TObject);
    procedure edQtdAulasKeyPress(Sender: TObject; var Key: Char);
    procedure upDownEtapaChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure txtCronogramaTurmaChange(Sender: TObject);
    procedure sbTurmaBuscaCronogramaClick(Sender: TObject);
    procedure sbLimparSalaClick(Sender: TObject);
    procedure cbHorarioAula1Change(Sender: TObject);
    procedure sbFiltroSalaClick(Sender: TObject);
    procedure cbGruposChange(Sender: TObject);
    procedure sbBuscaGrupoProvasClick(Sender: TObject);
    procedure sbBuscaGrupoAulasClick(Sender: TObject);
    procedure edmQtdDiariasHospedagemKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edmQtdDiariasHospedagemExit(Sender: TObject);
    procedure edmQtdDiariasLocalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edmQtdDiariasLocalExit(Sender: TObject);
    procedure edmQtdDiariasMaterialKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edmQtdDiariasMaterialExit(Sender: TObject);
    procedure edmKmExit(Sender: TObject);
    procedure edmKmKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure sbSubstitutoClick(Sender: TObject);
    procedure dtpDtInicioDiarioChange(Sender: TObject);
    procedure dtpDtFimDiarioChange(Sender: TObject);
    procedure chkAIClick(Sender: TObject);
    procedure cbTiposProvasChange(Sender: TObject);
    procedure rgPeriodicidadeClick(Sender: TObject);
    procedure edQtdAulasChange(Sender: TObject);
    procedure cbDisciplinasChange(Sender: TObject);
    procedure txtPNotaMaximaKeyPress(Sender: TObject; var Key: Char);
    procedure txtPNotaMinimaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spLimpaRespClick(Sender: TObject);
    procedure ckbPSerieClick(Sender: TObject);
    procedure udSerieClick(Sender: TObject; Button: TUDBtnType);
    procedure udPSerieClick(Sender: TObject; Button: TUDBtnType);
    procedure FormShow(Sender: TObject);
    procedure sbAProfClick(Sender: TObject);
    procedure btACancelarClick(Sender: TObject);
    procedure btIndeferirClick(Sender: TObject);
    procedure btDeferirClick(Sender: TObject);
    procedure btnNenhumaClick(Sender: TObject);
    procedure btnSelTodas(Sender: TObject);
    procedure clbPTDClickCheck(Sender: TObject);
    procedure txtTurmaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtEditFiltroProvaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure udAulasClick(Sender: TObject; Button: TUDBtnType);
    procedure udBimClick(Sender: TObject; Button: TUDBtnType);
    procedure btSalvarClick(Sender: TObject);
    procedure ckbConfGradeClick(Sender: TObject);
    procedure sbBuscaDisciplinaClick(Sender: TObject);
    procedure sbBuscaTurmaClick(Sender: TObject);
    procedure sbBuscaCursoClick(Sender: TObject);
    procedure qyComplAfterOpen(DataSet: TDataSet);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure txtChaveKeyPress(Sender: TObject; var Key: Char);
   private
     alterouDtFim: Boolean;
     alterouDtInicio: Boolean;
     sAnoSem: string;
     bInsere: Boolean;
     TurmasAulas: array[1..7] of array of TAulaDado;
     sPAnoSem: string;
     sPCurso: string;
     sPTurma: string;
     sPDisciplina: string;
     sPBim: string;
     sPGrupo: Integer;
     sPSerie: string;
     sPCSerie: Boolean;
     sPData: TDateTime;
     slPTurmas: TStringList;
     slPTurmaDisc: TStringList;
     slPDisciplinas: TStringList;
     bPRepetido: array of Boolean;
     sCronogramaAnoSem: string;
     sCronogramaCurso: string;
     sCronogramaTurma: string;
     sCronogramaDisciplina: string;
     sCronogramaGrupo: String;
     sNomeProfessor: String;
     iRetorno: Integer;
     FProfessor: TProfessor;
     FTipoProva: TTipoProva;
     opcaoInicial : Integer;
     AulasPadroesAdicionadas: Boolean;
     UltimoEspacamentoLinha, UltimoContaColuna : Integer;
     arrHorarios: TStrings;
     acaoAdicionaCamposAulas: AcaoInsereCampos;
     sListaTurmas: String;
     bUsaListaTurmas: Boolean;
     cdAvlTipoAnterior: Integer;
    procedure GerarAulasConformeGradeHorarios(dataAula: TDateTime);
    procedure verificarTrocaProfessor(codAntigo: Integer);
    function ProvaNecessitaGrupo(const i: Integer;
      const mostraErro: Boolean): Boolean;
    function temProvaCriada(
      const cd_turma: String; const cd_disciplina, nr_anosemestre, bimestre ,cd_grupo: Integer): Boolean;
    function getTipoDigitacaoProvaCriada(
      const cd_turma: String; const cd_disciplina, nr_anosemestre, bimestre ,cd_grupo: Integer): Integer;
    procedure AtualizarDataAvaliacaoInstucionalCronograma;
     procedure IncluirAvlDisc(cd_turma : string; cd_disciplina : Integer; sn_incluir : Boolean = True);
     function GetSQLProfessores(const ASCodCurso: string): string; overload;
     function GetSQLProfessores(const ASCodCurso, ASCodTurma: string): string; overload;
     function GetSQLProfessores(const ASCodCurso, ASCodTurma, ASCodDisc: string): string; overload;
     function verificaExcluirVinculoAvlDisc(cd_turma : string; cd_disciplina, cd_avaliacao : Integer) : Boolean;
     procedure CarregaProfessores;
     procedure AdicionaCamposAulas( acao: AcaoInsereCampos = Padrao );
     procedure AdicionaCamposAulasBase( onchange: Boolean = false );
     procedure AlteraPeriodicidade;
     procedure IncluirCronograma(
       anosemestre: Integer; turma: String; disciplina, professor: Integer;
       data: TDateTime; confirmado: Boolean; valor: Double; horario: Integer; Substituto : Integer; cd_grupo : Integer;
       cd_sala: Integer; ds_sala: String; bimestre : Integer
     );
     procedure AlterarCronograma(
       cd_cronograma, cd_professor: Integer; data: TDateTime;
       cd_horario: Integer; confirmado: Boolean; valor: Double; cd_substituto : Integer;
       cd_sala: Integer; ds_sala: String; bimestre : Integer
     );
     procedure RecarregaDatasDiario();
     procedure RecarregaHorarios();
     procedure IncluirTurmasProfessor(
       anosemestre: Integer; curso, turma: String; disciplina, cd_professor, numeroaulas: Integer
     );

     function utilizaSegundaAula(): Boolean;

     function ExecedeuLimiteProvas(const i: Integer; const mostraErro: Boolean): Boolean;
     

     function GetInfProvaTipo(const cd_avaliacao: String; const cd_avaliacao_tipo: Integer; const campo: String): String;
     function GetQtdProvasTipo( const nr_anosemestre: Integer;
         const cd_turma: String; const cd_disciplina, nr_serie, cd_avaliacao_tipo: Integer ): Integer;

     procedure CriaProvaUltimaAulaCronograma(
        const data: TDate;
        const cd_turma: String;
        const cd_disciplina, cd_professor, nr_anosemestre, cd_grupo, bimestre : Integer;
        const tipoDigitacao : Integer = 0);


     procedure CriaDiarioPrazos(const nr_anosemestre: Integer; const cd_curso, cd_turma: String;
                        const cd_disciplina: Integer;
                        const dt_inicio, dt_fim: TDate;
                        const cd_tipo_prazo : Integer);
     function getCdProfessorGrupo(cd_grupo: Integer): Integer;


     procedure fechaDiario(nr_bimestre, nr_anosemestre, cd_disciplina: Integer; cd_curso, cd_turma: String);

     procedure carregaTipoDigitacao();
     function isValidaBuscaTipoDigitacao(): Boolean;

     function getTipoAulaPadrao(cd_turma: String; cd_disciplina: Integer): Integer; 

   strict private
      FSituacaoGeraCP: Cardinal;
      function GeraCompromissos(const AulaID: Cardinal): Boolean;
      procedure LoadSituacaoGeraCP;
      function ProcuraChaveDuplicada(const ASChave: string): TProva; overload;
      function ProcuraChaveDuplicada(const ASChave: string; const AICodProva: integer):TProva; overload;
      function ProcuraNotaRE( editando : boolean ): boolean;
      function ProcuraNotaSuficiencia( editando : boolean; var slTurmasDisciplinas: TStringList ): boolean;
      function GetConfirmacao(const ASNomeProva, ASNomeProfessor: string): boolean;
      function ValidaHorariosProfessor(): Boolean;
      function checarConflitoDatasCalendario( Const dt_cronograma : TDate) : Boolean;
      function percorreDatasCronograma() : Boolean;
      function EhHorarioValido(const cd_professor, cd_horario, cd_disciplina, nr_anosemestre: Integer;
                  const data: TDate; const cd_turma: String): String;
      procedure verificaUnicoProfessorDisciplina();
      function TrataPrazoCalculado( sql: String; const nr_anosemestre: Integer; const cd_turma: String;
                                          const cd_disciplina: Integer; tipo : TiposPrazos; isUpdate: Boolean ): String;
      function SoNumeros(Const Texto:String):String;
      procedure CalculaValorTotalSituacoes(var campo_multiplicador, campo_multiplicando, campo_total: TUMEditMonetario);
      procedure CarregaConfiguracoesLogistica(const cd_situacao_material_aula : Integer = -999;
         const cd_situacao_transporte : Integer = -999; const cd_situacao_local_aula : Integer = -999;
         const cd_situacao_hospedagem : Integer = -999; const cd_situacao_geren_professor : Integer = -999;
         const cd_situacao_geren_gestor: Integer = -999);
      procedure CarregarSituacoesLogistica(const cd_situacao_material_aula : Integer = -999;
         const cd_situacao_transporte : Integer = -999; const cd_situacao_local_aula : Integer = -999;
         const cd_situacao_hospedagem : Integer = -999; const cd_situacao_geren_professor : Integer = -999;
         const cd_situacao_geren_gestor: Integer = -999);

      procedure SalvarRegistroAula();

      procedure VincularAulaTurmasHorarios(const cd_diario_aula, qtd_aulas: Integer; const reiniciar : Boolean = False);

      procedure ProcessarConflitosHorariosCronograma(const IAulaUnica: Integer = -1);
      function TemConflitosSala(): Boolean;
   public
      sPDataFim: TDateTime;
      iCodColigada: Integer;
      filtro_coligada: Integer;
      qtd_aulas_frequencias : Integer;
      procedure CarregaSituacoesAula;
      procedure carregaTiposAulas(isPorTurma: Boolean; cd_aula_tipo: Integer = 0);
      procedure IncluirProfessorDisc(anosemestre: Integer; curso, turma: String;
         disciplina, cd_professor, numeroaulas: Integer);
      procedure CarregaDataDiario(const nr_anosemestre: Integer;
         const cd_turma: String; const cd_disciplina: Integer; const cd_curso: String);
      procedure setListaTurmas( const UsarListaTurmas: Boolean; const curso: String; const anosemestre: Integer );
      procedure CarregaTiposProva();
      procedure addTiposProvaCombo();
      procedure VerificaTipoEncontrado();
      procedure AtualizarBloquearProva();
      procedure ExcluirTurmasProfessor(const cd_cronograma: Integer);
      procedure DefineInsere(bValor: Boolean);
      function getAnoSemestre(): string;
      procedure SetaAnoSemestre(sValor: string);
      procedure AtualizaAulaDados(sNroAulas: string);
      Function SalvaAulaAtuDados() : Boolean;
      procedure SalvaProvaAtuDados();
      Function InsereAulasDados() : Boolean;
      procedure CarregaAulaDados(iDiaSemana: Byte; const dataAtual : TDateTime);
      procedure InserirAulaDado(iDiaSemana: Byte; sTurma: ShortString; iDisciplina: Integer; iNumAulas: Byte; iProfessor: Integer);
      procedure SelecionaTab(sTab: string);
      procedure setPadrao(saCurso: string; saAnoSem: string = ''; saTurma: string = ''; saDisciplina: string = ''; saBim: String = ''; saSerie: String= '';saCSerie: Boolean= True);
      procedure Processando(bStatus: Boolean);
      procedure CarregaItemBusca();
      procedure CarregaAvaliacaoCronograma();
      procedure AtualizaProvasDados(sNroProva: string);
      procedure SelecionaTurmaDisciplina();
      procedure ListaProvaTurmasDisciplinas();
      procedure InsereProvasDados();
      function ProcuraAulaDados(iDiaSemana: Byte; sChave: string): TAulaDado;
      function ExisteAulaDados(iDiaSemana: Byte; sChave: string): Boolean;
      function chaveDuplicada(sChave:String; iCodProva: integer = 0): Boolean;
      function getRetorno(): Integer;
      procedure setBim(Valor: string);
      procedure setGrupo(Valor: Integer);
      procedure ExecutaCalculoNotas();
      procedure setData(Valor: TDateTime);
      function getData(): TDateTime;
      procedure ExecutaCalculoFreq();
      procedure statusSerie(bStatus: Boolean);
      procedure FiltrarDisciplinas();
      procedure FiltrarGrupos();
      property Professor: TProfessor read FProfessor write FProfessor;
      property TipoProva: TTipoProva read FTipoProva write FTipoProva;
      property opcInicial: Integer read opcaoInicial write opcaoInicial;
      property AcaoIncluirCampos: AcaoInsereCampos read acaoAdicionaCamposAulas write acaoAdicionaCamposAulas;
      procedure bloqueiaCamposGrupoSelecionado();
      procedure atualizaFrequenciasAulas ( bAumenta : Boolean);
      function existeGrupo(nr_anosemestre: Integer; cd_curso: String; cd_turma: String; cd_disciplina: Integer): Boolean;
      function getTipoDigitacao() : Integer;
  end;

var
   frmAulasProvasAcoes: TfrmAulasProvasAcoes;
  valorMaximoAula, opcaoInicial : Integer;
  sn_pode_excluir_avl : Boolean;

implementation

uses
   uFSelecionarCurso, uFSelecionarTurma, uFSelecionarDisciplina, uFSelecionarGrupo, General, uDM,
   uSplash, uFSelecionarPessoa, uUsuario, Main, uFreq, uProgresso, uItemCombo,
   ClassTurmas, ClassCursos, uDiarioAulas, uFSelecionarSala, uTurma, uSala, uHorario, uDisciplina,
   uTurmaProfessorAceite, uProfessores, uIUMDataModule, UFLGTCDespesasResumo;

var
   frmSpl: TfrmSplash;

{$R *.dfm}

procedure TfrmAulasProvasAcoes.sbBuscaCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   { Pesquisar Cursos }
   resultado_filtro := TfrmSelecionarCurso.Filtrar([]);

   if resultado_filtro.filtrado then
   begin
     filtro_coligada := resultado_filtro.cd_coligada;

     sCronogramaAnoSem   := IntToStr(resultado_filtro.nr_anosemestre);
     sCronogramaCurso    := resultado_filtro.cd_curso;
     txtAnoSemestre.text := sCronogramaAnoSem;

     sPCurso  := resultado_filtro.cd_curso;
     sPAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
     
     CarregaItemBusca();

     if pcAulas.ActivePage <> tsCronogramasGerenciar then
         ListaProvaTurmasDisciplinas();

     if Self.pcAulas.ActivePage = tsProvas then
        Self.CarregaProfessores;

     sPTurma := '';
     sCronogramaTurma := '';

     // Se um curso for selecionado, zera a turma/disicplina/grupo
     if Self.pcAulas.ActivePage = tsAulas then
     begin
        sPTurma := '';
        sPDisciplina := '';
        sPGrupo := 0;
        txtTurma.Text := '';
        txtDisciplina.Text := '';
        edGrupoAulas.Text := '';
        txtAProf.Text := '';
        Self.bloqueiaCamposGrupoSelecionado();
     end;     

     if Self.pcAulas.ActivePage = tsProvas then
     begin
        sPTurma := '';
        sPDisciplina := '';
        sPGrupo := 0;
        txtPTurma.Text := '';
        txtPDisciplina.Text := '';
        edGrupoProvas.Text := '';
        txtPProf.Text := '';
        Self.bloqueiaCamposGrupoSelecionado();

        if (Trim(Self.txtPDisciplina.Text) <> '') or (Trim(Self.txtPTurma.Text) <> '') or (Trim(Self.txtPCurso.Text) <> '') then
        begin
           Self.CarregaProfessores;
        end;
        setListaTurmas(true, txtPCurso.Text, StrToInt(sPAnoSem));
        CarregaTiposProva;
     end;

     if Self.pcAulas.ActivePage = tsCronogramasGerenciar then
     begin
        CarregaAvaliacaoCronograma();
     end;

  end;
  statusSerie(True);
end;

procedure TfrmAulasProvasAcoes.sbBuscaTurmaClick(Sender: TObject);
CONST
   SQL_BUSCA_NRO_MAX_AULA = ''+
   'SELECT                                '+
	'  apm.nr_maximo_aulas                 '+
   'FROM                                  '+
	'  avaliacoes_parametros_matriz apm    '+
   'INNER JOIN turmas t ON (              '+
	'  apm.cd_avaliacao = t.cd_avaliacao   '+
   ')                                     '+
   'WHERE                                 '+
   '  t.codigo = :codigo                  '+
   '  AND t.anosemestre = :anosemestre    ';
var
   resultado_filtro : TResultadoFiltroTurma;
   qyNumeroValor: TUMZQuery;
begin
   { Pesquisar Turmas }
   if (Length( sCronogramaCurso ) = 0) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma turma, por causa do Ano/Semestre', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarTurma.Filtrar([bftCurso, bftAnosemestre, bftDepartamento],
      StrToInt( sCronogramaAnoSem ), -1, -1, sCronogramaCurso);

   if not resultado_filtro.filtrado then Exit;

   CarregaItemBusca();

   txtTurma.Text := resultado_filtro.cd_turma;
   txtPSerie.Text := IntToStr(resultado_filtro.nr_serie);

   sPTurma := resultado_filtro.cd_turma;

   ListaProvaTurmasDisciplinas();

  if Self.pcAulas.ActivePage = tsAulas then
  begin
     sPDisciplina := '';
     sPGrupo := 0;
     txtDisciplina.Text := '';
     edGrupoAulas.Text := '';
     txtAProf.Text := '';
     Self.bloqueiaCamposGrupoSelecionado();
     carregaTiposAulas(True);
  end;

  if Self.pcAulas.ActivePage = tsProvas then
  begin
     sPDisciplina := '';
     sPGrupo := 0;
     txtPDisciplina.Text := '';
     edGrupoProvas.Text := '';
     txtPProf.Text := '';
     Self.bloqueiaCamposGrupoSelecionado();

     if (Trim(Self.txtPDisciplina.Text) <> '') or (Trim(Self.txtPTurma.Text) <> '') or (Trim(Self.txtPCurso.Text) <> '') then
     begin
        Self.CarregaProfessores;
     end;
     setListaTurmas(false, txtPCurso.Text, StrToInt(sPAnoSem));
     CarregaTiposProva;
  end;

  if (trim(txtTurma.Text) <> '') or (trim(txtPTurma.Text) <> '') then
  begin
     ckbPSerie.Enabled:= False;
     udPSerie.Enabled:= False;
  end;

  if (trim(txtTurma.Text) <> '') then
  begin
     dm.CriarConsulta(qyNumeroValor);

     qyNumeroValor.SQL.Text := SQL_BUSCA_NRO_MAX_AULA;

     qyNumeroValor.ParamByName('codigo').asString := trim(txtTurma.Text);
     qyNumeroValor.ParamByName('anosemestre').AsInteger := resultado_filtro.nr_anosemestre;

     qyNumeroValor.Open;

     if qyNumeroValor.recordCount > 0 then
     begin
        valorMaximoAula := qyNumeroValor.FieldByName('nr_maximo_aulas').AsInteger; 
     end
     else
     begin
        valorMaximoAula := -1; 
     end;

     try
        if (valorMaximoAula < StrToInt(txtAulas.Text)) and (valorMaximoAula >= 0) and (txtAulas.Text <> '') then
        begin
           txtAulas.Text := IntToStr(valorMaximoAula);
        end;
     except

     end;
  end;
end;

procedure TfrmAulasProvasAcoes.sbFiltroSalaClick(Sender: TObject);
var
   resultadoSala : TResultadoFiltroSala;
begin
   sbFiltroSala.Down := False;
   Application.ProcessMessages;

   resultadoSala := TfrmSelecionarSala.Filtrar([]);

   if NOT(resultadoSala.filtrado) then Exit;

   edNomeSala.Text := resultadoSala.sala.Descricao;
   edNomeSala.Tag := resultadoSala.sala.Codigo;

   ProcessarConflitosHorariosCronograma();
end;

procedure TfrmAulasProvasAcoes.sbLimparSalaClick(Sender: TObject);
begin
   edNomeSala.Text := '';
   edNomeSala.Tag := 0;

   ProcessarConflitosHorariosCronograma();
end;

procedure TfrmAulasProvasAcoes.sbBuscaDisciplinaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroDisciplina;
begin
   { Pesquisar Disciplina }
   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar uma disciplina, por causa do Ano/Semestre', 'Atenção!!', MB_OK);
      Exit;
   end;

   if ( Length(sAnoSem) > 0 ) then
   begin
      resultado_filtro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], sPCurso, StrToInt(sPAnoSem));
   end else begin
      resultado_filtro := TfrmSelecionarDisciplina.Filtrar([bfdCurso], sPCurso);
   end;

  if resultado_filtro.filtrado then
  Begin
     sPDisciplina := IntToStr( resultado_filtro.cd_disciplina );
     sPCurso := resultado_filtro.cd_curso;

     if Self.pcAulas.ActivePage = tsAulas then
     begin
        sPGrupo := 0;
        edGrupoAulas.Text := '';
        txtAProf.Text := '';
        Self.bloqueiaCamposGrupoSelecionado();
        carregaTiposAulas(False);
     end;

     CarregaItemBusca();
     ListaProvaTurmasDisciplinas();
     if Self.pcAulas.ActivePage = tsProvas then
     begin
        sPGrupo := 0;
        edGrupoProvas.Text := '';
        txtPProf.Text := '';
        Self.bloqueiaCamposGrupoSelecionado();

        if (Trim(Self.txtPDisciplina.Text) <> '') or (Trim(Self.txtPTurma.Text) <> '') or (Trim(Self.txtPCurso.Text) <> '') then
        begin
           Self.CarregaProfessores;
        end;
        if Length( trim( sPTurma ) ) = 0 then begin
           setListaTurmas(true, txtPCurso.Text, StrToInt(sPAnoSem));
        end else begin
           setListaTurmas(false, txtPCurso.Text, StrToInt(sPAnoSem));
        end;
        CarregaTiposProva;
     end;
  end;

end;


procedure TfrmAulasProvasAcoes.sbBuscaGrupoAulasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
begin
   { Pesquisar Grupo }
   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar um grupo de atividade', 'Atenção!!', MB_OK);
      Exit;
   end;

   if ( Length(sPTurma) = 0 ) then
   begin
      Mensagem('Você precisa selecionar uma turma antes de selecionar um grupo de atividade', 'Atenção!!', MB_OK);
      Exit;
   end;

   if ( Length(sPDisciplina) = 0 ) then
   begin
      Mensagem('Você precisa selecionar uma disciplina antes de selecionar um grupo de atividade', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarGrupo.Filtrar([bfgCurso, bfgTurma, bfgDisciplina], sPCurso, StrToInt(sPAnoSem), sPTurma, StrToInt(sPDisciplina), -1, -1, 1);

   if resultado_filtro.filtrado then
   begin
      sPGrupo := resultado_filtro.cd_grupo;
      edGrupoAulas.Text := IntToStr(resultado_filtro.cd_grupo);
      txtAProf.Text := IntToStr(resultado_filtro.cd_professor);
      // Se for selecionado um grupo de atividade, não permite selecionar o professor
      // Se for selecionado um grupo de atividade, não permite criar aulas conforme grade de horários
      bloqueiaCamposGrupoSelecionado();
   end;

end;

procedure TfrmAulasProvasAcoes.sbBuscaGrupoProvasClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroGrupo;
begin
   { Pesquisar Grupo }
   if ( Length(sPCurso) = 0 ) then
   begin
      Mensagem('Você precisa selecionar um curso antes de selecionar um grupo de atividade', 'Atenção!!', MB_OK);
      Exit;
   end;

   if ( Length(sPTurma) = 0 ) then
   begin
      Mensagem('Você precisa selecionar uma turma antes de selecionar um grupo de atividade', 'Atenção!!', MB_OK);
      Exit;
   end;

   if ( Length(sPDisciplina) = 0 ) then
   begin
      Mensagem('Você precisa selecionar uma disciplina antes de selecionar um grupo de atividade', 'Atenção!!', MB_OK);
      Exit;
   end;

   resultado_filtro := TfrmSelecionarGrupo.Filtrar([bfgCurso, bfgTurma, bfgDisciplina], sPCurso, StrToInt(sPAnoSem), sPTurma, StrToInt(sPDisciplina), -1, -1, 1);

   if resultado_filtro.filtrado then
   begin
      sPGrupo := resultado_filtro.cd_grupo;
      edGrupoProvas.Text := IntToStr(resultado_filtro.cd_grupo);
      txtPProf.Text := IntToStr(resultado_filtro.cd_professor);
      // Se for selecionado um grupo de atividade, não permite selecionar o professor
      bloqueiaCamposGrupoSelecionado();

      ListaProvaTurmasDisciplinas();
   end;
end;

procedure TfrmAulasProvasAcoes.cbDisciplinasChange(Sender: TObject);
begin
   sCronogramaDisciplina := TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo;
   sPDisciplina := sCronogramaDisciplina;

   RecarregaDatasDiario();

   if ( cbDisciplinas.ItemIndex > 0 ) then
   begin
      FiltrarGrupos();
   end else begin
      cbGrupos.Items.Clear;
      Self.bloqueiaCamposGrupoSelecionado();
   end;

   verificaUnicoProfessorDisciplina();
   ProcessarConflitosHorariosCronograma();
   carregaTipoDigitacao();
end;

procedure TfrmAulasProvasAcoes.cbGruposChange(Sender: TObject);
begin
   if ( cbGrupos.ItemIndex > 0 ) then
   begin
      sCronogramaGrupo := TItemCombo(cbGrupos.Items.Objects[cbGrupos.ItemIndex]).getCodigo;
      sPGrupo := StrToInt(sCronogramaGrupo);

      txtCronogramasProfessor.Text := IntToStr(Self.getCdProfessorGrupo(sPGrupo));
      txtSubstituto.Text := txtCronogramasProfessor.Text;
      Self.bloqueiaCamposGrupoSelecionado();
   end else begin
      sPGrupo := 0;
      txtCronogramasProfessor.Text := '';
      txtSubstituto.Text := '';
      Self.bloqueiaCamposGrupoSelecionado();
   end;
end;

procedure TfrmAulasProvasAcoes.cbHorarioAula1Change(Sender: TObject);
begin
   ProcessarConflitosHorariosCronograma(
      StrToIntDef(StringReplace(TUMComboBox(Sender).Name, 'cbHorarioAula', '', [rfIgnoreCase]), 1)
   );
end;

procedure TfrmAulasProvasAcoes.cbTiposProvasChange(Sender: TObject);
var
   cd_avaliacao_tipo, cd_tipo: Integer;
   arrCdAvaliacao : TStringList;
   cd_avaliacao, snBloqueada: String;
begin
   try
      if bUsaListaTurmas then
         cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sListaTurmas, sPDisciplina, 'cd_avaliacao', True)
      else
         cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sPTurma, sPDisciplina, 'cd_avaliacao');
   except on E: Exception do
   end;

   arrCdAvaliacao := TStringList.Create();

   arrCdAvaliacao.delimiter := ',';
   arrCdAvaliacao.DelimitedText := cd_avaliacao;

   if cbTiposProvas.Items.Count > 0 then
   begin
      cd_avaliacao_tipo := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;
      try
         cd_tipo := StrToInt( GetInfProvaTipo(arrCdAvaliacao.Strings[0], cd_avaliacao_tipo, 'cd_tipo') );
      except
         cd_tipo := 0;
      end;
   end;


   if bInsere then begin
      snBloqueada := GetInfProvaTipo(cd_avaliacao, cd_avaliacao_tipo, 'sn_bloqueada');

      if snBloqueada = '1' then begin
         ckbBloqueiaProva.State := cbChecked;
      end else if snBloqueada = '0' then begin
         ckbBloqueiaProva.State := cbUnchecked;
      end else begin
         ckbBloqueiaProva.State := cbGrayed;
      end;
   end;

   // ATENÇÃO AS LABELS SÃO UTILIZADAS PARA VERIFICAR O TIPO DE PROVA EM OUTRAS PARTES DESSE CÓDIGO 
   // Os tipos são fixos no código
   case cd_tipo of
      1: lbTipoProva.Caption := '(CNS)'; // Compõe nota substituível
      2: lbTipoProva.Caption := '(NCNS)'; // Não compõe nota substituível
      3: lbTipoProva.Caption := '(PS)'; // Prova de suficiência
      4: lbTipoProva.Caption := '(RE)'; // Recuperação da Etapa
      5: lbTipoProva.Caption := '(PI)'; // Prova Interdisciplinar
      else lbTipoProva.Caption := '';
   end;

   bloqueiaCamposGrupoSelecionado();
end;

function TfrmAulasProvasAcoes.chaveDuplicada(sChave: String; iCodProva: Integer = 0): Boolean;
begin
  qyAux2.Close();
  qyAux2.SQL.Clear();
  qyAux2.SQL.Text := 'Select                    '+
                     ' 	count(*) as conta       '+
                     'FROM                      '+
                     '   diario_provas as p     '+
                     'WHERE                     '+
                     '   p.ds_chave = :ds_chave ';

  if iCodProva <> 0 then begin

    qyAux2.SQL.Text := qyAux2.SQL.Text+
                     'AND                       '+
                     ' p.cd_prova <> :cd_prova   ';

    qyAux2.ParamByName('cd_prova').AsInteger:= iCodProva;

  end;
  qyAux2.ParamByName('ds_chave').AsString:= sChave;
  qyAux2.Open();

  result:= true;
  if qyAux2.FieldByName('conta').AsInteger = 0 then
    result:= false;

end;

function TfrmAulasProvasAcoes.checarConflitoDatasCalendario( Const dt_cronograma : TDate): Boolean;
Const
   SQL_CONFLITO_DATAS =
      ' SELECT '
      + '   IF((c.sn_secretaria = "N"),1,0) sn_feriado, '
      + '   c.descricao, '
      + '  DATE_FORMAT(DATE(CONCAT(nr_ano,"-", nr_mes, "-", nr_dia)), "%d/%m/%Y") dt_calendario'
      + ' FROM '
      + '    calendario c '
      + '    INNER JOIN turmas t ON ( t.CD_COLIGADA = c.cd_coligada ) '
      + ' WHERE '
      + '    DATE(CONCAT(nr_ano,"-", nr_mes, "-", nr_dia)) = DATE(:dt_calendario) '
      + '    AND t.curso = :cd_curso AND t.codigo = :cd_turma '
      + '    AND t.anosemestre = :anosemestre ';

   MSG_CONFLITO_DATA =
      'A aula será gerada numa data com um feriado previsto.';
var
   qryConflitoDatas : TUMZQuery;
begin
   result := False;

   DM.CriarConsulta(qryConflitoDatas);

   qryConflitoDatas.Close();
   qryConflitoDatas.SQL.Clear();
   qryConflitoDatas.SQL.Add(SQL_CONFLITO_DATAS);

   qryConflitoDatas.ParamByName('dt_calendario').AsDateTime := dt_cronograma;
   qryConflitoDatas.ParamByName('cd_curso').AsString := trim(txtCronogramasCurso.Text);
   qryConflitoDatas.ParamByName('cd_turma').AsString := trim(txtCronogramaTurma.Text);
   qryConflitoDatas.ParamByName('anosemestre').AsInteger := strtoint( sPAnoSem ) ;

   qryConflitoDatas.Open();

   if ( qryConflitoDatas.FieldByName('sn_feriado').AsInteger = 1) then
   begin

      if not(DM.UsuarioLogado.TemPermissao(
            DM.UsuarioLogado.Pessoa.Codigo,
            'Academico.CadastroCronogramasRestricaoDatas',
            npIncluir,
            False
         )
      )
      then begin
         Mensagem(
            MSG_CONFLITO_DATA
            + 'Data: ' + qryConflitoDatas.FieldByName('dt_calendario').AsString
            + ' - ' + qryConflitoDatas.FieldByName('descricao').AsString
            + #13
            + 'Favor escolha uma nova data!',
            'Atenção!!',
            MB_OK
         );

         result := True;
      end else
      begin
          if Mensagem(
            MSG_CONFLITO_DATA
            + #13
            + 'Data: ' + qryConflitoDatas.FieldByName('dt_calendario').AsString
            + ' - ' + qryConflitoDatas.FieldByName('descricao').AsString
            + #13 + ' Deseja realmente prosseguir?' ,
            'Atenção!',
            MB_ICONQUESTION + MB_YESNO
          ) = ID_NO then
             result := True;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.chkAIClick(Sender: TObject);
var
  pDataAI, pProvaAi, hora  : string;
  FRegExpr: TRegExpr;
  valorData, valorHora, aux, sauce : Integer;
  DataProva : TDateTime;
  sn_dia, sn_duas_aulas  : Boolean;
  qryHorario : TUMZQuery;
begin
if pcAulas.ActivePage = tsCronogramasGerenciar then
begin
  if TCheckBox(Sender).Checked = true then
  begin
    umdtAvaliacao.Visible :=  true;
    cbAvaliacao.Visible := true;
    umAjudaAvaliacao.Visible := true;

    sn_duas_aulas := true;
    if StrToInt( edQtdAulas.Text ) > 2 then
      sn_duas_aulas := false;

    pDataAI := DM.variavel_parametro('padrao_data_ai');
    if( pDataAI <> '0' ) then
    begin

        FRegExpr := TRegExpr.Create;
        FRegExpr.ModifierG := true;
        FRegExpr.Expression := '\[(.*?)\]';
        FRegExpr.Exec(pDataAI);
        if ( FRegExpr.Match[1] = '' ) then
        begin
          valorData := 0;
        end else
        begin
          valorData := StrToInt( FRegExpr.Match[1] );
          FRegExpr.ExecNext();
        end;
        if ( FRegExpr.Match[1] = '' ) then
        begin
          valorHora := 0;
        end else
        begin
          valorHora := StrToInt( FRegExpr.Match[1] );
        end;
        FRegExpr.Destroy;
        // True = dia, False = mês
        sn_dia := true;
        if not ContainsText( AnsiLowerCase(pDataAI), 'dia' ) then
        begin
          sn_dia := false;
        end;
    
        DataProva := dtpDataAula1.getDate;
    
        if ContainsText( AnsiLowerCase(pDataAI), 'ultima aula' ) then
        begin
          if sn_duas_aulas = True then
          begin
           DataProva := dtpDataAula2.getDate;
          end else
          begin
           DataProva := TUMDateTimePicker(sbAulas.Components[sbAulas.ComponentCount - 3]).getDate;
          end;
    
        end;
    
    
    
        FRegExpr := TRegExpr.Create;
        FRegExpr.ModifierG := true;
        FRegExpr.Expression := '[0-9]{2}:[0-9]{2}';
        sauce := 0;
        if ( ContainsText( AnsiLowerCase(pDataAI), 'aula' ) ) and ( ContainsText( AnsiLowerCase(pDataAI), 'hora' ) ) then
        begin
           if cbHorarioAula1.ItemIndex > 0 then
            sauce := strtoint(
                 TItemCombo(
                    cbHorarioAula1.Items.Objects[cbHorarioAula1.ItemIndex]
                 ).getCodigo
                );
           if ContainsText( AnsiLowerCase(pDataAI), 'ultima aula' ) then
           begin
            if sn_duas_aulas = True then
            begin
              if cbHorarioAula2.ItemIndex > 0 then
                sauce := strtoint(
                 TItemCombo(
                    cbHorarioAula2.Items.Objects[cbHorarioAula2.ItemIndex]
                 ).getCodigo
                );
            end else
            begin
              if TUMComboBox(
                          sbAulas.Components[ sbAulas.ComponentCount - 2]
                        ).ItemIndex > 0 then
                sauce := StrToInt( TItemCombo (TUMComboBox(
                        sbAulas.Components[sbAulas.ComponentCount - 2]
                       ).Items.Objects[ TUMComboBox(
                          sbAulas.Components[ sbAulas.ComponentCount - 2]
                        ).ItemIndex ]
                       ).getCodigo );
            end;
           end;
    
           if sauce = 0 then
            sauce := -1;
        end;
    
        if sauce = 0 then
        begin
          FRegExpr.Exec(pDataAI);
          hora := FRegExpr.Match[0];
        end else
        begin
        DM.CriarConsulta(qryHorario);
        with qryHorario do
        begin
          Close();
          SQL.Clear();
          SQL.Add(
          'select hr_fim from horarios where codigo = :codigo'
          );

          ParamByName('codigo').AsInteger := sauce;
          Open();
        end;

        hora := qryHorario.FieldByName('hr_fim').AsString;

      end;
       if hora <> '' then
       begin

         if ContainsText( AnsiLowerCase(pDataAI), 'minutos' ) then
         begin
          aux :=  StrToInt( Copy( hora, 4, 2 ) ) + valorHora ;
          if aux > 59 then
          begin
            hora := IntToStr( StrToInt( Copy( hora, 0, 2 )) + 1 ) + Copy( hora, 3);
            aux := aux - 60;
          end;
          if( aux < 10 ) then
            hora :=  Copy( hora, 0, 3 ) + '0' + IntToStr( aux )
          else
            hora := Copy( hora, 0, 3 ) + IntToStr( aux );
         end
         else if ContainsText( AnsiLowerCase(pDataAI), 'hora' ) then
         begin
          aux :=  StrToInt( Copy( hora, 0, 2 ) ) + valorHora  ;

          if aux > 23 then
          begin
            DataProva := IncDay( DataProva, 1 );
            aux := aux - 24;
          end;
          if( aux < 10 ) then
            hora := '0' + IntToStr( aux ) + Copy( hora, 3 )
          else
            hora := IntToStr( aux ) + Copy( hora, 3 );

         end;
       end
       else
       begin
         hora := '00:00';
       end;


      FRegExpr.Destroy;

      if sn_dia then
      begin
        DataProva := IncDay( DataProva , valorData );
      end
      else
      begin
        DataProva := IncMonth( DataProva, valorData );
      end;
      umdtAvaliacao.Text := FormatDateTime( 'dd/mm/yyyy ', DataProva ) + hora;
    end;
  end
  else
  begin
    umdtAvaliacao.Visible :=  false;
    cbAvaliacao.Visible := false;
    umAjudaAvaliacao.Visible := false;
  end;
end;
end;

procedure TfrmAulasProvasAcoes.ckbConfGradeClick(Sender: TObject);
begin
//   meConteudo.Enabled := not ckbConfGrade.Checked;
   udAulas.Enabled := not ckbConfGrade.Checked;
   umdtDataFim.Enabled := ckbConfGrade.Checked;
   Label8.Enabled := ckbConfGrade.Checked;
   edGrupoAulas.Enabled := not ckbConfGrade.Checked;
   sbBuscaGrupoAulas.Enabled := not ckbConfGrade.Checked;
   if ckbConfGrade.Checked = True then
   begin
      edGrupoAulas.Text := '';
   end;
   cbTipoAula.Enabled := not(ckbConfGrade.Checked);
end;


procedure TfrmAulasProvasAcoes.ckbCriaProvaUltimaAulaClick(Sender: TObject);
begin
   carregaTipoDigitacao();
end;

procedure TfrmAulasProvasAcoes.ckbPSerieClick(Sender: TObject);
begin
  udPSerie.Enabled := ckbPSerie.Checked;
  ListaProvaTurmasDisciplinas;
end;

procedure TfrmAulasProvasAcoes.DefineInsere(bValor: Boolean);
begin
   bInsere := bValor;
   //sbBuscaCurso.Enabled := bValor;
   //sbBuscaTurma.Enabled := bValor;
   //sbBuscaDisciplina.Enabled := bValor;
   ckbConfGrade.Enabled := bValor;
   udAulas.Enabled := not bValor;

   Label7.Caption := '';
   
   if txtBim.Text = '' then
     txtBim.Text := '1';
   if txtAulas.Text = '' then
      txtAulas.Text := '2';
   if txtPBim.text = '' then
      txtPBim.Text := '1';
   if txtPSerie.Text = '' then
      txtPSerie.Text := '1';

   clbPTD.Enabled := bValor;
   btnNenhuma.Enabled := bValor;
   btnTodas.Enabled := bValor;
   txtPProf.Visible := not bValor;
   lblPProf.Visible := not bValor;

   // Bloqueia os filtros de CURSO/TURMA/DISCIPLINA/GRUPO
   txtPCurso.Enabled := bValor;
   txtPTurma.Enabled := bValor;
   txtPDisciplina.Enabled := bValor;
   edGrupoProvas.Enabled := bValor;

   SpeedButton1.Enabled := bValor;
   SpeedButton2.Enabled := bValor;
   SpeedButton3.Enabled := bValor;
   SpeedButton5.Enabled := bValor;
   sbBuscaGrupoProvas.Enabled := bValor;
end;

procedure TfrmAulasProvasAcoes.dtpDataAula1ChangeDate(Sender: TObject);
begin
   if Sender <> nil then
   begin
      ProcessarConflitosHorariosCronograma(
         StrToIntDef(StringReplace(TUMDateTimePicker(Sender).Name, 'dtpDataAula', '', [rfIgnoreCase]), 1)
      );
   end;
   RecarregaDatasDiario();
   AtualizarDataAvaliacaoInstucionalCronograma();
end;

procedure TfrmAulasProvasAcoes.dtpDataAula2ChangeDate(Sender: TObject);
begin
   AtualizarDataAvaliacaoInstucionalCronograma();
end;

procedure TfrmAulasProvasAcoes.dtpDtFimDiarioChange(Sender: TObject);
begin
   alterouDtFim := true;
end;

procedure TfrmAulasProvasAcoes.dtpDtInicioDiarioChange(Sender: TObject);
begin
   alterouDtInicio := true;
end;

procedure TfrmAulasProvasAcoes.edmKmExit(Sender: TObject);
begin
   CalculaValorTotalSituacoes(edmKm, edmValorKm, edmTotalKm);
end;

procedure TfrmAulasProvasAcoes.edmKmKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   CalculaValorTotalSituacoes(edmKm, edmValorKm, edmTotalKm);
end;

procedure TfrmAulasProvasAcoes.edmQtdDiariasHospedagemExit(Sender: TObject);
begin
   CalculaValorTotalSituacoes(edmQtdDiariasHospedagem, edmVlDiariaHospedagem, edmTotalHospedagem);
end;

procedure TfrmAulasProvasAcoes.edmQtdDiariasHospedagemKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   CalculaValorTotalSituacoes(edmQtdDiariasHospedagem, edmVlDiariaHospedagem, edmTotalHospedagem);
end;

procedure TfrmAulasProvasAcoes.edmQtdDiariasLocalExit(Sender: TObject);
begin
   CalculaValorTotalSituacoes(edmQtdDiariasLocal, edmVlDiariaLocal, edmTotalLocal);
end;

procedure TfrmAulasProvasAcoes.edmQtdDiariasLocalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   CalculaValorTotalSituacoes(edmQtdDiariasLocal, edmVlDiariaLocal, edmTotalLocal);
end;

procedure TfrmAulasProvasAcoes.edmQtdDiariasMaterialExit(Sender: TObject);
begin
   CalculaValorTotalSituacoes(edmQtdDiariasMaterial, edmVlDiariaMaterial, edmTotalMaterial);
end;

procedure TfrmAulasProvasAcoes.edmQtdDiariasMaterialKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   CalculaValorTotalSituacoes(edmQtdDiariasMaterial, edmVlDiariaMaterial, edmTotalMaterial);
end;

procedure TfrmAulasProvasAcoes.edQtdAulasChange(Sender: TObject);
begin
   if AcaoIncluirCampos = Editar then
   begin
      if txtCronogramasProfessor.Text <> '' then
      begin
         AdicionaCamposAulasBase( true );
//         AtualizarDataAvaliacaoInstucionalCronograma();
          CarregaAvaliacaoCronograma;
      end;
   end
   else
      AdicionaCamposAulas();
end;

procedure TfrmAulasProvasAcoes.edQtdAulasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(key in ['0'..'9']) then
   begin
      key := #0;
   end;
end;

procedure TfrmAulasProvasAcoes.SetaAnoSemestre(sValor: string);
begin
   Self.sAnoSem := sValor;
end;

procedure TfrmAulasProvasAcoes.AdicionaCamposAulas( acao: AcaoInsereCampos = Padrao );
var
   I, IData, J, espacoLinhas, espacoColunas, contaColuna: Integer;
   aula, nomeComponente: String;
   adicionaAula: Boolean;
   
   lbAula: TLabel;
   dtpDataAula: TUMDateTimePicker;
   cbHorarioAula: TUMComboBox;
   umAjudaAula: TUMAjuda;

   dataNow: TDate;
begin
   if acao = Limpar then
   begin
      dtpDataAula1.setDate(Now);
      dtpDataAula2.setDate(Now);
      cbHorarioAula1.ItemIndex := 0;
      cbHorarioAula2.ItemIndex := 0;
      for J := (sbAulas.ComponentCount - 1) downto 0 do
      begin
         sbAulas.Components[J].Destroy;
      end;
   end;

   contaColuna   := 0;
   espacoLinhas  := 5;
   espacoColunas := 0;

   dtpDataAula2.Enabled := (strtoint(edQtdAulas.Text) > 1);
   cbHorarioAula2.Enabled := (strtoint(edQtdAulas.Text) > 1);

   { Procedimento para inserir os campos de aulas na tela }
   for I := 3 to strtoint(Self.edQtdAulas.Text) do
   begin
      aula := inttostr(I);
      Inc( contaColuna );
      adicionaAula := True;

      if (sbAulas.FindComponent('lbAula'+aula) <> nil) AND
         (sbAulas.FindComponent('lbAula'+aula) is TLabel) then
      begin
         adicionaAula := False;
      end;

      { Somente será adicionado os componentes, se eles não existirem,
        não é possível utilizar if not adicionaAula then continue;
        pois no for é calculado a posição do próximo componente }
      if adicionaAula then
      begin
         // adicionando o label informativo. 1ª aula, 2ª aula, ...
         lbAula := TLabel.Create( sbAulas );
         with lbAula do
         begin
            Visible     := false;
            Parent      := sbAulas;
            Alignment   := taRightJustify;
            Caption     := aula + 'ª aula:';
            Width       := 50;
            Name        := 'lbAula' + aula;
            Left        := 2 + espacoColunas;
            Top         := pnOrientacaoTopo.Top + espacoLinhas + 3;
            Tag         := 0;
         end;

         // adicionando o datetimepicker da data
         dtpDataAula := TUMDateTimePicker.Create( sbAulas );
         with dtpDataAula do
         begin
            Visible        := false;
            Parent         := sbAulas;
            Width          := 83;
            Name           := 'dtpDataAula' + aula;
            Left           := lbAula.Left + lbAula.Width + 2;
            Top            := pnOrientacaoTopo.Top + espacoLinhas;
            OnChangeDate   := dtpDataAula1ChangeDate;

            if (utilizaSegundaAula) then
            begin
               if (I MOD 2 = 0) then
               begin
                  dataNow := dtpDataAula2.getDate;
                  IData := Trunc(I/2);
               end
               else
               begin
                  dataNow := dtpDataAula1.getDate;
                  if I > 1 then
                     IData := Trunc((I+1)/2)
                  else
                     IData := I;
               end;
            end
            else
            begin
               dataNow := dtpDataAula1.getDate;
               IData := I;
            end;

            case rgPeriodicidade.ItemIndex of
               1: Date     := dataNow + (7 * (IData-1));
               2: Date     := dataNow + (14 * (IData-1));
               else Date   := dataNow;
            end;

            If(aula >= '24') then
            begin
               InverterPosicaoCalendario := true;
            end;
         end;

         // adicionando o datetimepicker da hora
         cbHorarioAula := TUMComboBox.Create( sbAulas );
         with cbHorarioAula do
         begin
            Visible     := False;
            Parent      := sbAulas;
            Width       := 100;
            Name        := 'cbHorarioAula' + aula;
            Style       := csDropDownList;
            Left        := dtpDataAula.Left + dtpDataAula.Width + 2;
            Top         := pnOrientacaoTopo.Top + espacoLinhas;
            OnChange    := cbHorarioAula1Change;
            Items.Clear;
            if arrHorarios <> nil then
               Items.Assign( arrHorarios );
            if rgPeriodicidade.ItemIndex > 0 then
            begin
               if (I MOD 2 = 0) AND (utilizaSegundaAula()) then
                  ItemIndex := cbHorarioAula2.ItemIndex
               else
                  ItemIndex := cbHorarioAula1.ItemIndex;
            end
            else
               ItemIndex   := 0;
         end;

         umAjudaAula := TUMAjuda.Create( sbAulas );
         with umAjudaAula do
         begin
            Visible        := False;
            Parent         := sbAulas;
            Name           := 'umAjudaAula' + aula;
            Left           := cbHorarioAula.Left + cbHorarioAula.Width + 2;
            Top            := pnOrientacaoTopo.Top + espacoLinhas;
            Picture        := umAjudaModeloHorarios.Picture;
            Proportional   := umAjudaModeloHorarios.Proportional;
            Width          := umAjudaModeloHorarios.Width;
            Height         := umAjudaModeloHorarios.Height;
            Position       := umAjudaModeloHorarios.Position;
         end;

         // Seta nil para os objetos criados
         lbAula.Visible          := True;
         dtpDataAula.Visible     := True;
         cbHorarioAula.Visible   := True;

         lbAula         := nil;
         dtpDataAula    := nil;
         cbHorarioAula  := nil;
         umAjudaAula    := nil;
      end;

      // Calcula o espaçamento entre linhas e colunas (campos da aula)
      if ( contaColuna = 3 ) then
      begin
         espacoLinhas := espacoLinhas + 40;
         espacoColunas := 0;
         contaColuna := 0;
      end else
         espacoColunas := espacoColunas + 267;
   end;

   aula := '';
   for J := (sbAulas.ComponentCount - 1) downto 0 do
   begin
      nomeComponente := sbAulas.Components[J].Name;
      if ( Pos( 'lbAula', nomeComponente ) > 0 ) then
      begin
         aula := StringReplace( nomeComponente, 'lbAula', '', [] );
      end else if ( Pos( 'dtpDataAula', nomeComponente ) > 0 ) then
      begin
         aula := StringReplace( nomeComponente, 'dtpDataAula', '', [] );
      end else if ( Pos( 'cbHorarioAula', nomeComponente ) > 0 ) then
      begin
         aula := StringReplace( nomeComponente, 'cbHorarioAula', '', [] );
      end else if ( Pos( 'umAjudaAula', nomeComponente ) > 0 ) then
      begin
         aula := StringReplace( nomeComponente, 'umAjudaAula', '', [] );
      end else
         aula := '';

      if ( aula <> '' ) AND (strtoint(aula) > strtoint(edQtdAulas.Text)) then
         sbAulas.Components[J].Destroy;
   end;

   RecarregaDatasDiario();
   ProcessarConflitosHorariosCronograma();
end;

procedure TfrmAulasProvasAcoes.AdicionaCamposAulasBase( onchange: Boolean = false );
var
   qyAulasCronogramas: TUMZQuery;
   I, contaColuna, espacoLinhas, espacoColunas: Integer;
   aula: String;

   lbAula : TLabel;
   dtpDataAula: TUMDateTimePicker;
   cbHorarioAula: TUMComboBox;
   umAjudaAula: TUMAjuda;
begin
   DM.CriarConsulta( qyAulasCronogramas );

   with qyAulasCronogramas do
   begin
      Close;
      SQL.Clear;

      SQL.Add( ' SELECT dc.cd_cronograma, dc.dt_cronograma, dc.cd_horario ' );

      SQL.Add( ' FROM diario_cronogramas dc ' );
      SQL.Add( '      INNER JOIN horarios hs ON ( hs.codigo = dc.cd_horario ) ' );
      
      SQL.Add( ' WHERE dc.anosemestre = :anosemestre AND cd_professor = :professor AND ' );
      SQL.Add( ' dc.turma = :turma AND dc.disciplina = :disciplina AND dc.bimestre = :bimestre ' );

      SQL.Add( ' ORDER BY dc.dt_cronograma ' );

      ParamByName( 'anosemestre' ).AsInteger := strtoint( sPAnoSem );
      ParamByName( 'turma' ).AsString        := sPTurma;
      ParamByName( 'disciplina' ).AsInteger  := StrToInt( sPDisciplina );
      ParamByName( 'professor' ).AsInteger   := strtoint( txtCronogramasProfessor.Text );
      ParamByName( 'bimestre' ).AsInteger   := strtoint( edBimestre.Text );

      Open;

      if not onchange then      
         edQtdAulas.Text := inttostr( RecordCount );

      First;
   end;

   if not qyAulasCronogramas.Eof then
   begin

      lbAula1.Tag := qyAulasCronogramas.FieldByName( 'cd_cronograma' ).AsInteger;
      dtpDataAula1.Date := qyAulasCronogramas.FieldByName( 'dt_cronograma' ).AsDateTime;

      for I := 0 to cbHorarioAula1.Items.Count - 1 do
         if TItemCombo(cbHorarioAula1.Items.Objects[I]).getCodigo() = qyAulasCronogramas.FieldByName( 'cd_horario' ).AsString then
         begin
            cbHorarioAula1.ItemIndex := I;
            break;
         end;

      if (strtoint(edQtdAulas.Text) > 1) AND (qyAulasCronogramas.RecordCount > 1) then
      begin
         qyAulasCronogramas.Next;

         lbAula2.Tag := qyAulasCronogramas.FieldByName( 'cd_cronograma' ).AsInteger;
         dtpDataAula2.Date := qyAulasCronogramas.FieldByName( 'dt_cronograma' ).AsDateTime;

         for I := 0 to cbHorarioAula2.Items.Count - 1 do
            if TItemCombo(cbHorarioAula2.Items.Objects[I]).getCodigo() = qyAulasCronogramas.FieldByName( 'cd_horario' ).AsString then
            begin
               cbHorarioAula2.ItemIndex := I;
               break;
            end;
      end;
      
   end;

   for I := sbAulas.ComponentCount - 1 downto 0 do
   begin
      sbAulas.Components[I].Destroy;
   end;

   dtpDataAula2.Enabled := (strtoint(edQtdAulas.Text) > 1);
   cbHorarioAula2.Enabled := (strtoint(edQtdAulas.Text) > 1);

   contaColuna   := 0;
   espacoLinhas  := 5;
   espacoColunas := 0;

   { Cria os objetos(Label, DateTimePicker, Combobox) das aulas, vindo do banco }
   qyAulasCronogramas.Next;
   while not qyAulasCronogramas.Eof do
   begin
      if (not onchange) OR ( onchange AND ( qyAulasCronogramas.RecNo <= strtoint(edQtdAulas.Text) ) ) then
      begin
         aula := inttostr( qyAulasCronogramas.RecNo );
         Inc( contaColuna );

         // adicionando o label informativo. 1ª aula, 2ª aula, ...
         lbAula := TLabel.Create( sbAulas );
         with lbAula do
         begin
            Visible     := false;
            Parent      := sbAulas;
            Alignment   := taRightJustify;
            Caption     := aula + 'ª aula:';
            Width       := 50;
            Name        := 'lbAula' + aula;
            Left        := 2 + espacoColunas;
            Top         := pnOrientacaoTopo.Top + espacoLinhas + 3;
            Tag         := qyAulasCronogramas.FieldByName( 'cd_cronograma' ).AsInteger;
         end;

         // adicionando o datetimepicker da data
         dtpDataAula := TUMDateTimePicker.Create( sbAulas );
         with dtpDataAula do
         begin
            Visible        := false;
            Parent         := sbAulas;
            Width          := 83;
            Name           := 'dtpDataAula' + aula;
            Left           := lbAula.Left + lbAula.Width + 2;
            Top            := pnOrientacaoTopo.Top + espacoLinhas;
            setDate(qyAulasCronogramas.FieldByName( 'dt_cronograma' ).AsDateTime);
            OnChangeDate   := dtpDataAula1ChangeDate;
            If(aula >= '24') then
            begin
               InverterPosicaoCalendario := true;
            end;
         end;

         // adicionando o datetimepicker da hora
         cbHorarioAula := TUMComboBox.Create( sbAulas );
         with cbHorarioAula do
         begin
            Visible     := false;
            Parent      := sbAulas;
            Width       := 100;
            Name        := 'cbHorarioAula' + aula;
            Style       := csDropDownList;
            Left        := dtpDataAula.Left + dtpDataAula.Width + 2;
            Top         := pnOrientacaoTopo.Top + espacoLinhas;
            OnChange    := cbHorarioAula1Change;
            Items.Clear;
            if arrHorarios <> nil then
               Items.Assign( arrHorarios );
            if strtoint(aula) <= qyAulasCronogramas.RecordCount then
               for I := 0 to Items.Count - 1 do
                  if TItemCombo(Items.Objects[I]).getCodigo() = qyAulasCronogramas.FieldByName( 'cd_horario' ).AsString then
                  begin
                     ItemIndex := I;
                     break;
                  end
            else
            begin
               if rgPeriodicidade.ItemIndex > 0 then
                  ItemIndex := cbHorarioAula1.ItemIndex
               else
                  ItemIndex   := 0;
            end;
         end;

         umAjudaAula := TUMAjuda.Create( sbAulas );
         with umAjudaAula do
         begin
            Visible        := false;
            Parent         := sbAulas;
            Name           := 'umAjudaAula' + aula;
            Left           := cbHorarioAula.Left + cbHorarioAula.Width + 2;
            Top            := pnOrientacaoTopo.Top + espacoLinhas;
            Picture        := umAjudaModeloHorarios.Picture;
            Proportional   := umAjudaModeloHorarios.Proportional;
            Width          := umAjudaModeloHorarios.Width;
            Height         := umAjudaModeloHorarios.Height;
            Position       := umAjudaModeloHorarios.Position;
         end;

         // Seta nil para os objetos criados
         lbAula.Visible          := True;
         dtpDataAula.Visible     := True;
         cbHorarioAula.Visible   := True;

         lbAula         := nil;
         dtpDataAula    := nil;
         cbHorarioAula  := nil;
         umAjudaAula    := nil;

         // Calcula o espaçamento entre linhas e colunas (campos da aula)
         if ( contaColuna = 3 ) then
         begin
            espacoLinhas := espacoLinhas + 40;
            espacoColunas := 0;
            contaColuna := 0;
         end else
            espacoColunas := espacoColunas + 267;

         qyAulasCronogramas.Next;
      end
      else if ( onchange AND ( qyAulasCronogramas.RecNo > strtoint(edQtdAulas.Text) ) ) then
      begin
         qyAulasCronogramas.Next;
      end;
   end;

   if strtoint(edQtdAulas.Text) > qyAulasCronogramas.RecordCount then
      AdicionaCamposAulas()
   else
      ProcessarConflitosHorariosCronograma();
end;

procedure TfrmAulasProvasAcoes.AlteraPeriodicidade;
var
   I, IData, numeroDias, aula, aulaMinima: Integer;
   nomeComponente: String;
begin
   case rgPeriodicidade.ItemIndex of
      1: numeroDias := 7;
      2: numeroDias := 14;
      else numeroDias := 0;
   end;

   if utilizaSegundaAula() then
      aulaMinima := 2
   else
      aulaMinima := 1;


   if ( numeroDias >= 0 ) then
   begin
      IData := 0;

      // Ajusta primeira aula
      if not utilizaSegundaAula() then
      begin
         dtpDataAula2.Date := dtpDataAula1.Date + (numeroDias);
         cbHorarioAula2.ItemIndex := cbHorarioAula1.ItemIndex;
      end;

      // Atualiza a data da avaliação institucional no cronograma
      AtualizarDataAvaliacaoInstucionalCronograma;

      for I := (sbAulas.ComponentCount - 1) downto 0 do
      begin
         nomeComponente := sbAulas.Components[I].Name;
         if ( Pos( 'dtpDataAula', nomeComponente ) > 0 ) then
         begin
            aula := strtoint(StringReplace( nomeComponente, 'dtpDataAula', '', [] ));
            if ( aula > aulaMinima ) AND (aula MOD 2 = 0) AND (utilizaSegundaAula()) then
            begin

               IData := Trunc(aula/2);

               TUMDateTimePicker(sbAulas.Components[I]).Date := dtpDataAula2.Date + (numeroDias * (IData-1));
            end
            else if (( aula > aulaMinima ) AND (aula MOD 2 <> 0) OR not (utilizaSegundaAula())) then
            begin

               if (aula > 1) AND (utilizaSegundaAula()) then
                  IData := Trunc((aula+1)/2)
               else
                  IData := aula;
               TUMDateTimePicker(sbAulas.Components[I]).Date := dtpDataAula1.Date + (numeroDias * (IData-1));
            end;
         end else if ( Pos( 'cbHorarioAula', nomeComponente ) > 0 ) then
         begin
            aula := strtoint(StringReplace( nomeComponente, 'cbHorarioAula', '', [] ));

            if (aula > aulaMinima) then
            begin
               if ( aula MOD 2 <> 0 ) then
               begin
                  TUMComboBox(sbAulas.Components[I]).ItemIndex := cbHorarioAula1.ItemIndex;
               end;

               if ( aula MOD 2 = 0 ) then
               begin
                  if (utilizaSegundaAula()) then
                     TUMComboBox(sbAulas.Components[I]).ItemIndex := cbHorarioAula2.ItemIndex
                  else
                     TUMComboBox(sbAulas.Components[I]).ItemIndex := cbHorarioAula1.ItemIndex;
               end;
            end;
         end;
                  
      end;
   end;

   ProcessarConflitosHorariosCronograma();

   RecarregaDatasDiario();
end;

procedure TfrmAulasProvasAcoes.AlterarCronograma(cd_cronograma,
  cd_professor: Integer; data: TDateTime; cd_horario: Integer;
  confirmado: Boolean; valor: Double;  cd_substituto : Integer;
  cd_sala: Integer; ds_sala: String; bimestre : Integer);
var
   logDesc: String;
   qyAlteraCronograma: TUMZQuery;
   qryProfessorAntigo : TUMZQuery;
begin
   DM.CriarConsulta( qyAlteraCronograma );
   DM.CriarConsulta( qryProfessorAntigo);
   qryProfessorAntigo.SQL.Text := ''+
   ' SELECT dc.cd_professor, tp.cd_turmaprofessor ' +
   ' FROM diario_cronogramas dc ' +
   '      LEFT JOIN turmasprofessores tp ON ( ' +
   '         tp.anosemestre = dc.anosemestre AND tp.turma = dc.turma AND ' +
   '         tp.disciplina = dc.disciplina AND tp.professor = dc.cd_professor ' +
   '      ) ' +
   ' WHERE dc.cd_cronograma = :cd_cronograma ';
   qryProfessorAntigo.ParamByName('cd_cronograma').AsInteger := cd_cronograma;
   qryProfessorAntigo.Open;

   with qyAlteraCronograma do
   begin
      Close;
      SQL.Clear;

      if cd_cronograma > 0 then
      begin
         SQL.Add( ' UPDATE diario_cronogramas ' );
         SQL.Add( '    SET dt_cronograma = :data, ' );
         SQL.Add( '        cd_horario = :cd_horario, ' );
         SQL.Add( '        sn_confirmado = :confirmado, ' );
         SQL.Add( '        nr_valor = :valor, ' );
         SQL.Add( '        cd_professor = :cd_professor, ' );
         SQL.Add( '        cd_sala = :cd_sala, ' );
         SQL.Add( '        ds_sala = :ds_sala, ' );
         SQL.Add( '        cd_prof_substituto = :cd_prof_substituto,');
         SQL.Add( '        bimestre = :bimestre');
         SQL.Add( ' WHERE ' );
         SQL.Add( '    cd_cronograma = :cd_cronograma ' );

         ParamByName( 'data' ).AsDate := data;
         ParamByName( 'cd_horario' ).AsInteger := cd_horario;
         if ( confirmado ) then
            ParamByName( 'confirmado' ).AsInteger := 1
         else
            ParamByName( 'confirmado' ).AsInteger := 0;
         ParamByName( 'valor' ).AsFloat := valor;

         ParamByName( 'cd_cronograma' ).AsInteger := cd_cronograma;
         ParamByName( 'cd_professor' ).AsInteger := cd_professor;

         if cd_sala > 0 then
         begin
            ParamByName( 'cd_sala' ).AsInteger := cd_sala;
         end else begin
            ParamByName( 'cd_sala' ).Clear();
         end;

         ParamByName( 'ds_sala' ).AsString := ds_sala;
         ParamByName( 'cd_prof_substituto' ).AsInteger := cd_substituto;
         ParamByName( 'bimestre' ).AsInteger := bimestre;

         ExecSQL;

         // Inserir log de inclusão dos cronogramas
         logDesc := 'Alterado o cronograma: '+IntToStr(cd_cronograma)+' (cd_cronograma)'+CHR(13);
         logDesc := logDesc + 'Anosemestre: '+qCronograma.FieldByName( 'anosemestre' ).AsString+', '+CHR(13);
         logDesc := logDesc + 'Turma: '+qCronograma.FieldByName('turma').AsString+', ';
         logDesc := logDesc + 'Disciplina: '+qCronograma.FieldByName('disciplina').AsString+', '+CHR(13);
         logDesc := logDesc + 'Data: '+FormatDateTime('dd/mm/yyyy', qCronograma.FieldByName('dt_cronograma').AsDateTime)+' => '+FormatDateTime('dd/mm/yyyy', ParamByName( 'data' ).AsDateTime)+CHR(13);
         logDesc := logDesc + 'Horario: '+qCronograma.FieldByName('cd_horario').AsString+' => '+ParamByName( 'cd_horario' ).AsString+CHR(13);
         logDesc := logDesc + 'Confirmado: '+qCronograma.FieldByName('sn_confirmado').AsString+' => '+ParamByName( 'confirmado' ).AsString+CHR(13);
         logDesc := logDesc + 'Valor: '+qCronograma.FieldByName('nr_valor').AsString+' => '+ParamByName( 'valor' ).AsString+CHR(13);
         logDesc := logDesc + 'Professor: '+qCronograma.FieldByName('cd_professor').AsString+' => '+ParamByName( 'cd_professor' ).AsString+CHR(13);
         logDesc := logDesc + 'Cód. Sala: '+qCronograma.FieldByName('cd_sala').AsString+' => '+ParamByName( 'cd_sala' ).AsString+CHR(13);
         logDesc := logDesc + 'Sala: '+qCronograma.FieldByName('ds_sala').AsString+' => '+ParamByName( 'ds_sala' ).AsString+CHR(13);
         logDesc := logDesc + 'Professor Substituto: '+qCronograma.FieldByName('cd_prof_substituto').AsString+' => '+ParamByName( 'cd_prof_substituto' ).AsString+CHR(13);
         logDesc := logDesc + 'Bimestre: '+qCronograma.FieldByName('bimestre').AsString+' => '+ParamByName( 'bimestre' ).AsString;
         logDesc := logDesc + CHR(13) + '[Acadêmico]';

         { Insere log de alteração de aulas }
         DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_CRONOGRAMA, logDesc, ParamByName( 'cd_professor' ).AsInteger);

         SQL.Clear();
         SQL.Add( ' UPDATE turmasprofessores ' );
         SQL.Add( '    SET professor = :cd_professor ' );
         SQL.Add( ' WHERE ((anosemestre, turma, disciplina ) =  ' );
         SQL.Add( '       (SELECT anosemestre, turma, disciplina FROM diario_cronogramas WHERE cd_cronograma = :cd_cronograma GROUP BY anosemestre, turma, disciplina)) and professor= :cd_professor_origem' );

         ParamByName( 'cd_professor_origem').AsInteger := qryProfessorAntigo.FieldByName('cd_professor').AsInteger;
         ParamByName( 'cd_cronograma' ).AsInteger := cd_cronograma;
         ParamByName( 'cd_professor' ).AsInteger := cd_professor;

         ExecSQL;

         if qryProfessorAntigo.FieldByName('cd_turmaprofessor').AsInteger > 0 then
         begin
            TTurmaProfessorAceite.RedefineProfessor(
               qryProfessorAntigo.FieldByName('cd_turmaprofessor').AsInteger,
               cd_professor
            );
         end;
      end;      
   end;
end;

procedure TfrmAulasProvasAcoes.AtualizaAulaDados(sNroAulas: string);
var
   I, cd_situacao_material_aula, cd_situacao_transporte, cd_situacao_local_aula,
   cd_situacao_hospedagem, cd_situacao_gerenc_prof, cd_situacao_gerenc_gest : Integer;
begin
   with qyAux do
   begin
      Close();
      SQL.Clear();
      SQL.Add(''+
         'SELECT                                                                       '+
         '  anosemestre, turma, disciplina, bimestre, cd_diario_aula,                  '+
         '  nro_aula, qtd_aulas, data, conteudo, sn_bloqueado, cd_professor,           '+
         '  conteudo,me_material_aula, me_transporte,me_local_aula,me_hospedagem,      '+
         '  me_gerenc_prof,me_gerenc_gest,me_observacao, cd_situacao,                  '+
         '  cd_situacao_material_aula, cd_situacao_transporte, cd_situacao_local_aula, '+
         '  cd_situacao_hospedagem, cd_situacao_gerenc_prof, cd_situacao_gerenc_gest,  '+
         '  nr_qtd_diarias_material, vl_diaria_material, vl_total_material,            '+
         '  nr_qtd_diarias_hospedagem, vl_diaria_hospedagem, vl_total_hospedagem,      '+
         '  nr_qtd_diarias_local, vl_diaria_local, vl_total_local, cd_aula_tipo,       '+
         '  nr_quilometragem, vl_km, vl_total_transporte, cd_grupo, sn_aula_compartilhada '+
         'FROM                                                                         '+
         '  diario_aulas                                                               '+
         'WHERE                                                                        '+
         '  anosemestre = :anosem AND turma = :turma AND disciplina = :disciplina      '+
         '  AND bimestre = :bimestre AND nro_aula = :nro_aula                          '+
      '');
      ParamByName('anosem').AsInteger        := StrToInt(sAnoSem);
      ParamByName('turma').AsString          := txtTurma.Text;
      ParamByName('disciplina').AsInteger    := StrToInt(txtDisciplina.Text);
      ParamByName('bimestre').AsInteger      := StrToInt(txtBim.Text);
      ParamByName('nro_aula').AsInteger      := StrToInt(sNroAulas);
      Open();

      if not qyAux.FieldByName('cd_situacao').IsNull then
      begin
         for I := 1 to cbSituacaoAula.Items.Count - 1 do
         begin
            qrySituacoes.GotoBookmark(TBookmark(cbSituacaoAula.Items.Objects[I]));
            if qrySituacoesCD_SITUACAO.AsInteger = qyAux.FieldByName('cd_situacao').AsInteger then
            begin
               cbSituacaoAula.ItemIndex := I;
               Break;
            end;            
         end;
      end;

      qtd_aulas_frequencias := qyAux.FieldByName('qtd_aulas').AsInteger;

      if not IsEmpty then
      begin
         edGrupoAulas.Text          := FieldByName('cd_grupo').AsString;
         txtAulas.Text              := FieldByName('qtd_aulas').AsString;
         umdtDataInic.Date          := FieldByName('data').AsDateTime;
         meConteudo.Lines.Text      := FieldByName('conteudo').AsString;
         txtAProf.Text              := FieldByName('cd_professor').AsString;
         meConteudo.Text            := FieldByName('conteudo').AsString;
         meMaterial.Text            := FieldByName('me_material_aula').AsString;
         meObservacao.Text          := FieldByName('me_observacao').AsString;
         meTransporte.Text          := FieldByName('me_transporte').AsString;
         meLocal.Text               := FieldByName('me_local_aula').AsString;
         meHospagem.Text            := FieldByName('me_hospedagem').AsString;
         meGerenciamentoProf.Text   := FieldByName('me_gerenc_prof').AsString;
         meGerenciamentoGestor.Text := FieldByName('me_gerenc_gest').AsString;

         // Se houver grupo selecionado, desabilita "conforme grade de horário" e "selecionar professor"
         bloqueiaCamposGrupoSelecionado();

         if pnControleLogistica.Enabled then
         begin
            // Inicializa todas as variáveis abaixo com -999
            cd_situacao_material_aula := -999; cd_situacao_transporte := -999;
            cd_situacao_local_aula := -999; cd_situacao_hospedagem := -999;
            cd_situacao_gerenc_prof := -999; cd_situacao_gerenc_gest := -999;

            if not FieldByName('cd_situacao_material_aula').IsNull then
               cd_situacao_material_aula := FieldByName('cd_situacao_material_aula').AsInteger;

            if not FieldByName('cd_situacao_transporte').IsNull then
               cd_situacao_transporte := FieldByName('cd_situacao_transporte').AsInteger;

            if not FieldByName('cd_situacao_local_aula').IsNull then
               cd_situacao_local_aula := FieldByName('cd_situacao_local_aula').AsInteger;

            if not FieldByName('cd_situacao_hospedagem').IsNull then
               cd_situacao_hospedagem := FieldByName('cd_situacao_hospedagem').AsInteger;

            if not FieldByName('cd_situacao_gerenc_prof').IsNull then
               cd_situacao_gerenc_prof := FieldByName('cd_situacao_gerenc_prof').AsInteger;

            if not FieldByName('cd_situacao_gerenc_gest').IsNull then
               cd_situacao_gerenc_gest := FieldByName('cd_situacao_gerenc_gest').AsInteger;

            CarregaConfiguracoesLogistica(
               FieldByName('cd_situacao_material_aula').AsInteger,
               FieldByName('cd_situacao_transporte').AsInteger,
               FieldByName('cd_situacao_local_aula').AsInteger,
               FieldByName('cd_situacao_hospedagem').AsInteger,
               FieldByName('cd_situacao_gerenc_prof').AsInteger,
               FieldByName('cd_situacao_gerenc_gest').AsInteger
            );

            // Transporte
            edmKm.setValor(FieldByName('nr_quilometragem').AsCurrency);
            edmValorKm.setValor(FieldByName('vl_km').AsCurrency);
            edmTotalKm.setValor(FieldByName('vl_total_transporte').AsCurrency);

            // Material
            edmQtdDiariasMaterial.setValor(FieldByName('nr_qtd_diarias_material').AsCurrency);
            edmVlDiariaMaterial.setValor(FieldByName('vl_diaria_material').AsCurrency);
            edmTotalMaterial.setValor(FieldByName('vl_total_material').AsCurrency);

            // Hospedagem
            edmQtdDiariasHospedagem.setValor(FieldByName('nr_qtd_diarias_hospedagem').AsCurrency);
            edmVlDiariaHospedagem.setValor(FieldByName('vl_diaria_hospedagem').AsCurrency);
            edmTotalHospedagem.setValor(FieldByName('vl_total_hospedagem').AsCurrency);

            // Local
            edmQtdDiariasLocal.setValor(FieldByName('nr_qtd_diarias_local').AsCurrency);
            edmVlDiariaLocal.setValor(FieldByName('vl_diaria_local').AsCurrency);
            edmTotalLocal.setValor(FieldByName('vl_total_local').AsCurrency);
         end;

         if FieldByName('sn_bloqueado').AsInteger = 1 then begin
            ckbBloqueado.Checked := True;
         end
         else begin
            ckbBloqueado.Checked := False;
         end;

         Label7.Caption := sNroAulas;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.atualizaFrequenciasAulas( bAumenta: Boolean);
var
   qryFrequenciaAulas : TUMZQuery;
   ds_mensagem_diminui, ds_mensagem_aumenta : String;
begin
   DM.CriarConsulta(qryFrequenciaAulas);

   qryFrequenciaAulas.SQL.Text := ''
   + ' UPDATE '
   + '   diario_aulas da  '
   + ' INNER JOIN diario_aulas_alunos daa ON ( '
   + '   da.anosemestre = daa.nr_anosem AND '
   + '   da.turma = daa.cd_turma AND '
   + '   da.disciplina = daa.cd_disciplina AND '
   + '   da.bimestre = daa.cd_bimestre AND '
   + '   da.nro_aula = daa.nr_aula '
   + ' ) '
   + ' SET '
   +  '$$condicao_update_frequencias$$'
   + ' WHERE '
   + '  da.cd_diario_aula = ' + IntToStr(qyAux.FieldByName('cd_diario_aula').AsInteger);

   if ( bAumenta ) then
   begin
      qryFrequenciaAulas.SQL.Text := StringReplace(
         qryFrequenciaAulas.SQL.Text,
         '$$condicao_update_frequencias$$',
         ' daa.ds_freq=RPAD(daa.ds_freq, da.qtd_aulas, RIGHT(daa.ds_freq, 1))',
         [rfReplaceAll]
      );
   end else
   begin
      qryFrequenciaAulas.SQL.Text := StringReplace(
         qryFrequenciaAulas.SQL.Text,
         '$$condicao_update_frequencias$$',
         ' daa.ds_freq = LEFT(daa.ds_freq, da.qtd_aulas) ',
         [rfReplaceAll]
      );
   end;
   
   qryFrequenciaAulas.ExecSQL;
end;

procedure TfrmAulasProvasAcoes.AtualizaProvasDados(sNroProva: string);
begin
   with qyAux do begin
      Params.Clear();
      SQL.Clear();
      SQL.Add(''+
         'SELECT                                                                    '+
         '  cd_prova, anosemestre, turma, disciplina, bimestre,                               '+
         '  nro_nota, cd_professor, assunto, data, sn_bloqueado, sn_proficiencia, sn_especial, sn_compoe, nr_dias_bloqueio, ds_chave, vl_peso, nr_nota_minima, nr_nota_maxima '+
         'FROM                                                                      '+
         '  diario_provas                                                            '+
         'WHERE                                                                     '+
         '  anosemestre = :anosem AND turma = :turma AND disciplina = :disciplina   '+
         '  AND bimestre = :bimestre AND nro_nota = :nro_nota                       '+
      '');
      ParamByName('anosem').AsInteger     := StrToInt(sPAnoSem);
      ParamByName('turma').AsString       := sPTurma;
      ParamByName('disciplina').AsInteger := StrToInt(sPDisciplina);
      ParamByName('bimestre').AsInteger   := StrToInt(txtPBim.Text);
      ParamByName('nro_nota').AsInteger   := StrToInt(sNroProva);
      Open();

      if not IsEmpty then begin
         umdtPData.Date      := FieldByName('data').AsDateTime;
         txtPProf.Text     := FieldByName('cd_professor').AsString;
         lblProva.Caption  := FieldByName('nro_nota').AsString;
         txtPAssunto.Text  := FieldByName('assunto').AsString;
         txtPBim.Text      := FieldByName('bimestre').AsString;
         if not FieldByName('vl_peso').IsNull then
           txtPPeso.Text := FormatFloat('#0.00',FieldByName('vl_peso').AsFloat)
         else
           txtPPeso.Text := '';
         if not FieldByName('nr_nota_minima').IsNull then
            txtPNotaMinima.Text := FormatFloat('#0.00',FieldByName('nr_nota_minima').AsFloat)
         else
            txtPNotaMinima.Text := '';
         if not FieldByName('nr_nota_maxima').IsNull then
            txtPNotaMaxima.Text := FormatFloat('#0.00',FieldByName('nr_nota_maxima').AsFloat)
         else
            txtPNotaMaxima.Text := '';

         if(StrToBool(IntToStr(Abs(FieldByName('sn_proficiencia').AsInteger))))then
         begin
            opcInicial := 3;
         end
         else if(StrToBool(IntToStr(Abs(FieldByName('sn_especial').AsInteger))))then
         begin
            opcInicial := 4;
         end
         else if(StrToBool(IntToStr(Abs(FieldByName('sn_compoe').AsInteger))))then
         begin
            opcInicial := 1;
         end else begin
            opcInicial := 2;
         end;

         ckbBloqueiaProva.Checked := StrToBool(IntToStr(Abs(FieldByName('sn_bloqueado').AsInteger)));

         txtPDiasBloq.Text     := FieldByName('nr_dias_bloqueio').AsString;
         txtChave.Text         := FieldByName('ds_chave').ASString;
      end;

   end;
end;

procedure TfrmAulasProvasAcoes.btSalvarClick(Sender: TObject);
const
   SSQLVerificaFreq = 'SELECT DIA_VERIFICA_FREQ_LANCADAS(?, ?, ?, ?, ?) FROM DUAL';
   SMsgPreencherFreq = 'Todas as informações de frequências devem estar lançadas para permitir o cálculo de médias.';
var
   cdColigadaTurma, I, J, horario, disciplina, nrAulas: Integer;
   data : TDateTime;
   nomeComponente, msg_cronograma, nm_disciplina, logDesc, msgErro, sDataValidar: String;
   qyAtualizarProfCronograma, qyAulasCronogramas: TUMZQuery;
   maior_data: TDate;
   controleFocus: TWinControl;
   trocaProfessor: Boolean;
   FaltaHorario: Boolean;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   nr_tipo_digitacao: Integer;
begin
   sn_pode_excluir_avl := True;
   {Salva informações da Aula}
   if pcAulas.ActivePage = tsAulas then
   begin
      SalvarRegistroAula();
   end

   { Salva informações da Prova }
   else if pcAulas.ActivePage = tsProvas then
   begin
      if trim(txtPPeso.Text) <> '' then
      begin
         txtPPeso.Text := ReplaceStr(txtPPeso.Text,',','.')
      end;

      if bInsere then begin
         Application.ProcessMessages();
         InsereProvasDados();

      end
      else begin
         SalvaProvaAtuDados();

      end;
   end
   else if pcAulas.ActivePage = tsCalculo then begin
      if ckbMedia.Checked then
      begin
         edNFormula.Text := 'ARITMETICA';
      end
      else
      begin
         if not (Length(Trim(edNFormula.Text)) > 0) then begin
            Mensagem('A fórmula padrão deve ser preenchida!!', 'Atenção', MB_OK);
            Exit;
         end;
      end;

      Dm.qyVerificaNotasLancada.ParamByName('cd_curso').AsString := sPCurso;
      Dm.qyVerificaNotasLancada.ParamByName('nr_anosemestre').AsString := sPAnoSem;
      if trim(sPTurma) = '' then begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_turma').Clear;
      end else begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_turma').AsString := sPTurma;
      end;
      if trim(sPDisciplina) = '' then begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_disciplina').Clear;
      end else begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_disciplina').AsString := sPDisciplina;
      end;
      if trim(sPBim) = '' then begin
         Dm.qyVerificaNotasLancada.ParamByName('nr_etapa').Clear;
      end else begin
         Dm.qyVerificaNotasLancada.ParamByName('nr_etapa').AsInteger := StrToInt(sPBim);
      end;
      if sPGrupo > 0 then begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_grupo').AsInteger := sPGrupo;
      end else begin
         Dm.qyVerificaNotasLancada.ParamByName('cd_grupo').Clear;
      end;
      Dm.qyVerificaNotasLancada.ParamByName('cd_pessoa').Clear;

      Dm.qyVerificaNotasLancada.Close;
      Dm.qyVerificaNotasLancada.Open;
     if (not Dm.qyVerificaNotasLancada.Eof) and (Dm.qyVerificaNotasLancada.FieldByName('retorno').AsInteger > 0) then
      begin
         Mensagem('Todas as informações de notas devem estar lançadas para permitir o cálculo de médias.', 'Atenção!!', MB_OK, Handle);
         Exit;
      end;
      Dm.qyVerificaNotasLancada.Close;

      Stmt := PrepareStatement(SSQLVerificaFreq);
      try
         if Trim(sPTurma) = '' then
            Stmt.SetNull(1, stString);

         if Trim(sPTurma) <> '' then
            Stmt.SetString(1, sPTurma);

         Stmt.SetString(2, sPAnoSem);

         if Trim(sPDisciplina) = '' then
            Stmt.SetNull(3, stInteger);

         if Trim(sPDisciplina) <> '' then
            Stmt.SetString(3, sPDisciplina);

         if Trim(sPBim) = '' then
            Stmt.SetNull(4, stInteger);

         if Trim(sPBim) <> '' then
            Stmt.SetString(4, sPBim);

         Stmt.SetNull(5, stInteger);

         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
            begin
               if Rs.GetInt(1) = 0 then
               begin
                  MessageDlg(SMsgPreencherFreq, mtWarning, [mbOK], -1);
                  Exit;
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

      Dm.qyValidaQtdAvaliacoes.ParamByName('cd_curso').AsString := sPCurso;
      Dm.qyValidaQtdAvaliacoes.ParamByName('nr_anosemestre').AsString := sPAnoSem;
      if trim(sPTurma) = '' then begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_turma').Clear;
      end else begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_turma').AsString := sPTurma;
      end;
      if trim(sPDisciplina) = '' then begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_disciplina').Clear;
      end else begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_disciplina').AsString := sPDisciplina;
      end;
      if trim(sPBim) = '' then begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('nr_etapa').Clear;
      end else begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('nr_etapa').AsInteger := StrToInt(sPBim);
      end;
      if sPGrupo > 0 then begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_grupo').AsInteger := sPGrupo;
      end else begin
         Dm.qyValidaQtdAvaliacoes.ParamByName('cd_grupo').Clear;
      end;      

      Dm.qyValidaQtdAvaliacoes.Close;
      Dm.qyValidaQtdAvaliacoes.Open;
      if (not Dm.qyValidaQtdAvaliacoes.Eof) and (trim(Dm.qyValidaQtdAvaliacoes.FieldByName('mensagem_retorno').AsString) <> '') then
      begin
         Mensagem('Não é possível cálcular a média porque os limites de quantidade mínima e máxima não foram atendidos: '+#13#13+Dm.qyValidaQtdAvaliacoes.FieldByName('mensagem_retorno').AsString, 'Atenção!!', MB_OK, Handle);
         Exit;
      end;
      Dm.qyValidaQtdAvaliacoes.Close;

      ExecutaCalculoNotas();
      Self.ModalResult := mrOk;
      Self.CloseModal();
   end

   {Informações da frequência}
   else if pcAulas.ActivePage = tsFrequencia then begin
      ExecutaCalculoFreq();
      Self.ModalResult := mrOk;
      Self.CloseModal();
   end
   else if pcAulas.ActivePage = tsComplemento then begin
      if (qyCompl.State in [dsInsert, dsEdit]) then begin
         if not (Length(Trim(qyComplcd_turma.AsString)) > 0) then begin
            Mensagem('A Turma deve ser preenchida!!', 'Atenção', MB_OK);
            Exit;
         end;
         if not (qyComplnr_etapa.AsInteger > 0) then begin
            Mensagem('O Bimestre deve ser selecionado!!', 'Atenção', MB_OK);
            Exit;
         end;
         if not (qyComplcd_ajuste.AsInteger > 0) then begin
            Mensagem('O tipo do ajuste deve ser selecionado!!', 'Atenção', MB_OK);
            Exit;
         end;
         qyCompl.Post;
         Self.ModalResult := mrOk;
         Self.CloseModal();
      end;
   end
   { controle de cronogramas }
   else if pcAulas.ActivePage = tsCronogramasGerenciar then
   begin
      if ( Self.ActiveControl is TUMDateTimePicker ) then
      begin
         controleFocus := Self.ActiveControl;
         edQtdAulas.SetFocus;
         controleFocus.SetFocus;
      end;

      if chkAI.Checked then
      begin

         try
            sDataValidar := umdtAvaliacao.Text + ':00';
            data := StrToDateTime(sDataValidar);
            sDataValidar := DateTimeToStr(data);
         except
            on EConvertError do
            begin
               Mensagem('A data da avaliação informada é inválida!', 'Atenção', MB_OK);
               umdtAvaliacao.SetFocus;
               Exit;
            end;
         end;

         if cbAvaliacao.ItemIndex = -1 then
         begin
           Mensagem('Selecione uma avaliação, caso não houver nenhuma avaliação verifique se você possui alguma avaliação por disciplina disponível para responder!', 'Atenção', MB_OK);
           cbAvaliacao.SetFocus;
           Exit;
         end;

      end;

      if cbDisciplinas.ItemIndex = -1 then
      begin
         Mensagem('Selecione uma disciplina', 'Atenção', MB_OK + MB_ICONWARNING);
         cbDisciplinas.SetFocus;
         Exit;
      end;

      if chkAI.Checked then
      begin
         IncluirAvlDisc(
            txtCronogramaTurma.Text,
            strtoint( TItemCombo(cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ]).getCodigo)
         );
      end;
      { Verifica se existe algum dado necessário pendente } 
      msg_cronograma := '';
      if (rgPeriodicidade.ItemIndex = -1) then
      begin
         msg_cronograma := msg_cronograma + chr(13) + 'Periodicidade';
      end;      
      if (txtCronogramaTurma.Text  = '' ) then
      begin
         msg_cronograma := msg_cronograma + chr(13) + 'Turma';
      end;
      if (cbDisciplinas.ItemIndex = -1 ) OR (cbDisciplinas.ItemIndex = 0 ) then
      begin
         msg_cronograma := msg_cronograma + chr(13) + 'Disciplina';
      end;
      if ( trim(txtCronogramasProfessor.Text) = '' ) then
      begin
         msg_cronograma := msg_cronograma + chr(13) + 'Professor';
      end;
      
      if cbGrupos.Enabled then
      begin
         if Self.existeGrupo(StrToInt(sPAnoSem), txtCronogramasCurso.Text, txtCronogramaTurma.Text , StrToInt(TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo)) and (cbGrupos.ItemIndex <= 0) then
         begin
            msg_cronograma := msg_cronograma + chr(13) + 'Grupo';
         end;
      end;

      FaltaHorario := False;

      if cbHorarioAula1.ItemIndex <= 0 then
      begin
         msg_cronograma := msg_cronograma + Chr(13) + 'Horário das Aulas';
         FaltaHorario := True;
      end;

      if not FaltaHorario then
      begin
         if cbHorarioAula2.Enabled and (cbHorarioAula2.ItemIndex <= 0) then
         begin
            msg_cronograma := msg_cronograma + Chr(13) + 'Horário das Aulas';
            FaltaHorario := True;
         end;
      end;

      if not FaltaHorario then
      begin
         for I := 0 to sbAulas.ComponentCount - 1 do
         begin
            if ( Pos( 'cbHorarioAula', sbAulas.Components[I].Name ) > 0 ) then
            begin
               if (TUMComboBox(sbAulas.Components[I]).ItemIndex <= 0 ) then
               begin
                  msg_cronograma := msg_cronograma + Chr(13) + 'Horário das Aulas';
                  break;
               end;
            end;
         end;
      end;

      if ( msg_cronograma <> '' ) then
      begin
         Mensagem( 'Os seguintes campos precisam ser preenchidos:' + msg_cronograma, 'Atenção', MB_OK + MB_ICONEXCLAMATION );
         Exit;
      end;
      { Verifica se existe algum dado necessário pendente - Fim }

      if (ckbChecarConflitos.Checked) AND not(ValidaHorariosProfessor()) then
      begin
         exit;
      end;

      if ckbChecarConflitosSalas.Checked AND TemConflitosSala() then
      begin
         Exit;
      end;

      if (StrToInt(edQtdAulas.Text) = 1) then
         maior_data:= dtpDataAula1.Date
      Else
         maior_data:= dtpDataAula2.Date;

      DM.UsuarioLogado.SetParametroUsuario(ckbChecarConflitosSalas, Self.Name);

      // Se tiver algum conflito(datas em feriados) não deixa prosseguir
      if ( checarConflitoDatasCalendario(dtpDataAula1.Date)) then
         Exit;

      if ( checarConflitoDatasCalendario(dtpDataAula2.Date)) then
         Exit;
               
      if (sbAulas.ComponentCount > 0) then
      begin
         if percorreDatasCronograma() then Exit;
      end;

      // Inserir os cronogramas
      if ( AcaoIncluirCampos <> Editar ) then
      begin
         IncluirCronograma(
            strtoint( sPAnoSem ), txtCronogramaTurma.Text , // Anosemestre, Turma
            strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ), // Disciplina
            strtoint( txtCronogramasProfessor.Text ), dtpDataAula1.Date, // Professor, Data
            ckConfirmado.Checked, edmValor.getValorDouble, // Confirmado, Valor
            strtoint( TItemCombo( cbHorarioAula1.Items.Objects[cbHorarioAula1.ItemIndex] ).getCodigo ), // Horário
            StrToInt(txtSubstituto.Text), sPGrupo,
            edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
         );

         if strtoint(edQtdAulas.Text) > 1 then
         begin
            IncluirCronograma(
               strtoint( sPAnoSem ), txtCronogramaTurma.Text , // Anosemestre, Turma
               strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ), // Disciplina
               strtoint( txtCronogramasProfessor.Text ), dtpDataAula2.Date, // Professor, Data
               ckConfirmado.Checked, edmValor.getValorDouble, // Confirmado, Valor
               strtoint( TItemCombo( cbHorarioAula2.Items.Objects[cbHorarioAula2.ItemIndex] ).getCodigo ), // Horário
               StrToInt(txtSubstituto.Text), sPGrupo,
            edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
            );
         end;

         for I := 0 to sbAulas.ComponentCount - 1 do
         begin
            nomeComponente := sbAulas.Components[I].Name;

            if ( Pos( 'dtpDataAula', nomeComponente ) > 0 ) then
            begin

               nomeComponente := StringReplace(nomeComponente, 'dtpDataAula', '', []);
               for J := 0 to sbAulas.ComponentCount - 1 do
               begin
                  if ( Pos( 'cbHorarioAula', sbAulas.Components[J].Name ) > 0 ) then
                  begin
                     if ( StringReplace(sbAulas.Components[J].Name, 'cbHorarioAula', '', []) = nomeComponente ) then
                     begin
                        horario := strtoint( TItemCombo( TUMComboBox(sbAulas.Components[J]).Items.Objects[TUMComboBox(sbAulas.Components[J]).ItemIndex]).getCodigo );
                        break;
                     end;
                  end;

               end;

               IncluirCronograma(
                  strtoint( sPAnoSem ), txtCronogramaTurma.Text , // Anosemestre, Turma
                  strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ]).getCodigo ), // Disciplina
                  strtoint( txtCronogramasProfessor.Text ), TUMDateTimePicker(sbAulas.Components[I]).Date, // Professor, Data
                  ckConfirmado.Checked, edmValor.getValorDouble, // Confirmado, Valor
                  horario, // Horário
                  StrToInt(txtSubstituto.Text),
                  sPGrupo,
                  edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
               );

               if ( TUMDateTimePicker(sbAulas.Components[I]).Date >= maior_data ) then
                  maior_data := TUMDateTimePicker(sbAulas.Components[I]).Date;
            end;
         end;

         CriaProvaUltimaAulaCronograma(
            maior_data,
            txtCronogramaTurma.Text,
            strtoint(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo ),
            strtoint(txtCronogramasProfessor.Text),
            strtoint(sPAnoSem),
            sPGrupo,
            strtoint(edBimestre.Text),
            getTipoDigitacao()
         );

         // Incluir professores
         IncluirTurmasProfessor(
            StrToInt(sPAnoSem), sPCurso, sPTurma, strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ),
            StrToInt(txtCronogramasProfessor.Text), StrToInt(edQtdAulas.Text)
         );
         IncluirProfessorDisc(
            StrToInt(sPAnoSem), sPCurso, sPTurma, strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ),
            StrToInt(txtCronogramasProfessor.Text), StrToInt(edQtdAulas.Text)
         );
      end
      else if ( AcaoIncluirCampos = Editar ) then
      begin

         if umAjudaTrocaProfessor.Visible then
         begin

            if cbDisciplinas.ItemIndex <> -1 then
            begin
               disciplina := StrToInt(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo);
               nm_disciplina := TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getDescricao;
            end else begin
               disciplina := 0;
               nm_disciplina := '';
            end;

            trocaProfessor := frmProfessores.TrocarProfessorTurma(
               StrToInt(txtCronogramasProfessor.Text),
               qyProfessorAntigo.FieldByName('cd_pessoa').AsInteger,
               StrToInt(sPAnoSem),
               disciplina,
               sNomeProfessor,
               qyProfessorAntigo.FieldByName('nm_pessoa').AsString,
               sPTurma,
               sPCurso,
               nm_disciplina
            );

            if not trocaProfessor then Exit;            

         end;

         AlterarCronograma(
            lbAula1.Tag,
            strtoint( txtCronogramasProfessor.Text ), dtpDataAula1.Date,
            strtoint(TItemCombo(cbHorarioAula1.Items.Objects[cbHorarioAula1.ItemIndex]).getCodigo()),
            ckConfirmado.Checked, StrToFloat(edmValor.Text), StrToInt(txtSubstituto.Text),
            edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
         );

        IncluirProfessorDisc(
            StrToInt(sPAnoSem), sPCurso, sPTurma, strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ),
            StrToInt(txtCronogramasProfessor.Text), StrToInt(edQtdAulas.Text)
         );

         if not chkAI.Checked AND (cbAvaliacao.ItemIndex > -1) then
         begin
            IncluirAvlDisc(
               txtCronogramaTurma.Text,
               strtoint( TItemCombo(cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ]).getCodigo),
               False
            );
         end;

         if strtoint(edQtdAulas.Text) > 1 then
         begin
            horario := strtoint(
               TItemCombo(
                  cbHorarioAula2.Items.Objects[cbHorarioAula2.ItemIndex]
               ).getCodigo
            );
            data := dtpDataAula2.Date;

            if lbAula2.Tag > 0 then
            begin
               AlterarCronograma(
                  lbAula2.Tag,  // cd_horario
                  strtoint( txtCronogramasProfessor.Text ), data, horario, // professor, data, horario
                  ckConfirmado.Checked, StrToFloat(edmValor.Text) , StrToInt(txtSubstituto.Text),// confirmado
                  edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
               );
            end
            else
            begin
               IncluirCronograma(
                  strtoint( sPAnoSem ), txtCronogramaTurma.Text , // Anosemestre, Turma
                  strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ), // Disciplina
                  strtoint( txtCronogramasProfessor.Text ), data, // Professor, Data
                  ckConfirmado.Checked, StrToFloat(edmValor.Text), // Confirmado, Valor
                  horario, // Horário
                  StrToInt(txtSubstituto.Text),
                  sPGrupo,
                  edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
               );
            end;
         end else if (lbAula2.Tag > 0) then
         begin
            // Inserir log de exclusão dos cronogramas
            logDesc := 'Exclusão do cronograma, pois o total de aulas estava zerado (cronograma sem aulas).'+CHR(13);
            logDesc := logDesc + 'Código do cronograma (cd_cronograma): '+inttostr(lbAula2.Tag)+', ';
            logDesc := logDesc + 'Anosemestre: '+sPAnoSem+', ';
            logDesc := logDesc + 'Turma: '+sPTurma+', ';
            logDesc := logDesc + 'Disciplina: '+sPDisciplina;
            logDesc := logDesc + CHR(13) + '[Acadêmico]';

            { Insere log de inserção de aulas }
            DMDiario.inserirLog(uDMDiario.ACAO_EXCLUSAO, uDMDiario.ATIVIDADE_CRONOGRAMA, logDesc, strtoint( txtCronogramasProfessor.Text ));

            ExcluirTurmasProfessor( lbAula2.Tag );
            DM.db.ExecuteDirect('DELETE FROM diario_cronogramas WHERE cd_cronograma = ' + inttostr(lbAula2.Tag) );
         end;
                  

         DM.CriarConsulta( qyAulasCronogramas );
         with qyAulasCronogramas do
         begin
            Close;
            SQL.Clear;

            SQL.Add( ' SELECT dc.cd_cronograma, dc.anosemestre, dc.turma, dc.disciplina, dc.dt_cronograma, dc.cd_professor, hs.ds_horario ' );

            SQL.Add( ' FROM diario_cronogramas dc ' );
            SQL.Add( '      INNER JOIN horarios hs ON ( hs.codigo = dc.cd_horario ) ' );
      
            SQL.Add( ' WHERE dc.anosemestre = :anosemestre AND cd_professor = :professor AND ' );
            SQL.Add( ' dc.turma = :turma AND dc.disciplina = :disciplina AND dc.bimestre = :bimestre ' );

            SQL.Add( ' ORDER BY dc.dt_cronograma ' );

            ParamByName( 'anosemestre' ).AsInteger := strtoint( sPAnoSem );
            ParamByName( 'turma' ).AsString        := sPTurma;
            ParamByName( 'disciplina' ).AsInteger  := StrToInt( sPDisciplina );
            ParamByName( 'professor' ).AsInteger   := strtoint( txtCronogramasProfessor.Text );
            ParamByName( 'bimestre' ).AsInteger    := strtoint( edBimestre.Text );

            Open;

            if ( Trunc( ( sbAulas.ComponentCount / 4 ) ) + 2 ) < RecordCount then
            begin
               nrAulas := Trunc( ( sbAulas.ComponentCount / 4 ) ) + 2;
               RecNo := nrAulas;
               Next;

               { Logo acima, setamos a linha da query para o valor da última aula
                 existente na tela, as demais que serão percorridas pelo "while not eof do"
                 serão excluídas. }

               while not Eof do
               begin
                  // Inserir log de exclusão dos cronogramas
                  logDesc := 'Exclusão do cronograma, pois o total de aulas foi reduzido (de '+IntToStr(RecordCount)+' para '+IntToStr(nrAulas)+').'+CHR(13);
                  logDesc := logDesc + 'Código do cronograma (cd_cronograma): '+qyAulasCronogramas.FieldByName('cd_cronograma').AsString+', ';
                  logDesc := logDesc + 'Anosemestre: '+FieldByName('anosemestre').AsString+', ';
                  logDesc := logDesc + 'Turma: '+FieldByName('turma').AsString+', ';
                  logDesc := logDesc + 'Disciplina: '+FieldByName('disciplina').AsString+', ';
                  logDesc := logDesc + 'Data: '+FormatDateTime('dd/mm/yyyy', FieldByName('dt_cronograma').AsDateTime)+', ';
                  logDesc := logDesc + 'Horário: '+FieldByName('ds_horario').AsString;
                  logDesc := logDesc + CHR(13) + '[Acadêmico]';

                  { Insere log de inserção de aulas }
                  DMDiario.inserirLog(uDMDiario.ACAO_EXCLUSAO, uDMDiario.ATIVIDADE_CRONOGRAMA, logDesc, FieldByName('cd_professor').AsInteger);

                  ExcluirTurmasProfessor( qyAulasCronogramas.FieldByName( 'cd_cronograma' ).AsInteger );
                  DM.db.ExecuteDirect('DELETE FROM diario_cronogramas WHERE cd_cronograma = ' + qyAulasCronogramas.FieldByName( 'cd_cronograma' ).AsString );
                  Next;
               end;
            end;

            for I := 0 to sbAulas.ComponentCount - 1 do
            begin
               if ( sbAulas.Components[I] is TLabel ) then
               begin
                  ////////////////////////////////////////////
                  // Recupera as informações de data e horário
                  if ( sbAulas.Components[I+1] is TUMDateTimePicker ) AND
                     ( sbAulas.Components[I+2] is TUMComboBox ) then
                  begin
                     horario := strtoint(
                        TItemCombo(
                           TUMComboBox(sbAulas.Components[I+2])
                              .Items.Objects[TUMComboBox(sbAulas.Components[I+2]).ItemIndex]
                        ).getCodigo
                     );
                     data := TUMDateTimePicker(sbAulas.Components[I+1]).getDate;
                  end else if ( sbAulas.Components[I+1] is TUMComboBox ) AND
                              ( sbAulas.Components[I+2] is TUMDateTimePicker ) then
                  begin
                     horario := strtoint(
                        TItemCombo(
                           TUMComboBox(sbAulas.Components[I+1])
                              .Items.Objects[TUMComboBox(sbAulas.Components[I+1]).ItemIndex]
                        ).getCodigo
                     );
                     data := TUMDateTimePicker(sbAulas.Components[I+2]).getDate;
                  end;
                  // Recupera as informações de data e horário
                  ////////////////////////////////////////////

                     
                  if TLabel(sbAulas.Components[I]).Tag > 0 then
                  begin
                     AlterarCronograma(
                        TLabel(sbAulas.Components[I]).Tag,  // cd_horario
                        strtoint( txtCronogramasProfessor.Text ), data, horario, // professor, data, horario
                        ckConfirmado.Checked, edmValor.getValorDouble, // confirmado
                        strToInt(txtSubstituto.Text),
                        edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
                     );
                  end
                  else
                  begin
                     IncluirCronograma(
                        strtoint( sPAnoSem ), txtCronogramaTurma.Text , // Anosemestre, Turma
                        strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ), // Disciplina
                        strtoint( txtCronogramasProfessor.Text ), data, // Professor, Data
                        ckConfirmado.Checked, edmValor.getValorDouble, // Confirmado, Valor
                        horario ,// Horário
                        StrToInt(txtSubstituto.Text),
                        sPGrupo,
                        edNomeSala.Tag, edNomeSala.Text, strtoint(edBimestre.Text)
                     );
                  end;

                  if ( data >= maior_data ) then
                     maior_data := data;
               end;
            end;

         end;

         CriaProvaUltimaAulaCronograma(
            maior_data,
            txtCronogramaTurma.Text,
            strtoint(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo),
            strtoint(txtCronogramasProfessor.Text),
            strtoint(sPAnoSem),
            sPGrupo,
            strtoint(edBimestre.Text),
            getTipoDigitacao()
         );

      end;

      CriaDiarioPrazos(
         StrToInt(sPAnoSem), txtCronogramasCurso.Text, txtCronogramaTurma.Text ,
         strtoint( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).getCodigo ),
         umdtInicioDiario.Date, umdtFimDiario.Date , strtoint(edBimestre.Text)
      );

      if ClasseTurmas.IsDataInicioFimFromCronograma( StrToInt(sPAnoSem), txtCronogramaTurma.Text  ) then
      begin
         ClasseTurmas.CalculaDataInicioFimTurma( StrToInt(sPAnoSem), txtCronogramaTurma.Text  );
      end;

      dm.CriarConsulta(qyAtualizarProfCronograma);

      //Pesquisa pela coligada do curso do crogonograma
      qyAtualizarProfCronograma.SQL.Text :=
      ' Select cd_coligada'+
      ' FROM turmas n' +
      ' where codigo = :codigo AND anosemestre = :nr_anosemestre ';

      qyAtualizarProfCronograma.ParamByName('codigo').AsString := txtCronogramaTurma.Text;
      qyAtualizarProfCronograma.ParamByName('nr_anosemestre').AsInteger := StrToInt(sPAnoSem);

      qyAtualizarProfCronograma.Open;
      cdColigadaTurma := qyAtualizarProfCronograma.FieldByName('cd_coligada').AsInteger;
      //Pesquisa pela coligada do curso do crogonograma - FIM

      {Pesquisa pelo professor na tabela professores_unidades e
      verifica se existe registro, caso não exista é inserido um marcando
      o professor como ativo na coligada do curso deste cronograma,
      caso já exista registro o professor é colocado como ativo na coloigada do
      curso do deste cronograma.}
      
      qyAtualizarProfCronograma.SQL.Text :=
      'Select cd_professor '+
      ' From professores_unidades '+
      ' Where cd_professor = :cd_professor AND' +
      ' cd_coligada = :cd_coligada';

      qyAtualizarProfCronograma.ParamByName('cd_professor').AsInteger :=
         StrToInt(txtCronogramasProfessor.Text);

      qyAtualizarProfCronograma.ParamByName('cd_coligada').AsInteger :=
         cdColigadaTurma;

      qyAtualizarProfCronograma.Open;

      if (qyAtualizarProfCronograma.FieldByName('cd_professor').AsString <> '') then
      begin
      //Atualiza registro caso já existra um registro deste professor para esta coligada
         qyAtualizarProfCronograma.Close;
         qyAtualizarProfCronograma.SQL.Text :=
         'UPDATE professores_unidades       ' +
         '    Set sn_professor = 1             ' +
         ' Where cd_professor = :cd_professor AND'+
         '    cd_coligada = :cd_coligada';

         qyAtualizarProfCronograma.ParamByName('cd_professor').AsInteger :=
            StrToInt(txtCronogramasProfessor.Text);

         qyAtualizarProfCronograma.ParamByName('cd_coligada').AsInteger :=
            cdColigadaTurma;


         qyAtualizarProfCronograma.ExecSQL;
      end
      else
      begin
      //Cria um registro passando professor como funcionário da coligada do curso.
        qyAtualizarProfCronograma.Close;
        qyAtualizarProfCronograma.SQL.Text :=
        'INSERT INTO professores_unidades'+
        '   (cd_professor, sn_funcionario, sn_professor, sn_orientador, cd_coligada)' +
        ' VALUES (:cd_professor,0, 1, 0, :cd_coligada)';

        qyAtualizarProfCronograma.ParamByName('cd_professor').AsInteger :=
            StrToInt(txtCronogramasProfessor.Text);

         qyAtualizarProfCronograma.ParamByName('cd_coligada').AsInteger :=
            cdColigadaTurma;

        qyAtualizarProfCronograma.ExecSQL;
      end;

      DM.atualizarGruposPessoa(StrToInt(txtCronogramasProfessor.Text), cdColigadaTurma);

      { Vai entrar nesse if quando o usuário desmarcou a opção "Gerar AI", porém
      o vinculo não foi desfeito pois já existem respostas de
      alunos dessa avaliação e turma/disciplina }
      if not (sn_pode_excluir_avl) then
      begin
         MessageBox(
            Handle,
            'Não foi possível excluir o vínculo com a Avaliação Institucional, pois já existem respostas registradas.',
            'Atenção',
            MB_ICONEXCLAMATION or MB_OK
         );
      end;

      Self.ModalResult := mrOk;
      Self.CloseModal;
   end;
end;

procedure TfrmAulasProvasAcoes.IncluirAvlDisc(
   cd_turma : string;
   cd_disciplina : Integer;
   sn_incluir : Boolean = True
);
var
  qryInsereAvaliacao, qryRemoveAvaliacao: TUMZQuery;
  qryGetAvaliacao : TUMZQuery;
begin
  sn_pode_excluir_avl := True;

  DM.CriarConsulta(qryGetAvaliacao);
  qryGetAvaliacao.SQL.Text :=
  ' SELECT                                    '+
  '	  cd_avaliacao,                           '+
  '    nr_dias_avaliacao                      '+
  ' FROM                                      '+
  '    avl_avaliacoes avl                     '+
  ' WHERE                                     '+
  '    avl.cd_avaliacao = :cd_avaliacao ';
  qryGetAvaliacao.ParamByName('cd_avaliacao').AsInteger :=
      StrToInt(TItemCombo(cbAvaliacao.Items.Objects[cbAvaliacao.ItemIndex]).getCodigo);
  qryGetAvaliacao.Open;
      
   if (not sn_incluir) then
   begin
      // Verifica se tem alguma resposta vinculada a essa avaliação
      sn_pode_excluir_avl := verificaExcluirVinculoAvlDisc(
         cd_turma,
         cd_disciplina,
         qryGetAvaliacao.FieldByName('cd_avaliacao').AsInteger
      );
   end;

  if (sn_incluir OR sn_pode_excluir_avl) then
  begin
     DM.CriarConsulta(qryRemoveAvaliacao);
     qryRemoveAvaliacao.SQL.Text := '' +
       'DELETE FROM avl_resolucao_prazo WHERE cd_turma LIKE :cd_turma AND cd_disciplina = :cd_disciplina';

     qryRemoveAvaliacao.ParamByName('cd_turma').AsString    := cd_turma;
     qryRemoveAvaliacao.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
     qryRemoveAvaliacao.ExecSQL;
     FreeAndNil(qryRemoveAvaliacao);
  end;

   if ( sn_incluir ) then
   begin
      DM.CriarConsulta(qryInsereAvaliacao);
      qryInsereAvaliacao.SQL.Text :=
       ' INSERT INTO avl_resolucao_prazo ( '
     + '  cd_avaliacao, cd_turma, cd_disciplina, dt_inicio, '
     + '    dt_fim, me_resultado, nr_anosemestre) '
     + ' VALUES ( '
     + '    :cd_avaliacao, :cd_turma, :cd_disciplina, :dt_inicio, :dt_fim, '
     + '    :me_resultado, :nr_anosemestre )';

      qryInsereAvaliacao.ParamByName('cd_avaliacao').AsInteger := qryGetAvaliacao.FieldByName('cd_avaliacao').AsInteger;
      qryInsereAvaliacao.ParamByName('cd_turma').AsString    := cd_turma;
      qryInsereAvaliacao.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      qryInsereAvaliacao.ParamByName('dt_inicio').AsDateTime := StrToDateTime(umdtAvaliacao.Text+':00');
      qryInsereAvaliacao.ParamByName('dt_fim').AsDateTime    := StrToDateTime(umdtAvaliacao.Text+':00')+
      qryGetAvaliacao.FieldByName('nr_dias_avaliacao').AsInteger;
      qryInsereAvaliacao.ParamByName('nr_anosemestre').AsInteger  := StrToInt(sPAnoSem);
      qryInsereAvaliacao.ExecSQL;
      FreeAndNil(qryInsereAvaliacao);
   end;

   FreeAndNil(qryGetAvaliacao);
end;

function TfrmAulasProvasAcoes.SalvaAulaAtuDados() : Boolean;
var
   logDesc : String;
   lista_combo_situacoes : Array[1..6] of TUMComboBox;
   I, UserChoice: Integer;
   msgAlteraFrequencia : String;
   bAumenta, GerarCP: boolean;
begin
   //verifica curso
   if (Length(txtCurso.Text) = 0) then begin
      Mensagem('Um Curso precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Result := False;
      Exit;
   end;

   //verifica turma
   if (Length(txtTurma.Text) = 0) then begin
      Mensagem('Uma turma precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Result := False;
      Exit;
   end;

   //verifica disciplina
   if (Length(txtDisciplina.Text) = 0) then begin
      Mensagem('Uma Disciplina precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Result := False;
      Exit;
   end;

   //bimestre
   if (Length(txtBim.Text) = 0) then begin
      Mensagem('Um Bimestre precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Result := False;
      Exit;
   end;

   //grupo
   if Self.existeGrupo(StrToInt(getAnoSemestre()), txtCurso.Text, txtTurma.Text, StrToInt(txtDisciplina.Text)) and (Length(edGrupoAulas.Text) = 0) then
   begin
      Mensagem('Existe pelo menos um grupo criado para essa disciplina, nesse caso um grupo precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Result := False;
      Exit;
   end;

   if cbSituacaoAula.ItemIndex > 0 then
   begin
      qrySituacoes.GotoBookmark(TBookmark(cbSituacaoAula.Items.Objects[cbSituacaoAula.ItemIndex]));
      GerarCP := qrySituacoesCD_SITUACAO.AsInteger = FSituacaoGeraCP;

      if GerarCP then
      begin
         GerarCP := GeraCompromissos(qyAux.FieldByName('cd_diario_aula').AsInteger);
         if not GerarCP then
         begin
            Result := False;
            Exit;
         end;
      end;
   end;

   with qyAux do begin
      if Active then begin
         Edit();
         FieldByName('anosemestre').AsInteger       := StrToInt(sAnoSem);
         FieldByName('turma').AsString              := txtTurma.Text;
         FieldByName('disciplina').AsInteger        := StrToInt(txtDisciplina.Text);
         FieldByName('bimestre').AsInteger          := StrToInt(txtBim.Text);
         FieldByName('qtd_aulas').AsInteger         := StrToInt(txtAulas.Text);
         FieldByName('data').AsDateTime             := umdtDataInic.Date;
         FieldByName('conteudo').AsString           := meConteudo.Lines.Text;
         FieldByName('sn_bloqueado').AsInteger      := Abs(StrToInt(BoolToStr(ckbBloqueado.Checked)));
         FieldByName('cd_professor').AsInteger      := StrToInt(txtAProf.Text);
         FieldByName('me_material_aula').AsString   := meMaterial.Lines.Text;
         FieldByName('me_transporte').AsString      := meTransporte.Lines.Text;
         FieldByName('me_observacao').AsString      := meObservacao.Lines.Text;
         FieldByName('sn_aula_compartilhada').AsInteger := Abs(StrToInt(BoolToStr(ckbCompartilha.Checked)));

         if cbTipoAula.ItemIndex > -1 then
         begin
            FieldByName('cd_aula_tipo').AsInteger  := StrToInt(TItemCombo(cbTipoAula.Items.Objects[cbTipoAula.ItemIndex]).getCodigo);
         end;

         if cbSituacaoAula.ItemIndex > 0 then
         begin
            qrySituacoes.GotoBookmark(TBookmark(cbSituacaoAula.Items.Objects[cbSituacaoAula.ItemIndex]));
            FieldByName('cd_situacao').AsInteger := qrySituacoesCD_SITUACAO.AsInteger;
         end
         else
            FieldByName('cd_situacao').Clear;

         // Verifica se é alteração de aulas de um grupo de atividade
         if (Trim(edGrupoAulas.Text) <> '') then
         begin
            FieldByName('cd_grupo').AsInteger := StrToInt(edGrupoAulas.Text);
         end else begin
            FieldByName('cd_grupo').Clear;
         end;

         FieldByName('me_local_aula').AsString      := meLocal.Lines.Text;
         FieldByName('me_hospedagem').AsString      := meHospagem.Lines.Text;
         FieldByName('me_gerenc_prof').AsString     := meGerenciamentoProf.Lines.Text;
         FieldByName('me_gerenc_gest').AsString     := meGerenciamentoGestor.Lines.Text;

         if ( pnControleLogistica.Enabled ) then
         begin
            lista_combo_situacoes[1] := cbSituacaoMaterialAula;
            lista_combo_situacoes[2] := cbSituacaoTransporte;
            lista_combo_situacoes[3] := cbSituacaoLocalAula;
            lista_combo_situacoes[4] := cbSituacaoHospedagem;
            lista_combo_situacoes[5] := cbSituacaoGerenProfessor;
            lista_combo_situacoes[6] := cbSituacaoGerenGestor;

            for I := Low(lista_combo_situacoes) to High(lista_combo_situacoes) do
            begin
               if TUMComboBox(lista_combo_situacoes[I]).ItemIndex > -1 then
                  qyAux.FieldByName(lista_campos_situacoes_logistica[I]).AsInteger := TSituacaoLogistica(lista_combo_situacoes[I].Items.Objects[ lista_combo_situacoes[I].ItemIndex ]).Codigo
               else
                  qyAux.FieldByName(lista_campos_situacoes_logistica[I]).Clear;
            end;

            // Transporte
            FieldByName('nr_quilometragem').AsCurrency := edmKm.getValorDouble();
            FieldByName('vl_km').AsCurrency := edmValorKm.getValorDouble();
            FieldByName('vl_total_transporte').AsCurrency := edmTotalKm.getValorDouble();

            // Material
            FieldByName('nr_qtd_diarias_material').AsCurrency := edmQtdDiariasMaterial.getValorDouble();
            FieldByName('vl_diaria_material').AsCurrency := edmVlDiariaMaterial.getValorDouble();
            FieldByName('vl_total_material').AsCurrency := edmTotalMaterial.getValorDouble();

            // Hospedagem
            FieldByName('nr_qtd_diarias_hospedagem').AsCurrency := edmQtdDiariasHospedagem.getValorDouble();
            FieldByName('vl_diaria_hospedagem').AsCurrency := edmVlDiariaHospedagem.getValorDouble();
            FieldByName('vl_total_hospedagem').AsCurrency := edmTotalHospedagem.getValorDouble();

            // Local
            FieldByName('nr_qtd_diarias_local').AsCurrency := edmQtdDiariasLocal.getValorDouble();
            FieldByName('vl_diaria_local').AsCurrency := edmVlDiariaLocal.getValorDouble();
            FieldByName('vl_total_local').AsCurrency := edmTotalLocal.getValorDouble();
         end; 

         {Desabilitado, ocorrência 40351
         if ( cbAulaSituacao.Visible ) AND ( cbAulaSituacao.Enabled ) AND ( cbAulaSituacao.ItemIndex > -1 ) then
         begin
            FieldByName('cd_situacao').AsString :=
                           TItemCombo( cbAulaSituacao.Items.Objects[ cbAulaSituacao.ItemIndex ] ).getCodigo();
         end;}

         // Atualiza as frequencias quando a quantidade de aulas é alterada
         if(StrToInt(txtAulas.Text) <> qtd_aulas_frequencias) then
         begin
            msgAlteraFrequencia := 'Você está diminuindo a quantidade de aulas dessa aula, caso existam frequências lançadas na aula o sistema irá remover as frequências excedentes, deseja realmente realizar essa ação?';
            bAumenta := False;

            if ( StrToInt(txtAulas.Text) > qtd_aulas_frequencias ) then
            begin
               bAumenta := True;
               msgAlteraFrequencia := 'Você está aumentando a quantidade de aulas dessa aula, caso existam frequências lançadas na aula o sistema irá repetir a última frequência do aluno para as aulas incluídas, deseja realmente realizar essa ação?';
            end;

            if Mensagem(msgAlteraFrequencia ,'Atenção', MB_ICONQUESTION + MB_YESNO) <> ID_YES then
            begin
               Exit;
            end;
         end;

         Post();

         // Chama o método para atualizar
         if(StrToInt(txtAulas.Text) <> qtd_aulas_frequencias) then
         begin
            atualizaFrequenciasAulas( bAumenta );
         end;

         VincularAulaTurmasHorarios(qyAux.FieldByName('cd_diario_aula').AsInteger, StrToInt(txtAulas.Text), True);

         // Inserir log de alteração de aulas
         logDesc := '';
         logDesc := logDesc + 'Código da aula: '+FieldByName('cd_diario_aula').AsString+', ';
         logDesc := logDesc + 'Nro. Aula: '+FieldByName('nro_aula').AsString+', ';
         logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', FieldByName('data').AsDateTime)+', ';
         logDesc := logDesc + 'Qtd. Aulas: '+FieldByName('qtd_aulas').AsString+', ';
         logDesc := logDesc + 'Conteúdo: '+FieldByName('conteudo').AsString+', ';
         logDesc := logDesc + 'Anosemestre: '+FieldByName('anosemestre').AsString+', ';
         logDesc := logDesc + 'Turma: '+FieldByName('turma').AsString+', ';
         logDesc := logDesc + 'Disciplina: '+FieldByName('disciplina').AsString+', ';
         logDesc := logDesc + 'Etapa: '+FieldByName('bimestre').AsString+', ';
         logDesc := logDesc + 'Grupo: '+FieldByName('cd_grupo').AsString+', ';
         logDesc := logDesc + 'Compartilhada: ';

         if(ckbCompartilha.Checked) then
         begin
            logDesc  :=  logDesc + '1';
         end else begin
            logDesc  :=  logDesc + '0';
         end;

         logDesc := logDesc + CHR(13) + '[Acadêmico]';

         { Insere log de inserção de aulas }
         DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_AULA, logDesc, FieldByName('cd_professor').AsInteger);
      end
      else
      begin
          AtualizaAulaDados( Label7.Caption );
          Result := False;
          Exit;
      end;
   end;
   
   Result := True;
end;

procedure TfrmAulasProvasAcoes.SalvaProvaAtuDados();
const
   BoolParaInt: array[boolean] of integer = (0, 1);

   SQL_UPDATE_NOTAS_FRENTE =
      'UPDATE '+
	      'diario_provas '+
      'SET data = ? , vl_peso = ? , assunto = ? , cd_avaliacao_tipo = ? '+
      'WHERE '+
	   'cd_prova_origem = ? ';
var
   LProva : TProva;
   qUpdate : TUMZQuery;
   sValores: String;
   arrCdAvaliacao: TStringList;
   arrProvaSuficiencia : TStringList;
   cd_avaliacao, logDesc, cd_turma, cd_disciplina, avl_param_frente_media: String;
   cd_avaliacao_tipo, cd_tipo, sn_especial, sn_compoe, sn_proficiencia, iDisciplinaFrente: Integer;
   Stmt: IZPreparedStatement;
begin
   { Se não possui expediente, sai fora }                                         
   if not DM.temExpedienteInstituicao( umdtPData.Date, False, Self.iCodColigada ) then
      Exit;

   try
      if bUsaListaTurmas then
         cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sListaTurmas, sPDisciplina, 'cd_avaliacao', True)
      else
         cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sPTurma, sPDisciplina, 'cd_avaliacao');
   except on E: Exception do
   end;

   arrCdAvaliacao := TStringList.Create();

   arrCdAvaliacao.delimiter := ',';
   arrCdAvaliacao.DelimitedText := cd_avaliacao;

   cd_avaliacao_tipo := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;
   cd_tipo := StrToInt( GetInfProvaTipo(arrCdAvaliacao.Strings[0], cd_avaliacao_tipo, 'cd_tipo') );

   if (cd_tipo = 3) and (not Self.ProcuraNotaSuficiencia( true, arrProvaSuficiencia )) and (cd_tipo <> opcInicial) then
   begin
      Mensagem('Já existe prova de proficiência paras as disciplinas abaixo: '+chr(13)+chr(13)+arrProvaSuficiencia.GetText , 'Operação cancelada!', MB_ICONWARNING + MB_OK);
      exit;
   end;

   if (cd_tipo = 4) and (not Self.ProcuraNotaRE( true )) and (cd_tipo <> opcInicial)  then
   begin
      Mensagem('Já existe uma Prova RE para esta turma/disciplina neste ano/semestre na etapa ' + txtPBim.Text, Application.Title, MB_OK + MB_ICONWARNING);
      exit;
   end;

   cd_turma := txtPTurma.Text;

   if (GetInfProvaTipo( cd_avaliacao, cd_avaliacao_tipo, 'sn_sem_limite_maxima') = '0') and (cd_avaliacao_tipo <> cdAvlTipoAnterior) then
   begin

      if ( GetQtdProvasTipo( StrToInt(sPAnoSem), cd_turma, StrToInt(txtPDisciplina.Text), StrToInt(txtPBim.Text), cd_avaliacao_tipo ) >=
           StrToInt(GetInfProvaTipo( cd_avaliacao, cd_avaliacao_tipo, 'nr_qtd_maxima' )) ) then
      begin
            Mensagem( 'Não é possível alterar a prova, foi excedido o número de provas para esta turma/disciplina.' );
            exit;
      end;

   end;

   dm.CriarConsulta(qUpdate);

   qUpdate.close();
   qUpdate.SQL.Clear();

   qUpdate.SQL.Text := 
   'UPDATE ' + 
      'diario_provas SET [$valores$] ' + 
   'WHERE ' +
      'anosemestre = ' + qyAux.ParamByName('anosem').AsString + ' AND ' +
      'turma = ''' + qyAux.ParamByName('turma').AsString + ''' AND ' +
      'disciplina = ' + qyAux.ParamByName('disciplina').AsString + ' AND ' +
      'bimestre = ' + qyAux.ParamByName('bimestre').AsString + ' AND ' +
      'nro_nota = ' + qyAux.ParamByName('nro_nota').AsString;

   LProva := nil;
   //verifica curso
   if (Length(txtPCurso.Text) = 0) then begin
      Mensagem('Um Curso precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   //verifica turma
   if (Length(txtPTurma.Text) = 0) then begin
      Mensagem('Uma turma precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   //verifica disciplina
   if (Length(txtPDisciplina.Text) = 0) then begin
      Mensagem('Uma Disciplina precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   //bimestre
   if (Length(txtPBim.Text) = 0) then begin
      Mensagem('Um Bimestre precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      Exit;
   end;

   if (Trim(txtPDiasBloq.Text) = '') then begin
      txtPDiasBloq.Text := '0';
   end;
   try
      StrToInt(txtPDiasBloq.Text);
   except
       txtPDiasBloq.Text := '0';
   end;

   sValores := '';

   with qUpdate do begin
      if qyAux.Active then begin

         if (trim(txtChave.Text) <> '') then begin
            LProva := Self.ProcuraChaveDuplicada(Self.txtChave.Text, qyAux.FieldByName('cd_prova').AsInteger);
         end;

         if (LProva <> nil) and Self.GetConfirmacao(LProva.Assunto, LProva.Professor.Nome) then
         begin
            sValores := 'anosemestre = '+sPAnoSem;
            sValores := sValores + ', turma = ''' + txtPTurma.Text+'''';
            sValores := sValores + ', disciplina = ' + txtPDisciplina.Text;
            sValores := sValores + ', bimestre = ' + txtPBim.Text;
            sValores := sValores + ', cd_professor = ' + IntToStr(LProva.Professor.Codigo);
            //Verifica se a conexão é Oracle ou MySQL
            if Connection.Protocol = 'oracle' then //Oracle
            begin
               sValores := sValores + ', data = TO_DATE(''' + FormatDateTime('yyyy-mm-dd', umdtPData.Date)+''', ''YYYY-MM-DD'') ';
            end else begin
               sValores := sValores + ', data = ''' + FormatDateTime('yyyy-mm-dd', umdtPData.Date)+'''';
            end;
            sValores := sValores + ', assunto = ''' + LProva.Assunto+'''';
            sValores := sValores + ', sn_bloqueado = ' + IntToStr(BoolParaInt[ckbBloqueiaProva.Checked]);

            sn_especial := 0;
            sn_compoe := 0;
            case cd_tipo of
              1: sn_compoe := 1; // Compõe nota substituível
              2: sn_compoe := 0; // Não compõe nota substituível
              4: sn_especial := 1; // Recuperação da Etapa
            end;

            sValores := sValores + ', sn_especial = ' + IntToStr(sn_especial);
            sValores := sValores + ', sn_compoe = ' + IntToStr(sn_compoe);
            sValores := sValores + ', nr_dias_bloqueio = ''' + txtPDiasBloq.Text+'''';
            sValores := sValores + ', ds_chave = ''' + txtChave.Text+'''';

            if trim(txtPPeso.Text) = '' then begin
              sValores := sValores + ', vl_peso = ''''';
            end else begin
              sValores := sValores + ', vl_peso = '''+txtPPeso.Text+'''';
            end;
            if trim(txtPNotaMinima.Text) = '' then begin
              sValores := sValores + ', nr_nota_minima = ''''';
            end else begin
              sValores := sValores + ', nr_nota_minima = '''+StringReplace(floatToStr(RC_StrToFloat(txtPNotaMinima.Text)),',','.',[])+'''';
            end;
            if trim(txtPNotaMaxima.Text) = '' then begin
              sValores := sValores + ', nr_nota_maxima = ''''';
            end else begin
              sValores := sValores + ', nr_nota_maxima = '''+StringReplace(floatToStr(RC_StrToFloat(txtPNotaMaxima.Text)),',','.',[])+'''';
            end;
            if cbTiposProvas.ItemIndex <= -1 then begin
               svalores := sValores + ', cd_avaliacao_tipo = NULL';
            end else begin
               svalores := sValores + ', cd_avaliacao_tipo = ' + IntToStr(cd_avaliacao_tipo);
            end;
            FreeAndNil(LProva);
         end
         else if LProva = nil then
         begin
            sValores := 'anosemestre = '+sPAnoSem;
            sValores := sValores + ', turma = '''+txtPTurma.Text+'''';
            sValores := sValores + ', disciplina = '+txtPDisciplina.Text;
            sValores := sValores + ', bimestre = '+txtPBim.Text;
            if Self.cbResponsavel.ItemIndex <> -1 then
            begin
               sValores := sValores + ', cd_professor = '+IntToStr(TProfessor(Self.cbResponsavel.Items.Objects[Self.cbResponsavel.ItemIndex]).Codigo);
               sValores := sValores + ', sn_bloqueado = '+IntToStr(BoolParaInt[ckbBloqueiaProva.Checked]);               
            end
            else
            begin
               sValores := sValores + ', cd_professor = '+txtPProf.Text;
               sValores := sValores + ', sn_bloqueado = '+IntToStr(Ord(ckbBloqueiaProva.Checked));
            end;

            //Verifica se a conexão é Oracle ou MySQL
            if Connection.Protocol = 'oracle' then //Oracle
            begin
               sValores := sValores + ', data = TO_DATE('''+FormatDateTime('yyyy-mm-dd', umdtPData.Date)+''', ''YYYY-MM-DD'')';
            end else begin
               sValores := sValores + ', data = "'+FormatDateTime('yyyy-mm-dd', umdtPData.Date)+'"';
            end;
            sValores := sValores + ', assunto = '''+txtPAssunto.Text+'''';

            sn_especial := 0;
            sn_compoe := 0;
            sn_proficiencia := 0;
            case cd_tipo of
              1: sn_compoe := 1; // Compõe nota substituível
              2: sn_compoe := 0; // Não compõe nota substituível
              3: sn_proficiencia := 1; // Prova Suficiência
              4: sn_especial := 1; // Recuperação da Etapa
            end;

            sValores := sValores + ', sn_especial = '+IntToStr(sn_especial);
            sValores := sValores + ', sn_compoe = '+IntToStr(sn_compoe);
            sValores := sValores + ', nr_dias_bloqueio = '+IntToStr(StrToInt(txtPDiasBloq.Text));
            sValores := sValores + ', ds_chave = '''+txtChave.Text+'''';
            sValores := sValores + ', sn_proficiencia = '+IntToStr(sn_proficiencia);

            if trim(txtPPeso.Text) = '' then begin
              sValores := sValores + ', vl_peso = ''''';
            end else begin
               sValores := sValores + ', vl_peso = '+txtPPeso.Text;
            end;
            if trim(txtPNotaMinima.Text) = '' then begin
              sValores := sValores + ', nr_nota_minima = ''''';
            end else begin
              sValores := sValores + ', nr_nota_minima = '+StringReplace(FloatToStr(RC_StrToFloat(txtPNotaMinima.Text)),',','.',[]);
            end;
            if trim(txtPNotaMaxima.Text) = '' then begin
              sValores := sValores + ', nr_nota_maxima = ''''';
            end else begin
              sValores := sValores + ', nr_nota_maxima = '+StringReplace(floatToStr(RC_StrToFloat(txtPNotaMaxima.Text)),',','.',[]);
            end;
            if cbTiposProvas.ItemIndex <= -1 then begin
               svalores := sValores + ', cd_avaliacao_tipo = NULL';
            end else begin
               svalores := sValores + ', cd_avaliacao_tipo = ' + IntToStr(cd_avaliacao_tipo);
            end;
         end
         else
         begin
            Cancel;
            Exit;
         end;

         //Setar a variável com os parametros que serão alterados
         qUpdate.SQL.Text := StringReplace(qUpdate.SQL.Text, '[$valores$]', sValores, []);

         ExecSQL;

         {TRATAMENTO DISCIPLINAS COM FRENTES}

         // Busca a disciplina frente da disciplina que o usuário está excluindo
         iDisciplinaFrente := DM.getDisciplinaFrente(
            qyAux.ParamByName('disciplina').AsInteger,
            qyAux.ParamByName('anosem').AsInteger,
            qyAux.ParamByName('turma').AsString
         );

         // Se é uma disciplina frente
         if iDisciplinaFrente > 0 then begin

            // Busca se o parâmetro é do que copia todas avaliações para a mãe ou é por tipo de avl
            avl_param_frente_media := UpperCase(ClasseTurmas.GetParametroAvaliacao(
               qyAux.ParamByName('anosem').AsInteger,
               qyAux.ParamByName('turma').AsString,
               qyAux.ParamByName('disciplina').AsString,
               'sn_disc_frente_media'
            ));

            if avl_param_frente_media = '1' then
            begin

               {
                  Atualiza as provas de acordo com a prova origem que está sendo alterada
               }

               Stmt := PrepareStatement(SQL_UPDATE_NOTAS_FRENTE);

               try
                  Stmt.SetString(1, FormatDateTime('yyyy-mm-dd', umdtPData.Date));
                  Stmt.SetString(2, txtPPeso.Text);
                  Stmt.SetString(3, txtPAssunto.Text);
                  Stmt.SetString(4, IntToStr(cd_avaliacao_tipo));
                  Stmt.SetInt(5, qyAux.FieldByName('cd_prova').AsInteger);
                  Stmt.ExecutePrepared;

               finally
                  Stmt.Close;
                  Stmt := nil;
               end;
            end;
         end;

         // Inserir log de alteração de aulas
         logDesc := '';
         logDesc := logDesc + 'Nro. Prova: '+qyAux.ParamByName('nro_nota').AsString+', '+ CHR(13);
         logDesc := logDesc + 'Data: '+FormatDateTime('yyyy-mm-dd', umdtPData.Date)+', '+ CHR(13);
         logDesc := logDesc + 'Peso: '+txtPPeso.Text+', '+ CHR(13);
         logDesc := logDesc + 'Assunto: '+txtPAssunto.Text+', '+ CHR(13);

         if cd_tipo = 1 then
         begin
            logDesc := logDesc + 'Compõe nota substituível: Sim, '+ CHR(13);
         end
         else if cd_tipo = 2 then
         begin
            logDesc := logDesc + 'Compõe nota substituível: Não, '+ CHR(13);
         end
         else if cd_tipo = 3 then
         begin
            logDesc := logDesc + 'Prova de suficiência: Sim, '+ CHR(13);
         end
         else if cd_tipo = 4 then
         begin
            logDesc := logDesc + 'Recuperação Etapa: Sim, '+ CHR(13);
         end;

         logDesc := logDesc + 'Anosemestre: '+qyAux.ParamByName('anosem').AsString+', ' + CHR(13);
         logDesc := logDesc + 'Turma: '+qyAux.ParamByName('turma').AsString+', ' + CHR(13);
         logDesc := logDesc + 'Disciplina: '+qyAux.ParamByName('disciplina').AsString+', ' + CHR(13);
         logDesc := logDesc + 'Etapa: '+qyAux.ParamByName('bimestre').AsString+', ' + CHR(13);
         logDesc := logDesc + 'Grupo: '+edGrupoProvas.Text+', ' + CHR(13);
         logDesc := logDesc + 'Tipo de Avaliação: ' + Inttostr(cd_tipo) +', '+ CHR(13);
         logDesc := logDesc + 'Bloquear Prova: ' + IntToStr(BoolParaInt[ckbBloqueiaProva.Checked]) + CHR(13);

         if(txtPProf.Text = '0') then
         begin
            logDesc := logDesc + 'Compartilhada: 1';
         end else begin
            logDesc := logDesc + 'Compartilhada: 0';
         end;
         logDesc := logDesc + CHR(13) + '[Acadêmico]';

         { Insere log de alteração de provas }
         DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_PROVA, logDesc, StrToInt(txtPProf.Text));
      end;
   end;

   qUpdate.Close();
   FreeAndNil(qUpdate);
   qyAux.Close();
   Self.ModalResult := mrOk;
   Self.CloseModal();
end;

procedure TfrmAulasProvasAcoes.SalvarRegistroAula;
begin
   if bInsere then
   begin
      Processando(True);
      Application.ProcessMessages();

      if InsereAulasDados() then
      begin
         Processando(False);
         qyAux.Close();
         qyAux2.Close();
         Self.ModalResult := mrOk;
         Self.CloseModal();
      end else begin
         Processando(False);
         qyAux.Close();
         qyAux2.Close();
      end;
   end else begin
      if DM.temExpedienteInstituicao( umdtDataInic.Date, False, DM.getColigadaTurma(txtTurma.Text,DM.GetAnoSemestreAtual)) then
      begin
         qyAux.Close();
         qyAux.Open();
         if SalvaAulaAtuDados() then
         begin
            Self.ModalResult := mrOk;
            Self.CloseModal();
         end;
         qyAux.Close();
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.udBimClick(Sender: TObject; Button: TUDBtnType);
var
   i: Integer;
   ed: TEdit;
begin
   if pcAulas.ActivePage = tsAulas then begin
      ed := txtBim;
   end
   else begin
      ed := txtPBim;
   end;

   if ed.Text = '' then begin
      ed.Text := '1';
   end
   else begin
      try
         i := StrToInt(ed.Text);
      except
         i := 1;
      end;
      if Button = btNext then begin
         Inc(i);
      end
      else begin
         if (i > 1) then begin
            Dec(i);
         end;
      end;
      ed.Text := IntToStr(i);
   end;
end;

procedure TfrmAulasProvasAcoes.udPSerieClick(Sender: TObject;
  Button: TUDBtnType);
var
   iCont: Integer;
   ed: TEdit;
   aSeries: array of integer;
begin
   ed := nil;

   qyAux2.Close();
   qyAux2.SQL.Clear();
   qyAux2.SQL.Text := 'Select                    '+
                     ' 	serie                   '+
                     'FROM                      '+
                     '   gradecurricular as  g  '+
                     'WHERE                     '+
                     '   g.curso = :curso       '+
                     'GROUP BY                  '+
                     '   g.serie                ';

   qyAux2.ParamByName('curso').AsString:= txtPCurso.Text;

   qyAux2.Open();

   SetLength(aSeries,qyAux2.RecordCount);

   qyAux2.First();
   iCont:=0;

   while not qyAux2.Eof do begin
      aSeries[iCont]:=qyAux2.FieldByName('serie').AsInteger;
      qyAux2.Next();
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
        //FiltroGridAulas();

      end;
   except
      ed.Text := '1';
   end;

   ListaProvaTurmasDisciplinas;

end;

procedure TfrmAulasProvasAcoes.udSerieClick(Sender: TObject;
  Button: TUDBtnType);
var
   iCont: Integer;
   ed: TEdit;
   aSeries: array of integer;
begin
   ed := nil;

   qyAux2.Close();
   qyAux2.SQL.Clear();
   qyAux2.SQL.Text := 'Select                    '+
                     ' 	serie                   '+
                     'FROM                      '+
                     '   gradecurricular as  g  '+
                     'WHERE                     '+
                     '   g.curso = :curso       '+
                     'GROUP BY                  '+
                     '   g.serie                ';

   qyAux2.ParamByName('curso').AsString:= txtCurso.Text;

   qyAux2.Open();

   SetLength(aSeries,qyAux2.RecordCount);

   qyAux2.First();
   iCont:=0;

   while not qyAux2.Eof do begin
      aSeries[iCont]:=qyAux2.FieldByName('serie').AsInteger;
      qyAux2.Next();
      Inc(iCont);
   end;

   try
      if ed.Text = '' then begin
        ed.Text := IntToStr(aSeries[0]);
        exit;
      end
      else begin

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
        //FiltroGridAulas();
      end;
   except
      ed.Text := '1';
   end;

end;

procedure TfrmAulasProvasAcoes.umdtFimDiarioChangeDate(Sender: TObject);
begin
   alterouDtFim := True;
end;

procedure TfrmAulasProvasAcoes.umdtInicioDiarioChangeDate(Sender: TObject);
begin
   alterouDtInicio := True;
end;

procedure TfrmAulasProvasAcoes.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
var
   i: Integer;
begin
   if qyComplnr_etapa.AsString = '' then begin
      qyComplnr_etapa.AsString := '1';
   end
   else begin
      try
         i := StrToInt(qyComplnr_etapa.AsString);
      except
         i := 1;
      end;
      if Button = btNext then begin
         Inc(i);
      end
      else begin
         if (i > 1) then begin
            Dec(i);
         end;
      end;
      qyComplnr_etapa.AsString := IntToStr(i);
   end;
end;

procedure TfrmAulasProvasAcoes.upDownEtapaChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
begin
   edBimestre.Text := inttostr(NewValue);
end;

function TfrmAulasProvasAcoes.utilizaSegundaAula: Boolean;
begin
   Result := (DiaDaSemana(dtpDataAula1.Date) <> DiaDaSemana(dtpDataAula2.Date)) AND (strtoint(edQtdAulas.Text) > 1);
end;

function TfrmAulasProvasAcoes.ValidaHorariosProfessor: Boolean;
var
   I, horario: Integer;
   msgErro, msg: String;
   data: TDate;
begin
   Result := True;
   msg := 'Os seguintes horários conflitaram com outros horários do professor: ' + chr(13);

   for I := 1 to StrToInt(edQtdAulas.Text) do
   begin

      msgErro := '';

      if FindComponent('dtpDataAula' + IntToStr(I)) <> nil then
      begin
         data := TUMDateTimePicker(FindComponent('dtpDataAula' + IntToStr(I)) ).getDate;
         horario := StrToInt(TItemCombo(TUMComboBox(FindComponent('cbHorarioAula' + IntToStr(I)) ).Items.Objects[TUMComboBox(FindComponent('cbHorarioAula' + IntToStr(I))).ItemIndex]).getCodigo());
      end
      else
      begin
         data := TUMDateTimePicker(sbAulas.FindComponent('dtpDataAula' + IntToStr(I))).getDate;
         horario := StrToInt(TItemCombo(TUMComboBox(sbAulas.FindComponent('cbHorarioAula' + IntToStr(I))).Items.Objects[TUMComboBox(sbAulas.FindComponent('cbHorarioAula' + IntToStr(I))).ItemIndex]).getCodigo());
      end;

      msgErro := EhHorarioValido( StrToInt(txtCronogramasProfessor.Text), horario, StrToInt(sCronogramaDisciplina), StrToInt(sCronogramaAnoSem), data, sCronogramaTurma );

      if msgErro <> '' then
      begin
         Result := False;
         msg := msg + 'Detectados conflitos na ' + IntToStr(I) + 'ª aula com a turma/disciplina: ' + Chr(13) + msgErro + Chr(13) + Chr(13);
      end;
   end;

   if not Result then
      Mensagem(msg, 'Conflito de Horários', MB_OK + MB_ICONWARNING, Handle);   
end;

procedure TfrmAulasProvasAcoes.udAulasClick(Sender: TObject;
  Button: TUDBtnType);
var
   i: Integer;
begin
   if txtBim.Text = '' then begin
      txtBim.Text := '1';
   end
   else begin
      try
         i := StrToInt(txtAulas.Text);
      except
         i := 1;
      end;
      if Button = btNext then
      begin

         if ckbConfGrade.checked then
         begin
            if (i < valorMaximoAula) then
            begin
               Inc(i);
            end;
         end
         else
         begin
            Inc(i);
         end;
      end
      else begin
         if (i > 1) then begin
            Dec(i);
         end;
      end;
      txtAulas.Text := IntToStr(i);
   end;
end;

procedure TfrmAulasProvasAcoes.btCancelarClick(Sender: TObject);
begin
   if pcAulas.ActivePage = tsComplemento then begin
      if (qyCompl.State in [dsInsert, dsEdit]) then begin
         qyCompl.Cancel;
      end;

   end;
   qyAux.Close();
   Self.ModalResult := mrCancel;
   Self.CloseModal();
end;

procedure TfrmAulasProvasAcoes.InsereProvasDados;
const
   BoolParaInt: array[boolean] of Integer = (0,1);
var
   i                    : Integer;
   bAux                 : Boolean;
   sCola                : string[3];
   sAux                 : string;
   iProx                : Integer;
   bEspecial            : Boolean;
   slNumerosProva       : TStringList;
   LProva               : TProva;
   LBIntegrarProva      : boolean;
   sCdDisciplina        : string;
   arrProvaSuficiencia  : TStringList;
   sCdProvaSuficiencia  : string;
   logDesc              : string;
   slItemCheckListBox   : TStringList;
   cd_avaliacao         : String;
   cd_avaliacao_tipo    : Integer;
   cd_tipo              : Integer;
   sn_especial          : Integer;
   sn_compoe            : Integer;
   sn_proficiencia      : Integer;
   arrCdAvaliacao       : TStringList;
   snBloqueada          : string;
   arrInfs              : TStringList;
   iDisciplinaFrente    : Integer;
   bProvaDisciplinaFrente : boolean;
   arrNroProvas         : TStringList;
   iNrProva             : Integer;
   listProf             : TStringList;
   avl_param_frente_media : String;
begin
   { Se não possui expediente, cai fora }
   if not DM.temExpedienteInstituicao( umdtPData.Date, False, Self.iCodColigada ) then
      Exit;

   slItemCheckListBox := TStringList.Create();
   arrInfs := TStringList.Create();
   arrNroProvas := TStringList.Create();
   arrNroProvas.Clear();
   arrProvaSuficiencia :=  TStringList.Create();

   sCdDisciplina        := '';

   //verifica curso
   if (Length(txtPCurso.Text) = 0) then begin
      Mensagem('Um Curso precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      self.SetFocus;
      Exit;
   end;

   if (trim(txtChave.Text) <> '') then begin
//      if chaveDuplicada(txtChave.text) then begin
//        Mensagem('Chave da Prova Duplicada.', 'Atenção!', MB_ICONWARNING + MB_OK);
//        Exit;
//      end;
      LProva := Self.ProcuraChaveDuplicada(Self.txtChave.Text);
   end;

   try
      if bUsaListaTurmas then
         cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sListaTurmas, sPDisciplina, 'cd_avaliacao', True)
      else
         cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sPTurma, sPDisciplina, 'cd_avaliacao');
   except on E: Exception do
   end;

   arrCdAvaliacao := TStringList.Create();

   arrCdAvaliacao.delimiter := ',';
   arrCdAvaliacao.DelimitedText := cd_avaliacao;

   cd_avaliacao_tipo := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;
   cd_tipo := StrToInt( GetInfProvaTipo(arrCdAvaliacao.Strings[0], cd_avaliacao_tipo, 'cd_tipo') );

   if (cd_tipo = 3) and (not Self.ProcuraNotaSuficiencia( false, arrProvaSuficiencia )) then
   begin
      Mensagem('Já existe prova de proficiência paras as disciplinas abaixo: '+chr(13)+chr(13)+arrProvaSuficiencia.GetText, 'Operação cancelada!', MB_ICONWARNING + MB_OK);
      exit;
   end;

   if (cd_tipo = 4) and (not Self.ProcuraNotaRE( false )) then
   begin
      Mensagem('Já existe uma Prova RE para esta turma/disciplina neste ano/semestre na etapa ' + txtPBim.Text, Application.Title, MB_OK + MB_ICONWARNING);
      exit;
   end;

   LBIntegrarProva := (LProva <> nil) and Self.GetConfirmacao(LProva.Assunto, LProva.Professor.Nome);
   if (not LBIntegrarProva) and (LProva <> nil) then Exit;

   Processando(True);
   bAux := False;

   //verifica turmas disciplinas
   for i := 0 to clbPTD.Count-1 do begin
      if clbPTD.Checked[i] then begin
         bAux := True;
         Break;
      end;
   end;
   if not bAux then begin
      Mensagem('Um Item de Turmas/Disciplinas precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      self.SetFocus;
      Exit;
   end;

   // Verifica se possui disciplina frente e duplica a prova para ela se houver necessidade
   for i := 0 to clbPTD.Count-1 do begin
      if clbPTD.Checked[i] then begin
         // Retorna a disciplina frente
         iDisciplinaFrente := DM.getDisciplinaFrente(
            StrToInt(Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i]))),
            StrToInt(sPAnoSem),
            Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3)
         );

         // Verifica se deve copiar as provas por tipo (Como no Decisivo), ou copiar todas as provas para a mãe
         avl_param_frente_media := UpperCase(ClasseTurmas.GetParametroAvaliacao(
          StrToInt(sPAnoSem),
          Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3),
          Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i])),
          'sn_disc_frente_media'
         ));
      end;
   end;

   if cd_tipo = 4 then begin
      bEspecial := True;
      sAux := 'REPLACE INTO ';
   end
   else begin
      bEspecial := False;
      sAux := 'INSERT INTO ';
   end;

   slNumerosProva := TStringList.Create();
   slNumerosProva.Clear();

   with qyAux2 do begin
      SQL.Clear();
      Params.Clear();
      SQL.Add(
        sAux 
        + ' diario_provas ( '
        + '     turma, cd_professor, disciplina, anosemestre, bimestre, data,'
        + '     assunto,sn_bloqueado, sn_proficiencia, nro_nota, sn_especial, '
        + '     sn_compoe, nr_dias_bloqueio, ds_chave, vl_peso, nr_nota_minima,'
        + '     nr_nota_maxima, cd_avaliacao_tipo, cd_grupo, dt_inclusao '
        + ' ) VALUES '
      );

      for i := 0 to clbPTD.Count-1 do begin


         if clbPTD.Checked[i] then begin

            if bEspecial then begin
               iProx := -1;
            // nao é especial
            end else begin
               SplitString(slPTurmaDisc[i], '[:separadorinterno:]', arrInfs);

               if slNumerosProva.Values[slPTurmaDisc.Strings[i]] <> '' then
               begin
                  iProx := StrToInt(slNumerosProva.Values[slPTurmaDisc.Strings[i]]);
                  iProx := iProx+1; // Já foi criada uma prova para essa turma/disciplina então inscrementa 1 no número da prova
                  slNumerosProva.Values[slPTurmaDisc.Strings[i]] := IntToStr(iProx);
               end else begin
                  iProx := Dm.getNroProximaProva(StrToInt(sPAnoSem), arrInfs[0], StrToInt(arrInfs[1]), StrToInt(txtPBim.Text));
                  slNumerosProva.Add(slPTurmaDisc.Strings[i]+'='+IntToStr(iProx));
               end;

            end; //if bespecial

            if (Trim(txtPDiasBloq.Text) = '') then begin
               txtPDiasBloq.Text := '0';
            end;
            try
               StrToInt(txtPDiasBloq.Text);
            except
                txtPDiasBloq.Text := '0';
            end;
            if LBIntegrarProva then
            begin
               if ( iDisciplinaFrente >= 0 ) and ( cd_tipo = 4 ) and ( avl_param_frente_media <> '0' ) then
                sAux := sCola + ' (' +
                  Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1) + ',' + IntToStr(LProva.Professor.Codigo) + ',' +
                  IntToStr( iDisciplinaFrente ) + ',' +
                  sPAnoSem + ',' + Self.txtPBim.Text + ','
               else
                sAux := sCola + ' (' +
                  Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1) + ',' + IntToStr(LProva.Professor.Codigo) + ',' +
                  Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i])) + ',' +
                  sPAnoSem + ',' + Self.txtPBim.Text + ',';
            end
            else
            begin
               if Self.cbResponsavel.ItemIndex <> -1 then
               begin
                  if ( iDisciplinaFrente >= 0 ) and ( cd_tipo = 4 ) and ( avl_param_frente_media <> '0' ) then
                    sAux := sCola + ' (' +
                     Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1) + ',' +
                     IntToStr(TProfessor(Self.cbResponsavel.Items.Objects[Self.cbResponsavel.ItemIndex]).Codigo) + ',' +
                     IntToStr( iDisciplinaFrente ) + ',' +
                     sPAnoSem + ',' + txtPBim.Text + ','
                  else
                    sAux := sCola + ' (' +
                     Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1) + ',' +
                     IntToStr(TProfessor(Self.cbResponsavel.Items.Objects[Self.cbResponsavel.ItemIndex]).Codigo) + ',' +
                     Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i])) + ',' +
                     sPAnoSem + ',' + txtPBim.Text + ',';
               end
               else
               begin
                  // Se a disciplina possuir grupo e for uma prova de RE ou Suficiência, o professor obrigatóriamente é 0 (compartilhada)
                  if (Length(edGrupoProvas.Text) > 0) and ((cd_tipo = 3) or (cd_tipo = 4)) then
                  begin
                     // Cadastra com o professor 0 (compartilada)
                     if ( iDisciplinaFrente >= 0 ) and ( cd_tipo = 4 ) and ( avl_param_frente_media <> '0' ) then
                      sAux := sCola + ' (' + Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1)+', 0, '+ IntToStr( iDisciplinaFrente ) + ', ' + sPAnoSem + ', ' + txtPBim.Text + ', '
                     else
                      sAux := sCola + ' (' + Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1)+', 0, '+Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i])) + ', ' + sPAnoSem + ', ' + txtPBim.Text + ', ';
                  end else begin
                     // Cadastra com o professor selecionado na checkbox
                     if ( iDisciplinaFrente >= 0 ) and ( cd_tipo = 4 ) and ( avl_param_frente_media <> '0' ) then
                      sAux := sCola + ' (' + Copy( slPTurmas.Strings[i], 0 ,LastDelimiter( ',',  slPTurmas.Strings[i]  )) + IntToStr( iDisciplinaFrente ) + ', ' + sPAnoSem + ', ' + txtPBim.Text + ', '
                     else
                      sAux := sCola + ' (' + slPTurmas.Strings[i] + ', ' + sPAnoSem + ', ' + txtPBim.Text + ', ';
                  end;
                  SplitString(slPTurmas.Strings[i],',',listProf);
               end;
            end;
            if Connection.Protocol = 'oracle' then //Oracle
            begin
               sAux := sAux + ' TO_DATE(''' + FormatDateTime('yyyy-mm-dd', umdtPData.Date) + ''', ''YYYY-MM-DD''), ';
            end else begin
               //MySQL
               sAux := sAux + ' "' + FormatDateTime('yyyy-mm-dd', umdtPData.Date) + '", ';
            end;

            if LBIntegrarProva then
            begin
               sAux := sAux + ' ''' + LProva.Assunto + ''', 1, ';
            end
            else if Self.cbResponsavel.ItemIndex <> -1 then
            begin
               sAux := sAux + ' ''' + txtPAssunto.text + ''', 0, ';
            end
            else
            begin
               if ckbBloqueiaProva.State = cbChecked then begin
                  sAux := sAux + ' ''' + txtPAssunto.text + ''', 1, ';
               end else if ckbBloqueiaProva.State = cbUnchecked then begin
                  sAux := sAux + ' ''' + txtPAssunto.text + ''', 0, ';
               end else if ckbBloqueiaProva.State = cbGrayed then begin
                     cd_avaliacao := '';
                     cd_avaliacao_tipo := 0;

                     cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3), sPDisciplina, 'cd_avaliacao');
                     cd_avaliacao_tipo := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;

                     snBloqueada := '';
                     snBloqueada := GetInfProvaTipo(cd_avaliacao, cd_avaliacao_tipo, 'sn_bloqueada');

                     sAux := sAux + ' ''' + txtPAssunto.text + ''', '+snBloqueada+', ';
               end;


            end;

            sn_especial := 0;
            sn_compoe := 0;
            sn_proficiencia := 0;
            case cd_tipo of
              1: sn_compoe := 1; // Compõe nota substituível
              2: sn_compoe := 0; // Não compõe nota substituível
              3: sn_proficiencia := 1; // Prova Suficiência
              4: sn_especial := 1; // Recuperação da Etapa
            end;

            sAux := sAux + IntToStr(sn_proficiencia) + ', ';
            sAux := sAux + ' ' +  IntToStr(iProx) + ', ' + IntToStr(sn_especial) + ', ' + IntToStr(sn_compoe) + ', ';
            sAux := sAux + ' ' +  txtPDiasBloq.Text + ', ''' + txtChave.Text + '''';
            if trim(txtPPeso.Text) <> ''  then
              sAux := sAux + ', ' + txtPPeso.Text + ''
            else
              sAux := sAux + ', NULL ';

            { Adiciona valor da Nota Mínima }
            if trim(txtPNotaMinima.Text) <> '' then
               sAux := sAux + ', ' + StringReplace(txtPNotaMinima.Text,',','.',[]) + ''
            else
               sAux := sAux + ', NULL ';

            { Adiciona valor da Nota Máxima }
            if trim(txtPNotaMaxima.Text) <> '' then
               sAux := sAux + ', ' + StringReplace(txtPNotaMaxima.Text,',','.',[]) + ''
            else
               sAux := sAux + ', NULL ';

            { Tipo de Prova }
            if (cd_avaliacao_tipo <= 0) then
               sAux := sAux + ', NULL'
            else
               sAux := sAux + ', ' + IntToStr(cd_avaliacao_tipo);

            { Grupo de Prova }
            // Vincula a prova ao grupo se o grupo estiver informado e a prova não for RE ou Proficiência
            if (Length(edGrupoProvas.Text) > 0) and ((cd_tipo = 1) or (cd_tipo = 2)) then
            begin
               sAux := sAux + ', ' + edGrupoProvas.Text;
            end else begin
               sAux := sAux + ', NULL';
            end;

            // adiciona a data de inclusao
            sAux := sAux
                    + ', "'
                    + FormatDateTime('YYYY-MM-DD HH:MM', Now)
                    + '" ';

            { Fim do SQL }
            sAux := sAux + ' ' + ')';
            sCola := ', ';

            SQL.Add(sAux);

            // Inserir log de inserção de aulas
            logDesc := '';
            logDesc := logDesc + 'Nro. Prova: '+IntToStr(iProx)+', ' + CHR(13);
            logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', umdtPData.Date)+', '+ CHR(13);
            logDesc := logDesc + 'Peso: '+txtPPeso.Text+', '+ CHR(13);
            logDesc := logDesc + 'Assunto: '+txtPAssunto.text+', '+ CHR(13);

            if cd_tipo = 1 then
            begin
               logDesc := logDesc + 'Compõe nota substituível: Sim, '+ CHR(13);
            end
            else if cd_tipo = 2 then
            begin
               logDesc := logDesc + 'Compõe nota substituível: Não, '+ CHR(13);
            end
            else if cd_tipo = 3 then
            begin
               logDesc := logDesc + 'Prova de suficiência: Sim, '+ CHR(13);
            end
            else if cd_tipo = 4 then
            begin
               logDesc := logDesc + 'Recuperação Etapa: Sim, '+ CHR(13);
            end;

            logDesc := logDesc + 'Anosemestre: '+sPAnoSem+', '+ CHR(13);
            logDesc := logDesc + 'Turma: '+Copy(slPTurmas.Strings[i], 1, Pos(',', slPTurmas.Strings[i]) - 1)+', '+ CHR(13);
            logDesc := logDesc + 'Disciplina: '+Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i]))+', '+ CHR(13);
            logDesc := logDesc + 'Etapa: '+txtPBim.Text+', '+ CHR(13);
            logDesc := logDesc + 'Grupo: '+edGrupoProvas.Text+', '+ CHR(13);
            logDesc := logDesc + 'Tipo de Avaliação: ' + Inttostr(cd_tipo) + ' '+ CHR(13);
            logDesc := logDesc + 'Bloquear Prova: ' + IntToStr(BoolParaInt[ckbBloqueiaProva.Checked]) + CHR(13);

            if(listProf <> nil) AND (listProf[1] = '0') then
            begin
               logDesc := logDesc + 'Compartilhada: 1'+ CHR(13);
            end else begin
               logDesc := logDesc + 'Compartilhada: 0'+ CHR(13);
            end;
            logDesc := logDesc + CHR(13) + '[Acadêmico]';

            SplitString(slPTurmas.Strings[i], ',',slItemCheckListBox);


            { Insere log de inserção de provas }
            DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_PROVA, logDesc, StrToInt(slItemCheckListBox[1]) );

         end;
         arrNroProvas.Add(IntToStr(iProx));
      end; //end for

      ExecSQL();

      Close();
      slNumerosProva.Clear();
      FreeAndNil(slNumerosProva);
      Processando(False);
   end;

   if Assigned(LProva) then
   begin
      FreeAndNil(LProva);
   end;
   qyAux.Close();
   qyAux2.Close();

   FreeAndNil(arrProvaSuficiencia);

   Self.ModalResult := mrOk;
   Self.CloseModal();

   FreeAndNil(slItemCheckListBox);

   { PROGRAMAÇÂO DE DISCIPLINAS COM FRENTES }

   // Verifica se possui disciplina frente e duplica a prova para ela se houver necessidade
   for i := 0 to clbPTD.Count-1 do begin
      if clbPTD.Checked[i] then begin
         // Retorna a disciplina frente
         iDisciplinaFrente := DM.getDisciplinaFrente(
            StrToInt(Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i]))),
            StrToInt(sPAnoSem),
            Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3)
         );

         // Se a disciplina frente existe
         if iDisciplinaFrente > 0 then
         begin

            // Verifica se deve copiar as provas por tipo (Como no Decisivo), ou copiar todas as provas para a mãe
            avl_param_frente_media := UpperCase(ClasseTurmas.GetParametroAvaliacao(
               StrToInt(sPAnoSem),
               Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3),
               Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i])),
               'sn_disc_frente_media'
            ));

            if avl_param_frente_media = '0' then
            begin

               // Verifica se na disciplina frente já possui uma prova criada com o mesmo tipo
               bProvaDisciplinaFrente := Dm.existeProvaDisciplinaFrente(
                  StrToInt(sPAnoSem),
                  Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3),
                  iDisciplinaFrente,
                  StrToInt(txtPBim.Text),
                  cd_avaliacao_tipo
               );

               // Se não existe a prova ainda na disciplina pai duplica a mesma para ela
               if not bProvaDisciplinaFrente then
               begin
                  Dm.DuplicarProvaDisciplinaFrente(
                     StrToInt(sPAnoSem),
                     txtPCurso.Text,
                     Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3),
                     StrToInt(Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i]))),
                     iDisciplinaFrente,
                     StrToInt(txtPBim.Text),
                     StrToInt(arrNroProvas.Strings[i]),
                     false,
                     cd_tipo
                  );
               end;
            end else begin
               if avl_param_frente_media <> '2' then
               begin
                 //Caso parâmetro defina que deve sempre duplicar
                 Dm.DuplicarProvaDisciplinaFrente(
                    StrToInt(sPAnoSem),
                    txtPCurso.Text,
                    Copy(slPTurmas.Strings[i], 2, Pos(',', slPTurmas.Strings[i]) - 3),
                    StrToInt(Copy(slPTurmas.Strings[i], LastDelimiter(',', slPTurmas.Strings[i]) + 1, Length(slPTurmas.Strings[i]))),
                    iDisciplinaFrente,
                    StrToInt(txtPBim.Text),
                    StrToInt(arrNroProvas.Strings[i]),
                    true,
                    cd_tipo
                  );
               end;

            end;

         end;

      end;
   end;

end;

function TfrmAulasProvasAcoes.existeGrupo(nr_anosemestre: Integer; cd_curso,
  cd_turma: String; cd_disciplina: Integer): Boolean;
const
   SQL_VERIFICA_GRUPO = ' SELECT '+
                        '     COUNT(cd_grupo) total '+
                        ' FROM '+
                        '     diario_grupos '+
                        ' WHERE '+
                        '     nr_anosemestre = :nr_anosemestre AND '+
                        '     cd_curso LIKE :cd_curso AND '+
                        '     cd_turma LIKE :cd_turma AND '+
                        '     cd_disciplina = :cd_disciplina AND '+
                        '     sn_ativo = 1 ';
var
   qyVerifica: TUMZQuery;
begin
   DM.CriarConsulta(qyVerifica);

   qyVerifica.Close;
   qyVerifica.SQL.Text := SQL_VERIFICA_GRUPO;
   qyVerifica.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyVerifica.ParamByName('cd_curso').AsString := cd_curso;
   qyVerifica.ParamByName('cd_turma').AsString := cd_turma;
   qyVerifica.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyVerifica.Open;

   Result := (qyVerifica.FieldByName('total').AsInteger > 0);
end;

procedure TfrmAulasProvasAcoes.fechaDiario(nr_bimestre, nr_anosemestre, cd_disciplina: Integer; cd_curso, cd_turma: String);
const
   {SQL_INFO_DIARIOS =
      ' SELECT nr_anosemestre, cd_curso, cd_turma, cd_disciplina FROM diario_grupos WHERE cd_grupo = :cd_grupo ';}

   SQL_DIARIOS_FECHAR =
      'UPDATE '+
      '	diario_turmas '+
      'SET '+
      '	sn_diario_fechado = 1 '+
      'WHERE '+
      '	anosemestre = :anosemestre '+
      '	AND bimestre = :bimestre '+
      '	AND curso = :curso '+
      '	AND disciplina = :disciplina '+
      '	AND turma = :turma ';

var
   qyDiarios: TUMZQuery;
begin
   DM.CriarConsulta(qyDiarios);

   qyDiarios.SQL.Text := SQL_DIARIOS_FECHAR;
   
   qyDiarios.ParamByName('anosemestre').AsInteger := nr_anosemestre;
   qyDiarios.ParamByName('bimestre').AsInteger := nr_bimestre;
   qyDiarios.ParamByName('curso').AsString := cd_curso;
   qyDiarios.ParamByName('disciplina').AsInteger := cd_disciplina;
   qyDiarios.ParamByName('turma').AsString := cd_turma;
   qyDiarios.ExecSQL;
end;

procedure TfrmAulasProvasAcoes.IncluirCronograma(anosemestre: Integer;
  turma: String; disciplina, professor: Integer; data: TDateTime;
  confirmado: Boolean; valor: Double; horario: Integer; Substituto : Integer; cd_grupo : Integer;
  cd_sala: Integer; ds_sala: String; bimestre : Integer);
var
   logDesc: String;
begin
   qCronograma.Cancel;

   // Insere uma vez separado por causa da primeira aula
   qCronograma.Insert;

   qCronograma.FieldByName( 'turma' ).AsString := turma;
   qCronograma.FieldByName( 'anosemestre' ).AsInteger := anosemestre;
   qCronograma.FieldByName( 'disciplina' ).AsInteger := disciplina;
   qCronograma.FieldByName( 'dt_cronograma' ).AsDateTime := data;
   qCronograma.FieldByName( 'cd_professor' ).AsInteger := professor;
   qCronograma.FieldByName( 'cd_prof_substituto' ).AsInteger := Substituto;

   if cd_sala > 0 then
   begin
      qCronograma.FieldByName( 'cd_sala' ).AsInteger := cd_sala;
   end else begin
      qCronograma.FieldByName( 'cd_sala' ).Clear;
   end;

   qCronograma.FieldByName( 'ds_sala' ).AsString := ds_sala;

   if (confirmado) then
      qCronograma.FieldByName( 'sn_confirmado' ).AsInteger := 1
   else
      qCronograma.FieldByName( 'sn_confirmado' ).AsInteger := 0;

   qCronograma.FieldByName( 'nr_valor' ).AsFloat := valor;
   qCronograma.FieldByName( 'cd_horario' ).AsInteger := horario;
   qCronograma.FieldByName( 'bimestre' ).AsInteger := bimestre;
   if cd_grupo > 0 then
   begin
      qCronograma.FieldByName( 'cd_grupo' ).AsInteger := cd_grupo;
   end;
   
   qCronograma.Post;

   // Inserir log de inclusão dos cronogramas
   logDesc := 'Inserido um novo cronograma:'+CHR(13);
   logDesc := logDesc + 'Código do cronograma (cd_cronograma): '+IntToStr(DM.LastInsert)+', ';
   logDesc := logDesc + 'Anosemestre: '+qCronograma.FieldByName( 'anosemestre' ).AsString+', ';
   logDesc := logDesc + 'Turma: '+qCronograma.FieldByName('turma').AsString+', ';
   logDesc := logDesc + 'Disciplina: '+qCronograma.FieldByName('disciplina').AsString+', ';
   logDesc := logDesc + 'Data: '+FormatDateTime('dd/mm/yyyy', qCronograma.FieldByName('dt_cronograma').AsDateTime)+', ';
   logDesc := logDesc + 'Horário: '+qCronograma.FieldByName('cd_horario').AsString+', ';
   logDesc := logDesc + 'Bimestre: '+qCronograma.FieldByName('bimestre').AsString;
   logDesc := logDesc + CHR(13) + '[Acadêmico]';

   { Insere log de inserção de aulas }
   DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_CRONOGRAMA, logDesc, qCronograma.FieldByName( 'cd_professor' ).AsInteger);

end;

procedure TfrmAulasProvasAcoes.IncluirProfessorDisc(anosemestre: Integer;
  curso, turma: String; disciplina, cd_professor, numeroaulas: Integer);
var
   qryProfessorDisc: TUMZQuery;
begin
  dm.CriarConsulta(qryProfessorDisc);
  with qryProfessorDisc do
  begin
     Close;
     SQL.Text := '       '+
     ' SELECT                                  '+
     '    professor                            '+
     ' FROM                                    '+
     '    professoresdisciplinas               '+
     ' WHERE                                   '+
     '    professor  = :cd_professor and       '+
     '    disciplina = :cd_disciplina and      '+
     '    curso  = :cd_curso                   ';
     ParamByName('cd_professor').AsInteger  :=  cd_professor;
     ParamByName('cd_disciplina').AsInteger := disciplina;
     ParamByName('cd_curso').AsString := curso;
     Open;
  end;
  if qryProfessorDisc.RecordCount = 0 then
  begin
    qryProfessorDisc.Close;
    with qryProfessorDisc do
    begin
      SQL.text := 'INSERT INTO professoresdisciplinas(professor,disciplina,curso)'+
                  'values (:cd_professor,:cd_disciplina,:cd_curso)';

      ParamByName('cd_professor').AsInteger  :=  cd_professor;
      ParamByName('cd_disciplina').AsInteger := disciplina;
      ParamByName('cd_curso').AsString := curso;

      ExecSQL;

    end;
  end;



end;


procedure TfrmAulasProvasAcoes.IncluirTurmasProfessor(anosemestre: Integer;
  curso, turma: String; disciplina, cd_professor, numeroaulas: Integer);
var
   qyTurmasProfessores: TUMZQuery;
   inclusoTurmaProfessor, professorSubstituido: Boolean;
   qtdProfessoresTurmaDisc, cd_turmaprofessor : Integer;
begin
   DM.CriarConsulta( qyTurmasProfessores );

   with qyTurmasProfessores do
   begin
      Close;
      SQL.Clear;

      SQL.Add( ' SELECT professor, cd_turmaprofessor FROM turmasprofessores WHERE ' );
      SQL.Add( ' anosemestre = :anosemestre AND curso = :curso AND ' );
      SQL.Add( ' turma = :turma AND disciplina = :disciplina ' );

      ParamByName( 'anosemestre' ).AsInteger := anosemestre;
      ParamByName( 'curso' ).AsString        := curso;
      ParamByName( 'turma' ).AsString        := turma;
      ParamByName( 'disciplina' ).AsInteger  := disciplina;

      Open;

      qtdProfessoresTurmaDisc := qyTurmasProfessores.RecordCount;
      inclusoTurmaProfessor := qtdProfessoresTurmaDisc = 0;
      professorSubstituido := False;

      if inclusoTurmaProfessor then
      begin
         Close;
         SQL.Clear;

         SQL.Add( ' INSERT INTO turmasprofessores ( anosemestre, curso, turma, disciplina, professor, numeroaulas, situacao ) ' );
         SQL.Add( ' VALUES( :anosemestre, :curso, :turma, :disciplina, :professor, :numeroaulas, '+QuotedStr('N')+' ) ' );

         ParamByName( 'professor' ).AsInteger   := cd_professor;

      end else begin
         cd_turmaprofessor := FieldByName('cd_turmaprofessor').AsInteger;

         if ( cd_professor <> FieldByName( 'professor' ).AsInteger ) then
         begin

            Close;
            SQL.Clear;

            if (qtdProfessoresTurmaDisc = 1) and
               (Mensagem( 'Esta turma já possui um professor, deseja substituir?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = mrYes) then
            begin // Professor é diferente, não quer trocar, então INCLUIR

               SQL.Add( ' UPDATE turmasprofessores ' );
               SQL.Add( ' SET numeroaulas = :numeroaulas ' );
               SQL.Add( ' , professor = :professor ' );
               SQL.Add( ' WHERE anosemestre = :anosemestre AND curso = :curso AND ' );
               SQL.Add( ' turma = :turma AND disciplina = :disciplina ' );
               ParamByName( 'professor' ).AsInteger   := cd_professor;
               professorSubstituido := True;

            end else begin  // Professor é diferente e quer trocar, então UPDATE

               SQL.Add( ' INSERT IGNORE turmasprofessores ( anosemestre, curso, turma, disciplina, professor, numeroaulas, situacao ) ' );
               SQL.Add( ' VALUES( :anosemestre, :curso, :turma, :disciplina, :professor, :numeroaulas, '+QuotedStr('N')+' ) ' );

               ParamByName( 'professor' ).AsInteger   := cd_professor;
               inclusoTurmaProfessor := True;

            end;


         end else begin // Professor é IGUAL então, não mexer neste 

            Close;
            SQL.Clear;

             SQL.Add( ' UPDATE turmasprofessores ' );
             SQL.Add( ' SET numeroaulas = :numeroaulas ' );
             SQL.Add( ' WHERE anosemestre = :anosemestre AND curso = :curso AND ' );
             SQL.Add( ' turma = :turma AND disciplina = :disciplina ' );

         end;

      end;

      ParamByName( 'anosemestre' ).AsInteger := anosemestre;
      ParamByName( 'curso' ).AsString        := curso;
      ParamByName( 'turma' ).AsString        := turma;
      ParamByName( 'disciplina' ).AsInteger  := disciplina;
      ParamByName( 'numeroaulas' ).AsInteger := numeroaulas;

      ExecSQL;

      try
        if inclusoTurmaProfessor then
        begin
           TTurmaProfessorAceite.RedefineProfessor(DM.LastInsert(), cd_professor);
        end
        else if professorSubstituido then
        begin
           TTurmaProfessorAceite.RedefineProfessor(cd_turmaprofessor, cd_professor);
        end;
      except on E: Exception do
      end;

   end;
end;

function TfrmAulasProvasAcoes.InsereAulasDados() : Boolean;
var
   iAux     : Integer;
   i        : Integer;
   dtAtual  : TDateTime;
   iDiaSem  : Byte;
   z        : Integer;
   Aula     : TAulaDado;
   iProxAu  : Integer;
   sAux     : String;
   logDesc  : String;
   logicaNovaIgualTerminal: Boolean;
   lista_combo_situacoes : array[1..6] of TUMComboBox;
   qycd_diario_aula: TUMZQuery;
begin

   //verifica curso
   if (Length(txtCurso.Text) = 0) then
   begin
      Mensagem('Um Curso precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      result := false;
      Exit;
   end;

   //bimestre
   if (Length(txtBim.Text) = 0) then
   begin
      Mensagem('Um Bimestre precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      result := false;
      Exit;
   end;

   // Variavel criada a pedido apenas para manter a lógica antiga de geração de aulas
   // Caso haja necessidade de voltar para a lógica antiga basta setar esse parametro como FALSE
   // Após periodo de testes poderá ser removida a lógica antiga assim como essa variável
   logicaNovaIgualTerminal := true;

   //conforme a grade
   if not ckbConfGrade.Checked then
   begin
      if not DM.temExpedienteInstituicao( umdtDataInic.Date, False, DM.getColigadaTurma(txtTurma.Text,DM.GetAnoSemestreAtual) ) then
      begin
         Result := False;
         Exit;
      end;

      if (Length(txtAulas.Text) = 0) then
      begin
         Mensagem('O Numero de aulas precisa ser definido.', 'Atenção!', MB_ICONWARNING + MB_OK);
         result := false;
         Exit;
      end;

      //turma
      if (Length(txtTurma.Text) = 0) then
      begin
         Mensagem('Uma turma precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
         result := false;
         Exit;
      end;

      //disciplina
      if (Length(txtDisciplina.Text) = 0) then
      begin
         Mensagem('Uma disciplina precisa ser selecionada.', 'Atenção!', MB_ICONWARNING + MB_OK);
         result := false;
         Exit;
      end;

      //professor
      if (Length(txtAProf.Text) = 0) then
      begin
         Mensagem('Um professor precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
         result := false;
         Exit;
      end;

      //grupo
      if Self.existeGrupo(StrToInt(getAnoSemestre()), txtCurso.Text, txtTurma.Text, StrToInt(txtDisciplina.Text)) and (Length(edGrupoAulas.Text) = 0) then
      begin
         Mensagem('Existe pelo menos um grupo criado para essa disciplina, nesse caso um grupo precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
         result := false;
         Exit;
      end;

      with qyNovaAula do
      begin
         Close();
         iProxAu := 1;

         sAux := '';

         DM.tblAvaliacao.Close();
         DM.tblAvaliacao.ParamByName('turma').AsString         := txtTurma.Text;
         DM.tblAvaliacao.ParamByName('anosemestre').AsString   := getAnoSemestre();
         Dm.tblAvaliacao.Open();

         if (ckbAtividadeComplementares.Visible) AND
            (DM.tblAvaliacaonr_inicio_aulas_extras.AsInteger > 0 ) then
         begin
            if ckbAtividadeComplementares.Checked then
            begin
               sAux := ' AND nro_aula >= ' +  DM.tblAvaliacaonr_inicio_aulas_extras.AsString ;
            end else begin
               sAux := ' AND nro_aula < ' +  DM.tblAvaliacaonr_inicio_aulas_extras.AsString ;
            end;
         end;

         //SQL.Add('SELECT (MAX(nro_aula)+1) as novaaula FROM diario_aulas WHERE CONCAT(turma, anosemestre, disciplina, bimestre) = :concat ' + sAux + ' GROUP BY CONCAT(turma, anosemestre, disciplina, bimestre) LIMIT 1');
         SQLList.Values[Connection.Protocol] := Format(SQLList.Values[Connection.Protocol], [sAux]);

         ParamByName('turma').AsString := txtTurma.Text;
         ParamByName('anosemestre').AsInteger := StrToInt(getAnoSemestre());
         ParamByName('disciplina').AsInteger := StrToInt(txtDisciplina.Text);
         paramByname('bimestre').AsInteger := StrToInt(txtBim.Text);

         Open();
         
         if (not IsEmpty) AND (FieldByName('novaaula').AsInteger > 0) then
         begin
            iProxAu := FieldByName('novaaula').AsInteger;
         end
         else
         begin
            if (ckbAtividadeComplementares.Visible) AND
               (DM.tblAvaliacaonr_inicio_aulas_extras.AsInteger > 0 ) then
            begin
               if ckbAtividadeComplementares.Checked then
               begin
                  iProxAu := DM.tblAvaliacaonr_inicio_aulas_extras.AsInteger ;
               end
               else
               begin
                  iProxAu := 1;
               end;
            end;
         end;
         
         Close();
      end;

      //qyNovaAula - pega nro aula

      if Length(edGrupoAulas.Text) > 0 then
      begin
         DM.IniciarDiario( StrToInt(getAnoSemestre()), iProxAu,
                           txtCurso.Text, txtTurma.Text, StrToInt(txtDisciplina.text), StrToInt(txtAProf.Text), StrToInt(edGrupoAulas.Text) );
      end else begin
         DM.IniciarDiario( StrToInt(getAnoSemestre()), iProxAu,
                           txtCurso.Text, txtTurma.Text, StrToInt(txtDisciplina.text), StrToInt(txtAProf.Text), 0 );
      end;

      with qyInsereAulaDados do
      begin
         ParamByName('turma').AsString             := txtTurma.Text;
         ParamByName('anosemestre').AsInteger      := StrToInt(getAnoSemestre());
         ParamByName('disciplina').AsInteger       := StrToInt(txtDisciplina.text);
         ParamByName('b').AsInteger                := StrToInt(txtBim.Text);
         ParamByName('nro_aula').AsInteger         := iProxAu;
         ParamByName('data').AsString              := FormatDateTime('yyyy-mm-dd', umdtDataInic.Date);
         ParamByName('qtd_aulas').AsInteger        := StrToInt(txtAulas.Text);
         ParamByName('bloq').AsInteger             := Abs(StrToInt(BoolToStr(ckbBloqueado.Checked)));
         ParamByName('professor').AsInteger        := StrToInt(txtAProf.Text);
         ParamByName('conteudo').AsString          := meConteudo.Lines.Text;
         ParamByName('me_material_aula').AsString  := meMaterial.Lines.Text;
         ParamByName('me_transporte').AsString     := meTransporte.Lines.Text;
         ParamByName('me_observacao').AsString     := meObservacao.Lines.Text;
         ParamByName('me_local_aula').AsString     := meLocal.Lines.Text;
         ParamByName('me_hospedagem').AsString     := meHospagem.Lines.Text;
         ParamByName('me_gerenc_prof').AsString    := meGerenciamentoProf.Lines.Text;
         ParamByName('me_gerenc_gest').AsString    := meGerenciamentoGestor.Lines.Text;
         ParamByName('compartilhada').AsInteger    := Abs(StrToInt(BoolToStr(ckbCompartilha.Checked)));

         if cbTipoAula.ItemIndex > -1 then
         begin
            ParamByName('cd_aula_tipo').AsInteger  := StrToInt(TItemCombo(cbTipoAula.Items.Objects[cbTipoAula.ItemIndex]).getCodigo);
         end;

         if cbSituacaoAula.ItemIndex > 0 then
         begin
            qrySituacoes.GotoBookmark(TBookmark(cbSituacaoAula.Items.Objects[cbSituacaoAula.ItemIndex]));
            ParamByName('cd_situacao').AsInteger := qrySituacoesCD_SITUACAO.AsInteger;
         end
         else
            ParamByName('cd_situacao').Clear;

         // Verifica se é inserção de aulas de um grupo de atividade
         if (Trim(edGrupoAulas.Text) <> '') then
         begin
            ParamByName('cd_grupo').AsInteger := StrToInt(edGrupoAulas.Text);
         end else begin
            ParamByName('cd_grupo').Clear;
         end;

         if ( pnControleLogistica.Enabled ) then
         begin
            lista_combo_situacoes[1] := cbSituacaoMaterialAula;
            lista_combo_situacoes[2] := cbSituacaoTransporte;
            lista_combo_situacoes[3] := cbSituacaoLocalAula;
            lista_combo_situacoes[4] := cbSituacaoHospedagem;
            lista_combo_situacoes[5] := cbSituacaoGerenProfessor;
            lista_combo_situacoes[6] := cbSituacaoGerenGestor;

            for I := Low(lista_combo_situacoes) to High(lista_combo_situacoes) do
            begin
               if TUMComboBox(lista_combo_situacoes[I]).ItemIndex > -1 then
               begin
                  qyInsereAulaDados.ParamByName(lista_campos_situacoes_logistica[I]).AsInteger := TSituacaoLogistica(lista_combo_situacoes[I].Items.Objects[ lista_combo_situacoes[I].ItemIndex ]).Codigo;
               end else begin
                  qyInsereAulaDados.ParamByName(lista_campos_situacoes_logistica[I]).Clear;
               end;
            end;

            // Transporte
            ParamByName('nr_quilometragem').AsCurrency := edmKm.getValorDouble();
            ParamByName('vl_km').AsCurrency := edmValorKm.getValorDouble();
            ParamByName('vl_total_transporte').AsCurrency := edmTotalKm.getValorDouble();

            // Material
            ParamByName('nr_qtd_diarias_material').AsCurrency := edmQtdDiariasMaterial.getValorDouble();
            ParamByName('vl_diaria_material').AsCurrency := edmVlDiariaMaterial.getValorDouble();
            ParamByName('vl_total_material').AsCurrency := edmTotalMaterial.getValorDouble();

            // Hospedagem
            ParamByName('nr_qtd_diarias_hospedagem').AsCurrency := edmQtdDiariasHospedagem.getValorDouble();
            ParamByName('vl_diaria_hospedagem').AsCurrency := edmVlDiariaHospedagem.getValorDouble();
            ParamByName('vl_total_hospedagem').AsCurrency := edmTotalHospedagem.getValorDouble();

            // Local
            ParamByName('nr_qtd_diarias_local').AsCurrency := edmQtdDiariasLocal.getValorDouble();
            ParamByName('vl_diaria_local').AsCurrency := edmVlDiariaLocal.getValorDouble();
            ParamByName('vl_total_local').AsCurrency := edmTotalLocal.getValorDouble();
         end else begin
            ParamByName('cd_situacao_material_aula').Clear;
            ParamByName('cd_situacao_transporte').Clear;
            ParamByName('cd_situacao_local_aula').Clear;
            ParamByName('cd_situacao_hospedagem').Clear;
            ParamByName('cd_situacao_gerenc_prof').Clear;
            ParamByName('cd_situacao_gerenc_gest').Clear;

            ParamByName('nr_quilometragem').Clear;
            ParamByName('vl_km').Clear;
            ParamByName('vl_total_transporte').Clear;

            ParamByName('nr_qtd_diarias_material').Clear;
            ParamByName('vl_diaria_material').Clear;
            ParamByName('vl_total_material').Clear;

            ParamByName('nr_qtd_diarias_hospedagem').Clear;
            ParamByName('vl_diaria_hospedagem').Clear;
            ParamByName('vl_total_hospedagem').Clear;

            ParamByName('nr_qtd_diarias_local').Clear;
            ParamByName('vl_diaria_local').Clear;
            ParamByName('vl_total_local').Clear;
         end;

         {
         Desabilitado, ocorrência 40351

         if ( cbAulaSituacao.Visible ) AND ( cbAulaSituacao.ItemIndex > -1 ) then
         begin
            ParamByName('cd_situacao').AsString :=
                           TItemCombo( cbAulaSituacao.Items.Objects[ cbAulaSituacao.ItemIndex ] ).getCodigo();
         end else begin
            ParamByName('cd_situacao').Clear();
         end;}

         ParamByName('dt_envio').AsString       := FormatDateTime('yyyy-mm-dd', DM.DataAtual);

         ExecSQL();

         dm.CriarConsulta(qycd_diario_aula);

         qycd_diario_aula.SQL.Text := 'SELECT max(cd_diario_aula) as qtd FROM diario_aulas';

         qycd_diario_aula.Open;

         VincularAulaTurmasHorarios(DM.LastInsert(), StrToInt(txtAulas.Text));

         // Inserir log de inserção de aulas
         logDesc := '';
         logDesc := logDesc + 'Código da aula: ' + qycd_diario_aula.FieldByName('qtd').asString + ', ';
         logDesc := logDesc + 'Nro. Aula: '+IntToStr(iProxAu)+', ';
         logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', umdtDataInic.Date)+', ';
         logDesc := logDesc + 'Qtd. Aulas: '+txtAulas.Text+', ';
         logDesc := logDesc + 'Conteúdo: '+meConteudo.Lines.Text+', ';
         logDesc := logDesc + 'Anosemestre: '+getAnoSemestre()+', ';
         logDesc := logDesc + 'Turma: '+txtTurma.Text+', ';
         logDesc := logDesc + 'Disciplina: '+txtDisciplina.text+', ';
         logDesc := logDesc + 'Etapa: '+txtBim.Text+', ';
         logDesc := logDesc + 'Grupo: '+edGrupoAulas.Text+', ';
         logDesc := logDesc + 'Compartilhada: ';

         if(ckbCompartilha.Checked) then
         begin
            logDesc  :=  logDesc + '1';
         end else begin
            logDesc  :=  logDesc + '0';
         end;
         logDesc := logDesc + ', ' + CHR(13) + '[Acadêmico]';

         { Insere log de inserção de aulas }
         DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_AULA, logDesc, StrToInt(txtAProf.Text));

      end; //w qyAux2 - insere aula

   // Lógica de geração de aulas nova, igual a do terminal de acesso
   end else if (logicaNovaIgualTerminal = true) then
   begin
      iAux := DataDiif(umdtDataInic.Date, umdtDataFim.Date);

      if (iAux >= 0) then
      begin
         // Varre cada dia em que será criado aulas
         for i := 0 to (iAux) do
         begin
            // Apresenta mensagem de processando
            Application.ProcessMessages();

            // Data da criação da aula
            dtAtual := DataSoma(umdtDataInic.Date, i);

            { Gera as aulas para a data específicada
              o procedimento considera os filtros realizados em tela para geração das aulas }
            GerarAulasConformeGradeHorarios(dtAtual);
         end;
      end;

   // Lógica de geração de aulas antiga, diferente do terminal de acesso
   end else begin
      iAux := DataDiif(umdtDataInic.Date, umdtDataFim.Date);
      if (iAux >= 0) then
      begin
         for i := 0 to (iAux) do
         begin
            Application.ProcessMessages();
            //processa cada dia
            dtAtual := DataSoma(umdtDataInic.Date, i);

            iDiaSem := DayOfWeek(dtAtual);

            //verifica se está carregado os dados da semana
            CarregaAulaDados(iDiaSem, dtAtual);

            //insere aula
            for z := Low(TurmasAulas[iDiaSem]) to High(TurmasAulas[iDiaSem]) do
            begin
               Aula := TurmasAulas[iDiaSem, z];

               if not DM.temExpedienteInstituicao( dtAtual, ( iAux = 1 ), DM.getColigadaTurma(Aula.sTurma,DM.GetAnoSemestreAtual) ) then
                  Continue;

                 with qyNovaAula do
                 begin
                  // Se estiver utilizando o parametro nr_inicio_aulas_extras,
                  // pegar o MAX do número da aula > que nr_inicio_aulas_extras

                   sAux := '';

                   DM.tblAvaliacao.Close();
                   DM.tblAvaliacao.ParamByName('turma').AsString        := Aula.sTurma;
                   DM.tblAvaliacao.ParamByName('anosemestre').AsString  := getAnoSemestre();
                   Dm.tblAvaliacao.Open();

                   if (ckbAtividadeComplementares.Visible) AND
                     (DM.tblAvaliacaonr_inicio_aulas_extras.AsInteger > 0 ) then
                   begin
                      if ckbAtividadeComplementares.Checked then
                      begin
                         sAux := ' AND nro_aula >= ' +  DM.tblAvaliacaonr_inicio_aulas_extras.AsString ;
                      end else begin
                         sAux := ' AND nro_aula < ' +  DM.tblAvaliacaonr_inicio_aulas_extras.AsString ;
                      end;

                   end;

                  Close();
                  iProxAu := 1;  

                  {SQL.Add('SELECT (MAX(nro_aula)+1) as novaaula FROM diario_aulas WHERE CONCAT(turma, anosemestre, disciplina, bimestre) = :concat '+ sAux +' GROUP BY CONCAT(turma, anosemestre, disciplina, bimestre) LIMIT 1');}
                  SQLList.Values[Connection.Protocol] := Format(SQLList.Values[Connection.Protocol], [sAux]);

                  ParamByName('turma').AsString := Aula.sTurma;
                  ParamByName('anosemestre').AsInteger := StrToInt(getAnoSemestre());
                  ParamByName('disciplina').AsInteger := Aula.iDisciplina;
                  paramByname('bimestre').AsInteger := StrToInt(txtBim.Text);

                  Open();

                  if (not IsEmpty) AND (FieldByName('novaaula').AsInteger > 0) then
                  begin
                     iProxAu := FieldByName('novaaula').AsInteger;
                  end else begin

                     if (ckbAtividadeComplementares.Visible) AND
                        (DM.tblAvaliacaonr_inicio_aulas_extras.AsInteger > 0 ) then
                     begin
                        if ckbAtividadeComplementares.Checked then
                        begin
                           iProxAu := DM.tblAvaliacaonr_inicio_aulas_extras.AsInteger ;
                        end else begin
                           iProxAu := 1;
                        end;
                     end;

                  end;
                  Close();
               end; //w qyAux2 - pega nro aula

               //verifica se ja tem registro
               with qyAux2 do
               begin
                  Close();
                  SQL.Clear();
                  Params.Clear();

                  SQL.Add('SELECT COUNT(*) as conta  '+
                     'FROM diario_aulas '+
                     'WHERE turma = :turma AND anosemestre = :anosemestre AND disciplina = :disciplina AND bimestre = :bimestre AND nro_aula = :nro_aula AND data = :data '+
                  '');
                  ParamByName('turma').AsString          := Aula.sTurma;
                  ParamByName('anosemestre').AsInteger   := StrToInt(getAnoSemestre());
                  ParamByName('disciplina').AsInteger    := Aula.iDisciplina;
                  ParamByName('bimestre').AsInteger      := StrToInt(txtBim.Text);
                  ParamByName('nro_aula').AsInteger      := iProxAu;
                  ParamByName('data').AsString           := FormatDateTime('yyyy-mm-dd', dtAtual);
                  Open();
                  if not IsEmpty then
                  begin
                     if FieldByName('conta').AsInteger > 0 then
                     begin
                        Continue;
                     end;
                  end;
                  Close();
               end;

               with qyAux2 do begin
                  SQL.Clear();
                  Params.Clear();
                  SQL.Add('INSERT INTO diario_aulas (turma, anosemestre, disciplina, bimestre, nro_aula, data, qtd_aulas, sn_bloqueado, cd_professor, conteudo, sn_aula_compartilhada, cd_situacao)   ');
                  SQL.Add('VALUES ');
                  SQL.Add('(:turma, :anosemestre, :disciplina, :b, :nro_aula, :data, :qtd_aulas, :bloq, :prof, :conteudo, :compartilhada, :cd_situacao) ');
                  ParamByName('turma').AsString          := Aula.sTurma;
                  ParamByName('anosemestre').AsInteger   := StrToInt(getAnoSemestre());
                  ParamByName('disciplina').AsInteger    := Aula.iDisciplina;
                  ParamByName('b').AsInteger             := StrToInt(txtBim.Text);
                  ParamByName('nro_aula').AsInteger      := iProxAu;
                  ParamByName('data').AsString           := FormatDateTime('yyyy-mm-dd', dtAtual);
                  ParamByName('qtd_aulas').AsInteger     := Aula.iNumAulas;
                  ParamByName('bloq').AsInteger          := Abs(StrToInt(BoolToStr(ckbBloqueado.Checked)));
                  ParamByName('prof').AsInteger          := Aula.iProfessor;
                  ParamByName('conteudo').AsString       := meConteudo.Lines.Text;
                  ParamByName('compartilhada').AsInteger := Abs(StrToInt(BoolToStr(ckbCompartilha.Checked)));

                  if cbSituacaoAula.ItemIndex > 0 then
                  begin
                     qrySituacoes.GotoBookmark(TBookmark(cbSituacaoAula.Items.Objects[cbSituacaoAula.ItemIndex]));
                     ParamByName('cd_situacao').AsInteger := qrySituacoesCD_SITUACAO.AsInteger;
                  end
                  else
                     ParamByName('cd_situacao').Clear;

                  ExecSQL();

                  VincularAulaTurmasHorarios(DM.LastInsert(), Aula.iNumAulas);

                  // Inserir log de inserção de aulas
                  logDesc := '';
                  logDesc := logDesc + 'Nro. Aula: '+IntToStr(iProxAu)+', ';
                  logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', dtAtual)+', ';
                  logDesc := logDesc + 'Qtd. Aulas: '+IntToStr(Aula.iNumAulas)+', ';
                  logDesc := logDesc + 'Conteúdo: '+meConteudo.Lines.Text+', ';
                  logDesc := logDesc + 'Anosemestre: '+getAnoSemestre()+', ';
                  logDesc := logDesc + 'Turma: '+Aula.sTurma+', ';
                  logDesc := logDesc + 'Disciplina: '+IntToStr(Aula.iDisciplina)+', ';
                  logDesc := logDesc + 'Etapa: '+txtBim.Text+', ';
                  logDesc := logDesc + 'Compartilhada: ';

                  if(ckbCompartilha.Checked) then
                  begin
                     logDesc  :=  logDesc + '1';
                  end else begin
                     logDesc  :=  logDesc + '0';
                  end;
                  logDesc  :=  logDesc +  ', Geração de aulas conforme grade horários [Acadêmico]';

                  { Insere log de inserção de aulas }
                  DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_AULA, logDesc, Aula.iProfessor);

               end; //w qyAux2 - insere aula

            end; //f TurmasAulas - for em cada aula do dia

         end; //f Dias - for no numero de dias
      end; //iAux - numero de dias
   end; //if checked

   result := true;

end;

procedure TfrmAulasProvasAcoes.CalculaValorTotalSituacoes(var campo_multiplicador, campo_multiplicando, campo_total: TUMEditMonetario);
begin
   campo_total.setValor( campo_multiplicador.getValor() * campo_multiplicando.getValor() );
end;

function TfrmAulasProvasAcoes.GeraCompromissos(const AulaID: Cardinal): Boolean;
begin
   Result := TfrmLGTCDespesasResumo.ShowDespesas(AulaID) = mrOk;
end;

procedure TfrmAulasProvasAcoes.GerarAulasConformeGradeHorarios(dataAula: TDateTime);
var
   i,
   cdDiarioAula,
   cd_tipo_aula: Integer;
   
   listaHorarios: TStringList;
   logDesc: String;
   qyGradeHorariosAula: TUMZQuery;
   qyVincularHorario: TUMZQuery;
   qyVerificaAulaExistente: TUMZQuery;
   qyInserirAula: TUMZQuery;
   qyCriarEstruturaTemporaria: TUMZQuery;
begin
   DM.CriarConsulta(qyGradeHorariosAula);
   DM.CriarConsulta(qyVincularHorario);
   DM.CriarConsulta(qyVerificaAulaExistente);
   DM.CriarConsulta(qyInserirAula);
   DM.CriarConsulta(qyCriarEstruturaTemporaria);

   listaHorarios := TStringList.Create;

   // Cria o SQL que fará a inserção da aula
   qyInserirAula.SQL.Text := ''+
      'INSERT INTO diario_aulas (anosemestre, turma, bimestre, disciplina, nro_aula, data, qtd_aulas, sn_bloqueado, conteudo, cd_professor, dt_envio, sn_aula_compartilhada, cd_aula_tipo, cd_situacao) '+
      '  VALUES ( '+
      '     :nr_anosemestre, :cd_turma, :nr_etapa, :cd_disciplina, '+
      '     (SELECT t.proxima FROM (SELECT COALESCE(MAX(nro_aula), 0)+1 AS proxima FROM diario_aulas WHERE anosemestre = :nr_anosemestre AND turma = :cd_turma AND disciplina = :cd_disciplina AND bimestre = :nr_etapa) AS t), '+
      '     DATE_FORMAT(:data_aula, "%Y-%m-%d 00:00:00"), :qtd_aulas, :sn_bloqueado, :ds_conteudo, :cd_professor, DATE_FORMAT(:data_aula, "%Y-%m-%d 00:00:00"), :compartilhada, :cd_aula_tipo, :cd_situacao '+
      '  )';

   // Cria o SQL que fará o vinculo do horário
   qyVincularHorario.SQL.Text := ''+
      'INSERT IGNORE INTO diario_aulas_turmas_horarios (cd_diario_aula, cd_turma_horario) '+
      '  VALUES (:cd_diario_aula, :cd_turma_horario)';

   // Cria a tabela temporária
   qyCriarEstruturaTemporaria.Close;
   qyCriarEstruturaTemporaria.SQL.Text := 'DROP TEMPORARY TABLE IF EXISTS TMP_TA_GERAR_AULAS';
   qyCriarEstruturaTemporaria.ExecSQL;

   qyCriarEstruturaTemporaria.Close;
   qyCriarEstruturaTemporaria.SQL.Text := 'CREATE TEMPORARY TABLE TMP_TA_GERAR_AULAS( '+
                                          '   nr_anosemestre INTEGER(6), '+
                                          '   cd_turma VARCHAR(50), '+
                                          '   cd_disciplina INTEGER(11), '+
                                          '   turmas_horarios_ins MEDIUMTEXT, '+
                                          '   cd_professor INTEGER(11), '+
                                          '   dt_aula DATETIME, '+
                                          '   qtd_aulas INTEGER(11), '+
                                          '   aulas_sequencia INTEGER(11), '+
                                          '   coluna_grupo INTEGER(11), '+
                                          '   cd_turma_anterior VARCHAR(50), '+
                                          '   cd_disciplina_anterior INTEGER(11), '+
                                          '   cd_professor_anterior INTEGER(11) '+
                                          ') ';
   qyCriarEstruturaTemporaria.ExecSQL;

   // SQL que monta a grade de horários agrupados para a criação das aulas (insere as mesmas em uma estrutura temporária)
   qyGradeHorariosAula.SQL.Text := ''+
      'INSERT INTO TMP_TA_GERAR_AULAS( '+
      '   nr_anosemestre, cd_turma, cd_disciplina, turmas_horarios_ins, cd_professor, dt_aula, '+
      '   qtd_aulas, aulas_sequencia, coluna_grupo, cd_turma_anterior, cd_disciplina_anterior, cd_professor_anterior '+
      ') '+
      'SELECT '+
      '  nr_anosemestre, '+
      '  cd_turma, '+
      '  cd_disciplina, '+
      '  GROUP_CONCAT(DISTINCT cd_turmas_horarios) turmas_horarios_ins, '+
      '  cd_professor, '+
      '  :data_aula dt_aula, '+
      '  COUNT(DISTINCT cd_turmas_horarios) qtd_aulas, '+
      '  @grupo := IF((cd_turma <> @turmaAnterior) OR (cd_disciplina <> @disciplinaAnterior) OR (cd_professor <> @professorAnterior), @cont := @cont+1, @cont) aulasSequencia, '+
      '  @grupo coluna_grupo, '+
      '  @turmaAnterior := cd_turma, '+
      '  @disciplinaAnterior := cd_disciplina, '+
      '  @professorAnterior := cd_professor '+
      'FROM ( '+
      '  SELECT '+
      '     thc.nr_anosemestre, '+
      '     thc.cd_turma, '+
      '     thc.cd_disciplina, '+
      '     thc.cd_turmas_horarios, '+
      '     COALESCE(thc.cd_professor, 0) cd_professor, '+
      '     @cont := 0, '+
      '     @turmaAnterior := NULL, '+
      '     @disciplinaAnterior := NULL, '+
      '     @professorAnterior := NULL, '+
      '     @grupo := NULL '+
      '  FROM '+
      '     turmas t '+
		'	   INNER JOIN turmas_horarios_config thc ON (thc.cd_turma = t.codigo AND thc.nr_anosemestre = t.anosemestre) '+
		'	   INNER JOIN horarios h ON (h.codigo = thc.cd_horario) '+
		'	   INNER JOIN disciplinas d ON (d.codigo = thc.cd_disciplina AND d.curso = t.curso) '+
      '  WHERE '+
      '	   t.anosemestre = :nr_anosemestre '+
		'	   AND t.curso = :cd_curso '+
      '     AND thc.nr_dia_semana = DAYOFWEEK(:data_aula) '+
		'	   AND IS_HORARIO_TURMA_ATIVA(:data_aula, thc.dt_inicial, thc.dt_final, thc.sn_ativo) = 1 '+
      '     AND t.cd_coligada IN ('+DM.GetColigadas+') ';

   // Verifica se foi filtrada a turma para geração das aulas
   if (Length(txtTurma.Text) > 0) then
   begin
      qyGradeHorariosAula.SQL.Add(' AND t.codigo = :cd_turma ');
   end;

   // Verifica se foi filtrada a disciplina para geração das aulas
   if (Length(txtDisciplina.Text) > 0) then
   begin
      qyGradeHorariosAula.SQL.Add(' AND thc.cd_disciplina = :cd_disciplina ');
   end;

   // Verifica se foi filtrado o professor para geração das aulas
   if (Length(txtAProf.Text) > 0) then
   begin
      qyGradeHorariosAula.SQL.Add(' AND thc.cd_professor = :cd_professor ');
   end;


   // Adiciona o final do SQL que monta a grade de horários agrupados para a criação das aulas
   qyGradeHorariosAula.SQL.Text := qyGradeHorariosAula.SQL.Text+
      '  ORDER BY '+
		'   	thc.nr_anosemestre, thc.cd_turma, h.hr_inicio, h.hr_fim '+
      ') aulas_horarios '+
      'GROUP BY '+
	   '  coluna_grupo';

   qyGradeHorariosAula.Close();
   
   qyGradeHorariosAula.ParamByName('nr_anosemestre').AsInteger := StrToInt(sAnosem);
   qyGradeHorariosAula.ParamByName('cd_curso').AsString := txtCurso.Text;
   qyGradeHorariosAula.ParamByName('data_aula').AsDate := dataAula;

   if (Length(txtTurma.Text) > 0) then
   begin
      qyGradeHorariosAula.ParamByName('cd_turma').AsString := txtTurma.Text;
   end;

   if (Length(txtDisciplina.Text) > 0) then
   begin
      qyGradeHorariosAula.ParamByName('cd_disciplina').AsInteger := StrToInt(txtDisciplina.Text);
   end;

   if (Length(txtAProf.Text) > 0) then
   begin
      qyGradeHorariosAula.ParamByName('cd_professor').AsInteger := StrToInt(txtAProf.Text);
   end;

   qyGradeHorariosAula.ExecSQL;

   {
      CORRIGE A QUEBRA DE AULAS DE DISCIPLINAS QUE ACONTECEM NO MESMO HORÁRIO
      OU SEJA, MESMO QUE A DISCIPLINA ACONTEÇA EM MESMO HORÁRIO QUE OUTRA,
      SE A DISCIPLINA DO PRÓXIMO HORÁRIO FOR A MESMA E MESMO PROFESSOR,
      ENTÃO DEVE SER GERADA UMA ÚNICA AULA COM A QUANTIDADE DESSAS
   }
   DM.callProcedure('CALL TA_AJUSTE_GERAR_AULAS()');

   qyGradeHorariosAula.Close;
   qyGradeHorariosAula.SQL.Text := ''+
      'SELECT '+
      '   nr_anosemestre, '+
      '   cd_turma, '+
      '   cd_disciplina, '+
      '   turmas_horarios_ins, '+
      '   cd_professor, '+
      '   dt_aula, '+
      '   qtd_aulas, '+
      '   aulas_sequencia, '+
      '   coluna_grupo, '+
      '   cd_disciplina_anterior, '+
      '   cd_professor_anterior '+
      'FROM '+
      '   TMP_TA_GERAR_AULAS '+
      'ORDER BY '+
      '   nr_anosemestre, cd_turma';
   qyGradeHorariosAula.Open();

   qyGradeHorariosAula.First;

   while not qyGradeHorariosAula.Eof do
   begin
      // Não cria a aula se na instituição nessa data não possuir expediente 
      if not DM.temExpedienteInstituicao( dataAula, false, DM.getColigadaTurma(qyGradeHorariosAula.FieldByName('cd_turma').AsString,DM.GetAnoSemestreAtual) ) then
      begin
         qyGradeHorariosAula.Next;
         Continue;
      end;

      // Cria o SQL que verifica se a aula já existe
      qyVerificaAulaExistente.SQL.Text := ''+
         'SELECT DISTINCT '+
         '  da.cd_diario_aula cd_diario_aula '+
         'FROM '+
         '  diario_aulas da '+
         '  INNER JOIN diario_aulas_turmas_horarios dath ON (dath.cd_diario_aula = da.cd_diario_aula) '+
         'WHERE '+
         '  da.anosemestre = :nr_anosemestre AND '+
         '  da.turma = :cd_turma AND '+
         '  da.disciplina = :cd_disciplina AND '+
         '  DATE_FORMAT(da.data, "%Y-%m-%d") = DATE_FORMAT(:data_aula, "%Y-%m-%d") AND '+
         '  dath.cd_turma_horario IN ('+qyGradeHorariosAula.FieldByName('turmas_horarios_ins').AsString+') '+
         'LIMIT 1';

      qyVerificaAulaExistente.Close;
      qyVerificaAulaExistente.ParamByName('nr_anosemestre').AsInteger := qyGradeHorariosAula.FieldByName('nr_anosemestre').AsInteger;
      qyVerificaAulaExistente.ParamByName('cd_turma').AsString := qyGradeHorariosAula.FieldByName('cd_turma').AsString;
      qyVerificaAulaExistente.ParamByName('cd_disciplina').AsInteger := qyGradeHorariosAula.FieldByName('cd_disciplina').AsInteger;
      qyVerificaAulaExistente.ParamByName('data_aula').AsDateTime := dataAula;
      qyVerificaAulaExistente.Open;

      // Cria uma nova aula para cada registro encontrado no SQL
      qyInserirAula.Close();
      qyInserirAula.ParamByName('nr_anosemestre').AsInteger := qyGradeHorariosAula.FieldByName('nr_anosemestre').AsInteger;
      qyInserirAula.ParamByName('cd_turma').AsString := qyGradeHorariosAula.FieldByName('cd_turma').AsString;
      qyInserirAula.ParamByName('nr_etapa').AsInteger := StrToInt(txtBim.Text);
      qyInserirAula.ParamByName('cd_disciplina').AsInteger := qyGradeHorariosAula.FieldByName('cd_disciplina').AsInteger;
      qyInserirAula.ParamByName('data_aula').AsDateTime := dataAula;
      qyInserirAula.ParamByName('qtd_aulas').AsInteger := qyGradeHorariosAula.FieldByName('qtd_aulas').AsInteger;
      qyInserirAula.ParamByName('sn_bloqueado').AsInteger := Abs(StrToInt(BoolToStr(ckbBloqueado.Checked)));
      qyInserirAula.ParamByName('ds_conteudo').AsString := meConteudo.Lines.Text;
      qyInserirAula.ParamByName('cd_professor').AsInteger := qyGradeHorariosAula.FieldByName('cd_professor').AsInteger;
      qyInserirAula.ParamByName('compartilhada').AsInteger := Abs(StrToInt(BoolToStr(ckbCompartilha.Checked)));

      cd_tipo_aula := getTipoAulaPadrao(
         qyGradeHorariosAula.FieldByName('cd_turma').AsString,
         qyGradeHorariosAula.FieldByName('cd_disciplina').AsInteger
      );

      qyInserirAula.ParamByName('cd_aula_tipo').Clear;

      if cd_tipo_aula <> 0 then
      begin
         qyInserirAula.ParamByName('cd_aula_tipo').AsInteger := cd_tipo_aula;
      end;

      if cbSituacaoAula.ItemIndex > 0 then
      begin
         qrySituacoes.GotoBookmark(TBookmark(cbSituacaoAula.Items.Objects[cbSituacaoAula.ItemIndex]));
         qyInserirAula.ParamByName('cd_situacao').AsInteger := qrySituacoesCD_SITUACAO.AsInteger;
      end
      else
         qyInserirAula.ParamByName('cd_situacao').Clear;

      qyInserirAula.ExecSQL();

      // Verifica se já existia uma aula criada nesse caso usa a chave primaria dessa aula criada para vincular o horario
      if qyVerificaAulaExistente.FieldByName('cd_diario_aula').AsInteger > 0 then
      begin
         // Pega o codigo da aula que já existia
         cdDiarioAula := qyVerificaAulaExistente.FieldByName('cd_diario_aula').AsInteger;
      end else begin
         //Resgada a chave primaria da aula inserida (cd_diario_aula)
         cdDiarioAula := DM.LastInsert();
      end;

      // Inserir log de inserção de aulas
      logDesc := '';
      logDesc := logDesc + 'Código diário aula (cd_diario_aula): '+IntToStr(cdDiarioAula)+', ';
      logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', dataAula)+', ';
      logDesc := logDesc + 'Qtd. Aulas: '+qyGradeHorariosAula.FieldByName('qtd_aulas').AsString+', ';
      logDesc := logDesc + 'Conteúdo: '+meConteudo.Lines.Text+', ';
      logDesc := logDesc + 'Anosemestre: '+qyGradeHorariosAula.FieldByName('nr_anosemestre').AsString+', ';
      logDesc := logDesc + 'Turma: '+qyGradeHorariosAula.FieldByName('cd_turma').AsString+', ';
      logDesc := logDesc + 'Disciplina: '+qyGradeHorariosAula.FieldByName('cd_disciplina').AsString+', ';
      logDesc := logDesc + 'Etapa: '+txtBim.Text+', ';
      logDesc := logDesc + 'Compartilhada: ';
      if(ckbCompartilha.Checked) then
      begin
         logDesc  :=  logDesc + '1';
      end else begin
         logDesc  :=  logDesc + '0';
      end;
      logDesc  :=  logDesc +  ', Geração de aulas conforme grade horários [Acadêmico]';

      { Insere log de inserção de aulas }
      DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_AULA, logDesc, qyGradeHorariosAula.FieldByName('cd_professor').AsInteger);

      // Cria um StringList dos horários da turma
      listaHorarios.Delimiter := ',';
      listaHorarios.DelimitedText := qyGradeHorariosAula.FieldByName('turmas_horarios_ins').AsString;

      // Varre a lista de horários e vincula todos a aula que foi criada 
      for i := 0 to listaHorarios.Count - 1 do
      begin
         qyVincularHorario.Close;
         qyVincularHorario.ParamByName('cd_diario_aula').AsInteger := cdDiarioAula;
         qyVincularHorario.ParamByName('cd_turma_horario').AsInteger := StrToInt(listaHorarios.Strings[i]);
         qyVincularHorario.ExecSQL;
      end;

      qyGradeHorariosAula.Next;
   end;
   
end;

procedure TfrmAulasProvasAcoes.CarregaAulaDados(iDiaSemana: Byte; const dataAtual : TDateTime);
var
   sAux           : String;
   sChave         : string;
   sATurma        : string;
   sADisc         : string;
   sAHor          : string;
   sAPRof         : string;
   bAgrupaTodos   : Boolean;
   iNumHor        : Integer;
   iAulas         : Integer;
   maxAulas       : Integer;
   i              : Integer;
begin
   maxAulas := 0;

   // Zera o array de turmas aulas para receber as novas aulas
   For i:=1 to High(TurmasAulas) Do
      TurmasAulas[i] := nil;

   //nao verifica se horario é sequencial, agrupa todos
   bAgrupaTodos := DM.variavel_parametro('acad_aulas_agrupa_todos') = 'S';

   with qyAux2 do
   begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT                                      '+
      '   thc.cd_turma AS turma, thc.cd_disciplina AS disciplina, thc.cd_horario, thc.cd_professor    '+
      'FROM                                        '+
      '   turmas_horarios_config thc                       '+
      '   INNER JOIN turmas t ON (t.anosemestre = thc.nr_anosemestre AND t.codigo = thc.cd_turma) '+
      'WHERE                                       '+
      '   thc.nr_anosemestre = :anosem AND         '+
      '   thc.nr_dia_semana = :diasem AND          '+
      '   t.curso = :curso  AND                    '+
      '   IS_HORARIO_TURMA_ATIVA(:data, thc.dt_inicial, thc.dt_final, thc.sn_ativo) = 1 AND ' +
      '   t.cd_coligada in ('+DM.GetColigadas+')    '+
      '');

      //verifica turma
      if (Length(txtTurma.Text) > 0) then
      begin
         SQL.Add(' AND thc.cd_turma = ''' + txtTurma.Text + ''' ');
      end;

      //verifica disciplina
      if (Length(txtDisciplina.Text) > 0) then
      begin
         SQL.Add(' AND thc.cd_disciplina = ' + txtDisciplina.Text + ' ');
      end;

      //verifica disciplina
      if (Length(txtAProf.Text) > 0) then
      begin
         SQL.Add(' AND thc.cd_professor = ' + txtAProf.Text + ' ');
      end;


      SQL.Add(' '+
      'GROUP BY '+
      '   thc.cd_turma, thc.cd_disciplina, thc.cd_horario, thc.cd_professor '+
      'ORDER BY '+
      '   thc.cd_turma, thc.cd_disciplina, thc.cd_professor, thc.cd_horario '+
      '');
      qyAux2.ParamByName('anosem').AsInteger := StrToInt(sAnosem);
      qyAux2.ParamByName('diasem').AsInteger := iDiaSemana;
      qyAux2.ParamByName('curso').AsString   := txtCurso.Text;
      qyAux2.ParamByName('data').AsDateTime := dataAtual;
      qyAux2.Open();
      qyAux2.First();
      qyAux2.FetchAll();

      if not IsEmpty then
      begin

         //carrega o array de aulas
         sAux        := '';
         sATurma     := '';
         sADisc      := '';
         sAHor       := '0';
         sAPRof      := '';
         sChave      := '';

         iAulas := 0;

         while not qyAux2.Eof do
         begin

            if (sATurma = '') then
            begin
               //insere a atual
               sATurma     := qyAux2.FieldByName('turma').AsString;
               sADisc      := qyAux2.FieldByName('disciplina').AsString;
               sAHor       := qyAux2.FieldByName('cd_horario').AsString;
               sAProf      := qyAux2.FieldByName('cd_professor').AsString;

               Dm.tblAvaliacao.Close();
               DM.tblAvaliacao.ParamByName('turma').AsString         := sATurma;
               DM.tblAvaliacao.ParamByName('anosemestre').AsInteger  := StrToInt(sAnosem);
               DM.tblAvaliacao.Open();


               iAulas      := 1;
               maxAulas    := DM.tblAvaliacaonr_maximo_aulas.AsInteger;
            end
            else
            begin

               if bAgrupaTodos then
               begin
                  iNumHor := qyAux2.FieldByName('cd_horario').AsInteger;
               end
               else
               begin
                  iNumHor := (StrToInt(sAHor)+1);
               end;

               sAux     := sATurma + ':+:' + sADisc + ':+:' + sAProf;//+ ':+:' + IntToStr(iNumHor);
               sChave   := qyAux2.FieldByName('turma').AsString + ':+:' + qyAux2.FieldByName('disciplina').AsString + ':+:' + qyAux2.FieldByName('cd_professor').AsString;// + ':+:' + qyAux2.FieldByName('cd_horario').AsString;

               if (sAux = sChave) then
               begin
                    INC(iAulas);
                  //duas aulas
                    if iAulas >= maxAulas  then
                    begin
                       InserirAulaDado(iDiaSemana, sATurma, StrToInt(sADisc), iAulas, StrToInt(sAProf));
                       sATurma     := '';
                       sADisc      := '';
                       sAHor       := '0';
                       sAProf      := '';
                       iAulas      := 0;
                    end;
               end
               else
               begin
                  //insere aula antiga
                  InserirAulaDado(iDiaSemana, sATurma, StrToInt(sADisc), iAulas, StrToInt(sAProf));

                  //insere a atual
                  sATurma     := qyAux2.FieldByName('turma').AsString;
                  sADisc      := qyAux2.FieldByName('disciplina').AsString;
                  sAHor       := qyAux2.FieldByName('cd_horario').AsString;
                  sAProf      := qyAux2.FieldByName('cd_professor').AsString;
                  iAulas      := 1;
                  //InserirAulaDado(iDiaSemana, sATurma, StrToInt(sADisc), 1, StrToInt(sAProf));
               end;
            end;
            Next();

            if qyAux2.Eof then
            begin
               if (sATurma <> '') then
               begin
                  InserirAulaDado(iDiaSemana, sATurma, StrToInt(sADisc), iAulas, StrToInt(sAProf));
               end;
            end;


         end; //while
      end; //if notempty
   end; //with
end;

procedure TfrmAulasProvasAcoes.CarregaConfiguracoesLogistica(const cd_situacao_material_aula : Integer;
         const cd_situacao_transporte : Integer; const cd_situacao_local_aula : Integer;
         const cd_situacao_hospedagem : Integer; const cd_situacao_geren_professor : Integer;
         const cd_situacao_geren_gestor: Integer);
var
   permissao_alterar : Boolean;
begin
   if (pcAulas.ActivePage = tsAulas) then
   begin
      if (DM.variavel_parametro('local.aulas.informacoes_logisticas') = 'S') then
      begin
         Self.Height := Self.Tag;

         // Se o cliente possui uma resolução menor
         // ajusta a tela conforme a resolucao da tela
         if (Screen.Height < 769) then
         begin
           Self.Height := TAMANHO_TELA;
         end;

         pnControleLogistica.Visible := True;
         pnControleLogistica.Enabled := True;

         if bInsere then
         begin
            permissao_alterar := DM.UsuarioLogado.TemPermissao( 0, 'Academico.CadastroAulasLogistica', npIncluir, false );
         end else begin
            permissao_alterar := DM.UsuarioLogado.TemPermissao( 0, 'Academico.CadastroAulasLogistica', npAlterar, false );
         end;

         cbSituacaoMaterialAula.Enabled := permissao_alterar;
         cbSituacaoTransporte.Enabled := permissao_alterar;
         cbSituacaoLocalAula.Enabled := permissao_alterar;
         cbSituacaoHospedagem.Enabled := permissao_alterar;
         cbSituacaoGerenProfessor.Enabled := permissao_alterar;
         cbSituacaoGerenGestor.Enabled := permissao_alterar;

         if bInsere then
            CarregarSituacoesLogistica()
         else
            CarregarSituacoesLogistica(cd_situacao_material_aula, cd_situacao_transporte,
               cd_situacao_local_aula, cd_situacao_hospedagem, cd_situacao_geren_professor, cd_situacao_geren_gestor);

         // Transporte
         meTransporte.Enabled := cbSituacaoTransporte.Enabled;
         edmKm.Enabled := cbSituacaoTransporte.Enabled;
         edmValorKm.Enabled := cbSituacaoTransporte.Enabled;

         // Material 
         meMaterial.Enabled := cbSituacaoMaterialAula.Enabled;
         edmQtdDiariasMaterial.Enabled := cbSituacaoMaterialAula.Enabled;
         edmVlDiariaMaterial.Enabled := cbSituacaoMaterialAula.Enabled;

         // Local
         meLocal.Enabled := cbSituacaoLocalAula.Enabled;
         edmQtdDiariasLocal.Enabled := cbSituacaoLocalAula.Enabled;
         edmVlDiariaLocal.Enabled := cbSituacaoLocalAula.Enabled;

         // Hospedagem
         meHospagem.Enabled := cbSituacaoHospedagem.Enabled;
         edmQtdDiariasHospedagem.Enabled := cbSituacaoHospedagem.Enabled;
         edmVlDiariaHospedagem.Enabled := cbSituacaoHospedagem.Enabled;

         // Demais campos de logística
         meGerenciamentoProf.Enabled := cbSituacaoGerenProfessor.Enabled;
         meGerenciamentoGestor.Enabled := cbSituacaoGerenGestor.Enabled;
      end else begin
         Self.Height := Self.Tag - pnControleLogistica.Height;

         pnControleLogistica.Visible := False;
         pnControleLogistica.Enabled := False;
      end;
   end
   else if (pcAulas.ActivePage = tsProvas) then begin
      Self.Height := TAMANHO_TELA;

      pnControleLogistica.Visible := False;
      pnControleLogistica.Enabled := False;
   end
   else
   begin
      Self.Height := TAMANHO_TELA;

      pnControleLogistica.Visible := False;
      pnControleLogistica.Enabled := False;
   end;
end;

procedure TfrmAulasProvasAcoes.CarregaDataDiario(const nr_anosemestre: Integer;
   const cd_turma: String; const cd_disciplina: Integer; const cd_curso: String);
var
   qyBuscaDiario: TUMZQuery;
begin
   DM.CriarConsulta(qyBuscaDiario);

   with qyBuscaDiario do
   begin
      SQL.Clear();

      SQL.Add('SELECT DP.DT_INICIO_ETAPA, DP.DT_FIM_ETAPA');
      SQL.Add('FROM DIA_PRAZOS_TURMAS DPT');
      SQL.Add('     INNER JOIN DIA_PRAZOS DP ON (DP.CD_PRAZO = DPT.CD_PRAZO)');
      SQL.Add('WHERE DPT.NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND');
      SQL.Add('      DPT.CD_TIPO_PRAZO = 1 AND');
      SQL.Add('      DPT.CD_TURMA = :CD_TURMA AND');
      SQL.Add('      DPT.CD_DISCIPLINA = :CD_DISCIPLINA AND');
      SQL.Add('      DPT.CD_CURSO = :CD_CURSO');

      ParamByName('NR_ANOSEMESTRE').AsInteger   := nr_anosemestre;
      ParamByName('CD_TURMA').AsString          := cd_turma;
      ParamByName('CD_DISCIPLINA').AsInteger    := cd_disciplina;
      ParamByName('CD_CURSO').AsString          := cd_curso;

      Open();

      if ( RecordCount = 0 ) then
      begin
         RecarregaDatasDiario();
      end else begin
         umdtInicioDiario.Date := FieldByName('DT_INICIO_ETAPA').AsDateTime;
         umdtFimDiario.Date := Now;
         umdtFimDiario.Date := FieldByName('DT_FIM_ETAPA').AsDateTime;
      end;
   end;

   FreeAndNil(qyBuscaDiario);
end;

procedure TfrmAulasProvasAcoes.InserirAulaDado(iDiaSemana: Byte; sTurma: ShortString; iDisciplina: Integer; iNumAulas: Byte; iProfessor: Integer);
var
   iAux: Integer;
   sAux: string;
begin
   if ((iDiaSemana < 8) and (iDiaSemana > 0)) then begin
      //define chave
      sAux := sTurma + '[:separadorinterno:]' + IntToStr(iDisciplina) + '[:separadorinterno:]' + IntToStr(iProfessor);
      //if not ExisteAulaDados(iDiaSemana, sAux) then begin
         iAux := High(TurmasAulas[iDiaSemana])+2;
         SetLength(TurmasAulas[iDiaSemana], iAux);
         TurmasAulas[iDiaSemana][iAux-1].sChave       := sAux;
         TurmasAulas[iDiaSemana][iAux-1].sTurma       := sTurma;
         TurmasAulas[iDiaSemana][iAux-1].iDisciplina  := iDisciplina;
         TurmasAulas[iDiaSemana][iAux-1].iProfessor   := iProfessor;
         TurmasAulas[iDiaSemana][iAux-1].iNumAulas    := iNumAulas;
     // end;
   end;
end;

function TfrmAulasProvasAcoes.isValidaBuscaTipoDigitacao: Boolean;
begin
   {É necessário ao menos uma turma selecionada para buscar os tipos de avaliação}
   Result :=   (txtCronogramasCurso.Text <> '') and
               (txtCronogramaTurma.Text <> '');
end;

function TfrmAulasProvasAcoes.GetInfProvaTipo(
  const cd_avaliacao: String; const cd_avaliacao_tipo: Integer; const campo: String): String;
const
   SQL_GET_INF_PROVA_TIPO =
      ' SELECT DISTINCT '+
      '   [$campo$] AS valor '+
      ' FROM '+
      '   avaliacoes_tipos avt '+
      '   LEFT JOIN avaliacoes_tipos_parametros avtp ON ( '+
			'       avt.cd_avaliacao_tipo = avtp.cd_avaliacao_tipo AND avtp.cd_avaliacao IN (:cd_avaliacoes) '+
      ' 	) '+
      ' WHERE '+
      ' 	avt.cd_avaliacao_tipo = :cd_avaliacao_tipo ';
var
   qyGetInfProvaTipo: TUMZQuery;
   separador: String;
begin
   DM.CriarConsulta(qyGetInfProvaTipo);

   qyGetInfProvaTipo.Close;
   qyGetInfProvaTipo.SQL.Text := StringReplace(SQL_GET_INF_PROVA_TIPO, '[$campo$]', campo, [rfReplaceAll, rfIgnoreCase]);
   qyGetInfProvaTipo.SQL.Text := StringReplace(qyGetInfProvaTipo.SQL.Text, ':cd_avaliacoes', cd_avaliacao, [rfReplaceAll, rfIgnoreCase]);
   qyGetInfProvaTipo.ParamByName('cd_avaliacao_tipo').AsInteger := cd_avaliacao_tipo;
   qyGetInfProvaTipo.Open;

   separador := '';
   while not qyGetInfProvaTipo.EOF do
   begin
      Result := Result + separador + qyGetInfProvaTipo.FieldByName('valor').AsString;
      separador := ',';
      qyGetInfProvaTipo.Next;
   end;

   FreeAndNil(qyGetInfProvaTipo);
end;

function TfrmAulasProvasAcoes.GetQtdProvasTipo( const nr_anosemestre: Integer;
         const cd_turma: String; const cd_disciplina, nr_serie, cd_avaliacao_tipo: Integer ): Integer;
const
   SQL_GET_QTD_PROVAS_TIPO =
      ' SELECT count(*) AS registros ' +
      ' FROM diario_provas ' +
      ' WHERE anosemestre = :nr_anosemestre AND turma = :cd_turma AND ' +
      '       disciplina = :cd_disciplina AND bimestre = :nr_etapa AND ' +
      '       cd_avaliacao_tipo = :cd_avaliacao_tipo AND ' +
      '       CASE WHEN :cd_grupo > 0 THEN cd_grupo = :cd_grupo ELSE 1=1 END ';
var
   qyGetQtdProvasTipo: TUMZQuery;
begin
   DM.CriarConsulta(qyGetQtdProvasTipo);

   qyGetQtdProvasTipo.Close;
   qyGetQtdProvasTipo.SQL.Text := SQL_GET_QTD_PROVAS_TIPO;
   qyGetQtdProvasTipo.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
   qyGetQtdProvasTipo.ParamByName('cd_turma').AsString := cd_turma;
   qyGetQtdProvasTipo.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
   qyGetQtdProvasTipo.ParamByName('nr_etapa').AsInteger := nr_serie;
   qyGetQtdProvasTipo.ParamByName('cd_avaliacao_tipo').AsInteger := cd_avaliacao_tipo;
   qyGetQtdProvasTipo.ParamByName('cd_grupo').AsInteger := sPGrupo;

   qyGetQtdProvasTipo.Open;

   Result := qyGetQtdProvasTipo.FieldByName('registros').AsInteger;

   FreeAndNil(qyGetQtdProvasTipo);
end;

function TfrmAulasProvasAcoes.ProcuraAulaDados(iDiaSemana: Byte;
  sChave: string): TAulaDado;
var
   i: Integer;
begin
   for i := Low(TurmasAulas[iDiaSemana]) to High(TurmasAulas[iDiaSemana]) do begin
      if (sChave = TurmasAulas[iDiaSemana][i].sChave) then begin
         Result := TurmasAulas[iDiaSemana][i];
         Break;
      end;
   end;
end;

function TfrmAulasProvasAcoes.ProcuraChaveDuplicada(const ASChave: string;
  const AICodProva: integer): TProva;
const
   SQL_GET_PROVA =
      'SELECT '+
         'r.cd_professor,'+
         'p.nm_pessoa,'+
         'r.assunto '+
      'FROM '+
         'diario_provas r '+
            'JOIN pessoas p ON'+
               '(r.cd_professor = p.cd_pessoa) '+
      'WHERE '+
         'r.ds_chave = :ds_chave AND '+
         'r.cd_prova <> :cd_prova';
var
   LQyGetProva: TUMZQuery;
begin
   Result := nil;
   DM.CriarConsulta(LQyGetProva);
   try
      LQyGetProva.ParamCheck := true;
      LQyGetProva.SQL.Text := SQL_GET_PROVA;
      LQyGetProva.ParamByName('ds_chave').AsString := ASChave;
      LQyGetProva.ParamByName('cd_prova').AsInteger := AICodProva;
      LQyGetProva.Open;
      if not LQyGetProva.IsEmpty then
      begin
         Result := TProva.Create(
            LQyGetProva.FieldByName('assunto').AsString, ASChave,
            TProfessor.Create(
               LQyGetProva.FieldByName('cd_professor').AsInteger,
               LQyGetProva.FieldByName('nm_pessoa').AsString
            )
         );
      end;
   finally
      LQyGetProva.Close;
      FreeAndNil(LQyGetProva);
   end;
end;

function TfrmAulasProvasAcoes.ProcuraNotaRE( editando : boolean ): boolean;
var
   qyGetProvaRE : TUMZQuery;
   i, iDisciplina : Integer;
   arrInfs : TStringList;
   sTurma : String;
begin
   DM.CriarConsulta( qyGetProvaRE );
   arrInfs := TStringList.Create();
   with qyGetProvaRE do
   begin
      Close;

      for i := 0 to clbPTD.Count - 1 do
      begin
         if(clbPTD.Checked[i]) or (clbPTD.Enabled = false)then
         begin
            arrInfs.Clear;

            SplitString(slPTurmaDisc[i], '[:separadorinterno:]', arrInfs);
                    
            sTurma := arrInfs[0];
            iDisciplina := StrToInt(arrInfs[1]);

            //

            SQL.Clear;
            SQL.Text :=
               'SELECT ' +
               '   dp.cd_prova ' +
               'FROM ' +
               '   diario_provas AS dp ' +
               'WHERE ' +
               '   dp.anosemestre = :anosemestre AND ' +
               '   dp.turma = :turma AND ' +
               '   dp.disciplina = :disciplina AND ' +
               '   dp.bimestre = :bimestre AND ' +
               '   dp.sn_especial = 1 ';
            if ( editando ) then
               SQL.Add( 'AND dp.nro_nota <> ' + lblProva.Caption );

            ParamByName('anosemestre').AsInteger := StrToInt( sPAnoSem );
            ParamByName('turma').AsString        := sTurma;
            ParamByName('disciplina').AsInteger  := iDisciplina;
            ParamByName('bimestre').AsInteger    := StrToInt( txtPBim.Text );

            Open;

            if (RecordCount > 0) then
            begin
               Result := false;
               Break;
            end else
               Result := true;
         end;

      end;

      Close;
   end;
end;

function TfrmAulasProvasAcoes.ProcuraNotaSuficiencia( editando : boolean; var slTurmasDisciplinas: TStringList ): boolean;
var
   qyGetProvaSuficiencia : TUMZQuery;
   i, iDisciplina : Integer;
   arrInfs : TStringList;
   sTurma : String;
begin
   DM.CriarConsulta( qyGetProvaSuficiencia );
   arrInfs := TStringList.Create();

   FreeAndNil( slTurmasDisciplinas );
   slTurmasDisciplinas := TStringList.Create();

   Result := true;

   with qyGetProvaSuficiencia do
   begin
      Close;

      for i := 0 to clbPTD.Count - 1 do
      begin
         if (clbPTD.Checked[i]) or (not clbPTD.Enabled) then
         begin
            arrInfs.Clear;

            SplitString(slPTurmaDisc[i], '[:separadorinterno:]', arrInfs);
                    
            sTurma := arrInfs[0];
            iDisciplina := StrToInt(arrInfs[1]);

            SQL.Clear;
            SQL.Text :=
               'SELECT ' +
               '   d.descricao ' +
               'FROM ' +
               '   diario_provas AS dp ' +
               '   INNER JOIN turmas t ON ( t.codigo = dp.turma AND t.anosemestre = dp.anosemestre ) ' +
               '   INNER JOIN disciplinas d ON ( d.codigo = dp.disciplina AND d.curso = t.curso ) ' +
               'WHERE ' +
               '   dp.anosemestre = :anosemestre AND ' +
               '   dp.turma = :turma AND ' +
               '   dp.disciplina = :disciplina AND ' +
               '   dp.sn_proficiencia = 1 ';
            if ( editando ) then
               SQL.Add( 'AND dp.nro_nota <> ' + lblProva.Caption );

            ParamByName('anosemestre').AsInteger := StrToInt( sPAnoSem );
            ParamByName('turma').AsString        := sTurma;
            ParamByName('disciplina').AsInteger  := iDisciplina;

            Open;

            if RecordCount > 0 then
               slTurmasDisciplinas.Add( sTurma + ' - ' +
                                        Copy(slPDisciplinas.Strings[i],Pos('-',slPDisciplinas.Strings[i])-1, length(slPDisciplinas.Strings[i])) );            

         end;

      end;

      Close;
   end;

   if ( slTurmasDisciplinas.Count > 0 ) then
      Result := False;
end;

function TfrmAulasProvasAcoes.ProcuraChaveDuplicada(
  const ASChave: string): TProva;
const
   SQL_GET_PROVA =
      'SELECT '+
         'r.cd_professor,'+
         'p.nm_pessoa,'+
         'r.assunto '+
      'FROM '+
         'diario_provas r '+
            'JOIN pessoas p ON'+
               '(r.cd_professor = p.cd_pessoa) '+
      'WHERE '+
         'r.ds_chave = :ds_chave';
var
   LQyGetProva: TUMZQuery;
begin
   Result := nil;
   DM.CriarConsulta(LQyGetProva);
   try
      LQyGetProva.ParamCheck := true;
      LQyGetProva.SQL.Text := SQL_GET_PROVA;
      LQyGetProva.ParamByName('ds_chave').AsString := ASChave;
      LQyGetProva.Open;
      if not LQyGetProva.IsEmpty then
      begin
         Result := TProva.Create(
            LQyGetProva.FieldByName('assunto').AsString, ASChave,
            TProfessor.Create(
               LQyGetProva.FieldByName('cd_professor').AsInteger,
               LQyGetProva.FieldByName('nm_pessoa').AsString
            )
         );
      end;
   finally
      LQyGetProva.Close;
      FreeAndNil(LQyGetProva);
   end;
end;

procedure TfrmAulasProvasAcoes.qyComplAfterOpen(DataSet: TDataSet);
begin
   qyAjuste.Close();
   qyAjuste.Open();
end;

procedure TfrmAulasProvasAcoes.RecarregaDatasDiario;
const
   SQL_DATAS_LIMIT_DISCIPLINA = ' SELECT '+
                                '    MIN(da.data) primeira_aula, '+
                                '    MAX(da.data) ultima_aula '+
                                ' FROM '+
                                '    diario_aulas da '+
                                '    INNER JOIN diario_cronogramas dc ON (dc.cd_cronograma = da.cd_cronograma) '+  
                                ' WHERE '+
                                '    da.anosemestre = :nr_anosemestre AND '+
                                '    da.turma LIKE :cd_turma AND '+
                                '    da.disciplina = :cd_disciplina AND '+
                                '    da.bimestre = 1';
var
   I: Integer;
   dataInicio, dataFim: TDate;
   nomeComponente: String;

   qyDatasLimites: TUMZQuery;

   cd_turma: String;
   nr_anosemestre, cd_disciplina: Integer;

   avl_param_dt_inicio, avl_param_dt_fim: String;
begin

   // Pega as variáveis de anosemestre/turma/disciplina
   nr_anosemestre := StrToInt(sPAnoSem);
   cd_turma := sPTurma;
   if Length(sPDisciplina) > 0 then
   begin
      cd_disciplina := StrToInt(sPDisciplina);
   end else begin
      cd_disciplina := -1;
   end;

   // Verifica se existe parâmetro de avaliação definindo o prazo do diário
   avl_param_dt_inicio := UpperCase(ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma, sPDisciplina, 'ds_cronograma_visualiza_inicio'));
   avl_param_dt_fim := UpperCase(ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma, sPDisciplina, 'ds_cronograma_visualiza_fim'));

   // Se existir o parametro de avaliação definindo o prazo do diário cálcula os prazos com base no parametro
   if (Length(avl_param_dt_inicio) > 0) and (Length(avl_param_dt_fim) > 0) then
   begin
      // Edita texto do prazo do diário
      Label51.Caption := 'Data inicial do Diário: '+avl_param_dt_inicio;
      Label52.Caption := 'Data final do Diário: '+avl_param_dt_fim;

      // Não permite visualização dos prazos do diário
      umdtInicioDiario.Visible := false;
      umdtFimDiario.Visible := false;

   // Se não existir o parametro de avaliação definindo o prazo do diário, permite o usuário informar o próprio prazo
   end else begin
      // Edita texto do prazo do diário
      Label51.Caption := 'Data inicial do Diário:';
      Label52.Caption := 'Data final do Diário:';

      // Permite visualização dos campos de preenchimento de prazo do diário
      umdtInicioDiario.Visible := true;
      umdtFimDiario.Visible := true;

      // Carrega as datas para serem apresentadas
      dataInicio := dtpDataAula1.Date;

      if (StrToInt(edQtdAulas.Text) > 1) then
      begin
         dataFim := dtpDataAula2.Date
      end else begin
         dataFim := dtpDataAula1.Date;
      end;

      for I := (sbAulas.ComponentCount - 1) downto 0 do
      begin
         nomeComponente := sbAulas.Components[I].Name;
         if ( Pos( 'dtpDataAula', nomeComponente ) > 0 ) then
         begin
            if TUMDateTimePicker(sbAulas.Components[I]).getDate <= dataInicio then
               dataInicio := TUMDateTimePicker(sbAulas.Components[I]).getDate;

            if TUMDateTimePicker(sbAulas.Components[I]).getDate >= dataFim then
               dataFim := TUMDateTimePicker(sbAulas.Components[I]).getDate;
         end;
      end;

      DM.CriarConsulta(qyDatasLimites);
      qyDatasLimites.Close();
      qyDatasLimites.SQL.Text := SQL_DATAS_LIMIT_DISCIPLINA;
      qyDatasLimites.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      qyDatasLimites.ParamByName('cd_turma').AsString := cd_turma;
      if Length(sPDisciplina) > 0 then
      begin
         qyDatasLimites.ParamByName('cd_disciplina').AsInteger := StrToInt(sPDisciplina);
      end;
      qyDatasLimites.Open();

      if qyDatasLimites.FieldByName('primeira_aula').AsDateTime < dataInicio then
      begin
         dataInicio := qyDatasLimites.FieldByName('primeira_aula').AsDateTime;
      end;

      if qyDatasLimites.FieldByName('ultima_aula').AsDateTime > dataFim then
      begin
         dataFim := qyDatasLimites.FieldByName('ultima_aula').AsDateTime;
      end;

      // Coloca as datas iniciais do diário como sendo a data da primeira e última aula do cronograma respectivamente
      umdtInicioDiario.Date := now;

      if dataInicio > 0 then
      begin
         umdtInicioDiario.Date := dataInicio;
      end;
      
      umdtFimDiario.Date := dataFim;
   end;

   // Atualiza a data da avaliação institucional no cronograma
   AtualizarDataAvaliacaoInstucionalCronograma;

end;

// Setar a data da avaliação institucional, como sendo igual a data da última aula cadastrada
procedure TfrmAulasProvasAcoes.AtualizarDataAvaliacaoInstucionalCronograma;
var
   I: Integer;
   dataUltimaAula: TDate;
   nomeComponente, sTime: String;
begin

   // Atribui a data da última aula como sendo a primeira aula
   dataUltimaAula := dtpDataAula1.getDate;

   // Verifica se a segunda aula é maior que a primeira, caso esteja ativada
   if dtpDataAula2.Enabled and (dtpDataAula2.getDate > dataUltimaAula) then
   begin
      dataUltimaAula := dtpDataAula2.getDate;
   end;

   for I := (sbAulas.ComponentCount - 1) downto 0 do
   begin
      nomeComponente := sbAulas.Components[I].Name;
      if ( (Pos( 'dtpDataAula', nomeComponente ) > 0) and TUMDateTimePicker(sbAulas.Components[I]).Enabled ) then
      begin
         if TUMDateTimePicker(sbAulas.Components[I]).getDate >= dataUltimaAula then
         begin
            dataUltimaAula := TUMDateTimePicker(sbAulas.Components[I]).getDate;
         end;
      end;
   end;

   // Busca apenas o horário (hora e minuto) na data da avaliação
   sTime := Copy(umdtAvaliacao.Text, 11);
   // Se não houver um horário já definido utiliza 00:00, senão utiliza o horário definido
   if sTime = '  :  ' then
   begin

      umdtAvaliacao.Text := DateTimeToStr(IncDay(dataUltimaAula,1))+' 00:00';
   end else begin

      umdtAvaliacao.Text := DateTimeToStr(IncDay(dataUltimaAula,1))+' '+sTime;
   end;
end;

procedure TfrmAulasProvasAcoes.RecarregaHorarios;
var
   qyBuscaHorarios: TUMZQuery;
begin
   DM.CriarConsulta( qyBuscaHorarios );

   with qyBuscaHorarios do
   begin
      if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then begin
         SQL.Add( ' SELECT ' );
         SQL.Add( '    codigo, COALESCE(ds_chave, ds_horario||''-''||hr_inicio||'+QuotedStr(' - ')+'||hr_inicio||'+QuotedStr(' ')+'||hr_fim) AS ds_chave ' );
         SQL.Add( ' FROM ' );
         SQL.Add( '    horarios ' );
         SQL.Add( ' WHERE sn_ativo = 1 ' );
         SQL.Add( ' ORDER BY ' );
         SQL.Add( '    ds_horario, ds_chave ' );
      end else begin
         SQL.Add( ' SELECT ' );
         SQL.Add( '    codigo, COALESCE(ds_chave, CONCAT(ds_horario, '+QuotedStr(' - ')+', hr_inicio, '+QuotedStr(' ')+', hr_fim)) AS ds_chave ' );
         SQL.Add( ' FROM ' );
         SQL.Add( '    horarios ' );
         SQL.Add( ' WHERE sn_ativo = 1 ' );
         SQL.Add( ' ORDER BY ' );
         SQL.Add( '    ds_horario, ds_chave ' );
      end;

      Open;

      arrHorarios := TStringList.Create();

      arrHorarios.AddObject( '', TItemCombo.Create( '', '' ) );

      while not Eof do
      begin
         arrHorarios.AddObject(
            FieldByName( 'ds_chave' ).AsString,
            TItemCombo.Create(
               FieldByName( 'codigo' ).AsString,
               FieldByName( 'ds_chave' ).AsString
            )
         );

         Next;
      end;
   end;

   cbHorarioAula1.Items.Assign( arrHorarios );
   cbHorarioAula2.Items.Assign( arrHorarios );
end;

procedure TfrmAulasProvasAcoes.rgPeriodicidadeClick(Sender: TObject);
begin
   AlteraPeriodicidade;
end;

function TfrmAulasProvasAcoes.ExisteAulaDados(iDiaSemana: Byte;
  sChave: string): Boolean;
var
   i: Integer;
begin
   Result := False;
   for i := Low(TurmasAulas[iDiaSemana]) to High(TurmasAulas[iDiaSemana]) do begin
      if (sChave = TurmasAulas[iDiaSemana][i].sChave) then begin
         Result := True;
         Break;
      end;
   end;
end;

function TfrmAulasProvasAcoes.getAnoSemestre: string;
begin
   Result := sAnoSem;
end;

function TfrmAulasProvasAcoes.getCdProfessorGrupo(cd_grupo: Integer): Integer;
const
   SQL_PROFESSOR_GRUPO = 'SELECT cd_professor FROM diario_grupos WHERE cd_grupo = :cd_grupo';
var
   qyProfessor: TUMZQuery;
begin
   DM.CriarConsulta(qyProfessor);

   qyProfessor.Close;
   qyProfessor.SQL.Text := SQL_PROFESSOR_GRUPO;
   qyProfessor.ParamByName('cd_grupo').AsInteger := cd_grupo;
   qyProfessor.Open;

   Result := qyProfessor.FieldByName('cd_professor').AsInteger;
end;

function TfrmAulasProvasAcoes.GetConfirmacao(const ASNomeProva,
  ASNomeProfessor: string): boolean;
const
   PERGUNTA =
      'A chave digitada já está sendo utilizada pela prova "%s".' + #13 +
      'Caso esta chave seja mantida, a digitação das notas será agrupada para o professor %s, responsável pela prova.' + #13 + #13 +
      'Deseja manter esta chave?';
begin
   Result :=
      Mensagem(
         Format(PERGUNTA, [ASNomeProva, ASNomeProfessor]), 'Atenção!', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = ID_YES;
end;

procedure TfrmAulasProvasAcoes.FiltrarDisciplinas();
var
   qyDisciplinas: TUMZQuery;
   objItemCombo: TItemCombo;
begin
   DM.CriarConsulta( qyDisciplinas );

   cbDisciplinas.Items.Clear;

   with qyDisciplinas do
   begin
      Close;
      SQL.Clear;

      if Self.AcaoIncluirCampos = Editar then
      begin
         SQL.Add('SELECT ');
         SQL.Add(' d.descricao, ');
         SQL.Add(' d.codigo ');
         SQL.Add('FROM  ');
         SQL.Add(' diario_cronogramas dc ');
         SQL.Add('JOIN disciplinas d ON (d.codigo = dc.disciplina) ');
         SQL.Add('WHERE ');
         SQL.Add(' dc.cd_cronograma = :cd_cronograma AND ');
         SQL.Add(' d.curso = :cd_curso ');

         ParamByName('cd_cronograma').AsInteger := qCronogramaCD_CRONOGRAMA.AsInteger;
         ParamByName( 'cd_curso' ).AsString := sCronogramaCurso;

      end
      else
      begin
         SQL.Add( ' SELECT ' );
         SQL.Add( ' 	  d.codigo, d.descricao ' );
         SQL.Add( ' FROM ' );
         SQL.Add( ' 	  grades_disciplinas gd ' );
         SQL.Add( ' 	  INNER JOIN turmas t ON ( ' );
         SQL.Add( ' 	     t.curso = gd.cd_curso AND t.cd_grade = gd.cd_grade AND ' );
         SQL.Add( ' 	     t.serie = gd.nr_serie ' );
         SQL.Add( ' 	  ) ' );
         SQL.Add( ' 	  INNER JOIN disciplinas d ON ( ' );
         SQL.Add( ' 	     d.codigo = gd.cd_disciplina AND d.curso = gd.cd_curso ' );
         SQL.Add( ' 	  ) ' );
         SQL.Add( ' WHERE ' );
         SQL.Add( ' 	  gd.cd_curso = :curso AND ' );
         SQL.Add( ' 	  t.anosemestre = :anosemestre AND ' );
         SQL.Add( ' 	  t.codigo = :turma ' );
         SQL.Add( ' ORDER BY ' );
         SQL.Add( '    d.descricao, t.anosemestre DESC ' );
         
         if ( DM.UsaAnosemestre ) then
            ParamByName( 'anosemestre' ).AsString := sCronogramaAnoSem
         else
            ParamByName( 'anosemestre' ).AsInteger := ANOSEMESTRE_PADRAO;
            
         ParamByName( 'curso' ).AsString := sCronogramaCurso;
         ParamByName( 'turma' ).AsString := sCronogramaTurma;

      end;

      Open;

      cbDisciplinas.Items.AddObject( '', TItemCombo.Create( '', '' ) );
      while not Eof do
      begin
         objItemCombo := TItemCombo.Create(
                           FieldByName( 'codigo' ).AsString,
                           FieldByName( 'descricao' ).AsString );

         cbDisciplinas.Items.AddObject( FieldByName( 'descricao' ).AsString, objItemCombo );

         objItemCombo := nil;
         Next;
      end;
   end;

   cbDisciplinas.Enabled := true;
end;

procedure TfrmAulasProvasAcoes.FiltrarGrupos;
const
   SQL_GRUPOS_INSERIR = ' SELECT '+
                        '     cd_grupo, '+
                        '     nm_grupo '+
                        ' FROM '+
                        '     diario_grupos '+
                        ' WHERE '+
                        '     nr_anosemestre = :nr_anosemestre AND '+
                        '     cd_curso LIKE :cd_curso AND '+
                        '     cd_turma LIKE :cd_turma AND '+
                        '     cd_disciplina = :cd_disciplina AND '+
                        '     sn_ativo = 1 ';

   SQL_GRUPOS_EDITAR = ' SELECT '+
                       '     dg.cd_grupo, '+
                       '     dg.nm_grupo '+
                       ' FROM '+
                       '     diario_cronogramas dc '+
                       '     INNER JOIN diario_grupos dg ON (dc.cd_grupo = dg.cd_grupo) '+
                       ' WHERE '+
                       '     dc.cd_cronograma = :cd_cronograma ';
                       
var
   qyGrupos: TUMZQuery;
   objItemCombo: TItemCombo;
begin
   DM.CriarConsulta( qyGrupos );

   // Limpa a combo de grupos
   cbGrupos.Items.Clear;

   // Prepara o SQL para buscar os grupos
   qyGrupos.Close;
   qyGrupos.SQL.Clear;

   // Verifica se é edição de um cronograma
   if Self.AcaoIncluirCampos = Editar then
   begin

      // Busca ao grupo do cronograma (se houver)
      qyGrupos.SQL.Text := SQL_GRUPOS_EDITAR;
      qyGrupos.ParamByName('cd_cronograma').AsInteger := qCronogramaCD_CRONOGRAMA.AsInteger;

   // Inserção de um novo cronograma
   end else begin

      qyGrupos.SQL.Text := SQL_GRUPOS_INSERIR;
      if ( DM.UsaAnosemestre ) then
      begin
         qyGrupos.ParamByName( 'nr_anosemestre' ).AsString := sCronogramaAnoSem
      end else begin
         qyGrupos.ParamByName( 'nr_anosemestre' ).AsInteger := ANOSEMESTRE_PADRAO;
      end;
      qyGrupos.ParamByName( 'cd_curso' ).AsString := sCronogramaCurso;
      qyGrupos.ParamByName( 'cd_turma' ).AsString := sCronogramaTurma;
      qyGrupos.ParamByName( 'cd_disciplina' ).AsInteger := StrToInt(sCronogramaDisciplina);

      txtCronogramasProfessor.Text := '';
      txtSubstituto.Text := '';
   end;

   qyGrupos.Open();

   // Prepara para adicionar os grupos a combo de grupos

   // Adiciona uma combo vazia (sem grupo)
   cbGrupos.Items.AddObject( '', TItemCombo.Create( '', '' ) );

   // Varre os grupos encontrados e adiciona os mesmos na combo
   while not qyGrupos.Eof do
   begin
      objItemCombo := TItemCombo.Create(
                           qyGrupos.FieldByName('cd_grupo').AsString,
                           qyGrupos.FieldByName('nm_grupo').AsString
                      );
      cbGrupos.Items.AddObject( qyGrupos.FieldByName( 'nm_grupo' ).AsString, objItemCombo );
      objItemCombo := nil;
      qyGrupos.Next;
   end;

   Self.bloqueiaCamposGrupoSelecionado();
end;

procedure TfrmAulasProvasAcoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
   i: integer;
begin
   AcaoIncluirCampos := Padrao;

   for i := 0 to Self.cbResponsavel.Items.Count - 1 do begin
      try
         TProfessor(Self.cbResponsavel.Items.Objects[i]).Free;
      except
      end;
   end;

   for i := 1 to Self.cbTiposProvas.Items.Count - 1 do begin
      try
         TTipoProva(Self.cbTiposProvas.Items.Objects[i]).Free;
      except
      end;
   end;

   Self.cbResponsavel.Clear;
   Self.cbTiposProvas.Clear;

   alterouDtFim := false;
   alterouDtInicio := false;
end;

procedure TfrmAulasProvasAcoes.FormCreate(Sender: TObject);
begin
   Self.Tag := Self.Height;
   LoadSituacaoGeraCP;
   umdtDataInic.Date := Now();
   umdtDataFim.Date := Now();
   umdtPData.Date := Now();
   valorMaximoAula := -1;
end;

procedure TfrmAulasProvasAcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if pcAulas.ActivePage = tsAulas then
   begin
      case key of
         VK_F5 : if btSalvar.Enabled then btSalvarClick( nil );
         VK_F6 : if btCancelar.Enabled then btCancelarClick( nil );
      end;
   end;

   if pcAulas.ActivePage = tsProvas then
   begin
      case key of
         VK_F5 : if ToolButton2.Enabled then btSalvarClick( nil );
         VK_F6 : if ToolButton4.Enabled then btCancelarClick( nil );
      end;
   end;

   if pcAulas.ActivePage = tsAprovacao then
   begin
      case key of
         VK_F6 : if btACancelar.Enabled then btACancelarClick( nil );
      end;
   end;

   if pcAulas.ActivePage = tsCalculo then
   begin
      case key of
         VK_F5 : if tblNCalcular.Enabled then btSalvarClick( nil );
         VK_F6 : if tblNCancelar.Enabled then btCancelarClick( nil );
      end;
   end;

   if pcAulas.ActivePage = tsCronogramasGerenciar then
   begin
      case Key of
         VK_F5 : if ToolButton4.Enabled then btSalvarClick( nil );
         VK_F6 : if ToolButton16.Enabled then btCancelarClick( nil );
      end;
   end;
  
end;

procedure TfrmAulasProvasAcoes.FormMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
 With ScrollBox1.VertScrollBar Do
 Begin
  If (Position <= (Range - Increment)) Then
   Position := Position + Increment Else
    Position := Range - Increment;
 End; 
end;

procedure TfrmAulasProvasAcoes.FormMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
   with ScrollBox1.VertScrollBar do
   begin
   if (Position >= Increment) then
   begin
      Position := Position - Increment;
   end
   else
   begin
      Position := 0;
   end;
   End;
end;

procedure TfrmAulasProvasAcoes.SelecionaTab(sTab: string);
var
   i: Integer;
begin
   for i := 0 to (pcAulas.PageCount -1) do begin
      if pcAulas.Pages[i].Name = sTab then begin
         pcAulas.Pages[i].TabVisible   := True;
         pcAulas.ActivePage            := pcAulas.Pages[i];
      end
      else begin
         pcAulas.Pages[i].TabVisible := False;
      end;
   end;

end;

procedure TfrmAulasProvasAcoes.SelecionaTurmaDisciplina;
var
   i, j: Integer;
   slTurmasDiscProf: TStringList;
begin
   // Cria um StringList que armazenara as informações do campo Turmas/Disciplina
   slTurmasDiscProf := TStringList.Create();

   // Tenta selecionar a Turma/Disciplina/Professor da prova, caso seja possível
   // Poderá não ser possível selecionar pelos seguintes motivos:
   // - Professor da prova não leciona mais a turma/disciplina
   // - O destino da prova (etapa/turma/disciplina) pode não mais comportar provas do tipo que está sendo duplicado
   for i := 0 to clbPTD.Count-1 do begin
   
      // Quebra as informações contidas no campo Turmas/Disciplinas dentro do StringList "slTurmasDiscProf"
      // indice 0 = turma
      // indice 1 = professor
      // indice 2 = disciplina
      SplitString(slPTurmas.Strings[i], ',', slTurmasDiscProf);

      // Verifica se o professor é o professor da prova, nesse caso tenta selecionar ele
      if Professor.Codigo = StrToInt(slTurmasDiscProf[1]) then
      begin

         // Se a prova necessita de grupo na outra disciplina, não será marcada a opção
         if ProvaNecessitaGrupo(i, false) then begin
            Exit;
         end;

         // Se a prova excedeu o limite definido no parametro para a disciplina, não será marcada a opção
         if ExecedeuLimiteProvas(i, false) then begin
            Exit;
         end;

         clbPTD.Checked[i] := True;
      end;

   end;

end;

procedure TfrmAulasProvasAcoes.Processando(bStatus: Boolean);
begin
   if bStatus then begin

      if not PrincipalForm.ProcuraForm(frmSpl) then begin
         frmSpl := TfrmSplash.Create(Self);
      end;
      frmSpl.Position := poMainFormCenter;
      frmSpl.FormStyle := fsNormal;
      frmSpl.Label1.Caption := 'Criando aulas...';
      frmSpl.Show();
   end
   else begin
      if frmSpl <> nil then begin
         FreeAndNil(frmSpl);
      end;
   end;

end;

procedure TfrmAulasProvasAcoes.ProcessarConflitosHorariosCronograma(const IAulaUnica: Integer);
var
   IAula: Integer;
   umAjudaAula: TUMAjuda;
   dtpDataAula: TUMDateTimePicker;
   cbHorarioAula: TUMComboBox;
   sala: TSala;
   objTurma: TTurma;

   aulaMinima: Integer;
   aulaMaxima: Integer;
begin
   aulaMinima := 1;
   aulaMaxima := StrToInt(edQtdAulas.Text);

   if (IAulaUnica >= aulaMinima) AND (IAulaUnica <= aulaMaxima) then
   begin
      aulaMinima := IAulaUnica;
      aulaMaxima := IAulaUnica;
   end;

   for IAula := aulaMinima to aulaMaxima do
   begin
      if IAula > 2 then
         umAjudaAula := TUMAjuda(sbAulas.FindComponent('umAjudaAula' + IntToStr(IAula)))
      else
         umAjudaAula := TUMAjuda(Self.FindComponent('umAjudaAula' + IntToStr(IAula)));

      if (umAjudaAula <> nil) then
      begin
         umAjudaAula.Visible := False;
      end;

      if IAula > 2 then
      begin
         dtpDataAula := TUMDateTimePicker(sbAulas.FindComponent('dtpDataAula' + IntToStr(IAula)));
         cbHorarioAula := TUMComboBox(sbAulas.FindComponent('cbHorarioAula' + IntToStr(IAula)));
      end else begin
         dtpDataAula := TUMDateTimePicker(Self.FindComponent('dtpDataAula' + IntToStr(IAula)));
         cbHorarioAula := TUMComboBox(Self.FindComponent('cbHorarioAula' + IntToStr(IAula)));
      end;

      if NOT(edNomeSala.Tag > 0) OR
         NOT(cbHorarioAula.ItemIndex > 0) OR
         NOT(txtCronogramaTurma.Text <> '') OR
         NOT(cbDisciplinas.ItemIndex > 0) then
      begin
         umAjudaAula := nil;
         dtpDataAula := nil;
         cbHorarioAula := nil;
         Continue;
      end;

      sala := TSala.Create(edNomeSala.Tag, edNomeSala.Text);

      try
         objTurma := TTurma.Create(txtCronogramaTurma.Text, StrToInt(sPAnoSem));
         sala.TryConflitos(sala.GetConflitos(
            objTurma,
            THorario.Create(StrToInt(TItemCombo(cbHorarioAula.Items.Objects[cbHorarioAula.ItemIndex]).codigo)),
            TDisciplina.Create(StrToInt( TItemCombo( cbDisciplinas.Items.Objects[ cbDisciplinas.ItemIndex ] ).codigo ), objTurma.Curso),
            DayOfWeek(dtpDataAula.Date),
            tccCronograma,
            dtpDataAula.Date
         ));
      except
         on E:ExceptionConflitoSalas do
         begin
            umAjudaAula.Caption := E.Message;
            umAjudaAula.Visible := True;
         end;
      end;

      umAjudaAula := nil;
      dtpDataAula := nil;
      cbHorarioAula := nil;
      sala := nil;
   end;
end;

procedure TfrmAulasProvasAcoes.CarregaItemBusca();
var
   I, J: Integer;
begin
   //Aulas
   if pcAulas.ActivePage = tsAulas then begin
      sAnoSem              := sPAnoSem;
      txtCurso.Text        := sPCurso;
      txtTurma.Text        := sPTurma;
      txtDisciplina.Text   := sPDisciplina;
      txtBim.Text          := sPBim;
   end
   else if pcAulas.ActivePage = tsProvas then begin
      txtPCurso.Text       := sPCurso;
      txtPTurma.Text       := sPTurma;
      txtPDisciplina.Text  := sPDisciplina;
      txtPBim.Text         := sPBim;
      txtPSerie.Text       := sPSerie;
      ckbPSerie.checked    := sPCSerie;
      udPSerie.Enabled     := sPCSerie;
   end
   { Cronogramas }
   else if pcAulas.ActivePage = tsCronogramasGerenciar then begin
      sAnoSem := sPAnoSem;
      txtCronogramasCurso.Text      := sPCurso;
      if ( trim(txtCronogramasCurso.Text) <> '' ) then
      begin
         if ( trim(sPTurma) <> '' ) then
         begin
            if (txtCronogramaTurma.Enabled) then
            begin
               txtCronogramaTurma.Text := sPTurma;
            end;
            FiltrarDisciplinas();
            if ( trim(sPDisciplina) <> '' ) then
            begin
               cbDisciplinas.ItemIndex := cbDisciplinas.Items.IndexOf( sPDisciplina );
               if cbDisciplinas.ItemIndex = -1 then
                  for I := 0 to cbDisciplinas.Items.Count - 1 do
                     if TItemCombo(cbDisciplinas.Items.Objects[I]).getCodigo = sPDisciplina then
                     begin
                        cbDisciplinas.ItemIndex := cbDisciplinas.Items.IndexOf( TItemCombo(cbDisciplinas.Items.Objects[I]).getDescricao );
                        FiltrarGrupos();
                        if sPGrupo > 0 then
                        begin
                           cbGrupos.ItemIndex := -1;
                           for J := 0 to cbGrupos.Items.Count - 1 do
                              if TItemCombo(cbGrupos.Items.Objects[J]).getCodigo = IntToStr(sPGrupo) then
                              begin
                                 cbGrupos.ItemIndex := cbGrupos.Items.IndexOf( TItemCombo(cbGrupos.Items.Objects[J]).getDescricao );
                                 break;
                              end;
                           if cbGrupos.ItemIndex > -1 then
                           begin
                              break;
                           end;
                        end;
                     end;
               if cbDisciplinas.ItemIndex > -1 then
                  sCronogramaDisciplina := TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo()
               else
                  sCronogramaDisciplina := '0';
            end;
         end else
            txtCronogramaTurma.Text := '';
      end;
   end
   else if pcAulas.ActivePage = tsComplemento then begin
      qyComplcd_turma.AsString := sPTurma;
   end;

end;

procedure TfrmAulasProvasAcoes.CarregaAvaliacaoCronograma;
var
  objItemCombo: TItemCombo;
  qryGetAvaliacao : TUMZQuery;
  i, pProvaAi : Integer;
begin
   if pcAulas.ActivePage = tsCronogramasGerenciar then
   begin

      DM.CriarConsulta(qryGetAvaliacao);

      qryGetAvaliacao.SQL.Text :=
      ' SELECT                                  '+
      '	  avp.cd_avaliacao,                     '+
      '   avl.ds_avaliacao,                     '+
      '   DATE_FORMAT(avp.dt_inicio, "%d/%m/%Y %H:%i") dt_inicio '+
      ' FROM                                    '+
      '   avl_resolucao_prazo avp               '+
      '   INNER JOIN avl_avaliacoes avl ON (avp.cd_avaliacao = avl.cd_avaliacao) '+
      ' WHERE                                   '+
      '   avl.cd_tipo_avaliacao = 2 AND         '+
      '   avp.cd_turma LIKE :CD_TURMA AND       '+
      '   avp.cd_disciplina = :CD_DISCIPLINA    '+
      ' ORDER BY                                '+
      ' 	avp.cd_avaliacao DESC                  ';

      qryGetAvaliacao.ParamByName('CD_TURMA').AsString       := qCronograma.FieldByName('TURMA').AsString;
      qryGetAvaliacao.ParamByName('CD_DISCIPLINA').AsInteger := qCronograma.FieldByName('DISCIPLINA').AsInteger;

      qryGetAvaliacao.Open;

      if qryGetAvaliacao.FieldByName('cd_avaliacao').AsInteger > 0 then
      begin
         chkAI.Checked := True;
         umdtAvaliacao.Text := qryGetAvaliacao.FieldByName('dt_inicio').AsString;
      end
      else
      begin
         chkAI.Checked := False;
         umdtAvaliacao.Text := FormatDateTime('dd/mm/yyyy 00:00', IncDay(now(),1));
      end;

      // Carrega todas as avaliações disponíveis na combo
      cbAvaliacao.Items.Clear;

      // Inclui a avaliação selecionada como padrão
      if qryGetAvaliacao.FieldByName('cd_avaliacao').AsInteger > 0 then
      begin
        qyAvaliacaoCronograma.ParamByName('cd_avaliacao').AsInteger := qryGetAvaliacao.FieldByName('cd_avaliacao').AsInteger;
      end;
            
      qyAvaliacaoCronograma.ParamByName('nr_anosemestre').AsInteger := StrtoInt(sPAnoSem);
      pProvaAi := StrToInt( DM.variavel_parametro('padrao_prova_ai') );
      qyAvaliacaoCronograma.Open;
      i := 0;
      while not qyAvaliacaoCronograma.Eof do
      begin
        objItemCombo := TItemCombo.Create(
                               qyAvaliacaoCronograma.FieldByName( 'cd_avaliacao' ).AsString,
                               qyAvaliacaoCronograma.FieldByName( 'ds_avaliacao' ).AsString );

        cbAvaliacao.Items.AddObject( qyAvaliacaoCronograma.FieldByName( 'ds_avaliacao' ).AsString, objItemCombo );

        objItemCombo := nil;

        if StrToInt(qyAvaliacaoCronograma.FieldByName('cd_avaliacao').AsString) = pProvaAi then
         cbAvaliacao.ItemIndex := i;

        inc(i);
        qyAvaliacaoCronograma.Next;
      end;

      qyAvaliacaoCronograma.Close;

      // Seleciona a avaliação do cronograma
      if qryGetAvaliacao.FieldByName('cd_avaliacao').AsInteger > 0 then
      begin
        cbAvaliacao.ItemIndex := cbAvaliacao.Items.IndexOf( qryGetAvaliacao.FieldByName('ds_avaliacao').AsString );
      end else if ( cbAvaliacao.Items.Count > 0 ) and ( pProvaAi <= 0 ) then
      begin
        cbAvaliacao.ItemIndex := 0;
      end;

      FreeAndNil(qryGetAvaliacao);
   end;
end;

procedure TfrmAulasProvasAcoes.CarregaProfessores;

   procedure LimpaCombo;
   var
      i: integer;
   begin
      for i := 0 to Self.cbResponsavel.Items.Count - 1 do
         TProfessor(Self.cbResponsavel.Items.Objects[i]).Free;
   end;

var
   i, j: integer;
   bAchou: boolean;
   qyProfessores: TUMZQuery;
begin
   bAchou := false;
   DM.CriarConsulta(qyProfessores);
   try
      if Trim(Self.txtPDisciplina.Text) <> '' then
      begin
         qyProfessores.SQL.Text := Self.GetSQLProfessores(Self.txtPCurso.Text, Self.txtPTurma.Text, Self.txtPDisciplina.Text);
      end
      else if Trim(Self.txtPTurma.Text) <> '' then
      begin
         qyProfessores.SQL.Text := Self.GetSQLProfessores(Self.txtPCurso.Text, Self.txtPTurma.Text);
      end
      else if Trim(Self.txtPCurso.Text) <> '' then
      begin
         qyProfessores.SQL.Text := Self.GetSQLProfessores(Self.txtPCurso.Text);
      end;
      qyProfessores.Open;
      while not qyProfessores.Eof do
      begin
         Self.cbResponsavel.Items.AddObject(
            qyProfessores.FieldByName('nm_pessoa').AsString,
            TProfessor.Create(
               qyProfessores.FieldByName('cd_pessoa').AsInteger,
               qyProfessores.FieldByName('nm_pessoa').AsString
            )
         );
         qyProfessores.Next;
      end;
      j := -1;
      if Assigned(Self.Professor) then
      begin
         for i := 0 to Self.cbResponsavel.Items.Count - 1 do
         begin
            if TProfessor(Self.cbResponsavel.Items.Objects[i]).Nome = Self.Professor.Nome then
            begin
               j := i;
               bAchou := true;
               Break;
            end;
         end;
         if not bAchou then
            j := Self.cbResponsavel.Items.AddObject(Self.Professor.Nome, Self.Professor);
      end;
      Self.cbResponsavel.ItemIndex := j;
   finally
      qyProfessores.Close;
      qyProfessores.Free;
   end;
end;

procedure TfrmAulasProvasAcoes.CarregarSituacoesLogistica(const cd_situacao_material_aula : Integer;
         const cd_situacao_transporte : Integer; const cd_situacao_local_aula : Integer;
         const cd_situacao_hospedagem : Integer; const cd_situacao_geren_professor : Integer;
         const cd_situacao_geren_gestor: Integer);
const
   SQL_SITUACOES_LOGISTICA =
      ' SELECT cd_modulo, cd_situacao, ds_valor, cd_auxiliar ' +
      ' FROM situacoes WHERE cd_modulo IN ( 1090, 1091, 1092, 1093, 1094, 1095 ) ' +
      ' ORDER BY cd_modulo, ds_valor ';
var
   qyCarregarSituacoesLogistica : TUMZReadOnlyQuery;
   cbAddItem: TUMComboBox;
   cd_situacao_selecionar: Integer;
   tem_permissao_especial_logistica : Boolean;
begin
   DM.CriarConsulta( qyCarregarSituacoesLogistica );
   tem_permissao_especial_logistica := DM.UsuarioLogado.TemPermissao( 0, 'Academico.CadastroAulasLogistica', npEspecial, false );

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

      cbAddItem.AddItem(
         qyCarregarSituacoesLogistica.FieldByName('ds_valor').AsString,
         TSituacaoLogistica.Create(
            qyCarregarSituacoesLogistica.FieldByName('cd_situacao').AsInteger,
            qyCarregarSituacoesLogistica.FieldByName('cd_auxiliar').AsInteger,
            qyCarregarSituacoesLogistica.FieldByName('ds_valor').AsString
         )
      );

      case qyCarregarSituacoesLogistica.FieldByName('cd_modulo').AsInteger of
         1090: cd_situacao_selecionar := cd_situacao_material_aula;
         1091: cd_situacao_selecionar := cd_situacao_local_aula;
         1092: cd_situacao_selecionar := cd_situacao_geren_professor;
         1093: cd_situacao_selecionar := cd_situacao_transporte;
         1094: cd_situacao_selecionar := cd_situacao_hospedagem;
         1095: cd_situacao_selecionar := cd_situacao_geren_gestor;
      end;

      if ( cd_situacao_selecionar <> -999 ) AND
         ( qyCarregarSituacoesLogistica.FieldByName('cd_situacao').AsInteger = cd_situacao_selecionar ) then
      begin
         cbAddItem.ItemIndex := cbAddItem.Items.Count-1;

         if cbAddItem.Enabled then
            cbAddItem.Enabled := tem_permissao_especial_logistica OR
                                 (qyCarregarSituacoesLogistica.FieldByName('cd_auxiliar').AsInteger = 0);
      end;

      qyCarregarSituacoesLogistica.Next;
   end;

   FreeAndNil(qyCarregarSituacoesLogistica);
end;

procedure TfrmAulasProvasAcoes.CarregaSituacoesAula;
begin
   if not qrySituacoes.Active then
      qrySituacoes.Open;

   cbSituacaoAula.Items.BeginUpdate;
   cbSituacaoAula.Clear;
   cbSituacaoAula.AddItem('', nil);

   qrySituacoes.First;
   while not qrySituacoes.Eof do
   begin
      cbSituacaoAula.AddItem(qrySituacoesDS_VALOR.AsString, qrySituacoes.GetBookmark);
      qrySituacoes.Next;
   end;

   cbSituacaoAula.Items.EndUpdate;
end;

procedure TfrmAulasProvasAcoes.carregaTipoDigitacao;
const
   SQL_BUSCA_TIPO_DIGITACAO =
      ' SELECT '+
      '   ap.sn_conceitos_parciais, '+
      '   ap.sn_notas '+
      ' FROM '+
      '   turmas t '+
      ' INNER JOIN grades_disciplinas gd ON ( '+
	   '    gd.cd_curso = t.curso AND '+
	   '    gd.nr_serie = t.serie AND '+
	   '    gd.cd_grade = t.cd_grade '+
      ' ) '+
      ' INNER JOIN avaliacoes_parametros ap ON ( '+
      '    ap.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao) '+
      ' ) '+
      ' WHERE '+
      '   t.anosemestre = :nr_anosemestre '+
      '   AND t.curso = :curso '+
      '   AND t.codigo = :turma ';
var
   qyBuscaTipoDigitacao: TUMZReadOnlyQuery;
   
   tipoConceitual,
   tipoNumerico,
   tipoUnico: Boolean;
begin
   if not(isValidaBuscaTipoDigitacao) then
   begin
      Exit;
   end;

   lbTipoDigitacao.Enabled := ckbCriaProvaUltimaAula.Checked;
   cbTipoDigitacao.Enabled := ckbCriaProvaUltimaAula.Checked;

   if AcaoIncluirCampos = Editar then
   begin
            
   end;

   DM.CriarConsulta(qyBuscaTipoDigitacao);

   qyBuscaTipoDigitacao.SQL.Text := SQL_BUSCA_TIPO_DIGITACAO;

   qyBuscaTipoDigitacao.ParamByName('turma').AsString :=
      txtCronogramaTurma.Text;
   qyBuscaTipoDigitacao.ParamByName('curso').AsString :=
      txtCronogramasCurso.Text;
   qyBuscaTipoDigitacao.ParamByName('nr_anosemestre').AsString :=
      sPAnoSem;

   if cbDisciplinas.ItemIndex > -1 then
   begin
      qyBuscaTipoDigitacao.SQL.Add(' AND gd.cd_disciplina = :cd_disciplina ');

      qyBuscaTipoDigitacao.ParamByName('cd_disciplina').AsInteger :=
         StrToInt(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo);
   end;

   qyBuscaTipoDigitacao.Open;

   cbTipoDigitacao.Items.Clear;

   tipoConceitual := False;
   tipoNumerico   := False;
   tipoUnico      := False;

   while not qyBuscaTipoDigitacao.Eof do
   begin
      if qyBuscaTipoDigitacao.FieldByName('sn_conceitos_parciais').AsString = 'S' then
      begin
         tipoConceitual := True;
      end;

      if qyBuscaTipoDigitacao.FieldByName('sn_notas').AsString = 'S' then
      begin
         tipoNumerico := True;
      end;

      qyBuscaTipoDigitacao.Next;
   end;

   tipoUnico :=   (tipoConceitual and not(tipoNumerico)) or
                  (tipoNumerico and not(tipoConceitual));

   if tipoConceitual then
   begin
      cbTipoDigitacao.Items.AddObject(
         'Conceitual',
         TItemCombo.Create('1', '')
      );
   end;

   if tipoNumerico then
   begin
      cbTipoDigitacao.Items.AddObject(
         'Numérico',
         TItemCombo.Create('2', '')
      );
   end;

   if tipoUnico then
   begin
      cbTipoDigitacao.ItemIndex := 0;
      exit;
   end;

   //Caso use tanto numerico quanto conceitual e já tenha prova criada precisa encontrar o tipo na tabela
   if (cbDisciplinas.ItemIndex > -1)
      AND (tipoNumerico)
      AND tipoConceitual
      AND (temProvaCriada(
         txtCronogramaTurma.Text,
         StrToInt(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo),
         StrToInt(sPAnoSem),
         StrToInt(edBimestre.Text),
         sPGrupo))
   then
   begin
      //Posição é o valor retornado menos 1
      cbTipoDigitacao.ItemIndex := getTipoDigitacaoProvaCriada(
         txtCronogramaTurma.Text,
         StrToInt(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo),
         StrToInt(sPAnoSem),
         StrToInt(edBimestre.Text),
         sPGrupo
      ) - 1;
   end;
   
end;

procedure TfrmAulasProvasAcoes.carregaTiposAulas(isPorTurma: Boolean; cd_aula_tipo: Integer);
const
   SQL_CARREGA_PARAMETROS_AVALIACAO =
      ' SELECT '+
		' 	 avl.cd_avaliacao '+
		' FROM '+
		'   turmas t '+
      '	 INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade) '+
	   '   INNER JOIN avaliacoes_parametros avl ON (avl.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) '+
		' WHERE '+
		'   [$condicoes$] '+
		'   AND t.anosemestre = :anosemestre '+
		'   AND t.cd_coligada IN(:coligadas) '+
      ' GROUP BY '+
	   '   avl.cd_avaliacao ';

   SQL_AULAS_TIPOS =
      ' SELECT '+
      '     ati.cd_aula_tipo, '+
      '     atp.sn_padrao, '+
      '     ati.ds_aula_tipo '+
      '  FROM '+
      '     aulas_tipos_parametros atp '+
      '  INNER JOIN aulas_tipos ati ON ( '+
      '     ati.cd_aula_tipo = atp.cd_aula_tipo '+
      '  ) '+
      '  WHERE '+
      '     atp.cd_avaliacao = :cd_avaliacao ';

var
   qyTipoAulas,
   qyParametrosAvaliacao        : TUMZQuery;

   sSqlParametros,
   sSqlQtdParametros,
   sParametros,
   sCondicoes,
   separador: String;

   objItem: TItemCombo;

   idxCombo,
   idxConfigurado: Integer;
begin
   DM.CriarConsulta(qyParametrosAvaliacao);
   DM.CriarConsulta(qyTipoAulas);

   // Prepara SQL que busca informações dos parametros de avaliação das turmas do curso selecionado
   qyParametrosAvaliacao.SQL.Text := SQL_CARREGA_PARAMETROS_AVALIACAO;

   // Carrega os parametros de avaliação por CURSO
   sCondicoes := ' t.curso LIKE ' + QuotedStr(txtCurso.Text);

   // Carrega os parametros de avaliação por CURSO/TURMA - se tiver filtrado
   if sPTurma <> '' then
   begin
      sCondicoes := sCondicoes + ' AND t.codigo LIKE '+QuotedStr(sPTurma);
   end;

   // Carrega os parametros de avaliação por CURSO/DISCIPLINA ou CURSO/TURMA/DISCIPLINA - se tiver filtrado
   if (sPDisciplina <> '') then
   begin
      sCondicoes := sCondicoes + ' AND gd.cd_disciplina LIKE '+QuotedStr(sPDisciplina);
   end;
   
   qyParametrosAvaliacao.ParamByName('anosemestre').AsString := sPAnoSem;
   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    '[$condicoes$]',
                                                    sCondicoes,
                                                    [rfReplaceAll, rfIgnoreCase] );
   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    ':coligadas',
                                                    dm.GetColigadas,
                                                    [rfReplaceAll, rfIgnoreCase] );


   // SQL que busca os parametros de avaliação das turmas
   sSqlParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                    ':campos',
                                    'DISTINCT avl.cd_avaliacao',
                                    [rfReplaceAll, rfIgnoreCase] );

   // SQL que busca os a quantidade de parametros de avalição das turmas
   sSqlQtdParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                       ':campos',
                                       'COUNT(DISTINCT avl.cd_avaliacao) qtd_parametros',
                                       [rfReplaceAll, rfIgnoreCase] );

   // Executa SQL que busca os parametros de avaliação das turmas
   qyParametrosAvaliacao.SQL.Text := sSqlParametros;
   qyParametrosAvaliacao.Open();

   if isPorTurma then
   begin
      cbTipoAula.Items.Clear;      
   end;

   if qyParametrosAvaliacao.RecordCount > 0 then
   begin
      cbTipoAula.Items.Clear;

      idxCombo := -1;
      idxConfigurado := -1;

      qyTipoAulas.SQL.Text := SQL_AULAS_TIPOS;
      qyTipoAulas.ParamByName('cd_avaliacao').AsInteger :=
         qyParametrosAvaliacao.FieldByName('cd_avaliacao').AsInteger;
      qyTipoAulas.Open;

      while not qyTipoAulas.Eof do
      begin
         cbTipoAula.Items.AddObject(
            qyTipoAulas.FieldByName('ds_aula_tipo').AsString,
            TItemCombo.Create(
               qyTipoAulas.FieldByName('cd_aula_tipo').AsString,
               qyTipoAulas.FieldByName('ds_aula_tipo').AsString
            )
         );

         if qyTipoAulas.FieldByName('sn_padrao').AsInteger = 1 then
         begin
            idxCombo := qyTipoAulas.RecNo - 1;
         end;

         if qyTipoAulas.FieldByName('cd_aula_tipo').AsInteger = cd_aula_tipo then
         begin
            idxConfigurado := qyTipoAulas.RecNo - 1;
         end;

         qyTipoAulas.Next;
      end;

      if idxConfigurado <> -1 then
      begin
         cbTipoAula.ItemIndex := idxConfigurado;
         exit;
      end;
      
      cbTipoAula.ItemIndex := idxCombo;
   end;
end;

procedure TfrmAulasProvasAcoes.CarregaTiposProva();

   procedure LimpaCombo;
   var
      i: integer;
   begin
      for i := 1 to Self.cbTiposProvas.Items.Count - 1 do
         TTipoProva(Self.cbTiposProvas.Items.Objects[i]).Free;
   end;

begin
   // Limpa a combo de tipos de prova
   LimpaCombo;
   cbTiposProvas.Clear;

   { Insere os tipos de provas na combobox para
     apresentação ao usuário na interface }
   addTiposProvaCombo();

   { Verifica se o tipo foi encontrado,
     Caso não tenha sido encontrado então verifica dentro da procedure
     é um tipo não local (de outro módulo).
     Nesse caso adiciona o tipo no select }
   VerificaTipoEncontrado();

   { Atualiza o checkbox de 'bloquear prova',
     porque para cada tipo selecionado o valor desse checkbox
     pode muadar }
   AtualizarBloquearProva();
   
end;


procedure TfrmAulasProvasAcoes.addTiposProvaCombo();
const

   SQL_TIPO_PROVA =
      ' SELECT cd_tipo ' +
      ' FROM ' +
      '   avaliacoes_tipos ' +
      ' WHERE ' +
      '   cd_avaliacao_tipo = :cd_avaliacao_tipo';

   SQL_CARREGA_PARAMETROS_AVALIACAO =
      ' SELECT '+
		' 	 :campos '+
		' FROM '+
		'   turmas t '+
      '	 INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade) '+
	   '   INNER JOIN avaliacoes_parametros avl ON (avl.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) '+
		' WHERE '+
		'   [$condicoes$] '+
		'   AND t.anosemestre = :anosemestre '+
		'   AND t.cd_coligada IN(:coligadas) ';

   SQL_CARREGA_TIPO_PROVA =
      ' SELECT DISTINCT '+
      '   avt.cd_avaliacao_tipo, '+
      '   avt.ds_avaliacao '+
      ' FROM ' +
      '   avaliacoes_tipos_parametros avtp '+
      '   INNER JOIN avaliacoes_tipos avt ON ( '+
      '      avt.cd_avaliacao_tipo = avtp.cd_avaliacao_tipo '+
      '   ) ' +
      ' WHERE ' +
      '   avtp.cd_avaliacao IN (:cd_avaliacoes) AND '+
      '   avt.sn_diario_local LIKE "S" ' +
      '   [$condicoes$] ' +      
      ' GROUP BY '+
	   '   avtp.cd_avaliacao_tipo '+
      ' HAVING '+
	   '   COUNT(avtp.cd_avaliacao_tipo) = :qtd_parametros_avaliacao ' +
      ' ORDER BY ' +
      '   avt.ds_avaliacao ';
var
   qyTipoProva                  : TUMZQuery;
   qyParametrosAvaliacao        : TUMZQuery;
   qyCarregaTipoProva           : TUMZQuery;
   sSqlParametros, sSqlQtdParametros : string;
   sParametros, sCondicoes, separador : String;
   qtdParametros, cd_tipo : Integer;
begin

   DM.CriarConsulta(qyTipoProva);
   DM.CriarConsulta(qyParametrosAvaliacao);
   DM.CriarConsulta(qyCarregaTipoProva);

   // Prepara SQL que busca informações dos parametros de avaliação das turmas do curso selecionado
   qyParametrosAvaliacao.SQL.Text := SQL_CARREGA_PARAMETROS_AVALIACAO;

   // Carrega os parametros de avaliação por CURSO
   sCondicoes := ' t.curso LIKE '+QuotedStr(txtPCurso.Text);

   // Carrega os parametros de avaliação por CURSO/TURMA - se tiver filtrado
   if sPTurma <> '' then begin
      sCondicoes := sCondicoes + ' AND t.codigo LIKE '+QuotedStr(sPTurma);
   end;

   // Carrega os parametros de avaliação por CURSO/DISCIPLINA ou CURSO/TURMA/DISCIPLINA - se tiver filtrado
   if sPDisciplina <> '' then begin
      sCondicoes := sCondicoes + ' AND gd.cd_disciplina LIKE '+QuotedStr(sPDisciplina);
   end;
   
   qyParametrosAvaliacao.ParamByName('anosemestre').AsString := sPAnoSem;
   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    '[$condicoes$]',
                                                    sCondicoes,
                                                    [rfReplaceAll, rfIgnoreCase] );
   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    ':coligadas',
                                                    dm.GetColigadas,
                                                    [rfReplaceAll, rfIgnoreCase] );


   // SQL que busca os parametros de avaliação das turmas
   sSqlParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                    ':campos',
                                    'DISTINCT avl.cd_avaliacao',
                                    [rfReplaceAll, rfIgnoreCase] );

   // SQL que busca os a quantidade de parametros de avalição das turmas
   sSqlQtdParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                       ':campos',
                                       'COUNT(DISTINCT avl.cd_avaliacao) qtd_parametros',
                                       [rfReplaceAll, rfIgnoreCase] );

   // Executa SQL que busca os parametros de avaliação das turmas
   qyParametrosAvaliacao.SQL.Text := sSqlParametros;
   qyParametrosAvaliacao.Open();

   sParametros := '';
   separador := '';
   while not qyParametrosAvaliacao.EOF do begin
      sParametros := sParametros + separador + qyParametrosAvaliacao.FieldByName('cd_avaliacao').AsString;
      separador := ',';
      qyParametrosAvaliacao.Next();
   end;
   // Trata para que se não houver nenhum parametro jogue -1 no filtro IN para não gerar erro de SQL
   if sParametros = '' then begin
      sParametros := '-1';
   end;

   // Executa SQL que busca a quantidade de parametros de avaliação das turmas
   qyParametrosAvaliacao.SQL.Text := sSqlQtdParametros;
   qyParametrosAvaliacao.Open();
   qtdParametros := qyParametrosAvaliacao.FieldByName('qtd_parametros').AsInteger;

   // Carrega os Tipos de Avaliação para o curso selecionado
   qyCarregaTipoProva.SQL.Text := SQL_CARREGA_TIPO_PROVA;
   qyCarregaTipoProva.ParamByName('qtd_parametros_avaliacao').AsInteger := qtdParametros;
   qyCarregaTipoProva.SQL.Text := StringReplace( qyCarregaTipoProva.SQL.Text,
                                                 ':cd_avaliacoes',
                                                 sParametros, [rfReplaceAll, rfIgnoreCase] );


   { Verifica se o usuário está EDITANDO a prova,
     nesse caso busca o tipo da prova porque se o tipo de prova
     for CNS ou NCNS, somente se permite alterar entre esses tipos,
     os demais tipos não se permite alteração, então ajusta o SQL para trazer somente esses tipos }
   if not bInsere then begin
      if Self.TipoProva <> nil then begin
         qyTipoProva.SQL.Text := SQL_TIPO_PROVA;
         qyTipoProva.ParamByName('cd_avaliacao_tipo').AsInteger := Self.TipoProva.Codigo;

         qyTipoProva.Open;

         cd_tipo := qyTipoProva.FieldByName('cd_tipo').AsInteger;

         if cd_tipo in [1, 2] then begin
            qyCarregaTipoProva.SQL.Text := StringReplace(qyCarregaTipoProva.SQL.Text, '[$condicoes$]', 'AND avt.cd_tipo IN (1, 2)', []);
         end else begin
            qyCarregaTipoProva.SQL.Text := StringReplace(qyCarregaTipoProva.SQL.Text, '[$condicoes$]', 'AND avt.cd_tipo = '+IntToStr(cd_tipo), []);
         end;
      end else begin
         qyCarregaTipoProva.SQL.Text := StringReplace(qyCarregaTipoProva.SQL.Text, '[$condicoes$]', '', []);
      end;
   end else begin
      qyCarregaTipoProva.SQL.Text := StringReplace(qyCarregaTipoProva.SQL.Text, '[$condicoes$]', '', []);
   end;


   // Monta a combo de tipos de provas para o curso selecionado
   qyCarregaTipoProva.Open();
   while not qyCarregaTipoProva.Eof do begin
      cbTiposProvas.AddItem( qyCarregaTipoProva.FieldByName('ds_avaliacao').AsString,
                             TTipoProva.Create(qyCarregaTipoProva.FieldByName('cd_avaliacao_tipo').AsInteger,
                                               qyCarregaTipoProva.FieldByName('ds_avaliacao').AsString) );
      qyCarregaTipoProva.Next();
   end;

   FreeAndNil(qyParametrosAvaliacao);
   FreeAndNil(qyCarregaTipoProva);

end;

procedure TfrmAulasProvasAcoes.VerificaTipoEncontrado();
var
   i, j: Integer;
   bAchou: Boolean;

begin
   // Seta posição inicial da combobox
   if (cbTiposProvas.Items.Count > 0) then
      cbTiposProvas.ItemIndex := 0;   

   // Inicia as variáveis
   bAchou := false;
   j := 0;

   if Assigned(Self.TipoProva) AND (Self.TipoProva <> nil) then
   begin
      for i := 0 to Self.cbTiposProvas.Items.Count - 1 do
      begin
         { Para cada tipo de avaliação da turma(s) selecionada(s) presente
           na combobox, verifica se é igual ao tipo da prova que está sendo editada }
         if TTipoProva(Self.cbTiposProvas.Items.Objects[i]).Nome = Self.TipoProva.Nome then
         begin
            j := i;
            bAchou := true;
            Break;
         end;
      end;
      { Caso não tenha encontrado, é um tipo de outro módulo,
         então adiciona ele na combobox }
      if not bAchou then begin
         j := Self.cbTiposProvas.Items.AddObject(Self.TipoProva.Nome, Self.TipoProva);
         { Caso seja um tipo de outro módulo,
           bloqueia a alteração desse tipo, só pode ser alterados tipos pertencentes a esse módulo }
         Self.cbTiposProvas.Enabled := False;
      end;
   end;
   Self.cbTiposProvas.ItemIndex := j;

end;

procedure TfrmAulasProvasAcoes.AtualizarBloquearProva();
var
   cd_avaliacao, snBloqueada: String;
   arrCdAvaliacao: TStringList;
   cd_avaliacao_tipo, cd_tipo: Integer;
begin
   if bInsere then begin
      try
         if bUsaListaTurmas then
            cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sListaTurmas, sPDisciplina, 'cd_avaliacao', True)
         else
            cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), sPTurma, sPDisciplina, 'cd_avaliacao');
      except on E: Exception do
      end;

      if length(cd_avaliacao) = 0 then
      begin
         MessageBox(Handle, 'A turma/disciplina não possui parâmetro de avaliação vinculado.', 'Atenção', MB_ICONEXCLAMATION or MB_OK);
         exit;
      end;


      arrCdAvaliacao := TStringList.Create();

      arrCdAvaliacao.delimiter := ',';
      arrCdAvaliacao.DelimitedText := cd_avaliacao;

      if cbTiposProvas.Items.Count > 0 then
      begin
         cd_avaliacao_tipo := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;
         try
            cd_tipo := StrToInt( GetInfProvaTipo(arrCdAvaliacao.Strings[0], cd_avaliacao_tipo, 'cd_tipo') );
         except
            cd_tipo := 0;
         end;
      end;

      snBloqueada := GetInfProvaTipo(cd_avaliacao, cd_avaliacao_tipo, 'sn_bloqueada');

      if snBloqueada = '1' then begin
         ckbBloqueiaProva.State := cbChecked;
      end else if snBloqueada = '0' then begin
         ckbBloqueiaProva.State := cbUnchecked;
      end else begin
         ckbBloqueiaProva.State := cbGrayed;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.txtChaveExit(Sender: TObject);
begin
   Self.cbResponsavel.Enabled := false;
   Self.spLimpaResp.Enabled := false;
   if (txtChave.Text <> '') then
   begin
      Self.cbResponsavel.Enabled := (not (sPGrupo > 0)) AND (bInsere);
      Self.spLimpaResp.Enabled   := (not (sPGrupo > 0)) AND (bInsere);
   end;
end;

procedure TfrmAulasProvasAcoes.txtChaveKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #32) then
      Key := #0;
end;

procedure TfrmAulasProvasAcoes.txtPNotaMaximaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if(Key in[#44, #46])then
      if (Pos(',', txtPNotaMaxima.Text) > 0)then
         Key := #0
      else
         Key := #44;
end;

procedure TfrmAulasProvasAcoes.txtPNotaMinimaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if(Key in[#44, #46])then
      if (Pos(',', txtPNotaMinima.Text) > 0)then
         Key := #0
      else
         Key := #44;
end;

procedure TfrmAulasProvasAcoes.txtEditFiltroProvaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('Disciplina', TEDit(Sender).Name) > 0) then begin
         sPDisciplina := '';
         sPGrupo := 0;
         edGrupoProvas.Text := '';
         txtPProf.Text := '';
         Self.bloqueiaCamposGrupoSelecionado();
      end
      else if (Pos('Turma', TEDit(Sender).Name) > 0) then begin
         sPTurma := '';
         sPDisciplina := '';
         sPGrupo := 0;
         txtPDisciplina.Text := '';
         edGrupoProvas.Text := '';
         txtPProf.Text := '';
         Self.bloqueiaCamposGrupoSelecionado();
      end
      else if (Pos('Grupo', TEDit(Sender).Name) > 0) then begin
         sPGrupo := 0;
         edGrupoProvas.Text := '';
         txtPProf.Text := '';
         Self.bloqueiaCamposGrupoSelecionado();
      end;
   end;

   if Length( trim( sPTurma ) ) = 0 then begin
      setListaTurmas(true, txtPCurso.Text, StrToInt(sPAnoSem));
   end else begin
      setListaTurmas(false, txtPCurso.Text, StrToInt(sPAnoSem));
   end;
   CarregaTiposProva();
   ListaProvaTurmasDisciplinas();
end;

function TfrmAulasProvasAcoes.verificaExcluirVinculoAvlDisc(cd_turma: string;
  cd_disciplina, cd_avaliacao: Integer): Boolean;
var
 qryVerificaResposta: TUMZQuery;
begin
   result:= True;

   DM.CriarConsulta(qryVerificaResposta);
   qryVerificaResposta.SQL.Clear;

   qryVerificaResposta.SQL.Add(
   ' SELECT '
   + '    COUNT(DISTINCT ap.cd_pessoa) tem_respostas '
   + ' FROM avl_resolucao_prazo arp '
   + ' INNER JOIN avl_pesquisados_grupos apg ON (arp.cd_avaliacao = apg.cd_avaliacao) '
   + ' INNER JOIN avl_avaliacoes aa ON (arp.cd_avaliacao = aa.cd_avaliacao) '
   + ' INNER JOIN avl_pesquisados ap ON (apg.cd_grupo = ap.cd_grupo) '
   + ' INNER JOIN avl_pesquisado_respostas aprr ON (aprr.cd_pesquisado = ap.cd_pesquisado)  '
   + ' INNER JOIN turmasprofessores tp ON ( '
   + '    tp.cd_turmaprofessor = aprr.cd_chave AND '
   + '    tp.anosemestre = arp.nr_anosemestre AND '
   + '    tp.turma = arp.cd_turma AND '
   + '    tp.disciplina = arp.cd_disciplina ) '
   + ' INNER JOIN fichaindividual f ON ( '
   + '     f.turma = arp.cd_turma AND '
   + '     f.disciplina = arp.cd_disciplina AND '
   + '     f.anosemestre = arp.nr_anosemestre AND '
   + '     f.codigoaluno = ap.cd_pessoa ) '
   + ' WHERE '
   + '  arp.cd_turma = :cd_turma '
   + '  AND arp.cd_disciplina = :cd_disciplina '
   + '  AND arp.cd_avaliacao = :cd_avaliacao '
   + '  AND aa.cd_tipo_avaliacao = 2 '
   + '  AND ap.cd_situ_respondeu IN ((SELECT aps.cd_situ_respondeu FROM avl_pesquisados_situacoes aps)) ');

   qryVerificaResposta.ParamByName('cd_turma').AsString := cd_turma;
   qryVerificaResposta.ParamByName('cd_disciplina').AsString := IntToStr(cd_disciplina);
   qryVerificaResposta.ParamByName('cd_avaliacao').AsInteger := cd_avaliacao;
   qryVerificaResposta.Open();

   if (qryVerificaResposta.FieldByName('tem_respostas').AsInteger > 0) then
     result:= False;

   qryVerificaResposta.Close();
   FreeAndNil(qryVerificaResposta);
end;

procedure TfrmAulasProvasAcoes.verificarTrocaProfessor(codAntigo: Integer);
var
   disciplina : String;
begin

   if (Length(sPAnoSem) = 0) or (Length(sPCurso) = 0) or (Length(sPTurma) = 0) then Exit;

   if (Length(txtCronogramasProfessor.Text) > 0) then
   begin

      if cbDisciplinas.ItemIndex <> -1 then
      begin
         disciplina := TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo;
      end else begin
         disciplina := '0';
      end;

      // Verifica se possui algum professor que já estava atribuido a turma/disciplina
      qyProfessorAntigo.Close;
      qyProfessorAntigo.ParamByName('nr_anosemestre').AsInteger := StrToInt(sPAnoSem);
      qyProfessorAntigo.ParamByName('cd_curso').AsString := sPCurso;
      qyProfessorAntigo.ParamByName('cd_turma').AsString := sPTurma;
      qyProfessorAntigo.ParamByName('cd_disciplina').AsInteger := StrToInt(disciplina);
      qyProfessorAntigo.Open;

      qyProfessorAntigo.Locate('cd_pessoa', codAntigo, []);

      // Verifica se houve a troca de professor da turma/disciplina
      if (qyProfessorAntigo.RecordCount = 1) and
         (qyProfessorAntigo.FieldByName('cd_pessoa').AsString <> txtCronogramasProfessor.Text) then
      begin
         umAjudaTrocaProfessor.Caption := 'A turma/disciplina selecionada possui um professor diferente do selecionado.'+#13+
                                          'Quando salvar o cronograma será questionado sobre quais informações serão '+#13+
                                          'repassadas para esse professor.';

         umAjudaTrocaProfessor.Visible := True;
      end else begin
         umAjudaTrocaProfessor.Visible := False;
      end;

   end else begin
      umAjudaTrocaProfessor.Visible := False;
   end;

end;

procedure TfrmAulasProvasAcoes.txtCronogramaTurmaChange(Sender: TObject);
begin
   sCronogramaTurma := txtCronogramaTurma.Text;
   sPTurma := sCronogramaTurma;
   RecarregaDatasDiario();   
   if ( sCronogramaTurma <> '' ) then
   begin
      FiltrarDisciplinas();
   end else begin
      cbDisciplinas.Items.Clear;
      cbDisciplinas.Enabled := false;
   end;

   ProcessarConflitosHorariosCronograma();
end;

procedure TfrmAulasProvasAcoes.txtTurmaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_DELETE then begin
      TEdit(Sender).Text := '';
      if (Pos('Disciplina', TEDit(Sender).Name) > 0) then begin
         sPDisciplina := '';
         sPGrupo := 0;
         edGrupoAulas.Text := '';
         txtAProf.Text := '';
         Self.bloqueiaCamposGrupoSelecionado();
      end
      else if (Pos('Turma', TEDit(Sender).Name) > 0) then begin
         sPTurma := '';
         sPDisciplina := '';
         sPGrupo := 0;
         txtDisciplina.Text := '';
         edGrupoAulas.Text := '';
         txtAProf.Text := '';
         Self.bloqueiaCamposGrupoSelecionado();
      end
      else if (Pos('Grupo', TEDit(Sender).Name) > 0) then begin
         sPGrupo := 0;
         edGrupoAulas.Text := '';
         txtAProf.Text := '';
         Self.bloqueiaCamposGrupoSelecionado();
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.statusSerie(bStatus: Boolean);
begin

    Label35.Visible  := bStatus;

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

    end;

    ckbPSerie.Visible   := bStatus;
    txtPSerie.Visible   := bStatus;
    udPSerie.Visible    := bStatus;

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

      qyAux.ParamByName('curso').AsString:= txtPCurso.Text;
      qyAux.ParamByName('anosem').AsString:= sPAnoSem;
      qyAux.Open();

      if not (qyAux.FieldByName('nome_etapa').IsNull and (trim(qyAux.FieldByName('nome_etapa').AsString) = '')) then begin
         ckbPSerie.Caption:= qyAux.FieldByName('nome_etapa').AsString+';';
      end else
         ckbPSerie.Caption:= 'Etapa:';
    end;
end;

function TfrmAulasProvasAcoes.TemConflitosSala: Boolean;
const
   MSG_TEM_CONFLITO =
      'A sala selecionada juntamento com os horários selecionados, ' +
      'estão gerando conflitos com outras Turmas/Horários em datas específicas.' + #13 + #13 +
      'Deseja continuar mesmo assim?';
var
   IAula: Integer;
   umAjudaAula: TUMAjuda;
begin
   Result := False;

   for IAula := 1 to StrToInt(edQtdAulas.Text) do
   begin
      umAjudaAula := nil;
      if IAula > 2 then
         umAjudaAula := TUMAjuda(sbAulas.FindComponent('umAjudaAula' + IntToStr(IAula)))
      else
         umAjudaAula := TUMAjuda(Self.FindComponent('umAjudaAula' + IntToStr(IAula)));

      if (umAjudaAula <> nil) AND umAjudaAula.Visible then
      begin
         Result := True;
         Break;
      end;
   end;

   if Result AND
      (Mensagem(MSG_TEM_CONFLITO, '', MB_YESNO + MB_ICONEXCLAMATION, Handle) = mrYes) then
   begin
      Result := False;
   end;
end;

function TfrmAulasProvasAcoes.TrataPrazoCalculado(sql: String; const nr_anosemestre: Integer; const cd_turma: String;
  const cd_disciplina: Integer; tipo: TiposPrazos; isUpdate: Boolean): String;

   function CalculaData( valor_parametro: String ): String;
   const
      SQL_BUSCA_AULA =
         ' SELECT DATE_FORMAT( data, ''%Y-%m-%d'' ) AS dt_aula FROM diario_aulas ' +
         ' WHERE anosemestre = :nr_anosemestre AND turma = :cd_turma AND ' +
         '       disciplina = :cd_disciplina AND bimestre = 1 ';
      SQL_FILTRO_PRIMEIRA_AULA =
         ' ORDER BY data ';
      SQL_FILTRO_ULTIMA_AULA =
         ' ORDER BY data DESC ';
   var
      hasSomaSubtracao: Boolean;
      chave_altera, chave_valor, valor_horario: String;
      qyBuscaAula : TUMZReadOnlyQuery;
   begin
      DM.CriarConsulta(qyBuscaAula);

      hasSomaSubtracao := AnsiContainsText( valor_parametro, '+' ) OR
                          AnsiContainsText( valor_parametro, '-' );

      Result := 'NULL';
      valor_horario := '';

      if ( not AnsiContainsText( valor_parametro, 'DATA_ATUAL' ) ) then
      begin
         qyBuscaAula.SQL.Text := SQL_BUSCA_AULA;

         if AnsiContainsText( valor_parametro, 'PRIMEIRA_AULA' ) then
         begin
            qyBuscaAula.SQL.Add( SQL_FILTRO_PRIMEIRA_AULA );
            chave_altera := 'PRIMEIRA_AULA';
            valor_horario := '';
         end else if ( AnsiContainsText( valor_parametro, 'ULTIMA_AULA' ) ) then
         begin
            qyBuscaAula.SQL.Add( SQL_FILTRO_ULTIMA_AULA );
            chave_altera := 'ULTIMA_AULA';
            // Adiciona o horário apenas para datas Finais DT_FIM_ETAPA, DT_FIM_FREQUENCIA e DT_FIM_NOTAS
            if AnsiContainsText( valor_parametro, 'ULTIMA_AULA +' ) then
            begin
               valor_horario := ' 23:59:59';
            end;
         end else begin
            { Sai da função retornando o valor NULL, lembrando de dar nil na query }
            FreeAndNil( qyBuscaAula );
            Exit;
         end;
         qyBuscaAula.ParamByName('nr_anosemestre').AsInteger   := nr_anosemestre;
         qyBuscaAula.ParamByName('cd_turma').AsString          := cd_turma;
         qyBuscaAula.ParamByName('cd_disciplina').AsInteger    := cd_disciplina;
         qyBuscaAula.Open();

         chave_valor := qyBuscaAula.FieldByName('dt_aula').AsString;      

         FreeAndNil( qyBuscaAula );
      end else begin
         chave_altera := 'DATA_ATUAL';
         chave_valor := 'CURDATE()';
      end;

      if trim(chave_valor) = '' then
         Result := 'NULL'
      else begin
         if ( hasSomaSubtracao ) then
         begin
            chave_valor := '"' + chave_valor + valor_horario + '"';
            Result := StringReplace(
               valor_parametro,
               chave_altera,
               'ADDDATE( ' + chave_valor + ', INTERVAL ', [rfIgnoreCase]
            ) + ' DAY )';
         end else begin
            Result := chave_valor;
         end;
      end;
   end;

const
   NivelAcessoDesc: array [TiposPrazos] of string = (
      'ds_cronograma_visualiza_', 'ds_cronograma_notas_', 'ds_cronograma_aulas_', 'ds_cronograma_liberacao'
   );
var
   avl_param_dt_inicio, avl_param_dt_fim, valor_inicio, valor_fim: String;
   ConfiguracaoData: TFormatSettings;
begin
   valor_inicio := 'NULL';
   valor_fim := 'NULL';

   // Define a configuração de data
   GetLocaleFormatSettings(GetUserDefaultLCID, ConfiguracaoData);
   ConfiguracaoData.DateSeparator := '-';
   ConfiguracaoData.TimeSeparator := ':';
   ConfiguracaoData.ShortDateFormat := 'yyyy-mm-dd';
   ConfiguracaoData.ShortTimeFormat := 'hh:nn:ss';

   if ( tipo <> tpLiberacao ) then
   begin
      avl_param_dt_inicio := UpperCase(ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma,
                                                                   IntToStr(cd_disciplina), NivelAcessoDesc[tipo] + 'inicio'));

      avl_param_dt_fim := UpperCase(ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma,
                                                                   IntToStr(cd_disciplina), NivelAcessoDesc[tipo] + 'fim'));

      if ( TRIM( avl_param_dt_inicio ) <> '' ) AND ( TRIM( avl_param_dt_fim ) <> '' ) then
      begin
         valor_inicio := CalculaData( avl_param_dt_inicio );
         valor_fim := CalculaData( avl_param_dt_fim );

      end
      else
      if umdtInicioDiario.Visible and umdtFimDiario.Visible then
      begin
         // Pega data dos campos preenchidos
         valor_inicio := QuotedStr(DateToStr(umdtInicioDiario.Date, ConfiguracaoData));
         valor_fim := DateToStr(umdtFimDiario.Date, ConfiguracaoData);
      end;

      if((NivelAcessoDesc[tipo] = 'ds_cronograma_visualiza_') and (alterouDtInicio)) then
      begin
         valor_inicio := FormatDateTime('yyyy-mm-dd', umdtInicioDiario.Date);
         sql := StringReplace( sql, '{' + NivelAcessoDesc[tipo] + 'inicio}', QuotedStr(valor_inicio), [rfIgnoreCase] );
      end
      else
      begin
         sql := StringReplace( sql, '{' + NivelAcessoDesc[tipo] + 'inicio}', valor_inicio, [rfIgnoreCase] );
      end;

      if((NivelAcessoDesc[tipo] = 'ds_cronograma_visualiza_') and (alterouDtFim)) then
      begin
         valor_fim := FormatDateTime('yyyy-mm-dd', umdtFimDiario.Date);
         valor_fim := valor_fim + ' 23:59:59';
         sql := StringReplace( sql, '{' + NivelAcessoDesc[tipo] + 'fim}', QuotedStr(valor_fim), [rfIgnoreCase] );      
      end
      else
      begin
         if not AnsiContainsText( valor_fim, 'ADDDATE' ) then
         begin
            valor_fim := QuotedStr( valor_fim + ' 23:59:59' );
         end;

         sql := StringReplace( sql, '{' + NivelAcessoDesc[tipo] + 'fim}', valor_fim, [rfIgnoreCase] );
      end;
   end else begin
      avl_param_dt_inicio := UpperCase(ClasseTurmas.GetParametroAvaliacao(nr_anosemestre, cd_turma,
                                                                   IntToStr(cd_disciplina), NivelAcessoDesc[tipo]));

      if ( TRIM( avl_param_dt_inicio ) <> '' ) then
      begin
         valor_inicio := CalculaData( avl_param_dt_inicio );
      end else if umdtFimDiario.Visible then
      begin
         // Pega data dos campos preenchidos
         valor_inicio := QuotedStr(DateToStr(umdtFimDiario.Date, ConfiguracaoData));
      end;

      sql := StringReplace( sql, '{' + NivelAcessoDesc[tipo] + '}', valor_inicio, [rfIgnoreCase] );
   end;

   Result := sql;   
end;

procedure TfrmAulasProvasAcoes.ListaProvaTurmasDisciplinas();
var
   sFiltros                : string;
   i                       : Integer;
   cd_turma                : string;
   cd_disciplina           : string;
   ds_disciplina           : string;
   cd_professor            : string;
   ds_professor            : string;
   ds_item                 : string;
   grupo_professores       : string;
   item                    : string;
   qyGradeCurricular       : TUMZQuery;
   pPonteiroRegistro       : Pointer;
   bVerificaTodosProf      : Boolean;
   arrCdAvaliacao          : TStringList;
begin
   cd_turma                := '';
   cd_disciplina           := '';
   ds_disciplina           := '';
   cd_professor            := '';
   ds_professor            := '';
   ds_item                 := '';
   grupo_professores       := '';
   bPRepetido              := nil;
   qyGradeCurricular       := nil;
   pPonteiroRegistro       := nil;
   bVerificaTodosProf      := false;

   FreeAndNil( slPTurmaDisc );
   FreeAndNil( slPTurmas );
   FreeAndNil( slPDisciplinas );

   slPTurmas      := TStringList.Create();
   slPDisciplinas := TStringList.Create();
   slPTurmaDisc := TStringList.Create();

   SetLength(bPRepetido, 0);

   DM.CriarConsulta( qyGradeCurricular );

   with qyGradeCurricular do begin
      Close();
      Params.Clear();
      SQL.Clear();
      SQL.Add(''+
      'SELECT                                                                        '+
      '  $item as item,                                                              '+
      '  t.codigo,                                                                   '+
      '  gc.cd_disciplina AS disciplina,                                             '+
      '  tp.professor,                                                               '+
      '  d.descricao ds_disciplina,                                                  '+
      '  p.nm_pessoa                                                                 '+
      'FROM                                                                          '+
      '  grades_disciplinas gc                                                       '+
      '  INNER JOIN turmasprofessores tp ON (gc.cd_curso = tp.curso) AND (gc.cd_disciplina = tp.disciplina)  '+
      '  INNER JOIN turmas t ON (tp.anosemestre = t.anosemestre) AND (gc.cd_curso = t.curso) AND (tp.turma = t.codigo) AND (gc.nr_serie = t.serie) AND (gc.cd_grade = t.cd_grade) '+
      '  INNER JOIN disciplinas d ON (gc.cd_disciplina = d.codigo) AND (gc.cd_curso = d.curso) '+
      '  INNER JOIN pessoas p ON (tp.professor = p.cd_pessoa)                        '+
      '  LEFT  JOIN diario_grupos dg ON (dg.nr_anosemestre = tp.anosemestre AND dg.cd_curso = tp.curso AND dg.cd_turma = tp.turma AND dg.cd_disciplina = tp.disciplina AND dg.cd_professor = tp.professor) ' +
      'WHERE                                                                         '+
      '');

      //Verifica se a conexão é Oracle ou MySQL
      if qyGradeCurricular.Connection.Protocol = 'oracle' then //Oracle
      begin
         item := 't.codigo || '' - '' || d.descricao || '' ('' || p.nm_pessoa || '')'' ';
         qyGradeCurricular.SQL.Text := StringReplace(qyGradeCurricular.SQL.Text, '$item', item, []);
      end else begin
         item := 'CONCAT(t.codigo, '' - '', d.descricao,  '' ('', p.nm_pessoa, '')'')';
         qyGradeCurricular.SQL.Text := StringReplace(qyGradeCurricular.SQL.Text, '$item', item, []);
      end;

      sFiltros := '';

      //filtro curso
      if (Length(txtPCurso.Text) > 0) then
      begin
         SQL.Add( sFiltros );
         SQL.Add('t.curso = ''' + txtPCurso.Text + ''' ');
         sFiltros := ' and ';
      end;
      //filtro curso

      //filtro anosemestre
      if (Length(sPAnoSem) > 0) then
      begin
         SQL.Add( sFiltros );
         SQL.Add('tp.anosemestre = ' + sPAnoSem + ' ');
         sFiltros := ' and ';
      end;
      //filtro anosemestre

      //filtro turma
      if (Length(txtPTurma.Text) > 0) then
      begin
         SQL.Add( sFiltros );
         SQL.Add('t.codigo = ''' + txtPTurma.Text+ ''' ');
         sFiltros := ' and ';
      end;
      //filtro turma

      //filtro disciplina
      if (Length(txtPDisciplina.Text) > 0) then
      begin
         SQL.Add( sFiltros );
         SQL.Add('gc.cd_disciplina = ' + txtPDisciplina.Text+ ' ');
         sFiltros := ' and ';
      end;
      //filtro disciplina

      //filtro grupo
      if (Length(edGrupoProvas.Text) > 0) then
      begin
         SQL.Add( sFiltros );
         SQL.Add('dg.cd_grupo = ' + edGrupoProvas.Text+ ' ');
         sFiltros := ' and ';
      end;
      //filtro grupo

      //filtro serie
      { Comentado, pois este campo não deve ser filtrado,
        ele somente deve ser utilizado na ligação com turmas
      if (ckbPSerie.Checked = True) then
      begin
         SQL.Add( sFiltros );
         SQL.Add('gc.nr_serie = ' + txtPSerie.Text+ ' ');
         sFiltros := ' and ';
      end;}
      //filtro serie

      // Filtro Coligada
      SQL.Add( sFiltros );
      SQL.Add( 't.cd_coligada in (' + DM.GetColigadas+')' );
      sFiltros := ' and ';
      // Filtro Coligada

      //filtro ??
      if ( sFiltros = '' ) then
      begin
         SQL.Add('1 <> 1');
      end;
      //filtro ??

      //ordenação do SQL
      SQL.Add(''+
      'ORDER BY                                                                      '+
      '   t.codigo, d.sigla, p.nm_pessoa                                             '+
      '');
      //ordenação do SQL

      Open();
      
      clbPTD.Clear();

      //Se houver turmas e disciplinas referente o SQL acima faça...
      if not IsEmpty then
      begin
         i                 := 0;

         //Percorre a lista gerada pela consulta até o final
         while not EOF do
         begin

            //Recupera as informações atuais dos campos na base
            cd_turma       := FieldByName( 'codigo' ).AsString;
            cd_disciplina  := FieldByName( 'disciplina' ).AsString;
            ds_disciplina  := FieldByName( 'ds_disciplina' ).AsString;
            cd_professor   := FieldByName( 'professor' ).AsString;
            ds_professor   := FieldByName( 'nm_pessoa' ).AsString;
            ds_item        := FieldByName( 'item' ).AsString;

            //Adiciona um item na lista de auxilio na seleção dos checks
            SetLength(Self.bPRepetido, Length(Self.bPRepetido) + 1);
            Self.bPRepetido[clbPTD.Items.Add( ds_item )] := false;

            //Adiciona os itens em um TStringList Tuma:Disciplina
            slPTurmaDisc.Add( Concat(cd_turma, '[:separadorinterno:]', cd_disciplina) );

            //Adiciona os itens em um TStringList Turma,Professor,Disciplina
            slPTurmas.Add( Concat('''', cd_turma, ''',', cd_professor, ',', cd_disciplina ) );

            //Adiciona os itens em um TStringList Tumas e Disciplinas
            slPDisciplinas.Add( Concat( cd_disciplina, '-', ds_disciplina ) );



            { LÓGICA PARA ADICIONAR A OPÇÃO DE "- Todos os professores" NA
              LISTA DE TURMAS/DISCIPLINAS/PROFESSORES PARA SER SELECIONADA }

            // Concatena os professor em uma string com o nome de todos professores
            if grupo_professores = '' then
            begin
               // Caso for o 1º professor a ser concatenado, retira a vírgula separadora
               grupo_professores := Concat( grupo_professores, ds_professor );
            end else begin
               // Utiliza a vírgula separadora (se NÃO for o 1º professor)
               grupo_professores := Concat( grupo_professores, ', ', ds_professor );
            end;

            // Soma a quantidade de professores
            Inc( i );

            // Grava o registro atual antes de verificar o próximo registro
            pPonteiroRegistro := GetBookmark;

            { Verifica qual a próxima Turma / Disciplina (próximo registro), se for uma diferente da atual (que está varrendo)
              significa que deve montar a opção de "- Todos os professores" (caso houver mais de um professor) }
            Next();


            // Veririca se ainda não acabou os registros
            bVerificaTodosProf := False;

            if not EOF then
            begin
               // Verifica se turma/disciplina atual é diferente da próxima turma/disciplina
               if concat(cd_turma, cd_disciplina) <> concat(FieldByName( 'codigo' ).AsString, FieldByName( 'disciplina' ).AsString) then
               begin
                  // Se mudou a turma/disciplina então deve verificar se apresenta a opção de todos professores
                  bVerificaTodosProf := True;
               end;
            end else begin
               // Se acabou os registros então deve verificar se apresenta a opção de todos professores
               bVerificaTodosProf := True;
            end;

            // Verifica se o registro guardado é valido (previnir erros)
            if BookmarkValid(pPonteiroRegistro) then
            begin
               // Volta para o registro anterior
               GotoBookmark(pPonteiroRegistro);
            end;

            // Sistema deve verificar se apresenta todos os professores
            if bVerificaTodosProf then
            begin
                  // Se a turma/disciplina atual possui mais de um professor, nesse caso adiciona a opção "- Todos os professores"
                  if (i > 1) then
                  begin
                     //Adiciona um item na lista de auxilio na seleção dos checks
                     SetLength(Self.bPRepetido, Length(Self.bPRepetido) + 1);
                     Self.bPRepetido
                     [
                        clbPTD.Items.Add( Concat (cd_turma, ' - ', ds_disciplina, ' (', grupo_professores, ') - Todos os professores') )
                     ] := true;

                     //Adiciona os itens em um TStringList Tuma:Disciplina
                     slPTurmaDisc.Add( Concat(cd_turma, '[:separadorinterno:]', cd_disciplina) );

                     //Adiciona os itens em um TStringList Turma,Professor,Disciplina
                     slPTurmas.Add( Concat('''', cd_turma, ''',', '0', ',', cd_disciplina ) );

                     //Adiciona os itens em um TStringList Tumas e Disciplinas
                     slPDisciplinas.Add( Concat( cd_disciplina, '-', ds_disciplina ) );
                  end;

                  //Inicia as variaveis que controlam o agrupamento do professor
                  grupo_professores := '';
                  i := 0;
            end;

            { FIM LÓGICA PARA ADICIONAR A OPÇÃO DE "- Todos os professores" NA
              LISTA DE TURMAS/DISCIPLINAS/PROFESSORES PARA SER SELECIONADA }


            Next();
         end;

      end else
      begin
         Mensagem( 'Não existem professores vinculados à turma/disciplina filtrada. '+ Chr(13) +
                   'Acesse o menu Cadastros > Disciplinas e Turmas do Professor e retorne posteriormente a este espaço.', '', MB_OK + MB_ICONEXCLAMATION, Handle );
      end;

      Close();

   end;  //end with

   FreeAndNil( qyGradeCurricular );
   
end;

procedure TfrmAulasProvasAcoes.LoadSituacaoGeraCP;
var
   S: AnsiString;
begin
   S := DM.variavel_parametro('LogisticaAulas.Compromisso.Gerar.SituacaoAula');
   FSituacaoGeraCP := StrToIntDef(S, 0);
end;

function TfrmAulasProvasAcoes.percorreDatasCronograma() : Boolean;
var
   I: integer;
   nomeComponente : String;
begin
   for I := 0 to sbAulas.ComponentCount - 1 do
   begin
      nomeComponente := sbAulas.Components[I].Name;

      if ( Pos( 'dtpDataAula', nomeComponente ) > 0 ) then
      begin
         result := checarConflitoDatasCalendario(TUMDateTimePicker(sbAulas.Components[I]).Date);

         if ( result ) then
            Exit;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.setPadrao(saCurso: string; saAnoSem: string = ''; saTurma: string = ''; saDisciplina: string = ''; saBim: String = '' ;saSerie: String = '';saCSerie: Boolean= True);
begin
   {Ok, e se eu quiser zerar? If removido}
   {if (Length(saCurso) > 0) then begin}
      sPCurso           := saCurso;
      sCronogramaCurso  := saCurso;
   {end;}
   if (Length(saAnoSem) > 0) then begin
      sPAnoSem          := saAnoSem;
      sCronogramaAnoSem := saAnoSem;
   end;
   {if (Length(saTurma) > 0) then begin}
      sPTurma           := saTurma;
      sCronogramaTurma  := saTurma;
   {end;
   if (Length(saDisciplina) > 0) then begin}
      sPDisciplina            := saDisciplina;
      sCronogramaDisciplina   := saDisciplina;
   {end;}
   if (Length(saBim) > 0) then begin
      sPBim := saBim;
   end else begin
      spBim := '1';
   end;

   if (Length(saSerie) > 0) then begin
      spSerie := saSerie;
   end else begin
      spSerie := '2';
   end;

   spCSerie := saCSerie;


end;

function TfrmAulasProvasAcoes.SoNumeros(const Texto: String): String;
var
   I: integer;
   S: string;
begin
   S := '';
   for I := 1 To Length(Texto) Do
   begin
      if (Texto[I] in ['0'..'9']) then
      begin
         S := S + Copy(Texto, I, 1);
      end;  
   end;
   result := S;
end;

procedure TfrmAulasProvasAcoes.sbSubstitutoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   if (Length(sPCurso) > 0) then
   begin
      if ( Length(sPTurma) > 0 ) then
      begin
         {Pesquisar Professor}
         resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

         if resultado_filtro.filtrado then
         Begin
            txtSubstituto.Text := IntToStr(resultado_filtro.cd_pessoa);
         End;

      end else
         Mensagem( 'Você precisa selecionar uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
   end else
      Mensagem( 'Você precisa selecionar um curso e uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
end;

procedure TfrmAulasProvasAcoes.sbTurmaBuscaCronogramaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
   cd_coligada_filtro : Integer;
   i : integer;
begin
   { Pesquisar Turmas }
   if (Length( sCronogramaCurso ) > 0) then
   begin
      cd_coligada_filtro := -1;
      if filtro_coligada > -1 then
         cd_coligada_filtro := filtro_coligada;

      resultado_filtro := TfrmSelecionarTurma.Filtrar([],
         StrToInt(sCronogramaAnoSem), cd_coligada_filtro, -1, sCronogramaCurso);
   end else begin
      resultado_filtro := TfrmSelecionarTurma.Filtrar([]);
   end;

   
   cd_coligada_filtro := resultado_filtro.cd_coligada;

   if not resultado_filtro.filtrado then Exit;

   sCronogramaAnoSem := IntToStr( resultado_filtro.nr_anosemestre );
   sCronogramaCurso  := resultado_filtro.cd_curso;
   txtCronogramasCurso.Text := sCronogramaCurso;
   txtCronogramaTurma.Text := resultado_filtro.cd_turma;

   sPCurso := sCronogramaCurso;
   sPAnoSem := sCronogramaAnoSem;

   sCronogramaTurma := resultado_filtro.cd_turma;
   sPTurma := sCronogramaTurma;

   carregaTipoDigitacao();
   CarregaAvaliacaoCronograma();
end;

procedure TfrmAulasProvasAcoes.SpeedButton8Click(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
   professorAntigo: Integer;
begin
   if (Length(sPCurso) > 0) then
   begin
      if ( Length(sPTurma) > 0 ) then
      begin
         {Pesquisar Professor}
         resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

         if resultado_filtro.filtrado then
         Begin
            if txtCronogramasProfessor.Text <> '' then
            begin
               professorAntigo := StrToInt(txtCronogramasProfessor.Text);
            end;

            txtCronogramasProfessor.Text := IntToStr(resultado_filtro.cd_pessoa);
            txtAProf.Text := txtCronogramasProfessor.Text;
            sNomeProfessor := resultado_filtro.nm_pessoa;
            
            if( txtSubstituto.Text = '' )  then
            begin
              txtSubstituto.Text := txtCronogramasProfessor.Text;
            end;
            
            verificarTrocaProfessor(professorAntigo);
         End;
      end
      else
      begin
         Mensagem( 'Você precisa selecionar uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
      end;
   end
   else
   begin
      Mensagem( 'Você precisa selecionar um curso e uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
   end;
end;

procedure TfrmAulasProvasAcoes.spLimpaRespClick(Sender: TObject);
begin
   Self.cbResponsavel.ItemIndex := -1;
end;

procedure TfrmAulasProvasAcoes.clbPTDClickCheck(Sender: TObject);
var
   i     : Integer;
   bRes  : Boolean;
begin

   // Grava a posição da turma/professor/disciplina
   i := clbPTD.ItemIndex;

   if ProvaNecessitaGrupo(i, true) then begin
      clbPTD.Checked[i] := false;
      Exit;
   end;

   if ExecedeuLimiteProvas(i, true) then begin
      clbPTD.Checked[i] := false;
      Exit;
   end;

   if ((High(bPRepetido) >= i) and (Low(bPRepetido) <= i)) then
   begin
      with clbPTD do
      begin
         i := ItemIndex;

         if (Checked[i]) then
         begin

            bRes := True;
            try
               if (bPRepetido[i]) then
               begin
                  if (Checked[i-1]) then
                  begin
                     bRes := False;
                  end;
               end
               else
               begin
                  if ( (Checked[i+1]) and (bPRepetido[i+1]) ) then
                  begin
                     bRes := False;
                  end;
               end;
            except
               bRes := True;
            end;
            Checked[i] := bRes;
            if not bRes then
            begin
               Mensagem('Já existe uma prova marcada nesta lista para essa turma/disciplina com outro professor!', 'Atenção!!', MB_OK + MB_ICONWARNING);
            end;
         end;

      end;
   end;

end;

function TfrmAulasProvasAcoes.ExecedeuLimiteProvas(const i: Integer; const mostraErro: Boolean): Boolean;
var
   cd_avaliacao_tipo, cd_disciplina : Integer;
   bRes  : Boolean;
   cd_turma, ds_disciplina, cd_avaliacao : string;
begin
   cd_avaliacao_tipo := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;

   cd_turma := Copy(slPTurmaDisc[i], 1, Pos('[:separadorinterno:]', slPTurmaDisc[i])-1);
   cd_disciplina := StrToInt(Copy(slPTurmaDisc[i], Pos('[:separadorinterno:]', slPTurmaDisc[i])+20, Length(slPTurmaDisc[i])));
   ds_disciplina := Copy(slPDisciplinas[i], Pos('-', slPDisciplinas[i])+1, Length(slPDisciplinas[i]));
   cd_avaliacao := ClasseTurmas.GetParametroAvaliacao(StrToInt(sPAnoSem), cd_turma, sPDisciplina, 'cd_avaliacao');

   Result := false;
   if GetInfProvaTipo( cd_avaliacao, cd_avaliacao_tipo, 'sn_sem_limite_maxima') = '0' then begin

      if ( GetQtdProvasTipo( StrToInt(sPAnoSem), cd_turma, cd_disciplina, StrToInt(txtPBim.Text), cd_avaliacao_tipo ) >=
           StrToInt(GetInfProvaTipo( cd_avaliacao, cd_avaliacao_tipo, 'nr_qtd_maxima' )) ) then
      begin
         if mostraErro then begin
            Mensagem( 'Não é possível incluir a prova, o número de provas para a turma/disciplina: ' + cd_turma +
                      '/' + ds_disciplina + ' definido no Tipo de Avaliação excedeu.' );
         end;
         Result := true;
      end;

   end;
end;

function TfrmAulasProvasAcoes.ProvaNecessitaGrupo(const i: Integer; const mostraErro: Boolean): Boolean;
var
   cd_disciplina : Integer;
   cd_turma : string;
begin
   cd_turma := Copy(slPTurmaDisc[i], 1, Pos('[:separadorinterno:]', slPTurmaDisc[i])-1);
   cd_disciplina := StrToInt(Copy(slPTurmaDisc[i], Pos('[:separadorinterno:]', slPTurmaDisc[i])+20, Length(slPTurmaDisc[i])));

   Result := False;

   // Verifica se a prova para a turma/disciplina selecionada possui grupo de atividade
   if Self.existeGrupo(StrToInt(sPAnoSem), txtPCurso.Text, cd_turma, cd_disciplina) and (Length(edGrupoProvas.Text) = 0) then
   begin
      if mostraErro then
      begin
         Mensagem('Existe pelo menos um grupo criado para essa turma/disciplina, nesse caso um grupo precisa ser selecionado.', 'Atenção!', MB_ICONWARNING + MB_OK);
      end;
      Result := True;
   end;
end;

function TfrmAulasProvasAcoes.temProvaCriada(const cd_turma: String; const cd_disciplina, nr_anosemestre, bimestre, cd_grupo: Integer): Boolean;
var
   qyBuscaProva: TUMZQuery;
begin
   DM.CriarConsulta(qyBuscaProva);

   { Busca se a Turma/Disciplina já possui a prova 1 (verificação por grupo se houver)}
   with qyBuscaProva do
   begin
      SQL.Clear();

      SQL.Add('SELECT cd_prova FROM diario_provas');
      SQL.Add('WHERE anosemestre = :nr_anosemestre AND');
      SQL.Add('      turma = :cd_turma AND disciplina = :cd_disciplina AND');
      SQL.Add('      bimestre = :bimestre AND ISNULL(id_atividade_moodle) AND');
       SQL.Add('     CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END');

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      ParamByName('bimestre').AsInteger := bimestre;

      if cd_grupo > 0 then
      begin
         ParamByName('cd_grupo').AsInteger := cd_grupo;
      end else begin
         ParamByName('cd_grupo').Clear;
      end;

      Open();
   end;

   if qyBuscaProva.RecordCount = 0 then
   begin
      Result := False;
      exit;
   end;

   Result := True;

end;

function TfrmAulasProvasAcoes.getTipoDigitacao: Integer;
begin
  result := 0;
  if (cbTipoDigitacao.Items.Count > 1) AND (cbTipoDigitacao.Enabled) then
  begin
    result := StrToInt(TItemCombo(cbTipoDigitacao.Items.Objects[cbTipoDigitacao.ItemIndex]).getCodigo);
  end;
end;

function TfrmAulasProvasAcoes.getTipoDigitacaoProvaCriada(const cd_turma: String; const cd_disciplina, nr_anosemestre, bimestre, cd_grupo: Integer): Integer;
var
   qyBuscaProva: TUMZQuery;
begin
   DM.CriarConsulta(qyBuscaProva);

   { Busca se a Turma/Disciplina já possui a prova 1 (verificação por grupo se houver)}
   with qyBuscaProva do
   begin
      SQL.Clear();

      SQL.Add('SELECT nr_tipo_digitacao FROM diario_provas');
      SQL.Add('WHERE anosemestre = :nr_anosemestre AND');
      SQL.Add('      turma = :cd_turma AND disciplina = :cd_disciplina AND');
      SQL.Add('      bimestre = :bimestre AND ISNULL(id_atividade_moodle) AND');
       SQL.Add('     CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END');

      ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
      ParamByName('cd_turma').AsString := cd_turma;
      ParamByName('cd_disciplina').AsInteger := cd_disciplina;
      ParamByName('bimestre').AsInteger := bimestre;

      if cd_grupo > 0 then
      begin
         ParamByName('cd_grupo').AsInteger := cd_grupo;
      end else begin
         ParamByName('cd_grupo').Clear;
      end;

      Open();
   end;

   if qyBuscaProva.RecordCount = 0 then
   begin
      Result := 0;
      exit;
   end;

   Result := qyBuscaProva.FieldByName('nr_tipo_digitacao').AsInteger;;

end;

procedure TfrmAulasProvasAcoes.CriaDiarioPrazos(const nr_anosemestre: Integer;
            const cd_curso, cd_turma: String; const cd_disciplina: Integer; const dt_inicio, dt_fim: TDate;const cd_tipo_prazo : Integer);
var
   qyBuscaDiario: TUMZReadOnlyQuery;
   qyBuscaEtapaNegtiva: TUMZReadOnlyQuery;
   qyExecutaDiario: TUMZQuery;
   possuiRegistroNegativo : Boolean;
begin
   DM.CriarConsulta(qyBuscaDiario);
   DM.CriarConsulta(qyExecutaDiario);
   DM.CriarConsulta(qyBuscaEtapaNegtiva);

   with qyBuscaDiario do
   begin
      SQL.Clear();

      SQL.Add('SELECT CD_PRAZO');
      SQL.Add('FROM DIA_PRAZOS_TURMAS');
      SQL.Add('WHERE NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND');
      SQL.Add('      CD_TIPO_PRAZO = :CD_TIPO_PRAZO AND');
      SQL.Add('      CD_CURSO = :CD_CURSO AND');
      SQL.Add('      CD_TURMA = :CD_TURMA AND');
      SQL.Add('      CD_DISCIPLINA = :CD_DISCIPLINA');

      ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
      ParamByName('CD_CURSO').AsString := cd_curso;
      ParamByName('CD_TURMA').AsString := cd_turma;
      ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;
      ParamByName('CD_TIPO_PRAZO').AsInteger := cd_tipo_prazo;

      Open();
   end;

   if not (qyBuscaDiario.FieldByName('CD_PRAZO').AsInteger > 0) then
   begin
      { DIA_PRAZOS, Cria um novo prazo para a Turma/Disciplina }
      with qyExecutaDiario do
      begin
         Close();
         SQL.Clear();

         SQL.Add('INSERT INTO DIA_PRAZOS ( ');
         SQL.Add('   NM_PRAZO, NR_ANOSEMESTRE, CD_TIPO_PRAZO,');
         SQL.Add('   DT_INICIO_ETAPA, DT_FIM_ETAPA,');
         SQL.Add('   DT_INICIO_FREQUENCIA, DT_FIM_FREQUENCIA,');
         SQL.Add('   DT_INICIO_NOTAS, DT_FIM_NOTAS, DT_LIBERACAO, CD_COLIGADA_MATRIZ');
         SQL.Add(') VALUES (');
         SQL.Add('   ' + QuotedStr('Prazo, AnoSemestre: ' + IntToStr(nr_anosemestre) + '/Turma: ' + cd_turma + '/Disciplina: ' + IntToStr(cd_disciplina)) + ', ');
         SQL.Add('   :NR_ANOSEMESTRE, :CD_TIPO_PRAZO, ');
         SQL.Add('   {DS_CRONOGRAMA_VISUALIZA_INICIO}, {DS_CRONOGRAMA_VISUALIZA_FIM}, ');
         SQL.Add('   {DS_CRONOGRAMA_AULAS_INICIO}, {DS_CRONOGRAMA_AULAS_FIM}, ');
         SQL.Add('   {DS_CRONOGRAMA_NOTAS_INICIO}, {DS_CRONOGRAMA_NOTAS_FIM}, {DS_CRONOGRAMA_LIBERACAO}, :CD_COLIGADA_MATRIZ ');
         SQL.Add(')');

         ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
         ParamByName('CD_TIPO_PRAZO').AsInteger := cd_tipo_prazo;
         ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpVisualizacao, False );

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpNotas, False );

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpAulas, False );

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpLiberacao, False );

         ExecSQL();

         Close();
         SQL.Clear();

         SQL.Add('INSERT INTO DIA_PRAZOS_TURMAS ( ');
         SQL.Add('   NR_ANOSEMESTRE, CD_TIPO_PRAZO,');
         SQL.Add('   CD_CURSO, CD_TURMA, CD_DISCIPLINA, CD_PRAZO');
         SQL.Add(') VALUES (');
         SQL.Add('   :NR_ANOSEMESTRE, :CD_TIPO_PRAZO, :CD_CURSO, :CD_TURMA, :CD_DISCIPLINA, LAST_INSERT_ID()');
         SQL.Add(')');

         ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
         ParamByName('CD_TIPO_PRAZO').AsInteger := cd_tipo_prazo;
         ParamByName('CD_CURSO').AsString := cd_curso;
         ParamByName('CD_TURMA').AsString := cd_turma;
         ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;

         ExecSQL();

         Close();
      end;

      with qyBuscaEtapaNegtiva do
      begin
         SQL.Clear();

         SQL.Add('SELECT CD_PRAZO');
         SQL.Add('FROM DIA_PRAZOS_TURMAS');
         SQL.Add('WHERE NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND');
         SQL.Add('      CD_TIPO_PRAZO = -3 AND');
         SQL.Add('      CD_CURSO = :CD_CURSO AND');
         SQL.Add('      CD_TURMA = :CD_TURMA AND');
         SQL.Add('      CD_DISCIPLINA = :CD_DISCIPLINA');

         ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
         ParamByName('CD_CURSO').AsString := cd_curso;
         ParamByName('CD_TURMA').AsString := cd_turma;
         ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;

         Open();

         possuiRegistroNegativo := (RecordCount > 0);
      end;

      if not possuiRegistroNegativo then
      begin
         with qyExecutaDiario do
         begin
            SQL.Clear();

            SQL.Add('INSERT INTO DIA_PRAZOS ( ');
            SQL.Add('   NM_PRAZO, NR_ANOSEMESTRE, CD_TIPO_PRAZO, DT_LIBERACAO, CD_COLIGADA_MATRIZ ');
            SQL.Add(') VALUES (');
            SQL.Add('   ' + QuotedStr('Prazo Final (Liberação), AnoSemestre: ' + IntToStr(nr_anosemestre) + '/Turma: ' + cd_turma + '/Disciplina: ' + IntToStr(cd_disciplina)) + ', ');
            SQL.Add('   :NR_ANOSEMESTRE, -3, {DS_CRONOGRAMA_LIBERACAO}, :CD_COLIGADA_MATRIZ');
            SQL.Add(')');

            ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
            ParamByName('CD_COLIGADA_MATRIZ').AsInteger := DM.GetUsuarioLogado.GetColigadaLogada.Codigo;

            SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpLiberacao, False );

            ExecSQL();

            Close();
            SQL.Clear();

            SQL.Add('INSERT INTO DIA_PRAZOS_TURMAS ( ');
            SQL.Add('   NR_ANOSEMESTRE, CD_TIPO_PRAZO,');
            SQL.Add('   CD_CURSO, CD_TURMA, CD_DISCIPLINA, CD_PRAZO');
            SQL.Add(') VALUES (');
            SQL.Add('   :NR_ANOSEMESTRE, -3, :CD_CURSO, :CD_TURMA, :CD_DISCIPLINA, LAST_INSERT_ID()');
            SQL.Add(')');

            ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
            ParamByName('CD_CURSO').AsString := cd_curso;
            ParamByName('CD_TURMA').AsString := cd_turma;
            ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;

            ExecSQL();

            Exit;
         end
      end;
   end
   else
      { DIA_PRAZOS, Altera o prazo atual existente da Turma/Disciplina }
      with qyExecutaDiario do
      begin
         Close();
         SQL.Clear();

         SQL.Add('UPDATE DIA_PRAZOS');
         SQL.Add('SET DT_INICIO_ETAPA = {DS_CRONOGRAMA_VISUALIZA_INICIO},');
         SQL.Add('    DT_FIM_ETAPA = {DS_CRONOGRAMA_VISUALIZA_FIM},');
         SQL.Add('    DT_INICIO_FREQUENCIA = {DS_CRONOGRAMA_AULAS_INICIO},');
         SQL.Add('    DT_FIM_FREQUENCIA = {DS_CRONOGRAMA_AULAS_FIM},');
         SQL.Add('    DT_INICIO_NOTAS = {DS_CRONOGRAMA_NOTAS_INICIO},');
         SQL.Add('    DT_FIM_NOTAS = {DS_CRONOGRAMA_NOTAS_FIM},');
         SQL.Add('    DT_LIBERACAO = {DS_CRONOGRAMA_LIBERACAO}');
         SQL.Add('WHERE CD_PRAZO = :CD_PRAZO');
         ParamByName('CD_PRAZO').AsInteger := qyBuscaDiario.FieldByName('CD_PRAZO').AsInteger;

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpVisualizacao, True );

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpNotas, True );

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpAulas, True );

         SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpLiberacao, True );

         ExecSQL();
      end;

      with qyBuscaDiario do
      begin
         SQL.Clear();

         SQL.Add('SELECT CD_PRAZO');
         SQL.Add('FROM DIA_PRAZOS_TURMAS');
         SQL.Add('WHERE NR_ANOSEMESTRE = :NR_ANOSEMESTRE AND');
         SQL.Add('      CD_TIPO_PRAZO = -3 AND');
         SQL.Add('      CD_CURSO = :CD_CURSO AND');
         SQL.Add('      CD_TURMA = :CD_TURMA AND');
         SQL.Add('      CD_DISCIPLINA = :CD_DISCIPLINA');

         ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
         ParamByName('CD_CURSO').AsString := cd_curso;
         ParamByName('CD_TURMA').AsString := cd_turma;
         ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;

         Open();
      end;

      if (qyBuscaDiario.FieldByName('CD_PRAZO').AsInteger > 0) then
      begin
         with qyExecutaDiario do
         begin
            Close();
            SQL.Clear();

            SQL.Add('UPDATE DIA_PRAZOS');
            SQL.Add('SET DT_LIBERACAO = {DS_CRONOGRAMA_LIBERACAO} ');
            SQL.Add('WHERE CD_PRAZO = :CD_PRAZO');

            ParamByName('CD_PRAZO').AsInteger := qyBuscaDiario.FieldByName('CD_PRAZO').AsInteger;

            SQL.Text := TrataPrazoCalculado( SQL.Text, nr_anosemestre, cd_turma, cd_disciplina, tpLiberacao, True );

            ExecSQL();
         end;
      end;
end;

procedure TfrmAulasProvasAcoes.CriaProvaUltimaAulaCronograma(
  const data: TDate;
  const cd_turma: String;
  const cd_disciplina, cd_professor, nr_anosemestre, cd_grupo, bimestre : Integer;
  const  tipoDigitacao: Integer = 0
);
var
   qyBuscaProva, qyExecutaAlteracoes: TUMZQuery;
   nrProxProva: Integer; 
   logDesc: string;
begin
   DM.CriarConsulta(qyBuscaProva);
   DM.CriarConsulta(qyExecutaAlteracoes);

   if ckbCriaProvaUltimaAula.Checked then
   begin
      { Busca se a Turma/Disciplina já possui a prova 1 (verificação por grupo se houver)}
      { Se não existir, então vamos criar }
      if temProvaCriada(cd_turma, cd_disciplina, nr_anosemestre, bimestre, cd_grupo) = false then
      begin
         qyBuscaProva.SQL.Clear();
         qyBuscaProva.Close;
         qyBuscaProva.SQL.Add('SELECT (COALESCE(MAX(nro_nota), 0)+1) prox_num FROM diario_provas ');
         qyBuscaProva.SQL.Add('WHERE anosemestre = :nr_anosemestre AND ');
         qyBuscaProva.SQL.Add('      turma = :cd_turma AND disciplina = :cd_disciplina AND bimestre = :bimestre ');

         qyBuscaProva.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         qyBuscaProva.ParamByName('cd_turma').AsString := cd_turma;
         qyBuscaProva.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         qyBuscaProva.ParamByName('bimestre').AsInteger := bimestre;

         qyBuscaProva.Open;

         nrProxProva := qyBuscaProva.FieldByName('prox_num').AsInteger;

         with qyExecutaAlteracoes do
         begin
            SQL.Clear();

            SQL.Add(
                 'INSERT INTO diario_provas( '
               + '    nro_nota, data, anosemestre, turma, disciplina, bimestre, '
               + '    assunto, nr_tipo_digitacao, cd_professor, cd_grupo, dt_inclusao'
               + ' ) '
               + ' VALUES ( '
               + '    :nro_nota, :data, :nr_anosemestre, :cd_turma, '
               + '    :cd_disciplina, :bimestre, :assunto, :nr_tipo_digitacao, '
               + '    :cd_professor, :cd_grupo , :dt_inclusao '
               + ' )'
            );

            ParamByName('data').AsDate := data;
            ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
            ParamByName('cd_turma').AsString := cd_turma;
            ParamByName('cd_disciplina').AsInteger := cd_disciplina;
            ParamByName('nro_nota').AsInteger := nrProxProva;
            ParamByName('assunto').AsString := 'Prova 1';
            ParamByName('cd_professor').AsInteger := cd_professor;
            ParamByName('bimestre').AsInteger := bimestre;

            if ( tipoDigitacao = 0 ) then
            begin
              ParamByName('nr_tipo_digitacao').Clear;
            end else
            begin
              ParamByName('nr_tipo_digitacao').AsInteger := tipoDigitacao;
            end;

            ParamByName('dt_inclusao').AsDateTime :=  Now();
            if cd_grupo > 0 then
            begin
               ParamByName('cd_grupo').AsInteger := cd_grupo;
            end
            else
            begin
               ParamByName('cd_grupo').Clear;
            end;

            ExecSQL();
         end;

         //LOG
         logDesc := '';
         logDesc := logDesc + 'Nro. Prova: '+IntToStr(nrProxProva)+', ';
         logDesc := logDesc + 'Data: '+FormatDateTime('dd-mm-yyyy', data)+', ';
         logDesc := logDesc + 'Assunto: Prova 1, ';
         logDesc := logDesc + 'Anosemestre: '+inttostr(nr_anosemestre)+', ';
         logDesc := logDesc + 'Turma: '+cd_turma+', ';
         logDesc := logDesc + 'Disciplina: '+inttostr(cd_disciplina)+', ';
         logDesc := logDesc + 'Etapa: 1, ';
         logDesc := logDesc + 'Grupo: '+inttostr(cd_grupo)+', ';
         logDesc := logDesc + 'Bimestre: '+inttostr(bimestre)+', ';
         logDesc := logDesc + 'Tipo de Avaliação: 1 ';
         logDesc := logDesc + CHR(13) + '[Acadêmico][Prova gerada pelo Diário de Cronogramas]';

         { Insere log de inserção de provas }
         DMDiario.inserirLog(uDMDiario.ACAO_INCLUSAO, uDMDiario.ATIVIDADE_PROVA, logDesc, cd_professor);

         Exit;
      end;

      { Se ela já existe, vamos alterar a data e o professor }
      with qyExecutaAlteracoes do
      begin
         qyBuscaProva.SQL.Clear();
         qyBuscaProva.Close;
         qyBuscaProva.SQL.Add('SELECT MIN(nro_nota) nr_primeira_prova_grupo FROM diario_provas ');
         qyBuscaProva.SQL.Add('WHERE anosemestre = :nr_anosemestre AND ');
         qyBuscaProva.SQL.Add('      turma = :cd_turma AND disciplina = :cd_disciplina AND bimestre = :bimestre AND CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END ');

         qyBuscaProva.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         qyBuscaProva.ParamByName('cd_turma').AsString := cd_turma;
         qyBuscaProva.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         qyBuscaProva.ParamByName('bimestre').AsInteger := bimestre;

         if cd_grupo > 0 then
         begin
            qyBuscaProva.ParamByName('cd_grupo').AsInteger := cd_grupo;
         end
         else
         begin
            qyBuscaProva.ParamByName('cd_grupo').Clear;
         end;

         qyBuscaProva.Open;

         SQL.Clear();

         SQL.Add(' UPDATE diario_provas SET data = :data, cd_professor = :cd_professor, nr_tipo_digitacao = :nr_tipo_digitacao ');
         SQL.Add(' WHERE anosemestre = :nr_anosemestre AND turma = :cd_turma AND ');
         SQL.Add('      disciplina = :cd_disciplina AND CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END ');
         SQL.Add('      AND bimestre = :bimestre AND nro_nota = :nro_nota AND ISNULL(id_atividade_moodle) ');

         { Campos que serão alterados }
         ParamByName('data').AsDate := data;
         ParamByName('cd_professor').AsInteger := cd_professor;
         ParamByName('nr_tipo_digitacao').AsInteger := tipoDigitacao;

         { Filtros }
         ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         ParamByName('cd_turma').AsString := cd_turma;
         ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         ParamByName('nro_nota').AsInteger := qyBuscaProva.FieldByName('nr_primeira_prova_grupo').AsInteger;
         ParamByName('bimestre').AsInteger := bimestre;

         ExecSQL();
      end;
      exit;
   end;

   //Se não está clicado e tem prova criada deve excluir
   if temProvaCriada(cd_turma, cd_disciplina, nr_anosemestre, bimestre, cd_grupo) then
   begin
      with qyExecutaAlteracoes do
      begin
         qyBuscaProva.SQL.Clear();
         qyBuscaProva.Close;
         qyBuscaProva.SQL.Add('SELECT MIN(nro_nota) nr_primeira_prova_grupo FROM diario_provas ');
         qyBuscaProva.SQL.Add('WHERE anosemestre = :nr_anosemestre AND ');
         qyBuscaProva.SQL.Add('      turma = :cd_turma AND disciplina = :cd_disciplina AND bimestre = :bimestre AND CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END ');

         qyBuscaProva.ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         qyBuscaProva.ParamByName('cd_turma').AsString := cd_turma;
         qyBuscaProva.ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         qyBuscaProva.ParamByName('bimestre').AsInteger := bimestre;

         if cd_grupo > 0 then
         begin
            qyBuscaProva.ParamByName('cd_grupo').AsInteger := cd_grupo;
         end
         else
         begin
            qyBuscaProva.ParamByName('cd_grupo').Clear;
         end;

         qyBuscaProva.Open;

         SQL.Clear();

         SQL.Add(' DELETE d from diario_provas d ');
         SQL.Add(' WHERE anosemestre = :nr_anosemestre AND turma = :cd_turma AND ');
         SQL.Add('      disciplina = :cd_disciplina AND CASE WHEN :cd_grupo IS NOT NULL THEN cd_grupo = :cd_grupo ELSE 1=1 END ');
         SQL.Add('      AND bimestre = :bimestre AND nro_nota = :nro_nota AND ISNULL(id_atividade_moodle) ');

         { Filtros }
         ParamByName('nr_anosemestre').AsInteger := nr_anosemestre;
         ParamByName('cd_turma').AsString := cd_turma;
         ParamByName('cd_disciplina').AsInteger := cd_disciplina;
         ParamByName('nro_nota').AsInteger := qyBuscaProva.FieldByName('nr_primeira_prova_grupo').AsInteger;
         ParamByName('bimestre').AsInteger := bimestre;

         ExecSQL();
      end;
   end;

end;

procedure TfrmAulasProvasAcoes.btnSelTodas(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to (clbPTD.Count -1) do begin
      if (not ExecedeuLimiteProvas(i, false)) and (not ProvaNecessitaGrupo(i, false)) then
      begin
         if not (bPRepetido[i]) then begin
            clbPTd.Checked[i] := True;
         end
         else begin
             clbPTd.Checked[i] := False;
         end;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.btnNenhumaClick(Sender: TObject);
var
   i: Integer;
begin
   for i := 0 to (clbPTD.Count -1) do begin
      clbPTd.Checked[i] := False;
   end;
end;

procedure TfrmAulasProvasAcoes.btDeferirClick(Sender: TObject);
begin
   iRetorno := 2;
   Close();
end;

procedure TfrmAulasProvasAcoes.btIndeferirClick(Sender: TObject);
begin
   if (Length(meResposta.Lines.Text) > 0) then begin
      iRetorno := 3;
      Close();
   end
   else begin
      Mensagem('Uma resposta deve ser informada para indeferir um pedido de alteração de nota.', 'Atenção!', MB_OK + MB_ICONINFORMATION);
   end;
end;

function TfrmAulasProvasAcoes.getRetorno: Integer;
begin
   Result := iRetorno;
end;

function TfrmAulasProvasAcoes.GetSQLProfessores(
  const ASCodCurso: string): string;
const
   SQL_PROFESSORES_SANOSEM =
      'SELECT DISTINCT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa '+
      'FROM '+
         'turmasprofessores tp '+
            'JOIN pessoas p ON (tp.professor = p.cd_pessoa) '+
      'WHERE '+
         'tp.curso = ''%s'' ';
   SQL_PROFESSORES_CANOSEM =
      SQL_PROFESSORES_SANOSEM + ' AND anosemestre = %s';
begin
   if Trim(Self.sPAnoSem) = '' then
      Result := Format(SQL_PROFESSORES_SANOSEM + ' ORDER BY p.nm_pessoa', [ASCodCurso])
   else
      Result := Format(SQL_PROFESSORES_CANOSEM + ' ORDER BY p.nm_pessoa', [ASCodCurso, Self.sPAnoSem]);
end;

function TfrmAulasProvasAcoes.GetSQLProfessores(const ASCodCurso,
  ASCodTurma: string): string;
const
   SQL_PROFESSORES_SANOSEM =
      'SELECT DISTINCT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa '+
      'FROM '+
         'turmasprofessores tp '+
            'JOIN pessoas p ON (tp.professor = p.cd_pessoa) '+
      'WHERE '+
         'tp.curso = ''%s'' AND '+
         'tp.turma = ''%s'' ';
   SQL_PROFESSORES_CANOSEM =
      SQL_PROFESSORES_SANOSEM + ' AND anosemestre = %s';
begin
   if Trim(Self.sPAnoSem) = '' then
      Result := Format(SQL_PROFESSORES_SANOSEM + ' ORDER BY p.nm_pessoa', [ASCodCurso, ASCodTurma])
   else
      Result := Format(SQL_PROFESSORES_CANOSEM + ' ORDER BY p.nm_pessoa', [ASCodCurso, ASCodTurma, Self.sPAnoSem]);
end;

function TfrmAulasProvasAcoes.GetSQLProfessores(const ASCodCurso, ASCodTurma,
  ASCodDisc: string): string;
const
   SQL_PROFESSORES_SANOSEM =
      'SELECT DISTINCT '+
         'p.cd_pessoa,'+
         'p.nm_pessoa '+
      'FROM '+
         'turmasprofessores tp '+
            'JOIN pessoas p ON (tp.professor = p.cd_pessoa) '+
      'WHERE '+
         'tp.curso = ''%s'' AND '+
         'tp.turma = ''%s'' AND '+
         'tp.disciplina = %s';
   SQL_PROFESSORES_CANOSEM =
      SQL_PROFESSORES_SANOSEM + ' AND anosemestre = %s';
begin
   if Trim(Self.sPAnoSem) = '' then
      Result := Format(SQL_PROFESSORES_SANOSEM + ' ORDER BY p.nm_pessoa', [ASCodCurso, ASCodTurma, ASCodDisc])
   else
      Result := Format(SQL_PROFESSORES_CANOSEM + ' ORDER BY p.nm_pessoa', [ASCodCurso, ASCodTurma, ASCodDisc, Self.sPAnoSem]);
end;

function TfrmAulasProvasAcoes.getTipoAulaPadrao(cd_turma: String;
  cd_disciplina: Integer): Integer;
const
   SQL_CARREGA_PARAMETROS_AVALIACAO =
      ' SELECT '+
		' 	 atp.cd_aula_tipo '+
		' FROM '+
		'   turmas t '+
      '	 INNER JOIN grades_disciplinas gd ON (gd.cd_curso = t.curso AND gd.nr_serie = t.serie AND gd.cd_grade = t.cd_grade) '+
	   '   INNER JOIN avaliacoes_parametros_matriz avl ON (avl.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao)) '+
      '   INNER JOIN aulas_tipos_parametros atp ON (atp.cd_avaliacao = avl.cd_avaliacao AND atp.sn_padrao = 1) '+
		' WHERE '+
		'   [$condicoes$] '+
		'   AND t.anosemestre = :anosemestre '+
		'   AND t.cd_coligada IN(:coligadas) '+
      ' GROUP BY '+
	   '   avl.cd_avaliacao '+
      ' LIMIT 1 ';
var
   qyParametrosAvaliacao: TUMZReadOnlyQuery;

   sCondicoes,
   sSqlParametros,
   sSqlQtdParametros: String;
begin
   DM.CriarConsulta(qyParametrosAvaliacao);

   // Prepara SQL que busca informações dos parametros de avaliação das turmas do curso selecionado
   qyParametrosAvaliacao.SQL.Text := SQL_CARREGA_PARAMETROS_AVALIACAO;

   // Carrega os parametros de avaliação por CURSO
   sCondicoes := ' t.curso LIKE '+QuotedStr(txtCurso.Text);

   // Carrega os parametros de avaliação por CURSO/TURMA - se tiver filtrado
   sCondicoes := sCondicoes + ' AND gd.cd_disciplina LIKE '+QuotedStr(IntToStr(cd_disciplina));

   // Carrega os parametros de avaliação por CURSO/DISCIPLINA ou CURSO/TURMA/DISCIPLINA - se tiver filtrado
   sCondicoes := sCondicoes + ' AND t.codigo LIKE '+QuotedStr(cd_turma);

   qyParametrosAvaliacao.ParamByName('anosemestre').AsString := sPAnoSem;
   
   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    '[$condicoes$]',
                                                    sCondicoes,
                                                    [rfReplaceAll, rfIgnoreCase] );
                                                    
   qyParametrosAvaliacao.SQL.Text := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                                    ':coligadas',
                                                    dm.GetColigadas,
                                                    [rfReplaceAll, rfIgnoreCase] );

   // SQL que busca os parametros de avaliação das turmas
   sSqlParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                    ':campos',
                                    'DISTINCT avl.cd_avaliacao',
                                    [rfReplaceAll, rfIgnoreCase] );

   // SQL que busca os a quantidade de parametros de avalição das turmas
   sSqlQtdParametros := StringReplace( qyParametrosAvaliacao.SQL.Text,
                                       ':campos',
                                       'COUNT(DISTINCT avl.cd_avaliacao) qtd_parametros',
                                       [rfReplaceAll, rfIgnoreCase] );                                                    

   // Executa SQL que busca os parametros de avaliação das turmas
   qyParametrosAvaliacao.SQL.Text := sSqlParametros;
   qyParametrosAvaliacao.Open();

   Result := 0;

   if qyParametrosAvaliacao.RecordCount > 0 then
   begin
      Result := qyParametrosAvaliacao.FieldByName('cd_aula_tipo').AsInteger;
   end;
end;

procedure TfrmAulasProvasAcoes.bloqueiaCamposGrupoSelecionado();
var
   i: Integer;
begin
   // Campos a serem bloqueados quando está na aba de aulas
   if pcAulas.ActivePage = tsAulas then
   begin
      // Se for selecionado um grupo de atividade, não permite criar aulas conforme grade de horários
      ckbConfGrade.Checked := False; // Pode sempre deixar não checada essa opção
      ckbConfGrade.Enabled := (not (sPGrupo > 0)) and bInsere; // Somente pode habilitar essa opção se for inserção

      // Se usuário selecionou a check de "conforme grade de horário", desabilita a busca de grupo
      edGrupoAulas.Enabled := not ckbConfGrade.Checked;
      sbBuscaGrupoAulas.Enabled := not ckbConfGrade.Checked;
      if ckbConfGrade.Checked then
      begin
         edGrupoAulas.Text := '';
         sPGrupo := 0;
      end;

      // Se NÃO existir um grupo, bloqueia o campo de digitação de grupo para não confundir o usuário 
      if (Length(sPAnoSem) > 0) and (Length(sPCurso) > 0) and (Length(sPTurma) > 0) and (Length(sPDisciplina) > 0) then
      begin
         if Self.existeGrupo(StrToInt(sPAnoSem), sPCurso, sPTurma, StrToInt(sPDisciplina)) then
         begin
            edGrupoAulas.Enabled := True;
            sbBuscaGrupoAulas.Enabled := True;
         end else begin
            edGrupoAulas.Enabled := False;
            sbBuscaGrupoAulas.Enabled := False;
         end;
      end;
   end;

   // Campos a serem bloqueados quando está na aba de provas
   if pcAulas.ActivePage = tsProvas then
   begin
      // O campo do código do professor aparece somente na edição e não deve permitir a alteração
      txtPProf.Enabled := False;

      // Se existir um grupo para a turma/disiciplina e for uma alteração, bloqueia o campo de responsável
      if (Length(sPAnoSem) > 0) and (Length(sPCurso) > 0) and (Length(sPTurma) > 0) and (Length(sPDisciplina) > 0) then
      begin
         if Self.existeGrupo(StrToInt(sPAnoSem), sPCurso, sPTurma, StrToInt(sPDisciplina)) then
         begin
            // Se for edição bloqueia os campos de responsável (professor)
            if not bInsere then
            begin
               edGrupoProvas.Enabled := False;
               sbBuscaGrupoProvas.Enabled := False;
            end else begin
               edGrupoProvas.Enabled := True;
               sbBuscaGrupoProvas.Enabled := True;
            end;
         end else begin
            edGrupoProvas.Enabled := False;
            sbBuscaGrupoProvas.Enabled := False;
         end;
      end;

      // Selecinar o professor do grupo
      Self.cbResponsavel.ItemIndex := -1;
      // Somente seleciona o professor se não for RE ou Suficiência
      if (lbTipoProva.Caption = '(CNS)') or (lbTipoProva.Caption = '(NCNS)') then
      begin
         for i := 0 to Self.cbResponsavel.Items.Count - 1 do
         begin
            if IntToStr(TProfessor(Self.cbResponsavel.Items.Objects[i]).Codigo) = txtPProf.Text then
            begin
               Self.cbResponsavel.ItemIndex := i;
               break;
            end;
         end;
      end;

   end;

   // Campos a serem bloqueados quando está na aba de cronogramas
   if pcAulas.ActivePage = tsCronogramasGerenciar then
   begin
      // Se for selecionado um grupo de atividade, não permite selecionar o professor
      Self.txtCronogramasProfessor.Enabled := not (sPGrupo > 0);
      Self.SpeedButton8.Enabled := not (sPGrupo > 0);
      txtSubstituto.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npEspecial, False ) and (not (sPGrupo > 0));
      sbSubstituto.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npEspecial, False ) and (not (sPGrupo > 0));

      // Se NÃO existir um grupo, bloqueia o campo de digitação de grupo para não confundir o usuário
      if (Length(sPAnoSem) > 0) and (Length(sPCurso) > 0) and (Length(sPTurma) > 0) and (Length(sPDisciplina) > 0) then
      begin
         if Self.existeGrupo(StrToInt(sPAnoSem), sPCurso, sPTurma, StrToInt(sPDisciplina)) and
            (AcaoIncluirCampos <> Editar) then
         begin
            cbGrupos.Enabled := True;
         end else begin
            cbGrupos.Enabled := False;
         end;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.btACancelarClick(Sender: TObject);
begin
   iRetorno := 1;
   Close();
end;

procedure TfrmAulasProvasAcoes.ExecutaCalculoNotas();
var
   sAux        : string;
   bRet        : Boolean;
   iTotal      : Integer;
   iAtual      : Integer;
   dtSituacao  : TDateTime;
begin

   //verifica periodo
   with qyAux2 do
   begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Text := 'SELECT dt_resultado_final as dtf FROM cursos WHERE anosemestre = '+ sPAnoSem + ' AND codigo = ' + QuotedStr(txtCurso.Text);
      //Verifica se a conexão é Oracle ou MySQL
      if Connection.Protocol = 'oracle' then //Oracle
      begin
         SQL.Text := SQL.Text + ' AND ROWNUM <= 1';
      end else begin
         SQL.Text := SQL.Text + ' LIMIT 1';
      end;

      Open();
      if not IsEmpty then begin
         dtSituacao := FieldByName('dtf').AsDateTime;
      end
      else begin
         dtSituacao := 0;
      end;
   end;

   if (dtSituacao > Now()) then begin
      //verifica permissao
      if DM.UsuarioLogado.TemPermissao(1028, npAcesso, False) then begin
         if not (Mensagem('O prazo do curso expirou, mesmo assim, deseja recalcular?', 'Atenção!!', MB_YESNO + MB_ICONQUESTION) = IDYES) then begin
            Exit;
         end;
      end
      else begin
         Mensagem('Você não tem permissão para recalcular notas pois expirou o prazo do curso!', 'Atenção!!', MB_OK);
         Exit;
      end;
   end;

   //verifica se é pra zerar
   if (edNFormula.Text = 'ZERAR') then begin
      if (Mensagem('Você tem certeza que deseja ZERAR as notas dos alunos?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = ID_YES) then begin
         edNFormula.Text := '';
      end
      else begin
         Exit;
      end;
   end;


   //situacao do aluno
   with qyAux2 do
   begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT                                                        '+
      '   turma, disciplina, codigoaluno, COALESCE(dgp.cd_grupo, 0) cd_grupo '+
      'FROM                                                          '+
      '   fichaindividual fi                                         '+
      '   INNER JOIN situacao s ON(fi.situacao = s.cd_situacao)      '+
      '   LEFT JOIN	diario_grupos dg ON (                           '+
		'      dg.nr_anosemestre = fi.anosemestre AND                  '+
		'      dg.cd_curso = fi.curso AND                              '+
		'      dg.cd_turma = fi.turma AND                              '+
		'      dg.cd_disciplina = fi.disciplina                        '+
	   '   )                                                          '+
	   '   LEFT JOIN diario_grupos_pessoas dgp ON (                   '+
		'      dgp.cd_grupo = dg.cd_grupo AND                          '+
		'      dgp.cd_pessoa = fi.codigoaluno AND                      '+
		'      dgp.dt_saida IS NULL                                    '+
	   '   )                                                          '+
      'WHERE                                                         '+
      '  s.cd_situacao_pai IN (0,1,2) AND                            '+
      '  CASE WHEN dg.cd_grupo IS NOT NULL THEN dgp.cd_grupo IS NOT NULL ELSE 1=1 END '+
      '');
      sAux := ' and ';
      
      if (Length(sPCurso) > 0) then
      begin
         SQL.Add(sAux);
         SQL.Add('curso = ' + QuotedStr(sPCurso) + ' ');
         sAux := ' and ';
      end
      else
      begin
         Exit;
      end;

      if (Length(sPAnoSem) > 0) then
      begin
         SQL.Add(sAux);
         SQL.Add('anosemestre = ' + sPAnoSem + ' ');
         sAux := ' and ';
      end;

      if (Length(sPTurma) > 0) then
      begin
         SQL.Add(sAux);
         SQL.Add('turma = ' + QuotedStr(sPTurma)+ ' ');
         sAux := ' and ';
      end;

      if (Length(sPDisciplina) > 0) then
      begin
         SQL.Add(sAux);
         SQL.Add('disciplina = ' + sPDisciplina + ' ');
         sAux := ' and ';
      end;

      Open();
      FetchAll;
      Last();
      First();
      iTotal := RecordCount;
      iAtual := 1;

      if not IsEmpty then
      begin

         Processando(True);

         while not Eof do
         begin
            frmSpl.Label1.Caption := 'Processando Registro ' + IntToStr(iAtual) + ' de ' + IntToStr(iTotal);
            Application.ProcessMessages();

            bRet := DM.CalcularNotaDisciplina(
               StrToInt(sPAnoSem),
               FieldByName('turma').AsString,
               FieldByName('disciplina').AsInteger,
               StrToInt(sPBim),
               FieldByName('cd_grupo').AsInteger,
               FieldByName('codigoaluno').AsInteger,
               edNFormula.Text
            );

            if cbFecharDiario.Checked then
            begin
               Self.fechaDiario(
                  StrToInt(sPBim),
                  StrToInt(sPAnoSem),
                  FieldByName('disciplina').AsInteger,
                  sPCurso,
                  FieldByName('turma').AsString
               );
            end;

            Inc(iAtual);

            Next();
         end;
         
      end;

      Close();
      Processando(False);
   end;
end;

procedure TfrmAulasProvasAcoes.setBim(Valor: string);
begin
   sPBim := Valor;
end;

procedure TfrmAulasProvasAcoes.setGrupo(Valor: Integer);
begin
   sPGrupo := Valor;
end;

procedure TfrmAulasProvasAcoes.sbAProfClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   if (Length(sPCurso) > 0) then
   begin
      if ( Length(sPTurma) > 0 ) then
      begin
         {Pesquisar Professor}
         resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpProfessor);

         if resultado_filtro.filtrado then
         Begin
            txtCronogramasProfessor.Text := IntToStr( resultado_filtro.cd_pessoa );
            txtAProf.Text := txtCronogramasProfessor.Text;
         End;
      end else
         Mensagem( 'Você precisa selecionar uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
   end else
      Mensagem( 'Você precisa selecionar um curso e uma turma.', Application.Title, MB_OK + MB_ICONINFORMATION );
end;

procedure TfrmAulasProvasAcoes.FormShow(Sender: TObject);
var
   sAux: string;
   qyVerificaPrazoDisciplina : TUMZQuery;
begin
   RecarregaHorarios();

   txtSubstituto.Text := '';
   txtCronogramasProfessor.Text := ''; 
   chkAI.Visible := true;
   chkAI.Checked := True;
      
   if DM.UsuarioLogado.TemPermissao( 0, 'Academico.Cadastro.Cronogramas.AI', npIncluir, false )= false then
   begin
     chkAI.Checked := false;
     chkAI.Visible := False;
     umdtAvaliacao.Visible := false;
     cbAvaliacao.Visible := false;
     umAjudaAvaliacao.Visible := false;
   end;

   sAux := '';
   if (Length(sPAnoSem) > 0) then begin
      sAux := sAux + 'ANO/SEM: ' + sPAnoSem;
   end;
   if (Length(sPCurso) > 0) then begin
      sAux := sAux + ' - CURSO: '+ sPCurso;
   end;
   if (Length(sPTurma) > 0) then begin
      sAux := sAux + ' - TURMA: ' + sPTurma;
   end;

   if (Length(sPDisciplina) > 0) then begin
      sAux := sAux + ' - DISC:' + sPDisciplina;
   end;
   if (Length(sPBim) > 0) then begin
      sAux := sAux + ' - BIM:' + sPBim;
   end;
   if (sPData > 0) then begin
      sAux := sAux + ' - DATA:' + DateToStr(sPData);
   end;
   if (sPGrupo > 0) then begin
      sAux := sAux + ' - GRUPO:' + IntToStr(sPGrupo);
   end;
   lblFiltro.Caption := sAux;
//   lblFiltroFreq.Caption := sAux;
   udAulas.Enabled:=true;
//      pcAulas.ActivePage.SetFocus();
      txtSubstituto.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npEspecial, False ) and (not (sPGrupo > 0));
      sbSubstituto.Enabled := DM.UsuarioLogado.TemPermissao( 1070, npEspecial, False ) and (not (sPGrupo > 0));
   if (trim(txtTurma.Text) <> '') or (trim(txtPTurma.Text) <> '') then begin
      ckbPSerie.Enabled := False;
      udPSerie.Enabled  := False;
   end;

   // Verificar o parametro nr_inicio_aulas_extras

   if pcAulas.ActivePage = tsAulas then begin
     qyAux3.Close();
     qyAux3.SQL.Text := '' +
       ' SELECT cd_avaliacao, nr_inicio_aulas_extras ' +
       '   FROM avaliacoes_parametros '+
       '  WHERE (nr_inicio_aulas_extras is not null AND nr_inicio_aulas_extras > 0) ';
     qyAux3.Open();
     if NOT qyAux3.Eof then begin
        ckbAtividadeComplementares.Visible := true;
     end else begin
       ckbAtividadeComplementares.Visible := false;
     end;

     if sPGrupo > 0 then
     begin
        txtAProf.Text := IntToStr(Self.getCdProfessorGrupo(sPGrupo));
        Self.bloqueiaCamposGrupoSelecionado();
     end;
   end;

   if Self.pcAulas.ActivePage = tsProvas then
   begin
      if (Trim(Self.txtPDisciplina.Text) <> '') or (Trim(Self.txtPTurma.Text) <> '') or (Trim(Self.txtPCurso.Text) <> '') then
      begin
         Self.CarregaProfessores;
      end;
      Self.CarregaTiposProva;

      cdAvlTipoAnterior := TTipoProva(cbTiposProvas.Items.Objects[cbTiposProvas.ItemIndex]).Codigo;

      if sPGrupo > 0 then
      begin
         txtPProf.Text := IntToStr(Self.getCdProfessorGrupo(sPGrupo));
         Self.bloqueiaCamposGrupoSelecionado();
      end;
   end;

   if Self.pcAulas.ActivePage = tsCronogramasGerenciar then
   begin
      frmAulasProvasAcoes.ClientHeight:= TAMANHO_TELA;
      DM.UsuarioLogado.GetParametroUsuario(ckbChecarConflitosSalas, Self.Name);

      lbAvisoPrazoCronograma.Visible:= false;

      lbAula2.Tag := 0;
      if ( AcaoIncluirCampos <> Editar ) then
      begin
         ckConfirmado.Checked := false;
         edmValor.setValorDouble( '0' );
         edQtdAulas.Text := '12';
         rgPeriodicidade.ItemIndex := -1;
         edBimestre.Text := sPBim;

         edNomeSala.Text := '';
         edNomeSala.Tag := 0;
         upDownEtapa.Enabled := true;
      end else begin
         txtCronogramasProfessor.Text  := qCronograma.FieldByName('cd_professor').asstring;

         if (qCronograma.FieldByName('cd_prof_substituto').asstring <> '' ) then
         begin
           txtSubstituto.Text            := qCronograma.FieldByName('cd_prof_substituto').asstring
         end
         else
           txtSubstituto.Text            := txtCronogramasProfessor.Text;

         txtAnoSemestre.text           := qCronograma.FieldByName('anosemestre').asstring;
         ckConfirmado.Checked          := (qCronograma.FieldByName('sn_confirmado').AsInteger = 1);
         txtCronogramaTurma.Text       := (qCronograma.FieldByName('turma').asstring);
         edmValor.setValorDouble( qCronograma.FieldByName('nr_valor').AsString );
         edNomeSala.Text := qCronograma.FieldByName('ds_sala').AsString;
         edNomeSala.Tag := qCronograma.FieldByName('cd_sala').AsInteger;
         edBimestre.Text := qCronograma.FieldByName('bimestre').AsString;
         upDownEtapa.Enabled := false;
      end;
      //
      ckbCriaProvaUltimaAula.Checked := temProvaCriada(
        qCronograma.FieldByName('turma').asstring,
        qCronograma.FieldByName('disciplina').asInteger,
        qCronograma.FieldByName('anosemestre').asInteger,
        qCronograma.FieldByName('bimestre').asInteger,
        sPGrupo
       );



      CarregaItemBusca;

      carregaTipoDigitacao();

      CarregaAvaliacaoCronograma;

      if ( AcaoIncluirCampos <> Editar ) then
      begin
         txtCronogramasCurso.Enabled := true;
         txtCronogramaTurma.Enabled := true;
         sbTurmaBuscaCronograma.Enabled := true;
         cbDisciplinas.Enabled := true;
         cbGrupos.Enabled := true;

         verificaUnicoProfessorDisciplina();

         AdicionaCamposAulas( AcaoIncluirCampos );

         RecarregaDatasDiario();
         rgPeriodicidade.ItemIndex := -1;
      end else begin
         txtCronogramasCurso.Enabled := false;
         txtCronogramaTurma.Enabled := false;
         sbTurmaBuscaCronograma.Enabled := false;
         cbDisciplinas.Enabled := false;
         cbGrupos.Enabled := false;

         rgPeriodicidade.OnClick := nil;
         rgPeriodicidade.ItemIndex := 0;
         rgPeriodicidade.OnClick := rgPeriodicidadeClick;

         AdicionaCamposAulasBase;

         CarregaDataDiario(strtoint( sPAnoSem ), sPTurma, StrToInt( sPDisciplina ), sPCurso );
      end;
      Self.bloqueiaCamposGrupoSelecionado();

      umAjudaTrocaProfessor.Visible := False;            
   end;
   
   if pcAulas.ActivePage = tsProvas then begin
      cbTiposProvasChange(nil);
      frmAulasProvasAcoes.ClientHeight:= TAMANHO_TELA;
   end;

   if pcAulas.ActivePage = tsComplemento then begin
      frmAulasProvasAcoes.ClientHeight:= TAMANHO_TELA;
   end;

   if pcAulas.ActivePage = tsAprovacao then begin
      frmAulasProvasAcoes.ClientHeight:= TAMANHO_TELA;
   end;

   //Verifica se a disciplina esta vinculada a mais prazos caso esteja mostra uma
   //mensagem ao usuario alertado
   DM.CriarConsulta( qyVerificaPrazoDisciplina );
   if qCronograma.State in [dsEdit]then
   begin
      qyVerificaPrazoDisciplina.SQL.Text := 'SELECT COUNT(dt.CD_PRAZO) AS CD_PRAZO FROM  dia_prazos_turmas as dt WHERE '
	   +' dt.cd_prazo IN ('
	      +'SELECT '
		   +' dpt.cd_prazo AS CD_PRAZO '
	      +' FROM	'
		   +' dia_prazos_turmas as dpt '
	      +' WHERE '
		   +' dpt.CD_TURMA = :cd_turma AND dpt.CD_CURSO = :cd_curso AND dpt.CD_DISCIPLINA = :cd_disciplina AND dpt.NR_ANOSEMESTRE = :anosemestre and dpt.CD_TIPO_PRAZO = dt.CD_TIPO_PRAZO '
      +' ) AND CD_TURMA = :cd_turma AND CD_CURSO = :cd_curso AND	CD_DISCIPLINA <> :cd_disciplina';

      qyVerificaPrazoDisciplina.ParamByName('cd_turma').AsString :=  txtCronogramaTurma.Text;
      qyVerificaPrazoDisciplina.ParamByName('cd_curso').AsString :=  txtCronogramasCurso.Text;
      qyVerificaPrazoDisciplina.ParamByName('cd_disciplina').AsInteger := StrToInt(TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo);
      qyVerificaPrazoDisciplina.ParamByName('anosemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
      qyVerificaPrazoDisciplina.Open();

      if(qyVerificaPrazoDisciplina.FieldByName('CD_PRAZO').AsInteger > 0)then
      begin
         lbAvisoPrazoCronograma.Visible:= true;
      end;
      
   end;
   
   if bInsere then
   begin
      CarregaConfiguracoesLogistica();
   end;


   alterouDtFim := false;
   alterouDtInicio := false;
end;

procedure TfrmAulasProvasAcoes.setData(Valor: TDateTime);
begin
   Self.sPData := Valor;
end;

procedure TfrmAulasProvasAcoes.setListaTurmas(const UsarListaTurmas: Boolean;
  const curso: String; const anosemestre: Integer);
var
   arrTurmas: TStringList;
   i: Integer;
   separador: String;
begin
   bUsaListaTurmas := UsarListaTurmas;

   arrTurmas := ClasseCursos.GetTurmasFromCurso( curso, anosemestre );
   arrTurmas.delimiter := ',';

   sListaTurmas := '';
   for i := 0 to arrTurmas.Count - 1 do
   begin
      sListaTurmas := sListaTurmas + separador + QuotedStr(arrTurmas[i]);
      separador := ', ';
   end;

end;

function TfrmAulasProvasAcoes.getData: TDateTime;
begin
   Result := Self.sPData;
end;

function TfrmAulasProvasAcoes.EhHorarioValido(
                  const cd_professor, cd_horario, cd_disciplina, nr_anosemestre: Integer;
                  const data: TDate; const cd_turma: String): String;
var
   qyVerificaConflitoHorarios: TUMZReadOnlyQuery;
   hr_inicio, hr_fim: TTime;
   msg: String;
begin
   DM.CriarConsulta(qyVerificaConflitoHorarios);
   msg := '';

      qyVerificaConflitoHorarios.SQL.Clear();

      qyVerificaConflitoHorarios.SQL.Add('SELECT hr_inicio, hr_fim FROM horarios WHERE codigo = :CD_HORARIO');
      qyVerificaConflitoHorarios.ParamByName('CD_HORARIO').AsInteger := cd_horario;
      qyVerificaConflitoHorarios.Open();
      hr_inicio := qyVerificaConflitoHorarios.FieldByName('hr_inicio').AsDateTime;
      hr_fim := qyVerificaConflitoHorarios.FieldByName('hr_fim').AsDateTime;

      qyVerificaConflitoHorarios.Close();
      qyVerificaConflitoHorarios.SQL.Clear();
        
      qyVerificaConflitoHorarios.SQL.Add('SELECT cd_cronograma, DC.turma, d.descricao');
      qyVerificaConflitoHorarios.SQL.Add('FROM DIARIO_CRONOGRAMAS DC');
      qyVerificaConflitoHorarios.SQL.Add('     INNER JOIN HORARIOS H ON (H.CODIGO = DC.CD_HORARIO)');
      qyVerificaConflitoHorarios.SQL.Add('     LEFT JOIN TURMAS T ON (DC.TURMA = T.CODIGO) AND (DC.ANOSEMESTRE = T.ANOSEMESTRE)');
      qyVerificaConflitoHorarios.SQL.Add('     LEFT JOIN disciplinas d ON (d.codigo = DC.disciplina) AND (T.CURSO = d.CURSO)');
      qyVerificaConflitoHorarios.SQL.Add('WHERE DC.CD_PROFESSOR = :CD_PROFESSOR AND');

      if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
      begin
         qyVerificaConflitoHorarios.SQL.Add('      DC.TURMA || DC.ANOSEMESTRE || DC.DISCIPLINA != :CD_TURMA || :NR_ANOSEMESTRE || :CD_DISCIPLINA AND');
         qyVerificaConflitoHorarios.SQL.Add('      (TO_TIMESTAMP(DC.dt_cronograma, '+QuotedStr('YYY-MM-DD')+') = TO_TIMESTAMP(:DT_CRONOGRAMA, '+QuotedStr('YYY-MM-DD')+')) AND');
      end
      else
      begin
         qyVerificaConflitoHorarios.SQL.Add('      CONCAT(DC.TURMA, DC.ANOSEMESTRE, DC.DISCIPLINA) != CONCAT(:CD_TURMA, :NR_ANOSEMESTRE, :CD_DISCIPLINA) AND');
         qyVerificaConflitoHorarios.SQL.Add('      (DATE_FORMAT(DC.dt_cronograma, '+QuotedStr('%d/%m/%Y')+') = DATE_FORMAT(:DT_CRONOGRAMA, '+QuotedStr('%d/%m/%Y')+')) AND');
      end;

      qyVerificaConflitoHorarios.SQL.Add('      ((:HORA_INICIO >= h.hr_inicio AND :HORA_INICIO <= h.hr_fim) OR');
      qyVerificaConflitoHorarios.SQL.Add('      (:HORA_FIM >= h.hr_inicio AND :HORA_FIM <= h.hr_fim)) LIMIT 1');

      qyVerificaConflitoHorarios.ParamByName('CD_PROFESSOR').AsInteger := cd_professor;
      qyVerificaConflitoHorarios.ParamByName('CD_TURMA').AsString := cd_turma;
      qyVerificaConflitoHorarios.ParamByName('NR_ANOSEMESTRE').AsInteger := nr_anosemestre;
      qyVerificaConflitoHorarios.ParamByName('CD_DISCIPLINA').AsInteger := cd_disciplina;
      qyVerificaConflitoHorarios.ParamByName('DT_CRONOGRAMA').AsDateTime := data;
      qyVerificaConflitoHorarios.ParamByName('HORA_INICIO').AsTime := hr_inicio;
      qyVerificaConflitoHorarios.ParamByName('HORA_FIM').AsTime := hr_fim;

      qyVerificaConflitoHorarios.Open();

      if qyVerificaConflitoHorarios.RecordCount > 0 then
      begin
          msg := qyVerificaConflitoHorarios.FieldByName('turma').asString + ' / ' + qyVerificaConflitoHorarios.FieldByName('descricao').asString;
      end;

      Result := msg;

      
end;

procedure TfrmAulasProvasAcoes.ExcluirTurmasProfessor(const cd_cronograma: Integer);
var
   qyTurmasProfessores: TUMZQuery;
   cd_turmaprofessor, numeroaulas: Integer;
   bRemoverTurmaProfessor: Boolean;
begin
   DM.CriarConsulta( qyTurmasProfessores );

   with qyTurmasProfessores do
   begin
      Close;
      SQL.Clear;

      SQL.Add( ' SELECT tp.cd_turmaprofessor, tp.numeroaulas ' );
      SQL.Add( ' FROM diario_cronogramas dc ' );
      SQL.Add( '      INNER JOIN turmasprofessores tp ON (tp.anosemestre = dc.anosemestre AND tp.turma = dc.turma AND tp.professor = dc.cd_professor AND tp.disciplina = dc.disciplina) ' );
      SQL.Add( ' WHERE dc.cd_cronograma = :cd_cronograma ' );

      ParamByName( 'cd_cronograma' ).AsInteger := cd_cronograma;

      Open;

      cd_turmaprofessor := FieldByName('cd_turmaprofessor').AsInteger;
      numeroaulas := FieldByName('numeroaulas').AsInteger;

      Close();
      SQL.Clear();
      if numeroaulas > 1 then
      begin
         SQL.Add('UPDATE turmasprofessores SET numeroaulas = numeroaulas-1 WHERE cd_turmaprofessor = :cd_turmaprofessor');
         ParamByName('cd_turmaprofessor').AsInteger := cd_turmaprofessor;
         ExecSQL();
      end else begin
         SQL.Add('SELECT cd_turmasprofessores FROM ple_turmasprofessores WHERE cd_turmasprofessores = :cd_turmasprofessores');
         ParamByName('cd_turmasprofessores').AsInteger := cd_turmaprofessor;
         Open();

         { Se não existir plano de ensino }
         if RecordCount = 0 then
         begin
            Close();
            SQL.Clear();
            SQL.Add('SELECT cd_turmaprofessor FROM avl_pesquisas_enviadas WHERE cd_turmaprofessor = :cd_turmaprofessor');
            ParamByName('cd_turmaprofessor').AsInteger := cd_turmaprofessor;
            Open();

            // Esse parametro indica se deve remover professor que não possuem mais aulas, através da planilha de cronograma
            bRemoverTurmaProfessor := DM.variavel_parametro('planilha_cronogramas_remover_prof') = '1';

            { Se não existir avaliações }
            if (RecordCount = 0) and bRemoverTurmaProfessor then
            begin
               Close();
               SQL.Clear();
               SQL.Add('DELETE FROM turmasprofessores WHERE cd_turmaprofessor = :cd_turmaprofessor');
               ParamByName('cd_turmaprofessor').AsInteger := cd_turmaprofessor;
               ExecSQL();
            end;
         end;
      end;
   end;
end;

procedure TfrmAulasProvasAcoes.ExecutaCalculoFreq;
var
   Freq2: TRecFreq;
begin
   if (Length(sPAnoSem) > 0) and (Length(sPCurso) > 0) and (Length(sPBim) > 0) then
   begin
      Application.CreateForm(TfrmProg, frmProg);
      frmProg.NovaBarra('Cálculo de Frequencia!');
      frmProg.SetMin(1);
      frmProg.SetMax(2);
      frmProg.SetAtual(1);
      Freq2 := TRecFreq.Create();
      Freq2.AjustarFrequencia(sPAnoSem, sPCurso, sPTurma, sPDisciplina, sPBim, IntToStr(sPGrupo));
      frmProg.FechaBarra();
      FreeAndNil(frmProg);
      FreeAndNil(Freq2);
   end;
end;

procedure TfrmAulasProvasAcoes.verificaUnicoProfessorDisciplina;
const
   MSG_PERGUNTA_SELECIONAR_UNICO_PROFESSOR =
      'A disciplina selecionada possui somente um professor, ' + #13 +
      'deseja filtrar o professor(a) %s?';
var
   qyBuscaProfessores: TUMZQuery;
   disciplina : String;
   objTurma : TTurma;
   objSalaPadrao : TSala;
begin
   try
      if cbDisciplinas.ItemIndex <> -1 then
         disciplina := TItemCombo(cbDisciplinas.Items.Objects[cbDisciplinas.ItemIndex]).getCodigo
      else
         disciplina := '0';

      if (trim(disciplina) <> '') AND (strtoint(disciplina) > 0) then
      begin
         { Verifica se a disciplina possui somente um professor, caso possua, traz ele filtrado }
         DM.CriarConsulta( qyBuscaProfessores );

         with qyBuscaProfessores do
         begin
            SQL.Add( ' SELECT p.cd_pessoa, p.nm_pessoa, us.id as cd_sala, COALESCE(us.ds_sala, tp.ds_sala) AS ds_sala ' );
            SQL.Add( ' FROM turmasprofessores tp ' );
            SQL.Add( '      INNER JOIN pessoas p ON (p.cd_pessoa = tp.professor) ' );
            SQL.Add( '      LEFT JOIN unim_sala us ON (us.id = tp.cd_sala) ' );
            SQL.Add( ' WHERE tp.anosemestre = :anosemestre AND ' );
            SQL.Add( '       tp.curso = :curso AND  ' );
            SQL.Add( '       tp.turma = :turma AND  ' );
            SQL.Add( '       tp.disciplina = :disciplina ' );

            ParamByName( 'anosemestre' ).AsInteger := StrToInt(sCronogramaAnoSem);
            ParamByName( 'curso' ).AsString := sCronogramaCurso;
            ParamByName( 'turma' ).AsString := sCronogramaTurma;
            ParamByName( 'disciplina' ).AsInteger := strtoint(disciplina);

            Open();
         end;

         if qyBuscaProfessores.RecordCount = 1 then
         begin
            if (Mensagem(Format(MSG_PERGUNTA_SELECIONAR_UNICO_PROFESSOR, [qyBuscaProfessores.FieldByName('nm_pessoa').AsString]),
                  'Filtro de professor', MB_OKCANCEL + MB_ICONQUESTION, Handle) = mrOk) then
            begin
               txtCronogramasProfessor.Text := qyBuscaProfessores.FieldByName('cd_pessoa').AsString;
               txtSubstituto.Text := qyBuscaProfessores.FieldByName('cd_pessoa').AsString;
            end
            else
            begin
               txtSubstituto.Text := '';
            end;
         end;

         { Se a sala ainda não foi preenchida, vamos tentar carregar a sala da Turma }
         objTurma := TTurma.Create(sCronogramaTurma, StrToInt(sCronogramaAnoSem));
         objSalaPadrao := objTurma.GetSalaAutomatico(
            StrToInt(disciplina),
            qyBuscaProfessores.FieldByName('cd_pessoa').AsInteger
         );

         if objSalaPadrao <> nil then
         begin
            edNomeSala.Text := objSalaPadrao.Descricao;
            edNomeSala.Tag := objSalaPadrao.Codigo;
         end else begin
            edNomeSala.Text := '';
            edNomeSala.Tag  := 0;
         end;
      end;

   except
      { Sem excessão, somente não busca um professor padrão }
   end;
end;

procedure TfrmAulasProvasAcoes.VincularAulaTurmasHorarios(
  const cd_diario_aula, qtd_aulas: Integer; const reiniciar : Boolean);
const
   SQL_ZERAR_HORARIOS_AULA_TURMA = 'DELETE FROM diario_aulas_turmas_horarios WHERE cd_diario_aula = :cd_diario_aula';

   SQL_HORARIOS_COMPATIVEIS_AULA =
      ' SELECT ' +
      '    thc.cd_turmas_horarios, '+
	   '    da.data ' +
      ' FROM '+
      '    diario_aulas da '+
      '    INNER JOIN turmas_horarios_config thc ON ( '+
      '       thc.nr_anosemestre = da.anosemestre '+
      '       AND thc.cd_turma = da.turma '+
      '       AND thc.cd_disciplina = da.disciplina '+
      '       AND CASE WHEN thc.cd_professor > 0 THEN thc.cd_professor = da.cd_professor ELSE 1=1 END '+   
      '       AND thc.nr_dia_semana = DAYOFWEEK(da.data) '+
      '       AND IS_HORARIO_TURMA_ATIVA (da.data, thc.dt_inicial, thc.dt_final, thc.sn_ativo)=1 '+
      '    ) '+
      '    INNER JOIN horarios h ON ( '+
      '       h.codigo = thc.cd_horario '+
      '    ) '+
      ' WHERE '+
	   '    da.cd_diario_aula = :cd_diario_aula '+
      ' ORDER BY '+
      '    h.hr_inicio ';

   SQL_HORARIO_VINCULADO =
      ' SELECT ' +
	   '    dth.cd_turma_horario ' +
      ' FROM ' +
	   '    diario_aulas_turmas_horarios dth ' +
	   '    INNER JOIN diario_aulas da ON ( da.cd_diario_aula = dth.cd_diario_aula ) ' +
      ' WHERE ' +
      '    dth.cd_turma_horario = :cd_turma_horario AND ' +
	   '    da.data = :data ';

   SQL_VINCULAR_HORARIO_AULA =
      ' INSERT INTO diario_aulas_turmas_horarios (cd_diario_aula, cd_turma_horario) VALUES (:cd_diario_aula, :cd_turma_horario) ';

   SQL_CORRIGIR_FREQUENCIAS_ALUNOS =
      ' UPDATE diario_aulas da '+
      '        INNER JOIN diario_aulas_alunos daa ON ( ' +
      '           daa.cd_turma = da.turma AND daa.nr_anosem = da.anosemestre AND ' +
      '           daa.cd_disciplina = da.disciplina AND daa.cd_bimestre = da.bimestre AND ' +
      '           daa.nr_aula = da.nro_aula ' +
      '        ) ' +
      ' SET daa.ds_freq = LEFT(daa.ds_freq, da.qtd_aulas) ' +
      ' WHERE da.cd_diario_aula = :cd_diario_aula AND ' +
      '       da.qtd_aulas < LENGTH(daa.ds_freq) ';
var
   qyInsereTurmaHorarioAula : TUMZQuery;
   qyHorariosCompativeis    : TUMZQuery;
   qyHorarioVinculado       : TUMZQuery;
   totalAulasVincular       : Integer;
begin
   DM.CriarConsulta(qyInsereTurmaHorarioAula);
   DM.CriarConsulta(qyHorariosCompativeis);
   DM.CriarConsulta(qyHorarioVinculado);

   { Zerar os horários existentes da turma, caso necessário }
   if reiniciar then
   begin
      qyInsereTurmaHorarioAula.SQL.Text := SQL_ZERAR_HORARIOS_AULA_TURMA;
      qyInsereTurmaHorarioAula.ParamByName('cd_diario_aula').AsInteger := cd_diario_aula;
      qyInsereTurmaHorarioAula.ExecSQL();
   end;

   // Inicia o númro de aulas que se deve vincular
   totalAulasVincular := qtd_aulas;

   { Busca os TODOS horários que são compatíveis com a aula
     (incluíndo horários já ligado a aulas ou ainda não ligados) }
   qyHorariosCompativeis.SQL.Text := SQL_HORARIOS_COMPATIVEIS_AULA;
   qyHorariosCompativeis.ParamByName('cd_diario_aula').AsInteger := cd_diario_aula;
   qyHorariosCompativeis.Open;

   // Varre os horários compatíveis com a aula
   //    (até acabarem os horários OU não precisar mais vincular a aula a nenhum horário) 
   while not qyHorariosCompativeis.Eof AND (totalAulasVincular > 0) do
   begin
      // Verifica para cada horário/data se o mesmo já está ocupado (vinculado a  outra aula)
      qyHorarioVinculado.Close;
      qyHorarioVinculado.SQL.Text := SQL_HORARIO_VINCULADO;
      qyHorarioVinculado.ParamByName('cd_turma_horario').AsInteger := qyHorariosCompativeis.FieldByName('cd_turmas_horarios').AsInteger;
      qyHorarioVinculado.ParamByName('data').AsDateTime := qyHorariosCompativeis.FieldByName('data').AsDateTime;
      qyHorarioVinculado.Open;

      // Verifica se o horário NÃO está sendo usado (horário SEM vinculo com aulas, livre)
      if qyHorarioVinculado.Eof then
      begin
         // Vincula o horário a aula
        qyInsereTurmaHorarioAula.Close;
        qyInsereTurmaHorarioAula.SQL.Text := SQL_VINCULAR_HORARIO_AULA;
        qyInsereTurmaHorarioAula.ParamByName('cd_diario_aula').AsInteger := cd_diario_aula;
        qyInsereTurmaHorarioAula.ParamByName('cd_turma_horario').AsInteger := qyHorariosCompativeis.FieldByName('cd_turmas_horarios').AsInteger;
        qyInsereTurmaHorarioAula.ExecSQL();

        // Uma aula já foi vinculada (diminui o total que se deve vincular)
        totalAulasVincular := totalAulasVincular-1;
      end;

      qyHorariosCompativeis.Next;
   end;

   { Corrige as frequências dos alunos quando a quantidade de aulas é alterada }
   qyInsereTurmaHorarioAula.SQL.Text := SQL_CORRIGIR_FREQUENCIAS_ALUNOS;
   qyInsereTurmaHorarioAula.ParamByName('cd_diario_aula').AsInteger := cd_diario_aula;
   qyInsereTurmaHorarioAula.ExecSQL();

   FreeAndNil(qyInsereTurmaHorarioAula);
   FreeAndNil(qyHorariosCompativeis);
   FreeAndNil(qyHorarioVinculado);
end;

{ TProfessor }

constructor TProfessor.Create(const AICodigo: integer; const ASNome: string);
begin
   Self.FICodigo := AICodigo;
   Self.FSNome := ASNome;
end;

{ TProva }

constructor TProva.Create(const ASAssunto, ASChave: string;
  AProfessor: TProfessor);
begin
   Self.FSAssunto    := ASAssunto;
   Self.FSChave      := ASChave;
   Self.FProfessor   := AProfessor;                                                                                                                         
end;

destructor TProva.Destroy;
begin
   inherited;
end;

{ TTipoProva }

constructor TTipoProva.Create(const AICodigo: integer; const ASNome: string);
begin
   Self.FICodigo := AICodigo;
   Self.FSNome := ASNome;
end;

{ TSituacaoLogistica }

constructor TSituacaoLogistica.Create(const ICodigo, IAuxiliar: Integer; const SDescricao: String);
begin
   Self.FICodigo := ICodigo;
   Self.FIAuxiliar := IAuxiliar;
   Self.FSDescricao := SDescricao;
end;

end.
