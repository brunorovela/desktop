unit uPessoasInformacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DBCtrls, ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, DB,
  ZConnection, general, StdCtrls, Buttons, ShellAPI, ZAbstractRODataset,
  uFSelecionarConsultores, ZAbstractDataset, ZDataset, UZDataset, UMComboBox, Menus, dblookup,
  UMDateTimePicker, uOleMessageFilter, uUsuario, uFSplash, ZSqlUpdate;

type
  TfPessoasInformacoes = class(TForm)
    pnRemessaTit: TPanel;
    Bevel4: TBevel;
    toolPessoa: TToolBar;
    ToolButton6: TToolButton;
    btIncluir: TToolButton;
    btAlterar: TToolButton;
    btExcluir: TToolButton;
    btFechar: TToolButton;
    ImageList2: TImageList;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ed_Turma: TEdit;
    btnCodigoTurma: TSpeedButton;
    btnImportarExportarExcel: TToolButton;
    btEnviarEmail: TToolButton;
    qryPessoasInfoFiltrar: TUMZQuery;
    dsPessoasInfoFiltrar: TDataSource;
    qryPessoasInfoFiltrarnm_pessoa: TStringField;
    qryPessoasInfoFiltrards_contatos: TStringField;
    qryPessoasInfoFiltrardt_informacao: TDateTimeField;
    qryPessoasInfoFiltrarcd_origem: TSmallintField;
    qryPessoasInfoFiltrarcd_turma: TStringField;
    qryPessoasInfoFiltrards_obs1: TStringField;
    qryPessoasInfoFiltrards_obs2: TStringField;
    qryPessoasInfoFiltrards_obs3: TStringField;
    qryPessoasInfoFiltrards_telefone2: TStringField;
    qryPessoasInfoFiltrards_email: TStringField;
    qryPessoasInfoFiltrarcd_coligada: TIntegerField;
    qryPessoasInfoFiltrarnm_usuario: TStringField;
    qryPessoasInfoFiltrarcd_informacao: TLargeintField;
    qryPessoasInfoFiltrarcd_pessoa: TLargeintField;
    qyEstados: TUMZQuery;
    qyEstadosds_uf: TStringField;
    dtEstados: TDataSource;
    qryPessoasInfoFiltrards_uf: TStringField;
    qyMunicipios: TUMZQuery;
    dtMunicipios: TDataSource;
    Label1: TLabel;
    cbAreaAssuntoFiltro: TComboBox;
    GroupBox1: TGroupBox;
    lblAte: TLabel;
    ckbData: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    ckbDataRetorno: TCheckBox;
    Label3: TLabel;
    ed_curso: TEdit;
    sbCurso: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbMatricula: TComboBox;
    imgAnexo: TImageList;
    ed_filtrarContatos: TEdit;
    ed_OutrosFiltros: TEdit;
    Button1: TButton;
    cbInfPor: TUMComboBox;
    pmContatos: TPopupMenu;
    pmOutrosFiltros: TPopupMenu;
    btContatosFiltros: TButton;
    btOutrosFiltros: TButton;
    Label5: TLabel;
    Label8: TLabel;
    cbEstado: TComboBox;
    cbMunicipios: TComboBox;
    qyMunicipiosFiltro: TUMZQuery;
    Label9: TLabel;
    cbStatus: TComboBox;
    Label10: TLabel;
    cbVendedor: TComboBox;
    umdtFiltroInicio: TUMDateTimePicker;
    umdtFiltroFim: TUMDateTimePicker;
    umdtIniRetorno: TUMDateTimePicker;
    umdtFimRetorno: TUMDateTimePicker;
    btnGerarCadastroPessoa: TToolButton;
    btnEncaminharContato: TToolButton;
    btnObservacoes: TToolButton;
    qryPessoasInfoFiltrards_status: TStringField;
    btnOlho: TToolButton;
    qryPessoasInfoFiltrarnm_consultor: TStringField;
    qryPessoasInfoFiltrarnm_coligada: TStringField;
    qryPessoasInfoFiltrards_telefone3: TStringField;
    qryPessoasInfoFiltrards_telefone4: TStringField;
    Label11: TLabel;
    edUnidadeEnsino: TEdit;
    sbBuscaUnidade: TSpeedButton;
    ed_CodUsuario: TEdit;
    Label12: TLabel;
    sbBuscaUsuario: TSpeedButton;
    sbLimpaUsuario: TSpeedButton;
    ed_Usuario: TEdit;
    sbLimpaUnidade: TSpeedButton;
    qryPessoasInfoFiltrards_sigla: TStringField;
    qryPessoasInfoFiltrards_cidade: TStringField;
    pmEnvioEmails: TPopupMenu;
    enviar_email: TMenuItem;
    enviar_email_todos: TMenuItem;
    pmImportarExportarExcel: TPopupMenu;
    importarExcel: TMenuItem;
    exportarExcel: TMenuItem;
    sdExportarExcel: TSaveDialog;
    odImportarExcel: TOpenDialog;
    modeloExcel: TMenuItem;
    qryPessoasInfoFiltrards_bairro: TStringField;
    qryPessoasInfoFiltrards_cep: TStringField;
    qryPessoasInfoFiltrards_endereco_nro: TStringField;
    qryInfoPor: TUMZQuery;
    qryPessoasPreferencias: TUMZQuery;
    qryPessoasInfoFiltrarcd_consultor: TIntegerField;
    qryPessoasInfoFiltrards_status_1: TStringField;
    qryPessoasInfoFiltrards_area_assunto: TStringField;
    qryPessoasInfoFiltrards_curso: TStringField;
    qryPessoasInfoFiltrards_endereco: TStringField;
    qryPessoasInfoFiltrardt_retorno: TDateTimeField;
    qryPessoasInfoFiltrarcd_conhecimento: TIntegerField;
    qryPessoasInfoFiltrards_complemento: TStringField;
    qryPessoasInfoFiltrarnm_dependente: TStringField;
    qryPessoasInfoFiltrardt_nascimento: TDateTimeField;
    qryPessoasInfoFiltrarnr_anosemestre: TSmallintField;
    qryPessoasInfoFiltrards_chave: TStringField;
    tbCadastro: TToolButton;
    qryPessoasInfoFiltrarcd_dependente: TIntegerField;
    updPessoaInfo: TZUpdateSQL;
    qryInfoPorcodigo: TLargeintField;
    qryInfoPorcd_situacao: TIntegerField;
    qryInfoPords_valor: TStringField;
    qryPessoasInfoFiltrards_origem: TStringField;
    qryPessoasInfoFiltrards_cidade_lk: TStringField;
    qryPessoasInfoFiltrards_estado: TStringField;
    qryPessoasInfoFiltrards_obs4: TStringField;
    qrySituacoes: TUMZReadOnlyQuery;
    qrySituacoesCODIGO: TLargeintField;
    qrySituacoesCD_MODULO: TLargeintField;
    qrySituacoesCD_SITUACAO: TIntegerField;
    qrySituacoesDS_VALOR: TStringField;
    qrySituacoesDS_SIGLA: TStringField;
    qryPessoasInfoFiltrards_cor_situacao: TStringField;
    qryPessoasInfoFiltrards_informacao: TMemoField;
    qryPessoasInfoFiltrards_conhecimento: TStringField;
    procedure qryPessoasInfoFiltrards_informacaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure tbCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ed_cursoChange(Sender: TObject);
    procedure modeloExcelClick(Sender: TObject);
    procedure importarExcelClick(Sender: TObject);
    procedure exportarExcelClick(Sender: TObject);
    procedure enviar_email_todosClick(Sender: TObject);
    procedure enviar_emailClick(Sender: TObject);
    procedure ed_CodUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure sbLimpaUsuarioClick(Sender: TObject);
    procedure sbLimpaUnidadeClick(Sender: TObject);
    procedure sbBuscaUsuarioClick(Sender: TObject);
    procedure sbBuscaUnidadeClick(Sender: TObject);
    procedure qryPessoasInfoFiltrarAfterOpen(DataSet: TDataSet);
    procedure btnOlhoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnObservacoesClick(Sender: TObject);
    procedure btnEncaminharContatoClick(Sender: TObject);
    procedure btnGerarCadastroPessoaClick(Sender: TObject);
    procedure cbEstadoChange(Sender: TObject);
    procedure sbCursoClick(Sender: TObject);
    procedure btOutrosFiltrosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btContatosFiltrosClick(Sender: TObject);
    procedure contatosFiltra(Sender: TObject);
    procedure outrosFiltrosClick(Sender: TObject);
    procedure preencheContatosFiltro(Sender: TObject);
    procedure preencheOutrosFiltros(arrCamposObs: TStringList);
    procedure qyPessoasInfoAfterPost(DataSet: TDataSet);
    procedure qyPessoasInfoBeforeOpen(DataSet: TDataSet);
    procedure dsPessoasInfoFiltrarDataChange(Sender: TObject; Field: TField);
    procedure btEnviarEmailClick(Sender: TObject);
    procedure btnImportarExportarExcelClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ckbTurmaClick(Sender: TObject);
    procedure btnCodigoTurmaClick(Sender: TObject);
    procedure ckbDataClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsPessoasInfoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure definirCabecalho(Excel : Variant);
    function validaColigadasExcel(sn_importar : Boolean ; cd_coligada : String) : String;
    function validaStatusExcel( ds_status : String ) : String;
    function validaEstadoExcel( ds_uf : String ) : String;
    function validaCidadeExcel(ds_cidade : String ) : String;
    function validaInformacaoOrigemExcel(sn_importar : Boolean; ds_info_por : String ) : String;
    function validaDatasExcel(data_validar : String) : TDateTime;
    function validaCodigoPessoaContato( codigo_pessoa : String ) : integer ;
  private
    { Private declarations }
    FPermissoesAlteracao: TUMPermissoes;
    sOrdem : String;

    Function CountPos(const subtext: String; Text: String): Integer;
    function Subst(Text,NewChar,OldChar:String):String;
    Procedure SetNomeColunaParametro(const arrNomesColunas : TStringList);
  public
    { Public declarations }
    procedure Filtrar;
    Procedure preencheAreaAssuntos;
    procedure preencheStatus;
    procedure preencheInfoPor;
    procedure preencheVendedor;
    procedure restauraFiltros();
    procedure gravarFiltros();
    function getPrefixoComponente(
      nm_componente: String;
      nr_inicial, nr_final : integer
    ): String;
    function getFiltrosRealizados : String;
    function getListaComponentes(): TStringList;
    function verificaObservacoes(cd_informacao: integer): Boolean;
  end;

var
  fPessoasInformacoes: TfPessoasInformacoes;
  sad: integer;
  resultadoConsultor: TResultadoFiltroConsultor;
  codCursoFiltrado: String;
  anoSemestreFiltrado: Integer;

implementation

uses
   uPessoasInfoCad, uDM, uFSelecionarCurso, uFSelecionarTurma, Main, uItemCombo,
   uFCadAssuntoArea, UFObservacoesContatos, uGerarPessoasContatos,
   uCamposPlanilhas, uIUMDataModule, uFSelecionarColigada, uFSelecionarPessoa,
   uFSelEstados, uFSelCidades, uColigada, ComObj, uPessoa, uAluno;

{$R *.dfm}

procedure TfPessoasInformacoes.Filtrar;
const
   S_FILTRO_DTINFO_MYSQL = '(pi.dt_informacao BETWEEN ''%s'' AND ''%s'') ';

   S_FILTRO_DTRETORNO_MYSQL = '(pi.dt_retorno BETWEEN ''%s'' AND ''%s'') ';

   S_FILTRO_DTINFO_ORACLE = '(TO_CHAR(pi.dt_informacao, ''YYYY-MM-DD'') BETWEEN ''%s'' AND ''%s'') ';

   S_FILTRO_ORIGEM = 'pi.cd_origem = %d ';

   S_FILTRO_TURMA = 'pi.cd_turma = ''%s'' ';

   S_FILTRO_AREA_ASSUNTO = 'pi.ds_area_assunto = ''%s'' ';

   S_FILTRO_STATUS = 'pi.ds_status = ''%s'' ';

   S_FILTRO_VENDEDOR = 'pi.cd_consultor %s ';

   S_FILTRO_UNIDADE = 'c.nm_coligada like ''%s'' ';

   S_FILTRO_USUARIO = 'pi.nm_usuario = (select ds_login from pessoas where cd_pessoa = %s )';

   S_OP = ' AND ';
var
   S_SQL_COMMATRICULA_TURMA : string;

   S_SQL_COMMATRICULA  : string;

   S_SQL_SEMMATRICULA_TURMA : string;

   S_SQL_SEMMATRICULA : string ;

   S_SQL_PADRAO : string ;

   LICodOrigem: integer;
   LSFiltro: string;
   sColigadas : string;
   indice : Integer;
   lugar : Pointer;
   snMaisFiltro, i : Integer;
