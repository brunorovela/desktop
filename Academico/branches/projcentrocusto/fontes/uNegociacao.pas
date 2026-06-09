unit uNegociacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, CheckLst, Buttons, Mask, DBCtrls,
  DB, ZConnection, General, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset, Math, Grids, DBGrids,
  DBTables, ZStoredProcedure, ClassRegistros, Spin;

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
    DBGrid1: TDBGrid;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit1: TDBEdit;
    Label23: TLabel;
    DBEdit2: TDBEdit;
    Label24: TLabel;
    DBEdit3: TDBEdit;
    Label25: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label26: TLabel;
    DBEdit6: TDBEdit;
    qyNegociaNomeUsuario: TStringField;
    Label27: TLabel;
    Label28: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
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
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label29: TLabel;
    DBEdit8: TDBEdit;
    btnNegociacao: TSpeedButton;
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
    Label18: TLabel;
    DBEdit10: TDBEdit;
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
    ScrollBox2: TScrollBox;
    Label31: TLabel;
    cbSimulacao: TComboBox;
    sbExcluir: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter1: TSplitter;
    Label5: TLabel;
    lstAtuais: TCheckListBox;
    ckbCorrige: TCheckBox;
    Label6: TLabel;
    dbBruto: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    dbJuros: TDBEdit;
    Label8: TLabel;
    dbTotal: TDBEdit;
    dbEntrada: TDBEdit;
    Label10: TLabel;
    Label17: TLabel;
    dbLiquido: TDBEdit;
    dbCreditos: TDBEdit;
    Label2: TLabel;
    btnConfirmar: TBitBtn;
    btnSimular: TBitBtn;
    btnCancelar: TBitBtn;
    sbParcelasPagas: TSpeedButton;
    sbMarcar: TSpeedButton;
    sbDesmarcar: TSpeedButton;
    Label9: TLabel;
    grdNovas: TStringGrid;
    grdTotais: TStringGrid;
    Label19: TLabel;
    txtParcelas: TSpinEdit;
    cbData: TComboBox;
    datApartir: TDateTimePicker;
    Label13: TLabel;
    txtJuros: TEdit;
    sb1X: TSpeedButton;
    sb2X: TSpeedButton;
    sb3X: TSpeedButton;
    sb4X: TSpeedButton;
    sb5X: TSpeedButton;
    sb6X: TSpeedButton;
    sbJuros: TSpeedButton;
    Label14: TLabel;
    cbTurma: TComboBox;
    cbTipoTitulos: TComboBox;
    dbOBS: TDBEdit;
    btnCalcular: TBitBtn;
    Label16: TLabel;
    Label15: TLabel;
    Label30: TLabel;
    sbMarcarVencidas: TSpeedButton;
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
    procedure cbDataChange(Sender: TObject);
    procedure btnNegociacaoClick(Sender: TObject);
    procedure txtJurosChange(Sender: TObject);
    procedure cbTurmaChange(Sender: TObject);
    procedure dbEntradaChange(Sender: TObject);
    procedure dbJurosChange(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cbTipoTitulosChange(Sender: TObject);
    procedure sbJurosClick(Sender: TObject);
    procedure dbBrutoExit(Sender: TObject);
    procedure qyNegociaBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure sbParcelasPagasClick(Sender: TObject);
    procedure qyNegociavl_juros_negociaChange(Sender: TField);
    procedure edCreditosKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure txtParcelasChange(Sender: TObject);
    procedure sbDesmarcarNovasClick(Sender: TObject);
    procedure sbMarcarNovasClick(Sender: TObject);
    procedure txtJurosKeyPress(Sender: TObject; var Key: Char);
    procedure txtJurosExit(Sender: TObject);
    procedure datApartirChange(Sender: TObject);
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
  private
    { Private declarations }
    alterarJuros: Boolean;
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
    ArraySituacao : Array[0..200] of string;

    ArrayCreditosAtuais : Array[0..200] of Currency;
    ArrayCreditosNovas : Array[0..200] of Currency;

    ArraySimulacoes : Array of Integer;
    procedure MarcarVencidas(ck: TCheckListBox);

    Procedure CalcularValoresSelecionados;
    procedure MarcarTodas(ck: TCheckListBox; situ: boolean);
    Procedure ZerarArrayCalculados;
    procedure TransferirMensalidades(nListBox : Integer);
    Procedure CarregarParcelasParaNegociar;
    Procedure CarregarSimulacoes;
    Procedure MontaCombos;
    Procedure ChecarPermissoes;
    Procedure grdDefineTamanho;
    Procedure AtualizarJuros;
    procedure atualizaTotais();
    Function TotalizaLinha(Linha : Integer) : Boolean;

    Procedure EstornarChequeNegociado;


  public
    { Public declarations }
    BrutoTotal : Currency;
    property NomeAluno: string read FSNomeAluno write FSNomeAluno;
    property CodigoAluno: integer read FICodigoAluno write FICodigoAluno;
  end;

var
  frmNegociacao: TfrmNegociacao;

implementation

uses uDM, Main, uUsuario, uMotivos, uClassMovimento,
  uNegociacaoSimula, uMensalidades, uCobranca;

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

    // PARCELA ZERO NÃO SERÁ CORRIGIDA
    if tblMensalidadesParcela.AsInteger <> 0 then begin

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

    end else begin
       // Parcela ZERO - Não cobrar multa
   	   tblMensalidadesValorTotalCalc.Value := RoundFloat(tblMensalidadesValorBruto.Value +
               tblMensalidadesValorExtra.Value -
               tblMensalidadesValorDesconto.Value -
               tblMensalidadesDescontoExtra.Value +
               tblMensalidadesValorJuros.Value, 2 );
	     tblMensalidadesValorJurosCalc.Value := RoundFloat( tblMensalidadesValorJuros.Value , 2 );
       tblMensalidadesValorDescontoCalc.Value := RoundFloat( tblMensalidadesValorDesconto.Value , 2 );
    End;
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
   if (dm.GetUsuarioLogado.GetParametroUsuarioValor(sbJuros, Self.Name+'.sbjuros') = 'S') then
   begin
      sbJurosClick(Self);
   end;
end;

procedure TfrmNegociacao.carregaTela;
begin

  lbNome.Caption := Self.FSNomeAluno;
  lbCodigo.Caption := Format('%d', [Self.FICodigoAluno]);

  try
    MontaCombos();
    CarregarParcelasParaNegociar;
    CarregarSimulacoes;
    ChecarPermissoes;
    Calculou := False;
    SpeedButton3Click(nil);
    TotalizaLinha(1);
  except on E: Exception do
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegociacao.AtualizarJuros;
Var
   n : Integer;
   dataBase : TDateTime;
   qAux: TUMZQuery;
   sAux : String;
begin
   if ckbCorrige.Checked then begin
      dataBase := datApartir.Date;
   end else begin
      dataBase := DataHoje;
   end;

   DM.CriarConsulta(qAux);
   qAux.Close();
   qAux.SQL.Text := 'SELECT GET_ACRESCIMOS(:cd_mensalidade, :data) as JUROS';


   // Percorre as parcelas atuais e atualizar os juros, conforme a data selecionada
   for n := 0 to lstAtuais.Count - 1 do begin
      qAux.ParamByName('cd_mensalidade').AsInteger := ArrayCodParcelas[n];
      qAux.ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd', dataBase);
      qAux.Open();

      ArrayJuros[n] := ArrayJurosParcela[n] + qAux.FieldByName('JUROS').Value;
      ArrayJurosCalc[n] := ArrayJurosParcela[n] + qAux.FieldByName('JUROS').Value;


      qAux.Close();

     sAux := Format( '%.2d', [ArrayParcelas[n]] );
     sAux := sAux + '  ' + FormatDateTime( 'dd/mm/yy', ArrayDatasInicial[n] );
     sAux := sAux + ' ' + Format( '%8.2n', [ArrayValores[n] + ArrayJuros[n] - ArrayDescontos[n]]);
     sAux := sAux + ' ' + ArraySituacao[n];
     sAux := sAux + '  ' + ArrayResponsavel[n] ;

     lstAtuais.Items.Strings[n] := sAux;

   end;

   CalcularValoresSelecionados;

end;

procedure TfrmNegociacao.btnCalcularClick(Sender: TObject);
var
  wYear, wMonth, wDay, wDiaAtual : Word;    // Data inicial do 1o Pagamento
  wAno, wMes, wDia            : Word;       // Data de Hoje (negociação)

  // diferença de meses da data de Hoje até a data do 1o Pgto
  a, n, nPar, i         : Integer;
  MyDay                 : TDateTime;

  // Valor Mensal das Prestações
  pmt, dblJuros         : Single;   // Tx de Juros
  fap                   : double;
  cTotalBruto           : Currency;
  cTotalLiquido         : Currency;
  sAux                  : String;
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

begin
   { Cálculo das Parcelas Negociadas }
   grdNovas.Enabled     := true;
   grdTotais.Enabled    := true;
   pmt                  := 0;

   ZerarArrayCalculados;

   Screen.Cursor := crHourGlass;

   { --- Inicio do Cálculo Financeiro -- }

   try
      dblJuros := StrToFloat( Trim( txtJuros.Text ) ) / 100;
   except
      dblJuros := 0;
   end;

   {
   Verificar o total das prestações
   O valor das mensalidades já são reajustados até a data de hoje
   terá que calcular juros somente da data de hoje em diante.
   }

   // Se a enrada for maior que o bruto, não sobra bruto para as parcelas.
   if qyNegociavl_entrada.AsCurrency > qyNegociavl_bruto_negocia.AsCurrency then begin
      cTotalBruto := 0;
   end else begin
      cTotalBruto := qyNegociaValLiquido.AsCurrency - qyNegociavl_juros_negocia.AsCurrency + qyNegociavl_desconto_negocia.AsCurrency;
   end;

   cTotalLiquido := qyNegociaValLiquido.AsCurrency + qyNegociavl_desconto_negocia.AsCurrency;

   grdNovas.RowCount := 2;
   grdNovas.FixedRows := 1;

   DecodeDate( datApartir.Date, wYear, wMonth, wDay );

   wDiaAtual := wDay;
   DecodeDate( DataHoje, wAno, wMes, wDia );

   if ((DaysPerMonth[wmes] = wDiaAtual) and (wMonth <> 2)) then
   begin
      wDiaAtual := 31
   end
   else if ( wMonth = 2 ) then
      if ( (IsLeapYear(wYear)) and (wDay = 29) ) then
      begin
         wDiaAtual := 31;
      end
      else if ( wDia = 28 ) then
      begin
         wDiaAtual := 31;
      end;
   begin

   end;

   if dblJuros > 0 Then Begin

      if sbJuros.Caption = 'C' then begin

          n := Meses( DataHoje, datApartir.Date );  // Dif de meses

          if (n > 1) then begin // Cobrar juros composto até a data de inicio
             cTotalLiquido := cTotalLiquido * Power( (1 + dblJuros), (n-1));
          end;

          if txtParcelas.Value >= 1 then
          Begin

             fap := (1 - (Power(1 + dblJuros, -txtParcelas.Value))) / dblJuros;

             pmt := cTotalLiquido / fap;

          End;
      end
      else
      begin
         pmt := (cTotalLiquido + (cTotalLiquido * dblJuros) ) / txtParcelas.Value;

      end;

   End
   else begin
      pmt := cTotalLiquido / txtParcelas.Value;
   end;

   { -- Fim do Cálculo Financeiro -- }

   MyDay := datApartir.Date;
   n := 0;
   a := 0;

   cTotalBruto := cTotalBruto / txtParcelas.Value;

   // Incluir a Entrada no Array;

   nPar := txtParcelas.Value - 1;


   // Verificar o número inicial da parcela de negociação
   iPar := 0;
   if cbTipoTitulos.ItemIndex >= 0 then begin

      // Usar o número do tipo de títulos
      iPar := lstTiposParcelas[cbTipoTitulos.ItemIndex];

   end;

   if iPar = 0 then begin

      if DM.variavel_parametro('mensalidades_parcela_negociada') <> '' then Begin
         try
            iPar := StrToInt(DM.variavel_parametro('mensalidades_parcela_negociada'));
         except
            iPar := 20;
         end;
      end else Begin
            iPar := 20;
      end;
   end;

   cBrutoSoma := 0;
   cJurosSoma := 0;

   cDescontoSoma := 0;

   if qyNegociavl_entrada.AsCurrency > 0 then begin

      // Se o valor da entrada for maior que o valor bruto, separar bruto e juros
      if qyNegociavl_entrada.AsCurrency > qyNegociavl_bruto_negocia.AsCurrency then begin
         ArrayCalculados[n] := qyNegociavl_bruto_negocia.AsCurrency;
         ArrayJurosNovas[n] := qyNegociavl_entrada.AsCurrency - qyNegociavl_bruto_negocia.AsCurrency;
      end else begin
        // senão, a entrada será só de valor bruto
        ArrayCalculados[n] := RoundFloat(qyNegociavl_entrada.AsCurrency, 2);
        ArrayJurosNovas[n] := 0;
      end;

      if cbData.ItemIndex = 1 then begin
         ArrayDatas[n] := datApartir.Date;
         Inc( wMonth );

        if wMonth = 13 then
        begin
          wMonth := 1;
          Inc( wYear );
        end;

        if ( wMonth = 2 ) and ( wDay >= 30 ) then wDay := 28;
        try
          MyDay := EncodeDate( wYear, wMonth, wDay );
        except
          MyDay := EncodeDate( wYear, wMonth, wDay - 1 );
        end;

      end else begin
         ArrayDatas[n] := DataHoje;
      end;


      ArrayDescontosNovas[n] := 0;

      // Verificar se foi selecionado o tipo de título... Alterar a número das parcelas

       i := n + iPar + a;
       ArrayParcelasNovas[n] := i;

       // Apresentar a Entrada na grade

       grdNovas.RowCount := n + 2;

       // Arrendondar valores

       ArrayCalculados[n] := StrToFloat(FloatToStrF(ArrayCalculados[n], ffFixed, 12, 2));
       ArrayJurosNovas[n] := StrToFloat(FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2));
       ArrayDescontosNovas[n] := StrToFloat(FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2));


       cBrutoSoma := cBrutoSoma + ArrayCalculados[n];
       cJurosSoma := cJurosSoma + ArrayJurosNovas[n];
       cDescontoSoma := cDescontoSoma + ArrayDescontosNovas[n];

       grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
       grdNovas.Cells[1, n + 1] := FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] );
       grdNovas.Cells[2, n + 1] := FloatToStrF(ArrayCalculados[n] , ffFixed, 12, 2);
       grdNovas.Cells[3, n + 1] := FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2);
       grdNovas.Cells[4, n + 1] := FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2);
       grdNovas.Cells[5, n + 1] := FloatToStrF(ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n], ffFixed, 12, 2);

       n := 1;
       nPar := nPar + 1;
   end;
   if (cbData.ItemIndex = 1) then
   begin
     if wMonth = 13 then
     begin
       wMonth := 1;
       Inc( wYear );
     end;

     if ( wMonth = 2 ) and ( wDay >= 30 ) then wDay := 29;
     try
       MyDay := EncodeDate( wYear, wMonth, wDiaAtual );
     except
       MyDay := EncodeDate( wYear, wMonth, wDiaAtual - 1 );
     end;
   end
   else
   begin
     MyDay := datApartir.DateTime;
   end;
   while n <= nPar do begin { Loop para as parcelas }

       wday := wDiaAtual;
       case DayOfWeek( MyDay ) of   { Sábado ou Domingo }
         	1 : MyDay := MyDay + 1;
         	7 : MyDay := MyDay + 2;
       end;

       ArrayCalculados[n] := RoundFloat( ( cTotalBruto ), 2 );
       ArrayDatas[n] := MyDay;
       ArrayJurosNovas[n] := pmt - cTotalBruto;
       ArrayDescontosNovas[n] := qyNegociavl_desconto_negocia.AsCurrency / txtParcelas.Value ;

       i := n + iPar + a;

      ArrayParcelasNovas[n] := i;

      if (qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency) <= 0 then
      begin
         ValorCredito := 0;
      end
      else
      begin
         ValorCredito :=
            ((ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]) * qyNegociavl_creditos.AsCurrency) / (qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency);
      end;

      ArrayCreditosNovas[n] := ValorCredito;

      if ValorCredito > 0 then
         sAux := sAux + ' - ' + Format('%5.2n', [ValorCredito]);

       grdNovas.RowCount := n + 2;

       ArrayCalculados[n] := StrToFloat(FloatToStrF(ArrayCalculados[n], ffFixed, 12, 2));
       ArrayJurosNovas[n] := StrToFloat(FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2));
       ArrayDescontosNovas[n] := StrToFloat(FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2));

       cBrutoSoma := cBrutoSoma + StrToFloat(FloatToStrF(ArrayCalculados[n], ffFixed, 12, 2));
       cJurosSoma := cJurosSoma + StrToFloat(FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2));

       cDescontoSoma := cDescontoSoma + StrToFloat(FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2));

       grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
       grdNovas.Cells[1, n + 1] := FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] );
       grdNovas.Cells[2, n + 1] := FloatToStrF(ArrayCalculados[n], ffFixed, 12, 2);
       grdNovas.Cells[3, n + 1] := FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2);
       grdNovas.Cells[4, n + 1] := FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2);
       grdNovas.Cells[5, n + 1] := FloatToStrF(ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n], ffFixed, 12, 2);

