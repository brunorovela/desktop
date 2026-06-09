unit UFMatricularDivisaoTitulos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Mask,
   Buttons, ZAbstractRODataset, UZDataset;

type
   TfMatricularDivisaoTitulos = class(TForm)
      cdsParcelasOrigem: TClientDataSet;
      cdsParcelasOrigemCD_TIPO_TITULO: TIntegerField;
      cdsParcelasOrigemDS_TIPO_TITULO: TStringField;
      cdsParcelasOrigemNR_PARCELA: TIntegerField;
      cdsParcelasOrigemDT_VENCTO: TDateField;
      cdsParcelasOrigemVL_BRUTO: TCurrencyField;
      cdsParcelasOrigemVL_DESCONTO: TCurrencyField;
      cdsParcelasOrigemVL_BOLSA: TCurrencyField;
      cdsParcelasOrigemVL_EXTRA: TCurrencyField;
      cdsParcelasOrigemCD_RESPONSAVEL: TIntegerField;
      cdsParcelasOrigemNM_RESPONSAVEL: TStringField;
      cdsParcelasOrigemPtrItemPlano: TIntegerField;
      pnlParcelasOrigem: TPanel;
      pnlParcelasOrigemTit: TPanel;
      dbgParcelasOrigem: TDBGrid;
      dsParcelasOrigem: TDataSource;
      cdsParcelasOrigemSN_SELECIONADA: TBooleanField;
      pnlResponsavel: TPanel;
      cdsResponsavel: TClientDataSet;
      cdsResponsavelCD_RESPONSAVEL: TIntegerField;
      cdsResponsavelNM_RESPONSAVEL: TStringField;
      cdsResponsavelVL_PERCENTUAL: TCurrencyField;
      lblNomeResponsavel: TLabel;
      dbeNomeResponsavel: TDBEdit;
      dsResponsavel: TDataSource;
      lblPercentualResponsavel: TLabel;
      dbePercentualResponsavel: TDBEdit;
      bvlSep1: TBevel;
      sbSelResp: TSpeedButton;
      bvlSep2: TBevel;
      pnlBotoes: TPanel;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      bvlSep3: TBevel;
      pnlParcelasDivididas: TPanel;
      cdsParcelasDivididas: TClientDataSet;
      cdsParcelasDivididasCD_TIPO_TITULO: TIntegerField;
      cdsParcelasDivididasDS_TIPO_TITULO: TStringField;
      cdsParcelasDivididasNR_PARCELA: TIntegerField;
      cdsParcelasDivididasDT_VENCTO: TDateField;
      cdsParcelasDivididasVL_BRUTO: TCurrencyField;
      cdsParcelasDivididasVL_DESCONTO: TCurrencyField;
      cdsParcelasDivididasVL_BOLSA: TCurrencyField;
      cdsParcelasDivididasVL_EXTRA: TCurrencyField;
      cdsParcelasDivididasCD_RESPONSAVEL: TIntegerField;
      cdsParcelasDivididasNM_RESPONSAVEL: TStringField;
      cdsParcelasDivididasPtrItemPlano: TIntegerField;
      dsParcelasDivididas: TDataSource;
      dbgParcelasDivididas: TDBGrid;
      sbAplicar: TSpeedButton;
      lblResultado: TLabel;
      pnlTitulo: TPanel;
      cdsParcelasOrigemCD_CONTA: TIntegerField;
      cdsParcelasDivididasCD_CONTA: TIntegerField;
    qryDivisaoProgramada: TUMZReadOnlyQuery;
    qryDivisaoProgramadaCD_DESCONTO_PESSOA: TLargeintField;
    qryDivisaoProgramadaCD_PESSOA: TLargeintField;
    qryDivisaoProgramadaCD_DEPTO: TIntegerField;
    qryDivisaoProgramadaDT_INICIO: TDateTimeField;
    qryDivisaoProgramadaDT_FIM: TDateTimeField;
    qryDivisaoProgramadaVL_PERCENTUAL: TFloatField;
    qryDivisaoProgramadaNR_PARC_INICIO: TSmallintField;
    qryDivisaoProgramadaNR_PARC_FIM: TIntegerField;
    qryDivisaoProgramadaDS_HISTORICO: TStringField;
    qryDivisaoProgramadaCD_RESPONSAVEL: TIntegerField;
    qryDivisaoProgramadaTP_DESCONTO: TSmallintField;
    qryDivisaoProgramadaNM_RESPONSAVEL: TStringField;
    qryTiposTituloDivisao: TUMZReadOnlyQuery;
    qryTiposTituloDivisaoCD_DESCONTO_PESSOA: TIntegerField;
    qryTiposTituloDivisaoCD_TIPO_TITULO: TSmallintField;
    qryTiposTituloDivisaoCD_COLIGADA: TSmallintField;
    dsDivisaoProgramada: TDataSource;
    lblDivisaoProgramada: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbgParcelasOrigemCellClick(Column: TColumn);
    procedure dbePercentualResponsavelKeyPress(Sender: TObject; var Key: Char);
      procedure FormDestroy(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgParcelasOrigemTitleClick(Column: TColumn);
      procedure sbAplicarClick(Sender: TObject);
      procedure sbSelRespClick(Sender: TObject);
      procedure dbgParcelasOrigemDrawColumnCell(Sender: TObject;
         const Rect: TRect; DataCol: Integer; Column: TColumn;
         State: TGridDrawState);
   private
      FDividirFixo: Boolean;
      FDividirCondicional: Boolean;
      procedure AplicaDivisao;
   public
      procedure AplicaDivisaoProgramada;
   end;

var
   fMatricularDivisaoTitulos: TfMatricularDivisaoTitulos;

implementation

uses
   uFSelecionarPessoa, uDM;

{$R *.dfm}

procedure TfMatricularDivisaoTitulos.AplicaDivisao;
var
   IndiceDiv, ValorTotal, DescontoExtra, DescontoCond: Currency;
begin
   IndiceDiv := cdsResponsavelVL_PERCENTUAL.AsCurrency / 100;

   cdsParcelasDivididas.DisableControls;
   cdsParcelasDivididas.EmptyDataSet;
   
   cdsParcelasOrigem.DisableControls;
   cdsParcelasOrigem.First;
   
   while not cdsParcelasOrigem.Eof do
   begin
      ValorTotal :=
         cdsParcelasOrigemVL_BRUTO.AsCurrency +
         cdsParcelasOrigemVL_EXTRA.AsCurrency;

      if cdsParcelasOrigemSN_SELECIONADA.AsBoolean and
         (cdsParcelasOrigemVL_BOLSA.AsCurrency < ValorTotal) then
      begin
         //Somente gera a parcela para o aluno se o percentual de divisão diferente de 100% (IndiceDiv <> 1), pois caso for 100% o aluno não precisará pagar nada
         if IndiceDiv <> 1 then
         begin
            cdsParcelasDivididas.Insert;
            cdsParcelasDivididasCD_TIPO_TITULO.AsInteger :=
               cdsParcelasOrigemCD_TIPO_TITULO.AsInteger;
            cdsParcelasDivididasDS_TIPO_TITULO.AsString :=
               cdsParcelasOrigemDS_TIPO_TITULO.AsString;
            cdsParcelasDivididasNR_PARCELA.AsInteger :=
               cdsParcelasOrigemNR_PARCELA.AsInteger;
            cdsParcelasDivididasDT_VENCTO.AsDateTime :=
               cdsParcelasOrigemDT_VENCTO.AsDateTime;
            cdsParcelasDivididasVL_BRUTO.AsCurrency :=
               cdsParcelasOrigemVL_BRUTO.AsCurrency * (1 - IndiceDiv);
            cdsParcelasDivididasVL_EXTRA.AsCurrency :=
               cdsParcelasOrigemVL_EXTRA.AsCurrency * (1 - IndiceDiv);
            cdsParcelasDivididasCD_RESPONSAVEL.AsInteger :=
               cdsParcelasOrigemCD_RESPONSAVEL.AsInteger;
            cdsParcelasDivididasNM_RESPONSAVEL.AsString :=
               cdsParcelasOrigemNM_RESPONSAVEL.AsString;
            cdsParcelasDivididasCD_CONTA.AsInteger :=
               cdsParcelasOrigemCD_CONTA.AsInteger;
            cdsParcelasDivididasPtrItemPlano.AsInteger :=
               cdsParcelasOrigemPtrItemPlano.AsInteger;

            ValorTotal :=
               cdsParcelasDivididasVL_BRUTO.AsCurrency +
               cdsParcelasDivididasVL_EXTRA.AsCurrency;
            DescontoExtra := cdsParcelasOrigemVL_BOLSA.AsCurrency;

            if FDividirFixo then
            begin
               cdsParcelasDivididasVL_BOLSA.AsCurrency :=
                  DescontoExtra * (1 - IndiceDiv);
               DescontoExtra := DescontoExtra * IndiceDiv;
            end
            else
            begin
               if DescontoExtra > ValorTotal then
               begin
                  cdsParcelasDivididasVL_BOLSA.AsCurrency := ValorTotal;
                  cdsParcelasDivididasVL_DESCONTO.AsCurrency := 0;
                  DescontoExtra := DescontoExtra - ValorTotal;
               end
               else
               if DescontoExtra = ValorTotal then
               begin
                  cdsParcelasDivididasVL_DESCONTO.AsCurrency := 0;
                  DescontoExtra := 0;
               end
               else
               begin
                  cdsParcelasDivididasVL_BOLSA.AsCurrency := DescontoExtra;
                  DescontoExtra := 0;
               end;
            end;

            if FDividirCondicional then
            begin
               cdsParcelasDivididasVL_DESCONTO.AsCurrency :=
                  cdsParcelasOrigemVL_DESCONTO.AsCurrency * (1 - IndiceDiv);
               DescontoCond := cdsParcelasOrigemVL_DESCONTO.AsCurrency * IndiceDiv;
            end
            else
            begin
               DescontoCond := cdsParcelasOrigemVL_DESCONTO.AsCurrency;
               if DescontoCond >
                  (ValorTotal - cdsParcelasDivididasVL_BOLSA.AsCurrency) then
               begin
                  cdsParcelasDivididasVL_DESCONTO.AsCurrency :=
                     ValorTotal - cdsParcelasDivididasVL_BOLSA.AsCurrency;
               end
               else
               begin
                  cdsParcelasDivididasVL_DESCONTO.AsCurrency := DescontoCond;
               end;
               DescontoCond := 0;
            end;
         end else begin

            if FDividirFixo then
            begin
               DescontoExtra := cdsParcelasOrigemVL_BOLSA.AsCurrency;
            end;

            if FDividirCondicional then
            begin
               DescontoCond := cdsParcelasOrigemVL_DESCONTO.AsCurrency;
            end;

         end;

         ValorTotal :=
            cdsParcelasOrigemVL_BRUTO.AsCurrency * IndiceDiv +
            cdsParcelasOrigemVL_EXTRA.AsCurrency * IndiceDiv;

         if DescontoExtra > ValorTotal then
         begin
            DescontoExtra := ValorTotal;
            DescontoCond := 0;
         end
         else
         if DescontoExtra = ValorTotal then
         begin
            DescontoCond := 0;
         end;

         cdsParcelasDivididas.Insert;
         cdsParcelasDivididasCD_TIPO_TITULO.AsInteger :=
            cdsParcelasOrigemCD_TIPO_TITULO.AsInteger;
         cdsParcelasDivididasDS_TIPO_TITULO.AsString :=
            cdsParcelasOrigemDS_TIPO_TITULO.AsString;
         cdsParcelasDivididasNR_PARCELA.AsInteger :=
            cdsParcelasOrigemNR_PARCELA.AsInteger;
         cdsParcelasDivididasDT_VENCTO.AsDateTime :=
            cdsParcelasOrigemDT_VENCTO.AsDateTime;
         cdsParcelasDivididasVL_BRUTO.AsCurrency :=
            cdsParcelasOrigemVL_BRUTO.AsCurrency * IndiceDiv;
         cdsParcelasDivididasVL_DESCONTO.AsCurrency := DescontoCond;
         cdsParcelasDivididasVL_BOLSA.AsCurrency := DescontoExtra;
         cdsParcelasDivididasVL_EXTRA.AsCurrency :=
            cdsParcelasOrigemVL_EXTRA.AsCurrency * IndiceDiv;
         cdsParcelasDivididasCD_RESPONSAVEL.AsInteger :=
            cdsResponsavelCD_RESPONSAVEL.AsInteger;
         cdsParcelasDivididasNM_RESPONSAVEL.AsString :=
            cdsResponsavelNM_RESPONSAVEL.AsString;
         cdsParcelasDivididasCD_CONTA.AsInteger :=
            cdsParcelasOrigemCD_CONTA.AsInteger;
         cdsParcelasDivididasPtrItemPlano.AsInteger :=
            cdsParcelasOrigemPtrItemPlano.AsInteger;
      end
      else
      begin
         cdsParcelasDivididas.Insert;
         cdsParcelasDivididasCD_TIPO_TITULO.AsInteger :=
            cdsParcelasOrigemCD_TIPO_TITULO.AsInteger;
         cdsParcelasDivididasDS_TIPO_TITULO.AsString :=
            cdsParcelasOrigemDS_TIPO_TITULO.AsString;
         cdsParcelasDivididasNR_PARCELA.AsInteger :=
            cdsParcelasOrigemNR_PARCELA.AsInteger;
         cdsParcelasDivididasDT_VENCTO.AsDateTime :=
            cdsParcelasOrigemDT_VENCTO.AsDateTime;
         cdsParcelasDivididasVL_BRUTO.AsCurrency :=
            cdsParcelasOrigemVL_BRUTO.AsCurrency;
         cdsParcelasDivididasVL_BOLSA.AsCurrency :=
            cdsParcelasOrigemVL_BOLSA.AsCurrency;
         cdsParcelasDivididasVL_EXTRA.AsCurrency :=
            cdsParcelasOrigemVL_EXTRA.AsCurrency;
         cdsParcelasDivididasVL_DESCONTO.AsCurrency :=
            cdsParcelasOrigemVL_DESCONTO.AsCurrency;
         cdsParcelasDivididasCD_RESPONSAVEL.AsInteger :=
            cdsParcelasOrigemCD_RESPONSAVEL.AsInteger;
         cdsParcelasDivididasNM_RESPONSAVEL.AsString :=
            cdsParcelasOrigemNM_RESPONSAVEL.AsString;
         cdsParcelasDivididasCD_CONTA.AsInteger :=
            cdsParcelasOrigemCD_CONTA.AsInteger;
         cdsParcelasDivididasPtrItemPlano.AsInteger :=
            cdsParcelasOrigemPtrItemPlano.AsInteger;
      end;
      cdsParcelasOrigem.Next;
   end;
   
   if cdsParcelasDivididas.State = dsInsert then
   begin
      cdsParcelasDivididas.Post;
   end;

   cdsParcelasOrigem.EnableControls;
   cdsParcelasDivididas.EnableControls;
end;

procedure TfMatricularDivisaoTitulos.AplicaDivisaoProgramada;
begin
   cdsParcelasOrigem.DisableControls;
   cdsParcelasOrigem.First;
   while not cdsParcelasOrigem.Eof do
   begin
      if (cdsParcelasOrigemNR_PARCELA.AsInteger >=
          qryDivisaoProgramadaNR_PARC_INICIO.AsInteger) and
         (cdsParcelasOrigemNR_PARCELA.AsInteger <=
          qryDivisaoProgramadaNR_PARC_FIM.AsInteger) then
      begin
         if qryTiposTituloDivisao.Locate('CD_TIPO_TITULO',
               cdsParcelasOrigemCD_TIPO_TITULO.AsInteger, []) then
         begin
            cdsParcelasOrigem.Edit;
            cdsParcelasOrigemSN_SELECIONADA.AsBoolean := True;
         end;
      end;
      cdsParcelasOrigem.Next;
   end;
   
   if cdsParcelasOrigem.State = dsEdit then
   begin
      cdsParcelasOrigem.Post;
   end;

   if not (cdsResponsavel.State in dsEditModes) then
   begin
      cdsResponsavel.Edit;
   end;
   cdsResponsavelCD_RESPONSAVEL.AsInteger :=
      qryDivisaoProgramadaCD_RESPONSAVEL.AsInteger;
   cdsResponsavelNM_RESPONSAVEL.AsString :=
      qryDivisaoProgramadaNM_RESPONSAVEL.AsString;
   cdsResponsavelVL_PERCENTUAL.AsCurrency :=
      qryDivisaoProgramadaVL_PERCENTUAL.AsCurrency;
   cdsResponsavel.Post;

   AplicaDivisao;
   cdsParcelasOrigem.EnableControls;
end;

procedure TfMatricularDivisaoTitulos.dbePercentualResponsavelKeyPress(
  Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      sbAplicar.Click;
   end;
end;

procedure TfMatricularDivisaoTitulos.dbgParcelasOrigemCellClick(
  Column: TColumn);
begin
   if Column.Field.DataType = ftBoolean then
   begin
      Column.Grid.DataSource.DataSet.Edit;
      Column.Field.AsBoolean := not Column.Field.AsBoolean;
      Column.Grid.DataSource.DataSet.Post;
   end;
end;

procedure TfMatricularDivisaoTitulos.dbgParcelasOrigemDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const
   IsChecked: array [Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
   DrawRect: TRect;
begin
   if Column.FieldName = 'SN_SELECIONADA' then
   begin
      DrawRect := Rect;
      InflateRect(DrawRect, -1, -1);
      dbgParcelasOrigem.Canvas.FillRect(Rect);
      DrawFrameControl(dbgParcelasOrigem.Canvas.Handle, DrawRect, DFC_BUTTON,
         IsChecked[Column.Field.AsBoolean]);
   end;
end;

procedure TfMatricularDivisaoTitulos.dbgParcelasOrigemTitleClick(
  Column: TColumn);
begin
   if Column.FieldName = 'SN_SELECIONADA' then
   begin
      cdsParcelasOrigem.DisableControls;
      cdsParcelasOrigem.First;
      while not cdsParcelasOrigem.Eof do
      begin
         cdsParcelasOrigem.Edit;
         cdsParcelasOrigemSN_SELECIONADA.AsBoolean :=
            not cdsParcelasOrigemSN_SELECIONADA.AsBoolean;
         cdsParcelasOrigem.Post;
         
         cdsParcelasOrigem.Next;
      end;
      cdsParcelasOrigem.EnableControls;
   end;
end;

procedure TfMatricularDivisaoTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TfMatricularDivisaoTitulos.FormCreate(Sender: TObject);
var
   S: string;
begin
   S := DM.variavel_parametro('divisao_titulos.dividir_desconto_condicional');
   S := UpperCase(S);

   FDividirCondicional := S = 'S';

   S := DM.variavel_parametro('divisao_titulos.dividir_desconto_fixo');
   S := UpperCase(S);

   FDividirFixo := S = 'S';
end;

procedure TfMatricularDivisaoTitulos.FormDestroy(Sender: TObject);
begin
   cdsResponsavel.Close;
   cdsParcelasOrigem.Close;
   cdsParcelasDivididas.Close;
end;

procedure TfMatricularDivisaoTitulos.sbAplicarClick(Sender: TObject);
const
   STitInfo = 'Informação';
   SMsgSemParcSel = 'Nenhuma parcela selecionada para realizar a divisão de títulos.';
begin
   cdsParcelasOrigem.DisableControls;
   cdsParcelasOrigem.Filter := 'SN_SELECIONADA';
   cdsParcelasOrigem.Filtered := True;
   
   if cdsParcelasOrigem.IsEmpty then
   begin
      MessageBox(Handle, SMsgSemParcSel, STitInfo, MB_ICONINFORMATION or MB_OK);
      cdsParcelasOrigem.Filtered := False;
      cdsParcelasOrigem.EnableControls;
   end
   else
   begin
      cdsParcelasOrigem.Filtered := False;
      cdsParcelasOrigem.EnableControls;
      
      if cdsResponsavel.State in dsEditModes then
      begin
         cdsResponsavel.Post;
      end;
      if cdsParcelasOrigem.State = dsEdit then
      begin
         cdsParcelasOrigem.Post;
      end;
      AplicaDivisao;

      bbtnConfirmar.Enabled := (not cdsResponsavelCD_RESPONSAVEL.IsNull) and
         (not cdsResponsavelVL_PERCENTUAL.IsNull);
   end;
end;

procedure TfMatricularDivisaoTitulos.sbSelRespClick(Sender: TObject);
var
   resultado_filtro : TResultadoFiltroPessoa;
begin
   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa);

   if resultado_filtro.filtrado then
   begin
      if not (cdsResponsavel.State in dsEditModes) then
         cdsResponsavel.Edit;
      
      cdsResponsavelCD_RESPONSAVEL.AsInteger := resultado_filtro.cd_pessoa;
      cdsResponsavelNM_RESPONSAVEL.AsString := resultado_filtro.nm_pessoa;
   end;
end;

end.
