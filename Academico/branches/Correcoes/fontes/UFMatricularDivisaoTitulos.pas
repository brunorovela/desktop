unit UFMatricularDivisaoTitulos;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Mask,
   Buttons, ZAbstractRODataset, UZDataset, UMAjuda, General, DateUtils;

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
    cdsParcelasOrigemvl_credito: TCurrencyField;
    cdsParcelasDivididasVL_CREDITO: TCurrencyField;
    cbManterDesc: TCheckBox;
    qryDivisaoProgramadasn_manter_desconto_fixo: TSmallintField;
    UMAjuda1: TUMAjuda;
    rbAplicaBruto: TRadioButton;
    rbAplicaLiquido: TRadioButton;
    qryDivisaoProgramadanr_forma_aplicar_divisao: TSmallintField;
    cdsParcelasOrigemIDX_PARCELA: TIntegerField;
    cdsDescontos: TClientDataSet;
    cdsDescontosVL_DESCONTO: TCurrencyField;
    cdsDescontosCD_ACAO_MOVIMENTO: TIntegerField;
    cdsDescontosCD_TIPO_DESCONTO: TIntegerField;
    cdsDescontosCD_TIPO_COMPORTAMENTO: TIntegerField;
    cdsDescontosDS_OBSERVACAO: TStringField;
    cdsDescontosIDX_PARCELA: TIntegerField;
    cdsDescontosSN_DESCONTO_PLANO: TIntegerField;
    cdsDescontosDivididos: TClientDataSet;
    cdsParcelasDivididasVL_PERCENTUAL_DIVISAO: TCurrencyField;
    cdsParcelasDivididasIDX_PARCELA: TIntegerField;
    cdsDescontosDivididosVL_DESCONTO: TCurrencyField;
    cdsDescontosDivididosCD_ACAO_MOVIMENTO: TIntegerField;
    cdsDescontosDivididosCD_TIPO_DESCONTO: TIntegerField;
    cdsDescontosDivididosCD_TIPO_COMPORTAMENTO: TIntegerField;
    cdsDescontosDivididosDS_OBSERVACAO: TStringField;
    cdsDescontosDivididosIDX_PARCELA: TIntegerField;
    cdsDescontosDivididosSN_DESCONTO_PLANO: TIntegerField;
    qryDivisaoProgramadaCD_TIPO_TITULO: TIntegerField;
    qryDivisaoProgramadaCD_COLIGADA_MATRIZ: TIntegerField;
    qryDivisaoProgramadaSN_ALTERAR_TIPO_TITULO: TSmallintField;
    qryDivisaoProgramadaSN_ALTERAR_VENCTO: TSmallintField;
    qryDivisaoProgramadaDT_VENCTO_INICIAL: TDateField;
    qryDivisaoProgramadaDS_TIPO_TITULO: TStringField;
    qryDivisaoProgramadaSN_DIVIDIR_DESCONTO_CONDICIONAL: TSmallintField;
    procedure cbManterDescClick(Sender: TObject);
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
      nrIdxProxParcela: Integer;
      FIndexParcelaResp: Cardinal;
      procedure DividirValoresParcelaResponsavel(indiceDivisao: Currency);
      procedure DividirValoresParcelaAluno(indiceDivisao: Currency);
      procedure InserirNovaParcelaDividida;
      procedure DividirDescontosCondicionais(idxParcela: String; idxNovo: Integer; indiceDivisao, vlTotalCondicional: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
      procedure DividirDescontosFixos(idxParcela: String; idxNovo: Integer; indiceDivisao, vlTotalFixo: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
      function GetNrIdxProxParcela(): Integer;
      function GetDescontoFixoPlanoPagamento(idxParcela: String): Currency;
      function GetDescontoCondicionalPlanoPagamento(idxParcela: String): Currency;
      procedure DividirDescontos();
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

procedure TfMatricularDivisaoTitulos.InserirNovaParcelaDividida;
begin

   // Insere uma nova parcela dividida, inicialmente seus valores são iguais a parcela original
   // possui um percentual de divisão de 100% (valor integral)
   cdsParcelasDivididas.Insert;
   cdsParcelasDivididasIDX_PARCELA.AsInteger := cdsParcelasOrigemIDX_PARCELA.AsInteger;
   cdsParcelasDivididasVL_PERCENTUAL_DIVISAO.AsCurrency := 100;
   cdsParcelasDivididasCD_TIPO_TITULO.AsInteger := cdsParcelasOrigemCD_TIPO_TITULO.AsInteger;
   cdsParcelasDivididasDS_TIPO_TITULO.AsString := cdsParcelasOrigemDS_TIPO_TITULO.AsString;
   cdsParcelasDivididasNR_PARCELA.AsInteger := cdsParcelasOrigemNR_PARCELA.AsInteger;
   cdsParcelasDivididasDT_VENCTO.AsDateTime := cdsParcelasOrigemDT_VENCTO.AsDateTime;
   cdsParcelasDivididasVL_BRUTO.AsCurrency := cdsParcelasOrigemVL_BRUTO.AsCurrency;
   cdsParcelasDivididasVL_CREDITO.AsCurrency := cdsParcelasOrigemVL_CREDITO.AsCurrency;
   cdsParcelasDivididasVL_BOLSA.AsCurrency := cdsParcelasOrigemVL_BOLSA.AsCurrency;
   cdsParcelasDivididasVL_EXTRA.AsCurrency := cdsParcelasOrigemVL_EXTRA.AsCurrency;
   cdsParcelasDivididasVL_DESCONTO.AsCurrency := cdsParcelasOrigemVL_DESCONTO.AsCurrency;
   cdsParcelasDivididasCD_RESPONSAVEL.AsInteger := cdsParcelasOrigemCD_RESPONSAVEL.AsInteger;
   cdsParcelasDivididasNM_RESPONSAVEL.AsString := cdsParcelasOrigemNM_RESPONSAVEL.AsString;
   cdsParcelasDivididasCD_CONTA.AsInteger := cdsParcelasOrigemCD_CONTA.AsInteger;
   cdsParcelasDivididasPtrItemPlano.AsInteger := cdsParcelasOrigemPtrItemPlano.AsInteger;

end;

procedure TfMatricularDivisaoTitulos.DividirValoresParcelaAluno(indiceDivisao: Currency);
var
   vlDescFixoPlano, vlDescCondPlano, percentualCondicional: Currency;
begin

   // Define o percentual de divisão do aluno (100% - o percentual do responsável)
   cdsParcelasDivididasVL_PERCENTUAL_DIVISAO.AsCurrency := (100 - cdsResponsavelVL_PERCENTUAL.AsCurrency);

   // Cálcula o indice de divisão do responsável
   indiceDivisao := 1 - indiceDivisao;

   {
      Verifica se NÃO deve manter o desconto fixo na parcela do aluno
      Nesse caso divide o desconto fixo entre o aluno e responsável
   }
   if not cbManterDesc.Checked then
   begin
      // Divide o desconto condicional
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := cdsParcelasDivididasVL_DESCONTO.AsCurrency - RoundFloat(cdsParcelasDivididasVL_DESCONTO.AsCurrency * indiceDivisao, 2);
      // Divide o valor do desconto fixo
      cdsParcelasDivididasVL_BOLSA.AsCurrency := cdsParcelasDivididasVL_BOLSA.AsCurrency - RoundFloat(cdsParcelasDivididasVL_BOLSA.AsCurrency * indiceDivisao, 2);
      // Divide o valor do desconto bruto
      cdsParcelasDivididasVL_BRUTO.AsCurrency := cdsParcelasDivididasVL_BRUTO.AsCurrency - RoundFloat(cdsParcelasDivididasVL_BRUTO.AsCurrency * indiceDivisao, 2);      
   end;

   {
      Verifica se deve manter o desconto fixo na parcela do aluno
      Nesse caso existem duas opções de cálculo, sendo:
      - aplicação do desconto fixo sobre o valor bruto
      - aplicação do desconto fixo sobre o valor liquido
   }
   if cbManterDesc.Checked then
   begin

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto aluno = Bruto - (Bruto * indice)
      }
      if rbAplicaBruto.Checked then
      begin
         cdsParcelasDivididasVL_BRUTO.AsCurrency := cdsParcelasDivididasVL_BRUTO.AsCurrency - RoundFloat(cdsParcelasDivididasVL_BRUTO.AsCurrency*indiceDivisao, 2);
      end;

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto aluno = Bruto - ((Bruto - Fixo) * indice)
      }
      if rbAplicaLiquido.Checked then
      begin
         if qryDivisaoProgramadaSN_DIVIDIR_DESCONTO_CONDICIONAL.AsInteger = 1 then
         begin
            cdsParcelasDivididasVL_BRUTO.AsCurrency :=
               cdsParcelasOrigemVL_BRUTO.AsCurrency -
               RoundFloat(((
                  cdsParcelasOrigemVL_BRUTO.AsCurrency -
                  cdsParcelasOrigemVL_BOLSA.AsCurrency -
                  cdsParcelasOrigemVL_DESCONTO.AsCurrency
                  ) * indiceDivisao), 2);
         end;

         if qryDivisaoProgramadaSN_DIVIDIR_DESCONTO_CONDICIONAL.AsInteger = 0 then
         begin
            cdsParcelasDivididasVL_BRUTO.AsCurrency :=
               cdsParcelasOrigemVL_BRUTO.AsCurrency - RoundFloat(((cdsParcelasOrigemVL_BRUTO.AsCurrency - cdsParcelasOrigemVL_BOLSA.AsCurrency)*indiceDivisao), 2);
         end;
      end;

      //Mantem os descontos totais na parcela do aluno nesta opção

      //Valida para os descontos somados não passarem do valor da parcela
      if(cdsParcelasDivididasVL_BOLSA.AsCurrency + cdsParcelasDivididasVL_DESCONTO.AsCurrency) > cdsParcelasDivididasVL_BRUTO.AsCurrency then
      begin

         //Percentual do condicional no bruto
         percentualCondicional := ((100 * cdsParcelasDivididasVL_DESCONTO.AsCurrency) / cdsParcelasDivididasVL_BRUTO.AsCurrency);

         if(percentualCondicional > 100) then
         begin
            percentualCondicional := 100;
         end;

         //Calculo do novo condicional
         cdsParcelasDivididasVL_DESCONTO.AsCurrency := ((cdsParcelasDivididasVL_BRUTO.AsCurrency - cdsParcelasDivididasVL_BOLSA.AsCurrency) * (percentualCondicional/100));
      end;
   end;

   // Divide o valor dos créditos
   cdsParcelasDivididasVL_CREDITO.AsCurrency := cdsParcelasOrigemVL_CREDITO.AsCurrency - (cdsParcelasOrigemVL_CREDITO.AsCurrency * indiceDivisao);
   // Divide o valor extra
   cdsParcelasDivididasVL_EXTRA.AsCurrency := cdsParcelasOrigemVL_EXTRA.AsCurrency - RoundFloat(cdsParcelasOrigemVL_EXTRA.AsCurrency * indiceDivisao, 2);

   {
      Verifica se o valor da bolsa é maior que o valor da parcela do aluno
      Nesse caso ajusta o valor da bolsa para o valor da parcela
      Zera o desconto condicional da parcela
   }
   if cdsParcelasDivididasVL_BOLSA.AsCurrency >= (cdsParcelasDivididasVL_BRUTO.AsCurrency+cdsParcelasDivididasVL_EXTRA.AsCurrency) then
   begin
      cdsParcelasDivididasVL_BOLSA.AsCurrency := (cdsParcelasDivididasVL_BRUTO.AsCurrency+cdsParcelasDivididasVL_EXTRA.AsCurrency);
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := 0;
   end;

