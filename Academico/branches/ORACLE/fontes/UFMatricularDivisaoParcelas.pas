unit UFMatricularDivisaoParcelas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Buttons,
   DateUtils, General;

type
   TRetornoDivisao = record
      retornoValido: Boolean;
   end;

   TfMatricularDivisaoParcelas = class(TForm)
      dsParcelasDivisao: TDataSource;
      cdsParcelasDivisao: TClientDataSet;
      cdsParcelasDivisaoCD_TIPO_TITULO: TIntegerField;
      cdsParcelasDivisaoDS_TIPO_TITULO: TStringField;
      cdsParcelasDivisaoVL_BRUTO_TOTAL: TCurrencyField;
      cdsParcelasDivisaoVL_DESCONTO_TOTAL: TCurrencyField;
      cdsParcelasDivisaoVL_BOLSA_TOTAL: TCurrencyField;
      cdsParcelasDivisaoVL_EXTRA_TOTAL: TCurrencyField;
      cdsParcelasDivisaoNR_PARCELAS: TIntegerField;
      cdsParcelasDivisaoNR_NOVAS_PARCELAS: TIntegerField;
      cdsParcelasDivididas: TClientDataSet;
      cdsParcelasDivididasCD_TIPO_TITULO: TIntegerField;
      cdsParcelasDivididasDS_TIPO_TITULO: TStringField;
      cdsParcelasDivididasNR_PARCELA: TIntegerField;
      cdsParcelasDivididasVL_BRUTO: TCurrencyField;
      cdsParcelasDivididasVL_DESCONTO: TCurrencyField;
      cdsParcelasDivididasVL_DESC_EXTRA: TCurrencyField;
      cdsParcelasDivididasVL_EXTRA: TCurrencyField;
      cdsParcelasDivisaoVL_CREDITO: TCurrencyField;
      cdsParcelasDivididasVL_CREDITO: TCurrencyField;
      pnlDivisiveis: TPanel;
      pnlDivisiveisTit: TPanel;
      dbgParcelasDivisao: TDBGrid;
      pnlDivididas: TPanel;
      pnlDividir: TPanel;
      dbgParcelasDivididas: TDBGrid;
      dsParcelasDivididas: TDataSource;
      splSep1: TSplitter;
      cdsParcelasDivisaoNR_PARCELA_INICIO: TIntegerField;
      pnlBotoes: TPanel;
      bvlSep1: TBevel;
      sbAplicar: TSpeedButton;
      pnlTitulo: TPanel;
      cdsParcelasDivisaoCD_CONTA: TIntegerField;
      cdsParcelasDivididasCD_CONTA: TIntegerField;
      cdsParcelasDivididasDT_VENCTO: TDateField;
      cdsParcelasDivisaoDT_VENCTO: TDateField;
      cdsParcelasDivisaoVL_ENTRADA: TFloatField;
      btnCancelar: TBitBtn;
       btnConfirmar: TBitBtn;
    cdsDescontosDivisao: TClientDataSet;
    cdsDescontosDivisaoVL_DESCONTO: TCurrencyField;
    cdsDescontosDivisaoCD_ACAO_MOVIMENTO: TIntegerField;
    cdsDescontosDivisaoCD_TIPO_DESCONTO: TIntegerField;
    cdsDescontosDivisaoCD_TIPO_COMPORTAMENTO: TIntegerField;
    cdsDescontosDivisaoDS_OBSERVACAO: TStringField;
    cdsDescontosDivisaoSN_DESCONTO_PLANO: TIntegerField;
    cdsDescontosDivisaoCD_TIPO_TITULO: TIntegerField;
    cdsDescontosDivididos: TClientDataSet;
    cdsDescontosDivididosVL_DESCONTO: TCurrencyField;
    cdsDescontosDivididosCD_ACAO_MOVIMENTO: TIntegerField;
    cdsDescontosDivididosCD_TIPO_DESCONTO: TIntegerField;
    cdsDescontosDivididosCD_TIPO_COMPORTAMENTO: TIntegerField;
    cdsDescontosDivididosDS_OBSERVACAO: TStringField;
    cdsDescontosDivididosSN_DESCONTO_PLANO: TIntegerField;
    cdsDescontosDivididosCD_TIPO_TITULO: TIntegerField;
    cdsDescontosDivididosIDX_PARCELA: TIntegerField;
    cdsParcelasDivididasIDX_PARCELA: TIntegerField;
    cdsParcelasDivisaoSN_MANTER_NUMERO_PARCELA: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure cdsParcelasDivisaoVL_ENTRADAChange(Sender: TField);

    procedure btnCancelarClick(Sender: TObject);
       procedure btnConfirmarClick(Sender: TObject);
      procedure dsParcelasDivididasUpdateData(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbAplicarClick(Sender: TObject);
   private
      tipoRetorno: TRetornoDivisao;
      nrIdxProxParcelaDividida: Integer;
    procedure ajustarValoresDescontos;

      procedure AplicaDivisao;
      procedure CorrigeGrid(nrParcela, cdTipoTitulo: Integer);

      function validaValores(): Integer;
      function GetNrIdxProxParcelaDividida(): Integer;
   public
      function ShowModal(): TRetornoDivisao; reintroduce;
   end;

var
   fMatricularDivisaoParcelas: TfMatricularDivisaoParcelas;

implementation

uses
   Types;

{$R *.dfm}

{ TfMatricularDivisaoParcelas }

procedure TfMatricularDivisaoParcelas.AplicaDivisao;
var
   NumParcelas, I, nI: Integer;
   DiaOriginal, Mes, Ano: Word;
   ValorBruto, ValorDesconto, ValorBolsa, ValorExtra, ValorCredito, percentualValorEntrada, valorDescontoEntrada,
   valorTotalBrutoDividido, valorTotalCondicionalDividido, valorTotalFixoDividido, valorTotalExtraDividido: Currency;
   VlIndiceCredito : Real;
   DataVencimento: TDate;
begin

   cdsParcelasDivididas.DisableControls;
   cdsParcelasDivididas.Filter := Format('CD_TIPO_TITULO = %d', [cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger]);
   cdsParcelasDivididas.Filtered := True;

   // Limpa o clientDataSet das parcelas divididas
   while not cdsParcelasDivididas.IsEmpty do
   begin
      // Apaga os descontos das parcelas divididas
      cdsDescontosDivididos.Filter := 'IDX_PARCELA = '+IntToStr(cdsParcelasDivididas.RecNo);
      cdsDescontosDivididos.Filtered := true;
      cdsDescontosDivididos.First;

      while not cdsDescontosDivididos.IsEmpty do
      begin
         cdsDescontosDivididos.Delete;
      end;

      cdsParcelasDivididas.Delete;
   end;

   nI := 0;

   if cdsParcelasDivisaoVL_ENTRADA.AsFloat > 0 then nI := 1;

   NumParcelas := cdsParcelasDivisaoNR_NOVAS_PARCELAS.AsInteger;

   VlIndiceCredito := cdsParcelasDivisaoVL_CREDITO.AsCurrency / cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency;

   // Calcula os valores das parcela com base dividindo igualmente entre o número de parcelas definido
   ValorBruto := RoundFloat((cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency - cdsParcelasDivisaoVL_ENTRADA.AsCurrency) / (NumParcelas), 2);
   ValorDesconto := cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency / NumParcelas;
   ValorBolsa := cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency / NumParcelas;
   ValorExtra := cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency / NumParcelas;
   ValorCredito := ValorBruto * VlIndiceCredito;

   DataVencimento := cdsParcelasDivisaoDT_VENCTO.AsDateTime;
   
   DiaOriginal := DayOf(DataVencimento);
   Mes := MonthOf(DataVencimento);
   Ano := YearOf(DataVencimento);

   nI := 0;

   valorTotalBrutoDividido := 0;
   valorTotalCondicionalDividido := 0;
   valorTotalFixoDividido := 0;
   valorTotalExtraDividido := 0;   

   // Confere se existe uma parcela com valor de entrada informado
   if cdsParcelasDivisaoVL_ENTRADA.AsCurrency > 0 then
   begin
      cdsParcelasDivididas.Insert;

      cdsParcelasDivididasCD_TIPO_TITULO.AsInteger := cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
      cdsParcelasDivididasDS_TIPO_TITULO.AsString := cdsParcelasDivisaoDS_TIPO_TITULO.AsString;

      // Parcela de entrada sempre como 0
      cdsParcelasDivididasNR_PARCELA.AsInteger := 0;

      cdsParcelasDivididasVL_BRUTO.AsCurrency := cdsParcelasDivisaoVL_ENTRADA.AsCurrency;

      // Cálcula o percentual que corresponde o valor definido de entrada
      percentualValorEntrada := RoundFloat((cdsParcelasDivisaoVL_ENTRADA.AsCurrency*100) / cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency, 2);
      percentualValorEntrada := percentualValorEntrada / 100;

      // Busca o valor de desconto fixo, condicional e valor extra da parcela de entrada
      // proporcionalmente ao valor percentual definido de entrada
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency*percentualValorEntrada, 2);
      cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency := RoundFloat(cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency*percentualValorEntrada, 2);
      cdsParcelasDivididasVL_EXTRA.AsCurrency := RoundFloat(cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency*percentualValorEntrada, 2);

      // Atualiza os totais dos descontos aplicados somando o que foi aplicado ao valor de entrada
      valorTotalCondicionalDividido := valorTotalCondicionalDividido + cdsParcelasDivididasVL_DESCONTO.AsCurrency;
      valorTotalFixoDividido := valorTotalFixoDividido + cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency;
      valorTotalExtraDividido := valorTotalExtraDividido + cdsParcelasDivididasVL_EXTRA.AsCurrency;

      // Recalcula o valor dos descontos e valor extra das parcelas com base no valor proporcional ao valor de entrada
      ValorDesconto := RoundFloat((cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency - cdsParcelasDivididasVL_DESCONTO.AsCurrency) / NumParcelas, 2);
      ValorBolsa := RoundFloat((cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency - cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency) / NumParcelas, 2);
      ValorExtra := RoundFloat((cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency - cdsParcelasDivididasVL_EXTRA.AsCurrency) / NumParcelas, 2);

      cdsParcelasDivididasCD_CONTA.AsInteger := cdsParcelasDivisaoCD_CONTA.AsInteger;

      cdsParcelasDivididasDT_VENCTO.AsDateTime := Now;

      cdsParcelasDivididasVL_CREDITO.AsCurrency := cdsParcelasDivisaoVL_ENTRADA.AsCurrency * VlIndiceCredito;

      cdsParcelasDivididasIDX_PARCELA.AsInteger := GetNrIdxProxParcelaDividida();

      if cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger = 0 then nI := 1;

      // Divide os descontos e inclui na parcela de entrada
      cdsDescontosDivisao.Open;
      cdsDescontosDivisao.Filter := 'CD_TIPO_TITULO = '+cdsParcelasDivisaoCD_TIPO_TITULO.AsString;
      cdsDescontosDivisao.Filtered := true;
      cdsDescontosDivisao.First;
      while not cdsDescontosDivisao.Eof do
      begin
         cdsDescontosDivididos.Insert;
         cdsDescontosDivididosVL_DESCONTO.AsCurrency := RoundFloat(cdsDescontosDivisaoVL_DESCONTO.AsCurrency*percentualValorEntrada,2);
         cdsDescontosDivididosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosDivisaoCD_ACAO_MOVIMENTO.AsInteger;
         cdsDescontosDivididosCD_TIPO_DESCONTO.AsInteger := cdsDescontosDivisaoCD_TIPO_DESCONTO.AsInteger;
         cdsDescontosDivididosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosDivisaoCD_TIPO_COMPORTAMENTO.AsInteger;
         cdsDescontosDivididosDS_OBSERVACAO.AsString := cdsDescontosDivisaoDS_OBSERVACAO.AsString;
         cdsDescontosDivididosSN_DESCONTO_PLANO.AsInteger := cdsDescontosDivisaoSN_DESCONTO_PLANO.AsInteger;
         cdsDescontosDivididosCD_TIPO_TITULO.AsInteger := cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
         cdsDescontosDivididosIDX_PARCELA.AsInteger := cdsParcelasDivididasIDX_PARCELA.AsInteger;
         cdsDescontosDivididos.Post;

         cdsDescontosDivisao.Next;
      end;

   end;

   {-2 pois a ultima parcela é inserida manualmente para acertar a diferença caso a divisão seja sobre numero impar}
   for I := 0 to NumParcelas - 2 do
   begin
      cdsParcelasDivididas.Insert;
      cdsParcelasDivididasCD_TIPO_TITULO.AsInteger := cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
      cdsParcelasDivididasDS_TIPO_TITULO.AsString := cdsParcelasDivisaoDS_TIPO_TITULO.AsString;

      if cdsParcelasDivisaoSN_MANTER_NUMERO_PARCELA.AsBoolean then
         cdsParcelasDivididasNR_PARCELA.AsInteger := cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger
      else
         cdsParcelasDivididasNR_PARCELA.AsInteger := cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger + I + nI;
         
      cdsParcelasDivididasVL_BRUTO.AsCurrency := ValorBruto;
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := ValorDesconto;
      cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency := ValorBolsa;
      cdsParcelasDivididasVL_EXTRA.AsCurrency := ValorExtra;
      cdsParcelasDivididasVL_CREDITO.AsCurrency := ValorBruto * VlIndiceCredito;
      cdsParcelasDivididasCD_CONTA.AsInteger := cdsParcelasDivisaoCD_CONTA.AsInteger;
      cdsParcelasDivididasDT_VENCTO.AsDateTime := DataVencimento;
      cdsParcelasDivididasIDX_PARCELA.AsInteger := GetNrIdxProxParcelaDividida();

      valorTotalBrutoDividido := valorTotalBrutoDividido + ValorBruto;
      valorTotalCondicionalDividido := valorTotalCondicionalDividido + ValorDesconto;
      valorTotalFixoDividido := valorTotalFixoDividido + ValorBolsa;
      valorTotalExtraDividido := valorTotalExtraDividido + ValorExtra;

      DataVencimento := IncMonth(DataVencimento, 1);

      Mes := MonthOf(DataVencimento);
      Ano := YearOf(DataVencimento);

      try
         DataVencimento := EncodeDate(Ano, Mes, DiaOriginal);
      except
         DataVencimento := EndOfTheMonth(EncodeDate(Ano, Mes, 1));
      end;

      // Divide os descontos e incluí em cada parcela
      cdsDescontosDivisao.Open;
      cdsDescontosDivisao.Filter := 'CD_TIPO_TITULO = '+cdsParcelasDivisaoCD_TIPO_TITULO.AsString;
      cdsDescontosDivisao.Filtered := true;
      cdsDescontosDivisao.First;
      while not cdsDescontosDivisao.Eof do
      begin
         // Cálcula quanto foi o valor de entrada nesse desconto
         valorDescontoEntrada := RoundFloat(cdsDescontosDivisaoVL_DESCONTO.AsCurrency*percentualValorEntrada,2);

         cdsDescontosDivididos.Insert;
         cdsDescontosDivididosVL_DESCONTO.AsCurrency := RoundFloat((cdsDescontosDivisaoVL_DESCONTO.AsCurrency - valorDescontoEntrada)/NumParcelas, 2);
         cdsDescontosDivididosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosDivisaoCD_ACAO_MOVIMENTO.AsInteger;
         cdsDescontosDivididosCD_TIPO_DESCONTO.AsInteger := cdsDescontosDivisaoCD_TIPO_DESCONTO.AsInteger;
         cdsDescontosDivididosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosDivisaoCD_TIPO_COMPORTAMENTO.AsInteger;
         cdsDescontosDivididosDS_OBSERVACAO.AsString := cdsDescontosDivisaoDS_OBSERVACAO.AsString;
         cdsDescontosDivididosSN_DESCONTO_PLANO.AsInteger := cdsDescontosDivisaoSN_DESCONTO_PLANO.AsInteger;
         cdsDescontosDivididosCD_TIPO_TITULO.AsInteger := cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
         cdsDescontosDivididosIDX_PARCELA.AsInteger := cdsParcelasDivididasIDX_PARCELA.AsInteger;

         cdsDescontosDivididos.Post;

         cdsDescontosDivisao.Next;
      end;
   end;

   cdsParcelasDivididas.Insert;

   cdsParcelasDivididasCD_TIPO_TITULO.AsInteger := cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
   cdsParcelasDivididasDS_TIPO_TITULO.AsString := cdsParcelasDivisaoDS_TIPO_TITULO.AsString;

   if cdsParcelasDivisaoSN_MANTER_NUMERO_PARCELA.AsBoolean then
      cdsParcelasDivididasNR_PARCELA.AsInteger := cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger
   else
      cdsParcelasDivididasNR_PARCELA.AsInteger := cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger + I + nI;

   cdsParcelasDivididasVL_BRUTO.AsCurrency := RoundFloat((cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency - cdsParcelasDivisaoVL_ENTRADA.AsCurrency) - valorTotalBrutoDividido, 2);
   cdsParcelasDivididasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency - valorTotalCondicionalDividido, 2);
   cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency := RoundFloat(cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency - valorTotalFixoDividido, 2);
   cdsParcelasDivididasVL_EXTRA.AsCurrency := RoundFloat(cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency - valorTotalExtraDividido, 2);
   cdsParcelasDivididasVL_CREDITO.AsCurrency := cdsParcelasDivididasVL_BRUTO.AsCurrency * VlIndiceCredito;
   cdsParcelasDivididasCD_CONTA.AsInteger := cdsParcelasDivisaoCD_CONTA.AsInteger;
   cdsParcelasDivididasDT_VENCTO.AsDateTime := DataVencimento;
   cdsParcelasDivididasIDX_PARCELA.AsInteger := GetNrIdxProxParcelaDividida();

   // Divide os descontos e incluí em cada parcela
   cdsDescontosDivisao.Open;
   cdsDescontosDivisao.Filter := 'CD_TIPO_TITULO = '+cdsParcelasDivisaoCD_TIPO_TITULO.AsString;
   cdsDescontosDivisao.Filtered := true;
   cdsDescontosDivisao.First;
   while not cdsDescontosDivisao.Eof do
   begin
      // Cálcula quanto foi o valor de entrada nesse desconto
      valorDescontoEntrada := RoundFloat(cdsDescontosDivisaoVL_DESCONTO.AsCurrency*percentualValorEntrada,2);

      cdsDescontosDivididos.Insert;
      cdsDescontosDivididosVL_DESCONTO.AsCurrency := RoundFloat((cdsDescontosDivisaoVL_DESCONTO.AsCurrency - valorDescontoEntrada)/NumParcelas, 2);
      cdsDescontosDivididosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosDivisaoCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosDivididosCD_TIPO_DESCONTO.AsInteger := cdsDescontosDivisaoCD_TIPO_DESCONTO.AsInteger;
      cdsDescontosDivididosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosDivisaoCD_TIPO_COMPORTAMENTO.AsInteger;
      cdsDescontosDivididosDS_OBSERVACAO.AsString := cdsDescontosDivisaoDS_OBSERVACAO.AsString;
      cdsDescontosDivididosSN_DESCONTO_PLANO.AsInteger := cdsDescontosDivisaoSN_DESCONTO_PLANO.AsInteger;
      cdsDescontosDivididosCD_TIPO_TITULO.AsInteger := cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
      cdsDescontosDivididosIDX_PARCELA.AsInteger := cdsParcelasDivididasIDX_PARCELA.AsInteger;
      cdsDescontosDivididos.Post;

      cdsDescontosDivisao.Next;
   end;

   cdsParcelasDivididas.Post;
   cdsParcelasDivididas.Filtered := False;
   cdsParcelasDivididas.EnableControls;

   // Ajusta valores dos descontos (diferenças de centavos causados pelas divisão das parcelas)
   ajustarValoresDescontos;
