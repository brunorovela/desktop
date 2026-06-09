unit uFComprasCadastroProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, ToolWin, DBCtrls, UMLookupComboBox,
  StdCtrls, Mask, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, UMComboBox;

const
   TIPOS_IMPRESSAO_AGRUPADO = 'A';
   TIPOS_IMPRESSAO_INDIVIDUAL = 'I';

type
  TfrmComprasCadastroProdutos = class(TForm)
    Panel1: TPanel;
    ImageList2: TImageList;
    Bevel1: TBevel;
    qyProdutos: TUMZQuery;
    dsProdutos: TDataSource;
    qyProdutoscd_produto: TStringField;
    qyProdutoscd_categoria: TIntegerField;
    qyProdutosds_produto: TStringField;
    qyProdutosvl_produto: TFloatField;
    qyProdutossn_gerar_titulo: TSmallintField;
    qyProdutossn_acumular_valores: TSmallintField;
    qyProdutossn_imprimir_cupom: TSmallintField;
    qyCategorias: TUMZReadOnlyQuery;
    qyCategoriascd_categoria: TIntegerField;
    qyCategoriasds_categoria: TStringField;
    qyProdutosds_categoria: TStringField;
    qyProdutosTP_IMPRESSAO_CUPOM: TStringField;
    qyCodBarra: TUMZQuery;
    dsCodBarra: TDataSource;
    qyCodBarracd_produto: TStringField;
    pgProdutos: TPageControl;
    pgCadastro: TTabSheet;
    gbImpressaoCupom: TGroupBox;
    rbtnAgrupado: TRadioButton;
    rbtnIndividual: TRadioButton;
    pnCadastro: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    edCodigo: TDBEdit;
    edNome: TDBEdit;
    cbCategoria: TUMLookupComboBox;
    ckbGerarTitulo: TDBCheckBox;
    ckbAcumularValores: TDBCheckBox;
    ckbImprimirCupom: TDBCheckBox;
    edCodBarra: TDBEdit;
    pnListagem: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel30: TPanel;
    edFiltroProduto: TEdit;
    btnFiltrar: TButton;
    grdProdutos: TDBGrid;
    cbCategorias: TUMComboBox;
    cbColigadas: TUMComboBox;
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
    tbTurmas: TTabSheet;
    pnTurmas: TPanel;
    Panel6: TPanel;
    grdProdutosTurmas: TDBGrid;
    ToolBar1: TToolBar;
    btnAddCurso: TToolButton;
    btnAddTurma: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    qyProdutosTurmas: TUMZQuery;
    dsProdutosTurmas: TDataSource;
    ImageList3: TImageList;
    qyProdutosTurmascd_turma: TStringField;
    qyProdutosTurmascd_anosemestre: TSmallintField;
    qyProdutosTurmasnr_etapa: TSmallintField;
    qyProdutosTurmasdescricao: TStringField;
    qyCodBarracd_codigo_barras: TStringField;
    qyProdutosnr_limite: TIntegerField;
    edValor: TDBEdit;
    Label9: TLabel;
    edLimite: TDBEdit;
    qyCategoriascd_coligada: TSmallintField;
    procedure grdProdutosTitleClick(Column: TColumn);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure btnAddTurmaClick(Sender: TObject);
    procedure btnAddCursoClick(Sender: TObject);
    procedure edCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure qyProdutosAfterInsert(DataSet: TDataSet);
    procedure ckbImprimirCupomClick(Sender: TObject);
    procedure cbColigadasChange(Sender: TObject);
    procedure qyProdutosBeforeEdit(DataSet: TDataSet);
    procedure qyProdutosBeforeInsert(DataSet: TDataSet);
    procedure edCodigoEnter(Sender: TObject);
    procedure ckbGerarTituloClick(Sender: TObject);
    procedure qyProdutosBeforePost(DataSet: TDataSet);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dsProdutosStateChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    EventoComponenteTipoImpressaoAtivo: Boolean;
    fieldOrdem: String;

    procedure AbreQueryProdutos();
    procedure AbreQueryColigadas();
    procedure AbreQueryCategorias();
    procedure AbreQueryCodigoBarra();
    procedure abreQueryTurmas();
    procedure SetFiltroProduto(const Value: String);
    procedure RadioGroupImpressaoClick(Sender: TObject);
    procedure gravaLog(acao: integer);

    function GetColigada: Integer;
    function hasTipoTituloCategoria( const cd_categoria: Integer ): Boolean;
    function isCodigoExiste( const cd_produto: String ): Boolean;
    function isCodigoBarraExiste( const cd_cod_barra: String ): Boolean;
    function GetFiltroProduto: String;

    property filtro_produto: String read GetFiltroProduto write SetFiltroProduto;
    property cd_coligada: Integer read GetColigada;
  public
    { Public declarations }
  end;