//      lstNovas.Items.Add( sAux );

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
      else if (IsLeapYear( wYear ) AND ( wMonth = 2 ))  then
      begin
         wDay := 29;
      end;

      try
        MyDay := EncodeDate( wYear, wMonth, wday );
      except
        MyDay := EncodeDate( wYear, wMonth, wday - 1 );
      end;

    end;

    // Verificar se o total ficou diferente do negociado.

    if cBrutoSoma <> qyNegociavl_bruto_negocia.AsCurrency then begin

       ArrayCalculados[n - 1] := ArrayCalculados[n - 1] + (qyNegociavl_bruto_negocia.AsCurrency - cBrutoSoma);

       grdNovas.Cells[2, n ] := FloatToStrF(ArrayCalculados[n - 1], ffFixed, 12, 2);
       grdNovas.Cells[5, n ] := FloatToStrF(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1], ffFixed, 12, 2);

    end;

    if (cJurosSoma <> qyNegociavl_juros_negocia.AsCurrency) AND (dblJuros <= 0) then begin

       ArrayJurosNovas[n - 1] := ArrayJurosNovas[n - 1] + (qyNegociavl_juros_negocia.AsCurrency - cJurosSoma);

       grdNovas.Cells[3, n ] := FloatToStrF(ArrayJurosNovas[n - 1], ffFixed, 12, 2);
       grdNovas.Cells[5, n ] := FloatToStrF(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1], ffFixed, 12, 2);

       cJurosSoma := qyNegociavl_juros_negocia.AsCurrency;

    end;

    if (cDescontoSoma <> qyNegociavl_desconto_negocia.AsCurrency) then begin

       ArrayDescontosNovas[n - 1] := ArrayDescontosNovas[n - 1] + (qyNegociavl_desconto_negocia.AsCurrency - cDescontoSoma);

       grdNovas.Cells[4, n ] := FloatToStrF(ArrayDescontosNovas[n - 1], ffFixed, 12, 2);
       grdNovas.Cells[5, n ] := FloatToStrF(ArrayCalculados[n - 1] - ArrayDescontosNovas[n - 1] + ArrayJurosNovas[n - 1], ffFixed, 12, 2);

       cDescontoSoma := qyNegociavl_desconto_negocia.AsCurrency;

    end;

    if cJurosSoma > 0 then begin
       grdTotais.Cells[3,0] := FloatToStrF(cJurosSoma, ffFixed, 12, 2);
       grdTotais.Cells[5,0] := FloatToStrF(qyNegociavl_bruto_negocia.AsFloat + cJurosSoma - cDescontoSoma, ffFixed, 12, 2);
    end else begin
      grdTotais.Cells[3,0] := FloatToStrF(qyNegociavl_juros_negocia.AsFloat, ffFixed, 12, 2);
      grdTotais.Cells[5,0] := FloatToStrF(qyNegociavl_bruto_negocia.AsFloat + qyNegociavl_juros_negocia.AsFloat - qyNegociavl_desconto_negocia.AsFloat, ffFixed, 12, 2);
    end;

    if cDescontoSoma > 0 then begin
       grdTotais.Cells[4,0] := FloatToStrF(cDescontoSoma, ffFixed, 12, 2);
       grdTotais.Cells[5,0] := FloatToStrF(qyNegociavl_bruto_negocia.AsFloat + cJurosSoma - cDescontoSoma, ffFixed, 12, 2);
    end else begin
      grdTotais.Cells[4,0] := FloatToStrF(qyNegociavl_desconto_negocia.AsFloat, ffFixed, 12, 2);
      grdTotais.Cells[5,0] := FloatToStrF(qyNegociavl_bruto_negocia.AsFloat + qyNegociavl_juros_negocia.AsFloat - qyNegociavl_desconto_negocia.AsFloat, ffFixed, 12, 2);
    end;

    // Apresentar a grade de totais;

    grdTotais.Cells[0,0] := 'TOT';
    grdTotais.Cells[1,0] := ' = ';
    grdTotais.Cells[2,0] := FloatToStrF(qyNegociavl_bruto_negocia.AsFloat, ffFixed, 12, 2);
    grdTotais.Cells[4,0] := FloatToStrF(qyNegociavl_desconto_negocia.AsFloat, ffFixed, 12, 2);

    // Reajustar os juros e os descontos originais
    // Baseado no Valor da Soma dos Juros "cJurosSoma"

    // cJurosSoma = Soma dos Juros da Nova negociação
    //

    cJurosOrigem := 0;

    cDescontoOrigem := 0;
    cBrutoOrigem := 0;

    for n := 0 to lstAtuais.Items.Count - 1 do begin

      if lstAtuais.Checked[n] then Begin

         cJurosOrigem := cJurosOrigem + ArrayJuros[n];
         cDescontoOrigem := cDescontoOrigem + ArrayDescontos[n];
         cBrutoOrigem := cBrutoOrigem + ArrayValores[n];

      End

    end;

    cDiferencaJuros := 0;
    cDiferencaDescontos := 0;
    i := 0;
    cDbJuros := 0;

    //Tenta pegar o valor dos juros, caso não tenta novamente tirando os '.'
    try
      cDbJuros := StrToCurr(dbJuros.Text);
    except
      cDbJuros := StrToCurr(StringReplace(dbJuros.Text, '.', '', [rfReplaceAll, rfIgnoreCase]));
    end;

    if cJurosOrigem <> cJurosSoma then begin

       for n := 0 to lstAtuais.Items.Count - 1 do begin

         if lstAtuais.Checked[n] then Begin

             if cJurosOrigem = 0 then begin

                 ArrayJuros[n] := StrToFloat(FloatToStrF((( ArrayValores[n] / cBrutoOrigem ) * cDbJuros), ffFixed, 12, 2));

             end else begin

                 ArrayJuros[n] := StrToFloat(FloatToStrF((( ArrayJuros[n] / cJurosOrigem ) * cDbJuros), ffFixed, 12, 2));

             end;


             cDiferencaJuros := cDiferencaJuros + ArrayJuros[n];

             i := n;

         End

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
    //

    if cDescontoOrigem <> cDescontoSoma then begin

       for n := 0 to lstAtuais.Items.Count - 1 do begin

         if lstAtuais.Checked[n] then Begin

             if cDescontoOrigem = 0 then begin

                 ArrayDescontos[n] := StrToFloat(FloatToStrF((( ArrayDescontos[n] / cBrutoOrigem ) * cDescontoSoma), ffFixed, 12, 2));

             end else begin

             
                 ArrayDescontos[n] := StrToFloat(FloatToStrF((( ArrayDescontos[n] / cDescontoOrigem ) * cDescontoSoma), ffFixed, 12, 2));

             end;

             cDiferencaDescontos := cDiferencaDescontos + ArrayDescontos[n];

             i := n;

         End

       end;

    end else begin

       cDiferencaDescontos := cDescontoSoma;

    end;

    if (cDescontoSoma <> cDiferencaDescontos) then begin

       ArrayDescontos[i] := ArrayDescontos[i] + (cDescontoSoma - cDiferencaDescontos);

    end;

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
  grdNovas.ColWidths[3] := 60;
  grdNovas.Cells[3,0]   := 'Vl.Acres.';

  grdTotais.ColWidths[3] := 60;

  // Valor Desconto
  grdNovas.ColWidths[4] := 60;
  grdNovas.Cells[4,0]   := 'Vl.Desc.';

  grdTotais.ColWidths[4] := 60;

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

  If ACol in [2, 3, 4, 5]  then begin

     if ARow > 0 then begin

         try
            if txt = '' then begin
              txt := '0,00';
            end else begin
               valor := StrToCurr(txt);
               txt := FloatToStrF(valor, ffFixed, 12, 2);
            end;
         except
            txt := '0,00';
         end;

     end; 

     grdNovas.Canvas.FillRect(Rect);
     Rect.Right := Rect.Right -2; // Espaçamento para texto não grudar na borda do grid
     DrawText(grdNovas.Canvas.Handle, PChar(txt), Length(txt), Rect, DT_RIGHT);


  end else begin

     // texto centrado

      X := Rect.Left + ((Rect.Right - Rect.Left) - grdNovas.Canvas.TextWidth(txt)) div 2;

      grdNovas.Canvas.TextRect(Rect, X, Rect.Top+2, txt);


  end;

  if gdFocused in State then begin

     grdNovas.Canvas.DrawFocusRect(Rect);

  end;

  if ((alterarJuros = True) AND ((ACol = 4) or (ACol = 3))) then
  begin

     with TStringGrid(Sender) do
     begin
        //paint the background Green
        Canvas.Brush.Color := clBtnFace;
        Canvas.FillRect(Rect);
        Canvas.TextOut(Rect.Left+2,Rect.Top+2,Cells[ACol, ARow]);
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

   if ((grdNovas.Col = 3) OR (grdNovas.Col = 4)) then
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

