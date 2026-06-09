unit uFacturasGerar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, UZDataset, uDM, DBCtrls,
  uFSelecionarPessoa, DBClient, Mask, ToolWin, ImgList, General,
  UMDateTimePicker;

type
  TfrmFacturasGerar = class(TForm)
    Panel1: TPanel;
    paCabecalho: TPanel;
    Panel2: TPanel;
    lbFiltroAluno: TLabel;
    edAluno: TEdit;
    btFiltrar: TButton;
    lbFiltroData: TLabel;
    lbAte: TLabel;
    dbListaMensalidades: TDBGrid;
    qyTitulos: TUMZQuery;
    dsTitulos: TDataSource;
    qyTitulosdatavencimento: TDateTimeField;
    qyTitulosparcela: TSmallintField;
    qyTitulosds_tipo_titulo: TStringField;
    qyTitulosds_situacao: TStringField;
    qyTituloscd_factura: TLargeintField;
    cdsTitulos: TClientDataSet;
    cdsTitulosdatavencimento: TDateTimeField;
    cdsTitulosparcela: TIntegerField;
    cdsTitulosds_tipo_titulo: TStringField;
    cdsTitulosds_situacao: TStringField;
    cdsTituloscd_factura: TIntegerField;
    cdsTitulosselecionado: TIntegerField;
    dbCheckFactura: TDBCheckBox;
    cdsTituloschecado: TBooleanField;
    qyTituloscd_mensalidade: TIntegerField;
    cdsTituloscd_mensalidade: TIntegerField;
    toolMatricula: TToolBar;
    ToolButton2: TToolButton;
    btGerarFactura: TToolButton;
    ToolButton4: TToolButton;
    btCancelar: TToolButton;
    ToolButton12: TToolButton;
    imgListaBotoes: TImageList;
    sbBuscarPessoa: TSpeedButton;
    cdsTitulosvalorbruto: TFloatField;
    qyTitulosvalorbruto: TFloatField;
    umdtInicio: TUMDateTimePicker;
    umdtFim: TUMDateTimePicker;
    procedure btCancelarClick(Sender: TObject);
    procedure btGerarFacturaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbListaMensalidadesColExit(Sender: TObject);
    procedure dbListaMensalidadesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btFiltrarClick(Sender: TObject);
    procedure sbBuscarPessoaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetcdPessoa(const Value: Integer);
    procedure SetnmPessoa(const Value: String);
  private
    FnmPessoa: String;
    FcdPessoa: Integer;
    property cdPessoa: Integer read FcdPessoa write SetcdPessoa;
    property nmPessoa: String read FnmPessoa write SetnmPessoa;
    function getSQL( nr_tipo : integer ) : string;
  public
    { Public declarations }
  end;

var
   frmFacturasGerar: TfrmFacturasGerar;

implementation

uses
   uFacturas;

{$R *.dfm}

procedure TfrmFacturasGerar.btGerarFacturaClick(Sender: TObject);
var
   qyFactura         : TUMZQuery;
   point             : Integer;
   cd_factura        : Integer;
   valor             : Double;
   ds_mensalidades   : string;