var
  frmComprasCadastroProdutos: TfrmComprasCadastroProdutos;

implementation

uses uDM, General, Main, uUsuario, uItemCombo, uFSelecionarCurso, uFSelecionarTurma;

{$R *.dfm}

procedure TfrmComprasCadastroProdutos.AbreQueryCategorias;
const
   SQL_CATEGORIAS =
      ' SELECT cd_categoria, ds_categoria, cd_coligada ' +
      ' FROM comp_categorias ';
   SQL_CATEGORIAS_ORDER =
      ' ORDER BY ds_categoria ';
begin
   qyCategorias.Close;

   qyCategorias.SQL.Text := SQL_CATEGORIAS;

   if ( cd_coligada > 0 ) then
   begin
      qyCategorias.SQL.Add('WHERE cd_coligada = :cd_coligada');
      qyCategorias.ParamByName('cd_coligada').AsInteger := cd_coligada;
   end else begin
      qyCategorias.SQL.Add( Format( 'WHERE cd_coligada IN ( %s )', [ DM.UsuarioLogado.GetColigadasFilhaSelecionada() ] ) );
   end;

   qyCategorias.SQL.Add(SQL_CATEGORIAS_ORDER);
   qyCategorias.Open;

   cbCategorias.Clear;
   cbCategorias.AddItem( '', nil );
   while not qyCategorias.Eof do
   begin
      cbCategorias.AddItem( qyCategoriasds_categoria.AsString,
                            TItemCombo.Create( qyCategoriascd_categoria.AsString,
                                               qyCategoriasds_categoria.AsString ) );

      qyCategorias.Next();
   end;

   qyCategorias.First;
end;

procedure TfrmComprasCadastroProdutos.AbreQueryCodigoBarra;
begin
   qyCodBarra.Close;
   qyCodBarra.ParamByName('cd_produto').AsString := qyProdutoscd_produto.AsString;
   qyCodBarra.Open;
end;

procedure TfrmComprasCadastroProdutos.AbreQueryColigadas;
var
   index_coligada: Integer;
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

   if cbColigadas.Items.Count = 2 then
   begin
      cbColigadas.ItemIndex := 1;
   end;
end;

procedure TfrmComprasCadastroProdutos.AbreQueryProdutos;
const
   SQL_PRODUTOS =
      ' SELECT cp.* FROM comp_produtos cp ' +
      '                  INNER JOIN comp_categorias cc ON ( cc.CD_CATEGORIA = cp.CD_CATEGORIA ) ' +
      ' WHERE 1=1 ';
   SQL_PRODUTOS_WHERE_DS_PRODUTO =
      ' AND cp.ds_produto LIKE :ds_produto ';
   SQL_PRODUTOS_WHERE_CD_CATEGORIA =
      ' AND cp.cd_categoria = :cd_categoria ';
   SQL_PRODUTOS_ORDER =
      ' ORDER BY ';
begin
   qyProdutos.Close();

   qyProdutos.SQL.Text := SQL_PRODUTOS;

   if ( cbColigadas.ItemIndex > -1 ) AND
      ( cbColigadas.Items.Objects[ cbColigadas.ItemIndex ] <> nil ) then
   begin
      qyProdutos.SQL.Add('AND cc.CD_COLIGADA = :CD_COLIGADA');
      qyProdutos.ParamByName('CD_COLIGADA').AsInteger := StrToInt(TItemCombo(cbColigadas.Items.Objects[ cbColigadas.ItemIndex ]).getCodigo());
   end else begin
      qyProdutos.SQL.Add(Format('AND cc.CD_COLIGADA IN ( %s )', [DM.GetColigadas()]));
   end;   

   if ( Trim( filtro_produto ) <> '' ) then
   begin
      qyProdutos.SQL.Add( SQL_PRODUTOS_WHERE_DS_PRODUTO );
      qyProdutos.ParamByName('ds_produto').AsString := '%' + filtro_produto + '%'
   end;

   if ( cbCategorias.ItemIndex > -1 ) AND
      ( cbCategorias.Items.Objects[ cbCategorias.ItemIndex ] is TItemCombo ) then
   begin
      qyProdutos.SQL.Add( SQL_PRODUTOS_WHERE_CD_CATEGORIA );
      qyProdutos.ParamByName('cd_categoria').AsString := TItemCombo(cbCategorias.Items.Objects[ cbCategorias.ItemIndex ]).getCodigo();
   end;

   if fieldOrdem = '' then
   begin
      qyProdutos.SQL.Add( SQL_PRODUTOS_ORDER + 'cp.ds_produto' );
   end
   else
   begin
      qyProdutos.SQL.Add( SQL_PRODUTOS_ORDER + 'cp.' + fieldOrdem );      
   end;

   qyProdutos.Open();