end;

procedure TfrmNegociacao.grdNovasKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['/','0'..'9', ',',#8,#13]) then
   begin
       Key := #0;
       Exit;
   end;

   if ((grdNovas.Col = 3) OR (grdNovas.Col = 4)) then
   begin

      if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
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

   if (linAnt >= 1) then
   begin
      // Alterar o valor da linha
      CanSelect := TotalizaLinha(linAnt);
   end;

   if CanSelect then
   begin
      linAnt := ARow;
      colAnt := ACol;
  //      Calcular o valor Total
//      CalculaValorTotal;

   end;

   if ((alterarJuros = True) AND ((ACol = 3) OR (ACol = 4))) then
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

     if (ACol = 2) AND (valor > RoundFloat(qyNegociavl_bruto_negocia.AsCurrency,2)) then begin
        grdTotais.Canvas.Font.Color := clGreen;
        grdTotais.Hint := 'Diferença de ' + FloatTostrF(valor - qyNegociavl_bruto_negocia.AsCurrency, ffFixed, 12, 2);
     end
     else if (ACol = 2) AND (valor < qyNegociavl_bruto_negocia.AsCurrency) then begin
        grdTotais.Canvas.Font.Color := clRed;
        grdTotais.Hint := 'Diferença de ' + FloatTostrF(qyNegociavl_bruto_negocia.AsCurrency - valor, ffFixed, 12, 2);
     end
     else begin
        grdTotais.Canvas.Font.Color:= clWindowText;
        grdTotais.Hint := '';
     end;

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

   for n := 0 to lstAtuais.Items.Count - 1 do begin

     if lstAtuais.Checked[n] then Begin

        ArrayJuros[n] := ArrayJurosCalc[n];

        SomaBruto := SomaBruto + ArrayValores[n];
        SomaJuros := SomaJuros + ArrayJuros[n];
        SomaJurosNegociados := SomaJurosNegociados + ArrayJurosNominal[n];
        SomaCreditos := SomaCreditos + ArrayCreditosAtuais[n];

        SomaDescontos := SomaDescontos + ArrayDescontos[n];

     End;

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

procedure TfrmNegociacao.qyNegociaAnteriorCalcFields(DataSet: TDataSet);
begin

   qyNegociaAnteriorValTotal.AsCurrency := qyNegociaAnteriorvl_bruto_negocia.AsCurrency + qyNegociaAnteriorvl_juros_negocia.AsCurrency - qyNegociaAnteriorvl_desconto_negocia.AsCurrency;
   qyNegociaAnteriorValLiquido.AsCurrency := qyNegociaAnteriorValTotal.AsCurrency - qyNegociaAnteriorvl_entrada.AsCurrency;

   qyNegociaAnteriorJurosNegociado.AsCurrency := SomaJurosNegociados;


end;

procedure TfrmNegociacao.qyNegociaBeforePost(DataSet: TDataSet);
begin
   qyNegocia.ParamByName('CdNegocia').AsInteger := DM.ProximoId('cd_negocia', 'fin_negocia');
end;

procedure TfrmNegociacao.qyNegociaCalcFields(DataSet: TDataSet);
begin

   qyNegociaValTotal.AsCurrency := qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency - qyNegociavl_desconto_negocia.AsCurrency;
   qyNegociaValLiquido.AsCurrency := qyNegociaValTotal.AsCurrency - qyNegociavl_entrada.AsCurrency;

   qyNegociaJurosNegociado.AsCurrency := SomaJurosNegociados;

   DM.FindUserCodigo(qyNegociacd_usuario.AsInteger);
   qyNegociaNomeUsuario.AsString := DM.tblUsuariosNome2.AsString;

end;

procedure TfrmNegociacao.MarcarTodas(ck: TCheckListBox; situ: boolean);
var
  i : integer;
begin

  for i := 0 to (ck.Items.Count-1) do
    ck.Checked[i] := situ;

end;

procedure TfrmNegociacao.MarcarVencidas(ck: TCheckListBox);
var
  i : integer;
begin

  for i := 0 to (ck.Items.Count-1) do
  begin
    if ArraySituacao[i] = 'VENC' then
    begin
      ck.Checked[i] := true;
    end else begin
      ck.Checked[i] := false;
    end;
  end;
  
end;

procedure TfrmNegociacao.MontaCombos;
Var
   iCont : Integer;
begin
   // Montar Combo dos Tipos de Títulos
   qyAux.Close();

   qyAux.SQL.Text := Format(
      ' SELECT cd_tipo_titulo, ds_tipo_titulo, cd_conta, vl_padrao, nr_parcela from fin_config_tipos_titulo ' +
      ' WHERE ct_tipo_titulo = 1 AND cd_coligada_matriz = %d ORDER BY ds_tipo_titulo ', [DM.GetUsuarioLogado.GetColigadaLogada.Codigo]);

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
end;

procedure TfrmNegociacao.sbMarcarClick(Sender: TObject);
begin
   DM.Set_Parametro_usuario_valor('MarcarParcelas', sbMarcar.Name, Self.Name);

   MarcarTodas(lstAtuais, true);

   CalcularValoresSelecionados;
end;

procedure TfrmNegociacao.sbDesmarcarClick(Sender: TObject);
begin
   DM.Set_Parametro_usuario_valor('MarcarParcelas', sbDesmarcar.Name, Self.Name);

   MarcarTodas(lstAtuais, false);

   CalcularValoresSelecionados;
end;

procedure TfrmNegociacao.lstAtuaisClickCheck(Sender: TObject);
begin
   CalcularValoresSelecionados;
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

procedure TfrmNegociacao.dbJurosChange(Sender: TObject);
begin
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.sb1XClick(Sender: TObject);
begin
   datApartir.Date := DataHoje + 30;

   txtParcelas.Value := 1;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb2XClick(Sender: TObject);
begin
   txtParcelas.Value := 2;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb3XClick(Sender: TObject);
begin
   txtParcelas.Value := 3;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb4XClick(Sender: TObject);
begin
   txtParcelas.Value := 4;

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb5XClick(Sender: TObject);
begin
   txtParcelas.Value := 5;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sb6XClick(Sender: TObject);
begin
   txtParcelas.Value := 6;

   btnCalcular.SetFocus();

   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.datApartirChange(Sender: TObject);
begin
   if ckbCorrige.Checked then begin
      AtualizarJuros();
   end;
   
   btnCalcularClick( nil );
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
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
   DM.Set_Parametro_usuario_valor('MarcarParcelas', sbMarcarVencidas.Name, Self.Name);

   MarcarVencidas(lstAtuais);

   CalcularValoresSelecionados;
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

procedure TfrmNegociacao.sbJurosClick(Sender: TObject);
begin
   if sbJuros.Caption = 'C' then
      sbJuros.Caption := 'S'
   else
      sbJuros.Caption := 'C';
   btnCalcularClick(nil);

   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
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
   btnCalcularClick(nil);
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.btnConfirmarClick(Sender: TObject);
var
  x,i                : Integer;
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
begin

   for I := 1 to grdNovas.RowCount-1 do
   begin
      if ((grdNovas.Cells[1,i] = '') or (grdNovas.Cells[1,i] = '  /  /    ')) then
      begin
         Mensagem('Por favor informe uma data de vencimento ');
         exit;
      end;
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

   for I := 0 to lstAtuais.Items.Count - 1 do
   begin
      if( lstAtuais.Checked[i] ) then
      begin
         Inc(ParcelasNegociadas);
         strDescontos.add(CurrToStr(arraydescontos[i]));
         strJuros.Add(CurrToStr(ArrayJuros[i]));
         strTodasTurmas.Add(ArrayTodasTurmas[i]);
         strCodParcelas.Add(IntToStr(ArrayCodParcelas[i]));
         strArrParcelas.Add(inttostr(ArrayParcelas[i]));
         strDataInicial.add(DateToStr(ArrayDatasInicial[i]));
      end;
   end;

   if(cbTipoTitulos.ItemIndex = -1)then
   begin
      Mensagem('Você precisa selecionar um tipo de título para essa negociação.', 'UNIMESTRE', MB_OK + MB_ICONWARNING);
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
                      datApartir.DateTime,
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
                      cd_simulacao
                    );

    Mensagem( 'Parcelas negociadas com sucesso.', Application.Title, MB_OK + MB_ICONINFORMATION );
    Self.ModalResult := mrOk;
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
   n : Integer;
   i : integer;
   Bruto,
   Acrescimo,
   Desconto,
   Liquido : Currency;
   cBrutoOrigem, cJurosOrigem, cDescontoOrigem, cDiferencaJuros, cDiferencaDescontos : Currency; 
