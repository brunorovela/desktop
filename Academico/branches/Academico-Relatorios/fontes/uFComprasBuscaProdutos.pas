unit uFComprasBuscaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, UMComboBox, DB,
  ZAbstractRODataset, UZDataset, uListaColigadas;

type
  TfrmComprasBuscaProdutos = class(TForm)
    Panel1: TPanel;
    Bevel6: TBevel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    cbCategorias: TUMComboBox;
    edFiltroNomeProduto: TEdit;
    Label2: TLabel;
    qyListaProdutos: TUMZReadOnlyQuery;
    qyListaProdutosCD_PRODUTO: TStringField;
    qyListaProdutosDS_PRODUTO: TStringField;
    dsListaProdutos: TDataSource;
    edFiltroCodigoProduto: TEdit;
    Label3: TLabel;
    qyListaProdutosQTD_PRODUTOS: TLargeintField;
    cbColigadas: TUMComboBox;
    Label4: TLabel;
    qyListaProdutosSN_IMPRIMIR_CUPOM: TSmallintField;
    qyListaProdutoscodBarras: TStringField;
    qyListaProdutosNR_PARCELAS: TIntegerField;
    qyListaProdutoscd_categoria: TIntegerField;
    qyListaProdutossn_acumular_valores: TSmallintField;
    qyListaProdutossn_gerar_titulo: TSmallintField;
    qyListaProdutosvl_compra: TFloatField;
    qyListaProdutosVL_PRODUTO: TFloatField;
    procedure cbColigadasChange(Sender: TObject);
    procedure edFiltroNomeProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edFiltroCodigoProdutoEnter(Sender: TObject);
    procedure cbCategoriasChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetColigada: Integer;
    { Private declarations }
    procedure CarregarComboCategorias();
    procedure CarregarComboColigadas();

    property cd_coligada: Integer read GetColigada;
  public
    { Public declarations }
    PermitiSemEstoque, flgSearch: Boolean;
    
    procedure Filtrar( const cd_produto: String = ''; const coligada_logada: Boolean = False; const cd_barra : String = '');
  end;

var
  frmComprasBuscaProdutos: TfrmComprasBuscaProdutos;

implementation

uses uDM, uItemCombo, General;

{$R *.dfm}

procedure TfrmComprasBuscaProdutos.CarregarComboCategorias;
const
   SQL_COMBO_CATEGORIAS =
      ' SELECT cc.CD_CATEGORIA, cc.DS_CATEGORIA FROM COMP_CATEGORIAS cc '
      + ' INNER JOIN comp_categorias_coligadas ccc ON ( ccc.cd_categoria = cc.CD_CATEGORIA ) ';
   SQL_COMBO_CATEGORIAS_ORDER =
      ' GROUP BY cc.CD_CATEGORIA  ORDER BY DS_CATEGORIA ';
var
   qyListaCategorias: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyListaCategorias);

   qyListaCategorias.Close();
   qyListaCategorias.SQL.Text := SQL_COMBO_CATEGORIAS;
   if cd_coligada > 0 then
   begin
      qyListaCategorias.SQL.Add('WHERE ccc.CD_COLIGADA = :CD_COLIGADA');
      qyListaCategorias.ParamByName('CD_COLIGADA').AsInteger := cd_coligada;
   end else begin
      qyListaCategorias.SQL.Add(Format('WHERE ccc.CD_COLIGADA IN ( %s )', [DM.GetColigadas()]));
   end;
   qyListaCategorias.SQL.Add(SQL_COMBO_CATEGORIAS_ORDER);
   qyListaCategorias.Open();

   cbCategorias.Clear();
   cbCategorias.AddItem( '', nil );
   while not qyListaCategorias.Eof do
   begin
      cbCategorias.AddItem(
         qyListaCategorias.FieldByName('DS_CATEGORIA').AsString,
         TItemCombo.Create(
            qyListaCategorias.FieldByName('CD_CATEGORIA').AsString,
            qyListaCategorias.FieldByName('DS_CATEGORIA').AsString
         )
      );

      qyListaCategorias.Next();
   end;

   if cbCategorias.Items.Count = 2 then
   begin
      cbCategorias.ItemIndex := 1;
   end;

   FreeAndNil(qyListaCategorias);
end;