begin
  sColigadas := DM.GetTodasColigadas();

  S_SQL_COMMATRICULA_TURMA :=
   'SELECT DISTINCT '+
   '  pi.cd_informacao, '+
   '  pi.ds_informacao, '+
	'  pi.nm_pessoa, '+
	'  pi.ds_contatos, '+
	'  pi.dt_informacao, '+
	'  pi.cd_origem, '+
	'  pi.cd_turma, '+
	'  pi.ds_obs1, '+
	'  pi.ds_obs2, '+
	'  pi.ds_obs3, '+
   '  pi.ds_obs4,' +
	'  pi.ds_telefone2, '+
   '  pi.ds_telefone3, '+
	'  pi.ds_telefone4, '+
	'  pi.ds_email, '+
	'  pi.cd_coligada, '+
	'  pi.nm_usuario, '+
	'  pi.cd_pessoa, '+
	'  pi.ds_cidade, '+
	'  pi.ds_bairro, '+
 	'  pi.ds_cep, '+
 	'  pi.ds_endereco_nro, '+
	'  pi.ds_uf, '+
	'  pi.ds_status, '+
   '  s.ds_sigla,'+
	'  p.nm_pessoa AS nm_consultor, '+
	'  c.nm_coligada, '+
   '  pi.cd_consultor as cd_consultor, '+
   '	pi.ds_status, '+
   '	pi.ds_area_assunto, '+
   '  pi.ds_curso, ' +
   '	pi.ds_endereco, ' +
   '	pi.dt_retorno, ' +
   '  pi.cd_conhecimento, ' +
   '  sfs.ds_valor as ds_conhecimento, ' +   
   '  pi.nm_dependente, '+
   '  pi.ds_complemento, '+
   '  pi.dt_nascimento, '+
   '  pi.nr_anosemestre, '+
   '  pi.ds_chave,  '+
   '  pi.cd_dependente '+
   'FROM '+
	'  pessoas_info pi '+
   '  LEFT JOIN pessoas p ON ( '+
	'     pi.cd_consultor = p.cd_pessoa '+
   '  ) '+
   '  LEFT JOIN coligadas c ON ( '+
	'     pi.cd_coligada = c.cd_coligada '+
   '  ) '+
   '  JOIN matriculas m ON '+
   '     (pi.cd_pessoa = m.codigoaluno) '+
   '  LEFT JOIN situacoes s On '+
   '(cd_modulo = 1035 AND cd_auxiliar = 1 AND ds_valor = pi.ds_status)'+
   'LEFT JOIN situacoes sfs On '+
   '(sfs.cd_modulo = 1  AND sfs.cd_situacao = pi.cd_conhecimento) '+
   'WHERE '+
   '  pi.cd_coligada in ( '+sColigadas+') AND '+
   '  m.turma = :turma %s '+
   'ORDER BY %s';
   
  S_SQL_COMMATRICULA :=
   'SELECT DISTINCT '+
   '  pi.cd_informacao, '+
   '  pi.ds_informacao, '+
	'  pi.nm_pessoa, '+
	'  pi.ds_contatos, '+
	'  pi.dt_informacao, '+
	'  pi.cd_origem, '+
	'  pi.cd_turma, '+
	'  pi.ds_obs1, '+
	'  pi.ds_obs2, '+
	'  pi.ds_obs3, '+
   '  pi.ds_obs4,'+
	'  pi.ds_telefone2, '+
   '  pi.ds_telefone3, '+
	'  pi.ds_telefone4, '+
	'  pi.ds_email, '+
	'  pi.cd_coligada, '+
	'  pi.nm_usuario, '+
	'  pi.cd_pessoa, '+
	'  pi.ds_cidade, '+
	'  pi.ds_bairro, '+
 	'  pi.ds_cep, '+
 	'  pi.ds_endereco_nro, '+
	'  pi.ds_uf, '+
	'  pi.ds_status, '+
   '  s.ds_sigla,'+
	'  p.nm_pessoa AS nm_consultor, '+
	'  c.nm_coligada, '+
   '  pi.cd_consultor as cd_consultor, '+
   '	pi.ds_status, '+
   '	pi.ds_area_assunto, '+
   '  pi.ds_curso, ' +
   '	pi.ds_endereco, ' +
   '	pi.dt_retorno, ' +
   '  pi.cd_conhecimento, ' +
   '  sfs.ds_valor as ds_conhecimento, ' +      
   '  pi.nm_dependente, '+
   '  pi.ds_complemento, '+
   '  pi.dt_nascimento, '+
   '  pi.nr_anosemestre, '+
   '  pi.ds_chave,  '+
   '  pi.cd_dependente '+
   'FROM '+
	 '  pessoas_info pi '+
   '  LEFT JOIN pessoas p ON ( '+
	 '    pi.cd_consultor = p.cd_pessoa '+
   '  ) '+
   '  LEFT JOIN coligadas c ON ( '+
	 '    pi.cd_coligada = c.cd_coligada '+
   '  ) '+
   'INNER JOIN matriculas m ON '+
   '  (pi.cd_pessoa = m.codigoaluno) '+
   'LEFT JOIN situacoes s ON '+
   '  (s.ds_valor = pi.ds_status) '+
   'LEFT JOIN situacoes sfs On '+
   '(sfs.cd_modulo = 1  AND sfs.cd_situacao = pi.cd_conhecimento) '+
   'WHERE '+
   '  pi.cd_coligada in ('+sColigadas+') %s '+
   'ORDER BY %s';

  S_SQL_SEMMATRICULA_TURMA :=
   'SELECT DISTINCT '+
   '  pi.cd_informacao, '+
   '  pi.ds_informacao, '+
	'  pi.nm_pessoa, '+
	'  pi.ds_contatos, '+
	'  pi.dt_informacao, '+
	'  pi.cd_origem, '+
	'  pi.cd_turma, '+
	'  pi.ds_obs1, '+
	'  pi.ds_obs2, '+
	'  pi.ds_obs3, '+
   '  pi.ds_obs4,' +
	'  pi.ds_telefone2, '+
   '  pi.ds_telefone3, '+
	'  pi.ds_telefone4, '+
	'  pi.ds_email, '+
	'  pi.cd_coligada, '+
	'  pi.nm_usuario, '+
	'  pi.cd_pessoa, '+
	'  pi.ds_cidade, '+
	'  pi.ds_bairro, '+
 	'  pi.ds_cep, '+
 	'  pi.ds_endereco_nro, '+
	'  pi.ds_uf, '+
	'  pi.ds_status, '+
   '  s.ds_sigla,'+
	'  p.nm_pessoa AS nm_consultor, '+
	'  c.nm_coligada, '+
   '  pi.cd_consultor as cd_consultor, '+
   '	pi.ds_status, '+
   '	pi.ds_area_assunto, '+
   '  pi.ds_curso, ' +
   '	pi.ds_endereco, ' +
   '	pi.dt_retorno, ' +
   '  pi.cd_conhecimento, ' +
   '  sfs.ds_valor as ds_conhecimento, ' +     
   '  pi.nm_dependente, '+
   '  pi.ds_complemento, '+
   '  pi.dt_nascimento, '+
   '  pi.nr_anosemestre, '+
   '  pi.ds_chave,  '+
   '  pi.cd_dependente '+
   'FROM '+
	'  pessoas_info pi '+
   '  LEFT JOIN pessoas p ON ( '+
	'     pi.cd_consultor = p.cd_pessoa '+
   '  ) '+
   '  LEFT JOIN coligadas c ON ( '+
	'     pi.cd_coligada = c.cd_coligada '+
   '  ) '+
   'LEFT JOIN matriculas m ON '+
   '  (pi.cd_pessoa = m.codigoaluno AND m.turma = :turma) '+
   '  LEFT JOIN situacoes s On '+
   '(cd_modulo = 1035 AND cd_auxiliar = 1 AND ds_valor = pi.ds_status)'+
   'LEFT JOIN situacoes sfs On '+
   '(sfs.cd_modulo = 1  AND sfs.cd_situacao = pi.cd_conhecimento) '+
   'WHERE '+
   '  pi.cd_coligada in ('+sColigadas+')AND '+
   '  m.codigoaluno IS NULL %s '+
   'ORDER BY %s';

  S_SQL_SEMMATRICULA :=
   'SELECT DISTINCT '+
   '  pi.cd_informacao, '+
   '  pi.ds_informacao, '+
	'  pi.nm_pessoa, '+
	'  pi.ds_contatos, '+
	'  pi.dt_informacao, '+
	'  pi.cd_origem, '+
	'  pi.cd_turma, '+
	'  pi.ds_obs1, '+
	'  pi.ds_obs2, '+
	'  pi.ds_obs3, '+
   '  pi.ds_obs4,' +
	'  pi.ds_telefone2, '+
   '  pi.ds_telefone3, '+
	'  pi.ds_telefone4, '+
	'  pi.ds_email, '+
	'  pi.cd_coligada, '+
	'  pi.nm_usuario, '+
	'  pi.cd_pessoa, '+
	'  pi.ds_cidade, '+
	'  pi.ds_bairro, '+
 	'  pi.ds_cep, '+
 	'  pi.ds_endereco_nro, '+
	'  pi.ds_uf, '+
	'  pi.ds_status, '+
   '  s.ds_sigla,'+
	'  p.nm_pessoa AS nm_consultor, '+
	'  c.nm_coligada, '+
   '  pi.cd_consultor as cd_consultor, '+
   '	pi.ds_status, '+
   '	pi.ds_area_assunto, '+
   '  pi.ds_curso, ' +
   '	pi.ds_endereco, ' +
   '	pi.dt_retorno, ' +
   '  pi.cd_conhecimento, ' +
   '  sfs.ds_valor as ds_conhecimento, ' +     
   '  pi.nm_dependente, '+
   '  pi.ds_complemento, '+
   '  pi.dt_nascimento, '+
   '  pi.nr_anosemestre, '+
   '  pi.ds_chave,  '+
   '  pi.cd_dependente '+
   'FROM '+
	'  pessoas_info pi '+
   '  LEFT JOIN pessoas p ON ( '+
	'     pi.cd_consultor = p.cd_pessoa '+
   '  ) '+
   '  LEFT JOIN coligadas c ON ( '+
	'     pi.cd_coligada = c.cd_coligada '+
   '  ) '+
   'LEFT JOIN matriculas m ON '+
   '  (pi.cd_pessoa = m.codigoaluno) '+
   '  LEFT JOIN situacoes s On '+
   '(cd_modulo = 1035 AND cd_auxiliar = 1 AND ds_valor = pi.ds_status)'+
   'LEFT JOIN situacoes sfs On '+
   '(sfs.cd_modulo = 1  AND sfs.cd_situacao = pi.cd_conhecimento) '+   
   'WHERE '+
   '  pi.cd_coligada in ('+sColigadas+') AND '+
   '  m.codigoaluno IS NULL %s '+
   'ORDER BY %s';
   
   S_SQL_PADRAO :=
   'SELECT DISTINCT '+
   '  pi.cd_informacao, '+
   '  pi.ds_informacao, '+
	'  pi.nm_pessoa, '+
	'  pi.ds_contatos, '+
	'  pi.dt_informacao, '+
	'  pi.cd_origem, '+
	'  pi.cd_turma, '+
	'  pi.ds_obs1, '+
	'  pi.ds_obs2, '+
	'  pi.ds_obs3, '+
   '  pi.ds_obs4,' +
	'  pi.ds_telefone2, '+
   '  pi.ds_telefone3, '+
	'  pi.ds_telefone4, '+
	'  pi.ds_email, '+
	'  pi.cd_coligada, '+
	'  pi.nm_usuario, '+
	'  pi.cd_pessoa, '+
	'  pi.ds_cidade, '+
	'  pi.ds_bairro, '+
 	'  pi.ds_cep, '+
 	'  pi.ds_endereco_nro, '+
	'  pi.ds_uf, '+
	'  pi.ds_status, '+
   '  s.ds_sigla,'+
	'  p.nm_pessoa AS nm_consultor, '+
	'  c.nm_coligada, '+
   '  pi.cd_consultor as cd_consultor, '+
   '	pi.ds_status, '+
   '	pi.ds_area_assunto, '+
   '  pi.ds_curso, ' +
   '	pi.ds_endereco, ' +
   '	pi.dt_retorno, ' +
   '  pi.cd_conhecimento, ' +
   '  sfs.ds_valor as ds_conhecimento, ' +     
   '  pi.nm_dependente, '+
   '  pi.ds_complemento, '+
   '  pi.dt_nascimento, '+
   '  pi.nr_anosemestre, '+
   '  pi.ds_chave,  '+
   '  pi.cd_dependente '+
   'FROM '+
	'  pessoas_info pi '+
   '  LEFT JOIN pessoas p ON ( '+
	'     pi.cd_consultor = p.cd_pessoa '+
   '  ) '+
   '  LEFT JOIN coligadas c ON ( '+
	'     pi.cd_coligada = c.cd_coligada '+
   '  ) '+
   '  LEFT JOIN situacoes s On '+
   '(cd_modulo = 1035 AND cd_auxiliar = 1 AND ds_valor = pi.ds_status)'+
   'LEFT JOIN situacoes sfs On '+
   '(sfs.cd_modulo = 1  AND sfs.cd_situacao = pi.cd_conhecimento) '+
   'WHERE '+
   '  pi.cd_coligada in ('+sColigadas+') %s  '+
   'ORDER BY %s';

   LSFiltro := '';

   if qryPessoasInfoFiltrar.Active and (not qryPessoasInfoFiltrar.IsEmpty) then
   begin
      lugar := qryPessoasInfoFiltrar.GetBookmark;
   end
   else
   begin
      lugar := nil;
   end;

   qryPessoasInfoFiltrar.Close;

   if ckbData.Checked then
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         LSFiltro :=
            LSFiltro +
            Format(S_FILTRO_DTINFO_ORACLE, [
               FormatDateTime('yyyy-mm-dd', umdtFiltroInicio.Date),
               FormatDateTime('yyyy-mm-dd', umdtFiltroFim.Date)])
      else if DM.db.Protocol = DB_PROTOCOL_MYSQL then
         LSFiltro :=
            LSFiltro +
            Format(S_FILTRO_DTINFO_MYSQL, [
               FormatDateTime('yyyy-mm-dd', umdtFiltroInicio.Date) + ' 00:00:00',
               FormatDateTime('yyyy-mm-dd', umdtFiltroFim.Date) + ' 23:59:59']);
   end;

   if (ckbDataRetorno.Checked) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;
         
      LSFiltro :=
            LSFiltro +
            Format(S_FILTRO_DTRETORNO_MYSQL, [
               FormatDateTime('yyyy-mm-dd', umdtIniRetorno.Date) + ' 00:00:00',
               FormatDateTime('yyyy-mm-dd', umdtFimRetorno.Date) + ' 23:59:59']);
   end;

   if ((cbInfPor.ItemIndex <> 0) And (cbInfPor.ItemIndex <> -1)) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LICodOrigem := StrToInt(
         TItemCombo(
            cbInfPor.Items.Objects[cbInfPor.ItemIndex]
         ).getCodigo()
      );

      LSFiltro := LSFiltro + Format(S_FILTRO_ORIGEM, [LICodOrigem]);
   end;

   if ((cbMatricula.ItemIndex = 0) or (cbMatricula.ItemIndex = -1)) then
   begin
      qryPessoasInfoFiltrar.SQL.Text := S_SQL_PADRAO
   end
   else if cbMatricula.ItemIndex = 1 then
   begin
      if Trim(ed_Turma.Text) <> '' then
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_COMMATRICULA_TURMA;
      end
      else
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_COMMATRICULA;
      end;
   end
   else
   begin
      if Trim(ed_Turma.Text) <> '' then
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_SEMMATRICULA_TURMA;
      end
      else
      begin
         qryPessoasInfoFiltrar.SQL.Text := S_SQL_SEMMATRICULA;
      end;
   end;

   if Trim(ed_Turma.Text) <> '' then
   begin
      if LSFiltro <> '' then
         LSFiltro := LSFiltro + S_OP;
      LSFiltro := LSFiltro + Format(S_FILTRO_TURMA, [ed_Turma.Text]);
   end;

   if ed_curso.Text <> '' then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(' pi.ds_curso = ''%s'' ', [ed_curso.Text]);
   end;

   if edUnidadeEnsino.Text <> '' then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(S_FILTRO_UNIDADE, [edUnidadeEnsino.Text]);
   end;

   if ed_CodUsuario.Text <> '' then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(S_FILTRO_USUARIO, [ed_CodUsuario.Text]);
   end;
   
   if (cbAreaAssuntoFiltro.ItemIndex <> 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(S_FILTRO_AREA_ASSUNTO, [cbAreaAssuntoFiltro.Text]);
   end;

   if (cbStatus.ItemIndex <> 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format(S_FILTRO_STATUS, [cbStatus.Text]);
   end;

   if (StrToInt(TitemCombo(cbVendedor.Items.Objects[cbVendedor.ItemIndex]).getCodigo()) <> 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      //Busca por sem vendedores
      if (StrToInt(TitemCombo(cbVendedor.Items.Objects[cbVendedor.ItemIndex]).getCodigo()) = -1) then
      begin
         LSFiltro := LSFiltro + Format(S_FILTRO_VENDEDOR, [' IS NULL ']);
      end
      else
      begin
         LSFiltro := LSFiltro + Format(S_FILTRO_VENDEDOR, [' = ' + TitemCombo(cbVendedor.Items.Objects[cbVendedor.ItemIndex]).getCodigo()]);
      end;

   end;

   if (cbEstado.ItemIndex > 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format('pi.ds_uf = ''%s'' ', [cbEstado.Text]);
   end;

   if (cbMunicipios.ItemIndex > 0) then
   begin
      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP;
      end;

      LSFiltro := LSFiltro + Format('pi.ds_cidade = "%s" ', [cbMunicipios.Text]);
   end;

   //Contatos
   if btContatosFiltros.Caption <> 'Filtrar contatos' then
   begin

      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + '( ';
      end
      else
      begin
         LSFiltro :=  '( ';
      end;

      snMaisFiltro := 0;

      //filtra todos os contatos
      if btContatosFiltros.Caption = 'Todos os contatos' then
      begin
         //
      end;

      //E-Mail
      if pmContatos.Items[3].Checked then
      begin
         LSFiltro := LSFiltro + ' pi.ds_email LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
         snMaisFiltro := 1;
      end;

      //Telefone 1
      if pmContatos.Items[4].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_contatos LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_contatos LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      //Telefone 2
      if pmContatos.Items[5].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_telefone2 LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_telefone2 LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
            snMaisFiltro := 1;
         end;

      end;

      //Telefone 3
      if pmContatos.Items[6].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_telefone3 LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_telefone3 LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      //Telefone 4
      if pmContatos.Items[7].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_telefone3 LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_telefone3 LIKE ''%'+ ed_filtrarContatos.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      LSFiltro := LSFiltro + ' ) ';
   end;

   //Outros filtros
   if btOutrosFiltros.Caption <> 'Outros Filtros' then
   begin

      if LSFiltro <> '' then
      begin
         LSFiltro := LSFiltro + S_OP + '( ';
      end
      else
      begin
         LSFiltro :=  '( ';
      end;

      snMaisFiltro := 0;

      //filtra todos os contatos
      if btOutrosFiltros.Caption = 'Todos os filtros' then
      begin
         //
      end;

      //Nome Pessoa
      if pmOutrosFiltros.Items[3].Checked then
      begin
         LSFiltro := LSFiltro + ' pi.nm_pessoa LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
         snMaisFiltro := 1;
      end;

      //Desc. da Informação
      if pmOutrosFiltros.Items[4].Checked then
      begin

         if snMaisFiltro = 1 then
         begin
            LSFiltro := LSFiltro + ' OR pi.ds_informacao LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
         end
         else
         begin
            LSFiltro := LSFiltro + ' pi.ds_informacao LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
            snMaisFiltro := 1;
         end;
         
      end;

      //Campo obs 1
      if pmOutrosFiltros.Items.Count > 5 then
      begin

         if pmOutrosFiltros.Items[5].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs1 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs1 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;
         
      end;

      //Campo obs 2
      if pmOutrosFiltros.Items.Count > 6 then
      begin
         if pmOutrosFiltros.Items[6].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs2 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs2 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;
      end;

      //Campo obs 3
      if pmOutrosFiltros.Items.Count > 7 then
      begin

         if pmOutrosFiltros.Items[7].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs3 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs3 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;

      end;

      //Campo obs 4
      if pmOutrosFiltros.Items.Count > 8 then
      begin
         if pmOutrosFiltros.Items[8].Checked then
         begin
            if snMaisFiltro = 1 then
            begin
               LSFiltro := LSFiltro + ' OR pi.ds_obs4 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
            end
            else
            begin
               LSFiltro := LSFiltro + ' pi.ds_obs4 LIKE ''%'+ ed_OutrosFiltros.Text +'%'' ';
               snMaisFiltro := 1;
            end;
         end;
      end;

      LSFiltro := LSFiltro + ' ) ';
   end;

   if LSFiltro <> '' then
   begin
      LSFiltro := S_OP + LSFiltro;
   end;

   qryPessoasInfoFiltrar.SQL.Text := Format(qryPessoasInfoFiltrar.SQL.Text, [LSFiltro, sOrdem]);
   if qryPessoasInfoFiltrar.Params.FindParam('turma') <> nil then
      qryPessoasInfoFiltrar.ParamByName('turma').AsString := ed_Turma.Text;

   qryPessoasInfoFiltrar.DisableControls();
   qryPessoasInfoFiltrar.Open;
  
   if (lugar <> nil) AND (qryPessoasInfoFiltrar.BookmarkValid(lugar)) then begin
      qryPessoasInfoFiltrar.GotoBookmark(lugar);
  end;

   
   qryPessoasInfoFiltrar.EnableControls();
end;

procedure TfPessoasInformacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   fPessoasInformacoes := nil;
   Action := caFree;
end;

procedure TfPessoasInformacoes.FormCreate(Sender: TObject);
const
   SChave = 'Academico.ContatosAlterarInformacoesOutrosConsultores';
begin
   FPermissoesAlteracao := DM.UsuarioLogado.GetPermissoes(
      DM.UsuarioLogado.Pessoa.Codigo,
      SChave);
end;

procedure TfPessoasInformacoes.btIncluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1035, npIncluir, True ) then Exit;

   Application.CreateForm(TfPessoasInfoCad, fPessoasInfoCad);
   bIncluindo := true;
   qryPessoasInfoFiltrar.Insert;
   qryPessoasInfoFiltrarcd_origem.AsInteger := 1;
   qryPessoasInfoFiltrardt_informacao.AsDateTime := DM.DataAtual;
   qryPessoasInfoFiltrards_curso.AsString := ed_curso.Text;
   qryPessoasInfoFiltrarcd_turma.AsString := ed_Turma.Text;
   fPessoasInfoCad.Position := poScreenCenter;
   fPessoasInfoCad.Showmodal;
end;

procedure TfPessoasInformacoes.btAlterarClick(Sender: TObject);
var
   qyPermissao, qyBuscaPermissaoAlterar: TUMZQuery;
   cod_grupos: Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 1035, npAlterar, True ) then Exit;
   
   if fPessoasInfoCad = nil then
      Application.CreateForm(TfPessoasInfoCad, fPessoasInfoCad);
      
   qryPessoasInfoFiltrar.Edit;
   fPessoasInfoCad.Position := poScreenCenter;
   fPessoasInfoCad.Showmodal;
end;

procedure TfPessoasInformacoes.btExcluirClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1035, npExcluir, True ) then Exit;

   if Mensagem('Deseja realmente excluir as informações do contato selecionado?','Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes
   then begin

      qryPessoasInfoFiltrar.Delete;

   end;
end;

procedure TfPessoasInformacoes.btFecharClick(Sender: TObject);
begin
   close();
end;

procedure TfPessoasInformacoes.FormShow(Sender: TObject);
var
  arrObs : TStringList;
  parametro : String;
  CountCaracter, ultimaposicao: integer;
  qyAreaAssunto: TUMZQuery;
  itemAux: TMenuItem;
begin
   {ATENÇÂO: manter a posição de obs1, obs2 e obs3 na mesma ordem atual e os três sempre por ultimo.}

   //Cria itens

   preencheContatosFiltro(Self);

   ultimaposicao := DBGrid1.Columns.Count-1;

   qyMunicipios.Open;
   qyEstados.Open;

   qyEstados.First;
   cbEstado.Items.Add('');
   while not (qyEstados.Eof) do
   begin
      cbEstado.Items.Add(qyEstadosds_uf.asString);
      qyEstados.Next;
   end;

   umdtFiltroInicio.Date := DataHoje;
   umdtFiltroFim.Date := DataHoje;
   umdtIniRetorno.Date := DataHoje;
   umdtFimRetorno.Date := DataHoje;

   arrObs := TStringList.Create();
   if(trim(DM.variavel_parametro('contatos_campos_obs')) = '')then
      parametro := ';;'
   else
      parametro := DM.variavel_parametro('contatos_campos_obs');
   CountCaracter := self.CountPos(';', parametro);

   if(CountCaracter = 0)then
      parametro := parametro+';;'
   else if(CountCaracter = 1)then
      parametro := parametro+';';

   SplitString(parametro, ';', arrObs);

   preencheOutrosFiltros(arrObs);

   if ( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
      DBGrid1.Columns[ultimaPosicao-2].Visible := false;
   if ( (arrObs[1] = null) or (trim(arrObs[1]) = '') )then
   begin
      DBGrid1.Columns[ultimaPosicao-1].Visible := false;
   end;
   if ( (arrObs[2] = null) or (trim(arrObs[2]) = '') )then
      DBGrid1.Columns[ultimaPosicao].Visible := false;
      DBGrid1.Columns.Add;
   DBGrid1.Columns[ultimaPosicao+1].Visible := false;
   if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
   begin
     DBGrid1.Columns[ultimaPosicao-2].Title.Caption := arrObs[0];
     if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
     begin
        DBGrid1.Columns[ultimaPosicao-1].Title.Caption := arrObs[1];
        if not( (arrObs[0] = null) or (trim(arrObs[0]) = '') )then
        begin
           DBGrid1.Columns[ultimaPosicao].Title.Caption := arrObs[2];
        end;
     end;
   end;
   DBGrid1.Columns[ultimaPosicao+1].Title.Caption := arrObs[2];
   DM.montarPlanilha(DBGrid1, 'planilha_pessoas_contatos');
   preencheAreaAssuntos;
   preencheStatus;
   preencheInfoPor;
   preencheVendedor;

   sOrdem := ' cd_informacao DESC ';
   Application.CreateForm(TfPessoasInfoCad, fPessoasInfoCad);

   DM.montarPlanilha(DBGrid1, 'planilha_pessoas_contatos');

   {
      Altera o nome das colunas de acordo com o definido
      no parametro "contatos_campos_obs" e ativa estes campos para serem
      visualizados no "olhinho"
   }
   SetNomeColunaParametro( arrObs );
   
   restauraFiltros;
   Filtrar();
end;

function TfPessoasInformacoes.getListaComponentes(): TStringList;
var   
   slLista : TStringList;
begin
   //cria stringlist
   slLista := TStringList.Create;

   with slLista do
   begin
      add('ed_Usuario');
      add('ed_CodUsuario');
      add('edUnidadeEnsino');
      add('ed_curso');
      add('ed_Turma');
      add('cbMatricula');
      add('cbInfPor');
      add('cbEstado');
      add('cbMunicipios');
      add('cbAreaAssuntoFiltro');
      add('cbStatus');
      add('cbVendedor');
      
      if ( ckbData.Checked ) then
      begin
         add('umdtFiltroInicio');
         add('umdtFiltroFim');
      end;
      
      if ( ckbDataRetorno.Checked ) then
      begin
         add('umdtIniRetorno');
         add('umdtFimRetorno');
      end;

   end;
   result := slLista;
end;

function TfPessoasInformacoes.getFiltrosRealizados(): String;
var
   i,x : integer;
   slLista : TStringList;
   ds_filtros : String;
begin
   ds_filtros := '';

   slLista := TStringList.Create;
   slLista := getListaComponentes;

   for x := 0 to slLista.Count - 1 do
   begin
      for i:= 0 to self.ComponentCount-1  do
      begin
         if ( copy(self.Components[i].Name,1,2) = 'ed' )  then
         begin
            if ( slLista[x] = self.Components[i].Name ) then
            begin
              ds_filtros := ds_filtros
                  + slLista[x]
                  +'['
                  + TEdit(FindComponent(slLista[x])).Text
                  +'];';
            end;
         end
         else
         if ( copy(self.Components[i].Name,1,2) = 'cb' )  then
         begin
            if ( slLista[x] = self.Components[i].Name ) then
            begin
              ds_filtros := ds_filtros
                  + slLista[x]
                  + '['
                  + IntToSTr(TComboBox(FindComponent(slLista[x])).ItemIndex)
                  +'];';
            end;
         end
         else
         if ( copy(self.Components[i].Name,1,4) = 'umdt' )  then
         begin
            if ( slLista[x] = self.Components[i].Name ) then
            begin
              ds_filtros := ds_filtros
                  + slLista[x]
                  + '['
                  + DateToStr(TUMDateTimePicker(FindComponent(slLista[x])).Date)
                  +'];';
            end;
         end;
      end;
   end;
   slLista.Free;
   result := ds_filtros;
end;

procedure TfPessoasInformacoes.gravarFiltros;
var
   ds_filtros : String;
   qryInserirFiltros : TUMZQuery;
begin
   DM.CriarConsulta( qryInserirFiltros );
   ds_filtros := getFiltrosRealizados();

   qryPessoasPreferencias.Close;
   qryPessoasPreferencias.ParamByName('cd_pessoa').AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
   qryPessoasPreferencias.Open;

   if ( qryPessoasPreferencias.RecordCount > 0 ) then
   begin
      qryInserirFiltros.SQL.Text := ''
        + ' UPDATE nu_pessoas_pref '
        + ' SET '
        + '   ds_valor = ' + QuotedStr(ds_filtros)
        + ' WHERE '
        + '   cd_modulo = 53 '
        + ' AND '
        + '   cd_pessoa = ' + IntToStr(dm.UsuarioLogado.Pessoa.Codigo)
        + ' AND '
        + '   ds_chave = "PlanilhaContatosFiltrosContatos"';

      qryInserirFiltros.ExecSQL;
      qryInserirFiltros.SQl.Clear;
      Exit;
   end;

   qryInserirFiltros.SQL.Text := ''
      + ' INSERT INTO '
      + ' nu_pessoas_pref '
      + ' ( '
      +    ' cd_preferencias, '
      +    ' cd_pessoa, '
      +    ' cd_modulo, '
      +    ' ds_chave, '
      +    ' ds_valor '
      + ' ) VALUES '
      + '( null,'
      +   IntToStr(dm.UsuarioLogado.Pessoa.Codigo) + ','
      +  '53,'
      +  '"PlanilhaContatosFiltrosContatos",'
      +   QuotedStr(ds_filtros)
      +' )';

    qryInserirFiltros.ExecSQL;
    qryInserirFiltros.SQl.Clear;
end;

procedure TfPessoasInformacoes.importarExcelClick(Sender: TObject);
Var
   Arquivo: TextFile;
   ds_diretorio, ds_turma : String;
   nm_coligada, ds_status, ds_area_assunto,
   ds_uf, ds_cidade, ds_info_por : string;

   dt_informacao, dt_retorno : TDateTime; 

   planilha, sheet: OleVariant;
   linha, coluna, i, j, cd_pessoa: Integer;
   qyBuscaPessoasInfo : TUMZQuery;
   messageFilter : IOleMessageFilter;
begin
   i := 0;
   if odImportarExcel.Execute then
   begin
     ds_diretorio := odImportarExcel.FileName;
   end else
   begin
     Exit;
   end;

   try
      dm.CriarConsulta(qyBuscaPessoasInfo);

       { Instacia a classe que trata os erros de
         processos do Windows para abrir o EXCEL  }
      messageFilter := IOleMessageFilter.Create();

      //Crio o objeto que gerencia o arquivo excel
      planilha:= CreateOleObject('Excel.Application');

       // Trata os erros de processo do Windows
      messageFilter.RegisterFilter();

      //Abro o arquivo
      planilha.WorkBooks.open(ds_diretorio);

      //Pego a primeira planilha do arquivo
      sheet:= planilha.WorkSheets[1];

      // Última linha da planilha
      linha:= sheet.Cells.SpecialCells(11).Row;
      // Última coluna da planilha
      coluna:= sheet.Cells.SpecialCells(11).Column;

      // -> i <- Comeca com 2 pois a primeira linha contem apenas o cabeçalho

      qyBuscaPessoasInfo.DisableControls;
      qyBuscaPessoasInfo.SQL.TEXT := ' SELECT * FROM pessoas_info LIMIT 1';
      qyBuscaPessoasInfo.Close;
      qyBuscaPessoasInfo.Open;
      
      for i := 2 to linha do
      begin
         TfSplash.GetInstancia().ShowSplashScreen(
            'Importação',
            'Importando informações do arquivo... Favor Aguarde'
         );
         if ( sheet.cells[i,1].Text <> '' ) then
         begin
            qyBuscaPessoasInfo.Insert;

            nm_coligada := validaColigadasExcel(True, sheet.cells[i,1].Text);
            ds_status := validaStatusExcel(sheet.cells[i,2].Text);
            ds_uf := validaEstadoExcel(sheet.cells[i,15].Text);
            ds_cidade := validaCidadeExcel(sheet.cells[i,16].Text);
            ds_info_por := validaInformacaoOrigemExcel(True, sheet.cells[i,21].Text);
            dt_informacao := validaDatasExcel(sheet.cells[i,19].Text);
            dt_retorno    := validaDatasExcel(sheet.cells[i,20].Text);
            cd_pessoa     := validaCodigoPessoaContato( sheet.cells[i,5].Text );

            // Trata o codigo da turma pois ele não pode ser nulo !
            if ( sheet.cells[i,14].Text <> '' ) then
            begin
               ds_turma := sheet.cells[i,14].Text;
            end else begin
               ds_turma := '';
            end;

            qyBuscaPessoasInfo.FieldByName('ds_informacao').AsString := sheet.cells[i,4].Text;
            qyBuscaPessoasInfo.FieldByName('nm_pessoa').AsString := sheet.cells[i,6].Text;
            qyBuscaPessoasInfo.FieldByName('ds_contatos').AsString := sheet.cells[i,7].Text;
            qyBuscaPessoasInfo.FieldByName('dt_informacao').AsDateTime := dt_informacao;
            qyBuscaPessoasInfo.FieldByName('cd_origem').AsInteger := StrToInt(ds_info_por);
            qyBuscaPessoasInfo.FieldByName('cd_turma').AsString := ds_turma;
            qyBuscaPessoasInfo.FieldByName('ds_obs1').AsString := '';
            qyBuscaPessoasInfo.FieldByName('ds_obs2').AsString := '';
            qyBuscaPessoasInfo.FieldByName('ds_obs3').AsString := '';
            qyBuscaPessoasInfo.FieldByName('ds_telefone2').AsString := sheet.cells[i,8].Text;
            qyBuscaPessoasInfo.FieldByName('ds_email').AsString := sheet.cells[i,11].Text;
            qyBuscaPessoasInfo.FieldByName('cd_coligada').AsInteger := StrToInt(nm_coligada);
            qyBuscaPessoasInfo.FieldByName('nm_usuario').AsString := Dm.GetUsuarioLogado.Pessoa.Nome;
            qyBuscaPessoasInfo.FieldByName('cd_pessoa').AsInteger := cd_pessoa;
            qyBuscaPessoasInfo.FieldByName('ds_cidade').AsString := ds_cidade;
            qyBuscaPessoasInfo.FieldByName('ds_uf').AsString := ds_uf;
            qyBuscaPessoasInfo.FieldByName('cd_conhecimento').AsInteger := 1;
            qyBuscaPessoasInfo.FieldByName('ds_endereco').AsString := sheet.cells[i,17].Text;
            qyBuscaPessoasInfo.FieldByName('ds_telefone3').AsString := sheet.cells[i,9].Text;
            qyBuscaPessoasInfo.FieldByName('ds_telefone4').AsString := sheet.cells[i,10].Text;
            qyBuscaPessoasInfo.FieldByName('ds_curso').AsString := sheet.cells[i,13].Text;
            qyBuscaPessoasInfo.FieldByName('dt_retorno').AsDateTime := dt_retorno;
            qyBuscaPessoasInfo.FieldByName('ds_area_assunto').AsString := sheet.Cells[i,12].Text;
            qyBuscaPessoasInfo.FieldByName('ds_obs4').AsString := '';
            qyBuscaPessoasInfo.FieldByName('cd_consultor').AsInteger := 1;
            qyBuscaPessoasInfo.FieldByName('ds_status').AsString := ds_status;

            qyBuscaPessoasInfo.Post;
         end;
      end;
      qyBuscaPessoasInfo.EnableControls;

      //Fecho a planilha
      planilha.WorkBooks.Close;
      planilha.Visible:=False;
      planilha.Quit;
      planilha := Unassigned;

      // Trata os erros de processo do Windows
      messageFilter.RevokeFilter();

      FreeAndNil(messageFilter);
      Mensagem('Arquivo importado com sucesso!');
      TfSplash.GetInstancia().CloseSplashScreen();
   except
      Mensagem('Não foi possível importar o arquivo!');
      TfSplash.GetInstancia().CloseSplashScreen();
      //Fecho a planilha
      planilha.WorkBooks.Close;
      planilha.Visible:=False;
      planilha.Quit;
      planilha := Unassigned;

      // Trata os erros de processo do Windows
      messageFilter.RevokeFilter();

      FreeAndNil(messageFilter);
      qyBuscaPessoasInfo.Close;
   end;
end;

procedure TfPessoasInformacoes.modeloExcelClick(Sender: TObject);
var
   excel: Variant;
   arquivo : string;
   messageFilter : IOleMessageFilter;

begin
   try
      if sdExportarExcel.Execute then
         arquivo := sdExportarExcel.FileName
      else
         exit;
      
        { Instacia a classe que trata os erros de
            processos do Windows para abrir o EXCEL  }
         messageFilter := IOleMessageFilter.Create();

         Excel:= CreateOleObject('Excel.Application');

         // Trata os erros de processo do Windows
         messageFilter.RegisterFilter();

         Excel.Visible:=False;
         Excel.DisplayAlerts:=False;
         Excel.Workbooks.Add;
         Excel.Workbooks[1].Sheets.Add;
         Excel.Workbooks[1].WorkSheets[1].Name:='Contatos';
         Excel.Workbooks[1].WorkSheets[1].DisplayPageBreaks:=False;

         // Monta o cabeçalho da tabela
         definirCabecalho(Excel);

         Excel.Columns.AutoFit;
         Excel.WorkBooks[1].Sheets[1].SaveAs(arquivo);
         Excel.Visible:=True;
         Excel.Quit;
         Excel := Unassigned;

         // Trata os erros de processo do Windows
         messageFilter.RevokeFilter();
         Mensagem('Modelo gerado com sucesso!');
         FreeAndNil(messageFilter);
   except
      Mensagem('Não foi possível gerar o arquivo modelo!');

      //Fecho a planilha
      Excel.WorkBooks.Close;
      Excel.Visible:=False;
      Excel.Quit;
      Excel := Unassigned;

      // Trata os erros de processo do Windows
      messageFilter.RevokeFilter();

      FreeAndNil(messageFilter);
   end;
end;

procedure TfPessoasInformacoes.outrosFiltrosClick(Sender: TObject);
var
   qtdTotalItens, contMarcados, contNaoMarcados, i: Integer;
begin
   if TMenuItem(Sender).Tag = -1 then
   begin

      btOutrosFiltros.Caption := 'Todos os filtros';
      btOutrosFiltros.Hint := '';
      
      For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
      begin
         pmOutrosFiltros.Items[i].Checked := True;
      end;
   end // Desmarcar todas
   else if TMenuItem(Sender).Tag = -2 then
   begin

      btOutrosFiltros.Caption := 'Outros Filtros';
      btOutrosFiltros.Hint := '';

      For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
      begin
         pmOutrosFiltros.Items[i].Checked := False;
      end;
   end
   else  //Selecionou alguma opção de filtro por campo especifico
   begin
      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;

      contMarcados := 0;
      For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
      begin
         if pmOutrosFiltros.Items[i].Checked = False then
         begin
            contNaoMarcados := contNaoMarcados + 1;
         end;

         if pmOutrosFiltros.Items[i].Checked = True then
         begin
            contMarcados := contMarcados + 1;
         end;
      end;

      i:=i-3;
      
      if contNaoMarcados = i then
      begin
         btOutrosFiltros.Caption := 'Outros Filtros';
      end;

      if contMarcados > 0 then
      begin
         btOutrosFiltros.Hint := '';
         btOutrosFiltros.Caption := '';

         if contMarcados = i then
         begin
            btOutrosFiltros.Caption := 'Todos os filtros';
         end;

         qtdTotalItens := i;
         btOutrosFiltros.Caption := '';
         For i:= 3 to pmOutrosFiltros.Items.Count - 1 do
         begin
            if contMarcados > 1 then
            begin
               if pmOutrosFiltros.Items[i].Checked then
               begin
                  if btOutrosFiltros.Caption = '' then
                  begin
                     btOutrosFiltros.Caption := pmOutrosFiltros.Items[i].Caption;
                     btOutrosFiltros.Hint := pmOutrosFiltros.Items[i].Caption;
                     if length(btOutrosFiltros.Caption) > 15 then
                     begin
                        btOutrosFiltros.Caption := btOutrosFiltros.Caption + ', ...';
                     end;
                  end
                  else
                  begin
                     if Length(btOutrosFiltros.Caption) > 15 then
                     begin
                        btOutrosFiltros.Hint := btOutrosFiltros.Hint + ', ' + pmOutrosFiltros.Items[i].Caption;
                     end
                     else
                     begin
                        btOutrosFiltros.Caption := btOutrosFiltros.Caption + ', ' + pmOutrosFiltros.Items[i].Caption;

                        if Length(btOutrosFiltros.Caption) > 15 then
                        begin
                           btOutrosFiltros.Caption := btOutrosFiltros.Caption + ', ...';
                        end;

                        btOutrosFiltros.Hint := btOutrosFiltros.Hint + ', ' + pmOutrosFiltros.Items[i].Caption;
                     end;
                  end;
               end;
            end;
            
            if ((contMarcados = 1) and (pmOutrosFiltros.Items[i].Checked = true)) then
            begin
               btOutrosFiltros.Caption := pmOutrosFiltros.Items[i].Caption;
            end;
            
         end;
         if contMarcados = 0 then
         begin
            btOutrosFiltros.Caption := 'Outros Filtros';
         end;

         if contMarcados = qtdTotalItens then
         begin
            btOutrosFiltros.Caption := 'Todos os filtros';
         end;
      end;
      
      btOutrosFiltros.ShowHint := True;
      if TMenuItem(Sender).Tag = -1 then
      begin
         TMenuItem(Sender).Checked := False;
      end;
   end;
end;

procedure TfPessoasInformacoes.preencheAreaAssuntos;
var
   qyAreaAssunto: TUMZQuery;
begin

   dm.CriarConsulta(qyAreaAssunto);
   qyAreaAssunto.SQL.Text := 'SELECT * FROM situacoes where cd_modulo = 1035 and COALESCE(cd_auxiliar,0) <> 1';
   qyAreaAssunto.Open;

   qyAreaAssunto.First;

   cbAreaAssuntoFiltro.Clear;
   cbAreaAssuntoFiltro.Items.Add('Todos');

   while not (qyAreaAssunto.Eof) do
   begin
      cbAreaAssuntoFiltro.Items.Add(qyAreaAssunto.FieldByName('ds_valor').asString);
      qyAreaAssunto.Next;
   end;

   cbAreaAssuntoFiltro.ItemIndex := 0;
end;

procedure TfPessoasInformacoes.preencheContatosFiltro(Sender: TObject);
var
   itemAux: TMenuItem;
begin
   
   //Item Selecionar todos os contatos
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := 'Selecionar Todos';
   itemAux.Tag := -1;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item Selecionar desmarcar os contatos
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := 'Desmarcar Todos';
   itemAux.Tag := -2;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item Separador
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := '-';
   itemAux.Tag := -3;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item E-mail
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := 'E-mail';
   itemAux.Tag := 1;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 1(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone1');
   itemAux.Tag := 2;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 2(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone2');
   itemAux.Tag := 3;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 3(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone3');
   itemAux.Tag := 4;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

   //Item telefone 4(nome alterado por variável)
   itemAux := TMenuItem.Create(pmContatos);
   itemAux.Caption := DM.variavel_parametro('pessoascontatos_telefone4');
   itemAux.Tag := 5;
   itemAux.OnClick := contatosFiltra;
   itemAux.Checked := False;

   pmContatos.Items.Add(itemAux);

end;

procedure TfPessoasInformacoes.preencheInfoPor;
begin
   cbInfPor.Items.Clear;

   qryInfoPor.Close;
   qryInfoPor.Open;

   cbInfPor.AddItem(
      '',
     nil
   );

   while not qryInfoPor.Eof do
   begin
      cbInfPor.AddItem(
         qryInfoPor.FieldByName('ds_valor').AsString,
         TItemCombo.Create(
            qryInfoPor.FieldByName('cd_situacao').AsString,
            qryInfoPor.FieldByName('ds_valor').AsString
         )
      );
      qryInfoPor.Next;
   end;
end;


procedure TfPessoasInformacoes.preencheOutrosFiltros(arrCamposObs: TStringList);
var
   itemAux: TMenuItem;
   ultimaPosicao: Integer;
begin
   //Item Selecionar todos os contatos
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Selecionar Todos';
   itemAux.Tag := -1;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Selecionar desmarcar os contatos
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Desmarcar Todos';
   itemAux.Tag := -2;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Separador
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := '-';
   itemAux.Tag := -3;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Nome pessoa
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Nome Pessoa';
   itemAux.Tag := 1;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   //Item Desc. da informação.
   itemAux := TMenuItem.Create(pmOutrosFiltros);
   itemAux.Caption := 'Desc. da Informação';
   itemAux.Tag := 2;
   itemAux.OnClick := outrosFiltrosClick;
   itemAux.Checked := False;

   pmOutrosFiltros.Items.Add(itemAux);

   if arrCamposObs.Count > 0 then
   begin

      if ( (arrCamposObs[0] <> null) AND (trim(arrCamposObs[0]) <> '') )then
      begin

         //Campo 1 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[0];
         itemAux.Tag := 3;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
      
   end;


   if arrCamposObs.Count > 1 then
   begin
      if ( (arrCamposObs[1] <> null) AND (trim(arrCamposObs[1]) <> '') )then
      begin

         //Campo 2 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[1];
         itemAux.Tag := 5;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
   end;
   

   if arrCamposObs.Count > 2 then
   begin

      if ( (arrCamposObs[2] <> null) AND (trim(arrCamposObs[2]) <> '') )then
      begin

         //Campo 3 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[2];
         itemAux.Tag := 5;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
   end;


   if arrCamposObs.Count > 3 then
   begin

      if ( (arrCamposObs[3] <> null) AND (trim(arrCamposObs[3]) <> '') )then
      begin

         //Campo 4 da guia observação.
         itemAux := TMenuItem.Create(pmOutrosFiltros);
         itemAux.Caption := arrCamposObs[3];
         itemAux.Tag := 6;
         itemAux.OnClick := outrosFiltrosClick;
         itemAux.Checked := False;

         pmOutrosFiltros.Items.Add(itemAux);

      end;
   end;
end;

procedure TfPessoasInformacoes.preencheStatus;
var
   qyStatus: TUMZQuery;
begin

   dm.CriarConsulta(qyStatus);
   qyStatus.SQL.Text := 'SELECT * FROM situacoes where cd_modulo = 1035 and cd_auxiliar in (1,99,100) order by ds_valor';
   qyStatus.Open;

   qyStatus.First;

   cbStatus.Clear;
   cbStatus.Items.Add('Todos');

   while not (qyStatus.Eof) do
   begin
      cbStatus.Items.Add(qyStatus.FieldByName('ds_valor').asString);
      qyStatus.Next;
   end;

   cbStatus.ItemIndex := 0;
end;

procedure TfPessoasInformacoes.preencheVendedor;
var
   qyVendedores: TUMZQuery;
begin

   dm.CriarConsulta(qyVendedores);
   qyVendedores.SQL.Text := ''+
   'SELECT DISTINCT                                                     '+
   '  p.cd_pessoa,                                                      '+
	'  p.nm_pessoa                                                       '+
   'FROM                                                                '+
   '  nu_grupos ng                                                      '+
   '  INNER JOIN nu_grupos_pessoas ngp ON (ng.cd_grupo = ngp.cd_grupo)  '+
   '  INNER JOIN pessoas p ON (p.cd_pessoa = ngp.cd_pessoa)             '+
   'WHERE                                                               '+
   '  ng.ds_papel = "CONSULTORES"                                       '+
   'ORDER BY                                                            '+
   '  p.nm_pessoa                                                       ';

   qyVendedores.Open;

   qyVendedores.First;

   cbVendedor.Clear;

   cbVendedor.Items.AddObject(
      'Todos',
      TItemCombo.Create(
         '0',
         'Todos'
      )
   );

   cbVendedor.Items.AddObject(
      'Sem vendedor',
      TItemCombo.Create(
         '-1',
         'Sem vendedor'
      )
   );

   while not (qyVendedores.Eof) do
   begin
      cbVendedor.Items.AddObject(
         qyVendedores.FieldByName('nm_pessoa').AsString,
         TItemCombo.Create(
            qyVendedores.FieldByName('cd_pessoa').asString,
            qyVendedores.FieldByName('nm_pessoa').AsString
         )
      );

      qyVendedores.Next;
   end;

   cbVendedor.ItemIndex := 0;
end;

procedure TfPessoasInformacoes.qryPessoasInfoFiltrarAfterOpen(
  DataSet: TDataSet);
begin

   qryPessoasInfoFiltrards_contatos.DisplayLabel := DM.variavel_parametro('pessoascontatos_telefone1');
   qryPessoasInfoFiltrards_telefone2.DisplayLabel := DM.variavel_parametro('pessoascontatos_telefone2');
   qryPessoasInfoFiltrards_telefone3.DisplayLabel := DM.variavel_parametro('pessoascontatos_telefone3');
   qryPessoasInfoFiltrards_telefone4.DisplayLabel := DM.variavel_parametro('pessoascontatos_telefone4');

end;

procedure TfPessoasInformacoes.qryPessoasInfoFiltrards_informacaoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
var
   ds_continua : String;
begin
  ds_continua := '';
  if Length(qryPessoasInfoFiltrards_informacao.AsString) > 255 then
   ds_continua := ' ...';

  Text := Copy(qryPessoasInfoFiltrards_informacao.AsString, 1, 255) + ds_continua;
end;

procedure TfPessoasInformacoes.qyPessoasInfoAfterPost(DataSet: TDataSet);
begin
    qryPessoasInfoFiltrar.Close;
    qryPessoasInfoFiltrar.Open;
end;

procedure TfPessoasInformacoes.qyPessoasInfoBeforeOpen(DataSet: TDataSet);
begin
   qyEstados.open;
   qyMunicipios.Open;
end;

procedure TfPessoasInformacoes.restauraFiltros();
var
   contComponentes, contListaFiltro : integer;
   listaFiltros: TStringList;
   ds_componente,ds_conteudo_filtro : String;
begin
   qryPessoasPreferencias.Close;

   qryPessoasPreferencias.ParamByName('cd_pessoa').AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
   qryPessoasPreferencias.Open;
   
   listaFiltros := TStringList.Create;
   
   SplitString(
      qryPessoasPreferencias.FieldByName('ds_valor').AsString,
      ';',
      listaFiltros
   );


  ckbData.Checked := false;
  ckbDataRetorno.Checked := false;
  for contListaFiltro := listaFiltros.Count-1 downto 0 do
   //for contListaFiltro := 0 to listaFiltros.Count-1 do
   begin
      for contComponentes:= 0 to self.ComponentCount-1  do
      begin
         // Recupera apenas o nome do componente salvo na lista   
         ds_componente := copy(
               listaFiltros[contListaFiltro],
               1,
               Pos('[',listaFiltros[contListaFiltro])-1
         );

         { Recupera o valor do filtro realizado que
           está entre [] colchetes }
         ds_conteudo_filtro:= copy(
            listaFiltros[contListaFiltro],
            Pos(
               '[',
               listaFiltros[contListaFiltro]
            )+1
         );

         ds_conteudo_filtro := StringReplace(
            ds_conteudo_filtro,
            ']',
            '',
            [rfReplaceAll]
         );

         if ( getPrefixoComponente(
                 self.Components[contComponentes].Name,
                 1,
                 2
              ) = 'ed' )  then
         begin
            if ( ds_componente = self.Components[contComponentes].Name ) then
            begin
               TEdit(
                  FindComponent(ds_componente)
               ).Text := ds_conteudo_filtro;
               // Achou o registro? Então remove da lista otimizando a busca
               listaFiltros.Delete( contListaFiltro );
            end;
         end
         else
         if ( getPrefixoComponente(
                 self.Components[contComponentes].Name,
                 1,
                 2
               ) = 'cb' )  then
         begin
            if ( ds_componente = self.Components[contComponentes].Name ) then
            begin
               TComboBox(
                  FindComponent(ds_componente)
               ).ItemIndex := StrToInt(ds_conteudo_filtro);

               if ( ds_componente = 'cbEstado' ) then
               begin
                  cbEstadoChange( nil );
               end;

               // Achou o registro? Então remove da lista otimizando a busca
               if ( ds_componente <> 'cbMunicipios' ) then
               begin
                  listaFiltros.Delete( contListaFiltro );
               end;

            end;
         end
         else
         if ( getPrefixoComponente(
                 self.Components[contComponentes].Name,
                 1,
                 4
               ) = 'umdt' )  then
         begin
            if ( ds_componente = self.Components[contComponentes].Name ) then
            begin
               TUMDateTimePicker(
                  FindComponent(ds_componente)
               ).Date := StrToDate(ds_conteudo_filtro);

               if ( ds_componente = 'umdtIniRetorno' ) then
               begin
                  ckbDataRetorno.Checked := true;
               end;

              if ( ds_componente = 'umdtFiltroInicio' ) then
               begin
                  ckbData.Checked := true;
               end;

               // Achou o registro? Então remove da lista otimizando a busca
               listaFiltros.Delete( contListaFiltro );
            end;
         end;
      end;
   end;
   listaFiltros.Free; 
end;

function TfPessoasInformacoes.getPrefixoComponente( nm_componente: String;
   nr_inicial, nr_final : integer ): String;
begin
   {
      Retorna o prefixo do componente,
      dessa forma se ele estiver nomeado corretamente
      poderemos identifica-lo
   }
   result := copy(
      nm_componente,
      nr_inicial,
      nr_final
   );
end;
procedure TfPessoasInformacoes.sbBuscaUnidadeClick(Sender: TObject);
var coligada_filtrada : TColigada;
begin
if TfrmSelecionarColigada.ShowModal() then
   begin
      coligada_filtrada := TfrmSelecionarColigada.getResultado();
      edUnidadeEnsino.Text := coligada_filtrada.Nome;
   end;
end;

procedure TfPessoasInformacoes.sbBuscaUsuarioClick(Sender: TObject);
var resultado_filtro : TResultadoFiltroPessoa;
begin
   {Pesquisar Responsével}
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa);

   if resultado_filtro.filtrado then
   Begin
      ed_CodUsuario.Text := IntToStr( resultado_filtro.cd_pessoa );
      ed_Usuario.Text := resultado_filtro.nm_pessoa;
   end;
end;

procedure TfPessoasInformacoes.sbCursoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroCurso;
begin
   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1, DM.GetAnoSemestreAtual);

   if not resultado_filtro.filtrado then Exit;
   ed_curso.Text := resultado_filtro.ds_curso;
   codCursoFiltrado := resultado_filtro.cd_curso;
   anoSemestreFiltrado:= resultado_filtro.nr_anosemestre;

end;

procedure TfPessoasInformacoes.sbLimpaUnidadeClick(Sender: TObject);
begin
   edUnidadeEnsino.Text := '';
end;

procedure TfPessoasInformacoes.sbLimpaUsuarioClick(Sender: TObject);
begin
   ed_CodUsuario.Text := '';
   ed_Usuario.Text := '';
end;

procedure TfPessoasInformacoes.SetNomeColunaParametro(
  const arrNomesColunas: TStringList);
var
   i : integer;
begin
  for i := 0 to DBGrid1.Columns.Count - 1 do
   begin
      if ( DBGrid1.Columns[i].FieldName = 'ds_obs1' ) then
      begin
         DBGrid1.Columns[i].Title.Caption := arrNomesColunas[0];
         qryPessoasInfoFiltrards_obs1.Tag := 1;
         qryPessoasInfoFiltrards_obs1.DisplayLabel := arrNomesColunas[0];
         Continue;
      end;

      if ( DBGrid1.Columns[i].FieldName = 'ds_obs2' ) then
      begin
         DBGrid1.Columns[i].Title.Caption := arrNomesColunas[1];
         qryPessoasInfoFiltrards_obs2.Tag := 1;
         qryPessoasInfoFiltrards_obs2.DisplayLabel := arrNomesColunas[1];
         Continue;
      end;

      if ( DBGrid1.Columns[i].FieldName = 'ds_obs3' ) then
      begin
         DBGrid1.Columns[i].Title.Caption := arrNomesColunas[2];
         qryPessoasInfoFiltrards_obs3.Tag := 1;
         qryPessoasInfoFiltrards_obs3.DisplayLabel := arrNomesColunas[2];
         Continue;
      end;
                   
      if ( DBGrid1.Columns[i].FieldName = 'ds_obs4' ) then
      begin
         DBGrid1.Columns[i].Title.Caption := arrNomesColunas[3];
         qryPessoasInfoFiltrards_obs4.Tag := 1;         
         qryPessoasInfoFiltrards_obs4.DisplayLabel := arrNomesColunas[3];
         Continue;         
      end;
   end;
end;

function TfPessoasInformacoes.Subst(Text, NewChar, OldChar: String): String;
var
   Cont : Integer;
begin
   if NewChar = OldChar then
   begin
      Result := Text;
      Exit;
   end;

   cont := Pos(OldChar,Text);

   while Cont > 0 do
   begin
      Delete(Text,Cont,Length(OldChar));
      Insert(NewChar,Text,Cont);
      cont := Pos(OldChar,Text);
   end;

   Result := Text;
end;

procedure TfPessoasInformacoes.tbCadastroClick(Sender: TObject);
const
   SQL_DEPENDENTE = 'SELECT cd_pessoa FROM Pessoas WHERE cd_resp_finan = :pessoa ';
var
   qryPessoa: TUMZQuery;
begin
   DM.CriarConsulta(qryPessoa);
   qryPessoa.SQL.Add(SQL_DEPENDENTE);
   qryPessoa.ParamByName('pessoa').AsString := qryPessoasInfoFiltrarcd_pessoa.AsString;

   // Adiciona essa condição para o caso de ser responsável de mais de uma pessoa
   if ( qryPessoasInfoFiltrarcd_dependente.AsString <> '' )  then
   begin
      qryPessoa.SQL.Add(
         ' AND cd_pessoa = :cd_dependente'
       );
         
      qryPessoa.ParamByName('cd_dependente').AsString := qryPessoasInfoFiltrarcd_dependente.AsString;
   end;

   qryPessoa.Open;

   if(qryPessoa.IsEmpty) then
   begin
      qryPessoa.Close;
      exit;
   end;

   if not DM.UsuarioLogado.TemPermissao( 1003, npAcesso, True ) then Exit;

   if not PrincipalForm.ProcuraForm( TForm(frm_Alunos) ) then
   begin
      Application.CreateForm( Tfrm_Alunos, frm_Alunos );
   end;

   frm_Alunos.filtro_cd_pessoa := qryPessoa.FieldByName('cd_pessoa').AsInteger;
   frm_Alunos.btBuscar_PessoaClick(nil);

   qryPessoa.Close;
   frm_Alunos.Show;
end;

procedure TfPessoasInformacoes.ed_CodUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
   {Nao permite texto no edit do funcionario}
   If not( key in['0'..'9',#08] ) then
      key:=#0;
end;

function TfPessoasInformacoes.validaCidadeExcel(ds_cidade: String): String;
var
   qryValidaCidade : TUMZQuery;
   encontrou : Boolean;
begin
   DM.CriarConsulta(qryValidaCidade);

   qryValidaCidade.SQL.Text := 'SELECT ds_municipio FROM municipios' ;

   qryValidaCidade.Open;

   encontrou := qryValidaCidade.Locate(
      'ds_municipio',
      ds_cidade,
      [loCaseInsensitive]
   );

   if ( encontrou ) then
   begin
      result := qryValidaCidade.FieldByName('ds_municipio').AsString;
   end else
   begin
      result := '';
   end;
end;

function TfPessoasInformacoes.validaCodigoPessoaContato(
  codigo_pessoa: String): integer;
begin
   if ( codigo_pessoa = '' ) then
   begin
       result := 0;
       exit;
   end;

   result := StrToInt(codigo_pessoa);
end;

function TfPessoasInformacoes.validaColigadasExcel( sn_importar : Boolean ; cd_coligada: String): String;
var
   qyGetNomeColigada : TUMZQuery;
   nm_coligada, cod_coligada : String;
Begin
   DM.CriarConsulta(qyGetNomeColigada);

   if not ( sn_importar ) then
   begin
      qyGetNomeColigada.SQL.Text := ''
      + ' SELECT '
      + ' c.cd_coligada cd_coligada, '
      + ' c.nm_coligada nm_coligada '
      + ' FROM '
      + ' coligadas c '
      + ' WHERE '
      + ' c.cd_coligada = ' + cd_coligada ;

      qyGetNomeColigada.Open;

      result := qyGetNomeColigada.FieldByName('nm_coligada').AsString;

   end else
   begin
      qyGetNomeColigada.SQL.Text := ''
      + ' SELECT '
      + ' c.cd_coligada cd_coligada, '
      + ' c.nm_coligada nm_coligada '
      + ' FROM '
      + ' coligadas c '
      + ' WHERE '
      + ' c.nm_coligada = "' + cd_coligada + '"' ;

      qyGetNomeColigada.Open;

      result := qyGetNomeColigada.FieldByName('cd_coligada').AsString;
   end;
end;

function TfPessoasInformacoes.validaDatasExcel(data_validar: String): TDateTime;
begin
   // Se não tem data definida assume a data da importação como padrão
   result:= StrToDateTime(FormatDateTime('dd/mm/yyyy',Now));
   if (data_validar <> '') then
   begin
      result:= StrToDateTime(data_validar);
   end;
end;

function TfPessoasInformacoes.validaEstadoExcel(ds_uf: String): String;
var
   qryValidaUF : TUMZQuery;
   encontrou : Boolean;
begin
   DM.CriarConsulta(qryValidaUF);

   qryValidaUF.SQL.Text := 'SELECT ds_uf FROM estados' ;

   qryValidaUF.Open;

   encontrou := qryValidaUF.Locate(
      'ds_uf',
      ds_uf,
      [loCaseInsensitive]
   );

   if ( encontrou ) then
   begin
      result := qryValidaUF.FieldByName('ds_uf').AsString;
   end else
   begin
      result := '';
   end;
end;

function TfPessoasInformacoes.validaInformacaoOrigemExcel(
  sn_importar : Boolean ; ds_info_por: String): String;
var
   ds_retorno :  String;
   qryInfoPor_Busca : TUMZQuery;
begin
   ds_retorno:= '';
   DM.CriarConsulta(qryInfoPor_Busca);
   qryInfoPor_Busca.Close();

   // Busca na tabela de situacoes as maneiras por onde
   //  o usuário ficou sabendo da instituição
   qryInfoPor_Busca.SQL.Text := ''
      + ' SELECT '
      + '   s.codigo codigo, '
      + '	s.cd_situacao cd_origem, '
     	+ '   s.ds_valor ds_valor '
      + ' FROM '
      + '   situacoes s '
      + ' WHERE '
      + '   s.cd_modulo = 30005  AND '
      + ' $$condicao_info_origem$$';

   if ( sn_importar ) then
   begin
      if ( ds_info_por <> '' ) then
      begin
          qryInfoPor_Busca.SQL.Text := StringReplace(
               qryInfoPor_Busca.SQL.Text,
               '$$condicao_info_origem$$',
               '  s.ds_valor = "' + ds_info_por + '"',
               [rfReplaceAll, rfIgnoreCase]
         );

         qryInfoPor_Busca.Open();

         ds_retorno :=  qryInfoPor_Busca.FieldByName('cd_origem').AsString;
         result :=   ds_retorno;
         Exit;
      end;
      result := '0';
   end else
   begin
      if ( ds_info_por <> '' ) then
      begin
         qryInfoPor_Busca.SQL.Text := StringReplace(
               qryInfoPor_Busca.SQL.Text,
               '$$condicao_info_origem$$',
               '  s.cd_situacao = ' + ds_info_por,
               [rfReplaceAll, rfIgnoreCase]
         );

         qryInfoPor_Busca.Open();

         ds_retorno :=  qryInfoPor_Busca.FieldByName('ds_valor').AsString;
      end;
      result := ds_retorno;
   end;
end;

function TfPessoasInformacoes.validaStatusExcel(ds_status: String): String;
var
   qryValidaStatus : TUMZQuery;
   encontrou : Boolean;
begin
   DM.CriarConsulta(qryValidaStatus);

   qryValidaStatus.SQL.Text := ''
   + ' SELECT '
   + ' ds_valor '
   + ' FROM '
   + ' situacoes '
   + ' WHERE '
   + ' cd_modulo = 1035 AND cd_auxiliar = 1' ;

   qryValidaStatus.Open;

   encontrou := qryValidaStatus.Locate(
      'ds_valor',
      ds_status,
      [loCaseInsensitive]
   );

   if ( encontrou ) then
   begin
      result := qryValidaStatus.FieldByName('ds_valor').AsString;
   end else
   begin
      result := '';
   end;
end;

procedure TfPessoasInformacoes.btContatosFiltrosClick(Sender: TObject);
begin
   pmContatos.Popup(btContatosFiltros.Left, btContatosFiltros.Top + btContatosFiltros.Height + 140);
end;

procedure TfPessoasInformacoes.definirCabecalho(Excel: Variant);
begin
   excel.WorkBooks[1].Sheets[1].Cells[1,1]:= 'Unidade:';
   excel.WorkBooks[1].Sheets[1].Cells[1,2]:= 'Status:';
   excel.WorkBooks[1].Sheets[1].Cells[1,3]:= 'Consultor:';
   excel.WorkBooks[1].Sheets[1].Cells[1,4]:= 'Descrição da Informação:';
   excel.WorkBooks[1].Sheets[1].Cells[1,5]:= 'Cód. Pessoa de Contato:';
   excel.WorkBooks[1].Sheets[1].Cells[1,6]:= 'Nome da Pessoa de Contato:';
   excel.WorkBooks[1].Sheets[1].Cells[1,7]:= 'Telefone 1:';
   excel.WorkBooks[1].Sheets[1].Cells[1,8]:= 'Telefone 2:';
   excel.WorkBooks[1].Sheets[1].Cells[1,9]:= 'Telefone 3:';
   excel.WorkBooks[1].Sheets[1].Cells[1,10]:= 'Telefone 4:';
   excel.WorkBooks[1].Sheets[1].Cells[1,11]:= 'E-mail:';
   excel.WorkBooks[1].Sheets[1].Cells[1,12]:= 'Área/Assunto:';
   excel.WorkBooks[1].Sheets[1].Cells[1,13]:= 'Curso:';
   excel.WorkBooks[1].Sheets[1].Cells[1,14]:= 'Turma:';
   excel.WorkBooks[1].Sheets[1].Cells[1,15]:= 'Estado:';
   excel.WorkBooks[1].Sheets[1].Cells[1,16]:= 'Cidade:';
   excel.WorkBooks[1].Sheets[1].Cells[1,17]:= 'Endereço:';
   excel.WorkBooks[1].Sheets[1].Cells[1,18]:= 'Forma que ficou sabendo da instituição:';
   excel.WorkBooks[1].Sheets[1].Cells[1,19]:= 'Data Info. :';
   excel.WorkBooks[1].Sheets[1].Cells[1,20]:= 'Data de retorno :';
   excel.WorkBooks[1].Sheets[1].Cells[1,21]:= 'Informação por :';
end;

procedure TfPessoasInformacoes.dsPessoasInfoDataChange(Sender: TObject;
  Field: TField);
begin
   btEnviarEmail.Visible := Trim(qryPessoasInfoFiltrards_email.AsString) <> '';
   enviar_email_todos.Visible := not qryPessoasInfoFiltrar.IsEmpty;
   btnObservacoes.Marked := verificaObservacoes(qryPessoasInfoFiltrarcd_informacao.AsInteger);
end;

procedure TfPessoasInformacoes.dsPessoasInfoFiltrarDataChange(Sender: TObject;
  Field: TField);
var
   CanEnable, UserOwner: Boolean;
begin
   CanEnable :=
      (dsPessoasInfoFiltrar.State = dsBrowse) and
      (not qryPessoasInfoFiltrar.IsEmpty) and
      (npAlterar in FPermissoesAlteracao);

   UserOwner :=
      (qryPessoasInfoFiltrarcd_consultor.AsInteger = DM.UsuarioLogado.Pessoa.Codigo) or
      qryPessoasInfoFiltrarcd_consultor.IsNull;
      
   btAlterar.Enabled := CanEnable or UserOwner;
   btnEncaminharContato.Enabled := CanEnable or UserOwner;
   btnGerarCadastroPessoa.Enabled := CanEnable or UserOwner;

   CanEnable :=
      (dsPessoasInfoFiltrar.State = dsBrowse) and
      (not qryPessoasInfoFiltrar.IsEmpty) and
      (npExcluir in FPermissoesAlteracao);

   btExcluir.Enabled := CanEnable or UserOwner;
   tbCadastro.Enabled := qryPessoasInfoFiltrarcd_pessoa.IsNull = false;
   btnObservacoes.Marked := verificaObservacoes(qryPessoasInfoFiltrarcd_informacao.AsInteger);
end;

procedure TfPessoasInformacoes.ed_cursoChange(Sender: TObject);
begin
  if ed_curso.Text = '' then
  begin
    anoSemestreFiltrado := 0;
    codCursoFiltrado:= ''; 
  end;
end;

procedure TfPessoasInformacoes.enviar_emailClick(Sender: TObject);
begin
      ShellExecute(
         GetDesktopWindow,
         'open',
         PChar(
            'mailto:'
            + qryPessoasInfoFiltrards_email.AsString
         ),
         nil,
         nil,
         sw_ShowNormal
      );
end;

procedure TfPessoasInformacoes.enviar_email_todosClick(Sender: TObject);
var
   emails, email : string;
   i, conta, qtd: integer;
begin
   Self.qryPessoasInfoFiltrar.First;
   emails := 'mailto:';
   conta := 0;

   while not Self.qryPessoasInfoFiltrar.Eof do
   begin
      if not(Self.qryPessoasInfoFiltrar.FieldByName('ds_email').IsNull) and (Self.qryPessoasInfoFiltrar.FieldByName('ds_email').AsString <> '')then
      begin
         // Adiciona o email na lista de emails
         if(emails <> 'mailto:')then
            emails := emails + ';';
         email := Self.qryPessoasInfoFiltrar.FieldByName('ds_email').AsString;
         emails := emails + email;

         // Verifica a quantidade de emails em cada contato
         qtd := 0;
         for i := 0 to Length(email) do
         begin
            if(email[i] = '@')then
               qtd := qtd + 1;
         end;

         // Acrescenta o contador
         conta := conta + qtd;

         // Se o contador chegar no limite definido no parâmetro ele cria uma nova instância do gerenciador de email
         if(conta = StrToInt(DM.variavel_parametro('dividi_numeros_contatos'))) and (StrToInt(DM.variavel_parametro('dividi_numeros_contatos')) <> 0)then
         begin
            ShellExecute(GetDesktopWindow,'open', PChar(emails),nil,nil,sw_ShowNormal);
            conta := 0;
            emails := 'mailto:';
         end else if (conta > StrToInt(DM.variavel_parametro('dividi_numeros_contatos'))) and (StrToInt(DM.variavel_parametro('dividi_numeros_contatos')) <> 0)then
         begin
            ShellExecute(GetDesktopWindow,'open', PChar('mailto:'+email),nil,nil,sw_ShowNormal);
            ShellExecute(GetDesktopWindow,'open', PChar(StringReplace(emails, email, '', [])),nil,nil,sw_ShowNormal);
            conta := 0;
            emails := 'mailto:';
         end;
      end;
      Self.qryPessoasInfoFiltrar.Next;
   end;

   if(emails <> 'mailto:')then
   begin
      ShellExecute(GetDesktopWindow,'open', PChar(emails),nil,nil,sw_ShowNormal);
   end;

end;

procedure TfPessoasInformacoes.exportarExcelClick(Sender: TObject);
var
   excel: Variant;
   arquivo, nm_coligada, ds_status, ds_area_assunto,
   ds_uf, ds_cidade, ds_info_por, ds_data_info, dt_retorno : string;
   i, j : integer;
   sn_importar : Boolean;
   messageFilter : IOleMessageFilter;
   qyBuscaPessoasInfo : TUMZQuery;
begin
   // -> i <- comeca com 2 pois a primeira coluna já tem o cabeçalho
   i := 2;
   j := 1;
   nm_coligada := '';

    try

      if sdExportarExcel.Execute then
         arquivo := sdExportarExcel.FileName
      else
         exit;

     { Instacia a classe que trata os erros de
         processos do Windows para abrir o EXCEL  }
      messageFilter := IOleMessageFilter.Create();

      Excel:= CreateOleObject('Excel.Application');

      // Trata os erros de processo do Windows
      messageFilter.RegisterFilter();

      Excel.Visible:=False;
      Excel.DisplayAlerts:=False;
      Excel.Workbooks.Add;
      Excel.Workbooks[1].Sheets.Add;
      Excel.Workbooks[1].WorkSheets[1].Name:='Contatos';
      Excel.Workbooks[1].WorkSheets[1].DisplayPageBreaks:=False;

      // Monta o cabeçalho da tabela
      definirCabecalho(Excel);

      dm.CriarConsulta(qyBuscaPessoasInfo);
      qyBuscaPessoasInfo.SQL.Text := qryPessoasInfoFiltrar.SQL.Text;
      qyBuscaPessoasInfo.Close();
      qyBuscaPessoasInfo.Open();

      TfSplash.GetInstancia().ShowSplashScreen(
         'Exportação',
         'Exportando informações para o arquivo... Favor Aguarde'
      );
      while not(qyBuscaPessoasInfo.Eof) do
      begin

         sn_importar := False;
         
         nm_coligada := validaColigadasExcel(
               sn_importar,
               qyBuscaPessoasInfo.FieldByName('cd_coligada').AsString
         );

         ds_info_por := validaInformacaoOrigemExcel(
            sn_importar,
            qyBuscaPessoasInfo.FieldByName('cd_origem').AsString
         );
                 
         ds_data_info := '';
         if ( qyBuscaPessoasInfo.FieldByName('dt_informacao').AsString <> '' )  then
         begin
            {
               Formata com a mascara MES/DIA/ANO devido a um Bug
               ao gravar no Excel que inverte o MES com o DIA,
               Desta forma aparecerá corretamente no EXCEL DIA/MES/ANO
            }
            ds_data_info := FormatDateTime(
               'mm/dd/yyyy HH:nn',
               qyBuscaPessoasInfo.FieldByName('dt_informacao').AsDateTime
            );
         end;

         dt_retorno := '';
         if ( qyBuscaPessoasInfo.FieldByName('dt_retorno').AsString <> '' )  then
         begin
            {
               Formata com a mascara MES/DIA/ANO devido a um Bug
               ao gravar no Excel que inverte o MES com o DIA,
               Desta forma aparecerá corretamente no EXCEL DIA/MES/ANO
            }
            dt_retorno := FormatDateTime(
               'mm/dd/yyyy HH:nn',
               qyBuscaPessoasInfo.FieldByName('dt_retorno').AsDateTime
            );
         end;
         
         excel.WorkBooks[1].Sheets[1].Cells[i,1]  := nm_coligada;
         excel.WorkBooks[1].Sheets[1].Cells[i,2]  := qyBuscaPessoasInfo.FieldByName('ds_status').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,3]  := qyBuscaPessoasInfo.FieldByName('cd_consultor').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,4]  := qyBuscaPessoasInfo.FieldByName('ds_informacao').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,5]  := qyBuscaPessoasInfo.FieldByName('cd_pessoa').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,6]  := qyBuscaPessoasInfo.FieldByName('nm_pessoa').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,7]  := qyBuscaPessoasInfo.FieldByName('ds_contatos').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,8]  := qyBuscaPessoasInfo.FieldByName('ds_telefone2').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,9]  := qyBuscaPessoasInfo.FieldByName('ds_telefone3').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,10] := qyBuscaPessoasInfo.FieldByName('ds_telefone4').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,11] := qyBuscaPessoasInfo.FieldByName('ds_email').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,12] := qyBuscaPessoasInfo.FieldByName('ds_area_assunto').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,13] := qyBuscaPessoasInfo.FieldByName('ds_curso').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,14] := qyBuscaPessoasInfo.FieldByName('cd_turma').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,15] := qyBuscaPessoasInfo.FieldByName('ds_uf').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,16] := qyBuscaPessoasInfo.FieldByName('ds_cidade').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,17] := qyBuscaPessoasInfo.FieldByName('ds_endereco').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,18] := qyBuscaPessoasInfo.FieldByName('cd_conhecimento').AsString;
         excel.WorkBooks[1].Sheets[1].Cells[i,19] := ds_data_info;
         excel.WorkBooks[1].Sheets[1].Cells[i,20] := dt_retorno;
         excel.WorkBooks[1].Sheets[1].Cells[i,21] := ds_info_por;

         inc(i);
         qyBuscaPessoasInfo.Next;
      end;

      Excel.Columns.AutoFit;
      Excel.WorkBooks[1].Sheets[1].SaveAs(arquivo);
      Excel.Visible:=False;
      Excel.Quit;
      Excel := Unassigned;

      // Trata os erros de processo do Windows
      messageFilter.RevokeFilter();

      FreeAndNil(messageFilter);

      Mensagem('Arquivo exportado com sucesso!');
      TfSplash.GetInstancia().CloseSplashScreen();
   except
      Mensagem('Não foi possível exportar o arquivo!');
      TfSplash.GetInstancia().CloseSplashScreen();

      Excel.Columns.AutoFit;
      Excel.WorkBooks[1].Sheets[1].SaveAs(arquivo);
      Excel.Visible:=False;
      Excel.Quit;
      Excel := Unassigned;

      // Trata os erros de processo do Windows
      messageFilter.RevokeFilter();

      FreeAndNil(messageFilter);

   end;