begin

   grdNovas.Cells[5, Linha] := FloatToStrF(ArrayCalculados[Linha - 1] - ArrayDescontosNovas[Linha - 1] + ArrayJurosNovas[Linha - 1], ffFixed, 12, 2);


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
   grdTotais.Cells[2, 0] := FloatToStrF(Bruto, ffFixed, 12, 2);
   grdTotais.Cells[3, 0] := FloatToStrF(Acrescimo, ffFixed, 12, 2);
   grdTotais.Cells[4, 0] := FloatToStrF(Desconto, ffFixed, 12, 2);
   grdTotais.Cells[5, 0] := FloatToStrF(Liquido, ffFixed, 12, 2);

   // Arrumar valores iniciais

    cJurosOrigem := 0;

    cDescontoOrigem := 0;
    cBrutoOrigem := 0;

    for n := 0 to lstAtuais.Items.Count - 1 do begin

      if lstAtuais.Checked[n] then Begin

         cJurosOrigem := cJurosOrigem + ArrayJuros[n];
         cDescontoOrigem := cDescontoOrigem + ArrayDescontos[n];
         cBrutoOrigem := cBrutoOrigem + ArrayValores[n];

      End

    end;

    cDiferencaJuros := 0;
    cDiferencaDescontos := 0;
    i := 0;

    if cJurosOrigem <> Acrescimo then begin

       for n := 0 to lstAtuais.Items.Count - 1 do begin

         if lstAtuais.Checked[n] then Begin

             if cJurosOrigem = 0 then begin

                 ArrayJuros[n] := StrToFloat(FloatToStrF((( ArrayValores[n] / cBrutoOrigem ) * Acrescimo), ffFixed, 12, 2));

             end else begin

                 ArrayJuros[n] := StrToFloat(FloatToStrF((( ArrayJuros[n] / cJurosOrigem ) * Acrescimo), ffFixed, 12, 2));
                 
             end;


             cDiferencaJuros := cDiferencaJuros + ArrayJuros[n];
             
             i := n;

         End

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
    //

    if cDescontoOrigem <> Desconto then begin

       for n := 0 to lstAtuais.Items.Count - 1 do begin

         if lstAtuais.Checked[n] then Begin
         
             if cDescontoOrigem = 0 then begin

                 ArrayDescontos[n] := StrToFloat(FloatToStrF((( ArrayDescontos[n] / cBrutoOrigem ) * Desconto), ffFixed, 12, 2));

             end else begin

                 ArrayDescontos[n] := StrToFloat(FloatToStrF((( ArrayDescontos[n] / cDescontoOrigem ) * Desconto), ffFixed, 12, 2));

             end;

             cDiferencaDescontos := cDiferencaDescontos + ArrayDescontos[n];
             
             i := n;

         End

       end;

    end else begin
    
       cDiferencaDescontos := Desconto;
       
    end;
    
    if (Desconto <> cDiferencaDescontos) then begin

       ArrayDescontos[i] := ArrayDescontos[i] + (Desconto - cDiferencaDescontos);

    end;

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
       '  WHERE cd_pessoa = :CdPessoa AND cd_negocia = :CdNegocia ';

     qyNegocia.ParamByName('CdPessoa').AsInteger := Self.FICodigoAluno;
     qyNegocia.ParamByName('CdNegocia').AsInteger := DM.ProximoId('cd_negocia', 'fin_negocia');
     qyNegocia.Open();

     qyNegocia.Insert;
     qyNegocia.FieldByName('cd_negocia').AsInteger  := qyNegocia.ParamByName('CdNegocia').AsInteger;
     qyNegocia.FieldByName('cd_pessoa').AsInteger := Self.FICodigoAluno;
     qyNegocia.FieldByName('cd_usuario').AsInteger  := DM.iCdPessoaLogado;
     qyNegocia.FieldByName('dt_negocia').AsDateTime := Dm.DataAtual();
     qyNegocia.FieldByName('vl_entrada').AsCurrency := 0;

     sMarcar := DM.Get_Parametro_usuario_valor('MarcarParcelas', Self.Name);

     if sMarcar = sbMarcarVencidas.Name then
     begin
        sbMarcarVencidasClick( nil );
     end else if sMarcar = sbDesmarcar.Name then
     begin
        sbDesmarcarClick( nil );
     end else begin
        sbMarcarClick( nil );
     end;

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

