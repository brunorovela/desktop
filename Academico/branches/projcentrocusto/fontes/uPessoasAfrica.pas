unit uPessoasAfrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, Db, ZConnection, Mask,
  DBCtrls, jpeg, DBCGrids, Grids, DBGrids, Buttons, ExtDlgs, Menus, DBTables,
  uFrameParentes, ZAbstractTable, ZDataset, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, DSPack, uPessoasDriverCamera, CropImage, DirectShow9,
  DelphiTwain, uFSelecionarPessoa, UMComboBox, ClassPessoas, ZSqlUpdate;

type
   TProcedureOnChange = procedure (Sender: TObject) of Object;

type
  TfPessoasAfrica = class(TForm)
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
    tblPessoads_estado_nascimento: TStringField;
    tblPessoads_complemento: TStringField;
    tblPessoads_cep: TStringField;
    tblPessoads_bairro: TStringField;
    tblPessoads_cidade: TStringField;
    tblPessoads_estado: TStringField;
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
    Label1: TLabel;
    dbNome: TDBEdit;
    dsPessoa: TDataSource;
    Label2: TLabel;
    dbNasc: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    dbSexo: TDBComboBox;
    Label7: TLabel;
    dblcCep: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbEndereco: TDBEdit;
    Label10: TLabel;
    dbComplemento: TDBEdit;
    Label11: TLabel;
    Label14: TLabel;
    pcDocumentos: TPageControl;
    TabSheet2: TTabSheet;
    dbCpf: TDBEdit;
    Label15: TLabel;
    dbIdentidade: TDBEdit;
    Label16: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    dbPai: TDBEdit;
    Label36: TLabel;
    dbMae: TDBEdit;
    Label37: TLabel;
    dbConjuge: TDBEdit;
    dsContatoPessoa: TDataSource;
    tblPessoads_pais: TStringField;
    DBText1: TDBText;
    DBText2: TDBText;
    tsComplementares: TTabSheet;
    dbObs: TDBMemo;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    Panel2: TPanel;
    Panel4: TPanel;
    tblPessoacd_empresa: TIntegerField;
    tblPessoads_cargo: TStringField;
    tblPessoadescEmpresa: TStringField;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    tblPessoads_pais_nascimento: TStringField;
    tblPessoads_logradouro: TStringField;
    tblPessoads_logradouro_nro: TStringField;
    Label38: TLabel;
    DBEdit2: TDBEdit;
    Label41: TLabel;
    Label42: TLabel;
    dblcProvinciaNasc: TDBLookupComboBox;
    Label4: TLabel;
    dblcProvincia: TDBLookupComboBox;
    tblPessoads_identidade_orgao_exp: TStringField;
    tblPessoads_rm_corporacao: TStringField;
    tblPessoads_rm_org_numero: TStringField;
    tblPessoads_rm_doc_numero: TStringField;
    tblPessoads_rm_orgao: TStringField;
    tblPessoads_rm_doc_tipo: TStringField;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label74: TLabel;
    DBEdit13: TDBEdit;
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
    dbEstadoCivil: TDBLookupComboBox;
    tblPessoadt_titulo_emissao: TDateTimeField;
    AbrirFoto: TSavePictureDialog;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    tblContatoPessoa: TUMZQuery;
    tblContatoPessoacd_pessoa: TIntegerField;
    tblContatoPessoacd_contato: TIntegerField;
    tblContatoPessoads_contato: TStringField;
    tblContatoPessoadescContato: TStringField;
    tblPessoasn_bloqueto_empresa: TStringField;
    DBCheckBox1: TDBCheckBox;
    sbMaisInformacoes: TSpeedButton;
    tblPessoaim_pessoa: TBlobField;
    pmContatos: TPopupMenu;
    AdicionarContato1: TMenuItem;
    ExcluirContato1: TMenuItem;
    N1: TMenuItem;
    Cancelar1: TMenuItem;
    SpeedButton2: TSpeedButton;
    tblPessoads_login: TStringField;
    Bevel2: TBevel;
    Label33: TLabel;
    edLogin: TEdit;
    edSenha1: TEdit;
    Label108: TLabel;
    edSenha2: TEdit;
    Label109: TLabel;
    tblPessoatp_cert: TSmallintField;
    tblPessoads_cert_folha: TStringField;
    tblPessoads_cert_livro: TStringField;
    tblPessoadt_cert: TDateTimeField;
    tblPessoads_cert_uf: TStringField;
    tblPessoads_cert_orgao: TStringField;
    dbTipoLogradouro: TDBLookupComboBox;
    lbTipoLogradouro: TLabel;
    tblTpLogradouro: TUMZQuery;
    tblTpLogradourocd_logradouro: TIntegerField;
    tblTpLogradourods_logradouro: TStringField;
    tblPessoadesLogradouro: TStringField;
    tblMunicipios: TUMZQuery;
    dblcCidadeNascimento: TDBLookupComboBox;
    tblMunicipioscd_municipio: TIntegerField;
    tblMunicipiosds_municipio: TStringField;
    sbPaisCombo: TDBLookupComboBox;
    tblPessoadescPais: TStringField;
    dblcCidadeAtual: TDBLookupComboBox;
    tblMunicipioAtual: TUMZQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    tblPessoadescOrgao: TStringField;
    tblOrgaos: TZTable;
    tblMunicipioAtualnr_praca: TIntegerField;
    qyProvincias: TUMZQuery;
    qyDistritos: TUMZQuery;
    qyLocalidades: TUMZQuery;
    dtcProvincias: TDataSource;
    dtcDistritos: TDataSource;
    dtcLocalidades: TDataSource;
    qyProvinciascd_provincia: TIntegerField;
    qyProvinciascd_codigo: TIntegerField;
    qyProvinciasds_provincia: TStringField;
    qyDistritoscd_distrito: TIntegerField;
    qyDistritoscd_codigo: TIntegerField;
    qyDistritoscd_provincia: TIntegerField;
    qyDistritosds_distrito: TStringField;
    qyLocalidadescd_localidade: TIntegerField;
    qyLocalidadescd_codigo: TStringField;
    qyLocalidadesds_bairro: TStringField;
    qyLocalidadesds_localidade: TStringField;
    qyLocalidadesds_posto: TStringField;
    qyLocalidadescd_distrito: TIntegerField;
    qyLocalidadescd_provincia: TIntegerField;
    tblPessoadescProvinciaNasc: TStringField;
    tblPessoadescDistritoNasc: TStringField;
    tblPessoadescProvincia: TStringField;
    tblPessoadescDistrito: TStringField;
    dblcLocalidade2: TDBLookupComboBox;
    tblPessoadescLocalidade: TStringField;
    tsParentes: TTabSheet;
    frParentes1: TfrParentes;
    tblPessoadescPaisAtual: TStringField;
    Label13: TLabel;
    dblcPaisAtual: TDBLookupComboBox;
    tblPaisAtual: TUMZQuery;
    Label6: TLabel;
    dblcLocalidade: TDBLookupComboBox;
    tblPessoadescLocalidadeNasc: TStringField;
    lbNacionalidade: TLabel;
    tblPessoacd_municipio: TLargeintField;
    tblPessoacd_pais: TLargeintField;
    tblPessoacd_logradouro: TLargeintField;
    tblPessoacd_orgao_emissor: TLargeintField;
    tblPessoacd_municipio_nasc: TLargeintField;
    tblPessoacd_estado_nascimento: TSmallintField;
    tblPessoacd_pais_nascimento: TLargeintField;
    tblPessoacd_estado: TLargeintField;
    tblPessoacd_localidade: TIntegerField;
    tblPessoanr_praca: TLargeintField;
    tblPessoacd_localidade_nasc: TIntegerField;
    qyTemp1: TUMZQuery;
    qyTemp2: TUMZQuery;
    btnObservacoes: TToolButton;
    qryProcuraNUIT: TUMZReadOnlyQuery;
    qryProcuraNUITCD_PESSOA: TIntegerField;
    tblPessoanr_cert_termo: TStringField;
    ToolBar1: TToolBar;
    btnAplicar: TToolButton;
    btnCancelar: TToolButton;
    btnConectar: TToolButton;
    btnCapturar: TToolButton;
    Panel1: TPanel;
    imageFoto: TImage;
    ciFoto: TCropImage;
    imgWebCam: TVideoWindow;
    tblPessoasn_foto: TStringField;
    pmFoto: TPopupMenu;
    miExcluir: TMenuItem;
    btnDigitalizar: TToolButton;
    imgListFoto: TImageList;
    DelphiTwain1: TDelphiTwain;
    Label90: TLabel;
    Label92: TLabel;
    dbedSector: TDBEdit;
    dbedExpiracao: TDBEdit;
    lbExpiracao: TLabel;
    tblPessoadt_identidade_expiracao: TDateTimeField;
    qyNacionalidade: TUMZQuery;
    qyNacionalidadeds_nacionalidade: TStringField;
    cbNacionalidade: TUMComboBox;
    tblPaises: TZTable;
    qyPais: TUMZQuery;
    qyPaisds_nacionalidade: TStringField;
    medCampoContato: TMaskEdit;
    qryDeleteContato: TUMZQuery;
    qryContatosTipos: TUMZQuery;
    qryContatosTiposds_mascara: TStringField;
    tblContatoPessoads_contato_formatado: TStringField;
    gradeContato: TDBGrid;
    tblContatoPessoads_observacao: TStringField;
    gradeVinculosExterno: TDBGrid;
    lbVinculoExterno: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    updVinculoExterno: TZUpdateSQL;
    dsVinculoExterno: TDataSource;
    qyVinculosExterno: TUMZQuery;
    qyVinculosExternocd_sistema: TIntegerField;
    qyVinculosExternods_sistema: TStringField;
    qyVinculosExternocd_pessoa_externa: TIntegerField;
    qyVinculosExternocd_pessoa: TIntegerField;
    procedure gradeVinculosExternoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsVinculoExternoStateChange(Sender: TObject);
    procedure qyVinculosExternoAfterOpen(DataSet: TDataSet);
    procedure tblContatoPessoads_observacaoChange(Sender: TField);
    procedure medCampoContatoEnter(Sender: TObject);
    procedure medCampoContatoExit(Sender: TObject);
    procedure tblContatoPessoaCalcFields(DataSet: TDataSet);
    procedure tblContatoPessoaBeforeScroll(DataSet: TDataSet);
    procedure dsContatoPessoaStateChange(Sender: TObject);
    procedure dsContatoPessoaDataChange(Sender: TObject; Field: TField);
    procedure medCampoContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gradeContatoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbPaisComboExit(Sender: TObject);
    procedure cbNacionalidadeChange(Sender: TObject);
    procedure cbNacionalidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNacionalidadeExit(Sender: TObject);
    procedure tblPessoaAfterCancel(DataSet: TDataSet);
    procedure DelphiTwain1TwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure DelphiTwain1AcquireError(Sender: TObject; const Index: Integer;
      ErrorCode, Additional: Integer);
    procedure DelphiTwain1AcquireCancel(Sender: TObject; const Index: Integer);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure miExcluirClick(Sender: TObject);
    procedure imageFotoDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnCapturarClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure DBText2DblClick(Sender: TObject);
    procedure gradeContatoEnter(Sender: TObject);
    procedure tblPessoaBeforeDelete(DataSet: TDataSet);
    procedure tblPessoacd_paisChange(Sender: TField);
    procedure tblPessoacd_pais_nascimentoChange(Sender: TField);
    procedure frParentes1BuscarClick(Sender: TObject);
    procedure frParentes1btIncluir_PessoaClick(Sender: TObject);
    procedure frParentes1btAlterar_PessoaClick(Sender: TObject);
    procedure frParentes1btExcluir_PessoaClick(Sender: TObject);
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
    procedure tblContatoPessoaNewRecord(DataSet: TDataSet);
    procedure tblContatoPessoaBeforePost(DataSet: TDataSet);
    procedure btFechar_PessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure gradeContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure gradeContatoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbNomeExit(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure sbCepClick(Sender: TObject);
    procedure AdicionarContato1Click(Sender: TObject);
    procedure ExcluirContato1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure VerificaBibliotecaTwain();
    function PodeAlterarSenha() : Boolean;
  private
    { Private declarations }
    nacionalidadeAtual : Integer;
    validacaoCampo: Boolean;
    valorCampoContatoSemMascara: string;
    valorCampoContatoComMascara: string;

    function Tem_matricula(codigo : integer) : boolean;
    function NUITValido: Boolean;
    function NUITDuplicado: Boolean;
    function retiraMascara(strComMascara : String): String;
    function retiraMascaraTelefone(strComMascara : String): String;

  protected
    { codigo de permissao }
    iPermissao : Integer;
    Origem: smallint;
    Imagem: TJPEGImage;

    AbaSelecionada: AbasFiltroPessoa;
    resultado_filtro : TResultadoFiltroPessoa;

    procedure alteraLogin(edLogin, edSenha, edRedgSenha: TEdit; sLoginAntigo: string; qyPaiResp: TUMZQuery);
    procedure CarregarPaises();
    procedure CarregarComboNacionalidades(Sender: TUMComboBox; procedimentoOnChange: TProcedureOnChange);
    procedure FiltrarNacionalidade(const ds_nacionalidade: String; Combo: TUMComboBox);


  public
   filtro_cd_pessoa: Integer;
  	bMenorIdade: Boolean;
  	procedure ResizeFoto(var oJPG: TJPEGImage; iMaxWidth,iMaxHeigth: Integer);
   procedure CMFocusChanged(var Message: TCMFocusChanged); message CM_FOCUSCHANGED;
    { Public declarations }
  end;

var
  fPessoasAfrica: TfPessoasAfrica;
  loginAntigo: string;
  bComImagem : Boolean;

implementation

Uses uDM, General, Main, uUsuario, Math, uCadEmpresas,
  uPessoas_adicional, uSelCep, uChecarUsoColigada, uPessoa, uItemCombo, uGeneral,
  MaskUtils;

{$R *.DFM}

procedure TfPessoasAfrica.tblPessoads_sexoGetText(Sender: TField;
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

procedure TfPessoasAfrica.tblPessoads_sexoSetText(Sender: TField;
  const Text: String);
{ Gravar como M e F }
begin

   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else

      if Text = 'Feminino'
      Then Sender.AsString := 'F';

end; { tblPessoads_sexoSetText }

procedure TfPessoasAfrica.FormShow(Sender: TObject);
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

  tblPaisAtual.Close();
  tblPaisAtual.Open();


  tblOrgaos.Close();
  tblOrgaos.Open();

  if DM.variavel_parametro('pessoa_buscar_ultimo') = 'S' Then
  Begin
     { Selecionar as pessoas alteradas nos últimos 2 dias }
     tblPessoa.Close;
     tblPessoa.SQL.Text := 'Select * from pessoas where dt_revisao = :data';
     tblPessoa.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
     tblPessoa.Open;
     tblContatoPessoa.Open;
  End;

  AbaSelecionada := afpPessoa;
  frParentes1.Buscar.Visible := False;

  { inicia permissao como sendo form cadastro }
  iPermissao := 1001;

end;

procedure TfPessoasAfrica.frParentes1btAlterar_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
  frParentes1.btAlterar_PessoaClick(Sender);
end;

procedure TfPessoasAfrica.frParentes1btExcluir_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True ) then Exit;
   frParentes1.btExcluir_PessoaClick(Sender);
end;

procedure TfPessoasAfrica.frParentes1btIncluir_PessoaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;
  frParentes1.btIncluir_PessoaClick(Sender);
end;

procedure TfPessoasAfrica.frParentes1BuscarClick(Sender: TObject);
begin
  frParentes1.BuscarClick(Sender);
end;

{ FormShow }

procedure TfPessoasAfrica.tblContatoPessoaNewRecord(DataSet: TDataSet);
{ Novo Contato da Pessoa }
begin

   tblContatoPessoacd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
   tblContatoPessoacd_contato.AsInteger := 1; // Telefone Residencial

end; { tblContatoPessoaNewRecord }


procedure TfPessoasAfrica.tblContatoPessoaBeforePost(DataSet: TDataSet);
const
   sqlVerificaDup = 'Select count(*) as Total '+
                    'From contatos_pessoas ' +
                    'Where cd_pessoa = :pessoa '+
                    'and cd_contato = :contato '+
                    'and ds_contato = :descContato ';
   sqlDeletaDup =   'Delete From contatos_pessoas ' +
                    'Where cd_pessoa = :pessoa '+
                    'and cd_contato = :contato '+
                    'and ds_contato <> :descContato ';
var
   guardaMascara,valorCampo :  String;
   qryVerificaDuplicado: TUMZQuery;
begin
   if ( tblContatoPessoacd_contato.AsInteger = 0 ) then
   begin
      tblContatoPessoacd_contato.AsInteger := 1;
   end;

   if ( medCampoContato.Visible ) then
   begin
      guardaMascara := medCampoContato.EditMask;
      medCampoContato.EditMask := '';
      valorCampo := medCampoContato.Text;

      DM.CriarConsulta(qryVerificaDuplicado);
      qryVerificaDuplicado.SQL.Add(sqlVerificaDup);
      qryVerificaDuplicado.ParamByName('pessoa').AsString := tblPessoacd_pessoa.AsString;
      qryVerificaDuplicado.ParamByName('contato').AsString := tblContatoPessoacd_contato.AsString;
      qryVerificaDuplicado.ParamByName('descContato').AsString := valorCampo;
      qryVerificaDuplicado.Open;

      if ( qryVerificaDuplicado.FieldByName('Total').AsInteger > 0 ) then
      begin
         Mensagem('As informações salvas ja existem no banco de dados, este registro sera apagado para evitar duplicidade.', 'Alteração da informação de contato', MB_OK + MB_DEFBUTTON2 + MB_ICONQUESTION);
         FreeAndNil(qryVerificaDuplicado);
         DM.CriarConsulta(qryVerificaDuplicado);
         qryVerificaDuplicado.SQL.Add(sqlDeletaDup);
         qryVerificaDuplicado.ParamByName('pessoa').AsString := tblPessoacd_pessoa.AsString;
         qryVerificaDuplicado.ParamByName('contato').AsString := tblContatoPessoacd_contato.AsString;
         qryVerificaDuplicado.ParamByName('descContato').AsString := valorCampo;
         qryVerificaDuplicado.ExecSQL;
         tblContatoPessoa.Cancel;
         tblContatoPessoa.Refresh;
      end;

      FreeAndNil(qryVerificaDuplicado);
      medCampoContato.EditMask := guardaMascara;
   end;
end;

procedure TfPessoasAfrica.tblContatoPessoaBeforeScroll(DataSet: TDataSet);
var
   valorCampo : String;
   guardaMascara :  String;
   dsContatoLocal : String;
begin
   guardaMascara := medCampoContato.EditMask;
   medCampoContato.EditMask := '';
   valorCampo := medCampoContato.Text;
   dsContatoLocal := tblContatoPessoads_contato.AsString;

   if( Pos( 'mail' , LowerCase ( tblContatoPessoadescContato.AsString )) = 0 ) then
   begin
      dsContatoLocal := ReplaceStr(dsContatoLocal, '_', ' ');
   end;

   if ( medCampoContato.Visible ) then
   begin
      if ( valorCampo <> dsContatoLocal ) AND
         ( dsContatoLocal <> '' ) then
      begin
         medCampoContato.EditMask := guardaMascara;
         if(Mensagem('Deseja alterar a informação de contato?', 'Alteração da informação de contato', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrNo) then
         begin
            if (tblContatoPessoa.State IN [dsInsert, dsEdit]) then
            begin
               tblContatoPessoa.Cancel;
            end else begin
               dsContatoPessoaDataChange(nil, nil);
            end;

            exit;
         end;
      end;

      if (tblContatoPessoa.State IN [dsInsert]) then
      begin
         if (Length(valorCampo) = 0) then
         begin
            tblContatoPessoa.BeforeScroll := nil;
            tblContatoPessoa.Cancel();
            tblContatoPessoa.BeforeScroll := tblContatoPessoaBeforeScroll;
         end else begin
            tblContatoPessoads_contato.AsString := valorCampo;
            tblContatoPessoa.Post();
         end;
      end else begin
         if tblContatoPessoads_contato.AsString <> valorCampo then
         begin
            tblContatoPessoa.Edit();
            tblContatoPessoads_contato.AsString := valorCampo;
            tblContatoPessoa.Post();
         end;
      end;
   end;
end;

procedure TfPessoasAfrica.tblContatoPessoaCalcFields(DataSet: TDataSet);
var
   caracteresMascara: string;
begin
   qryContatosTipos.Close;
   qryContatosTipos.ParamByName('contato').AsString := tblContatoPessoacd_contato.AsString;
   qryContatosTipos.Open;

   caracteresMascara := retiraMascaraTelefone(qryContatosTiposds_mascara.AsString);

   { Caso seja telefone, não esteja vazio, não tenha DDDD, e não esteja em inserção }
   { Adiciona um espaço para adicionar o DDD correto da pessoa }
   { ATENÇÃO: LER BLOCO DE COMENTÁRIO ABAIXO }

   { Foi adicionado a variável caracteresMascara para identificar os caracteres da mesma. }
   { Com os caracteres é realizado a contagem para inserir na validação abaixo }
   
   if ( Length( tblContatoPessoads_contato.AsString ) < Length(caracteresMascara) ) and
      ( Length( tblContatoPessoads_contato.AsString ) > 1 ) and
      ( tblPessoa.State <> dsInsert ) and
      (( Pos( 'fone', LowerCase( tblContatoPessoadescContato.AsString )) > 0) or
         ( Pos( 'celula', LowerCase( tblContatoPessoadescContato.AsString )) > 0 ) or
            ( Pos( 'fax', LowerCase( tblContatoPessoadescContato.AsString )) > 0 ))then
      tblContatoPessoads_contato.AsString := '__' + tblContatoPessoads_contato.AsString;

   tblContatoPessoads_contato_formatado.AsString := MaskDoFormatText( qryContatosTiposds_mascara.AsString, tblContatoPessoads_contato.AsString, ' ');
end;

procedure TfPessoasAfrica.tblContatoPessoads_observacaoChange(Sender: TField);
begin
   tblContatoPessoa.Post;
end;

{ tblContatoPessoaBeforePost }


procedure TfPessoasAfrica.btFechar_PessoaClick(Sender: TObject);
{ Fechar o Cadastro de Pessoas }
begin
   close();

end; { btFechar_PessoaClick }


procedure TfPessoasAfrica.FiltrarNacionalidade(const ds_nacionalidade: String;
  Combo: TUMComboBox);
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

procedure TfPessoasAfrica.FormClose(Sender: TObject; var Action: TCloseAction);
{ Fechar Cadastro de Pessoa }
begin
   filtro_cd_pessoa := -1;
    if ( tblcontatoPessoa.State in [dsInsert,dsEdit] ) then
    begin
       tblContatoPessoa.Post;
       tblContatoPessoa.Close;
    end;

    Dm.tblContatosTipos.Close;
    DM.tblEstados.Close;
    tblEstadosCivis.Close;
    
    tblPessoa.Close;
    Action := caFree;

    Application.HintPause := 500;

end; { FormClose }


procedure TfPessoasAfrica.dsContatoPessoaDataChange(Sender: TObject;
  Field: TField);
begin
   qryContatosTipos.Close;
   qryContatosTipos.ParamByName('contato').AsString := tblContatoPessoacd_contato.AsString;
   qryContatosTipos.Open;

   medCampoContato.EditMask := '';
   medCampoContato.Text := tblContatoPessoads_contato.AsString;
   medCampoContato.EditMask := qryContatosTiposds_mascara.AsString;
end;

procedure TfPessoasAfrica.dsContatoPessoaStateChange(Sender: TObject);
begin
   valorCampoContatoComMascara := Trim(tblContatoPessoads_contato.AsString);
   valorCampoContatoSemMascara := retiraMascara(Trim(tblContatoPessoads_contato.AsString));

   if tblContatoPessoa.State = dsInactive then
   begin
      medCampoContato.Visible := False;
   end;
end;

procedure TfPessoasAfrica.dsPessoaDataChange(Sender: TObject; Field: TField);
{ Mudança de registro }
var
  //BS:TStream;
  //Imagem:TJPEGImage;
  Stream: TStream;
  JPEGImg: TJPEGImage;
begin
   if not tblPessoa.Active then
      Exit;
  // Atualização do login e da senha
  if tblPessoa.State in [dsBrowse] then begin
    edLogin.Text := tblPessoa.FieldByName('ds_login').AsString;
    loginAntigo := edLogin.Text;

    edSenha1.Text := '*****';
    edSenha2.Text := '*****';
  end;

  { Atualização da Foto }

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
   end;

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

  { / Atualização da Foto }

end;  { dsPessoaDataChange }


procedure TfPessoasAfrica.gradeContatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  { Excluir Contato }
begin
  { Apagar o registro de contato quando pressionar DEL }
   if Key = VK_DELETE Then
   begin
      if Mensagem('Excluir o Contato selecionado?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes Then
      begin
         tblContatoPessoa.Delete;
      end;
   end;
end;

procedure TfPessoasAfrica.gradeVinculosExternoKeyDown(Sender: TObject;
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

procedure TfPessoasAfrica.imageFotoDblClick(Sender: TObject);
var
  Imagem:TJPEGImage;
begin
      { Procurar a foto da pessoa }
   if (tblPessoacd_pessoa.AsInteger <> 0)  then
      tblPessoa.Edit;
   if (tblPessoa.State = dsInsert) or (tblPessoa.State = dsEdit)  then
   begin
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
   end;
end;

procedure TfPessoasAfrica.medCampoContatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   valorCampo : String;
begin
   if Key = VK_ESCAPE then
   begin
      if Length(retiraMascara(medCampoContato.Text)) > 0 then
      begin
         medCampoContato.Text := tblContatoPessoads_contato_formatado.AsString;
      end
      else if (tblContatoPessoa.State IN [dsInsert]) then
      begin
         tblContatoPessoa.Cancel();
      end;
   end
   else if Key = VK_UP then
   begin
      tblContatoPessoa.Prior();
   end
   else if Key = VK_DOWN then
   begin
      valorCampo := retiraMascara(medCampoContato.Text);

      if (tblContatoPessoa.State IN [dsInsert]) AND (Length(valorCampo) = 0) then
      begin
         tblContatoPessoa.Cancel();
      end else begin
         if (tblContatoPessoa.RecNo = tblContatoPessoa.RecordCount) AND
            NOT(tblContatoPessoa.State IN [dsInsert]) then
         begin
            tblContatoPessoa.Append();
         end else begin
            if (tblContatoPessoa.RecordCount = 0) OR
               (tblContatoPessoa.State IN [dsInsert]) then
            begin
               tblContatoPessoads_contato.AsString := valorCampo;
               tblContatoPessoa.Post();
            end;

            tblContatoPessoa.Next();            
         end;
      end;
   end;
end;

{ gradeContatoKeyDown }


procedure TfPessoasAfrica.dsPessoaStateChange(Sender: TObject);
{ Mudança de Estado - Inclusão - Alteração }
Var
   EstaEditando : Boolean;
begin
   if ( tblPessoa.State in [dsEdit] ) AND
      TChecarUsoColigada.Create( TPessoa.Create( tblPessoacd_pessoa.AsInteger ) ).NaoPossuiPermissao(True, DM.UsuarioLogado.TemPermissao( iPermissao, npEspecial, False )) then
   begin
      tblPessoa.Cancel;
      Exit;
   end;


   if tblPessoa.State = dsInsert Then
	 if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	    tblPessoa.Cancel;
	    Exit;
	 End;

   if tblPessoa.State = dsEdit Then
	 if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
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

   { Verificar contatos para cadastrar }

end; procedure TfPessoasAfrica.dsVinculoExternoStateChange(Sender: TObject);
begin
   if NOT(tblPessoa.State IN [dsInsert, dsEdit]) AND (qyVinculosExterno.State IN [dsInsert, dsEdit]) then
   begin
      tblPessoa.Edit();
   end;
end;

{ dsPessoaStateChange }

procedure TfPessoasAfrica.tblPessoaAfterCancel(DataSet: TDataSet);
begin
    FiltrarNacionalidade('', cbNacionalidade);
end;

procedure TfPessoasAfrica.tblPessoaAfterInsert(DataSet: TDataSet);
{ Após inserir uma pessoa }
begin

   { Colocar Valores Padrões - Futuramente, pegar em Tabela de Parametros }
   tblPessoads_nacionalidade.AsString := '';
   tblPessoads_pais.AsString := 'BRASIL';
   tblPessoads_pais_nascimento.AsString := 'BRASIL';

   tblPessoadt_cadastro.AsString := DateToStr(DataHoje);

end; { tblPessoaAfterInsert }


procedure TfPessoasAfrica.tblPessoaNewRecord(DataSet: TDataSet);
{ Nova pessoa }
var
  NUITZerado: Boolean;
begin
  tblPessoacd_pessoa.AsInteger := DM.NovoCodigoPessoa( 'Local.CadastroPessoa' );

  { Observações Padrões }

  tblPessoads_observacao.AsString := DM.variavel_parametro('pessoa_observacao_padrao');

  tblPessoacd_logradouro.AsInteger := 81; // RUA

   // Verifica o parâmetro para preencher o número de contribuinte zerado

   NUITZerado :=
         AnsiUpperCase(DM.variavel_parametro('PESSOA_NUIT_ZERADO')) = 'S';
   if NUITZerado then
      tblPessoads_cpf.AsString := '00000000000';

end; { tblPessoaNewRecord }


procedure TfPessoasAfrica.tblPessoaBeforeDelete(DataSet: TDataSet);
begin
  tblPessoads_nacionalidade.AsString := cbNacionalidade.Items[cbNacionalidade.ItemIndex];

  DM.setLog(1001, 'Exclusao', tblPessoacd_pessoa.AsString, DM.UsuarioLogado.ColigadaLogada);
end;

procedure TfPessoasAfrica.tblPessoaBeforePost(DataSet: TDataSet);
{ Antes de Confirmar }
const
   SInfoSemNUIT = 'O preenchimento do número do contribuinte é obrigatório.';
   SInfoNUITDuplicado =
      'Existe outra pessoa cadastrada com o número de contribuinte informado.';
   SCaption = 'Atenção';
var
   bLoginOk: Boolean;
begin

   if not NUITValido then
   begin
      MessageBox(Handle, PChar(SInfoSemNUIT), PChar(SCaption),
            MB_ICONWARNING + MB_OK);
      Abort;
   end;

   if not ((AnsiUpperCase(DM.variavel_parametro('PESSOA_NUIT_ZERADO')) = 'S')
         and (tblPessoads_cpf.AsString = '00000000000')) then
   begin
      if( AnsiUpperCase(DM.variavel_parametro('permite_cpf_zerado')) <> 'S' ) then
      begin

        if NUITDuplicado then
        begin
           MessageBox(Handle, PChar(SInfoNUITDuplicado), PChar(SCaption),
                 MB_ICONWARNING + MB_OK);
           Abort;
        end;
      end
      else if tblPessoads_cpf.AsString <> '00000000000' then
      begin
        if NUITDuplicado then
        begin
           MessageBox(Handle, PChar(SInfoNUITDuplicado), PChar(SCaption),
                 MB_ICONWARNING + MB_OK);
           Abort;
        end;

      end;
   end;

  if tblPessoacd_municipio.AsInteger <> 0 then
     tblPessoads_cidade_nascimento.AsString := tblMunicipiosds_municipio.AsString;

  { Gravar nome sem acento para BUSCA }
  tblPessoanm_sem_acento.AsString := SemAcento( tblPessoanm_pessoa.AsString );

  { Data de Revisão = Data de Hoje }
  tblPessoadt_revisao.AsString := DateToStr(DataHoje);

  { Registrar Funcionário que alterou o cadastro }
   tblPessoacd_usuario.AsInteger := DM.iCdPessoaLogado;

//   tblPessoanr_praca.AsInteger := tblMunicipioAtualnr_praca.AsInteger;

   Self.alteraLogin(edLogin, edSenha1, edSenha2, loginAntigo, tblPessoa);

   {*if (edLogin.Text <> loginAntigo) then begin
       with qyTemp2 do begin
          Close();
          SQL.Text := 'SELECT COUNT(*) as conta FROM pessoas WHERE ds_login = :ds_login ';
          ParamByName('ds_login').AsString := edLogin.Text;
          Open();
          if not IsEmpty() then begin
            bLoginOk := FieldByName('conta').AsInteger = 0;
          end;
          Close();
       end;

       if not (bLoginOk) then begin
         Mensagem('Login já existente!!!');
         Abort();
         Exit;
       end;

      with qyTemp2 do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_login = :ds_login WHERE cd_pessoa = :cd_pessoa';
        ParamByName('ds_login').AsString := edLogin.Text;
        ParamByName('cd_pessoa').AsInteger := tblPessoa.FieldByName('cd_pessoa').AsInteger;
        ExecSQL();
      end;
   end;

   // Definir senha inicial
   if (tblPessoads_senha.AsString = '') AND (edSenha1.Text = '*****') then begin

      edSenha1.Text := FormatDateTime('ddmmyy', tblPessoadt_nascimento.AsDateTime );
      edSenha2.Text := edSenha1.Text;

      tblPessoasn_senha_provisoria.AsString := 'S';

   end;

   if (edSenha1.Text <> '*****') then begin
    if (edSenha1.Text = edSenha2.Text) then begin
      with qyTemp2 do begin
        Close();
        SQL.Text := 'UPDATE pessoas SET ds_senha = md5(:ds_senha) WHERE cd_pessoa = :cd_pessoa';
        ParamByName('ds_senha').AsString := edSenha1.Text;
        ParamByName('cd_pessoa').AsInteger := tblPessoa.FieldByName('cd_pessoa').AsInteger;
        ExecSQL();
      end;
    end
    else begin
      Mensagem('Você deve digitar duas vezes a mesma senha !', Application.Title, MB_ICONWARNING+MB_OK, -1);
      edSenha1.setFocus();
    end;
   end;  *}

end;


{**
   Altera informações de login de uma pessoa, recebe os campos em que serão digitadas as senhas
   e logins.
*}
procedure TfPessoasAfrica.alteraLogin(edLogin, edSenha, edRedgSenha: TEdit; sLoginAntigo: string; qyPaiResp: TUMZQuery);
var
   bLoginOk:Boolean;
begin
   bLoginOk := false;
   
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
        SQL.Text := 'UPDATE pessoas SET ds_senha = MD5(:ds_senha) WHERE cd_pessoa = :cd_pessoa';
        ParamByName('ds_senha').AsString := edSenha.Text;
        ParamByName('cd_pessoa').AsInteger := qyPaiResp.FieldByName('cd_pessoa').AsInteger;
        ExecSQL();
      end;
    end
    else begin
      Mensagem('Você deve digitar duas vezes a mesma senha !', Application.Title, MB_ICONWARNING+MB_OK, -1);
      edSenha.setFocus();
    end;
   end;

   

end;

procedure TfPessoasAfrica.tblPessoacd_paisChange(Sender: TField);
begin
   if tblPessoa.State in [dsinsert, dsedit] then begin

      tblPessoads_pais.AsString := tblPaisAtual.FieldByName('ds_pais').AsString;
      tblPessoads_nacionalidade.AsString := tblPaisAtual.FieldByName('ds_nacionalidade').AsString;

   end;

end;

procedure TfPessoasAfrica.tblPessoacd_pais_nascimentoChange(Sender: TField);
begin
   if tblPessoa.State in [dsinsert, dsedit] then begin

      tblPessoads_nacionalidade.AsString := tblPaises.FieldByName('ds_nacionalidade').AsString;

   end;

end;

{ tblPessoaBeforePost }


procedure TfPessoasAfrica.btIncluir_PessoaClick(Sender: TObject);
{ Inserir uma nova Pessoa }
begin

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Exit;

     if not tblPessoa.Active then
     Begin
        { Selecionar as pessoas alteradas nos últimos 2 dias }
        tblPessoa.Close;
        tblPessoa.SQL.Text := 'Select * from pessoas where cd_pessoa = 9999999';
        tblPessoa.Open;
        tblContatoPessoa.Open;
     End;

   pgPessoa.ActivePageIndex := 0;
   
   dbNome.SetFocus;
   cbNacionalidade.ItemIndex := -1;
   tblPessoa.Insert;
   dbNome.SetFocus;

   imageFoto.Visible := True;
   ciFoto.Picture.Assign(nil);
   tblPessoasn_foto.AsString := 'N';
   imageFoto.Picture.Bitmap.Assign(nil);

   tblContatoPessoa.Close;
   tblContatoPessoa.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
   tblContatoPessoa.Open;
end;

procedure TfPessoasAfrica.btnAplicarClick(Sender: TObject);
Var
   BS: TStream;
   JPEGimg : TJPEGImage;
begin
   if tblContatoPessoa.State in [dsInsert, dsEdit] then begin
     tblContatoPessoa.Post();
   end;

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
end;

procedure TfPessoasAfrica.btnCancelarClick(Sender: TObject);
var
  BS: TStream;
  Imagem:TJPEGImage;
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

procedure TfPessoasAfrica.btnCapturarClick(Sender: TObject);
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

procedure TfPessoasAfrica.btnConectarClick(Sender: TObject);
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

{ btIncluir_PessoaClick }


procedure TfPessoasAfrica.btAlterar_PessoaClick(Sender: TObject);
{ Altear a Pessoa Atual }
begin

   if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Exit;
      tblPessoa.Edit;
      
end; { btAlterar_PessoaClick }


procedure TfPessoasAfrica.btExcluir_PessoaClick(Sender: TObject);
{ Excluir a Pessoa Atual }
begin
   if not(DM.UsuarioLogado.TemPermissao( iPermissao, npExcluir, True )) OR
      TChecarUsoColigada.Create( TPessoa.Create( tblPessoacd_pessoa.AsInteger ) ).NaoPossuiPermissao(True, DM.UsuarioLogado.TemPermissao( iPermissao, npEspecial, False )) then
   begin
      Exit;
   end;

   if Mensagem('Tem certeza que deseja excluir a pessoa selecionada?','Confirmação', MB_YESNO + MB_ICONQUESTION) = mrYes
   Then

      if Tem_matricula(tblPessoacd_pessoa.AsInteger) then
      begin
         Mensagem('Não é possível excluir o cadastro.'+CHR(13)+'A pessoa possui matrículas e/ou mensalidades.',  'Atenção', MB_OK + MB_ICONWARNING);
      end
      else
      begin
         qryDeleteContato.ParamByName('cd_pessoa').AsString := tblPessoacd_pessoa.AsString;
         tblPessoa.Edit;
         tblPessoa.Delete;
         qryDeleteContato.ExecSQL;
         tblContatoPessoa.Refresh;
      end;

end; { btExcluir_PessoaClick }

procedure TfPessoasAfrica.btSalvar_PessoaClick(Sender: TObject);
{ Salvar as Alterações no cadastro }
begin
  {
      Se o campo de nacionalidade estiver Focado, nós tiramos o foco dele,
      forçando para que o Foco vá para o campo Nome. Neste momento, existe uma programação
      no evento OnExit do cbNacionalidade, que válida o que o usuário digitou.

      Caso, o valor que o usuário tenha digitado esteja incorreto, o foco irá RETORNAR
      para o campo cbNacionalidade.
   }
   if (cbNacionalidade.Focused) and (cbNacionalidade.ItemIndex = -1) then
   begin
      TGeneral.FocarProximoCampo(Handle);

      {
         Ou seja, se verificamos novamente o foco do campo cbNacionalidade,
         e ele realmente estiver focado, significa que ouve erro de nacionalidade,
         então, abortamos a ação de salvar.
      }
      if cbNacionalidade.Focused then
         Exit;
   end;
   
   if (pgPessoa.ActivePage = tsDadosPessoais) then
   begin
      DBEdit2.SetFocus;
      dbNome.SetFocus;
   end;

   if (pgPessoa.ActivePage = tsComplementares) then
   begin
      DBEdit1;
      DBEdit13.SetFocus;
   end;

   if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
      exit;

   if tblContatoPessoa.State in [dsInsert, dsEdit] then begin
      tblContatoPessoa.Post();
   end;
      tblPessoa.FieldByName('nm_pessoa').Value := trim(  dbNome.Text );

   // Atribuindo a nova nacionalidade a pessoa
   tblPessoads_nacionalidade.AsString := cbNacionalidade.Items[cbNacionalidade.ItemIndex];
   tblPessoa.Post();


   btnConectar.Enabled := true;
   btnCancelar.Enabled := false;

end;

procedure TfPessoasAfrica.CarregarComboNacionalidades(Sender: TUMComboBox;
  procedimentoOnChange: TProcedureOnChange);
begin
 Sender.Clear;
   tblPaises.First;

   while not tblPaises.Eof do
   begin
      if ( Length(Trim(tblPaises.FieldByName('ds_nacionalidade').AsString)) > 0 ) then
      begin
         Sender.AddItem( tblPaises.FieldByName('ds_nacionalidade').AsString,
            TItemCombo.Create(
               tblPaises.FieldByName('cd_pais').AsString,
               tblPaises.FieldByName('ds_nacionalidade').AsString
            ) );
      end;

      tblPaises.Next;
   end;

   { Ativa a funcionalidade de OnChange da Combo, SOMENTE, após a combo estar carregada }
   Sender.OnChange := procedimentoOnChange;
end;

procedure TfPessoasAfrica.CarregarPaises;
begin
   tblPaises.Close();
   tblPaises.Open();
   CarregarComboNacionalidades(cbNacionalidade, cbNacionalidadeChange);
end;

procedure TfPessoasAfrica.cbNacionalidadeChange(Sender: TObject);
var
   Key: Word;
   selectedIndex : Integer;
begin
   Key := 0;
   selectedIndex := cbNacionalidade.ItemIndex;

   cbNacionalidadeKeyDown(nil, Key, [ssShift]);

   if ( tblPessoa.State in [dsEdit] ) AND
      ( cbNacionalidade.Items.Objects[cbNacionalidade.Items.Count-1] = nil ) then
   begin
      cbNacionalidade.Items.Delete(cbNacionalidade.Items.Count-1);
      cbNacionalidade.ItemIndex := selectedIndex;
   end;

end;

procedure TfPessoasAfrica.cbNacionalidadeExit(Sender: TObject);
begin
   if (tblPessoa.State IN [dsInsert, dsEdit]) AND (cbNacionalidade.ItemIndex = -1) then
   begin
      Mensagem('Selecione uma Nacionalidade Válida');
      cbNacionalidade.SetFocus;
   end;
end;

procedure TfPessoasAfrica.cbNacionalidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   selectedIndex : Integer;
begin
   if Key = VK_F5 then
      Exit;

   selectedIndex := cbNacionalidade.ItemIndex;

   if (tblPessoa.State in [dsInactive]) then
   begin
      btIncluir_PessoaClick(Sender);
   end else if ( tblPessoa.State in [dsBrowse] ) then
   begin
      tblPessoa.Edit();

      if Sender <> nil then
         cbNacionalidade.ItemIndex := selectedIndex;
   end;

end;

procedure TfPessoasAfrica.btCancelar_PessoaClick(Sender: TObject);
{ Cancelar as Alterações do cadastro}
var
   nacionalidadeAtualCont : Integer;
   existeNacionalidade : Boolean;
begin

   {Checa o status da tabela de pessoa para retornar a nacionalidade que esta gravada, na hora de ação do cancelamento}
   existeNacionalidade := false;
   if (tblPessoa.State in [dsEdit]) then
   begin
      for nacionalidadeAtualCont := 0 to cbNacionalidade.Items.Count - 1 do
      begin
         if cbNacionalidade.items[nacionalidadeAtualCont] = tblPessoads_nacionalidade.AsString  then
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
   cbNacionalidade.ItemIndex := nacionalidadeAtualCont;
end;

procedure TfPessoasAfrica.btBuscar_PessoaClick(Sender: TObject);
var
   codigo,codigoPessoa: Integer;
{ Abrir Janela de BUSCA de PESSOAS }
begin
   codigo := tblPessoacd_pessoa.AsInteger;

   if filtro_cd_pessoa > 0 then begin
      codigoPessoa := filtro_cd_pessoa;
   end else begin
      resultado_filtro := TfrmSelecionarPessoa.Filtrar([], AbaSelecionada);
      codigoPessoa := resultado_filtro.cd_pessoa;
   end;

   if ( ( filtro_cd_pessoa <> -1 ) OR ( resultado_filtro.filtrado ) ) and (codigoPessoa <> codigo) then
   Begin
      tblPessoa.CLose;
      tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + IntToStr(codigoPessoa);
      tblPessoa.Open;
      tblContatoPessoa.Close;
      tblContatoPessoa.ParamByName('cd_pessoa').AsInteger := codigoPessoa;
      tblContatoPessoa.Open;
      btnAplicar.Visible := True;
      btnCancelar.Visible := True;
      btnConectar.Visible := True;
      imageFoto.Visible := true;
   end;

   FiltrarNacionalidade(tblPessoads_nacionalidade.AsString, cbNacionalidade);
   nacionalidadeAtual := cbNacionalidade.ItemIndex;
end;  { btBuscar_PessoaClick }


procedure TfPessoasAfrica.tblPessoaAfterPost(DataSet: TDataSet);
{ Depois de Confirmar }
Var
   codigoAtual : Integer;
begin

   if tblPessoa.State in [dsInsert] then
      DM.setLog(iPermissao, 'Inclusao', tblPessoacd_pessoa.AsString, DM.UsuarioLogado.ColigadaLogada)
   else
      DM.setLog(iPermissao, 'Alteracao', tblPessoacd_pessoa.AsString, DM.UsuarioLogado.ColigadaLogada);


   codigoAtual := tblPessoacd_pessoa.AsInteger;
   tblPessoa.CLose;
   tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + IntToStr(codigoAtual);
   tblPessoa.Open;

   qyTemp1.Close();
   qyTemp1.SQL.Text := 'UPDATE pessoas p INNER JOIN municipios m ' +
                       ' ON (p.ds_cidade = m.ds_municipio AND p.ds_estado = m.uf) ' +
                       ' SET p.nr_praca = m.nr_praca  ' +
                       ' WHERE p.cd_pessoa = ' + IntToStr(codigoAtual);
   qyTemp1.ExecSQL();

end; { tblPessoaAfterPost }


procedure TfPessoasAfrica.dbNomeKeyPress(Sender: TObject; var Key: Char);
{ Avançar com ENTER }
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end; procedure TfPessoasAfrica.DBText2DblClick(Sender: TObject);
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

procedure TfPessoasAfrica.DelphiTwain1AcquireCancel(Sender: TObject;
  const Index: Integer);
begin
   if DM.GetUnimestreINI.ReadString('Digitalizacao', 'ForcarFechamento', 'N') = 'S' then begin
      DelphiTwain1.Source[Origem].Enabled := False;
      DelphiTwain1.Source[Origem].Loaded := False;
   end;
end;

procedure TfPessoasAfrica.DelphiTwain1AcquireError(Sender: TObject;
  const Index: Integer; ErrorCode, Additional: Integer);
begin
   Mensagem('Ocorreu um erro na transferência!!' + IntTostr(errorCode) + ' (' + IntToStr(Additional) + ')');
   if (Imagem <> nil) then begin
      FreeAndNil(Imagem);
   end;
end;

procedure TfPessoasAfrica.DelphiTwain1TwainAcquire(Sender: TObject;
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

{ dbNomeKeyPress }


procedure TfPessoasAfrica.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
{ Teclas de Atalho }
begin

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

end; { FormKeyDown }

procedure TfPessoasAfrica.gradeContatoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   medCampoContato.Visible := false;
   if ( gdSelected IN State ) and
      ( Column.FieldName = 'ds_contato_formatado' )  then
   begin
      medCampoContato.Top := Rect.Top + gradeContato.Top;
      medCampoContato.Left := gradeContato.Left + Rect.Left;
      medCampoContato.Width := Rect.Right - Rect.Left - 2;
      medCampoContato.Height := Rect.Bottom - Rect.Top - 2;
      medCampoContato.Visible := true;
      medCampoContato.SetFocus();
   end;
end;

procedure TfPessoasAfrica.gradeContatoEnter(Sender: TObject);
begin
   if ( tblContatoPessoa.State <> dsInsert ) then
   begin
      tblPessoa.Edit;
   end;
end;

procedure TfPessoasAfrica.gradeContatoExit(Sender: TObject);
begin
   if tblContatoPessoa.State in [dsEdit, dsInsert] then
   Begin
       try
          tblContatoPessoa.Post;
       except
          tblContatoPessoa.Cancel;
       end;
   End;
   
   tblContatoPessoa.Close;
   tblContatoPessoa.Open;

end;

procedure TfPessoasAfrica.SpeedButton1Click(Sender: TObject);
begin
  if not DM.UsuarioLogado.TemPermissao( 1004, npAcesso, True ) then Exit;

  Application.CreateForm(Tfrm_Empresas, frm_Empresas);
end;

function TfPessoasAfrica.Tem_matricula(codigo: integer): boolean;
begin

   result := false;

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select codigoaluno from matriculas where codigoaluno = :codigo');
   qyTemp1.ParamByName('codigo').AsInteger := codigo;
   qyTemp1.Open;
   if not qyTemp1.eof then
     result := true;

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select codigoaluno from mensalidades where codigoaluno = :codigo');
   qyTemp1.ParamByName('codigo').AsInteger := codigo;
   qyTemp1.Open;
   if not qyTemp1.eof then
     result := true;
end;

function TfPessoasAfrica.retiraMascara(strComMascara: String): String;
begin
   if (tblContatoPessoacd_contato.AsInteger = 4) then
   begin
      strComMascara := LowerCase(Trim(strComMascara));
      if (strComMascara <> '') then
      begin
         if validaEmail(strComMascara) then
         begin
            if ( DM.variavel_parametro('permite_email_duplicado') = 'N' ) then
            begin
               if ClassePessoas.HasEmailDuplicado(tblContatoPessoacd_pessoa.AsInteger, strComMascara) then
               begin
                  strComMascara := '';
                  Mensagem('O e-mail "' + strComMascara + '" já está vinculado a uma pessoa.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
                  validacaoCampo := False;
               end;
            end
         end else begin
            strComMascara := '';
            Mensagem('O E-mail informado é inválido', Application.Title, MB_OK + MB_ICONSTOP );
            validacaoCampo := False;
         end;
      end;
   end else begin
      strComMascara := retiraMascaraTelefone(strComMascara);
      validacaoCampo := True;
   end;

   result := Trim(strComMascara);
end;

function TfPessoasAfrica.retiraMascaraTelefone(strComMascara: String): String;
begin
   strComMascara  := stringReplace(strComMascara, '(', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, ')', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, '_', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, '-', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, ' ', '', [rfReplaceAll]);

   result := Trim(strComMascara);
end;

procedure TfPessoasAfrica.btnDigitalizarClick(Sender: TObject);
var
  SourceIndex: smallint;
begin
   if tblPessoacd_pessoa.AsString = '' then
      exit;
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
     //origem := 0;
    // sbDigitalizar.Enabled := true;
   except
     Origem := -1;
   end;


   if DelphiTwain1.SourceCount > 0 then
   begin
      SourceIndex := DelphiTwain1.SelectSource();
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

   btnConectar.Visible := False;
   btnCapturar.Visible := False;
   btnAplicar.Enabled := True;
   btnCancelar.Enabled := True;
   btnDigitalizar.Visible := False;
end;

procedure TfPessoasAfrica.VerificaBibliotecaTwain;
begin
   if not DelphiTwain1.LibraryLoaded then begin
      DelphiTwain1.LoadLibrary();
   end;
end;

procedure TfPessoasAfrica.dbNomeExit(Sender: TObject);
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
          tblContatoPessoa.Open;

          Exit;
      End;


      qyTemp1.Next;
   End;

end; 

procedure TfPessoasAfrica.sbMaisInformacoesClick(Sender: TObject);
begin
  { Apresentar a tela de campos adicionais }
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('P', tblPessoacd_pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING);

  FreeAndNil(frm_pessoas_adicional);

end;

procedure TfPessoasAfrica.sbPaisComboExit(Sender: TObject);
var
   qryAchaNacionalidade: TUMzQuery;
   I: integer;
begin
   if ((tblPessoa.State in [DsInsert])
      and (cbNacionalidade.ItemIndex = -1)
      and (tblPessoadescPais.AsString <> '')) then
   begin

      DM.CriarConsulta(qryAchaNacionalidade);

      qryAchaNacionalidade.SQL.Text := 'select ds_nacionalidade from paises where ds_pais = :nm_pais';
      qryAchaNacionalidade.ParamByName('nm_pais').AsString := tblPessoadescPais.AsString;
      qryAchaNacionalidade.Open;

      for I := 0 to cbNacionalidade.Items.Count - 1 do
      begin
         if cbNacionalidade.Items[i] = qryAchaNacionalidade.FieldByName('ds_nacionalidade').AsString then
            break;
      end;
      cbNacionalidade.ItemIndex := i;
   end;
end;

procedure TfPessoasAfrica.sbCepClick(Sender: TObject);
begin

  if (tblPessoa.State <> dsInsert) and (tblPessoa.State <> dsEdit) then
    Abort;

  Application.CreateForm(TfrmSelCep, frmSelCep);

  frmSelCep.ShowModal;

  if frmSelCep.flgSearch then
  begin
    tblPessoa.FieldByName('ds_cep').AsString := frmSelCep.qyCep.FieldByName('ds_cep').AsString;
    tblPessoa.FieldByName('ds_cidade').AsString := frmSelCep.qyCep.FieldByName('nm_cidade').AsString;
    tblPessoa.FieldByName('ds_estado').AsString := frmSelCep.qyCep.FieldByName('ds_uf').AsString;
    tblPessoa.FieldByName('ds_bairro').AsString := frmSelCep.qyCep.FieldByName('nm_bairro').AsString;
    tblPessoa.FieldByName('ds_logradouro').AsString := frmSelCep.qyCep.FieldByName('nm_logradouro').AsString;
  end;

  FreeAndNil(frmSelCep);

end;

procedure TfPessoasAfrica.AdicionarContato1Click(Sender: TObject);
begin
    gradeContato.SetFocus();
    tblContatoPessoa.Insert();
end;

procedure TfPessoasAfrica.ExcluirContato1Click(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir o contato ' + tblContatoPEssoadescContato.AsString +' ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION)
   = mrYes then
   Begin
       tblContatoPessoa.Delete();
   End;
end;

procedure TfPessoasAfrica.MenuItem1Click(Sender: TObject);
begin
// imageFotoDblClick(nil);
end;

procedure TfPessoasAfrica.MenuItem2Click(Sender: TObject);
begin
   { Procurar a foto da pessoa }

   { Coloca a tabela em modo de edição }
   tblPessoa.Edit;
   tblPessoaim_pessoa.AsString := '';
// imageFoto.Visible := False;
// lbFoto.Visible := True;
   tblPessoa.Post;

End;

procedure TfPessoasAfrica.miExcluirClick(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
   begin
      if tblPessoa.State <> dsEdit then tblPessoa.Edit;
      tblPessoaim_pessoa.Clear;
      imageFoto.Picture.Assign(nil);
   end;
end;

function TfPessoasAfrica.NUITDuplicado: Boolean;
begin
   Result := False;
   if tblPessoads_cpf.AsString <> EmptyStr then
   begin
      qryProcuraNUIT.Close;
      qryProcuraNUIT.ParamByName('DS_CPF').AsString := tblPessoads_cpf.AsString;
      qryProcuraNUIT.ParamByName('CD_PESSOA').AsInteger := tblPessoacd_pessoa.AsInteger;
      qryProcuraNUIT.Open;
      Result := not qryProcuraNUIT.IsEmpty;
      qryProcuraNUIT.Close;
   end;
end;

function TfPessoasAfrica.NUITValido: Boolean;
begin
   Result := (tblPessoads_cpf.AsString <> EmptyStr) or
      (AnsiUpperCase(DM.variavel_parametro('PESSOA_NUIT_OBRIGATORIO')) <> 'S');
end;

procedure TfPessoasAfrica.pgPessoaChange(Sender: TObject);
var
   enable : Boolean;
begin
   toolPessoa.Visible := not (pgPessoa.ActivePage = tsParentes);
   if (pgPessoa.ActivePage = tsParentes) then begin
      frParentes1.TrocaPessoa(tblPessoacd_pessoa.AsInteger);
   end;
   if (pgPessoa.ActivePage = tsComplementares) then
   begin
      enable := PodeAlterarSenha or (tblPessoacd_pessoa.AsInteger = DM.iCdPessoaLogado);
      edLogin.Enabled := enable;
      edSenha1.Enabled := enable;
      edSenha2.Enabled := enable;     
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
         edLogin.Enabled   := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false );
         edSenha1.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false );
         edSenha2.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false );
      end;   
   end;
end;

function TfPessoasAfrica.PodeAlterarSenha():Boolean;
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

procedure TfPessoasAfrica.qyVinculosExternoAfterOpen(DataSet: TDataSet);
begin
   lbVinculoExterno.Visible := NOT(qyVinculosExterno.IsEmpty);
   gradeVinculosExterno.Visible := lbVinculoExterno.Visible;
end;

procedure TfPessoasAfrica.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if pgPessoa.ActivePage = tsParentes then begin
      if (tblPessoa.IsEmpty()) then begin
         tblPessoa.CLose;
         tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + IntToStr(resultado_filtro.cd_pessoa);
         tblPessoa.Open;
         tblContatoPessoa.Open;
      end;
   end;
end;

procedure TfPessoasAfrica.ResizeFoto(var oJPG: TJPEGImage; iMaxWidth,
  iMaxHeigth: Integer);
var
  oBmp: TBitmap;
  iW, iH: Integer;
  lP: Double;
begin

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

    FreeAndNil(oBmp);

  end
  else begin
      oBmp.Assign(oJPG);
      oJPG.Assign(oBmp);
      oJPG.CompressionQuality := 80;
      oJPG.Compress();
      FreeAndNil(oBmp);
  end;

end;

procedure TfPessoasAfrica.dbComplementoKeyPress(Sender: TObject; var Key: Char);
begin

  if key = #13 Then
  Begin
     pcDocumentos.ActivePageIndex := 0;
     dbCpf.SetFocus;
     Key := #0;
  End;

end;

procedure TfPessoasAfrica.edLoginKeyPress(Sender: TObject; var Key: Char);
begin
  tblPessoa.Edit();
end;

procedure TfPessoasAfrica.edSenha1KeyPress(Sender: TObject; var Key: Char);
begin
  tblPessoa.Edit();
end;

procedure TfPessoasAfrica.edSenha2KeyPress(Sender: TObject; var Key: Char);
begin
  tblPessoa.Edit();
end;

procedure TfPessoasAfrica.tblPessoatp_certGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    if Sender.AsInteger = 1 then
       Text := 'Nascimento'
    else if Sender.AsInteger = 2 then
       Text := 'Casamento'
    else
       Text := '';
end;

procedure TfPessoasAfrica.tblPessoatp_certSetText(Sender: TField;
  const Text: string);
begin
   if Text = 'Nascimento' then
      Sender.AsInteger := 1
   else if Text = 'Casamento' then
      Sender.AsInteger := 2
   else Sender.AsInteger := 0;
end;

procedure TfPessoasAfrica.FormCreate(Sender: TObject);
begin
   nacionalidadeAtual := -1;
//  DM.CriarConsulta(qyTemp1);
//  DM.CriarConsulta(qyTemp2);
   filtro_cd_pessoa := -1;

end;

procedure TfPessoasAfrica.FormDestroy(Sender: TObject);
begin

//  FreeAndNil(qyTemp1);
//  FreeAndNil(qyTemp2);

end;

procedure TfPessoasAfrica.tblPessoads_estado_nascimentoChange(Sender: TField);
begin
   tblMunicipios.Close();
   tblMunicipios.ParamByName('ds_estado_nascimento').ASString := tblPessoads_estado_nascimento.AsString;
   tblMunicipios.Open();
end;

procedure TfPessoasAfrica.tblPessoads_estadoChange(Sender: TField);
begin
   tblMunicipioAtual.Close();
   tblMunicipioAtual.ParamByName('ds_estado').ASString := tblPessoads_estado.AsString;
   tblMunicipioAtual.Open();

end;

procedure TfPessoasAfrica.CMFocusChanged(var Message: TCMFocusChanged);
begin
   inherited;

   if (Message.Sender is TDBGrid) AND
      (TDBGrid(Message.Sender).Name = gradeContato.Name) then
   begin                   
      medCampoContato.Visible := True;
   end else begin
      if NOT(Message.Sender is TMaskEdit) OR
         (TMaskEdit(Message.Sender).Name <> medCampoContato.Name) then
      begin
         medCampoContato.Visible := False;
      end;
   end;
end;

procedure TfPessoasAfrica.medCampoContatoEnter(Sender: TObject);
begin
   dsContatoPessoaDataChange(nil, nil);
end;

procedure TfPessoasAfrica.medCampoContatoExit(Sender: TObject);
begin
   tblContatoPessoaBeforeScroll(tblContatoPessoa);
end;

end.

