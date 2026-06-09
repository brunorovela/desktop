unit uUnidadesEnsino;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ZConnection, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Variants,
  Grids, DBGrids, ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, DBLookup, ToolWin, ImgList, Menus,
  OleCtrls, SHDocVw, Comobj, uListaConvenios, ZSqlUpdate, UMFiltroDataAnoSem, UMNavigator,
  UMLookupComboBox;

type
  TfrmUnidadesEnsino = class(TForm)
    tblEstados: TUMZQuery;
    Bevel9: TBevel;
    pcGeral: TPageControl;
    tsColigadas: TTabSheet;
    tsDeptos: TTabSheet;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton8: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    tblDeptos: TUMZQuery;
    tblDeptosCodigo: TSmallintField;
    tblDeptossn_online: TStringField;
    tblDeptosonline: TStringField;
    tblDeptoscd_coligada: TSmallintField;
    tblDeptoscd_boleto_padrao: TIntegerField;
    tblDeptoscd_boleto_online: TIntegerField;
    tblDeptosdescConta: TStringField;
    tblDeptosdescCaixa: TStringField;
    tblDeptosds_cnpj: TStringField;
    dtcDeptos: TDataSource;
    ImageList1: TImageList;
    ImageList2: TImageList;
    pmQtdDeptos: TPopupMenu;
    qyCampus: TUMZQuery;
    qyCampuscd_campus: TIntegerField;
    qyCampusds_endereco: TStringField;
    qyCampusnr_numero: TIntegerField;
    qyCampusds_bairro: TStringField;
    qyCampusds_cidade: TStringField;
    qyCampusds_estado: TStringField;
    qyCampuscd_pessoa_coordenador: TIntegerField;
    qyCampusds_codigo: TStringField;
    srcCampus: TDataSource;
    qyConta: TUMZQuery;
    qyContads_caixa: TStringField;
    qyColigada: TUMZQuery;

    qyColigadacd_coligada: TSmallintField;
    qyColigadanm_coligada: TStringField;
    qyColigadaNM_RAZAO_SOCIAL: TStringField;
    qyColigadaDS_CNPJ: TStringField;
    qyColigadaNM_DIRETOR_GERAL: TStringField;
    qyColigadaNM_DIRETOR_FINAN: TStringField;
    qyColigadaNM_TESTEMUNHA1: TStringField;
    qyColigadaNM_TESTEMUNHA2: TStringField;
    qyColigadaDS_CPF_GERAL: TStringField;
    qyColigadaDS_CPF_FINAN: TStringField;
    qyColigadaDS_CPF_TEST1: TStringField;
    qyColigadaDS_CPF_TEST2: TStringField;
    qUnidadesCertificadoras: TUMZQuery;
    qUnidadesCertificadorasnm_instituicao: TStringField;
    qUnidadesCertificadorasds_endereco: TStringField;
    qUnidadesCertificadorasds_complemento: TStringField;
    qUnidadesCertificadorasds_bairro: TStringField;
    qUnidadesCertificadorasds_cidade: TStringField;
    qUnidadesCertificadorasds_estado: TStringField;
    qUnidadesCertificadorasds_cep: TStringField;
    qUnidadesCertificadorasds_diretor: TStringField;
    qUnidadesCertificadorasds_tipo: TStringField;
    qUnidadesCertificadorasds_telefone1: TStringField;
    qUnidadesCertificadorasds_telefone2: TStringField;
    qUnidadesCertificadorasds_email: TStringField;
    qUnidadesCertificadorasds_site: TStringField;
    qUnidadesCertificadorassn_educacao_infantil: TStringField;
    qUnidadesCertificadorassn_ensino_fundamental: TStringField;
    qUnidadesCertificadorassn_ensino_medio: TStringField;
    qUnidadesCertificadorassn_ensino_superior: TStringField;
    qUnidadesCertificadorassn_cursos_profissionalizantes: TStringField;
    qUnidadesCertificadorassn_ensino_especial: TStringField;
    qUnidadesCertificadorassn_unidade_certificadora: TSmallintField;
    dsUnidadesCertificadoras: TDataSource;
    dtcColigadas: TDataSource;
    pnUnidadeEnsino: TPanel;
    pnColigadas: TPanel;
    ScrollBox2: TScrollBox;
    Panel10: TPanel;
    grdColigadas: TDBGrid;
    pnDepartamentos: TPanel;
    Panel11: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label38: TLabel;
    Label4: TLabel;
    Label41: TLabel;
    sbLimparBoletoDepto: TSpeedButton;
    sbLimparCaixaDepto: TSpeedButton;
    Label46: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    dbeCodigoDepto: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    Panel7: TPanel;
    grdDeptos: TDBGrid;
    qyContacd_caixa: TIntegerField;
    Panel1: TPanel;
    Panel27: TPanel;
    lbColigada: TLabel;
    Label1: TLabel;
    qUnidadesCertificadorascd_instituicao: TIntegerField;
    qyColigadadescEstado: TStringField;
    qyColigadads_estado: TStringField;
    qyColigadads_cidade: TStringField;
    qyColigadacd_municipio: TLargeintField;
    qryMunicipio: TUMZQuery;
    qryMunicipiods_municipio: TStringField;
    qryMunicipiouf: TStringField;
    dsMunicipio: TDataSource;
    qryMunicipiocd_municipio: TLargeintField;
    qyColigadadescMunicipio: TStringField;
    qryPaises: TUMZQuery;
    qryMunicipiocd_pais: TIntegerField;
    qyColigadacd_pais: TIntegerField;
    Label2: TLabel;
    dblInstEnsino: TDBLookupComboBox;
    tblDeptosCD_INSTITUICAO: TIntegerField;
    tblDeptosdescInstituicao: TStringField;
    tblDeptosSN_ALTERAR_BOLETO: TSmallintField;
    DBCheckBox1: TDBCheckBox;
    qyColigadanm_diretor_acad: TStringField;
    qyColigadads_cpf_acad: TStringField;
    qyColigadacd_instituicao_mec: TIntegerField;
    qyColigadads_endereco: TStringField;
    qyColigadads_numero: TStringField;
    qyColigadads_complemento: TStringField;
    qyColigadads_bairro: TStringField;
    qyColigadads_cep: TStringField;
    qyColigadads_email_geral: TStringField;
    qyColigadads_latitude: TStringField;
    qyColigadads_longitude: TStringField;
    qyColigadads_nre: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    dblcMunicipio: TDBLookupComboBox;
    lblMunicipio: TLabel;
    dblcEstado: TDBLookupComboBox;
    lblEstado: TLabel;
    cmbPais: TComboBox;
    lblPais: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBEdit28: TDBEdit;
    Label72: TLabel;
    DBEdit27: TDBEdit;
    Label71: TLabel;
    Label70: TLabel;
    DBEdit26: TDBEdit;
    DBEdit25: TDBEdit;
    Label69: TLabel;
    qryPaisescd_pais: TLargeintField;
    qryPaisesds_pais: TStringField;
    Panel6: TPanel;
    Panel8: TPanel;
    DBEdit24: TDBEdit;
    Label68: TLabel;
    DBEdit22: TDBEdit;
    Label67: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label66: TLabel;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    Label75: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    Panel9: TPanel;
    DBEdit17: TDBEdit;
    Label62: TLabel;
    DBEdit18: TDBEdit;
    Label63: TLabel;
    DBEdit19: TDBEdit;
    Label64: TLabel;
    DBEdit20: TDBEdit;
    Label65: TLabel;
    dbedCdInstMec: TDBEdit;
    Label6: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    btMaisInformacoes: TButton;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit29: TDBEdit;
    Label18: TLabel;
    DBEdit30: TDBEdit;
    Label19: TLabel;
    DBEdit31: TDBEdit;
    Label20: TLabel;
    tblDeptosDESCRICAO: TStringField;
    tblDeptosRAZAOSOCIAL: TStringField;
    qyColigadacd_coligada_matriz: TIntegerField;
    tblDeptoscd_caixa: TIntegerField;
    lbChefeDepartamento: TLabel;
    btnChefeDepartamento: TSpeedButton;
    dbeCodigoPessoa: TDBEdit;
    SpeedButton1: TSpeedButton;
    tblDeptoscd_pessoa: TIntegerField;
    qryChefeDepartamento: TUMZQuery;
    qryChefeDepartamentonm_pessoa: TStringField;
    dsChefeDepartamento: TDataSource;
    dbeNomePessoa: TDBEdit;
    procedure tblDeptosBeforePost(DataSet: TDataSet);
    procedure btnChefeDepartamentoClick(Sender: TObject);
    procedure sbLimparChefeDepartamentoClick(Sender: TObject);
    procedure qyColigadaNewRecord(DataSet: TDataSet);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure DBEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure btMaisInformacoesClick(Sender: TObject);
    procedure dtcDeptosDataChange(Sender: TObject; Field: TField);
    procedure qyColigadaCalcFields(DataSet: TDataSet);
    procedure cmbPaisSelect(Sender: TObject);
    procedure qyColigadadescEstadoChange(Sender: TField);
    procedure qyColigadaBeforePost(DataSet: TDataSet);
    procedure tblDeptosAfterPost(DataSet: TDataSet);
    procedure tblDeptosBeforeInsert(DataSet: TDataSet);
    procedure dsGradesDataChange(Sender: TObject; Field: TField);
    procedure dtcColigadasDataChange(Sender: TObject; Field: TField);
    procedure grdColigadasDblClick(Sender: TObject);
    procedure dtcColigadasStateChange(Sender: TObject);
    procedure tblDeptosBeforeDelete(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tblDeptosNewRecord(DataSet: TDataSet);
    procedure sbLimparCaixaDeptoClick(Sender: TObject);
    procedure sbLimparBoletoDeptoClick(Sender: TObject);
    procedure pcGeralChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tblDeptosBeforeEdit(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dtcDeptosStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pcGeralChange(Sender: TObject);
    procedure dbeCodigoDeptoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gravalog();
    procedure grdDeptosDblClick(Sender: TObject);
    procedure pmQtdDeptosPopup(Sender: TObject);
    procedure tblDeptosCalcFields(DataSet: TDataSet);
  private
      pode_incluir_coligadas_filhas : Boolean;

      { Private declarations }
      procedure atualizaCheck();
      procedure carregarDepartamentos();
      procedure corrigeFocus();
      function ValidarEMail(const aStr: string): Boolean;
      function tbKeyIsDown(const Key: integer): boolean;

   { Ações de exclusão com verificação }
   procedure excluirDepartamento();


  public
    { Public declarations }
    bAlterando :Boolean;
    pedir_dados_grade : boolean;
    bCor : boolean;
    iSerieAtual: integer;
    linhaAtual: Pointer;
    nm_pessoaInicial : string;
    sn_onlineInicial : string;
    sn_alterar_boletoInicial : string;
  end;

var
  frmUnidadesEnsino: TfrmUnidadesEnsino;
  glogal_cd_instituicao : String;

implementation

uses
   uDM,Main, uTableFields, Math, StrUtils, uAtosOficiais, uGrade_Professor,
   uGrade_Horarios, uUsuario, uCursosCopia, uCursosTurmasAdicionais, uItemCombo,
  uFCopiaTurma, uColigada, uFSelecionarPessoa;

{$R *.DFM}

procedure TfrmUnidadesEnsino.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  n : Integer;
begin

   for n := 0 to ComponentCount - 1 do
   begin
      if Components[n] is TUMZQuery then
      begin
         if TUMZQuery(Components[n]).Active then TUMZQuery(Components[n]).Close;
      end;
   end;

   Action := caFree;
end;

procedure TfrmUnidadesEnsino.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmUnidadesEnsino.sbSairClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmUnidadesEnsino.carregarDepartamentos;
begin
  tblDeptos.Close();
  tblDeptos.ParamByName('cd_coligada').AsInteger := qyColigadacd_coligada.AsInteger;
  tblDeptos.Open();
end;



procedure TfrmUnidadesEnsino.cmbPaisSelect(Sender: TObject);
var
  indiceSelect : Integer;
begin
   indiceSelect  := cmbPais.ItemIndex;
   if qyColigada.State = dsBrowse then
   begin
      bAlterando := true;
      qyColigada.Edit;
   end;
   qyColigadads_estado.Clear;
   tblEstados.Close;
   tblEstados.ParamByName('cd_pais').AsInteger  := StrToInt(TItemCombo(cmbPais.Items.Objects[cmbPais.ItemIndex]).getCodigo);
   tblEstados.Open;
   qyColigadacd_municipio.Clear;
   qyColigadads_cidade.Clear;
   cmbPais.ItemIndex :=indiceSelect;
end;

procedure TfrmUnidadesEnsino.corrigeFocus;
begin
   ScrollBox2.SetFocus;
end;

procedure TfrmUnidadesEnsino.FormCreate(Sender: TObject);
var
   indice : Integer;
begin
   pode_incluir_coligadas_filhas := ( DM.variavel_parametro('pode_incluir_coligadas_filhas') = 'S' );

   bAlterando := false;
   pcGeral.ActivePage := tsColigadas;
   { Carregando as coligadas do usuário }

   qyColigada.SQL.Clear();
   qyColigada.SQL.Add(' SELECT ');
   qyColigada.SQL.Add('c.cd_coligada, c.nm_coligada, c.nm_razao_social,');
   qyColigada.SQL.Add('c.ds_cnpj, c.nm_diretor_geral, c.nm_diretor_acad,');
   qyColigada.SQL.Add('c.nm_diretor_finan, c.nm_testemunha1,');
   qyColigada.SQL.Add('c.nm_testemunha2, c.ds_cpf_geral, c.ds_cpf_acad,');
   qyColigada.SQL.Add('c.ds_cpf_finan, c.ds_cpf_test1, c.ds_cpf_test2,c.ds_cidade,c.ds_estado,c.cd_municipio, c.cd_instituicao_mec,');
   qyColigada.SQL.Add('c.ds_endereco, c.ds_numero, c.ds_complemento, c.ds_bairro, c.ds_cep, c.ds_email_geral, ');
   qyColigada.SQL.Add('c.ds_latitude, c.ds_longitude, c.ds_nre, c.ds_ato_direto, c.me_secretaria, ');
   qyColigada.SQL.Add('c.ds_ato_secretaria, c.ds_ato_ofic_estab, c.cd_coligada_matriz');
   qyColigada.SQL.Add('FROM coligadas c ');
   qyColigada.SQL.Add('WHERE c.cd_coligada_matriz = :cd_coligada_matriz');
   qyColigada.SQL.Add('ORDER BY nm_coligada');

   qyColigada.ParamByName('cd_coligada_matriz').AsInteger := DM.GetUsuarioLogado.ColigadaLogada;

   qyColigada.Open;
   qryPaises.Close;
   qryPaises.Open;

   while not(qryPaises.Eof) do
   begin
      cmbPais.AddItem(qryPaisesds_pais.AsString , TItemCombo.Create(qryPaisescd_pais.AsString,qryPaisesds_pais.AsString));
      qryPaises.Next;
   end;

   if (qryMunicipiocd_pais.AsString <> '') then
   begin
      for indice := 0 to cmbPais.Items.Count - 1 do
      begin
         if (TItemCombo(cmbPais.Items.Objects[indice]).getCodigo = qryMunicipiocd_pais.AsString) then
         begin
            cmbPais.ItemIndex := indice;
            Break;
         end;
      end;
   end;
   qyColigadadescEstadoChange(nil);
end;

procedure TfrmUnidadesEnsino.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1 : PrincipalForm.confSobreClick( nil );
    VK_F2 : if btnIncluir.Enabled  then btnIncluirClick( nil );
    VK_F3 : if btnAlterar.Enabled  then btnAlterarClick( nil );
    VK_F9 : if btnExcluir.Enabled  then btnExcluirClick( nil );
    VK_F5 : if btnSalvar.Enabled   then btnSalvarClick( nil );
    VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
    VK_F12 : if btnSair.Enabled    then btnSairClick( nil );
  end;
end;

procedure TfrmUnidadesEnsino.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
   msg: Cardinal;
   code: Cardinal;
   i, n: Integer;
begin
//   if WindowFromPoint( mouse.Cursorpos ) = ScrollBox2.Handle then begin
//      Handled := true;
   if ssShift In Shift Then
      msg := WM_HSCROLL
   else
   msg := WM_VSCROLL;

   if WheelDelta < 0 Then
      code := SB_LINEDOWN
   else
      code := SB_LINEUP;
   n:= Mouse.WheelScrollLines;
   for i:= 1 to n Do
      ScrollBox2.Perform( msg, code, 0 );
      ScrollBox2.Perform( msg, SB_ENDSCROLL, 0 );
end;

procedure TfrmUnidadesEnsino.btnIncluirClick(Sender: TObject);
begin
   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0 : begin
         qyColigada.Insert;
         if (DM.variavel_parametro('pode_incluir_coligadas_filhas') = 'S') then
         begin
            DBEdit18.Enabled:=True;
            DBEdit19.Enabled:=True;
            DBEdit20.Enabled:=True;
         end;
      end;
      1 : begin
         if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True, qyColigadacd_coligada.AsInteger ) then Exit;

         DBEdit1.SetFocus;
         tblDeptos.Insert;
         tblDeptoscd_coligada.AsInteger := qyColigadacd_coligada.AsInteger;
      end;
   end;
end;

procedure TfrmUnidadesEnsino.atualizaCheck;
begin
   if DBLookupComboBox8.Text = '' then
      DBCheckBox1.Enabled := false
   else
      DBCheckBox1.Enabled := true;   
end;

procedure TfrmUnidadesEnsino.btMaisInformacoesClick(Sender: TObject);
begin
   { Apresentar a tela de campos adicionais }
   Application.CreateForm(Tfrm_cursos_turmas_adicional, frm_cursos_turmas_adicional);

   if not frm_cursos_turmas_adicional.Montar_Dados('UNIDADES', IntToStr(qyColigadacd_coligada.AsInteger)) then
      Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING, Handle);

   FreeAndNil(frm_cursos_turmas_adicional);
