unit uFComprasControleEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset, UZDataset,
  ComCtrls, Buttons, ImgList, ToolWin, UMDateTimePicker, ZAbstractDataset;

type
  TfrmComprasControleEstoque = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    qyEstoque: TUMZReadOnlyQuery;
    edCodigo: TEdit;
    edNome: TEdit;
    rbPesquisaPorProduto: TRadioButton;
    rbPesquisaPorPessoa: TRadioButton;
    Label1: TLabel;
    sbPesquisa: TSpeedButton;
    dsEstoque: TDataSource;
    qyEstoqueDS_PRODUTO: TStringField;
    qyEstoqueDT_ENTRADA: TDateTimeField;
    qyEstoqueDS_ORIGEM: TStringField;
    qyEstoqueDS_DESTINO: TStringField;
    Button1: TButton;
    Panel4: TPanel;
    lbMsgRodape: TLabel;
    Panel5: TPanel;
    lbMsgTopo: TLabel;
    qyEstoqueTP_ENTRADA_SAIDA: TSmallintField;
    qyEstoqueCD_COMPRA: TIntegerField;
    qyEstoqueDS_ENTRADA: TStringField;
    qyEstoqueDS_SAIDA: TStringField;
    ilToolBar: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnRegistrarEntrada: TToolButton;
    btnRegistrarSaida: TToolButton;
    ToolButton4: TToolButton;
    btnCancelarMovimentacao: TToolButton;
    ToolButton5: TToolButton;
    btnFechar: TToolButton;
    ToolButton6: TToolButton;
    rbPesquisaPorKit: TCheckBox;
    qyEstoqueusuario: TStringField;
    umdtInicial: TUMDateTimePicker;
    umdtFinal: TUMDateTimePicker;
    qryComprasMensalidade: TUMZQuery;
    qryComprasMensalidadecd_mensalidade: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarMovimentacaoClick(Sender: TObject);
    procedure btnRegistrarSaidaClick(Sender: TObject);
    procedure btnRegistrarEntradaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsEstoqueDataChange(Sender: TObject; Field: TField);
    procedure edCodigoEnter(Sender: TObject);
    procedure edCodigoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbPesquisaPorProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   fs : TFormatSettings;

    { Private declarations }
    procedure sbPesquisaPorProduto(Sender: TObject);
    procedure sbPesquisaPorPessoa(Sender: TObject);



    function GetQtdEstoqueData( const cd_produto: String; const data: TDateTime; const nr_dias_anteriores: Integer = 0 ): Integer;
    function GetTotalProdutosPessoa( const cd_pessoa: Integer; const data_inicial, data_final: TDateTime ): Integer;
  public
    procedure Filtrar();
    { Public declarations }
  end;

var
  frmComprasControleEstoque: TfrmComprasControleEstoque;

implementation

uses uDM, uFComprasBuscaProdutos, uFComprasRegistroEntradas,
  uFComprasRegistroSaidas, General, ClassComprasEntradaSaida, uUsuario,
  ClassRegistros, ClassMensalidade, uFSelecionarPessoa, Main;

{$R *.dfm}

procedure TfrmComprasControleEstoque.btnCancelarMovimentacaoClick(
  Sender: TObject);
