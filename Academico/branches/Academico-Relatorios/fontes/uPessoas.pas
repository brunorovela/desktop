unit uPessoas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, Db, ZConnection, Mask,
  DBCtrls, jpeg, DBCGrids, Grids, DBGrids, Buttons, ExtDlgs, Menus, DBTables,
  uFrameParentes, DelphiTwain, CropImage, uRegExpr, ZAbstractTable, ZDataset,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, Clipbrd, DSUtils,
  uPessoasDriverCamera, DSPack, DirectShow9, uFSelecionarPessoa, UMComboBox,
  RegExpr, ZSqlUpdate, VirtualTrees, uEditorContatosPessoa, UMAjuda, uMensagem,
  uFSplash, uDM, UZDbcFuncs, ZDbcIntfs;

type
   TProcedureOnChange = procedure (Sender: TObject) of Object;

  Tfrm_Pessoas = class(TForm)
    Panel3: TPanel;
    toolPessoa: TToolBar;
    btIncluir_Pessoa: TToolButton;
    btAlterar_Pessoa: TToolButton;
    btExcluir_Pessoa: TToolButton;
    ToolButton4: TToolButton;
    btSalvar_Pessoa: TToolButton;
    btCancelar_Pessoa: TToolButton;
    btBuscar_Pessoa: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    btFechar_Pessoa: TToolButton;
    ImageList1: TImageList;
    pgPessoa: TPageControl;
    tsDadosPessoais: TTabSheet;
    tblPessoa: TUMZQuery;
    tblPessoacd_pessoa: TIntegerField;
    tblPessoacd_resp_finan: TIntegerField;
    tblPessoacd_resp_acad: TIntegerField;
    tblPessoanm_pessoa: TStringField;
    tblPessoads_cidade_nascimento: TStringField;
    tblPessoads_complemento: TStringField;
    tblPessoads_cep: TStringField;
    tblPessoads_bairro: TStringField;
    tblPessoads_cidade: TStringField;
    tblPessoads_sexo: TStringField;
    tblPessoads_nacionalidade: TStringField;
    tblPessoads_identidade: TStringField;
    tblPessoads_cpf: TStringField;
    tblPessoads_titulo_numero: TStringField;
    tblPessoads_titulo_secao: TStringField;
    tblPessoads_titulo_zona: TStringField;
    tblPessoanm_pai: TStringField;
    tblPessoanm_mae: TStringField;
    tblPessoanm_conjuge: TStringField;
    tblPessoacd_usuario: TIntegerField;
    tblPessoanm_sem_acento: TStringField;
    tblPessoads_arquivo_documento: TStringField;
    tblPessoads_observacao: TBlobField;
    lbNomeSocial: TLabel;
    dbNome: TDBEdit;
    dsPessoa: TDataSource;
    Label2: TLabel;
    dbNasc: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    dbSexo: TDBComboBox;
    Panel1: TPanel;
    imageFoto: TImage;
    Label6: TLabel;
    Label7: TLabel;
    dbCep: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbEndereco: TDBEdit;
    Label10: TLabel;
    dbComplemento: TDBEdit;
    Label11: TLabel;
    dbBairro: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    pcDocumentos: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    dbCpf: TDBEdit;
    Label15: TLabel;
    dbIdentidade: TDBEdit;
    Label16: TLabel;
    dbOrgaoIdent: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    dbNroTitulo: TDBEdit;
    Label21: TLabel;
    dbEmissao: TDBEdit;
    tblPessoads_pais: TStringField;
    DBText1: TDBText;
    DBText2: TDBText;
    tsComplementares: TTabSheet;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    tblPessoacd_empresa: TIntegerField;
    tblPessoads_cargo: TStringField;
    tblPessoadescEmpresa: TStringField;
    tblPessoads_pais_nascimento: TStringField;
    tblPessoads_logradouro: TStringField;
    tblPessoads_logradouro_nro: TStringField;
    Label38: TLabel;
    DBEdit2: TDBEdit;
    Label41: TLabel;
    tblPessoadescEstadoNasc: TStringField;
    Label42: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    tblPessoadescEstado: TStringField;
    Label4: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    tblPessoads_identidade_orgao_exp: TStringField;
    tblPessoads_rm_corporacao: TStringField;
    tblPessoads_rm_org_numero: TStringField;
    tblPessoads_rm_doc_numero: TStringField;
    tblPessoads_rm_orgao: TStringField;
    tblPessoads_rm_doc_tipo: TStringField;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    dbSecao: TDBEdit;
    Label19: TLabel;
    dbZona: TDBEdit;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBRMNUMERO: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBDOCNUME: TDBEdit;
    DBRMCORP: TDBComboBox;
    DBRMORGAO: TDBComboBox;
    DBDOCTIPO: TDBComboBox;
    tblPessoadt_nascimento: TDateTimeField;
    tblPessoadt_rm_exp: TDateTimeField;
    tblPessoadt_identidade_expedicao: TDateTimeField;
    tblPessoadt_revisao: TDateTimeField;
    tblPessoadt_cadastro: TDateTimeField;
    tblPessoacd_estado_civil: TSmallintField;
    tblPessoads_senha: TStringField;
    tblPessoasn_senha_provisoria: TStringField;
    tblEstadosCivis: TZTable;
    tblEstadosCiviscd_estado_civil: TSmallintField;
    tblEstadosCivisds_estado_civil: TStringField;
    tblPessoadescEstadoCivil: TStringField;
    DBLookupComboBox4: TDBLookupComboBox;
    tblPessoadt_titulo_emissao: TDateTimeField;
    AbrirFoto: TSavePictureDialog;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    tblPessoasn_bloqueto_empresa: TStringField;
    sbMaisInformacoes: TSpeedButton;
    tblPessoaim_pessoa: TBlobField;
    sbCep: TSpeedButton;
    tblPessoads_login: TStringField;
    tsCertidao: TTabSheet;
    tblPessoatp_cert: TSmallintField;
    tblPessoads_cert_livro: TStringField;
    tblPessoadt_cert: TDateTimeField;
    tblPessoads_cert_uf: TStringField;
    tblPessoads_cert_orgao: TStringField;
    lbTipoCertidao: TLabel;
    lbEmissaoCertidao: TLabel;
    dbEmissaoCertidao: TDBEdit;
    lbUFCertidao: TLabel;
    dbUFCertidao: TDBEdit;
    lbOrgamCertidao: TLabel;
    dbOrgaoCertidao: TDBEdit;
    dbTipoCertidao: TDBComboBox;
    dbTipoLogradouro: TDBLookupComboBox;
    lbTipoLogradouro: TLabel;
    tblTpLogradouro: TUMZQuery;
    tblTpLogradourocd_logradouro: TIntegerField;
    tblTpLogradourods_logradouro: TStringField;
    tblPessoadesLogradouro: TStringField;
    tblMunicipios: TUMZQuery;
    dbCidadeNascimento: TDBLookupComboBox;
    tblMunicipiosds_municipio: TStringField;
    tblPessoadescMunicipio: TStringField;
    sbPaisCombo: TDBLookupComboBox;
    tblPessoadescPaisNasc: TStringField;
    dbCidadeAtual: TDBLookupComboBox;
    tblMunicipioAtual: TUMZQuery;
    tblPessoadescMunicipioAtual: TStringField;
    tblPessoadescOrgao: TStringField;
    tblPaises: TZTable;
    tblOrgaos: TUMZQuery;
    tsParentes: TTabSheet;
    frParentes1: TfrParentes;
    tblMunicipioAtualds_municipio: TStringField;
    ciFoto: TCropImage;
    pnFotoBtn: TPanel;
    tblContatosPadroes: TUMZQuery;
    tblPessoacd_raca: TSmallintField;
    tblPessoanr_cert_termo: TStringField;
    tblPessoads_cert_folha: TStringField;
    tblPessoasn_foto: TStringField;
    dbcUtilizaImagem: TDBCheckBox;
    tblPessoanr_dia_vencimento: TLargeintField;
    tblPessoacd_pessoa_alteracao: TLargeintField;
    tblPessoacd_municipio_nasc: TLargeintField;
    tblPessoanr_praca: TLargeintField;
    tblMunicipioscd_municipio: TLargeintField;
    tblMunicipioAtualcd_municipio: TLargeintField;
    tblMunicipioAtualnr_praca: TLargeintField;
    tblPessoads_estado_nascimento: TStringField;
    tblPessoads_estado: TStringField;
    tblPessoacd_orgao_emissor: TLargeintField;
    tblPessoacd_municipio: TLargeintField;
    tblPessoacd_pais: TLargeintField;
    tblPessoacd_logradouro: TLargeintField;
    qryPessoaUpdatePraca: TUMZQuery;
    qryPessoaUpdateMunicipio: TUMZQuery;
    qryPessoaUpdateMunNasc: TUMZQuery;
    tblPessoasn_bloqueado: TSmallintField;
    btn_ImprimirAcade: TToolButton;
    btnObservacoes: TToolButton;
    ToolBar1: TToolBar;
    btnConectar: TToolButton;
    btnCapturar: TToolButton;
    btnAplicar: TToolButton;
    btnCancelar: TToolButton;
    imgListFoto: TImageList;
    imgWebCam: TVideoWindow;
    pmFoto: TPopupMenu;
    miExcluir: TMenuItem;
    DBCheckBox10: TDBCheckBox;
    tblPessoasn_naturalizado: TSmallintField;
    dsObsGerais: TDataSource;
    qryObsGerais: TUMZQuery;
    qryObsGeraiscd_pessoa: TIntegerField;
    qryObsGeraisds_observacao: TMemoField;
    btnDigitalizar: TToolButton;
    DelphiTwain1: TDelphiTwain;
    tblPessoacd_mae: TLargeintField;
    tblPessoacd_pai: TLargeintField;
    tblPessoanm_contato: TStringField;
    tblPessoacd_pais_nascimento: TLargeintField;
    tblPessoasn_nao_bloquear_financeiro: TSmallintField;
    tblPessoads_estado_civil: TStringField;
    tblPessoads_senha_md4: TStringField;
    tblPessoasn_foto_publica: TStringField;
    tblPessoasn_pai: TStringField;
    tblPessoasn_mae: TStringField;
    tblPessoatp_pessoa: TStringField;
    tblPessoads_cnpj: TStringField;
    tblPessoads_inscri_estadual: TStringField;
    tblPessoacd_estado_nascimento: TSmallintField;
    tblPessoacd_estado: TLargeintField;
    tblPessoacd_convenio: TLargeintField;
    tblPessoasn_pai_resp: TSmallintField;
    tblPessoasn_mae_resp: TSmallintField;
    tblPessoacd_cert_uf: TSmallintField;
    tblPessoacd_localidade: TIntegerField;
    tblPessoacd_localidade_nasc: TIntegerField;
    tblPessoasn_pais_como_resp: TSmallintField;
    tblPessoasn_obito: TSmallintField;
    tblPessoasn_requerimentos_email: TStringField;
    tblPessoacd_instituicao_ensino: TSmallintField;
    tblPessoacd_mec: TStringField;
    tblPessoads_inscri_municipal: TStringField;
    tblPessoacd_bairro: TIntegerField;
    tblPessoacd_usuario_pessoa: TLargeintField;
    tblPessoasn_bloq_cartas: TSmallintField;
    tblPessoasn_bloq_emails: TSmallintField;
    tblPessoadescPais: TStringField;
    dbPais: TDBLookupComboBox;
    qyPais: TUMZQuery;
    qyPaisds_nacionalidade: TStringField;
    tblPessoadescNacionalidades: TStringField;
    dbNacionalidade: TUMComboBox;
    qryNacionalidade: TUMZQuery;
    dbMatricula: TDBEdit;
    lbMatricula: TLabel;
    tblPessoads_matricula: TStringField;
    pnContato: TPanel;
    dbLivro: TDBEdit;
    lbLivro: TLabel;
    dbFolha: TDBEdit;
    lbFolha: TLabel;
    dbNumeroTErmo: TDBEdit;
    lbNumeroTermo: TLabel;
    Label36: TLabel;
    dbMae: TDBEdit;
    Label35: TLabel;
    dbPai: TDBEdit;
    Label37: TLabel;
    dbConjuge: TDBEdit;
    lblMensagemHierarquia: TLabel;
    qyVinculosExterno: TUMZQuery;
    dsVinculoExterno: TDataSource;
    qyVinculosExternocd_sistema: TSmallintField;
    qyVinculosExternods_sistema: TStringField;
    qyVinculosExternocd_pessoa: TLargeintField;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    SpeedButton1: TSpeedButton;
    Label74: TLabel;
    Bevel2: TBevel;
    Label33: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    lbVencimento: TLabel;
    Bevel3: TBevel;
    Label207: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    lbDTCadastro: TLabel;
    lbDTAlteracao: TLabel;
    lbUsuario: TLabel;
    sbDesvinculaEmpresa: TSpeedButton;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit13: TDBEdit;
    edLogin: TEdit;
    edSenha1: TEdit;
    edSenha2: TEdit;
    dbDiaVencimento: TDBEdit;
    Button1: TButton;
    btnLiberarAcesso: TButton;
    btnBloquearOnline: TButton;
    Panel4: TPanel;
    btnAlteraObs: TBitBtn;
    btnSalvarObs: TBitBtn;
    btnCancelarObs: TBitBtn;
    dbObs: TDBMemo;
    lbVinculoExterno: TPanel;
    tblPessoasn_pode_retirar_material: TSmallintField;
    cbRetiraMaterial: TDBCheckBox;
    pnVinculosExterno: TPanel;
    pnAcoesVinculoExterno: TPanel;
    grVinculosExterno: TDBGrid;
    btnRemoverVinculoExterno: TSpeedButton;
    btnAdicionarVinculoExterno: TSpeedButton;
    btnAlterarVinculoExterno: TSpeedButton;
    dbPassaporte: TDBEdit;
    lblPassaporte: TLabel;
    tblPessoadt_identidade_expiracao: TDateTimeField;
    tblPessoads_passaporte: TStringField;
    VSTContatos: TVirtualStringTree;
    lbNomeOficial: TLabel;
    lbNomeSocialInfo: TLabel;
    lbNomeOficialInfo: TLabel;
    tblPessoanm_pessoa_oficial: TStringField;
    dbNomeOficial: TDBEdit;
    cbNomeOficial: TDBCheckBox;
    tblPessoasn_nome_social: TSmallintField;
    umAjuda: TUMAjuda;
    cbFormaConhece: TComboBox;
    edFormaConheceuOutro: TEdit;
    lbFormaConheceuInst: TLabel;
    lbInformeFicouSabendo: TLabel;
    tblPessoads_forma_conheceu: TStringField;
    qyVinculosExternocd_pessoa_externa: TStringField;
    DBEdit52: TDBEdit;
    Label229: TLabel;
    DBEdit53: TDBEdit;
    Label230: TLabel;
    tblPessoads_local_trabalho: TStringField;
    tblPessoads_profissao: TStringField;
    procedure tblPessoaAfterEdit(DataSet: TDataSet);
    procedure edLoginExit(Sender: TObject);
    procedure sbPaisComboClick(Sender: TObject);
    procedure cbFormaConheceChange(Sender: TObject);
    procedure dbNomeOficialExit(Sender: TObject);
    procedure cbNomeOficialClick(Sender: TObject);
    procedure lbVinculoExternoClick(Sender: TObject);
    procedure qyVinculosExternoAfterOpen(DataSet: TDataSet);
    procedure btnAlterarVinculoExternoClick(Sender: TObject);
    procedure dsVinculoExternoDataChange(Sender: TObject; Field: TField);
    procedure btnRemoverVinculoExternoClick(Sender: TObject);
    procedure btnAdicionarVinculoExternoClick(Sender: TObject);
    procedure grVinculosExternoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbMatriculaExit(Sender: TObject);
    procedure dbTipoCertidaoChange(Sender: TObject);
    procedure pcDocumentosChange(Sender: TObject);
    procedure DBLookupComboBox2CloseUp(Sender: TObject);
    procedure dbNacionalidadeKeyPress(Sender: TObject; var Key: Char);
    procedure sbPaisComboExit(Sender: TObject);
    procedure dbNacionalidadeExit(Sender: TObject);
    procedure dbNacionalidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNacionalidadeChange(Sender: TObject);
    procedure DelphiTwain1TwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure DelphiTwain1AcquireCancel(Sender: TObject; const Index: Integer);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure dsObsGeraisStateChange(Sender: TObject);
    procedure btnCancelarObsClick(Sender: TObject);
    procedure btnSalvarObsClick(Sender: TObject);
    procedure btnAlteraObsClick(Sender: TObject);
    procedure sbPaisComboCloseUp(Sender: TObject);
    procedure sbPaisAtualComboCloseUp(Sender: TObject);
    procedure miExcluirClick(Sender: TObject);
    procedure btnCapturarClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbDesvinculaEmpresaClick(Sender: TObject);
    procedure btnLiberarAcessoClick(Sender: TObject);
    procedure btnBloquearOnlineClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure dbDiaVencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure tblPessoaAfterOpen(DataSet: TDataSet);
    procedure frParentes1btExcluir_PessoaClick(Sender: TObject);
    procedure frParentes1btAlterar_PessoaClick(Sender: TObject);
    procedure frParentes1btIncluir_PessoaClick(Sender: TObject);
    procedure tblPessoacd_paisChange(Sender: TField);
    procedure sbCancelarClick(Sender: TObject);
    procedure DelphiTwain1AcquireError(Sender: TObject; const Index: Integer;
      ErrorCode, Additional: Integer);
    procedure DBText2DblClick(Sender: TObject);
    procedure tblPessoaBeforeDelete(DataSet: TDataSet);
    procedure tblPessoaAfterCancel(DataSet: TDataSet);
    procedure pgPessoaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgPessoaChange(Sender: TObject);
    procedure tblPessoads_estadoChange(Sender: TField);
    procedure tblPessoads_estado_nascimentoChange(Sender: TField);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblPessoatp_certSetText(Sender: TField; const Text: string);
    procedure tblPessoatp_certGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edSenha2KeyPress(Sender: TObject; var Key: Char);
    procedure edSenha1KeyPress(Sender: TObject; var Key: Char);
    procedure edLoginKeyPress(Sender: TObject; var Key: Char);
    procedure dbComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure tblPessoads_sexoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblPessoads_sexoSetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure btFechar_PessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure dsPessoaStateChange(Sender: TObject);
    procedure tblPessoaAfterInsert(DataSet: TDataSet);
    procedure tblPessoaNewRecord(DataSet: TDataSet);
    procedure tblPessoaBeforePost(DataSet: TDataSet);
    procedure btIncluir_PessoaClick(Sender: TObject);
    procedure btAlterar_PessoaClick(Sender: TObject);
    procedure btExcluir_PessoaClick(Sender: TObject);
    procedure btSalvar_PessoaClick(Sender: TObject);
    procedure btCancelar_PessoaClick(Sender: TObject);
    procedure btBuscar_PessoaClick(Sender: TObject);
    procedure tblPessoaAfterPost(DataSet: TDataSet);
    procedure dbNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imageFotoDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure sbCepClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure VerificaBibliotecaTwain();
    procedure CreateParams(var Params: TCreateParams); override;
    function PodeAlterarSenha() : Boolean;
    function GruposHierarquia(const cd_pessoa: Integer) : Boolean;

  private
    { Private declarations }
      FAlterandoFoto: Boolean;
    nacionalidadeAtual : Integer;
    qyTemp1, qyTemp2 : TUMZQuery;
    nm_Pessoa,
    nm_pessoa_oficial,
      dt_Nascimento,
      pais_Nasc,
      estado_Nasc,
      cidade_Nasc,
      ds_cpf,
      ds_rg,
      nm_pai,
      nm_mae,
      ds_cep,
      descPais,
      descEstado,
      descMunicipio,
      descMunicipioAtual,
      ds_bairro,
      descLogradouro,
      ds_logradouro,
      ds_logradouro_nro,
      ds_complemento,
      ds_fone: String;

    parametro_ficha_saude_completa: Boolean;

    hasPermObsGerais : Boolean;
    permIncluir, permAlterar, permEspecial : Boolean;
    procedure alterarCodPessoaTabelasExcessao(slTabelasExcessao, slCamposAlteracao: TStringList; sNovoCodigo: String);
    
    procedure organizaCamposNomePessoa;

    function Tem_matricula(codigo : integer) : boolean;
    function verificaCpfPassaporte: boolean;

    procedure carregaEndereco(const pais : String; estado: Boolean);
    //procedure setLogAlteracoesCadastro;
    procedure gravalog(bAlterouLogin : boolean);
    procedure gravaLogDelete;
    procedure carregaVariaveisLogAlteracoes;
    procedure carregarEstadosPais;

  protected
    FBSenhaValidada: boolean;
    Origem: smallint;
    Imagem: TJPEGImage;

    { Filtro pessoa }
    AbaSelecionada: AbasFiltroPessoa;
    resultado_filtro : TResultadoFiltroPessoa;

    { codigo de permissao }
    iPermissao : Integer;
    parametro_alterar_contatos: String;

    VSTContatosEditor: TEditorContatosPessoa;

    function alteraLogin(edLogin, edSenha, edRedgSenha: TEdit; sLoginAntigo: string; qyPaiResp: TUMZQuery) : boolean;

    procedure CarregarPaises();
    procedure CarregarComboNacionalidades(Sender: TUMComboBox; procedimentoOnChange: TProcedureOnChange);
    procedure FiltrarNacionalidade(const ds_nacionalidade: String; Combo: TUMComboBox);
    procedure verificar_contatos_padroes(CodAluno: Integer);

    function PodeAlterarContatos(const cd_pessoa: Integer; cd_permissao_tela: Integer = 0): Boolean;
  public
   jaGerouLog: Boolean;
   filtro_cd_pessoa: Integer;
   bMenorIdade : Boolean ;
   msgLogLoginSenha : String;
   procedure ResizeFoto(var oJPG: TJPEGImage; iMaxWidth,iMaxHeigth: Integer);
   function avisoAlteracaoCadastro():boolean;
   procedure preencheComboSituacoes;
   procedure atualizaCamposExtrasCodigo(cd_pessoa_antigo: Integer; novo_cd_pessoa: Integer);
   procedure removeCamposExtrasCodigo(cd_pessoa_removido: Integer);
   procedure atualizaSenhaInsercao();

    { Public declarations }
  end;