end;

procedure TfMatricularDivisaoParcelas.ajustarValoresDescontos();
var
   totalDescontos: Currency;
begin
   {
      Esse procedimento ajusta os valores de diferença de centavos por conta da divisão nos descontos de cada parcela,
      para no momento de geração da fin_mov_cr da parcela não fique com pequenas diferenças de centavos, o ajuste é realizado
      diminuindo o total de descontos (fixo) - soma de todos os descontos fixos (com excessão o ultimo), essa diferença será o desconto aplicado
      no última desconto para fechar com o valor total, mesmo procedimento é realizado no desconto condicional
   }

   // Varre as parcelas divididas
   cdsParcelasDivididas.Open;
   cdsParcelasDivididas.First;
   while not cdsParcelasDivididas.Eof do
   begin

      // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela sendo varrida
      cdsDescontosDivididos.Filter := 'IDX_PARCELA = '+cdsParcelasDivididasIDX_PARCELA.AsString+' AND CD_TIPO_DESCONTO = 1';
      cdsDescontosDivididos.Filtered := True;
      cdsDescontosDivididos.Open;

      // Soma dos descontos com excessão do último
      totalDescontos := 0;

      // Varre os descontos de cada parcela dividida
      while not cdsDescontosDivididos.Eof do
      begin
         totalDescontos := totalDescontos + cdsDescontosDivididosVL_DESCONTO.AsCurrency;

         // Se o próximo desconto for o último então edita o valor do último desconto para fechar com o total
         if (cdsDescontosDivididos.RecNo+1) = cdsDescontosDivididos.RecordCount then
         begin
            cdsDescontosDivididos.Next;
            cdsDescontosDivididos.Edit;
            cdsDescontosDivididosVL_DESCONTO.AsCurrency := cdsParcelasDivididasVL_DESCONTO.AsCurrency - totalDescontos;
            cdsDescontosDivididos.Post;
         end;        

         cdsDescontosDivididos.Next;
      end;

      // Filtra apenas os descontos FIXOS (CD_TIPO_DESCONTO = 2) da parcela sendo varrida
      cdsDescontosDivididos.Filter := 'IDX_PARCELA = '+IntToStr(cdsParcelasDivididasIDX_PARCELA.AsInteger)+' AND CD_TIPO_DESCONTO = 2';
      cdsDescontosDivididos.Filtered := True;
      cdsDescontosDivididos.Open;

      // Soma dos descontos com excessão do último
      totalDescontos := 0;

      // Varre os descontos de cada parcela dividida
      while not cdsDescontosDivididos.Eof do
      begin
         totalDescontos := totalDescontos + cdsDescontosDivididosVL_DESCONTO.AsCurrency;

         // Se o próximo desconto for o último então edita o valor do último desconto para fechar com o total
         if (cdsDescontosDivididos.RecNo+1) = cdsDescontosDivididos.RecordCount then
         begin
            cdsDescontosDivididos.Next;
            cdsDescontosDivididos.Edit;
            cdsDescontosDivididosVL_DESCONTO.AsCurrency := cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency - totalDescontos;
            cdsDescontosDivididos.Post;
         end;        

         cdsDescontosDivididos.Next;
      end;

      cdsParcelasDivididas.Next;
   end;

