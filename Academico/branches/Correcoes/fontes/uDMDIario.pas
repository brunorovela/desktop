unit uDMDIARIO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBDatabase, IBCustomDataSet, IBTable, IBQuery, IBUpdateSQL,
  ZConnection, IBStoredProc, IBSQL, IBEvents, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset,
  ZSqlUpdate;


const
  { Constantes de ações possíveis nos LOGs do diário }
  ACAO_ACESSO    = 0;
  ACAO_INCLUSAO  = 1;
  ACAO_EXCLUSAO  = 2;
  ACAO_ALTERACAO = 3;
  { Constantes de atividades existentes nos LOGs do diário }
  ATIVIDADE_ACESSO             = 0;
  ATIVIDADE_AULA               = 1;
  ATIVIDADE_NOTA               = 2;
  ATIVIDADE_MEDIA              = 3;
  ATIVIDADE_CONCEITO           = 4;
  ATIVIDADE_EXAME              = 5;
  ATIVIDADE_PARECER_DESCRITIVO = 6;
  ATIVIDADE_PROVA              = 7;
  ATIVIDADE_FREQUENCIA         = 8;
  ATIVIDADE_EXTRA_CLASSE       = 9;
  ATIVIDADE_SEGUNDA_EPOCA      = 10;
  ATIVIDADE_ATIVIDADE          = 11;
  ATIVIDADE_CRONOGRAMA         = 12;  