end;

procedure TfrmComprasCadastroProdutos.abreQueryTurmas;
begin
   qyProdutosTurmas.Close;
   qyProdutosTurmas.ParamByName('cd_produto').AsString := qyProdutoscd_produto.AsString;
   qyProdutosTurmas.Open;
end;

procedure TfrmComprasCadastroProdutos.btnAddCursoClick(Sender: TObject);
var
   qyInsereProdutosTurmas: TUMZQuery;
   qryBuscaTurmas     : TUMZQuery;
   resultado_filtro : TResultadoFiltroCurso;
begin
   DM.CriarConsulta(qyInsereProdutosTurmas);
   DM.CriarConsulta(qryBuscaTurmas);

   qyInsereProdutosTurmas.SQL.Clear();
   qyInsereProdutosTurmas.SQL.Add(' INSERT INTO comp_produtos_turmas ( CD_PRODUTO, CD_TURMA, CD_ANOSEMESTRE, NR_ETAPA )');
   qyInsereProdutosTurmas.SQL.Add(' VALUES ( :CD_PRODUTO, :CD_TURMA, :CD_ANOSEMESTRE, :NR_ETAPA )');

   qryBuscaTurmas.SQL.Add('   SELECT :CD_PRODUTO as CD_PRODUTO, CODIGO, serie as ETAPA FROM turmas');
   qryBuscaTurmas.SQL.Add('   WHERE curso = :CD_CURSO AND cd_coligada = :CD_COLIGADA AND anosemestre = :ANOSEMESTRE ');


   resultado_filtro := TfrmSelecionarCurso.Filtrar([], -1, -1);

   if resultado_filtro.filtrado then
   Begin
      qryBuscaTurmas.ParamByName('CD_PRODUTO').AsString := qyProdutoscd_produto.AsString;
      qryBuscaTurmas.ParamByName('CD_COLIGADA').AsInteger := resultado_filtro.cd_coligada;
      qryBuscaTurmas.ParamByName('CD_CURSO').AsString := resultado_filtro.cd_curso;
      qryBuscaTurmas.ParamByName('ANOSEMESTRE').AsInteger := resultado_filtro.nr_anosemestre;

      qryBuscaTurmas.open;

      while not qryBuscaTurmas.Eof do
      begin
         qyInsereProdutosTurmas.ParamByName('CD_PRODUTO').AsString     := qryBuscaTurmas.FieldByName('CD_PRODUTO').AsString;
         qyInsereProdutosTurmas.ParamByName('CD_TURMA').AsString        := qryBuscaTurmas.FieldByName('CODIGO').AsString;
         qyInsereProdutosTurmas.ParamByName('CD_ANOSEMESTRE').AsInteger := resultado_filtro.nr_anosemestre;
         qyInsereProdutosTurmas.ParamByName('NR_ETAPA').AsString        := qryBuscaTurmas.FieldByName('ETAPA').AsString;
         try
            qyInsereProdutosTurmas.ExecSQL;
         except on E: Exception do
         end;
         qryBuscaTurmas.Next;
      end;

      abreQueryTurmas;
   end;
end;

procedure TfrmComprasCadastroProdutos.btnAddTurmaClick(Sender: TObject);
var
   qyInsereProdutosTurmas: TUMZQuery;
   resultado_filtro : TResultadoFiltroTurma;