end;

procedure TfrmUnidadesEnsino.btnAlterarClick(Sender: TObject);
begin

   case TTabSheet(pcGeral.ActivePage).PageIndex of
      0 : begin
         qyColigada.Edit();
         if (DM.variavel_parametro('pode_incluir_coligadas_filhas') = 'S') then
         begin
            DBEdit18.Enabled:=True;
            DBEdit19.Enabled:=True;
            DBEdit20.Enabled:=True;
         end;
      end;

      1 : begin
         if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True, qyColigadacd_coligada.AsInteger ) then Exit;

         tblDeptos.Edit;
         DBEdit1.SetFocus;
      end;
   end;
end;

procedure TfrmUnidadesEnsino.btnSalvarClick(Sender: TObject);
var
  xCodigo      : String;
  bSincronizar : boolean;
begin

   if not ValidarEMail(DBEdit11.Text) then
   begin
      ShowMessage('E-mail inválido!');
      exit;
   end;
   

   case TTabSheet(pcGeral.ActivePage).PageIndex of

      0 : Begin
         bSincronizar := qyColigada.State in [dsInsert];

         qyColigada.Post;

         if bSincronizar then
            TColigada.SincronizarGruposUsuariosMatriz();

         xCodigo := qyColigadacd_coligada.AsString;

         qyColigada.DisableControls;
         qyColigada.Close;
         qyColigada.Open;
         qyColigada.Locate( 'CD_COLIGADA', xCodigo, [loCaseInsensitive] );
         qyColigada.EnableControls;
      end;

      1 : begin
         tblDeptos.Post;
         xCodigo := tblDeptosCodigo.asString;
         tblDeptos.DisableControls;
         tblDeptos.Close;
         tblDeptos.Open;
         tblDeptos.Locate( 'Codigo', xCodigo, [loCaseInsensitive] );
         tblDeptos.EnableControls;
      end;
   end;

