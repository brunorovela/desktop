unit uNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, CheckLst, Buttons, Mask, DBCtrls,
  DB, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, Math, Grids, DBGrids,
  DBTables, ZStoredProcedure, ClassRegistros, Spin, UMDateTimePicker,
  UMEditNumerico, UMEditMonetario, uItemCombo, UMComboBox, UMAjuda;

type
  TfrmNegociacao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Bevel4: TBevel;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    lbNome: TLabel;
    Label3: TLabel;
    lbCodigo: TLabel;
    tblMensalidades: TUMZQuery;
    tblMensalidadesValorTotalCalc: TFloatField;
    tblMensalidadesValorJurosCalc: TFloatField;
    qryPoupanca: TUMZQuery;
    qryPoupancaMedia: TFloatField;
    qyNegocia: TUMZQuery;
    dsNegocia: TDataSource;
    qyNegociaValTotal: TCurrencyField;
    qyNegociaValLiquido: TCurrencyField;
    qyNegociads_negocia: TStringField;
    qyNegociadt_negocia: TDateTimeField;
    qyNegociavl_bruto_negocia: TFloatField;
    qyNegociavl_juros_negocia: TFloatField;
    qyNegociavl_entrada: TFloatField;
    qyAux: TUMZQuery;
    qyNegociaNomeUsuario: TStringField;
    qyParcAtual: TUMZQuery;
    qyParcNovas: TUMZQuery;
    dsParcNova: TDataSource;
    dsParcAtual: TDataSource;
    qyParcAtualparcela: TSmallintField;
    qyParcAtualdatavencimento: TDateTimeField;
    qyParcAtualvalor_bruto: TFloatField;
    qyParcAtualvalorjuros: TFloatField;
    qyParcAtualvalor_total: TFloatField;
    qyParcNovasparcela: TSmallintField;
    qyParcNovasdatavencimento: TDateTimeField;
    qyParcNovasvalor_total: TFloatField;
    qyParcNovasvalorpago: TFloatField;
    qyParcNovasdatapagamento: TDateTimeField;
    qyNegociavl_creditos: TFloatField;
    tblMensalidadesValorDescontoCalc: TCurrencyField;
    qyNegociaJurosNegociado: TCurrencyField;
    tblMensalidadesdatavencimento: TDateTimeField;
    tblMensalidadesdatabasecorrecao: TDateTimeField;
    tblMensalidadessituacao: TSmallintField;
    tblMensalidadesparcela: TSmallintField;
    tblMensalidadessn_liberar_juros: TSmallintField;
    tblMensalidadessn_liberar_descontos: TSmallintField;
    tblMensalidadesvalorjuros: TFloatField;
    tblMensalidadesvalorjuros_fixo: TFloatField;
    tblMensalidadesvalorbruto: TFloatField;
    tblMensalidadesvalordesconto: TFloatField;
    tblMensalidadesvalorextra: TFloatField;
    tblMensalidadesvalorpago: TFloatField;
    tblMensalidadesdescontoextra: TFloatField;
    tblMensalidadesturma: TStringField;
    tblMensalidadesanosemestre: TSmallintField;
    tblMensalidadesnr_creditos: TFloatField;
    tblMensalidadesvalortotal: TFloatField;
    tblMensalidadestipoparcela: TSmallintField;
    tblMensalidadesnm_resp: TStringField;
    tblMensalidadesjuros_calc: TFloatField;
    tblMensalidadesdesconto_calc: TFloatField;
    qyNegociaAnterior: TUMZQuery;
    qyNegociaAnteriords_negocia: TStringField;
    qyNegociaAnteriordt_negocia: TDateTimeField;
    qyNegociaAnteriorvl_bruto_negocia: TFloatField;
    qyNegociaAnteriorvl_juros_negocia: TFloatField;
    cd_usuario: TSmallintField;
    qyNegociaAnteriorValLiquido: TCurrencyField;
    qyNegociaAnteriorValTotal: TCurrencyField;
    qyNegociaAnteriorvl_creditos: TFloatField;
    qyNegociaAnteriorcd_simulacao: TIntegerField;
    qyNegociaAnteriorJurosNegociado: TCurrencyField;
    qyNegociaAnteriorvl_desconto_negocia: TFloatField;
    dsNegociaAnterior: TDataSource;
    qyNegociaAnteriornm_usuario_negocia: TStringField;
    qyNegociaAnteriornm_usuario_simula: TStringField;
    qyNegociaAnteriorvl_entrada: TFloatField;
    qyNegociavl_desconto_negocia: TFloatField;
    spNegocia: TZStoredProc;
    tblMensalidadescd_mensalidade: TIntegerField;
    qyNegociacd_negocia: TLargeintField;
    qyNegociacd_simulacao: TIntegerField;
    qyNegociaAnteriorcd_negocia: TLargeintField;
    qyNegociacd_usuario: TIntegerField;
    qyNegociacd_pessoa: TIntegerField;
    qyNegociaAnteriorcd_pessoa: TIntegerField;
    Panel4: TPanel;
    Panel5: TPanel;
    tblMensalidadesds_tipo_titulo: TStringField;
    pnRodape: TPanel;
    btnCancelar: TBitBtn;
    btnSimular: TBitBtn;
    btnConfirmar: TBitBtn;
    pnRegistradas: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Label27: TLabel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label28: TLabel;
    DBGrid3: TDBGrid;
    Bevel2: TBevel;
    Panel7: TPanel;
    Label31: TLabel;
    cbSimulacao: TComboBox;
    sbExcluir: TSpeedButton;
    Panel8: TPanel;
    Label20: TLabel;
    Panel9: TPanel;
    btnNegociacao: TSpeedButton;
    btnDesfazer: TSpeedButton;
    BitBtn1: TBitBtn;
    qyParcAtualds_tipo_titulo: TStringField;
    Panel10: TPanel;
    grdAtuais: TStringGrid;
    sbMarcarVencidas: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    sbMarcar: TSpeedButton;
    sbParcelasPagas: TSpeedButton;
    Label5: TLabel;
    Panel11: TPanel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label12: TLabel;
    Label32: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    dbBruto: TDBEdit;
    dbJurosNegociados: TDBEdit;
    edPorcentagemDesc: TUMEditMonetario;
    edValorDesc: TUMEditMonetario;
    dbLiberarDescontos: TCheckBox;
    dbTotal: TDBEdit;
    dbEntrada: TDBEdit;
    dbLiquido: TDBEdit;
    dbCreditos: TDBEdit;
    ckbCorrige: TCheckBox;
    Bevel3: TBevel;
    Panel12: TPanel;
    W: TGroupBox;
    Label16: TLabel;
    Label30: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    sb6X: TSpeedButton;
    sb5X: TSpeedButton;
    sb4X: TSpeedButton;
    sb3X: TSpeedButton;
    sb2X: TSpeedButton;
    sb1X: TSpeedButton;
    Label19: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btnCalcular: TBitBtn;
    dbOBS: TDBEdit;
    cbTipoTitulos: TComboBox;
    cbTurma: TComboBox;
    txtJuros: TEdit;
    cbData: TComboBox;
    umdtApartir: TUMDateTimePicker;
    txtParcelas: TSpinEdit;
    cbJuros: TComboBox;
    Panel13: TPanel;
    grdTotais: TStringGrid;
    grdNovas: TStringGrid;
    Label9: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    Label22: TLabel;
    qryPlanosNegocia: TUMZQuery;
    dsPlanosNegocia: TDataSource;
    qryPlanosNegociacd_plano_negociacao: TLargeintField;
    cbRegras: TUMComboBox;
    qryPlanosNegociads_tipo_titulo: TStringField;
    qryPlanosNegociavl_entrada_minima: TFloatField;
    qryPlanosNegocianr_max_parcelas: TLargeintField;
    qryPlanosNegociads_desc_negocia: TStringField;
    UMAjuda1: TUMAjuda;
    qryPlanosNegociacd_tipo_titulo: TIntegerField;
    tblMensalidadescd_tipo_titulo: TIntegerField;
    qryPlanosNegociamesesDisponiveis: TLargeintField;
    qryPlanosNegocianr_situacao_titulo: TIntegerField;
    qryPlanosNegociatp_juros: TStringField;
    qryPlanosNegociaTurmas: TUMZQuery;
    qryPlanosNegociasn_usar_todas_turmas: TSmallintField;
    qryPlanosNegociaTurmascd_plano_negociacao: TIntegerField;
    qryPlanosNegociavl_juros: TFloatField;
    qryPlanosNegociavl_min_divida: TFloatField;
    qryPlanosNegociavl_max_divida: TFloatField;
    qryPlanosNegociavl_min_parcela: TFloatField;
    qryPlanosNegocianr_dia_vencimento: TIntegerField;
    qryPlanosNegociasn_acrescimo: TIntegerField;
    qryPlanosNegociavl_multa: TFloatField;
    Label23: TLabel;
    qyNegociavl_juros_negocia_visual: TFloatField;
    edJuros: TUMEditMonetario;
    edMulta: TUMEditMonetario;
    procedure dsNegociaDataChange(Sender: TObject; Field: TField);
    procedure edJurosExit(Sender: TObject);
    procedure edJurosChange(Sender: TObject);
    procedure cbRegrasChange(Sender: TObject);
    procedure edValorDescKeyPress(Sender: TObject; var Key: Char);
    procedure edValorDescEnter(Sender: TObject);
    procedure edPorcentagemDescKeyPress(Sender: TObject; var Key: Char);
    procedure edPorcentagemDescEnter(Sender: TObject);
    procedure grdAtuaisClick(Sender: TObject);
    procedure dbEntradaExit(Sender: TObject);
    procedure cbJurosChange(Sender: TObject);
    procedure grdAtuaisDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edValorDescExit(Sender: TObject);
    procedure edPorcentagemDescExit(Sender: TObject);
    procedure qyNegociaAfterPost(DataSet: TDataSet);
    procedure umdtApartirChangeDate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbMarcarVencidasClick(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure grdNovasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdNovasKeyPress(Sender: TObject; var Key: Char);
    procedure ckbCorrigeClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qyNegociaAnteriorCalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure grdNovasGetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure grdTotaisDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grdNovasSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure grdNovasSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grdNovasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnNegociacaoClick(Sender: TObject);
    procedure txtJurosChange(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure dbEntradaChange(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cbTipoTitulosChange(Sender: TObject);
    procedure dbBrutoExit(Sender: TObject);
    procedure qyNegociaBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure sbParcelasPagasClick(Sender: TObject);
    procedure qyNegociavl_juros_negociaChange(Sender: TField);
    procedure edCreditosKeyPress(Sender: TObject; var Key: Char);
    procedure btnDesfazerClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure txtParcelasChange(Sender: TObject);
    procedure sbDesmarcarNovasClick(Sender: TObject);
    procedure sbMarcarNovasClick(Sender: TObject);
    procedure txtJurosKeyPress(Sender: TObject; var Key: Char);
    procedure txtJurosExit(Sender: TObject);
    procedure sb6XClick(Sender: TObject);
    procedure sb5XClick(Sender: TObject);
    procedure sb4XClick(Sender: TObject);
    procedure sb3XClick(Sender: TObject);
    procedure sb2XClick(Sender: TObject);
    procedure sb1XClick(Sender: TObject);
    procedure dbBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure lstAtuaisClickCheck(Sender: TObject);
    procedure sbDesmarcarClick(Sender: TObject);
    procedure sbMarcarClick(Sender: TObject);
    procedure qyNegociaCalcFields(DataSet: TDataSet);
    procedure btnCalcularClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tblMensalidadesCalcFields(DataSet: TDataSet);
    procedure tblMensalidadesBeforePost(DataSet: TDataSet);
    procedure carregaTela;
    procedure atualizaJurosComMulta();
  private
    { Private declarations }
    descontoNegativo: Boolean;
    brutoNegativo: Boolean;
    alterarJuros: Boolean;
    alterarDesconto: Boolean;
    FSNomeAluno: string;
    FSlNegociacoes: TStringList;
    FICodigoAluno: integer;
    SomaCreditos : Currency;
    SomaJurosNegociados : Currency;
    Calculou : Boolean;
    lstTipos : Array of Integer;
    lstTiposContas : Array of Integer;
    lstTiposParcelas : Array of Integer;
    LinAnt : Integer;
    colAnt : Integer;
    ArrayValores : Array [0..200] of Currency;
    ArrayJuros : Array [0..200] of Currency;
    ArrayJurosCalc : Array [0..200] of Currency;
    ArrayJurosCalcOriginal : Array [0..200] of Currency;
    ArrayDescontos : Array [0..200] of Currency;
    ArrayJurosNominal : Array [0..200] of Currency;
    ArrayCalculados : Array[0..200] of Currency;
    ArrayDatas : Array[0..200] of TDateTime;
    ArrayDatasInicial : Array[0..200] of TDateTime;
    ArrayParcelas : Array[0..200] of Integer;
    ArrayCodParcelas : Array[0..200] of Integer;
    ArrayTodasTurmas : Array[0..200] of String[50];
    ArrayTurmas : Array[0..200] of String[50];
    ArrayAnoSemestre : Array[0..200] of Integer;
    ArrayParcelasNovas : Array[0..200] of Integer;
    ArrayDescontosNovas : Array[0..200] of Currency;
    ArrayJurosNovas : Array[0..200] of Currency;

    ArrayJurosParcela : Array[0..200] of Currency;
    ArrayResponsavel : Array[0..200] of string;

    ArrayCreditosAtuais : Array[0..200] of Currency;
    ArrayCreditosNovas : Array[0..200] of Currency;

    ArraySimulacoes : Array of Integer;
    ASelList: TStringList;

    slConfirmaMensalidadesInalteradas: TStringList;
    rowSelecionada : Boolean;
    recarregaGrid : Boolean;
    totalJuros: Currency;
    mudouValorGrid : Boolean;
    mudouValorDesconto : Boolean;
    permissaoTela : Integer;
    anoSemOnline: String;
    listaTiposTitulo : TStringList;
    trocaPlanoManual : Boolean;
    valorMulta: Currency;

    procedure MarcarVencidas();
    procedure CalcularValoresSelecionados;
    procedure MarcarTodas(situ: boolean);
    procedure ZerarArrayCalculados;
    procedure TransferirMensalidades(nListBox : Integer);
    procedure CarregarParcelasParaNegociar;
    procedure CarregarSimulacoes;
    procedure MontaCombos;
    procedure montaComboAtuais();
    procedure ChecarPermissoes;
    procedure grdDefineTamanho;
    procedure AtualizarJuros;
    procedure atualizaTotais();
    procedure iniciaDescontos();
    procedure EstornarChequeNegociado;
    procedure atualizarDadosParcelasAtuais();
    procedure atualizaDadosNovasParcelas();
    procedure checaParcelaAtual(ARow: Integer);
    function formataValorCurrency(valor: Currency): Currency;
    function formataValorString(valor: Currency): String;
    function TotalizaLinha(Linha : Integer) : Boolean;
    procedure carregaRegras();
    procedure habilitaCampos();
    procedure atualizaValoresFromPlano();
    function getIsSelecionadoPlano():Boolean;
    function desselecionarParcelaPorRegra(indice:Integer):Boolean;
    procedure trocaParaManualmente();
    procedure atualizaMaxParcelas(nrAtual:Integer);
    procedure copiaArray(arrBase:Array of Currency;var arrResultado:Array of Currency);
  public
    BrutoTotal : Currency;
    
    property NomeAluno: string read FSNomeAluno write FSNomeAluno;
    property CodigoAluno: integer read FICodigoAluno write FICodigoAluno;
  end;

var
  frmNegociacao: TfrmNegociacao;

implementation

uses uDM, Main, uUsuario, uMotivos, uClassMovimento,
  uNegociacaoSimula, uMensalidades, uCobranca, uGeneral;

{$R *.dfm}
{$Optimization Off}

procedure TfrmNegociacao.tblMensalidadesBeforePost(DataSet: TDataSet);
var
  wAno, wMes, wDia : Word;
begin

  DecodeDate( tblMensalidadesDataVencimento.AsDateTime, wAno, wMes, wDia );
  tblMensalidadesDataBaseCorrecao.AsDateTime := EncodeDate( wAno, wMes, 1 );

end;

procedure TfrmNegociacao.tblMensalidadesCalcFields(DataSet: TDataSet);
var
  fDesconto, fJuros: double;

begin

  // CALCULAR O VALORTOTAL

  // Parcelas VENCIDAS
  if ( tblMensalidadesSituacao.Value in [ 2, 10 ] ) then begin


       // Pegar desconto para data de hoje
       fDesconto:= tblMensalidadesdesconto_calc.AsCurrency;

       fJuros:= tblMensalidadesValorJuros.Value + tblMensalidadesjuros_calc.AsCurrency;

       tblMensalidadesValorDescontoCalc.Value := fDesconto;

       // Novo Cálculo, incluindo o Juros pendente
       tblMensalidadesValorTotalCalc.Value := RoundFloat(
             ( tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesDescontoExtra.Value - fDesconto + fJuros) ,2);

       // Novo Juros
       tblMensalidadesValorJurosCalc.Value := RoundFloat(
               tblMensalidadesValorTotalCalc.Value - (
               tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value - tblMensalidadesDescontoExtra.Value - fDesconto ), 2 );

    Exit;

  end else begin

     if (tblMensalidadesSituacao.AsInteger in [0,1,3] ) Then begin
      	  tblMensalidadesValorTotalCalc.Value := RoundFloat( tblMensalidadesValorTotal.Value, 2 )
     end else begin
          tblMensalidadesValorTotalCalc.Value := RoundFloat(tblMensalidadesValorBruto.Value +
                  tblMensalidadesValorExtra.Value -
                  tblMensalidadesValorDesconto.Value -
                  tblMensalidadesDescontoExtra.Value +
                  tblMensalidadesValorJuros.Value, 2 );
     end;

     tblMensalidadesValorDescontoCalc.Value := tblMensalidadesdesconto_calc.AsCurrency;
     tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value, 2 );

  end;
end;

procedure TfrmNegociacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5 : btnCalcularClick( nil );
  end;

end;



procedure TfrmNegociacao.FormShow(Sender: TObject);
begin
   cbJuros.ItemIndex := 1;
   if (dm.GetUsuarioLogado.GetParametroUsuarioValor(cbJuros, Self.Name+'.cbJuros') = 'Simples') then
   begin
      cbJuros.ItemIndex := 0;
   end;

   rowSelecionada := false;
   recarregaGrid := true;
   mudouValorGrid := false;
   mudouValorDesconto := true;
   trocaPlanoManual := false;

   if(qyNegociavl_desconto_negocia.AsString <> '') then
   begin
      edValorDesc.setValor(qyNegociavl_desconto_negocia.AsCurrency);
      edValorDescExit(self);
   end;
end;

procedure TfrmNegociacao.carregaTela;
begin
  ASelList := TStringList.Create();
  lbNome.Caption := Self.FSNomeAluno;
  lbCodigo.Caption := Format('%d', [Self.FICodigoAluno]);
  Self.valorMulta := 0;
  
  permissaoTela := 1;
  if (DM.UsuarioLogado.TemPermissao( 2017, npEspecial, False )) then
  begin
    permissaoTela := 2;
  end;

  try
    MontaCombos();
    
    CarregarParcelasParaNegociar;
    CarregarSimulacoes;

    carregaRegras();
    ChecarPermissoes;

    Calculou := False;
    SpeedButton3Click(nil);
    TotalizaLinha(1);
    grdAtuais.Refresh;

    //Se for 1 inicia os valores do plano
    if(permissaoTela = 1) then
    begin
       self.atualizaValoresFromPlano();
    end;

    iniciaDescontos();
    habilitaCampos();
  except on E: Exception do
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegociacao.atualizaDadosNovasParcelas;
begin
   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.atualizaJurosComMulta;
var
   i:integer;
   nrParcelas:integer;
   valorMulta : Currency;
   encontrouZerada : Boolean;
begin
   encontrouZerada := false;
   //Restuara o original
   Self.copiaArray(ArrayJurosCalcOriginal,ArrayJurosCalc);

   //Se multa for 0 sai e deixa o original
   if (Self.valorMulta = 0) then
   begin
      exit;
   end;

   //Se não distribui o valor da multa pelo array de juros
   nrParcelas := 0;
   for I := 0 to 200 do
   begin
      if(ArrayJurosCalc[i] <> 0) then
      begin
         encontrouZerada := true;
      end;

      //Se ainda esta zerado e passou de 10 ou se ja encontrou valores e agora ta 0
      if((ArrayJurosCalc[i] = 0) AND (i > 10)) OR
         (encontrouZerada) AND (ArrayJurosCalc[i] = 0) then
      begin
         break;
      end;
      inc(nrParcelas);
   end;

   if (nrParcelas = 0) OR (encontrouZerada = false) then
   begin
      exit;
   end;
   

   valorMulta := (Self.valorMulta/nrParcelas);
   for I := 0 to nrParcelas-1 do
   begin
      ArrayJurosCalc[i] := ArrayJurosCalc[i] + valorMulta; 
   end;

end;

procedure TfrmNegociacao.atualizaMaxParcelas(nrAtual:Integer);
begin
   //Verifica se pode passar do numero maximo de parcelas dependende da permissão
   if (nrAtual > txtParcelas.MaxValue) AND (Self.getIsSelecionadoPlano()) then
   begin
      if(permissaoTela = 2) then
      begin
         trocaParaManualmente();
      end else begin
         txtParcelas.Value := txtParcelas.MaxValue;
      end;
   end;
end;

procedure TfrmNegociacao.atualizarDadosParcelasAtuais;
begin
  CalcularValoresSelecionados;
  grdAtuais.Refresh;

  edValorDesc.setValor(qyNegociavl_desconto_negocia.AsCurrency);
  edValorDescExit(self);

  atualizaDadosNovasParcelas();
end;

procedure TfrmNegociacao.AtualizarJuros;
Var
   n : Integer;
   dataBase : TDateTime;
   qAux: TUMZQuery;
   sAux : String;
begin
   if ckbCorrige.Checked then begin
      dataBase := umdtApartir.getDate;
   end else begin
      dataBase := DataHoje;
   end;

   DM.CriarConsulta(qAux);
   qAux.Close();
   qAux.SQL.Text := 'SELECT GET_ACRESCIMOS(:cd_mensalidade, :data) as JUROS';

   // Percorre as parcelas atuais e atualizar os juros, conforme a data selecionada
   for n := 1 to (grdAtuais.RowCount - 1) do
   begin
      qAux.ParamByName('cd_mensalidade').AsInteger := ArrayCodParcelas[n-1];
      qAux.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', dataBase);
      qAux.Open();

      ArrayJuros[n-1] := ArrayJurosParcela[n-1] + qAux.FieldByName('JUROS').Value;
      ArrayJurosCalc[n-1] := ArrayJurosParcela[n-1] + qAux.FieldByName('JUROS').Value;

      qAux.Close();

      //Atualiza a grid de parcelas
      grdAtuais.Cells[3, n] := Format( '%0.2n', [ArrayValores[n-1] + ArrayJuros[n-1] - ArrayDescontos[n-1]]);
   end;

   CalcularValoresSelecionados;

end;

procedure TfrmNegociacao.btnCalcularClick(Sender: TObject);
var
  wYear, wMonth, wDay, wDiaAtual : Word;    // Data inicial do 1o Pagamento
  wAno, wMes, wDia            : Word;       // Data de Hoje (negociação)

  // diferença de meses da data de Hoje até a data do 1o Pgto
  a, n, difMeses, nPar, i   : Integer;
  MyDay                 : TDateTime;
  paramMensaNego        : String;

  // Valor Mensal das Prestações
  jurosNovasParcelas,
  valorLiquidoCadaParcela  : Single;
  fatorDivisao          : double;
  cTotalBrutoCadaParcela : Currency;
  cTotalLiquido         : Currency;
  iPar                  : Integer;
  ValorCredito          : Currency ;
  cBrutoSoma            : Currency ;
  cJurosSoma            : Currency ;
  cBrutoOrigem          : Currency;
  cJurosOrigem          : Currency;
  cDiferencaJuros       : Currency;
  cDescontoSoma         : Currency;
  cDescontoOrigem       : Currency;
  cDiferencaDescontos   : Currency;
  cDbJuros              : Currency;
  cDbDesconto           : Currency;
begin
   { Cálculo das Parcelas Negociadas }
   grdNovas.Enabled     := (permissaoTela = 2);
   grdTotais.Enabled    := true;
   valorLiquidoCadaParcela := 0;
   totalJuros := 0;

   ZerarArrayCalculados;

   Screen.Cursor := crHourGlass;

   grdNovas.RowCount := 2;
   grdNovas.FixedRows := 1;

   //Verificação de dia atual
   DecodeDate( umdtApartir.getDate, wYear, wMonth, wDay );

   wDiaAtual := wDay;
   DecodeDate( DataHoje, wAno, wMes, wDia );

   if ((DaysPerMonth[wmes] = wDiaAtual) and (wMonth <> 2)) then
   begin
      wDiaAtual := 31
   end
   else if ( wMonth = 2 ) then
   begin
      if ( (IsLeapYear(wYear)) and (wDay = 29) ) then
      begin
         wDiaAtual := 31;
      end
      else if ( wDia = 28 ) then
      begin
         wDiaAtual := 31;
      end;
   end;
   
   MyDay := umdtApartir.getDate;

   { --- Inicio do Cálculo Financeiro -- }
   try
      jurosNovasParcelas := (StrToFloat( Trim( txtJuros.Text ) ) / 100);
      if(jurosNovasParcelas <= 0.00) then
      begin
         jurosNovasParcelas := 0;
      end;
   except
      jurosNovasParcelas := 0;
   end;

   //Atribui o valor de desconto selecionado pelo usuario
   cDbDesconto := 0;
   qyNegociavl_desconto_negocia.AsCurrency := edValorDesc.getValor;

   {
      Verificar o total das prestações
      O valor das mensalidades já são reajustados até a data de hoje
      terá que calcular juros somente da data de hoje em diante.
   }

   // Se a entrada for maior que o bruto, não sobra bruto para as parcelas.
   cTotalBrutoCadaParcela := 0;
   if qyNegociavl_entrada.AsCurrency < qyNegociavl_bruto_negocia.AsCurrency then
   begin
      cTotalBrutoCadaParcela := qyNegociaValLiquido.AsCurrency - qyNegociavl_juros_negocia.AsCurrency + qyNegociavl_desconto_negocia.AsCurrency;
   end;

   //Liquido
   cTotalLiquido := qyNegociaValLiquido.AsCurrency + qyNegociavl_desconto_negocia.AsCurrency;

   //Inicia com o total liquido da negociação dividido pelo numero de parcelas
   valorLiquidoCadaParcela := cTotalLiquido / txtParcelas.Value;

   //Calculo do valor liquido para cada parcela
   if jurosNovasParcelas > 0 Then
   begin
      //Inicia assumindo que foram escolhidos juros do tipo Simples
      valorLiquidoCadaParcela := (cTotalLiquido + (cTotalLiquido * jurosNovasParcelas) ) / txtParcelas.Value;

      //Juros novos são do tipo Composto
      if cbJuros.ItemIndex = 1 then
      begin
          difMeses := Meses( DataHoje, umdtApartir.getDate );  // Dif de meses

          // Cobrar juros composto até a data de inicio
          if (difMeses > 1) then
          begin
             cTotalLiquido := RoundFloat(cTotalLiquido * Power( (1 + jurosNovasParcelas), (difMeses-1)),2);
          end;

          if txtParcelas.Value >= 1 then
          begin
             fatorDivisao := (1 - (Power(1 + jurosNovasParcelas, -txtParcelas.Value))) / jurosNovasParcelas;
             valorLiquidoCadaParcela := RoundFloat((cTotalLiquido / fatorDivisao),2);
          end;
      end;
   end;

   { -- Fim do Cálculo Financeiro -- }
   cTotalBrutoCadaParcela := cTotalBrutoCadaParcela / txtParcelas.Value;

   // Incluir a Entrada no Array;
   nPar := txtParcelas.Value - 1;

   // Verificar o número inicial da parcela de negociação
   iPar := 0;
   if cbTipoTitulos.ItemIndex >= 0 then begin

      // Usar o número do tipo de títulos
      iPar := lstTiposParcelas[cbTipoTitulos.ItemIndex];
   end;

   if iPar = 0 then begin

      iPar := 20;
      paramMensaNego := DM.variavel_parametro('mensalidades_parcela_negociada');
      if paramMensaNego <> '' then Begin
         iPar := StrToInt(paramMensaNego);
      end;
   end;
      
   n := 0;
   a := 0;
   cBrutoSoma := 0;
   cJurosSoma := 0;
   cDescontoSoma := 0;

   if qyNegociavl_entrada.AsCurrency > 0 then
   begin
      //Inicia a entrada só como valor bruto
      ArrayCalculados[n] := RoundFloat(qyNegociavl_entrada.AsCurrency, 2);
      ArrayJurosNovas[n] := 0;

      // Se o valor da entrada for maior que o valor bruto, separar bruto e juros
      if qyNegociavl_entrada.AsCurrency > qyNegociavl_bruto_negocia.AsCurrency then
      begin
         ArrayCalculados[n] := qyNegociavl_bruto_negocia.AsCurrency;
         ArrayJurosNovas[n] := qyNegociavl_entrada.AsCurrency - qyNegociavl_bruto_negocia.AsCurrency;
      end;

      //Inicia com a data de hj
      ArrayDatas[n] := DataHoje;

      if cbData.ItemIndex = 1 then
      begin
         ArrayDatas[n] := umdtApartir.getDate;
         Inc( wMonth );

        if wMonth = 13 then
        begin
          wMonth := 1;
          Inc( wYear );
        end;

        if ( wMonth = 2 ) and ( wDay >= 30 ) then
        begin
          wDay := 28;
        end;
        try
          MyDay := EncodeDate( wYear, wMonth, wDay );
        except
          MyDay := EncodeDate( wYear, wMonth, wDay - 1 );
        end;
      end;

      ArrayDescontosNovas[n] := 0;

      // Verificar se foi selecionado o tipo de título... Alterar a número das parcelas
       i := n + iPar + a;
       ArrayParcelasNovas[n] := i;

       // Apresentar a Entrada na grade
       grdNovas.RowCount := n + 2;

       // Arrendondar valores
       ArrayCalculados[n] := formataValorCurrency(ArrayCalculados[n]);
       ArrayJurosNovas[n] := formataValorCurrency(ArrayJurosNovas[n]);
       ArrayDescontosNovas[n] := formataValorCurrency(ArrayDescontosNovas[n]);

       cBrutoSoma := cBrutoSoma + ArrayCalculados[n];
       cJurosSoma := cJurosSoma + ArrayJurosNovas[n];
       cDescontoSoma := cDescontoSoma + ArrayDescontosNovas[n];

       
       grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
       grdNovas.Cells[1, n + 1] := FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] );
       grdNovas.Cells[2, n + 1] := formataValorString(ArrayCalculados[n]);
       grdNovas.Cells[3, n + 1] := formataValorString(ArrayJurosNovas[n]);
       grdNovas.Cells[4, n + 1] := formataValorString(ArrayDescontosNovas[n]);
       grdNovas.Cells[5, n + 1] := formataValorString(ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]);

       n := 1;
       nPar := nPar + 1;
   end;

   MyDay := umdtApartir.getDate;
   if (cbData.ItemIndex = 1) then
   begin
     if wMonth = 13 then
     begin
       wMonth := 1;
       Inc( wYear );
     end;

     if ( wMonth = 2 ) and ( wDay >= 30 ) then 
     begin
      wDay := 29;
     end;
     
     try
       MyDay := EncodeDate( wYear, wMonth, wDiaAtual );
     except
       MyDay := EncodeDate( wYear, wMonth, wDiaAtual - 1 );
     end;
   end;

   //Vare as parcelas
   while n <= nPar do 
   begin
      wday := wDiaAtual;
      case DayOfWeek( MyDay ) of   { Sábado ou Domingo }
         1 : MyDay := MyDay + 1;
         7 : MyDay := MyDay + 2;
      end;

      ArrayCalculados[n] := RoundFloat( ( cTotalBrutoCadaParcela ), 2 );
      ArrayDatas[n] := MyDay;
      ArrayJurosNovas[n] := valorLiquidoCadaParcela - ArrayCalculados[n];
      ArrayDescontosNovas[n] := qyNegociavl_desconto_negocia.AsCurrency / txtParcelas.Value ;

      i := n + iPar + a;
      ArrayParcelasNovas[n] := i;
      grdNovas.RowCount := n + 2;

      ValorCredito := 0;
      if (qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency) > 0 then
      begin
         ValorCredito :=
            ((ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]) * qyNegociavl_creditos.AsCurrency) / (qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency);   
      end;
      ArrayCreditosNovas[n] := ValorCredito;
       
      ArrayCalculados[n] := formataValorCurrency(ArrayCalculados[n]);
      ArrayJurosNovas[n] := formataValorCurrency(ArrayJurosNovas[n]);
      ArrayDescontosNovas[n] := formataValorCurrency(ArrayDescontosNovas[n]);

      cBrutoSoma := cBrutoSoma + ArrayCalculados[n];
      cJurosSoma := cJurosSoma + ArrayJurosNovas[n];
      cDescontoSoma := cDescontoSoma + formataValorCurrency(ArrayDescontosNovas[n]);

      grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
      grdNovas.Cells[1, n + 1] := FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] );
      grdNovas.Cells[2, n + 1] := formataValorString(ArrayCalculados[n]);
      grdNovas.Cells[3, n + 1] := formataValorString(ArrayJurosNovas[n]);
      grdNovas.Cells[4, n + 1] := formataValorString(ArrayDescontosNovas[n]);
      grdNovas.Cells[5, n + 1] := formataValorString(ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]);
       
      Inc( n );
      Inc( wMonth );

      if wMonth = 13 then
      begin
        wMonth := 1;
        Inc( wYear );
      end;

      if ( wMonth = 2 ) and ( wDay >= 30 ) and (not(IsLeapYear(wYear))) then
      begin
         wDay := 28
      end
      else if (IsLeapYear( wYear ) AND ( wMonth = 2 ) AND (wDay >= 29))  then
      begin
         wDay := 29;
      end;

      try
        MyDay := EncodeDate( wYear, wMonth, wday );
      except
        MyDay := EncodeDate( wYear, wMonth, wday - 1 );
      end;
   end;
   
   {
     Abaixo verifica se não faltou algum valor na negociação,
     se achar diferença joga na ultima parcela (parcela atual = n)
   }
   
   // Verificar se o total ficou diferente do negociado
   if cBrutoSoma <> qyNegociavl_bruto_negocia.AsCurrency then 
   begin
      ArrayCalculados[n - 1] := ArrayCalculados[n - 1] + (qyNegociavl_bruto_negocia.AsCurrency - cBrutoSoma);
       
      grdNovas.Cells[2, n ] := formataValorString(ArrayCalculados[n - 1]);
      grdNovas.Cells[5, n ] := formataValorString(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1]);
   end;

   if(cbJuros.ItemIndex = 0) AND (jurosNovasParcelas > 0) then
   begin
      ArrayJurosNovas[n - 1] := ArrayJurosNovas[n - 1] + (((qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency) * jurosNovasParcelas) - cJurosSoma) + qyNegociavl_juros_negocia.AsCurrency;

      grdNovas.Cells[3, n ] := formataValorString(ArrayJurosNovas[n - 1]);
      grdNovas.Cells[5, n ] := formataValorString(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1]);

     //cJurosSoma := (qyNegociavl_bruto_negocia.AsCurrency * jurosNovasParcelas);
   end;

   //Verifica se os juros diferem
   if (cJurosSoma <> qyNegociavl_juros_negocia.AsCurrency) AND (jurosNovasParcelas <= 0) AND (cbJuros.ItemIndex <> 0) then
   begin
      ArrayJurosNovas[n - 1] := ArrayJurosNovas[n - 1] + (qyNegociavl_juros_negocia.AsCurrency - cJurosSoma);

      grdNovas.Cells[3, n ] := formataValorString(ArrayJurosNovas[n - 1]);
      grdNovas.Cells[5, n ] := formataValorString(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1]);

      cJurosSoma := qyNegociavl_juros_negocia.AsCurrency;
   end;

   //Verifica descontos
   if (cDescontoSoma <> qyNegociavl_desconto_negocia.AsCurrency) then begin
      ArrayDescontosNovas[n - 1] := ArrayDescontosNovas[n - 1] + (qyNegociavl_desconto_negocia.AsCurrency - cDescontoSoma);

      grdNovas.Cells[4, n ] := formataValorString(ArrayDescontosNovas[n - 1]);
      grdNovas.Cells[5, n ] := formataValorString(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1]);

      cDescontoSoma := qyNegociavl_desconto_negocia.AsCurrency;
   end;

   grdTotais.Cells[3,0] := formataValorString(qyNegociavl_juros_negocia.AsFloat);
   grdTotais.Cells[5,0] := formataValorString(qyNegociavl_bruto_negocia.AsFloat + qyNegociavl_juros_negocia.AsFloat - qyNegociavl_desconto_negocia.AsFloat);
   if cJurosSoma > 0 then begin
       grdTotais.Cells[3,0] := formataValorString(cJurosSoma);
       grdTotais.Cells[5,0] := formataValorString(qyNegociavl_bruto_negocia.AsFloat + cJurosSoma - cDescontoSoma);
   end;

   grdTotais.Cells[4,0] := formataValorString(qyNegociavl_desconto_negocia.AsFloat);
   grdTotais.Cells[5,0] := formataValorString(qyNegociavl_bruto_negocia.AsFloat + qyNegociavl_juros_negocia.AsFloat - qyNegociavl_desconto_negocia.AsFloat);
   if cDescontoSoma > 0 then begin
      grdTotais.Cells[4,0] := formataValorString(cDescontoSoma);
      grdTotais.Cells[5,0] := formataValorString(qyNegociavl_bruto_negocia.AsFloat + cJurosSoma - cDescontoSoma);
   end;

   // Apresentar a grade de totais;
   grdTotais.Cells[0,0] := 'TOT';
   grdTotais.Cells[1,0] := ' = ';
   grdTotais.Cells[2,0] := formataValorString(qyNegociavl_bruto_negocia.AsFloat);
   grdTotais.Cells[4,0] := formataValorString(qyNegociavl_desconto_negocia.AsFloat);

   // Reajustar os juros e os descontos originais
   // Baseado no Valor da Soma dos Juros "cJurosSoma"
   // cJurosSoma = Soma dos Juros da Nova negociação

   cJurosOrigem := 0;
   cDescontoOrigem := 0;
   cBrutoOrigem := 0;
   cDiferencaJuros := 0;
   cDiferencaDescontos := 0;
   i := 0;
   cDbJuros := 0;

   for n := 1 to (grdAtuais.RowCount - 1) do
   begin
      if ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
      begin
         cJurosOrigem := cJurosOrigem + ArrayJuros[n-1];
         cDescontoOrigem := cDescontoOrigem + ArrayDescontos[n-1];
         cBrutoOrigem := cBrutoOrigem + ArrayValores[n-1];
      end
   end;

   //Tenta pegar o valor dos juros, caso não tenta novamente tirando os '.'
   try
      if edJuros.Text = '' then
      begin
         edJuros.Text := '0,00';
      end;

      cDbJuros := StrToCurr(edJuros.Text);
   except
      cDbJuros := StrToCurr(StringReplace(edJuros.Text, '.', '', [rfReplaceAll, rfIgnoreCase]));
   end;

   cDbJuros := cDbJuros + self.valorMulta;

   if cJurosOrigem <> cJurosSoma then
   begin
       for n := 1 to (grdAtuais.RowCount - 1) do
       begin
         if ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
         begin
             if cJurosOrigem = 0 then
             begin
                 ArrayJuros[n-1] := StrToFloat(FloatToStrF((( ArrayValores[n-1] / cBrutoOrigem ) * cDbJuros), ffFixed, 12, 2));
             end else begin
                 ArrayJuros[n-1] := StrToFloat(FloatToStrF((( ArrayJuros[n-1] / cJurosOrigem ) * cDbJuros), ffFixed, 12, 2));
             end;
             cDiferencaJuros := cDiferencaJuros + ArrayJuros[n-1];
             i := n;
         end
       end;
   end else begin
      cDiferencaJuros := cJurosSoma;
   end;
   
   if (cDbJuros <> cDiferencaJuros) then begin
       ArrayJuros[i] := ArrayJuros[i] + (cDbJuros - cDiferencaJuros);
   end;

   // Reajustar os descontos na origem
   // Baseado no Valor da Soma dos Juros "cJurosSoma"
   // cJurosSoma = Soma dos Juros da Nova negociação
   if cDescontoOrigem <> cDescontoSoma then
   begin
       for n := 1 to (grdAtuais.RowCount - 1) do
       begin
         if ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
         begin
             if cDescontoOrigem = 0 then
             begin
                 ArrayDescontos[n-1] := StrToFloat(FloatToStrF((( ArrayDescontos[n-1] / cBrutoOrigem ) * cDescontoSoma), ffFixed, 12, 2));
             end else begin
                 ArrayDescontos[n-1] := StrToFloat(FloatToStrF((( ArrayDescontos[n-1] / cDescontoOrigem ) * cDescontoSoma), ffFixed, 12, 2));
             end;
             cDiferencaDescontos := cDiferencaDescontos + ArrayDescontos[n-1];
             i := n;
         End
       end;
    end else begin
       cDiferencaDescontos := cDescontoSoma;
    end;

    if (cDescontoSoma <> cDiferencaDescontos) then
    begin
       ArrayDescontos[i] := ArrayDescontos[i] + (cDescontoSoma - cDiferencaDescontos);
    end;

    totalJuros := cJurosSoma;

    Calculou := true;
    atualizaTotais;
    Screen.Cursor := crDefault;