type
  TDMDIARIO = class(TDataModule)
    qTurmas: TUMZQuery;
    dsTurmas: TDataSource;
    qNotas: TUMZQuery;
    dsNotas: TDataSource;
    qProvas: TUMZQuery;
    dsProvas: TDataSource;
    qProvasDISCIPLINA: TIntegerField;
    qProvasTURMA: TStringField;
    qProvasNRO_NOTA: TSmallintField;
    qProvasASSUNTO: TStringField;
    qNotasCODALUNO: TIntegerField;
    qNotasNOME: TStringField;
    qNotasDISCIPLINA: TIntegerField;
    qNotasTURMA: TStringField;
    qNotasNOTA1: TFloatField;
    qNotasNOTA2: TFloatField;
    qNotasNOTA3: TFloatField;
    qNotasNOTA4: TFloatField;
    qNotasNOTA5: TFloatField;
    qNotasNOTA6: TFloatField;
    qNotasNOTA7: TFloatField;
    qNotasNOTA8: TFloatField;
    qNotasNOTA9: TFloatField;
    qNotasNOTA10: TFloatField;
    IBSQL1: TUMZQuery;
    qAulas: TUMZQuery;
    dsAulas: TDataSource;
    qInsereAula: TUMZQuery;
    qFrequencia: TUMZQuery;
    dsFrequencia: TDataSource;
    qFrequenciaCODALUNO: TIntegerField;
    qFrequenciaDISCIPLINA: TIntegerField;
    qFrequenciaTURMA: TStringField;
    qFrequenciaNOME: TStringField;
    qTotalFaltas: TUMZQuery;
    dsAlunos: TDataSource;
    qAlunos: TUMZQuery;
    qAlunosCODALUNO: TIntegerField;
    qAlunosDISCIPLINA: TIntegerField;
    qAlunosTURMA: TStringField;
    qFicha: TUMZQuery;
    dsFicha: TDataSource;
    qFichaCODALUNO: TIntegerField;
    qFichaDISCIPLINA: TIntegerField;
    qFichaTURMA: TStringField;
    qFichaNOTA1: TFloatField;
    qFichaNOTA2: TFloatField;
    qFichaNOTA3: TFloatField;
    qFichaNOTA4: TFloatField;
    qFichaFALTAS: TSmallintField;
    qFichaNOME: TStringField;
    qFichaMedia: TFloatField;
    GravaFaltas: TUMZQuery;
    qFichaFALTAS_BIM: TSmallintField;
    qDarPresenca: TUMZQuery;
    qNotasANOSEMESTRE: TSmallintField;
    qProvasANOSEMESTRE: TSmallintField;
    qFrequenciaANOSEMESTRE: TSmallintField;
    qFrequenciaNOTA1: TFloatField;
    qFrequenciaNOTA2: TFloatField;
    qFrequenciaNOTA3: TFloatField;
    qFrequenciaNOTA4: TFloatField;
    qFrequenciaNOTA5: TFloatField;
    qFrequenciaNOTA6: TFloatField;
    qFrequenciaNOTA7: TFloatField;
    qFrequenciaNOTA8: TFloatField;
    qFrequenciaNOTA9: TFloatField;
    qFrequenciaNOTA10: TFloatField;
    qFichaANOSEMESTRE: TSmallintField;
    qAlunosANOSEMESTRE: TSmallintField;
    qNotasAJUSTE: TFloatField;
    qAlunosDATA_SAIDA: TDateField;
    qRetirarPresenca: TUMZQuery;
    qFichaNotaExame: TFloatField;
    qAlunosNOME: TStringField;
    qTurmasANOSEMESTRE: TSmallintField;
    qTurmasDISCIPLINA: TIntegerField;
    qTurmasBIMESTRE: TSmallintField;
    qTurmasPROFESSOR: TIntegerField;
    qTurmasCURSO: TStringField;
    qTurmasDATAENTREGA: TDateTimeField;
    qTurmasFormula_Media: TStringField;
    qTurmasDESCRICAO: TStringField;
    qAulasTURMA: TStringField;
    qAulasANOSEMESTRE: TSmallintField;
    qAulasDISCIPLINA: TIntegerField;
    qAulasBIMESTRE: TSmallintField;
    qAulasNRO_AULA: TSmallintField;
    qAulasDATA: TDateTimeField;
    qAulasQTD_AULAS: TSmallintField;
    qAulasCONTEUDO: TMemoField;
    qTurmasTURMA: TStringField;
    qTurmasDSCURSO: TStringField;
    qProvasDATA: TDateTimeField;
    qNotasSITUACAO: TSmallintField;
    qFrequenciaSITUACAO: TSmallintField;
    updAlunos: TZUpdateSQL;
    updNotas: TZUpdateSQL;
    qNotasBIMESTRE: TSmallintField;
    updFreq: TZUpdateSQL;
    qFrequenciabimestre: TSmallintField;
    qFrequenciaajuste: TFloatField;
    qDescricoes: TUMZQuery;
    dsDescricoes: TDataSource;
    updDescricoes: TZUpdateSQL;
    qDescricoesNOME: TStringField;
    qDescricoesnr_anosemestre: TSmallintField;
    qDescricoescd_turma: TStringField;
    qDescricoesnr_disciplina: TIntegerField;
    qDescricoescd_pessoa: TIntegerField;
    qDescricoesnr_avaliacao: TSmallintField;
    qDescricoesds_avaliacao: TMemoField;
    qyAux1: TUMZQuery;
    qyAux2: TUMZQuery;
    qNotasnota_especial: TFloatField;
    qProvassn_especial: TSmallintField;
    qNotasnota11: TFloatField;
    qNotasnota12: TFloatField;
    qNotasnota13: TFloatField;
    qNotasnota14: TFloatField;
    qNotasnota15: TFloatField;
    qNotasnota16: TFloatField;
    qNotasnota17: TFloatField;
    qNotasnota18: TFloatField;
    qNotasnota19: TFloatField;
    qNotasnota20: TFloatField;
    qNotasNOTA_D1: TFloatField;
    qNotasNOTA_D2: TFloatField;
    qNotasNOTA_D3: TFloatField;
    qNotasNOTA_D4: TFloatField;
    qNotasNOTA_D5: TFloatField;
    qNotasNOTA_D6: TFloatField;
    qNotasNOTA_D7: TFloatField;
    qNotasNOTA_D8: TFloatField;
    qNotasNOTA_D9: TFloatField;
    qNotasNOTA_D10: TFloatField;
    qNotasNR_ALUNO: TIntegerField;
    qFrequenciaturmamatricula: TStringField;
    qNotasnota21: TFloatField;
    qNotasnota22: TFloatField;
    qNotasnota23: TFloatField;
    qNotasnota24: TFloatField;
    qNotasnota25: TFloatField;
    qNotasMEDIA_SEM_AJUSTE: TFloatField;
    qDiaLog: TUMZQuery;
    qNotasFALTAS: TBytesField;
    qFrequenciaFALTAS: TBytesField;
    qFrequenciaFREQ1: TBytesField;
    qFrequenciaFREQ2: TBytesField;
    qFrequenciaFREQ3: TBytesField;
    qFrequenciaFREQ4: TBytesField;
    qFrequenciaFREQ5: TBytesField;
    qFrequenciaFREQ6: TBytesField;
    qFrequenciaFREQ7: TBytesField;
    qFrequenciaFREQ8: TBytesField;
    qFrequenciaFREQ9: TBytesField;
    qFrequenciaFREQ10: TBytesField;
    qFrequenciaFREQ11: TBytesField;
    qFrequenciaFREQ12: TBytesField;
    qFrequenciaFREQ13: TBytesField;
    qFrequenciaFREQ14: TBytesField;
    qFrequenciaFREQ15: TBytesField;
    qFrequenciaFREQ16: TBytesField;
    qFrequenciaFREQ17: TBytesField;
    qFrequenciaFREQ18: TBytesField;
    qFrequenciaFREQ19: TBytesField;
    qFrequenciaFREQ20: TBytesField;
    qFrequenciaFREQ21: TBytesField;
    qFrequenciaFREQ22: TBytesField;
    qFrequenciaFREQ23: TBytesField;
    qFrequenciaFREQ24: TBytesField;
    qFrequenciaFREQ25: TBytesField;
    qFrequenciaFREQ26: TBytesField;
    qFrequenciaFREQ27: TBytesField;
    qFrequenciaFREQ28: TBytesField;
    qFrequenciaFREQ29: TBytesField;
    qFrequenciaFREQ30: TBytesField;
    qFrequenciaFREQ31: TBytesField;
    qFrequenciaFREQ32: TBytesField;
    qFrequenciaFREQ33: TBytesField;
    qFrequenciaFREQ34: TBytesField;
    qFrequenciaFREQ35: TBytesField;
    qFrequenciaFREQ36: TBytesField;
    qFrequenciaFREQ37: TBytesField;
    qFrequenciaFREQ38: TBytesField;
    qFrequenciaFREQ39: TBytesField;
    qFrequenciaFREQ40: TBytesField;
    qFrequenciaFREQ41: TBytesField;
    qFrequenciaFREQ42: TBytesField;
    qFrequenciaFREQ43: TBytesField;
    qFrequenciaFREQ44: TBytesField;
    qFrequenciaFREQ45: TBytesField;
    qFrequenciaFREQ46: TBytesField;
    qFrequenciaFREQ47: TBytesField;
    qFrequenciaFREQ48: TBytesField;
    qFrequenciaFREQ49: TBytesField;
    qFrequenciaFREQ50: TBytesField;
    qFrequenciaMEDIA: TBytesField;
    qFrequenciaNOTA13: TFloatField;
    qFrequenciaFREQ51: TBytesField;
    qFrequenciaFREQ52: TBytesField;
    qFrequenciaFREQ53: TBytesField;
    qFrequenciaFREQ54: TBytesField;
    qFrequenciaFREQ55: TBytesField;
    qFrequenciaFREQ56: TBytesField;
    qFrequenciaFREQ57: TBytesField;
    qFrequenciaFREQ58: TBytesField;
    qFrequenciaFREQ59: TBytesField;
    qFrequenciaFREQ60: TBytesField;
    qFrequenciaFREQ61: TBytesField;
    qFrequenciaFREQ62: TBytesField;
    qFrequenciaFREQ63: TBytesField;
    qFrequenciaFREQ64: TBytesField;
    qFrequenciaFREQ65: TBytesField;
    qFrequenciaFREQ66: TBytesField;
    qFrequenciaFREQ67: TBytesField;
    qFrequenciaFREQ68: TBytesField;
    qFrequenciaFREQ69: TBytesField;
    qFrequenciaFREQ70: TBytesField;
    qFrequenciaFREQ71: TBytesField;
    qFrequenciaFREQ72: TBytesField;
    qFrequenciaFREQ73: TBytesField;
    qFrequenciaFREQ74: TBytesField;
    qFrequenciaFREQ75: TBytesField;
    qFrequenciaFREQ76: TBytesField;
    qFrequenciaFREQ77: TBytesField;
    qFrequenciaFREQ78: TBytesField;
    qFrequenciaFREQ79: TBytesField;
    qFrequenciaFREQ80: TBytesField;
    qFrequenciaFREQ81: TBytesField;
    qFrequenciaFREQ82: TBytesField;
    qFrequenciaFREQ83: TBytesField;
    qFrequenciaFREQ84: TBytesField;
    qFrequenciaFREQ85: TBytesField;
    qFrequenciaFREQ86: TBytesField;
    qFrequenciaFREQ87: TBytesField;
    qFrequenciaFREQ88: TBytesField;
    qFrequenciaFREQ89: TBytesField;
    qFrequenciaFREQ90: TBytesField;
    qFrequenciaFREQ91: TBytesField;
    qFrequenciaFREQ92: TBytesField;
    qFrequenciaFREQ93: TBytesField;
    qFrequenciaFREQ94: TBytesField;
    qFrequenciaFREQ95: TBytesField;
    qFrequenciaFREQ96: TBytesField;
    qFrequenciaFREQ97: TBytesField;
    qFrequenciaFREQ98: TBytesField;
    qFrequenciaFREQ99: TBytesField;
    qFrequenciaFREQ100: TBytesField;
    qNotasFREQ1: TBytesField;
    qNotasFREQ2: TBytesField;
    qNotasFREQ3: TBytesField;
    qNotasFREQ4: TBytesField;
    qNotasFREQ5: TBytesField;
    qNotasFREQ6: TBytesField;
    qNotasFREQ7: TBytesField;
    qNotasFREQ8: TBytesField;
    qNotasFREQ9: TBytesField;
    qNotasFREQ10: TBytesField;
    qNotasFREQ11: TBytesField;
    qNotasFREQ12: TBytesField;
    qNotasFREQ13: TBytesField;
    qNotasFREQ14: TBytesField;
    qNotasFREQ15: TBytesField;
    qNotasFREQ16: TBytesField;
    qNotasFREQ17: TBytesField;
    qNotasFREQ18: TBytesField;
    qNotasFREQ19: TBytesField;
    qNotasFREQ20: TBytesField;
    qNotasFREQ21: TBytesField;
    qNotasFREQ22: TBytesField;
    qNotasFREQ23: TBytesField;
    qNotasFREQ24: TBytesField;
    qNotasFREQ25: TBytesField;
    qNotasFREQ26: TBytesField;
    qNotasFREQ27: TBytesField;
    qNotasFREQ28: TBytesField;
    qNotasFREQ29: TBytesField;
    qNotasFREQ30: TBytesField;
    qNotasFREQ31: TBytesField;
    qNotasFREQ32: TBytesField;
    qNotasFREQ33: TBytesField;
    qNotasFREQ34: TBytesField;
    qNotasFREQ35: TBytesField;
    qNotasFREQ36: TBytesField;
    qNotasFREQ37: TBytesField;
    qNotasFREQ38: TBytesField;
    qNotasFREQ39: TBytesField;
    qNotasFREQ40: TBytesField;
    qNotasFREQ41: TBytesField;
    qNotasFREQ42: TBytesField;
    qNotasFREQ43: TBytesField;
    qNotasFREQ44: TBytesField;
    qNotasFREQ45: TBytesField;
    qNotasFREQ46: TBytesField;
    qNotasFREQ47: TBytesField;
    qNotasFREQ48: TBytesField;
    qNotasFREQ49: TBytesField;
    qNotasFREQ50: TBytesField;
    qNotasFREQ51: TBytesField;
    qNotasFREQ52: TBytesField;
    qNotasFREQ53: TBytesField;
    qNotasFREQ54: TBytesField;
    qNotasFREQ55: TBytesField;
    qNotasFREQ56: TBytesField;
    qNotasFREQ57: TBytesField;
    qNotasFREQ58: TBytesField;
    qNotasFREQ59: TBytesField;
    qNotasFREQ60: TBytesField;
    qNotasFREQ61: TBytesField;
    qNotasFREQ62: TBytesField;
    qNotasFREQ63: TBytesField;
    qNotasFREQ64: TBytesField;
    qNotasFREQ65: TBytesField;
    qNotasFREQ66: TBytesField;
    qNotasFREQ67: TBytesField;
    qNotasFREQ68: TBytesField;
    qNotasFREQ69: TBytesField;
    qNotasFREQ70: TBytesField;
    qNotasFREQ71: TBytesField;
    qNotasFREQ72: TBytesField;
    qNotasFREQ73: TBytesField;
    qNotasFREQ74: TBytesField;
    qNotasFREQ75: TBytesField;
    qNotasFREQ76: TBytesField;
    qNotasFREQ77: TBytesField;
    qNotasFREQ78: TBytesField;
    qNotasFREQ79: TBytesField;
    qNotasFREQ80: TBytesField;
    qNotasFREQ81: TBytesField;
    qNotasFREQ82: TBytesField;
    qNotasFREQ83: TBytesField;
    qNotasFREQ84: TBytesField;
    qNotasFREQ85: TBytesField;
    qNotasFREQ86: TBytesField;
    qNotasFREQ87: TBytesField;
    qNotasFREQ88: TBytesField;
    qNotasFREQ89: TBytesField;
    qNotasFREQ90: TBytesField;
    qNotasFREQ91: TBytesField;
    qNotasFREQ92: TBytesField;
    qNotasFREQ93: TBytesField;
    qNotasFREQ94: TBytesField;
    qNotasFREQ95: TBytesField;
    qNotasFREQ96: TBytesField;
    qNotasFREQ97: TBytesField;
    qNotasFREQ98: TBytesField;
    qNotasFREQ99: TBytesField;
    qNotasMEDIA: TFloatField;
    qProvasds_avaliacao: TStringField;
    qProvasds_chave: TStringField;
    qProvassn_proficiencia: TSmallintField;
    qProvassn_compoe: TSmallintField;
    qProvasDS_NOTA: TStringField;
    qProvasds_chave_tipo: TStringField;
    qNotasTotalFaltas: TFloatField;
    qFichaTotalFaltas: TFloatField;
    qTurmasNOME: TStringField;
    qTurmasGRUPO: TStringField;
    qAlunosSITUACAO: TStringField;
    qTurmasCD_GRUPO: TIntegerField;
    qDescricoessituacao: TStringField;
    qDescricoesativo: TLargeintField;
    qProvasvl_peso: TFloatField;
    qProvasid_atividade_moodle: TLargeintField;
    procedure qProvasid_atividade_moodleGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure dsTurmasDataChange(Sender: TObject; Field: TField);
    procedure dsDescricoesDataChange(Sender: TObject; Field: TField);
    procedure qProvasCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qNotasCalcFields(DataSet: TDataSet);
    procedure qNotasBeforeOpen(DataSet: TDataSet);


    procedure qNotasBeforeInsert(DataSet: TDataSet);
    procedure qAulasAfterInsert(DataSet: TDataSet);
    procedure qFrequenciaCalcFields(DataSet: TDataSet);
    procedure qTurmasFORMULA_MEDIAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure qProvasAfterInsert(DataSet: TDataSet);
    procedure qFichaNOTA1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qFichaMediaGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qNotasMEDIAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qNotasAJUSTEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qNotasBeforePost(DataSet: TDataSet);
    procedure qNotasNOTA1GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qNotasNOMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qFrequenciaNOMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qAulasNewRecord(DataSet: TDataSet);
    procedure qFichaNotaExameGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qAlunosSITUACAOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qNotasAfterPost(DataSet: TDataSet);
    procedure qFrequenciaAfterPost(DataSet: TDataSet);
    function html_entity_decode(AStr: String): String;    
  private
    { Private declarations }
  public
      arrNotasMaxima, arrNotasMinima: TStringList;

    // Variável que grava log de acesso ao diário
    dia_log_codigo_acesso : Integer;

    function verificaValorNota(nr_anosemestre: Integer;
  cd_turma: String; cd_disciplina, nr_bimestre: Integer; vl_nota: Real; nr_nota: Integer; mostra_msg: Boolean = True) : boolean;

   function getFormulaTurma( nr_anosemestre: Integer; cd_turma: String; cd_disciplina, nr_etapa, cd_grupo: Integer  ): String;

   function inserirLog(acao : Integer; atividade : Integer; descricao : String; cd_professor : Integer = 0): Integer;

   procedure inserirLogAcesso();
    { Public declarations }
  end;