end;


procedure TfMatricularDivisaoParcelas.btnCancelarClick(Sender: TObject);
begin
   Self.tipoRetorno.retornoValido := False;
   Self.Close;
end;

procedure TfMatricularDivisaoParcelas.btnConfirmarClick(Sender: TObject);
begin
   Self.tipoRetorno.retornoValido := (validaValores = 1);

   if Self.tipoRetorno.retornoValido then Close;
end;

procedure TfMatricularDivisaoParcelas.cdsParcelasDivisaoVL_ENTRADAChange(
  Sender: TField);
begin

   {
      Validação quanto ao valor de entrada digitado
      O valor de entrada não poderá ser maior que o VL_BRUTO
   }

   if cdsParcelasDivisaoVL_ENTRADA.AsCurrency > (cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency) then
   begin
      cdsParcelasDivisaoVL_ENTRADA.AsCurrency := (cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency);

      Mensagem('O valor de entrada não poderá ser maior que o valor bruto.', 'Aviso', MB_OK + MB_ICONWARNING);
   end;

end;

procedure TfMatricularDivisaoParcelas.CorrigeGrid(nrParcela, cdTipoTitulo: Integer);
var
   i,
   nI,
   parcelas: Integer;

   valorBruto,
   valorParcela,
   valorTotal: Double;
   
   selecionado: Pointer;