var
  frm_Pessoas: Tfrm_Pessoas;
  loginAntigo: string;
  //guarda os logins antigos dos responsáveis do aluno
  loginPaiAntigo :string;
  loginMaeAntigo: string;
  loginRespAcadAntigo: string;
  loginRespFinanAntigo: string;
  nomePessoa, cpfPessoa: string;
  bExcluido : Boolean;
  bComImagem : Boolean;
  validacaoCampo: Boolean;
  validaTelefone_residencial: Boolean;
  validaTelefone_comercial: Boolean;
  validaCelular: Boolean;
  validaEmail: Boolean;

implementation

uses
   General, Main, uUsuario, Math, uCadEmpresas, MaskUtils, Variants,
   uPessoas_adicional, uSelCep, uCadDeficiencias, uFFichaSaudeCompleta,
   UFObservacoes, ClassPessoas, uPessoa, uChecarUsoColigada, uItemCombo,
   uGeneral, uContatoPessoa, uContatoTipo, uAluno,uProfessor;

{$R *.DFM}

procedure Tfrm_Pessoas.tblPessoads_sexoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
{ Apresentar como Masculino e Feminino }
begin

   if Sender.AsString = 'M'
   Then Text := 'Masculino'
   else

      if Sender.AsString = 'F'
	 Then Text := 'Feminino'
	 else Text := '';

end; { tblPessoads_sexoGetText }

procedure Tfrm_Pessoas.tblPessoads_sexoSetText(Sender: TField;
  const Text: String);
{ Gravar como M e F }
begin

   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else

      if Text = 'Feminino'
      Then Sender.AsString := 'F';

end; { tblPessoads_sexoSetText } 

procedure Tfrm_Pessoas.FormShow(Sender: TObject);
var
   qryContatosObrigatorios: TUMZQuery;
begin

   Application.HintPause := 10;

  { Todas em maiúsculas }

  DM.TodasMaiusculas(TForm(Sender));

  edLogin.CharCase := ecNormal;
  edSenha1.CharCase := ecNormal;
  edSenha2.CharCase := ecNormal;
  pgPessoa.ActivePageIndex := 0;
  { Atualização das Tabelas }

  { Acrescentar Contatos no Combo }
  Dm.tblContatosTipos.Close;
  DM.tblContatosTipos.Open;

  DM.tblEstados.Close;
  DM.tblEstados.Open;

  DM.tblEstados2.Close;
  DM.tblEstados2.Open;

  tblEstadosCivis.Close;
  tblEstadosCivis.Open;

  tblTpLogradouro.Close();
  tblTpLogradouro.Open();

  CarregarPaises();

  tblOrgaos.Close();
  tblOrgaos.Open();

  parametro_ficha_saude_completa := ( DM.variavel_parametro('ficha_saude_completa') = 'S' );
  parametro_alterar_contatos := ( DM.variavel_parametro('pessoas_contatos_alterar_sempre') );

  if ( parametro_ficha_saude_completa ) then
  begin
     Button1.Caption := 'Ficha de Saúde';
  end;

  if DM.variavel_parametro('pessoa_buscar_ultimo') = 'S' Then
  Begin
     { Selecionar as pessoas alteradas nos últimos 2 dias }
     tblPessoa.Close;
     tblPessoa.SQL.Text := 'Select * from pessoas where dt_revisao = :data';
     tblPessoa.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);

     tblPessoa.Open;
  End;

  AbaSelecionada := afpPessoa;
  frParentes1.Buscar.Visible := False;

  { inicia permissao como sendo form cadastro }
  iPermissao := 1001;
  {permissão para bolquear o aluno}

  hasPermObsGerais := DM.UsuarioLogado.TemPermissao( 0, 'Academico.PessoasCadastroObservacoes', npAcesso, False );
  permIncluir := DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, False );
  permAlterar := DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, False );
  permEspecial := DM.UsuarioLogado.TemPermissao( iPermissao, npEspecial, False );

  if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
  begin
     dbObs.DataSource := dsObsGerais;
  end;

  if DM.lite then
  begin
    sbMaisInformacoes.Visible := false;
  end;

  if (pcDocumentos.ActivePageIndex in [0,2,3]) then
  begin
      pcDocumentos.Height := 133;
      pnContato.Top := pcDocumentos.Top + 133;
  end;

  cbNomeOficial.Caption := 'Habilitar nome social da pessoa';

  if(dm.variavel_nu_parametro('ControleAcesso.pessoa_nome_social',0) = 'N') then
  begin
    cbNomeOficial.Visible := false;
  end;

  preencheComboSituacoes;

  dm.CriarConsulta(qryContatosObrigatorios);

  qryContatosObrigatorios.SQL.Text := ''+
      'SELECT                          '+
	   '  ds_chave,                     '+
	   '  sn_obrigatorio,               '+
      '  nr_ordem                      '+
      'FROM                            '+
	   '  nu_cadastro_obrigatorio_campo '+
      'WHERE                           '+
	   '  cd_cadastro = (               '+
		'     SELECT                     '+
      '        cd_cadastro             '+
		'     FROM                       '+
      '        nu_cadastro_obrigatorio '+
		'     WHERE                               '+
      '        ds_chave = "frm_Pessoas.Contatos" limit 1 '+
	   '  ) '+
      'ORDER BY nr_ordem';

  qryContatosObrigatorios.Open;
  qryContatosObrigatorios.First;

  while not qryContatosObrigatorios.Eof do
  begin

      case qryContatosObrigatorios.FieldByName('nr_ordem').AsInteger of
         1:
         BEGIN

            if qryContatosObrigatorios.FieldByName('sn_obrigatorio').asInteger = 1 then
            begin
               validaTelefone_residencial := True;
            end
            else
            begin
               validaTelefone_residencial := False;
            end;

         end;
         2:
         BEGIN

            if qryContatosObrigatorios.FieldByName('sn_obrigatorio').asInteger = 1 then
            begin
               validaTelefone_comercial := True;
            end
            else
            begin
               validaTelefone_comercial := False;
            end;

         end;
         3:
         BEGIN

            if qryContatosObrigatorios.FieldByName('sn_obrigatorio').asInteger = 1 then
            begin
               validaCelular := True;
            end
            else
            begin
               validaCelular := False;
            end;

         end;
         4:
         BEGIN

            if qryContatosObrigatorios.FieldByName('sn_obrigatorio').asInteger = 1 then
            begin
               validaEmail := True;
            end
            else
            begin
               validaEmail := False;
            end;

         end;
      end;
      
      qryContatosObrigatorios.Next;

  end;

end;


procedure Tfrm_Pessoas.frParentes1btExcluir_PessoaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
   frParentes1.btExcluir_PessoaClick(Sender);

end;

procedure Tfrm_Pessoas.frParentes1btIncluir_PessoaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;

   frParentes1.btIncluir_PessoaClick(Sender);

end;

procedure Tfrm_Pessoas.frParentes1btAlterar_PessoaClick(Sender: TObject);
begin

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;

   frParentes1.btAlterar_PessoaClick(Sender);
end;

{ FormShow }

procedure Tfrm_Pessoas.btFechar_PessoaClick(Sender: TObject);
{ Fechar o Cadastro de Pessoas }
begin
   close();
end; { btFechar_PessoaClick }


procedure Tfrm_Pessoas.FiltrarNacionalidade(const ds_nacionalidade: String; Combo: TUMComboBox);
var
   I : Integer;
begin
   Combo.ItemIndex := -1;

   if ds_nacionalidade = '' then
      Exit;

   for I := 0 to Combo.Items.Count - 1 do
   begin
      if ( Combo.Items[I] = ds_nacionalidade ) then
      begin
         Combo.ItemIndex := I;
         break;
      end;
   end;

   if Combo.ItemIndex = -1 then
   begin
      Combo.AddItem(ds_nacionalidade, nil);
      Combo.ItemIndex := Combo.Items.Count-1;
   end;
end;

procedure Tfrm_Pessoas.FormClose(Sender: TObject; var Action: TCloseAction);
{ Fechar Cadastro de Pessoa }
begin
   filtro_cd_pessoa := -1;
   Application.HintPause := 500;

   Dm.tblContatosTipos.Close;
   DM.tblEstados.Close;
   tblEstadosCivis.Close;

   tblPessoa.Close;
   Action := caFree;

   DM.tblEstados.SQL.Text := ''+
      ' SELECT * FROM estados '+
      ' ORDER BY ds_estado ';

   DM.tblEstados2.SQL.Text := ''+
      ' SELECT * FROM estados '+
      ' ORDER BY ds_estado ';
end; { FormClose }


procedure Tfrm_Pessoas.dsObsGeraisStateChange(Sender: TObject);
begin
   if qryObsGerais.State in [dsEdit] then
   begin
      btnAlteraObs.Enabled := False;

      btnSalvarObs.Enabled := True;
      btnCancelarObs.Enabled := True;
   end;

   if qryObsGerais.State in [dsBrowse] then
   begin
      btnSalvarObs.Enabled := False;
      btnCancelarObs.Enabled := False;

      btnAlteraObs.Enabled := True;
   end;
end;

procedure Tfrm_Pessoas.dsPessoaDataChange(Sender: TObject; Field: TField);
{ Mudança de registro }
var
   Stream: TStream;
   JPEGImg: TJPEGImage;
  qryUsuarios:TUMZQuery;
begin
  // Atualização do login e da senha
  if tblPessoa.State in [dsBrowse] then begin
    edLogin.Text := tblPessoa.FieldByName('ds_login').AsString;
    loginAntigo := edLogin.Text;

    nomePessoa := dbNome.Text;
    cpfPessoa := dbCpf.Text;    

    edSenha1.Text := '*****';
    edSenha2.Text := '*****';
    if(Self.tblPessoadt_cadastro.asString<>'')then
    begin
      Self.lbDTCadastro.Caption := FormatDateTime('dd/mm/yy',Self.tblPessoadt_cadastro.asDateTime);
    end
    else
    begin
      Self.lbDTCadastro.Caption := 'Sem registro';
    end;

    if((Self.tblPessoadt_revisao.asString<>'') AND (tblPessoacd_pessoa_alteracao.asString <> ''))then
    begin
      Self.lbDTAlteracao.Caption := FormatDateTime('dd/mm/yy',Self.tblPessoadt_revisao.asDateTime);
      DM.CriarConsulta(qryUsuarios);
      with  qryUsuarios do
      begin
         if(DM.db.Protocol = DB_PROTOCOL_MYSQL) then
         begin
            SQL.Text := 'SELECT COALESCE(ds_login, cd_pessoa) AS nome FROM pessoas WHERE cd_pessoa=:pUsuario';
         end
         else
         begin
            SQL.Text := 'SELECT COALESCE(ds_login, TO_CHAR(cd_pessoa)) AS nome FROM pessoas WHERE cd_pessoa=:pUsuario'
         end;
         ParamByName('pUsuario').asInteger := Self.tblPessoacd_pessoa_alteracao.AsInteger;
         Open();
         Self.lbUsuario.Caption := FieldByName('nome').asString;
      end;
    end
    else
    begin
      Self.lbDTAlteracao.Caption := 'Sem registro';
      Self.lbUsuario.Caption := 'Sem registro';
    end;


  end;


   imageFoto.Picture.Assign(nil);
   
   // Carrega a foto da pessoa do banco de dados se existir
   // Caso contrário, não exibe o componente de imagem

   if not tblPessoaim_pessoa.IsNull then
   begin

      // Tenta carregar a imagem como um Bitmap
      // formato salvo quando a foto é capturada pela Webcam
      
      Stream := tblPessoa.CreateBlobStream(tblPessoaim_pessoa, bmRead);
      try
         try
            imageFoto.Visible := True;
            imageFoto.Picture.Assign(tblPessoaim_pessoa);
         except
         
            // Se não conseguiu carregar como Bitmap
            // então tenta carregar como JPEG
            
            on E: EInvalidGraphic do
               try
                  JPEGImg := TJPEGImage.Create;
                  try
                     JPEGImg.LoadFromStream(Stream);
                     imageFoto.Picture.Assign(JPEGImg);
                  finally
                     JPEGImg.Free;
                  end;
               except
               
                  // Se não conseguir mesmo assim, então não exibe a foto
                  on E: EInvalidGraphic do
                     imageFoto.Visible := False;
               end;
         end;
      finally
         Stream.Free;
      end;
   end
   else
      imageFoto.Visible := False;

  { Atualização da Foto }

  if dsPessoa.State in [dsInsert, dsEdit] then
   begin
      btnConectar.Visible := True;
      btnDigitalizar.Visible := True;
      btnCapturar.Visible := False;
      btnAplicar.Enabled := False;
      btnAplicar.Visible := True;
      btnCancelar.Enabled := False;
      btnCancelar.Visible := True;
   end
   else
   begin
      btnConectar.Visible := True;
      btnDigitalizar.Visible := True;
      btnCapturar.Visible := False;
      btnAplicar.Enabled := False;
      btnCancelar.Enabled := False;
   end;
   
end;  { dsPessoaDataChange }

procedure Tfrm_Pessoas.grVinculosExternoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (
         (Key = VK_DOWN) AND
         (qyVinculosExterno.RecNo = qyVinculosExterno.RecordCount)
      ) OR (
         (Key = VK_UP) AND
         (qyVinculosExterno.RecNo = 1)
      ) then
   begin
      Key := 0;
   end; 
end;

{ gradeContatoKeyDown }


procedure Tfrm_Pessoas.dsPessoaStateChange(Sender: TObject);
{ Mudança de Estado - Inclusão - Alteração }
Var
   EstaEditando : Boolean;
begin
   if ( tblPessoa.State in [dsEdit] ) AND
      TChecarUsoColigada.Create( TPessoa.Create( tblPessoacd_pessoa.AsInteger ) ).NaoPossuiPermissao(True, permEspecial) then
   begin
      tblPessoa.Cancel;
      Exit;
   end;

   if not FAlterandoFoto then
   begin

      if tblPessoa.State = dsInsert Then
       if not DM.UsuarioLogado.TemPermissao( 1001, npIncluir, True ) then Begin
          tblPessoa.Cancel;
          Exit;
       End;

      if tblPessoa.State = dsEdit Then
       if not DM.UsuarioLogado.TemPermissao( 1001, npAlterar, True ) then Begin
          tblPessoa.Cancel;
          Exit;
       End;

         { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
         EstaEditando := ( tblPessoa.State in [dsEdit, dsInsert] );

         btIncluir_Pessoa.Enabled  := not EstaEditando;
         btAlterar_Pessoa.Enabled  := not EstaEditando;
         btExcluir_Pessoa.Enabled  := not EstaEditando;
         btBuscar_Pessoa.Enabled   := not EstaEditando;
         btFechar_Pessoa.Enabled   := not EstaEditando;

         btSalvar_Pessoa.Enabled   := EstaEditando;
         btCancelar_Pessoa.Enabled := EstaEditando;

         btnCancelar.Enabled := EstaEditando;

      { Verificar contatos para cadastrar }
   end;

end;

procedure Tfrm_Pessoas.dsVinculoExternoDataChange(Sender: TObject;
  Field: TField);
begin
   btnRemoverVinculoExterno.Enabled := qyVinculosExterno.RecNo > 0;
   btnAlterarVinculoExterno.Enabled := btnRemoverVinculoExterno.Enabled;
end;

{ dsPessoaStateChange }

procedure Tfrm_Pessoas.tblPessoaAfterCancel(DataSet: TDataSet);
begin
  carregaEndereco( tblPessoacd_pais_nascimento.AsString, true );

  if ( DM.tblEstados2.Params.Count > 0 )  then
  begin
     DM.tblEstados2.Close;
     DM.tblEstados2.ParamByName('cd_pais_selecionado').AsString := tblPessoacd_pais.AsString;
     DM.tblEstados2.Open;
  end;
   
  tblMunicipioAtual.Close();
  tblMunicipioAtual.ParamByName('uf_atual').AsString := tblPessoads_estado.AsString;
  tblMunicipioAtual.Open();

  FiltrarNacionalidade('', dbNacionalidade);
end;

procedure Tfrm_Pessoas.tblPessoaAfterEdit(DataSet: TDataSet);
begin
   ciFoto.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npAlterar, false );
   imageFoto.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npAlterar, false );
   imgWebCam.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npAlterar, false );
   ToolBar1.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npAlterar, false );
end;

procedure Tfrm_Pessoas.tblPessoaAfterInsert(DataSet: TDataSet);
{ Após inserir uma pessoa }
begin

   { Colocar Valores Padrões - Futuramente, pegar em Tabela de Parametros }
   tblPessoads_nacionalidade.AsString := 'BRASILEIRA';
   tblPessoads_pais.AsString := 'BRASIL';
   tblPessoacd_pais.AsInteger := 10;
   tblPessoads_pais_nascimento.AsString := 'BRASIL';

   tblPessoadt_cadastro.AsString := DateToStr(DataHoje);

   ciFoto.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npIncluir, false );
   imageFoto.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npIncluir, false );
   imgWebCam.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npIncluir, false );
   ToolBar1.Enabled := DM.UsuarioLogado.TemPermissao( 1135, npIncluir, false );
end;

procedure Tfrm_Pessoas.tblPessoaAfterOpen(DataSet: TDataSet);
begin
   if tblPessoacd_pessoa.AsInteger > 0 then
      VSTContatosEditor.LoadPessoa(
         TPessoa.Create(tblPessoacd_pessoa.AsInteger),
         NOT(PodeAlterarContatos(tblPessoacd_pessoa.AsInteger, iPermissao))
      );

   Self.tblPessoads_estado_nascimentoChange(nil);
   Self.tblPessoads_estadoChange(nil);
   {setando os botões bloquear/liberar acesso online}
   if tblPessoasn_bloqueado.AsInteger = 1 then
   begin
      btnLiberarAcesso.Visible  := true;
      btnBloquearOnline.Visible := false;
   end
   else
   begin
      btnLiberarAcesso.Visible  := false;
      btnBloquearOnline.Visible := true;
   end;

   carregaVariaveisLogAlteracoes;

   // Inicia os campos com permissao de editar
   dbNome.Enabled := True;
   cbNomeOficial.Enabled := True;

   if tblPessoasn_nome_social.AsInteger = 1 then
   begin
        // Permissao de alterar o nome social
        dbNome.Enabled := DM.UsuarioLogado.TemPermissao( 1250, npAlterar, False );
   end;
   cbNomeOficial.Enabled := DM.UsuarioLogado.TemPermissao( 1250, npAlterar, False );

   preencheComboSituacoes;