end;

procedure TfrmUnidadesEnsino.btnExcluirClick(Sender: TObject);
var
   msgExclusao: string;
begin
   if Mensagem('Deseja excluir este registro?',Application.Title,
      MB_YESNO + MB_ICONQUESTION, Handle) = ID_YES then
   begin
      case TTabSheet(pcGeral.ActivePage).PageIndex of
         0 : begin
            if tblDeptos.RecordCount > 0 then
            begin
               Mensagem('Existem departamentos vinculados a esta Unidade de Ensino.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
            end else begin
               qyColigada.Delete;
               TColigada.SincronizarGruposUsuariosMatriz();
            end;
         end;

         // Delete Departamentos
         1 : begin
            excluirDepartamento();
         end;
      end;
   end;
end;

procedure TfrmUnidadesEnsino.btnCancelarClick(Sender: TObject);
begin
  case TTabSheet(pcGeral.ActivePage).PageIndex of
    0 : qyColigada.Cancel;
    1 : tblDeptos.Cancel;
  end;
end;

procedure TfrmUnidadesEnsino.btnChefeDepartamentoClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   { Pesquisar Pessoa }
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa, tblDeptos.FieldByName('cd_pessoa').AsInteger);

   if resultado_filtro.filtrado then
   begin
      if NOT (tblDeptos.State in [dsInsert, dsEdit]) then
      begin
         tblDeptos.Edit();
      end;

      tblDeptos.FieldByName('cd_pessoa').AsInteger := resultado_filtro.cd_pessoa;
   end;