end;

procedure TfPessoasInformacoes.DBGrid1DblClick(Sender: TObject);
begin
  btAlterarClick(self);
end;

procedure TfPessoasInformacoes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   cor : TColor;
begin
   if not qryPessoasInfoFiltrar.IsEmpty() then
   begin
      // Pinta coluna de acordo com situação
     if (gdSelected in State) or (gdFocused in State) then
      begin
         DBGrid1.Canvas.Font.Color := clWhite;
         DBGrid1.Canvas.Brush.Color:= clBlue;
         
         Canvas.FillRect(Rect);
         DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
      end
      else
      begin
         if (qryPessoasInfoFiltrards_cor_situacao.AsString <> '') then
         begin
            cor := HexColorToDec(qryPessoasInfoFiltrards_cor_situacao.AsString);
         end
         else
         begin
            cor := HexColorToDec('#fffafa');
         end;
         
         DBGrid1.Canvas.Font.Color:= clWindowText;

         DBGrid1.Canvas.Brush.Color:= cor;
         Canvas.FillRect(Rect);
//         Fecha pintura

         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
end;

procedure TfPessoasInformacoes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btIncluir.Enabled then btIncluirClick( nil );
    VK_F3 : if btAlterar.Enabled then btAlterarClick( nil );
    VK_F9 : if btExcluir.Enabled then btExcluirClick( nil );
    VK_F12 : if btFechar.Enabled then btFecharClick( nil );
  end;