procedure TfrmComprasBuscaProdutos.CarregarComboColigadas;
begin
   cbColigadas.Clear;

   DM.qryColigadas.First;

   cbColigadas.AddItem( '', nil );
   while not DM.qryColigadas.Eof do
   begin
      { COMO AGORA É
      if somente_logada AND ( DM.qryColigadasCD_COLIGADA.AsInteger <> DM.iColigadaSelecionada ) then
      begin
         DM.qryColigadas.Next;
         Continue;
      end;}

      cbColigadas.AddItem(
         DM.qryColigadasNM_COLIGADA.AsString,
         TItemCombo.Create(
            DM.qryColigadasCD_COLIGADA.AsString,
            DM.qryColigadasNM_COLIGADA.AsString
         ) );

      DM.qryColigadas.Next;
   end;
end;

procedure TfrmComprasBuscaProdutos.cbCategoriasChange(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmComprasBuscaProdutos.cbColigadasChange(Sender: TObject);
begin
   CarregarComboCategorias;
   if cbCategorias.Items.Count > 1 then
      cbCategorias.ItemIndex := 1;
   Filtrar;
end;

procedure TfrmComprasBuscaProdutos.DBGrid1DblClick(Sender: TObject);
begin
   if not PermitiSemEstoque AND ( qyListaProdutosQTD_PRODUTOS.AsInteger <= 0 ) then
   begin
      Mensagem( 'Não existe mais produtos deste tipo em estoque.' );
      Exit;
   end;   

   flgSearch := True;
   Close();
end;

procedure TfrmComprasBuscaProdutos.edFiltroCodigoProdutoEnter(Sender: TObject);
begin
   edFiltroCodigoProduto.SelectAll();
end;

procedure TfrmComprasBuscaProdutos.edFiltroNomeProdutoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   Filtrar();
end;

procedure TfrmComprasBuscaProdutos.Filtrar( const cd_produto: String; const coligada_logada: Boolean; const cd_barra : String);
const
   SQL_FILTRAR =
      ' SELECT DISTINCT CP.CD_PRODUTO, CP.DS_PRODUTO, CP.SN_IMPRIMIR_CUPOM, cp.VL_PRODUTO,' +
      '        CAST( GET_COMPRAS_QTD_ESTOQUE( CP.CD_PRODUTO ) AS SIGNED ) AS QTD_PRODUTOS, ' +
      '        CB.cd_codigo_barras as codBarras, CP.NR_PARCELAS, cp.cd_categoria, cp.sn_acumular_valores, cp.sn_gerar_titulo ' +
      '  ,  GET_VALOR_ULTIMA_COMPRA( CP.CD_PRODUTO ) vl_compra ' +
      ' FROM COMP_PRODUTOS CP ' +
      '      INNER JOIN COMP_CATEGORIAS CC ON ( CC.CD_CATEGORIA = CP.CD_CATEGORIA ) ' +
      '      LEFT JOIN  COMP_CODIGO_BARRAS CB on (CP.cd_produto = CB.cd_produto AND CB.sn_cantina = 0 )     ' +
      '      INNER JOIN comp_categorias_coligadas ccc ON ( ccc.cd_categoria = CC.CD_CATEGORIA ) ' +
      ' WHERE (CC.SN_VENDA_PRODUTO = 1)  ';
   SQL_FILTRAR_WHERE_CATEGORIA =
      ' AND CP.CD_CATEGORIA = :CD_CATEGORIA ';
   SQL_FILTRAR_WHERE_CODIGO_BARRA =
      ' AND CB.CD_CODIGO_BARRAS = :CD_COD_BARRA ';
   SQL_FILTRAR_WHERE_DS_CATEGORIA =
      ' AND CC.DS_CATEGORIA LIKE :DS_CATEGORIA ';
   SQL_FILTRAR_WHERE_CODIGO =
      ' AND CP.CD_PRODUTO LIKE :CD_PRODUTO ';
   SQL_FILTRAR_WHERE_COLIGADA =
      ' AND ccc.CD_COLIGADA =  :CD_COLIGADA ';
   SQL_FILTRAR_WHERE_DESCRICAO =
      ' AND CP.DS_PRODUTO LIKE :DS_PRODUTO ';
   SQL_FILTRAR_ORDER_BY =
      ' ORDER BY CP.DS_PRODUTO ';
var
   listaColigada : TListaColigadas;
   i: integer;
begin
   qyListaProdutos.Close();
   qyListaProdutos.SQL.Text := SQL_FILTRAR;


   //Busca pela coligada filha selecionada
   listaColigada := DM.UsuarioLogado.GetColigadasFilhas;

   if cbColigadas.ItemIndex <> -1 then
   begin    
      for i := 0 to listaColigada.Count - 1 do
      begin
          if listaColigada.Items[i].Nome = cbColigadas.Items[cbColigadas.ItemIndex] then
          begin
            qyListaProdutos.SQL.Add(SQL_FILTRAR_WHERE_COLIGADA);
            qyListaProdutos.ParamByName('CD_COLIGADA').AsInteger :=  listaColigada.Items[i].Codigo;
            break;
          end;
      end;
   end;

   if ( cd_produto = '' ) then
   begin
      if ( trim(cbCategorias.Text) <> '' ) then
      begin
         if ( cbCategorias.ItemIndex > -1 ) AND
            ( LowerCase(TItemCombo(cbCategorias.Items.Objects[ cbCategorias.ItemIndex ]).getDescricao()) = LowerCase(cbCategorias.Text) ) then
         begin
            qyListaProdutos.SQL.Add( SQL_FILTRAR_WHERE_CATEGORIA );

            qyListaProdutos.ParamByName('CD_CATEGORIA').AsInteger :=
               StrToInt(TItemCombo(cbCategorias.Items.Objects[ cbCategorias.ItemIndex ]).getCodigo());
         end else begin
            qyListaProdutos.SQL.Add( SQL_FILTRAR_WHERE_DS_CATEGORIA );
            qyListaProdutos.ParamByName('DS_CATEGORIA').AsString := '%' + cbCategorias.Text + '%';
         end;
      end;
      if ( Trim(edFiltroCodigoProduto.Text) <> '' ) then
      begin
         qyListaProdutos.SQL.Add( SQL_FILTRAR_WHERE_CODIGO );
         qyListaProdutos.ParamByName('CD_PRODUTO').AsString :=
            '%'+edFiltroCodigoProduto.Text+'%';
      end;   
      if ( Trim(edFiltroNomeProduto.Text) <> '' ) then
      begin
         qyListaProdutos.SQL.Add( SQL_FILTRAR_WHERE_DESCRICAO );
         qyListaProdutos.ParamByName('DS_PRODUTO').AsString :=
            '%' + edFiltroNomeProduto.Text + '%';
      end;
      if ( Trim(cd_barra) <> '' ) then
      begin
         qyListaProdutos.SQL.Add( SQL_FILTRAR_WHERE_CODIGO_BARRA );
         qyListaProdutos.ParamByName('CD_COD_BARRA').AsString := cd_barra;
         
         if cbColigadas.ItemIndex > 0 then
            qyListaProdutos.SQL.Add(Format(SQL_FILTRAR_WHERE_COLIGADA, [DM.GetColigadas()]));
      end;
   end else begin
      if ( Trim(cd_produto) <> '' ) then
      begin
         qyListaProdutos.SQL.Add( SQL_FILTRAR_WHERE_CODIGO );
         qyListaProdutos.ParamByName('CD_PRODUTO').AsString := cd_produto;

         { Se não entrou no IF de coligadas acima, mas está sendo cadastrado por coligada }
         if  cbColigadas.ItemIndex > 0 then
            qyListaProdutos.SQL.Add(Format(SQL_FILTRAR_WHERE_COLIGADA, [DM.GetColigadas()]));
      end;
   end;

   qyListaProdutos.SQL.Add( SQL_FILTRAR_ORDER_BY );

   qyListaProdutos.Open();
end;

procedure TfrmComprasBuscaProdutos.FormCreate(Sender: TObject);
begin
   PermitiSemEstoque := True;

   CarregarComboColigadas();
end;

procedure TfrmComprasBuscaProdutos.FormShow(Sender: TObject);
begin
   flgSearch := False;
   CarregarComboColigadas();
   CarregarComboCategorias();

   Filtrar();
end;

function TfrmComprasBuscaProdutos.GetColigada: Integer;
begin
   Result := 0;

   if ( cbColigadas.ItemIndex > -1 ) AND
      ( cbColigadas.Items.Objects[cbColigadas.ItemIndex] <> nil ) then
   begin
      Result := StrToInt(TItemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
   end;   
end;

end.