end;

procedure TfMatricularDivisaoTitulos.DividirValoresParcelaResponsavel(indiceDivisao: Currency);

   function GetDataVencto: TDate;
   var
      Start: TDate;
      Holiday: Boolean;
      Year, Month, NewMonth, Day, DayWeek: Word;
   begin
      Result := qryDivisaoProgramadaDT_VENCTO_INICIAL.AsDateTime;

      if FIndexParcelaResp > 0 then
      begin

         Start := Result;

         Result := IncMonth(Result, FIndexParcelaResp);
         DecodeDate(Result, Year, Month, Day);
         NewMonth := Month;

         DayWeek := DayOfWeek(Result);
         Holiday := DM.getFeriado(Result);

         while (DayWeek in [1, 7]) or Holiday do
         begin

            Result := IncDay(Result, 1);
            DecodeDate(Result, Year, NewMonth, Day);

            if NewMonth <> Month then
               Break;

            DayWeek := DayOfWeek(Result);
            Holiday := DM.getFeriado(Result);
         end;

         if NewMonth <> Month then
         begin

            Result := IncMonth(Start, FIndexParcelaResp);
            DayWeek := DayOfWeek(Result);
            Holiday := DM.getFeriado(Result);

            while (DayWeek in [1, 7]) or Holiday do
            begin

               Result := IncDay(Result, -1);
               DecodeDate(Result, Year, NewMonth, Day);

               if NewMonth <> Month then
                  Break;

               DayWeek := DayOfWeek(Result);
               Holiday := DM.getFeriado(Result);
            end;
         end;

         if NewMonth <> Month then
         begin
            Result := Start;
         end;
      end;

      Inc(FIndexParcelaResp);
   end;

