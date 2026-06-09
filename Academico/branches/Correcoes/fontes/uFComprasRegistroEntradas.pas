unit uFComprasRegistroEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, ImgList, ToolWin, Mask, DBCtrls, Buttons,
  UMDateTimePicker, UMComboBox;

type
  TfrmComprasRegistroEntradas = class(TForm)
    Panel1: TPanel;
    pnCod: TPanel;
    Label1: TLabel;
    qyRegistraEntrada: TUMZQuery;
    Timer1: TTimer;
    qyRegistraEntradacd_compra: TIntegerField;
    qyRegistraEntradacd_produto: TStringField;
    qyRegistraEntradatp_entrada_saida: TSmallintField;
    qyRegistraEntradacd_pessoa: TIntegerField;
    qyRegistraEntradatp_pessoa: TSmallintField;
    qyRegistraEntradanr_quantidade: TIntegerField;
    qyRegistraEntradadt_compra: TDateTimeField;
    qyRegistraEntradadt_entrada: TDateTimeField;
    qyRegistraEntradavl_compra: TFloatField;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolButton2: TToolButton;
    ImageList2: TImageList;
    dsRegistraEntrada: TDataSource;
    edCodigoProduto: TDBEdit;
    SpeedButton5: TSpeedButton;
    pnSelecionaEntrada: TPanel;
    rgTipoEntrada: TRadioGroup;
    PnCodBarra: TPanel;
    Label8: TLabel;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    edQtdAtualEstoque: TEdit;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edNomeFornecedor: TEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    edCodBarra: TEdit;
    edNomeProduto: TEdit;
    Label9: TLabel;
    qyRegistraEntradacd_usuario: TIntegerField;
    umdtCompra: TUMDateTimePicker;
    pnColigadas: TPanel;
    Label10: TLabel;
    cbColigadas: TUMComboBox;
    qyRegistraEntradacd_coligada: TIntegerField;
    procedure edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoProdutoExit(Sender: TObject);
    procedure edCodBarraExit(Sender: TObject);
    procedure edCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure edCodBarraChange(Sender: TObject);
    procedure rgTipoEntradaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyRegistraEntradaBeforeInsert(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edCodigoProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qyRegistraEntradaBeforePost(DataSet: TDataSet);
    procedure dsRegistraEntradaStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CarregarComboColigadas();
  private
    { Private declarations }

    procedure AbreQueryRegistraEstoque();
    procedure filtraAoSairDoCampo(isCodBarra : Boolean);
    function GetQtdAtualEstoque( cd_produto: String ): Integer;
    function GetColigada() :integer;
    property cd_coligada: Integer read GetColigada;
  public
    { Public declarations }
    cd_produto_carregado: String;
  end;

var
  frmComprasRegistroEntradas: TfrmComprasRegistroEntradas;

implementation

uses uDM, uFComprasBuscaProdutos, General, uCadEmpresas, uUsuario,
  ClassPessoas, uFSelecionarPessoa, uFornecedores, uItemCombo;

{$R *.dfm}

procedure TfrmComprasRegistroEntradas.AbreQueryRegistraEstoque;
const
   SQL_REGISTRA_ESTOQUE =
      ' SELECT * FROM comp_estoque WHERE 1=0 ';
begin
   qyRegistraEntrada.Close();
   qyRegistraEntrada.SQL.Text := SQL_REGISTRA_ESTOQUE;
   qyRegistraEntrada.Open();
end;

procedure TfrmComprasRegistroEntradas.btnCancelarClick(Sender: TObject);
begin
   qyRegistraEntrada.Cancel();
   edCodBarra.Text := '';
end;

procedure TfrmComprasRegistroEntradas.btnIncluirClick(Sender: TObject);
begin
   if not ( qyRegistraEntrada.State IN [dsInsert] ) then
      qyRegistraEntrada.Insert();
end;

procedure TfrmComprasRegistroEntradas.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasRegistroEntradas.btnSalvarClick(Sender: TObject);
begin
   umdtCompra.SetFocus;

   if Trim( qyRegistraEntradacd_produto.AsString ) = '' then
   begin
      Mensagem( 'Informe o Produto.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edCodigoProduto.SetFocus;
      Exit;
   end;

   if not ( qyRegistraEntradanr_quantidade.AsInteger >= 1 ) then
   begin
      Mensagem( 'Informe uma quantia válida.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      DBEdit3.SetFocus;
      Exit;
   end;

   if qyRegistraEntradavl_compra.IsNull then
   begin
      Mensagem( 'Informe o valor unitário.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      DBEdit4.SetFocus;
      Exit;
   end;

   IF (pnColigadas.Visible) THEN
   begin

      if (cd_coligada <= 0) then begin
          Mensagem( 'Este produto obriga a seleção da Unidade para dar entrada no estoque.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
          cbColigadas.SetFocus;
          Exit;
      end;

     qyRegistraEntradacd_coligada.AsInteger :=  cd_coligada ;
   end
   else
   begin
      qyRegistraEntradacd_coligada.AsInteger :=  0;
   end;

   try
      try
         qyRegistraEntrada.Post();
      finally
         edNomeProduto.SetFocus();
         AbreQueryRegistraEstoque();
      end;
      Mensagem('Entrada efetuada com Sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
      pnColigadas.Visible := FALSE;
   except
      Mensagem( 'Erro ao registrar a entrada, verifique se os campos foram preenchidos com informações válidas.', Application.Title, MB_OK + MB_ICONERROR, Handle );
   end;
end;

procedure TfrmComprasRegistroEntradas.DBEdit2Exit(Sender: TObject);
begin
   if ( DBEdit2.Text <> '' ) then
   begin
      edNomeFornecedor.Text := ClassePessoas.GetNome( StrToInt( DBEdit2.Text ) );

      if ( Trim(edNomeFornecedor.Text) = '' ) then
      begin
         Mensagem( 'Código inexistente.' );
         DBEdit2.SetFocus();
         DBEdit2.SelectAll();
      end else begin
         if ClassePessoas.IsPessoaJuridica( StrToInt( DBEdit2.Text ) ) then
            qyRegistraEntradatp_pessoa.AsInteger := 2
         else
            qyRegistraEntradatp_pessoa.AsInteger := 1;
      end;
   end else begin
      edNomeFornecedor.Text := '';
   end;
end;

procedure TfrmComprasRegistroEntradas.DBEdit4KeyPress(Sender: TObject;
  var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
end;

procedure TfrmComprasRegistroEntradas.edCodBarraChange(Sender: TObject);
begin
   edCodBarra.SelectAll();
end;

procedure TfrmComprasRegistroEntradas.edCodBarraExit(Sender: TObject);
begin
   if (Trim(edCodBarra.Text) = '') then
   begin
      DBEdit3.SetFocus;
      Exit;
   end;

   filtraAoSairDoCampo(true);

   DBEdit3.SetFocus;
end;

procedure TfrmComprasRegistroEntradas.edCodBarraKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodBarraExit(nil);
   end;
end;

procedure TfrmComprasRegistroEntradas.edCodigoProdutoEnter(Sender: TObject);
begin
   edCodigoProduto.SelectAll();
end;

procedure TfrmComprasRegistroEntradas.edCodigoProdutoExit(Sender: TObject);
begin
   if ( trim(qyRegistraEntradacd_produto.AsString) = '' ) then
   begin
      edNomeProduto.Text := '';
      Exit;
   end;
   
   filtraAoSairDoCampo(false);
end;

procedure TfrmComprasRegistroEntradas.edCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      filtraAoSairDoCampo(false);
   end;
end;

procedure TfrmComprasRegistroEntradas.filtraAoSairDoCampo(isCodBarra: Boolean);
begin
   if frmComprasBuscaProdutos = nil then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   if (isCodBarra) then
   begin
      frmComprasBuscaProdutos.Filtrar( '', True , edCodBarra.Text );
   end
   else
   begin
      frmComprasBuscaProdutos.Filtrar( edCodigoProduto.Text , True );
   end;

   if frmComprasBuscaProdutos.qyListaProdutos.RecordCount <> 1 then
   begin
      Mensagem( 'Código inexistente.' );
      edNomeProduto.Text := '';
      edQtdAtualEstoque.Text := '';
      Exit;
   end;

   pnColigadas.Visible := frmComprasBuscaProdutos.qyListaProdutossn_estoque_por_coligada.AsInteger = 1;

   btnIncluirClick( nil );   

   edCodBarra.Text := frmComprasBuscaProdutos.qyListaProdutoscodBarras.AsString;
   qyRegistraEntradacd_produto.AsString := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edNomeProduto.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;
   DBEdit4.Text := frmComprasBuscaProdutos.qyListaProdutosvl_compra.AsString;
   edQtdAtualEstoque.Text := IntToStr( GetQtdAtualEstoque( qyRegistraEntradacd_produto.AsString ) );
end;

procedure TfrmComprasRegistroEntradas.dsRegistraEntradaStateChange(
  Sender: TObject);
begin
   btnIncluir.Enabled := not (qyRegistraEntrada.State IN [ dsInsert ]);

   btnCancelar.Enabled := qyRegistraEntrada.State IN [ dsInsert ];
   btnSalvar.Enabled := qyRegistraEntrada.State IN [ dsInsert ];

   if not ( qyRegistraEntrada.State IN [ dsInsert ] ) then
   begin
      edNomeFornecedor.Text := '';
      edNomeProduto.Text := '';
      edQtdAtualEstoque.Text := '';
      umdtCompra.Date := Now;
   end;   
end;

procedure TfrmComprasRegistroEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmComprasBuscaProdutos := nil;
end;

procedure TfrmComprasRegistroEntradas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := not (qyRegistraEntrada.State IN [dsInsert]);
   if not CanClose then
   begin
      Mensagem( 'Você precisa Salvar ou Cancelar o registro da Entrada.', Application.Title, MB_OK + MB_ICONINFORMATION, 0 );
   end;
end;

procedure TfrmComprasRegistroEntradas.FormCreate(Sender: TObject);
begin
   cd_produto_carregado := '';

   CarregarComboColigadas();
   pnColigadas.Visible := false;

   rgTipoEntrada.ItemIndex := strtoint(DM.variavel_parametro('saida_produtos_codigo_barras'));
   pnCod.Visible := true;
   PnCodBarra.Visible := false;
   if (rgTipoEntrada.ItemIndex = 1) then
   begin
      pnCod.Visible := false;
      PnCodBarra.Visible := true;
   end;

   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );
end;

procedure TfrmComprasRegistroEntradas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F2: btnIncluirClick( nil );
      VK_F5: btnSalvarClick( nil );
      VK_F6: btnCancelarClick( nil );
      VK_F12: btnSairClick( nil );
   end;
end;

procedure TfrmComprasRegistroEntradas.FormShow(Sender: TObject);
begin
   AbreQueryRegistraEstoque();

   umdtCompra.Date := Now();

   if ( cd_produto_carregado <> '' ) then
   begin      
      btnIncluirClick(nil);
      rgTipoEntrada.SetFocus();
      edCodigoProduto.Text := cd_produto_carregado;
      DBEdit2.SetFocus();
      filtraAoSairDoCampo(false);
      cd_produto_carregado := '';
   end;
end;

function TfrmComprasRegistroEntradas.GetQtdAtualEstoque(
  cd_produto: String): Integer;
const
   SQL_QTD_ATUAL_ESTOQUE =
      ' SELECT GET_COMPRAS_QTD_ESTOQUE( :CD_PRODUTO ) AS registros FROM DUAL ';
var
   qyQtdAtualEstoque: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyQtdAtualEstoque);

   qyQtdAtualEstoque.Close();

   qyQtdAtualEstoque.SQL.Text := SQL_QTD_ATUAL_ESTOQUE;
   qyQtdAtualEstoque.ParamByName('CD_PRODUTO').AsString := cd_produto;

   qyQtdAtualEstoque.Open();

   Result := qyQtdAtualEstoque.FieldByName('registros').AsInteger;

   FreeAndNil(qyQtdAtualEstoque);
end;

procedure TfrmComprasRegistroEntradas.qyRegistraEntradaBeforeInsert(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Entradas', npIncluir, True ) then Abort();
end;

procedure TfrmComprasRegistroEntradas.qyRegistraEntradaBeforePost(
  DataSet: TDataSet);
begin
   qyRegistraEntradadt_compra.AsDateTime := umdtCompra.getDate;
   qyRegistraEntradatp_entrada_saida.AsInteger := 1;

   if ( qyRegistraEntradatp_pessoa.IsNull ) then
      qyRegistraEntradatp_pessoa.AsInteger := 0;
end;

procedure TfrmComprasRegistroEntradas.rgTipoEntradaClick(Sender: TObject);
begin
   if (rgTipoEntrada.ItemIndex = 1) then
   begin
      pnCod.Visible := false;
      PnCodBarra.Visible := true;
   end
   else
   begin
      pnCod.Visible := true;
      PnCodBarra.Visible := false;
   end;

   btnCancelarClick(nil);
end;

procedure TfrmComprasRegistroEntradas.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

  resultado := TfrmSelecionarPessoa.Filtrar([], afpFornecedor);

   if not ( resultado.filtrado ) then
   begin
      if ( qyRegistraEntrada.State IN [dsInsert] ) then
      begin
         qyRegistraEntradatp_pessoa.AsInteger := 0;
         qyRegistraEntradacd_pessoa.Clear();
      end;
      edNomeFornecedor.Text := '';
      Exit;
   end;

   btnIncluirClick( nil );

   qyRegistraEntradacd_pessoa.AsInteger := resultado.cd_pessoa;
   edNomeFornecedor.Text := resultado.nm_pessoa;

   if ClassePessoas.IsPessoaJuridica( qyRegistraEntradacd_pessoa.AsInteger ) then
      qyRegistraEntradatp_pessoa.AsInteger := 2
   else
      qyRegistraEntradatp_pessoa.AsInteger := 1;
end;

procedure TfrmComprasRegistroEntradas.SpeedButton2Click(Sender: TObject);
begin
   if ( frm_Fornecedores = nil ) then
      Application.CreateForm( Tfrm_Fornecedores, frm_Fornecedores );

   frm_Fornecedores.Show();
   Close();

   frm_Fornecedores := nil;
end;

procedure TfrmComprasRegistroEntradas.SpeedButton5Click(Sender: TObject);
begin
   if frmComprasBuscaProdutos = nil then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   frmComprasBuscaProdutos.PermitiSemEstoque := True;
   frmComprasBuscaProdutos.ShowModal();
   if not frmComprasBuscaProdutos.flgSearch then Exit;

   // Se o produto tiver controle por coligada
   pnColigadas.Visible := frmComprasBuscaProdutos.qyListaProdutossn_estoque_por_coligada.AsInteger = 1;


   btnIncluirClick( nil );

   edCodBarra.Text := frmComprasBuscaProdutos.qyListaProdutoscodBarras.AsString;
   qyRegistraEntradacd_produto.AsString := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edNomeProduto.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;
   DBEdit4.Text := frmComprasBuscaProdutos.qyListaProdutosvl_compra.AsString;
   edQtdAtualEstoque.Text := IntToStr( GetQtdAtualEstoque( qyRegistraEntradacd_produto.AsString ) );
end;

procedure TfrmComprasRegistroEntradas.Timer1Timer(Sender: TObject);
begin
   if qyRegistraEntrada.State IN [ dsInsert ] then
      qyRegistraEntradadt_entrada.AsDateTime := Now;
end;

procedure TfrmComprasRegistroEntradas.CarregarComboColigadas;
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

function TfrmComprasRegistroEntradas.GetColigada: Integer;
begin
   Result := 0;

   if ( cbColigadas.ItemIndex > -1 ) AND
      ( cbColigadas.Items.Objects[cbColigadas.ItemIndex] <> nil ) then
   begin
      Result := StrToInt(TItemCombo(cbColigadas.Items.Objects[cbColigadas.ItemIndex]).getCodigo());
   end;   
end;

end.
