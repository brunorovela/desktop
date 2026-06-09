unit uCadCamposPessoas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImgList, DBCtrls, StdCtrls, Mask, Grids, DBGrids, ComCtrls,
  ToolWin, ExtCtrls, UZDataSet, DBTables, ZAbstractRODataset, ZAbstractDataset,
  UMLookupComboBox, Buttons, uFSelecionarAcao, ZSqlUpdate, UMComboBox,
  uItemCombo;

type
  TfrmCadCamposPessoas = class(TForm)
    pnPrincipal: TPanel;
    pnTopo: TPanel;
    pnConteudo: TPanel;
    pnDireita: TPanel;
    dbgCamposAdicionais: TDBGrid;
    pnEsquerda: TPanel;
    lblCampo: TLabel;
    lblDescricao: TLabel;
    lblNome: TLabel;
    lblOpcao: TLabel;
    lblOrdem: TLabel;
    lblTipoCampo: TLabel;
    cmTipoCampo: TComboBox;
    dbeOrdenacao: TDBEdit;
    dblNomeOpcao: TDBLookupComboBox;
    imgRodaPe: TImageList;
    dtcPessoasCampos: TDataSource;
    qyPessoasCampos: TUMZQuery;
    qyOpcoes: TUMZQuery;
    dtcOpcoes: TDataSource;
    qyPessoasCamposcd_campo: TSmallintField;
    qyPessoasCamposds_campo: TStringField;
    qyPessoasCamposds_campo_descricao: TStringField;
    qyPessoasCamposds_tipo: TStringField;
    qyPessoasCamposds_pessoa: TStringField;
    qyPessoasCamposnr_ordem: TSmallintField;
    dbeCodigo: TDBEdit;
    dbeNome: TDBEdit;
    dbeDescricao: TDBEdit;
    qyOpcoescd_opcao: TSmallintField;
    qyOpcoesds_opcao: TStringField;
    qyPessoasCamposcd_opcao: TSmallintField;
    qyPessoasCamposds_opcao: TStringField;
    cbTipoPessoa: TComboBox;
    Label1: TLabel;
    qyPessoasCamposds_categoria: TStringField;
    Label2: TLabel;
    qyPessoasCamposSN_ATIVO: TSmallintField;
    dbcksn_ativo: TDBCheckBox;
    pgMain: TPageControl;
    tsCategorias: TTabSheet;
    tsCampos: TTabSheet;
    qryCategorias: TUMZQuery;
    dsCategorias: TDataSource;
    qryCategoriascd_categoria: TIntegerField;
    qryCategoriascd_acao: TIntegerField;
    qryCategoriasnm_categoria: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    dbedNome: TDBEdit;
    pnRodaPe: TPanel;
    toolAcoes: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    btnSalvar: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    btIncluirCat: TToolButton;
    btAlterarCat: TToolButton;
    btExcluirCat: TToolButton;
    btSalvarCat: TToolButton;
    ToolButton9: TToolButton;
    btCancelarCat: TToolButton;
    btFecharCat: TToolButton;
    ToolButton12: TToolButton;
    sbBuscaAcao: TSpeedButton;
    edAcao: TEdit;
    cbCategorias: TUMComboBox;
    Label5: TLabel;
    dbeChave: TDBEdit;
    Label6: TLabel;
    qyPessoasCamposds_chave: TStringField;
    procedure qryCategoriasAfterInsert(DataSet: TDataSet);
    procedure cbCategoriasChange(Sender: TObject);
    procedure tsCamposShow(Sender: TObject);
    procedure dsCategoriasDataChange(Sender: TObject; Field: TField);
    procedure pgMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure sbBuscaAcaoClick(Sender: TObject);
    procedure tsCategoriasShow(Sender: TObject);
    procedure dsCategoriasStateChange(Sender: TObject);
    procedure btCancelarCatClick(Sender: TObject);
    procedure btSalvarCatClick(Sender: TObject);
    procedure btExcluirCatClick(Sender: TObject);
    procedure btAlterarCatClick(Sender: TObject);
    procedure btIncluirCatClick(Sender: TObject);
    procedure dblNomeOpcaoClick(Sender: TObject);
    procedure cbTipoPessoaChange(Sender: TObject);
    procedure dtcPessoasCamposStateChange(Sender: TObject);
    procedure dtcPessoasCamposDataChange(Sender: TObject; Field: TField);
    procedure cmTipoCampoChange(Sender: TObject);
    procedure dbeCodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
  private
    procedure carregaAcao(cd_acao: Integer);
    procedure carregaCategorias();
    function isExclusaoValida(): Boolean;
  public
  end;