var
   vlDescFixoPlano, vlDescCondPlano: Currency;
begin

   // Verifica se a programação de descontos está configurada
   // para alterar o tipo de título das parcelas divididas

   if (qryDivisaoProgramadaSN_ALTERAR_TIPO_TITULO.AsInteger = 1) and
      (not qryDivisaoProgramadaCD_TIPO_TITULO.IsNull) and
      (not qryDivisaoProgramadaCD_COLIGADA_MATRIZ.IsNull) then
   begin

      // Altera o tipo de título da parcela dividida do responsável

      cdsParcelasDivididasCD_TIPO_TITULO.AsInteger :=
         qryDivisaoProgramadaCD_TIPO_TITULO.AsInteger;
      cdsParcelasDivididasDS_TIPO_TITULO.AsString :=
         qryDivisaoProgramadaDS_TIPO_TITULO.AsString;
   end;

   // Verifica se a programação de descontos está configurada
   // para alterar a data de vencimento das parcelas divididas

   if (qryDivisaoProgramadaSN_ALTERAR_VENCTO.AsInteger = 1) and
      (not qryDivisaoProgramadaDT_VENCTO_INICIAL.IsNull) then
   begin

      // Altera a data de vencimento da parcela dividida do responsável
      cdsParcelasDivididasDT_VENCTO.AsDateTime := GetDataVencto;
   end;

   // Define o percentual de divisão do responsável
   cdsParcelasDivididasVL_PERCENTUAL_DIVISAO.AsCurrency := cdsResponsavelVL_PERCENTUAL.AsCurrency;

   // Define o novo responsável
   cdsParcelasDivididasCD_RESPONSAVEL.AsInteger := cdsResponsavelCD_RESPONSAVEL.AsInteger;
   cdsParcelasDivididasNM_RESPONSAVEL.AsString := cdsResponsavelNM_RESPONSAVEL.AsString;

   {
      Verifica se NÃO deve manter o desconto fixo na parcela do responsavel
      Nesse caso divide o desconto fixo entre o aluno e responsável
   }
   if not cbManterDesc.Checked then
   begin
      // Divide o valor do desconto condicional
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := RoundFloat(cdsParcelasDivididasVL_DESCONTO.AsCurrency * indiceDivisao, 2);
      // Divide o valor do desconto fixo
      cdsParcelasDivididasVL_BOLSA.AsCurrency := RoundFloat(cdsParcelasDivididasVL_BOLSA.AsCurrency * indiceDivisao, 2);
      // Divide o valor do desconto bruto
      cdsParcelasDivididasVL_BRUTO.AsCurrency := RoundFloat(cdsParcelasDivididasVL_BRUTO.AsCurrency * indiceDivisao, 2);
   end;

   {
      Verifica se deve manter o desconto fixo na parcela do aluno
      Nesse caso existem duas opções de cálculo, sendo:
      - aplicação do desconto fixo sobre o valor bruto
      - aplicação do desconto fixo sobre o valor liquido
   }
   if cbManterDesc.Checked then
   begin

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto responsavel = Bruto * indice
      }
      if rbAplicaBruto.Checked then
      begin
         cdsParcelasDivididasVL_BRUTO.AsCurrency := RoundFloat(cdsParcelasDivididasVL_BRUTO.AsCurrency*indiceDivisao, 2);
      end;

      {
         Aplicando o fixo sobre o valor liquido
         Cálculo novo bruto responsavel = ((Bruto - Fixo) * indice)
      }
      if rbAplicaLiquido.Checked then
      begin
         if qryDivisaoProgramadaSN_DIVIDIR_DESCONTO_CONDICIONAL.AsInteger = 0 then
         begin
            cdsParcelasDivididasVL_BRUTO.AsCurrency :=
               RoundFloat(((cdsParcelasOrigemVL_BRUTO.AsCurrency - cdsParcelasOrigemVL_BOLSA.AsCurrency)*indiceDivisao), 2);
         end;

         if qryDivisaoProgramadaSN_DIVIDIR_DESCONTO_CONDICIONAL.AsInteger = 1 then
         begin
            cdsParcelasDivididasVL_BRUTO.AsCurrency :=
               RoundFloat(((
                  cdsParcelasOrigemVL_BRUTO.AsCurrency -
                  cdsParcelasOrigemVL_BOLSA.AsCurrency -
                  cdsParcelasOrigemVL_DESCONTO.AsCurrency
                  ) * indiceDivisao), 2);
         end;
      end;

      //Os desconto devem ser mantidos na parcela do aluno
      cdsParcelasDivididasVL_BOLSA.AsCurrency := 0;
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := 0;
   end;

   // Divide o valor dos créditos
   cdsParcelasDivididasVL_CREDITO.AsCurrency := cdsParcelasOrigemVL_CREDITO.AsCurrency * indiceDivisao;
   // Divide o valor extra
   cdsParcelasDivididasVL_EXTRA.AsCurrency := RoundFloat(cdsParcelasOrigemVL_EXTRA.AsCurrency * indiceDivisao, 2);

   {
      Verifica se o valor da bolsa é maior que o valor da parcela do responsável
      Nesse caso ajusta o valor da bolsa para o valor da parcela
      Zera o desconto condicional da parcela
   }
   if cdsParcelasDivididasVL_BOLSA.AsCurrency >= (cdsParcelasDivididasVL_BRUTO.AsCurrency+cdsParcelasDivididasVL_EXTRA.AsCurrency) then
   begin
      cdsParcelasDivididasVL_BOLSA.AsCurrency := (cdsParcelasDivididasVL_BRUTO.AsCurrency+cdsParcelasDivididasVL_EXTRA.AsCurrency);
      cdsParcelasDivididasVL_DESCONTO.AsCurrency := 0;
   end;