begin
   parcelas := 0;
   valorBruto := 0;
   valorTotal := 0;
   valorParcela := 0;
   nI := 0;

   {Recupera valor total do título}
   cdsParcelasDivisao.Locate('CD_TIPO_TITULO', cdTipoTitulo, []);

   valorTotal := cdsParcelasDivisaoVL_BRUTO_TOTAL.AsFloat;

   if cdsParcelasDivisaoVL_ENTRADA.AsFloat > 0 then nI := 1;
   {Recupera valor total do título}

   selecionado := cdsParcelasDivididas.GetBookmark;
   
   cdsParcelasDivididas.Filter := 'CD_TIPO_TITULO = ' + IntToStr(cdTipoTitulo);
   
   dsParcelasDivididas.OnUpdateData := nil;
   cdsParcelasDivididas.Filtered := True;
   dsParcelasDivididas.OnUpdateData := dsParcelasDivididasUpdateData;
   
   cdsParcelasDivididas.First;

   while not cdsParcelasDivididas.Eof do
   begin

      if cdsParcelasDivididasIDX_PARCELA.AsInteger <= nrParcela then
      begin
         valorBruto := valorBruto + cdsParcelasDivididasVL_BRUTO.AsFloat;
      end;

      // Ultima parcela, corrige o valor
      if parcelas = cdsParcelasDivididas.RecordCount then
      begin
         dsParcelasDivididas.OnUpdateData := nil;
         cdsParcelasDivididas.Edit;

         valorParcela := RoundFloat(valorTotal - valorBruto, 2);
         cdsParcelasDivididasVL_BRUTO.AsFloat := valorParcela;

         cdsParcelasDivididas.Post;
         dsParcelasDivididas.OnUpdateData := dsParcelasDivididasUpdateData;

         valorBruto := valorBruto + valorParcela;

         Inc(parcelas);
         cdsParcelasDivididas.Next;
         continue;
      end;

      if cdsParcelasDivididasIDX_PARCELA.AsInteger > nrParcela then
      begin
         dsParcelasDivididas.OnUpdateData := nil;
         cdsParcelasDivididas.Edit;

         valorParcela := RoundFloat((valorTotal - valorBruto) / (cdsParcelasDivisaoNR_NOVAS_PARCELAS.AsInteger - parcelas + nI), 2);
         cdsParcelasDivididasVL_BRUTO.AsFloat := valorParcela;

         cdsParcelasDivididas.Post;
         dsParcelasDivididas.OnUpdateData := dsParcelasDivididasUpdateData;

         valorBruto := valorBruto + valorParcela;
      end;

      Inc(parcelas);

      cdsParcelasDivididas.Next;
   end;

   cdsParcelasDivididas.Filtered := False;
   cdsParcelasDivididas.Filter := '';
   
   cdsParcelasDivididas.GotoBookmark(selecionado);

   cdsParcelasDivididas.EnableControls;