end;

procedure TfrmUnidadesEnsino.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUnidadesEnsino.excluirDepartamento;
var
   qyVerificaVinculoCursoTurma: TUMZQuery;
begin
   { Verificar se o usuário logado tem permissão de exclusão na coligada selecionada
      na tela de "Unidade de Ensino" }
   if not DM.UsuarioLogado.TemPermissao( 1006, npExcluir, True, qyColigadacd_coligada.AsInteger ) then Exit;

   DM.CriarConsulta( qyVerificaVinculoCursoTurma );

   with qyVerificaVinculoCursoTurma do
   begin
      { Fazer a verificação se o departamento que está sendo excluído tem informações
         de curso vinculadas a ele }
      Close;
      SQL.Clear;

      SQL.Add('SELECT COUNT(*) AS registros FROM cursos_coligadas WHERE CD_DEPTO = :CD_DEPTO');

      ParamByName('CD_DEPTO').AsInteger := tblDeptosCodigo.AsInteger;

      Open();

      if FieldByName('registros').AsInteger > 0 then
      begin
         Mensagem('Não é possível excluir este departamento, '+Chr(13)+
                  'pois existem informações vinculadas.',
                  'Atenção', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;
   { O departamento somente será excluído caso não passe por nenhuma das verificações,
      acima. }
   tblDeptos.Delete;
end;

procedure TfrmUnidadesEnsino.dtcDeptosDataChange(Sender: TObject;Field: TField);
begin
   atualizaCheck;

   // Carrega o nome do chefe de departamento (se houver)
   qryChefeDepartamento.Close;
   if tblDeptos.FieldByName('cd_pessoa').AsInteger > 0 then
   begin
      qryChefeDepartamento.ParamByName('cd_pessoa').AsInteger := tblDeptos.FieldByName('cd_pessoa').AsInteger;
      qryChefeDepartamento.Open;
   end;

   if (tblDeptos.State in [dsBrowse]) then
   begin
      nm_pessoaInicial := qryChefeDepartamentonm_pessoa.AsString;
      sn_alterar_boletoInicial := tblDeptosSN_ALTERAR_BOLETO.AsString;
      sn_onlineInicial := tblDeptossn_online.AsString;
   end;
end;

procedure TfrmUnidadesEnsino.dtcDeptosStateChange(Sender: TObject);
begin
  if pcGeral.ActivePage <> tsDeptos then Exit;

  btnIncluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];

