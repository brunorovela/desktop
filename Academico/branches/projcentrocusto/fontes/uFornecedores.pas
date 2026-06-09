unit uFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, Db, ZConnection, Mask,
  DBCtrls, jpeg, DBCGrids, Grids, DBGrids, Buttons, ExtDlgs, Menus,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, StrUtils, RegExpr,
  ClassPessoas, md5;

type
  Tfrm_Fornecedores = class(TForm)
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
    TabSheet1: TTabSheet;
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
    dsPessoa: TDataSource;
    tblPessoads_pais: TStringField;
    DBText1: TDBText;
    DBText2: TDBText;
    TabSheet5: TTabSheet;
    dbObs: TDBMemo;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    Panel4: TPanel;
    tblPessoacd_empresa: TIntegerField;
    tblPessoads_cargo: TStringField;
    tblPessoads_pais_nascimento: TStringField;
    tblPessoads_logradouro: TStringField;
    tblPessoads_logradouro_nro: TStringField;
    tblPessoadescEstado: TStringField;
    tblPessoads_identidade_orgao_exp: TStringField;
    tblPessoads_rm_corporacao: TStringField;
    tblPessoads_rm_org_numero: TStringField;
    tblPessoads_rm_doc_numero: TStringField;
    tblPessoads_rm_orgao: TStringField;
    tblPessoads_rm_doc_tipo: TStringField;
    tblPessoadt_nascimento: TDateTimeField;
    tblPessoadt_rm_exp: TDateTimeField;
    tblPessoadt_identidade_expedicao: TDateTimeField;
    tblPessoadt_revisao: TDateTimeField;
    tblPessoadt_cadastro: TDateTimeField;
    tblPessoacd_estado_civil: TSmallintField;
    tblPessoads_senha: TStringField;
    tblPessoasn_senha_provisoria: TStringField;
    tblPessoadt_titulo_emissao: TDateTimeField;
    ToolButton6: TToolButton;
    DBNavigator1: TDBNavigator;
    tblPessoasn_bloqueto_empresa: TStringField;
    tblPessoaim_pessoa: TBlobField;
    pmContatos: TPopupMenu;
    AdicionarContato1: TMenuItem;
    ExcluirContato1: TMenuItem;
    N1: TMenuItem;
    Cancelar1: TMenuItem;
    SpeedButton2: TSpeedButton;
    tblPessoads_estado_civil: TStringField;
    tblPessoasn_foto_publica: TStringField;
    tblPessoasn_pai: TStringField;
    tblPessoasn_mae: TStringField;
    tblPessoanm_contato: TStringField;
    tblPessoatp_pessoa: TStringField;
    tblPessoads_cnpj: TStringField;
    tblPessoads_inscri_estadual: TStringField;
    qyAreasAtuacao: TUMZQuery;
    srcAreasAtuacao: TDataSource;
    qyAreasAtuacaoCD_PESSOA: TIntegerField;
    qyAreasAtuacaoCD_AREAATUACAO: TIntegerField;
    qyAreasAtuacaoDS_NOMEAREAATUACAO: TStringField;
    pmAreasAtuacao: TPopupMenu;
    Adicionarrea1: TMenuItem;
    Excluirrea1: TMenuItem;
    N2: TMenuItem;
    Cancelar2: TMenuItem;
    qyPlanoFornecedor: TUMZQuery;
    dsPlanoFornecedor: TDataSource;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    dbNome: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    dbCpfCnpj: TDBEdit;
    Label7: TLabel;
    dbCep: TDBEdit;
    dbPais: TDBEdit;
    Label13: TLabel;
    sbCep: TSpeedButton;
    Label9: TLabel;
    dbEndereco: TDBEdit;
    grdAreasAtuacao: TDBGrid;
    dbComplemento: TDBEdit;
    Label10: TLabel;
    Label38: TLabel;
    DBEdit2: TDBEdit;
    dbBairro: TDBEdit;
    Label11: TLabel;
    dbCidade: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label4: TLabel;
    dbInscriEstadual: TDBEdit;
    Label5: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Bevel2: TBevel;
    qyTemp1: TUMZQuery;
    sbMaisInformacoes: TSpeedButton;
    qyPlanoFornecedorcd_conta: TLargeintField;
    qyPlanoFornecedorcd_pessoa: TLargeintField;
    qryUpdPlanoContasFor: TUMZQuery;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    sbSelecionaResponsavel: TSpeedButton;
    lbRespFinan: TLabel;
    txtResponsavelFinanceiro: TEdit;
    btnCancelarObs: TBitBtn;
    btnSalvarObs: TBitBtn;
    btnAlterarObs: TBitBtn;
    dsObsGerais: TDataSource;
    qryObsGerais: TUMZQuery;
    qryObsGeraiscd_pessoa: TIntegerField;
    qryObsGeraisds_observacao: TMemoField;
    tblContatosPadroes: TUMZQuery;
    qryPlanoContas: TUMZQuery;
    qyPlanoFornecedords_conta_calc: TStringField;
    qryPlanoContasCD_CONTA: TLargeintField;
    qryPlanoContasCD_COLIGADA_MATRIZ: TIntegerField;
    qryPlanoContasDS_CONTA: TStringField;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    qyPlanoFornecedorcd_conta_passivo: TLargeintField;
    qyPlanoFornecedords_conta_passivo: TStringField;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    sbConta: TSpeedButton;
    SpeedButton3: TSpeedButton;
    qyPlanoFornecedorcd_coligada: TLargeintField;
    dsContas: TDataSource;
    dbContaPassivo: TDBLookupComboBox;
    dbConta: TDBLookupComboBox;
    gradeContato: TDBGrid;
    medCampoContato: TMaskEdit;
    qryContatosTipos: TUMZQuery;
    qryContatosTiposds_mascara: TStringField;
    tblContatoPessoa: TUMZQuery;
    tblContatoPessoacd_pessoa: TIntegerField;
    tblContatoPessoacd_contato: TIntegerField;
    tblContatoPessoads_contato: TStringField;
    tblContatoPessoadescContato: TStringField;
    tblContatoPessoads_contato_formatado: TStringField;
    dsContatoPessoa: TDataSource;
    qryDeleteContato: TUMZQuery;
    tblContatoPessoads_observacao: TStringField;
    Panel1: TPanel;
    Label109: TLabel;
    Label108: TLabel;
    Label33: TLabel;
    edLogin: TEdit;
    edSenha1: TEdit;
    edSenha2: TEdit;
    Label207: TLabel;
    lbDTCadastro: TLabel;
    Label210: TLabel;
    lbDTAlteracao: TLabel;
    Label211: TLabel;
    lbUsuario: TLabel;
    Bevel1: TBevel;
    Panel2: TPanel;
    Bevel3: TBevel;
    tblPessoacd_mae: TLargeintField;
    tblPessoacd_pai: TLargeintField;
    tblPessoacd_municipio: TLargeintField;
    tblPessoacd_pais: TLargeintField;
    tblPessoacd_pais_nascimento: TLargeintField;
    tblPessoacd_logradouro: TLargeintField;
    tblPessoacd_orgao_emissor: TLargeintField;
    tblPessoanr_dia_vencimento: TLargeintField;
    tblPessoasn_nao_bloquear_financeiro: TSmallintField;
    tblPessoacd_pessoa_alteracao: TLargeintField;
    tblPessoads_login: TStringField;
    tblPessoads_senha_md4: TStringField;
    tblPessoatp_cert: TSmallintField;
    tblPessoanr_cert_termo: TStringField;
    tblPessoads_cert_folha: TStringField;
    tblPessoads_cert_livro: TStringField;
    tblPessoadt_cert: TDateTimeField;
    tblPessoads_cert_uf: TStringField;
    tblPessoads_cert_orgao: TStringField;
    tblPessoacd_municipio_nasc: TLargeintField;
    tblPessoanr_praca: TLargeintField;
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
    tblPessoacd_raca: TSmallintField;
    tblPessoacd_mec: TStringField;
    tblPessoasn_foto: TStringField;
    tblPessoasn_bloqueado: TSmallintField;
    tblPessoads_inscri_municipal: TStringField;
    tblPessoacd_bairro: TIntegerField;
    tblPessoacd_usuario_pessoa: TLargeintField;
    tblPessoasn_bloq_cartas: TSmallintField;
    tblPessoasn_bloq_emails: TSmallintField;
    tblPessoasn_naturalizado: TSmallintField;
    tblPessoadt_identidade_expiracao: TDateTimeField;
    tblPessoads_matricula: TStringField;
    tblPessoasn_pode_retirar_material: TSmallintField;
    tblPessoads_passaporte: TStringField;
    tblPessoads_forma_conheceu: TStringField;
    tblPessoads_formacao_academica: TStringField;
    tblPessoanm_pessoa_oficial: TStringField;
    tblPessoasn_nome_social: TSmallintField;
    procedure pgPessoaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edSenha2KeyPress(Sender: TObject; var Key: Char);
    procedure edSenha1KeyPress(Sender: TObject; var Key: Char);
    procedure edLoginKeyPress(Sender: TObject; var Key: Char);
    procedure tblContatoPessoads_observacaoChange(Sender: TField);
    procedure tblContatoPessoaBeforePost(DataSet: TDataSet);
    procedure medCampoContatoEnter(Sender: TObject);
    procedure medCampoContatoExit(Sender: TObject);
    procedure medCampoContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsContatoPessoaStateChange(Sender: TObject);
    procedure dsContatoPessoaDataChange(Sender: TObject; Field: TField);
    procedure gradeContatoEnter(Sender: TObject);
    procedure gradeContatoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tblContatoPessoaNewRecord(DataSet: TDataSet);
    procedure tblContatoPessoaCalcFields(DataSet: TDataSet);
    procedure tblContatoPessoaBeforeScroll(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure qyPlanoFornecedorNewRecord(DataSet: TDataSet);
    procedure sbContaClick(Sender: TObject);
    procedure dsObsGeraisStateChange(Sender: TObject);
    procedure pgPessoaChange(Sender: TObject);
    procedure btnCancelarObsClick(Sender: TObject);
    procedure btnSalvarObsClick(Sender: TObject);
    procedure btnAlterarObsClick(Sender: TObject);
    procedure sbSelecionaResponsavelClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure grdAreasAtuacaoCellClick(Column: TColumn);
    procedure gradeContatoCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure sbMaisInformacoesClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblPessoaAfterOpen(DataSet: TDataSet);
    procedure tblPessoaBeforeInsert(DataSet: TDataSet);
    procedure tblPessoaBeforeEdit(DataSet: TDataSet);
    procedure tblPessoads_sexoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure tblPessoads_sexoSetText(Sender: TField; const Text: String);
    procedure FormShow(Sender: TObject);
    procedure btFechar_PessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure dbNomeExit(Sender: TObject);
    procedure sbCepClick(Sender: TObject);
    procedure AdicionarContato1Click(Sender: TObject);
    procedure ExcluirContato1Click(Sender: TObject);
    procedure dsPessoaDataChange(Sender: TObject; Field: TField);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure Adicionarrea1Click(Sender: TObject);
    procedure Excluirrea1Click(Sender: TObject);
    procedure qyAreasAtuacaoNewRecord(DataSet: TDataSet);
    procedure qyAreasAtuacaoAfterPost(DataSet: TDataSet);

    function GruposHierarquia(const cd_pessoa: Integer) : Boolean;

  private
    nm_resp_finan : string;
    qyTemp2 : TUMZQuery;
    hasPermObsGerais : Boolean;
    permIncluir : Boolean;
    permAlterar : Boolean;
    iPermissao : Integer;
    validacaoCampo: Boolean;
    valorCampoContatoSemMascara: string;
    valorCampoContatoComMascara: string;

    function validaCNPJ(numCNPJ: String): boolean;
    function Tem_matricula(codigo : integer) : boolean;
    procedure buscaRespFinan( cd_resp_finan : integer );
    procedure verificar_contatos_padroes(CodAluno: Integer);
    procedure alteraLogin(edLogin, edSenha, edRedgSenha: TEdit; sLoginAntigo: string; qyPaiResp: TUMZQuery);
    function verificaDuplicidadeCpfCnpj(tipo: integer): Boolean;
    function retiraMascara(strComMascara : String): String;
    function retiraMascaraTelefone(strComMascara : String): String;
  public
     procedure CMFocusChanged(var Message: TCMFocusChanged); message CM_FOCUSCHANGED;
    { Public declarations }
  end;

var
  frm_Fornecedores: Tfrm_Fornecedores;
  loginAntigo: string;

implementation

Uses uDM, General, Main, uUsuario, Math, uSelCep, uPessoas_adicional , UFObservacoes,
  uFSelecionarPessoa, uSelConta, MaskUtils;

{$R *.DFM}

procedure Tfrm_Fornecedores.tblPessoads_sexoGetText(Sender: TField;
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

procedure Tfrm_Fornecedores.tblPessoads_sexoSetText(Sender: TField;
  const Text: String);
{ Gravar como M e F }
begin

   if Text = 'Masculino'
   Then Sender.AsString := 'M'
   Else

      if Text = 'Feminino'
      Then Sender.AsString := 'F';

end; { tblPessoads_sexoSetText } 

procedure Tfrm_Fornecedores.FormShow(Sender: TObject);
begin
   iPermissao := 1001;
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

   pgPessoa.ActivePageIndex := 0;
  { Atualização das Tabelas }

  { Acrescentar Contatos no Combo }
  Dm.tblContatosTipos.Close;
  DM.tblContatosTipos.Open;
  DM.tblEstados.Close;
  DM.tblEstados.Open;
  DM.qyAreasAtuacao.Open;

  if DM.variavel_parametro('pessoa_buscar_ultimo') = 'S' Then
  Begin
     { Selecionar as pessoas alteradas nos últimos 2 dias }
     tblPessoa.Close;
     tblPessoa.SQL.Text := 'Select * from pessoas where dt_revisao = :data';
     tblPessoa.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', DataHoje);
     tblPessoa.Open;
     tblContatoPessoa.Open;
     qyAreasAtuacao.Open;
  End;

  qryPlanoContas.Close();
  qryPlanoContas.ParamByNAme('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
  qryPlanoContas.Open();

  qyPlanoFornecedor.Close();

  hasPermObsGerais := DM.UsuarioLogado.TemPermissao( 0, 'Academico.PessoasFornecedoresObservacoes', npAcesso, False );
  permIncluir := DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, False );
  permAlterar := DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, False );

  if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
  begin
     dbObs.DataSource := dsObsGerais;
  end;

  if DM.lite then
  begin
     sbMaisInformacoes.Visible := false;
  end;
  
  edLogin.CharCase := ecNormal;
  edSenha1.CharCase := ecNormal;
  edSenha2.CharCase := ecNormal;

  DM.CriarConsulta(qyTemp2);

end; { FormShow }


procedure Tfrm_Fornecedores.btFechar_PessoaClick(Sender: TObject);
{ Fechar o Cadastro de Pessoas }
begin

   close;

end; { btFechar_PessoaClick }


procedure Tfrm_Fornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
{ Fechar Cadastro de Pessoa }
begin
   if ( tblcontatoPessoa.State in [dsInsert,dsEdit] ) then
   begin
      tblContatoPessoa.Post;
      tblContatoPessoa.Close;
   end;

   Dm.tblContatosTipos.Close;
   DM.tblEstados.Close;

   tblPessoa.Close;
   Action := caFree;

end;

procedure Tfrm_Fornecedores.FormCreate(Sender: TObject);
begin
end;

{ FormClose }


procedure Tfrm_Fornecedores.gradeContatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure Tfrm_Fornecedores.grdAreasAtuacaoCellClick(Column: TColumn);
begin
   if tblPessoa.State <> dsBrowse then
   begin
      tblPessoa.Post;
      tblPessoa.Edit;
   end;
end;

function Tfrm_Fornecedores.GruposHierarquia(const cd_pessoa: Integer): Boolean;
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
            Resultado := False;
            Break;
         end;
      end;
   end;
   
   Result := Resultado;
end;

procedure Tfrm_Fornecedores.medCampoContatoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure Tfrm_Fornecedores.medCampoContatoEnter(Sender: TObject);
begin
   dsContatoPessoaDataChange(nil, nil);
end;

procedure Tfrm_Fornecedores.medCampoContatoExit(Sender: TObject);
begin
   tblContatoPessoaBeforeScroll(tblContatoPessoa);
end;

procedure Tfrm_Fornecedores.pgPessoaChange(Sender: TObject);
var
   enable: Boolean;
begin
   dbObs.Enabled := hasPermObsGerais;

   if (hasPermObsGerais and not permIncluir) and (hasPermObsGerais and not permAlterar) then
   begin
      btnAlterarObs.Visible := True;
      btnSalvarObs.Visible := True;
      btnCancelarObs.Visible := True;

      qryObsGerais.Close();
      qryObsGerais.ParamByName('cd_pessoa').AsInteger := tblPessoa.FieldByName('cd_pessoa').AsInteger;
      qryObsGerais.Open();
   end;

   enable := GruposHierarquia(tblPessoacd_pessoa.AsInteger);

   if (pgPessoa.ActivePage = TabSheet5) then
   begin
      enable := enable or (tblPessoacd_pessoa.AsInteger = DM.iCdPessoaLogado);
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
         edLogin.Enabled   := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false ) and enable;
         edSenha1.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false ) and enable;
         edSenha2.Enabled  := DM.UsuarioLogado.TemPermissao( DM.iCdPessoaLogado, 'Academico.alteraSenhas', npAlterar, false ) and enable;
      end;
   end;