end;

{ tblPessoaAfterInsert }


procedure Tfrm_Pessoas.tblPessoaNewRecord(DataSet: TDataSet);
{ Nova pessoa }
begin
   tblPessoacd_pessoa.AsInteger := DM.NovoCodigoPessoa( 'Local.CadastroPessoa' );
   VSTContatosEditor.LoadPessoa(
      TPessoa.Create(tblPessoacd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblPessoacd_pessoa.AsInteger, iPermissao))
   );

   { Observações Padrões }
   tblPessoads_observacao.AsString := DM.variavel_parametro('pessoa_observacao_padrao');

   tblPessoacd_logradouro.AsInteger := 81; // RUA
end; { tblPessoaNewRecord }


procedure Tfrm_Pessoas.tblPessoaBeforeDelete(DataSet: TDataSet);
var
   qryDeletaContatos : TUMZQuery;
   msgLogPessoa : string;
begin
   Dm.CriarConsulta(qryDeletaContatos);
   qryDeletaContatos.SQL.Text := 'DELETE FROM contatos_pessoas WHERE cd_pessoa = :pessoa';
   qryDeletaContatos.ParamByName('pessoa').AsString := tblPessoacd_pessoa.AsString;
   qryDeletaContatos.ExecSQL;
   qryDeletaContatos.Close;

   VSTContatosEditor.UnLoadPessoa();
   {Função para gravar log delete}
   gravaLogDelete();

end;

procedure Tfrm_Pessoas.tblPessoaBeforePost(DataSet: TDataSet);
{ Antes de Confirmar }
var
   bLoginOk, bAlterouLogin: Boolean;
   qryVerificaDuplicidade : TUMZQuery;
   chave : String;
   observacao : String;
   salva_cidade_atual, salva_cidade_nasc: Boolean;