end;


procedure TfrmUnidadesEnsino.FormDestroy(Sender: TObject);
begin
  frmUnidadesEnsino := nil;
end;


procedure TfrmUnidadesEnsino.dtcColigadasDataChange(Sender: TObject; Field: TField);
var
   indice  : Integer;
   cd_pais : Integer;
begin
   try

      qyConta.Close();
      qyConta.ParamByName('cd_coligada').AsInteger := qyColigadacd_coligada.AsInteger;
      qyConta.Open();
      if qyColigada.State = dsBrowse then
      begin
         cd_pais := qyColigadacd_pais.AsInteger;
         if(cd_pais = -1) then
         begin
            cmbPais.ItemIndex := -1;
         end;

         tblEstados.Close;
         tblEstados.ParamByName('cd_pais').AsInteger := cd_pais;
         tblEstados.Open;
         qryMunicipio.Close();
         qryMunicipio.ParamByName('uf').AsString := tblEstados.FieldByName('ds_uf').AsString;
         qryMunicipio.Open();

      end;
      if (qryMunicipiocd_pais.AsString <> '') AND not(bAlterando)then
      begin
         for indice := 0 to cmbPais.Items.Count - 1 do
         begin
            if (TItemCombo(cmbPais.Items.Objects[indice]).getCodigo = qryMunicipiocd_pais.AsString)then
            begin
               cmbPais.ItemIndex := indice;
               Break;
            end;
         end;
      end;

      bAlterando := false;
      qyColigadadescEstadoChange(nil);
      carregarDepartamentos();
   except on E: Exception do
   end;