end;

procedure Tfrm_Fornecedores.pgPessoaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if (tblPessoa.State in [dsInsert, dsEdit]) then
   begin
      ShowMessage('Salve  as alterações antes de passar para a próxima guia');
      AllowChange := False;
   end;
end;

{ gradeContatoKeyDown }


procedure Tfrm_Fornecedores.dsPessoaStateChange(Sender: TObject);
{ Mudança de Estado - Inclusão - Alteração }
Var
   EstaEditando : Boolean;
begin

   if (tblPessoa.State = dsInsert) OR (qyPlanoFornecedor.State = dsInsert) Then
	 if not DM.UsuarioLogado.TemPermissao( iPermissao, npIncluir, True ) then Begin
	    tblPessoa.Cancel;
      qyPlanoFornecedor.Cancel;
	    Exit;
	 End;

   if (tblPessoa.State = dsEdit) OR (qyPlanoFornecedor.State = dsEdit) Then
	 if not DM.UsuarioLogado.TemPermissao( iPermissao, npAlterar, True ) then Begin
	    tblPessoa.Cancel;
      qyPlanoFornecedor.Cancel;
	    Exit;
	 End;

      { Ativar/Desativar Botões conforme o modo de Edição da Tabela }
      EstaEditando := ( tblPessoa.State in [dsEdit, dsInsert] ) OR ( qyPlanoFornecedor.State in [dsEdit, dsInsert] ) ;

      // Colocar as duas tabelas em modo de edição

      btIncluir_Pessoa.Enabled  := not EstaEditando;
      btAlterar_Pessoa.Enabled  := not EstaEditando;
      btExcluir_Pessoa.Enabled  := not EstaEditando;
      btBuscar_Pessoa.Enabled   := not EstaEditando;
      btFechar_Pessoa.Enabled   := not EstaEditando;

      btSalvar_Pessoa.Enabled   := EstaEditando;
      btCancelar_Pessoa.Enabled := EstaEditando;

   { Verificar contatos para cadastrar }