end;

procedure TfrmNegociacao.atualizaTotais();
var
  bruto                 : Double;
  Acrescimo             : Double;
  Desconto              : Double;
  Liquido               : Double;
  n                     : Integer;
begin
   Desconto := 0;
   Bruto := 0;
   Acrescimo := 0;
   Liquido := 0;

   for n := 0 to grdNovas.RowCount - 2 do
   begin
      Bruto := Bruto + ArrayCalculados[n];
      Acrescimo := Acrescimo + ArrayJurosNovas[n];
      Desconto := Desconto + ArrayDescontosNovas[n];
      Liquido := Liquido + (ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]);
   end;

   grdTotais.Cells[0, 0] := 'TOT';
   grdTotais.Cells[1, 0] := ' = ';
   grdTotais.Cells[2, 0] := FloatToStrF(Bruto, ffFixed, 12, 2);
   grdTotais.Cells[3, 0] := FloatToStrF(Acrescimo, ffFixed, 12, 2);
   grdTotais.Cells[4, 0] := FloatToStrF(Desconto, ffFixed, 12, 2);
   grdTotais.Cells[5, 0] := FloatToStrF(Liquido, ffFixed, 12, 2);
end;

//Carrega as configurações do plano selecionado pra tela
procedure TfrmNegociacao.atualizaValoresFromPlano();
var
   cd_plano_novo, valorJuros : String;
   nr_max_parcelas,indexJuros, i, nrParcelasMinimo : Integer;
   entrada, valorTotalRestante: Currency;
   maxDate:TDateTime;