end;

procedure TfrmUnidadesEnsino.dtcColigadasStateChange(Sender: TObject);
begin
  if pcGeral.ActivePage <> tsColigadas then exit;

  btnIncluir.Enabled     := (pode_incluir_coligadas_filhas) and (TDataSource( Sender ).State in [dsBrowse]);
  btnAlterar.Enabled     := TDataSource( Sender ).State in [dsBrowse];
  btnSalvar.Enabled      := TDataSource( Sender ).State in [dsEdit, dsInsert];
  btnExcluir.Enabled     := (pode_incluir_coligadas_filhas) and (TDataSource( Sender ).State in [dsBrowse]);
  btnCancelar.Enabled    := TDataSource( Sender ).State in [dsEdit, dsInsert];

  if (qyColigada.State <> dsInsert) then
  begin
     DBEdit18.Enabled:=False;
     DBEdit19.Enabled:=False;
     DBEdit20.Enabled:=False;
  end;
end;

procedure TfrmUnidadesEnsino.pcGeralChange(Sender: TObject);
begin
   if pcGeral.ActivePage = tsDeptos then
   begin
      btnIncluir.Enabled     := tblDeptos.State in [dsBrowse];
      btnAlterar.Enabled     := tblDeptos.State in [dsBrowse];
      btnSalvar.Enabled      := tblDeptos.State in [dsEdit, dsInsert];

      btnExcluir.Enabled     := tblDeptos.State in [dsBrowse];
      btnCancelar.Enabled    := tblDeptos.State in [dsEdit, dsInsert];
      lbColigada.Caption := qyColigadanm_coligada.AsString;
   end
   else if  pcGeral.ActivePage = tsColigadas then
   begin
      btnIncluir.Enabled     := pode_incluir_coligadas_filhas;
      btnAlterar.Enabled     := qyColigada.State in [dsBrowse];
      btnSalvar.Enabled      := qyColigada.State in [dsEdit, dsInsert];

      btnExcluir.Enabled     := pode_incluir_coligadas_filhas;
      btnCancelar.Enabled    := qyColigada.State in [dsEdit, dsInsert];
   end;
end;

procedure TfrmUnidadesEnsino.dbeCodigoDeptoEnter(Sender: TObject);
begin
   PrincipalForm.MostraHint2(Sender);
end;

procedure TfrmUnidadesEnsino.DBEdit12KeyPress(Sender: TObject; var Key: Char);
begin
   if DBEdit12.Focused() then
   begin
      if tbKeyIsDown(VK_CONTROL) AND tbKeyIsDown(Ord('V')) then
      begin
         DBEdit12.Text := '';
      end;
   end;
   if (Key <> '-') and (Key <> '+') and (Key <> '.') and (not (Key in['0'..'9',Chr(8)])) then Key:= #0;
end;

procedure TfrmUnidadesEnsino.DBEdit13KeyPress(Sender: TObject; var Key: Char);
begin
   if DBEdit13.Focused() then
   begin
      if tbKeyIsDown(VK_CONTROL) AND tbKeyIsDown(Ord('V')) then
      begin
         DBEdit13.Text := '';
      end;
   end;
   if (Key <> '-') and (Key <> '+') and (Key <> '.') and (not (Key in['0'..'9',Chr(8)])) then Key:= #0;
end;

procedure TfrmUnidadesEnsino.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
   DM.TodasMaiusculas(TForm(Sender));

   corrigeFocus;

   { Definir as primeiras guias como padrão }
   pcGeral.ActivePageIndex := 0;

   btnIncluir.Enabled := pode_incluir_coligadas_filhas;
   btnExcluir.Enabled := pode_incluir_coligadas_filhas;

   DBLookupComboBox8.Enabled := DM.UsuarioLogado.TemPermissao(
      1997,
      npAlterar,
      False
   );

   sbLimparBoletoDepto.Enabled := DM.UsuarioLogado.TemPermissao(
      1997,
      npAlterar,
      False
   );

   DBCheckBox1.Enabled := DM.UsuarioLogado.TemPermissao(
      1997,
      npAlterar,
      False
   );
   
end;

procedure TfrmUnidadesEnsino.dsGradesDataChange(Sender: TObject; Field: TField);
begin
   // inicialização para montar cores da grade
   bCor := false;
   iSerieAtual:= 0;
end;

procedure TfrmUnidadesEnsino.grdDeptosDblClick(Sender: TObject);
var
  local: Pointer;