var
   mensalidade: ClasseRegistros;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.ControleEstoque.CancelarMovimentacao', npAcesso, True ) then Exit;

   qryComprasMensalidade.Close;
   qryComprasMensalidade.ParamByName('compra').AsInteger := qyEstoqueCD_COMPRA.AsInteger;
   qryComprasMensalidade.Open;

   while not qryComprasMensalidade.Eof do
   begin
      if ( ClasseComprasEntradaSaida.SituacaoMensalidade( qryComprasMensalidadeCD_MENSALIDADE.AsInteger ) <> msPendente ) then
      begin
         mensalidade := ClasseMensalidade.GetMensalidade(qryComprasMensalidadeCD_MENSALIDADE.AsInteger);
         Mensagem( 'Não é possível cancelar esta movimentação.' + Chr(13) +
                   'Você deve ir na Planilha de Recebimentos e estornar a mensalidade: ' + Chr(13) + Chr(13) +
                   '     Vencimento: ' + DateToStr(mensalidade.Campo['datavencimento']) + ', Valor: R$ ' + FloatToStrF(mensalidade.Campo['valorbruto'], ffFixed, 9, 2 ) + ', Tipo de Título: ' + mensalidade.Campo['ds_tipo_titulo'] );
         FreeAndNil(mensalidade);
         Exit;
      end;

      qryComprasMensalidade.Next;
   end;

   if ( Mensagem( 'Deseja cancelar a movimentação desta compra?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle ) = mrYes ) then
   begin
      ClasseComprasEntradaSaida.CancelarMovimentacao( qyEstoqueCD_COMPRA.AsInteger );

      Mensagem( 'Compra estornada.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      Filtrar();
   end;
end;

procedure TfrmComprasControleEstoque.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasControleEstoque.btnRegistrarEntradaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Entradas', npAcesso, True ) then Exit;   

   if frmComprasRegistroEntradas = nil then
      Application.CreateForm( TfrmComprasRegistroEntradas, frmComprasRegistroEntradas );

   if rbPesquisaPorProduto.Checked then
      frmComprasRegistroEntradas.cd_produto_carregado := edCodigo.Text
   else
      frmComprasRegistroEntradas.cd_produto_carregado := '';

   frmComprasRegistroEntradas.ShowModal();

   frmComprasRegistroEntradas := nil;
end;

procedure TfrmComprasControleEstoque.btnRegistrarSaidaClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Saidas', npAcesso, True ) then Exit;

   if rbPesquisaPorProduto.Checked then
   begin
      if ( frmComprasBuscaProdutos = nil ) then
      begin
         Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );
      end;

      frmComprasBuscaProdutos.Filtrar( edCodigo.Text );

      if ( frmComprasBuscaProdutos.qyListaProdutos.RecordCount = 0 ) then
      begin
         Mensagem( 'O produto selecionado não possui em estoque.',
                              Application.Title, MB_OK + MB_ICONWARNING, Handle );
         frmComprasBuscaProdutos := nil;
         Exit;
      end;

      frmComprasBuscaProdutos := nil;
   end;

   if not PrincipalForm.ProcuraForm(frmComprasRegistroSaidas) then
      Application.CreateForm(TfrmComprasRegistroSaidas, frmComprasRegistroSaidas);

   if rbPesquisaPorKit.Checked then
   begin
      if not rbPesquisaPorProduto.Checked then
      begin
         frmComprasRegistroSaidas.PageControl1.ActivePageIndex := 1;
         frmComprasRegistroSaidas.PageControl1Change(nil);
         frmComprasRegistroSaidas.edCdPessoa.Text := edNome.Text;
         frmComprasRegistroSaidas.edCodkIT.Text := edCodigo.Text;
         frmComprasRegistroSaidas.edCodkITExit(nil);
      end
      else
      begin
         frmComprasRegistroSaidas.btnIncluirClick(nil);
         frmComprasRegistroSaidas.qyRegistraSaidacd_produto.AsString := edCodigo.Text;
         frmComprasRegistroSaidas.edCodigoProdutoExit(nil);
         frmComprasRegistroSaidas.qyRegistraSaidacd_pessoa.AsString := edNome.Text;
         frmComprasRegistroSaidas.DBEdit2Exit(nil);
      end;
         
   end;


   try
      if not rbPesquisaPorKit.Checked then
      begin
         if rbPesquisaPorProduto.Checked then
            frmComprasRegistroSaidas.cd_produto_carregado := edCodigo.Text
         else if rbPesquisaPorPessoa.Checked then
            frmComprasRegistroSaidas.cd_pessoa_carregado := StrToInt( edCodigo.Text );
      end;
   except
   end;

   frmComprasRegistroSaidas.ShowModal();

   frmComprasRegistroSaidas := nil;
end;

procedure TfrmComprasControleEstoque.Button1Click(Sender: TObject);
var
   msg: String;
begin
   if trim(edCodigo.Text) = '' then
   begin
      if ( rbPesquisaPorProduto.Checked ) then
         msg := 'Você precisa selecionar um Produto.'
      else if ( rbPesquisaPorPessoa.Checked ) then
         msg := 'Você precisa selecionar uma Pessoa.';

      Mensagem( msg, Application.Title, MB_OK + MB_ICONINFORMATION, Handle );

      Exit;      
   end;   

   Filtrar();
end;

procedure TfrmComprasControleEstoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if ( State <> [gdSelected..gdFocused] ) AND
      (
         ( qyEstoqueTP_ENTRADA_SAIDA.AsInteger = 3 ) OR
         ( qyEstoqueTP_ENTRADA_SAIDA.AsInteger = 4 )
      ) then
   begin
      Dbgrid1.Canvas.Font.Color:= clBlack;
      DBGrid1.Canvas.Brush.Color := $8AFFFF;
   end;

   DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.Columns[DataCol].Field, State);   
end;

procedure TfrmComprasControleEstoque.dsEstoqueDataChange(Sender: TObject;
  Field: TField);
begin
   btnCancelarMovimentacao.Enabled := qyEstoqueTP_ENTRADA_SAIDA.AsInteger = 2;
end;

procedure TfrmComprasControleEstoque.edCodigoEnter(Sender: TObject);
begin
   if ( rbPesquisaPorProduto.Checked ) then
      edCodigo.SelectAll();
end;

procedure TfrmComprasControleEstoque.edCodigoExit(Sender: TObject);
begin
   if not ( rbPesquisaPorProduto.Checked ) then Exit;

   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );

   frmComprasBuscaProdutos.Filtrar( edCodigo.Text );

   if frmComprasBuscaProdutos.qyListaProdutos.RecordCount <> 1 then
   begin
      edCodigo.Text := '';
      edNome.Text := '';
      Exit;
   end;   

   edCodigo.Text := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edNome.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;

   frmComprasBuscaProdutos := nil;