begin
   tblPessoads_nacionalidade.AsString := dbNacionalidade.Items[dbNacionalidade.ItemIndex];
   tblPessoacd_estado.AsInteger := Dm.tblEstados2.FieldByName('cd_mec').AsInteger;
   tblPessoacd_estado_nascimento.AsInteger := Dm.tblEstados.FieldByName('cd_mec').AsInteger;
   tblPessoads_pais.AsString := dbPais.Text;
   tblPessoads_pais_nascimento.AsString := sbPaisCombo.Text;
   tblPessoads_estado_civil.AsString := DBLookupComboBox4.Text;

   if (frm_Alunos <> nil) then
   begin

      if (frm_Alunos.pgPessoa <> nil) AND (frm_Alunos.pgPessoa.ActivePageIndex = 0) then
      begin

         if (frm_Alunos.dbCidadeNascimento.Text = '') then
         begin
            tblPessoadescMunicipio.AsString := '';
            tblPessoacd_municipio_nasc.AsString := '0';
         end
         else
         begin
            salva_cidade_nasc  := False;
         end;

         if (frm_Alunos.dbCidadeAtual.Text = '') then
         begin
            tblPessoadescMunicipioAtual.AsString := '';
            tblPessoacd_municipio.AsString := '0';
         end
         else
         begin
            salva_cidade_atual := False;
         end;

      end
      else
      begin
         salva_cidade_atual := True;
         salva_cidade_nasc  := True;
      end;
      
   end
   else
   begin
      salva_cidade_atual := True;
      salva_cidade_nasc  := True;
   end;

   if salva_cidade_atual then
   begin
      tblPessoadescMunicipioAtual.AsString := tblMunicipioAtualds_municipio.AsString;
      tblPessoacd_municipio.AsString := tblMunicipioAtualcd_municipio.AsString;
   end;

   if salva_cidade_nasc then
   begin
      tblPessoadescMunicipio.AsString := tblMunicipiosds_municipio.AsString;
      tblPessoacd_municipio_nasc.AsString := tblMunicipioscd_municipio.AsString;
   end;

   if tblPessoacd_municipio.AsInteger > 0 then
   begin
      tblPessoadescMunicipioAtual.AsString := tblMunicipioAtualds_municipio.AsString;
      tblPessoacd_municipio.AsString := tblMunicipioAtualcd_municipio.AsString;
   end;

   { Inicia valores }
   bLoginOk := false;

   if tblPessoads_pais_nascimento.AsString = 'BRASIL' then
       tblPessoasn_naturalizado.AsInteger := 0;


   { Efetuar a Validação do CPF }

    // verifica duplicidade de registro

   DM.CriarConsulta(qryVerificaDuplicidade);
   if (tblPessoads_cpf.AsString <> '') AND (tblPessoads_cpf.AsString <> '00000000000')then
   begin
      qryVerificaDuplicidade.Close();
      qryVerificaDuplicidade.SQL.Text := ' SELECT                               '+
                                         '    cd_pessoa, nm_pessoa              '+
                                         ' FROM                                 '+
                                         '    pessoas                           '+
                                         ' WHERE                                '+
                                         '    ds_cpf like ''' + tblPessoads_cpf.AsString + ''' ';
      qryVerificaDuplicidade.Open();

      if not qryVerificaDuplicidade.Eof and not(qryVerificaDuplicidade.FieldByName('cd_pessoa').AsInteger = tblPessoacd_pessoa.AsInteger ) then
      begin
         Mensagem('Atenção, existe outra pessoa com o mesmo CPF: ' + CHR(13) +
                  'Nome: ' + qryVerificaDuplicidade.FieldByName('nm_pessoa').AsString + CHR(13) +
                  'Código: ' + qryVerificaDuplicidade.FieldByName('cd_pessoa').AsString, 'Atenção', MB_OK + MB_ICONWARNING);
         Abort;
      end;
   end;

   //Efetua a verificação de duplicidade de matrícula (em Certidão cívil -> Matrícula)
   if (tblPessoads_matricula.AsString <> '')then
   begin
      qryVerificaDuplicidade.Close();
      qryVerificaDuplicidade.SQL.Text := ' SELECT                  ' +
                                         '    cd_pessoa, nm_pessoa ' +
                                         ' FROM                    ' +
                                         '    pessoas              ' +
                                         ' WHERE                   ' +
                                         '    ds_matricula = ''' + tblPessoads_matricula.AsString + ''' ';
      qryVerificaDuplicidade.Open();

      if (NOT(tblPessoatp_cert.AsInteger in [2,3]))
         and not qryVerificaDuplicidade.Eof
         and not(qryVerificaDuplicidade.FieldByName('cd_pessoa').AsInteger = tblPessoacd_pessoa.AsInteger) then
      begin
         Mensagem('Atenção, existe outra pessoa a mesma matrícula (Certidão Cívil): ' + CHR(13) +
                  'Nome: ' + qryVerificaDuplicidade.FieldByName('nm_pessoa').AsString + CHR(13) +
                  'Código: ' + qryVerificaDuplicidade.FieldByName('cd_pessoa').AsString, 'Atenção', MB_OK + MB_ICONWARNING);

         pcDocumentos.ActivePage := tsCertidao;
         dbMatricula.SetFocus;
         Abort;
      end;
   end;

   //Grava log ao trocar a opção para retirada de materiais
   if ((tblPessoa.State = dsEdit) AND (tblPessoasn_pode_retirar_material.OldValue <> tblPessoasn_pode_retirar_material.AsInteger)) then
   begin
      observacao := 'Impedimento ao aluno ' + tblPessoanm_pessoa.AsString + ' de retirar materiais.';
      if (tblPessoasn_pode_retirar_material.OldValue = 1) then
      begin
         observacao := 'Permissão ao aluno ' + tblPessoanm_pessoa.AsString + ' para retirar materiais.';
      end;

      chave := (tblPessoacd_pessoa.AsString) + ';' + inttostr(dm.GetUsuarioLogado.Pessoa.Codigo) + ';' + DateTimeToStr(Now) ;

      DM.setLog(
               57,
               'Alteracao',
               chave,
               dm.UsuarioLogado.GetColigadaLogada.Codigo,
               observacao
            );
   end;


   tblPessoads_cidade.AsString := tblPessoadescMunicipioAtual.AsString;

   { Gravar nome sem acento para BUSCA }
   tblPessoanm_sem_acento.AsString := SemAcento( tblPessoanm_pessoa.AsString );

  { Data de Revisão = Data de Hoje }
  {A data de revisão que indica o período de alteração deve ser gravado
   como ano-mes-dia hora:minuto:segundo.
   Isso é necessário pois o BDE gera esse erro, que não foi encontrado o motivo (bug BDE):
   "Couldn't perform the edit because another user changed the record.",
   no entanto se a TQuery tblPessoas for modificada sempre ele não gera o erro. (como se fosse Mágica)
   Então ao modificar essa data na precisão de segundo o erro é burlado
   Esse erro acontecia quando tentava-se alterar os dados de contato ou login e senha.}
  //tblPessoadt_revisao.AsString := DateToStr(DataHoje); (antiga só altera ano-mes-dia não funciona dessa forma)
   tblPessoadt_revisao.AsDateTime := DM.DataAtual();

   tblPessoacd_pessoa_alteracao.AsInteger :=  DM.iCdPessoaLogado;

  { Registrar Funcionário que alterou o cadastro }
   bAlterouLogin := Self.alteraLogin(edLogin, edSenha1, edSenha2, loginAntigo, tblPessoa);

   gravalog(bAlterouLogin);
end;

{**
   Altera informações de login de uma pessoa, recebe os campos em que serão digitadas as senhas
   e logins.
*}
function Tfrm_Pessoas.alteraLogin(edLogin, edSenha, edRedgSenha: TEdit; sLoginAntigo: string; qyPaiResp: TUMZQuery) : Boolean;
var
   bLoginOk, bAlterouLoginSenha :Boolean;
   ds_obs : String;
begin
   bLoginOk := false;
   bAlterouLoginSenha := false;
   
   if (edLogin.Text <> sLoginAntigo) then begin
       with qyTemp2 do begin
          Close();
          SQL.Text := 'SELECT COUNT(*) as conta FROM pessoas WHERE ds_login = :ds_login ';
          ParamByName('ds_login').AsString := edLogin.Text;
          Open();
          if not IsEmpty() then begin
            bLoginOk := ( FieldByName('conta').AsInteger = 0 );
          end;
          Close();
       end;

       if not (bLoginOk) and ( edLogin.Text <> '' ) then begin
         Mensagem('Login já existente!!!');
         edLogin.Text := sLoginAntigo;
         Abort();
         Exit;
       end;
       
       if (bLoginOk) and ( edLogin.Text <> '' ) and (Length(edLogin.Text) < 4) then
       begin
         if edLogin.Text <> qyPaiResp.FieldByName('cd_pessoa').AsString then
         begin
            Mensagem('Login deve conter no mínimo 4 caracteres.');
            Abort();
            Exit;
         end;
       end;

      with qyTemp2 do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_login = :ds_login WHERE cd_pessoa = :cd_pessoa';
        ParamByName('ds_login').AsString := edLogin.Text;
        ParamByName('cd_pessoa').AsInteger := qyPaiResp.FieldByName('cd_pessoa').AsInteger;
        bAlterouLoginSenha := true;
        ExecSQL();
      end;
   end;

   if (qyPaiResp.FieldByName('ds_senha').AsString = '') AND (edSenha.Text = '*****') then begin

      edSenha.Text := FormatDateTime('ddmmyy', qyPaiResp.FieldByName('dt_nascimento').AsDateTime );
      edRedgSenha.Text := edSenha.Text;
      qyPaiResp.FieldByName('sn_senha_provisoria').AsString := 'S';

   end;

   if (edSenha.Text <> '*****') then begin
    if (edSenha.Text = edRedgSenha.Text) then begin
      with qyTemp2 do begin
        Close();
         SQL.Text := ''
            + ' UPDATE '
            +  ' pessoas '
            + ' SET '
            +   ' ds_senha = MD5(:ds_senha), '
            +   ' sn_senha_provisoria = "S"  '
            + ' WHERE '
            +   ' cd_pessoa = :cd_pessoa';
        ParamByName('ds_senha').AsString := edSenha.Text;
        ParamByName('cd_pessoa').AsInteger := qyPaiResp.FieldByName('cd_pessoa').AsInteger;
        bAlterouLoginSenha := true;
        ExecSQL();
      end;
    end
    else begin
      Mensagem(
         'Você deve digitar duas vezes a mesma senha !',
         Application.Title,
         MB_ICONWARNING+MB_OK, -1
      );
      edSenha.setFocus();
      Exit;
    end;
   end;

   if bAlterouLoginSenha then
   begin
   
      // Registra log de alteração
      ds_obs := 'Alteração de Login/Senha do usuário: '
                + qyPaiResp.FieldByName('cd_pessoa').AsString
                + '. Data: '
                + DateTimeToStr(DM.DataAtual);

      DM.setLog(
         1006,
         'Alteração',
         'AlteracaoLoginSenha',
         DM.UsuarioLogado.GetColigadaLogada().Codigo,
         ds_obs
      );
   end;

   result := bAlterouLoginSenha;
end;

function Tfrm_Pessoas.avisoAlteracaoCadastro:boolean;
var
   txtAviso, nome, cpf : String;
begin
   Result := true;
    nome := dbNome.Text;
    cpf := dbCPF.Text;

  txtAviso := 'Verificamos que você está alterando o cadastro da pessoa ' + (#13) + nomePessoa + '.' + (#13) +
               'Caso esteja criando um novo cadastro, aconselhamos usar a opção Novo Cadastro ou ' +
               'Buscar Cadastro para localizar um cadastro já existente.' + (#13) +
               'Tem certeza que deseja prosseguir alterando o cadastro de ' + nomePessoa + ' ' +
               'transferindo todas as informações vinculadas ' + (#13) + ' (matrículas, financeiro, turmas, e outros) para ' + nome + '?';

     if ( nomePessoa <> nome ) or ( cpfPessoa <> cpf ) then
     begin
        if(Mensagem(txtAviso, 'Alteração Cadastro de Pessoa', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrNo) then
        begin
           result := false
        end else begin
           nomePessoa := nome;
           cpfPessoa := cpf;
           result := true;
        end;
     end
     else
     begin
        Result := True;
     end;
end;

procedure Tfrm_Pessoas.tblPessoacd_paisChange(Sender: TField);
begin
   carregarEstadosPais;
end;

procedure Tfrm_Pessoas.carregarEstadosPais;
begin
   DM.tblEstados.Close();

   DM.tblEstados.SQL.Text := ' SELECT * FROM estados WHERE cd_pais = :pais ORDER BY ds_estado ';
   DM.tblEstados.ParamByName('pais').AsInteger := tblPessoacd_pais.AsInteger;
   Dm.tblEstados.Open();

   if tblPessoa.State in [dsInsert, dsEdit] then begin

      if tblPaises.FieldByName('ds_nacionalidade').AsString <> '' then begin

         tblPessoads_nacionalidade.AsString := tblPaises.FieldByName('ds_nacionalidade').AsString;

      end;

   end;
end;

{ tblPessoaBeforePost }


procedure Tfrm_Pessoas.btIncluir_PessoaClick(Sender: TObject);
{ Inserir uma nova Pessoa }
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;

   if not tblPessoa.Active then
   begin
      tblPessoa.Close;
      tblPessoa.SQL.Text := 'Select * from pessoas where cd_pessoa = 9999999';
      tblPessoa.Open;
   end;

   pgPessoa.ActivePageIndex := 0;

   carregarEstadosPais;

   DBLookupComboBox2.Enabled := false;
   dbCidadeNascimento.Enabled := false;

   tblPessoa.Insert;

   tblPessoasn_nome_social.AsInteger := 0;
   tblPessoasn_foto.AsString:='N';
   dbNacionalidade.ItemIndex := -1;
   dbNome.SetFocus;
                    
   dbNacionalidade.ItemIndex := -1;

   imageFoto.Visible := False;
   ciFoto.Picture.Assign(nil);
   tblPessoasn_foto.AsString := 'N';
   imageFoto.Picture.Bitmap.Assign(nil);

   carregaVariaveisLogAlteracoes;
   cbFormaConhece.ItemIndex := 0;
   DBCheckBox10.Enabled := true;
end;

procedure Tfrm_Pessoas.btnAlteraObsClick(Sender: TObject);
begin
   qryObsGerais.Edit();
end;

procedure Tfrm_Pessoas.btnAlterarVinculoExternoClick(Sender: TObject);
const
   SQL_ALTERAR_VINCULO_PESSOA_EXTERNA =
      'UPDATE pessoas_integracao_externa SET cd_pessoa_externa = :cd_pessoa_externa WHERE cd_pessoa = :cd_pessoa AND cd_sistema = :cd_sistema AND cd_pessoa_externa = :cd_pessoa_externa_antigo';
var
   codigoPessoaExterna: Integer;
   qyAlterarVinculo: TUMZQuery;
begin
   if NOT(TGeneral.InputInteger('Informe o novo código da pessoa', 'Informe o novo código da pessoa no sistema externo ' + qyVinculosExternods_sistema.AsString + ':', codigoPessoaExterna, qyVinculosExternocd_pessoa_externa.AsInteger)) then
   begin
      Exit;
   end;

   DM.CriarConsulta(qyAlterarVinculo);
   qyAlterarVinculo.SQL.Text := SQL_ALTERAR_VINCULO_PESSOA_EXTERNA;
   qyAlterarVinculo.ParamByName('cd_pessoa_externa').AsInteger := codigoPessoaExterna;
   qyAlterarVinculo.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
   qyAlterarVinculo.ParamByName('cd_sistema').AsInteger := qyVinculosExternocd_sistema.AsInteger;
   qyAlterarVinculo.ParamByName('cd_pessoa_externa_antigo').AsInteger := qyVinculosExternocd_pessoa_externa.AsInteger;
   qyAlterarVinculo.ExecSQL();

   FreeAndNil(qyAlterarVinculo);

   qyVinculosExterno.Close();
   qyVinculosExterno.Open();
end;

procedure Tfrm_Pessoas.btnAplicarClick(Sender: TObject);
Var
   BS: TStream;
   JPEGimg : TJPEGImage;
begin
   FAlterandoFoto := True;
   
   if tblPessoa.State <> dsInsert then
      tblPessoa.Edit;

   imageFoto.Picture.Bitmap.Assign(ciFoto.GetRegion());

   JPEGimg := TJPEGImage.Create();

   JPEGimg.Assign(imageFoto.Picture.Graphic);

   BS := tblPessoa.CreateBlobStream(tblPessoaim_pessoa, bmWrite);

   JPEGimg.SaveToStream(BS);

   tblPessoaim_pessoa.LoadFromStream(BS);

   tblPessoasn_foto.AsString := 'S';

   ciFoto.Visible := False;
   imageFoto.Visible := True;

   tblPessoa.Post;
   FAlterandoFoto := False;
end;

procedure Tfrm_Pessoas.btnBloquearOnlineClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1146, npAlterar, True ) then exit;
   tblPessoa.Edit;
   tblPessoasn_bloqueado.AsInteger := 1;
   tblPessoa.Post;
   btnBloquearOnline.Visible := false;
   btnLiberarAcesso.Visible  := true;

end;

procedure Tfrm_Pessoas.btnCancelarClick(Sender: TObject);
begin
   { Apenas abre a imagem no TImage que existe na tela (Name: Foto) }
   ciFoto.Visible := false;
   ciFoto.Picture.Assign(nil);

   imageFoto.visible := True;
//   try
//      { Cria o componente BLOBStream baseado no campo qyPessoasFoto em modo leitura (Note: BMREAD) }
//      BS := tblPessoa.CreateBlobStream(tblPessoaim_pessoa, bmRead);
//
//      { Apenas abre no componente TImage a foto que está aberta no componente JPEG (Imagem)}
//      imageFoto.Picture.Bitmap.LoadFromStream(BS);;
//   except
//      imageFoto.visible := false;
//   end;
//
//   { Libera da memória os componentes criados }
//   FreeAndNil(BS);
//   FreeAndNil(Imagem);

   imgWebCam.Visible := False;

   // Garante que a Webcam esteja desabilitada
   TfWebcamDriver.Deactivate;

   btnAplicar.Enabled := False;
   btnCancelar.Enabled := False;
   btnCapturar.Visible := False;
   btnConectar.Visible := True;
   btnDigitalizar.Visible := True;
end;

procedure Tfrm_Pessoas.btnCancelarObsClick(Sender: TObject);
begin
   qryObsGerais.Cancel();
end;

procedure Tfrm_Pessoas.btnCapturarClick(Sender: TObject);
begin
   TfWebcamDriver.CaptureAndStop(ciFoto.Picture.Bitmap);
   ciFoto.Border := True;
   ciFoto.Border := False;

   ciFoto.Visible := True;
   imageFoto.Visible := False;
   imgWebCam.Visible := False;

   btnCapturar.Visible := false;
   btnAplicar.Enabled  := True;
   btnCancelar.Enabled := true;
end;

procedure Tfrm_Pessoas.btnConectarClick(Sender: TObject);
const
   SErrorMsg = 'Ocorreu um erro na tentativa de estabelecer conexão com a Webcam:'#13'%s';
begin
   try
      if TfWebcamDriver.SelectDriver(imgWebCam) then
      begin
         btnConectar.Visible := False;
         btnCapturar.Visible := True;
         btnCapturar.Enabled := True;
         btnAplicar.Enabled := False;
         btnCancelar.Enabled := True;
         btnDigitalizar.Visible := False;
      end;
   except
      on E: Exception do
         MessageBox(Handle, PChar(Format(SErrorMsg, [E.Message])), PChar('Erro'), MB_ICONERROR or MB_OK);
   end;
end;

procedure Tfrm_Pessoas.btnDigitalizarClick(Sender: TObject);
var
  SourceIndex: smallint;
begin
   if tblPessoacd_pessoa.AsString = '' then
   begin
      exit;
   end;
   
   DelphiTwain1.LibraryLoaded := True;
   DelphiTwain1.SourceManagerLoaded := True;

   if not ((DelphiTwain1.LibraryLoaded) and (DelphiTwain1.SourceManagerLoaded)) then
   begin
    Mensagem('Não foi possível carregar a biblioteca Twain ou alguma origem.', '', MB_ICONERROR + MB_OK);
    Exit;
   end;

   // Selecionar a última origem de digitalização utilizada
   try
     Origem := StrToInt(Dm.variavel_parametro('digitalizacao_origem'));
   except
     Origem := -1;
   end;


   if DelphiTwain1.SourceCount > 0 then
   begin
      Self.SetEnabled(False);
      SourceIndex := DelphiTwain1.SelectSource();
      Self.SetEnabled(True);
      Origem := SourceIndex;
   end
   else
   begin
      Mensagem('Nenhuma origem está instalada!', '', MB_OK + MB_ICONWARNING);
      Origem := -1;
   end;

  try
     if (Origem <> -1) then
     begin
        if Imagem <> nil then begin
           FreeAndNil(Imagem);
        end;

        Imagem := TJPEGImage.Create();
        VerificaBibliotecaTwain();
        //Now that we know the index of the source, we'll
        //get the object for this source
        with DelphiTwain1.Source[Origem] do begin

           //Load source and acquire image
           SetICapUnits(tuPixels);
           SetIXResolution(500);
           SetIYResolution(500);
           SetIPixelType(tbdRgb);

           Modal := True;
           Loaded := True;
           Enabled := True;
        end;
     end; {if (SourceIndex <> -1)}
  Except

  end;

  if tblPessoa.State <> dsInsert then
     tblPessoa.Edit;
  bComImagem:= true;
end;

procedure Tfrm_Pessoas.btnLiberarAcessoClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1146, npAlterar, True ) then exit;
   tblPessoa.Edit;
   tblPessoasn_bloqueado.AsInteger := 0;
   tblPessoa.Post;
   btnBloquearOnline.Visible := true;
   btnLiberarAcesso.Visible  := false;
end;

procedure Tfrm_Pessoas.btnObservacoesClick(Sender: TObject);
begin
//
end;

procedure Tfrm_Pessoas.btnRemoverVinculoExternoClick(Sender: TObject);
const
   SQL_EXCLUIR_VINCULO_PESSOA_EXTERNA =
      'DELETE FROM pessoas_integracao_externa WHERE cd_pessoa = :cd_pessoa AND cd_sistema = :cd_sistema AND cd_pessoa_externa = :cd_pessoa_externa';
var
   qyExcluirVinculo : TUMZQuery;
begin
   if TGeneral.Mensagem(
         'Tem certeza de que deseja remover o vínculo externo desta pessoa com o sistema ' +
         qyVinculosExternods_sistema.AsString + ' sob o código ' + qyVinculosExternocd_pessoa_externa.AsString + '?', '',
         MB_YESNO + MB_ICONQUESTION, Handle
      ) = mrYes then
   begin
      DM.CriarConsulta(qyExcluirVinculo);
      qyExcluirVinculo.SQL.Text := SQL_EXCLUIR_VINCULO_PESSOA_EXTERNA;
      qyExcluirVinculo.ParamByName('cd_sistema').AsInteger := qyVinculosExternocd_sistema.AsInteger;
      qyExcluirVinculo.ParamByName('cd_pessoa_externa').AsString := qyVinculosExternocd_pessoa_externa.AsString;
      qyExcluirVinculo.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
      qyExcluirVinculo.ExecSQL();
      FreeAndNil(qyExcluirVinculo);

      qyVinculosExterno.Close();
      qyVinculosExterno.Open();
   end;
end;

procedure Tfrm_Pessoas.btnSalvarObsClick(Sender: TObject);
begin
   qryObsGerais.ParamByName('cd_pessoa').AsInteger := tblPessoa.FieldByName('cd_pessoa').AsInteger;
   qryObsGerais.Post();
end;

{ btIncluir_PessoaClick }


procedure Tfrm_Pessoas.btAlterar_PessoaClick(Sender: TObject);
{ Altear a Pessoa Atual }
var
   permiteAlterarCodigo: boolean;
begin
//   pgPessoa.ActivePageIndex := 0;
   if NOT(DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True )) then
   begin
      Exit;
   end;

   if tblPessoanm_pessoa.AsString <> '' then
      tblPessoa.Edit;
//   dbNome.SetFocus;

end; { btAlterar_PessoaClick }


procedure Tfrm_Pessoas.btExcluir_PessoaClick(Sender: TObject);
const
   SCapConfirm = 'Confirmação';
   SMsgConfirm = #13'Tem certeza que deseja excluir a pessoa selecionada?';
   SMsgInicio  = 'A exclusão deste registro implica: '#13#13;
   SMsgHasObs =
      'Na exclusão de todas as observações gerenciais a ele vinculadas.'#13;
   SMsgHasAtendimento =
      'Na exclusão de todos os atendimentos vinculados ao aluno.'#13;
   SMsgHasDeficiencia =
      'Na exclusão de todos os registros de saúde vinculados ao aluno.'#13;
   MsgFlags = MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2;
var
   SMsg:String;
begin
   // Verifica se o usuário possui permissão para realizar a exclusão
   if DM.UsuarioLogado.TemPermissao(iPermissao, npExcluir, True) then
   begin
      if TChecarUsoColigada.Create( TPessoa.Create( tblPessoacd_pessoa.AsInteger ) ).NaoPossuiPermissao(True, permEspecial) then
      begin
         Exit;
      end;

      // Somente realiza a exclusão se não possuir matrícula
      if not Tem_matricula(tblPessoacd_pessoa.AsInteger) then
      begin
         // Solicita a confirmação do usuário para realizar a exclusão
         if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm), MsgFlags) = ID_YES then
         begin
             // Se possui observações vinculadas solicita a confirmação do
            // usuário para realizar a exclusão de todas as observações
            if  TfObservacoes.HasObservations(tblPessoacd_pessoa.AsInteger) then
               SMsg := SMsg + SMsgHasObs;

            if  TfrmFichaSaudeCompleta.HasFicha(tblPessoacd_pessoa.AsInteger) then
               SMsg := SMsg + SMsgHasAtendimento;

            if  TfrmFichaSaudeCompleta.HasDeficiencia(tblPessoacd_pessoa.AsInteger) then
               SMsg := SMsg + SMsgHasDeficiencia;

            if (SMsg = '') or (MessageBox(Handle, PChar(SMsgInicio + SMsg + SMsgConfirm), PChar(SCapConfirm), MsgFlags) = ID_YES) then
            begin
               TfObservacoes.ClearObservations(tblPessoacd_pessoa.AsInteger);
               TfrmFichaSaudeCompleta.ClearFicha(tblPessoacd_pessoa.AsInteger);
               TfrmFichaSaudeCompleta.ClearDeficiencia(tblPessoacd_pessoa.AsInteger);
               qyVinculosExterno.Close;
               {setando log de exclusao de pessoa}

               removeCamposExtrasCodigo(tblpessoacd_pessoa.AsInteger);

               tblPessoa.Delete;
            end;
         end;
      end;
   end;
end;

procedure Tfrm_Pessoas.btSalvar_PessoaClick(Sender: TObject);
{ Salvar as Alterações no cadastro }
var
   bUsaResponsavel, camposValidos, atualizaSenha : Boolean;
   mensagens_contatos: String;
begin
   jaGerouLog := false;
   {
      Se o campo de nacionalidade estiver Focado, nós tiramos o foco dele,
      forçando para que o Foco vá para o campo Nome. Neste momento, existe uma programação
      no evento OnExit do dbNacionalidade, que válida o que o usuário digitou.

      Caso, o valor que o usuário tenha digitado esteja incorreto, o foco irá RETORNAR
      para o campo dbNacionalidade.
   }
   if dbNacionalidade.Focused and (dbNacionalidade.ItemIndex = -1) then
   begin
      TGeneral.FocarProximoCampo(Handle);

      {
         Ou seja, se verificamos novamente o foco do campo dbNacionalidade,
         e ele realmente estiver focado, significa que ouve erro de nacionalidade,
         então, abortamos a ação de salvar.
      }
      if dbNacionalidade.Focused then
         Exit;
   end;

   {Coloca foco em um campo para poder salvar as alterações
   do ultimo campo em foco}

   if (pgPessoa.ActivePage = tsDadosPessoais) then
   begin
      if (dbNome.Focused = true) then
      begin
         dbNacionalidade.SetFocus;
      end
      else if dbNome.Enabled then
      begin
         dbNome.SetFocus
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

   if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
   begin
      exit;
   end;

   //Verifica campo CPF e Passaporte
   if verificaCpfPassaporte = False then
   begin
      abort;
   end;

    if (DBLookupComboBox2.Enabled = false) then
    begin
       tblPessoads_estado_nascimento.AsString := '';
       tblPessoads_cidade_nascimento.AsString := '';
    end;

    mensagens_contatos := '';

    if (( DM.variavel_parametro('email_obrigatorio') = 'S' ) or (validaEmail)) AND
       (
         TListaContatosPessoa.GetListaContatosFromPessoa(
            TPessoa.Create(tblPessoacd_pessoa.AsInteger),
            TContatoTipo.CreateFromCodigo(4)
         ).Count = 0
       ) then
    begin
      mensagens_contatos := mensagens_contatos + #13 + 'E-mail';
    end;

    //valida Telefone residencial
    if ( validaTelefone_residencial ) AND
       (
         TListaContatosPessoa.GetListaContatosFromPessoa(
            TPessoa.Create(tblPessoacd_pessoa.AsInteger),
            TContatoTipo.CreateFromCodigo(1)
         ).Count = 0
       ) then
    begin
      mensagens_contatos := mensagens_contatos + #13 + 'Telefone Residencial';
    end;

    //valida Telefone comercial
    if ( validaTelefone_comercial ) AND
       (
         TListaContatosPessoa.GetListaContatosFromPessoa(
            TPessoa.Create(tblPessoacd_pessoa.AsInteger),
            TContatoTipo.CreateFromCodigo(2)
         ).Count = 0
       ) then
    begin
      mensagens_contatos := mensagens_contatos + #13 + 'Telefone Comercial';
    end;

    //valida Celular
    if ( validaCelular ) AND
       (
         TListaContatosPessoa.GetListaContatosFromPessoa(
            TPessoa.Create(tblPessoacd_pessoa.AsInteger),
            TContatoTipo.CreateFromCodigo(3)
         ).Count = 0
       ) then
    begin
      mensagens_contatos := mensagens_contatos + #13 + 'Celular';
    end;

    if (mensagens_contatos <> '') then
    begin
       Mensagem(
         'É necessário que você informe ao menos um contato do(s) seguinte(s) tipo(s): ' + #13 + mensagens_contatos,
         '',
         MB_OK + MB_ICONEXCLAMATION,
         Handle
       );
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

   if pgPessoa.ActivePage = tsComplementares then
   begin
      if UpperCase(cbFormaConhece.Text) = 'OUTROS' then
      begin
         if (edFormaConheceuOutro.Text = '') then
         begin
            tblPessoads_forma_conheceu.AsString := 'Outros';
         end
         else
         begin
            tblPessoads_forma_conheceu.AsString := edFormaConheceuOutro.Text;
         end;
      end
      else
      begin
         if (cbFormaConhece.ItemIndex = 0) then
         begin
            tblPessoads_forma_conheceu.AsString := '';
         end
         else
         begin
            tblPessoads_forma_conheceu.AsString := cbFormaConhece.Text;
         end;
      end;
   end;

  //Se não tem nenhuma senha setada usa a padrão gerada (data de nascimento)
  atualizaSenha := (tblPessoa.State in [dsInsert]) AND (tblPessoads_senha.AsString = '');

  bUsaResponsavel := (tblPessoa.State in [dsInsert]);

  if (tblPessoacd_resp_finan.AsInteger = 0 ) and not(bMenorIdade) and (bUsaResponsavel) and (tblPessoadt_nascimento.AsDateTime <> 0) then
  begin
     tblPessoa.Edit;
     tblPessoacd_resp_finan.AsInteger := tblPessoacd_pessoa.asInteger ;
     tblPessoa.Post;
  end;

  if (tblPessoa.State in [dsInsert, dsEdit]) then 
     tblPessoa.Post;

  if tblPessoa.State in [dsInsert, dsEdit] then
  begin
     tblPessoa.Post;
  end;

  bExcluido :=false;
  bComImagem :=false;
  pgPessoa.SetFocus();

  if atualizaSenha then
  begin
     atualizaSenhaInsercao();
  end;

  // realizava apenas na unit uAluno
  if not Self.FBSenhaValidada then Exit;
end;

procedure Tfrm_Pessoas.Button1Click(Sender: TObject);
begin
   if ( not parametro_ficha_saude_completa ) then
   begin
      if not DM.UsuarioLogado.TemPermissao( 1056, npAcesso, True ) then Exit;

      Application.CreateForm(TfrmCadDeficiencias,frmCadDeficiencias);

      frmCadDeficiencias.CodigoAluno      := tblPessoacd_pessoa.AsInteger;
      frmCadDeficiencias.lbPessoa.Caption := tblPessoanm_pessoa.AsString;
      frmCadDeficiencias.ShowModal;
   end else begin
      if not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npAcesso, False ) AND
         not DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude.Prontuario', npAcesso, False ) then
      begin
         DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude', npAcesso, True );
         DM.UsuarioLogado.TemPermissao( 0, 'Academico.FichaSaude.Prontuario', npAcesso, True );
         Exit;
      end;

      if not PrincipalForm.ProcuraForm(frmFichaSaudeCompleta) then
         Application.CreateForm(TfrmFichaSaudeCompleta, frmFichaSaudeCompleta);

      frmFichaSaudeCompleta.setCdPessoa( tblPessoacd_pessoa.AsInteger );
      frmFichaSaudeCompleta.ShowModal();
   end;
end;

procedure Tfrm_Pessoas.carregaEndereco(const pais : String; estado: Boolean);
var
   estadoSelecionado: String;
begin
   DM.tblEstados.Close;
   tblMunicipios.Close;

    DBLookupComboBox2.Enabled := false;
    dbCidadeNascimento.Enabled := false;

   if (pais <> '') then
   begin
     DM.tblEstados.SQL.Text := ''+
                                'SELECT *                             ' +
                                'FROM estados                         ' +
                                'WHERE cd_pais = :cd_pais_selecionado ' +
                                'ORDER BY ds_estado                   ';

     DM.tblEstados.ParamByName('cd_pais_selecionado').AsString := pais;
     DM.tblEstados.Open;

     //se tiver estado esta cancelando, portanto pega da tabela de pessoas
     estadoSelecionado := DM.tblEstados.FieldByName('ds_uf').AsString;
     if ( estado ) then
     begin
        estadoSelecionado := tblPessoads_estado_nascimento.AsString;
     end;

     if (trim(estadoSelecionado) <> '') then
     begin
       tblMunicipios.paramByName('uf_nascimento').AsString := estadoSelecionado;
       tblMunicipios.Open();
     end;

     DBLookupComboBox2.Enabled := true;
     dbCidadeNascimento.Enabled := true;
   end;
end;

procedure Tfrm_Pessoas.CarregarComboNacionalidades(Sender: TUMComboBox; procedimentoOnChange: TProcedureOnChange);
begin
   Sender.Clear;
   qryNacionalidade.Open;
   qryNacionalidade.First;

   while not qryNacionalidade.Eof do
   begin
      if ( Length(Trim(qryNacionalidade.FieldByName('ds_nacionalidade').AsString)) > 0 ) then
      begin
         Sender.AddItem( qryNacionalidade.FieldByName('ds_nacionalidade').AsString,
            TItemCombo.Create(
               qryNacionalidade.FieldByName('cd_pais').AsString,
               qryNacionalidade.FieldByName('ds_nacionalidade').AsString
            ) );
      end;

      qryNacionalidade.Next;
   end;

   { Ativa a funcionalidade de OnChange da Combo, SOMENTE, após a combo estar carregada }
   Sender.OnChange := procedimentoOnChange;
end;

procedure Tfrm_Pessoas.CarregarPaises;
begin
   tblPaises.Close();
   tblPaises.Open();
   CarregarComboNacionalidades(dbNacionalidade, cbNacionalidadeChange);
end;

procedure Tfrm_Pessoas.carregaVariaveisLogAlteracoes;
begin

   //Cadastro geral
   nm_Pessoa := tblPessoa.FieldByName('nm_pessoa').AsString;
   nm_pessoa_oficial := tblPessoa.FieldByName('nm_pessoa_oficial').AsString;
   dt_Nascimento := tblPessoadt_nascimento.AsString;
   pais_Nasc := tblPessoads_pais_nascimento.AsString;
   estado_Nasc := tblPessoads_estado_nascimento.AsString;
   cidade_Nasc := tblPessoads_cidade_nascimento.AsString;
   ds_cpf := tblPessoads_cpf.AsString;
   ds_rg := tblPessoads_identidade.asString;
   pais_Nasc := tblPessoads_pais_nascimento.AsString;
   nm_pai := tblPessoanm_pai.AsString;
   nm_mae := tblPessoanm_mae.AsString;

   //Endereço
   ds_cep := tblPessoads_cep.AsString;
   descPais := tblPessoadescPais.AsString;
   descEstado := tblPessoadescEstado.AsString;
   descMunicipio := tblPessoadescMunicipio.AsString;
   descMunicipioAtual := tblPessoadescMunicipioAtual.AsString;
   ds_bairro := tblPessoads_bairro.AsString;
   descLogradouro := tblPessoadesLogradouro.AsString;
   ds_logradouro := tblPessoads_logradouro.AsString;
   ds_logradouro_nro := tblPessoads_logradouro_nro.AsString;
   ds_complemento := tblPessoads_complemento.AsString;

end;

procedure Tfrm_Pessoas.cbFormaConheceChange(Sender: TObject);
begin
   inherited;
   tblPessoa.Edit;

   if (UpperCase(cbFormaConhece.Text) = 'OUTROS') then
   begin
      lbInformeFicouSabendo.Visible := True;
      edFormaConheceuOutro.Visible := True;
   end
   else
   begin
      lbInformeFicouSabendo.Visible := False;
      edFormaConheceuOutro.Visible := False;
      edFormaConheceuOutro.Text := '';
   end;

end;

procedure Tfrm_Pessoas.cbNacionalidadeChange(Sender: TObject);
var
   Key: Word;
   selectedIndex : Integer;
begin
   Key := 0;
   selectedIndex := dbNacionalidade.ItemIndex;

   dbNacionalidadeKeyDown(nil, Key, [ssShift]);

   if ( tblPessoa.State in [dsEdit] ) AND
      ( dbNacionalidade.Items.Objects[dbNacionalidade.Items.Count-1] = nil ) then
   begin
      dbNacionalidade.Items.Delete(dbNacionalidade.Items.Count-1);
      dbNacionalidade.ItemIndex := selectedIndex;
   end;
end;

procedure Tfrm_Pessoas.cbNomeOficialClick(Sender: TObject);
begin
   organizaCamposNomePessoa();
end;

procedure Tfrm_Pessoas.organizaCamposNomePessoa();
begin

   // Mostra ou não o campo para digitação do nome oficial (nm_pessoa_oficial) e as labels/informações dos nomes
   dbNomeOficial.Visible := cbNomeOficial.Checked;
   lbNomeOficialInfo.Visible := cbNomeOficial.Checked;
   lbNomeSocialInfo.Visible := cbNomeOficial.Checked;
   lbNomeSocial.Visible := cbNomeOficial.Checked;
   umAjuda.Visible := cbNomeOficial.Checked;

   // Move o campo do nome social (nm_pessoa)
   if cbNomeOficial.Checked then
   begin
      dbNomeOficial.Top := dbSexo.Top;
      dbNome.Top := DBLookupComboBox4.Top;
      dbNome.Width := 340;
      dbNome.Left := 25;

      cbNomeOficial.Width := 17;
      cbNomeOficial.Caption := '';

      lbNomeOficial.Caption := 'Nome oficial';

      if tblPessoa.State in [dsEdit, dsInsert] then
      begin
         tblPessoanm_pessoa_oficial.AsString := dbNome.Text;
      end;
   end else begin
      dbNome.Top := dbSexo.Top;
      dbNome.Width := 389;
      dbNome.Left := 6;

      cbNomeOficial.Width := 250;
      cbNomeOficial.Caption := 'Habilitar nome social da pessoa';

      lbNomeOficial.Caption := 'Nome';

      if tblPessoa.State in [dsEdit, dsInsert] then
      begin
         tblPessoanm_pessoa.AsString := tblPessoanm_pessoa_oficial.AsString;
         tblPessoanm_pessoa_oficial.AsString := '';
      end;
   end;

end;

procedure Tfrm_Pessoas.dbMatriculaExit(Sender: TObject);
begin

   if (tblPessoa.State = dsEdit) or (tblPessoa.State = dsInsert) then
   begin
      if trim(tblPessoads_matricula.AsString) <> '' then
      begin
         tblPessoads_cert_livro.AsString := copy(tblPessoads_matricula.AsString, 21, 5);
         tblPessoads_cert_folha.AsString := copy(tblPessoads_matricula.AsString, 27, 3);
         tblPessoanr_cert_termo.AsString := copy(tblPessoads_matricula.AsString, 31, 7);
      end else begin
         tblPessoads_matricula.AsVariant := null;
      end;
   end;

end;

procedure Tfrm_Pessoas.dbNacionalidadeExit(Sender: TObject);
begin
{   if (tblPessoa.State IN [dsInsert, dsEdit]) AND (dbNacionalidade.ItemIndex = -1) then
   begin
      Mensagem('Selecione uma Nacionalidade Válida');
      dbNacionalidade.SetFocus;
   end; }
end;

procedure Tfrm_Pessoas.dbNacionalidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   selectedIndex : Integer;
begin
   if Key = VK_F5 then
      Exit;

   selectedIndex := dbNacionalidade.ItemIndex;

   if (tblPessoa.State in [dsInactive]) then
   begin
      btIncluir_PessoaClick(Sender);
   end else if ( tblPessoa.State in [dsBrowse] ) then
   begin
      tblPessoa.Edit();

      if Sender <> nil then
         dbNacionalidade.ItemIndex := selectedIndex;
   end;
end;

procedure Tfrm_Pessoas.dbNacionalidadeKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;
end;

procedure Tfrm_Pessoas.CreateParams(var Params: TCreateParams);
begin
   inherited;

   if Assigned(Owner) and (Owner is TWincontrol) then
   begin
      Params.WndParent := TWinControl(Owner).handle
   end
   else if Assigned(Screen.Activeform) then
   begin
      Params.WndParent := Screen.Activeform.Handle;
   end;
end;

{ btSalvar_PessoaClick }


procedure Tfrm_Pessoas.btCancelar_PessoaClick(Sender: TObject);
{ Cancelar as Alterações do cadastro}
var
   nacionalidadeAtualCont : Integer;
   existeNacionalidade : Boolean;
begin

   {Checa o status da tabela de pessoa para retornar a nacionalidade que esta gravada, na hora de ação do cancelamento}
   existeNacionalidade := false;
   if (tblPessoa.State in [dsEdit]) then
   begin
      for nacionalidadeAtualCont := 0 to dbNacionalidade.Items.Count - 1 do
      begin
         if dbNacionalidade.items[nacionalidadeAtualCont] = tblPessoads_nacionalidade.AsString  then
         begin
            existeNacionalidade := true;
            break;
         end;
      end;

      if not existeNacionalidade then
         nacionalidadeAtualCont :=  nacionalidadeAtual;

   end
   else if (tblPessoa.State in [dsInsert]) then
      nacionalidadeAtualCont := nacionalidadeAtual;

   tblPessoa.Cancel;
   dbNacionalidade.ItemIndex := nacionalidadeAtualCont;
   pgPessoa.SetFocus();

   if tblPessoacd_pessoa.AsInteger > 0 then
   VSTContatosEditor.LoadPessoa(
      TPessoa.Create(tblPessoacd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblPessoacd_pessoa.AsInteger, iPermissao))
   );

   carregaVariaveisLogAlteracoes;
   preencheComboSituacoes;
   sbPaisComboClick(self);
end;

procedure Tfrm_Pessoas.btBuscar_PessoaClick(Sender: TObject);
var
   hasHierarquia, hasPermissaoColigadas : Boolean;
   i, codigo, codigoPessoa: Integer;
   
   qyEstado: TUMZQuery;
{ Abrir Janela de BUSCA de PESSOAS }
begin

   codigo := tblPessoacd_pessoa.AsInteger;

   if filtro_cd_pessoa <> -1 then begin
      codigoPessoa := filtro_cd_pessoa;
   end else begin
      resultado_filtro := TfrmSelecionarPessoa.Filtrar([], AbaSelecionada, ano_semestre);
      codigoPessoa := resultado_filtro.cd_pessoa;
   end;

   if ( ( filtro_cd_pessoa <> -1 ) OR ( resultado_filtro.filtrado ) ) and (codigoPessoa <> codigo) then
   Begin

      filtro_cd_pessoa := -1;
      tblPessoa.CLose;

      tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + IntToStr(codigoPessoa);

      tblPessoa.Open;
      qyVinculosExterno.Open();

      hasPermissaoColigadas := not TChecarUsoColigada.Create( TPessoa.Create( codigoPessoa ) ).NaoPossuiPermissao(False);

      if hasPermissaoColigadas then
      begin
         btAlterar_Pessoa.ImageIndex := 1;
         btExcluir_Pessoa.ImageIndex := 2;
      end else begin
         btAlterar_Pessoa.ImageIndex := 10;
         btExcluir_Pessoa.ImageIndex := 10;
      end;
      
      nomePessoa := tblPessoanm_pessoa.AsString;
      cpfPessoa := tblPessoads_cpf.AsString;

      FiltrarNacionalidade(tblPessoads_nacionalidade.AsString, dbNacionalidade);
      nacionalidadeAtual := dbNacionalidade.ItemIndex;
      
      pgPessoa.ActivePage := tsDadosPessoais;

      btnAplicar.Visible := True;
      btnCancelar.Visible := True;
      btnConectar.Visible := True;

      DM.CriarConsulta(qyEstado);

      qyEstado.sql.text := 'SELECT count(e.cd_pais) as qtd '+
         ' FROM paises p                                   '+
         ' INNER JOIN estados e on(e.cd_pais = p.cd_pais)  '+
         ' WHERE ds_pais = :ds_pais_atual                  ';
   
      qyEstado.ParamByName('ds_pais_atual').AsString :=
         tblPessoa.FieldByName('descPaisNasc').asString;

      qyEstado.Open;

      sbPaisComboCloseUp(Self);
      
      dbMatricula.Enabled := false;
      pcDocumentos.Height := 133;
      pnContato.Top := pcDocumentos.Top + 133;
      pcDocumentos.ActivePage := TabSheet2;

      if tblPessoatp_cert.AsInteger = 1 then
      begin
         dbMatricula.Enabled := true;
      end;

   End;
end;  { btBuscar_PessoaClick }


procedure Tfrm_Pessoas.tblPessoaAfterPost(DataSet: TDataSet);
var
   LICodigoPessoa : Integer;
begin
   LICodigoPessoa := tblPessoacd_pessoa.AsInteger;

   tblPessoa.Close;
   tblPessoa.SQL.Text := 'SELECT * FROM PESSOAS WHERE CD_PESSOA = :CD_PESSOA';
   tblPessoa.ParamByName('CD_PESSOA').AsInteger := LICodigoPessoa;
   tblPessoa.Open;

   carregaVariaveisLogAlteracoes;
   

   qryPessoaUpdatePraca.ParamByName('CD_PESSOA').AsInteger := LICodigoPessoa;
   qryPessoaUpdatePraca.ExecSQL;

   qryPessoaUpdateMunicipio.ParamByName('CD_PESSOA').AsInteger := tblPessoacd_pessoa.AsInteger;
   qryPessoaUpdateMunicipio.ExecSQL;

   qryPessoaUpdateMunNasc.ParamByName('CD_PESSOA').AsInteger := tblPessoacd_pessoa.AsInteger;
   qryPessoaUpdateMunNasc.ExecSQL;

end;


procedure Tfrm_Pessoas.dbNomeKeyPress(Sender: TObject; var Key: Char);
{ Avançar com ENTER }
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end;

procedure Tfrm_Pessoas.dbNomeOficialExit(Sender: TObject);
begin
   { Verificar se existe algum nome cadastrado }

   if tblPessoa.State <> dsInsert then Exit;

   if tblPessoanm_pessoa_oficial.AsString = '' then Exit;


   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select cd_pessoa, nm_pessoa_oficial, ds_cpf, nm_pai from pessoas where nm_pessoa_oficial = :nome');
   qyTemp1.ParamByName('nome').AsString := tblPessoanm_pessoa_oficial.AsString;
   qyTemp1.Open;

   while not qyTemp1.Eof do
   Begin
      if Mensagem('Existe uma pessoa com o mesmo nome cadastrada no sistema.' + chr(13) +
                  '   Nome Oficial : ' + qyTemp1.FieldByName('nm_pessoa_oficial').AsString + '  (' + qyTemp1.FieldByName('cd_pessoa').AsString + ')' + chr(13) +
                  '   CPF : ' + qyTemp1.FieldByName('ds_cpf').AsString + chr(13) +
                  '   Nome do Pai : ' + qyTemp1.FieldByName('nm_pai').AsString + chr(13) + chr(13) +
                  'Deseja alterar este cadastro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
      = mrYes Then
      Begin
          tblPessoa.Cancel;
          tblPessoa.CLose;
          tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + qyTemp1.FieldByName('cd_pessoa').AsString;
          tblPessoa.Open;

          Exit;
      End;


      qyTemp1.Next;
   End;
end;

procedure Tfrm_Pessoas.DBText2DblClick(Sender: TObject);
const
   LogMudancaCodigoFmt = 'Mudança de Código de Pessoa: De: %s Para: %s';
   LogUnificacaoCodigoFmt = 'Unificado de Código de Pessoa: De: %s Para: %s, removida a pessoa de código: %s';
var
   slCamposAlteracao, slTabelasIgnorar, slTabelasExcessao, slErros: TStringList;
   sNovoCodigo, sMensagemErro, sMensagem,sMensagemTabelas, cobrancaMinima: String;
   qyVerifica, qyTabelas, qyCampos, qyAltera, qyPercore: TUMZQuery;
   bUnificacao, permiteAlterarCodigo: Boolean;
   parametros: TParamsIni;
   i: Integer;
   S, CodigoAntigo: AnsiString;
begin
   inherited;
   sMensagemTabelas := '';

   permiteAlterarCodigo := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.AlterarCodigoPessoa', npAcesso, false );

   if permiteAlterarCodigo = false then
   begin
      Mensagem('Usuário sem permissão para alteração', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;
   
   // Apenas efetua a alteração se estiver em modo de edição
   if tblPessoa.State <> dsEdit then Exit;

   CodigoAntigo := tblPessoacd_pessoa.AsString;

   // Instancia as querys necessárias
   DM.CriarConsulta(qyVerifica);
   DM.CriarConsulta(qyTabelas);
   DM.CriarConsulta(qyCampos);
   DM.CriarConsulta(qyAltera);
   DM.CriarConsulta(qyPercore);

   // Configuração padrão das querys
   qyTabelas.ParamCheck := false;
   qyCampos.ParamCheck := false;

   { Define os campos que serão verificados ao alterar o código da pessoa em todas as tabelas }
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
   slCamposAlteracao.Add('codprofessor');
   slCamposAlteracao.Add('cd_professor_original');
   slCamposAlteracao.Add('cd_usuario');
   slCamposAlteracao.Add('cd_resp');
   slCamposAlteracao.Add('cd_pessoa_matriculou');

   { Define quais tabelas serão ignoradas nessa varredura }
   slTabelasIgnorar := TStringList.Create();
   slTabelasIgnorar.Add('diario_logs');
   slTabelasIgnorar.Add('sabio_integracao_pessoas');
   slTabelasIgnorar.Add('matriculas_notifica');
   slTabelasIgnorar.Add('tmp_ord_aulas');
   slTabelasIgnorar.Add('memory_diario_terminal_acessos');

   { Define quais tabelas devem fazer o ajuste (apenas no final) mas serão ignoradas na verificação de MyISAM }
   slTabelasExcessao := TStringList.Create();
   slTabelasExcessao.Add('fin_mov_cr');
   slTabelasExcessao.Add('itensretorno');

   { Questiona o usuário qual o novo código de pessoa a ser adotado }
   sNovoCodigo := tblPessoacd_pessoa.AsString;
   if not InputQuery('UNIMESTRE', 'Digite o novo código do Estudante: ', sNovoCodigo) then begin
      Exit;
   end;

   { Verifica se o código digitado não é o mesmo do anterior }
   if SameText(tblPessoacd_pessoa.AsString, sNovoCodigo) then
   begin
      Mensagem('O código informado é o mesmo código já existente para a pessoa, nenhuma ação foi realizada.', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   { Verifica se já existe alguma pessoa com o código escolhido }
   qyVerifica.Close;
   qyVerifica.SQL.Text := 'SELECT cd_pessoa, nm_pessoa, dt_nascimento FROM pessoas WHERE cd_pessoa = ' + sNovoCodigo;
   qyVerifica.Open;

   { Verifica se a pessoa que já existe alguma pessoa com o código escolhido é de mesmo nome e data de nascimento (para unificar)
     Caso existir então é realizado o processo de UNIFICAÇÃO de das pessoas (IRREVERSÍVEL pelo sistema) }
   if (qyVerifica.RecordCount > 0) then
   begin
      if (AnsiUpperCase(tblPessoanm_pessoa.AsString) = AnsiUpperCase(qyVerifica.FieldByName('nm_pessoa').AsString)) and
         (tblPessoadt_nascimento.AsDateTime = qyVerifica.FieldByName('dt_nascimento').AsDateTime) then
      begin
         bUnificacao := true;
      end else begin
         // Definir mensagem de confirmação de UNIFICACAO
         Mensagem('O sistema identificou que já existe uma pessoa com o código informado, no entanto, '+
                  'o nome ou data de nascimento são diferentes da pessoa que se está tentando alterar o código.'+#13+
                  'Caso deseje unificar essas pessoas, o nome e data de nascimento dessas pessoas precisam ser idênticos.', 'Atenção', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end else begin
      bUnificacao := false;
   end;


   // Verifica se é uma unificação ou apenas troca de código para elaborar as mensagens
   if bUnificacao then
   begin
      // Definir mensagem de confirmação de UNIFICACAO
      sMensagem :=
         'O sistema identificou que existe uma pessoa na base de dados '
         + 'com o mesmo nome e data de nascimento com o código informado, '
         + 'você deseja unificar essas pessoas em um único cadastro?' + #13
         + 'Lembrando que esse processo de unificação é IRREVERSÍVEL através '
         + ' do sistema, você deve ter certeza antes de confirmar essa ação.';         
   end else begin
      // Definir mensagem de confirmação de TROCA
      sMensagem :=
         'Tem certeza que deseja alterar o código do Estudante.'
         + #13
         + 'De: "'
         + tblPessoacd_pessoa.AsString
         + '" Para: "'
         + sNovoCodigo + '"';
   end;

   { Mensagem de confirmação da ação a ser realizada }
   if Mensagem(sMensagem, 'Confirmação', + MB_YESNO + MB_ICONWARNING) <> mrYes  then begin
      Exit;
   end;

   TfSplash.GetInstancia().ShowSplashScreen('Estruturas', 'Buscando estruturas a serem verificadas.');

   { Busca todas as tabelas (e suas informações) existentes na base de dados }
   qyTabelas.Close;
   qyTabelas.SQL.Text := 'SHOW TABLE STATUS FROM '+DM.db.Database;
   qyTabelas.Open;

   TfSplash.GetInstancia().CloseSplashScreen();

   // Verifica primeiramente se existem tabelas que estão em MySQL e precisam ser InnoDB
   if DM.verificaTabelasMyISAM(qyTabelas, slCamposAlteracao, slTabelasIgnorar, slTabelasExcessao) then Exit;

   { Cria o StringList de erros vazio para ir gravando os erros que ocorrem }
   slErros := TStringList.Create();

   { Abre uma transaction para efetuar as alterações}
   DM.db.StartTransaction;

   // Deabilita o controle de FKs
   qyAltera.SQL.Text := ' SET FOREIGN_KEY_CHECKS=0; ';
   qyAltera.ExecSQL();

   { Apaga a pessoa que será unificada para não conflitar códigos na tabela de pessoas }
   if bUnificacao then
   begin
      try
         qyAltera.Close;
         qyAltera.Sql.Text := 'DELETE FROM pessoas WHERE cd_pessoa = ' + tblPessoacd_pessoa.AsString;
         qyAltera.ExecSQL;

         //Retira Contatos-Pessoas
         qyAltera.Close;
         qyAltera.Sql.Text := 'DELETE FROM contatos_pessoas WHERE cd_pessoa = ' + tblPessoacd_pessoa.AsString;
         qyAltera.ExecSQL;

         //Retira o grupo dela e move para a pessoa que ira ficar usando replace (cria se não tiver)
         qyPercore.Close;
         qyPercore.Sql.Text := 'SELECT cd_grupo, cd_coligada FROM nu_grupos_pessoas WHERE cd_pessoa = ' + tblPessoacd_pessoa.AsString;
         qyPercore.Open;

         while not qyPercore.Eof do
         begin
            qyAltera.Close;
            qyAltera.Sql.Text := 'REPLACE INTO nu_grupos_pessoas (cd_grupo, cd_pessoa, cd_coligada) VALUES '+
               '('+qyPercore.fieldbyname('cd_grupo').asstring + ','+sNovoCodigo+','+qyPercore.fieldbyname('cd_coligada').asstring+') ';
            qyAltera.ExecSQL;


            qyPercore.Next;
         end;

         qyAltera.Close;
         qyAltera.Sql.Text := 'DELETE FROM nu_grupos_pessoas WHERE cd_pessoa = ' + tblPessoacd_pessoa.AsString;
         qyAltera.ExecSQL;


         //Retira (se necessario) da fin_cobrança
         qyAltera.Close;
         qyAltera.Sql.Text := 'SELECT count(cd_cobranca) as cobranca, min(cd_cobranca) as cobramin FROM fin_cobranca WHERE cd_pessoa in (' +
                              tblPessoacd_pessoa.AsString  + ',' +  sNovoCodigo + ')';
         qyAltera.Open;

         if (not(qyAltera.FieldByName('cobranca').IsNull) AND (qyAltera.FieldByName('cobranca').AsInteger = 2)) then
         begin
            cobrancaMinima := qyAltera.FieldByName('cobramin').AsString;
            qyAltera.Close;
            qyAltera.Sql.Text := 'DELETE FROM fin_cobranca WHERE cd_cobranca = ' + cobrancaMinima;
            qyAltera.ExecSQL;
         end;

      except
      on E : Exception do
         slErros.Add('Não foi possível remover/unificar a pessoa '+tblPessoanm_pessoa.AsString+' ('+tblPessoacd_pessoa.AsString+') - Erro: '+E.Message);
      end;
   end;

   TfSplash.GetInstancia().ShowSplashScreen('Ajustando', 'Ajustando '+IntToStr(qyTabelas.RecordCount)+' tabelas.');



   qyAltera.Close;
   qyAltera.SQL.Text := '';
   qyAltera.SQL.Text := ' UPDATE Pessoas' +
      ' SET cd_pessoa_antigo = ' + tblPessoacd_pessoa.AsString +
      ' WHERE cd_pessoa = ' + tblPessoacd_pessoa.AsString;
   qyAltera.ExecSQL();

   // Varre a lista de tabelas se ja não ocorreu erro
   if(slErros.Count = 0) then
   begin
      qyTabelas.First;
      while not qyTabelas.Eof do
      begin

         TfSplash.GetInstancia().SetSplashText('Processando '+IntToStr(qyTabelas.RecNo)+' de '+IntToStr(qyTabelas.RecordCount)+'.');

         // Verifica se a Engine da tabela é NULL (views), nesse caso ignora elas
         if qyTabelas.Fields[1].IsNull then
         begin
            qyTabelas.Next;
            continue;
         end;

         // Ignora tabelas prédefinidas para não serem alteradas
         if (slTabelasIgnorar.IndexOf(qyTabelas.Fields[0].AsString) > -1) or
            (slTabelasExcessao.IndexOf(qyTabelas.Fields[0].AsString) > -1) then
         begin
            qyTabelas.Next;
            continue;
         end;


         { Busca todos os campos da tabela sendo varrida }
         qyCampos.Close;
         qyCampos.SQL.Text := 'SHOW FIELDS FROM ' + qyTabelas.Fields[0].AsString;
         qyCampos.Open;

         // Varre a lista de campos encontrados para a tabela
         while not qyCampos.Eof do
         begin

            { Verifica se o campo NÃO esta previsto na lista de
              campos esperados para alteração pula ele }
            if slCamposAlteracao.IndexOf( qyCampos.FieldByName('Field').AsString ) = -1 then
            begin
               qyCampos.Next;
               continue;
            end;

            { Tenta efetuar a alteração do código da pessoa
              - Caso conseguir efetuar a alteração continua seguindo
                com as verificações nos próximos campos
              - Caso NÃO conseguir efetuar a alteração
                (por motivo de chave ou qualquer outro) é abortada a operação }
            try
               // Atualiza o campo do código antigo de pessoa para o novo código informado
               qyAltera.SQL.Text := ' UPDATE ' + qyTabelas.Fields[0].AsString +
                                    ' SET ' + qyCampos.FieldByName('Field').AsString + '  = ' + sNovoCodigo +
                                    ' WHERE ' + qyCampos.FieldByName('Field').AsString + ' = ' + tblPessoacd_pessoa.AsString;
               qyAltera.ExecSQL();


               
            except
            on E : Exception do
            begin
               // Se não conseguiu alterar os dados por algum motivo
               // REMOVE OS DADOS DA TABELA QUE HOUVE O ERRO
               // CHAMADO: 113379
               if qyTabelas.Fields[0].AsString <> 'pessoas' then  begin

                  qyAltera.SQL.Text :=
                     ' DELETE FROM '
                     + qyTabelas.Fields[0].AsString +
                     ' WHERE '
                     + qyCampos.FieldByName('Field').AsString + ' = '
                     + tblPessoacd_pessoa.AsString;

                  qyAltera.ExecSQL();

               end;

               //Verificar erros: - Erro: '+E.Message
               //slErros.Add('tabela:'+qyTabelas.Fields[0].AsString);
            end;

            end;

           qyCampos.Next;
         end;

         qyTabelas.Next;
      end;
   end;

   TfSplash.GetInstancia().CloseSplashScreen();

   // Habilita o controle de FKs
   try
      qyAltera.SQL.Text := ' SET FOREIGN_KEY_CHECKS=1; ';
      qyAltera.ExecSQL();
   except on E : Exception do
      slErros.Add('Não foi possível reativar as Foreign Keys novamente - Erro: '+E.Message);
   end;

   //Busca dados das tabelas traduzidas
   try
      qyAltera.SQL.Text := ' SELECT * FROM nu_tabelas';
      qyAltera.Open();
   except on E : Exception do
      slErros.Add('Não foi possível buscas os dados das tabelas traduzidas '+E.Message);
   end;


   // Comita as alterações realizadas na transaction
   if slErros.Count > 0 then
   begin
      // Volta as alterações realizadas (pois ocorreu erros)
      Dm.db.Rollback;

      // Monta a mensagem de erros com todos erros gerados
      for i := 0 to slErros.Count-1 do
      begin
         if(Pos('tabela',slErros[i]) > 0)then
         begin
            if(sMensagemTabelas = '') then
            begin
               sMensagemTabelas := 'Não foi possivel atualizar o código da pessoa na(s) seguinte(s) estrutura(s):';
            end;

            slErros[i] := ReplaceStr(slErros[i],'tabela:','');
            if(qyAltera.Locate('ds_nome_tabela',slErros[i],[]) = true) then
            begin
               sMensagemTabelas := sMensagemTabelas + #13 + ' ' + qyAltera.FieldByName('ds_nome_traduzido').AsString + ', ' + qyAltera.FieldByName('ds_observacao').AsString;
            end else begin
               sMensagemTabelas := sMensagemTabelas + #13 + ' ' + slErros[i] + ';';
            end;

         end else begin
            sMensagemErro := sMensagemErro + #13#13 + slErros[i];
         end;
      end;

      // Mostra os erros ocorridos
      parametros.titulo := 'Atenção';
      parametros.opcoes := (BT_OK + ICO_ERROR);
      parametros.mensagens.msgPrincipal := sMensagemErro + #13 + sMensagemTabelas;
      parametros.mensagens.msgTopo := 'Não foi possível realizar essa operação pelos seguintes motivos:'+#13;
      parametros.mensagens.msgRodape := '';
      parametros.dimensao.altura := 350;
      parametros.dimensao.largura := 600;

      TfrmMensagem.create(Self, parametros).ShowModal;
   end else begin
      // Altera o código da pessoa nas tabelas de excessão (apenas quando o resto do processo já foi concluído)
      alterarCodPessoaTabelasExcessao(slTabelasExcessao, slCamposAlteracao, sNovoCodigo);

      atualizaCamposExtrasCodigo(tblPessoacd_pessoa.asInteger, StrToInt(sNovoCodigo));

      Dm.db.Commit;

      // Atualiza os dados da tela para os dados do código da pessoa digitada
      tblPessoa.Close;
      tblPessoa.Sql.Text := 'SELECT * FROM pessoas WHERE cd_pessoa = ' + sNovoCodigo;
      tblPessoa.Open;

      // Verifica se é unificação ou troca de código para exibir a mensagem de sucesso
      if bUnificacao then
      begin
         S := Format(LogUnificacaoCodigoFmt, [CodigoAntigo, sNovoCodigo, CodigoAntigo]);
         DM.setLog(1001, 'Alteracao', sNovoCodigo, DM.UsuarioLogado.ColigadaLogada, S);

         Mensagem('Código unificado com sucesso!', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);
      end else begin
         S := Format(LogMudancaCodigoFmt, [CodigoAntigo, sNovoCodigo]);
         DM.setLog(1001, 'Alteracao', sNovoCodigo, DM.UsuarioLogado.ColigadaLogada, S);
         
         Mensagem('Código alterado com sucesso!', 'UNIMESTRE', MB_OK + MB_ICONEXCLAMATION);
      end;
   end;

end;

procedure Tfrm_Pessoas.alterarCodPessoaTabelasExcessao(slTabelasExcessao, slCamposAlteracao: TStringList; sNovoCodigo: String);
var
   i: Integer;
   qyCampos, qyAltera: TUMZQuery;
begin
   DM.CriarConsulta(qyCampos);
   DM.CriarConsulta(qyAltera);

   for i := 0 to slTabelasExcessao.Count - 1 do
   begin
      { Busca todos os campos da tabela sendo varrida }
      qyCampos.Close;
      qyCampos.SQL.Text := 'SHOW FIELDS FROM ' + slTabelasExcessao[i];
      qyCampos.Open;

      // Varre a lista de campos encontrados para a tabela
      while not qyCampos.Eof do
      begin

         { Verifica se o campo NÃO esta previsto na lista de
           campos esperados para alteração pula ele }
         if slCamposAlteracao.IndexOf( qyCampos.FieldByName('Field').AsString ) = -1 then
         begin
            qyCampos.Next;
            continue;
         end;

         { Tenta efetuar a alteração do código da pessoa
           - Caso conseguir efetuar a alteração continua seguindo
             com as verificações nos próximos campos
           - Caso NÃO conseguir efetuar a alteração
             (por motivo de chave ou qualquer outro) é abortada a operação }
         try
            // Atualiza o campo do código antigo de pessoa para o novo código informado
            qyAltera.SQL.Text := ' UPDATE ' + slTabelasExcessao[i] +
                                 ' SET ' + qyCampos.FieldByName('Field').AsString + '  = ' + sNovoCodigo +
                                 ' WHERE ' + qyCampos.FieldByName('Field').AsString + ' = ' + tblPessoacd_pessoa.AsString;
            qyAltera.ExecSQL();
         except
         on E : Exception do
            Mensagem('Não foi possível atualizar o código da pessoa na tabela "'+slTabelasExcessao[i]+'" - Erro: '+E.Message, 'Atenção', MB_OK + MB_ICONWARNING);
         end;

        qyCampos.Next;
      end;
   end;      
end;

procedure Tfrm_Pessoas.atualizaCamposExtrasCodigo(cd_pessoa_antigo: Integer; novo_cd_pessoa: Integer);
CONST
   SQL_CAMPOS_EXTRAS = ''+
   'SELECT                                                  '+
   '  pc.cd_campo, pc.cd_pessoa                             '+
   'FROM                                                    '+
	'  pessoas_campos_adicionais pca                         '+
   'INNER JOIN pessoas_cadastro pc ON (pca.CD_CAMPO = pc.cd_campo) '+
   'WHERE                                                   '+
   '  pca.ds_tipo LIKE "P"                                  '+
   '  AND pc.ds_conteudo LIKE :cd_pessoa_antigo             ';

   SQL_ATUALIZA_CAMPO = ''+
   'UPDATE                          '+
   '  pessoas_cadastro              '+
   'SET ds_conteudo = :ds_conteudo  '+
   'WHERE                           '+
	'  cd_pessoa = :cd_pessoa        '+
   '  AND cd_campo = :cd_campo      ';

var
   qryUpdate, qryAtualizaCamposExtras: TUMZQuery;
begin

   dm.CriarConsulta(qryAtualizaCamposExtras);

   qryAtualizaCamposExtras.SQL.Text := SQL_CAMPOS_EXTRAS;

   qryAtualizaCamposExtras.ParamByName('cd_pessoa_antigo').AsInteger := cd_pessoa_antigo;
   qryAtualizaCamposExtras.Open;

   qryAtualizaCamposExtras.First;

   DM.CriarConsulta(qryUpdate);

   while not(qryAtualizaCamposExtras.Eof) do
   begin
      qryUpdate.SQL.Text := SQL_ATUALIZA_CAMPO;

      qryUpdate.ParamByName('ds_conteudo').asString := IntToStr(novo_cd_pessoa);
      qryUpdate.ParamByName('cd_pessoa').asString := qryAtualizaCamposExtras.FieldByName('cd_pessoa').asString;
      qryUpdate.ParamByName('cd_campo').asString := qryAtualizaCamposExtras.FieldByName('cd_campo').asString;

      qryUpdate.ExecSQL;

      qryAtualizaCamposExtras.Next;
   end;
end;

procedure Tfrm_Pessoas.atualizaSenhaInsercao;
var
   qryAtualiza : TUMZQuery;
begin

   if(tblPessoadt_nascimento.AsString = '') then
   begin
      exit;
   end;

   DM.CriarConsulta(qryAtualiza);
   qryAtualiza.SQL.Add('UPDATE pessoas SET ds_senha = MD5(:data), sn_senha_provisoria = ''S'' where cd_pessoa = :codigo' );
   qryAtualiza.ParamByName('data').AsString := FormatDateTime('ddmmyy', tblPessoadt_nascimento.AsDateTime);
   qryAtualiza.ParamByName('codigo').AsString := tblPessoacd_pessoa.AsString;
   qryAtualiza.ExecSQL;
   FreeAndNil(qryAtualiza);
end;

procedure Tfrm_Pessoas.dbTipoCertidaoChange(Sender: TObject);
begin
   if dbTipoCertidao.ItemIndex <> -1 then
   begin
      dbMatricula.Enabled := True;
   end
   else
   begin
      dbMatricula.Enabled := False;
   end;
end;

procedure Tfrm_Pessoas.DelphiTwain1AcquireCancel(Sender: TObject;
  const Index: Integer);
begin
   if DM.GetUnimestreINI.ReadString('Digitalizacao', 'ForcarFechamento', 'N') = 'S' then begin
      DelphiTwain1.Source[Origem].Enabled := False;
      DelphiTwain1.Source[Origem].Loaded := False;
   end;
end;

procedure Tfrm_Pessoas.DelphiTwain1AcquireError(Sender: TObject;
  const Index: Integer; ErrorCode, Additional: Integer);
begin
   Mensagem('Ocorreu um erro na transferência!!' + IntTostr(errorCode) + ' (' + IntToStr(Additional) + ')');
   if (Imagem <> nil) then begin
      FreeAndNil(Imagem);
   end;
end;

procedure Tfrm_Pessoas.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
   if Imagem = nil then
   begin
      Imagem := TJPEGImage.Create();
   end;

   { Cria um componente JPEG }
   Imagem := TJPEGImage.Create;
   
   { Abre a imagem do OpenPictureDialog para o componente JPEG criado anteriormente }
   Imagem.Assign(Image);

   { Propriedades para fechar janela}
   if DM.GetUnimestreINI.ReadString('Digitalizacao', 'ForcarFechamento', 'N') = 'S' then begin
      DelphiTwain1.Source[Origem].Enabled := False;
      DelphiTwain1.Source[Origem].Loaded := False;
   end;

   {Parametros para editar imagem}
   ciFoto.Visible:=true;
   ciFoto.Picture.Assign(Imagem);
   imageFoto.Visible:= false;
   btnAplicar.Enabled:= true;
   btnAplicar.Visible:= true;
   btnCancelar.Enabled:=true;
   btnCancelar.Visible:=true;

   { Libera da memória os componentes que foram criados }
   FreeAndNil(Imagem);

   Cancel := True;
end;

procedure Tfrm_Pessoas.ResizeFoto(var oJPG: TJPEGImage; iMaxWidth, iMaxHeigth: Integer);
var
  oBmp: TBitmap;
  iW, iH: Integer;
  lP: Double;
begin
   try
     oBmp := TBitmap.Create();
     if ((oJPG.Width > iMaxWidth) or (oJPG.Height > iMaxHeigth)) then
     begin
       lP := (oJPG.Height / oJPG.Width);
       iW := iMaxWidth;
       iH := oJPG.Height - Round((oJPG.Width - iMaxWidth) * lP);
       if (iH > iMaxHeigth) then
       begin
         lP := (iH / iW);
         iW := Round(iW /lP);
         iH := iMaxHeigth;
       end;
       oBmp.Width := iW;
       oBmp.Height := iH;
       oBmp.Canvas.StretchDraw(Rect(0,0, oBmp.Width, oBmp.Height), oJPG);
       oJPG.Assign(oBmp);
       oJPG.CompressionQuality := 80;
       oJPG.Compress();
     end
     else begin
         oBmp.Assign(oJPG);
         oJPG.Assign(oBmp);
         oJPG.CompressionQuality := 80;
         oJPG.Compress();
     end;
   finally
      oBmp.Free;
   end;
end;

{ dbNomeKeyPress }


procedure Tfrm_Pessoas.verificar_contatos_padroes(CodAluno : Integer);
const
   SQL_VERIFICAR_CONTATOS_PADROES =
      ' INSERT IGNORE INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) ' +
      ' SELECT :cd_pessoa, ct.cd_contato, '''' ' +
      ' FROM contatos_tipos ct ' +
      '      LEFT join contatos_pessoas cp ON (ct.cd_contato = cp.cd_contato AND cp.cd_pessoa = :cd_pessoa) ' +
      ' WHERE cp.cd_pessoa IS NULL AND ct.sn_padrao = ''S'' ';