end;

procedure TfMatricularDivisaoTitulos.AplicaDivisao;
var
   indiceDivisao, DescontoExtra, DescontoCond: Currency;
   pularParcela : Boolean;
begin
   FIndexParcelaResp := 0;

   // Cálcula o indice de divisão da parcela
   indiceDivisao := cdsResponsavelVL_PERCENTUAL.AsCurrency / 100;

   cdsParcelasDivididas.DisableControls;
   cdsParcelasDivididas.EmptyDataSet;
   
   cdsParcelasOrigem.DisableControls;
   cdsParcelasOrigem.First;

   while not cdsParcelasOrigem.Eof do
   begin

      { Se a parcela NÃO foi selecionada ou
         o valor dos descontos é maior/igual o valor total da parcela  }
      pularParcela := not cdsParcelasOrigemSN_SELECIONADA.AsBoolean or
         (cdsParcelasOrigemVL_BOLSA.AsCurrency >= (cdsParcelasOrigemVL_BRUTO.AsCurrency + cdsParcelasOrigemVL_EXTRA.AsCurrency));

      { Se o indice de divisão NÃO for de 100% OU
        se a parcela NÃO foi selecionada (Neste caso deve gerar a parcela para o aluno para manter como estava) }
      if (indiceDivisao <> 1) OR (pularParcela) then
      begin
         // Insere a nova parcela dividida para o aluno
         InserirNovaParcelaDividida();
      end;

      // Passa para a próxima parcela
      if pularParcela then
      begin
         cdsParcelasOrigem.Next;
         continue;         
      end;

      {
         Quando o percentual de divisão NÃO for 100% cria a parcela do aluno
         Pois um percentual de 100% significa que o aluno ficará sem essa parcela
      }
      if indiceDivisao <> 1 then
      begin

         // Dividir os valores para a parcela do aluno
         DividirValoresParcelaAluno( 1-indiceDivisao );

         // Salva a parcela do aluno que já foi criada e dividida
         cdsParcelasDivididas.Post;
      end;

      // Insere a nova parcela dividida para o responsável
      InserirNovaParcelaDividida();

      // Dividir os valores para a parcela do responsável
      DividirValoresParcelaResponsavel( indiceDivisao );

      // Salva a parcela do responsável que já foi criada e dividida
      cdsParcelasDivididas.Post;

      
      cdsParcelasOrigem.Next;
   end;

   cdsParcelasOrigem.EnableControls;
   cdsParcelasDivididas.EnableControls;

   // Dividir os descontos (ações de movimento) das parcelas
   DividirDescontos();
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

