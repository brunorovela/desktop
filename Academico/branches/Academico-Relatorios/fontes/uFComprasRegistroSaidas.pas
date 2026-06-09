unit uFComprasRegistroSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, ImgList, ComCtrls,
  ToolWin, DB, ZAbstractRODataset, UZDataset, ZAbstractDataset, UMEditMonetario,
  Grids, DBGrids, DBClient, DateUtils, Math, ZDbcIntfs, UZDbcFuncs,
  uFSelecionarPessoa;

type
  TfrmComprasRegistroSaidas = class(TForm)
    ImageList2: TImageList;
    qyRegistraSaida: TUMZQuery;
    qyRegistraSaidacd_compra: TIntegerField;
    qyRegistraSaidacd_produto: TStringField;
    qyRegistraSaidatp_entrada_saida: TSmallintField;
    qyRegistraSaidacd_pessoa: TIntegerField;
    qyRegistraSaidatp_pessoa: TSmallintField;
    qyRegistraSaidanr_quantidade: TIntegerField;
    qyRegistraSaidadt_compra: TDateTimeField;
    qyRegistraSaidadt_entrada: TDateTimeField;
    qyRegistraSaidavl_compra: TFloatField;
    dsRegistraSaida: TDataSource;
    Timer1: TTimer;
    PageControl1: TPageControl;
    tbProdutos: TTabSheet;
    tbKits: TTabSheet;
    PanelProduto: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edQuantkit: TEdit;
    edNomeKit: TEdit;
    edPrecoUnitarioKit: TUMEditMonetario;
    edValorTotalKit: TUMEditMonetario;
    Panel4: TPanel;
    toolPessoa: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton11: TToolButton;
    btnSair: TToolButton;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    btnIncluirKit: TToolButton;
    ToolButton6: TToolButton;
    btnsalvarKit: TToolButton;
    btnCancelarKit: TToolButton;
    ToolButton9: TToolButton;
    btnFecharKit: TToolButton;
    edQuantidadeKit: TEdit;
    qyRegistraSaidaKits: TUMZQuery;
    qyRegistraSaidaKitsCD_COMPRA: TIntegerField;
    qyRegistraSaidaKitsCD_PRODUTO: TStringField;
    qyRegistraSaidaKitsTP_ENTRADA_SAIDA: TSmallintField;
    qyRegistraSaidaKitsCD_PESSOA: TIntegerField;
    qyRegistraSaidaKitsTP_PESSOA: TSmallintField;
    qyRegistraSaidaKitsNR_QUANTIDADE: TIntegerField;
    qyRegistraSaidaKitsDT_COMPRA: TDateTimeField;
    qyRegistraSaidaKitsDT_ENTRADA: TDateTimeField;
    qyRegistraSaidaKitsVL_COMPRA: TFloatField;
    ToolButton12: TToolButton;
    pnSelecionaEntrada: TPanel;
    rgTipoEntrada: TRadioGroup;
    Panel5: TPanel;
    rgTipoEntradaKit: TRadioGroup;
    pnCodKit: TPanel;
    Label8: TLabel;
    pnCodBarraKit: TPanel;
    Label18: TLabel;
    edCodkIT: TEdit;
    SpeedButton4: TSpeedButton;
    edCodBarraKit: TEdit;
    SpeedButton6: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qyRegistraSaidaKitsCD_KIT: TIntegerField;
    Panel6: TPanel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit2: TDBEdit;
    edNomeComprador: TEdit;
    Panel7: TPanel;
    edCdPessoa: TEdit;
    Label2: TLabel;
    edNmPessoa: TEdit;
    SpeedButton3: TSpeedButton;
    msgSemPermKit: TLabel;
    msgSemPermPro: TLabel;
    qyRegistraSaidacd_usuario: TIntegerField;
    qyRegistraSaidaKitsCD_USUARIO: TIntegerField;
    qyRegistraSaidaNR_ANOSEMESTRE: TIntegerField;
    qyRegistraSaidaKitsNR_ANOSEMESTRE: TIntegerField;
    pnParcelas: TPanel;
    Panel10: TPanel;
    Label20: TLabel;
    edNrParcelas: TEdit;
    Label21: TLabel;
    edDiaVencto: TEdit;
    lblVenctoSempre: TLabel;
    dtpVenctoSempre: TDateTimePicker;
    Panel8: TPanel;
    pnParcelaKit: TPanel;
    Panel11: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edNrParcelasKit: TEdit;
    edDiaVenctoKit: TEdit;
    dtpVenctoSempreKit: TDateTimePicker;
    Panel12: TPanel;
    dbgParcelasKit: TDBGrid;
    sbCalcVencto: TSpeedButton;
    sbCalcVenctoKit: TSpeedButton;
    Label25: TLabel;
    lblVenctoOpcs: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cdsParcelas: TClientDataSet;
    cdsParcelasCD_TIPO_TITULO: TIntegerField;
    cdsParcelasNR_PARCELA: TIntegerField;
    cdsParcelasDT_VENCTO: TDateField;
    cdsParcelasVL_BRUTO: TCurrencyField;
    cdsParcelasDS_TIPO_TITULO: TStringField;
    dsParcelas: TDataSource;
    upParcelas: TUpDown;
    upParcelasKit: TUpDown;
    dsProdutos: TDataSource;
    Panel9: TPanel;
    dbgParcelas: TDBGrid;
    cdsProdutos: TClientDataSet;
    cdsProdutosds_produto: TStringField;
    cdsProdutosnr_qtd_estoque: TIntegerField;
    cdsProdutosnr_preco_unitario: TFloatField;
    cdsProdutosnr_quantidade: TIntegerField;
    cdsProdutosds_codigo_barra: TStringField;
    cdsProdutosvl_total: TFloatField;
    cdsProdutoscd_produto: TStringField;
    pnlBusca: TPanel;
    pnCod: TPanel;
    Label16: TLabel;
    SpeedButton5: TSpeedButton;
    edCodigoProduto: TDBEdit;
    PnCodBarra: TPanel;
    Label17: TLabel;
    SpeedButton8: TSpeedButton;
    edCodBarras: TEdit;
    cdsParcelasSUM_VALOR_BRUTO: TAggregateField;
    cdsParcelasNM_PRODUTO: TStringField;
    panel_total: TPanel;
    Label1: TLabel;
    lblvl_total: TLabel;
    cdsParcelasCD_PRODUTO: TStringField;
    cdsProdutosvl_total_compra: TAggregateField;
    cdsProdutosnr_parcelas: TIntegerField;
    cdsProdutossn_imprimir_cupom: TIntegerField;
    cdsProdutosmin_parcelas: TAggregateField;
    cdsProdutossn_gerar_titulo: TIntegerField;
    cdsProdutossn_acumular_valores: TIntegerField;
    cdsProdutossn_parcelar: TBooleanField;
    cdsProdutosnr_parcelar: TIntegerField;
    cdsProdutosmin_parcelar: TAggregateField;
    cdsProdutosmax_imprimir: TAggregateField;
    cdsProdutoscd_agendamento: TIntegerField;
    sbSelecionarColunaDisc: TSpeedButton;
    cdsProdutosvl_compra: TFloatField;
    dbProdutos: TDBGrid;
    Panel2: TPanel;
    Label11: TLabel;
    DbAnoSem: TDBEdit;
    udDAnoSem: TUpDown;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    txtAnoSemestre: TMaskEdit;
    Label19: TLabel;
    UpDown1: TUpDown;
    procedure sbSelecionarColunaDiscClick(Sender: TObject);
    procedure dsProdutosDataChange(Sender: TObject; Field: TField);
    procedure cdsProdutosnr_quantidadeSetText(Sender: TField;
      const Text: string);
    procedure dbProdutosExit(Sender: TObject);
    procedure dbProdutosColExit(Sender: TObject);
    procedure dbProdutosColEnter(Sender: TObject);
    procedure dbProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure edQuantidadeKitExit(Sender: TObject);
    procedure edDiaVenctoKitKeyPress(Sender: TObject; var Key: Char);
    procedure sbCalcVenctoKitClick(Sender: TObject);
    procedure edDiaVenctoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sbCalcVenctoClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure udDAnoSemClick(Sender: TObject; Button: TUDBtnType);
    procedure qyRegistraSaidaAfterInsert(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure rgTipoEntradaKitClick(Sender: TObject);
    procedure rgTipoEntradaClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure edCdPessoaChange(Sender: TObject);
    procedure btnsalvarKitClick(Sender: TObject);
    procedure btnFecharKitClick(Sender: TObject);
    procedure btnCancelarKitClick(Sender: TObject);
    procedure edCdPessoaKeyPress(Sender: TObject; var Key: Char);
    procedure edCdPessoaExit(Sender: TObject);
    procedure edCodkITKeyPress(Sender: TObject; var Key: Char);
    procedure edQuantidadeKitChange(Sender: TObject);
    procedure edCodBarraKitExit(Sender: TObject);
    procedure edCodBarraKitKeyPress(Sender: TObject; var Key: Char);
    procedure edCodkITExit(Sender: TObject);
    procedure edCodkITEnter(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edCodBarrasKeyPress(Sender: TObject; var Key: Char);
    procedure edCodBarrasExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyRegistraSaidaBeforeInert(DataSet: TDataSet);
    procedure DBEdit2Exit(Sender: TObject);
    procedure edCodigoProdutoEnter(Sender: TObject);
    procedure dsRegistraSaidaStateChange(Sender: TObject);
    procedure edCodigoProdutoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qyRegistraSaidaBeforePost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure calculaVenctoClick(Sender: TObject);
    procedure alteraQuantidade();
    function registrarSaidaProdutos(): Boolean;
    procedure exibirTotalVenda();
  private
    { Private declarations }
    sn_imprimir : Boolean;
    tipoSaida: Integer;
    tipoPessoa : Integer;
    FCompras: TStrings;
    FAbaFiltroPessoa: AbasFiltroPessoa;
    sn_msg_erro : Boolean;
    FPessoaAgendamento: Integer;
    function GetVlUnitario( cd_produto: String ): Double;

    function LastInsertId(): Integer;

    { Condicoes de Campos }
    procedure SomenteNumeros(Sender: TObject; var Key: Char);
    procedure filtraProduto();
    procedure filtraKit();
    procedure filtraKitAoSairDoCampo( isCodBarra: Boolean);
    procedure filtraAoSairDoCampo( isCodBarra: Boolean);
    procedure podeRetirar(const cd_pessoa : Integer; const tipo : integer);
    function financeiroPendente(cd_pessoa : Integer): Boolean;
    function validaTurmaRetirada(isKit: Boolean): Boolean;
    function excedeuNumeroMaxRetirada(isKit : Boolean; quantidade : Integer): Boolean;
    function setaValorKit() : string;
    function verificaExcedenteKit() : Boolean;
    procedure calculaVencimentos(qtdParcelas : Integer; dataVencto : TDateTime; valorTotal:Currency; dia_vencto: String; cd_produto : String  = '0'; cd_kit: Integer  = 0 );
      function BaixaMensalidade: Boolean;
      procedure SavePrefs;
      procedure LoadPrefs;
      procedure VerificaAgendamentos;
      procedure LimpaQuandoMudaPessoa;      
  public
    { Public declarations }
    cd_produto_carregado: String;
    cd_pessoa_carregado: Integer;

    procedure AbreQueryRegistraEstoque();
    procedure setConfigGridProdutos();
  end;

var
  frmComprasRegistroSaidas: TfrmComprasRegistroSaidas;

implementation

uses
   uFComprasBuscaProdutos, uDM, General, uFComprasBuscaKits,
   ClassComprasEntradaSaida, ClassPlanosPagamento, ClassPessoas, uUsuario,
   uFComprasControleEstoque, Main, uIUMDataModule, uMensalidades_Baixar,
   UFComprasAgendamentoSaida, uCamposPlanilhas;

{$R *.dfm}

procedure TfrmComprasRegistroSaidas.AbreQueryRegistraEstoque;
const
   SQL_REGISTRA_ESTOQUE =
      ' SELECT * FROM comp_estoque WHERE 1=0 ';
begin
   qyRegistraSaida.Close();
   qyRegistraSaida.SQL.Text := SQL_REGISTRA_ESTOQUE;
   qyRegistraSaida.Open();
end;

procedure TfrmComprasRegistroSaidas.btnCancelarClick(Sender: TObject);
begin
   qyRegistraSaida.Cancel();
   DbAnoSem.ReadOnly := true;
   edCodBarras.Text := '';
   pnParcelas.Visible := false;
   while not cdsProdutos.IsEmpty do cdsProdutos.Delete;

   if cd_pessoa_carregado > 0 then
   begin
      DBEdit2.Text := IntToStr(cd_pessoa_carregado);
      if (msgSemPermPro.Visible) then
      begin
         btnSalvar.Enabled := false;
      end;
   end else begin
      msgSemPermPro.Visible := false;
   end;
end;

procedure TfrmComprasRegistroSaidas.btnIncluirClick(Sender: TObject);
begin
   if not ( qyRegistraSaida.State IN [dsInsert] ) then
   begin
      qyRegistraSaida.Insert();
      if cd_pessoa_carregado > 0 then
      begin
         DBEdit2.Text := IntToStr(cd_pessoa_carregado);
      end;
   end;
end;


procedure TfrmComprasRegistroSaidas.btnSairClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmComprasRegistroSaidas.btnSalvarClick(Sender: TObject);
begin
   PanelProduto.SetFocus;

   if qyRegistraSaida.State in dsEditModes then
   begin
      qyRegistraSaidacd_pessoa.AsInteger := cd_pessoa_carregado;
   end;

   if (qyRegistraSaidacd_pessoa.IsNull) OR (qyRegistraSaidacd_pessoa.AsInteger = 0) then
   begin
      Mensagem( 'Informe uma Pessoa.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      DBEdit2.SetFocus;
      Exit;
   end;

   if cdsProdutos.IsEmpty then
   begin
      Mensagem( 'Informe um Produto.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      pnlBusca.SetFocus;
      SelectNext(pnlBusca, True, True);
      Exit;
   end;

   if (pnParcelas.Visible) then
   begin
      if (edDiaVencto.Text = '') then
      begin
         Mensagem( 'Informe um dia de vencimento válido.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
         edDiaVencto.SetFocus;
         exit;
      end;

      //Regera as parcelas no dataset para gerar as mensalidades dps
      Self.sbCalcVenctoClick(Self);
   end;

   //primeiro verifica o financeiro
   if not (Self.financeiroPendente(qyRegistraSaidacd_pessoa.AsInteger)) then
   begin
      Exit;
   end;

   FCompras.Clear;

   //chama o método que ira salvar
   if not registrarSaidaProdutos() then
   begin
      Exit;
   end;

   BaixaMensalidade;

   //Comportamento anterior mantido ao finalizar uma compra
   DbAnoSem.ReadOnly := true;
   while not cdsProdutos.IsEmpty do cdsProdutos.Delete;
   AbreQueryRegistraEstoque();
   pnParcelas.Visible := false;

   if ( cd_pessoa_carregado > 0 ) then
   begin
      btnIncluirClick( nil );
      DBEdit2.Text := IntToStr(cd_pessoa_carregado);
      qyRegistraSaidacd_pessoa.AsInteger := cd_pessoa_carregado;
      PanelProduto.SetFocus();
   end else begin
      DBEdit2.SetFocus();
   end;

   Mensagem('Saída efetuada com Sucesso!', Application.Title, MB_OK + MB_ICONINFORMATION, Handle);
   edCodBarras.Text := '';
   edNomeComprador.Text := '';
   btnCancelarClick(nil);
   dbedit2.SetFocus();
end;

procedure TfrmComprasRegistroSaidas.DBEdit2Exit(Sender: TObject);
begin
   if ( DBEdit2.Text <> IntToStr( cd_pessoa_carregado ) ) then
      cd_pessoa_carregado := 0;

   if ( DBEdit2.Text <> '' ) then
   begin
      edNomeComprador.Text := ClassePessoas.GetNome( StrToInt( DBEdit2.Text ) );
      qyRegistraSaidatp_pessoa.AsInteger := 1;

      if ( Trim(edNomeComprador.Text) = '' ) then
      begin
         Mensagem( 'Código inexistente.' );
         DBEdit2.SetFocus();
         DBEdit2.SelectAll();
      end;

      if DBEdit2.Field.AsInteger <> cd_pessoa_carregado then
         LimpaQuandoMudaPessoa;
         
      cd_pessoa_carregado := StrToInt(DBEdit2.Text);
      qyRegistraSaidacd_pessoa.AsInteger := cd_pessoa_carregado;

      podeRetirar(qyRegistraSaidacd_pessoa.AsInteger,1);
      VerificaAgendamentos;
   end else begin
      edNomeComprador.Text := '';
   end;
end;

procedure TfrmComprasRegistroSaidas.edCodkITEnter(Sender: TObject);
begin
    edCodkIT.SelectAll();
end;

procedure TfrmComprasRegistroSaidas.edCodkITExit(Sender: TObject);
begin
   if (Trim(edCodkIT.Text) = '') then
   begin
      edCodkIT.Text := '';
      Exit;
   end;

   filtraKitAoSairDoCampo(false);
end;

procedure TfrmComprasRegistroSaidas.edCodkITKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodkITExit(nil);
   end;
end;

procedure TfrmComprasRegistroSaidas.edDiaVenctoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // apenas números
  if not (Key in['0'..'9',Chr(8)]) then
  begin
      Key:= #0;
  end;
end;

procedure TfrmComprasRegistroSaidas.edDiaVenctoKitKeyPress(Sender: TObject;
  var Key: Char);
begin
  // apenas números
  if not (Key in['0'..'9',Chr(8)]) then
  begin
      Key:= #0;
  end;
end;

procedure TfrmComprasRegistroSaidas.edCdPessoaChange(Sender: TObject);
begin
   btnIncluirKit.Enabled := false;
   btnsalvarKit.Enabled := true;
   btnCancelarKit.Enabled := true;
   btnFecharKit.Enabled := false;
   txtAnoSemestre.Text := DM.UsuarioLogado.GetColigadaLogada.GetNuParametro('online.anosemestre.atual');
   DbAnoSem.ReadOnly := false;
end;

procedure TfrmComprasRegistroSaidas.edCdPessoaExit(Sender: TObject);
begin
   if ( edCdPessoa.Text <> '' ) then
   begin
      edNmPessoa.Text := ClassePessoas.GetNome( StrToInt( edCdPessoa.Text ) );
      tipoPessoa := 1;
      if ( Trim(edNmPessoa.Text) = '' ) then
      begin
         Mensagem( 'Código inexistente.' );
         edNmPessoa.SetFocus();
         edNmPessoa.SelectAll();
      end;
      if(pnCodKit.Visible) then
      begin
         edCodkIT.SetFocus;
      end
      else
      begin
         edCodBarraKit.SetFocus;
      end;

      podeRetirar(strtoint(edCdPessoa.Text),2);
   end else begin
      edNmPessoa.Text := '';
   end;
end;

procedure TfrmComprasRegistroSaidas.edCdPessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCdPessoaExit(nil);
   end;
end;

procedure TfrmComprasRegistroSaidas.edCodBarraKitExit(Sender: TObject);
begin
   if (Trim(edCodBarraKit.Text) = '') then
   begin
      Exit;
   end;

   filtraKitAoSairDoCampo(true);
   edQuantidadeKit.SetFocus;
end;

procedure TfrmComprasRegistroSaidas.edCodBarraKitKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodBarraKitExit(nil);
   end;
end;

procedure TfrmComprasRegistroSaidas.edCodBarrasExit(Sender: TObject);
begin
   if (Trim(edCodBarras.Text) = '') then
   begin
      Exit;
   end;

   filtraAoSairDoCampo(true);

   DbAnoSem.SetFocus;
end;

procedure TfrmComprasRegistroSaidas.edCodBarrasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( Key = #13 ) then
   begin
      edCodBarrasExit(nil);
   end;

   
end;

procedure TfrmComprasRegistroSaidas.edCodigoProdutoEnter(Sender: TObject);
begin
   edCodigoProduto.SelectAll();
end;

procedure TfrmComprasRegistroSaidas.edCodigoProdutoExit(Sender: TObject);
begin
   if (Trim(qyRegistraSaidacd_produto.AsString) = '') then
   begin
      Exit;
   end;

   filtraAoSairDoCampo(false);
end;

procedure TfrmComprasRegistroSaidas.dbProdutosColEnter(Sender: TObject);
begin
     if cdsProdutos.State in [dsBrowse] then
        exit;

      if ( cdsProdutosnr_quantidade.AsFloat <= cdsProdutosnr_qtd_estoque.Asfloat )  then
      begin
         cdsProdutosvl_total.AsFloat := (cdsProdutosnr_preco_unitario.AsFloat * cdsProdutosnr_quantidade.AsFloat);
         exibirTotalVenda();
      end;

end;


procedure TfrmComprasRegistroSaidas.dbProdutosColExit(Sender: TObject);
begin
     if cdsProdutos.State in [dsBrowse] then
        exit;

      if ( cdsProdutosnr_quantidade.AsFloat <= cdsProdutosnr_qtd_estoque.Asfloat )  then
      begin
         cdsProdutosvl_total.AsFloat := (cdsProdutosnr_preco_unitario.AsFloat * cdsProdutosnr_quantidade.AsFloat);
         exibirTotalVenda();
       end;
end;

procedure TfrmComprasRegistroSaidas.dbProdutosExit(Sender: TObject);
begin
     if cdsProdutos.State in [dsBrowse] then
        exit;

      if ( cdsProdutosnr_quantidade.AsFloat <= cdsProdutosnr_qtd_estoque.Asfloat )  then
      begin
         cdsProdutosvl_total.AsFloat := (cdsProdutosnr_preco_unitario.AsFloat * cdsProdutosnr_quantidade.AsFloat);
         exibirTotalVenda();
      end;
end;

procedure TfrmComprasRegistroSaidas.dbProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if dbProdutos.SelectedField.FieldName <> 'nr_quantidade' then
   begin
  Key := 0;
  exit; 
     // Abort();
   end;

   if Key = VK_RETURN then
   begin
      cdsProdutos.Edit;

      if (dbProdutos.SelectedField.FieldName = 'nr_quantidade') AND (cdsProdutos.State IN [dsInsert, dsEdit]) then
      begin
         cdsProdutos.Post();
         exibirTotalVenda();
         pnlBusca.SetFocus;
         SelectNext(pnlBusca, True, True);
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.dsProdutosDataChange(Sender: TObject;
  Field: TField);
begin
	exibirTotalVenda();
end;

procedure TfrmComprasRegistroSaidas.dsRegistraSaidaStateChange(Sender: TObject);
begin
   btnIncluir.Enabled := not( qyRegistraSaida.State IN [dsInsert] );

   btnCancelar.Enabled := qyRegistraSaida.State IN [dsInsert];
   btnSalvar.Enabled := qyRegistraSaida.State IN [dsInsert];

   if not ( qyRegistraSaida.State IN [ dsInsert ] ) then
   begin
      if not ( cd_pessoa_carregado > 0 ) then
         edNomeComprador.Text := '';
   end;
end;

procedure TfrmComprasRegistroSaidas.alteraQuantidade();
begin
   if not ( qyRegistraSaida.State IN [ dsInsert ] ) then Exit;

   try
      if cdsProdutosnr_quantidade.AsInteger > cdsProdutosnr_qtd_estoque.AsInteger then
      begin
         Mensagem(
            'Você não pode ultrapassar o limite de estoque do produto.',
            Application.Title, MB_OK + MB_ICONWARNING, Handle);

         cdsProdutosnr_quantidade.AsInteger := cdsProdutosnr_qtd_estoque.AsInteger;
      end;

      //Recalcula as parcelas caso habilitado
      if (pnParcelas.Visible) and (edDiaVencto.Text <> '') then
      begin
         sbCalcVenctoClick(self);
      end;
   except
      //
   end;
end;

function TfrmComprasRegistroSaidas.BaixaMensalidade: Boolean;
const
   SSQLProcuraTitulos = ''
      + 'SELECT '
      + '      1 '
      + 'FROM '
      + '      comp_estoque e '
      + 'WHERE '
      + '      e.CD_PESSOA = ? AND '
      + '      e.CD_COMPRA IN (%s) AND '
      + '      EXISTS '
      + '      ( '
      + '            SELECT '
      + '                  em.CD_MENSALIDADE '
      + '            FROM '
      + '                  comp_estoque_mensalidade em '
      + '                        JOIN mensalidades m ON '
      + '                              (em.CD_MENSALIDADE = m.cd_mensalidade) '
      + '            WHERE '
      + '                  e.CD_COMPRA = em.CD_COMPRA AND '
      + '                  m.situacao IN (2, 10) '
      + '      ) '
      + '      AND '
      + '      ( '
      + '            EXISTS '
      + '            ( '
      + '                  SELECT '
      + '                        p.CD_PRODUTO '
      + '                  FROM '
      + '                        comp_produtos p '
      + '                  WHERE '
      + '                        e.CD_PRODUTO = p.CD_PRODUTO AND '
      + '                        p.SN_BAIXAR_TITULO_AUTO = 1 '
      + '            ) '
      + '            OR '
      + '            EXISTS '
      + '            ( '
      + '                  SELECT '
      + '                        k.cd_kit '
      + '                  FROM '
      + '                        comp_kits k '
      + '                  WHERE '
      + '                        e.CD_KIT = k.cd_kit AND '
      + '                        k.SN_BAIXAR_TITULO_AUTO = 1 '
      + '            ) '
      + '      ) ';
var
   Stmt: IZPreparedStatement;
   Rs: IZResultSet;
   S: AnsiString;
   PessoaId, Nome: AnsiString;
begin
   if not DM.UsuarioLogado.TemPermissao(2012, npAcesso, False) then Exit;

   PessoaId := qyRegistraSaidacd_pessoa.AsString;
   Nome := edNomeComprador.Text;

   if PageControl1.ActivePage = tbKits then
   begin
      PessoaId := Trim(edCdPessoa.Text);
      Nome := edNmPessoa.Text;
   end;

   Result := False;

   S := Format(SSQLProcuraTitulos, [FCompras.DelimitedText]);

   Stmt := PrepareStatement(S);
   try
      Stmt.SetString(1, PessoaId);
      Rs := Stmt.ExecuteQueryPrepared;
      try
         if Rs.Next then
            Result := Rs.GetInt(1) = 1;
      finally
         Rs.Close;
         Rs := nil;
      end;
   finally
      Stmt.Close;
      Stmt := nil;
   end;

   if Result then
   begin
      Application.CreateForm(TfrmMensalidadesBaixar, frmMensalidadesBaixar);
      try
         frmMensalidadesBaixar.setPessoaSelecionada(PessoaId);
         frmMensalidadesBaixar.setNmPessoaSelecionada(Nome);
         frmMensalidadesBaixar.SaidaProdutos := True;
         Result := frmMensalidadesBaixar.ShowModal = mrOk;
      finally
         FreeAndNil(frmMensalidadesBaixar);
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.edQuantidadeKitChange(Sender: TObject);
var
   nr_quantidade: Integer;
begin

   if ( edQuantkit.Text = '' ) then
   begin
      Mensagem( 'Você precisa selecionar um kit.' );
      edCodkIT.SetFocus();
      Exit;
   end;


   if (( StrToInt(edQuantkit.Text) = 0 ) and (not btnIncluirKit.Enabled))then
   begin
      Mensagem( 'Este kit não esta disponivel para retirada.' );
      btnsalvarKit.Enabled := false;
      Exit;
   end
   else
   begin
      btnsalvarKit.Enabled := true;
   end;

   if (edQuantidadeKit.Text = '') then
   begin
      edQuantidadeKit.Text := '1';
   end;

   if (StrToInt( edQuantidadeKit.Text ) > StrToInt( edQuantkit.Text )) then
   begin
      edQuantidadeKit.Text := '1' ;
      edQuantidadeKit.SelectAll;
      Mensagem(
         'Você não pode ultrapassar o limite de estoque do kit.',
         Application.Title, MB_OK + MB_ICONWARNING, Handle);

      edValorTotalKit.setValorDouble( FloatToStr( edPrecoUnitarioKit.getValorDouble * 1 ) );

      Exit;
   end;

   edValorTotalKit.setValorDouble( FloatToStr( edPrecoUnitarioKit.getValorDouble * strToInt(edQuantidadeKit.Text) ) );

end;

procedure TfrmComprasRegistroSaidas.edQuantidadeKitExit(Sender: TObject);
begin
   //Recalcula as parcelas caso habilitado
   if (pnParcelaKit.Visible) AND (edDiaVenctoKit.Text <> '') then
   begin
      sbCalcVenctoKitClick(self);
   end;
end;

function TfrmComprasRegistroSaidas.excedeuNumeroMaxRetirada(isKit : Boolean; quantidade : Integer): Boolean;
const
   SQL_VERIFICA_EXCEDENTE =
      'SELECT cp.DS_PRODUTO as produto, cp.NR_LIMITE, sum(ce.nr_quantidade) as quant, '+
      ' MIN(ce.DT_COMPRA) as dt_compra ,(cp.NR_LIMITE < SUM(ce.nr_quantidade)) as soma '+
      'FROM comp_estoque ce '+
      'INNER JOIN comp_produtos cp on (ce.cd_produto = cp.cd_produto) '+
      'WHERE ce.tp_entrada_saida = 2 and ce.cd_produto = :CD_PRODUTO  AND ce.CD_PESSOA = :CD_PESSOA '+
      ' AND (CASE WHEN cp.SN_LIMIT_POR_ANO_SEM = 1 THEN ce.NR_ANOSEMESTRE = :nr_anosem ELSE 1=1 END) '+
      'GROUP BY ce.cd_produto';
   MsgExcedeuLimite =
      'Este aluno já excedeu de retiradas para o produto ';
   MsgExcederaLimite =
      'Esta retirada ira exceder o limite para o aluno do produto ';
   MsgControleEstoque =
      '. Deseja efetuar a devolução do mesmo? ';
   MsqEfetuarRetirada =
      '. Deseja efetuar a retirada mesmo assim? ';
   MsgNrRetiradas =
      '. Este produto tem limite de retirada(s) ';
var
   qyVerifica : TUMZQuery;
   codPessoa,codProduto,nr_anosem : String;
   msgJanela: String;
   respMsg : Boolean;
begin
   dm.CriarConsulta(qyVerifica);
   qyVerifica.SQL.Add(SQL_VERIFICA_EXCEDENTE);

   if (isKit) then
   begin
      codPessoa := edCdPessoa.Text;
      codProduto := qyRegistraSaidaKitsCD_PRODUTO.AsString;
      nr_anosem :=  txtAnoSemestre.Text;
   end else begin
      codPessoa := qyRegistraSaidacd_pessoa.AsString;
      codProduto := cdsProdutoscd_produto.AsString;
      nr_anosem :=  qyRegistraSaidaNR_ANOSEMESTRE.AsString;
   end;
   
   qyVerifica.ParamByName('CD_PRODUTO').AsString := codProduto;
   qyVerifica.ParamByName('CD_PESSOA').AsString := codPessoa;
   qyVerifica.ParamByName('nr_anosem').AsString := nr_anosem;
   qyVerifica.Open;

   respMsg := true;
   if (((qyVerifica.FieldByName('soma').AsInteger > 0) or
      ((qyVerifica.FieldByName('quant').AsInteger + quantidade) > qyVerifica.FieldByName('nr_limite').AsInteger)) and
      (qyVerifica.FieldByName('nr_limite').AsString <> ''))  then
   begin
      msgJanela := MsgExcedeuLimite + qyVerifica.FieldByName('produto').asString;

      if(qyVerifica.FieldByName('soma').AsInteger <= 0) then
      begin
         msgJanela := MsgExcederaLimite + qyVerifica.FieldByName('produto').asString;

         if(qyVerifica.FieldByName('quant').AsInteger <= 0) then
         begin
            msgJanela := msgJanela + MsgNrRetiradas + qyVerifica.FieldByName('NR_LIMITE').asstring;
         end;
      end;

      if (DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Saidas.Retirar.Limite', npEspecial, false )) then
      begin
         respMsg := (Mensagem(msgJanela + MsqEfetuarRetirada, Application.Title,MB_YESNO, Handle)  = mrYes);
      end else begin
         respMsg := (Mensagem(msgJanela + MsgControleEstoque, Application.Title,MB_YESNO, Handle)  = mrYes);

         { Direciona para o controle de esoque e fecha esta tela}
         if (respMsg) then
         begin
            if not PrincipalForm.ProcuraForm(frmComprasControleEstoque) then
            begin
               Application.CreateForm(TfrmComprasControleEstoque, frmComprasControleEstoque);
            end;

            frmComprasControleEstoque.rbPesquisaPorProduto.Checked := true;
            if (isKit) then
            begin
               codPessoa := qyRegistraSaidaKitsCD_PESSOA.AsString;
               codProduto := qyRegistraSaidaKitsCD_KIT.AsString;
               frmComprasControleEstoque.rbPesquisaPorKit.Checked := true;
            end;

            frmComprasControleEstoque.edCodigo.Text := codProduto;
            frmComprasControleEstoque.edNome.Text := codPessoa;
            frmComprasControleEstoque.umdtInicial.Date := qyVerifica.FieldByName('dt_compra').AsDateTime;
            frmComprasControleEstoque.Filtrar();
            frmComprasControleEstoque.Show();

            if (iskit) then
            begin
              frmComprasRegistroSaidas.qyRegistraSaidaKits.Cancel
            end else begin
              frmComprasRegistroSaidas.qyRegistraSaida.Cancel;
            end;

            frmComprasRegistroSaidas.Close;
         end;

         respMsg := false;
      end;
   end;

   result := respMsg;
end;

procedure TfrmComprasRegistroSaidas.filtraAoSairDoCampo(isCodBarra : Boolean);
begin
   if (frmComprasBuscaProdutos = nil) then
   begin
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);
   end;

   if (isCodBarra) then
   begin
      frmComprasBuscaProdutos.Filtrar( '', True , edCodBarras.Text );
   end
   else
   begin
      frmComprasBuscaProdutos.Filtrar( qyRegistraSaidacd_produto.AsString, True );
   end;

   if frmComprasBuscaProdutos.qyListaProdutos.RecordCount <> 1 then
   begin
      Mensagem( 'Código inexistente.' );
      Exit;
   end else if frmComprasBuscaProdutos.qyListaProdutosQTD_PRODUTOS.AsInteger <= 0 then
   begin
      edCodigoProduto.Clear;
      edCodBarras.Clear;
      Mensagem( 'O produto selecionado não possui estoque, você não poderá selecioná-lo.',
                              Application.Title, MB_OK + MB_ICONWARNING, Handle );
      Exit;
   end;

   filtraProduto;
end;

procedure TfrmComprasRegistroSaidas.filtraKit;
begin

   edCodkIT.Text        := frmComprasBuscaKits.qyKitscd_kit.AsString;
   edNomeKit.Text       := frmComprasBuscaKits.qyKitsnm_kit.AsString;
   pnParcelaKit.Visible := (frmComprasBuscaKits.qyKitsNR_PARCELAS.AsInteger > 1);
   edQuantkit.Text      := inttostr(frmComprasBuscaKits.getnrMaxKits);
   edCodkIT.Text        := frmComprasBuscaKits.qyKitscd_kit.AsString;
   edCodBarraKit.Text   := frmComprasBuscaKits.qyKitscd_coidigo_barras.AsString;

   //Reinicia os valores do painel de parcelas
   dtpVenctoSempreKit.Date := dm.DataAtual;
   edDiaVenctoKit.Text := '';
   upParcelasKit.Max := StrToInt(frmComprasBuscaKits.qyKitsNR_PARCELAS.AsString);
   while not cdsParcelas.IsEmpty do cdsParcelas.Delete;

   edPrecoUnitarioKit.setValorDouble( setaValorKit );
   edQuantidadeKitChange(nil);
end;

procedure TfrmComprasRegistroSaidas.filtraKitAoSairDoCampo(isCodBarra: Boolean);
begin
   if (frmComprasBuscaKits = nil) then
   begin
      Application.CreateForm(tfrmComprasBuscaKits, frmComprasBuscaKits);
   end;

   if (isCodBarra) then
   begin
      frmComprasBuscaKits.Filtrar( '', edCodBarraKit.Text );
   end
   else
   begin
      frmComprasBuscaKits.Filtrar( edCodkIT.Text, '' );
   end;

   edNomeKit.Text := '';
   edQuantkit.Text := '';
   edPrecoUnitarioKit.setValorDouble('0.00');
   edValorTotalKit.setValorDouble('0.00');
   
   if (frmComprasBuscaKits.qyKits.RecordCount = 0) then
   begin
      Mensagem( 'Código inexistente.' );
      edNomeKit.SetFocus();
      edCodkIT.SelectAll();
      Exit;
   end
   else if not (frmComprasBuscaKits.isQuanEstoque) then
   begin
      edCodkIT.Text := '';
      edCodBarraKit.Text := '';
      Mensagem( 'O kit selecionado não possui produtos suficientes em estoque. ',
                              Application.Title, MB_OK + MB_ICONWARNING, Handle );
      edCodkIT.SetFocus();
      edCodkIT.SelectAll();
      Exit;
   end;

   filtraKit;
end;

procedure TfrmComprasRegistroSaidas.filtraProduto;
var
   ProdutoId: AnsiString;
   Found: Boolean;
begin
   ProdutoId := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
   Found := cdsProdutos.Locate('cd_produto', ProdutoId, []);

   edNrParcelas.Text := '1';
   lblvl_total.Caption := '';
   
   if not Found then
   begin
      btnIncluirClick( nil );
      cdsProdutos.Insert;
      cdsProdutoscd_produto.AsString := frmComprasBuscaProdutos.qyListaProdutosCD_PRODUTO.AsString;
      cdsProdutosds_produto.AsString := frmComprasBuscaProdutos.qyListaProdutosDS_PRODUTO.AsString;
      cdsProdutosnr_qtd_estoque.AsString := frmComprasBuscaProdutos.qyListaProdutosQTD_PRODUTOS.AsString;
      cdsProdutosnr_preco_unitario.AsString := FloatToStr( GetVlUnitario( cdsProdutoscd_produto.AsString ) );
      cdsProdutosds_codigo_barra.AsString := frmComprasBuscaProdutos.qyListaProdutoscodBarras.AsString;
      //cdsProdutosvl_total.AsFloat := (cdsProdutosnr_preco_unitario.AsFloat * cdsProdutosnr_quantidade.AsFloat);
      cdsProdutosnr_quantidade.AsInteger :=  1;
      cdsProdutosnr_quantidade.MaxValue :=  cdsProdutosnr_qtd_estoque.AsInteger;
      cdsProdutosnr_parcelas.AsInteger := frmComprasBuscaProdutos.qyListaProdutosNR_PARCELAS.AsInteger;
      cdsProdutossn_imprimir_cupom.AsInteger := frmComprasBuscaProdutos.qyListaProdutosSN_IMPRIMIR_CUPOM.AsInteger;
      cdsProdutossn_gerar_titulo.AsInteger := frmComprasBuscaProdutos.qyListaProdutossn_gerar_titulo.AsInteger;
      cdsProdutossn_acumular_valores.AsInteger := frmComprasBuscaProdutos.qyListaProdutossn_acumular_valores.AsInteger;
      cdsProdutosvl_compra.AsFloat := frmComprasBuscaProdutos.qyListaProdutosvl_compra.AsFloat;

      cdsProdutos.Post;

      pnParcelas.Visible := cdsProdutosmin_parcelar.Value = 1;

      //Reinicia os valores do painel de parcelas
      dtpVenctoSempre.Date := dm.DataAtual;
      edDiaVencto.Text := '';
      upParcelas.Max := cdsProdutosmin_parcelas.Value;
      while not cdsParcelas.IsEmpty do cdsParcelas.Delete;

      sn_imprimir := cdsProdutosmax_imprimir.Value = 1;
      alteraQuantidade();

      dbProdutos.SetFocus;
      dbProdutos.SelectedIndex := 3;
      dbProdutos.SelectedField.FocusControl;
      exibirTotalVenda();
   end;
end;

function TfrmComprasRegistroSaidas.financeiroPendente(cd_pessoa : Integer): Boolean;
const
   SQL_PENDENCIAS =
      'SELECT '+
         'COUNT(*) AS RESULTADO '+
      'FROM '+
         'MENSALIDADES M '+
            'LEFT JOIN PESSOAS P ON '+
               '(M.CD_RESP = P.CD_PESSOA) AND '+
               '(P.SN_NAO_BLOQUEAR_FINANCEIRO = 1) '+
      'WHERE '+
         'P.CD_PESSOA IS NULL AND '+
         'M.CODIGOALUNO = :CD_ALUNO AND '+
         '%s';

   SQL_FILTRO_FIXO = 'M.SITUACAO IN (2, 10) AND M.DATAVENCIMENTO <= :DT_VENCTO';
var
   LSFiltro: string;
   qyPendFinanceiro : TUMZQuery;
begin
   dm.CriarConsulta(qyPendFinanceiro);
   LSFiltro := SQL_FILTRO_FIXO;
   
   qyPendFinanceiro.Close;
   qyPendFinanceiro.SQL.Text := Format(SQL_PENDENCIAS, [LSFiltro]);
   qyPendFinanceiro.ParamByName('CD_ALUNO').AsInteger := cd_pessoa;
   if qyPendFinanceiro.Params.FindParam('DT_VENCTO') <> nil then
      qyPendFinanceiro.ParamByName('DT_VENCTO').AsDateTime := now;
   qyPendFinanceiro.Open;

   result := true;

   if (qyPendFinanceiro.FieldByName('RESULTADO').AsInteger > 0) then
   begin
      result := (MessageDlg('Este aluno possui pendências financeiras, deseja continuar o processo?', mtWarning, [mbYes, mbNo], -1) = mrYes);
   end;

end;

procedure TfrmComprasRegistroSaidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   SavePrefs;
   frmComprasBuscaProdutos := nil;
   frmComprasBuscaKits := nil;
   cd_pessoa_carregado := 0;
   Action := caFree;
   while not cdsProdutos.IsEmpty do cdsProdutos.Delete;
   FCompras.Free;
end;

procedure TfrmComprasRegistroSaidas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose := not (qyRegistraSaida.State IN [dsInsert]);

   if not CanClose then
   begin
      CanClose := cd_pessoa_carregado > 0;

      if CanClose then
         qyRegistraSaida.Cancel;      
   end;

   if not CanClose then
   begin
      Mensagem( 'Você precisa Salvar ou Cancelar o registro de Saída.', Application.Title, MB_OK + MB_ICONINFORMATION, 0 );
   end;
end;

procedure TfrmComprasRegistroSaidas.FormCreate(Sender: TObject);
begin
   FPessoaAgendamento := 0;
   FCompras := TStringList.Create;
   FCompras.Delimiter := ',';
   FCompras.StrictDelimiter := True;
   AbreQueryRegistraEstoque();
   cd_produto_carregado := '';
   cd_pessoa_carregado := 0;
   tipoSaida := 0;
   sn_imprimir := False;
   lblvl_total.Caption := '';

   if frmComprasBuscaProdutos = nil then
      Application.CreateForm( TfrmComprasBuscaProdutos, frmComprasBuscaProdutos );   

   if frmComprasBuscaKits = nil then
      Application.CreateForm( tfrmComprasBuscaKits, frmComprasBuscaKits );


   rgTipoEntrada.ItemIndex := strtoint(DM.variavel_parametro('saida_produtos_codigo_barras'));
   pnCod.Visible := true;
   PnCodBarra.Visible := false;
   if (rgTipoEntrada.ItemIndex = 1) then
   begin
      pnCod.Visible := false;
      PnCodBarra.Visible := true;
   end;

   DM.MontarPlanilha(dbProdutos, 'planilha_compras_registro_saida');
   setConfigGridProdutos();
end;

procedure TfrmComprasRegistroSaidas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F2:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            btnIncluirClick( nil )
         end else begin
            edCdPessoaChange( nil );
         end;
      VK_F5:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            if (not msgSemPermPro.Visible) then btnSalvarClick( nil );
         end else begin
            if (not msgSemPermKit.Visible) then btnsalvarKitClick( nil );
         end;
      VK_F6:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            btnCancelarClick( nil );
         end else begin
            btnCancelarKitClick( nil );
         end;
      VK_F12:
         if (PageControl1.ActivePageIndex = 0) then
         begin
            btnSairClick( nil );
         end else begin
            btnFecharKitClick( nil );
         end;
      VK_RETURN: begin
         if (PageControl1.ActivePageIndex = 0) then
         begin
            if ( DBEdit2.Focused ) then
            begin
               if trim(DBEdit2.Text) = '' then
               begin
                  Mensagem( 'Informe uma Pessoa.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
               end else begin
                  DBEdit2Exit(nil);
                  if(pnCod.Visible) then
                  begin
                     edCodigoProduto.SetFocus;
                  end
                  else
                  begin
                     edCodBarras.SetFocus;
                  end;
               end;
            end
            else if ( edCodigoProduto.Focused ) then
            begin
               if trim(edCodigoProduto.Text) = '' then
               begin
                  Mensagem( 'Informe um Produto.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
               end else begin
                  DbAnoSem.SetFocus;
               end;
            end
            else if ( DbAnoSem.Focused ) then
            begin
               btnSalvarClick( nil );
            end;
         end;
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.FormShow(Sender: TObject);
begin
   DBEdit2.SetFocus;

   if ( cd_produto_carregado <> '' ) OR ( cd_pessoa_carregado > 0 ) then
   begin
      btnIncluirClick(nil);

      if ( cd_pessoa_carregado > 0 ) then
      begin
         DBEdit2.SetFocus();
         DBEdit2.Text := IntToStr(cd_pessoa_carregado);
      end;      

      if ( cd_produto_carregado <> '' ) then
      begin
         PanelProduto.SetFocus();
         edCodigoProduto.Text := cd_produto_carregado;
      end;

      PanelProduto.SetFocus;

      DBEdit2.Text := IntToStr(cd_pessoa_carregado);

      cd_produto_carregado := '';
   end;

   LoadPrefs;
end;

function TfrmComprasRegistroSaidas.GetVlUnitario(cd_produto: String): Double;
const
   SQL_VL_UNITARIO =
      ' SELECT VL_PRODUTO ' +
      ' FROM COMP_PRODUTOS WHERE CD_PRODUTO = :CD_PRODUTO ';
var
   qyVlUnitario: TUMZReadOnlyQuery;
begin
   if(cd_produto = '') then
   begin
      result := 0;
      exit;
   end;

   DM.CriarConsulta(qyVlUnitario);

   qyVlUnitario.Close();

   qyVlUnitario.SQL.Text := SQL_VL_UNITARIO;
   qyVlUnitario.ParamByName('CD_PRODUTO').AsString := cd_produto;

   qyVlUnitario.Open();

   Result := qyVlUnitario.FieldByName('VL_PRODUTO').AsFloat;

   FreeAndNil(qyVlUnitario);
end;

function TfrmComprasRegistroSaidas.LastInsertId: Integer;
const
   SQL_LAST_INSERT_ID = ' SELECT MAX(cd_compra) AS ultimo FROM comp_estoque ';
var
   qyLastInsertId: TUMZQuery;
begin
   DM.CriarConsulta(qyLastInsertId);
   qyLastInsertId.SQL.Text := SQL_LAST_INSERT_ID;
   qyLastInsertId.Open();

   Result := qyLastInsertId.FieldByName('ultimo').AsInteger;

   FreeAndNil(qyLastInsertId);
end;

procedure TfrmComprasRegistroSaidas.LimpaQuandoMudaPessoa;
begin
   cdsProdutos.DisableControls;
   cdsProdutos.EmptyDataSet;
   cdsProdutos.EnableControls;

   cdsParcelas.DisableControls;
   cdsParcelas.EmptyDataSet;
   cdsParcelas.EnableControls;

   pnParcelas.Hide;
end;

procedure TfrmComprasRegistroSaidas.LoadPrefs;
const
   SModulo = 'UMFinanceiro';
   SChave1 = 'frmComprasRegistroSaidas.PageControl1.TabIndex';
   SChave2 = 'frmSelecionarPessoa.tsetTiposPesquisa.TabIndex';
var
   S: AnsiString;
   I: Integer;
begin
   S := DM.GetUserSetting(SChave1, SModulo, '0');
   I := StrToIntDef(S, 0);
   PageControl1.TabIndex := I;

   S := DM.GetUserSetting(SChave2, SModulo, '0');
   I := StrToIntDef(S, 0);
   FAbaFiltroPessoa := AbasFiltroPessoa(I);
end;

procedure TfrmComprasRegistroSaidas.PageControl1Change(Sender: TObject);
begin
   if (PageControl1.ActivePage = tbKits) then
   begin
      rgTipoEntradaKit.ItemIndex := strtoint(DM.variavel_parametro('saida_produtos_codigo_barras'));
   end;
end;

procedure TfrmComprasRegistroSaidas.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange := true;
   if (PageControl1.ActivePage = tbProdutos) then
   begin
      if (qyRegistraSaida.State in [dsEdit,dsInsert]) then
      begin
         AllowChange := false;
         exit;
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.podeRetirar(const cd_pessoa: Integer; const tipo : integer);
const
   SQL_PODE_RETIRAR =
      'SELECT sn_pode_retirar_material FROM pessoas WHERE cd_pessoa = :cd_pessoa';
var
   qyAux : TUMZQuery;
begin
   DM.CriarConsulta(qyAux);
   with qyAux do
   begin
      SQL.Add(SQL_PODE_RETIRAR);
      ParamByName('cd_pessoa').AsInteger := cd_pessoa;
      Open;

      if (FieldByName('sn_pode_retirar_material').AsInteger = 1) then
      begin
         if (tipo = 1) then
         begin
            msgSemPermPro.Visible := true;
            btnSalvar.Enabled := false;
         end else begin
            msgSemPermKit.Visible := true;
            btnsalvarKit.Enabled := false;
         end;
      end;
   end;

   FreeAndNil(qyAux);
end;

procedure TfrmComprasRegistroSaidas.qyRegistraSaidaAfterInsert(
  DataSet: TDataSet);
begin
   qyRegistraSaidaNR_ANOSEMESTRE.AsString := DM.UsuarioLogado.GetColigadaLogada.GetNuParametro('online.anosemestre.atual');
   DbAnoSem.ReadOnly := false;
end;

procedure TfrmComprasRegistroSaidas.qyRegistraSaidaBeforeInert(
  DataSet: TDataSet);
begin
   if not DM.UsuarioLogado.TemPermissao( 0, 'UMFinanceiro.Compras.Registro.Saidas', npIncluir, True ) then Abort();
end;

procedure TfrmComprasRegistroSaidas.qyRegistraSaidaBeforePost(
  DataSet: TDataSet);
begin
   qyRegistraSaidavl_compra.AsFloat := cdsProdutosvl_total.AsFloat;
   qyRegistraSaidatp_entrada_saida.AsInteger := 2;

   if ( qyRegistraSaidatp_pessoa.IsNull ) then
      qyRegistraSaidatp_pessoa.AsInteger := 0;
end;

function TfrmComprasRegistroSaidas.registrarSaidaProdutos: Boolean;

   procedure UpdateAgendamento(const CompraId, AgendamentoId: Integer);
   const
      SSQLUpdateAgenda = ''
         + 'UPDATE '
         + '   comp_agendamento a '
         + 'SET '
         + '   a.cd_compra = ?, '
         + '   a.ds_situacao = ''Entregue'' '
         + 'WHERE '
         + '   a.cd_agendamento = ? ';
   var
      Stmt: IZPreparedStatement;
   begin
      Stmt := PrepareStatement(SSQLUpdateAgenda);
      try
         Stmt.SetInt(1, CompraId);
         Stmt.SetInt(2, AgendamentoId);
         Stmt.ExecutePrepared;
      finally
         Stmt.Close;
         Stmt := nil;
      end;
   end;

var
   cd_ultima_compra, cd_compra, cd_pessoa, tp_pessoa, AnoSemestre, H: Integer;
begin
   Result := False;
   cd_pessoa := qyRegistraSaidacd_pessoa.AsInteger;
   tp_pessoa := qyRegistraSaidatp_pessoa.AsInteger;

   cdsProdutos.DisableControls;
   cdsParcelas.DisableControls;

   cdsProdutos.First;
   while not cdsProdutos.Eof do
   begin
      //valida a turma retirada para cada produto
      if not (validaTurmaRetirada(false)) then
      begin
         Mensagem('Não sera possivel efetuar a retirada do produto '+cdsProdutosds_produto.AsString+' pois o comprador não faz parte de nenhuma das turmas permitidas neste produto.');
         cdsProdutos.Next;
         continue;
      end;

      //verifica se excedeu o numero maximo por produto
      if not (excedeuNumeroMaxRetirada(false, cdsProdutosnr_quantidade.AsInteger)) then
      begin
         cdsProdutos.Next;
         continue;
      end;

      AnoSemestre := qyRegistraSaidaNR_ANOSEMESTRE.AsInteger;
      
      AbreQueryRegistraEstoque();
      qyRegistraSaida.Insert;

      //DM.db.StartTransaction;
      try

         //Salva as saidas
         qyRegistraSaidacd_usuario.AsInteger := dm.UsuarioLogado.Pessoa.Codigo;
         qyRegistraSaidadt_entrada.AsDateTime := Now;
         qyRegistraSaidadt_compra.AsDateTime := Now;
         qyRegistraSaidatp_entrada_saida.AsInteger := 2;
         qyRegistraSaidacd_pessoa.AsInteger := cd_pessoa;
         qyRegistraSaidacd_produto.AsString := cdsProdutoscd_produto.AsString;
         qyRegistraSaidanr_quantidade.AsInteger := cdsProdutosnr_quantidade.AsInteger;
         qyRegistraSaidavl_compra.AsFloat := cdsProdutosvl_total.AsFloat;
         qyRegistraSaidatp_pessoa.AsInteger := tp_pessoa;

         //post
         qyRegistraSaida.Post();
         cd_compra := DM.LastInsert();

         if not cdsProdutoscd_agendamento.IsNull then
            UpdateAgendamento(cd_compra, cdsProdutoscd_agendamento.AsInteger);

         FCompras.Add(Format('%d', [cd_compra]));

         //Se for apenas 1 titulo gera titulo normal, caso contrario gera com base na grid de parcelas
         if not (pnParcelas.Visible) then
         begin
            ClasseComprasEntradaSaida.GerarTitulo(cd_compra, False, AnoSemestre,
               cdsProdutoscd_produto.AsString);
         end else begin
            cdsParcelas.First;
            while not cdsParcelas.Eof do
            begin
               if ( cdsParcelasCD_PRODUTO.AsString = cdsProdutoscd_produto.AsString ) then
               begin
                  ClasseComprasEntradaSaida.GerarTituloVarios(
                     cdsParcelasVL_BRUTO.AsCurrency,
                     cdsParcelasDT_VENCTO.AsDateTime,
                     cd_compra,
                     cdsParcelasCD_TIPO_TITULO.AsInteger,
                     cdsParcelasNR_PARCELA.AsInteger,
                     False,
                     True,
                     AnoSemestre,
                     cdsProdutoscd_produto.AsString
                  );
               end;
               cdsParcelas.Next;
            end;
         end;
         
      except
         on E: Exception do
         begin
            Mensagem(E.Message, 'Erro', MB_ICONERROR or MB_OK);
            //DM.db.Rollback;
            cdsProdutos.Next;
            continue;
         end;
      end;

      //DM.db.Commit;
      Result := True;
      cd_ultima_compra := cd_compra;

     // Retirado por Claudionor - isso causou problemas para vários clientes.
     // if sn_imprimir then
     // begin
     //    sn_imprimir := cdsParcelasSUM_VALOR_BRUTO.Value = 0;
     // end;

      if sn_imprimir AND
         (Mensagem('Deseja imprimir o cupom?', Application.Title, MB_YESNO + MB_ICONQUESTION, Handle) = mrYes) then
      begin
         ClasseComprasEntradaSaida.ImprimirCupomDOS( cd_ultima_compra );
      end;

      cdsProdutos.Next;
   end;

   cdsProdutos.EnableControls;
   cdsParcelas.EnableControls;
end;

procedure TfrmComprasRegistroSaidas.rgTipoEntradaClick(Sender: TObject);
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

procedure TfrmComprasRegistroSaidas.rgTipoEntradaKitClick(Sender: TObject);
begin
   if (rgTipoEntradaKit.ItemIndex = 1) then
   begin
      pnCodKit.Visible := false;
      pnCodBarraKit.Visible := true;
   end
   else
   begin
      pnCodKit.Visible := true;
      pnCodBarraKit.Visible := false;
   end;
end;

procedure TfrmComprasRegistroSaidas.SavePrefs;
const
   SIntToStrFmt = '%d';
   SModulo = 'UMFinanceiro';
   SChave1 = 'frmComprasRegistroSaidas.PageControl1.TabIndex';
   SChave2 = 'frmSelecionarPessoa.tsetTiposPesquisa.TabIndex';
var
   S: AnsiString;
begin
   S := Format(SIntToStrFmt, [PageControl1.TabIndex]);
   DM.SetUserSetting(SChave1, S, SModulo);

   S := Format(SIntToStrFmt, [Ord(FAbaFiltroPessoa)]);
   DM.SetUserSetting(SChave2, S, SModulo);
end;

procedure TfrmComprasRegistroSaidas.exibirTotalVenda();
const
   CurrencyFmt = '###,###,##0.00';
var
   S: AnsiString;
   FmtSettings: TFormatSettings;
   Total : Currency;
begin
   if not
      TryStrToCurr(cdsProdutos.FieldByName('vl_total_compra').asString, Total)
   then
   begin
      Total := 0;
   end;             

   FmtSettings.ThousandSeparator := #46;
   FmtSettings.DecimalSeparator := #44;

   S := FormatCurr(
      CurrencyFmt,
     Total,
      FmtSettings
   );

   lblvl_total.Caption := 'R$ ' + S ;
end;

procedure TfrmComprasRegistroSaidas.sbCalcVenctoClick(Sender: TObject);
begin
   if (edDiaVencto.Text = '') then
   begin
      Mensagem(
         'Informe um dia de vencimento válido.',
         Application.Title,
         MB_OK + MB_ICONEXCLAMATION,
         Handle
      );
      edDiaVencto.SetFocus();
      exit;
   end;

   while not cdsParcelas.IsEmpty do cdsParcelas.Delete;

   cdsProdutos.DisableControls;
   cdsProdutos.First;

   while not cdsProdutos.Eof do
   begin
      Self.calculaVencimentos(
         strtoint(edNrParcelas.text),
         dtpVenctoSempre.DateTime,
         cdsProdutosvl_total.AsFloat,
         edDiaVencto.Text,
         cdsProdutoscd_produto.AsString
      );

      cdsProdutos.Next;
   end;

   exibirTotalVenda();
   cdsProdutos.EnableControls;
   cdsProdutos.First;
   cdsParcelas.First;
end;

procedure TfrmComprasRegistroSaidas.sbCalcVenctoKitClick(Sender: TObject);
begin
   if (edDiaVenctoKit.Text = '') then
   begin
      Mensagem( 'Informe um dia de vencimento válido.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      exit;
   end;

   Self.calculaVencimentos(
      strtoint(edNrParcelasKit.text),
      dtpVenctoSempreKit.DateTime,
      edValorTotalKit.getValor(),
      edDiaVenctoKit.Text,
      '0',
      strtoint(edCodkIT.Text)
   );
end;

procedure TfrmComprasRegistroSaidas.sbSelecionarColunaDiscClick(
  Sender: TObject);
begin
   Application.CreateForm(TfrmSelColunas, frmSelColunas);
   frmSelColunas.SelecionaColunas(dbProdutos, 'planilha_compras_registro_saida');
   setConfigGridProdutos();
end;

procedure TfrmComprasRegistroSaidas.setConfigGridProdutos();
var
   i : Integer;
begin
   // Deixa apenas o campo da quantidade editavel.
   // Os outros campos são apenas para leitura
   for i := 0 to dbProdutos.Columns.Count - 1 do
   begin
      if (dbProdutos.Columns[i].FieldName = 'nr_quantidade') then
      begin
         dbProdutos.Columns[i].ReadOnly := False;
         Continue;
      end;
      dbProdutos.Columns[i].ReadOnly := True;
   end;
end;

function TfrmComprasRegistroSaidas.setaValorKit : String;
const
   SQL_BUSCA_VALOR =
      'SELECT sum((ck.nr_quantidade * cp.VL_PRODUTO)) as ValorKit ' +
      'FROM comp_kits_itens ck '+
      'LEFT JOIN comp_produtos cp on (cp.CD_PRODUTO = ck.cd_produto) ' +
      'where cd_kit = :cd_kit';
var
   qyValorKit : TUMZQuery;
begin
   dm.CriarConsulta(qyValorKit);
   qyValorKit.Close;
   qyValorKit.SQL.Add(SQL_BUSCA_VALOR);
   qyValorKit.ParamByName('cd_kit').AsString := frmComprasBuscaKits.qyKitscd_kit.AsString;
   qyValorKit.Open;
   result := qyValorKit.FieldByName('ValorKit').AsString;
   FreeAndNil(qyValorKit);
end;

procedure TfrmComprasRegistroSaidas.SomenteNumeros(Sender: TObject;
  var Key: Char);
begin
   if not ( Key IN ['0'..'9', Chr(8), Chr(9)] ) then Key := #0;
end;

procedure TfrmComprasRegistroSaidas.SpeedButton1Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   if ( DBEdit2.Text <> IntToStr( cd_pessoa_carregado ) ) then
      cd_pessoa_carregado := 0;

   resultado := TfrmSelecionarPessoa.Filtrar([], FAbaFiltroPessoa);
   FAbaFiltroPessoa := AbasFiltroPessoa(TfrmSelecionarPessoa.GetInstancia.tsetTiposPesquisa.TabIndex);

   btnIncluirClick( nil );

   if not resultado.filtrado then
   begin
      qyRegistraSaidatp_pessoa.AsInteger := 0;
      qyRegistraSaidacd_pessoa.Clear();
      edNomeComprador.Text := '';
      Exit;
   end;

   if resultado.cd_pessoa <> cd_pessoa_carregado then
      LimpaQuandoMudaPessoa;

   cd_pessoa_carregado := resultado.cd_pessoa;
   qyRegistraSaidacd_pessoa.AsInteger := resultado.cd_pessoa;
   edNomeComprador.Text := resultado.nm_pessoa;

   if resultado.Aba = afpFornecedor then
   begin
      qyRegistraSaidatp_pessoa.AsInteger := 2;
   end else begin
      qyRegistraSaidatp_pessoa.AsInteger := 1;
   end;

   podeRetirar(qyRegistraSaidacd_pessoa.AsInteger, 1);
   VerificaAgendamentos;
end;

procedure TfrmComprasRegistroSaidas.SpeedButton3Click(Sender: TObject);
var
   resultado: TResultadoFiltroPessoa;
begin
   resultado := TfrmSelecionarPessoa.Filtrar([], FAbaFiltroPessoa);
   FAbaFiltroPessoa := AbasFiltroPessoa(TfrmSelecionarPessoa.GetInstancia.tsetTiposPesquisa.TabIndex);

   if resultado.Aba = afpFornecedor then
   begin
      tipoPessoa := 2;
   end else begin
      tipoPessoa := 1;
   end;
   //btnIncluirClick( nil );

   if not resultado.filtrado then
   begin
      edNmPessoa.Text := '';
      Exit;
   end;

   edCdPessoa.Text := inttostr(resultado.cd_pessoa);
   edNmPessoa.Text := resultado.nm_pessoa;
   podeRetirar(strtoint(edCdPessoa.Text), 2);
end;

procedure TfrmComprasRegistroSaidas.SpeedButton4Click(Sender: TObject);
begin
   if ( frmComprasBuscaKits = nil ) then
   begin
      Application.CreateForm(tfrmComprasBuscaKits, frmComprasBuscaKits);
   end;

   frmComprasBuscaKits.ShowModal();
   if not frmComprasBuscaKits.flgSearch then
   begin
      Exit;
   end;

   filtraKit;

end;

procedure TfrmComprasRegistroSaidas.SpeedButton5Click(Sender: TObject);
begin
   if ( frmComprasBuscaProdutos = nil ) then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   frmComprasBuscaProdutos.PermitiSemEstoque := False;
   frmComprasBuscaProdutos.ShowModal();
   if not frmComprasBuscaProdutos.flgSearch then
   begin
      Exit;
   end;
   filtraProduto;
end;

procedure TfrmComprasRegistroSaidas.calculaVencimentos(qtdParcelas : Integer; dataVencto : TDateTime; valorTotal:Currency; dia_vencto: String; cd_produto : String  = '0'; cd_kit: Integer  = 0);
const
   sql_get_tipo_titulo =
      'SELECT ca.CD_TIPO_TITULO, ft.ds_tipo_titulo FROM comp_categorias ca '+
      'INNER JOIN comp_categorias_coligadas ccc ON ('+
      'ccc.cd_categoria = ca.CD_CATEGORIA)'+
      'INNER JOIN fin_config_tipos_titulo FT ON (ft.cd_tipo_titulo = ca.CD_TIPO_TITULO '+
      'AND ft.cd_coligada_matriz = (select cd_coligada_matriz from coligadas where cd_coligada = ccc.cd_coligada)) ';
   sql_get_produto =
      'INNER JOIN comp_produtos cp ON (cp.cd_categoria = ca.CD_CATEGORIA) '+
      'WHERE cp.CD_PRODUTO = :produto';
   sql_get_kit =
      'INNER JOIN comp_kits cp ON (cp.cd_categoria = ca.CD_CATEGORIA) '+
      'WHERE cp.cd_kit = :kit ';
var
   i,tipoTitulo, nrParcela: integer;
   qryVerifica : TUMZQuery;
   dsTipoTitulo : String;
   valorTotalVenda,valorParcelaAtual, venctoOriginal, somaVenda: Currency;
   Temp,Vencto : TDateTime;
   Dia, Mes, Ano: Word;
   DiaValido: Boolean;
begin
   Dm.CriarConsulta(qryVerifica);
   qryVerifica.SQL.Add(sql_get_tipo_titulo);
   if (cd_produto <> '0') then
   begin
      qryVerifica.SQL.Add(sql_get_produto);
      qryVerifica.ParamByName('produto').AsString := cd_produto;
   end else begin
      qryVerifica.SQL.Add(sql_get_kit);
      qryVerifica.ParamByName('kit').AsInteger := cd_kit;
   end;
   qryVerifica.Open;

   tipoTitulo      := qryVerifica.FieldByName('CD_TIPO_TITULO').AsInteger;
   dsTipoTitulo    := qryVerifica.FieldByName('ds_tipo_titulo').AsString;
   nrParcela       := ClassePlanosPagamento.GetParcelaFromTipoTitulo( tipoTitulo );
   valorTotalVenda := valorTotal;

   FreeAndNil(qryVerifica);
   somaVenda := 0;

   cdsParcelas.Open;

   //Variaveis de data
   Temp := dataVencto;
   Ano := YearOf(Temp);
   Mes := MonthOf(Temp);
   Dia := Min(strtoint(dia_vencto), DaysInAMonth(Ano, Mes));
   Vencto := EncodeDate(Ano, Mes, Dia);
   venctoOriginal := Vencto;

   for I := 1 to qtdParcelas do
   begin
      cdsParcelas.Insert;
      cdsParcelasCD_TIPO_TITULO.AsInteger := tipoTitulo;
      cdsParcelasDS_TIPO_TITULO.AsString := dsTipoTitulo;
      cdsParcelasNR_PARCELA.AsInteger := nrParcela;
      cdsParcelasNM_PRODUTO.AsString := cdsProdutosds_produto.AsString;
      cdsParcelasCD_PRODUTO.AsString := cdsProdutoscd_produto.AsString;

      //Calculo da data da parcela
      DiaValido := not (
         (DayOfWeek(Vencto) = 7) or (DayOfWeek(Vencto) = 1) or (DM.FindDate(Vencto, Dm.UsuarioLogado.ColigadaLogada))
      );
      while not DiaValido do
      begin
         if Dia > 29 then
         begin
            Vencto := IncDay(Vencto, -1);
         end else begin
            Vencto := IncDay(Vencto);
         end;

         DiaValido := not (
            (DayOfWeek(Vencto) = 7) or (DayOfWeek(Vencto) = 1) or (DM.FindDate(Vencto, Dm.UsuarioLogado.ColigadaLogada))
         );
      end;
      cdsParcelasDT_VENCTO.AsDateTime := Vencto;
      Vencto := IncMonth(venctoOriginal, i);

      //Calculo do valor de cada parcela
      valorParcelaAtual := (valorTotalVenda/qtdParcelas);
      valorParcelaAtual := RoundFloat(valorParcelaAtual, 2);

      //Ultima parcela, faz o total - a soma para garantir valores quebrados
      if(i = qtdParcelas) then
      begin
         valorParcelaAtual := valorTotalVenda - somaVenda;
      end;
      somaVenda := somaVenda + valorParcelaAtual;
      cdsParcelasVL_BRUTO.AsCurrency := valorParcelaAtual;

      cdsParcelas.Post;
   end;
end;

procedure TfrmComprasRegistroSaidas.calculaVenctoClick(Sender: TObject);
begin
   if ( frmComprasBuscaProdutos = nil ) then
      Application.CreateForm(TfrmComprasBuscaProdutos, frmComprasBuscaProdutos);

   frmComprasBuscaProdutos.PermitiSemEstoque := False;
   frmComprasBuscaProdutos.ShowModal();
   if not frmComprasBuscaProdutos.flgSearch then
   begin
      Exit;
   end;
   filtraProduto;

end;

procedure TfrmComprasRegistroSaidas.cdsProdutosCalcFields(DataSet: TDataSet);
begin
   if DataSet.State = dsInternalCalc then
   begin
      if ( cdsProdutosnr_quantidade.AsFloat <= cdsProdutosnr_qtd_estoque.Asfloat )  then
      begin
         cdsProdutosvl_total.AsFloat := (cdsProdutosnr_preco_unitario.AsFloat * cdsProdutosnr_quantidade.AsFloat);
        exibirTotalVenda();
      end;

      cdsProdutossn_parcelar.AsBoolean :=
         (cdsProdutosnr_parcelas.AsInteger > 1) and
         (cdsProdutossn_acumular_valores.AsInteger = 0) and
         (cdsProdutossn_gerar_titulo.AsInteger = 1);

      cdsProdutosnr_parcelar.AsInteger := Ord(cdsProdutossn_parcelar.AsBoolean);
   end;
end;

procedure TfrmComprasRegistroSaidas.cdsProdutosnr_quantidadeSetText(
  Sender: TField; const Text: string);
var
   nr_quantidade : Integer;
   
begin
   nr_quantidade := StrToInt(Text);

   if (nr_quantidade > cdsProdutosnr_qtd_estoque.AsFloat) OR
      (nr_quantidade < 0 )
   then
   begin
      Sender.AsInteger := 1;
      Mensagem(
         'Valor Inválido! A quantidade máxima permitida: '
            + cdsProdutosnr_qtd_estoque.AsString,
         Application.Title,
         MB_OK + MB_ICONEXCLAMATION,
         Handle
      );
      Exit;
   end else begin
      Sender.AsInteger := nr_quantidade;
      exibirTotalVenda();
   end;
end;

procedure TfrmComprasRegistroSaidas.Timer1Timer(Sender: TObject);
begin
   if qyRegistraSaida.State IN [ dsInsert ] then
   begin
      qyRegistraSaidadt_entrada.AsDateTime := Now;
      qyRegistraSaidadt_compra.AsDateTime := Now;
   end;
end;

procedure TfrmComprasRegistroSaidas.udDAnoSemClick(Sender: TObject;
  Button: TUDBtnType);
begin
   if (qyRegistraSaida.State in [dsInsert,dsEdit]) then
   begin
      case Button of
         btNext:
         begin
            qyRegistraSaidaNR_ANOSEMESTRE.AsString := DM.incrementar_ano_semestre(qyRegistraSaidaNR_ANOSEMESTRE.AsString);
         end;
         btPrev:
         begin
            qyRegistraSaidaNR_ANOSEMESTRE.AsString := DM.decrementar_ano_semestre(qyRegistraSaidaNR_ANOSEMESTRE.AsString);
         end;
      end;
   end;
end;

procedure TfrmComprasRegistroSaidas.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
   if not(btnIncluirKit.Enabled) then
   begin
      case Button of
         btNext:
         begin
            txtAnoSemestre.Text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
         end;
         btPrev:
         begin
            txtAnoSemestre.Text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
         end;
      end;
   end;
end;

function TfrmComprasRegistroSaidas.validaTurmaRetirada(isKit: Boolean): Boolean;
const
   SQL_VERIFICA_TURMA =
      'SELECT COUNT(f.codigoaluno) as cont, ck.cd_turma as turma '+
      'FROM comp_kits_turmas CK '+
      'INNER JOIN turmas T on (T.codigo = CK.cd_turma and T.anosemestre = ck.cd_anosemestre) '+
      'INNER JOIN fichaindividual F on (f.turma = T.codigo and f.anosemestre = t.anosemestre) '+
      'JOIN situacao s ON (F.situacao = s.cd_situacao) ' +
      'WHERE s.cd_situacao_pai NOT IN (3, 4, 5, 6) '+
      'AND F.codigoaluno = :cd_aluno '+
      'AND ck.cd_kit = :cod ' +
      'GROUP BY codigoaluno ';
   SQL_VERIFICA_POSSUI_KIT =
      'SELECT count(*) as valor from comp_kits_turmas where cd_kit = :cod';
   SQL_VERIFICA_TURMA_PRODUTO =
      'SELECT COUNT(f.codigoaluno) as cont, ck.cd_turma as turma '+
      'FROM  comp_produtos_turmas CK '+
      'INNER JOIN turmas T on (T.codigo = CK.cd_turma and T.anosemestre = ck.cd_anosemestre) '+
      'INNER JOIN fichaindividual F on (f.turma = T.codigo and f.anosemestre = t.anosemestre) '+
      'JOIN situacao s ON (F.situacao = s.cd_situacao) ' +
      'WHERE s.cd_situacao_pai NOT IN (3, 4, 5, 6) '+
      'AND F.codigoaluno = :cd_aluno '+
      'AND ck.cd_produto = :cod ' +
      'GROUP BY codigoaluno ';
   SQL_VERIFICA_POSSUI_PRODUTO =
      'SELECT count(*) as valor from comp_produtos_turmas where cd_produto = :cod';
var
   qyVerificaTurma: TUMZQuery;
   codTipo,codPessoa : String;
begin

   dm.CriarConsulta(qyVerificaTurma);
   if (isKit) then
   begin
      qyVerificaTurma.SQL.Add(SQL_VERIFICA_POSSUI_KIT);
      codTipo := edCodkIT.Text;
      codPessoa := edCdPessoa.Text;
   end
   else
   begin
      qyVerificaTurma.SQL.Add(SQL_VERIFICA_POSSUI_PRODUTO);
      codTipo := cdsProdutoscd_produto.AsString;
      codPessoa := qyRegistraSaidacd_pessoa.AsString;
   end;
   
   qyVerificaTurma.ParamByName('cod').AsString := codTipo;
   qyVerificaTurma.Open;

   { Se o kit/produto não possui turmas cadastradas }
   if (qyVerificaTurma.FieldByName('valor').AsInteger = 0) then
   begin
      result := true;
      exit;
   end;

   qyVerificaTurma.Close;
   qyVerificaTurma.SQL.Clear;
   if (isKit) then
   begin
      qyVerificaTurma.SQL.Add(SQL_VERIFICA_TURMA);
   end
   else
   begin
     qyVerificaTurma.SQL.Add(SQL_VERIFICA_TURMA_PRODUTO);
   end;
   qyVerificaTurma.ParamByName('cd_aluno').AsString := codPessoa;
   qyVerificaTurma.ParamByName('cod').AsString := codTipo;
   qyVerificaTurma.Open;

   { Se a pessoa esta cursando uma das turmas }
   if (qyVerificaTurma.FieldByName('cont').AsInteger > 0 ) then
   begin
      result := true;
      exit;
   end;


   result := false;
end;

procedure TfrmComprasRegistroSaidas.VerificaAgendamentos;
begin
   if cd_pessoa_carregado = FPessoaAgendamento then
      Exit;

   cdsProdutos.DisableControls;
   cdsProdutos.Filter := 'cd_agendamento IS NOT NULL';
   cdsProdutos.Filtered := True;
   while not cdsProdutos.IsEmpty do cdsProdutos.Delete;
   cdsProdutos.Filtered := False;
   cdsProdutos.EnableControls;

   FPessoaAgendamento := cd_pessoa_carregado;

   if not TfrmAgendamentoSaida.TemAgendamentos(cd_pessoa_carregado) then
      Exit;

   if not TfrmAgendamentoSaida.ShowAgendamentos(cd_pessoa_carregado) then
   begin
      FreeAndNil(frmAgendamentoSaida);
      Exit;
   end;

   with frmAgendamentoSaida do
   begin
      cdsAgendamentos.DisableControls;
      cdsAgendamentos.Filter := 'sn_selecionado';
      cdsAgendamentos.Filtered := True;
      cdsAgendamentos.First;
      cdsProdutos.DisableControls;
      
      while not cdsAgendamentos.Eof do
      begin
         cdsProdutos.Insert;
         cdsProdutoscd_produto.AsString := cdsAgendamentosCD_PRODUTO.AsString;
         cdsProdutosds_produto.AsString := cdsAgendamentosDS_PRODUTO.AsString;
         cdsProdutosnr_qtd_estoque.AsInteger := cdsAgendamentosNR_QUANTIDADE_ESTOQUE.AsInteger;
         cdsProdutosnr_preco_unitario.AsFloat := cdsAgendamentosVL_PRODUTO.AsFloat;
         cdsProdutosnr_quantidade.AsInteger := cdsAgendamentosnr_quantidade.AsInteger;
         cdsProdutosnr_quantidade.MaxValue := cdsAgendamentosNR_QUANTIDADE_ESTOQUE.AsInteger;
         cdsProdutossn_imprimir_cupom.AsInteger := cdsAgendamentosSN_IMPRIMIR_CUPOM.AsInteger;
         cdsProdutossn_acumular_valores.AsInteger := cdsAgendamentosSN_ACUMULAR_VALORES.AsInteger;
         cdsProdutossn_gerar_titulo.AsInteger := cdsAgendamentosSN_GERAR_TITULO.AsInteger;
         cdsProdutosnr_parcelas.AsInteger := cdsAgendamentosNR_PARCELAS.AsInteger;
         cdsProdutoscd_agendamento.AsInteger := cdsAgendamentoscd_agendamento.AsInteger;
         cdsAgendamentos.Next;
      end;
      
      if cdsProdutos.State = dsInsert then
         cdsProdutos.Post;
      cdsProdutos.EnableControls;         
      cdsAgendamentos.Filtered := False;
      cdsAgendamentos.EnableControls;
   end;

   sn_imprimir := cdsProdutosmax_imprimir.Value = 1;
   pnParcelas.Visible := cdsProdutosmin_parcelar.Value = 1;
   dtpVenctoSempre.Date := Date;
   upParcelas.Max := cdsProdutosmin_parcelas.Value;
   
   exibirTotalVenda;
   FreeAndNil(frmAgendamentoSaida);
end;

function TfrmComprasRegistroSaidas.verificaExcedenteKit: Boolean;
const
    SQL_BUSCA_ITEM_KIT =
      'select ci.cd_produto, ci.nr_quantidade, (ci.nr_quantidade * cp.VL_PRODUTO) as valor from comp_kits_itens ci '+
      'LEFT JOIN comp_produtos cp on (cp.cd_produto = ci.cd_produto) where cd_kit = :cd_kit';
var
   qryKitsProdutos : TUMZQuery;
   nrMaxExcedido: Boolean;
begin
   dm.CriarConsulta(qryKitsProdutos);
   qryKitsProdutos.SQL.Add(SQL_BUSCA_ITEM_KIT);
   qryKitsProdutos.ParamByName('cd_kit').AsString := edCodkIT.Text;
   qryKitsProdutos.open;

   while not qryKitsProdutos.Eof do
   begin
      qyRegistraSaidaKits.Close;
      qyRegistraSaidaKits.Open;

      qyRegistraSaidaKits.Insert;

      qyRegistraSaidaKitscd_produto.AsString := qryKitsProdutos.FieldByName('cd_produto').AsString;
      qyRegistraSaidaKitscd_pessoa.AsString := edCdPessoa.Text;
      qyRegistraSaidaKitstp_pessoa.AsInteger := tipoPessoa;
      qyRegistraSaidaKitstp_entrada_saida.AsInteger := 2;
      qyRegistraSaidaKitsnr_quantidade.AsInteger := (qryKitsProdutos.FieldByName('nr_quantidade').AsInteger * StrToInt(edQuantidadekit.Text));
      qyRegistraSaidaKitsdt_entrada.AsDateTime := Now;
      qyRegistraSaidaKitsdt_compra.AsDateTime := Now;
      qyRegistraSaidaKitsvl_compra.AsFloat := (qryKitsProdutos.FieldByName('valor').AsFloat * StrToInt(edQuantidadekit.Text));
      qyRegistraSaidaKitsCD_KIT.AsString :=  edCodkIT.Text;

      { Se não excedeu o maximo de retiradas para cada produto }
      nrMaxExcedido := excedeuNumeroMaxRetirada(true, qyRegistraSaidaKitsnr_quantidade.AsInteger);
      if  not (nrMaxExcedido) then
      begin
         break;
      end;

      qryKitsProdutos.Next;
   end;
   result := (nrMaxExcedido);
end;

procedure TfrmComprasRegistroSaidas.btnFecharKitClick(Sender: TObject);
begin
   qyRegistraSaida.Close;
   close();
end;

procedure TfrmComprasRegistroSaidas.btnsalvarKitClick(Sender: TObject);
const
    SQL_BUSCA_ITEM_KIT =
      'select ci.cd_produto, ci.nr_quantidade, (ci.nr_quantidade * cp.VL_PRODUTO) as valor from comp_kits_itens ci '+
      'LEFT JOIN comp_produtos cp on (cp.cd_produto = ci.cd_produto) where cd_kit = :cd_kit';
var
   qryKitsProdutos : TUMZQuery;
   possuiTurma: Boolean;
   isPendente:Boolean;
   cd_compra, AnoSemestre: Integer;
   comprasEntradaSaida : TClasseComprasEntradaSaida;
begin
   if (edCdPessoa.Text = '') then
   begin
      Mensagem( 'Informe uma Pessoa.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edCdPessoa.SetFocus;
      Exit;
   end;

   if (edCodkIT.Text = '') then
   begin
      Mensagem( 'Informe um Kit.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edCodkIT.SetFocus;
      Exit;
   end;

   if ( strtoint(edQuantidadeKit.Text) < 1 ) then
   begin
      Mensagem( 'Informe uma quantia válida.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
      edQuantidadeKit.SetFocus;
      Exit;
   end;

   if (pnParcelaKit.Visible) then
   begin
      if (edDiaVenctoKit.Text = '') then
      begin
         Mensagem( 'Informe um dia de vencimento válido.', Application.Title, MB_OK + MB_ICONEXCLAMATION, Handle );
         exit;
      end;

      //Regera as parcelas no dataset para gerar as mensalidades dps
      Self.sbCalcVenctoKitClick(Self);
   end;

   possuiTurma := (validaTurmaRetirada(true));
   isPendente := financeiroPendente(StrToInt(edCdPessoa.text));

   if ((possuiTurma) and (isPendente) and (verificaExcedenteKit)) then
   begin
      dm.CriarConsulta(qryKitsProdutos);
      qryKitsProdutos.SQL.Add(SQL_BUSCA_ITEM_KIT);
      qryKitsProdutos.ParamByName('cd_kit').AsString := edCodkIT.Text;
      qryKitsProdutos.open;

      try
         FCompras.Clear;
         cd_compra := 0;
         while not qryKitsProdutos.Eof do
         begin
            qyRegistraSaidaKits.Close;
            qyRegistraSaidaKits.Open;
            qyRegistraSaidaKits.Insert;

            //Insere na tabela de estoque
            qyRegistraSaidaKitscd_produto.AsString := qryKitsProdutos.FieldByName('cd_produto').AsString;
            qyRegistraSaidaKitscd_pessoa.AsString := edCdPessoa.Text;
            qyRegistraSaidaKitstp_pessoa.AsInteger := tipoPessoa;
            qyRegistraSaidaKitstp_entrada_saida.AsInteger := 2;
            qyRegistraSaidaKitsnr_quantidade.AsInteger := (qryKitsProdutos.FieldByName('nr_quantidade').AsInteger * StrToInt(edQuantidadekit.Text));
            qyRegistraSaidaKitsdt_entrada.AsDateTime := Now;
            qyRegistraSaidaKitsdt_compra.AsDateTime := Now;
            qyRegistraSaidaKitsvl_compra.AsFloat := (qryKitsProdutos.FieldByName('valor').AsFloat * StrToInt(edQuantidadekit.Text));
            qyRegistraSaidaKitsCD_KIT.AsString :=  edCodkIT.Text;
            qyRegistraSaidaKitscd_usuario.AsInteger := dm.UsuarioLogado.Pessoa.Codigo;

            qyRegistraSaidaKits.Post;
            if (cd_compra = 0) then
            begin
               cd_compra := DM.LastInsert();
               FCompras.Add(Format('%d', [cd_compra]));
            end;

            qryKitsProdutos.Next;

            if not pnParcelaKit.Visible then
            begin
               //Adiciona um acumulo
               comprasEntradaSaida.AdicionaAcumulado(
                  qyRegistraSaidaKitsCD_COMPRA.AsInteger,
                  qyRegistraSaidaKitscd_pessoa.AsInteger,
                  qryKitsProdutos.ParamByName('cd_kit').AsInteger
               );
            end;
         end;

         AnoSemestre := StrToIntDef(txtAnoSemestre.Text,
            DM.GetAnoSemestreAtual);

         //Caso o cliente tenha parcelado o vencimento insere as mensalidades ja aqui
         if pnParcelaKit.Visible then
         begin
            cdsParcelas.First;
            while not cdsParcelas.Eof do
            begin
               if cdsParcelasVL_BRUTO.AsCurrency > 0 then
               begin
                  ClasseComprasEntradaSaida.GerarTituloVarios(
                     cdsParcelasVL_BRUTO.AsCurrency,
                     cdsParcelasDT_VENCTO.AsDateTime,
                     cd_compra,
                     cdsParcelasCD_TIPO_TITULO.AsInteger,
                     cdsParcelasNR_PARCELA.AsInteger,
                     false,
                     false,
                     AnoSemestre
                  );
               end;
               cdsParcelas.Next;
            end;
         end;

         if not pnParcelaKit.Visible then
         begin
            //Gera a mensalidade com base em todos os acumulos deste kit
            comprasEntradaSaida.GerarTitulosAcumulados(
                  strtoint(edCdPessoa.Text),
                  '',
                  qryKitsProdutos.ParamByName('cd_kit').AsInteger,
                  AnoSemestre
            );
         end;
      except
         Mensagem('Não foi possivel efetuar a retirada deste kit.');
         exit;
      end;

      BaixaMensalidade;
      Mensagem('Kit retirado com sucesso.');
      btnCancelarKitClick(nil);
      exit;
   end;

   if not (possuiTurma) then
   begin
      Mensagem('Não sera possivel efetuar a retirada deste kit pois a pessoa ' + edNmPessoa.Text + ' não faz parte de nenhuma das turmas permitidas deste kit.');
   end;

   if not (isPendente) then
   begin
      btnCancelarKitClick(nil);
   end;

end;

procedure TfrmComprasRegistroSaidas.btnCancelarKitClick(Sender: TObject);
begin

   btnIncluirKit.Enabled := true;

   edCdPessoa.Text := '';
   edNmPessoa.Text := '';
   edCodkIT.Text := '';
   edNomeKit.Text := '';
   edCodBarraKit.Text := '';
   edPrecoUnitarioKit.Text := '0,00';
   edQuantidadeKit.Text := '';
   edValorTotalKit.Text := '';
   edQuantkit.Text := '0,00';
   pnParcelaKit.Visible := false;

   FreeAndNil(frmComprasBuscaKits);
   Application.CreateForm( tfrmComprasBuscaKits, frmComprasBuscaKits );

   btnIncluirKit.Enabled := true;
   btnsalvarKit.Enabled := false;
   btnCancelarKit.Enabled := false;
   btnFecharKit.Enabled := true;
   msgSemPermKit.Visible := false;
   DbAnoSem.ReadOnly := true;
   pnParcelaKit.Visible := false;

   edCdPessoa.SetFocus;
end;

end.