end;

procedure Tfrm_Fornecedores.edLoginKeyPress(Sender: TObject; var Key: Char);
begin
   tblPessoa.Edit();
end;

procedure Tfrm_Fornecedores.edSenha1KeyPress(Sender: TObject; var Key: Char);
begin
   tblPessoa.Edit();
end;

procedure Tfrm_Fornecedores.edSenha2KeyPress(Sender: TObject; var Key: Char);
begin
   tblPessoa.Edit();
end;

{ dsPessoaStateChange }

procedure Tfrm_Fornecedores.tblContatoPessoaBeforePost(DataSet: TDataSet);
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

procedure Tfrm_Fornecedores.tblContatoPessoaBeforeScroll(DataSet: TDataSet);
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

procedure Tfrm_Fornecedores.tblContatoPessoaCalcFields(DataSet: TDataSet);
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

procedure Tfrm_Fornecedores.tblContatoPessoads_observacaoChange(Sender: TField);
begin
   tblContatoPessoa.Post;
end;

procedure Tfrm_Fornecedores.tblContatoPessoaNewRecord(DataSet: TDataSet);
begin
   tblContatoPessoacd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
   tblContatoPessoacd_contato.AsInteger := 1; // Telefone Residencial
end;

procedure Tfrm_Fornecedores.tblPessoaAfterInsert(DataSet: TDataSet);
{ Após inserir uma pessoa }
begin

   { Colocar Valores Padrões - Futuramente, pegar em Tabela de Parametros }
   tblPessoads_nacionalidade.AsString := 'BRASILEIRA';
   tblPessoads_pais.AsString := '';
   tblPessoads_pais_nascimento.AsString := 'BRASIL';
   tblPessoatp_pessoa.AsString := 'J';

   tblPessoadt_cadastro.AsString := DateToStr(DataHoje);