end;

procedure TfPessoasInformacoes.DBGrid1TitleClick(Column: TColumn);
var
   n : smallint;
begin
  // Clique no título da grade... ordenar pela coluna clicada
  if(Column.FieldName = 'ds_origem') then
    Column.FieldName := 'cd_origem';

  if dbGrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
     Exit;

  For n:= 0 to dbGrid1.Columns.Count - 1 do begin
       dbGrid1.Columns[n].Title.Font.Style := [];
  end;

  if sOrdem = Column.FieldName then
     sOrdem := Column.FieldName + ' DESC '
  else
     sOrdem := Column.FieldName;

  if(Column.FieldName = 'cd_origem') then
    Column.FieldName := 'ds_origem';

  Column.Title.Font.Style := [fsUnderline];

  Filtrar();
end;

procedure TfPessoasInformacoes.cbEstadoChange(Sender: TObject);
begin
   qyMunicipiosFiltro.SQL.Text := 'Select * From municipios where ds_uf = :uf order by ds_municipio';
   qyMunicipiosFiltro.ParamByName('uf').AsString := cbEstado.Text;

   qyMunicipiosFiltro.Open;
   qyMunicipiosFiltro.First;

   cbMunicipios.Clear;
   cbMunicipios.Items.Add('');
   while not (qyMunicipiosFiltro.Eof) do
   begin
      cbMunicipios.Items.Add(qyMunicipiosFiltro.FieldByName('ds_municipio').asString);
      qyMunicipiosFiltro.Next;
   end;