begin
   valor             := 0;
   ds_mensalidades   := '';
   point             := Integer(cdsTitulos.GetBookmark);

   //posiciona o cursor no primeiro registro
   cdsTitulos.First;

   //percorre e soma os titulos selecionados                                             
   while not cdsTitulos.Eof do
   begin
      if cdsTituloschecado.AsBoolean then
      begin
         valor := valor + cdsTitulosvalorbruto.AsFloat;
      end;

      cdsTitulos.Next;
   end;

   if valor = 0 then
   begin
      Mensagem( 'É necessário uma mensalidade para gerar uma factura.', 'Aviso', MB_OK + MB_ICONWARNING );
      exit;
   end;

   cdsTitulos.GotoBookmark(Pointer(point));
   cdsTitulos.First;

   {Inserindo a Factura}
   DM.CriarConsulta( qyFactura );
   qyFactura.SQL.Text := 'INSERT INTO fin_facturas(cd_situacao, dt_emissao, cd_pessoa, vl_total) VALUES';
   qyFactura.SQL.Add( '( 1, NOW(), :cd_pessoa, :vl_total )' );

   qyFactura.ParamByName('cd_pessoa').AsInteger    := Self.cdPessoa;
   qyFactura.ParamByName('vl_total').AsFloat       := valor;

   qyFactura.ExecSQL();

   {Pegando código da Factura inserida}
   cd_factura := DM.LastInsert();

   qyFactura.SQL.Clear();
   qyFactura.Params.Clear();

   //percorre as mensalidades selecionadas para adicionar na Factura
   while not cdsTitulos.Eof do
   begin
      if cdsTituloschecado.AsBoolean then
      begin

         //adiciona as mensalidades no texto separando-as por vírgula
         if (ds_mensalidades = '') then
         begin
            ds_mensalidades := cdsTituloscd_mensalidade.AsString;
         end
         else
         begin
            ds_mensalidades := ds_mensalidades + ', ' + cdsTituloscd_mensalidade.AsString;
         end;
         
         {Inserindo os itens}
         qyFactura.SQL.Text := 'INSERT INTO fin_facturas_itens(cd_factura, cd_mensalidade, vl_item) VALUES ';
         qyFactura.SQL.Add('( :cd_factura, :cd_mensalidade, :vl_item )');

         qyFactura.ParamByName('cd_factura').AsInteger       := cd_factura;
         qyFactura.ParamByName('cd_mensalidade').AsInteger   := cdsTituloscd_mensalidade.AsInteger;
         qyFactura.ParamByName('vl_item').AsFloat            := cdsTitulosvalorbruto.AsFloat;

         qyFactura.ExecSQL();

         qyFactura.SQL.Clear();
         qyFactura.Params.Clear();
      end;

      cdsTitulos.Next;
   end;

   {Atualizando todas as mensalidades selecionadas}
   qyFactura.SQL.Text := 'UPDATE mensalidades SET sn_nfe_gerada = 1, nr_nf = :cd_factura WHERE';
   qyFactura.SQL.Add(' cd_mensalidade IN ( '+ds_mensalidades+' )');
   qyFactura.ParamByName('cd_factura').AsInteger := cd_factura;
   qyFactura.ExecSQL();

   FreeAndNil( qyFactura );
   cdsTitulos.GotoBookmark( Pointer(point) );
   frmFacturas.qyFacturas.close();
   frmFacturas.qyFacturas.Open();
   btCancelar.Click;
end;

procedure TfrmFacturasGerar.btCancelarClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmFacturasGerar.btFiltrarClick(Sender: TObject);
var
   ds_sql       : string;
begin
   ds_sql      := Self.getSQL( 2 );

   qyTitulos.Close;
   qyTitulos.SQL.Text := ds_sql;
   qyTitulos.ParamByName('cd_aluno').AsInteger := Self.cdPessoa;

   if umdtInicio.Date < umdtFim.Date then
   begin
      qyTitulos.ParamByName('inicio').AsDate  := umdtInicio.Date;
      qyTitulos.ParamByName('fim').AsDate     := umdtFim.Date;
   end
   else
   begin
      Mensagem( 'O período selecionado não é válido.', 'Aviso', MB_OK + MB_ICONWARNING );
      exit;
   end;

   qyTitulos.Open;
   cdsTitulos.EmptyDataSet;

   if qyTitulos.RecordCount > 0 then
   begin
      while not(qyTitulos.Eof) do
      begin
         cdsTitulos.Insert;

         cdsTituloscd_mensalidade.AsInteger  := qyTituloscd_mensalidade.AsInteger;
         cdsTitulosselecionado.AsInteger     := Integer(qyTitulos.GetBookmark);
         cdsTitulosdatavencimento.AsDateTime := qyTitulosdatavencimento.AsDateTime;
         cdsTitulosparcela.AsInteger         := qyTitulosparcela.AsInteger;
         cdsTitulosds_tipo_titulo.AsString   := qyTitulosds_tipo_titulo.AsString;
         cdsTitulosvalorbruto.AsFloat        := qyTitulosvalorbruto.AsFloat;
         cdsTitulosds_situacao.AsString      := qyTitulosds_situacao.AsString;

         if not qyTituloscd_factura.IsNull then
         begin
            cdsTituloscd_factura.AsInteger   := qyTituloscd_factura.AsInteger;
         end
         else
         begin
            cdsTituloschecado.AsBoolean      := false;
         end;

         qyTitulos.Next;
      end;

      cdsTitulos.Post;
  end;