end;

procedure TfrmComprasControleEstoque.Filtrar;
const
   SQL_ESTOQUE =
      ' SELECT ce.CD_COMPRA, cp.DS_PRODUTO, ce.DT_ENTRADA, ce.NR_QUANTIDADE, ce.TP_ENTRADA_SAIDA, ' +
      '        CASE WHEN ce.TP_ENTRADA_SAIDA = 1 OR ce.TP_ENTRADA_SAIDA = 3 THEN CONCAT(ce.NR_QUANTIDADE, '''') ELSE '''' END AS DS_ENTRADA, ' +
      '        CASE WHEN ce.TP_ENTRADA_SAIDA != 1 AND ce.TP_ENTRADA_SAIDA != 3 THEN CONCAT(ce.NR_QUANTIDADE, '''') ELSE '''' END AS DS_SAIDA, ' +

      '        CASE WHEN ce.TP_ENTRADA_SAIDA = 1 OR ce.TP_ENTRADA_SAIDA = 3 THEN ' +
      '           CONCAT(CASE WHEN ce.TP_PESSOA = 1 THEN p.nm_pessoa ' +
      '                WHEN ce.TP_PESSOA = 2 THEN CONCAT(''Fornecedor '', e.nm_empresa) ' +
      '           ELSE ' +
      '              ''[Não informado]'' ' +
      '           END, [substituir]) ' +
      '        ELSE ' +
      '           ''Almoxarifado'' ' +
      '        END AS DS_ORIGEM, ' +

      '        CASE WHEN ce.TP_ENTRADA_SAIDA = 1 OR ce.TP_ENTRADA_SAIDA = 3 THEN ' + 
      '           ''Almoxarifado'' ' +
      '        ELSE ' + 
      '           CASE WHEN ce.TP_PESSOA = 1 THEN p.nm_pessoa ' +
      '                WHEN ce.TP_PESSOA = 2 THEN e.nm_empresa ' +
      '           ELSE ' +
      '              ''[Não informado]'' ' +
      '           END ' +
      '        END AS DS_DESTINO, ' +
      '        usu.nm_pessoa as usuario '+
      ' FROM COMP_ESTOQUE ce ' +
      '      INNER JOIN comp_produtos cp ON ( cp.CD_PRODUTO = ce.CD_PRODUTO ) ' +
      '      LEFT JOIN pessoas p ON ( ce.TP_PESSOA = 1 AND p.cd_pessoa = ce.CD_PESSOA ) ' +
      '      LEFT JOIN pessoas usu ON ( usu.cd_pessoa = ce.cd_usuario  ) '+
      '      LEFT JOIN empresas e ON ( ce.TP_PESSOA = 2 AND e.cd_empresa = ce.CD_PESSOA ) ' +
      ' WHERE 1=1 ';
   SQL_ESTOQUE_WHERE_PESSOA =
      ' AND ce.CD_PESSOA = :CD_PESSOA ';
   SQL_ESTOQUE_WHERE_PRODUTO =
      ' AND ce.CD_PRODUTO = :CD_PRODUTO ';
   SQL_ESTOQUE_WHERE_KIT =
      ' AND CP.CD_PRODUTO IN (select CONCAT(cd_produto) from comp_kits_itens where cd_kit = :cd_kit) ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO =
      ' AND ce.DT_ENTRADA >= DATE_FORMAT( :DT_ENTRADA_INICIO, ''%Y-%m-%d 00:00:00'' ) ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO_ORACLE =
      ' AND UNIMESTRE_DATAS.COMPARAR(ce.DT_ENTRADA, :DT_ENTRADA_INICIO, ''MAIOR_IGUAL'', ''YYYY-MM-DD'' ) = 1 ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM =
      ' AND ce.DT_ENTRADA <= DATE_FORMAT( :DT_ENTRADA_FIM, ''%Y-%m-%d 23:59:59'' ) ';
   SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM_ORACLE =
      ' AND UNIMESTRE_DATAS.COMPARAR(ce.DT_ENTRADA, :DT_ENTRADA_FIM, ''MENOR_IGUAL'', ''YYYY-MM-DD'' ) = 1 ';
   SQL_ESTOQUE_ORDEM =
      ' ORDER BY ce.DT_ENTRADA ' ;