procedure TfMatricularDivisaoTitulos.cbManterDescClick(Sender: TObject);
begin
   rbAplicaBruto.Enabled := cbManterDesc.Checked;
   rbAplicaLiquido.Enabled := cbManterDesc.Checked;
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
   if (Column.Field.DataType = ftBoolean) and (not cdsParcelasOrigem.ReadOnly) then
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
begin
   {
      Inicializa o número de indice da próxima parcela como sendo 1
      Esse nrIdxProxParcela é um número que será utilizado para linkar a parcela gerada no clientDataSet cdsParcelas
      com todos os descontos aplicados a essa parcela (que gerarão fin_mov_cr) que estão no clientDataSet cdsDescontos
      A variável é incrementada sempre que seu valor atual é pego
   }
   nrIdxProxParcela := 1;
end;

procedure TfMatricularDivisaoTitulos.FormDestroy(Sender: TObject);
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

procedure TfMatricularDivisaoTitulos.sbAplicarClick(Sender: TObject);
const
   STitInfo = 'Informação';
   SMsgSemParcSel = 'Nenhuma parcela selecionada para realizar a divisão de títulos.';
begin
   if not(dbePercentualResponsavel.Text <> '') or
      not(StrToFloat(dbePercentualResponsavel.Text) > 0) or
      not(StrToFloat(dbePercentualResponsavel.Text) <= 100) then
   begin
      Mensagem(
         'Por favor digite um percentual de divisão válido!',
         'Aviso',
         MB_ICONEXCLAMATION + MB_OK,
         Handle
      );
      
      Exit;
   end;

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