begin

   if grdDeptos.SelectedIndex = 2 then
   Begin
     Dm.qAux1.Close;
     DM.qAux1.SQL.Clear;
     Dm.qAux1.SQL.Add(' update departamentos ');

     if tblDeptossn_online.AsString = 'S' then
       Dm.qAux1.SQL.Add(' set sn_online = ''N'' ')
     else
       Dm.qAux1.SQL.Add(' set sn_online = ''S'' ');

     DM.qAux1.SQL.Add('where Codigo = :codigo');
     Dm.qAux1.ParamByName('codigo').AsInteger := tblDeptosCodigo.AsInteger;
     Dm.qAux1.ExecSQL;

     local := tblDeptos.GetBookmark;
     tblDeptos.Close;
     tblDeptos.Open;
     tblDeptos.GotoBookmark(local);
   end;
end;

procedure TfrmUnidadesEnsino.pmQtdDeptosPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblDeptos, pmQtdDeptos);
end;

procedure TfrmUnidadesEnsino.qyColigadaBeforePost(DataSet: TDataSet);
begin
   qyColigadacd_municipio.asInteger := qryMunicipiocd_municipio.AsInteger;
end;

procedure TfrmUnidadesEnsino.qyColigadaCalcFields(DataSet: TDataSet);
var
   qryGetColigada : TUMZQuery;