procedure TfrmNegociacao.SpeedButton1Click(Sender: TObject);
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

   CarregarParcelasParaNegociar();

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
      frmNegociacaoSimula.datPrazo.Date := Dm.DataAtual() + 5;
   end
   else
   begin
      frmNegociacaoSimula.datPrazo.Date := ArrayDatas[0] + StrToInt(sNroDiasVenc);
      frmNegociacaoSimula.datPrazo.Enabled := False;
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
   qSalva.ParamByName('dt_apartir_de').AsDate    := datApartir.Date;
   qSalva.ParamByName('sn_dt_entrada').AsInteger  := cbData.ItemIndex;
   qSalva.ParamByName('dt_prazo').AsDate       := frmNegociacaoSimula.datPrazo.Date;
   qSalva.ParamByName('cd_usuario').AsInteger    := DM.iCdPessoaLogado;
   qSalva.ParamByName('ds_taxa_juros').AsString  := txtJuros.Text;
   qSalva.ParamByName('ds_turma_base').AsString  := cbTurma.Text;
   qSalva.ParamByName('cd_tipo_titulo').AsInteger:= lstTipos[cbTipoTitulos.ItemIndex];
   qSalva.ParamByName('cd_primeira_parc').AsInteger := cd_primeiro_parc;
   if sbJuros.Caption = 'S' then begin
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

   for i := 0 to lstAtuais.Count - 1 do begin

      if lstAtuais.Checked[i] then begin

        sAux := sAux + IntToStr(ArrayCodParcelas[i]);
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