{
   Retorna o total do desconto fixo do plano de pagamento
}
function TFMatricularDivisaoTitulos.GetDescontoFixoPlanoPagamento(idxParcela: String): Currency;
begin

   Result := 0;

   // Filtra apenas os descontos FIXOS (CD_TIPO_DESCONTO = 2) da parcela
   // Descontos do plano de pagamento (SN_DESCONTO_PLANO = 1)
   cdsDescontos.Filter := 'IDX_PARCELA = '+idxParcela+' AND CD_TIPO_DESCONTO = 2 AND SN_DESCONTO_PLANO = 1';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;
   while not cdsDescontos.Eof do
   begin
      // Soma o total de descontos fixos do plano de pagamento
      Result := Result + cdsDescontosVL_DESCONTO.AsCurrency;

      cdsDescontos.Next;
   end;

end;

{
   Retorna o total do desconto condicional do plano de pagamento
}
function TFMatricularDivisaoTitulos.GetDescontoCondicionalPlanoPagamento(idxParcela: String): Currency;
begin

   Result := 0;

   // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela
   // Descontos do plano de pagamento (SN_DESCONTO_PLANO = 1)
   cdsDescontos.Filter := 'IDX_PARCELA = '+idxParcela+' AND CD_TIPO_DESCONTO = 1 AND SN_DESCONTO_PLANO = 1';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;
   while not cdsDescontos.Eof do
   begin
      // Soma o total de descontos condicionais do plano de pagamento
      Result := Result + cdsDescontosVL_DESCONTO.AsCurrency;

      cdsDescontos.Next;
   end;

end;

procedure TFMatricularDivisaoTitulos.DividirDescontos();
var
   idxNovo: Integer;
   indiceDivisao: Currency;
   iParcela: Pointer;
   bParcelaAluno: Boolean;
