unit uFComprasGerarTitulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UZDataset, Grids, DBGrids, DB,
  ZAbstractRODataset, ZAbstractDataset, ComCtrls, ImgList, ToolWin;

const
   SEPARADOR = '_UNI_';
   SEPARADOR_VALORES = '=';

type
  TfrmComprasGerarTitulo = class(TForm)
    Panel1: TPanel;
    qyFiltrar: TUMZQuery;
    dsFiltrar: TDataSource;
    qyFiltrarDS_PRODUTO: TStringField;
    qyFiltrarNR_QUANTIDADE: TLargeintField;
    qyFiltrarVL_TOTAL: TFloatField;
    qyFiltrarCD_COMPRA: TIntegerField;
    pcEstoqueItens: TPageControl;
    tsVendasAcumuladas: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    sbBuscaPessoa: TSpeedButton;
    edCodigoPessoa: TEdit;
    edNomePessoa: TEdit;
    DBGrid1: TDBGrid;
    tsItensVenda: TTabSheet;
    Panel4: TPanel;
    Label2: TLabel;
    lbNome: TLabel;
    qyFiltrarCD_PESSOA: TIntegerField;
    qyFiltrarNM_PESSOA: TStringField;
    qyFiltrarSN_SELECIONADO: TIntegerField;
    qyFiltrarCD_PRODUTO: TStringField;
    ilToolBar: TImageList;
    dtpDataInicial: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    ckbDataInicial: TCheckBox;
    ckbDataFinal: TCheckBox;
    btnFiltrar: TButton;
    btnLimpar: TButton;
    qyItensVenda: TUMZQuery;
    dsItensVenda: TDataSource;
    DBGrid2: TDBGrid;
    qyItensVendaDT_REGISTRO: TDateTimeField;
    qyItensVendaNR_QUANTIDADE: TIntegerField;
    qyItensVendaVL_COMPRA: TFloatField;
    Label3: TLabel;
    lbProduto: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnMarcarTodos: TToolButton;
    btnDesmarcarTodos: TToolButton;
    ToolButton4: TToolButton;
    btnGerarTitulo: TToolButton;
    btnBuscarPessoa: TToolButton;
    ToolButton5: TToolButton;
    btnFechar: TToolButton;
    ToolButton6: TToolButton;
    procedure btnBuscarPessoaClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnGerarTituloClick(Sender: TObject);
    procedure dsFiltrarStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qyFiltrarAfterOpen(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pcEstoqueItensChanging(Sender: TObject; var AllowChange: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcEstoqueItensChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbBuscaPessoaClick(Sender: TObject);
  private
    FArraySelecionados: TStringList;
    fs : TFormatSettings;

    function getCdPessoa: Integer;
    procedure setCdPessoa(const Value: Integer);

    procedure SelecionarCheck();
    procedure MarcarTodos( const modo: Integer );

    { Private declarations }
  public
      procedure Filtrar();
      procedure FiltrarItens();
      { Public declarations }
      property cd_pessoa: Integer read getCdPessoa write setCdPessoa;
  end;

var
  frmComprasGerarTitulo: TfrmComprasGerarTitulo;

implementation

uses ClassPessoas, uDM, ClassComprasEntradaSaida, General, uUsuario,
     uFSelecionarPessoa;

{$R *.dfm}

{ TfrmComprasGerarTitulo }

procedure TfrmComprasGerarTitulo.btnFecharClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasGerarTitulo.btnGerarTituloClick(Sender: TObject);
var
   Chave: String;
   ContaTitulos: Integer;
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.ControleEstoque.CancelarMovimentacao', npAcesso, True ) OR
      not ( ( qyFiltrar.State IN [dsBrowse] ) AND ( qyFiltrar.RecordCount > 0 ) ) then
      Exit;

   ContaTitulos := 0;

   qyFiltrar.DisableControls();

   qyFiltrar.First();

   while not qyFiltrar.Eof do
   begin
      Chave := qyFiltrarCD_PESSOA.AsString + SEPARADOR + qyFiltrarCD_PRODUTO.AsString;

      if ( StrToInt(FArraySelecionados.Values[ Chave ]) = DFCS_CHECKED ) then
      begin
         if ClasseComprasEntradaSaida.GerarTitulosAcumulados(
               qyFiltrarCD_PESSOA.AsInteger,
               qyFiltrarCD_PRODUTO.AsString ) = -18 then
         begin
            Mensagem( 'Esta pessoa é menor de idade ou não possui a data de nascimento informada ou não possui um responsável financeiro vinculado. ' +
                Chr(13) + 'Favor acessar o cadastro de pessoa e regularizar a situação.', '', MB_ICONWARNING + MB_OK, 0 );
            Exit;
         end;

         Inc(ContaTitulos);
      end;
      
      qyFiltrar.Next();
   end;

   qyFiltrar.EnableControls();

   Mensagem( IntToStr(ContaTitulos) + ' titulo(s) gerado(s).', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );

   Filtrar();
end;

procedure TfrmComprasGerarTitulo.btnFiltrarClick(Sender: TObject);
begin
   Filtrar();
end;

procedure TfrmComprasGerarTitulo.btnLimparClick(Sender: TObject);
begin
   cd_pessoa := 0;
   ckbDataInicial.Checked := False;
   ckbDataFinal.Checked := False;
end;

procedure TfrmComprasGerarTitulo.DBGrid1CellClick(Column: TColumn);
begin
   if ( LowerCase( Column.FieldName ) = 'sn_selecionado' ) then
   begin
      SelecionarCheck();
   end;

   DBGrid1.Repaint();   
end;

procedure TfrmComprasGerarTitulo.DBGrid1DblClick(Sender: TObject);
begin
   pcEstoqueItens.SelectNextPage(False);
end;

procedure TfrmComprasGerarTitulo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Checado: Integer;
   Chave: String;
   R: TRect;
begin
   if ( qyFiltrar.State IN [dsBrowse] ) AND ( qyFiltrar.RecordCount > 0 ) AND
      ( LowerCase( Column.FieldName ) = 'sn_selecionado' ) then
   begin
      DBGrid1.Canvas.FillRect( Rect );
      Chave := qyFiltrarCD_PESSOA.AsString + SEPARADOR + qyFiltrarCD_PRODUTO.AsString;

      Checado := StrToInt( FArraySelecionados.Values[ Chave ] );

      R := Rect;
      InflateRect(R, -2, -2);
      DrawFrameControl( DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Checado );
   end;   
end;

procedure TfrmComprasGerarTitulo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_SPACE : SelecionarCheck();      
   end;
end;

procedure TfrmComprasGerarTitulo.dsFiltrarStateChange(Sender: TObject);
begin
   btnGerarTitulo.Enabled := (qyFiltrar.State IN [dsBrowse]) AND (qyFiltrar.RecordCount > 0);
   btnMarcarTodos.Enabled := btnGerarTitulo.Enabled;
   btnDesmarcarTodos.Enabled := btnGerarTitulo.Enabled;
end;

procedure TfrmComprasGerarTitulo.Filtrar;
const
   SQL_FILTRAR_SELECT =
      ' SELECT * FROM (SELECT ce.CD_PRODUTO, cp.DS_PRODUTO, SUM(ce.NR_QUANTIDADE) AS NR_QUANTIDADE, ' +
      '        SUM(ce.VL_COMPRA) AS VL_TOTAL, ca.CD_COMPRA, ce.CD_PESSOA, p.nm_pessoa ';
   SQL_FILTRAR_SELECT_ORACLE =
      ' SELECT * FROM (SELECT ce.CD_PRODUTO, FIRST_OCCURRENCE(cp.DS_PRODUTO) AS DS_PRODUTO, CAST(SUM(ce.NR_QUANTIDADE) AS NUMBER(19)) AS NR_QUANTIDADE, ' +
      '        SUM(ce.VL_COMPRA) AS VL_TOTAL, CAST(FIRST_OCCURRENCE(ca.CD_COMPRA) AS NUMBER(9)) AS CD_COMPRA, ce.CD_PESSOA, FIRST_OCCURRENCE(p.nm_pessoa) AS nm_pessoa ';
   SQL_FILTRAR =
      ' FROM comp_acumulados ca ' +
      '      INNER JOIN comp_estoque ce ON ( ce.CD_COMPRA = ca.CD_COMPRA ) ' +
      '      INNER JOIN comp_produtos cp ON ( cp.CD_PRODUTO = ce.CD_PRODUTO ) ' +
      '      INNER JOIN comp_categorias cc ON ( cc.CD_CATEGORIA = cp.CD_CATEGORIA ) ' +
      '      INNER JOIN pessoas p ON ( p.cd_pessoa = ce.CD_PESSOA ) ' +
      ' WHERE ca.SN_PAGO = 0 AND cc.CD_COLIGADA IN ( [:CD_COLIGADA:] ) ';
   SQL_FILTRAR_WHERE_CD_PESSOA =
      ' AND ca.CD_PESSOA = :CD_PESSOA ';
   SQL_FILTRAR_WHERE_DT_INICIO =
      ' AND ce.DT_ENTRADA >= DATE_FORMAT(:DT_INICIO, ''%Y-%m-%d 00:00:00'') ';
   SQL_FILTRAR_WHERE_DT_INICIO_ORACLE =
      ' AND UNIMESTRE_DATAS.COMPARAR( ce.DT_ENTRADA, CONCAT(SUBSTRING(:DT_INICIO, 0, 11), ''00:00:00''), ''MAIOR_IGUAL'', ''YYYY-MM-DD'' ) = 1 ';
   SQL_FILTRAR_WHERE_DT_FIM =
      ' AND ce.DT_ENTRADA <= DATE_FORMAT(:DT_FIM, ''%Y-%m-%d 23:59:59'') ';
   SQL_FILTRAR_WHERE_DT_FIM_ORACLE =
      ' AND UNIMESTRE_DATAS.COMPARAR( ce.DT_ENTRADA, CONCAT(SUBSTRING(:DT_FIM, 0, 11), ''23:59:59''), ''MENOR_IGUAL'', ''YYYY-MM-DD'' ) = 1 ';
   SQL_FILTRAR_GROUP_ORDER =
      ' GROUP BY ce.CD_PESSOA, ce.CD_PRODUTO) tabela ' +
      ' ORDER BY tabela.DS_PRODUTO ';
begin
   if ( FArraySelecionados = nil ) then
      FArraySelecionados := TStringList.Create();

   FArraySelecionados.Clear();

   qyFiltrar.Close();

   if DM.db.Protocol = DB_PROTOCOL_ORACLE then
      qyFiltrar.SQL.Text := SQL_FILTRAR_SELECT_ORACLE
   else
      qyFiltrar.SQL.Text := SQL_FILTRAR_SELECT;

   qyFiltrar.SQL.Add(StringReplace( SQL_FILTRAR, '[:CD_COLIGADA:]', DM.GetColigadas(), [rfReplaceAll, rfIgnoreCase] ));

   { Data Inicial } 
   if ( ckbDataInicial.Checked ) then
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         qyFiltrar.SQL.Add( SQL_FILTRAR_WHERE_DT_INICIO_ORACLE )
      else
         qyFiltrar.SQL.Add( SQL_FILTRAR_WHERE_DT_INICIO );
      qyFiltrar.ParamByName('DT_INICIO').AsString := DateTimeToStr(dtpDataInicial.DateTime, fs);
   end;
   { Data Final }
   if ( ckbDataFinal.Checked ) then
   begin
      if DM.db.Protocol = DB_PROTOCOL_ORACLE then
         qyFiltrar.SQL.Add( SQL_FILTRAR_WHERE_DT_FIM_ORACLE )
      else
         qyFiltrar.SQL.Add( SQL_FILTRAR_WHERE_DT_FIM );
      qyFiltrar.ParamByName('DT_FIM').AsString := DateTimeToStr(dtpDataFinal.DateTime, fs);
   end;
   { Código da Pessoa }   
   if ( cd_pessoa > 0 ) then
   begin
      qyFiltrar.SQL.Add( SQL_FILTRAR_WHERE_CD_PESSOA );
      qyFiltrar.ParamByName('CD_PESSOA').AsInteger := cd_pessoa;
   end;

   qyFiltrar.SQL.Add( SQL_FILTRAR_GROUP_ORDER );   

   qyFiltrar.Open();
end;

procedure TfrmComprasGerarTitulo.FiltrarItens;
const
   SQL_FILTRAR_ITENS =
      ' SELECT ca.DT_REGISTRO, ce.NR_QUANTIDADE, ce.VL_COMPRA ' +
      ' FROM COMP_ESTOQUE ce ' +
      '      INNER JOIN COMP_ACUMULADOS ca ON ( ca.CD_COMPRA = ce.CD_COMPRA ) ' +
      ' WHERE ce.CD_PESSOA = :CD_PESSOA AND ce.CD_PRODUTO = :CD_PRODUTO AND ' +
      '       ce.TP_ENTRADA_SAIDA = 2 AND ca.SN_PAGO = 0 ' +
      ' ORDER BY ca.DT_REGISTRO ';
begin
   qyItensVenda.Close();
   qyItensVenda.SQL.Text := SQL_FILTRAR_ITENS;
   qyItensVenda.ParamByName('CD_PESSOA').AsInteger := qyFiltrarCD_PESSOA.AsInteger;
   qyItensVenda.ParamByName('CD_PRODUTO').AsString := qyFiltrarCD_PRODUTO.AsString;
   qyItensVenda.Open();
end;

procedure TfrmComprasGerarTitulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmComprasGerarTitulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F3 : if ( btnMarcarTodos.Enabled    ) then btnMarcarTodosClick( nil );
      VK_F4 : if ( btnDesmarcarTodos.Enabled ) then btnDesmarcarTodosClick( nil );
      VK_F5 : if ( btnGerarTitulo.Enabled    ) then btnGerarTituloClick( nil );
      VK_F8 : btnBuscarPessoaClick( nil );
      VK_F12 : btnFecharClick( nil ); 
   end;
end;

procedure TfrmComprasGerarTitulo.FormShow(Sender: TObject);
begin
   GetLocaleFormatSettings(GetUserDefaultLCID, fs);
   fs.DateSeparator := '-';
   fs.TimeSeparator := ':';
   fs.ShortDateFormat := 'yyyy-mm-dd';
   fs.ShortTimeFormat := 'hh:nn:ss';

   pcEstoqueItens.ActivePage := tsVendasAcumuladas;

   ckbDataInicial.Checked := False;
   ckbDataFinal.Checked := False;
   dtpDataInicial.DateTime := Now;
   dtpDataFinal.DateTime := Now;
end;

function TfrmComprasGerarTitulo.getCdPessoa: Integer;
begin
   try
      Result := StrToInt( Self.edCodigoPessoa.Text );
   except
      Result := 0;
   end;
end;

procedure TfrmComprasGerarTitulo.MarcarTodos(const modo: Integer);
var
   Chave: String;
begin
   if not ( ( qyFiltrar.State IN [dsBrowse] ) AND ( qyFiltrar.RecordCount > 0 ) ) then
      Exit;   

   qyFiltrar.DisableControls();

   qyFiltrar.First();

   while not qyFiltrar.Eof do
   begin
      Chave := qyFiltrarCD_PESSOA.AsString + SEPARADOR + qyFiltrarCD_PRODUTO.AsString;

      FArraySelecionados.Values[ Chave ] := IntToStr( modo );

      qyFiltrar.Next();
   end;   

   qyFiltrar.EnableControls();
end;

procedure TfrmComprasGerarTitulo.pcEstoqueItensChange(Sender: TObject);
begin
   case pcEstoqueItens.ActivePageIndex of
      1: begin { Itens da Venda }

         lbNome.Caption := qyFiltrarNM_PESSOA.AsString;
         lbProduto.Caption := qyFiltrarDS_PRODUTO.AsString;

         FiltrarItens();

      end;
   end;
end;

procedure TfrmComprasGerarTitulo.pcEstoqueItensChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if qyFiltrar.RecNo = 0 then
   begin
      Mensagem( 'Você deve selecionar um registro.', Application.Title, MB_OK + MB_ICONINFORMATION, Handle );
      AllowChange := False;
   end;
end;

procedure TfrmComprasGerarTitulo.qyFiltrarAfterOpen(DataSet: TDataSet);
begin
   MarcarTodos( DFCS_INACTIVE );
end;

procedure TfrmComprasGerarTitulo.sbBuscaPessoaClick(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   if not sbBuscaPessoa.Enabled then Exit;   

   resultado := TfrmSelecionarPessoa.Filtrar([]);

   if not resultado.filtrado then
   begin
      cd_pessoa := 0;
      Exit;
   end;

   cd_pessoa := resultado.cd_pessoa;
end;

procedure TfrmComprasGerarTitulo.SelecionarCheck;
var
   Chave: String;
begin
   if qyFiltrar.RecordCount = 0 then Exit;   

   Chave := qyFiltrarCD_PESSOA.AsString + SEPARADOR + qyFiltrarCD_PRODUTO.AsString;

   case StrToInt( FArraySelecionados.Values[ Chave ] ) of
      DFCS_CHECKED: FArraySelecionados.Values[ Chave ] := IntToStr( 0 );
      0, DFCS_INACTIVE: FArraySelecionados.Values[ Chave ] := IntToStr( DFCS_CHECKED );
   end;
end;

procedure TfrmComprasGerarTitulo.setCdPessoa(const Value: Integer);
begin
   if ( Value <= 0 ) then
   begin
      Self.edCodigoPessoa.Text := '';
      Self.edNomePessoa.Text := '';
   end else begin
      Self.edCodigoPessoa.Text := IntToStr( Value );
      Self.edNomePessoa.Text := ClassePessoas.GetNome( Value );
   end;
end;

procedure TfrmComprasGerarTitulo.btnMarcarTodosClick(Sender: TObject);
begin
   MarcarTodos( DFCS_CHECKED );
end;

procedure TfrmComprasGerarTitulo.btnBuscarPessoaClick(Sender: TObject);
begin
   sbBuscaPessoaClick( nil );
end;

procedure TfrmComprasGerarTitulo.btnDesmarcarTodosClick(Sender: TObject);
begin
   MarcarTodos( 0 );
end;

end.