var
   qyExecutarVerificacaoContatosPadroes: TUMZQuery;
begin
   DM.CriarConsulta(qyExecutarVerificacaoContatosPadroes);
   qyExecutarVerificacaoContatosPadroes.SQL.Text := SQL_VERIFICAR_CONTATOS_PADROES;
   qyExecutarVerificacaoContatosPadroes.ParamByName('cd_pessoa').AsInteger := CodAluno;
   qyExecutarVerificacaoContatosPadroes.ExecSQL();

   FreeAndNil(qyExecutarVerificacaoContatosPadroes);

   VSTContatosEditor.LoadPessoa(
      TPessoa.Create(CodAluno),
      NOT(PodeAlterarContatos(CodAluno, iPermissao))
   );
end;
 

procedure Tfrm_Pessoas.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
{ Teclas de Atalho }
begin

  case Key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2 : if btIncluir_Pessoa.Enabled then btIncluir_PessoaClick( nil );
      VK_F3 : if btAlterar_Pessoa.Enabled then btAlterar_PessoaClick( nil );
      VK_F9 : if btExcluir_Pessoa.Enabled then btExcluir_PessoaClick( nil );
      VK_F5 : if btSalvar_Pessoa.Enabled then btSalvar_PessoaClick( nil );
      VK_F6 : if btCancelar_Pessoa.Enabled then btCancelar_PessoaClick( nil );
      VK_F8 : if btBuscar_Pessoa.Enabled then btBuscar_PessoaClick( Sender );
      VK_F10: if sbMaisInformacoes.Enabled then sbMaisInformacoesClick( Sender );
      VK_F12 : if btFechar_Pessoa.Enabled then btFechar_PessoaClick( nil );
  end;

