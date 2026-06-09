unit UFMatricularDivisaoParcelas;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, ExtCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Buttons,
   DateUtils;

type
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
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      bvlSep1: TBevel;
      sbAplicar: TSpeedButton;
      pnlTitulo: TPanel;
      cdsParcelasDivisaoCD_CONTA: TIntegerField;
      cdsParcelasDivididasCD_CONTA: TIntegerField;
    cdsParcelasDivididasDT_VENCTO: TDateField;
    cdsParcelasDivisaoDT_VENCTO: TDateField;
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure sbAplicarClick(Sender: TObject);
   private
      procedure AplicaDivisao;
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
   NumParcelas, I: Integer;
   DiaOriginal, Mes, Ano: Word;
   ValorBruto, ValorDesconto, ValorBolsa, ValorExtra: Currency;
   DataVencimento: TDate;
begin
   cdsParcelasDivididas.DisableControls;
   cdsParcelasDivididas.Filter := Format('CD_TIPO_TITULO = %d',
      [cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger]);
   cdsParcelasDivididas.Filtered := True;

   while not cdsParcelasDivididas.IsEmpty do
   begin
      cdsParcelasDivididas.Delete;
   end;

   NumParcelas := cdsParcelasDivisaoNR_NOVAS_PARCELAS.AsInteger;
   ValorBruto := cdsParcelasDivisaoVL_BRUTO_TOTAL.AsCurrency / NumParcelas;
   ValorDesconto := cdsParcelasDivisaoVL_DESCONTO_TOTAL.AsCurrency / NumParcelas;
   ValorBolsa := cdsParcelasDivisaoVL_BOLSA_TOTAL.AsCurrency / NumParcelas;
   ValorExtra := cdsParcelasDivisaoVL_EXTRA_TOTAL.AsCurrency / NumParcelas;
   DataVencimento := cdsParcelasDivisaoDT_VENCTO.AsDateTime;
   
   DiaOriginal := DayOf(DataVencimento);
   Mes := MonthOf(DataVencimento);
   Ano := YearOf(DataVencimento); 

   for I := 0 to NumParcelas - 1 do
   begin
      cdsParcelasDivididas.Insert;
      cdsParcelasDivididasCD_TIPO_TITULO.AsInteger :=
         cdsParcelasDivisaoCD_TIPO_TITULO.AsInteger;
      cdsParcelasDivididasDS_TIPO_TITULO.AsString :=
         cdsParcelasDivisaoDS_TIPO_TITULO.AsString;
      cdsParcelasDivididasNR_PARCELA.AsInteger :=
         cdsParcelasDivisaoNR_PARCELA_INICIO.AsInteger + I;
      cdsParcelasDivididasVL_BRUTO.AsCurrency := ValorBruto;
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := ValorDesconto;
      cdsParcelasDivididasVL_DESC_EXTRA.AsCurrency := ValorBolsa;
      cdsParcelasDivididasVL_EXTRA.AsCurrency := ValorExtra;
      cdsParcelasDivididasCD_CONTA.AsInteger :=
         cdsParcelasDivisaoCD_CONTA.AsInteger;
      cdsParcelasDivididasDT_VENCTO.AsDateTime :=
         DataVencimento;

      DataVencimento := IncMonth(DataVencimento, 1);

      Mes := MonthOf(DataVencimento);
      Ano := YearOf(DataVencimento);

      try
         DataVencimento := EncodeDate(Ano, Mes, DiaOriginal);
      except
         DataVencimento := EndOfTheMonth(EncodeDate(Ano, Mes, 1));
      end;
   end;

   cdsParcelasDivididas.Post;
   cdsParcelasDivididas.Filtered := False;
   cdsParcelasDivididas.EnableControls;
end;

procedure TfMatricularDivisaoParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfMatricularDivisaoParcelas.FormDestroy(Sender: TObject);
begin
   cdsParcelasDivisao.Close;
   cdsParcelasDivididas.Close;
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

end.