begin
   DM.CriarConsulta(qyInsereProdutosTurmas);

   qyInsereProdutosTurmas.SQL.Clear();
   qyInsereProdutosTurmas.SQL.Add(' INSERT INTO comp_produtos_turmas ( CD_PRODUTO, CD_TURMA, CD_ANOSEMESTRE, NR_ETAPA )');
   qyInsereProdutosTurmas.SQL.Add(' VALUES ( :CD_PRODUTO, :CD_TURMA, :CD_ANOSEMESTRE, :NR_ETAPA )');

   resultado_filtro := TfrmSelecionarTurma.Filtrar([], -1, -1);

   if resultado_filtro.filtrado then
   Begin
      qyInsereProdutosTurmas.ParamByName('CD_PRODUTO').AsString      := qyProdutoscd_produto.AsString;
      qyInsereProdutosTurmas.ParamByName('CD_TURMA').AsString        := resultado_filtro.cd_turma;
      qyInsereProdutosTurmas.ParamByName('CD_ANOSEMESTRE').AsInteger := resultado_filtro.nr_anosemestre;
      qyInsereProdutosTurmas.ParamByName('NR_ETAPA').AsInteger       := resultado_filtro.nr_serie;
      
      try
         qyInsereProdutosTurmas.ExecSQL;
      except on E: Exception do
      end;
      
      abreQueryTurmas;
   end;
end;

procedure TfrmComprasCadastroProdutos.btnAlterarClick(Sender: TObject);
begin
   edNome.SetFocus();
   qyProdutos.Edit();
end;

procedure TfrmComprasCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
   qyProdutos.Cancel();
end;

procedure TfrmComprasCadastroProdutos.btnExcluirClick(Sender: TObject);
var
   resposta: Integer;
   cdProduto : String;
   qyDeletaTurma : TUMZQuery;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Produtos', npExcluir, True ) then Exit;

   resposta := Mensagem( 'Deseja excluir o Produto?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle );
   if resposta <> mrYes then Exit;

   cdProduto := qyProdutoscd_produto.AsString;
   try
      gravaLog(1);
      qyProdutos.Delete();
   except
      on E : Exception do
         if ( Pos( 'FOREIGN', E.Message ) > 0 ) then
         begin
            if ( Pos( 'comp_kits', E.Message ) > 0 ) then
            begin
               Mensagem( 'Não é possível excluir este Produto, pois existem kits que possuem este produto! .', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
               exit;
            end;
            Mensagem( 'Não é possível excluir este Produto, pois existem registros de Estoque.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
            exit;
         end;
   end;

   DM.CriarConsulta(qyDeletaTurma);
   qyDeletaTurma.SQL.Add('DELETE from comp_produtos_turmas where cd_produto = :cd_produto');
   qyDeletaTurma.ParamByName('cd_produto').AsString := cdProduto;
   qyDeletaTurma.ExecSQL;
   FreeAndNil(qyDeletaTurma);

   qyCodBarra.Close;
   qyCodBarra.ParamByName('cd_produto').AsString := cdProduto;
   qyCodBarra.Open;

   if not (qyCodBarra.IsEmpty) then
   begin
      qyCodBarra.Delete();
   end;
end;

procedure TfrmComprasCadastroProdutos.btnFiltrarClick(Sender: TObject);
begin
   AbreQueryProdutos();
end;

procedure TfrmComprasCadastroProdutos.btnIncluirClick(Sender: TObject);
begin
   if not ( cd_coligada > 0 ) then
   begin
      Mensagem( 'Você deve selecionar uma Unidade de Ensino.' );
      Exit;
   end;

   edCodigo.SetFocus();
   qyProdutos.Insert();
   qyCodBarra.Insert();
end;

procedure TfrmComprasCadastroProdutos.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasCadastroProdutos.btnSalvarClick(Sender: TObject);
begin
   edNome.SetFocus;

   if ( qyProdutos.State IN [dsInsert] ) AND ( isCodigoExiste( qyProdutoscd_produto.AsString ) ) then
   begin
      Mensagem( 'O código preenchido já existe.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      edCodigo.SetFocus;
      Exit;
   end;


   if (qyCodBarracd_codigo_barras.AsString <> '') AND (isCodigoBarraExiste( qyCodBarracd_codigo_barras.AsString )) then
   begin
      Mensagem( 'O código de barras preenchido já existe.', Application.Title, MB_OK + MB_ICONWARNING, Handle );
      edCodigo.SetFocus;
      Exit;
   end;

   gravaLog(0);

   if ( qyCodBarra.State IN [dsInsert,dsEdit] ) then
   begin
      if ((trim(qyCodBarracd_codigo_barras.AsString) <> '' ) or (qyCodBarra.State = dsEdit)) then
      begin
         qyCodBarra.FieldByName('cd_produto').AsString := qyProdutoscd_produto.AsString;
         qyCodBarra.Post();
      end;
      
      qyCodBarra.Cancel;
   end;
   
   qyProdutos.Post();
end;

procedure TfrmComprasCadastroProdutos.cbColigadasChange(Sender: TObject);
begin
   AbreQueryCategorias;
   AbreQueryProdutos;
end;

procedure TfrmComprasCadastroProdutos.ckbGerarTituloClick(Sender: TObject);
begin
   ckbAcumularValores.Enabled := ckbGerarTitulo.Checked;
   if not ckbAcumularValores.Enabled then
      ckbAcumularValores.Checked := False;
end;

procedure TfrmComprasCadastroProdutos.ckbImprimirCupomClick(Sender: TObject);
begin
   gbImpressaoCupom.Visible := ckbImprimirCupom.Checked;
end;

procedure TfrmComprasCadastroProdutos.dsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
   ckbGerarTitulo.Enabled := hasTipoTituloCategoria( qyProdutoscd_categoria.AsInteger );
   if not ckbGerarTitulo.Enabled then
      ckbGerarTitulo.Checked := False;

   ckbAcumularValores.Enabled := ckbGerarTitulo.Checked;
   if not ckbAcumularValores.Enabled then
      ckbAcumularValores.Checked := False;

   gbImpressaoCupom.Visible := qyProdutossn_imprimir_cupom.AsInteger = 1;   

   EventoComponenteTipoImpressaoAtivo := False;
   rbtnAgrupado.Checked := ( qyProdutosTP_IMPRESSAO_CUPOM.AsString = TIPOS_IMPRESSAO_AGRUPADO );
   rbtnIndividual.Checked := ( qyProdutosTP_IMPRESSAO_CUPOM.AsString = TIPOS_IMPRESSAO_INDIVIDUAL );
   EventoComponenteTipoImpressaoAtivo := True;

   if (qyProdutos.State = dsBrowse) then
   begin
      AbreQueryCodigoBarra;
      abreQueryTurmas;
   end;
end;

procedure TfrmComprasCadastroProdutos.dsProdutosStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);
   btnAlterar.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);
   btnExcluir.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);

   btnCancelar.Enabled := qyProdutos.State IN [ dsInsert, dsEdit ];
   btnSalvar.Enabled := qyProdutos.State IN [ dsInsert, dsEdit ];

   edFiltroProduto.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);
   cbCategorias.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);
   cbColigadas.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);
   btnFiltrar.Enabled := not (qyProdutos.State IN [ dsInsert, dsEdit ]);