begin
   cd_plano_novo := TItemCombo(cbRegras.Items.Objects[cbRegras.ItemIndex]).getCodigo();
   nr_max_parcelas := 99;
   entrada := 0;
   indexJuros := 0;
   maxDate := 0;
   valorJuros := txtJuros.Text;
   Self.valorMulta := 0;

   //Se não for manualmente
   if(cd_plano_novo <> '-1') then
   begin
      qryPlanosNegocia.Locate( 'cd_plano_negociacao', VarArrayOf( [cd_plano_novo] ), [loCaseInsensitive] );
      nr_max_parcelas := qryPlanosNegocianr_max_parcelas.AsInteger;

      entrada := RoundFloat(((qyNegociavl_bruto_negocia.AsCurrency * qryPlanosNegociavl_entrada_minima.AsCurrency) / 100),2);
      Self.valorMulta := RoundFloat(((qyNegociavl_bruto_negocia.AsCurrency * qryPlanosNegociavl_multa.AsCurrency) / 100),2);

      //Numero maximo de parcelas
      if(qryPlanosNegociamesesDisponiveis.AsInteger < nr_max_parcelas) then
      begin
         nr_max_parcelas := qryPlanosNegociamesesDisponiveis.AsInteger;

         if(qryPlanosNegociamesesDisponiveis.AsInteger < 1) then
         begin
            nr_max_parcelas := 1;
         end;
      end;

      //Verifica tipo de juros
      if(qryPlanosNegociatp_juros.AsString = 'C') then
      begin
         indexJuros := 1;
      end;

      //Seta tipo de titulo
      for I := 0 to cbTipoTitulos.Items.Count - 1 do
      begin
         if(cbTipoTitulos.Items.Strings[i] = qryPlanosNegociads_tipo_titulo.AsString) then
         begin
            cbTipoTitulos.ItemIndex := i;
            break;
         end;   
      end;

      //Acrecimo - Se usar
      valorJuros := '0';
      if(qryPlanosNegociasn_acrescimo.AsInteger = 1) then
      begin
         valorJuros := qryPlanosNegociavl_juros.AsString;
      end;

      if(permissaoTela = 1) AND not(qryPlanosNegocianr_dia_vencimento.IsNull) then
      begin
         maxDate := DataSoma(dm.DataAtual,qryPlanosNegocianr_dia_vencimento.AsInteger);
      end;


      if(qryPlanosNegociavl_min_parcela.AsFloat > 0) then
      begin

         //Calculo para ver o numero maximo de parcelas que respeite o minimo
         valorTotalRestante := (qyNegociaValTotal.AsCurrency - entrada);

         nrParcelasMinimo := 1;
         while (valorTotalRestante / nrParcelasMinimo) > qryPlanosNegociavl_min_parcela.AsFloat do
         begin
            inc(nrParcelasMinimo);
         end;

         //Compensa n ter o 0
         dec(nrParcelasMinimo);
         
         //Se o nr com base no valor é menor seta ele
         if(nr_max_parcelas > nrParcelasMinimo) then
         begin
            nr_max_parcelas := nrParcelasMinimo;
         end;
      end;
   end;

   //Atribui valores setados acima para a tela
   qyNegociavl_entrada.AsCurrency := entrada;
   cbJuros.ItemIndex := indexJuros;
   txtJuros.Text := valorJuros;
   umdtApartir.setMaxDate(maxDate);
   edMulta.setValor(valorMulta);

   //Atualiza o valor de juros
   Self.atualizaJurosComMulta();

   if(txtParcelas.Value > nr_max_parcelas) then
   begin
      txtParcelas.Value := nr_max_parcelas;
   end;
   txtParcelas.MaxValue := nr_max_parcelas;

   //Se for 0 marca todas, caso não marca vencidas (também vale pra manual)
   if(qryPlanosNegocianr_situacao_titulo.AsInteger = 0) then
   begin
      sbMarcarClick(nil);
   end else begin
      sbMarcarVencidasClick( nil );
   end;
end;

function TfrmNegociacao.getIsSelecionadoPlano: Boolean;
begin
   //Tela em modo de plano, ja carregou a combo, não ta no "manualmente"
    result := (
       (permissaoTela IN [1,2]) AND
       (cbRegras.Items.Count > 0) AND
       (TItemCombo(cbRegras.Items.Objects[cbRegras.ItemIndex]).getCodigo() <> '-1')
    );
end;

procedure TfrmNegociacao.grdAtuaisClick(Sender: TObject);
var
   PG: TPoint;
   GC: TGridCoord;
begin
   PG := grdAtuais.ScreenToClient(Mouse.CursorPos);
   GC := grdAtuais.MouseCoord( PG.X, PG.Y ) ;


   //0 coluna - selecioanr
   if (GC.X = 0) AND (rowSelecionada = false) then
   begin
      rowSelecionada := true;
      checaParcelaAtual(GC.Y);
      
      if((grdAtuais.Row + 1) = grdAtuais.RowCount) then
      begin
         grdAtuais.Row := grdAtuais.Row - 1;
      end else begin
         grdAtuais.Row := grdAtuais.Row + 1;
      end;
      grdAtuais.Row := GC.Y;
      rowSelecionada := false;
   end;
end;


procedure TfrmNegociacao.grdAtuaisDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);  
var
  DrawRect: TRect;
  cor: Integer;
  X: Integer;
  Txt : String;
  valor : Currency;
begin
   if (ACol = 0) AND (ARow <> 0) then
   begin
      grdAtuais.Canvas.FillRect(Rect);
      
      if (gdFocused in State) then
      begin
         DrawRect.Left := Rect.Left + 1;
      end
      else
      begin
         DrawRect.Left := Rect.Left + 2;
      end;

      DrawRect.Right := Rect.Right - 2;
      DrawRect.Top := Rect.Top + 2;
      DrawRect.Bottom := Rect.Bottom - 2;

      DrawFrameControl(
         grdAtuais.Canvas.Handle,
         DrawRect,
         DFC_BUTTON,
         ISChecked[ASelList.Values[  grdAtuais.Cells[8,ARow] ] = '1' ]
      );
   end;

   if (ARow > 0) AND (ACol > 0) then
   begin

      txt := grdAtuais.Cells[ACol, ARow];
      grdAtuais.Canvas.FillRect(Rect);

      //Está com plano selecionado e não é do mesmo titulo
      if desselecionarParcelaPorRegra(ARow) then
      begin
         grdAtuais.Canvas.Font.Color := clRed;
      end;

      If (ACol in [3])  then
      begin
         Rect.Right := Rect.Right -2; // Espaçamento para texto não grudar na borda do grid
         Rect.Top := Rect.Top + 2;
         DrawText(grdAtuais.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_RIGHT);
      end;

      if (ACol <> 3) then
      begin
         Rect.Left := Rect.Left +2;
         Rect.Top := Rect.Top +2;
         DrawText(grdAtuais.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_LEFT);
      end;
   end;
end;

procedure TfrmNegociacao.grdDefineTamanho;
begin

  // Parcela
  grdNovas.ColWidths[0] := 30;
  grdNovas.Cells[0,0]   := 'Par';

  grdTotais.ColWidths[0] := 30;

  // Data de Vencimento
  grdNovas.ColWidths[1] := 68;
  grdNovas.Cells[1,0]   := 'Venc.';

  grdTotais.ColWidths[1] := 68;

  // Valor Bruto
  grdNovas.ColWidths[2] := 65;
  grdNovas.Cells[2,0]   := 'Vl.Bruto';

  grdTotais.ColWidths[2] := 65;

  // Valor Acréscimos
  grdNovas.ColWidths[3] := 65;
  grdNovas.Cells[3,0]   := 'Vl.Acres.';

  grdTotais.ColWidths[3] := 65;

  // Valor Desconto
  grdNovas.ColWidths[4] := 65;
  grdNovas.Cells[4,0]   := 'Vl.Desc.';

  grdTotais.ColWidths[4] := 65;

  // Valor Líquido
  grdNovas.ColWidths[5] := 65;
  grdNovas.Cells[5,0]   := 'Vl.Liq.';

  grdTotais.ColWidths[5] := 65;

end;

procedure TfrmNegociacao.grdNovasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
 X: Integer;
 Txt : String;
 valor : Currency;
begin
   txt := grdNovas.Cells[ACol, ARow];

   If ACol in [2, 3, 4, 5]  then
   begin
      if ARow > 0 then
      begin
         try
            if txt = '' then
            begin
              txt := '0,00';
            end
            else
            begin
               valor := StrToCurr(txt);
               txt := FloatToStrF(valor, ffFixed, 12, 2);
            end;
         except
            txt := '0,00';
         end;
      end;

      grdNovas.Canvas.FillRect(Rect);
      Rect.Right := Rect.Right -2; // Espaçamento para texto não grudar na borda do grid
      Rect.Top := Rect.Top + 2;
      DrawText(grdNovas.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_RIGHT);

  end
  else
  begin
      // texto centrado

      X := Rect.Left + ((Rect.Right - Rect.Left) - grdNovas.Canvas.TextWidth(txt)) div 2;

      grdNovas.Canvas.TextRect(Rect, X, Rect.Top+2, txt);
  end;

  if gdFocused in State then begin

     grdNovas.Canvas.DrawFocusRect(Rect);

  end;

  if ((alterarJuros = True) AND ((ACol = 3))) OR
     ((alterarDesconto = True) AND ((ACol = 4))) then
  begin

     with TStringGrid(Sender) do
     begin
        //paint the background Green
        Canvas.Brush.Color := clBtnFace;
        Rect.Right := Rect.Right +1;
        Rect.Top := Rect.Top -1;
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left+1,Rect.Top+1,Cells[ACol, ARow]);
     end;

  end;
 
end;

procedure TfrmNegociacao.grdNovasGetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
   if (ARow >= 1) AND (ACol = 1) then begin

      Value := '99/99/9999';
   
   end;
end;

procedure TfrmNegociacao.grdNovasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   mudouValorGrid := true;
   if ((grdNovas.Col = 3)) then
   begin

      if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
      begin
         if key = VK_DELETE then
         begin
            Key := 0;
            Exit;
         end;
         
      end;

   end;

   if ((grdNovas.Col = 4)) then
   begin

      if not DM.UsuarioLogado.TemPermissao( 2117, npAlterar, False ) then
      begin
         if key = VK_DELETE then
         begin
            Key := 0;
            Exit;
         end;
         
      end;

   end;

end;