end;

procedure TfPessoasInformacoes.ckbDataClick(Sender: TObject);
begin

   umdtIniRetorno.Enabled := ckbDataRetorno.Checked;
   umdtFimRetorno.Enabled := ckbDataRetorno.Checked;

end;

procedure TfPessoasInformacoes.btnCodigoTurmaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroTurma;
begin
  { Pesquisar Turmas }
  if anoSemestreFiltrado = 0 then
  begin
    anoSemestreFiltrado:= DM.GetAnoSemestreAtual;
  end;

  resultado_filtro := TfrmSelecionarTurma.Filtrar([], anoSemestreFiltrado,-1,-1,codCursoFiltrado);

   if not resultado_filtro.filtrado then Exit;
   ed_Turma.Text := resultado_filtro.cd_turma;

end;

procedure TfPessoasInformacoes.btnEncaminharContatoClick(Sender: TObject);
var
   cd_pessoa: Integer;
   nm_pessoa: String;
begin
   resultadoConsultor := TfrmSelecionarConsultores.Filtrar([]);

   if resultadoConsultor.filtrado then
   Begin
      cd_pessoa := resultadoConsultor.cd_pessoa;
      nm_pessoa := resultadoConsultor.nm_pessoa;

      if cd_pessoa <> -1 then
      begin
         qryPessoasInfoFiltrar.Edit;
         qryPessoasInfoFiltrarcd_consultor.AsInteger := cd_pessoa;
         qryPessoasInfoFiltrar.Post;

         DM.setLog(
            1035,
            'Alteracao',
            'EncaminhadoConsultorContato',
            0,
            'Encaminhado o consultor ' + nm_pessoa + ' para o contato de código: ' + qryPessoasInfoFiltrarcd_informacao.AsString
         );
      end;
   End;