begin

   if cbSimulacao.ItemIndex > 0 then begin
   
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

       for i := 0 to lstAtuais.Count - 1 do begin

          if slMensa.IndexOf(IntToStr(ArrayCodParcelas[i])) >= 0 then begin

             lstAtuais.Checked[i] := true;
             INC(n);

          end else begin

             lstAtuais.Checked[i] := false;

          end;

       end;

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
       datApartir.Date :=     qSimula.FieldByName('dt_apartir_de').AsDateTime;
       cbData.ItemIndex :=    qSimula.FieldByName('sn_dt_entrada').AsInteger;
       txtJuros.Text :=       qSimula.FieldByName('ds_taxa_juros').AsString;

       if qSimula.FieldByName('sn_taxa_simples').AsInteger = 1 then begin
          sbJuros.Caption := 'S';
       end else begin
          sbJuros.Caption := 'C';
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
          
          end;


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
begin

  PageControl1.ActivePageIndex := 0;

  lbNome.Caption := Self.FSNomeAluno;
  lbCodigo.Caption := Format('%d', [Self.FICodigoAluno]);

  Screen.Cursor := crHourGlass;

  datApartir.Date := DataHoje;

  // Selecionar todas as mensalidades pendentes do Acadêmico 
  tblMensalidades.Close();
  tblMensalidades.SQL.Clear();
  //Verifica se a conexão é Oracle ou MySQL
  if tblMensalidades.Connection.Protocol = 'oracle' then //Oracle
  begin
      tblMensalidades.SQL.Text :=
              ' SELECT r.nm_pessoa as nm_resp ' +
              '      , m.datavencimento       ' +
              '      , m.databasecorrecao     ' +
              '      , m.situacao             ' +
              '      , m.parcela              ' +
              '      , m.cd_mensalidade       ' +
              '      , m.sn_liberar_juros     ' +
              '      , m.sn_liberar_descontos ' +
              '      , m.valorjuros           ' +
              '      , m.valorjuros_fixo      ' +
              '      , m.valorbruto           ' +
              '      , m.valordesconto        ' +
              '      , m.valorextra           ' +
              '      , m.valorpago            ' +
              '      , m.descontoextra        ' +
              '      , m.valortotal           ' +
              '      , m.turma                ' +
              '      , m.anosemestre          ' +
              '      , m.nr_creditos          ' +
              '      , m.tipoparcela          ' +
              '      , GET_ACRESCIMOS(m.cd_mensalidade, TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataHoje)) + ', ''YYYY-MM-DD'')) as juros_calc             '+
              '      , GET_DESCONTOS(m.cd_mensalidade, TO_DATE(' + QuotedStr(FormatDateTime('yyyy-mm-dd', DataHoje)) + ', ''YYYY-MM-DD'')) as desconto_calc           '+
              '   FROM mensalidades m      ' +
              '  INNER JOIN Pessoas p ON (m.CodigoAluno = p.cd_pessoa )  ' +
              '   LEFT JOIN pessoas r ON (COALESCE(m.cd_resp, p.cd_resp_finan) = r.cd_pessoa) ' +
              '  WHERE m.codigoAluno = ' + Format('%d', [Self.FICodigoAluno]) +
              '        AND ( CASE WHEN r.cd_pessoa IS NOT NULL THEN r.sn_nao_bloquear_financeiro <> 1 ELSE 1 = 1 END ) ';

  end else begin
      tblMensalidades.SQL.Text :=
        ' SELECT r.nm_pessoa as nm_resp ' +
        '      , m.datavencimento       ' +
        '      , m.databasecorrecao     ' +
        '      , m.situacao             ' +
        '      , m.parcela              ' +
        '      , m.cd_mensalidade       ' +
        '      , m.sn_liberar_juros     ' +
        '      , m.sn_liberar_descontos ' +
        '      , m.valorjuros           ' +
        '      , m.valorjuros_fixo      ' +
        '      , m.valorbruto           ' +
        '      , m.valordesconto        ' +
        '      , m.valorextra           ' +
        '      , m.valorpago            ' +
        '      , m.descontoextra        ' +
        '      , m.valortotal           ' +
        '      , m.turma                ' +
        '      , m.anosemestre          ' +
        '      , m.nr_creditos          ' +
        '      , m.tipoparcela          ' +
        '      , GET_ACRESCIMOS(m.cd_mensalidade, "' + FormatDateTime('yyyy-mm-dd', DataHoje) + '" ) as juros_calc             '+
        '      , GET_DESCONTOS(m.cd_mensalidade, "' + FormatDateTime('yyyy-mm-dd', DataHoje) + '") as desconto_calc           '+
        '   FROM mensalidades AS m      ' +
        '  INNER JOIN Pessoas AS p ON (m.CodigoAluno = p.cd_pessoa )  ' +
        '   LEFT JOIN pessoas AS r ON (IFNULL(m.cd_resp, p.cd_resp_finan) = r.cd_pessoa) ' +
        '  WHERE m.codigoAluno = ' + Format('%d', [Self.FICodigoAluno]) +
        '        AND ( CASE WHEN r.cd_pessoa IS NOT NULL THEN r.sn_nao_bloquear_financeiro <> 1 ELSE 1 = 1 END ) ';

  end;

  if (not sbParcelasPagas.Visible) OR (not sbParcelasPagas.Down) then begin
     tblMensalidades.SQL.Add( ' AND (m.situacao = 2 OR m.situacao = 10) ' );
  end;

  // Incluí os filtros extras configurados na tabela parametros que são definidos pelo cliente, o padrão é '' (string vazia)
  tblMensalidades.SQL.Add( DM.variavel_parametro('negociacao_filtros_extras') );

  tblMensalidades.SQL.Add( ' ORDER BY m.datavencimento, m.turma, m.parcela, m.cd_resp' );

  tblMensalidades.Open();

  lstAtuais.Items.Clear();    // ListBox das parcelas pendentes

  grdNovas.RowCount := 2;
  grdNovas.FixedRows := 1;
  
  // Carregar todas as parcelas da tabela de mensalidades
  while not tblMensalidades.EOF do
  begin

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

    ArraySituacao[tblMensalidades.RecNo-1] := sSit;

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

    // Adicionar o ListBox das pendentes

    sAux := Format( '%.2d', [tblMensalidadesParcela.AsInteger] );
    sAux := sAux + '  ' + FormatDateTime( 'dd/mm/yy', tblMensalidadesDataVencimento.AsDateTime );
    sAux := sAux + ' ' + Format( '%8.2n', [ArrayValores[tblMensalidades.RecNo-1] + ArrayJuros[tblMensalidades.RecNo-1] - ArrayDescontos[tblMensalidades.RecNo-1]]);
    sAux := sAux + ' ' + sSit;
    sAux := sAux + '  ' + tblMensalidadesnm_resp.AsString ;
    sAux := sAux + '  ' + tblMensalidadesturma.AsString ;

    lstAtuais.Items.Add( sAux );

    tblMensalidades.Next;

  end;

  cbTurma.ItemIndex := 0; // Selecionar a última TURMA
  ArrayValores[tblMensalidades.RecNo] := 0.00; // ArrayValores[tblMensalidades.RecNo-1] := 0.00;
  ArrayJuros[tblMensalidades.RecNo] := 0.00; // ArrayJuros[tblMensalidades.RecNo-1] := 0.00;
  ArrayDescontos[tblMensalidades.RecNo] := 0.00; // ArrayDescontos[tblMensalidades.RecNo-1] := 0.00;

  // Prepara a taxa de juros com a média dos últimos seis meses
  // Se o índice da poupança não foi cadastrado, o Juros será igual a ZERO
  qryPoupanca.Close;

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

  txtJuros.Text := TRim(Format( '%8.4n', [qryPoupancaMedia.AsFloat] ));

  Screen.Cursor := crDefault;

  // Criar um registro de Negociacao;

  qyNegocia.Close();
  qyNegocia.SQL.Text :=
    '  SELECT * from fin_negocia  '+
    '  WHERE cd_pessoa = :CdPessoa AND cd_negocia = :CdNegocia ';

  qyNegocia.ParamByName('CdPessoa').AsInteger := Self.FICodigoAluno;
  qyNegocia.ParamByName('CdNegocia').AsInteger := DM.ProximoId('cd_negocia', 'fin_negocia');
  qyNegocia.Open();

  qyNegocia.Insert;
  qyNegocia.FieldByName('cd_negocia').AsInteger  := qyNegocia.ParamByName('CdNegocia').AsInteger;
  qyNegocia.FieldByName('cd_pessoa').AsInteger := Self.FICodigoAluno;
  qyNegocia.FieldByName('cd_usuario').AsInteger  := DM.iCdPessoaLogado;
  qyNegocia.FieldByName('dt_negocia').AsDateTime := Dm.DataAtual();
  qyNegocia.FieldByName('vl_entrada').AsCurrency := 0;

   sMarcar := DM.Get_Parametro_usuario_valor('MarcarParcelas', Self.Name);

   if sMarcar = sbMarcarVencidas.Name then
   begin
      sbMarcarVencidasClick( nil );
   end else if sMarcar = sbDesmarcar.Name then
   begin
      sbDesmarcarClick( nil );
   end else begin
      sbMarcarClick( nil );
   end;