end;

procedure TfrmComprasCadastroProdutos.edCodBarraKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (qyProdutos.State in [dsEdit,dsInsert]) then
   begin
      qyProdutos.Edit;
      qyCodBarra.Edit;
   end;
   
   if ( Key = #13 ) then
   begin
      edNome.SetFocus;
   end;

end;

procedure TfrmComprasCadastroProdutos.edCodigoEnter(Sender: TObject);
begin
   edCodigo.SelectAll();
end;

procedure TfrmComprasCadastroProdutos.edValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfrmComprasCadastroProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmComprasCadastroProdutos.FormKeyDown(Sender: TObject;
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

procedure TfrmComprasCadastroProdutos.FormShow(Sender: TObject);
begin
   rbtnAgrupado.OnClick := RadioGroupImpressaoClick;
   rbtnIndividual.OnClick := RadioGroupImpressaoClick;

   AbreQueryColigadas;
   AbreQueryCategorias;
   AbreQueryProdutos;
   AbreQueryCodigoBarra;
end;

function TfrmComprasCadastroProdutos.GetColigada: Integer;
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

function TfrmComprasCadastroProdutos.GetFiltroProduto: String;
begin
   Result := edFiltroProduto.Text;
end;

procedure TfrmComprasCadastroProdutos.gravaLog(acao: integer);
const
   SQL_GRAVA_LOG =
      'INSERT INTO log_geral (cd_usuario,dt_log,cd_modulo,cd_chave,cd_operacao,cd_coligada,ds_observacoes) '+
      'VALUES (:usuario,NOW(),1150,:chave,:operacao,:coligada,:observacao) ';
var
   qyGravaLog : TUMZQuery;
   operacao, observacao : string;
begin
   DM.CriarConsulta( qyGravaLog );

   if ((qyProdutos.State = dsInsert) or (acao = 1)) then
   begin

      if(acao <> 1) then
      begin
         operacao := '2';
         observacao := 'Cadastro de produto, dados:';
      end else begin
         operacao := '4';
         observacao := 'Exclusão do produto, dados : '
      end;
      
      observacao :=  observacao +
                    ' Código: ' + qyProdutoscd_produto.AsString +
                    ' , Descrição: ' + qyProdutosds_produto.AsString +
                    ' , Categoria: ' + qyProdutosds_categoria.AsString +
                    ' , Valor: ' + qyProdutosvl_produto.AsString +
                    ' , Gerar Titulo: ' + IntToStr(qyProdutossn_gerar_titulo.AsInteger) +
                    ' , Acumular valores: ' + IntToStr(qyProdutossn_acumular_valores.AsInteger) +
                    ' , Imprimir Cupons: ' + IntToStr(qyProdutossn_imprimir_cupom.AsInteger) +
                    ' , Limite: ' + IntToStr(qyProdutosnr_limite.AsInteger);

      if ( qyCodBarra.State IN [dsInsert] ) then
      begin
         observacao :=  observacao + ' ,Cód. de barra : ' + qyCodBarracd_codigo_barras.AsString;
      end;

   end else if (acao = 0) then
   begin
      operacao := '3';
      observacao := 'Edição de produtos, dados alterados:';

      if (qyProdutoscd_produto.AsString <> qyProdutoscd_produto.OldValue) then
      begin
         observacao := observacao + ' Código do produto, de ' + qyProdutoscd_produto.OldValue + ' para ' +  qyProdutosds_produto.AsString + ' ; ';
      end;

      if (qyProdutosds_produto.AsString <> qyProdutosds_produto.OldValue) then
      begin
         observacao := observacao + ' Descrição do produto, de ' + qyProdutosds_produto.OldValue + ' para ' +  qyProdutosds_produto.AsString + ' ; ';
      end;

      observacao := observacao + ' Categoria, de ' + qyProdutosds_categoria.AsString + ' para ' +   qyProdutosds_categoria.AsString + ' ; ';

      if (qyProdutosvl_produto.AsString <> VarToStr(qyProdutosvl_produto.OldValue)) then
      begin
         observacao := observacao + ' Valor, de ' + VarToStr(qyProdutosvl_produto.OldValue) + ' para ' +  qyProdutosvl_produto.AsString + ' ; ';
      end;

      if (qyProdutossn_gerar_titulo.AsFloat <> qyProdutossn_gerar_titulo.OldValue) then
      begin
         observacao := observacao + ' Gerar titulos, de ' + FloatToStr(qyProdutossn_gerar_titulo.OldValue) + ' para ' +  FloatToStr(qyProdutossn_gerar_titulo.AsFloat) + ' ; ';
      end;

      if (qyProdutossn_acumular_valores.AsFloat <> qyProdutossn_acumular_valores.OldValue) then
      begin
         observacao := observacao + ' Acumular valores, de ' + FloatToStr(qyProdutossn_acumular_valores.OldValue) + ' para ' +  FloatToStr(qyProdutossn_acumular_valores.AsFloat) + ' ; ';
      end;

      if (qyProdutossn_imprimir_cupom.AsFloat <> qyProdutossn_imprimir_cupom.OldValue) then
      begin
         observacao := observacao + ' Imprimir Cupons, de ' + FloatToStr(qyProdutossn_imprimir_cupom.OldValue) + ' para ' +  FloatToStr(qyProdutossn_imprimir_cupom.AsFloat) + ' ; ';
      end;

      if (qyProdutosnr_limite.AsFloat <> qyProdutosnr_limite.OldValue) then
      begin
         if(qyProdutosnr_limite.OldValue = null) then
         begin
            observacao := observacao + ' Limite incluido, valor: ' + FloatToStr(qyProdutosnr_limite.AsFloat)  + ' ; ';
         end else begin
            observacao := observacao + ' Limite, de ' + FloatToStr(qyProdutosnr_limite.OldValue) + ' para ' +  FloatToStr(qyProdutosnr_limite.AsFloat)  + ' ; ';
         end;
      end;

      if ( qyCodBarra.State = dsInsert ) then
      begin
         observacao := observacao + ' Cód. de barra incluido, valor: ' +  qyCodBarracd_codigo_barras.AsString  + ' ; ';
      end else if ( qyCodBarra.State = dsEdit ) AND (qyCodBarracd_codigo_barras.OldValue <> qyCodBarracd_codigo_barras.AsString) then
      begin
         observacao := observacao + ' Cód. de barra, de ' + VarToStr(qyCodBarracd_codigo_barras.OldValue) + ' para ' + qyCodBarracd_codigo_barras.AsString  + ' ; ';
      end; 
   end;

   qyGravaLog.SQL.Text := SQL_GRAVA_LOG;
   qyGravaLog.ParamByName('usuario').AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
   qyGravaLog.ParamByName('operacao').AsString := operacao;
   qyGravaLog.ParamByName('coligada').AsString := qyCategoriascd_coligada.AsString;
   qyGravaLog.ParamByName('chave').AsString :=  qyProdutoscd_produto.AsString;
   qyGravaLog.ParamByName('observacao').AsString := observacao;

   qyGravaLog.ExecSQL;
   
   FreeAndNil(qyGravaLog);
end;

procedure TfrmComprasCadastroProdutos.grdProdutosTitleClick(Column: TColumn);
var
   n : Integer;
begin
   if grdProdutos.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind <> fkData Then
   begin
      exit;
   end;

   For n:= 0 to grdProdutos.Columns.Count - 1 do
   begin
      grdProdutos.Columns[n].Title.Font.Style := [];
   end;

   if fieldOrdem = Column.FieldName then
   begin
     fieldOrdem := Column.FieldName + ' DESC ';
   end
   else
   begin
     fieldOrdem := Column.FieldName;
   end;

   Column.Title.Font.Style := [fsUnderline];

   AbreQueryProdutos;
end;

function TfrmComprasCadastroProdutos.hasTipoTituloCategoria(
  const cd_categoria: Integer): Boolean;
const
   SQL_HAS_TIPO_TITULO =
      ' SELECT cd_tipo_titulo FROM comp_categorias ' +
      ' WHERE cd_categoria = :cd_categoria ';
var
   qyHasTipoTitulo: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta( qyHasTipoTitulo );

   qyHasTipoTitulo.Close();

   qyHasTipoTitulo.SQL.Text := SQL_HAS_TIPO_TITULO;
   qyHasTipoTitulo.ParamByName('cd_categoria').AsInteger := cd_categoria;

   qyHasTipoTitulo.Open();

   Result := not qyHasTipoTitulo.FieldByName('cd_tipo_titulo').IsNull;

   FreeAndNil(qyHasTipoTitulo);
end;

function TfrmComprasCadastroProdutos.isCodigoBarraExiste(
  const cd_cod_barra: String): Boolean;
const
   SQL_COD_BARRA_EXISTE =
      ' SELECT COUNT(*) AS registros FROM COMP_CODIGO_BARRAS WHERE CD_CODIGO_BARRAS = :cd_cod_barra and (cd_produto <> :produto or cd_produto is null)';
var
   qyIsCodigoBarraExiste: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsCodigoBarraExiste);

   qyIsCodigoBarraExiste.Close();

   qyIsCodigoBarraExiste.SQL.Text := SQL_COD_BARRA_EXISTE;
   qyIsCodigoBarraExiste.ParamByName('cd_cod_barra').AsString := cd_cod_barra;
   qyIsCodigoBarraExiste.ParamByName('produto').AsString := qyProdutoscd_produto.OldValue;


   qyIsCodigoBarraExiste.Open();

   Result := ( qyIsCodigoBarraExiste.FieldByName('registros').AsInteger > 0 );

   FreeAndNil(qyIsCodigoBarraExiste);

end;

function TfrmComprasCadastroProdutos.isCodigoExiste(
  const cd_produto: String): Boolean;
const
   SQL_CODIGO_EXISTE =
      ' SELECT COUNT(*) AS registros FROM COMP_PRODUTOS WHERE CD_PRODUTO = :CD_PRODUTO ';
var
   qyIsCodigoExiste: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyIsCodigoExiste);

   qyIsCodigoExiste.Close();

   qyIsCodigoExiste.SQL.Text := SQL_CODIGO_EXISTE;
   qyIsCodigoExiste.ParamByName('CD_PRODUTO').AsString := cd_produto;

   qyIsCodigoExiste.Open();

   Result := ( qyIsCodigoExiste.FieldByName('registros').AsInteger > 0 );

   FreeAndNil(qyIsCodigoExiste);