end; procedure Tfrm_Fornecedores.tblPessoaAfterOpen(DataSet: TDataSet);
begin
  qyPlanoFornecedor.Close();
  qyPlanoFornecedor.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
  qyPlanoFornecedor.ParamByName('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
  qyPlanoFornecedor.Open();
end;

{ tblPessoaAfterInsert } 


procedure Tfrm_Fornecedores.tblPessoaNewRecord(DataSet: TDataSet);
begin
  tblPessoacd_pessoa.AsInteger := DM.NovoCodigoPessoa( 'Local.CadastroFornecedor' );

  { Observações Padrões }

  tblPessoads_observacao.AsString := DM.variavel_parametro('pessoa_observacao_padrao');

  qyPlanoFornecedor.Close();
  qyPlanoFornecedor.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
  qyPlanoFornecedor.ParamByName('cd_coligada').AsInteger := DM.UsuarioLogado.ColigadaLogada;
  qyPlanoFornecedor.Open();



end; { tblPessoaNewRecord }


procedure Tfrm_Fornecedores.tblPessoaBeforePost(DataSet: TDataSet);
{ Antes de Confirmar }
begin

  { Efetuar a Validação do CPF }
  if (dbCpfCnpj.DataField = 'ds_cpf') AND (not ValidaCPF( tblPessoads_cpf.AsString )) AND (tblPessoads_cpf.AsString <> '00000000000') then begin
      Mensagem( 'CPF informado é inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      dbCpfCnpj.SetFocus;
      Abort;
  end
  else if (dbCpfCnpj.DataField = 'ds_cnpj') AND (not ValidaCNPJ( tblPessoads_cnpj.AsString )) AND (tblPessoads_cnpj.AsString <> '00000000000000') then begin
      Mensagem( 'CNPJ informado é inválido.', Application.Title, MB_OK + MB_ICONSTOP );
      dbCpfCnpj.SetFocus;
      Abort;
  end;

  if tblPessoatp_pessoa.AsString = 'J' then begin
    tblPessoads_cpf.AsString := '';
  end
  else begin
    tblPessoads_cnpj.AsString := '';
  end;

  Self.alteraLogin(edLogin, edSenha1, edSenha2, loginAntigo, tblPessoa);

  { Gravar nome sem acento para BUSCA }
  tblPessoanm_sem_acento.AsString := SemAcento( tblPessoanm_pessoa.AsString );

  { Data de Revisão = Data de Hoje }

  { Registrar Funcionário que alterou o cadastro }
   //tblPessoacd_usuario.AsInteger := DM.iCdPessoaLogado;

   if tblPessoa.State = dsEdit then
   begin

      tblPessoadt_revisao.AsDateTime := DM.DataAtual();
      { Registrar Funcionário que alterou o cadastro }

   end;
   
   tblPessoacd_pessoa_alteracao.AsInteger :=  DM.iCdPessoaLogado;

   if tblPessoa.State = dsInsert then
   begin

      if tblPessoads_login.AsString = '' then
      begin
         tblPessoads_login.AsString := tblPessoacd_pessoa.AsString;
      end;

      if tblPessoads_senha.AsString = '' then
      begin
         tblPessoads_senha.AsString := MD5Print(MD5String(tblPessoads_cnpj.AsString));
      end;

   end;

end; { tblPessoaBeforePost } 


procedure Tfrm_Fornecedores.btIncluir_PessoaClick(Sender: TObject);
{ Inserir uma nova Pessoa }
begin
  if not tblPessoa.Active then
  Begin 
     { Selecionar as pessoas alteradas nos últimos 2 dias }
     tblPessoa.Close;
     tblPessoa.SQL.Text := 'SELECT * FROM PESSOAS WHERE CD_PESSOA = 9999999';
     tblPessoa.Open;
     tblContatoPessoa.Open;
     qyAreasAtuacao.Open;
  End;

   pgPessoa.ActivePageIndex := 0;
   txtResponsavelFinanceiro.Clear;
   tblPessoa.Insert;
   dbNome.SetFocus;

   tblContatoPessoa.Close;
   tblContatoPessoa.ParamByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
   tblContatoPessoa.Open;
end;

procedure Tfrm_Fornecedores.btnAlterarObsClick(Sender: TObject);
begin
   qryObsGerais.Edit();
end;

procedure Tfrm_Fornecedores.btnCancelarObsClick(Sender: TObject);
begin
   qryObsGerais.Cancel();
end;

procedure Tfrm_Fornecedores.btnSalvarObsClick(Sender: TObject);
begin
   qryObsGerais.ParamByName('cd_pessoa').AsInteger := tblPessoa.FieldByName('cd_pessoa').AsInteger;
   qryObsGerais.Post();
end;

{ btIncluir_PessoaClick } 


procedure Tfrm_Fornecedores.btAlterar_PessoaClick(Sender: TObject);
{ Altear a Pessoa Atual }
begin

   pgPessoa.ActivePageIndex := 0;
   tblPessoa.Edit;
   dbNome.SetFocus;
   
end; { btAlterar_PessoaClick }


procedure Tfrm_Fornecedores.btExcluir_PessoaClick(Sender: TObject);
const
   SCapConfirm = 'Confirmação';
   SMsgConfirm = 'Tem certeza que deseja excluir a pessoa selecionada?';
   SMsgHasObs =
      'Existem observações gerenciais vinculadas a este cadastro.'#13 +
      'A exclusão deste registro implica na exclusão de todas as observações a ele vinculadas.'#13#13 +
      'Deseja realmente confirmar a exclusão?';
   MsgFlags = MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2;
begin

   // Verifica se o usuário possui permissão para realizar a exclusão
   if DM.UsuarioLogado.TemPermissao(2027, npExcluir, True) and
      DM.UsuarioLogado.TemPermissao(iPermissao, npExcluir, True) then
   begin
   
      // Solicita a confirmação do usuário para realizar a exclusão
      if MessageBox(Handle, PChar(SMsgConfirm), PChar(SCapConfirm), MsgFlags) = ID_YES then
      begin

         // Somente realiza a exclusão se não possuir matrícula
         if not Tem_matricula(tblPessoacd_pessoa.AsInteger) then
         begin

            // Se possui observações vinculadas solicita a confirmação do
            // usuário para realizar a exclusão de todas as observações
            if (not TfObservacoes.HasObservations(tblPessoacd_pessoa.AsInteger)) or
               (MessageBox(Handle, PChar(SMsgHasObs), PChar(SCapConfirm), MsgFlags) = ID_YES) then
            begin
               TfObservacoes.ClearObservations(tblPessoacd_pessoa.AsInteger);
               qryDeleteContato.ParamByName('cd_pessoa').AsString := tblPessoacd_pessoa.AsString;
               tblPessoa.Delete;
               txtResponsavelFinanceiro.Clear;
               qryDeleteContato.ExecSQL;
               tblContatoPessoa.Refresh;
            end;
         end;
      end;
   end;
      
end;

procedure Tfrm_Fornecedores.btSalvar_PessoaClick(Sender: TObject);
var
   salva, bUsaResponsavel, camposValidos : Boolean;
   qtdEmailsCadastrados : Integer;
begin
   if tblPessoa.State in [dsInsert, dsEdit] then begin
       if (pgPessoa.ActivePage = TabSheet1) then
       begin
          DBEdit2.SetFocus;
          dbNome.SetFocus;
       end
       else
       begin
          Panel4.SetFocus;
          dbObs.SetFocus;
       end;

       if not(DM.CamposObrigatoriosPreenchidos(self, pgPessoa.ActivePage.Name)) then
          exit;

       if verificaDuplicidadeCpfCnpj(DBRadioGroup1.ItemIndex) then
       begin
         exit;
       end;

      if trim(dbCpfCnpj.Text) = '' then
         tblPessoads_cpf.Value := '';

      { o bloco abaixo foi comentado pois o processo de salvar contato não se dará no botão salvar da tela e sim em cada edição de contato. }
      {
      if tblContatoPessoa.State in [dsInsert, dsEdit] then
      begin
        tblContatoPessoa.Post;
        tblContatoPessoa.ApplyUpdates;
      end;
      }

       tblContatoPessoa.First;
       while not tblContatoPessoa.Eof do
       begin
          if ( tblContatoPessoacd_contato.AsInteger = 4 ) AND ( Trim(tblContatoPessoads_contato.AsString) <> EmptyStr ) then
             Inc(qtdEmailsCadastrados);

          tblContatoPessoa.Next;
       end;

       if ( qtdEmailsCadastrados = 0 ) AND ( DM.variavel_parametro('email_obrigatorio') = 'S' ) then
       begin
          verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
          tblContatoPessoa.Close;
          tblContatoPessoa.Open;
          Mensagem('O preenchimento de um contato do tipo e-mail é obrigatório.', '', MB_OK + MB_ICONEXCLAMATION, Handle);
          Abort;
       end;

       if not tblPessoa.EOF Then begin
         tblContatoPessoa.Close();
         tblContatoPessoa.Open();
      end;

      tblPessoa.Post;
      
   end;

  if qyPlanoFornecedor.State in [dsInsert, dsEdit] then begin
    qyPlanoFornecedor.Post;
  end;

  if not tblPessoa.EOF Then begin
     tblContatoPessoa.Close();
     verificar_contatos_padroes(tblPessoacd_pessoa.AsInteger);
     tblContatoPessoa.Open();
  end;

  if tblContatoPessoa.State in [dsInsert, dsEdit] then
  begin
    tblContatoPessoa.Post;
    tblContatoPessoa.ApplyUpdates;
  end;

end;

procedure Tfrm_Fornecedores.buscaRespFinan(cd_resp_finan: integer);
var
   qyRespFinan : TUMZQuery;
begin
   if cd_resp_finan <> 0 then
   begin
      DM.CriarConsulta( qyRespFinan );
      qyRespFinan.Close;
      qyRespFinan.SQL.Clear;
      qyRespFinan.SQL.Text := 'SELECT nm_pessoa FROM pessoas WHERE cd_pessoa = :cd_resp_finan';
      qyRespFinan.ParamByName('cd_resp_finan').AsInteger := cd_resp_finan;
      qyRespFinan.Open;

      nm_resp_finan                 := qyRespFinan.FieldByName('nm_pessoa').AsString;
      txtResponsavelFinanceiro.Text := nm_resp_finan;

      FreeAndNil( qyRespFinan );
   end;
end;

procedure Tfrm_Fornecedores.DBGrid1CellClick(Column: TColumn);
begin
   if tblPessoa.State <> dsBrowse then
   begin
      tblPessoa.Post;
      tblPessoa.Edit;
   end;
end;

procedure Tfrm_Fornecedores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
   qAux : TUMZQuery;
begin
  { Apagar o registro de contato quando pressionar DEL }

  case key of
     VK_F1 : PrincipalForm.confSobreClick( nil );
     VK_F2 : if btIncluir_Pessoa.Enabled then btIncluir_PessoaClick( nil );
     VK_F3 : if btAlterar_Pessoa.Enabled then btAlterar_PessoaClick( nil );
     VK_F9 : if btExcluir_Pessoa.Enabled then btExcluir_PessoaClick( nil );
     VK_F5 : if btSalvar_Pessoa.Enabled then btSalvar_PessoaClick( nil );
     VK_F6 : if btCancelar_Pessoa.Enabled then btCancelar_PessoaClick( nil );
     VK_F8 : if btBuscar_Pessoa.Enabled then btBuscar_PessoaClick( nil );
     VK_F12 : if btFechar_Pessoa.Enabled then btFechar_PessoaClick( nil );
   end;
end;

{ btSalvar_PessoaClick }


procedure Tfrm_Fornecedores.btCancelar_PessoaClick(Sender: TObject);
{ Cancelar as Alterações do cadastro}
begin
   txtResponsavelFinanceiro.Text := nm_resp_finan;
   tblPessoa.Cancel();
   qyPlanoFornecedor.Cancel();

   if ( tblContatoPessoa.State in [dsEdit, dsInsert] ) then
   begin
      tblContatoPessoa.Close();
   end;
end;

procedure Tfrm_Fornecedores.btBuscar_PessoaClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

  resultado := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

  if resultado.filtrado then
  Begin
      tblPessoa.CLose;

      tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = '+
         IntToStr(resultado.cd_pessoa);

      tblPessoa.Open;
      qyAreasAtuacao.Open;

      // Carrega as informações referentes aos contatos
      tblContatoPessoa.Close;
      tblContatoPessoa.ParamByName('cd_pessoa').AsInteger := resultado.cd_pessoa;
      tblContatoPessoa.Open;
      tblContatoPessoa.Edit;
      
      Self.buscaRespFinan( tblPessoacd_resp_finan.AsInteger );
  End;

end;


procedure Tfrm_Fornecedores.tblPessoaAfterPost(DataSet: TDataSet);
{ Depois de Confirmar }
Var
   codigoAtual : Integer;
begin

   codigoAtual := tblPessoacd_pessoa.AsInteger;
   tblPessoa.Close;
   tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + IntToStr(codigoAtual);
   tblPessoa.Open;

   if tblContatoPessoa.IsEmpty then begin

//      tblPessoa.Edit();
      tblContatoPessoa.Insert;
      tblContatoPessoacd_pessoa.AsInteger := tblPessoacd_pessoa.AsInteger;
      tblContatoPessoacd_contato.AsInteger := 2;  // telefone comercial;

   end;


end; { tblPessoaAfterPost }


procedure Tfrm_Fornecedores.dbNomeKeyPress(Sender: TObject; var Key: Char);
{ Avançar com ENTER }
begin

  if key = #13 Then
  Begin
     SelectNext(Sender as TWinControl, True, True);
     Key := #0;
  End;

end; { dbNomeKeyPress }
 

procedure Tfrm_Fornecedores.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure Tfrm_Fornecedores.gradeContatoCellClick(Column: TColumn);
begin
   if tblPessoa.State <> dsBrowse then
   begin
      tblPessoa.Post;
      tblContatoPessoa.ApplyUpdates;
      tblPessoa.Edit;
   end;
   tblPessoa.Edit;
end;

procedure Tfrm_Fornecedores.gradeContatoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   medCampoContato.Visible := false;
   if ( gdSelected IN State ) and
      (Column.FieldName = 'ds_contato_formatado') then
   begin
      medCampoContato.Top := Rect.Top + gradeContato.Top;
      medCampoContato.Left := gradeContato.Left + Rect.Left;
      medCampoContato.Width := Rect.Right - Rect.Left - 2;
      medCampoContato.Height := Rect.Bottom - Rect.Top - 2;
      medCampoContato.Visible := true;
   end;
end;

procedure Tfrm_Fornecedores.gradeContatoEnter(Sender: TObject);
begin
   if ( tblContatoPessoa.State <> dsInsert ) then
   begin
      tblPessoa.Edit;
   end;
end;

procedure Tfrm_Fornecedores.gradeContatoExit(Sender: TObject);
begin
   if tblContatoPessoa.State in [dsEdit, dsInsert] then
   Begin
       try
          tblContatoPessoa.Post;
       except
          tblContatoPessoa.Cancel;
       end;
   End;
   tblcontatoPessoa.ApplyUpdates;
   tblContatoPessoa.Close;
   tblContatoPessoa.Open;
   qyAreasAtuacao.Open;
end;

function Tfrm_Fornecedores.Tem_matricula(codigo: integer): boolean;
Var
  sMsg : String;
begin

   result := false;

   sMsg := 'Não é possível excluir esta pessoa pelo(s) seguinte(s) motivo(s): ' + CHR(13) + CHR(13);

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select codigoaluno from matriculas where codigoaluno = :codigo');
   qyTemp1.ParamByName('codigo').AsInteger := codigo;
   qyTemp1.Open;

   if not qyTemp1.eof then begin
     result := true;
     sMsg := sMsg + ' - Existem matrículas relacionadas a este cadastro.' + CHR(13);
   end;


   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select codigoaluno from mensalidades where codigoaluno = :codigo');
   qyTemp1.ParamByName('codigo').AsInteger := codigo;
   qyTemp1.Open;

   if not qyTemp1.eof then begin
     result := true;
     sMsg := sMsg + ' - Existem títulos relacionados no contas a receber. ' + CHR(13);
   end;

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select professor from turmasprofessores where professor = :codigo');
   qyTemp1.ParamByName('codigo').AsInteger := codigo;
   qyTemp1.Open;

   if not qyTemp1.eof then begin
     result := true;
     sMsg := sMsg + ' - Existem turmas relacionadas a este professor.' + CHR(13);
   end;

   qyTemp1.Close;
   qyTemp1.SQL.Clear;
   qyTemp1.SQL.Add('select cd_pessoa from fin_contas_pagar where cd_pessoa = :codigo');
   qyTemp1.ParamByName('codigo').AsInteger := codigo;
   qyTemp1.Open;

   if not qyTemp1.eof then begin
     result := true;
     sMsg := sMsg + ' - Existem títulos relacionados no contas a pagar.' + CHR(13);
   end;

   if result = true then begin
      Mensagem(sMsg, 'Atenção', MB_OK + MB_ICONWARNING);
   end;
end;

procedure Tfrm_Fornecedores.ToolButton3Click(Sender: TObject);
begin
   if not tblPessoa.IsEmpty then
      TfObservacoes.ShowObservations(Self, tblPessoacd_pessoa.AsInteger,
         okSuplier)
   else
      Mensagem('Selecione um fornecedor para visualizar as observações.',
         'Atenção', MB_ICONINFORMATION + MB_OK, Handle);
end;

function Tfrm_Fornecedores.validaCNPJ(numCNPJ: String): boolean;
var
  cnpj: string;
  dg1, dg2: integer;
  x, total: integer;
  ret: boolean;
begin
   ret:=False;
   cnpj:='';

   if Length(numCNPJ) = 18 then
      if (Copy(numCNPJ,3,1) + Copy(numCNPJ,7,1) + Copy(numCNPJ,11,1) + Copy(numCNPJ,16,1) = '../-') then
         begin
            cnpj:=Copy(numCNPJ,1,2) + Copy(numCNPJ,4,3) + Copy(numCNPJ,8,3) + Copy(numCNPJ,12,4) + Copy(numCNPJ,17,2);
            ret:=True;
         end;

      if Length(numCNPJ) = 14 then
      begin
         cnpj:=numCNPJ;
         ret:=True;
      end;

      if ret then
      begin
         try
            total:=0;
            for x:=1 to 12 do
            begin
               if x < 5 then
                  Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
               else
                  Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
               end;

               dg1:=11 - (total mod 11);

               if dg1 > 9 then
                  dg1:=0;
                  total:=0;

               for x:=1 to 13 do
               begin
                  if x < 6 then
                     Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
                  else
                     Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
               end;

               dg2:=11 - (total mod 11);

               if dg2 > 9 then
                  dg2:=0;

               if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
                  ret:=True
               else
                  ret:=False;
         except
            ret:=False;
         end;

         case AnsiIndexStr( cnpj,
               ['00000000000000','11111111111111','22222222222222','33333333333333','44444444444444',
               '55555555555555','66666666666666','77777777777777','88888888888888','99999999999999']
            ) of 0..9:  ret:=False;
         end;

      end;
   ValidaCNPJ:=ret;
end;

function Tfrm_Fornecedores.verificaDuplicidadeCpfCnpj(tipo: integer): Boolean;
var
   qryVerificaDuplicidade: TUMZQuery;
   campo: String;
   strAux: String;
begin                        
   result := false;
   campo := ' AND ds_cpf = ' + tblPessoads_cpf.AsString;
   if ( tipo = 1 ) then
   begin
      campo := ' AND DS_CNPJ = ' + QuotedStr(dbCpfCnpj.Text);
   end;

   strAux := stringReplace(dbCpfCnpj.Text, '0', '', [rfReplaceAll]);
   DM.CriarConsulta(qryVerificaDuplicidade);
   if ( trim(strAux) <> '' ) then
   begin
       qryVerificaDuplicidade.Close();
       qryVerificaDuplicidade.SQL.Text := ' SELECT                              '+
                                          '    cd_pessoa, nm_pessoa             '+
                                          ' FROM                                '+
                                          '    pessoas                          '+
                                          ' WHERE                               '+
                                          '    cd_pessoa <> ' + tblPessoacd_pessoa.AsString +
                                           campo;
       qryVerificaDuplicidade.Open();
       if not qryVerificaDuplicidade.Eof and not(qryVerificaDuplicidade.FieldByName('cd_pessoa').AsInteger = tblPessoacd_pessoa.AsInteger ) then         begin
         Mensagem('Atenção, existe outra pessoa com o mesmo CPF/CNPJ: ' + CHR(13) +
                    'Nome: ' + qryVerificaDuplicidade.FieldByName('nm_pessoa').AsString + CHR(13) +
                    'Código: ' + qryVerificaDuplicidade.FieldByName('cd_pessoa').AsString, 'Atenção', MB_OK + MB_ICONWARNING);
         result := true;
       end;
    end;
end;

procedure Tfrm_Fornecedores.verificar_contatos_padroes(CodAluno: Integer);
begin
with DM.qyAux2 do begin
   Close();
   Params.Clear();
   SQL.Text :=
   ' SELECT ' + IntToStr(CodAluno) + ' as codaluno, ct.cd_contato, '''' as dscontato FROM contatos_tipos ct ' +
   ' LEFT join contatos_pessoas cp ON (ct.cd_contato = cp.cd_contato AND cp.cd_pessoa = ' + IntToStr(CodAluno) + ') '+
   ' WHERE cp.cd_pessoa is null AND ct.sn_padrao = ''S'' ';
   Open();
   tblContatosPadroes.Close();
   tblContatosPadroes.SQL.Clear();
   tblContatosPadroes.Params.Clear();
   tblContatosPadroes.SQL.Text :=
   'INSERT INTO contatos_pessoas (cd_pessoa, cd_contato, ds_contato) '+
   'VALUES (:pessoa, :contato, :dscontato)';
   while not Eof do begin
      tblContatosPadroes.ParamByName('pessoa').AsInteger := FieldByName('codaluno').AsInteger;
      tblContatosPadroes.ParamByName('contato').ASInteger := FieldByName('cd_contato').AsInteger;
      if( FieldByName('dscontato').AsString <> '')then
      begin
         tblContatosPadroes.ParamByName('dscontato').asString := FieldByName('dscontato').AsString;
      end
      else
      begin
         tblContatosPadroes.ParamByName('dscontato').asString := ' ';
      end;

      tblContatosPadroes.ExecSQL();
      Next();
   end;
   tblContatosPadroes.Close();
   tblContatosPadroes.SQL.Clear();
   tblContatosPadroes.Params.Clear();
   Close();
 end;
end;

procedure Tfrm_Fornecedores.dbNomeExit(Sender: TObject);
begin
   { Verificar se existe algum nome cadastrado }

   if tblPessoa.State <> dsInsert then
      Exit;

   Dm.qyAux1.Close;
   Dm.qyAux1.SQL.Clear;
   DM.qyAux1.SQL.Add('select cd_pessoa, nm_pessoa, ds_cpf, nm_pai from pessoas where nm_pessoa = :nome');
   Dm.qyAux1.ParamByName('nome').AsString := tblPessoanm_pessoa.AsString;
   Dm.qyAux1.Open;

   while not Dm.qyAux1.Eof do
   Begin
      if Mensagem('Existe uma pessoa com o mesmo nome cadastrada no sistema.' + chr(13) +
                  '   Nome : ' + DM.qyAux1.FieldByName('nm_pessoa').AsString + '  (' + DM.qyAux1.FieldByName('cd_pessoa').AsString + ')' + chr(13) +
                  '   CPF : ' + DM.qyAux1.FieldByName('ds_cpf').AsString + chr(13) +
                  '   Nome do Pai : ' + DM.qyAux1.FieldByName('nm_pai').AsString + chr(13) + chr(13) +
                  'Deseja alterar este cadastro? ',  'Confirmação', MB_YESNO + MB_ICONQUESTION )
      = mrYes Then
      Begin
          tblPessoa.Cancel;
          tblPessoa.CLose;
          tblPessoa.Sql.Text := 'Select * from pessoas Where cd_pessoa = ' + Dm.qyAux1.FieldByName('cd_pessoa').AsString;
          tblPessoa.Open;
          tblContatoPessoa.Open;
          qyAreasAtuacao.Open;

          Exit;
      End;


      DM.qyAux1.Next;
   End;

end;

procedure Tfrm_Fornecedores.sbCepClick(Sender: TObject);
begin

   if tblPessoa.State = dsInactive then
   begin
      btIncluir_PessoaClick(nil)
   end
   else if tblPessoa.State = dsBrowse then
   begin
      btAlterar_PessoaClick(nil);
   end;

   if not Assigned(frmSelCep) then
      Application.CreateForm(TfrmSelCep, frmSelCep);
   frmSelCep.ShowModal;

   if frmSelCep.flgSearch then
   begin
      tblPessoa.FieldByName('ds_cep').AsString := frmSelCep.qyCep.FieldByName('ds_cep').AsString;
      tblPessoa.FieldByName('ds_cidade').AsString := frmSelCep.qyCep.FieldByName('nm_cidade').AsString;
      tblPessoa.FieldByName('ds_estado').AsString := frmSelCep.qyCep.FieldByName('ds_uf').AsString;
      tblPessoa.FieldByName('ds_bairro').AsString := frmSelCep.qyCep.FieldByName('nm_bairro').AsString;
      tblPessoa.FieldByName('ds_logradouro').AsString := frmSelCep.qyCep.FieldByName('nm_logradouro').AsString;
      tblPessoa.FieldByName('ds_pais').AsString := frmSelCep.qyCep.FieldByName('ds_pais').AsString;
   end;
end;

procedure Tfrm_Fornecedores.sbContaClick(Sender: TObject);
begin
  // Seleção de Plano de Contas
  if not (qyPlanoFornecedor.State in [dsInsert, dsEdit]) then begin
     qyPlanoFornecedor.Edit;
  end;
  
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyPlanoFornecedorcd_conta.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;

end;

procedure Tfrm_Fornecedores.sbMaisInformacoesClick(Sender: TObject);
begin
  if tblPessoacd_pessoa.AsInteger = 0 then
  begin
    Mensagem('Você precisa selecionar um fornecedor para poder executar esta ação',  'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  { Apresentar a tela de campos adicionais }
  Application.CreateForm(Tfrm_pessoas_adicional, frm_pessoas_adicional);

  if not frm_Pessoas_adicional.Montar_Dados('F', tblPessoacd_pessoa.AsInteger)
  then
    Mensagem('Não existe informações adicionais para este cadastro.',  'Atenção', MB_OK + MB_ICONWARNING);

  FreeAndNil(frm_pessoas_adicional);
end;

procedure Tfrm_Fornecedores.sbSelecionaResponsavelClick(Sender: TObject);
var
   cd_resp_finan  : integer;
   resultado: TResultadoFiltroPessoa;
begin

   if tblPessoa.State = dsInactive then
   begin
      btIncluir_PessoaClick(nil)
   end
   else if tblPessoa.State = dsBrowse then
   begin
      btAlterar_PessoaClick(nil);
   end;

   nm_resp_finan      := '';

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if resultado.filtrado then
   begin
      cd_resp_finan  := resultado.cd_pessoa;
      nm_resp_finan  := resultado.nm_pessoa;
   end;

   //atribui o retorno aos campos
   if  (cd_resp_finan <> 0) and (nm_resp_finan <> '')  then
   begin
      tblPessoa.Edit;

      tblPessoa.FieldByName('cd_resp_finan').AsInteger := cd_resp_finan;
      txtResponsavelFinanceiro.Text := nm_resp_finan;
   end
   else
   begin
      tblPessoa.FieldByName('cd_resp_finan').Clear;
      nm_resp_finan := '';
      txtResponsavelFinanceiro.Clear;
   end;
end;

procedure Tfrm_Fornecedores.SpeedButton3Click(Sender: TObject);
begin
  // Seleção de Plano de Contas
  if not (qyPlanoFornecedor.State in [dsInsert, dsEdit]) then begin
     qyPlanoFornecedor.Edit;
  end;
  
  frm_SelConta.ShowModal;

  if frm_SelConta.flgSearch then begin

        qyPlanoFornecedorcd_conta_passivo.AsInteger := frm_SelConta.qyPlanosContascd_conta.AsInteger;

  end;
end;

procedure Tfrm_Fornecedores.AdicionarContato1Click(Sender: TObject);
begin
    gradeContato.SetFocus;
    tblContatoPessoa.Insert;
end;

procedure Tfrm_Fornecedores.ExcluirContato1Click(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir o contato ' + tblContatoPEssoadescContato.AsString +' ?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION )
   = mrYes then
   Begin
       tblContatoPessoa.Delete;
   End;
end;

procedure Tfrm_Fornecedores.dsContatoPessoaDataChange(Sender: TObject;
  Field: TField);
begin
   qryContatosTipos.Close;
   qryContatosTipos.ParamByName('contato').AsString := tblContatoPessoacd_contato.AsString;
   qryContatosTipos.Open;

   medCampoContato.EditMask := '';
   medCampoContato.Text := tblContatoPessoads_contato.AsString;
   medCampoContato.EditMask := qryContatosTiposds_mascara.AsString;
end;

procedure Tfrm_Fornecedores.dsContatoPessoaStateChange(Sender: TObject);
begin
   valorCampoContatoComMascara := Trim(tblContatoPessoads_contato.AsString);
   valorCampoContatoSemMascara := retiraMascara(Trim(tblContatoPessoads_contato.AsString));

   if tblContatoPessoa.State = dsInactive then
   begin
      medCampoContato.Visible := False;
   end;
end;

procedure Tfrm_Fornecedores.dsObsGeraisStateChange(Sender: TObject);
begin
   if qryObsGerais.State in [dsEdit] then
   begin
      btnAlterarObs.Enabled := False;

      btnSalvarObs.Enabled := True;
      btnCancelarObs.Enabled := True;
   end;

   if qryObsGerais.State in [dsBrowse] then
   begin
      btnSalvarObs.Enabled := False;
      btnCancelarObs.Enabled := False;

      btnAlterarObs.Enabled := True;
   end;
end;

procedure Tfrm_Fornecedores.dsPessoaDataChange(Sender: TObject;
  Field: TField);
var
   qryUsuarios: TUMZquery;
begin
   // Atualização do login e da senha
   if tblPessoa.State in [dsBrowse] then
   begin
      edLogin.Text := tblPessoa.FieldByName('ds_login').AsString;
      loginAntigo := edLogin.Text;

      edSenha1.Text := '*****';
      edSenha2.Text := '*****';

      if tblPessoatp_pessoa.AsString = 'F' then
      begin
         dbCpfCnpj.DataField := 'ds_cpf';
         dbInscriEstadual.Enabled := False;
         dbInscriEstadual.Color := clScrollBar;
      end
      else
      begin
         dbCpfCnpj.DataField := 'ds_cnpj';
         dbInscriEstadual.Enabled := True;
         dbInscriEstadual.Color := clWindow;
      end;
      qyAreasAtuacao.Close();
      qyAreasAtuacao.Open();


      //Atualiza os labels de Data de cadastro, data ultima alteração e usuário que fez a ultima alteração.
      if (Self.tblPessoadt_cadastro.asString <> '') then
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
end;                        

procedure Tfrm_Fornecedores.DBRadioGroup1Change(Sender: TObject);
begin
  if tblPessoa.State in [dsInsert,dsEdit] then begin
    if TDBRadioGroup( Sender ).ItemIndex = 0 then begin
      dbCpfCnpj.DataField := 'ds_cpf';
      dbInscriEstadual.Enabled := False;
      dbInscriEstadual.Color := clScrollBar;
    end
    else begin
      dbCpfCnpj.DataField := 'ds_cnpj';
      dbInscriEstadual.Enabled := True;
      dbInscriEstadual.Color := clWindow;
    end;
  end;
end;

procedure Tfrm_Fornecedores.Adicionarrea1Click(Sender: TObject);
begin
    grdAreasAtuacao.SetFocus;
    qyAreasAtuacao.Insert;
end;

procedure Tfrm_Fornecedores.alteraLogin(edLogin, edSenha, edRedgSenha: TEdit;
  sLoginAntigo: string; qyPaiResp: TUMZQuery);
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

procedure Tfrm_Fornecedores.Excluirrea1Click(Sender: TObject);
begin
   if Mensagem('Tem certeza que deseja excluir a área de atuação ' + qyAreasAtuacao.FieldByName('DS_NOMEAREAATUACAO').ASString +' ?',
       'Confirmação', MB_YESNO + MB_ICONQUESTION )
   = mrYes then
   Begin
       qyAreasAtuacao.Delete;
   End;
end;

procedure Tfrm_Fornecedores.qyAreasAtuacaoNewRecord(DataSet: TDataSet);
begin
   qyAreasAtuacaoCD_PESSOA.AsInteger := tblPessoacd_pessoa.AsInteger;
end;

procedure Tfrm_Fornecedores.qyPlanoFornecedorNewRecord(DataSet: TDataSet);
begin
   qyPlanoFornecedor.FieldByName('cd_pessoa').AsInteger := tblPessoacd_pessoa.AsInteger;
end;

function Tfrm_Fornecedores.retiraMascara(strComMascara: String): String;
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

function Tfrm_Fornecedores.retiraMascaraTelefone(strComMascara: String): String;
begin
   strComMascara  := stringReplace(strComMascara, '(', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, ')', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, '_', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, '-', '', [rfReplaceAll]);
   strComMascara  := stringReplace(strComMascara, ' ', '', [rfReplaceAll]);

   result := Trim(strComMascara);
end;

procedure Tfrm_Fornecedores.qyAreasAtuacaoAfterPost(DataSet: TDataSet);
begin
  qyAreasAtuacao.Close;
  qyAreasAtuacao.Open;
end;

procedure Tfrm_Fornecedores.tblPessoaBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2027, npAlterar, True ) then Abort;
end;

procedure Tfrm_Fornecedores.tblPessoaBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 2027, npIncluir, True ) then Abort;
end;

procedure Tfrm_Fornecedores.CMFocusChanged(var Message: TCMFocusChanged);
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

end.