begin
   qyEstoque.Close();

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qyEstoque.SQL.Text := ReplaceStr(SQL_ESTOQUE, '[substituir]', 'CASE WHEN ce.TP_ENTRADA_SAIDA = 3 THEN '' (Estorno)'' ELSE '''' END')
   else
      qyEstoque.SQL.Text := ReplaceStr(SQL_ESTOQUE, '[substituir]', 'CAST( CASE WHEN ce.TP_ENTRADA_SAIDA = 3 THEN '' (Estorno)'' ELSE '''' END AS char )');

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
   begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO_ORACLE );
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM_ORACLE );
   end else begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_INICIO );
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_DT_ENTRADA_FIM );
   end;

   qyEstoque.ParamByName('DT_ENTRADA_INICIO').AsDateTime := umdtInicial.Date;
   qyEstoque.ParamByName('DT_ENTRADA_FIM').AsDateTime := umdtFinal.Date;

   if rbPesquisaPorProduto.Checked then
   begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_PRODUTO );
      qyEstoque.ParamByName('CD_PRODUTO').AsString := edCodigo.Text;
   end else if rbPesquisaPorPessoa.Checked then
   begin
      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_PESSOA );
      qyEstoque.ParamByName('CD_PESSOA').AsString := edCodigo.Text;
   end;

   if rbPesquisaPorKit.Checked then
   begin
      if not (rbPesquisaPorProduto.Checked) then
      begin
         qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_KIT );
         qyEstoque.ParamByName('cd_kit').AsString := edCodigo.Text;
      end;

      qyEstoque.SQL.Add( SQL_ESTOQUE_WHERE_PESSOA );
      qyEstoque.ParamByName('CD_PESSOA').AsString := edNome.Text;
   end;

   qyEstoque.SQL.Add(SQL_ESTOQUE_ORDEM);

   qyEstoque.Open();

   if rbPesquisaPorProduto.Checked then
   begin                                                     
      lbMsgTopo.Caption := 'Saldo inicial em ' + FormatDateTime('dd/mm/yyyy', umdtInicial.getdate) + ': ' +
                           IntToStr(GetQtdEstoqueData( edCodigo.Text, umdtInicial.getdate, 1 ));
      lbMsgRodape.Caption := 'Saldo final em ' + FormatDateTime('dd/mm/yyyy', umdtFinal.getDate) + ': ' +
                             IntToStr(GetQtdEstoqueData( edCodigo.Text, umdtFinal.getDate ));
   end else if rbPesquisaPorPessoa.Checked then
   begin
      lbMsgTopo.Caption := '';
      lbMsgRodape.Caption := 'Quantidade total de Produtos: ' +
                             IntToStr(GetTotalProdutosPessoa( StrToInt(edCodigo.Text), umdtInicial.getDate, umdtFinal.getDate ));
   end;
end;

procedure TfrmComprasControleEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmComprasControleEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F3: if btnRegistrarEntrada.Enabled then btnRegistrarEntradaClick( nil );
      VK_F4: if btnRegistrarSaida.Enabled then btnRegistrarSaidaClick( nil );
      VK_F5: if btnCancelarMovimentacao.Enabled then btnCancelarMovimentacaoClick( nil );
      VK_F12: btnFecharClick( nil );
   end;
end;