end;

procedure TfMatricularDivisaoParcelas.dsParcelasDivididasUpdateData(
  Sender: TObject);
begin
   CorrigeGrid(
      cdsParcelasDivididasIDX_PARCELA.AsInteger,
      cdsParcelasDivididasCD_TIPO_TITULO.AsInteger
   );
end;

procedure TfMatricularDivisaoParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfMatricularDivisaoParcelas.FormCreate(Sender: TObject);
begin
   nrIdxProxParcelaDividida := 1;
end;

procedure TfMatricularDivisaoParcelas.FormDestroy(Sender: TObject);
var
   I: Integer;
begin
   for I := ComponentCount - 1 downto 0 do
   begin
      if Components[I] is TClientDataSet then
      begin
         if TClientDataSet(Components[I]).Active then
         begin
            TClientDataSet(Components[I]).EmptyDataSet;
            TClientDataSet(Components[I]).Close;
         end;
         TClientDataSet(Components[I]).Fields.Clear;
         TClientDataSet(Components[I]).FieldDefs.Clear;
         TClientDataSet(Components[I]).Data := Null;
      end;
   end;
end;

procedure TfMatricularDivisaoParcelas.sbAplicarClick(Sender: TObject);
begin
   if cdsParcelasDivisao.State = dsEdit then
   begin
      cdsParcelasDivisao.Post;
   end;

   cdsParcelasDivididas.DisableControls;
   cdsParcelasDivisao.DisableControls;
   cdsParcelasDivisao.First;
   
   while not cdsParcelasDivisao.Eof do
   begin
      if cdsParcelasDivisaoNR_NOVAS_PARCELAS.AsInteger > 0 then
      begin
         AplicaDivisao;
      end
      else
      begin
         cdsParcelasDivididas.Filter := Format('CD_TIPO_TITULO = %d', [
            cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger
         ]);
         cdsParcelasDivididas.Filtered := True;

         while not cdsParcelasDivididas.IsEmpty do
         begin
            cdsParcelasDivididas.Delete;
         end;
         cdsParcelasDivididas.Filtered := False;

      end;
      cdsParcelasDivisao.Next;
   end;

   cdsParcelasDivisao.EnableControls;
   cdsParcelasDivididas.EnableControls;