end; { FormKeyDown }

procedure Tfrm_Pessoas.imageFotoDblClick(Sender: TObject);
var
  Imagem:TJPEGImage;
begin
   { Procurar a foto da pessoa }
   // if (tblPessoacd_pessoa.AsInteger <> 0)  then
      // tblPessoa.Edit;
      
   if tblPessoa.State = dsInsert then
   begin
      if DM.UsuarioLogado.TemPermissao( 1135, npIncluir, false ) = false then
      begin
         exit;
      end;
   end;

   if tblPessoa.State = dsEdit then
   begin
      if DM.UsuarioLogado.TemPermissao( 1135, npAlterar, false ) = false then
      begin
         exit;
      end;
   end;
   
//   if (tblPessoa.State = dsInsert) or (tblPessoa.State = dsEdit)  then
//   begin
   AbrirFoto.FileName := '';
      if AbrirFoto.Execute Then Begin
         { Cria um componente JPEG }
         bComImagem :=true;
         Imagem := TJPEGImage.Create;
         { Abre a imagem do OpenPictureDialog para o componente JPEG criado anteriormente }

         Imagem.LoadFromFile(AbrirFoto.FileName);

         { Apenas abre a imagem no TImage que existe na tela (Name: Foto) }
         ciFoto.Visible:=true;
         ResizeFoto(Imagem, 500, 500);
         ciFoto.Picture.Assign(Imagem);
         ciFoto.Border := True;
         ciFoto.Border := False;
         imageFoto.Visible:= false;

         btnConectar.Visible := False;
         btnCapturar.Visible := False;
         btnAplicar.Enabled := True;
         btnCancelar.Enabled := True;
         btnDigitalizar.Visible := false;

         { Libera da memória os componentes que foram criados }
         FreeAndNil(Imagem);
      End else
      //