end;

procedure TfrmNegociacao.CarregarSimulacoes;
Var
   i : Integer;
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
   ( qyAux.FieldByName('cd_situacao').AsInteger = 0 ) then begin
     cbSimulacao.Enabled    := false;

     dbJuros.Enabled        := false;
     dbCreditos.Enabled     := false;
     grdNovas.Enabled       := false;
     txtParcelas.Enabled    := false;
     datApartir.Enabled     := false;
     txtJuros.Enabled       := false;
     dbBruto.Enabled        := False;
     DBEdit9.Enabled        := False;
     dbJuros.Enabled        := False;
     dbTotal.Enabled        := False;
     dbEntrada.Enabled      := False;
     dbLiquido.Enabled      := False;
     ckbCorrige.Enabled     := False;
     lstAtuais.Enabled      := False;
     
     cbTurma.Enabled        := false;
     cbTipoTitulos.Enabled  := false;
     dbOBS.Enabled          := false;
     sb1X.Enabled           := False;
     sb2X.Enabled           := False;
     sb3X.Enabled           := False;
     sb4X.Enabled           := False;
     sb5X.Enabled           := False;
     sb6X.Enabled           := False;
     sbJuros.Enabled        := False;
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

     dbJuros.Enabled        := true;
     dbCreditos.Enabled     := true;
     grdNovas.Enabled       := true;
     txtParcelas.Enabled    := true;
     datApartir.Enabled     := true;
     txtJuros.Enabled       := true;
     dbBruto.Enabled        := true;
     DBEdit9.Enabled        := true;
     dbJuros.Enabled        := true;
     dbTotal.Enabled        := true;
     dbEntrada.Enabled      := true;
     dbLiquido.Enabled      := true;
     ckbCorrige.Enabled     := true;
     lstAtuais.Enabled      := true;

     cbSimulacao.Enabled := true;     
     cbTurma.Enabled        := true;
     cbTipoTitulos.Enabled  := true;
     dbOBS.Enabled          := true;
     sb1X.Enabled           := true;
     sb2X.Enabled           := true;
     sb3X.Enabled           := true;
     sb4X.Enabled           := true;
     sb5X.Enabled           := true;
     sb6X.Enabled           := true;
     sbJuros.Enabled        := true;
     btnSimular.visible     := true;
     


     btnCalcularClick(nil);


     btnCalcular.visible    := true;

   end;
   
   if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
   begin
      dbJuros.ReadOnly := True;
      dbJuros.Enabled := False;
      dbJuros.Color := clBtnFace;
      alterarJuros := True;
   end
   else
   begin
      alterarJuros := False;
   end;