begin
   DM.CriarConsulta(qryGetColigada);
   qryGetColigada.SQL.Text := 'SELECT cd_pais FROM estados WHERE ds_uf ='''+qyColigadads_estado.AsString+'''';
   qryGetColigada.Open;
   if(qryGetColigada.FieldByName('cd_pais').AsInteger = 0)then
   begin
      qyColigadacd_pais.AsInteger :=-1;
   end
   else
      qyColigadacd_pais.AsInteger :=qryGetColigada.FieldByName('cd_pais').AsInteger;
   qryGetColigada.free
end;

procedure TfrmUnidadesEnsino.qyColigadadescEstadoChange(Sender: TField);
begin
   qryMunicipio.Close();
   qryMunicipio.ParamByName('uf').AsString := tblEstados.FieldByName('ds_uf').AsString;
   qryMunicipio.Open();
end;

procedure TfrmUnidadesEnsino.qyColigadaNewRecord(DataSet: TDataSet);
begin
   qyColigadacd_coligada_matriz.AsInteger := DM.GetUsuarioLogado.ColigadaLogada;
end;

procedure TfrmUnidadesEnsino.sbLimparBoletoDeptoClick(Sender: TObject);
begin
   if not (tblDeptos.State in [dsinsert, dsedit]) then begin
      tblDeptos.Edit;
   end;

   tblDeptoscd_boleto_padrao.AsInteger := 0;
end;

procedure TfrmUnidadesEnsino.sbLimparCaixaDeptoClick(Sender: TObject);
begin
   if not (tblDeptos.State in [dsinsert, dsedit]) then begin
      tblDeptos.Edit;
   end;

   tblDeptoscd_caixa.AsInteger := 0;
end;

procedure TfrmUnidadesEnsino.sbLimparChefeDepartamentoClick(Sender: TObject);
begin
   if not (tblDeptos.State in [dsinsert, dsedit]) then begin
      tblDeptos.Edit;
   end;

   tblDeptos.FieldByName('cd_pessoa').Clear;
end;

procedure TfrmUnidadesEnsino.tblDeptosCalcFields(DataSet: TDataSet);
begin
  if tblDeptossn_online.AsString = 'S' then
    tblDeptosonline.AsString := 'X';
end;

procedure TfrmUnidadesEnsino.tblDeptosNewRecord(DataSet: TDataSet);
begin
   tblDeptosCodigo.AsInteger := DM.ProximoId('codigo', 'departamentos');
end;

function TfrmUnidadesEnsino.ValidarEMail(const aStr: string): Boolean;
const
  CaraEsp: array[1..40] of string[1] =
  ( '!','#','$','%','¨','&','*',
  '(',')','+','=','§','¬','¢','¹','²',
  '³','£','´','`','ç','Ç',',',';',':',
  '<','>','~','^','?','/','','|','[',']','{','}',
  'º','ª','°');
var
  i,cont   : integer;
  EMail    : ShortString;
begin
  EMail := aStr;
  Result := True;
  cont := 0;
  if EMail <> '' then
    if (Pos('@', EMail)<>0) and (Pos('.', EMail)<>0) then    // existe @ .
    begin
      if (Pos('@', EMail)=1) or (Pos('@', EMail)= Length(EMail)) or (Pos('.', EMail)=1) or (Pos('.', EMail)= Length(EMail)) or (Pos(' ', EMail)<>0) then
        Result := False
      else                                   // @ seguido de . e vice-versa
        if (abs(Pos('@', EMail) - Pos('.', EMail)) = 1) then
          Result := False
        else
          begin
            for i := 1 to 40 do            // se existe Caracter Especial
              if Pos(CaraEsp[i], EMail)<>0 then
                Result := False;
            for i := 1 to length(EMail) do
            begin                                 // se existe apenas 1 @
              if EMail[i] = '@' then
                cont := cont + 1;                    // . seguidos de .
              if (EMail[i] = '.') and (EMail[i+1] = '.') then
                Result := false;
            end;
                                   // . no f, 2ou+ @, . no i, - no i, _ no i
            if (cont >=2) or ( EMail[length(EMail)]= '.' )
              or ( EMail[1]= '.' ) or ( EMail[1]= '_' )
              or ( EMail[1]= '-' )  then
                Result := false;
                                            // @ seguido de COM e vice-versa
            if (abs(Pos('@', EMail) - Pos('com', EMail)) = 1) then
              Result := False;
                                              // @ seguido de - e vice-versa
            if (abs(Pos('@', EMail) - Pos('-', EMail)) = 1) then
              Result := False;
                                              // @ seguido de _ e vice-versa
            if (abs(Pos('@', EMail) - Pos('_', EMail)) = 1) then
              Result := False;
          end;
    end
    else
      Result := False;
end;

function TfrmUnidadesEnsino.tbKeyIsDown(const Key: integer): boolean;
begin
   Result := GetKeyState(Key) and 128 > 0;
end;

procedure TfrmUnidadesEnsino.tblDeptosAfterPost(DataSet: TDataSet);
begin
   grdDeptos.SetFocus;
end;

procedure TfrmUnidadesEnsino.tblDeptosBeforeDelete(DataSet: TDataSet);
var  msgExclusao: string;
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npExcluir, True, qyColigadacd_coligada.AsInteger ) then Abort;
   {log de exluir colocar aqui}
     msgExclusao := 'Excluido o departamento de codigo '+ tblDeptosCodigo.AsString + ' descricao : ' +  tblDeptosDESCRICAO.AsString;
     DM.setLog(1006, 'Exclusao', tblDeptosCodigo.AsString , qyColigadacd_coligada.AsInteger, msgExclusao);
end;

procedure TfrmUnidadesEnsino.tblDeptosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npAlterar, True, qyColigadacd_coligada.AsInteger ) then Abort;
end;

procedure TfrmUnidadesEnsino.tblDeptosBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npIncluir, True, qyColigadacd_coligada.AsInteger ) then Abort;
end;

procedure TfrmUnidadesEnsino.tblDeptosBeforePost(DataSet: TDataSet);
begin
   gravalog();
end;

procedure TfrmUnidadesEnsino.pcGeralChanging(Sender: TObject; var AllowChange: Boolean);
begin
   pcGeral.Tag := pcGeral.TabIndex;

   if (btnSalvar.Enabled) OR
      (qyColigada.State IN [dsInsert, dsEdit]) OR
      (tblDeptos.State IN [dsInsert, dsEdit]) then
   begin
      Mensagem('Salve as alterações antes de passar para a próxima guia.', 'Atenção', MB_OK + MB_ICONWARNING, Handle);
      AllowChange := False;
   end
   else
      AllowChange := True;

end;

procedure TfrmUnidadesEnsino.grdColigadasDblClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 1006, npAcesso, True, qyColigadacd_coligada.AsInteger ) then
   begin
      Exit;
   end else begin
      carregarDepartamentos();
      pcGeral.ActivePage := tsDeptos;
   end;
end;

procedure TfrmUnidadesEnsino.gravalog();
var
   operacao,msgLogDepartamento,msgLogFom: String;
   campoCheck: boolean;
  valorCheckBoleto: string;
  valorCheckOnline: string;
begin
   valorCheckBoleto := '0';
   valorCheckOnline := 'N';
   
   operacao := 'Alteração';
   msgLogFom := 'Alterados dados do departamento ' + tblDeptosCodigo.AsString + ', ';

   if tblDeptos.State in [DsInsert] then
   begin
      operacao := 'Inclusão';
      msgLogFom := 'Incluidos dados do departamento ' + tblDeptosCodigo.AsString + ', ';
   end;

   if dbeNomePessoa.Text <> nm_pessoaInicial then
   begin
      msgLogDepartamento := 'Nome da pessoa: ' + nm_pessoaInicial + ' para ' + dbeNomePessoa.Text + ', ';
   end;

   campoCheck := DBCheckBox1.Checked;

   if campoCheck = true then
   begin
      valorCheckBoleto := '1';
   end;

   if valorCheckBoleto <> sn_alterar_boletoInicial then
   begin
      msgLogDepartamento := msgLogDepartamento + 'A conta pode ser alterada: ' + sn_alterar_boletoInicial + ' para ' + valorCheckBoleto + ', ';
   end;
   
   campoCheck := DBCheckBox2.Checked;

   if campoCheck = true then
   begin
      valorCheckOnline := 'S';
   end;

   if valorCheckOnline <> sn_onlineInicial then
   begin
      msgLogDepartamento := msgLogDepartamento + 'Acesso Online: ' + sn_onlineInicial + ' para ' + valorCheckOnline + ', ';
   end;

   msgLogDepartamento := msgLogDepartamento + DM.geraLogForm(frmUnidadesEnsino,'tsDeptos',operacao);

   if(msgLogDepartamento <> '') then
   begin
      DM.setLog(1006, operacao, tblDeptosCodigo.AsString , qyColigadacd_coligada.AsInteger , msgLogFom + msgLogDepartamento);
   end;
end;

end.
