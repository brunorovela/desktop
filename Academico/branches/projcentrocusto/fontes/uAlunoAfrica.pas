unit uAlunoAfrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uPessoasAfrica, ZConnection, Db, ImgList, DBCtrls, Buttons, StdCtrls, Grids,
  DBGrids, ExtCtrls, Mask, ComCtrls, ToolWin, ExtDlgs, Menus, uFrameParentes,
  ZAbstractTable, ZDataset, ZAbstractRODataset, ZAbstractDataset, UZDataset,
  DSPack, CropImage, DelphiTwain, UMComboBox, ZSqlUpdate;

const
   MSG_ALUNO_MENOR_IDADE =
      'Você está prestes a vincular uma pessoa menor de idade como resposável financeira pelo acadêmico selecionado. Tem certeza que deseja prosseguir?';

type
  TfAlunosAfrica = class(TfPessoasAfrica)
    tblResponsavel: TUMZQuery;
    dsResponsavel: TDataSource;
    toolAcademico: TToolBar;
    ToolButton3: TToolButton;
    btAcad_Novo: TToolButton;
    btAcad_Busca: TToolButton;
    btAcad_Aluno: TToolButton;
    ToolButton10: TToolButton;
    btAcad_Salvar: TToolButton;
    btAcad_Cancelar: TToolButton;
    btAcad_Pai: TToolButton;
    ToolButton16: TToolButton;
    btAcad_Mae: TToolButton;
    ToolButton18: TToolButton;
    btAcad_Fechar: TToolButton;
    ToolButton20: TToolButton;
    dsContatoResponsavel: TDataSource;
    tsRespAcademico: TTabSheet;
    tsRespFinanceiro: TTabSheet;
    tsMatricula: TTabSheet;
    Label27: TLabel;
    dbNomeRespAcad: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label45: TLabel;
    DBEdit10: TDBEdit;
    Label47: TLabel;
    pgDocAcad: TPageControl;
    TabSheet9: TTabSheet;
    Label55: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    dbCPFAcad: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit20: TDBEdit;
    Label68: TLabel;
    DBEdit27: TDBEdit;
    Label69: TLabel;
    DBEdit28: TDBEdit;
    Label70: TLabel;
    DBEdit29: TDBEdit;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    imageFotoAcad: TImage;
    lbFotoAcad: TLabel;
    Label72: TLabel;
    dbNomeRespFinan: TDBEdit;
    DBComboBox7: TDBComboBox;
    Label78: TLabel;
    DBEdit35: TDBEdit;
    Label80: TLabel;
    pgDocFinan: TPageControl;
    TabSheet12: TTabSheet;
    Label88: TLabel;
    Label89: TLabel;
    Label91: TLabel;
    dbCPFFinan: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit45: TDBEdit;
    Label101: TLabel;
    DBEdit52: TDBEdit;
    Label102: TLabel;
    DBEdit53: TDBEdit;
    Label103: TLabel;
    DBEdit54: TDBEdit;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    imageFotoResp: TImage;
    lbFotoResp: TLabel;
    tblResponsavelcd_pessoa: TIntegerField;
    tblResponsavelcd_resp_finan: TIntegerField;
    tblResponsavelcd_resp_acad: TIntegerField;
    tblResponsavelnm_pessoa: TStringField;
    tblResponsavelds_cidade_nascimento: TStringField;
    tblResponsavelds_estado_nascimento: TStringField;
    tblResponsavelds_pais_nascimento: TStringField;
    tblResponsavelds_logradouro: TStringField;
    tblResponsavelds_logradouro_nro: TStringField;
    tblResponsavelds_complemento: TStringField;
    tblResponsavelds_cep: TStringField;
    tblResponsavelds_bairro: TStringField;
    tblResponsavelds_cidade: TStringField;
    tblResponsavelds_estado: TStringField;
    tblResponsavelds_pais: TStringField;
    tblResponsavelds_sexo: TStringField;
    tblResponsavelds_nacionalidade: TStringField;
    tblResponsavelds_identidade: TStringField;
    tblResponsavelds_identidade_orgao_exp: TStringField;
    tblResponsavelds_cpf: TStringField;
    tblResponsavelds_rm_corporacao: TStringField;
    tblResponsavelds_rm_org_numero: TStringField;
    tblResponsavelds_rm_doc_numero: TStringField;
    tblResponsavelds_rm_orgao: TStringField;
    tblResponsavelds_rm_doc_tipo: TStringField;
    tblResponsavelds_titulo_numero: TStringField;
    tblResponsavelds_titulo_secao: TStringField;
    tblResponsavelds_titulo_zona: TStringField;
    tblResponsavelnm_pai: TStringField;
    tblResponsavelnm_mae: TStringField;
    tblResponsavelnm_conjuge: TStringField;
    tblResponsavelcd_usuario: TIntegerField;
    tblResponsavelnm_sem_acento: TStringField;
    tblResponsavelds_arquivo_documento: TStringField;
    tblResponsavelcd_empresa: TIntegerField;
    tblResponsavelds_cargo: TStringField;
    tblResponsavelds_observacao: TBlobField;
    tblResponsaveldescEstadoNasc: TStringField;
    tblResponsaveldescEstado: TStringField;
    tblMatriculaCurso: TUMZQuery;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    dsMatriculasCurso: TDataSource;
    Label71: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Bevel1: TBevel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBGrid4: TDBGrid;
    tblMatriculasEtapa: TUMZQuery;
    dsMatriculasEtapa: TDataSource;
    toolMatricula: TToolBar;
    ToolButton5: TToolButton;
    btnMatricular: TToolButton;
    ToolButton12: TToolButton;
    btnDocumentos: TToolButton;
    btnFinanceiro: TToolButton;
    ToolButton19: TToolButton;
    btnFechar: TToolButton;
    qryMensalidades: TUMZQuery;
    tblResponsavelcd_estado_civil: TSmallintField;
    tblResponsavelds_senha: TStringField;
    tblResponsavelsn_senha_provisoria: TStringField;
    DBLookupComboBox8: TDBLookupComboBox;
    Label46: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    Label79: TLabel;
    tblResponsaveldescEstadoCivil: TStringField;
    tblResponsaveldt_nascimento: TDateTimeField;
    tblResponsaveldt_identidade_expedicao: TDateTimeField;
    tblResponsaveldt_rm_exp: TDateTimeField;
    tblResponsaveldt_titulo_emissao: TDateTimeField;
    tblResponsaveldt_revisao: TDateTimeField;
    tblResponsaveldt_cadastro: TDateTimeField;
    btn_Imprimir: TToolButton;
    tblContatosPadroes: TUMZQuery;
    tblContatos: TUMZQuery;
    sbMaisInformacoesAcademico: TSpeedButton;
    sbMaisInformacoesFinanceiro: TSpeedButton;
    btnOrientacao: TToolButton;
    qyDocumentos: TUMZQuery;
    tblResponsavelsn_bloqueto_empresa: TStringField;
    tblResponsavelim_pessoa: TBlobField;
    tblResponsavelsn_foto_publica: TStringField;
    tblResponsavelsn_pai: TStringField;
    tblResponsavelsn_mae: TStringField;
    qyDocumentosNaoNecessarios: TUMZQuery;
    tsPai: TTabSheet;
    tsMae: TTabSheet;
    sbBuscarPai: TSpeedButton;
    sbBuscarMae: TSpeedButton;
    Label110: TLabel;
    Label111: TLabel;
    Label113: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    dbNomePai: TDBEdit;
    DBEdit57: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBGrid5: TDBGrid;
    DBLookupComboBox13: TDBLookupComboBox;
    Panel12: TPanel;
    Image1: TImage;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label133: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    dbNomeMae: TDBEdit;
    DBEdit72: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBGrid6: TDBGrid;
    DBLookupComboBox16: TDBLookupComboBox;
    Panel13: TPanel;
    Image2: TImage;
    Label149: TLabel;
    pgDocPai: TPageControl;
    TabSheet6: TTabSheet;
    Label150: TLabel;
    Label151: TLabel;
    Label153: TLabel;
    SpeedButton5: TSpeedButton;
    dbCPFPai: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit89: TDBEdit;
    pgDocMae: TPageControl;
    TabSheet17: TTabSheet;
    Label170: TLabel;
    Label171: TLabel;
    Label173: TLabel;
    SpeedButton6: TSpeedButton;
    dbCPFMae: TDBEdit;
    DBEdit103: TDBEdit;
    DBEdit105: TDBEdit;
    tblResponsaveltp_cert: TSmallintField;
    tblResponsavelds_cert_folha: TStringField;
    tblResponsavelds_cert_livro: TStringField;
    tblResponsaveldt_cert: TDateTimeField;
    tblResponsavelds_cert_uf: TStringField;
    tblResponsavelds_cert_orgao: TStringField;
    popContatoResp: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    sbCopiarAluno: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    tblMatriculasEtapacodigoaluno: TIntegerField;
    tblMatriculasEtapasituacao: TSmallintField;
    tblMatriculasEtapaturma: TStringField;
    tblMatriculasEtapaanosemestre: TSmallintField;
    tblMatriculasEtapads_situacao: TStringField;
    tblMatriculasEtapacd_ingresso: TIntegerField;
    tblMatriculasEtapads_ingresso: TStringField;
    tblMatriculasEtapaserie: TSmallintField;
    tblMatriculasEtapadataemissao: TDateTimeField;
    Complementares: TTabSheet;
    Label106: TLabel;
    TabSheet1: TTabSheet;
    Label204: TLabel;
    TabSheet5: TTabSheet;
    Label205: TLabel;
    DBEdit17: TDBEdit;
    TabSheet8: TTabSheet;
    Label206: TLabel;
    DBEdit30: TDBEdit;
    tblContatoResponsavel: TUMZQuery;
    tblContatoResponsavelcd_pessoa: TIntegerField;
    tblContatoResponsavelcd_contato: TIntegerField;
    tblContatoResponsavelds_contato: TStringField;
    tblContatoResponsaveldescContato: TStringField;
    Label208: TLabel;
    tblMatriculaCursocd_curso: TStringField;
    tblMatriculaCursodescricao: TStringField;
    tblMatriculaCursonr_matricula: TStringField;
    tblMatriculaCursodt_saida: TDateTimeField;
    tblMatriculaCursodt_ingresso: TDateTimeField;
    Label209: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    tblMatriculaCursodescInstituicao: TStringField;
    dbCodigo: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    Label18: TLabel;
    Label19: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox10: TDBLookupComboBox;
    Label20: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    Label21: TLabel;
    DBLookupComboBox12: TDBLookupComboBox;
    Label22: TLabel;
    DBLookupComboBox14: TDBLookupComboBox;
    Label23: TLabel;
    DBLookupComboBox15: TDBLookupComboBox;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit6: TDBEdit;
    Label26: TLabel;
    DBLookupComboBox17: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    Label30: TLabel;
    DBEdit9: TDBEdit;
    Label34: TLabel;
    Label43: TLabel;
    DBEdit11: TDBEdit;
    tblResponsaveldescDistritoNasc: TStringField;
    tblResponsaveldescProvincia: TStringField;
    tblResponsaveldescDistrito: TStringField;
    tblResponsaveldescLocalidade: TStringField;
    tblResponsaveldescLocalidadeNasc: TStringField;
    tblResponsaveldesLogradouro: TStringField;
    Label31: TLabel;
    DBLookupComboBox18: TDBLookupComboBox;
    DBLookupComboBox19: TDBLookupComboBox;
    Label44: TLabel;
    DBLookupComboBox20: TDBLookupComboBox;
    Label48: TLabel;
    DBLookupComboBox21: TDBLookupComboBox;
    Label49: TLabel;
    Label50: TLabel;
    DBLookupComboBox22: TDBLookupComboBox;
    DBLookupComboBox23: TDBLookupComboBox;
    Label51: TLabel;
    DBLookupComboBox24: TDBLookupComboBox;
    Label52: TLabel;
    DBLookupComboBox25: TDBLookupComboBox;
    Label53: TLabel;
    DBEdit7: TDBEdit;
    Label54: TLabel;
    Label73: TLabel;
    DBLookupComboBox26: TDBLookupComboBox;
    DBEdit12: TDBEdit;
    Label75: TLabel;
    Label76: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label77: TLabel;
    Label81: TLabel;
    DBLookupComboBox27: TDBLookupComboBox;
    DBLookupComboBox28: TDBLookupComboBox;
    Label82: TLabel;
    DBLookupComboBox29: TDBLookupComboBox;
    Label83: TLabel;
    DBLookupComboBox30: TDBLookupComboBox;
    Label84: TLabel;
    Label85: TLabel;
    DBLookupComboBox31: TDBLookupComboBox;
    DBLookupComboBox32: TDBLookupComboBox;
    Label86: TLabel;
    DBLookupComboBox33: TDBLookupComboBox;
    Label87: TLabel;
    DBLookupComboBox34: TDBLookupComboBox;
    Label107: TLabel;
    DBEdit16: TDBEdit;
    Label112: TLabel;
    Label114: TLabel;
    DBLookupComboBox35: TDBLookupComboBox;
    DBEdit31: TDBEdit;
    Label115: TLabel;
    Label116: TLabel;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label117: TLabel;
    Label118: TLabel;
    DBLookupComboBox36: TDBLookupComboBox;
    DBLookupComboBox37: TDBLookupComboBox;
    Label119: TLabel;
    DBLookupComboBox38: TDBLookupComboBox;
    Label120: TLabel;
    DBLookupComboBox39: TDBLookupComboBox;
    Label125: TLabel;
    Label126: TLabel;
    DBLookupComboBox40: TDBLookupComboBox;
    DBLookupComboBox41: TDBLookupComboBox;
    Label127: TLabel;
    DBLookupComboBox42: TDBLookupComboBox;
    Label128: TLabel;
    DBLookupComboBox43: TDBLookupComboBox;
    Label132: TLabel;
    DBEdit34: TDBEdit;
    Label134: TLabel;
    Label135: TLabel;
    DBLookupComboBox44: TDBLookupComboBox;
    DBEdit36: TDBEdit;
    Label136: TLabel;
    Label137: TLabel;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    Label138: TLabel;
    tblResponsaveldescPaisAtual: TStringField;
    tblResponsaveldescProvinciaNasc: TStringField;
    tblResponsaveldescPaisNasc: TStringField;
    ToolButton7: TToolButton;
    tblPessoacd_mae: TLargeintField;
    tblPessoacd_pai: TLargeintField;
    tblResponsavelcd_municipio: TLargeintField;
    tblResponsavelcd_pais: TLargeintField;
    tblResponsavelcd_pais_nascimento: TLargeintField;
    tblResponsavelcd_logradouro: TLargeintField;
    tblResponsavelcd_municipio_nasc: TLargeintField;
    tblResponsavelcd_estado_nascimento: TSmallintField;
    tblResponsavelcd_estado: TLargeintField;
    tblResponsavelcd_localidade: TIntegerField;
    tblResponsavelcd_localidade_nasc: TIntegerField;
    tblMatriculaCursonr_anosem_ingresso: TLargeintField;
    tblMatriculaCursocd_instituicao: TLargeintField;
    tblMatriculaCursocd_matricula_curso: TLargeintField;
    tblMatriculaCursocd_pessoa: TIntegerField;
    tblResponsavelnr_cert_termo: TStringField;
    sbHistorico: TSpeedButton;
    DBEdit19: TDBEdit;
    Label57: TLabel;
    DBEdit21: TDBEdit;
    Label59: TLabel;
    DBEdit22: TDBEdit;
    Label60: TLabel;
    DBEdit23: TDBEdit;
    Label61: TLabel;
    tblResponsaveldescNacionalidade: TStringField;
    Label17: TLabel;
    procedure dbCodigoChange(Sender: TObject);
    procedure dbCodigoDblClick(Sender: TObject);
    procedure miExcluirClick(Sender: TObject);
    procedure sbHistoricoClick(Sender: TObject);
    procedure tblPessoaBeforePost(DataSet: TDataSet);
    procedure btnObservacoesClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsPessoaStateChange(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnRematricularClick(Sender: TObject);
    procedure dbComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit78KeyPress(Sender: TObject; var Key: Char);
    procedure sbCopiarRespClick(Sender: TObject);
    procedure sbMaisInformacoesFinanceiroClick(Sender: TObject);
    procedure tblResponsavelAfterOpen(DataSet: TDataSet);
    procedure sbCopiarAlunoClick(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure sbBuscarMaeClick(Sender: TObject);
    procedure sbBuscarPaiClick(Sender: TObject);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit63KeyPress(Sender: TObject; var Key: Char);
    procedure sbCepPaiClick(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBEdit41KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tblResponsavelAfterInsert(DataSet: TDataSet);
    procedure tblResponsavelBeforePost(DataSet: TDataSet);
    procedure tblResponsavelNewRecord(DataSet: TDataSet);
    procedure btAcad_NovoClick(Sender: TObject);
    procedure btAcad_AlunoClick(Sender: TObject);
    procedure btAcad_BuscaClick(Sender: TObject);
    procedure pgPessoaChange(Sender: TObject);
    procedure btAcad_FecharClick(Sender: TObject);
    procedure btFin_FecharClick(Sender: TObject);
    procedure btAcad_PaiClick(Sender: TObject);
    procedure btAcad_MaeClick(Sender: TObject);
    procedure btAcad_SalvarClick(Sender: TObject);
    procedure btAcad_CancelarClick(Sender: TObject);
    procedure tblResponsavelds_sexoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tblResponsavelds_sexoSetText(Sender: TField; const Text: String);
    procedure dsResponsavelStateChange(Sender: TObject);
    procedure btnDocumentosClick(Sender: TObject);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure btnFinanceiroClick(Sender: TObject);
    procedure btnMatricularClick(Sender: TObject);
    procedure btBuscar_PessoaClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure btImprimir_PessoaClick(Sender: TObject);
    procedure tblContatoResponsavelNewRecord(DataSet: TDataSet);
    procedure tblContatoResponsavelBeforePost(DataSet: TDataSet);
    procedure pgPessoaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure copiar_endereco_aluno;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tblRespFinanceirods_sexoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tblRespFinanceirods_sexoSetText(Sender: TField; const Text: String);
    procedure btSalvar_PessoaClick(Sender: TObject);
    procedure dbNomeRespFinanExit(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure sbMaisInformacoesAcademicoClick(Sender: TObject);
    procedure btnOrientacaoClick(Sender: TObject);
  strict private
      function getDtNascimentoPessoa(const cd_pessoa: Integer): TDateTime;
  private
    { Private declarations }
    flgMatriculas : Boolean;
    function FinanceiroPendente: Boolean;

    procedure verificar_contatos_padroes(CodAluno : Integer);
    Procedure MatricularEtapa(CodMatricula : Integer; Curso : String; AnoSem: Integer; NrMatricula : String);
    Procedure AlertarPendencias();
    Function BuscaAnoSemestre() :Integer;
    procedure VerificaMaiorIdade(dtNasc: TDateTime);



  public

    { Public declarations }
  end;

var
  fAlunosAfrica: TfAlunosAfrica;

implementation

uses
   Main, uDM, General, uFSelecionarPessoa, uDocumentos, uFinanceiro, uMatricular,
   uUsuario, uMatriculas, Math, uPessoas_adicional, UFObservacoes,
   uSelCep, uMatricularCurso, uMatricula, uImpAlunosAfrica, uHistorico_anterior,
  UFMatricular;

{$R *.DFM}

procedure TfAlunosAfrica.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { Apagar o registro de contato quando pressionar DEL }
  if Key = 46 Then
  Begin
      if Mensagem('Excluir o Contato selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
         tblContatoResponsavel.Delete;
  End;
end;

procedure TfAlunosAfrica.DBGrid3DblClick(Sender: TObject);
var qySQL : TUMZQuery;
begin
  if not tblMatriculaCurso.IsEmpty then begin

     if not DM.UsuarioLogado.TemPermissao( 1009, npAlterar, True ) then Exit;

     Application.CreateForm(TFrmMatricularCurso, FrmMatricularCurso);
     FrmMatricularCurso.qyMatriculaCurso.Close();
     FrmMatricularCurso.qyMatriculaCurso.Close();
     FrmMatricularCurso.qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := tblMatriculaCursocd_matricula_curso.AsInteger;
     FrmMatricularCurso.qyMatriculaCurso.Open();
     FrmMatricularCurso.qyMatriculaCurso.Edit();

     FrmMatricularCurso.ShowModal;

     DM.CriarConsulta(qySQL);
     qySQL.Close();
     qySQL.SQL.Text :=
           ' UPDATE matriculas ma INNER JOIN matriculas_curso mc ' +
           '     ON (ma.cd_matricula_curso = mc.cd_matricula_curso) ' +
           ' SET ma.cd_matricula = mc.nr_matricula ' +
           ' WHERE mc.cd_matricula_curso = ' + tblMatriculaCursocd_matricula_curso.AsString;
     qySQL.ExecSQL();

     FreeAndNil( qySQL );

     FreeAndNil( FrmMatricularCurso );
  end;

end;

procedure TfAlunosAfrica.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   qySQL : TUMZQuery;
begin
  inherited;
  if Key = 46 then begin

     if tblMatriculasEtapa.RecordCount <= 0 then begin

           DM.CriarConsulta(qySQL);
           qySQL.Close();
           qySQL.SQL.Text :=
                 ' DELETE FROM matriculas_curso ' +
                 ' WHERE cd_matricula_curso = ' + tblMatriculaCursocd_matricula_curso.AsString;
           qySQL.ExecSQL();

           FreeAndNil( qySQL );

           tblMatriculaCurso.Close();
           tblMatriculaCurso.Open
     
     end;

  end;
end;

procedure TfAlunosAfrica.tblResponsavelAfterInsert(DataSet: TDataSet);
begin
   { Colocar Valores Padrões - Futuramente, pegar em Tabela de Parametros }
   tblResponsaveldt_cadastro.AsString := DateToStr(DataHoje);
end;


procedure TfAlunosAfrica.tblResponsavelBeforePost(DataSet: TDataSet);
begin
  // Efetuar a Validação do CPF
{  if not ValidaCPF( tblResponsavelds_cpf.AsString ) then
  begin

    Mensagem( 'CPF informado é inválido.', Application.Title, MB_OK + MB_ICONSTOP );

    // Posicionar o cursos no lugar CPF
    if pgPessoa.ActivePage = tsPai then begin
       pgDocPai.ActivePageIndex := 0;
       dbCPFPai.SetFocus();
    end
    else if pgPessoa.ActivePage = tsMae then begin
       pgDocMae.ActivePageIndex := 0;
       dbCPFMae.SetFocus();
    end
    else if pgPessoa.ActivePage = tsRespAcademico then begin
       pgDocAcad.ActivePageIndex := 0;
       dbCPFAcad.SetFocus();
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       pgDocFinan.ActivePageIndex := 0;
       dbCPFFinan.SetFocus();
    end;
    Abort;

  end;}

  // Gravar nome sem acento para BUSCA
  tblResponsavelnm_sem_acento.AsString := SemAcento( tblREsponsavelnm_pessoa.AsString );

  // Data de Revisão = Data de Hoje
  tblResponsaveldt_revisao.AsString := DateToStr(DataHoje);

  // Registrar Funcionário que alterou o cadastro
  tblResponsavelcd_usuario.AsInteger := DM.iCdPessoaLogado;

  tblPessoa.Edit;

  // Gravar o código do responsável no cadastro do aluno
  if pgPessoa.ActivePage = tsPai then begin
     tblPessoacd_pai.AsInteger := tblResponsavelcd_pessoa.AsInteger;
     tblPessoanm_pai.AsString := tblResponsavelnm_pessoa.AsString;
  end
  else if pgPessoa.ActivePage = tsMae then begin
     tblPessoacd_mae.AsInteger := tblResponsavelcd_pessoa.AsInteger;
     tblPessoanm_mae.AsString := tblResponsavelnm_pessoa.AsString;
  end
  else if pgPessoa.ActivePage = tsRespAcademico then
     tblPessoacd_resp_acad.AsInteger := tblResponsavelcd_pessoa.AsInteger
  else if pgPessoa.ActivePage = tsRespFinanceiro then begin
     //verifica as mensalidades para a troca de responsável
     DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, tblResponsavelcd_pessoa.AsInteger, tblPessoacd_resp_finan.AsInteger);
     //troca o codigo
     tblPessoacd_resp_finan.AsInteger := tblResponsavelcd_pessoa.AsInteger;
  end;


  tblPessoa.Post;
end;

procedure TfAlunosAfrica.tblResponsavelNewRecord(DataSet: TDataSet);
var
   lngAux : Largeint;
begin
   lngAux := DM.NovoCodigoPessoa( 'Local.CadastroAluno.Responsavel' );

   tblResponsavelcd_pessoa.AsInteger := lngAux;
   tblResponsavel.ParamByName('cd_responsavel').AsInteger := lngAux;
end;

procedure TfAlunosAfrica.ToolButton7Click(Sender: TObject);
const
   SInfoSemRespFinan = 'Não foi selecionado um responsável financeiro para este aluno. Esta informação é imprescindível para prosseguir com a matrícula.';
   SInfoPendenciaFin = 'O aluno possui pendência financeira. Usuário não possui permissão para realizar a matrícula nesta situação.';
   SInfoSemMatricula = 'É necessário selecionar uma matrícula válida para realizar o ajuste.';
var
   AnoSem: Integer;
begin

   // Verifica se o aluno possui um responsável financeiro definido para poder
   // realizar o ajuste de matrícula (rematrícula)
   
   if tblPessoacd_resp_finan.AsInteger > 0 then
   begin

      // Verifica se o usuário possui privilégios suficientes para realizar o
      // processo de ajuste de matrícula
      
      if DM.UsuarioLogado.TemPermissao(1019, npAcesso, True) then
      begin
         AnoSem := BuscaAnoSemestre;

         // Se o aluno possui pendências financeiras e o usuário não possui
         // privilégios para matrícular mesmo com a existência de pendências
         // financeiras, então o processo de matrícula é cancelado
         
         if btnFinanceiro.Marked and
            not DM.UsuarioLogado.TemPermissao(1019, npIncluir, False) then
         begin
            MessageDlg(SInfoPendenciaFin, mtWarning, [mbOK], -1);
         end
         else
         begin

            // Alerta o usuário sobre pendências financeiras e de documentação
            // do aluno selecionado, permitindo visualizá-las

            if btnFinanceiro.Marked then
               AlertarPendencias;

            // Verifica se está utilizando o novo processo de matrícula ou o
            // antiga, para definir que tela será apresentada para o usuário
            
            if DM.variavel_parametro('novo.processo.matricula') = 'S' then
            begin
               Application.CreateForm(TfMatricular, fMatricular);
               fMatricular.Ajuste := True;
               fMatricular.Pessoa := tblPessoacd_pessoa.AsInteger;
               fMatricular.Curso := tblMatriculaCursocd_curso.AsString;
               fMatricular.NomePessoa := tblPessoanm_pessoa.AsString;
               fMatricular.ShowModal;
            end
            else
            begin
               // Se o aluno não possui uma matrícula curso, então direciona
               // o usuário para realizar uma matrícula no curso para o aluno
               
               if tblMatriculaCurso.IsEmpty then
               begin
                  MessageDlg(SInfoSemMatricula, mtWarning, [mbOk], -1);
               end
               else if DM.variavel_parametro('africa_bolsas') = 'S' then
               begin
                  Application.CreateForm(TFrmMatricula, FrmMatricula);
                  try
                     FrmMatricula.iCodAluno := tblPessoacd_pessoa.AsInteger;
                     FrmMatricula.sNomeAluno := tblPessoanm_pessoa.AsString;
                     FrmMatricula.iCodRespFinan := tblPessoacd_resp_finan.AsInteger;
                     FrmMatricula.iAnoSem := tblMatriculasEtapaanosemestre.AsInteger;
                     FrmMatricula.sTurma := tblMatriculasEtapaturma.AsString;
                     FrmMatricula.iMatriculaCurso := tblMatriculaCursocd_matricula_curso.AsInteger;
                     FrmMatricula.Acao := AjustarMatricula;
                     FrmMatricula.ShowModal;
                  finally
                     FreeAndNil(FrmMatricula);
                  end;
               end;
            end;
         end;
      end;
   end
   else
   begin
      MessageDlg(SInfoSemRespFinan, mtWarning, [mbOK], -1);
      pgPessoa.ActivePage := tsRespFinanceiro;
   end;
end;

procedure TfAlunosAfrica.VerificaMaiorIdade(dtNasc: TDateTime);
var
   dtAgora :  TDateTime;
   Dia: Word;
   Mes: Word;
   Ano: Word;
   DiaNasc : Word;
   MesNasc: Word;
   AnoNasc: Word;
begin
{
Verifica se o aluno tem 18 anos se ele tiver assume o mesmo com responsavel finaceiro
}
   if dtNasc <> 0 then
   begin
      dtAgora := Now();
      DecodeDate(dtAgora,Ano,Mes,dia);
      DecodeDate(dtNasc,AnoNasc,MesNasc,DiaNasc);
      if Ano-18 = AnoNasc  then
      begin
         if MesNasc < Mes then
            bMenorIdade := false
         else if MesNasc = Mes then
         begin
            if DiaNasc >= dia then
               bMenorIdade := false
            else
               bMenorIdade := true;
         end
         else if (MesNasc > Mes ) then
            bMenorIdade := true
      end
      else if (Ano-18 > AnoNasc) then
         bMenorIdade := false
      else
         bMenorIdade := true;
   end
   else
      bMenorIdade:= false;
end;

procedure TfAlunosAfrica.btnRematricularClick(Sender: TObject);
Var iAnoSem : Integer;
    icodMatriculaCurso : Integer;
begin
  // Criar o formulário de Matricular no Curso
  Application.CreateForm(TFrmMatricularCurso, FrmMatricularCurso);

  // Criar o Formulário de Matrícula
  Application.CreateForm( TfrmMatricular, frmMatricular );

    // Alertar sobre alguma pendencia
  AlertarPendencias();

  // Verificar o ano/semestre padrão para matrículas
  iAnoSem := BuscaAnoSemestre();

  if tblMatriculaCurso.IsEmpty then begin

     icodMatriculaCurso := FrmMatricularCurso.IncluirMatricula(tblPessoacd_pessoa.AsInteger, iAnoSem);

     if icodMatriculaCurso = -1 then begin
        // Abortou o processo
        FreeAndNil(frmMatricular);
        FreeAndNil(FrmMatricularCurso);
        Exit;
     end;

     MatricularEtapa(icodMatriculaCurso, FrmMatricularCurso.qyMatriculaCursocd_curso.AsString, FrmMatricularCurso.qyMatriculaCursonr_anosem_ingresso.AsInteger, FrmMatricularCurso.qyMatriculaCursonr_matricula.AsString);

  end
  else begin

     icodMatriculaCurso := tblMatriculaCursocd_matricula_curso.AsInteger;

     MatricularEtapa(icodMatriculaCurso, tblMatriculaCursocd_curso.AsString, iAnoSem, tblMatriculaCursonr_matricula.AsString);

  end;

  // Limpar os formulários
  FreeAndNil(frmMatricular);
  FreeAndNil(FrmMatricularCurso);
end;

procedure TfAlunosAfrica.btAcad_NovoClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin

    if not DM.UsuarioLogado.TemPermissao( 1003, npIncluir, True ) then Exit;

    msg := '';

    // Posicionar o cursos no lugar CPF
    if pgPessoa.ActivePage = tsPai then begin
       iCod := tblPessoacd_pai.AsInteger;
       msg := 'Você está tentando efetuar um novo cadastro para o pai deste aluno. Deseja continuar?';
       dbNomePai.SetFocus();
    end
    else if pgPessoa.ActivePage = tsMae then begin
       iCod := tblPessoacd_mae.AsInteger;
       msg := 'Você está tentando efetuar um novo cadastro para o mãe deste aluno. Deseja continuar?';
       dbNomeMae.SetFocus();
    end
    else if pgPessoa.ActivePage = tsRespAcademico then begin
       iCod := tblPessoacd_resp_acad.AsInteger;
       msg := 'Você deseja desvincular o responsável acadêmico atual inserindo um novo cadastro?';
       dbNomeRespAcad.SetFocus();
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       iCod := tblPessoacd_resp_finan.AsInteger;
       msg := 'Você deseja desvincular o responsável financeiro atual inserindo um novo cadastro?';
       dbNomeRespFinan.SetFocus();
    end;

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

    tblResponsavel.Insert();
end;

procedure TfAlunosAfrica.AlertarPendencias;
begin

  // Alertar sobre pendencias financeiras
  if btnFinanceiro.Marked then begin
    if Mensagem( 'Aluno contém mensalidade(s) em aberto.' + #13 + 'Deseja visualizá-la(s) ?', 'Confirmação',
    MB_YESNO + MB_ICONSTOP ) = ID_YES then begin
      	 btnFinanceiroClick( nil );
    end;
  end;

  // Alertar sobre pendencias na documentaçào
  if btnDocumentos.Marked then begin
    if Mensagem( 'Aluno contém pendência com documentos necessários.' + #13 + 'Deseja visualizá-lo(s) ?', 'Confirmação',
    MB_YESNO + MB_ICONSTOP ) = ID_YES then begin
     	 btnDocumentosClick( nil );
    end;
  end;

  // Verificando, por parâmetro, se o indivíduo tem livros em atraso na biblioteca
  if ( DM.variavel_parametro( 'sn_avisa_financeiro_pendencia_biblioteca' ) = 'S' ) AND ( DM.TemLivrosAtrasados( tblPessoa.FieldByName('cd_pessoa').AsInteger ) ) then begin
      Mensagem( 'Este aluno possui livros em atraso na biblioteca.'+chr(13)+'Para visualizar as pendências, utilize o módulo Biblioteca.', 'Informação', MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TfAlunosAfrica.btAcad_AlunoClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin

    if pgPessoa.ActivePage = tsRespAcademico then begin
       iCod := tblPessoacd_resp_acad.AsInteger;
       msg := 'Deseja colocar o aluno como seu próprio responsável acadêmico?';

       if iCod > 0 Then
          if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

       tblPessoa.Edit;
       tblPessoacd_resp_acad.AsInteger := tblPessoacd_pessoa.ASInteger;
       tblPessoa.Post;
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       iCod := tblPessoacd_resp_finan.AsInteger;
       msg := 'Deseja colocar o aluno como seu próprio responsável financeiro?';

       if iCod > 0 Then
          if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

       VerificaMaiorIdade(tblPessoadt_nascimento.AsDateTime);
       if (bMenorIdade) then
         if Mensagem(MSG_ALUNO_MENOR_IDADE, 'Unimestre', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes Then Exit;

       tblPessoa.Edit;
       tblPessoacd_resp_finan.AsInteger := tblPessoacd_pessoa.ASInteger;
       tblPessoa.Post;
    end
    else Exit;

    tblResponsavel.Close();
    tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_pessoa.AsInteger;
    tblResponsavel.Open();
end;

procedure TfAlunosAfrica.btAcad_BuscaClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin
    msg := '';

    // Posicionar o cursos no lugar CPF
    if pgPessoa.ActivePage = tsPai then begin
       iCod := tblPessoacd_pai.AsInteger;
       msg := 'Você deseja selecionar outro cadastro para colocar como pai deste aluno?';
    end
    else if pgPessoa.ActivePage = tsMae then begin
       iCod := tblPessoacd_mae.AsInteger;
       msg := 'Você deseja selecionar outro cadastro para colocar como mãe deste aluno?';
    end
    else if pgPessoa.ActivePage = tsRespAcademico then begin
       iCod := tblPessoacd_resp_acad.AsInteger;
       msg := 'Você deseja desvincular o responsável acadêmico atual inserindo outra pessoa?';
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       iCod := tblPessoacd_resp_finan.AsInteger;
       msg := 'Você deseja desvincular o responsável financeiro atual inserindo outra pessoa?';
    end;

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

//    tblResponsavel.Insert;

    { Abrir Janela de BUSCA de PESSOAS }
    resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

    if resultado_filtro.filtrado then
    Begin
       tblPessoa.Edit;

       if pgPessoa.ActivePage = tsPai then begin
          tblPessoacd_pai.AsInteger := resultado_filtro.cd_pessoa;
          tblPessoanm_pai.AsString := resultado_filtro.nm_pessoa;
       end
       else if pgPessoa.ActivePage = tsMae then begin
          tblPessoacd_mae.AsInteger := resultado_filtro.cd_pessoa;
          tblPessoanm_mae.AsString := resultado_filtro.nm_pessoa;
       end
       else if pgPessoa.ActivePage = tsRespAcademico then
          tblPessoacd_resp_acad.AsInteger := resultado_filtro.cd_pessoa
       else if pgPessoa.ActivePage = tsRespFinanceiro then begin
         {verifica se o pai é maior de idade}
         VerificaMaiorIdade( getDtNascimentoPessoa(resultado_filtro.cd_pessoa));

         //verifica as mensalidades para a troca de responsável
         DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, resultado_filtro.cd_pessoa, tblPessoacd_resp_finan.AsInteger);
         tblPessoacd_resp_finan.AsInteger := resultado_filtro.cd_pessoa;
       end;

       if (bMenorIdade) then
         if Mensagem(MSG_ALUNO_MENOR_IDADE, 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

       tblPessoa.Post();

       tblResponsavel.Close();
       tblResponsavel.ParamByName('cd_responsavel').AsInteger := resultado_filtro.cd_pessoa;
       tblResponsavel.Open();

    End;

end;

procedure TfAlunosAfrica.pgPessoaChange(Sender: TObject);
begin
  inherited;
  { Verificar qual a página e trocar a barra de menu  }


  if pgPessoa.ActivePage = tsDadosPessoais then begin
     toolPessoa.Visible    := True;
     toolAcademico.Visible := False;
     toolMatricula.Visible := False;
  End
  else if pgPessoa.ActivePage = tsComplementares then begin
     toolPessoa.Visible    := True;
     toolAcademico.Visible := False;
     toolMatricula.Visible := False;
  end
  else if pgPessoa.ActivePage = tsPai then begin

     if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then
     begin
        toolPessoa.Visible    := True;
        toolAcademico.Visible := False;
        toolMatricula.Visible := False;

        tblPessoads_estado_nascimentoChange(nil);
        tblPessoads_estadoChange(nil);
        pgPessoa.ActivePage := tsDadosPessoais;
        exit;
     end;

     tblResponsavel.Close();
     tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_pai.AsInteger;
     tblResponsavel.Open();
     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := False;
     btAcad_Pai.Visible := False;
     btAcad_Mae.Visible := False;
  end
  else if pgPessoa.ActivePage = tsMae then begin

     if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then
     begin
        toolPessoa.Visible    := True;
        toolAcademico.Visible := False;
        toolMatricula.Visible := False;

        tblPessoads_estado_nascimentoChange(nil);
        tblPessoads_estadoChange(nil);
        pgPessoa.ActivePage := tsDadosPessoais;
        exit;
     end;

     tblResponsavel.Close();
     tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_mae.AsInteger;
     tblResponsavel.Open();
     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := False;
     btAcad_Pai.Visible := False;
     btAcad_Mae.Visible := False;
  end
  else if pgPessoa.ActivePage = tsRespAcademico then begin

     if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then
     begin
        toolPessoa.Visible    := True;
        toolAcademico.Visible := False;
        toolMatricula.Visible := False;

        tblPessoads_estado_nascimentoChange(nil);
        tblPessoads_estadoChange(nil);
        pgPessoa.ActivePage := tsDadosPessoais;
        exit;
     end;

     tblResponsavel.Close();
     tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_resp_acad.AsInteger;
     tblResponsavel.Open();
     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := True;
     btAcad_Pai.Visible := True;
     btAcad_Mae.Visible := True;
  end
  else if pgPessoa.ActivePage = tsRespFinanceiro then begin

     if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then
     begin
        toolPessoa.Visible    := True;
        toolAcademico.Visible := False;
        toolMatricula.Visible := False;

        tblPessoads_estado_nascimentoChange(nil);
        tblPessoads_estadoChange(nil);
        pgPessoa.ActivePage := tsDadosPessoais;
        exit;
     end;

     tblResponsavel.Close();
     tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_resp_finan.AsInteger;
     tblResponsavel.Open();
     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := True;
     btAcad_Pai.Visible := True;
     btAcad_Mae.Visible := True;
  end
  else if pgPessoa.ActivePage = tsMatricula then begin

     if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then
     begin
        toolPessoa.Visible    := True;
        toolAcademico.Visible := False;
        toolMatricula.Visible := False;

        tblPessoads_estado_nascimentoChange(nil);
        tblPessoads_estadoChange(nil);
        pgPessoa.ActivePage := tsDadosPessoais;
        exit;
     end;

     tblMatriculaCurso.Close;
     tblMatriculaCurso.Open;
     tblMatriculasEtapa.Close;
     tblMatriculasEtapa.Open;
     toolPessoa.Visible    := False;
     toolAcademico.Visible := False;
     toolMatricula.Visible := True;

     { Verificando se existem pendências financeiras }
     btnFinanceiro.Marked := FinanceiroPendente;
     { / Verificando se existem pendências financeiras }

     { Verificando se existem pendências de documentos }
     qyDocumentos.Close;
     qyDocumentos.ParamByName( 'cd_pessoa' ).AsInteger := tblPessoacd_pessoa.AsInteger;
     qyDocumentos.Open;
     btnDocumentos.Marked := (qyDocumentos.FieldByName( 'qtde' ).AsInteger > 0);

     if DM.variavel_parametro( 'sn_avisar_documentos_nao_necessarios' ) = 'S' then
     begin
        qyDocumentosNaoNecessarios.Close;
        qyDocumentosNaoNecessarios.ParamByName( 'cd_pessoa' ).AsInteger := tblPessoacd_pessoa.AsInteger;
        qyDocumentosNaoNecessarios.Open;
        btnDocumentos.Marked := (qyDocumentosNaoNecessarios.FieldByName( 'qtde' ).AsInteger > 0);
     end;

     { / Verificando se existem pendências de documentos }

     { Verificando se existem obs. pedagógicas }
     btnOrientacao.Marked :=
      TfObservacoes.HasObservations(tblPessoacd_pessoa.AsInteger, okPedagogical);
     { / Verificando se existem obs. pedagógicas }

     tblMatriculaCurso.Close;
     tblMatriculaCurso.Open;

     tblMatriculasEtapa.Close;
     tblMatriculasEtapa.Open;

  end;

end;

procedure TfAlunosAfrica.btAcad_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfAlunosAfrica.btFin_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfAlunosAfrica.btAcad_PaiClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin
    msg := '';

    // Posicionar o cursos no lugar CPF
    if pgPessoa.ActivePage = tsPai then begin
       Exit;
    end
    else if pgPessoa.ActivePage = tsMae then begin
       Exit;
    end
    else if pgPessoa.ActivePage = tsRespAcademico then begin
       iCod := tblPessoacd_resp_acad.AsInteger;
       msg := 'Você deseja desvincular o responsável acadêmico atual inserindo o pai como responsável?';
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       iCod := tblPessoacd_resp_finan.AsInteger;
       msg := 'Você deseja desvincular o responsável financeiro atual inserindo o pai como responsável?';
    end;

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

    tblPessoa.Edit;

    if pgPessoa.ActivePage = tsRespAcademico then
       tblPessoacd_resp_acad.AsInteger := tblPessoacd_pai.AsInteger
    else if pgPessoa.ActivePage = tsRespFinanceiro then
       tblPessoacd_resp_finan.AsInteger := tblPessoacd_pai.AsInteger;

    VerificaMaiorIdade(getDtNascimentoPessoa(tblPessoacd_pai.AsInteger));
    if (bMenorIdade) then
       if Mensagem(MSG_ALUNO_MENOR_IDADE, 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

    tblPessoa.Post;

    tblResponsavel.Close();
    tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_pai.AsInteger;
    tblResponsavel.Open();

end;

procedure TfAlunosAfrica.btAcad_MaeClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin
    msg := '';

    if pgPessoa.ActivePage = tsPai then begin
       Exit;
    end
    else if pgPessoa.ActivePage = tsMae then begin
       Exit;
    end
    else if pgPessoa.ActivePage = tsRespAcademico then begin
       iCod := tblPessoacd_resp_acad.AsInteger;
       msg := 'Você deseja desvincular o responsável acadêmico atual inserindo o pai como responsável?';
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       iCod := tblPessoacd_resp_finan.AsInteger;
       msg := 'Você deseja desvincular o responsável financeiro atual inserindo o pai como responsável?';
    end;

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

    tblPessoa.Edit;

    if pgPessoa.ActivePage = tsRespAcademico then
       tblPessoacd_resp_acad.AsInteger := tblPessoacd_mae.AsInteger
    else if pgPessoa.ActivePage = tsRespFinanceiro then
       tblPessoacd_resp_finan.AsInteger := tblPessoacd_mae.AsInteger;

    VerificaMaiorIdade(getDtNascimentoPessoa(tblPessoacd_mae.AsInteger));
    if (bMenorIdade) then
       if Mensagem(MSG_ALUNO_MENOR_IDADE, 'Unimestre', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

    tblPessoa.Post;

    tblResponsavel.Close();
    tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_mae.AsInteger;
    tblResponsavel.Open();

end;

procedure TfAlunosAfrica.btAcad_SalvarClick(Sender: TObject);
begin
  inherited;

   if (pgPessoa.ActivePage = tsPai) then
   begin
      DBEdit9.SetFocus;
      dbNomePai.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsMae) then
   begin
      DBEdit12.SetFocus;
      dbNomeMae.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsRespAcademico) then
   begin
      DBEdit31;
      dbNomeRespAcad.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsRespFinanceiro) then
   begin
      DBEdit37;
      dbNomeRespFinan.SetFocus;
   end;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

  if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;

  if (pgPessoa.ActivePage = tsRespFinanceiro) AND (dBEdit35.Text <> '  /  /    ') and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
     VerificaMaiorIdade(StrToDate(DBEdit35.Text))
  else
     bMenorIdade := false;
  
  if (bMenorIdade) then
     if Mensagem(MSG_ALUNO_MENOR_IDADE, 'Unimestre', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes Then Exit;

  tblResponsavel.Post;

  if not tblResponsavel.EOF Then begin
     tblContatoResponsavel.Close();
     verificar_contatos_padroes(tblResponsavelcd_pessoa.AsInteger);
     tblContatoResponsavel.Open();
  end;

end;

procedure TfAlunosAfrica.btAcad_CancelarClick(Sender: TObject);
begin
  inherited;
  tblResponsavel.Cancel;
end;

procedure TfAlunosAfrica.tblResponsavelds_sexoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
   if Sender.AsString = 'M'
   Then Text := 'Masculino'
   else

      if Sender.AsString = 'F'
         Then Text := 'Feminino'
         else Text := '';
end;

procedure TfAlunosAfrica.tblResponsavelds_sexoSetText(Sender: TField;
  const Text: String);
begin
  inherited;
   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else
      if Text = 'Feminino'
      Then Sender.AsString := 'F';
end;

procedure TfAlunosAfrica.dsResponsavelStateChange(Sender: TObject);
Var
   EstaEditando : Boolean;
begin
      { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblResponsavel.State in [dsEdit, dsInsert] );

      btAcad_Novo.Enabled  := not EstaEditando;
      btAcad_Busca.Enabled  := not EstaEditando;
      btAcad_Aluno.Enabled  := not EstaEditando;
      btAcad_Pai.Enabled := not EstaEditando;
      btAcad_Mae.Enabled   := not EstaEditando;
      btAcad_Fechar.Enabled   := not EstaEditando;

      btAcad_Salvar.Enabled   := EstaEditando;
      btAcad_Cancelar.Enabled := EstaEditando;
end;

procedure TfAlunosAfrica.btnDocumentosClick(Sender: TObject);
begin

  inherited;

  Application.CreateForm(TfrmDocumentos,frmDocumentos);
  frmDocumentos.CodigoAluno := tblPessoacd_pessoa.AsInteger;
  frmDocumentos.lbAluno.Caption := tblPessoanm_pessoa.AsString;
  frmDocumentos.ShowModal;

end;

procedure TfAlunosAfrica.dsPessoaDataChange(Sender: TObject; Field: TField);
Var
   strAux : String;
begin
  inherited;

  { Se tiver alterando não precisa fazer nada }
  if tblPessoa.State in [dsEdit] then
     Exit;

  Screen.Cursor := crHourGlass;

  if tblPessoa.State in [dsInsert] then
      btnFinanceiro.Marked := False;

  if pgPessoa.ActivePageIndex = 6 then
  begin

    btnFinanceiro.Marked := FinanceiroPendente;

    tblMatriculaCurso.Close;
    tblMatriculaCurso.Open;

    tblMatriculasEtapa.Close;
    tblMatriculasEtapa.Open;

  end;

  Screen.Cursor := crDefault;

end;

procedure TfAlunosAfrica.dsPessoaStateChange(Sender: TObject);
begin
  inherited;
  dbCodigo.ReadOnly := not (tblPessoa.State = dsInsert) ;
end;

procedure TfAlunosAfrica.btnFinanceiroClick(Sender: TObject);
var
   cd_coligada : Integer;
begin
  if not PrincipalForm.ProcuraForm( TForm(frmFinanceiro) ) then
  begin
     Application.CreateForm(TfrmFinanceiro, frmFinanceiro);
  end;
  
  cd_coligada := DM.getColigadaTurma(tblMatriculasEtapaturma.AsString,tblMatriculasEtapaanosemestre.AsInteger);
  frmFinanceiro.ShowDebitos( tblPessoacd_pessoa.AsInteger, inttostr(cd_coligada) );
end;

procedure TfAlunosAfrica.btnMatricularClick(Sender: TObject);
const
   STitInfo = 'Informação';
   SChaveAcao = 'Academico.Pessoas.Alunos.Matricula.Matricular';
   SInfoSemRespFinan = 'Não foi selecionado um responsável financeiro para este aluno. Esta informação é imprescindível para prosseguir com a matrícula.';
   SInfoPendenciaFin = 'O aluno possui pendência financeira. Usuário não possui permissão para realizar a matrícula nesta situação.';
begin
   if tblPessoacd_resp_finan.AsInteger > 0 then
   begin
      if DM.UsuarioLogado.TemPermissao(1019, npAlterar, True) then
      begin
         if (not btnFinanceiro.Marked) or
            DM.UsuarioLogado.TemPermissao(1019, npIncluir, False) then
         begin

            if btnFinanceiro.Marked then
            begin
               AlertarPendencias;
            end;
            
            if DM.variavel_parametro('novo.processo.matricula') = 'S' then
            begin
               Application.CreateForm(TfMatricular, fMatricular);
               fMatricular.Pessoa := tblPessoacd_pessoa.AsInteger;
               fMatricular.Curso := tblMatriculaCursocd_curso.AsString;
               fMatricular.ShowModal;

               tblMatriculaCurso.Close;
               tblMatriculaCurso.Open;
               tblMatriculasEtapa.Close;
               tblMatriculasEtapa.Open;
            end
            else
            begin
               Application.CreateForm(TFrmMatricula, FrmMatricula);

               with FrmMatricula do
               begin
                  iCodAluno := tblPessoacd_pessoa.AsInteger;
                  sNomeAluno := tblPessoanm_pessoa.AsString;
                  iCodRespFinan := tblPessoacd_resp_finan.AsInteger;
                  iAnoSem := BuscaAnoSemestre;
                  sTurma := '';
                  if tblMatriculaCurso.IsEmpty then
                  begin
                     iMatriculaCurso := -1;
                  end
                  else
                  begin
                     iMatriculaCurso :=
                        tblMatriculaCursocd_matricula_curso.AsInteger;
                  end;
                  Acao := Matricular;
                  ShowModal;
               end;

               tblMatriculaCurso.Close;
               tblMatriculaCurso.Open;
               tblMatriculasEtapa.Close;
               tblMatriculasEtapa.Open;
               FreeAndNil(FrmMatricula);
            end;
         end
         else
         begin
            MessageBox(Handle, PChar(SInfoPendenciaFin), PChar(STitInfo),
               MB_ICONINFORMATION or MB_OK);
         end;
      end;
   end
   else
   begin
      MessageBox(Handle, PChar(SInfoSemRespFinan), PChar(STitInfo),
         MB_ICONINFORMATION or MB_OK);
      pgPessoa.SelectNextPage(False, True);
   end;
end;

function TfAlunosAfrica.FinanceiroPendente: Boolean;
const
   SQL_PENDENCIAS =
      'SELECT '+
         'COUNT(*) AS RESULTADO '+
      'FROM '+
         'MENSALIDADES M '+
            'LEFT JOIN PESSOAS P ON '+
               '(M.CD_RESP = P.CD_PESSOA) AND '+
               '(P.SN_NAO_BLOQUEAR_FINANCEIRO = 1) '+
      'WHERE '+
         'P.CD_PESSOA IS NULL AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         '%s';

   SQL_FILTRO_FIXO = 'M.SITUACAO IN (2, 10) AND M.DATAVENCIMENTO <= :DT_VENCTO';
var
   LSFiltro: string;
begin
   { Verificando se existem pendências financeiras }
   if DM.variavel_parametro('matricula_avisa_financeiro_filtro') <> '' then
      LSFiltro := DM.variavel_parametro('matricula_avisa_financeiro_filtro')
   else
      LSFiltro := SQL_FILTRO_FIXO;
   
   qryMensalidades.Close;
   qryMensalidades.SQL.Text := Format(SQL_PENDENCIAS, [LSFiltro]);
   qryMensalidades.ParamByName('CD_ALUNO').AsInteger := tblPessoacd_pessoa.AsInteger;
   if qryMensalidades.Params.FindParam('DT_VENCTO') <> nil then
      qryMensalidades.ParamByName('DT_VENCTO').AsDate := DataHoje;
   qryMensalidades.Open;

   btnFinanceiro.Marked := qryMensalidades.FieldByName('RESULTADO').AsInteger > 0;
   btnFinanceiro.Tag := qryMensalidades.FieldByName('RESULTADO').AsInteger;
   Result := qryMensalidades.FieldByName('RESULTADO').AsInteger > 0;
end;

procedure TfAlunosAfrica.btBuscar_PessoaClick(Sender: TObject);
begin
   AbaSelecionada := afpEstudante;
   inherited;

   if not tblPessoa.EOF then
   begin
      tblContatoPessoa.Close();
      verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
      tblContatoPessoa.Open();
      if pgPessoa.ActivePage = tsMatricula then
         pgPessoaChange(Self);
   end;
end;

procedure TfAlunosAfrica.DBGrid4DblClick(Sender: TObject);
begin
//  inherited;

  if not DM.UsuarioLogado.TemPermissao( 1009, npAcesso, True ) then Exit;

  if not PrincipalForm.ProcuraForm( TForm(frmMatriculas) ) then
     Application.CreateForm( TfrmMatriculas, frmMatriculas )
  else
     frmMatriculas.Show;

  frmMatriculas.lngCodigoAluno := tblMatriculasEtapacodigoaluno.AsInteger;
  frmMatriculas.TipoFiltro := FiltroAluno;
  frmMatriculas.Filtrar();

  frmMatriculas.PageControl1.ActivePageIndex := 1;
  frmMatriculas.dtcMatriculasDataChange(nil,nil);
end;

procedure TfAlunosAfrica.btImprimir_PessoaClick(Sender: TObject);
begin
  inherited;

   if pgPessoa.ActivePage <> tsMatricula then
   Begin
       tblMatriculaCurso.Close;
       tblMatriculaCurso.Open;
       tblMatriculasEtapa.Close;
       tblMatriculasEtapa.Open;

   End;

   Application.CreateForm(TfrmImpAlunosAfrica, frmImpAlunosAfrica);
   frmImpAlunosAfrica.ShowModal;
   FreeAndNil(frmImpAlunosAfrica);

end;

procedure TfAlunosAfrica.tblContatoResponsavelNewRecord(DataSet: TDataSet);
begin
//   inherited;
   tblContatoResponsavelcd_pessoa.AsInteger := tblResponsavelcd_pessoa.AsInteger;
   tblContatoResponsavelcd_contato.AsInteger := 1; // Telefone Residencial

end;

procedure TfAlunosAfrica.tblContatoResponsavelBeforePost(DataSet: TDataSet);
begin
//  inherited;

   if tblContatoResponsavelcd_contato.AsInteger = 0 Then
      tblContatoResponsavelcd_contato.AsInteger := 1;

end;

procedure TfAlunosAfrica.tblPessoaBeforePost(DataSet: TDataSet);
const
   SInfoBirthday = 'O preenchimento da data de nascimento é obrigatório.';
   SCaption = 'Atenção';
begin
   inherited;
   if tblPessoadt_nascimento.IsNull then
   begin
      MessageBox(Handle, PChar(SInfoBirthday), PChar(SCaption),
         MB_ICONWARNING + MB_OK);
      Abort;
   end;
end;

procedure TfAlunosAfrica.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin

  if (tblPessoa.State in [dsInsert, dsEdit]) or (tblResponsavel.State in [dsInsert, dsEdit]) Then
  Begin
      Mensagem('Salve as alterações antes de passar para a próxima guia.','Atenção', MB_OK + MB_ICONWARNING);
      AllowChange := False;
  End
  Else begin
      AllowChange := True;
      tblResponsavel.Close();
  end

end;

procedure TfAlunosAfrica.copiar_endereco_aluno;
begin
   { Somente copiar se estiver no modo de edição }
   if tblResponsavel.State in [dsEdit, dsInsert] Then Begin
      tblResponsavel.FieldByName('ds_cep').AsString := tblPessoa.FieldByName('ds_cep').AsString;
      tblResponsavel.FieldByName('ds_pais').AsString := tblPessoa.FieldByName('ds_pais').AsString;
      tblResponsavel.FieldByName('ds_estado').AsString := tblPessoa.FieldByName('ds_estado').AsString;
      tblResponsavel.FieldByName('ds_cidade').AsString := tblPessoa.FieldByName('ds_cidade').AsString;
      tblResponsavel.FieldByName('ds_bairro').AsString := tblPessoa.FieldByName('ds_bairro').AsString;
      tblResponsavel.FieldByName('ds_logradouro').AsString := tblPessoa.FieldByName('ds_logradouro').AsString;
      tblResponsavel.FieldByName('ds_logradouro_nro').AsString := tblPessoa.FieldByName('ds_logradouro_nro').AsString;
      tblResponsavel.FieldByName('ds_complemento').AsString := tblPessoa.FieldByName('ds_complemento').AsString;

      // Copiar os contatos
      if DM.variavel_parametro('matricula_copiar_contatos') <> '' then begin

         tblContatosPadroes.Close();
         tblContatosPadroes.SQL.Text :=
           ' REPLACE INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) ' +
          ' SELECT ' + tblResponsavel.FieldByName('cd_pessoa').AsString + ', ct.cd_contato, cp.ds_contato FROM contatos_tipos ct ' +
          ' INNER JOIN contatos_pessoas cp ON (ct.cd_contato = cp.cd_contato AND cp.cd_pessoa = ' + tblPessoa.FieldByName('cd_pessoa').AsString + ') '+
          ' WHERE ct.cd_contato in ' + DM.variavel_parametro('matricula_copiar_contatos');
         tblContatosPadroes.ExecSQL();

         tblContatosPadroes.Close();
         tblContatosPadroes.SQL.Text :=
          ' DELETE FROM contatos_pessoas ' +
          ' WHERE cd_pessoa = ' + tblResponsavel.FieldByName('cd_pessoa').AsString +
          ' AND cd_contato in ' + DM.variavel_parametro('matricula_copiar_contatos') +
          ' AND ds_contato = "" ';
         tblContatosPadroes.ExecSQL();

         tblContatoResponsavel.Close();
         tblContatoResponsavel.Open;
      end;
   End;

end;

procedure TfAlunosAfrica.FormCreate(Sender: TObject);
begin
   if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
   begin
      btnObservacoes.Caption := DM.variavel_parametro('botao_observacoes_nome');
      if Trim(btnObservacoes.Caption) = EmptyStr then
         btnObservacoes.Caption := 'Orientação Pedagógica'
      else
         btnOrientacao.Caption := btnObservacoes.Caption;
   end;

//   if DM.variavel_parametro('novo.processo.matricula') = 'S' then
  // Na África sempre foi chamado de "Ajustar Matrícula"
      ToolButton7.Caption := 'Ajustar matrícula';
end;

procedure TfAlunosAfrica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F10) then
  Begin
      sbMaisInformacoesClick( nil );
      exit;
  End;

  case Key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btIncluir_Pessoa.Enabled then btIncluir_PessoaClick( nil );
      VK_F3 : if btAlterar_Pessoa.Enabled then btAlterar_PessoaClick( nil );
      VK_F9 : if btExcluir_Pessoa.Enabled then btExcluir_PessoaClick( nil );
      VK_F5 : if btSalvar_Pessoa.Enabled then btSalvar_PessoaClick( nil );
      VK_F6 : if btCancelar_Pessoa.Enabled then btCancelar_PessoaClick( nil );
      VK_F8 : if btBuscar_Pessoa.Enabled then btBuscar_PessoaClick( nil );
      VK_F12 : if btFechar_Pessoa.Enabled then btFechar_PessoaClick( nil );
  end;

//  inherited;
  if ((Key = ord('e')) or (Key = Ord('E'))) and (Shift =  [ssCtrl]) Then
  Begin
       copiar_endereco_aluno;
  End;

end;

procedure TfAlunosAfrica.FormShow(Sender: TObject);
begin
  inherited;
  dbNome.SetFocus();
  frParentes1.Buscar.Visible := False;

  { inicia permissao }
  iPermissao := 1001;

end;

function TfAlunosAfrica.getDtNascimentoPessoa(
  const cd_pessoa: Integer): TDateTime;
var
   qyRespIdade : TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyRespIdade);
   qyRespIdade.SQL.Text := 'SELECT dt_nascimento FROM pessoas WHERE cd_pessoa = :cd_pessoa';
   qyRespIdade.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
   qyRespIdade.Open;
   Result := qyRespIdade.FieldByName('dt_nascimento').AsDateTime;

   FreeAndNil(qyRespIdade);
end;

procedure TfAlunosAfrica.verificar_contatos_padroes(CodAluno : Integer);
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


procedure TfAlunosAfrica.tblRespFinanceirods_sexoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Sender.AsString = 'M'
   Then Text := 'Masculino'
   else

      if Sender.AsString = 'F'
	 Then Text := 'Feminino'
	 else Text := '';

end;

procedure TfAlunosAfrica.tblRespFinanceirods_sexoSetText(Sender: TField;
  const Text: String);
begin
   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else

      if Text = 'Feminino'
      Then Sender.AsString := 'F';
end;

procedure TfAlunosAfrica.btSalvar_PessoaClick(Sender: TObject);
begin
  inherited;

  if (pgPessoa.ActivePage = tsDadosPessoais) then
  begin
     dblcCep.SetFocus;
     dbNome.SetFocus;
  end;

  if (pgPessoa.ActivePage = tsPai) then
   begin
      DBEdit9.SetFocus;
      dbNomePai.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsMae) then
   begin
      DBEdit12.SetFocus;
      dbNomeMae.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsRespAcademico) then
   begin
      DBEdit31;
      dbNomeRespAcad.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsRespFinanceiro) then
   begin
      DBEdit37;
      dbNomeRespFinan.SetFocus;
   end;

  if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

   bMenorIdade := false;
   // verifica se o responsave
   if (dbnasc.Text <> '  /  /    ' ) then
      VerificaMaiorIdade(StrToDate(dbNasc.Text));

   if (bMenorIdade = true) then
   begin
      // Se a pessoa é menor de idade, e ela é responsável financeiro dela mesma, remove         
      if (tblPessoacd_pessoa.AsInteger = tblPessoacd_resp_finan.AsInteger ) then
      begin
         tblPessoa.Edit;
         tblPessoacd_resp_finan.AsInteger := 0;
         tblPessoa.Post;
      end;
   end else begin
      if tblPessoa.State in [dsInsert] then
      begin
         tblPessoa.Edit;
         tblPessoacd_resp_finan.AsInteger := tblPessoacd_pessoa.AsInteger;
         tblPessoa.Post;
      end;
   end;

  if not tblPessoa.EOF Then begin
     tblContatoPessoa.Close();
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
     tblContatoPessoa.Open();
  end;

end;

Function TfAlunosAfrica.BuscaAnoSemestre : Integer;
Var
   strAnoSem : string;
   wAno, wMes, wDia : Word;
begin
   if DM.variavel_parametro('ano_semestre_incremento') = '2' then
      ano_semestre_incremento := 2
   else
      ano_semestre_incremento := 1;

   DecodeDate(DataHoje,wAno,wMes,wDia);
   if ano_semestre_incremento = 1 then
      if wMes >= 7 then
         strAnoSem := (FormatDateTime('yyyy',DataHoje)+'2')
      else
         strAnoSem := (FormatDateTime('yyyy',DataHoje)+'1')
   else
      strAnoSem := (FormatDateTime('yyyy',DataHoje)+'1');

  result := StrToInt( strAnoSem );
end;

procedure TfAlunosAfrica.dbNomeRespFinanExit(Sender: TObject);
begin
   { Verificar se existe algum nome cadastrado }

   if tblResponsavel.State <> dsInsert then
      Exit;

   Dm.qAux1.Close;
   Dm.qAux1.SQL.Clear;
   DM.qAux1.SQL.Add('select cd_pessoa, nm_pessoa, ds_cpf, nm_pai from pessoas where nm_pessoa = :nome');
   Dm.qAux1.ParamByName('nome').AsString := tblResponsavelnm_pessoa.AsString;
   Dm.qAux1.Open;

   while not Dm.qAux1.Eof do
   Begin
      if Mensagem('Existe uma pessoa com o mesmo nome cadastrada no sistema.' + chr(13) +
                  '   Nome : ' + DM.qAux1.FieldByName('nm_pessoa').AsString + '  (' + DM.qAux1.FieldByName('cd_pessoa').AsString + ')' + chr(13) +
                  '   CPF : ' + DM.qAux1.FieldByName('ds_cpf').AsString + chr(13) +
                  '   Nome do Pai : ' + DM.qAux1.FieldByName('nm_pai').AsString + chr(13) + chr(13) +
                  'Deseja alterar este cadastro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
      = mrYes Then
      Begin
          tblResponsavel.Cancel;
          tblPessoa.Edit;

          if pgPessoa.ActivePage = tsPai then
             tblPessoacd_pai.AsInteger := DM.qAux1.FieldByName('cd_pessoa').AsInteger
          else if pgPessoa.ActivePage = tsMae then
             tblPessoacd_mae.AsInteger := DM.qAux1.FieldByName('cd_pessoa').AsInteger
          else if pgPessoa.ActivePage = tsRespAcademico then
             tblPessoacd_resp_acad.AsInteger := DM.qAux1.FieldByName('cd_pessoa').AsInteger
          else if pgPessoa.ActivePage = tsRespFinanceiro then
             tblPessoacd_resp_finan.AsInteger := DM.qAux1.FieldByName('cd_pessoa').AsInteger;

          tblPessoa.Post;

          tblResponsavel.Close;
          tblResponsavel.ParamByName('cd_responsavel').AsInteger := DM.qAux1.FieldByName('cd_pessoa').AsInteger;
          tblResponsavel.Open;

          Exit;
      End;


      DM.qAux1.Next;
   End;

end;

procedure TfAlunosAfrica.sbMaisInformacoesClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('A', tblPessoacd_Pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.', 'Atenção', MB_OK + MB_ICONWARNING );

  FreeAndNil(frm_pessoas_adicional);

end;

procedure TfAlunosAfrica.sbMaisInformacoesAcademicoClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('P', tblResponsavelcd_pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.', 'Atenção', MB_OK + MB_ICONWARNING );

  FreeAndNil(frm_pessoas_adicional);

end;

procedure TfAlunosAfrica.btnObservacoesClick(Sender: TObject);
begin
   btnOrientacao.Click;
end;

procedure TfAlunosAfrica.btnOrientacaoClick(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblPessoacd_pessoa.AsInteger,
         okPedagogical)
   else
      Mensagem('Selecione um aluno para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure TfAlunosAfrica.DBEdit41KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pgDocFinan.ActivePageIndex := 0;
     dbCPFFinan.SetFocus;
     Key := #0;
  End;
end;

procedure TfAlunosAfrica.DBGrid1Exit(Sender: TObject);
begin
   if tblContatoResponsavel.State in [dsEdit, dsInsert] then
   Begin
       try
          tblContatoResponsavel.Post;
       except
          tblContatoResponsavel.Cancel;
       end;
   End;
   tblContatoResponsavel.Close;
   tblContatoResponsavel.Open;

end;

procedure TfAlunosAfrica.sbCepPaiClick(Sender: TObject);
begin
  tblResponsavel.Edit;

  Application.CreateForm(TfrmSelCep, frmSelCep);

  frmSelCep.ShowModal;

  if frmSelCep.flgSearch then
  begin
    tblResponsavel.FieldByName('ds_cep').AsString := frmSelCep.qyCep.FieldByName('ds_cep').AsString;
    tblResponsavel.FieldByName('ds_cidade').AsString := frmSelCep.qyCep.FieldByName('nm_cidade').AsString;
    tblResponsavel.FieldByName('ds_estado').AsString := frmSelCep.qyCep.FieldByName('ds_uf').AsString;
    tblResponsavel.FieldByName('ds_bairro').AsString := frmSelCep.qyCep.FieldByName('nm_bairro').AsString;
    tblResponsavel.FieldByName('ds_logradouro').AsString := frmSelCep.qyCep.FieldByName('nm_logradouro').AsString;
  end;

  FreeAndNil(frmSelCep);

end;

procedure TfAlunosAfrica.DBEdit63KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pgDocPai.ActivePageIndex := 0;
     dbCPFPai.SetFocus;
     Key := #0;
  End;
end;

procedure TfAlunosAfrica.DBEdit16KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     pgDocAcad.ActivePageIndex := 0;
     dbCPFAcad.SetFocus;
     Key := #0;
  End;

end;

procedure TfAlunosAfrica.sbBuscarPaiClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin
    msg := '';

    iCod := tblPessoacd_pai.AsInteger;
    msg := 'Você deseja selecionar outro cadastro para colocar como pai deste aluno?';

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

    { Abrir Janela de BUSCA de PESSOAS }
    resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

    if resultado_filtro.filtrado then
    Begin

       tblPessoa.Edit;
       tblPessoacd_pai.AsInteger := resultado_filtro.cd_pessoa;
       tblPessoanm_pai.AsString := resultado_filtro.nm_pessoa;
       tblPessoa.Post();

    End;
end;

procedure TfAlunosAfrica.sbBuscarMaeClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin
    msg := '';

    iCod := tblPessoacd_mae.AsInteger;
    msg := 'Você deseja selecionar outro cadastro para colocar como mãe deste aluno?';

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

    { Abrir Janela de BUSCA de PESSOAS }
    resultado_filtro := TfrmSelecionarPessoa.Filtrar([]);

    if resultado_filtro.filtrado then
    begin
       tblPessoa.Edit;
       tblPessoacd_mae.AsInteger := resultado_filtro.cd_pessoa;
       tblPessoanm_mae.AsString := resultado_filtro.nm_pessoa;
       tblPessoa.Post();
    end;
end;


procedure TfAlunosAfrica.MatricularEtapa(CodMatricula: Integer; Curso : String; AnoSem: Integer; NrMatricula : String);
var
  qryBuscaDpto : TUMZQuery;
begin
  DM.CriarConsulta(qryBuscaDpto);
  qryBuscaDpto.SQL.Text :=
  '   SELECT                                   '+
  '     d.cd_instituicao  as codigo            '+
  '   FROM                                     '+
  '     departamentos d                        '+
  '     INNER JOIN  CURSOS c ON (d.codigo = c.depto )   '+
  '   WHERE                                             '+
  '     c.codigo = '''+ Curso                         +''''+
  '   GROUP BY                                          '+
  '     d.codigo                                        ';
  qryBuscaDpto.Open;
// Verificar se ja tem matrícula, e procurar turmas para a proxima etapa }

  frmMatricular.tblMatriculas.SQL.Clear;
  frmMatricular.tblMatriculas.SQL.Add( 'select * from Matriculas where' );
  frmMatricular.tblMatriculas.SQL.Add( 'CodigoAluno = :CodigoAluno' );
  frmMatricular.tblMatriculas.ParamByName('CodigoAluno').AsInteger := fAlunosAfrica.tblPessoacd_pessoa.AsInteger;
  // frmMatricular.tblMatriculas.RequestLive := True;
  frmMatricular.tblMatriculas.Open;
  frmMatricular.tblMatriculas.Append;

  // Matricula no Curso
  frmMatricular.tblMatriculascd_matricula_curso.AsInteger := CodMatricula;

  frmMatricular.tblMatriculasAnoSemestre.AsInteger := AnoSem;
  frmMatricular.tblMatriculasCurso.AsString := Curso;
  frmMatricular.tblMatriculascd_matricula.AsString := NrMatricula;

  if not tblMatriculasEtapa.EOF Then Begin

     tblMatriculasEtapa.Last;

     frmMatricular.serie := tblMatriculasEtapaserie.AsInteger + 1;

     frmMatricular.tblTurmas.Close;
     frmMatricular.tblTurmas.SQL.Text := ' select Turmas.*, Cursos.Depto from Turmas,  Cursos';
     frmMatricular.tblTurmas.SQL.Add('where Turmas.AnoSemestre = :AnoSemestre AND Turmas.Curso = Cursos.Codigo');
     frmMatricular.tblTurmas.SQL.Add('AND Cursos.AnoSemestre = Turmas.AnoSemestre AND Cursos.Codigo = :Curso');
     frmMatricular.tblTurmas.SQL.Add('AND Turmas.Serie = :serie');
     frmMatricular.tblTurmas.SQL.Add('order by Turmas.Codigo');

     frmMatricular.tblTurmas.ParamByName('Curso').AsString := Curso;
     frmMatricular.tblTurmas.ParamByName('anosemestre').AsInteger := AnoSem;
     frmMatricular.tblTurmas.ParamByName('Serie').AsInteger := tblMatriculasEtapaserie.AsInteger + 1;

     frmMatricular.tblTurmas.Open;

     if not frmMatricular.tblTurmas.Eof Then
     Begin

//        frmMatricular.CheckBox1.Visible := True;
        frmMatricular.CheckBox1.Checked := True;

      	// Re-Matricula
        frmMatricular.tblMatriculascd_ingresso.AsInteger := 6;
        if qryBuscaDpto.FieldByName('codigo').AsString <> '' then
           frmMatricular.tblMatriculascd_instituicao_origem.AsInteger := qryBuscaDpto.FieldByName('codigo').AsInteger;

     End
     else
//        frmMatricular.CheckBox1.Visible := False;
  End
  Else
  Begin

     frmMatricular.serie := 0;
//     frmMatricular.CheckBox1.Visible := False;
  End;

  frmMatricular.ShowModal;

  dsPessoaDataChange(nil,nil);
  FreeAndNil(qryBuscaDpto);
end;

procedure TfAlunosAfrica.MenuItem5Click(Sender: TObject);
begin
    tblContatoResponsavel.Insert;

end;

procedure TfAlunosAfrica.MenuItem6Click(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir o contato ' + tblContatoPEssoadescContato.AsString +' ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION)
   = mrYes then
   Begin
       tblContatoResponsavel.Delete;
   End;

end;

procedure TfAlunosAfrica.miExcluirClick(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
   begin
      if tblPessoa.State <> dsEdit then tblPessoa.Edit;
      tblPessoaim_pessoa.Clear;
      imageFoto.Picture.Assign(nil);
   end;
end;

procedure TfAlunosAfrica.sbCopiarAlunoClick(Sender: TObject);
begin
   // Copiar Endereço do Aluno;
  tblResponsavel.Edit;
  copiar_endereco_aluno;
end;

procedure TfAlunosAfrica.tblResponsavelAfterOpen(DataSet: TDataSet);
begin
  tblContatoResponsavel.Close();
  verificar_contatos_padroes(tblResponsavelcd_pessoa.AsInteger);
  tblContatoResponsavel.Open();

end;

procedure TfAlunosAfrica.sbMaisInformacoesFinanceiroClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('P', tblResponsavelcd_pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.', 'Atenção', MB_OK + MB_ICONWARNING);

  FreeAndNil(frm_pessoas_adicional);


end;

procedure TfAlunosAfrica.sbCopiarRespClick(Sender: TObject);
begin
  if Mensagem('Deseja copiar o endereço do responsável financeiro do aluno?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then Exit;

  tblResponsavel.Close();
  tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_resp_finan.AsInteger;
  tblResponsavel.Open();

  if tblResponsavel.Eof then Exit; // Não tem responsável

  tblPessoa.Edit;

   { Somente copiar se estiver no modo de edição }
  tblPessoa.FieldByName('ds_cep').AsString := tblResponsavel.FieldByName('ds_cep').AsString;
  tblPessoa.FieldByName('ds_pais').AsString := tblResponsavel.FieldByName('ds_pais').AsString;
  tblPessoa.FieldByName('ds_estado').AsString := tblResponsavel.FieldByName('ds_estado').AsString;
  tblPessoa.FieldByName('ds_cidade').AsString := tblResponsavel.FieldByName('ds_cidade').AsString;
  tblPessoa.FieldByName('ds_bairro').AsString := tblResponsavel.FieldByName('ds_bairro').AsString;
  tblPessoa.FieldByName('ds_logradouro').AsString := tblResponsavel.FieldByName('ds_logradouro').AsString;
  tblPessoa.FieldByName('ds_logradouro_nro').AsString := tblResponsavel.FieldByName('ds_logradouro_nro').AsString;
  tblPessoa.FieldByName('ds_complemento').AsString := tblResponsavel.FieldByName('ds_complemento').AsString;

  // Copiar os contatos
  if DM.variavel_parametro('matricula_copiar_contatos') <> '' then begin

         tblContatosPadroes.Close();
         tblContatosPadroes.SQL.Text :=
          ' REPLACE INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) ' +
          ' SELECT ' + tblPessoa.FieldByName('cd_pessoa').AsString + ', ct.cd_contato, cp.ds_contato FROM contatos_tipos ct ' +
          ' INNER JOIN contatos_pessoas cp ON (ct.cd_contato = cp.cd_contato AND cp.cd_pessoa = ' + tblResponsavel.FieldByName('cd_pessoa').AsString + ') '+
          ' WHERE ct.cd_contato in ' + DM.variavel_parametro('matricula_copiar_contatos');
         tblContatosPadroes.ExecSQL();

         tblContatosPadroes.Close();
         tblContatosPadroes.SQL.Text :=
          ' DELETE FROM contatos_pessoas ' +
          ' WHERE cd_pessoa = ' + tblPessoa.FieldByName('cd_pessoa').AsString +
          ' AND cd_contato in ' + DM.variavel_parametro('matricula_copiar_contatos') +
          ' AND ds_contato = "" ';
         tblContatosPadroes.ExecSQL();

     tblContatoPessoa.Close();
     tblContatoPessoa.Open;
  end;

end;

procedure TfAlunosAfrica.sbHistoricoClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1015, npAcesso, True) then
   begin
      if not PrincipalForm.ProcuraForm(frm_historico_anterior) then
      begin
         Application.CreateForm(Tfrm_historico_anterior, frm_historico_anterior);
      end;
      with frm_historico_anterior do
      begin
         txtAluno.Text := tblPessoanm_pessoa.AsString;
         txtCurso.Text := tblMatriculaCursocd_curso.AsString;
         SetCodigoAluno(tblPessoacd_pessoa.AsInteger);
         SetCodigoMatriculaCurso(tblMatriculaCursoCD_MATRICULA_CURSO.AsInteger);
         tcSeries.TabIndex := 0;
         Filtra;
         Show;
      end;
   end;
end;

procedure TfAlunosAfrica.DBEdit78KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pgDocMae.ActivePageIndex := 0;
     dbCPFMae.SetFocus;
     Key := #0;
  End;
end;

procedure TfAlunosAfrica.dbCodigoChange(Sender: TObject);
Var
  sNovoCodigo : String;
  flg : Boolean;
  qAltera, qTabelas, qCampos : TUMZQuery;
  i : Integer;
  slCamposAlteracao: TStringList;
begin
  inherited;

  slCamposAlteracao := TStringList.Create();
  slCamposAlteracao.Add('cd_pessoa');
  slCamposAlteracao.Add('codigoaluno');
  slCamposAlteracao.Add('codaluno');
  slCamposAlteracao.Add('cd_aluno');
  slCamposAlteracao.Add('cd_pai');
  slCamposAlteracao.Add('cd_mae');
  slCamposAlteracao.Add('cd_resp_finan');
  slCamposAlteracao.Add('cd_resp_acad');
  slCamposAlteracao.Add('professor');
  slCamposAlteracao.Add('cd_professor');

  if tblPessoa.State = dsEdit then begin
  
     sNovoCodigo := tblPessoacd_pessoa.AsString;

     flg := InputQuery('UNI-MESTRE', 'Digite o novo código do Estudante: ', sNovoCodigo);

     if not flg then begin
        Exit;
     end;

     if Mensagem('Tem certeza que deseja alterar o código do Estudante:' + CHR(13) + '>> De: ' + tblPessoacd_pessoa.AsString + '   Para: ' + sNovoCodigo,'Confirmação', + MB_YESNOCANCEL + MB_ICONWARNING) <> mrYes  then begin
        Exit;
     end;

     DM.CriarConsulta(qAltera);
     DM.CriarConsulta(qTabelas);
     DM.CriarConsulta(qCampos);

     qAltera.SQL.Text := ' SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = ' + sNovoCodigo;
     qAltera.Open();

     if not qAltera.EOF then begin

        Mensagem('Já existe uma pessoa com esse código, não será possível a alteração.', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
     
     end;

     qAltera.Close();
     
     qTabelas.ParamCheck := false;
     // qTabelas.UniDirectional := true;
     qCampos.ParamCheck := false;
     // qCampos.UniDirectional := true;

     qTabelas.SQL.Text := ' show table status from '+DM.db.Database;
     qTabelas.Open();

     while not qTabelas.EOF do begin

          if qTabelas.Fields[1].IsNull then begin
            qTabelas.Next;
            continue;
          end;

          qCampos.Close();
          qCampos.SQL.Text := 'SHOW FIELDS FROM ' + qTabelas.Fields[0].AsString;
          qCampos.Open();

          while not qCampos.Eof do begin        

              if slCamposAlteracao.IndexOf( qCampos.FieldByName('Field').AsString ) > -1 then
              begin

              try
                 qAltera.SQL.Text := ' SET FOREIGN_KEY_CHECKS=0; ';
                 qAltera.ExecSQL();

                 qAltera.SQL.Text := ' UPDATE ' + qTabelas.Fields[0].AsString +
                                 ' SET ' + qCampos.FieldByName('Field').AsString +
                                 '  = ' + sNovoCodigo +
                                 ' WHERE ' + qCampos.FieldByName('Field').AsString + ' = ' + tblPessoacd_pessoa.AsString; 
                 qAltera.ExecSQL();
              except
//                 Mensagem('Não foi possível atualizar a tabela ' + qTabelas.Fields[0].AsString);
              end;

              end;

              qCampos.Next();
          end;

           qTabelas.Next();
     end;

     DM.setLog(1001, 'Alteracao', sNovoCodigo, DM.UsuarioLogado.ColigadaLogada, 'Mudança de Código de Pessoa: De: ' + tblPessoacd_pessoa.AsString + ' Para: ' + sNovoCodigo);

     tblPessoa.CLose;
     tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + sNovoCodigo;
     tblPessoa.Open;
     tblContatoPessoa.Open;

     Mensagem('Código alterado com sucesso!', 'UNI-MESTRE', MB_OK + MB_ICONEXCLAMATION); 

  end;
end;

procedure TfAlunosAfrica.dbCodigoDblClick(Sender: TObject);
Var
  sNovoCodigo : String;
  flg : Boolean;
  qAltera, qTabelas, qCampos : TUMZQuery;
  i : Integer;
  slCamposAlteracao: TStringList;
begin
  inherited;

  slCamposAlteracao := TStringList.Create();
  slCamposAlteracao.Add('cd_pessoa');
  slCamposAlteracao.Add('codigoaluno');
  slCamposAlteracao.Add('codaluno');
  slCamposAlteracao.Add('cd_aluno');
  slCamposAlteracao.Add('cd_pai');
  slCamposAlteracao.Add('cd_mae');
  slCamposAlteracao.Add('cd_resp_finan');
  slCamposAlteracao.Add('cd_resp_acad');
  slCamposAlteracao.Add('professor');
  slCamposAlteracao.Add('cd_professor');

  if tblPessoa.State = dsEdit then begin
  
     sNovoCodigo := tblPessoacd_pessoa.AsString;

     flg := InputQuery('UNI-MESTRE', 'Digite o novo código do Estudante: ', sNovoCodigo);

     if not flg then begin
        Exit;
     end;

     if Mensagem('Tem certeza que deseja alterar o código do Estudante:' + CHR(13) + '>> De: ' + tblPessoacd_pessoa.AsString + '   Para: ' + sNovoCodigo,'Confirmação', + MB_YESNOCANCEL + MB_ICONWARNING) <> mrYes  then begin
        Exit;
     end;

     DM.CriarConsulta(qAltera);
     DM.CriarConsulta(qTabelas);
     DM.CriarConsulta(qCampos);

     qAltera.SQL.Text := ' SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = ' + sNovoCodigo;
     qAltera.Open();

     if not qAltera.EOF then begin

        Mensagem('Já existe uma pessoa com esse código, não será possível a alteração.', 'Atenção', MB_OK + MB_ICONWARNING);
        Exit;
     
     end;

     qAltera.Close();
     
     qTabelas.ParamCheck := false;
     // qTabelas.UniDirectional := true;
     qCampos.ParamCheck := false;
     // qCampos.UniDirectional := true;

     qTabelas.SQL.Text := ' show table status from '+DM.db.Database;
     qTabelas.Open();

     while not qTabelas.EOF do begin

          if qTabelas.Fields[1].IsNull then begin
            qTabelas.Next;
            continue;
          end;

          qCampos.Close();
          qCampos.SQL.Text := 'SHOW FIELDS FROM ' + qTabelas.Fields[0].AsString;
          qCampos.Open();

          while not qCampos.Eof do begin        

              if slCamposAlteracao.IndexOf( qCampos.FieldByName('Field').AsString ) > -1 then
              begin

              try
                 qAltera.SQL.Text := ' SET FOREIGN_KEY_CHECKS=0; ';
                 qAltera.ExecSQL();

                 qAltera.SQL.Text := ' UPDATE ' + qTabelas.Fields[0].AsString +
                                 ' SET ' + qCampos.FieldByName('Field').AsString +
                                 '  = ' + sNovoCodigo +
                                 ' WHERE ' + qCampos.FieldByName('Field').AsString + ' = ' + tblPessoacd_pessoa.AsString; 
                 qAltera.ExecSQL();
              except
//                 Mensagem('Não foi possível atualizar a tabela ' + qTabelas.Fields[0].AsString);
              end;

              end;

              qCampos.Next();
          end;

           qTabelas.Next();
     end;

     DM.setLog(1001, 'Alteracao', sNovoCodigo, DM.UsuarioLogado.ColigadaLogada, 'Mudança de Código de Pessoa: De: ' + tblPessoacd_pessoa.AsString + ' Para: ' + sNovoCodigo);

     tblPessoa.CLose;
     tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + sNovoCodigo;
     tblPessoa.Open;
     tblContatoPessoa.Open;

     Mensagem('Código alterado com sucesso!', 'UNI-MESTRE', MB_OK + MB_ICONEXCLAMATION); 

  end;
end;

procedure TfAlunosAfrica.dbComplementoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pcDocumentos.ActivePageIndex := 0;
     dbCpf.SetFocus;
     Key := #0;
  End;
end;

end.