begin

   cdsParcelasDivididas.First;
   while not cdsParcelasDivididas.Eof do
   begin
           
      // Define o novo index da parcela (vinculo entre parcela e o desconto)
      idxNovo := GetNrIdxProxParcela();

      // Cálcula o indice de divisão da parcela
      indiceDivisao := (cdsParcelasDivididasVL_PERCENTUAL_DIVISAO.AsCurrency / 100);

      // Verifica se a parcela é do aluno
      bParcelaAluno := not (cdsParcelasDivididasCD_RESPONSAVEL.AsInteger = cdsResponsavelCD_RESPONSAVEL.AsInteger);

      { Verifica se a parcela dividida possui desconto fixo (se não zerou)
        Verifica se o indice de divisão é maior que zero, nesse caso divide os descontos fixos }
      if (cdsParcelasDivididasVL_BOLSA.AsCurrency > 0) and (indiceDivisao > 0) then
      begin
         // Dividir os descontos fixos
         DividirDescontosFixos(cdsParcelasDivididasIDX_PARCELA.AsString, idxNovo, indiceDivisao, cdsParcelasDivididasVL_BOLSA.AsCurrency, cbManterDesc.Checked, bParcelaAluno);
      end;

      { Verifica se a parcela dividida possui desconto condicional (se não zerou)
        Verifica se o indice de divisão é maior que zero, nesse caso divide os descontos condicionais }
      if (cdsParcelasDivididasVL_DESCONTO.AsCurrency > 0) and
         (indiceDivisao > 0) then
      begin
         DividirDescontosCondicionais(cdsParcelasDivididasIDX_PARCELA.AsString, idxNovo, indiceDivisao, cdsParcelasDivididasVL_DESCONTO.AsCurrency, cbManterDesc.Checked, bParcelaAluno);
      end;

      // Grava a posição atual que está sendo percorrida
      iParcela := cdsParcelasDivididas.GetBookmark;

      // Atualiza o indice da parcela dividida para o novo indice gerado
      cdsParcelasDivididas.Edit;
      cdsParcelasDivididasIDX_PARCELA.AsInteger := idxNovo;
      cdsParcelasDivididas.Post;

      // Verifica se a posição que será restaurada é valida,
      // nesse caso volta a posição que estava sendo percorrida
      if cdsParcelasDivididas.BookmarkValid(iParcela) then
      begin
         cdsParcelasDivididas.GotoBookmark(iParcela);
      end;
      
      cdsParcelasDivididas.Next;
   end;

end;