procedure TfrmNegociacao.grdNovasKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['/','0'..'9', ',',#8,#13]) then
   begin
       Key := #0;
       Exit;
   end;

   if (grdNovas.Col = 3) then
   begin

      if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
      begin
         Key := #0;
         Exit;
      end;

   end;

   if (grdNovas.Col = 4) then
   begin

      if not DM.UsuarioLogado.TemPermissao( 2117, npAlterar, False ) then
      begin
         Key := #0;
         Exit;
      end;

   end;
end;

procedure TfrmNegociacao.grdNovasSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   { Colunas que não podem ser editadas }
   if ACol in [0, 5]  then
      grdNovas.Options := grdNovas.Options - [goEditing]
   else
      { As demais colunas podem ser editadas - valor, multa e juros }
      grdNovas.Options := grdNovas.Options + [goEditing];

   if (linAnt >= 1) AND (recarregaGrid) then
   begin
      // Alterar o valor da linha
      CanSelect := TotalizaLinha(linAnt);
   end;

   if CanSelect then
   begin
      linAnt := ARow;
      colAnt := ACol;
   end;

   if ((alterarJuros = True) AND (ACol = 3)) OR
      ((alterarDesconto = true) AND (ACol = 4)) then
   begin
      CanSelect := False;
   end;
end;

procedure TfrmNegociacao.grdNovasSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
begin

   if ARow >= 1 then begin

       // Colocar os valores digitados dentro dos arrays apropriados
       case ACol of
          1 : begin

              try
                  ArrayDatas[ARow - 1] := StrToDate(Value);
              except
                  ArrayDatas[ARow - 1] := 0;
              end;

          end;

          2 : begin
              if value <> '' then begin
                 ArrayCalculados[ARow - 1] := StrToFloat(value);
              end else begin
                 ArrayCalculados[ARow - 1] := 0;
              end;
          end;

          3 : begin
              if value <> '' then begin
                 ArrayJurosNovas[ARow - 1] := StrToFloat(value);
              end else begin
                 ArrayJurosNovas[ARow - 1] := 0;
              end;

          end;
          4 : begin

              if value <> '' then begin
                 ArrayDescontosNovas[ARow - 1] := StrToFloat(value);
              end else begin
                 ArrayDescontosNovas[ARow - 1] := 0;
              end;
          end;
       end;
   end;
end;

procedure TfrmNegociacao.grdTotaisDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   X       : Integer;
   Txt     : String;
   valor   : Currency;
   corSelecionada : Integer;
   hint : String;
begin
  valor  := 0;
  txt    := grdTotais.Cells[ACol, ARow];

  grdTotais.Canvas.Brush.Color:= clBtnFace;
  grdTotais.Canvas.Font.Color:= clWindowText;

  If ACol in [2, 3, 4, 5]  then begin

     try
        if txt = '' then begin
           txt := '0,00';
        end else begin
           valor := StrToFloat(txt);
           txt := FloatToStrF(valor, ffFixed, 12, 2);
        end;
     except
        txt := '0,00';
     end;

     grdTotais.Canvas.FillRect(Rect);

     // Padrão
     corSelecionada := clWindowText;
     hint := '';

     // Valor Bruto
     if (ACol = 2) then
     begin
         if (valor > RoundFloat(qyNegociavl_bruto_negocia.AsCurrency,2)) then
         begin
            corSelecionada := clGreen;
            hint := 'Diferença de ' + FloatTostrF(valor - qyNegociavl_bruto_negocia.AsCurrency, ffFixed, 12, 2);
         end;

         if (valor < qyNegociavl_bruto_negocia.AsCurrency) then
         begin
            corSelecionada := clRed;
            hint := 'Diferença de ' + FloatTostrF(qyNegociavl_bruto_negocia.AsCurrency - valor, ffFixed, 12, 2);
         end;
     end;

     // Desconto
     if (ACol = 4) then
     begin
         if (valor > RoundFloat(qyNegociavl_desconto_negocia.AsCurrency,2)) then
         begin
            corSelecionada := clGreen;
            hint := 'Diferença de ' + FloatTostrF(valor - qyNegociavl_desconto_negocia.AsCurrency, ffFixed, 12, 2);
         end;

         if (valor < qyNegociavl_desconto_negocia.AsCurrency) then
         begin
            corSelecionada := clRed;
            hint := 'Diferença de ' + FloatTostrF(qyNegociavl_desconto_negocia.AsCurrency - valor, ffFixed, 12, 2);
         end;
     end;

     grdTotais.Canvas.Font.Color:= corSelecionada;
     grdTotais.Hint := hint;


     Rect.Right := Rect.Right -2; // Espaçamento para texto não grudar na borda do grid
     DrawText(grdTotais.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_RIGHT);


  end else begin

     // texto centrado

      X := Rect.Left + ((Rect.Right - Rect.Left) - grdTotais.Canvas.TextWidth(txt)) div 2;

      grdTotais.Canvas.TextRect(Rect, X, Rect.Top+2, txt);

  end;

  if gdFocused in State then begin

     grdTotais.Canvas.DrawFocusRect(Rect);

  end;

end;

procedure TfrmNegociacao.habilitaCampos;
var
   habilitar:boolean;
begin

   //Desativa os demais campos
   if permissaoTela in [0,1] then
   begin
      edPorcentagemDesc.Enabled := false;
      edValorDesc.Enabled := false;
      edPorcentagemDesc.Enabled := false;
      dbBruto.Enabled := false;
      dbEntrada.Enabled := false;
      ckbCorrige.Enabled := false;
      edJuros.Enabled := false;
      dbLiberarDescontos.enabled := false;
      sbMarcarVencidas.Enabled := false;
      sbMarcar.Enabled := false;
      sbDesmarcar.Enabled := false;
      grdAtuais.Enabled := false;
      
      cbData.Enabled := false;
      cbJuros.Enabled := false;
      cbTipoTitulos.Enabled := false;
      btnDesfazer.Enabled := false;
      grdNovas.Enabled := false;
      dbJurosNegociados.Enabled := false;
      dbLiquido.Enabled  := false;
      dbTotal.Enabled := false;
      txtJuros.Enabled := false;

      //Habilita os campos da direita quando o cara tem pelo menos permissão de plano
      habilitar := (permissaoTela > 0);
      txtParcelas.Enabled    := habilitar;
      umdtApartir.Enabled    := habilitar;

      dbOBS.Enabled          := habilitar;
      sb1X.Enabled           := habilitar;
      sb2X.Enabled           := habilitar;
      sb3X.Enabled           := habilitar;
      sb4X.Enabled           := habilitar;
      sb5X.Enabled           := habilitar;
      sb6X.Enabled           := habilitar;

      cbSimulacao.Enabled    := habilitar;
      btnSimular.Enabled     := habilitar;
      btnCalcular.Enabled    := habilitar;
      btnConfirmar.Enabled   := habilitar;

      //Turma não vem do plano
      cbTurma.Enabled        := not (permissaoTela = 0);
   end;
end;

procedure TfrmNegociacao.iniciaDescontos;
var
   i:integer;
   descontoInicial : Currency;
begin
   descontoInicial := 0;
   for i := 1 to (grdAtuais.RowCount - 1) do
   begin
      if ASelList.Values[ grdAtuais.Cells[8,i] ] = '1' then
      begin
         descontoInicial := descontoInicial + ArrayDescontos[i-1];
      end;
   end;

   edValorDesc.setValor(descontoInicial);
   edValorDescExit(self);
end;

procedure TfrmNegociacao.CalcularValoresSelecionados;
var
   n : Integer;
   SomaBruto, SomaJuros, SomaDescontos: Currency;
   ValorCredito, Creditos : Currency;
begin
   SomaBruto := 0;
   SomaJuros := 0;
   SomaCreditos := 0;
   SomaJurosNegociados := 0;
   SomaDescontos := 0;

   for n := 1 to (grdAtuais.RowCount - 1) do
   begin
      if ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
      Begin
        ArrayJuros[n-1] := ArrayJurosCalc[n-1];
        SomaBruto := SomaBruto + ArrayValores[n-1];
        SomaJuros := SomaJuros + ArrayJuros[n-1];
        SomaJurosNegociados := SomaJurosNegociados + ArrayJurosNominal[n-1];
        SomaCreditos := SomaCreditos + ArrayCreditosAtuais[n-1];
        SomaDescontos := SomaDescontos + ArrayDescontos[n-1];
      end;
   end;

   BrutoTotal := SomaBruto;
   qyNegociavl_bruto_negocia.AsCurrency := SomaBruto;
   qyNegociavl_juros_negocia.AsCurrency := SomaJuros;
   qyNegociavl_desconto_negocia.AsCurrency := SomaDescontos;

   if SomaCreditos > 0 then begin
      ValorCredito := SomaBruto / SomaCreditos;
      Creditos := SomaCreditos + (SomaJuros / ValorCredito);
   end
   else begin
      Creditos := 0;
   end;

   qyNegociavl_creditos.AsCurrency := Creditos;
end;

procedure TfrmNegociacao.carregaRegras;
begin
   qryPlanosNegocia.Close;
   qryPlanosNegocia.Open;

   cbRegras.Items.Clear;
   cbRegras.Items.Count;
   
   if (qryPlanosNegocia.Eof) then
   begin
      cbRegras.Enabled := false;
      if(permissaoTela = 1) then
      begin
         permissaoTela := 0;
      end;
      exit;
   end;

   //Se tem permissao para manual
   if permissaoTela = 2 then
   begin
      cbRegras.Items.AddObject(
         'Manualmente',
         TItemCombo.Create(
            '-1',
            'Manualmente'
         )
      );
   end;

   qyNegociaValTotal.AsCurrency;
   while not qryPlanosNegocia.Eof do
   begin
      if(qyNegociaValTotal.AsCurrency > qryPlanosNegociavl_max_divida.AsCurrency)then
      begin
         qryPlanosNegocia.Next;
         continue;
      end;

      if(qyNegociaValTotal.AsCurrency < qryPlanosNegociavl_min_divida.AsCurrency) then
      begin
         qryPlanosNegocia.Next;
         continue;      
      end;

      //Adiciona objeto a combo
      cbRegras.Items.AddObject(
         qryPlanosNegociads_desc_negocia.AsString,
         TItemCombo.Create(
            qryPlanosNegociacd_plano_negociacao.AsString,
            qryPlanosNegociads_desc_negocia.AsString
         )
      );

      qryPlanosNegocia.Next;
   end;

   if (cbRegras.Items.Count = 0) then
   begin
      cbRegras.Enabled := false;
      if(permissaoTela = 1) then
      begin
         permissaoTela := 0;
      end;
      exit;
   end;

   cbRegras.ItemIndex := 0;
   qryPlanosNegocia.First;
end;

procedure TfrmNegociacao.qyNegociaAfterPost(DataSet: TDataSet);
begin
  // Ao salvar a negociação, atualizar e posicionar no ultimo registro (novo) para pegar o código da negociação.  
  qyNegocia.Close();
  qyNegocia.Open();
  qyNegocia.Last();
end;

procedure TfrmNegociacao.qyNegociaAnteriorCalcFields(DataSet: TDataSet);
begin

   qyNegociaAnteriorValTotal.AsCurrency := qyNegociaAnteriorvl_bruto_negocia.AsCurrency + qyNegociaAnteriorvl_juros_negocia.AsCurrency - qyNegociaAnteriorvl_desconto_negocia.AsCurrency;
   qyNegociaAnteriorValLiquido.AsCurrency := qyNegociaAnteriorValTotal.AsCurrency - qyNegociaAnteriorvl_entrada.AsCurrency;

   qyNegociaAnteriorJurosNegociado.AsCurrency := SomaJurosNegociados;


end;

procedure TfrmNegociacao.qyNegociaBeforePost(DataSet: TDataSet);
begin
   // qyNegocia.ParamByName('CdNegocia').AsInteger := DM.ProximoId('cd_negocia', 'fin_negocia');
end;

procedure TfrmNegociacao.qyNegociaCalcFields(DataSet: TDataSet);
begin

   qyNegociaValTotal.AsCurrency := qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency - qyNegociavl_desconto_negocia.AsCurrency;
   qyNegociaValLiquido.AsCurrency := qyNegociaValTotal.AsCurrency - qyNegociavl_entrada.AsCurrency;

   qyNegociaJurosNegociado.AsCurrency := SomaJurosNegociados;
   //Juros visual
   qyNegociavl_juros_negocia_visual.AsCurrency := qyNegociavl_juros_negocia.AsCurrency - Self.valorMulta;

   DM.FindUserCodigo(qyNegociacd_usuario.AsInteger);
   qyNegociaNomeUsuario.AsString := DM.tblUsuariosNome2.AsString;

end;

procedure TfrmNegociacao.MarcarTodas(situ: boolean);
var
  i : integer;
  selecionado : string;
begin
  for i := 1 to (grdAtuais.RowCount - 1) do
  begin

    selecionado := '1';
    if not situ then
    begin
      selecionado := '0';
    end;

    //Verificação da regra
    if (selecionado = '1') AND (Self.desselecionarParcelaPorRegra(i)) then
    begin
      selecionado := '0';
    end;
    
    ASelList.Values[ grdAtuais.Cells[8,i] ] := selecionado;
  end;
end;

procedure TfrmNegociacao.MarcarVencidas();
var
  i : integer;
  selecionado : string;
begin

  for i := 1 to (grdAtuais.RowCount - 1) do
  begin
  
    selecionado := '1';
    if grdAtuais.Cells[9,i] <> 'VENC'then
    begin
      selecionado := '0';
    end;

    //Verificação da regra
    if (selecionado = '1') AND (Self.desselecionarParcelaPorRegra(i)) then
    begin
      selecionado := '0';
    end;

    ASelList.Values[ grdAtuais.Cells[8,i] ] := selecionado;
  end;
end;

procedure TfrmNegociacao.montaComboAtuais;
var
  i : integer;
begin
   //Zera informações dessa grid
   for i:= 1 to grdAtuais.RowCount -1 do
   begin
      if(i = 1) then
      begin
         continue;
      end;
      grdAtuais.Rows[i].Clear;
   end;
   grdAtuais.RowCount := 2;

   //Formata grid de parcelas
   grdAtuais.Cells[0, 0] := ' ';
   grdAtuais.Cells[1, 0] := 'Parc.';
   grdAtuais.Cells[2, 0] := 'Vencimento';
   grdAtuais.Cells[3, 0] := 'Vl. Corrigido';
   grdAtuais.Cells[4, 0] := 'Situação';
   grdAtuais.Cells[5, 0] := 'Responsável';
   grdAtuais.Cells[6, 0] := 'Turma';
   grdAtuais.Cells[7, 0] := 'Tipo de Título';

   grdAtuais.ColWidths[0] := 25;
   grdAtuais.ColWidths[1] := 27;
   grdAtuais.ColWidths[2] := 62;
   grdAtuais.ColWidths[3] := 75;
   grdAtuais.ColWidths[4] := 47;
   grdAtuais.ColWidths[5] := 180;
   grdAtuais.ColWidths[6] := 175;
   grdAtuais.ColWidths[7] := 205;

   //8 = Código da mensalidade, 9 = Situação
   grdAtuais.ColWidths[8] := -1;
   grdAtuais.ColWidths[9] := -1;
   grdAtuais.ColWidths[10] := -1;
   grdAtuais.ColWidths[11] := -1;
end;

procedure TfrmNegociacao.MontaCombos;
Var
   iCont : Integer;
begin
   // Montar Combo dos Tipos de Títulos
   qyAux.Close();

   qyAux.SQL.Text := Format(
      ' SELECT cd_tipo_titulo, ds_tipo_titulo, cd_conta, vl_padrao, nr_parcela FROM fin_config_tipos_titulo ' +
      ' WHERE ct_tipo_titulo = 1 AND sn_ativo = 1 AND cd_coligada_matriz = %d ORDER BY ds_tipo_titulo ', [DM.GetUsuarioLogado.GetColigadaLogada.Codigo]);

   qyAux.Open();

   SetLength(lstTipos, qyAux.RecordCount);
   SetLength(lstTiposContas, qyAux.RecordCount);
   SetLength(lstTiposParcelas, qyAux.RecordCount);

   qyAux.First;
   cbTipoTitulos.Clear;
   iCont := 0;

   while not qyAux.Eof do
   begin
      cbTipoTitulos.Items.Add(qyAux.FieldByName('ds_tipo_titulo').AsString);
      lstTipos[iCont] := qyAux.FieldByName('cd_tipo_titulo').AsInteger;
      lstTiposContas[iCont] := qyAux.FieldByName('cd_conta').AsInteger;
      lstTiposParcelas[iCont] := qyAux.FieldByName('nr_parcela').AsInteger;
      qyAux.Next;
      Inc(iCont);
   end;

   cbTipoTitulos.ItemIndex := -1;
   montaComboAtuais();
end;

procedure TfrmNegociacao.sbMarcarClick(Sender: TObject);
begin
   if(Sender <> nil) then
   begin
      Self.trocaParaManualmente();
   end;
   
   MarcarTodas(true);
   atualizarDadosParcelasAtuais()
end;

procedure TfrmNegociacao.sbDesmarcarClick(Sender: TObject);
begin
   if(Sender <> nil) then
   begin
      Self.trocaParaManualmente();
   end;

   MarcarTodas(false);
   atualizarDadosParcelasAtuais();
end;

procedure TfrmNegociacao.lstAtuaisClickCheck(Sender: TObject);
begin
   CalcularValoresSelecionados;
   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.btnCancelarClick(Sender: TObject);
begin
   qyNegocia.Cancel;
   qyNegocia.Close();
   if Self.FSlNegociacoes.Count > 0 then
      Self.ModalResult := mrOk
   else
      Self.ModalResult := mrCancel;
   CloseModal;
end;

procedure TfrmNegociacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmNegociacao.dbBrutoExit(Sender: TObject);
begin
   if qyNegociavl_bruto_negocia.AsCurrency <> (BrutoTotal) then
      if Mensagem('Você alterou o valor bruto a negociar. Embora o sistema permita este tipo de ajuste, é importante lembrar que este novo valor não representa o montante que o aluno deveria negociar. Deseja continuar mesmo assim?', 'Atenção', MB_YESNO + MB_ICONQUESTION ) <> mrYes then begin
          dbBruto.SetFocus();
          exit;
      end;
end;

procedure TfrmNegociacao.dbBrutoKeyPress(Sender: TObject; var Key: Char);
begin
   //Se for . transforma para virgula
   if(Key in['.']) then
   begin
      Key :=  ',';
   end;
   
   if Key = #13 then begin
      SelectNext(Sender As TWinControl, True, True);
      Key := #0;
   end;
end;

procedure TfrmNegociacao.dbEntradaChange(Sender: TObject);
begin
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.dbEntradaExit(Sender: TObject);
var
   entrada: double;
begin
   if (Self.getIsSelecionadoPlano()) then
   begin
      entrada := ((qyNegociaValTotal.AsCurrency * qryPlanosNegociavl_entrada_minima.AsCurrency) / 100);

      //Se mudou o valor para menos que o minimo do plano troca pra manualmente
      if(entrada > qyNegociavl_entrada.AsFloat) then
      begin
         trocaParaManualmente();
      end;
   end;
   
   atualizaDadosNovasParcelas();
end;

function TfrmNegociacao.desselecionarParcelaPorRegra(indice: Integer): Boolean;
var
  i: integer;
begin
    result := false;
   
   //Não tem regra selecionada, ja cai fora
   if not (Self.getIsSelecionadoPlano()) then
   begin
      exit;
   end;

   //Está com plano selecionado e não é do mesmo titulo
   if (listaTiposTitulo.Values[grdAtuais.Cells[11,indice]] = '') then
   begin
     result := true;
     exit;
   end;

    //Verifica se o plano é apenas para turmas especificas, caso sim vê se a turma atual esta na lista
    if(qryPlanosNegociasn_usar_todas_turmas.AsInteger = 0) then
    begin
      qryPlanosNegociaTurmas.Close;
      qryPlanosNegociaTurmas.ParamByName('cd_plano').AsInteger := qryPlanosNegociacd_plano_negociacao.AsInteger;
      qryPlanosNegociaTurmas.ParamByName('cd_turma').AsString := grdAtuais.Cells[6,indice];
      qryPlanosNegociaTurmas.Open;

      result := qryPlanosNegociaTurmas.IsEmpty;

      if(result) then
      begin
         exit;
      end;
    end;
end;

procedure TfrmNegociacao.dsNegociaDataChange(Sender: TObject; Field: TField);
begin
   edJuros.setValor(qyNegociavl_juros_negocia_visual.AsCurrency);
end;

procedure TfrmNegociacao.sb1XClick(Sender: TObject);
begin
   umdtApartir.setDate(DataHoje + 30);

   txtParcelas.Value := 1;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb2XClick(Sender: TObject);
begin
   atualizaMaxParcelas(2);

   txtParcelas.Value := 2;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb3XClick(Sender: TObject);
begin
   atualizaMaxParcelas(3);

   txtParcelas.Value := 3;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb4XClick(Sender: TObject);
begin
   atualizaMaxParcelas(4);
   
   txtParcelas.Value := 4;

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb5XClick(Sender: TObject);
begin
   atualizaMaxParcelas(5);

   txtParcelas.Value := 5;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb6XClick(Sender: TObject);
begin
   atualizaMaxParcelas(6);

   txtParcelas.Value := 6;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.trocaParaManualmente;
begin
   //Se ta com plano selecionado
   if(Self.getIsSelecionadoPlano()) then
   begin
      Self.trocaPlanoManual := true;
      cbRegras.ItemIndex := 0;
      Self.trocaPlanoManual := false;
      txtParcelas.MaxValue := 99;
   end;
end;

procedure TfrmNegociacao.txtJurosChange(Sender: TObject);
begin
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.txtJurosExit(Sender: TObject);
begin
   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.txtJurosKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      SelectNext(Sender As TWinControl, True, True);
      Key := #0;
   end;

   if key = '.' then begin
      key := ',';
   end;

   if not (Key in ['0'..'9',#8,',']) then begin
      Key := #0;
      exit;
   end;
end;

procedure TfrmNegociacao.sbMarcarNovasClick(Sender: TObject);
begin
//   MarcarTodas( lstNovas, True );
end;

procedure TfrmNegociacao.sbMarcarVencidasClick(Sender: TObject);
begin
   if(Sender <> nil) then
   begin
      Self.trocaParaManualmente();
   end;
   
   MarcarVencidas();
   atualizarDadosParcelasAtuais();
end;

procedure TfrmNegociacao.sbDesmarcarNovasClick(Sender: TObject);
begin
//   MarcarTodas( lstNovas, False );
end;

procedure TfrmNegociacao.sbExcluirClick(Sender: TObject);
var
   I: integer;
   LSNomeSimula: string;
begin

   if not DM.UsuarioLogado.TemPermissao(2017, npExcluir, true) then exit;   

   if cbSimulacao.ItemIndex <= 0 then begin
      Mensagem('Você precisa selecionar uma simulação para poder excluí-la.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      exit;
   end;

   if cbSimulacao.ItemIndex > 0  then begin

      if Mensagem('Tem certeza que deseja excluir a simulação selecionada?', 'UNIMESTRE', MB_YESNOCANCEL) = mrYes then begin
         qyAux.Close;
         qyAux.SQL.Text := ' SELECT cd_primeira_parc FROM fin_negocia_simula WHERE cd_simulacao = :cd_simulacao ';
         qyAux.ParamByName('cd_simulacao').AsInteger := ArraySimulacoes[cbSimulacao.ItemIndex - 1];
         qyAux.Open;

         DM.ExcluirParcela(qyAux.FieldByName('cd_primeira_parc').AsInteger);

         qyAux.Close();
         qyAux.SQL.Text := ' DELETE FROM fin_negocia_simula WHERE cd_simulacao = :cd_simulacao ';
         qyAux.ParamByName('cd_simulacao').AsInteger := ArraySimulacoes[cbSimulacao.ItemIndex - 1];
         qyAux.ExecSQL();

         LSNomeSimula := cbSimulacao.Items.Strings[cbSimulacao.ItemIndex];
         LSNomeSimula := Copy(LSNomeSimula, 1, AnsiPos(' - Válida até: ', LSNomeSimula) - 1);
         Self.FSlNegociacoes.Sort;
         if Self.FSlNegociacoes.Find(LSNomeSimula, I) then
            Self.FSlNegociacoes.Delete(I);

         DM.setLog(2017, 'Exclusao', Format('%d', [Self.FICodigoAluno]),
            DM.getColigadaByTurma(ArrayTurmas[cbTurma.ItemIndex], ArrayAnoSemestre[cbTurma.ItemIndex]), cbSimulacao.Text);

         CarregarSimulacoes();
      end;

   end;

end;

procedure TfrmNegociacao.ZerarArrayCalculados;
var
   n : Integer;
begin
   For n:= 0 to 99 do begin
       ArrayCalculados[n] := 0;
       ArrayJurosNovas[n] := 0;
       ArrayDescontosNovas[n] := 0;
       ArrayParcelasNovas[n] := 0;
   end;
end;

procedure TfrmNegociacao.txtParcelasChange(Sender: TObject);
begin
   atualizaMaxParcelas(txtParcelas.Value );

   btnCalcularClick(nil);
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.umdtApartirChangeDate(Sender: TObject);
begin
   if ckbCorrige.Checked then begin
      AtualizarJuros();
   end;

   btnCalcularClick( nil );
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.btnConfirmarClick(Sender: TObject);
const
   SQL_VALIDA_MENSALIDADES_INALTERADAS = 
      '   SELECT '+
      '      situacao, '+
	   '      cd_mensalidade '+
      '   FROM '+
      '      mensalidades '+
      '   WHERE '+
      '      cd_mensalidade IN (%s) ';
var
  x,i,n               : Integer;
  strParcelasNovas   : TStringList;
  strCalculados      : TStringList;
  strCodParcelas     : TStringList;
  strDataInicial     : TStringList;
  strTodasTurmas     : TStringList;
  strJuros           : TStringList;
  ParcelasNegociadas : Integer;
  cd_turma           : string;
  strJurosNovas      : Tstringlist;
  strDescontosNovas  : Tstringlist;
  strCreditosNovas   : Tstringlist;
  strDescontos       : TStringList;
  strArrParcelas     : TStringList;
  iParcelas          : Integer;
  strDatas           : TStringList;
  bGerarPrimeiraParc : Boolean;
  cd_simulacao       : Integer;
  somaDesconto       : Currency;
  somaVerificaoDescontos : Currency;
  TotalBruto: Currency;

   separador,
   sCodigoParcelasIN,
   strParcelas: String;

   qyValidaMensalidadesInalteradas: TUMZReadOnlyQuery;
begin

   for I := 1 to grdNovas.RowCount-1 do
   begin
      if ((grdNovas.Cells[1,i] = '') or (grdNovas.Cells[1,i] = '  /  /    ')) then
      begin
         Mensagem('Por favor informe uma data de vencimento ');
         exit;
      end;
   end;

   if descontoNegativo then
   begin
      Mensagem('O valor de desconto informado é maior que o valor de desconto total da negociação, favor ajusta-lo.');
      exit;
   end;
   

  bGerarPrimeiraParc := true;

  if not DM.UsuarioLogado.TemPermissao( 2017, npIncluir, True ) then exit;

  cd_turma := ArrayTurmas[cbTurma.ItemIndex];

  strParcelasNovas  := TStringList.Create;
  strCalculados     := TStringList.Create;
  strDataInicial    := TStringList.Create;
  strTodasTurmas    := TStringList.Create;
  strDescontosNovas := Tstringlist.Create;
  strCreditosNovas  := Tstringlist.Create;
  strJurosNovas     := TStringList.Create;
  strDescontos      := TStringList.Create;
  strCodParcelas    := TStringList.Create;
  strJuros          := TStringList.Create;
  strArrParcelas    := TStringList.Create;
  strDatas          := TStringList.Create;
  iParcelas         := 0;
  somaDesconto      := 0;   

   for x := 0 to grdNovas.RowCount - 2 do
   begin
      Inc(iParcelas);
      strParcelasNovas.Add(IntToStr(ArrayParcelasNovas[x]));
      strCalculados.Add(CurrToStr(ArrayCalculados[x]));
      strDescontosNovas.Add( CurrToStr( ArrayDescontosNovas[x] ) );
      somaDesconto := somaDesconto + ArrayDescontosNovas[x];
      strJurosNovas.Add( CurrToStr(ArrayJurosNovas[x]));
      strCreditosNovas.Add(CurrToStr(ArrayCreditosNovas[x]));
      strDatas.Add(DateTimeToStr(ArrayDatas[x]));
   end;

   separador := '';
   sCodigoParcelasIN := '';

   for I := 1 to (grdAtuais.RowCount - 1) do
   begin
      if( ASelList.Values[ grdAtuais.Cells[8,i] ] = '1' ) then
      begin
         Inc(ParcelasNegociadas);
         strDescontos.add(CurrToStr(arraydescontos[i-1]));
         strJuros.Add(CurrToStr(ArrayJuros[i-1]));
         strTodasTurmas.Add(ArrayTodasTurmas[i-1]);
         strCodParcelas.Add(IntToStr(ArrayCodParcelas[i-1]));
         strArrParcelas.Add(inttostr(ArrayParcelas[i-1]));
         strDataInicial.add(DateToStr(ArrayDatasInicial[i-1]));

         sCodigoParcelasIN :=
            sCodigoParcelasIN +
            separador +
            inttostr(ArrayCodParcelas[i-1]);

         separador  := ', ';
      end;
   end;

   if sCodigoParcelasIN <> '' then
   begin
      DM.CriarConsulta(qyValidaMensalidadesInalteradas);

      qyValidaMensalidadesInalteradas.SQL.Text := Format(SQL_VALIDA_MENSALIDADES_INALTERADAS, [sCodigoParcelasIN]);
      qyValidaMensalidadesInalteradas.Open;

      while not qyValidaMensalidadesInalteradas.Eof do
      begin
         if slConfirmaMensalidadesInalteradas.Values[qyValidaMensalidadesInalteradas.FieldByName('cd_mensalidade').AsString] <> qyValidaMensalidadesInalteradas.FieldByName('situacao').AsString then
         begin
            Mensagem(
               'A mensalidade de código ' +
               qyValidaMensalidadesInalteradas.FieldByName('cd_mensalidade').AsString +
               ' foi alterada por outra área do sistema e não será possível concluir a negociação.',
               Application.Title,
               MB_OK + MB_ICONWARNING
            );

            Exit;
         end;

         qyValidaMensalidadesInalteradas.Next;
      end;
   end;

   if(cbTipoTitulos.ItemIndex = -1)then
   begin
      Mensagem('Você precisa selecionar um tipo de título para essa negociação.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   //Verificação de total bruto
   for x := 0 to strParcelasNovas.Count - 1 do
   begin
       strParcelas := strParcelas + strParcelasNovas[x] + ', ';
       TotalBruto := TotalBruto + StrToCurr(strCalculados[x]);
   end;

   if RoundFloat(TotalBruto,2) <> RoundFloat(qyNegociavl_bruto_negocia.AsCurrency,2) then
   begin
      Mensagem('A soma das parcelas negociadas difere do valor total bruto original. Você deve corrigir o valor das parcelas antes de confirmar.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if(brutoNegativo) then
   begin
      Mensagem('Existem parcelas com valores brutos zerados e/ou negativos. Você deve corrigir o valor destas antes de confirmar.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   // Verificação de descontos
   for n := 1 to grdNovas.RowCount - 1 do
   begin
      somaVerificaoDescontos := somaVerificaoDescontos + ArrayDescontosNovas[n-1];
   end;

   if(somaVerificaoDescontos <> qyNegociavl_desconto_negocia.AsCurrency) then
   begin
      Mensagem('A soma dos descontos negociados difere do valor total de desconto original. Você deve corrigir o valor das parcelas antes de confirmar.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      Exit;
   end;
   

  if Mensagem( 'Deseja confirmar a negociação ?', Application.Title, MB_YESNO + MB_ICONQUESTION ) = ID_YES then
  begin


    if (cbSimulacao.ItemIndex > 0) and ( DM.variavel_nu_parametro( 'UMFinanceiro.Financeiro.Negocia.PreAcordo' , 0 ) = '1' ) then begin
      qyNegociacd_simulacao.AsInteger := ArraySimulacoes[cbSimulacao.ItemIndex - 1];
      bGerarPrimeiraParc := false;
      cd_simulacao := ArraySimulacoes[cbSimulacao.ItemIndex - 1];
    end;

    qyNegocia.Post();

    DM.gerarNegociacao(
                      umdtApartir.getDate,
                      lstTipos[cbTipoTitulos.ItemIndex],
                      strCalculados,
                      qyNegociavl_bruto_negocia.AsCurrency,
                      strParcelasNovas,
                      strCodParcelas,
                      strDataInicial,
                      ParcelasNegociadas,
                      Self.FICodigoAluno,
                      qyNegociacd_negocia.AsInteger,
                      strTodasTurmas,
                      strJuros,
                      strDescontos,
                      cd_turma,
                      lstTiposContas[cbTipoTitulos.ItemIndex],
                      ArrayAnoSemestre[cbTurma.ItemIndex],
                      strJurosNovas,
                      strDescontosNovas,
                      strCreditosNovas,
                      strArrParcelas,
                      iParcelas,
                      strDatas,
                      bGerarPrimeiraParc,
                      cd_simulacao,
                      dbLiberarDescontos.checked
                    );

    Mensagem( 'Parcelas negociadas com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
    Self.ModalResult := mrOk;
    frmMensalidades.Filtra();
    CloseModal;
  end;
end;

procedure TfrmNegociacao.btnNegociacaoClick(Sender: TObject);
var
  sFiltro : string;
  sFiltroShow : String;
  slFormulas: TStringList;
  sNomeRelatorio: String;
   PodeExportar: Boolean;
   infoRelatorio: ClasseRegistros;
begin
   //
   sFiltro := '{fin_negocia.cd_negocia} = ' + qyNegociaAnteriorcd_negocia.AsString;

   sFiltroShow := sFiltroShow + '"CÓD. NEGOCIAÇÃO = ' + qyNegociaAnteriorcd_negocia.AsString + '" ';

   slFormulas := TStringList.Create();
   slFormulas.Add('ds_filtro=' + sFiltroShow);

   infoRelatorio := PrincipalForm.GetInfoRpt('repContratoNegociacao');

   sNomeRelatorio := infoRelatorio.Campo['nm_arquivo']+'.rpt';

   PodeExportar := True;
   if infoRelatorio.Campo['sn_pode_exportar'] = 0 then
      PodeExportar := False;

   PrincipalForm.ImprimeRpt(Self, sNomeRelatorio, -1, sFiltro, '', slFormulas, nil, nil, nil, True, False, nil, PodeExportar);
end;

procedure TfrmNegociacao.Button1Click(Sender: TObject);
var
   qLer : TUMZQuery;
   BS : TBlobStream;
begin
   Dm.CriarConsulta(qLer);

   qLer.Close();
   qLer.SQL.Clear();
   qLer.SQL.Text :=
     ' SELECT cd_simulacao, me_negocia ' +
     '   FROM fin_negocia_simula ' +
     '  WHERE cd_simulacao = 811';
   qLer.Open();

   BS := TBlobStream.Create((qLer.FieldByName('me_negocia') as TBlobField), bmRead);


   BS.ReadComponent(grdNovas);

   FreeAndNil(BS);
   FreeAndNil(qLer);
end;

function TfrmNegociacao.TotalizaLinha(Linha: Integer): Boolean;
Var
   n,i: integer;
   Bruto,
   Acrescimo,
   Desconto,
   Liquido,
   cBrutoOrigem,
   cJurosOrigem,
   cDescontoOrigem,
   cDiferencaJuros,
   valorLinha,
   valorLinhaDesconto,
   valorLinhaJuros,
   cDiferencaDescontos: Currency;
   naoMudaBruto : Boolean;
begin

   if(mudouValorGrid = false) then
   begin
      result := true;
      exit;
   end;


   grdNovas.Cells[5, Linha] := formataValorString(ArrayCalculados[Linha - 1] - ArrayDescontosNovas[Linha - 1] + ArrayJurosNovas[Linha - 1]);

   {Atualiza parcelas abaixo}
   Bruto := 0;
   Acrescimo := 0;
   Desconto := 0;
   Liquido := 0;
   descontoNegativo := false;
   brutoNegativo := false;

   for n := 1 to grdNovas.RowCount - 1 do
   begin

      //Linhas acima da atual, mantem os valores e soma
      if (n <= (linha))  then
      begin
         Bruto := Bruto + ArrayCalculados[n-1];
         Acrescimo := Acrescimo + ArrayJurosNovas[n-1];
         Desconto := Desconto + ArrayDescontosNovas[n-1];

         continue;
      end;

      if n > (linha) then
      begin

         valorLinha := formataValorCurrency(((qyNegociavl_bruto_negocia.AsCurrency - Bruto) / ((grdNovas.RowCount - 1) - (n - 1))));
         valorLinhaDesconto := formataValorCurrency(((qyNegociavl_desconto_negocia.AsCurrency - Desconto) / ((grdNovas.RowCount - 1) - (n - 1))));
         valorLinhaJuros  := formataValorCurrency(((totalJuros - Acrescimo) / ((grdNovas.RowCount - 1) - (n - 1))));

         //Se o desconto for negativo salva numa flag para avisar ao usuario no fim, e deixa 0 na grid
         if(valorLinhaDesconto < 0) then
         begin
            valorLinhaDesconto := 0;
            descontoNegativo := true;
         end;

         if(valorLinhaJuros < 0) then
         begin
            valorLinhaJuros := 0;
         end;

         if(valorLinha <= 0) then
         begin
            brutoNegativo := true;
         end;

         //Verifica se houve mudanças
         if(naoMudaBruto) then
         begin
            valorLinha := ArrayCalculados[n-1];
         end;


         Bruto := Bruto + valorLinha;
         Desconto := Desconto + valorLinhaDesconto;
         Acrescimo := Acrescimo + valorLinhaJuros;
         
         grdNovas.Cols[2][n] := formataValorString(valorLinha);
         grdNovas.Cols[3][n] := formataValorString(valorLinhaJuros);
         grdNovas.Cols[4][n] := formataValorString(valorLinhaDesconto);

         ArrayCalculados[n-1] := valorLinha;
         ArrayJurosNovas[n-1] := valorLinhaJuros;
         ArrayDescontosNovas[n-1] := valorLinhaDesconto;

         grdNovas.Cols[5][n] := formataValorString(valorLinha - valorLinhaDesconto + valorLinhaJuros);
      end;
   end;

   // Totalizar as colunas
   Bruto := 0;
   Acrescimo := 0;
   Desconto := 0;
   Liquido := 0;

   for n := 0 to grdNovas.RowCount - 2 do
   begin
      Bruto := Bruto + ArrayCalculados[n];
      Acrescimo := Acrescimo + ArrayJurosNovas[n];
      Desconto := Desconto + ArrayDescontosNovas[n];
      Liquido := Liquido + (ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]);
   end;

   grdTotais.Cells[0, 0] := 'TOT';
   grdTotais.Cells[1, 0] := ' = ';
   grdTotais.Cells[2, 0] := formataValorString(Bruto);
   grdTotais.Cells[3, 0] := formataValorString(Acrescimo);
   grdTotais.Cells[4, 0] := formataValorString(Desconto);
   grdTotais.Cells[5, 0] := formataValorString(Liquido);

   // Arrumar valores iniciais
   cJurosOrigem := 0;
   cDescontoOrigem := 0;
   cBrutoOrigem := 0;

   for n := 1 to (grdAtuais.RowCount - 1) do
   begin
      if ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
      begin
         cJurosOrigem := cJurosOrigem + ArrayJuros[n-1];
         cDescontoOrigem := cDescontoOrigem + ArrayDescontos[n-1];
         cBrutoOrigem := cBrutoOrigem + ArrayValores[n-1];
      End
   end;

   cDiferencaJuros := 0;
   cDiferencaDescontos := 0;
   i := 0;

   if cJurosOrigem <> Acrescimo then
   begin
      for n := 1 to (grdAtuais.RowCount - 1) do
      begin
         if ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
         begin
            if cJurosOrigem = 0 then
            begin
               ArrayJuros[n-1] := StrToFloat(FloatToStrF((( ArrayValores[n-1] / cBrutoOrigem ) * Acrescimo), ffFixed, 12, 2));
            end else begin
               ArrayJuros[n-1] := StrToFloat(FloatToStrF((( ArrayJuros[n-1] / cJurosOrigem ) * Acrescimo), ffFixed, 12, 2));
            end;
            cDiferencaJuros := cDiferencaJuros + ArrayJuros[n];
            i := n-1;
         end;
      end;
   end else begin
      cDiferencaJuros := Acrescimo;
   end;
    
   if (Acrescimo <> cDiferencaJuros) then begin
      ArrayJuros[i] := ArrayJuros[i] + (Acrescimo - cDiferencaJuros);
   end;

   // Reajustar os descontos na origem
   // Baseado no Valor da Soma dos Juros "cJurosSoma"
   // cJurosSoma = Soma dos Juros da Nova negociação
   if cDescontoOrigem <> Desconto then
   begin
      for n := 1 to (grdAtuais.RowCount - 1) do
      begin
         if  ASelList.Values[ grdAtuais.Cells[8,n] ] = '1' then
         begin
            if cDescontoOrigem = 0 then
            begin
               ArrayDescontos[n-1] := StrToFloat(FloatToStrF((( ArrayDescontos[n-1] / cBrutoOrigem ) * Desconto), ffFixed, 12, 2));
            end else begin
               ArrayDescontos[n-1] := StrToFloat(FloatToStrF((( ArrayDescontos[n-1] / cDescontoOrigem ) * Desconto), ffFixed, 12, 2));
            end;

            cDiferencaDescontos := cDiferencaDescontos + ArrayDescontos[n-1];
            i := n-1;
         end
      end;
   end else begin
      cDiferencaDescontos := Desconto;
   end;
    
   if (Desconto <> cDiferencaDescontos) then begin
      ArrayDescontos[i] := ArrayDescontos[i] + (Desconto - cDiferencaDescontos);
   end;

   mudouValorGrid := false;
   Result := True;
end;

procedure TfrmNegociacao.TransferirMensalidades(nListBox: Integer);
var
  wYear, wMonth, wDay : Word;
  iCodMensa : Integer;
begin
  { Verificar para qual turma a coisa vai ser negociada }


  Screen.Cursor := crHourGlass;
  DecodeDate( ArrayDatas[nListBox], wYear, wMonth, wDay );

  if cbTurma.ItemIndex < 0 then begin
     cbTurma.ItemIndex := 0;
  end;

  DM.tblDeptoCursoTurma.Close;
  DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := ArrayAnoSemestre[cbTurma.ItemIndex];
  DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := ArrayTurmas[cbTurma.ItemIndex];
  DM.tblDeptoCursoTurma.Open;

  iCodMensa := DM.GerarMensalidade(
    Self.FICodigoAluno,
    ArrayParcelasNovas[nListBox],
    ArrayTurmas[cbTurma.ItemIndex],
    ArrayCalculados[nListBox], ArrayJurosNovas[nListBox],
    ArrayAnoSemestre[cbTurma.ItemIndex],
    ArrayDatas[nListBox],
    ArrayDatas[nListBox], 2,
    DM.tblDeptoCursoTurmaCurso.AsString,
    DM.tblDeptoCursoTurmaDepto.AsInteger, 4, -1, ArrayDescontosNovas[nListBox], ArrayCreditosNovas[nListBox],
    'Parcela de Negociação', lstTipos[cbTipoTitulos.ItemIndex], lstTiposContas[cbTipoTitulos.ItemIndex], DM.tblDeptoCursoTurmacd_centro.AsInteger, 0
    ,0, 'N', 0, 0, 10, 0, 0, Dm.tblDeptoCursoTurmacd_coligada.AsInteger );

  // Registrar o movimento de contas a receber

  // Registrar na tabela fin_negocia_parc_atuais

  qyAux.SQL.Text :=
    ' INSERT INTO fin_negocia_parc_nova ( cd_negocia, cd_mensalidade ) ' +
    ' VALUES (' + qyNegociacd_negocia.AsString + ', ' + IntToStr(iCodMensa) + ') ';
  qyAux.ExecSQL();


  Screen.Cursor := crDefault;
end;


procedure TfrmNegociacao.PageControl1Change(Sender: TObject);
var
   sMarcar: String;
begin
   if (DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1' ) and ( cbSimulacao.Items.Count > 1 ) then
   begin
      PageControl1.ActivePageIndex := 0;
      Abort;
   end;

   if PageControl1.ActivePageIndex = 0 then begin

     // Criar um registro de Negociacao;

     qyNegocia.Close();
     qyNegocia.SQL.Text :=
       '  SELECT * from fin_negocia  '+
    '  WHERE cd_pessoa = :CdPessoa ORDER BY cd_negocia';   
    //   '  WHERE cd_pessoa = :CdPessoa AND cd_negocia = :CdNegocia ';

     qyNegocia.ParamByName('CdPessoa').AsInteger := Self.FICodigoAluno;
     // Tratamento de chave duplicada (pegar somente do autoincrement, quando salvar)
     // qyNegocia.ParamByName('CdNegocia').AsInteger := DM.ProximoId('cd_negocia', 'fin_negocia');
     qyNegocia.Open();

     qyNegocia.Insert;
     // Tratamento de chave duplicada (pegar somente do autoincrement, quando salvar)
     // qyNegocia.FieldByName('cd_negocia').AsInteger  := qyNegocia.ParamByName('CdNegocia').AsInteger;
     qyNegocia.FieldByName('cd_pessoa').AsInteger := Self.FICodigoAluno;
     qyNegocia.FieldByName('cd_usuario').AsInteger  := DM.iCdPessoaLogado;
     qyNegocia.FieldByName('dt_negocia').AsDateTime := Dm.DataAtual();
     qyNegocia.FieldByName('vl_entrada').AsCurrency := 0;

     //Marca sempre as vencidas
     sbMarcarVencidasClick( nil );
   end
   else begin
      qyNegociaAnterior.Close();
      qyNegociaAnterior.ParamByName('cd_pessoa').AsInteger := Self.FICodigoAluno;
      qyNegociaAnterior.Open();

      qyParcAtual.Close();
      qyParcAtual.Open();

      qyParcNovas.Close();
      qyParcNovas.Open();
   end;
end;

procedure TfrmNegociacao.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
var
   activePage : Integer;
begin
   activePage := 0;
   //Fizemos o tratamento pois o formulario pode ser chamado de locais diferentes
   try
      activePage := frmNegociacao.PageControl1.ActivePageIndex;
   except
      activePage := PageControl1.ActivePageIndex;
   end;

   if (activePage = 1) and (tblMensalidades.RecordCount = 0) then
   begin
      Mensagem('Não há títulos em aberto para esta pessoa.', 'Atenção', MB_OK+MB_ICONWARNING );
      AllowChange := false;
   end else begin
      AllowChange := true;
   end;

end;

procedure TfrmNegociacao.btnDesfazerClick(Sender: TObject);
begin
   if not DM.UsuarioLogado.TemPermissao( 2017, npExcluir, True ) then Exit;

   // Verificar se alguma parcela Nova já foi PAGA ou NEGOCIADA, então neste caso, não deixar desfazer


   qyAux.SQL.Text :=
     ' SELECT * FROM mensalidades INNER JOIN fin_negocia_parc_nova ON (mensalidades.cd_mensalidade = fin_negocia_parc_nova.cd_mensalidade) ' +
     ' WHERE  fin_negocia_parc_nova.cd_negocia = ' + qyNegociaAnteriorcd_negocia.AsString +
     ' AND mensalidades.situacao IN (0,1,3) AND mensalidades.tipoparcela = 4 ';
   qyAux.Open();

   if not qyAux.Eof then begin

     Mensagem('Atenção' + chr(13) + 'Não é possível desfazer esta negociação. Alguma parcela negociada já foi paga ou renegociada.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
     Exit;

   end;


   if Mensagem('Este procedimento irá excluir as novas parcelas criadas com a negociação e reativará as parcelas negociadas. Tem certeza que deseja continuar? ', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION) <> mrYes then Exit;

   if Mensagem('Após a conclusão deste processo, não será possível desfazê-lo. Confirma?', 'Atenção', MB_YESNOCANCEL + MB_ICONQUESTION ) <> mrYes then Exit;

   // Como primeiro passo, o sistema ira tentar estornar as quitações dos cheques.

   EstornarChequeNegociado();

   // Deletar amarracao de competencias
   qyAux.Close();

   qyAux.SQL.Text :=
     ' DELETE FROM FIN_NEGOCIA_COMPETENCIA WHERE ' +
     '    CD_MENSALIDADE_NOVA IN ( ' +
     '       SELECT ' +
     '          PC.CD_MENSALIDADE ' +
     '       FROM ' +
     '          MENSALIDADES M ' +
     '             JOIN FIN_NEGOCIA_PARC_NOVA PC ON ' +
     '                (M.CD_MENSALIDADE = PC.CD_MENSALIDADE) ' +
     '       WHERE ' +
     '          M.SITUACAO = 2 AND ' +
     '          M.TIPOPARCELA = 4 AND ' +
     '          PC.CD_NEGOCIA = ' + qyNegociaAnteriorcd_negocia.AsString + ')';
   qyAux.ExecSQL();

   // Excluir o fin_mov_cr das parcelas novas
   qyAux.Close();

   qyAux.SQL.Text :=
     ' DELETE FROM FIN_MOV_CR WHERE ' +
     '    CD_MENSALIDADE IN ( ' +
     '       SELECT ' +
     '          PC.CD_MENSALIDADE ' +
     '       FROM ' +
     '          MENSALIDADES M ' +
     '             JOIN FIN_NEGOCIA_PARC_NOVA PC ON ' +
     '                (M.CD_MENSALIDADE = PC.CD_MENSALIDADE) ' +
     '       WHERE ' +
     '          M.SITUACAO = 2 AND ' +
     '          M.TIPOPARCELA = 4 AND ' +
     '          PC.CD_NEGOCIA = ' + qyNegociaAnteriorcd_negocia.AsString + ')';
   qyAux.ExecSQL();

   // Excluir as parcelas Novas

   if qyAux.Connection.Protocol = 'oracle' then //Oracle
   begin
      // Deletar as ações de movimento de entrada das mensalidades novas
       qyAux.SQL.Text :=
         ' DELETE FROM MENSALIDADES WHERE ' +
         '    CD_MENSALIDADE IN ( ' +
         '       SELECT ' +
         '          PC.CD_MENSALIDADE ' +
         '       FROM ' +
         '          MENSALIDADES M ' +
         '             JOIN FIN_NEGOCIA_PARC_NOVA PC ON ' +
         '                (M.CD_MENSALIDADE = PC.CD_MENSALIDADE) ' +
         '       WHERE ' +
         '          M.SITUACAO = 2 AND ' +
         '          M.TIPOPARCELA = 4 AND ' +
         '          PC.CD_NEGOCIA = ' + qyNegociaAnteriorcd_negocia.AsString + ')';
       qyAux.ExecSQL();

   end else begin
      qyAux.SQL.Text :=
        ' DELETE M.* FROM ' +
        ' MENSALIDADES AS M INNER JOIN FIN_NEGOCIA_PARC_NOVA AS PC ON (M.CD_MENSALIDADE = PC.CD_MENSALIDADE) ' +
        ' WHERE M.SITUACAO = 2 AND M.TIPOPARCELA = 4 AND ' +
        '          PC.CD_NEGOCIA = ' + qyNegociaAnteriorcd_negocia.AsString;
      qyAux.ExecSQL();  
   end;

   // Deletar as ações de negociação das antigas
   //Verifica se a conexão é Oracle ou MySQL
   if qyAux.Connection.Protocol = 'oracle' then //Oracle
   begin
      qyAux.SQL.Text :=
        ' DELETE FROM FIN_MOV_CR CR ' +
        ' WHERE EXISTS ( ' +
        '   SELECT * FROM ' +
        '      MENSALIDADES M, ' +
        '      FIN_ACOES_MOVIMENTO MOV, ' +
        '      FIN_NEGOCIA_PARC_ATUAL NEG ' +
        '   WHERE ' +
        '      CR.CD_ACAO = MOV.CD_ACAO AND ' +
        '      CR.CD_MENSALIDADE = M.CD_MENSALIDADE AND ' +
        '      CR.CD_MENSALIDADE = NEG.CD_MENSALIDADE AND ' +
        '      NEG.CD_NEGOCIA = ' + qyNegociaAnteriorcd_negocia.AsString + ' AND ' +
        '      M.SITUACAO = 3 AND ' +
        '      MOV.CD_ACAO_AUTOMATICA = 12)';
      qyAux.ExecSQL();
   end else begin
      qyAux.SQL.Text :=
        ' DELETE c.* FROM' +
        ' fin_mov_cr as c ' +
        ' INNER JOIN fin_acoes_movimento as a ON (a.cd_acao = c.cd_acao ) ' +
        ' INNER JOIN mensalidades as m ON (m.cd_mensalidade = c.cd_mensalidade ) ' +
        ' INNER JOIN fin_negocia_parc_atual as pa ON (m.cd_mensalidade = pa.cd_mensalidade ) ' +
        ' WHERE pa.cd_negocia = ' + qyNegociaAnteriorcd_negocia.AsString +
        ' AND m.situacao = 3 AND a.cd_acao_automatica = 12';
      qyAux.ExecSQL();
   end;

  //Verifica se a conexão é Oracle ou MySQL
  if qyAux.Connection.Protocol = 'oracle' then //Oracle
  begin
      qyAux.SQL.Text :=
        ' MERGE INTO mensalidades m USING ' +
        '    (SELECT ' +
        '       m.cd_mensalidade AS cd_mensalidade,  ' +
        '       m.valorjuros_fixo AS valorjuros_fixo ' +
        '     FROM ' +
        '       mensalidades m, ' +
        '       fin_negocia_parc_atual n ' +
        '     WHERE ' +
        '       m.cd_mensalidade = n.cd_mensalidade AND ' +
        '       n.cd_negocia = '+ qyNegociaAnteriorcd_negocia.AsString +' AND ' +
        '       m.situacao = 3) m2 ON (m.cd_mensalidade = m2.cd_mensalidade) ' +
        ' WHEN MATCHED THEN ' +
        '     UPDATE SET m.situacao = 2,     ' +
        '                m.valorpago = NULL, ' +
        '                m.datapagamento = NULL, ' +
        '                m.dt_credito = NULL, ' +
        '                m.valorjuros = m2.valorjuros_fixo ';
      qyAux.ExecSQL();
   end else begin
      qyAux.SQL.Text :=
        ' UPDATE mensalidades m, fin_negocia_parc_atual n ' +
        ' SET m.situacao = 2, m.valorpago = null, m.datapagamento = null, m.dt_credito = null,  valorjuros = valorjuros_fixo, valordesconto = valordesconto_fixo' +
        ' WHERE m.cd_mensalidade = n.cd_mensalidade AND ' +
        ' n.cd_negocia = ' + qyNegociaAnteriorcd_negocia.AsString +
        ' AND m.situacao = 3 ';
      qyAux.ExecSQL();
   end;

   qyAux.SQL.Text :=
     ' DELETE FROM fin_negocia_parc_nova ' +
     ' WHERE cd_negocia = ' + qyNegociaAnteriorcd_negocia.AsString;
   qyAux.ExecSQL();

   qyParcAtual.Close();
   qyParcAtual.Open();
   
   qyParcNovas.Close();
   qyParcNovas.Open();

   Mensagem('A negociação foi desfeita. Confira a planilha de mensalidades.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);

   montaComboAtuais();
   CarregarParcelasParaNegociar();
   frmMensalidades.Filtra();
end;

procedure TfrmNegociacao.SpeedButton2Click(Sender: TObject);
Var
   qSalva : TUMZQuery;
   i : Integer;
   sAux : String;
   x, y, cd_primeiro_parc : Integer;
   str : TStringList;
   PrimeiroRegistro : string;
   sNroDiasVenc : string;
begin



   if (not Calculou) then begin

      Mensagem('Para salvar uma simulação é necessário primeiro atualizar o cálculo.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
      exit;

   end;

   Application.CreateForm(TfrmNegociacaoSimula, frmNegociacaoSimula);

   frmNegociacaoSimula.frmNegocia := Self;

   frmNegociacaoSimula.edDescricao.Text := dbOBS.Text;

   sNroDiasVenc := DM.variavel_nu_parametro( 'Financeiro.Negocia.NroDiasNegoc' , 0 );

   if ( sNroDiasVenc  = '') then
   begin
      frmNegociacaoSimula.umdtPrazo.setDate(Dm.DataAtual() + 5);
   end
   else
   begin
      frmNegociacaoSimula.umdtPrazo.setDate(ArrayDatas[0] + StrToInt(sNroDiasVenc));
      frmNegociacaoSimula.umdtPrazo.Enabled := False;
   end;

   if (frmNegociacaoSimula.ShowModal <> mrOK) then Exit;

   if (DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1' ) then
   begin
      if( cbTipoTitulos.ItemIndex <> -1 ) then
      begin
         DM.tblDeptoCursoTurma.Close;
         DM.tblDeptoCursoTurma.ParamByName('AnoSemestre').AsInteger := ArrayAnoSemestre[cbTurma.ItemIndex];
         DM.tblDeptoCursoTurma.ParamByName('Turma').AsString := ArrayTurmas[cbTurma.ItemIndex];
         DM.tblDeptoCursoTurma.Open;

         cd_primeiro_parc := DM.GerarMensalidade
         (
            Self.FICodigoAluno,
            ArrayParcelasNovas[0],
            ArrayTurmas[cbTurma.ItemIndex],
            ArrayCalculados[0],
            ArrayJurosNovas[0],
            ArrayAnoSemestre[cbTurma.ItemIndex],
            ArrayDatas[0],
            ArrayDatas[0],
            10,
            DM.tblDeptoCursoTurmaCurso.AsString,
            DM.tblDeptoCursoTurmaDepto.AsInteger,
            4,
            -1,
            ArrayDescontosNovas[0],
            ArrayCreditosNovas[0],
            'Parcela de Negociação',
            lstTipos[cbTipoTitulos.ItemIndex],
            lstTiposContas[cbTipoTitulos.ItemIndex],
            DM.tblDeptoCursoTurmacd_centro.AsInteger,
            0,
            0,
            'N',
            0,
            0,
            10,
            0,
            0,
            Dm.tblDeptoCursoTurmacd_coligada.AsInteger
         );
      end
      else
      begin
        Mensagem('Você precisa selecionar um tipo de título para essa negociação.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
        Exit;
      end;
   end;



   DM.CriarConsulta(qSalva);

   if qyAux.Connection.Protocol = 'oracle' then //Oracle
   begin
     qSalva.SQL.Text :=
       ' INSERT INTO fin_negocia_simula (cd_pessoa, ds_simulacao, lst_mensa_origem, vl_bruto, vl_juros, ' +
       '  vl_entrada, vl_creditos, dt_simulacao, nr_parcelas, dt_apartir_de, sn_dt_entrada, cd_usuario, dt_prazo, ds_taxa_juros, sn_taxa_simples, ds_turma_base, cd_tipo_titulo, sn_corrige, me_negocia, cd_primeira_parc, cd_situacao ) ' +
       ' VALUES (:cd_pessoa, :ds_simulacao, :lst_mensa_origem, :vl_bruto, :vl_juros, :vl_entrada, :vl_creditos, now(), :nr_parcelas, :dt_apartir_de, :sn_dt_entrada, :cd_usuario, :dt_prazo, ' +
       ' :ds_taxa_juros, :sn_taxa_simples, :ds_turma_base, :cd_tipo_titulo, :sn_corrige, RAWTOHEX(:me_negocia), :cd_primeira_parc, 0  )';
   end else begin
     qSalva.SQL.Text :=
       ' INSERT INTO fin_negocia_simula (cd_pessoa, ds_simulacao, lst_mensa_origem, vl_bruto, vl_juros,  ' +
       '  vl_entrada, vl_creditos, dt_simulacao, nr_parcelas, dt_apartir_de, sn_dt_entrada, cd_usuario, dt_prazo, ds_taxa_juros, sn_taxa_simples, ds_turma_base, cd_tipo_titulo, sn_corrige, me_negocia, cd_primeira_parc, cd_situacao ) ' +
       ' VALUES (:cd_pessoa, :ds_simulacao, :lst_mensa_origem, :vl_bruto, :vl_juros, :vl_entrada, :vl_creditos, now(), :nr_parcelas, :dt_apartir_de, :sn_dt_entrada, :cd_usuario, :dt_prazo, ' +
       ' :ds_taxa_juros, :sn_taxa_simples, :ds_turma_base, :cd_tipo_titulo, :sn_corrige, :me_negocia, :cd_primeira_parc, 0 )';
   end;


   qSalva.ParamByName('cd_pessoa').AsInteger     := Self.FICodigoAluno;
   qSalva.ParamByName('ds_simulacao').AsString   := frmNegociacaoSimula.edDescricao.Text;
   qSalva.ParamByName('vl_bruto').AsFloat        := qyNegociavl_bruto_negocia.AsCurrency;
   qSalva.ParamByName('vl_juros').AsFloat        := qyNegociavl_juros_negocia.AsCurrency;
   qSalva.ParamByName('vl_entrada').AsFloat      := qyNegociavl_entrada.AsCurrency;
   qSalva.ParamByName('vl_creditos').AsFloat     := qyNegociavl_creditos.AsCurrency;
   qSalva.ParamByName('nr_parcelas').AsInteger   := StrToInt(txtParcelas.Text);
   qSalva.ParamByName('dt_apartir_de').AsDate    := umdtApartir.getDate;
   qSalva.ParamByName('sn_dt_entrada').AsInteger  := cbData.ItemIndex;
   qSalva.ParamByName('dt_prazo').AsDate       := frmNegociacaoSimula.umdtPrazo.getDate;
   qSalva.ParamByName('cd_usuario').AsInteger    := DM.iCdPessoaLogado;
   qSalva.ParamByName('ds_taxa_juros').AsString  := txtJuros.Text;
   qSalva.ParamByName('ds_turma_base').AsString  := cbTurma.Text;
   qSalva.ParamByName('cd_tipo_titulo').AsInteger:= lstTipos[cbTipoTitulos.ItemIndex];
   qSalva.ParamByName('cd_primeira_parc').AsInteger := cd_primeiro_parc;
   if cbJuros.ItemIndex = 0 then begin
      qSalva.ParamByName('sn_taxa_simples').AsInteger := 1;
   end else begin
      qSalva.ParamByName('sn_taxa_simples').AsInteger := 0;
   end;

   if ckbCorrige.Checked then begin
      qSalva.ParamByName('sn_corrige').AsInteger := 1;
   end else begin
      qSalva.ParamByName('sn_corrige').AsInteger := 0;
   end;

   sAux := '';
   for i := 1 to (grdAtuais.RowCount - 1) do
   begin
      if ASelList.Values[ grdAtuais.Cells[8,i] ] = '1' then
      begin
        sAux := sAux + IntToStr(ArrayCodParcelas[i-1]);
        sAux := sAux + ',';
      end;
   end;

   if Length(sAux) >=2 then begin
      sAux := Copy(sAux, 1, length(sAux)-1);
   end;

   qSalva.ParamByName('lst_mensa_origem').AsString := sAux;

   str := TStringList.Create();

   str.Add(IntToStr(grdNovas.RowCount));

   For X:=0 to grdNovas.colcount-1 do
      For y:=0 to grdNovas.rowcount-1 do
        str.Add((grdNovas.cells[x,y]));

   qSalva.ParamByName('me_negocia').AsString := str.Text;

   qSalva.ExecSQL();

   FreeAndNil(str);

{   i := DM.LastInsert();

   qSalva.Close();
   qSalva.SQL.Clear();
   qSalva.RequestLive := true;
   qSalva.SQL.Text :=
     ' SELECT cd_simulacao, me_negocia ' +
     '   FROM fin_negocia_simula ' +
     '  WHERE cd_simulacao = ' + IntToStr(i);
   qSalva.Open();
   qSalva.Edit;
}
   Self.FSlNegociacoes.Add(frmNegociacaoSimula.edDescricao.Text);
   FreeAndNil(frmNegociacaoSimula);

   CarregarSimulacoes();
   if (DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1') then
   begin
     Self.ModalResult := mrOk;
     CloseModal;
   end
   else
   begin
     if Mensagem('Simulação gravada com sucesso!' + CHR(13) + CHR(13) + 'Deseja efetuar outra simulação para o mesmo aluno?', 'UNIMESTRE', MB_YESNO + MB_ICONQUESTION) <> mrYES then
     begin
        Self.ModalResult := mrOk;
        CloseModal;
     end;
   end;


end;

procedure TfrmNegociacao.SpeedButton3Click(Sender: TObject);
Var
   qSimula : TUMZQuery;
   i, n : Integer;
   sMensa : String;
   slMensa : TStringList;

   iCombo : Integer;

   temp,x,y:integer;
   tempstr:string;
   str : TStringList;
   somaDescontos : Currency;
begin

   if cbSimulacao.ItemIndex > 0 then begin

       somaDescontos := 0;

       iCombo := cbSimulacao.ItemIndex;

       DM.CriarConsulta(qSimula);

       qSimula.Close();
       qSimula.SQL.Text :=
         ' SELECT * FROM fin_negocia_simula WHERE cd_simulacao = :cd_simulacao ';
       qSimula.ParamByName('cd_simulacao').AsInteger := ArraySimulacoes[cbSimulacao.ItemIndex - 1];

       qSimula.Open;

       // Verificar se as parcelas originais continuam as mesmas


       sMensa := qSimula.FieldByName('lst_mensa_origem').AsString;

       slMensa := TStringList.Create;

       SplitString(sMensa, ',', slMensa);

       n := 0;

       for i := 1 to (grdAtuais.RowCount - 1) do
       begin
          if slMensa.IndexOf(IntToStr(ArrayCodParcelas[i-1])) >= 0 then
          begin
            ASelList.Values[ grdAtuais.Cells[8,i] ] := '1';
            INC(n);
          end else begin
            ASelList.Values[ grdAtuais.Cells[8,i] ] := '0';
          end;
       end;
       grdAtuais.Refresh;

       if n <> slMensa.Count then begin

          Mensagem('Atenção' + CHR(13) + CHR(13) + 'Não é possível carregar a simulação.' + CHR(13)+ CHR(13)+ 'Alguns dos títulos não aparecem mais como pendentes.', 'UNIMESTRE', MB_OK + MB_ICONWARNING );
          FreeAndNil(qSimula);
          cbSimulacao.ItemIndex := 0;
          ChecarPermissoes;
          Exit;

       end;

       CalcularValoresSelecionados;

       if qSimula.FieldByName('vl_bruto').AsCurrency <> qyNegociavl_bruto_negocia.AsCurrency then begin

          Mensagem('Atenção' + CHR(13) + CHR(13) + 'Não é possível carregar a simulação.' + CHR(13)+ CHR(13)+ 'Houve alterações no valor bruto das parcelas negociadas.', 'UNIMESTRE', MB_OK + MB_ICONWARNING );
          FreeAndNil(qSimula);
          cbSimulacao.ItemIndex := 0;
          ChecarPermissoes;
          Exit;

       end;

       qyNegociavl_juros_negocia.AsCurrency := qSimula.FieldByName('vl_juros').AsCurrency;
       qyNegociavl_entrada.AsCurrency := qSimula.FieldByName('vl_entrada').AsCurrency;

       txtParcelas.Value :=   qSimula.FieldByName('nr_parcelas').AsInteger;
       umdtApartir.setDate(qSimula.FieldByName('dt_apartir_de').AsDateTime);
       cbData.ItemIndex :=    qSimula.FieldByName('sn_dt_entrada').AsInteger;
       txtJuros.Text :=       qSimula.FieldByName('ds_taxa_juros').AsString;

       if qSimula.FieldByName('sn_taxa_simples').AsInteger = 1 then begin
          cbJuros.ItemIndex := 0;
       end else begin
          cbJuros.ItemIndex := 1;
       end;

       if qSimula.FieldByName('sn_corrige').AsInteger = 1 then begin
          ckbCorrige.Checked := True;
       end else begin
          ckbCorrige.Checked := False;
       end;

       cbTurma.Text :=        qSimula.FieldByName('ds_turma_base').AsString;

       qyNegociads_negocia.AsString := qSimula.FieldByName('ds_simulacao').AsString;

       // Procurar o Tipo de Titulo
       for i := 0 to Length(lstTipos) - 1 do begin

          if lstTipos[i] = qSimula.FieldByName('cd_tipo_titulo').AsInteger then begin
          
              cbTipoTitulos.ItemIndex := i;
              break;

          end;

       end;

       cbSimulacao.ItemIndex := iCombo;

       btnCalcularClick(nil);

       // Depois de Calcular, deve ler da base as as alterações efetuadas manualmente na grid.

       str := TStringList.Create();

       str.Text := qSimula.FieldByName('me_negocia').AsString;

       if str.Count > 2 then begin

          n := 0;
          temp := StrToInt(str.Strings[n]);

          // Se o número de parcelas salvo for diferente do atual, cancela tudo.



          INC(n);

          For X:=0 to grdNovas.colcount-1 do
              For y:=0 to grdNovas.rowcount-1 do begin
                  tempstr := str.Strings[ n ];
                  grdNovas.cells[x,y]:=tempstr;
                  INC(n)
              end;

          for I := 0 to grdNovas.rowcount-2 do begin

              ArrayDatas[i]          := StrToDateTime(grdNovas.Cells[1, i+1]);
              
              if Trim(grdNovas.Cells[2, i+1]) = '' then
                 ArrayCalculados[i] := 0
              else
                 ArrayCalculados[i] := StrToFloat(grdNovas.Cells[2, i+1]);

              if Trim(grdNovas.Cells[3, i+1]) = '' then
                 ArrayJurosNovas[i] := 0
              else
                 ArrayJurosNovas[i] := StrToFloat(grdNovas.Cells[3, i+1]);
              if Trim(grdNovas.Cells[4, i+1]) = '' then
                 ArrayDescontosNovas[i] := 0
              else
                 ArrayDescontosNovas[i] := StrToFloat(grdNovas.Cells[4, i+1]);

              grdNovas.Cells[5, i + 1] := FloatToStrF(ArrayCalculados[i] - ArrayDescontosNovas[i] + ArrayJurosNovas[i], ffFixed, 12, 2);

              somaDescontos := somaDescontos + ArrayDescontosNovas[i];
          end;

          edValorDesc.setValor(somaDescontos);
          edValorDescExit(nil);


       end;
       
       FreeAndNil(qSimula);

   end;

   ChecarPermissoes;
end;

procedure TfrmNegociacao.edCreditosKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      SelectNext(Sender As TWinControl, True, True);
      Key := #0;
   end;

   if key = '.' then begin
      key := ',';
   end;

   if not (Key in ['0'..'9',#8,',']) then begin
      Key := #0;
      exit;
   end;
end;

procedure TfrmNegociacao.edJurosChange(Sender: TObject);
begin
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.edJurosExit(Sender: TObject);
begin
   if edJuros.Text = '' then
   begin
      edJuros.Text := '0,00';
   end;

   //Atualiza o valor do juros
   qyNegociavl_juros_negocia_visual.AsCurrency := edJuros.getValor();
   qyNegociavl_juros_negocia.AsCurrency := qyNegociavl_juros_negocia_visual.AsCurrency + Self.valorMulta;

   atualizaDadosNovasParcelas();
end;

procedure TfrmNegociacao.edPorcentagemDescEnter(Sender: TObject);
begin
   mudouValorDesconto := false;
end;

procedure TfrmNegociacao.edPorcentagemDescExit(Sender: TObject);
begin
   if(mudouValorDesconto = false) then
   begin
      mudouValorDesconto := true;
      exit;
   end;

   if(edPorcentagemDesc.getValorString = '') then
   begin
     edPorcentagemDesc.setValor(0);
     exit;
   end;
   
   if(edPorcentagemDesc.getValor > 100) then
   begin
      edPorcentagemDesc.setValor(100);
      Mensagem('Apenas valores entre 0 e 100!.','Aviso',MB_OK + MB_ICONWARNING);
      exit;
   end;

   if(qyNegociavl_bruto_negocia.AsCurrency = 0) then
   begin
      exit;
   end;

   edValorDesc.setValor((qyNegociavl_bruto_negocia.AsCurrency * edPorcentagemDesc.getValor)/100);

   atualizaDadosNovasParcelas();
end;

procedure TfrmNegociacao.edPorcentagemDescKeyPress(Sender: TObject;
  var Key: Char);
begin
   mudouValorDesconto := true;
end;

procedure TfrmNegociacao.edValorDescEnter(Sender: TObject);
begin
   mudouValorDesconto := false;
end;

procedure TfrmNegociacao.edValorDescExit(Sender: TObject);
begin
   if(mudouValorDesconto = false) then
   begin
      mudouValorDesconto := true;
      exit;
   end;
   
   if(edValorDesc.getValorString = '') then
   begin
     edValorDesc.setValor(0);
     exit;
   end;

   if(edValorDesc.getValor > qyNegociavl_bruto_negocia.AsFloat) then
   begin
      edValorDesc.setValor(qyNegociavl_bruto_negocia.AsFloat);
      Mensagem('O valor de desconto não pode ser maior que o valor total!.','Aviso',MB_OK + MB_ICONWARNING);
      exit;
   end;

   if(qyNegociavl_bruto_negocia.AsFloat = 0) then
   begin
      exit;
   end;
   
   edPorcentagemDesc.setValor((edValorDesc.getValor*100)/qyNegociavl_bruto_negocia.AsFloat);

   atualizaDadosNovasParcelas();
end;

procedure TfrmNegociacao.edValorDescKeyPress(Sender: TObject; var Key: Char);
begin
   mudouValorDesconto := true;
end;

procedure TfrmNegociacao.EstornarChequeNegociado;
// Estornar o cheque negociado
Var
   dblDinheiro, dblCheque : Currency;
   iCodCaixa, iCodAbertura, iCodAberturaAtual : integer;
   iTpConta :word;
   Movimento : TMovimento;
   ds_historico, sCodCheques, sOpCheques, sAux, sCodMensalidadeOrigem : String;
   i : Integer;
   qyAltera : TUMZQuery;
   bTemParcial : Boolean;
   qEstornar : TUMZQuery;
   bEstornar : Boolean;
begin


  // Selecionar o caixa que foi baixado e o código de Abertura
  // Selecionar o registro de quitação de cheque

  DM.CriarConsulta(qEstornar);

  qEstornar.Close;
  qEstornar.SQL.Clear;
  qEstornar.SQL.Add(' SELECT m.cd_mensalidade, t.cd_movimento_te, t.cd_caixa, t.dt_movimento, t.cd_forma_pgto, t.nr_documento, t.cd_abertura_caixa, t.cd_coligada, t.vl_movimento, t.vl_dinheiro, t.vl_cheque, t.ds_movimento  ' +
                    '   FROM mensalidades AS m ' +
                    '  INNER JOIN fin_negocia_parc_atual as a ON (m.cd_mensalidade = a.cd_mensalidade) ' +
                    '  INNER JOIN fin_mov_tesouraria as t ON (t.cd_mensalidade = m.cd_mensalidade) ' +
                    '  WHERE m.situacao = 3 AND t.nr_estorno = 0 AND t.cd_acao = 18 AND t.tp_entrada_saida = 2 ' +
                    '    AND a.cd_negocia = :cd_negocia ' +
                    '  ORDER BY t.cd_movimento_te   ');
  qEstornar.ParamByName('cd_negocia').AsInteger := qyNegociaAnteriorcd_negocia.AsInteger;
  qEstornar.Open;

 if qEstornar.Eof then begin
    // Se não tiver nada para estornar, então é só finalizar
    Exit;
  end;

  // Verificar se todos os lançamentos com este cd_mensalidade estão em caixas abertos

  qEstornar.First();

  while not qEstornar.Eof do begin
      bEstornar := true;

      // Códigos dos caixas que a parcela foi baixada
      iCodCaixa := qEstornar.FieldByName('cd_caixa').AsInteger;
      iCodAbertura := qEstornar.FieldByName('cd_abertura_caixa').AsInteger;

      movimento := TMovimento.Create;

      movimento.Coligada := qEstornar.FieldByName('cd_coligada').AsInteger;

      if not Movimento.VerificaContaAtiva(iCodCaixa, iTpConta, iCodAberturaAtual ) then begin
        bEstornar := false;
      end else begin

          if (iTpConta = 3) AND (iCodAberturaAtual = 0) then begin
             bEstornar := false;
          end;

      end;

      movimento.free;

      if bEstornar then begin

         dblDinheiro := qEstornar.FieldByName('vl_dinheiro').AsCurrency;
         dblCheque   := qEstornar.FieldByName('vl_cheque').AsCurrency;
         ds_historico := qEstornar.FieldByNAme('ds_movimento').AsString;

         movimento := TMovimento.Create;

         movimento.Historico := 'ESTORNO ' + qEstornar.FieldByName('ds_movimento').AsString;

         movimento.ValorMovimento := qEstornar.FieldByName('vl_movimento').AsCurrency;

         movimento.ValorEmDinheiro := qEstornar.FieldByName('vl_dinheiro').AsCurrency;
         movimento.ValorEmCheque   := qEstornar.FieldByName('vl_cheque').AsCurrency;
         movimento.Mensalidade     := qEstornar.FieldByName('cd_mensalidade').AsInteger;

         Movimento.EntradaSaida    := 1;

         Movimento.CodAcao := 6 ; // Acão Padrão
         Movimento.NumeroDocumento := qEstornar.FieldByName('nr_documento').AsString;
         Movimento.DataLiberacao := Date;
         Movimento.Origem := 1; // Contas a Receber;

         Movimento.DataMovimento := qEstornar.FieldByName('dt_movimento').AsDateTime;

         Movimento.Coligada := qEstornar.FieldByName('cd_coligada').AsInteger;

         Movimento.FormaDePagamento := qEstornar.FieldByName('cd_forma_pgto').AsInteger;

         Movimento.RegistrarMovimentacaoTe( iCodCaixa );

         // Registrar o Estorno
         DM.CriarConsulta(qyAltera);
         qyAltera.SQL.Text :=
           ' SELECT max(nr_estorno) ultimo FROM fin_mov_tesouraria ';
         qyAltera.Open();

         i := qyAltera.FieldByName('ultimo').AsInteger + 1;

         qyAltera.Close();

         qyAltera.SQL.Text :=
            ' UPDATE fin_mov_tesouraria      ' +
            ' SET nr_estorno = ' + IntToStr(i) +
            ' , dt_compensacao = NULL, sn_compensado = 0 '  +  // Um estorno não poderá mais contar no saldo
            ' WHERE cd_movimento_te in (' + IntToStr(qEstornar.FieldByName('cd_movimento_te').AsInteger) + ', ' + IntToStr(Movimento.CodigoMovimento) + ') AND cd_coligada = ' + qEstornar.FieldByName('cd_coligada').AsString;
         qyAltera.ExecSQL();

         FreeAndNil(qyAltera);

         Movimento.free;


      end;

      qEstornar.Next();

  end;

  FreeAndNil(qEstornar);

end;


function TfrmNegociacao.formataValorCurrency(valor: Currency): Currency;
begin
   result := StrToFloat(FloatToStrF(valor, ffFixed, 12, 2));
end;

function TfrmNegociacao.formataValorString(valor: Currency): String;
begin
   result := FloatToStrF(valor , ffFixed, 12, 2);
end;

procedure TfrmNegociacao.qyNegociavl_juros_negociaChange(Sender: TField);
var
   ValorCredito, Creditos : Currency;
begin

   if SomaCreditos > 0 then begin

      ValorCredito := qyNegociavl_bruto_negocia.AsCurrency / SomaCreditos;

      Creditos := SomaCreditos + (qyNegociavl_juros_negocia.AsCurrency / ValorCredito);

   end
   else begin
      Creditos := 0;
   end;

   qyNegociavl_Creditos.AsCurrency := Creditos;
end;

procedure TfrmNegociacao.CarregarParcelasParaNegociar;
var
  n : Byte;
  wYear, wMonth, wDay : Word;
  sAux : String;
  sSit : String;
  sMarcar : String;
  posicao:integer;
begin

  PageControl1.ActivePageIndex := 0;

  lbNome.Caption := Self.FSNomeAluno;
  lbCodigo.Caption := Format('%d', [Self.FICodigoAluno]);

  Screen.Cursor := crHourGlass;

  umdtApartir.setDate(DataHoje);

  // Selecionar todas as mensalidades pendentes do Acadêmico 
  tblMensalidades.Close();
  tblMensalidades.SQL.Clear();


   tblMensalidades.SQL.Text :=
     ' SELECT r.nm_pessoa as nm_resp ' +
     '      , men.datavencimento       ' +
     '      , men.databasecorrecao     ' +
     '      , men.situacao             ' +
     '      , men.parcela              ' +
     '      , men.cd_mensalidade       ' +
     '      , men.sn_liberar_juros     ' +
     '      , men.sn_liberar_descontos ' +
     '      , men.valorjuros           ' +
     '      , men.valorjuros_fixo      ' +
     '      , men.valorbruto           ' +
     '      , men.valordesconto        ' +
     '      , men.valorextra           ' +
     '      , men.valorpago            ' +
     '      , men.descontoextra        ' +
     '      , men.valortotal           ' +
     '      , men.turma                ' +
     '      , men.anosemestre          ' +
     '      , men.nr_creditos          ' +
     '      , men.tipoparcela          ' +
     '      , tti.ds_tipo_titulo     ' +
     '      , tti.cd_tipo_titulo     ' +
     '      , GET_ACRESCIMOS(men.cd_mensalidade, "' + FormatDateTime('yyyy-mm-dd', DataHoje) + '" ) as juros_calc             '+
     '      , GET_DESCONTOS(men.cd_mensalidade, "' + FormatDateTime('yyyy-mm-dd', DataHoje) + '") as desconto_calc           '+
     '   FROM mensalidades AS men      ' +
     '  INNER JOIN Pessoas AS p ON (men.CodigoAluno = p.cd_pessoa )  ' +
     '   LEFT JOIN pessoas AS r ON (IFNULL(men.cd_resp, p.cd_resp_finan) = r.cd_pessoa) ' +
     '   LEFT JOIN fin_tipos_titulo tti ON (men.cd_tipo_titulo = tti.cd_tipo_titulo AND men.cd_coligada = tti.cd_coligada) '+
     '  WHERE men.codigoAluno = ' + Format('%d', [Self.FICodigoAluno]) +
     '        AND ( CASE WHEN r.cd_pessoa IS NOT NULL THEN r.sn_nao_bloquear_financeiro <> 1 ELSE 1 = 1 END ) ';

  if (not sbParcelasPagas.Visible) OR (not sbParcelasPagas.Down) then begin
     tblMensalidades.SQL.Add( ' AND (men.situacao = 2 OR men.situacao = 10) ' );
  end;

  // Incluí os filtros extras configurados na tabela parametros que são definidos pelo cliente, o padrão é '' (string vazia)
  tblMensalidades.SQL.Add( DM.variavel_parametro('negociacao_filtros_extras') );

  tblMensalidades.SQL.Add( ' ORDER BY men.datavencimento, men.turma, men.parcela, men.cd_resp' );

  tblMensalidades.Open();

  grdNovas.RowCount := 2;
  grdNovas.FixedRows := 1;
  posicao := 1;

  slConfirmaMensalidadesInalteradas := TStringList.Create;

   // Carregar todas as parcelas da tabela de mensalidades
   while not tblMensalidades.EOF do
   begin
      slConfirmaMensalidadesInalteradas.Values[tblMensalidadescd_mensalidade.AsString] := tblMensalidadessituacao.AsString;

     ArrayResponsavel[tblMensalidades.RecNo-1] := tblMensalidadesnm_resp.AsString;

    if tblMensalidadesSituacao.AsInteger in [0, 1] then begin
       sSit := 'OK';
       ArrayValores[tblMensalidades.RecNo-1]  := tblMensalidadesValorPago.Value - tblMensalidadesValorJurosCalc.Value;  // ValorTotal Reajustado até aqui
    end
    else if tblMensalidadesSituacao.AsInteger = 3 then begin
       sSit := 'NEGO';
       ArrayValores[tblMensalidades.RecNo-1]  := tblMensalidadesValorTotalCalc.Value - tblMensalidadesValorJurosCalc.Value;  // ValorTotal Reajustado até aqui
    end
    else if not (tblMensalidadesSituacao.AsInteger in [2, 10])  then begin
       sSit := 'CANC';
       ArrayValores[tblMensalidades.RecNo-1]  := tblMensalidadesValorTotalCalc.Value - tblMensalidadesValorJurosCalc.Value  // ValorTotal Reajustado até aqui
    end
    else begin

        if (tblMensalidadesDataVencimento.AsDateTime < DataHoje) then
           sSit := 'VENC'
        else
           sSit := 'PEND';

       ArrayValores[tblMensalidades.RecNo-1]  := tblMensalidadesValorTotalCalc.Value - tblMensalidadesValorJurosCalc.Value + tblMensalidadesValorDescontoCalc.Value;  // ValorTotal Reajustado até aqui
    end;

    ArrayJuros[tblMensalidades.RecNo-1]    := tblMensalidadesValorJurosCalc.Value;  // Valor referente ao Juros (ja faz parte do ValorTotalCalc
    ArrayJurosCalc[tblMensalidades.RecNo-1] := tblMensalidadesValorJurosCalc.Value;  // Valor referente ao Juros (ja faz parte do ValorTotalCalc

    // Guardar o juros registrado banco
    ArrayJurosParcela[tblMensalidades.RecNo-1] := tblMensalidadesvalorjuros.Value;

    ArrayDescontos[tblMensalidades.RecNo-1] := tblMensalidadesValorDescontoCalc.Value;

    if tblMensalidadesTipoParcela.AsInteger = 4 then begin
       ArrayJurosNominal[tblMensalidades.RecNo-1]    := tblMensalidadesValorJuros.Value;
    end else begin
       ArrayJurosNominal[tblMensalidades.RecNo-1]    := 0;
    end;

    ArrayParcelas[tblMensalidades.RecNo-1] := tblMensalidadesParcela.AsInteger;     // Número da Parcela Pendente
    ArrayCodParcelas[tblMensalidades.RecNo-1] := tblMensalidadescd_mensalidade.AsInteger;
    ArrayTodasTurmas[tblMensalidades.RecNo-1] := tblMensalidadesTurma.AsString;
    ArrayCreditosAtuais[tblMensalidades.RecNo-1] := tblMensalidadesnr_creditos.AsCurrency;

    // Adicionar DISTINTAMENTE as turmas e anosemestre dos alunos
    if cbTurma.Items.IndexOf(tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesAnoSemestre.AsString) < 0 Then
    Begin
       ArrayTurmas[cbTurma.Items.Count] := tblMensalidadesTurma.AsString;              // Adicionar a Turmas
       ArrayAnoSemestre[cbTurma.Items.Count] := tblMensalidadesAnoSemestre.AsInteger;  // Adicionar o Semestre

       // Adicionar no Combobox
       cbTurma.Items.Add(tblMensalidadesTurma.AsString + ' - ' + tblMensalidadesAnoSemestre.AsString);

    End;

    ArrayDatasInicial[tblMensalidades.RecNo-1] := tblMensalidadesDataVencimento.AsDateTime;   // Vencimento

    //Carrega a grid de parcelas
    if(grdAtuais.RowCount = posicao) then
    begin
      grdAtuais.RowCount := grdAtuais.RowCount + 1;
    end;

    ASelList.Values[ tblMensalidadescd_mensalidade.AsString ] := '0';
    grdAtuais.Cells[0, posicao] := '';
    grdAtuais.Cells[1, posicao] := tblMensalidadesParcela.AsString;
    grdAtuais.Cells[2, posicao] := FormatDateTime( 'dd/mm/yy', tblMensalidadesDataVencimento.AsDateTime );
    grdAtuais.Cells[3, posicao] := Format( '%0.2n', [ArrayValores[tblMensalidades.RecNo-1] + ArrayJuros[tblMensalidades.RecNo-1] - ArrayDescontos[tblMensalidades.RecNo-1]]);
    grdAtuais.Cells[4, posicao] := sSit;
    grdAtuais.Cells[5, posicao] := tblMensalidadesnm_resp.AsString;
    grdAtuais.Cells[6, posicao] := tblMensalidadesturma.AsString;
    grdAtuais.Cells[7, posicao] := tblMensalidadesds_tipo_titulo.AsString;
    grdAtuais.Cells[8, posicao] := tblMensalidadescd_mensalidade.AsString;
    grdAtuais.Cells[9, posicao] := sSit;
    grdAtuais.Cells[10, posicao] := tblMensalidadesanosemestre.AsString;
    grdAtuais.Cells[11, posicao] := tblMensalidadescd_tipo_titulo.AsString;

    tblMensalidades.Next;
    inc(posicao);
  end;

  cbTurma.ItemIndex := 0; // Selecionar a última TURMA
  ArrayValores[tblMensalidades.RecNo] := 0.00;
  ArrayJuros[tblMensalidades.RecNo] := 0.00;
  ArrayDescontos[tblMensalidades.RecNo] := 0.00;

  //Salva os juros originais
  Self.copiaArray(ArrayJurosCalc,ArrayJurosCalcOriginal);

  // Prepara a taxa de juros com a média dos últimos seis meses
  // Se o índice da poupança não foi cadastrado, o Juros será igual a ZERO
{  qryPoupanca.Close;

  DecodeDate( DataHoje, wYear, wMonth, wDay );
  Dec( wMonth );
  if wMonth = 0 then
  begin
    wMonth := 12;
    Dec( wYear );
  end;
  qryPoupanca.ParamByName('DataFim').AsString := FormatDateTime('yyyy-mm-dd',EncodeDate( wYear, wMonth, 1 ));
  for n := 1 to 5 do
  begin
    Dec( wMonth );
    if wMonth = 0 then
    begin
      wMonth := 12;
      Dec( wYear );
    end;
  end;

  qryPoupanca.ParamByName('DataInicio').AsString := FormatDateTime('yyyy-mm-dd',EncodeDate( wYear, wMonth, 1 ));
  qryPoupanca.Open;

  txtJuros.Text := TRim(Format( '%8.4n', [qryPoupancaMedia.AsFloat] )); }
  // Agora usa paramêtro, poucos usavam o metodo comentado, se não tiver ele seta pra 0
  txtJuros.Text := dm.variavel_parametro('negociacao_juros_inicial');

  if(txtJuros.Text = '') OR not(IsNumericStr(txtJuros.Text)) then
  begin
     txtJuros.Text := '0';
  end;

  Screen.Cursor := crDefault;

  // Criar um registro de Negociacao;

  qyNegocia.Close();
  qyNegocia.SQL.Text :=
    '  SELECT * from fin_negocia  '+
    '  WHERE cd_pessoa = :CdPessoa ORDER BY cd_negocia ';

  qyNegocia.ParamByName('CdPessoa').AsInteger := Self.FICodigoAluno;
  // qyNegocia.ParamByName('CdNegocia').AsInteger := DM.ProximoId('cd_negocia', 'fin_negocia');
  qyNegocia.Open();

  qyNegocia.Insert;
  // qyNegocia.FieldByName('cd_negocia').AsInteger  := qyNegocia.ParamByName('CdNegocia').AsInteger;
  qyNegocia.FieldByName('cd_pessoa').AsInteger := Self.FICodigoAluno;
  qyNegocia.FieldByName('cd_usuario').AsInteger  := DM.iCdPessoaLogado;
  qyNegocia.FieldByName('dt_negocia').AsDateTime := Dm.DataAtual();
  qyNegocia.FieldByName('vl_entrada').AsCurrency := 0;

  //Marca sempre as vencidas
  sbMarcarVencidasClick( nil );

end;

procedure TfrmNegociacao.CarregarSimulacoes;
Var
   i : Integer;
   habilitar: Boolean;
begin
   qyAux.Close();

   //Verifica se a conexão é Oracle ou MySQL
   if qyAux.Connection.Protocol = 'oracle' then //Oracle
   begin
      qyAux.SQL.Text :=
        ' SELECT s.cd_simulacao, s.ds_simulacao, s.dt_prazo, s.cd_situacao FROM fin_negocia_simula s ' +
        ' LEFT JOIN fin_negocia n ON (s.cd_simulacao = n.cd_simulacao AND s.cd_pessoa = n.cd_pessoa) '+
        '  WHERE n.cd_negocia is null AND s.dt_prazo >= TO_DATE(:data, ''YYYY-MM-DD'') ' +
        '    AND s.cd_pessoa = :cd_pessoa ';
   end else begin
      qyAux.SQL.Text :=
        ' SELECT s.cd_simulacao, s.ds_simulacao, s.dt_prazo, s.cd_situacao FROM fin_negocia_simula s ' +
        ' LEFT JOIN fin_negocia n ON (s.cd_simulacao = n.cd_simulacao AND s.cd_pessoa = n.cd_pessoa) '+
        '  WHERE n.cd_negocia is null AND s.dt_prazo >= :data ' +
        '    AND s.cd_pessoa = :cd_pessoa ';
   end;

   if ( DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1') then
   begin
     qyAux.SQL.Add('and ( s.cd_situacao = 0 )');
   end;

   qyAux.ParamByName('cd_pessoa').AsInteger := Self.FICodigoAluno;
   qyAux.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', Dm.DataAtual());
   qyAux.Open;

   cbSimulacao.Items.Clear;
   cbSimulacao.Items.Add('Iniciar uma nova negociação');
   cbSimulacao.ItemIndex := 0;

   if not qyAux.Eof then begin

      SetLength(ArraySimulacoes, qyAux.RecordCount);

      i := 0;

      while not qyAux.Eof do begin

         cbSimulacao.Items.Add(qyAux.FieldByName('ds_simulacao').AsString + ' - Válida até: ' + FormatDateTime('dd/mm/yyyy', qyAux.FieldByName('dt_prazo').AsDateTime));
         ArraySimulacoes[i] := qyAux.FieldByName('cd_simulacao').AsInteger;
         INC(i);
         qyAux.Next();
      end;

      cbSimulacao.Enabled := true;;
   end else begin

      cbSimulacao.Enabled := false;

   end;


   if( DM.variavel_nu_parametro('UMFinanceiro.Financeiro.Negocia.PreAcordo',0) = '1') and ( qyAux.RecordCount > 0 ) and
   ( qyAux.FieldByName('cd_situacao').AsInteger = 0 ) then
   begin
     cbSimulacao.Enabled    := false;
     grdNovas.Enabled       := false;
     txtParcelas.Enabled    := false;
     umdtApartir.Enabled    := false;
     txtJuros.Enabled       := false;
     dbBruto.Enabled        := False;
     dbJurosNegociados.Enabled        := False;
     edJuros.Enabled        := False;
     dbTotal.Enabled        := False;
     dbEntrada.Enabled      := False;
     dbLiquido.Enabled      := False;
     ckbCorrige.Enabled     := False;
     grdAtuais.Enabled      := False;
     
     cbTurma.Enabled        := false;
     cbTipoTitulos.Enabled  := false;
     dbOBS.Enabled          := false;
     sb1X.Enabled           := False;
     sb2X.Enabled           := False;
     sb3X.Enabled           := False;
     sb4X.Enabled           := False;
     sb5X.Enabled           := False;
     sb6X.Enabled           := False;
     cbJuros.Enabled        := False;
     btnSimular.visible     := false;
     cbSimulacao.ItemIndex  := 1;
     try
       btnCalcularClick(nil);       
     except on E: Exception do
     end;

     btnCalcular.visible    := false;
   end
   else
   begin
     dbJurosNegociados.Enabled := false;
     dbLiquido.Enabled      := false;
     dbTotal.Enabled        := false;

     habilitar := (permissaoTela = 2);
     //Caso a permissão seja 2 (manual) deixa editar
     edJuros.Enabled        := habilitar;
     dbBruto.Enabled        := habilitar;
     dbEntrada.Enabled      := habilitar;
     ckbCorrige.Enabled     := habilitar;
     grdAtuais.Enabled      := habilitar;
     grdNovas.Enabled       := habilitar;
     cbTipoTitulos.Enabled  := habilitar;
     cbJuros.Enabled        := habilitar;
     txtJuros.Enabled       := (permissaoTela = 2);

     //Habilita os campos da direita quando o cara tem pelo menos permissão de plano
     habilitar := (permissaoTela > 0);
     txtParcelas.Enabled    := habilitar;
     umdtApartir.Enabled    := habilitar;
     dbOBS.Enabled          := habilitar;
     sb1X.Enabled           := habilitar;
     sb2X.Enabled           := habilitar;
     sb3X.Enabled           := habilitar;
     sb4X.Enabled           := habilitar;
     sb5X.Enabled           := habilitar;
     sb6X.Enabled           := habilitar;

     cbSimulacao.Enabled    := habilitar;
     btnSimular.Enabled     := habilitar;

     //Turma não vem do plano
     cbTurma.Enabled        := not (permissaoTela = 0);

     btnCalcularClick(nil);

     btnCalcular.Enabled    := habilitar;
     btnConfirmar.Enabled   := habilitar;
   end;

   alterarJuros := False;
   if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
   begin
      edJuros.ReadOnly := True;
      edJuros.Enabled := False;
      edJuros.Color := clBtnFace;
      alterarJuros := True;
      cbJuros.Enabled := false;
      txtJuros.Enabled := false;
   end;

   alterarDesconto := false;
   if not DM.UsuarioLogado.TemPermissao( 2117, npAlterar, False ) then
   begin
      edPorcentagemDesc.Enabled := false;
      edValorDesc.Enabled := false;
      alterarDesconto := true;
   end;
end;

procedure TfrmNegociacao.cbTipoTitulosChange(Sender: TObject);
Var
   nPar, n, a, i, iPar  : Integer;
   ValorCredito         : Double;
   valorParcelaParametro : String;
begin
   recarregaGrid := false;
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();

   // Alteração no tipo de titulo.. montar novamente a list sem recalcular valores
   grdNovas.RowCount := 2;
   grdNovas.FixedRows := 1;
   
   nPar := txtParcelas.Value - 1;

   // Verificar o número inicial da parcela de negociação
   iPar := 0;
   if cbTipoTitulos.ItemIndex >= 0 then
   begin
      // Usar o número do tipo de títulos
      iPar := lstTiposParcelas[cbTipoTitulos.ItemIndex];
   end;

   n := 0;
   a := 0;

   if iPar = 0 then begin

      iPar := 20;
      valorParcelaParametro := DM.variavel_parametro('mensalidades_parcela_negociada');
      if valorParcelaParametro <> '' then Begin
         iPar := StrToInt(valorParcelaParametro);
      end;
   end;

   if qyNegociavl_entrada.AsCurrency > 0 then begin

      // Verificar se foi selecionado o tipo de título... Alterar a número das parcelas

       i := n + iPar + a;
       ArrayParcelasNovas[n] := i;

       grdNovas.RowCount := n + 2;

       grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);

       n := 1;
       nPar := nPar + 1;
   end;

   while n <= nPar do begin // Loop para as parcelas

      i := n + iPar + a;

      ArrayParcelasNovas[n] := i;
      grdNovas.RowCount := n + 2;

      grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
      Inc( n );

   end;

   //Retirado, agora apenas refaz a numeração das parcelas de acordo com o plano
   //btnCalcularClick(btnCalcular);
   recarregaGrid := true;
end;

procedure TfrmNegociacao.cbTurmaChange(Sender: TObject);
begin
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.checaParcelaAtual(ARow: Integer);
var
   PG: TPoint;
   GC: TGridCoord;
   indiceMensa : String;
   valorCheck : String;
   posicaoTop : Integer;
   novoDesconto : Currency;
begin
   PG := grdAtuais.ScreenToClient(Mouse.CursorPos);
   GC := grdAtuais.MouseCoord( PG.X, PG.Y ) ;

   //0 coluna - selecioanr
   if (GC.X = 0) AND (ARow <> 0) then
   begin
      indiceMensa := grdAtuais.Cells[8,ARow];

      valorCheck := '1';
      if ASelList.Values [ indiceMensa ] = '1' then begin
         valorCheck := '0';
      end;

      ASelList.Values [ indiceMensa ] := valorCheck;

      Self.trocaParaManualmente();

      atualizarDadosParcelasAtuais();
      grdAtuais.Repaint();
   end;

end;

procedure TfrmNegociacao.ChecarPermissoes;
begin

  btnSimular.Enabled   := DM.UsuarioLogado.TemPermissao(2017, npIncluir, false);

  if cbSimulacao.ItemIndex <= 0 then begin

     btnConfirmar.Enabled := (DM.UsuarioLogado.TemPermissao(2017, npIncluir, false));

  end else begin

     btnConfirmar.Enabled := (DM.UsuarioLogado.TemPermissao(2017, npIncluir, false) OR DM.UsuarioLogado.TemPermissao(2017, npAlterar, false));

  end;

end;

procedure TfrmNegociacao.ckbCorrigeClick(Sender: TObject);
begin
   AtualizarJuros();
   atualizaDadosNovasParcelas();
end;


procedure TfrmNegociacao.copiaArray(arrBase: array of Currency;
  var arrResultado: array of Currency);
var
   i:integer;
begin
   for i := 0 to 200 do
   begin
      arrResultado[i] := arrBase[i];
   end;
end;

procedure TfrmNegociacao.cbJurosChange(Sender: TObject);
begin
   btnCalcularClick(nil);

   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();

end;

procedure TfrmNegociacao.cbRegrasChange(Sender: TObject);
begin
   if not(self.trocaPlanoManual) then
   begin
      self.atualizaValoresFromPlano();
   end;
end;

procedure TfrmNegociacao.sbParcelasPagasClick(Sender: TObject);
begin
   CarregarParcelasParaNegociar;
end;

procedure TfrmNegociacao.FormCreate(Sender: TObject);
var
   strParametros,parcelaAtual :String;
   i:integer;
   listaInicial :TStringList;
begin
   Self.FSlNegociacoes := TStringList.Create;
   sbParcelasPagas.Visible := (DM.variavel_parametro('financeiro_negociar_parcelas_pagas') = 'S');
   grdDefineTamanho();


  grdNovas.Enabled := false;
  grdTotais.Enabled := false;

  PageControl1.ActivePageIndex := 0;

  alterarJuros := False;
  if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
  begin
     edJuros.ReadOnly := True;
     edJuros.Enabled := False;
     edJuros.Color := clBtnFace;
     alterarJuros := True;
     cbJuros.Enabled := false;
     txtJuros.Enabled := false;
  end;

   alterarDesconto := false;
   if not DM.UsuarioLogado.TemPermissao( 2117, npAlterar, False ) then
   begin
      edPorcentagemDesc.Enabled := false;
      edValorDesc.Enabled := false;
      alterarDesconto := true;
   end;

   anoSemOnline := Dm.variavel_nu_parametro('UniMestre.online.anosemestre.atual');

   listaTiposTitulo := TStringList.Create;
   listaInicial := TStringList.Create;
   strParametros := Dm.variavel_nu_parametro('UniMestre.tipos_titulos_negociaveis');
   strParametros := Trim(strParametros);
   ExtractStrings([','], [], PChar(strParametros), listaInicial);
   for I := 0 to listaInicial.Count - 1 do
   begin
      parcelaAtual := Trim(listaInicial.Strings[i]);
      listaTiposTitulo.Values[parcelaAtual] := parcelaAtual;
   end;
end;

procedure TfrmNegociacao.FormDestroy(Sender: TObject);
begin

   dm.GetUsuarioLogado.SetParametroUsuario(cbJuros, Self.Name + '.cbJuros', cbJuros.Text);

   Self.FSlNegociacoes.Free;
end;

end.