end;

function TfMatricularDivisaoParcelas.ShowModal: TRetornoDivisao;
begin
   inherited showmodal();

   Result := tipoRetorno;
end;

function TfMatricularDivisaoParcelas.validaValores: Integer;
var
   vlTitulos,
   vlParcelas: Currency;
begin
   vlTitulos := 0;
   vlParcelas := 0;

   Result := 1;

   cdsParcelasDivisao.First;
   cdsParcelasDivididas.First;

   while not cdsParcelasDivisao.Eof do
   begin
      if cdsParcelasDivisaoNR_NOVAS_PARCELAS.AsInteger > 0 then
      begin
         vlTitulos := vlTitulos + cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency;
      end;
      
      cdsParcelasDivisao.Next;
   end;

   while not cdsParcelasDivididas.Eof do
   begin
      vlParcelas := vlParcelas + cdsParcelasDivididasVL_BRUTO.AsFloat;
      
      cdsParcelasDivididas.Next;
   end;

   if vlTitulos <> vlParcelas then
   begin
      Mensagem(
         'Os valores do resultado da divisão não conferem com os totais dos títulos',
         'Aviso',
         MB_OK + MB_ICONWARNING
      );

      Result := 0;
   end;
end;

function TfMatricularDivisaoParcelas.GetNrIdxProxParcelaDividida(): Integer;
begin

   {
      Retorna o número de indice da próxima parcela
      Esse nrIdxProxParcela é um número que será utilizado para linkar a parcela gerada no clientDataSet cdsParcelas
      com todos os descontos aplicados a essa parcela (que gerarão fin_mov_cr) que estão no clientDataSet cdsDescontos
      A variável após retornada é incrementada para que no próximo retorno já esteja com o valor atualizado
   }

   Result := nrIdxProxParcelaDividida;
   nrIdxProxParcelaDividida := nrIdxProxParcelaDividida + 1;
end;

end.