{
   Divide os descontos fixos do título entre o responsável e o aluno,
   utilizando o indice de percentual da divisão
}
procedure TFMatricularDivisaoTitulos.DividirDescontosFixos(idxParcela: String; idxNovo: Integer; indiceDivisao, vlTotalFixo: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
var
   somaDescontosFixos: Currency;
   bDescontoPlano: Boolean;
begin

   somaDescontosFixos := 0;

   // Filtra apenas os descontos FIXOS (CD_TIPO_DESCONTO = 2) da parcela
   cdsDescontos.Filter := 'IDX_PARCELA = '+idxParcela+' AND CD_TIPO_DESCONTO = 2';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;
   while not cdsDescontos.Eof do
   begin

      // Verifica se o desconto fixo é do plano de pagamento (esse desconto sempre divide)
      bDescontoPlano := (cdsDescontosSN_DESCONTO_PLANO.AsInteger = 1);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do responsável (não aluno)
      if (not bDescontoPlano) and bManterDescontoAluno and (not bParcelaAluno) then
      begin
         // Não insere o desconto para o responsável nesse caso
         cdsDescontos.Next;
         // Avança para o próximo desconto
         continue;
      end;

      // Cria o desconto novo (dividido)
      cdsDescontosDivididos.Insert;

      // Atualiza o valor do desconto
      cdsDescontosDivididosVL_DESCONTO.AsCurrency := RoundFloat(cdsDescontosVL_DESCONTO.AsCurrency*indiceDivisao, 2);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do aluno
      if (not bDescontoPlano) and bManterDescontoAluno and bParcelaAluno then
      begin
         // Mantém o desconto integral para o aluno (sem dividir ele)
         cdsDescontosDivididosVL_DESCONTO.AsCurrency := cdsDescontosVL_DESCONTO.AsCurrency;
      end;

      {
         Se for a última ação de movimento o cálculo é o total - acumulado da soma dos fixos até aqui
         para tratar diferença de centavos devido a números quebrados na última ação de movimento
      }
      if cdsDescontos.RecNo = cdsDescontos.RecordCount then
      begin
         // Atualiza o valor do desconto
         cdsDescontosDivididosVL_DESCONTO.AsCurrency := vlTotalFixo - somaDescontosFixos;
      end;

      // Faz um acumulo dos valores dos descontos fixo (para tratar números quebrados na ultima ação de movimento
      somaDescontosFixos := somaDescontosFixos + cdsDescontosDivididosVL_DESCONTO.AsCurrency;

      cdsDescontosDivididosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosDivididosCD_TIPO_DESCONTO.AsInteger := cdsDescontosCD_TIPO_DESCONTO.AsInteger;
      cdsDescontosDivididosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger;
      cdsDescontosDivididosDS_OBSERVACAO.AsString := cdsDescontosDS_OBSERVACAO.AsString;
      cdsDescontosDivididosIDX_PARCELA.AsInteger := idxNovo;
      cdsDescontosDivididosSN_DESCONTO_PLANO.AsInteger := cdsDescontosSN_DESCONTO_PLANO.AsInteger;
      cdsDescontosDivididos.Post;

      cdsDescontos.Next;
   end;

end;

{
   Divide os descontos condicionais do título entre o responsável e o aluno,
   utilizando o indice de percentual da divisão
}
procedure TFMatricularDivisaoTitulos.DividirDescontosCondicionais(idxParcela: String; idxNovo: Integer; indiceDivisao, vlTotalCondicional: Currency; bManterDescontoAluno, bParcelaAluno: Boolean);
var
   somaDescontosCondicionais: Currency;
   bDescontoPlano: Boolean;
begin

   somaDescontosCondicionais := 0;

   // Filtra apenas os descontos CONDICIONAIS (CD_TIPO_DESCONTO = 1) da parcela
   cdsDescontos.Filter := 'IDX_PARCELA = '+idxParcela+' AND CD_TIPO_DESCONTO = 1';
   cdsDescontos.Filtered := true;
   cdsDescontos.First;
   while not cdsDescontos.Eof do
   begin

      // Verifica se o desconto condicional é do plano de pagamento (esse desconto sempre divide)
      bDescontoPlano := (cdsDescontosSN_DESCONTO_PLANO.AsInteger = 1);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do responsável (não aluno)
      if (not bDescontoPlano) and bManterDescontoAluno and (not bParcelaAluno) then
      begin
         // Não insere o desconto para o responsável nesse caso
         cdsDescontos.Next;
         // Avança para o próximo desconto
         continue;
      end;

      // Cria o desconto novo (dividido)
      cdsDescontosDivididos.Insert;

      // Atualiza o valor do desconto
      cdsDescontosDivididosVL_DESCONTO.AsCurrency := RoundFloat(cdsDescontosVL_DESCONTO.AsCurrency*indiceDivisao, 2);

      // Se não for um desconto do plano de pagamento e
      // Deve-se manter o desconto na parcela do aluno
      // E está dividindo uma parcela do aluno
      if (not bDescontoPlano) and bManterDescontoAluno and bParcelaAluno then
      begin
         // Mantém o desconto integral para o aluno (sem dividir ele)
         cdsDescontosDivididosVL_DESCONTO.AsCurrency := cdsDescontosVL_DESCONTO.AsCurrency;
      end;

      {
         Se for a última ação de movimento o cálculo é o total - acumulado da soma dos fixos até aqui
         para tratar diferença de centavos devido a números quebrados na última ação de movimento
      }
      if cdsDescontos.RecNo = cdsDescontos.RecordCount then
      begin
         // Atualiza o valor do desconto
         cdsDescontosDivididosVL_DESCONTO.AsCurrency := vlTotalCondicional - somaDescontosCondicionais;
      end;

      // Faz um acumulo dos valores dos descontos condicional (para tratar números quebrados na ultima ação de movimento
      somaDescontosCondicionais := somaDescontosCondicionais + cdsDescontosDivididosVL_DESCONTO.AsCurrency;

      cdsDescontosDivididosCD_ACAO_MOVIMENTO.AsInteger := cdsDescontosCD_ACAO_MOVIMENTO.AsInteger;
      cdsDescontosDivididosCD_TIPO_DESCONTO.AsInteger := cdsDescontosCD_TIPO_DESCONTO.AsInteger;
      cdsDescontosDivididosCD_TIPO_COMPORTAMENTO.AsInteger := cdsDescontosCD_TIPO_COMPORTAMENTO.AsInteger;
      cdsDescontosDivididosDS_OBSERVACAO.AsString := cdsDescontosDS_OBSERVACAO.AsString;
      cdsDescontosDivididosIDX_PARCELA.AsInteger := idxNovo;
      cdsDescontosDivididosSN_DESCONTO_PLANO.AsInteger := cdsDescontosSN_DESCONTO_PLANO.AsInteger;
      cdsDescontosDivididos.Post;

      cdsDescontos.Next;
   end;

end;

function TFMatricularDivisaoTitulos.GetNrIdxProxParcela(): Integer;
begin

   {
      Retorna o número de indice da próxima parcela
      Esse nrIdxProxParcela é um número que será utilizado para linkar a parcela gerada no clientDataSet cdsParcelas
      com todos os descontos aplicados a essa parcela (que gerarão fin_mov_cr) que estão no clientDataSet cdsDescontos
      A variável após retornada é incrementada para que no próximo retorno já esteja com o valor atualizado
   }

   Result := nrIdxProxParcela;
   nrIdxProxParcela := nrIdxProxParcela + 1;
end;

end.