//   end;
end;

procedure Tfrm_Pessoas.lbVinculoExternoClick(Sender: TObject);
begin
   pnVinculosExterno.Visible := NOT(pnVinculosExterno.Visible);

   if pnVinculosExterno.Visible then
   begin
      pnVinculosExterno.Visible := False;
      lbVinculoExterno.Visible := False;
      pnVinculosExterno.Visible := True;
      lbVinculoExterno.Visible := True;
   end;
end;

procedure Tfrm_Pessoas.SpeedButton1Click(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1004, npAcesso, True ) then Exit;
  Application.CreateForm(Tfrm_Empresas, frm_Empresas);   
end;

procedure Tfrm_Pessoas.btnAdicionarVinculoExternoClick(Sender: TObject);
const
   SQL_BUSCAR_SISTEMAS_EXTERNOS =
      'SELECT cd_sistema, ds_sistema FROM nu_integracao_externa ORDER BY ds_sistema';
   SQL_INSERIR_VINCULO_PESSOA_EXTERNA =
      'INSERT INTO pessoas_integracao_externa (cd_pessoa, cd_pessoa_externa, cd_sistema) VALUES (:cd_pessoa, :cd_pessoa_externa, :cd_sistema)';
var
   qyListaSistemas : TUMZReadOnlyQuery;
   qyInserirVinculo : TUMZQuery;
   listaSistemas : TListInputQueryCheck;
   empresaSelecionada : TInputQueryCheck;
   codigoPessoaExterna: integer;
begin
   DM.CriarConsulta(qyListaSistemas);
   listaSistemas := TListInputQueryCheck.Create();
   qyListaSistemas.SQL.Text := SQL_BUSCAR_SISTEMAS_EXTERNOS;
   qyListaSistemas.Open();
   while not qyListaSistemas.Eof do
   begin
      listaSistemas.Add(TInputQueryCheck.Create(
         qyListaSistemas.FieldByName('cd_sistema').AsInteger,
         qyListaSistemas.FieldByName('ds_sistema').AsString
      ));
      qyListaSistemas.Next();
   end;

   FreeAndNil(qyListaSistemas);

   if NOT(TGeneral.InputQueryListCheck('Seleção de Sistema Externo', 'Selecione qual a empresa que você deseja adicionar o vínculo para esta pessoa:', listaSistemas, True, 11)) then
   begin
      Exit;
   end;

   empresaSelecionada := TInputQueryCheck(listaSistemas.GetObjetosSelecionados().Items[0]);

   if NOT(TGeneral.InputInteger('Informe o código da pessoa', 'Informe o código da pessoa no sistema externo ' + empresaSelecionada.Descricao + ':', codigoPessoaExterna)) then
   begin
      Exit;
   end;

   DM.CriarConsulta(qyInserirVinculo);
   qyInserirVinculo.SQL.Text := SQL_INSERIR_VINCULO_PESSOA_EXTERNA;
   qyInserirVinculo.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
   qyInserirVinculo.ParamByName('cd_pessoa_externa').AsString := inttostr(codigoPessoaExterna);
   qyInserirVinculo.ParamByName('cd_sistema').AsInteger := empresaSelecionada.Codigo;
   qyInserirVinculo.ExecSQL;

   FreeAndNil(qyInserirVinculo);

   qyVinculosExterno.Close();
   qyVinculosExterno.Open();
end;

function Tfrm_Pessoas.Tem_matricula(codigo: integer): boolean;
   function HasRegistrosSQL(const SQL_CONSULTA: String): Boolean;
   var
      qyHasRegistrosSQL: TUMZReadOnlyQuery;
   begin
      DM.CriarConsulta( qyHasRegistrosSQL );

      qyHasRegistrosSQL.SQL.Text := SQL_CONSULTA;
      qyHasRegistrosSQL.ParamByName('cd_pessoa').AsInteger := codigo;
      qyHasRegistrosSQL.Open();

      Result := ( qyHasRegistrosSQL.FieldByName('registros').AsInteger > 0 );

      FreeAndNil( qyHasRegistrosSQL );
   end;
const
   SQL_CONSULTA_MATRICULAS =
      ' SELECT COUNT(*) registros FROM matriculas WHERE codigoaluno = :cd_pessoa ';
   SQL_CONSULTA_MENSALIDADES =
      ' SELECT '
    + '    COUNT(*) registros '
    + ' FROM '
    + '    mensalidades m '
    + ' WHERE '
    + '( m.codigoaluno = :cd_pessoa OR m.cd_resp = :cd_pessoa )';
   SQL_CONSULTA_PROFESSORES =
      ' SELECT COUNT(*) registros FROM turmasprofessores WHERE professor = :cd_pessoa ';
   SQL_CONSULTA_CONTAS_PAGAR =
      ' SELECT COUNT(*) registros FROM fin_contas_pagar WHERE cd_pessoa = :cd_pessoa ';
   SQL_CONSULTA_RESP_FINANCEIRO =
      ' SELECT COUNT(*) registros FROM pessoas WHERE cd_resp_finan = :cd_pessoa AND cd_pessoa <> cd_resp_finan ';
   SQL_CONSULTA_RESP_ACADEMICO =
      ' SELECT COUNT(*) registros FROM pessoas WHERE cd_resp_acad = :cd_pessoa AND cd_pessoa <> cd_resp_acad ';
   SQL_CONSULTA_PAI =
      ' SELECT COUNT(*) registros FROM pessoas WHERE cd_pai = :cd_pessoa AND cd_pai <> cd_pessoa ';
   SQL_CONSULTA_MAE =
      ' SELECT COUNT(*) registros FROM pessoas WHERE cd_mae = :cd_pessoa AND cd_mae <> cd_pessoa ';
   SQL_CONSULTA_CONCURSADO =
      ' SELECT COUNT(*) registros FROM con_inscricoes WHERE cd_pessoa = :cd_pessoa ';
   SQL_CONSULTA_EVENTO =
      ' SELECT COUNT(*) registros FROM tam_inscricoes WHERE cd_pessoa = :cd_pessoa ';
   SQL_CONSULTA_REQUERENTE =
      ' SELECT COUNT(*) registros FROM req_registros WHERE cd_pessoa = :cd_pessoa ';
   SQL_CONSULTA_REQUERIMENTOS_TRAMITES =
      ' SELECT                '+
	   '    count(*) registros '+
      ' FROM                  '+
	   '    req_tramite rt     '+
      '    INNER JOIN nu_grupos_pessoas ngp ON (rt.cd_grupo = ngp.cd_grupo) '+
      ' WHERE                 '+
	   '    ngp.cd_pessoa = :cd_pessoa ';
Var
  sMsg : String;
begin

   result := false;

   sMsg := 'Não é possível excluir esta pessoa pelo(s) seguinte(s) motivo(s): ' + CHR(13) + CHR(13);

   if HasRegistrosSQL( SQL_CONSULTA_MATRICULAS ) then
   begin
      result := true;
      sMsg := sMsg + ' - Existem matrículas relacionadas a este cadastro.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_MENSALIDADES ) then
   begin
      result := true;
      sMsg := sMsg + ' - Existem títulos relacionados no contas a receber. ' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_PROFESSORES ) then
   begin
     result := true;
     sMsg := sMsg + ' - Existem turmas relacionadas a este professor.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_CONTAS_PAGAR ) then
   begin
     result := true;
     sMsg := sMsg + ' - Existem títulos relacionados no contas a pagar.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_RESP_FINANCEIRO ) then
   begin
      result := true;
      sMsg := sMsg + ' - Existem dependentes financeiros relacionados a este cadastro.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_RESP_ACADEMICO ) then
   begin
      result := true;
      sMsg := sMsg + ' - Existem dependentes acadêmicos relacionados a este cadastro.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_PAI ) then
   begin
      result := true;
      sMsg := sMsg + ' - Este cadastro é pai de um aluno da instituição.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_MAE ) then
   begin
      result := true;
      sMsg := sMsg + ' - Este cadastro é mãe de um aluno da instituição.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_CONCURSADO ) then
   begin
      result := true;
      sMsg := sMsg + ' - Este cadastro está inscrito em um concurso.' + CHR(13);
   end;

   if HasRegistrosSQL( SQL_CONSULTA_EVENTO ) then
   begin
      result := true;
      sMsg := sMsg + ' - Este cadastro está inscrito em um evento.' + CHR(13);
   end;

   if (HasRegistrosSQL( SQL_CONSULTA_REQUERENTE ))then
   begin
      result := true;
      sMsg := sMsg + ' - Este cadastro possuí requerimentos.' + CHR(13);
   end;

   if (HasRegistrosSQL( SQL_CONSULTA_REQUERIMENTOS_TRAMITES ))then
   begin
      result := true;
      sMsg := sMsg + ' - Este cadastro faz parte do gerenciamento de requerimentos.' + CHR(13);
   end;

   if result = true then begin
      Mensagem(sMsg, 'Atenção', MB_OK + MB_ICONWARNING);
   end;
end;

procedure Tfrm_Pessoas.VerificaBibliotecaTwain;
begin
   if not DelphiTwain1.LibraryLoaded then begin
      DelphiTwain1.LoadLibrary();
   end;
end;

{ Valida os emails digitados na grade de contatos }
function Tfrm_Pessoas.verificaCpfPassaporte: boolean;
var
   nacionalidade,
   passaporte,
   CPF: String;

   permiteCPFzerado: Boolean;
begin
   Result := True;

   nacionalidade := '';
   
   if pgPessoa.ActivePage = tsDadosPessoais then
   begin
      nacionalidade := dbNacionalidade.Text;
      passaporte := dbPassaporte.Text;
      CPF := tblPessoads_cpf.AsString;
   end
   else
   if pgPessoa.ActivePageIndex in [1,2] then
   begin
      Exit;
   end;
   
   permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado') = 'S');

   if ((LowerCase(nacionalidade) <> 'brasileira') AND (nacionalidade <> '')) then
   begin

      if (CPF <> '') and not(ValidaCPF(CPF)) then
      begin
         Mensagem(
            'Informe um CPF válido',
            Application.Title,
            MB_OK + MB_ICONSTOP,
            Handle
         );
         
         Result := false;
         Exit;
      end;

      if (CPF = '') and (passaporte = '') then
      begin
         Mensagem(
            'Informe um CPF ou um passaporte válido',
            'Aviso',
            MB_ICONWARNING + MB_OK,
            Handle
         );

         Result := False;
      end;
   end
   else
   begin
      //Se a nacionalidade for brasileira então valida somente o CPF.

      // Não informou CPF e permite em branco -> Aceito
      if (CPF = '') and (permiteCPFzerado) then
      begin
         Exit;
      end;

      // Não informou CPF e não permite em branco -> Não aceito
      if (CPF = '') and not(permiteCPFzerado) then
      begin
         Mensagem(
            'Informe um CPF',
            Application.Title,
            MB_ICONWARNING + MB_OK,
            Handle
         );
         
         Result := false;
         Exit;
      end;

      // Informou CPF, então valida
      if not ValidaCPF( CPF ) then
      begin
         Mensagem(
            'Informe um CPF válido',
            Application.Title,
            MB_ICONWARNING + MB_OK,
            Handle
         );
         
         Result := false;
      end;
   end;
end;

procedure Tfrm_Pessoas.dbNomeExit(Sender: TObject);
begin
   { Verificar se existe algum nome cadastrado }

   if tblPessoa.State <> dsInsert then Exit;

   if tblPessoanm_pessoa.AsString = '' then Exit;
   

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select cd_pessoa, nm_pessoa, ds_cpf, nm_pai from pessoas where nm_pessoa = :nome');
   qyTemp1.ParamByName('nome').AsString := tblPessoanm_pessoa.AsString;
   qyTemp1.Open;

   while not qyTemp1.Eof do
   Begin
      if Mensagem('Existe uma pessoa com o mesmo nome cadastrada no sistema.' + chr(13) +
                  '   Nome : ' + qyTemp1.FieldByName('nm_pessoa').AsString + '  (' + qyTemp1.FieldByName('cd_pessoa').AsString + ')' + chr(13) +
                  '   CPF : ' + qyTemp1.FieldByName('ds_cpf').AsString + chr(13) +
                  '   Nome do Pai : ' + qyTemp1.FieldByName('nm_pai').AsString + chr(13) + chr(13) +
                  'Deseja alterar este cadastro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
      = mrYes Then
      Begin
          tblPessoa.Cancel;
          tblPessoa.CLose;
          tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + qyTemp1.FieldByName('cd_pessoa').AsString;
          tblPessoa.Open;

          Exit;
      End;


      qyTemp1.Next;
   End;

end;

procedure Tfrm_Pessoas.sbMaisInformacoesClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  if (tblPessoa.State = dsInsert) then
  begin
     tblPessoa.Post;
  end;
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);
  if tblPessoacd_pessoa.AsInteger = 0 then
  begin
    Mensagem('Você precisa selecionar uma pessoa para poder executar esta ação',  'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;  

  if not frm_Pessoas_adicional.Montar_Dados('P', tblPessoacd_pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING);

  FreeAndNil(frm_pessoas_adicional);

end;

procedure Tfrm_Pessoas.sbPaisComboClick(Sender: TObject);
begin
   DBCheckBox10.Enabled := true;
   if sbPaisCombo.text = 'BRASIL' then
   begin
      DBCheckBox10.Enabled := false;
   end;
end;

procedure Tfrm_Pessoas.sbPaisComboCloseUp(Sender: TObject);
var
   i: Integer;
   qyAux: TUMZQuery;
   nascCerta: Boolean;
begin
   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := '                '+
   ' SELECT cd_pais, ds_nacionalidade '+
   ' FROM paises                      '+
   ' WHERE ds_pais = :ds_pais_atual   ';

   qyAux.ParamByName('ds_pais_atual').AsString :=
      tblPessoa.FieldByName('descPaisNasc').asString;

   qyAux.Open;

   carregaEndereco(qyAux.FieldByName('cd_pais').AsString, true);
   nascCerta := False;

   i:=0;
   
   for I := 0 to dbNacionalidade.Items.Count - 1 do
   begin
      if ((qyAux.FieldByName('ds_nacionalidade').asString) = (dbNacionalidade.Items[i])) then
      begin
         dbNacionalidade.ItemIndex :=
            dbNacionalidade.Items.IndexOf(qyAux.FieldByName('ds_nacionalidade').asString);
      end;
   end;
   sbPaisComboClick(self);
end;

procedure Tfrm_Pessoas.sbPaisComboExit(Sender: TObject);
var
   qyAux, qryAchaNacionalidade: TUMzQuery;
   I: integer;
   nascCerta: Boolean;
begin
   { Ao sair da combo de paises se tiver cadastrando na primeira vez ele trara a nacionalidade do pais indicado}

   if ((tblPessoa.State in [DsInsert])
      and (dbNacionalidade.ItemIndex = -1)
      and (tblPessoadescPaisNasc.AsString <> '')) then
   begin

      DM.CriarConsulta(qryAchaNacionalidade);

      qryAchaNacionalidade.SQL.Text := 'select ds_nacionalidade from paises where ds_pais = :nm_pais';
      qryAchaNacionalidade.ParamByName('nm_pais').AsString := tblPessoadescPaisNasc.AsString;
      qryAchaNacionalidade.Open;

      for I := 0 to dbNacionalidade.Items.Count - 1 do
      begin
         if dbNacionalidade.Items[i] = qryAchaNacionalidade.FieldByName('ds_nacionalidade').AsString then
            break;
      end;
      dbNacionalidade.ItemIndex := i;
   end;

   //Carrega estado e nacionalidade do pais selecionado, caso não tenha
   //estado e cidade são desabilitados os combobox.

      DM.CriarConsulta(qyAux);
   
   qyAux.SQL.Text := '                '+
   ' SELECT cd_pais, ds_nacionalidade '+
   ' FROM paises                      '+
   ' WHERE ds_pais = :ds_pais_atual   ';

   qyAux.ParamByName('ds_pais_atual').AsString :=
      tblPessoa.FieldByName('descPaisNasc').asString;

   qyAux.Open;

   carregaEndereco(qyAux.FieldByName('cd_pais').AsString,false);

   nascCerta := False;
   i:=0;
   
   for I := 0 to dbNacionalidade.Items.Count - 1 do
   begin
      if ((qyAux.FieldByName('ds_nacionalidade').asString) = (dbNacionalidade.Items[i])) then
      begin
         dbNacionalidade.ItemIndex :=
            dbNacionalidade.Items.IndexOf(qyAux.FieldByName('ds_nacionalidade').asString);
      end;
   end;

end;

procedure Tfrm_Pessoas.gravalog(bAlterouLogin : boolean);
var
   operacao,msgLogPessoa,msgLogFom,formusado: String;
   campoCheck: boolean;
begin
   if jaGerouLog then
      exit;
      
   operacao := 'Alteração';
   msgLogFom := '[Pessoas > Cadastro] Alteração de pessoa de codigo: ' + tblPessoacd_pessoa.AsString + ', ';

   if tblPessoa.State in [DsInsert] then
   begin
      operacao := 'Inclusão';
      msgLogFom := '[Pessoas > Cadastro] Inclusão de pessoa de codigo: ' + tblPessoacd_pessoa.AsString + ', ';
   end;
    {
   if dbeNomePessoa.Text <> nm_pessoaInicial then
   begin
      msgLogPessoa := 'Nome da pessoa: ' + nm_pessoaInicial + ' para ' + dbeNomePessoa.Text + ', ';
   end;
     }
  if (self = frm_Pessoas) then
  begin

      msgLogPessoa := msgLogPessoa + DM.geraLogForm(self,'tsDadosPessoais',operacao);
      msgLogPessoa := msgLogPessoa + DM.geraLogForm(self,'tsComplementares',operacao);
      msgLogPessoa := msgLogPessoa + DM.geraLogForm(self,'tsParentes',operacao);
  end;

  if(self = frm_Alunos) then
  begin

   operacao := 'Alteração';
   msgLogFom := '[Pessoas > Alunos] Alteração de pessoa de codigo: ' + tblPessoacd_pessoa.AsString + ', ';


   if tblPessoa.State in [DsInsert] then
   begin
      operacao := 'Inclusão';
      msgLogFom := '[Pessoas > Alunos] Inclusão de pessoa de codigo: ' + tblPessoacd_pessoa.AsString + ', ';
   end;

       msgLogPessoa := msgLogPessoa + DM.geraLogForm(frm_Alunos,'tsDadosPessoais',operacao);
       msgLogPessoa := msgLogPessoa + DM.geraLogForm(frm_Alunos,'tsParentes',operacao);
       msgLogPessoa := msgLogPessoa + DM.geraLogForm(frm_Alunos,'tsComplementares',operacao);
  end;

  if(self = frm_professores ) then
  begin

   operacao := 'Alteração';
   msgLogFom := ' [Pessoas > Professores/Funcionários] Alteração de pessoa de codigo: ' + tblPessoacd_pessoa.AsString + ', ';


   if tblPessoa.State in [DsInsert] then
   begin
      operacao := 'Inclusão';
      msgLogFom := ' [Pessoas > Professores/Funcionários] Inclusão de pessoa de codigo: ' + tblPessoacd_pessoa.AsString + ', ';
   end;

       msgLogPessoa := msgLogPessoa + DM.geraLogForm(frm_professores,'tsDadosPessoais',operacao);
       msgLogPessoa := msgLogPessoa + DM.geraLogForm(frm_professores,'tsParentes',operacao);
       msgLogPessoa := msgLogPessoa + DM.geraLogForm(frm_professores,'tsComplementares',operacao);
  end;


   if(msgLogPessoa <> '') OR (msgLogLoginSenha <> '') then
   begin
      DM.setLog(
         1006,
         operacao,
         tblPessoacd_pessoa.AsString,
         DM.UsuarioLogado.ColigadaLogada,
         msgLogFom + msgLogPessoa + msgLogLoginSenha
      );
   end
   else
   begin
      if (not bAlterouLogin) then
      begin
         msgLogPessoa:= 'Revisão de cadastro (Nenhum dado foi alterado)';
         DM.setLog(1006, operacao, tblPessoacd_pessoa.AsString , DM.UsuarioLogado.ColigadaLogada , msgLogFom + msgLogPessoa);
      end;
   end;
   jaGerouLog := true;
end;


procedure Tfrm_Pessoas.sbPaisAtualComboCloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString :=
      tblPessoa.FieldByName('descPais').asString;

   qyAux.Open;

   DM.tblEstados2.Close;
   DM.tblEstados2.SQL.Text := ''+
      'SELECT * '+
      'FROM estados ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado';

   DM.tblEstados2.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados2.Open;

   tblMunicipioAtual.Close;
//   tblMunicipioAtual.ParamByName('uf_atual').AsString := DM.tblEstados2.FieldByName('ds_uf').AsString;
   tblMunicipioAtual.ParamByName('uf_atual').AsString := '';
   tblMunicipioAtual.Open;

   if (DM.tblEstados2.FieldByName('cd_pais').AsString = '') then
   begin
      tblPessoads_bairro.AsString := '';
   end;

end;

procedure Tfrm_Pessoas.sbCancelarClick(Sender: TObject);
var
  BS: TStream;
  Imagem:TJPEGImage;
begin
   { Apenas abre a imagem no TImage que existe na tela (Name: Foto) }
   ciFoto.Visible := false;
   ciFoto.Picture.Assign(nil);

   imageFoto.visible := True;
   try
      { Cria o componente BLOBStream baseado no campo qyPessoasFoto em modo leitura (Note: BMREAD) }
      BS := tblPessoa.CreateBlobStream(tblPessoaim_pessoa, bmRead);

      { Cria o componente JPEG }
      Imagem := TJPEGImage.Create;
      { Abre no componente JPEG baseado no Stream criado anteriormente que já possui a imagem da base}
      Imagem.LoadFromStream(BS);

      { Apenas abre no componente TImage a foto que está aberta no componente JPEG (Imagem)}
      imageFoto.Picture.Assign(Imagem);
   except
      imageFoto.visible := false;
   end;

   { Libera da memória os componentes criados }
   FreeAndNil(BS);
   FreeAndNil(Imagem);

   imgWebCam.Visible := False;
   TfWebcamDriver.Deactivate;

end;

procedure Tfrm_Pessoas.sbCepClick(Sender: TObject);
begin

  if (tblPessoa.State <> dsInsert) and (tblPessoa.State <> dsEdit) then
    Abort;

  Application.CreateForm(TfrmSelCep, frmSelCep);

  frmSelCep.ShowModal;

  if frmSelCep.flgSearch then
  begin
    tblPessoa.FieldByName('ds_cep').AsString          := frmSelCep.qyCep.FieldByName('ds_cep').AsString;
    tblPessoa.FieldByName('ds_estado').AsString       := frmSelCep.qyCep.FieldByName('ds_uf').AsString;
    tblPessoa.FieldByName('ds_cidade').AsString       := frmSelCep.qyCep.FieldByName('nm_cidade').AsString;
    tblPessoa.FieldByName('cd_municipio').AsInteger   := frmSelCep.qyCep.FieldByName('cd_municipio').AsInteger;
    tblPessoa.FieldByName('ds_bairro').AsString       := frmSelCep.qyCep.FieldByName('nm_bairro').AsString;
    tblPessoa.FieldByName('ds_logradouro').AsString   := frmSelCep.qyCep.FieldByName('nm_logradouro').AsString;
    tblPessoa.FieldByName('ds_pais').AsString         := frmSelCep.qyCep.FieldByName('ds_pais').AsString;
  end;

  //Atualiza combobox tipo logradouro.
  if (tblTpLogradouro.Locate('ds_logradouro', frmSelCep.qyCep.FieldByName('ds_logradouro').asString, [loCaseInsensitive,loPartialKey])) then
  begin
     dbTipoLogradouro.KeyValue := tblTpLogradouro.FieldByName('cd_logradouro').AsInteger;
     dbTipoLogradouro.Refresh; 
  end;

  FreeAndNil(frmSelCep);
end;

procedure Tfrm_Pessoas.sbDesvinculaEmpresaClick(Sender: TObject);
begin
   tblPessoa.Edit;
   tblPessoacd_empresa.Clear;
end;

procedure Tfrm_Pessoas.MenuItem1Click(Sender: TObject);
begin
   imageFotoDblClick(nil);
end;

procedure Tfrm_Pessoas.MenuItem2Click(Sender: TObject);
begin
   { Procurar a foto da pessoa }
   bExcluido := true;
   { Coloca a tabela em modo de edição }
   tblPessoa.Edit;
   tblPessoaim_pessoa.AsString := '';
   imageFoto.Visible := False;
   ciFoto.Picture.Assign(nil);
   tblPessoasn_foto.AsString := 'N';
   imageFoto.Picture.Assign(nil);
End;

procedure Tfrm_Pessoas.miExcluirClick(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
   begin
      if DM.UsuarioLogado.TemPermissao(1135, npExcluir, True) then
      begin
         FAlterandoFoto := True;
         if tblPessoa.State <> dsEdit then tblPessoa.Edit;
         tblPessoaim_pessoa.Clear;
         imageFoto.Picture.Assign(nil);
         tblPessoa.Post;
         FAlterandoFoto := False;
      end;
   end;
end;

procedure Tfrm_Pessoas.pcDocumentosChange(Sender: TObject);
begin
   if (pcDocumentos.ActivePageIndex in [0,2,3]) then
   begin
      pcDocumentos.Height := 133;
      pnContato.Top := pcDocumentos.Top + 133;
   end
   else
   begin
      pcDocumentos.Height := 83;
      pnContato.Top := pcDocumentos.Top + 83;
   end;
end;

procedure Tfrm_Pessoas.pgPessoaChange(Sender: TObject);
var
   enable : Boolean;
begin
   toolPessoa.Visible := not (pgPessoa.ActivePage = tsParentes);

   if tblPessoa.State = dsBrowse then
   begin
      tblPessoa.Refresh;
   end;

   enable := GruposHierarquia(tblPessoacd_pessoa.AsInteger);

   if (btSalvar_Pessoa.Enabled = true) then
   begin
      pgPessoa.ActivePage := pgPessoa.ActivePage;
   end;

   if (pgPessoa.ActivePage = tsParentes) then
   begin
      frParentes1.TrocaPessoa(tblPessoacd_pessoa.AsInteger);
   end;
   if (pgPessoa.ActivePage = tsComplementares) then
   begin
      enable := enable or (tblPessoacd_pessoa.AsInteger = DM.iCdPessoaLogado);
      edLogin.Enabled := enable;
      edSenha1.Enabled := enable;
      edSenha2.Enabled := enable;
      btnBloquearOnline.Enabled := enable;
      btnLiberarAcesso.Enabled :=  enable;

      dbObs.Enabled := hasPermObsGerais;

      if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
      begin
         btnAlteraObs.Visible := True;
         btnSalvarObs.Visible := True;
         btnCancelarObs.Visible := True;

         qryObsGerais.Close();
         qryObsGerais.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
         qryObsGerais.Open();
      end;
   end;

   if tblPessoa.State in [dsInsert] then
   begin
      if dm.iCdPessoaLogado <> tblPessoacd_pessoa.AsInteger then
      begin
         edLogin.Enabled   := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npIncluir, false );
         edSenha1.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npIncluir, false );
         edSenha2.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npIncluir, false );
      end;
   end
   else
   begin
      if dm.iCdPessoaLogado <> tblPessoacd_pessoa.AsInteger then
      begin
         edLogin.Enabled   := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false ) and enable;
         edSenha1.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false ) and enable;
         edSenha2.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false ) and enable;
      end;   
   end;