var
  DMDiario: TDMDiario;
  CalculaFaltas : Boolean;

implementation

uses Udm, uDiarioView, Main, UFObservacoes;

{$R *.DFM}

{ Insere um novo log na tabela de logs e retorna o código do log inserido

  @access public

  @example $objDiaLog->inserirLog( 997455, ACAO_INCLUSAO, ATIVIDADE_AULA, '[Inclusão] Aula: 8,
                                           Data: 16/10/2009, Turma: PP2BN, Disciplina: 9274,
                                           AnoSemestre: 20092, Etapa: 2, Conteúdo: Avaliação Prática.' );

  @param  int | acao (consulte as constantes de ações definidas no topo da classe)
  @param  int | disciplina (consulte as constantes de atividades definidas no topo da classe)
  @param  str | descricao
  @param  int | cd_professor

  @return int }
function TDMDIARIO.inserirLog(acao : Integer; atividade : Integer; descricao : String; cd_professor : Integer): Integer;
begin

   qDiaLog.ParamByName('cd_pessoa').Value := DM.iCdPessoaLogado;
   qDiaLog.ParamByName('cd_acao').Value := acao;
   qDiaLog.ParamByName('cd_atividade').Value := atividade;
   qDiaLog.ParamByName('dt_log').Value := FormatDateTime('yyyy-mm-dd hh:MM:ss', DM.DataAtual);
   qDiaLog.ParamByName('descricao').Value := descricao;

   if dia_log_codigo_acesso > 0 then
      qDiaLog.ParamByName('cd_log_pai').Value := dia_log_codigo_acesso;

   if cd_professor > 0 then
      qDiaLog.ParamByName('cd_professor').Value := cd_professor
   else
      qDiaLog.ParamByName('cd_professor').Value := DM.iCdPessoaLogado;

   qDiaLog.ExecSQL;

   // Retorna o código do log inserido
   result := DM.LastInsert;
end;

{ Insere um novo log na tabela de logs e retorna o código do log inserido

  @access public

  @example $objDiaLog->inserirLog( 997455, ACAO_INCLUSAO, ATIVIDADE_AULA, '[Inclusão] Aula: 8,
                                           Data: 16/10/2009, Turma: PP2BN, Disciplina: 9274,
                                           AnoSemestre: 20092, Etapa: 2, Conteúdo: Avaliação Prática.' );

  @param  int | acao (consulte as constantes de ações definidas no topo da classe)
  @param  int | disciplina (consulte as constantes de atividades definidas no topo da classe)
  @param  str | descricao
  @param  int | cd_professor

  @return int }
procedure TDMDIARIO.inserirLogAcesso;
begin

  { Grava log de acesso ao diário }
  dia_log_codigo_acesso := DMDiario.inserirLog(uDMDiario.ACAO_ACESSO, uDMDiario.ATIVIDADE_ACESSO, 'Diário de Classes [Acadêmico]');

end;

procedure TDMDiario.qNotasBeforeInsert(DataSet: TDataSet);
begin
   Abort;
end;

procedure TDMDIARIO.qNotasBeforeOpen(DataSet: TDataSet);
begin
   // Verificar qual o parametro para digitação de notas - ORDEM

   if (DM.variavel_parametro('matriculas_apresentar_nro_aluno') <> 'S') then begin

         qNotas.SQL.Text := '' +
         ' select                              ' +
         '  A.NM_PESSOA NOME,                  ' +
         '  M.NR_ALUNO,                        ' +
         '  FI.MEDIAFINAL AS MEDIA,            ' +
         '  DM.*,                              ' +
         '  FI.NOTA_D1,                        ' +
         '  FI.NOTA_D2,                        ' +
         '  FI.NOTA_D3,                        ' +
         '  FI.NOTA_D4,                        ' +
         '  FI.NOTA_D5,                        ' +
         '  FI.NOTA_D6,                        ' +
         '  FI.NOTA_D7,                        ' +
         '  FI.NOTA_D8,                        ' +
         '  FI.NOTA_D9,                        ' +
         '  FI.NOTA_D10                        ' +
         'from                                 ' +
         '  DIARIO_MATRICULAS DM,              ' +
         '  FICHAINDIVIDUAL FI,                ' +
         '  PESSOAS A,                         ' +
         '  MATRICULAS M                       ' +         
         'WHERE                                ' +
         '  A.CD_PESSOA = DM.CODALUNO AND      ' +
         '  FI.TURMA = DM.TURMA AND            ' +
         '  FI.DISCIPLINA = DM.DISCIPLINA AND  ' +
         '  FI.ANOSEMESTRE = DM.ANOSEMESTRE AND  ' +
         '  FI.CODIGOALUNO = DM.CODALUNO AND     ' +
         '  FI.CODIGOALUNO = M.CODIGOALUNO AND   ' +
         '  FI.TURMAMATRICULA = M.TURMA AND      ' +
         '  FI.ANOSEMESTRE = M.ANOSEMESTRE AND   ' +
         '  DM.TURMA = :TURMA AND                ' +
         '  DM.DISCIPLINA = :DISCIPLINA AND      ' +
         '  BIMESTRE = :BIMESTRE AND             ' +
         '  DM.ANOSEMESTRE = :ANOSEMESTRE        ' +
         '  AND (FI.SITUACAO NOT IN (3,4,5,6,7,8,10) OR :MOSTRAR_TODOS = 1) ' + 
         'ORDER                                  ' +
         '  BY A.NM_PESSOA                       ';
   end else begin
         qNotas.SQL.Text := '' +
         ' select                              ' +
         '  A.NM_PESSOA NOME,                  ' +
         '  M.NR_ALUNO,                        ' +
         '  FI.MEDIAFINAL AS MEDIA,            ' +
         '  DM.*,                              ' +
         '  FI.NOTA_D1,                        ' +
         '  FI.NOTA_D2,                        ' +
         '  FI.NOTA_D3,                        ' +
         '  FI.NOTA_D4,                        ' +
         '  FI.NOTA_D5,                        ' +
         '  FI.NOTA_D6,                        ' +
         '  FI.NOTA_D7,                        ' +
         '  FI.NOTA_D8,                        ' +
         '  FI.NOTA_D9,                        ' +
         '  FI.NOTA_D10                        ' +
         'from                                 ' +
         '  DIARIO_MATRICULAS DM,              ' +
         '  FICHAINDIVIDUAL FI,                ' +
         '  PESSOAS A,                         ' +
         '  MATRICULAS M                       ' +         
         'WHERE                                ' +
         '  A.CD_PESSOA = DM.CODALUNO AND      ' +
         '  FI.TURMA = DM.TURMA AND            ' +
         '  FI.DISCIPLINA = DM.DISCIPLINA AND  ' +
         '  FI.ANOSEMESTRE = DM.ANOSEMESTRE AND  ' +
         '  FI.CODIGOALUNO = DM.CODALUNO AND     ' +
         '  FI.CODIGOALUNO = M.CODIGOALUNO AND   ' +
         '  FI.TURMAMATRICULA = M.TURMA AND      ' +
         '  FI.ANOSEMESTRE = M.ANOSEMESTRE AND   ' + 
         '  DM.TURMA = :TURMA AND                ' +
         '  DM.DISCIPLINA = :DISCIPLINA AND      ' +
         '  BIMESTRE = :BIMESTRE AND             ' +
         '  DM.ANOSEMESTRE = :ANOSEMESTRE        ' +
         '  AND (FI.SITUACAO NOT IN (3,4,5,6,7,8,10) OR :MOSTRAR_TODOS = 1) ' +
         'ORDER                                  ' +
         '  BY M.NR_ALUNO, A.NM_PESSOA           ';

   end;

end;

procedure TDMDiario.qAulasAfterInsert(DataSet: TDataSet);
begin
  qInsereAula.Close;
  qInsereAula.ParamByName('Disciplina').Value := qTurmasDISCIPLINA.Value;
  qInsereAula.ParamByName('Turma').Value := qTurmasTURMA.Value;
  qInsereAula.ParamByName('AnoSemestre').Value := qTurmasANOSEMESTRE.Value;
  qInsereAula.Open;
  try
    qAulasNRO_AULA.Value := qInsereAula.FieldByName('Maximo').Value + 1;
  Except
    qAulasNRO_AULA.Value := 1; 

  end;
  qInsereAula.Close;
  qAulasDATA.Value := DataHoje;
end;

procedure TDMDiario.qFrequenciaCalcFields(DataSet: TDataSet);
Var
   i, n, nro_Aula : integer;
   faltas : integer;
   sFalta : string;
begin

   // Pegar a Quantidade de Aulas
   qAulas.Last();
   nro_Aula := qAulas.FieldByName('nro_aula').AsInteger;


   faltas  := 0;
//   nro_Aula:= 0;
   sFalta := '';
  // Verificar o número de Faltas

   For i := 1 to nro_Aula do
   Begin

      sFalta := qFrequencia.FieldByName('Freq' + IntToStr(i)).AsString;
      for n := 1 to length(sFalta) do begin

          if sFalta[n] = 'F' then begin
             INC(faltas);
          end;

      end;

   End;

   if qFrequencia.State <> dsEdit then
      qFrequencia.Edit();
   qFrequenciaFALTAS.Value := faltas;
   qFrequencia.Post();

end;

procedure TDMDiario.qTurmasFORMULA_MEDIAGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
   if Trim(qTurmasFORMULA_MEDIA.AsString) = '' Then
      Text := 'Não definida.'
   Else
      Text := qTurmasFORMULA_MEDIA.AsString;
end;

function TDMDIARIO.verificaValorNota(nr_anosemestre: Integer;
  cd_turma: String; cd_disciplina, nr_bimestre: Integer; vl_nota: Real; nr_nota: Integer; mostra_msg: Boolean): boolean;
var
   chave_nota_min_max, msg_nota: String;
   vl_nota_minima, vl_nota_maxima: Double;
begin
   chave_nota_min_max := IntToStr(nr_anosemestre)+'_'+
                        cd_turma+'_'+
                        IntToStr(cd_disciplina)+'_'+
                        IntToStr(nr_bimestre)+'_'+
                        IntToStr(nr_nota);

   if ( trim( arrNotasMaxima.Values[ chave_nota_min_max ] ) = '' ) AND
      ( trim( arrNotasMinima.Values[ chave_nota_min_max ] ) = '' ) then
   begin
      qyAux2.Close();
      qyAux2.SQL.Text :=
         'SELECT  nr_nota_minima, nr_nota_maxima '+
         'FROM diario_provas '+
         'WHERE anosemestre = :anosemestre and '+
         'turma = :turma AND disciplina = :disciplina AND bimestre = :bimestre '+
         'AND nro_nota = :nro_nota';

     qyAux2.ParamByName('anosemestre').AsInteger := nr_anosemestre;
     qyAux2.ParamByName('turma').AsString := cd_turma;
     qyAux2.ParamByName('disciplina').AsInteger := cd_disciplina;
     qyAux2.ParamByName('bimestre').AsInteger := nr_bimestre;
     qyAux2.ParamByName('nro_nota').AsInteger := nr_nota;

     qyAux2.Open;

     arrNotasMaxima.Values[ chave_nota_min_max ] := FloatToStr(qyAux2.FieldByName('nr_nota_maxima').AsFloat);
     arrNotasMinima.Values[ chave_nota_min_max ] := FloatToStr(qyAux2.FieldByName('nr_nota_minima').AsFloat);
   end;
                                                                             
   vl_nota_maxima := StrToFloat(arrNotasMaxima.Values[ chave_nota_min_max ]);
   vl_nota_minima := StrToFloat(arrNotasMinima.Values[ chave_nota_min_max ]);

   if not( (vl_nota_minima = 0) and (vl_nota_maxima = 0) ) then
   begin
      if (vl_nota_minima <= vl_nota) AND (vl_nota_maxima >= vl_nota ) then
         result:= true
      else begin
        if nr_nota = -1 then
           msg_nota := 'RE'
        else
           msg_nota := IntToSTR(nr_nota);

         if ( mostra_msg ) then
            Mensagem('A nota '+msg_nota+' deve conter um valor entre '+FloatToStrF(vl_nota_minima, ffFixed, 5, 2 )+' e '+FloatToStrF(vl_nota_maxima, ffFixed, 5, 2 ), 'ATENÇÃO!!!!', MB_OK + MB_ICONQUESTION);

         result:= false;
      end;
   end else
      result := true;
end;

procedure TDMDIARIO.DataModuleCreate(Sender: TObject);
begin
   arrNotasMaxima := TStringList.Create();
   arrNotasMinima := TStringList.Create();

   arrNotasMaxima.Clear();
   arrNotasMinima.Clear();
end;

function TDMDIARIO.html_entity_decode(AStr: String): String;
var
  sHTMLTranslationTable: TStringList;
  i: Integer;
begin
   sHTMLTranslationTable := TStringList.Create();

   // Tabela de caracteres a serem decodificados (Tag => Caracter)
   // Essa tabela foi pega do PhP através da função "get_html_translation_table(HTML_ENTITIES)",
   //   a função traz todos os caracteres que foram convertido no sistema online
   sHTMLTranslationTable.CommaText := '&Agrave;=À, '+
      '&Aacute;=Á, &Acirc;=Â, &Atilde;=Ã, &Auml;=Ä, &Aring;=Å, &AElig;=Æ, &Ccedil;=Ç, '+
      '&Egrave;=È, &Eacute;=É, &Ecirc;=Ê, &Euml;=Ë, &Igrave;=Ì, &Iacute;=Í, &Icirc;=Î, '+
      '&Iuml;=Ï, &ETH;=Ð, &Ntilde;=Ñ, &Ograve;=Ò, &Oacute;=Ó, &Ocirc;=Ô, &Otilde;=Õ, '+
      '&Ouml;=Ö, &times;=×, &Oslash;=Ø, &Ugrave;=Ù, &Uacute;=Ú, &Ucirc;=Û, &Uuml;=Ü, '+
      '&Yacute;=Ý, &THORN;=Þ, &szlig;=ß, &agrave;=à, &aacute;=á, &acirc;=â, &atilde;=ã, '+
      '&auml;=ä, &aring;=å, &aelig;=æ, &ccedil;=ç, &egrave;=è, &eacute;=é, &ecirc;=ê, '+
      '&euml;=ë, &igrave;=ì, &iacute;=í, &icirc;=î, &iuml;=ï, &eth;=ð, &ntilde;=ñ, '+
      '&ograve;=ò, &oacute;=ó, &ocirc;=ô, &otilde;=õ, &ouml;=ö, &divide;=÷, &oslash;=ø, '+
      '&ugrave;=ù, &uacute;=ú, &ucirc;=û, &uuml;=ü, &yacute;=ý, &thorn;=þ, &yuml;=ÿ, '+
      '&quot;=", &lt;=<, &gt;=>, &amp;=&';

   AStr := StringReplace(AStr, CHAR(13), CHAR(13)+CHAR(10), [rfReplaceAll]);
   AStr := StringReplace(AStr, CHAR(10), CHAR(13)+CHAR(10), [rfReplaceAll]);

   // Substitui os caracteres considerando "case sensitive", ou seja, maiusculas converte para maiusculas e minuscula para minusculas
   // Nesse ponto ele irá acertar todas as letras e alguns simbolos     
   for i := 0 to sHTMLTranslationTable.Count - 1 do
   begin
      AStr := StringReplace(AStr, sHTMLTranslationTable.Names[i], sHTMLTranslationTable.ValueFromIndex[i],
         [rfReplaceAll]);
   end;

   // Após subsituir considerando o "case sensitive", deve-se substituir os desconsiderando o mesmo
   // Nesse ponto pode ser que passou algum simbolo que estava com a tag em maiusculo ou minusculo (ex.: &AMP=&), então elimina essa possíbilidade
   for i := 0 to sHTMLTranslationTable.Count - 1 do
   begin
      AStr := StringReplace(AStr, sHTMLTranslationTable.Names[i], sHTMLTranslationTable.ValueFromIndex[i],
         [rfReplaceAll, rfIgnoreCase]);
   end;

   // Retorna a string convertida
   Result := AStr;

   sHTMLTranslationTable.Free;
end;

procedure TDMDIARIO.dsDescricoesDataChange(Sender: TObject; Field: TField);
begin
   if Assigned(DiarioView) then
   begin
      DiarioView.Memo1.Text := html_entity_decode(qDescricoesds_avaliacao.AsString);
      DiarioView.tbCancelarDescricoes.Enabled := False;
      DiarioView.tbSalvarDescricoes.Enabled := False;
      DiarioView.lbSituacaoDescricoes.Caption := '(SITUAÇÃO: '+qDescricoes.FieldByName('situacao').AsString+')';

      // Verifica se a situação do aluno consta como uma situação ativa (verificado em SQL)
      if qDescricoes.FieldByName('ativo').AsInteger > 0 then
      begin
         DiarioView.Memo1.Enabled := True;
      end else begin
         DiarioView.Memo1.Enabled := False;
      end;
   end;
end;

procedure TDMDIARIO.dsTurmasDataChange(Sender: TObject; Field: TField);
begin
   if Assigned(DiarioView) then
   begin
      if qTurmasCD_GRUPO.AsInteger > 0 then
      begin
         DiarioView.Label4.Visible := True;
      end else begin
         DiarioView.Label4.Visible := False;
      end;
   end;

   DiarioView.btnObs.Marked :=
      TfObservacoes.HasObservations(
         qTurmasPROFESSOR.AsInteger,
         okTurmasProfessores
      );
end;

function TDMDIARIO.getFormulaTurma(nr_anosemestre: Integer; cd_turma: String;
  cd_disciplina, nr_etapa, cd_grupo: Integer): String;
var
   qyGetFormula: TUMZQuery;
begin
   Result := '';

   DM.CriarConsulta( qyGetFormula );

   { Recupera a fórmula que está em diario turmas,
     Mas caso ainda não tenha sido utilizada e          
     não existir formula lá busca do parametro de avaliação a fórmula padrão }

   // Busca fórmula de diário turmas
   with qyGetFormula do
   begin
      SQL.Clear;
      SQL.Add( ' SELECT formula_media ' );
      SQL.Add( ' FROM diario_turmas ' );
      SQL.Add( ' WHERE anosemestre = :NR_ANOSEMESTRE AND turma = :CD_TURMA AND ' );
      SQL.Add( '       disciplina = :CD_DISCIPLINA AND bimestre = :NR_ETAPA AND cd_grupo = :CD_GRUPO ' );

      ParamByName( 'NR_ANOSEMESTRE' ).AsInteger := nr_anosemestre;
      ParamByName( 'CD_TURMA' ).AsString := cd_turma;
      ParamByName( 'CD_DISCIPLINA' ).AsInteger := cd_disciplina;
      ParamByName( 'NR_ETAPA' ).AsInteger := nr_etapa;
      ParamByName( 'CD_GRUPO' ).AsInteger := cd_grupo;

      Open();

      Result := FieldByName('formula_media').AsString;
   end;

   // Busca a fórmula do parametro de avaliação se não encontrou em diário turmas
   if Result = '' then
   begin
      with qyGetFormula do
      begin

         SQL.Clear;
         SQL.Add( ' SELECT ap.ds_formula_padrao ' );
         SQL.Add( ' FROM turmas t ' );
         SQL.Add( ' INNER JOIN grades_disciplinas gd ON ( ' );
		   SQL.Add( '    gd.cd_curso = t.curso AND ' );
		   SQL.Add( '    gd.nr_serie = t.serie AND ' );
		   SQL.Add( '    gd.cd_grade = t.cd_grade ' );
         SQL.Add( ' ) ' );
         SQL.Add( ' INNER JOIN avaliacoes_parametros ap ON ( ' );
         SQL.Add( '    ap.cd_avaliacao = COALESCE(gd.cd_avaliacao, t.cd_avaliacao) ' );
         SQL.Add( ' ) ' );
         SQL.Add( ' WHERE t.anosemestre = :NR_ANOSEMESTRE AND t.codigo = :CD_TURMA AND ' );
         SQL.Add( '       gd.cd_disciplina = :CD_DISCIPLINA ' );

         ParamByName( 'NR_ANOSEMESTRE' ).AsInteger := nr_anosemestre;
         ParamByName( 'CD_TURMA' ).AsString := cd_turma;
         ParamByName( 'CD_DISCIPLINA' ).AsInteger := cd_disciplina;

         Open();

         Result := FieldByName('ds_formula_padrao').AsString;
      end;
   end;

end;

procedure TDMDiario.IBEvents1EventAlert(Sender: TObject; EventName: String;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
   Mensagem('Esse é o erro: ' + EventName);
end;

procedure TDMDiario.qProvasAfterInsert(DataSet: TDataSet);
begin
   DMDIARIO.qProvasDATA.Value := DataHoje;
end;

procedure TDMDIARIO.qProvasCalcFields(DataSet: TDataSet);
begin
   if qProvas.FieldByName('sn_especial').AsInteger = 1 then begin
      qProvas.FieldByName('DS_NOTA').AsString := 'RE';
   end else if qProvas.FieldByName('sn_proficiencia').AsInteger = 1 then begin
      qProvas.FieldByName('DS_NOTA').AsString := 'PS';
   end else begin
      qProvas.FieldByName('DS_NOTA').AsString := 'NOTA'+qProvas.FieldByName('NRO_NOTA').AsString;
   end;
end;

procedure TDMDIARIO.qProvasid_atividade_moodleGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (qProvasid_atividade_moodle.AsString = '') then
   begin
      Text := 'Não';
   end
   else
   begin
      Text := 'Sim';
   end;
end;

procedure TDMDiario.qFichaNOTA1GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
   if (Sender.Value < 0) and (Sender.Value = 'null') Then
      Text := 'DISP'
   Else
      if Sender.Value >= 0 Then
         Text := FloatToStrF(Sender.Value, ffNumber, 5,2);

end;

procedure TDMDiario.qFichaMediaGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
   if (Sender.Value < 0) and (Sender.Value <> 'null') Then
      Text := 'DISP'
   Else
      if Sender.Value >= 0 Then
         Text := FloatToStrF(Sender.Value, ffNumber, 5,2);
end;

procedure TDMDiario.qNotasMEDIAGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
   if Sender.AsString <> '' Then
      Text := FloatToStrF(Sender.Value, ffNumber, 5,2);
end;

procedure TDMDiario.qNotasAJUSTEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.Value = 0 Then Text := ' '
  Else
     if Sender.AsString = '' then
        Text := ' '
     else
        Text := FloatToStrF(Sender.Value, ffNumber, 5,2);
end;

procedure TDMDiario.qNotasBeforePost(DataSet: TDataSet);
var
   strAltera : string;
   n : integer;
   chaves, logDesc : string;
begin
  { Antes de Confirmar as Digitações de notas, verificar a
    Situacao do Aluno, caso a situação seja <> '', Então deve
    ser zerado as notas após a data da saída
  }
{  if qNotasSITUACAO.AsInteger <> 1 then
  Begin
     qNotasAJUSTE.AsString := '';
     DMDIARIO.qProvas.First;
     While not DMDIARIO.qProvas.Eof do Begin
        if DMDIARIO.qProvasDATA.Value > DMDIARIO.qNotasDATA_SAIDA.Value Then
           DMDIARIO.qNotas.FieldByName('Nota' + DMDIARIO.qProvasNRO_NOTA.AsString).AsString := '';
        DMDIARIO.qProvas.Next;
     End;
  End;
}  

  { Verificar se houve alterações de NOTAS }

  strAltera := '';
  n := 0;
  chaves := '';

  DM.qAux1.Close;
  Dm.qAux1.SQL.Clear;
  DM.qAux1.SQL.Add('SELECT nota1, nota2, nota3, nota4, nota5, nota6, nota7, nota8, nota9, nota10, nota11, nota12, nota13, nota14, nota15, nota16, nota17, nota18, nota19, nota20, nota21, nota22, nota23, nota24, nota25, nota_especial, ajuste, media ');
  DM.qAux1.SQL.Add('FROM diario_matriculas');
  DM.qAux1.SQL.Add('WHERE codaluno = :codaluno AND anosemestre = :anosemestre and');
  DM.qAux1.SQL.Add('turma = :turma AND disciplina = :disciplina AND bimestre = :bimestre');

  DM.qAux1.ParamByName('codaluno').AsInteger := qNotasCODALUNO.AsInteger;
  DM.qAux1.ParamByName('anosemestre').AsInteger := qNotasANOSEMESTRE.AsInteger;
  DM.qAux1.ParamByName('turma').AsString := qNotasTURMA.AsString;
  DM.qAux1.ParamByName('disciplina').AsInteger := qNotasDISCIPLINA.AsInteger;
  DM.qAux1.ParamByName('bimestre').AsInteger := qNotasBIMESTRE.AsInteger;

  Dm.qAux1.Open;

  { Gravar o Logo do Tipo 4 - Visualização do Diario }
  for n := 1 to 25 do
  begin
      if DM.qAux1.FieldByName('nota' + IntToStr(n)).AsString <> qNotas.FieldByName('nota' + IntToStr(n)).AsString then
      begin
          if (not verificaValorNota(qNotasANOSEMESTRE.AsInteger, qNotasTURMA.AsString, qNotasDISCIPLINA.AsInteger,qNotasBIMESTRE.AsInteger, qNotas.FieldByName('nota' + IntToStr(n)).AsFloat, n)) then begin
             qNotas.FieldByName('nota' + IntToStr(n)).Value := DM.qAux1.FieldByName('nota' + IntToStr(n)).Value;
             abort;
          end;
          
          strAltera := 'alterada a Nota' +  IntToStr(n) + ' de ' + FloatToStrF(DM.qAux1.FieldByName('nota' + IntToStr(n)).AsCurrency, ffFixed, 5, 2 ) +
             ' para ' + FloatToStrF(qNotas.FieldByName('nota' + IntToStr(n)).AsCurrency, ffFixed, 5, 2 );

          chaves := qNotasCODALUNO.AsString + ';' +
                    qNotasTURMA.AsString + ';' +
                    qNotasANOSEMESTRE.AsString + ';' +
                    qNotasDISCIPLINA.AsString + ';' +
                    qNotasBIMESTRE.AsString + ';';

          DM.gerar_log(4, strAltera, DM.iCdPessoaLogado, chaves);

      end;
  end;

  if DM.qAux1.FieldByName('nota_especial').AsString <> qNotas.FieldByName('nota_especial').AsString then
  begin
          strAltera := 'alterada a RB de ' + FloatToStrF(DM.qAux1.FieldByName('nota_especial').AsCurrency, ffFixed, 5, 2 ) +
             ' para ' + FloatToStrF(qNotas.FieldByName('nota_especial').AsCurrency, ffFixed, 5, 2 );

          chaves := qNotasCODALUNO.AsString + ';' +
                    qNotasTURMA.AsString + ';' +
                    qNotasANOSEMESTRE.AsString + ';' +
                    qNotasDISCIPLINA.AsString + ';' +
                    qNotasBIMESTRE.AsString + ';';

          DM.gerar_log(4, strAltera, DM.iCdPessoaLogado, chaves);

          // Efetuar Alteração na Ficha Individual;

          qyAux2.Close();
          qyAux2.SQL.Text :=
            ' UPDATE fichaindividual SET exame' + qNotasBIMESTRE.AsString + '= :NovaRB ' +
            ' WHERE codigoaluno = :CodigoAluno AND anosemestre = :AnoSemestre AND ' +
            ' turma = :Turma AND Disciplina = :disciplina ';
          qyAux2.ParamByName('CodigoAluno').AsInteger := qNotasCODALUNO.AsInteger;
          qyAux2.ParamByName('AnoSemestre').AsInteger := qNotasANOSEMESTRE.AsInteger;
          qyAux2.ParamByName('Turma').AsString := qNotasTURMA.AsString;
          qyAux2.ParamByName('Disciplina').AsInteger := qNotasDISCIPLINA.AsInteger;
          qyAux2.ParamByName('NovaRB').AsCurrency := qNotasnota_especial.AsCurrency;
          qyAux2.ExecSQL();
  end;


  if DM.qAux1.FieldByName('media').AsString <> qNotas.FieldByName('media').AsString then
  begin
     strAltera := 'alterada a Média de ' + FloatToStrF(DM.qAux1.FieldByName('media').AsCurrency, ffFixed, 5, 2 ) +
             ' para ' + FloatToStrF(qNotas.FieldByName('media').AsCurrency, ffFixed, 5, 2 );

     chaves := qNotasCODALUNO.AsString + ';' +
                    qNotasTURMA.AsString + ';' +
                    qNotasANOSEMESTRE.AsString + ';' +
                    qNotasDISCIPLINA.AsString + ';' +
                    qNotasBIMESTRE.AsString + ';';

     DM.gerar_log(4, strAltera, DM.iCdPessoaLogado, chaves);

  end;

  if DM.qAux1.FieldByName('ajuste').AsString <> qNotas.FieldByName('media').AsString then
  begin
     strAltera := 'alterada o Ajuste de ' + FloatToStrF(DM.qAux1.FieldByName('ajuste').AsCurrency, ffFixed, 5, 2 ) +
             ' para ' + FloatToStrF(qNotas.FieldByName('ajuste').AsCurrency, ffFixed, 5, 2 );

     chaves := qNotasCODALUNO.AsString + ';' +
                    qNotasTURMA.AsString + ';' +
                    qNotasANOSEMESTRE.AsString + ';' +
                    qNotasDISCIPLINA.AsString + ';' +
                    qNotasBIMESTRE.AsString + ';';

     DM.gerar_log(4, strAltera, DM.iCdPessoaLogado, chaves);

  end;

   // Inserir log de alteração de frequencias
   logDesc := '';
   logDesc := logDesc + 'Aluno: '+qDescricoescd_pessoa.AsString+', ';
   logDesc := logDesc + 'Descritiva: '+qDescricoesds_avaliacao.AsString+', ';
   logDesc := logDesc + 'Anosemestre: '+qDescricoesnr_anosemestre.AsString+', ';
   logDesc := logDesc + 'Turma: '+qDescricoescd_turma.AsString+', ';
   logDesc := logDesc + 'Disciplina: '+qDescricoesnr_disciplina.AsString+', ';
   logDesc := logDesc + 'Etapa: '+qDescricoesnr_avaliacao.AsString+' [Acadêmico]';

   { Insere log de alteração de frequencias }
   DMDiario.inserirLog(uDMDiario.ACAO_ALTERACAO, uDMDiario.ATIVIDADE_PARECER_DESCRITIVO, logDesc, qTurmas.FieldByName('PROFESSOR').AsInteger);

end;

procedure TDMDIARIO.qNotasCalcFields(DataSet: TDataSet);
var
   media_sem_ajuste: Real;
begin
   //Cálculo para apresentar o valor da média sem ajuste

   //Diminue o valor do ajuste do valor da média "media_sem_ajuste = diario_matriculas.media - diario_matriculas.ajuste"
   if qNotasMEDIA.AsVariant <> '' then begin

     media_sem_ajuste := qNotasMEDIA.AsFloat - qNotasAJUSTE.AsFloat;

     //Seta o valor formatado da média sem ajuste na grid de notas
     qNotasMEDIA_SEM_AJUSTE.AsFloat := StrToFloat(Format('%2.2f', [media_sem_ajuste]));

   end else begin

     qNotasMEDIA_SEM_AJUSTE.AsString := '';

   end;

   
end;

procedure TDMDiario.qNotasNOTA1GetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  { Antes de Confirmar as Digitações de notas, verificar a
    Situacao do Aluno, caso a situação seja <> '', Então deve
    ser zerado as notas após a data da saída
  }
   if Sender.AsString <> '' Then
        Text := FloatToStrF(Sender.Value, ffNumber, 5,2);
end;

procedure TDMDiario.qNotasNOMEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
Var Sit : String;
begin
   Sit := '';

   if qNotasSITUACAO.AsInteger <> 1 then
   Begin
     try
	Text := Sender.AsString + ' (' + Dm.lst_situacao_desc[qNotasSITUACAO.AsInteger ]  + ')'
     except
	 Text := Sender.AsString + ' (----)'
     end;
   End
   Else
      Text := Sender.AsString;
end;

procedure TDMDiario.qFrequenciaNOMEGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
Var Sit : String;
begin
   Sit := '';
   if qFrequenciaSITUACAO.AsInteger <> 1 then
   Begin
      try
	 Text := Sender.AsString + ' (' + Dm.lst_situacao_desc[qFrequenciaSITUACAO.AsInteger] + ')'
      except
         Text := Sender.AsString + ' (----)'
      end;
   End
   Else
      Text := Sender.AsString;
end;

procedure TDMDiario.qAulasNewRecord(DataSet: TDataSet);
begin
   qAulasCONTEUDO.AsString := '';
end;

procedure TDMDiario.qFichaNotaExameGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if Sender.AsFloat = -5 Then // Aprovado
     Text := 'APROV.'
  Else
     if Sender.AsFloat = -6 Then // Reprovado
        Text := 'REPROV.'
     Else
        Text := FloatToStrF(Sender.Value, ffNumber,5,2);
end;

procedure TDMDIARIO.qAlunosSITUACAOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   try
      Text := Dm.lst_situacao_desc[Sender.AsInteger];
   except
      Text := '';
   end;
end;

procedure TDMDIARIO.qNotasAfterPost(DataSet: TDataSet);
begin
   try
      TUMZQuery(DataSet).ApplyUpdates;
      TUMZQuery(DataSet).CommitUpdates;
   Except

   end;
end;

procedure TDMDIARIO.qFrequenciaAfterPost(DataSet: TDataSet);
begin
   try
      TUMZQuery(DataSet).ApplyUpdates;
      TUMZQuery(DataSet).CommitUpdates;
   except

   end;
end;

End.