end;

procedure TfPessoasInformacoes.btnGerarCadastroPessoaClick(Sender: TObject);
begin
   Application.CreateForm(TuFGerarPessoaContatos, uFGerarPessoaContatos);

   uFGerarPessoaContatos.Position := poScreenCenter;
   uFGerarPessoaContatos.cd_informacao := qryPessoasInfoFiltrar.FieldByName('cd_informacao').asInteger;
   uFGerarPessoaContatos.Showmodal;
end;

procedure TfPessoasInformacoes.btnObservacoesClick(Sender: TObject);
begin

   if not qryPessoasInfoFiltrar.IsEmpty then
   begin
      Application.CreateForm(TuObservacoesContatos, uObservacoesContatos);
      uObservacoesContatos.cd_informacao := qryPessoasInfoFiltrarcd_informacao.asInteger;
      uObservacoesContatos.nm_pessoa_contato := qryPessoasInfoFiltrarnm_pessoa.asString;
      uObservacoesContatos.ShowModal;
   end
   else
   begin
      Mensagem('Você deve selecionar um registro antes de inserir uma observação!', 'Aviso');
   end;

   Filtrar();
end;

procedure TfPessoasInformacoes.btnOlhoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(DBGrid1, 'planilha_pessoas_contatos');
end;

procedure TfPessoasInformacoes.btOutrosFiltrosClick(Sender: TObject);
begin
   pmOutrosFiltros.Items.Count;
   pmOutrosFiltros.Popup(btOutrosFiltros.Left, btOutrosFiltros.Top + btOutrosFiltros.Height + 140);