end;

function Tfrm_Pessoas.PodeAlterarContatos(const cd_pessoa: Integer; cd_permissao_tela: Integer = 0): Boolean;
begin
   Result := False;
   lblMensagemHierarquia.Visible := False;

   if (parametro_alterar_contatos = 'S') then
      Result := True;

   Result := False;

   if NOT(Result) then
   begin
      Result := GruposHierarquia(cd_pessoa);
      lblMensagemHierarquia.Visible := NOT(Result);
   end;

   if cd_permissao_tela <> 0 then
   begin
      if not DM.UsuarioLogado.TemPermissao( cd_permissao_tela, npAlterar, False ) then
      begin
         Result := False;
      end;
   end;

end;

function Tfrm_Pessoas.PodeAlterarSenha():Boolean;
var
   lstGrupo            : TStringList;
   indice              : Integer;
   Resultado           : Boolean;
   qryGruposHierarquia : TUMZQuery;
begin
   Resultado := true;
   lstGrupo := TStringList.Create;
   lstGrupo := DM.getGrupos(tblPessoacd_pessoa.AsInteger);

   DM.CriarConsulta(qryGruposHierarquia);
   qryGruposHierarquia.Close;
   qryGruposHierarquia.SQL.Text :=
   ' SELECT                                                                  '+
   '   ngh.cd_grupo_alternar as cd_grupo_alter , ngh.cd_grupo as cd_grupo ,  '+
   '   ngh.cd_grupo_liberado as cd_grupo_liberado                            '+
   ' FROM                                                                    '+
   '   pessoas p                                                             '+
   '   JOIN nu_grupos_pessoas ngp on ( p.cd_pessoa = ngp.cd_pessoa)          '+
   '   JOIN nu_grupos ng on (ng.cd_grupo = ngp.cd_grupo)                     '+
   '   JOIN nu_grupos_hierarquia ngh on (ng.cd_grupo = ngh.cd_grupo)         '+
   ' WHERE                                                                   '+
   '   p.cd_pessoa = '+ IntToStr(DM.iCdPessoaLogado)                         +
   ' GROUP BY                                                                '+
   '   ngh.cd_grupo_alternar , ngh.cd_grupo  , ngh.cd_grupo_liberado         ';

   qryGruposHierarquia.Close;
   qryGruposHierarquia.Open;

   for indice := 0 to lstGrupo.Count - 1 do
   begin
      if(not(qryGruposHierarquia.Locate('cd_grupo_liberado',lstGrupo[indice],[])))then
      begin
         if (lstGrupo[indice] <> '0') then
         begin
            Resultado := false;
            Break;
         end;
      end;
   end;
   Result := Resultado;
end;

procedure Tfrm_Pessoas.preencheComboSituacoes;
var
   qrySituacoes: TUMZQuery;
   I: Integer;
   ItemCombo: TItemCombo;
begin

   DM.CriarConsulta(qrySituacoes);
   qrySituacoes.SQL.Text := 'SELECT cd_situacao, ds_valor FROM situacoes WHERE cd_modulo = 1 ORDER BY ds_valor';
   qrySituacoes.Open;

   cbFormaConhece.Clear;

   ItemCombo := TItemCombo.Create('', 'Selecione');
   cbFormaConhece.Items.AddObject('', ItemCombo);
   
   while not qrySituacoes.Eof do
   begin

      ItemCombo := TItemCombo.Create(
         qrySituacoes.FieldByName('cd_situacao').AsString,
         qrySituacoes.FieldByName('ds_valor').AsString
         );
         
      I := cbFormaConhece.Items.AddObject(
         qrySituacoes.FieldByName('ds_valor').AsString,
         ItemCombo
         );
         
      if ((AnsiLowerCase(qrySituacoes.FieldByName('ds_valor').AsString) = AnsiLowerCase(tblPessoa.FieldByName('ds_forma_conheceu').asString))
         AND (tblPessoa.State <> dsInsert)) then
      begin
         cbFormaConhece.ItemIndex := i;
      end;

      qrySituacoes.Next;
   end;

   ItemCombo := TItemCombo.Create('-1', 'Outros');

   I := cbFormaConhece.Items.AddObject('Outros', ItemCombo);

   if ((tblPessoa.FieldByName('ds_forma_conheceu').asString <> '')
      AND (cbFormaConhece.ItemIndex = -1) AND (tblPessoa.State <> dsInsert)) then
   begin

      cbFormaConhece.ItemIndex := I;

      lbInformeFicouSabendo.Visible := True;
      edFormaConheceuOutro.Visible := True;

      edFormaConheceuOutro.Text := tblPessoa.FieldByName('ds_forma_conheceu').asString;

   end
   else
   begin
      lbInformeFicouSabendo.Visible := False;
      edFormaConheceuOutro.Visible := False;
      edFormaConheceuOutro.Text := '';
   end;

end;

procedure Tfrm_Pessoas.qyVinculosExternoAfterOpen(DataSet: TDataSet);
begin
   lbVinculoExterno.Visible := DM.ExisteRegistro('nu_integracao_externa',[],[]);
   pnVinculosExterno.Visible := lbVinculoExterno.Visible;

   if pnVinculosExterno.Visible then
   begin
      lbVinculoExterno.Visible := False;
      pnVinculosExterno.Visible := False;
      pnVinculosExterno.Visible := True;
      lbVinculoExterno.Visible := True;
   end;
end;

procedure Tfrm_Pessoas.removeCamposExtrasCodigo(cd_pessoa_removido: Integer);
CONST
   SQL_EXCLUIR_CAMPO = ''+
   'DELETE           '+
   '  pc.*           '+
   'FROM             '+
	'  pessoas_campos_adicionais pca '+
   '  INNER JOIN pessoas_cadastro pc ON (pca.CD_CAMPO = pc.cd_campo) '+
   'WHERE            '+
	'  pca.ds_tipo LIKE "P" '+
   '  AND pc.ds_conteudo LIKE :cd_pessoa_removido ';

var
   qryRemoveCamposExtras: TUMZQuery;
begin

   dm.CriarConsulta(qryRemoveCamposExtras);

   qryRemoveCamposExtras.SQL.Text := SQL_EXCLUIR_CAMPO;

   qryRemoveCamposExtras.ParamByName('cd_pessoa_removido').AsInteger := cd_pessoa_removido;
   qryRemoveCamposExtras.ExecSQL;
end;

procedure Tfrm_Pessoas.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if pgPessoa.ActivePage = tsParentes then begin
      if (tblPessoa.IsEmpty()) then begin
         tblPessoa.CLose;
         tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + IntToStr(resultado_filtro.cd_pessoa);
         tblPessoa.Open;
      end;
   end;

   AllowChange := not (tblPessoacd_pessoa.AsInteger = 0);

end;

procedure Tfrm_Pessoas.dbComplementoKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     pcDocumentos.ActivePageIndex := 0;
     dbCpf.SetFocus;
     Key := #0;
  End;

end;

procedure Tfrm_Pessoas.dbDiaVencimentoKeyPress(Sender: TObject; var Key: Char);
begin
   if dbDiaVencimento.ReadOnly = False then
   begin
      tblPessoa.Edit();
   end;
end;

procedure Tfrm_Pessoas.DBEdit13KeyPress(Sender: TObject; var Key: Char);
begin
  tblPessoa.Edit();
end;

procedure Tfrm_Pessoas.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  tblPessoa.Edit();
end;

procedure Tfrm_Pessoas.DBLookupComboBox2CloseUp(Sender: TObject);
begin
   try
      if DBLookupCombobox2.KeyValue <= -1 then
      begin
         exit;
      end;
   except
      
   end;
end;

procedure Tfrm_Pessoas.edLoginExit(Sender: TObject);
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

procedure Tfrm_Pessoas.edLoginKeyPress(Sender: TObject; var Key: Char);
begin
  tblPessoa.Edit();
end;

procedure Tfrm_Pessoas.edSenha1KeyPress(Sender: TObject; var Key: Char);
begin
   tblPessoa.Edit();
end;

procedure Tfrm_Pessoas.edSenha2KeyPress(Sender: TObject; var Key: Char);
begin
   tblPessoa.Edit();
end;

procedure Tfrm_Pessoas.tblPessoatp_certGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    if Sender.AsInteger = 1 then
       Text := 'Nascimento'
    else if Sender.AsInteger = 2 then
       Text := 'Casamento'
    else if Sender.AsInteger = 3 then
       Text := 'Divórcio'
    else if Sender.AsInteger = 4 then
       Text := 'União Estável'
    else
       Text := '';

end;

procedure Tfrm_Pessoas.tblPessoatp_certSetText(Sender: TField;
  const Text: string);
begin
   if Text = 'Nascimento' then
      Sender.AsInteger := 1
   else if Text = 'Casamento' then
      Sender.AsInteger := 2
   else if Text = 'Divórcio' then
      Sender.AsInteger := 3
   else if Text = 'União Estável' then
      Sender.AsInteger := 4
   else
      Sender.AsInteger := 0;
end;

procedure Tfrm_Pessoas.FormCreate(Sender: TObject);
begin
   FAlterandoFoto := False;
   filtro_cd_pessoa := -1;
   DM.CriarConsulta(qyTemp1);
   DM.CriarConsulta(qyTemp2);

   VSTContatosEditor := TEditorContatosPessoa.Create(VSTContatos);
end;

procedure Tfrm_Pessoas.FormDestroy(Sender: TObject);
begin

  FreeAndNil(qyTemp1);
  FreeAndNil(qyTemp2);

end;

procedure Tfrm_Pessoas.tblPessoads_estado_nascimentoChange(Sender: TField);
begin
   tblMunicipios.Close();
   tblMunicipios.ParamByName('uf_nascimento').ASString := tblPessoads_estado_nascimento.AsString;
   tblMunicipios.Open();
end;

procedure Tfrm_Pessoas.tblPessoads_estadoChange(Sender: TField);
begin
   tblMunicipioAtual.Close();
   tblMunicipioAtual.ParamByName('uf_atual').ASString := tblPessoads_estado.AsString;
   tblMunicipioAtual.Open();
end;

function Tfrm_Pessoas.GruposHierarquia(const cd_pessoa: Integer):Boolean;
const
   SQLSelectHierarquia =
        ' SELECT DISTINCT '
      + ' 	p_to.cd_grupo '
      + ' FROM '
      + ' 	nu_grupos_pessoas p_to '
      + '  '
      + ' 		LEFT JOIN ( '
      + ' 			SELECT DISTINCT '
      + ' 				h.cd_grupo_liberado '
      + ' 			FROM '
      + ' 				nu_grupos_hierarquia h '
      + '  '
      + ' 					JOIN nu_grupos_pessoas p ON '
      + ' 						(h.cd_grupo = p.cd_grupo) '
      + ' 			WHERE '
      + ' 				p.cd_pessoa = ? '
      + ' 		) t ON '
      + ' 			(p_to.cd_grupo = t.cd_grupo_liberado) '
      + ' WHERE '
      + ' 	p_to.cd_pessoa = ? AND '
      + ' 	t.cd_grupo_liberado IS NULL ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
begin
   Result := False;
   Stmt := PrepareStatement(SQLSelectHierarquia);
   try
      Stmt.SetInt(1, DM.UsuarioLogado.Pessoa.Codigo);
      Stmt.SetInt(2, tblPessoacd_pessoa.AsInteger);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         Result := True;
         if Rs.Next then
            Result := False;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;
end;


procedure Tfrm_Pessoas.gravaLogDelete();
var
   msgLogPessoa: string;
begin
   msgLogPessoa := '[Pessoas > Cadastro] Exclusão de pessoa com codigo: ' + tblPessoacd_pessoa.AsString + ', ';

   if self = frm_alunos then
   begin
      msgLogPessoa := '[Pessoas > Alunos] Exclusão de pessoa com codigo: ' + tblPessoacd_pessoa.AsString + ', ';
   end;

   if self = frm_professores then
   begin
      msgLogPessoa := '[Pessoas > Professores/Funcionários] Exclusão de pessoa com codigo: ' + tblPessoacd_pessoa.AsString + ', ';
   end;


   msgLogPessoa := msgLogPessoa + ' pessoa de nm_pessoa: ' + tblPessoanm_pessoa.Text + ', ';
   msgLogPessoa := msgLogPessoa + ' pessoa de ds_cpf: ' + tblPessoads_cpf.Text + ', ';
   msgLogPessoa := msgLogPessoa + ' pessoa de dt_nascimento: ' + tblPessoadt_nascimento.Text + ', ';
   msgLogPessoa := msgLogPessoa + ' pessoa de ds_indentidade: ' + tblPessoads_identidade.Text + ', ';
   
   DM.setLog(1006, 'Exclusao', tblPessoacd_pessoa.AsString , DM.UsuarioLogado.ColigadaLogada , msgLogPessoa);

end;

end.