procedure TfrmComprasControleEstoque.FormShow(Sender: TObject);
begin
   GetLocaleFormatSettings(GetUserDefaultLCID, fs);
   fs.DateSeparator := '-';
   fs.TimeSeparator := ':'; 
   fs.ShortDateFormat := 'yyyy-mm-dd';
   fs.ShortTimeFormat := 'hh:nn:ss';

   umdtInicial.Date := Now;
   umdtFinal.Date := Now;

   rbPesquisaPorProduto.Checked := True;
   rbPesquisaPorKit.Checked := false;
end;

function TfrmComprasControleEstoque.GetQtdEstoqueData(const cd_produto: String;
  const data: TDateTime; const nr_dias_anteriores: Integer = 0): Integer;
const
   SQL_BUSCA_QTD_ESTOQUE_DATA =
      ' SELECT GET_COMPRAS_QTD_ESTOQUE_LIMIT( :CD_PRODUTO, :DATA, :NR_DIAS_ANTERIORES ) AS registros FROM DUAL ';
var
   qyBuscaQtdEstoqueData: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyBuscaQtdEstoqueData);

   qyBuscaQtdEstoqueData.Close();
   qyBuscaQtdEstoqueData.SQL.Text := SQL_BUSCA_QTD_ESTOQUE_DATA;
   qyBuscaQtdEstoqueData.ParamByName('CD_PRODUTO').AsString := cd_produto;
   qyBuscaQtdEstoqueData.ParamByName('DATA').AsString := DateTimeToStr(data, fs);
   qyBuscaQtdEstoqueData.ParamByName('NR_DIAS_ANTERIORES').AsInteger := nr_dias_anteriores;
   qyBuscaQtdEstoqueData.Open();

   Result := qyBuscaQtdEstoqueData.FieldByName('registros').AsInteger;

   FreeAndNil(qyBuscaQtdEstoqueData);
end;

function TfrmComprasControleEstoque.GetTotalProdutosPessoa(
  const cd_pessoa: Integer; const data_inicial, data_final: TDateTime): Integer;
const
   SQL_TOTAL_PRODUTOS_PESSOA =
      ' SELECT GET_COMP_QTD_PRODUTOS_PESSOA( :CD_PESSOA, :DT_INICIO, :DT_FIM ) AS registros FROM DUAL ';
var
   qyTotalProdutosPessoa: TUMZQuery;
begin
   DM.CriarConsulta(qyTotalProdutosPessoa);

   qyTotalProdutosPessoa.Close();
   qyTotalProdutosPessoa.SQL.Text := SQL_TOTAL_PRODUTOS_PESSOA;
   qyTotalProdutosPessoa.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   qyTotalProdutosPessoa.ParamByName('DT_INICIO').AsDateTime := data_inicial;
   qyTotalProdutosPessoa.ParamByName('DT_FIM').AsDateTime := data_final;
   qyTotalProdutosPessoa.Open();

   Result := qyTotalProdutosPessoa.FieldByName('registros').AsInteger;

   FreeAndNil(qyTotalProdutosPessoa);
end;

procedure TfrmComprasControleEstoque.rbPesquisaPorProdutoClick(Sender: TObject);
begin
   rbPesquisaPorProduto.Checked := TRadioButton(Sender).Name = rbPesquisaPorProduto.Name;
   rbPesquisaPorPessoa.Checked := TRadioButton(Sender).Name = rbPesquisaPorPessoa.Name;

   if ( rbPesquisaPorProduto.Checked ) then
   begin
      sbPesquisa.OnClick := sbPesquisaPorProduto;
   end else if ( rbPesquisaPorPessoa.Checked ) then
   begin
      sbPesquisa.OnClick := sbPesquisaPorPessoa;
   end;
                                                
   lbMsgTopo.Caption := '';
   lbMsgRodape.Caption := '';
   edCodigo.Text := '';
   edNome.Text := '';
end;

procedure TfrmComprasControleEstoque.sbPesquisaPorPessoa(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if not resultado.filtrado then Exit;

   edCodigo.Text := IntToStr(resultado.cd_pessoa);
   edNome.Text := resultado.nm_pessoa;

   Filtrar();
end;

procedure TfrmComprasControleEstoque.sbPesquisaPorProduto(Sender: TObject);
begin
   { Pesquisa por Produto }
   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );

   frmComprasBuscaProdutos.PermitiSemEstoque := True;
   frmComprasBuscaProdutos.ShowModal();
   if not frmComprasBuscaProdutos.flgSearch then Exit;

   edCodigo.Text := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   edNome.Text := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;

   frmComprasBuscaProdutos := nil;

   Filtrar();
end;

end.