end;

procedure TfrmFacturasGerar.dbListaMensalidadesColExit(Sender: TObject);
begin
   if dbListaMensalidades.SelectedField.FieldName = 'checado' then
   begin
      dbCheckFactura.Visible := False
   end;
end;

procedure TfrmFacturasGerar.dbListaMensalidadesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

const IsChecked : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if not cdsTituloscd_factura.IsNull then
   begin
      dbListaMensalidades.Canvas.Font.Color:= clWindowFrame;
      dbListaMensalidades.DefaultDrawDataCell(Rect, dbListaMensalidades.columns[datacol].field, State);
   end
   else
   begin
      if Column.Field.FieldName = 'checado' then
      begin
         if gdFocused in State then
         begin
            dbCheckFactura.Left      := Rect.Left    +   dbListaMensalidades.Left + 2;
            dbCheckFactura.Top       := Rect.Top     +   dbListaMensalidades.top + 2;
            dbCheckFactura.Width     := Rect.Right   -   Rect.Left;
            dbCheckFactura.Height    := Rect.Bottom  -   Rect.Top;
            dbCheckFactura.Visible   := True;
         end
      else
      begin
         if (Column.Field.FieldName = 'checado') then
         begin
            DrawRect := Rect;
            InflateRect(DrawRect, -1, -1);
            dbListaMensalidades.Canvas.FillRect(Rect);
            DrawFrameControl(dbListaMensalidades.Canvas.Handle, DrawRect,DFC_BUTTON, ISChecked[Column.Field.AsBoolean]);
         end;
      end;
    end;
  end;
end;

procedure TfrmFacturasGerar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFacturasGerar.FormShow(Sender: TObject);
begin
   qyTitulos.Open;
   umdtinicio.Date := StrToDate ( '01/' + FormatDateTime ( 'mm/yyyy', date ) );;
// dtFinal.DateTime    := Now;
   btFiltrar.Click;
end;

function TfrmFacturasGerar.getSQL(nr_tipo : integer): string;
var
  qySQL     : TUMZQuery;
  ds_sql    : string;
begin
   DM.CriarConsulta(qySQL);

   //Busca o SQL da coligada selecionada
   qySQL.SQL.Text := 'SELECT ds_sql FROM fin_nfe_g2ka_sql WHERE cd_nfe_g2ka_sql_tipo = :nr_tipo AND cd_coligada IN (%s)';
   qySQL.SQL.Text := Format( qySQL.SQL.Text, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );
   qySQL.ParamByName('nr_tipo').AsInteger    := nr_tipo;
   qySQL.Open;

   ds_sql := qySQL.FieldByName('ds_sql').AsString;

   //se não encontrar o SQL da coligada selecionada busca o da coligada ZERO que serve para todas.
   if trim(ds_sql) = '' then
   begin
      qySQL.SQL.Text := 'SELECT ds_sql FROM fin_nfe_g2ka_sql WHERE cd_nfe_g2ka_sql_tipo = :nr_tipo AND cd_coligada = 0';
      qySQL.ParamByName('nr_tipo').AsInteger    := nr_tipo;
      qySQL.Open;

      ds_sql := qySQL.FieldByName('ds_sql').AsString;
   end;
         
   qySQL.Close();
   FreeAndNil( qySQL );

   Result := ds_sql;
end;

procedure TfrmFacturasGerar.SetcdPessoa(const Value: Integer);
begin
   FcdPessoa := Value;
end;

procedure TfrmFacturasGerar.SetnmPessoa(const Value: String);
begin
   FnmPessoa := Value;
end;

procedure TfrmFacturasGerar.sbBuscarPessoaClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpEstudante);

   if resultado_filtro.filtrado then
   begin
      edAluno.Text := IntToStr( resultado_filtro.cd_pessoa ) + ' - ' + resultado_filtro.nm_pessoa;
      self.SetnmPessoa(resultado_filtro.nm_pessoa);
      self.SetcdPessoa(resultado_filtro.cd_pessoa);
   end;
end;

end.