end;

procedure TfPessoasInformacoes.Button1Click(Sender: TObject);
begin
   gravarFiltros();
   Filtrar();
end;

procedure TfPessoasInformacoes.btEnviarEmailClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   PosX := btEnviarEmail.Left + PrincipalForm.Left + 10;
   PosY := toolPessoa.Top + 45;

   pmEnvioEmails.Popup(PosX, PosY);
end;

procedure TfPessoasInformacoes.btnImportarExportarExcelClick(Sender: TObject);
Var
   PosX, PosY : Integer;
begin
   PosX := btnImportarExportarExcel.Left + PrincipalForm.Left + 10;
   PosY := toolPessoa.Top + 35;

   pmImportarExportarExcel.Popup(PosX, PosY);
end;


procedure TfPessoasInformacoes.ckbTurmaClick(Sender: TObject);
begin
   ed_Turma.Enabled := True;
   btnCodigoTurma.Enabled := True;   
end;

procedure TfPessoasInformacoes.contatosFiltra(Sender: TObject);
var
   qtdTotalItens, contNaoMarcados, contMarcados, i:integer;
   strCaptionMenu: String;
begin

   // Selecionar Todas
   if TMenuItem(Sender).Tag = -1 then
   begin

      btContatosFiltros.Caption := 'Todos os contatos';
      btContatosFiltros.Hint := '';
      
      For i:= 3 to pmContatos.Items.Count - 1 do
      begin
         pmContatos.Items[i].Checked := True;
      end;
   end // Desmarcar todas
   else if TMenuItem(Sender).Tag = -2 then
   begin

      btContatosFiltros.Caption := 'Filtrar contatos';
      btContatosFiltros.Hint := '';

      For i:= 3 to pmContatos.Items.Count - 1 do
      begin
         pmContatos.Items[i].Checked := False;
      end;
   end
   else  //Selecionou alguma opção de filtro por campo especifico
   begin
      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;

      contMarcados := 0;
      For i:= 3 to pmContatos.Items.Count - 1 do
      begin
         if pmContatos.Items[i].Checked = False then
         begin
            contNaoMarcados := contNaoMarcados + 1;
         end;

         if pmContatos.Items[i].Checked = True then
         begin
            contMarcados := contMarcados + 1;
         end;
      end;

      i:=i-3;
      
      if contNaoMarcados = i then
      begin
         btContatosFiltros.Caption := 'Filtrar contatos';
      end;

      if contMarcados > 0 then
      begin
         btContatosFiltros.Hint := '';
         btContatosFiltros.Caption := '';

         if contMarcados = i then
         begin
            btContatosFiltros.Caption := 'Todos os contatos';
         end;

         qtdTotalItens := i;
         btContatosFiltros.Caption := '';
         For i:= 3 to pmContatos.Items.Count - 1 do
         begin
            if contMarcados > 1 then
            begin
               if pmContatos.Items[i].Checked then
               begin
                  if btContatosFiltros.Caption = '' then
                  begin
                     btContatosFiltros.Caption := pmContatos.Items[i].Caption;
                     btContatosFiltros.Hint := pmContatos.Items[i].Caption;
                     if length(btContatosFiltros.Caption) > 15 then
                     begin
                        btContatosFiltros.Caption := btContatosFiltros.Caption + ', ...';
                     end;
                  end
                  else
                  begin
                     if Length(btContatosFiltros.Caption) > 15 then
                     begin
                        btContatosFiltros.Hint := btContatosFiltros.Hint + ', ' + pmContatos.Items[i].Caption;
                     end
                     else
                     begin
                        btContatosFiltros.Caption := btContatosFiltros.Caption + ', ' + pmContatos.Items[i].Caption;

                        if Length(btContatosFiltros.Caption) > 15 then
                        begin
                           btContatosFiltros.Caption := btContatosFiltros.Caption + ', ...';
                        end;

                        btContatosFiltros.Hint := btContatosFiltros.Hint + ', ' + pmContatos.Items[i].Caption;
                     end;
                  end;
               end;
            end;
            
            if ((contMarcados = 1) and (pmContatos.Items[i].Checked = true)) then
            begin
               btContatosFiltros.Caption := pmContatos.Items[i].Caption;
            end;
            
         end;
         if contMarcados = 0 then
         begin
            btContatosFiltros.Caption := 'Filtrar contatos';
         end;

         if contMarcados = qtdTotalItens then
         begin
            btContatosFiltros.Caption := 'Todos os contatos';
         end;
      end;
      
      btContatosFiltros.ShowHint := True;
      if TMenuItem(Sender).Tag = -1 then
      begin
         TMenuItem(Sender).Checked := False;
      end;
   end;

end;

function TfPessoasInformacoes.CountPos(const subtext: String;
  Text: String): Integer;
begin
   if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0) then
    Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, subtext, '', [rfReplaceAll]))) div
      Length(subtext);
end;

function TfPessoasInformacoes.verificaObservacoes(cd_informacao: Integer): Boolean;
const
  SQL_VERIFICA_OBSERVACOES = 'SELECT * FROM pessoas_info_observacoes WHERE cd_informacao = :cd_informacao';
var
  qryVerificaObservacoes: TUMZQuery;
  temregistro: boolean;
begin
  temregistro:= false;
  DM.CriarConsulta(qryVerificaObservacoes);
  qryVerificaObservacoes.SQL.Text:= SQL_VERIFICA_OBSERVACOES;
  qryVerificaObservacoes.ParamByName('cd_informacao').AsInteger:= cd_informacao;
  qryVerificaObservacoes.Open;

  if qryVerificaObservacoes.RecordCount > 0 then
  begin
    temregistro:= true;
  end;
  result := temregistro; 

end;
end.