end;

procedure TfrmComprasCadastroProdutos.qyProdutosAfterInsert(DataSet: TDataSet);
begin
   qyProdutosTP_IMPRESSAO_CUPOM.AsString := TIPOS_IMPRESSAO_INDIVIDUAL;
end;

procedure TfrmComprasCadastroProdutos.qyProdutosBeforeEdit(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Produtos', npAlterar, True ) then Abort();
end;

procedure TfrmComprasCadastroProdutos.qyProdutosBeforeInsert(DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Produtos', npIncluir, True ) then Abort();

   if qyCategorias.RecordCount = 0 then
   begin
      Mensagem( 'Você precisa criar as categorias para adicionar produtos.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      Abort();
   end;
end;

procedure TfrmComprasCadastroProdutos.qyProdutosBeforePost(DataSet: TDataSet);
begin
   qyProdutosvl_produto.Required := hasTipoTituloCategoria( qyProdutoscd_categoria.AsInteger );

   ckbImprimirCupom.SetFocus;

   if ( qyProdutosvl_produto.Required ) AND ( qyProdutosvl_produto.IsNull ) then
   begin
      Mensagem( 'O campo Valor é obrigatório, pois a categoria selecionada possui um Tipo de Título definido.',
                Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      edValor.SetFocus;
      Abort();
   end;

   if ( qyProdutosds_produto.IsNull ) then
   begin
      Mensagem( 'O campo Nome é obrigatório.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      edNome.SetFocus;
      Abort();
   end;

   if ( qyProdutoscd_produto.IsNull ) then
   begin
      Mensagem( 'O campo Código é obrigatório.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      edCodigo.SetFocus;
      Abort();
   end;

   if ( qyProdutoscd_categoria.IsNull ) then
   begin
      Mensagem( 'O campo Categoria é obrigatório.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      cbCategoria.SetFocus;
      Abort();
   end;
end;

procedure TfrmComprasCadastroProdutos.RadioGroupImpressaoClick(Sender: TObject);
begin
   if EventoComponenteTipoImpressaoAtivo AND
      (
         ( qyProdutos.State IN [dsEdit, dsInsert] ) OR
         ( trim(qyProdutoscd_produto.AsString) <> '' )
      ) then
   begin
      if qyProdutos.State IN [dsBrowse] then
         qyProdutos.Edit();

      EventoComponenteTipoImpressaoAtivo := False;
      rbtnAgrupado.Checked := ( TRadioButton(Sender).Name = rbtnAgrupado.Name );
      rbtnIndividual.Checked := ( TRadioButton(Sender).Name = rbtnIndividual.Name );
      EventoComponenteTipoImpressaoAtivo := True;

      if rbtnAgrupado.Checked then
      begin
         qyProdutosTP_IMPRESSAO_CUPOM.AsString := TIPOS_IMPRESSAO_AGRUPADO;
      end else if rbtnIndividual.Checked then
      begin
         qyProdutosTP_IMPRESSAO_CUPOM.AsString := TIPOS_IMPRESSAO_INDIVIDUAL;
      end;
   end;
end;

procedure TfrmComprasCadastroProdutos.SetFiltroProduto(const Value: String);
begin
   edFiltroProduto.Text := Value;
end;

procedure TfrmComprasCadastroProdutos.ToolButton5Click(Sender: TObject);
begin
   grdProdutosTurmas.SelectedRows.Clear;

   with qyProdutosTurmas do
   begin
      DisableControls;
      First;
      try
          while not EOF do
          begin
            grdProdutosTurmas.SelectedRows.CurrentRowSelected := true;
            Next;
          end;
      finally
         EnableControls;
      end;
   end;
end;

procedure TfrmComprasCadastroProdutos.ToolButton6Click(Sender: TObject);
var
   qyDeleteProdutosTurmas: TUMZQuery;
   i: Integer;
begin
   DM.CriarConsulta(qyDeleteProdutosTurmas);

   qyDeleteProdutosTurmas.SQL.Clear();
   qyDeleteProdutosTurmas.SQL.Add('DELETE FROM COMP_PRODUTOS_TURMAS ');
   qyDeleteProdutosTurmas.SQL.Add('WHERE CD_PRODUTO = :CD_PRODUTO AND CD_TURMA = :CD_TURMA AND CD_ANOSEMESTRE = :CD_ANOSEMESTRE');

   for I := 0 to grdProdutosTurmas.SelectedRows.Count - 1 do
   begin
      qyProdutosTurmas.GotoBookmark(pointer(grdProdutosTurmas.SelectedRows.Items[I]));

      qyDeleteProdutosTurmas.ParamByName('CD_PRODUTO').AsString := qyProdutoscd_produto.AsString;
      qyDeleteProdutosTurmas.ParamByName('CD_TURMA').AsString := qyProdutosTurmascd_turma.AsString;
      qyDeleteProdutosTurmas.ParamByName('CD_ANOSEMESTRE').AsString := qyProdutosTurmascd_anosemestre.AsString;

      qyDeleteProdutosTurmas.ExecSQL;
   end;

   abreQueryTurmas;
end;

end.
