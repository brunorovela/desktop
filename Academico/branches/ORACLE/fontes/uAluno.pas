unit uAluno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uPessoas, ZConnection, Db, ImgList, DBCtrls, Buttons, StdCtrls, Grids,
  DBGrids, ExtCtrls, Mask, ComCtrls, ToolWin, ExtDlgs, Menus, uFrameParentes,
  DelphiTwain, CropImage, md5, ZAbstractTable, ZDataset, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, DSPack, ClassPessoas, UMComboBox, ZSqlUpdate, uItemCombo,
  VirtualTrees, uEditorContatosPessoa, UMAjuda, uUsuario, uCadProfissoes,Variants,
  UZDbcFuncs, ZDbcIntfs;

type
  THackDBGrid = class(TDBGrid);
                        
  Tfrm_Alunos = class(Tfrm_Pessoas)
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
    tsRespAcademico: TTabSheet;
    tsRespFinanceiro: TTabSheet;
    tsMatricula: TTabSheet;
    Label27: TLabel;
    dbNomeRespAcad: TDBEdit;
    DBEdit7: TDBEdit;
    Label31: TLabel;
    DBComboBox2: TDBComboBox;
    Label45: TLabel;
    DBEdit10: TDBEdit;
    Label47: TLabel;
    DBEdit14: TDBEdit;
    Label52: TLabel;
    DBEdit15: TDBEdit;
    Label53: TLabel;
    DBEdit16: TDBEdit;
    Label54: TLabel;
    pgDocAcad: TPageControl;
    TabSheet9: TTabSheet;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    dbCPFAcad: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    TabSheet10: TTabSheet;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    TabSheet11: TTabSheet;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    Panel5: TPanel;
    imageFotoAcad: TImage;
    lbFotoAcad: TLabel;
    Label72: TLabel;
    dbNomeRespFinan: TDBEdit;
    DBEdit32: TDBEdit;
    DBComboBox7: TDBComboBox;
    Label78: TLabel;
    DBEdit35: TDBEdit;
    Label80: TLabel;
    DBEdit39: TDBEdit;
    Label85: TLabel;
    DBEdit40: TDBEdit;
    Label86: TLabel;
    DBEdit41: TDBEdit;
    Label87: TLabel;
    pgDocFinan: TPageControl;
    TabSheet12: TTabSheet;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    dbCPFFinan: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    TabSheet13: TTabSheet;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    TabSheet14: TTabSheet;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBComboBox9: TDBComboBox;
    DBComboBox10: TDBComboBox;
    DBComboBox11: TDBComboBox;
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
    Label107: TLabel;
    tblResponsaveldt_nascimento: TDateTimeField;
    tblResponsaveldt_identidade_expedicao: TDateTimeField;
    tblResponsaveldt_rm_exp: TDateTimeField;
    tblResponsaveldt_titulo_emissao: TDateTimeField;
    tblResponsaveldt_revisao: TDateTimeField;
    tblResponsaveldt_cadastro: TDateTimeField;
    btn_Imprimir: TToolButton;
    tblContatos: TUMZQuery;
    sbMaisInformacoesAcademico: TSpeedButton;
    sbMaisInformacoesFinanceiro: TSpeedButton;
    btnOrientacao: TToolButton;
    sbCepFinanc: TSpeedButton;
    qyDocumentos: TUMZQuery;
    tblResponsavelsn_bloqueto_empresa: TStringField;
    tblResponsavelim_pessoa: TBlobField;
    tblResponsavelsn_foto_publica: TStringField;
    tblResponsavelsn_pai: TStringField;
    tblResponsavelsn_mae: TStringField;
    sbCepAcedemico: TSpeedButton;
    qyDocumentosNaoNecessarios: TUMZQuery;
    tsPai: TTabSheet;
    tsMae: TTabSheet;
    sbBuscarPai: TSpeedButton;
    sbBuscarMae: TSpeedButton;
    Label110: TLabel;
    Label111: TLabel;
    Label113: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label125: TLabel;
    Label128: TLabel;
    sbCepPai: TSpeedButton;
    dbNomePai: TDBEdit;
    DBEdit57: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit60: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit69: TDBEdit;
    DBLookupComboBox13: TDBLookupComboBox;
    Panel12: TPanel;
    Image1: TImage;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label133: TLabel;
    Label135: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label141: TLabel;
    Label145: TLabel;
    SpeedButton4: TSpeedButton;
    dbNomeMae: TDBEdit;
    DBEdit72: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBEdit75: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit84: TDBEdit;
    DBLookupComboBox16: TDBLookupComboBox;
    Panel13: TPanel;
    Image2: TImage;
    Label149: TLabel;
    pgDocPai: TPageControl;
    TabSheet6: TTabSheet;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    SpeedButton5: TSpeedButton;
    dbCPFPai: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    TabSheet7: TTabSheet;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    TabSheet15: TTabSheet;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    DBEdit94: TDBEdit;
    DBEdit95: TDBEdit;
    DBComboBox8: TDBComboBox;
    DBComboBox12: TDBComboBox;
    DBComboBox13: TDBComboBox;
    TabSheet16: TTabSheet;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    DBEdit98: TDBEdit;
    DBEdit99: TDBEdit;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBComboBox14: TDBComboBox;
    pgDocMae: TPageControl;
    TabSheet17: TTabSheet;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    SpeedButton6: TSpeedButton;
    dbCPFMae: TDBEdit;
    DBEdit103: TDBEdit;
    DBEdit104: TDBEdit;
    DBEdit105: TDBEdit;
    TabSheet18: TTabSheet;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    DBEdit106: TDBEdit;
    DBEdit107: TDBEdit;
    DBEdit108: TDBEdit;
    DBEdit109: TDBEdit;
    TabSheet19: TTabSheet;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    DBEdit110: TDBEdit;
    DBEdit111: TDBEdit;
    DBComboBox15: TDBComboBox;
    DBComboBox16: TDBComboBox;
    DBComboBox17: TDBComboBox;
    TabSheet20: TTabSheet;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    DBEdit112: TDBEdit;
    DBEdit113: TDBEdit;
    DBEdit114: TDBEdit;
    DBEdit115: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit117: TDBEdit;
    DBComboBox18: TDBComboBox;
    TabSheet21: TTabSheet;
    Label190: TLabel;
    DBComboBox19: TDBComboBox;
    Label191: TLabel;
    DBEdit118: TDBEdit;
    Label192: TLabel;
    DBEdit119: TDBEdit;
    Label193: TLabel;
    DBEdit120: TDBEdit;
    Label194: TLabel;
    DBEdit121: TDBEdit;
    Label195: TLabel;
    DBEdit122: TDBEdit;
    DBEdit123: TDBEdit;
    Label196: TLabel;
    TabSheet22: TTabSheet;
    Label197: TLabel;
    DBComboBox20: TDBComboBox;
    Label198: TLabel;
    DBEdit124: TDBEdit;
    Label199: TLabel;
    DBEdit125: TDBEdit;
    Label200: TLabel;
    DBEdit126: TDBEdit;
    Label201: TLabel;
    DBEdit127: TDBEdit;
    Label202: TLabel;
    DBEdit128: TDBEdit;
    DBEdit129: TDBEdit;
    Label203: TLabel;
    tblResponsaveltp_cert: TSmallintField;
    tblResponsavelds_cert_folha: TStringField;
    tblResponsavelds_cert_livro: TStringField;
    tblResponsaveldt_cert: TDateTimeField;
    tblResponsavelds_cert_uf: TStringField;
    tblResponsavelds_cert_orgao: TStringField;
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
    DBEdit3: TDBEdit;
    TabSheet1: TTabSheet;
    Label204: TLabel;
    DBEdit5: TDBEdit;
    TabSheet5: TTabSheet;
    Label205: TLabel;
    DBEdit17: TDBEdit;
    TabSheet8: TTabSheet;
    Label206: TLabel;
    DBEdit30: TDBEdit;
    sbCopiarResp: TSpeedButton;
    Label208: TLabel;
    tblMatriculaCursonr_matricula: TStringField;
    tblMatriculaCursodt_saida: TDateTimeField;
    tblMatriculaCursodt_ingresso: TDateTimeField;
    Label209: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    btnRematricular: TToolButton;
    dbCodigo: TDBEdit;
    Label112: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    DBLookupComboBox17: TDBLookupComboBox;
    Label114: TLabel;
    Label126: TLabel;
    DBLookupComboBox18: TDBLookupComboBox;
    Label127: TLabel;
    Label132: TLabel;
    Label134: TLabel;
    Label146: TLabel;
    DBLookupComboBox20: TDBLookupComboBox;
    Label147: TLabel;
    Label30: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label44: TLabel;
    Label48: TLabel;
    DBLookupComboBox22: TDBLookupComboBox;
    Label49: TLabel;
    tblResponsaveldescMunicipio: TStringField;
    tblResponsaveldescPais: TStringField;
    DBLookupComboBox12: TDBLookupComboBox;
    DBLookupComboBox23: TDBLookupComboBox;
    tblResponsaveldescMunicipioAtual: TStringField;
    Label73: TLabel;
    Label77: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label81: TLabel;
    DBLookupComboBox25: TDBLookupComboBox;
    Label82: TLabel;
    Label136: TLabel;
    DBLookupComboBox15: TDBLookupComboBox;
    Label139: TLabel;
    Label140: TLabel;
    DBLookupComboBox26: TDBLookupComboBox;
    DBEdit34: TDBEdit;
    Label148: TLabel;
    Label34: TLabel;
    DBLookupComboBox10: TDBLookupComboBox;
    Label43: TLabel;
    Label50: TLabel;
    DBLookupComboBox27: TDBLookupComboBox;
    DBEdit11: TDBEdit;
    Label51: TLabel;
    Label75: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label76: TLabel;
    Label83: TLabel;
    DBLookupComboBox28: TDBLookupComboBox;
    DBEdit33: TDBEdit;
    Label84: TLabel;
    tblResponsavelds_estado_civil: TStringField;
    tblResponsavelds_login: TStringField;
    tblResponsaveltp_pessoa: TStringField;
    tblResponsavelds_cnpj: TStringField;
    tblResponsavelds_inscri_estadual: TStringField;
    DBLookupComboBox21: TDBLookupComboBox;
    DBLookupComboBox24: TDBLookupComboBox;
    DBLookupComboBox14: TDBLookupComboBox;
    DBLookupComboBox19: TDBLookupComboBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    tblResponsavelsn_obito: TSmallintField;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    tblResponsavelsn_pai_resp: TSmallintField;
    tblResponsavelsn_mae_resp: TSmallintField;
    pcAcessoOnline: TPageControl;
    tsAcessoOnline: TTabSheet;
    Label213: TLabel;
    sbAcessoOnline: TScrollBox;
    edLoginAluno: TEdit;
    lbLoginAluno: TLabel;
    edSenhaAluno: TEdit;
    lbSenhaAluno: TLabel;
    edRedgAluno: TEdit;
    lbRedgAluno: TLabel;
    lbAluno: TLabel;
    edSenhaPai: TEdit;
    edRedgPai: TEdit;
    edLoginPai: TEdit;
    lbPai: TLabel;
    edLoginMae: TEdit;
    edSenhaMae: TEdit;
    edRedgMae: TEdit;
    lbMae: TLabel;
    edLoginRespAcad: TEdit;
    edSenhaRespAcad: TEdit;
    edRedgRespAcad: TEdit;
    lbResponAcad: TLabel;
    edLoginRespFinan: TEdit;
    lbRespFinan: TLabel;
    edSenhaRespFinan: TEdit;
    edRedgRespFinan: TEdit;
    lbNomeRespAcad: TLabel;
    lbNomeRespFinan: TLabel;
    lbNomeMae: TLabel;
    lbNomePai: TLabel;
    lbNomeAluno: TLabel;
    edCodigoAluno: TEdit;
    lbCodigoAluno: TLabel;
    edCodigoPai: TEdit;
    edCodigoMae: TEdit;
    edCodigoRespAcad: TEdit;
    edCodigoRespFinan: TEdit;
    cbProvAluno: TCheckBox;
    cbProvPai: TCheckBox;
    cbProvMae: TCheckBox;
    cbProvRespAcad: TCheckBox;
    cbProvRespFinan: TCheckBox;
    Label212: TLabel;
    qyRacas: TUMZQuery;
    dbclRacas: TDBLookupComboBox;
    lbRaca: TLabel;
    tblPessoadescRaca: TStringField;
    lblCodigoMec: TLabel;
    dbeMec: TDBEdit;
    tblResponsavelnr_cert_termo2: TStringField;
    tblResponsavelcd_municipio: TLargeintField;
    tblResponsavelcd_pais: TLargeintField;
    tblResponsavelcd_pais_nascimento: TLargeintField;
    tblResponsavelcd_logradouro: TLargeintField;
    tblResponsavelcd_orgao_emissor: TLargeintField;
    tblResponsavelcd_municipio_nasc: TLargeintField;
    tblResponsavelnr_praca: TLargeintField;
    tblResponsavelcd_estado_nascimento: TSmallintField;
    tblResponsavelcd_estado: TLargeintField;
    tblResponsavelcd_convenio: TLargeintField;
    tblMatriculaCursonr_anosem_ingresso: TLargeintField;
    tblResponsavelCD_LOCALIDADE: TIntegerField;
    tblMatriculaCursoCD_MATRICULA_CURSO: TLargeintField;
    qryUpdateMat: TUMZQuery;
    qyMunicipiosResp: TUMZQuery;
    tblMunicipioResp: TUMZQuery;
    StringField2: TStringField;
    tblMunicipioAtualResp: TUMZQuery;
    tblMunicipioRespCD_MUNICIPIO: TLargeintField;
    tblMunicipioAtualRespCD_MUNICIPIO: TLargeintField;
    tblMunicipioAtualRespNR_PRACA: TLargeintField;
    btBuscarPessoaAcad: TToolButton;
    tblMatriculaCursocd_pessoa: TIntegerField;
    tblMatriculaCursocd_curso: TStringField;
    tblResponsavelcd_localidade_nasc: TIntegerField;
    tblMatriculaCursodescricao: TStringField;
    tblMatriculasEtapacd_matricula_curso: TLargeintField;
    qyMunicipiosRespcd_municipio: TLargeintField;
    tblMatriculaCursocd_instituicao: TLargeintField;
    tblMatriculaCursonm_instituicao: TStringField;
    tblMunicipioAtualRespds_municipio: TStringField;
    qyMunicipiosRespds_municipio: TStringField;
    tblResponsaveldesLogradouro: TStringField;
    dblbTpLogradouros: TDBLookupComboBox;
    Label216: TLabel;
    dblbTpLogradouro: TDBLookupComboBox;
    Label214: TLabel;
    DBLookupComboBox29: TDBLookupComboBox;
    Label215: TLabel;
    DBLookupComboBox30: TDBLookupComboBox;
    Label217: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    tblResponsaveldescPais2: TStringField;
    DBLookupComboBox31: TDBLookupComboBox;
    DBLookupComboBox32: TDBLookupComboBox;
    DBLookupComboBox33: TDBLookupComboBox;
    cbNacionalidadePai: TUMComboBox;
    cbNacionalidadeMae: TUMComboBox;
    cbNacionalidadeRespAcad: TUMComboBox;
    DBEdit9: TUMComboBox;
    tblMatriculasEtapasn_proximo_curso: TSmallintField;
    tblMatriculasEtapacd_proximo_curso: TStringField;
    pnl1: TPanel;
    DBEdit67: TDBEdit;
    lblMensagemHierarquiaPai: TLabel;
    Label124: TLabel;
    DBEdit68: TDBEdit;
    Label122: TLabel;
    DBEdit66: TDBEdit;
    Label123: TLabel;
    Label222: TLabel;
    dbPassaportePai: TDBEdit;
    tblResponsavelcd_mae: TLargeintField;
    tblResponsavelcd_pai: TLargeintField;
    tblResponsavelnm_contato: TStringField;
    tblResponsavelnr_dia_vencimento: TLargeintField;
    tblResponsavelsn_nao_bloquear_financeiro: TSmallintField;
    tblResponsavelcd_pessoa_alteracao: TLargeintField;
    tblResponsavelds_senha_md4: TStringField;
    tblResponsavelsn_pais_como_resp: TSmallintField;
    tblResponsavelsn_requerimentos_email: TStringField;
    tblResponsavelcd_instituicao_ensino: TSmallintField;
    tblResponsavelcd_raca: TSmallintField;
    tblResponsavelcd_mec: TStringField;
    tblResponsavelsn_foto: TStringField;
    tblResponsavelsn_bloqueado: TSmallintField;
    tblResponsavelds_inscri_municipal: TStringField;
    tblResponsavelcd_bairro: TIntegerField;
    tblResponsavelcd_usuario_pessoa: TLargeintField;
    tblResponsavelsn_bloq_cartas: TSmallintField;
    tblResponsavelsn_bloq_emails: TSmallintField;
    tblResponsavelsn_naturalizado: TSmallintField;
    tblResponsaveldt_identidade_expiracao: TDateTimeField;
    tblResponsavelds_matricula: TStringField;
    tblResponsavelsn_pode_retirar_material: TSmallintField;
    tblResponsavelds_passaporte: TStringField;
    pnl2: TPanel;
    lblMensagemHierarquiaMae: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label219: TLabel;
    DBEdit8: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit36: TDBEdit;
    Label223: TLabel;
    dbPassaporteMae: TDBEdit;
    pnl3: TPanel;
    lblMensagemHierarquiaRespAcad: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label220: TLabel;
    DBEdit6: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label224: TLabel;
    dbPassaporteRespAcad: TDBEdit;
    pnl4: TPanel;
    lblMensagemHierarquiaRespFinan: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    DBEdit29: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    Label225: TLabel;
    dbPassaporteRespFinan: TDBEdit;
    Label221: TLabel;
    Label227: TLabel;
    DBEdit42: TDBEdit;
    tblPessoads_formacao_academica: TStringField;
    VSTContatosPai: TVirtualStringTree;
    VSTContatosMae: TVirtualStringTree;
    VSTContatosRespAcad: TVirtualStringTree;
    VSTContatosRespFinan: TVirtualStringTree;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    Label1: TLabel;
    dbProfissao: TDBEdit;
    tblMatriculasEtapacd_curso_atual: TStringField;
    qyCampos: TUMZQuery;
    qyCamposCD_CAMPO: TIntegerField;
    qyCamposDS_CAMPO: TStringField;
    qyCamposDS_CAMPO_DESCRICAO: TStringField;
    qyCamposDS_TIPO: TStringField;
    qyCamposDS_PESSOA: TStringField;
    qyCamposNR_ORDEM: TIntegerField;
    qyCamposDS_CATEGORIA: TStringField;
    qyCamposcd_opcao: TIntegerField;
    qyCamposDS_CHAVE: TStringField;
    qyCadastroCampos_Opcoes: TUMZQuery;
    qyCadastroCampos_Opcoescd_opcao: TIntegerField;
    qyCadastroCampos_Opcoesds_opcao: TStringField;
    qyCadastroCampos_Opcoesme_sql: TMemoField;
    qyCadastroCampos_Opcoesme_opcoes: TMemoField;
    qyCadastroCampos_Opcoesds_conteudo: TStringField;
    qyCategoriasCD_ACAO: TSmallintField;
    btnAddProfissao: TBitBtn;
    qyRetornaCodCampo: TUMZQuery;
    qyRetornaCodCampoCD_CAMPO: TIntegerField;
    qyCategorias: TUMZQuery;
    qyProfissao: TUMZQuery;
    qyBuscaProfissaoContatos: TUMZQuery;
    btDesvincular: TToolButton;
    qyDesvincularPessoa: TUMZQuery;
    Label28: TLabel;
    db_pessoa_profissao: TDBEdit;
    Label29: TLabel;
    db_local_trabalho: TDBEdit;
    Label68: TLabel;
    db_pessoa_profissao_mae: TDBEdit;
    Label101: TLabel;
    db_local_trabalho_mae: TDBEdit;
    Label142: TLabel;
    db_pessoa_profissao_respAcad: TDBEdit;
    Label218: TLabel;
    db_local_trabalho_respAcad: TDBEdit;
    Label226: TLabel;
    db_pessoa_profissao_respFinan: TDBEdit;
    Label228: TLabel;
    db_local_trabalho_respFinan: TDBEdit;
    tblResponsavelds_profissao: TStringField;
    tblResponsavelds_local_trabalho: TStringField;
    procedure tblPessoads_estado_nascimentoChange(Sender: TField);
    procedure edSenha1KeyPress(Sender: TObject; var Key: Char);
    procedure btDesvincularClick(Sender: TObject);
    procedure edLoginAlunoExit(Sender: TObject);
    procedure btnAddProfissaoClick(Sender: TObject);
    procedure AtualizaCampoProfissao(Sender: TObject);
    procedure cbProvRespAcadClick(Sender: TObject);
    procedure cbProvRespFinanClick(Sender: TObject);
    procedure cbProvMaeClick(Sender: TObject);
    procedure cbProvPaiClick(Sender: TObject);
    procedure cbProvAlunoClick(Sender: TObject);
    procedure cbNacionalidadePaiCloseUp(Sender: TObject);
    procedure DBLookupComboBox32CloseUp(Sender: TObject);
    procedure DBLookupComboBox32Exit(Sender: TObject);
    procedure DBLookupComboBox31Exit(Sender: TObject);
    procedure DBLookupComboBox20Exit(Sender: TObject);
    procedure cbNacionalidadePaiKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox25CloseUp(Sender: TObject);
    procedure DBLookupComboBox22CloseUp(Sender: TObject);
    procedure DBLookupComboBox20CloseUp(Sender: TObject);
    procedure DBLookupComboBox30CloseUp(Sender: TObject);
    procedure DBLookupComboBox29CloseUp(Sender: TObject);
    procedure dblbTpLogradouroCloseUp(Sender: TObject);
    procedure dblbTpLogradourosCloseUp(Sender: TObject);
    procedure pgDocFinanChange(Sender: TObject);
    procedure pgDocAcadChange(Sender: TObject);
    procedure pgDocMaeChange(Sender: TObject);
    procedure pgDocPaiChange(Sender: TObject);
    procedure DBLookupComboBox18Exit(Sender: TObject);
    procedure sbPaisComboExit(Sender: TObject);
    procedure cbNacionalidadeExit(Sender: TObject);
    procedure cbNacionalidadePaiChange(Sender: TObject);
    procedure cbNacionalidadePaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNacionalidadePaiExit(Sender: TObject);
    procedure DBLookupComboBox31CloseUp(Sender: TObject);
    procedure DBLookupComboBox18CloseUp(Sender: TObject);
    procedure tblPessoaAfterPost(DataSet: TDataSet);
    procedure sbPaisComboCloseUp(Sender: TObject);
    procedure sbHistoricoClick(Sender: TObject);
    procedure bbtnHistoricoClick(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure tblResponsaveltp_certGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tblResponsaveltp_certSetText(Sender: TField; const Text: string);
    procedure btn_ImprimirAcadeClick(Sender: TObject);
    procedure btBuscarPessoaAcadClick(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid5Enter(Sender: TObject);
    procedure DBGrid6Enter(Sender: TObject);
    procedure btCancelar_PessoaClick(Sender: TObject);
    procedure dbCidadeNascimentoDropDown(Sender: TObject);
    procedure dsResponsavelDataChange(Sender: TObject; Field: TField);
    procedure btAlterar_PessoaClick(Sender: TObject);
    procedure btIncluir_PessoaClick(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBCheckBox3Click(Sender: TObject);
    procedure cbProvRespFinanMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbProvRespAcadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbProvMaeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbProvPaiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbProvAlunoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblPessoaBeforePost(DataSet: TDataSet);
    procedure btExcluir_PessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblResponsavelAfterPost(DataSet: TDataSet);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblResponsavelds_estadoChange(Sender: TField);
    procedure tblResponsavelds_estado_nascimentoChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure dsPessoaStateChange(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure btnRematricularClick(Sender: TObject);
    procedure dbComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit78KeyPress(Sender: TObject; var Key: Char);
    procedure sbCopiarRespClick(Sender: TObject);
    procedure tblResponsavelAfterOpen(DataSet: TDataSet);
    procedure sbCopiarAlunoClick(Sender: TObject);
    procedure sbBuscarMaeClick(Sender: TObject);
    procedure sbBuscarPaiClick(Sender: TObject);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit63KeyPress(Sender: TObject; var Key: Char);
    procedure sbCepPaiClick(Sender: TObject);
    procedure DBEdit41KeyPress(Sender: TObject; var Key: Char);
    procedure tblResponsavelAfterInsert(DataSet: TDataSet);
    procedure tblResponsavelBeforePost(DataSet: TDataSet);
    procedure tblResponsavelNewRecord(DataSet: TDataSet);
    procedure btAcad_NovoClick(Sender: TObject);
    procedure btAcad_AlunoClick(Sender: TObject);
    procedure btAcad_BuscaClick(Sender: TObject);
    procedure pgPessoaChange(Sender: TObject);
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
    procedure tblPessoaNewRecord(DataSet: TDataSet);
    procedure tblPessoaAfterEdit(DataSet: TDataSet);
    procedure pgPessoaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure copiar_endereco_aluno;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tblRespFinanceirods_sexoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tblRespFinanceirods_sexoSetText(Sender: TField; const Text: String);
    procedure btSalvar_PessoaClick(Sender: TObject);
    procedure dbNomeRespFinanExit(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure sbMaisInformacoesAcademicoClick(Sender: TObject);
    procedure VerificaMaiorIdade(dtNasc: TDateTime);
    procedure btnOrientacaoClick(Sender: TObject);
    procedure VerificaCheckSenhaProvisoria(permissaoAlterarSenhaProvisoria : Boolean);
  private
    nacionalidadeAtual : Integer;
    hasPermObsGerais : Boolean;
    permIncluir : Boolean;
    permAlterar : Boolean;
    desLogradouro_aluno: String;
    procedure atualizarGruposTodasColigadas(iCodAluno: Integer);
    function verificaCpfPassaporte: boolean;
    function BibFinanceiroPendente: boolean;
    procedure SalvarProfissoes();
    procedure ComboBoxClick(Sender: TObject);


    procedure InicializaDadoLogin(qryRespon: TUMZQuery; cdRespon: Integer; edCodigo, edLogin, edSenha, edRedg: TEdit; lbPessoa:TLabel;cbProvisoria:TCheckBox);
    procedure alteraLogin(edLogin, edSenha, edRedgSenha: TEdit;cbProvisoria:TCheckBox;
      sLoginAntigo: string; qyPaiResp: TUMZQuery; codigoPessoaAlteraProvisoria: Integer);
    function ehResponsavelAcad(iCdPessoa, iCdAluno: Integer): boolean;
    function checkAtividadesPraticas(AICodigoAluno: integer;AINrAnoSemestre:Integer): boolean;
    { Private declarations }
    Procedure MatricularEtapa(CodMatricula : Integer; Curso : String; AnoSem: Integer; NrMatricula : String);
    function AlertarPendencias(): Boolean;
    Function BuscaAnoSemestre() :Integer;
    procedure DBGrid4aoSelecionarMatricula(Sender: TObject);
    procedure DBGrid3aoArrastarSobre(Sender, Source: TObject; X, Y: integer; State: TDragState; var Accept: boolean);
    procedure DBGrid3aoReceberDados(Sender, Source: TObject; X, Y: integer);
    procedure atualizarDadosLogin();
    Function FinanceiroPendente() : Boolean;
    Function DocumentoPendente() : Boolean;
    Function validaCategoria(cd_acao: Integer; nivelPermissao: TUMNivelPermissao): Boolean;

    function GetActiveComboBoxNacionalidade(): TUMComboBox;
    function GetVSTContatosResponsavel(): TEditorContatosPessoa;
    function GetLabelHierarquiaResponsavel(): TLabel;
    function PodeAlterarContatosResponsavel(const cd_pessoa: Integer; cd_permissao_tela: Integer = 0): Boolean;
    function responsavelFinanceiroMaiorIdade():Boolean;
  protected
    VSTContatosPaiEditor, VSTContatosMaeEditor,
    VSTContatosRespAcadEditor, VSTContatosRespFinanEditor : TEditorContatosPessoa;
  public
    { Public declarations }
    cbProfissaoDinamica : TUMComboBox;
    ds_profissao : String;
    function PodeAlterarSenha() : Boolean;
    function avisoAlteracaoCadastro():boolean;
    function GruposHierarquia(cd_pessoa: Integer) :Boolean;
    procedure selecionaPessoa(cd_pessoa: Integer);
    procedure importaPessoaModuloContatos (cd_informacao: integer; ds_cpf: String);
  end;

var
  msgIdade : string;
  frm_Alunos: Tfrm_Alunos;
  listaDeBloqueados : TStringList;
  cpfOriginal, nomeOriginal, nomePessoa, cpfPessoa: string;
  iCodPaiMae : Integer;
  validaTelefone_residencial: Boolean;
  validaTelefone_comercial: Boolean;
  validaCelular: Boolean;
  validaEmail: Boolean;
implementation

uses
   Main, uDM, General, uFSelecionarPessoa, uDocumentos, uMatricular,
   uImpAlunos, uMatriculas, Math, uPessoas_adicional, uSelCep,
   uMatricularCurso, uMatricula, uFuncoesGerais, uCadDeficiencias,
   UFObservacoes, UFMatricular, uHistorico_anterior, uPendenciasBib, uGeneral,
   uPessoa, uContatoPessoa, uContatoTipo, uIUMDataModule, DateUtils,
   uOpcoesItens, WideStrings, UFFinDebitos;

{$R *.DFM}

procedure Tfrm_Alunos.DBGrid2Enter(Sender: TObject);
begin
  inherited;
  if not(tblResponsavel.State in [dsInsert,dsEdit]) then
     tblResponsavel.Edit;
end;

{ **
   Este procedimento é invocado quando estiver arrastando sobre a Grid de
   matrículas no curso. Somente aceitará quando vier de outra Grid.
}
procedure Tfrm_Alunos.DBGrid3aoArrastarSobre(Sender, Source: TObject; X,
  Y: integer; State: TDragState; var Accept: boolean);
begin
   Accept := Source is TDBGrid;
end;

{ **
   Este procedimento é invocado quando o usuário finalizar o procedimento de
   arrastar sobre a Grid de matrículas no Curso.
}
procedure Tfrm_Alunos.DBGrid3aoReceberDados(Sender, Source: TObject; X,
  Y: integer);
const
   SQL_UPDATE_MATRICULA =
      'UPDATE '+
         'matriculas '+
      'SET '+
         'cd_matricula_curso = :cd_matricula_curso '+
      'WHERE anosemestre = :anosemestre AND '+
            'codigoaluno = :codigoaluno AND '+
            'turma = :turma';
   MSG_CONFIRMACAO =
      'Deseja realmente alterar a matrícula selecionada (turma "$turma$" e ano/semestre "$anosemestre_m$") '+#13+
      'para a matrícula no curso "$curso$" do ano/semestre "$anosemestre_mc$" ?';
var
   qyAtuMatricula: TUMZQuery;
   iAnoSemestre, iCodigoAluno, iCodMatriculaCurso: integer;
   sTurma, sMsg, sAnoSemestre: string;
begin
   // Verifica se o usuário possui permissão de alteração no módulo
   if not DM.UsuarioLogado.TemPermissao(1101, npAlterar, true) then Exit;

   // Guarda os valores da origem para efetuar o update posteriormente
   iAnoSemestre := (Source as TDBGrid).DataSource.DataSet.FieldByName('anosemestre').AsInteger;
   iCodigoAluno := (Source as TDBGrid).DataSource.DataSet.FieldByName('codigoaluno').AsInteger;
   iCodMatriculaCurso := (Source as TDBGrid).DataSource.DataSet.FieldByName('cd_matricula_curso').AsInteger;
   sTurma := (Source as TDBGrid).DataSource.DataSet.FieldByName('turma').AsString;

   // Alterna para linha onde o mouse está posicionado
   if ((Sender as TDBGrid).MouseCoord(X, Y).Y > 0) then begin
      (Sender as TDBGrid).DataSource.DataSet.MoveBy((Sender as TDBGrid).MouseCoord(X, Y).Y - THackDBGrid(Sender as TDBGrid).Row);
   end
   else begin
      Exit;
   end;
   // Se o código de Matrícula Curso é o mesmo, então não há porque trocar
   if iCodMatriculaCurso = (Sender as TDBGrid).DataSource.DataSet.FieldByName('cd_matricula_curso').AsInteger then begin
      Exit;
   end;

   // Monta a mensagem de solicitação de confirmação
   sAnoSemestre := (Sender as TDBGrid).DataSource.DataSet.FieldByName('nr_anosem_ingresso').AsString;
   sAnoSemestre := Copy(sAnoSemestre, 0, 4) + '/' + Copy(sAnoSemestre, 5, 1);
   sMsg := StringReplace(MSG_CONFIRMACAO, '$curso$', (Sender as TDBGrid).DataSource.DataSet.FieldByName('cd_curso').AsString, [rfReplaceAll, rfIgnoreCase]);
   sMsg := StringReplace(sMsg, '$anosemestre_mc$', sAnoSemestre, [rfReplaceAll, rfIgnoreCase]);
   sMsg := StringReplace(sMsg, '$turma$', sTurma, [rfReplaceAll, rfIgnoreCase]);
   sAnoSemestre := IntToStr(iAnoSemestre);
   sAnoSemestre := Copy(sAnoSemestre, 0, 4) + '/' + Copy(sAnoSemestre, 5, 1);
   sMsg := StringReplace(sMsg, '$turma$', sTurma, [rfReplaceAll, rfIgnoreCase]);
   sMsg := StringReplace(sMsg, '$anosemestre_m$', sAnoSemestre, [rfReplaceAll, rfIgnoreCase]);

   // Você quer realmente fazer isso ?
   if (Mensagem(sMsg, 'Atenção!!', MB_YESNO + MB_ICONQUESTION) = IDNO) then begin
      Exit;
   end;

   // Efetua o update
   DM.CriarConsulta(qyAtuMatricula);
   try
      qyAtuMatricula.SQL.Text := SQL_UPDATE_MATRICULA;
      qyAtuMatricula.ParamCheck := true;
      qyAtuMatricula.ParamByName('anosemestre').AsInteger := iAnoSemestre;
      qyAtuMatricula.ParamByName('turma').AsString := sTurma;
      qyAtuMatricula.ParamByName('codigoaluno').AsInteger := iCodigoAluno;
      qyAtuMatricula.ParamByName('cd_matricula_curso').AsInteger := (Sender as TDBGrid).DataSource.DataSet.FieldByName('cd_matricula_curso').AsInteger;
      qyAtuMatricula.ExecSQL;
   finally
      qyAtuMatricula.Free;
   end;

   // Atualiza
   Self.tblMatriculasEtapa.Close;
   Self.tblMatriculasEtapa.Open;
end;

procedure Tfrm_Alunos.DBGrid3DblClick(Sender: TObject);
begin
   if not tblMatriculaCurso.IsEmpty then
   begin
      if not DM.UsuarioLogado.TemPermissao(1009, npAlterar, true) then Exit;

      Application.CreateForm(TFrmMatricularCurso, FrmMatricularCurso);
      FrmMatricularCurso.qyMatriculaCurso.Close();
      FrmMatricularCurso.qyMatriculaCurso.Close();
      FrmMatricularCurso.qyMatriculaCurso.ParamByName('cd_matricula_curso').AsInteger := tblMatriculaCursocd_matricula_curso.AsInteger;
      FrmMatricularCurso.qyMatriculaCurso.Open();
      FrmMatricularCurso.qyMatriculaCurso.Edit();
      FrmMatricularCurso.ShowModal;

      qryUpdateMat.ParamByName('CD_MATRICULA_CURSO').AsInteger := tblMatriculaCursoCD_MATRICULA_CURSO.AsInteger;
      qryUpdateMat.ExecSQL;

      tblMatriculaCurso.Close();
      tblMatriculaCurso.Open();

      FreeAndNil(FrmMatricularCurso);
   end;
end;

procedure Tfrm_Alunos.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var qySQL : TUMZQuery;
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

procedure Tfrm_Alunos.tblResponsavelAfterInsert(DataSet: TDataSet);
begin
   { Colocar Valores Padrões - Futuramente, pegar em Tabela de Parametros }
   tblResponsavelds_nacionalidade.AsString := 'BRASILEIRA';
   tblResponsaveldt_cadastro.AsString := DateToStr(DataHoje);
end;

procedure Tfrm_alunos.atualizarGruposTodasColigadas(iCodAluno:Integer);
var
   iCodigoPessoa, iColigada : Integer;
   qyColigadasMatriculas : TUMZQuery;
begin
   DM.CriarConsulta(qyColigadasMatriculas);

   // Busca todas as coligadas que o aluno possui alguma matrícula
   qyColigadasMatriculas.SQL.Text := ''+
      'SELECT DISTINCT t.cd_coligada as cd_coligada FROM '
      + ' matriculas m INNER JOIN turmas t ON '
      + ' (m.turma = t.codigo AND m.anosemestre = t.anosemestre) '
      + ' WHERE m.codigoaluno = :cd_pessoa';
   qyColigadasMatriculas.ParamByName('cd_pessoa').AsInteger := iCodAluno;
   qyColigadasMatriculas.Open();

   // Percorre todas as coligadas que encontrou e executa para cada coligada
   while not qyColigadasMatriculas.eof do
   begin
      DM.atualizarGruposPessoa(
         iCodAluno,
         qyColigadasMatriculas.FieldByName('cd_coligada').AsInteger,
         true
      );
      qyColigadasMatriculas.Next();
   end;
end;

procedure Tfrm_Alunos.tblResponsavelBeforePost(DataSet: TDataSet);
var
   qryVerificaDuplicidade : TUMZQuery;
begin
   tblResponsavelds_nacionalidade.AsString := GetActiveComboBoxNacionalidade().Items[GetActiveComboBoxNacionalidade().ItemIndex];

  // Efetuar a Validação do CPF
  dm.CriarConsulta(qryVerificaDuplicidade);
  if (tblResponsavelds_cpf.AsString <> '') AND (tblResponsavelds_cpf.AsString<> '00000000000')then
  begin
  
     qryVerificaDuplicidade.Close();
     qryVerificaDuplicidade.SQL.Text := ' SELECT                              '+
                                        '    cd_pessoa, nm_pessoa               '+
                                        ' FROM                                '+
                                        '    pessoas                              '+
                                        ' WHERE                               '+
                                        '    ds_cpf like ' + QuotedStr(tblResponsavelds_cpf.AsString) + ' ';
     qryVerificaDuplicidade.Open();

     if not qryVerificaDuplicidade.Eof and not(qryVerificaDuplicidade.FieldByName('cd_pessoa').AsInteger = tblResponsavelcd_pessoa.AsInteger ) then
     begin
       Mensagem('Atenção, existe outra pessoa com o mesmo CPF: ' + CHR(13) +
                  'Nome: ' + qryVerificaDuplicidade.FieldByName('nm_pessoa').AsString + CHR(13) +
                  'Código: ' + qryVerificaDuplicidade.FieldByName('cd_pessoa').AsString, 'Atenção', MB_OK + MB_ICONWARNING);
       btAcad_Salvar.Enabled :=  true;
       btAcad_Cancelar.Enabled := true;

       Abort;
     end;
  end;

  
  //retro-compatibilidade
  tblResponsavelds_cidade.AsString := tblMunicipioAtualRespds_municipio.asstring;
  tblResponsavelds_cidade_nascimento.AsString := tblMunicipioResp.FieldByName('ds_municipio').asString;

  // Gravar nome sem acento para BUSCA
  tblResponsavelnm_sem_acento.AsString := SemAcento( tblREsponsavelnm_pessoa.AsString );

  // Data de Revisão = Data de Hoje
  tblResponsaveldt_revisao.AsString := DateToStr(DataHoje);

  // Registrar Funcionário que alterou o cadastro
  tblResponsavelcd_usuario.AsInteger := DM.iCdPessoaLogado;

  if (tblResponsavelds_senha.AsString = '') and (tblResponsavelsn_senha_provisoria.AsString = '') then
  begin
     tblResponsavelds_senha.AsString := FormatDateTime('ddmmyy', tblResponsavel.FieldByName('dt_nascimento').AsDateTime);
     tblResponsavelsn_senha_provisoria.AsString := 'S';
  end;

  tblPessoa.Edit;

  // Gravar o código do responsável no cadastro do aluno
  if pgPessoa.ActivePage = tsPai then begin
     iCodPaiMae :=  tblResponsavelcd_pessoa.AsInteger;
  end
  else if pgPessoa.ActivePage = tsMae then begin
     iCodPaiMae :=  tblResponsavelcd_pessoa.AsInteger;
  end
  else if pgPessoa.ActivePage = tsRespAcademico then  begin
     tblPessoacd_resp_acad.AsInteger := tblResponsavelcd_pessoa.AsInteger;
     iCodPaiMae :=  tblResponsavelcd_pessoa.AsInteger;
  end
  else if pgPessoa.ActivePage = tsRespFinanceiro then begin
     iCodPaiMae :=  tblResponsavelcd_pessoa.AsInteger;

     //verifica as mensalidades para a troca de responsável
     if (DM.variavel_parametro('atualizar_responsavel_titulo') = 'S') then
        DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, tblResponsavelcd_pessoa.AsInteger, tblPessoacd_resp_finan.AsInteger);

     tblPessoacd_resp_finan.AsInteger := tblResponsavelcd_pessoa.AsInteger;
  end;


  tblPessoa.Post;

  atualizarGruposTodasColigadas(tblPessoacd_pessoa.AsInteger);

  if (desLogradouro_aluno <> '') then
  begin
      tbltplogradouro.First;
      while not tbltplogradouro.Eof do
      begin

         if tblTpLogradourods_logradouro.AsString = desLogradouro_aluno then
         begin
            tblResponsavelcd_logradouro.AsInteger := tblTpLogradourocd_logradouro.asInteger;
         end;


         tbltplogradouro.Next;
      end;
  end;
end;

procedure Tfrm_Alunos.cbProvAlunoClick(Sender: TObject);
var
   qrySenhaProvisoriaAluno : TUMZQuery;
begin
  inherited;
  dm.CriarUniConsulta(qrySenhaProvisoriaAluno);

  if (cbProvAluno.Checked = true) then
   begin
      qrySenhaProvisoriaAluno.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "S" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaAluno.ParamByName('cd_pessoa').AsString := edCodigoAluno.Text;
      qrySenhaProvisoriaAluno.ExecSQL();
      qrySenhaProvisoriaAluno.Close();
   end
  else
   begin
      qrySenhaProvisoriaAluno.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "N" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaAluno.ParamByName('cd_pessoa').AsString := edCodigoAluno.Text;
      qrySenhaProvisoriaAluno.ExecSQL();
      qrySenhaProvisoriaAluno.Close();
   end;
end;

procedure Tfrm_Alunos.cbProvAlunoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   tblPessoa.Edit;
end;

procedure Tfrm_Alunos.cbProvMaeClick(Sender: TObject);
var
   qrySenhaProvisoriaMae : TUMZQuery;
begin
  inherited;
  
  dm.CriarUniConsulta(qrySenhaProvisoriaMae);

  if (cbProvMae.Checked = true) then
   begin
      qrySenhaProvisoriaMae.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "S" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaMae.ParamByName('cd_pessoa').AsString := edCodigoMae.Text;
      qrySenhaProvisoriaMae.ExecSQL();
   end
  else
   begin
      qrySenhaProvisoriaMae.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "N" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaMae.ParamByName('cd_pessoa').AsString := edCodigoMae.Text;
      qrySenhaProvisoriaMae.ExecSQL();
   end;
end;

procedure Tfrm_Alunos.cbProvMaeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   tblPessoa.Edit;
end;

procedure Tfrm_Alunos.cbProvPaiClick(Sender: TObject);
var
   qrySenhaProvisoriaPai : TUMZQuery;
begin
  inherited;
  dm.CriarUniConsulta(qrySenhaProvisoriaPai);

  if (cbProvPai.Checked = true) then
   begin
      qrySenhaProvisoriaPai.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "S" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaPai.ParamByName('cd_pessoa').AsString := edCodigoPai.Text;
      qrySenhaProvisoriaPai.ExecSQL();
      qrySenhaProvisoriaPai.Close();
   end
  else
   begin
      qrySenhaProvisoriaPai.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "N" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaPai.ParamByName('cd_pessoa').AsString := edCodigoPai.Text;
      qrySenhaProvisoriaPai.ExecSQL();
      qrySenhaProvisoriaPai.Close();
   end;

end;

procedure Tfrm_Alunos.cbProvPaiMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   tblPessoa.Edit;
end;

procedure Tfrm_Alunos.cbProvRespAcadClick(Sender: TObject);
var
   qrySenhaProvisoriaRespAcad : TUMZQuery;
begin
  inherited;
  dm.CriarUniConsulta(qrySenhaProvisoriaRespAcad);

  if (cbProvRespAcad.Checked = true) then
   begin
      qrySenhaProvisoriaRespAcad.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "S" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaRespAcad.ParamByName('cd_pessoa').AsString := edCodigoRespAcad.Text;
      qrySenhaProvisoriaRespAcad.ExecSQL();
      qrySenhaProvisoriaRespAcad.Close();
   end
  else
   begin
      qrySenhaProvisoriaRespAcad.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "N" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaRespAcad.ParamByName('cd_pessoa').AsString := edCodigoRespAcad.Text;
      qrySenhaProvisoriaRespAcad.ExecSQL();
      qrySenhaProvisoriaRespAcad.Close();
   end;
end;

procedure Tfrm_Alunos.cbProvRespAcadMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   tblPessoa.Edit;
end;

procedure Tfrm_Alunos.cbProvRespFinanClick(Sender: TObject);
var
   qrySenhaProvisoriaRespFinan : TUMZQuery;
begin
  inherited;
  dm.CriarUniConsulta(qrySenhaProvisoriaRespFinan);

  if (cbProvRespFinan.Checked = true) then
   begin
      qrySenhaProvisoriaRespFinan.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "S" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaRespFinan.ParamByName('cd_pessoa').AsString := edCodigoRespFinan.Text;
      qrySenhaProvisoriaRespFinan.ExecSQL();
      qrySenhaProvisoriaRespFinan.Close();
   end
  else
   begin
      qrySenhaProvisoriaRespFinan.SQL.Text := ''+
         ' UPDATE ' +
         '    pessoas ' +
         ' SET ' +
         '    sn_senha_provisoria  = "N" ' +
         ' WHERE ' +
         '    cd_pessoa = :cd_pessoa';
      qrySenhaProvisoriaRespFinan.ParamByName('cd_pessoa').AsString := edCodigoRespFinan.Text;
      qrySenhaProvisoriaRespFinan.ExecSQL();
      qrySenhaProvisoriaRespFinan.Close();
   end;
end;

procedure Tfrm_Alunos.cbProvRespFinanMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   tblPessoa.Edit;
end;

function Tfrm_Alunos.checkAtividadesPraticas(AICodigoAluno:integer;AINrAnoSemestre:Integer): boolean;
var
   qryAtividadesPendentes :TUMZQuery;
   iVlPercentualAluno : Integer;
   iVlParametroPercentualMin :Integer;
begin

  try

   DM.CriarConsulta(qryAtividadesPendentes);

   //calcular porcentual de atividades da turma
   with qryAtividadesPendentes do begin
         SQL.Text := ''+
                     ' SELECT        '+
                     '   ifnull(ROUND((tbl_atividades_participadas.total_participadas / tbl_atividades.total_atividades_turma ) * 100),100)as vl_percentual_aluno  '+
                     ' FROM      ' +
                     '   (        '  +
                     '      SELECT        ' +
                     '         count(da.cd_atividade) AS total_atividades_turma    ' +
                     '      FROM                '  +
                     '         diario_atividades AS da     '  +
                     '      WHERE            '   +
                     '         da.nr_anosemestre = :pAnosemestre  AND ' +
                     '         da.cd_turma IN '+
                     '                        ( '+
                     '                          SELECT   '+
                     '                            da.cd_turma    '+
                     '                          FROM '+
                     '                            fichaindividual fi   '+
                     '                          INNER JOIN   '+
                     '                            diario_atividades da on (da.cd_turma = fi.turma AND da.nr_anosemestre = fi.anosemestre AND da.cd_curso=fi.curso AND da.cd_disciplina = fi.disciplina)  '+
                     '                          WHERE         '+
                     '                            anosemestre =:pAnosemestre    AND codigoaluno = :pCDPessoa  '+
                     '                          GROUP  '+
                     '                              BY cd_turma   '+
                     '                         ) '+
                     '   ) AS tbl_atividades,   '   +
                     '   (      ' +
                     '      SELECT    ' +
                     '         count(daa.cd_atividade) AS total_participadas  ' +
                     '      FROM     ' +
                     '         diario_atividades  AS da    ' +
                     '         INNER JOIN diario_atividades_alunos AS daa ON( da.cd_atividade =  daa.cd_atividade)  '+
                     '      WHERE     ' +
                     '         da.nr_anosemestre = :pAnosemestre AND  ' +
                     '         daa.cd_pessoa = :pCDPessoa AND ' +
                     '         daa.sn_presente =  1   '  +
                     '   ) AS tbl_atividades_participadas      ';

         ParamByName('pAnosemestre').asInteger := AINrAnoSemestre;
         ParamByName('pCDPessoa').AsInteger := AICodigoAluno;

         Open();

         if not EOF then
         begin
            iVlPercentualAluno        :=  FieldByName('vl_percentual_aluno').asInteger;
            iVlParametroPercentualMin := StrToInt(DM.variavel_parametro('percentual_pendencia_atividades'));
            //percentual suficiente
            if (iVlPercentualAluno >= iVlParametroPercentualMin) then
            begin
               Result:=true;
               exit;
            end
            else
            begin
               //percentual insuficiente abaixo do parametro  percentual_pendencia_atividades
               Result:=false;
               exit;
            end;
         end
         else
         begin //sem resultados na query quer dizer que não existem atividades para esta disciplina então retorna true
            Result:= true;
            exit;
         end;//if

   end;//with  qryAtividadesPendentes
  finally
   qryAtividadesPendentes.Free;
  end;//try

   Result := true;
   exit;
end;

procedure Tfrm_Alunos.ComboBoxClick(Sender: TObject);
begin
   {
   Habilita os botões para salvar e cancelar indicando para o usuário que
   as informações na combo dinamica estão sendo alteradas e precisam ser salvas
   }
   btIncluir_Pessoa.Enabled  := False;
   btAlterar_Pessoa.Enabled  := False;
   btExcluir_Pessoa.Enabled  := False;
   btBuscar_Pessoa.Enabled   := False;
   btFechar_Pessoa.Enabled   := False;

   btSalvar_Pessoa.Enabled   := True;
   btCancelar_Pessoa.Enabled := True;
   tblPessoa.Edit;
end;

//procedure checkAtividades

procedure Tfrm_Alunos.tblResponsavelNewRecord(DataSet: TDataSet);
var
  lngAux : Longint;
begin
  lngAux := DM.NovoCodigoPessoa( 'Local.CadastroAluno.Responsavel' );
  tblResponsavelcd_pessoa.AsInteger := lngAux;
  tblResponsavel.ParamByName('cd_responsavel').AsInteger := lngAux;

   VSTContatosEditor.LoadPessoa(
      TPessoa.Create(tblResponsavelcd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblResponsavelcd_pessoa.AsInteger, 1003))
   );

  GetVSTContatosResponsavel().LoadPessoa(TPessoa.Create(lngAux), NOT(PodeAlterarContatosResponsavel(lngAux)));

  tblResponsavelsn_pai_resp.AsInteger := 1;
  tblResponsavelsn_mae_resp.AsInteger := 1;
end;

procedure Tfrm_Alunos.tblResponsaveltp_certGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

    if Sender.AsInteger = 1 then
       Text := 'Nascimento'
    else if Sender.AsInteger = 2 then
       Text := 'Casamento'
    else if Sender.AsInteger = 3 then
       Text := 'Divórcio'
    else
       Text := '';
end;

procedure Tfrm_Alunos.tblResponsaveltp_certSetText(Sender: TField;
  const Text: string);
begin
   if Text = 'Nascimento' then
      Sender.AsInteger := 1
   else if Text = 'Casamento' then
      Sender.AsInteger := 2
   else if Text = 'Divórcio' then
      Sender.AsInteger := 3
   else Sender.AsInteger := 0;
end;

procedure Tfrm_Alunos.AtualizaCampoProfissao(Sender: TObject);
var
   sSqlOriginal, sConteudo,
   categoria_atual, sResultSQl,
   sChave, sValor  : String;
   codigo_pessoa, iPosicaoSeparador, iContadorSrings  : integer;
   lstItens : TStringList;
   qyConsultaLista,qryOrigem, qryAlterarCamposObrigatorios : TUMZQuery;
   permInserir, permEditar: Boolean;
begin
   // Desenha a Combo novamente para atualizar as opções
   FreeAndNil(cbProfissaoDinamica);

   if cbProfissaoDinamica = nil then
   begin
      // função usada para gerar o campo de profissão dinamicamente
      //inherited;
      qyCampos.Close();
      qyCategorias.Close();
      qyCampos.Open();
      qyCategorias.Open();
   
      permInserir := validaCategoria(
         qyCategorias.FieldByName('cd_acao').AsInteger,
         npIncluir
      );

      permEditar := validaCategoria(
         qyCategorias.FieldByName('cd_acao').AsInteger,
         npAlterar
      );

      dm.CriarConsulta(qryAlterarCamposObrigatorios);

      if ( qyCamposDS_CHAVE.AsString = 'profissao' )
      THEN
      begin
         if (qyCamposDS_TIPO.AsString = 'S') then
         begin
            codigo_pessoa := tblPessoacd_Pessoa.AsInteger;

            // Se entrou aqui é porque possui um cadastro de profissoes nos campos adicionais
            // Então torna o campo digitavel(EDIT) invisivel, e mostra a combo dinâmica
            dbProfissao.Visible := False;

            btnAddProfissao.Visible := True;

            qryAlterarCamposObrigatorios.SQL.Add(
               ' UPDATE '
               + '	nu_cadastro_obrigatorio_campo '
               + ' SET '
               + ' ds_chave = "dbComboProfissao" '
               + ' WHERE '
               + ' ds_chave = "dbProfissao" '
            );

            qryAlterarCamposObrigatorios.ExecSQL();

            cbProfissaoDinamica := TUMComboBox.Create(Self);

            with cbProfissaoDinamica do
            begin
               Parent     := Panel2;
               left       := 295;
               Top        := 145;
               TabOrder   := 14;
               Tag        := qyCampos.FieldByName('cd_campo').AsInteger;
               Style      := csDropDownList;
               Hint       := qyCampos.FieldByName('ds_categoria').AsString;
               Width      := 241;
               Name       := 'dbComboProfissao';
               OnClick    := ComboBoxClick;

               qyCadastroCampos_Opcoes.Close;
               sSqlOriginal :=   qyCadastroCampos_Opcoes.SQL.Text;

               qyCadastroCampos_Opcoes.SQL.add(
                  ' AND ctc.cd_pessoa ='''
                  + IntToStr( codigo_pessoa )
                  +''''
               );

               qyCadastroCampos_Opcoes.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
               qyCadastroCampos_Opcoes.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               qyCadastroCampos_Opcoes.Open;

               if(qyCadastroCampos_Opcoes.FieldByName('ds_conteudo').AsString <>'') then
               begin
                  sConteudo := qyCadastroCampos_Opcoes.FieldByName('ds_conteudo').AsString ;
               end
               else
               begin
                  qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal + ' LIMIT 1 ';
                  qyCadastroCampos_Opcoes.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
                  qyCadastroCampos_Opcoes.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
                  qyCadastroCampos_Opcoes.close;
                  qyCadastroCampos_Opcoes.Open;
               end;

               if(qyCadastroCampos_Opcoesme_sql.AsString ='') then
               begin
                  lstItens := explode(
                     qyCadastroCampos_Opcoesme_opcoes.AsString
                     ,';'
                  );
               end
               else
               begin
                  DM.CriarConsulta( qyConsultaLista );
                  qyConsultaLista.SQL.Text := qyCadastroCampos_Opcoesme_sql.AsString;
                  qyConsultaLista.Open;
                  sResultSQl := '';
                  while not(qyConsultaLista.Eof) do
                  begin
                     sResultSQl := (
                        sResultSQl
                        + qyConsultaLista.Fields[1].AsString
                        + ';'
                     );
                     qyConsultaLista.Next;
                  end;
                  lstItens:= explode(
                     sResultSQl ,
                     ';'
                  );
               end;

               qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal ;

               iContadorSrings := 0;

               Enabled := permEditar or permInserir;

               {Verifica qual item ja deve vir seleciona}
               while lstItens.Count > iContadorSrings do
               begin
                  iPosicaoSeparador := Length( lstItens.Strings[iContadorSrings] );

                  sChave := copy(
                     lstItens.Strings[iContadorSrings],
                     0,
                     iPosicaoSeparador
                  );

                  sValor := copy(
                     lstItens.Strings[iContadorSrings],
                     0,
                     iPosicaoSeparador
                  );

                  AddItem(
                     sValor,
                     TOpcoesItens.Create(
                        sChave,
                        sValor
                     )
                  );

                  if sChave = sConteudo then
                  begin
                     Enabled := permEditar;

                     ItemIndex := iContadorSrings;
                  end;

                  inc(iContadorSrings);
               end;

               lstItens.Free;

               if ItemIndex = -1 then
               begin
                  ItemIndex := 0;
               end;
            end;
         end;
      end
      else
      begin
         dbProfissao.Visible := True;
         btnAddProfissao.Visible := False;
      
         qryAlterarCamposObrigatorios.SQL.Add(
            ' UPDATE '
            + '	nu_cadastro_obrigatorio_campo '
            + ' SET '
            + ' ds_chave = "dbProfissao" '
            + ' WHERE '
            + ' ds_chave = "dbComboProfissao" '
         );

         qryAlterarCamposObrigatorios.ExecSQL();
      end;
   end;
end;


function Tfrm_Alunos.validaCategoria(cd_acao: Integer; nivelPermissao: TUMNivelPermissao): Boolean;
var
   qryBuscaChave: TUMZReadOnlyQuery;
const

   SQL_BUSCA_CHAVE =
      'SELECT ' +
      '	CONCAT(nm.ds_chave, ''.'', nma.ds_chave) AS chave ' +
      'FROM ' +
      '	nu_modulos_acoes AS nma ' +
      'INNER JOIN nu_modulos AS nm ON( ' +
      ' 	nm.cd_modulo = nma.cd_modulo ' +
      ') ' +
      'WHERE ' +
      '	nma.cd_acao = :cd_acao';
begin
   // função usada para gerar o campo de profissão dinamicamente
   Result := True;

   DM.CriarConsulta(qryBuscaChave);

   qryBuscaChave.SQL.Text := SQL_BUSCA_CHAVE;
   qryBuscaChave.ParamByName('cd_acao').AsInteger := cd_acao;
   qryBuscaChave.Open;

   if qryBuscaChave.RecordCount > 0 then
   begin
      Result := DM.UsuarioLogado.TemPermissao(
         DM.UsuarioLogado.Pessoa.Codigo,
         qryBuscaChave.FieldByName('chave').AsString,
         nivelPermissao,
         False
      );

      Exit;
   end;

   Result := False;
end;

procedure Tfrm_Alunos.VerificaCheckSenhaProvisoria(
  permissaoAlterarSenhaProvisoria: Boolean
);
begin
   cbProvAluno.Enabled     := permissaoAlterarSenhaProvisoria and (edCodigoAluno.Text <> '');
   cbProvMae.Enabled       := permissaoAlterarSenhaProvisoria and (edCodigoMae.Text <> '');;
   cbProvPai.Enabled       := permissaoAlterarSenhaProvisoria and (edCodigoPai.Text <> '');;
   cbProvRespAcad.Enabled  := permissaoAlterarSenhaProvisoria and (edCodigoRespAcad.Text <> '');;
   cbProvRespFinan.Enabled := permissaoAlterarSenhaProvisoria and (edCodigoRespFinan.Text <> '');;
end;

function Tfrm_Alunos.verificaCpfPassaporte: boolean;
var
   nacionalidade,
   passaporte,
   CPF: String;
   tipoValidacaoCpf: String;
   permiteCPFzerado: Boolean;
begin
   Result := True;

   nacionalidade := '';
   
   if pgPessoa.ActivePage = tsPai then
   begin
      nacionalidade := cbNacionalidadePai.Text;
      passaporte := tblResponsavelds_passaporte.AsString;
      CPF := tblResponsavelds_cpf.AsString;
      permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado_resp') = 'S');
      tipoValidacaoCpf:= 'Resp';
   end
   else
   if pgPessoa.ActivePage = tsMae then
   begin
      nacionalidade := cbNacionalidadeMae.Text;
      passaporte := tblResponsavelds_passaporte.AsString;
      CPF := tblResponsavelds_cpf.AsString;
      permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado_resp') = 'S');
      tipoValidacaoCpf:= 'Resp';
   end
   else
   if pgPessoa.ActivePage = tsRespAcademico then
   begin
      nacionalidade := cbNacionalidadeRespAcad.Text;
      passaporte := tblResponsavelds_passaporte.AsString;
      CPF := tblResponsavelds_cpf.AsString;
      permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado_resp') = 'S');
      tipoValidacaoCpf:= 'Resp';
   end
   else
   if pgPessoa.ActivePage = tsRespFinanceiro then
   begin
      nacionalidade := DBEdit9.Text;
      passaporte := tblResponsavelds_passaporte.AsString;
      CPF := tblResponsavelds_cpf.AsString;
      permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado_resp') = 'S');
      tipoValidacaoCpf:= 'Resp';
   end
   else
   if pgPessoa.ActivePage = tsDadosPessoais then
   begin
      nacionalidade := dbNacionalidade.Text;
      passaporte := dbPassaporte.Text;
      CPF := tblPessoads_cpf.AsString;
      permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado_alunos') = 'S');
      tipoValidacaoCpf:= 'Aluno';
   end
   else
   if pgPessoa.ActivePageIndex in [1,2,7] then
   begin
      permiteCPFzerado := (DM.variavel_parametro('permite_cpf_zerado') = 'S');
      tipoValidacaoCpf:= '';
      Exit;
   end;

   if ((LowerCase(nacionalidade) <> 'brasileira') AND (nacionalidade <> '')) then
   begin

      if (CPF <> '') and not(ValidaCPF(CPF, tipoValidacaoCpf)) then
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
      if not ValidaCPF( CPF, tipoValidacaoCpf ) then
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

procedure Tfrm_Alunos.cbNacionalidadeExit(Sender: TObject);
begin
   if (tblPessoa.State IN [dsInsert, dsEdit]) AND (dbNacionalidade.ItemIndex = -1) then
   begin
      Mensagem('Selecione uma Nacionalidade Válida');
      dbNacionalidade.SetFocus;
   end;
end;

procedure Tfrm_Alunos.cbNacionalidadePaiChange(Sender: TObject);
var
   Key: Word;
   selectedIndex : Integer;
begin
   Key := 0;
   selectedIndex := TUMComboBox(Sender).ItemIndex;

   cbNacionalidadePaiKeyDown(Sender, Key, [ssShift]);

   if ( tblResponsavel.State in [dsEdit] ) AND
      ( TUMComboBox(Sender).Items.Objects[TUMComboBox(Sender).Items.Count-1] = nil ) then
   begin
      TUMComboBox(Sender).Items.Delete(TUMComboBox(Sender).Items.Count-1);
      TUMComboBox(Sender).ItemIndex := selectedIndex;
   end;
end;

procedure Tfrm_Alunos.cbNacionalidadePaiCloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
  inherited;
   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString := DBLookupComboBox18.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT * '+
      'FROM estados ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;
end;

procedure Tfrm_Alunos.cbNacionalidadePaiExit(Sender: TObject);
begin
   if (tblResponsavel.State IN [dsInsert, dsEdit]) AND (TUMComboBox(Sender).ItemIndex = -1) then
   begin
      Mensagem('Selecione uma Nacionalidade Válida');
      TUMComboBox(Sender).SetFocus;
   end;
end;

procedure Tfrm_Alunos.cbNacionalidadePaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   selectedIndex : Integer;
begin
   if Key = VK_F5 then
      Exit;

   selectedIndex := TUMComboBox(Sender).ItemIndex;

   if (tblResponsavel.State in [dsInactive]) then
   begin
      btIncluir_PessoaClick(Sender);
   end else if ( tblResponsavel.State in [dsBrowse] ) then
   begin
      tblResponsavel.Edit();

   end;
end;

procedure Tfrm_Alunos.cbNacionalidadePaiKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 Then
   Begin
      SelectNext(Sender as TWinControl, True, True);
      Key := #0;
   End;
end;

procedure Tfrm_Alunos.btnRematricularClick(Sender: TObject);
const
   STitInfo = 'Informação';
   SInfoSemRespFinan = 'Não foi selecionado um responsável financeiro para este aluno. Esta informação é imprescindível para prosseguir com a matrícula.';
   SInfoPendenciaFin = 'O aluno possui pendência financeira. Usuário não possui permissão para realizar a matrícula nesta situação.';
   SInfoPendenciaDoc = 'Foi encontrada pendência na documentação do aluno. Usuário não possui permissão para matricular o aluno nesta situação.';
   SQuestPendenciaAtiv = 'Aluno possui pendências em atividades práticas necessárias.'#13'Deseja continuar mesmo assim?';
   sFinanceiro = 'Aluno possui pendência(s) na biblioteca. Deseja visualizar?';
   SMatriculaBloqueada =
      'A matrícula deste aluno está sendo bloqueada pelo parâmetro [estuda_reserv_matric_bloqueados]. '+
      'Verifique se o aluno possui pendências financeiras ou jurídicas. ' +
      'Se todas as pendências foram resolvidas, remova o código do aluno do parâmetro [estuda_reserv_matric_bloqueados].';
var
   AnoSem, MatriculaCurso: Integer;
   qryTemIntegracao, qryTurmaColigada : TUMZQuery;
begin
   if DM.IsMatriculaBloqueada(tblPessoacd_pessoa.AsInteger) then
   begin
      MessageDlg(SMatriculaBloqueada, mtInformation, [mbOK], 0);
      Exit;
   end;

   // Verifica se o aluno possui um responsável financeiro definido para poder
   // realizar o ajuste de matrícula (rematrícula)

   DM.CriarConsulta(qryTemIntegracao);
   qryTemIntegracao.SQL.Text :=
   '  SELECT                              '+
   '    sn_multa_cobranca_biblioteca      '+
   '  FROM                                '+
   '    bib_config                        '+
   '  WHERE                               '+
   '    sn_multa_cobranca_biblioteca = 1  ';
   qryTemIntegracao.Open;

   if not(qryTemIntegracao.IsEmpty) AND  BibFinanceiroPendente then
   begin
      if (MessageBox(Handle,PChar(sFinanceiro),PChar(STitInfo),MB_ICONINFORMATION+MB_YESNO) = mrYes) then
      begin
         frmPendenciaFinanceiras :=  TfrmPendenciaFinanceiras.Create(nil);
         frmPendenciaFinanceiras.cd_pessoa := tblPessoacd_pessoa.AsInteger;
         frmPendenciaFinanceiras.ShowModal;
         FreeAndNil(frmPendenciaFinanceiras);
      end;
   end;
   FreeAndnil(qryTemIntegracao);   

   dm.CriarConsulta(qryTurmaColigada);

   qryTurmaColigada.SQL.Text := ''+
   'SELECT              '+
   '  cd_coligada       '+
   'FROM                '+
   '  turmas            '+
   'WHERE               '+
   '  codigo = :codigo  '+
   '  AND curso = :curso '+
   'LIMIT 1             ';

   qryTurmaColigada.ParamByName('curso').AsString := tblMatriculasEtapacd_curso_atual.AsString;
   qryTurmaColigada.ParamByName('codigo').AsString := tblMatriculasEtapaturma.AsString;
   qryTurmaColigada.Open;

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
         
         if FinanceiroPendente and
            not DM.UsuarioLogado.TemPermissao(1019, npIncluir, False) then
         begin
            MessageDlg(SInfoPendenciaFin, mtWarning, [mbOK], -1);
         end

         // Se o aluno possui alguma pendência de documentação e o usuário não
         // possui privilégios suficientes para prosseguir o processo de ajuste
         // de matrícula apesar das pendências, então o processo é cancelado

         else if DocumentoPendente and
            not DM.UsuarioLogado.TemPermissao(1019, npAlterar, False) then
         begin
            MessageDlg(SInfoPendenciaDoc, mtWarning, [mbOK], -1);
         end

         // Verifica se o parâmetro para verificar pendências de atividades
         // extracurriculares está habilitado e se possui alguma pendência
         // nessas atividades. Se encontrar pendência e o usuário possui
         // privilégios suficientes, este é questionado se deseja dar sequência
         // ao processo de ajuste de matrícula. Caso contrário, o processo é
         // cancelado
         
         else if (DM.variavel_parametro('verificar_pendencia_atividades') = 'S') and
            (not checkAtividadesPraticas(tblPessoacd_pessoa.AsInteger, AnoSem)) and
            (not DM.UsuarioLogado.TemPermissao(1019, npAlterar, False) or
               (MessageDlg(SQuestPendenciaAtiv, mtConfirmation, [mbYes, mbNo], -1) = mrNo)) then
         begin
            if not DM.UsuarioLogado.TemPermissao(1019, npAlterar, False) then
            begin
               MessageDlg(SInfoPendenciaDoc, mtWarning, [mbOK], -1);
            end;
         end
         else
         begin
         
            // Alerta o usuário sobre pendências financeiras e de documentação
            // do aluno selecionado, permitindo visualizá-las
            if AlertarPendencias then
            begin
               Exit;
            end;

            // Verifica se está utilizando o novo processo de matrícula ou o
            // antiga, para definir que tela será apresentada para o usuário
            
            if (DM.variavel_parametro('novo.processo.matricula') = 'S') then
            begin
               Application.CreateForm(TfMatricular, fMatricular);
               fMatricular.Ajuste := True;
               fMatricular.Pessoa := tblPessoacd_pessoa.AsInteger;
               fMatricular.Curso := tblMatriculaCursocd_curso.AsString;
               fMatricular.NomePessoa := tblPessoanm_pessoa.AsString;
               // Define se a rematricula acontece para o próximo curso
               if tblMatriculasEtapa.FieldByName('sn_proximo_curso').AsInteger > 0 then
               begin
                  fMatricular.RematriculaNovoCurso := tblMatriculasEtapa.FieldByName('cd_curso_atual').AsString;
                  if tblMatriculasEtapa.FieldByName('situacao').AsInteger <> 9 then
                  begin
                     fMatricular.RematriculaNovoCurso := tblMatriculasEtapa.FieldByName('cd_proximo_curso').AsString;
                  end;
               end else begin
                  fMatricular.RematriculaNovoCurso := '';
               end;
               fMatricular.cd_coligada := qryTurmaColigada.fieldbyname('cd_coligada').AsInteger;
               fMatricular.ShowModal;
            end
            else
            begin
               Application.CreateForm(TfrmMatricular, frmMatricular);
               frmMatricular.iIngressoPadrao := GetFormaIngresso(2);
               
               fMatricular.cd_coligada := qryTurmaColigada.fieldbyname('cd_coligada').AsInteger;

               try
                  // Se o aluno não possui uma matrícula curso, então direciona
                  // o usuário para realizar uma matrícula no curso para o aluno
               
                  if tblMatriculaCurso.IsEmpty then
                  begin
                     Application.CreateForm(
                        TFrmMatricularCurso,
                        FrmMatricularCurso
                     );
                     MatriculaCurso := FrmMatricularCurso.IncluirMatricula(
                        tblPessoacd_pessoa.AsInteger, AnoSem);
                     frmMatricular.CheckBox1.OnClick := nil;
                     frmMatricular.CheckBox1.Checked := False;

                     // Verifica se a matrícula no curso foi bem sucedida para
                     // realizar a matrícula na etapa
                  
                     if MatriculaCurso <> -1 then
                        MatricularEtapa(MatriculaCurso,
                           FrmMatricularCurso.qyMatriculaCursocd_curso.AsString,
                           FrmMatricularCurso.qyMatriculaCursonr_anosem_ingresso.AsInteger,
                           FrmMatricularCurso.qyMatriculaCursonr_matricula.AsString
                        );
                  end
                  else
                  begin

                     // Realiza a matrícula na etapa

                     MatriculaCurso := tblMatriculaCursoCD_MATRICULA_CURSO.AsInteger;
                     frmMatricular.CheckBox1.OnClick := nil;
                     frmMatricular.CheckBox1.Checked := True;
                     MatricularEtapa(MatriculaCurso,
                        tblMatriculaCursocd_curso.AsString, AnoSem,
                        tblMatriculaCursonr_matricula.AsString
                     );
                  end;
               finally
                  FreeAndNil(frmMatricular);
                  FreeAndNil(FrmMatricularCurso);
                  tblMatriculaCurso.Close;
                  tblMatriculaCurso.Open;
               end;
            end;
         end;
      end;
   end
   else
   begin
      MessageDlg(
         SInfoSemRespFinan,
         mtWarning,
         [mbOK],
         -1
      );
      pgPessoa.ActivePage := tsRespFinanceiro;
      pgPessoaChange( nil );
   end;
   tblMatriculaCurso.Refresh();
   tblMatriculasEtapa.Refresh();
end;

procedure Tfrm_Alunos.btn_ImprimirAcadeClick(Sender: TObject);
begin
  inherited;
  if tblPessoacd_pessoa.AsInteger <> 0 then
  begin
   if pgPessoa.ActivePage <> tsMatricula then
   Begin
       tblMatriculaCurso.Close;
       tblMatriculaCurso.Open;
       tblMatriculasEtapa.Close;
       tblMatriculasEtapa.Open;
       tblMatriculasEtapa.Last;
       tblMatriculaCurso.First;
   End;

   Application.CreateForm(TfrmImpAlunos, frmImpAlunos);
   frmImpAlunos.ShowModal;
   FreeAndNil(frmImpAlunos);
  end;
end;

procedure Tfrm_Alunos.btAcad_NovoClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
begin

   if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;

    msg := '';

    iCod := 0;
    GetActiveComboBoxNacionalidade.ItemIndex := -1;
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
       tblPessoa.Edit;
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

function Tfrm_Alunos.BibFinanceiroPendente : boolean;
var
  qryMultaPendente : TUMZQuery;
begin
  dm.CriarConsulta(qryMultaPendente);
  qryMultaPendente.SQL.Text :=
  '  SELECT                           ' +
  '    cd_multa                       ' +
  '  FROM                             ' +
  '     bib_multas bm                 ' +
  '     INNER JOIN bib_emprestimos be ON (be.cd_emprestimo = bm.cd_emprestimo) ' +
  '  WHERE                            ' +
  '     be.cd_pessoa = :cd_pessoa AND     ' +
  '     bm.cd_situacao = 1            ' +
  '' ;
  qryMultaPendente.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
  qryMultaPendente.Open;
  Result := not qryMultaPendente.IsEmpty;
  FreeAndNil(qryMultaPendente);
end;

function Tfrm_Alunos.AlertarPendencias: Boolean;
const
   ActionKey = 'UMFinanceiro.Pessoas.Alunos.Matriculas.Financeiro';
   SMsgPendencia = 'Este aluno possui pendências financeiras. Para regularização da situação do aluno, utilize o módulo Financeiro.';
var
   S: AnsiString;
begin

   Result := False;

   // Alertar sobre pendencias financeiras
   if btnFinanceiro.Tag <> 0 then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, ActionKey, npAcesso, False) then
      begin
         if Mensagem('Aluno contém mensalidade(s) em aberto.'#13'Deseja visualizá-la(s) ?', 'Confirmação', MB_YESNO + MB_ICONWARNING) = ID_YES then
         begin
            btnFinanceiro.Click;
         end;
      end
      else
      begin
         Mensagem(SMsgPendencia, 'Informação', MB_ICONINFORMATION or MB_OK, Handle);
      end;
   end;

   S := DM.variavel_parametro('sn_avisa_financeiro_pendencia_alunos_resp');
   S := AnsiUpperCase(S);

   if S = 'S' then
   begin
      //
   end;

   // Alertar sobre pendencias na documentaçào
   if btnDocumentos.tag <> 0 then
   begin
      if Mensagem(
         'Aluno contém pendência com documentos necessários.' + #13 + 'Deseja visualizá-lo(s) ?',
         'Confirmação',
         MB_YESNO + MB_ICONWARNING ) = ID_YES then
      begin
     	   btnDocumentosClick( nil );
      end;
   end;

   // Verificando, por parâmetro, se o indivíduo tem livros em atraso na biblioteca
   if ( DM.variavel_parametro( 'sn_avisa_financeiro_pendencia_biblioteca' ) = 'S' ) and
      ( DM.TemLivrosAtrasados( tblPessoa.FieldByName('cd_pessoa').AsInteger ) ) then
   begin
      if DM.UsuarioLogado.TemPermissao(DM.GetUsuarioLogado.Pessoa.Codigo, 'Academico.MatriculaComPendencias', npAcesso, False) then
      begin
         Result := True;
         if Mensagem(
            'Este aluno possui livros em atraso na biblioteca.' + #13 + 'Deseja realizar a matrícula mesmo assim ?',
            'Confirmação',
            MB_YESNO + MB_ICONWARNING ) = ID_YES then
         begin
            Result := False;
            Exit;
         end;
      end
      else
      begin
         Mensagem(
            'Este aluno possui livros em atraso na biblioteca.',
            'Confirmação',
            MB_OK + MB_ICONWARNING );

         Result := True;
         Exit;
      end;
   end;
end;

procedure Tfrm_Alunos.bbtnHistoricoClick(Sender: TObject);
begin
   if DM.UsuarioLogado.TemPermissao(1015, npAcesso, True) then
   begin
      if not PrincipalForm.ProcuraForm(frm_historico_anterior) then
      begin
         Application.CreateForm(Tfrm_historico_anterior, frm_historico_anterior);
      end;
      with frm_historico_anterior do
      begin
         txtAluno.Text := tblPessoacd_pessoa.AsString;
         txtCurso.Text := tblMatriculaCursocd_curso.AsString;
         SetCodigoAluno(tblPessoacd_pessoa.AsInteger);
         SetCodigoMatriculaCurso(tblMatriculaCursoCD_MATRICULA_CURSO.AsInteger);
         tcSeries.TabIndex := 0;
         Filtra;
         Show;
      end;
   end;
end;

procedure Tfrm_Alunos.btAcad_AlunoClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
   cd_pessoa :  Integer;	
begin

   cd_pessoa := tblPessoacd_pessoa.AsInteger;
   if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;

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

       if(tblPessoadt_nascimento.AsDateTime = 0) then
       begin
         Mensagem('Não é possivel definir como responsável financeiro uma pessoa sem data de nascimento cadastrada.', 'Alerta', MB_OK + MB_ICONWARNING);
         exit;
       end;

       VerificaMaiorIdade(tblPessoadt_nascimento.AsDateTime);
       if (bMenorIdade) then
         if Mensagem(msgIdade, 'Unimestre', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes Then Exit;

       // Atualizar responsável
        if (DM.variavel_parametro('atualizar_responsavel_titulo') = 'S') AND (pgPessoa.ActivePage = tsRespFinanceiro) then
           DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, tblPessoacd_pessoa.AsInteger, tblPessoacd_resp_finan.AsInteger);
       tblPessoa.Edit;
       tblPessoacd_resp_finan.AsInteger := tblPessoacd_pessoa.ASInteger;
       tblPessoa.Post;
    end
    else Exit;

    tblPessoa.Close;
    tblPessoa.ParamByName('cd_pessoa').AsInteger := cd_pessoa;
    tblPessoa.Open;
    
    tblResponsavel.Close();
    tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_pessoa.AsInteger;
    tblResponsavel.Open();
    {setando o parametro da query de muncipios}
    tblMunicipioResp.Close;
    tblMunicipioResp.ParamByName('ds_estado_nascimento').AsString := tblResponsavelds_estado_nascimento.AsString;
    tblMunicipioResp.Open;
    tblMunicipioResp.Close;
    tblMunicipios.ParamByName('uf_nascimento').AsString := tblResponsavelds_estado.AsString;
    tblMunicipioResp.Open;

    pgPessoaChange(nil);
end;

procedure Tfrm_Alunos.btAcad_BuscaClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
   qyRespIdade : TUMZQuery;
   dtNasc : TDateTime;
begin

   if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;

    msg := '';

    iCod := 0;

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
    resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

    if resultado_filtro.filtrado then
    Begin
       tblPessoa.Edit;

       if pgPessoa.ActivePage = tsPai then begin
          tblPessoacd_pai.AsInteger := resultado_filtro.cd_pessoa;
       end
       else if pgPessoa.ActivePage = tsMae then begin
          tblPessoacd_mae.AsInteger := resultado_filtro.cd_pessoa;
       end
       else if pgPessoa.ActivePage = tsRespAcademico then
          tblPessoacd_resp_acad.AsInteger := resultado_filtro.cd_pessoa
       else if pgPessoa.ActivePage = tsRespFinanceiro then begin
         //verifica as mensalidades para a troca de responsável
         {verifica se o pai é maior de idade}
         DM.CriarConsulta(qyRespIdade);
         qyRespIdade.SQL.Text := ''
         +'SELECT                 '
         +'   dt_nascimento       '
         +'FROM                   '
         +'   pessoas             '
         +'WHERE                  '
         +'   cd_pessoa = ' + IntToStr(resultado_filtro.cd_pessoa);
         qyRespIdade.Open;
         dtNasc := qyRespIdade.FieldByName('dt_nascimento').AsDateTime;
         qyRespIdade.Free;
         VerificaMaiorIdade(dtNasc);
         tblPessoacd_resp_finan.AsInteger := resultado_filtro.cd_pessoa;

         if(dtNasc = 0) then
         begin
            Mensagem('Não é possivel definir como responsável financeiro uma pessoa sem data de nascimento cadastrada.',  'Alerta', MB_OK + MB_ICONWARNING);
            exit;
         end;
         if (DM.variavel_parametro('atualizar_responsavel_titulo') = 'S') then
            DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, resultado_filtro.cd_pessoa, tblPessoacd_resp_finan.AsInteger);

       end;

       if (bMenorIdade) then
         if Mensagem(msgIdade, 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

       tblPessoa.Post();
       tblResponsavel.Close();
       tblResponsavel.ParamByName('cd_responsavel').AsInteger := resultado_filtro.cd_pessoa;
       tblResponsavel.Open();

       if (tblResponsavelds_senha.AsString = '') and (tblResponsavelsn_senha_provisoria.AsString = '') and (tblResponsaveldt_nascimento.AsString <> '') then
       begin
          tblResponsavel.Edit();
          tblResponsavelds_senha.AsString := MD5Print(MD5String(FormatDateTime('ddmmyy', tblResponsavel.FieldByName('dt_nascimento').AsDateTime)));
          tblResponsavelsn_senha_provisoria.AsString := 'S';
          tblResponsavel.Post();
       end;

       if (pgPessoa.ActivePage = tsDadosPessoais) then
       begin
          nomeOriginal := dbNome.Text;
          cpfOriginal := dbCpf.Text;
       end;
       if (pgPessoa.ActivePage = tsPai) then
       begin
          nomeOriginal := dbNomePai.Text;
          cpfOriginal := dbCPFPai.Text;
       end;
       if (pgPessoa.ActivePage = tsMae) then
       begin
          nomeOriginal := dbNomeMae.Text;
          cpfOriginal := dbCPFMae.Text;
       end;
       if (pgPessoa.ActivePage = tsRespAcademico) then
       begin
          nomeOriginal := dbNomeRespAcad.Text;
          cpfOriginal := dbCPFAcad.Text;
       end;
       if (pgPessoa.ActivePage = tsRespFinanceiro) then
       begin
          nomeOriginal := dbNomeRespFinan.Text;
          cpfOriginal := dbCPFFinan.Text;
       end;

    End;

   if (pgDocFinan.ActivePageIndex = 0) then
   begin
      pnl4.Top := 272;
      pgDocFinan.Height := 119;
   end
   else
   begin
      pgDocFinan.Height := 70;
      pnl4.Top := 232;
   end;
   

   if (pgDocAcad.ActivePageIndex = 0) then
   begin
      pnl3.Top := 272;
      pgDocAcad.Height := 119;
   end
   else
   begin
      pgDocAcad.Height := 70;
      pnl3.Top := 232;
   end;


   if (pgDocMae.ActivePageIndex = 0) then
   begin
      pnl2.Top := 272;
      pgDocMae.Height := 119;
   end
   else
   begin
      pgDocMae.Height := 70;
      pnl2.Top := 232;
   end;

   
   if (pgDocPai.ActivePageIndex = 0) then
   begin
      pnl1.Top := 272;
      pgDocPai.Height := 119;
   end
   else
   begin
      pgDocPai.Height := 70;
      pnl1.Top := 232;
   end;

   pgPessoaChange(nil);
end;

procedure Tfrm_Alunos.pgDocAcadChange(Sender: TObject);
begin
  inherited;
   if (pgDocAcad.ActivePageIndex = 0) then
   begin
      pnl3.Top := 272;
      pgDocAcad.Height := 119;
   end
   else
   begin
      pgDocAcad.Height := 70;
      pnl3.Top := 232;
   end;
end;

procedure Tfrm_Alunos.pgDocFinanChange(Sender: TObject);
begin
  inherited;
  if (pgDocFinan.ActivePageIndex = 0) then
   begin
      pnl4.Top := 272;
      pgDocFinan.Height := 119;
   end
   else
   begin
      pgDocFinan.Height := 70;
      pnl4.Top := 232;
   end;
end;

procedure Tfrm_Alunos.pgDocMaeChange(Sender: TObject);
begin
  inherited;
   if (pgDocMae.ActivePageIndex = 0) then
   begin
      pnl2.Top := 272;
      pgDocMae.Height := 119;
   end
   else
   begin
      pgDocMae.Height := 70;
      pnl2.Top := 232;
   end;
end;

procedure Tfrm_Alunos.pgDocPaiChange(Sender: TObject);
begin
  inherited;
   if (pgDocPai.ActivePageIndex = 0) then
   begin
      pnl1.Top := 272;
      pgDocPai.Height := 119;
   end
   else
   begin
      pgDocPai.Height := 70;
      pnl1.Top := 232;
   end;
end;

procedure Tfrm_Alunos.pgPessoaChange(Sender: TObject);
const
   SQLSelectHierarquia = ''
      + ' SELECT '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT DISTINCT '
      + ' 			p_to.cd_grupo '
      + ' 		FROM '
      + ' 			nu_grupos_pessoas p_to '
      + '  '
      + ' 				LEFT JOIN ( '
      + ' 					SELECT DISTINCT '
      + ' 						h.cd_grupo_liberado '
      + ' 					FROM '
      + ' 						nu_grupos_hierarquia h '
      + '  '
      + ' 							JOIN nu_grupos_pessoas p ON '
      + ' 								(h.cd_grupo = p.cd_grupo) '
      + ' 					WHERE '
      + ' 						p.cd_pessoa = ? '
      + ' 				) t ON '
      + ' 					(p_to.cd_grupo = t.cd_grupo_liberado) '
      + ' 		WHERE '
      + ' 			p_to.cd_pessoa = p.cd_pessoa AND '
      + ' 			t.cd_grupo_liberado IS NULL '
      + ' 	), '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT DISTINCT '
      + ' 			p_to.cd_grupo '
      + ' 		FROM '
      + ' 			nu_grupos_pessoas p_to '
      + '  '
      + ' 				LEFT JOIN ( '
      + ' 					SELECT DISTINCT '
      + ' 						h.cd_grupo_liberado '
      + ' 					FROM '
      + ' 						nu_grupos_hierarquia h '
      + '  '
      + ' 							JOIN nu_grupos_pessoas p ON '
      + ' 								(h.cd_grupo = p.cd_grupo) '
      + ' 					WHERE '
      + ' 						p.cd_pessoa = ? '
      + ' 				) t ON '
      + ' 					(p_to.cd_grupo = t.cd_grupo_liberado) '
      + ' 		WHERE '
      + ' 			p_to.cd_pessoa = p.cd_pai AND '
      + ' 			t.cd_grupo_liberado IS NULL '
      + ' 	), '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT DISTINCT '
      + ' 			p_to.cd_grupo '
      + ' 		FROM '
      + ' 			nu_grupos_pessoas p_to '
      + '  '
      + ' 				LEFT JOIN ( '
      + ' 					SELECT DISTINCT '
      + ' 						h.cd_grupo_liberado '
      + ' 					FROM '
      + ' 						nu_grupos_hierarquia h '
      + '  '
      + ' 							JOIN nu_grupos_pessoas p ON '
      + ' 								(h.cd_grupo = p.cd_grupo) '
      + ' 					WHERE '
      + ' 						p.cd_pessoa = ? '
      + ' 				) t ON '
      + ' 					(p_to.cd_grupo = t.cd_grupo_liberado) '
      + ' 		WHERE '
      + ' 			p_to.cd_pessoa = p.cd_mae AND '
      + ' 			t.cd_grupo_liberado IS NULL '
      + ' 	), '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT DISTINCT '
      + ' 			p_to.cd_grupo '
      + ' 		FROM '
      + ' 			nu_grupos_pessoas p_to '
      + '  '
      + ' 				LEFT JOIN ( '
      + ' 					SELECT DISTINCT '
      + ' 						h.cd_grupo_liberado '
      + ' 					FROM '
      + ' 						nu_grupos_hierarquia h '
      + '  '
      + ' 							JOIN nu_grupos_pessoas p ON '
      + ' 								(h.cd_grupo = p.cd_grupo) '
      + ' 					WHERE '
      + ' 						p.cd_pessoa = ? '
      + ' 				) t ON '
      + ' 					(p_to.cd_grupo = t.cd_grupo_liberado) '
      + ' 		WHERE '
      + ' 			p_to.cd_pessoa = p.cd_resp_acad AND '
      + ' 			t.cd_grupo_liberado IS NULL '
      + ' 	), '
      + ' 	NOT EXISTS ( '
      + ' 		SELECT DISTINCT '
      + ' 			p_to.cd_grupo '
      + ' 		FROM '
      + ' 			nu_grupos_pessoas p_to '
      + '  '
      + ' 				LEFT JOIN ( '
      + ' 					SELECT DISTINCT '
      + ' 						h.cd_grupo_liberado '
      + ' 					FROM '
      + ' 						nu_grupos_hierarquia h '
      + '  '
      + ' 							JOIN nu_grupos_pessoas p ON '
      + ' 								(h.cd_grupo = p.cd_grupo) '
      + ' 					WHERE '
      + ' 						p.cd_pessoa = ? '
      + ' 				) t ON '
      + ' 					(p_to.cd_grupo = t.cd_grupo_liberado) '
      + ' 		WHERE '
      + ' 			p_to.cd_pessoa = p.cd_resp_finan AND '
      + ' 			t.cd_grupo_liberado IS NULL '
      + ' 	) '
      + ' FROM '
      + ' 	pessoas p '
      + ' WHERE '
      + ' 	p.cd_pessoa = ? ';
var
   permissaoAlterarSenhaLogin, permissaoIncluirSenhaLogin, permissaoAlterarSenhaProvisoria: Boolean;
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   PodeAlterarPessoa, PodeAlterarPai, PodeAlterarMae, PodeAlterarRespAcad,
   PodeAlterarRespFinan: Boolean;   
begin
  inherited;

  desLogradouro_aluno := '';
  
  { Verificar qual a página e trocar a barra de menu  }
  if pgPessoa.ActivePage = tsDadosPessoais then begin
     toolPessoa.Visible    := True;
     toolAcademico.Visible := False;
     toolMatricula.Visible := False;

     tblPessoads_estado_nascimentoChange(nil);
     tblPessoads_estadoChange(nil);

      btBuscarPessoaAcad.Visible := true;

     sbPaisComboCloseUp(sbPaisCombo);

  End
  else if pgPessoa.ActivePage = tsComplementares then begin
      toolPessoa.Visible    := True;
      toolAcademico.Visible := False;
      toolMatricula.Visible := False;
      Self.atualizarDadosLogin();

      permissaoAlterarSenhaProvisoria := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, 'Academico.SenhaProvisoria', npAlterar, false);
      permissaoAlterarSenhaLogin := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false );
      permissaoIncluirSenhaLogin := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npIncluir, false );

      btnAddProfissao.Enabled := DM.UsuarioLogado.TemPermissao(
         1153,
         npIncluir,
         False
      );

      AtualizaCampoProfissao(Self);

      PodeAlterarPessoa := False;
      PodeAlterarPai := False;
      PodeAlterarMae := False;
      PodeAlterarRespAcad := False;
      PodeAlterarRespFinan := False;

      Stmt := PrepareStatement(SQLSelectHierarquia);
      try
         Stmt.SetInt(1, DM.UsuarioLogado.Pessoa.Codigo);
         Stmt.SetInt(2, DM.UsuarioLogado.Pessoa.Codigo);
         Stmt.SetInt(3, DM.UsuarioLogado.Pessoa.Codigo);
         Stmt.SetInt(4, DM.UsuarioLogado.Pessoa.Codigo);
         Stmt.SetInt(5, DM.UsuarioLogado.Pessoa.Codigo);
         Stmt.SetInt(6, tblPessoacd_pessoa.AsInteger);
         Rs := Stmt.ExecuteQueryPrepared;
         try
            if Rs.Next then
            begin
               PodeAlterarPessoa := Rs.GetInt(1) = 1;
               PodeAlterarPai := Rs.GetInt(2) = 1;
               PodeAlterarMae := Rs.GetInt(3) = 1;
               PodeAlterarRespAcad := Rs.GetInt(4) = 1;
               PodeAlterarRespFinan := Rs.GetInt(5) = 1;
            end;
         finally
            Rs.Close;
            Rs := nil;
         end;
      finally
         Stmt.Close;
         Stmt := nil;
      end;   

      VerificaCheckSenhaProvisoria(permissaoAlterarSenhaProvisoria);

      if ((not permissaoAlterarSenhaLogin) or (not PodeAlterarPessoa)) and
         (DM.UsuarioLogado.Pessoa.Codigo <> tblPessoacd_pessoa.AsInteger) then
      begin
         edLoginAluno.Enabled := False;
         edSenhaAluno.Enabled := False;
         edRedgAluno.Enabled := False;
         cbProvAluno.Enabled := False;
      end;

      if ((not permissaoAlterarSenhaLogin) or (not PodeAlterarPai)) and
         (DM.UsuarioLogado.Pessoa.Codigo <> tblPessoacd_pai.AsInteger) then
      begin
         edLoginPai.Enabled := False;
         edSenhaPai.Enabled := False;
         edRedgPai.Enabled := False;
         cbProvPai.Enabled := False;
      end;

      if ((not permissaoAlterarSenhaLogin) or (not PodeAlterarMae)) and
         (DM.UsuarioLogado.Pessoa.Codigo <> tblPessoacd_mae.AsInteger) then
      begin
         edLoginMae.Enabled := False;
         edSenhaMae.Enabled := False;
         edRedgMae.Enabled := False;
         cbProvMae.Enabled := False;
      end;

      if ((not permissaoAlterarSenhaLogin) or (not PodeAlterarRespAcad)) and
         (DM.UsuarioLogado.Pessoa.Codigo <> tblPessoacd_resp_acad.AsInteger) then
      begin
         edLoginRespAcad.Enabled := False;
         edSenhaRespAcad.Enabled := False;
         edRedgRespAcad.Enabled := False;
         cbProvRespAcad.Enabled := False;
      end;

      if ((not permissaoAlterarSenhaLogin) or (not PodeAlterarRespFinan)) and
         (DM.UsuarioLogado.Pessoa.Codigo <> tblPessoacd_resp_finan.AsInteger) then
      begin
         edLoginRespFinan.Enabled := False;
         edSenhaRespFinan.Enabled := False;
         edRedgRespFinan.Enabled := False;
         cbProvRespFinan.Enabled := False;
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

     nomePessoa := dbNomePai.Text;
     cpfPessoa := dbCPFPai.Text;

     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := False;
     btAcad_Pai.Visible := False;
     btAcad_Mae.Visible := False;
     btDesvincular.Visible := True;
     btDesvincular.Hint := 'Desvincular Pai.';

     tblResponsavelds_estado_nascimentoChange(nil);
     tblResponsavelds_estadoChange(nil);

     btBuscarPessoaAcad.Visible := false;

      if (pgDocPai.ActivePageIndex = 0) then
      begin
         pnl1.Top := 272;
         pgDocPai.Height := 119;
      end
      else
      begin
         pgDocPai.Height := 70;
         pnl1.Top := 232;
      end;

      if not (tblResponsavelcd_pessoa.AsInteger > 0) then
      begin
         VSTContatosPaiEditor.UnLoadPessoa();
      end;

      DBLookupComboBox18CloseUp(DBLookupComboBox18);

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

     nomePessoa := dbNomeMae.Text;
     cpfPessoa := dbCPFMae.Text;

     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := False;
     btAcad_Pai.Visible := False;
     btAcad_Mae.Visible := False;
     btDesvincular.Visible := True;
     btDesvincular.Hint := 'Desvincular Mãe.';
     tblResponsavelds_estado_nascimentoChange(nil);
     tblResponsavelds_estadoChange(nil);

     btBuscarPessoaAcad.Visible := false;

      if (pgDocMae.ActivePageIndex = 0) then
      begin
         pnl2.Top := 272;
         pgDocMae.Height := 119;
      end
      else
      begin
         pgDocMae.Height := 70;
         pnl2.Top := 232;
      end;

      if not (tblResponsavelcd_pessoa.AsInteger > 0) then
      begin
         VSTContatosMaeEditor.UnLoadPessoa();
      end;

      DBLookupComboBox20CloseUp(DBLookupComboBox20);

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

     nomePessoa := dbNomeRespAcad.Text;
     cpfPessoa := dbCPFAcad.Text;

     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := True;
     btAcad_Pai.Visible := True;
     btAcad_Mae.Visible := True;
     btDesvincular.Visible := True;
     btDesvincular.Hint := 'Desvincular Responsável Acadêmico.';

     tblResponsavelds_estado_nascimentoChange(nil);
     tblResponsavelds_estadoChange(nil);

     btBuscarPessoaAcad.Visible := false;

   if (pgDocAcad.ActivePageIndex = 0) then
   begin
      pnl3.Top := 272;
      pgDocAcad.Height := 119;
   end
   else
   begin
      pgDocAcad.Height := 70;
      pnl3.Top := 232;
   end;

     if not (tblResponsavelcd_pessoa.AsInteger > 0) then
     begin
        VSTContatosRespAcadEditor.UnLoadPessoa();
     end;

   DBLookupComboBox22CloseUp(DBLookupComboBox22);

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

     nomePessoa := dbNomeRespFinan.Text;
     cpfPessoa := dbCPFFinan.Text;

     toolPessoa.Visible    := False;
     toolAcademico.Visible := True;
     toolMatricula.Visible := False;
     btAcad_Aluno.Visible := True;
     btAcad_Pai.Visible := True;
     btAcad_Mae.Visible := True;
     btDesvincular.Visible := True;
     btDesvincular.Hint := 'Desvincular Responsável Financeiro.';
     btDesvincular.Width := 90;

     tblResponsavelds_estado_nascimentoChange(nil);
     tblResponsavelds_estadoChange(nil);

     btBuscarPessoaAcad.Visible := false;

      if (pgDocFinan.ActivePageIndex = 0) then
      begin
         pnl4.Top := 272;
         pgDocFinan.Height := 119;
      end
      else
      begin
         pgDocFinan.Height := 70;
         pnl4.Top := 232;
      end;

      if not (tblResponsavelcd_pessoa.AsInteger > 0) then
      begin
         VSTContatosRespFinanEditor.UnLoadPessoa();
      end;

      DBLookupComboBox25CloseUp(DBLookupComboBox25);

  end
  else if pgPessoa.ActivePage = tsMatricula then begin
     if not DM.UsuarioLogado.TemPermissao( 1019, npAcesso, True ) then
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
     FinanceiroPendente();

     { / Verificando se existem pendências financeiras }

     { Verificando se existem pendências de documentos }
     DocumentoPendente();

     { / Verificando se existem pendências de documentos }

     { Verificando se existem obs. pedagógicas }
     btnOrientacao.Marked :=
        TfObservacoes.HasObservations(tblPessoacd_pessoa.AsInteger,
           okPedagogical);
     { / Verificando se existem obs. pedagógicas }

     tblMatriculaCurso.Close;
     tblMatriculaCurso.Open;

     tblMatriculasEtapa.Close;
     tblMatriculasEtapa.Open;

  end
  else if pgPessoa.ActivePage = tsComplementares then
  Begin
      atualizarDadosLogin;
  end else if pgPessoa.ActivePage = tsParentes then begin
     toolPessoa.Visible    := False;
     toolAcademico.Visible := False;
     toolMatricula.Visible := False;
  end;


  if (pgPessoa.ActivePage = tsDadosPessoais) then
  begin
     nomeOriginal := dbNome.Text;
     cpfOriginal := dbCpf.Text;
  end;
  if (pgPessoa.ActivePage = tsPai) then
  begin
    nomeOriginal := dbNomePai.Text;
    cpfOriginal := dbCPFPai.Text;
  end;
  if (pgPessoa.ActivePage = tsMae) then
  begin
    nomeOriginal := dbNomeMae.Text;
    cpfOriginal := dbCPFMae.Text;
  end;
  if (pgPessoa.ActivePage = tsRespAcademico) then
  begin
    nomeOriginal := dbNomeRespAcad.Text;
    cpfOriginal := dbCPFAcad.Text;
  end;
  if (pgPessoa.ActivePage = tsRespFinanceiro) then
  begin
    nomeOriginal := dbNomeRespFinan.Text;
    cpfOriginal := dbCPFFinan.Text;
  end;

   if ( GetActiveComboBoxNacionalidade() <> nil ) then
      FiltrarNacionalidade(tblResponsavelds_nacionalidade.AsString, GetActiveComboBoxNacionalidade());

  if (pgPessoa.ActivePageIndex >= 2) and (pgPessoa.ActivePageIndex <= 5) then
   nacionalidadeAtual := GetActiveComboBoxNacionalidade.ItemIndex;

end;

procedure Tfrm_Alunos.btAcad_PaiClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
   qyRespIdade : TUMZQuery;
   dtNasc : TDateTime;
begin

    if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;




    msg := '';

    iCod := 0;

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
    begin
      tblPessoasn_pai_resp.AsInteger := 1;
      tblPessoasn_mae_resp.AsInteger := 0;
    end;

{verifica se o pai é maior de idade}
    DM.CriarConsulta(qyRespIdade);
    qyRespIdade.SQL.Text := ''
       +'SELECT                 '
       +'   dt_nascimento       '
       +'FROM                   '
       +'   pessoas             '
       +'WHERE                  '
       +'   cd_pessoa = '+tblPessoacd_pai.AsString;
    qyRespIdade.Open;
    dtNasc := qyRespIdade.FieldByName('dt_nascimento').AsDateTime;
    qyRespIdade.Free;

    if(dtNasc = 0) then
    begin
      Mensagem('Não é possivel definir como responsável financeiro uma pessoa sem data de nascimento cadastrada.',  'Alerta', MB_OK + MB_ICONWARNING);
      exit;
    end;

    VerificaMaiorIdade(dtNasc);

    if (bMenorIdade) then
       if Mensagem(msgIdade, 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;
    if pgPessoa.ActivePage = tsRespAcademico then
       tblPessoacd_resp_acad.AsInteger := tblPessoacd_pai.AsInteger
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       tblPessoacd_resp_finan.AsInteger := tblPessoacd_pai.AsInteger;
       if (DM.variavel_parametro('atualizar_responsavel_titulo') = 'S') AND (pgPessoa.ActivePage = tsRespFinanceiro) then
          DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, tblPessoacd_pai.AsInteger, tblPessoacd_resp_finan.AsInteger);
    end;
    tblPessoa.Post;

    tblResponsavel.Close();
    tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_pai.AsInteger;
    tblResponsavel.Open();
    {setando o parametro da query de muncipios}
    tblMunicipioResp.Close;
    tblMunicipioResp.ParamByName('ds_estado_nascimento').AsString := tblResponsavelds_estado_nascimento.AsString;
    tblMunicipioResp.Open;
    tblMunicipioResp.Close;
    tblMunicipios.ParamByName('uf_nascimento').AsString := tblResponsavelds_estado.AsString;
    tblMunicipioResp.Open;

    pgPessoaChange(nil);
end;

procedure Tfrm_Alunos.btAcad_MaeClick(Sender: TObject);
var
   msg : String;
   iCod : Integer;
   qyRespIdade : TUMZQuery;
   dtNasc : TDateTime;
begin

    if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;


    msg := '';

    iCod := 0;
    if pgPessoa.ActivePage = tsPai then begin
       Exit;
    end
    else if pgPessoa.ActivePage = tsMae then begin
       Exit;
    end
    else if pgPessoa.ActivePage = tsRespAcademico then begin
       iCod := tblPessoacd_resp_acad.AsInteger;
       msg := 'Você deseja desvincular o responsável acadêmico atual inserindo a Mãe como responsável?';
    end
    else if pgPessoa.ActivePage = tsRespFinanceiro then begin
       iCod := tblPessoacd_resp_finan.AsInteger;
       msg := 'Você deseja desvincular o responsável financeiro atual inserindo a Mãe  como responsável?';
    end;

    if iCod > 0 then
      if Mensagem(msg, 'Confirmação', MB_YESNO + MB_ICONQUESTION) <> mrYes Then Exit;

    tblPessoa.Edit;

    if pgPessoa.ActivePage = tsRespAcademico then
    begin
       tblPessoasn_pai_resp.AsInteger := 0;
       tblPessoasn_mae_resp.AsInteger := 1;
    end;

    if pgPessoa.ActivePage = tsRespAcademico then
       tblPessoacd_resp_acad.AsInteger := tblPessoacd_mae.AsInteger
    else if pgPessoa.ActivePage = tsRespFinanceiro then
       tblPessoacd_resp_finan.AsInteger := tblPessoacd_mae.AsInteger;

    {verifica se a mãe é menor idade}
    DM.CriarConsulta(qyRespIdade);
    qyRespIdade.SQL.Text := ''
       +'SELECT                 '
       +'   dt_nascimento       '
       +'FROM                   '
       +'   pessoas             '
       +'WHERE                  '
       +'   cd_pessoa = '+tblPessoacd_mae.AsString;
    qyRespIdade.Open;
    dtNasc := qyRespIdade.FieldByName('dt_nascimento').AsDateTime;
    qyRespIdade.Free;
    VerificaMaiorIdade(dtNasc);

    if(dtNasc = 0) then
    begin
      Mensagem('Não é possivel definir como responsável financeiro uma pessoa sem data de nascimento cadastrada.',  'Alerta', MB_OK + MB_ICONWARNING);
      exit;
    end;
    if (bMenorIdade) then
       if Mensagem(msgIdade, 'Unimestre', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes then Exit;

    if (DM.variavel_parametro('atualizar_responsavel_titulo') = 'S') AND (pgPessoa.ActivePage = tsRespFinanceiro) then
       DM.atualizaResponsavelFinanc(tblPessoacd_pessoa.AsInteger, tblPessoacd_mae.AsInteger, tblPessoacd_resp_finan.AsInteger);

    tblPessoa.Post;
    tblResponsavel.Close();
    tblResponsavel.ParamByName('cd_responsavel').AsInteger := tblPessoacd_mae.AsInteger;
    tblResponsavel.Open();
    {setando o parametro da query de muncipios}
    tblMunicipioResp.Close;
    tblMunicipioResp.ParamByName('ds_estado_nascimento').AsString := tblResponsavelds_estado_nascimento.AsString;
    tblMunicipioResp.Open;
    tblMunicipioResp.Close;
    tblMunicipios.ParamByName('uf_nascimento').AsString := tblResponsavelds_estado.AsString;
    tblMunicipioResp.Open;

    pgPessoaChange(nil);
end;

procedure Tfrm_Alunos.btAcad_SalvarClick(Sender: TObject);
var
   nomeAltera : String;
   comboboxAtiva : TUMComboBox;
begin
   jaGerouLog := false;
   comboboxAtiva := GetActiveComboBoxNacionalidade;
  
   if comboboxAtiva <> nil then
   begin
     if (comboboxAtiva.Focused) and (comboboxAtiva.ItemIndex = -1) then
     begin
        TGeneral.FocarProximoCampo(Handle);

        {
           Ou seja, se verificamos novamente o foco do campo cbNacionalidade,
           e ele realmente estiver focado, significa que ouve erro de nacionalidade,
           então, abortamos a ação de salvar.
        }
        if comboboxAtiva.Focused then
        begin
           Exit;
        end;
     end;
   end;

  tblPessoa.Edit;

   if (pgPessoa.ActivePage = tsPai) then
   begin
      if (dbNomePai.Focused) then
      begin
         DBEdit69.SetFocus;
      end
      else
      begin
         dbNomePai.SetFocus;
      end;
   end;

   if (pgPessoa.ActivePage = tsMae) then
   begin
      if (dbNomeMae.Focused = true) then
      begin
         DBEdit77.SetFocus;
      end
      else
      begin
         dbNomeMae.SetFocus;
      end;
   end;

   if (pgPessoa.ActivePage = tsRespAcademico) then
   begin
      if (dbNomeRespAcad.Focused = true) then
      begin
         DBEdit14.SetFocus;
      end
      else
      begin
         dbNomeRespAcad.SetFocus;
      end;
   end;
   
   if (pgPessoa.ActivePage = tsRespFinanceiro) then
   begin
      if (dbNomeRespFinan.Focused = true) then
      begin
         DBEdit41.SetFocus;
      end
      else
      begin
         dbNomeRespFinan.SetFocus;
      end;
   end;

   //verifica campos obrigatórios
      if (not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name))) then
      begin
         exit;
      end;

  //Verifica campo CPF e Passaporte
  if verificaCpfPassaporte = False then
  begin
     abort;
  end;

 
  pgPessoa.SetFocus;
   if (dbnasc.Text = '  /  /    ' ) and (pgPessoa.ActivePage = tsDadosPessoais) and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
   begin
      if (Mensagem('O campo data de nascimento é obrigatório. Você deseja preenchê-lo agora?','Atenção',MB_YESNO) = ID_YES) then begin
         dbNasc.SetFocus;
         Abort;
      end;
   end;

   if (DBEdit72.Text = '  /  /    ') and (pgPessoa.ActivePage = tsMae) and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
   begin
      if (Mensagem('O campo data de nascimento é obrigatório. Você deseja preenchê-lo agora?','Atenção',MB_YESNO) = ID_YES) then
      begin
         DBEdit72.SetFocus;
         Abort;
      end;
   end;

   if (DBEdit57.Text = '  /  /    ' ) and (pgPessoa.ActivePage = tsPai) and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
   begin
      if (Mensagem('O campo data de nascimento é obrigatório. Você deseja preenchê-lo agora?','Atenção',MB_YESNO) = ID_YES) then
      begin
         DBEdit57.SetFocus;
         Abort;
      end;
   end;

   if (DBEdit10.Text = '  /  /    ') and (pgPessoa.ActivePage = tsRespAcademico) and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
   begin
      if (Mensagem('O campo data de nascimento é obrigatório. Você deseja preenchê-lo agora?','Atenção',MB_YESNO) = ID_YES) then
      begin
         DBEdit10.SetFocus;
         Abort;
      end;
   end;

   if (DBEdit35.Text = '  /  /    ') and (pgPessoa.ActivePage = tsRespFinanceiro) and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0')then
   begin
      if (Mensagem('O campo data de nascimento é obrigatório. Você deseja preenchê-lo agora?','Atenção',MB_YESNO) = IDYES) then
      begin
         DBEdit35.SetFocus;
         Abort;
      end;
   end;

   if (trim(dbNomeRespFinan.Text) = '' ) and (pgPessoa.ActivePage = tsRespFinanceiro) then
   begin
      Mensagem('O campo nome é obrigatório. Você precisa preenchê-lo.','Atenção',MB_OK);
      dbNome.SetFocus;
      Abort;
   end;

   tblPessoa.Post;
   tblPessoa.Open;
   tblPessoa.Edit;
   
  if (pgPessoa.ActivePage = tsRespFinanceiro) AND (dBEdit35.Text <> '  /  /    ') and (DM.variavel_nu_parametro('Academico.permite_datanascimento_zerada',0)= '0') then
  begin
    if(StrToDate(DBEdit35.Text) = 0) then
    begin
      Mensagem('Não é possivel definir como responsável financeiro uma pessoa sem data de nascimento cadastrada.',  'Alerta', MB_OK + MB_ICONWARNING);
      exit;
    end;

     VerificaMaiorIdade(StrToDate(DBEdit35.Text))
  end else begin
     bMenorIdade := false;
  end;

  if (bMenorIdade) then
     if Mensagem(msgIdade, 'Unimestre', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> mrYes Then Exit;

  if ( (pgPessoa.ActivePage = tsRespAcademico) or
       (pgPessoa.ActivePage = tsRespFinanceiro) or
       (pgPessoa.ActivePage = tsPai) or
       (pgPessoa.ActivePage = tsMae))then
  begin
     if( tblResponsavel.State = dsEdit ) AND ( not avisoAlteracaoCadastro() )then
     begin
        tblResponsavel.Cancel;
        tblPessoa.Cancel;
        exit;
     end else begin
        btAcad_Salvar.Enabled := false;
        btAcad_Cancelar.Enabled := false;
     end;
  end else if ( pgPessoa.ActivePage = tsDadosPessoais ) then
  begin
     if( tblPessoa.State = dsEdit ) AND ( not avisoAlteracaoCadastro() )then
     begin
        tblPessoa.Cancel;
        exit;
     end;
  end;

  inherited;

   if GetActiveComboBoxNacionalidade() <> nil then
   begin
      {
         Se o campo de nacionalidade estiver Focado, nós tiramos o foco dele,
         forçando para que o Foco vá para o campo Nome. Neste momento, existe uma programação
         no evento OnExit do cbNacionalidade, que válida o que o usuário digitou.

         Caso, o valor que o usuário tenha digitado esteja incorreto, o foco irá RETORNAR
         para o campo cbNacionalidade.
      }
      if GetActiveComboBoxNacionalidade().Focused then
      begin
         TGeneral.FocarProximoCampo(Handle);

         {
            Ou seja, se verificamos novamente o foco do campo cbNacionalidade,
            e ele realmente estiver focado, significa que ouve erro de nacionalidade,
            então, abortamos a ação de salvar.
         }
         if GetActiveComboBoxNacionalidade().Focused then
            Exit;
      end;
   end;

  if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;

  if (tblResponsavel.State in [dsEdit, dsInsert]) then
  begin

     if(pgPessoa.ActivePage = tsPai)then
        nomeAltera := dbNomePai.Text;

     if(pgPessoa.ActivePage = tsMae)then
     begin

        nomeAltera := dbNomeMae.Text;
     end;


     if(pgPessoa.ActivePage = tsRespAcademico)then
        nomeAltera := dbNomeRespAcad.Text;

     if(pgPessoa.ActivePage = tsRespFinanceiro)then
        nomeAltera := dbNomeRespFinan.Text;

     tblResponsavel.FieldByName('nm_pessoa').AsString := trim( nomeAltera );

     if (tblResponsavelds_senha.AsString = '') and (tblResponsavelsn_senha_provisoria.AsString = '') and (tblResponsaveldt_nascimento.AsString <> '') then
     begin
        tblResponsavelds_senha.AsString := MD5Print(MD5String(FormatDateTime('ddmmyy', tblResponsavel.FieldByName('dt_nascimento').AsDateTime)));
        tblResponsavelsn_senha_provisoria.AsString := 'S';
     end;
     tblResponsavel.Post;

     if (pgPessoa.ActivePage = tsDadosPessoais) then
     begin
        nomeOriginal := dbNome.Text;
        cpfOriginal := dbCpf.Text;
     end;
     if (pgPessoa.ActivePage = tsPai) then
     begin
        nomeOriginal := dbNomePai.Text;
        cpfOriginal := dbCPFPai.Text;
     end;
     if (pgPessoa.ActivePage = tsMae) then
     begin
        nomeOriginal := dbNomeMae.Text;
        cpfOriginal := dbCPFMae.Text;
     end;
     if (pgPessoa.ActivePage = tsRespAcademico) then
     begin
        nomeOriginal := dbNomeRespAcad.Text;
        cpfOriginal := dbCPFAcad.Text;
     end;
     if (pgPessoa.ActivePage = tsRespFinanceiro) then
     begin
        nomeOriginal := dbNomeRespFinan.Text;
        cpfOriginal := dbCPFFinan.Text;
     end;
  end;

  if (tblPessoa.State in [dsEdit, dsInsert]) then
     tblPessoa.FieldByName('nm_pessoa').Value := trim(  dbNome.Text );

  if tblResponsavel.State in [dsInsert, dsEdit] then
     tblResponsavel.Post;

  if not tblResponsavel.EOF Then begin
     verificar_contatos_padroes(tblResponsavelcd_pessoa.AsInteger);
  end;

  tblPessoa.Close;
  tblPessoa.Open;


  if (desLogradouro_aluno <> '') then
  begin
     tblResponsavel.Edit;
     tblResponsavel.FieldByName('desLogradouro').AsString := desLogradouro_aluno;
     tblResponsavel.Post;
  end;


  dbCodigo.SetFocus;
  btAcad_Salvar.Enabled := False;
  btAcad_Cancelar.Enabled := False;
end;

procedure Tfrm_Alunos.btAlterar_PessoaClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Exit;
  inherited;
end;

procedure Tfrm_Alunos.btAcad_CancelarClick(Sender: TObject);
var
   nacionalidadeAtualCont : Integer;
   existeNacionalidade : Boolean;
   comboboxAtiva : TUMComboBox;
begin

   desLogradouro_aluno := '';

   comboboxAtiva := GetActiveComboBoxNacionalidade;

   {Checa o status da tabela de pessoa para retornar a nacionalidade que esta gravada, na hora de ação do cancelamento}
   existeNacionalidade := false;
   if (tblResponsavel.State in [dsEdit]) then
   begin
      for nacionalidadeAtualCont := 0 to comboboxAtiva.Items.Count - 1 do
      begin
         if comboboxAtiva.items[nacionalidadeAtualCont] = tblResponsavelds_nacionalidade.AsString  then
         begin
            existeNacionalidade := true;
            break;
         end;
      end;

      if not existeNacionalidade then
         nacionalidadeAtualCont :=  nacionalidadeAtual;

   end
   else if (tblResponsavel.State in [dsInsert]) then
      nacionalidadeAtualCont := nacionalidadeAtual;


  inherited;
  tblResponsavel.Cancel;
  if (tblPessoa.State = dsEdit) then
     tblPessoa.Cancel;
  btAcad_Salvar.Enabled := False;
  btAcad_Cancelar.Enabled := False;
  comboboxAtiva.ItemIndex := nacionalidadeAtualCont;
  dbCodigo.SetFocus;

   if tblPessoacd_pessoa.AsInteger > 0 then
   VSTContatosEditor.LoadPessoa(
      TPessoa.Create(tblPessoacd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblResponsavelcd_pessoa.AsInteger, 1003))
   );

   if (tblResponsavelcd_pessoa.AsInteger > 0) and (pgPessoa.ActivePageIndex = 2) then
   VSTContatosPaiEditor.LoadPessoa(
      TPessoa.Create(tblResponsavelcd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblResponsavelcd_pessoa.AsInteger, 1003))
   );

   if (tblResponsavelcd_pessoa.AsInteger > 0) and (pgPessoa.ActivePageIndex = 3) then
   VSTContatosMaeEditor.LoadPessoa(
      TPessoa.Create(tblResponsavelcd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblResponsavelcd_pessoa.AsInteger, 1003))
   );

   if (tblResponsavelcd_pessoa.AsInteger > 0) and (pgPessoa.ActivePageIndex = 4) then
   VSTContatosRespAcadEditor.LoadPessoa(
      TPessoa.Create(tblResponsavelcd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblResponsavelcd_pessoa.AsInteger, 1003))
   );

   if (tblResponsavelcd_pessoa.AsInteger > 0) and (pgPessoa.ActivePageIndex = 5) then
   VSTContatosRespFinanEditor.LoadPessoa(
      TPessoa.Create(tblResponsavelcd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblResponsavelcd_pessoa.AsInteger, 1003))
   );

end;

procedure Tfrm_Alunos.tblResponsavelds_estadoChange(Sender: TField);
begin
  inherited;
   if (pgPessoa.ActivePage = tsDadosPessoais) then
   begin
      tblMunicipioAtual.Close();
      tblMunicipioAtual.ParamByName('ds_estado').ASString := tblResponsavelds_estado.AsString;
      tblMunicipioAtual.Open();
   end
   else
   begin
      tblMunicipioAtualResp.Close();
      tblMunicipioAtualResp.ParamByName('ds_estado').ASString := tblResponsavelds_estado.AsString;
      tblMunicipioAtualResp.Open();
   end;
end;

procedure Tfrm_Alunos.tblResponsavelds_estado_nascimentoChange(Sender: TField);
begin
  inherited;
   if (pgPessoa.ActivePage = tsDadosPessoais) then
   begin
      tblMunicipios.Close();
      tblMunicipios.ParamByName('uf_nascimento').ASString := tblResponsavelds_estado_nascimento.AsString;
      tblMunicipios.Open();
   end
   else
   begin
      tblMunicipioResp.Close();
      tblMunicipioResp.ParamByName('ds_estado_nascimento').ASString := tblResponsavelds_estado_nascimento.AsString;
      tblMunicipioResp.Open();
   end;
end;

procedure Tfrm_Alunos.tblResponsavelds_sexoGetText(Sender: TField;
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

procedure Tfrm_Alunos.tblResponsavelds_sexoSetText(Sender: TField;
  const Text: String);
begin
  inherited;
   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else
      if Text = 'Feminino'
      Then Sender.AsString := 'F';
end;

procedure Tfrm_Alunos.dsResponsavelDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   nomePessoa := tblResponsavel.FieldByName('nm_pessoa').AsString;
   cpfPessoa := tblResponsavel.FieldByName('ds_cpf').AsString;
end;

procedure Tfrm_Alunos.dsResponsavelStateChange(Sender: TObject);
Var
   EstaEditando : Boolean;
begin

      if tblResponsavel.State = dsInsert Then
	       if not DM.UsuarioLogado.TemPermissao( 1003, npIncluir, True ) then Begin
	       tblResponsavel.Cancel;
	       Exit;
      End;

      if tblResponsavel.State = dsEdit Then
	       if not DM.UsuarioLogado.TemPermissao( 1003, npAlterar, True ) then Begin
	          tblResponsavel.Cancel;
	       Exit;
	    End;

      { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblResponsavel.State in [dsEdit, dsInsert] );
      

      btAcad_Novo.Enabled  := not EstaEditando;
      btAcad_Busca.Enabled  := not EstaEditando;
      btAcad_Aluno.Enabled  := not EstaEditando;
      btAcad_Pai.Enabled := not EstaEditando;
      btAcad_Mae.Enabled   := not EstaEditando;
      btBuscarPessoaAcad.Enabled := not EstaEditando;
      btAcad_Fechar.Enabled   := not EstaEditando;

      btAcad_Salvar.Enabled   := EstaEditando;
      btAcad_Cancelar.Enabled := EstaEditando;

      if DBCheckBox1.State = cbGrayed then
      begin
         DBCheckBox1.State := cbUnchecked;
      end;

      if DBCheckBox9.State = cbGrayed then
      begin
         DBCheckBox9.State := cbUnchecked;
      end;
end;

function Tfrm_Alunos.PodeAlterarContatosResponsavel(const cd_pessoa: Integer; cd_permissao_tela: Integer = 0): Boolean;
begin
   Result := PodeAlterarContatos(cd_pessoa, cd_permissao_tela);

   if GetLabelHierarquiaResponsavel() <> nil then
   begin
      GetLabelHierarquiaResponsavel().Visible := NOT(Result);
   end;

   if GetLabelHierarquiaResponsavel().Visible = True then
   begin
      if GruposHierarquia(cd_pessoa) then
      begin
         GetLabelHierarquiaResponsavel().Visible := False;
      end;
   end;

end;

function Tfrm_Alunos.PodeAlterarSenha():boolean;
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
   '   p.cd_pessoa = '+ IntToStr(DM.iCdPessoaLogado)                          +
   ' GROUP BY                                                                '+
   '   ngh.cd_grupo_alternar , ngh.cd_grupo  , ngh.cd_grupo_liberado         ';

   qryGruposHierarquia.Close;
   qryGruposHierarquia.Open;

   for indice := 0 to lstGrupo.Count - 1 do
   begin
      if(not(qryGruposHierarquia.Locate('cd_grupo_liberado',lstGrupo[indice],[])))then
      begin
         if( lstGrupo[indice] <> '0' ) then
         begin
            Resultado := false;
            Break;
         end;
      end;
   end;
   Result := Resultado;
end;

function Tfrm_Alunos.responsavelFinanceiroMaiorIdade: Boolean;
const
   SQL_VERIFICA_RESP =
      'SELECT dt_nascimento FROM pessoas WHERE cd_pessoa = :pessoa';
var
   qryVerificaResp : TUMZQuery;
   bMenorIdadeAnterior : Boolean;
begin
   DM.CriarConsulta(qryVerificaResp);
   qryVerificaResp.SQL.Add(SQL_VERIFICA_RESP);
   qryVerificaResp.ParamByName('pessoa').AsString := tblPessoacd_resp_finan.AsString;
   qryVerificaResp.Open;

   result := false;
   if (Maior18(qryVerificaResp.FieldByName('dt_nascimento').AsDateTime,dm.DataAtual) = false) then
   begin
      result := (MessageBox(
         Handle,
         PChar('O responsável financeiro deste aluno é menor de idade, deseja alterar os dados do responsável antes de continuar?'),
         PChar('Alerta'),
         MB_ICONQUESTION or MB_YESNO
      ) = mrYes);
   end;

   FreeAndNil(qryVerificaResp);
end;

procedure Tfrm_Alunos.SalvarProfissoes;
var
   qyInserirProfissao : TUMZQuery;
   iIndiceAtual, i: integer;
begin

   for i:= 0 to Self.ComponentCount - 1 do
   begin
      if (Self.Components[i].ClassType = TUMComboBox) then
      begin
         if ( Self.Components[i].Name = 'dbComboProfissao' ) then
         begin
         
         DM.CriarConsulta(qyInserirProfissao);

         iIndiceAtual := (Self.Components[i] as TUMComboBox).ItemIndex ;
          qyRetornaCodCampo.Close();
          qyRetornaCodCampo.Open();
          qyProfissao.Close();
          qyProfissao.Open();

         if not(qyProfissao.Locate(
            'cd_pessoa;cd_campo;',
            VarArrayOf(
               [
                  tblPessoacd_Pessoa.AsInteger,
                  qyRetornaCodCampoCD_CAMPO.AsInteger
               ]
            ),
            []) )
         then
         begin

            qyInserirProfissao.SQL.Text := 'INSERT INTO pessoas_cadastro (cd_pessoa, cd_campo, ds_conteudo)';
            qyInserirProfissao.SQL.Add(' VALUES (:pessoa, :campo, :conteudo) ');


            { Inserir o novo valor }
            qyInserirProfissao.ParamByName('pessoa').AsInteger := tblPessoacd_Pessoa.AsInteger;
            qyInserirProfissao.ParamByName('campo').AsString := qyRetornaCodCampoCD_CAMPO.AsString ;

            if (Self.Components[i] as TUMComboBox).Items.Count > 0 then
            begin
               qyInserirProfissao.ParamByName('conteudo').AsString := ((Self.Components[i] as TUMComboBox).items.objects[iIndiceAtual] as TOpcoesItens).getDescricao;
            end
            else
            begin
               qyInserirProfissao.ParamByName('conteudo').AsString := '';
            end;
         end else
         begin
           qyInserirProfissao.SQL.Text := ''
           + ' UPDATE pessoas_cadastro SET'
           + '    cd_pessoa = :pessoa, '
           + '    cd_campo = :campo, '
           + '    ds_conteudo =:conteudo '
           + ' WHERE '
           + '    cd_pessoa = :pessoa AND'
           + '    cd_campo = :campo';

            qyRetornaCodCampo.Close();
            qyRetornaCodCampo.Open();

            { Alterar o novo valor }
            qyInserirProfissao.ParamByName('pessoa').AsInteger := tblPessoacd_Pessoa.AsInteger;
            qyInserirProfissao.ParamByName('campo').AsInteger := qyRetornaCodCampoCD_CAMPO.AsInteger ;

            if (Self.Components[i] as TUMComboBox).Items.Count > 0 then
            begin
               qyInserirProfissao.ParamByName('conteudo').AsString := ((Self.Components[i] as TUMComboBox).items.objects[iIndiceAtual] as TOpcoesItens).getDescricao;
            end
            else
            begin
               qyInserirProfissao.ParamByName('conteudo').AsString := '';
            end;
         end;


         qyInserirProfissao.ExecSQL;
         end;
      end;
   end;
end;

procedure Tfrm_Alunos.InicializaDadoLogin(qryRespon: TUMZQuery; cdRespon: Integer; edCodigo, edLogin, edSenha, edRedg: TEdit; lbPessoa:TLabel; cbProvisoria:TCheckBox);
var
   indiceLista   : Integer;
   bJahUtilizado : Boolean;
begin
   {Alimenta edição de login e senha da mae}
   with qryRespon do
   begin
      Close();
      SQL.Text := ' SELECT * FROM pessoas WHERE cd_pessoa = :pCDResp ';
      ParamByName('pCDResp').AsInteger := cdRespon;
      Open();

      listaDeBloqueados.Sort;
      bJahUtilizado := (listaDeBloqueados.Find(IntToStr(cdRespon),indiceLista));
      
      if not ((IsEmpty)) and (not bJahUtilizado) then
      begin
         edLogin.Enabled:=true;
         edLogin.Text :=  FieldByName('ds_login').AsString;
         edLogin.Color := clWindow;
         edCodigo.Enabled:=false;
         edCodigo.Text  := FieldByName('cd_pessoa').AsString;
         edCodigo.Color := cl3DLight;
         edSenha.Enabled:=true;
         edSenha.Text := '*****';
         edSenha.Color := clWindow;
         edRedg.Enabled:=true;
         edRedg.Text := '*****';
         cbProvisoria.Checked :=  (FieldByName('sn_senha_provisoria').AsString ='S');
         edRedg.Color := clWindow;
         lbPessoa.Caption :=FieldByName('nm_pessoa').asString;
         listaDeBloqueados.Add(IntToStr(cdRespon));
      end
      else
      begin
         edLogin.Enabled := false;
         edLogin.Text:= '';
         edLogin.Color := cl3DLight;
         edCodigo.Enabled := false;
         edCodigo.Text:= '';
         edCodigo.Color := cl3DLight;
         edSenha.Enabled := false;
         edSenha.Text:= '';
         edSenha.Color := cl3DLight;
         edRedg.Enabled := false;
         edRedg.Text:= '';
         cbProvisoria.Checked := false;
         cbProvisoria.Enabled := false;
         edRedg.Color := cl3DLight;
         if(bJahUtilizado) then
         begin
            lbPessoa.Caption := FieldByName('nm_pessoa').asString;
         end
         else
         begin
            lbPessoa.Caption := 'Sem Registro';
         end;

      end;
   end;
end;

procedure Tfrm_Alunos.btnAddProfissaoClick(Sender: TObject);
var
   frm : TfrmCadProfissoes;
begin
   inherited;

   frm := TfrmCadProfissoes.Create( frm_Alunos );
   if frm.showModal = mrOK then
   begin
      AtualizaCampoProfissao(nil);
   end;
end;

procedure Tfrm_Alunos.btnDocumentosClick(Sender: TObject);
begin

  inherited;

  Application.CreateForm(TfrmDocumentos,frmDocumentos);
  frmDocumentos.CodigoAluno := tblPessoacd_pessoa.AsInteger;
  frmDocumentos.Curso := tblMatriculaCursocd_curso.AsString;
  frmDocumentos.lbAluno.Caption := tblPessoanm_pessoa.AsString;
  frmDocumentos.ShowModal;

end;

procedure Tfrm_Alunos.dsPessoaDataChange(Sender: TObject; Field: TField);
begin
   inherited;

   nomePessoa := tblPessoa.FieldByName('nm_pessoa').AsString;
   cpfPessoa := tblPessoa.FieldByName('ds_cpf').AsString;

   { Se tiver alterando não precisa fazer nada }
   if tblPessoa.State in [dsEdit] then
     Exit;
end;

procedure Tfrm_Alunos.alteraLogin(edLogin, edSenha, edRedgSenha: TEdit; cbProvisoria:TCheckBox; sLoginAntigo: string; qyPaiResp: TUMZQuery; codigoPessoaAlteraProvisoria: Integer);
var
   bLoginOk:Boolean;
   qyUpdateProvisoria, qyPessoas:TUMZQuery;
begin
   bLoginOk := false;
   DM.CriarConsulta(qyPessoas);
   if (edLogin.Text <> sLoginAntigo) then begin
       with qyPessoas do begin
          Close();
          SQL.Text := 'SELECT COUNT(*) as conta FROM pessoas WHERE ds_login = :ds_login AND cd_pessoa <> :pessoa ';
          ParamByName('ds_login').AsString := edLogin.Text;
          ParamByName('pessoa').AsInteger := qyPaiResp.FieldByName('cd_pessoa').AsInteger;
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
         FreeAndNil(qyPessoas);
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

      with qyPessoas do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_login = :ds_login WHERE cd_pessoa = :cd_pessoa';
        ParamByName('ds_login').AsString := edLogin.Text;
        ParamByName('cd_pessoa').AsInteger := qyPaiResp.FieldByName('cd_pessoa').AsInteger;
        ExecSQL();
      end;
   end;

   if (qyPaiResp.FieldByName('ds_senha').AsString = '') AND (edSenha.Text = '*****') then begin
      edSenha.Text := FormatDateTime('ddmmyy', qyPaiResp.FieldByName('dt_nascimento').AsDateTime );
      edRedgSenha.Text := edSenha.Text;
      DM.CriarConsulta(qyUpdateProvisoria);
      try
         qyUpdateProvisoria.SQL.Text := 'UPDATE pessoas SET sn_senha_provisoria = :provisoria WHERE cd_pessoa = :cd_pessoa';
         qyUpdateProvisoria.ParamByName('provisoria').AsString := 'S';
         qyUpdateProvisoria.ParamByName('cd_pessoa').AsInteger := codigoPessoaAlteraProvisoria;
         qyUpdateProvisoria.ExecSQL;
      finally
         FreeAndNil(qyUpdateProvisoria);
      end;

   end;

   if (edSenha.Text <> '*****') then begin
    if (edSenha.Text = edRedgSenha.Text) then begin
      with qyPessoas do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_senha = md5(:ds_senha) WHERE cd_pessoa = :cd_pessoa';
        ParamByName('ds_senha').AsString := edSenha.Text;
        ParamByName('cd_pessoa').AsInteger := qyPaiResp.FieldByName('cd_pessoa').AsInteger;
        ExecSQL();
      end;
    end
    else begin
      Mensagem('Você deve digitar duas vezes a mesma senha !', Application.Title, MB_ICONWARNING+MB_OK, -1);
      Abort();
      FreeAndNil(qyPessoas);
      edSenha.setFocus();
      Exit;
    end;
   end;

   FreeAndNil(qyPessoas);

end;

procedure Tfrm_Alunos.atualizarDadosLogin;
var
   qryRespDoAluno :TUMZQuery;
   enable         :Boolean;
begin
   DM.CriarConsulta(qryRespDoAluno);
   try
      FreeAndNil(listaDeBloqueados);

      listaDeBloqueados :=  TStringList.Create;
      try
         //inclui o codigo do aluno para não ser utilizado depois.
         listaDeBloqueados.add(tblPessoa.FieldByName('cd_pessoa').AsString);

         //inicializa dados para o pai
         Self.InicializaDadoLogin(qryRespDoAluno,
                                  tblPessoacd_pai.asInteger,
                                  edCodigoPai,
                                  edLoginPai,
                                  edSenhaPai,
                                  edRedgPai,
                                  lbNomePai,
                                  cbProvPai
         );

         //inicializa dados para a mae
         Self.InicializaDadoLogin(qryRespDoAluno,
                                  tblPessoacd_mae.asInteger,
                                  edCodigoMae,
                                  edLoginMae,
                                  edSenhaMae,
                                  edRedgMae,
                                  lbNomeMae,
                                  cbProvMae
         );

         //inicializa dados para o responsavel acadêmico
         Self.InicializaDadoLogin(qryRespDoAluno,
                                  tblPessoacd_resp_acad.asInteger,
                                  edCodigoRespAcad,
                                  edLoginRespAcad,
                                  edSenhaRespAcad,
                                  edRedgRespAcad,
                                  lbNomeRespAcad,
                                  cbProvRespAcad
         );

         //inicializa dados para o responsavel financeiro
         Self.InicializaDadoLogin(qryRespDoAluno,
                                  tblPessoacd_resp_finan.asInteger,
                                  edCodigoRespFinan,
                                  edLoginRespFinan,
                                  edSenhaRespFinan,
                                  edRedgRespFinan,
                                  lbNomeRespFinan,
                                  cbProvRespFinan
         );

         if tblPessoa.State in [dsBrowse] then
         begin
          edLoginAluno.Text := tblPessoa.FieldByName('ds_login').AsString;
          edCodigoAluno.Text := tblPessoa.FieldByName('cd_pessoa').AsString;
          cbProvAluno.Checked := (tblPessoa.FieldByName('sn_senha_provisoria').AsString = 'S');
          loginAntigo := edLoginAluno.Text;
          loginPaiAntigo := edLoginPai.Text;
          loginMaeAntigo := edLoginMae.Text;
          loginRespAcadAntigo := edLoginRespAcad.Text;
          loginRespFinanAntigo := edLoginRespFinan.Text;
          lbNomeAluno.Caption :=  tblPessoa.FieldByName('nm_pessoa').AsString;
          edSenhaAluno.Text := '*****';
          edRedgAluno.Text := '*****';
         end;
      finally
         FreeAndNil(listaDeBloqueados);
      end;
   finally
      FreeAndNil(qryRespDoAluno);
   end;
   {bloco para deixar o aluno ser editado}
   enable := PodeAlterarSenha or (tblPessoacd_pessoa.AsInteger = DM.iCdPessoaLogado);
   edLoginAluno.Enabled := enable;
   edSenhaAluno.Enabled := enable;
   edRedgAluno.Enabled  := enable;

end;

function Tfrm_Alunos.avisoAlteracaoCadastro:boolean;
var
   txtAviso, nome, cpf : String;
begin
  if (pgPessoa.ActivePage = tsDadosPessoais) then
  begin
     nome := dbNome.Text;
     cpf := dbCpf.Text;
  end;
  if (pgPessoa.ActivePage = tsPai) then
  begin
    nome := dbNomePai.Text;
    cpf := dbCPFPai.Text;
  end;
  if (pgPessoa.ActivePage = tsMae) then
  begin
    nome := dbNomeMae.Text;
    cpf := dbCPFMae.Text;
  end;
  if (pgPessoa.ActivePage = tsRespAcademico) then
  begin
    nome := dbNomeRespAcad.Text;
    cpf := dbCPFAcad.Text;
  end;
  if (pgPessoa.ActivePage = tsRespFinanceiro) then
  begin
    nome := dbNomeRespFinan.Text;
    cpf := dbCPFFinan.Text;
  end;

  txtAviso := 'Verificamos que você está alterando o cadastro da pessoa ' + (#13) + nomeOriginal + '.' + (#13) +
              'Caso esteja criando um novo cadastro, aconselhamos usar a opção Novo Cadastro ou ' +
              'Buscar Cadastro para localizar um cadastro já existente.' + (#13) +
              'Tem certeza que deseja prosseguir alterando o cadastro de ' + nomeOriginal + ' ' +
              'transferindo todas as informações vinculadas ' + (#13) + ' (matrículas, financeiro, turmas, e outros) para ' + nome + '?';

     if ( nomeOriginal <> nome ) or ( cpfOriginal <> cpf ) then
     begin
        if(Mensagem(txtAviso, 'Alteração Cadastro de Pessoa', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrNo) then
        begin
           if (pgPessoa.ActivePage = tsDadosPessoais) then
           begin
              nomePessoa := tblResponsavel.FieldByName('nm_pessoa').AsString;
              cpfPessoa := tblResponsavel.FieldByName('ds_cpf').AsString;
           end else begin
              nomePessoa := tblPessoa.FieldByName('nm_pessoa').AsString;
              cpfPessoa := tblPessoa.FieldByName('ds_cpf').AsString;
           end;
           result := false;
        end else begin
           nomePessoa := nome;
           cpfPessoa := cpf;
           result := true;
        end;
     end
     else
      Result:=true;
end;

procedure Tfrm_Alunos.dsPessoaStateChange(Sender: TObject);
begin
  inherited;
  dbCodigo.ReadOnly := not (tblPessoa.State = dsInsert) ;
end;

procedure Tfrm_Alunos.btnFinanceiroClick(Sender: TObject);
const
   ActionKey = 'UMFinanceiro.Pessoas.Alunos.Matriculas.Financeiro';
var
   cd_coligada : Integer;
begin
   if DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado, ActionKey, npAcesso, True) then
   begin
      cd_coligada := DM.getColigadaTurma(tblMatriculasEtapaturma.AsString,tblMatriculasEtapaanosemestre.AsInteger);
      TfrmFinDebitos.ShowDebitos(tblPessoacd_pessoa.AsInteger, cd_coligada);
   end;
end;

procedure Tfrm_Alunos.btnMatricularClick(Sender: TObject);
const
   STitInfo = 'Informação';
   SChaveAcao = 'Academico.Pessoas.Alunos.Matricula.Matricular';
   SInfoSemRespFinan = 'Não foi selecionado um responsável financeiro para este aluno. Esta informação é imprescindível para prosseguir com a matrícula.';
   SInfoPendenciaFin = 'O aluno possui pendência financeira. Usuário não possui permissão para realizar a matrícula nesta situação.';
   sFinanceiro = 'Aluno possui pendência(s) na biblioteca. Deseja visualizar?';
   SMatriculaBloqueada =
      'A matrícula deste aluno está sendo bloqueada pelo parâmetro [estuda_reserv_matric_bloqueados]. '+
      'Verifique se o aluno possui pendências financeiras ou jurídicas. ' +
      'Se todas as pendências foram resolvidas, remova o código do aluno do parâmetro [estuda_reserv_matric_bloqueados].';
var
   MatriculaCurso: Integer;
   qryTemIntegracao : TUMZQuery;

begin
   if DM.IsMatriculaBloqueada(tblPessoacd_pessoa.AsInteger) then
   begin
      MessageDlg(SMatriculaBloqueada, mtInformation, [mbOK], 0);
      Exit;
   end;

   DM.CriarConsulta(qryTemIntegracao);
   qryTemIntegracao.SQL.Text :=
   '  SELECT                              '+
   '    sn_multa_cobranca_biblioteca      '+
   '  FROM                                '+
   '    bib_config                        '+
   '  WHERE                               '+
   '    sn_multa_cobranca_biblioteca = 1  ';
   qryTemIntegracao.Open;

   if not(qryTemIntegracao.IsEmpty) AND  BibFinanceiroPendente then
   begin
      if (MessageBox(Handle,PChar(sFinanceiro),PChar(STitInfo),MB_ICONINFORMATION+MB_YESNO) = mrYes) then
      begin
         frmPendenciaFinanceiras :=  TfrmPendenciaFinanceiras.Create(nil);
         frmPendenciaFinanceiras.cd_pessoa := tblPessoacd_pessoa.AsInteger;
         frmPendenciaFinanceiras.ShowModal;
         FreeAndNil(frmPendenciaFinanceiras);
      end;
   end;
   FreeAndnil(qryTemIntegracao);

   //Não tem resp, mostra mensagem e sai
   if not (tblPessoacd_resp_finan.AsInteger > 0) then
   begin
      MessageBox(
         Handle,
         PChar(SInfoSemRespFinan),
         PChar(STitInfo),
         MB_ICONINFORMATION or MB_OK
      );
      pgPessoa.ActivePageIndex := 5;
      pgPessoaChange( nil );
      exit;
   end;

   //Não tem permissão, sai
   if NOT DM.UsuarioLogado.TemPermissao(1019, npAlterar, True) then
   begin
      exit;
   end;

   //verifica campos obrigatórios.
   if not(DM.CamposObrigatoriosPreenchidos(self, 'tsMatricula',true,#13 + 'Este(s) dado(s) devem ser preenchidos na aba "Dados Pessoais".',false)) then
   begin
      exit;
   end;

   if (not FinanceiroPendente) or
      DM.UsuarioLogado.TemPermissao(1019, npIncluir, False) then
   begin
      //Verficaçao de resp finan
      if (DM.variavel_parametro('sn_africa') <> 'S') AND (Self.responsavelFinanceiroMaiorIdade()) then
      begin
         pgPessoa.ActivePageIndex := 5;
         pgPessoaChange( nil );
         exit;
      end;

      AlertarPendencias;

      if (DM.variavel_parametro('novo.processo.matricula') = 'S') then
      begin
         Application.CreateForm(TfMatricular, fMatricular);
         fMatricular.Pessoa := tblPessoacd_pessoa.AsInteger;
         fMatricular.Curso := tblMatriculaCursocd_curso.AsString;
         fMatricular.NomePessoa := tblPessoanm_pessoa.AsString;
         fMatricular.Anosem := tblMatriculaCursonr_anosem_ingresso.AsString;
         fMatricular.ShowModal;
      end
      else
      begin
         Application.CreateForm(TFrmMatricularCurso, FrmMatricularCurso);

         with FrmMatricularCurso do
         begin
            iAnoSemAtual := tblMatriculaCursonr_anosem_ingresso.AsInteger;
            iIngressoPadrao := GetFormaIngresso(1);
            MatriculaCurso := IncluirMatricula(tblPessoacd_pessoa.AsInteger,
               BuscaAnoSemestre);
         end;

         if MatriculaCurso <> -1 then
         begin
            Application.CreateForm(TfrmMatricular, frmMatricular);

            with frmMatricular do
            begin
               CheckBox1.OnClick := nil;
               CheckBox1.Checked := False;
               iIngressoPadrao := GetFormaIngresso(1);
            end;
            MatricularEtapa(
               MatriculaCurso,
               FrmMatricularCurso.qyMatriculaCursocd_curso.AsString,
               0,
               FrmMatricularCurso.qyMatriculaCursonr_matricula.AsString
            );
         end;
      end;
      tblMatriculaCurso.Close;
      tblMatriculaCurso.Open;
   end
   else
   begin
      MessageBox(Handle, PChar(SInfoPendenciaFin), PChar(STitInfo),
         MB_ICONINFORMATION or MB_OK);
   end;
end;

procedure Tfrm_Alunos.btBuscarPessoaAcadClick(Sender: TObject);
begin
   if (pgPessoa.ActivePage <> tsRespAcademico)
      and(pgPessoa.ActivePage <> tsRespFinanceiro)
      and(pgPessoa.ActivePage <> tsMae)
      and(pgPessoa.ActivePage <> tsPai) then
   begin
     btBuscar_PessoaClick(nil);
     btAcad_Salvar.Enabled := false;
     btAcad_Cancelar.Enabled := false;
     pgPessoa.ActivePage := tsDadosPessoais;
   end;
end;

procedure Tfrm_Alunos.btBuscar_PessoaClick(Sender: TObject);
var
   codigoPessoaAntigo: Integer;
begin
  AbaSelecionada := afpEstudante;

  codigoPessoaAntigo := tblPessoacd_pessoa.AsInteger;

  inherited;

  if codigoPessoaAntigo <> tblPessoacd_pessoa.AsInteger then
  begin
      if not tblPessoa.EOF Then
      begin
         verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
         pgDocPai.ActivePage := TabSheet6;
         pgDocMae.ActivePage := TabSheet17;
         pgDocAcad.ActivePage := TabSheet9;
         pgDocFinan.ActivePage := TabSheet12;
      end;
  end;

  if tblPessoanr_dia_vencimento.asString = '' then
  begin
     //Caso o campo dia de vencimento esteja com valor vazio verifica permissão de inclusão para habilitar campo para edição.
     dbDiaVencimento.Enabled := DM.UsuarioLogado.TemPermissao( 1107, npIncluir, False );
  end
  else
  begin
      //Caso o campo dia de vencimento tenha conteudo verifica a permissão de inclusão para habilitar campo para edição.
      dbDiaVencimento.Enabled := DM.UsuarioLogado.TemPermissao( 1107, npAlterar, False );
  end;

  if tblPessoads_profissao.asString = '' then
  begin
     //Caso o campo profissao esteja com valor vazio verifica permissão de inclusão para habilitar campo para edição.
     dbProfissao.Enabled := DM.UsuarioLogado.TemPermissao( 1255, npIncluir, False );
  end
  else
  begin
      //Caso o campo profissao tenha conteudo verifica a permissão de inclusão para habilitar campo para edição.
      dbProfissao.Enabled := DM.UsuarioLogado.TemPermissao( 1255, npAlterar, False );
  end;

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

procedure Tfrm_Alunos.btCancelar_PessoaClick(Sender: TObject);
begin
  inherited;
  dbCodigo.SetFocus;
end;

procedure Tfrm_Alunos.btDesvincularClick(Sender: TObject);
var
   ds_campo : String;
begin
  inherited;
   if Mensagem(
         'Deseja realmente desvincular esta pessoa?',
         'Confirmação',
         MB_YESNO + MB_ICONQUESTION
      ) <> mrYes Then
   begin
      Exit;
   end;

   ds_campo := '';

   if pgPessoa.ActivePage = tsPai then
   begin
     ds_campo := 'cd_pai'
   end;

   if pgPessoa.ActivePage = tsMae then
   begin
     ds_campo := 'cd_mae'
   end;

   if pgPessoa.ActivePage = tsRespAcademico then
   begin
     ds_campo := 'cd_resp_acad'
   end;

   if pgPessoa.ActivePage = tsRespFinanceiro then
   begin
     ds_campo := 'cd_resp_finan'
   end;

   // Valida se o ds_campo foi preenchido. Caso não, apresenta a  mensagem
   if ( ds_campo = '' ) then
   begin
      Mensagem(
         'Não foi possível realizar esta ação!',
         'Atenção',
         MB_OK + MB_ICONWARNING
      );
      Exit;
   end;

   qyDesvincularPessoa.SQL.Clear;
   qyDesvincularPessoa.SQL.Text := ''
      + 'UPDATE pessoas SET '
      + ds_campo + ' = NULL '
      + ' WHERE cd_pessoa = '
      + IntToStr(tblPessoacd_pessoa.AsInteger);

   qyDesvincularPessoa.ExecSQL;
   
   // Mensagem de sucesso!!
   Mensagem(
      'Este vinculo foi desfeito com sucesso!',
      'Atenção',
      MB_OK + MB_ICONINFORMATION
   );
   // Atualiza a tela
   tblPessoa.Close();
   tblPessoa.Open();
   pgPessoaChange( nil );
end;

procedure Tfrm_Alunos.btExcluir_PessoaClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1003, npExcluir, True ) then Exit;
  inherited;
end;

{ **
   Este procedimento é invocado quando o usuário seleciona uma matrícula.
   O procedimento habilita para iniciar o arrastar.
}
procedure Tfrm_Alunos.DBGrid4aoSelecionarMatricula(Sender: TObject);
begin
   (Sender as TDBGrid).BeginDrag(true);
end;

procedure Tfrm_Alunos.DBGrid4DblClick(Sender: TObject);
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
  frmMatriculas.toolDisciplinas.Visible := True;
  frmMatriculas.toolDoc.Visible := False;
  FrmMatriculas.toolAlunos1.Visible := False;
  frmMatriculas.dtcMatriculasDataChange(nil,nil);
end;

procedure Tfrm_Alunos.DBGrid5Enter(Sender: TObject);
begin
  inherited;
  if not(tblResponsavel.State in [dsInsert,dsEdit]) then
     tblResponsavel.Edit;
end;

procedure Tfrm_Alunos.DBGrid6Enter(Sender: TObject);
begin
  inherited;
  if not(tblResponsavel.State in [dsInsert,dsEdit]) then
     tblResponsavel.Edit;
end;

procedure Tfrm_Alunos.dblbTpLogradouroCloseUp(Sender: TObject);
begin
  inherited;
   desLogradouro_aluno := '';
end;

procedure Tfrm_Alunos.dblbTpLogradourosCloseUp(Sender: TObject);
begin
  inherited;
   desLogradouro_aluno := '';
end;

procedure Tfrm_Alunos.DBLookupComboBox18CloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
  inherited;
  DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString := DBLookupComboBox18.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT * '+
      'FROM estados ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;
end;

procedure Tfrm_Alunos.DBLookupComboBox18Exit(Sender: TObject);
var
   qryAchaNacionalidade, qyAux: TUMzQuery;
   I: integer;
   comboboxAtiva : TUMComboBox;
begin
   { Ao sair da combo de paises se tiver cadastrando na primeira vez ele trara a nacionalidade do pais indicado}

   comboboxAtiva := GetActiveComboBoxNacionalidade;

   if ((tblResponsavel.State in [DsInsert])
      and (comboboxAtiva.ItemIndex = -1)
      and (tblResponsaveldescPais.AsString <> '')) then
   begin

      DM.CriarConsulta(qryAchaNacionalidade);

      qryAchaNacionalidade.SQL.Text := 'select ds_nacionalidade from paises where ds_pais = :nm_pais';
      qryAchaNacionalidade.ParamByName('nm_pais').AsString := tblResponsaveldescPais.AsString;
      qryAchaNacionalidade.Open;

      for I := 0 to comboboxAtiva.Items.Count - 1 do
      begin
         if comboboxAtiva.Items[i] = qryAchaNacionalidade.FieldByName('ds_nacionalidade').AsString then
            break;
      end;
      comboboxAtiva.ItemIndex := i;
   end;

      //Carrega estado e nacionalidade do pais selecionado, caso não tenha
      //estado e cidade são desabilitados os combobox.

      DM.CriarConsulta(qyAux);

      qyAux.SQL.Text := '                '+
      ' SELECT cd_pais, ds_nacionalidade '+
      ' FROM paises                      '+
      ' WHERE ds_pais = :ds_pais_atual   ';

      qyAux.ParamByName('ds_pais_atual').AsString :=
         DBLookupComboBox18.Text;

      qyAux.Open;

      DM.tblEstados.Close;
      DM.tblEstados.SQL.Text := ''+
         'SELECT *                             ' +
         'FROM estados                         ' +
         'WHERE cd_pais = :cd_pais_selecionado ' +
         'ORDER BY ds_estado                   ';

      DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
         qyAux.FieldByName('cd_pais').asInteger;

      DM.tblEstados.Open;

      DBLookupComboBox11.Enabled := DM.tblEstados.RecordCount > 0;
      DBLookupComboBox17.Enabled := DM.tblEstados.RecordCount > 0;
end;

procedure Tfrm_Alunos.DBLookupComboBox20CloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
  inherited;
  DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString := DBLookupComboBox20.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT * '+
      'FROM estados ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;
end;

procedure Tfrm_Alunos.DBLookupComboBox20Exit(Sender: TObject);
var
   qryAchaNacionalidade, qyAux: TUMzQuery;
   I: integer;
   comboboxAtiva : TUMComboBox;
begin
   { Ao sair da combo de paises se tiver cadastrando na primeira vez ele trara a nacionalidade do pais indicado}

   comboboxAtiva := GetActiveComboBoxNacionalidade;

   if ((tblResponsavel.State in [DsInsert])
      and (comboboxAtiva.ItemIndex = -1)
      and (tblResponsaveldescPais.AsString <> '')) then
   begin

      DM.CriarConsulta(qryAchaNacionalidade);

      qryAchaNacionalidade.SQL.Text := 'select ds_nacionalidade from paises where ds_pais = :nm_pais';
      qryAchaNacionalidade.ParamByName('nm_pais').AsString := tblResponsaveldescPais.AsString;
      qryAchaNacionalidade.Open;

      for I := 0 to comboboxAtiva.Items.Count - 1 do
      begin
         if comboboxAtiva.Items[i] = qryAchaNacionalidade.FieldByName('ds_nacionalidade').AsString then
            break;
      end;
      comboboxAtiva.ItemIndex := i;
   end;

      //Carrega estado e nacionalidade do pais selecionado, caso não tenha
      //estado e cidade são desabilitados os combobox.

      DM.CriarConsulta(qyAux);

      qyAux.SQL.Text := '                '+
      ' SELECT cd_pais, ds_nacionalidade '+
      ' FROM paises                      '+
      ' WHERE ds_pais = :ds_pais_atual   ';

      qyAux.ParamByName('ds_pais_atual').AsString :=
         DBLookupComboBox20.Text;

      qyAux.Open;

      DM.tblEstados.Close;
      DM.tblEstados.SQL.Text := ''+
         'SELECT *                             ' +
         'FROM estados                         ' +
         'WHERE cd_pais = :cd_pais_selecionado ' +
         'ORDER BY ds_estado                   ';

      DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
         qyAux.FieldByName('cd_pais').asInteger;

      DM.tblEstados.Open;

      DBLookupComboBox14.Enabled := DM.tblEstados.RecordCount > 0;
      DBLookupComboBox19.Enabled := DM.tblEstados.RecordCount > 0;
end;

procedure Tfrm_Alunos.DBLookupComboBox22CloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
  inherited;
  DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString := DBLookupComboBox18.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT * '+
      'FROM estados ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;
end;

procedure Tfrm_Alunos.DBLookupComboBox25CloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
  inherited;
  DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString := DBLookupComboBox18.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT * '+
      'FROM estados ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;
end;

procedure Tfrm_Alunos.DBLookupComboBox29CloseUp(Sender: TObject);
begin
  inherited;
   desLogradouro_aluno := '';
end;

procedure Tfrm_Alunos.DBLookupComboBox30CloseUp(Sender: TObject);
begin
  inherited;
   desLogradouro_aluno := '';
end;

procedure Tfrm_Alunos.DBLookupComboBox31CloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
   inherited;
   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString :=
      tblResponsavel.FieldByName('descPais').asString;

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
end;

procedure Tfrm_Alunos.DBLookupComboBox31Exit(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
   inherited;
   //Carrega estado e nacionalidade do pais selecionado, caso não tenha
   //estado e cidade são desabilitados os combobox.

   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := '                '+
   ' SELECT cd_pais, ds_nacionalidade '+
   ' FROM paises                      '+
   ' WHERE ds_pais = :ds_pais_atual   ';

   qyAux.ParamByName('ds_pais_atual').AsString :=
      DBLookupComboBox31.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT *                             ' +
      'FROM estados                         ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado                   ';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;

   DBLookupComboBox23.Enabled := DM.tblEstados.RecordCount > 0;
   DBLookupComboBox12.Enabled := DM.tblEstados.RecordCount > 0;
end;

procedure Tfrm_Alunos.DBLookupComboBox32CloseUp(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
   inherited;
   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := ''+
   ' SELECT cd_pais '+
   ' FROM paises '+
   ' WHERE ds_pais = :ds_pais_atual';
   qyAux.ParamByName('ds_pais_atual').AsString :=
      tblResponsavel.FieldByName('descPais').asString;

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
end;

procedure Tfrm_Alunos.DBLookupComboBox32Exit(Sender: TObject);
var
   qyAux: TUMZQuery;
begin
   inherited;
   //Carrega estado e nacionalidade do pais selecionado, caso não tenha
   //estado e cidade são desabilitados os combobox.

   DM.CriarConsulta(qyAux);

   qyAux.SQL.Text := '                '+
   ' SELECT cd_pais, ds_nacionalidade '+
   ' FROM paises                      '+
   ' WHERE ds_pais = :ds_pais_atual   ';

   qyAux.ParamByName('ds_pais_atual').AsString :=
      DBLookupComboBox32.Text;

   qyAux.Open;

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT *                             ' +
      'FROM estados                         ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado                   ';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;

   DBLookupComboBox15.Enabled := DM.tblEstados.RecordCount > 0;
   DBLookupComboBox26.Enabled := DM.tblEstados.RecordCount > 0;
end;

procedure Tfrm_Alunos.btImprimir_PessoaClick(Sender: TObject);
begin
  inherited;

   if pgPessoa.ActivePage <> tsMatricula then
   Begin
       tblMatriculaCurso.Close;
       tblMatriculaCurso.Open;
       tblMatriculasEtapa.Close;
       tblMatriculasEtapa.Open;
   End;

   Application.CreateForm(TfrmImpAlunos, frmImpAlunos);

   frmImpAlunos.cd_turma := tblMatriculasEtapaturma.AsString;
   frmImpAlunos.nr_anosemestre := tblMatriculasEtapaanosemestre.AsInteger;

   frmImpAlunos.ShowModal;
   FreeAndNil(frmImpAlunos);

end;

procedure Tfrm_Alunos.btIncluir_PessoaClick(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1003, npIncluir, True ) then Exit;
  inherited;
end;

procedure Tfrm_Alunos.tblPessoaNewRecord(DataSet: TDataSet);
begin
   tblPessoacd_pessoa.AsInteger := DM.NovoCodigoPessoa( 'Local.CadastroAluno.Aluno' );

   VSTContatosEditor.LoadPessoa(
      TPessoa.Create(tblPessoacd_pessoa.AsInteger),
      NOT(PodeAlterarContatos(tblPessoacd_pessoa.AsInteger, 1003))
   );

   tblPessoads_observacao.AsString := DM.variavel_parametro('pessoa_observacao_padrao');

   tblPessoacd_logradouro.AsInteger := 81; // RUA

   tblPessoads_cpf.AsString := '00000000000';
end;

procedure Tfrm_Alunos.tblPessoaAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if Trim(tblPessoads_cpf.AsString) = '' then
     tblPessoads_cpf.AsString := '00000000000';

end;

procedure Tfrm_Alunos.tblPessoaAfterPost(DataSet: TDataSet);
begin
  inherited;
  atualizarGruposTodasColigadas(tblPessoacd_pessoa.AsInteger);
end;

procedure Tfrm_Alunos.tblPessoaBeforePost(DataSet: TDataSet);
var
  ds_separador : String; 
  qryResp : TUMZQuery;
begin

   ds_separador := '';
   msgLogLoginSenha := '';

   //somente altera se estivermos na tela de complementares , porque é para ser alterado aqui
   if pgPessoa.ActivePage = tsComplementares then begin
      Self.alteraLogin(
         edLoginAluno,
         edSenhaAluno,
         edRedgAluno,
         cbProvAluno,
         loginAntigo,
         tblPessoa,
         tblPessoacd_pessoa.AsInteger
      );

      // Tratamento para salvar o login da alteração do usuário e da senha
      if (trim(edLoginAluno.Text) <> trim(loginAntigo)) then
      begin
         ds_separador := ', ';
         msgLogLoginSenha := 'ds_login: ' + loginAntigo + ' para: ' + trim(edLoginAluno.Text);
      end;

      if (trim(edSenhaAluno.Text) <> '*****') then
         begin
         if (trim(edSenhaAluno.Text) = trim(edRedgAluno.Text)) then
         begin
            msgLogLoginSenha := msgLogLoginSenha + ds_separador + 'Senha do aluno foi alterada.';
         end;
      end;

      DM.CriarConsulta(qryResp);
      try
         //altera dados de login do pai
         if(tblPessoacd_pai.AsString <> '') and (edSenhaPai.Enabled) then
         begin
            qryResp.SQL.Text := ' SELECT * FROM pessoas WHERE cd_pessoa = :pCDPai';
            qryResp.ParamByName('pCDPai').AsInteger := tblPessoacd_pai.AsInteger;
            qryResp.Open();
            Self.alteraLogin(
               edLoginPai,
               edSenhaPai,
               edRedgPai,
               cbProvPai,
               loginPaiAntigo,
               qryResp,
               tblPessoacd_pai.AsInteger
            );
            qryResp.Close();
         end;

         //altera dados de login da mãe
         if((tblPessoacd_mae.AsString <> '') and (edSenhaMae.Enabled)) then
         begin
            qryResp.SQL.Text := ' SELECT * FROM pessoas WHERE cd_pessoa = :pCDMae';
            qryResp.ParamByName('pCDMae').AsInteger := tblPessoacd_mae.AsInteger;
            qryResp.Open();
            Self.alteraLogin(
               edLoginMae,
               edSenhaMae,
               edRedgMae,
               cbProvMae,
               loginMaeAntigo,
               qryResp,
               tblPessoacd_mae.AsInteger
            );
            qryResp.Close();
         end;

         //altera dados de login do responsável academico
         if((tblPessoacd_resp_acad.AsString <> '') and (edSenhaRespAcad.Enabled)) then
         begin
            qryResp.SQL.Text := ' SELECT * FROM pessoas WHERE cd_pessoa = :pCDResp';
            qryResp.ParamByName('pCDResp').AsInteger := tblPessoacd_resp_acad.AsInteger;
            qryResp.Open();
            Self.alteraLogin(
               edLoginRespAcad,
               edSenhaRespAcad,
               edRedgRespAcad,
               cbProvRespAcad,
               loginRespAcadAntigo,
               qryResp,
               tblPessoacd_resp_acad.AsInteger
            );
            qryResp.Close();
         end;

         //altera dados de login do responsável financeiro
         if((tblPessoacd_resp_finan.AsString <> '') and (edSenhaRespFinan.Enabled)) then
         begin
            qryResp.SQL.Text := ' SELECT * FROM pessoas WHERE cd_pessoa = :pCDFinan';
            qryResp.ParamByName('pCDFinan').AsInteger := tblPessoacd_resp_finan.AsInteger;
            qryResp.Open();
            Self.alteraLogin(
               edLoginRespFinan,
               edSenhaRespFinan,
               edRedgRespFinan,
               cbProvRespFinan,
               loginRespFinanAntigo,
               qryResp,
               tblPessoacd_resp_finan.AsInteger
            );
            qryResp.Close();
         end;
      finally
         FreeAndNil(qryResp);
      end;
   end;


  inherited;
end;

procedure Tfrm_Alunos.tblPessoads_estado_nascimentoChange(Sender: TField);
begin
  inherited;
  if (tblPessoa.State in [dsInsert, dsEdit]) then
  begin
      tblPessoacd_municipio_nasc.Clear();
      tblPessoads_cidade_nascimento.Clear();
      dbCidadeNascimento.KeyValue := null;
  end;
end;

procedure Tfrm_Alunos.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;

  if (tblPessoacd_pessoa.AsInteger = 0) then begin
     AllowChange := False;
     exit;
  end;
  

  if (tblPessoa.State in [dsInsert, dsEdit]) or (tblResponsavel.State in [dsInsert, dsEdit])  Then
  Begin
      Mensagem('Salve as alterações antes de passar para a próxima guia.','Atenção', MB_OK + MB_ICONWARNING);
      AllowChange := False;
  End
  Else begin
      AllowChange := True;
      tblResponsavel.Close();
  end

end;

procedure Tfrm_Alunos.copiar_endereco_aluno;
var
   comboLog: TDBLookupComboBox;
   comboPais: TDBLookupComboBox;
begin
   { Somente copiar se estiver no modo de edição }
   if tblResponsavel.State in [dsEdit, dsInsert] Then Begin
      tblResponsavel.FieldByName('ds_cep').AsString := tblPessoa.FieldByName('ds_cep').AsString;
      tblResponsavel.FieldByName('ds_pais').AsString := tblPessoa.FieldByName('ds_pais').AsString;
      tblResponsavel.FieldByName('cd_pais').AsString := tblPessoa.FieldByName('cd_pais').AsString;
      tblResponsavel.FieldByName('ds_estado').AsString := tblPessoa.FieldByName('ds_estado').AsString;
      tblResponsavel.FieldByName('ds_cidade').AsString := tblPessoa.FieldByName('ds_cidade').AsString;
      tblResponsavel.FieldByName('ds_bairro').AsString := tblPessoa.FieldByName('ds_bairro').AsString;
      tblResponsavelcd_municipio.AsInteger := tblPessoacd_municipio.AsInteger;
      tblResponsavel.FieldByName('ds_logradouro').AsString := tblPessoa.FieldByName('ds_logradouro').AsString;
      tblResponsavel.FieldByName('ds_logradouro_nro').AsString := tblPessoa.FieldByName('ds_logradouro_nro').AsString;
      tblResponsavel.FieldByName('ds_complemento').AsString := tblPessoa.FieldByName('ds_complemento').AsString;
      tblResponsavel.FieldByName('desLogradouro').AsString := tblPessoa.FieldByName('desLogradouro').AsString;

      desLogradouro_aluno := tblPessoa.FieldByName('desLogradouro').AsString;

      tblResponsavel.FieldByName('descPais').AsString := tblPessoa.FieldByName('descPais').AsString;

      //atualiza as combos de logradouro e paises
      case pgPessoa.ActivePageIndex  of
         2: begin
            comboLog  := dblbTpLogradouros;
            comboPais := DBLookupComboBox31;
         end;
         3: begin
            comboLog  := dblbTpLogradouro;
            comboPais := DBLookupComboBox32;
         end;
         4: comboLog := DBLookupComboBox29;
         5: comboLog := DBLookupComboBox30;
      end;

      if (pgPessoa.ActivePageIndex in [2,3,4,5]) then
      begin
      
         if (tblTpLogradouro.Locate('ds_logradouro', tblResponsavel.FieldByName('desLogradouro').AsString , [loCaseInsensitive,loPartialKey])) then
         begin
            comboLog.KeyValue := tblTpLogradouro.FieldByName('cd_logradouro').AsInteger;
            comboLog.Refresh;
         end;

         if (pgPessoa.ActivePageIndex in [2,3]) then
         begin
            if (tblPaises.Locate('ds_pais', tblResponsavel.FieldByName('descPais').AsString , [loCaseInsensitive,loPartialKey])) then
            begin
               comboPais.KeyValue := tblPaises.FieldByName('cd_pais').AsInteger;
               comboPais.Refresh;
            end;
         end;
      end;

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

         //GetVSTContatosResponsavel().Reload();
      end;
   End;

end;

procedure Tfrm_Alunos.DBCheckBox2Click(Sender: TObject);
begin
  inherited;
  
  btAcad_Salvar.Enabled := True;
  btAcad_Cancelar.Enabled := True;
end;

procedure Tfrm_Alunos.DBCheckBox3Click(Sender: TObject);
begin
  inherited;

  btAcad_Salvar.Enabled := True;
  btAcad_Cancelar.Enabled := True;
end;

function Tfrm_Alunos.FinanceiroPendente: Boolean;
begin
   Result := TfrmFinDebitos.HasDebitos(tblPessoacd_pessoa.AsInteger, 0);
   btnFinanceiro.Marked := Result;

   btnFinanceiro.Tag := 0;
   
   if Result then
      btnFinanceiro.Tag := 1;
end;

procedure Tfrm_Alunos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( listaDeBloqueados );
   inherited;
   
   DM.tblEstados.SQL.Text := ''+
      ' SELECT * FROM estados '+
      ' ORDER BY ds_estado ';

   DM.tblEstados2.SQL.Text := ''+
      ' SELECT * FROM estados '+
      ' ORDER BY ds_estado ';
end;

procedure Tfrm_Alunos.FormCreate(Sender: TObject);
begin
   inherited;

   VSTContatosPaiEditor       := TEditorContatosPessoa.Create(VSTContatosPai);
   VSTContatosMaeEditor       := TEditorContatosPessoa.Create(VSTContatosMae);
   VSTContatosRespAcadEditor  := TEditorContatosPessoa.Create(VSTContatosRespAcad);
   VSTContatosRespFinanEditor := TEditorContatosPessoa.Create(VSTContatosRespFinan);

   Self.DBGrid4.OnColEnter := Self.DBGrid4aoSelecionarMatricula;
   Self.DBGrid3.OnDragOver := Self.DBGrid3aoArrastarSobre;
   Self.DBGrid3.OnDragDrop := Self.DBGrid3aoReceberDados;
   if DM.variavel_parametro('AGRUPAR_OBSERVACOES') = 'S' then
   begin
      btnObservacoes.Caption := DM.variavel_parametro('botao_observacoes_nome');
      if Trim(btnObservacoes.Caption) = EmptyStr then
         btnObservacoes.Caption := 'Orientação Pedagógica'
      else
         btnOrientacao.Caption := btnObservacoes.Caption;
   end;

   if (DM.variavel_parametro('novo.processo.matricula') = 'S') then
      btnRematricular.Caption := 'Rematrícula';
end;

procedure Tfrm_Alunos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (pgPessoa.ActivePage <> tsParentes) then
  begin
     case Key of
         VK_F5: begin
            if pgPessoa.ActivePage = tsDadosPessoais then
               btSalvar_PessoaClick( nil )
            else
                btAcad_SalvarClick( nil );
         end;
         VK_F6: begin
            if ((pgPessoa.ActivePage = tsDadosPessoais) or
            (pgPessoa.ActivePage = tsComplementares))  then
               btCancelar_PessoaClick( nil )
            else
               btAcad_CancelarClick( nil );
         end;
     end;
     if (Key = VK_F8) and (btBuscar_Pessoa.Enabled) and  (pgPessoa.ActivePage = tsDadosPessoais)  then begin
        Key := VK_CLEAR;
        btBuscar_PessoaClick( Sender ); 
     end
     else
     begin
        if (Key = VK_F10) then
        Begin
            sbMaisInformacoesClick( nil );
            exit;
        End;
        if ((pgPessoa.ActivePage = tsDadosPessoais) or
            (pgPessoa.ActivePage = tsComplementares))   then
           inherited
        else
        begin
           case key of
             VK_F1 : PrincipalForm.confSobreClick( nil );
             VK_F2 : btAcad_NovoClick( nil );
             VK_F8 : btBuscarPessoaAcadClick( nil );
           end;
        end;

        if ((Key = ord('e')) or (Key = Ord('E'))) and (Shift =  [ssCtrl]) Then
        Begin
             copiar_endereco_aluno;
        End;
     end;
  end;
  if (pgPessoa.ActivePage = tsParentes) then
  begin
     case Key of
         VK_F2: begin
            frParentes1btIncluir_PessoaClick(nil);
         end;
         VK_F3: begin
            frParentes1btAlterar_PessoaClick(nil);
         end;
         VK_F4: begin
            frParentes1btExcluir_PessoaClick(nil);
         end;
     end;
  end;
  if pgPessoa.ActivePage = tsDadosPessoais then begin
     case key  of
      VK_F7:
      begin
         btn_ImprimirAcadeClick(nil);
      end;
     end;
  end
  else
  if pgPessoa.ActivePage = tsMatricula then
  begin
     case key  of
         VK_F7:
         begin
            btImprimir_PessoaClick(nil);
         end;
     end;

  end;
  {
  case Key of
      VK_F12 : if btFechar_Pessoa.Enabled then btFechar_PessoaClick( nil );
  end;
  }
  
end;

procedure Tfrm_Alunos.FormShow(Sender: TObject);
var
   qryContatosObrigatorios: TUMZQuery;
begin
   inherited;
   CarregarComboNacionalidades(cbNacionalidadePai, cbNacionalidadePaiChange);
   CarregarComboNacionalidades(cbNacionalidadeMae, cbNacionalidadePaiChange);
   CarregarComboNacionalidades(cbNacionalidadeRespAcad, cbNacionalidadePaiChange);
   CarregarComboNacionalidades(DBEdit9, cbNacionalidadePaiChange);

   DM.BloquearComponenteAnosemestre(DBGrid3, 'nr_anosem_ingresso');
   DM.BloquearComponenteAnosemestre(DBGrid4, 'anosemestre');

   dbNome.SetFocus();
   edLoginAluno.CharCase := ecNormal;
   edLoginPai.CharCase := ecNormal;
   edLoginMae.CharCase := ecNormal;
   edLoginRespAcad.CharCase := ecNormal;
   edLoginRespFinan.CharCase := ecNormal;
   edSenhaAluno.CharCase:=ecNormal;
   edSenhaPai.CharCase:=ecNormal;
   edSenhaMae.CharCase:=ecNormal;
   edSenhaRespAcad.CharCase:=ecNormal;
   edSenhaRespFinan.CharCase:=ecNormal;
   edRedgAluno.CharCase := ecNormal;
   edRedgPai.CharCase := ecNormal;
   edRedgMae.CharCase := ecNormal;
   edRedgRespAcad.CharCase := ecNormal;
   edRedgRespFinan.CharCase := ecNormal;
   { inicia permissao }
   iPermissao := 1001;
   msgIdade := 'Você está prestes a vincular uma pessoa menor de idade como responsável financeira pelo acadêmico selecionado. Tem certeza que deseja prosseguir?';


   hasPermObsGerais := DM.UsuarioLogado.TemPermissao( 0, 'Academico.PessoasAlunoObservacoes', npAcesso, False );
   permIncluir := DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, False );
   permAlterar := DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, False );


   dbDiaVencimento.Enabled := DM.UsuarioLogado.TemPermissao( 1107, npAlterar, False );

   dbProfissao.Enabled := DM.UsuarioLogado.TemPermissao( 1255, npAlterar, False );
   
   if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
   begin
      dbObs.DataSource := dsObsGerais;
   end;

   if dm.lite then
   begin
      DBCheckBox6.Enabled := false;
      DBCheckBox7.Enabled := false;
   end;

   if (pcDocumentos.ActivePageIndex in [0,2,3]) then
   begin
      pcDocumentos.Height := 133;
      pnContato.Top := pcDocumentos.Top + 133;
   end;

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
      '        ds_chave = "frm_Alunos.Contatos" limit 1 '+
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

  msgLogLoginSenha := '';
end;

procedure Tfrm_Alunos.edLoginAlunoExit(Sender: TObject);
const
   SQL_VERIFICA_LOGIN = 'SELECT cd_pessoa FROM pessoas WHERE cd_pessoa = :login';
var
   qryVerificaLogin : TUMZQuery;
begin
   if(edLoginAluno.Text = tblPessoacd_pessoa.AsString ) OR NOT(IsNumericStr(edLoginAluno.Text)) then
   begin
      exit;
   end;

   //Verifica se o login digitado ja é codigo de outra pessoa
   Dm.CriarConsulta(qryVerificaLogin);
   qryVerificaLogin.SQL.Add(SQL_VERIFICA_LOGIN);
   qryVerificaLogin.ParamByName('login').AsString := edLoginAluno.Text;
   qryVerificaLogin.Open;

   if not (qryVerificaLogin.IsEmpty) then
   begin
      MessageBox(Handle, PChar('O login digitado já está em uso no sistema, favor digitar outro.'), PChar('Aviso'), MB_ICONWARNING or MB_OK);
      edLoginAluno.Text := tblPessoads_login.AsString;
   end;

   FreeAndNil(qryVerificaLogin);
end;

procedure Tfrm_Alunos.edSenha1KeyPress(Sender: TObject; var Key: Char);
var
   TemPermissao: Boolean;
begin
   inherited;
   TemPermissao := DM.UsuarioLogado.TemPermissao(DM.iCdPessoaLogado,
      'Academico.SenhaProvisoria', npAlterar, False);

   if TemPermissao then
   begin
      if Sender = edSenhaAluno then
         cbProvAluno.Checked := True;

      if Sender = edSenhaPai then
         cbProvPai.Checked := True;

      if Sender = edSenhaMae then
         cbProvMae.Checked := True;

      if Sender = edSenhaRespAcad then
         cbProvRespAcad.Checked := True;

      if Sender = edSenhaRespFinan then
         cbProvRespFinan.Checked := True;
   end;
end;

function Tfrm_Alunos.ehResponsavelAcad(iCdPessoa, iCdAluno: Integer):boolean ;
var
   qryPessoaResp :TUMZQuery;
begin
   DM.CriarConsulta(qryPessoaResp);
   try
      with qryPessoaResp do
      begin
         SQL.Text := ''+
         'SELECT '+
         '  cd_resp_acad,'+
         '  cd_pai '+
         'FROM '+
         '  pessoas '+
         'WHERE '+
         '  ((cd_resp_acad = :pPessoa AND cd_pai = :pPessoa) OR '+
         '  (cd_resp_acad = :pPessoa AND cd_mae = :pPessoa) ) AND'+
         '  (cd_pessoa = :pAluno) '+
         '';

         ParamByName('pPessoa').AsInteger := iCdPessoa;
         ParamByName('pAluno').AsInteger := iCdAluno;
         
         Open();

         if not IsEmpty then
         begin
            Result := true;
         end
         else
         begin
            Result := false;
         end;

      end;
   finally
      qryPessoaResp.Free;
   end;
end;

procedure Tfrm_Alunos.tblRespFinanceirods_sexoGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if Sender.AsString = 'M'
   Then Text := 'Masculino'
   else

      if Sender.AsString = 'F'
	 Then Text := 'Feminino'
	 else Text := '';

end;

procedure Tfrm_Alunos.tblRespFinanceirods_sexoSetText(Sender: TField;
  const Text: String);
begin
   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else

      if Text = 'Feminino'
      Then Sender.AsString := 'F';
end;

procedure Tfrm_Alunos.btSalvar_PessoaClick(Sender: TObject);
var
   bUsaResponsavel, camposValidos : Boolean;
   qtdEmailsCadastrados : Integer;
   mensagens_contatos, comboboxAtiva : String;
begin
   jaGerouLog := false;
   // assume por default caso a data de nasc não for preenchida que  a pessoa é de maior
   //inherited;

   //Seta foco em um campo diferente do campo focado, para garantir que salve
   //as alterações dos campos.

   if (dbNacionalidade.Focused) and (dbNacionalidade.ItemIndex = -1) then
   begin
      TGeneral.FocarProximoCampo(Handle);

      {
         Ou seja, se verificamos novamente o foco do campo cbNacionalidade,
         e ele realmente estiver focado, significa que ouve erro de nacionalidade,
         então, abortamos a ação de salvar.
      }
      if dbNacionalidade.Focused then
         Exit;
   end;

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

      if (tblPessoa.State = dsInsert) then
      begin
         tblPessoa.FieldByName('sn_mae_resp').Value := 0;
         tblPessoa.FieldByName('sn_pai_resp').Value := 0;
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

   if (pgPessoa.ActivePage = tsPai) then
   begin
      if (dbNomePai.Focused = true) then
      begin
         DBEdit69.SetFocus;
      end
      else
      begin
         dbNomePai.SetFocus;
      end;
   end;

   if (pgPessoa.ActivePage = tsMae) then
   begin
      if (dbNomeMae.Focused = true) then
      begin
         DBEdit84.SetFocus;
      end
      else
      begin
         dbNomeMae.SetFocus;
      end;
   end;

   if (pgPessoa.ActivePage = tsRespAcademico) then
   begin
      if (dbNomeRespAcad.Focused = true) then
      begin
         DBEdit19.SetFocus;
      end
      else
      begin
         dbNomeRespAcad.SetFocus;
      end;
   end;
   
   if (pgPessoa.ActivePage = tsRespFinanceiro) then
   begin
      if (dbNomeRespFinan.Focused = true) then
      begin
         DBEdit40.SetFocus;
      end
      else
      begin
         dbNomeRespFinan.SetFocus;
      end;
   end;

   //verifica campos obrigatórios.
   if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
   begin
      exit;
   end;

   //Verifica campo CPF e Passaporte
   if verificaCpfPassaporte = False then
   begin
      abort;
   end;

   qtdEmailsCadastrados := 0;

   mensagens_contatos := '';

   //valida E-mail
   if (validaEmail) AND
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
      mensagens_contatos := mensagens_contatos + #13 + 'Telefone residencial ';
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
      mensagens_contatos := mensagens_contatos + #13 + 'Telefone comercial';
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

   if not (tblPessoa.State in [dsEdit, dsInsert]) then
   begin
      tblPessoa.Edit;
   end;

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

   tblPessoa.Post();

   bMenorIdade := false;
   // verifica se o responsave
   if (dbnasc.Text <> '  /  /    ' ) then
      VerificaMaiorIdade(StrToDate(dbNasc.Text));

  if (tblPessoacd_resp_finan.AsInteger = 0 )and not(bMenorIdade) and(bUsaResponsavel) then begin
     tblPessoa.Edit;
     tblPessoacd_resp_finan.AsInteger := tblPessoacd_pessoa.asInteger ;
     tblPessoa.Post;
  end;


  // realizava apenas na unit uAluno
  if tblPessoa.State in [dsInsert, dsEdit] then
  begin
     tblPessoa.Post;
  end;

  if not tblPessoa.EOF Then begin
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
  end;

  bExcluido :=false;
  bComImagem :=false;
  pgPessoa.SetFocus();

   {
   if (bMenorIdade = true) and (tblPessoacd_pessoa.AsInteger = tblPessoacd_resp_finan.AsInteger ) then
   begin
      tblPessoa.Edit;
      tblPessoacd_resp_finan.AsInteger := 0 ;
      tblPessoa.Post;
   end;
   }

   if tblPessoanr_dia_vencimento.asString = '' then
   begin
      //Caso o campo dia de vencimento esteja com valor vazio verifica permissão de inclusão para habilitar campo para edição.
      dbDiaVencimento.Enabled := DM.UsuarioLogado.TemPermissao( 1107, npIncluir, False );
   end
   else
   begin
      //Caso o campo dia de vencimento tenha conteudo verifica a permissão de inclusão para habilitar campo para edição.
      dbDiaVencimento.Enabled := DM.UsuarioLogado.TemPermissao( 1107, npAlterar, False );
   end;

   if tblPessoads_profissao.asString = '' then
   begin
      //Caso o campo profissao esteja com valor vazio verifica permissão de inclusão para habilitar campo para edição.
      dbProfissao.Enabled := DM.UsuarioLogado.TemPermissao( 1255, npIncluir, False );
   end
   else
   begin
      //Caso o campo profissao tenha conteudo verifica a permissão de inclusão para habilitar campo para edição.
      dbProfissao.Enabled := DM.UsuarioLogado.TemPermissao( 1255, npAlterar, False );
   end;

   SalvarProfissoes();
   atualizarDadosLogin();
   dbCodigo.SetFocus;
end;


Procedure Tfrm_Alunos.VerificaMaiorIdade(dtNasc: TDateTime);
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
            if DiaNasc <= dia then
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

Function Tfrm_Alunos.BuscaAnoSemestre : Integer;
Var
   strAnoSem : string;
   wAno, wMes, wDia : Word;
begin

   if Dm.variavel_parametro('estuda_reserv_matric_anosem') <> '' then begin

      result := StrToInt(Dm.variavel_parametro('estuda_reserv_matric_anosem')) ;

   end else begin


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

end;

procedure Tfrm_Alunos.dbNomeRespFinanExit(Sender: TObject);
var
   qyPessoaPai : TUMZQuery;
begin
   { Verificar se existe algum nome cadastrado }

   if tblResponsavel.State <> dsInsert then
      Exit;

   Dm.CriarConsulta(qyPessoaPai);
   qyPessoaPai.SQL.Clear;
   qyPessoaPai.SQL.Add('select cd_pessoa, nm_pessoa, ds_cpf, nm_pai from pessoas where nm_pessoa = :nome');
   qyPessoaPai.ParamByName('nome').AsString := tblResponsavelnm_pessoa.AsString;
   qyPessoaPai.Open;

   while not qyPessoaPai.Eof do
   Begin
      if Mensagem('Existe uma pessoa com o mesmo nome cadastrada no sistema.' + chr(13) +
                  '   Nome : ' + qyPessoaPai.FieldByName('nm_pessoa').AsString + '  (' + qyPessoaPai.FieldByName('cd_pessoa').AsString + ')' + chr(13) +
                  '   CPF : ' + qyPessoaPai.FieldByName('ds_cpf').AsString + chr(13) +
                  '   Nome do Pai : ' + qyPessoaPai.FieldByName('nm_pai').AsString + chr(13) + chr(13) +
                  'Deseja utilizar este cadastro? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
      = mrYes Then
      Begin
          tblResponsavel.Cancel;
          tblPessoa.Edit;

          if pgPessoa.ActivePage = tsPai then
             tblPessoacd_pai.AsInteger := qyPessoaPai.FieldByName('cd_pessoa').AsInteger
          else if pgPessoa.ActivePage = tsMae then
             tblPessoacd_mae.AsInteger := qyPessoaPai.FieldByName('cd_pessoa').AsInteger
          else if pgPessoa.ActivePage = tsRespAcademico then
             tblPessoacd_resp_acad.AsInteger := qyPessoaPai.FieldByName('cd_pessoa').AsInteger
          else if pgPessoa.ActivePage = tsRespFinanceiro then
             tblPessoacd_resp_finan.AsInteger := qyPessoaPai.FieldByName('cd_pessoa').AsInteger;
          tblPessoa.Post;

          tblResponsavel.Close;
          tblResponsavel.ParamByName('cd_responsavel').AsInteger := qyPessoaPai.FieldByName('cd_pessoa').AsInteger;
          tblResponsavel.Open;

          //Atualiza nacionalidade/estado nasc e cidade nasc.

           DBLookupComboBox18Exit(self);
           DBLookupComboBox18Exit(self);
           DBLookupComboBox18CloseUp(self);
           pgPessoaChange(self);

          Exit;
      End;


      qyPessoaPai.Next;
   End;
   qyPessoaPai.Free;
end;


function Tfrm_Alunos.DocumentoPendente: Boolean;
begin
     qyDocumentos.Close;
     qyDocumentos.ParamByName( 'cd_pessoa' ).AsInteger := tblPessoacd_pessoa.AsInteger;
     qyDocumentos.Open;
     btnDocumentos.Marked := (qyDocumentos.FieldByName( 'qtde' ).AsInteger > 0);
     btnDocumentos.Tag := (qyDocumentos.FieldByName( 'qtde' ).AsInteger);

     result := qyDocumentos.FieldByName( 'qtde' ).AsInteger > 0;

     if DM.variavel_parametro( 'sn_avisar_documentos_nao_necessarios' ) = 'S' then begin
        qyDocumentosNaoNecessarios.Close;
        qyDocumentosNaoNecessarios.ParamByName( 'cd_pessoa' ).AsInteger := tblPessoacd_pessoa.AsInteger;
        qyDocumentosNaoNecessarios.Open;
        btnDocumentos.Marked := (qyDocumentosNaoNecessarios.FieldByName( 'qtde' ).AsInteger > 0);
        btnDocumentos.Tag := qyDocumentosNaoNecessarios.FieldByName( 'qtde' ).AsInteger;
        result := qyDocumentosNaoNecessarios.FieldByName( 'qtde' ).AsInteger > 0;
     end;  

end;

procedure Tfrm_Alunos.sbMaisInformacoesClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  if tblPessoa.State = dsInsert then
  begin
     tblPessoa.Post;
  end;
  if tblResponsavel.State = dsInsert then
  begin
     tblResponsavel.Post;
  end;
  
  
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);
  if tblPessoacd_pessoa.AsInteger = 0 then
  begin
    Mensagem('Você precisa selecionar um aluno para poder executar esta ação',  'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if not frm_Pessoas_adicional.Montar_Dados('A', tblPessoacd_Pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.', 'Atenção', MB_OK + MB_ICONWARNING );

  FreeAndNil(frm_pessoas_adicional);

end;

procedure Tfrm_Alunos.sbMaisInformacoesAcademicoClick(Sender: TObject);
const
   SCaption = 'Confirmação';
   SMsgSalvar = 'Para cadastrar informações adicionais é necessário salvar o cadastro desta pessoa. Deseja salvar o cadastro agora?';
var
   UserChoice: Integer;
begin
   UserChoice := ID_YES;

   if tblResponsavel.State in dsEditModes then
   begin
      UserChoice := MessageBox(Handle, SMsgSalvar, SCaption,
         MB_ICONQUESTION or MB_YESNO);

      if UserChoice = ID_YES then
      begin
         btAcad_Salvar.Click;
      end;

   end;

   if (UserChoice = ID_YES) and (tblResponsavel.State = dsBrowse) then
   begin
      { Apresentar a tela de campos adicionais }
      Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

      if not frm_Pessoas_adicional.Montar_Dados('P', tblResponsavelcd_pessoa.AsInteger) then
         Mensagem('Não existe informações adicionais para este cadastro.', 'Atenção', MB_OK + MB_ICONWARNING );
      FreeAndNil(frm_pessoas_adicional);
   end;

end;

procedure Tfrm_Alunos.btnObservacoesClick(Sender: TObject);
begin
   btnOrientacao.Click;
end;

procedure Tfrm_Alunos.btnOrientacaoClick(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblPessoacd_pessoa.AsInteger,
         okPedagogical)
   else
      Mensagem('Selecione um aluno para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

procedure Tfrm_Alunos.DBEdit41KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pgDocFinan.ActivePageIndex := 0;
     dbCPFFinan.SetFocus;
     Key := #0;
  End;
end;

procedure Tfrm_Alunos.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  if not(tblResponsavel.State in [dsInsert,dsEdit]) then
     tblResponsavel.Edit;
end;

procedure Tfrm_Alunos.sbCepPaiClick(Sender: TObject);
begin
  tblResponsavel.Edit;

  Application.CreateForm(TfrmSelCep, frmSelCep);
  
  frmSelCep.ShowModal;

  if frmSelCep.flgSearch then
  begin
    tblResponsavel.FieldByName('ds_cep').AsString := frmSelCep.qyCep.FieldByName('ds_cep').AsString;
    tblResponsavel.FieldByName('ds_cidade').AsString := frmSelCep.qyCep.FieldByName('nm_cidade').AsString;
    tblResponsavel.FieldByName('ds_estado').AsString := frmSelCep.qyCep.FieldByName('ds_uf').AsString;
    tblResponsavel.FieldByName('cd_municipio').AsInteger   := frmSelCep.qyCep.FieldByName('cd_municipio').AsInteger;
    tblResponsavel.FieldByName('ds_bairro').AsString := frmSelCep.qyCep.FieldByName('nm_bairro').AsString;
    tblResponsavel.FieldByName('ds_logradouro').AsString := frmSelCep.qyCep.FieldByName('nm_logradouro').AsString;
    tblResponsavel.FieldByName('ds_pais').AsString := frmSelCep.qyCep.FieldByName('ds_pais').AsString;
  end;

  if pgPessoa.ActivePage = tsPai then
  begin
      //Atualiza combobox tipo logradouro.
      if (tblTpLogradouro.Locate('ds_logradouro', frmSelCep.qyCep.FieldByName('ds_logradouro').asString, [loCaseInsensitive,loPartialKey])) then
      begin
         dblbTpLogradouros.KeyValue := tblTpLogradouro.FieldByName('cd_logradouro').AsInteger;
         dblbTpLogradouros.Refresh;
      end;
  end;

  if pgPessoa.ActivePage = tsMae then
  begin
      //Atualiza combobox tipo logradouro.
      if (tblTpLogradouro.Locate('ds_logradouro', frmSelCep.qyCep.FieldByName('ds_logradouro').asString, [loCaseInsensitive,loPartialKey])) then
      begin
         dblbTpLogradouro.KeyValue := tblTpLogradouro.FieldByName('cd_logradouro').AsInteger;
         dblbTpLogradouro.Refresh;
      end;
  end;

  if pgPessoa.ActivePage = tsRespAcademico then
  begin
      //Atualiza combobox tipo logradouro.
      if (tblTpLogradouro.Locate('ds_logradouro', frmSelCep.qyCep.FieldByName('ds_logradouro').asString, [loCaseInsensitive,loPartialKey])) then
      begin
         DBLookupComboBox29.KeyValue := tblTpLogradouro.FieldByName('cd_logradouro').AsInteger;
         DBLookupComboBox29.Refresh;
      end;
  end;

  if pgPessoa.ActivePage = tsRespFinanceiro then
  begin
      //Atualiza combobox tipo logradouro.
      if (tblTpLogradouro.Locate('ds_logradouro', frmSelCep.qyCep.FieldByName('ds_logradouro').asString, [loCaseInsensitive,loPartialKey])) then
      begin
         DBLookupComboBox30.KeyValue := tblTpLogradouro.FieldByName('cd_logradouro').AsInteger;
         DBLookupComboBox30.Refresh;
      end;
  end;

  FreeAndNil(frmSelCep);

end;

procedure Tfrm_Alunos.DBEdit63KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pgDocPai.ActivePageIndex := 0;
     dbCPFPai.SetFocus;
     Key := #0;
  End;
end;

procedure Tfrm_Alunos.DBEdit16KeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     pgDocAcad.ActivePageIndex := 0;
     dbCPFAcad.SetFocus;
     Key := #0;
  End;

end;

procedure Tfrm_Alunos.sbBuscarPaiClick(Sender: TObject);
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
       if tblPessoanm_pai.AsString = '' then
         tblPessoanm_pai.AsString := resultado_filtro.nm_pessoa;
       tblPessoa.Post();

    End;
end;

procedure Tfrm_Alunos.sbBuscarMaeClick(Sender: TObject);
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
       if tblPessoanm_mae.AsString = '' then
          tblPessoanm_mae.AsString := resultado_filtro.nm_pessoa;
       tblPessoa.Post();
    end;
end;


procedure Tfrm_Alunos.MatricularEtapa(CodMatricula: Integer; Curso : String; AnoSem: Integer; NrMatricula : String);
Var
   qGrade : TUMZQuery;
   qryBuscaDpto : TUMZQuery;
begin
   DM.CriarConsulta(qryBuscaDpto);
   if (DM.db.Protocol = DB_PROTOCOL_ORACLE) then
   begin
      qryBuscaDpto.SQL.Text :=
      '   SELECT                                   '+
      '     CAST(FIRST_OCCURRENCE(D.cd_instituicao) AS NUMBER(5)) AS codigo '+
      '   FROM                                     '+
      '     departamentos d                        '+
      '     INNER JOIN  CURSOS c ON (d.codigo = c.depto )   '+
      '   WHERE                                             '+
      '     c.codigo = '''+ Curso                         +''''+
      '   GROUP BY                                          '+
      '     d.codigo                                        ';
   end
   else if (DM.db.Protocol = DB_PROTOCOL_MYSQL) then
   begin
      qryBuscaDpto.SQL.Text :=
      '   SELECT                                   '+
      '     d.cd_instituicao as codigo             '+
      '   FROM                                     '+
      '     departamentos d                        '+
      '     INNER JOIN  CURSOS c ON (d.codigo = c.depto )   '+
      '   WHERE                                             '+
      '     c.codigo = '''+ Curso                         +''''+
      '   GROUP BY                                          '+
      '     d.codigo                                        ';
   end;
   qryBuscaDpto.Open;

   // Pegar o códgio da grade
   DM.CriarConsulta(qGrade);
   qGrade.SQL.Text := ' SELECT * FROM matriculas_curso WHERE cd_matricula_curso = :CodigoMatricula ';
   qGrade.ParamByName('CodigoMatricula').AsInteger := CodMatricula;
   qGrade.Open();

   frmMatricular.iGradeCurso := qGrade.FieldByName('cd_grade').AsInteger;

   FreeAndNil(qGrade);

// Verificar se ja tem matrícula, e procurar turmas para a proxima etapa }

  frmMatricular.tblMatriculas.SQL.Clear;
  frmMatricular.tblMatriculas.SQL.Add( 'select * from Matriculas where' );
  frmMatricular.tblMatriculas.SQL.Add( 'CodigoAluno = :CodigoAluno' );
  frmMatricular.tblMatriculas.ParamByName('CodigoAluno').AsInteger := frm_Alunos.tblPessoacd_pessoa.AsInteger;
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
     frmMatricular.tblTurmas.SQL.TEXT :=
                                'SELECT                      '+
                                '  T.*, C.CD_DEPTO DEPTO , S.DS_VALOR '+
                                'FROM                        '+
                                '  TURMAS T                  '+
                                '  JOIN CURSOS_COLIGADAS C ON (C.CD_COLIGADA = T.CD_COLIGADA AND T.CURSO = C.CD_CURSO )'+
                                '  LEFT JOIN SITUACOES S ON ( S.CD_SITUACAO = T.CD_SITUACAO AND S.CD_MODULO = 1148 )'+
                                'WHERE           '+
                                '   T.ANOSEMESTRE =  :ANOSEMESTRE'+
                                '   AND C.CD_CURSO = :CURSO        '+
                                '   AND T.SERIE = :SERIE         '+
                                '   AND T.CD_COLIGADA IN (' + DM.GetColigadas + ' ) ' +  // SOMENTE COLIGADAS COM PERMISSÃO
                                ' ORDER BY T.CODIGO';
     frmMatricular.tblTurmas.ParamByName('CURSO').AsString := Curso;
     frmMatricular.tblTurmas.ParamByName('ANOSEMESTRE').AsInteger := AnoSem;
     frmMatricular.tblTurmas.ParamByName('SERIE').AsInteger := tblMatriculasEtapaserie.AsInteger + 1;

     frmMatricular.tblTurmas.Open;

     if not frmMatricular.tblTurmas.Eof Then
     Begin

//        Manter o padrão estabelecido no botão Matricular ou Rematricular
        // frmMatricular.CheckBox1.Checked := True;

      	// Re-Matricula
        frmMatricular.tblMatriculascd_ingresso.AsInteger := 6;
        if qryBuscaDpto.FieldByName('codigo').AsString <> '' then
           frmMatricular.tblMatriculascd_instituicao_origem.AsInteger := qryBuscaDpto.FieldByName('codigo').AsInteger;

     End
     else begin
  //    O aluno não tem nenhuma matricula, listar todas as turmas
       frmMatricular.CheckBox1.OnClick := nil;
       frmMatricular.CheckBox1.Checked := false;

     end;

  End
  Else
  Begin

     frmMatricular.serie := 0;

  End;

  frmMatricular.ShowModal;

  FreeAndNil(qryBuscaDpto);
  
  dsPessoaDataChange(nil,nil);

end;

procedure Tfrm_Alunos.sbCopiarAlunoClick(Sender: TObject);
begin
   // Copiar Endereço do Aluno;
  tblResponsavel.Edit;
  copiar_endereco_aluno;
end;

procedure Tfrm_Alunos.tblResponsavelAfterOpen(DataSet: TDataSet);
begin
   if tblResponsavelcd_pessoa.AsInteger > 0 then
      GetVSTContatosResponsavel().LoadPessoa(
         TPessoa.Create(tblResponsavelcd_pessoa.AsInteger),
         NOT(PodeAlterarContatosResponsavel(tblResponsavelcd_pessoa.AsInteger, 1003))
      );

   if(Self.ehResponsavelAcad(tblResponsavelcd_pessoa.AsInteger,tblPessoacd_pessoa.AsInteger)) then
   begin
      if pgPessoa.ActivePage = tsPai then begin
         DBCheckBox2.Enabled := false;
      end else if pgPessoa.ActivePage = tsMae then
      begin
         DBCheckBox3.Enabled := false;
      end;
   end
   else
   begin
      if pgPessoa.ActivePage = tsPai then begin
         DBCheckBox2.Enabled := true;
      end else if pgPessoa.ActivePage = tsMae then
      begin
         DBCheckBox3.Enabled := true;
      end;
   end;

end;

procedure Tfrm_Alunos.tblResponsavelAfterPost(DataSet: TDataSet);
begin
  inherited;
  tblPessoa.Edit;
  if (pgPessoa.ActivePage = tsMae) then
      tblPessoacd_mae.AsInteger := iCodPaiMae
  else
  if(pgPessoa.ActivePage = tsPai) then
      tblPessoacd_pai.AsInteger := iCodPaiMae ;
  tblPessoa.Post;
  tblResponsavel.Close;
  tblResponsavel.ParamByName('cd_responsavel').AsInteger := iCodPaiMae;
  tblResponsavel.Open;
  end;

procedure Tfrm_Alunos.sbPaisComboCloseUp(Sender: TObject);
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
end;

procedure Tfrm_Alunos.sbPaisComboExit(Sender: TObject);
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

   DM.tblEstados.Close;
   DM.tblEstados.SQL.Text := ''+
      'SELECT *                             ' +
      'FROM estados                         ' +
      'WHERE cd_pais = :cd_pais_selecionado ' +
      'ORDER BY ds_estado                   ';

   DM.tblEstados.ParamByName('cd_pais_selecionado').AsInteger :=
      qyAux.FieldByName('cd_pais').asInteger;

   DM.tblEstados.Open;

   DBLookupComboBox2.Enabled := not(DM.tblEstados.FieldByName('cd_pais').AsString = '');
   dbCidadeNascimento.Enabled := not(DM.tblEstados.FieldByName('cd_pais').AsString = '');

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

procedure Tfrm_Alunos.selecionaPessoa(cd_pessoa: Integer);
begin
   tblPessoa.SQL.Text := 'Select * FROM pessoas WHERE cd_pessoa = ' + intToStr(cd_pessoa);
   tblPessoa.Open;

   Self.Show;
end;

procedure Tfrm_Alunos.sbCopiarRespClick(Sender: TObject);
var
  tblRespFinan: TUMZQuery;
begin
  if Mensagem('Deseja copiar o endereço do responsável financeiro do aluno?', 'Confirmação', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then Exit;

  DM.CriarConsulta(tblRespFinan);

  tblRespFinan.SQL.Text := 'select * from pessoas where cd_pessoa = :cd_responsavel';

  tblRespFinan.Close();
  tblRespFinan.ParamByName('cd_responsavel').AsInteger := tblPessoacd_resp_finan.AsInteger;
  tblRespFinan.Open();

  if tblRespFinan.Eof then Exit; // Não tem responsável

  tblPessoa.Edit;

   { Somente copiar se estiver no modo de edição }
  tblPessoa.FieldByName('ds_cep').AsString := tblRespFinan.FieldByName('ds_cep').AsString;
  tblPessoa.FieldByName('ds_pais').AsString := tblRespFinan.FieldByName('ds_pais').AsString;
  tblPessoa.FieldByName('ds_estado').AsString := tblRespFinan.FieldByName('ds_estado').AsString;
  tblPessoa.FieldByName('ds_cidade').AsString := tblRespFinan.FieldByName('ds_cidade').AsString;
  tblPessoa.FieldByName('cd_municipio').AsString := tblRespFinan.FieldByName('cd_municipio').AsString;
  
  tblPessoa.FieldByName('descMunicipioAtual').AsString := tblRespFinan.FieldByName('ds_cidade').AsString;
  tblPessoa.FieldByName('ds_bairro').AsString := tblRespFinan.FieldByName('ds_bairro').AsString;
  tblPessoa.FieldByName('ds_logradouro').AsString := tblRespFinan.FieldByName('ds_logradouro').AsString;
  tblPessoa.FieldByName('ds_logradouro_nro').AsString := tblRespFinan.FieldByName('ds_logradouro_nro').AsString;
  tblPessoa.FieldByName('ds_complemento').AsString := tblRespFinan.FieldByName('ds_complemento').AsString;

  // Copiar os contatos
  if DM.variavel_parametro('matricula_copiar_contatos') <> '' then begin

         tblContatosPadroes.Close();
         tblContatosPadroes.SQL.Text :=
          ' REPLACE INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) ' +
          ' SELECT ' + tblPessoa.FieldByName('cd_pessoa').AsString + ', ct.cd_contato, cp.ds_contato FROM contatos_tipos ct ' +
          ' INNER JOIN contatos_pessoas cp ON (ct.cd_contato = cp.cd_contato AND cp.cd_pessoa = ' + tblRespFinan.FieldByName('cd_pessoa').AsString + ') '+
          ' WHERE ct.cd_contato in ' + DM.variavel_parametro('matricula_copiar_contatos');
         tblContatosPadroes.ExecSQL();

         tblContatosPadroes.Close();
         tblContatosPadroes.SQL.Text :=
          ' DELETE FROM contatos_pessoas ' +
          ' WHERE cd_pessoa = ' + tblPessoa.FieldByName('cd_pessoa').AsString +
          ' AND cd_contato in ' + DM.variavel_parametro('matricula_copiar_contatos') +
          ' AND ds_contato = "" ';
         tblContatosPadroes.ExecSQL();
  end;

end;

procedure Tfrm_Alunos.sbHistoricoClick(Sender: TObject);
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

procedure Tfrm_Alunos.DBEdit78KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pgDocMae.ActivePageIndex := 0;
     dbCPFMae.SetFocus;
     Key := #0;
  End;
end;

procedure Tfrm_Alunos.dbCidadeNascimentoDropDown(Sender: TObject);
var
   LSNome: string;
begin
   inherited;
   LSNome := QuotedStr(tblPessoanm_pessoa.AsString);
end;

procedure Tfrm_Alunos.dbComplementoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  Begin
     pcDocumentos.ActivePageIndex := 0;
     dbCpf.SetFocus;
     Key := #0;
  End;
end;

function Tfrm_Alunos.GetActiveComboBoxNacionalidade: TUMComboBox;
begin
   Result := nil;

   case pgPessoa.ActivePageIndex of
      2: Result := cbNacionalidadePai;
      3: Result := cbNacionalidadeMae;
      4: Result := cbNacionalidadeRespAcad;
      5: Result := DBEdit9;
   end;
end;

function Tfrm_Alunos.GetLabelHierarquiaResponsavel: TLabel;
begin
   Result := nil;

   case pgPessoa.ActivePageIndex of
      2: Result := lblMensagemHierarquiaPai;
      3: Result := lblMensagemHierarquiaMae;
      4: Result := lblMensagemHierarquiaRespAcad;
      5: Result := lblMensagemHierarquiaRespFinan;
   end;
end;

function Tfrm_Alunos.GetVSTContatosResponsavel: TEditorContatosPessoa;
begin
   Result := nil;

   case pgPessoa.ActivePageIndex of
      2: Result := VSTContatosPaiEditor;
      3: Result := VSTContatosMaeEditor;
      4: Result := VSTContatosRespAcadEditor;
      5: Result := VSTContatosRespFinanEditor;
   end;
end;

function Tfrm_Alunos.GruposHierarquia(cd_pessoa: Integer):Boolean;
var
   lstGrupo            : TStringList;
   indice              : Integer;
   Resultado           : Boolean;
   qryGruposHierarquia : TUMZQuery;
begin
   Resultado := true;
   lstGrupo := TStringList.Create;
   lstGrupo := DM.getGrupos(cd_pessoa);

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
   '   p.cd_pessoa = '+ IntToStr(DM.iCdPessoaLogado)                          +
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

procedure Tfrm_Alunos.importaPessoaModuloContatos(cd_informacao: integer; ds_cpf: String);
var
   qyBuscaContatos, qyBuscaConheceu,qySalvaProfissaoContatos, qyBuscaMunicipio : TUMZQuery;

begin
   DM.CriarConsulta(qyBuscaContatos);
   DM.CriarConsulta(qySalvaProfissaoContatos);
      DM.CriarConsulta(qyBuscaConheceu);
   DM.CriarConsulta(qyBuscaMunicipio);
   qyBuscaContatos.SQL.Text := 'SELECT * FROM pessoas_info WHERE cd_informacao = ' + IntToStr(cd_informacao);

   qyBuscaContatos.Open;
   
   tblPessoa.SQL.Text := 'SELECT * FROM pessoas LIMIT 1';
   tblPessoa.Open;
   tblPessoa.Insert;

   tblPessoanm_pessoa.AsString := qyBuscaContatos.FieldByName('nm_pessoa').AsString;

   if qyBuscaContatos.FieldByName('ds_uf').asString <> '' then
   begin
      tblPessoa.FieldByName('ds_estado').AsString := qyBuscaContatos.FieldByName('ds_uf').asString;
   end;

   if qyBuscaContatos.FieldByName('ds_cidade').asString <> '' then
   begin
      qyBuscaMunicipio.SQL.Text:= 'SELECT * FROM municipios WHERE ds_uf = :estado AND ds_municipio = :municipio';
      qyBuscaMunicipio.ParamByName('estado').AsString:= qyBuscaContatos.FieldByName('ds_uf').asString;
      qyBuscaMunicipio.ParamByName('municipio').AsString:= qyBuscaContatos.FieldByName('ds_cidade').asString;
      qyBuscaMunicipio.Open;

      if qyBuscaMunicipio.RecordCount > 0 then
      begin
        tblPessoa.FieldByName('cd_municipio').AsInteger := qyBuscaMunicipio.FieldByName('cd_municipio').AsInteger;
      end;

      tblPessoa.FieldByName('ds_cidade').AsString := qyBuscaContatos.FieldByName('ds_cidade').asString;
      tblPessoadescMunicipioAtual.AsString := qyBuscaContatos.FieldByName('ds_cidade').asString;
      tblMunicipioAtual.Locate('ds_municipio', qyBuscaContatos.FieldByName('ds_cidade').asString,[loCaseInsensitive]);
      qyBuscaMunicipio.Close;
   end
   else
   begin
      tblPessoacd_municipio.AsInteger := -1;
   end;

   if qyBuscaContatos.FieldByName('ds_endereco').asString <> '' then
   begin
      tblPessoa.FieldByName('ds_logradouro').AsString := qyBuscaContatos.FieldByName('ds_endereco').AsString;
   end;
    //campos novos da tela de planilha de contatos>incluir
   if qyBuscaContatos.FieldByName('ds_endereco_nro').asString <> '' then
   begin
      tblPessoa.FieldByName('ds_logradouro_nro').AsString := qyBuscaContatos.FieldByName('ds_endereco_nro').AsString;
   end;

   if qyBuscaContatos.FieldByName('ds_cep').asString <> '' then
   begin
      tblPessoa.FieldByName('ds_cep').AsString := qyBuscaContatos.FieldByName('ds_cep').AsString;
   end;

   if qyBuscaContatos.FieldByName('ds_bairro').asString <> '' then
   begin
      tblPessoa.FieldByName('ds_bairro').AsString := qyBuscaContatos.FieldByName('ds_bairro').AsString;
   end;

   if not qyBuscaContatos.FieldByName('cd_conhecimento').IsNull then
   begin
      qyBuscaConheceu.SQL.Text:= 'SELECT * FROM situacoes WHERE cd_modulo = 1 and cd_situacao = :cd_situacao';
      qyBuscaConheceu.ParamByName('cd_situacao').AsInteger:= qyBuscaContatos.FieldByName('cd_conhecimento').AsInteger;
      qyBuscaConheceu.Open;
      if qyBuscaConheceu.RecordCount > 0 then
      begin
        tblPessoa.FieldByName('ds_forma_conheceu').AsString := qyBuscaConheceu.fieldByName('ds_valor').asString;
      end;
      qyBuscaConheceu.Close;
   end;

   
   if ds_cpf <> '' then
   begin
      ds_cpf := stringReplace(ds_cpf, ',', '', [rfReplaceAll, rfIgnoreCase]);
      ds_cpf := stringReplace(ds_cpf, '.', '', [rfReplaceAll, rfIgnoreCase]);
      ds_cpf := stringReplace(ds_cpf, '-', '', [rfReplaceAll, rfIgnoreCase]);
      tblPessoads_cpf.AsString := ds_cpf;
   end;
   tblPessoa.Post;

   tblPessoa.SQL.Text := 'Select * FROM pessoas WHERE nm_pessoa = :nm_pessoa AND dt_cadastro = :dt_cadastro ';
   tblPessoa.ParamByName('nm_pessoa').asString := qyBuscaContatos.FieldByName('nm_pessoa').AsString;
   tblPessoa.ParamByName('dt_cadastro').AsDateTime := Date;
   tblPessoa.Open;

   qyBuscaProfissaoContatos.ParamByName('cd_informacao').AsInteger := cd_informacao;

   qyBuscaProfissaoContatos.Close;
   qyBuscaProfissaoContatos.Open;

   qySalvaProfissaoContatos.SQL.TEXT := 'SELECT * FROM pessoas_cadastro LIMIT 1';
   qySalvaProfissaoContatos.Open;

   qySalvaProfissaoContatos.Insert;

   qySalvaProfissaoContatos.FieldByName('cd_pessoa').AsInteger := tblPessoa.FieldByName('cd_pessoa').AsInteger;
   qySalvaProfissaoContatos.FieldByName('cd_campo').AsInteger  := qyBuscaProfissaoContatos.FieldByName('cd_campo_pessoa').AsInteger;
   qySalvaProfissaoContatos.FieldByName('ds_conteudo').AsString := qyBuscaProfissaoContatos.FieldByName('ds_conteudo').AsString;
   qySalvaProfissaoContatos.Post;

   tblContatos.SQL.Text := 'SELECT * FROM contatos_pessoas LIMIT 1';
   tblContatos.Open;

   if qyBuscaContatos.FieldByName('ds_contatos').AsString <> '' then
   begin

      tblContatos.Insert;

      tblContatos.FieldByName('cd_pessoa').AsInteger  := tblPessoa.FieldByName('cd_pessoa').AsInteger;
      tblContatos.FieldByName('cd_contato').AsInteger := 1;
      tblContatos.FieldByName('ds_contato').asString  := qyBuscaContatos.FieldByName('ds_contatos').AsString;

      tblContatos.Post;
   end;


   if qyBuscaContatos.FieldByName('ds_telefone2').AsString <> '' then
   begin

      tblContatos.Insert;

      tblContatos.FieldByName('cd_pessoa').AsInteger  := tblPessoa.FieldByName('cd_pessoa').AsInteger;
      tblContatos.FieldByName('cd_contato').AsInteger := 2;
      tblContatos.FieldByName('ds_contato').asString  := qyBuscaContatos.FieldByName('ds_telefone2').AsString;

      tblContatos.Post;
   end;

   if qyBuscaContatos.FieldByName('ds_email').AsString <> '' then
   begin

      tblContatos.Insert;

      tblContatos.FieldByName('cd_pessoa').AsInteger  := tblPessoa.FieldByName('cd_pessoa').AsInteger;
      tblContatos.FieldByName('cd_contato').AsInteger := 4;
      tblContatos.FieldByName('ds_contato').asString  := qyBuscaContatos.FieldByName('ds_email').AsString;

      tblContatos.Post;

   end;

   if qyBuscaContatos.FieldByName('ds_telefone3').AsString <> '' then
   begin

      tblContatos.Insert;

      tblContatos.FieldByName('cd_pessoa').AsInteger  := tblPessoa.FieldByName('cd_pessoa').AsInteger;
      tblContatos.FieldByName('cd_contato').AsInteger := 3;
      tblContatos.FieldByName('ds_contato').asString  := qyBuscaContatos.FieldByName('ds_telefone3').AsString;

      tblContatos.Post;

   end;

   if qyBuscaContatos.FieldByName('ds_telefone4').AsString <> '' then
   begin

      tblContatos.Insert;

      tblContatos.FieldByName('cd_pessoa').AsInteger  := tblPessoa.FieldByName('cd_pessoa').AsInteger;
      tblContatos.FieldByName('cd_contato').AsInteger := 7;
      tblContatos.FieldByName('ds_contato').asString  := qyBuscaContatos.FieldByName('ds_telefone4').AsString;

      tblContatos.Post;
   end;


   tblPessoa.Refresh;
   tblPessoa.Close;
   tblPessoa.Open;
   tblContatos.Refresh;

end;
end.