var
  frmCadCamposPessoas: TfrmCadCamposPessoas;

implementation
uses General, uDM;
{$R *.dfm}

procedure TfrmCadCamposPessoas.btnAlterarClick(Sender: TObject);
begin
   qyPessoasCampos.Edit;
   dbeNome.SetFocus();
end;

procedure TfrmCadCamposPessoas.btnCancelarClick(Sender: TObject);
begin
   qyPessoasCampos.Cancel;
end;

procedure TfrmCadCamposPessoas.btnExcluirClick(Sender: TObject);
var
   qyVerificaExclusao : TUMZQuery;
begin
   if Mensagem('Tem certeza que deseja excluir o campo selecionado?','Confirmação', MB_YESNO + MB_ICONQUESTION) = mrNo Then
      exit;

   // Se Desejar excluir
   DM.CriarConsulta(qyVerificaExclusao);
   qyVerificaExclusao.SQL.Text:= 'SELECT COUNT(*) as qtd FROM pessoas_cadastro WHERE cd_campo = :cd_campo';
   qyVerificaExclusao.ParamByName('cd_campo').AsInteger := qyPessoasCamposcd_campo.AsInteger;
   qyVerificaExclusao.Open();

   if qyVerificaExclusao.FieldByName('qtd').AsInteger > 0 then
   begin
      Mensagem('Não foi possível excluir o campo '''+qyPessoasCamposds_campo.AsString+''', pois já existem cadastros com informações relacionadas a este campo. Favor utilizar a opção de campo Ativo\Inativo.','Aviso', MB_OK + MB_ICONEXCLAMATION);
      exit;
   end;

   // Passou por todas as verificações
   qyPessoasCampos.Delete;

   qyVerificaExclusao.Free();
end;

procedure TfrmCadCamposPessoas.btnIncluirClick(Sender: TObject);
begin
   dbeNome.SetFocus();
   qyPessoasCampos.Insert();
   cmTipoCampo.ItemIndex := 0;
   cbTipoPessoa.ItemIndex := -1;
   lblOpcao.Visible:= false;
   dblNomeOpcao.Visible:=false;
end;

procedure TfrmCadCamposPessoas.btnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadCamposPessoas.btnSalvarClick(Sender: TObject);
var
   iCodCampo: Integer;
begin
   iCodCampo:=0;

   if (cmTipoCampo.ItemIndex = 1) and ((dblNomeOpcao.Text = '') or (qyOpcoes.RecordCount = 0)) then begin
      Mensagem('Não foi possível salvar um campo do tipo SELEÇÃO, pois não foi escolhida nenhuma opção ou não existem opções disponíveis.', Application.Title, MB_OK + MB_ICONEXCLAMATION );
      exit;
   end;

   { Tipo de Pessoa }
   if cbTipoPessoa.Text = 'Aluno' then
      qyPessoasCamposds_pessoa.AsString := 'A' // Aluno
   else if cbTipoPessoa.Text = 'Fornecedor' then
      qyPessoasCamposds_pessoa.AsString := 'F' // Fornecedor
   else if cbTipoPessoa.Text = 'Pessoa' then
      qyPessoasCamposds_pessoa.AsString := 'P' // Pessoa
   else if cbTipoPessoa.Text = 'Ficha de Saúde' then
      qyPessoasCamposds_pessoa.AsString := 'S' // Ficha de Saúde
   else if cbTipoPessoa.Text = 'Planilha de contatos' then
      qyPessoasCamposds_pessoa.AsString := 'C' // Planilha de Contatos
   else if cbTipoPessoa.Text = 'Matrícula curso' then
      qyPessoasCamposds_pessoa.AsString := 'U' // Matricula Curso
   else if cbTipoPessoa.Text = 'Matrícula' then
      qyPessoasCamposds_pessoa.AsString := 'M'; // Matricula

   { Tipo de Campo }
   if cmTipoCampo.ItemIndex = 0 then
      qyPessoasCamposds_tipo.AsString := 'A'    // Texto
   else if cmTipoCampo.ItemIndex = 1 then
      qyPessoasCamposds_tipo.AsString := 'S'    // Seleção
   else if cmTipoCampo.ItemIndex = 3 then
      qyPessoasCamposds_tipo.AsString := 'U'    // Seleção Única
   else if cmTipoCampo.ItemIndex = 4 then
      qyPessoasCamposds_tipo.AsString := 'V'    // Seleção Multipla
   else if cmTipoCampo.ItemIndex = 5 then
      qyPessoasCamposds_tipo.AsString := 'N'    // Numérico
   else if cmTipoCampo.ItemIndex = 6 then
      qyPessoasCamposds_tipo.AsString := 'P'    // Busca de Pessoa
   else if cmTipoCampo.ItemIndex = 2 then
      qyPessoasCamposds_tipo.AsString := 'M'   // Memo
   else if cmTipoCampo.ItemIndex = 7 then
      qyPessoasCamposds_tipo.AsString := 'C'; // Seleção com chave

   if qyPessoasCampos.State in [dsEdit] then begin
      iCodCampo:=qyPessoasCamposcd_campo.AsInteger;
   end;

   { Caso o Tipo de Pessoa seja Ficha de Saúde, e a categoria está em branco...
     Então jogamos no campo categoria o text "Ficha de Saúde" como padrão }
   if ( cbTipoPessoa.Text = 'Ficha de Saúde' ) AND
      not( cbCategorias.ItemIndex > -1 ) then
   begin
      qyPessoasCamposds_categoria.AsString := 'Ficha de Saúde do Aluno';
   end;

   qyPessoasCampos.Post;

   qyPessoasCampos.close();
   qyPessoasCampos.open();

   if iCodCampo <> 0 then
   begin
      qyPessoasCampos.Locate('cd_campo',IntToStr(iCodCampo),[])
   end
   else
   begin
      qyPessoasCampos.Last();
   end;
end;

procedure TfrmCadCamposPessoas.carregaAcao(cd_acao: Integer);
var
   qryBuscaAcao: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qryBuscaAcao);

   qryBuscaAcao.SQL.Text :=
      ' SELECT '+
      '  ds_nome_acao '+
      ' FROM '+
      '  nu_modulos_acoes '+
      ' WHERE '+
      '  cd_acao = :cd_acao';

   qryBuscaAcao.ParamByName('cd_acao').AsInteger := cd_acao;
   qryBuscaAcao.Open;

   edAcao.Text := qryBuscaAcao.FieldByName('ds_nome_acao').AsString;
end;

procedure TfrmCadCamposPessoas.carregaCategorias;
var
   qryBuscaCategorias: TUMZReadOnlyQuery;
const
   SQL_BUSCA_CATEGORIAS =
      ' SELECT '+
      '  cd_categoria, '+
      '  nm_categoria '+
      'FROM '+
      '  pessoas_campos_categorias ';
begin
   DM.CriarConsulta(qryBuscaCategorias);

   qryBuscaCategorias.SQL.Text := SQL_BUSCA_CATEGORIAS;
   qryBuscaCategorias.Open;

   cbCategorias.Clear;

   while not(qryBuscaCategorias.Eof) do
   begin
      cbCategorias.AddItem(
         qryBuscaCategorias.FieldByName('nm_categoria').AsString,
         TItemCombo.Create(
            qryBuscaCategorias.FieldByName('cd_categoria').AsString,
            qryBuscaCategorias.FieldByName('nm_categoria').AsString
         )
      );

      qryBuscaCategorias.Next;                  
   end;
end;

procedure TfrmCadCamposPessoas.cbCategoriasChange(Sender: TObject);
begin
   if qyPessoasCampos.State in [dsInsert, dsEdit] then
   begin
      qyPessoasCamposds_categoria.AsString :=
         TItemCombo(cbCategorias.Items.Objects[cbCategorias.ItemIndex]).descricao;
   end;
end;

procedure TfrmCadCamposPessoas.cbTipoPessoaChange(Sender: TObject);
var
   iItemSelecionado: Integer;
begin
   if (not(qyPessoasCampos.State in [dsInsert,dsEdit]))then
   begin
      iItemSelecionado :=cbTipoPessoa.ItemIndex;
      qyPessoasCampos.Edit;
      cbTipoPessoa.ItemIndex := iItemSelecionado;
   end;
   if cbTipoPessoa.Text = 'Aluno' then
      qyPessoasCamposds_pessoa.AsString := 'A' // Aluno
   else if cbTipoPessoa.Text = 'Fornecedor' then
      qyPessoasCamposds_pessoa.AsString := 'F' // Fornecedor
   else if cbTipoPessoa.Text = 'Pessoa' then
      qyPessoasCamposds_pessoa.AsString := 'P' // Pessoa
   else if cbTipoPessoa.Text = 'Ficha de Saúde' then
      qyPessoasCamposds_pessoa.AsString := 'S' // Ficha de Saúde
   else if cbTipoPessoa.Text = 'Planilha de contatos' then
      qyPessoasCamposds_pessoa.AsString := 'C' // Planilha de contatos
   else if cbTipoPessoa.Text = 'Matrícula curso' then
      qyPessoasCamposds_pessoa.AsString := 'U' // Matricula Curso
   else if cbTipoPessoa.Text = 'Matrícula' then
      qyPessoasCamposds_pessoa.AsString := 'M'; // Matricula

end;

procedure TfrmCadCamposPessoas.cmTipoCampoChange(Sender: TObject);
const
   SQL_VERIFICA_CONTEUDO_TEXTO_MEMO = ''+
      'SELECT '+
      '  GROUP_CONCAT(pc.ds_conteudo SEPARATOR "") AS conteudo_texto, '+
      '  GROUP_CONCAT(pcm.ds_conteudo SEPARATOR "") AS conteudo_memo '+
      'FROM '+
      '  pessoas_campos_adicionais pca '+
      '  LEFT JOIN pessoas_cadastro pc ON (pca.CD_CAMPO = pc.cd_campo) '+
      '  LEFT JOIN pessoas_cadastro_memo pcm ON (pcm.cd_campo = pca.cd_campo) '+
      'WHERE '+
      '  pca.CD_CAMPO = :cd_campo';
var
   qryBuscaConteudoCampo: TUMZQuery;
begin
   if (not(qyPessoasCampos.State in [dsInsert,dsEdit]))then
   begin
      qyPessoasCampos.Edit;
   end;

   if (((qyPessoasCamposds_tipo.AsString = 'A') AND (cmTipoCampo.Text = 'MEMO'))) then
   begin

      DM.CriarConsulta(qryBuscaConteudoCampo);

      qryBuscaConteudoCampo.SQL.Text := SQL_VERIFICA_CONTEUDO_TEXTO_MEMO;

      qryBuscaConteudoCampo.ParamByName('cd_campo').AsInteger := qyPessoasCamposCD_CAMPO.AsInteger;

      qryBuscaConteudoCampo.Open;

      if ((qryBuscaConteudoCampo.FieldByName('conteudo_texto').AsString <> '')
         OR (qryBuscaConteudoCampo.FieldByName('conteudo_memo').AsString <> ''))  then
      begin
         ShowMessage('Você não pode alterar um campo de texto para memo!');
         cmTipoCampo.ItemIndex := 0;
      end;
      
   end;

   if (((qyPessoasCamposds_tipo.AsString = 'M') AND (cmTipoCampo.Text = 'TEXTO'))) then
   begin

      DM.CriarConsulta(qryBuscaConteudoCampo);

      qryBuscaConteudoCampo.SQL.Text := SQL_VERIFICA_CONTEUDO_TEXTO_MEMO;

      qryBuscaConteudoCampo.ParamByName('cd_campo').AsInteger := qyPessoasCamposCD_CAMPO.AsInteger;

      qryBuscaConteudoCampo.Open;

      if ((qryBuscaConteudoCampo.FieldByName('conteudo_texto').AsString <> '')
         OR (qryBuscaConteudoCampo.FieldByName('conteudo_memo').AsString <> ''))  then
      begin
         ShowMessage('Você não pode alterar um campo de memo para texto!');
         cmTipoCampo.ItemIndex := 2;
      end;
      
   end;


   if (cmTipoCampo.ItemIndex in [1, 7]) and (qyOpcoes.RecordCount >0) then begin
      dblNomeOpcao.Visible := true;
      lblOpcao.Visible := true;
   end
   else begin
      dblNomeOpcao.Visible := false;
      lblOpcao.Visible := false;
   end;

end;

procedure TfrmCadCamposPessoas.dbeCodigoChange(Sender: TObject);
begin
   if (qyPessoasCamposds_tipo.AsString ='A')  then
      cmTipoCampo.ItemIndex := 0
   else if (qyPessoasCamposds_tipo.AsString ='S')   then
      cmTipoCampo.ItemIndex := 1
   else if (qyPessoasCamposds_tipo.AsString ='U')   then
      cmTipoCampo.ItemIndex := 3
   else if (qyPessoasCamposds_tipo.AsString ='V')   then
      cmTipoCampo.ItemIndex := 4
   else if (qyPessoasCamposds_tipo.AsString ='N')   then
      cmTipoCampo.ItemIndex := 5
   else if (qyPessoasCamposds_tipo.AsString ='P')   then
      cmTipoCampo.ItemIndex := 6
   else if (qyPessoasCamposds_tipo.AsString ='C')   then
      cmTipoCampo.ItemIndex := 7
   else
      cmTipoCampo.ItemIndex := 2
end;

procedure TfrmCadCamposPessoas.dblNomeOpcaoClick(Sender: TObject);
begin
   if (not(qyPessoasCampos.State in [dsInsert,dsEdit]))then
   begin
      qyPessoasCampos.Edit
   end;
end;

procedure TfrmCadCamposPessoas.dsCategoriasDataChange(Sender: TObject;
  Field: TField);
begin
   if qryCategorias.State in [dsBrowse] then
   begin
      carregaAcao(qryCategoriascd_acao.AsInteger);
   end;
end;

procedure TfrmCadCamposPessoas.dsCategoriasStateChange(Sender: TObject);
begin
   btIncluirCat.Enabled := not(qryCategorias.State in [dsInsert, dsEdit]);
   btAlterarCat.Enabled := not(qryCategorias.State in [dsInsert, dsEdit]);
   btExcluirCat.Enabled := not(qryCategorias.State in [dsInsert, dsEdit]);

   btSalvarCat.Enabled := qryCategorias.State in [dsInsert, dsEdit];
   btCancelarCat.Enabled := qryCategorias.State in [dsInsert, dsEdit];
   sbBuscaAcao.Enabled := qryCategorias.State in [dsInsert, dsEdit];
end;

procedure TfrmCadCamposPessoas.dtcPessoasCamposDataChange(Sender: TObject;
  Field: TField);
var
   i: integer;
begin
   if (cmTipoCampo.ItemIndex in [1, 7]) and
      (qyOpcoes.RecordCount >0) then
   begin
      dblNomeOpcao.Visible := true;
      lblOpcao.Visible := true;
   end
   else
   begin
      dblNomeOpcao.Visible := false;
      lblOpcao.Visible := false;
   end;

   if qyPessoasCamposds_pessoa.AsString = 'A' then
      cbTipoPessoa.ItemIndex := 0
   else if qyPessoasCamposds_pessoa.AsString = 'F' then
      cbTipoPessoa.ItemIndex := 1
   else if qyPessoasCamposds_pessoa.AsString = 'S' then
      cbTipoPessoa.ItemIndex := 3
   else if qyPessoasCamposds_pessoa.AsString = 'C' then
      cbTipoPessoa.ItemIndex := 4
   else if qyPessoasCamposds_pessoa.AsString = 'U' then
      cbTipoPessoa.ItemIndex := 5
   else if qyPessoasCamposds_pessoa.AsString = 'M' then
      cbTipoPessoa.ItemIndex := 6
   else
      cbTipoPessoa.ItemIndex := 2;

   cbCategorias.ItemIndex := -1;

   for I := 0 to cbCategorias.Items.Count - 1 do
   begin
      if TItemCombo(cbCategorias.Items.Objects[i]).getDescricao = qyPessoasCamposds_categoria.AsString then
      begin
         cbCategorias.ItemIndex := i;
         Exit;                  
      end;
   end;
end;

procedure TfrmCadCamposPessoas.dtcPessoasCamposStateChange(Sender: TObject);
begin
   if(qyPessoasCampos.State in [dsInsert,dsEdit])then
   begin
      btnIncluir.Enabled  := false;
      btnAlterar.Enabled  := false;
      btnExcluir.Enabled  := false;
      btnSalvar.Enabled   := true;
      btnCancelar.Enabled := true;
   end
   else
   begin
      btnIncluir.Enabled  := true;
      btnAlterar.Enabled  := true;
      btnExcluir.Enabled  := true;
      btnSalvar.Enabled   := false;
      btnCancelar.Enabled := false;
   end;
end;

procedure TfrmCadCamposPessoas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadCamposPessoas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if pgMain.ActivePage = tsCampos then
   begin
      case Key of
         VK_F2 : if btnIncluir.Enabled  then btnIncluirClick( nil );
         VK_F3 : if btnAlterar.Enabled  then btnAlterarClick( nil );
         VK_F9 : if btnExcluir.Enabled  then btnExcluirClick( nil );
         VK_F5 : if btnSalvar.Enabled   then btnSalvarClick( nil );
         VK_F6 : if btnCancelar.Enabled then btnCancelarClick( nil );
         VK_F12 : btnSairClick( nil );
      end;
   end;

   if pgMain.ActivePage = tsCategorias then
   begin
      case Key of
         VK_F2 : if btIncluirCat.Enabled  then btIncluirCatClick( nil );
         VK_F3 : if btAlterarCat.Enabled  then btAlterarCatClick( nil );
         VK_F9 : if btExcluirCat.Enabled  then btExcluirCatClick( nil );
         VK_F5 : if btSalvarCat.Enabled   then btSalvarCatClick( nil );
         VK_F6 : if btCancelarCat.Enabled then btCancelarCatClick( nil );
         VK_F12 : btnSairClick( nil );
      end;
   end;
end;

procedure TfrmCadCamposPessoas.FormShow(Sender: TObject);
begin
   qyPessoasCampos.Open;
   qyOpcoes.Open;
   
   if ((qyPessoasCamposds_tipo.AsString = 'S') or (qyPessoasCamposds_tipo.AsString = 'C')) and (qyOpcoes.RecordCount >0) then
   begin
      dblNomeOpcao.Visible := true;
      lblOpcao.Visible := true;
   end;
end;

function TfrmCadCamposPessoas.isExclusaoValida: Boolean;
var
   qryBuscaCategoria: TUMZReadOnlyQuery;
const
   SQL_BUSCA_CAMPOS =
      ' SELECT '+
      '   count(ds_categoria) AS qtd '+
      ' FROM '+
      '   pessoas_campos_adicionais '+
      ' WHERE '+
      '   ds_categoria = :ds_categoria ';
begin
   Result := True;

   DM.CriarConsulta(qryBuscaCategoria);

   qryBuscaCategoria.SQL.Text := SQL_BUSCA_CAMPOS;
   qryBuscaCategoria.ParamByName('ds_categoria').AsString :=
      qryCategoriasnm_categoria.AsString;
   qryBuscaCategoria.Open;   

   if qryBuscaCategoria.FieldByName('qtd').AsInteger > 0 then
   begin
      Result := False;      
   end;
end;

procedure TfrmCadCamposPessoas.pgMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   qryCategorias.Cancel;
   qyPessoasCampos.Cancel;
end;

procedure TfrmCadCamposPessoas.qryCategoriasAfterInsert(DataSet: TDataSet);
begin
   dbedNome.SetFocus;
end;

procedure TfrmCadCamposPessoas.sbBuscaAcaoClick(Sender: TObject);
var
   retorno: TResultadoAcao;
begin
   retorno := TfrmSelecionarAcao.getInstancia.ShowModal;

   qryCategorias.FieldByName('cd_acao').AsInteger := retorno.cd_acao;
   
   edAcao.Text := retorno.ds_nome_acao;
end;

procedure TfrmCadCamposPessoas.tsCamposShow(Sender: TObject);
begin
   carregaCategorias();
end;

procedure TfrmCadCamposPessoas.tsCategoriasShow(Sender: TObject);
begin
   qryCategorias.Close;
   qryCategorias.Open;
end;

procedure TfrmCadCamposPessoas.btCancelarCatClick(Sender: TObject);
begin
   qryCategorias.Cancel;
end;

procedure TfrmCadCamposPessoas.btIncluirCatClick(Sender: TObject);
begin
   qryCategorias.Insert;
   edAcao.Text := '';
end;

procedure TfrmCadCamposPessoas.btAlterarCatClick(Sender: TObject);
begin
   qryCategorias.Edit;
end;

procedure TfrmCadCamposPessoas.btExcluirCatClick(Sender: TObject);
begin
   if not(isExclusaoValida()) then
   begin
      Mensagem(
         'Categoria não pode ser excluída, pois está vinculada á um campo.',
         'Aviso',
         MB_ICONINFORMATION + MB_OK,
         Handle
      );
      
      Exit;
   end;

   if Mensagem(
      'Tem certeza que deseja excluir esta categoria ?',
      'Aviso',
      MB_YESNO + MB_ICONWARNING,
      Handle) = mrYes then
   begin
      qryCategorias.Delete;
   end;
end;

procedure TfrmCadCamposPessoas.btSalvarCatClick(Sender: TObject);
begin
   qryCategorias.Post;
   qryCategorias.Refresh;
end;

end.
