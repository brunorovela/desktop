unit uFComprasCadastroCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, StdCtrls, Mask, DBCtrls,
  UMLookupComboBox, UMComboBox, ZSqlUpdate;

type
  TfrmComprasCadastroCategorias = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    pnListagem: TPanel;
    pnCadastro: TPanel;
    Panel30: TPanel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    qyCategorias: TUMZQuery;
    dsCategorias: TDataSource;
    qyCategoriascd_categoria: TIntegerField;
    qyCategoriascd_tipo_titulo: TIntegerField;
    qyCategoriascd_coligada: TIntegerField;
    qyCategoriasds_categoria: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    edDescricao: TDBEdit;
    UMLookupComboBox1: TUMLookupComboBox;
    qyTiposTitulo: TUMZReadOnlyQuery;
    qyCategoriasds_tipo_titulo: TStringField;
    qyTiposTitulocd_tipo_titulo: TLargeintField;
    qyTiposTitulods_tipo_titulo: TStringField;
    qyCategoriasds_coligada: TStringField;
    Panel3: TPanel;
    grdCategorias: TDBGrid;
    Panel4: TPanel;
    Label1: TLabel;
    cbColigadas: TUMComboBox;
    UMLookupComboBox2: TUMLookupComboBox;
    Label4: TLabel;
    qyTiposTituloLista: TUMZReadOnlyQuery;
    LargeintField1: TLargeintField;
    StringField1: TStringField;
    LargeintField2: TLargeintField;
    qyCategoriasds_tipo_titulo_lista: TStringField;
    procedure dsCategoriasDataChange(Sender: TObject; Field: TField);
    procedure qyCategoriascd_coligadaChange(Sender: TField);
    procedure qyCategoriasAfterInsert(DataSet: TDataSet);
    procedure cbColigadasChange(Sender: TObject);
    procedure qyCategoriasBeforeEdit(DataSet: TDataSet);
    procedure qyCategoriasBeforeInsert(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qyCategoriasBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dsCategoriasStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function GetColigada: Integer;
    { Private declarations }
    procedure AbreQueryTiposTitulo();
    procedure AbreQueryTiposTituloLista();
    procedure AbreQueryCategorias();
    procedure AbreQueryColigadas();

    procedure desabilitaGerarTitulosProdutos( const cd_categoria: Integer );
    function hasProdutosCadastrados( const cd_categoria: Integer ): Boolean;

    property cd_coligada: Integer read GetColigada;
  public
    { Public declarations }
  end;

var
  frmComprasCadastroCategorias: TfrmComprasCadastroCategorias;

implementation

uses uDM, General, Main, uUsuario, uItemCombo;

{$R *.dfm}

procedure TfrmComprasCadastroCategorias.AbreQueryCategorias;
const
   SQL_CATEGORIAS =
      ' SELECT cd_categoria, cd_tipo_titulo, cd_coligada, ds_categoria ' +
      ' FROM comp_categorias ';
   SQL_CATEGORIAS_ORDER =
      ' ORDER BY ds_categoria, cd_categoria, cd_tipo_titulo, cd_coligada ';
begin
   qyCategorias.Close();

   qyCategorias.SQL.Text := SQL_CATEGORIAS;

   if cd_coligada > 0 then
   begin
      qyCategorias.SQL.Add('WHERE cd_coligada = :cd_coligada');
      qyCategorias.ParamByName('cd_coligada').AsInteger := cd_coligada;
   end;

   qyCategorias.SQL.Add(SQL_CATEGORIAS_ORDER);

   qyCategorias.Open();
end;

procedure TfrmComprasCadastroCategorias.AbreQueryColigadas;
begin
   cbColigadas.Clear;

   DM.qryColigadas.First;

   cbColigadas.AddItem( '', nil );
   while not DM.qryColigadas.Eof do
   begin
      cbColigadas.AddItem(
         DM.qryColigadasNM_COLIGADA.AsString,
         TItemCombo.Create(
            DM.qryColigadasCD_COLIGADA.AsString,
            DM.qryColigadasNM_COLIGADA.AsString
         ) );

      DM.qryColigadas.Next;
   end;

   if ( cbColigadas.Items.Count = 2 ) then
   begin
      cbColigadas.ItemIndex := 1;
   end;
end;

procedure TfrmComprasCadastroCategorias.AbreQueryTiposTitulo;
begin
   qyTiposTitulo.Close();

   qyTiposTitulo.ParamByName('cd_coligada_matriz').AsInteger := DM.UsuarioLogado.ColigadaLogada;

   qyTiposTitulo.Open();
end;

procedure TfrmComprasCadastroCategorias.AbreQueryTiposTituloLista;
const
   SQL_TIPOS_TITULO_LISTA =
      ' (SELECT CAST( 0 AS SIGNED ) AS cd_tipo_titulo, '''' AS ds_tipo_titulo, 0 AS cd_coligada FROM DUAL) ' +
      ' UNION ' +
      ' (SELECT cd_tipo_titulo, ds_tipo_titulo, cd_coligada ' +
      ' FROM fin_tipos_titulo ' +
      ' WHERE cd_coligada IN ( %s ) ' +
      ' ) ORDER BY CASE WHEN cd_tipo_titulo = 0 THEN 1 ELSE ds_tipo_titulo END ';
   SQL_TIPOS_TITULO_LISTA_ORACLE =
      ' SELECT ' +
      '    CAST( cd_tipo_titulo AS NUMBER(19) ) AS cd_tipo_titulo, ds_tipo_titulo, CAST( cd_coligada AS NUMBER(19) ) AS cd_coligada ' +
      ' FROM ' +
      ' ( ' +
      ' 	 SELECT ' +
      ' 	 	 0 AS cd_tipo_titulo, '''' AS ds_tipo_titulo, 0 AS cd_coligada ' +
      ' 	 FROM dual ' +
      ' UNION ' +
      ' 	 SELECT ' +
      ' 	 	 cd_tipo_titulo, ds_tipo_titulo, cd_coligada ' +
      ' 	 FROM ' +
      ' 	 	 fin_tipos_titulo ' +
      '     WHERE cd_coligada IN ( %s ) ' +
      ' 	 ORDER BY ' +
      ' 	    ds_tipo_titulo, cd_coligada, cd_tipo_titulo ' +
      ' ) ';
var
   sql: String;
begin
   qyTiposTitulo.Close();

   // Atenção, sempre recarregamos o SQL do protocolo conectado
   if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
      sql := SQL_TIPOS_TITULO_LISTA_ORACLE
   else
      sql := SQL_TIPOS_TITULO_LISTA;

   qyTiposTituloLista.SQL.Text := Format( sql, [DM.GetColigadas()] );

   qyTiposTitulo.Open();
end;

procedure TfrmComprasCadastroCategorias.btnAlterarClick(Sender: TObject);
begin
   edDescricao.SetFocus();
   qyCategorias.Edit();
end;

procedure TfrmComprasCadastroCategorias.btnCancelarClick(Sender: TObject);
begin
   qyCategorias.Cancel();
end;

procedure TfrmComprasCadastroCategorias.btnExcluirClick(Sender: TObject);
var
   resposta: Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Categorias', npExcluir, True ) then Exit;

   resposta := Mensagem( 'Deseja excluir a Categoria?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle );
   if resposta <> mrYes then Exit;

   try
      qyCategorias.Delete();
   except
      on E : Exception do
         if ( Pos( 'FOREIGN', E.Message ) > 0 ) then
            Mensagem( 'Não é possível excluir esta Categoria, pois existem produtos cadastrados.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );         
   end;
end;

procedure TfrmComprasCadastroCategorias.btnIncluirClick(Sender: TObject);
begin
   edDescricao.SetFocus();
   qyCategorias.Insert();
end;

procedure TfrmComprasCadastroCategorias.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasCadastroCategorias.btnSalvarClick(Sender: TObject);
begin
   qyCategorias.Post();
end;

procedure TfrmComprasCadastroCategorias.cbColigadasChange(Sender: TObject);
begin
   if ( qyCategorias.State IN [dsInsert, dsEdit] ) then
   begin
      Mensagem('Você precisar salvar ou cancelar as alterações.');
      Exit;
   end;   

   AbreQueryCategorias;
end;

procedure TfrmComprasCadastroCategorias.desabilitaGerarTitulosProdutos(
  const cd_categoria: Integer);
{ Função responsável por desabilitar a flag gerar titulo de todos os produtos
  de uma determinada categoria }
const
   SQL_DESABILITA_GERAR_TITULOS =
      ' UPDATE comp_produtos SET sn_gerar_titulo = 0, sn_acumular_valores = 0 ' +
      ' WHERE cd_categoria = :cd_categoria ';
var
   qyDesabilitaGerarTitulos: TUMZQuery;
begin
   DM.CriarConsulta(qyDesabilitaGerarTitulos);

   qyDesabilitaGerarTitulos.Close();

   qyDesabilitaGerarTitulos.SQL.Text := SQL_DESABILITA_GERAR_TITULOS;
   qyDesabilitaGerarTitulos.ParamByName('cd_categoria').AsInteger := cd_categoria;

   qyDesabilitaGerarTitulos.ExecSQL();
end;

procedure TfrmComprasCadastroCategorias.dsCategoriasDataChange(Sender: TObject;
  Field: TField);
begin
   AbreQueryTiposTitulo();
end;

procedure TfrmComprasCadastroCategorias.dsCategoriasStateChange(
  Sender: TObject);
begin
   btnIncluir.Enabled := not (qyCategorias.State IN [ dsInsert, dsEdit ]);
   btnAlterar.Enabled := not (qyCategorias.State IN [ dsInsert, dsEdit ]);
   btnExcluir.Enabled := not (qyCategorias.State IN [ dsInsert, dsEdit ]);

   btnCancelar.Enabled := qyCategorias.State IN [ dsInsert, dsEdit ];
   btnSalvar.Enabled := qyCategorias.State IN [ dsInsert, dsEdit ];
end;

procedure TfrmComprasCadastroCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmComprasCadastroCategorias.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F1 : PrincipalForm.confSobreClick( nil );
      VK_F2: if btnIncluir.Enabled then btnIncluirClick( nil );
      VK_F3: if btnAlterar.Enabled then btnAlterarClick( nil );
      VK_F5: if btnSalvar.Enabled then btnSalvarClick( nil );
      VK_F6: if btnCancelar.Enabled then btnCancelarClick( nil );
      VK_F9: if btnExcluir.Enabled then btnExcluirClick( nil );
      VK_F12: btnSairClick( nil );      
   end;
end;

procedure TfrmComprasCadastroCategorias.FormShow(Sender: TObject);
begin
   AbreQueryColigadas();  
   AbreQueryTiposTituloLista();
   AbreQueryCategorias();
   AbreQueryTiposTitulo();
end;

function TfrmComprasCadastroCategorias.GetColigada: Integer;
begin
   Result := 0;

   try
      if ( cbColigadas.ItemIndex > -1 ) AND
         ( cbColigadas.Items.Objects[ cbColigadas.ItemIndex ] <> nil ) then
         Result := StrToInt( TItemCombo(cbColigadas.Items.Objects[ cbColigadas.ItemIndex ]).getCodigo() );
   except
      Result := 0;
   end;
end;

function TfrmComprasCadastroCategorias.hasProdutosCadastrados(
  const cd_categoria: Integer): Boolean;
{ Responsável por verificar se há produtos com a flag gerar titulo
  em uma determinada categoria }
const
   SQL_HAS_PRODUTOS_CADASTRADOS =
      ' SELECT count(*) AS registros FROM comp_produtos ' +
      ' WHERE sn_gerar_titulo = 1 AND cd_categoria = :cd_categoria ';
var
   qyHasProdutosCadastrados: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyHasProdutosCadastrados);

   qyHasProdutosCadastrados.Close();

   qyHasProdutosCadastrados.SQL.Text := SQL_HAS_PRODUTOS_CADASTRADOS;
   qyHasProdutosCadastrados.ParamByName('cd_categoria').AsInteger := cd_categoria;

   qyHasProdutosCadastrados.Open();

   Result := qyHasProdutosCadastrados.FieldByName('registros').AsInteger > 0;

   FreeAndNil(qyHasProdutosCadastrados);
end;

procedure TfrmComprasCadastroCategorias.qyCategoriasAfterInsert(
  DataSet: TDataSet);
begin
   if cd_coligada > 0 then   
      qyCategoriascd_coligada.AsInteger := cd_coligada;
end;

procedure TfrmComprasCadastroCategorias.qyCategoriasBeforeEdit(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Categorias', npAlterar, True ) then Abort();
end;

procedure TfrmComprasCadastroCategorias.qyCategoriasBeforeInsert(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Categorias', npIncluir, True ) then Abort();
end;

procedure TfrmComprasCadastroCategorias.qyCategoriasBeforePost(
  DataSet: TDataSet);
var
   msg_pergunta: String;
begin
   if ( qyCategoriascd_coligada.AsInteger = 0 ) then
   begin
      Mensagem('É necessário selecionar uma Unidade de Ensino.');
      UMLookupComboBox2.SetFocus;
      Abort();
   end;

   if ( qyCategoriascd_tipo_titulo.AsInteger = 0 ) then
   begin
      if (qyCategorias.State IN [ dsEdit ]) AND
         (hasProdutosCadastrados( qyCategoriascd_categoria.AsInteger )) then
      begin
         msg_pergunta :=
            'Esta categoria possui produtos cadastrados com a opção de "Gerar valor na planilha de recebimentos",' + Chr(13) +
            'se você remover o Tipo de Título será automaticamente desmarcada esta opção nos produtos.' + Chr(13) +
            'Deseja prosseguir?';

         if Mensagem(msg_pergunta, Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = mrYes then
         begin
            desabilitaGerarTitulosProdutos( qyCategoriascd_categoria.AsInteger );
         end else begin
            Abort();
         end;
      end;

      qyCategoriascd_tipo_titulo.Clear();
   end;
end;

procedure TfrmComprasCadastroCategorias.qyCategoriascd_coligadaChange(
  Sender: TField);
begin
   AbreQueryTiposTitulo();

   if qyTiposTitulo.RecordCount = 1 then
      qyCategoriascd_tipo_titulo.Clear();   
end;

end.
