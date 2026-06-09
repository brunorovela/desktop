unit uFComprasBuscaKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset;

type
  TfrmComprasBuscaKits = class(TForm)
    qyKits: TUMZQuery;
    qyKitscd_kit: TIntegerField;
    qyKitsnm_kit: TStringField;
    qyKitsme_observacao: TMemoField;
    dsKits: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel6: TBevel;
    Label1: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    grdKits: TDBGrid;
    edCod: TEdit;
    edCodBarra: TEdit;
    edNome: TEdit;
    qyKitscd_coidigo_barras: TStringField;
    qyKitsNR_PARCELAS: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure edCodEnter(Sender: TObject);
    procedure edCodBarraEnter(Sender: TObject);
    procedure grdKitsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCodBarraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    nrMaxKits : Integer;
    procedure setnrMaxKits(maxKits : Integer);

    { Private declarations }
  public
    flgSearch: Boolean;
    procedure Filtrar( const cd_kit: String = ''; const cd_barra : String = '');
    function isQuanEstoque(): boolean;
    function getnrMaxKits : Integer;
    { Public declarations }
  end;

var
  frmComprasBuscaKits: TfrmComprasBuscaKits;

implementation

uses uDM, General;

procedure TfrmComprasBuscaKits.edCodBarraEnter(Sender: TObject);
begin
   edCodBarra.SelectAll();
end;

procedure TfrmComprasBuscaKits.edCodBarraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   filtrar;
end;

procedure TfrmComprasBuscaKits.edCodEnter(Sender: TObject);
begin
  edCod.SelectAll();
end;

procedure TfrmComprasBuscaKits.Filtrar( const cd_kit: String; const cd_barra : String);
const
   SQL_FILTRAR =
      'SELECT k.*, b.cd_codigo_barras as cd_codigo_barras, NR_PARCELAS '+
      'FROM comp_kits k '+
      'LEFT JOIN comp_codigo_barras b on (b.cd_kit = k.cd_kit AND b.sn_cantina = 0) '  +
      'WHERE 1=1 ';
   SQL_Order_By =
      ' ORDER BY k.nm_Kit';
   SQL_FILTRAR_WHERE_CODIGO_BARRA =
      ' AND b.CD_CODIGO_BARRAS = :CD_COD_BARRA ';
   SQL_FILTRAR_WHERE_CODIGO =
      ' AND k.CD_KIT LIKE :CD_KIT ';
   SQL_FILTRAR_WHERE_DESCRICAO =
      ' AND k.NM_KIT LIKE :NM_KIT ';
begin
   qyKits.Close;

   qyKits.SQL.Text := SQL_FILTRAR;
   if ( Trim(cd_kit) = '' ) then
   begin
      if ( Trim(edCod.Text) <> '' ) then
      begin
         qyKits.SQL.Add( SQL_FILTRAR_WHERE_CODIGO );
         qyKits.ParamByName('CD_KIT').AsString := edCod.Text;
      end;
      if ( Trim(edNome.Text) <> '' ) then
      begin
         qyKits.SQL.Add( SQL_FILTRAR_WHERE_DESCRICAO );
         qyKits.ParamByName('NM_KIT').AsString :=
               '%' + edNome.Text + '%';
      end;
      if ( Trim(edCodBarra.Text) <> '' ) then
      begin
         qyKits.SQL.Add( SQL_FILTRAR_WHERE_CODIGO_BARRA );
         qyKits.ParamByName('CD_COD_BARRA').AsString := edCodBarra.Text;
      end;
      if ( Trim(cd_barra) <> '' ) then
      begin
         qyKits.SQL.Add( SQL_FILTRAR_WHERE_CODIGO_BARRA );
         qyKits.ParamByName('CD_COD_BARRA').AsString := cd_barra;
      end;
   end
   else
   begin
      if ( Trim(cd_kit) <> '' ) then
      begin
         qyKits.SQL.Add( SQL_FILTRAR_WHERE_CODIGO );
         qyKits.ParamByName('CD_KIT').AsString := cd_kit;
      end;
   end;

   qyKits.SQL.Add( SQL_Order_By );

   qyKits.Open();