end;

procedure TfrmNegociacao.cbDataChange(Sender: TObject);
begin
   btnCalcularClick( nil );
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
end;

procedure TfrmNegociacao.cbTipoTitulosChange(Sender: TObject);
Var
   nPar, n, a, i, iPar  : Integer;
   ValorCredito         : Double;

begin
   // btnCalcularClick( nil );
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

      if DM.variavel_parametro('mensalidades_parcela_negociada') <> '' then Begin
         try
            iPar := StrToInt(DM.variavel_parametro('mensalidades_parcela_negociada'));
         except
            iPar := 20;
         end;
      end else Begin
            iPar := 20;
      end;
   end;


   if qyNegociavl_entrada.AsCurrency > 0 then begin

      // Verificar se foi selecionado o tipo de título... Alterar a número das parcelas

       i := n + iPar + a;
       ArrayParcelasNovas[n] := i;

       grdNovas.RowCount := n + 2;

       grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
       grdNovas.Cells[1, n + 1] := FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] );
       grdNovas.Cells[2, n + 1] := FloatToStrF(ArrayCalculados[n], ffFixed, 12, 2);
       grdNovas.Cells[3, n + 1] := FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2);
       grdNovas.Cells[4, n + 1] := FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2);
       grdNovas.Cells[5, n + 1] := FloatToStrF(ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n], ffFixed, 12, 2);

       n := 1;
       nPar := nPar + 1;
   end;

   while n <= nPar do begin // Loop para as parcelas

      i := n + iPar + a;

      ArrayParcelasNovas[n] := i;


      ValorCredito := ((ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n]) * qyNegociavl_creditos.AsCurrency) / (qyNegociavl_bruto_negocia.AsCurrency + qyNegociavl_juros_negocia.AsCurrency);

      ArrayCreditosNovas[n] := ValorCredito;

      grdNovas.RowCount := n + 2;

      grdNovas.Cells[0, n + 1] := IntToStr(ArrayParcelasNovas[n]);
      grdNovas.Cells[1, n + 1] := FormatDateTime( 'dd/mm/yyyy', ArrayDatas[n] );
      grdNovas.Cells[2, n + 1] := FloatToStrF(ArrayCalculados[n], ffFixed, 12, 2);
      grdNovas.Cells[3, n + 1] := FloatToStrF(ArrayJurosNovas[n], ffFixed, 12, 2);
      grdNovas.Cells[4, n + 1] := FloatToStrF(ArrayDescontosNovas[n], ffFixed, 12, 2);
      grdNovas.Cells[5, n + 1] := FloatToStrF(ArrayCalculados[n] - ArrayDescontosNovas[n] + ArrayJurosNovas[n], ffFixed, 12, 2);

      Inc( n );

   end;

end;

procedure TfrmNegociacao.cbTurmaChange(Sender: TObject);
begin
   cbSimulacao.ItemIndex := 0;
   ChecarPermissoes();
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
   btnCalcularClick( nil );
end;

procedure TfrmNegociacao.sbParcelasPagasClick(Sender: TObject);
begin
   CarregarParcelasParaNegociar;
end;

procedure TfrmNegociacao.FormCreate(Sender: TObject);
begin
   Self.FSlNegociacoes := TStringList.Create;
   sbParcelasPagas.Visible := (DM.variavel_parametro('financeiro_negociar_parcelas_pagas') = 'S');
   grdDefineTamanho();


  grdNovas.Enabled := false;
  grdTotais.Enabled := false;

  PageControl1.ActivePageIndex := 0;

  if not DM.UsuarioLogado.TemPermissao( 2116, npAlterar, False ) then
  begin
     dbJuros.ReadOnly := True;
     dbJuros.Enabled := False;
     dbJuros.Color := clBtnFace;
     alterarJuros := True;
  end
  else
  begin
     alterarJuros := False; 
  end;

end;

procedure TfrmNegociacao.FormDestroy(Sender: TObject);
begin

   dm.GetUsuarioLogado.SetParametroUsuario(sbJuros, Self.Name + '.sbJuros', sbJuros.Caption);

   Self.FSlNegociacoes.Free;
end;

end.