end;

procedure TfrmComprasBuscaKits.FormCreate(Sender: TObject);
begin
   setnrMaxKits(0);
end;

procedure TfrmComprasBuscaKits.FormShow(Sender: TObject);
begin
   flgSearch := false;
   filtrar;
end;

function TfrmComprasBuscaKits.getnrMaxKits: Integer;
begin
   result := self.nrMaxKits;
end;

procedure TfrmComprasBuscaKits.grdKitsDblClick(Sender: TObject);
begin
   if not (isQuanEstoque) then
   begin
      Mensagem( 'Não existe quantidade suficiente dos produtos em estoque para retirada deste kit.' );
      Exit;
   end;

   flgSearch := True;
   Close();
end;

function TfrmComprasBuscaKits.isQuanEstoque: Boolean;
const
   SQL_BUSCA_ESTOQUE_PRODUTO = 'SELECT CAST( GET_COMPRAS_QTD_ESTOQUE( :CD_PRODUTO ) AS SIGNED ) AS QTD_PRODUTOS';
   SQL_BUSCA_ITEM_KIT = 'select cd_produto, nr_quantidade from comp_kits_itens where cd_kit = :cd_kit';
var
   qryProdutosKit : TUMZQuery;
   qryBuscaItens : TUMZQuery;
   quantMaxKit : Integer;
   quantItem : Integer;
   strAux : String;
   posVirgula : Integer;
begin
   quantMaxKit := 99999;
   dm.CriarConsulta(qryProdutosKit);
   dm.CriarConsulta(qryBuscaItens);

   qryBuscaItens.Close;
   qryBuscaItens.SQL.Clear;
   qryBuscaItens.SQL.Add(SQL_BUSCA_ITEM_KIT);
   qryBuscaItens.ParamByName('cd_kit').AsString := qyKitscd_kit.AsString;
   qryBuscaItens.Open;


   while not qryBuscaItens.Eof do
   begin
      qryProdutosKit.Close;
      qryProdutosKit.sql.Clear;
      qryProdutosKit.SQL.Add(SQL_BUSCA_ESTOQUE_PRODUTO);
      qryProdutosKit.ParamByName('cd_produto').AsString := qryBuscaItens.FieldByName('cd_produto').AsString;
      qryProdutosKit.Open;

      { Caso no item tenha registrado com a quantidade 0 então não verifica }
      if (qryBuscaItens.FieldByName('nr_quantidade').AsInteger > 0 ) then
      begin
         { Guarda o resultado da divisão do numero de produtos requisitados pela quantidade do estoque  }
         { Para calcular a quantidade de unidades maximas que pode ser retirada do kit } 
         strAux := FloatToStr(qryProdutosKit.FieldByName('qtd_produtos').AsInteger / qryBuscaItens.FieldByName('nr_quantidade').AsInteger);

         { Trata para quando a divisão der float }
         posVirgula := pos(',',strAux);
         if (posVirgula > 0) then
         begin
            quantItem := StrToInt(copy(strAux,0,posVirgula -1));
         end
         else
         begin
            quantItem := StrToInt(strAux);
         end;

         { Se for menos que 1 sai pois não existe estoque suficiente }
         if (quantItem < 1) then
         begin
            result := false;
            quantMaxKit := 0;
            break;
         end;

         { Guarda o menor valor de quantidade de kit disponivel para retirada}
         if (quantItem < quantMaxKit ) then
         begin
            quantMaxKit := quantItem;
         end;
      end;
      
      qryBuscaItens.Next;
   end;
   
   setnrMaxKits(quantMaxKit);

   result := true;
end;

procedure TfrmComprasBuscaKits.setnrMaxKits(maxKits: Integer);
begin

   { Tratamento case não exista nenhum produto com quantidade no kit }
   if (maxKits = 99999) then
   begin
      maxKits := 0;
   end;
   
   self.nrMaxKits :=  maxKits;
end;

{$R *.dfm}

end.
